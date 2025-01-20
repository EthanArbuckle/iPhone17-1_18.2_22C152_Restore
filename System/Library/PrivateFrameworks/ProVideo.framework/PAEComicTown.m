@interface PAEComicTown
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)variesOverTime;
- (PAEComicTown)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEComicTown

- (PAEComicTown)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEComicTown;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEComicTown;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:65792];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"PositionIndependent", v6, @"PixelIndependent", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  v17.receiver = self;
  v17.super_class = (Class)PAEComicTown;
  [(PAESharedDefaultBase *)&v17 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v6 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)v5, "localizedStringForKey:value:table:", @"ComicTown::P1", 0, 0), 1, 2, 2.0, 0.0, 5.0, 0.0, 5.0, 0.1);
    int v7 = v6 & objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend((id)v5, "localizedStringForKey:value:table:", @"ComicTown::Style", 0, 0), 2, 5, &unk_1F11EC6A0, 0);
    LODWORD(v11) = 0;
    LODWORD(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::Smooth", 3, 22, 0, 100, 0, 0x100000064, v11);
    LODWORD(v12) = 0;
    int v8 = v7 & v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::Brightness", 4, 22, 0, 100, 0, 0x100000064, v12);
    LODWORD(v13) = 0;
    LODWORD(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::Loose", 5, 30, 0, 100, 0, 0x100000064, v13);
    LODWORD(v14) = 0;
    LODWORD(v5) = v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::BlackFill", 6, 50, 0, 100, 0, 0x100000064, v14);
    LODWORD(v15) = 0;
    int v9 = v8 & v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::color", 9, 0, 0, 5, 0, 0x100000005, v15);
    LODWORD(v16) = 0;
    LOBYTE(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", @"ComicTown::quantizeLevels", 10, 6, 2, 1000, 2, 0x100000032, v16);
    LOBYTE(v3) = v9 & v5 & [v4 addToggleButtonWithName:@"ComicTown::useHelium" parmId:11 defaultValue:0 parmFlags:0];
  }
  return v3;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_9;
  }
  uint64_t v33 = 0;
  int v32 = 0;
  int v31 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  int v28 = 0;
  [v9 getFloatValue:&v33 fromParm:1 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v32 fromParm:2 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v31 fromParm:3 atFxTime:a5->var0.var1];
  [v9 getIntValue:(char *)&v30 + 4 fromParm:4 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v30 fromParm:5 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v29 fromParm:6 atFxTime:a5->var0.var1];
  [v9 getIntValue:(char *)&v29 + 4 fromParm:9 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v28 fromParm:10 atFxTime:a5->var0.var1];
  int v12 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (!v12) {
    return v12;
  }
  if ([a4 imageType] != 3)
  {
LABEL_9:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v27 = 0;
  }
  v26 = 0;
  uint64_t v13 = (HGComicDesignerInterface *)HGObject::operator new(0x1A0uLL);
  HGComicDesignerInterface::HGComicDesignerInterface(v13);
  (*(void (**)(HGComicDesignerInterface *, void, uint64_t))(*(void *)v13 + 120))(v13, 0, v27);
  (*(void (**)(HGComicDesignerInterface *, void, float, double, double, double))(*(void *)v13 + 96))(v13, 0, (float)v31, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 1, (float)SHIDWORD(v30), 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 2, (float)(int)v30, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 4, (float)v28, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 5, 720.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 6, (float)v32, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 7, (float)(int)v29, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 3, (float)SHIDWORD(v29), 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 10, 1.0, 0.0, 0.0, 0.0);
  uint64_t v14 = [a4 dod];
  uint64_t v17 = HGRectMake4i((int)v14 + 1, HIDWORD(v14) + 1, v15 - 1, v16 - 1);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(void *)v13 + 96))(v13, 8, (float)(int)v17, (float)SHIDWORD(v17), (float)v18, (float)v19);
  [(PAESharedDefaultBase *)self getScaleForImage:a4];
  float v20 = v24;
  float v21 = v25;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, double, double))(*(void *)v13 + 96))(v13, 9, v20, v21, 0.0, 0.0);
  uint64_t v22 = *(void *)v13;
  v26 = v13;
  (*(void (**)(HGComicDesignerInterface *))(v22 + 16))(v13);
  (*(void (**)(HGComicDesignerInterface *))(*(void *)v13 + 24))(v13);
  [a3 setHeliumRef:&v26];
  if (v26) {
    (*(void (**)(HGComicDesignerInterface *))(*(void *)v26 + 24))(v26);
  }
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 24))(v27);
  }
  LOBYTE(v12) = 1;
  return v12;
}

@end