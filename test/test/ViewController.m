#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //给加减乘除按钮添加单击事件响应函数 calc
    [self.add addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.sub addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.mul addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.div addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) calc: (UIButton *)btn
{
    NSString *strInput1    = self.input1.text; //获取输入
    NSString *strInput2    = self.input2.text;
    NSString *checkDotTemp = nil;
         int dotCount      = 0;                //统计输入的小数点数目
       float fResult       = 0;
    NSString *operator;                        //显示运算符
    
    //输入的数字开头不能是@"." , 也不能输入空值
    if ( [strInput1 hasPrefix: @"."] || [strInput1 length] == 0 ||
         [strInput2 hasPrefix: @"."] || [strInput2 length] == 0  )
    {
        self.result.text = @"有空值或开头是小数点,请更正";
        return;
    }
    
    //左边输入框不能含两个及以上的小数点
    for (int i = 0; i < [strInput1 length]; i ++)
    {
        checkDotTemp = [strInput1 substringWithRange: NSMakeRange(i, 1)];
        
        if ( [checkDotTemp isEqualToString: @"."])
            dotCount ++;
    }
    
    if (dotCount > 1)
    {
        self.result.text = @"左边数字错误,请重输";
        return;
    }
    
    //右边输入框不能含两个及以上的小数点
    for (int i = 0; i < [strInput2 length]; i ++)
    {
        checkDotTemp = [strInput2 substringWithRange: NSMakeRange(i, 1)];
        
        if ( [checkDotTemp isEqualToString: @"."])
            dotCount ++;
    }
    
    if (dotCount > 1)
    {
        self.result.text = @"右边数字错误,请重输";
        return;
    }
    
    //判断点击的是哪个运算符,进行运算,并输出结果
    switch (btn.tag)
    {
        case 10:
            fResult   = [strInput1 floatValue] + [strInput2 floatValue] ;
            operator  = @"+";
            break;
        case 20:
            fResult   = [strInput1 floatValue] - [strInput2 floatValue] ;
            operator  = @"-";
            break;
        case 30:
            fResult   = [strInput1 floatValue] * [strInput2 floatValue] ;
            operator  = @"x";
            break;
        case 40:
            if ([strInput2 floatValue] == 0.00)
            {
                self.result.text = @"除数不能是0,请重新输入";
                return;
            }else
            {
                fResult   = [strInput1 floatValue] / [strInput2 floatValue];
                operator  = @"÷";
            }
            break;
    }
    self.result.text = [strInput1 stringByAppendingFormat: @" %@ %@ = %.02f", operator, strInput2, fResult];
}
@end
