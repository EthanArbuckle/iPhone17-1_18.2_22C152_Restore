@interface PGRevGeoMetricEvent
- (BOOL)shouldReportMetrics;
- (PGRevGeoMetricEvent)initWithNumberOfAssetClustersPerMomentMean:(double)a3 numberOfAssetClustersPerMomentStdDev:(double)a4 numberOfAssetsPerClusterMean:(double)a5 numberOfAssetsPerClusterStdDev:(double)a6 ratioAssetClustersWithin10mOfCenter:(double)a7 ratioAssetClustersWithin20mOfCenter:(double)a8 ratioAssetClustersWithin50mOfCenter:(double)a9 ratioAssetClustersWithin100mOfCenter:(double)a10 ratioAssetClusters100mPlusFromCenter:(double)a11;
- (double)numberOfAssetClustersPerMomentMean;
- (double)numberOfAssetClustersPerMomentStdDev;
- (double)numberOfAssetsPerClusterMean;
- (double)numberOfAssetsPerClusterStdDev;
- (double)ratioAssetClusters100mPlusFromCenter;
- (double)ratioAssetClustersWithin100mOfCenter;
- (double)ratioAssetClustersWithin10mOfCenter;
- (double)ratioAssetClustersWithin20mOfCenter;
- (double)ratioAssetClustersWithin50mOfCenter;
- (id)identifier;
- (id)payload;
@end

@implementation PGRevGeoMetricEvent

- (double)ratioAssetClusters100mPlusFromCenter
{
  return self->_ratioAssetClusters100mPlusFromCenter;
}

- (double)ratioAssetClustersWithin100mOfCenter
{
  return self->_ratioAssetClustersWithin100mOfCenter;
}

- (double)ratioAssetClustersWithin50mOfCenter
{
  return self->_ratioAssetClustersWithin50mOfCenter;
}

- (double)ratioAssetClustersWithin20mOfCenter
{
  return self->_ratioAssetClustersWithin20mOfCenter;
}

- (double)ratioAssetClustersWithin10mOfCenter
{
  return self->_ratioAssetClustersWithin10mOfCenter;
}

- (double)numberOfAssetsPerClusterStdDev
{
  return self->_numberOfAssetsPerClusterStdDev;
}

- (double)numberOfAssetsPerClusterMean
{
  return self->_numberOfAssetsPerClusterMean;
}

- (double)numberOfAssetClustersPerMomentStdDev
{
  return self->_numberOfAssetClustersPerMomentStdDev;
}

- (double)numberOfAssetClustersPerMomentMean
{
  return self->_numberOfAssetClustersPerMomentMean;
}

- (id)payload
{
  v15[9] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", self->_numberOfAssetClustersPerMomentMean, @"numberOfAssetClustersPerMomentMean");
  v15[0] = v3;
  v14[1] = @"numberOfAssetClustersPerMomentStdDev";
  v4 = [NSNumber numberWithDouble:self->_numberOfAssetClustersPerMomentStdDev];
  v15[1] = v4;
  v14[2] = @"numberOfAssetsPerClusterMean";
  v5 = [NSNumber numberWithDouble:self->_numberOfAssetsPerClusterMean];
  v15[2] = v5;
  v14[3] = @"numberOfAssetsPerClusterStdDev";
  v6 = [NSNumber numberWithDouble:self->_numberOfAssetsPerClusterStdDev];
  v15[3] = v6;
  v14[4] = @"ratioAssetClustersWithin10mOfCenter";
  v7 = [NSNumber numberWithDouble:self->_ratioAssetClustersWithin10mOfCenter];
  v15[4] = v7;
  v14[5] = @"ratioAssetClustersWithin20mOfCenter";
  v8 = [NSNumber numberWithDouble:self->_ratioAssetClustersWithin20mOfCenter];
  v15[5] = v8;
  v14[6] = @"ratioAssetClustersWithin50mOfCenter";
  v9 = [NSNumber numberWithDouble:self->_ratioAssetClustersWithin50mOfCenter];
  v15[6] = v9;
  v14[7] = @"ratioAssetClustersWithin100mOfCenter";
  v10 = [NSNumber numberWithDouble:self->_ratioAssetClustersWithin100mOfCenter];
  v15[7] = v10;
  v14[8] = @"ratioAssetClusters100mPlusFromCenter";
  v11 = [NSNumber numberWithDouble:self->_ratioAssetClusters100mPlusFromCenter];
  v15[8] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.RevGeo";
}

- (PGRevGeoMetricEvent)initWithNumberOfAssetClustersPerMomentMean:(double)a3 numberOfAssetClustersPerMomentStdDev:(double)a4 numberOfAssetsPerClusterMean:(double)a5 numberOfAssetsPerClusterStdDev:(double)a6 ratioAssetClustersWithin10mOfCenter:(double)a7 ratioAssetClustersWithin20mOfCenter:(double)a8 ratioAssetClustersWithin50mOfCenter:(double)a9 ratioAssetClustersWithin100mOfCenter:(double)a10 ratioAssetClusters100mPlusFromCenter:(double)a11
{
  v20.receiver = self;
  v20.super_class = (Class)PGRevGeoMetricEvent;
  result = [(PGRevGeoMetricEvent *)&v20 init];
  if (result)
  {
    result->_numberOfAssetClustersPerMomentMean = a3;
    result->_numberOfAssetClustersPerMomentStdDev = a4;
    result->_numberOfAssetsPerClusterMean = a5;
    result->_numberOfAssetsPerClusterStdDev = a6;
    result->_ratioAssetClustersWithin10mOfCenter = a7;
    result->_ratioAssetClustersWithin20mOfCenter = a8;
    result->_ratioAssetClustersWithin50mOfCenter = a9;
    result->_ratioAssetClustersWithin100mOfCenter = a10;
    result->_ratioAssetClusters100mPlusFromCenter = a11;
  }
  return result;
}

@end