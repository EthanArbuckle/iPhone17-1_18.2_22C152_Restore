@interface H13FastPostDemosaicProcConfig
- (H13FastPostDemosaicProcConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (H13FastPostDemosaicProcConfigMetal)cfgMTL;
- (int)getPostDemosaicProcConfigForInputFrame:(id)a3 postDemosaicProcConfig:(id *)a4 chromaSuppressionConfig:(ChromaSupressionStruct *)a5;
- (void)setCfgMTL:(id)a3;
@end

@implementation H13FastPostDemosaicProcConfig

- (int)getPostDemosaicProcConfigForInputFrame:(id)a3 postDemosaicProcConfig:(id *)a4 chromaSuppressionConfig:(ChromaSupressionStruct *)a5
{
  id v8 = a3;
  v9 = v8;
  char v33 = 0;
  if (!v8 || (-[SoftISPInputFrame metadata]((uint64_t)v8), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v11 = (void *)v10;
  if (!a4 || (bzero(a4, 0x4D0uLL), !a5))
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
LABEL_30:

    goto LABEL_17;
  }
  bzero(a5, 0x840uLL);
  v12 = [(SoftISPConfig *)self staticParameters];
  v13 = [v12 tuningParametersForInputFrameMetadata:v11 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v9)];

  if (!v13) {
    FigSignalErrorAt();
  }
  v14 = [v13 objectForKeyedSubscript:@"PostDemosaic"];
  v15 = v14;
  if (!v14)
  {
    FigSignalErrorAt();
    v15 = (void *)MEMORY[0x263EFFA78];
  }
  id v16 = v15;

  v17 = objc_opt_new();
  if (!v17)
  {
    int v30 = FigSignalErrorAt();
LABEL_29:

    goto LABEL_30;
  }
  v18 = v17;
  int v19 = [v17 readPlist:v16];
  if (v19)
  {
    int v30 = v19;
LABEL_26:
    FigDebugAssert3();
LABEL_28:

    goto LABEL_29;
  }
  unsigned int v20 = objc_msgSend(v11, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, &v33);
  if (!v33) {
    goto LABEL_27;
  }
  unsigned int v21 = v20;
  unsigned int v22 = objc_msgSend(v11, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v33);
  if (!v33) {
    goto LABEL_27;
  }
  *(float *)&double v23 = (float)((float)v21 * 0.0039062) * (float)((float)v22 * 0.0039062);
  int v24 = [v18 updateConfigWithGain:v23];
  if (v24)
  {
    int v30 = v24;
    goto LABEL_26;
  }
  [v18 config];
  memcpy(a4, __src, 0x4B0uLL);
  int v25 = +[H13FastPostDemosaicProcConfigMetal getChromaSuppressionConfigInputFrameMetadata:v11 tuningControls:a4 chromaSuppressionConfig:a5];
  if (v25)
  {
    int v30 = v25;
    goto LABEL_26;
  }
  v26 = -[SoftISPInputFrame processingOptions]((uint64_t)v9);

  if (!v26)
  {
LABEL_27:
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_28;
  }
  v27 = -[SoftISPInputFrame processingOptions]((uint64_t)v9);
  a4->var0.var1 = objc_msgSend(v27, "cmi_BOOLValueForKey:defaultValue:found:", @"DotFix", a4->var0.var1, 0);

  v28 = -[SoftISPInputFrame processingOptions]((uint64_t)v9);
  a4->var0.var2 = objc_msgSend(v28, "cmi_BOOLValueForKey:defaultValue:found:", @"DirLP", a4->var0.var2, 0);

  v29 = -[SoftISPInputFrame processingOptions]((uint64_t)v9);
  a4->var0.var3 = objc_msgSend(v29, "cmi_BOOLValueForKey:defaultValue:found:", @"CS", a4->var0.var3, 0);

  int v30 = 0;
LABEL_17:

  return v30;
}

- (H13FastPostDemosaicProcConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)H13FastPostDemosaicProcConfig;
  self = [(SoftISPConfig *)&v16 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12
    || (v13 = (H13FastPostDemosaicProcConfigMetal *)objc_opt_new(),
        cfgMTL = self->_cfgMTL,
        self->_cfgMTL = v13,
        cfgMTL,
        !self->_cfgMTL))
  {
LABEL_12:
    FigDebugAssert3();

    self = 0;
  }
LABEL_7:

  return self;
}

- (H13FastPostDemosaicProcConfigMetal)cfgMTL
{
  return self->_cfgMTL;
}

- (void)setCfgMTL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end