//
//  ViewController.m
//  GridView Example
//
//  Created by Sher Ail on 19/02/18.
//  Copyright © 2018 Sher Ail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView*gridView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    /* --------- Coded by Sher Ali ---------- */
//    remove the view if already created to reflect the changes in view
    if (gridView) {
        [gridView removeFromSuperview];
        gridView = nil;
    }
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    gridView = [[UIView alloc]initWithFrame:rect];
    CGFloat width = gridView.frame.size.width;
    CGFloat heigth = gridView.frame.size.height;
    CGFloat cellheadWidth = width/3;//Header Cell width
    CGFloat cellWidth = (width-cellheadWidth)/4;// cell width
    CGFloat cellHeight = heigth/10;// cell height
    for (int i = 0; i< 5; i++) {
        CGFloat cellIncr = 0; // increament to maintain the length
        for (int j = 0; j < 5; j++) {
            UIButton* cell = [[UIButton alloc]initWithFrame:CGRectMake(cellIncr, 200+i*cellHeight, j==0?cellheadWidth-1:cellWidth-1, cellHeight-1)];
            [cell addTarget:self action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
            [cell setTitle:[NSString stringWithFormat:@"(%d,%d)",j,i] forState:UIControlStateNormal];
            [cell setTag:[[NSString stringWithFormat:@"1%d%d",j,i]intValue]];
            [cell setBackgroundColor:(i==0||j==0)?[UIColor darkGrayColor]:[self randomColor]];
            [gridView addSubview:cell];
            cellIncr += j==0?cellheadWidth:cellWidth;
        }
    }
    
    [self.view addSubview:gridView];
}

-(void)selectedItem:(id)sender{
    NSLog(@"sender %ld",[sender tag]);
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Selected"
                                 message:[NSString stringWithFormat:@"you have selected %ld",[sender tag]]
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

-(UIColor*)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.5];
    return color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
