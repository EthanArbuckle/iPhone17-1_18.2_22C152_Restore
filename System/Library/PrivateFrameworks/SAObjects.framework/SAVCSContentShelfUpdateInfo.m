@interface SAVCSContentShelfUpdateInfo
+ (id)contentShelfUpdateInfo;
- (NSString)targetShelfViewId;
- (NSString)targetViewId;
- (NSURL)url;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)pageNumber;
- (void)setPageNumber:(int64_t)a3;
- (void)setTargetShelfViewId:(id)a3;
- (void)setTargetViewId:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAVCSContentShelfUpdateInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"ContentShelfUpdateInfo";
}

+ (id)contentShelfUpdateInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)pageNumber
{
  return AceObjectIntegerForProperty(self, @"pageNumber");
}

- (void)setPageNumber:(int64_t)a3
{
}

- (NSString)targetShelfViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"targetShelfViewId"];
}

- (void)setTargetShelfViewId:(id)a3
{
}

- (NSString)targetViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"targetViewId"];
}

- (void)setTargetViewId:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

@end