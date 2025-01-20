@interface SBHVisualStylingView
+ (id)visualStyleSetNameForUserInterfaceStyle:(int64_t)a3;
- (SBHVisualStylingView)initWithFrame:(CGRect)a3;
- (void)_updateVisualStyling;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
@end

@implementation SBHVisualStylingView

+ (id)visualStyleSetNameForUserInterfaceStyle:(int64_t)a3
{
  return 0;
}

- (SBHVisualStylingView)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBHVisualStylingView;
  v3 = -[SBHVisualStylingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = self;
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(SBHVisualStylingView *)v3 registerForTraitChanges:v5 withAction:sel__updateVisualStyling];
  }
  return v3;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)SBHVisualStylingView;
  [(SBHVisualStylingView *)&v4 didMoveToSuperview];
  v3 = [(SBHVisualStylingView *)self superview];

  if (v3) {
    [(SBHVisualStylingView *)self _updateVisualStyling];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SBHVisualStylingView;
  [(SBHVisualStylingView *)&v3 didMoveToWindow];
  if ([(SBHVisualStylingView *)self _isInAWindow]) {
    [(SBHVisualStylingView *)self _updateVisualStyling];
  }
}

- (void)_updateVisualStyling
{
  objc_super v3 = [(SBHVisualStylingView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v11 = [(id)objc_opt_class() visualStyleSetNameForUserInterfaceStyle:v4];
  v5 = (void *)MEMORY[0x1E4F743E8];
  id v6 = SBHBundle();
  v7 = [v5 _visualStylingProviderForStyleSetNamed:v11 inBundle:v6];

  [(SBHVisualStylingView *)self alpha];
  double v9 = v8;
  v10 = [v7 _visualStylingForStyle:1];
  [(SBHVisualStylingView *)self mt_replaceVisualStyling:v10];

  [(SBHVisualStylingView *)self setAlpha:v9];
}

@end