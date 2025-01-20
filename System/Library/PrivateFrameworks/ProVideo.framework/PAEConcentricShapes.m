@interface PAEConcentricShapes
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (PAEConcentricShapes)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEConcentricShapes

- (PAEConcentricShapes)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEConcentricShapes;
  result = [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
  if (result)
  {
    result->_lastWidth = 0.0;
    result->_lastHeight = 0.0;
    result->_lastScale = 1.0;
  }
  return result;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v17.receiver = self;
  v17.super_class = (Class)PAEConcentricShapes;
  [(PAESharedDefaultBase *)&v17 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Geometry", 0, 0), 1, 0);
    uint64_t v9 = [v8 localizedStringForKey:@"ConcentricCircles::Shape" value:0 table:0];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v9, 2, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Circles", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Polygons", 0, 0), 0), 1);
    LODWORD(v16) = 4;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Number of Sides", 0, 0), 3, 3, 3, 100, 3, 0x100000064, v16);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Rotation", 0, 0), 4, 4, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Center", 0, 0), 5, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Inner Cutoff", 0, 0), 17, 0, 0.0, 0.0, 10000.0, 0.0, 2250.0, 10.0);
    uint64_t v10 = [v8 localizedStringForKey:@"ConcentricCircles::Cutoff" value:0 table:0];
    if (v7) {
      double v11 = 4096.0;
    }
    else {
      double v11 = 2048.0;
    }
    if (v7) {
      double v12 = 4096.0;
    }
    else {
      double v12 = 2250.0;
    }
    [v3 addFloatSliderWithName:v10 parmId:16 defaultValue:0 parameterMin:v11 parameterMax:0.0 sliderMin:10000.0 sliderMax:0.0 delta:v12 parmFlags:10.0];
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Coloring", 0, 0), 7, 0);
    uint64_t v13 = [v8 localizedStringForKey:@"ConcentricCircles::Color Type" value:0 table:0];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v13, 8, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::2 Color", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::CTGradient", 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Color 1", 0, 0), 9, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Color 2", 0, 0), 10, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addGradientWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Gradient", 0, 0), 11, 2);
    uint64_t v14 = [v8 localizedStringForKey:@"ConcentricCircles::Gradient Handling" value:0 table:0];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v14, 12, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::GHClamp", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::GHMirror", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::GHRepeat", 0, 0), 0), 3);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Width", 0, 0), 13, 0, 50.0, 1.0, 2048.0, 1.0, 500.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Contrast", 0, 0), 14, 0, 0.84, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ConcentricCircles::Phase", 0, 0), 15, 256, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 10.0);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  BOOL v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v6 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    uint64_t v9 = (void *)v6;
    long long v23 = *MEMORY[0x1E4F1FA48];
    uint64_t v24 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (a3 == 8)
    {
      unint64_t v21 = 0;
      unint64_t v22 = 0;
      unsigned int v20 = 0;
      [v5 getParameterFlags:(char *)&v22 + 4 fromParm:9];
      [v5 getParameterFlags:&v22 fromParm:10];
      [v5 getParameterFlags:(char *)&v21 + 4 fromParm:11];
      [v5 getParameterFlags:&v21 fromParm:14];
      [v5 getParameterFlags:&v20 fromParm:12];
      int v19 = 0;
      [v5 getIntValue:&v19 fromParm:8 atFxTime:&v23];
      if (v19) {
        unsigned int v13 = HIDWORD(v22) | 2;
      }
      else {
        unsigned int v13 = HIDWORD(v22) & 0xFFFFFFFD;
      }
      if (v19) {
        unsigned int v14 = v22 | 2;
      }
      else {
        unsigned int v14 = v22 & 0xFFFFFFFD;
      }
      unint64_t v22 = __PAIR64__(v13, v14);
      if (v19) {
        unsigned int v15 = v21 | 2;
      }
      else {
        unsigned int v15 = v21 & 0xFFFFFFFD;
      }
      if (v19) {
        unsigned int v16 = HIDWORD(v21) & 0xFFFFFFFD;
      }
      else {
        unsigned int v16 = HIDWORD(v21) | 2;
      }
      if (v19) {
        unsigned int v17 = v20 & 0xFFFFFFFD;
      }
      else {
        unsigned int v17 = v20 | 2;
      }
      unint64_t v21 = __PAIR64__(v16, v15);
      unsigned int v20 = v17;
      objc_msgSend(v9, "setParameterFlags:toParm:");
      [v9 setParameterFlags:v22 toParm:10];
      [v9 setParameterFlags:v21 toParm:14];
      [v9 setParameterFlags:HIDWORD(v21) toParm:11];
      uint64_t v10 = v20;
      double v11 = v9;
      uint64_t v12 = 12;
      goto LABEL_27;
    }
    if (a3 == 2)
    {
      unint64_t v22 = 0;
      [v5 getParameterFlags:(char *)&v22 + 4 fromParm:3];
      [v5 getParameterFlags:&v22 fromParm:4];
      HIDWORD(v21) = 0;
      [v5 getIntValue:(char *)&v21 + 4 fromParm:2 atFxTime:&v23];
      LODWORD(v22) = v22 & 0xFFFFFFFB | (4 * (HIDWORD(v21) == 0));
      HIDWORD(v22) = HIDWORD(v22) & 0xFFFFFFFB | (4 * (HIDWORD(v21) == 0));
      objc_msgSend(v9, "setParameterFlags:toParm:");
      uint64_t v10 = v22;
      double v11 = v9;
      uint64_t v12 = 4;
LABEL_27:
      [v11 setParameterFlags:v10 toParm:v12];
    }
  }
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  self->_lastWidth = (double)(unint64_t)[a3 width];
  self->_lastHeight = (double)(unint64_t)[a3 height];
  self->_lastScale = a4->var4;
  BOOL v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121AB90];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 0;
  }
  double v11 = (void *)v8;
  uint64_t v12 = [a3 imageType];
  int v13 = [(PAESharedDefaultBase *)self getRenderMode:a4->var0.var1];
  v87[0] = 0;
  long long v86 = 0uLL;
  double v84 = 0.0;
  double v85 = 0.0;
  double v82 = 0.0;
  double v83 = 0.0;
  double v80 = 0.0;
  double v81 = 0.0;
  double v79 = 0.0;
  double v77 = 0.0;
  double v78 = 0.0;
  double v76 = 0.0;
  int v75 = 0;
  double v73 = 0.0;
  double v74 = 0.0;
  double v71 = 2048.0;
  uint64_t v72 = 0;
  double v70 = 0.0;
  [v7 getIntValue:v87 fromParm:2 atFxTime:a4->var0.var1];
  [v7 getIntValue:&v75 fromParm:3 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v74 fromParm:4 atFxTime:a4->var0.var1];
  [v7 getXValue:&v86 YValue:(char *)&v86 + 8 fromParm:5 atFxTime:a4->var0.var1];
  [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v86 withImage:a3];
  long long v86 = v67;
  [v7 getRedValue:&v85 greenValue:&v84 blueValue:&v83 alphaValue:&v82 fromParm:9 atFxTime:a4->var0.var1];
  double v84 = v82 * v84;
  double v85 = v82 * v85;
  double v83 = v82 * v83;
  [v7 getRedValue:&v81 greenValue:&v80 blueValue:&v79 alphaValue:&v78 fromParm:10 atFxTime:a4->var0.var1];
  double v80 = v78 * v80;
  double v81 = v78 * v81;
  double v79 = v78 * v79;
  [v7 getFloatValue:&v77 fromParm:13 atFxTime:a4->var0.var1];
  double v14 = v77;
  [v7 getFloatValue:&v76 fromParm:14 atFxTime:a4->var0.var1];
  double v15 = log10(v76 * 10.0);
  double v16 = 1.0 / (1.0 - v15);
  BOOL v17 = v15 < 0.999999999;
  double v18 = 1000000030.0;
  if (v17) {
    double v18 = v16;
  }
  double v76 = v18;
  [v7 getIntValue:(char *)&v72 + 4 fromParm:8 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v73 fromParm:15 atFxTime:a4->var0.var1];
  double v19 = v73;
  double v20 = -v73;
  double v73 = -v73;
  int v21 = HIDWORD(v72);
  if (v87[0] == 1)
  {
    double v22 = v77;
    if (!HIDWORD(v72))
    {
      v28 = 0;
      double v73 = fmod(v20, v77) / v22;
      goto LABEL_20;
    }
    double v23 = fmod(v20, v77) / v22;
    double v24 = floor(fabs(v20) / v22);
    if (v19 > 0.0) {
      double v24 = -v24;
    }
    double v73 = v23 + v24;
  }
  if (v21 == 1)
  {
    uint64_t v25 = HGRectMake4i(0, 0, 0x100u, 1u);
    uint64_t v27 = v26;
    v28 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(void *)&double v29 = HGBitmap::HGBitmap(v28, v25, v27, 29).n128_u64[0];
    uint64_t v30 = *((void *)v28 + 10);
    objc_msgSend(v11, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", v30, 256, 4, 11, a4->var0.var1, v29);
    for (uint64_t i = 0; i != 4096; i += 16)
    {
      v32 = (float *)(v30 + i);
      float v33 = *(float *)(v30 + i);
      float v34 = v33 * *(float *)(v30 + i + 4);
      float v35 = v33 * *(float *)(v30 + i + 8);
      float v36 = v33 * *(float *)(v30 + i + 12);
      v32[1] = v34;
      v32[2] = v35;
      v32[3] = v36;
    }
  }
  else
  {
    v28 = 0;
  }
LABEL_20:
  [v7 getIntValue:&v72 fromParm:12 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v71 fromParm:16 atFxTime:a4->var0.var1];
  [v7 getFloatValue:&v70 fromParm:17 atFxTime:a4->var0.var1];
  if (v13) {
    BOOL v37 = v12 == 3;
  }
  else {
    BOOL v37 = 0;
  }
  BOOL v10 = v37;
  if (v37)
  {
    v69 = 0;
    if (v87[0])
    {
      if (HIDWORD(v72))
      {
        v38 = (HgcConcentricPolygonsGradient *)HGObject::operator new(0x1A0uLL);
        HgcConcentricPolygonsGradient::HgcConcentricPolygonsGradient(v38);
      }
      v40 = (HgcConcentricPolygons *)HGObject::operator new(0x1A0uLL);
      HgcConcentricPolygons::HgcConcentricPolygons(v40);
      if (v40) {
        v69 = v40;
      }
      uint64_t v66 = 0x800000009;
    }
    else
    {
      if (HIDWORD(v72))
      {
        v39 = (HgcConcentricCirclesGradient *)HGObject::operator new(0x1A0uLL);
        HgcConcentricCirclesGradient::HgcConcentricCirclesGradient(v39);
      }
      v40 = (HgcConcentricPolygons *)HGObject::operator new(0x1A0uLL);
      HgcConcentricCircles::HgcConcentricCircles(v40);
      if (v40) {
        v69 = v40;
      }
      uint64_t v66 = 0x600000007;
    }
    if (HIDWORD(v72) == 1)
    {
      v41 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v41, v28);
      (*(void (**)(HgcConcentricPolygons *, void, HGBitmapLoader *))(*(void *)v40 + 120))(v40, 0, v41);
      if (v41) {
        (*(void (**)(HGBitmapLoader *))(*(void *)v41 + 24))(v41);
      }
    }
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    float v42 = *(double *)&v86;
    float v43 = *((double *)&v86 + 1);
    (*(void (**)(HgcConcentricPolygons *, void, float, float, double, double))(*(void *)v40 + 96))(v40, 0, v42, v43, 0.0, 0.0);
    float v44 = v85;
    float v45 = v84;
    float v46 = v83;
    float v47 = v82;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, float, float))(*(void *)v40 + 96))(v40, 1, v44, v45, v46, v47);
    float v48 = v81;
    float v49 = v80;
    float v50 = v79;
    float v51 = v78;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, float, float))(*(void *)v40 + 96))(v40, 2, v48, v49, v50, v51);
    float v52 = v77;
    float v53 = v73;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, double, double))(*(void *)v40 + 96))(v40, 3, v52, v53, 0.0, 0.0);
    float v54 = v76;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, double, double, double))(*(void *)v40 + 96))(v40, 4, v54, 0.0, 0.0, 0.0);
    float v55 = *(double *)&v67;
    float v56 = v68;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, float, double))(*(void *)v40 + 96))(v40, 5, v55, fabsf(v56), 1.0, 0.0);
    float v57 = 6.28318531 / (double)v75;
    float v58 = (double)v75 / 6.28318531;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, double, double))(*(void *)v40 + 96))(v40, 6, v57, v58, 0.0, 0.0);
    __double2 v59 = __sincos_stret(v74);
    float cosval = v59.__cosval;
    float sinval = v59.__sinval;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, float, float))(*(void *)v40 + 96))(v40, 7, cosval, sinval, -sinval);
    float v62 = 1.0 / v14;
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, double, double, double))(*(void *)v40 + 96))(v40, 8, v62, 0.0, 0.0, 0.0);
    (*(void (**)(HgcConcentricPolygons *, uint64_t, float, double, double, double))(*(void *)v40 + 96))(v40, 9, (float)(v72 - 1), 0.0, 0.0, 0.0);
    float v63 = v71;
    (*(void (**)(HgcConcentricPolygons *, void, float, double, double, double))(*(void *)v40 + 96))(v40, HIDWORD(v66), v63, 0.0, 0.0, 0.0);
    float v64 = v70;
    (*(void (**)(HgcConcentricPolygons *, void, float, double, double, double))(*(void *)v40 + 96))(v40, v66, v64, 0.0, 0.0, 0.0);
    [a3 setHeliumRef:&v69];
    if (v69) {
      (*(void (**)(HgcConcentricPolygons *))(*(void *)v69 + 24))(v69);
    }
  }
  if (v28) {
    (*(void (**)(HGBitmap *))(*(void *)v28 + 24))(v28);
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 0;
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end