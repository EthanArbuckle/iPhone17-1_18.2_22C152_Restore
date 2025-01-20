@interface PUPhotoEditToolbar
- (BOOL)useLargeShortSideHeight;
- (BOOL)useiPhonePrimaryPortraitHeight;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)toolButtons;
- (PUPhotoEditToolbar)initWithFrame:(CGRect)a3;
- (PUPhotoEditToolbarDelegate)delegate;
- (PUPhotoEditViewControllerSpec)photoEditSpec;
- (UIButton)mainActionButton;
- (UIButton)secondaryActionButton;
- (UIEdgeInsets)contentPadding;
- (UIView)mainToolbarContainer;
- (UIView)stretchableView;
- (double)longSideMargin;
- (double)shortSideSize;
- (double)tabBarHeight;
- (double)topActionButtonPadding;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)backgroundStyle;
- (int64_t)buttonSpacing;
- (int64_t)layoutDirection;
- (int64_t)layoutOrientation;
- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_invalidateAllConstraints;
- (void)_setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6 stretchableView:(id)a7;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)accessibilityLongPressChanged:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentPadding:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLongSideMargin:(double)a3;
- (void)setMainToolbarContainer:(id)a3;
- (void)setPhotoEditSpec:(id)a3;
- (void)setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6;
- (void)setToolButtons:(id)a3 mainActionButton:(id)a4 secondaryActionButton:(id)a5 stretchableView:(id)a6;
- (void)setTopActionButtonPadding:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setUseLargeShortSideHeight:(BOOL)a3;
- (void)setUseiPhonePrimaryPortraitHeight:(BOOL)a3;
- (void)setupWithLayoutOrientation:(int64_t)a3;
- (void)updateConstraints;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PUPhotoEditToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainToolbarContainer, 0);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stretchableView, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_toolButtons, 0);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_toolButtonLayoutGuides, 0);
  objc_storeStrong((id *)&self->_toolButtonsConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryActionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_mainActionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_basicViewsConstraints, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
}

- (void)setMainToolbarContainer:(id)a3
{
}

- (UIView)mainToolbarContainer
{
  return self->_mainToolbarContainer;
}

- (void)setPhotoEditSpec:(id)a3
{
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditToolbarDelegate *)WeakRetained;
}

- (void)setTopActionButtonPadding:(double)a3
{
  self->_topActionButtonPadding = a3;
}

- (double)topActionButtonPadding
{
  return self->_topActionButtonPadding;
}

- (double)longSideMargin
{
  return self->_longSideMargin;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (UIView)stretchableView
{
  return self->_stretchableView;
}

- (UIButton)secondaryActionButton
{
  return self->_secondaryActionButton;
}

- (UIButton)mainActionButton
{
  return self->_mainActionButton;
}

- (int64_t)buttonSpacing
{
  return self->_buttonSpacing;
}

- (NSArray)toolButtons
{
  return self->_toolButtons;
}

- (UIEdgeInsets)contentPadding
{
  double top = self->_contentPadding.top;
  double left = self->_contentPadding.left;
  double bottom = self->_contentPadding.bottom;
  double right = self->_contentPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)useiPhonePrimaryPortraitHeight
{
  return self->_useiPhonePrimaryPortraitHeight;
}

- (BOOL)useLargeShortSideHeight
{
  return self->_useLargeShortSideHeight;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)accessibilityLongPressChanged:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  -[PUPhotoEditToolbar hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 state];

  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v14;
        v7 = [(PUPhotoEditToolbar *)self delegate];
        v8 = [v7 photoEditToolbar:self accessibilityHUDItemForButton:v6];

        v9 = [(PUPhotoEditToolbar *)self delegate];
        v10 = v9;
        if (v8) {
          [v9 photoEditToolbar:self showAccessibilityHUDForItem:v8];
        }
        else {
          [v9 dismissAccessibilityHUDForPhotoEditToolbar:self];
        }

        goto LABEL_13;
      }
    }
LABEL_10:
    id v6 = [(PUPhotoEditToolbar *)self delegate];
    [v6 dismissAccessibilityHUDForPhotoEditToolbar:self];
LABEL_13:

    goto LABEL_14;
  }
  if (v5 != 3) {
    goto LABEL_10;
  }
  v11 = v14;
  if (v14)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v11 = v14;
    if (isKindOfClass)
    {
      v13 = [(PUPhotoEditToolbar *)self delegate];
      [v13 dismissAccessibilityHUDForPhotoEditToolbar:self];

      objc_msgSend(v14, "pu_sendActionForControlEventsWithHighlightTimeout:", 64);
LABEL_14:
      v11 = v14;
    }
  }
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[PUInterfaceManager currentTheme];
  id v6 = +[PUPhotoEditProtoSettings sharedInstance];
  int v7 = [v6 toolbarShadowsEnabled];

  int64_t v8 = [(PUPhotoEditToolbar *)self layoutOrientation];
  double v9 = 0.0;
  double v10 = 1.0;
  switch([(PUPhotoEditToolbar *)self backgroundStyle])
  {
    case 1:
      id v11 = [v5 photoEditingToolbarDarkGradientStartColor];
      uint64_t v12 = [v11 CGColor];

      id v13 = [v5 photoEditingToolbarDarkGradientEndColor];
      uint64_t v14 = [v13 CGColor];

      double v9 = 1.0;
      double v15 = 0.5;
      double v10 = 0.0;
      goto LABEL_6;
    case 2:
      id v16 = [v5 photoEditingToolbarLightGradientStartColor];
      uint64_t v12 = [v16 CGColor];

      id v17 = [v5 photoEditingToolbarLightGradientEndColor];
      uint64_t v14 = [v17 CGColor];

      goto LABEL_5;
    case 3:
      id v19 = [v5 photoEditingToolbarUltralightGradientStartColor];
      uint64_t v12 = [v19 CGColor];

      id v20 = [v5 photoEditingToolbarUltralightGradientEndColor];
      uint64_t v14 = [v20 CGColor];

      double v18 = 1.0;
      if (v8 == 2) {
        double v10 = 0.5;
      }
      else {
        double v10 = 1.0;
      }
      if (v8 == 2) {
        double v15 = 0.0;
      }
      else {
        double v15 = 0.5;
      }
      if (v8 == 2) {
        double v9 = 0.5;
      }
      else {
        double v9 = 0.0;
      }
      if (v8 != 2) {
        double v18 = 0.5;
      }
      goto LABEL_20;
    case 4:
      id v21 = [MEMORY[0x1E4FB1618] clearColor];
      uint64_t v14 = [v21 CGColor];

      double v15 = 0.5;
      double v18 = 0.5;
      uint64_t v12 = v14;
      goto LABEL_20;
    default:
      uint64_t v14 = 0;
      uint64_t v12 = 0;
LABEL_5:
      double v15 = 0.5;
LABEL_6:
      double v18 = 0.5;
LABEL_20:
      -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v18, v9);
      -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", v15, v10);
      if (v3)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __48__PUPhotoEditToolbar__updateBackgroundAnimated___block_invoke;
        v23[3] = &unk_1E5F2A1D0;
        v23[4] = self;
        v23[5] = v12;
        v23[6] = v14;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v23 animations:&__block_literal_global_60150 completion:0.2];
        if (!v7) {
          goto LABEL_25;
        }
      }
      else
      {
        v24[0] = v12;
        v24[1] = v14;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
        [(CAGradientLayer *)self->_gradientLayer setColors:v22];

        if (!v7) {
          goto LABEL_25;
        }
      }
      [(CAGradientLayer *)self->_gradientLayer setHidden:1];
LABEL_25:

      return;
  }
}

void __48__PUPhotoEditToolbar__updateBackgroundAnimated___block_invoke(void *a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[6];
  v4[0] = a1[5];
  v4[1] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  [*(id *)(a1[4] + 416) setColors:v3];
}

- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  BOOL v169 = a4;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(PUPhotoEditToolbar *)self buttonSpacing];
  int64_t v164 = [(PUPhotoEditToolbar *)self buttonSpacing];
  uint64_t v8 = [(NSArray *)self->_toolButtons count];
  uint64_t v9 = v8;
  BOOL v10 = self->_stretchableView && self->_secondaryActionButton && self->_mainActionButton != 0;
  BOOL v11 = v8 <= 0 && !v10;
  if (v11 || self->_toolButtonsConstraints) {
    goto LABEL_104;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_toolButtons];
  id v13 = v12;
  if (v10)
  {
    if (v9 >= 0) {
      uint64_t v14 = v9;
    }
    else {
      uint64_t v14 = v9 + 1;
    }
    [v12 insertObject:self->_stretchableView atIndex:(v9 & 1) + (v14 >> 1)];
  }
  double v15 = [MEMORY[0x1E4F1CA48] array];
  if (v164 == 2)
  {
    NSUInteger v16 = [(NSArray *)self->_toolButtonLayoutGuides count];
    if (v16 != v9 + 1)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v151 = NSUInteger v150 = v16;
      [v151 handleFailureInMethod:a2, self, @"PUPhotoEditToolbar.m", 491, @"Spacing is distributed, but number of layout guides (%ld) is wrong for number of tool buttons (%ld)", v150, v9 object file lineNumber description];

      NSUInteger v16 = v150;
    }
  }
  else
  {
    NSUInteger v16 = 0;
  }
  int64_t v152 = v7;
  v153 = v13;
  BOOL v154 = v10;
  if ([v13 count] != 1
    && (mainActionButton = self->_mainActionButton) != 0
    && self->_secondaryActionButton)
  {
    v156 = [(UIButton *)mainActionButton centerYAnchor];
    v158 = [(UIButton *)self->_secondaryActionButton centerYAnchor];
    v155 = [(UIButton *)self->_secondaryActionButton centerXAnchor];
    uint64_t v18 = [(UIButton *)self->_mainActionButton centerXAnchor];
  }
  else
  {
    v156 = [(PUPhotoEditToolbar *)self topAnchor];
    v158 = [(PUPhotoEditToolbar *)self bottomAnchor];
    v155 = [(PUPhotoEditToolbar *)self leadingAnchor];
    uint64_t v18 = [(PUPhotoEditToolbar *)self trailingAnchor];
  }
  v157 = (void *)v18;
  id v159 = v6;
  v160 = self;
  if (v16)
  {
    id v19 = 0;
    unint64_t v20 = 0;
    id obj = (id)(v16 - 1);
    NSUInteger v166 = v16;
    while (1)
    {
      id v21 = v19;
      id v19 = [(NSArray *)v160->_toolButtonLayoutGuides objectAtIndexedSubscript:v20];
      if (v169)
      {
        if (v20)
        {
          v22 = [(NSArray *)v160->_toolButtons objectAtIndexedSubscript:v20 - 1];
          id v23 = [v22 centerYAnchor];
        }
        else
        {
          id v23 = v156;
        }
        if (v20 >= (unint64_t)obj)
        {
          id v28 = v158;
          v26 = v160;
        }
        else
        {
          v26 = v160;
          v27 = [(NSArray *)v160->_toolButtons objectAtIndexedSubscript:v20];
          id v28 = [v27 centerYAnchor];
        }
        v29 = [v19 topAnchor];
        v30 = v23;
        v31 = [v29 constraintEqualToAnchor:v23];
        [(NSArray *)v15 addObject:v31];

        v32 = [v19 bottomAnchor];
        v33 = v28;
        v34 = [v32 constraintEqualToAnchor:v28];
        [(NSArray *)v15 addObject:v34];

        v35 = [v19 widthAnchor];
        v36 = [v35 constraintEqualToConstant:0.0];
        [(NSArray *)v15 addObject:v36];

        v37 = [v19 centerXAnchor];
        v38 = [(PUPhotoEditToolbar *)v26 centerXAnchor];
        v39 = [v37 constraintEqualToAnchor:v38];
        [(NSArray *)v15 addObject:v39];

        if (!v21) {
          goto LABEL_44;
        }
        v40 = [v19 heightAnchor];
        uint64_t v41 = [v21 heightAnchor];
      }
      else
      {
        if (v20)
        {
          v24 = [(NSArray *)v160->_toolButtons objectAtIndexedSubscript:v20 - 1];
          id v25 = [v24 centerXAnchor];
        }
        else
        {
          id v25 = v155;
        }
        if (v20 >= (unint64_t)obj)
        {
          id v44 = v157;
          v42 = v160;
        }
        else
        {
          v42 = v160;
          v43 = [(NSArray *)v160->_toolButtons objectAtIndexedSubscript:v20];
          id v44 = [v43 centerXAnchor];
        }
        v45 = [v19 leadingAnchor];
        v30 = v25;
        v46 = [v45 constraintEqualToAnchor:v25];
        [(NSArray *)v15 addObject:v46];

        v47 = [v19 trailingAnchor];
        v33 = v44;
        v48 = [v47 constraintEqualToAnchor:v44];
        [(NSArray *)v15 addObject:v48];

        v49 = [v19 heightAnchor];
        v50 = [v49 constraintEqualToConstant:0.0];
        [(NSArray *)v15 addObject:v50];

        v51 = [v19 centerYAnchor];
        v52 = [(PUPhotoEditToolbar *)v42 centerYAnchor];
        v53 = [v51 constraintEqualToAnchor:v52];
        [(NSArray *)v15 addObject:v53];

        if (!v21) {
          goto LABEL_44;
        }
        v40 = [v19 widthAnchor];
        uint64_t v41 = [v21 widthAnchor];
      }
      v54 = (void *)v41;
      v55 = [v40 constraintEqualToAnchor:v41];
      [(NSArray *)v15 addObject:v55];

LABEL_44:
      if (v166 == ++v20)
      {

        id v6 = v159;
        self = v160;
        break;
      }
    }
  }
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v56 = v153;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v170 objects:v174 count:16];
  unint64_t v58 = 0x1E4F28000uLL;
  if (!v57)
  {
    v60 = 0;
    goto LABEL_92;
  }
  uint64_t v59 = v57;
  v60 = 0;
  uint64_t v167 = *(void *)v171;
  id obja = v56;
  do
  {
    for (uint64_t i = 0; i != v59; ++i)
    {
      v62 = v60;
      if (*(void *)v171 != v167) {
        objc_enumerationMutation(obja);
      }
      v63 = *(UIView **)(*((void *)&v170 + 1) + 8 * i);
      [(UIView *)v63 setTranslatesAutoresizingMaskIntoConstraints:0];
      if (v62)
      {
        v64 = _NSDictionaryOfVariableBindings(&cfstr_ItemPreviousit.isa, v63, v62, 0);
        stretchableView = self->_stretchableView;
        BOOL v67 = v63 == stretchableView || v62 == stretchableView;
        char v68 = v164 != 2 || v67;
        if (!v169)
        {
          if (v68)
          {
            if (v67) {
              v77 = @"[previousItem]-stretchableViewItemSpacing-[item]";
            }
            else {
              v77 = @"[previousItem]-toolButtonSpacing-[item]";
            }
            v78 = [*(id *)(v58 + 3528) constraintsWithVisualFormat:v77 options:0 metrics:v6 views:v64];
            [(NSArray *)v15 addObjectsFromArray:v78];
          }
LABEL_77:
          v79 = self->_stretchableView;
          BOOL v80 = [(PUPhotoEditToolbar *)self useLargeShortSideHeight];
          v81 = *(void **)(v58 + 3528);
          if (v63 != v79)
          {
            if (v80)
            {
              v82 = @"V:[item]-tallItemMargin-|";
              uint64_t v83 = 0x10000;
            }
            else
            {
              v82 = @"V:|[item]|";
              uint64_t v83 = 0;
            }
            v88 = [v81 constraintsWithVisualFormat:v82 options:v83 metrics:v6 views:v64];
            [(NSArray *)v15 addObjectsFromArray:v88];

            unint64_t v58 = 0x1E4F28000uLL;
            v89 = [MEMORY[0x1E4F28DC8] constraintWithItem:v63 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:49.0];
            [(NSArray *)v15 addObject:v89];

            goto LABEL_88;
          }
          if (v80) {
            v86 = @"V:[item]-barShortSideMargin-|";
          }
          else {
            v86 = @"V:|[item]|";
          }
          v87 = [v81 constraintsWithVisualFormat:v86 options:0 metrics:v6 views:v64];
          [(NSArray *)v15 addObjectsFromArray:v87];

          v84 = v63;
          uint64_t v85 = 0;
LABEL_85:
          [(UIView *)v84 setContentHuggingPriority:v85 forAxis:0.0];
          goto LABEL_88;
        }
        if (v68)
        {
          if (v67) {
            v69 = @"V:[previousItem]-stretchableViewItemSpacing-[item]";
          }
          else {
            v69 = @"V:[previousItem]-toolButtonSpacing-[item]";
          }
          v70 = [*(id *)(v58 + 3528) constraintsWithVisualFormat:v69 options:0 metrics:v6 views:v64];
          [(NSArray *)v15 addObjectsFromArray:v70];

          unint64_t v58 = 0x1E4F28000;
        }
      }
      else
      {
        v64 = _NSDictionaryOfVariableBindings(&cfstr_Item.isa, v63, 0);
        if (!v169) {
          goto LABEL_77;
        }
      }
      if (v63 == self->_stretchableView)
      {
        v84 = v63;
        uint64_t v85 = 1;
        goto LABEL_85;
      }
      if (![(PUPhotoEditToolbar *)self useLargeShortSideHeight])
      {
        v71 = [*(id *)(v58 + 3528) constraintsWithVisualFormat:@"[item]|" options:0x10000 metrics:v6 views:v64];
        [(NSArray *)v15 addObjectsFromArray:v71];

        unint64_t v58 = 0x1E4F28000uLL;
      }
      v72 = [*(id *)(v58 + 3528) constraintWithItem:v63 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:49.0];
      [(NSArray *)v15 addObject:v72];

      v73 = [(UIView *)v63 centerXAnchor];
      v74 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
      v75 = [v74 centerXAnchor];
      v76 = [v73 constraintEqualToAnchor:v75];
      [(NSArray *)v15 addObject:v76];

      id v6 = v159;
      self = v160;

      unint64_t v58 = 0x1E4F28000;
LABEL_88:
      v60 = v63;
    }
    id v56 = obja;
    uint64_t v59 = [obja countByEnumeratingWithState:&v170 objects:v174 count:16];
  }
  while (v59);
LABEL_92:

  if (v154)
  {
    v90 = [v56 firstObject];
    v91 = [v56 lastObject];
    v92 = *(void **)(v58 + 3528);
    unint64_t v93 = v58;
    v94 = v156;
    if (v169)
    {
      v95 = [v92 constraintWithItem:v90 attribute:3 relatedBy:0 toItem:v160->_mainActionButton attribute:4 multiplier:1.0 constant:15.0];
      [(NSArray *)v15 addObject:v95];

      v96 = *(void **)(v93 + 3528);
      secondaryActionButton = v160->_secondaryActionButton;
      double v98 = 1.0;
      double v99 = -10.0;
      v100 = v91;
      uint64_t v101 = 4;
      uint64_t v102 = 3;
    }
    else
    {
      v126 = [v92 constraintWithItem:v90 attribute:5 relatedBy:0 toItem:v160->_secondaryActionButton attribute:6 multiplier:1.0 constant:15.0];
      [(NSArray *)v15 addObject:v126];

      v96 = *(void **)(v93 + 3528);
      secondaryActionButton = v160->_mainActionButton;
      double v98 = 1.0;
      double v99 = -10.0;
      v100 = v91;
      uint64_t v101 = 6;
      uint64_t v102 = 5;
    }
    v105 = [v96 constraintWithItem:v100 attribute:v101 relatedBy:0 toItem:secondaryActionButton attribute:v102 multiplier:v98 constant:v99];
    [(NSArray *)v15 addObject:v105];
    goto LABEL_102;
  }
  v94 = v156;
  if (v152 == 1)
  {
    id objb = v56;
    v103 = [(NSArray *)self->_toolButtons objectAtIndexedSubscript:0];
    [(NSArray *)self->_toolButtons objectAtIndexedSubscript:[(NSArray *)self->_toolButtons count] - 1];
    v91 = v104 = self;
    v105 = [(NSArray *)v104->_toolButtonLayoutGuides objectAtIndexedSubscript:0];
    v165 = [(NSArray *)v104->_toolButtonLayoutGuides objectAtIndexedSubscript:1];
    v168 = v103;
    if (v169)
    {
      v106 = [v105 topAnchor];
      v107 = [(PUPhotoEditToolbar *)v104 mainToolbarContainer];
      v108 = [v107 topAnchor];
      v109 = [v106 constraintEqualToAnchor:v108];
      [(NSArray *)v15 addObject:v109];

      v110 = [v105 bottomAnchor];
      v111 = [v103 topAnchor];
      v112 = [v110 constraintEqualToAnchor:v111];
      [(NSArray *)v15 addObject:v112];

      v113 = v165;
      v114 = [v165 topAnchor];
      v115 = [v91 bottomAnchor];
      v116 = [v114 constraintEqualToAnchor:v115];
      [(NSArray *)v15 addObject:v116];

      v117 = [v165 bottomAnchor];
      v118 = [(PUPhotoEditToolbar *)v104 mainToolbarContainer];
      v119 = [v118 bottomAnchor];
      v120 = [v117 constraintEqualToAnchor:v119];
      [(NSArray *)v15 addObject:v120];

      v121 = [v105 heightAnchor];
      v122 = [v165 heightAnchor];
      v123 = [v121 constraintEqualToAnchor:v122];
      [(NSArray *)v15 addObject:v123];

      v124 = [v105 widthAnchor];
      v125 = [v124 constraintEqualToConstant:0.0];
      [(NSArray *)v15 addObject:v125];

      [v165 widthAnchor];
    }
    else
    {
      v127 = [v105 leadingAnchor];
      v128 = [(PUPhotoEditToolbar *)v104 mainToolbarContainer];
      v129 = [v128 leadingAnchor];
      v130 = [v127 constraintEqualToAnchor:v129];
      [(NSArray *)v15 addObject:v130];

      v131 = [v105 trailingAnchor];
      v132 = [v103 leadingAnchor];
      v133 = [v131 constraintEqualToAnchor:v132];
      [(NSArray *)v15 addObject:v133];

      v113 = v165;
      v134 = [v165 leadingAnchor];
      v135 = [v91 trailingAnchor];
      v136 = [v134 constraintEqualToAnchor:v135];
      [(NSArray *)v15 addObject:v136];

      v137 = [v165 trailingAnchor];
      v138 = [(PUPhotoEditToolbar *)v104 mainToolbarContainer];
      v139 = [v138 trailingAnchor];
      v140 = [v137 constraintEqualToAnchor:v139];
      [(NSArray *)v15 addObject:v140];

      v141 = [v105 widthAnchor];
      v142 = [v165 widthAnchor];
      v143 = [v141 constraintEqualToAnchor:v142];
      [(NSArray *)v15 addObject:v143];

      v144 = [v105 heightAnchor];
      v145 = [v144 constraintEqualToConstant:0.0];
      [(NSArray *)v15 addObject:v145];

      [v165 heightAnchor];
    v146 = };
    v147 = [v146 constraintEqualToConstant:0.0];
    [(NSArray *)v15 addObject:v147];

    v94 = v156;
    id v56 = objb;
    v90 = v168;
LABEL_102:

    id v6 = v159;
    self = v160;
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v15];
  toolButtonsConstraints = self->_toolButtonsConstraints;
  self->_toolButtonsConstraints = v15;
  v149 = v15;

LABEL_104:
}

- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  id v6 = a3;
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton && !self->_secondaryActionButtonConstraints)
  {
    id v31 = v6;
    [(UIButton *)secondaryActionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [(UIButton *)self->_secondaryActionButton configuration];
    BOOL v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    }
    uint64_t v12 = v11;

    [v12 contentInsets];
    if (a4)
    {
      double v17 = v13;
      double longSideMargin = v14;
      double v19 = v15;
      double v20 = v16;
    }
    else
    {
      double longSideMargin = self->_longSideMargin;
      id v21 = [(UIButton *)self->_secondaryActionButton leadingAnchor];
      v22 = [(PUPhotoEditToolbar *)self leadingAnchor];
      id v23 = [v21 constraintEqualToAnchor:v22 constant:self->_longSideMargin];
      [(NSArray *)v8 addObject:v23];

      BOOL v24 = [(PUPhotoEditToolbar *)self useLargeShortSideHeight];
      id v25 = self->_secondaryActionButton;
      if (v24)
      {
        v26 = [(UIButton *)v25 bottomAnchor];
        v27 = [(PUPhotoEditToolbar *)self bottomAnchor];
        [v26 constraintEqualToAnchor:v27 constant:-5.0];
      }
      else
      {
        v26 = [(UIButton *)v25 centerYAnchor];
        v27 = [(PUPhotoEditToolbar *)self centerYAnchor];
        [v26 constraintEqualToAnchor:v27];
      id v28 = };
      [(NSArray *)v8 addObject:v28];

      double v20 = 0.0;
      double v19 = 0.0;
      double v17 = 0.0;
    }
    LODWORD(v13) = 1148846080;
    [(UIButton *)self->_secondaryActionButton setContentCompressionResistancePriority:0 forAxis:v13];
    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
    self->_secondaryActionButtonConstraints = v8;
    v30 = v8;

    objc_msgSend(v12, "setContentInsets:", v17, longSideMargin, v19, v20);
    [(UIButton *)self->_secondaryActionButton setConfiguration:v12];

    id v6 = v31;
  }
}

- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  id v6 = a3;
  mainActionButton = self->_mainActionButton;
  if (mainActionButton && !self->_mainActionButtonConstraints)
  {
    id v31 = v6;
    [(UIButton *)mainActionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [(UIButton *)self->_mainActionButton configuration];
    BOOL v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    }
    uint64_t v12 = v11;

    [v12 contentInsets];
    double v17 = v16;
    if (a4)
    {
      double v18 = v13;
      double v19 = v14;
      double v20 = v15;
    }
    else
    {
      id v21 = [(UIButton *)self->_mainActionButton trailingAnchor];
      v22 = [(PUPhotoEditToolbar *)self trailingAnchor];
      id v23 = [v21 constraintEqualToAnchor:v22 constant:-self->_longSideMargin];
      [(NSArray *)v8 addObject:v23];

      BOOL v24 = [(PUPhotoEditToolbar *)self useLargeShortSideHeight];
      id v25 = self->_mainActionButton;
      if (v24)
      {
        v26 = [(UIButton *)v25 bottomAnchor];
        v27 = [(PUPhotoEditToolbar *)self bottomAnchor];
        [v26 constraintEqualToAnchor:v27 constant:-5.0];
      }
      else
      {
        v26 = [(UIButton *)v25 centerYAnchor];
        v27 = [(PUPhotoEditToolbar *)self centerYAnchor];
        [v26 constraintEqualToAnchor:v27];
      id v28 = };
      [(NSArray *)v8 addObject:v28];

      double v20 = 0.0;
      double v19 = 0.0;
      double v18 = 0.0;
    }
    LODWORD(v13) = 1148846080;
    [(UIButton *)self->_mainActionButton setContentCompressionResistancePriority:0 forAxis:v13];
    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    mainActionButtonConstraints = self->_mainActionButtonConstraints;
    self->_mainActionButtonConstraints = v8;
    v30 = v8;

    objc_msgSend(v12, "setContentInsets:", v18, v19, v20, v17);
    [(UIButton *)self->_mainActionButton setConfiguration:v12];

    id v6 = v31;
  }
}

- (void)updateConstraints
{
  v34[11] = *MEMORY[0x1E4F143B8];
  if (![(PUPhotoEditToolbar *)self layoutOrientation])
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolbar.m" lineNumber:341 description:@"Layout orientation cannot be unknown."];
  }
  [(PUPhotoEditToolbar *)self contentPadding];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v33[0] = @"barShortSideSize";
  uint64_t v12 = NSNumber;
  [(PUPhotoEditToolbar *)self shortSideSize];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  v34[0] = v13;
  v34[1] = &unk_1F078D280;
  v33[1] = @"barShortSideMargin";
  v33[2] = @"tallItemMargin";
  v34[2] = &unk_1F078D290;
  v34[3] = &unk_1F078D2A0;
  v33[3] = @"tallActionButtonMargin";
  v33[4] = @"toolButtonSpacing";
  v34[4] = &unk_1F078D2A0;
  v34[5] = &unk_1F078D290;
  v33[5] = @"stretchableViewItemSpacing";
  v33[6] = @"highPriority";
  v34[6] = &unk_1F078D490;
  v33[7] = @"leftContentPadding";
  double v14 = [NSNumber numberWithDouble:v7];
  v34[7] = v14;
  v33[8] = @"rightContentPadding";
  double v15 = [NSNumber numberWithDouble:v11];
  v34[8] = v15;
  v33[9] = @"topContentPadding";
  double v16 = [NSNumber numberWithDouble:v5];
  v34[9] = v16;
  v33[10] = @"bottomContentPadding";
  double v17 = [NSNumber numberWithDouble:v9];
  v34[10] = v17;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:11];

  int64_t v19 = [(PUPhotoEditToolbar *)self layoutDirection];
  if (!self->_basicViewsConstraints)
  {
    double v20 = [MEMORY[0x1E4F1CA48] array];
    id v21 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
    v22 = _NSDictionaryOfVariableBindings(&cfstr_SelfMaintoolba.isa, self, v21, self->_gradientBackgroundView, 0);
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v19) {
      id v23 = @"H:|-leftContentPadding-[mainToolbarContainer(barShortSideSize@highPriority)]-rightContentPadding-|";
    }
    else {
      id v23 = @"H:|-leftContentPadding-[mainToolbarContainer]-rightContentPadding-|";
    }
    if (v19) {
      BOOL v24 = @"V:|-topContentPadding-[mainToolbarContainer]-bottomContentPadding-|";
    }
    else {
      BOOL v24 = @"V:|-topContentPadding-[mainToolbarContainer(barShortSideSize@highPriority)]-bottomContentPadding-|";
    }
    id v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v23 options:0x10000 metrics:v18 views:v22];
    [(NSArray *)v20 addObjectsFromArray:v25];

    v26 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v24 options:0 metrics:v18 views:v22];
    [(NSArray *)v20 addObjectsFromArray:v26];

    [(UIView *)self->_gradientBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_gradientBackgroundView]|" options:0 metrics:0 views:v22];
    [(NSArray *)v20 addObjectsFromArray:v27];

    id v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_gradientBackgroundView]|" options:0 metrics:0 views:v22];
    [(NSArray *)v20 addObjectsFromArray:v28];

    [MEMORY[0x1E4F28DC8] activateConstraints:v20];
    basicViewsConstraints = self->_basicViewsConstraints;
    self->_basicViewsConstraints = v20;
  }
  BOOL v30 = v19 != 0;
  [(PUPhotoEditToolbar *)self _addLeadingConstraintsWithMetrics:v18 verticalLayout:v30];
  [(PUPhotoEditToolbar *)self _addTrailingConstraintsWithMetrics:v18 verticalLayout:v30];
  [(PUPhotoEditToolbar *)self _addCenterConstraintsWithMetrics:v18 verticalLayout:v30];
  v32.receiver = self;
  v32.super_class = (Class)PUPhotoEditToolbar;
  [(PUPhotoEditToolbar *)&v32 updateConstraints];
}

- (void)_invalidateAllConstraints
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_basicViewsConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_mainActionButtonConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_secondaryActionButtonConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolButtonsConstraints];
  basicViewsConstraints = self->_basicViewsConstraints;
  self->_basicViewsConstraints = 0;

  mainActionButtonConstraints = self->_mainActionButtonConstraints;
  self->_mainActionButtonConstraints = 0;

  secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
  self->_secondaryActionButtonConstraints = 0;

  toolButtonsConstraints = self->_toolButtonsConstraints;
  self->_toolButtonsConstraints = 0;

  [(PUPhotoEditToolbar *)self setNeedsUpdateConstraints];
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  if (self->_contentPadding.left != a3.left
    || self->_contentPadding.top != a3.top
    || self->_contentPadding.right != a3.right
    || self->_contentPadding.bottom != a3.bottom)
  {
    self->_contentPadding = a3;
    [(PUPhotoEditToolbar *)self _invalidateAllConstraints];
  }
}

- (void)setUseiPhonePrimaryPortraitHeight:(BOOL)a3
{
  if (self->_useiPhonePrimaryPortraitHeight != a3)
  {
    self->_useiPhonePrimaryPortraitHeight = a3;
    [(PUPhotoEditToolbar *)self _invalidateAllConstraints];
  }
}

- (void)setUseLargeShortSideHeight:(BOOL)a3
{
  if (self->_useLargeShortSideHeight != a3)
  {
    self->_useLargeShortSideHeight = a3;
    [(PUPhotoEditToolbar *)self _invalidateAllConstraints];
  }
}

- (double)shortSideSize
{
  [(PUPhotoEditToolbar *)self tabBarHeight];
  double v4 = v3;
  BOOL v5 = [(PUPhotoEditToolbar *)self useLargeShortSideHeight];
  double result = 50.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)tabBarHeight
{
  if ([(PUPhotoEditToolbar *)self layoutOrientation] == 2)
  {
    double v3 = 39.0;
  }
  else if (self->_useiPhonePrimaryPortraitHeight)
  {
    double v3 = 50.0;
  }
  else
  {
    double v3 = 35.0;
  }
  [(PUPhotoEditToolbar *)self topActionButtonPadding];
  return v3 + v4;
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(PUPhotoEditToolbar *)self _updateBackgroundAnimated:a4];
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)setLongSideMargin:(double)a3
{
  if (self->_longSideMargin != a3)
  {
    self->_double longSideMargin = a3;
    if (self->_mainActionButtonConstraints)
    {
      -[PUPhotoEditToolbar removeConstraints:](self, "removeConstraints:");
      mainActionButtonConstraints = self->_mainActionButtonConstraints;
      self->_mainActionButtonConstraints = 0;

      [(PUPhotoEditToolbar *)self setNeedsUpdateConstraints];
    }
    if (self->_secondaryActionButtonConstraints)
    {
      -[PUPhotoEditToolbar removeConstraints:](self, "removeConstraints:");
      secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
      self->_secondaryActionButtonConstraints = 0;

      [(PUPhotoEditToolbar *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)_setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6 stretchableView:(id)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id obj = a5;
  double v13 = (UIButton *)a5;
  id v64 = a6;
  double v14 = (UIButton *)a6;
  m = (UIView *)a7;
  if (([v12 isEqualToArray:self->_toolButtons] & 1) == 0
    || self->_buttonSpacing != a4
    || self->_mainActionButton != v13
    || self->_secondaryActionButton != v14
    || self->_stretchableView != m)
  {
    id v57 = a7;
    v61 = v13;
    p_mainActionButton = &self->_mainActionButton;
    if ([(UIButton *)self->_mainActionButton isDescendantOfView:self]) {
      [(UIButton *)*p_mainActionButton removeFromSuperview];
    }
    v60 = v14;
    p_secondaryActionButton = &self->_secondaryActionButton;
    if ([(UIButton *)self->_secondaryActionButton isDescendantOfView:self]) {
      [(UIButton *)*p_secondaryActionButton removeFromSuperview];
    }
    uint64_t v59 = m;
    v62 = v12;
    p_stretchableView = &self->_stretchableView;
    if ([(UIView *)self->_stretchableView isDescendantOfView:self]) {
      [(UIView *)*p_stretchableView removeFromSuperview];
    }
    int64_t v58 = a4;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    int64_t v19 = self->_toolButtons;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v73 objects:v79 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(v19);
          }
          BOOL v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          if ([v24 isDescendantOfView:self]) {
            [v24 removeFromSuperview];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v73 objects:v79 count:16];
      }
      while (v21);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v55 = 456;
    id v25 = self->_toolButtonLayoutGuides;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v70 != v28) {
            objc_enumerationMutation(v25);
          }
          BOOL v30 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          objc_msgSend(v30, "owningView", v55);
          id v31 = (PUPhotoEditToolbar *)objc_claimAutoreleasedReturnValue();

          if (v31 == self) {
            [(PUPhotoEditToolbar *)self removeLayoutGuide:v30];
          }
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v27);
    }

    objc_storeStrong((id *)p_mainActionButton, obj);
    objc_super v32 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
    [v32 addSubview:*p_mainActionButton];

    objc_storeStrong((id *)p_secondaryActionButton, v64);
    v33 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
    [v33 addSubview:*p_secondaryActionButton];

    objc_storeStrong((id *)p_stretchableView, v57);
    v34 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
    [v34 addSubview:*p_stretchableView];

    id v12 = v62;
    v35 = (NSArray *)[v62 copy];
    toolButtons = self->_toolButtons;
    self->_toolButtons = v35;

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v37 = self->_toolButtons;
    uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v66 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v65 + 1) + 8 * k);
          v43 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
          [v43 addSubview:v42];
        }
        uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v65 objects:v77 count:16];
      }
      while (v39);
    }

    self->_int64_t buttonSpacing = v58;
    NSUInteger v44 = [(NSArray *)self->_toolButtons count];
    if (v44)
    {
      int64_t buttonSpacing = self->_buttonSpacing;
      if (buttonSpacing == 2) {
        uint64_t v46 = v44 + 1;
      }
      else {
        uint64_t v46 = 0;
      }
      if (buttonSpacing == 1) {
        uint64_t v47 = 2;
      }
      else {
        uint64_t v47 = v46;
      }
      v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v47, v55);
      for (m = v59; v47; --v47)
      {
        id v49 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        [(PUPhotoEditToolbar *)self addLayoutGuide:v49];
        [v48 addObject:v49];
      }
    }
    else
    {
      v48 = 0;
      m = v59;
    }
    v50 = (objc_class *)objc_msgSend(v48, "copy", v55);
    v51 = *(Class *)((char *)&self->super.super.super.isa + v56);
    *(Class *)((char *)&self->super.super.super.isa + v56) = v50;

    mainActionButtonConstraints = self->_mainActionButtonConstraints;
    self->_mainActionButtonConstraints = 0;

    secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
    self->_secondaryActionButtonConstraints = 0;

    toolButtonsConstraints = self->_toolButtonsConstraints;
    self->_toolButtonsConstraints = 0;

    [(PUPhotoEditToolbar *)self setNeedsUpdateConstraints];
    double v14 = v60;
    double v13 = v61;
  }
}

- (void)setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6
{
}

- (void)setToolButtons:(id)a3 mainActionButton:(id)a4 secondaryActionButton:(id)a5 stretchableView:(id)a6
{
  id v15 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUPhotoEditToolbar.m", 166, @"Invalid parameter not satisfying: %@", @"stretchableView != nil" object file lineNumber description];
  }
  [(PUPhotoEditToolbar *)self _setToolButtons:v15 buttonSpacing:0 mainActionButton:v11 secondaryActionButton:v12 stretchableView:v13];
}

- (void)setupWithLayoutOrientation:(int64_t)a3
{
  if ([(PUPhotoEditToolbar *)self layoutOrientation] && self->_layoutOrientation != a3)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolbar.m" lineNumber:160 description:@"Can only set layout orientation once"];
  }
  self->_layoutOrientation = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  BOOL v5 = (PUPhotoEditToolbar *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  mainToolbarContainer = self->_mainToolbarContainer;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(UIView *)mainToolbarContainer setTransform:v5];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar setBounds:](&v8, sel_setBounds_);
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:", x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ((unint64_t)(self->_layoutOrientation - 1) <= 1) {
    [(PUPhotoEditToolbar *)self shortSideSize];
  }
  double v5 = width;
  double v6 = height;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(PUPhotoEditToolbar *)self bounds];
  -[PUPhotoEditToolbar sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    [(PUPhotoEditToolbar *)self _updateBackgroundAnimated:0];
  }
}

- (PUPhotoEditToolbar)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PUPhotoEditToolbar;
  double v3 = -[PUPhotoEditToolbar initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PUPhotoEditToolbar *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_useLargeShortSideHeight = 0;
    v4->_useiPhonePrimaryPortraitHeight = 0;
    v4->_backgroundStyle = 1;
    objc_super v5 = [_PUPhotoEditToolbarPassThroughView alloc];
    uint64_t v6 = -[_PUPhotoEditToolbarPassThroughView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    mainToolbarContainer = v4->_mainToolbarContainer;
    v4->_mainToolbarContainer = (UIView *)v6;

    [(PUPhotoEditToolbar *)v4 addSubview:v4->_mainToolbarContainer];
    objc_super v8 = objc_alloc_init(_PUPhotoEditToolbarPassThroughView);
    gradientBackgroundView = v4->_gradientBackgroundView;
    v4->_gradientBackgroundView = &v8->super;

    double v10 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v10;

    id v12 = [(UIView *)v4->_gradientBackgroundView layer];
    [v12 addSublayer:v4->_gradientLayer];

    -[CAGradientLayer setAnchorPoint:](v4->_gradientLayer, "setAnchorPoint:", 0.0, 0.0);
    [(PUPhotoEditToolbar *)v4 insertSubview:v4->_gradientBackgroundView belowSubview:v4->_mainToolbarContainer];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel_accessibilityLongPressChanged_];
    accessibilityLongPressGestureRecognizer = v4->_accessibilityLongPressGestureRecognizer;
    v4->_accessibilityLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v13;

    [(UILongPressGestureRecognizer *)v4->_accessibilityLongPressGestureRecognizer setMinimumPressDuration:0.15];
    [(PUPhotoEditToolbar *)v4 addGestureRecognizer:v4->_accessibilityLongPressGestureRecognizer];
    id v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v16 = [v15 preferredContentSizeCategory];
    [(UILongPressGestureRecognizer *)v4->_accessibilityLongPressGestureRecognizer setEnabled:UIContentSizeCategoryIsAccessibilityCategory(v16)];
  }
  return v4;
}

@end