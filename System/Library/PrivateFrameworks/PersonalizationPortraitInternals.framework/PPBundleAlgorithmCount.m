@interface PPBundleAlgorithmCount
- (NSString)bundleId;
- (unsigned)algorithm;
- (unsigned)count;
- (void)setAlgorithm:(unsigned int)a3;
- (void)setBundleId:(id)a3;
- (void)setCount:(unsigned int)a3;
@end

@implementation PPBundleAlgorithmCount

- (void).cxx_destruct
{
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setAlgorithm:(unsigned int)a3
{
  self->_algorithm = a3;
}

- (unsigned)algorithm
{
  return self->_algorithm;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

@end