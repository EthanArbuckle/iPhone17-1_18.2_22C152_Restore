@interface _UISubtitleCellContentView
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_preventFocus;
- (BOOL)becomeFirstResponder;
- (CGRect)_primaryTextLayoutFrame;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSLayoutRect)_primaryTextLayoutRect;
- (NSString)description;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)textLabel;
- (_UISubtitleCellContentView)initWithCoder:(id)a3;
- (_UISubtitleCellContentView)initWithConfiguration:(id)a3;
- (_UISubtitleCellContentViewConfiguration)configuration;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (id)_encodableSubviews;
- (id)_primaryTextFrameDidChangeHandler;
- (void)_applyConfiguration:(id *)a1;
- (void)_computeSizesForAvailableSpace:(double)a3;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_setPrimaryTextFrameDidChangeHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
@end

@implementation _UISubtitleCellContentView

- (_UISubtitleCellContentView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UISubtitleCellContentView.m", 443, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UISubtitleCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52___UISubtitleCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v11 = v6;
    id v12 = v5;
    +[UIView performWithoutAnimation:v10];
  }
  return v7;
}

- (_UISubtitleCellContentView)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UISubtitleCellContentView;
  v6 = [(UIView *)&v12 initWithCoder:v4];
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___UISubtitleCellContentView_initWithCoder___block_invoke;
  v9[3] = &unk_1E52D9F98;
  v7 = v6;
  v10 = v7;
  id v11 = v5;
  +[UIView performWithoutAnimation:v9];

LABEL_6:
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISubtitleCellContentView;
  id v4 = a3;
  [(UIView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, @"configuration", v5.receiver, v5.super_class);
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UISubtitleCellContentView;
  v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendFormat:@"; configuration = %@>", self->_configuration];
  }
  return (NSString *)v4;
}

- (_UISubtitleCellContentViewConfiguration)configuration
{
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration) {
    animatingToConfiguration = self->_configuration;
  }
  v3 = (void *)[(_UISubtitleCellContentViewConfiguration *)animatingToConfiguration copy];
  return (_UISubtitleCellContentViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UISubtitleCellContentView.m", 496, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if ([(_UIContentViewEditingController *)self->_editingController isDisplayingEditedText]
    || !-[_UISubtitleCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UISubtitleCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
  {
    v7 = (void *)[v5 copy];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      if (!animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, self->_configuration);
        objc_initWeak(&location, self);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E52DC6C0;
        objc_copyWeak(&v16, &location);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        v8 = +[_UIContentViewAnimationStateUpdatingLayer layerForView:self withUpdateHandler:v15 completionHandler:v13];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke_3;
        v11[3] = &unk_1E52DD408;
        id v9 = v8;
        id v12 = v9;
        +[UIView _addCompletionWithPosition:v11];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, v7);
        objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      }
      -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }
  }
}

- (void)_applyConfiguration:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v26 = v4;
    if (!v4)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:sel__applyConfiguration_, a1, @"_UISubtitleCellContentView.m", 552, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong(a1 + 55, a2);
    uint64_t v5 = [v26 axesPreservingSuperviewLayoutMargins];
    if ((v5 & 2) != 0) {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
    }
    else {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA;
    }
    [a1 setEdgesPreservingSuperviewLayoutMargins:v6];
    [v26 directionalLayoutMargins];
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 56;
    v8 = [v26 imageView];
    id v9 = a1;
    v10 = (UIImageView *)*v7;
    id v11 = v10;
    if (v8 && (v8[2] || v8[6]))
    {
      if (v10)
      {
        if ([(UIView *)v10 isHidden]) {
          [(UIImageView *)v11 setHidden:0];
        }
      }
      else
      {
        id v11 = objc_alloc_init(UIImageView);
        objc_storeStrong(v7, v11);
        [v9 addSubview:v11];
      }
      [v8 applyToImageView:v11];
    }
    else if (v10 && ![(UIView *)v10 isHidden])
    {
      [(UIImageView *)v11 setHidden:1];
    }

    id v12 = [v26 textLabel];
    _UIUpdateLabelUsingConfiguration(v9, v9 + 57, v12);

    objc_super v13 = [v26 subtitleLabel];
    _UIUpdateLabelUsingConfiguration(v9, v9 + 58, v13);

    id v14 = [v26 _textLabelEditingConfiguration];
    if (v14)
    {
      id v15 = v9[54];

      if (!v15)
      {
        id v16 = [_UIContentViewEditingController alloc];
        v17 = [v9 textLabel];
        uint64_t v18 = [(_UIContentViewEditingController *)v16 initWithContentView:v9 editableLabel:v17];
        id v19 = v9[54];
        v9[54] = (id)v18;
      }
    }
    id v20 = v9[54];
    v21 = [v26 textLabel];
    v22 = [v26 _textLabelEditingConfiguration];
    [v20 updateLabelConfiguration:v21 editingConfiguration:v22];

    v23 = [v26 _textLabelEditingConfiguration];

    if (!v23)
    {
      id v24 = v9[54];
      v9[54] = 0;
    }
    v9[53] = (id)0x7FEFFFFFFFFFFFFFLL;
    [v9 invalidateIntrinsicContentSize];
    [v9 setNeedsLayout];
    id v4 = v26;
  }
}

- (UIImageView)imageView
{
  if ([(UIView *)self->_imageView isHidden]) {
    imageView = 0;
  }
  else {
    imageView = self->_imageView;
  }
  return imageView;
}

- (UILabel)textLabel
{
  if ([(UIView *)self->_textLabel isHidden]) {
    textLabel = 0;
  }
  else {
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (UILabel)subtitleLabel
{
  if ([(UIView *)self->_subtitleLabel isHidden]) {
    subtitleLabel = 0;
  }
  else {
    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  if ((*(void *)&self->super._viewFlags & 0x20000000000000) != 0)
  {
    uint64_t v5 = [(_UISubtitleCellContentView *)self textLabel];
    if (!v5
      || ([(_UISubtitleCellContentView *)self textLabel],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 numberOfLines] == 1))
    {
      uint64_t v6 = [(_UISubtitleCellContentView *)self subtitleLabel];
      if (v6)
      {
        v7 = (void *)v6;
        v8 = [(_UISubtitleCellContentView *)self subtitleLabel];
        BOOL v3 = [v8 numberOfLines] != 1;

        if (!v5)
        {
LABEL_9:

          return v3;
        }
      }
      else
      {
        BOOL v3 = 0;
        if (!v5) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      BOOL v3 = 1;
    }

    goto LABEL_9;
  }
  return 0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UISubtitleCellContentView;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)_UISubtitleCellContentView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (double)_preferredMaxLayoutWidth
{
  double result = 0.0;
  if ((*(void *)&self->super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (a3.height <= 0.0) {
    a3.double height = 1.79769313e308;
  }
  -[_UISubtitleCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = 1.79769313e308;
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (height > 0.0) {
    double v9 = height;
  }
  -[_UISubtitleCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0) {
    double v10 = width;
  }
  if (a5 >= 1000.0) {
    double v11 = height;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_computeSizesForAvailableSpace:(double)a3
{
  if (!a2)
  {
    *(void *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  v7 = (double *)(a1 + 8);
  *(void *)a1 = 0;
  double v8 = (double *)MEMORY[0x1E4F1DB30];
  float64x2_t v9 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)(a1 + 8) = *MEMORY[0x1E4F1DB30];
  *(float64x2_t *)(a1 + 24) = v9;
  *(void *)(a1 + 40) = 0;
  *(float64x2_t *)(a1 + 48) = v9;
  *(float64x2_t *)(a1 + 64) = v9;
  *(float64x2_t *)(a1 + 80) = v9;
  *(float64x2_t *)(a1 + 96) = v9;
  float64x2_t v62 = v9;
  *(void *)(a1 + 112) = 0;
  double v10 = [a2 traitCollection];
  double v11 = [a2 imageView];
  id v12 = [a2[55] imageView];
  [v12 maximumSize];
  v66.f64[0] = v13;
  v66.f64[1] = v14;

  uint64_t v15 = 0;
  if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v10))
  {
    id v16 = [a2[55] textLabel];
    char ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v11, &v66);

    if (ShouldUseAccessibilityTextWrappingLayout)
    {
      uint64_t v15 = 2;
      *(void *)a1 = 2;
      if (!v11)
      {
        double v64 = *v7;
        goto LABEL_26;
      }
      int v18 = 1;
      goto LABEL_9;
    }
    uint64_t v15 = 1;
    *(void *)a1 = 1;
  }
  if (!v11) {
    goto LABEL_24;
  }
  int v18 = 0;
LABEL_9:
  objc_msgSend(v11, "_intrinsicSizeWithinSize:", a3, a4);
  double v61 = v19;
  double v63 = v20;
  v21 = [v11 image];
  v22 = [a2[55] imageView];
  [v22 reservedLayoutSize];
  double v24 = _UIContentViewImageViewLayoutHeight(v21, v10, v63, v23, v66.f64[1]);
  *(double *)(a1 + 32) = v24;

  [a2 directionalLayoutMargins];
  double v27 = v25 + v26;
  v28.f64[0] = a3;
  if (v24 >= v63) {
    double v27 = -0.0;
  }
  v28.f64[1] = a4 + v27;
  v29.f64[0] = v61;
  v29.f64[1] = v63;
  float64x2_t v30 = vmaxnmq_f64(v62, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v66), vbslq_s8((int8x16_t)vcgtq_f64(v66, v28), (int8x16_t)v28, (int8x16_t)v66), (int8x16_t)v28)));
  BOOL v31 = v61 != v30.f64[0];
  if (v63 != v30.f64[1]) {
    BOOL v31 = 1;
  }
  if (v61 > 0.0 && v31 && v63 > 0.0)
  {
    v30.f64[0] = v30.f64[0] / v61;
    double v32 = v30.f64[1] / v63;
    if (v30.f64[0] < v30.f64[1] / v63) {
      double v32 = v30.f64[0];
    }
    float64x2_t v30 = vmulq_n_f64(v29, v32);
  }
  *(float64x2_t *)v7 = v30;
  double v64 = v30.f64[0];
  if (v18)
  {
    *(void *)(a1 + 40) = 0;
    double v8 = (double *)MEMORY[0x1E4F1DB30];
LABEL_26:
    [a2[55] imageToTextPadding];
    double v41 = v64 + v42;
    uint64_t v15 = 2;
    goto LABEL_27;
  }
  v33 = [v11 image];
  v34 = [a2[55] imageView];
  [v34 reservedLayoutSize];
  v36 = a2[55];
  if (v36) {
    BOOL v37 = v36[6] == 1;
  }
  else {
    BOOL v37 = 0;
  }
  double v8 = (double *)MEMORY[0x1E4F1DB30];
  double v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v10, v37, v64, v35);
  *(double *)(a1 + 40) = v38;

  double v39 = v64 + v38 + v38;
  *(double *)(a1 + 24) = v39;
  [a2[55] imageToTextPadding];
  a3 = a3 - (v39 + v40);
LABEL_24:
  double v41 = 0.0;
LABEL_27:
  v43 = [a2 textLabel];
  v44 = [a2[55] textLabel];
  _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v43, v44, v15, v41);

  v45 = [a2 subtitleLabel];
  v46 = [a2[55] subtitleLabel];
  _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v45, v46, v15, 0.0);

  *(double *)(a1 + 112) = v41;
  if (v43)
  {
    objc_msgSend(v43, "_intrinsicSizeWithinSize:", a3, a4);
    double v49 = fmax(v8[1], fmin(v48, a4));
    *(double *)(a1 + 48) = fmax(*v8, fmin(v47, a3));
    *(double *)(a1 + 56) = v49;
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a1 + 48);
  }
  if (v45)
  {
    double v50 = *(double *)(a1 + 88);
    [a2[55] textToSubtitlePadding];
    double v52 = a4 - (v50 + v51);
    objc_msgSend(v45, "_intrinsicSizeWithinSize:", a3, v52);
    double v54 = fmax(*v8, fmin(v53, a3));
    double v56 = fmax(v8[1], fmin(v55, v52));
    *(double *)(a1 + 64) = v54;
    *(double *)(a1 + 72) = v56;
    if (*(double *)(a1 + 80) >= v54) {
      double v54 = *(double *)(a1 + 80);
    }
    *(double *)(a1 + 80) = v54;
    [a2[55] textToSubtitlePadding];
    *(double *)(a1 + 88) = v50 + v56 + v57;
  }
  v58 = [a2[54] textInputView];

  if (v58)
  {
    if (!v43 || [v43 isHidden])
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:sel__computeSizesForAvailableSpace_ object:a2 file:@"_UISubtitleCellContentView.m" lineNumber:708 description:@"The text label should exist if there is a text input view"];
    }
    uint64_t v59 = *(void *)(a1 + 56);
    *(double *)(a1 + 96) = a3 - v41;
    *(void *)(a1 + 104) = v59;
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    double v8 = configuration;
    -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    double v8 = 0;
  }
  float64x2_t v9 = [(UIView *)self traitCollection];
  double v10 = _UITableConstantsForTraitCollection(v9);
  if (width >= self->_preferredMaxLayoutWidth) {
    double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  }
  else {
    double preferredMaxLayoutWidth = width;
  }
  [(UIView *)self directionalLayoutMargins];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  -[_UISubtitleCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  double v20 = v19 + v15 + *(double *)&v40;
  double v21 = v17 + v13 + *((double *)&v40 + 1);
  if ((void)v35 != 2)
  {
    double v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      [(_UISubtitleCellContentViewConfiguration *)self->_configuration imageToTextPadding];
      double v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21) {
      double v21 = v17 + v13 + *(double *)&v37;
    }
    double v20 = v22;
  }
  double v24 = [(_UISubtitleCellContentView *)self textLabel];
  double v25 = [v24 font];
  double v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    float64x2_t v28 = [(_UISubtitleCellContentViewConfiguration *)self->_configuration textLabel];
    id v27 = [v28 font];
  }
  [v10 minimumContentViewHeightForFont:v27 traitCollection:v9];
  double v30 = v29;
  if (v8) {
    -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  }
  if (preferredMaxLayoutWidth >= v20) {
    double v31 = v20;
  }
  else {
    double v31 = preferredMaxLayoutWidth;
  }
  if (v30 >= v21) {
    double v32 = v30;
  }
  else {
    double v32 = v21;
  }
  if (height >= v32) {
    double height = v32;
  }

  double v33 = v31;
  double v34 = height;
  result.double height = v34;
  result.double width = v33;
  return result;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISubtitleCellContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v140.receiver = self;
  v140.super_class = (Class)_UISubtitleCellContentView;
  [(UIView *)&v140 layoutSubviews];
  [(_UISubtitleCellContentView *)self _primaryTextLayoutFrame];
  CGFloat v120 = v4;
  CGFloat v121 = v3;
  CGFloat v118 = v6;
  CGFloat v119 = v5;
  [(UIView *)self _currentScreenScale];
  double v8 = v7;
  [(UIView *)self bounds];
  CGFloat v122 = v10;
  CGFloat v123 = v9;
  double v12 = v11;
  double v14 = v13;
  [(UIView *)self directionalLayoutMargins];
  double v16 = v15;
  double v18 = v17;
  double v139 = 0.0;
  double v21 = v14 - v15 - v20;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v134 = 0u;
  memset(v133, 0, sizeof(v133));
  -[_UISubtitleCellContentView _computeSizesForAvailableSpace:]((uint64_t)v133, (id *)&self->super.super.super.isa, v12 - v17 - v19, v21);
  double v22 = [(_UISubtitleCellContentView *)self imageView];
  uint64_t v23 = *(void *)&v133[0];
  double v126 = v8;
  CGFloat v113 = v14;
  CGFloat v114 = v12;
  if (!v22 || *(void *)&v133[0] == 2)
  {
    uint64_t v40 = 2;
    CGFloat v39 = v122;
    double v125 = v123;
  }
  else
  {
    double v24 = *((double *)&v134 + 1);
    CGFloat v127 = v123;
    CGFloat v128 = v122;
    double v129 = v12;
    double v130 = v14;
    uint64_t v131 = 2;
    double v132 = v18 + *((double *)&v134 + 1);
    double v25 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, 0.0, *((double *)v133 + 1));
    double v29 = UIRectCenteredYInRectScale(v25, v26, v27, v28, 0.0, v16, 0.0, v21, v8);
    double v33 = UIRectIntegralWithScale(v29, v30, v31, v32, v8);
    double v35 = v34;
    double v12 = v36;
    double v14 = v37;
    double v125 = v33;
    objc_msgSend(v22, "setFrame:");
    [(_UISubtitleCellContentViewConfiguration *)self->_configuration imageToTextPadding];
    double v18 = v24 + v38;
    CGFloat v39 = v35;
    double v8 = v126;
    uint64_t v40 = 8;
  }
  v141.origin.double x = UIRectCenteredYInRectScale(0.0, 0.0, *(double *)&v137, *((double *)&v137 + 1), 0.0, v16, 0.0, v21, v8);
  double MinY = CGRectGetMinY(v141);
  uint64_t v42 = [(_UISubtitleCellContentView *)self textLabel];
  double v124 = MinY;
  double v43 = v125;
  if (v42)
  {
    CGFloat v127 = v125;
    CGFloat v128 = v39;
    double v115 = v39;
    double v116 = v12;
    double v129 = v12;
    double v130 = v14;
    double v117 = v14;
    uint64_t v131 = v40;
    double v132 = v18;
    double v44 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, MinY, *(double *)&v135);
    double v48 = UIRectIntegralWithScale(v44, v45, v46, v47, v126);
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    objc_msgSend(v42, "setFrame:");
    v142.origin.double x = v48;
    v142.origin.double y = v50;
    v142.size.double width = v52;
    v142.size.double height = v54;
    double MaxY = CGRectGetMaxY(v142);
    [(_UISubtitleCellContentViewConfiguration *)self->_configuration textToSubtitlePadding];
    double MinY = MaxY + v56;
    if (v23)
    {
      [v22 frame];
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v42);
      if (v23 == 2)
      {
        double v69 = v68;
        double v70 = v67;
        double v71 = v66;
        double v72 = LineOfLabel;
        [(UIView *)self bringSubviewToFront:v22];
        CGFloat v127 = v125;
        CGFloat v128 = v115;
        double v129 = v116;
        double v130 = v117;
        uint64_t v131 = v40;
        double v132 = v18;
        double v73 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, 0.0, *((double *)v133 + 1));
        double v74 = v126;
        double v79 = UIRectCenteredYInRectScale(v73, v75, v76, v77, v72, v71, v70, v69, v126);
        double v81 = v80;
        double v83 = v82;
      }
      else
      {
        double v74 = v126;
        double v79 = UIRectCenteredYInRectScale(v58, v60, v62, v64, LineOfLabel, v66, v67, v68, v126);
        double v85 = v84;
        double v81 = v86;
        double v83 = v87;
        v143.origin.double y = v122;
        v143.origin.double x = v123;
        v143.size.double height = v113;
        v143.size.double width = v114;
        double v88 = v16 * 0.5 + CGRectGetMinY(v143);
        if (v85 >= v88) {
          double v78 = v85;
        }
        else {
          double v78 = v88;
        }
      }
      objc_msgSend(v22, "setFrame:", UIRectIntegralWithScale(v79, v78, v81, v83, v74));
      double v12 = v116;
      double v14 = v117;
      CGFloat v39 = v115;
      double v43 = v125;
    }
    else
    {
      double v12 = v116;
      CGFloat v39 = v115;
    }
  }
  if (v22)
  {
    v89 = [(_UISubtitleCellContentViewConfiguration *)self->_configuration imageView];
    [v89 cornerRadius];
    _UIApplyCornerRadiusToView(v22, v90);
  }
  v91 = [(_UISubtitleCellContentView *)self subtitleLabel];
  if (v91)
  {
    CGFloat v127 = v43;
    CGFloat v128 = v39;
    double v129 = v12;
    double v130 = v14;
    uint64_t v131 = v40;
    double v132 = v18;
    double v92 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, MinY, *(double *)&v136);
    objc_msgSend(v91, "setFrame:", UIRectIntegralWithScale(v92, v93, v94, v95, v126));
  }
  v96 = [(_UIContentViewEditingController *)self->_editingController textInputView];

  if (v96)
  {
    CGFloat v127 = v43;
    CGFloat v128 = v39;
    double v129 = v12;
    double v130 = v14;
    uint64_t v131 = v40;
    double v132 = v18 + v139;
    double v97 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, v124, *(double *)&v138);
    double v101 = UIRectIntegralWithScale(v97, v98, v99, v100, v126);
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    v108 = [(_UIContentViewEditingController *)self->_editingController textInputView];
    objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);
  }
  if (self->_primaryTextFrameDidChangeHandler)
  {
    [(_UISubtitleCellContentView *)self _primaryTextLayoutFrame];
    v145.origin.double x = v109;
    v145.origin.double y = v110;
    v145.size.double width = v111;
    v145.size.double height = v112;
    v144.origin.double y = v120;
    v144.origin.double x = v121;
    v144.size.double height = v118;
    v144.size.double width = v119;
    if (!CGRectEqualToRect(v144, v145)) {
      (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
    }
  }
}

- (BOOL)becomeFirstResponder
{
  editingController = self->_editingController;
  if (editingController)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50___UISubtitleCellContentView_becomeFirstResponder__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    return [(_UIContentViewEditingController *)editingController makeTextInputFirstResponderWithInitialLayoutBlock:v5];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UISubtitleCellContentView;
    return [(UIView *)&v4 becomeFirstResponder];
  }
}

- (BOOL)_preventFocus
{
  return [(_UIContentViewEditingController *)self->_editingController isDisplayingEditedText];
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  objc_super v2 = [(_UISubtitleCellContentView *)self textLabel];
  double v3 = [v2 _layoutRect];

  return (NSLayoutRect *)v3;
}

- (CGRect)_primaryTextLayoutFrame
{
  objc_super v2 = [(_UISubtitleCellContentView *)self textLabel];
  double v3 = v2;
  if (v2)
  {
    [v2 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)_primaryTextFrameDidChangeHandler
{
  return self->_primaryTextFrameDidChangeHandler;
}

- (void)_setPrimaryTextFrameDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primaryTextFrameDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end