@interface UnifiedMessagingSignalProvider
- (_TtC8VideosUI30UnifiedMessagingSignalProvider)init;
- (void)dealloc;
- (void)debounceActiveDownloadButtonDidChange;
- (void)handleActiveDownloadButtonsDidChange:(id)a3;
- (void)handleAppDidFinishLoading;
- (void)handleDownloadDidStart;
- (void)handleGDPRDidAccept;
- (void)handleHasEventforTVPlus:(id)a3;
- (void)handleHasFavoriteTeamsDidChange:(id)a3;
- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3;
- (void)handleLibraryContentsDidChange:(id)a3;
- (void)handleLocationStatusDidChange:(id)a3;
- (void)handleNotifAuthStatusDidChange;
@end

@implementation UnifiedMessagingSignalProvider

- (_TtC8VideosUI30UnifiedMessagingSignalProvider)init
{
  sub_1E2CE9A84();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_1E30C71B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI30UnifiedMessagingSignalProvider_downloadAndPurchaseAccessQueue));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI30UnifiedMessagingSignalProvider_mediaLibrary);
}

- (void)handleActiveDownloadButtonsDidChange:(id)a3
{
}

- (void)debounceActiveDownloadButtonDidChange
{
  v2 = self;
  sub_1E344876C();
}

- (void)handleHasFavoriteTeamsDidChange:(id)a3
{
}

- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3
{
}

- (void)handleLibraryContentsDidChange:(id)a3
{
}

- (void)handleLocationStatusDidChange:(id)a3
{
}

- (void)handleNotifAuthStatusDidChange
{
  v2 = self;
  sub_1E34489E8();
}

- (void)handleHasEventforTVPlus:(id)a3
{
}

- (void)handleAppDidFinishLoading
{
  v2 = self;
  sub_1E3449220();
}

- (void)handleDownloadDidStart
{
  v2 = self;
  sub_1E344876C();
}

- (void)handleGDPRDidAccept
{
  v2 = self;
  sub_1E344876C();
}

@end