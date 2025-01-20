@interface _UITextFieldImageBackgroundView
- (BOOL)respondsToSelector:(SEL)a3;
@end

@implementation _UITextFieldImageBackgroundView

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_setCornerRadius_ == a3)
  {
    return dyld_program_sdk_at_least();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UITextFieldImageBackgroundView;
    return -[_UITextFieldImageBackgroundView respondsToSelector:](&v4, sel_respondsToSelector_);
  }
}

@end