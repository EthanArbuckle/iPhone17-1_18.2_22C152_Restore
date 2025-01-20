@interface UISwipeActionPullView
- (BOOL)autosizesButtons;
- (BOOL)buttonsUnderlapSwipedView;
- (BOOL)hasActions;
- (BOOL)primaryActionIsDestructive;
- (Class)_buttonClass;
- (NSString)description;
- (UIColor)backgroundPullColor;
- (UIColor)primaryActionColor;
- (UIContextualAction)primarySwipeAction;
- (UIEdgeInsets)contentInsets;
- (UISwipeActionPullView)initWithFrame:(CGRect)a3 cellEdge:(unint64_t)a4 style:(unint64_t)a5;
- (UISwipeActionPullViewDelegate)delegate;
- (UISwipeActionVisualStyle)visualStyle;
- (double)_directionalMultiplier;
- (double)_interButtonPadding;
- (double)_paddingToSwipedView;
- (double)_roundedStyleCornerRadius;
- (double)_totalInterButtonPadding;
- (double)confirmationThreshold;
- (double)currentOffset;
- (double)openThreshold;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)sourceViewForAction:(id)a3;
- (unint64_t)_swipeActionCount;
- (unint64_t)cellEdge;
- (unint64_t)state;
- (void)_layoutClippingLayer;
- (void)_performAction:(id)a3 offset:(double)a4 extraOffset:(double)a5;
- (void)_pressedButton:(id)a3;
- (void)_rebuildButtons;
- (void)_setLayerBounds:(CGRect)a3;
- (void)_setRoundedStyleCornerRadius:(double)a3;
- (void)_setWidth:(double)a3;
- (void)_setupClippingViewIfNeeded;
- (void)_tappedButton:(id)a3;
- (void)_unpressedButton:(id)a3;
- (void)configureWithSwipeActions:(id)a3;
- (void)freeze;
- (void)layoutSubviews;
- (void)moveToOffset:(double)a3 extraOffset:(double)a4 animator:(id)a5 usingSpringWithStiffness:(double)a6 initialVelocity:(double)a7;
- (void)resetView;
- (void)setAutosizesButtons:(BOOL)a3;
- (void)setBackgroundPullColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonsUnderlapSwipedView:(BOOL)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setState:(unint64_t)a3;
- (void)setVisualStyle:(id)a3;
- (void)swipeActionButton:(id)a3 willDisplayContextMenuWithAnimator:(id)a4;
@end

@implementation UISwipeActionPullView

- (UISwipeActionPullView)initWithFrame:(CGRect)a3 cellEdge:(unint64_t)a4 style:(unint64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)UISwipeActionPullView;
  v7 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_cellEdge = a4;
    v7->_style = a5;
    v9 = [(UIView *)v7 traitCollection];
    v10 = +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", [v9 userInterfaceIdiom]);
    [(UISwipeActionPullView *)v8 setVisualStyle:v10];

    v11 = [(UIView *)v8 layer];
    [v11 anchorPoint];
    double v13 = v12;

    if (v8->_cellEdge == 2) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 1;
    }
    if (v8->_cellEdge == 2) {
      double v15 = 0.0;
    }
    else {
      double v15 = 1.0;
    }
    v16 = [(UIView *)v8 layer];
    objc_msgSend(v16, "setAnchorPoint:", v15, v13);

    [(UIView *)v8 setAutoresizingMask:v14];
    [(UIView *)v8 _setOverrideUserInterfaceRenderingMode:1];
  }
  return v8;
}

- (UIContextualAction)primarySwipeAction
{
  v3 = [(UISwipeActionPullView *)self _swipeActionCount];
  if (v3)
  {
    v3 = [(NSArray *)self->_actions objectAtIndexedSubscript:v3 - 1];
  }
  return (UIContextualAction *)v3;
}

- (BOOL)primaryActionIsDestructive
{
  v2 = [(UISwipeActionPullView *)self primarySwipeAction];
  char v3 = [v2 isDestructive];

  return v3;
}

- (BOOL)hasActions
{
  return [(UISwipeActionPullView *)self _swipeActionCount] != 0;
}

- (UIColor)primaryActionColor
{
  v2 = [(UISwipeActionPullView *)self primarySwipeAction];
  char v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setButtonsUnderlapSwipedView:(BOOL)a3
{
  self->_buttonsUnderlapSwipedView = a3;
  if (a3)
  {
    v4 = [(UISwipeActionPullView *)self visualStyle];
    [v4 defaultButtonWidth];
    self->_minimumOffset = v5;
  }
  else
  {
    self->_minimumOffset = 0.0;
  }
  -[UIView setClipsToBounds:](self, "setClipsToBounds:");
}

- (double)openThreshold
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(UIView *)self layoutIfNeeded];
  double result = self->_openThreshold;
  if (result == 0.0)
  {
    if ([(UISwipeActionPullView *)self hasActions])
    {
      [(UISwipeActionPullView *)self contentInsets];
      double v5 = v4;
      [(UISwipeActionPullView *)self contentInsets];
      double v7 = v5 + v6;
      [(UISwipeActionPullView *)self _paddingToSwipedView];
      double v9 = v8 + v7;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = self->_buttons;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "buttonWidth", (void)v19);
            double v9 = v9 + v15;
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      [(UISwipeActionPullView *)self _totalInterButtonPadding];
      double v17 = v9 + v16;
      [(UISwipeActionPullView *)self _directionalMultiplier];
      double result = v17 * v18;
      self->_openThreshold = result;
    }
    else
    {
      return self->_openThreshold;
    }
  }
  return result;
}

- (double)confirmationThreshold
{
  if (self->_confirmationThreshold == 0.0 && [(UISwipeActionPullView *)self hasActions])
  {
    [(UISwipeActionPullView *)self _directionalMultiplier];
    double v4 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained confirmationDistanceForPrimaryActionInSwipeActionPullView:self];
    UIRoundToViewScale(0);
    self->_double confirmationThreshold = v4 * v6;
  }
  double v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6) {
    return self->_confirmationThreshold;
  }
  [(UISwipeActionPullView *)self _directionalMultiplier];
  double confirmationThreshold = self->_confirmationThreshold;
  if (confirmationThreshold < 0.0) {
    double confirmationThreshold = -confirmationThreshold;
  }
  double openThreshold = self->_openThreshold;
  if (openThreshold < 0.0) {
    double openThreshold = -openThreshold;
  }
  double v12 = openThreshold + 24.0;
  if (confirmationThreshold < v12) {
    double confirmationThreshold = v12;
  }
  return v9 * confirmationThreshold;
}

- (double)_directionalMultiplier
{
  unint64_t v2 = [(UISwipeActionPullView *)self cellEdge];
  double result = 1.0;
  if (v2 == 8) {
    return -1.0;
  }
  return result;
}

- (unint64_t)_swipeActionCount
{
  return [(NSArray *)self->_actions count];
}

- (Class)_buttonClass
{
  if (self->_style > 2) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (double)_paddingToSwipedView
{
  double v3 = [(UISwipeActionPullView *)self visualStyle];
  [v3 paddingToSwipeViewForStyle:self->_style];
  double v5 = v4;

  return v5;
}

- (double)_interButtonPadding
{
  double v3 = [(UISwipeActionPullView *)self visualStyle];
  [v3 interButtonPaddingForStyle:self->_style];
  double v5 = v4;

  return v5;
}

- (double)_totalInterButtonPadding
{
  uint64_t v3 = [(NSMutableArray *)self->_buttons count];
  double result = 0.0;
  if (v3 >= 2)
  {
    uint64_t v5 = v3;
    [(UISwipeActionPullView *)self _interButtonPadding];
    return v6 * (double)(v5 - 1);
  }
  return result;
}

- (void)_setupClippingViewIfNeeded
{
  unint64_t style = self->_style;
  clippingView = self->_clippingView;
  if (style == 2)
  {
    if (clippingView) {
      return;
    }
    uint64_t v5 = [UIView alloc];
    [(UIView *)self bounds];
    double v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    double v7 = self->_clippingView;
    self->_clippingView = v6;

    v10 = [(UIView *)self->_clippingView layer];
    [(UIView *)v10 setMasksToBounds:1];
    [(UIView *)v10 setMaskedCorners:15];
    [(UIView *)v10 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    if (self->_roundedStyleCornerRadius > 0.0)
    {
      -[UIView setCornerRadius:](v10, "setCornerRadius:");
    }
    else
    {
      uint64_t v8 = [(UISwipeActionPullView *)self visualStyle];
      [v8 buttonCornerRadiusForStyle:self->_style view:self];
      -[UIView setCornerRadius:](v10, "setCornerRadius:");
    }
    [(UIView *)self insertSubview:self->_clippingView atIndex:0];
    double v9 = v10;
  }
  else
  {
    if (!clippingView) {
      return;
    }
    [(UIView *)clippingView removeFromSuperview];
    double v9 = self->_clippingView;
    self->_clippingView = 0;
  }
}

- (void)_rebuildButtons
{
  unint64_t v3 = [(UISwipeActionPullView *)self _swipeActionCount];
  uint64_t v4 = 416;
  buttons = self->_buttons;
  if (!buttons) {
    goto LABEL_5;
  }
  if (v3 == [(NSMutableArray *)buttons count]) {
    return;
  }
  double v6 = self->_buttons;
  if (v6)
  {
    [(NSMutableArray *)v6 makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->_buttons removeAllObjects];
  }
  else
  {
LABEL_5:
    double v7 = (NSMutableArray *)objc_opt_new();
    uint64_t v8 = self->_buttons;
    self->_buttons = v7;
  }
  [(UISwipeActionPullView *)self _setupClippingViewIfNeeded];
  clippingView = (UISwipeActionPullView *)self->_clippingView;
  if (!clippingView) {
    clippingView = self;
  }
  v40 = clippingView;
  unint64_t v10 = [(UISwipeActionPullView *)self cellEdge];
  uint64_t v11 = 1;
  if (v10 != 8) {
    uint64_t v11 = 2;
  }
  uint64_t v38 = v11;
  if (v10 == 8) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  double minimumOffset = self->_minimumOffset;
  [(UISwipeActionPullView *)self confirmationThreshold];
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = -v14;
  }
  [(UIView *)v40 bounds];
  double Height = CGRectGetHeight(v42);
  if (self->_style) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v3 == 1;
  }
  if (v17)
  {
    double v18 = [(NSArray *)self->_actions firstObject];
    if ([v18 forcesFallbackBackgroundColor])
    {
      long long v19 = [(UISwipeActionPullView *)self visualStyle];
      long long v20 = [v19 defaultButtonBackgroundColor];
    }
    else
    {
      long long v20 = [v18 backgroundColor];
    }
    [(UIView *)self setBackgroundColor:v20];
  }
  else
  {
    [(UIView *)self setBackgroundColor:0];
  }
  long long v21 = [(UIView *)self traitCollection];
  long long v22 = _UITableConstantsForTraitCollection(v21);
  v23 = [(UIView *)self traitCollection];
  v39 = [v22 defaultImageSymbolConfigurationForTraitCollection:v23];

  if (v3)
  {
    double v24 = v15 * 3.0;
    uint64_t v37 = *MEMORY[0x1E4F39EA8];
    do
    {
      uint64_t v25 = v4;
      v26 = objc_msgSend(objc_alloc(-[UISwipeActionPullView _buttonClass](self, "_buttonClass", v37)), "initWithFrame:", minimumOffset, 0.0, v24, Height);
      v27 = [(UISwipeActionPullView *)self visualStyle];
      [v26 setVisualStyle:v27];

      if (self->_style == 2)
      {
        v28 = [v26 layer];
        [v28 setMasksToBounds:1];

        v29 = [v26 layer];
        [v29 setCornerCurve:v37];

        v30 = [(UISwipeActionPullView *)self visualStyle];
        [v30 interitemButtonCornerRadiusForStyle:self->_style];
        double v32 = v31;
        v33 = [v26 layer];
        [v33 setCornerRadius:v32];

        uint64_t v4 = v25;
      }
      else
      {
        objc_opt_class();
        uint64_t v4 = v25;
        if (objc_opt_isKindOfClass())
        {
          [(UISwipeActionPullView *)self confirmationThreshold];
          if (v34 < 0.0) {
            double v34 = -v34;
          }
          [v26 setExtensionLength:v34 * 3.0];
        }
      }
      [v26 addTarget:self action:sel__tappedButton_ forControlEvents:64];
      [v26 addTarget:self action:sel__pressedButton_ forControlEvents:1];
      [v26 addTarget:self action:sel__unpressedButton_ forControlEvents:384];
      [v26 setPreferredSymbolConfiguration:v39 forImageInState:0];
      [v26 setContentHorizontalAlignment:v38];
      v35 = [v26 titleLabel];
      [v35 setTextAlignment:1];

      v36 = [v26 _outermostLayer];
      objc_msgSend(v36, "setAnchorPoint:", v12, 0.5);

      objc_msgSend(v26, "setFrame:", minimumOffset, 0.0, v24, Height);
      objc_msgSend(v26, "setAutosizes:", -[UISwipeActionPullView autosizesButtons](self, "autosizesButtons"));
      [*(id *)((char *)&self->super.super.super.isa + v4) addObject:v26];
      [(UIView *)v40 addSubview:v26];

      --v3;
    }
    while (v3);
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionPullView;
  [(UIView *)&v5 layoutSubviews];
  if (self->_swipeActionsDidChange)
  {
    self->_swipeActionsDidChange = 0;
    self->_double openThreshold = 0.0;
    self->_double confirmationThreshold = 0.0;
    [(UISwipeActionPullView *)self _rebuildButtons];
    buttons = self->_buttons;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__UISwipeActionPullView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E5308508;
    v4[4] = self;
    [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v4];
  }
}

void __39__UISwipeActionPullView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = [*(id *)(*(void *)(a1 + 32) + 424) objectAtIndexedSubscript:a3];
  double v7 = [v6 image];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v8 = [v7 imageWithRenderingMode:2];

    double v7 = (void *)v8;
  }
  [v5 setImage:v7 forState:0];
  double v9 = [v6 title];
  [v5 setTitle:v9 forState:0];

  unint64_t v10 = [v6 backgroundColor];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __39__UISwipeActionPullView_layoutSubviews__block_invoke_2;
  v21[3] = &unk_1E52DA210;
  id v11 = v10;
  id v22 = v11;
  double v12 = +[UIColor colorWithDynamicProvider:v21];
  [v5 setDefaultBackgroundColor:v11];
  [v5 setHighlightedBackgroundColor:v12];
  uint64_t v13 = [v6 _menu];
  if (v13)
  {
    [v5 setMenu:v13];
    [v5 setShowsMenuAsPrimaryAction:1];
    [v5 setSwipeActionButtonDelegate:*(void *)(a1 + 32)];
  }
  [v5 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v5 buttonWidth];
  objc_msgSend(v5, "setFrame:", v15, v17, v20, v19);
}

id __39__UISwipeActionPullView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInterfaceStyle];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 == 2) {
    +[UIColor _accessibilityLightenedColorForColor:v5];
  }
  else {
  double v6 = +[UIColor _accessibilityDarkenedColorForColor:v5];
  }
  double v7 = [v6 resolvedColorWithTraitCollection:v3];

  return v7;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UISwipeActionPullView *)self _setWidth:CGRectGetWidth(a3)];
  v8.receiver = self;
  v8.super_class = (Class)UISwipeActionPullView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v8.receiver = self;
  v8.super_class = (Class)UISwipeActionPullView;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y);
  v9.origin.double x = x;
  v9.origin.double y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  [(UISwipeActionPullView *)self _setWidth:CGRectGetWidth(v9)];
}

- (void)_setWidth:(double)a3
{
  [(UISwipeActionPullView *)self _directionalMultiplier];
  double v6 = v5 * a3;
  [(UISwipeActionPullView *)self moveToOffset:0 extraOffset:v6 animator:0.0 usingSpringWithStiffness:0.0 initialVelocity:0.0];
}

- (void)_setLayerBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v8 = [(UIView *)self layer];
  objc_msgSend(v8, "setBounds:", x, y, width, height);

  [(UISwipeActionPullView *)self _layoutClippingLayer];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  CGRect v9 = self->_buttons;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "bounds", (void)v25);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        long long v21 = [v14 superview];
        [v21 bounds];
        double v22 = CGRectGetHeight(v31);

        objc_msgSend(v14, "setBounds:", v16, v18, v20, v22);
        [v14 center];
        double v24 = v23;
        v32.origin.double x = v16;
        v32.origin.double y = v18;
        v32.size.double width = v20;
        v32.size.double height = v22;
        objc_msgSend(v14, "setCenter:", v24, CGRectGetMidY(v32));
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)_layoutClippingLayer
{
  if (self->_clippingView)
  {
    id v3 = [(UIView *)self layer];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if ([(UISwipeActionPullView *)self cellEdge] == 2)
    {
      double left = self->_contentInsets.left;
      double v5 = v5 + left;
    }
    else
    {
      double left = self->_contentInsets.right;
    }
    CGFloat v13 = fmax(v9 - left, 0.0);
    double v14 = [(UIView *)self->_clippingView layer];
    objc_msgSend(v14, "setBounds:", v5, v7, v13, v11);

    v19.origin.double x = v5;
    v19.origin.double y = v7;
    v19.size.double width = v13;
    v19.size.double height = v11;
    double MidX = CGRectGetMidX(v19);
    v20.origin.double x = v5;
    v20.origin.double y = v7;
    v20.size.double width = v13;
    v20.size.double height = v11;
    double MidY = CGRectGetMidY(v20);
    id v17 = [(UIView *)self->_clippingView layer];
    objc_msgSend(v17, "setPosition:", MidX, MidY);
  }
}

- (void)resetView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__UISwipeActionPullView_resetView__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

uint64_t __34__UISwipeActionPullView_resetView__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 416);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v8 = objc_msgSend(v7, "_outermostLayer", (void)v18);
        [v8 removeAllAnimations];

        double v9 = 0.0;
        if ([*(id *)(a1 + 32) buttonsUnderlapSwipedView])
        {
          double v10 = *(double **)(a1 + 32);
          double v11 = fmax(v10[58], 0.0);
          [v10 _directionalMultiplier];
          double v9 = v12 * v11;
        }
        CGFloat v13 = [v7 _outermostLayer];
        [v13 position];
        double v15 = v14;
        double v16 = [v7 _outermostLayer];
        objc_msgSend(v16, "setPosition:", v9, v15);

        [v7 setMenu:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 441) = 0;
  return [*(id *)(a1 + 32) setState:0];
}

- (void)freeze
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = self->_buttons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v7), "_outermostLayer", (void)v25);
        [v8 position];
        double v10 = v9;
        double v11 = [v8 presentationLayer];
        [v11 position];
        double v13 = v12;

        objc_msgSend(v8, "setPosition:", v13, v10);
        [v8 removeAllAnimations];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  double v14 = [(UIView *)self layer];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  long long v21 = [(UIView *)self layer];
  double v22 = [v21 presentationLayer];
  [v22 bounds];
  double Width = CGRectGetWidth(v31);

  -[UISwipeActionPullView _setLayerBounds:](self, "_setLayerBounds:", v16, v18, Width, v20);
  double v24 = [(UIView *)self layer];
  [v24 removeAllAnimations];
}

- (void)configureWithSwipeActions:(id)a3
{
  uint64_t v4 = [a3 reverseObjectEnumerator];
  uint64_t v5 = [v4 allObjects];
  actions = self->_actions;
  self->_actions = v5;

  [(UISwipeActionPullView *)self setState:0];
  self->_swipeActionsDidChange = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)moveToOffset:(double)a3 extraOffset:(double)a4 animator:(id)a5 usingSpringWithStiffness:(double)a6 initialVelocity:(double)a7
{
  double v116 = a6;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  [(UISwipeActionPullView *)self _paddingToSwipedView];
  double v12 = v11;
  unint64_t v13 = [(UISwipeActionPullView *)self cellEdge];
  double v14 = 0.0;
  if (a3 >= 0.0) {
    double v15 = a3;
  }
  else {
    double v15 = 0.0;
  }
  double v16 = v15 - v12;
  if (v15 - v12 < 0.0) {
    double v16 = 0.0;
  }
  double v17 = fmin(a3, 0.0);
  double v18 = fmin(v17 + v12, 0.0);
  p_right = &self->_contentInsets.right;
  if (v13 == 8)
  {
    double v20 = v18;
  }
  else
  {
    p_right = &self->_contentInsets.left;
    double v20 = v16;
  }
  if (v13 == 8) {
    double v15 = v17;
  }
  double v108 = v15;
  double v21 = *p_right;
  unint64_t v22 = [(UISwipeActionPullView *)self _swipeActionCount];
  uint64_t v23 = self->_buttons;
  if (v22 != [(NSMutableArray *)v23 count])
  {
    v105 = [MEMORY[0x1E4F28B00] currentHandler];
    [v105 handleFailureInMethod:a2 object:self file:@"UISwipeActionPullView.m" lineNumber:514 description:@"The swipe action count does not match the number of swipe action buttons."];
  }
  if (v20 >= 0.0) {
    double v24 = v20;
  }
  else {
    double v24 = -v20;
  }
  [(UISwipeActionPullView *)self confirmationThreshold];
  if (v25 < 0.0) {
    double v25 = -v25;
  }
  double v26 = v25 * 3.0;
  double v107 = v24;
  if (v24 >= v26) {
    double v27 = v26;
  }
  else {
    double v27 = v24;
  }
  if (self->_style == 2)
  {
    [(UISwipeActionPullView *)self openThreshold];
    if (v28 < 0.0) {
      double v28 = -v28;
    }
    double v29 = v28 - v12;
    if (v27 < v29) {
      double v27 = v29;
    }
    double v14 = (v27 - v29) / (double)v22;
  }
  uint64_t v30 = [(UISwipeActionPullView *)self _interButtonPadding];
  double v32 = v31;
  uint64_t v106 = (uint64_t)&v106;
  double v33 = MEMORY[0x1F4188790](v30);
  v35 = (double *)((char *)&v106 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  BOOL v36 = [(UISwipeActionPullView *)self autosizesButtons];
  uint64_t v111 = 472;
  if (!v36)
  {
    double v47 = v27 / (double)(v22 + 1);
    if (v47 <= v21)
    {
      double v48 = v27 / (double)(v22 + 1);
      if (!v22) {
        goto LABEL_106;
      }
    }
    else
    {
      double v48 = v47 + (v47 - v21) / (double)v22;
      double v47 = v21;
      if (!v22) {
        goto LABEL_106;
      }
    }
    unint64_t v49 = v22 - 1;
    unint64_t v50 = (v22 + 1) & 0xFFFFFFFFFFFFFFFELL;
    uint64x2_t v51 = (uint64x2_t)vdupq_n_s64(v22 - 1);
    int64x2_t v52 = (int64x2_t)xmmword_186B8FCC0;
    v53 = v35 + 1;
    int64x2_t v54 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v55 = vmovn_s64((int64x2_t)vcgeq_u64(v51, (uint64x2_t)v52));
      if (v55.i8[0])
      {
        double v56 = -0.0;
        if (!v49) {
          double v56 = v47;
        }
        *(v53 - 1) = v48 + v56;
      }
      if (v55.i8[4])
      {
        double v57 = -0.0;
        if (v49 == 1) {
          double v57 = v47;
        }
        double *v53 = v48 + v57;
      }
      int64x2_t v52 = vaddq_s64(v52, v54);
      v49 -= 2;
      v53 += 2;
      v50 -= 2;
    }
    while (v50);
    goto LABEL_51;
  }
  [(UISwipeActionPullView *)self _totalInterButtonPadding];
  if (v22)
  {
    uint64_t v38 = 0;
    double v39 = v21 + v37;
    do
    {
      v40 = [(NSMutableArray *)v23 objectAtIndexedSubscript:v38];
      [v40 buttonWidth];
      double v39 = v39 + v14 + v41;

      ++v38;
    }
    while (v22 != v38);
    for (uint64_t i = 0; i != v22; ++i)
    {
      v43 = [(NSMutableArray *)v23 objectAtIndexedSubscript:i];
      [v43 buttonWidth];
      double v45 = v14 + v44;
      if (v22 - 1 == i) {
        double v46 = v21;
      }
      else {
        double v46 = v32;
      }
      v35[i] = v27 * (v46 + v45) / v39;
    }
LABEL_51:
    uint64_t v58 = v111;
    unint64_t v119 = v22 - 1;
    if (v22 == 1)
    {
      v59 = [(NSMutableArray *)v23 firstObject];
      [v59 buttonWidth];
      double v61 = v14 + v60;

      double v62 = v21 + v61;
      if (v27 <= v21 + v61) {
        double v62 = v27;
      }
      double *v35 = v62;
    }
    unint64_t v63 = 0;
    double v114 = fabs(v108);
    v113 = v122;
    double v109 = v116 + v116;
    uint64_t v112 = 3221225472;
    v115 = v23;
    double v110 = v14;
    do
    {
      v64 = [(NSMutableArray *)v23 objectAtIndexedSubscript:v63];
      double v65 = 0.0;
      unint64_t v66 = v63;
      do
        double v65 = v65 + v35[v66++];
      while (v66 < v22);
      unint64_t v67 = [(UISwipeActionPullView *)self state];
      BOOL v69 = v114 >= 2.22044605e-16 && v67 != 0;
      BOOL v71 = v116 > 0.0 && self->_isTentative != v69;
      uint64_t v72 = *(uint64_t *)((char *)&self->super.super.super.isa + v58);
      uint64_t v118 = 441;
      if (v72)
      {
        if (v72 == 1)
        {
          if (v22 != 1 && v69)
          {
            if (!v63) {
              BOOL v71 = 0;
            }
            goto LABEL_85;
          }
LABEL_84:
          if (!v69) {
            goto LABEL_86;
          }
          goto LABEL_85;
        }
        if (v72 != 2) {
          goto LABEL_84;
        }
      }
      if (v63 != v119)
      {
        LOBYTE(v69) = 0;
        BOOL v71 = 0;
      }
      if (!v69)
      {
LABEL_86:
        int v74 = 0;
        goto LABEL_87;
      }
LABEL_85:
      int v74 = 1;
      double v65 = v27;
LABEL_87:
      v75 = objc_msgSend(v64, "_outermostLayer", v116, v114);
      [v64 bounds];
      uint64_t v78 = v77;
      uint64_t v80 = v79;
      uint64_t v82 = v81;
      uint64_t v83 = *(uint64_t *)((char *)&self->super.super.super.isa + v58);
      if (v83 == 2) {
        double v84 = v27;
      }
      else {
        double v84 = v76;
      }
      int v117 = v74;
      if ((v74 & 1) == 0 && v83 == 2)
      {
        [v64 buttonWidth];
        double v84 = v110 + v85;
      }
      double minimumOffset = self->_minimumOffset;
      [(UISwipeActionPullView *)self contentInsets];
      if (v65 >= minimumOffset - v87) {
        double v88 = v65;
      }
      else {
        double v88 = minimumOffset - v87;
      }
      [(UISwipeActionPullView *)self _directionalMultiplier];
      double v90 = v89 * v88;
      unint64_t v91 = [(UISwipeActionPullView *)self cellEdge];
      double v92 = 0.0;
      if (v91 == 8) {
        double v92 = v20;
      }
      double v93 = v90 - v92;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = v112;
      v122[0] = __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke;
      v122[1] = &unk_1E52E7998;
      id v94 = v75;
      id v123 = v94;
      double v125 = v93;
      id v95 = v64;
      id v124 = v95;
      uint64_t v126 = v78;
      uint64_t v127 = v80;
      double v128 = v84;
      uint64_t v129 = v82;
      v96 = _Block_copy(aBlock);
      v97 = v96;
      if (v71)
      {
        +[_UISwipeActionSpringAnimationParameters defaultStiffness];
        double v99 = v109 * v98;
        +[_UISwipeActionSpringAnimationParameters defaultDamping];
        v101 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, v99, v100, 0.0, 0.0);
        id v102 = v10;
        v103 = [[UIViewPropertyAnimator alloc] initWithDuration:v101 timingParameters:0.0];
        [(UIViewPropertyAnimator *)v103 addAnimations:v97];
        [(UIViewPropertyAnimator *)v103 startAnimation];

        id v10 = v102;
        uint64_t v58 = v111;
      }
      else if (v10)
      {
        [v10 addAnimations:v96];
      }
      else
      {
        (*((void (**)(void *))v96 + 2))(v96);
      }
      if (v63 == v119) {
        *((unsigned char *)&self->super.super.super.isa + v118) = v117;
      }

      ++v63;
      uint64_t v23 = v115;
    }
    while (v63 != v22);
  }
LABEL_106:
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v131);
  if (v10)
  {
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke_2;
    v120[3] = &unk_1E52DA520;
    v120[6] = 0;
    v120[4] = self;
    v120[5] = 0;
    *(double *)&v120[7] = v107;
    *(double *)&v120[8] = Height;
    [v10 addAnimations:v120];
  }
  else
  {
    -[UISwipeActionPullView _setLayerBounds:](self, "_setLayerBounds:", 0.0, 0.0, v107, Height);
  }
  self->_currentOffset = v108;
}

uint64_t __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) position];
  [*(id *)(a1 + 32) setPosition:v2];
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double v6 = *(double *)(a1 + 80);
  uint64_t v7 = *(void **)(a1 + 40);
  return objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
}

uint64_t __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLayerBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_performAction:(id)a3 offset:(double)a4 extraOffset:(double)a5
{
  id v10 = a3;
  id v8 = [(UISwipeActionPullView *)self primarySwipeAction];
  if (v8 == v10)
  {
    BOOL v9 = [(UISwipeActionPullView *)self primaryActionIsDestructive];

    if (v9)
    {
      [(UISwipeActionPullView *)self setState:2];
      [(UISwipeActionPullView *)self moveToOffset:0 extraOffset:a4 animator:a5 usingSpringWithStiffness:1.0 initialVelocity:0.0];
    }
  }
  else
  {
  }
}

- (id)sourceViewForAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__187;
  double v16 = __Block_byref_object_dispose__187;
  double v17 = self;
  buttons = v17->_buttons;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__UISwipeActionPullView_sourceViewForAction___block_invoke;
  v9[3] = &unk_1E5308530;
  v9[4] = v17;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__UISwipeActionPullView_sourceViewForAction___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = [*(id *)(a1[4] + 424) objectAtIndexedSubscript:a3];
  if (v7 == (void *)a1[5])
  {
    uint64_t v8 = [v11 sourceView];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (void)_tappedButton:(id)a3
{
  if (self->_pressedButton == a3)
  {
    uint64_t v4 = -[NSMutableArray indexOfObject:](self->_buttons, "indexOfObject:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [(NSArray *)self->_actions objectAtIndexedSubscript:v4];
    [WeakRetained swipeActionPullView:self tappedAction:v6];

    pressedButton = self->_pressedButton;
    self->_pressedButton = 0;
  }
}

- (void)_pressedButton:(id)a3
{
  id v5 = a3;
  if (!self->_pressedButton)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_pressedButton, a3);
    id v5 = v6;
  }
}

- (void)_unpressedButton:(id)a3
{
  uint64_t v4 = (UISwipeActionButton *)a3;
  if (self->_pressedButton == v4)
  {
    self->_pressedButton = 0;
    id v5 = v4;

    uint64_t v4 = v5;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__187;
  double v21 = __Block_byref_object_dispose__187;
  id v22 = 0;
  if (self->_pressedButton)
  {
    uint64_t v8 = self;
  }
  else
  {
    buttons = self->_buttons;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__UISwipeActionPullView_hitTest_withEvent___block_invoke;
    v16[3] = &unk_1E5308558;
    *(double *)&v16[6] = x;
    *(double *)&v16[7] = y;
    v16[4] = self;
    v16[5] = &v17;
    [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v16];
    id v10 = (void *)v18[5];
    if (!v10)
    {
      v15.receiver = self;
      v15.super_class = (Class)UISwipeActionPullView;
      uint64_t v11 = -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
      uint64_t v12 = (void *)v18[5];
      v18[5] = v11;

      id v10 = (void *)v18[5];
    }
    uint64_t v8 = v10;
  }
  unint64_t v13 = v8;
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __43__UISwipeActionPullView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v25 = a2;
  objc_msgSend(v25, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v25 bounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [v25 buttonWidth];
  uint64_t v16 = v15;
  uint64_t v17 = [*(id *)(a1 + 32) cellEdge];
  double v18 = 0.0;
  if (v17 == 2)
  {
    objc_msgSend(v25, "frame", 0.0);
    double v20 = v19;
    [v25 buttonWidth];
    double v18 = v20 - v21;
  }
  uint64_t v22 = v12;
  uint64_t v23 = v16;
  uint64_t v24 = v14;
  v27.double x = v8;
  v27.double y = v10;
  if (CGRectContainsPoint(*(CGRect *)&v18, v27))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)swipeActionButton:(id)a3 willDisplayContextMenuWithAnimator:(id)a4
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->_buttons, "indexOfObject:", a3, a4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v7 = [(NSArray *)self->_actions objectAtIndexedSubscript:v6];
    [WeakRetained swipeActionPullView:self tappedAction:v7];
  }
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(UISwipeActionPullView *)self cellEdge] == 8) {
    uint64_t v5 = @"UIRectEdgeRight";
  }
  else {
    uint64_t v5 = @"UIRectEdgeLeft";
  }
  if (self->_actions)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"<NSArray: %p>", self->_actions);
    double v7 = [v3 stringWithFormat:@"<%@: %p cellEdge = %@, actions = %@>", v4, self, v5, v6];;
  }
  else
  {
    double v7 = [v3 stringWithFormat:@"<%@: %p cellEdge = %@, actions = %@>", v4, self, v5, 0];;
  }
  return (NSString *)v7;
}

- (unint64_t)cellEdge
{
  return self->_cellEdge;
}

- (double)currentOffset
{
  return self->_currentOffset;
}

- (UISwipeActionPullViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UISwipeActionPullViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIColor)backgroundPullColor
{
  return self->_backgroundPullColor;
}

- (void)setBackgroundPullColor:(id)a3
{
}

- (BOOL)buttonsUnderlapSwipedView
{
  return self->_buttonsUnderlapSwipedView;
}

- (BOOL)autosizesButtons
{
  return self->_autosizesButtons;
}

- (void)setAutosizesButtons:(BOOL)a3
{
  self->_autosizesButtons = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UISwipeActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (double)_roundedStyleCornerRadius
{
  return self->_roundedStyleCornerRadius;
}

- (void)_setRoundedStyleCornerRadius:(double)a3
{
  self->_roundedStyleCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundPullColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pressedButton, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end