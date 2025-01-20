@interface _SAUIPortalView
+ (Class)layerClass;
- (UIView)sourceView;
- (id)portalLayer;
- (void)_configurePortalViewIfNeeded;
- (void)didMoveToWindow;
- (void)setSourceView:(id)a3;
@end

@implementation _SAUIPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)portalLayer
{
  v2 = [(_SAUIPortalView *)self layer];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setSourceView:(id)a3
{
  v5 = (UIView *)a3;
  p_sourceView = &self->_sourceView;
  if (self->_sourceView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_sourceView, a3);
    p_sourceView = (UIView **)[(_SAUIPortalView *)self _configurePortalViewIfNeeded];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_sourceView, v5);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_SAUIPortalView;
  [(_SAUIPortalView *)&v3 didMoveToWindow];
  [(_SAUIPortalView *)self _configurePortalViewIfNeeded];
}

- (void)_configurePortalViewIfNeeded
{
  objc_super v3 = [(UIView *)self->_sourceView layer];
  objc_initWeak(&location, v3);
  id v4 = [(_SAUIPortalView *)self portalLayer];
  v5 = [v4 sourceLayer];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = [(_SAUIPortalView *)self portalLayer];
    v7 = CALayerGetContext();

    if (v7)
    {
      if ([MEMORY[0x263F158F8] currentState]
        && [MEMORY[0x263F158F8] currentPhase] != 2)
      {
        objc_initWeak(&from, self);
        v9 = (void *)MEMORY[0x263F158F8];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __47___SAUIPortalView__configurePortalViewIfNeeded__block_invoke;
        v10[3] = &unk_26552BE48;
        objc_copyWeak(&v11, &from);
        objc_copyWeak(&v12, &location);
        [v9 addCommitHandler:v10 forPhase:2];
        objc_destroyWeak(&v12);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&from);
      }
      else
      {
        v8 = [(_SAUIPortalView *)self portalLayer];
        [v8 setSourceLayer:v3];
      }
    }
  }
  objc_destroyWeak(&location);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void).cxx_destruct
{
}

@end