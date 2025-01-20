@interface PUFilmstripDataSource
- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRangeRepresentedByAssetAtIndex:(SEL)a3;
- (AVAsset)asset;
- (NSArray)indicatorInfos;
- (PUFilmstripDataSource)init;
- (PUFilmstripDataSource)initWithAsset:(id)a3 numberOfIndexes:(int64_t)a4 indicatorInfos:(id)a5;
- (double)_normalizedTimeForIndex:(int64_t)a3;
- (id)assetAtIndexPath:(id)a3;
- (id)indexPathForAsset:(id)a3;
- (int64_t)numberOfIndexes;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
- (void)setIndicatorInfos:(id)a3;
@end

@implementation PUFilmstripDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_indexPathByAsset, 0);
  objc_storeStrong((id *)&self->_assetByIndexPath, 0);
}

- (void)setIndicatorInfos:(id)a3
{
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (int64_t)numberOfIndexes
{
  return self->_numberOfIndexes;
}

- (AVAsset)asset
{
  return self->_asset;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRangeRepresentedByAssetAtIndex:(SEL)a3
{
  [(PUFilmstripDataSource *)self _normalizedTimeForIndex:a4];
  Float64 v7 = v6;
  memset(&v16, 0, sizeof(v16));
  v8 = [(PUFilmstripDataSource *)self asset];
  v9 = v8;
  if (v8) {
    [v8 duration];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }

  memset(&v15, 0, sizeof(v15));
  CMTime time = v16;
  CMTimeMultiplyByFloat64(&v15, &time, v7);
  memset(&time, 0, sizeof(time));
  int32_t v10 = [(PUFilmstripDataSource *)self numberOfIndexes];
  CMTime start = v16;
  CMTimeMultiplyByRatio(&time, &start, 1, v10);
  CMTime start = v15;
  CMTime v12 = time;
  return ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v12);
}

- (id)indexPathForAsset:(id)a3
{
  return [(NSMapTable *)self->_indexPathByAsset objectForKey:a3];
}

- (id)assetAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    CMTime v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 551, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  double v6 = [(NSMutableDictionary *)self->_assetByIndexPath objectForKeyedSubscript:v5];
  if (!v6)
  {
    -[PUFilmstripDataSource _normalizedTimeForIndex:](self, "_normalizedTimeForIndex:", [v5 indexAtPosition:0]);
    double v8 = v7;
    v9 = [PUFilmstripAsset alloc];
    int32_t v10 = [(PUFilmstripDataSource *)self asset];
    double v6 = [(PUFilmstripAsset *)v9 initWithNormalizedTime:v10 asset:v8];

    [(NSMutableDictionary *)self->_assetByIndexPath setObject:v6 forKeyedSubscript:v5];
    [(NSMapTable *)self->_indexPathByAsset setObject:v5 forKey:v6];
  }

  return v6;
}

- (double)_normalizedTimeForIndex:(int64_t)a3
{
  int64_t numberOfIndexes = self->_numberOfIndexes;
  if (numberOfIndexes <= a3)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 543, @"Invalid parameter not satisfying: %@", @"index < maxIndex" object file lineNumber description];
  }
  double result = fmax((double)a3 / (double)numberOfIndexes, 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 535, @"invalid indexPath %@", v5 object file lineNumber description];

    int64_t numberOfIndexes = 0;
  }
  else
  {
    int64_t numberOfIndexes = self->_numberOfIndexes;
  }

  return numberOfIndexes;
}

- (PUFilmstripDataSource)initWithAsset:(id)a3 numberOfIndexes:(int64_t)a4 indicatorInfos:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PUFilmstripDataSource;
  v11 = [(PUTilingDataSource *)&v20 init];
  CMTime v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    uint64_t v13 = [v10 copy];
    indicatorInfos = v12->_indicatorInfos;
    v12->_indicatorInfos = (NSArray *)v13;

    v12->_int64_t numberOfIndexes = a4;
    CMTime v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetByIndexPath = v12->_assetByIndexPath;
    v12->_assetByIndexPath = v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    indexPathByAsset = v12->_indexPathByAsset;
    v12->_indexPathByAsset = (NSMapTable *)v17;
  }
  return v12;
}

- (PUFilmstripDataSource)init
{
  return [(PUFilmstripDataSource *)self initWithAsset:0 numberOfIndexes:0 indicatorInfos:0];
}

@end