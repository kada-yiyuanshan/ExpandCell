//
//  ViewController.h
//  Cell
//
//  Created by near_shan on 13-6-7.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource ,UITableViewDataSource>
{
   
}
@property(retain,nonatomic) IBOutlet UITableView *tableview;
@property(retain,nonatomic) NSMutableIndexSet *expandedSections;
@end