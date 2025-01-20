@interface SAUSTitleCardSection
+ (id)titleCardSection;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTitle:(id)a3;
@end

@implementation SAUSTitleCardSection

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"TitleCardSection";
}

+ (id)titleCardSection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end