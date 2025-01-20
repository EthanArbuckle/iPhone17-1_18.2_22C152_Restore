@interface UIStatusBarNewUIActionableStyleAttributes
- (BOOL)shouldProduceReturnEvent;
- (UIStatusBarNewUIActionableStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6;
@end

@implementation UIStatusBarNewUIActionableStyleAttributes

- (UIStatusBarNewUIActionableStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStatusBarNewUIActionableStyleAttributes;
  v11 = [(UIStatusBarNewUIStyleAttributes *)&v14 initWithRequest:v10 backgroundColor:a4 foregroundColor:a5 hasBusyBackground:v6];
  if (v11)
  {
    BOOL v12 = [v10 style] != 214 && objc_msgSend(v10, "style") != 111;
    [(UIStatusBarStyleAttributes *)v11 setPulsingAnimationEnabled:v12];
  }

  return v11;
}

- (BOOL)shouldProduceReturnEvent
{
  return 1;
}

@end