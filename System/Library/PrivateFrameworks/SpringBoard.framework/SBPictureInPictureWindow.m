@interface SBPictureInPictureWindow
- (BOOL)_allowsOcclusionDetectionOverride;
- (SBPictureInPictureWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setRootViewController:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBPictureInPictureWindow

- (SBPictureInPictureWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPictureInPictureWindow;
  v3 = [(SBPictureInPictureWindow *)&v7 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(SBPictureInPictureWindow *)v3 layer];
    [v5 setDisableUpdateMask:32];
  }
  return v4;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (void)setWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPictureInPictureWindow;
  [(SBPictureInPictureWindow *)&v5 setWindowScene:a3];
  v4 = [(SBPictureInPictureWindow *)self rootViewController];
  [v4 noteWindowSceneDidChange];
}

- (void)setRootViewController:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBPictureInPictureWindow;
  [(SBPictureInPictureWindow *)&v7 setRootViewController:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBPictureInPictureWindow;
  -[SBPictureInPictureWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (SBPictureInPictureWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || ([(SBPictureInPictureWindow *)self rootViewController],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 view],
        objc_super v7 = (SBPictureInPictureWindow *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {

    id v5 = 0;
  }
  return v5;
}

@end