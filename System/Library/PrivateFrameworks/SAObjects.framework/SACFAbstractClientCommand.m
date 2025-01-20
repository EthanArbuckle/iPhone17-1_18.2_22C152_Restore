@interface SACFAbstractClientCommand
+ (id)abstractClientCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldCacheBytecode;
- (BOOL)shouldCacheScript;
- (BOOL)shouldRestartContext;
- (NSArray)jsLibraries;
- (NSString)domain;
- (NSString)jsFileNameSuffix;
- (NSString)jsParameters;
- (NSString)jsScript;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomain:(id)a3;
- (void)setJsFileNameSuffix:(id)a3;
- (void)setJsLibraries:(id)a3;
- (void)setJsParameters:(id)a3;
- (void)setJsScript:(id)a3;
- (void)setShouldCacheBytecode:(BOOL)a3;
- (void)setShouldCacheScript:(BOOL)a3;
- (void)setShouldRestartContext:(BOOL)a3;
@end

@implementation SACFAbstractClientCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"AbstractClientCommand";
}

+ (id)abstractClientCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (NSString)jsFileNameSuffix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsFileNameSuffix"];
}

- (void)setJsFileNameSuffix:(id)a3
{
}

- (NSArray)jsLibraries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"jsLibraries", v3);
}

- (void)setJsLibraries:(id)a3
{
}

- (NSString)jsParameters
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsParameters"];
}

- (void)setJsParameters:(id)a3
{
}

- (NSString)jsScript
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsScript"];
}

- (void)setJsScript:(id)a3
{
}

- (BOOL)shouldCacheBytecode
{
  return AceObjectBoolForProperty(self, @"shouldCacheBytecode");
}

- (void)setShouldCacheBytecode:(BOOL)a3
{
}

- (BOOL)shouldCacheScript
{
  return AceObjectBoolForProperty(self, @"shouldCacheScript");
}

- (void)setShouldCacheScript:(BOOL)a3
{
}

- (BOOL)shouldRestartContext
{
  return AceObjectBoolForProperty(self, @"shouldRestartContext");
}

- (void)setShouldRestartContext:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end