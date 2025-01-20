@interface SAMovieResolution
+ (id)resolution;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)height;
- (int64_t)width;
- (void)setHeight:(int64_t)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation SAMovieResolution

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"Resolution";
}

+ (id)resolution
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)height
{
  return AceObjectIntegerForProperty(self, @"height");
}

- (void)setHeight:(int64_t)a3
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