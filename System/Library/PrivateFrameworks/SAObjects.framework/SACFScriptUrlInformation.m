@interface SACFScriptUrlInformation
+ (id)scriptUrlInformation;
- (NSDictionary)headerFields;
- (NSString)requestMethodType;
- (NSURL)downloadUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDownloadUrl:(id)a3;
- (void)setHeaderFields:(id)a3;
- (void)setRequestMethodType:(id)a3;
@end

@implementation SACFScriptUrlInformation

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ScriptUrlInformation";
}

+ (id)scriptUrlInformation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)downloadUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"downloadUrl");
}

- (void)setDownloadUrl:(id)a3
{
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"headerFields"];
}

- (void)setHeaderFields:(id)a3
{
}

- (NSString)requestMethodType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestMethodType"];
}

- (void)setRequestMethodType:(id)a3
{
}

@end