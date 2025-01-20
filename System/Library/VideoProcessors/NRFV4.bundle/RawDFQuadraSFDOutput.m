@interface RawDFQuadraSFDOutput
- (MTLTexture)outputUV;
- (MTLTexture)outputY;
- (double)ltmGridScaling;
- (void)setLtmGridScaling:(RawDFQuadraSFDOutput *)self;
- (void)setOutputUV:(id)a3;
- (void)setOutputY:(id)a3;
@end

@implementation RawDFQuadraSFDOutput

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

- (double)ltmGridScaling
{
  return *(double *)(a1 + 24);
}

- (void)setLtmGridScaling:(RawDFQuadraSFDOutput *)self
{
  *(void *)self->_ltmGridScaling = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputUV, 0);

  objc_storeStrong((id *)&self->_outputY, 0);
}

@end