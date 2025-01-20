@interface OADColor
+ (float)alphaWithColor:(id)a3;
+ (id)basicMapOfColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6;
+ (id)mapAdjustedColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6;
+ (id)rgbColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6;
+ (id)tsuColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6;
+ (id)tsuColorWithRed:(float)a3 green:(float)a4 blue:(float)a5;
+ (id)tsuColorWithRgbColor:(id)a3;
+ (int)mapSchemeColorID:(int)a3 colorMap:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)transforms;
- (unint64_t)hash;
- (void)addTransform:(id)a3;
- (void)addTransformOfType:(int)a3;
- (void)addTransformOfType:(int)a3 value:(float)a4;
- (void)setTransforms:(id)a3;
@end

@implementation OADColor

- (void)setTransforms:(id)a3
{
  id v4 = a3;
  mTransforms = self->mTransforms;
  id v8 = v4;
  if (v4 && !mTransforms)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->mTransforms;
    self->mTransforms = v6;

    mTransforms = self->mTransforms;
    id v4 = v8;
  }
  [(NSMutableArray *)mTransforms setArray:v4];
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->mTransforms count];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    mTransforms = self->mTransforms;
    v7 = [v5 transforms];
    LOBYTE(mTransforms) = (mTransforms == 0) ^ (v7 != 0);

    if ((mTransforms & 1) != 0
      && ((id v8 = self->mTransforms) == 0
       || ([v5 transforms],
           v9 = objc_claimAutoreleasedReturnValue(),
           char v10 = [(NSMutableArray *)v8 isEqualToArray:v9],
           v9,
           (v10 & 1) != 0)))
    {
      unint64_t v11 = [(OADColor *)self hash];
      BOOL v12 = v11 == [v5 hash];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)transforms
{
  return self->mTransforms;
}

+ (id)tsuColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10 = a3;
  unint64_t v11 = +[OADColor rgbColorWithColor:v10 colorMap:a4 colorScheme:a5 colorPalette:a6];
  [a1 alphaWithColor:v10];
  float v13 = v12;
  [v11 red];
  float v15 = v14;
  [v11 green];
  float v17 = v16;
  [v11 blue];
  v19 = +[OITSUColor colorWithCalibratedRed:v15 green:v17 blue:v18 alpha:v13];

  return v19;
}

+ (id)rgbColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10 = a3;
  unint64_t v11 = [a1 basicMapOfColor:v10 colorMap:a4 colorScheme:a5 colorPalette:a6];
  float v12 = [v10 transforms];
  float v13 = +[OADColorTransform colorByApplyingTransforms:v12 toColor:v11];

  return v13;
}

+ (id)basicMapOfColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v10;
LABEL_5:
    float v14 = v15;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v12, "colorForIndex:", objc_msgSend(a1, "mapSchemeColorID:colorMap:", objc_msgSend(v10, "schemeColorIndex"), v11));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [a1 basicMapOfColor:v16 colorMap:v11 colorScheme:v12 colorPalette:v13];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v10;
      float v18 = +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", [v16 systemColorID]);
      float v14 = +[OADRgbColor rgbColorWithTSUColor:v18];

      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [a1 mapAdjustedColor:v10 colorMap:v11 colorScheme:v12 colorPalette:v13];
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      float v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v13, "colorWithIndex:", objc_msgSend(v10, "index"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = +[OADRgbColor rgbColorWithTSUColor:v16];
  }
  float v14 = (void *)v17;
LABEL_11:

LABEL_12:
  return v14;
}

+ (float)alphaWithColor:(id)a3
{
  v3 = [a3 transforms];
  LODWORD(v4) = 1.0;
  +[OADColorTransform alphaByApplyingTransforms:v3 toAlpha:v4];
  float v6 = v5;

  return v6;
}

+ (id)mapAdjustedColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  float v14 = [v10 baseColor];
  id v15 = [a1 basicMapOfColor:v14 colorMap:v11 colorScheme:v12 colorPalette:v13];
  unsigned int v16 = [v15 redByte];
  unsigned int v17 = [v15 greenByte];
  unsigned int v18 = [v15 blueByte];
  if ([v10 gray])
  {
    unsigned int v16 = (int)sqrt((double)(v16 * v16 + v17 * v17 + v18 * v18));
    unsigned int v17 = v16;
    unsigned int v18 = v16;
  }
  unsigned int v19 = [v10 adjustmentParam];
  switch([v10 adjustmentType])
  {
    case 1u:
      unsigned int v16 = (32897 * v19 * v16) >> 23;
      unsigned int v17 = (32897 * v19 * v17) >> 23;
      unsigned int v18 = (32897 * v19 * v18) >> 23;
      break;
    case 2u:
      unsigned int v16 = ~((32897 * v19 * (v16 ^ 0xFF)) >> 23);
      unsigned int v17 = ~((32897 * v19 * (v17 ^ 0xFF)) >> 23);
      unsigned int v18 = ~((32897 * v19 * (v18 ^ 0xFF)) >> 23);
      break;
    case 3u:
      if (v19 + v16 >= 0xFF) {
        LOBYTE(v16) = -1;
      }
      else {
        LOBYTE(v16) = v19 + v16;
      }
      if (v19 + v17 >= 0xFF) {
        LOBYTE(v17) = -1;
      }
      else {
        LOBYTE(v17) = v19 + v17;
      }
      if (v19 + v18 >= 0xFF) {
        LOBYTE(v18) = -1;
      }
      else {
        LOBYTE(v18) = v19 + v18;
      }
      break;
    case 4u:
      unsigned int v16 = (v16 - v19) & ((int)(v16 - v19) >> 31);
      unsigned int v17 = (v17 - v19) & ((int)(v17 - v19) >> 31);
      unsigned int v18 = (v18 - v19) & ((int)(v18 - v19) >> 31);
      break;
    case 5u:
      unsigned int v16 = (v19 - v16) & ~((int)(v19 - v16) >> 31);
      unsigned int v17 = (v19 - v17) & ~((int)(v19 - v17) >> 31);
      unsigned int v18 = (v19 - v18) & ~((int)(v19 - v18) >> 31);
      break;
    case 6u:
      if (v16 >= v19 || v17 >= v19 || v18 >= v19)
      {
        LOBYTE(v16) = -1;
        LOBYTE(v17) = -1;
        LOBYTE(v18) = -1;
      }
      else
      {
        LOBYTE(v16) = 0;
        LOBYTE(v17) = 0;
        LOBYTE(v18) = 0;
      }
      break;
    default:
      break;
  }
  int v20 = [v10 invert];
  int v21 = [v10 invert128];
  int v25 = v20 << 31 >> 31;
  unsigned __int8 v26 = v18 ^ v25;
  unsigned __int8 v27 = v17 ^ v25;
  unsigned __int8 v28 = v16 ^ v25;
  if (v21)
  {
    v28 ^= 0x80u;
    v27 ^= 0x80u;
    v26 ^= 0x80u;
  }
  *(float *)&double v22 = (float)v28;
  *(float *)&double v23 = (float)v27;
  *(float *)&double v24 = (float)v26;
  v29 = +[OADRgbColor rgbColorWithRedByte:v22 greenByte:v23 blueByte:v24];

  return v29;
}

- (void)addTransform:(id)a3
{
  id v4 = a3;
  mTransforms = self->mTransforms;
  id v8 = v4;
  if (!mTransforms)
  {
    float v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->mTransforms;
    self->mTransforms = v6;

    mTransforms = self->mTransforms;
    id v4 = v8;
  }
  [(NSMutableArray *)mTransforms addObject:v4];
}

- (void)addTransformOfType:(int)a3 value:(float)a4
{
  v7 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:*(void *)&a3];
  *(float *)&double v6 = a4;
  [(OADValueColorTransform *)v7 setValue:v6];
  [(OADColor *)self addTransform:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)addTransformOfType:(int)a3
{
  id v4 = [[OADColorTransform alloc] initWithType:*(void *)&a3];
  -[OADColor addTransform:](self, "addTransform:");
}

+ (id)tsuColorWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  return +[OITSUColor colorWithCalibratedRed:a3 green:a4 blue:a5 alpha:1.0];
}

+ (id)tsuColorWithRgbColor:(id)a3
{
  id v4 = a3;
  [v4 red];
  int v6 = v5;
  [v4 green];
  int v8 = v7;
  [v4 blue];
  LODWORD(v10) = v9;
  LODWORD(v11) = v6;
  LODWORD(v12) = v8;
  id v13 = [a1 tsuColorWithRed:v11 green:v12 blue:v10];

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADColor;
  v2 = [(OADColor *)&v4 description];
  return v2;
}

+ (int)mapSchemeColorID:(int)a3 colorMap:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  int v6 = v5;
  int v7 = v4 - 12;
  if ((v4 - 12) >= 4)
  {
    if (v5)
    {
      if (v4 < 0xC)
      {
        int v7 = [v5 mappingForIndex:v4];
        goto LABEL_8;
      }
    }
    else if (v4 <= 0xB)
    {
      int v7 = dword_238EDC2D8[(int)v4];
      goto LABEL_8;
    }
    int v7 = -1;
  }
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
}

@end