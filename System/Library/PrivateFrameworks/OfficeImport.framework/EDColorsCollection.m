@interface EDColorsCollection
+ (BOOL)isSystemColorId:(unint64_t)a3;
+ (int)oadSchemeColorIdFromThemeIndex:(int)a3;
+ (int)systemColorIdFromIndex:(unint64_t)a3;
+ (unsigned)xlColorIndexFromTCSystemColorIDEnum:(int)a3;
- (EDColorsCollection)initWithDefaultSetup:(BOOL)a3;
- (NSString)description;
- (const)defaultPalette;
- (unint64_t)addOrEquivalentColorExcludingDefaults:(id)a3;
- (unint64_t)defaultColorsCount;
- (void)addColors:(const unsigned int *)a3 count:(unsigned int)a4 defaultColors:(const unsigned int *)a5 defaultCount:(unsigned int)a6;
- (void)addPalette:(const unsigned int *)a3 paletteSize:(unsigned int)a4 paletteX:(const unsigned int *)a5 paletteXSize:(unsigned int)a6;
- (void)setupDefaults;
@end

@implementation EDColorsCollection

- (EDColorsCollection)initWithDefaultSetup:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDColorsCollection;
  v4 = [(EDCollection *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mDefaultColorsCount = 0;
    if (v3) {
      [(EDColorsCollection *)v4 setupDefaults];
    }
  }
  return v5;
}

- (void)setupDefaults
{
  BOOL v3 = +[OITSUColor colorWithBGRValue:0];
  [(EDCollection *)self addObject:v3];

  v4 = +[OITSUColor colorWithBGRValue:0xFFFFFFLL];
  [(EDCollection *)self addObject:v4];

  v5 = +[OITSUColor colorWithBGRValue:255];
  [(EDCollection *)self addObject:v5];

  v6 = +[OITSUColor colorWithBGRValue:65280];
  [(EDCollection *)self addObject:v6];

  objc_super v7 = +[OITSUColor colorWithBGRValue:16711680];
  [(EDCollection *)self addObject:v7];

  v8 = +[OITSUColor colorWithBGRValue:0xFFFFLL];
  [(EDCollection *)self addObject:v8];

  v9 = +[OITSUColor colorWithBGRValue:16711935];
  [(EDCollection *)self addObject:v9];

  v10 = +[OITSUColor colorWithBGRValue:16776960];
  [(EDCollection *)self addObject:v10];

  self->mDefaultColorsCount = [(EDCollection *)self count];
}

+ (BOOL)isSystemColorId:(unint64_t)a3
{
  return a3 > 0x3F && a3 - 80 < 0xFFFFFFFFFFFFFFFDLL;
}

+ (int)systemColorIdFromIndex:(unint64_t)a3
{
  uint64_t v3 = 0;
  while ((unsigned __int16)systemColorArray[v3] != a3)
  {
    v3 += 4;
    if (v3 == 76) {
      return 0;
    }
  }
  return *(_DWORD *)&systemColorArray[v3 + 2];
}

- (void)addPalette:(const unsigned int *)a3 paletteSize:(unsigned int)a4 paletteX:(const unsigned int *)a5 paletteXSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  [(EDColorsCollection *)self addColors:a3 count:*(void *)&a4 defaultColors:[(EDColorsCollection *)self defaultPalette] defaultCount:56];
  for (uint64_t i = 64; i != 77; ++i)
  {
    v10 = +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", [(id)objc_opt_class() systemColorIdFromIndex:i]);
    [(EDCollection *)self addObject:v10];
  }
  -[EDColorsCollection addColors:count:defaultColors:defaultCount:](self, "addColors:count:defaultColors:defaultCount:", a5, v6, &-[EDColorsCollection addPalette:paletteSize:paletteX:paletteXSize:]::defaultPaletteX, 3);
  for (uint64_t j = 80; j != 82; ++j)
  {
    v12 = +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", [(id)objc_opt_class() systemColorIdFromIndex:j]);
    [(EDCollection *)self addObject:v12];
  }
}

- (const)defaultPalette
{
  return (const unsigned int *)&-[EDColorsCollection defaultPalette]::defPalette;
}

- (void)addColors:(const unsigned int *)a3 count:(unsigned int)a4 defaultColors:(const unsigned int *)a5 defaultCount:(unsigned int)a6
{
  if (a4 >= a6) {
    unsigned int v9 = a6;
  }
  else {
    unsigned int v9 = a4;
  }
  if (a3) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a6;
  }
  if (a3) {
    v11 = a3;
  }
  else {
    v11 = a5;
  }
  if (v10)
  {
    uint64_t v12 = v10;
    do
    {
      unsigned int v13 = *v11++;
      v14 = +[OITSUColor colorWithBGRValue:v13];
      [(EDCollection *)self addObject:v14];

      --v12;
    }
    while (v12);
  }
  BOOL v15 = a6 >= v10;
  int v16 = a6 - v10;
  if (v16 != 0 && v15)
  {
    v17 = &a5[v10];
    do
    {
      unsigned int v18 = *v17++;
      v19 = +[OITSUColor colorWithBGRValue:v18];
      [(EDCollection *)self addObject:v19];

      --v16;
    }
    while (v16);
  }
}

- (unint64_t)addOrEquivalentColorExcludingDefaults:(id)a3
{
  id v4 = a3;
  v5 = [OITSUColor alloc];
  [v4 redComponent];
  double v7 = v6;
  [v4 greenComponent];
  double v9 = v8;
  [v4 blueComponent];
  double v11 = v10;
  [v4 alphaComponent];
  unsigned int v13 = [(OITSUColor *)v5 initWithRed:v7 green:v9 blue:v11 alpha:v12];
  unint64_t v14 = [(EDCollection *)self count];
  unint64_t mDefaultColorsCount = self->mDefaultColorsCount;
  if (mDefaultColorsCount >= v14)
  {
LABEL_4:
    unint64_t mDefaultColorsCount = [(EDCollection *)self addObject:v13];
  }
  else
  {
    while (1)
    {
      int v16 = [(EDCollection *)self objectAtIndex:mDefaultColorsCount];
      BOOL v17 = [(OITSUColor *)v13 isEqual:v16];

      if (v17) {
        break;
      }
      if (v14 == ++mDefaultColorsCount) {
        goto LABEL_4;
      }
    }
  }

  return mDefaultColorsCount;
}

+ (int)oadSchemeColorIdFromThemeIndex:(int)a3
{
  if (a3 > 0xC) {
    return -1;
  }
  else {
    return dword_238EDF6B4[a3];
  }
}

- (unint64_t)defaultColorsCount
{
  return self->mDefaultColorsCount;
}

+ (unsigned)xlColorIndexFromTCSystemColorIDEnum:(int)a3
{
  uint64_t v3 = 0;
  while (*(_DWORD *)&systemColorArray[v3 + 2] != a3)
  {
    v3 += 4;
    if (v3 == 76) {
      return -1;
    }
  }
  return (unsigned __int16)systemColorArray[v3];
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDColorsCollection;
  v2 = [(EDCollection *)&v4 description];
  return (NSString *)v2;
}

@end