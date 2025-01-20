@interface NCToggleControl
+ (double)effectiveHeight:(BOOL)a3;
+ (id)_labelFont:(BOOL)a3;
+ (id)dismissControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4;
+ (id)showLessControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4 glyphOrientation:(int64_t)a5;
+ (void)performWithDefaultExpansionAnimation:(id)a3 completion:(id)a4;
- (BOOL)_wasExpandedPriorToControlEvent;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)clickInteractionPresenterShouldBegin:(id)a3;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)isExpanded;
- (BOOL)isGlyphAlwaysVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_unexpandedFrame;
- (CGSize)_cachedEffectiveMaxExpandedSize;
- (CGSize)_cachedEffectiveMaxUnexpandedSize;
- (CGSize)_effectiveExpandedSize;
- (CGSize)_effectiveGlyphSize;
- (CGSize)_effectiveUnexpandedSize;
- (CGSize)_sizeThatFits:(CGSize)a3 whenExpanded:(BOOL)a4;
- (NCClickInteractionPresenter)_previewInteractionPlatterPresenter;
- (NCToggleControlDelegate)delegate;
- (NCToggleControlPair)_managingPair;
- (NSString)clearAllText;
- (NSString)preferredContentSizeCategory;
- (NSString)title;
- (UILabel)_titleLabel;
- (UIPointerInteraction)pointerInteraction;
- (double)_cornerRadius;
- (double)_effectiveHeight;
- (double)_effectiveInternalPadding;
- (double)_effectiveLeadingTrailingPadding;
- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4;
- (id)_labelFont;
- (id)containerViewForClickInteractionPresenter:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)_toggleControlType;
- (unsigned)anchorEdge;
- (void)_configureTitleLabelIfNecessaryWithTitle:(id)a3;
- (void)_handleSecondaryClickEventForGestureRecognizer:(id)a3;
- (void)_handleTouchUpInsideWithEvent:(id)a3;
- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4;
- (void)_setManagingPair:(id)a3;
- (void)_updateTitleLabelTextAttributes;
- (void)_updateTitleLabelVisualStyling;
- (void)addTarget:(id)a3 forPreviewInteractionPresentedContentWithAction:(SEL)a4;
- (void)clickInteractionPresenterDidBeginInteraction:(id)a3;
- (void)clickInteractionPresenterDidCommitToPresentation:(id)a3;
- (void)clickInteractionPresenterDidDismiss:(id)a3;
- (void)clickInteractionPresenterDidPresent:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAnchorEdge:(unsigned int)a3;
- (void)setClearAllText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedPriorToControlEvent:(BOOL)a3;
- (void)setGlyphAlwaysVisible:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPreviewInteractionPlatterPresenter:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisualStyle:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCToggleControl

+ (id)dismissControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4
{
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___NCToggleControl;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v14, sel_dismissControlWithMaterialRecipe_, a3);
  v6[67] = 1;
  v7 = NCUserNotificationsUIKitFrameworkBundle();
  v8 = objc_msgSend(v7, "localizedStringForKey:value:table:", @"NOTIFICATION_LIST_CLEAR", &stru_1F2F516F8, 0, v14.receiver, v14.super_class);
  [v6 setTitle:v8];

  [v6 setClearAllText:v5];
  [v6 setAnchorEdge:2];
  [v6 setExpanded:0];
  [v6 setAccessibilityIdentifier:@"clear-button"];
  v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v6];
    [v6 setPointerInteraction:v11];
    [v6 addInteraction:v11];
    v12 = objc_alloc_init(NCSecondaryClickGestureRecognizer);
    [v6 addGestureRecognizer:v12];
    [(NCSecondaryClickGestureRecognizer *)v12 addTarget:v6 action:sel__handleSecondaryClickEventForGestureRecognizer_];
  }

  return v6;
}

+ (id)showLessControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4 glyphOrientation:(int64_t)a5
{
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)a1) initWithMaterialRecipe:a3];
  v9[67] = 2;
  uint64_t v10 = (void *)MEMORY[0x1E4FB1818];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v10 imageNamed:@"chev" inBundle:v11 compatibleWithTraitCollection:0];
  v13 = [v12 imageWithRenderingMode:2];

  id v14 = v13;
  uint64_t v15 = [v14 CGImage];
  v16 = (void *)MEMORY[0x1E4FB1818];
  [v14 scale];
  v17 = objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v15, a5);

  [v9 setGlyph:v17];
  v18 = NCUserNotificationsUIKitFrameworkBundle();
  v19 = [v18 localizedStringForKey:@"NOTIFICATION_LIST_SHOW_LESS" value:&stru_1F2F516F8 table:0];
  [v9 setTitle:v19];

  [v9 setClearAllText:v8];
  [v9 setAnchorEdge:2];
  [v9 setGlyphAlwaysVisible:1];
  [v9 setExpanded:1];
  v20 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if (v21 == 1)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v9];
    [v9 setPointerInteraction:v22];
    [v9 addInteraction:v22];
  }

  return v9;
}

+ (void)performWithDefaultExpansionAnimation:(id)a3 completion:(id)a4
{
}

+ (double)effectiveHeight:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v6);

  if (IsAX) {
    double v8 = 21.0;
  }
  else {
    double v8 = 34.0;
  }
  v9 = [a1 _labelFont:v3];
  [v9 _scaledValueForValue:v8];
  if (v10 > v8) {
    double v8 = v10;
  }

  return v8;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  v4 = [(NCToggleControl *)self title];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(NCToggleControl *)self _configureTitleLabelIfNecessaryWithTitle:v6];
  }
}

- (void)setClearAllText:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllText, a3);
  id v5 = a3;
  [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter setTitle:v5];
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    v4 = [(NCToggleControl *)self pointerInteraction];
    [v4 invalidate];

    [(NCToggleControl *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock])
    {
      [(NCToggleControl *)self layoutIfNeeded];
    }
  }
}

- (void)addTarget:(id)a3 forPreviewInteractionPresentedContentWithAction:(SEL)a4
{
  id v10 = a3;
  if ([(NCToggleControl *)self _toggleControlType] == 1)
  {
    id v6 = [[NCClickInteractionPresenter alloc] initWithTitle:self->_clearAllText sourceView:self materialRecipe:[(PLGlyphControl *)self materialRecipe]];
    previewInteractionPlatterPresenter = self->_previewInteractionPlatterPresenter;
    self->_previewInteractionPlatterPresenter = v6;

    [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter setTitle:self->_clearAllText];
    double v8 = self->_previewInteractionPlatterPresenter;
    v9 = [(NCToggleControl *)self traitCollection];
    -[NCClickInteractionPresenter setOverrideUserInterfaceStyle:](v8, "setOverrideUserInterfaceStyle:", [v9 userInterfaceStyle]);

    [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter addTarget:v10 action:a4];
    [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter setDelegate:self];
  }
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter dismissModalFullScreenIfNeeded];
}

- (void)setVisualStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControl;
  [(PLGlyphControl *)&v4 setVisualStyle:a3];
  [(NCToggleControl *)self _updateTitleLabelVisualStyling];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)NCToggleControl;
  BOOL result = -[NCToggleControl pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4);
  if (!self->_expanded)
  {
    [(NCToggleControl *)self _unexpandedFrame];
    v9.CGFloat x = x;
    v9.CGFloat y = y;
    return CGRectContainsPoint(v10, v9);
  }
  return result;
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)NCToggleControl;
  [(PLGlyphControl *)&v57 layoutSubviews];
  BOOL expanded = self->_expanded;
  int v4 = [(NCToggleControl *)self _shouldReverseLayoutDirection];
  int v5 = [MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock];
  [(NCToggleControl *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(PLGlyphControl *)self _glyphView];
  [(NCToggleControl *)self _unexpandedFrame];
  double v16 = v15;
  double v18 = v17;
  double v55 = v19;
  double v56 = v20;
  double v21 = v13;
  double v54 = v11;
  double v22 = v11;
  double v23 = v9;
  double v24 = v7;
  if (v14)
  {
    [(NCToggleControl *)self _effectiveGlyphSize];
    BSRectWithSize();
    double v48 = _NCMainScreenScale();
    UIRectCenteredIntegralRectScale();
    uint64_t v25 = [v14 setFrame:*(void *)&v48];
    if (!self->_glyphAlwaysVisible)
    {
      double v26 = 0.0;
      if (!expanded) {
        double v26 = 1.0;
      }
      if (v5) {
        __33__NCToggleControl_layoutSubviews__block_invoke(v26, 1.0, v25, v14);
      }
      else {
        [v14 setAlpha:v26];
      }
    }
    double v21 = v13;
    double v22 = v54;
    double v24 = v7;
    if (!expanded)
    {
      double v22 = v55;
      double v21 = v56;
      double v9 = v18;
      double v24 = v16;
    }
  }
  double v53 = v22;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    double v50 = v21;
    double v51 = v18;
    double v52 = v16;
    if (self->_glyphAlwaysVisible)
    {
      double v49 = v9;
      BOOL v28 = self->_anchorEdge == 0;
      -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v54, v13);
      BSRectWithSize();
      CGFloat v29 = v23;
      UIRectCenteredIntegralRect();
      CGFloat v31 = v13;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      if ((v4 ^ v28))
      {
        CGFloat v38 = v30;
        v58.origin.CGFloat x = v7;
        v58.origin.CGFloat y = v29;
        v58.size.width = v54;
        v58.size.height = v31;
        double Width = CGRectGetWidth(v58);
        [(NCToggleControl *)self _effectiveLeadingTrailingPadding];
        double v41 = Width - v40;
        v59.origin.CGFloat x = v38;
        v59.origin.CGFloat y = v33;
        v59.size.width = v35;
        v59.size.height = v37;
        double v7 = v41 - CGRectGetWidth(v59);
      }
      else
      {
        [(NCToggleControl *)self _effectiveLeadingTrailingPadding];
        double v7 = v42;
      }
      double v9 = v49;
    }
    else
    {
      double v37 = v13;
      double v33 = v23;
      double v35 = v54;
    }
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v7, v33, v35, v37);
    if (expanded) {
      double v43 = 1.0;
    }
    else {
      double v43 = 0.0;
    }
    v44 = self->_titleLabel;
    if (v5)
    {
      v45 = [(UILabel *)self->_titleLabel text];
      uint64_t v46 = [v45 length];
      __33__NCToggleControl_layoutSubviews__block_invoke(v43, (double)(unint64_t)v46, v46, v44);
    }
    else
    {
      [(UILabel *)self->_titleLabel setAlpha:v43];
    }
    double v18 = v51;
    double v16 = v52;
    double v21 = v50;
  }
  v47 = [(PLGlyphControl *)self _backgroundMaterialView];
  objc_msgSend(v47, "setFrame:", v24, v9, v53, v21);

  -[NCClickInteractionPresenter setSourceViewVisibleRect:](self->_previewInteractionPlatterPresenter, "setSourceViewVisibleRect:", v16, v18, v55, v56);
}

void __33__NCToggleControl_layoutSubviews__block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  double v20 = a1;
  double v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __33__NCToggleControl_layoutSubviews__block_invoke_2;
  double v12 = &unk_1E6A94688;
  double v15 = a1;
  id v8 = v6;
  double v16 = a2;
  id v13 = v8;
  id v14 = &v17;
  [v7 performWithoutAnimation:&v9];
  objc_msgSend(v8, "setAlpha:", v18[3], v9, v10, v11, v12);

  _Block_object_dispose(&v17, 8);
}

double __33__NCToggleControl_layoutSubviews__block_invoke_2(uint64_t a1)
{
  if (*(double *)(a1 + 48) <= 0.0)
  {
    double result = *(double *)(a1 + 56) * -0.5;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  else
  {
    [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 56) * -0.25];
  }
  return result;
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  self->_expandedPriorToControlEvent = self->_expanded;
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControl;
  [(PLGlyphControl *)&v4 _sendActionsForEvents:a3 withEvent:a4];
}

- (void)_handleTouchUpInsideWithEvent:(id)a3
{
  id v4 = a3;
  if (![(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter isPresented])
  {
    BOOL expandedPriorToControlEvent = self->_expandedPriorToControlEvent;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managingPair);
    [WeakRetained _handleTouchUpInside:self withEvent:v4];
    if (expandedPriorToControlEvent)
    {
      v11.receiver = self;
      v11.super_class = (Class)NCToggleControl;
      [(PLGlyphControl *)&v11 _handleTouchUpInsideWithEvent:v4];
    }
    else if (!WeakRetained)
    {
      BOOL expanded = self->_expanded;
      id v8 = objc_opt_class();
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__NCToggleControl__handleTouchUpInsideWithEvent___block_invoke;
      v9[3] = &unk_1E6A946B0;
      v9[4] = self;
      BOOL v10 = expanded;
      [v8 performWithDefaultExpansionAnimation:v9 completion:0];
    }
  }
}

uint64_t __49__NCToggleControl__handleTouchUpInsideWithEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExpanded:*(unsigned char *)(a1 + 40) == 0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCToggleControl;
  [(NCToggleControl *)&v6 traitCollectionDidChange:a3];
  previewInteractionPlatterPresenter = self->_previewInteractionPlatterPresenter;
  int v5 = [(NCToggleControl *)self traitCollection];
  -[NCClickInteractionPresenter setOverrideUserInterfaceStyle:](previewInteractionPlatterPresenter, "setOverrideUserInterfaceStyle:", [v5 userInterfaceStyle]);

  [(NCClickInteractionPresenter *)self->_previewInteractionPlatterPresenter contentSizeCategoryDidChange];
}

- (id)containerViewForClickInteractionPresenter:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v5 = [WeakRetained containerViewForToggleControlClickInteractionPresentedContent:self];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)clickInteractionPresenterShouldBegin:(id)a3
{
  if ([(NCToggleControl *)self _toggleControlType] == 1) {
    return ![(NCToggleControl *)self isExpanded];
  }
  else {
    return 1;
  }
}

- (void)clickInteractionPresenterDidCommitToPresentation:(id)a3
{
  [(NCToggleControl *)self cancelTrackingWithEvent:0];

  [(NCToggleControl *)self setEnabled:0];
}

- (void)clickInteractionPresenterDidBeginInteraction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained toggleControlDidBeginClickInteraction:self];
  }
}

- (void)clickInteractionPresenterDidPresent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained toggleControlDidPresentClickInteractionPresentedContent:self];
  }
}

- (void)clickInteractionPresenterDidDismiss:(id)a3
{
  [(NCToggleControl *)self setEnabled:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained toggleControlDidDismssClickInteractionPresentedContent:self];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    [(NCToggleControl *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategorCGFloat y = &self->_preferredContentSizeCategory;
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
    preferredContentSizeCategorCGFloat y = *p_preferredContentSizeCategory;
  }

  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];

  int v5 = [(NCToggleControl *)self preferredContentSizeCategory];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(NCToggleControl *)self setPreferredContentSizeCategory:v4];
    CGSize v7 = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_cachedEffectiveMaxUnexpandedSize = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_cachedEffectiveMaxExpandedSize = v7;
    [(NCToggleControl *)self _updateTitleLabelTextAttributes];
    [(NCToggleControl *)self setNeedsLayout];
  }

  return v6 ^ 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if ([(NCToggleControl *)self isExpanded]) {
    [(NCToggleControl *)self bounds];
  }
  else {
    [(NCToggleControl *)self _unexpandedFrame];
  }
  char v6 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v6, "regionWithRect:identifier:", @"notification-list-control");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  int v5 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v6 = a4;
  CGSize v7 = (void *)[[v5 alloc] initWithView:self];
  id v8 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v7];
  [v6 rect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [(NCToggleControl *)self superview];
  -[NCToggleControl convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = (void *)MEMORY[0x1E4FB1AE0];
  [(NCToggleControl *)self _effectiveHeight];
  BOOL v28 = objc_msgSend(v26, "shapeWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v27 * 0.5);
  CGFloat v29 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:v28];

  return v29;
}

- (void)_handleSecondaryClickEventForGestureRecognizer:(id)a3
{
  if ([a3 state] == 1)
  {
    previewInteractionPlatterPresenter = self->_previewInteractionPlatterPresenter;
    [(NCClickInteractionPresenter *)previewInteractionPlatterPresenter presentModalFullScreen];
  }
}

+ (id)_labelFont:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  }
  else {
  id v4 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  }
  int v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v6 = [v5 preferredContentSizeCategory];

  CGSize v7 = v6;
  if (v3)
  {
    id v8 = (NSString *)*MEMORY[0x1E4FB2788];
    if (UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]) == NSOrderedDescending) {
      CGSize v7 = v8;
    }
    else {
      CGSize v7 = v6;
    }
  }
  double v9 = [v4 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:8 contentSizeCategory:v7];

  return v9;
}

- (id)_labelFont
{
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    [(UILabel *)titleLabel font];
  }
  else {
  id v4 = objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  }

  return v4;
}

- (void)_updateTitleLabelTextAttributes
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    [(UILabel *)titleLabel setFont:v4];

    [(NCToggleControl *)self setNeedsLayout];
  }
}

- (void)_updateTitleLabelVisualStyling
{
}

- (void)_configureTitleLabelIfNecessaryWithTitle:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!self->_titleLabel)
  {
    id v9 = v4;
    uint64_t v6 = [v4 length];
    int v5 = v9;
    if (v6)
    {
      CGSize v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v7;

      [(UILabel *)self->_titleLabel setText:v9];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      [(UILabel *)self->_titleLabel setContentMode:4];
      [(NCToggleControl *)self _updateTitleLabelTextAttributes];
      [(NCToggleControl *)self _updateTitleLabelVisualStyling];
      [(NCToggleControl *)self addSubview:self->_titleLabel];
      [(NCToggleControl *)self setNeedsLayout];
      int v5 = v9;
    }
  }
}

- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4
{
  objc_msgSend(a4, "_scaledValueForValue:");
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (double)_effectiveHeight
{
  BOOL v3 = objc_opt_class();
  BOOL v4 = [(NCToggleControl *)self adjustsFontForContentSizeCategory];

  [v3 effectiveHeight:v4];
  return result;
}

- (double)_effectiveLeadingTrailingPadding
{
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX) {
    double v6 = 6.0;
  }
  else {
    double v6 = 12.0;
  }
  CGSize v7 = [(NCToggleControl *)self _labelFont];
  [(NCToggleControl *)self _effectiveValueForMinValue:v7 withFont:v6];
  double v9 = v8;

  return v9;
}

- (double)_effectiveInternalPadding
{
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX) {
    double v6 = 3.0;
  }
  else {
    double v6 = 6.0;
  }
  CGSize v7 = [(NCToggleControl *)self _labelFont];
  [(NCToggleControl *)self _effectiveValueForMinValue:v7 withFont:v6];
  double v9 = v8;

  return v9;
}

- (CGSize)_cachedEffectiveMaxExpandedSize
{
  p_cachedEffectiveMaxExpandedSize = &self->_cachedEffectiveMaxExpandedSize;
  double width = self->_cachedEffectiveMaxExpandedSize.width;
  double height = self->_cachedEffectiveMaxExpandedSize.height;
  if (width == 0.0 && height == 0.0)
  {
    double width = _MaxToggleControlSize(1, [(NCToggleControl *)self adjustsFontForContentSizeCategory]);
    p_cachedEffectiveMaxExpandedSize->double width = width;
    p_cachedEffectiveMaxExpandedSize->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_effectiveExpandedSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingPair);
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    if ([(NCToggleControl *)self _toggleControlType] == 1)
    {

LABEL_5:
      [(NCToggleControl *)self _cachedEffectiveMaxExpandedSize];
      goto __NCToggleControl__effectiveExpandedSize_;
    }
    unint64_t v5 = [(NCToggleControl *)self _toggleControlType];

    if (v5 == 2) {
      goto LABEL_5;
    }
  }

  -[NCToggleControl _sizeThatFits:whenExpanded:](self, "_sizeThatFits:whenExpanded:", 1, 1.79769313e308, 1.79769313e308);
__NCToggleControl__effectiveExpandedSize_:
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)_cachedEffectiveMaxUnexpandedSize
{
  p_cachedEffectiveMaxUnexpandedSize = &self->_cachedEffectiveMaxUnexpandedSize;
  double width = self->_cachedEffectiveMaxUnexpandedSize.width;
  double height = self->_cachedEffectiveMaxUnexpandedSize.height;
  if (width == 0.0 && height == 0.0)
  {
    +[NCToggleControl effectiveHeight:[(NCToggleControl *)self adjustsFontForContentSizeCategory]];
    double height = width;
    p_cachedEffectiveMaxUnexpandedSize->double width = width;
    p_cachedEffectiveMaxUnexpandedSize->double height = width;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_effectiveUnexpandedSize
{
  if ([(NCToggleControl *)self _toggleControlType] == 1
    || [(NCToggleControl *)self _toggleControlType] == 2)
  {
    [(NCToggleControl *)self _cachedEffectiveMaxUnexpandedSize];
  }
  else
  {
    -[NCToggleControl _sizeThatFits:whenExpanded:](self, "_sizeThatFits:whenExpanded:", 0, 1.79769313e308, 1.79769313e308);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_cornerRadius
{
  [(NCToggleControl *)self _effectiveUnexpandedSize];
  return v2 * 0.5;
}

- (CGSize)_effectiveGlyphSize
{
  double v3 = [(PLGlyphControl *)self glyph];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  if (v5 <= v7) {
    double v5 = v7;
  }
  double v8 = [(NCToggleControl *)self _labelFont];
  [(NCToggleControl *)self _effectiveValueForMinValue:v8 withFont:v5];
  double v10 = v9;

  double v11 = v10;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 whenExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  [(NCToggleControl *)self _effectiveLeadingTrailingPadding];
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  }
  uint64_t v8 = [(PLGlyphControl *)self _glyphView];
  double v9 = (void *)v8;
  if (self->_titleLabel) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = v10 || !v4;
  if (v11)
  {
    if (!v8) {
      goto LABEL_20;
    }
  }
  else if (self->_glyphAlwaysVisible)
  {
    [(NCToggleControl *)self _effectiveInternalPadding];
  }
  if (!v4 || self->_glyphAlwaysVisible) {
    [(NCToggleControl *)self _effectiveGlyphSize];
  }
LABEL_20:
  [(NCToggleControl *)self _effectiveHeight];
  _NCMainScreenScale();
  UISizeRoundToScale();
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGRect)_unexpandedFrame
{
  [(NCToggleControl *)self _effectiveUnexpandedSize];
  BSRectWithSize();
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  BOOL v11 = self->_anchorEdge == 0;
  if ((([(NCToggleControl *)self _shouldReverseLayoutDirection] ^ v11) & 1) == 0)
  {
    [(NCToggleControl *)self bounds];
    double Width = CGRectGetWidth(v17);
    v18.origin.CGFloat x = v4;
    v18.origin.CGFloat y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double v4 = Width - CGRectGetWidth(v18);
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (unsigned)anchorEdge
{
  return self->_anchorEdge;
}

- (void)setAnchorEdge:(unsigned int)a3
{
  self->_anchorEdge = a3;
}

- (BOOL)isGlyphAlwaysVisible
{
  return self->_glyphAlwaysVisible;
}

- (void)setGlyphAlwaysVisible:(BOOL)a3
{
  self->_glyphAlwaysVisible = a3;
}

- (NCToggleControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCToggleControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)_toggleControlType
{
  return self->_toggleControlType;
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (NCToggleControlPair)_managingPair
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingPair);

  return (NCToggleControlPair *)WeakRetained;
}

- (void)_setManagingPair:(id)a3
{
}

- (NCClickInteractionPresenter)_previewInteractionPlatterPresenter
{
  return self->_previewInteractionPlatterPresenter;
}

- (void)setPreviewInteractionPlatterPresenter:(id)a3
{
}

- (BOOL)_wasExpandedPriorToControlEvent
{
  return self->_expandedPriorToControlEvent;
}

- (void)setExpandedPriorToControlEvent:(BOOL)a3
{
  self->_BOOL expandedPriorToControlEvent = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_previewInteractionPlatterPresenter, 0);
  objc_destroyWeak((id *)&self->_managingPair);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearAllText, 0);

  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end