@interface PatchBasedFusionParametersLUTs
- (int)readPlist:(id)a3;
@end

@implementation PatchBasedFusionParametersLUTs

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 valueForKey:@"BoundsMapLimit"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  boundsMapLimit = self->boundsMapLimit;
  self->boundsMapLimit = v7;

  if (!self->boundsMapLimit) {
    goto LABEL_11;
  }
  v9 = [GainValueArray alloc];
  v10 = [v4 valueForKey:@"ShadowLimit"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  shadowLimit = self->shadowLimit;
  self->shadowLimit = v11;

  if (!self->shadowLimit) {
    goto LABEL_11;
  }
  v13 = [GainValueArray alloc];
  v14 = [v4 valueForKey:@"LowResMotionThreshold"];
  v15 = [(GainValueArray *)v13 initWithArray:v14];
  lowResMotionThreshold = self->lowResMotionThreshold;
  self->lowResMotionThreshold = v15;

  if (!self->lowResMotionThreshold) {
    goto LABEL_11;
  }
  v17 = [GainValueArray alloc];
  v18 = [v4 valueForKey:@"BoostedLumaMotionThreshold"];
  v19 = [(GainValueArray *)v17 initWithArray:v18];
  boostedLumaMotionThreshold = self->boostedLumaMotionThreshold;
  self->boostedLumaMotionThreshold = v19;

  if (!self->boostedLumaMotionThreshold) {
    goto LABEL_11;
  }
  v21 = [GainValueArray alloc];
  v22 = [v4 valueForKey:@"SADThreshold"];
  v23 = [(GainValueArray *)v21 initWithArray:v22];
  sadThreshold = self->sadThreshold;
  self->sadThreshold = v23;

  if (!self->sadThreshold) {
    goto LABEL_11;
  }
  v25 = [GainValueArray alloc];
  v26 = [v4 valueForKey:@"NCCLowLimitMatchedTexture"];
  v27 = [(GainValueArray *)v25 initWithArray:v26];
  nccLowLimitMatchedTexture = self->nccLowLimitMatchedTexture;
  self->nccLowLimitMatchedTexture = v27;

  if (!self->nccLowLimitMatchedTexture) {
    goto LABEL_11;
  }
  v29 = [GainValueArray alloc];
  v30 = [v4 valueForKey:@"NCCHighLimitMatchedTexture"];
  v31 = [(GainValueArray *)v29 initWithArray:v30];
  nccHighLimitMatchedTexture = self->nccHighLimitMatchedTexture;
  self->nccHighLimitMatchedTexture = v31;

  if (!self->nccHighLimitMatchedTexture) {
    goto LABEL_11;
  }
  v33 = [GainValueArray alloc];
  v34 = [v4 valueForKey:@"FusionBoostMatchedTexture"];
  v35 = [(GainValueArray *)v33 initWithArray:v34];
  fusionBoostMatchedTexture = self->fusionBoostMatchedTexture;
  self->fusionBoostMatchedTexture = v35;

  if (self->fusionBoostMatchedTexture)
  {
    int v37 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
  }

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fusionBoostMatchedTexture, 0);
  objc_storeStrong((id *)&self->nccHighLimitMatchedTexture, 0);
  objc_storeStrong((id *)&self->nccLowLimitMatchedTexture, 0);
  objc_storeStrong((id *)&self->sadThreshold, 0);
  objc_storeStrong((id *)&self->boostedLumaMotionThreshold, 0);
  objc_storeStrong((id *)&self->lowResMotionThreshold, 0);
  objc_storeStrong((id *)&self->shadowLimit, 0);

  objc_storeStrong((id *)&self->boundsMapLimit, 0);
}

@end