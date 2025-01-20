@interface NSHTTPURLResponse
- (BOOL)statusCodeIndicatesSucess;
@end

@implementation NSHTTPURLResponse

- (BOOL)statusCodeIndicatesSucess
{
  return [(NSHTTPURLResponse *)self statusCode] >= 200
      && [(NSHTTPURLResponse *)self statusCode] < 300;
}

@end