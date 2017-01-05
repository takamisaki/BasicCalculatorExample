

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *input1;   //第一个输入框
@property (weak, nonatomic) IBOutlet UITextField *input2;   //第二个输入框
@property (weak, nonatomic) IBOutlet UIButton    *add;      //加法按钮
@property (weak, nonatomic) IBOutlet UIButton    *sub;      //减法按钮
@property (weak, nonatomic) IBOutlet UIButton    *mul;      //乘法按钮
@property (weak, nonatomic) IBOutlet UIButton    *div;      //除法按钮
@property (weak, nonatomic) IBOutlet UILabel     *result;   //显示结果的标签

@end

