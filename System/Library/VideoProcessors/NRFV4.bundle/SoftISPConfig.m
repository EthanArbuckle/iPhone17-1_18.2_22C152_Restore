@interface SoftISPConfig
- ($F61E096109CF133FD2477F48C7D0CEE7)maximumOutputDimensions;
- (NSArray)inputMTLPixelFormatForPlane;
- (NSArray)outputMTLPixelFormatForPlane;
- (NSDictionary)auxiliaryPixelFormats;
- (SoftISPConfig)initWithStaticParameters:(id)a3;
- (SoftISPStaticParameters)staticParameters;
- (id)description;
- (int)stageConfigMode;
- (int)validateInputFrame:(id)a3;
- (int)validateOutputFrame:(id)a3;
- (unsigned)inputPixelFormat;
- (unsigned)outputPixelFormat;
- (void)setAuxiliaryPixelFormats:(id)a3;
- (void)setInputMTLPixelFormatForPlane:(id)a3;
- (void)setInputPixelFormat:(unsigned int)a3;
- (void)setMaximumOutputDimensions:(id)a3;
- (void)setOutputMTLPixelFormatForPlane:(id)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setStageConfigMode:(int)a3;
@end

@implementation SoftISPConfig

- (SoftISPConfig)initWithStaticParameters:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SoftISPConfig;
  v6 = [(SoftISPConfig *)&v10 init];
  v7 = v6;
  if (v6 && v5)
  {
    objc_storeStrong((id *)&v6->_staticParameters, a3);
    v8 = v7;
  }
  else
  {
    FigDebugAssert3();
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v19 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned int inputPixelFormat = self->_inputPixelFormat;
  unsigned int outputPixelFormat = self->_outputPixelFormat;
  uint64_t v18 = HIBYTE(inputPixelFormat);
  uint64_t v17 = BYTE2(inputPixelFormat);
  uint64_t v7 = BYTE1(inputPixelFormat);
  uint64_t v8 = inputPixelFormat;
  uint64_t v9 = HIBYTE(outputPixelFormat);
  uint64_t v10 = BYTE2(outputPixelFormat);
  uint64_t v11 = BYTE1(outputPixelFormat);
  uint64_t v12 = outputPixelFormat;
  inputMTLPixelFormatForPlane = self->_inputMTLPixelFormatForPlane;
  v14 = [(NSArray *)self->_outputMTLPixelFormatForPlane cmi_arrayByApplyingComprehension:&__block_literal_global_18];
  v15 = [v19 stringWithFormat:@"%@(inputPixFmt=%c%c%c%c, inputMTLPixFmts=%@, outputPixFmt=%c%c%c%c, outputMTLPixFmts=%@, maxOutputDims=[%u, %u], stageConfigMode=%u)", v4, v18, v17, v7, v8, inputMTLPixelFormatForPlane, v9, v10, v11, v12, v14, *(unsigned int *)self->_anon_30, *(unsigned int *)&self->_anon_30[4], self->_stageConfigMode];

  return v15;
}

uint64_t __28__SoftISPConfig_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  [a2 integerValue];
  uint64_t Name = MTLPixelFormatGetName();

  return [v2 stringWithUTF8String:Name];
}

- (int)validateInputFrame:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (v6 = (__CVBuffer *)-[SoftISPInputFrame pixelBuffer]((uint64_t)v4)) != 0)
  {
    if (CVPixelBufferGetPixelFormatType(v6) == self->_inputPixelFormat) {
      int v7 = 0;
    }
    else {
      int v7 = -73712;
    }
  }
  else
  {
    int v7 = FigSignalErrorAt();
  }

  return v7;
}

- (int)validateOutputFrame:(id)a3
{
  int v4 = -73711;
  id v5 = a3;
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  int v7 = (__CVBuffer *)[v5 pixelBuffer];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = v7;
  if (CVPixelBufferGetPixelFormatType(v7) == self->_outputPixelFormat)
  {
    if (CVPixelBufferGetWidth(v8) <= *(unsigned int *)self->_anon_30
      && CVPixelBufferGetHeight(v8) <= *(unsigned int *)&self->_anon_30[4])
    {
      int v4 = 0;
      goto LABEL_7;
    }
LABEL_8:
    int v4 = FigSignalErrorAt();
  }
LABEL_7:

  return v4;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (void)setInputPixelFormat:(unsigned int)a3
{
  self->_unsigned int inputPixelFormat = a3;
}

- (NSArray)inputMTLPixelFormatForPlane
{
  return self->_inputMTLPixelFormatForPlane;
}

- (void)setInputMTLPixelFormatForPlane:(id)a3
{
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_unsigned int outputPixelFormat = a3;
}

- (NSArray)outputMTLPixelFormatForPlane
{
  return self->_outputMTLPixelFormatForPlane;
}

- (void)setOutputMTLPixelFormatForPlane:(id)a3
{
}

- ($F61E096109CF133FD2477F48C7D0CEE7)maximumOutputDimensions
{
  return *($F61E096109CF133FD2477F48C7D0CEE7 *)self->_anon_30;
}

- (void)setMaximumOutputDimensions:(id)a3
{
  *($F61E096109CF133FD2477F48C7D0CEE7 *)self->_anon_30 = a3;
}

- (NSDictionary)auxiliaryPixelFormats
{
  return self->_auxiliaryPixelFormats;
}

- (void)setAuxiliaryPixelFormats:(id)a3
{
}

- (int)stageConfigMode
{
  return self->_stageConfigMode;
}

- (void)setStageConfigMode:(int)a3
{
  self->_stageConfigMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryPixelFormats, 0);
  objc_storeStrong((id *)&self->_outputMTLPixelFormatForPlane, 0);
  objc_storeStrong((id *)&self->_inputMTLPixelFormatForPlane, 0);

  objc_storeStrong((id *)&self->_staticParameters, 0);
}

@end