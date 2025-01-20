@interface H13FastOutlierPixelCorrectionConfig
- (H13FastOutlierPixelCorrectionConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (int)getOutlierPixelCorrectionConfig:(OutlierPixelCorrectionConfig *)a3 forInputFrame:(id)a4;
@end

@implementation H13FastOutlierPixelCorrectionConfig

- (H13FastOutlierPixelCorrectionConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)H13FastOutlierPixelCorrectionConfig;
  self = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (int)getOutlierPixelCorrectionConfig:(OutlierPixelCorrectionConfig *)a3 forInputFrame:(id)a4
{
  id v6 = a4;
  uint64_t v7 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  id v8 = (void *)v7;
  char v29 = 0;
  if (!a3 || !v7)
  {
    int v27 = FigSignalErrorAt();
    v10 = 0;
LABEL_27:
    v17 = 0;
    id v20 = 0;
    v21 = 0;
    goto LABEL_21;
  }
  id v9 = -[SoftISPInputFrame processingOptions]((uint64_t)v6);
  v10 = v9;
  if (!v9)
  {
    FigDebugAssert3();
LABEL_26:
    int v27 = FigSignalErrorAt();
    goto LABEL_27;
  }
  int v11 = objc_msgSend(v9, "cmi_BOOLValueForKey:defaultValue:found:", @"OPC", 0, 0);
  a3->var0 = v11;
  if (v11)
  {
    unsigned int v12 = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v29);
    if (v29)
    {
      unsigned int v13 = v12;
      unsigned int v14 = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, &v29);
      if (v29)
      {
        unsigned int v15 = v14;
        v16 = [(SoftISPConfig *)self staticParameters];
        v17 = [v16 tuningParametersForInputFrameMetadata:v8 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v6)];

        if (!v17) {
          FigSignalErrorAt();
        }
        v18 = [v17 objectForKeyedSubscript:@"OutlierPixelCorrection"];
        v19 = v18;
        if (!v18)
        {
          FigSignalErrorAt();
          v19 = (void *)MEMORY[0x263EFFA78];
        }
        id v20 = v19;

        v21 = [v20 objectForKeyedSubscript:@"Gamma"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          *(float *)&double v22 = (float)((float)v13 * 0.0039062) * (float)((float)v15 * 0.0039062);
          objc_msgSend(v21, "cmi_interpolateValueForGain:", v22);
          float v24 = v23;
        }
        else
        {
          LODWORD(v22) = 3.0;
          objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"Gamma", &v29, v22);
          float v24 = v25;
          if (!v29) {
            FigSignalErrorAt();
          }
        }
        a3->var2 = v24;
        if (v24 >= 100.0) {
          a3->var0 = 0;
        }
        unsigned int var1 = objc_msgSend(v20, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Skip", 2, &v29);
        a3->unsigned int var1 = var1;
        if (!v29)
        {
          FigSignalErrorAt();
          unsigned int var1 = a3->var1;
        }
        if (var1 - 3 <= 0xFFFFFFFD)
        {
          FigDebugAssert3();
          int v27 = FigSignalErrorAt();
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    FigDebugAssert3();
    goto LABEL_26;
  }
  v17 = 0;
  id v20 = 0;
  v21 = 0;
LABEL_20:
  int v27 = 0;
LABEL_21:

  return v27;
}

@end