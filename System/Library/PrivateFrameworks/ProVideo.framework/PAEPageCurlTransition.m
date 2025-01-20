@interface PAEPageCurlTransition
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8;
- (BOOL)parameterChanged:(unsigned int)a3;
- (void)observeNotification:(id)a3;
@end

@implementation PAEPageCurlTransition

- (BOOL)addParameters
{
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A2D8];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"PageCurl::Right", 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", @"PageCurl::Left", 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", @"PageCurl::Custom", 0, 0), 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"PageCurl::Direction Preset", 0, 0), 1, 0, v6, 1);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Transition Direction::Open", 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", @"Transition Direction::Close", 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", @"Transition Direction::Automatic Direction", 0, 0), 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Transition Direction::Direction", 0, 0), 9, 2, v7, 1);

    unsigned int v8 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
    self->super._initGap = v8;
    LOBYTE(v3) = 0;
    if (v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)PAEPageCurlTransition;
      LOBYTE(v3) = [(PAETransitionDefaultBase *)&v11 addParameters];
    }
  }
  return v3;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  if (a3 == 1)
  {
    v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
    v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
    long long v12 = *MEMORY[0x1E4F1FA48];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    int v11 = 0;
    if ([v5 getIntValue:&v11 fromParm:1 atFxTime:&v12])
    {
      if (!v11)
      {
        double v6 = -0.41887902;
        double v7 = -0.314159265;
        goto LABEL_10;
      }
      if (v11 == 1)
      {
        double v6 = 0.41887902;
        double v7 = 3.45575192;
LABEL_10:
        [v4 setFloatValue:2 toParm:&v12 atFxTime:v7];
        [v4 setFloatValue:3 toParm:&v12 atFxTime:v6];
      }
      return 1;
    }
    return 0;
  }
  else
  {
    if ((a3 & 0xFFFFFFFE) != 2) {
      return 1;
    }
    unsigned int v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
    long long v12 = *MEMORY[0x1E4F1FA48];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    BOOL v9 = 1;
    [v8 setIntValue:2 toParm:1 atFxTime:&v12];
  }
  return v9;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8
{
  if ([a4 imageType] != 3) {
    return 0;
  }
  if ([a5 imageType] != 3) {
    return 0;
  }
  if ([a3 imageType] != 3) {
    return 0;
  }
  v14 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v14) {
    return 0;
  }
  v27[0] = 0;
  [v14 getIntValue:v27 fromParm:9 atFxTime:a8->var0.var1];
  if (v27[0] == 2) {
    v27[0] = [(PAETransitionDefaultBase *)self isFrontGap];
  }
  if ([(PAETransitionDefaultBase *)self isFrontGap])
  {
    v17 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v17);
  }
  if ([(PAETransitionDefaultBase *)self isEndGap])
  {
    v18 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v18);
  }
  float v19 = 1.0 - a6;
  if (v27[0] == 1) {
    id v20 = a4;
  }
  else {
    id v20 = a5;
  }
  if (v27[0] == 1) {
    id v21 = a5;
  }
  else {
    id v21 = a4;
  }
  if (v27[0] != 1) {
    float v19 = a6;
  }
  uint64_t v22 = v26;
  BOOL v15 = v26 != 0;
  if (v26)
  {
    if (v20) {
      [v20 heliumRef];
    }
    else {
      uint64_t v25 = 0;
    }
    v23 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
    HGHWBlendFlipped::HGHWBlendFlipped(v23);
    v24 = v23;
    (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v23 + 96))(v23, 0, (float)9, 0.0, 0.0, 0.0);
    [(PAESharedDefaultBase *)self getBlendingGamma];
    (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(void *)v23 + 96))(v23, 5);
    (*(void (**)(HGHWBlendFlipped *, void, uint64_t))(*(void *)v23 + 120))(v23, 0, v22);
    (*(void (**)(HGHWBlendFlipped *, uint64_t, uint64_t))(*(void *)v23 + 120))(v23, 1, v25);
    [a3 setHeliumRef:&v24];
    if (v24) {
      (*(void (**)(HGHWBlendFlipped *))(*(void *)v24 + 24))(v24);
    }
    if (v25) {
      (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
    }
    (*(void (**)(uint64_t))(*(void *)v22 + 24))(v22);
  }
  return v15;
}

- (void)observeNotification:(id)a3
{
  v5 = (void *)[a3 objectForKeyedSubscript:kFxNotificationName_NotificationTypeKey];
  if (self->super._initGap >= 2u
    && [v5 isEqualToString:kFxNotificationName_ColorModelChanged])
  {
    uint64_t v6 = [a3 objectForKeyedSubscript:kFxNotificationKey_ColorModel];
    [(PAETransitionDefaultBase *)self showHideHDRWhiteLevelParameterForColorModel:v6];
  }
}

@end