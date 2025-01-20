@interface AlphanumericPINTextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
@end

@implementation AlphanumericPINTextField

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AlphanumericPINTextField;
  BOOL result = [(AlphanumericPINTextField *)&v6 canPerformAction:a3 withSender:a4];
  if (sel_paste_ == a3) {
    return 0;
  }
  return result;
}

@end