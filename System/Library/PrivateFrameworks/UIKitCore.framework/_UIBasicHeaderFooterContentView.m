@interface _UIBasicHeaderFooterContentView
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)description;
- (UILabel)textLabel;
- (_UIBasicHeaderFooterContentView)initWithCoder:(id)a3;
- (_UIBasicHeaderFooterContentView)initWithConfiguration:(id)a3;
- (_UIBasicHeaderFooterContentViewConfiguration)configuration;
- (double)_computeSizesForAvailableSpace:(double)a3;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (id)_encodableSubviews;
- (void)_applyConfiguration:(id *)a1;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
@end

@implementation _UIBasicHeaderFooterContentView

- (_UIBasicHeaderFooterContentView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIBasicHeaderFooterContentView.m", 370, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIBasicHeaderFooterContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57___UIBasicHeaderFooterContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v11 = v6;
    id v12 = v5;
    +[UIView performWithoutAnimation:v10];
  }
  return v7;
}

- (_UIBasicHeaderFooterContentView)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIBasicHeaderFooterContentView;
  v6 = [(UIView *)&v12 initWithCoder:v4];
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___UIBasicHeaderFooterContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  v6.super_class = (Class)_UIBasicHeaderFooterContentView;
  v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendFormat:@"; configuration = %@>", self->_configuration];
  }
  return (NSString *)v4;
}

- (_UIBasicHeaderFooterContentViewConfiguration)configuration
{
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration) {
    animatingToConfiguration = self->_configuration;
  }
  v3 = (void *)[(_UIBasicHeaderFooterContentViewConfiguration *)animatingToConfiguration copy];
  return (_UIBasicHeaderFooterContentViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIBasicHeaderFooterContentView.m", 423, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[_UIBasicHeaderFooterContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIBasicHeaderFooterContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E52DC6C0;
        objc_copyWeak(&v16, &location);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        v8 = +[_UIContentViewAnimationStateUpdatingLayer layerForView:self withUpdateHandler:v15 completionHandler:v13];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_3;
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
      -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }
  }
}

- (void)_applyConfiguration:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v13 = v4;
    if (!v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__applyConfiguration_, a1, @"_UIBasicHeaderFooterContentView.m", 479, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong(a1 + 54, a2);
    uint64_t v5 = [v13 axesPreservingSuperviewLayoutMargins];
    if ((v5 & 2) != 0) {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
    }
    else {
      uint64_t v6 = (v5 << 63 >> 63) & 0xA;
    }
    [a1 setEdgesPreservingSuperviewLayoutMargins:v6];
    [v13 directionalLayoutMargins];
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 55;
    v8 = [v13 textLabel];
    id v9 = a1;
    v10 = (UILabel *)*v7;
    id v11 = v10;
    if (v8 && (v8[2] || v8[7]))
    {
      if (v10)
      {
        if ([(UIView *)v10 isHidden]) {
          [(UIView *)v11 setHidden:0];
        }
      }
      else
      {
        id v11 = objc_alloc_init(UILabel);
        objc_storeStrong(v7, v11);
        [v9 addSubview:v11];
      }
      [v8 applyToLabel:v11];
    }
    else if (v10 && ![(UIView *)v10 isHidden])
    {
      [(UIView *)v11 setHidden:1];
    }

    v9[53] = (id)0x7FEFFFFFFFFFFFFFLL;
    [v9 invalidateIntrinsicContentSize];
    [v9 setNeedsLayout];
    id v4 = v13;
  }
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
  id v4 = [(_UIBasicHeaderFooterContentView *)self textLabel];
  if (v4)
  {
    uint64_t v5 = [(_UIBasicHeaderFooterContentView *)self textLabel];
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
  v2.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  v9.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  -[_UIBasicHeaderFooterContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UIBasicHeaderFooterContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
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

- (double)_computeSizesForAvailableSpace:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  double v5 = *MEMORY[0x1E4F1DB30];
  uint64_t v6 = [a1 textLabel];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_intrinsicSizeWithinSize:", a2, a3);
    double v5 = fmax(v5, fmin(v8, a2));
  }

  return v5;
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
    -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
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
  double v18 = [(_UIBasicHeaderFooterContentView *)self _computeSizesForAvailableSpace:height - v10 - v14];
  double v20 = v19;
  if (v8) {
    -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  }
  if (preferredMaxLayoutWidth >= v17 + v13 + v18) {
    double v21 = v17 + v13 + v18;
  }
  else {
    double v21 = preferredMaxLayoutWidth;
  }
  if (height >= v15 + v11 + v20) {
    double height = v15 + v11 + v20;
  }

  double v22 = v21;
  double v23 = height;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIBasicHeaderFooterContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)_UIBasicHeaderFooterContentView;
  [(UIView *)&v31 layoutSubviews];
  double v3 = [(_UIBasicHeaderFooterContentView *)self textLabel];
  if (v3)
  {
    [(UIView *)self _currentScreenScale];
    double v5 = v4;
    [(UIView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UIView *)self directionalLayoutMargins];
    double v15 = v14;
    double v17 = v16;
    double v20 = v13 - v14 - v19;
    double v21 = [(_UIBasicHeaderFooterContentView *)self _computeSizesForAvailableSpace:v20];
    v30[0] = v7;
    v30[1] = v9;
    v30[2] = v11;
    v30[3] = v13;
    *(void *)&v30[4] = 2;
    v30[5] = v17;
    double v22 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, v30, 0.0, 0.0, v21);
    double v26 = UIRectCenteredYInRectScale(v22, v23, v24, v25, 0.0, v15, 0.0, v20, v5);
    objc_msgSend(v3, "setFrame:", UIRectIntegralWithScale(v26, v27, v28, v29, v5));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end