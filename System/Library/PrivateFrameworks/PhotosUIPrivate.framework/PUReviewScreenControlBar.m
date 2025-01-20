@interface PUReviewScreenControlBar
+ (CGRect)sendButtonAlignmentRectInHorizontalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4;
+ (CGRect)sendButtonAlignmentRectInVerticalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4 controlsCount:(unint64_t)a5;
+ (id)supportedButtons;
- (BOOL)_isButtonAvailable:(int64_t)a3;
- (BOOL)_isButtonEnabled:(int64_t)a3;
- (BOOL)shouldLayoutVertically;
- (BOOL)useTransparentBackground;
- (BOOL)useTransparentTouches;
- (CGPoint)layoutCenterAlignmentPoint;
- (NSArray)_buttonsForLayout;
- (NSSet)availableButtons;
- (NSSet)enabledButtons;
- (PUReviewScreenControlBar)initWithFrame:(CGRect)a3;
- (UIButton)editButton;
- (UIButton)funEffectsButton;
- (UIButton)markupButton;
- (UIButton)sendButton;
- (UIView)accessoryView;
- (id)_buttonForButtonType:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setButtonsForLayout:(id)a3;
- (void)_updateBackgroundTransparency;
- (void)_updateButtonText;
- (void)_updateButtonVisibility;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setAvailableButtons:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setEnabledButtons:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutCenterAlignmentPoint:(CGPoint)a3;
- (void)setShouldLayoutVertically:(BOOL)a3;
- (void)setUseTransparentBackground:(BOOL)a3;
- (void)setUseTransparentTouches:(BOOL)a3;
@end

@implementation PUReviewScreenControlBar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__buttonsForLayout, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_funEffectsButton, 0);
  objc_storeStrong((id *)&self->_markupButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_enabledButtons, 0);
  objc_storeStrong((id *)&self->_availableButtons, 0);
}

- (void)_setButtonsForLayout:(id)a3
{
}

- (NSArray)_buttonsForLayout
{
  return self->__buttonsForLayout;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (UIButton)funEffectsButton
{
  return self->_funEffectsButton;
}

- (UIButton)markupButton
{
  return self->_markupButton;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setUseTransparentTouches:(BOOL)a3
{
  self->_useTransparentTouches = a3;
}

- (BOOL)useTransparentTouches
{
  return self->_useTransparentTouches;
}

- (BOOL)useTransparentBackground
{
  return self->_useTransparentBackground;
}

- (CGPoint)layoutCenterAlignmentPoint
{
  double x = self->_layoutCenterAlignmentPoint.x;
  double y = self->_layoutCenterAlignmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)shouldLayoutVertically
{
  return self->_shouldLayoutVertically;
}

- (NSSet)enabledButtons
{
  return self->_enabledButtons;
}

- (NSSet)availableButtons
{
  return self->_availableButtons;
}

- (void)_updateBackgroundTransparency
{
  BOOL v3 = [(PUReviewScreenControlBar *)self useTransparentBackground];
  double v4 = 0.0;
  if (!v3) {
    double v4 = 0.3;
  }
  id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v4];
  [(PUReviewScreenControlBar *)self setBackgroundColor:v5];
}

- (void)_updateButtonText
{
  BOOL v3 = [(PUReviewScreenControlBar *)self shouldLayoutVertically];
  editButton = self->_editButton;
  if (v3)
  {
    id v5 = PULocalizedString(&stru_1F06BE7B8);
    [(UIButton *)editButton setTitle:v5 forState:0];

    funEffectsButton = self->_funEffectsButton;
    v7 = PULocalizedString(&stru_1F06BE7B8);
    [(UIButton *)funEffectsButton setTitle:v7 forState:0];

    markupButton = self->_markupButton;
    v9 = &stru_1F06BE7B8;
  }
  else
  {
    v10 = PULocalizedString(@"EDIT");
    [(UIButton *)editButton setTitle:v10 forState:0];

    v11 = self->_funEffectsButton;
    v12 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_FUN_EFFECTS");
    [(UIButton *)v11 setTitle:v12 forState:0];

    markupButton = self->_markupButton;
    v9 = @"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP";
  }
  PULocalizedString(v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](markupButton, "setTitle:forState:");
}

- (void)_updateButtonVisibility
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(id)objc_opt_class() supportedButtons];
  double v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "integerValue", (void)v15);
        v11 = [(PUReviewScreenControlBar *)self _buttonForButtonType:v10];
        BOOL v12 = [(PUReviewScreenControlBar *)self _isButtonAvailable:v10];
        BOOL v13 = [(PUReviewScreenControlBar *)self _isButtonEnabled:v10];
        [v11 setHidden:!v12];
        [v11 setEnabled:v13];
        if (v12
          || ([(PUReviewScreenControlBar *)self sendButton],
              v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v11 == v14))
        {
          [v4 addObject:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(PUReviewScreenControlBar *)self _setButtonsForLayout:v4];
}

- (id)_buttonForButtonType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v5 = [(PUReviewScreenControlBar *)self editButton];
      goto LABEL_9;
    case 3:
      id v5 = [(PUReviewScreenControlBar *)self markupButton];
      goto LABEL_9;
    case 4:
      id v5 = [(PUReviewScreenControlBar *)self funEffectsButton];
      goto LABEL_9;
    case 5:
      id v5 = [(PUReviewScreenControlBar *)self sendButton];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)_isButtonEnabled:(int64_t)a3
{
  uint64_t v4 = [(PUReviewScreenControlBar *)self enabledButtons];
  id v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)_isButtonAvailable:(int64_t)a3
{
  uint64_t v4 = [(PUReviewScreenControlBar *)self availableButtons];
  id v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUReviewScreenControlBar *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUReviewScreenControlBar *)self center];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setCenter:](&v11, sel_setCenter_, x, y);
  if (x != v7 || y != v9) {
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUReviewScreenControlBar *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (void)setAccessoryView:(id)a3
{
  id v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    CGFloat v9 = v5;
    double v8 = [(UIView *)accessoryView superview];

    if (v8 == self) {
      [(UIView *)*p_accessoryView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(PUReviewScreenControlBar *)self addSubview:*p_accessoryView];
    id v5 = v9;
  }
}

- (void)setEnabledButtons:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  id v5 = v4;
  if (self->_enabledButtons != v4)
  {
    CGFloat v9 = v4;
    char v6 = -[NSSet isEqual:](v4, "isEqual:");
    id v5 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSSet *)[(NSSet *)v9 copy];
      enabledButtons = self->_enabledButtons;
      self->_enabledButtons = v7;

      [(PUReviewScreenControlBar *)self _updateButtonVisibility];
      id v5 = v9;
    }
  }
}

- (void)setAvailableButtons:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  id v5 = v4;
  if (self->_availableButtons != v4)
  {
    CGFloat v9 = v4;
    char v6 = -[NSSet isEqual:](v4, "isEqual:");
    id v5 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSSet *)[(NSSet *)v9 copy];
      availableButtons = self->_availableButtons;
      self->_availableButtons = v7;

      [(PUReviewScreenControlBar *)self _updateButtonVisibility];
      [(PUReviewScreenControlBar *)self setNeedsLayout];
      id v5 = v9;
    }
  }
}

- (void)setUseTransparentBackground:(BOOL)a3
{
  if (self->_useTransparentBackground != a3)
  {
    self->_useTransparentBackground = a3;
    [(PUReviewScreenControlBar *)self _updateBackgroundTransparency];
  }
}

- (void)setLayoutCenterAlignmentPoint:(CGPoint)a3
{
  if (a3.x != self->_layoutCenterAlignmentPoint.x || a3.y != self->_layoutCenterAlignmentPoint.y)
  {
    self->_layoutCenterAlignmentPoint = a3;
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (void)setShouldLayoutVertically:(BOOL)a3
{
  if (self->_shouldLayoutVertically != a3)
  {
    self->_shouldLayoutVerticalldouble y = a3;
    [(PUReviewScreenControlBar *)self _updateButtonText];
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (PUReviewScreenControlBar *)objc_claimAutoreleasedReturnValue();
  if ([(PUReviewScreenControlBar *)self useTransparentTouches] && v5 == self)
  {

    id v5 = 0;
  }
  return v5;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PUReviewScreenControlBar;
  [(PUReviewScreenControlBar *)&v4 didMoveToWindow];
  uint64_t v3 = [(PUReviewScreenControlBar *)self window];

  if (v3) {
    [(PUReviewScreenControlBar *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v100.receiver = self;
  v100.super_class = (Class)PUReviewScreenControlBar;
  [(PUReviewScreenControlBar *)&v100 layoutSubviews];
  [(PUReviewScreenControlBar *)self bounds];
  double v86 = v3;
  double v87 = v4;
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = [(PUReviewScreenControlBar *)self sendButton];
  [(PUReviewScreenControlBar *)self layoutCenterAlignmentPoint];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(PUReviewScreenControlBar *)self window];
  -[PUReviewScreenControlBar convertPoint:fromView:](self, "convertPoint:fromView:", v14, v11, v13);
  double v16 = v15;
  double v18 = v17;

  v19 = [(PUReviewScreenControlBar *)self window];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  BOOL v28 = +[PUReviewScreenUtilities useCompactControlBarButtonsForReferenceBounds:](PUReviewScreenUtilities, "useCompactControlBarButtonsForReferenceBounds:", v21, v23, v25, v27);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v29 = [(PUReviewScreenControlBar *)self editButton];
  v103[0] = v29;
  v30 = [(PUReviewScreenControlBar *)self markupButton];
  v103[1] = v30;
  v31 = [(PUReviewScreenControlBar *)self funEffectsButton];
  v103[2] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v97 != v35) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * i) setUseCompactSize:v28];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v34);
  }

  if ([(PUReviewScreenControlBar *)self shouldLayoutVertically])
  {
    v37 = [(PUReviewScreenControlBar *)self _buttonsForLayout];
    v38 = [v37 reverseObjectEnumerator];

    v39 = [(PUReviewScreenControlBar *)self _buttonsForLayout];
    if ([v39 count])
    {
      v40 = [(PUReviewScreenControlBar *)self _buttonsForLayout];
      uint64_t v41 = [v40 count] - 1;
    }
    else
    {
      uint64_t v41 = 0;
    }

    double v60 = v6;
    objc_msgSend((id)objc_opt_class(), "sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:", v41, v86, v87, v6, v8, v16, v18);
    objc_msgSend(v9, "setFrame:");
    [v38 nextObject];

    [v9 frame];
    CGFloat v62 = v61;
    double v64 = v63;
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v69 = v38;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v92 objects:v102 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v71; ++j)
        {
          if (*(void *)v93 != v72) {
            objc_enumerationMutation(v69);
          }
          v74 = *(void **)(*((void *)&v92 + 1) + 8 * j);
          v107.origin.double x = v62;
          v107.origin.double y = v64;
          v107.size.double width = v66;
          v107.size.double height = v68;
          double v64 = CGRectGetMaxY(v107) + 30.0;
          CGFloat v68 = 42.0;
          UIRectCenteredAboutPointScale();
          CGFloat v62 = v75;
          objc_msgSend(v74, "frameForAlignmentRect:");
          objc_msgSend(v74, "setFrame:", PURoundRectToPixel(v76, v77, v78, v79));
          CGFloat v66 = 42.0;
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v92 objects:v102 count:16];
        CGFloat v68 = 42.0;
        CGFloat v66 = 42.0;
      }
      while (v71);
    }

    double v42 = v60;
  }
  else
  {
    double v85 = v8;
    double v42 = v6;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v43 = [(PUReviewScreenControlBar *)self _buttonsForLayout];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v89;
      double v47 = 20.0;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v89 != v46) {
            objc_enumerationMutation(v43);
          }
          v49 = *(void **)(*((void *)&v88 + 1) + 8 * k);
          [v49 intrinsicContentSize];
          CGFloat v51 = v50;
          CGFloat v53 = v52;
          UIRectCenteredAboutPointScale();
          CGFloat v55 = v54;
          [v49 frameForAlignmentRect:v47];
          objc_msgSend(v49, "setFrame:", PURoundRectToPixel(v56, v57, v58, v59));
          v106.origin.double x = v47;
          v106.origin.double y = v55;
          v106.size.double width = v51;
          v106.size.double height = v53;
          double v47 = CGRectGetMaxX(v106) + 30.0;
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v45);
    }

    objc_msgSend((id)objc_opt_class(), "sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:", v86, v87, v6, v85, v16, v18);
    objc_msgSend(v9, "setFrame:");
  }
  v80 = +[PUScrubberSettings sharedInstance];
  [v80 topOutset];
  double v82 = -v81;
  double v83 = v81 + 44.0;
  v84 = [(PUReviewScreenControlBar *)self accessoryView];
  objc_msgSend(v84, "setFrame:", 0.0, v82, v42, v83);
}

- (PUReviewScreenControlBar)initWithFrame:(CGRect)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)PUReviewScreenControlBar;
  double v3 = -[PUReviewScreenControlBar initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PUReviewScreenControlBar *)v3 _updateBackgroundTransparency];
    uint64_t v5 = +[PUReviewScreenControlBarButton buttonWithType:1];
    editButton = v4->_editButton;
    v4->_editButton = (UIButton *)v5;

    double v7 = v4->_editButton;
    double v8 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenEditButton");
    [(UIButton *)v7 setImage:v8 forState:0];

    uint64_t v9 = +[PUReviewScreenControlBarButton buttonWithType:1];
    markupButton = v4->_markupButton;
    v4->_markupButton = (UIButton *)v9;

    double v11 = v4->_markupButton;
    double v12 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenMarkupButton");
    [(UIButton *)v11 setImage:v12 forState:0];

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenFunEffectsInactiveButton");
    double v14 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenFunEffectsActiveButton");
    double v15 = [MEMORY[0x1E4FB1618] whiteColor];
    double v16 = objc_msgSend(v14, "pu_tintedImageWithColor:", v15);
    uint64_t v17 = [v16 imageWithRenderingMode:1];

    uint64_t v18 = +[PUReviewScreenControlBarButton buttonWithType:1];
    funEffectsButton = v4->_funEffectsButton;
    v4->_funEffectsButton = (UIButton *)v18;

    double v20 = v4->_funEffectsButton;
    double v21 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_FUN_EFFECTS");
    [(UIButton *)v20 setTitle:v21 forState:0];

    v48 = (void *)v13;
    [(UIButton *)v4->_funEffectsButton setImage:v13 forState:0];
    [(UIButton *)v4->_funEffectsButton setImage:v17 forState:4];
    double v47 = (void *)v17;
    [(UIButton *)v4->_funEffectsButton setImage:v17 forState:5];
    uint64_t v22 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    sendButton = v4->_sendButton;
    v4->_sendButton = (UIButton *)v22;

    double v24 = v4->_sendButton;
    double v25 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenSendButton");
    double v26 = [v25 imageWithRenderingMode:1];
    [(UIButton *)v24 setImage:v26 forState:0];

    [(UIButton *)v4->_sendButton setContentHorizontalAlignment:3];
    [(UIButton *)v4->_sendButton setContentVerticalAlignment:3];
    [(PUReviewScreenControlBar *)v4 _updateButtonText];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v55[0] = v4->_editButton;
    v55[1] = v4->_markupButton;
    v55[2] = v4->_funEffectsButton;
    obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
    uint64_t v27 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v51;
      uint64_t v30 = *MEMORY[0x1E4FB27D0];
      uint64_t v31 = *MEMORY[0x1E4FB28E0];
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          [(PUReviewScreenControlBar *)v4 addSubview:v33];
          uint64_t v34 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.560784314];
          [v33 setTitleColor:v34 forState:0];

          uint64_t v35 = [MEMORY[0x1E4FB1618] whiteColor];
          [v33 setTitleColor:v35 forState:4];

          v36 = [MEMORY[0x1E4FB1618] whiteColor];
          [v33 setTitleColor:v36 forState:5];

          v37 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v30];
          [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v31 compatibleWithTraitCollection:v37];
          v39 = v38 = v4;
          v40 = [v33 titleLabel];
          [v40 setFont:v39];

          double v4 = v38;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v28);
    }

    uint64_t v41 = [MEMORY[0x1E4FB1618] whiteColor];
    [(PUReviewScreenControlBar *)v4 setTintColor:v41];

    [(PUReviewScreenControlBar *)v4 addSubview:v4->_sendButton];
    uint64_t v42 = [MEMORY[0x1E4F1CAD0] set];
    availableButtons = v4->_availableButtons;
    v4->_availableButtons = (NSSet *)v42;

    uint64_t v44 = [MEMORY[0x1E4F1CAD0] set];
    enabledButtons = v4->_enabledButtons;
    v4->_enabledButtons = (NSSet *)v44;

    [(PUReviewScreenControlBar *)v4 _updateButtonVisibility];
  }
  return v4;
}

+ (CGRect)sendButtonAlignmentRectInVerticalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4 controlsCount:(unint64_t)a5
{
  double height = a3.size.height;
  UIRectCenteredAboutPointScale();
  double v10 = (height - ((double)a5 * 72.0 + 66.0)) * 0.5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v10;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)sendButtonAlignmentRectInHorizontalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  UIRectCenteredAboutPointScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v14 = CGRectGetMaxX(v18) + -20.0 + -56.0;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

+ (id)supportedButtons
{
  if (supportedButtons_onceToken != -1) {
    dispatch_once(&supportedButtons_onceToken, &__block_literal_global_77196);
  }
  v2 = (void *)supportedButtons_supportedButtons;
  return v2;
}

void __44__PUReviewScreenControlBar_supportedButtons__block_invoke()
{
  v0 = (void *)supportedButtons_supportedButtons;
  supportedButtons_supportedButtons = (uint64_t)&unk_1F078B4C8;
}

@end