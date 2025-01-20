@interface OADParagraphProperties
+ (id)defaultProperties;
- (BOOL)hasAfterSpacing;
- (BOOL)hasAlign;
- (BOOL)hasBeforeSpacing;
- (BOOL)hasBulletCharSet;
- (BOOL)hasBulletColor;
- (BOOL)hasBulletFont;
- (BOOL)hasBulletProperties;
- (BOOL)hasBulletSize;
- (BOOL)hasDefaultTab;
- (BOOL)hasFontAlign;
- (BOOL)hasIndent;
- (BOOL)hasIsHangingPunctuation;
- (BOOL)hasIsLatinLineBreak;
- (BOOL)hasLeftMargin;
- (BOOL)hasLevel;
- (BOOL)hasLineSpacing;
- (BOOL)hasRightMargin;
- (BOOL)hasTabStops;
- (BOOL)hasWrap;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHangingPunctuation;
- (BOOL)isLatinLineBreak;
- (OADParagraphProperties)init;
- (OADParagraphProperties)initWithDefaults;
- (double)nonOveridenLeftMargin;
- (float)defaultTab;
- (float)indent;
- (float)leftMargin;
- (float)rightMargin;
- (id)afterSpacing;
- (id)beforeSpacing;
- (id)bulletColor;
- (id)bulletFont;
- (id)bulletProperties;
- (id)bulletSize;
- (id)description;
- (id)lineSpacing;
- (id)tabStops;
- (int)bulletCharSet;
- (int)level;
- (unint64_t)hash;
- (unsigned)align;
- (unsigned)fontAlign;
- (unsigned)wrap;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)overrideWithProperties:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAfterSpacing:(id)a3;
- (void)setAlign:(unsigned __int8)a3;
- (void)setBeforeSpacing:(id)a3;
- (void)setBulletCharSet:(int)a3;
- (void)setBulletColor:(id)a3;
- (void)setBulletFont:(id)a3;
- (void)setBulletProperties:(id)a3;
- (void)setBulletSize:(id)a3;
- (void)setDefaultTab:(float)a3;
- (void)setFontAlign:(unsigned __int8)a3;
- (void)setIndent:(float)a3;
- (void)setIsHangingPunctuation:(BOOL)a3;
- (void)setIsLatinLineBreak:(BOOL)a3;
- (void)setLeftMargin:(float)a3;
- (void)setLevel:(int)a3;
- (void)setLineSpacing:(id)a3;
- (void)setRightMargin:(float)a3;
- (void)setTabStops:(id)a3;
- (void)setWrap:(unsigned __int8)a3;
@end

@implementation OADParagraphProperties

- (OADParagraphProperties)initWithDefaults
{
  v15.receiver = self;
  v15.super_class = (Class)OADParagraphProperties;
  v2 = [(OADCharacterProperties *)&v15 initWithDefaults];
  if (v2)
  {
    v3 = [OADPercentTextSpacing alloc];
    LODWORD(v4) = 1120403456;
    v5 = [(OADPercentTextSpacing *)v3 initWithPercent:v4];
    [(OADParagraphProperties *)v2 setLineSpacing:v5];
    v6 = [[OADPointTextSpacing alloc] initWithPoints:0];
    [(OADParagraphProperties *)v2 setBeforeSpacing:v6];
    [(OADParagraphProperties *)v2 setAfterSpacing:v6];
    v7 = [MEMORY[0x263EFF8C0] array];
    [(OADParagraphProperties *)v2 setTabStops:v7];

    [(OADParagraphProperties *)v2 setLeftMargin:0.0];
    [(OADParagraphProperties *)v2 setRightMargin:0.0];
    [(OADParagraphProperties *)v2 setLevel:0];
    [(OADParagraphProperties *)v2 setIndent:0.0];
    [(OADParagraphProperties *)v2 setAlign:0];
    LODWORD(v8) = 1116733440;
    [(OADParagraphProperties *)v2 setDefaultTab:v8];
    [(OADCharacterProperties *)v2 setIsRightToLeft:0];
    [(OADParagraphProperties *)v2 setWrap:1];
    [(OADParagraphProperties *)v2 setFontAlign:0];
    [(OADParagraphProperties *)v2 setIsLatinLineBreak:1];
    [(OADParagraphProperties *)v2 setIsHangingPunctuation:0];
    [(OADParagraphProperties *)v2 setBulletCharSet:1];
    v9 = objc_alloc_init(OADBulletSizeFollowText);
    [(OADParagraphProperties *)v2 setBulletSize:v9];
    v10 = objc_alloc_init(OADBulletColorFollowText);
    [(OADParagraphProperties *)v2 setBulletColor:v10];
    v11 = objc_alloc_init(OADBulletFontFollowText);
    [(OADParagraphProperties *)v2 setBulletFont:v11];
    v12 = objc_alloc_init(OADNullBulletProperties);
    [(OADParagraphProperties *)v2 setBulletProperties:v12];
    v13 = v2;
  }
  return v2;
}

- (void)setLineSpacing:(id)a3
{
}

- (void)setBeforeSpacing:(id)a3
{
}

- (void)setAfterSpacing:(id)a3
{
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
  *((unsigned char *)self + 255) |= 8u;
}

- (void)setRightMargin:(float)a3
{
  self->mRightMargin = a3;
  *((unsigned char *)self + 255) |= 0x10u;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
  *((unsigned char *)self + 255) |= 4u;
}

- (void)setIndent:(float)a3
{
  self->mIndent = a3;
  *((unsigned char *)self + 255) |= 0x20u;
}

- (void)setAlign:(unsigned __int8)a3
{
  self->mAlign = a3;
  *((unsigned char *)self + 256) |= 1u;
}

- (void)setDefaultTab:(float)a3
{
  self->mDefaultTab = a3;
  *((unsigned char *)self + 255) |= 0x40u;
}

- (void)setWrap:(unsigned __int8)a3
{
  self->mWrap = a3;
  *((unsigned char *)self + 256) |= 2u;
}

- (void)setFontAlign:(unsigned __int8)a3
{
  self->mFontAlign = a3;
  *((unsigned char *)self + 256) |= 4u;
}

- (void)setIsLatinLineBreak:(BOOL)a3
{
  *((unsigned char *)self + 255) = *((unsigned char *)self + 255) & 0xFE | a3;
  *((unsigned char *)self + 256) |= 8u;
}

- (void)setIsHangingPunctuation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 255) = *((unsigned char *)self + 255) & 0xFD | v3;
  *((unsigned char *)self + 256) |= 0x10u;
}

- (void)setBulletCharSet:(int)a3
{
  self->mBulletCharSet = a3;
  *((unsigned char *)self + 255) |= 0x80u;
}

- (void)setBulletSize:(id)a3
{
}

- (void)setBulletColor:(id)a3
{
}

- (void)setBulletFont:(id)a3
{
}

- (void)setBulletProperties:(id)a3
{
}

- (OADParagraphProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADParagraphProperties;
  return [(OADProperties *)&v3 init];
}

+ (id)defaultProperties
{
  if (+[OADParagraphProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADParagraphProperties defaultProperties]::once, &__block_literal_global_60);
  }
  v2 = (void *)+[OADParagraphProperties defaultProperties]::defaultProperties;
  return v2;
}

- (float)leftMargin
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLeftMargin];
  float v3 = v2[58];

  return v3;
}

- (BOOL)hasLeftMargin
{
  return (*((unsigned char *)self + 255) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void)overrideWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isMerged];
  uint64_t v6 = [v4 isMergedWithParent];
  [v4 setMerged:0];
  [v4 setMergedWithParent:0];
  if ([v4 hasLineSpacing])
  {
    v7 = [v4 lineSpacing];
    [(OADParagraphProperties *)self setLineSpacing:v7];
  }
  if ([v4 hasBeforeSpacing])
  {
    double v8 = [v4 beforeSpacing];
    [(OADParagraphProperties *)self setBeforeSpacing:v8];
  }
  if ([v4 hasAfterSpacing])
  {
    v9 = [v4 afterSpacing];
    [(OADParagraphProperties *)self setAfterSpacing:v9];
  }
  if ([v4 hasTabStops])
  {
    v10 = [v4 tabStops];
    [(OADParagraphProperties *)self setTabStops:v10];
  }
  if ([v4 hasLeftMargin])
  {
    [v4 leftMargin];
    -[OADParagraphProperties setLeftMargin:](self, "setLeftMargin:");
  }
  if ([v4 hasRightMargin])
  {
    [v4 rightMargin];
    -[OADParagraphProperties setRightMargin:](self, "setRightMargin:");
  }
  if ([v4 hasIndent])
  {
    [v4 indent];
    -[OADParagraphProperties setIndent:](self, "setIndent:");
  }
  if ([v4 hasAlign]) {
    -[OADParagraphProperties setAlign:](self, "setAlign:", [v4 align]);
  }
  if ([v4 hasDefaultTab])
  {
    [v4 defaultTab];
    -[OADParagraphProperties setDefaultTab:](self, "setDefaultTab:");
  }
  if ([v4 hasIsRightToLeft]) {
    -[OADCharacterProperties setIsRightToLeft:](self, "setIsRightToLeft:", [v4 isRightToLeft]);
  }
  if ([v4 hasWrap]) {
    -[OADParagraphProperties setWrap:](self, "setWrap:", [v4 wrap]);
  }
  if ([v4 hasFontAlign]) {
    -[OADParagraphProperties setFontAlign:](self, "setFontAlign:", [v4 fontAlign]);
  }
  if ([v4 hasIsLatinLineBreak]) {
    -[OADParagraphProperties setIsLatinLineBreak:](self, "setIsLatinLineBreak:", [v4 isLatinLineBreak]);
  }
  if ([v4 hasIsHangingPunctuation]) {
    -[OADParagraphProperties setIsHangingPunctuation:](self, "setIsHangingPunctuation:", [v4 isHangingPunctuation]);
  }
  if ([v4 hasBulletSize])
  {
    v11 = [v4 bulletSize];
    [(OADParagraphProperties *)self setBulletSize:v11];
  }
  if ([v4 hasBulletColor])
  {
    v12 = [v4 bulletColor];
    [(OADParagraphProperties *)self setBulletColor:v12];
  }
  if ([v4 hasBulletFont])
  {
    v13 = [v4 bulletFont];
    [(OADParagraphProperties *)self setBulletFont:v13];
  }
  if ([v4 hasBulletProperties])
  {
    v14 = [v4 bulletProperties];
    [(OADParagraphProperties *)self setBulletProperties:v14];
  }
  if ([v4 hasBulletCharSet]) {
    -[OADParagraphProperties setBulletCharSet:](self, "setBulletCharSet:", [v4 bulletCharSet]);
  }
  v15.receiver = self;
  v15.super_class = (Class)OADParagraphProperties;
  [(OADCharacterProperties *)&v15 overrideWithProperties:v4];
  [v4 setMerged:v5];
  [v4 setMergedWithParent:v6];
}

- (BOOL)hasLineSpacing
{
  return self->mLineSpacing || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)lineSpacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLineSpacing];
  id v3 = v2[25];

  return v3;
}

- (BOOL)hasBeforeSpacing
{
  return self->mBeforeSpacing || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)beforeSpacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBeforeSpacing];
  id v3 = v2[26];

  return v3;
}

- (BOOL)hasAfterSpacing
{
  return self->mAfterSpacing || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)afterSpacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasAfterSpacing];
  id v3 = v2[27];

  return v3;
}

- (BOOL)hasTabStops
{
  return self->mTabStops || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasRightMargin
{
  return (*((unsigned char *)self + 255) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasLevel
{
  return (*((unsigned char *)self + 255) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)level
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLevel];
  int v3 = v2[40];

  return v3;
}

- (BOOL)hasIndent
{
  return (*((unsigned char *)self + 255) & 0x20) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)indent
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIndent];
  float v3 = v2[60];

  return v3;
}

- (BOOL)hasAlign
{
  return (*((unsigned char *)self + 256) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)align
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasAlign];
  unsigned __int8 v3 = v2[252];

  return v3;
}

- (BOOL)hasDefaultTab
{
  return (*((unsigned char *)self + 255) & 0x40) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)defaultTab
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasDefaultTab];
  float v3 = v2[61];

  return v3;
}

- (BOOL)hasWrap
{
  return (*((unsigned char *)self + 256) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasFontAlign
{
  return (*((unsigned char *)self + 256) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasIsLatinLineBreak
{
  return (*((unsigned char *)self + 256) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasIsHangingPunctuation
{
  return (*((unsigned char *)self + 256) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasBulletSize
{
  return self->mBulletSize || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)bulletSize
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBulletSize];
  id v3 = v2[21];

  return v3;
}

- (BOOL)hasBulletColor
{
  return self->mBulletColor || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)bulletColor
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBulletColor];
  id v3 = v2[22];

  return v3;
}

- (BOOL)hasBulletFont
{
  return self->mBulletFont || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)bulletFont
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBulletFont];
  id v3 = v2[23];

  return v3;
}

- (BOOL)hasBulletProperties
{
  return self->mBulletProperties
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)bulletProperties
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBulletProperties];
  id v3 = v2[24];

  return v3;
}

- (BOOL)hasBulletCharSet
{
  return *((char *)self + 255) < 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void)removeUnnecessaryOverrides
{
  id v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if (![(OADParagraphProperties *)self hasLineSpacing]) {
      goto LABEL_10;
    }
    uint64_t v6 = [(OADProperties *)self parent];
    v7 = [(OADParagraphProperties *)self lineSpacing];
    double v8 = [v6 lineSpacing];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v7 removeUnnecessaryOverrides];
      uint64_t v9 = objc_opt_class();
      if (v9 != objc_opt_class()) {
        goto LABEL_9;
      }
      uint64_t v10 = [(objc_object *)v7 isMergedWithParent];
      [(objc_object *)v7 setMergedWithParent:0];
      char v11 = [(objc_object *)v7 isAnythingOverridden];
      [(objc_object *)v7 setMergedWithParent:v10];
      if (v11) {
        goto LABEL_9;
      }
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

LABEL_10:
      if (![(OADParagraphProperties *)self hasBeforeSpacing]) {
        goto LABEL_18;
      }
      v13 = [(OADProperties *)self parent];
      v14 = [(OADParagraphProperties *)self beforeSpacing];
      objc_super v15 = [v13 beforeSpacing];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(objc_object *)v14 removeUnnecessaryOverrides];
        uint64_t v16 = objc_opt_class();
        if (v16 != objc_opt_class()) {
          goto LABEL_17;
        }
        uint64_t v17 = [(objc_object *)v14 isMergedWithParent];
        [(objc_object *)v14 setMergedWithParent:0];
        char v18 = [(objc_object *)v14 isAnythingOverridden];
        [(objc_object *)v14 setMergedWithParent:v17];
        if (v18) {
          goto LABEL_17;
        }
      }
      else if (!TCObjectEqual(v14, v15))
      {
LABEL_17:

LABEL_18:
        if (![(OADParagraphProperties *)self hasAfterSpacing])
        {
LABEL_26:
          if ([(OADParagraphProperties *)self hasTabStops])
          {
            v27 = [(OADParagraphProperties *)self tabStops];
            v28 = [(OADProperties *)self parent];
            v29 = [v28 tabStops];
            int v30 = [v27 isEqualToArray:v29];

            if (v30)
            {
              mTabStops = self->mTabStops;
              self->mTabStops = 0;
            }
          }
          if ([(OADParagraphProperties *)self hasLeftMargin])
          {
            v32 = [(OADProperties *)self parent];
            [(OADParagraphProperties *)self leftMargin];
            float v34 = v33;
            [v32 leftMargin];
            if (v34 == v35)
            {
              [(OADParagraphProperties *)self setLeftMargin:0.0];
              *((unsigned char *)self + 255) &= ~8u;
            }
          }
          if ([(OADParagraphProperties *)self hasRightMargin])
          {
            v36 = [(OADProperties *)self parent];
            [(OADParagraphProperties *)self rightMargin];
            float v38 = v37;
            [v36 rightMargin];
            if (v38 == v39)
            {
              [(OADParagraphProperties *)self setRightMargin:0.0];
              *((unsigned char *)self + 255) &= ~0x10u;
            }
          }
          if ([(OADParagraphProperties *)self hasIndent])
          {
            v40 = [(OADProperties *)self parent];
            [(OADParagraphProperties *)self indent];
            float v42 = v41;
            [v40 indent];
            if (v42 == v43)
            {
              [(OADParagraphProperties *)self setIndent:0.0];
              *((unsigned char *)self + 255) &= ~0x20u;
            }
          }
          if ([(OADParagraphProperties *)self hasAlign])
          {
            v44 = [(OADProperties *)self parent];
            int v45 = [(OADParagraphProperties *)self align];
            if (v45 == [v44 align])
            {
              [(OADParagraphProperties *)self setAlign:0];
              *((unsigned char *)self + 256) &= ~1u;
            }
          }
          if ([(OADParagraphProperties *)self hasDefaultTab])
          {
            v46 = [(OADProperties *)self parent];
            [(OADParagraphProperties *)self defaultTab];
            float v48 = v47;
            [v46 defaultTab];
            if (v48 == v49)
            {
              [(OADParagraphProperties *)self setDefaultTab:0.0];
              *((unsigned char *)self + 255) &= ~0x40u;
            }
          }
          if ([(OADCharacterProperties *)self hasIsRightToLeft])
          {
            v50 = [(OADProperties *)self parent];
            int v51 = [(OADCharacterProperties *)self isRightToLeft];
            if (v51 == [v50 isRightToLeft])
            {
              [(OADCharacterProperties *)self setIsRightToLeft:0];
              *((unsigned char *)&self->super + 158) &= ~2u;
            }
          }
          if ([(OADParagraphProperties *)self hasWrap])
          {
            v52 = [(OADProperties *)self parent];
            int v53 = [(OADParagraphProperties *)self wrap];
            if (v53 == [v52 wrap])
            {
              [(OADParagraphProperties *)self setWrap:0];
              *((unsigned char *)self + 256) &= ~2u;
            }
          }
          if ([(OADParagraphProperties *)self hasFontAlign])
          {
            v54 = [(OADProperties *)self parent];
            int v55 = [(OADParagraphProperties *)self fontAlign];
            if (v55 == [v54 fontAlign])
            {
              [(OADParagraphProperties *)self setFontAlign:0];
              *((unsigned char *)self + 256) &= ~4u;
            }
          }
          if ([(OADParagraphProperties *)self hasIsLatinLineBreak])
          {
            v56 = [(OADProperties *)self parent];
            int v57 = [(OADParagraphProperties *)self isLatinLineBreak];
            if (v57 == [v56 isLatinLineBreak])
            {
              [(OADParagraphProperties *)self setIsLatinLineBreak:0];
              *((unsigned char *)self + 256) &= ~8u;
            }
          }
          if ([(OADParagraphProperties *)self hasIsHangingPunctuation])
          {
            v58 = [(OADProperties *)self parent];
            int v59 = [(OADParagraphProperties *)self isHangingPunctuation];
            if (v59 == [v58 isHangingPunctuation])
            {
              [(OADParagraphProperties *)self setIsHangingPunctuation:0];
              *((unsigned char *)self + 256) &= ~0x10u;
            }
          }
          if ([(OADParagraphProperties *)self hasBulletCharSet])
          {
            v60 = [(OADProperties *)self parent];
            int v61 = [(OADParagraphProperties *)self bulletCharSet];
            if (v61 == [v60 bulletCharSet])
            {
              [(OADParagraphProperties *)self setBulletCharSet:0];
              *((unsigned char *)self + 255) &= ~0x80u;
            }
          }
          if (![(OADParagraphProperties *)self hasBulletSize])
          {
LABEL_81:
            if (![(OADParagraphProperties *)self hasBulletColor]) {
              goto LABEL_89;
            }
            v69 = [(OADProperties *)self parent];
            v70 = [(OADParagraphProperties *)self bulletColor];
            v71 = [v69 bulletColor];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(objc_object *)v70 removeUnnecessaryOverrides];
              uint64_t v72 = objc_opt_class();
              if (v72 != objc_opt_class()) {
                goto LABEL_88;
              }
              uint64_t v73 = [(objc_object *)v70 isMergedWithParent];
              [(objc_object *)v70 setMergedWithParent:0];
              char v74 = [(objc_object *)v70 isAnythingOverridden];
              [(objc_object *)v70 setMergedWithParent:v73];
              if (v74) {
                goto LABEL_88;
              }
            }
            else if (!TCObjectEqual(v70, v71))
            {
LABEL_88:

LABEL_89:
              if (![(OADParagraphProperties *)self hasBulletFont]) {
                goto LABEL_97;
              }
              v76 = [(OADProperties *)self parent];
              v77 = [(OADParagraphProperties *)self bulletFont];
              v78 = [v76 bulletFont];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(objc_object *)v77 removeUnnecessaryOverrides];
                uint64_t v79 = objc_opt_class();
                if (v79 != objc_opt_class()) {
                  goto LABEL_96;
                }
                uint64_t v80 = [(objc_object *)v77 isMergedWithParent];
                [(objc_object *)v77 setMergedWithParent:0];
                char v81 = [(objc_object *)v77 isAnythingOverridden];
                [(objc_object *)v77 setMergedWithParent:v80];
                if (v81) {
                  goto LABEL_96;
                }
              }
              else if (!TCObjectEqual(v77, v78))
              {
LABEL_96:

LABEL_97:
                if (![(OADParagraphProperties *)self hasBulletProperties])
                {
LABEL_105:
                  [(OADProperties *)self setMerged:v4];
                  [(OADProperties *)self setMergedWithParent:v5];
                  v90.receiver = self;
                  v90.super_class = (Class)OADParagraphProperties;
                  [(OADCharacterProperties *)&v90 removeUnnecessaryOverrides];
                  return;
                }
                v83 = [(OADProperties *)self parent];
                v84 = [(OADParagraphProperties *)self bulletProperties];
                v85 = [v83 bulletProperties];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(objc_object *)v84 removeUnnecessaryOverrides];
                  uint64_t v86 = objc_opt_class();
                  if (v86 != objc_opt_class()) {
                    goto LABEL_104;
                  }
                  uint64_t v87 = [(objc_object *)v84 isMergedWithParent];
                  [(objc_object *)v84 setMergedWithParent:0];
                  char v88 = [(objc_object *)v84 isAnythingOverridden];
                  [(objc_object *)v84 setMergedWithParent:v87];
                  if (v88) {
                    goto LABEL_104;
                  }
                }
                else if (!TCObjectEqual(v84, v85))
                {
LABEL_104:

                  goto LABEL_105;
                }
                mBulletProperties = self->mBulletProperties;
                self->mBulletProperties = 0;

                goto LABEL_104;
              }
              mBulletFont = self->mBulletFont;
              self->mBulletFont = 0;

              goto LABEL_96;
            }
            mBulletColor = self->mBulletColor;
            self->mBulletColor = 0;

            goto LABEL_88;
          }
          v62 = [(OADProperties *)self parent];
          v63 = [(OADParagraphProperties *)self bulletSize];
          v64 = [v62 bulletSize];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(objc_object *)v63 removeUnnecessaryOverrides];
            uint64_t v65 = objc_opt_class();
            if (v65 != objc_opt_class()) {
              goto LABEL_80;
            }
            uint64_t v66 = [(objc_object *)v63 isMergedWithParent];
            [(objc_object *)v63 setMergedWithParent:0];
            char v67 = [(objc_object *)v63 isAnythingOverridden];
            [(objc_object *)v63 setMergedWithParent:v66];
            if (v67) {
              goto LABEL_80;
            }
          }
          else if (!TCObjectEqual(v63, v64))
          {
LABEL_80:

            goto LABEL_81;
          }
          mBulletSize = self->mBulletSize;
          self->mBulletSize = 0;

          goto LABEL_80;
        }
        v20 = [(OADProperties *)self parent];
        v21 = [(OADParagraphProperties *)self afterSpacing];
        v22 = [v20 afterSpacing];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(objc_object *)v21 removeUnnecessaryOverrides];
          uint64_t v23 = objc_opt_class();
          if (v23 != objc_opt_class()) {
            goto LABEL_25;
          }
          uint64_t v24 = [(objc_object *)v21 isMergedWithParent];
          [(objc_object *)v21 setMergedWithParent:0];
          char v25 = [(objc_object *)v21 isAnythingOverridden];
          [(objc_object *)v21 setMergedWithParent:v24];
          if (v25) {
            goto LABEL_25;
          }
        }
        else if (!TCObjectEqual(v21, v22))
        {
LABEL_25:

          goto LABEL_26;
        }
        mAfterSpacing = self->mAfterSpacing;
        self->mAfterSpacing = 0;

        goto LABEL_25;
      }
      mBeforeSpacing = self->mBeforeSpacing;
      self->mBeforeSpacing = 0;

      goto LABEL_17;
    }
    mLineSpacing = self->mLineSpacing;
    self->mLineSpacing = 0;

    goto LABEL_9;
  }
}

- (double)nonOveridenLeftMargin
{
  double result = 0.0;
  if ((*((unsigned char *)self + 255) & 8) != 0) {
    return self->mLeftMargin;
  }
  return result;
}

- (float)rightMargin
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasRightMargin];
  float v3 = v2[59];

  return v3;
}

- (int)bulletCharSet
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBulletCharSet];
  int v3 = v2[62];

  return v3;
}

- (id)tabStops
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasTabStops];
  id v3 = v2[28];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(OADProperties *)self isMerged];
    BOOL v7 = [(OADProperties *)self isMergedWithParent];
    uint64_t v8 = [v5 isMerged];
    uint64_t v9 = [v5 isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    [v5 setMerged:0];
    [v5 setMergedWithParent:0];
    unint64_t v10 = [(OADParagraphProperties *)self hash];
    if (v10 != [v5 hash]) {
      goto LABEL_62;
    }
    v77.receiver = self;
    v77.super_class = (Class)OADParagraphProperties;
    if (![(OADCharacterProperties *)&v77 isEqual:v5]) {
      goto LABEL_62;
    }
    int v11 = [v5 hasLineSpacing];
    if (v11 != [(OADParagraphProperties *)self hasLineSpacing]) {
      goto LABEL_62;
    }
    if ([v5 hasLineSpacing])
    {
      v12 = [v5 lineSpacing];
      v13 = [(OADParagraphProperties *)self lineSpacing];
      char v14 = [v12 isEqual:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v15 = [v5 hasBeforeSpacing];
    if (v15 != [(OADParagraphProperties *)self hasBeforeSpacing]) {
      goto LABEL_62;
    }
    if ([v5 hasBeforeSpacing])
    {
      uint64_t v16 = [v5 beforeSpacing];
      uint64_t v17 = [(OADParagraphProperties *)self beforeSpacing];
      char v18 = [v16 isEqual:v17];

      if ((v18 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v19 = [v5 hasAfterSpacing];
    if (v19 != [(OADParagraphProperties *)self hasAfterSpacing]) {
      goto LABEL_62;
    }
    if ([v5 hasAfterSpacing])
    {
      v20 = [v5 afterSpacing];
      v21 = [(OADParagraphProperties *)self afterSpacing];
      char v22 = [v20 isEqual:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v23 = [v5 hasTabStops];
    if (v23 != [(OADParagraphProperties *)self hasTabStops]) {
      goto LABEL_62;
    }
    if ([v5 hasTabStops])
    {
      uint64_t v24 = [v5 tabStops];
      char v25 = [(OADParagraphProperties *)self tabStops];
      char v26 = [v24 isEqualToArray:v25];

      if ((v26 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v27 = [v5 hasLeftMargin];
    if (v27 != [(OADParagraphProperties *)self hasLeftMargin]) {
      goto LABEL_62;
    }
    if ([v5 hasLeftMargin])
    {
      [v5 leftMargin];
      float v29 = v28;
      [(OADParagraphProperties *)self leftMargin];
      if (v29 != v30) {
        goto LABEL_62;
      }
    }
    int v31 = [v5 hasRightMargin];
    if (v31 != [(OADParagraphProperties *)self hasRightMargin]) {
      goto LABEL_62;
    }
    if ([v5 hasRightMargin])
    {
      [v5 rightMargin];
      float v33 = v32;
      [(OADParagraphProperties *)self rightMargin];
      if (v33 != v34) {
        goto LABEL_62;
      }
    }
    int v35 = [v5 hasLevel];
    if (v35 != [(OADParagraphProperties *)self hasLevel]) {
      goto LABEL_62;
    }
    if ([v5 hasLevel])
    {
      int v36 = [v5 level];
      if (v36 != [(OADParagraphProperties *)self level]) {
        goto LABEL_62;
      }
    }
    int v37 = [v5 hasIndent];
    if (v37 != [(OADParagraphProperties *)self hasIndent]) {
      goto LABEL_62;
    }
    if ([v5 hasIndent])
    {
      [v5 indent];
      float v39 = v38;
      [(OADParagraphProperties *)self indent];
      if (v39 != v40) {
        goto LABEL_62;
      }
    }
    int v41 = [v5 hasAlign];
    if (v41 != [(OADParagraphProperties *)self hasAlign]) {
      goto LABEL_62;
    }
    if ([v5 hasAlign])
    {
      int v42 = [v5 align];
      if (v42 != [(OADParagraphProperties *)self align]) {
        goto LABEL_62;
      }
    }
    int v43 = [v5 hasDefaultTab];
    if (v43 != [(OADParagraphProperties *)self hasDefaultTab]) {
      goto LABEL_62;
    }
    if ([v5 hasDefaultTab])
    {
      [v5 defaultTab];
      float v45 = v44;
      [(OADParagraphProperties *)self defaultTab];
      if (v45 != v46) {
        goto LABEL_62;
      }
    }
    int v47 = [v5 hasIsRightToLeft];
    if (v47 != [(OADCharacterProperties *)self hasIsRightToLeft]) {
      goto LABEL_62;
    }
    if ([v5 hasIsRightToLeft])
    {
      int v48 = [v5 isRightToLeft];
      if (v48 != [(OADCharacterProperties *)self isRightToLeft]) {
        goto LABEL_62;
      }
    }
    int v49 = [v5 hasWrap];
    if (v49 != [(OADParagraphProperties *)self hasWrap]) {
      goto LABEL_62;
    }
    if ([v5 hasWrap])
    {
      int v50 = [v5 wrap];
      if (v50 != [(OADParagraphProperties *)self wrap]) {
        goto LABEL_62;
      }
    }
    int v51 = [v5 hasFontAlign];
    if (v51 != [(OADParagraphProperties *)self hasFontAlign]) {
      goto LABEL_62;
    }
    if ([v5 hasFontAlign])
    {
      int v52 = [v5 fontAlign];
      if (v52 != [(OADParagraphProperties *)self fontAlign]) {
        goto LABEL_62;
      }
    }
    int v53 = [v5 hasIsLatinLineBreak];
    if (v53 != [(OADParagraphProperties *)self hasIsLatinLineBreak]) {
      goto LABEL_62;
    }
    if ([v5 hasIsLatinLineBreak])
    {
      int v54 = [v5 isLatinLineBreak];
      if (v54 != [(OADParagraphProperties *)self isLatinLineBreak]) {
        goto LABEL_62;
      }
    }
    int v55 = [v5 hasIsHangingPunctuation];
    if (v55 != [(OADParagraphProperties *)self hasIsHangingPunctuation]) {
      goto LABEL_62;
    }
    if ([v5 hasIsHangingPunctuation])
    {
      int v56 = [v5 isHangingPunctuation];
      if (v56 != [(OADParagraphProperties *)self isHangingPunctuation]) {
        goto LABEL_62;
      }
    }
    int v57 = [v5 hasBulletSize];
    if (v57 != [(OADParagraphProperties *)self hasBulletSize]) {
      goto LABEL_62;
    }
    if ([v5 hasBulletSize])
    {
      v58 = [v5 bulletSize];
      int v59 = [(OADParagraphProperties *)self bulletSize];
      char v60 = [v58 isEqual:v59];

      if ((v60 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v61 = [v5 hasBulletColor];
    if (v61 != [(OADParagraphProperties *)self hasBulletColor]) {
      goto LABEL_62;
    }
    if ([v5 hasBulletColor])
    {
      v62 = [v5 bulletColor];
      v63 = [(OADParagraphProperties *)self bulletColor];
      char v64 = [v62 isEqual:v63];

      if ((v64 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v65 = [v5 hasBulletFont];
    if (v65 != [(OADParagraphProperties *)self hasBulletFont]) {
      goto LABEL_62;
    }
    if ([v5 hasBulletFont])
    {
      uint64_t v66 = [v5 bulletFont];
      char v67 = [(OADParagraphProperties *)self bulletFont];
      char v68 = [v66 isEqual:v67];

      if ((v68 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v69 = [v5 hasBulletProperties];
    if (v69 != [(OADParagraphProperties *)self hasBulletProperties]) {
      goto LABEL_62;
    }
    if ([v5 hasBulletProperties])
    {
      v70 = [v5 bulletProperties];
      v71 = [(OADParagraphProperties *)self bulletProperties];
      char v72 = [v70 isEqual:v71];

      if ((v72 & 1) == 0) {
        goto LABEL_62;
      }
    }
    int v73 = [v5 hasBulletCharSet];
    if (v73 == [(OADParagraphProperties *)self hasBulletCharSet]
      && (![v5 hasBulletCharSet]
       || (int v76 = [v5 bulletCharSet], v76 == -[OADParagraphProperties bulletCharSet](self, "bulletCharSet"))))
    {
      BOOL v74 = 1;
    }
    else
    {
LABEL_62:
      BOOL v74 = 0;
    }
    [(OADProperties *)self setMerged:v6];
    [(OADProperties *)self setMergedWithParent:v7];
    [v5 setMerged:v8];
    [v5 setMergedWithParent:v9];
  }
  else
  {
    BOOL v74 = 0;
  }

  return v74;
}

- (unint64_t)hash
{
  uint64_t v3 = [(OADBulletSize *)self->mBulletSize hash];
  uint64_t v4 = [(OADBulletColor *)self->mBulletColor hash];
  uint64_t v5 = [(OADBulletFont *)self->mBulletFont hash];
  uint64_t v6 = [(OADBulletProperties *)self->mBulletProperties hash];
  uint64_t v7 = [(OADTextSpacing *)self->mLineSpacing hash];
  uint64_t v8 = [(OADTextSpacing *)self->mBeforeSpacing hash];
  uint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(OADTextSpacing *)self->mAfterSpacing hash];
  if ([(NSArray *)self->mTabStops count])
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      v12 = [(NSArray *)self->mTabStops objectAtIndex:v10];
      v9 ^= [v12 hash];

      uint64_t v10 = v11;
    }
    while ([(NSArray *)self->mTabStops count] > v11++);
  }
  unint64_t mLeftMargin = (unint64_t)self->mLeftMargin;
  unint64_t mRightMargin = (unint64_t)self->mRightMargin;
  unint64_t mIndent = (unint64_t)self->mIndent;
  unint64_t mDefaultTab = (unint64_t)self->mDefaultTab;
  uint64_t mLevel = self->mLevel;
  uint64_t v19 = LOBYTE(self->mBulletCharSet) ^ self->mFontAlign ^ self->mWrap ^ self->mAlign;
  uint64_t v20 = ((*((unsigned char *)self + 255) ^ (*((unsigned char *)&self->super + 158) >> 2)) ^ (*((unsigned char *)self + 255) >> 1)) & 1;
  v22.receiver = self;
  v22.super_class = (Class)OADParagraphProperties;
  return v9 ^ mLeftMargin ^ mRightMargin ^ mIndent ^ mDefaultTab ^ mLevel ^ v19 ^ [(OADCharacterProperties *)&v22 hash] ^ v20;
}

- (void)setTabStops:(id)a3
{
}

- (unsigned)wrap
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasWrap];
  unsigned __int8 v3 = v2[253];

  return v3;
}

- (unsigned)fontAlign
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFontAlign];
  unsigned __int8 v3 = v2[254];

  return v3;
}

- (BOOL)isLatinLineBreak
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsLatinLineBreak];
  BOOL v3 = v2[255] & 1;

  return v3;
}

- (BOOL)isHangingPunctuation
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsHangingPunctuation];
  BOOL v3 = (v2[255] >> 1) & 1;

  return v3;
}

void __43__OADParagraphProperties_defaultProperties__block_invoke()
{
  v0 = [[OADParagraphProperties alloc] initWithDefaults];
  v1 = (void *)+[OADParagraphProperties defaultProperties]::defaultProperties;
  +[OADParagraphProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADParagraphProperties;
  return [(OADCharacterProperties *)&v4 isAnythingOverridden]
      || [(OADParagraphProperties *)self hasLineSpacing]
      || [(OADParagraphProperties *)self hasBeforeSpacing]
      || [(OADParagraphProperties *)self hasAfterSpacing]
      || [(OADParagraphProperties *)self hasTabStops]
      || [(OADParagraphProperties *)self hasLeftMargin]
      || [(OADParagraphProperties *)self hasRightMargin]
      || [(OADParagraphProperties *)self hasLevel]
      || [(OADParagraphProperties *)self hasIndent]
      || [(OADParagraphProperties *)self hasAlign]
      || [(OADParagraphProperties *)self hasDefaultTab]
      || [(OADParagraphProperties *)self hasWrap]
      || [(OADParagraphProperties *)self hasFontAlign]
      || [(OADParagraphProperties *)self hasIsLatinLineBreak]
      || [(OADParagraphProperties *)self hasIsHangingPunctuation]
      || [(OADParagraphProperties *)self hasBulletSize]
      || [(OADParagraphProperties *)self hasBulletColor]
      || [(OADParagraphProperties *)self hasBulletFont]
      || [(OADParagraphProperties *)self hasBulletProperties]
      || [(OADParagraphProperties *)self hasBulletCharSet];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)OADParagraphProperties;
  [(OADCharacterProperties *)&v93 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ((*((unsigned char *)self + 255) & 4) != 0
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    int v6 = [(OADParagraphProperties *)self level];
    if (v6 == [v4 level])
    {
      *((unsigned char *)self + 255) &= ~4u;
    }
    else if ((*((unsigned char *)self + 255) & 4) == 0)
    {
      [(OADParagraphProperties *)self setLevel:[(OADParagraphProperties *)self level]];
    }
  }
  if ([(OADParagraphProperties *)self hasBulletSize]
    || ([(OADProperties *)self parent], id v7 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v7,
                                                 v7 != v4))
  {
    uint64_t v8 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBulletSize];

    if (v8)
    {
      uint64_t v9 = [(OADParagraphProperties *)self bulletSize];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [v4 possiblyInexistentOverrideForSelector:sel_hasBulletSize];

    if (v10)
    {
      unsigned int v11 = [v4 bulletSize];
    }
    else
    {
      unsigned int v11 = 0;
    }
    int v12 = TCObjectEqual(v9, v11);
    mBulletSize = self->mBulletSize;
    if (v12)
    {
      self->mBulletSize = 0;
    }
    else if (!mBulletSize && v8)
    {
      [(OADParagraphProperties *)self setBulletSize:v9];
    }
  }
  if ([(OADParagraphProperties *)self hasBulletColor]
    || ([(OADProperties *)self parent],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    int v15 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBulletColor];

    if (v15)
    {
      uint64_t v16 = [(OADParagraphProperties *)self bulletColor];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [v4 possiblyInexistentOverrideForSelector:sel_hasBulletColor];

    if (v17)
    {
      char v18 = [v4 bulletColor];
    }
    else
    {
      char v18 = 0;
    }
    int v19 = TCObjectEqual(v16, v18);
    mBulletColor = self->mBulletColor;
    if (v19)
    {
      self->mBulletColor = 0;
    }
    else if (!mBulletColor && v15)
    {
      [(OADParagraphProperties *)self setBulletColor:v16];
    }
  }
  if ([(OADParagraphProperties *)self hasBulletFont]
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    objc_super v22 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBulletFont];

    if (v22)
    {
      int v23 = [(OADParagraphProperties *)self bulletFont];
    }
    else
    {
      int v23 = 0;
    }
    uint64_t v24 = [v4 possiblyInexistentOverrideForSelector:sel_hasBulletFont];

    if (v24)
    {
      char v25 = [v4 bulletFont];
    }
    else
    {
      char v25 = 0;
    }
    int v26 = TCObjectEqual(v23, v25);
    mBulletFont = self->mBulletFont;
    if (v26)
    {
      self->mBulletFont = 0;
    }
    else if (!mBulletFont && v22)
    {
      [(OADParagraphProperties *)self setBulletFont:v23];
    }
  }
  if ([(OADParagraphProperties *)self hasBulletProperties]
    || ([(OADProperties *)self parent],
        id v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    float v29 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBulletProperties];

    if (v29)
    {
      float v30 = [(OADParagraphProperties *)self bulletProperties];
    }
    else
    {
      float v30 = 0;
    }
    int v31 = [v4 possiblyInexistentOverrideForSelector:sel_hasBulletProperties];

    if (v31)
    {
      float v32 = [v4 bulletProperties];
    }
    else
    {
      float v32 = 0;
    }
    int v33 = TCObjectEqual(v30, v32);
    mBulletProperties = self->mBulletProperties;
    if (v33)
    {
      self->mBulletProperties = 0;
    }
    else if (!mBulletProperties && v29)
    {
      [(OADParagraphProperties *)self setBulletProperties:v30];
    }
  }
  if ([(OADParagraphProperties *)self hasLineSpacing]
    || ([(OADProperties *)self parent],
        id v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    int v36 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasLineSpacing];

    if (v36)
    {
      int v37 = [(OADParagraphProperties *)self lineSpacing];
    }
    else
    {
      int v37 = 0;
    }
    float v38 = [v4 possiblyInexistentOverrideForSelector:sel_hasLineSpacing];

    if (v38)
    {
      float v39 = [v4 lineSpacing];
    }
    else
    {
      float v39 = 0;
    }
    int v40 = TCObjectEqual(v37, v39);
    mLineSpacing = self->mLineSpacing;
    if (v40)
    {
      self->mLineSpacing = 0;
    }
    else if (!mLineSpacing && v36)
    {
      [(OADParagraphProperties *)self setLineSpacing:v37];
    }
  }
  if ([(OADParagraphProperties *)self hasBeforeSpacing]
    || ([(OADProperties *)self parent],
        id v42 = (id)objc_claimAutoreleasedReturnValue(),
        v42,
        v42 != v4))
  {
    int v43 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasBeforeSpacing];

    if (v43)
    {
      float v44 = [(OADParagraphProperties *)self beforeSpacing];
    }
    else
    {
      float v44 = 0;
    }
    float v45 = [v4 possiblyInexistentOverrideForSelector:sel_hasBeforeSpacing];

    if (v45)
    {
      float v46 = [v4 beforeSpacing];
    }
    else
    {
      float v46 = 0;
    }
    int v47 = TCObjectEqual(v44, v46);
    mBeforeSpacing = self->mBeforeSpacing;
    if (v47)
    {
      self->mBeforeSpacing = 0;
    }
    else if (!mBeforeSpacing && v43)
    {
      [(OADParagraphProperties *)self setBeforeSpacing:v44];
    }
  }
  if ([(OADParagraphProperties *)self hasAfterSpacing]
    || ([(OADProperties *)self parent],
        id v49 = (id)objc_claimAutoreleasedReturnValue(),
        v49,
        v49 != v4))
  {
    int v50 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasAfterSpacing];

    if (v50)
    {
      int v51 = [(OADParagraphProperties *)self afterSpacing];
    }
    else
    {
      int v51 = 0;
    }
    int v52 = [v4 possiblyInexistentOverrideForSelector:sel_hasAfterSpacing];

    if (v52)
    {
      int v53 = [v4 afterSpacing];
    }
    else
    {
      int v53 = 0;
    }
    int v54 = TCObjectEqual(v51, v53);
    mAfterSpacing = self->mAfterSpacing;
    if (v54)
    {
      self->mAfterSpacing = 0;
    }
    else if (!mAfterSpacing && v50)
    {
      [(OADParagraphProperties *)self setAfterSpacing:v51];
    }
  }
  if ([(OADParagraphProperties *)self hasTabStops]
    || ([(OADProperties *)self parent],
        id v56 = (id)objc_claimAutoreleasedReturnValue(),
        v56,
        v56 != v4))
  {
    int v57 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasTabStops];

    if (v57)
    {
      v58 = [(OADParagraphProperties *)self tabStops];
    }
    else
    {
      v58 = 0;
    }
    int v59 = [v4 possiblyInexistentOverrideForSelector:sel_hasTabStops];

    if (v59)
    {
      char v60 = [v4 tabStops];
    }
    else
    {
      char v60 = 0;
    }
    int v61 = TCObjectEqual(v58, v60);
    mTabStops = self->mTabStops;
    if (v61)
    {
      self->mTabStops = 0;
    }
    else if (!mTabStops && v57)
    {
      [(OADParagraphProperties *)self setTabStops:v58];
    }
  }
  if ((*((unsigned char *)self + 255) & 8) != 0
    || ([(OADProperties *)self parent],
        id v63 = (id)objc_claimAutoreleasedReturnValue(),
        v63,
        v63 != v4))
  {
    [(OADParagraphProperties *)self leftMargin];
    float v65 = v64;
    [v4 leftMargin];
    if (v65 == v66)
    {
      *((unsigned char *)self + 255) &= ~8u;
    }
    else if ((*((unsigned char *)self + 255) & 8) == 0)
    {
      [(OADParagraphProperties *)self leftMargin];
      -[OADParagraphProperties setLeftMargin:](self, "setLeftMargin:");
    }
  }
  if ((*((unsigned char *)self + 255) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v67 = (id)objc_claimAutoreleasedReturnValue(),
        v67,
        v67 != v4))
  {
    [(OADParagraphProperties *)self rightMargin];
    float v69 = v68;
    [v4 rightMargin];
    if (v69 == v70)
    {
      *((unsigned char *)self + 255) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 255) & 0x10) == 0)
    {
      [(OADParagraphProperties *)self rightMargin];
      -[OADParagraphProperties setRightMargin:](self, "setRightMargin:");
    }
  }
  if ((*((unsigned char *)self + 255) & 0x20) != 0
    || ([(OADProperties *)self parent],
        id v71 = (id)objc_claimAutoreleasedReturnValue(),
        v71,
        v71 != v4))
  {
    [(OADParagraphProperties *)self indent];
    float v73 = v72;
    [v4 indent];
    if (v73 == v74)
    {
      *((unsigned char *)self + 255) &= ~0x20u;
    }
    else if ((*((unsigned char *)self + 255) & 0x20) == 0)
    {
      [(OADParagraphProperties *)self indent];
      -[OADParagraphProperties setIndent:](self, "setIndent:");
    }
  }
  if ((*((unsigned char *)self + 255) & 0x40) != 0
    || ([(OADProperties *)self parent],
        id v75 = (id)objc_claimAutoreleasedReturnValue(),
        v75,
        v75 != v4))
  {
    [(OADParagraphProperties *)self defaultTab];
    float v77 = v76;
    [v4 defaultTab];
    if (v77 == v78)
    {
      *((unsigned char *)self + 255) &= ~0x40u;
    }
    else if ((*((unsigned char *)self + 255) & 0x40) == 0)
    {
      [(OADParagraphProperties *)self defaultTab];
      -[OADParagraphProperties setDefaultTab:](self, "setDefaultTab:");
    }
  }
  if (*((char *)self + 255) < 0
    || ([(OADProperties *)self parent],
        id v79 = (id)objc_claimAutoreleasedReturnValue(),
        v79,
        v79 != v4))
  {
    int v80 = [(OADParagraphProperties *)self bulletCharSet];
    int v81 = [v4 bulletCharSet];
    int v82 = *((char *)self + 255);
    if (v80 == v81)
    {
      *((unsigned char *)self + 255) = v82 & 0x7F;
    }
    else if ((v82 & 0x80000000) == 0)
    {
      [(OADParagraphProperties *)self setBulletCharSet:[(OADParagraphProperties *)self bulletCharSet]];
    }
  }
  if ((*((unsigned char *)self + 256) & 1) != 0
    || ([(OADProperties *)self parent],
        id v83 = (id)objc_claimAutoreleasedReturnValue(),
        v83,
        v83 != v4))
  {
    int v84 = [(OADParagraphProperties *)self align];
    if (v84 == [v4 align])
    {
      *((unsigned char *)self + 256) &= ~1u;
    }
    else if ((*((unsigned char *)self + 256) & 1) == 0)
    {
      [(OADParagraphProperties *)self setAlign:[(OADParagraphProperties *)self align]];
    }
  }
  if ((*((unsigned char *)self + 256) & 2) != 0
    || ([(OADProperties *)self parent],
        id v85 = (id)objc_claimAutoreleasedReturnValue(),
        v85,
        v85 != v4))
  {
    int v86 = [(OADParagraphProperties *)self wrap];
    if (v86 == [v4 wrap])
    {
      *((unsigned char *)self + 256) &= ~2u;
    }
    else if ((*((unsigned char *)self + 256) & 2) == 0)
    {
      [(OADParagraphProperties *)self setWrap:[(OADParagraphProperties *)self wrap]];
    }
  }
  if ((*((unsigned char *)self + 256) & 4) != 0
    || ([(OADProperties *)self parent],
        id v87 = (id)objc_claimAutoreleasedReturnValue(),
        v87,
        v87 != v4))
  {
    int v88 = [(OADParagraphProperties *)self fontAlign];
    if (v88 == [v4 fontAlign])
    {
      *((unsigned char *)self + 256) &= ~4u;
    }
    else if ((*((unsigned char *)self + 256) & 4) == 0)
    {
      [(OADParagraphProperties *)self setFontAlign:[(OADParagraphProperties *)self fontAlign]];
    }
  }
  if ((*((unsigned char *)self + 256) & 8) != 0
    || ([(OADProperties *)self parent],
        id v89 = (id)objc_claimAutoreleasedReturnValue(),
        v89,
        v89 != v4))
  {
    int v90 = [(OADParagraphProperties *)self isLatinLineBreak];
    if (v90 == [v4 isLatinLineBreak])
    {
      *((unsigned char *)self + 256) &= ~8u;
    }
    else if ((*((unsigned char *)self + 256) & 8) == 0)
    {
      [(OADParagraphProperties *)self setIsLatinLineBreak:[(OADParagraphProperties *)self isLatinLineBreak]];
    }
  }
  if ((*((unsigned char *)self + 256) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v91 = (id)objc_claimAutoreleasedReturnValue(),
        v91,
        v91 != v4))
  {
    int v92 = [(OADParagraphProperties *)self isHangingPunctuation];
    if (v92 == [v4 isHangingPunctuation])
    {
      *((unsigned char *)self + 256) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 256) & 0x10) == 0)
    {
      [(OADParagraphProperties *)self setIsHangingPunctuation:[(OADParagraphProperties *)self isHangingPunctuation]];
    }
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADParagraphProperties;
  v2 = [(OADCharacterProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTabStops, 0);
  objc_storeStrong((id *)&self->mAfterSpacing, 0);
  objc_storeStrong((id *)&self->mBeforeSpacing, 0);
  objc_storeStrong((id *)&self->mLineSpacing, 0);
  objc_storeStrong((id *)&self->mBulletProperties, 0);
  objc_storeStrong((id *)&self->mBulletFont, 0);
  objc_storeStrong((id *)&self->mBulletColor, 0);
  objc_storeStrong((id *)&self->mBulletSize, 0);
}

@end