@interface PAEStroke
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEStroke)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEStroke

- (PAEStroke)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEStroke;
  result = [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
  result->_thresholdDefault = 0.5001;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEStroke;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsHeliumRendering", v6, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEStroke;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Type", 0, 0), 1, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Color", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Gradient", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::OutlineGradient", 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::OutlineColor", 0, 0), 2, 0, 1.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Gradient", 0, 0), 3, 2);
    [v3 setGradientHiddenWithOSC:1 toParam:3];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Width", 0, 0), 4, 0, 10.0, 1.0, 300.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Position", 0, 0), 5, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Outside", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Centered", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Inside", 0, 0), 0), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Offset", 0, 0), 6, 0, 0.0, -500.0, 300.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Threshold", 0, 0), 7, 0, self->_thresholdDefault, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Hidden::ThresholdChanged", 0, 0), 14, 0, 2);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::FadeInside", 0, 0), 8, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::FadeOutside", 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::FadeWidth", 0, 0), 13, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::FadeFalloff", 0, 0), 10, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::Hide", 0, 0), 12, 0, 33);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::BlendMode", 0, 0), 11, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::NormalMode", 0, 0), @"-", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::SubtractMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::DarkenMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::MultiplyMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::ColorBurnMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::LinearBurnMode", 0, 0), @"-", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::AddMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::LightenMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Stroke::ScreenMode", 0, 0),
        [v4 localizedStringForKey:@"Stroke::ColorDodgeMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::LinearDodgeMode" value:0 table:0],
        @"-",
        [v4 localizedStringForKey:@"Stroke::OverlayMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::SoftLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::HardLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::VividLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::LinearLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::PinLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::HardMixMode" value:0 table:0],
        @"-",
        [v4 localizedStringForKey:@"Stroke::DifferenceMode" value:0 table:0],
        [v4 localizedStringForKey:@"Stroke::ExclusionMode" value:0 table:0],
        0),
      1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  objc_super v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F122C1D8];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0) {
    return 0;
  }
  v11 = (void *)v7;
  long long v28 = *MEMORY[0x1E4F1FA48];
  uint64_t v29 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  unsigned __int8 v27 = 0;
  [v5 getBoolValue:&v27 fromParm:14 atFxTime:&v28];
  double v26 = 0.0;
  [v5 getFloatValue:&v26 fromParm:7 atFxTime:&v28];
  int v13 = v27;
  if (a3 == 7 && v27)
  {
    double v12 = v26;
    if (v26 != self->_thresholdDefault) {
      goto LABEL_34;
    }
    objc_msgSend(v6, "setBoolValue:toParm:atFxTime:", 0, 14, &v28, v26);
    LODWORD(v25) = 0;
    [v5 getIntValue:&v25 fromParm:5 atFxTime:&v28];
    if (v25)
    {
      if (v25 == 2)
      {
        double thresholdDefault = 0.0;
      }
      else
      {
        if (v25 != 1)
        {
LABEL_20:
          int v13 = v27;
          goto LABEL_21;
        }
        double thresholdDefault = 1.0;
      }
    }
    else
    {
      double thresholdDefault = self->_thresholdDefault;
    }
    [v6 setFloatValue:7 toParm:&v28 atFxTime:thresholdDefault];
    goto LABEL_20;
  }
LABEL_21:
  if (a3 != 7 || v13)
  {
    if (a3 != 5 || v13) {
      goto LABEL_34;
    }
    LODWORD(v25) = 0;
    [v5 getIntValue:&v25 fromParm:5 atFxTime:&v28];
    if (v25)
    {
      if (v25 == 2)
      {
        double v15 = 0.0;
      }
      else
      {
        if (v25 != 1) {
          goto LABEL_34;
        }
        double v15 = 1.0;
      }
    }
    else
    {
      double v15 = self->_thresholdDefault;
    }
    [v6 setFloatValue:7 toParm:&v28 atFxTime:v15];
  }
  else
  {
    double v12 = v26;
    if (v26 != self->_thresholdDefault) {
      objc_msgSend(v6, "setBoolValue:toParm:atFxTime:", 1, 14, &v28, v26);
    }
  }
LABEL_34:
  uint64_t v25 = 0;
  objc_msgSend(v11, "keyframeCount:forParam:andChannel:", &v25, 7, 0, v12);
  if (v25) {
    [v6 setBoolValue:1 toParm:14 atFxTime:&v28];
  }
  if (a3 == 12)
  {
    LOBYTE(v23) = 0;
    [v5 getBoolValue:&v23 fromParm:12 atFxTime:&v28];
    int v24 = 0;
    [v5 getParameterFlags:&v24 fromParm:11];
    uint64_t v18 = v24 & 0xFFFFFFFD | (2 * v23);
    v19 = v6;
    uint64_t v20 = 11;
LABEL_47:
    [v19 setParameterFlags:v18 toParm:v20];
    return 1;
  }
  if (a3 == 1)
  {
    int v24 = 0;
    [v5 getIntValue:&v24 fromParm:1 atFxTime:&v28];
    unsigned int v22 = 0;
    int v23 = 0;
    [v5 getParameterFlags:&v23 fromParm:2];
    [v5 getParameterFlags:&v22 fromParm:3];
    switch(v24)
    {
      case 2:
        [v5 setGradientHiddenWithOSC:0 toParam:3];
        unsigned int v21 = v22 & 0xFFFFFFDD | 0x20;
        break;
      case 1:
        [v5 setGradientHiddenWithOSC:0 toParam:3];
        unsigned int v21 = v22 & 0xFFFFFFDD;
        break;
      case 0:
        uint64_t v16 = 3;
        [v5 setGradientHiddenWithOSC:1 toParam:3];
        [v6 setParameterFlags:v23 & 0xFFFFFFFD toParm:2];
        v17 = &v22;
LABEL_46:
        uint64_t v18 = *v17 | 2;
        v19 = v6;
        uint64_t v20 = v16;
        goto LABEL_47;
      default:
        return 0;
    }
    unsigned int v22 = v21;
    objc_msgSend(v6, "setParameterFlags:toParm:");
    uint64_t v16 = 2;
    v17 = (unsigned int *)&v23;
    goto LABEL_46;
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  objc_super v6 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      self = (PAEStroke *)[(PROAPIAccessing *)v6->super.super._apiManager apiForProtocol:&unk_1F121D130];
      if (self)
      {
        v11 = self;
        double v21 = 0.0;
        [(PAEStroke *)self getFloatValue:&v21 fromParm:4 atFxTime:a6->var0.var1];
        int v20 = 0;
        [(PAEStroke *)v11 getIntValue:&v20 fromParm:5 atFxTime:a6->var0.var1];
        double v19 = 0.0;
        [(PAEStroke *)v11 getFloatValue:&v19 fromParm:6 atFxTime:a6->var0.var1];
        float v12 = v21 * -0.5;
        if (v20 != 1) {
          float v12 = 0.0;
        }
        float v13 = v21;
        float v14 = -v13;
        if (v20 == 2) {
          float v12 = v14;
        }
        float v15 = v21 + v19 + v12;
        if (v15 > 0.0)
        {
          unint64_t var1 = a5->var1;
          signed int v17 = 2 * vcvtps_s32_f32(v15);
          *a3 = a5->var0 + v17;
          *a4 = var1 + v17;
        }
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  BOOL v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    uint64_t v56 = v10;
    LOBYTE(v12) = 0;
    if ([a4 imageType] == 3 && v56)
    {
      v84[0] = 0;
      [v8 getIntValue:v84 fromParm:1 atFxTime:a5->var0.var1];
      uint64_t v82 = 0;
      uint64_t v83 = 0;
      uint64_t v80 = 0;
      uint64_t v81 = 0;
      [v8 getRedValue:&v83 greenValue:&v82 blueValue:&v81 alphaValue:&v80 fromParm:2 atFxTime:a5->var0.var1];
      uint64_t v78 = 0;
      uint64_t v79 = 0;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      int v75 = 0;
      [v8 getGradientStartEnd:&v79 startY:&v78 endX:&v77 endY:&v76 type:&v75 fromParm:3 atFxTime:a5->var0.var1];
      double v74 = 0.0;
      [v8 getFloatValue:&v74 fromParm:4 atFxTime:a5->var0.var1];
      int v73 = 0;
      [v8 getIntValue:&v73 fromParm:5 atFxTime:a5->var0.var1];
      double v72 = 0.0;
      [v8 getFloatValue:&v72 fromParm:6 atFxTime:a5->var0.var1];
      double v71 = 0.0;
      [v8 getFloatValue:&v71 fromParm:7 atFxTime:a5->var0.var1];
      double v71 = fmin(fmax(v71, 0.01), 0.99);
      uint64_t v70 = 0;
      [v8 getFloatValue:&v70 fromParm:8 atFxTime:a5->var0.var1];
      uint64_t v69 = 0;
      [v8 getFloatValue:&v69 fromParm:9 atFxTime:a5->var0.var1];
      uint64_t v68 = 0;
      [v8 getFloatValue:&v68 fromParm:13 atFxTime:a5->var0.var1];
      uint64_t v67 = 0;
      [v8 getFloatValue:&v67 fromParm:10 atFxTime:a5->var0.var1];
      char v66 = 0;
      [v8 getBoolValue:&v66 fromParm:12 atFxTime:a5->var0.var1];
      int v65 = 0;
      [v8 getIntValue:&v65 fromParm:11 atFxTime:a5->var0.var1];
      if (a4)
      {
        [a4 heliumRef];
        v63 = v64;
        if (v64) {
          (*(void (**)(HGXForm *))(*(void *)v64 + 16))(v64);
        }
      }
      else
      {
        v64 = 0;
        v63 = 0;
      }
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
      HGTransform::HGTransform((HGTransform *)v58);
      HGTransform::Scale((HGTransform *)v58, v59, v61, 1.0);
      HGTransform::Translate((HGTransform *)v58, v60, v62, 0.0);
      float v13 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v13);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v13 + 576))(v13, v58);
      (*(void (**)(HGXForm *, void, HGXForm *))(*(void *)v13 + 120))(v13, 0, v64);
      if (v63 != v13)
      {
        if (v63) {
          (*(void (**)(void))(*(void *)v63 + 24))();
        }
        v63 = v13;
        (*(void (**)(HGXForm *))(*(void *)v13 + 16))(v13);
      }
      float v14 = v74 * -0.5;
      if (v73 != 1) {
        float v14 = 0.0;
      }
      float v15 = v74;
      float v16 = -v15;
      if (v73 == 2) {
        float v14 = v16;
      }
      float v17 = v72 + v14;
      float v18 = v74 + v17;
      if (v18 >= 1.0 || v18 <= 0.0) {
        float v20 = v74 + v17;
      }
      else {
        float v20 = 1.0;
      }
      if (v20 == 0.0)
      {
        float v20 = v20 + -0.001;
        float v17 = v17 + -0.001;
      }
      float v21 = ceilf(v20);
      if (v21 > 1.0) {
        float v22 = v21;
      }
      else {
        float v22 = 1.0;
      }
      int v23 = (HMaskAlpha *)HGObject::operator new(0x1B0uLL);
      HMaskAlpha::HMaskAlpha(v23, (int)v22);
      v55 = v23;
      (*(void (**)(HMaskAlpha *, void, HGXForm *))(*(void *)v23 + 120))(v23, 0, v13);
      float v24 = v71;
      (*(void (**)(HMaskAlpha *, void, double, float, double, double))(*(void *)v23 + 96))(v23, 0, 0.0, v24, 0.0, 0.0);
      uint64_t v25 = (HMaskAlpha *)HGObject::operator new(0x1B0uLL);
      HMaskAlpha::HMaskAlpha(v25, (int)v22);
      v54 = v25;
      (*(void (**)(HMaskAlpha *, void, HGXForm *))(*(void *)v25 + 120))(v25, 0, v13);
      float v26 = v71;
      (*(void (**)(HMaskAlpha *, void, float, float, double, double))(*(void *)v25 + 96))(v25, 0, 1.0, v26, 0.0, 0.0);
      unsigned __int8 v27 = (HGMPSImageEDT *)HGObject::operator new(0x1B0uLL);
      HGMPSImageEDT::HGMPSImageEDT(v27, vcvtps_s32_f32(v20 + 1.0));
      (*(void (**)(HGMPSImageEDT *, void, HMaskAlpha *))(*(void *)v27 + 120))(v27, 0, v55);
      (*(void (**)(HGMPSImageEDT *, uint64_t, uint64_t))(*(void *)v27 + 136))(v27, 0xFFFFFFFFLL, 2);
      (*(void (**)(HGMPSImageEDT *, void, uint64_t))(*(void *)v27 + 136))(v27, 0, 2);
      HGNode::SetOutputFormatComponents((const char *)v27, (const char *)4, v28);
      HGNode::SetSupportedFormatPrecisions((HGNode *)v27, (const char *)0xC, v29);
      v30 = (HGMPSImageEDT *)HGObject::operator new(0x1B0uLL);
      HGMPSImageEDT::HGMPSImageEDT(v30, vcvtps_s32_f32(fabsf(v17)));
      (*(void (**)(HGMPSImageEDT *, void, HMaskAlpha *))(*(void *)v30 + 120))(v30, 0, v25);
      (*(void (**)(HGMPSImageEDT *, uint64_t, uint64_t))(*(void *)v30 + 136))(v30, 0xFFFFFFFFLL, 2);
      (*(void (**)(HGMPSImageEDT *, void, uint64_t))(*(void *)v30 + 136))(v30, 0, 2);
      HGNode::SetOutputFormatComponents((const char *)v30, (const char *)4, v31);
      HGNode::SetSupportedFormatPrecisions((HGNode *)v30, (const char *)0xC, v32);
      v33 = (HgcReconstructDT *)HGObject::operator new(0x1A0uLL);
      HgcReconstructDT::HgcReconstructDT(v33);
      (*(void (**)(HgcReconstructDT *, void, HGMPSImageEDT *))(*(void *)v33 + 120))(v33, 0, v27);
      (*(void (**)(HgcReconstructDT *, void, float, float, double, double))(*(void *)v33 + 96))(v33, 0, 1.0, 1.0, 0.0, 0.0);
      HGNode::SetOutputFormatComponents((const char *)v33, (const char *)4, v34);
      HGNode::SetSupportedFormatPrecisions((HGNode *)v33, (const char *)0xC, v35);
      v36 = (HgcReconstructDT *)HGObject::operator new(0x1A0uLL);
      HgcReconstructDT::HgcReconstructDT(v36);
      (*(void (**)(HgcReconstructDT *, void, HGMPSImageEDT *))(*(void *)v36 + 120))(v36, 0, v30);
      (*(void (**)(HgcReconstructDT *, void, float, float, double, double))(*(void *)v36 + 96))(v36, 0, 1.0, -1.0, 0.0, 0.0);
      HGNode::SetOutputFormatComponents((const char *)v36, (const char *)4, v37);
      HGNode::SetSupportedFormatPrecisions((HGNode *)v36, (const char *)0xC, v38);
      if (!v84[0])
      {
        v51 = (HgcColorAndGradientStroke *)HGObject::operator new(0x1A0uLL);
        HgcColorAndGradientStroke::HgcColorAndGradientStroke(v51);
      }
      if (v84[0] == 1) {
        float v39 = 512.0;
      }
      else {
        float v39 = v74;
      }
      uint64_t v40 = HGRectMake4i(0, 0, (int)v39, 1u);
      uint64_t v42 = v41;
      float v12 = (HGBitmap *)HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v12, v40, v42, 28);
      [v8 getGradientSamples:*((void *)v12 + 10) numSamples:(unint64_t)v39 depth:4 fromParm:3 atFxTime:a5->var0.var1];
      if (v39 > 0.0)
      {
        uint64_t v43 = 0;
        uint64_t v44 = *((void *)v12 + 10);
        uint64_t v45 = v44;
        do
        {
          uint64_t v46 = 0;
          v47 = (int *)(v44 + 16 * v43);
          int v48 = *v47;
          do
          {
            *(_DWORD *)(v45 + v46) = *(_DWORD *)(v45 + v46 + 4);
            v46 += 4;
          }
          while (v46 != 12);
          v47[3] = v48;
          ++v43;
          v45 += 16;
        }
        while (v39 > (float)(int)v43);
      }
      v49 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v49, v12);
      (*(void (**)(HGBitmapLoader *, uint64_t, uint64_t))(*(void *)v49 + 136))(v49, 0xFFFFFFFFLL, 4);
      if (v84[0] == 2)
      {
        v52 = (HgcOutlineGradientStroke *)HGObject::operator new(0x1A0uLL);
        HgcOutlineGradientStroke::HgcOutlineGradientStroke(v52);
      }
      if (v84[0] == 1)
      {
        v50 = (HgcColorAndGradientStroke *)HGObject::operator new(0x1A0uLL);
        HgcColorAndGradientStroke::HgcColorAndGradientStroke(v50);
      }
      NSLog(&cfstr_InvalidStrokeT.isa);
      (*(void (**)(HGBitmapLoader *))(*(void *)v49 + 24))(v49);
      if (v12)
      {
        (*(void (**)(HGBitmap *))(*(void *)v12 + 24))(v12);
        LOBYTE(v12) = 0;
      }
      (*(void (**)(HgcReconstructDT *))(*(void *)v36 + 24))(v36);
      (*(void (**)(HgcReconstructDT *))(*(void *)v33 + 24))(v33);
      (*(void (**)(HGMPSImageEDT *))(*(void *)v30 + 24))(v30);
      (*(void (**)(HGMPSImageEDT *))(*(void *)v27 + 24))(v27);
      (*(void (**)(HMaskAlpha *))(*(void *)v54 + 24))(v54);
      (*(void (**)(HMaskAlpha *))(*(void *)v55 + 24))(v55);
      (*(void (**)(HGXForm *))(*(void *)v13 + 24))(v13);
      HGTransform::~HGTransform((HGTransform *)v58);
      if (v63) {
        (*(void (**)(HGXForm *))(*(void *)v63 + 24))(v63);
      }
      if (v64) {
        (*(void (**)(HGXForm *))(*(void *)v64 + 24))(v64);
      }
    }
  }
  return (char)v12;
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