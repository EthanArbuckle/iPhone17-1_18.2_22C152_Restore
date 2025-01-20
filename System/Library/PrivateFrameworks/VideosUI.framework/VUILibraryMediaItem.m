@interface VUILibraryMediaItem
@end

@implementation VUILibraryMediaItem

void __37__VUILibraryMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUILibraryMediaItem_iOS");
  v1 = (void *)sLogObject_17;
  sLogObject_17 = (uint64_t)v0;
}

void __67__VUILibraryMediaItem_iOS__schedulePlaybackPositionInfoPersistence__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) playbackPositionInfo];
  [*(id *)(a1 + 32) setPlaybackPositionInfo:0];
  if (v5)
  {
    v2 = [*(id *)(a1 + 32) ml3Track];

    if (v2)
    {
      v3 = +[VUIPlaybackPositionController sharedInstance];
      v4 = [*(id *)(a1 + 32) ml3Track];
      [v3 persistPlaybackPositionInfo:v5 forTrack:v4];
    }
  }
}

@end