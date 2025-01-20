@interface SBTopAffordanceDotsView
- (BOOL)isHighlighted;
- (BOOL)isPointerInteractionEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (SBTopAffordanceDotsView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (SBTopAffordanceDotsViewDelegate)delegate;
- (UIEdgeInsets)hitTestEdgeInsets;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_dotViews;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_updateBackgroundColor;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
@end

@implementation SBTopAffordanceDotsView

- (SBTopAffordanceDotsView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v66[12] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v65.receiver = self;
  v65.super_class = (Class)SBTopAffordanceDotsView;
  v10 = -[SBTopAffordanceDotsView initWithFrame:](&v65, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(SBTopAffordanceDotsView *)v10 setAccessibilityTraits:*MEMORY[0x1E4F434F0]];
    [(SBTopAffordanceDotsView *)v11 setIsAccessibilityElement:1];
    [(SBTopAffordanceDotsView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBTopAffordanceDotsView *)v11 setUserInteractionEnabled:1];
    v12 = [(SBTopAffordanceDotsView *)v11 layer];
    [v12 setCornerRadius:7.0];

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    hitTestBlocker = v11->_hitTestBlocker;
    v11->_hitTestBlocker = v13;

    v15 = v11->_hitTestBlocker;
    [MEMORY[0x1E4F428B8] clearColor];
    v16 = v64 = v9;
    [(UIView *)v15 setBackgroundColor:v16];

    v17 = [(UIView *)v11->_hitTestBlocker layer];
    [v17 setHitTestsAsOpaque:1];

    v18 = [(UIView *)v11->_hitTestBlocker layer];
    [v18 setAllowsHitTesting:1];

    [(UIView *)v11->_hitTestBlocker setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = objc_alloc_init(SBTopAffordanceDotView);
    leadingDotView = v11->_leadingDotView;
    v11->_leadingDotView = v19;

    v21 = objc_alloc_init(SBTopAffordanceDotView);
    centerDotView = v11->_centerDotView;
    v11->_centerDotView = v21;

    v23 = objc_alloc_init(SBTopAffordanceDotView);
    trailingDotView = v11->_trailingDotView;
    v11->_trailingDotView = v23;

    [(SBTopAffordanceDotsView *)v11 addSubview:v11->_hitTestBlocker];
    [(SBTopAffordanceDotsView *)v11 addSubview:v11->_leadingDotView];
    [(SBTopAffordanceDotsView *)v11 addSubview:v11->_centerDotView];
    [(SBTopAffordanceDotsView *)v11 addSubview:v11->_trailingDotView];
    v25 = [(UIView *)v11->_hitTestBlocker widthAnchor];
    uint64_t v26 = [v25 constraintEqualToConstant:0.0];
    hitTestBlockerWidthConstraint = v11->_hitTestBlockerWidthConstraint;
    v11->_hitTestBlockerWidthConstraint = (NSLayoutConstraint *)v26;

    v28 = [(UIView *)v11->_hitTestBlocker heightAnchor];
    uint64_t v29 = [v28 constraintEqualToConstant:0.0];
    hitTestBlockerHeightConstraint = v11->_hitTestBlockerHeightConstraint;
    v11->_hitTestBlockerHeightConstraint = (NSLayoutConstraint *)v29;

    v31 = [(UIView *)v11->_hitTestBlocker leftAnchor];
    v32 = [(SBTopAffordanceDotsView *)v11 leftAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32 constant:0.0];
    hitTestBlockerLeftConstraint = v11->_hitTestBlockerLeftConstraint;
    v11->_hitTestBlockerLeftConstraint = (NSLayoutConstraint *)v33;

    v63 = [(SBTopAffordanceDotsView *)v11 widthAnchor];
    v62 = [v63 constraintEqualToConstant:32.0];
    v66[0] = v62;
    v61 = [(SBTopAffordanceDotsView *)v11 heightAnchor];
    v60 = [v61 constraintEqualToConstant:14.0];
    v66[1] = v60;
    v59 = [(SBTopAffordanceDotView *)v11->_leadingDotView trailingAnchor];
    v58 = [(SBTopAffordanceDotView *)v11->_centerDotView leadingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:-3.0];
    v66[2] = v57;
    v56 = [(SBTopAffordanceDotView *)v11->_trailingDotView leadingAnchor];
    v55 = [(SBTopAffordanceDotView *)v11->_centerDotView trailingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55 constant:3.0];
    v66[3] = v54;
    v53 = [(SBTopAffordanceDotView *)v11->_leadingDotView centerYAnchor];
    v52 = [(SBTopAffordanceDotView *)v11->_centerDotView centerYAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v66[4] = v51;
    v50 = [(SBTopAffordanceDotView *)v11->_centerDotView centerXAnchor];
    v49 = [(SBTopAffordanceDotsView *)v11 centerXAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v66[5] = v48;
    v47 = [(SBTopAffordanceDotView *)v11->_centerDotView centerYAnchor];
    v35 = [(SBTopAffordanceDotsView *)v11 centerYAnchor];
    v36 = [v47 constraintEqualToAnchor:v35];
    v66[6] = v36;
    v37 = [(SBTopAffordanceDotView *)v11->_trailingDotView centerYAnchor];
    v38 = [(SBTopAffordanceDotView *)v11->_centerDotView centerYAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v66[7] = v39;
    v40 = [(UIView *)v11->_hitTestBlocker topAnchor];
    v41 = [(SBTopAffordanceDotsView *)v11 topAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v66[8] = v42;
    v66[9] = v11->_hitTestBlockerWidthConstraint;
    v66[10] = v11->_hitTestBlockerHeightConstraint;
    v66[11] = v11->_hitTestBlockerLeftConstraint;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:12];
    [(SBTopAffordanceDotsView *)v11 addConstraints:v43];

    id v9 = v64;
    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v11];
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = (UIPointerInteraction *)v44;

    [(SBTopAffordanceDotsView *)v11 addInteraction:v11->_pointerInteraction];
    objc_storeWeak((id *)&v11->_delegate, v64);
  }

  return v11;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SBTopAffordanceDotsView *)self _dotViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHighlighted:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SBTopAffordanceDotsView *)self _updateBackgroundColor];
  [(UIPointerInteraction *)self->_pointerInteraction invalidate];
}

- (BOOL)isHighlighted
{
  v2 = [(SBTopAffordanceDotsView *)self _dotViews];
  BOOL v3 = [v2 firstObject];
  char v4 = [v3 isHighlighted];

  return v4;
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
}

- (BOOL)isPointerInteractionEnabled
{
  return [(UIPointerInteraction *)self->_pointerInteraction isEnabled];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBTopAffordanceDotsView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SBTopAffordanceDotsView *)self hitTestEdgeInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F42CB0];
  id v7 = a5;
  [(SBTopAffordanceDotsView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 identifier];

  double v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v5];
  if ([(SBTopAffordanceDotsView *)self isHighlighted])
  {
    id v7 = [MEMORY[0x1E4F42CA8] effectWithPreview:v6];
    double v8 = 0;
  }
  else
  {
    [(SBTopAffordanceDotsView *)self frame];
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    CGFloat v13 = CGRectGetHeight(v17) * 0.5;
    id v7 = [MEMORY[0x1E4F42C90] effectWithPreview:v6];
    double v8 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v13);
  }
  double v14 = [MEMORY[0x1E4F42CC0] styleWithEffect:v7 shape:v8];

  return v14;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
  hitTestBlockerWidthConstraint = self->_hitTestBlockerWidthConstraint;
  [(SBTopAffordanceDotsView *)self hitTestEdgeInsets];
  double v6 = 32.0 - v5;
  [(SBTopAffordanceDotsView *)self hitTestEdgeInsets];
  [(NSLayoutConstraint *)hitTestBlockerWidthConstraint setConstant:v6 - v7];
  hitTestBlockerHeightConstraint = self->_hitTestBlockerHeightConstraint;
  [(SBTopAffordanceDotsView *)self hitTestEdgeInsets];
  [(NSLayoutConstraint *)hitTestBlockerHeightConstraint setConstant:14.0 - v9];
  hitTestBlockerLeftConstraint = self->_hitTestBlockerLeftConstraint;
  [(SBTopAffordanceDotsView *)self hitTestEdgeInsets];
  [(NSLayoutConstraint *)hitTestBlockerLeftConstraint setConstant:v11];
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBTopAffordanceDotsView;
  double v5 = [(SBTopAffordanceDotsView *)&v8 _contextMenuInteraction:a3 styleForMenuWithConfiguration:a4];
  double v6 = [(SBTopAffordanceDotsView *)self superview];
  [v5 setContainerView:v6];

  if (objc_opt_respondsToSelector()) {
    [v5 setPreferredAttachmentEdge:4];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setPrefersStackedHierarchy:1];
  }
  return v5;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  [(SBTopAffordanceDotsView *)self bounds];
  double MidX = CGRectGetMidX(v6);
  double v4 = 3.0;
  result.double y = v4;
  result.double x = MidX;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBTopAffordanceDotsView;
  [(SBTopAffordanceDotsView *)&v7 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained topAffordanceDotsViewWillPresentMenu:self];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBTopAffordanceDotsView;
  [(SBTopAffordanceDotsView *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained topAffordanceDotsViewWillDismissMenu:self];
}

- (void)_updateBackgroundColor
{
  id v8 = [MEMORY[0x1E4F428B8] clearColor];
  if ([(SBTopAffordanceDotsView *)self isHighlighted])
  {
    BOOL v3 = [(SBTopAffordanceDotsView *)self traitCollection];
    if ([v3 userInterfaceStyle] == 2)
    {
      double v4 = 0.16;
      double v5 = 1.0;
    }
    else
    {
      double v4 = 0.1;
      double v5 = 0.0;
    }
    uint64_t v7 = [MEMORY[0x1E4F428B8] colorWithWhite:v5 alpha:v4];

    id v6 = (id)v7;
  }
  else
  {
    id v6 = v8;
  }
  id v9 = v6;
  [(SBTopAffordanceDotsView *)self setBackgroundColor:v6];
}

- (id)_dotViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(SBTopAffordanceDotsView *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SBTopAffordanceDotsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBTopAffordanceDotsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerLeftConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlocker, 0);
  objc_storeStrong((id *)&self->_trailingDotView, 0);
  objc_storeStrong((id *)&self->_centerDotView, 0);
  objc_storeStrong((id *)&self->_leadingDotView, 0);
}

@end