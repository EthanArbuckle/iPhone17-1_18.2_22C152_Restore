@interface ICQPhotosInfo
@end

@implementation ICQPhotosInfo

void __38___ICQPhotosInfo__photosShutdownQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.quota.photos.shutdown", v2);
  v1 = (void *)_photosShutdownQueue_photosShutdownQueue;
  _photosShutdownQueue_photosShutdownQueue = (uint64_t)v0;
}

void __40___ICQPhotosInfo_getInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Photos transfer progress %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Photos transfer error %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = objc_alloc_init(_ICQPhotosInfo);
    -[_ICQPhotosInfo setPhotoCount:](v9, "setPhotoCount:", [v5 notUploadedPhotosCount]);
    -[_ICQPhotosInfo setVideoCount:](v9, "setVideoCount:", [v5 notUploadedVideosCount]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  [*(id *)(a1 + 40) _shutDownPhotoLibrary];
}

void __39___ICQPhotosInfo__shutDownPhotoLibrary__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39228] unsafeShutdownLibraryWithPhotoLibraryURL:*(void *)(a1 + 32)];
  v1 = _ICQGetLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D5851000, v1, OS_LOG_TYPE_DEFAULT, "Photos library shutdown completed!", v2, 2u);
  }
}

@end