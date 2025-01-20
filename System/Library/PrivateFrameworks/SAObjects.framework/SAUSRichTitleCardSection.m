@interface SAUSRichTitleCardSection
+ (id)richTitleCardSection;
- (BOOL)centered;
- (NSString)contentRatingText;
- (NSString)subtitle;
- (SAUIImageResource)titleImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCentered:(BOOL)a3;
- (void)setContentRatingText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation SAUSRichTitleCardSection

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"RichTitleCardSection";
}

+ (id)richTitleCardSection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, @"centered");
}

- (void)setCentered:(BOOL)a3
{
}

- (NSString)contentRatingText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentRatingText"];
}

- (void)setContentRatingText:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
{
}

- (SAUIImageResource)titleImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"titleImage");
}

- (void)setTitleImage:(id)a3
{
}

@end