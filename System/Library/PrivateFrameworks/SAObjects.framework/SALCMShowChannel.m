@interface SALCMShowChannel
+ (id)showChannel;
- (BOOL)requiresResponse;
- (SALCMTvChannel)channel;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChannel:(id)a3;
@end

@implementation SALCMShowChannel

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"ShowChannel";
}

+ (id)showChannel
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALCMTvChannel)channel
{
  return (SALCMTvChannel *)AceObjectAceObjectForProperty(self, @"channel");
}

- (void)setChannel:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end