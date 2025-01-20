@interface _UIStatusBarStyleAttributes
+ (BOOL)supportsSecureCoding;
+ (id)overriddenStyleAttributes;
+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRounded;
- (BOOL)isScaledFixedWidthBar;
- (NSArray)imageNamePrefixes;
- (UIColor)imageDimmedTintColor;
- (UIColor)imageTintColor;
- (UIColor)textColor;
- (UIFont)emphasizedFont;
- (UIFont)font;
- (UIFont)smallFont;
- (UITraitCollection)traitCollection;
- (_UIStatusBarStyleAttributes)initWithCoder:(id)a3;
- (_UIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3;
- (double)iconScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fontForStyle:(int64_t)a3;
- (int64_t)effectiveLayoutDirection;
- (int64_t)iconSize;
- (int64_t)mode;
- (int64_t)style;
- (int64_t)symbolScale;
- (void)encodeWithCoder:(id)a3;
- (void)setEmphasizedFont:(id)a3;
- (void)setFont:(id)a3;
- (void)setIconScale:(double)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setImageDimmedTintColor:(id)a3;
- (void)setImageNamePrefixes:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setScaledFixedWidthBar:(BOOL)a3;
- (void)setSmallFont:(id)a3;
- (void)setSymbolScale:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation _UIStatusBarStyleAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v4 + 2) = self->_style;
  *((void *)v4 + 3) = self->_mode;
  objc_storeStrong((id *)v4 + 4, self->_traitCollection);
  *((void *)v4 + 5) = self->_effectiveLayoutDirection;
  *((void *)v4 + 6) = *(void *)&self->_iconScale;
  *((void *)v4 + 8) = self->_iconSize;
  *((void *)v4 + 7) = self->_symbolScale;
  *((unsigned char *)v4 + 8) = self->_scaledFixedWidthBar;
  [v4 setFont:self->_font];
  [v4 setEmphasizedFont:self->_emphasizedFont];
  [v4 setSmallFont:self->_smallFont];
  [v4 setTextColor:self->_textColor];
  [v4 setImageTintColor:self->_imageTintColor];
  [v4 setImageDimmedTintColor:self->_imageDimmedTintColor];
  v5 = (void *)[(NSArray *)self->_imageNamePrefixes copy];
  [v4 setImageNamePrefixes:v5];

  return v4;
}

- (_UIStatusBarStyleAttributes)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarStyleAttributes;
  id v3 = a3;
  id v4 = [(_UIStatusBarStyleAttributes *)&v16 init];
  v4->_style = objc_msgSend(v3, "decodeIntegerForKey:", @"style", v16.receiver, v16.super_class);
  v4->_mode = [v3 decodeIntegerForKey:@"mode"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"traitCollection"];
  traitCollection = v4->_traitCollection;
  v4->_traitCollection = (UITraitCollection *)v5;

  v4->_effectiveLayoutDirection = [v3 decodeIntegerForKey:@"effectiveLayoutDirection"];
  [v3 decodeDoubleForKey:@"iconScale"];
  v4->_iconScale = v7;
  v4->_iconSize = [v3 decodeIntegerForKey:@"iconSize"];
  v4->_symbolScale = [v3 decodeIntegerForKey:@"symbolScale"];
  v4->_scaledFixedWidthBar = [v3 decodeBoolForKey:@"scaledFixedWidthBar"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
  [(_UIStatusBarStyleAttributes *)v4 setFont:v8];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"emphasizedFont"];
  [(_UIStatusBarStyleAttributes *)v4 setEmphasizedFont:v9];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"smallFont"];
  [(_UIStatusBarStyleAttributes *)v4 setSmallFont:v10];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
  [(_UIStatusBarStyleAttributes *)v4 setTextColor:v11];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageTintColor"];
  [(_UIStatusBarStyleAttributes *)v4 setImageTintColor:v12];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageDimmedTintColor"];
  [(_UIStatusBarStyleAttributes *)v4 setImageDimmedTintColor:v13];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageNamePrefixes"];

  [(_UIStatusBarStyleAttributes *)v4 setImageNamePrefixes:v14];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"style"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeObject:self->_traitCollection forKey:@"traitCollection"];
  [v5 encodeInteger:self->_effectiveLayoutDirection forKey:@"effectiveLayoutDirection"];
  [v5 encodeDouble:@"iconScale" forKey:self->_iconScale];
  [v5 encodeInteger:self->_iconSize forKey:@"iconSize"];
  [v5 encodeInteger:self->_symbolScale forKey:@"symbolScale"];
  [v5 encodeBool:self->_scaledFixedWidthBar forKey:@"scaledFixedWidthBar"];
  [v5 encodeObject:self->_font forKey:@"font"];
  [v5 encodeObject:self->_emphasizedFont forKey:@"emphasizedFont"];
  [v5 encodeObject:self->_smallFont forKey:@"smallFont"];
  [v5 encodeObject:self->_textColor forKey:@"textColor"];
  [v5 encodeObject:self->_imageTintColor forKey:@"imageTintColor"];
  [v5 encodeObject:self->_imageDimmedTintColor forKey:@"imageDimmedTintColor"];
  [v5 encodeObject:self->_imageNamePrefixes forKey:@"imageNamePrefixes"];
}

+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  if (a4)
  {
    if (a4 != 4) {
      goto LABEL_3;
    }
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = v27;
    v29 = @"The status bar style should never be set to .inherited, it should only be used to notify about using the main style in setStyle:forPartWithIdentifier:";
    SEL v30 = a2;
    id v31 = a1;
    uint64_t v32 = 96;
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = v27;
    v29 = @"The default style should have been resolved to .lightContent or .darkContent already";
    SEL v30 = a2;
    id v31 = a1;
    uint64_t v32 = 95;
  }
  [v27 handleFailureInMethod:v30 object:v31 file:@"_UIStatusBarStyleAttributes.m" lineNumber:v32 description:v29];

LABEL_3:
  id v8 = objc_alloc_init((Class)a1);
  *((void *)v8 + 2) = a4;
  *((void *)v8 + 3) = [v7 mode];
  *((void *)v8 + 5) = [v7 effectiveUserInterfaceLayoutDirection];
  *((void *)v8 + 6) = 0x3FF0000000000000;
  *((void *)v8 + 7) = 0;
  v9 = [v7 traitCollection];
  [v9 displayScale];
  if (v10 == 0.0)
  {
    v11 = +[UIScreen mainScreen];
    [v11 scale];
    double v13 = v12;
    v14 = self;
    uint64_t v15 = [v9 traitCollectionByReplacingCGFloatValue:v14 forTrait:v13];

    v9 = (void *)v15;
  }
  objc_storeStrong((id *)v8 + 4, v9);
  [v9 displayScale];
  double v17 = v16;
  uint64_t v18 = _UIDeviceNativeUserInterfaceIdiom();
  if (v18 == 1)
  {
    uint64_t v20 = 14;
  }
  else
  {
    double v19 = 2.5;
    if (v18 == 3)
    {
      uint64_t v20 = 16;
      if (v17 > 2.5) {
        uint64_t v20 = 17;
      }
    }
    else if (v17 <= 2.5)
    {
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v20 = 2;
    }
  }
  *((void *)v8 + 8) = v20;
  v21 = objc_msgSend(v7, "foregroundColor", v19);

  if (v21)
  {
    uint64_t v22 = [v7 foregroundColor];
    v23 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v22;

    uint64_t v24 = [v7 foregroundColor];
    v25 = (void *)*((void *)v8 + 13);
    *((void *)v8 + 13) = v24;
  }
  return v8;
}

+ (id)overriddenStyleAttributes
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    int64_t style = self->_style;
    if (style != [v7 style] || (int64_t mode = self->_mode, mode != objc_msgSend(v7, "mode")))
    {
      char v6 = 0;
LABEL_29:

      goto LABEL_30;
    }
    traitCollection = self->_traitCollection;
    v11 = [v7 traitCollection];
    double v12 = traitCollection;
    double v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {
    }
    else
    {
      char v6 = 0;
      if (!v12 || !v13)
      {
        uint64_t v24 = v13;
        goto LABEL_26;
      }
      BOOL v15 = [(UITraitCollection *)v12 isEqual:v13];

      if (!v15)
      {
LABEL_24:
        char v6 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    int64_t effectiveLayoutDirection = self->_effectiveLayoutDirection;
    if (effectiveLayoutDirection != [v7 effectiveLayoutDirection]) {
      goto LABEL_24;
    }
    double iconScale = self->_iconScale;
    [v7 iconScale];
    if (iconScale != v18) {
      goto LABEL_24;
    }
    int64_t iconSize = self->_iconSize;
    if (iconSize != [v7 iconSize]) {
      goto LABEL_24;
    }
    int64_t symbolScale = self->_symbolScale;
    if (symbolScale != [v7 symbolScale]) {
      goto LABEL_24;
    }
    int scaledFixedWidthBar = self->_scaledFixedWidthBar;
    if (scaledFixedWidthBar != [v7 isScaledFixedWidthBar]) {
      goto LABEL_24;
    }
    font = self->_font;
    double v12 = [v7 font];
    if (!UIEqual(font, v12))
    {
      char v6 = 0;
      goto LABEL_27;
    }
    emphasizedFont = self->_emphasizedFont;
    uint64_t v24 = [v7 emphasizedFont];
    if (UIEqual(emphasizedFont, v24))
    {
      smallFont = self->_smallFont;
      v26 = [v7 smallFont];
      if (UIEqual(smallFont, v26))
      {
        textColor = self->_textColor;
        v28 = [v7 textColor];
        if (UIEqual(textColor, v28))
        {
          imageTintColor = self->_imageTintColor;
          SEL v30 = [v7 imageTintColor];
          if (UIEqual(imageTintColor, v30))
          {
            imageDimmedTintColor = self->_imageDimmedTintColor;
            v35 = [v7 imageDimmedTintColor];
            if (UIEqual(imageDimmedTintColor, v35))
            {
              imageNamePrefixes = self->_imageNamePrefixes;
              v33 = [v7 imageNamePrefixes];
              char v6 = UIEqual(imageNamePrefixes, v33);
            }
            else
            {
              char v6 = 0;
            }
          }
          else
          {
            char v6 = 0;
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  char v6 = 0;
LABEL_30:

  return v6;
}

- (id)description
{
  v20[14] = *MEMORY[0x1E4F143B8];
  double v19 = NSStringFromSelector(sel_style);
  v20[0] = v19;
  double v18 = NSStringFromSelector(sel_mode);
  v20[1] = v18;
  double v17 = NSStringFromSelector(sel_traitCollection);
  v20[2] = v17;
  double v16 = NSStringFromSelector(sel_effectiveLayoutDirection);
  v20[3] = v16;
  BOOL v15 = NSStringFromSelector(sel_iconScale);
  v20[4] = v15;
  v14 = NSStringFromSelector(sel_iconSize);
  v20[5] = v14;
  id v3 = NSStringFromSelector(sel_symbolScale);
  v20[6] = v3;
  id v4 = NSStringFromSelector(sel_font);
  v20[7] = v4;
  uint64_t v5 = NSStringFromSelector(sel_emphasizedFont);
  v20[8] = v5;
  char v6 = NSStringFromSelector(sel_smallFont);
  v20[9] = v6;
  id v7 = NSStringFromSelector(sel_textColor);
  v20[10] = v7;
  id v8 = NSStringFromSelector(sel_imageTintColor);
  v20[11] = v8;
  v9 = NSStringFromSelector(sel_imageDimmedTintColor);
  v20[12] = v9;
  double v10 = NSStringFromSelector(sel_imageNamePrefixes);
  v20[13] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:14];
  double v12 = +[UIDescriptionBuilder descriptionForObject:self keys:v11];

  return v12;
}

- (_UIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3
{
  id v4 = (_UIStatusBarStyleAttributes *)a3;
  uint64_t v5 = v4;
  if (!v4 || v4 == self)
  {
    char v6 = self;
  }
  else
  {
    char v6 = (_UIStatusBarStyleAttributes *)[(_UIStatusBarStyleAttributes *)self copy];
    [(_UIStatusBarStyleAttributes *)v5 iconScale];
    if (v7 > 0.0)
    {
      [(_UIStatusBarStyleAttributes *)v5 iconScale];
      -[_UIStatusBarStyleAttributes setIconScale:](v6, "setIconScale:");
    }
    if ([(_UIStatusBarStyleAttributes *)v5 iconSize]) {
      [(_UIStatusBarStyleAttributes *)v6 setIconSize:[(_UIStatusBarStyleAttributes *)v5 iconSize]];
    }
    if ([(_UIStatusBarStyleAttributes *)v5 symbolScale]) {
      [(_UIStatusBarStyleAttributes *)v6 setSymbolScale:[(_UIStatusBarStyleAttributes *)v5 symbolScale]];
    }
    id v8 = [(_UIStatusBarStyleAttributes *)v5 font];

    if (v8)
    {
      v9 = [(_UIStatusBarStyleAttributes *)v5 font];
      [(_UIStatusBarStyleAttributes *)v6 setFont:v9];
    }
    double v10 = [(_UIStatusBarStyleAttributes *)v5 emphasizedFont];

    if (v10)
    {
      v11 = [(_UIStatusBarStyleAttributes *)v5 emphasizedFont];
      [(_UIStatusBarStyleAttributes *)v6 setEmphasizedFont:v11];
    }
    double v12 = [(_UIStatusBarStyleAttributes *)v5 smallFont];

    if (v12)
    {
      double v13 = [(_UIStatusBarStyleAttributes *)v5 smallFont];
      [(_UIStatusBarStyleAttributes *)v6 setSmallFont:v13];
    }
    v14 = [(_UIStatusBarStyleAttributes *)v5 textColor];

    if (v14)
    {
      BOOL v15 = [(_UIStatusBarStyleAttributes *)v5 textColor];
      [(_UIStatusBarStyleAttributes *)v6 setTextColor:v15];
    }
    double v16 = [(_UIStatusBarStyleAttributes *)v5 imageTintColor];

    if (v16)
    {
      double v17 = [(_UIStatusBarStyleAttributes *)v5 imageTintColor];
      [(_UIStatusBarStyleAttributes *)v6 setImageTintColor:v17];
    }
    double v18 = [(_UIStatusBarStyleAttributes *)v5 imageDimmedTintColor];

    if (v18)
    {
      double v19 = [(_UIStatusBarStyleAttributes *)v5 imageDimmedTintColor];
      [(_UIStatusBarStyleAttributes *)v6 setImageDimmedTintColor:v19];
    }
    uint64_t v20 = [(_UIStatusBarStyleAttributes *)v5 imageNamePrefixes];

    if (v20)
    {
      v21 = [(_UIStatusBarStyleAttributes *)v5 imageNamePrefixes];
      [(_UIStatusBarStyleAttributes *)v6 setImageNamePrefixes:v21];
    }
  }

  return v6;
}

- (id)fontForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(_UIStatusBarStyleAttributes *)self smallFont];
  }
  else if (a3 == 1)
  {
    id v3 = [(_UIStatusBarStyleAttributes *)self emphasizedFont];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v3 = [(_UIStatusBarStyleAttributes *)self font];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (BOOL)isRounded
{
  id v2 = [(_UIStatusBarStyleAttributes *)self font];
  UIFontDesign = (void *)CTFontGetUIFontDesign();

  LOBYTE(v2) = [UIFontDesign isEqualToString:*MEMORY[0x1E4F24650]];
  return (char)v2;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (int64_t)effectiveLayoutDirection
{
  return self->_effectiveLayoutDirection;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_double iconScale = a3;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_int64_t symbolScale = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_int64_t iconSize = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIFont)emphasizedFont
{
  return self->_emphasizedFont;
}

- (void)setEmphasizedFont:(id)a3
{
}

- (UIFont)smallFont
{
  return self->_smallFont;
}

- (void)setSmallFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (UIColor)imageDimmedTintColor
{
  return self->_imageDimmedTintColor;
}

- (void)setImageDimmedTintColor:(id)a3
{
}

- (NSArray)imageNamePrefixes
{
  return self->_imageNamePrefixes;
}

- (void)setImageNamePrefixes:(id)a3
{
}

- (BOOL)isScaledFixedWidthBar
{
  return self->_scaledFixedWidthBar;
}

- (void)setScaledFixedWidthBar:(BOOL)a3
{
  self->_int scaledFixedWidthBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNamePrefixes, 0);
  objc_storeStrong((id *)&self->_imageDimmedTintColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_smallFont, 0);
  objc_storeStrong((id *)&self->_emphasizedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end