@interface SAKnowledgeKeyValueEntry
+ (id)keyValueEntry;
- (BOOL)requiresResponse;
- (NSString)key;
- (NSString)storeName;
- (NSString)storeType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKey:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setStoreType:(id)a3;
@end

@implementation SAKnowledgeKeyValueEntry

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"KeyValueEntry";
}

+ (id)keyValueEntry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)key
{
  return (NSString *)[(AceObject *)self propertyForKey:@"key"];
}

- (void)setKey:(id)a3
{
}

- (NSString)storeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"storeName"];
}

- (void)setStoreName:(id)a3
{
}

- (NSString)storeType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"storeType"];
}

- (void)setStoreType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end