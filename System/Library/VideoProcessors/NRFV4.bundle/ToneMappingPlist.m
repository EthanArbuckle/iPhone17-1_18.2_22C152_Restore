@interface ToneMappingPlist
+ (void)initialize;
- (ToneMappingPlist)init;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation ToneMappingPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ToneMappingPlist;
  [(CMITuningPlist *)&v57 readPlist:v4];
  uint64_t v5 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"EnableSRLVersion", 0, 0);
  self->int srlVersion = v5;
  self->int srlVersion = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"EnableSRL", v5, 0);
  self->enableSFF = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableSFF", 0, 0);
  self->enableMSTM = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableMSTM", 0, 0);
  self->enableTCR = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableTCR", 0, 0);
  self->enableSTF = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableSTF", 0, 0);
  v6 = [v4 objectForKeyedSubscript:@"StfTuningParameters"];
  stfTuningParameters = self->stfTuningParameters;
  self->stfTuningParameters = v6;

  self->enableUTM = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableUTM", 0, 0);
  self->enableMSTMv3 = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableMSTMv3", 0, 0);
  if (!self->srlVersion)
  {
    BOOL v12 = 0;
LABEL_11:
    char v11 = 0;
    goto LABEL_13;
  }
  v8 = [v4 objectForKeyedSubscript:@"SRLv2"];
  if (v8)
  {
    srlv2 = self->srlv2;
    v10 = [v4 objectForKeyedSubscript:@"SRLv2"];
    char v11 = [(SRLv2Plist *)srlv2 readPlist:v10] == 0;
  }
  else
  {
    char v11 = 0;
  }

  v13 = [v4 objectForKeyedSubscript:@"MSTMv2"];
  if (v13)
  {
    mstmv2 = self->mstmv2;
    v15 = [v4 objectForKeyedSubscript:@"MSTMv2"];
    BOOL v12 = [(MSTMv2Plist *)mstmv2 readPlist:v15] == 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  int srlVersion = self->srlVersion;
  if (srlVersion != 3)
  {
    if (srlVersion == 2) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v11 &= v12;
LABEL_13:
  if (self->enableSFF)
  {
    sff = self->sff;
    v18 = [v4 objectForKeyedSubscript:@"SFF"];
    BOOL v56 = [(SFFPlist *)sff readPlist:v18] == 0;
  }
  else
  {
    BOOL v56 = 0;
  }
  if (self->enableMSTM)
  {
    mstm = self->mstm;
    v20 = [v4 objectForKeyedSubscript:@"MSTM"];
    BOOL v21 = [(ToneMapSmoothingPlist *)mstm readPlist:v20] == 0;

    BOOL v22 = self->enableMSTM && v12;
    BOOL v55 = v22;
  }
  else
  {
    BOOL v55 = 0;
    BOOL v21 = 0;
  }
  v23 = [v4 objectForKeyedSubscript:@"MSTMv3"];
  if (v23)
  {
    mstmv3 = self->mstmv3;
    v25 = [v4 objectForKeyedSubscript:@"MSTMv3"];
    BOOL v26 = [(MSTMv3Plist *)mstmv3 readPlist:v25] == 0;
  }
  else
  {
    BOOL v26 = 0;
  }

  if (self->enableTCR)
  {
    tcr = self->tcr;
    v28 = [v4 objectForKeyedSubscript:@"ToneCurveRegularization"];
    BOOL v29 = [(TCRPlist *)tcr readPlist:v28] == 0;
  }
  else
  {
    BOOL v29 = 0;
  }
  if (self->srlVersion) {
    char v30 = v11;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    self->int srlVersion = 0;
  }
  char v31 = !self->enableTCR || v29;
  if ((v31 & 1) == 0) {
    self->enableTCR = 0;
  }
  char v32 = v56;
  if (!self->enableSFF) {
    char v32 = 1;
  }
  if ((v32 & 1) == 0) {
    self->enableSFF = 0;
  }
  int v33 = !self->enableMSTM || v21;
  if (((v33 | v55) & 1) == 0) {
    self->enableMSTM = 0;
  }
  BOOL v34 = self->enableMSTMv3 && v21;
  self->enableMSTMv3 = v34 && v26;
  v35 = [GainValueArray alloc];
  v36 = [v4 objectForKeyedSubscript:@"UTM"];
  v37 = [v36 objectForKeyedSubscript:@"UTMBackgroundFactor"];
  v38 = [(GainValueArray *)v35 initWithArray:v37];
  utmBackgroundFactor = self->utmBackgroundFactor;
  self->utmBackgroundFactor = v38;

  v40 = [GainValueArray alloc];
  v41 = [v4 objectForKeyedSubscript:@"UTM"];
  v42 = [v41 objectForKeyedSubscript:@"UTMForegroundFactor"];
  v43 = [(GainValueArray *)v40 initWithArray:v42];
  utmForegroundFactor = self->utmForegroundFactor;
  self->utmForegroundFactor = v43;

  if (self->enableUTM && !self->utmBackgroundFactor) {
    self->enableUTM = 0;
  }
  self->enableLocalContrast = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableLocalContrast", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"DetailEnhanceLeftLimit", 0, 0.0);
  self->detailEnhanceLeftLimit = v45;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"DetailEnhanceRightLimit", 0, 0.0);
  self->detailEnhanceRightLimit = v46;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"DetailEnhanceStrength", 0, 0.0);
  self->detailEnhanceStrength = v47;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ChromaGainAdjustmentPower", 0, 0.0);
  self->chromaGainAdjustmentPower = v48;
  self->enableGlobalContrast = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableGlobalContrast", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BlackSubtractionClippingRatio", 0, 0.0);
  self->blackSubtractionClippingRatio = v49;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BlackSubtractionLowLimit", 0, 0.0);
  self->blackSubtractionLowLimit = v50;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"MaximumContrastStrength", 0, 0.0);
  self->maximumContrastStrength = v51;
  self->GreenSkyFixEnabled = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"GreenSkyFixEnabled", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GreenSkyFixEVZeroTargetGainThreshold", 0, 0.0);
  self->GreenSkyFixEVZeroTargetGainThreshold = v52;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GreenSkyFixCCTThreshold", 0, 0.0);
  self->GreenSkyFixCCTThreshold = v53;
  self->YellowSatFixEnabled = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"YellowSatFixEnabled", 0, 0);
  self->maskedSkyFixEnabled = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"MaskedSkyFixEnabled", 0, 0);
  self->maskedSkyCubeVersion = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"MaskedSkyCubeVersion", 0, 0);
  self->applyHRGainDownToLocalGainMap = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyHRGainDownToLocalGainMap", 0, 0);

  return 0;
}

+ (void)initialize
{
  globalContrastOverride = 2;
  localContrastOverride = 2;
  srlOverride = -1;
  tcrOverride = 2;
  sffOverride = 2;
  mstmOverride = 2;
  utmOverride = 2;
  stfOverride = 2;
  applyHRGainDownToLocalGainMapOverride = 2;
}

- (ToneMappingPlist)init
{
  v18.receiver = self;
  v18.super_class = (Class)ToneMappingPlist;
  v2 = [(CMITuningPlist *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(SRLPlist);
    srl = v2->srl;
    v2->srl = v3;

    uint64_t v5 = objc_alloc_init(SRLv2Plist);
    srlv2 = v2->srlv2;
    v2->srlv2 = v5;

    v7 = objc_alloc_init(TCRPlist);
    tcr = v2->tcr;
    v2->tcr = v7;

    v9 = objc_alloc_init(ToneMapSmoothingPlist);
    mstm = v2->mstm;
    v2->mstm = v9;

    char v11 = objc_alloc_init(MSTMv2Plist);
    mstmv2 = v2->mstmv2;
    v2->mstmv2 = v11;

    v13 = objc_alloc_init(MSTMv3Plist);
    mstmv3 = v2->mstmv3;
    v2->mstmv3 = v13;

    v15 = objc_alloc_init(SFFPlist);
    sff = v2->sff;
    v2->sff = v15;
  }
  return v2;
}

- (void)applyOverrides
{
  if (srlOverride != -1) {
    self->int srlVersion = srlOverride;
  }
  if (sffOverride <= 1) {
    self->enableSFF = sffOverride == 1;
  }
  if (mstmOverride <= 1) {
    self->enableMSTM = mstmOverride == 1;
  }
  if (utmOverride <= 1) {
    self->enableUTM = utmOverride == 1;
  }
  if (tcrOverride <= 1) {
    self->enableTCR = tcrOverride == 1;
  }
  if (localContrastOverride <= 1) {
    self->enableLocalContrast = localContrastOverride == 1;
  }
  if (globalContrastOverride <= 1) {
    self->enableGlobalContrast = globalContrastOverride == 1;
  }
  if (stfOverride <= 1) {
    self->enableSTF = stfOverride == 1;
  }
  if (applyHRGainDownToLocalGainMapOverride <= 1) {
    self->applyHRGainDownToLocalGainMap = applyHRGainDownToLocalGainMapOverride == 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->stfTuningParameters, 0);
  objc_storeStrong((id *)&self->utmBackgroundFactor, 0);
  objc_storeStrong((id *)&self->utmForegroundFactor, 0);
  objc_storeStrong((id *)&self->mstmv3, 0);
  objc_storeStrong((id *)&self->mstmv2, 0);
  objc_storeStrong((id *)&self->mstm, 0);
  objc_storeStrong((id *)&self->sff, 0);
  objc_storeStrong((id *)&self->tcr, 0);
  objc_storeStrong((id *)&self->srlv2, 0);

  objc_storeStrong((id *)&self->srl, 0);
}

@end