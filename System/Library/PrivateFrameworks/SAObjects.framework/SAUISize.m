@interface SAUISize
- (double)scale;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)height;
- (int64_t)width;
- (void)setHeight:(int64_t)a3;
- (void)setScale:(double)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation SAUISize

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"Size";
}

- (int64_t)height
{
  return AceObjectIntegerForProperty(self, @"height");
}

- (void)setHeight:(int64_t)a3
{
}

- (double)scale
{
  return AceObjectDoubleForProperty(self, @"scale");
}

- (void)setScale:(double)a3
{
}

- (int64_t)width
{
  return AceObjectIntegerForProperty(self, @"width");
}

- (void)setWidth:(int64_t)a3
{
}

@end