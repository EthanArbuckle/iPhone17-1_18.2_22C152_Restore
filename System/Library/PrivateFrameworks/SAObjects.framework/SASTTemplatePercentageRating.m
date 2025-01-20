@interface SASTTemplatePercentageRating
+ (id)templatePercentageRating;
- (SAUIDecoratedText)value;
- (SAUILocalImageResource)localImageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocalImageResource:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASTTemplatePercentageRating

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TemplatePercentageRating";
}

+ (id)templatePercentageRating
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUILocalImageResource)localImageResource
{
  return (SAUILocalImageResource *)AceObjectAceObjectForProperty(self, @"localImageResource");
}

- (void)setLocalImageResource:(id)a3
{
}

- (SAUIDecoratedText)value
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"value");
}

- (void)setValue:(id)a3
{
}

@end