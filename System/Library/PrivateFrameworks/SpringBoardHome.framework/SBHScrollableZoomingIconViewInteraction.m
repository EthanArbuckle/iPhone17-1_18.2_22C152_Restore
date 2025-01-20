@interface SBHScrollableZoomingIconViewInteraction
- (BOOL)considersFolderIconTargets;
- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3;
- (double)_clippingFudgeInset;
- (void)handleTargetIconViewClipped:(id)a3;
- (void)setConsidersFolderIconTargets:(BOOL)a3;
@end

@implementation SBHScrollableZoomingIconViewInteraction

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 effectiveIconImageAlpha], v6 == 0.0))
  {
    BOOL v7 = 1;
  }
  else if ([(SBHScrollableZoomingIconViewInteraction *)self considersFolderIconTargets])
  {
    v8 = [v5 _iconImageView];
    objc_opt_class();
    BOOL v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
    {
      [v8 iconGridImageAlpha];
      BOOL v7 = v9 == 0.0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)_clippingFudgeInset
{
  return 10.0;
}

- (void)handleTargetIconViewClipped:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBHScrollableZoomingIconViewInteraction;
  id v4 = a3;
  [(SBHScrollableIconViewInteraction *)&v7 handleTargetIconViewClipped:v4];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"SBHHiddenIconViewUserInfoKey";
  v9[0] = v4;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 postNotificationName:@"SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification" object:self userInfo:v6];
}

- (BOOL)considersFolderIconTargets
{
  return self->_considersFolderIconTargets;
}

- (void)setConsidersFolderIconTargets:(BOOL)a3
{
  self->_considersFolderIconTargets = a3;
}

@end