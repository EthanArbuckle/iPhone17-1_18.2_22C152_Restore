@interface NSURLResponse(NSURLResponse_TSUAdditions)
- (uint64_t)tsu_isHTTPSuccess;
@end

@implementation NSURLResponse(NSURLResponse_TSUAdditions)

- (uint64_t)tsu_isHTTPSuccess
{
  uint64_t v2 = objc_opt_class();
  v3 = TSUDynamicCast(v2, a1);
  v4 = v3;
  if (v3) {
    uint64_t v5 = objc_msgSend(v3, "tsu_isSuccess");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end