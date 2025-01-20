@interface RawDFSyntheticReferenceOutput
- (MTLTexture)fusionMap;
- (MTLTexture)outputSyntheticReference;
- (void)setFusionMap:(id)a3;
- (void)setOutputSyntheticReference:(id)a3;
@end

@implementation RawDFSyntheticReferenceOutput

- (MTLTexture)outputSyntheticReference
{
  return self->_outputSyntheticReference;
}

- (void)setOutputSyntheticReference:(id)a3
{
}

- (MTLTexture)fusionMap
{
  return self->_fusionMap;
}

- (void)setFusionMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionMap, 0);

  objc_storeStrong((id *)&self->_outputSyntheticReference, 0);
}

@end