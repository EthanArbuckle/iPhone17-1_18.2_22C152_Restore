@interface ODDFillColorList
- (id)colorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5;
- (id)cycleColorAtIndex:(unint64_t)a3;
- (id)repeatColorAtIndex:(unint64_t)a3;
- (id)spanColorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5;
- (void)getComponentsForIndex:(unint64_t)a3 hue:(float *)a4 saturation:(float *)a5 brightness:(float *)a6 state:(id)a7;
- (void)setColors:(id)a3;
- (void)setHueDirection:(int)a3;
- (void)setMethod:(int)a3;
@end

@implementation ODDFillColorList

- (void)setHueDirection:(int)a3
{
  self->mHueDirection = a3;
}

- (void)setMethod:(int)a3
{
  self->mMethod = a3;
}

- (void)setColors:(id)a3
{
}

- (id)colorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5
{
  id v8 = a5;
  if (![(NSArray *)self->mColors count]) {
    goto LABEL_6;
  }
  int mMethod = self->mMethod;
  if (!mMethod)
  {
    uint64_t v10 = [(ODDFillColorList *)self cycleColorAtIndex:a3];
    goto LABEL_9;
  }
  if (mMethod == 1)
  {
    uint64_t v10 = [(ODDFillColorList *)self repeatColorAtIndex:a3];
    goto LABEL_9;
  }
  if (mMethod != 2)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [(ODDFillColorList *)self spanColorAtIndex:a3 count:a4 state:v8];
LABEL_9:
  v11 = (void *)v10;
LABEL_10:

  return v11;
}

- (id)repeatColorAtIndex:(unint64_t)a3
{
  unint64_t v4 = a3 % [(NSArray *)self->mColors count];
  mColors = self->mColors;
  return [(NSArray *)mColors objectAtIndex:v4];
}

- (id)spanColorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5
{
  id v8 = a5;
  NSUInteger v9 = [(NSArray *)self->mColors count];
  if (a3 >= a4 || a4 < 2 || v9 == 1)
  {
    uint64_t v13 = [(NSArray *)self->mColors objectAtIndex:0];
    goto LABEL_7;
  }
  float v10 = (float)((float)a3 / (float)(a4 - 1)) * (float)(v9 - 1);
  unint64_t v11 = vcvtms_u32_f32(v10);
  if (TCFloatEqual(v10, (float)v11))
  {
    uint64_t v13 = [(NSArray *)self->mColors objectAtIndex:v11];
LABEL_7:
    v14 = (void *)v13;
    goto LABEL_9;
  }
  uint64_t v22 = 0;
  float v21 = 0.0;
  [(ODDFillColorList *)self getComponentsForIndex:v11 hue:(char *)&v22 + 4 saturation:&v22 brightness:&v21 state:v8];
  float v20 = 0.0;
  uint64_t v19 = 0;
  [(ODDFillColorList *)self getComponentsForIndex:v11 + 1 hue:&v20 saturation:(char *)&v19 + 4 brightness:&v19 state:v8];
  float v12 = (float)v11;
  v15 = +[OITSUColor colorWithCalibratedHue:(float)((float)((float)(v10 - v12) * v20) + (float)(*((float *)&v22 + 1) * (float)(1.0 - (float)(v10 - v12)))) saturation:(float)((float)((float)(v10 - v12) * *((float *)&v19 + 1))+ (float)(*(float *)&v22 * (float)(1.0 - (float)(v10 - v12)))) brightness:(float)((float)((float)(v10 - v12) * *(float *)&v19) + (float)(v21 * (float)(1.0 - (float)(v10 - v12)))) alpha:1.0];
  v14 = +[OADRgbColor rgbColorWithTSUColor:v15];
  v16 = [(NSArray *)self->mColors objectAtIndex:v11];
  v17 = [v16 transforms];
  [v14 setTransforms:v17];

LABEL_9:
  return v14;
}

- (id)cycleColorAtIndex:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self->mColors count];
  if (v5 == 1)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = a3 % (2 * v5 - 2);
    if (v7 >= v5) {
      unint64_t v6 = ~v7 + 2 * v5;
    }
    else {
      unint64_t v6 = a3 % (2 * v5 - 2);
    }
  }
  id v8 = [(NSArray *)self->mColors objectAtIndex:v6];
  return v8;
}

- (void).cxx_destruct
{
}

- (void)getComponentsForIndex:(unint64_t)a3 hue:(float *)a4 saturation:(float *)a5 brightness:(float *)a6 state:(id)a7
{
  id v23 = a7;
  float v12 = [(NSArray *)self->mColors objectAtIndex:a3];
  uint64_t v13 = [v23 drawingTheme];
  v14 = [v13 colorMap];
  v15 = [v13 colorScheme];
  v16 = [v13 colorPalette];
  v17 = +[OADColor rgbColorWithColor:v12 colorMap:v14 colorScheme:v15 colorPalette:v16];

  [v17 red];
  float v19 = v18;
  [v17 green];
  float v21 = v20;
  [v17 blue];
  convertRgbToHsl(v19, v21, v22, a4, a5, a6);
  *a4 = *a4 / 360.0;
}

@end