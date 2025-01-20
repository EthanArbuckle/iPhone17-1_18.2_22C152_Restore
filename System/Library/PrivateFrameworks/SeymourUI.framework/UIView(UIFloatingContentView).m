@interface UIView(UIFloatingContentView)
+ (_SMUFloatingContentView)smu_floatingContentViewWithFrame:()UIFloatingContentView;
@end

@implementation UIView(UIFloatingContentView)

+ (_SMUFloatingContentView)smu_floatingContentViewWithFrame:()UIFloatingContentView
{
  v4 = -[_UIFloatingContentView initWithFrame:]([_SMUFloatingContentView alloc], "initWithFrame:", a1, a2, a3, a4);

  return v4;
}

@end