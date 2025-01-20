@interface _UIBasicCellContentView
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
- (UILabel)textLabel;
- (_UIBasicCellContentView)initWithCoder:(id)a3;
- (_UIBasicCellContentView)initWithConfiguration:(id)a3;
- (_UIBasicCellContentViewConfiguration)configuration;
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

@implementation _UIBasicCellContentView

- (_UIBasicCellContentView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIBasicCellContentView.m", 449, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIBasicCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49___UIBasicCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v11 = v6;
    id v12 = v5;
    +[UIView performWithoutAnimation:v10];
  }
  return v7;
}

- (_UIBasicCellContentView)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIBasicCellContentView;
  v6 = [(UIView *)&v12 initWithCoder:v4];
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___UIBasicCellContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UIBasicCellContentView;
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
  v6.super_class = (Class)_UIBasicCellContentView;
  v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendFormat:@"; configuration = %@>", self->_configuration];
  }
  return (NSString *)v4;
}

- (_UIBasicCellContentViewConfiguration)configuration
{
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration) {
    animatingToConfiguration = self->_configuration;
  }
  v3 = (void *)[(_UIBasicCellContentViewConfiguration *)animatingToConfiguration copy];
  return (_UIBasicCellContentViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIBasicCellContentView.m", 502, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if ([(_UIContentViewEditingController *)self->_editingController isDisplayingEditedText]
    || !-[_UIBasicCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIBasicCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E52DC6C0;
        objc_copyWeak(&v16, &location);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        v8 = +[_UIContentViewAnimationStateUpdatingLayer layerForView:self withUpdateHandler:v15 completionHandler:v13];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke_3;
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
      -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }
  }
}

- (void)_applyConfiguration:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v29 = v4;
    if (!v4)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:sel__applyConfiguration_, a1, @"_UIBasicCellContentView.m", 558, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong(a1 + 55, a2);
    uint64_t v5 = [v29 axesPreservingSuperviewLayoutMargins];
    if ((v5 & 2) != 0) {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
    }
    else {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA;
    }
    [a1 setEdgesPreservingSuperviewLayoutMargins:v6];
    [v29 directionalLayoutMargins];
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 56;
    v8 = [v29 imageView];
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

    id v12 = v9 + 57;
    objc_super v13 = [v29 textLabel];
    id v14 = v9;
    v15 = (UILabel *)*v12;
    id v16 = v15;
    if (v13 && (v13[2] || v13[7]))
    {
      if (v15)
      {
        if ([(UIView *)v15 isHidden]) {
          [(UIView *)v16 setHidden:0];
        }
      }
      else
      {
        id v16 = objc_alloc_init(UILabel);
        objc_storeStrong(v12, v16);
        [v14 addSubview:v16];
      }
      [v13 applyToLabel:v16];
    }
    else if (v15 && ![(UIView *)v15 isHidden])
    {
      [(UIView *)v16 setHidden:1];
    }

    v17 = [v29 _textLabelEditingConfiguration];
    if (v17)
    {
      id v18 = v14[54];

      if (!v18)
      {
        v19 = [_UIContentViewEditingController alloc];
        v20 = [v14 textLabel];
        uint64_t v21 = [(_UIContentViewEditingController *)v19 initWithContentView:v14 editableLabel:v20];
        id v22 = v14[54];
        v14[54] = (id)v21;
      }
    }
    id v23 = v14[54];
    v24 = [v29 textLabel];
    v25 = [v29 _textLabelEditingConfiguration];
    [v23 updateLabelConfiguration:v24 editingConfiguration:v25];

    v26 = [v29 _textLabelEditingConfiguration];

    if (!v26)
    {
      id v27 = v14[54];
      v14[54] = 0;
    }
    v14[53] = (id)0x7FEFFFFFFFFFFFFFLL;
    [v14 invalidateIntrinsicContentSize];
    [v14 setNeedsLayout];
    id v4 = v29;
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

- (double)_multilineContextWidth
{
  return -1.0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  if ((*(void *)&self->super._viewFlags & 0x20000000000000) == 0) {
    return 0;
  }
  id v4 = [(_UIBasicCellContentView *)self textLabel];
  if (v4)
  {
    uint64_t v5 = [(_UIBasicCellContentView *)self textLabel];
    BOOL v2 = [v5 numberOfLines] != 1;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UIBasicCellContentView;
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
  v9.super_class = (Class)_UIBasicCellContentView;
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
  -[_UIBasicCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UIBasicCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
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
    *(void *)(a1 + 80) = 0;
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
  float64x2_t v53 = v9;
  *(void *)(a1 + 80) = 0;
  double v10 = [a2 traitCollection];
  double v11 = [a2 imageView];
  id v12 = [a2[55] imageView];
  [v12 maximumSize];
  v57.f64[0] = v13;
  v57.f64[1] = v14;

  uint64_t v15 = 0;
  if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v10))
  {
    id v16 = [a2[55] textLabel];
    char ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v11, &v57);

    if (ShouldUseAccessibilityTextWrappingLayout)
    {
      uint64_t v15 = 2;
      *(void *)a1 = 2;
      if (!v11)
      {
        double v55 = *v7;
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
  double v52 = v19;
  double v54 = v20;
  uint64_t v21 = [v11 image];
  id v22 = [a2[55] imageView];
  [v22 reservedLayoutSize];
  double v24 = _UIContentViewImageViewLayoutHeight(v21, v10, v54, v23, v57.f64[1]);
  *(double *)(a1 + 32) = v24;

  [a2 directionalLayoutMargins];
  double v27 = v25 + v26;
  v28.f64[0] = a3;
  if (v24 >= v54) {
    double v27 = -0.0;
  }
  v28.f64[1] = a4 + v27;
  v29.f64[0] = v52;
  v29.f64[1] = v54;
  float64x2_t v30 = vmaxnmq_f64(v53, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v57), vbslq_s8((int8x16_t)vcgtq_f64(v57, v28), (int8x16_t)v28, (int8x16_t)v57), (int8x16_t)v28)));
  BOOL v31 = v52 != v30.f64[0];
  if (v54 != v30.f64[1]) {
    BOOL v31 = 1;
  }
  if (v52 > 0.0 && v31 && v54 > 0.0)
  {
    v30.f64[0] = v30.f64[0] / v52;
    double v32 = v30.f64[1] / v54;
    if (v30.f64[0] < v30.f64[1] / v54) {
      double v32 = v30.f64[0];
    }
    float64x2_t v30 = vmulq_n_f64(v29, v32);
  }
  *(float64x2_t *)v7 = v30;
  double v55 = v30.f64[0];
  if (v18)
  {
    *(void *)(a1 + 40) = 0;
    double v8 = (double *)MEMORY[0x1E4F1DB30];
LABEL_26:
    [a2[55] imageToTextPadding];
    double v41 = v55 + v42;
    uint64_t v15 = 2;
    goto LABEL_27;
  }
  v33 = [v11 image];
  v34 = [a2[55] imageView];
  [v34 reservedLayoutSize];
  v36 = a2[55];
  if (v36) {
    BOOL v37 = (unint64_t)(v36[5] - 1) < 2;
  }
  else {
    BOOL v37 = 0;
  }
  double v8 = (double *)MEMORY[0x1E4F1DB30];
  double v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v10, v37, v55, v35);
  *(double *)(a1 + 40) = v38;

  double v39 = v55 + v38 + v38;
  *(double *)(a1 + 24) = v39;
  [a2[55] imageToTextPadding];
  a3 = a3 - (v39 + v40);
LABEL_24:
  double v41 = 0.0;
LABEL_27:
  v43 = [a2 textLabel];
  v44 = [a2[55] textLabel];
  _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v43, v44, v15, v41);

  *(double *)(a1 + 80) = v41;
  if (v43)
  {
    objc_msgSend(v43, "_intrinsicSizeWithinSize:", a3, a4);
    double v47 = fmax(v8[1], fmin(v46, a4));
    *(double *)(a1 + 48) = fmax(*v8, fmin(v45, a3));
    *(double *)(a1 + 56) = v47;
  }
  v48 = [a2[54] textInputView];

  if (v48)
  {
    v49 = [a2 textLabel];

    if (!v49)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:sel__computeSizesForAvailableSpace_ object:a2 file:@"_UIBasicCellContentView.m" lineNumber:694 description:@"The text label should exist if there is a text input view"];
    }
    uint64_t v50 = *(void *)(a1 + 56);
    *(double *)(a1 + 64) = a3 - v41;
    *(void *)(a1 + 72) = v50;
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
    -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
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
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  -[_UIBasicCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  double v20 = v19 + v15 + *(double *)&v38;
  double v21 = v17 + v13 + *((double *)&v38 + 1);
  if ((void)v35 != 2)
  {
    double v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      [(_UIBasicCellContentViewConfiguration *)self->_configuration imageToTextPadding];
      double v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21) {
      double v21 = v17 + v13 + *(double *)&v37;
    }
    double v20 = v22;
  }
  double v24 = [(_UIBasicCellContentView *)self textLabel];
  double v25 = [v24 font];
  double v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    float64x2_t v28 = [(_UIBasicCellContentViewConfiguration *)self->_configuration textLabel];
    id v27 = [v28 font];
  }
  [v10 minimumContentViewHeightForFont:v27 traitCollection:v9];
  double v30 = v29;
  if (v8) {
    -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
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
  v4.super_class = (Class)_UIBasicCellContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v127.receiver = self;
  v127.super_class = (Class)_UIBasicCellContentView;
  [(UIView *)&v127 layoutSubviews];
  [(_UIBasicCellContentView *)self _primaryTextLayoutFrame];
  CGFloat v108 = v4;
  CGFloat v109 = v3;
  CGFloat v106 = v6;
  CGFloat v107 = v5;
  [(UIView *)self _currentScreenScale];
  double v8 = v7;
  [(UIView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(UIView *)self directionalLayoutMargins];
  double v18 = v17;
  double v20 = v19;
  double v126 = 0.0;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v123 = 0u;
  memset(v122, 0, sizeof(v122));
  double v112 = v16 - v17 - v22;
  -[_UIBasicCellContentView _computeSizesForAvailableSpace:]((uint64_t)v122, (id *)&self->super.super.super.isa, v14 - v19 - v21, v112);
  double v23 = [(_UIBasicCellContentView *)self imageView];
  uint64_t v24 = *(void *)&v122[0];
  uint64_t v25 = 2;
  CGFloat v110 = v12;
  CGFloat v111 = v10;
  double v26 = v16;
  if (v23)
  {
    double v114 = v12;
    double v115 = v14;
    double v113 = v10;
    if (*(void *)&v122[0] != 2)
    {
      double v27 = *((double *)&v123 + 1);
      CGFloat v116 = v111;
      double v117 = v12;
      double v118 = v14;
      double v119 = v16;
      uint64_t v120 = 2;
      double v121 = v20 + *((double *)&v123 + 1);
      double v28 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *((double *)v122 + 1));
      double v32 = UIRectCenteredYInRectScale(v28, v29, v30, v31, 0.0, v18, 0.0, v112, v8);
      double v36 = UIRectIntegralWithScale(v32, v33, v34, v35, v8);
      double v26 = v37;
      double v113 = v36;
      double v114 = v38;
      double v115 = v39;
      objc_msgSend(v23, "setFrame:");
      [(_UIBasicCellContentViewConfiguration *)self->_configuration imageToTextPadding];
      double v20 = v27 + v40;
      uint64_t v25 = 8;
    }
  }
  else
  {
    double v114 = v12;
    double v115 = v14;
    double v113 = v10;
  }
  double v41 = [(_UIBasicCellContentView *)self textLabel];
  if (v41)
  {
    CGFloat v116 = v113;
    double v117 = v114;
    double v118 = v115;
    double v119 = v26;
    uint64_t v120 = v25;
    double v121 = v20;
    double v42 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *(double *)&v124);
    double v46 = UIRectCenteredYInRectScale(v42, v43, v44, v45, 0.0, v18, 0.0, v112, v8);
    objc_msgSend(v41, "setFrame:", UIRectIntegralWithScale(v46, v47, v48, v49, v8));
    if (v24)
    {
      double v104 = v26;
      double v105 = v18;
      [v23 frame];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      double LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v41);
      if (v24 == 2)
      {
        double v62 = v61;
        double v63 = v60;
        double v64 = v59;
        double v65 = LineOfLabel;
        [(UIView *)self bringSubviewToFront:v23];
        CGFloat v116 = v113;
        double v117 = v114;
        double v118 = v115;
        double v119 = v104;
        uint64_t v120 = v25;
        double v121 = v20;
        double v66 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *((double *)v122 + 1));
        double v71 = UIRectCenteredYInRectScale(v66, v67, v68, v69, v65, v64, v63, v62, v8);
        double v73 = v72;
        double v75 = v74;
      }
      else
      {
        double v71 = UIRectCenteredYInRectScale(v51, v53, v55, v57, LineOfLabel, v59, v60, v61, v8);
        double v77 = v76;
        double v73 = v78;
        double v75 = v79;
        v128.origin.double y = v110;
        v128.origin.double x = v111;
        v128.size.double width = v14;
        v128.size.double height = v16;
        double v80 = v105 * 0.5 + CGRectGetMinY(v128);
        if (v77 >= v80) {
          double v70 = v77;
        }
        else {
          double v70 = v80;
        }
      }
      objc_msgSend(v23, "setFrame:", UIRectIntegralWithScale(v71, v70, v73, v75, v8));
      double v26 = v104;
      double v18 = v105;
    }
  }
  if (v23)
  {
    v81 = [(_UIBasicCellContentViewConfiguration *)self->_configuration imageView];
    [v81 cornerRadius];
    _UIApplyCornerRadiusToView(v23, v82);
  }
  v83 = [(_UIContentViewEditingController *)self->_editingController textInputView];

  if (v83)
  {
    CGFloat v116 = v113;
    double v117 = v114;
    double v118 = v115;
    double v119 = v26;
    uint64_t v120 = v25;
    double v121 = v20 + v126;
    double v84 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *(double *)&v125);
    double v88 = UIRectCenteredYInRectScale(v84, v85, v86, v87, 0.0, v18, 0.0, v112, v8);
    double v92 = UIRectIntegralWithScale(v88, v89, v90, v91, v8);
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    v99 = [(_UIContentViewEditingController *)self->_editingController textInputView];
    objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);
  }
  if (self->_primaryTextFrameDidChangeHandler)
  {
    [(_UIBasicCellContentView *)self _primaryTextLayoutFrame];
    v130.origin.double x = v100;
    v130.origin.double y = v101;
    v130.size.double width = v102;
    v130.size.double height = v103;
    v129.origin.double y = v108;
    v129.origin.double x = v109;
    v129.size.double height = v106;
    v129.size.double width = v107;
    if (!CGRectEqualToRect(v129, v130)) {
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
    v5[2] = __47___UIBasicCellContentView_becomeFirstResponder__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    return [(_UIContentViewEditingController *)editingController makeTextInputFirstResponderWithInitialLayoutBlock:v5];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIBasicCellContentView;
    return [(UIView *)&v4 becomeFirstResponder];
  }
}

- (BOOL)_preventFocus
{
  return [(_UIContentViewEditingController *)self->_editingController isDisplayingEditedText];
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  objc_super v2 = [(_UIBasicCellContentView *)self textLabel];
  double v3 = [v2 _layoutRect];

  return (NSLayoutRect *)v3;
}

- (CGRect)_primaryTextLayoutFrame
{
  objc_super v2 = [(_UIBasicCellContentView *)self textLabel];
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
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end