@interface TCMLCharGraphDescriptor
- (NSDictionary)additionDescs;
- (NSDictionary)averagePoolDesc;
- (NSDictionary)batchNormDescs;
- (NSDictionary)catDescs;
- (NSDictionary)chunkDescs;
- (NSDictionary)convDescs;
- (NSDictionary)dropoutDescs;
- (NSDictionary)transposeDescs;
- (void)setAdditionDescs:(id)a3;
- (void)setAveragePoolDesc:(id)a3;
- (void)setBatchNormDescs:(id)a3;
- (void)setCatDescs:(id)a3;
- (void)setChunkDescs:(id)a3;
- (void)setConvDescs:(id)a3;
- (void)setDropoutDescs:(id)a3;
- (void)setTransposeDescs:(id)a3;
@end

@implementation TCMLCharGraphDescriptor

- (NSDictionary)additionDescs
{
  return self->_additionDescs;
}

- (void)setAdditionDescs:(id)a3
{
}

- (NSDictionary)averagePoolDesc
{
  return self->_averagePoolDesc;
}

- (void)setAveragePoolDesc:(id)a3
{
}

- (NSDictionary)batchNormDescs
{
  return self->_batchNormDescs;
}

- (void)setBatchNormDescs:(id)a3
{
}

- (NSDictionary)catDescs
{
  return self->_catDescs;
}

- (void)setCatDescs:(id)a3
{
}

- (NSDictionary)chunkDescs
{
  return self->_chunkDescs;
}

- (void)setChunkDescs:(id)a3
{
}

- (NSDictionary)convDescs
{
  return self->_convDescs;
}

- (void)setConvDescs:(id)a3
{
}

- (NSDictionary)dropoutDescs
{
  return self->_dropoutDescs;
}

- (void)setDropoutDescs:(id)a3
{
}

- (NSDictionary)transposeDescs
{
  return self->_transposeDescs;
}

- (void)setTransposeDescs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transposeDescs, 0);
  objc_storeStrong((id *)&self->_dropoutDescs, 0);
  objc_storeStrong((id *)&self->_convDescs, 0);
  objc_storeStrong((id *)&self->_chunkDescs, 0);
  objc_storeStrong((id *)&self->_catDescs, 0);
  objc_storeStrong((id *)&self->_batchNormDescs, 0);
  objc_storeStrong((id *)&self->_averagePoolDesc, 0);
  objc_storeStrong((id *)&self->_additionDescs, 0);
}

@end