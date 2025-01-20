@interface PAEKeyerMatteTools
- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4;
- (BOOL)addLevelsParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4;
- (BOOL)addParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4 isLumaKey:(BOOL)a5;
- (BOOL)doMatteManipulationWithInfo:(id *)a3 pixelAspectRatio:(float)a4 fieldHeight:(float)a5 doInvertMatte:(BOOL)a6 inputIsInverted:(BOOL)a7 fillHoles:(BOOL)a8 scaling:(BOOL)a9 blendingGamma:(float)a10 blackLevel:(double)a11 whiteLevel:(double)a12 gammaLevel:(double)a13 preKeyedInputNode:(void *)a14 outputNode:(void *)a15;
- (BOOL)doMatteManipulationWithParamAPI:(id)a3 withPrivateParamAPI:(id)a4 withInfo:(id *)a5 pixelAspectRatio:(float)a6 fieldHeight:(float)a7 doInvertMatte:(BOOL)a8 inputIsInverted:(BOOL)a9 fillHoles:(BOOL)a10 scaling:(BOOL)a11 blendingGamma:(float)a12 preKeyedInputNode:(void *)a13 outputNode:(void *)a14;
- (PAEKeyerMatteTools)init;
@end

@implementation PAEKeyerMatteTools

- (PAEKeyerMatteTools)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerMatteTools;
  return [(PAEKeyerMatteTools *)&v3 init];
}

- (BOOL)addParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4 isLumaKey:(BOOL)a5
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    v7 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", @"Keyer::MatteFillHoles", @"Fill Holes", 0), 48, v5, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", @"Keyer::MatteFillHolesDistance", @"Edge Distance", 0), 54, v5, 3.0, 0.0, 100.0, 0.0, 25.0, 0.1);
  }
  return 1;
}

- (BOOL)addLevelsParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4
{
  if (a3) {
    objc_msgSend(a3, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyer::MatteLevels", @"Levels", 0), 49, 0, a4 | 0x20);
  }
  return 1;
}

- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4
{
  if (a3)
  {
    v6 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = a4 | 0x20;
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"Keyer::kMatteExpand", @"Shrink/Expand", 0), 53, v7, 0.0, -100.0, 100.0, -10.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"Keyer::MatteSoften", @"Soften", 0), 51, v7, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"Keyer::Erode", @"Erode", 0), 52, v7, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
  }
  return 1;
}

- (BOOL)doMatteManipulationWithParamAPI:(id)a3 withPrivateParamAPI:(id)a4 withInfo:(id *)a5 pixelAspectRatio:(float)a6 fieldHeight:(float)a7 doInvertMatte:(BOOL)a8 inputIsInverted:(BOOL)a9 fillHoles:(BOOL)a10 scaling:(BOOL)a11 blendingGamma:(float)a12 preKeyedInputNode:(void *)a13 outputNode:(void *)a14
{
  BOOL v15 = a10;
  BOOL v16 = a8;
  if (a9)
  {
    v22 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v22);
    (*(void (**)(HgcInvertAlpha *, void, void))(*(void *)v22 + 120))(v22, 0, *(void *)a14);
    uint64_t v23 = *(void *)a14;
    if (*(HgcInvertAlpha **)a14 != v22)
    {
      if (v23) {
        (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
      }
      *(void *)a14 = v22;
      (*(void (**)(HgcInvertAlpha *))(*(void *)v22 + 16))(v22);
    }
    (*(void (**)(HgcInvertAlpha *))(*(void *)v22 + 24))(v22);
  }
  double v55 = 0.0;
  double v56 = 0.0;
  double v54 = 0.0;
  [a4 getLevelsBlack:&v56 White:&v55 Gamma:&v54 fromParm:49 atTime:a5->var0.var1];
  double v24 = v54;
  if (v56 != 0.0 || v55 != 1.0 || v54 != 1.0)
  {
    double v27 = 1000.0;
    if (v54 >= 0.001) {
      double v27 = 1.0 / v54;
    }
    double v54 = v27;
    v28 = (HLevels *)HGObject::operator new(0x1A0uLL);
    HLevels::HLevels(v28);
  }
  if (v15)
  {
    double v53 = 0.0;
    [a3 getFloatValue:&v53 fromParm:48 atFxTime:a5->var0.var1];
    double v24 = v53;
    if (v53 != 0.0)
    {
      v29 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v29);
      float v30 = v53;
      v29[102] = v30;
      (*(void (**)(float *, void, void))(*(void *)v29 + 120))(v29, 0, *(void *)a14);
      double v52 = 0.0;
      [a3 getFloatValue:&v52 fromParm:54 atFxTime:a5->var0.var1];
      v31 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v31);
      float v32 = -v53 - v52;
      v31[102] = v32;
      (*(void (**)(float *, void, float *))(*(void *)v31 + 120))(v31, 0, v29);
      v33 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v33);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v33 + 96))(v33, 0, 39.0, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, float, double, double, double))(*(void *)v33 + 96))(v33, 5, a12, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, void, void))(*(void *)v33 + 120))(v33, 0, *(void *)a14);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, float *))(*(void *)v33 + 120))(v33, 1, v31);
      uint64_t v34 = *(void *)a14;
      if (*(HGHWBlendFlipped **)a14 != v33)
      {
        if (v34) {
          (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
        }
        *(void *)a14 = v33;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v33 + 16))(v33);
      }
      (*(void (**)(HGHWBlendFlipped *))(*(void *)v33 + 24))(v33);
      (*(void (**)(float *))(*(void *)v31 + 24))(v31);
      (*(void (**)(float *))(*(void *)v29 + 24))(v29);
    }
  }
  if (a11)
  {
    double v53 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v53, 53, a5->var0.var1, v24);
    double v35 = v53;
    if (v53 != 0.0)
    {
      v36 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v36);
      float v37 = v53;
      v36[102] = v37;
      (*(void (**)(float *, void, void))(*(void *)v36 + 120))(v36, 0, *(void *)a14);
      uint64_t v38 = *(void *)a14;
      if (*(float **)a14 != v36)
      {
        if (v38) {
          (*(void (**)(uint64_t))(*(void *)v38 + 24))(v38);
        }
        *(void *)a14 = v36;
        (*(void (**)(float *))(*(void *)v36 + 16))(v36);
      }
      (*(void (**)(float *))(*(void *)v36 + 24))(v36);
    }
    double v52 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v52, 51, a5->var0.var1, v35);
    double v39 = v52;
    if (v52 != 0.0)
    {
      double v52 = v52 * 4.0;
      v40 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur(v40);
      float v41 = v52;
      float v42 = a5->var3 / a6;
      float v43 = a5->var4 / a7;
      HGaussianBlur::init(v40, v41, v42, v43, 0, 0, 0);
      (*(void (**)(HGaussianBlur *, void, void))(*(void *)v40 + 120))(v40, 0, *(void *)a14);
      uint64_t v44 = *(void *)a14;
      if (*(HGaussianBlur **)a14 != v40)
      {
        if (v44) {
          (*(void (**)(uint64_t))(*(void *)v44 + 24))(v44);
        }
        *(void *)a14 = v40;
        (*(void (**)(HGaussianBlur *))(*(void *)v40 + 16))(v40);
      }
      (*(void (**)(HGaussianBlur *))(*(void *)v40 + 24))(v40);
    }
    double v51 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v51, 52, a5->var0.var1, v39);
    if (v51 > 0.0)
    {
      v45 = (float *)HGObject::operator new(0x1B0uLL);
      HErode::HErode((HErode *)v45);
      float v46 = v51;
      v45[102] = v46;
      (*(void (**)(float *, void, void))(*(void *)v45 + 120))(v45, 0, *(void *)a14);
      uint64_t v47 = *(void *)a14;
      if (*(float **)a14 != v45)
      {
        if (v47) {
          (*(void (**)(uint64_t))(*(void *)v47 + 24))(v47);
        }
        *(void *)a14 = v45;
        (*(void (**)(float *))(*(void *)v45 + 16))(v45);
      }
      (*(void (**)(float *))(*(void *)v45 + 24))(v45);
    }
  }
  if (v16)
  {
    v48 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v48);
    (*(void (**)(HgcInvertAlpha *, void, void))(*(void *)v48 + 120))(v48, 0, *(void *)a14);
    uint64_t v49 = *(void *)a14;
    if (*(HgcInvertAlpha **)a14 != v48)
    {
      if (v49) {
        (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
      }
      *(void *)a14 = v48;
      (*(void (**)(HgcInvertAlpha *))(*(void *)v48 + 16))(v48);
    }
    (*(void (**)(HgcInvertAlpha *))(*(void *)v48 + 24))(v48);
  }
  return 1;
}

- (BOOL)doMatteManipulationWithInfo:(id *)a3 pixelAspectRatio:(float)a4 fieldHeight:(float)a5 doInvertMatte:(BOOL)a6 inputIsInverted:(BOOL)a7 fillHoles:(BOOL)a8 scaling:(BOOL)a9 blendingGamma:(float)a10 blackLevel:(double)a11 whiteLevel:(double)a12 gammaLevel:(double)a13 preKeyedInputNode:(void *)a14 outputNode:(void *)a15
{
  BOOL v18 = a6;
  if (a7)
  {
    v19 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v19);
    (*(void (**)(HgcInvertAlpha *, void, void))(*(void *)v19 + 120))(v19, 0, *(void *)a15);
    uint64_t v20 = *(void *)a15;
    if (*(HgcInvertAlpha **)a15 != v19)
    {
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
      }
      *(void *)a15 = v19;
      (*(void (**)(HgcInvertAlpha *))(*(void *)v19 + 16))(v19);
    }
    (*(void (**)(HgcInvertAlpha *))(*(void *)v19 + 24))(v19);
  }
  if (a11 != 0.0 || a12 != 1.0 || a13 != 1.0)
  {
    uint64_t v23 = (HLevels *)HGObject::operator new(0x1A0uLL);
    HLevels::HLevels(v23);
  }
  if (v18)
  {
    double v24 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v24);
    (*(void (**)(HgcInvertAlpha *, void, void))(*(void *)v24 + 120))(v24, 0, *(void *)a15);
    uint64_t v25 = *(void *)a15;
    if (*(HgcInvertAlpha **)a15 != v24)
    {
      if (v25) {
        (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
      }
      *(void *)a15 = v24;
      (*(void (**)(HgcInvertAlpha *))(*(void *)v24 + 16))(v24);
    }
    (*(void (**)(HgcInvertAlpha *))(*(void *)v24 + 24))(v24);
  }
  return 1;
}

@end