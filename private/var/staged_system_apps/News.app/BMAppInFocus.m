@interface BMAppInFocus
- (NSDate)date;
- (NSString)content;
- (int64_t)type;
@end

@implementation BMAppInFocus

- (int64_t)type
{
  return 3;
}

- (NSString)content
{
  return (NSString *)[(BMAppInFocus *)self bundleID];
}

- (NSDate)date
{
  return (NSDate *)[(BMAppInFocus *)self absoluteTimestamp];
}

@end