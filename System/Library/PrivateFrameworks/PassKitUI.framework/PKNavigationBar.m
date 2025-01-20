@interface PKNavigationBar
- (void)didAddSubview:(id)a3;
@end

@implementation PKNavigationBar

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKNavigationBar;
  id v3 = a3;
  [(PKNavigationBar *)&v4 didAddSubview:v3];
  objc_msgSend(v3, "setExclusiveTouch:", 1, v4.receiver, v4.super_class);
}

@end