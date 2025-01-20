@interface PLPlatterActionButtonsView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)highlightDefaultActionButton;
- (BOOL)isVerticallyStacked;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)materialGroupNameBase;
- (PLPlatterActionButton)defaultActionButton;
- (PLPlatterActionButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 cornerRadius:(double)a5 shouldVerticallyStack:(BOOL)a6;
- (UIAction)defaultAction;
- (UIColor)backgroundTintColor;
- (UIColor)textColor;
- (UIStackView)buttonsStackView;
- (UIView)clippingView;
- (double)_maxAllowedButtonWidth;
- (double)defaultWidth;
- (double)stretchedWidth;
- (id)senderForActionWithIdentifier:(id)a3;
- (int64_t)backgroundMaterialRecipe;
- (unint64_t)_widthMultipleForVerticallyStackedButtonsWithCount:(unint64_t)a3;
- (unint64_t)actionButtonCount;
- (void)_hideNonDefaultActionButtons;
- (void)_layoutButtonsStackView;
- (void)_layoutClippingView;
- (void)_performNonDefaultActionButtonsHideRevealAnimation:(id)a3;
- (void)_revealNonDefaultActionButtons;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBackgroundMaterialRecipe:(int64_t)a3;
- (void)setBackgroundTintColor:(id)a3;
- (void)setButtonsStackView:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setDefaultActionButton:(id)a3;
- (void)setHighlightDefaultActionButton:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setStretchedWidth:(double)a3;
- (void)setTextColor:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PLPlatterActionButtonsView

- (PLPlatterActionButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 cornerRadius:(double)a5 shouldVerticallyStack:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  v69.receiver = self;
  v69.super_class = (Class)PLPlatterActionButtonsView;
  v14 = -[PLPlatterActionButtonsView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_verticallyStacked = v6;
    v14->_backgroundMaterialRecipe = 1;
    materialGroupNameBase = v14->_materialGroupNameBase;
    v14->_materialGroupNameBase = (NSString *)@"PLPlatterActionButtonsView";

    v15->_adjustsFontForContentSizeCategordouble y = 1;
    [(PLPlatterActionButtonsView *)v15 bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v17, v19, v21, v23);
    clippingView = v15->_clippingView;
    v15->_clippingView = (UIView *)v25;

    [(PLPlatterActionButtonsView *)v15 addSubview:v15->_clippingView];
    id v27 = objc_alloc(MEMORY[0x1E4F42E20]);
    uint64_t v28 = objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    buttonsStackView = v15->_buttonsStackView;
    v15->_buttonsStackView = (UIStackView *)v28;

    [(UIStackView *)v15->_buttonsStackView setAutoresizingMask:2];
    [(UIStackView *)v15->_buttonsStackView setAxis:v6];
    [(UIStackView *)v15->_buttonsStackView setDistribution:1];
    [(UIStackView *)v15->_buttonsStackView setSpacing:8.0];
    [(UIView *)v15->_clippingView addSubview:v15->_buttonsStackView];
    uint64_t v55 = [v13 count];
    [(PLPlatterActionButtonsView *)v15 _maxAllowedButtonWidth];
    double v31 = v30;
    double v32 = 1.0;
    BOOL v56 = v6;
    if (v6) {
      double v32 = (double)-[PLPlatterActionButtonsView _widthMultipleForVerticallyStackedButtonsWithCount:](v15, "_widthMultipleForVerticallyStackedButtonsWithCount:", [v13 count]);
    }
    v73.origin.double x = v18;
    v73.origin.double y = v20;
    v73.size.double width = v22;
    v73.size.double height = v24;
    double v33 = CGRectGetHeight(v73);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v57 = v13;
    id v34 = v13;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v66 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          v40 = -[PLPlatterActionButton initWithFrame:]([PLPlatterActionButton alloc], "initWithFrame:", 0.0, 0.0, v31 * v32, v33);
          [(PLPlatterActionButton *)v40 setAdjustsFontForContentSizeCategory:[(PLPlatterActionButtonsView *)v15 adjustsFontForContentSizeCategory]];
          [(PLPlatterActionButton *)v40 setCornerRadius:a5];
          [(PLPlatterActionButton *)v40 setBackgroundMaterialRecipe:v15->_backgroundMaterialRecipe];
          [(PLPlatterActionButton *)v40 setMaterialGroupNameBase:v15->_materialGroupNameBase];
          [(PLPlatterActionButton *)v40 addAction:v39 forControlEvents:64];
          v41 = [v39 title];
          [(PLPlatterActionButton *)v40 setTitle:v41];

          if (objc_msgSend(v39, "pl_isDefaultAction"))
          {
            [(PLPlatterActionButtonsView *)v15 setDefaultActionButton:v40];
            objc_storeStrong((id *)&v15->_defaultAction, v39);
          }
          [(UIStackView *)v15->_buttonsStackView addArrangedSubview:v40];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v36);
    }

    v42 = [(UIStackView *)v15->_buttonsStackView arrangedSubviews];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __87__PLPlatterActionButtonsView_initWithFrame_actions_cornerRadius_shouldVerticallyStack___block_invoke;
    v62[3] = &unk_1E6B5F9B8;
    v43 = v15;
    v63 = v43;
    id v44 = v42;
    id v64 = v44;
    [v44 enumerateObjectsUsingBlock:v62];
    [(UIView *)v15->_clippingView frame];
    double v45 = CGRectGetHeight(v74);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v46 = v44;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v59;
      double v50 = 90.0;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v59 != v49) {
            objc_enumerationMutation(v46);
          }
          objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * j), "sizeThatFits:", v31, v45);
          double v50 = fmin(fmax(v50, v52), v31);
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v48);
    }
    else
    {
      double v50 = 90.0;
    }

    if (v56)
    {
      unint64_t v53 = [v43 _widthMultipleForVerticallyStackedButtonsWithCount:v55];
      id v13 = v57;
    }
    else
    {
      id v13 = v57;
      unint64_t v53 = v55;
    }
    v43[54] = v50 * (double)v53;
    [v43 defaultWidth];
    objc_msgSend(v43, "setStretchedWidth:");
  }
  return v15;
}

void __87__PLPlatterActionButtonsView_initWithFrame_actions_cornerRadius_shouldVerticallyStack___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = a2;
    id v11 = [v5 leadingAnchor];

    BOOL v6 = [*(id *)(a1 + 40) objectAtIndex:a3 - 1];
    v7 = [v6 trailingAnchor];
    [v11 constraintEqualToAnchor:v7 constant:8.0];
  }
  else
  {
    v8 = *(void **)(*(void *)(a1 + 32) + 480);
    id v9 = a2;
    id v11 = [v8 layoutMarginsGuide];
    BOOL v6 = [v9 leadingAnchor];

    v7 = [v11 leadingAnchor];
    [v6 constraintEqualToAnchor:v7];
  v10 = };
  [v10 setActive:1];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLPlatterActionButtonsView;
  id v3 = a3;
  [(PLPlatterActionButtonsView *)&v5 willMoveToSuperview:v3];
  v4 = objc_msgSend(v3, "layer", v5.receiver, v5.super_class);

  [v4 setAllowsGroupBlending:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPlatterActionButtonsView;
  [(PLPlatterActionButtonsView *)&v3 layoutSubviews];
  [(PLPlatterActionButtonsView *)self _layoutButtonsStackView];
  [(PLPlatterActionButtonsView *)self _layoutClippingView];
}

- (id)senderForActionWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke;
  v9[3] = &unk_1E6B5FA08;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke_2;
    v6[3] = &unk_1E6B5F9E0;
    id v7 = *(id *)(a1 + 32);
    v8 = &v9;
    [v3 enumerateEventHandlers:v6];
  }
  uint64_t v4 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  v8 = [a2 identifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a6 = 1;
  }
}

- (unint64_t)actionButtonCount
{
  v2 = [(PLPlatterActionButtonsView *)self buttonsStackView];
  id v3 = [v2 arrangedSubviews];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)setHighlightDefaultActionButton:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PLPlatterActionButtonsView *)self defaultActionButton];
  if (v5)
  {
    BOOL highlightDefaultActionButton = self->_highlightDefaultActionButton;

    if (highlightDefaultActionButton != v3)
    {
      self->_BOOL highlightDefaultActionButton = v3;
      id v7 = [(PLPlatterActionButtonsView *)self defaultActionButton];
      [v7 setHighlighted:v3];

      if (v3)
      {
        [(PLPlatterActionButtonsView *)self _hideNonDefaultActionButtons];
      }
      else
      {
        [(PLPlatterActionButtonsView *)self _revealNonDefaultActionButtons];
      }
    }
  }
}

- (void)setBackgroundMaterialRecipe:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_backgroundMaterialRecipe != a3)
  {
    self->_backgroundMaterialRecipe = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v5 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setBackgroundMaterialRecipe:a3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(PLPlatterActionButtonsView *)self setNeedsLayout];
  }
}

- (void)setBackgroundTintColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setBackgroundTintColor:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(PLPlatterActionButtonsView *)self setNeedsLayout];
  }
}

- (void)setTextColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setTextColor:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(PLPlatterActionButtonsView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  [(PLPlatterActionButtonsView *)self _layoutClippingView];
  [(UIView *)self->_clippingView frame];
  double Width = CGRectGetWidth(v8);
  double v6 = height;
  result.CGFloat height = v6;
  result.double width = Width;
  return result;
}

- (double)_maxAllowedButtonWidth
{
  [(UIView *)self->_clippingView frame];
  return CGRectGetWidth(v3) * 0.25;
}

- (unint64_t)_widthMultipleForVerticallyStackedButtonsWithCount:(unint64_t)a3
{
  if (a3 == 1) {
    return 2;
  }
  unint64_t v4 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    unint64_t v3 = 3;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)_layoutClippingView
{
  [(PLPlatterActionButtonsView *)self defaultWidth];
  [(PLPlatterActionButtonsView *)self stretchedWidth];
  [(PLPlatterActionButtonsView *)self bounds];
  CGRectGetHeight(v5);
  clippingView = self->_clippingView;
  PLMainScreenScale();
  UIRectIntegralWithScale();
  -[UIView setFrame:](clippingView, "setFrame:");
}

- (void)_layoutButtonsStackView
{
  buttonsStackView = self->_buttonsStackView;
  [(PLPlatterActionButtonsView *)self bounds];
  -[UIStackView setFrame:](buttonsStackView, "setFrame:");
}

- (void)_hideNonDefaultActionButtons
{
  unint64_t v3 = [(PLPlatterActionButtonsView *)self buttonsStackView];
  unint64_t v4 = [v3 arrangedSubviews];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke;
  v5[3] = &unk_1E6B5FA30;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) defaultActionButton];

  if (v4 != v3)
  {
    CGRect v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke_2;
    v6[3] = &unk_1E6B5F800;
    id v7 = v3;
    [v5 _performNonDefaultActionButtonsHideRevealAnimation:v6];
  }
}

uint64_t __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

- (void)_revealNonDefaultActionButtons
{
  id v3 = [(PLPlatterActionButtonsView *)self buttonsStackView];
  id v4 = [v3 arrangedSubviews];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke;
  v5[3] = &unk_1E6B5FA30;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) defaultActionButton];

  if (v4 != v3)
  {
    CGRect v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke_2;
    v6[3] = &unk_1E6B5F800;
    id v7 = v3;
    [v5 _performNonDefaultActionButtonsHideRevealAnimation:v6];
  }
}

uint64_t __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:0];
}

- (void)_performNonDefaultActionButtonsHideRevealAnimation:(id)a3
{
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    id v4 = [(PLPlatterActionButtonsView *)self buttonsStackView];
    CGRect v5 = [v4 arrangedSubviews];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__PLPlatterActionButtonsView_setAdjustsFontForContentSizeCategory___block_invoke;
    v6[3] = &__block_descriptor_33_e55_v32__0__UIView_PLContentSizeCategoryAdjusting__8Q16_B24l;
    BOOL v7 = a3;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __67__PLPlatterActionButtonsView_setAdjustsFontForContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setAdjustsFontForContentSizeCategory:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = [(PLPlatterActionButtonsView *)self buttonsStackView];
  id v4 = [v3 arrangedSubviews];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PLPlatterActionButtonsView_adjustForContentSizeCategoryChange__block_invoke;
  v7[3] = &unk_1E6B5FA78;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  if (*((unsigned char *)v9 + 24))
  {
    [(PLPlatterActionButtonsView *)self setNeedsLayout];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __64__PLPlatterActionButtonsView_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = objc_opt_respondsToSelector();
  id v4 = v8;
  if (v3)
  {
    uint64_t v3 = [v8 adjustForContentSizeCategoryChange];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v6 = (v3 & 1) != 0 || *(unsigned char *)(v5 + 24) != 0;
    *(unsigned char *)(v5 + 24) = v6;
    id v4 = v8;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)setMaterialGroupNameBase:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NSString *)self->_materialGroupNameBase isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v6 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setMaterialGroupNameBase:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  [(PLPlatterActionButtonsView *)self setNeedsLayout];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)highlightDefaultActionButton
{
  return self->_highlightDefaultActionButton;
}

- (double)stretchedWidth
{
  return self->_stretchedWidth;
}

- (void)setStretchedWidth:(double)a3
{
  self->_stretcheddouble Width = a3;
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (int64_t)backgroundMaterialRecipe
{
  return self->_backgroundMaterialRecipe;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (BOOL)isVerticallyStacked
{
  return self->_verticallyStacked;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
}

- (PLPlatterActionButton)defaultActionButton
{
  return self->_defaultActionButton;
}

- (void)setDefaultActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end