@interface UIAutoRotatingWindow
- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didRemoveSubview:(id)a3;
- (void)commonInit;
- (void)updateForOrientation:(int64_t)a3;
@end

@implementation UIAutoRotatingWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIAutoRotatingWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIAutoRotatingWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)updateForOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3 || self->_unknownOrientation)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAutoRotatingWindow;
    [(UIWindow *)&v5 setupForOrientation:a3];
    self->_interfaceOrientation = a3;
    self->_unknownOrientation = [(UIWindow *)self inhibitTextEffectsRotation];
  }
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)UIAutoRotatingWindow;
  id v5 = -[UIApplicationRotationFollowingWindow _initWithFrame:debugName:windowScene:](&v7, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 commonInit];
  return v5;
}

- (void)commonInit
{
  self->_interfaceOrientation = 1;
  self->_unknownOrientation = 1;
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_matchDeviceOrientation_ name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];

  if ([(UIWindow *)self _isHostedInAnotherProcess])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_matchDeviceOrientation_ name:@"_UIWindowWillBecomeApplicationKeyNotification" object:0];
  }
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIAutoRotatingWindow;
  id v4 = -[UIApplicationRotationFollowingWindow _initWithFrame:attached:](&v6, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 commonInit];
  return v4;
}

- (void)_didRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIAutoRotatingWindow;
  [(UIView *)&v6 _didRemoveSubview:a3];
  if (![(UIWindow *)self _isTextEffectsWindow])
  {
    id v4 = [(UIView *)self subviews];
    uint64_t v5 = [v4 count];

    if (!v5) {
      [(UIWindow *)self setHidden:1];
    }
  }
}

@end