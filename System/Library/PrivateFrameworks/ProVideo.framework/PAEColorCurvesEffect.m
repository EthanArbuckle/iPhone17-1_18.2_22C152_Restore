@interface PAEColorCurvesEffect
- (BOOL)addParameters;
- (BOOL)needsOSCsIn360Groups;
- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7;
- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6;
- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6;
- (BOOL)useLegacyCoding;
- (Class)classForCustomParameterID:(unsigned int)a3;
- (PAEColorCurvesEffect)initWithAPIManager:(id)a3;
- (id)shouldDeselectOtherMasks:(id)a3;
- (void)_registerCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7;
- (void)_setGradingMode:(int)a3;
- (void)dealloc;
- (void)newNodeForCorrector;
- (void)resyncOnce:(id)a3 atTime:(id)a4;
- (void)setParameters:(id)a3 onNodeCorrector:(void *)a4 time:(id *)a5;
@end

@implementation PAEColorCurvesEffect

- (PAEColorCurvesEffect)initWithAPIManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEColorCurvesEffect;
  v3 = [(PAEBaseCorrectorEffect *)&v6 initWithAPIManager:a3];
  v4 = v3;
  if (v3) {
    PAEInitSampling((_anonymous_namespace_::_Local *)v3);
  }
  return v4;
}

- (void)dealloc
{
  PAEDisposeSampling((_anonymous_namespace_::_Local *)self);
  v3.receiver = self;
  v3.super_class = (Class)PAEColorCurvesEffect;
  [(PAEBaseCorrectorEffect *)&v3 dealloc];
}

- (void)_setGradingMode:(int)a3
{
  *(&self->super._hostApplication + 1) = a3;
}

- (void)newNodeForCorrector
{
  v2 = (HgcColorCurves *)HGObject::operator new(0x1A0uLL);
  HgcColorCurves::HgcColorCurves(v2);
}

- (void)_registerCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8 = *(void *)&a3;
  v10 = [[PAEColorCurveChannelData alloc] initWithRed:a5 green:a6 blue:a7];
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 0x20000);
}

- (BOOL)addParameters
{
  id v3 = [(PAEBaseCorrectorEffect *)self parameterCreationAPI];
  v4 = v3;
  if (v3)
  {
    [v3 addCustomParameterWithName:&stru_1F119C770 parmId:8888 defaultValue:0 parmFlags:17];
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectPreserveLuma", 0, @"Localizable"), 8889, 1, 545);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 1, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectCustom1", 0, @"Localizable"), 1.0, 0.0, 0.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectCustom2", 0, @"Localizable"), 0.0, 1.0, 0.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectCustom3", 0, @"Localizable"), 0.0, 0.0, 1.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectLuma", 0, @"Localizable"), 1.0, 1.0, 1.0);
    int v5 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectGradingMode", 0, @"Localizable"), 8893, objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)&self->super._hostApplication + 1)), 627);
    if (v5 == 1) {
      [v4 addPopupMenuWithName:@"Legacy Grading Mode" parmId:8890 defaultValue:0 menuEntries:&unk_1F11EC688 parmFlags:531];
    }
    objc_super v6 = objc_alloc_init(PAEColorSelectionChannelData);
    [v4 addCustomParameterWithName:@"OSC" parmId:9321 defaultValue:v6 parmFlags:3];
  }
  return v4 != 0;
}

- (Class)classForCustomParameterID:(unsigned int)a3
{
  if ((int)a3 > 8887)
  {
    if (a3 == 8888 || a3 == 8893 || a3 == 9321) {
      return (Class)objc_opt_class();
    }
    return 0;
  }
  if (a3 - 1 >= 4) {
    return 0;
  }
  return (Class)objc_opt_class();
}

- (BOOL)useLegacyCoding
{
  return objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](-[PAEBaseCorrectorEffect apiManager](self, "apiManager"), "apiForProtocol:", &unk_1F121E208), "versionAtCreation") < 8;
}

- (void)resyncOnce:(id)a3 atTime:(id)a4
{
  objc_super v6 = (void *)[a3 apiForProtocol:&unk_1F121D130];
  id v8 = 0;
  if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
  {
    [v6 getIntValue:&self->super._hostApplication + 1 fromParm:8890 atFxTime:a4.var1];
  }
  else if ([v6 getCustomParameterValue:&v8 fromParm:8893 atFxTime:a4.var1])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = [v8 intValue];
    }
    else {
      int v7 = 0;
    }
    *(&self->super._hostApplication + 1) = v7;
  }
  [v6 getBoolValue:&self->_gradingMode fromParm:8889 atFxTime:a4.var1];
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v11 = (void *)[a3 apiForProtocol:&unk_1F121D130];
  v12 = v11;
  if ((v7 - 1) > 3)
  {
    if (v7 == 8893)
    {
      if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
      {
        v14 = (unsigned int *)(&self->super._hostApplication + 1);
        char v15 = [v12 getIntValue:v14 fromParm:8890 atFxTime:a4.var1];
        *a6 = (id)[NSNumber numberWithInt:*v14];
        LOBYTE(v13) = v15;
      }
      else
      {
        int v13 = [v12 getCustomParameterValue:a6 fromParm:8893 atFxTime:a4.var1];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v16 = [*a6 intValue];
          }
          else {
            uint64_t v16 = 0;
          }
          [(PAEColorCurvesEffect *)self _setGradingMode:v16];
          LOBYTE(v13) = 1;
        }
      }
    }
    else if (v7 == 8889)
    {
      LOBYTE(v13) = [v11 getBoolValue:&self->_gradingMode fromParm:8889 atFxTime:a4.var1];
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PAEColorCurvesEffect;
      LOBYTE(v13) = [(PAEBaseCorrectorEffect *)&v18 resync:a3 atTime:a4.var1 paramID:v7 customChannelData:a6];
    }
  }
  else
  {
    LOBYTE(v13) = [v11 getCustomParameterValue:a6 fromParm:v7 atFxTime:a4.var1];
  }
  return v13;
}

- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6
{
  id v12 = a6;
  if (a5 == 8893)
  {
    int v7 = objc_msgSend((id)objc_msgSend(a3, "apiForProtocol:", &unk_1F121D130), "getCustomParameterValue:fromParm:atFxTime:", &v12, 8893, a4);
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = [v12 intValue];
      }
      else {
        uint64_t v8 = 0;
      }
      [(PAEColorCurvesEffect *)self willChangeValueForKey:@"gradingMode"];
      [(PAEColorCurvesEffect *)self _setGradingMode:v8];
      [(PAEColorCurvesEffect *)self didChangeValueForKey:@"gradingMode"];
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    v10.receiver = self;
    v10.super_class = (Class)PAEColorCurvesEffect;
    LOBYTE(v7) = -[PAEBaseCorrectorEffect parameterChanged:atTime:paramID:customChannelData:](&v10, sel_parameterChanged_atTime_paramID_customChannelData_, a3, &v11);
  }
  return v7;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  uint64_t v12 = (*(uint64_t (**)(void *, void, id, id, id))(*(void *)a6 + 128))(a6, 0, a3, a4, a5);
  uint64_t v13 = v12;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 16))(v12);
  }
  if (*(&self->super._hostApplication + 1) == 1)
  {
    BOOL v14 = 1;
  }
  else
  {
  }
  int v15 = [(id)objc_opt_class() colorPrimaries:a3] == 1 || v14;
  if (v15) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 1;
  }
  if (v15) {
    int v17 = 2;
  }
  else {
    int v17 = 0;
  }
  if (v14) {
    unsigned int v18 = 1;
  }
  else {
    unsigned int v18 = v17;
  }
  v19 = PAECreateGammaEncodingNode((uint64_t)a6, v16, v16, v18, 1, 0);
  v20 = [(PAEColorCurvesEffect *)self newNodeForCorrector];
  v21 = v20;
  if (!v20) {
    v20 = v19;
  }
  v22 = PAECreateGammaDecodingNode((uint64_t)v20, v16, v16, v18, 0, 1);
  if (v21)
  {
    var1 = a7->var0.var1;
    if (!a7->var0.var1) {
      var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E4F1FA48];
    }
    uint64_t v24 = *((void *)var1 + 2);
    long long v27 = *(_OWORD *)var1;
    uint64_t v28 = v24;
    [(PAEColorCurvesEffect *)self setParameters:a3 onNodeCorrector:v21 time:&v27];
    (*(void (**)(HGColorGamma *, void, HGColorGamma *))(*(void *)v21 + 120))(v21, 0, v19);
  }
  if (v22) {
    (*(void (**)(HGColorGamma *))(*(void *)v22 + 16))(v22);
  }
  v26 = v22;
  [a4 setHeliumRef:&v26];
  if (v26) {
    (*(void (**)(HGColorGamma *))(*(void *)v26 + 24))(v26);
  }
  if (v21) {
    (*(void (**)(HGColorGamma *))(*(void *)v21 + 24))(v21);
  }
  (*(void (**)(HGColorGamma *))(*(void *)v19 + 24))(v19);
  (*(void (**)(HGColorGamma *))(*(void *)v22 + 24))(v22);
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
  }
  return 1;
}

- (void)setParameters:(id)a3 onNodeCorrector:(void *)a4 time:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47 = *a5;
  id v9 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:4 time:&v47];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v46 = *a5;
  id v10 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:1 time:&v46];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45 = *a5;
  id v11 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:2 time:&v45];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44 = *a5;
  id v12 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:3 time:&v44];
  uint64_t v13 = [v9 curveRef];
  if (*(&self->super._hostApplication + 1) == 1)
  {
    BOOL v14 = 0;
  }
  else
  {
  }
  BOOL v15 = [(id)objc_opt_class() colorPrimaries:a3] != 1;
  (*(void (**)(void *, uint64_t, float, double, double, double))(*(void *)a4 + 96))(a4, 3, (float)(char)-LOBYTE(self->_gradingMode), 0.0, 0.0, 0.0);
  BOOL v19 = !v14 || !v15;
  if (v14 && v15) {
    v20 = &cc::matrix::rgb_to_YCbCr709;
  }
  else {
    v20 = &cc::matrix::rgb_to_YCbCr2020;
  }
  v16.n128_u32[0] = *(_DWORD *)v20;
  v21 = (char *)&cc::matrix::rgb_to_YCbCr709 + 4;
  if (!v14 || !v15) {
    v21 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 4;
  }
  v17.n128_u32[0] = *(_DWORD *)v21;
  v22 = (char *)&cc::matrix::rgb_to_YCbCr709 + 8;
  if (v14 && v15)
  {
    v23 = (float *)&cc::matrix::rgb_to_YCbCr709 + 3;
  }
  else
  {
    v22 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 8;
    v23 = (float *)&cc::matrix::rgb_to_YCbCr2020 + 3;
  }
  if (v19) {
    uint64_t v24 = &dword_1EB9A3518;
  }
  else {
    uint64_t v24 = &dword_1EB9A3414;
  }
  if (v19) {
    v25 = &dword_1EB9A351C;
  }
  else {
    v25 = &dword_1EB9A3418;
  }
  if (v19) {
    v26 = &dword_1EB9A3520;
  }
  else {
    v26 = &dword_1EB9A341C;
  }
  if (v19) {
    long long v27 = &dword_1EB9A3524;
  }
  else {
    long long v27 = &dword_1EB9A3420;
  }
  if (v19) {
    uint64_t v28 = &dword_1EB9A3528;
  }
  else {
    uint64_t v28 = &dword_1EB9A3424;
  }
  if (v19) {
    v29 = &cc::matrix::YCbCr2020_to_rgb;
  }
  else {
    v29 = &cc::matrix::YCbCr709_to_rgb;
  }
  if (v19) {
    v30 = (float *)&cc::matrix::YCbCr2020_to_rgb + 1;
  }
  else {
    v30 = (float *)&cc::matrix::YCbCr709_to_rgb + 1;
  }
  if (v19) {
    v31 = (float *)&cc::matrix::YCbCr2020_to_rgb + 2;
  }
  else {
    v31 = (float *)&cc::matrix::YCbCr709_to_rgb + 2;
  }
  if (v19) {
    v32 = (float *)&cc::matrix::YCbCr2020_to_rgb + 3;
  }
  else {
    v32 = (float *)&cc::matrix::YCbCr709_to_rgb + 3;
  }
  v33 = (float *)algn_1EB9A33F0;
  if (v19) {
    v33 = (float *)&unk_1EB9A3494;
  }
  v39 = v33;
  v40 = v32;
  v34 = (float *)&algn_1EB9A33F0[4];
  if (v19) {
    v34 = (float *)&unk_1EB9A3498;
  }
  v38 = v34;
  if (v19) {
    v35 = (float *)&unk_1EB9A349C;
  }
  else {
    v35 = (float *)&algn_1EB9A33F0[8];
  }
  v36 = (float *)&algn_1EB9A33F0[12];
  if (v19) {
    v36 = (float *)&unk_1EB9A34A0;
  }
  v42 = v36;
  v43 = v35;
  v37 = &dword_1EB9A3400;
  if (v19) {
    v37 = &dword_1EB9A34A4;
  }
  v41 = (float *)v37;
  v18.n128_u32[0] = *(_DWORD *)v22;
  (*(void (**)(void *, uint64_t, __n128, __n128, __n128, double))(*(void *)a4 + 96))(a4, 5, v16, v17, v18, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, double))(*(void *)a4 + 96))(a4, 6, *v23, *(float *)v24, *(float *)v25, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, double))(*(void *)a4 + 96))(a4, 7, *(float *)v26, *(float *)v27, *(float *)v28, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, double))(*(void *)a4 + 96))(a4, 8, *(float *)v29, *v30, *v31, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, double))(*(void *)a4 + 96))(a4, 9, *v40, *v39, *v38, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, double))(*(void *)a4 + 96))(a4, 10, *v43, *v42, *v41, 0.0);
}

- (id)shouldDeselectOtherMasks:(id)a3
{
  if ([a3 mode] == 1 && !objc_msgSend(a3, "state")) {
    return (id)MEMORY[0x1E4F1CC38];
  }
  else {
    return (id)MEMORY[0x1E4F1CC28];
  }
}

- (BOOL)needsOSCsIn360Groups
{
  return 1;
}

@end