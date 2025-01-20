@interface SACardSnippet
+ (id)snippet;
- (NSArray)contextItems;
- (NSArray)referencedCommands;
- (NSArray)referencedSnippets;
- (NSData)cardData;
- (NSData)compactSizeCardData;
- (NSString)responseViewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCardData:(id)a3;
- (void)setCompactSizeCardData:(id)a3;
- (void)setContextItems:(id)a3;
- (void)setReferencedCommands:(id)a3;
- (void)setReferencedSnippets:(id)a3;
- (void)setResponseViewId:(id)a3;
@end

@implementation SACardSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.card";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)cardData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"cardData"];
}

- (void)setCardData:(id)a3
{
}

- (NSData)compactSizeCardData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"compactSizeCardData"];
}

- (void)setCompactSizeCardData:(id)a3
{
}

- (NSArray)contextItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"contextItems", &unk_1EFD734D0);
}

- (void)setContextItems:(id)a3
{
}

- (NSArray)referencedCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"referencedCommands", &unk_1EFD73568);
}

- (void)setReferencedCommands:(id)a3
{
}

- (NSArray)referencedSnippets
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"referencedSnippets", v3);
}

- (void)setReferencedSnippets:(id)a3
{
}

- (NSString)responseViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseViewId"];
}

- (void)setResponseViewId:(id)a3
{
}

@end