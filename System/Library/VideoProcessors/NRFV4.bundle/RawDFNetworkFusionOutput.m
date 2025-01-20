@interface RawDFNetworkFusionOutput
- (MTLTexture)outputUV;
- (MTLTexture)outputY;
- (void)setOutputUV:(id)a3;
- (void)setOutputY:(id)a3;
@end

@implementation RawDFNetworkFusionOutput

- (MTLTexture)outputY
{
  return self->_outputY;
}

- (void)setOutputY:(id)a3
{
}

- (MTLTexture)outputUV
{
  return self->_outputUV;
}

- (void)setOutputUV:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputUV, 0);

  objc_storeStrong((id *)&self->_outputY, 0);
}

@end