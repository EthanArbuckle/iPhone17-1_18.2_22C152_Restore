@interface WRM_LTECoexMetrics
- (WRM_LTECoexMetrics)init;
- (void)dealloc;
@end

@implementation WRM_LTECoexMetrics

- (WRM_LTECoexMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_LTECoexMetrics;
  result = [(WRM_LTECoexMetrics *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->mAntSelPolicyStats.IsCoexBand = 0;
    *(void *)&result->mAntSelPolicyStats.IssueBand = 0;
    *(_OWORD *)&result->mULCACoexStats.ULCAHasCoexBand = 0u;
    *(_OWORD *)&result->mULCACoexStats.ULCAPrimaryCarrierDLBW = 0u;
    result->mULCACoexStats.ULCACriticalCarrierDLBW = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_LTECoexMetrics;
  [(WRM_LTECoexMetrics *)&v2 dealloc];
}

@end