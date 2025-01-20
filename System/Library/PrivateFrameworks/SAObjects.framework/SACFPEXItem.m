@interface SACFPEXItem
+ (id)item;
- (NSNumber)score;
- (NSString)identifier;
- (NSString)itemSource;
- (NSString)sourceIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
- (void)setItemSource:(id)a3;
- (void)setScore:(id)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation SACFPEXItem

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow.local.pex";
}

- (id)encodedClassName
{
  return @"Item";
}

+ (id)item
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)itemSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"itemSource"];
}

- (void)setItemSource:(id)a3
{
}

- (NSNumber)score
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"score"];
}

- (void)setScore:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sourceIdentifier"];
}

- (void)setSourceIdentifier:(id)a3
{
}

@end