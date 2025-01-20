@interface LibraryMenuViewController.DownloadManagerObserver
- (_TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver)init;
- (void)dealloc;
- (void)downloadManager:(id)a3 didCancelAssets:(id)a4;
- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5;
- (void)downloadManager:(id)a3 didFinishAsset:(id)a4 withError:(id)a5;
@end

@implementation LibraryMenuViewController.DownloadManagerObserver

- (_TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didEnqueueAssetDownloads);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didFinishAssetDownload);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didCancelAssetsDownload);
  v6 = (objc_class *)type metadata accessor for LibraryMenuViewController.DownloadManagerObserver();
  void *v5 = 0;
  v5[1] = 0;
  v12.receiver = self;
  v12.super_class = v6;
  v7 = [(LibraryMenuViewController.DownloadManagerObserver *)&v12 init];
  v8 = self;
  v9 = v7;
  id v10 = [v8 sharedManager];
  [v10 registerObserver:v9];

  return v9;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedManager];
  [v5 unregisterObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for LibraryMenuViewController.DownloadManagerObserver();
  [(LibraryMenuViewController.DownloadManagerObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didEnqueueAssetDownloads));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didFinishAssetDownload));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didCancelAssetsDownload);

  sub_1A528(v3);
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = self;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_21D034, v9);

  swift_release();
}

- (void)downloadManager:(id)a3 didFinishAsset:(id)a4 withError:(id)a5
{
  if (a4)
  {
    sub_173E4(0, &qword_DCFF60);
    sub_AB69B0();
  }
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a5;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_21D010, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)downloadManager:(id)a3 didCancelAssets:(id)a4
{
  if (a4)
  {
    sub_173E4(0, &qword_DCFF60);
    sub_AB69B0();
  }
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v7 = self;
  id v8 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_21CFEC, v6);

  swift_bridgeObjectRelease();

  swift_release();
}

@end