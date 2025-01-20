@interface RawDFDownsampleRequest
- (BOOL)relaxDimensionRequirement;
- (MTLTexture)outputTex;
- (NSString)outputTexLabel;
- (int)outputType;
- (unint64_t)downsampleLevel;
- (void)dealloc;
- (void)releaseOutputTexture;
- (void)setDownsampleLevel:(unint64_t)a3;
- (void)setOutputTex:(id)a3;
- (void)setOutputTexLabel:(id)a3;
- (void)setOutputType:(int)a3;
- (void)setRelaxDimensionRequirement:(BOOL)a3;
@end

@implementation RawDFDownsampleRequest

- (void)dealloc
{
  [(RawDFDownsampleRequest *)self releaseOutputTexture];
  v3.receiver = self;
  v3.super_class = (Class)RawDFDownsampleRequest;
  [(RawDFDownsampleRequest *)&v3 dealloc];
}

- (void)releaseOutputTexture
{
}

- (unint64_t)downsampleLevel
{
  return self->_downsampleLevel;
}

- (void)setDownsampleLevel:(unint64_t)a3
{
  self->_downsampleLevel = a3;
}

- (int)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(int)a3
{
  self->_outputType = a3;
}

- (BOOL)relaxDimensionRequirement
{
  return self->_relaxDimensionRequirement;
}

- (void)setRelaxDimensionRequirement:(BOOL)a3
{
  self->_relaxDimensionRequirement = a3;
}

- (NSString)outputTexLabel
{
  return self->_outputTexLabel;
}

- (void)setOutputTexLabel:(id)a3
{
}

- (MTLTexture)outputTex
{
  return self->_outputTex;
}

- (void)setOutputTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTex, 0);

  objc_storeStrong((id *)&self->_outputTexLabel, 0);
}

@end