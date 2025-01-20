@interface SALCMTvChannel
+ (id)tvChannel;
- (NSString)callSign;
- (NSString)channelIdentifier;
- (NSString)name;
- (NSURL)streamUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCallSign:(id)a3;
- (void)setChannelIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setStreamUrl:(id)a3;
@end

@implementation SALCMTvChannel

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"TvChannel";
}

+ (id)tvChannel
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)callSign
{
  return (NSString *)[(AceObject *)self propertyForKey:@"callSign"];
}

- (void)setCallSign:(id)a3
{
}

- (NSString)channelIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"channelIdentifier"];
}

- (void)setChannelIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSURL)streamUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"streamUrl");
}

- (void)setStreamUrl:(id)a3
{
}

@end