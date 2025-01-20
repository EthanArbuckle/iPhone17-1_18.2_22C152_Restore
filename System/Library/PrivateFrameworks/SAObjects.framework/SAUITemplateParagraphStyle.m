@interface SAUITemplateParagraphStyle
+ (id)paragraphStyle;
- (NSNumber)firstLineHeadIndent;
- (NSNumber)getParagraphSpacingBefore;
- (NSNumber)headIndent;
- (NSNumber)lineHeightMultiple;
- (NSNumber)lineSpacing;
- (NSNumber)maximumLineHeight;
- (NSNumber)minimumLineHeight;
- (NSNumber)paragraphSpacing;
- (NSNumber)tailIndent;
- (NSString)alignment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setFirstLineHeadIndent:(id)a3;
- (void)setGetParagraphSpacingBefore:(id)a3;
- (void)setHeadIndent:(id)a3;
- (void)setLineHeightMultiple:(id)a3;
- (void)setLineSpacing:(id)a3;
- (void)setMaximumLineHeight:(id)a3;
- (void)setMinimumLineHeight:(id)a3;
- (void)setParagraphSpacing:(id)a3;
- (void)setTailIndent:(id)a3;
@end

@implementation SAUITemplateParagraphStyle

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"ParagraphStyle";
}

+ (id)paragraphStyle
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSNumber)firstLineHeadIndent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"firstLineHeadIndent"];
}

- (void)setFirstLineHeadIndent:(id)a3
{
}

- (NSNumber)getParagraphSpacingBefore
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"getParagraphSpacingBefore"];
}

- (void)setGetParagraphSpacingBefore:(id)a3
{
}

- (NSNumber)headIndent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"headIndent"];
}

- (void)setHeadIndent:(id)a3
{
}

- (NSNumber)lineHeightMultiple
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"lineHeightMultiple"];
}

- (void)setLineHeightMultiple:(id)a3
{
}

- (NSNumber)lineSpacing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"lineSpacing"];
}

- (void)setLineSpacing:(id)a3
{
}

- (NSNumber)maximumLineHeight
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"maximumLineHeight"];
}

- (void)setMaximumLineHeight:(id)a3
{
}

- (NSNumber)minimumLineHeight
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minimumLineHeight"];
}

- (void)setMinimumLineHeight:(id)a3
{
}

- (NSNumber)paragraphSpacing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"paragraphSpacing"];
}

- (void)setParagraphSpacing:(id)a3
{
}

- (NSNumber)tailIndent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"tailIndent"];
}

- (void)setTailIndent:(id)a3
{
}

@end