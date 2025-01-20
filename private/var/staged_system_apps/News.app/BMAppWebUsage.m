@interface BMAppWebUsage
- (NSDate)date;
- (NSString)content;
- (int64_t)type;
@end

@implementation BMAppWebUsage

- (int64_t)type
{
  return 1;
}

- (NSString)content
{
  return (NSString *)[(BMAppWebUsage *)self webpageURL];
}

- (NSDate)date
{
  return (NSDate *)[(BMAppWebUsage *)self absoluteTimestamp];
}

@end