@interface SAGetResultObjects
+ (id)getResultObjects;
- (BOOL)requiresResponse;
- (NSArray)objectIdentifiers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjectIdentifiers:(id)a3;
@end

@implementation SAGetResultObjects

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetResultObjects";
}

+ (id)getResultObjects
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objectIdentifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"objectIdentifiers"];
}

- (void)setObjectIdentifiers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end