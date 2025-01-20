@interface OutputNoiseModelPlist
- (int)readPlist:(id)a3;
@end

@implementation OutputNoiseModelPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"ReadNoiseScalingFactor"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  readNoiseScalingFactor = self->readNoiseScalingFactor;
  self->readNoiseScalingFactor = v7;

  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"ShotNoiseScalingFactor"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  shotNoiseScalingFactor = self->shotNoiseScalingFactor;
  self->shotNoiseScalingFactor = v11;

  v13 = [GainValueArray alloc];
  v14 = [v4 objectForKeyedSubscript:@"SquaredNoiseScalingFactor"];
  v15 = [(GainValueArray *)v13 initWithArray:v14];
  squaredNoiseScalingFactor = self->squaredNoiseScalingFactor;
  self->squaredNoiseScalingFactor = v15;

  v17 = [GainValueArray alloc];
  v18 = [v4 objectForKeyedSubscript:@"SpatialSigma"];
  v19 = [(GainValueArray *)v17 initWithArray:v18];
  spatialSigma = self->spatialSigma;
  self->spatialSigma = v19;

  if (self->readNoiseScalingFactor
    && self->shotNoiseScalingFactor
    && self->squaredNoiseScalingFactor
    && self->spatialSigma)
  {
    v24.receiver = self;
    v24.super_class = (Class)OutputNoiseModelPlist;
    unsigned int v21 = [(CMITuningPlist *)&v24 readPlist:v4];
  }
  else
  {
    FigDebugAssert3();
    unsigned int v21 = FigSignalErrorAt();
  }
  int v22 = v21;

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->spatialSigma, 0);
  objc_storeStrong((id *)&self->squaredNoiseScalingFactor, 0);
  objc_storeStrong((id *)&self->shotNoiseScalingFactor, 0);

  objc_storeStrong((id *)&self->readNoiseScalingFactor, 0);
}

@end