@interface PLMediaAnalysisEmbeddingSearchOptions
- (BOOL)fullScan;
- (NSArray)assetUUIDsForPrefilter;
- (NSNumber)numConcurrentReaders;
- (PLMediaAnalysisEmbeddingSearchOptions)initWithResultLimit:(int)a3;
- (int)resultLimit;
- (void)setAssetUUIDsForPrefilter:(id)a3;
- (void)setFullScan:(BOOL)a3;
- (void)setNumConcurrentReaders:(id)a3;
@end

@implementation PLMediaAnalysisEmbeddingSearchOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, 0);
  objc_storeStrong((id *)&self->_assetUUIDsForPrefilter, 0);
}

- (void)setNumConcurrentReaders:(id)a3
{
}

- (NSNumber)numConcurrentReaders
{
  return self->_numConcurrentReaders;
}

- (void)setFullScan:(BOOL)a3
{
  self->_fullScan = a3;
}

- (BOOL)fullScan
{
  return self->_fullScan;
}

- (void)setAssetUUIDsForPrefilter:(id)a3
{
}

- (NSArray)assetUUIDsForPrefilter
{
  return self->_assetUUIDsForPrefilter;
}

- (int)resultLimit
{
  return self->_resultLimit;
}

- (PLMediaAnalysisEmbeddingSearchOptions)initWithResultLimit:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLMediaAnalysisEmbeddingSearchOptions;
  v4 = [(PLMediaAnalysisEmbeddingSearchOptions *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_resultLimit = a3;
    assetUUIDsForPrefilter = v4->_assetUUIDsForPrefilter;
    v4->_assetUUIDsForPrefilter = 0;

    v5->_fullScan = 0;
    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)&unk_1EEBF0C50;
  }
  return v5;
}

@end