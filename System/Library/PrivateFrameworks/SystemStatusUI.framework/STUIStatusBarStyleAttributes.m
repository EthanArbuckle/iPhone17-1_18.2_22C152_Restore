@interface STUIStatusBarStyleAttributes
+ (BOOL)supportsSecureCoding;
+ (id)overriddenStyleAttributes;
+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRounded;
- (BOOL)isScaledFixedWidthBar;
- (NSArray)imageNamePrefixes;
- (NSString)debugDescription;
- (NSString)description;
- (STUIStatusBarStyleAttributes)initWithCoder:(id)a3;
- (STUIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3;
- (UIColor)imageDimmedTintColor;
- (UIColor)imageTintColor;
- (UIColor)textColor;
- (UIFont)emphasizedFont;
- (UIFont)font;
- (UIFont)smallFont;
- (UITraitCollection)traitCollection;
- (double)iconScale;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fontForStyle:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)effectiveLayoutDirection;
- (int64_t)iconSize;
- (int64_t)mode;
- (int64_t)style;
- (int64_t)symbolScale;
- (unint64_t)hash;
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

@implementation STUIStatusBarStyleAttributes

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) style];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) traitCollection];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mode];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) font];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) isScaledFixedWidthBar];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) symbolScale];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) iconSize];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) iconScale];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageNamePrefixes];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageDimmedTintColor];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageTintColor];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) smallFont];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) emphasizedFont];
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) effectiveLayoutDirection];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  int64_t v7 = [(STUIStatusBarStyleAttributes *)self style];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke;
  v80[3] = &unk_1E6AA4438;
  id v8 = v6;
  id v81 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v80];
  int64_t v10 = [(STUIStatusBarStyleAttributes *)self mode];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_2;
  v78[3] = &unk_1E6AA4438;
  id v11 = v8;
  id v79 = v11;
  id v12 = (id)[v5 appendInteger:v10 counterpart:v78];
  v13 = [(STUIStatusBarStyleAttributes *)self traitCollection];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_3;
  v76[3] = &unk_1E6AA3CF8;
  id v14 = v11;
  id v77 = v14;
  id v15 = (id)[v5 appendObject:v13 counterpart:v76];

  int64_t v16 = [(STUIStatusBarStyleAttributes *)self effectiveLayoutDirection];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_4;
  v74[3] = &unk_1E6AA4438;
  id v17 = v14;
  id v75 = v17;
  id v18 = (id)[v5 appendInteger:v16 counterpart:v74];
  [(STUIStatusBarStyleAttributes *)self iconScale];
  double v20 = v19;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_5;
  v72[3] = &unk_1E6AA39A0;
  id v21 = v17;
  id v73 = v21;
  id v22 = (id)[v5 appendCGFloat:v72 counterpart:v20];
  int64_t v23 = [(STUIStatusBarStyleAttributes *)self iconSize];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_6;
  v70[3] = &unk_1E6AA4438;
  id v24 = v21;
  id v71 = v24;
  id v25 = (id)[v5 appendInteger:v23 counterpart:v70];
  int64_t v26 = [(STUIStatusBarStyleAttributes *)self symbolScale];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_7;
  v68[3] = &unk_1E6AA4438;
  id v27 = v24;
  id v69 = v27;
  id v28 = (id)[v5 appendInteger:v26 counterpart:v68];
  BOOL v29 = [(STUIStatusBarStyleAttributes *)self isScaledFixedWidthBar];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_8;
  v66[3] = &unk_1E6AA39C8;
  id v30 = v27;
  id v67 = v30;
  id v31 = (id)[v5 appendBool:v29 counterpart:v66];
  v32 = [(STUIStatusBarStyleAttributes *)self font];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_9;
  v64[3] = &unk_1E6AA3CF8;
  id v33 = v30;
  id v65 = v33;
  id v34 = (id)[v5 appendObject:v32 counterpart:v64];

  v35 = [(STUIStatusBarStyleAttributes *)self emphasizedFont];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_10;
  v62[3] = &unk_1E6AA3CF8;
  id v36 = v33;
  id v63 = v36;
  id v37 = (id)[v5 appendObject:v35 counterpart:v62];

  v38 = [(STUIStatusBarStyleAttributes *)self smallFont];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_11;
  v60[3] = &unk_1E6AA3CF8;
  id v39 = v36;
  id v61 = v39;
  id v40 = (id)[v5 appendObject:v38 counterpart:v60];

  v41 = [(STUIStatusBarStyleAttributes *)self imageTintColor];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_12;
  v58[3] = &unk_1E6AA3CF8;
  id v42 = v39;
  id v59 = v42;
  id v43 = (id)[v5 appendObject:v41 counterpart:v58];

  v44 = [(STUIStatusBarStyleAttributes *)self imageDimmedTintColor];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_13;
  v56[3] = &unk_1E6AA3CF8;
  id v45 = v42;
  id v57 = v45;
  id v46 = (id)[v5 appendObject:v44 counterpart:v56];

  v47 = [(STUIStatusBarStyleAttributes *)self imageNamePrefixes];
  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  v53 = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_14;
  v54 = &unk_1E6AA3CF8;
  id v55 = v45;
  id v48 = v45;
  id v49 = (id)[v5 appendObject:v47 counterpart:&v51];

  LOBYTE(v45) = objc_msgSend(v5, "isEqual", v51, v52, v53, v54);
  return (char)v45;
}

- (STUIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3
{
  id v4 = (STUIStatusBarStyleAttributes *)a3;
  v5 = v4;
  if (!v4 || v4 == self)
  {
    id v6 = self;
  }
  else
  {
    id v6 = (STUIStatusBarStyleAttributes *)[(STUIStatusBarStyleAttributes *)self copy];
    [(STUIStatusBarStyleAttributes *)v5 iconScale];
    if (v7 > 0.0)
    {
      [(STUIStatusBarStyleAttributes *)v5 iconScale];
      -[STUIStatusBarStyleAttributes setIconScale:](v6, "setIconScale:");
    }
    if ([(STUIStatusBarStyleAttributes *)v5 iconSize]) {
      [(STUIStatusBarStyleAttributes *)v6 setIconSize:[(STUIStatusBarStyleAttributes *)v5 iconSize]];
    }
    if ([(STUIStatusBarStyleAttributes *)v5 symbolScale]) {
      [(STUIStatusBarStyleAttributes *)v6 setSymbolScale:[(STUIStatusBarStyleAttributes *)v5 symbolScale]];
    }
    id v8 = [(STUIStatusBarStyleAttributes *)v5 font];

    if (v8)
    {
      id v9 = [(STUIStatusBarStyleAttributes *)v5 font];
      [(STUIStatusBarStyleAttributes *)v6 setFont:v9];
    }
    int64_t v10 = [(STUIStatusBarStyleAttributes *)v5 emphasizedFont];

    if (v10)
    {
      id v11 = [(STUIStatusBarStyleAttributes *)v5 emphasizedFont];
      [(STUIStatusBarStyleAttributes *)v6 setEmphasizedFont:v11];
    }
    id v12 = [(STUIStatusBarStyleAttributes *)v5 smallFont];

    if (v12)
    {
      v13 = [(STUIStatusBarStyleAttributes *)v5 smallFont];
      [(STUIStatusBarStyleAttributes *)v6 setSmallFont:v13];
    }
    id v14 = [(STUIStatusBarStyleAttributes *)v5 textColor];

    if (v14)
    {
      id v15 = [(STUIStatusBarStyleAttributes *)v5 textColor];
      [(STUIStatusBarStyleAttributes *)v6 setTextColor:v15];
    }
    int64_t v16 = [(STUIStatusBarStyleAttributes *)v5 imageTintColor];

    if (v16)
    {
      id v17 = [(STUIStatusBarStyleAttributes *)v5 imageTintColor];
      [(STUIStatusBarStyleAttributes *)v6 setImageTintColor:v17];
    }
    id v18 = [(STUIStatusBarStyleAttributes *)v5 imageDimmedTintColor];

    if (v18)
    {
      double v19 = [(STUIStatusBarStyleAttributes *)v5 imageDimmedTintColor];
      [(STUIStatusBarStyleAttributes *)v6 setImageDimmedTintColor:v19];
    }
    double v20 = [(STUIStatusBarStyleAttributes *)v5 imageNamePrefixes];

    if (v20)
    {
      id v21 = [(STUIStatusBarStyleAttributes *)v5 imageNamePrefixes];
      [(STUIStatusBarStyleAttributes *)v6 setImageNamePrefixes:v21];
    }
  }

  return v6;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIFont)font
{
  return self->_font;
}

- (NSArray)imageNamePrefixes
{
  return self->_imageNamePrefixes;
}

- (UIFont)smallFont
{
  return self->_smallFont;
}

- (UIColor)imageDimmedTintColor
{
  return self->_imageDimmedTintColor;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (UIFont)emphasizedFont
{
  return self->_emphasizedFont;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (UIColor)textColor
{
  return self->_textColor;
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

- (void)setFont:(id)a3
{
}

- (void)setImageNamePrefixes:(id)a3
{
}

- (void)setSmallFont:(id)a3
{
}

- (void)setEmphasizedFont:(id)a3
{
}

- (void)setImageDimmedTintColor:(id)a3
{
}

- (void)setTextColor:(id)a3
{
}

- (void)setImageTintColor:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isScaledFixedWidthBar
{
  return self->_scaledFixedWidthBar;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (int64_t)effectiveLayoutDirection
{
  return self->_effectiveLayoutDirection;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  *((void *)v7 + 2) = a4;
  *((void *)v7 + 3) = [v6 mode];
  *((void *)v7 + 5) = [v6 effectiveUserInterfaceLayoutDirection];
  *((void *)v7 + 6) = 0x3FF0000000000000;
  *((void *)v7 + 7) = 0;
  id v8 = [v6 traitCollection];
  [v8 displayScale];
  if (v9 == 0.0)
  {
    int64_t v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v12 = v11;
    v13 = self;
    uint64_t v14 = [v8 traitCollectionByReplacingCGFloatValue:v13 forTrait:v12];

    id v8 = (void *)v14;
  }
  objc_storeStrong((id *)v7 + 4, v8);
  [v8 displayScale];
  double v16 = v15;
  id v17 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];
  if (v18 == 1)
  {
    uint64_t v19 = 14;
  }
  else if (v18 == 3)
  {
    uint64_t v19 = 16;
    if (v16 > 2.5) {
      uint64_t v19 = 17;
    }
  }
  else if (v16 <= 2.5)
  {
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 2;
  }
  *((void *)v7 + 8) = v19;

  double v20 = [v6 foregroundColor];

  if (v20)
  {
    uint64_t v21 = [v6 foregroundColor];
    id v22 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = v21;

    uint64_t v23 = [v6 foregroundColor];
    id v24 = (void *)*((void *)v7 + 13);
    *((void *)v7 + 13) = v23;
  }
  return v7;
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

+ (id)overriddenStyleAttributes
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)fontForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(STUIStatusBarStyleAttributes *)self smallFont];
  }
  else if (a3 == 1)
  {
    v3 = [(STUIStatusBarStyleAttributes *)self emphasizedFont];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    v3 = [(STUIStatusBarStyleAttributes *)self font];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (BOOL)isRounded
{
  id v2 = [(STUIStatusBarStyleAttributes *)self font];
  UIFontDesign = (void *)CTFontGetUIFontDesign();

  LOBYTE(v2) = [UIFontDesign isEqualToString:*MEMORY[0x1E4F24650]];
  return (char)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUIStatusBarStyleAttributes)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarStyleAttributes;
  id v3 = a3;
  id v4 = [(STUIStatusBarStyleAttributes *)&v16 init];
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
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
  [(STUIStatusBarStyleAttributes *)v4 setFont:v8];

  double v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"emphasizedFont"];
  [(STUIStatusBarStyleAttributes *)v4 setEmphasizedFont:v9];

  int64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"smallFont"];
  [(STUIStatusBarStyleAttributes *)v4 setSmallFont:v10];

  double v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
  [(STUIStatusBarStyleAttributes *)v4 setTextColor:v11];

  double v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageTintColor"];
  [(STUIStatusBarStyleAttributes *)v4 setImageTintColor:v12];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageDimmedTintColor"];
  [(STUIStatusBarStyleAttributes *)v4 setImageDimmedTintColor:v13];

  uint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageNamePrefixes"];

  [(STUIStatusBarStyleAttributes *)v4 setImageNamePrefixes:v14];
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

- (unint64_t)hash
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes style](self, "style"));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes mode](self, "mode"));
  id v6 = [(STUIStatusBarStyleAttributes *)self traitCollection];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes effectiveLayoutDirection](self, "effectiveLayoutDirection"));
  [(STUIStatusBarStyleAttributes *)self iconScale];
  id v9 = (id)objc_msgSend(v3, "appendCGFloat:");
  id v10 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes iconSize](self, "iconSize"));
  id v11 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes symbolScale](self, "symbolScale"));
  id v12 = (id)objc_msgSend(v3, "appendBool:", -[STUIStatusBarStyleAttributes isScaledFixedWidthBar](self, "isScaledFixedWidthBar"));
  v13 = [(STUIStatusBarStyleAttributes *)self font];
  id v14 = (id)[v3 appendObject:v13];

  double v15 = [(STUIStatusBarStyleAttributes *)self emphasizedFont];
  id v16 = (id)[v3 appendObject:v15];

  id v17 = [(STUIStatusBarStyleAttributes *)self smallFont];
  id v18 = (id)[v3 appendObject:v17];

  uint64_t v19 = [(STUIStatusBarStyleAttributes *)self imageTintColor];
  id v20 = (id)[v3 appendObject:v19];

  uint64_t v21 = [(STUIStatusBarStyleAttributes *)self imageDimmedTintColor];
  id v22 = (id)[v3 appendObject:v21];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = [(STUIStatusBarStyleAttributes *)self imageNamePrefixes];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = (id)[v3 appendString:*(void *)(*((void *)&v31 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v25);
  }

  unint64_t v29 = [v3 hash];
  return v29;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarStyleAttributes *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarStyleAttributes *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STUIStatusBarStyleAttributes *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarStyleAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarStyleAttributes *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarStyleAttributes *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STUIStatusBarStyleAttributes *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__STUIStatusBarStyleAttributes__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  id v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __80__STUIStatusBarStyleAttributes__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = _UIStatusBarResolvedStyleDescription([*(id *)(a1 + 40) style]);
  [v2 appendString:v3 withName:@"style"];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = STUIStatusBarModeDescription([*(id *)(a1 + 40) mode]);
  [v4 appendString:v5 withName:@"mode"];

  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "effectiveLayoutDirection") == 1, @"isRTL");
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", @"iconSize", 1, (double)objc_msgSend(*(id *)(a1 + 40), "iconSize"));
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "symbolScale"), @"symbolScale");
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) traitCollection];
  id v11 = (id)[v9 appendObject:v10 withName:@"traitCollection"];

  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) font];
  id v14 = (id)[v12 appendObject:v13 withName:@"font" skipIfNil:1];

  double v15 = *(void **)(a1 + 32);
  id v16 = [*(id *)(a1 + 40) emphasizedFont];
  id v17 = (id)[v15 appendObject:v16 withName:@"emphasizedFont" skipIfNil:1];

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(a1 + 40) smallFont];
  id v20 = (id)[v18 appendObject:v19 withName:@"smallFont" skipIfNil:1];

  uint64_t v21 = *(void **)(a1 + 32);
  id v22 = [*(id *)(a1 + 40) textColor];
  id v23 = (id)[v21 appendObject:v22 withName:@"textColor" skipIfNil:1];

  uint64_t v24 = *(void **)(a1 + 32);
  uint64_t v25 = [*(id *)(a1 + 40) imageTintColor];
  id v26 = (id)[v24 appendObject:v25 withName:@"imageTintColor" skipIfNil:1];

  uint64_t v27 = *(void **)(a1 + 32);
  id v28 = [*(id *)(a1 + 40) imageDimmedTintColor];
  id v29 = (id)[v27 appendObject:v28 withName:@"imageDimmedTintColor" skipIfNil:1];

  id v30 = *(void **)(a1 + 32);
  id v32 = [*(id *)(a1 + 40) imageNamePrefixes];
  long long v31 = [v32 componentsJoinedByString:@", "];
  [v30 appendString:v31 withName:@"imageNamePrefixes" skipIfEmpty:1];
}

- (void)setTraitCollection:(id)a3
{
}

- (void)setScaledFixedWidthBar:(BOOL)a3
{
  self->_scaledFixedWidthBar = a3;
}

@end