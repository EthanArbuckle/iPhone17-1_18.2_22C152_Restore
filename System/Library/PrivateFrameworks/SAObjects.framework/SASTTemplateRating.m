@interface SASTTemplateRating
+ (id)templateRating;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASTTemplateRating

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TemplateRating";
}

+ (id)templateRating
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end