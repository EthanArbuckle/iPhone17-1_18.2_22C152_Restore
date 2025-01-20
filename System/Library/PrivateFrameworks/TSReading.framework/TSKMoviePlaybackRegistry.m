@interface TSKMoviePlaybackRegistry
+ (id)sharedMoviePlaybackRegistry;
- (void)objectWillBeginMoviePlayback:(id)a3;
@end

@implementation TSKMoviePlaybackRegistry

+ (id)sharedMoviePlaybackRegistry
{
  if (sharedMoviePlaybackRegistry_createSharedMoviePlaybackRegistryOnce != -1) {
    dispatch_once(&sharedMoviePlaybackRegistry_createSharedMoviePlaybackRegistryOnce, &__block_literal_global_14);
  }
  return (id)sharedMoviePlaybackRegistry_sharedMoviePlaybackRegistry;
}

TSKMoviePlaybackRegistry *__55__TSKMoviePlaybackRegistry_sharedMoviePlaybackRegistry__block_invoke()
{
  result = objc_alloc_init(TSKMoviePlaybackRegistry);
  sharedMoviePlaybackRegistry_sharedMoviePlaybackRegistry = (uint64_t)result;
  return result;
}

- (void)objectWillBeginMoviePlayback:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 postNotificationName:@"TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification" object:self userInfo:0];
}

@end