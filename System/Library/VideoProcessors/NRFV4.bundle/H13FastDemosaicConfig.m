@interface H13FastDemosaicConfig
- (BOOL)outputGammaEncoded;
- (H13FastDemosaicConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5 outputGammaEncoded:(BOOL)a6;
- (H13FastDemosaicConfigMetal)cfgMTL;
- (int)getDemosaicConfigForInputFrame:(id)a3 demosaicConfig:(id *)a4;
- (void)setCfgMTL:(id)a3;
@end

@implementation H13FastDemosaicConfig

- (H13FastDemosaicConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5 outputGammaEncoded:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (!v10 || !v11 || !v7) {
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)H13FastDemosaicConfig;
  self = [(SoftISPConfig *)&v18 initWithStaticParameters:v10];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v12 maximumWidth] | ((unint64_t)objc_msgSend(v12, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v7];
  v13 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v13];

  v14 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v14
    || (v15 = (H13FastDemosaicConfigMetal *)objc_opt_new(),
        cfgMTL = self->_cfgMTL,
        self->_cfgMTL = v15,
        cfgMTL,
        !self->_cfgMTL))
  {
LABEL_13:
    FigDebugAssert3();

    self = 0;
    goto LABEL_8;
  }
  self->_outputGammaEncoded = a6;
LABEL_8:

  return self;
}

- (H13FastDemosaicConfigMetal)cfgMTL
{
  return self->_cfgMTL;
}

- (void)setCfgMTL:(id)a3
{
}

- (BOOL)outputGammaEncoded
{
  return self->_outputGammaEncoded;
}

- (void).cxx_destruct
{
}

- (int)getDemosaicConfigForInputFrame:(id)a3 demosaicConfig:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && (-[SoftISPInputFrame metadata]((uint64_t)v6), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    if (-[SoftISPInputFrame firstPixel]((uint64_t)v7) != 1
      && -[SoftISPInputFrame firstPixel]((uint64_t)v7) != 2)
    {
      goto LABEL_13;
    }
    if (!a4) {
      goto LABEL_13;
    }
    *(_OWORD *)&a4[4].var0 = 0u;
    *(_OWORD *)&a4[5].var5 = 0u;
    *(_OWORD *)&a4[1].var5 = 0u;
    *(_OWORD *)&a4[2].var6 = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    id v10 = -[SoftISPInputFrame processingOptions]((uint64_t)v7);
    uint64_t v11 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyCCM", 0, 0);

    v12 = [(H13FastDemosaicConfig *)self cfgMTL];
    v13 = [(SoftISPConfig *)self staticParameters];
    v14 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v13);
    LODWORD(v10) = [v12 getDemosaicConfigForInputFrameMetadata:v9 cameraInfoByPortType:v14 applyCCM:v11 zeroBias:-[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v7) demosaicConfig:a4];

    if (!v10)
    {
      if ([(H13FastDemosaicConfig *)self outputGammaEncoded])
      {
        a4[5].var5 = 1;
      }
      else
      {
        v15 = -[SoftISPInputFrame processingOptions]((uint64_t)v7);
        a4[5].var5 = objc_msgSend(v15, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0);
      }
      a4->var0 = -[SoftISPInputFrame firstPixel]((uint64_t)v7) == 2;
      a4[5].var6 = -[SoftISPInputFrame cfaLayout]((uint64_t)v7) == 3;
      a4[5].var7 = -[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v7);

      int v16 = 0;
    }
    else
    {
LABEL_13:
      FigDebugAssert3();
      int v16 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

@end