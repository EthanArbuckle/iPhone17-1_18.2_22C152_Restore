@interface OADCharacterProperties
+ (void)initialize;
- (BOOL)hasBaseline;
- (BOOL)hasBidiFont;
- (BOOL)hasCaps;
- (BOOL)hasEastAsianFont;
- (BOOL)hasEffects;
- (BOOL)hasFill;
- (BOOL)hasFormatKerningType;
- (BOOL)hasFormatType;
- (BOOL)hasHAnsiFont;
- (BOOL)hasHighlight;
- (BOOL)hasIsBold;
- (BOOL)hasIsHorizontalNormalized;
- (BOOL)hasIsItalic;
- (BOOL)hasIsRightToLeft;
- (BOOL)hasIsVerticalText;
- (BOOL)hasLanguage;
- (BOOL)hasLatinFont;
- (BOOL)hasOpacity;
- (BOOL)hasSize;
- (BOOL)hasSpacing;
- (BOOL)hasStrikeThroughType;
- (BOOL)hasStroke;
- (BOOL)hasSymbolFont;
- (BOOL)hasUnderlineFill;
- (BOOL)hasUnderlineStroke;
- (BOOL)hasUnderlineType;
- (BOOL)isAnyCharacterPropertyOverridden;
- (BOOL)isBold;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontalNormalized;
- (BOOL)isItalic;
- (BOOL)isRightToLeft;
- (BOOL)isVerticalText;
- (NSString)description;
- (OADCharacterProperties)initWithDefaults;
- (float)baseline;
- (float)opacity;
- (float)size;
- (float)spacing;
- (id)bidiFont;
- (id)clickHyperlink;
- (id)eastAsianFont;
- (id)effects;
- (id)fill;
- (id)hansiFont;
- (id)highlight;
- (id)hoverHyperlink;
- (id)latinFont;
- (id)stroke;
- (id)symbolFont;
- (id)underlineFill;
- (id)underlineStroke;
- (int)language;
- (unint64_t)hash;
- (unsigned)caps;
- (unsigned)formatKerningType;
- (unsigned)formatType;
- (unsigned)strikeThroughType;
- (unsigned)underlineType;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)overrideWithCharacterProperties:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setBaseline:(float)a3;
- (void)setBidiFont:(id)a3;
- (void)setCaps:(unsigned __int8)a3;
- (void)setClickHyperlink:(id)a3;
- (void)setEastAsianFont:(id)a3;
- (void)setEffects:(id)a3;
- (void)setFill:(id)a3;
- (void)setFormatKerningType:(unsigned __int8)a3;
- (void)setFormatType:(unsigned __int8)a3;
- (void)setHAnsiFont:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setHoverHyperlink:(id)a3;
- (void)setIsBold:(BOOL)a3;
- (void)setIsHorizontalNormalized:(BOOL)a3;
- (void)setIsItalic:(BOOL)a3;
- (void)setIsRightToLeft:(BOOL)a3;
- (void)setIsVerticalText:(BOOL)a3;
- (void)setLanguage:(int)a3;
- (void)setLatinFont:(id)a3;
- (void)setOpacity:(float)a3;
- (void)setSize:(float)a3;
- (void)setSpacing:(float)a3;
- (void)setStrikeThroughType:(unsigned __int8)a3;
- (void)setStroke:(id)a3;
- (void)setSymbolFont:(id)a3;
- (void)setUnderlineFill:(id)a3;
- (void)setUnderlineStroke:(id)a3;
- (void)setUnderlineType:(unsigned __int8)a3;
@end

@implementation OADCharacterProperties

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[OADEffect alloc] initWithType:6];
    v3 = (void *)kOADAutoTextShadowEffect;
    kOADAutoTextShadowEffect = (uint64_t)v2;
  }
}

- (OADCharacterProperties)initWithDefaults
{
  v10.receiver = self;
  v10.super_class = (Class)OADCharacterProperties;
  v2 = [(OADProperties *)&v10 initWithDefaults];
  if (v2)
  {
    v3 = +[OADSolidFill blackFill];
    [(OADCharacterProperties *)v2 setFill:v3];

    v4 = +[OADStroke nullStroke];
    [(OADCharacterProperties *)v2 setStroke:v4];

    v5 = [MEMORY[0x263EFF8C0] array];
    [(OADCharacterProperties *)v2 setEffects:v5];

    [(OADCharacterProperties *)v2 setHighlight:0];
    [(OADCharacterProperties *)v2 setUnderlineFill:0];
    [(OADCharacterProperties *)v2 setUnderlineStroke:0];
    LODWORD(v6) = 1.0;
    [(OADCharacterProperties *)v2 setOpacity:v6];
    [(OADCharacterProperties *)v2 setIsBold:0];
    [(OADCharacterProperties *)v2 setIsItalic:0];
    [(OADCharacterProperties *)v2 setUnderlineType:0];
    [(OADCharacterProperties *)v2 setFormatType:0];
    [(OADCharacterProperties *)v2 setFormatKerningType:0];
    [(OADCharacterProperties *)v2 setStrikeThroughType:0];
    LODWORD(v7) = 18.0;
    [(OADCharacterProperties *)v2 setSize:v7];
    [(OADCharacterProperties *)v2 setSpacing:0.0];
    [(OADCharacterProperties *)v2 setIsVerticalText:0];
    [(OADCharacterProperties *)v2 setBaseline:0.0];
    [(OADCharacterProperties *)v2 setIsHorizontalNormalized:0];
    [(OADCharacterProperties *)v2 setCaps:0];
    [(OADCharacterProperties *)v2 setLanguage:0];
    [(OADCharacterProperties *)v2 setLatinFont:&stru_26EBF24D8];
    [(OADCharacterProperties *)v2 setEastAsianFont:&stru_26EBF24D8];
    [(OADCharacterProperties *)v2 setBidiFont:&stru_26EBF24D8];
    [(OADCharacterProperties *)v2 setHAnsiFont:&stru_26EBF24D8];
    [(OADCharacterProperties *)v2 setSymbolFont:&stru_26EBF24D8];
    v8 = v2;
  }

  return v2;
}

- (void)setFill:(id)a3
{
}

- (void)setOpacity:(float)a3
{
  self->mOpacity = a3;
  *((unsigned char *)self + 156) |= 8u;
}

- (void)setHighlight:(id)a3
{
  *((unsigned char *)self + 156) |= 4u;
}

- (void)setIsBold:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 156) = *((unsigned char *)self + 156) & 0xDF | v3;
  *((unsigned char *)self + 156) |= 0x10u;
}

- (void)setIsItalic:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 156) = v3 & 0x80 | *((unsigned char *)self + 156) & 0x7F;
  *((unsigned char *)self + 156) |= 0x40u;
}

- (void)setFormatType:(unsigned __int8)a3
{
  self->mFormatType = a3;
  *((unsigned char *)self + 157) |= 2u;
}

- (void)setFormatKerningType:(unsigned __int8)a3
{
  self->mFormatKerningType = a3;
  *((unsigned char *)self + 157) |= 4u;
}

- (void)setStrikeThroughType:(unsigned __int8)a3
{
  self->mStrikeThroughType = a3;
  *((unsigned char *)self + 157) |= 8u;
}

- (void)setSize:(float)a3
{
  self->mSize = a3;
  *((unsigned char *)self + 157) |= 0x10u;
}

- (void)setSpacing:(float)a3
{
  self->mSpacing = a3;
  *((unsigned char *)self + 157) |= 0x20u;
}

- (void)setIsVerticalText:(BOOL)a3
{
  *((unsigned char *)self + 158) = *((unsigned char *)self + 158) & 0xFE | a3;
  *((unsigned char *)self + 157) |= 0x80u;
}

- (void)setBaseline:(float)a3
{
  self->mBaseline = a3;
  *((unsigned char *)self + 158) |= 8u;
}

- (void)setIsHorizontalNormalized:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 158) = *((unsigned char *)self + 158) & 0xDF | v3;
  *((unsigned char *)self + 158) |= 0x10u;
}

- (void)setCaps:(unsigned __int8)a3
{
  *((unsigned char *)self + 158) |= 0x40u;
  self->mCaps = a3;
}

- (void)setLatinFont:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mLatinFont = self->mLatinFont;
  self->mLatinFont = v4;
}

- (void)setEastAsianFont:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mEastAsianFont = self->mEastAsianFont;
  self->mEastAsianFont = v4;
}

- (void)setBidiFont:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mBidiFont = self->mBidiFont;
  self->mBidiFont = v4;
}

- (void)setHAnsiFont:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mHAnsiFont = self->mHAnsiFont;
  self->mHAnsiFont = v4;
}

- (void)setSymbolFont:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mSymbolFont = self->mSymbolFont;
  self->mSymbolFont = v4;
}

- (void)setEffects:(id)a3
{
}

- (BOOL)hasStroke
{
  return self->mStroke || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasFill
{
  return self->mFill || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)fill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFill];
  id v3 = v2[10];

  return v3;
}

- (BOOL)hasOpacity
{
  return (*((unsigned char *)self + 156) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasHighlight
{
  return (*((unsigned char *)self + 156) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasIsBold
{
  return (*((unsigned char *)self + 156) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isBold
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsBold];
  BOOL v3 = (v2[156] >> 5) & 1;

  return v3;
}

- (BOOL)hasIsItalic
{
  return (*((unsigned char *)self + 156) & 0x40) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isItalic
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsItalic];
  unsigned int v3 = v2[156];

  return v3 >> 7;
}

- (BOOL)hasEffects
{
  return self->mEffects || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)effects
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasEffects];
  id v3 = v2[12];

  return v3;
}

- (BOOL)hasFormatType
{
  return (*((unsigned char *)self + 157) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)formatType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFormatType];
  unsigned __int8 v3 = v2[145];

  return v3;
}

- (BOOL)hasFormatKerningType
{
  return (*((unsigned char *)self + 157) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasStrikeThroughType
{
  return (*((unsigned char *)self + 157) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)strikeThroughType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasStrikeThroughType];
  unsigned __int8 v3 = v2[147];

  return v3;
}

- (BOOL)hasSize
{
  return (*((unsigned char *)self + 157) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)size
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasSize];
  float v3 = v2[33];

  return v3;
}

- (BOOL)hasSpacing
{
  return (*((unsigned char *)self + 157) & 0x20) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasIsVerticalText
{
  return *((char *)self + 157) < 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasBaseline
{
  return (*((unsigned char *)self + 158) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)baseline
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBaseline];
  float v3 = v2[35];

  return v3;
}

- (BOOL)hasIsHorizontalNormalized
{
  return (*((unsigned char *)self + 158) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasCaps
{
  return (*((unsigned char *)self + 158) & 0x40) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasLatinFont
{
  mLatinFont = self->mLatinFont;
  if (mLatinFont && [(NSString *)mLatinFont length]) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)latinFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLatinFont];
  id v3 = v2[3];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)hasEastAsianFont
{
  mEastAsianFont = self->mEastAsianFont;
  if (mEastAsianFont && [(NSString *)mEastAsianFont length]) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasBidiFont
{
  mBidiFont = self->mBidiFont;
  if (mBidiFont && [(NSString *)mBidiFont length]) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasHAnsiFont
{
  mHAnsiFont = self->mHAnsiFont;
  if (mHAnsiFont && [(NSString *)mHAnsiFont length]) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasSymbolFont
{
  mSymbolFont = self->mSymbolFont;
  if (mSymbolFont && [(NSString *)mSymbolFont length]) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)clickHyperlink
{
  return self->mClickHyperlink;
}

- (id)hoverHyperlink
{
  return self->mHoverHyperlink;
}

- (id)eastAsianFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasEastAsianFont];
  id v3 = v2[4];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)symbolFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasSymbolFont];
  id v3 = v2[7];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)removeUnnecessaryOverrides
{
  id v3 = [(OADProperties *)self parent];

  if (!v3) {
    return;
  }
  BOOL v4 = [(OADProperties *)self isMerged];
  BOOL v5 = [(OADProperties *)self isMergedWithParent];
  [(OADProperties *)self setMerged:0];
  [(OADProperties *)self setMergedWithParent:0];
  id v6 = [(OADProperties *)self parent];
  mStroke = self->mStroke;
  v8 = [v6 stroke];
  LODWORD(mStroke) = TCObjectEqual((objc_object *)mStroke, v8);

  if (mStroke)
  {
    v9 = self->mStroke;
    self->mStroke = 0;
  }
  mFill = self->mFill;
  v11 = [v6 fill];
  LODWORD(mFill) = TCObjectEqual((objc_object *)mFill, v11);

  if (mFill)
  {
    v12 = self->mFill;
    self->mFill = 0;
  }
  if ([(OADCharacterProperties *)self hasEffects])
  {
    v13 = [(OADProperties *)self parent];
    v14 = [(OADCharacterProperties *)self effects];
    v15 = [v13 effects];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v14 removeUnnecessaryOverrides];
      uint64_t v16 = objc_opt_class();
      if (v16 != objc_opt_class()) {
        goto LABEL_13;
      }
      uint64_t v17 = [(objc_object *)v14 isMergedWithParent];
      [(objc_object *)v14 setMergedWithParent:0];
      char v18 = [(objc_object *)v14 isAnythingOverridden];
      [(objc_object *)v14 setMergedWithParent:v17];
      if (v18) {
        goto LABEL_13;
      }
    }
    else if (!TCObjectEqual(v14, v15))
    {
LABEL_13:

      goto LABEL_14;
    }
    mEffects = self->mEffects;
    self->mEffects = 0;

    goto LABEL_13;
  }
LABEL_14:
  if ([(OADCharacterProperties *)self hasOpacity])
  {
    v20 = [(OADProperties *)self parent];
    [(OADCharacterProperties *)self opacity];
    float v22 = v21;
    [v20 opacity];
    if (v22 == *(float *)&v23)
    {
      LODWORD(v23) = 1.0;
      [(OADCharacterProperties *)self setOpacity:v23];
      *((unsigned char *)self + 156) &= ~8u;
    }
  }
  if ([(OADCharacterProperties *)self hasHighlight])
  {
    v24 = [(OADProperties *)self parent];
    v25 = [(OADCharacterProperties *)self highlight];
    v26 = [v24 highlight];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v25 removeUnnecessaryOverrides];
      uint64_t v27 = objc_opt_class();
      if (v27 != objc_opt_class()) {
        goto LABEL_25;
      }
      uint64_t v28 = [(objc_object *)v25 isMergedWithParent];
      [(objc_object *)v25 setMergedWithParent:0];
      char v29 = [(objc_object *)v25 isAnythingOverridden];
      [(objc_object *)v25 setMergedWithParent:v28];
      if (v29) {
        goto LABEL_25;
      }
    }
    else if (!TCObjectEqual(v25, v26))
    {
LABEL_25:

      goto LABEL_26;
    }
    mHighlight = self->mHighlight;
    self->mHighlight = 0;

    *((unsigned char *)self + 156) &= ~4u;
    goto LABEL_25;
  }
LABEL_26:
  if (![(OADCharacterProperties *)self hasUnderlineFill]) {
    goto LABEL_34;
  }
  v31 = [(OADProperties *)self parent];
  v32 = [(OADCharacterProperties *)self underlineFill];
  v33 = [v31 underlineFill];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v32 removeUnnecessaryOverrides];
    uint64_t v34 = objc_opt_class();
    if (v34 != objc_opt_class()) {
      goto LABEL_33;
    }
    uint64_t v35 = [(objc_object *)v32 isMergedWithParent];
    [(objc_object *)v32 setMergedWithParent:0];
    char v36 = [(objc_object *)v32 isAnythingOverridden];
    [(objc_object *)v32 setMergedWithParent:v35];
    if (v36) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (TCObjectEqual(v32, v33))
  {
LABEL_32:
    mUnderlineFill = self->mUnderlineFill;
    self->mUnderlineFill = 0;

    *((unsigned char *)self + 156) &= ~1u;
  }
LABEL_33:

LABEL_34:
  if (![(OADCharacterProperties *)self hasUnderlineStroke]) {
    goto LABEL_42;
  }
  v38 = [(OADProperties *)self parent];
  v39 = [(OADCharacterProperties *)self underlineStroke];
  v40 = [v38 underlineStroke];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v39 removeUnnecessaryOverrides];
    uint64_t v41 = objc_opt_class();
    if (v41 != objc_opt_class()) {
      goto LABEL_41;
    }
    uint64_t v42 = [(objc_object *)v39 isMergedWithParent];
    [(objc_object *)v39 setMergedWithParent:0];
    char v43 = [(objc_object *)v39 isAnythingOverridden];
    [(objc_object *)v39 setMergedWithParent:v42];
    if (v43) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (TCObjectEqual(v39, v40))
  {
LABEL_40:
    mUnderlineStroke = self->mUnderlineStroke;
    self->mUnderlineStroke = 0;

    *((unsigned char *)self + 156) &= ~2u;
  }
LABEL_41:

LABEL_42:
  if ([(OADCharacterProperties *)self hasIsBold])
  {
    v45 = [(OADProperties *)self parent];
    int v46 = [(OADCharacterProperties *)self isBold];
    if (v46 == [v45 isBold])
    {
      [(OADCharacterProperties *)self setIsBold:0];
      *((unsigned char *)self + 156) &= ~0x10u;
    }
  }
  if ([(OADCharacterProperties *)self hasIsItalic])
  {
    v47 = [(OADProperties *)self parent];
    int v48 = [(OADCharacterProperties *)self isItalic];
    if (v48 == [v47 isItalic])
    {
      [(OADCharacterProperties *)self setIsItalic:0];
      *((unsigned char *)self + 156) &= ~0x40u;
    }
  }
  if ([(OADCharacterProperties *)self hasUnderlineType])
  {
    v49 = [(OADProperties *)self parent];
    int v50 = [(OADCharacterProperties *)self underlineType];
    if (v50 == [v49 underlineType])
    {
      [(OADCharacterProperties *)self setUnderlineType:0];
      *((unsigned char *)self + 157) &= ~1u;
    }
  }
  if ([(OADCharacterProperties *)self hasFormatType])
  {
    v51 = [(OADProperties *)self parent];
    int v52 = [(OADCharacterProperties *)self formatType];
    if (v52 == [v51 formatType])
    {
      [(OADCharacterProperties *)self setFormatType:0];
      *((unsigned char *)self + 157) &= ~2u;
    }
  }
  if ([(OADCharacterProperties *)self hasFormatKerningType])
  {
    v53 = [(OADProperties *)self parent];
    int v54 = [(OADCharacterProperties *)self formatKerningType];
    if (v54 == [v53 formatKerningType])
    {
      [(OADCharacterProperties *)self setFormatKerningType:0];
      *((unsigned char *)self + 157) &= ~4u;
    }
  }
  if ([(OADCharacterProperties *)self hasStrikeThroughType])
  {
    v55 = [(OADProperties *)self parent];
    int v56 = [(OADCharacterProperties *)self strikeThroughType];
    if (v56 == [v55 strikeThroughType])
    {
      [(OADCharacterProperties *)self setStrikeThroughType:0];
      *((unsigned char *)self + 157) &= ~8u;
    }
  }
  if ([(OADCharacterProperties *)self hasSize])
  {
    v57 = [(OADProperties *)self parent];
    [(OADCharacterProperties *)self size];
    float v59 = v58;
    [v57 size];
    if (v59 == *(float *)&v60)
    {
      LODWORD(v60) = 18.0;
      [(OADCharacterProperties *)self setSize:v60];
      *((unsigned char *)self + 157) &= ~0x10u;
    }
  }
  if ([(OADCharacterProperties *)self hasSpacing])
  {
    v61 = [(OADProperties *)self parent];
    [(OADCharacterProperties *)self spacing];
    float v63 = v62;
    [v61 spacing];
    if (v63 == v64)
    {
      [(OADCharacterProperties *)self setSpacing:0.0];
      *((unsigned char *)self + 157) &= ~0x20u;
    }
  }
  if ([(OADCharacterProperties *)self hasIsVerticalText])
  {
    v65 = [(OADProperties *)self parent];
    int v66 = [(OADCharacterProperties *)self isVerticalText];
    if (v66 == [v65 isVerticalText])
    {
      [(OADCharacterProperties *)self setIsVerticalText:0];
      *((unsigned char *)self + 157) &= ~0x80u;
    }
  }
  if ([(OADCharacterProperties *)self hasIsRightToLeft])
  {
    v67 = [(OADProperties *)self parent];
    int v68 = [(OADCharacterProperties *)self isRightToLeft];
    if (v68 == [v67 isRightToLeft])
    {
      [(OADCharacterProperties *)self setIsRightToLeft:0];
      *((unsigned char *)self + 158) &= ~2u;
    }
  }
  if ([(OADCharacterProperties *)self hasBaseline])
  {
    v69 = [(OADProperties *)self parent];
    [(OADCharacterProperties *)self baseline];
    float v71 = v70;
    [v69 baseline];
    if (v71 == v72)
    {
      [(OADCharacterProperties *)self setBaseline:0.0];
      *((unsigned char *)self + 158) &= ~8u;
    }
  }
  if ([(OADCharacterProperties *)self hasIsHorizontalNormalized])
  {
    v73 = [(OADProperties *)self parent];
    int v74 = [(OADCharacterProperties *)self isHorizontalNormalized];
    if (v74 == [v73 isHorizontalNormalized])
    {
      [(OADCharacterProperties *)self setIsHorizontalNormalized:0];
      *((unsigned char *)self + 158) &= ~0x10u;
    }
  }
  if ([(OADCharacterProperties *)self hasCaps])
  {
    v75 = [(OADProperties *)self parent];
    int v76 = [(OADCharacterProperties *)self caps];
    if (v76 == [v75 caps])
    {
      [(OADCharacterProperties *)self setCaps:0];
      *((unsigned char *)self + 158) &= ~0x40u;
    }
  }
  if ([(OADCharacterProperties *)self hasLanguage])
  {
    v77 = [(OADProperties *)self parent];
    int v78 = [(OADCharacterProperties *)self language];
    if (v78 == [v77 language])
    {
      [(OADCharacterProperties *)self setLanguage:0];
      *((unsigned char *)self + 158) &= ~0x80u;
    }
  }
  if ([(OADCharacterProperties *)self hasLatinFont])
  {
    v79 = [(OADProperties *)self parent];
    v80 = [(OADCharacterProperties *)self latinFont];
    v81 = [v79 latinFont];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v80 removeUnnecessaryOverrides];
      uint64_t v82 = objc_opt_class();
      if (v82 != objc_opt_class()) {
        goto LABEL_105;
      }
      uint64_t v83 = [(objc_object *)v80 isMergedWithParent];
      [(objc_object *)v80 setMergedWithParent:0];
      char v84 = [(objc_object *)v80 isAnythingOverridden];
      [(objc_object *)v80 setMergedWithParent:v83];
      if (v84) {
        goto LABEL_105;
      }
    }
    else if (!TCObjectEqual(v80, v81))
    {
LABEL_105:

      goto LABEL_106;
    }
    mLatinFont = self->mLatinFont;
    self->mLatinFont = 0;

    goto LABEL_105;
  }
LABEL_106:
  if (![(OADCharacterProperties *)self hasEastAsianFont]) {
    goto LABEL_114;
  }
  v86 = [(OADProperties *)self parent];
  v87 = [(OADCharacterProperties *)self eastAsianFont];
  v88 = [v86 eastAsianFont];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v87 removeUnnecessaryOverrides];
    uint64_t v89 = objc_opt_class();
    if (v89 != objc_opt_class()) {
      goto LABEL_113;
    }
    uint64_t v90 = [(objc_object *)v87 isMergedWithParent];
    [(objc_object *)v87 setMergedWithParent:0];
    char v91 = [(objc_object *)v87 isAnythingOverridden];
    [(objc_object *)v87 setMergedWithParent:v90];
    if (v91) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
  if (TCObjectEqual(v87, v88))
  {
LABEL_112:
    mEastAsianFont = self->mEastAsianFont;
    self->mEastAsianFont = 0;
  }
LABEL_113:

LABEL_114:
  if (![(OADCharacterProperties *)self hasBidiFont]) {
    goto LABEL_122;
  }
  v93 = [(OADProperties *)self parent];
  v94 = [(OADCharacterProperties *)self bidiFont];
  v95 = [v93 bidiFont];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v94 removeUnnecessaryOverrides];
    uint64_t v96 = objc_opt_class();
    if (v96 != objc_opt_class()) {
      goto LABEL_121;
    }
    uint64_t v97 = [(objc_object *)v94 isMergedWithParent];
    [(objc_object *)v94 setMergedWithParent:0];
    char v98 = [(objc_object *)v94 isAnythingOverridden];
    [(objc_object *)v94 setMergedWithParent:v97];
    if (v98) {
      goto LABEL_121;
    }
    goto LABEL_120;
  }
  if (TCObjectEqual(v94, v95))
  {
LABEL_120:
    mBidiFont = self->mBidiFont;
    self->mBidiFont = 0;
  }
LABEL_121:

LABEL_122:
  if (![(OADCharacterProperties *)self hasHAnsiFont]) {
    goto LABEL_130;
  }
  v100 = [(OADProperties *)self parent];
  v101 = [(OADCharacterProperties *)self hansiFont];
  v102 = [v100 hansiFont];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v101 removeUnnecessaryOverrides];
    uint64_t v103 = objc_opt_class();
    if (v103 != objc_opt_class()) {
      goto LABEL_129;
    }
    uint64_t v104 = [(objc_object *)v101 isMergedWithParent];
    [(objc_object *)v101 setMergedWithParent:0];
    char v105 = [(objc_object *)v101 isAnythingOverridden];
    [(objc_object *)v101 setMergedWithParent:v104];
    if (v105) {
      goto LABEL_129;
    }
    goto LABEL_128;
  }
  if (TCObjectEqual(v101, v102))
  {
LABEL_128:
    mHAnsiFont = self->mHAnsiFont;
    self->mHAnsiFont = 0;
  }
LABEL_129:

LABEL_130:
  if ([(OADCharacterProperties *)self hasSymbolFont])
  {
    v107 = [(OADProperties *)self parent];
    v108 = [(OADCharacterProperties *)self symbolFont];
    v109 = [v107 symbolFont];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v108 removeUnnecessaryOverrides];
      uint64_t v110 = objc_opt_class();
      if (v110 != objc_opt_class()) {
        goto LABEL_137;
      }
      uint64_t v111 = [(objc_object *)v108 isMergedWithParent];
      [(objc_object *)v108 setMergedWithParent:0];
      char v112 = [(objc_object *)v108 isAnythingOverridden];
      [(objc_object *)v108 setMergedWithParent:v111];
      if (v112) {
        goto LABEL_137;
      }
    }
    else if (!TCObjectEqual(v108, v109))
    {
LABEL_137:

      goto LABEL_138;
    }
    mSymbolFont = self->mSymbolFont;
    self->mSymbolFont = 0;

    goto LABEL_137;
  }
LABEL_138:
  mClickHyperlink = self->mClickHyperlink;
  v115 = [(OADProperties *)self parent];
  v116 = [v115 clickHyperlink];
  LODWORD(mClickHyperlink) = [(OADHyperlink *)mClickHyperlink isEqual:v116];

  if (mClickHyperlink)
  {
    v117 = self->mClickHyperlink;
    self->mClickHyperlink = 0;
  }
  mHoverHyperlink = self->mHoverHyperlink;
  v119 = [(OADProperties *)self parent];
  v120 = [v119 hoverHyperlink];
  LODWORD(mHoverHyperlink) = [(OADHyperlink *)mHoverHyperlink isEqual:v120];

  if (mHoverHyperlink)
  {
    v121 = self->mHoverHyperlink;
    self->mHoverHyperlink = 0;
  }
  [(OADProperties *)self setMerged:v4];
  [(OADProperties *)self setMergedWithParent:v5];
  v122.receiver = self;
  v122.super_class = (Class)OADCharacterProperties;
  [(OADProperties *)&v122 removeUnnecessaryOverrides];
}

- (unsigned)caps
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasCaps];
  unsigned __int8 v3 = v2[148];

  return v3;
}

- (float)spacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasSpacing];
  float v3 = v2[34];

  return v3;
}

- (unsigned)formatKerningType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFormatKerningType];
  unsigned __int8 v3 = v2[146];

  return v3;
}

- (id)hansiFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasHAnsiFont];
  id v3 = v2[6];

  if ([v3 length]) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setStroke:(id)a3
{
}

- (void)setClickHyperlink:(id)a3
{
}

- (unint64_t)hash
{
  NSUInteger v20 = [(NSString *)self->mLatinFont hash];
  NSUInteger v19 = [(NSString *)self->mEastAsianFont hash];
  NSUInteger v3 = [(NSString *)self->mBidiFont hash];
  NSUInteger v4 = [(NSString *)self->mHAnsiFont hash];
  NSUInteger v5 = [(NSString *)self->mSymbolFont hash];
  unint64_t v6 = [(OADHyperlink *)self->mClickHyperlink hash];
  unint64_t v7 = [(OADHyperlink *)self->mHoverHyperlink hash];
  unint64_t v8 = [(OADStroke *)self->mStroke hash];
  unint64_t v9 = [(OADFill *)self->mFill hash];
  unint64_t v10 = [(OADColor *)self->mHighlight hash];
  unint64_t v11 = [(OADFill *)self->mUnderlineFill hash];
  unint64_t v12 = v19 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(OADStroke *)self->mUnderlineStroke hash];
  if ([(NSArray *)self->mEffects count])
  {
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      v15 = [(NSArray *)self->mEffects objectAtIndex:v13];
      v12 ^= [v15 hash];

      uint64_t v13 = v14;
    }
    while ([(NSArray *)self->mEffects count] > v14++);
  }
  uint64_t v17 = ((int)self->mSize ^ (int)self->mOpacity ^ (int)self->mSpacing ^ (int)self->mBaseline ^ self->mFormatType ^ self->mFormatKerningType ^ self->mStrikeThroughType ^ self->mCaps ^ ((*((unsigned char *)self + 156) & 0x20) != 0) ^ (*((unsigned char *)self + 156) >> 7) ^ self->mUnderlineType ^ *((unsigned char *)self + 158) & 1 ^ ((*((unsigned char *)self + 158) & 0x20) != 0));
  v21.receiver = self;
  v21.super_class = (Class)OADCharacterProperties;
  return v12 ^ [(OADProperties *)&v21 hash] ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v5 = (objc_object **)v4;
    BOOL v6 = [(OADProperties *)self isMerged];
    BOOL v7 = [(OADProperties *)self isMergedWithParent];
    uint64_t v8 = [v5 isMerged];
    uint64_t v9 = [v5 isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    [v5 setMerged:0];
    [v5 setMergedWithParent:0];
    unint64_t v10 = [(OADCharacterProperties *)self hash];
    if (v10 != [v5 hash]) {
      goto LABEL_70;
    }
    if (!TCObjectEqual((objc_object *)self->mFill, v5[10])) {
      goto LABEL_70;
    }
    if (!TCObjectEqual((objc_object *)self->mStroke, v5[11])) {
      goto LABEL_70;
    }
    if (!TCObjectEqual((objc_object *)self->mEffects, v5[12])) {
      goto LABEL_70;
    }
    if (!TCObjectEqual((objc_object *)self->mHighlight, v5[15])) {
      goto LABEL_70;
    }
    int v11 = [v5 hasOpacity];
    if (v11 != [(OADCharacterProperties *)self hasOpacity]) {
      goto LABEL_70;
    }
    if ([v5 hasOpacity])
    {
      [v5 opacity];
      float v13 = v12;
      [(OADCharacterProperties *)self opacity];
      if (v13 != v14) {
        goto LABEL_70;
      }
    }
    if ((*((unsigned char *)self + 157) & 1) != (*((unsigned char *)v5 + 157) & 1)
      || (*((unsigned char *)self + 157) & 1) != 0 && self->mUnderlineType != *((unsigned __int8 *)v5 + 144))
    {
      goto LABEL_70;
    }
    if ((*((unsigned char *)self + 156) & 1) != (*((unsigned char *)v5 + 156) & 1)
      || (*((unsigned char *)self + 156) & 1) != 0 && !TCObjectEqual((objc_object *)self->mUnderlineFill, v5[13]))
    {
      goto LABEL_70;
    }
    if (((*((unsigned __int8 *)v5 + 156) >> 1) & 1) != (*((unsigned char *)self + 156) & 2) >> 1
      || (*((unsigned char *)self + 156) & 2) != 0
      && !TCObjectEqual((objc_object *)self->mUnderlineStroke, v5[14]))
    {
      goto LABEL_70;
    }
    if (((*((unsigned __int8 *)v5 + 156) >> 2) & 1) != (*((unsigned char *)self + 156) & 4) >> 2
      || (*((unsigned char *)self + 156) & 4) != 0 && !TCObjectEqual((objc_object *)self->mHighlight, v5[15]))
    {
      goto LABEL_70;
    }
    int v15 = [v5 hasIsBold];
    if (v15 != [(OADCharacterProperties *)self hasIsBold]) {
      goto LABEL_70;
    }
    if ([v5 hasIsBold])
    {
      int v16 = [v5 isBold];
      if (v16 != [(OADCharacterProperties *)self isBold]) {
        goto LABEL_70;
      }
    }
    int v17 = [v5 hasIsItalic];
    if (v17 != [(OADCharacterProperties *)self hasIsItalic]) {
      goto LABEL_70;
    }
    if ([v5 hasIsItalic])
    {
      int v18 = [v5 isItalic];
      if (v18 != [(OADCharacterProperties *)self isItalic]) {
        goto LABEL_70;
      }
    }
    int v19 = [v5 hasEffects];
    if (v19 != [(OADCharacterProperties *)self hasEffects]) {
      goto LABEL_70;
    }
    if ([v5 hasEffects])
    {
      NSUInteger v20 = [v5 effects];
      objc_super v21 = [(OADCharacterProperties *)self effects];
      char v22 = [v20 isEqualToArray:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_70;
      }
    }
    int v23 = [v5 hasFormatType];
    if (v23 != [(OADCharacterProperties *)self hasFormatType]) {
      goto LABEL_70;
    }
    if ([v5 hasFormatType])
    {
      int v24 = [v5 formatType];
      if (v24 != [(OADCharacterProperties *)self formatType]) {
        goto LABEL_70;
      }
    }
    int v25 = [v5 hasFormatKerningType];
    if (v25 != [(OADCharacterProperties *)self hasFormatKerningType]) {
      goto LABEL_70;
    }
    if ([v5 hasFormatKerningType])
    {
      int v26 = [v5 formatKerningType];
      if (v26 != [(OADCharacterProperties *)self formatKerningType]) {
        goto LABEL_70;
      }
    }
    int v27 = [v5 hasStrikeThroughType];
    if (v27 != [(OADCharacterProperties *)self hasStrikeThroughType]) {
      goto LABEL_70;
    }
    if ([v5 hasStrikeThroughType])
    {
      int v28 = [v5 strikeThroughType];
      if (v28 != [(OADCharacterProperties *)self strikeThroughType]) {
        goto LABEL_70;
      }
    }
    int v29 = [v5 hasSize];
    if (v29 != [(OADCharacterProperties *)self hasSize]) {
      goto LABEL_70;
    }
    if ([v5 hasSize])
    {
      [v5 size];
      float v31 = v30;
      [(OADCharacterProperties *)self size];
      if (v31 != v32) {
        goto LABEL_70;
      }
    }
    int v33 = [v5 hasSpacing];
    if (v33 != [(OADCharacterProperties *)self hasSpacing]) {
      goto LABEL_70;
    }
    if ([v5 hasSpacing])
    {
      [v5 spacing];
      float v35 = v34;
      [(OADCharacterProperties *)self spacing];
      if (v35 != v36) {
        goto LABEL_70;
      }
    }
    int v37 = [v5 hasIsVerticalText];
    if (v37 != [(OADCharacterProperties *)self hasIsVerticalText]) {
      goto LABEL_70;
    }
    if ([v5 hasIsVerticalText])
    {
      int v38 = [v5 isVerticalText];
      if (v38 != [(OADCharacterProperties *)self isVerticalText]) {
        goto LABEL_70;
      }
    }
    int v39 = [v5 hasBaseline];
    if (v39 != [(OADCharacterProperties *)self hasBaseline]) {
      goto LABEL_70;
    }
    if ([v5 hasBaseline])
    {
      [v5 baseline];
      float v41 = v40;
      [(OADCharacterProperties *)self baseline];
      if (v41 != v42) {
        goto LABEL_70;
      }
    }
    if ((int v43 = [v5 hasIsHorizontalNormalized],
          v43 == [(OADCharacterProperties *)self hasIsHorizontalNormalized])
      && (![v5 hasIsHorizontalNormalized]
       || (int v44 = [v5 isHorizontalNormalized],
           v44 == [(OADCharacterProperties *)self isHorizontalNormalized]))
      && (int v45 = [v5 hasCaps], v45 == -[OADCharacterProperties hasCaps](self, "hasCaps"))
      && (![v5 hasCaps]
       || (int v46 = [v5 caps], v46 == -[OADCharacterProperties caps](self, "caps")))
      && (int v47 = [v5 hasLanguage], v47 == -[OADCharacterProperties hasLanguage](self, "hasLanguage"))
      && (![v5 hasLanguage]
       || (int v48 = [v5 language], v48 == -[OADCharacterProperties language](self, "language")))
      && TCObjectEqual((objc_object *)self->mHoverHyperlink, v5[9])
      && TCObjectEqual((objc_object *)self->mClickHyperlink, v5[8])
      && TCObjectEqual((objc_object *)self->mLatinFont, v5[3])
      && TCObjectEqual((objc_object *)self->mEastAsianFont, v5[4])
      && TCObjectEqual((objc_object *)self->mBidiFont, v5[5])
      && TCObjectEqual((objc_object *)self->mHAnsiFont, v5[6])
      && TCObjectEqual((objc_object *)self->mSymbolFont, v5[7]))
    {
      v51.receiver = self;
      v51.super_class = (Class)OADCharacterProperties;
      BOOL v49 = [(OADProperties *)&v51 isEqual:v5];
    }
    else
    {
LABEL_70:
      BOOL v49 = 0;
    }
    [(OADProperties *)self setMerged:v6];
    [(OADProperties *)self setMergedWithParent:v7];
    [v5 setMerged:v8];
    [v5 setMergedWithParent:v9];
  }
  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

- (float)opacity
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasOpacity];
  float v3 = v2[32];

  return v3;
}

- (void)setHoverHyperlink:(id)a3
{
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADCharacterProperties;
  v2 = [(OADProperties *)&v4 description];
  return (NSString *)v2;
}

- (id)stroke
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasStroke];
  id v3 = v2[11];

  return v3;
}

- (BOOL)hasUnderlineType
{
  return (*((unsigned char *)self + 157) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)underlineType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasUnderlineType];
  unsigned __int8 v3 = v2[144];

  return v3;
}

- (void)setUnderlineType:(unsigned __int8)a3
{
  self->mUnderlineType = a3;
  *((unsigned char *)self + 157) |= 1u;
}

- (id)highlight
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasHighlight];
  id v3 = v2[15];

  return v3;
}

- (BOOL)hasUnderlineFill
{
  return (*((unsigned char *)self + 156) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)underlineFill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasUnderlineFill];
  id v3 = v2[13];

  return v3;
}

- (void)setUnderlineFill:(id)a3
{
  *((unsigned char *)self + 156) |= 1u;
}

- (BOOL)hasUnderlineStroke
{
  return (*((unsigned char *)self + 156) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)underlineStroke
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasUnderlineStroke];
  id v3 = v2[14];

  return v3;
}

- (void)setUnderlineStroke:(id)a3
{
  *((unsigned char *)self + 156) |= 2u;
}

- (BOOL)isVerticalText
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsVerticalText];
  BOOL v3 = v2[158] & 1;

  return v3;
}

- (BOOL)hasIsRightToLeft
{
  return (*((unsigned char *)self + 158) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isRightToLeft
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsRightToLeft];
  BOOL v3 = (v2[158] >> 2) & 1;

  return v3;
}

- (void)setIsRightToLeft:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 158) = *((unsigned char *)self + 158) & 0xFB | v3;
  *((unsigned char *)self + 158) |= 2u;
}

- (BOOL)isHorizontalNormalized
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsHorizontalNormalized];
  BOOL v3 = (v2[158] >> 5) & 1;

  return v3;
}

- (BOOL)hasLanguage
{
  return *((char *)self + 158) < 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)language
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLanguage];
  int v3 = v2[38];

  return v3;
}

- (void)setLanguage:(int)a3
{
  *((unsigned char *)self + 158) |= 0x80u;
  self->mLanguage = a3;
}

- (id)bidiFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBidiFont];
  id v3 = v2[5];

  if ([v3 length]) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v127.receiver = self;
  v127.super_class = (Class)OADCharacterProperties;
  [(OADProperties *)&v127 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADCharacterProperties *)self hasLatinFont]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    BOOL v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasLatinFont];

    if (v6)
    {
      BOOL v7 = [(OADCharacterProperties *)self latinFont];
    }
    else
    {
      BOOL v7 = 0;
    }
    uint64_t v8 = [v4 possiblyInexistentOverrideForSelector:sel_hasLatinFont];

    if (v8)
    {
      uint64_t v9 = [v4 latinFont];
    }
    else
    {
      uint64_t v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    mLatinFont = self->mLatinFont;
    if (v10)
    {
      self->mLatinFont = 0;
    }
    else if (!mLatinFont && v6)
    {
      [(OADCharacterProperties *)self setLatinFont:v7];
    }
  }
  if ([(OADCharacterProperties *)self hasEastAsianFont]
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    float v13 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasEastAsianFont];

    if (v13)
    {
      float v14 = [(OADCharacterProperties *)self eastAsianFont];
    }
    else
    {
      float v14 = 0;
    }
    int v15 = [v4 possiblyInexistentOverrideForSelector:sel_hasEastAsianFont];

    if (v15)
    {
      int v16 = [v4 eastAsianFont];
    }
    else
    {
      int v16 = 0;
    }
    int v17 = TCObjectEqual(v14, v16);
    mEastAsianFont = self->mEastAsianFont;
    if (v17)
    {
      self->mEastAsianFont = 0;
    }
    else if (!mEastAsianFont && v13)
    {
      [(OADCharacterProperties *)self setEastAsianFont:v14];
    }
  }
  if ([(OADCharacterProperties *)self hasBidiFont]
    || ([(OADProperties *)self parent],
        id v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    NSUInteger v20 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBidiFont];

    if (v20)
    {
      objc_super v21 = [(OADCharacterProperties *)self bidiFont];
    }
    else
    {
      objc_super v21 = 0;
    }
    char v22 = [v4 possiblyInexistentOverrideForSelector:sel_hasBidiFont];

    if (v22)
    {
      int v23 = [v4 bidiFont];
    }
    else
    {
      int v23 = 0;
    }
    int v24 = TCObjectEqual(v21, v23);
    mBidiFont = self->mBidiFont;
    if (v24)
    {
      self->mBidiFont = 0;
    }
    else if (!mBidiFont && v20)
    {
      [(OADCharacterProperties *)self setBidiFont:v21];
    }
  }
  if ([(OADCharacterProperties *)self hasHAnsiFont]
    || ([(OADProperties *)self parent],
        id v26 = (id)objc_claimAutoreleasedReturnValue(),
        v26,
        v26 != v4))
  {
    int v27 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasHAnsiFont];

    if (v27)
    {
      int v28 = [(OADCharacterProperties *)self hansiFont];
    }
    else
    {
      int v28 = 0;
    }
    int v29 = [v4 possiblyInexistentOverrideForSelector:sel_hasHAnsiFont];

    if (v29)
    {
      float v30 = [v4 hansiFont];
    }
    else
    {
      float v30 = 0;
    }
    int v31 = TCObjectEqual(v28, v30);
    mHAnsiFont = self->mHAnsiFont;
    if (v31)
    {
      self->mHAnsiFont = 0;
    }
    else if (!mHAnsiFont && v27)
    {
      [(OADCharacterProperties *)self setHAnsiFont:v28];
    }
  }
  if ([(OADCharacterProperties *)self hasSymbolFont]
    || ([(OADProperties *)self parent],
        id v33 = (id)objc_claimAutoreleasedReturnValue(),
        v33,
        v33 != v4))
  {
    float v34 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasSymbolFont];

    if (v34)
    {
      float v35 = [(OADCharacterProperties *)self symbolFont];
    }
    else
    {
      float v35 = 0;
    }
    float v36 = [v4 possiblyInexistentOverrideForSelector:sel_hasSymbolFont];

    if (v36)
    {
      int v37 = [v4 symbolFont];
    }
    else
    {
      int v37 = 0;
    }
    int v38 = TCObjectEqual(v35, v37);
    mSymbolFont = self->mSymbolFont;
    if (v38)
    {
      self->mSymbolFont = 0;
    }
    else if (!mSymbolFont && v34)
    {
      [(OADCharacterProperties *)self setSymbolFont:v35];
    }
  }
  if ([(OADCharacterProperties *)self hasFill]
    || ([(OADProperties *)self parent],
        id v40 = (id)objc_claimAutoreleasedReturnValue(),
        v40,
        v40 != v4))
  {
    float v41 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasFill];

    if (v41)
    {
      float v42 = [(OADCharacterProperties *)self fill];
    }
    else
    {
      float v42 = 0;
    }
    int v43 = [v4 possiblyInexistentOverrideForSelector:sel_hasFill];

    if (v43)
    {
      int v44 = [v4 fill];
    }
    else
    {
      int v44 = 0;
    }
    int v45 = TCObjectEqual(v42, v44);
    mFill = self->mFill;
    if (v45)
    {
      self->mFill = 0;
    }
    else if (!mFill && v41)
    {
      [(OADCharacterProperties *)self setFill:v42];
    }
  }
  if ([(OADCharacterProperties *)self hasStroke]
    || ([(OADProperties *)self parent],
        id v47 = (id)objc_claimAutoreleasedReturnValue(),
        v47,
        v47 != v4))
  {
    int v48 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasStroke];

    if (v48)
    {
      BOOL v49 = [(OADCharacterProperties *)self stroke];
    }
    else
    {
      BOOL v49 = 0;
    }
    int v50 = [v4 possiblyInexistentOverrideForSelector:sel_hasStroke];

    if (v50)
    {
      objc_super v51 = [v4 stroke];
    }
    else
    {
      objc_super v51 = 0;
    }
    int v52 = TCObjectEqual(v49, v51);
    mStroke = self->mStroke;
    if (v52)
    {
      self->mStroke = 0;
    }
    else if (!mStroke && v48)
    {
      [(OADCharacterProperties *)self setStroke:v49];
    }
  }
  if ([(OADCharacterProperties *)self hasEffects]
    || ([(OADProperties *)self parent],
        id v54 = (id)objc_claimAutoreleasedReturnValue(),
        v54,
        v54 != v4))
  {
    v55 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v55)
    {
      int v56 = [(OADCharacterProperties *)self effects];
    }
    else
    {
      int v56 = 0;
    }
    v57 = [v4 possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v57)
    {
      float v58 = [v4 effects];
    }
    else
    {
      float v58 = 0;
    }
    int v59 = TCObjectEqual(v56, v58);
    mEffects = self->mEffects;
    if (v59)
    {
      self->mEffects = 0;
    }
    else if (!mEffects && v55)
    {
      [(OADCharacterProperties *)self setEffects:v56];
    }
  }
  if ((*((unsigned char *)self + 156) & 1) == 0)
  {
    id v61 = [(OADProperties *)self parent];

    if (v61 == v4) {
      goto LABEL_128;
    }
LABEL_117:
    float v62 = [(OADCharacterProperties *)self underlineFill];
    id v63 = objc_alloc_init((Class)objc_opt_class());

    float v64 = [(OADCharacterProperties *)self underlineFill];
    [v63 setParent:v64];

    p_mUnderlineFill = &self->mUnderlineFill;
    objc_storeStrong((id *)&self->mUnderlineFill, v63);
    *((unsigned char *)self + 156) |= 1u;
    int v66 = [v4 possiblyInexistentOverrideForSelector:sel_hasUnderlineFill];

    if (v66)
    {
      int v66 = [v4 underlineFill];
    }
    if (*p_mUnderlineFill == v66)
    {
      v69 = v66;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v68 = [(id)objc_opt_class() defaultProperties];

        int v66 = (OADFill *)v68;
      }
      [(OADProperties *)*p_mUnderlineFill changeParentPreservingEffectiveValues:v66];
      if ((isKindOfClass & 1) == 0 || [(OADProperties *)*p_mUnderlineFill isAnythingOverridden]) {
        goto LABEL_127;
      }
      v69 = *p_mUnderlineFill;
    }
    *p_mUnderlineFill = 0;

    *((unsigned char *)self + 156) &= ~1u;
LABEL_127:

    goto LABEL_128;
  }
  if (self->mUnderlineFill) {
    goto LABEL_117;
  }
  v123 = [v4 possiblyInexistentOverrideForSelector:sel_hasUnderlineFill];
  if (!v123
    || ([v4 underlineFill],
        v124 = objc_claimAutoreleasedReturnValue(),
        v124,
        v123,
        !v124))
  {
    *((unsigned char *)self + 156) &= ~1u;
  }
LABEL_128:
  if ((*((unsigned char *)self + 156) & 2) == 0)
  {
    id v70 = [(OADProperties *)self parent];

    if (v70 == v4) {
      goto LABEL_143;
    }
LABEL_132:
    float v71 = [(OADCharacterProperties *)self underlineStroke];
    id v72 = objc_alloc_init((Class)objc_opt_class());

    v73 = [(OADCharacterProperties *)self underlineStroke];
    [v72 setParent:v73];

    p_mUnderlineStroke = &self->mUnderlineStroke;
    objc_storeStrong((id *)&self->mUnderlineStroke, v72);
    *((unsigned char *)self + 156) |= 2u;
    v75 = [v4 possiblyInexistentOverrideForSelector:sel_hasUnderlineStroke];

    if (v75)
    {
      v75 = [v4 underlineStroke];
    }
    if (*p_mUnderlineStroke == v75)
    {
      int v78 = v75;
    }
    else
    {
      objc_opt_class();
      char v76 = objc_opt_isKindOfClass();
      if ((v76 & 1) == 0)
      {
        uint64_t v77 = [(id)objc_opt_class() defaultProperties];

        v75 = (OADStroke *)v77;
      }
      [(OADProperties *)*p_mUnderlineStroke changeParentPreservingEffectiveValues:v75];
      if ((v76 & 1) == 0 || [(OADStroke *)*p_mUnderlineStroke isAnythingOverridden]) {
        goto LABEL_142;
      }
      int v78 = *p_mUnderlineStroke;
    }
    *p_mUnderlineStroke = 0;

    *((unsigned char *)self + 156) &= ~2u;
LABEL_142:

    goto LABEL_143;
  }
  if (self->mUnderlineStroke) {
    goto LABEL_132;
  }
  v125 = [v4 possiblyInexistentOverrideForSelector:sel_hasUnderlineStroke];
  if (!v125
    || ([v4 underlineStroke],
        v126 = objc_claimAutoreleasedReturnValue(),
        v126,
        v125,
        !v126))
  {
    *((unsigned char *)self + 156) &= ~2u;
  }
LABEL_143:
  if ((*((unsigned char *)self + 156) & 4) != 0
    || ([(OADProperties *)self parent],
        id v79 = (id)objc_claimAutoreleasedReturnValue(),
        v79,
        v79 != v4))
  {
    v80 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasHighlight];

    if (v80)
    {
      v81 = [(OADCharacterProperties *)self highlight];
    }
    else
    {
      v81 = 0;
    }
    uint64_t v82 = [v4 possiblyInexistentOverrideForSelector:sel_hasHighlight];

    if (v82)
    {
      uint64_t v83 = [v4 highlight];
    }
    else
    {
      uint64_t v83 = 0;
    }
    if (TCObjectEqual(v81, v83))
    {
      mHighlight = self->mHighlight;
      self->mHighlight = 0;

      *((unsigned char *)self + 156) &= ~4u;
    }
    else if ((*((unsigned char *)self + 156) & 4) == 0 && v80)
    {
      [(OADCharacterProperties *)self setHighlight:v81];
    }
  }
  if ((*((unsigned char *)self + 156) & 8) != 0
    || ([(OADProperties *)self parent],
        id v85 = (id)objc_claimAutoreleasedReturnValue(),
        v85,
        v85 != v4))
  {
    [(OADCharacterProperties *)self opacity];
    float v87 = v86;
    [v4 opacity];
    if (v87 == v88)
    {
      *((unsigned char *)self + 156) &= ~8u;
    }
    else if ((*((unsigned char *)self + 156) & 8) == 0)
    {
      [(OADCharacterProperties *)self opacity];
      -[OADCharacterProperties setOpacity:](self, "setOpacity:");
    }
  }
  if ((*((unsigned char *)self + 157) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v89 = (id)objc_claimAutoreleasedReturnValue(),
        v89,
        v89 != v4))
  {
    [(OADCharacterProperties *)self size];
    float v91 = v90;
    [v4 size];
    if (v91 == v92)
    {
      *((unsigned char *)self + 157) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 157) & 0x10) == 0)
    {
      [(OADCharacterProperties *)self size];
      -[OADCharacterProperties setSize:](self, "setSize:");
    }
  }
  if ((*((unsigned char *)self + 157) & 0x20) != 0
    || ([(OADProperties *)self parent],
        id v93 = (id)objc_claimAutoreleasedReturnValue(),
        v93,
        v93 != v4))
  {
    [(OADCharacterProperties *)self spacing];
    float v95 = v94;
    [v4 spacing];
    if (v95 == v96)
    {
      *((unsigned char *)self + 157) &= ~0x20u;
    }
    else if ((*((unsigned char *)self + 157) & 0x20) == 0)
    {
      [(OADCharacterProperties *)self spacing];
      -[OADCharacterProperties setSpacing:](self, "setSpacing:");
    }
  }
  if ((*((unsigned char *)self + 158) & 8) != 0
    || ([(OADProperties *)self parent],
        id v97 = (id)objc_claimAutoreleasedReturnValue(),
        v97,
        v97 != v4))
  {
    [(OADCharacterProperties *)self baseline];
    float v99 = v98;
    [v4 baseline];
    if (v99 == v100)
    {
      *((unsigned char *)self + 158) &= ~8u;
    }
    else if ((*((unsigned char *)self + 158) & 8) == 0)
    {
      [(OADCharacterProperties *)self baseline];
      -[OADCharacterProperties setBaseline:](self, "setBaseline:");
    }
  }
  if ((*((unsigned char *)self + 157) & 1) != 0
    || ([(OADProperties *)self parent],
        id v101 = (id)objc_claimAutoreleasedReturnValue(),
        v101,
        v101 != v4))
  {
    int v102 = [(OADCharacterProperties *)self underlineType];
    if (v102 == [v4 underlineType])
    {
      *((unsigned char *)self + 157) &= ~1u;
    }
    else if ((*((unsigned char *)self + 157) & 1) == 0)
    {
      [(OADCharacterProperties *)self setUnderlineType:[(OADCharacterProperties *)self underlineType]];
    }
  }
  if ((*((unsigned char *)self + 157) & 2) != 0
    || ([(OADProperties *)self parent],
        id v103 = (id)objc_claimAutoreleasedReturnValue(),
        v103,
        v103 != v4))
  {
    int v104 = [(OADCharacterProperties *)self formatType];
    if (v104 == [v4 formatType])
    {
      *((unsigned char *)self + 157) &= ~2u;
    }
    else if ((*((unsigned char *)self + 157) & 2) == 0)
    {
      [(OADCharacterProperties *)self setFormatType:[(OADCharacterProperties *)self formatType]];
    }
  }
  if ((*((unsigned char *)self + 157) & 4) != 0
    || ([(OADProperties *)self parent],
        id v105 = (id)objc_claimAutoreleasedReturnValue(),
        v105,
        v105 != v4))
  {
    int v106 = [(OADCharacterProperties *)self formatKerningType];
    if (v106 == [v4 formatKerningType])
    {
      *((unsigned char *)self + 157) &= ~4u;
    }
    else if ((*((unsigned char *)self + 157) & 4) == 0)
    {
      [(OADCharacterProperties *)self setFormatKerningType:[(OADCharacterProperties *)self formatKerningType]];
    }
  }
  if ((*((unsigned char *)self + 157) & 8) != 0
    || ([(OADProperties *)self parent],
        id v107 = (id)objc_claimAutoreleasedReturnValue(),
        v107,
        v107 != v4))
  {
    int v108 = [(OADCharacterProperties *)self strikeThroughType];
    if (v108 == [v4 strikeThroughType])
    {
      *((unsigned char *)self + 157) &= ~8u;
    }
    else if ((*((unsigned char *)self + 157) & 8) == 0)
    {
      [(OADCharacterProperties *)self setStrikeThroughType:[(OADCharacterProperties *)self strikeThroughType]];
    }
  }
  if ((*((unsigned char *)self + 158) & 0x40) != 0
    || ([(OADProperties *)self parent],
        id v109 = (id)objc_claimAutoreleasedReturnValue(),
        v109,
        v109 != v4))
  {
    int v110 = [(OADCharacterProperties *)self caps];
    if (v110 == [v4 caps])
    {
      *((unsigned char *)self + 158) &= ~0x40u;
    }
    else if ((*((unsigned char *)self + 158) & 0x40) == 0)
    {
      [(OADCharacterProperties *)self setCaps:[(OADCharacterProperties *)self caps]];
    }
  }
  if ((*((unsigned char *)self + 156) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v111 = (id)objc_claimAutoreleasedReturnValue(),
        v111,
        v111 != v4))
  {
    int v112 = [(OADCharacterProperties *)self isBold];
    if (v112 == [v4 isBold])
    {
      *((unsigned char *)self + 156) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 156) & 0x10) == 0)
    {
      [(OADCharacterProperties *)self setIsBold:[(OADCharacterProperties *)self isBold]];
    }
  }
  if ((*((unsigned char *)self + 156) & 0x40) != 0
    || ([(OADProperties *)self parent],
        id v113 = (id)objc_claimAutoreleasedReturnValue(),
        v113,
        v113 != v4))
  {
    int v114 = [(OADCharacterProperties *)self isItalic];
    if (v114 == [v4 isItalic])
    {
      *((unsigned char *)self + 156) &= ~0x40u;
    }
    else if ((*((unsigned char *)self + 156) & 0x40) == 0)
    {
      [(OADCharacterProperties *)self setIsItalic:[(OADCharacterProperties *)self isItalic]];
    }
  }
  if (*((char *)self + 157) < 0
    || ([(OADProperties *)self parent],
        id v115 = (id)objc_claimAutoreleasedReturnValue(),
        v115,
        v115 != v4))
  {
    int v116 = [(OADCharacterProperties *)self isVerticalText];
    int v117 = [v4 isVerticalText];
    int v118 = *((char *)self + 157);
    if (v116 == v117)
    {
      *((unsigned char *)self + 157) = v118 & 0x7F;
    }
    else if ((v118 & 0x80000000) == 0)
    {
      [(OADCharacterProperties *)self setIsVerticalText:[(OADCharacterProperties *)self isVerticalText]];
    }
  }
  if ((*((unsigned char *)self + 158) & 2) != 0
    || ([(OADProperties *)self parent],
        id v119 = (id)objc_claimAutoreleasedReturnValue(),
        v119,
        v119 != v4))
  {
    int v120 = [(OADCharacterProperties *)self isRightToLeft];
    if (v120 == [v4 isRightToLeft])
    {
      *((unsigned char *)self + 158) &= ~2u;
    }
    else if ((*((unsigned char *)self + 158) & 2) == 0)
    {
      [(OADCharacterProperties *)self setIsRightToLeft:[(OADCharacterProperties *)self isRightToLeft]];
    }
  }
  if ((*((unsigned char *)self + 158) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v121 = (id)objc_claimAutoreleasedReturnValue(),
        v121,
        v121 != v4))
  {
    int v122 = [(OADCharacterProperties *)self isHorizontalNormalized];
    if (v122 == [v4 isHorizontalNormalized])
    {
      *((unsigned char *)self + 158) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 158) & 0x10) == 0)
    {
      [(OADCharacterProperties *)self setIsHorizontalNormalized:[(OADCharacterProperties *)self isHorizontalNormalized]];
    }
  }
}

- (void)overrideWithCharacterProperties:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 isMerged];
  uint64_t v5 = [v21 isMergedWithParent];
  [v21 setMerged:0];
  [v21 setMergedWithParent:0];
  if ([v21 hasStroke])
  {
    BOOL v6 = [v21 stroke];
    [(OADCharacterProperties *)self setStroke:v6];
  }
  if ([v21 hasFill])
  {
    BOOL v7 = [v21 fill];
    [(OADCharacterProperties *)self setFill:v7];
  }
  if ([v21 hasOpacity])
  {
    [v21 opacity];
    -[OADCharacterProperties setOpacity:](self, "setOpacity:");
  }
  if ([v21 hasUnderlineType]) {
    -[OADCharacterProperties setUnderlineType:](self, "setUnderlineType:", [v21 underlineType]);
  }
  if ([v21 hasUnderlineFill])
  {
    uint64_t v8 = [v21 underlineFill];
    [(OADCharacterProperties *)self setUnderlineFill:v8];
  }
  if ([v21 hasUnderlineStroke])
  {
    uint64_t v9 = [v21 underlineStroke];
    [(OADCharacterProperties *)self setUnderlineStroke:v9];
  }
  if ([v21 hasHighlight])
  {
    int v10 = [v21 highlight];
    [(OADCharacterProperties *)self setHighlight:v10];
  }
  if ([v21 hasIsBold]) {
    -[OADCharacterProperties setIsBold:](self, "setIsBold:", [v21 isBold]);
  }
  if ([v21 hasIsItalic]) {
    -[OADCharacterProperties setIsItalic:](self, "setIsItalic:", [v21 isItalic]);
  }
  if ([v21 hasEffects])
  {
    int v11 = [v21 effects];
    [(OADCharacterProperties *)self setEffects:v11];
  }
  if ([v21 hasFormatType]) {
    -[OADCharacterProperties setFormatType:](self, "setFormatType:", [v21 formatType]);
  }
  if ([v21 hasFormatKerningType]) {
    -[OADCharacterProperties setFormatKerningType:](self, "setFormatKerningType:", [v21 formatKerningType]);
  }
  if ([v21 hasStrikeThroughType]) {
    -[OADCharacterProperties setStrikeThroughType:](self, "setStrikeThroughType:", [v21 strikeThroughType]);
  }
  if ([v21 hasSize])
  {
    [v21 size];
    -[OADCharacterProperties setSize:](self, "setSize:");
  }
  if ([v21 hasSpacing])
  {
    [v21 spacing];
    -[OADCharacterProperties setSpacing:](self, "setSpacing:");
  }
  if ([v21 hasIsVerticalText]) {
    -[OADCharacterProperties setIsVerticalText:](self, "setIsVerticalText:", [v21 isVerticalText]);
  }
  if ([v21 hasBaseline])
  {
    [v21 baseline];
    -[OADCharacterProperties setBaseline:](self, "setBaseline:");
  }
  if ([v21 hasIsHorizontalNormalized]) {
    -[OADCharacterProperties setIsHorizontalNormalized:](self, "setIsHorizontalNormalized:", [v21 isHorizontalNormalized]);
  }
  if ([v21 hasCaps]) {
    -[OADCharacterProperties setCaps:](self, "setCaps:", [v21 caps]);
  }
  if ([v21 hasLanguage]) {
    -[OADCharacterProperties setLanguage:](self, "setLanguage:", [v21 language]);
  }
  if ([v21 hasLatinFont])
  {
    id v12 = [v21 latinFont];
    [(OADCharacterProperties *)self setLatinFont:v12];
  }
  if ([v21 hasEastAsianFont])
  {
    float v13 = [v21 eastAsianFont];
    [(OADCharacterProperties *)self setEastAsianFont:v13];
  }
  if ([v21 hasBidiFont])
  {
    float v14 = [v21 bidiFont];
    [(OADCharacterProperties *)self setBidiFont:v14];
  }
  if ([v21 hasHAnsiFont])
  {
    int v15 = [v21 hansiFont];
    [(OADCharacterProperties *)self setHAnsiFont:v15];
  }
  if ([v21 hasSymbolFont])
  {
    int v16 = [v21 symbolFont];
    [(OADCharacterProperties *)self setSymbolFont:v16];
  }
  int v17 = [v21 clickHyperlink];

  if (v17)
  {
    int v18 = [v21 clickHyperlink];
    [(OADCharacterProperties *)self setClickHyperlink:v18];
  }
  id v19 = [v21 hoverHyperlink];

  if (v19)
  {
    NSUInteger v20 = [v21 hoverHyperlink];
    [(OADCharacterProperties *)self setHoverHyperlink:v20];
  }
  [v21 setMerged:v4];
  [v21 setMergedWithParent:v5];
}

- (BOOL)isAnyCharacterPropertyOverridden
{
  v7.receiver = self;
  v7.super_class = (Class)OADCharacterProperties;
  if ([(OADProperties *)&v7 isAnythingOverridden]
    || [(OADCharacterProperties *)self hasFill]
    || [(OADCharacterProperties *)self hasStroke]
    || [(OADCharacterProperties *)self hasOpacity]
    || [(OADCharacterProperties *)self hasUnderlineType]
    || [(OADCharacterProperties *)self hasUnderlineFill]
    || [(OADCharacterProperties *)self hasUnderlineStroke]
    || [(OADCharacterProperties *)self hasHighlight]
    || [(OADCharacterProperties *)self hasIsBold]
    || [(OADCharacterProperties *)self hasIsItalic]
    || [(OADCharacterProperties *)self hasEffects]
    || [(OADCharacterProperties *)self hasFormatType]
    || [(OADCharacterProperties *)self hasFormatKerningType]
    || [(OADCharacterProperties *)self hasStrikeThroughType]
    || [(OADCharacterProperties *)self hasSize]
    || [(OADCharacterProperties *)self hasSpacing]
    || [(OADCharacterProperties *)self hasIsVerticalText]
    || [(OADCharacterProperties *)self hasIsRightToLeft]
    || [(OADCharacterProperties *)self hasBaseline]
    || [(OADCharacterProperties *)self hasIsHorizontalNormalized]
    || [(OADCharacterProperties *)self hasCaps]
    || [(OADCharacterProperties *)self hasLatinFont]
    || [(OADCharacterProperties *)self hasEastAsianFont]
    || [(OADCharacterProperties *)self hasBidiFont]
    || [(OADCharacterProperties *)self hasHAnsiFont]
    || [(OADCharacterProperties *)self hasSymbolFont])
  {
    return 1;
  }
  uint64_t v5 = [(OADCharacterProperties *)self clickHyperlink];
  if (v5)
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v6 = [(OADCharacterProperties *)self hoverHyperlink];
    BOOL v3 = v6 != 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHighlight, 0);
  objc_storeStrong((id *)&self->mUnderlineStroke, 0);
  objc_storeStrong((id *)&self->mUnderlineFill, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStroke, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mHoverHyperlink, 0);
  objc_storeStrong((id *)&self->mClickHyperlink, 0);
  objc_storeStrong((id *)&self->mSymbolFont, 0);
  objc_storeStrong((id *)&self->mHAnsiFont, 0);
  objc_storeStrong((id *)&self->mBidiFont, 0);
  objc_storeStrong((id *)&self->mEastAsianFont, 0);
  objc_storeStrong((id *)&self->mLatinFont, 0);
}

@end