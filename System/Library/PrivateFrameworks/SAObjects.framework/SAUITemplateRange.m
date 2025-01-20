@interface SAUITemplateRange
+ (id)range;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)length;
- (int64_t)location;
- (void)setLength:(int64_t)a3;
- (void)setLocation:(int64_t)a3;
@end

@implementation SAUITemplateRange

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
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

- (int64_t)location
{
  return AceObjectIntegerForProperty(self, @"location");
}

- (void)setLocation:(int64_t)a3
{
}

@end