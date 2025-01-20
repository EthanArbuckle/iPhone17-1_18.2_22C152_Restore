@interface UISSlotStyle
+ (BOOL)supportsSecureCoding;
+ (id)slotStyleWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13;
- (BOOL)hasAccessibilityContentSizeCategory;
- (BOOL)isEqual:(id)a3;
- (CGColor)tintColor;
- (NSArray)assetAppearanceNames;
- (NSString)localization;
- (UISSlotStyle)initWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13;
- (UISSlotStyle)initWithCoder:(id)a3;
- (UISSlotStyle)initWithStyle:(id)a3;
- (__CFString)fontContentSizeCategory;
- (__CTFont)newFontForTextStyle:(__CFString *)a3 attributes:(__CFDictionary *)a4;
- (double)assetScaleFactor;
- (double)graphicsDisabledAlpha;
- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 glyphWeight:(int64_t)a5 glyphPointSize:(double)a6;
- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 textStyle:(__CFString *)a5;
- (id)copyWithChangeBlock:(id)a3;
- (int64_t)assetDeviceIdiom;
- (int64_t)assetLayoutDirection;
- (int64_t)fontLegibilityWeight;
- (unint64_t)accessibilityButtonShapes;
- (unint64_t)accessibilityContrast;
- (unint64_t)displayRange;
- (unint64_t)gradeWithOnlyFails:(unint64_t)a3 allowedLocalizations:(id)a4;
- (unint64_t)hash;
- (unint64_t)layoutDirection;
- (unint64_t)legibilityWeight;
- (unint64_t)preferredContentSizeCategory;
- (unint64_t)userInterfaceIdiom;
- (unint64_t)userInterfaceStyle;
- (unsigned)displayScale;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISSlotStyle

+ (id)slotStyleWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13
{
  uint64_t v15 = a6;
  id v19 = a9;
  v20 = [[UISSlotStyle alloc] initWithAccessibilityButtonShapes:a3 accessibilityContrast:a4 displayRange:a5 displayScale:v15 layoutDirection:a7 legibilityWeight:a8 localization:v19 preferredContentSizeCategory:a10 tintColor:a11 userInterfaceIdiom:a12 userInterfaceStyle:a13];

  return v20;
}

- (UISSlotStyle)initWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13
{
  char v13 = a8;
  char v14 = a7;
  char v16 = a5;
  char v17 = a4;
  char v18 = a3;
  id v20 = a9;
  v25.receiver = self;
  v25.super_class = (Class)UISSlotStyle;
  v21 = [(UISSlotStyle *)&v25 init];
  if (v21)
  {
    uint64_t v22 = [v20 copy];
    localization = v21->_localization;
    v21->_localization = (NSString *)v22;

    v21->_tintColor = CGColorRetain(a11);
    v21->_fields.all = v18 & 1 | (2 * (v17 & 1)) & 3 | (4 * (v16 & 3)) & 0xF | (16 * (a6 & 7)) & 0x7F | ((v14 & 1) << 7) | ((v13 & 1) << 8) & 0xE1FF | ((a10 & 0xF) << 9) | ((a12 & 7) << 13) | ((a13 & 1) << 16) | v21->_fields.all & 0xFFFE0000;
  }

  return v21;
}

- (UISSlotStyle)initWithStyle:(id)a3
{
  id v3 = a3;
  uint64_t v16 = [v3 accessibilityButtonShapes];
  uint64_t v15 = [v3 accessibilityContrast];
  uint64_t v4 = [v3 displayRange];
  uint64_t v5 = [v3 displayScale];
  uint64_t v6 = [v3 layoutDirection];
  uint64_t v7 = [v3 legibilityWeight];
  v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  uint64_t v10 = [v3 tintColor];
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  char v13 = [(UISSlotStyle *)self initWithAccessibilityButtonShapes:v16 accessibilityContrast:v15 displayRange:v4 displayScale:v5 layoutDirection:v6 legibilityWeight:v7 localization:v8 preferredContentSizeCategory:v9 tintColor:v10 userInterfaceIdiom:v11 userInterfaceStyle:v12];
  return v13;
}

- (UISSlotStyle)initWithCoder:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISSlotStyle;
  uint64_t v5 = [(UISSlotStyle *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localization"];
    localization = v5->_localization;
    v5->_localization = (NSString *)v6;

    v5->_fields.all = [v4 decodeIntegerForKey:@"fieldsAll"];
    v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
    [v4 decodeDoubleForKey:@"tintColorRed"];
    components[0] = v9;
    [v4 decodeDoubleForKey:@"tintColorGreen"];
    components[1] = v10;
    [v4 decodeDoubleForKey:@"tintColorBlue"];
    components[2] = v11;
    [v4 decodeDoubleForKey:@"tintColorAlpha"];
    components[3] = v12;
    v5->_tintColor = CGColorCreate(v8, components);
    CGColorSpaceRelease(v8);
  }

  return v5;
}

- (void)dealloc
{
  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)UISSlotStyle;
  [(UISSlotStyle *)&v3 dealloc];
}

- (unint64_t)accessibilityButtonShapes
{
  return self->_fields.all & 1;
}

- (unint64_t)accessibilityContrast
{
  return ((unint64_t)self->_fields.all >> 1) & 1;
}

- (unint64_t)displayRange
{
  return ((unint64_t)self->_fields.all >> 2) & 3;
}

- (unsigned)displayScale
{
  return (LOBYTE(self->_fields.all) >> 4) & 7;
}

- (unint64_t)layoutDirection
{
  return ((unint64_t)self->_fields.all >> 7) & 1;
}

- (unint64_t)legibilityWeight
{
  return ((unint64_t)self->_fields.all >> 8) & 1;
}

- (unint64_t)preferredContentSizeCategory
{
  return ((unint64_t)self->_fields.all >> 9) & 0xF;
}

- (unint64_t)userInterfaceIdiom
{
  return (unsigned __int16)self->_fields.all >> 13;
}

- (unint64_t)userInterfaceStyle
{
  return ((unint64_t)self->_fields.all >> 16) & 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6[4] = *(double *)MEMORY[0x1E4F143B8];
  localization = self->_localization;
  id v5 = a3;
  [v5 encodeObject:localization forKey:@"localization"];
  [v5 encodeInteger:self->_fields.all forKey:@"fieldsAll"];
  UISGetColorSRGBComponents(self->_tintColor, (uint64_t)v6);
  [v5 encodeDouble:@"tintColorRed" forKey:v6[0]];
  [v5 encodeDouble:@"tintColorGreen" forKey:v6[1]];
  [v5 encodeDouble:@"tintColorBlue" forKey:v6[2]];
  [v5 encodeDouble:@"tintColorAlpha" forKey:v6[3]];
}

- (unint64_t)hash
{
  uint64_t all = self->_fields.all;
  NSUInteger v4 = [(NSString *)self->_localization hash] ^ all;
  return v4 ^ CFHash(self->_tintColor);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_fields.all == *((_DWORD *)v4 + 6)
    && ((localization = self->_localization, localization == *((NSString **)v4 + 1))
     || -[NSString isEqual:](localization, "isEqual:"))
    && CGColorEqualToColor(self->_tintColor, *((CGColorRef *)v4 + 2));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localization
{
  return self->_localization;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

- (NSArray)assetAppearanceNames
{
  result = [(UISSlotStyle *)self accessibilityContrast];
  if (result != (NSArray *)1)
  {
    if (result) {
      return result;
    }
    unint64_t v4 = [(UISSlotStyle *)self userInterfaceStyle];
    if (!v4) {
      return (NSArray *)&unk_1EE295730;
    }
    if (v4 == 1) {
      return (NSArray *)&unk_1EE295748;
    }
  }
  if ([(UISSlotStyle *)self userInterfaceStyle]) {
    return (NSArray *)&unk_1EE295778;
  }
  else {
    return (NSArray *)&unk_1EE295760;
  }
}

- (int64_t)assetDeviceIdiom
{
  unint64_t v2 = [(UISSlotStyle *)self userInterfaceIdiom];
  if (v2 > 7) {
    return 7;
  }
  else {
    return qword_191AE26B0[v2];
  }
}

- (double)assetScaleFactor
{
  return (double)[(UISSlotStyle *)self displayScale];
}

- (int64_t)assetLayoutDirection
{
  if ([(UISSlotStyle *)self layoutDirection]) {
    return 4;
  }
  else {
    return 5;
  }
}

- (__CFString)fontContentSizeCategory
{
  result = [(UISSlotStyle *)self preferredContentSizeCategory];
  switch((unint64_t)result)
  {
    case 0uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24460];
      goto LABEL_14;
    case 1uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24450];
      goto LABEL_14;
    case 2uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24448];
      goto LABEL_14;
    case 3uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24440];
      goto LABEL_14;
    case 4uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24458];
      goto LABEL_14;
    case 5uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24468];
      goto LABEL_14;
    case 6uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24470];
      goto LABEL_14;
    case 7uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24420];
      goto LABEL_14;
    case 8uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24418];
      goto LABEL_14;
    case 9uLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24428];
      goto LABEL_14;
    case 0xAuLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24430];
      goto LABEL_14;
    case 0xBuLL:
      objc_super v3 = (__CFString **)MEMORY[0x1E4F24438];
LABEL_14:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)fontLegibilityWeight
{
  return [(UISSlotStyle *)self legibilityWeight] != 0;
}

- (double)graphicsDisabledAlpha
{
  return dbl_191AE26A0[[(UISSlotStyle *)self userInterfaceStyle] == 0];
}

- (BOOL)hasAccessibilityContentSizeCategory
{
  return [(UISSlotStyle *)self preferredContentSizeCategory] - 7 < 5;
}

- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 glyphWeight:(int64_t)a5 glyphPointSize:(double)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (_MergedGlobals_10 != -1) {
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_6);
  }
  unint64_t v11 = [(UISSlotStyle *)self legibilityWeight];
  int64_t v12 = 7;
  if (a5 < 7) {
    int64_t v12 = a5;
  }
  int64_t v13 = v12 + 2;
  long long v26 = 0u;
  long long v27 = 0u;
  if (v11 == 1) {
    int64_t v14 = v13;
  }
  else {
    int64_t v14 = a5;
  }
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  id obj = [(UISSlotStyle *)self assetAppearanceNames];
  uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v20 = (void *)qword_1EB288888;
        [(UISSlotStyle *)self assetScaleFactor];
        uint64_t v22 = objc_msgSend(v20, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v10, -[UISSlotStyle assetDeviceIdiom](self, "assetDeviceIdiom"), -[UISSlotStyle assetLayoutDirection](self, "assetLayoutDirection"), a4, v14, v19, v21, a6);
        if (v22)
        {
          v23 = (void *)v22;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  v23 = 0;
LABEL_18:

  return v23;
}

void __85__UISSlotStyle_Convenience__assetGlyphWithName_glyphSize_glyphWeight_glyphPointSize___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F5E048]);
  id v3 = [MEMORY[0x1E4F97AA8] public];
  uint64_t v1 = [v0 initWithName:@"Assets" fromBundle:v3 error:0];
  unint64_t v2 = (void *)qword_1EB288888;
  qword_1EB288888 = v1;
}

- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 textStyle:(__CFString *)a5
{
  id v7 = a3;
  [(UISSlotStyle *)self fontContentSizeCategory];
  CTFontDescriptorGetTextStyleSize();
  for (uint64_t i = 0; i != 9; ++i)
  {
    if (*(double *)(MEMORY[0x1E4F24478] + 8 * i) > NAN) {
      break;
    }
  }
  CGFloat v9 = -[UISSlotStyle assetGlyphWithName:glyphSize:glyphWeight:glyphPointSize:](self, "assetGlyphWithName:glyphSize:glyphWeight:glyphPointSize:", v7, a4);

  return v9;
}

- (id)copyWithChangeBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, UISMutableSlotStyle *))a3;
  id v5 = [(UISSlotStyle *)[UISMutableSlotStyle alloc] initWithStyle:self];
  v4[2](v4, v5);

  if (v5)
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
  }
  return v5;
}

- (unint64_t)gradeWithOnlyFails:(unint64_t)a3 allowedLocalizations:(id)a4
{
  id v6 = a4;
  unint64_t v7 = 0;
  uint64_t v8 = 1;
  do
  {
    if ((v8 & a3) == 0) {
      goto LABEL_27;
    }
    if (v8 <= 31)
    {
      switch(v8)
      {
        case 1:
          unint64_t v9 = [(UISSlotStyle *)self accessibilityContrast];
          break;
        case 2:
          if ([(UISSlotStyle *)self displayRange] > 2) {
            goto LABEL_26;
          }
          goto LABEL_27;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_27;
        case 4:
          if (![(UISSlotStyle *)self displayScale]
            || [(UISSlotStyle *)self displayScale] >= 5)
          {
            goto LABEL_26;
          }
          goto LABEL_27;
        case 8:
          unint64_t v9 = [(UISSlotStyle *)self layoutDirection];
          break;
        default:
          if (v8 != 16) {
            goto LABEL_27;
          }
          unint64_t v9 = [(UISSlotStyle *)self legibilityWeight];
          break;
      }
LABEL_25:
      if (v9 <= 1) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (v8 <= 127)
    {
      if (v8 == 32)
      {
        if ([(UISSlotStyle *)self preferredContentSizeCategory] > 0xB) {
          goto LABEL_26;
        }
      }
      else if (v8 == 64 && [(UISSlotStyle *)self userInterfaceIdiom] > 7)
      {
        goto LABEL_26;
      }
    }
    else
    {
      if (v8 == 128)
      {
        unint64_t v9 = [(UISSlotStyle *)self userInterfaceStyle];
        goto LABEL_25;
      }
      if (v8 != 256)
      {
        if (v8 != 512) {
          goto LABEL_27;
        }
        if (UISIsColorInDisplayP3Gamut([(UISSlotStyle *)self tintColor])) {
          break;
        }
LABEL_26:
        v7 |= v8;
        goto LABEL_27;
      }
      unint64_t v11 = [(UISSlotStyle *)self localization];
      char v12 = [v6 containsObject:v11];

      if ((v12 & 1) == 0) {
        goto LABEL_26;
      }
    }
LABEL_27:
    BOOL v10 = (unint64_t)v8 >= 0x101;
    v8 *= 2;
  }
  while (!v10);

  return v7;
}

- (__CTFont)newFontForTextStyle:(__CFString *)a3 attributes:(__CFDictionary *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (const void *)*MEMORY[0x1E4F24590];
  if (a4)
  {
    if (CFDictionaryContainsKey(a4, (const void *)*MEMORY[0x1E4F24590]))
    {
      MutableCopy = (__CFDictionary *)CFRetain(a4);
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a4);
      CFDictionarySetValue(MutableCopy, v5, (const void *)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", -[UISSlotStyle fontLegibilityWeight](self, "fontLegibilityWeight")));
    }
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F24590];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", -[UISSlotStyle fontLegibilityWeight](self, "fontLegibilityWeight", a3));
    v13[0] = v8;
    MutableCopy = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  [(UISSlotStyle *)self fontContentSizeCategory];
  unint64_t v9 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  BOOL v10 = CTFontCreateWithFontDescriptor(v9, 0.0, 0);
  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

@end