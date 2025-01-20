@interface SUPurchaseAnimationDelegate
- (SUPurchaseAnimationDelegate)initWithView:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
@end

@implementation SUPurchaseAnimationDelegate

- (SUPurchaseAnimationDelegate)initWithView:(id)a3
{
  v4 = [(SUPurchaseAnimationDelegate *)self init];
  if (v4) {
    v4->_view = (UIView *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_view = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseAnimationDelegate;
  [(SUPurchaseAnimationDelegate *)&v3 dealloc];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3, a4), "endIgnoringInteractionEvents");
  [(UIView *)self->_view removeFromSuperview];

  self->_view = 0;
  v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"SUPurchaseAnimationDidEndNotification" object:self];
}

@end