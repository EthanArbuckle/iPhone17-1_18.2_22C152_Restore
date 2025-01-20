@interface SAUIGetResponseAlternativesPlayback
+ (id)getResponseAlternativesPlayback;
- (BOOL)requiresResponse;
- (SAUIGetResponseAlternatives)playbackCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPlaybackCommand:(id)a3;
@end

@implementation SAUIGetResponseAlternativesPlayback

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"GetResponseAlternativesPlayback";
}

+ (id)getResponseAlternativesPlayback
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIGetResponseAlternatives)playbackCommand
{
  return (SAUIGetResponseAlternatives *)AceObjectAceObjectForProperty(self, @"playbackCommand");
}

- (void)setPlaybackCommand:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end