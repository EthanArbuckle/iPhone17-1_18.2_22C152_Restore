@interface DeepFusionTuningImageParameters
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionTuningImageParameters

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"GlobalNoiseFactor", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  globalNoiseFactor = self->globalNoiseFactor;
  self->globalNoiseFactor = v11;

  v13 = [GainValueArray alloc];
  v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"LumaMaxNoiseFactor", v15);

  v19 = (GainValueArray *)objc_msgSend_initWithArray_(v13, v17, (uint64_t)v16, v18);
  lumaMaxNoise = self->lumaMaxNoise;
  self->lumaMaxNoise = v19;

  if ((objc_msgSend_isValid(self->globalNoiseFactor, v21, v22, v23) & 1) != 0
    && (objc_msgSend_isValid(self->lumaMaxNoise, v24, v25, v26) & 1) != 0)
  {
    return 0;
  }
  FigDebugAssert3();
  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lumaMaxNoise, 0);

  objc_storeStrong((id *)&self->globalNoiseFactor, 0);
}

@end