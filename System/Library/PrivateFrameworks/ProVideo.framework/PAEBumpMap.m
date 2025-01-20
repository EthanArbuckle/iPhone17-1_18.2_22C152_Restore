@interface PAEBumpMap
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEBumpMap)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEBumpMap

- (PAEBumpMap)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBumpMap;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v10 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 3, a3.var1))
  {
    if (v10 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 1;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v6, v10), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v8)];
    id result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  v13.receiver = self;
  v13.super_class = (Class)PAEBumpMap;
  [(PAESharedDefaultBase *)&v13 addParameters];
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
    unsigned int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::Map Image", 0, 0), 1, 0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::Controls", 0, 0), 5, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::Angle And Scale", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::X and Y Distance", 0, 0), 0), 1);
    double v9 = 10.0;
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::Direction", 0, 0), 2, 0, 10.0, -6.28318531, 6.28318531);
    uint64_t v10 = [v8 localizedStringForKey:@"BumpMap::Amount" value:0 table:0];
    if (v7 >= 2) {
      double v11 = -10.0;
    }
    else {
      double v11 = -1.0;
    }
    if (v7 < 2) {
      double v9 = 1.0;
    }
    [v3 addFloatSliderWithName:v10 parmId:3 defaultValue:0 parameterMin:0.1 parameterMax:v11 sliderMin:v9 sliderMax:-1.0 delta:1.0 parmFlags:0.1];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::XScale", 0, 0), 6, 2, 0.1, v11, v9, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::YScale", 0, 0), 7, 2, 0.1, v11, v9, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BumpMap::Repeat Edges", 0, 0), 4, 0, 33);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  BOOL v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  BOOL v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  long long v20 = *MEMORY[0x1E4F1FA48];
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if (a3 != 5)
  {
    if ((a3 & 0xFFFFFFFE) == 6)
    {
      long double v16 = 0.0;
      double v17 = 0.0;
      [v5 getFloatValue:&v17 fromParm:6 atFxTime:&v20];
      [v5 getFloatValue:&v16 fromParm:7 atFxTime:&v20];
      double v14 = v16;
      double v13 = v17;
      objc_msgSend(v6, "setFloatValue:toParm:atFxTime:", 2, &v20, (double)atan2(v17, v16));
      uint64_t v10 = v6;
      double v11 = sqrt(v13 * v13 + v14 * v14);
      uint64_t v12 = 3;
    }
    else
    {
      if ((a3 & 0xFFFFFFFE) != 2) {
        return 1;
      }
      long double v16 = 0.0;
      double v17 = 0.0;
      [v5 getFloatValue:&v17 fromParm:2 atFxTime:&v20];
      [v5 getFloatValue:&v16 fromParm:3 atFxTime:&v20];
      double v8 = v16;
      __double2 v9 = __sincos_stret(v17);
      [v6 setFloatValue:6 toParm:&v20 atFxTime:v8 * v9.__sinval];
      uint64_t v10 = v6;
      double v11 = v8 * v9.__cosval;
      uint64_t v12 = 7;
    }
    [v10 setFloatValue:v12 toParm:&v20 atFxTime:v11];
    return 1;
  }
  LODWORD(v17) = 0;
  [v5 getIntValue:&v17 fromParm:5 atFxTime:&v20];
  LODWORD(v16) = 0;
  uint64_t v19 = 0;
  int v18 = 0;
  [v5 getParameterFlags:&v16 fromParm:2];
  [v5 getParameterFlags:(char *)&v19 + 4 fromParm:3];
  [v5 getParameterFlags:&v19 fromParm:6];
  [v5 getParameterFlags:&v18 fromParm:7];
  if (LODWORD(v17))
  {
    [v6 setParameterFlags:LODWORD(v16) | 2u toParm:2];
    [v6 setParameterFlags:HIDWORD(v19) | 2u toParm:3];
    [v6 setParameterFlags:v19 & 0xFFFFFFFD toParm:6];
    uint64_t v7 = v18 & 0xFFFFFFFD;
  }
  else
  {
    [v6 setParameterFlags:LODWORD(v16) & 0xFFFFFFFD toParm:2];
    [v6 setParameterFlags:HIDWORD(v19) & 0xFFFFFFFD toParm:3];
    [v6 setParameterFlags:v19 | 2 toParm:6];
    uint64_t v7 = v18 | 2u;
  }
  [v6 setParameterFlags:v7 toParm:7];
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  __double2 v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    goto LABEL_16;
  }
  uint64_t v12 = (void *)v10;
  if ([a4 imageType] != 3) {
    goto LABEL_16;
  }
  unsigned int v13 = [v12 versionAtCreation];
  char v39 = 0;
  double v37 = 0.0;
  double v38 = 0.0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  int v34 = 0;
  [v9 getFloatValue:&v37 fromParm:3 atFxTime:a5->var0.var1];
  if (v37 != 0.0)
  {
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v38, 2, a5->var0.var1, v37);
    [v9 getBoolValue:&v39 fromParm:4 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v36 fromParm:6 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v35 fromParm:7 atFxTime:a5->var0.var1];
    [v9 getIntValue:&v34 fromParm:5 atFxTime:a5->var0.var1];
    int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (!v14) {
      return v14;
    }
    if ([a4 imageType] == 3)
    {
      unint64_t var2 = a5->var2;
      unint64_t var5 = a5->var5;
      v30[0] = a5->var0.var1;
      v30[1] = 2;
      v30[2] = var2;
      __asm { FMOV            V1.2D, #1.0 }
      long long v31 = _Q1;
      unint64_t v32 = var5;
      id v33 = 0;
      [(PAESharedDefaultBase *)self getHeliumImage:&v33 layerOffsetX:0 layerOffsetY:0 requestInfo:v30 fromParm:1 atTime:v30[0]];
      [(PAESharedDefaultBase *)self getImageBoundary:a4];
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
      if (v33)
      {
        [(PAESharedDefaultBase *)self transformFromImage:v33 toImage:a4 fit:1];
        uint64_t v21 = v28;
        if (v28 && fabs(v37) >= 0.0000001)
        {
          if (a4) {
            [a4 heliumRef];
          }
          else {
            uint64_t v28 = 0;
          }
          if (v13 > 1)
          {
            if (v34)
            {
LABEL_38:
              uint64_t v23 = v28;
              if (v28)
              {
                (*(void (**)(uint64_t))(*(void *)v28 + 16))(v28);
                if (!v39) {
                  goto LABEL_51;
                }
                uint64_t v26 = v28;
                (*(void (**)(uint64_t))(*(void *)v28 + 16))(v28);
              }
              else
              {
                if (!v39) {
                  goto LABEL_51;
                }
                uint64_t v26 = 0;
              }
              [(PAESharedDefaultBase *)self smear:&v26 fromImage:a4 toImage:a4];
              if (v23 == v27)
              {
                if (v23) {
                  (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
                }
              }
              else
              {
                if (v23) {
                  (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
                }
                uint64_t v27 = 0;
              }
              if (v26) {
                (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
              }
LABEL_51:
              v24 = (HgcBumpMap *)HGObject::operator new(0x1A0uLL);
              HgcBumpMap::HgcBumpMap(v24);
            }
          }
          else
          {
            if (v34)
            {
              [a3 height];
              [a3 height];
              goto LABEL_38;
            }
            double v22 = v37;
            double v37 = v22 * (double)(unint64_t)[a3 height] / 640.0;
          }
          __sincos_stret(v38);
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v21 = 0;
      }
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v28 = 0;
      }
      [a3 setHeliumRef:&v28];
      if (v28) {
        (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
      }

      if (v21) {
        (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
      }
      goto LABEL_21;
    }
LABEL_16:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (a4) {
    objc_msgSend(a4, "heliumRef", v37);
  }
  else {
    uint64_t v29 = 0;
  }
  [a3 setHeliumRef:&v29];
  if (v29) {
    (*(void (**)(uint64_t))(*(void *)v29 + 24))(v29);
  }
LABEL_21:
  LOBYTE(v14) = 1;
  return v14;
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