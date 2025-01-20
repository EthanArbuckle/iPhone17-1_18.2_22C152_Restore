@interface PAEKeyerPreprocess
- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 paramFlags:(unsigned int)a4;
- (BOOL)doDegrainWithDegrainAmount:(double)a3 degrainIntensity:(double)a4 withInfo:(id *)a5 outputNode:(void *)a6 pcaMatrix:(id)a7 width:(int)a8 height:(int)a9;
- (BOOL)doPreprocessKeyerFootageWithParamAPI:(id)a3 withInfo:(id *)a4 linearInput:(BOOL)a5 scaleX:(float)a6 scaleY:(float)a7 width:(float)a8 height:(float)a9 fixDVResult:(void *)a10 degrainResult:(void *)a11 outputNode:(void *)a12;
- (BOOL)findGrainRegionWithInfo:(id *)a3 coordX:(int *)a4 coordY:(int *)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13;
- (void)dealloc;
- (void)setKeyer:(id)a3;
@end

@implementation PAEKeyerPreprocess

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEKeyerPreprocess;
  [(PAEKeyerPreprocess *)&v2 dealloc];
}

- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 paramFlags:(unsigned int)a4
{
  if (a3) {
    objc_msgSend(a3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Keyer::FixVideo", @"Fix Video", 0), 68, 1, a4 | 0x221);
  }
  return 1;
}

- (BOOL)findGrainRegionWithInfo:(id *)a3 coordX:(int *)a4 coordY:(int *)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13
{
  *a5 = 0;
  *a4 = 0;
  v13 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v13);
  v14 = (HGTransform *)HGObject::operator new(0x90uLL);
  HGTransform::HGTransform(v14);
  (*(void (**)(HGTransform *, double, double, double))(*(void *)v14 + 144))(v14, 0.100000001, 0.100000001, 1.0);
  (*(void (**)(HGXForm *, HGTransform *))(*(void *)v13 + 576))(v13, v14);
  v15 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v15);
}

- (BOOL)doDegrainWithDegrainAmount:(double)a3 degrainIntensity:(double)a4 withInfo:(id *)a5 outputNode:(void *)a6 pcaMatrix:(id)a7 width:(int)a8 height:(int)a9
{
  return 1;
}

- (BOOL)doPreprocessKeyerFootageWithParamAPI:(id)a3 withInfo:(id *)a4 linearInput:(BOOL)a5 scaleX:(float)a6 scaleY:(float)a7 width:(float)a8 height:(float)a9 fixDVResult:(void *)a10 degrainResult:(void *)a11 outputNode:(void *)a12
{
  BOOL v16 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v25 = 0;
  objc_msgSend(a3, "getBoolValue:fromParm:atFxTime:", &v25, 68, a4->var0.var1, a10, a11);
  if (v25)
  {
    desiredRGBToYCbCrMatrix(self->_apiManager, (uint64_t)v27, (uint64_t)a4->var0.var1);
    desiredYCbCrToRGBMatrix(self->_apiManager, (uint64_t)v26, (uint64_t)a4->var0.var1);
    v19 = (HFixDV *)HGObject::operator new(0x240uLL);
    HFixDV::HFixDV(v19, a6, a7);
    float v20 = 0.45455;
    if (!v16) {
      float v20 = 1.0;
    }
    *((float *)v19 + 102) = v20;
    *((_DWORD *)v19 + 103) = 1082130432;
    *((_WORD *)v19 + 208) = 257;
    HFixDV::setRGBToYCbCrMatrix((uint64_t)v19, (uint64_t)v27);
    HFixDV::setYCbCrToRGBMatrix((uint64_t)v19, (uint64_t)v26);
    (*(void (**)(HFixDV *, void, void))(*(void *)v19 + 120))(v19, 0, *(void *)a12);
    uint64_t v21 = *(void *)a12;
    v22 = v19;
    if (*(HFixDV **)a12 != v19)
    {
      if (v21) {
        (*(void (**)(void))(*(void *)v21 + 24))(*(void *)a12);
      }
      *(void *)a12 = v19;
      (*(void (**)(HFixDV *))(*(void *)v19 + 16))(v19);
      v22 = *(HFixDV **)a12;
    }
    uint64_t v23 = *(void *)a10;
    if (*(HFixDV **)a10 != v22)
    {
      if (v23)
      {
        (*(void (**)(void))(*(void *)v23 + 24))(*(void *)a10);
        v22 = *(HFixDV **)a12;
      }
      *(void *)a10 = v22;
      if (v22) {
        (*(void (**)(HFixDV *))(*(void *)v22 + 16))(v22);
      }
    }
    (*(void (**)(HFixDV *))(*(void *)v19 + 24))(v19);
  }
  return 1;
}

- (void)setKeyer:(id)a3
{
  self->_keyer = (PAEKeyer *)a3;
}

@end