@interface SAKnowledgeGetValuesForKeys
+ (id)getValuesForKeys;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)keys;
- (NSString)storeName;
- (NSString)storeType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKeys:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setStoreType:(id)a3;
@end

@implementation SAKnowledgeGetValuesForKeys

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"GetValuesForKeys";
}

+ (id)getValuesForKeys
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)keys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"keys"];
}

- (void)setKeys:(id)a3
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
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end