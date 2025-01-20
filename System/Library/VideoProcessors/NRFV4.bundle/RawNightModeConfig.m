@interface RawNightModeConfig
- ($F61E096109CF133FD2477F48C7D0CEE7)maximumInputDimensions;
- ($F61E096109CF133FD2477F48C7D0CEE7)maximumOutputDimensions;
- (NSArray)inputMTLPixelFormatForPlane;
- (NSArray)outputMTLPixelFormatForPlane;
- (RawNightModeConfig)init;
- (id)description;
- (int)validateInputFrame:(id)a3;
- (int)validateOutputFrame:(id)a3;
- (unsigned)inputPixelFormat;
- (unsigned)outputPixelFormat;
- (void)setInputMTLPixelFormatForPlane:(id)a3;
- (void)setInputPixelFormat:(unsigned int)a3;
- (void)setMaximumInputDimensions:(id)a3;
- (void)setMaximumOutputDimensions:(id)a3;
- (void)setOutputMTLPixelFormatForPlane:(id)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
@end

@implementation RawNightModeConfig

- (RawNightModeConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModeConfig;
  v2 = [(RawNightModeConfig *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    FigDebugAssert3();
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int inputPixelFormat = self->_inputPixelFormat;
  return (id)[v3 stringWithFormat:@"<%@ %p> InputPixFmt='%c%c%c%c', maxInputDims=[%u, %u], outputPixFmt='%c%c%c%c', maxOutputDims=[%u, %u]"], v4, self, HIBYTE(inputPixelFormat), BYTE2(inputPixelFormat), BYTE1(inputPixelFormat), inputPixelFormat, *(unsigned int *)self->_anon_18, *(unsigned int *)&self->_anon_18[4], HIBYTE(self->_outputPixelFormat), BYTE2(self->_outputPixelFormat), BYTE1(self->_outputPixelFormat), self->_outputPixelFormat, LODWORD(self[1].super.isa), HIDWORD(self[1].super.isa));
}

- (int)validateInputFrame:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  objc_super v6 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)v4);
  if (!v6) {
    goto LABEL_8;
  }
  v7 = v6;
  if (CVPixelBufferGetPixelFormatType(v6) != self->_inputPixelFormat)
  {
    int v8 = -28624;
    goto LABEL_7;
  }
  if (CVPixelBufferGetWidth(v7) <= *(unsigned int *)self->_anon_18
    && CVPixelBufferGetHeight(v7) <= *(unsigned int *)&self->_anon_18[4])
  {
    int v8 = 0;
  }
  else
  {
LABEL_8:
    int v8 = FigSignalErrorAt();
  }
LABEL_7:

  return v8;
}

- (int)validateOutputFrame:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = [v4 pixelBuffer];
  if (!v6) {
    goto LABEL_11;
  }
  v7 = (__CVBuffer *)v6;
  uint64_t v8 = [v5 noiseMapPixelBuffer];
  if (!v8) {
    goto LABEL_11;
  }
  v9 = (__CVBuffer *)v8;
  if (CVPixelBufferGetPixelFormatType(v7) != self->_outputPixelFormat)
  {
    int v12 = -28625;
    goto LABEL_10;
  }
  if (CVPixelBufferGetWidth(v7) <= LODWORD(self[1].super.isa)
    && CVPixelBufferGetHeight(v7) <= HIDWORD(self[1].super.isa)
    && (size_t Width = CVPixelBufferGetWidth(v7), Width == CVPixelBufferGetWidth(v9))
    && (size_t Height = CVPixelBufferGetHeight(v7), Height == CVPixelBufferGetHeight(v9)))
  {
    int v12 = 0;
  }
  else
  {
LABEL_11:
    int v12 = FigSignalErrorAt();
  }
LABEL_10:

  return v12;
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

- ($F61E096109CF133FD2477F48C7D0CEE7)maximumInputDimensions
{
  return *($F61E096109CF133FD2477F48C7D0CEE7 *)self->_anon_18;
}

- (void)setMaximumInputDimensions:(id)a3
{
  *($F61E096109CF133FD2477F48C7D0CEE7 *)self->_anon_18 = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
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
  return ($F61E096109CF133FD2477F48C7D0CEE7)self[1].super.isa;
}

- (void)setMaximumOutputDimensions:(id)a3
{
  self[1].super.isa = (Class)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMTLPixelFormatForPlane, 0);

  objc_storeStrong((id *)&self->_inputMTLPixelFormatForPlane, 0);
}

@end