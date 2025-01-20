@interface SBIconDotLabelAccessoryView
+ (CAColorMatrix)_vibrantColorMatrixInput;
+ (id)_cachedDotImage;
+ (id)_dotColor;
+ (id)labelAccessorySystemImageName;
- (CGSize)intrinsicContentSize;
- (SBIconDotLabelAccessoryView)initWithFrame:(CGRect)a3;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4;
@end

@implementation SBIconDotLabelAccessoryView

+ (id)labelAccessorySystemImageName
{
  return @"circle.fill";
}

+ (id)_dotColor
{
  return 0;
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return result;
}

+ (id)_cachedDotImage
{
  return 0;
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  uint64_t v5 = [(id)objc_opt_class() _cachedDotImage];
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4FB1818];
    v7 = [(id)objc_opt_class() labelAccessorySystemImageName];
    v8 = [v6 systemImageNamed:v7];

    [(SBIconDotLabelAccessoryView *)self intrinsicContentSize];
    v9 = objc_msgSend(v8, "sbf_resizeImageToSize:");
    v10 = [(id)objc_opt_class() _dotColor];
    id v11 = [v9 _flatImageWithColor:v10];

    [(id)objc_opt_class() _setCachedDotImage:v11];
    uint64_t v5 = (uint64_t)v11;
  }
  id v12 = (id)v5;
  [(UIImageView *)self->_imageView setImage:v5];
  [(UIImageView *)self->_imageView sizeToFit];
}

- (SBIconDotLabelAccessoryView)initWithFrame:(CGRect)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBIconDotLabelAccessoryView;
  v3 = -[SBIconDotLabelAccessoryView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(SBIconDotLabelAccessoryView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    v9 = (void *)MEMORY[0x1E4F29238];
    v10 = objc_opt_class();
    if (v10) {
      [v10 _vibrantColorMatrixInput];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    id v11 = [v9 valueWithCAColorMatrix:v15];
    [v8 setValue:v11 forKey:@"inputColorMatrix"];

    id v12 = [(UIImageView *)v4->_imageView layer];
    v17[0] = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v12 setFilters:v13];

    [(SBIconDotLabelAccessoryView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 8.0;
  double v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)firstBaselineAnchor
{
  return (id)[(UIImageView *)self->_imageView firstBaselineAnchor];
}

- (id)lastBaselineAnchor
{
  return (id)[(UIImageView *)self->_imageView lastBaselineAnchor];
}

- (void).cxx_destruct
{
}

@end