@interface NSHTTPURLResponse(RCAdditions)
- (BOOL)isSuccess;
- (uint64_t)isFailure;
@end

@implementation NSHTTPURLResponse(RCAdditions)

- (BOOL)isSuccess
{
  return [a1 statusCode] >= 200 && objc_msgSend(a1, "statusCode") < 300
      || [a1 statusCode] == 304;
}

- (uint64_t)isFailure
{
  return [a1 isSuccess] ^ 1;
}

@end