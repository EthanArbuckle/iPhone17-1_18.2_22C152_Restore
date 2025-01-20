@interface _UIEventSessionScrollAction
- (id)typeEncoding;
- (int64_t)actionType;
@end

@implementation _UIEventSessionScrollAction

- (id)typeEncoding
{
  return @"Scroll";
}

- (int64_t)actionType
{
  return 23;
}

@end