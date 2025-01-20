@interface SiriSharedUIViewStackContainer
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)isInAmbient;
- (NSArray)contentViews;
- (NSLayoutConstraint)bottomContainerConstraint;
- (NSLayoutConstraint)containingViewHeightConstraint;
- (NSLayoutConstraint)leadingContainerConstraint;
- (NSLayoutConstraint)temporaryTopConstraintForBottomViewStack;
- (NSLayoutConstraint)topContainerConstraint;
- (NSLayoutConstraint)trailingContainerConstraint;
- (SiriSharedUIRectSet)_transitionalContentViewFrames;
- (SiriSharedUIStandardScrollView)scrollView;
- (SiriSharedUIViewStack)bottomViewStack;
- (SiriSharedUIViewStack)customConstraintsViewStack;
- (SiriSharedUIViewStack)listViewStack;
- (SiriSharedUIViewStack)topViewStack;
- (SiriSharedUIViewStackContainer)initWithFrame:(CGRect)a3 contentViews:(id)a4;
- (SiriSharedUIViewStackContainerDelegate)delegate;
- (UIView)containingView;
- (double)bottomPadding;
- (double)stackableContentMaximumContainerWidth;
- (double)topPadding;
- (id)_mostRecentBottomStackViewAnchor;
- (id)_mostRecentTopStackViewAnchor;
- (id)_stackContainingContentView:(id)a3;
- (id)stackableViewsWithAttachment:(int64_t)a3;
- (void)_attachContentView:(id)a3;
- (void)_clearTransitionalContentViewFrameSnapshots;
- (void)_configureContainingView;
- (void)_configureCustomTopAndBottomViews:(id)a3;
- (void)_setTransitionalContentViewFrames:(id)a3;
- (void)_snapshotContentViewFramesForTransition;
- (void)_updateContainingViewConstraints;
- (void)_updateContainingViewTopConstraint;
- (void)_updateContainingViewTrailingConstraint;
- (void)_updateLeadingTrailingConstraints;
- (void)_updateScrollViewContentInsets;
- (void)addContentView:(id)a3;
- (void)addContentView:(id)a3 fromViewController:(id)a4;
- (void)bringSubviewToFront:(id)a3;
- (void)didDismissModalContent;
- (void)relayout;
- (void)removeContentView:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setBottomContainerConstraint:(id)a3;
- (void)setBottomPadding:(double)a3;
- (void)setBottomPadding:(double)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5 alongsideAnimations:(id)a6 completion:(id)a7;
- (void)setBottomViewStack:(id)a3;
- (void)setContainingView:(id)a3;
- (void)setContainingViewHeightConstraint:(id)a3;
- (void)setCustomConstraintsViewStack:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setLeadingContainerConstraint:(id)a3;
- (void)setListViewStack:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTemporaryTopConstraintForBottomViewStack:(id)a3;
- (void)setTopContainerConstraint:(id)a3;
- (void)setTopViewStack:(id)a3;
- (void)setTrailingContainerConstraint:(id)a3;
- (void)stackableContentDidLayout:(id)a3;
- (void)stackableContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5;
- (void)updateConstraints;
- (void)willDismissModalContent;
- (void)willPresentModalContent;
@end

@implementation SiriSharedUIViewStackContainer

- (SiriSharedUIViewStackContainer)initWithFrame:(CGRect)a3 contentViews:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriSharedUIViewStackContainer;
  v10 = -[SiriSharedUIViewStackContainer initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SiriSharedUIViewStackContainer initWithFrame:contentViews:]";
      _os_log_impl(&dword_20C9D5000, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    [(SiriSharedUIViewStackContainer *)v10 _configureContainingView];
    [(SiriSharedUIViewStackContainer *)v10 _setContentViews:v9];
  }

  return v10;
}

- (void)_configureContainingView
{
  v3 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setClipsToBounds:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setKeyboardDismissMode:2];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setAlwaysBounceHorizontal:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [(SiriSharedUIViewStackContainer *)self addSubview:self->_scrollView];
  id v52 = [(SiriSharedUIStandardScrollView *)self->_scrollView frameLayoutGuide];
  v5 = [(SiriSharedUIViewStackContainer *)self safeAreaLayoutGuide];
  BOOL IsPad = SiriSharedUIDeviceIsPad();
  v7 = [v52 leadingAnchor];
  v8 = [v5 leadingAnchor];
  if (IsPad) {
    [v7 constraintEqualToAnchor:v8 constant:30.0];
  }
  else {
  id v9 = [v7 constraintEqualToAnchor:v8];
  }
  leadingContainerConstraint = self->_leadingContainerConstraint;
  self->_leadingContainerConstraint = v9;

  [(NSLayoutConstraint *)self->_leadingContainerConstraint setActive:1];
  v11 = [v52 topAnchor];
  v12 = [v5 topAnchor];
  objc_super v13 = [v11 constraintEqualToAnchor:v12 constant:self->_topPadding];
  topContainerConstraint = self->_topContainerConstraint;
  self->_topContainerConstraint = v13;

  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTopConstraint];
  [(NSLayoutConstraint *)self->_topContainerConstraint setActive:1];
  v15 = [v52 trailingAnchor];
  uint64_t v16 = [v5 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];
  trailingContainerConstraint = self->_trailingContainerConstraint;
  self->_trailingContainerConstraint = v17;

  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTrailingConstraint];
  [(NSLayoutConstraint *)self->_trailingContainerConstraint setActive:1];
  v19 = [v52 bottomAnchor];
  v20 = [(SiriSharedUIViewStackContainer *)self bottomAnchor];
  [(SiriSharedUIViewStackContainer *)self bottomPadding];
  v22 = [v19 constraintEqualToAnchor:v20 constant:-v21];

  [(NSLayoutConstraint *)v22 setActive:1];
  bottomContainerConstraint = self->_bottomContainerConstraint;
  self->_bottomContainerConstraint = v22;
  v24 = v22;

  v25 = [(SiriSharedUIStandardScrollView *)self->_scrollView contentLayoutGuide];
  v26 = [SiriSharedUIStandardView alloc];
  v27 = -[SiriSharedUIStandardView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  containingView = self->_containingView;
  self->_containingView = v27;

  [(UIView *)self->_containingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_containingView];
  v29 = [(UIView *)self->_containingView leadingAnchor];
  v30 = [v25 leadingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(UIView *)self->_containingView topAnchor];
  v33 = [v25 topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(UIView *)self->_containingView trailingAnchor];
  v36 = [v25 trailingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(UIView *)self->_containingView bottomAnchor];
  v39 = [v25 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [(UIView *)self->_containingView leadingAnchor];
  v42 = [v52 leadingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [(UIView *)self->_containingView widthAnchor];
  v45 = [v52 widthAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(UIView *)self->_containingView heightAnchor];
  v48 = [v52 heightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];

  LODWORD(v50) = 1148846080;
  [(NSLayoutConstraint *)v49 setPriority:v50];
  [(NSLayoutConstraint *)v49 setActive:1];
  containingViewHeightConstraint = self->_containingViewHeightConstraint;
  self->_containingViewHeightConstraint = v49;
}

- (void)setIsInAmbient:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isInAmbient = a3;
  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:");
  LODWORD(v5) = 1148846080;
  if (v3) {
    *(float *)&double v5 = 250.0;
  }
  [(NSLayoutConstraint *)self->_containingViewHeightConstraint setPriority:v5];
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTopConstraint];
  [(SiriSharedUIViewStackContainer *)self _updateLeadingTrailingConstraints];
  [(SiriSharedUIViewStackContainer *)self _updateScrollViewContentInsets];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIViewStackContainer;
  [(SiriSharedUIViewStackContainer *)&v3 safeAreaInsetsDidChange];
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTopConstraint];
  [(SiriSharedUIViewStackContainer *)self _updateLeadingTrailingConstraints];
}

- (void)_updateLeadingTrailingConstraints
{
  [(SiriSharedUIViewStackContainer *)self safeAreaInsets];
  if (self->_isInAmbient)
  {
    if (v3 <= 36.0)
    {
      [(NSLayoutConstraint *)self->_leadingContainerConstraint setConstant:36.0];
      trailingContainerConstraint = self->_trailingContainerConstraint;
      double v6 = -36.0;
    }
    else
    {
      double v4 = v3 - 36.0;
      [(NSLayoutConstraint *)self->_leadingContainerConstraint setConstant:-(v3 - 36.0)];
      trailingContainerConstraint = self->_trailingContainerConstraint;
      double v6 = v4;
    }
  }
  else
  {
    leadingContainerConstraint = self->_leadingContainerConstraint;
    BOOL IsPad = SiriSharedUIDeviceIsPad();
    double v9 = 30.0;
    if (!IsPad) {
      double v9 = 0.0;
    }
    [(NSLayoutConstraint *)leadingContainerConstraint setConstant:v9];
    trailingContainerConstraint = self->_trailingContainerConstraint;
    double v6 = 0.0;
  }
  [(NSLayoutConstraint *)trailingContainerConstraint setConstant:v6];
}

- (void)_updateScrollViewContentInsets
{
  [(SiriSharedUIStandardScrollView *)self->_scrollView contentInset];
  scrollView = self->_scrollView;
  -[SiriSharedUIStandardScrollView setContentInset:](scrollView, "setContentInset:");
}

- (void)_updateContainingViewConstraints
{
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTrailingConstraint];
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewTopConstraint];
}

- (void)updateConstraints
{
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewConstraints];
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIViewStackContainer;
  [(SiriSharedUIViewStackContainer *)&v3 updateConstraints];
}

- (void)_updateContainingViewTrailingConstraint
{
  uint64_t IsPad = [(SiriSharedUIViewStackContainer *)self window];
  uint64_t v4 = IsPad;
  if (self->_trailingContainerConstraint)
  {
    uint64_t v16 = (void *)IsPad;
    uint64_t IsPad = SiriSharedUIDeviceIsPad();
    uint64_t v4 = (uint64_t)v16;
    if (IsPad)
    {
      if (v16)
      {
        [v16 bounds];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        objc_super v13 = [v16 windowScene];
        SiriSharedUICompactSlideOverContentSpacingOnPad([v13 interfaceOrientation], v6, v8, v10, v12);
        double v15 = v14;

        uint64_t IsPad = [(NSLayoutConstraint *)self->_trailingContainerConstraint setConstant:-v15];
        uint64_t v4 = (uint64_t)v16;
      }
    }
  }
  MEMORY[0x270F9A758](IsPad, v4);
}

- (void)_updateContainingViewTopConstraint
{
  if (SiriSharedUIDeviceIsPad()) {
    return;
  }
  if (self->_isInAmbient)
  {
    [(SiriSharedUIViewStackContainer *)self safeAreaInsets];
    BOOL v4 = v3 <= 36.0;
    double v5 = 36.0 - v3;
    if (v4) {
      double v5 = 36.0;
    }
    goto LABEL_11;
  }
  double v6 = [(SiriSharedUIViewStackContainer *)self window];
  double v7 = [v6 windowScene];
  if ((unint64_t)([v7 interfaceOrientation] - 3) > 1)
  {

LABEL_10:
    double v5 = 0.0;
    goto LABEL_11;
  }
  [(SiriSharedUIViewStackContainer *)self safeAreaInsets];
  double v9 = v8;

  double v5 = 8.0;
  if (v9 != 0.0) {
    goto LABEL_10;
  }
LABEL_11:
  topContainerConstraint = self->_topContainerConstraint;
  [(NSLayoutConstraint *)topContainerConstraint setConstant:v5];
}

- (void)_configureCustomTopAndBottomViews:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [SiriSharedUIViewStack alloc];
  uint64_t v6 = MEMORY[0x263EFFA68];
  double v7 = [(SiriSharedUIViewStack *)v5 initWithContentViews:MEMORY[0x263EFFA68]];
  customConstraintsViewStack = self->_customConstraintsViewStack;
  self->_customConstraintsViewStack = v7;

  double v9 = [[SiriSharedUIViewStack alloc] initWithContentViews:v6];
  bottomViewStack = self->_bottomViewStack;
  self->_bottomViewStack = v9;

  double v11 = [[SiriSharedUIViewStack alloc] initWithContentViews:v6];
  topViewStack = self->_topViewStack;
  self->_topViewStack = v11;

  objc_super v13 = [[SiriSharedUIViewStack alloc] initWithContentViews:v6];
  listViewStack = self->_listViewStack;
  self->_listViewStack = v13;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[SiriSharedUIViewStackContainer addContentView:](self, "addContentView:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(SiriSharedUIViewStackContainer *)self _transitionalContentViewFrames];
  char v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if (v7) {
    return 1;
  }
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  double v9 = [(SiriSharedUIViewStackContainer *)self contentViews];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SiriSharedUIViewStackContainer_hasContentAtPoint___block_invoke;
  v11[3] = &unk_2640E3AC8;
  *(double *)&v11[6] = x;
  *(double *)&v11[7] = y;
  v11[4] = self;
  v11[5] = &v12;
  [v9 enumerateObjectsUsingBlock:v11];

  BOOL v8 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __52__SiriSharedUIViewStackContainer_hasContentAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  [v17 frame];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat v10 = CGRectGetWidth(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v11 = CGRectGetHeight(v21);
  objc_msgSend(v17, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if (([v17 isHidden] & 1) == 0)
  {
    [v17 alpha];
    if (v16 > 0.0)
    {
      v22.origin.CGFloat x = 0.0;
      v22.origin.CGFloat y = 0.0;
      v22.size.CGFloat width = v10;
      v22.size.CGFloat height = v11;
      v19.CGFloat x = v13;
      v19.CGFloat y = v15;
      if (CGRectContainsPoint(v22, v19))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
}

- (id)_mostRecentBottomStackViewAnchor
{
  double v3 = [(SiriSharedUIViewStack *)self->_bottomViewStack mostRecentlyAddedView];
  id v4 = [v3 topAnchor];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIView *)self->_containingView bottomAnchor];
  }
  char v7 = v6;

  return v7;
}

- (id)_mostRecentTopStackViewAnchor
{
  double v3 = [(SiriSharedUIViewStack *)self->_topViewStack mostRecentlyAddedView];
  id v4 = [v3 bottomAnchor];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIView *)self->_containingView topAnchor];
  }
  char v7 = v6;

  return v7;
}

- (id)_stackContainingContentView:(id)a3
{
  id v4 = a3;
  p_bottomViewStack = &self->_bottomViewStack;
  if ([(SiriSharedUIViewStack *)self->_bottomViewStack containsContentView:v4]
    || (p_bottomViewStack = &self->_topViewStack,
        [(SiriSharedUIViewStack *)self->_topViewStack containsContentView:v4])
    || (p_bottomViewStack = &self->_listViewStack,
        [(SiriSharedUIViewStack *)self->_listViewStack containsContentView:v4])
    || (p_bottomViewStack = &self->_customConstraintsViewStack,
        [(SiriSharedUIViewStack *)self->_customConstraintsViewStack containsContentView:v4]))
  {
    id v6 = *p_bottomViewStack;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (double)topPadding
{
  [(SiriSharedUIViewStackContainer *)self safeAreaInsets];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_topContainerConstraint constant];
  return v4 + v5;
}

- (void)_snapshotContentViewFramesForTransition
{
  double v3 = [SiriSharedUIRectSet alloc];
  double v4 = [(SiriSharedUIViewStackContainer *)self contentViews];
  double v5 = [(SiriSharedUIRectSet *)v3 initWithFramesForViews:v4 inCoordinateSpace:self];

  [(SiriSharedUIViewStackContainer *)self _setTransitionalContentViewFrames:v5];
}

- (void)_clearTransitionalContentViewFrameSnapshots
{
}

- (void)setBottomPadding:(double)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5 alongsideAnimations:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v12 = (void (**)(void))a6;
  CGFloat v13 = (void (**)(void))a7;
  if (self->_bottomPadding == a3)
  {
    if (v12) {
      v12[2](v12);
    }
    if (v13) {
      v13[2](v13);
    }
  }
  else
  {
    self->_bottomPadding = a3;
    [(SiriSharedUIViewStackContainer *)self _snapshotContentViewFramesForTransition];
    double v14 = [(SiriSharedUIViewStackContainer *)self contentViews];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v18++) setNeedsLayout];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }
    [(NSLayoutConstraint *)self->_bottomContainerConstraint setConstant:-self->_bottomPadding];
    CGPoint v19 = (void *)MEMORY[0x263F82E00];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke;
    v23[3] = &unk_2640E3AF0;
    v23[4] = self;
    id v24 = v14;
    uint64_t v25 = v12;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke_2;
    v21[3] = &unk_2640E3B18;
    v21[4] = self;
    CGRect v22 = v13;
    id v20 = v14;
    [v19 animateWithDuration:a5 delay:v23 options:v21 animations:a4 completion:0.0];
  }
}

uint64_t __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) layoutIfNeeded];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "layoutIfNeeded", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearTransitionalContentViewFrameSnapshots];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setBottomPadding:(double)a3
{
}

- (NSArray)contentViews
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(SiriSharedUIViewStack *)self->_bottomViewStack contentViews];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(SiriSharedUIViewStack *)self->_topViewStack contentViews];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [(SiriSharedUIViewStack *)self->_customConstraintsViewStack contentViews];
  [v3 addObjectsFromArray:v6];

  char v7 = [(SiriSharedUIViewStack *)self->_listViewStack contentViews];
  [v3 addObjectsFromArray:v7];

  long long v8 = (void *)[v3 copy];
  return (NSArray *)v8;
}

- (void)bringSubviewToFront:(id)a3
{
  containingView = self->_containingView;
  if (containingView) {
    [(UIView *)containingView bringSubviewToFront:a3];
  }
}

- (void)addContentView:(id)a3 fromViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(SiriSharedUIViewStackContainer *)self delegate];
  [v8 viewStackContainer:self willBeginHostingChildViewController:v6];

  [(SiriSharedUIViewStackContainer *)self addContentView:v7];
  id v9 = [(SiriSharedUIViewStackContainer *)self delegate];
  [v9 viewStackContainer:self didBeginHostingChildViewController:v6];
}

- (void)addContentView:(id)a3
{
  id v6 = a3;
  [v6 setStackContainerDelegate:self];
  uint64_t v4 = +[SiriSharedUIViewStackConstraints constraints];
  [v6 setStackConstraints:v4];

  [(UIView *)self->_containingView addSubview:v6];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriSharedUIViewStackContainer *)self _attachContentView:v6];
  unint64_t v5 = [v6 attachmentType];
  if (v5 <= 3) {
    [*(id *)((char *)&self->super.super.super.super.isa + *off_2640E3B38[v5]) addContentView:v6];
  }
}

- (void)removeContentView:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 removeFromSuperview];
  long long v26 = self;
  unint64_t v5 = [(SiriSharedUIViewStackContainer *)self _stackContainingContentView:v4];
  id v6 = [v5 nextViewAfterContentView:v4];
  BOOL v7 = [v4 attachmentType] == 1 && objc_msgSend(v6, "attachmentType") == 1;
  long long v8 = [MEMORY[0x263EFF980] array];
  if (v7)
  {
    id v9 = [v4 stackConstraints];
    long long v10 = [v9 bottomConstraint];

    if (v10) {
      [v8 addObject:v10];
    }
    long long v11 = [v6 stackConstraints];
    double v12 = [v11 bottomConstraint];

    if (v12)
    {
      [v12 setActive:0];
      [v6 removeConstraint:v12];
    }
  }
  uint64_t v13 = [v4 stackConstraints];
  double v14 = [v13 heightConstraint];
  [v14 setActive:0];

  uint64_t v15 = [v4 stackConstraints];
  [v15 setHeightConstraint:0];

  [v5 removeContentView:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        CGRect v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
        CGRect v22 = [v6 bottomAnchor];
        long long v23 = [v21 secondAnchor];
        id v24 = [v22 constraintEqualToAnchor:v23];

        [v24 setActive:1];
        uint64_t v25 = [v6 stackConstraints];
        [v25 setBottomConstraint:v24];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  [v6 portraitContentSize];
  -[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:](v26, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", v6, 0);
}

- (void)_attachContentView:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 attachmentType];
  [v4 portraitContentSize];
  double v7 = v6;
  long long v8 = [v4 leadingAnchor];
  id v9 = [(UIView *)self->_containingView leadingAnchor];
  long long v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];

  [v10 setActive:1];
  long long v11 = [v4 stackConstraints];
  [v11 setLeadingConstraint:v10];

  double v12 = [v4 trailingAnchor];
  uint64_t v13 = [(UIView *)self->_containingView trailingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13 constant:0.0];

  [v14 setActive:1];
  uint64_t v15 = [v4 stackConstraints];
  [v15 setTrailingConstraint:v14];

  switch(v5)
  {
    case 0:
      id v16 = [v4 topAnchor];
      uint64_t v17 = [(SiriSharedUIViewStackContainer *)self _mostRecentTopStackViewAnchor];
      [v4 attachmentYOffset];
      uint64_t v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);

      [v18 setActive:1];
      uint64_t v19 = [v4 stackConstraints];
      [v19 setTopConstraint:v18];
      goto LABEL_10;
    case 1:
      uint64_t v20 = [v4 bottomAnchor];
      CGRect v21 = [(SiriSharedUIViewStackContainer *)self _mostRecentBottomStackViewAnchor];
      [v4 attachmentYOffset];
      uint64_t v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);

      [v18 setActive:1];
      CGRect v22 = [v4 stackConstraints];
      [v22 setBottomConstraint:v18];

      long long v23 = [v4 topAnchor];
      id v24 = [(UIView *)self->_containingView topAnchor];
      uint64_t v19 = [v23 constraintGreaterThanOrEqualToAnchor:v24];

      LODWORD(v25) = 1148846080;
      long long v26 = v19;
      goto LABEL_5;
    case 2:
      long long v27 = [v4 bottomAnchor];
      long long v28 = [(UIView *)self->_containingView bottomAnchor];
      uint64_t v18 = [v27 constraintLessThanOrEqualToAnchor:v28];

      LODWORD(v29) = 1148846080;
      [v18 setPriority:v29];
      [v18 setActive:1];
      long long v30 = [v4 stackConstraints];
      [v30 setBottomConstraint:v18];

      uint64_t v31 = [v4 topAnchor];
      uint64_t v32 = [(UIView *)self->_containingView topAnchor];
      uint64_t v19 = [v31 constraintGreaterThanOrEqualToAnchor:v32];

      long long v26 = v19;
      LODWORD(v25) = 1148846080;
LABEL_5:
      [v26 setPriority:v25];
      [v19 setActive:1];
      v33 = [v4 stackConstraints];
      [v33 setTopConstraint:v19];

      goto LABEL_10;
    case 3:
      v34 = [(SiriSharedUIViewStack *)self->_listViewStack mostRecentlyAddedView];
      uint64_t v18 = v34;
      if (v34)
      {
        v35 = [v34 stackConstraints];
        v36 = [v35 bottomConstraint];

        [v18 removeConstraint:v36];
        [v36 setActive:0];
        v37 = [v18 stackConstraints];
        [v37 setBottomConstraint:0];

        [v18 bottomAnchor];
      }
      else
      {
        [(UIView *)self->_containingView topAnchor];
      uint64_t v19 = };
      v38 = [v4 topAnchor];
      v39 = [v38 constraintEqualToAnchor:v19];

      [v39 setActive:1];
      v40 = [v4 stackConstraints];
      [v40 setTopConstraint:v39];

      v41 = [v4 bottomAnchor];
      v42 = [(UIView *)self->_containingView bottomAnchor];
      v43 = [v41 constraintEqualToAnchor:v42];

      [v43 setActive:1];
      v44 = [v4 stackConstraints];
      [v44 setBottomConstraint:v43];

LABEL_10:
      break;
    default:
      break;
  }
  if (objc_opt_respondsToSelector())
  {
    v45 = [v4 customAttachmentConstraints];
    v46 = v45;
    if (v45)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v47 = [v45 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v56 != v49) {
              objc_enumerationMutation(v46);
            }
            [*(id *)(*((void *)&v55 + 1) + 8 * i) setActive:1];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v55 objects:v59 count:16];
        }
        while (v48);
      }
    }
  }
  v51 = [v4 heightAnchor];
  id v52 = [v51 constraintEqualToConstant:v7];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 useLowerPriorityHeightConstraint])
  {
    LODWORD(v53) = 1137180672;
    [v52 setPriority:v53];
  }
  [v52 setActive:1];
  v54 = [v4 stackConstraints];
  [v54 setHeightConstraint:v52];
}

- (void)relayout
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(SiriSharedUIViewStackContainer *)self _updateContainingViewConstraints];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(SiriSharedUIViewStackContainer *)self contentViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 relayout];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)willPresentModalContent
{
  uint64_t v3 = [(SiriSharedUIViewStack *)self->_bottomViewStack contentViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(SiriSharedUIViewStack *)self->_bottomViewStack viewAtIndex:0];
    uint64_t v6 = [v5 stackConstraints];
    id v13 = [v6 bottomConstraint];

    LODWORD(v7) = 1132068864;
    [v13 setPriority:v7];
    long long v8 = [(SiriSharedUIViewStack *)self->_bottomViewStack mostRecentlyAddedView];
    long long v9 = [v8 topAnchor];
    long long v10 = [(UIView *)self->_containingView topAnchor];
    long long v11 = [v9 constraintEqualToAnchor:v10];
    temporaryTopConstraintForBottomViewStack = self->_temporaryTopConstraintForBottomViewStack;
    self->_temporaryTopConstraintForBottomViewStack = v11;

    [(NSLayoutConstraint *)self->_temporaryTopConstraintForBottomViewStack setActive:1];
    [(SiriSharedUIViewStackContainer *)self layoutIfNeeded];
  }
}

- (void)willDismissModalContent
{
  uint64_t v3 = [(SiriSharedUIViewStack *)self->_bottomViewStack contentViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(SiriSharedUIViewStack *)self->_bottomViewStack viewAtIndex:0];
    uint64_t v6 = [v5 stackConstraints];
    id v8 = [v6 bottomConstraint];

    LODWORD(v7) = 1148846080;
    [v8 setPriority:v7];
    [(NSLayoutConstraint *)self->_temporaryTopConstraintForBottomViewStack setActive:0];
    [(SiriSharedUIViewStackContainer *)self layoutIfNeeded];
  }
}

- (void)didDismissModalContent
{
  uint64_t v3 = [(SiriSharedUIViewStack *)self->_bottomViewStack contentViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(UIView *)self->_containingView removeConstraint:self->_temporaryTopConstraintForBottomViewStack];
    temporaryTopConstraintForBottomViewStack = self->_temporaryTopConstraintForBottomViewStack;
    self->_temporaryTopConstraintForBottomViewStack = 0;
  }
}

- (void)stackableContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  long long v10 = [(SiriSharedUIViewStackContainer *)self _stackContainingContentView:v9];
  if (v10)
  {
    [(UIView *)self->_containingView frame];
    if ((v11 - width) * 0.5 >= 0.0) {
      double v12 = (v11 - width) * 0.5;
    }
    else {
      double v12 = 0.0;
    }
    id v13 = [v9 stackConstraints];
    uint64_t v14 = [v13 leadingConstraint];
    [v14 setConstant:v12];

    uint64_t v15 = [v9 stackConstraints];
    id v16 = [v15 trailingConstraint];
    [v16 setConstant:-v12];

    uint64_t v17 = [v9 stackConstraints];
    uint64_t v18 = [v17 heightConstraint];

    [v9 removeConstraint:v18];
    [v18 setActive:0];
    uint64_t v19 = [v9 heightAnchor];
    uint64_t v20 = [v19 constraintEqualToConstant:height];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 useLowerPriorityHeightConstraint])
    {
      LODWORD(v21) = 1137180672;
      [v20 setPriority:v21];
    }
    [v20 setActive:1];
    CGRect v22 = [v9 stackConstraints];
    [v22 setHeightConstraint:v20];

    [v9 setNeedsLayout];
    long long v23 = [v9 superview];
    [v23 setNeedsLayout];

    if (v5)
    {
      objc_initWeak(&location, self);
      id v24 = (void *)MEMORY[0x263F82E00];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __99__SiriSharedUIViewStackContainer_stackableContentWillUpdateLayout_withUpdatedContentSize_animated___block_invoke;
      v26[3] = &unk_2640E3A28;
      objc_copyWeak(&v27, &location);
      [v24 _animateUsingSpringWithDuration:0 delay:v26 options:0 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    double v25 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:](v25);
    }
  }
}

void __99__SiriSharedUIViewStackContainer_stackableContentWillUpdateLayout_withUpdatedContentSize_animated___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[55] layoutIfNeeded];
    WeakRetained = v2;
  }
}

- (void)stackableContentDidLayout:(id)a3
{
}

- (double)stackableContentMaximumContainerWidth
{
  [(UIView *)self->_containingView frame];
  return v2;
}

- (id)stackableViewsWithAttachment:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_2640E3B38[a3]), "contentViews", v3);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (SiriSharedUIStandardScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SiriSharedUIViewStackContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUIViewStackContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)containingView
{
  return self->_containingView;
}

- (void)setContainingView:(id)a3
{
}

- (SiriSharedUIViewStack)customConstraintsViewStack
{
  return self->_customConstraintsViewStack;
}

- (void)setCustomConstraintsViewStack:(id)a3
{
}

- (SiriSharedUIViewStack)bottomViewStack
{
  return self->_bottomViewStack;
}

- (void)setBottomViewStack:(id)a3
{
}

- (SiriSharedUIViewStack)listViewStack
{
  return self->_listViewStack;
}

- (void)setListViewStack:(id)a3
{
}

- (SiriSharedUIViewStack)topViewStack
{
  return self->_topViewStack;
}

- (void)setTopViewStack:(id)a3
{
}

- (NSLayoutConstraint)topContainerConstraint
{
  return self->_topContainerConstraint;
}

- (void)setTopContainerConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingContainerConstraint
{
  return self->_leadingContainerConstraint;
}

- (void)setLeadingContainerConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingContainerConstraint
{
  return self->_trailingContainerConstraint;
}

- (void)setTrailingContainerConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomContainerConstraint
{
  return self->_bottomContainerConstraint;
}

- (void)setBottomContainerConstraint:(id)a3
{
}

- (NSLayoutConstraint)temporaryTopConstraintForBottomViewStack
{
  return self->_temporaryTopConstraintForBottomViewStack;
}

- (void)setTemporaryTopConstraintForBottomViewStack:(id)a3
{
}

- (NSLayoutConstraint)containingViewHeightConstraint
{
  return self->_containingViewHeightConstraint;
}

- (void)setContainingViewHeightConstraint:(id)a3
{
}

- (SiriSharedUIRectSet)_transitionalContentViewFrames
{
  return self->_transitionalContentViewFrames;
}

- (void)_setTransitionalContentViewFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalContentViewFrames, 0);
  objc_storeStrong((id *)&self->_containingViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_temporaryTopConstraintForBottomViewStack, 0);
  objc_storeStrong((id *)&self->_bottomContainerConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContainerConstraint, 0);
  objc_storeStrong((id *)&self->_leadingContainerConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerConstraint, 0);
  objc_storeStrong((id *)&self->_topViewStack, 0);
  objc_storeStrong((id *)&self->_listViewStack, 0);
  objc_storeStrong((id *)&self->_bottomViewStack, 0);
  objc_storeStrong((id *)&self->_customConstraintsViewStack, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
}

- (void)stackableContentWillUpdateLayout:(os_log_t)log withUpdatedContentSize:animated:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  double v2 = "-[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_20C9D5000, log, OS_LOG_TYPE_ERROR, "%s #viewStack Skipping because contentView wasn't found in SiriSharedUIViewStack: %@", (uint8_t *)&v1, 0x16u);
}

@end