@interface H13FastLTMConfig
- (H13FastLTMConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (id)getLTMSettingsForInputFrame:(id)a3;
@end

@implementation H13FastLTMConfig

- (H13FastLTMConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)H13FastLTMConfig;
  self = [(SoftISPConfig *)&v15 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:v11];

  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v12 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v12];

  v13 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v13)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (id)getLTMSettingsForInputFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && (-[SoftISPInputFrame metadata]((uint64_t)v4), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    id v8 = [(SoftISPConfig *)self staticParameters];
    id v9 = [v8 tuningParametersForInputFrameMetadata:v7 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v5)];

    if (!v9) {
      FigSignalErrorAt();
    }
    v10 = [v9 objectForKeyedSubscript:@"LTM"];
  }
  else
  {
    FigSignalErrorAt();
    v10 = 0;
  }

  return v10;
}

@end