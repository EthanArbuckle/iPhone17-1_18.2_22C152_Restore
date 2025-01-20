@interface IdFeatureConfig
- (BOOL)hashing;
- (IdFeatureConfig)init;
- (int)embeddingDimention;
- (int)embeddingTableSize;
- (int)hashBucketStart;
- (void)setEmbeddingDimention:(int)a3;
- (void)setEmbeddingTableSize:(int)a3;
- (void)setHashBucketStart:(int)a3;
- (void)setHashing:(BOOL)a3;
@end

@implementation IdFeatureConfig

- (IdFeatureConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)IdFeatureConfig;
  result = [(FeatureConfig *)&v3 init];
  if (result) {
    result->_hashing = 0;
  }
  return result;
}

- (int)embeddingTableSize
{
  return self->_embeddingTableSize;
}

- (void)setEmbeddingTableSize:(int)a3
{
  self->_embeddingTableSize = a3;
}

- (int)embeddingDimention
{
  return self->_embeddingDimention;
}

- (void)setEmbeddingDimention:(int)a3
{
  self->_embeddingDimention = a3;
}

- (BOOL)hashing
{
  return self->_hashing;
}

- (void)setHashing:(BOOL)a3
{
  self->_hashing = a3;
}

- (int)hashBucketStart
{
  return self->_hashBucketStart;
}

- (void)setHashBucketStart:(int)a3
{
  self->_hashBucketStart = a3;
}

@end