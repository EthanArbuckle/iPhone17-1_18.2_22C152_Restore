@interface CLSTaxonomyBasedSignalNode
- (CLSTaxonomyBasedSignalNode)initWithTaxonomyNode:(id)a3;
- (double)graphHighPrecisionThreshold;
- (double)graphHighRecallThreshold;
- (double)searchThreshold;
- (void)setGraphHighPrecisionThreshold:(double)a3;
- (void)setGraphHighRecallThreshold:(double)a3;
- (void)setSearchThreshold:(double)a3;
@end

@implementation CLSTaxonomyBasedSignalNode

- (void)setGraphHighRecallThreshold:(double)a3
{
  self->_graphHighRecallThreshold = a3;
}

- (double)graphHighRecallThreshold
{
  return self->_graphHighRecallThreshold;
}

- (void)setGraphHighPrecisionThreshold:(double)a3
{
  self->_graphHighPrecisionThreshold = a3;
}

- (double)graphHighPrecisionThreshold
{
  return self->_graphHighPrecisionThreshold;
}

- (void)setSearchThreshold:(double)a3
{
  self->_searchThreshold = a3;
}

- (double)searchThreshold
{
  return self->_searchThreshold;
}

- (CLSTaxonomyBasedSignalNode)initWithTaxonomyNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 extendedSceneClassId];
  v6 = [v4 name];
  [v4 f1Threshold];
  double v8 = v7;
  [v4 f0point5Threshold];
  double v10 = v9;
  [v4 f2Threshold];
  v17.receiver = self;
  v17.super_class = (Class)CLSTaxonomyBasedSignalNode;
  v12 = [(CLSSignalNode *)&v17 initWithIdentifier:v5 name:v6 operatingPoint:v8 highPrecisionOperatingPoint:v10 highRecallOperatingPoint:v11];

  if (v12)
  {
    [v4 searchThreshold];
    v12->_searchThreshold = v13;
    [v4 graphHighPrecisionThreshold];
    v12->_graphHighPrecisionThreshold = v14;
    [v4 graphHighRecallThreshold];
    v12->_graphHighRecallThreshold = v15;
  }

  return v12;
}

@end