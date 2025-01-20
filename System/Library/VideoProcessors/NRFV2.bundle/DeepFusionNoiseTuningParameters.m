@interface DeepFusionNoiseTuningParameters
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionNoiseTuningParameters

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"LSCAmpFactor", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  LSCAmpFactor = self->LSCAmpFactor;
  self->LSCAmpFactor = v11;

  v13 = [GainValueArray alloc];
  v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"EV0FusionTarget", v15);
  v19 = (GainValueArray *)objc_msgSend_initWithArray_(v13, v17, (uint64_t)v16, v18);
  ev0FusionTarget = self->ev0FusionTarget;
  self->ev0FusionTarget = v19;

  v21 = [GainValueArray alloc];
  v24 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"LongFusionTarget", v23);
  v27 = (GainValueArray *)objc_msgSend_initWithArray_(v21, v25, (uint64_t)v24, v26);
  longFusionTarget = self->longFusionTarget;
  self->longFusionTarget = v27;

  v29 = [GainValueArray alloc];
  v32 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"LumaPowerDenomNoiseFactor", v31);
  v35 = (GainValueArray *)objc_msgSend_initWithArray_(v29, v33, (uint64_t)v32, v34);
  lumaPowerDenom = self->lumaPowerDenom;
  self->lumaPowerDenom = v35;

  if ((objc_msgSend_isValid(self->LSCAmpFactor, v37, v38, v39) & 1) != 0
    && (objc_msgSend_isValid(self->ev0FusionTarget, v40, v41, v42) & 1) != 0
    && (objc_msgSend_isValid(self->longFusionTarget, v43, v44, v45) & 1) != 0
    && (objc_msgSend_isValid(self->lumaPowerDenom, v46, v47, v48) & 1) != 0)
  {
    v49 = (DeepFusionTuningImageParameters *)objc_opt_new();
    ref = self->ref;
    self->ref = v49;

    v51 = self->ref;
    v54 = objc_msgSend_objectForKeyedSubscript_(v4, v52, @"Reference", v53);
    int Plist = objc_msgSend_readPlist_(v51, v55, (uint64_t)v54, v56);

    if (Plist) {
      goto LABEL_9;
    }
    v58 = (DeepFusionTuningImageParameters *)objc_opt_new();
    sl = self->sl;
    self->sl = v58;

    v60 = self->sl;
    v63 = objc_msgSend_objectForKeyedSubscript_(v4, v61, @"SyntheticLong", v62);
    int Plist = objc_msgSend_readPlist_(v60, v64, (uint64_t)v63, v65);

    if (Plist) {
LABEL_9:
    }
      FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    int Plist = -1;
  }

  return Plist;
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