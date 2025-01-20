@interface PXStoryAutoEditConcreteMomentsStatistics
- (NSString)memoryCategoryName;
- (PFStoryClusteringProperties)clusteringProperties;
- (PXStoryMemoryMomentClusteringDistanceCalculator)clusteringDistanceCalculator;
- (double)averageAssetCount;
- (double)clusteringDuration;
- (unint64_t)maximumAssetCount;
- (unint64_t)minimumAssetCount;
- (void)setAverageAssetCount:(double)a3;
- (void)setClusteringDistanceCalculator:(id)a3;
- (void)setClusteringDuration:(double)a3;
- (void)setClusteringProperties:(id)a3;
- (void)setMaximumAssetCount:(unint64_t)a3;
- (void)setMemoryCategoryName:(id)a3;
- (void)setMinimumAssetCount:(unint64_t)a3;
@end

@implementation PXStoryAutoEditConcreteMomentsStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteringDistanceCalculator, 0);
  objc_storeStrong((id *)&self->_clusteringProperties, 0);
  objc_storeStrong((id *)&self->_memoryCategoryName, 0);
}

- (void)setClusteringDistanceCalculator:(id)a3
{
}

- (PXStoryMemoryMomentClusteringDistanceCalculator)clusteringDistanceCalculator
{
  return self->_clusteringDistanceCalculator;
}

- (void)setClusteringProperties:(id)a3
{
}

- (PFStoryClusteringProperties)clusteringProperties
{
  return self->_clusteringProperties;
}

- (void)setClusteringDuration:(double)a3
{
  self->_clusteringDuration = a3;
}

- (double)clusteringDuration
{
  return self->_clusteringDuration;
}

- (void)setMemoryCategoryName:(id)a3
{
}

- (NSString)memoryCategoryName
{
  return self->_memoryCategoryName;
}

- (void)setAverageAssetCount:(double)a3
{
  self->_averageAssetCount = a3;
}

- (double)averageAssetCount
{
  return self->_averageAssetCount;
}

- (void)setMaximumAssetCount:(unint64_t)a3
{
  self->_maximumAssetCount = a3;
}

- (unint64_t)maximumAssetCount
{
  return self->_maximumAssetCount;
}

- (void)setMinimumAssetCount:(unint64_t)a3
{
  self->_minimumAssetCount = a3;
}

- (unint64_t)minimumAssetCount
{
  return self->_minimumAssetCount;
}

@end