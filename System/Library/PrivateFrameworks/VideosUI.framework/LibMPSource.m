@interface LibMPSource
- (_TtC8VideosUI11LibMPSource)init;
- (void)dealloc;
- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5;
- (void)mpMediaLibraryContentChanged;
- (void)mpMediaLibraryDownloadingDidChange;
- (void)refreshRentalMenu;
@end

@implementation LibMPSource

- (void)dealloc
{
  v2 = self;
  sub_1E3264FF0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC8VideosUI11LibMPSource)init
{
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  if (a4)
  {
    sub_1E2BE915C(0, &qword_1EADEAEB8);
    sub_1E387CC98();
  }
  if (a5)
  {
    sub_1E2BE915C(0, &qword_1EADEAEB8);
    sub_1E387CC98();
  }
  id v8 = a3;
  v9 = self;
  sub_1E326752C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mpMediaLibraryContentChanged
{
  v2 = self;
  sub_1E32677CC();
}

- (void)mpMediaLibraryDownloadingDidChange
{
  v2 = self;
  sub_1E3267BAC();
}

- (void)refreshRentalMenu
{
  v2 = self;
  sub_1E3267D28();
}

@end