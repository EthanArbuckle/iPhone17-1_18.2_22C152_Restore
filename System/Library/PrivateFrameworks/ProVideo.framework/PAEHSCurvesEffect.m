@interface PAEHSCurvesEffect
- (BOOL)addParameters;
- (BOOL)needsOSCsIn360Groups;
- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7;
- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6;
- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6;
- (BOOL)useLegacyCoding;
- (Class)classForCustomParameterID:(unsigned int)a3;
- (PAEHSCurvesEffect)initWithAPIManager:(id)a3;
- (id)shouldDeselectOtherMasks:(id)a3;
- (void)_registerColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7;
- (void)_registerHueCurveParameter:(int)a3 name:(id)a4;
- (void)_registerOffsetColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7;
- (void)_setGradingMode:(int)a3;
- (void)dealloc;
- (void)resyncOnce:(id)a3 atTime:(id)a4;
@end

@implementation PAEHSCurvesEffect

- (PAEHSCurvesEffect)initWithAPIManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEHSCurvesEffect;
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
  v3.super_class = (Class)PAEHSCurvesEffect;
  [(PAEBaseCorrectorEffect *)&v3 dealloc];
}

- (void)_setGradingMode:(int)a3
{
  *(&self->super._hostApplication + 1) = a3;
}

- (void)_registerHueCurveParameter:(int)a3 name:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = objc_alloc_init(PAEHueCurveChannelData);
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v5, v7, 0x20000);
}

- (void)_registerOffsetColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8 = *(void *)&a3;
  v10 = [[PAEOffsetColorCurveChannelData alloc] initWithRed:a5 green:a6 blue:a7];
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 0x20000);
}

- (void)_registerColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8 = *(void *)&a3;
  v10 = [[PAEColorCurveChannelData alloc] initWithRed:a5 green:a6 blue:a7];
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 2);
}

- (BOOL)addParameters
{
  id v3 = [(PAEBaseCorrectorEffect *)self parameterCreationAPI];
  v4 = v3;
  if (v3)
  {
    [v3 addCustomParameterWithName:&stru_1F119C770 parmId:8888 defaultValue:0 parmFlags:17];
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 1, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectHueVsHue", 0, @"Localizable"));
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectHueVsSat", 0, @"Localizable"));
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectHueVsLuma", 0, @"Localizable"));
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectLumaVsSat", 0, @"Localizable"), 1.0, 1.0, 1.0);
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectSatVsSat", 0, @"Localizable"), 1.0, 1.0, 1.0);
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectCustomVsSat", 0, @"Localizable"), 0.912, 0.324, 0.002);
    unsigned int v5 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEHSCurvesEffectGradingMode", 0, @"Localizable"), 8893, objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)&self->super._hostApplication + 1)), 627);
    if (v5 == 1) {
      [v4 addPopupMenuWithName:@"Legacy Grading Mode" parmId:8889 defaultValue:0 menuEntries:&unk_1F11EC6B8 parmFlags:531];
    }
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PAEColorCurvesEffectPreserveLuma", 0, @"Localizable"), 8894, v5 > 5, 515);
    objc_super v6 = objc_alloc_init(PAEColorSelectionChannelData);
    [v4 addCustomParameterWithName:@"OSC" parmId:9321 defaultValue:v6 parmFlags:3];
  }
  return v4 != 0;
}

- (Class)classForCustomParameterID:(unsigned int)a3
{
  if ((int)a3 <= 3)
  {
    if (a3 - 1 < 3) {
      return (Class)objc_opt_class();
    }
  }
  else if ((int)a3 > 8887)
  {
    if (a3 == 8888 || a3 == 9321 || a3 == 8893) {
      return (Class)objc_opt_class();
    }
  }
  else if (a3 - 4 < 3)
  {
    return (Class)objc_opt_class();
  }
  return 0;
}

- (BOOL)useLegacyCoding
{
  return objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](-[PAEBaseCorrectorEffect apiManager](self, "apiManager"), "apiForProtocol:", &unk_1F121E208), "versionAtCreation") < 8;
}

- (void)resyncOnce:(id)a3 atTime:(id)a4
{
  objc_super v6 = (void *)[a3 apiForProtocol:&unk_1F121D130];
  id v10 = 0;
  unsigned int v7 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
  if (v7 == 1)
  {
    [v6 getIntValue:&self->super._hostApplication + 1 fromParm:8889 atFxTime:a4.var1];
  }
  else
  {
    unsigned int v8 = v7;
    if ([v6 getCustomParameterValue:&v10 fromParm:8893 atFxTime:a4.var1])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v9 = [v10 intValue];
      }
      else {
        int v9 = 0;
      }
      *(&self->super._hostApplication + 1) = v9;
    }
    if (v8 >= 6) {
      [v6 getBoolValue:&self->_gradingMode fromParm:8894 atFxTime:a4.var1];
    }
  }
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v11 = (void *)[a3 apiForProtocol:&unk_1F121D130];
  v12 = v11;
  if ((v7 - 1) <= 5)
  {
    unsigned int v13 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    char v14 = [v12 getCustomParameterValue:a6 fromParm:v7 atFxTime:a4.var1];
    if ((v7 - 4) <= 2 && v13 <= 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = *a6;
        v16 = [PAEOffsetColorCurveChannelData alloc];
        [v15 red];
        double v18 = v17;
        [v15 green];
        double v20 = v19;
        [v15 blue];
        v22 = [(PAEOffsetColorCurveChannelData *)v16 initWithRed:v18 green:v20 blue:v21];
        *a6 = v22;
        [(PAEOffsetColorCurveChannelData *)v22 conformFromColorCurve:v15];
      }
    }
    return v14;
  }
  if (v7 == 8893)
  {
    if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
    {
      v24 = (unsigned int *)(&self->super._hostApplication + 1);
      char v25 = [v12 getIntValue:v24 fromParm:8889 atFxTime:a4.var1];
      *a6 = (id)[NSNumber numberWithInt:*v24];
      return v25;
    }
    if (![v12 getCustomParameterValue:a6 fromParm:8893 atFxTime:a4.var1]) {
      return 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v26 = [*a6 intValue];
    }
    else {
      uint64_t v26 = 0;
    }
    [(PAEHSCurvesEffect *)self _setGradingMode:v26];
    return 1;
  }
  if (v7 != 8894)
  {
    v27.receiver = self;
    v27.super_class = (Class)PAEHSCurvesEffect;
    return [(PAEBaseCorrectorEffect *)&v27 resync:a3 atTime:a4.var1 paramID:v7 customChannelData:a6];
  }

  return [v11 getBoolValue:&self->_gradingMode fromParm:8894 atFxTime:a4.var1];
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
      [(PAEHSCurvesEffect *)self willChangeValueForKey:@"gradingMode"];
      [(PAEHSCurvesEffect *)self _setGradingMode:v8];
      [(PAEHSCurvesEffect *)self didChangeValueForKey:@"gradingMode"];
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    v10.receiver = self;
    v10.super_class = (Class)PAEHSCurvesEffect;
    LOBYTE(v7) = -[PAEBaseCorrectorEffect parameterChanged:atTime:paramID:customChannelData:](&v10, sel_parameterChanged_atTime_paramID_customChannelData_, a3, &v11);
  }
  return v7;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  uint64_t v10 = (*(uint64_t (**)(void *, void, id, id, id))(*(void *)a6 + 128))(a6, 0, a3, a4, a5);
  uint64_t v11 = v10;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
  }
  uint64_t v31 = v11;
  var1 = a7->var0.var1;
  if (!a7->var0.var1) {
    var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E4F1FA48];
  }
  long long v29 = *(_OWORD *)var1;
  uint64_t v30 = *((void *)var1 + 2);
  uint64_t v28 = v30;
  long long v27 = v29;
  [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:1 time:&v27];
  long long v25 = v29;
  uint64_t v26 = v30;
  [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:2 time:&v25];
  long long v23 = v29;
  uint64_t v24 = v30;
  [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:3 time:&v23];
  long long v21 = v29;
  uint64_t v22 = v30;
  id v16 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:4 time:&v21];
  long long v19 = v29;
  uint64_t v20 = v30;
  id v15 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:5 time:&v19];
  long long v17 = v29;
  uint64_t v18 = v30;
  id v13 = [(PAEBaseCorrectorEffect *)self customChannelData:a3 ofParamID:6 time:&v17];
  if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") <= 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [objc_alloc_init(PAEOffsetColorCurveChannelData) conformFromColorCurve:v16];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [objc_alloc_init(PAEOffsetColorCurveChannelData) conformFromColorCurve:v15];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [objc_alloc_init(PAEOffsetColorCurveChannelData) conformFromColorCurve:v13];
    }
  }
  [(id)objc_opt_class() colorPrimaries:a3];
  operator new();
}

- (id)shouldDeselectOtherMasks:(id)a3
{
  if ([a3 mode] && !objc_msgSend(a3, "state")) {
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