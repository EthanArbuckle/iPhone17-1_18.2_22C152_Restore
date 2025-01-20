@interface _UIValueCellContentView
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (CGRect)_primaryTextLayoutFrame;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSLayoutRect)_primaryTextLayoutRect;
- (NSString)description;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (UILabel)valueLabel;
- (_UIValueCellContentView)initWithCoder:(id)a3;
- (_UIValueCellContentView)initWithConfiguration:(id)a3;
- (_UIValueCellContentViewConfiguration)configuration;
- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5;
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

@implementation _UIValueCellContentView

- (_UIValueCellContentView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIValueCellContentView.m", 439, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIValueCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49___UIValueCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v11 = v6;
    id v12 = v5;
    +[UIView performWithoutAnimation:v10];
  }
  return v7;
}

- (_UIValueCellContentView)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIValueCellContentView;
  v6 = [(UIView *)&v12 initWithCoder:v4];
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___UIValueCellContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UIValueCellContentView;
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
  v6.super_class = (Class)_UIValueCellContentView;
  v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendFormat:@"; configuration = %@>", self->_configuration];
  }
  return (NSString *)v4;
}

- (_UIValueCellContentViewConfiguration)configuration
{
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration) {
    animatingToConfiguration = self->_configuration;
  }
  v3 = (void *)[(_UIValueCellContentViewConfiguration *)animatingToConfiguration copy];
  return (_UIValueCellContentViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIValueCellContentView.m", 492, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[_UIValueCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIValueCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __44___UIValueCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E52DC6C0;
        objc_copyWeak(&v16, &location);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44___UIValueCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        v8 = +[_UIContentViewAnimationStateUpdatingLayer layerForView:self withUpdateHandler:v15 completionHandler:v13];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __44___UIValueCellContentView_setConfiguration___block_invoke_3;
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
      -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }
  }
}

- (void)_applyConfiguration:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v15 = v4;
    if (!v4)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__applyConfiguration_, a1, @"_UIValueCellContentView.m", 548, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong(a1 + 54, a2);
    uint64_t v5 = [v15 axesPreservingSuperviewLayoutMargins];
    if ((v5 & 2) != 0) {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
    }
    else {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA;
    }
    [a1 setEdgesPreservingSuperviewLayoutMargins:v6];
    [v15 directionalLayoutMargins];
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 55;
    v8 = [v15 imageView];
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

    id v12 = [v15 textLabel];
    _UIUpdateLabelUsingConfiguration(v9, v9 + 56, v12);

    objc_super v13 = [v15 valueLabel];
    _UIUpdateLabelUsingConfiguration(v9, v9 + 57, v13);

    v9[53] = (id)0x7FEFFFFFFFFFFFFFLL;
    [v9 invalidateIntrinsicContentSize];
    [v9 setNeedsLayout];
    id v4 = v15;
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

- (UILabel)valueLabel
{
  if ([(UIView *)self->_valueLabel isHidden]) {
    valueLabel = 0;
  }
  else {
    valueLabel = self->_valueLabel;
  }
  return valueLabel;
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
  uint64_t v4 = [(_UIValueCellContentView *)self textLabel];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(_UIValueCellContentView *)self valueLabel];

    if (v6) {
      return 1;
    }
  }
  uint64_t v7 = [(_UIValueCellContentView *)self textLabel];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(_UIValueCellContentView *)self textLabel];
    uint64_t v10 = [v9 numberOfLines];

    if (v10 != 1) {
      return 1;
    }
  }
  uint64_t v11 = [(_UIValueCellContentView *)self valueLabel];
  if (!v11) {
    return 0;
  }
  id v12 = (void *)v11;
  objc_super v13 = [(_UIValueCellContentView *)self valueLabel];
  uint64_t v14 = [v13 numberOfLines];

  return v14 != 1;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UIValueCellContentView;
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
  v9.super_class = (Class)_UIValueCellContentView;
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
  -[_UIValueCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UIValueCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
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

- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5
{
  id v9 = a2;
  uint64_t v10 = [v9 numberOfLines];
  [v9 bounds];
  if (a3)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke;
    v37[3] = &unk_1E52DA260;
    uint64_t v39 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    uint64_t v17 = v13;
    uint64_t v27 = v14;
    id v18 = v9;
    id v38 = v18;
    double v40 = a4;
    double v41 = a5;
    +[UIView performWithoutAnimation:v37];

    objc_msgSend(v18, "_intrinsicSizeWithinSize:", a4, a5);
    double v20 = v19;
    *a3 = [v18 _measuredNumberOfLines] > 1;
    BOOL v21 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2;
    v28[3] = &unk_1E52E91C0;
    id v22 = v18;
    uint64_t v30 = a1;
    uint64_t v31 = v10;
    BOOL v36 = v21;
    id v29 = v22;
    uint64_t v32 = v15;
    uint64_t v33 = v16;
    uint64_t v34 = v17;
    uint64_t v35 = v27;
    +[UIView performWithoutAnimation:v28];
    if (v10 == 1)
    {
      objc_msgSend(v22, "_intrinsicSizeWithinSize:", a4, a5);
      double v20 = v23;
    }
  }
  else
  {
    objc_msgSend(v9, "_intrinsicSizeWithinSize:", a4, a5);
    double v20 = v24;
  }
  double v25 = fmax(*MEMORY[0x1E4F1DB30], fmin(v20, a4));

  return v25;
}

- (void)_computeSizesForAvailableSpace:(double)a3
{
  if (a2)
  {
    uint64_t v7 = (double *)(a1 + 8);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(void *)(a1 + 48) = 0;
    float64x2_t v8 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
    *(_OWORD *)(a1 + 8) = *MEMORY[0x1E4F1DB30];
    *(float64x2_t *)(a1 + 24) = v8;
    *(float64x2_t *)(a1 + 56) = v8;
    *(float64x2_t *)(a1 + 72) = v8;
    float64x2_t v66 = v8;
    *(float64x2_t *)(a1 + 88) = v8;
    id v9 = [a2 traitCollection];
    uint64_t v10 = [a2 imageView];
    uint64_t v11 = [a2[54] imageView];
    [v11 maximumSize];
    v71.f64[0] = v12;
    v71.f64[1] = v13;

    uint64_t v14 = 0;
    if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v9))
    {
      uint64_t v15 = [a2[54] textLabel];
      char ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v15, v10, &v71);

      if (ShouldUseAccessibilityTextWrappingLayout)
      {
        uint64_t v14 = 2;
        *(void *)a1 = 2;
        if (!v10)
        {
          double v68 = *v7;
          goto LABEL_26;
        }
        int v17 = 1;
        goto LABEL_9;
      }
      uint64_t v14 = 1;
      *(void *)a1 = 1;
    }
    if (!v10) {
      goto LABEL_24;
    }
    int v17 = 0;
LABEL_9:
    objc_msgSend(v10, "_intrinsicSizeWithinSize:", a3, a4);
    double v65 = v18;
    double v67 = v19;
    double v20 = [v10 image];
    BOOL v21 = [a2[54] imageView];
    [v21 reservedLayoutSize];
    double v23 = _UIContentViewImageViewLayoutHeight(v20, v9, v67, v22, v71.f64[1]);
    *(double *)(a1 + 32) = v23;

    [a2 directionalLayoutMargins];
    double v26 = v24 + v25;
    v27.f64[0] = a3;
    if (v23 >= v67) {
      double v26 = -0.0;
    }
    v27.f64[1] = a4 + v26;
    v28.f64[0] = v65;
    v28.f64[1] = v67;
    float64x2_t v29 = vmaxnmq_f64(v66, vminnmq_f64(v28, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v71), vbslq_s8((int8x16_t)vcgtq_f64(v71, v27), (int8x16_t)v27, (int8x16_t)v71), (int8x16_t)v27)));
    BOOL v30 = v65 != v29.f64[0];
    if (v67 != v29.f64[1]) {
      BOOL v30 = 1;
    }
    if (v65 > 0.0 && v30 && v67 > 0.0)
    {
      v29.f64[0] = v29.f64[0] / v65;
      double v31 = v29.f64[1] / v67;
      if (v29.f64[0] < v29.f64[1] / v67) {
        double v31 = v29.f64[0];
      }
      float64x2_t v29 = vmulq_n_f64(v28, v31);
    }
    *(float64x2_t *)uint64_t v7 = v29;
    double v68 = v29.f64[0];
    if (v17)
    {
      *(void *)(a1 + 40) = 0;
LABEL_26:
      [a2[54] imageToTextPadding];
      double v40 = v68 + v41;
      uint64_t v14 = 2;
LABEL_27:
      v42 = (_OWORD *)(a1 + 56);
      v43 = [a2 textLabel];
      v44 = [a2[54] textLabel];
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v43, v44, v14, v40);

      v45 = [a2 valueLabel];
      v46 = [a2[54] valueLabel];
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v45, v46, v14, 0.0);

      if (v43)
      {
        BOOL v70 = 0;
        double v48 = [(_UIValueCellContentView *)(uint64_t)a2 _intrinsicSizeForLabel:&v70 inAvailableSpace:a3 outRequiresMultipleLines:a4];
        *(double *)(a1 + 56) = v48;
        *(double *)(a1 + 64) = v47;
        *(_OWORD *)(a1 + 88) = *v42;
        if (v14) {
          BOOL v49 = 0;
        }
        else {
          BOOL v49 = !v70;
        }
        char v50 = !v49;
        *(unsigned char *)(a1 + 48) = v50;
        if (!v45) {
          goto LABEL_55;
        }
        if (v50) {
          goto LABEL_52;
        }
      }
      else
      {
        if (!v45)
        {
LABEL_55:

          return;
        }
        double v48 = *(double *)v42;
      }
      [a2[54] textToValuePadding];
      double v52 = a3 - v48 - v51;
      if (v52 >= 0.0)
      {
        BOOL v70 = 0;
        *(double *)(a1 + 72) = [(_UIValueCellContentView *)(uint64_t)a2 _intrinsicSizeForLabel:&v70 inAvailableSpace:v52 outRequiresMultipleLines:a4];
        *(void *)(a1 + 80) = v57;
        double v47 = *(double *)(a1 + 64);
        BOOL v58 = v48 != *MEMORY[0x1E4F1DB30];
        if (v47 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
          BOOL v58 = 1;
        }
        if (!v70) {
          BOOL v58 = 0;
        }
        *(unsigned char *)(a1 + 48) = v58;
        if (!v58) {
          goto LABEL_43;
        }
      }
      else
      {
        double v47 = *(double *)(a1 + 64);
        BOOL v53 = v48 != *MEMORY[0x1E4F1DB30];
        if (v47 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
          BOOL v53 = 1;
        }
        *(unsigned char *)(a1 + 48) = v53;
        if (!v53)
        {
LABEL_43:
          [a2[54] textToValuePadding];
          double v55 = *(double *)(a1 + 88) + v54 + *(double *)(a1 + 72);
          if (*(double *)(a1 + 96) >= *(double *)(a1 + 80)) {
            uint64_t v56 = *(void *)(a1 + 96);
          }
          else {
            uint64_t v56 = *(void *)(a1 + 80);
          }
          *(double *)(a1 + 88) = v55;
          *(void *)(a1 + 96) = v56;
          goto LABEL_55;
        }
      }
LABEL_52:
      double v59 = a4 - v47;
      [a2[54] textToValuePadding];
      double v61 = [(_UIValueCellContentView *)(uint64_t)a2 _intrinsicSizeForLabel:0 inAvailableSpace:a3 outRequiresMultipleLines:v59 - v60];
      double v63 = v62;
      *(double *)(a1 + 72) = v61;
      *(double *)(a1 + 80) = v62;
      if (*(double *)(a1 + 88) >= v61) {
        double v61 = *(double *)(a1 + 88);
      }
      *(double *)(a1 + 88) = v61;
      [a2[54] textToValuePadding];
      *(double *)(a1 + 96) = *(double *)(a1 + 96) + v63 + v64;
      goto LABEL_55;
    }
    uint64_t v32 = [v10 image];
    uint64_t v33 = [a2[54] imageView];
    [v33 reservedLayoutSize];
    uint64_t v35 = a2[54];
    if (v35) {
      BOOL v36 = v35[4] == 1;
    }
    else {
      BOOL v36 = 0;
    }
    double v37 = _UIContentViewImageViewHorizontalCenteringOffset(v32, v9, v36, v68, v34);
    *(double *)(a1 + 40) = v37;

    double v38 = v68 + v37 + v37;
    *(double *)(a1 + 24) = v38;
    [a2[54] imageToTextPadding];
    a3 = a3 - (v38 + v39);
LABEL_24:
    double v40 = 0.0;
    goto LABEL_27;
  }
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    float64x2_t v8 = configuration;
    -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    float64x2_t v8 = 0;
  }
  id v9 = [(UIView *)self traitCollection];
  uint64_t v10 = _UITableConstantsForTraitCollection(v9);
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
  double v41 = 0.0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  -[_UIValueCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  double v20 = v19 + v15 + *((double *)&v40 + 1);
  double v21 = v17 + v13 + v41;
  if ((void)v35 != 2)
  {
    double v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      [(_UIValueCellContentViewConfiguration *)self->_configuration imageToTextPadding];
      double v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21) {
      double v21 = v17 + v13 + *(double *)&v37;
    }
    double v20 = v22;
  }
  double v24 = [(_UIValueCellContentView *)self textLabel];
  double v25 = [v24 font];
  double v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    float64x2_t v28 = [(_UIValueCellContentViewConfiguration *)self->_configuration textLabel];
    id v27 = [v28 font];
  }
  [v10 minimumContentViewHeightForFont:v27 traitCollection:v9];
  double v30 = v29;
  if (v8) {
    -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
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
  v4.super_class = (Class)_UIValueCellContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v148.receiver = self;
  v148.super_class = (Class)_UIValueCellContentView;
  [(UIView *)&v148 layoutSubviews];
  [(_UIValueCellContentView *)self _primaryTextLayoutFrame];
  CGFloat v4 = v3;
  CGFloat v127 = v6;
  CGFloat v128 = v5;
  CGFloat rect1 = v7;
  [(UIView *)self _currentScreenScale];
  double v9 = v8;
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIView *)self directionalLayoutMargins];
  double v19 = v18;
  CGFloat v130 = v17;
  CGFloat v131 = v15;
  double v129 = v20;
  double v22 = v17 - v20 - v21;
  double v147 = 0.0;
  long long v145 = 0u;
  long long v146 = 0u;
  double v120 = v23;
  long long v143 = 0u;
  long long v144 = 0u;
  memset(v142, 0, sizeof(v142));
  -[_UIValueCellContentView _computeSizesForAvailableSpace:]((uint64_t)v142, (id *)&self->super.super.super.isa, v15 - v18 - v23, v22);
  double v24 = [(_UIValueCellContentView *)self imageView];
  uint64_t v25 = *(void *)&v142[0];
  CGFloat v122 = v13;
  CGFloat v123 = v11;
  if (!v24 || *(void *)&v142[0] == 2)
  {
    uint64_t v40 = 2;
    double v134 = v15;
    double v135 = v17;
    double v132 = v11;
    CGFloat v133 = v13;
    double v28 = v129;
  }
  else
  {
    double v26 = *((double *)&v143 + 1);
    double v136 = v11;
    double v137 = v13;
    double v138 = v15;
    CGFloat v139 = v130;
    uint64_t v140 = 2;
    double v141 = v19 + *((double *)&v143 + 1);
    double v27 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, 0.0, *((double *)v142 + 1));
    double v28 = v129;
    double v32 = UIRectCenteredYInRectScale(v27, v29, v30, v31, 0.0, v129, 0.0, v22, v9);
    double v132 = UIRectIntegralWithScale(v32, v33, v34, v35, v9);
    CGFloat v133 = v36;
    double v134 = v37;
    double v135 = v38;
    objc_msgSend(v24, "setFrame:");
    [(_UIValueCellContentViewConfiguration *)self->_configuration imageToTextPadding];
    double v19 = v26 + v39;
    uint64_t v40 = 8;
  }
  v149.origin.CGFloat x = UIRectCenteredYInRectScale(0.0, 0.0, *((double *)&v146 + 1), v147, 0.0, v28, 0.0, v22, v9);
  CGFloat x = v149.origin.x;
  CGFloat y = v149.origin.y;
  CGFloat width = v149.size.width;
  CGFloat height = v149.size.height;
  double MinY = CGRectGetMinY(v149);
  v46 = [(_UIValueCellContentView *)self textLabel];
  double v47 = [(_UIValueCellContentView *)self valueLabel];
  if (v46)
  {
    int v48 = v144;
    double v125 = v4;
    if (!(_BYTE)v144)
    {
      [v46 _firstBaselineOffsetFromTop];
      double v49 = v19;
      double v51 = v50;
      [v47 _firstBaselineOffsetFromTop];
      BOOL v53 = v51 < v52;
      double v19 = v49;
      if (v53)
      {
        [v47 _firstBaselineOffsetFromTop];
        double v55 = v54;
        [v46 _firstBaselineOffsetFromTop];
        double v57 = v55 - v56;
        double v19 = v49;
        double MinY = MinY + v57;
      }
    }
    double v136 = v132;
    double v137 = v133;
    double v138 = v134;
    CGFloat v139 = v135;
    uint64_t v140 = v40;
    double v119 = v19;
    double v141 = v19;
    double v58 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, MinY, *((double *)&v144 + 1));
    double v124 = v9;
    double v62 = UIRectIntegralWithScale(v58, v59, v60, v61, v9);
    CGFloat v64 = v63;
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    objc_msgSend(v46, "setFrame:");
    if (v48)
    {
      v150.origin.CGFloat x = v62;
      v150.origin.CGFloat y = v64;
      v150.size.CGFloat width = v66;
      v150.size.CGFloat height = v68;
      double MaxY = CGRectGetMaxY(v150);
      [(_UIValueCellContentViewConfiguration *)self->_configuration textToValuePadding];
      double MinY = MaxY + v70;
      double v9 = v124;
      CGFloat v4 = v125;
      double v19 = v119;
      if (!v25) {
        goto LABEL_23;
      }
      goto LABEL_16;
    }
    v151.origin.CGFloat x = x;
    v151.origin.CGFloat y = y;
    v151.size.CGFloat width = width;
    v151.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v151);
    [v46 _firstBaselineOffsetFromTop];
    double v72 = v71;
    [v47 _firstBaselineOffsetFromTop];
    if (v72 > v73)
    {
      [v46 _firstBaselineOffsetFromTop];
      double v75 = v74;
      [v47 _firstBaselineOffsetFromTop];
      double MinY = MinY + v75 - v76;
    }
    uint64_t v40 = 8;
    double v19 = -v120 - *((double *)&v145 + 1);
    double v134 = v131;
    double v135 = v130;
    double v132 = v123;
    CGFloat v133 = v122;
    double v9 = v124;
    CGFloat v4 = v125;
    if (v25)
    {
LABEL_16:
      double v121 = MinY;
      double v77 = v19;
      [v24 frame];
      double v79 = v78;
      double v81 = v80;
      double v83 = v82;
      double v85 = v84;
      double LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v46);
      double v90 = v86;
      double v91 = v87;
      if (v25 == 2)
      {
        double v92 = v88;
        [(UIView *)self bringSubviewToFront:v24];
        double v136 = v132;
        double v137 = v133;
        double v138 = v134;
        CGFloat v139 = v135;
        uint64_t v140 = v40;
        double v19 = v77;
        double v141 = v77;
        double v93 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, 0.0, *((double *)v142 + 1));
        double v9 = v124;
        double v98 = UIRectCenteredYInRectScale(v93, v94, v95, v96, LineOfLabel, v90, v91, v92, v124);
        double v100 = v99;
        double v102 = v101;
      }
      else
      {
        double v103 = v79;
        double v9 = v124;
        double v98 = UIRectCenteredYInRectScale(v103, v81, v83, v85, LineOfLabel, v86, v87, v88, v124);
        double v105 = v104;
        double v100 = v106;
        double v102 = v107;
        v152.origin.CGFloat y = v122;
        v152.origin.CGFloat x = v123;
        v152.size.CGFloat height = v130;
        v152.size.CGFloat width = v131;
        double v108 = v129 * 0.5 + CGRectGetMinY(v152);
        if (v105 >= v108) {
          double v97 = v105;
        }
        else {
          double v97 = v108;
        }
        double v19 = v77;
      }
      objc_msgSend(v24, "setFrame:", UIRectIntegralWithScale(v98, v97, v100, v102, v9));
      CGFloat v4 = v125;
      double MinY = v121;
    }
  }
LABEL_23:
  if (v24)
  {
    v109 = [(_UIValueCellContentViewConfiguration *)self->_configuration imageView];
    [v109 cornerRadius];
    _UIApplyCornerRadiusToView(v24, v110);
  }
  if (v47)
  {
    double v136 = v132;
    double v137 = v133;
    double v138 = v134;
    CGFloat v139 = v135;
    uint64_t v140 = v40;
    double v141 = v19;
    double v111 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, MinY, *((double *)&v145 + 1));
    objc_msgSend(v47, "setFrame:", UIRectIntegralWithScale(v111, v112, v113, v114, v9));
  }
  if (self)
  {
    if (self->_primaryTextFrameDidChangeHandler)
    {
      [(_UIValueCellContentView *)self _primaryTextLayoutFrame];
      v154.origin.CGFloat x = v115;
      v154.origin.CGFloat y = v116;
      v154.size.CGFloat width = v117;
      v154.size.CGFloat height = v118;
      v153.origin.CGFloat x = v4;
      v153.size.CGFloat width = v127;
      v153.origin.CGFloat y = v128;
      v153.size.CGFloat height = rect1;
      if (!CGRectEqualToRect(v153, v154)) {
        (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
      }
    }
  }
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  objc_super v2 = [(_UIValueCellContentView *)self textLabel];
  double v3 = [v2 _layoutRect];

  return (NSLayoutRect *)v3;
}

- (CGRect)_primaryTextLayoutFrame
{
  objc_super v2 = [(_UIValueCellContentView *)self textLabel];
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
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
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
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end