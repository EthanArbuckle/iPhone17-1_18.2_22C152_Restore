@interface NSHTTPURLResponse(NSHTTPURLResponse_TSUAdditions)
- (BOOL)tsu_isSuccess;
@end

@implementation NSHTTPURLResponse(NSHTTPURLResponse_TSUAdditions)

- (BOOL)tsu_isSuccess
{
  return [a1 statusCode] >= 200 && objc_msgSend(a1, "statusCode") < 300;
}

@end