@interface RawNightModePostNetworkTuningParams
- (BOOL)enableClippingAddbackModulation;
- (BOOL)enableLSCAddbackModulation;
- (BOOL)enableOutlierPixelCorrection;
- (BOOL)enableSNRModulation;
- (RawNightModeDenoiseAddBackParams)addbackParams;
- (float)clippingLowerBound;
- (float)clippingUpperBound;
- (float)skyMaskThresholdTargetGain;
- (int)getAddBackParams:(RawNightModeDenoiseAddBackParams *)a3 forBand:(unsigned int)a4 gain:(float)a5;
- (int)getAddBackParams:(RawNightModeDenoiseAddBackParams)a3[4] forGain:(float)a4;
- (int)getBiasCorrectionParams:(RawNightModeBiasCorrectionParams *)a3 gain:(float)a4;
- (int)getOutlierPixelCorrectionParameters:(RawNightModeOutlierPixelCorrectionParams *)a3;
- (int)readPlist:(id)a3;
@end

@implementation RawNightModePostNetworkTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
  char v72 = 0;
  v71.receiver = self;
  v71.super_class = (Class)RawNightModePostNetworkTuningParams;
  [(CMITuningPlist *)&v71 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"NetworkParameters"];
  v6 = [v5 objectForKeyedSubscript:@"PostNetwork"];

  if (!v6)
  {
    FigDebugAssert3();
    v8 = 0;
    v18 = 0;
    v7 = 0;
    goto LABEL_47;
  }
  v7 = [v6 objectForKeyedSubscript:@"DNRBiasCorrection"];
  v8 = [v6 objectForKeyedSubscript:@"OutlierPixelCorrection"];
  if (!v8)
  {
    FigDebugAssert3();
    v18 = 0;
    goto LABEL_47;
  }
  self->_enableDNRBiasCorrection = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableDNRBiasCorrection", 0, 0);
  self->_enableLocalBiasCorrection = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", @"UseLocalBiasCorrection", 0, 0);
  v9 = [v7 objectForKeyedSubscript:@"DNRBiasCorrectionStrength"];
  id dnrBiasCorrectionStrength = self->_dnrBiasCorrectionStrength;
  self->_id dnrBiasCorrectionStrength = v9;

  v11 = [v7 objectForKeyedSubscript:@"DNRBiasThreshold"];
  id dnrBiasThreshold = self->_dnrBiasThreshold;
  self->_id dnrBiasThreshold = v11;

  self->_enableLocalBiasCorrectionGuidedFilter = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", @"UseGuidedFilter", 0, 0);
  v13 = [v7 objectForKeyedSubscript:@"GuidedFilterSpatialSigma"];
  id biasCorrectionGuidedFilterSpatialSigma = self->_biasCorrectionGuidedFilterSpatialSigma;
  self->_id biasCorrectionGuidedFilterSpatialSigma = v13;

  v15 = [v7 objectForKeyedSubscript:@"GuidedFilterIntensitySigma"];
  id biasCorrectionGuidedFilterIntensitySigma = self->_biasCorrectionGuidedFilterIntensitySigma;
  self->_id biasCorrectionGuidedFilterIntensitySigma = v15;

  v17 = [v6 objectForKeyedSubscript:@"Addback"];
  v18 = v17;
  if (!v17) {
    goto LABEL_46;
  }
  self->_enableLSCAddbackModulation = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableLSCModulation", 0, 0);
  self->_enableSNRModulation = objc_msgSend(v18, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableSNRModulation", 0, &v72);
  if (!v72) {
    goto LABEL_46;
  }
  v64 = v8;
  v65 = v7;
  v66 = v6;
  id v67 = v4;
  objc_msgSend(v18, "cmi_floatValueForKey:defaultValue:found:", @"SkyAddbackThresholdTargetGain", 0, 0.0);
  uint64_t v19 = 0;
  int v68 = 0;
  self->_skyMaskThresholdTargetGain = v20;
  v21 = @"Bands";
  unint64_t v22 = 0x263EFF000uLL;
  v70 = self;
  do
  {
    v23 = objc_msgSend(v18, "objectForKeyedSubscript:", v21, v61, v62);
    v24 = [v23 objectAtIndexedSubscript:v19];
    v25 = [v24 objectForKeyedSubscript:@"LumaAddBackWeight"];

    if (!v25)
    {
      uint64_t v62 = v63;
      LODWORD(v61) = 0;
LABEL_24:
      FigDebugAssert3();
      int v68 = FigSignalErrorAt();
LABEL_28:
      char v52 = 0;
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v62 = v63;
      LODWORD(v61) = 0;
      goto LABEL_24;
    }
    v26 = (NSArray *)[v25 copy];
    v27 = self->_lumaAddBackWeight[v19];
    self->_lumaAddBackWeight[v19] = v26;

    v28 = [v18 objectForKeyedSubscript:v21];
    v29 = [v28 objectAtIndexedSubscript:v19];
    v30 = [v29 objectForKeyedSubscript:@"LumaAddBackWeightBiasForBody"];

    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v62 = v63;
        LODWORD(v61) = 0;
        FigDebugAssert3();
        int v68 = FigSignalErrorAt();
LABEL_27:

        goto LABEL_28;
      }
    }
    v31 = (NSArray *)[v30 copy];
    v32 = self->_lumaAddBackWeightBiasForBody[v19];
    self->_lumaAddBackWeightBiasForBody[v19] = v31;

    v33 = [v18 objectForKeyedSubscript:v21];
    v34 = [v33 objectAtIndexedSubscript:v19];
    v35 = [v34 objectForKeyedSubscript:@"LumaAddBackWeightBiasForSkin"];

    if (v35)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v62 = v63;
        LODWORD(v61) = 0;
        FigDebugAssert3();
        int v68 = FigSignalErrorAt();

        goto LABEL_27;
      }
    }
    v69 = v25;
    unint64_t v36 = v22;
    v37 = (NSArray *)[v35 copy];
    v38 = self->_lumaAddBackWeightBiasForSkin[v19];
    self->_lumaAddBackWeightBiasForSkin[v19] = v37;

    v39 = [v18 objectForKeyedSubscript:v21];
    v40 = [v39 objectAtIndexedSubscript:v19];
    v41 = [v40 objectForKeyedSubscript:@"LumaAddBackWeightBiasForSky"];

    if (v41 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v62 = v63;
      LODWORD(v61) = 0;
      FigDebugAssert3();
      int v68 = FigSignalErrorAt();

      char v52 = 0;
      unint64_t v22 = v36;
    }
    else
    {
      v42 = (NSArray *)[v41 copy];
      v43 = self->_lumaAddBackWeightBiasForSky[v19];
      self->_lumaAddBackWeightBiasForSky[v19] = v42;

      v44 = v18;
      v45 = v18;
      v46 = v21;
      v47 = [v45 objectForKeyedSubscript:v21];
      v48 = [v47 objectAtIndexedSubscript:v19];
      v49 = [v48 objectForKeyedSubscript:@"LumaAddBackLSCScaling"];

      unint64_t v22 = v36;
      if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v62 = v63;
        LODWORD(v61) = 0;
        FigDebugAssert3();
        int v68 = FigSignalErrorAt();

        char v52 = 0;
      }
      else
      {
        uint64_t v50 = [v49 copy];
        v51 = v70->_lumaAddBackLSCModulationWeight[v19];
        v70->_lumaAddBackLSCModulationWeight[v19] = (NSArray *)v50;

        char v52 = 1;
      }
      v21 = v46;
      v18 = v44;
    }
    v25 = v69;
LABEL_19:

    if ((v52 & 1) == 0)
    {
      v6 = v66;
      id v4 = v67;
      v8 = v64;
      v7 = v65;
LABEL_39:
      int v59 = v68;
      goto LABEL_40;
    }
    ++v19;
    self = v70;
  }
  while (v19 != 4);
  v8 = v64;
  char v53 = objc_msgSend(v64, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v72);
  v70->_opcEnabled = v53;
  if (v72)
  {
    v70->_enableOutlierPixelCorrection = v53;
    v70->_opcWindowSize = objc_msgSend(v64, "cmi_intValueForKey:defaultValue:found:", @"WindowSize", 5, &v72);
    v6 = v66;
    id v4 = v67;
    v7 = v65;
    if (v72)
    {
      LODWORD(v54) = 10.0;
      objc_msgSend(v64, "cmi_floatValueForKey:defaultValue:found:", @"Gamma", &v72, v54);
      v70->_opcGamma = (int)v55;
      if (v72)
      {
        v70->_opcSkip = objc_msgSend(v64, "cmi_intValueForKey:defaultValue:found:", @"Skip", 0, &v72);
        if (v72)
        {
          v70->_enableClippingAddbackModulation = objc_msgSend(v18, "cmi_BOOLValueForKey:defaultValue:found:", @"AddbackModulationEnabled", 0, &v72);
          if (v72)
          {
            LODWORD(v56) = 1045220557;
            objc_msgSend(v18, "cmi_floatValueForKey:defaultValue:found:", @"ClippingLowerBound", &v72, v56);
            v70->_clippingLowerBound = *(float *)&v57;
            if (v72)
            {
              LODWORD(v57) = 1050253722;
              objc_msgSend(v18, "cmi_floatValueForKey:defaultValue:found:", @"ClippingUpperBound", &v72, v57);
              v70->_clippingUpperBound = v58;
              if (v72) {
                goto LABEL_39;
              }
            }
          }
        }
      }
    }
LABEL_46:
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    v6 = v66;
    id v4 = v67;
    v7 = v65;
  }
LABEL_47:
  int v59 = FigSignalErrorAt();
LABEL_40:

  return v59;
}

- (int)getBiasCorrectionParams:(RawNightModeBiasCorrectionParams *)a3 gain:(float)a4
{
  if (a3)
  {
    a3->enableDNRBiasCorrection = self->_enableDNRBiasCorrection;
    a3->enableLocalBiasCorrection = self->_enableLocalBiasCorrection;
    a3->enableLocalBiasCorrectionGuidedFilter = self->_enableLocalBiasCorrectionGuidedFilter;
    float v7 = 1.0;
    LODWORD(v8) = 1.0;
    if (self->_dnrBiasCorrectionStrength)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v9 = a4;
        objc_msgSend(self->_dnrBiasCorrectionStrength, "cmi_interpolateValueForGain:", v9);
      }
      else
      {
        LODWORD(v8) = 1.0;
        if (self->_dnrBiasCorrectionStrength)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          LODWORD(v8) = 1.0;
          if (isKindOfClass) {
            objc_msgSend(self->_dnrBiasCorrectionStrength, "floatValue", v8);
          }
        }
      }
    }
    a3->id dnrBiasCorrectionStrength = *(float *)&v8;
    if (self->_dnrBiasThreshold)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v11 = a4;
        objc_msgSend(self->_dnrBiasThreshold, "cmi_interpolateValueForGain:", v11);
LABEL_14:
        float v7 = v12;
        goto LABEL_15;
      }
      if (self->_dnrBiasThreshold)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [self->_dnrBiasThreshold floatValue];
          goto LABEL_14;
        }
      }
    }
LABEL_15:
    a3->id dnrBiasThreshold = v7;
    if (self->_biasCorrectionGuidedFilterSpatialSigma)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v13 = a4;
        objc_msgSend(self->_biasCorrectionGuidedFilterSpatialSigma, "cmi_interpolateValueForGain:", v13);
LABEL_21:
        int v15 = (int)v14;
        goto LABEL_23;
      }
      if (self->_biasCorrectionGuidedFilterSpatialSigma)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [self->_biasCorrectionGuidedFilterSpatialSigma floatValue];
          goto LABEL_21;
        }
      }
    }
    LOWORD(v15) = 3;
LABEL_23:
    a3->guidedFilterSpatialSigma = v15;
    if (self->_biasCorrectionGuidedFilterIntensitySigma)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v16 = a4;
        objc_msgSend(self->_biasCorrectionGuidedFilterIntensitySigma, "cmi_interpolateValueForGain:", v16);
LABEL_29:
        a3->guidedFilterIntensitySigma = v17;
        return 0;
      }
      if (self->_biasCorrectionGuidedFilterIntensitySigma)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [self->_biasCorrectionGuidedFilterIntensitySigma floatValue];
          goto LABEL_29;
        }
      }
    }
    a3->guidedFilterIntensitySigma = 5.0;
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)getAddBackParams:(RawNightModeDenoiseAddBackParams)a3[4] forGain:(float)a4
{
  uint64_t v7 = 0;
  while (1)
  {
    *(float *)&double v8 = a4;
    int v9 = [(RawNightModePostNetworkTuningParams *)self getAddBackParams:a3 forBand:v7 gain:v8];
    if (v9) {
      break;
    }
    ++v7;
    ++a3;
    if (v7 == 4) {
      return v9;
    }
  }
  FigDebugAssert3();
  return v9;
}

- (int)getAddBackParams:(RawNightModeDenoiseAddBackParams *)a3 forBand:(unsigned int)a4 gain:(float)a5
{
  if (a3)
  {
    -[NSArray cmi_interpolateValueForGain:](self->_lumaAddBackWeight[a4], "cmi_interpolateValueForGain:");
    a3->var0 = v9;
    *(float *)&double v10 = a5;
    [(NSArray *)self->_lumaAddBackWeightBiasForBody[a4] cmi_interpolateValueForGain:v10];
    a3->var1 = v11;
    *(float *)&double v12 = a5;
    [(NSArray *)self->_lumaAddBackWeightBiasForSkin[a4] cmi_interpolateValueForGain:v12];
    a3->var2 = v13;
    *(float *)&double v14 = a5;
    [(NSArray *)self->_lumaAddBackWeightBiasForSky[a4] cmi_interpolateValueForGain:v14];
    a3->var3 = *(float *)&v15;
    double v16 = self->_lumaAddBackLSCModulationWeight[a4];
    if (v16)
    {
      *(float *)&double v15 = a5;
      [(NSArray *)v16 cmi_interpolateValueForGain:v15];
      a3->var4 = v17;
    }
    else
    {
      a3->var4 = 1.0;
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)getOutlierPixelCorrectionParameters:(RawNightModeOutlierPixelCorrectionParams *)a3
{
  a3->var0 = self->_opcEnabled;
  a3->var2 = self->_opcWindowSize;
  a3->var3 = (float)self->_opcGamma;
  int opcSkip = self->_opcSkip;
  a3->var1 = opcSkip;
  if (opcSkip < 3) {
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (RawNightModeDenoiseAddBackParams)addbackParams
{
  return self->_addbackParams;
}

- (BOOL)enableSNRModulation
{
  return self->_enableSNRModulation;
}

- (BOOL)enableOutlierPixelCorrection
{
  return self->_enableOutlierPixelCorrection;
}

- (float)skyMaskThresholdTargetGain
{
  return self->_skyMaskThresholdTargetGain;
}

- (BOOL)enableClippingAddbackModulation
{
  return self->_enableClippingAddbackModulation;
}

- (float)clippingLowerBound
{
  return self->_clippingLowerBound;
}

- (float)clippingUpperBound
{
  return self->_clippingUpperBound;
}

- (BOOL)enableLSCAddbackModulation
{
  return self->_enableLSCAddbackModulation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_biasCorrectionGuidedFilterIntensitySigma, 0);
  objc_storeStrong(&self->_biasCorrectionGuidedFilterSpatialSigma, 0);
  objc_storeStrong(&self->_dnrBiasThreshold, 0);
  objc_storeStrong(&self->_dnrBiasCorrectionStrength, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_lumaAddBackLSCModulationWeight[i], 0);
  for (uint64_t j = 3; j != -1; --j)
    objc_storeStrong((id *)&self->_lumaAddBackWeightBiasForSky[j], 0);
  for (uint64_t k = 3; k != -1; --k)
    objc_storeStrong((id *)&self->_lumaAddBackWeightBiasForSkin[k], 0);
  for (uint64_t m = 3; m != -1; --m)
    objc_storeStrong((id *)&self->_lumaAddBackWeightBiasForBody[m], 0);
  lumaAddBackWeight = self->_lumaAddBackWeight;
  for (uint64_t n = 3; n != -1; --n)
    objc_storeStrong((id *)&lumaAddBackWeight[n], 0);
}

@end