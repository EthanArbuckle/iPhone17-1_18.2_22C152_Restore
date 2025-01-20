@interface ToneMappingPlist
+ (void)initialize;
- (ToneMappingPlist)init;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation ToneMappingPlist

+ (void)initialize
{
  dword_26B429798 = 2;
  dword_26B42979C = 2;
  dword_26B4297A8 = -1;
  dword_26B4297B0 = 2;
  dword_26B4297A4 = 2;
  dword_26B4297A0 = 2;
  dword_26B4297AC = 2;
}

- (ToneMappingPlist)init
{
  v16.receiver = self;
  v16.super_class = (Class)ToneMappingPlist;
  v2 = [(ToneMappingPlist *)&v16 init];
  if (v2)
  {
    v3 = objc_alloc_init(SRLPlist);
    srl = v2->srl;
    v2->srl = v3;

    v5 = objc_alloc_init(SRLv2Plist);
    srlv2 = v2->srlv2;
    v2->srlv2 = v5;

    v7 = objc_alloc_init(TCRPlist);
    tcr = v2->tcr;
    v2->tcr = v7;

    v9 = objc_alloc_init(ToneMapSmoothingPlist);
    mstm = v2->mstm;
    v2->mstm = v9;

    v11 = objc_alloc_init(ToneMapSmoothingPlist);
    mstmWithSRL = v2->mstmWithSRL;
    v2->mstmWithSRL = v11;

    v13 = objc_alloc_init(SFFPlist);
    sff = v2->sff;
    v2->sff = v13;
  }
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  self->int srlVersion = objc_msgSend_cmi_unsignedIntValueForKey_defaultValue_found_(v4, v5, @"EnableSRL", 0, 0);
  self->enableSFF = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v6, @"EnableSFF", 0, 0);
  self->enableMSTM = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v7, @"EnableMSTM", 0, 0);
  self->enableTCR = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v8, @"EnableTCR", 0, 0);
  self->enableSTF = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v9, @"EnableSTF", 0, 0);
  objc_msgSend_objectForKeyedSubscript_(v4, v10, @"StfTuningParameters", v11);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  stfTuningParameters = self->stfTuningParameters;
  self->stfTuningParameters = v12;

  if (!self->srlVersion)
  {
LABEL_4:
    BOOL v21 = 0;
    goto LABEL_6;
  }
  srl = self->srl;
  v17 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"SRL", v15);
  int Plist = objc_msgSend_readPlist_(srl, v18, (uint64_t)v17, v19);
  BOOL v21 = Plist == 0;

  srlv2 = self->srlv2;
  v25 = objc_msgSend_objectForKeyedSubscript_(v4, v23, @"SRLv2", v24);
  int v28 = objc_msgSend_readPlist_(srlv2, v26, (uint64_t)v25, v27);

  int srlVersion = self->srlVersion;
  if (srlVersion != 2)
  {
    if (srlVersion == 1) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  BOOL v21 = (Plist | v28) == 0;
LABEL_6:
  if (self->enableSFF)
  {
    sff = self->sff;
    v31 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"SFF", v15);
    BOOL v34 = objc_msgSend_readPlist_(sff, v32, (uint64_t)v31, v33) == 0;
  }
  else
  {
    BOOL v34 = 0;
  }
  if (self->enableMSTM)
  {
    mstm = self->mstm;
    v36 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"MSTM", v15);
    BOOL v39 = objc_msgSend_readPlist_(mstm, v37, (uint64_t)v36, v38) == 0;
  }
  else
  {
    BOOL v39 = 0;
  }
  if (self->srlVersion)
  {
    mstmWithSRL = self->mstmWithSRL;
    v41 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"MSTMWithSRL", v15);
    BOOL v44 = objc_msgSend_readPlist_(mstmWithSRL, v42, (uint64_t)v41, v43) != 0;
  }
  else
  {
    BOOL v44 = 1;
  }
  if (self->enableTCR)
  {
    tcr = self->tcr;
    v46 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"ToneCurveRegularization", v15);
    BOOL v49 = objc_msgSend_readPlist_(tcr, v47, (uint64_t)v46, v48) == 0;
  }
  else
  {
    BOOL v49 = 0;
  }
  if (self->srlVersion && (!v21 || v44 || !v39)) {
    self->int srlVersion = 0;
  }
  char v50 = !self->enableTCR || v49;
  if ((v50 & 1) == 0) {
    self->enableTCR = 0;
  }
  char v51 = !self->enableSFF || v34;
  if ((v51 & 1) == 0) {
    self->enableSFF = 0;
  }
  char v52 = !self->enableMSTM || v39;
  if ((v52 & 1) == 0) {
    self->enableMSTM = 0;
  }
  self->enableLocalContrast = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v14, @"EnableLocalContrast", 0, 0);
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v53, @"DetailEnhanceLeftLimit", 0, 0.0);
  self->detailEnhanceLeftLimit = v54;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v55, @"DetailEnhanceRightLimit", 0, 0.0);
  self->detailEnhanceRightLimit = v56;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v57, @"DetailEnhanceStrength", 0, 0.0);
  self->detailEnhanceStrength = v58;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v59, @"ChromaGainAdjustmentPower", 0, 0.0);
  self->chromaGainAdjustmentPower = v60;
  self->enableGlobalContrast = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v61, @"EnableGlobalContrast", 0, 0);
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v62, @"BlackSubtractionClippingRatio", 0, 0.0);
  self->blackSubtractionClippingRatio = v63;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v64, @"BlackSubtractionLowLimit", 0, 0.0);
  self->blackSubtractionLowLimit = v65;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v66, @"MaximumContrastStrength", 0, 0.0);
  self->maximumContrastStrength = v67;
  self->GreenSkyFixEnabled = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v68, @"GreenSkyFixEnabled", 0, 0);
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v69, @"GreenSkyFixEVZeroTargetGainThreshold", 0, 0.0);
  self->GreenSkyFixEVZeroTargetGainThreshold = v70;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v71, @"GreenSkyFixCCTThreshold", 0, 0.0);
  self->GreenSkyFixCCTThreshold = v72;
  self->YellowSatFixEnabled = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v73, @"YellowSatFixEnabled", 0, 0);
  self->maskedSkyFixEnabled = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v74, @"MaskedSkyFixEnabled", 0, 0);
  self->maskedSkyCubeVersion = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v4, v75, @"MaskedSkyCubeVersion", 0, 0);

  return 0;
}

- (void)applyOverrides
{
  if (dword_26B4297A8 != -1) {
    self->int srlVersion = dword_26B4297A8;
  }
  if (dword_26B4297A4 <= 1) {
    self->enableSFF = dword_26B4297A4 == 1;
  }
  if (dword_26B4297A0 <= 1) {
    self->enableMSTM = dword_26B4297A0 == 1;
  }
  if (dword_26B4297B0 <= 1) {
    self->enableTCR = dword_26B4297B0 == 1;
  }
  if (dword_26B42979C <= 1) {
    self->enableLocalContrast = dword_26B42979C == 1;
  }
  if (dword_26B429798 <= 1) {
    self->enableGlobalContrast = dword_26B429798 == 1;
  }
  if (dword_26B4297AC <= 1) {
    self->enableSTF = dword_26B4297AC == 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->stfTuningParameters, 0);
  objc_storeStrong((id *)&self->mstmWithSRL, 0);
  objc_storeStrong((id *)&self->mstm, 0);
  objc_storeStrong((id *)&self->sff, 0);
  objc_storeStrong((id *)&self->tcr, 0);
  objc_storeStrong((id *)&self->srlv2, 0);

  objc_storeStrong((id *)&self->srl, 0);
}

@end