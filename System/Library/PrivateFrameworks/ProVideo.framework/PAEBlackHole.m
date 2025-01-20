@interface PAEBlackHole
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEBlackHole)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEBlackHole

- (PAEBlackHole)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBlackHole;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:0];
  uint64_t v7 = [NSNumber numberWithInteger:3];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"PixelTransformSupport", v8, @"AutoColorProcessingSupport", objc_msgSend(NSNumber, "numberWithBool:", 0), @"InputSizeLimit", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEBlackHole;
  [(PAESharedDefaultBase *)&v10 addParameters];
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
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BlackHole::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"BlackHole::Amount", 0, 0), 2, 0, 150.0, 0.0, dbl_1B7E749B0[v7 == 0], 0.0, dbl_1B7E749C0[v7 == 0], 1.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    objc_super v10 = v9;
    __asm { FMOV            V0.2D, #0.5 }
    long long v49 = _Q0;
    [v9 getXValue:&v49 YValue:(char *)&v49 + 8 fromParm:1 atFxTime:a5->var0.var1];
    double v48 = 150.0;
    [v10 getFloatValue:&v48 fromParm:2 atFxTime:a5->var0.var1];
    int v16 = llround(log2(v48 * 0.125));
    if (v16 <= 1) {
      int v17 = 1;
    }
    else {
      int v17 = v16;
    }
    int v18 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v49 withImage:a4];
    long long v49 = *(_OWORD *)v36;
    if (v18 && [a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v47 = 0;
      }
      uint64_t v45 = 0;
      v46 = 0;
      v44 = &unk_1F1090DC0;
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v44, 1, 3);
      if ((int)v45 >= v17) {
        int v19 = v45;
      }
      else {
        int v19 = (2 * v17) | 1;
      }
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v44, v17, v19);
      if (SHIDWORD(v45) <= 0) {
        PCArray_base::badIndex(v20);
      }
      v22 = v46;
      uint64_t v21 = v47;
      uint64_t v23 = *v46;
      if (*v46 != v47)
      {
        if (v23)
        {
          (*(void (**)(void))(*(void *)v23 + 24))(*v46);
          uint64_t v21 = v47;
        }
        void *v22 = v21;
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 16))(v21);
        }
      }
      *(void *)v36 = 0x3FE0000000000000;
      memset(&v36[8], 0, 32);
      uint64_t v37 = 0x3FE0000000000000;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v40 = 0x3FE0000000000000;
      uint64_t v43 = 0x3FF0000000000000;
      if (SHIDWORD(v45) >= 2)
      {
        uint64_t v24 = 1;
        do
        {
          HeliumXForm = (PCArray_base *)FxSupport::makeHeliumXForm((double *)v36, &v46[v24 - 1], 1, 0, &v34);
          if (v24 >= SHIDWORD(v45)) {
            PCArray_base::badIndex(HeliumXForm);
          }
          v26 = v46;
          uint64_t v27 = v46[v24];
          uint64_t v28 = v34;
          if (v27 == (void)v34)
          {
            if (v27) {
              (*(void (**)(uint64_t))(*(void *)v27 + 24))(v27);
            }
          }
          else
          {
            if (v27)
            {
              (*(void (**)(uint64_t))(*(void *)v27 + 24))(v27);
              uint64_t v28 = v34;
            }
            v26[v24] = v28;
          }
          ++v24;
        }
        while (v24 < SHIDWORD(v45));
      }
      v29 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v29);
      v35 = v29;
      int64x2_t v33 = vdupq_n_s64(0x3E7AD7F29ABCAF48uLL);
      if (SHIDWORD(v45) >= 1)
      {
        v30 = (HBlackHole *)HGObject::operator new(0x2A0uLL);
        HBlackHole::HBlackHole(v30);
      }
      objc_msgSend(a3, "setHeliumRef:", &v35, *(_OWORD *)&v33);
      if (v35) {
        (*(void (**)(HGNode *))(*(void *)v35 + 24))(v35);
      }
      v44 = &unk_1F1090DC0;
      if ((int)v45 < 0) {
        int v31 = 1;
      }
      else {
        int v31 = v45;
      }
      PCArray<HGRef<HGNode>,PCArray_Traits<HGRef<HGNode>>>::resize((uint64_t)&v44, 0, v31);
      if (v46) {
        MEMORY[0x1BA9BFB70](v46, 0x1000C8077774924);
      }
      if (v47) {
        (*(void (**)(uint64_t))(*(void *)v47 + 24))(v47);
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
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