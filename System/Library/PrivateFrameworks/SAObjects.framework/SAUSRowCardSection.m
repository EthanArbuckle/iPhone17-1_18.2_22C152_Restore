@interface SAUSRowCardSection
+ (id)rowCardSection;
- (BOOL)imageIsRightAligned;
- (NSString)leftText;
- (NSString)rightText;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImage:(id)a3;
- (void)setImageIsRightAligned:(BOOL)a3;
- (void)setLeftText:(id)a3;
- (void)setRightText:(id)a3;
@end

@implementation SAUSRowCardSection

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"RowCardSection";
}

+ (id)rowCardSection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (BOOL)imageIsRightAligned
{
  return AceObjectBoolForProperty(self, @"imageIsRightAligned");
}

- (void)setImageIsRightAligned:(BOOL)a3
{
}

- (NSString)leftText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"leftText"];
}

- (void)setLeftText:(id)a3
{
}

- (NSString)rightText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rightText"];
}

- (void)setRightText:(id)a3
{
}

@end