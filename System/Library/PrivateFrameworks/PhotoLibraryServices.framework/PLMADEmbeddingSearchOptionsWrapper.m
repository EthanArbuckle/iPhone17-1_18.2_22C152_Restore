@interface PLMADEmbeddingSearchOptionsWrapper
+ (id)defaultOptions;
- (BOOL)includePayload;
- (NSNumber)batchSize;
- (NSNumber)numConcurrentReaders;
- (NSNumber)numberOfProbes;
- (PLMADEmbeddingSearchOptionsWrapper)initWithResultLimit:(unint64_t)a3;
- (unint64_t)resultLimit;
- (void)setBatchSize:(id)a3;
- (void)setIncludePayload:(BOOL)a3;
- (void)setNumConcurrentReaders:(id)a3;
- (void)setNumberOfProbes:(id)a3;
- (void)setResultLimit:(unint64_t)a3;
@end

@implementation PLMADEmbeddingSearchOptionsWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_numberOfProbes, 0);
}

- (void)setNumConcurrentReaders:(id)a3
{
}

- (NSNumber)numConcurrentReaders
{
  return self->_numConcurrentReaders;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setNumberOfProbes:(id)a3
{
}

- (NSNumber)numberOfProbes
{
  return self->_numberOfProbes;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (PLMADEmbeddingSearchOptionsWrapper)initWithResultLimit:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PLMADEmbeddingSearchOptionsWrapper;
  v4 = [(PLMADEmbeddingSearchOptionsWrapper *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_includePayload = 0;
    numberOfProbes = v4->_numberOfProbes;
    v4->_resultLimit = a3;
    v4->_numberOfProbes = 0;

    batchSize = v5->_batchSize;
    v5->_batchSize = 0;

    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)&unk_1EEBF0C50;
  }
  return v5;
}

+ (id)defaultOptions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithResultLimit:10];
  return v2;
}

@end