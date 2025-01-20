@interface SACFFetchScriptCommand
+ (id)fetchScriptCommand;
- (BOOL)requiresResponse;
- (NSArray)jsScriptIdentifiers;
- (NSString)fetchScriptType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFetchScriptType:(id)a3;
- (void)setJsScriptIdentifiers:(id)a3;
@end

@implementation SACFFetchScriptCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"FetchScriptCommand";
}

+ (id)fetchScriptCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)fetchScriptType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fetchScriptType"];
}

- (void)setFetchScriptType:(id)a3
{
}

- (NSArray)jsScriptIdentifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"jsScriptIdentifiers"];
}

- (void)setJsScriptIdentifiers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end