@interface DeepFusionNoiseTuningPlist
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionNoiseTuningPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = (DeepFusionNoiseTuningParameters *)objc_opt_new();
  slEV0 = self->slEV0;
  self->slEV0 = v5;

  v7 = self->slEV0;
  v8 = [v4 objectForKeyedSubscript:@"SL_EV0"];
  int v9 = [(DeepFusionNoiseTuningParameters *)v7 readPlist:v8];

  if (v9) {
    goto LABEL_4;
  }
  v10 = (DeepFusionNoiseTuningParameters *)objc_opt_new();
  slEV0Long = self->slEV0Long;
  self->slEV0Long = v10;

  v12 = self->slEV0Long;
  v13 = [v4 objectForKeyedSubscript:@"SL_EV0_LONG"];
  int v9 = [(DeepFusionNoiseTuningParameters *)v12 readPlist:v13];

  if (v9) {
LABEL_4:
  }
    FigDebugAssert3();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->slEV0Long, 0);

  objc_storeStrong((id *)&self->slEV0, 0);
}

@end