@interface SAScreenActionList
+ (id)list;
- (NSString)appId;
- (NSString)mainEntitySemanticData;
- (NSURL)viewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppId:(id)a3;
- (void)setMainEntitySemanticData:(id)a3;
- (void)setViewId:(id)a3;
@end

@implementation SAScreenActionList

- (id)groupIdentifier
{
  return @"com.apple.ace.onscreenaction";
}

- (id)encodedClassName
{
  return @"List";
}

+ (id)list
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appId"];
}

- (void)setAppId:(id)a3
{
}

- (NSString)mainEntitySemanticData
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mainEntitySemanticData"];
}

- (void)setMainEntitySemanticData:(id)a3
{
}

- (NSURL)viewId
{
  return (NSURL *)AceObjectURLForProperty(self, @"viewId");
}

- (void)setViewId:(id)a3
{
}

@end