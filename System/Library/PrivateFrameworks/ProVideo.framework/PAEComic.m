@interface PAEComic
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEComic)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEComic

- (PAEComic)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEComic;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:65792];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:590080];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v15.receiver = self;
  v15.super_class = (Class)PAEComic;
  [(PAESharedDefaultBase *)&v15 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v6 = objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Style", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::StyleEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
  int v7 = v6 & objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Ink Color", 0, 0), 2, 2, 0.0, 0.0, 0.0);
  int v8 = objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Fill Color", 0, 0), 3, 2, 1.0, 1.0, 1.0);
  int v9 = v7 & v8 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Smoothness", 0, 0), 4, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
  int v10 = objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Ink Edges", 0, 0), 5, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
  int v11 = v10 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Ink Smoothness", 0, 0), 6, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.01);
  int v12 = v9 & v11 & objc_msgSend(v4, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Ink Fill", 0, 0), 7, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
  LODWORD(v14) = 0;
  LOBYTE(v11) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Posterize Levels", 0, 0), 8, 6, 2, 1000, 2, 0x100000032, v14);
  return v12 & v11 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Comic::Affect Alpha", 0, 0), 9, 0, 3);
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  if (a3 != 1) {
    return 1;
  }
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  int v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 0;
  }
  int v10 = (void *)v7;
  long long v16 = *MEMORY[0x1E4F1F9F8];
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  unsigned int v15 = 0;
  [v6 getIntValue:&v15 fromParm:1 atFxTime:&v16];
  int v14 = 0;
  uint64_t v13 = 0;
  int v12 = 0;
  [v6 getParameterFlags:&v14 fromParm:2];
  [v6 getParameterFlags:(char *)&v13 + 4 fromParm:3];
  [v6 getParameterFlags:&v13 fromParm:8];
  [v6 getParameterFlags:&v12 fromParm:9];
  if (v15 > 1)
  {
    [v10 setParameterFlags:v14 & 0xFFFFFFFD toParm:2];
    [v10 setParameterFlags:HIDWORD(v13) & 0xFFFFFFFD toParm:3];
    [v10 setParameterFlags:v12 & 0xFFFFFFFD toParm:9];
    uint64_t v11 = v13 | 2;
  }
  else
  {
    [v10 setParameterFlags:v14 | 2u toParm:2];
    [v10 setParameterFlags:HIDWORD(v13) | 2u toParm:3];
    [v10 setParameterFlags:v12 | 2u toParm:9];
    uint64_t v11 = v13 & 0xFFFFFFFD;
  }
  [v10 setParameterFlags:v11 toParm:8];
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v60[2] = *MEMORY[0x1E4F143B8];
  int v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (!v9) {
    return 1;
  }
  uint64_t v11 = (void *)v10;
  int v59 = 0;
  double v58 = 0.0;
  double v56 = 0.0;
  double v57 = 0.0;
  double v55 = 0.0;
  int v54 = 0;
  [v9 getIntValue:&v59 fromParm:1 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v58 fromParm:4 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v57 fromParm:5 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v56 fromParm:6 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v54 fromParm:8 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v55 fromParm:7 atFxTime:a5->var0.var1];
  int v12 = (HGComicDesignerInterface *)HGObject::operator new(0x1A0uLL);
  HGComicDesignerInterface::HGComicDesignerInterface(v12);
  v53 = 0;
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v52 = 0;
  }
  uint64_t v13 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v13);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v13, 0, v14);
  v60[0] = 0;
  v60[1] = 0;
  HGTextureWrap::SetTextureBorderColor(v13, (float *)v60);
  (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v13 + 120))(v13, 0, v52);
  (*(void (**)(HGComicDesignerInterface *, void, HGTextureWrap *))(*(void *)v12 + 120))(v12, 0, v13);
  float v15 = v58 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, void, float, double, double, double))(*(void *)v12 + 96))(v12, 0, v15, 0.0, 0.0, 0.0);
  float v16 = (1.0 - v57) * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 1, v16, 0.0, 0.0, 0.0);
  float v17 = v56 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 2, v17, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 4, (float)v54, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 5, 720.0, 0.0, 0.0, 0.0);
  float v18 = v55 * 100.0;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 7, v18, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 3, -1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 11, 1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 12, 1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 10, 1.0, 0.0, 0.0, 0.0);
  uint64_t v19 = [a3 dod];
  uint64_t v22 = HGRectMake4i(v19, HIDWORD(v19), v20, v21);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(void *)v12 + 96))(v12, 8, (float)(int)v22, (float)SHIDWORD(v22), (float)v23, (float)v24);
  [(PAESharedDefaultBase *)self getScaleForImage:a4];
  float v25 = v51[1];
  float v26 = v51[2];
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, double, double))(*(void *)v12 + 96))(v12, 9, v25, v26, 0.0, 0.0);
  if (v59 == 1)
  {
    v27.n128_u32[0] = 10.0;
  }
  else
  {
    if (v59 == 2)
    {
      double v50 = 0.0;
      v51[0] = 0.0;
      uint64_t v48 = 0;
      double v49 = 0.0;
      double v46 = 0.0;
      double v47 = 0.0;
      uint64_t v44 = 0;
      double v45 = 0.0;
      char v43 = 0;
      [v9 getRedValue:v51 greenValue:&v50 blueValue:&v49 alphaValue:&v48 fromParm:2 atFxTime:a5->var0.var1];
      [v9 getRedValue:&v47 greenValue:&v46 blueValue:&v45 alphaValue:&v44 fromParm:3 atFxTime:a5->var0.var1];
      [v9 getBoolValue:&v43 fromParm:9 atFxTime:a5->var0.var1];
      (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 6, 24.0, 0.0, 0.0, 0.0);
      v28.n128_u32[0] = 1.0;
      if (v43) {
        v28.n128_f32[0] = 0.0;
      }
      (*(void (**)(HGComicDesignerInterface *, uint64_t, __n128, double, double, double))(*(void *)v12 + 96))(v12, 10, v28, 0.0, 0.0, 0.0);
      v29 = (HgcColorize *)HGObject::operator new(0x1A0uLL);
      HgcColorize::HgcColorize(v29);
      (*(void (**)(HgcColorize *, void, HGComicDesignerInterface *))(*(void *)v29 + 120))(v29, 0, v12);
      float v30 = v51[0];
      float v31 = v50;
      float v32 = v49;
      (*(void (**)(HgcColorize *, void, float, float, float, double))(*(void *)v29 + 96))(v29, 0, v30, v31, v32, 0.0);
      float v33 = v47;
      float v34 = v46;
      float v35 = v45;
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, double))(*(void *)v29 + 96))(v29, 1, v33, v34, v35, 0.0);
      (*(void (**)(HgcColorize *, uint64_t, float, double, double, double))(*(void *)v29 + 96))(v29, 2, 1.0, 0.0, 0.0, 0.0);
      (*(void (**)(HgcColorize *, uint64_t, float, double, double, double))(*(void *)v29 + 96))(v29, 3, 1.0, 0.0, 0.0, 0.0);
      v36 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
      float v37 = *v36;
      float v38 = v36[1];
      float v39 = v36[2];
      (*(void (**)(HgcColorize *, uint64_t, float, float, float, double))(*(void *)v29 + 96))(v29, 4, v37, v38, v39, 0.0);
      uint64_t v40 = *(void *)v29;
      v53 = v29;
      (*(void (**)(HgcColorize *))(v40 + 16))(v29);
      (*(void (**)(HgcColorize *))(*(void *)v29 + 24))(v29);
      goto LABEL_13;
    }
    v27.n128_u32[0] = 7.0;
  }
  (*(void (**)(HGComicDesignerInterface *, uint64_t, __n128, double, double, double))(*(void *)v12 + 96))(v12, 6, v27, 0.0, 0.0, 0.0);
  uint64_t v41 = *(void *)v12;
  v53 = v12;
  (*(void (**)(HGComicDesignerInterface *))(v41 + 16))(v12);
LABEL_13:
  [a3 setHeliumRef:&v53];
  (*(void (**)(HGTextureWrap *))(*(void *)v13 + 24))(v13);
  if (v52) {
    (*(void (**)(uint64_t))(*(void *)v52 + 24))(v52);
  }
  if (v53) {
    (*(void (**)(HgcColorize *))(*(void *)v53 + 24))(v53);
  }
  (*(void (**)(HGComicDesignerInterface *))(*(void *)v12 + 24))(v12);
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end