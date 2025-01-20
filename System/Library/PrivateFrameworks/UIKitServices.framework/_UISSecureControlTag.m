@interface _UISSecureControlTag
+ (BOOL)supportsSecureCoding;
+ (unint64_t)cacheLimit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGColor)baseBackgroundColor;
- (CGColor)baseForegroundColor;
- (CGSize)size;
- (_UISSecureControlCategory)category;
- (_UISSecureControlTag)initWithCategory:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 baseForegroundColor:(CGColor *)a6 baseBackgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 size:(CGSize)a9;
- (_UISSecureControlTag)initWithCoder:(id)a3;
- (double)cornerRadius;
- (id)resolvedStyleForStyle:(id)a3;
- (int64_t)cornerStyle;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)failGradeForStyle:(id)a3;
- (unint64_t)hash;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3;
- (unint64_t)imagePlacement;
- (unsigned)secureNameForStyle:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISSecureControlTag

+ (unint64_t)cacheLimit
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISSecureControlTag)initWithCategory:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 baseForegroundColor:(CGColor *)a6 baseBackgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 size:(CGSize)a9
{
  CGFloat height = a9.height;
  CGFloat width = a9.width;
  id v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UISSecureControlTag;
  v19 = [(_UISSecureControlTag *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_category, a3);
    v20->_cornerRadius = a5;
    v20->_cornerStyle = a4;
    v20->_baseForegroundColor = CGColorRetain(a6);
    v20->_baseBackgroundColor = CGColorRetain(a7);
    v20->_imagePlacement = a8;
    v20->_size.CGFloat width = width;
    v20->_size.CGFloat height = height;
  }

  return v20;
}

- (_UISSecureControlTag)initWithCoder:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UISSecureControlTag;
  v5 = [(_UISSecureControlTag *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (_UISSecureControlCategory *)v6;

    [v4 decodeFloatForKey:@"cornerRadius"];
    v5->_cornerRadius = v8;
    v5->_cornerStyle = [v4 decodeIntegerForKey:@"cornerStyle"];
    v5->_imagePlacement = [v4 decodeIntegerForKey:@"imagePlacement"];
    [v4 decodeSizeForKey:@"size"];
    v5->_size.CGFloat width = v9;
    v5->_size.CGFloat height = v10;
    v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
    if ([v4 containsValueForKey:@"foregroundColorRed"])
    {
      [v4 decodeDoubleForKey:@"foregroundColorRed"];
      components[0] = v12;
      [v4 decodeDoubleForKey:@"foregroundColorGreen"];
      components[1] = v13;
      [v4 decodeDoubleForKey:@"foregroundColorBlue"];
      components[2] = v14;
      [v4 decodeDoubleForKey:@"foregroundColorAlpha"];
      components[3] = v15;
      v5->_baseForegroundColor = CGColorCreate(v11, components);
    }
    if ([v4 containsValueForKey:@"backgroundColorRed"])
    {
      [v4 decodeDoubleForKey:@"backgroundColorRed"];
      v22[0] = v16;
      [v4 decodeDoubleForKey:@"backgroundColorGreen"];
      v22[1] = v17;
      [v4 decodeDoubleForKey:@"backgroundColorBlue"];
      v22[2] = v18;
      [v4 decodeDoubleForKey:@"backgroundColorAlpha"];
      v22[3] = v19;
      v5->_baseBackgroundColor = CGColorCreate(v11, v22);
    }
    CGColorSpaceRelease(v11);
  }

  return v5;
}

- (void)dealloc
{
  CGColorRelease(self->_baseForegroundColor);
  CGColorRelease(self->_baseBackgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISSecureControlTag;
  [(_UISSecureControlTag *)&v3 dealloc];
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return [(_UISSecureControlCategory *)self->_category authenticationMessageContextForStyle:a3];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_category forKey:@"category"];
  double cornerRadius = self->_cornerRadius;
  *(float *)&double cornerRadius = cornerRadius;
  [v4 encodeFloat:@"cornerRadius" forKey:cornerRadius];
  [v4 encodeInteger:self->_cornerStyle forKey:@"cornerStyle"];
  [v4 encodeInteger:self->_imagePlacement forKey:@"imagePlacement"];
  objc_msgSend(v4, "encodeSize:forKey:", @"size", self->_size.width, self->_size.height);
  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor)
  {
    UISGetColorSRGBComponents(baseForegroundColor, (uint64_t)&v8);
    [v4 encodeDouble:@"foregroundColorRed" forKey:v8];
    [v4 encodeDouble:@"foregroundColorGreen" forKey:v9];
    [v4 encodeDouble:@"foregroundColorBlue" forKey:v10];
    [v4 encodeDouble:@"foregroundColorAlpha" forKey:v11];
  }
  baseBackgroundColor = self->_baseBackgroundColor;
  if (baseBackgroundColor)
  {
    UISGetColorSRGBComponents(baseBackgroundColor, (uint64_t)&v8);
    [v4 encodeDouble:@"backgroundColorRed" forKey:v8];
    [v4 encodeDouble:@"backgroundColorGreen" forKey:v9];
    [v4 encodeDouble:@"backgroundColorBlue" forKey:v10];
    [v4 encodeDouble:@"backgroundColorAlpha" forKey:v11];
  }
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && ((category = self->_category, category == *((_UISSecureControlCategory **)v4 + 1))
     || -[_UISSecureControlCategory isEqual:](category, "isEqual:"))
    && self->_cornerRadius == *((double *)v4 + 2)
    && self->_cornerStyle == *((void *)v4 + 3)
    && self->_imagePlacement == *((void *)v4 + 6)
    && (self->_size.width == *((double *)v4 + 7) ? (BOOL v6 = self->_size.height == *((double *)v4 + 8)) : (BOOL v6 = 0),
        v6 && CGColorEqualToColor(self->_baseForegroundColor, *((CGColorRef *)v4 + 4)))
    && CGColorEqualToColor(self->_baseBackgroundColor, *((CGColorRef *)v4 + 5));

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = +[_UISSecureControlTag hash];
  unint64_t v4 = [(_UISSecureControlCategory *)self->_category hash];
  double cornerRadius = self->_cornerRadius;
  int64_t cornerStyle = self->_cornerStyle;
  unint64_t imagePlacement = self->_imagePlacement;
  double width = self->_size.width;
  double height = self->_size.height;
  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor) {
    CFHashCode v11 = CFHash(baseForegroundColor);
  }
  else {
    CFHashCode v11 = 0;
  }
  CFHashCode baseBackgroundColor = (CFHashCode)self->_baseBackgroundColor;
  if (baseBackgroundColor) {
    CFHashCode baseBackgroundColor = CFHash((CFTypeRef)baseBackgroundColor);
  }
  return v4 ^ v3 ^ cornerStyle ^ imagePlacement ^ (unint64_t)cornerRadius ^ (unint64_t)width ^ (unint64_t)height ^ v11 ^ baseBackgroundColor;
}

- (BOOL)isValid
{
  int v3 = [(_UISSecureControlCategory *)self->_category isValid];
  if (v3)
  {
    if (self->_cornerRadius < 0.0
      || (unint64_t)(self->_cornerStyle + 1) > 5
      || ((imagePlacement = self->_imagePlacement, v5 = imagePlacement > 8, uint64_t v6 = (1 << imagePlacement) & 0x116, !v5)
        ? (BOOL v7 = v6 == 0)
        : (BOOL v7 = 1),
          v7 || self->_size.width <= 0.0 || self->_size.height <= 0.0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      baseForegroundColor = self->_baseForegroundColor;
      if (!baseForegroundColor || (int v3 = UISIsColorInDisplayP3Gamut(baseForegroundColor)) != 0)
      {
        CFHashCode baseBackgroundColor = self->_baseBackgroundColor;
        if (baseBackgroundColor)
        {
          LOBYTE(v3) = UISIsColorInDisplayP3Gamut(baseBackgroundColor);
        }
        else
        {
          LOBYTE(v3) = 1;
        }
      }
    }
  }
  return v3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  int v3 = (void *)[a3 copyWithChangeBlock:&__block_literal_global_0];
  return v3;
}

- (unsigned)secureNameForStyle:(id)a3
{
  return [(_UISSecureControlCategory *)self->_category secureName];
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 54;
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (CGColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (CGColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end