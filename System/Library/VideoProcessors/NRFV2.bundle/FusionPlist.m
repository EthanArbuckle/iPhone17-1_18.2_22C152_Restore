@interface FusionPlist
+ (void)initialize;
- (FusionPlist)init;
- (void)applyOverrides;
@end

@implementation FusionPlist

+ (void)initialize
{
  dword_26B429764 = 2;
  dword_26B429768 = 2;
  dword_26B429760 = -1;
}

- (FusionPlist)init
{
  v8.receiver = self;
  v8.super_class = (Class)FusionPlist;
  v2 = [(FusionPlist *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bands = v2->bands;
    v2->bands = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    toneMapSmoothingBands = v2->toneMapSmoothingBands;
    v2->toneMapSmoothingBands = v5;
  }
  return v2;
}

- (void)applyOverrides
{
  if (dword_26B429764 <= 1) {
    self->enableMotionDetection = dword_26B429764 == 1;
  }
  if (dword_26B429768 <= 1) {
    self->preWarpInputs = dword_26B429768 == 1;
  }
  if ((dword_26B429760 & 0x80000000) == 0) {
    self->hybridRegistrationMode = dword_26B429760;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->patchBasedFusionParametersLUTs, 0);
  objc_storeStrong((id *)&self->nonShadowDenseBlendStrength, 0);
  objc_storeStrong((id *)&self->shadowDenseBlendStrength, 0);
  objc_storeStrong((id *)&self->lensShadingFactorLUT, 0);
  objc_storeStrong((id *)&self->toneMapSmoothingBands, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end