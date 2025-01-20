@interface NSURLWrapper
+ (id)fileURLWithPath:(id)a3;
@end

@implementation NSURLWrapper

+ (id)fileURLWithPath:(id)a3
{
  return (id)[NSURL fileURLWithPath:a3];
}

@end