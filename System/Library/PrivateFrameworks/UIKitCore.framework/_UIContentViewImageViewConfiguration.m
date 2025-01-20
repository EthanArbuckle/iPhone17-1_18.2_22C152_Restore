@interface _UIContentViewImageViewConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToConfiguration:(uint64_t)a1;
- (BOOL)_isEqualToConfigurationQuick:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (CGSize)maximumSize;
- (CGSize)reservedLayoutSize;
- (UIColor)tintColor;
- (UIImage)highlightedImage;
- (UIImage)image;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (_UIContentViewImageViewConfiguration)init;
- (_UIContentViewImageViewConfiguration)initWithCoder:(id)a3;
- (__CFString)_shortDescription;
- (double)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1;
- (void)applyToImageView:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlightedImage:(id)a3;
- (void)setHorizontalCenteringWidth:(double)a3;
- (void)setImage:(id)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setReservedLayoutSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _UIContentViewImageViewConfiguration

- (_UIContentViewImageViewConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContentViewImageViewConfiguration;
  return [(_UIContentViewImageViewConfiguration *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIContentViewImageViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIContentViewImageViewConfiguration;
  v5 = [(_UIContentViewImageViewConfiguration *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highlightedImage"];
    highlightedImage = v5->_highlightedImage;
    v5->_highlightedImage = (UIImage *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredSymbolConfiguration"];
    preferredSymbolConfiguration = v5->_preferredSymbolConfiguration;
    v5->_preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v12;

    [v4 decodeDoubleForKey:@"cornerRadius"];
    v5->_cornerRadius = v14;
    [v4 decodeCGSizeForKey:@"reservedLayoutSize"];
    v5->_reservedLayoutSize.width = v15;
    v5->_reservedLayoutSize.height = v16;
    [v4 decodeCGSizeForKey:@"maximumSize"];
    v5->_maximumSize.width = v17;
    v5->_maximumSize.height = v18;
    v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"image"];
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v19];

    v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
    if ([v4 decodeBoolForKey:v20]) {
      char v21 = 2;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v21;

    v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
    if ([v4 decodeBoolForKey:v22]) {
      char v23 = 4;
    }
    else {
      char v23 = 0;
    }
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFB | v23;

    v24 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
    if ([v4 decodeBoolForKey:v24]) {
      char v25 = 8;
    }
    else {
      char v25 = 0;
    }
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xF7 | v25;

    v26 = [NSString stringWithFormat:@"hasCustomized-%@", @"reservedLayoutSize"];
    if ([v4 decodeBoolForKey:v26]) {
      char v27 = 16;
    }
    else {
      char v27 = 0;
    }
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xEF | v27;

    v28 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
    if ([v4 decodeBoolForKey:v28]) {
      char v29 = 32;
    }
    else {
      char v29 = 0;
    }
    *(unsigned char *)&v5->_configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xDF | v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"image"];
  [v5 encodeObject:self->_highlightedImage forKey:@"highlightedImage"];
  [v5 encodeObject:self->_preferredSymbolConfiguration forKey:@"preferredSymbolConfiguration"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"reservedLayoutSize", self->_reservedLayoutSize.width, self->_reservedLayoutSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", @"maximumSize", self->_maximumSize.width, self->_maximumSize.height);
  uint64_t v6 = *(unsigned char *)&self->_configurationFlags & 1;
  v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"image"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
  v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"preferredSymbolConfiguration"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(unsigned char *)&self->_configurationFlags >> 2) & 1;
  v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"tintColor"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(unsigned char *)&self->_configurationFlags >> 3) & 1;
  v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(unsigned char *)&self->_configurationFlags >> 4) & 1;
  CGFloat v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"reservedLayoutSize"];
  [v5 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(unsigned char *)&self->_configurationFlags >> 5) & 1;
  id v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"maximumSize"];
  [v5 encodeBool:v16 forKey:v17];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_image);
    objc_storeStrong((id *)(v5 + 48), self->_highlightedImage);
    uint64_t v6 = [(UIImageSymbolConfiguration *)self->_preferredSymbolConfiguration copy];
    v7 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v6;

    objc_storeStrong((id *)(v5 + 32), self->_tintColor);
    *(double *)(v5 + 40) = self->_cornerRadius;
    *(CGSize *)(v5 + 56) = self->_reservedLayoutSize;
    *(CGSize *)(v5 + 72) = self->_maximumSize;
    *($86FA21D87CEDB4EE83B4CEBBBEC486C5 *)(v5 + 8) = self->_configurationFlags;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIContentViewImageViewConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_UIContentViewImageViewConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);

  return v6;
}

- (BOOL)_isEqualToConfiguration:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_22;
  }
  if (-[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](a1, v3))
  {
    BOOL v4 = 1;
    goto LABEL_23;
  }
  uint64_t v5 = (void *)*((void *)v3 + 2);
  id v6 = *(id *)(a1 + 16);
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_21;
    }
    int v9 = [v6 isEqual:v7];

    if (!v9) {
      goto LABEL_22;
    }
  }
  uint64_t v10 = (void *)*((void *)v3 + 6);
  id v6 = *(id *)(a1 + 48);
  id v11 = v10;
  if (v6 == v11)
  {

    goto LABEL_16;
  }
  uint64_t v8 = v11;
  if (!v6 || !v11)
  {
LABEL_21:

    goto LABEL_22;
  }
  int v12 = [v6 isEqual:v11];

  if (!v12) {
    goto LABEL_22;
  }
LABEL_16:
  v13 = (void *)*((void *)v3 + 4);
  id v6 = *(id *)(a1 + 32);
  id v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_25;
  }
  uint64_t v8 = v14;
  if (!v6 || !v14) {
    goto LABEL_21;
  }
  int v15 = [v6 isEqual:v14];

  if (!v15)
  {
LABEL_22:
    BOOL v4 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(double *)(a1 + 40) != *((double *)v3 + 5)) {
    goto LABEL_22;
  }
  BOOL v4 = 0;
  if (*(double *)(a1 + 56) == *((double *)v3 + 7) && *(double *)(a1 + 64) == *((double *)v3 + 8)) {
    BOOL v4 = *(double *)(a1 + 80) == *((double *)v3 + 10) && *(double *)(a1 + 72) == *((double *)v3 + 9);
  }
LABEL_23:

  return v4;
}

- (BOOL)_isEqualToConfigurationQuick:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = (double *)v3;
  if (!a1) {
    goto LABEL_5;
  }
  if (v3 == (void *)a1)
  {
    BOOL v5 = 1;
    goto LABEL_7;
  }
  if (*(void *)(a1 + 16) != v3[2] || *(void *)(a1 + 48) != v3[6]) {
    goto LABEL_5;
  }
  id v7 = (void *)v3[3];
  id v8 = *(id *)(a1 + 24);
  id v9 = v7;
  if (v8 != v9)
  {
    uint64_t v10 = v9;
    if (v8 && v9)
    {
      int v11 = [v8 isEqual:v9];

      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
    }
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_7;
  }

LABEL_14:
  if (*(void *)(a1 + 32) != *((void *)v4 + 4) || *(double *)(a1 + 40) != v4[5]) {
    goto LABEL_5;
  }
  BOOL v5 = 0;
  if (*(double *)(a1 + 56) == v4[7] && *(double *)(a1 + 64) == v4[8]) {
    BOOL v5 = *(double *)(a1 + 80) == v4[10] && *(double *)(a1 + 72) == v4[9];
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIImage *)self->_image hash];
  unint64_t v4 = [(UIImage *)self->_highlightedImage hash] ^ v3;
  unint64_t v5 = [(UIImageSymbolConfiguration *)self->_preferredSymbolConfiguration hash];
  return v4 ^ v5 ^ [(UIColor *)self->_tintColor hash];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_image)
  {
    unint64_t v4 = [NSString stringWithFormat:@"image = %@", self->_image];
    [v3 addObject:v4];
  }
  if (self->_preferredSymbolConfiguration)
  {
    unint64_t v5 = [NSString stringWithFormat:@"preferredSymbolConfiguration = %@", self->_preferredSymbolConfiguration];
    [v3 addObject:v5];
  }
  if (self->_tintColor)
  {
    id v6 = [NSString stringWithFormat:@"tintColor = %@", self->_tintColor];
    [v3 addObject:v6];
  }
  if (self->_cornerRadius > 0.0)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"cornerRadius = %g", *(void *)&self->_cornerRadius);
    [v3 addObject:v7];
  }
  CGFloat width = self->_reservedLayoutSize.width;
  double height = self->_reservedLayoutSize.height;
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width != *MEMORY[0x1E4F1DB30] || height != v11)
  {
    v13 = NSString;
    id v14 = NSStringFromCGSize(*(CGSize *)&width);
    int v15 = [v13 stringWithFormat:@"reservedLayoutSize = %@", v14];
    [v3 addObject:v15];
  }
  CGFloat v16 = self->_maximumSize.width;
  double v17 = self->_maximumSize.height;
  if (v16 != v10 || v17 != v11)
  {
    v19 = NSString;
    v20 = NSStringFromCGSize(*(CGSize *)&v16);
    char v21 = [v19 stringWithFormat:@"maximumSize = %@", v20];
    [v3 addObject:v21];
  }
  if ([v3 count])
  {
    v22 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    v22 = @"empty configuration";
  }
  char v23 = NSString;
  v24 = (objc_class *)objc_opt_class();
  char v25 = NSStringFromClass(v24);
  v26 = [v23 stringWithFormat:@"<%@: %p; %@>", v25, self, v22];

  return v26;
}

- (__CFString)_shortDescription
{
  v1 = a1;
  if (a1)
  {
    if (a1->data || a1[1].data)
    {
      v2 = NSString;
      id v3 = (objc_class *)objc_opt_class();
      unint64_t v4 = NSStringFromClass(v3);
      data = v1->data;
      id v6 = [data _identityDescription];
      v1 = [v2 stringWithFormat:@"<%@: %p; %@>", v4, data, v6];
    }
    else
    {
      v1 = @"none";
    }
  }
  return v1;
}

- (void)applyToImageView:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 setImage:image];
  [v5 setHighlightedImage:self->_highlightedImage];
  [v5 setPreferredSymbolConfiguration:self->_preferredSymbolConfiguration];
  [v5 setTintColor:self->_tintColor];
}

- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v5 = *(unsigned char *)(a1 + 8);
    int v12 = v3;
    if (v5)
    {
      if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        id v6 = (void *)*((void *)v3 + 2);
      }
      else {
        id v6 = 0;
      }
      objc_storeStrong((id *)(a1 + 16), v6);
      char v5 = *(unsigned char *)(a1 + 8);
      id v3 = v12;
      if ((v5 & 2) != 0)
      {
LABEL_4:
        if ((v5 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
    if (v3) {
      id v7 = (void *)*((void *)v3 + 3);
    }
    else {
      id v7 = 0;
    }
    objc_setProperty_nonatomic_copy((id)a1, v4, v7, 24);
    char v5 = *(unsigned char *)(a1 + 8);
    id v3 = v12;
    if ((v5 & 4) != 0)
    {
LABEL_5:
      if ((v5 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
LABEL_15:
    if (v3) {
      id v8 = (void *)*((void *)v3 + 4);
    }
    else {
      id v8 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v8);
    char v5 = *(unsigned char *)(a1 + 8);
    id v3 = v12;
    if ((v5 & 8) != 0)
    {
LABEL_6:
      if ((v5 & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_21;
    }
LABEL_18:
    if (v3) {
      uint64_t v9 = *((void *)v3 + 5);
    }
    else {
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 40) = v9;
    if ((v5 & 0x10) != 0)
    {
LABEL_7:
      if ((v5 & 0x20) != 0) {
        goto LABEL_27;
      }
LABEL_24:
      if (v3) {
        long long v11 = *(_OWORD *)(v3 + 72);
      }
      else {
        long long v11 = 0uLL;
      }
      *(_OWORD *)(a1 + 72) = v11;
      goto LABEL_27;
    }
LABEL_21:
    if (v3) {
      long long v10 = *(_OWORD *)(v3 + 56);
    }
    else {
      long long v10 = 0uLL;
    }
    *(_OWORD *)(a1 + 56) = v10;
    if ((v5 & 0x20) != 0) {
      goto LABEL_27;
    }
    goto LABEL_24;
  }
LABEL_27:
}

- (void)setImage:(id)a3
{
  *(unsigned char *)&self->_configurationFlags |= 1u;
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  *(unsigned char *)&self->_configurationFlags |= 2u;
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setTintColor:(id)a3
{
  *(unsigned char *)&self->_configurationFlags |= 4u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setCornerRadius:(double)a3
{
  *(unsigned char *)&self->_configurationFlags |= 8u;
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setReservedLayoutSize:(CGSize)a3
{
  *(unsigned char *)&self->_configurationFlags |= 0x10u;
  self->_reservedLayoutSize = a3;
}

- (CGSize)reservedLayoutSize
{
  double width = self->_reservedLayoutSize.width;
  double height = self->_reservedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  *(unsigned char *)&self->_configurationFlags |= 0x20u;
  self->_maximumSize = a3;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHorizontalCenteringWidth:(double)a3
{
}

- (UIImage)highlightedImage
{
  return self->_highlightedImage;
}

- (void)setHighlightedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end