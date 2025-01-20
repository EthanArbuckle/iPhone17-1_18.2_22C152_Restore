@interface UIListContentImageProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)isEqual:(id)a3;
- (CGFloat)cornerRadius;
- (CGSize)maximumSize;
- (CGSize)reservedLayoutSize;
- (UIColor)resolvedTintColorForTintColor:(UIColor *)tintColor;
- (UIColor)strokeColor;
- (UIColor)tintColor;
- (UIConfigurationColorTransformer)tintColorTransformer;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIListContentImageProperties)init;
- (UIListContentImageProperties)initWithCoder:(id)a3;
- (double)strokeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedStrokeColorForTintColor:(id)a3;
- (id)strokeColorTransformer;
- (uint64_t)_isEqualToProperties:(int)a3 compareImage:;
- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareImage:;
- (unint64_t)hash;
- (void)__setStrokeColorTransformer:(uint64_t)a1;
- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1;
- (void)_applyToImageView:(uint64_t)a1;
- (void)_setTintColorTransformer:(uint64_t)a1;
- (void)_setTintColorTransformerIdentifier:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setMaximumSize:(CGSize)maximumSize;
- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration;
- (void)setReservedLayoutSize:(CGSize)reservedLayoutSize;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeColorTransformer:(id)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTintColorTransformer:(UIConfigurationColorTransformer)tintColorTransformer;
@end

@implementation UIListContentImageProperties

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareImage:
{
  v5 = a2;
  v6 = (double *)v5;
  if (!a1) {
    goto LABEL_28;
  }
  if (v5 == (void *)a1) {
    goto LABEL_26;
  }
  if (a3 && *(void *)(a1 + 16) != v5[2]) {
    goto LABEL_28;
  }
  v7 = (void *)v5[3];
  id v8 = *(id *)(a1 + 24);
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

LABEL_28:
      uint64_t v13 = 0;
      goto LABEL_29;
    }
    int v11 = [v8 isEqual:v9];

    if (!v11) {
      goto LABEL_28;
    }
  }
  if (*(void *)(a1 + 32) != *((void *)v6 + 4)) {
    goto LABEL_28;
  }
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12 != *((void *)v6 + 10) || v12 == 1 && *(void *)(a1 + 40) != *((void *)v6 + 5)) {
    goto LABEL_28;
  }
  if (*(double *)(a1 + 48) != v6[6]) {
    goto LABEL_28;
  }
  uint64_t v13 = 0;
  if (*(double *)(a1 + 96) == v6[12] && *(double *)(a1 + 104) == v6[13])
  {
    uint64_t v13 = 0;
    if (*(double *)(a1 + 112) == v6[14] && *(double *)(a1 + 120) == v6[15])
    {
      if (*(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12)) {
        goto LABEL_28;
      }
      if (*(void *)(a1 + 56) != *((void *)v6 + 7)) {
        goto LABEL_28;
      }
      uint64_t v14 = *(void *)(a1 + 88);
      if (v14 != *((void *)v6 + 11) || v14 == 1 && *(void *)(a1 + 64) != *((void *)v6 + 8)) {
        goto LABEL_28;
      }
      if (*(double *)(a1 + 72) != v6[9]) {
        goto LABEL_28;
      }
LABEL_26:
      uint64_t v13 = 1;
    }
  }
LABEL_29:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strokeColorTransformer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong(&self->_tintColorTransformer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v16 = v3;
    if (v5)
    {
      if ((v5 & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        v6 = (void *)*((void *)v3 + 3);
      }
      else {
        v6 = 0;
      }
      objc_setProperty_nonatomic_copy((id)a1, v4, v6, 24);
      __int16 v5 = *(_WORD *)(a1 + 8);
      id v3 = v16;
      if ((v5 & 2) != 0)
      {
LABEL_4:
        if ((v5 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_19;
      }
    }
    if (v3) {
      v7 = (void *)*((void *)v3 + 4);
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v7);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v16;
    if ((v5 & 4) != 0)
    {
LABEL_5:
      if ((v5 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
LABEL_19:
    if (v3) {
      id v8 = (void *)*((void *)v3 + 5);
    }
    else {
      id v8 = 0;
    }
    -[UIListContentImageProperties _setTintColorTransformer:](a1, v8);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v16;
    if ((v5 & 8) != 0)
    {
LABEL_6:
      if ((v5 & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_25;
    }
LABEL_22:
    if (v3) {
      uint64_t v9 = *((void *)v3 + 6);
    }
    else {
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 48) = v9;
    if ((v5 & 0x10) != 0)
    {
LABEL_7:
      if ((v5 & 0x20) != 0) {
        goto LABEL_8;
      }
      goto LABEL_28;
    }
LABEL_25:
    if (v3) {
      long long v10 = *((_OWORD *)v3 + 6);
    }
    else {
      long long v10 = 0uLL;
    }
    *(_OWORD *)(a1 + 96) = v10;
    if ((v5 & 0x20) != 0)
    {
LABEL_8:
      if ((v5 & 0x40) != 0) {
        goto LABEL_9;
      }
      goto LABEL_31;
    }
LABEL_28:
    if (v3) {
      long long v11 = *((_OWORD *)v3 + 7);
    }
    else {
      long long v11 = 0uLL;
    }
    *(_OWORD *)(a1 + 112) = v11;
    if ((v5 & 0x40) != 0)
    {
LABEL_9:
      if ((v5 & 0x80) != 0) {
        goto LABEL_10;
      }
      goto LABEL_34;
    }
LABEL_31:
    if (v3) {
      BOOL v12 = *((unsigned char *)v3 + 12) != 0;
    }
    else {
      BOOL v12 = 0;
    }
    *(unsigned char *)(a1 + 12) = v12;
    if ((v5 & 0x80) != 0)
    {
LABEL_10:
      if ((v5 & 0x100) != 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
LABEL_34:
    if (v3) {
      uint64_t v13 = (void *)*((void *)v3 + 7);
    }
    else {
      uint64_t v13 = 0;
    }
    objc_storeStrong((id *)(a1 + 56), v13);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v16;
    if ((v5 & 0x100) != 0)
    {
LABEL_11:
      if ((v5 & 0x200) != 0) {
        goto LABEL_43;
      }
LABEL_40:
      if (v3) {
        uint64_t v15 = *((void *)v3 + 9);
      }
      else {
        uint64_t v15 = 0;
      }
      *(void *)(a1 + 72) = v15;
      goto LABEL_43;
    }
LABEL_37:
    if (v3) {
      uint64_t v14 = (void *)*((void *)v3 + 8);
    }
    else {
      uint64_t v14 = 0;
    }
    -[UIListContentImageProperties __setStrokeColorTransformer:](a1, v14);
    id v3 = v16;
    if ((*(_WORD *)(a1 + 8) & 0x200) != 0) {
      goto LABEL_43;
    }
    goto LABEL_40;
  }
LABEL_43:
}

- (void)_setTintColorTransformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    *(void *)(a1 + 80) = _UIConfigurationIdentifierForColorTransformer(v3);
    uint64_t v4 = [v3 copy];

    __int16 v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;
  }
}

- (void)__setStrokeColorTransformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    *(void *)(a1 + 88) = _UIConfigurationIdentifierForColorTransformer(v3);
    uint64_t v4 = [v3 copy];

    __int16 v5 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v4;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_image);
    uint64_t v6 = [(UIImageSymbolConfiguration *)self->_preferredSymbolConfiguration copy];
    v7 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v6;

    objc_storeStrong((id *)(v5 + 32), self->_tintColor);
    uint64_t v8 = [self->_tintColorTransformer copy];
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    *(void *)(v5 + 80) = self->_tintColorTransformerIdentifier;
    *(double *)(v5 + 48) = self->_cornerRadius;
    *(CGSize *)(v5 + 96) = self->_reservedLayoutSize;
    *(CGSize *)(v5 + 112) = self->_maximumSize;
    *(unsigned char *)(v5 + 12) = self->_accessibilityIgnoresInvertColors;
    objc_storeStrong((id *)(v5 + 56), self->_strokeColor);
    long long v10 = _Block_copy(self->_strokeColorTransformer);
    long long v11 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v10;

    *(void *)(v5 + 88) = self->_strokeColorTransformerIdentifier;
    *(double *)(v5 + 72) = self->_strokeWidth;
    *($1C1F922583BEB0E08A862DB7E06B5FF0 *)(v5 + 8) = self->_imageFlags;
  }
  return (id)v5;
}

- (UIListContentImageProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIListContentImageProperties;
  v2 = [(UIListContentImageProperties *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[UIColor clearColor];
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;
  }
  return v2;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)reservedLayoutSize
{
  double width = self->_reservedLayoutSize.width;
  double height = self->_reservedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_applyToImageView:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t v8 = v3;
    [v3 setImage:*(void *)(a1 + 16)];
    [v8 setPreferredSymbolConfiguration:*(void *)(a1 + 24)];
    if (*(void *)(a1 + 32) || *(void *)(a1 + 40))
    {
      uint64_t v4 = -[UIView _ancestorTintColor](v8);
      uint64_t v5 = [(id)a1 resolvedTintColorForTintColor:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
    [v8 setTintColor:v5];
    objc_super v6 = [v8 tintColor];
    v7 = [(id)a1 _resolvedStrokeColorForTintColor:v6];
    [v8 _setStrokeColor:v7];

    [v8 _setStrokeWidth:*(double *)(a1 + 72)];
    [v8 setAccessibilityIgnoresInvertColors:*(unsigned __int8 *)(a1 + 12)];

    uint64_t v3 = v8;
  }
}

- (id)resolvedStrokeColorForTintColor:(id)a3
{
  uint64_t v4 = (UIColor *)a3;
  uint64_t v5 = v4;
  strokeColor = self->_strokeColor;
  if (!strokeColor) {
    strokeColor = v4;
  }
  v7 = strokeColor;
  strokeColorTransformer = (void (**)(id, id))self->_strokeColorTransformer;
  if (strokeColorTransformer)
  {
    strokeColorTransformer[2](strokeColorTransformer, v7);
    uint64_t v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = v7;
  }
  long long v10 = v9;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentImageProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)UIListContentImageProperties;
  uint64_t v5 = [(UIListContentImageProperties *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredSymbolConfiguration"];
    preferredSymbolConfiguration = v5->_preferredSymbolConfiguration;
    v5->_preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v10;

    -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v5, [v4 decodeIntegerForKey:@"tintColorTransformerIdentifier"]);
    [v4 decodeDoubleForKey:@"cornerRadius"];
    v5->_cornerRadius = v12;
    [v4 decodeCGSizeForKey:@"reservedLayoutSize"];
    v5->_reservedLayoutSize.double width = v13;
    v5->_reservedLayoutSize.double height = v14;
    [v4 decodeCGSizeForKey:@"maximumSize"];
    v5->_maximumSize.double width = v15;
    v5->_maximumSize.double height = v16;
    v5->_accessibilityIgnoresInvertColors = [v4 decodeBoolForKey:@"accessibilityIgnoresInvertColors"];
    if ([v4 containsValueForKey:@"strokeColor"])
    {
      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
      strokeColor = v5->_strokeColor;
      v5->_strokeColor = (UIColor *)v17;

      uint64_t v19 = [v4 decodeIntegerForKey:@"strokeColorTransformerIdentifier"];
      uint64_t v20 = _UIConfigurationColorTransformerForIdentifier(v19);
      id strokeColorTransformer = v5->_strokeColorTransformer;
      v5->_id strokeColorTransformer = (id)v20;

      if (v5->_strokeColorTransformer) {
        uint64_t v22 = v19;
      }
      else {
        uint64_t v22 = 0;
      }
      v5->_strokeColorTransformerIdentifier = v22;
      [v4 decodeDoubleForKey:@"strokeWidth"];
      v5->_strokeWidth = v23;
    }
    else
    {
      uint64_t v24 = +[UIColor clearColor];
      v25 = v5->_strokeColor;
      v5->_strokeColor = (UIColor *)v24;
    }
    v26 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFE | [v4 decodeBoolForKey:v26];

    v27 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
    if ([v4 decodeBoolForKey:v27]) {
      __int16 v28 = 2;
    }
    else {
      __int16 v28 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFD | v28;

    v29 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColorTransformerIdentifier"];
    if ([v4 decodeBoolForKey:v29]) {
      __int16 v30 = 4;
    }
    else {
      __int16 v30 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFB | v30;

    v31 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
    if ([v4 decodeBoolForKey:v31]) {
      __int16 v32 = 8;
    }
    else {
      __int16 v32 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFF7 | v32;

    v33 = [NSString stringWithFormat:@"hasCustomized-%@", @"reservedLayoutSize"];
    if ([v4 decodeBoolForKey:v33]) {
      __int16 v34 = 16;
    }
    else {
      __int16 v34 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFEF | v34;

    v35 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
    if ([v4 decodeBoolForKey:v35]) {
      __int16 v36 = 32;
    }
    else {
      __int16 v36 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFDF | v36;

    v37 = [NSString stringWithFormat:@"hasCustomized-%@", @"accessibilityIgnoresInvertColors"];
    if ([v4 decodeBoolForKey:v37]) {
      __int16 v38 = 64;
    }
    else {
      __int16 v38 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFBF | v38;

    v39 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
    if ([v4 decodeBoolForKey:v39]) {
      __int16 v40 = 128;
    }
    else {
      __int16 v40 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFF7F | v40;

    v41 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColorTransformerIdentifier"];
    if ([v4 decodeBoolForKey:v41]) {
      __int16 v42 = 256;
    }
    else {
      __int16 v42 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFEFF | v42;

    v43 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
    if ([v4 decodeBoolForKey:v43]) {
      __int16 v44 = 512;
    }
    else {
      __int16 v44 = 0;
    }
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFDFF | v44;
  }
  return v5;
}

- (void)_setTintColorTransformerIdentifier:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = _UIConfigurationColorTransformerForIdentifier(a2);
    uint64_t v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;

    if (*(void *)(a1 + 40)) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = 0;
    }
    *(void *)(a1 + 80) = v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"image"];
  [v5 encodeObject:self->_preferredSymbolConfiguration forKey:@"preferredSymbolConfiguration"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeInteger:self->_tintColorTransformerIdentifier forKey:@"tintColorTransformerIdentifier"];
  [v5 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"reservedLayoutSize", self->_reservedLayoutSize.width, self->_reservedLayoutSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", @"maximumSize", self->_maximumSize.width, self->_maximumSize.height);
  [v5 encodeBool:self->_accessibilityIgnoresInvertColors forKey:@"accessibilityIgnoresInvertColors"];
  [v5 encodeObject:self->_strokeColor forKey:@"strokeColor"];
  [v5 encodeInteger:self->_strokeColorTransformerIdentifier forKey:@"strokeColorTransformerIdentifier"];
  [v5 encodeDouble:@"strokeWidth" forKey:self->_strokeWidth];
  uint64_t v6 = *(_WORD *)&self->_imageFlags & 1;
  v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(_WORD *)&self->_imageFlags >> 1) & 1;
  uint64_t v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_imageFlags >> 2) & 1;
  long long v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColorTransformerIdentifier"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_imageFlags >> 3) & 1;
  CGFloat v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_imageFlags >> 4) & 1;
  CGFloat v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"reservedLayoutSize"];
  [v5 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(_WORD *)&self->_imageFlags >> 5) & 1;
  uint64_t v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
  [v5 encodeBool:v16 forKey:v17];

  uint64_t v18 = (*(_WORD *)&self->_imageFlags >> 6) & 1;
  uint64_t v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"accessibilityIgnoresInvertColors"];
  [v5 encodeBool:v18 forKey:v19];

  uint64_t v20 = (*(_WORD *)&self->_imageFlags >> 7) & 1;
  v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
  [v5 encodeBool:v20 forKey:v21];

  uint64_t v22 = HIBYTE(*(_WORD *)&self->_imageFlags) & 1;
  double v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColorTransformerIdentifier"];
  [v5 encodeBool:v22 forKey:v23];

  uint64_t v24 = (*(_WORD *)&self->_imageFlags >> 9) & 1;
  id v25 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
  [v5 encodeBool:v24 forKey:v25];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UIListContentImageProperties *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[UIListContentImageProperties _isEqualToProperties:compareImage:]((uint64_t)self, v5, 0);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToProperties:(int)a3 compareImage:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  if (-[UIListContentImageProperties _isEqualToPropertiesQuick:compareImage:](a1, v5, a3))
  {
LABEL_3:
    uint64_t v6 = 1;
    goto LABEL_24;
  }
  if (a3)
  {
    v7 = v5[2];
    id v8 = *(id *)(a1 + 16);
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      if (!v8 || !v9) {
        goto LABEL_22;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_23;
      }
    }
  }
  uint64_t v12 = v5[3];
  id v8 = *(id *)(a1 + 24);
  id v13 = v12;
  if (v8 == v13)
  {
  }
  else
  {
    uint64_t v10 = v13;
    if (!v8 || !v13) {
      goto LABEL_22;
    }
    int v14 = [v8 isEqual:v13];

    if (!v14) {
      goto LABEL_23;
    }
  }
  CGFloat v15 = v5[4];
  id v8 = *(id *)(a1 + 32);
  id v16 = v15;
  if (v8 == v16)
  {

    goto LABEL_26;
  }
  uint64_t v10 = v16;
  if (!v8 || !v16)
  {
LABEL_22:

    goto LABEL_23;
  }
  int v17 = [v8 isEqual:v16];

  if (!v17) {
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v19 = *(void **)(a1 + 80);
  if (v19 != v5[10] || v19 == (void *)1 && *(void **)(a1 + 40) != v5[5] || *(double *)(a1 + 48) != *((double *)v5 + 6)) {
    goto LABEL_23;
  }
  uint64_t v6 = 0;
  if (*(double *)(a1 + 96) == *((double *)v5 + 12) && *(double *)(a1 + 104) == *((double *)v5 + 13))
  {
    uint64_t v6 = 0;
    if (*(double *)(a1 + 112) == *((double *)v5 + 14) && *(double *)(a1 + 120) == *((double *)v5 + 15))
    {
      if (*(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v5 + 12))
      {
        if (UIEqual(*(void **)(a1 + 56), v5[7]))
        {
          uint64_t v20 = *(void **)(a1 + 88);
          if (v20 == v5[11]
            && (v20 != (void *)1 || *(void **)(a1 + 64) == v5[8])
            && *(double *)(a1 + 72) == *((double *)v5 + 9))
          {
            goto LABEL_3;
          }
        }
      }
LABEL_23:
      uint64_t v6 = 0;
    }
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIImageSymbolConfiguration *)self->_preferredSymbolConfiguration hash];
  return [(UIColor *)self->_tintColor hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_image)
  {
    uint64_t v4 = [NSString stringWithFormat:@"image = %@", self->_image];
    [v3 addObject:v4];
  }
  if (self->_preferredSymbolConfiguration)
  {
    id v5 = [NSString stringWithFormat:@"preferredSymbolConfiguration = %@", self->_preferredSymbolConfiguration];
    [v3 addObject:v5];
  }
  if (self->_tintColor)
  {
    uint64_t v6 = [NSString stringWithFormat:@"tintColor = %@", self->_tintColor];
    [v3 addObject:v6];
  }
  else
  {
    [v3 addObject:@"tintColor = Inherited"];
  }
  unint64_t tintColorTransformerIdentifier = self->_tintColorTransformerIdentifier;
  if (tintColorTransformerIdentifier)
  {
    id v8 = NSString;
    id v9 = _UIConfigurationColorTransformerIdentifierToString(tintColorTransformerIdentifier);
    uint64_t v10 = [v8 stringWithFormat:@"tintColorTransformer = %@", v9];
    [v3 addObject:v10];
  }
  if (self->_cornerRadius > 0.0)
  {
    int v11 = objc_msgSend(NSString, "stringWithFormat:", @"cornerRadius = %g", *(void *)&self->_cornerRadius);
    [v3 addObject:v11];
  }
  CGFloat width = self->_reservedLayoutSize.width;
  double height = self->_reservedLayoutSize.height;
  double v14 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width != *MEMORY[0x1E4F1DB30] || height != v15)
  {
    int v17 = NSString;
    uint64_t v18 = NSStringFromCGSize(*(CGSize *)&width);
    uint64_t v19 = [v17 stringWithFormat:@"reservedLayoutSize = %@", v18];
    [v3 addObject:v19];
  }
  CGFloat v20 = self->_maximumSize.width;
  double v21 = self->_maximumSize.height;
  if (v20 != v14 || v21 != v15)
  {
    double v23 = NSString;
    uint64_t v24 = NSStringFromCGSize(*(CGSize *)&v20);
    id v25 = [v23 stringWithFormat:@"maximumSize = %@", v24];
    [v3 addObject:v25];
  }
  if (self->_accessibilityIgnoresInvertColors) {
    [v3 addObject:@"accessibilityIgnoresInvertColors = YES"];
  }
  if (self->_strokeWidth > 0.0)
  {
    strokeColor = self->_strokeColor;
    v27 = +[UIColor clearColor];

    if (strokeColor != v27)
    {
      if (self->_strokeColor)
      {
        __int16 v28 = [NSString stringWithFormat:@"strokeColor = %@", self->_strokeColor];
        [v3 addObject:v28];
      }
      else
      {
        [v3 addObject:@"strokeColor = Inherited Tint Color"];
      }
      unint64_t strokeColorTransformerIdentifier = self->_strokeColorTransformerIdentifier;
      if (strokeColorTransformerIdentifier)
      {
        __int16 v30 = NSString;
        v31 = _UIConfigurationColorTransformerIdentifierToString(strokeColorTransformerIdentifier);
        v32 = [v30 stringWithFormat:@"id strokeColorTransformer = %@", v31];
        [v3 addObject:v32];
      }
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"strokeWidth = %g", *(void *)&self->_strokeWidth);
      [v3 addObject:v33];
    }
  }
  if ([v3 count])
  {
    __int16 v34 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    __int16 v34 = @"none";
  }
  v35 = NSString;
  __int16 v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  __int16 v38 = [v35 stringWithFormat:@"<%@: %p; %@>", v37, self, v34];

  return v38;
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  *(_WORD *)&self->_imageFlags |= 1u;
  objc_setProperty_nonatomic_copy(self, a2, preferredSymbolConfiguration, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setTintColor:(UIColor *)tintColor
{
  *(_WORD *)&self->_imageFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, tintColor);
}

- (void)setTintColorTransformer:(UIConfigurationColorTransformer)tintColorTransformer
{
  *(_WORD *)&self->_imageFlags |= 4u;
  -[UIListContentImageProperties _setTintColorTransformer:]((uint64_t)self, tintColorTransformer);
}

- (UIConfigurationColorTransformer)tintColorTransformer
{
  v2 = _Block_copy(self->_tintColorTransformer);
  return v2;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(_WORD *)&self->_imageFlags |= 8u;
  self->_cornerRadius = cornerRadius;
}

- (void)setReservedLayoutSize:(CGSize)reservedLayoutSize
{
  *(_WORD *)&self->_imageFlags |= 0x10u;
  self->_reservedLayoutSize = reservedLayoutSize;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  *(_WORD *)&self->_imageFlags |= 0x20u;
  self->_maximumSize = maximumSize;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors
{
  *(_WORD *)&self->_imageFlags |= 0x40u;
  self->_accessibilityIgnoresInvertColors = accessibilityIgnoresInvertColors;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

- (void)setStrokeColor:(id)a3
{
  *(_WORD *)&self->_imageFlags |= 0x80u;
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColorTransformer:(id)a3
{
  *(_WORD *)&self->_imageFlags |= 0x100u;
  -[UIListContentImageProperties __setStrokeColorTransformer:]((uint64_t)self, a3);
}

- (id)strokeColorTransformer
{
  v2 = _Block_copy(self->_strokeColorTransformer);
  return v2;
}

- (void)setStrokeWidth:(double)a3
{
  *(_WORD *)&self->_imageFlags |= 0x200u;
  self->_strokeWidth = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (UIColor)resolvedTintColorForTintColor:(UIColor *)tintColor
{
  uint64_t v4 = tintColor;
  id v5 = v4;
  uint64_t v6 = self->_tintColor;
  if (!v6) {
    uint64_t v6 = v4;
  }
  v7 = v6;
  tintColorTransformer = (void (**)(id, id))self->_tintColorTransformer;
  if (tintColorTransformer)
  {
    tintColorTransformer[2](tintColorTransformer, v7);
    id v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v7;
  }
  uint64_t v10 = v9;

  return v10;
}

@end