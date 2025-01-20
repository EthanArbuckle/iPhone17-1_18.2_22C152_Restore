@interface RawDFSyntheticLongOutput
- (MTLTexture)noiseDivisorSyntheticEV0;
- (MTLTexture)noiseDivisorSyntheticLong;
- (MTLTexture)outputSyntheticLong;
- (unint64_t)ev0Count;
- (void)setEv0Count:(unint64_t)a3;
- (void)setNoiseDivisorSyntheticEV0:(id)a3;
- (void)setNoiseDivisorSyntheticLong:(id)a3;
- (void)setOutputSyntheticLong:(id)a3;
@end

@implementation RawDFSyntheticLongOutput

- (MTLTexture)outputSyntheticLong
{
  return self->_outputSyntheticLong;
}

- (void)setOutputSyntheticLong:(id)a3
{
}

- (MTLTexture)noiseDivisorSyntheticEV0
{
  return self->_noiseDivisorSyntheticEV0;
}

- (void)setNoiseDivisorSyntheticEV0:(id)a3
{
}

- (MTLTexture)noiseDivisorSyntheticLong
{
  return self->_noiseDivisorSyntheticLong;
}

- (void)setNoiseDivisorSyntheticLong:(id)a3
{
}

- (unint64_t)ev0Count
{
  return self->_ev0Count;
}

- (void)setEv0Count:(unint64_t)a3
{
  self->_ev0Count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseDivisorSyntheticLong, 0);
  objc_storeStrong((id *)&self->_noiseDivisorSyntheticEV0, 0);

  objc_storeStrong((id *)&self->_outputSyntheticLong, 0);
}

@end