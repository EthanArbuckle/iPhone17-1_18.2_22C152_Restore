@interface SALocalSearchAttribution
+ (id)attribution;
- (NSArray)urls;
- (NSString)attributionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)version;
- (void)setAttributionId:(id)a3;
- (void)setUrls:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation SALocalSearchAttribution

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Attribution";
}

+ (id)attribution
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)attributionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attributionId"];
}

- (void)setAttributionId:(id)a3
{
}

- (NSArray)urls
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"urls");
}

- (void)setUrls:(id)a3
{
}

- (int64_t)version
{
  return AceObjectIntegerForProperty(self, @"version");
}

- (void)setVersion:(int64_t)a3
{
}

@end