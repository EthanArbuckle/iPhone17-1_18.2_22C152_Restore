@interface DenoiseAndSharpeningTuning
- (DenoiseAndSharpeningTuning)init;
@end

@implementation DenoiseAndSharpeningTuning

- (DenoiseAndSharpeningTuning)init
{
  v6.receiver = self;
  v6.super_class = (Class)DenoiseAndSharpeningTuning;
  v2 = [(DenoiseAndSharpeningTuning *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bands = v2->bands;
    v2->bands = (NSMutableArray *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->loGOffsetScale, 0);
  objc_storeStrong((id *)&self->loGOffsetRangeMax, 0);
  objc_storeStrong((id *)&self->lensShadeFactor, 0);
  objc_storeStrong((id *)&self->lowFusionNoiseBoostPerFrame, 0);
  objc_storeStrong((id *)&self->lowFusionNoiseBoost, 0);
  objc_storeStrong((id *)&self->shortFrameDenoiseBoost, 0);
  objc_storeStrong((id *)&self->ev0FrameDenoiseBoost, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end