@interface NSURLResponse(SSVURLCacheAdditions)
- (BOOL)ssv_isExpiredResponse;
@end

@implementation NSURLResponse(SSVURLCacheAdditions)

- (BOOL)ssv_isExpiredResponse
{
  [a1 _calculatedExpiration];
  return v1 < CFAbsoluteTimeGetCurrent();
}

@end