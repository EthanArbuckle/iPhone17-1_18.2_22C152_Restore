@interface PAEGradient
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)initPAEGradientWithHeight:(id)a3;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEGradient)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEGradient

- (PAEGradient)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGradient;
  result = [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
  if (result) {
    *(_DWORD *)(&result->super.super._hostIsVertigo + 2) = 0;
  }
  return result;
}

- (BOOL)initPAEGradientWithHeight:(id)a3
{
  v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
  uint64_t v6 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121AC40];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    v9 = (void *)v6;
    double v18 = 0.0;
    double v19 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    int v15 = 0;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v5 getGradientStartEnd:&v19 startY:&v18 endX:&v17 endY:&v16 type:&v15 fromParm:310 atFxTime:&v13];
    [a3 doubleValue];
    double v18 = v10 * 0.5;
    [a3 doubleValue];
    double v16 = v11 * -0.5;
    objc_msgSend(v9, "setGradientStartEnd:startY:endX:endY:toParm:atTime:", 310, &v13, v19, v18, v17);
  }
  return v8;
}

- (id)properties
{
  v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v2)
  {
    if ([v2 versionAtCreation] < 3) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  objc_super v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithInt:v3];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:590080];
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"SupportsHeliumRendering", v8, @"PixelTransformSupport", v9, @"SDRWorkingSpace", v10, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v12.receiver = self;
  v12.super_class = (Class)PAEGradient;
  [(PAESharedDefaultBase *)&v12 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  objc_super v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121AAA8];
  uint64_t v5 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 || v5 == 0;
  char v8 = v7;
  if (!v7)
  {
    uint64_t v9 = (void *)v5;
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", @"Gradient::Gradient", 0, 0), 310, 0);
    if ([v9 versionAtCreation]) {
      objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", @"Gradient::End Condition", 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v10, "localizedStringForKey:value:table:", @"Gradient::End Condition Options", 0, 0), "componentsSeparatedByString:", @"|"), 5);
    }
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", @"Gradient::Equirect", 0, 0), 3, 0, 1);
  }
  return v8 ^ 1;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v5)
  {
    if (![v5 versionAtCreation])
    {
LABEL_20:
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    BOOL v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
    BOOL v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
    uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
    if (v6) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && v7 != 0)
    {
      double v11 = (void *)v8;
      long long v20 = *MEMORY[0x1E4F1FA48];
      uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      if (a3 == 3)
      {
        LOBYTE(v18) = 0;
        [v6 getBoolValue:&v18 fromParm:3 atFxTime:&v20];
        LODWORD(v19) = 0;
        [v6 getParameterFlags:&v19 fromParm:2];
        if ((_BYTE)v18) {
          uint64_t v12 = 4;
        }
        else {
          uint64_t v12 = 4 * (*(_DWORD *)(&self->super.super._hostIsVertigo + 2) == 0);
        }
        [v11 setParameterFlags:v12 toParm:2];
        [v11 setGradientFlags:(_BYTE)v18 == 0 toParam:310];
      }
      else if (a3 == 310)
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        int v15 = 0;
        [v7 getGradientStartEnd:&v19 startY:&v18 endX:&v17 endY:&v16 type:&v15 fromParm:310 atFxTime:&v20];
        unsigned int v14 = 0;
        [v6 getParameterFlags:&v14 fromParm:2];
        if (*(_DWORD *)(&self->super.super._hostIsVertigo + 2) != v15)
        {
          unsigned int v14 = v14 & 0xFFFFFFFB | (4 * (v15 == 0));
          objc_msgSend(v11, "setParameterFlags:toParm:");
          *(_DWORD *)(&self->super.super._hostIsVertigo + 2) = v15;
        }
      }
      goto LABEL_20;
    }
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  BOOL v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
  BOOL v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F1219AD0];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v10 == 0) {
    return 0;
  }
  long long v13 = (void *)v10;
  if ([a3 imageType] != 3) {
    return 0;
  }
  int v14 = [v13 versionAtCreation];
  double v97 = 1.0;
  uint64_t v94 = 0x3FF0000000000000;
  double v91 = 1.0;
  double v88 = 1.0;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  if (v9)
  {
    [v9 inversePixelTransform];
    for (uint64_t i = 0; i != 16; i += 4)
    {
      uint64_t v16 = (_OWORD *)((char *)&v88 + i * 8);
      long long v17 = *(_OWORD *)&v87[i + 2];
      *uint64_t v16 = *(_OWORD *)&v87[i];
      v16[1] = v17;
    }
  }
  uint64_t v18 = HGRectMake4i(0, 0, 0x400u, 1u);
  uint64_t v20 = v19;
  uint64_t v21 = (HGBitmap *)HGObject::operator new(0x80uLL);
  *(void *)&double v22 = HGBitmap::HGBitmap(v21, v18, v20, 24).n128_u64[0];
  uint64_t v23 = *((void *)v21 + 10);
  objc_msgSend(v8, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", v23, 1024, 8, 310, a4->var0.var1, v22);
  uint64_t v24 = 0;
  uint64_t v25 = v23;
  do
  {
    uint64_t v26 = 0;
    v27 = (char *)(v23 + 4 * v24);
    char v28 = *v27;
    do
    {
      *(unsigned char *)(v25 + v26) = *(unsigned char *)(v25 + v26 + 1);
      ++v26;
    }
    while (v26 != 3);
    v27[3] = v28;
    ++v24;
    v25 += 4;
  }
  while (v24 != 1024);
  double v86 = 0.0;
  v87[0] = 0.0;
  double v84 = 0.0;
  double v85 = 0.0;
  int v83 = 0;
  [v8 getGradientStartEnd:v87 startY:&v86 endX:&v85 endY:&v84 type:&v83 fromParm:310 atFxTime:a4->var0.var1];
  int v82 = 0;
  if (v14) {
    [v7 getIntValue:&v82 fromParm:2 atFxTime:a4->var0.var1];
  }
  char v81 = 0;
  [v7 getBoolValue:&v81 fromParm:3 atFxTime:a4->var0.var1];
  if (v81)
  {
    int v83 = 0;
    unint64_t v29 = [a3 height];
    unint64_t v30 = [a3 height];
    double v31 = (double)v29 * 0.5;
    double v32 = (double)v30 * -0.5;
    double v33 = v97 + *((double *)&v95 + 1) * 0.0 + v31 * *(double *)&v96;
    double v34 = v97 + *((double *)&v95 + 1) * 0.0 + v32 * *(double *)&v96;
    double v86 = (*((double *)&v92 + 1) + *((double *)&v90 + 1) * 0.0 + v31 * v91) / v33;
    v87[0] = (*(double *)&v90 + v88 * 0.0 + v31 * *(double *)&v89) / v33;
    double v84 = (*((double *)&v92 + 1) + *((double *)&v90 + 1) * 0.0 + v32 * v91) / v34;
    double v85 = (*(double *)&v90 + v88 * 0.0 + v32 * *(double *)&v89) / v34;
  }
  [a3 pixelAspect];
  double v36 = v35;
  v80 = 0;
  double v37 = sqrt(v36 * (v85 - v87[0]) * (v36 * (v85 - v87[0])) + (v84 - v86) * (v84 - v86));
  if (PCMatrix44Tmpl<double>::isIdentity(&v88))
  {
    if (v83)
    {
      v38 = (HGradientRadial *)HGObject::operator new(0x1A0uLL);
      HGradientRadial::HGradientRadial(v38);
      if (v38) {
        v80 = v38;
      }
      unint64_t v39 = [a3 width];
      v87[0] = (double)v39 * 0.5 + v87[0];
      unint64_t v40 = [a3 height];
      double v86 = (double)v40 * 0.5 + v86;
      float v41 = v87[0];
      float v42 = v86;
      (*(void (**)(HGradientRadial *, void, float, float, double, double))(*(void *)v38 + 96))(v38, 0, v41, v42, 0.0, 0.0);
      float v43 = fabs(v37);
      (*(void (**)(HGradientRadial *, uint64_t, double, float, float, float))(*(void *)v38 + 96))(v38, 1, 0.0, v43, 1024.0, 1023.0);
      float v44 = v36;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(void *)v38 + 96))(v38, 2, v44, 1.0, 1.0, 1.0);
      if (!v14 || v82 == 1)
      {
        v45 = (HgcRadialMask *)HGObject::operator new(0x1A0uLL);
        HgcRadialMask::HgcRadialMask(v45);
        (*(void (**)(HgcRadialMask *, void, float, float, float, float))(*(void *)v45 + 96))(v45, 0, v44, 1.0, 1.0, 1.0);
        float v46 = v87[0];
        float v47 = v86;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, double, double))(*(void *)v45 + 96))(v45, 1, v46, v47, 0.0, 0.0);
        (*(void (**)(HgcRadialMask *, uint64_t, float, double, double, double))(*(void *)v45 + 96))(v45, 2, v43, 0.0, 0.0, 0.0);
        float v48 = v88;
        float v49 = *(double *)&v89;
        float v50 = *(double *)&v90;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, double, float))(*(void *)v45 + 96))(v45, 3, v48, v49, 0.0, v50);
        float v51 = *((double *)&v90 + 1);
        float v52 = v91;
        float v53 = *((double *)&v92 + 1);
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, double, float))(*(void *)v45 + 96))(v45, 4, v51, v52, 0.0, v53);
        float v54 = *((double *)&v95 + 1);
        float v55 = *(double *)&v96;
        float v56 = v97;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, double, float))(*(void *)v45 + 96))(v45, 5, v54, v55, 0.0, v56);
        (*(void (**)(HgcRadialMask *, void, HGradientRadial *))(*(void *)v45 + 120))(v45, 0, v38);
        if (v38 != v45)
        {
          (*(void (**)(HGradientRadial *))(*(void *)v38 + 24))(v38);
          v80 = v45;
          (*(void (**)(HgcRadialMask *))(*(void *)v45 + 16))(v45);
          v38 = v45;
        }
        (*(void (**)(HgcRadialMask *))(*(void *)v45 + 24))(v45);
      }
    }
    else
    {
      v38 = (HGradientRadial *)HGObject::operator new(0x1A0uLL);
      HGradientLinear::HGradientLinear(v38);
      if (v38) {
        v80 = v38;
      }
      float v61 = v87[0];
      float v62 = v86;
      (*(void (**)(HGradientRadial *, void, float, float, double, double))(*(void *)v38 + 96))(v38, 0, v61, v62, 0.0, 0.0);
      float v63 = v85;
      float v64 = v84;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, double, double))(*(void *)v38 + 96))(v38, 1, v63, v64, 0.0, 0.0);
      (*(void (**)(HGradientRadial *, uint64_t, float, float, double, double))(*(void *)v38 + 96))(v38, 2, 1024.0, 1023.0, 0.0, 0.0);
    }
  }
  else
  {
    v38 = (HGradientRadial *)HGObject::operator new(0x210uLL);
    HGGradient::HGGradient(v38);
    if (v38)
    {
      v80 = v38;
      (*(void (**)(HGradientRadial *))(*(void *)v38 + 16))(v38);
    }
    if (v83)
    {
      HGGradient::SetGradientMode((uint64_t)v38, 1);
      BOOL v59 = v82 == 1 || v14 == 0;
      v58.n128_u32[0] = 1.0;
      if (!v59) {
        v58.n128_f32[0] = 0.0;
      }
      float v60 = v37;
      (*(void (**)(HGradientRadial *, uint64_t, float, __n128, double, double))(*(void *)v38 + 96))(v38, 2, fabsf(v60), v58, 0.0, 0.0);
    }
    else
    {
      HGGradient::SetGradientMode((uint64_t)v38, 0);
      float v65 = v85;
      float v66 = v84;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, double, double))(*(void *)v38 + 96))(v38, 2, v65, v66, 0.0, 0.0);
    }
    float v67 = v36;
    (*(void (**)(HGradientRadial *, void, float, float, float, float))(*(void *)v38 + 96))(v38, 0, v67, 1.0, 1.0, 1.0);
    float v68 = v87[0];
    float v69 = v86;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, double, double))(*(void *)v38 + 96))(v38, 1, v68, v69, 0.0, 0.0);
    float v70 = v88;
    float v71 = *(double *)&v89;
    float v72 = *(double *)&v90;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, double, float))(*(void *)v38 + 96))(v38, 3, v70, v71, 0.0, v72);
    float v73 = *((double *)&v90 + 1);
    float v74 = v91;
    float v75 = *((double *)&v92 + 1);
    (*(void (**)(HGradientRadial *, uint64_t, float, float, double, float))(*(void *)v38 + 96))(v38, 4, v73, v74, 0.0, v75);
    float v76 = *((double *)&v95 + 1);
    float v77 = *(double *)&v96;
    float v78 = v97;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, double, float))(*(void *)v38 + 96))(v38, 5, v76, v77, 0.0, v78);
    (*(void (**)(HGradientRadial *))(*(void *)v38 + 24))(v38);
  }
  v79 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v79, v21);
  (*(void (**)(HGradientRadial *, void, HGBitmapLoader *))(*(void *)v38 + 120))(v38, 0, v79);
  [a3 setHeliumRef:&v80];
  if (v79) {
    (*(void (**)(HGBitmapLoader *))(*(void *)v79 + 24))(v79);
  }
  if (v80) {
    (*(void (**)(HGradientRadial *))(*(void *)v80 + 24))(v80);
  }
  if (v21) {
    (*(void (**)(HGBitmap *))(*(void *)v21 + 24))(v21);
  }
  return 1;
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