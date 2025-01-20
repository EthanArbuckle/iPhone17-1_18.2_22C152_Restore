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
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"SL_EV0", v9);
  int Plist = objc_msgSend_readPlist_(v7, v11, (uint64_t)v10, v12);

  if (Plist) {
    goto LABEL_4;
  }
  v14 = (DeepFusionNoiseTuningParameters *)objc_opt_new();
  slEV0Long = self->slEV0Long;
  self->slEV0Long = v14;

  v16 = self->slEV0Long;
  v19 = objc_msgSend_objectForKeyedSubscript_(v4, v17, @"SL_EV0_LONG", v18);
  int Plist = objc_msgSend_readPlist_(v16, v20, (uint64_t)v19, v21);

  if (Plist) {
LABEL_4:
  }
    FigDebugAssert3();

  return Plist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->slEV0Long, 0);

  objc_storeStrong((id *)&self->slEV0, 0);
}

@end