@interface UIListContentView
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)supportsConfiguration:(id)a3;
- (CGRect)_primaryTextLayoutFrame;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSLayoutRect)_primaryTextLayoutRect;
- (NSString)description;
- (UILayoutGuide)imageLayoutGuide;
- (UILayoutGuide)secondaryTextLayoutGuide;
- (UILayoutGuide)textLayoutGuide;
- (UIListContentConfiguration)configuration;
- (UIListContentView)initWithCoder:(NSCoder *)coder;
- (UIListContentView)initWithConfiguration:(UIListContentConfiguration *)configuration;
- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (id)_encodableSubviews;
- (id)_imageView;
- (id)_primaryTextFrameDidChangeHandler;
- (id)_secondaryTextLabel;
- (id)_textLabel;
- (void)_applyConfiguration:(id *)a1;
- (void)_computeLayoutInfoForAvailableSpace:(double)a3;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_registerForTextLegibilityTraitChangesOnLabelOrImageView:(uint64_t)a1;
- (void)_setFrame:(int)a3 forView:(double)a4 isOldFrameInvalid:(double)a5;
- (void)_setPrimaryTextFrameDidChangeHandler:(id)a3;
- (void)_textLegibilityOrContentSizeTraitsChanged;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setConfiguration:(UIListContentConfiguration *)configuration;
@end

@implementation UIListContentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIListContentView;
  return [(UIView *)&v4 _shouldAnimatePropertyWithKey:a3];
}

uint64_t __43__UIListContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

- (double)_preferredMaxLayoutWidth
{
  double result = 0.0;
  if ((*(void *)&self->super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIListContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
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
  v9.super_class = (Class)UIListContentView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)UIListContentView;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (void)setConfiguration:(UIListContentConfiguration *)configuration
{
  v5 = configuration;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIListContentConfiguration.m", 1425, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[UIListContentConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)
    || animatingToConfiguration
    && (-[UIListContentConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
  {
    v7 = (void *)[(UIListContentConfiguration *)v5 copy];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      if (!animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, self->_configuration);
        objc_initWeak(&location, self);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __38__UIListContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E52DC6C0;
        objc_copyWeak(&v16, &location);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __38__UIListContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        double v8 = +[_UIContentViewAnimationStateUpdatingLayer layerForView:self withUpdateHandler:v15 completionHandler:v13];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __38__UIListContentView_setConfiguration___block_invoke_3;
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
      -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }
  }
}

- (void)_computeLayoutInfoForAvailableSpace:(double)a3
{
  if (a2)
  {
    v7 = (double *)(a1 + 8);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(void *)(a1 + 48) = 0;
    float64x2_t v8 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
    *(_OWORD *)(a1 + 8) = *MEMORY[0x1E4F1DB30];
    *(float64x2_t *)(a1 + 24) = v8;
    *(float64x2_t *)(a1 + 56) = v8;
    *(float64x2_t *)(a1 + 72) = v8;
    float64x2_t v82 = v8;
    *(float64x2_t *)(a1 + 88) = v8;
    id v9 = [a2 traitCollection];
    v10 = -[UIListContentView _imageView](a2);
    v11 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
    id v12 = [a2[55] imageProperties];
    [v12 maximumSize];
    v87.f64[0] = v13;
    v87.f64[1] = v14;

    uint64_t v15 = 0;
    if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v9))
    {
      id v16 = [a2[55] textProperties];
      char ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v10, &v87);

      if (ShouldUseAccessibilityTextWrappingLayout)
      {
        uint64_t v15 = 2;
        *(void *)a1 = 2;
        if (!v10)
        {
          double v84 = *v7;
          goto LABEL_26;
        }
        int v18 = 1;
        goto LABEL_9;
      }
      uint64_t v15 = 1;
      *(void *)a1 = 1;
    }
    if (!v10) {
      goto LABEL_24;
    }
    int v18 = 0;
LABEL_9:
    objc_msgSend(v10, "_intrinsicSizeWithinSize:", a3, a4);
    double v81 = v19;
    double v83 = v20;
    v21 = [v10 image];
    v22 = [a2[55] imageProperties];
    [v22 reservedLayoutSize];
    double v24 = _UIContentViewImageViewLayoutHeight(v21, v9, v83, v23, v87.f64[1]);
    *(double *)(a1 + 32) = v24;

    [a2 directionalLayoutMargins];
    double v27 = v25 + v26;
    v28.f64[0] = a3;
    if (v24 >= v83) {
      double v27 = -0.0;
    }
    v28.f64[1] = a4 + v27;
    v29.f64[0] = v81;
    v29.f64[1] = v83;
    float64x2_t v30 = vmaxnmq_f64(v82, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v87), vbslq_s8((int8x16_t)vcgtq_f64(v87, v28), (int8x16_t)v28, (int8x16_t)v87), (int8x16_t)v28)));
    BOOL v31 = v81 != v30.f64[0];
    if (v83 != v30.f64[1]) {
      BOOL v31 = 1;
    }
    if (v81 > 0.0 && v31 && v83 > 0.0)
    {
      v30.f64[0] = v30.f64[0] / v81;
      double v32 = v30.f64[1] / v83;
      if (v30.f64[0] < v30.f64[1] / v83) {
        double v32 = v30.f64[0];
      }
      float64x2_t v30 = vmulq_n_f64(v29, v32);
    }
    *(float64x2_t *)v7 = v30;
    double v84 = v30.f64[0];
    if (v18)
    {
      *(void *)(a1 + 40) = 0;
LABEL_26:
      [a2[55] imageToTextPadding];
      double v41 = v84 + v42;
      uint64_t v15 = 2;
LABEL_27:
      v43 = (_OWORD *)(a1 + 56);
      v44 = -[UIListContentView _textLabel](a2);
      v45 = [a2[55] textProperties];
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v44, v45, v15, v41);

      v46 = -[UIListContentView _secondaryTextLabel](a2);
      v47 = [a2[55] secondaryTextProperties];
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v46, v47, v15, 0.0);

      if (v44)
      {
        v48 = v10;
        *(unsigned char *)(a1 + 48) = 1;
        int v49 = [a2[55] prefersSideBySideTextAndSecondaryText];
        if (v15 || !v49)
        {
          v50 = v9;
          double v58 = [(UIListContentView *)(uint64_t)a2 _intrinsicSizeForLabel:0 inAvailableSpace:a3 outRequiresMultipleLines:a4];
          double v52 = *MEMORY[0x1E4F1DB30];
          double v53 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          double v54 = fmax(*MEMORY[0x1E4F1DB30], fmin(v58, a3));
          double v56 = fmax(v53, fmin(v59, a4));
          BOOL v57 = 1;
        }
        else
        {
          v50 = v9;
          BOOL v86 = 0;
          double v51 = [(UIListContentView *)(uint64_t)a2 _intrinsicSizeForLabel:&v86 inAvailableSpace:a3 outRequiresMultipleLines:a4];
          double v52 = *MEMORY[0x1E4F1DB30];
          double v53 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          double v54 = fmax(*MEMORY[0x1E4F1DB30], fmin(v51, a3));
          double v56 = fmax(v53, fmin(v55, a4));
          BOOL v57 = v86;
          *(unsigned char *)(a1 + 48) = v86;
        }
        v60 = (_OWORD *)(a1 + 88);
        *(double *)(a1 + 56) = v54;
        *(double *)(a1 + 64) = v56;
        v61 = [a2[55] textProperties];
        if ([v61 alignment])
        {

          if (v46 && !v57)
          {
            _OWORD *v60 = *v43;
            id v9 = v50;
            v10 = v48;
            v11 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
            goto LABEL_44;
          }
          if (v54 < a3) {
            double v54 = a3;
          }
          *(double *)v43 = v54;
        }
        else
        {
        }
        _OWORD *v60 = *v43;
        id v9 = v50;
        v10 = v48;
        v11 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
        if (v46)
        {
          if (v57) {
            goto LABEL_59;
          }
          goto LABEL_44;
        }
      }
      else if (v46)
      {
        double v54 = *(double *)v43;
LABEL_44:
        [*(id *)((char *)a2 + v11[248]) textToSecondaryTextHorizontalPadding];
        double v63 = a3 - v54 - v62;
        if (v63 >= 0.0)
        {
          BOOL v86 = 0;
          double v65 = [(UIListContentView *)(uint64_t)a2 _intrinsicSizeForLabel:&v86 inAvailableSpace:v63 outRequiresMultipleLines:a4];
          double v52 = *MEMORY[0x1E4F1DB30];
          double v53 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          *(double *)(a1 + 72) = fmax(*MEMORY[0x1E4F1DB30], fmin(v65, v63));
          *(double *)(a1 + 80) = fmax(v53, fmin(v66, a4));
          double v56 = *(double *)(a1 + 64);
          if (v54 == v52 && v56 == v53)
          {
            *(unsigned char *)(a1 + 48) = 0;
          }
          else
          {
            BOOL v67 = v65 <= v63 && !v86;
            char v68 = !v67;
            *(unsigned char *)(a1 + 48) = v68;
            if (!v67) {
              goto LABEL_59;
            }
          }
LABEL_66:
          [*(id *)((char *)a2 + v11[248]) textToSecondaryTextHorizontalPadding];
          double v79 = *(double *)(a1 + 88) + v78 + *(double *)(a1 + 72);
          if (*(double *)(a1 + 96) >= *(double *)(a1 + 80)) {
            uint64_t v80 = *(void *)(a1 + 96);
          }
          else {
            uint64_t v80 = *(void *)(a1 + 80);
          }
          *(double *)(a1 + 88) = v79;
          *(void *)(a1 + 96) = v80;
          goto LABEL_70;
        }
        double v56 = *(double *)(a1 + 64);
        double v52 = *MEMORY[0x1E4F1DB30];
        double v53 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        BOOL v64 = v54 != *MEMORY[0x1E4F1DB30];
        if (v56 != v53) {
          BOOL v64 = 1;
        }
        *(unsigned char *)(a1 + 48) = v64;
        if (!v64) {
          goto LABEL_66;
        }
LABEL_59:
        [*(id *)((char *)a2 + v11[248]) textToSecondaryTextVerticalPadding];
        double v70 = a4 - v56 - v69;
        double v71 = fmax(v52, fmin([(UIListContentView *)(uint64_t)a2 _intrinsicSizeForLabel:0 inAvailableSpace:a3 outRequiresMultipleLines:v70], a3));
        double v73 = fmax(v53, fmin(v72, v70));
        *(double *)(a1 + 72) = v71;
        *(double *)(a1 + 80) = v73;
        v74 = [*(id *)((char *)a2 + v11[248]) secondaryTextProperties];
        uint64_t v75 = [v74 alignment];

        if (v75)
        {
          if (v71 < a3) {
            double v71 = a3;
          }
          *(double *)(a1 + 72) = v71;
        }
        double v76 = *(double *)(a1 + 88);
        if (v76 < v71) {
          double v76 = v71;
        }
        *(double *)(a1 + 88) = v76;
        [*(id *)((char *)a2 + v11[248]) textToSecondaryTextVerticalPadding];
        *(double *)(a1 + 96) = *(double *)(a1 + 96) + v73 + v77;
      }
LABEL_70:

      return;
    }
    v33 = [v10 image];
    v34 = [a2[55] imageProperties];
    [v34 reservedLayoutSize];
    v36 = (unsigned __int16 *)a2[55];
    if (v36) {
      uint64_t v37 = HIBYTE(v36[4]) & 1;
    }
    else {
      uint64_t v37 = 0;
    }
    double v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v9, v37, v84, v35);
    *(double *)(a1 + 40) = v38;

    double v39 = v84 + v38 + v38;
    *(double *)(a1 + 24) = v39;
    [a2[55] imageToTextPadding];
    a3 = a3 - (v39 + v40);
LABEL_24:
    double v41 = 0.0;
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

- (id)_secondaryTextLabel
{
  if (a1)
  {
    objc_super v2 = a1;
    if ([a1[58] isHidden]) {
      id v3 = 0;
    }
    else {
      id v3 = v2[58];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_imageView
{
  if (a1)
  {
    objc_super v2 = a1;
    if ([a1[56] isHidden]) {
      id v3 = 0;
    }
    else {
      id v3 = v2[56];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  if ((*(void *)&self->super._viewFlags & 0x20000000000000) == 0) {
    return 0;
  }
  uint64_t v4 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    if (v6)
    {
      v7 = (void *)v6;
      BOOL v8 = [(UIListContentConfiguration *)self->_configuration prefersSideBySideTextAndSecondaryText];

      if (v8) {
        return 1;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  if (!v9
    || (v10 = (void *)v9,
        -[UIListContentView _textLabel]((id *)&self->super.super.super.isa),
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 numberOfLines],
        v11,
        v10,
        v12 == 1))
  {
    uint64_t v13 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    if (!v13) {
      return 0;
    }
    float64_t v14 = (void *)v13;
    uint64_t v15 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    uint64_t v16 = [v15 numberOfLines];

    if (v16 == 1) {
      return 0;
    }
  }
  return 1;
}

- (id)_textLabel
{
  if (a1)
  {
    objc_super v2 = a1;
    if ([a1[57] isHidden]) {
      id v3 = 0;
    }
    else {
      id v3 = v2[57];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5
{
  id v9 = a2;
  uint64_t v10 = [v9 numberOfLines];
  [v9 bounds];
  if (a3)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke;
    v36[3] = &unk_1E52DA260;
    uint64_t v38 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    uint64_t v17 = v13;
    uint64_t v26 = v14;
    id v18 = v9;
    id v37 = v18;
    double v39 = a4;
    double v40 = a5;
    +[UIView performWithoutAnimation:v36];

    objc_msgSend(v18, "_intrinsicSizeWithinSize:", a4, a5);
    double v20 = v19;
    *a3 = [v18 _measuredNumberOfLines] > 1;
    BOOL v21 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2;
    v27[3] = &unk_1E52E91C0;
    id v22 = v18;
    uint64_t v29 = a1;
    uint64_t v30 = v10;
    BOOL v35 = v21;
    id v28 = v22;
    uint64_t v31 = v15;
    uint64_t v32 = v16;
    uint64_t v33 = v17;
    uint64_t v34 = v26;
    +[UIView performWithoutAnimation:v27];
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

  return v20;
}

- (UILayoutGuide)textLayoutGuide
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (!self->_textLayoutGuide)
  {
    id v3 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);

    if (v3)
    {
      uint64_t v4 = objc_alloc_init(UILayoutGuide);
      textLayoutGuide = self->_textLayoutGuide;
      self->_textLayoutGuide = v4;

      [(UIView *)self addLayoutGuide:self->_textLayoutGuide];
      [(UILayoutGuide *)self->_textLayoutGuide setIdentifier:@"UIListContentViewTextLayoutGuide"];
      [(UILayoutGuide *)self->_textLayoutGuide _setLockedToOwningView:1];
      uint64_t v6 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
      v7 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      BOOL v8 = [v7 leadingAnchor];
      id v9 = [v6 constraintEqualToAnchor:v8];

      [v9 setIdentifier:@"UIListContentView-leading-textLayoutGuide-constraint"];
      uint64_t v10 = [(UILayoutGuide *)self->_textLayoutGuide trailingAnchor];
      uint64_t v11 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      uint64_t v12 = [v11 trailingAnchor];
      uint64_t v13 = [v10 constraintEqualToAnchor:v12];

      [v13 setIdentifier:@"UIListContentView-trailing-textLayoutGuide-constraint"];
      uint64_t v14 = [(UILayoutGuide *)self->_textLayoutGuide topAnchor];
      uint64_t v15 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      uint64_t v16 = [v15 topAnchor];
      uint64_t v17 = [v14 constraintEqualToAnchor:v16];

      [v17 setIdentifier:@"UIListContentView-top-textLayoutGuide-constraint"];
      id v18 = [(UILayoutGuide *)self->_textLayoutGuide bottomAnchor];
      double v19 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      double v20 = [v19 bottomAnchor];
      BOOL v21 = [v18 constraintEqualToAnchor:v20];

      [v21 setIdentifier:@"UIListContentView-bottom-textLayoutGuide-constraint"];
      v25[0] = v9;
      v25[1] = v13;
      v25[2] = v17;
      v25[3] = v21;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [(UILayoutGuide *)self->_textLayoutGuide _setSystemConstraints:v22];
      [MEMORY[0x1E4F5B268] activateConstraints:v22];
    }
  }
  double v23 = self->_textLayoutGuide;
  return v23;
}

- (void)_applyConfiguration:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v27 = v4;
    if (!v4)
    {
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel__applyConfiguration_, a1, @"UIListContentConfiguration.m", 1477, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong(a1 + 55, a2);
    uint64_t v5 = [v27 axesPreservingSuperviewLayoutMargins];
    if ((v5 & 2) != 0) {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
    }
    else {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA;
    }
    [a1 setEdgesPreservingSuperviewLayoutMargins:v6];
    [v27 directionalLayoutMargins];
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    [v27 alpha];
    objc_msgSend(a1, "setAlpha:");
    v7 = a1 + 56;
    BOOL v8 = [v27 imageProperties];
    id v9 = a1;
    uint64_t v10 = (_UIListContentImageView *)*v7;
    uint64_t v11 = v10;
    if (v8 && v8[2])
    {
      if (v10)
      {
        if ([(UIView *)v10 isHidden])
        {
          [(UIImageView *)v11 setHidden:0];
          uint64_t v12 = 2;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v11 = objc_alloc_init(_UIListContentImageView);
        objc_storeStrong(v7, v11);
        [v9 addSubview:v11];
        uint64_t v12 = 1;
      }
      -[UIListContentImageProperties _applyToImageView:]((uint64_t)v8, v11);
    }
    else if (v10 && ![(UIView *)v10 isHidden])
    {
      [(UIImageView *)v11 setHidden:1];
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 0;
    }

    uint64_t v13 = [v27 textProperties];
    uint64_t v14 = _UIUpdateLabelUsingTextConfiguration(v9, v9 + 57, v13);

    uint64_t v15 = [v27 secondaryTextProperties];
    uint64_t v16 = _UIUpdateLabelUsingTextConfiguration(v9, v9 + 58, v15);

    if (v12)
    {
      uint64_t v17 = -[UIListContentView _imageView](v9);

      if (v17) {
        *((unsigned char *)v9 + 432) |= 1u;
      }
      id v18 = v9[62];
      if (v18)
      {
        [v18 _setLockedToOwningView:0];
        [v9 removeLayoutGuide:v9[62]];
        id v19 = v9[62];
        v9[62] = 0;
      }
      if (v12 == 1) {
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[56]);
      }
    }
    if (v14)
    {
      double v20 = -[UIListContentView _textLabel](v9);

      if (v20) {
        *((unsigned char *)v9 + 432) |= 2u;
      }
      id v21 = v9[60];
      if (v21)
      {
        [v21 _setLockedToOwningView:0];
        [v9 removeLayoutGuide:v9[60]];
        id v22 = v9[60];
        v9[60] = 0;
      }
      if (v14 == 1) {
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[57]);
      }
    }
    if (v16)
    {
      double v23 = -[UIListContentView _secondaryTextLabel](v9);

      if (v23) {
        *((unsigned char *)v9 + 432) |= 4u;
      }
      id v24 = v9[61];
      if (v24)
      {
        [v24 _setLockedToOwningView:0];
        [v9 removeLayoutGuide:v9[61]];
        id v25 = v9[61];
        v9[61] = 0;
      }
      if (v16 == 1) {
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[58]);
      }
    }
    v9[53] = (id)0x7FEFFFFFFFFFFFFFLL;
    [v9 invalidateIntrinsicContentSize];
    [v9 setNeedsLayout];
    id v4 = v27;
  }
}

- (void)_registerForTextLegibilityTraitChangesOnLabelOrImageView:(uint64_t)a1
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v6[0] = 0x1ED3F5B38;
  v6[1] = 0x1ED3F5AD8;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v5 = (id)[v3 _registerForTraitTokenChanges:v4 withTarget:a1 action:sel__textLegibilityOrContentSizeTraitsChanged];
}

- (void)layoutSubviews
{
  v156.receiver = self;
  v156.super_class = (Class)UIListContentView;
  [(UIView *)&v156 layoutSubviews];
  [(UIListContentView *)self _primaryTextLayoutFrame];
  CGFloat v4 = v3;
  CGFloat v135 = v6;
  CGFloat v136 = v5;
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
  CGFloat v138 = v17;
  CGFloat v139 = v15;
  double v137 = v20;
  double v22 = v17 - v20 - v21;
  double v155 = 0.0;
  long long v153 = 0u;
  long long v154 = 0u;
  double v128 = v23;
  long long v151 = 0u;
  long long v152 = 0u;
  memset(v150, 0, sizeof(v150));
  -[UIListContentView _computeLayoutInfoForAvailableSpace:]((uint64_t)v150, (id *)&self->super.super.super.isa, v15 - v18 - v23, v22);
  id v24 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
  uint64_t v25 = *(void *)&v150[0];
  CGFloat v130 = v13;
  CGFloat v131 = v11;
  if (!v24 || *(void *)&v150[0] == 2)
  {
    uint64_t v40 = 2;
    double v142 = v15;
    double v143 = v17;
    double v140 = v11;
    double v141 = v13;
    double v28 = v137;
  }
  else
  {
    double v26 = *((double *)&v151 + 1);
    double v144 = v11;
    double v145 = v13;
    double v146 = v15;
    CGFloat v147 = v138;
    uint64_t v148 = 2;
    double v149 = v19 + *((double *)&v151 + 1);
    double v27 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, 0.0, *((double *)v150 + 1));
    double v28 = v137;
    double v32 = UIRectCenteredYInRectScale(v27, v29, v30, v31, 0.0, v137, 0.0, v22, v9);
    double v140 = UIRectIntegralWithScale(v32, v33, v34, v35, v9);
    double v141 = v36;
    double v142 = v37;
    double v143 = v38;
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v24, *(unsigned char *)&self->_contentViewFlags & 1, v140, v36, v37, v38);
    [(UIListContentConfiguration *)self->_configuration imageToTextPadding];
    double v19 = v26 + v39;
    uint64_t v40 = 8;
  }
  v157.origin.CGFloat x = UIRectCenteredYInRectScale(0.0, 0.0, *((double *)&v154 + 1), v155, 0.0, v28, 0.0, v22, v9);
  CGFloat x = v157.origin.x;
  CGFloat y = v157.origin.y;
  CGFloat width = v157.size.width;
  CGFloat height = v157.size.height;
  double MinY = CGRectGetMinY(v157);
  v46 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v47 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
  if (!v46) {
    goto LABEL_23;
  }
  int v48 = v152;
  double v133 = v4;
  if (!(_BYTE)v152)
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
  double v144 = v140;
  double v145 = v141;
  double v146 = v142;
  CGFloat v147 = v143;
  uint64_t v148 = v40;
  double v127 = v19;
  double v149 = v19;
  double v58 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, MinY, *((double *)&v152 + 1));
  double v132 = v9;
  double v62 = UIRectIntegralWithScale(v58, v59, v60, v61, v9);
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v46, (*(unsigned char *)&self->_contentViewFlags >> 1) & 1, v62, v63, v65, v67);
  if (v48)
  {
    v158.origin.CGFloat x = v62;
    v158.origin.CGFloat y = v64;
    v158.size.CGFloat width = v66;
    v158.size.CGFloat height = v68;
    double MaxY = CGRectGetMaxY(v158);
    [(UIListContentConfiguration *)self->_configuration textToSecondaryTextVerticalPadding];
    double MinY = MaxY + v70;
    double v9 = v132;
    CGFloat v4 = v133;
    double v19 = v127;
    if (!v25) {
      goto LABEL_23;
    }
LABEL_16:
    double v129 = MinY;
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
      double v144 = v140;
      double v145 = v141;
      double v146 = v142;
      CGFloat v147 = v143;
      uint64_t v148 = v40;
      double v19 = v77;
      double v149 = v77;
      double v93 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, 0.0, *((double *)v150 + 1));
      double v9 = v132;
      double v98 = UIRectCenteredYInRectScale(v93, v94, v95, v96, LineOfLabel, v90, v91, v92, v132);
      double v100 = v99;
      double v102 = v101;
    }
    else
    {
      double v103 = v79;
      double v9 = v132;
      double v98 = UIRectCenteredYInRectScale(v103, v81, v83, v85, LineOfLabel, v86, v87, v88, v132);
      double v105 = v104;
      double v100 = v106;
      double v102 = v107;
      v160.origin.CGFloat y = v130;
      v160.origin.CGFloat x = v131;
      v160.size.CGFloat height = v138;
      v160.size.CGFloat width = v139;
      double v108 = v137 * 0.5 + CGRectGetMinY(v160);
      if (v105 >= v108) {
        double v97 = v105;
      }
      else {
        double v97 = v108;
      }
      double v19 = v77;
    }
    double v109 = UIRectIntegralWithScale(v98, v97, v100, v102, v9);
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v24, *(unsigned char *)&self->_contentViewFlags & 1, v109, v110, v111, v112);
    CGFloat v4 = v133;
    double MinY = v129;
    goto LABEL_23;
  }
  v159.origin.CGFloat x = x;
  v159.origin.CGFloat y = y;
  v159.size.CGFloat width = width;
  v159.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v159);
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
  double v19 = -v128 - *((double *)&v153 + 1);
  double v142 = v139;
  double v143 = v138;
  double v140 = v131;
  double v141 = v130;
  double v9 = v132;
  CGFloat v4 = v133;
  if (v25) {
    goto LABEL_16;
  }
LABEL_23:
  if (v24)
  {
    v113 = [(UIListContentConfiguration *)self->_configuration imageProperties];
    [v113 cornerRadius];
    _UIApplyCornerRadiusToView(v24, v114);
  }
  if (v47)
  {
    double v144 = v140;
    double v145 = v141;
    double v146 = v142;
    CGFloat v147 = v143;
    uint64_t v148 = v40;
    double v149 = v19;
    double v115 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, MinY, *((double *)&v153 + 1));
    double v119 = UIRectIntegralWithScale(v115, v116, v117, v118, v9);
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v47, (*(unsigned char *)&self->_contentViewFlags >> 2) & 1, v119, v120, v121, v122);
  }
  else if (!self)
  {
    goto LABEL_31;
  }
  *(unsigned char *)&self->_contentViewFlags &= ~1u;
  *(unsigned char *)&self->_contentViewFlags &= ~2u;
  *(unsigned char *)&self->_contentViewFlags &= ~4u;
  if (self->_primaryTextFrameDidChangeHandler)
  {
    [(UIListContentView *)self _primaryTextLayoutFrame];
    v162.origin.CGFloat x = v123;
    v162.origin.CGFloat y = v124;
    v162.size.CGFloat width = v125;
    v162.size.CGFloat height = v126;
    v161.origin.CGFloat x = v4;
    v161.size.CGFloat width = v135;
    v161.origin.CGFloat y = v136;
    v161.size.CGFloat height = rect1;
    if (!CGRectEqualToRect(v161, v162)) {
      (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
    }
  }
LABEL_31:
}

- (CGRect)_primaryTextLayoutFrame
{
  objc_super v2 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
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

- (void)_setFrame:(int)a3 forView:(double)a4 isOldFrameInvalid:(double)a5
{
  id v13 = a2;
  if (a1)
  {
    if (a3
      && +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__UIListContentView__setFrame_forView_isOldFrameInvalid___block_invoke;
      v14[3] = &unk_1E52DA520;
      id v15 = v13;
      double v16 = a4;
      double v17 = a5;
      double v18 = a6;
      double v19 = a7;
      +[UIView performWithoutAnimation:v14];
    }
    else
    {
      objc_msgSend(v13, "setFrame:", a4, a5, a6, a7);
    }
  }
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
  -[UIListContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
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

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    double v8 = configuration;
    -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    double v8 = 0;
  }
  if (width >= self->_preferredMaxLayoutWidth) {
    double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  }
  else {
    double preferredMaxLayoutWidth = width;
  }
  [(UIView *)self directionalLayoutMargins];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v36 = 0.0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  -[UIListContentView _computeLayoutInfoForAvailableSpace:]((uint64_t)&v30, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v12 - v16, height - v10 - v14);
  double v18 = v17 + v13 + *((double *)&v35 + 1);
  double v19 = v15 + v11 + v36;
  if ((void)v30 != 2)
  {
    double v20 = v18 + *((double *)&v31 + 1);
    if (*((double *)&v31 + 1) > 0.0 && v18 > 0.0)
    {
      [(UIListContentConfiguration *)self->_configuration imageToTextPadding];
      double v20 = v20 + v21;
    }
    if (v15 + v11 + *(double *)&v32 >= v19) {
      double v19 = v15 + v11 + *(double *)&v32;
    }
    double v18 = v20;
  }
  double v22 = self->_configuration;
  double v23 = [(UIView *)self traitCollection];
  [(UIListContentConfiguration *)v22 _minimumHeightForTraitCollection:v23];
  double v25 = v24;

  if (v8) {
    -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  }
  if (preferredMaxLayoutWidth >= v18) {
    double v26 = v18;
  }
  else {
    double v26 = preferredMaxLayoutWidth;
  }
  if (v25 >= v19) {
    double v27 = v25;
  }
  else {
    double v27 = v19;
  }
  if (height >= v27) {
    double height = v27;
  }

  double v28 = v26;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (BOOL)supportsConfiguration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (UIListContentView)initWithConfiguration:(UIListContentConfiguration *)configuration
{
  double v5 = configuration;
  if (!v5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIListContentConfiguration.m", 1361, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIListContentView;
  double v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__UIListContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    double v11 = v6;
    double v12 = v5;
    +[UIView performWithoutAnimation:v10];
  }
  return v7;
}

- (UIListContentConfiguration)configuration
{
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration) {
    animatingToConfiguration = self->_configuration;
  }
  id v3 = (void *)[(UIListContentConfiguration *)animatingToConfiguration copy];
  return (UIListContentConfiguration *)v3;
}

- (UIListContentView)initWithCoder:(NSCoder *)coder
{
  double v4 = coder;
  double v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIListContentView;
  double v6 = [(UIView *)&v12 initWithCoder:v4];
  if (!v6)
  {
LABEL_5:
    double v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__UIListContentView_initWithCoder___block_invoke;
  v9[3] = &unk_1E52D9F98;
  double v7 = v6;
  double v10 = v7;
  id v11 = v5;
  +[UIView performWithoutAnimation:v9];

LABEL_6:
  return v7;
}

uint64_t __35__UIListContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIListContentView;
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
  v12.receiver = self;
  v12.super_class = (Class)UIListContentView;
  id v3 = [(UIView *)&v12 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    configuration = self->_configuration;
    if (configuration)
    {
      double v6 = -[UIListContentConfiguration _descriptionPropertiesForFullDescription:]((uint64_t)configuration, 0);
      double v7 = NSString;
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      double v10 = [v6 componentsJoinedByString:@"; "];
      configuration = [v7 stringWithFormat:@"<%@: %p; %@>", v9, configuration, v10];
    }
    [v4 appendFormat:@"; configuration = %@>", configuration];
  }
  return (NSString *)v4;
}

void __38__UIListContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = 2;
    if (!a2) {
      uint64_t v4 = 1;
    }
    id v5 = *(id *)((char *)WeakRetained + OBJC_IVAR___UIListContentView__configuration[v4]);
    if (WeakRetained[55] != v5)
    {
      double v6 = (char *)WeakRetained;
      -[UIListContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }
}

void __38__UIListContentView_setConfiguration___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = (void *)WeakRetained[52];
    WeakRetained[52] = 0;

    objc_super v2 = (void *)WeakRetained[51];
    WeakRetained[51] = 0;
  }
}

uint64_t __38__UIListContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

- (void)_textLegibilityOrContentSizeTraitsChanged
{
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (a3.height <= 0.0) {
    a3.double height = 1.79769313e308;
  }
  -[UIListContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

uint64_t __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1) {
    [*(id *)(a1 + 32) setNumberOfLines:2];
  }
  double v2 = *(double *)(a1 + 48);
  double v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setBounds:", 0.0, 0.0, v2, 99999.0);
}

void __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumberOfLines:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 88)
    || ([*(id *)(a1 + 40) _isInLayoutSubviews] & 1) == 0
    && ([*(id *)(a1 + 40) layer],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 needsLayout],
        v10,
        (v11 & 1) == 0))
  {
    [*(id *)(a1 + 40) bounds];
    if (v3 != *MEMORY[0x1E4F1DB30] || v2 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v5 = *(double *)(a1 + 56);
      double v6 = *(double *)(a1 + 64);
      double v7 = *(double *)(a1 + 72);
      double v8 = *(double *)(a1 + 80);
      double v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "setBounds:", v5, v6, v7, v8);
    }
  }
}

uint64_t __57__UIListContentView__setFrame_forView_isOldFrameInvalid___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (UILayoutGuide)secondaryTextLayoutGuide
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (!self->_secondaryTextLayoutGuide)
  {
    double v3 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);

    if (v3)
    {
      double v4 = objc_alloc_init(UILayoutGuide);
      secondaryTextLayoutGuide = self->_secondaryTextLayoutGuide;
      self->_secondaryTextLayoutGuide = v4;

      [(UIView *)self addLayoutGuide:self->_secondaryTextLayoutGuide];
      [(UILayoutGuide *)self->_secondaryTextLayoutGuide setIdentifier:@"UIListContentViewSecondaryTextLayoutGuide"];
      [(UILayoutGuide *)self->_secondaryTextLayoutGuide _setLockedToOwningView:1];
      double v6 = [(UILayoutGuide *)self->_secondaryTextLayoutGuide leadingAnchor];
      double v7 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      double v8 = [v7 leadingAnchor];
      double v9 = [v6 constraintEqualToAnchor:v8];

      [v9 setIdentifier:@"UIListContentView-leading-secondaryTextLayoutGuide-constraint"];
      double v10 = [(UILayoutGuide *)self->_secondaryTextLayoutGuide trailingAnchor];
      char v11 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      objc_super v12 = [v11 trailingAnchor];
      objc_super v13 = [v10 constraintEqualToAnchor:v12];

      [v13 setIdentifier:@"UIListContentView-trailing-secondaryTextLayoutGuide-constraint"];
      double v14 = [(UILayoutGuide *)self->_secondaryTextLayoutGuide topAnchor];
      double v15 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      double v16 = [v15 topAnchor];
      double v17 = [v14 constraintEqualToAnchor:v16];

      [v17 setIdentifier:@"UIListContentView-top-secondaryTextLayoutGuide-constraint"];
      double v18 = [(UILayoutGuide *)self->_secondaryTextLayoutGuide bottomAnchor];
      double v19 = -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      double v20 = [v19 bottomAnchor];
      double v21 = [v18 constraintEqualToAnchor:v20];

      [v21 setIdentifier:@"UIListContentView-bottom-secondaryTextLayoutGuide-constraint"];
      v25[0] = v9;
      v25[1] = v13;
      v25[2] = v17;
      v25[3] = v21;
      double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [(UILayoutGuide *)self->_secondaryTextLayoutGuide _setSystemConstraints:v22];
      [MEMORY[0x1E4F5B268] activateConstraints:v22];
    }
  }
  double v23 = self->_secondaryTextLayoutGuide;
  return v23;
}

- (UILayoutGuide)imageLayoutGuide
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (!self->_imageLayoutGuide)
  {
    double v3 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);

    if (v3)
    {
      double v4 = objc_alloc_init(UILayoutGuide);
      imageLayoutGuide = self->_imageLayoutGuide;
      self->_imageLayoutGuide = v4;

      [(UIView *)self addLayoutGuide:self->_imageLayoutGuide];
      [(UILayoutGuide *)self->_imageLayoutGuide setIdentifier:@"UIListContentViewImageLayoutGuide"];
      [(UILayoutGuide *)self->_imageLayoutGuide _setLockedToOwningView:1];
      double v6 = [(UILayoutGuide *)self->_imageLayoutGuide leadingAnchor];
      double v7 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      double v8 = [v7 leadingAnchor];
      double v9 = [v6 constraintEqualToAnchor:v8];

      [v9 setIdentifier:@"UIListContentView-leading-imageLayoutGuide-constraint"];
      double v10 = [(UILayoutGuide *)self->_imageLayoutGuide trailingAnchor];
      char v11 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      objc_super v12 = [v11 trailingAnchor];
      objc_super v13 = [v10 constraintEqualToAnchor:v12];

      [v9 setIdentifier:@"UIListContentView-trailing-imageLayoutGuide-constraint"];
      double v14 = [(UILayoutGuide *)self->_imageLayoutGuide topAnchor];
      double v15 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      double v16 = [v15 topAnchor];
      double v17 = [v14 constraintEqualToAnchor:v16];

      [v9 setIdentifier:@"UIListContentView-top-imageLayoutGuide-constraint"];
      double v18 = [(UILayoutGuide *)self->_imageLayoutGuide bottomAnchor];
      double v19 = -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      double v20 = [v19 bottomAnchor];
      double v21 = [v18 constraintEqualToAnchor:v20];

      [v9 setIdentifier:@"UIListContentView-bottom-imageLayoutGuide-constraint"];
      v25[0] = v9;
      v25[1] = v13;
      v25[2] = v17;
      v25[3] = v21;
      double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [(UILayoutGuide *)self->_imageLayoutGuide _setSystemConstraints:v22];
      [MEMORY[0x1E4F5B268] activateConstraints:v22];
    }
  }
  double v23 = self->_imageLayoutGuide;
  return v23;
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  double v2 = -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  double v3 = [v2 _layoutRect];

  return (NSLayoutRect *)v3;
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
  objc_storeStrong((id *)&self->_imageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_secondaryTextLayoutGuide, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong(&self->_primaryTextFrameDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end