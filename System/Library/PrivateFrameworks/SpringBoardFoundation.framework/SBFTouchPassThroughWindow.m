@interface SBFTouchPassThroughWindow
+ (Class)touchPassThroughRootViewControllerClass;
- (SBFTouchPassThroughWindow)initWithFrame:(CGRect)a3;
- (SBFTouchPassThroughWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5;
- (id)description;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBFTouchPassThroughWindow

- (SBFTouchPassThroughWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    [v9 screen];
  }
  else {
  v12 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v26.receiver = self;
  v26.super_class = (Class)SBFTouchPassThroughWindow;
  v21 = (SBFTouchPassThroughWindow *)-[SBFTouchPassThroughWindow _initWithFrame:debugName:windowScene:](&v26, sel__initWithFrame_debugName_windowScene_, v11, v9, v14, v16, v18, v20);
  if (v21)
  {
    v22 = (objc_class *)[(id)objc_opt_class() touchPassThroughRootViewControllerClass];
    if ([(objc_class *)v22 isSubclassOfClass:objc_opt_class()])
    {
      if (!v10)
      {
LABEL_8:
        id v23 = objc_alloc_init(v22);
        [(SBFTouchPassThroughWindow *)v21 setRootViewController:v23];

        goto LABEL_9;
      }
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:v21 file:@"SBFTouchPassThroughWindow.m" lineNumber:29 description:@"Requested rootVC class must be a subclass of SBFTouchPassThroughViewController"];

      if (!v10) {
        goto LABEL_8;
      }
    }
    [(SBFTouchPassThroughWindow *)v21 _setRoleHint:v10];
    goto LABEL_8;
  }
LABEL_9:

  return v21;
}

+ (Class)touchPassThroughRootViewControllerClass
{
  return (Class)objc_opt_class();
}

- (SBFTouchPassThroughWindow)initWithFrame:(CGRect)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%s is not a valid initializer. You must call -[%@ initWithWindowScene:role:debugName:].", "-[SBFTouchPassThroughWindow initWithFrame:]", v7 format];

  return [(SBFTouchPassThroughWindow *)self initWithWindowScene:0 role:0 debugName:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBFTouchPassThroughWindow *)self _debugName];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  id v6 = (id)[v3 appendSuper];
  v7 = [v3 build];

  return v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBFTouchPassThroughWindow;
  -[SBFTouchPassThroughWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (SBFTouchPassThroughWindow *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

@end