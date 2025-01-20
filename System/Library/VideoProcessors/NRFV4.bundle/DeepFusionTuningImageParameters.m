@interface DeepFusionTuningImageParameters
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionTuningImageParameters

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"GlobalNoiseFactor"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  globalNoiseFactor = self->globalNoiseFactor;
  self->globalNoiseFactor = v7;

  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"LumaMaxNoiseFactor"];

  v11 = [(GainValueArray *)v9 initWithArray:v10];
  lumaMaxNoise = self->lumaMaxNoise;
  self->lumaMaxNoise = v11;

  if (![(GainValueArray *)self->globalNoiseFactor isValid])
  {
    int v13 = -73385;
LABEL_7:
    FigDebugAssert3();
    return v13;
  }
  if (![(GainValueArray *)self->lumaMaxNoise isValid])
  {
    int v13 = -73385;
    goto LABEL_7;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lumaMaxNoise, 0);

  objc_storeStrong((id *)&self->globalNoiseFactor, 0);
}

@end