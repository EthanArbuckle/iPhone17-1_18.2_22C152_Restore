@interface UIContentUnavailableImageProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToProperties:(int)a3 compareImage:;
- (BOOL)_isEqualToPropertiesQuick:(int)a3 compareImage:;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)isEqual:(id)a3;
- (CGFloat)cornerRadius;
- (CGSize)maximumSize;
- (UIColor)tintColor;
- (UIContentUnavailableImageProperties)init;
- (UIContentUnavailableImageProperties)initWithCoder:(id)a3;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (__CFString)_shortDescription;
- (double)_effectiveActivityIndicatorViewWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1;
- (void)_applyToActivityIndicatorView:(uint64_t)a1;
- (void)_applyToImageView:(uint64_t)a1;
- (void)_setTintColor:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setImage:(uint64_t)a1;
- (void)setMaximumSize:(CGSize)maximumSize;
- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration;
- (void)setTintColor:(UIColor *)tintColor;
@end

@implementation UIContentUnavailableImageProperties

- (void)_setTintColor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
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
    *(double *)(v5 + 40) = self->_cornerRadius;
    *(CGSize *)(v5 + 48) = self->_maximumSize;
    *(unsigned char *)(v5 + 12) = self->_accessibilityIgnoresInvertColors;
    *($7F50D8CB4061C9CDF79E0E588C24EA5D *)(v5 + 8) = self->_imageFlags;
  }
  return (id)v5;
}

- (UIContentUnavailableImageProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableImageProperties;
  return [(UIContentUnavailableImageProperties *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setImage:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v5 = *(unsigned char *)(a1 + 8);
    id v11 = v3;
    if (v5)
    {
      if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        uint64_t v6 = (void *)*((void *)v3 + 3);
      }
      else {
        uint64_t v6 = 0;
      }
      objc_setProperty_nonatomic_copy((id)a1, v4, v6, 24);
      char v5 = *(unsigned char *)(a1 + 8);
      id v3 = v11;
      if ((v5 & 2) != 0)
      {
LABEL_4:
        if ((v5 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    if (v3) {
      v7 = (void *)*((void *)v3 + 4);
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v7);
    char v5 = *(unsigned char *)(a1 + 8);
    id v3 = v11;
    if ((v5 & 4) != 0)
    {
LABEL_5:
      if ((v5 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
LABEL_14:
    if (v3) {
      uint64_t v8 = *((void *)v3 + 5);
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)(a1 + 40) = v8;
    if ((v5 & 8) != 0)
    {
LABEL_6:
      if ((v5 & 0x10) != 0) {
        goto LABEL_23;
      }
LABEL_20:
      if (v3) {
        BOOL v10 = *((unsigned char *)v3 + 12) != 0;
      }
      else {
        BOOL v10 = 0;
      }
      *(unsigned char *)(a1 + 12) = v10;
      goto LABEL_23;
    }
LABEL_17:
    if (v3) {
      long long v9 = *((_OWORD *)v3 + 3);
    }
    else {
      long long v9 = 0uLL;
    }
    *(_OWORD *)(a1 + 48) = v9;
    if ((v5 & 0x10) != 0) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
LABEL_23:
}

- (void)_applyToActivityIndicatorView:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    [v3 setActivityIndicatorViewStyle:16];
    [v3 _setCustomWidth:-[UIContentUnavailableImageProperties _effectiveActivityIndicatorViewWidth](a1)];
    [v3 setColor:*(void *)(a1 + 32)];
    [v3 setAccessibilityIgnoresInvertColors:*(unsigned __int8 *)(a1 + 12)];
  }
}

- (double)_effectiveActivityIndicatorViewWidth
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(double *)(a1 + 48);
  double v2 = *(double *)(a1 + 56);
  if (v1 >= v2) {
    double v3 = *(double *)(a1 + 56);
  }
  else {
    double v3 = *(double *)(a1 + 48);
  }
  BOOL v4 = v2 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v1 == *MEMORY[0x1E4F1DB30];
  double v5 = fmax(v3, 32.0);
  if (v4) {
    double v5 = 2777777.0;
  }
  uint64_t v6 = *(void *)(a1 + 24);
  double v7 = 0.0;
  if (v6)
  {
    if (*(unsigned char *)(v6 + 40)) {
      double v7 = *(double *)(v6 + 32);
    }
  }
  return fmax(fmin(v7, v5), 32.0);
}

- (BOOL)_isEqualToProperties:(int)a3 compareImage:
{
  double v5 = a2;
  if (!a1) {
    goto LABEL_25;
  }
  if (-[UIContentUnavailableImageProperties _isEqualToPropertiesQuick:compareImage:](a1, v5, a3))
  {
    BOOL v6 = 1;
    goto LABEL_26;
  }
  if (a3)
  {
    double v7 = (void *)*((void *)v5 + 2);
    id v8 = *(id *)(a1 + 16);
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      BOOL v10 = v9;
      if (!v8 || !v9) {
        goto LABEL_22;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_25;
      }
    }
  }
  v12 = (void *)*((void *)v5 + 3);
  id v8 = *(id *)(a1 + 24);
  id v13 = v12;
  if (v8 == v13)
  {
  }
  else
  {
    BOOL v10 = v13;
    if (!v8 || !v13) {
      goto LABEL_22;
    }
    int v14 = [v8 isEqual:v13];

    if (!v14) {
      goto LABEL_25;
    }
  }
  v15 = (void *)*((void *)v5 + 4);
  id v8 = *(id *)(a1 + 32);
  id v16 = v15;
  if (v8 == v16)
  {

    goto LABEL_24;
  }
  BOOL v10 = v16;
  if (!v8 || !v16)
  {
LABEL_22:

LABEL_25:
    BOOL v6 = 0;
    goto LABEL_26;
  }
  int v17 = [v8 isEqual:v16];

  if (!v17) {
    goto LABEL_25;
  }
LABEL_24:
  if (*(double *)(a1 + 40) != *((double *)v5 + 5)) {
    goto LABEL_25;
  }
  BOOL v6 = 0;
  if (*(double *)(a1 + 48) == *((double *)v5 + 6) && *(double *)(a1 + 56) == *((double *)v5 + 7)) {
    BOOL v6 = *(unsigned __int8 *)(a1 + 12) == v5[12];
  }
LABEL_26:

  return v6;
}

- (BOOL)_isEqualToPropertiesQuick:(int)a3 compareImage:
{
  double v5 = a2;
  BOOL v6 = (double *)v5;
  if (!a1) {
    goto LABEL_18;
  }
  if (v5 == (void *)a1)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (a3 && *(void *)(a1 + 16) != v5[2]) {
      goto LABEL_18;
    }
    double v7 = (void *)v5[3];
    id v8 = *(id *)(a1 + 24);
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      BOOL v10 = v9;
      if (!v8 || !v9)
      {

LABEL_18:
        BOOL v12 = 0;
        goto LABEL_19;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_18;
      }
    }
    if (*(void *)(a1 + 32) != *((void *)v6 + 4) || *(double *)(a1 + 40) != v6[5]) {
      goto LABEL_18;
    }
    BOOL v12 = 0;
    if (*(double *)(a1 + 48) == v6[6] && *(double *)(a1 + 56) == v6[7]) {
      BOOL v12 = *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v6 + 12);
    }
  }
LABEL_19:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableImageProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIContentUnavailableImageProperties;
  double v5 = [(UIContentUnavailableImageProperties *)&v25 init];
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

    [v4 decodeDoubleForKey:@"cornerRadius"];
    v5->_cornerRadius = v12;
    [v4 decodeCGSizeForKey:@"maximumSize"];
    v5->_maximumSize.double width = v13;
    v5->_maximumSize.double height = v14;
    v5->_accessibilityIgnoresInvertColors = [v4 decodeBoolForKey:@"accessibilityIgnoresInvertColors"];
    v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
    *(unsigned char *)&v5->_imageFlags = *(unsigned char *)&v5->_imageFlags & 0xFE | [v4 decodeBoolForKey:v15];

    id v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
    if ([v4 decodeBoolForKey:v16]) {
      char v17 = 2;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)&v5->_imageFlags = *(unsigned char *)&v5->_imageFlags & 0xFD | v17;

    v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
    if ([v4 decodeBoolForKey:v18]) {
      char v19 = 4;
    }
    else {
      char v19 = 0;
    }
    *(unsigned char *)&v5->_imageFlags = *(unsigned char *)&v5->_imageFlags & 0xFB | v19;

    v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
    if ([v4 decodeBoolForKey:v20]) {
      char v21 = 8;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v5->_imageFlags = *(unsigned char *)&v5->_imageFlags & 0xF7 | v21;

    v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"accessibilityIgnoresInvertColors"];
    if ([v4 decodeBoolForKey:v22]) {
      char v23 = 16;
    }
    else {
      char v23 = 0;
    }
    *(unsigned char *)&v5->_imageFlags = *(unsigned char *)&v5->_imageFlags & 0xEF | v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"image"];
  [v5 encodeObject:self->_preferredSymbolConfiguration forKey:@"preferredSymbolConfiguration"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"maximumSize", self->_maximumSize.width, self->_maximumSize.height);
  [v5 encodeBool:self->_accessibilityIgnoresInvertColors forKey:@"accessibilityIgnoresInvertColors"];
  uint64_t v6 = *(unsigned char *)&self->_imageFlags & 1;
  double v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_imageFlags >> 1) & 1;
  id v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(unsigned char *)&self->_imageFlags >> 2) & 1;
  int v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(unsigned char *)&self->_imageFlags >> 3) & 1;
  CGFloat v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(unsigned char *)&self->_imageFlags >> 4) & 1;
  id v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"accessibilityIgnoresInvertColors"];
  [v5 encodeBool:v14 forKey:v15];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIContentUnavailableImageProperties *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[UIContentUnavailableImageProperties _isEqualToProperties:compareImage:]((uint64_t)self, v5, 0);

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
    id v4 = [NSString stringWithFormat:@"image = %@", self->_image];
    [v3 addObject:v4];
  }
  if (self->_preferredSymbolConfiguration)
  {
    id v5 = [NSString stringWithFormat:@"preferredSymbolConfiguration = %@", self->_preferredSymbolConfiguration];
    [v3 addObject:v5];
  }
  if (self->_tintColor)
  {
    BOOL v6 = [NSString stringWithFormat:@"tintColor = %@", self->_tintColor];
    [v3 addObject:v6];
  }
  if (self->_cornerRadius > 0.0)
  {
    double v7 = objc_msgSend(NSString, "stringWithFormat:", @"cornerRadius = %g", *(void *)&self->_cornerRadius);
    [v3 addObject:v7];
  }
  CGFloat width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    int v11 = NSString;
    uint64_t v12 = NSStringFromCGSize(*(CGSize *)&width);
    CGFloat v13 = [v11 stringWithFormat:@"maximumSize = %@", v12];
    [v3 addObject:v13];
  }
  if (self->_accessibilityIgnoresInvertColors) {
    [v3 addObject:@"accessibilityIgnoresInvertColors = YES"];
  }
  if ([v3 count])
  {
    uint64_t v14 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    uint64_t v14 = @"none";
  }
  id v15 = NSString;
  id v16 = (objc_class *)objc_opt_class();
  char v17 = NSStringFromClass(v16);
  v18 = [v15 stringWithFormat:@"<%@: %p; %@>", v17, self, v14];

  return v18;
}

- (__CFString)_shortDescription
{
  double v1 = a1;
  if (a1)
  {
    if (a1->data)
    {
      double v2 = NSString;
      id v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      data = v1->data;
      BOOL v6 = [data _identityDescription];
      double v1 = [v2 stringWithFormat:@"<%@: %p; %@>", v4, data, v6];
    }
    else
    {
      double v1 = @"none";
    }
  }
  return v1;
}

- (void)_applyToImageView:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    id v4 = a2;
    [v4 setImage:v3];
    [v4 setPreferredSymbolConfiguration:*(void *)(a1 + 24)];
    [v4 setTintColor:*(void *)(a1 + 32)];
    [v4 setAccessibilityIgnoresInvertColors:*(unsigned __int8 *)(a1 + 12)];
  }
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  *(unsigned char *)&self->_imageFlags |= 1u;
  objc_setProperty_nonatomic_copy(self, a2, preferredSymbolConfiguration, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setTintColor:(UIColor *)tintColor
{
  *(unsigned char *)&self->_imageFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, tintColor);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(unsigned char *)&self->_imageFlags |= 4u;
  self->_cornerRadius = cornerRadius;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  *(unsigned char *)&self->_imageFlags |= 8u;
  self->_maximumSize = maximumSize;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors
{
  *(unsigned char *)&self->_imageFlags |= 0x10u;
  self->_accessibilityIgnoresInvertColors = accessibilityIgnoresInvertColors;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

@end