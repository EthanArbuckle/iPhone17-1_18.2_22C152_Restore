@interface SASTTemplateStarRating
+ (id)templateStarRating;
- (double)maximumValue;
- (double)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMaximumValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation SASTTemplateStarRating

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TemplateStarRating";
}

+ (id)templateStarRating
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)maximumValue
{
  return AceObjectDoubleForProperty(self, @"maximumValue");
}

- (void)setMaximumValue:(double)a3
{
}

- (double)value
{
  return AceObjectDoubleForProperty(self, @"value");
}

- (void)setValue:(double)a3
{
}

@end