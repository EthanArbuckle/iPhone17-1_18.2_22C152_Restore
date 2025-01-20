@interface SAUILAttachmentExpression
+ (id)attachmentExpression;
- (SAAceSerializable)attachmentExpression;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttachmentExpression:(id)a3;
@end

@implementation SAUILAttachmentExpression

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"AttachmentExpression";
}

+ (id)attachmentExpression
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAceSerializable)attachmentExpression
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"attachmentExpression");
}

- (void)setAttachmentExpression:(id)a3
{
}

@end