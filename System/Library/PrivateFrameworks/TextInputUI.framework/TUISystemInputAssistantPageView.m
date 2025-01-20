@interface TUISystemInputAssistantPageView
- (BOOL)_expandButtonVisible;
- (BOOL)hidesExpandButton;
- (BOOL)scrollEnabled;
- (BOOL)secondaryViewVisible;
- (CGSize)_contentSize;
- (TUIPredictionCellButton)expandButton;
- (TUISystemInputAssistantPageView)initWithFrame:(CGRect)a3;
- (TUISystemInputAssistantPageViewDelegate)pageViewDelegate;
- (UIScrollView)scrollView;
- (UIView)clipView;
- (UIView)primaryContainerView;
- (UIView)primaryView;
- (UIView)secondaryView;
- (id)_createExpandButtonIfNecessary;
- (id)imageSymbolConfigurationForAssistantItem;
- (unint64_t)_expandChevronImageStyleForRenderConfig:(id)a3;
- (void)_checkOldBounds:(CGRect)a3 forContentOffsetChangeWithNewBounds:(CGRect)a4;
- (void)_setRenderConfig:(id)a3;
- (void)_updateExpandButtonChevronImage;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClipView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidesExpandButton:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setPageViewDelegate:(id)a3;
- (void)setPrimaryContainerView:(id)a3;
- (void)setPrimaryView:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setSecondaryView:(id)a3;
- (void)setSecondaryViewVisible:(BOOL)a3;
- (void)setSecondaryViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSecondaryViewVisible:(BOOL)a3 force:(BOOL)a4 withAnimationType:(unint64_t)a5 completion:(id)a6;
- (void)setSecondaryViewVisible:(BOOL)a3 withAnimationType:(unint64_t)a4 completion:(id)a5;
- (void)updateScrollEnabled;
@end

@implementation TUISystemInputAssistantPageView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_primaryContainerView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_destroyWeak((id *)&self->_pageViewDelegate);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

- (void)setScrollView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setPrimaryContainerView:(id)a3
{
}

- (UIView)primaryContainerView
{
  return self->_primaryContainerView;
}

- (void)setClipView:(id)a3
{
}

- (UIView)clipView
{
  return self->_clipView;
}

- (BOOL)secondaryViewVisible
{
  return self->_secondaryViewVisible;
}

- (void)setPageViewDelegate:(id)a3
{
}

- (TUISystemInputAssistantPageViewDelegate)pageViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewDelegate);
  return (TUISystemInputAssistantPageViewDelegate *)WeakRetained;
}

- (TUIPredictionCellButton)expandButton
{
  return self->_expandButton;
}

- (BOOL)hidesExpandButton
{
  return self->_hidesExpandButton;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  [(TUISystemInputAssistantPageView *)self frame];
  if (v5 < v6)
  {
    BOOL v7 = 0;
    goto LABEL_4;
  }
  [(TUISystemInputAssistantPageView *)self frame];
  BOOL v7 = v8 > 0.0;
  if (v8 <= 0.0)
  {
LABEL_4:
    if (v5 > 0.00000011920929) {
      return;
    }
  }
  [(TUISystemInputAssistantPageView *)self updateScrollEnabled];
  if (self->_secondaryViewVisible != v7)
  {
    self->_secondaryViewVisible = v7;
    id v9 = [(TUISystemInputAssistantPageView *)self pageViewDelegate];
    [v9 assistantPageView:self didSwitchToSecondaryViewVisible:v7];
  }
}

- (void)layoutSubviews
{
  self->_layoutIsDirty = 0;
  v65.receiver = self;
  v65.super_class = (Class)TUISystemInputAssistantPageView;
  [(TUISystemInputAssistantPageView *)&v65 layoutSubviews];
  [(TUISystemInputAssistantPageView *)self _contentSize];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(TUISystemInputAssistantPageView *)self scrollView];
  [v7 contentSize];
  double v9 = v8;
  double v11 = v10;

  if (v4 != v9 || v6 != v11)
  {
    BOOL v13 = [(TUISystemInputAssistantPageView *)self secondaryViewVisible];
    v14 = [(TUISystemInputAssistantPageView *)self scrollView];
    objc_msgSend(v14, "setContentSize:", v4, v6);

    [(TUISystemInputAssistantPageView *)self setSecondaryViewVisible:v13];
  }
  [(TUISystemInputAssistantPageView *)self frame];
  double width = v66.size.width;
  double height = v66.size.height;
  double v17 = CGRectGetHeight(v66);
  [(TUISystemInputAssistantPageView *)self bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22 + 1200.0;
  v24 = [(TUISystemInputAssistantPageView *)self clipView];
  objc_msgSend(v24, "setFrame:", v19, -600.0, v21, v23);

  [(TUISystemInputAssistantPageView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(TUISystemInputAssistantPageView *)self scrollView];
  objc_msgSend(v31, "setFrame:", v26, 600.0, v28, v30);

  v32 = [(TUISystemInputAssistantPageView *)self primaryView];
  int v33 = [v32 isHidden];

  v34 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
  v35 = v34;
  if (v33)
  {
    [v34 setHidden:1];

    [(TUISystemInputAssistantPageView *)self hidesExpandButton];
LABEL_9:
    v49 = [(TUISystemInputAssistantPageView *)self expandButton];
    [v49 removeFromSuperview];

    self->_currentChevronStyle = 0;
    expandButton = self->_expandButton;
    self->_expandButton = 0;
    goto LABEL_11;
  }
  [v34 setHidden:0];

  double v36 = *MEMORY[0x1E4F1DAD8];
  double v37 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v38 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
  objc_msgSend(v38, "setFrame:", v36, v37, width, height);

  v39 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
  [v39 frame];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(TUISystemInputAssistantPageView *)self primaryView];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  if ([(TUISystemInputAssistantPageView *)self hidesExpandButton]) {
    goto LABEL_9;
  }
  v51 = [(TUISystemInputAssistantPageView *)self primaryView];
  [v51 frame];
  UIRectInset();
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  v60 = [(TUISystemInputAssistantPageView *)self primaryView];
  objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

  expandButton = [(TUISystemInputAssistantPageView *)self primaryView];
  [expandButton frame];
  double MaxX = CGRectGetMaxX(v67);
  v62 = [(TUISystemInputAssistantPageView *)self expandButton];
  objc_msgSend(v62, "setFrame:", MaxX, 0.0, v17, height);

LABEL_11:
  v63 = [(TUISystemInputAssistantPageView *)self secondaryView];

  if (v63)
  {
    v64 = [(TUISystemInputAssistantPageView *)self secondaryView];
    objc_msgSend(v64, "setFrame:", width, 0.0, width, height);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantPageView;
  [(TUISystemInputAssistantPageView *)&v3 didMoveToWindow];
  if (self->_layoutIsDirty) {
    [(TUISystemInputAssistantPageView *)self setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  self->_layoutIsDirty = 1;
  v2.receiver = self;
  v2.super_class = (Class)TUISystemInputAssistantPageView;
  [(TUISystemInputAssistantPageView *)&v2 setNeedsLayout];
}

- (CGSize)_contentSize
{
  [(TUISystemInputAssistantPageView *)self frame];
  double v4 = v3 + v3;
  [(TUISystemInputAssistantPageView *)self frame];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TUISystemInputAssistantPageView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  -[TUISystemInputAssistantPageView _checkOldBounds:forContentOffsetChangeWithNewBounds:](self, "_checkOldBounds:forContentOffsetChangeWithNewBounds:", v9, v11, v13, v15, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TUISystemInputAssistantPageView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  -[TUISystemInputAssistantPageView _checkOldBounds:forContentOffsetChangeWithNewBounds:](self, "_checkOldBounds:forContentOffsetChangeWithNewBounds:", v9, v11, v13, v15, x, y, width, height);
}

- (void)_checkOldBounds:(CGRect)a3 forContentOffsetChangeWithNewBounds:(CGRect)a4
{
  BOOL v4 = a3.size.width == a4.size.width && a3.size.height == a4.size.height;
  if (!v4 && self->_secondaryViewInitialized)
  {
    if (self->_secondaryView) {
      -[TUISystemInputAssistantPageView setSecondaryViewVisible:force:withAnimationType:completion:](self, "setSecondaryViewVisible:force:withAnimationType:completion:", self->_secondaryViewVisible, a3.size.width != a4.size.width, 2, 0, a3.origin.x, a3.origin.y);
    }
  }
}

- (void)setSecondaryViewVisible:(BOOL)a3 force:(BOOL)a4 withAnimationType:(unint64_t)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  if (a4 || !self->_secondaryViewInitialized || self->_secondaryViewVisible != v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke;
    aBlock[3] = &unk_1E55942B0;
    aBlock[4] = self;
    BOOL v31 = v8;
    double v11 = (void (**)(void))_Block_copy(aBlock);
    double v12 = _Block_copy(v11);
    double v13 = _Block_copy(v10);
    if (v8)
    {
      double v14 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
      [(TUISystemInputAssistantPageView *)self secondaryView];
    }
    else
    {
      double v14 = [(TUISystemInputAssistantPageView *)self secondaryView];
      [(TUISystemInputAssistantPageView *)self primaryContainerView];
    double v15 = };
    objc_super v16 = v15;
    if (a5 == 2)
    {
      [v15 frame];
      [v14 frame];
      objc_msgSend(v16, "setFrame:");
      [v16 setAlpha:0.0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_2;
      v27[3] = &unk_1E55942D8;
      id v19 = v14;
      id v28 = v19;
      id v29 = v16;
      double v20 = _Block_copy(v27);

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_3;
      v22[3] = &unk_1E5594300;
      id v23 = v19;
      v24 = self;
      double v25 = v11;
      id v26 = v10;
      double v21 = _Block_copy(v22);

      double v13 = v21;
      double v12 = v20;
    }
    else if (!a5)
    {
      double v17 = [v14 layer];
      [v17 removeAllAnimations];

      double v18 = [v16 layer];
      [v18 removeAllAnimations];

      v11[2](v11);
LABEL_12:
      self->_secondaryViewInitialized = 1;
      self->_secondaryViewVisible = v8;

      goto LABEL_13;
    }
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v12 usingSpringWithDamping:v13 initialSpringVelocity:0.37 options:0.0 animations:1.0 completion:1.0];
    goto LABEL_12;
  }
LABEL_13:
}

void __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) frame];
    double v3 = v2;
    double v4 = 0.0;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  id v5 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v5, "setContentOffset:", v3, v4);
}

uint64_t __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_3(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) layoutSubviews];
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)setSecondaryViewVisible:(BOOL)a3 withAnimationType:(unint64_t)a4 completion:(id)a5
{
}

- (void)setSecondaryViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setSecondaryViewVisible:(BOOL)a3
{
}

- (id)_createExpandButtonIfNecessary
{
  if (!self->_expandButton && [(TUISystemInputAssistantPageView *)self _expandButtonVisible])
  {
    double v3 = [TUIPredictionCellButton alloc];
    double v4 = -[TUIPredictionCellButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    expandButton = self->_expandButton;
    self->_expandButton = v4;

    double v6 = [(TUIPredictionCellButton *)self->_expandButton cellView];
    [v6 setVisibleSeparatorEdges:2];

    double v7 = [(TUIPredictionCellButton *)self->_expandButton cellView];
    [v7 setSeparatorMargin:0.0];

    [(TUISystemInputAssistantPageView *)self _updateExpandButtonChevronImage];
    BOOL v8 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
    [v8 addSubview:self->_expandButton];
  }
  double v9 = self->_expandButton;
  return v9;
}

- (id)imageSymbolConfigurationForAssistantItem
{
  double v2 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:-1];
  double v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:24.0];
  double v4 = [v2 configurationByApplyingConfiguration:v3];

  return v4;
}

- (void)_updateExpandButtonChevronImage
{
  if (self->_expandButton)
  {
    if ([(TUISystemInputAssistantPageView *)self _expandButtonVisible])
    {
      unint64_t currentChevronStyle = self->_currentChevronStyle;
      double v4 = [(TUISystemInputAssistantPageView *)self _inheritedRenderConfig];
      unint64_t v5 = [(TUISystemInputAssistantPageView *)self _expandChevronImageStyleForRenderConfig:v4];

      if (currentChevronStyle != v5)
      {
        double v6 = [(TUISystemInputAssistantPageView *)self _inheritedRenderConfig];
        self->_unint64_t currentChevronStyle = [(TUISystemInputAssistantPageView *)self _expandChevronImageStyleForRenderConfig:v6];

        if (self->_currentChevronStyle == 1) {
          [MEMORY[0x1E4FB1618] colorWithRed:0.31372549 green:0.333333333 blue:0.360784314 alpha:1.0];
        }
        else {
        id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
        }
        if (self->_currentChevronStyle == 1) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = 2;
        }
        BOOL v8 = (void *)MEMORY[0x1E4FB1818];
        double v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v7];
        id v10 = [v8 systemImageNamed:@"chevron.left" compatibleWithTraitCollection:v9];
        double v11 = [(TUISystemInputAssistantPageView *)self imageSymbolConfigurationForAssistantItem];
        double v12 = [v10 imageWithConfiguration:v11];

        double v13 = [(TUIPredictionCellButton *)self->_expandButton cellView];
        [v13 setImage:v12];

        double v14 = [(TUIPredictionCellButton *)self->_expandButton cellView];
        double v15 = [(TUISystemInputAssistantPageView *)self _inheritedRenderConfig];
        [v14 setRenderConfig:v15];

        objc_super v16 = [(TUIPredictionCellButton *)self->_expandButton cellView];
        [v16 setImageTintColor:v17];
      }
    }
  }
}

- (unint64_t)_expandChevronImageStyleForRenderConfig:(id)a3
{
  if ([a3 lightKeyboard]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)_expandButtonVisible
{
  return !self->_hidesExpandButton;
}

- (void)_setRenderConfig:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUISystemInputAssistantPageView;
  [(TUISystemInputAssistantPageView *)&v4 _setRenderConfig:a3];
  [(TUISystemInputAssistantPageView *)self _updateExpandButtonChevronImage];
}

- (void)updateScrollEnabled
{
  BOOL v5 = [(TUISystemInputAssistantPageView *)self scrollEnabled];
  if (v5)
  {
    double v2 = [(TUISystemInputAssistantPageView *)self primaryView];
    if ([v2 isHidden])
    {
      int v6 = 0;
      BOOL v7 = 0;
    }
    else
    {
      double v3 = [(TUISystemInputAssistantPageView *)self scrollView];
      [v3 contentOffset];
      if (v8 <= 0.0)
      {
        BOOL v7 = !self->_hidesExpandButton;
        int v6 = 1;
      }
      else
      {
        int v6 = 1;
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    int v6 = 0;
    BOOL v7 = 0;
  }
  double v9 = [(TUISystemInputAssistantPageView *)self scrollView];
  [v9 setScrollEnabled:v7];

  if (v6) {
  if (v5)
  }

  id v10 = [(TUISystemInputAssistantPageView *)self primaryView];

  if (v10)
  {
    double v11 = [(TUISystemInputAssistantPageView *)self scrollView];
    int v12 = [v11 isScrollEnabled];

    if (v12)
    {
      id v14 = [(TUISystemInputAssistantPageView *)self scrollView];
      double v13 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
      [v14 addSubview:v13];
    }
    else
    {
      id v14 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
      [(TUISystemInputAssistantPageView *)self addSubview:v14];
    }
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_scrollEnabled = a3;
    [(TUISystemInputAssistantPageView *)self updateScrollEnabled];
  }
}

- (void)setHidesExpandButton:(BOOL)a3
{
  self->_hidesExpandButton = a3;
  [(TUISystemInputAssistantPageView *)self updateScrollEnabled];
  if (!a3) {
    id v5 = [(TUISystemInputAssistantPageView *)self _createExpandButtonIfNecessary];
  }
  [(TUISystemInputAssistantPageView *)self setNeedsLayout];
}

- (void)setSecondaryView:(id)a3
{
  id v5 = (UIView *)a3;
  secondaryView = self->_secondaryView;
  id v10 = v5;
  if (secondaryView == v5)
  {
    BOOL v7 = [(UIView *)v5 superview];
    double v8 = [(TUISystemInputAssistantPageView *)self scrollView];

    if (v7 == v8) {
      goto LABEL_5;
    }
    secondaryView = self->_secondaryView;
  }
  [(UIView *)secondaryView removeFromSuperview];
  objc_storeStrong((id *)&self->_secondaryView, a3);
  double v9 = [(TUISystemInputAssistantPageView *)self scrollView];
  [v9 addSubview:v10];

LABEL_5:
  [(TUISystemInputAssistantPageView *)self setNeedsLayout];
}

- (void)setPrimaryView:(id)a3
{
  objc_super v4 = (UIView *)a3;
  [(UIView *)self->_primaryView removeFromSuperview];
  primaryView = self->_primaryView;
  self->_primaryView = v4;
  int v6 = v4;

  BOOL v7 = [(TUISystemInputAssistantPageView *)self primaryContainerView];
  [v7 addSubview:v6];

  [(TUISystemInputAssistantPageView *)self updateScrollEnabled];
  [(TUISystemInputAssistantPageView *)self setNeedsLayout];
}

- (TUISystemInputAssistantPageView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)TUISystemInputAssistantPageView;
  double v3 = -[TUISystemInputAssistantPageView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    [(TUISystemInputAssistantPageView *)v3 setScrollEnabled:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(TUISystemInputAssistantPageView *)v4 bounds];
    int v6 = objc_msgSend(v5, "initWithFrame:");
    [(TUISystemInputAssistantPageView *)v4 setClipView:v6];

    BOOL v7 = [(TUISystemInputAssistantPageView *)v4 clipView];
    [(TUISystemInputAssistantPageView *)v4 addSubview:v7];

    id v8 = objc_alloc(MEMORY[0x1E4FB1BE0]);
    [(TUISystemInputAssistantPageView *)v4 bounds];
    double v9 = objc_msgSend(v8, "initWithFrame:");
    [(TUISystemInputAssistantPageView *)v4 setScrollView:v9];

    id v10 = [(TUISystemInputAssistantPageView *)v4 clipView];
    double v11 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v10 addSubview:v11];

    int v12 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v12 setPagingEnabled:1];

    double v13 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v13 setShowsVerticalScrollIndicator:0];

    id v14 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v14 setShowsHorizontalScrollIndicator:0];

    double v15 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v15 setDelegate:v4];

    objc_super v16 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    [v16 setClipsToBounds:0];

    id v17 = [(TUISystemInputAssistantPageView *)v4 clipView];
    [v17 setClipsToBounds:1];

    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUISystemInputAssistantPageView *)v4 setPrimaryContainerView:v19];

    double v20 = [(TUISystemInputAssistantPageView *)v4 primaryContainerView];
    double v21 = [v20 layer];
    [v21 setAllowsGroupOpacity:0];

    double v22 = [(TUISystemInputAssistantPageView *)v4 scrollView];
    id v23 = [(TUISystemInputAssistantPageView *)v4 primaryContainerView];
    [v22 addSubview:v23];

    [(TUISystemInputAssistantPageView *)v4 setHidesExpandButton:1];
    v4->_unint64_t currentChevronStyle = 0;
    v4->_secondaryViewInitialized = 0;
  }
  return v4;
}

@end