@interface SASmsSms(SiriVOX)
- (uint64_t)svx_isDeferredExpressionContextObject;
@end

@implementation SASmsSms(SiriVOX)

- (uint64_t)svx_isDeferredExpressionContextObject
{
  return 1;
}

@end