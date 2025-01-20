@interface VUIButton
- (BOOL)_hasBackgroundImage;
- (BOOL)_hasImage;
- (BOOL)_hasSubtitle;
- (BOOL)_hasTitle;
- (BOOL)allowsUberTinting;
- (BOOL)hasDisclaimerText;
- (BOOL)imageTrailsTextContent;
- (BOOL)isTintColorAndBackgroundColorSaturated;
- (BOOL)scalesLargeContentImage;
- (BOOL)supportsLongPress;
- (BOOL)usesSymbolPointerInteraction;
- (CGPoint)_centerWithViewSize:(CGSize)a3 withParentSize:(CGSize)a4;
- (CGRect)_barButtonPointerShapeRect;
- (CGRect)_symbolButtonPointerShapeRect;
- (CGSize)_calculateContentSizeForCustomButtonThatFit:(CGSize)a3;
- (CGSize)_calculateContentSizeForImageThatFit:(CGSize)a3;
- (CGSize)_calculateContentSizeForPrimaryButtonThatFit:(CGSize)a3;
- (CGSize)_computeSizeThatFits:(CGSize)a3;
- (CGSize)_imageSizeThatFits:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSShadow)shadow;
- (NSString)backdropGroupName;
- (NSString)groupName;
- (UIColor)adjustmentModeNormalTintColor;
- (UIColor)borderColor;
- (UIColor)buttonBackgroundColor;
- (UIColor)highlightColor;
- (UIColor)imageHighlightColor;
- (UIColor)imageTintColor;
- (UIEdgeInsets)imageMargin;
- (UIEdgeInsets)padding;
- (UIImage)originalImage;
- (UIImage)selectionImage;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPointerInteraction)pointerInteraction;
- (UIView)backgroundImageView;
- (UIVisualEffectView)backdropView;
- (VUIButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (VUIImageView)backgroundImagesViewDefaultState;
- (VUIImageView)backgroundImagesViewHighlightedState;
- (VUIImageView)imageView;
- (VUIImageView)imagesViewDefaultState;
- (VUIImageView)imagesViewHighlightedState;
- (VUILabel)subtitleContentView;
- (VUILabel)textContentView;
- (double)borderWidth;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)cornerRadius;
- (double)height;
- (double)imageMaxHeight;
- (double)imageMaxWidth;
- (double)maxHeight;
- (double)maxWidth;
- (double)minHeight;
- (double)minWidth;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)topMarginWithBaselineMargin:(double)a3;
- (double)vuiBaselineHeight;
- (double)vui_baselineOffsetFromBottom;
- (double)width;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)largeContentImage;
- (id)largeContentTitle;
- (id)longPressActionHandler;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)selectActionHandler;
- (unint64_t)buttonShape;
- (unint64_t)buttonType;
- (unint64_t)uberButtonType;
- (void)_addLongPressGesture;
- (void)_buttonTapped:(id)a3;
- (void)_configure;
- (void)_crossFadeButtonImageTo:(id)a3;
- (void)_removeLongPressGestureIfNeeded;
- (void)_setPointerInteractionEnabled:(BOOL)a3;
- (void)_setupBarButtonItem;
- (void)_setupBlurEffectBackdropView;
- (void)_updateBackdropViewCornerRadius;
- (void)_updateBorder;
- (void)_updateLayout;
- (void)applySelectionImage;
- (void)buttonLongPressed:(id)a3;
- (void)layoutSubviews;
- (void)restoreOriginalImage;
- (void)revertTintColor;
- (void)saturateTintColorAndBackgroundColor;
- (void)setAdjustmentModeNormalTintColor:(id)a3;
- (void)setAllowsUberTinting:(BOOL)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundImage:(id)a3 forHighlightedState:(BOOL)a4;
- (void)setBackgroundImageView:(id)a3;
- (void)setBackgroundImagesViewDefaultState:(id)a3;
- (void)setBackgroundImagesViewHighlightedState:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setButtonBackgroundColor:(id)a3;
- (void)setButtonShape:(unint64_t)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setHasDisclaimerText:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageHighlightColor:(id)a3;
- (void)setImageMargin:(UIEdgeInsets)a3;
- (void)setImageMaxHeight:(double)a3;
- (void)setImageMaxWidth:(double)a3;
- (void)setImageTintColor:(id)a3;
- (void)setImageTrailsTextContent:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setImageView:(id)a3 forHighlightedState:(BOOL)a4;
- (void)setImagesViewDefaultState:(id)a3;
- (void)setImagesViewHighlightedState:(id)a3;
- (void)setIsTintColorAndBackgroundColorSaturated:(BOOL)a3;
- (void)setLongPressActionHandler:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMaxHeight:(double)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setMinWidth:(double)a3;
- (void)setOriginalImage:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setScrolledNonUberPercentage:(double)a3;
- (void)setSelectActionHandler:(id)a3;
- (void)setSelectionImage:(id)a3;
- (void)setShadow:(id)a3;
- (void)setSubtitleContentView:(id)a3;
- (void)setSupportsLongPress:(BOOL)a3;
- (void)setTextContentView:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUberButtonType:(unint64_t)a3;
- (void)setUsesSymbolPointerInteraction:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)tintColorDidChange;
- (void)vui_prepareForReuse;
@end

@implementation VUIButton

- (void)setUberButtonType:(unint64_t)a3
{
  if (self->_uberButtonType != a3)
  {
    self->_uberButtonType = a3;
    if (self->_buttonType == 3) {
      [(VUIButton *)self _setupBlurEffectBackdropView];
    }
  }
}

- (void)setSelectActionHandler:(id)a3
{
  if (self->_selectActionHandler != a3)
  {
    v4 = _Block_copy(a3);
    id selectActionHandler = self->_selectActionHandler;
    self->_id selectActionHandler = v4;
  }
}

- (void)setLongPressActionHandler:(id)a3
{
}

- (void)setImageMaxWidth:(double)a3
{
  self->_imageMaxWidth = a3;
}

- (void)setImageMaxHeight:(double)a3
{
  self->_imageMaxHeight = a3;
}

- (void)setHasDisclaimerText:(BOOL)a3
{
  self->_hasDisclaimerText = a3;
}

- (void)setGroupName:(id)a3
{
}

- (void)setButtonType:(unint64_t)a3
{
  if (self->_buttonType != a3)
  {
    if (!a3)
    {
      [(UIVisualEffectView *)self->_backdropView removeFromSuperview];
      backdropView = self->_backdropView;
      self->_backdropView = 0;
    }
    self->_buttonType = a3;
    [(VUIButton *)self _configure];
  }
}

- (void)setButtonShape:(unint64_t)a3
{
  self->_buttonShape = a3;
}

- (void)setButtonBackgroundColor:(id)a3
{
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
  [(VUIButton *)self _updateBorder];
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
  [(VUIButton *)self _updateBorder];
}

- (void)setImageTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIButton;
  [(VUIButton *)&v5 layoutSubviews];
  [(VUIButton *)self bounds];
  -[VUIButton vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIButton;
  -[VUIButton setEnabled:](&v7, sel_setEnabled_);
  objc_super v5 = [(VUIButton *)self textContentView];
  [v5 setEnabled:v3];

  v6 = [(VUIButton *)self subtitleContentView];
  [v6 setEnabled:v3];
}

- (void)_configure
{
  BOOL v3 = [(VUIButton *)self buttonBackgroundColor];
  [(VUIButton *)self setVuiBackgroundColor:v3];

  [(VUIButton *)self cornerRadius];
  -[VUIButton setCornerRadius:](self, "setCornerRadius:");
  double v4 = [(VUIButton *)self shadow];

  if (v4)
  {
    objc_super v5 = [(VUIButton *)self layer];
    v6 = [(VUIButton *)self shadow];
    [v6 shadowOffset];
    objc_msgSend(v5, "setShadowOffset:");

    objc_super v7 = [(VUIButton *)self layer];
    v8 = [(VUIButton *)self shadow];
    [v8 shadowBlurRadius];
    objc_msgSend(v7, "setShadowRadius:");

    v9 = [(VUIButton *)self layer];
    v10 = [(VUIButton *)self shadow];
    id v11 = [v10 shadowColor];
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    v12 = [(VUIButton *)self layer];
    [v12 setMasksToBounds:0];

    v13 = [(VUIButton *)self layer];
    LODWORD(v14) = 1.0;
    [v13 setShadowOpacity:v14];
  }
  if ([(VUIButton *)self buttonType] == 6
    || ![(VUIButton *)self buttonType]
    || [(VUIButton *)self buttonType] == 3)
  {
    uint64_t v15 = 1;
LABEL_7:
    [(VUIButton *)self _setPointerInteractionEnabled:v15];
    goto LABEL_8;
  }
  if (![(VUIButton *)self usesSymbolPointerInteraction])
  {
    uint64_t v15 = 0;
    goto LABEL_7;
  }
LABEL_8:
  if ([(VUIButton *)self buttonType] == 3) {
    [(VUIButton *)self _setupBlurEffectBackdropView];
  }
  if ([(VUIButton *)self buttonType] == 6) {
    [(VUIButton *)self _setupBarButtonItem];
  }
  [(VUIButton *)self _updateBorder];
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4)
  {
    -[VUIButton _computeSizeThatFits:](self, "_computeSizeThatFits:", a3.width, a3.height);
    CGFloat width = v7;
    CGFloat height = v8;
  }
  else
  {
    backdropView = self->_backdropView;
    if (backdropView)
    {
      [(VUIButton *)self bounds];
      -[UIVisualEffectView setFrame:](backdropView, "setFrame:");
      if ([(VUIButton *)self buttonType] == 6)
      {
        [(VUIButton *)self bounds];
        CGFloat v10 = CGRectGetHeight(v16) * 0.5;
        [(VUIButton *)self setCornerRadius:v10];
        id v11 = [(VUIButton *)self layer];
        [v11 setCornerRadius:v10];
      }
    }
    [(VUIButton *)self _updateLayout];
    v12 = [(VUIButton *)self buttonBackgroundColor];
    [(VUIButton *)self setVuiBackgroundColor:v12];
  }
  double v13 = width;
  double v14 = height;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (void)_updateLayout
{
  [(VUIButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(VUIButton *)self padding];
  double v9 = v4 - (v7 + v8);
  double v12 = v6 - (v10 + v11);
  if (![(VUIButton *)self _hasTitle] && ![(VUIButton *)self _hasImage])
  {
    [(VUIButton *)self bounds];
    double v9 = v13;
    double v12 = v14;
  }
  double v83 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v85 = v83;
  double v15 = v9;
  if ([(VUIButton *)self _hasTitle])
  {
    CGRect v16 = [(VUIButton *)self textContentView];
    objc_msgSend(v16, "sizeThatFits:", v9, v12);

    double v15 = v9;
    VUICeilValue();
    double v85 = fmin(v9, v17);
  }
  if ([(VUIButton *)self _hasSubtitle])
  {
    v18 = [(VUIButton *)self subtitleContentView];
    objc_msgSend(v18, "sizeThatFits:", v15, v12);

    VUICeilValue();
    double v83 = fmin(v15, v19);
  }
  VUIRoundValue();
  double v84 = v12;
  if ([(VUIButton *)self _hasImage])
  {
    if (v85 >= v83) {
      double v20 = v85;
    }
    else {
      double v20 = v83;
    }
    -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:", v15, v12);
    double v22 = v21;
    v23 = [(VUIButton *)self textContentView];
    v24 = [v23 textLayout];
    [v24 margin];
    double v26 = v25;

    [(VUIButton *)self imageMargin];
    double v28 = v22 + v26 + v27;
    if (v20 + v28 > v15)
    {
      VUIFloorValue();
      double v30 = v29;
      if ([(VUIButton *)self _hasTitle])
      {
        v31 = [(VUIButton *)self textContentView];
        objc_msgSend(v31, "sizeThatFits:", v30, v84);
      }
      if ([(VUIButton *)self _hasSubtitle])
      {
        v32 = [(VUIButton *)self subtitleContentView];
        objc_msgSend(v32, "sizeThatFits:", v30, v84);
      }
    }
    if ([(VUIButton *)self _hasTitle])
    {
      VUIRoundValue();
      if ([(VUIButton *)self imageTrailsTextContent]) {
        double v33 = -0.0;
      }
      else {
        double v33 = v28;
      }
    }
    else
    {
      VUIRoundValue();
      VUIRoundValue();
    }
    [(VUIButton *)self bounds];
    [(VUIButton *)self vuiIsRTL];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [(VUIButton *)self imageView];
    objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

    double v12 = v84;
  }
  if ([(VUIButton *)self _hasTitle])
  {
    v43 = [(VUIButton *)self textContentView];
    v44 = [v43 textLayout];
    [v44 margin];

    [(VUIButton *)self _hasSubtitle];
    [(VUIButton *)self bounds];
    [(VUIButton *)self vuiIsRTL];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v53 = [(VUIButton *)self textContentView];
    double v54 = v46;
    double v12 = v84;
    objc_msgSend(v53, "setFrame:", v54, v48, v50, v52);

    if ([(VUIButton *)self _hasSubtitle])
    {
      [(VUIButton *)self bounds];
      [(VUIButton *)self vuiIsRTL];
      VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      v63 = [(VUIButton *)self subtitleContentView];
      double v64 = v56;
      double v12 = v84;
      objc_msgSend(v63, "setFrame:", v64, v58, v60, v62);
    }
  }
  if ([(VUIButton *)self _hasBackgroundImage])
  {
    [(VUIButton *)self imageMaxWidth];
    double v66 = v65;
    [(VUIButton *)self imageMaxHeight];
    double v68 = v67;
    if (v66 == *MEMORY[0x1E4F1DB30] && v67 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v69 = [(VUIButton *)self backgroundImageView];
      objc_msgSend(v69, "vui_sizeThatFits:", v9, v12);
      double v66 = v70;
      double v68 = v71;
    }
    -[VUIButton _centerWithViewSize:withParentSize:](self, "_centerWithViewSize:withParentSize:", v66, v68, v9, v12);
    [(VUIButton *)self bounds];
    [(VUIButton *)self vuiIsRTL];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    v80 = [(VUIButton *)self backgroundImageView];
    objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);
  }
  if ([(VUIButton *)self buttonType] == 5
    || [(VUIButton *)self buttonShape] == 2
    || [(VUIButton *)self buttonShape] == 1)
  {
    [(VUIButton *)self frame];
    double v82 = v81 * 0.5;
    id v86 = [(VUIButton *)self layer];
    [v86 setCornerRadius:v82];
  }
}

- (BOOL)_hasTitle
{
  v2 = [(VUIButton *)self textContentView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (VUILabel)textContentView
{
  return self->_textContentView;
}

- (unint64_t)buttonShape
{
  return self->_buttonShape;
}

- (BOOL)_hasImage
{
  v2 = [(VUIButton *)self imageView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIEdgeInsets)imageMargin
{
  double top = self->_imageMargin.top;
  double left = self->_imageMargin.left;
  double bottom = self->_imageMargin.bottom;
  double right = self->_imageMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_imageSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(VUIButton *)self imageView];
  objc_msgSend(v5, "vui_sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)_hasSubtitle
{
  v2 = [(VUIButton *)self subtitleContentView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (VUILabel)subtitleContentView
{
  return self->_subtitleContentView;
}

- (BOOL)_hasBackgroundImage
{
  v2 = [(VUIButton *)self backgroundImageView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    if (self->_backdropView)
    {
      [(VUIButton *)self _updateBackdropViewCornerRadius];
    }
    else
    {
      id v4 = [(VUIButton *)self vuiLayer];
      [v4 setCornerRadius:a3];
    }
  }
}

- (BOOL)usesSymbolPointerInteraction
{
  return self->_usesSymbolPointerInteraction;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setPointerInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pointerInteraction = self->_pointerInteraction;
  if (v3)
  {
    if (!pointerInteraction)
    {
      double v6 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
      double v7 = self->_pointerInteraction;
      self->_pointerInteraction = v6;

      double v8 = self->_pointerInteraction;
      [(VUIButton *)self addInteraction:v8];
    }
  }
  else if (pointerInteraction)
  {
    -[VUIButton removeInteraction:](self, "removeInteraction:");
    double v9 = self->_pointerInteraction;
    self->_pointerInteraction = 0;
  }
}

- (VUIButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VUIButton;
  double v5 = -[VUIButton initWithFrame:](&v18, sel_initWithFrame_, a3, a4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v6 = v5;
  if (v5)
  {
    v5->_buttonType = a3;
    v5->_supportsLongPress = 0;
    [(VUIButton *)v5 _configure];
    v6->_allowsUberTinting = 1;
    [(VUIButton *)v6 addTarget:v6 action:sel__buttonTapped_ forControlEvents:64];
    [(VUIButton *)v6 setShowsLargeContentViewer:1];
    objc_initWeak(&location, v6);
    v21[0] = objc_opt_class();
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke;
    v15[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v16, &location);
    [(VUIButton *)v6 vui_registerForTraitChanges:v7 withHandler:v15];

    uint64_t v20 = objc_opt_class();
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke_2;
    v13[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v14, &location);
    [(VUIButton *)v6 vui_registerForTraitChanges:v8 withHandler:v13];

    uint64_t v19 = objc_opt_class();
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke_3;
    v11[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v12, &location);
    [(VUIButton *)v6 vui_registerForTraitChanges:v9 withHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)_updateBorder
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__VUIButton__updateBorder__block_invoke;
  aBlock[3] = &unk_1E6DF3D58;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__VUIButton__updateBorder__block_invoke_2;
  v16[3] = &unk_1E6DF3D58;
  v16[4] = self;
  id v4 = (void (**)(void))_Block_copy(v16);
  borderColor = self->_borderColor;
  if (!borderColor) {
    goto LABEL_7;
  }
  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  if (borderColor == v6)
  {

    goto LABEL_7;
  }
  double borderWidth = self->_borderWidth;

  if (borderWidth == 0.0)
  {
LABEL_7:
    v3[2](v3);
LABEL_8:
    double v13 = v4;
    goto LABEL_9;
  }
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    id v14 = [(VUIButton *)self vuiLayer];
    objc_msgSend(v14, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

    double v15 = [(VUIButton *)self vuiLayer];
    [v15 setBorderWidth:self->_borderWidth];

    goto LABEL_8;
  }
  double v9 = [(UIVisualEffectView *)backdropView vuiLayer];
  objc_msgSend(v9, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

  double v10 = [(UIVisualEffectView *)self->_backdropView vuiLayer];
  [v10 setBorderWidth:self->_borderWidth];

  double v11 = [(UIVisualEffectView *)self->_backdropView vuiLayer];
  [v11 setCornerRadius:self->_cornerRadius];

  id v12 = [(UIVisualEffectView *)self->_backdropView vuiLayer];
  [v12 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  double v13 = v3;
LABEL_9:
  ((void (*)(void))v13[2])();
}

void __26__VUIButton__updateBorder__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vuiLayer];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v3, "CGColor"));

  id v4 = [*(id *)(a1 + 32) vuiLayer];
  [v4 setBorderWidth:0.0];
}

void __26__VUIButton__updateBorder__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backdropView];
  id v3 = [v2 vuiLayer];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  double v5 = [*(id *)(a1 + 32) backdropView];
  double v6 = [v5 vuiLayer];
  [v6 setBorderWidth:0.0];

  double v7 = [*(id *)(a1 + 32) backdropView];
  double v8 = [v7 vuiLayer];
  [v8 setCornerRadius:0.0];

  id v10 = [*(id *)(a1 + 32) backdropView];
  double v9 = [v10 vuiLayer];
  [v9 setCornerCurve:*MEMORY[0x1E4F39EA0]];
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setImageView:(id)a3 forHighlightedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = v6;
  if (v4)
  {
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    [(VUIImageView *)self->_imagesViewDefaultState bounds];
    objc_msgSend(v11, "setBounds:", v8, v10);
    [(VUIButton *)self setImagesViewHighlightedState:v11];
  }
  else
  {
    [(VUIButton *)self setImageView:v6];
  }
}

- (void)setImageView:(id)a3
{
  double v5 = (VUIImageView *)a3;
  [(VUIButton *)self vui_addSubview:v5 oldView:self->_imageView];
  if (self->_imageView != v5)
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    id v6 = [(VUIImageView *)self->_imageView image];
    originalImage = self->_originalImage;
    self->_originalImage = v6;
  }
  [(VUIButton *)self vui_setNeedsLayout];
  imagesViewDefaultState = self->_imagesViewDefaultState;
  self->_imagesViewDefaultState = v5;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VUIButton;
  [(VUIButton *)&v3 tintColorDidChange];
  if ([(VUIButton *)self tintAdjustmentMode] == 2)
  {
    [(VUIButton *)self saturateTintColorAndBackgroundColor];
    self->_isTintColorAndBackgroundColorSaturated = 1;
  }
  else if (self->_isTintColorAndBackgroundColorSaturated)
  {
    [(VUIButton *)self revertTintColor];
    self->_isTintColorAndBackgroundColorSaturated = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_backgroundImagesViewHighlightedState, 0);
  objc_storeStrong((id *)&self->_backgroundImagesViewDefaultState, 0);
  objc_storeStrong((id *)&self->_imagesViewHighlightedState, 0);
  objc_storeStrong((id *)&self->_imagesViewDefaultState, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, 0);
  objc_storeStrong(&self->_longPressActionHandler, 0);
  objc_storeStrong(&self->_selectActionHandler, 0);
  objc_storeStrong((id *)&self->_imageHighlightColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_selectionImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleContentView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained buttonBackgroundColor];
  [WeakRetained setVuiBackgroundColor:v1];

  if ([WeakRetained buttonType] == 3) {
    [WeakRetained _setupBlurEffectBackdropView];
  }
  [WeakRetained _updateBorder];
}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  [WeakRetained invalidateIntrinsicContentSize];
}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
}

- (void)setUsesSymbolPointerInteraction:(BOOL)a3
{
  self->_usesSymbolPointerInteraction = a3;
  -[VUIButton _setPointerInteractionEnabled:](self, "_setPointerInteractionEnabled:");
}

- (void)applySelectionImage
{
}

- (void)restoreOriginalImage
{
}

- (void)setSubtitleContentView:(id)a3
{
  double v5 = (VUILabel *)a3;
  [(VUIButton *)self vui_addSubview:v5 oldView:self->_subtitleContentView];
  if (self->_subtitleContentView != v5) {
    objc_storeStrong((id *)&self->_subtitleContentView, a3);
  }
  [(VUIButton *)self vui_setNeedsLayout];
}

- (void)setTextContentView:(id)a3
{
  id v6 = (VUILabel *)a3;
  [(VUIButton *)self vui_addSubview:v6 oldView:self->_textContentView];
  if (self->_textContentView != v6) {
    objc_storeStrong((id *)&self->_textContentView, a3);
  }
  unint64_t v5 = [(VUIButton *)self buttonType];
  if (v5 == 6 || v5 == 1) {
    [(VUILabel *)self->_textContentView _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
  }
  [(VUIButton *)self vui_setNeedsLayout];
}

- (void)setBackgroundImageView:(id)a3
{
  unint64_t v5 = (UIView *)a3;
  backgroundImageView = self->_backgroundImageView;
  double v9 = v5;
  if (backgroundImageView != v5)
  {
    [(UIView *)backgroundImageView removeFromSuperview];
    double v7 = [(VUIButton *)self subviews];
    double v8 = [v7 firstObject];

    [(VUIButton *)self vui_insertSubview:v9 belowSubview:v8 oldView:self->_backgroundImageView];
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    objc_storeStrong((id *)&self->_backgroundImagesViewDefaultState, a3);
  }
}

- (void)setBackgroundImage:(id)a3 forHighlightedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = v6;
  if (v4)
  {
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    [(VUIImageView *)self->_backgroundImagesViewDefaultState bounds];
    objc_msgSend(v11, "setBounds:", v8, v10);
    [(VUIButton *)self setBackgroundImagesViewHighlightedState:v11];
  }
  else
  {
    [(VUIButton *)self setBackgroundImageView:v6];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIButton;
  -[VUIButton setHighlighted:](&v18, sel_setHighlighted_);
  if (([(VUIButton *)self isHidden] & 1) == 0)
  {
    [(VUIButton *)self alpha];
    if (v5 != 0.0)
    {
      BOOL v6 = [(VUIButton *)self buttonType] == 6;
      if (v3)
      {
        if (v6)
        {
          if ([(VUIButton *)self buttonType] == 6) {
            [(VUIButton *)self setAlpha:0.5];
          }
        }
        else
        {
          double v7 = [(VUIButton *)self highlightColor];
          [(VUIButton *)self setVuiBackgroundColor:v7];
        }
        if (self->_imagesViewHighlightedState) {
          -[VUIButton setImageView:](self, "setImageView:");
        }
        uint64_t v8 = 736;
      }
      else
      {
        if (v6)
        {
          if ([(VUIButton *)self buttonType] == 6) {
            [(VUIButton *)self setAlpha:1.0];
          }
        }
        else
        {
          double v9 = [(VUIButton *)self buttonBackgroundColor];
          [(VUIButton *)self setVuiBackgroundColor:v9];
        }
        if (self->_imagesViewDefaultState) {
          -[VUIButton setImageView:](self, "setImageView:");
        }
        uint64_t v8 = 728;
      }
      if (*(Class *)((char *)&self->super.super.super.super.isa + v8)) {
        -[VUIButton setBackgroundImageView:](self, "setBackgroundImageView:");
      }
      double v10 = [(VUIButton *)self textContentView];
      [v10 setHighlighted:v3];

      if (![(VUIButton *)self buttonType] || [(VUIButton *)self buttonType] == 3)
      {
        id v11 = [(VUIButton *)self imageView];
        objc_msgSend(v11, "vui_setSelected:animated:withAnimationCoordinator:", v3, 0, 0);
      }
      if (self->_backdropView)
      {
        uint64_t v12 = [(VUIButton *)self buttonBackgroundColor];
        if (!v12) {
          goto LABEL_27;
        }
        double v13 = (void *)v12;
        id v14 = [(VUIButton *)self buttonBackgroundColor];
        double v15 = [MEMORY[0x1E4FB1618] clearColor];

        if (v14 == v15)
        {
LABEL_27:
          id v16 = [(VUIButton *)self layer];
          double v17 = 0.0;
          if (v3) {
            [(VUIButton *)self cornerRadius];
          }
          [v16 setCornerRadius:v17];
        }
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  -[VUIButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIButton vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setBackdropGroupName:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_backdropGroupName != v5)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    [(UIVisualEffectView *)self->_backdropView _setGroupName:v5];
  }
}

- (void)setSupportsLongPress:(BOOL)a3
{
  if (self->_supportsLongPress != a3)
  {
    BOOL v3 = a3;
    self->_supportsLongPress = a3;
    [(VUIButton *)self _removeLongPressGestureIfNeeded];
    if (v3)
    {
      [(VUIButton *)self _addLongPressGesture];
    }
  }
}

- (void)setHighlightColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_highlightColor != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    double v5 = v6;
  }
}

- (double)vuiBaselineHeight
{
  BOOL v3 = [(VUIButton *)self textContentView];
  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    -[VUIButton _computeSizeThatFits:](self, "_computeSizeThatFits:", *MEMORY[0x1E4F1DB30], v6);
    double v8 = v7;
    objc_msgSend(v3, "vui_sizeThatFits:", v5, v6);
    double v10 = (v8 - v9) * 0.5;
    [v3 vuiBaselineHeight];
    double v4 = v11 + v10;
  }

  return v4;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6 = a3;
  if ([(VUIButton *)self buttonType] == 1
    && ([(VUIButton *)self textContentView],
        double v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    double v9 = [(VUIButton *)self textContentView];
    [v9 topMarginToLabel:v6 withBaselineMargin:a4];
    double v11 = v10;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIButton;
    [(UIView *)&v14 topMarginWithBaselineMargin:a4];
    double v11 = v12;
  }

  return v11;
}

- (double)vui_baselineOffsetFromBottom
{
  if ([(VUIButton *)self buttonType] != 1) {
    return 0.0;
  }
  BOOL v3 = [(VUIButton *)self textContentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0.0;
  }
  double v5 = [(VUIButton *)self textContentView];
  objc_msgSend(v5, "vui_baselineOffsetFromBottom");
  double v7 = v6;

  return v7;
}

- (void)vui_prepareForReuse
{
  [(VUIImageView *)self->_imageView setImage:0];
  textContentView = self->_textContentView;
  [(VUILabel *)textContentView setVuiText:0];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIButton;
  [(VUIButton *)&v7 setTintColor:v4];
  if ([(VUIButton *)self tintAdjustmentMode] == 2)
  {
    [(VUIButton *)self setImageTintColor:v4];
  }
  else
  {
    double v5 = [(VUIButton *)self textContentView];
    [v5 setTextColor:v4];

    double v6 = [(VUILabel *)self->_textContentView textLayout];
    [v6 setColor:v4];
    [v6 setDarkColor:v4];
    [(VUIButton *)self setImageTintColor:v4];
    [(VUIImageView *)self->_imageView _setTintColor:v4];
  }
}

- (void)saturateTintColorAndBackgroundColor
{
  id v4 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  BOOL v3 = [(VUIButton *)self imageTintColor];

  if (v3) {
    [(VUIImageView *)self->_imageView _setTintColor:v4];
  }
  [(VUILabel *)self->_textContentView setTextColor:v4];
}

- (void)revertTintColor
{
  if (self->_imageView)
  {
    BOOL v3 = [(VUIButton *)self imageTintColor];
    [(VUIImageView *)self->_imageView _setTintColor:v3];
  }
  textContentView = self->_textContentView;
  [(VUILabel *)textContentView revertTintColor];
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  if ([(VUIButton *)self buttonType] == 1
    && ([(VUIButton *)self textContentView],
        double v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_super v7 = [(VUIButton *)self textContentView];
    [v7 topMarginWithBaselineMargin:a3];
    double v9 = v8;

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIButton;
    [(UIView *)&v11 topMarginWithBaselineMargin:a3];
  }
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  if ([(VUIButton *)self buttonType] == 1
    && ([(VUIButton *)self textContentView],
        double v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_super v7 = [(VUIButton *)self textContentView];
    [v7 bottomMarginWithBaselineMargin:a3];
    double v9 = v8;

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIButton;
    [(UIView *)&v11 bottomMarginWithBaselineMargin:a3];
  }
  return result;
}

- (void)_crossFadeButtonImageTo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(VUIButton *)self imageView];
    id v6 = [v5 image];

    if (v6 != v4)
    {
      objc_initWeak(&location, self);
      objc_super v7 = [(VUIButton *)self imageView];
      double v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __37__VUIButton__crossFadeButtonImageTo___block_invoke;
      v9[3] = &unk_1E6DF5490;
      objc_copyWeak(&v11, &location);
      id v10 = v4;
      [v8 transitionWithView:v7 duration:5242880 options:v9 animations:0 completion:0.200000003];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __37__VUIButton__crossFadeButtonImageTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [WeakRetained imageView];
  [v3 setImage:v2];
}

- (CGSize)_computeSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:");
  double imageMaxHeight = v6;
  switch([(VUIButton *)self buttonType])
  {
    case 0uLL:
    case 3uLL:
      -[VUIButton _calculateContentSizeForPrimaryButtonThatFit:](self, "_calculateContentSizeForPrimaryButtonThatFit:", width, height);
      double imageMaxHeight = v8;
      goto LABEL_20;
    case 1uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_20;
    case 5uLL:
      if ([(VUIButton *)self _hasTitle])
      {
        double v9 = [(VUIButton *)self textContentView];
        objc_msgSend(v9, "sizeThatFits:", width, height);
        double imageMaxHeight = v10;
      }
      [(VUIButton *)self padding];
      [(VUIButton *)self padding];
      [(VUIButton *)self minWidth];
      [(VUIButton *)self padding];
      double v12 = v11;
      [(VUIButton *)self padding];
      double v14 = imageMaxHeight + v12 + v13;
      [(VUIButton *)self minHeight];
      if (v14 < v15) {
        double v14 = v15;
      }
      goto LABEL_21;
    case 6uLL:
      if ([(VUIButton *)self _hasImage] && [(VUIButton *)self _hasTitle])
      {
        id v16 = [(VUIButton *)self textContentView];
        objc_msgSend(v16, "sizeThatFits:", width, height);
        double v18 = v17;

        [(VUIButton *)self imageMargin];
        double v20 = imageMaxHeight + v19;
        [(VUIButton *)self imageMargin];
        if (v20 + v21 >= v18) {
          double imageMaxHeight = v20 + v21;
        }
        else {
          double imageMaxHeight = v18;
        }
        [(VUIButton *)self imageMargin];
        double v22 = [(VUIButton *)self textContentView];
        v23 = [v22 textLayout];
        [v23 margin];
      }
      else
      {
        if ([(VUIButton *)self _hasImage])
        {
          double imageMaxHeight = self->_imageMaxHeight;
          goto LABEL_20;
        }
LABEL_18:
        double v22 = [(VUIButton *)self textContentView];
        objc_msgSend(v22, "sizeThatFits:", width, height);
        double imageMaxHeight = v25;
      }

LABEL_20:
      [(VUIButton *)self padding];
      [(VUIButton *)self padding];
      [(VUIButton *)self padding];
      double v27 = v26;
      [(VUIButton *)self padding];
      double v14 = imageMaxHeight + v27 + v28;
LABEL_21:
      [(VUIButton *)self height];
      if (v29 > 0.0)
      {
        [(VUIButton *)self height];
        double v14 = v30;
      }
      [(VUIButton *)self width];
      double v32 = v31;
      [(VUIButton *)self height];
      double v34 = v33;
      if (v32 <= 0.0 || v33 <= 0.0)
      {
        [(VUIButton *)self minWidth];
        [(VUIButton *)self minHeight];
        double v45 = v35;
        [(VUIButton *)self maxWidth];
        [(VUIButton *)self maxHeight];
        double v37 = v34;
        double v38 = v34;
        if (v34 <= 0.0)
        {
          if (height > 0.0 && (height < v36 || v36 <= 0.0))
          {
            double v34 = height;
            double v37 = v45;
            double v38 = height;
          }
          else
          {
            if (v36 <= 0.0) {
              double v34 = height;
            }
            else {
              double v34 = v36;
            }
            double v37 = v45;
            double v38 = v36;
          }
        }
        if (v14 >= v37)
        {
          if (v38 > 0.0 && v34 >= v38 || v34 <= 0.0) {
            double v41 = v38;
          }
          else {
            double v41 = v34;
          }
          if (v14 <= v41 || v41 <= 0.0) {
            double v34 = v14;
          }
          else {
            double v34 = v41;
          }
        }
        else
        {
          double v34 = v37;
        }
      }
      VUICeilValue();
      double v44 = v34;
      result.double height = v44;
      result.double width = v43;
      return result;
    case 8uLL:
      -[VUIButton _calculateContentSizeForCustomButtonThatFit:](self, "_calculateContentSizeForCustomButtonThatFit:", width, height);
      double v14 = v24;
      goto LABEL_21;
    default:
      double imageMaxHeight = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_20;
  }
}

- (CGSize)_calculateContentSizeForCustomButtonThatFit:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(VUIButton *)self _hasImage] && [(VUIButton *)self _hasTitle])
  {
    -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
    double v7 = v6;
    double v9 = v8;
    double v10 = width - v6;
    double v11 = [(VUIButton *)self textContentView];
    objc_msgSend(v11, "sizeThatFits:", v10, height);
    double v13 = v12;
    double v15 = v14;

    if (v9 >= v15) {
      double v15 = v9;
    }
    [(VUIButton *)self imageMargin];
    double v17 = v7 + v16;
    double v18 = [(VUIButton *)self textContentView];
    double v19 = [v18 textLayout];
    [v19 margin];
    double v21 = v13 + v17 + v20;

    goto LABEL_11;
  }
  if (![(VUIButton *)self _hasImage])
  {
    double v18 = [(VUIButton *)self textContentView];
    objc_msgSend(v18, "sizeThatFits:", width, height);
    double v21 = v24;
    double v15 = v25;
LABEL_11:

    double v22 = v21;
    double v23 = v15;
    goto LABEL_12;
  }
  -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
LABEL_12:
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)_calculateContentSizeForPrimaryButtonThatFit:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(VUIButton *)self _hasImage] && [(VUIButton *)self _hasTitle])
  {
    -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
    double v7 = v6;
    double v9 = v8;
    double v10 = [(VUIButton *)self textContentView];
    double v11 = [v10 textLayout];
    [v11 margin];
    double v13 = v12;

    [(VUIButton *)self imageMargin];
    double v15 = width - v7 - v13 - v14;
    double v16 = [(VUIButton *)self textContentView];
    objc_msgSend(v16, "sizeThatFits:", v15, height);
    double v18 = v17;
    double v20 = v19;

    if (v9 >= v20) {
      double v20 = v9;
    }
    [(VUIButton *)self imageMargin];
    double v22 = v7 + v21;
    double v23 = [(VUIButton *)self textContentView];
    double v24 = [v23 textLayout];
    [v24 margin];
    double v26 = v18 + v22 + v25;

    goto LABEL_11;
  }
  if (![(VUIButton *)self _hasImage])
  {
    double v23 = [(VUIButton *)self textContentView];
    objc_msgSend(v23, "sizeThatFits:", width, height);
    double v26 = v29;
    double v20 = v30;
LABEL_11:

    double v27 = v26;
    double v28 = v20;
    goto LABEL_12;
  }
  -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
LABEL_12:
  result.double height = v28;
  result.double width = v27;
  return result;
}

- (CGSize)_calculateContentSizeForImageThatFit:(CGSize)a3
{
  -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(VUIButton *)self imageMargin];
  double v9 = v7 + v8;
  [(VUIButton *)self imageMargin];
  double v11 = v9 + v10;
  double v12 = v5;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)_addLongPressGesture
{
  if ([(VUIButton *)self supportsLongPress])
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_buttonLongPressed_];
    [v3 setNumberOfTouchesRequired:1];
    [(VUIButton *)self addGestureRecognizer:v3];
    [(VUIButton *)self setLongPressGestureRecognizer:v3];
  }
}

- (void)_removeLongPressGestureIfNeeded
{
  id v3 = [(VUIButton *)self longPressGestureRecognizer];

  if (v3)
  {
    double v4 = [(VUIButton *)self longPressGestureRecognizer];
    [(VUIButton *)self removeGestureRecognizer:v4];

    [(VUIButton *)self setLongPressGestureRecognizer:0];
  }
}

- (void)buttonLongPressed:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 1)
  {
    double v4 = [(VUIButton *)self longPressGestureRecognizer];
    if (v4 == v6)
    {
      double v5 = [(VUIButton *)self longPressActionHandler];

      if (!v5) {
        goto LABEL_6;
      }
      double v4 = [(VUIButton *)self longPressActionHandler];
      ((void (**)(void, VUIButton *))v4)[2](v4, self);
    }
  }
LABEL_6:
}

- (void)_buttonTapped:(id)a3
{
  double v4 = [(VUIButton *)self selectActionHandler];

  if (v4)
  {
    double v5 = [(VUIButton *)self selectActionHandler];
    v5[2](v5, self);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (([(VUIButton *)self isHidden] & 1) != 0 || ([(VUIButton *)self alpha], v7 == 0.0))
  {
    double v8 = 0;
  }
  else
  {
    [(VUIButton *)self bounds];
    double v10 = fmax(44.0 - v9, 0.0);
    double v12 = fmax(44.0 - v11, 0.0);
    [(VUIButton *)self bounds];
    CGRect v18 = CGRectInset(v17, v10 * -0.5, v12 * -0.5);
    v16.CGFloat x = x;
    v16.CGFloat y = y;
    if (CGRectContainsPoint(v18, v16)) {
      double v13 = self;
    }
    else {
      double v13 = 0;
    }
    double v8 = v13;
  }
  return v8;
}

- (CGPoint)_centerWithViewSize:(CGSize)a3 withParentSize:(CGSize)a4
{
  double v4 = (a4.width - a3.width) * 0.5;
  double v5 = (a4.height - a3.height) * 0.5;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (void)_setupBlurEffectBackdropView
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!self->_backdropView)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    [(VUIButton *)self insertSubview:v3 atIndex:0];
    double v4 = [(VUIButton *)self layer];
    [v4 setMasksToBounds:1];

    [(VUIButton *)self setBackdropView:v3];
  }
  unint64_t uberButtonType = self->_uberButtonType;
  if (uberButtonType == 1)
  {
    [(UIVisualEffectView *)self->_backdropView setAllowsBlurring:1];
    backdropView = self->_backdropView;
    double v10 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:50.0];
    double v11 = objc_msgSend(MEMORY[0x1E4FB1620], "colorEffectSaturate:", 1.6, v10);
    v14[1] = v11;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [(UIVisualEffectView *)backdropView setBackgroundEffects:v13];
  }
  else
  {
    if (uberButtonType) {
      return;
    }
    [(UIVisualEffectView *)self->_backdropView setAllowsBlurring:0];
    id v6 = [(VUIButton *)self traitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    if (v7 == 2) {
      uint64_t v8 = 14;
    }
    else {
      uint64_t v8 = 19;
    }
    double v9 = self->_backdropView;
    double v10 = [MEMORY[0x1E4FB14C8] effectWithStyle:v8];
    v15[0] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(UIVisualEffectView *)v9 setBackgroundEffects:v11];
  }
}

- (void)_updateBackdropViewCornerRadius
{
  [(VUIButton *)self cornerRadius];
  double v4 = v3;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_backdropView, "_setCornerRadius:continuous:maskedCorners:", 1, 15);
  uint64_t v5 = [(VUIButton *)self buttonBackgroundColor];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(VUIButton *)self buttonBackgroundColor];
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];

    if (v7 != v8)
    {
      id v9 = [(VUIButton *)self vuiLayer];
      [v9 setCornerRadius:v4];
    }
  }
}

- (void)_setupBarButtonItem
{
  uint64_t v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
  backdropView = self->_backdropView;
  id v6 = (id)v3;
  if (backdropView)
  {
    [(UIVisualEffectView *)backdropView setEffect:v3];
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v3];
    [v5 setEffect:v6];
    [(VUIButton *)self insertSubview:v5 atIndex:0];
    [(VUIButton *)self setBackdropView:v5];
    [(UIVisualEffectView *)self->_backdropView setHidden:1];
  }
}

- (CGRect)_barButtonPointerShapeRect
{
  [(VUIButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VUIButton *)self padding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if ([(VUIButton *)self _hasImage] && ![(VUIButton *)self _hasTitle]
    || [(VUIButton *)self _hasImage] && ![(VUIButton *)self _hasTitle])
  {
    double v8 = v8 - v14 - v18;
    double v10 = v10 - v12 - v16;
    double v4 = v14;
    double v6 = v12;
  }
  double v19 = v4;
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  return CGRectInset(*(CGRect *)&v19, -6.0, -6.0);
}

- (CGRect)_symbolButtonPointerShapeRect
{
  double v3 = [(VUIButton *)self imageView];
  double v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6 * 1.4;
  double v10 = v8 * 1.4;
  [(VUIButton *)self bounds];
  double v12 = (v11 - v9) * 0.5;
  [(VUIButton *)self bounds];
  double v14 = (v13 - v10) * 0.5 + (v9 - v10) * -0.5;
  if (v9 > v10) {
    double v15 = v9;
  }
  else {
    double v15 = v10;
  }
  if (v9 > v10)
  {
    double v16 = v12;
  }
  else
  {
    double v14 = (v13 - v10) * 0.5;
    double v16 = v12 + (v10 - v9) * -0.5;
  }
  double v17 = v15;
  result.size.double height = v17;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [a3 view];
  if (!v5)
  {
    double v7 = 0;
    goto LABEL_10;
  }
  if ([(VUIButton *)self buttonType] == 6)
  {
    [(VUIButton *)self _barButtonPointerShapeRect];
    double v6 = (void *)MEMORY[0x1E4FB14C0];
  }
  else
  {
    if (![(VUIButton *)self usesSymbolPointerInteraction])
    {
      double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5];
      id v9 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v8];
      double v7 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];
      goto LABEL_9;
    }
    [(VUIButton *)self _symbolButtonPointerShapeRect];
    double v6 = (void *)MEMORY[0x1E4FB14C0];
  }
  double v8 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:");
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v9 setVisiblePath:v8];
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5 parameters:v9];
  double v11 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v10];
  double v7 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:0];

LABEL_9:
LABEL_10:

  return v7;
}

- (id)largeContentTitle
{
  double v3 = [(VUIButton *)self accessibilityLabel];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(VUIButton *)self accessibilityLabel];
  }
  else
  {
    double v6 = [(VUIButton *)self textContentView];

    if (v6)
    {
      double v7 = [(VUIButton *)self textContentView];
      id v5 = [v7 text];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)largeContentImage
{
  double v3 = [(VUIButton *)self imageView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(VUIButton *)self imageView];
  if (isKindOfClass) {
    goto LABEL_4;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if (v6)
  {
    id v5 = [(VUIButton *)self imageView];
LABEL_4:
    double v7 = [v5 image];

    goto LABEL_6;
  }
  double v7 = 0;
LABEL_6:
  return v7;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (void)setScrolledNonUberPercentage:(double)a3
{
  if (a3 == 0.0)
  {
    [(UIVisualEffectView *)self->_backdropView setHidden:0];
    [(VUIButton *)self setVuiBackgroundColor:0];
  }
  else
  {
    [(VUIButton *)self setVuiBackgroundColor:self->_buttonBackgroundColor];
    id v4 = [(VUIButton *)self backdropView];
    [v4 setHidden:1];
  }
}

- (void)setBackdropView:(id)a3
{
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (BOOL)allowsUberTinting
{
  return self->_allowsUberTinting;
}

- (void)setAllowsUberTinting:(BOOL)a3
{
  self->_allowsUberTinting = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)hasDisclaimerText
{
  return self->_hasDisclaimerText;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

- (unint64_t)uberButtonType
{
  return self->_uberButtonType;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (void)setShadow:(id)a3
{
}

- (UIImage)selectionImage
{
  return self->_selectionImage;
}

- (void)setSelectionImage:(id)a3
{
}

- (double)imageMaxWidth
{
  return self->_imageMaxWidth;
}

- (double)imageMaxHeight
{
  return self->_imageMaxHeight;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIColor)imageHighlightColor
{
  return self->_imageHighlightColor;
}

- (void)setImageHighlightColor:(id)a3
{
}

- (void)setImageMargin:(UIEdgeInsets)a3
{
  self->_imageMargin = a3;
}

- (BOOL)imageTrailsTextContent
{
  return self->_imageTrailsTextContent;
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
  self->_imageTrailsTextContent = a3;
}

- (id)selectActionHandler
{
  return self->_selectActionHandler;
}

- (BOOL)supportsLongPress
{
  return self->_supportsLongPress;
}

- (id)longPressActionHandler
{
  return self->_longPressActionHandler;
}

- (UIColor)adjustmentModeNormalTintColor
{
  return self->_adjustmentModeNormalTintColor;
}

- (void)setAdjustmentModeNormalTintColor:(id)a3
{
}

- (BOOL)isTintColorAndBackgroundColorSaturated
{
  return self->_isTintColorAndBackgroundColorSaturated;
}

- (void)setIsTintColorAndBackgroundColorSaturated:(BOOL)a3
{
  self->_isTintColorAndBackgroundColorSaturated = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (VUIImageView)imagesViewDefaultState
{
  return self->_imagesViewDefaultState;
}

- (void)setImagesViewDefaultState:(id)a3
{
}

- (VUIImageView)imagesViewHighlightedState
{
  return self->_imagesViewHighlightedState;
}

- (void)setImagesViewHighlightedState:(id)a3
{
}

- (VUIImageView)backgroundImagesViewDefaultState
{
  return self->_backgroundImagesViewDefaultState;
}

- (void)setBackgroundImagesViewDefaultState:(id)a3
{
}

- (VUIImageView)backgroundImagesViewHighlightedState
{
  return self->_backgroundImagesViewHighlightedState;
}

- (void)setBackgroundImagesViewHighlightedState:(id)a3
{
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

@end