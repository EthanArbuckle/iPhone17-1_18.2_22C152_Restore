@interface PAECheckerboard
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (PAECheckerboard)initWithAPIManager:(id)a3;
- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4;
- (id)properties;
- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4;
- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:;
- (void)updateShapeParameter:(unsigned int)a3 atTime:(id)a4;
@end

@implementation PAECheckerboard

- (PAECheckerboard)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAECheckerboard;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v14.receiver = self;
  v14.super_class = (Class)PAECheckerboard;
  [(PAESharedDefaultBase *)&v14 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A3D0];
  objc_super v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    unsigned int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Type", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Types", 0, 0), "componentsSeparatedByString:", @";"),
      1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Center", 0, 0), 310, 0, 0.5, 0.5);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Color 1", 0, 0), 311, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Color 2", 0, 0), 312, 0, 0.0, 0.0, 0.0, 1.0);
    uint64_t v9 = [v8 localizedStringForKey:@"Checkerboard::Size" value:0 table:0];
    if (v7 >= 2) {
      double v10 = 3200.0;
    }
    else {
      double v10 = 800.0;
    }
    if (v7 >= 2) {
      double v11 = 1600.0;
    }
    else {
      double v11 = 800.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:313 defaultValue:0 parameterMin:80.0 parameterMax:0.0 sliderMin:v10 sliderMax:0.0 delta:v11 parmFlags:10.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Divisions", 0, 0), 3, 2, 8.0, 0.0, 180.0, 0.0, 180.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Twirl", 0, 0), 4, 2, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Board Angle", 0, 0), 2, 288, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Radial Shape", 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Radial Shapes", 0, 0), "componentsSeparatedByString:", @";"),
      3);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Radial Scale", 0, 0), 6, 2, 1.0, 0.5, 2.0, 0.5, 2.0, 0.1);
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shapes", 0, 0), "componentsSeparatedByString:", @";");
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape 1", 0, 0), 7, 0, v12, 3);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape 1 Group", 0, 0), 8, 10);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Num Sides 1", 0, 0), 9, 34, 5.0, 3.0, 50.0, 3.0, 50.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape Angle 1", 0, 0), 10, 290, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape Radius 1", 0, 0), 11, 34, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape 2", 0, 0), 12, 1, v12, 3);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape 2 Group", 0, 0), 13, 10);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Num Sides 2", 0, 0), 14, 34, 5.0, 3.0, 50.0, 3.0, 50.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape Angle 2", 0, 0), 15, 290, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Shape Radius 2", 0, 0), 16, 34, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Vertical Scale", 0, 0), 17, 2, 1.0, 0.0, 100.0, 0.0, 10.0, 0.5);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Checkerboard::Contrast", 0, 0), 314, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
  }
  return v6;
}

- (void)updateShapeParameter:(unsigned int)a3 atTime:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A8D0];
  v15 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F1225D98];
  uint64_t v9 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v20 = 0;
  [v7 getIntValue:&v20 fromParm:v5 atFxTime:a4.var1];
  int v19 = 0;
  uint64_t v18 = 0;
  int v17 = 0;
  [v7 getParameterFlags:&v19 fromParm:(v5 + 1)];
  [v7 getParameterFlags:(char *)&v18 + 4 fromParm:(v5 + 2)];
  [v7 getParameterFlags:&v18 fromParm:(v5 + 3)];
  [v7 getParameterFlags:&v17 fromParm:(v5 + 4)];
  if (v20 == 3)
  {
    if (v5 == 7) {
      uint64_t v12 = @"Checkerboard::Num Points 1";
    }
    else {
      uint64_t v12 = @"Checkerboard::Num Points 2";
    }
    uint64_t v13 = objc_msgSend(v9, "localizedStringForKey:value:table:", v12, 0, 0, v15);
    [v16 setParameter:(v5 + 2) name:v13];
    [v8 setParameterFlags:v19 & 0xFFFFFFFD toParm:(v5 + 1)];
    [v8 setParameterFlags:HIDWORD(v18) & 0xFFFFFFFD toParm:(v5 + 2)];
    [v8 setParameterFlags:v18 & 0xFFFFFFFD toParm:(v5 + 3)];
    uint64_t v14 = v17 & 0xFFFFFFFD;
  }
  else
  {
    if (v20 == 2)
    {
      if (v5 == 7) {
        double v10 = @"Checkerboard::Num Sides 1";
      }
      else {
        double v10 = @"Checkerboard::Num Sides 2";
      }
      objc_msgSend(v9, "localizedStringForKey:value:table:", v10, 0, 0, v15);
      [v15 setParameter:(v5 + 2) name:0];
      [v8 setParameterFlags:v19 & 0xFFFFFFFD toParm:(v5 + 1)];
      [v8 setParameterFlags:HIDWORD(v18) & 0xFFFFFFFD toParm:(v5 + 2)];
      uint64_t v11 = v18 & 0xFFFFFFFD;
    }
    else
    {
      [v8 setParameterFlags:v19 | 2u toParm:(v5 + 1)];
      [v8 setParameterFlags:HIDWORD(v18) | 2u toParm:(v5 + 2)];
      uint64_t v11 = v18 | 2;
    }
    objc_msgSend(v8, "setParameterFlags:toParm:", v11, (v5 + 3), v15);
    uint64_t v14 = v17 | 2u;
  }
  [v8 setParameterFlags:v14 toParm:(v5 + 4)];
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  BOOL v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A8D0];
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F1225D98];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8 || v7 == 0;
  char v10 = v9;
  if (v9) {
    return v10 ^ 1;
  }
  long long v29 = *MEMORY[0x1E4F1F9F8];
  uint64_t v30 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  switch(a3)
  {
    case 0xCu:
      uint64_t v14 = self;
      uint64_t v15 = 12;
LABEL_18:
      [(PAECheckerboard *)v14 updateShapeParameter:v15 atTime:&v29];
      return v10 ^ 1;
    case 7u:
      uint64_t v14 = self;
      uint64_t v15 = 7;
      goto LABEL_18;
    case 1u:
      uint64_t v11 = (void *)v7;
      uint64_t v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v28 = 0;
      [v5 getIntValue:&v28 fromParm:1 atFxTime:&v29];
      int v27 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v20 = 0;
      [v5 getParameterFlags:&v27 fromParm:3];
      [v5 getParameterFlags:(char *)&v26 + 4 fromParm:4];
      [v5 getParameterFlags:&v26 fromParm:5];
      [v5 getParameterFlags:(char *)&v25 + 4 fromParm:6];
      [v5 getParameterFlags:&v25 fromParm:7];
      [v5 getParameterFlags:(char *)&v24 + 4 fromParm:8];
      [v5 getParameterFlags:&v24 fromParm:9];
      [v5 getParameterFlags:(char *)&v23 + 4 fromParm:10];
      [v5 getParameterFlags:&v23 fromParm:11];
      [v5 getParameterFlags:(char *)&v22 + 4 fromParm:12];
      [v5 getParameterFlags:&v22 fromParm:13];
      [v5 getParameterFlags:(char *)&v21 + 4 fromParm:14];
      [v5 getParameterFlags:&v21 fromParm:15];
      [v5 getParameterFlags:(char *)&v20 + 4 fromParm:16];
      [v5 getParameterFlags:&v20 fromParm:17];
      switch(v28)
      {
        case 0:
          [v6 setParameterFlags:v27 | 2u toParm:3];
          [v6 setParameterFlags:HIDWORD(v26) | 2u toParm:4];
          [v6 setParameterFlags:v26 | 2 toParm:5];
          [v6 setParameterFlags:HIDWORD(v25) | 2u toParm:6];
          uint64_t v13 = @"Checkerboard::Size";
          goto LABEL_20;
        case 1:
          [v6 setParameterFlags:v27 & 0xFFFFFFFD toParm:3];
          [v6 setParameterFlags:HIDWORD(v26) & 0xFFFFFFFD toParm:4];
          [v6 setParameterFlags:v26 & 0xFFFFFFFD toParm:5];
          [v6 setParameterFlags:HIDWORD(v25) & 0xFFFFFFFD toParm:6];
          uint64_t v13 = @"Checkerboard::Tile Height";
LABEL_20:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, 0));
          [v6 setParameterFlags:v25 | 2 toParm:7];
          [v6 setParameterFlags:HIDWORD(v24) | 2u toParm:8];
          [v6 setParameterFlags:v24 | 2 toParm:9];
          [v6 setParameterFlags:HIDWORD(v23) | 2u toParm:10];
          [v6 setParameterFlags:v23 | 2 toParm:11];
          [v6 setParameterFlags:HIDWORD(v22) | 2u toParm:12];
          [v6 setParameterFlags:v22 | 2 toParm:13];
          [v6 setParameterFlags:HIDWORD(v21) | 2u toParm:14];
          [v6 setParameterFlags:v21 | 2 toParm:15];
          [v6 setParameterFlags:HIDWORD(v20) | 2u toParm:16];
          goto LABEL_22;
        case 2:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", @"Checkerboard::Size", 0, 0));
          int v18 = 1;
          int v19 = 0;
          [v5 getIntValue:&v19 fromParm:7 atFxTime:&v29];
          [v5 getIntValue:&v18 fromParm:12 atFxTime:&v29];
          [v6 setParameterFlags:v27 | 2u toParm:3];
          [v6 setParameterFlags:HIDWORD(v26) | 2u toParm:4];
          [v6 setParameterFlags:v26 | 2 toParm:5];
          [v6 setParameterFlags:HIDWORD(v25) | 2u toParm:6];
          [v6 setParameterFlags:v25 & 0xFFFFFFFD toParm:7];
          [v6 setParameterFlags:HIDWORD(v22) & 0xFFFFFFFD toParm:12];
          [(PAECheckerboard *)self updateShapeParameter:7 atTime:&v29];
          [(PAECheckerboard *)self updateShapeParameter:12 atTime:&v29];
LABEL_22:
          uint64_t v16 = v20 | 2;
          goto LABEL_24;
        case 3:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", @"Checkerboard::Size", 0, 0));
          [v6 setParameterFlags:v27 | 2u toParm:3];
          [v6 setParameterFlags:HIDWORD(v26) | 2u toParm:4];
          [v6 setParameterFlags:v26 | 2 toParm:5];
          [v6 setParameterFlags:HIDWORD(v25) | 2u toParm:6];
          [v6 setParameterFlags:v25 | 2 toParm:7];
          [v6 setParameterFlags:HIDWORD(v24) | 2u toParm:8];
          [v6 setParameterFlags:v24 | 2 toParm:9];
          [v6 setParameterFlags:HIDWORD(v23) | 2u toParm:10];
          [v6 setParameterFlags:v23 | 2 toParm:11];
          [v6 setParameterFlags:HIDWORD(v22) | 2u toParm:12];
          [v6 setParameterFlags:v22 | 2 toParm:13];
          [v6 setParameterFlags:HIDWORD(v21) | 2u toParm:14];
          [v6 setParameterFlags:v21 | 2 toParm:15];
          [v6 setParameterFlags:HIDWORD(v20) | 2u toParm:16];
          uint64_t v16 = v20 & 0xFFFFFFFD;
LABEL_24:
          [v6 setParameterFlags:v16 toParm:17];
          break;
        default:
          return v10 ^ 1;
      }
      break;
  }
  return v10 ^ 1;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PreservesAlpha", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a3, "matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  BOOL v6 = (double *)[a4 matrix];
  uint64_t v7 = 0;
  double v8 = *v6;
  double v9 = v6[1];
  double v10 = v6[2];
  double v11 = v6[3];
  double v12 = v6[4];
  double v13 = v6[5];
  double v14 = v6[6];
  double v15 = v6[7];
  double v16 = v6[8];
  double v17 = v6[9];
  double v18 = v6[10];
  double v19 = v6[11];
  double v20 = v6[12];
  double v21 = v6[13];
  uint64_t v22 = v5 + 96;
  double v23 = v6[14];
  double v24 = v6[15];
  do
  {
    double v25 = *(double *)(v5 + v7);
    double v26 = *(double *)(v22 + v7 - 64);
    double v27 = *(double *)(v22 + v7 - 32);
    double v28 = *(double *)(v22 + v7);
    long long v29 = (double *)((char *)&v31 + v7);
    *long long v29 = v25 * v8 + v26 * v9 + v27 * v10 + v28 * v11;
    v29[4] = v25 * v12 + v26 * v13 + v27 * v14 + v28 * v15;
    v29[8] = v25 * v16 + v26 * v17 + v27 * v18 + v28 * v19;
    v29[12] = v25 * v20 + v26 * v21 + v27 * v23 + v28 * v24;
    v7 += 8;
  }
  while (v7 != 32);
  return [[FxMatrix44 alloc] initWithMatrix44Data:&v31];
}

- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __double2 v12 = __sincos_stret(a6);
  v21[0] = *(void *)&v12.__cosval;
  *(double *)&v21[1] = -v12.__sinval;
  v21[2] = 0;
  v21[3] = 0;
  __double2 v22 = v12;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v25 = xmmword_1B7E74B20;
  long long v26 = unk_1B7E74B30;
  long long v27 = xmmword_1B7E74B40;
  long long v28 = unk_1B7E74B50;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  long long v14 = xmmword_1B7E733E0;
  uint64_t v15 = 0;
  double v16 = a5;
  long long v17 = xmmword_1B7E74B20;
  long long v18 = unk_1B7E74B30;
  long long v19 = xmmword_1B7E74B40;
  long long v20 = unk_1B7E74B50;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAECheckerboard multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAECheckerboard multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13), objc_msgSend(a7, "inversePixelTransform")), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  uint64_t v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  double v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v7) {
    _ZF = v8 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    return 0;
  }
  int v11 = [v8 versionAtCreation];
  int v191 = 0;
  uint64_t v189 = 0x3FE0000000000000;
  uint64_t v190 = 0x3FE0000000000000;
  double v187 = 1.0;
  double v188 = 1.0;
  double v185 = 1.0;
  double v186 = 1.0;
  double v183 = 0.0;
  double v184 = 0.0;
  double v181 = 1.0;
  double v182 = 0.0;
  double v179 = 0.0;
  double v180 = 80.0;
  double v178 = 1.0;
  int v177 = 0;
  int v176 = 5;
  double v174 = 1.0;
  double v175 = 0.0;
  int v172 = 5;
  int v173 = 1;
  double v170 = 1.0;
  double v171 = 0.0;
  double v168 = 8.0;
  double v169 = 1.0;
  double v167 = 0.0;
  int v166 = 0;
  double v165 = 1.0;
  [a3 height];
  [a3 width];
  [v7 getIntValue:&v191 fromParm:1 atFxTime:a4->var0.var1];
  [v7 getXValue:&v190 YValue:&v189 fromParm:310 atFxTime:a4->var0.var1];
  [v7 getRedValue:&v188 greenValue:&v187 blueValue:&v186 alphaValue:&v185 fromParm:311 atFxTime:a4->var0.var1];
  if (v11)
  {
    double v187 = v185 * v187;
    double v188 = v185 * v188;
    double v186 = v185 * v186;
    [v7 getRedValue:&v184 greenValue:&v183 blueValue:&v182 alphaValue:&v181 fromParm:312 atFxTime:a4->var0.var1];
    double v183 = v181 * v183;
    double v184 = v181 * v184;
    double v182 = v181 * v182;
  }
  else
  {
    [v7 getRedValue:&v184 greenValue:&v183 blueValue:&v182 alphaValue:&v181 fromParm:312 atFxTime:a4->var0.var1];
  }
  [v7 getFloatValue:&v180 fromParm:313 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v179 fromParm:2 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v178 fromParm:314 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v177 fromParm:7 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v176 fromParm:9 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v175 fromParm:10 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v174 fromParm:11 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v173 fromParm:12 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v172 fromParm:14 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v171 fromParm:15 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v170 fromParm:16 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v169 fromParm:17 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v168 fromParm:3 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v167 fromParm:4 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v166 fromParm:5 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v165 fromParm:6 atFxTime:a4->var0.var1];
  [a3 origin];
  uint64_t v12 = [a3 imageType];
  BOOL v10 = v12 == 3;
  if (v12 == 3)
  {
    switch(v191)
    {
      case 0:
        double v13 = (HgcCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcCheckerboard::HgcCheckerboard(v13);
      case 1:
        [a3 bounds];
        float64_t v159 = v15;
        float64_t v160 = v14;
        float64x2_t v164 = (float64x2_t)xmmword_1B7E74B10;
        [v7 getXValue:&v164 YValue:&v164.f64[1] fromParm:310 atFxTime:a4->var0.var1];
        __asm { FMOV            V1.2D, #1.0 }
        float64x2_t v20 = vsubq_f64(_Q1, v164);
        __asm { FMOV            V1.2D, #-0.5 }
        float64x2_t v22 = vaddq_f64(v20, _Q1);
        _Q1.f64[0] = v160;
        _Q1.f64[1] = v159;
        float64x2_t v164 = vmulq_f64(_Q1, v22);
        uint64_t v23 = (void *)[a3 pixelTransform];
        [v23 transform2DPoint:*(_OWORD *)&v164];
        v164.f64[0] = v24;
        v164.f64[1] = v25;
        double v26 = v185 + v181;
        double v27 = v188 + v184;
        double v161 = v187 + v183;
        double v28 = v186 + v182;
        double v168 = 360.0 / (v168 + v168);
        double v29 = v168 * 3.14159265;
        unint64_t v30 = [a3 height];
        double v167 = v167 * (6.28318531 / ((double)v30 / a4->var4));
        double v31 = 1.0 / v165;
        double v165 = v31;
        double v180 = pow(v180, v31);
        int v32 = v166;
        long double v33 = pow(v178 * 1.25, 3.0);
        if (v32) {
          long double v33 = pow(v33, 1.0 / v31);
        }
        double v34 = v26 * 0.5;
        double v35 = v27 * 0.5;
        double v178 = v33;
        v163 = 0;
        double v36 = v161 * 0.5;
        double v37 = v28 * 0.5;
        double v38 = v29 / 180.0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v163, a3, *(_OWORD *)&v164, v179);
        int v39 = v166;
        v40 = (HgcConcentricTriangleChecker *)HGObject::operator new(0x1A0uLL);
        v41 = v40;
        if (v39)
        {
          HgcConcentricTriangleChecker::HgcConcentricTriangleChecker(v40);
          float v42 = v168;
          (*(void (**)(HgcShapeCheckerboard *, void, float, double, double, double))(*(void *)v41 + 96))(v41, 0, v42, 0.0, 0.0, 0.0);
          float v43 = v180;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 1, v43, 0.0, 0.0, 0.0);
          float v44 = v38;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 2, v44, 0.0, 0.0, 0.0);
          float v45 = v165;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 3, v45, 0.0, 0.0, 0.0);
          float v46 = v167;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 4, v46, 0.0, 0.0, 0.0);
          float v47 = v188;
          float v48 = v187;
          float v49 = v186;
          float v50 = v185;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 5, v47, v48, v49, v50);
          float v51 = v184;
          float v52 = v183;
          float v53 = v182;
          float v54 = v181;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 6, v51, v52, v53, v54);
          float v55 = v35;
          float v56 = v36;
          float v57 = v37;
          float v58 = v34;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 7, v55, v56, v57, v58);
          float v59 = v178;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 8, v59, 0.0, 0.0, 0.0);
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, double, double, double, double))(*(void *)v41 + 96))(v41, 9, 0.0, 0.0, 0.0, 0.0);
          float v60 = *v163;
          float v61 = v163[1];
          float v62 = v163[2];
          float v63 = v163[3];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 10, v60, v61, v62, v63);
          float v64 = v163[4];
          float v65 = v163[5];
          float v66 = v163[6];
          float v67 = v163[7];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 11, v64, v65, v66, v67);
          v162 = v41;
          (*(void (**)(HgcShapeCheckerboard *))(*(void *)v41 + 16))(v41);
          [a3 setHeliumRef:&v162];
          if (v162) {
            (*(void (**)(HgcShapeCheckerboard *))(*(void *)v162 + 24))(v162);
          }
        }
        else
        {
          HgcConcentricSquareChecker::HgcConcentricSquareChecker(v40);
          float v132 = v168;
          (*(void (**)(HgcShapeCheckerboard *, void, float, double, double, double))(*(void *)v41 + 96))(v41, 0, v132, 0.0, 0.0, 0.0);
          float v133 = v180;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 1, v133, 0.0, 0.0, 0.0);
          float v134 = v38;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 2, v134, 0.0, 0.0, 0.0);
          float v135 = v165;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 3, v135, 0.0, 0.0, 0.0);
          float v136 = v167;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 4, v136, 0.0, 0.0, 0.0);
          float v137 = v188;
          float v138 = v187;
          float v139 = v186;
          float v140 = v185;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 5, v137, v138, v139, v140);
          float v141 = v184;
          float v142 = v183;
          float v143 = v182;
          float v144 = v181;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 6, v141, v142, v143, v144);
          float v145 = v35;
          float v146 = v36;
          float v147 = v37;
          float v148 = v34;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 7, v145, v146, v147, v148);
          float v149 = v178;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 8, v149, 0.0, 0.0, 0.0);
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, double, double, double, double))(*(void *)v41 + 96))(v41, 9, 0.0, 0.0, 0.0, 0.0);
          float v150 = *v163;
          float v151 = v163[1];
          float v152 = v163[2];
          float v153 = v163[3];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 10, v150, v151, v152, v153);
          float v154 = v163[4];
          float v155 = v163[5];
          float v156 = v163[6];
          float v157 = v163[7];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 11, v154, v155, v156, v157);
          v162 = v41;
          (*(void (**)(HgcShapeCheckerboard *))(*(void *)v41 + 16))(v41);
          [a3 setHeliumRef:&v162];
          if (v162) {
            (*(void (**)(HgcShapeCheckerboard *))(*(void *)v162 + 24))(v162);
          }
        }
        goto LABEL_27;
      case 2:
        v68 = (void *)[a3 pixelTransform];
        [a3 bounds];
        double v70 = v69;
        double v72 = v71;
        float64x2_t v164 = (float64x2_t)xmmword_1B7E74B10;
        [v7 getXValue:&v164 YValue:&v164.f64[1] fromParm:310 atFxTime:a4->var0.var1];
        v164.f64[0] = v70 * (0.5 - v164.f64[0]);
        v164.f64[1] = v72 * (0.5 - v164.f64[1]);
        objc_msgSend(v68, "transform2DPoint:");
        v164.f64[0] = v73;
        v164.f64[1] = v74;
        double v178 = v178 * v178;
        v163 = 0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v163, a3);
        v41 = (HgcShapeCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcShapeCheckerboard::HgcShapeCheckerboard(v41);
        float v75 = v180;
        (*(void (**)(HgcShapeCheckerboard *, void, float, double, double, double))(*(void *)v41 + 96))(v41, 0, v75, 0.0, 0.0, 0.0);
        float v76 = v188;
        float v77 = v187;
        float v78 = v186;
        float v79 = v185;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 1, v76, v77, v78, v79);
        float v80 = v184;
        float v81 = v183;
        float v82 = v182;
        float v83 = v181;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 2, v80, v81, v82, v83);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 3, (float)v177, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 4, (float)v173, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 5, (float)v176, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 6, (float)v172, 0.0, 0.0, 0.0);
        float v84 = v175;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 7, v84, 0.0, 0.0, 0.0);
        float v85 = v171;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 8, v85, 0.0, 0.0, 0.0);
        float v86 = v174;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 9, v86, 0.0, 0.0, 0.0);
        float v87 = v170;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 10, v87, 0.0, 0.0, 0.0);
        float v88 = v178;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, double, double, double))(*(void *)v41 + 96))(v41, 11, v88, 0.0, 0.0, 0.0);
        float v89 = *v163;
        float v90 = v163[1];
        float v91 = v163[2];
        float v92 = v163[3];
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 12, v89, v90, v91, v92);
        float v93 = v163[4];
        float v94 = v163[5];
        float v95 = v163[6];
        float v96 = v163[7];
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(void *)v41 + 96))(v41, 13, v93, v94, v95, v96);
        v162 = v41;
        (*(void (**)(HgcShapeCheckerboard *))(*(void *)v41 + 16))(v41);
        [a3 setHeliumRef:&v162];
        if (v162) {
          (*(void (**)(HgcShapeCheckerboard *))(*(void *)v162 + 24))(v162);
        }
LABEL_27:
        (*(void (**)(HgcShapeCheckerboard *))(*(void *)v41 + 24))(v41);
        break;
      case 3:
        v97 = (HgcTriangularCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcTriangularCheckerboard::HgcTriangularCheckerboard(v97);
        double v178 = pow(v178, 3.0);
        double v98 = v180 * 0.5;
        double v99 = v169 * sqrt(v180 * v180 + v98 * v98 + v180 * (v98 + v98) * -0.5);
        double v100 = atan(v99 / (v180 * 0.5));
        __double2 v101 = __sincos_stret(v100);
        v102 = (void *)[a3 pixelTransform];
        [a3 bounds];
        double v104 = v103;
        double v106 = v105;
        float64x2_t v164 = (float64x2_t)xmmword_1B7E74B10;
        [v7 getXValue:&v164 YValue:&v164.f64[1] fromParm:310 atFxTime:a4->var0.var1];
        v164.f64[0] = v104 * (1.0 - v164.f64[0] + -0.5);
        v164.f64[1] = v106 * (1.0 - v164.f64[1] + -0.5);
        objc_msgSend(v102, "transform2DPoint:");
        v164.f64[0] = v107;
        v164.f64[1] = v108;
        v163 = 0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v163, a3);
        float v109 = 1.0 / v98;
        float v110 = 1.0 / v99;
        float v111 = v98;
        float v112 = v99;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(void *)v97 + 96))(v97, 6, v109, v110, v111, v112);
        float sinval = v101.__sinval;
        float cosval = v101.__cosval;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, double, double))(*(void *)v97 + 96))(v97, 5, sinval, cosval, 0.0, 0.0);
        float v115 = v178;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, double, double, double))(*(void *)v97 + 96))(v97, 2, v115, 0.0, 0.0, 0.0);
        float v116 = *v163;
        float v117 = v163[1];
        float v118 = v163[2];
        float v119 = v163[3];
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(void *)v97 + 96))(v97, 3, v116, v117, v118, v119);
        float v120 = v163[4];
        float v121 = v163[5];
        float v122 = v163[6];
        float v123 = v163[7];
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(void *)v97 + 96))(v97, 4, v120, v121, v122, v123);
        float v124 = v188;
        float v125 = v187;
        float v126 = v186;
        float v127 = v185;
        (*(void (**)(HgcTriangularCheckerboard *, void, float, float, float, float))(*(void *)v97 + 96))(v97, 0, v124, v125, v126, v127);
        float v128 = v184;
        float v129 = v183;
        float v130 = v182;
        float v131 = v181;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(void *)v97 + 96))(v97, 1, v128, v129, v130, v131);
        v162 = v97;
        (*(void (**)(HgcTriangularCheckerboard *))(*(void *)v97 + 16))(v97);
        [a3 setHeliumRef:&v162];
        if (v162) {
          (*(void (**)(HgcShapeCheckerboard *))(*(void *)v162 + 24))(v162);
        }
        (*(void (**)(HgcTriangularCheckerboard *))(*(void *)v97 + 24))(v97);
        break;
      default:
        return v10;
    }
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 1;
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end