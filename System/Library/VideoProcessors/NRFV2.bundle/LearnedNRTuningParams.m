@interface LearnedNRTuningParams
- (int)readPlist:(id)a3;
@end

@implementation LearnedNRTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"ReadNoiseModulation", v7);
  v11 = (GainValueArray *)objc_msgSend_initWithArray_(v5, v9, (uint64_t)v8, v10);
  readNoiseModulationTuning = self->readNoiseModulationTuning;
  self->readNoiseModulationTuning = v11;

  v13 = [GainValueArray alloc];
  v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"ShotNoiseModulation", v15);
  v19 = (GainValueArray *)objc_msgSend_initWithArray_(v13, v17, (uint64_t)v16, v18);
  shotNoiseModulationTuning = self->shotNoiseModulationTuning;
  self->shotNoiseModulationTuning = v19;

  v21 = [GainValueArray alloc];
  v24 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"LumaAddBackWeight", v23);
  v27 = (GainValueArray *)objc_msgSend_initWithArray_(v21, v25, (uint64_t)v24, v26);
  lumaAddBackTuning = self->lumaAddBackTuning;
  self->lumaAddBackTuning = v27;

  v29 = [GainValueArray alloc];
  v32 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"LumaAddBackBand0Weight", v31);
  v35 = (GainValueArray *)objc_msgSend_initWithArray_(v29, v33, (uint64_t)v32, v34);
  lumaAddBackBand0Tuning = self->lumaAddBackBand0Tuning;
  self->lumaAddBackBand0Tuning = v35;

  v37 = [GainValueArray alloc];
  v40 = objc_msgSend_objectForKeyedSubscript_(v4, v38, @"LumaAddBackClipToSNR", v39);

  v43 = (GainValueArray *)objc_msgSend_initWithArray_(v37, v41, (uint64_t)v40, v42);
  lumaAddBackClipToSNRTuning = self->lumaAddBackClipToSNRTuning;
  self->lumaAddBackClipToSNRTuning = v43;

  if (self->readNoiseModulationTuning
    && self->shotNoiseModulationTuning
    && self->lumaAddBackTuning
    && self->lumaAddBackBand0Tuning
    && self->lumaAddBackClipToSNRTuning)
  {
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lumaAddBackClipToSNRTuning, 0);
  objc_storeStrong((id *)&self->lumaAddBackBand0Tuning, 0);
  objc_storeStrong((id *)&self->lumaAddBackTuning, 0);
  objc_storeStrong((id *)&self->shotNoiseModulationTuning, 0);

  objc_storeStrong((id *)&self->readNoiseModulationTuning, 0);
}

@end