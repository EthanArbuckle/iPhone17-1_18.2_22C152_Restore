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
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"SL_EV0", v9);
  int Plist = objc_msgSend_readPlist_(v7, v11, (uint64_t)v10, v12);

  if (Plist) {
    goto LABEL_4;
  }
  v14 = (DeepFusionFusionData *)objc_opt_new();
  slEv0Long = self->slEv0Long;
  self->slEv0Long = v14;

  v16 = self->slEv0Long;
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
  objc_storeStrong((id *)&self->slEv0Long, 0);

  objc_storeStrong((id *)&self->slEv0, 0);
}

@end