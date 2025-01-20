@interface NSError
- (id)dy_errorSignature;
@end

@implementation NSError

- (id)dy_errorSignature
{
  return +[NSString stringWithFormat:@"%@ (%llu)", [(NSError *)self domain], [(NSError *)self code]];
}

@end