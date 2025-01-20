@interface LearnedNRTuningParams
- (int)readPlist:(id)a3;
@end

@implementation LearnedNRTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
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

  v25 = [GainValueArray alloc];
  v26 = [v4 objectForKeyedSubscript:@"LumaAddBackLSCModulation"];
  v27 = [(GainValueArray *)v25 initWithArray:v26];
  lumaAddBackLSCModulationTuning = self->lumaAddBackLSCModulationTuning;
  self->lumaAddBackLSCModulationTuning = v27;

  LOBYTE(v25) = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"ConsiderHighlightCompression", 0, 0);
  self->considerHighlightCompression = (char)v25;
  if (self->readNoiseModulationTuning
    && self->shotNoiseModulationTuning
    && self->lumaAddBackTuning
    && self->lumaAddBackBand0Tuning
    && self->lumaAddBackClipToSNRTuning
    && self->lumaAddBackLSCModulationTuning)
  {
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lumaAddBackLSCModulationTuning, 0);
  objc_storeStrong((id *)&self->lumaAddBackClipToSNRTuning, 0);
  objc_storeStrong((id *)&self->lumaAddBackBand0Tuning, 0);
  objc_storeStrong((id *)&self->lumaAddBackTuning, 0);
  objc_storeStrong((id *)&self->shotNoiseModulationTuning, 0);

  objc_storeStrong((id *)&self->readNoiseModulationTuning, 0);
}

@end