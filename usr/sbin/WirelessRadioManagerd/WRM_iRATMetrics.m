@interface WRM_iRATMetrics
- (WRM_iRATMetrics)init;
- (void)dealloc;
@end

@implementation WRM_iRATMetrics

- (WRM_iRATMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_iRATMetrics;
  v2 = [(WRM_iRATMetrics *)&v5 init];
  v3 = (WRM_iRATMetrics *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *((void *)v2 + 27) = 0;
    *((void *)v2 + 28) = objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  mHORecordCache = self->mHORecordCache;
  if (mHORecordCache) {

  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATMetrics;
  [(WRM_iRATMetrics *)&v4 dealloc];
}

@end