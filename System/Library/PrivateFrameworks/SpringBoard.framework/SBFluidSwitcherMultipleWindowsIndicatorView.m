@interface SBFluidSwitcherMultipleWindowsIndicatorView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_hitTestBounds;
- (SBFluidSwitcherMultipleWindowsIndicatorView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation SBFluidSwitcherMultipleWindowsIndicatorView

- (SBFluidSwitcherMultipleWindowsIndicatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherMultipleWindowsIndicatorView;
  v3 = -[SBFluidSwitcherMultipleWindowsIndicatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:14.0];
    v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.fill.on.square.fill" withConfiguration:v4];
    [(SBFluidSwitcherMultipleWindowsIndicatorView *)v3 setAccessibilityTraits:*MEMORY[0x1E4F434F0]];
    [(SBFluidSwitcherMultipleWindowsIndicatorView *)v3 setImage:v5];
    [(SBFluidSwitcherMultipleWindowsIndicatorView *)v3 setUserInteractionEnabled:1];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v3];
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v6;

    [(SBFluidSwitcherMultipleWindowsIndicatorView *)v3 addInteraction:v3->_pointerInteraction];
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherMultipleWindowsIndicatorView;
  if (-[SBFluidSwitcherMultipleWindowsIndicatorView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4)) {
    return 1;
  }
  [(SBFluidSwitcherMultipleWindowsIndicatorView *)self _hitTestBounds];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  return CGRectContainsPoint(v10, v9);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F42CB0];
  id v7 = a5;
  [(SBFluidSwitcherMultipleWindowsIndicatorView *)self _hitTestBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 identifier];

  v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v5];
  id v7 = [MEMORY[0x1E4F42C90] effectWithPreview:v6];
  double v8 = (void *)MEMORY[0x1E4F42CB8];
  [(SBFluidSwitcherMultipleWindowsIndicatorView *)self frame];
  UIRectCenteredRect();
  double v9 = objc_msgSend(v8, "shapeWithRoundedRect:cornerRadius:");
  double v10 = [MEMORY[0x1E4F42CC0] styleWithEffect:v7 shape:v9];

  return v10;
}

- (CGRect)_hitTestBounds
{
  [(SBFluidSwitcherMultipleWindowsIndicatorView *)self bounds];
  UIRectInset();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end