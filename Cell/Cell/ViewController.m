//
//  ViewController.m
//  Cell
//
//  Created by near_shan on 13-6-7.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableview,expandedSections;

-(void)dealloc
{
    [tableview release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!expandedSections) {
        expandedSections=[[NSMutableIndexSet alloc] init];
    }
}
#pragma mark -
#pragma mark Table Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableview canCollapseSection:section])
    {
    if ([expandedSections containsIndex:section])
    {
        
        return 2; // return rows when expanded
    }
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *TableSampleIdentifier=@"TableSampleIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if(cell==nil)
    {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:TableSampleIdentifier] autorelease];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger )section
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableview canCollapseSection:indexPath.section])
    {
    if (!indexPath.row)
    {
        [tableview deselectRowAtIndexPath:indexPath animated:YES];
        NSInteger section = indexPath.section;
        BOOL currentlyExpanded = [expandedSections containsIndex:section];
        NSInteger rows;
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        if (currentlyExpanded)
        {
            rows = [self tableView:self.tableview numberOfRowsInSection:section];
            [expandedSections removeIndex:section];
        }
        else
        {
            [expandedSections addIndex:section];
            rows = [self tableView:self.tableview numberOfRowsInSection:section];
        }
                                                                                                                                                                                                                                                                                                                                                                     
        for (int i=1; i<rows; i++)
        {
            NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
            [tmpArray addObject:tmpIndexPath];
        }
        if (currentlyExpanded)
        {
            [self.tableview deleteRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
        }
        else
        {
            [self.tableview insertRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
            
        }
    }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger e=[indexPath section];
    if (e==0 ) {
        if ([indexPath row]==0) {
            return 40;
        }else if([indexPath row]==1){
        return 90;
        }
    }
    return 40;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
