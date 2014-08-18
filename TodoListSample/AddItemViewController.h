//
//  AddItemViewController.h
//  TodoListSample
//
//  Created by hiraya.shingo on 2014/08/18.
//  Copyright (c) 2014年 hiraya.shingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate;

@interface AddItemViewController : UITableViewController

@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;

@end

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;

// 引数を３つに変更
- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller
                             upperItem:(NSString *)upperItem
                             lowerItem:(NSString *)lowerItem;
// - (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item;

@end
