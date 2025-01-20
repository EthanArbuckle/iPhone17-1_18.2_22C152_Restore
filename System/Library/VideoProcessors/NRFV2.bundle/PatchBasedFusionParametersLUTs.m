@interface PatchBasedFusionParametersLUTs
- (int)readPlist:(id)a3;
@end

@implementation PatchBasedFusionParametersLUTs

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_valueForKey_(v4, v6, @"BoundsMapLimit", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  boundsMapLimit = self->boundsMapLimit;
  self->boundsMapLimit = v11;

  if (!self->boundsMapLimit) {
    goto LABEL_11;
  }
  v13 = [GainValueArray alloc];
  v16 = objc_msgSend_valueForKey_(v4, v14, @"ShadowLimit", v15);
  v19 = (GainValueArray *)objc_msgSend_initWithArray_(v13, v17, (uint64_t)v16, v18);
  shadowLimit = self->shadowLimit;
  self->shadowLimit = v19;

  if (!self->shadowLimit) {
    goto LABEL_11;
  }
  v21 = [GainValueArray alloc];
  v24 = objc_msgSend_valueForKey_(v4, v22, @"LowResMotionThreshold", v23);
  v27 = (GainValueArray *)objc_msgSend_initWithArray_(v21, v25, (uint64_t)v24, v26);
  lowResMotionThreshold = self->lowResMotionThreshold;
  self->lowResMotionThreshold = v27;

  if (!self->lowResMotionThreshold) {
    goto LABEL_11;
  }
  v29 = [GainValueArray alloc];
  v32 = objc_msgSend_valueForKey_(v4, v30, @"BoostedLumaMotionThreshold", v31);
  v35 = (GainValueArray *)objc_msgSend_initWithArray_(v29, v33, (uint64_t)v32, v34);
  boostedLumaMotionThreshold = self->boostedLumaMotionThreshold;
  self->boostedLumaMotionThreshold = v35;

  if (!self->boostedLumaMotionThreshold) {
    goto LABEL_11;
  }
  v37 = [GainValueArray alloc];
  v40 = objc_msgSend_valueForKey_(v4, v38, @"SADThreshold", v39);
  v43 = (GainValueArray *)objc_msgSend_initWithArray_(v37, v41, (uint64_t)v40, v42);
  sadThreshold = self->sadThreshold;
  self->sadThreshold = v43;

  if (!self->sadThreshold) {
    goto LABEL_11;
  }
  v45 = [GainValueArray alloc];
  v48 = objc_msgSend_valueForKey_(v4, v46, @"NCCLowLimitMatchedTexture", v47);
  v51 = (GainValueArray *)objc_msgSend_initWithArray_(v45, v49, (uint64_t)v48, v50);
  nccLowLimitMatchedTexture = self->nccLowLimitMatchedTexture;
  self->nccLowLimitMatchedTexture = v51;

  if (!self->nccLowLimitMatchedTexture) {
    goto LABEL_11;
  }
  v53 = [GainValueArray alloc];
  v56 = objc_msgSend_valueForKey_(v4, v54, @"NCCHighLimitMatchedTexture", v55);
  v59 = (GainValueArray *)objc_msgSend_initWithArray_(v53, v57, (uint64_t)v56, v58);
  nccHighLimitMatchedTexture = self->nccHighLimitMatchedTexture;
  self->nccHighLimitMatchedTexture = v59;

  if (!self->nccHighLimitMatchedTexture) {
    goto LABEL_11;
  }
  v61 = [GainValueArray alloc];
  v64 = objc_msgSend_valueForKey_(v4, v62, @"FusionBoostMatchedTexture", v63);
  v67 = (GainValueArray *)objc_msgSend_initWithArray_(v61, v65, (uint64_t)v64, v66);
  fusionBoostMatchedTexture = self->fusionBoostMatchedTexture;
  self->fusionBoostMatchedTexture = v67;

  if (self->fusionBoostMatchedTexture)
  {
    int v69 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
  }

  return v69;
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