@interface DeepFusionFusionBandData
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionFusionBandData

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"ChromaGlobal", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  chromaGlobal = self->chromaGlobal;
  self->chromaGlobal = v11;

  if ((objc_msgSend_isValid(self->chromaGlobal, v13, v14, v15) & 1) == 0) {
    goto LABEL_9;
  }
  v16 = [GainValueArray alloc];
  v19 = objc_msgSend_objectForKeyedSubscript_(v4, v17, @"LSCAmp", v18);
  v22 = (GainValueArray *)objc_msgSend_initWithArray_(v16, v20, (uint64_t)v19, v21);
  lscAmp = self->lscAmp;
  self->lscAmp = v22;

  if ((objc_msgSend_isValid(self->lscAmp, v24, v25, v26) & 1) == 0) {
    goto LABEL_9;
  }
  v27 = [GainValueArray alloc];
  v30 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"LSCOffset", v29);
  v33 = (GainValueArray *)objc_msgSend_initWithArray_(v27, v31, (uint64_t)v30, v32);
  lscOffset = self->lscOffset;
  self->lscOffset = v33;

  if ((objc_msgSend_isValid(self->lscOffset, v35, v36, v37) & 1) == 0) {
    goto LABEL_9;
  }
  v38 = [GainValueArray alloc];
  v41 = objc_msgSend_objectForKeyedSubscript_(v4, v39, @"LumaMid", v40);
  v44 = (GainValueArray *)objc_msgSend_initWithArray_(v38, v42, (uint64_t)v41, v43);
  lumaMid = self->lumaMid;
  self->lumaMid = v44;

  if ((objc_msgSend_isValid(self->lumaMid, v46, v47, v48) & 1) == 0) {
    goto LABEL_9;
  }
  v49 = [GainValueArray alloc];
  v52 = objc_msgSend_objectForKeyedSubscript_(v4, v50, @"LumaSlope", v51);
  v55 = (GainValueArray *)objc_msgSend_initWithArray_(v49, v53, (uint64_t)v52, v54);
  lumaSlope = self->lumaSlope;
  self->lumaSlope = v55;

  if ((objc_msgSend_isValid(self->lumaSlope, v57, v58, v59) & 1) == 0) {
    goto LABEL_9;
  }
  v60 = [GainValueArray alloc];
  v63 = objc_msgSend_objectForKeyedSubscript_(v4, v61, @"HighlightFusionAlpha", v62);
  v66 = (GainValueArray *)objc_msgSend_initWithArray_(v60, v64, (uint64_t)v63, v65);
  highlightFusionAlpha = self->highlightFusionAlpha;
  self->highlightFusionAlpha = v66;

  if (objc_msgSend_isValid(self->highlightFusionAlpha, v68, v69, v70))
  {
    int v71 = 0;
  }
  else
  {
LABEL_9:
    FigDebugAssert3();
    int v71 = -1;
  }

  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightFusionAlpha, 0);
  objc_storeStrong((id *)&self->lumaSlope, 0);
  objc_storeStrong((id *)&self->lumaMid, 0);
  objc_storeStrong((id *)&self->lscOffset, 0);
  objc_storeStrong((id *)&self->lscAmp, 0);

  objc_storeStrong((id *)&self->chromaGlobal, 0);
}

@end