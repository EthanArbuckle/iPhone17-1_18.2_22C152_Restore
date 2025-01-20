@interface ToneMapSmoothingBandData
- (int)readPlist:(id)a3;
@end

@implementation ToneMapSmoothingBandData

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"MaskedDetailMix", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  maskedDetailMix = self->maskedDetailMix;
  self->maskedDetailMix = v11;

  if (!self->maskedDetailMix) {
    goto LABEL_10;
  }
  v13 = [GainValueArray alloc];
  v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"UnmaskedDetailMix", v15);
  v19 = (GainValueArray *)objc_msgSend_initWithArray_(v13, v17, (uint64_t)v16, v18);
  unmaskedDetailMix = self->unmaskedDetailMix;
  self->unmaskedDetailMix = v19;

  if (!self->unmaskedDetailMix) {
    goto LABEL_10;
  }
  v23 = objc_msgSend_objectForKeyedSubscript_(v4, v21, @"SkyMaskedDetailMix", v22);

  if (v23)
  {
    v26 = [GainValueArray alloc];
    v29 = objc_msgSend_objectForKeyedSubscript_(v4, v27, @"SkyMaskedDetailMix", v28);
    v32 = (GainValueArray *)objc_msgSend_initWithArray_(v26, v30, (uint64_t)v29, v31);
    skyMaskedDetailMix = self->skyMaskedDetailMix;
    self->skyMaskedDetailMix = v32;
  }
  v34 = objc_msgSend_objectForKeyedSubscript_(v4, v24, @"Feature1MaskedDetailMix", v25);

  if (v34)
  {
    v35 = [GainValueArray alloc];
    v38 = objc_msgSend_objectForKeyedSubscript_(v4, v36, @"Feature1MaskedDetailMix", v37);
    v41 = (GainValueArray *)objc_msgSend_initWithArray_(v35, v39, (uint64_t)v38, v40);
    v42 = self->skyMaskedDetailMix;
    self->skyMaskedDetailMix = v41;
  }
  if (self->skyMaskedDetailMix)
  {
    int v43 = 0;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->skyMaskedDetailMix, 0);
  objc_storeStrong((id *)&self->unmaskedDetailMix, 0);

  objc_storeStrong((id *)&self->maskedDetailMix, 0);
}

@end