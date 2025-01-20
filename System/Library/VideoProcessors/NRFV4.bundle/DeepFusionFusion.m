@interface DeepFusionFusion
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionFusion

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = (DeepFusionFusionData *)objc_opt_new();
  slEv0 = self->slEv0;
  self->slEv0 = v5;

  v7 = self->slEv0;
  v8 = [v4 objectForKeyedSubscript:@"SL_EV0"];
  int v9 = [(DeepFusionFusionData *)v7 readPlist:v8];

  if (v9) {
    goto LABEL_4;
  }
  v10 = (DeepFusionFusionData *)objc_opt_new();
  slEv0Long = self->slEv0Long;
  self->slEv0Long = v10;

  v12 = self->slEv0Long;
  v13 = [v4 objectForKeyedSubscript:@"SL_EV0_LONG"];
  int v9 = [(DeepFusionFusionData *)v12 readPlist:v13];

  if (v9) {
LABEL_4:
  }
    FigDebugAssert3();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->slEv0Long, 0);

  objc_storeStrong((id *)&self->slEv0, 0);
}

@end