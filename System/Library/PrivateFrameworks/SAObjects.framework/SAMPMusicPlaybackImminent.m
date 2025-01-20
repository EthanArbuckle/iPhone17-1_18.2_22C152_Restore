@interface SAMPMusicPlaybackImminent
+ (id)musicPlaybackImminent;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)preloadedUserSharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPreloadedUserSharedUserId:(id)a3;
@end

@implementation SAMPMusicPlaybackImminent

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MusicPlaybackImminent";
}

+ (id)musicPlaybackImminent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)preloadedUserSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"preloadedUserSharedUserId"];
}

- (void)setPreloadedUserSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end