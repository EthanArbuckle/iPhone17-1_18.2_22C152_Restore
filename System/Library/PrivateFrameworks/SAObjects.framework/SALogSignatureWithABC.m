@interface SALogSignatureWithABC
+ (id)logSignatureWithABC;
- (BOOL)requiresResponse;
- (NSDictionary)subTypeContext;
- (NSString)subType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSubType:(id)a3;
- (void)setSubTypeContext:(id)a3;
@end

@implementation SALogSignatureWithABC

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"LogSignatureWithABC";
}

+ (id)logSignatureWithABC
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)subType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subType"];
}

- (void)setSubType:(id)a3
{
}

- (NSDictionary)subTypeContext
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"subTypeContext"];
}

- (void)setSubTypeContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end