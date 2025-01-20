@interface SAHAIdentifierListFilter
+ (id)identifierListFilter;
- (NSArray)identifiers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifiers:(id)a3;
@end

@implementation SAHAIdentifierListFilter

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"IdentifierListFilter";
}

+ (id)identifierListFilter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)identifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"identifiers"];
}

- (void)setIdentifiers:(id)a3
{
}

@end