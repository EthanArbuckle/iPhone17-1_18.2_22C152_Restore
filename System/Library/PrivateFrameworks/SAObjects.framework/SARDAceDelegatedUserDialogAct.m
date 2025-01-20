@interface SARDAceDelegatedUserDialogAct
- (NSString)externalParserId;
- (NSString)rewrittenUtterance;
- (SARDAceRewriteMessage)rewriteMessage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)asrHypothesisIndex;
- (void)setAsrHypothesisIndex:(int64_t)a3;
- (void)setExternalParserId:(id)a3;
- (void)setRewriteMessage:(id)a3;
- (void)setRewrittenUtterance:(id)a3;
@end

@implementation SARDAceDelegatedUserDialogAct

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"AceDelegatedUserDialogAct";
}

- (int64_t)asrHypothesisIndex
{
  return AceObjectIntegerForProperty(self, @"asrHypothesisIndex");
}

- (void)setAsrHypothesisIndex:(int64_t)a3
{
}

- (NSString)externalParserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"externalParserId"];
}

- (void)setExternalParserId:(id)a3
{
}

- (SARDAceRewriteMessage)rewriteMessage
{
  return (SARDAceRewriteMessage *)AceObjectAceObjectForProperty(self, @"rewriteMessage");
}

- (void)setRewriteMessage:(id)a3
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