@interface PAEChannelMixer
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)constrainMonoParams:(int)a3 atTime:(id)a4;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)monochromeChanged:(id)a3;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEChannelMixer)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 fromParam:(int)a7 atFxTime:(id)a8;
@end

@implementation PAEChannelMixer

- (PAEChannelMixer)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEChannelMixer;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEChannelMixer properties]::once != -1) {
    dispatch_once(&-[PAEChannelMixer properties]::once, &__block_literal_global_35);
  }
  return (id)-[PAEChannelMixer properties]::sPropertiesDict;
}

uint64_t __29__PAEChannelMixer_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC2F8, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SupportsInternalMixing", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
  -[PAEChannelMixer properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEChannelMixer;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::RedOutput", @"Red Output", 0), 1, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::RedInputRed", @"Red - Red", 0), 2, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::RedInputGreen", @"Red - Green", 0), 3, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::RedInputBlue", @"Red - Blue", 0), 4, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::RedInputAlpha", @"Red - Alpha", 0), 5, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::GreenOutput", @"Green Output", 0), 6, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::GreenInputRed", @"Green - Red", 0), 7, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::GreenInputGreen", @"Green - Green", 0), 8, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::GreenInputBlue", @"Green - Blue", 0), 9, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::GreenInputAlpha", @"Green - Alpha", 0), 10, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::BlueOutput", @"Blue Output", 0), 11, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::BlueInputRed", @"Blue - Red", 0), 12, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::BlueInputGreen", @"Blue - Green", 0), 13, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::BlueInputBlue", @"Blue - Blue", 0), 14, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::BlueInputAlpha", @"Blue - Alpha", 0), 15, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AlphaOutput", @"Alpha Output", 0), 16, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AlphaInputRed", @"Alpha - Red", 0), 17, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AlphaInputGreen", @"Alpha - Green", 0), 18, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AlphaInputBlue", @"Alpha - Blue", 0), 19, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AlphaInputAlpha", @"Alpha - Alpha", 0), 20, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    [v3 endParameterSubGroup];
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::Monochrome", @"Monochrome", 0), 21, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::AllowOverMax", @"Allow Values Over Maximum", 0), 22, 1, 5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::IncludeAlpha", @"Include Alpha When Constraining", 0), 23, 0, 5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"ChannelMixer::ProcessInGamma", 0, 0), 24, 0, 0);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 0;
}

- (BOOL)monochromeChanged:(id)a3
{
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v6 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 0;
  }
  v9 = (void *)v6;
  char v15 = 0;
  int v10 = [v5 getBoolValue:&v15 fromParm:21 atFxTime:a3.var1];
  BOOL result = 0;
  if (v10)
  {
    int v14 = 0;
    uint64_t v13 = 0;
    int v12 = 0;
    if ([v5 getParameterFlags:&v14 fromParm:22]
      && [v5 getParameterFlags:(char *)&v13 + 4 fromParm:23]
      && [v5 getParameterFlags:&v13 fromParm:6]
      && [v5 getParameterFlags:&v12 fromParm:11])
    {
      if (v15)
      {
        if ((v14 & 4) != 0) {
          [v9 setParameterFlags:v14 & 0xFFFFFFFB toParm:22];
        }
        if ((v13 & 0x400000000) != 0) {
          [v9 setParameterFlags:HIDWORD(v13) & 0xFFFFFFFB toParm:23];
        }
        if ((v13 & 4) == 0) {
          [v9 setParameterFlags:v13 | 4 toParm:6];
        }
        if ((v12 & 4) != 0) {
          return [(PAEChannelMixer *)self constrainMonoParams:2 atTime:a3.var1];
        }
        uint64_t v11 = v12 | 4u;
      }
      else
      {
        if ((v14 & 4) == 0) {
          [v9 setParameterFlags:v14 | 4u toParm:22];
        }
        if ((v13 & 0x400000000) == 0) {
          [v9 setParameterFlags:HIDWORD(v13) | 4u toParm:23];
        }
        if ((v13 & 4) != 0) {
          [v9 setParameterFlags:v13 & 0xFFFFFFFB toParm:6];
        }
        if ((v12 & 4) == 0) {
          return [(PAEChannelMixer *)self constrainMonoParams:2 atTime:a3.var1];
        }
        uint64_t v11 = v12 & 0xFFFFFFFB;
      }
      [v9 setParameterFlags:v11 toParm:11];
    }
    return [(PAEChannelMixer *)self constrainMonoParams:2 atTime:a3.var1];
  }
  return result;
}

- (BOOL)constrainMonoParams:(int)a3 atTime:(id)a4
{
  int v4 = a3 - 2;
  if ((a3 - 2) > 3)
  {
LABEL_68:
    LOBYTE(v11) = 1;
    return v11;
  }
  v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
LABEL_7:
    LOBYTE(v11) = 0;
    return v11;
  }
  int v12 = (void *)v9;
  char v44 = 0;
  char v43 = 1;
  char v42 = 0;
  int v13 = [v8 getBoolValue:&v44 fromParm:21 atFxTime:a4.var1];
  LOBYTE(v11) = 0;
  if (v13)
  {
    int v11 = [v8 getBoolValue:&v43 fromParm:22 atFxTime:a4.var1];
    if (v11)
    {
      if ([v8 getBoolValue:&v42 fromParm:23 atFxTime:a4.var1]) {
        BOOL v14 = v44 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      BOOL v15 = !v14 && v43 == 0;
      if (v15 && (a3 != 5 || v42))
      {
        double v40 = 0.0;
        double v41 = 0.0;
        double v38 = 0.0;
        double v39 = 0.0;
        [v8 getFloatValue:&v41 fromParm:2 atFxTime:a4.var1];
        [v8 getFloatValue:&v40 fromParm:3 atFxTime:a4.var1];
        [v8 getFloatValue:&v39 fromParm:4 atFxTime:a4.var1];
        [v8 getFloatValue:&v38 fromParm:5 atFxTime:a4.var1];
        HIDWORD(v24) = HIDWORD(v40);
        *(float *)&double v23 = v41;
        *(float *)&double v24 = v40;
        float v25 = v39;
        if (v42)
        {
          switch(v4)
          {
            case 0:
              double v26 = v38;
              float v27 = v41;
              *(float *)&double v23 = v40;
              goto LABEL_44;
            case 1:
              double v26 = v38;
              float v27 = v40;
LABEL_44:
              *(float *)&double v24 = v39;
              goto LABEL_46;
            case 2:
              double v26 = v38;
              float v27 = v39;
LABEL_46:
              float v25 = v26;
              break;
            case 3:
              float v27 = v38;
              break;
            default:
              PCPrint("File %s, line %d should not have been reached:\n\t", v16, v17, v18, v19, v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEChannelMixer.mm");
              pcAbortImpl();
          }
          float v31 = 1.0 - v27;
          if (v25 == 0.0 || v25 == (float)-(float)(*(float *)&v23 + *(float *)&v24))
          {
            float v32 = v31 / 3.0;
            float v33 = v31 / 3.0;
            float v34 = v31 / 3.0;
          }
          else
          {
            float v34 = v31 / ((float)((float)(*(float *)&v23 + *(float *)&v24) / v25) + 1.0);
            float v33 = (float)(*(float *)&v24 * v34) / v25;
            float v32 = (float)(*(float *)&v23 * v34) / v25;
          }
          switch(v4)
          {
            case 0:
              double v41 = v27;
              double v39 = v33;
              double v40 = v32;
              double v38 = v34;
              goto LABEL_62;
            case 1:
              double v40 = v27;
              double v41 = v32;
              double v38 = v34;
              double v39 = v33;
              goto LABEL_60;
            case 2:
              double v39 = v27;
              double v40 = v33;
              double v41 = v32;
              double v38 = v34;
              goto LABEL_56;
            case 3:
              double v38 = v27;
              double v40 = v33;
              double v41 = v32;
              double v39 = v34;
              goto LABEL_56;
            default:
              goto LABEL_56;
          }
        }
        if (a3 == 3) {
          float v28 = v40;
        }
        else {
          float v28 = v41;
        }
        if (a3 == 3) {
          float v29 = v41;
        }
        else {
          float v29 = v40;
        }
        if (a3 == 4) {
          float v28 = v39;
        }
        else {
          *(float *)&double v23 = v29;
        }
        if (a3 == 4) {
          float v25 = v40;
        }
        float v30 = 1.0 - v28;
        if (*(float *)&v23 == 0.0 || *(float *)&v23 == (float)-v25)
        {
          *(float *)&double v24 = v30 * 0.5;
          LODWORD(v23) = LODWORD(v24);
        }
        else
        {
          double v23 = v30 / ((float)(*(float *)&v23 / v25) + 1.0);
          *(float *)&double v23 = v23;
          *(float *)&double v24 = v30 - *(float *)&v23;
        }
        switch(a3)
        {
          case 2:
            double v40 = *(float *)&v24;
            double v41 = v28;
            double v39 = *(float *)&v23;
            break;
          case 3:
            double v40 = v28;
            double v41 = *(float *)&v24;
            double v39 = *(float *)&v23;
LABEL_60:
            v35 = v12;
            uint64_t v36 = 2;
            goto LABEL_63;
          case 4:
            double v41 = *(float *)&v24;
            double v39 = v28;
            double v40 = *(float *)&v23;
LABEL_56:
            objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 2, a4.var1);
            [v12 setFloatValue:3 toParm:a4.var1 atFxTime:v40];
            if (a3 == 4) {
              goto LABEL_65;
            }
            goto LABEL_64;
          default:
            objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 2, a4.var1, v41, v23, v24, v28);
            break;
        }
LABEL_62:
        v35 = v12;
        uint64_t v36 = 3;
LABEL_63:
        objc_msgSend(v35, "setFloatValue:toParm:atFxTime:", v36, a4.var1);
LABEL_64:
        [v12 setFloatValue:4 toParm:a4.var1 atFxTime:v39];
LABEL_65:
        if (a3 != 5 && v42) {
          [v12 setFloatValue:5 toParm:a4.var1 atFxTime:v38];
        }
        goto LABEL_68;
      }
      goto LABEL_7;
    }
  }
  return v11;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v27 = 0;
    uint64_t v28 = 0x3FF0000000000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v23 = 0x3FF0000000000000;
    uint64_t v24 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0x3FF0000000000000;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v13 = 0x3FF0000000000000;
    uint64_t v14 = 0;
    char v12 = 0;
    [(PAEChannelMixer *)self getRed:&v28 green:&v27 blue:&v26 alpha:&v25 fromParam:2 atFxTime:a5->var0.var1];
    [(PAEChannelMixer *)self getRed:&v24 green:&v23 blue:&v22 alpha:&v21 fromParam:7 atFxTime:a5->var0.var1];
    [(PAEChannelMixer *)self getRed:&v20 green:&v19 blue:&v18 alpha:&v17 fromParam:12 atFxTime:a5->var0.var1];
    [(PAEChannelMixer *)self getRed:&v16 green:&v15 blue:&v14 alpha:&v13 fromParam:17 atFxTime:a5->var0.var1];
    [v9 getBoolValue:&v12 fromParm:21 atFxTime:a5->var0.var1];
    [v9 mixAmountAtTime:a5->var0.var1];
    LODWORD(v8) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v8)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        BOOL v10 = (HChannelMixer *)HGObject::operator new(0x1A0uLL);
        HChannelMixer::HChannelMixer(v10);
      }
      LOBYTE(v8) = 0;
    }
  }
  return v8;
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

- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 fromParam:(int)a7 atFxTime:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v14 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  [v14 getFloatValue:a3 fromParm:v9 atFxTime:a8.var1];
  [v14 getFloatValue:a4 fromParm:(v9 + 1) atFxTime:a8.var1];
  [v14 getFloatValue:a5 fromParm:(v9 + 2) atFxTime:a8.var1];

  [v14 getFloatValue:a6 fromParm:(v9 + 3) atFxTime:a8.var1];
}

@end