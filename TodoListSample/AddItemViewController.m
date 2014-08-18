//
//  AddItemViewController.m
//  TodoListSample
//
//  Created by hiraya.shingo on 2014/08/18.
//  Copyright (c) 2014年 hiraya.shingo. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

// UITextFieldプロパティを２つに増やした
@property (weak, nonatomic) IBOutlet UITextField *upperTextField;
@property (weak, nonatomic) IBOutlet UITextField *lowerTextField;

@end

@implementation AddItemViewController

- (IBAction)clickedSaveButton:(id)sender
{
    NSLog(@"clickedSaveButton");
    
    // 保存時に呼び出すメソッドの引数の数を変更したので、(AddItemViewController.hファイル参照) ここも変更
    // UITextFieldに入力された２つの文字列を渡す
    [self.delegate addItemViewControllerDidFinish:self upperItem:self.upperTextField.text lowerItem:self.lowerTextField.text];
}

- (IBAction)clickedCancelButton:(id)sender
{
    NSLog(@"clickedCancelButton");
    [self.delegate addItemViewControllerDidCancel:self];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
