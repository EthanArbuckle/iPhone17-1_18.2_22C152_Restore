@interface PAEPageCurlFilter
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)parameterChanged:(unsigned int)a3;
@end

@implementation PAEPageCurlFilter

- (BOOL)addParameters
{
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"PageCurl::Open", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"PageCurl::Close", 0, 0), 0);
  objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"PageCurl::Direction", 0, 0), 9, 0, v5, 1);

  BOOL result = 0;
  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)PAEPageCurlFilter;
    return [(PAESharedDefaultBase *)&v8 addParameters];
  }
  return result;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  if (a3 == 10)
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    int v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
    v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
    long long v12 = *MEMORY[0x1E4F1FA48];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    unsigned __int8 v11 = 0;
    int v8 = [v7 getBoolValue:&v11 fromParm:10 atFxTime:&v12];
    if (v8)
    {
      unsigned int v10 = 0;
      [v7 getParameterFlags:&v10 fromParm:11];
      unsigned int v10 = v10 & 0xFFFFFFFB | (4 * v11);
      objc_msgSend(v6, "setParameterFlags:toParm:");
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  if ([a4 imageType] != 3) {
    return 0;
  }
  if ([a3 imageType] != 3) {
    return 0;
  }
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121DE28];
  if (!v9) {
    return 0;
  }
  unsigned int v10 = (void *)v9;
  unsigned __int8 v11 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v11) {
    return 0;
  }
  long long v12 = v11;
  char v39 = 0;
  int v13 = [v11 getBoolValue:&v39 fromParm:10 atFxTime:a5->var0.var1];
  int v38 = 0;
  int v14 = [v12 getIntValue:&v38 fromParm:9 atFxTime:a5->var0.var1];
  BOOL v15 = 0;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    return v15;
  }
  if (!v39)
  {
    *(void *)&long long v36 = 0;
    if ([v12 getFloatValue:&v36 fromParm:11 atFxTime:a5->var0.var1])
    {
      double v23 = *(double *)&v36 / 100.0;
      goto LABEL_13;
    }
    return 0;
  }
  var1 = a5->var0.var1;
  v18 = (long long *)MEMORY[0x1E4F1F9F0];
  long long v36 = *MEMORY[0x1E4F1F9F0];
  uint64_t v37 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  v35 = &v36;
  [v10 startFxTimeForEffect:&v35];
  long long v33 = *v18;
  uint64_t v34 = *((void *)v18 + 2);
  v32 = &v33;
  [v10 durationFxTimeForEffect:&v32];
  memset(&v31, 0, sizeof(v31));
  long long v19 = *(_OWORD *)var1;
  lhs.epoch = *((void *)var1 + 2);
  *(_OWORD *)&lhs.value = v19;
  long long v20 = *v35;
  rhs.epoch = *((void *)v35 + 2);
  *(_OWORD *)&rhs.value = v20;
  CMTimeSubtract(&v31, &lhs, &rhs);
  CMTime time = v31;
  double Seconds = CMTimeGetSeconds(&time);
  CMTimeEpoch v22 = *((void *)v32 + 2);
  *(_OWORD *)&v27.value = *v32;
  v27.epoch = v22;
  double v23 = Seconds / CMTimeGetSeconds(&v27);
LABEL_13:
  float v24 = v23;
  if (v38) {
    float v24 = 1.0 - v24;
  }
  uint64_t v25 = v36;
  BOOL v15 = (void)v36 != 0;
  if ((void)v36)
  {
    *(void *)&long long v33 = v36;
    (*(void (**)(void))(*(void *)v36 + 16))(v36);
    [a3 setHeliumRef:&v33];
    if ((void)v33) {
      (*(void (**)(void))(*(void *)v33 + 24))(v33);
    }
    (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
  }
  return v15;
}

@end