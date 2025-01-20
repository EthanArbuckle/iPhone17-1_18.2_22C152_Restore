@interface SARDAceRewriteMessage
- (NSString)rewriteType;
- (NSString)rewrittenUtterance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRewriteType:(id)a3;
- (void)setRewrittenUtterance:(id)a3;
@end

@implementation SARDAceRewriteMessage

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"AceRewriteMessage";
}

- (NSString)rewriteType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rewriteType"];
}

- (void)setRewriteType:(id)a3
{
}

- (NSString)rewrittenUtterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rewrittenUtterance"];
}

- (void)setRewrittenUtterance:(id)a3
{
}

@end