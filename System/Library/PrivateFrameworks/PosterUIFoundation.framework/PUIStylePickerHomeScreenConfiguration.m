@interface PUIStylePickerHomeScreenConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHomeScreenConfiguration:(id)a3;
- (CGSize)iconSize;
- (CGSize)iconSpacing;
- (PUIDiscreteGradientVariatedCustomStyle)accentStyle;
- (PUIStylePickerHomeScreenConfiguration)init;
- (PUIStylePickerHomeScreenConfiguration)initWithCoder:(id)a3;
- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3;
- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5;
- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5 saturation:(double)a6;
- (UIColor)accentColor;
- (UIColor)suggestedAccentColor;
- (UIEdgeInsets)layoutInsets;
- (double)iconContinuousCornerRadius;
- (double)luminance;
- (double)saturation;
- (double)variation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)styleType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccentStyle:(id)a3;
- (void)setIconContinuousCornerRadius:(double)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setIconSpacing:(CGSize)a3;
- (void)setLayoutInsets:(UIEdgeInsets)a3;
- (void)setStyleType:(unint64_t)a3;
- (void)setSuggestedAccentColor:(id)a3;
@end

@implementation PUIStylePickerHomeScreenConfiguration

- (unint64_t)styleType
{
  return self->_styleType;
}

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3
{
  return [(PUIStylePickerHomeScreenConfiguration *)self initWithStyleType:a3 variation:0.0 luminance:0.0];
}

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5
{
  return [(PUIStylePickerHomeScreenConfiguration *)self initWithStyleType:a3 variation:a4 luminance:a5 saturation:1.0];
}

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5 saturation:(double)a6
{
  v20.receiver = self;
  v20.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  v10 = [(PUIStylePickerHomeScreenConfiguration *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_styleType = a3;
    v12 = [[PUIDiscreteGradientVariatedCustomStyle alloc] initWithVariation:a4 luminance:a5 saturation:a6];
    accentStyle = v11->_accentStyle;
    v11->_accentStyle = v12;

    v11->_iconContinuousCornerRadius = 14.3999996;
    v11->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    __asm { FMOV            V0.2D, #12.0 }
    v11->_iconSpacing = _Q0;
    *(CGSize *)&v11->_layoutInsets.top = _Q0;
    *(CGSize *)&v11->_layoutInsets.bottom = _Q0;
  }
  return v11;
}

- (PUIStylePickerHomeScreenConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  v2 = [(PUIStylePickerHomeScreenConfiguration *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_styleType = 0;
    v4 = [[PUIDiscreteGradientVariatedCustomStyle alloc] initWithVariation:0.0];
    accentStyle = v3->_accentStyle;
    v3->_accentStyle = v4;

    v3->_iconContinuousCornerRadius = 14.3999996;
    v3->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    __asm { FMOV            V0.2D, #12.0 }
    v3->_iconSpacing = _Q0;
    *(CGSize *)&v3->_layoutInsets.top = _Q0;
    *(CGSize *)&v3->_layoutInsets.bottom = _Q0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v4 = [(PUIStylePickerHomeScreenConfiguration *)self styleType] - 1;
  if (v4 > 2) {
    v5 = @"auto";
  }
  else {
    v5 = off_2654719F0[v4];
  }
  [v3 appendString:v5 withName:@"_styleType"];
  id v6 = (id)[v3 appendObject:self->_accentStyle withName:@"_accentStyle"];
  v7 = [v3 build];

  return v7;
}

__CFString *__52__PUIStylePickerHomeScreenConfiguration_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) styleType];
  if ((unint64_t)(v1 - 1) > 2) {
    return @"auto";
  }
  else {
    return off_2654719F0[v1 - 1];
  }
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_styleType];
  id v5 = (id)[v3 appendObject:self->_accentStyle];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (double)luminance
{
  [(PUIDiscreteGradientVariatedCustomStyle *)self->_accentStyle luminance];
  return result;
}

- (double)variation
{
  [(PUIDiscreteGradientVariatedCustomStyle *)self->_accentStyle variation];
  return result;
}

- (double)saturation
{
  [(PUIDiscreteGradientVariatedCustomStyle *)self->_accentStyle saturation];
  return result;
}

- (void)setAccentStyle:(id)a3
{
  if (a3) {
    id v4 = (PUIDiscreteGradientVariatedCustomStyle *)[a3 copy];
  }
  else {
    id v4 = [[PUIDiscreteGradientVariatedCustomStyle alloc] initWithVariation:0.0];
  }
  self->_accentStyle = v4;
  MEMORY[0x270F9A758]();
}

- (UIColor)accentColor
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self->_accentStyle luminanceAppliedColor];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIStylePickerHomeScreenConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStylePickerHomeScreenConfiguration *)self isEqualToHomeScreenConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToHomeScreenConfiguration:(id)a3
{
  id v4 = (PUIStylePickerHomeScreenConfiguration *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_18;
    }
    unint64_t v6 = [(PUIStylePickerHomeScreenConfiguration *)v4 accentStyle];
    v7 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = [(PUIStylePickerHomeScreenConfiguration *)v5 styleType];
    if (v9 != [(PUIStylePickerHomeScreenConfiguration *)self styleType]) {
      goto LABEL_18;
    }
    v10 = [(PUIStylePickerHomeScreenConfiguration *)self suggestedAccentColor];
    v11 = [(PUIStylePickerHomeScreenConfiguration *)v5 suggestedAccentColor];
    int v12 = BSEqualObjects();

    if (!v12) {
      goto LABEL_18;
    }
    [(PUIStylePickerHomeScreenConfiguration *)v5 iconContinuousCornerRadius];
    [(PUIStylePickerHomeScreenConfiguration *)self iconContinuousCornerRadius];
    if (BSFloatEqualToFloat())
    {
      [(PUIStylePickerHomeScreenConfiguration *)v5 iconSize];
      double v14 = v13;
      double v16 = v15;
      [(PUIStylePickerHomeScreenConfiguration *)self iconSize];
      BOOL v18 = 0;
      if (v14 == v19 && v16 == v17)
      {
        [(PUIStylePickerHomeScreenConfiguration *)v5 iconSpacing];
        double v21 = v20;
        double v23 = v22;
        [(PUIStylePickerHomeScreenConfiguration *)self iconSpacing];
        BOOL v18 = 0;
        if (v21 == v25 && v23 == v24)
        {
          [(PUIStylePickerHomeScreenConfiguration *)v5 layoutInsets];
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          [(PUIStylePickerHomeScreenConfiguration *)self layoutInsets];
          BOOL v37 = v29 == v36;
          if (v27 != v38) {
            BOOL v37 = 0;
          }
          if (v33 != v35) {
            BOOL v37 = 0;
          }
          BOOL v18 = v31 == v34 && v37;
        }
      }
    }
    else
    {
LABEL_18:
      BOOL v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStylePickerHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  BOOL v5 = [(PUIStylePickerHomeScreenConfiguration *)&v28 init];
  if (v5)
  {
    *((void *)v5 + 3) = [v4 decodeIntegerForKey:@"_styleType"];
    unint64_t v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_accentStyle"];
    int v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_suggestedAccentColor"];
    v10 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v9;

    [v4 decodeDoubleForKey:@"_iconContinuousCornerRadius"];
    *((void *)v5 + 2) = v11;
    if (BSFloatIsZero()) {
      *((void *)v5 + 2) = 0x402CCCCCC0000000;
    }
    [v4 decodeCGSizeForKey:@"_iconSize"];
    *((double *)v5 + 5) = v13;
    *((double *)v5 + 6) = v12;
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
    _ZF = *MEMORY[0x263F001B0] == v13 && v14 == v12;
    if (_ZF) {
      *(int64x2_t *)(v5 + 40) = vdupq_n_s64(0x4050000000000000uLL);
    }
    [v4 decodeCGSizeForKey:@"_iconSpacing"];
    *((void *)v5 + 7) = v17;
    *((double *)v5 + 8) = v16;
    __asm { FMOV            V0.2D, #12.0 }
    if (_ZF && v14 == v16) {
      *(_OWORD *)(v5 + 56) = _Q0;
    }
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", @"_layoutInsets", _Q0);
    *((double *)v5 + 9) = v22;
    *((double *)v5 + 10) = v25;
    *((double *)v5 + 11) = v23;
    *((double *)v5 + 12) = v24;
    if (*(double *)(MEMORY[0x263F1D1C0] + 8) == v25
      && *MEMORY[0x263F1D1C0] == v22
      && *(double *)(MEMORY[0x263F1D1C0] + 24) == v24
      && *(double *)(MEMORY[0x263F1D1C0] + 16) == v23)
    {
      *(_OWORD *)(v5 + 72) = v27;
      *(_OWORD *)(v5 + 88) = v27;
    }
  }

  return (PUIStylePickerHomeScreenConfiguration *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t styleType = self->_styleType;
  id v5 = a3;
  [v5 encodeInteger:styleType forKey:@"_styleType"];
  [v5 encodeObject:self->_accentStyle forKey:@"_accentStyle"];
  [v5 encodeObject:self->_suggestedAccentColor forKey:@"_suggestedAccentColor"];
  [v5 encodeDouble:@"_iconContinuousCornerRadius" forKey:self->_iconContinuousCornerRadius];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"_iconSize", self->_iconSize.width, self->_iconSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", @"_iconSpacing", self->_iconSpacing.width, self->_iconSpacing.height);
  objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", @"_layoutInsets", self->_layoutInsets.top, self->_layoutInsets.left, self->_layoutInsets.bottom, self->_layoutInsets.right);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PUIStylePickerHomeScreenConfiguration allocWithZone:a3] init];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setStyleType:[(PUIStylePickerHomeScreenConfiguration *)self styleType]];
  id v5 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setAccentStyle:v5];

  unint64_t v6 = [(PUIStylePickerHomeScreenConfiguration *)self suggestedAccentColor];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setSuggestedAccentColor:v6];

  [(PUIStylePickerHomeScreenConfiguration *)self iconContinuousCornerRadius];
  -[PUIStylePickerHomeScreenConfiguration setIconContinuousCornerRadius:](v4, "setIconContinuousCornerRadius:");
  [(PUIStylePickerHomeScreenConfiguration *)self iconSize];
  -[PUIStylePickerHomeScreenConfiguration setIconSize:](v4, "setIconSize:");
  [(PUIStylePickerHomeScreenConfiguration *)self iconSpacing];
  -[PUIStylePickerHomeScreenConfiguration setIconSpacing:](v4, "setIconSpacing:");
  [(PUIStylePickerHomeScreenConfiguration *)self layoutInsets];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setLayoutInsets:"setLayoutInsets:"];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(PUIStylePickerHomeScreenConfiguration *)+[PUIMutableStylePickerHomeScreenConfiguration allocWithZone:a3] init];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setStyleType:[(PUIStylePickerHomeScreenConfiguration *)self styleType]];
  id v5 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setAccentStyle:v5];

  unint64_t v6 = [(PUIStylePickerHomeScreenConfiguration *)self suggestedAccentColor];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setSuggestedAccentColor:v6];

  [(PUIStylePickerHomeScreenConfiguration *)self iconContinuousCornerRadius];
  -[PUIStylePickerHomeScreenConfiguration setIconContinuousCornerRadius:](v4, "setIconContinuousCornerRadius:");
  [(PUIStylePickerHomeScreenConfiguration *)self iconSize];
  -[PUIStylePickerHomeScreenConfiguration setIconSize:](v4, "setIconSize:");
  [(PUIStylePickerHomeScreenConfiguration *)self iconSpacing];
  -[PUIStylePickerHomeScreenConfiguration setIconSpacing:](v4, "setIconSpacing:");
  [(PUIStylePickerHomeScreenConfiguration *)self layoutInsets];
  [(PUIStylePickerHomeScreenConfiguration *)v4 setLayoutInsets:"setLayoutInsets:"];
  return v4;
}

- (PUIDiscreteGradientVariatedCustomStyle)accentStyle
{
  return self->_accentStyle;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (CGSize)iconSpacing
{
  double width = self->_iconSpacing.width;
  double height = self->_iconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSpacing:(CGSize)a3
{
  self->_iconSpacing = a3;
}

- (double)iconContinuousCornerRadius
{
  return self->_iconContinuousCornerRadius;
}

- (void)setIconContinuousCornerRadius:(double)a3
{
  self->_iconContinuousCornerRadius = a3;
}

- (UIEdgeInsets)layoutInsets
{
  double top = self->_layoutInsets.top;
  double left = self->_layoutInsets.left;
  double bottom = self->_layoutInsets.bottom;
  double right = self->_layoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutInsets:(UIEdgeInsets)a3
{
  self->_layoutInsets = a3;
}

- (void)setStyleType:(unint64_t)a3
{
  self->_unint64_t styleType = a3;
}

- (UIColor)suggestedAccentColor
{
  return self->_suggestedAccentColor;
}

- (void)setSuggestedAccentColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAccentColor, 0);
  objc_storeStrong((id *)&self->_accentStyle, 0);
}

@end