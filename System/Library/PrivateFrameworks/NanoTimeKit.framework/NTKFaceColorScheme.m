@interface NTKFaceColorScheme
+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 foregroundColor:(id)a5 units:(unint64_t)a6 alternateHighlight:(BOOL)a7;
+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 units:(unint64_t)a5;
+ (id)interpolationForDevice:(id)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 fraction:(double)a6 units:(unint64_t)a7 brightenUnits:(unint64_t)a8 overrideColor:(id)a9 alternateHighlight:(BOOL)a10;
+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5;
+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5 brightenUnits:(unint64_t)a6;
- (BOOL)containsOverrideFaceColor;
- (BOOL)isEqual:(id)a3;
- (CLKDevice)device;
- (NSArray)faceColors;
- (NTKFaceColorPalette)faceColorPalette;
- (UIColor)accentColor;
- (UIColor)activityTickColor;
- (UIColor)alternativeTickColor;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (UIColor)secondaryForegroundColor;
- (UIColor)shiftedBackgroundColor;
- (UIColor)shiftedForegroundColor;
- (UIColor)stackedImagesForegroundColor;
- (UIColor)tickColor;
- (UIColor)upNextTextColor;
- (double)multicolorAlpha;
- (id)_colorForUnit:(unint64_t)a3;
- (id)initForDevice:(id)a3;
- (unint64_t)units;
- (void)_setColor:(id)a3 forUnit:(unint64_t)a4;
- (void)setContainsOverrideFaceColor:(BOOL)a3;
- (void)setFaceColorPalette:(id)a3;
- (void)setFaceColors:(id)a3;
- (void)setMulticolorAlpha:(double)a3;
@end

@implementation NTKFaceColorScheme

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceColorScheme;
  v6 = [(NTKFaceColorScheme *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    colorsByUnit = v7->_colorsByUnit;
    v7->_colorsByUnit = v8;
  }
  return v7;
}

+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 units:(unint64_t)a5
{
  return +[NTKFaceColorScheme colorSchemeForDevice:a3 withFaceColorPalette:a4 foregroundColor:0 units:a5 alternateHighlight:0];
}

+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 foregroundColor:(id)a5 units:(unint64_t)a6 alternateHighlight:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    if ([v12 isMulticolor]) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    id v13 = [v12 primaryColor];
    }
  }
  if ([v12 isWhite])
  {
    unsigned int v14 = [v12 isMulticolor];
  }
  else
  {
    v15 = [MEMORY[0x1E4FB1618] whiteColor];
    char v16 = [v13 isEqual:v15];

    unsigned int v14 = [v12 isMulticolor];
    if ((v16 & 1) == 0)
    {
      v18 = [MEMORY[0x1E4FB1618] whiteColor];
      char v17 = 0;
      goto LABEL_11;
    }
  }
  char v17 = 1;
  v18 = NTKSecondaryForegroundGrayColor();
LABEL_11:
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __105__NTKFaceColorScheme_colorSchemeForDevice_withFaceColorPalette_foregroundColor_units_alternateHighlight___block_invoke;
  v32 = &unk_1E62C3B38;
  BOOL v37 = a7;
  id v28 = v18;
  id v33 = v28;
  id v19 = v13;
  id v34 = v19;
  id v20 = v12;
  id v35 = v20;
  char v38 = v17;
  id v21 = v11;
  id v36 = v21;
  char v39 = v14;
  v22 = (void (**)(void *, unint64_t))_Block_copy(&aBlock);
  id v23 = [[NTKFaceColorScheme alloc] initForDevice:v21];
  unint64_t v24 = 1;
  do
  {
    if ((v24 & a6) != 0)
    {
      v25 = v22[2](v22, v24);
      objc_msgSend(v23, "_setColor:forUnit:", v25, v24, v28, aBlock, v30, v31, v32, v33, v34, v35);
    }
    BOOL v26 = v24 >= 0x201;
    v24 *= 2;
  }
  while (!v26);
  [v23 setMulticolorAlpha:(double)v14];
  objc_msgSend(v23, "setContainsOverrideFaceColor:", objc_msgSend(v20, "isMulticolor"));
  [v23 setFaceColorPalette:v20];

  return v23;
}

id __105__NTKFaceColorScheme_colorSchemeForDevice_withFaceColorPalette_foregroundColor_units_alternateHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  if (a2 <= 63)
  {
    switch(a2)
    {
      case 1:
        BOOL v4 = *(unsigned char *)(a1 + 64) == 0;
        uint64_t v5 = 32;
        uint64_t v6 = 40;
        goto LABEL_18;
      case 2:
        BOOL v4 = *(unsigned char *)(a1 + 64) == 0;
        uint64_t v5 = 40;
        uint64_t v6 = 32;
LABEL_18:
        if (v4) {
          uint64_t v5 = v6;
        }
        v7 = *(void **)(a1 + v5);
        goto LABEL_31;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_32;
      case 4:
        id v3 = [*(id *)(a1 + 48) secondaryColor];
        goto LABEL_32;
      case 8:
        if (!*(unsigned char *)(a1 + 65)) {
          goto LABEL_29;
        }
        id v3 = [MEMORY[0x1E4FB1618] lightGrayColor];
        goto LABEL_32;
      default:
        if (a2 == 16)
        {
          id v3 = [*(id *)(a1 + 48) primaryShiftedColor];
        }
        else if (a2 == 32)
        {
          id v3 = [*(id *)(a1 + 48) secondaryShiftedColor];
        }
        goto LABEL_32;
    }
  }
  if (a2 <= 255)
  {
    if (a2 == 64)
    {
      if (!*(unsigned char *)(a1 + 66))
      {
        v7 = *(void **)(a1 + 32);
LABEL_31:
        id v3 = v7;
        goto LABEL_32;
      }
    }
    else
    {
      if (a2 != 128) {
        goto LABEL_32;
      }
      if (([*(id *)(a1 + 48) isZeus] & 1) != 0
        || [*(id *)(a1 + 48) isVictory])
      {
        id v3 = [*(id *)(a1 + 48) primaryColor];
        goto LABEL_32;
      }
    }
LABEL_27:
    id v3 = [MEMORY[0x1E4FB1618] whiteColor];
    goto LABEL_32;
  }
  switch(a2)
  {
    case 256:
      goto LABEL_27;
    case 512:
      if ([*(id *)(a1 + 48) isWhite])
      {
        id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.45 alpha:1.0];
        break;
      }
LABEL_29:
      v7 = *(void **)(a1 + 40);
      goto LABEL_31;
    case 1024:
      id v3 = [MEMORY[0x1E4FB1618] blackColor];
      break;
  }
LABEL_32:
  return v3;
}

+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5
{
  return (id)[a1 interpolationFrom:a3 to:a4 fraction:0 brightenUnits:a5];
}

+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5 brightenUnits:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc((Class)a1);
  id v13 = [v10 device];
  unsigned int v14 = (void *)[v12 initForDevice:v13];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  char v16 = [v10 faceColors];
  char v17 = [v15 setWithArray:v16];

  v18 = [v11 faceColors];
  id v35 = v17;
  id v19 = [v17 setByAddingObjectsFromArray:v18];

  id v34 = v19;
  id v20 = [v19 allObjects];
  [v14 setFaceColors:v20];

  if ([v10 containsOverrideFaceColor]) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = [v11 containsOverrideFaceColor];
  }
  [v14 setContainsOverrideFaceColor:v21];
  [v10 multicolorAlpha];
  [v11 multicolorAlpha];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v14, "setMulticolorAlpha:");
  double v22 = a5 + -0.5;
  if (a5 + -0.5 < 0.0) {
    double v22 = -(a5 + -0.5);
  }
  double v23 = (0.5 - v22) * 0.8;
  unint64_t v24 = 1;
  do
  {
    uint64_t v25 = [v10 _colorForUnit:v24];
    uint64_t v26 = [v11 _colorForUnit:v24];
    v27 = (void *)v26;
    if (v25 && v26)
    {
      NTKInterpolateBetweenColors();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!(v25 | v26))
      {
        id v28 = 0;
        goto LABEL_22;
      }
      if (v25) {
        v29 = (void *)v25;
      }
      else {
        v29 = (void *)v26;
      }
      id v28 = v29;
    }
    if ((v24 & a6) != 0)
    {
      double v38 = 0.0;
      double v39 = 0.0;
      uint64_t v36 = 0;
      double v37 = 0.0;
      [v28 getHue:&v39 saturation:&v38 brightness:&v37 alpha:&v36];
      if (v23 + v37 <= 1.0) {
        double v30 = v23 + v37;
      }
      else {
        double v30 = 1.0;
      }
      double v37 = v30;
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", v39, v38);

      id v28 = (id)v31;
    }
LABEL_22:
    [v14 _setColor:v28 forUnit:v24];

    BOOL v32 = v24 >= 0x201;
    v24 *= 2;
  }
  while (!v32);

  return v14;
}

+ (id)interpolationForDevice:(id)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 fraction:(double)a6 units:(unint64_t)a7 brightenUnits:(unint64_t)a8 overrideColor:(id)a9 alternateHighlight:(BOOL)a10
{
  id v15 = a5;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  LODWORD(a4) = [v17 isMulticolor];
  int v19 = [v15 isMulticolor];
  if (a4) {
    id v20 = v16;
  }
  else {
    id v20 = 0;
  }
  uint64_t v21 = +[NTKFaceColorScheme colorSchemeForDevice:v18 withFaceColorPalette:v17 foregroundColor:v20 units:a7 alternateHighlight:a10];

  if (v19) {
    id v22 = v16;
  }
  else {
    id v22 = 0;
  }
  double v23 = +[NTKFaceColorScheme colorSchemeForDevice:v18 withFaceColorPalette:v15 foregroundColor:v22 units:a7 alternateHighlight:a10];

  unint64_t v24 = +[NTKFaceColorScheme interpolationFrom:v21 to:v23 fraction:a8 brightenUnits:a6];

  return v24;
}

- (UIColor)foregroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:1];
}

- (UIColor)secondaryForegroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:2];
}

- (UIColor)backgroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:4];
}

- (UIColor)accentColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:8];
}

- (UIColor)shiftedForegroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:16];
}

- (UIColor)shiftedBackgroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:32];
}

- (UIColor)stackedImagesForegroundColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:64];
}

- (UIColor)tickColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:128];
}

- (UIColor)alternativeTickColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:256];
}

- (UIColor)activityTickColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:512];
}

- (UIColor)upNextTextColor
{
  return (UIColor *)[(NTKFaceColorScheme *)self _colorForUnit:1024];
}

- (unint64_t)units
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_colorsByUnit allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NTKFaceColorScheme *)a3;
  if (v4 == self)
  {
LABEL_9:
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(NTKFaceColorScheme *)v4 units];
      if (v5 == [(NTKFaceColorScheme *)self units])
      {
        unint64_t v6 = 1;
        while (1)
        {
          if (([(NTKFaceColorScheme *)self units] & v6) != 0)
          {
            v7 = [(NTKFaceColorScheme *)self _colorForUnit:v6];
            v8 = [(NTKFaceColorScheme *)v4 _colorForUnit:v6];
            int v9 = [v7 isEqual:v8];

            if (!v9) {
              break;
            }
          }
          BOOL v10 = v6 >= 0x201;
          v6 *= 2;
          if (v10) {
            goto LABEL_9;
          }
        }
      }
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_setColor:(id)a3 forUnit:(unint64_t)a4
{
  id v8 = a3;
  colorsByUnit = self->_colorsByUnit;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  if (v8) {
    [(NSMutableDictionary *)colorsByUnit setObject:v8 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)colorsByUnit removeObjectForKey:v7];
  }
}

- (id)_colorForUnit:(unint64_t)a3
{
  colorsByUnit = self->_colorsByUnit;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)colorsByUnit objectForKey:v4];

  return v5;
}

- (NTKFaceColorPalette)faceColorPalette
{
  return self->_faceColorPalette;
}

- (void)setFaceColorPalette:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)containsOverrideFaceColor
{
  return self->_containsOverrideFaceColor;
}

- (void)setContainsOverrideFaceColor:(BOOL)a3
{
  self->_containsOverrideFaceColor = a3;
}

- (double)multicolorAlpha
{
  return self->_multicolorAlpha;
}

- (void)setMulticolorAlpha:(double)a3
{
  self->_multicolorAlpha = a3;
}

- (NSArray)faceColors
{
  return self->_faceColors;
}

- (void)setFaceColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceColors, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_faceColorPalette, 0);
  objc_storeStrong((id *)&self->_colorsByUnit, 0);
}

@end