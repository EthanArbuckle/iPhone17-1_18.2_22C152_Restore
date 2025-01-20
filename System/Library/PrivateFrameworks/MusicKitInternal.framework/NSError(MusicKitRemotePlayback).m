@interface NSError(MusicKitRemotePlayback)
+ (uint64_t)musicKit_remotePlaybackEndpointDoesNotExist;
@end

@implementation NSError(MusicKitRemotePlayback)

+ (uint64_t)musicKit_remotePlaybackEndpointDoesNotExist
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"MusicKitRemotePlaybackErrorDomain" code:1 userInfo:0];
}

@end