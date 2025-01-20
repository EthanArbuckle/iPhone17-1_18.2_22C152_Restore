@interface SARange
+ (id)range;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)length;
- (int64_t)start;
- (void)setLength:(int64_t)a3;
- (void)setStart:(int64_t)a3;
@end

@implementation SARange

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Range";
}

+ (id)range
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)length
{
  return AceObjectIntegerForProperty(self, @"length");
}

- (void)setLength:(int64_t)a3
{
}

- (int64_t)start
{
  return AceObjectIntegerForProperty(self, @"start");
}

- (void)setStart:(int64_t)a3
{
}

@end