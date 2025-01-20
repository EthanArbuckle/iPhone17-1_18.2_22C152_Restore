@interface H13FastBayerProcConfig
- (H13FastBayerProcConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 auxiliaryPixelFormats:(id)a5;
- (int)checkSymmetricalFiltersForConfig:(HRDConfig *)a3;
- (int)determineGOCConfigForInputFrame:(id)a3 lscConfig:(LSCConfig *)a4 hrEnabled:awbComputedGains:processingOptions:gocConfig:;
- (int)determineGOCConfigFromRegistersForInputFrame:(H13FastBayerProcConfig *)self lscConfig:(SEL)a2 hrEnabled:(id)a3 gocConfig:(LSCConfig *)a4;
- (int)determineHPBLUTFromInputFrame:(id)a3 hpbLUT:(char *)a4;
- (int)determineHPBLUTFromRegisters:(id)a3 hpbLUT:(char *)a4;
- (int)determineHPPPInBlendLUTFromInputFrame:(id)a3 hpppInBlendLUT:(float *)a4;
- (int)determineHPPPInBlendLUTFromRegisters:(id)a3 hpppInBlendLUT:(float *)a4;
- (int)determineHRConfigFromInputFrame:(id)a3 bounds:(id)a4 hrConfig:(HRConfig *)a5 awbComputedGains:;
- (int)determineHRConfigFromRegistersForInputFrame:(id)a3 hrConfig:(HRConfig *)a4;
- (int)determineHREnabledForProcessingOptions:(id)a3 hrEnabled:(BOOL *)a4;
- (int)determineHREnabledFromRegisters:(id)a3 hrEnabled:(BOOL *)a4;
- (int)determineInBlendLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 inBlendLUT:;
- (int)determineInBlendLUTFromRegisters:(id)a3 inBlendLUT:(float *)a4;
- (int)determineMixClipLUTFromInputFrame:(id)a3 mixClipLUT:(float *)a4;
- (int)determineMixClipLUTFromRegisters:(id)a3 mixClipLUT:(float *)a4;
- (int)determineRcvLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 rcvLUT:;
- (int)determineRcvLUTFromRegisters:(id)a3 rcvLUT:(float *)a4;
- (int)determineSoftClipLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 softClipLUT:;
- (int)determineSoftClipLUTFromRegisters:(id)a3 softClipLUT:(float *)a4;
- (int)generateHRDConfigForInputFrame:(id)a3 processingOptions:(id)a4 hrdConfig:(HRDConfig *)a5 overwriteSubGnuforFlare:(BOOL)a6;
- (int)generateHRDConfigFromRegistersForInputFrame:(id)a3 hrdConfig:(HRDConfig *)a4;
- (int)generateHRDEnabledForInputFrame:(id)a3 hrdEnabled:(BOOL *)a4;
- (int)generateHRDEnabledFromRegistersDict:(id)a3 hrdEnabled:(BOOL *)a4;
- (int)getFlareCorrectionConfigForInputFrame:(id)a3 flareCorrectionConfig:(FlareCorrectionConfig *)a4;
- (int)getFlareDetectionConfigForInputFrame:(id)a3 flareDetectionConfig:(FlareDetectionConfig *)a4 flareCorrectionConfig:(FlareCorrectionConfig *)a5 bounds:(id)a6 hoclBinConfig:(HOCLBinConfig *)a7 outputMetadata:(id)a8;
- (int)getFrontEndConfigForInputFrame:(id)a3 bounds:(id)a4 frontEndThumbnailConfig:(FrontEndProcessorThumbnailConfig *)a5 gocConfig:(GOCConfig *)a6;
- (int)getGOCConfigForInputFrame:(id)a3 gocConfig:(GOCConfig *)a4 lscConfig:(LSCConfig *)a5 hrEnabled:awbComputedGains:processingOptions:;
- (int)getHOCLBinConfigForInputFrame:(id)a3 staticParameters:(id)a4 hoclBinConfig:(HOCLBinConfig *)a5;
- (int)getHRConfigForInputFrame:(id)a3 bounds:(id)a4 awbComputedGains:(const LSCConfig *)a5 lscConfig:hrConfig:outputMetadata:;
- (int)getHRDConfigForInputFrame:(id)a3 processingOptions:(id)a4 hrdConfig:(HRDConfig *)a5 overwriteSubGnuforFlare:(BOOL)a6;
- (int)getHRDEnabledForInputFrame:(id)a3 hrdEnabled:(BOOL *)a4;
- (int)getHREnabledForInputFrame:(id)a3 processingOptions:(id)a4 hrEnabled:(BOOL *)a5;
- (int)getHuemapConfigForInputFrame:(id)a3 huemapConfig:(HuemapConfig *)a4 gocConfig:(GOCConfig *)a5;
- (int)getHuemapFepConfigForInputFrame:(id)a3 huemapFepConfig:(HuemapFepConfig *)a4 gocConfig:(GOCConfig *)a5;
- (int)getHuemapMotionCompensationConfigForInputFrame:(id)a3 huemapMotionCompensationConfig:(HuemapMotionCompensationConfig *)a4;
- (int)getMotionCompensationEnabledForInputFrame:(id)a3 mcEnabled:(BOOL *)a4;
- (int)getRNFConfigForInputFrame:(id)a3 bounds:(id)a4 processingOptions:(id)a5 rnfConfig:(RNFConfig *)a6;
- (int)getSSCConfigForInputFrame:(id)a3 processingOptions:(id)a4 sscConfig:(SSCConfig *)a5;
- (int)getSyntheticConfigForInputFrame:(id)a3 syntheticThumbnailConfig:(SyntheticThumbnailConfig *)a4 lscConfig:awbGains:isQuadra:;
- (int)loadHPBLUTForInputFrame:(id)a3 toTexture:(id)a4;
- (int)loadHPPPInBlendLUTForInputFrame:(id)a3 toTexture:(id)a4;
- (int)loadInBlendLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:;
- (int)loadMixClipLUTForInputFrame:(id)a3 toTexture:(id)a4;
- (int)loadRcvLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:;
- (int)loadSoftClipLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:;
- (int)updateHOCLBinConfigForFlare:(id)a3 hoclBinConfig:(HOCLBinConfig *)a4;
@end

@implementation H13FastBayerProcConfig

- (H13FastBayerProcConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 auxiliaryPixelFormats:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)H13FastBayerProcConfig;
    v12 = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
    if (v12)
    {
      -[SoftISPConfig setMaximumOutputDimensions:](v12, "setMaximumOutputDimensions:", [v9 maximumWidth] | ((unint64_t)objc_msgSend(v9, "maximumHeight") << 32));
      [(SoftISPConfig *)v12 setInputPixelFormat:0];
      [(SoftISPConfig *)v12 setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
      [(SoftISPConfig *)v12 setOutputPixelFormat:1647719528];
      [(SoftISPConfig *)v12 setOutputMTLPixelFormatForPlane:&unk_270E97F60];
      -[SoftISPConfig setStageConfigMode:](v12, "setStageConfigMode:", [v9 stageConfigMode]);
      [(SoftISPConfig *)v12 setAuxiliaryPixelFormats:v11];
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();

    v12 = 0;
  }

  return v12;
}

- (int)getHRDConfigForInputFrame:(id)a3 processingOptions:(id)a4 hrdConfig:(HRDConfig *)a5 overwriteSubGnuforFlare:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  memset(v18, 0, sizeof(v18));
  if (!v10 || !a5)
  {
    int v14 = FigSignalErrorAt();
    goto LABEL_16;
  }
  *(_OWORD *)&a5[1].var10[2] = 0uLL;
  *(_OWORD *)&a5[1].var12 = 0uLL;
  *(_OWORD *)&a5[1].var4 = 0uLL;
  *(_OWORD *)&a5[1].var8 = 0uLL;
  *(_OWORD *)&a5[1].var1.var20 = 0uLL;
  *(_OWORD *)&a5[1].var2.var1 = 0uLL;
  *(_OWORD *)&a5->var21.var0 = 0uLL;
  *(_OWORD *)&a5[1].var1.var4 = 0uLL;
  *(_OWORD *)&a5->var19[1] = 0uLL;
  *(_OWORD *)&a5->var19[5] = 0uLL;
  *(_OWORD *)a5->var16 = 0uLL;
  *(_OWORD *)&a5->var16[4] = 0uLL;
  *(_OWORD *)&a5->var13[1] = 0uLL;
  *(_OWORD *)&a5->var13[5] = 0uLL;
  *(_OWORD *)a5->var10 = 0uLL;
  *(_OWORD *)&a5->var10[4] = 0uLL;
  *(_OWORD *)&a5->var2.var3 = 0uLL;
  *(_OWORD *)&a5->var6 = 0uLL;
  *(_OWORD *)&a5->var1.var12 = 0uLL;
  *(_OWORD *)&a5->var1.var24 = 0uLL;
  *(_OWORD *)&a5->var0 = 0uLL;
  if ([(SoftISPConfig *)self stageConfigMode] != 3
    && [(SoftISPConfig *)self stageConfigMode] != 4)
  {
    int v15 = [(H13FastBayerProcConfig *)self generateHRDConfigForInputFrame:v10 processingOptions:v11 hrdConfig:a5 overwriteSubGnuforFlare:v6];
    if (v15)
    {
      int v14 = v15;
      goto LABEL_22;
    }
    if ([(SoftISPConfig *)self stageConfigMode] != 2)
    {
LABEL_15:
      int v14 = 0;
      goto LABEL_16;
    }
    int v16 = [(H13FastBayerProcConfig *)self generateHRDConfigFromRegistersForInputFrame:v10 hrdConfig:v18];
    if (!v16)
    {
      int v14 = verifyConfig((uint64_t)v18, (uint64_t)a5);
      if (v14) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    int v14 = v16;
LABEL_22:
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v12 = [(H13FastBayerProcConfig *)self generateHRDConfigFromRegistersForInputFrame:v10 hrdConfig:a5];
  if (v12)
  {
    int v14 = v12;
    goto LABEL_22;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 4) {
    goto LABEL_15;
  }
  int v13 = [(H13FastBayerProcConfig *)self generateHRDConfigForInputFrame:v10 processingOptions:v11 hrdConfig:v18 overwriteSubGnuforFlare:v6];
  if (v13)
  {
    int v14 = v13;
    goto LABEL_22;
  }
  int v14 = verifyConfig((uint64_t)a5, (uint64_t)v18);
  if (v14) {
    goto LABEL_22;
  }
LABEL_16:

  return v14;
}

- (int)getHRDEnabledForInputFrame:(id)a3 hrdEnabled:(BOOL *)a4
{
  id v6 = a3;
  char v13 = 0;
  if (!v6 || !a4) {
    goto LABEL_23;
  }
  *a4 = 0;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    v7 = -[SoftISPInputFrame registers]((uint64_t)v6);
    int v8 = [(H13FastBayerProcConfig *)self generateHRDEnabledFromRegistersDict:v7 hrdEnabled:a4];

    if (v8) {
      goto LABEL_21;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 4)
    {
      int v9 = [(H13FastBayerProcConfig *)self generateHRDEnabledForInputFrame:v6 hrdEnabled:&v13];
      if (!v9)
      {
        if (*a4 != v13) {
          goto LABEL_22;
        }
        goto LABEL_14;
      }
      int v8 = v9;
LABEL_21:
      FigDebugAssert3();
      goto LABEL_15;
    }
  }
  else
  {
    int v10 = [(H13FastBayerProcConfig *)self generateHRDEnabledForInputFrame:v6 hrdEnabled:a4];
    if (v10)
    {
      int v8 = v10;
      goto LABEL_21;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 2)
    {
      id v11 = -[SoftISPInputFrame registers]((uint64_t)v6);
      int v8 = [(H13FastBayerProcConfig *)self generateHRDEnabledFromRegistersDict:v11 hrdEnabled:&v13];

      if (!v8)
      {
        if (*a4 != v13)
        {
LABEL_22:
          FigDebugAssert3();
LABEL_23:
          int v8 = FigSignalErrorAt();
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
LABEL_14:
  int v8 = 0;
LABEL_15:

  return v8;
}

- (int)generateHRDConfigFromRegistersForInputFrame:(id)a3 hrdConfig:(HRDConfig *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v62 = 0;
  id v6 = -[SoftISPInputFrame registers]((uint64_t)v5);
  v7 = v6;
  if (!v6
    || ([v6 objectForKeyedSubscript:@"BayerProcHRD"],
        (int v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_60;
  }
  int v9 = v8;
  int v10 = [v8 objectForKeyedSubscript:@"Config"];
  if (!v10)
  {
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
LABEL_109:

    goto LABEL_60;
  }
  id v11 = v10;
  a4->var1.var4 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"GNUEnable", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var8 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SimDemMaxSel", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var9 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SimDemModeBonGr", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var10 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SimDemModeGbonR", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var11 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SimDemModeRonGb", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var12 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SimDemModeGronB", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var13 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassBlueVertFIR", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var14 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlueVertMinSharpEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var15 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlueVertClampEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var16 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassRedVertFIR", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var17 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"RedVertMinSharpEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var18 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"RedVertClampEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var19 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassBlueHorizFIR", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var20 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlueHorizMinSharpEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var21 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlueHorizClampEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  a4->var1.var22 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassRedHorizFIR", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  *(&a4->var1.var22 + 1) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"RedHorizMinSharpEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  LOBYTE(a4->var1.var23) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"RedHorizClampEn", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  BYTE1(a4->var1.var23) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassBlueFIRmix", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  BYTE2(a4->var1.var23) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BypassRedFIRmix", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  int v12 = [v9 objectForKeyedSubscript:@"SimDemHFScale"];
  int v14 = v12;
  if (!v12) {
    goto LABEL_105;
  }
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "cmi_floatValueForKey:defaultValue:found:", @"ScaleRH", &v62, v13);
  a4->var2.var1 = *(float *)&v15;
  if (!v62) {
    goto LABEL_105;
  }
  a4->var2.var1 = *(float *)&v15 * 0.015625;
  LODWORD(v15) = 1.0;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"ScaleRV", &v62, v15);
  a4->var3 = *(float *)&v16;
  if (!v62) {
    goto LABEL_105;
  }
  a4->var3 = *(float *)&v16 * 0.015625;
  LODWORD(v16) = 1.0;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"ScaleBH", &v62, v16);
  a4->var2.var3 = *(float *)&v17;
  if (!v62) {
    goto LABEL_105;
  }
  a4->var2.var3 = *(float *)&v17 * 0.015625;
  LODWORD(v17) = 1.0;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"ScaleBV", &v62, v17);
  a4->var2.var2 = v18;
  if (!v62) {
    goto LABEL_105;
  }
  a4->var2.var2 = v18 * 0.015625;

  v19 = [v9 objectForKeyedSubscript:@"RedFIRmix"];
  int v14 = v19;
  if (!v19) {
    goto LABEL_105;
  }
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", @"Slope", &v62, v20);
  a4[1].var10[3] = *(float *)&v21;
  if (!v62) {
    goto LABEL_105;
  }
  LODWORD(v21) = 1.0;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"Threshold", &v62, v21);
  a4[1].var10[4] = v22;
  if (!v62) {
    goto LABEL_105;
  }

  v23 = [v9 objectForKeyedSubscript:@"BlueFIRmix"];
  int v14 = v23;
  if (!v23) {
    goto LABEL_105;
  }
  LODWORD(v24) = 1.0;
  objc_msgSend(v23, "cmi_floatValueForKey:defaultValue:found:", @"Slope", &v62, v24);
  a4[1].var11 = *(float *)&v25;
  if (!v62) {
    goto LABEL_105;
  }
  LODWORD(v25) = 1.0;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"Threshold", &v62, v25);
  a4[1].var12 = v26;
  if (!v62) {
    goto LABEL_105;
  }

  a4->var0 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 1, &v62);
  if (!v62) {
    goto LABEL_107;
  }
  LODWORD(v27) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"BlueVertMinSharpFactor", &v62, v27);
  a4->var19[2] = *(float *)&v28;
  if (!v62) {
    goto LABEL_107;
  }
  a4->var19[2] = *(float *)&v28 * 0.015625;
  LODWORD(v28) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"BlueVertFIRShift", &v62, v28);
  a4->var19[3] = v29;
  if (!v62) {
    goto LABEL_107;
  }
  long double v30 = 1.0 / exp2(v29);
  *(float *)&long double v30 = v30;
  a4->var19[3] = *(float *)&v30;
  LODWORD(v30) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"BlueHorizMinSharpFactor", &v62, (double)v30);
  a4->var21.var0 = *(float *)&v31;
  if (!v62) {
    goto LABEL_107;
  }
  a4->var21.var0 = *(float *)&v31 * 0.015625;
  LODWORD(v31) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"BlueHorizFIRShift", &v62, v31);
  a4->var21.var1 = v32;
  if (!v62) {
    goto LABEL_107;
  }
  long double v33 = 1.0 / exp2(v32);
  *(float *)&long double v33 = v33;
  a4->var21.var1 = *(float *)&v33;
  LODWORD(v33) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"RedVertMinSharpFactor", &v62, (double)v33);
  a4[1].var1.var23 = LODWORD(v34);
  if (!v62) {
    goto LABEL_107;
  }
  *(float *)&a4[1].var1.var23 = *(float *)&v34 * 0.015625;
  LODWORD(v34) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"RedVertFIRShift", &v62, v34);
  a4[1].var1.var24 = v35;
  if (!v62) {
    goto LABEL_107;
  }
  long double v36 = 1.0 / exp2(*(float *)&v35);
  *(float *)&long double v36 = v36;
  a4[1].var1.var24 = LODWORD(v36);
  LODWORD(v36) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"RedHorizMinSharpFactor", &v62, (double)v36);
  a4[1].var4 = *(float *)&v37;
  if (!v62) {
    goto LABEL_107;
  }
  a4[1].var4 = *(float *)&v37 * 0.015625;
  LODWORD(v37) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"RedHorizFIRShift", &v62, v37);
  a4[1].var5 = v38;
  if (!v62) {
    goto LABEL_107;
  }
  float v39 = 1.0 / exp2(v38);
  a4[1].var5 = v39;
  v40 = [v9 objectForKeyedSubscript:@"GNUMaxLUT"];
  int v14 = v40;
  if (!v40) {
    goto LABEL_105;
  }
  if ([v40 count] != 33)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    int v57 = 0;
LABEL_106:

LABEL_108:
    goto LABEL_109;
  }
  if (!objc_msgSend(v14, "cmi_copyFloatValuesToBuffer:startingIndex:count:", v63, 0, 33))
  {
LABEL_105:
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_106;
  }
  int v41 = -[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v5);
  uint64_t v42 = 0;
  float v43 = 0.0;
  float v44 = 0.0;
  do
  {
    float v45 = v63[v42] / (float)v41;
    float v43 = v43 + v45;
    float v44 = v44 + (float)(v45 * sqrtf((float)(int)v42++ / (float)((float)((float)v41 * 32.0) / 65535.0)));
  }
  while (v42 != 33);
  a4->var16[4] = (float)(v44 * -0.29335) + (float)(v43 * 0.23792);
  a4->var17 = (float)(v43 * -0.29335) + (float)(v44 * 0.41449);

  v46 = [v9 objectForKeyedSubscript:@"BlueVertFIR"];
  char v62 = objc_msgSend(v46, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4->var19[4], 0, 5);

  if (!v62) {
    goto LABEL_107;
  }
  v47 = [v9 objectForKeyedSubscript:@"BlueHorizFIR"];
  char v62 = objc_msgSend(v47, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4[1], 0, 7);

  if (!v62) {
    goto LABEL_107;
  }
  v48 = [v9 objectForKeyedSubscript:@"RedVertFIR"];
  char v62 = objc_msgSend(v48, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4[1].var2, 0, 5);

  if (!v62) {
    goto LABEL_107;
  }
  v49 = [v9 objectForKeyedSubscript:@"RedHorizFIR"];
  char v62 = objc_msgSend(v49, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4[1].var6, 0, 7);

  if (!v62) {
    goto LABEL_107;
  }
  v50 = [v9 objectForKeyedSubscript:@"SimDemCoeffBonGr"];
  char v62 = objc_msgSend(v50, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4->var6, 0, 4);

  if (!v62) {
    goto LABEL_107;
  }
  float32x4_t v59 = (float32x4_t)vdupq_n_s32(0x3C800000u);
  *(float32x4_t *)&a4->var6 = vmulq_f32(*(float32x4_t *)&a4->var6, v59);
  v51 = [v9 objectForKeyedSubscript:@"SimDemCoeffRonGb"];
  char v62 = objc_msgSend(v51, "cmi_copyFloatValuesToBuffer:startingIndex:count:", a4->var10, 0, 4);

  if (!v62) {
    goto LABEL_107;
  }
  *(float32x4_t *)a4->var10 = vmulq_f32(*(float32x4_t *)a4->var10, v59);
  v52 = [v9 objectForKeyedSubscript:@"SimDemCoeffGbonR"];
  char v62 = objc_msgSend(v52, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4->var10[4], 0, 4);

  if (!v62) {
    goto LABEL_107;
  }
  float32x4_t v60 = (float32x4_t)vdupq_n_s32(0x3C800000u);
  *(float32x4_t *)&a4->var10[4] = vmulq_f32(*(float32x4_t *)&a4->var10[4], v60);
  v53 = [v9 objectForKeyedSubscript:@"SimDemCoeffBonR"];
  char v62 = objc_msgSend(v53, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4->var13[1], 0, 4);

  if (!v62) {
    goto LABEL_107;
  }
  *(float32x4_t *)&a4->var13[1] = vmulq_f32(*(float32x4_t *)&a4->var13[1], v60);
  v54 = [v9 objectForKeyedSubscript:@"SimDemCoeffGronB"];
  char v62 = objc_msgSend(v54, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &a4->var13[5], 0, 4);

  if (!v62
    || (float32x4_t v61 = (float32x4_t)vdupq_n_s32(0x3C800000u),
        *(float32x4_t *)&a4->var13[5] = vmulq_f32(*(float32x4_t *)&a4->var13[5], v61),
        [v9 objectForKeyedSubscript:@"SimDemCoeffRonB"],
        v55 = objc_claimAutoreleasedReturnValue(),
        var16 = (float32x4_t *)a4->var16,
        char v62 = objc_msgSend(v55, "cmi_copyFloatValuesToBuffer:startingIndex:count:", var16, 0, 4),
        v55,
        !v62))
  {
LABEL_107:
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_108;
  }
  float32x4_t *var16 = vmulq_f32(*var16, v61);

  int v57 = 0;
LABEL_60:

  return v57;
}

- (int)generateHRDEnabledFromRegistersDict:(id)a3 hrdEnabled:(BOOL *)a4
{
  char v12 = 0;
  id v5 = [a3 objectForKeyedSubscript:@"BayerProcHRD"];
  id v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"Config"],
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = v7;
    char v9 = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", @"Bypass", 1, &v12);
    if (v12)
    {
      *a4 = v9 ^ 1;

      int v10 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v10 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }

  return v10;
}

- (int)generateHRDConfigForInputFrame:(id)a3 processingOptions:(id)a4 hrdConfig:(HRDConfig *)a5 overwriteSubGnuforFlare:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v146 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  char v143 = 0;
  char v12 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  double v13 = [(SoftISPConfig *)self staticParameters];
  int v14 = [v13 moduleConfigForInputFrameMetadata:v12];

  if ((-[SoftISPInputFrame frameID]((uint64_t)v10) & 0xFFFF0000) == 0x1900000
    || (-[SoftISPInputFrame frameID]((uint64_t)v10) & 0xFFFF0000) == 0x2370000
    || !v12
    || !v14)
  {
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    v72 = v14;
    v137 = 0;
    id obj = 0;
    id v70 = 0;
    v73 = 0;
    v74 = 0;
    id v42 = 0;
    v134 = 0;
    v71 = v11;
    float32x4_t v60 = 0;
  }
  else
  {
    v127 = self;
    double v15 = [(SoftISPConfig *)self staticParameters];
    double v16 = [v15 tuningParametersForInputFrameMetadata:v12 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v10)];

    if (!v16) {
      FigSignalErrorAt();
    }
    double v17 = [v16 objectForKeyedSubscript:@"HRD"];
    float v18 = v17;
    if (!v17)
    {
      FigSignalErrorAt();
      float v18 = (void *)MEMORY[0x263EFFA78];
    }
    id v19 = v18;

    LODWORD(v20) = 1.0;
    objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", @"firStrength", &v143, v20);
    float v22 = v21;
    if (!v143) {
      FigSignalErrorAt();
    }
    id v132 = v19;
    int v124 = objc_msgSend(v19, "cmi_unsignedIntValueForKey:defaultValue:found:", @"pfmSelect", 2, &v143);
    if (!v143) {
      FigSignalErrorAt();
    }
    v137 = v16;
    v23 = [v16 objectForKeyedSubscript:@"GNU"];
    double v24 = v23;
    if (!v23)
    {
      FigSignalErrorAt();
      double v24 = (void *)MEMORY[0x263EFFA78];
    }
    id v25 = v24;

    LODWORD(v26) = 1.0;
    objc_msgSend(v25, "cmi_floatValueForKey:defaultValue:found:", @"gnuStrength", &v143, v26);
    float v28 = *(float *)&v27;
    if (!v143) {
      FigSignalErrorAt();
    }
    LODWORD(v27) = 8.0;
    objc_msgSend(v25, "cmi_floatValueForKey:defaultValue:found:", @"gnuOffset", &v143, v27);
    float v30 = *(float *)&v29;
    if (!v143) {
      FigSignalErrorAt();
    }
    LODWORD(v29) = 1045220557;
    objc_msgSend(v25, "cmi_floatValueForKey:defaultValue:found:", @"gnuMaxLutK", &v143, v29);
    float v32 = v31;
    if (!v143) {
      FigSignalErrorAt();
    }
    int v126 = objc_msgSend(v25, "cmi_unsignedIntValueForKey:defaultValue:found:", @"ispVersion", 14, &v143);
    if (!v143) {
      FigSignalErrorAt();
    }
    unsigned int v33 = v30;
    id v34 = v25;
    long double v36 = v34;
    v133 = v12;
    uint64_t v136 = (uint64_t)v10;
    if (v6)
    {
      double v37 = v34;
      float v38 = [v137 objectForKeyedSubscript:@"FlareDetection"];

      if (v38)
      {
        float v39 = [v137 objectForKeyedSubscript:@"FlareDetection"];
        uint64_t v40 = [v39 objectForKeyedSubscript:@"flareSubGNU"];

        int v41 = (void *)v40;
        long double v36 = v37;
        v131 = (void *)v40;
        if (!v40)
        {
          FigSignalErrorAt();
          int v41 = v37;
        }
        id v42 = v41;
      }
      else
      {
        v131 = 0;
        long double v36 = v37;
        id v42 = v37;
      }
      unsigned int v33 = v30;
    }
    else
    {
      v131 = 0;
      id v42 = v34;
    }
    *(float *)&double v35 = v28;
    objc_msgSend(v42, "cmi_floatValueForKey:defaultValue:found:", @"subGnuStrength", 0, v35);
    float v118 = v43;
    float v44 = (float)v33;
    *(float *)&double v45 = (float)v33;
    objc_msgSend(v42, "cmi_floatValueForKey:defaultValue:found:", @"subGnuOffset", 0, v45);
    float v47 = v46;
    *(float *)&double v48 = v32;
    objc_msgSend(v42, "cmi_floatValueForKey:defaultValue:found:", @"subGnuMaxLutK", 0, v48);
    float v117 = v49;
    int v50 = objc_msgSend(v42, "cmi_BOOLValueForKey:defaultValue:found:", @"subGnuEnable", 0, 0);
    char v122 = objc_msgSend(v42, "cmi_BOOLValueForKey:defaultValue:found:", @"subGnuEdgeAware", 0, 0);
    LODWORD(v51) = 1.0;
    objc_msgSend(v42, "cmi_floatValueForKey:defaultValue:found:", @"subGnuEdgeTh", 0, v51);
    float v53 = v52;
    int v54 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SubGNU", 0, &v143);
    if (v143) {
      int v55 = 1;
    }
    else {
      int v55 = v6;
    }
    if (v55) {
      int v56 = v54 | v6;
    }
    else {
      int v56 = v50;
    }
    BOOL v135 = v56;
    id v57 = v11;
    char v120 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"GNU", 0, &v143);
    objc_msgSend(v36, "cmi_intValueForKey:defaultValue:found:", @"grGbGnuMode", 0, 0);
    int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
    objc_msgSend(v42, "cmi_intValueForKey:defaultValue:found:", @"subGnuMode", 0, 0);
    LODWORD(v58) = FigGetCFPreferenceNumberWithDefault();
    float32x4_t v59 = [v14 objectForKeyedSubscript:@"Sensor"];
    float32x4_t v60 = v59;
    v134 = v36;
    if (v59
      && ([v59 objectForKeyedSubscript:@"NoiseModels"],
          (float32x4_t v61 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unsigned int v116 = v33;
      v128 = v60;
      id v129 = v42;
      v130 = v57;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id obj = v61;
      uint64_t v62 = [obj countByEnumeratingWithState:&v139 objects:v144 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        unsigned int v115 = v47;
        uint64_t v64 = *(void *)v140;
LABEL_41:
        uint64_t v65 = 0;
        while (1)
        {
          if (*(void *)v140 != v64) {
            objc_enumerationMutation(obj);
          }
          v66 = *(void **)(*((void *)&v139 + 1) + 8 * v65);
          v67 = [v66 objectForKeyedSubscript:@"Mode"];
          char v68 = [v67 isEqualToString:@"NonBinning"];

          if (v68) {
            break;
          }
          if (v63 == ++v65)
          {
            uint64_t v63 = [obj countByEnumeratingWithState:&v139 objects:v144 count:16];
            if (v63) {
              goto LABEL_41;
            }
            goto LABEL_47;
          }
        }
        id v70 = v66;

        if (!v70) {
          goto LABEL_48;
        }
        id v10 = (id)v136;
        a5->var0 = -[SoftISPInputFrame firstPixel](v136);
        a5->var1.var4 = v120;
        a5->var1.var5 = v135;
        a5->var1.var24 = CFPreferenceNumberWithDefault;
        a5->var2.var0 = v58;
        v75 = [(SoftISPConfig *)v127 staticParameters];
        a5->var1.var6 = -[SoftISPStaticParameters gnuLSCCompensation]((BOOL)v75);

        a5->var1.var7 = v122;
        *(_DWORD *)&a5->var1.var8 = 16842752;
        a5->var1.var12 = 0;
        a5->var1.var13 = v124 == 0;
        a5->var1.var22 = v124 == 0;
        a5->var1.var14 = 0;
        a5->var1.var17 = 0;
        a5->var1.var15 = v124 != 0;
        a5->var1.var18 = v124 != 0;
        a5->var1.var16 = v124 == 0;
        a5->var1.var19 = v124 == 0;
        a5->var1.var20 = 0;
        *(&a5->var1.var22 + 1) = 0;
        a5->var1.var21 = v124 != 0;
        LOBYTE(a5->var1.var23) = v124 != 0;
        *(_WORD *)((char *)&a5->var1.var23 + 1) = 257;
        __asm { FMOV            V0.4S, #0.25 }
        *(_OWORD *)&a5->var2.var1 = _Q0;
        *(_OWORD *)&a5->var6 = xmmword_263481630;
        *(_OWORD *)a5->var10 = xmmword_263481630;
        *(_OWORD *)&a5->var10[4] = xmmword_263481630;
        *(_OWORD *)&a5->var13[1] = _Q0;
        *(_OWORD *)&a5->var13[5] = xmmword_263481630;
        *(_OWORD *)a5->var16 = _Q0;
        float v80 = 0.0;
        if (!_ZF) {
          float v80 = 0.125;
        }
        a5->var19[2] = v80;
        *(float *)&a5[1].var1.var23 = v80;
        a5->var21.var0 = v80;
        a5[1].var4 = v80;
        *(void *)&a5[1].var11 = 0;
        *(void *)&a5[1].var10[3] = 0;
        char v12 = v133;
        objc_msgSend(v133, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F408], &v143, 0.0);
        v72 = v14;
        v71 = v130;
        id v42 = v129;
        if (v143)
        {
          float v125 = v81 * 0.000015259;
          float32x4_t v60 = v128;
          if ((float)(v81 * 0.000015259) <= 0.0) {
            goto LABEL_102;
          }
          objc_msgSend(v133, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F608], &v143, 0.0);
          if (!v143) {
            goto LABEL_102;
          }
          float v123 = v82 * 0.000015259;
          if ((float)(v82 * 0.000015259) <= 0.0) {
            goto LABEL_102;
          }
          objc_msgSend(v133, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F610], &v143, 0.0);
          if (!v143
            || (float v121 = *(float *)&v83 * 0.000015259, (float)(*(float *)&v83 * 0.000015259) <= 0.0)
            || (LODWORD(v83) = 1132462080,
                objc_msgSend(v133, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v143, v83),
                !v143)
            || (float v85 = *(float *)&v84 * 0.0039062, (float)(*(float *)&v84 * 0.0039062) <= 0.0)
            || (LODWORD(v84) = 1132462080,
                objc_msgSend(v133, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v143, v84),
                !v143)
            || (float v87 = v86 * 0.0039062, (float)(v86 * 0.0039062) <= 0.0))
          {
LABEL_102:
            FigDebugAssert3();
            int v69 = FigSignalErrorAt();
            goto LABEL_97;
          }
          float v88 = (float)(int)-[SoftISPInputFrame sensorHeadRoom](v136);
          float v114 = v88 / (float)(int)-[SoftISPInputFrame pipelineHeadRoom](v136);
          genGNUMaxLUT(v126, (uint64_t)v145, v125, v123, v121, v85, v87, v114, v28, v44, v32);
          int v89 = -[SoftISPInputFrame pipelineHeadRoom](v136);
          uint64_t v90 = 0;
          float v91 = 0.0;
          float v92 = 0.0;
          do
          {
            float v93 = v145[v90] / (float)v89;
            float v91 = v91 + v93;
            float v92 = v92 + (float)(v93 * sqrtf((float)(int)v90++ / (float)((float)((float)v89 * 32.0) / 65535.0)));
          }
          while (v90 != 33);
          float v94 = (float)(v91 * -0.29335) + (float)(v92 * 0.41449);
          float v95 = (float)(v92 * -0.29335) + (float)(v91 * 0.23792);
          a5->var16[4] = v95;
          a5->var17 = v94;
          _ZF = v28 == v118 && v116 == v115;
          char v97 = _ZF;
          if (v32 != v117) {
            char v97 = 0;
          }
          if (v135 && (v97 & 1) == 0)
          {
            genGNUMaxLUT(v126, (uint64_t)v145, v125, v123, v121, v85, v87, v114, v118, (float)v115, v117);
            int v98 = -[SoftISPInputFrame pipelineHeadRoom](v136);
            uint64_t v99 = 0;
            float v100 = 0.0;
            float v101 = 0.0;
            do
            {
              float v102 = v145[v99] / (float)v98;
              float v100 = v100 + v102;
              float v101 = v101 + (float)(v102 * sqrtf((float)(int)v99++ / (float)((float)((float)v98 * 32.0) / 65535.0)));
            }
            while (v99 != 33);
            float v94 = (float)(v100 * -0.29335) + (float)(v101 * 0.41449);
            float v95 = (float)(v101 * -0.29335) + (float)(v100 * 0.23792);
          }
          a5->var18 = v95;
          a5->var19[0] = v94;
          a5->var19[1] = v53;
          if (objc_msgSend(v130, "cmi_BOOLValueForKey:defaultValue:found:", @"RedBlue", 1, 0))
          {
            if (v22 <= 0.0)
            {
              float v104 = 0.0;
            }
            else if (v22 >= 2.0)
            {
              float v104 = 1.5;
            }
            else
            {
              if (v22 > 1.0 && v22 > 2.0) {
                float v103 = 2.0;
              }
              else {
                float v103 = 1.0;
              }
              float v104 = 0.0;
              if (v22 > 1.0 && v22 > 2.0) {
                float v105 = 1.0;
              }
              else {
                float v105 = 0.0;
              }
              if (v105 >= v103)
              {
                FigDebugAssert3();
              }
              else
              {
                uint64_t v106 = 4;
                if (v22 > 1.0 && v22 > 2.0) {
                  uint64_t v106 = 8;
                }
                float v104 = *(float *)((char *)&unk_2634816CC + v106 - 4)
                     + (float)((float)(v22 - v105)
                             * (float)(*(float *)((char *)&unk_2634816CC + v106)
                                     - *(float *)((char *)&unk_2634816CC + v106 - 4)));
              }
            }
            int v107 = genVertFir((uint64_t)&a5->var19[4], &a5->var19[3], v104);
            if (v107)
            {
              int v69 = v107;
            }
            else
            {
              int v108 = genHorizFirH14((uint64_t)&a5[1], &a5->var21.var1, v104);
              if (v108)
              {
                int v69 = v108;
              }
              else
              {
                double v109 = interpExtrap(3uLL, (uint64_t)&unk_2634816C0, (uint64_t)&unk_2634816D8, v22);
                float v110 = *(float *)&v109;
                int v111 = genVertFir((uint64_t)&a5[1].var2, (float *)&a5[1].var1.var24, *(float *)&v109);
                if (v111)
                {
                  int v69 = v111;
                }
                else
                {
                  int v112 = genHorizFirH14((uint64_t)&a5[1].var6, &a5[1].var5, v110);
                  if (!v112)
                  {
                    int v69 = [(H13FastBayerProcConfig *)v127 checkSymmetricalFiltersForConfig:a5];
                    if (v69) {
                      goto LABEL_110;
                    }
LABEL_97:
                    v74 = v131;
                    v73 = v132;
                    goto LABEL_98;
                  }
                  int v69 = v112;
                }
              }
            }
LABEL_110:
            FigDebugAssert3();
            goto LABEL_97;
          }
          int v69 = 0;
          *(void *)&a5[1].var2.var2 = 0;
          *(void *)&a5->var19[6] = 0;
          *(void *)&a5->var19[4] = 0;
          a5->var20.var1 = 0.0;
          a5->var19[3] = 0.0;
          *(void *)&a5[1].var1.var4 = 0;
          *(void *)&a5[1].var1.var12 = 0;
          *(void *)&a5[1].var0 = 0;
          *(_DWORD *)&a5[1].var1.var20 = 0;
          a5->var21.var1 = 0.0;
          *(void *)&a5[1].var2.var0 = 0;
          a5[1].var3 = 0.0;
          a5[1].var1.var24 = 0;
          *(void *)&a5[1].var8 = 0;
          *(void *)a5[1].var10 = 0;
          *(void *)&a5[1].var6 = 0;
          a5[1].var10[2] = 0.0;
          a5[1].var5 = 0.0;
          goto LABEL_97;
        }
        FigDebugAssert3();
        int v69 = FigSignalErrorAt();
        v74 = v131;
        v73 = v132;
        float32x4_t v60 = v128;
      }
      else
      {
LABEL_47:

LABEL_48:
        FigDebugAssert3();
        int v69 = FigSignalErrorAt();
        id v70 = 0;
        id v10 = (id)v136;
        v72 = v14;
        v71 = v130;
        v73 = v132;
        char v12 = v133;
        v74 = v131;
        float32x4_t v60 = v128;
        id v42 = v129;
      }
    }
    else
    {
      FigDebugAssert3();
      int v69 = FigSignalErrorAt();
      id obj = 0;
      id v70 = 0;
      v74 = v131;
      v73 = v132;
      v72 = v14;
      v71 = v57;
      char v12 = v133;
    }
  }
LABEL_98:

  return v69;
}

- (int)checkSymmetricalFiltersForConfig:(HRDConfig *)a3
{
  uint64_t v3 = 0;
  v4 = &a3[1].var10[2];
  id v5 = a3 + 1;
  while (*(float *)((char *)&v5->var6 + v3) == *v4 && *(float *)((char *)&v5->var0 + v3) == *(v4 - 16))
  {
    v3 += 4;
    --v4;
    if (v3 == 12)
    {
      uint64_t v6 = 0;
      for (char i = 1; ; char i = 0)
      {
        char v8 = i;
        if (*(&a3[1].var2.var0 + v6) != *(&a3[1].var2.var0 + 4 - v6) || a3->var19[v6 + 4] != a3->var19[4 - v6 + 4]) {
          break;
        }
        uint64_t v6 = 1;
        if ((v8 & 1) == 0) {
          return 0;
        }
      }
      return FigSignalErrorAt();
    }
  }
  return FigSignalErrorAt();
}

- (int)generateHRDEnabledForInputFrame:(id)a3 hrdEnabled:(BOOL *)a4
{
  id v5 = -[SoftISPInputFrame processingOptions]((uint64_t)a3);
  char v6 = objc_msgSend(v5, "cmi_BOOLValueForKey:defaultValue:found:", @"AllowUnclampedOutputs", 0, 0);

  *a4 = v6 ^ 1;
  return 0;
}

- (int)getSSCConfigForInputFrame:(id)a3 processingOptions:(id)a4 sscConfig:(SSCConfig *)a5
{
  id v7 = a3;
  char v8 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  char v9 = [(SoftISPConfig *)self staticParameters];
  uint64_t v10 = -[SoftISPInputFrame tuningType]((uint64_t)v7);

  id v11 = [v9 tuningParametersForInputFrameMetadata:v8 tuningType:v10];

  char v12 = [v11 objectForKeyedSubscript:@"SSC"];
  double v13 = v12;
  a5->var0 = 0;
  if (v12)
  {
    a5->var1 = objc_msgSend(v12, "cmi_intValueForKey:defaultValue:found:", @"MaxNumberOfFaces", 1, 0);
    objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"ExtraFaceROIPercentage", 0, 0.0);
  }
  else
  {
    a5->var1 = 1;
    float v14 = 0.0;
  }
  a5->var2 = v14;

  return 0;
}

- (int)getRNFConfigForInputFrame:(id)a3 bounds:(id)a4 processingOptions:(id)a5 rnfConfig:(RNFConfig *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  bzero(v19, 0x370uLL);
  if (!v10 || !v11 || !a6) {
    goto LABEL_25;
  }
  *(_DWORD *)&a6[1].var6[1][0] = 1065353216;
  if (![(SoftISPConfig *)self stageConfigMode])
  {
    FigDebugAssert3();
LABEL_25:
    int RNFConfigFromInputFrameMetadata = FigSignalErrorAt();
    goto LABEL_20;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 3
    && [(SoftISPConfig *)self stageConfigMode] != 4)
  {
    double v16 = [(SoftISPConfig *)self staticParameters];
    int RNFConfigFromInputFrameMetadata = generateRNFConfigFromInputFrameMetadata(v10, v11, v12, (uint64_t)a6, v16);

    if (!RNFConfigFromInputFrameMetadata)
    {
      if (!a6->var0 || [(SoftISPConfig *)self stageConfigMode] != 2) {
        goto LABEL_19;
      }
      int RNFConfigFromRegisters = generateRNFConfigFromRegisters(v10, v11, v19);
      if (RNFConfigFromRegisters)
      {
        int RNFConfigFromInputFrameMetadata = RNFConfigFromRegisters;
      }
      else
      {
        int RNFConfigFromInputFrameMetadata = verifyConfig_0(v19, (float32x2_t *)a6);
        if (!RNFConfigFromInputFrameMetadata) {
          goto LABEL_20;
        }
      }
    }
LABEL_30:
    FigDebugAssert3();
    goto LABEL_20;
  }
  int v13 = generateRNFConfigFromRegisters(v10, v11, (float32x2_t *)a6);
  if (v13)
  {
    int RNFConfigFromInputFrameMetadata = v13;
    goto LABEL_30;
  }
  if (!a6->var0 || [(SoftISPConfig *)self stageConfigMode] != 4)
  {
LABEL_19:
    int RNFConfigFromInputFrameMetadata = 0;
    goto LABEL_20;
  }
  float v14 = [(SoftISPConfig *)self staticParameters];
  int RNFConfigFromInputFrameMetadata = generateRNFConfigFromInputFrameMetadata(v10, v11, v12, (uint64_t)v19, v14);

  if (RNFConfigFromInputFrameMetadata) {
    goto LABEL_30;
  }
  int RNFConfigFromInputFrameMetadata = verifyConfig_0((float32x2_t *)a6, v19);
  if (RNFConfigFromInputFrameMetadata) {
    goto LABEL_30;
  }
LABEL_20:

  return RNFConfigFromInputFrameMetadata;
}

- (int)getFlareDetectionConfigForInputFrame:(id)a3 flareDetectionConfig:(FlareDetectionConfig *)a4 flareCorrectionConfig:(FlareCorrectionConfig *)a5 bounds:(id)a6 hoclBinConfig:(HOCLBinConfig *)a7 outputMetadata:(id)a8
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  char v104 = 0;
  if (!v13)
  {
    int v27 = FigSignalErrorAt();
    a4 = 0;
LABEL_57:
    float v18 = 0;
    goto LABEL_54;
  }
  if (!a4)
  {
    int v27 = FigSignalErrorAt();
    goto LABEL_57;
  }
  float v103 = a4;
  float v100 = self;
  double v16 = [(SoftISPConfig *)self staticParameters];
  double v17 = -[SoftISPInputFrame metadata]((uint64_t)v13);
  float v18 = [v16 tuningParametersForInputFrameMetadata:v17 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v13)];

  if (!v18) {
    FigSignalErrorAt();
  }
  uint64_t v19 = [v18 objectForKeyedSubscript:@"FlareDetection"];
  double v20 = (void *)v19;
  float v21 = (void *)MEMORY[0x263EFFA78];
  if (v19) {
    float v21 = (void *)v19;
  }
  a4 = v21;

  int v22 = [(FlareDetectionConfig *)a4 cmi_BOOLValueForKey:@"enabled" defaultValue:0 found:&v104];
  if (!v22)
  {
    int v27 = 0;
    goto LABEL_54;
  }
  char v95 = v22;
  id v97 = v15;
  LODWORD(v23) = 1000341504;
  [(FlareDetectionConfig *)a4 cmi_floatValueForKey:@"excludeDarkPixelThd" defaultValue:&v104 found:v23];
  float v25 = v24;
  if (!v104 && dword_26B430E70)
  {
    double v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v96 = v18;
  unsigned __int16 v28 = [(FlareDetectionConfig *)a4 cmi_unsignedIntValueForKey:@"blockSize", 128, &v104, v79, v85 defaultValue found];
  double v29 = v103;
  if (!v104 && dword_26B430E70)
  {
    float v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v28 - 129 <= 0xFFFFFF9E)
  {
    int v27 = FigSignalErrorAt();
    float v18 = v96;
    id v15 = v97;
    goto LABEL_54;
  }
  signed int v94 = v28;
  float v91 = a5;
  unsigned int v31 = [(FlareDetectionConfig *)a4 cmi_unsignedIntValueForKey:@"excludeSensorBorderCol" defaultValue:0 found:&v104];
  if (!v104 && dword_26B430E70)
  {
    float v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  unsigned int v93 = [(FlareDetectionConfig *)a4 cmi_unsignedIntValueForKey:@"excludeSensorBorderRow", 256, &v104, v80, v86 defaultValue found];
  if (!v104 && dword_26B430E70)
  {
    id v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  unsigned int v101 = v31;
  LODWORD(v33) = 1066192077;
  [(FlareDetectionConfig *)a4 cmi_floatValueForKey:@"flareValueThd", &v104, v33, v81, v87 defaultValue found];
  float v36 = v35;
  if (!v104 && dword_26B430E70)
  {
    double v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  LODWORD(v38) = [(FlareDetectionConfig *)a4 cmi_unsignedIntValueForKey:@"flareCountThd", 5, &v104, v82, v88 defaultValue found];
  if (!v104 && dword_26B430E70)
  {
    float v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int32x2_t v102 = (int32x2_t)__PAIR64__(v93, v101);
  char v40 = [(FlareDetectionConfig *)a4 cmi_BOOLValueForKey:@"withoutChannelImbalanceCorrection", 1, &v104, v83, v89 defaultValue found];
  if (!v104 && dword_26B430E70)
  {
    int v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double v29 = v103;
  }
  v29->unsigned __int16 var0 = -[SoftISPInputFrame firstPixel]((uint64_t)v13);
  unsigned __int16 var0 = a7->var0;
  float v92 = a4;
  if (a7->var0) {
    unsigned __int16 var0 = a7->var2;
  }
  v29->var1 = var0;
  *(_WORD *)&v29->var7 = v28;
  *(float *)&v29[1].unsigned __int16 var0 = v36 / 100.0;
  v29[1].var2 = v38;
  BYTE1(v29[1].var3) = v40;
  LOBYTE(v29[1].var3) = v95;
  float v43 = (int16x4_t *)v29;
  unsigned int v44 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
  unint64_t v45 = (unint64_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14) >> 32;
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
  unsigned int v47 = v46;
  id v99 = v14;
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
  unint64_t v49 = HIDWORD(v48);
  int v50 = [(SoftISPConfig *)v100 staticParameters];
  double v51 = -[SoftISPInputFrame metadata]((uint64_t)v13);
  unint64_t v52 = [v50 dimensionsForSensorInMetadata:v51];
  int v53 = v52;
  uint64_t v54 = (uint64_t)v13;
  unint64_t v55 = HIDWORD(v52);

  unsigned int v56 = v55 - (v49 + v45);
  id v13 = (id)v54;
  if (v56 <= v45) {
    unsigned int v56 = v45;
  }
  unsigned int v57 = v53 - (v47 + v44);
  if (v57 <= v44) {
    unsigned int v57 = v44;
  }
  int32x2_t v58 = vadd_s32((int32x2_t)vmvn_s8((int8x8_t)__PAIR64__(v56, v57)), vadd_s32(vdup_n_s32(v94), v102));
  v58.i32[0] /= v94;
  v58.i32[1] /= v94;
  int32x2_t v59 = vmax_s32(v58, 0);
  int v60 = v59.i32[1];
  v61.i64[0] = v59.u32[0];
  v61.i64[1] = v59.u32[1];
  int32x4_t v62 = v61;
  int v63 = v59.i32[0];
  if (v59.i32[0] <= 1u) {
    int v64 = 1;
  }
  else {
    int v64 = v59.i32[0];
  }
  if (v47 % v94) {
    int v63 = v64;
  }
  if (v59.i32[1] <= 1u) {
    int v65 = 1;
  }
  else {
    int v65 = v59.i32[1];
  }
  if (v49 % v94) {
    int v60 = v65;
  }
  v62.i32[1] = v63;
  v62.i32[3] = v60;
  v43[2] = vmovn_s32(v62);
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  int v107 = 0;
  v66 = (void *)MEMORY[0x263F2EDA0];
  v67 = -[SoftISPInputFrame metadata](v54);
  [v66 calculateBasicNoiseModel:v67];

  if (v105)
  {
    int v27 = -73726;
    FigDebugAssert3();
    id v15 = v97;
    id v14 = v99;
    float v18 = v96;
    a4 = v92;
    goto LABEL_54;
  }
  char v68 = -[SoftISPInputFrame metadata](v54);
  objc_msgSend(v68, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v104, 0.0);
  float v70 = v69;

  id v15 = v97;
  id v14 = v99;
  float v18 = v96;
  a4 = v92;
  if (!v104)
  {
    int v27 = -73726;
LABEL_62:
    FigDebugAssert3();
    goto LABEL_54;
  }
  v71 = -[SoftISPInputFrame metadata]((uint64_t)v13);
  objc_msgSend(v71, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v104, 0.0);
  float v73 = v72;

  if (!v104)
  {
    int v27 = -73726;
    goto LABEL_62;
  }
  float v74 = (float)(v70 * 0.0039062) * (float)(v73 * 0.0039062);
  float v75 = (*(float *)&v106 + *((float *)&v105 + 1) * 1023.0) / v74;
  float v76 = sqrtf(v75);
  if (v76 == 0.0) {
    float v77 = 0.0;
  }
  else {
    float v77 = 1.0 / v76;
  }
  v103->var2 = v77;
  v103->var3 = v25 * v74;
  int v27 = -[H13FastBayerProcConfig getFlareCorrectionConfigForInputFrame:flareCorrectionConfig:](v100, "getFlareCorrectionConfigForInputFrame:flareCorrectionConfig:", v13, v91, v84, v90);
  if (v27) {
    goto LABEL_62;
  }
LABEL_54:

  return v27;
}

- (int)updateHOCLBinConfigForFlare:(id)a3 hoclBinConfig:(HOCLBinConfig *)a4
{
  id v6 = a3;
  id v7 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  uint64_t var2 = a4->var2;
  char v9 = [(SoftISPConfig *)self staticParameters];
  uint64_t v10 = -[SoftISPInputFrame tuningType]((uint64_t)v6);

  id v11 = [v9 tuningParametersForInputFrameMetadata:v7 tuningType:v10];

  if (!v11) {
    FigSignalErrorAt();
  }
  id v12 = [v11 objectForKeyedSubscript:@"FlareDetection"];
  if (!v11) {
    FigSignalErrorAt();
  }
  char v18 = 0;
  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"flareHOCLBin"];
    id v14 = v13;
    if (!v13)
    {
      FigSignalErrorAt();
      id v14 = (void *)MEMORY[0x263EFFA78];
    }
    id v15 = v14;

    unsigned __int16 v16 = objc_msgSend(v15, "cmi_unsignedIntValueForKey:defaultValue:found:", @"mode", var2, &v18);
    if (v18 || (FigSignalErrorAt(), v18))
    {
      a4->uint64_t var2 = v16;
      a4->unsigned __int16 var0 = v16 != 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return 0;
}

- (int)getFlareCorrectionConfigForInputFrame:(id)a3 flareCorrectionConfig:(FlareCorrectionConfig *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    char v8 = -[SoftISPInputFrame processingOptions]((uint64_t)v6);
    int v9 = [(H13FastBayerProcConfig *)self getHRDConfigForInputFrame:v7 processingOptions:v8 hrdConfig:a4 overwriteSubGnuforFlare:1];

    if (v9
      || ([(SoftISPConfig *)self staticParameters],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = (char *)&a4[1].var0.var13[1],
          int v9 = [(H13FastBayerProcConfig *)self getHOCLBinConfigForInputFrame:v7 staticParameters:v10 hoclBinConfig:v11], v10, v9)|| (int v9 = [(H13FastBayerProcConfig *)self updateHOCLBinConfigForFlare:v7 hoclBinConfig:v11]) != 0)
    {
      FigDebugAssert3();
    }
  }
  else
  {
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)determineGOCConfigFromRegistersForInputFrame:(H13FastBayerProcConfig *)self lscConfig:(SEL)a2 hrEnabled:(id)a3 gocConfig:(LSCConfig *)a4
{
  id v6 = v5;
  char v7 = v4;
  id v9 = a3;
  uint64_t v10 = v9;
  char v34 = 0;
  if (!v9
    || !a4
    || !v6
    || (-[SoftISPInputFrame registers]((uint64_t)v9), (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_18;
  }
  id v12 = v11;
  id v13 = [v11 objectForKeyedSubscript:@"BayerProcWBG"];
  if (!v13)
  {
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
LABEL_24:

    goto LABEL_18;
  }
  id v14 = v13;
  v6->i32[1] = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 1, &v34);
  if (!v34) {
    goto LABEL_21;
  }
  objc_msgSend(v14, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Offset1", &v34, 0.0);
  v6[1] = vcvtq_f32_s32(v15);
  if (!v34) {
    goto LABEL_21;
  }
  objc_msgSend(v14, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Offset2", &v34, 0.0);
  v6[2] = vcvtq_f32_s32(v16);
  if (!v34
    || (objc_msgSend(v14, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Min", &v34, 0.0),
        v6[3] = vcvtq_f32_s32(v17),
        !v34)
    || (objc_msgSend(v14, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Max", &v34, 0.0),
        v6[4] = vcvtq_f32_s32(v18),
        !v34)
    || (v6[6].i8[0] = 0,
        [v14 objectForKeyedSubscript:@"Gain"],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_21:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
LABEL_23:

    goto LABEL_24;
  }
  double v20 = v19;
  objc_msgSend(v19, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Gain", &v34, 0.0);
  if (!v34
    || (int32x4_t v33 = v21, objc_msgSend(v20, "cmi_simdInt4ValueForKey:defaultValue:found:", @"GainShift", &v34, 0.0), !v34))
  {
LABEL_22:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();

    goto LABEL_23;
  }
  v23.i64[0] = 0xC0000000CLL;
  v23.i64[1] = 0xC0000000CLL;
  uint32x4_t v24 = (uint32x4_t)vsubq_s32(v23, v22);
  v23.i64[0] = 0x100000001;
  v23.i64[1] = 0x100000001;
  float32x4_t v25 = vdivq_f32(vcvtq_f32_s32(v33), vcvtq_f32_s32((int32x4_t)vshlq_u32((uint32x4_t)v23, v24)));
  v6[5] = v25;
  if ((v7 & 1) == 0)
  {
    float v26 = vminvq_f32(v25);
    if (v26 != 0.0)
    {
      v6[5] = vmulq_n_f32(v25, 1.0 / (float)(v26 * *((float *)a4 + 4)));
      goto LABEL_17;
    }
    goto LABEL_22;
  }
LABEL_17:
  *(float *)v27.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v10);
  v6[1] = vdivq_f32(v6[1], (float32x4_t)vdupq_lane_s32(v27, 0));
  *(float *)v28.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v10);
  v6[2] = vdivq_f32(v6[2], (float32x4_t)vdupq_lane_s32(v28, 0));
  *(float *)v29.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v10);
  v6[3] = vdivq_f32(v6[3], (float32x4_t)vdupq_lane_s32(v29, 0));
  *(float *)v30.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v10);
  v6[4] = vdivq_f32(v6[4], (float32x4_t)vdupq_lane_s32(v30, 0));

  int v31 = 0;
LABEL_18:

  return v31;
}

- (int)determineGOCConfigForInputFrame:(id)a3 lscConfig:(LSCConfig *)a4 hrEnabled:awbComputedGains:processingOptions:gocConfig:
{
  uint64_t v8 = v6;
  id v9 = v5;
  uint32x4_t v31 = v7;
  int v10 = v4;
  id v12 = a3;
  id v13 = v9;
  id v14 = -[SoftISPInputFrame metadata]((uint64_t)v12);
  char v15 = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"AllowUnclampedOutputs", 0, 0);
  int v16 = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0);

  if (!v12 || !a4) {
    goto LABEL_14;
  }
  __int32 v17 = v31.i32[2];
  if (v31.i32[2] <= (unsigned __int32)v31.i32[0]) {
    __int32 v17 = v31.i32[0];
  }
  if (!(v17 | v31.i32[1])) {
    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_14;
  }
  if (!v14) {
    goto LABEL_14;
  }
  int v18 = -[SoftISPInputFrame firstPixel]((uint64_t)v12);
  *(_DWORD *)(v8 + 4) = v18;
  if (v18 == -1) {
    goto LABEL_14;
  }
  *(_OWORD *)(v8 + 16) = 0u;
  *(_OWORD *)(v8 + 32) = 0u;
  float v19 = -(float)(int)-[SoftISPInputFrame pipelineFootRoom]((uint64_t)v12);
  *(float *)v20.i32 = v19 / (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v12);
  __asm { FMOV            V1.4S, #1.0 }
  *(int32x4_t *)(v8 + 48) = vdupq_lane_s32(v20, 0);
  *(_OWORD *)(v8 + 64) = _Q1;
  *(unsigned char *)(v8 + 96) = v15;
  int32x4_t v26 = (int32x4_t)vmulq_f32(vcvtq_f32_u32(v31), (float32x4_t)vdupq_n_s32(0x39800000u));
  float32x4_t v27 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v26, (int8x16_t)v26, 4uLL), v26);
  *(float32x4_t *)(v8 + 80) = v27;
  if (((v10 | v16) & 1) == 0)
  {
    float v29 = vminvq_f32(v27);
    if (v29 != 0.0)
    {
      int v28 = 0;
      *(float32x4_t *)(v8 + 80) = vmulq_n_f32(v27, 1.0 / (float)(v29 * *((float *)a4 + 4)));
      goto LABEL_13;
    }
LABEL_14:
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    goto LABEL_13;
  }
  int v28 = 0;
LABEL_13:

  return v28;
}

- (int)getGOCConfigForInputFrame:(id)a3 gocConfig:(GOCConfig *)a4 lscConfig:(LSCConfig *)a5 hrEnabled:awbComputedGains:processingOptions:
{
  uint64_t v8 = v6;
  long long v20 = v7;
  uint64_t v9 = v5;
  id v13 = a3;
  id v14 = v8;
  memset(v21, 0, sizeof(v21));
  if (!v13 || !a4 || !a5) {
    goto LABEL_22;
  }
  int v15 = DWORD2(v20);
  if (DWORD2(v20) <= v20) {
    int v15 = v20;
  }
  if (!(v15 | DWORD1(v20)))
  {
    FigDebugAssert3();
LABEL_22:
    int v17 = FigSignalErrorAt();
    goto LABEL_18;
  }
  *(_OWORD *)&a4[6].uint64_t var2 = 0u;
  *(_OWORD *)&a4[8].unsigned __int16 var0 = 0u;
  *(_OWORD *)&a4[4].unsigned __int16 var0 = 0u;
  *(_OWORD *)&a4[5].var1 = 0u;
  *(_OWORD *)&a4[1].var1 = 0u;
  *(_OWORD *)&a4[2].uint64_t var2 = 0u;
  *(_OWORD *)&a4->unsigned __int16 var0 = 0u;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int v16 = [(H13FastBayerProcConfig *)self determineGOCConfigFromRegistersForInputFrame:v13 lscConfig:a5 hrEnabled:v9 gocConfig:a4];
    if (!v16)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        int v17 = [(H13FastBayerProcConfig *)self determineGOCConfigForInputFrame:v13 lscConfig:a5 hrEnabled:v9 awbComputedGains:v14 processingOptions:v21 gocConfig:*(double *)&v20];
        if (v17) {
          goto LABEL_25;
        }
        goto LABEL_16;
      }
LABEL_17:
      int v17 = 0;
      goto LABEL_18;
    }
    int v17 = v16;
    goto LABEL_25;
  }
  int v18 = [(H13FastBayerProcConfig *)self determineGOCConfigForInputFrame:v13 lscConfig:a5 hrEnabled:v9 awbComputedGains:v14 processingOptions:a4 gocConfig:*(double *)&v20];
  if (v18)
  {
    int v17 = v18;
    goto LABEL_25;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 2) {
    goto LABEL_17;
  }
  int v17 = [(H13FastBayerProcConfig *)self determineGOCConfigFromRegistersForInputFrame:v13 lscConfig:a5 hrEnabled:v9 gocConfig:v21];
  if (v17)
  {
LABEL_25:
    FigDebugAssert3();
    goto LABEL_18;
  }
LABEL_16:
  compareGOCConfig((uint64_t)a4, v21);
LABEL_18:

  return v17;
}

- (int)determineHREnabledFromRegisters:(id)a3 hrEnabled:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  char v14 = 0;
  if (!v5 || !a4) {
    goto LABEL_10;
  }
  long long v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  if (!v7)
  {
    FigDebugAssert3();
LABEL_10:
    int v12 = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"Config"];
  if (!v9)
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_7;
  }
  int v10 = v9;
  char v11 = objc_msgSend(v9, "cmi_BOOLValueForKey:defaultValue:found:", @"Bypass", 1, &v14);
  if (!v14)
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();

    goto LABEL_13;
  }
  *a4 = v11 ^ 1;

  int v12 = 0;
LABEL_7:

  return v12;
}

- (int)determineHREnabledForProcessingOptions:(id)a3 hrEnabled:(BOOL *)a4
{
  if (a4)
  {
    *a4 = objc_msgSend(a3, "cmi_BOOLValueForKey:defaultValue:found:", @"HR", 0, 0);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)getHREnabledForInputFrame:(id)a3 processingOptions:(id)a4 hrEnabled:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v16 = 0;
  if (!v8 || !a5) {
    goto LABEL_23;
  }
  *a5 = 0;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int v10 = -[SoftISPInputFrame registers]((uint64_t)v8);
    int v11 = [(H13FastBayerProcConfig *)self determineHREnabledFromRegisters:v10 hrEnabled:a5];

    if (v11) {
      goto LABEL_21;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 4)
    {
      int v12 = [(H13FastBayerProcConfig *)self determineHREnabledForProcessingOptions:v9 hrEnabled:&v16];
      if (!v12)
      {
        if (*a5 != v16) {
          goto LABEL_22;
        }
        goto LABEL_14;
      }
      int v11 = v12;
LABEL_21:
      FigDebugAssert3();
      goto LABEL_15;
    }
  }
  else
  {
    int v13 = [(H13FastBayerProcConfig *)self determineHREnabledForProcessingOptions:v9 hrEnabled:a5];
    if (v13)
    {
      int v11 = v13;
      goto LABEL_21;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 2)
    {
      char v14 = -[SoftISPInputFrame registers]((uint64_t)v8);
      int v11 = [(H13FastBayerProcConfig *)self determineHREnabledFromRegisters:v14 hrEnabled:&v16];

      if (!v11)
      {
        if (*a5 != v16)
        {
LABEL_22:
          FigDebugAssert3();
LABEL_23:
          int v11 = FigSignalErrorAt();
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
LABEL_14:
  int v11 = 0;
LABEL_15:

  return v11;
}

- (int)determineSoftClipLUTFromRegisters:(id)a3 softClipLUT:(float *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    id v8 = 0;
LABEL_11:
    int v10 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    id v8 = 0;
    int v10 = 0;
LABEL_13:
    int v11 = FigSignalErrorAt();
    goto LABEL_7;
  }
  long long v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  id v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  id v9 = [v7 objectForKeyedSubscript:@"SoftClipLUT"];
  int v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "cmi_copy2DNestedFloatValuesToBuffer:bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:", a4, 260, 0, 5, 0, 65) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  int v11 = 0;
LABEL_7:

  return v11;
}

- (int)determineSoftClipLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 softClipLUT:
{
  uint64_t v5 = v4;
  id v7 = a3;
  if (v7 && a4 && v5)
  {
    uint64_t v8 = 0;
    float v9 = *((float *)a4 + 9);
    while (1)
    {
      if (v8 * 4)
      {
        float v10 = *(float *)&dword_263481FC0[v8];
        float v11 = 1.0;
      }
      else
      {
        float v11 = 2.0;
        float v10 = 1.0;
      }
      float v12 = v11 - v9;
      if (v12 == 0.0)
      {
        FigDebugAssert3();
        goto LABEL_14;
      }
      float v13 = (float)(v10 - v9) / v12;
      float v14 = expf((float)(*(float *)&dword_263481FC0[v8] + -1.0) * -2.0);
      int v15 = quadra_curve(65, v5, 0.0, 0.015625, 0.0, 1.0, 0.0, 1.0, v13, v13 * v14, 4096.0);
      if (v15) {
        break;
      }
      v5 += 260;
      if (++v8 == 5)
      {
        int v16 = 0;
        goto LABEL_12;
      }
    }
    int v16 = v15;
    FigDebugAssert3();
  }
  else
  {
LABEL_14:
    int v16 = FigSignalErrorAt();
  }
LABEL_12:

  return v16;
}

- (int)loadSoftClipLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:
{
  uint64_t v6 = v4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = v6;
  float v11 = v10;
  if (!v9 || !v10) {
    goto LABEL_21;
  }
  if ([v10 width] != 65 || objc_msgSend(v11, "height") != 5)
  {
    FigDebugAssert3();
LABEL_21:
    int v13 = FigSignalErrorAt();
    goto LABEL_17;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    float v12 = -[SoftISPInputFrame registers]((uint64_t)v9);
    int v13 = [(H13FastBayerProcConfig *)self determineSoftClipLUTFromRegisters:v12 softClipLUT:v22];

    if (!v13)
    {
      if ([(SoftISPConfig *)self stageConfigMode] != 4) {
        goto LABEL_16;
      }
      int v14 = [(H13FastBayerProcConfig *)self determineSoftClipLUTFromInputFrame:v9 hrConfig:a4 softClipLUT:v21];
      if (!v14)
      {
        if (compareFloatArray(v22, v21, 325) != 0.0) {
          goto LABEL_26;
        }
        goto LABEL_16;
      }
      int v13 = v14;
    }
    goto LABEL_25;
  }
  int v15 = [(H13FastBayerProcConfig *)self determineSoftClipLUTFromInputFrame:v9 hrConfig:a4 softClipLUT:v22];
  if (v15)
  {
    int v13 = v15;
    goto LABEL_25;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 2) {
    goto LABEL_16;
  }
  int v16 = -[SoftISPInputFrame registers]((uint64_t)v9);
  int v13 = [(H13FastBayerProcConfig *)self determineSoftClipLUTFromRegisters:v16 softClipLUT:v21];

  if (v13)
  {
LABEL_25:
    FigDebugAssert3();
    goto LABEL_17;
  }
  if (compareFloatArray(v22, v21, 325) != 0.0)
  {
LABEL_26:
    uint64_t v19 = v5;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
LABEL_16:
  memset(v20, 0, 24);
  v20[3] = objc_msgSend(v11, "width", v18, v19);
  v20[4] = [v11 height];
  v20[5] = 1;
  [v11 replaceRegion:v20 mipmapLevel:0 withBytes:v22 bytesPerRow:260];
  int v13 = 0;
LABEL_17:

  return v13;
}

- (int)determineHPBLUTFromRegisters:(id)a3 hpbLUT:(char *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v8 = 0;
LABEL_11:
    id v10 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    id v10 = 0;
LABEL_13:
    int v11 = FigSignalErrorAt();
    goto LABEL_7;
  }
  id v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  uint64_t v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  id v9 = [v7 objectForKeyedSubscript:@"HPBPLUT"];
  id v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "cmi_copy2DNestedUnsignedCharValuesToBuffer:bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:", a4, 33, 0, 33, 0, 33) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  int v11 = 0;
LABEL_7:

  return v11;
}

- (int)determineHPBLUTFromInputFrame:(id)a3 hpbLUT:(char *)a4
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    for (unint64_t i = 0; i != 33; ++i)
    {
      v8.f32[0] = (float)i * 0.03125;
      v8.f32[1] = (float)v5 * 0.03125;
      float32x2_t v9 = vadd_f32(v8, (float32x2_t)0xBED5C7CEBED57929);
      a4[v6 + i] = (int)fminf(roundf(expf(vaddv_f32(vmul_f32(v9, v9)) / -0.019277) * 256.0), 255.0);
    }
    ++v5;
    v6 += 33;
  }
  while (v5 != 33);
  return 0;
}

- (int)loadHPBLUTForInputFrame:(id)a3 toTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float32x2_t v8 = v7;
  if (!v6 || !v7) {
    goto LABEL_24;
  }
  if ([v7 width] != 33 || objc_msgSend(v8, "height") != 33)
  {
    FigDebugAssert3();
LABEL_24:
    int v11 = FigSignalErrorAt();
    float32x2_t v9 = 0;
LABEL_30:
    float v12 = 0;
    goto LABEL_20;
  }
  float32x2_t v9 = (unsigned __int8 *)malloc_type_malloc(0x441uLL, 0x761578DuLL);
  if (!v9)
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    goto LABEL_30;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    id v10 = -[SoftISPInputFrame registers]((uint64_t)v6);
    int v11 = [(H13FastBayerProcConfig *)self determineHPBLUTFromRegisters:v10 hpbLUT:v9];

    if (!v11)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        float v12 = (unsigned __int8 *)malloc_type_malloc(0x441uLL, 0x11129821uLL);
        if (v12)
        {
          int v13 = [(H13FastBayerProcConfig *)self determineHPBLUTFromInputFrame:v6 hpbLUT:v12];
          if (v13)
          {
            int v11 = v13;
LABEL_32:
            FigDebugAssert3();
            goto LABEL_20;
          }
          goto LABEL_17;
        }
LABEL_31:
        FigDebugAssert3();
        int v11 = FigSignalErrorAt();
        goto LABEL_20;
      }
LABEL_18:
      float v12 = 0;
      goto LABEL_19;
    }
    goto LABEL_29;
  }
  int v14 = [(H13FastBayerProcConfig *)self determineHPBLUTFromInputFrame:v6 hpbLUT:v9];
  if (v14)
  {
    int v11 = v14;
LABEL_29:
    FigDebugAssert3();
    goto LABEL_30;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 2) {
    goto LABEL_18;
  }
  float v12 = (unsigned __int8 *)malloc_type_malloc(0x441uLL, 0x993E703DuLL);
  if (!v12) {
    goto LABEL_31;
  }
  int v15 = -[SoftISPInputFrame registers]((uint64_t)v6);
  int v11 = [(H13FastBayerProcConfig *)self determineHPBLUTFromRegisters:v15 hpbLUT:v12];

  if (v11) {
    goto LABEL_32;
  }
LABEL_17:
  compareUInt8Array(v9, v12, 1089);
LABEL_19:
  memset(v17, 0, 24);
  v17[3] = [v8 width];
  v17[4] = [v8 height];
  v17[5] = 1;
  [v8 replaceRegion:v17 mipmapLevel:0 withBytes:v9 bytesPerRow:33];
  int v11 = 0;
LABEL_20:
  free(v9);
  free(v12);

  return v11;
}

- (int)determineMixClipLUTFromRegisters:(id)a3 mixClipLUT:(float *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    float32x2_t v8 = 0;
LABEL_9:
    id v10 = 0;
LABEL_11:
    int v11 = FigSignalErrorAt();
    goto LABEL_6;
  }
  id v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  float32x2_t v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  float32x2_t v9 = [v7 objectForKeyedSubscript:@"MixClipLUT"];
  id v10 = v9;
  if (!v9 || (objc_msgSend(v9, "cmi_copyFloatValuesToBuffer:startingIndex:count:", a4, 0, 65) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_6:

  return v11;
}

- (int)determineMixClipLUTFromInputFrame:(id)a3 mixClipLUT:(float *)a4
{
  id v6 = a3;
  char v32 = 0;
  id v7 = [(SoftISPConfig *)self staticParameters];
  float32x2_t v8 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  float32x2_t v9 = [v7 tuningParametersForInputFrameMetadata:v8 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v6)];

  id v10 = [v9 objectForKeyedSubscript:@"HR"];
  int v11 = [v10 objectForKeyedSubscript:@"MixClipLUT"];

  a4[64] = 0.0;
  *((_OWORD *)a4 + 14) = 0u;
  *((_OWORD *)a4 + 15) = 0u;
  *((_OWORD *)a4 + 12) = 0u;
  *((_OWORD *)a4 + 13) = 0u;
  *((_OWORD *)a4 + 10) = 0u;
  *((_OWORD *)a4 + 11) = 0u;
  *((_OWORD *)a4 + 8) = 0u;
  *((_OWORD *)a4 + 9) = 0u;
  *((_OWORD *)a4 + 6) = 0u;
  *((_OWORD *)a4 + 7) = 0u;
  *((_OWORD *)a4 + 4) = 0u;
  *((_OWORD *)a4 + 5) = 0u;
  *((_OWORD *)a4 + 2) = 0u;
  *((_OWORD *)a4 + 3) = 0u;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"A", &v32, 0.0);
  if (v32
    && (int32x2_t v31 = v12, objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"B", &v32, 0.0), v32)
    && (int32x2_t v30 = v13, objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"C", &v32, 0.0), v32))
  {
    uint64_t v15 = 0;
    float32x2_t v16 = (float32x2_t)vdup_lane_s32(v31, 0);
    float32x2_t v17 = (float32x2_t)vdup_lane_s32(v30, 0);
    uint64x2_t v18 = (uint64x2_t)vdupq_n_s64(0x41uLL);
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0x3C7C0FC1u);
    int64x2_t v20 = (int64x2_t)xmmword_263380330;
    __asm { FMOV            V6.2S, #1.0 }
    int64x2_t v26 = vdupq_n_s64(2uLL);
    do
    {
      v27.i32[0] = v15;
      v27.i32[1] = v15 + 1;
      float32x2_t v28 = vminnm_f32(vmul_n_f32(vmaxnm_f32(v16, vsub_f32(vmul_f32(vcvt_f32_s32(v27), v19), v17)), v14), _D6);
      if (vmovn_s64((int64x2_t)vcgtq_u64(v18, (uint64x2_t)v20)).u8[0]) {
        a4[v15] = 4096.0 * v28.f32[0];
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x41uLL), *(uint64x2_t *)&v20)).i32[1]) {
        a4[v15 + 1] = vmuls_lane_f32(4096.0, v28, 1);
      }
      v15 += 2;
      int64x2_t v20 = vaddq_s64(v20, v26);
    }
    while (v15 != 66);
  }
  else
  {
    FigDebugAssert3();
  }

  return 0;
}

- (int)loadMixClipLUTForInputFrame:(id)a3 toTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float32x2_t v8 = v7;
  if (!v6 || !v7) {
    goto LABEL_26;
  }
  if ([v7 width] != 65)
  {
    FigDebugAssert3();
LABEL_26:
    int v11 = FigSignalErrorAt();
    float32x2_t v9 = 0;
LABEL_33:
    int32x2_t v12 = 0;
LABEL_34:
    float32x2_t v17 = 0;
    goto LABEL_22;
  }
  float32x2_t v9 = (float *)malloc_type_malloc(0x104uLL, 0x100004052888210uLL);
  if (!v9)
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    id v10 = -[SoftISPInputFrame registers]((uint64_t)v6);
    int v11 = [(H13FastBayerProcConfig *)self determineMixClipLUTFromRegisters:v10 mixClipLUT:v9];

    if (!v11)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        int32x2_t v12 = (float *)malloc_type_malloc(0x104uLL, 0x100004052888210uLL);
        if (v12)
        {
          int v13 = [(H13FastBayerProcConfig *)self determineMixClipLUTFromInputFrame:v6 mixClipLUT:v12];
          if (v13)
          {
            int v11 = v13;
LABEL_36:
            FigDebugAssert3();
            goto LABEL_34;
          }
          goto LABEL_16;
        }
LABEL_35:
        FigDebugAssert3();
        int v11 = FigSignalErrorAt();
        goto LABEL_34;
      }
      goto LABEL_17;
    }
    goto LABEL_32;
  }
  int v14 = [(H13FastBayerProcConfig *)self determineMixClipLUTFromInputFrame:v6 mixClipLUT:v9];
  if (v14)
  {
    int v11 = v14;
LABEL_32:
    FigDebugAssert3();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 2)
  {
    int32x2_t v12 = (float *)malloc_type_malloc(0x104uLL, 0x100004052888210uLL);
    if (v12)
    {
      uint64_t v15 = -[SoftISPInputFrame registers]((uint64_t)v6);
      int v11 = [(H13FastBayerProcConfig *)self determineMixClipLUTFromRegisters:v15 mixClipLUT:v12];

      if (v11) {
        goto LABEL_36;
      }
LABEL_16:
      compareFloatArray(v9, v12, 65);
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_17:
  int32x2_t v12 = 0;
LABEL_18:
  float32x2_t v16 = malloc_type_malloc(0x82uLL, 0x1000040BDFB0063uLL);
  float32x2_t v17 = v16;
  if (v16)
  {
    for (uint64_t i = 0; i != 65; ++i)
    {
      _S0 = v9[i] * 0.00024414;
      __asm { FCVT            H0, S0 }
      *((_WORD *)v16 + i) = LOWORD(_S0);
    }
    memset(v25, 0, sizeof(v25));
    long long v26 = xmmword_263481F60;
    uint64_t v27 = 1;
    [v8 replaceRegion:v25 mipmapLevel:0 withBytes:v16 bytesPerRow:130];
    int v11 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }
LABEL_22:
  free(v9);
  free(v12);
  free(v17);

  return v11;
}

- (int)determineRcvLUTFromRegisters:(id)a3 rcvLUT:(float *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    float32x2_t v8 = 0;
LABEL_9:
    id v10 = 0;
LABEL_11:
    int v11 = FigSignalErrorAt();
    goto LABEL_6;
  }
  id v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  float32x2_t v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  float32x2_t v9 = [v7 objectForKeyedSubscript:@"RcvLUT"];
  id v10 = v9;
  if (!v9 || (objc_msgSend(v9, "cmi_copyFloatValuesToBuffer:startingIndex:count:", a4, 0, 17) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_6:

  return v11;
}

- (int)determineRcvLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 rcvLUT:
{
  LODWORD(v7) = *((_DWORD *)a4 + 9);
  v5.i32[0] = 1031798784;
  v8.i32[0] = 1166016512;
  LODWORD(v6) = 1.0;
  int v11 = weightlum_curve(17, v4, 0, v5, v6, v7, v8, 0, v9, v10);
  if (v11) {
    FigDebugAssert3();
  }
  return v11;
}

- (int)loadRcvLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:
{
  int32x2_t v5 = v4;
  id v8 = a3;
  id v9 = v5;
  double v10 = v9;
  if (!v8 || !v9) {
    goto LABEL_26;
  }
  if ([v9 width] != 17)
  {
    FigDebugAssert3();
LABEL_26:
    int v13 = FigSignalErrorAt();
    int v11 = 0;
LABEL_33:
    int v14 = 0;
LABEL_34:
    float32x2_t v19 = 0;
    goto LABEL_22;
  }
  int v11 = (float *)malloc_type_malloc(0x44uLL, 0x100004052888210uLL);
  if (!v11)
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int32x2_t v12 = -[SoftISPInputFrame registers]((uint64_t)v8);
    int v13 = [(H13FastBayerProcConfig *)self determineRcvLUTFromRegisters:v12 rcvLUT:v11];

    if (!v13)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        int v14 = (float *)malloc_type_malloc(0x44uLL, 0x100004052888210uLL);
        if (v14)
        {
          int v15 = [(H13FastBayerProcConfig *)self determineRcvLUTFromInputFrame:v8 hrConfig:a4 rcvLUT:v14];
          if (v15)
          {
            int v13 = v15;
LABEL_36:
            FigDebugAssert3();
            goto LABEL_34;
          }
          goto LABEL_16;
        }
LABEL_35:
        FigDebugAssert3();
        int v13 = FigSignalErrorAt();
        goto LABEL_34;
      }
      goto LABEL_17;
    }
    goto LABEL_32;
  }
  int v16 = [(H13FastBayerProcConfig *)self determineRcvLUTFromInputFrame:v8 hrConfig:a4 rcvLUT:v11];
  if (v16)
  {
    int v13 = v16;
LABEL_32:
    FigDebugAssert3();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 2)
  {
    int v14 = (float *)malloc_type_malloc(0x44uLL, 0x100004052888210uLL);
    if (v14)
    {
      float32x2_t v17 = -[SoftISPInputFrame registers]((uint64_t)v8);
      int v13 = [(H13FastBayerProcConfig *)self determineRcvLUTFromRegisters:v17 rcvLUT:v14];

      if (v13) {
        goto LABEL_36;
      }
LABEL_16:
      compareFloatArray(v11, v14, 17);
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_17:
  int v14 = 0;
LABEL_18:
  uint64x2_t v18 = malloc_type_malloc(0x22uLL, 0x1000040BDFB0063uLL);
  float32x2_t v19 = v18;
  if (v18)
  {
    for (uint64_t i = 0; i != 17; ++i)
    {
      _S0 = v11[i] * 0.00024414;
      __asm { FCVT            H0, S0 }
      *((_WORD *)v18 + i) = LOWORD(_S0);
    }
    memset(v27, 0, sizeof(v27));
    long long v28 = xmmword_263481F70;
    uint64_t v29 = 1;
    [v10 replaceRegion:v27 mipmapLevel:0 withBytes:v18 bytesPerRow:34];
    int v13 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }
LABEL_22:
  free(v11);
  free(v14);
  free(v19);

  return v13;
}

- (int)determineInBlendLUTFromRegisters:(id)a3 inBlendLUT:(float *)a4
{
  id v5 = a3;
  double v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    id v8 = 0;
LABEL_9:
    double v10 = 0;
LABEL_11:
    int v11 = FigSignalErrorAt();
    goto LABEL_6;
  }
  double v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  id v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  id v9 = [v7 objectForKeyedSubscript:@"InBlendLUT"];
  double v10 = v9;
  if (!v9 || (objc_msgSend(v9, "cmi_copyFloatValuesToBuffer:startingIndex:count:", a4, 0, 129) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_6:

  return v11;
}

- (int)determineInBlendLUTFromInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 inBlendLUT:
{
  LODWORD(v6) = *((_DWORD *)a4 + 9);
  v7.i32[0] = -981467136;
  v8.i32[0] = 1166016512;
  LODWORD(v5) = 1.0;
  int v11 = weightlum_curve(129, v4, 0, (int32x2_t)0x3C0000003C000000, v5, v6, v7, v8, v9, v10);
  if (v11) {
    FigDebugAssert3();
  }
  return v11;
}

- (int)loadInBlendLUTForInputFrame:(id)a3 hrConfig:(const HRConfig *)a4 toTexture:
{
  double v5 = v4;
  id v8 = a3;
  id v9 = v5;
  double v10 = v9;
  if (!v8 || !v9) {
    goto LABEL_26;
  }
  if ([v9 width] != 129)
  {
    FigDebugAssert3();
LABEL_26:
    int v13 = FigSignalErrorAt();
    int v11 = 0;
LABEL_33:
    int v14 = 0;
LABEL_34:
    float32x2_t v19 = 0;
    goto LABEL_22;
  }
  int v11 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
  if (!v11)
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int32x2_t v12 = -[SoftISPInputFrame registers]((uint64_t)v8);
    int v13 = [(H13FastBayerProcConfig *)self determineInBlendLUTFromRegisters:v12 inBlendLUT:v11];

    if (!v13)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        int v14 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
        if (v14)
        {
          int v15 = [(H13FastBayerProcConfig *)self determineInBlendLUTFromInputFrame:v8 hrConfig:a4 inBlendLUT:v14];
          if (v15)
          {
            int v13 = v15;
LABEL_36:
            FigDebugAssert3();
            goto LABEL_34;
          }
          goto LABEL_16;
        }
LABEL_35:
        FigDebugAssert3();
        int v13 = FigSignalErrorAt();
        goto LABEL_34;
      }
      goto LABEL_17;
    }
    goto LABEL_32;
  }
  int v16 = [(H13FastBayerProcConfig *)self determineInBlendLUTFromInputFrame:v8 hrConfig:a4 inBlendLUT:v11];
  if (v16)
  {
    int v13 = v16;
LABEL_32:
    FigDebugAssert3();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 2)
  {
    int v14 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
    if (v14)
    {
      float32x2_t v17 = -[SoftISPInputFrame registers]((uint64_t)v8);
      int v13 = [(H13FastBayerProcConfig *)self determineInBlendLUTFromRegisters:v17 inBlendLUT:v14];

      if (v13) {
        goto LABEL_36;
      }
LABEL_16:
      compareFloatArray(v11, v14, 129);
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_17:
  int v14 = 0;
LABEL_18:
  uint64x2_t v18 = malloc_type_malloc(0x102uLL, 0x1000040BDFB0063uLL);
  float32x2_t v19 = v18;
  if (v18)
  {
    for (uint64_t i = 0; i != 129; ++i)
    {
      _S0 = v11[i] * 0.00024414;
      __asm { FCVT            H0, S0 }
      *((_WORD *)v18 + i) = LOWORD(_S0);
    }
    memset(v27, 0, sizeof(v27));
    long long v28 = xmmword_263481F80;
    uint64_t v29 = 1;
    [v10 replaceRegion:v27 mipmapLevel:0 withBytes:v18 bytesPerRow:258];
    int v13 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }
LABEL_22:
  free(v11);
  free(v14);
  free(v19);

  return v13;
}

- (int)determineHPPPInBlendLUTFromRegisters:(id)a3 hpppInBlendLUT:(float *)a4
{
  id v5 = a3;
  double v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    id v8 = 0;
LABEL_9:
    double v10 = 0;
LABEL_11:
    int v11 = FigSignalErrorAt();
    goto LABEL_6;
  }
  int32x2_t v7 = [v5 objectForKeyedSubscript:@"BayerProcHR"];
  id v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  id v9 = [v7 objectForKeyedSubscript:@"HPPPInBlendLUT"];
  double v10 = v9;
  if (!v9 || (objc_msgSend(v9, "cmi_copyFloatValuesToBuffer:startingIndex:count:", a4, 0, 129) & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_6:

  return v11;
}

- (int)determineHPPPInBlendLUTFromInputFrame:(id)a3 hpppInBlendLUT:(float *)a4
{
  v4.i32[0] = 1031798784;
  LODWORD(v6) = 1036831949;
  v7.i32[0] = -981467136;
  v8.i32[0] = 1166016512;
  LODWORD(v5) = 1.0;
  int v11 = weightlum_curve(129, (uint64_t)a4, 0, v4, v5, v6, v7, v8, v9, v10);
  if (v11) {
    FigDebugAssert3();
  }
  return v11;
}

- (int)loadHPPPInBlendLUTForInputFrame:(id)a3 toTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int32x2_t v8 = v7;
  if (!v6 || !v7) {
    goto LABEL_26;
  }
  if ([v7 width] != 129)
  {
    FigDebugAssert3();
LABEL_26:
    int v11 = FigSignalErrorAt();
    double v9 = 0;
LABEL_33:
    int32x2_t v12 = 0;
LABEL_34:
    float32x2_t v17 = 0;
    goto LABEL_22;
  }
  double v9 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
  if (!v9)
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    double v10 = -[SoftISPInputFrame registers]((uint64_t)v6);
    int v11 = [(H13FastBayerProcConfig *)self determineHPPPInBlendLUTFromRegisters:v10 hpppInBlendLUT:v9];

    if (!v11)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        int32x2_t v12 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
        if (v12)
        {
          int v13 = [(H13FastBayerProcConfig *)self determineHPPPInBlendLUTFromInputFrame:v6 hpppInBlendLUT:v12];
          if (v13)
          {
            int v11 = v13;
LABEL_36:
            FigDebugAssert3();
            goto LABEL_34;
          }
          goto LABEL_16;
        }
LABEL_35:
        FigDebugAssert3();
        int v11 = FigSignalErrorAt();
        goto LABEL_34;
      }
      goto LABEL_17;
    }
    goto LABEL_32;
  }
  int v14 = [(H13FastBayerProcConfig *)self determineHPPPInBlendLUTFromInputFrame:v6 hpppInBlendLUT:v9];
  if (v14)
  {
    int v11 = v14;
LABEL_32:
    FigDebugAssert3();
    goto LABEL_33;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 2)
  {
    int32x2_t v12 = (float *)malloc_type_malloc(0x204uLL, 0x100004052888210uLL);
    if (v12)
    {
      int v15 = -[SoftISPInputFrame registers]((uint64_t)v6);
      int v11 = [(H13FastBayerProcConfig *)self determineHPPPInBlendLUTFromRegisters:v15 hpppInBlendLUT:v12];

      if (v11) {
        goto LABEL_36;
      }
LABEL_16:
      compareFloatArray(v9, v12, 129);
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_17:
  int32x2_t v12 = 0;
LABEL_18:
  int v16 = malloc_type_malloc(0x102uLL, 0x1000040BDFB0063uLL);
  float32x2_t v17 = v16;
  if (v16)
  {
    for (uint64_t i = 0; i != 129; ++i)
    {
      _S0 = v9[i] * 0.00024414;
      __asm { FCVT            H0, S0 }
      *((_WORD *)v16 + i) = LOWORD(_S0);
    }
    memset(v25, 0, sizeof(v25));
    long long v26 = xmmword_263481F80;
    uint64_t v27 = 1;
    [v8 replaceRegion:v25 mipmapLevel:0 withBytes:v16 bytesPerRow:258];
    int v11 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }
LABEL_22:
  free(v9);
  free(v12);
  free(v17);

  return v11;
}

- (int)determineHRConfigFromRegistersForInputFrame:(id)a3 hrConfig:(HRConfig *)a4
{
  id v5 = a3;
  char v40 = 0;
  id v6 = -[SoftISPInputFrame registers]((uint64_t)v5);
  id v7 = v6;
  if (!v6) {
    goto LABEL_32;
  }
  if (!a4) {
    goto LABEL_33;
  }
  int32x2_t v8 = [v6 objectForKeyedSubscript:@"BayerProcHR"];
  if (!v8)
  {
LABEL_32:
    FigDebugAssert3();
LABEL_33:
    int v37 = FigSignalErrorAt();
    goto LABEL_29;
  }
  double v9 = v8;
  double v10 = [v8 objectForKeyedSubscript:@"Config"];
  if (!v10)
  {
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
LABEL_36:

    goto LABEL_29;
  }
  int v11 = v10;
  *((unsigned char *)a4 + 12) = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"IgnoreLSC", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((unsigned char *)a4 + 13) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"SoftClipEn", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((unsigned char *)a4 + 14) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlendInputEn", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((unsigned char *)a4 + 15) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlendHPPPTargetEn", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((unsigned char *)a4 + 16) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"NormTargetHueEn", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((unsigned char *)a4 + 17) = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"BlendClippedHueEn", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *(_DWORD *)a4 = objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", @"RecovMethod", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((_DWORD *)a4 + 1) = objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", @"SCHueRefChannel", 0, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((_WORD *)a4 + 4) = objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", @"GreenSelRed", 0, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((_WORD *)a4 + 5) = objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", @"GreenSelBlue", 0, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  *((_WORD *)a4 + 10) = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 1, &v40);
  if (!v40) {
    goto LABEL_35;
  }
  LODWORD(v12) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"CeilingGain", &v40, v12);
  *((_DWORD *)a4 + 6) = LODWORD(v13);
  if (!v40) {
    goto LABEL_35;
  }
  *((float *)a4 + 6) = *(float *)&v13 * 0.00024414;
  LODWORD(v13) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"MaxClip", &v40, v13);
  *((_DWORD *)a4 + 7) = LODWORD(v14);
  if (!v40) {
    goto LABEL_35;
  }
  *((float *)a4 + 8) = 1.0 / *(float *)&v14;
  LODWORD(v14) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"alphaRatio", &v40, v14);
  *((float *)a4 + 10) = v15;
  if (!v40) {
    goto LABEL_35;
  }
  float v16 = v15 * 0.00024414;
  *((float *)a4 + 10) = v16;
  float v17 = v16 * *((float *)a4 + 7);
  *((float *)a4 + 11) = v17 / (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v5);
  LODWORD(v18) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"CDist", &v40, v18);
  *((_DWORD *)a4 + 12) = LODWORD(v19);
  if (!v40) {
    goto LABEL_35;
  }
  *((float *)a4 + 12) = *(float *)&v19 * 0.000015259;
  LODWORD(v19) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"RGBclipGain", &v40, v19);
  *((float *)a4 + 13) = v20;
  if (!v40) {
    goto LABEL_35;
  }
  *((float *)a4 + 13) = v20 * 0.00024414;
  int32x4_t v21 = [v9 objectForKeyedSubscript:@"MaxLevel"];
  char v22 = objc_msgSend(v21, "cmi_copyFloatValuesToBuffer:startingIndex:count:", (char *)a4 + 64, 0, 4);

  if ((v22 & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v23 = [v9 objectForKeyedSubscript:@"ClipLevelOffset"];
  char v24 = objc_msgSend(v23, "cmi_copyFloatValuesToBuffer:startingIndex:count:", (char *)a4 + 80, 0, 4);

  if ((v24 & 1) == 0) {
    goto LABEL_35;
  }
  float32x4_t v25 = [v9 objectForKeyedSubscript:@"HPPPCoeff"];
  char v26 = objc_msgSend(v25, "cmi_copyFloatValuesToBuffer:startingIndex:count:", (char *)a4 + 96, 0, 3);

  if ((v26 & 1) == 0) {
    goto LABEL_35;
  }
  float32x4_t v27 = vmulq_f32(*((float32x4_t *)a4 + 6), (float32x4_t)vdupq_n_s32(0x38800000u));
  *((float32x4_t *)a4 + 6) = v27;
  v27.i32[0] = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GridOffsetX", &v40, *(double *)v27.i64);
  *((_DWORD *)a4 + 28) = LODWORD(v28);
  if (!v40) {
    goto LABEL_35;
  }
  LODWORD(v28) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GridOffsetY", &v40, v28);
  *((_DWORD *)a4 + 29) = v29;
  if (!v40) {
    goto LABEL_35;
  }
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v5);
  uint64_t v39 = v30;
  unsigned int v31 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v5);
  v32.i32[0] = v39 / v31;
  v32.i32[1] = HIDWORD(v39) / v31;
  double v33 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)((char *)a4 + 112), vmul_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(v32, v32)), (float32x2_t)vdup_n_s32(0x47800000u))));
  *((double *)a4 + 14) = v33;
  LODWORD(v33) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GridIntervalRecipX", &v40, v33);
  *((_DWORD *)a4 + 30) = LODWORD(v34);
  if (!v40
    || (LODWORD(v34) = 1.0,
        objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GridIntervalRecipY", &v40, v34),
        float32x2_t v36 = *(float32x2_t *)((char *)a4 + 120),
        *((_DWORD *)a4 + 31) = v35,
        !v40))
  {
LABEL_35:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();

    goto LABEL_36;
  }
  v36.i32[1] = v35;
  *((float32x2_t *)a4 + 15) = vmul_f32(v36, (float32x2_t)vdup_n_s32(0x2F800000u));

  int v37 = 0;
LABEL_29:

  return v37;
}

- (int)determineHRConfigFromInputFrame:(id)a3 bounds:(id)a4 hrConfig:(HRConfig *)a5 awbComputedGains:
{
  uint32x4_t v66 = v5;
  id v9 = a3;
  id v10 = a4;
  char v70 = 0;
  if (!v9 || !a5) {
    goto LABEL_32;
  }
  unsigned __int32 v11 = v66.u32[2];
  if (v66.i32[2] >= (unsigned __int32)v66.i32[0]) {
    unsigned __int32 v11 = v66.i32[0];
  }
  if (v66.i32[1] < v11) {
    unsigned __int32 v11 = v66.u32[1];
  }
  if (!v11
    || (float v12 = *((float *)a5 + 36),
        -[SoftISPInputFrame metadata]((uint64_t)v9),
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_32:
    int v64 = FigSignalErrorAt();
    goto LABEL_29;
  }
  double v14 = (void *)v13;
  if (v12 <= 0.0)
  {
    int v64 = FigSignalErrorAt();
LABEL_35:

    goto LABEL_29;
  }
  float v15 = [(SoftISPConfig *)self staticParameters];
  float v16 = [v15 tuningParametersForInputFrameMetadata:v14 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v9)];

  if (!v16) {
    FigSignalErrorAt();
  }
  float v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"HR", v66.i64[0]);
  double v18 = v17;
  if (!v17)
  {
    FigSignalErrorAt();
    double v18 = (void *)MEMORY[0x263EFFA78];
  }
  id v19 = v18;

  LODWORD(v20) = 1058642330;
  objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", @"alphaMin", &v70, v20);
  float v22 = *(float *)&v21;
  if (!v70) {
    FigSignalErrorAt();
  }
  LODWORD(v21) = 1065336439;
  objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", @"alphaMax", &v70, v21);
  float v24 = *(float *)&v23;
  if (!v70) {
    FigSignalErrorAt();
  }
  LODWORD(v23) = 1028443341;
  objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", @"d0", &v70, v23);
  float v26 = v25;
  if (!v70) {
    FigSignalErrorAt();
  }
  float v27 = 1.0;
  if ((-[SoftISPInputFrame frameID]((uint64_t)v9) & 0x100000000) != 0) {
    goto LABEL_26;
  }
  double v28 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2F640]];
  uint64_t v29 = *MEMORY[0x263F2F468];
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v70, 0.0);
  if (!v70
    || (float v31 = v30,
        uint64_t v32 = *MEMORY[0x263F2F2C0],
        objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v70, 0.0),
        !v70)
    || (float v34 = v33, objc_msgSend(v28, "cmi_floatValueForKey:defaultValue:found:", v29, &v70, 0.0), !v70)
    || (float v36 = v35, objc_msgSend(v28, "cmi_floatValueForKey:defaultValue:found:", v32, &v70, 0.0), !v70))
  {
    int v64 = FigSignalErrorAt();

    goto LABEL_35;
  }
  float v27 = (float)(v31 * v34) / (float)(v36 * v37);

LABEL_26:
  float v38 = 1.0 / v12;
  float32x4_t v39 = vcvtq_f32_u32(v66);
  v39.i32[3] = 0;
  float v40 = fmaxf(fmaxf(v39.f32[0], v39.f32[2]), v39.f32[1]) / fminf(fminf(v39.f32[0], v39.f32[2]), v39.f32[1]);
  float32x4_t v41 = vrndaq_f32(v39);
  v41.i32[3] = 0;
  float32x4_t v42 = vmaxnmq_f32(v41, (float32x4_t)xmmword_263481F90);
  v42.i32[3] = 0;
  int32x4_t v67 = (int32x4_t)vmulq_f32(vminnmq_f32(v42, (float32x4_t)xmmword_263481FA0), (float32x4_t)vdupq_n_s32(0x39800000u));
  float v43 = v24;
  if (v40 != 1.0) {
    float v43 = v22 / (v40 + -1.0) * (float)(v24 - v22);
  }
  *(_DWORD *)a5 = 1;
  float v44 = fminf(fmaxf(v43, v22), v24);
  *(void *)((char *)a5 + 4) = 0;
  *((unsigned char *)a5 + 12) = 0;
  *(_DWORD *)((char *)a5 + 13) = 16843009;
  *((unsigned char *)a5 + 17) = 1;
  unint64_t v45 = [(SoftISPConfig *)self staticParameters];
  *((unsigned char *)a5 + 18) = (int)-[SoftISPStaticParameters deviceGeneration]((uint64_t)v45) > 199;

  *((_WORD *)a5 + 10) = -[SoftISPInputFrame firstPixel]((uint64_t)v9);
  *((float *)a5 + 6) = roundf(v38 * 4096.0) * 0.00024414;
  float v46 = roundf((float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9) / v38);
  *((float *)a5 + 7) = v46;
  *((float *)a5 + 8) = 1.0 / v46;
  float v47 = roundf(v44 * 4096.0) * 0.00024414;
  *((float *)a5 + 9) = v44;
  *((float *)a5 + 10) = v47;
  *((float *)a5 + 11) = (float)(v47 * v46) / (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9);
  *((float *)a5 + 12) = roundf(1.0 / (float)(v26 * 0.69315)) * 0.000015259;
  *((float *)a5 + 13) = fminf(fmaxf(roundf((float)(v38 * 4096.0) / v27), 0.0), 65535.0) * 0.00024414;
  *((float *)a5 + 14) = v40;
  float32x4_t v68 = vrndaq_f32(vmulq_n_f32((float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v67, (int8x16_t)v67, 4uLL), v67), (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9)));
  *(float *)v48.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9);
  *((float32x4_t *)a5 + 4) = vminnmq_f32(v68, (float32x4_t)vdupq_lane_s32(v48, 0));
  *((void *)a5 + 10) = 0;
  *((void *)a5 + 11) = 0;
  *((_OWORD *)a5 + 6) = xmmword_263481FB0;
  *(float *)v49.i32 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9);
  float v50 = *((float *)a5 + 8) * *(float *)v49.i32;
  *((float *)a5 + 7) = *((float *)a5 + 7) / *(float *)v49.i32;
  *((float *)a5 + 8) = v50;
  *((float *)a5 + 12) = *((float *)a5 + 12) * *(float *)v49.i32;
  float32x4_t v51 = (float32x4_t)vdupq_lane_s32(v49, 0);
  float32x4_t v52 = vdivq_f32(*((float32x4_t *)a5 + 4), v51);
  float32x4_t v53 = vdivq_f32(*((float32x4_t *)a5 + 5), v51);
  *((float32x4_t *)a5 + 4) = v52;
  *((float32x4_t *)a5 + 5) = v53;
  LODWORD(v45) = 2 * -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v9);
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v9);
  v55.i64[0] = v54;
  uint32x4_t v69 = v55;
  unsigned int v56 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v9);
  v57.i64[1] = v69.i64[1];
  v58.i32[0] = (v69.i32[0] / v56 / v45) & 0x7FFFFFFF;
  v58.i32[1] = (v69.i32[1] / v56 / v45) & 0x7FFFFFFF;
  *(float32x2_t *)v57.f32 = vdiv_f32(vmul_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(v58, (int32x2_t)-1)), (float32x2_t)vdup_n_s32(0x4F800000u)), vcvt_f32_u32((uint32x2_t)vmul_s32(v58, vdup_n_s32(v45))));
  float32x2_t v59 = vmul_f32((float32x2_t)*(_OWORD *)&vrndaq_f32(v57), (float32x2_t)vdup_n_s32(0x2F800000u));
  *((float32x2_t *)a5 + 15) = v59;
  uint64_t v60 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v10);
  uint64_t v61 = -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9);
  v69.i64[0] = -[SoftISPInputFrame sensorCropRect]((uint64_t)v9);
  int v62 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v9);
  v63.i32[0] = v69.i32[0] / v62;
  v63.i32[1] = v69.i32[1] / v62;
  *((float32x2_t *)a5 + 14) = vmul_f32(v59, vcvt_f32_s32(vsub_s32((int32x2_t)v60, vadd_s32(v63, (int32x2_t)v61))));

  int v64 = 0;
LABEL_29:

  return v64;
}

- (int)getHRConfigForInputFrame:(id)a3 bounds:(id)a4 awbComputedGains:(const LSCConfig *)a5 lscConfig:hrConfig:outputMetadata:
{
  int32x2_t v8 = v6;
  uint64_t v9 = v5;
  double v36 = v7;
  id v13 = a3;
  id v14 = a4;
  id v15 = v8;
  memset(v37, 0, 128);
  if (!v13 || !a5 || !v9) {
    goto LABEL_25;
  }
  *(_OWORD *)(v9 + 224) = 0uLL;
  *(_OWORD *)(v9 + 240) = 0uLL;
  *(_OWORD *)(v9 + 192) = 0uLL;
  *(_OWORD *)(v9 + 208) = 0uLL;
  *(_OWORD *)(v9 + 160) = 0uLL;
  *(_OWORD *)(v9 + 176) = 0uLL;
  *(_OWORD *)(v9 + 128) = 0uLL;
  *(_OWORD *)(v9 + 144) = 0uLL;
  *(_OWORD *)(v9 + 96) = 0uLL;
  *(_OWORD *)(v9 + 112) = 0uLL;
  *(_OWORD *)(v9 + 64) = 0uLL;
  *(_OWORD *)(v9 + 80) = 0uLL;
  *(_OWORD *)(v9 + 32) = 0uLL;
  *(_OWORD *)(v9 + 48) = 0uLL;
  *(_OWORD *)uint64_t v9 = 0uLL;
  *(_OWORD *)(v9 + 16) = 0uLL;
  long long v16 = *(_OWORD *)a5;
  long long v17 = *((_OWORD *)a5 + 1);
  long long v18 = *((_OWORD *)a5 + 3);
  *(_OWORD *)(v9 + 160) = *((_OWORD *)a5 + 2);
  *(_OWORD *)(v9 + 176) = v18;
  *(_OWORD *)(v9 + 128) = v16;
  *(_OWORD *)(v9 + 144) = v17;
  long long v19 = *((_OWORD *)a5 + 4);
  long long v20 = *((_OWORD *)a5 + 5);
  long long v21 = *((_OWORD *)a5 + 7);
  *(_OWORD *)(v9 + 224) = *((_OWORD *)a5 + 6);
  *(_OWORD *)(v9 + 240) = v21;
  *(_OWORD *)(v9 + 192) = v19;
  *(_OWORD *)(v9 + 208) = v20;
  long long v22 = *(_OWORD *)a5;
  long long v23 = *((_OWORD *)a5 + 1);
  long long v24 = *((_OWORD *)a5 + 3);
  v37[10] = *((_OWORD *)a5 + 2);
  v37[11] = v24;
  v37[8] = v22;
  v37[9] = v23;
  long long v25 = *((_OWORD *)a5 + 4);
  long long v26 = *((_OWORD *)a5 + 5);
  long long v27 = *((_OWORD *)a5 + 7);
  v37[14] = *((_OWORD *)a5 + 6);
  v37[15] = v27;
  v37[12] = v25;
  v37[13] = v26;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int v28 = [(H13FastBayerProcConfig *)self determineHRConfigFromRegistersForInputFrame:v13 hrConfig:v9];
    if (v28)
    {
      int v34 = v28;
      goto LABEL_23;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 4)
    {
      int v30 = [(H13FastBayerProcConfig *)self determineHRConfigFromInputFrame:v13 bounds:v14 hrConfig:v37 awbComputedGains:v36];
      if (!v30)
      {
        if (compareHRConfig(v9, (uint64_t)v37)) {
          goto LABEL_24;
        }
        goto LABEL_15;
      }
      int v34 = v30;
LABEL_23:
      FigDebugAssert3();
      goto LABEL_16;
    }
  }
  else
  {
    int v31 = [(H13FastBayerProcConfig *)self determineHRConfigFromInputFrame:v13 bounds:v14 hrConfig:v9 awbComputedGains:v36];
    if (v31)
    {
      int v34 = v31;
      goto LABEL_23;
    }
    if ([(SoftISPConfig *)self stageConfigMode] == 2)
    {
      int v32 = [(H13FastBayerProcConfig *)self determineHRConfigFromRegistersForInputFrame:v13 hrConfig:v37];
      if (!v32)
      {
        if (compareHRConfig(v9, (uint64_t)v37))
        {
LABEL_24:
          FigDebugAssert3();
LABEL_25:
          int v34 = FigSignalErrorAt();
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      int v34 = v32;
      goto LABEL_23;
    }
  }
LABEL_15:
  LODWORD(v29) = llroundf(*(float *)(v9 + 56) * 4096.0);
  float v33 = [NSNumber numberWithInt:v29];
  [v15 setObject:v33 forKeyedSubscript:*MEMORY[0x263F2F4F8]];

  int v34 = 0;
LABEL_16:

  return v34;
}

- (int)getHOCLBinConfigForInputFrame:(id)a3 staticParameters:(id)a4 hoclBinConfig:(HOCLBinConfig *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || !a5) {
    goto LABEL_12;
  }
  uint64_t v9 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  id v10 = [v8 moduleConfigForInputFrameMetadata:v9];

  if (!v10)
  {
    FigDebugAssert3();
LABEL_12:
    int v16 = FigSignalErrorAt();
    goto LABEL_8;
  }
  unsigned __int32 v11 = [v10 objectForKeyedSubscript:@"HybridOCL"];
  float v12 = [v11 objectForKeyedSubscript:@"HOCLBin"];

  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"mode"];
    unsigned __int16 v14 = [v13 intValue];

    int v15 = v14;
  }
  else
  {
    int v15 = 0;
  }
  a5->var1 = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
  a5->uint64_t var2 = v15;
  a5->unsigned __int16 var0 = v15 != 0;

  int v16 = 0;
LABEL_8:

  return v16;
}

- (int)getFrontEndConfigForInputFrame:(id)a3 bounds:(id)a4 frontEndThumbnailConfig:(FrontEndProcessorThumbnailConfig *)a5 gocConfig:(GOCConfig *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  float v12 = (void *)v11;
  if (!v9 || !a5 || !a6 || !v11) {
    goto LABEL_22;
  }
  float32x4_t v35 = *(float32x4_t *)&a6[6].var2;
  if ((-[SoftISPInputFrame frameID]((uint64_t)v9) & 0x100000000) != 0)
  {
    *(float *)v13.i32 = vminvq_f32(v35) * 65535.0;
    v15.i64[0] = 0x3F0000003F000000;
    v15.i64[1] = 0x3F0000003F000000;
    int16x4_t v14 = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vdivq_f32((float32x4_t)vdupq_lane_s32(v13, 0), v35), v15)));
  }
  else
  {
    int16x4_t v14 = (int16x4_t)-1;
  }
  int16x4_t v36 = v14;
  int v16 = -[SoftISPInputFrame firstPixel]((uint64_t)v9);
  __int16 v17 = v16;
  switch(v16)
  {
    case 3:
      int16x4_t v18 = vrev64_s16(v36);
      break;
    case 2:
      int16x4_t v18 = (int16x4_t)vext_s8((int8x8_t)v36, (int8x8_t)v36, 4uLL);
      break;
    case 1:
      int16x4_t v18 = vrev32_s16(v36);
      break;
    default:
      goto LABEL_15;
  }
  int16x4_t v36 = v18;
LABEL_15:
  *(_OWORD *)&a5[1].uint64_t var2 = 0u;
  *(_OWORD *)&a5[1].var6 = 0u;
  *(_OWORD *)&a5->var3 = 0u;
  *(_OWORD *)&a5->var7 = 0u;
  *(_OWORD *)&a5->var0.unsigned __int16 var0 = 0u;
  a5->var0.unsigned __int16 var0 = 1;
  a5->var0.uint64_t var2 = 0;
  int32x2_t v32 = vshr_n_s32(vshl_n_s32((int32x2_t)-[SoftISPInputFrame sensorCropRect]((uint64_t)v9), 0x10uLL), 0x10uLL);
  int32x2_t v19 = vshr_n_s32(vshl_n_s32(vdup_n_s32(-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v9)), 0x10uLL), 0x10uLL);
  v19.i32[0] = v32.i32[0] / v19.i32[0];
  v19.i32[1] = v32.i32[1] / v19.i32[1];
  int32x2_t v20 = vadd_s32(v19, (int32x2_t)-[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9));
  int32x2_t v21 = vsub_s32(v20, (int32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v10));
  *(&a5->var1 + 1) = v21.i16[2];
  a5->var1 = v21.i16[0];
  int32x2_t v33 = vshr_n_s32(vshl_n_s32((int32x2_t)-[SoftISPInputFrame sensorCropRect]((uint64_t)v9), 0x10uLL), 0x10uLL);
  int32x2_t v22 = vshr_n_s32(vshl_n_s32(vdup_n_s32(-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v9)), 0x10uLL), 0x10uLL);
  v22.i32[0] = v33.i32[0] / v22.i32[0];
  v22.i32[1] = v33.i32[1] / v22.i32[1];
  int32x2_t v34 = v22;
  uint64_t v23 = -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9);
  -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9);
  int8x8_t v25 = (int8x8_t)vsub_s32(vadd_s32(v34, vadd_s32(v24, (int32x2_t)v23)), (int32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v10));
  HIWORD(a5->var2) = v25.i16[2];
  LOWORD(a5->var2) = v25.i16[0];
  v25.i32[0] = a5->var1;
  v25.i32[1] = *(&a5->var1 + 1);
  int16x4_t v26 = (int16x4_t)vceqz_s32((int32x2_t)vand_s8(v25, (int8x8_t)0x100000001));
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v26, v26)) & 0x8000) == 0)
  {
    FigDebugAssert3();
LABEL_22:
    int v30 = FigSignalErrorAt();
    goto LABEL_17;
  }
  LOWORD(a5->var3) = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v9);
  unsigned __int16 v27 = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v9);
  int var3_low = LOWORD(a5->var3);
  HIWORD(a5->var3) = v27;
  a5->var4 = 0.0;
  HIWORD(a5->var5) = v27;
  LOWORD(a5->var5) = var3_low;
  float v29 = log2f((float)(v27 * var3_low));
  *(float *)&a5[2].var0.unsigned __int16 var0 = exp2f(-(float)(int)v29);
  LOWORD(a5[1].var2) = -1;
  *(int16x4_t *)&a5->var7 = v36;
  *(int16x4_t *)&a5[1].var0.uint64_t var2 = v36;
  *(void *)&a5[1].var3 = 0x477FFF0000000000;
  a5[1].var5 = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v9);
  int v30 = 0;
  *(float *)&a5[1].var6 = (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v9) / 65535.0;
  LOWORD(a5[1].var7) = v17;
LABEL_17:

  return v30;
}

- (int)getSyntheticConfigForInputFrame:(id)a3 syntheticThumbnailConfig:(SyntheticThumbnailConfig *)a4 lscConfig:awbGains:isQuadra:
{
  int v7 = v5;
  long long v14 = v6;
  id v8 = v4;
  id v10 = a3;
  if (v10 && a4 && v8)
  {
    if (v7) {
      __int16 v11 = 16;
    }
    else {
      __int16 v11 = 8;
    }
    *((_WORD *)a4 + 1) = v11;
    *(_WORD *)a4 = v11;
    *((_DWORD *)a4 + 1) = 524296;
    *((_WORD *)a4 + 4) = v8[8];
    *((_OWORD *)a4 + 1) = v14;
    memmove((char *)a4 + 32, v8, 0x80uLL);
    int v12 = 0;
  }
  else
  {
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)getHuemapFepConfigForInputFrame:(id)a3 huemapFepConfig:(HuemapFepConfig *)a4 gocConfig:(GOCConfig *)a5
{
  id v7 = a3;
  uint64_t v8 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  id v10 = (void *)v8;
  if (v7 && a4 && a5 && v8)
  {
    int32x4_t v11 = *(int32x4_t *)&a5[6].var2;
    *(float *)v9.i32 = fmaxf(fmaxf(fmaxf(COERCE_FLOAT(HIDWORD(*(void *)&a5[6].var2)), COERCE_FLOAT(*(void *)&a5[7].var1)), *(float *)v11.i32), 0.000001);
    float32x4_t v15 = vdivq_f32((float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)v11, 4uLL), v11), (float32x4_t)vdupq_lane_s32(v9, 0));
    *(void *)&a4[2].uint64_t var2 = 0;
    *(_OWORD *)&a4->unsigned __int16 var0 = 0u;
    *(_OWORD *)&a4[1].var1 = 0u;
    a4->var1 = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
    *(_DWORD *)&a4->uint64_t var2 = 1;
    a4->var4 = 16;
    a4[1].var1 = -(__int16)-[SoftISPInputFrame uncorrectedSensorBlackLevel]((uint64_t)v7);
    int v12 = 0;
    a4[1].uint64_t var2 = llroundf((float)((float)(65535.0 / (float)(int)-[SoftISPInputFrame uncorrectedSensorHeadRoom]((uint64_t)v7))* 16384.0)* 1.001);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    *(void *)&a4[1].var5.unsigned __int16 var0 = -1;
    *(int16x4_t *)&a4[2].uint64_t var2 = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vdivq_f32((float32x4_t)vdupq_n_s32(0x44800000u), v15), v13)));
  }
  else
  {
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)getHuemapMotionCompensationConfigForInputFrame:(id)a3 huemapMotionCompensationConfig:(HuemapMotionCompensationConfig *)a4
{
  id v6 = a3;
  char v29 = 0;
  id v7 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  uint64_t v8 = v7;
  if (!v6
    || !a4
    || !v7
    || ([v7 objectForKeyedSubscript:*MEMORY[0x263F2F640]],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v27 = FigSignalErrorAt();
    goto LABEL_13;
  }
  int32x4_t v11 = (void *)v9;
  uint64_t v12 = *MEMORY[0x263F2F468];
  LODWORD(v10) = 1.0;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v29, v10);
  if (!v29) {
    goto LABEL_14;
  }
  float v14 = v13;
  uint64_t v15 = *MEMORY[0x263F2F2C0];
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v29, 0.0);
  if (!v29
    || (float v17 = *(float *)&v16,
        LODWORD(v16) = 1.0,
        objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", v12, &v29, v16),
        !v29)
    || (float v19 = v18, objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", v15, &v29, 0.0), !v29))
  {
LABEL_14:
    int v27 = FigSignalErrorAt();
LABEL_17:

    goto LABEL_13;
  }
  float v21 = v20;
  int32x2_t v22 = [(SoftISPConfig *)self staticParameters];
  uint64_t v23 = [v22 tuningParametersForInputFrameMetadata:v8 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v6)];

  if (!v23) {
    FigSignalErrorAt();
  }
  *(_OWORD *)&a4->var15 = 0u;
  *(_OWORD *)&a4[1].uint64_t var2 = 0u;
  *(_OWORD *)&a4->var4 = 0u;
  *(_OWORD *)&a4->var11 = 0u;
  *(_OWORD *)&a4->unsigned __int16 var0 = 0u;
  a4->unsigned __int16 var0 = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v6);
  a4->var1 = 1.0 / (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v6);
  a4->uint64_t var2 = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v6);
  a4->var3 = (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v6);
  *(_DWORD *)&a4->var8 = 458759;
  LOWORD(a4->var9) = 257;
  BYTE2(a4->var9) = 1;
  float v24 = -(float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v6);
  a4->var10 = (int)(float)(v24 / (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v6));
  a4->var11 = 1.0;
  LOWORD(a4->var12) = 0x8000;
  a4->var13 = (float)(v14 * v17) / (float)(v19 * v21);
  *(_OWORD *)&a4->var14 = xmmword_263482220;
  *(void *)&a4[1].uint64_t var2 = 0x454CD00042040000;
  *(_WORD *)&a4[1].var4 = -[SoftISPInputFrame firstPixel]((uint64_t)v6);
  int8x8_t v25 = [v23 objectForKeyedSubscript:@"HR"];
  if (!v25)
  {
    int v27 = FigSignalErrorAt();

    goto LABEL_17;
  }
  int16x4_t v26 = v25;
  a4->var4 = objc_msgSend(v25, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyLscInHuemap", 0, 0);

  int v27 = 0;
LABEL_13:

  return v27;
}

- (int)getHuemapConfigForInputFrame:(id)a3 huemapConfig:(HuemapConfig *)a4 gocConfig:(GOCConfig *)a5
{
  id v8 = a3;
  uint64_t v9 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  double v10 = (void *)v9;
  if (v8 && a4 && a5 && v9)
  {
    int32x4_t v11 = [(SoftISPConfig *)self staticParameters];
    uint64_t v12 = [v11 tuningParametersForInputFrameMetadata:v10 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v8)];

    if (!v12) {
      FigSignalErrorAt();
    }
    *(_OWORD *)&a4->var4 = 0u;
    *(_OWORD *)&a4[1].uint64_t var2 = 0u;
    *(_OWORD *)&a4->unsigned __int16 var0 = 0u;
    a4->unsigned __int16 var0 = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v8);
    a4->var1 = 1.0 / (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v8);
    *(void *)&a4->uint64_t var2 = 0x4166D40042904000;
    int32x4_t v13 = *(int32x4_t *)&a5[6].var2;
    float32x4_t v14 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v13, 4uLL), v13);
    *(float *)v13.i32 = fmaxf(fmaxf(fmaxf(COERCE_FLOAT(HIDWORD(*(void *)&a5[6].var2)), COERCE_FLOAT(*(void *)&a5[7].var1)), *(float *)v13.i32), 0.000001);
    *(float32x4_t *)&a4->var4 = vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.i8, 0));
    *(_WORD *)((char *)&a4[1].var2 + 1) = 257;
    HIBYTE(a4[1].var2) = 1;
    LOWORD(a4[1].var3) = -[SoftISPInputFrame firstPixel]((uint64_t)v8);
    uint64_t v15 = [v12 objectForKeyedSubscript:@"HR"];
    if (v15)
    {
      double v16 = v15;
      LOBYTE(a4[1].var2) = objc_msgSend(v15, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyLscInHuemap", 0, 0);

      int v17 = 0;
    }
    else
    {
      int v17 = FigSignalErrorAt();
    }
  }
  else
  {
    int v17 = FigSignalErrorAt();
  }

  return v17;
}

- (int)getMotionCompensationEnabledForInputFrame:(id)a3 mcEnabled:(BOOL *)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    int v6 = 0;
    *a4 = 1;
  }
  else
  {
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

@end