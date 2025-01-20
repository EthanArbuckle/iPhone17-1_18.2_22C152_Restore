@interface SBHScrollableConfiguringIconViewInteraction
- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3;
- (void)handleTargetIconViewClipped:(id)a3;
@end

@implementation SBHScrollableConfiguringIconViewInteraction

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  return [a3 isShowingConfigurationCard];
}

- (void)handleTargetIconViewClipped:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHScrollableConfiguringIconViewInteraction;
  id v3 = a3;
  [(SBHScrollableIconViewInteraction *)&v4 handleTargetIconViewClipped:v3];
  objc_msgSend(v3, "dismissConfigurationCardImmediately", v4.receiver, v4.super_class);
}

@end