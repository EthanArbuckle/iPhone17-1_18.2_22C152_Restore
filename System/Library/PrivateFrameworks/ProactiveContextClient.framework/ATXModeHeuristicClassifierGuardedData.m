@interface ATXModeHeuristicClassifierGuardedData
@end

@implementation ATXModeHeuristicClassifierGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureBuffer, 0);
  objc_storeStrong((id *)&self->_lastFeatureUpdateDate, 0);

  objc_storeStrong((id *)&self->_aggregateFeatures, 0);
}

@end