@interface ZimmerDEMTuningParams
- ($E2C29196C7A5C696474C6955C5A9CE06)config;
- (int)readPlist:(id)a3;
@end

@implementation ZimmerDEMTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char v15 = 0;
  if (!v4) {
    goto LABEL_19;
  }
  *(void *)&self->_config.antiMazingThresh1 = 0;
  self->_config.antiMazingGain = 0.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"AntiMazingGain", &v15, 0.0);
  float v7 = *(float *)&v6;
  if (!v15) {
    FigSignalErrorAt();
  }
  if (v7 < 0.0 || v7 > 100.0) {
    goto LABEL_18;
  }
  self->_config.antiMazingGain = v7 * 0.25;
  LODWORD(v6) = 1018980991;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"AntiMazingThresh1", &v15, v6);
  float v10 = *(float *)&v9;
  if (!v15) {
    FigSignalErrorAt();
  }
  if (v10 < 0.0 || v10 > 0.2) {
    goto LABEL_18;
  }
  self->_config.antiMazingThresh1 = sqrtf(v10) * 0.857;
  LODWORD(v9) = 5.0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"AntiMazingThresh2", &v15, v9);
  float v12 = v11;
  if (!v15) {
    FigSignalErrorAt();
  }
  if (v12 < 0.0 || v12 > 20.0)
  {
LABEL_18:
    FigDebugAssert3();
LABEL_19:
    int v13 = FigSignalErrorAt();
    goto LABEL_17;
  }
  int v13 = 0;
  self->_config.antiMazingThresh2 = v12;
LABEL_17:

  return v13;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)config
{
  float antiMazingThresh1 = self->_config.antiMazingThresh1;
  float antiMazingThresh2 = self->_config.antiMazingThresh2;
  float antiMazingGain = self->_config.antiMazingGain;
  result.var2 = antiMazingGain;
  result.var1 = antiMazingThresh2;
  result.var0 = antiMazingThresh1;
  return result;
}

@end