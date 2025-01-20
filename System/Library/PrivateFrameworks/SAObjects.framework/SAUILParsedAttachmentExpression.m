@interface SAUILParsedAttachmentExpression
+ (id)parsedAttachmentExpression;
- (NSData)attachment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttachment:(id)a3;
@end

@implementation SAUILParsedAttachmentExpression

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"ParsedAttachmentExpression";
}

+ (id)parsedAttachmentExpression
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)attachment
{
  return (NSData *)[(AceObject *)self propertyForKey:@"attachment"];
}

- (void)setAttachment:(id)a3
{
}

@end