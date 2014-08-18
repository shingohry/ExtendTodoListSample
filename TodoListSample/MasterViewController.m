//
//  MasterViewController.m
//  TodoListSample
//
//  Created by hiraya.shingo on 2014/08/18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "MasterViewController.h"
#import "AddItemViewController.h"

@interface MasterViewController () <AddItemViewControllerDelegate>
{
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller upperItem:(NSString *)upperItem lowerItem:(NSString *)lowerItem
{
    NSLog(@"addItemViewControllerDidFinish 項目1:%@",upperItem);
    NSLog(@"addItemViewControllerDidFinish 項目2:%@",lowerItem);
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    // 入力画面で入力された文字列２つを
    // NSDictionaryに格納
    NSDictionary *itemDictionary = @{
                                 @"upperItem": upperItem,
                                 @"lowerItem": lowerItem,
                                 };
    
    // NSDictionaryを_objects配列に格納
    [_objects insertObject:itemDictionary atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    // _objects配列に格納しておいたNSDictionaryを取り出す
    NSDictionary *itemDictionary = _objects[indexPath.row];
    
    // NSDictionaryに格納しておいた文字列を取り出す
    NSString *upperItem = itemDictionary[@"upperItem"];
    NSString *lowerItem = itemDictionary[@"lowerItem"];
    
    // 取り出した文字列をラベルにセットする
    cell.textLabel.text = upperItem;
    cell.detailTextLabel.text = lowerItem;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAddItemView"]) {
        AddItemViewController *addItemViewController = (AddItemViewController *)[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        addItemViewController.delegate = self;
    }
}

@end
