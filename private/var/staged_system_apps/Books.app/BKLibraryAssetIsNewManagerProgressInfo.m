@interface BKLibraryAssetIsNewManagerProgressInfo
- (BKLibraryAssetIsNewManagerProgressInfo)initWithReadingProgress:(double)a3 highWaterMark:(double)a4;
- (double)highWaterMark;
- (double)readingProgress;
@end

@implementation BKLibraryAssetIsNewManagerProgressInfo

- (BKLibraryAssetIsNewManagerProgressInfo)initWithReadingProgress:(double)a3 highWaterMark:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryAssetIsNewManagerProgressInfo;
  result = [(BKLibraryAssetIsNewManagerProgressInfo *)&v7 init];
  if (result)
  {
    result->_readingProgress = a3;
    result->_highWaterMark = a4;
  }
  return result;
}

- (double)readingProgress
{
  return self->_readingProgress;
}

- (double)highWaterMark
{
  return self->_highWaterMark;
}

@end