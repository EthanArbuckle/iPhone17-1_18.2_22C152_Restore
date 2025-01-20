@interface DeepFusionNoiseTuningParameters
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionNoiseTuningParameters

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"LSCAmpFactor"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  LSCAmpFactor = self->LSCAmpFactor;
  self->LSCAmpFactor = v7;

  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"EV0FusionTarget"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  ev0FusionTarget = self->ev0FusionTarget;
  self->ev0FusionTarget = v11;

  v13 = [GainValueArray alloc];
  v14 = [v4 objectForKeyedSubscript:@"LongFusionTarget"];
  v15 = [(GainValueArray *)v13 initWithArray:v14];
  longFusionTarget = self->longFusionTarget;
  self->longFusionTarget = v15;

  v17 = [GainValueArray alloc];
  v18 = [v4 objectForKeyedSubscript:@"LumaPowerDenomNoiseFactor"];
  v19 = [(GainValueArray *)v17 initWithArray:v18];
  lumaPowerDenom = self->lumaPowerDenom;
  self->lumaPowerDenom = v19;

  if (![(GainValueArray *)self->LSCAmpFactor isValid])
  {
    int v25 = -73423;
LABEL_12:
    FigDebugAssert3();
    goto LABEL_7;
  }
  if (![(GainValueArray *)self->ev0FusionTarget isValid])
  {
    int v25 = -73423;
    goto LABEL_12;
  }
  if (![(GainValueArray *)self->longFusionTarget isValid])
  {
    int v25 = -73423;
    goto LABEL_12;
  }
  if (![(GainValueArray *)self->lumaPowerDenom isValid])
  {
    int v25 = -73423;
    goto LABEL_12;
  }
  v21 = (DeepFusionTuningImageParameters *)objc_opt_new();
  ref = self->ref;
  self->ref = v21;

  v23 = self->ref;
  v24 = [v4 objectForKeyedSubscript:@"Reference"];
  int v25 = [(DeepFusionTuningImageParameters *)v23 readPlist:v24];

  if (v25) {
    goto LABEL_12;
  }
  v26 = (DeepFusionTuningImageParameters *)objc_opt_new();
  sl = self->sl;
  self->sl = v26;

  v28 = self->sl;
  v29 = [v4 objectForKeyedSubscript:@"SyntheticLong"];
  int v25 = [(DeepFusionTuningImageParameters *)v28 readPlist:v29];

  if (v25) {
    goto LABEL_12;
  }
LABEL_7:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sl, 0);
  objc_storeStrong((id *)&self->ref, 0);
  objc_storeStrong((id *)&self->lumaPowerDenom, 0);
  objc_storeStrong((id *)&self->longFusionTarget, 0);
  objc_storeStrong((id *)&self->ev0FusionTarget, 0);

  objc_storeStrong((id *)&self->LSCAmpFactor, 0);
}

@end