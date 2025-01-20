@interface PAEKeyerAutokeySetupUtil
- (PAEKeyerAutokeySetupUtil)initWithAPIManager:(id)a3;
- (Vec3f)getInitialSample:(int)a3;
- (Vec3f)getInitialSample:(int)a3 usingArray:(id)a4;
- (float)getHistogramScale;
- (id)getInitialSamples;
- (int)getSamplesNb;
- (void)addInitialSample:(Vec3f *)a3;
- (void)clearInitialSamples;
- (void)dealloc;
- (void)delInitialSample:(int)a3;
- (void)fillAutokeySamplesArray:(void *)a3;
- (void)getDataFromDB;
- (void)getHistogram;
- (void)setHistogram:(void *)a3;
- (void)setHistogramScale:(float)a3;
- (void)syncWithDB;
- (void)syncWithDBAsDefault;
@end

@implementation PAEKeyerAutokeySetupUtil

- (void)getDataFromDB
{
  v3 = (void *)[self->_apiManager apiForProtocol:&unk_1F121D130];
  if (v3)
  {
    v4 = v3;
    id v13 = 0;
    [v3 getCustomParameterValue:&v13 fromParm:4 atFxTime:getFxTimeZero()];
    id v5 = v13;

    v6 = objc_alloc_init(PAEKeyerAutokeySetup);
    v7 = objc_msgSend((id)objc_msgSend(v13, "initialSamples"), "mutableCopy");
    [(PAEKeyerAutokeySetup *)v6 setInitialSamples:v7];

    long long v11 = *MEMORY[0x1E4F1FA48];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v10 = 0;
    [v4 getCustomParameterValue:&v10 fromParm:9 atFxTime:&v11];
    v8 = v10;

    v9 = v10;
    self->_autokeySetup = v6;
    self->_keyerHistogram = v9;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerAutokeySetupUtil;
  [(PAEKeyerAutokeySetupUtil *)&v3 dealloc];
}

- (PAEKeyerAutokeySetupUtil)initWithAPIManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PAEKeyerAutokeySetupUtil;
  v4 = [(PAEKeyerAutokeySetupUtil *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_apiManager = a3;
    [(PAEKeyerAutokeySetupUtil *)v4 getDataFromDB];
  }
  return v5;
}

- (id)getInitialSamples
{
  return [(PAEKeyerAutokeySetup *)self->_autokeySetup initialSamples];
}

- (void)syncWithDB
{
  uint64_t v3 = [self->_apiManager apiForProtocol:&unk_1F121D2E0];
  if (v3 && self->_autokeySetup)
  {
    v4 = (void *)v3;
    id v5 = objc_alloc_init(PAEKeyerAutokeySetup);
    v6 = objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "mutableCopy");
    [(PAEKeyerAutokeySetup *)v5 setInitialSamples:v6];

    keyerHistogram = self->_keyerHistogram;
    if (keyerHistogram)
    {
      long long v8 = *MEMORY[0x1E4F1FA48];
      uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v4 setCustomParameterValue:keyerHistogram toParm:9 atFxTime:&v8];
    }
    [v4 setCustomParameterValue:v5 toParm:4 atFxTime:getFxTimeZero()];
  }
}

- (void)syncWithDBAsDefault
{
  uint64_t v3 = [self->_apiManager apiForProtocol:&unk_1F121B330];
  if (v3 && self->_autokeySetup)
  {
    v4 = (void *)v3;
    id v5 = objc_alloc_init(PAEKeyerAutokeySetup);
    v6 = objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "mutableCopy");
    [(PAEKeyerAutokeySetup *)v5 setInitialSamples:v6];

    keyerHistogram = self->_keyerHistogram;
    if (keyerHistogram) {
      [v4 setCustomParameterDefaultValue:keyerHistogram parmId:9];
    }
    [v4 setCustomParameterDefaultValue:v5 parmId:4];
  }
}

- (int)getSamplesNb
{
  return (int)objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "count") / 3;
}

- (Vec3f)getInitialSample:(int)a3
{
  uint64_t v4 = v3;
  int v5 = 3 * a3;
  id v6 = [(PAEKeyerAutokeySetupUtil *)self getInitialSamples];
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5), "floatValue");
  int v8 = v7;
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5 + 1), "floatValue");
  int v10 = v9;
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5 + 2), "floatValue");
  *(_DWORD *)uint64_t v4 = v8;
  *(_DWORD *)(v4 + 4) = v10;
  *(float *)(v4 + 8) = v11;
  result.var0[2] = v13;
  result.var0[1] = v12;
  result.var0[0] = v11;
  return result;
}

- (Vec3f)getInitialSample:(int)a3 usingArray:(id)a4
{
  uint64_t v6 = v4;
  int v7 = 3 * a3;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3 * a3), "floatValue");
  int v9 = v8;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v7 + 1), "floatValue");
  int v11 = v10;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v7 + 2), "floatValue");
  *(_DWORD *)uint64_t v6 = v9;
  *(_DWORD *)(v6 + 4) = v11;
  *(float *)(v6 + 8) = v12;
  result.var0[2] = v14;
  result.var0[1] = v13;
  result.var0[0] = v12;
  return result;
}

- (void)delInitialSample:(int)a3
{
  uint64_t v4 = 3 * a3;
  int v5 = (void *)[MEMORY[0x1E4F28E60] indexSetWithIndex:v4];
  uint64_t v6 = v4 - 1;
  do
  {
    [v5 addIndex:v6 + 2];
    ++v6;
  }
  while (v6 <= v4);
  id v7 = [(PAEKeyerAutokeySetupUtil *)self getInitialSamples];

  [v7 removeObjectsAtIndexes:v5];
}

- (void)clearInitialSamples
{
  id v2 = [(PAEKeyerAutokeySetupUtil *)self getInitialSamples];

  [v2 removeAllObjects];
}

- (void)addInitialSample:(Vec3f *)a3
{
  id v4 = [(PAEKeyerAutokeySetupUtil *)self getInitialSamples];
  *(float *)&double v5 = a3->var0[0];
  objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v5));
  *(float *)&double v6 = a3->var0[1];
  objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v6));
  *(float *)&double v7 = a3->var0[2];
  uint64_t v8 = [NSNumber numberWithFloat:v7];

  [v4 addObject:v8];
}

- (void)fillAutokeySamplesArray:(void *)a3
{
  int v5 = [(PAEKeyerAutokeySetupUtil *)self getSamplesNb];
  if (v5 >= 1)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    do
    {
      if (self)
      {
        [(PAEKeyerAutokeySetupUtil *)self getInitialSample:v7];
      }
      else
      {
        int v11 = 0;
        uint64_t v10 = 0;
      }
      unint64_t v8 = *((void *)a3 + 1);
      if (v8 >= *((void *)a3 + 2))
      {
        uint64_t v9 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)a3, &v10);
      }
      else
      {
        *(void *)unint64_t v8 = v10;
        *(_DWORD *)(v8 + 8) = v11;
        uint64_t v9 = v8 + 12;
      }
      *((void *)a3 + 1) = v9;
      uint64_t v7 = (v7 + 1);
    }
    while (v6 != v7);
  }
}

- (void)setHistogram:(void *)a3
{
}

- (void)getHistogram
{
  return [(PAEKeyerHistogram *)self->_keyerHistogram getHistogram];
}

- (void)setHistogramScale:(float)a3
{
}

- (float)getHistogramScale
{
  [(PAEKeyerHistogram *)self->_keyerHistogram getHistogramScale];
  return result;
}

@end