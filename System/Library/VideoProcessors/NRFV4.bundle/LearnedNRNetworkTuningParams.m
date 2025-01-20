@interface LearnedNRNetworkTuningParams
- (int)readPlist:(id)a3;
@end

@implementation LearnedNRNetworkTuningParams

- (int)readPlist:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)LearnedNRNetworkTuningParams;
  id v4 = a3;
  [(CMITuningPlist *)&v27 readPlist:v4];
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"ReadNoiseModulation"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  readNoiseModulationTuning = self->readNoiseModulationTuning;
  self->readNoiseModulationTuning = v7;

  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"ShotNoiseModulation"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  shotNoiseModulationTuning = self->shotNoiseModulationTuning;
  self->shotNoiseModulationTuning = v11;

  v13 = [GainValueArray alloc];
  v14 = [v4 objectForKeyedSubscript:@"LumaAddBackWeight"];
  v15 = [(GainValueArray *)v13 initWithArray:v14];
  lumaAddBackTuning = self->lumaAddBackTuning;
  self->lumaAddBackTuning = v15;

  v17 = [GainValueArray alloc];
  v18 = [v4 objectForKeyedSubscript:@"LumaAddBackBand0Weight"];
  v19 = [(GainValueArray *)v17 initWithArray:v18];
  lumaAddBackBand0Tuning = self->lumaAddBackBand0Tuning;
  self->lumaAddBackBand0Tuning = v19;

  v21 = [GainValueArray alloc];
  v22 = [v4 objectForKeyedSubscript:@"LumaAddBackClipToSNR"];
  v23 = [(GainValueArray *)v21 initWithArray:v22];
  lumaAddBackClipToSNRTuning = self->lumaAddBackClipToSNRTuning;
  self->lumaAddBackClipToSNRTuning = v23;

  LOBYTE(v21) = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"ConsiderHighlightCompression", 0, 0);
  self->considerHighlightCompression = (char)v21;
  if (self->readNoiseModulationTuning
    && self->shotNoiseModulationTuning
    && self->lumaAddBackTuning
    && self->lumaAddBackBand0Tuning
    && self->lumaAddBackClipToSNRTuning)
  {
    return 0;
  }
  FigDebugAssert3();
  v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return -12780;
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