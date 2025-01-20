@interface PITimeVaryingPipelineStateSetting
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (id)nu_evaluateWithPipelineState:(id)a3 error:(id *)a4;
- (int64_t)sampleMode;
- (void)setRawTime:(id *)a3;
- (void)setSampleMode:(int64_t)a3;
- (void)setTime:(id *)a3;
@end

@implementation PITimeVaryingPipelineStateSetting

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setRawTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_rawTime.epoch = a3->var3;
  *(_OWORD *)&self->_rawTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (id)nu_evaluateWithPipelineState:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(PITimeVaryingPipelineStateSetting);
  if (v4)
  {
    [v4 time];
  }
  else
  {
    long long v13 = 0uLL;
    uint64_t v14 = 0;
  }
  long long v11 = v13;
  uint64_t v12 = v14;
  [(PITimeVaryingPipelineStateSetting *)v5 setTime:&v11];
  -[PITimeVaryingPipelineStateSetting setSampleMode:](v5, "setSampleMode:", [v4 sampleMode]);
  if (v4)
  {
    [v4 rawTime];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }
  long long v7 = v9;
  uint64_t v8 = v10;
  [(PITimeVaryingPipelineStateSetting *)v5 setRawTime:&v7];

  return v5;
}

@end