@interface ICQDeviceInfo
@end

@implementation ICQDeviceInfo

void __49___ICQDeviceInfo_getInfoWithBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = a3;
    v7 = +[_ICQDeviceInfo defaultDeviceInfoWithBundleId:v15];
  }
  else
  {
    id v6 = 0;
    v7 = objc_alloc_init(_ICQDeviceInfo);
    [(_ICQDeviceInfo *)v7 setBundleId:*(void *)(a1 + 32)];
    v8 = +[_ICQDeviceInfo templateKeyForPhotos:video:](_ICQDeviceInfo, "templateKeyForPhotos:video:", [v5 photoCount], objc_msgSend(v5, "videoCount"));
    [(_ICQDeviceInfo *)v7 setKey:v8];

    v18[0] = @"%$PhotosCount";
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "photoCount"));
    v9 = +[_ICQHelperFunctions getStringFromNumber:v17];
    v19[0] = v9;
    v18[1] = @"%$VideosCount";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "videoCount"));
    v11 = +[_ICQHelperFunctions getStringFromNumber:v10];
    v19[1] = v11;
    v18[2] = @"%$TotalPhotosVideosCount";
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "videoCount") + objc_msgSend(v5, "photoCount"));
    v13 = +[_ICQHelperFunctions getStringFromNumber:v12];
    v19[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    [(_ICQDeviceInfo *)v7 setWordsToReplace:v14];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38___ICQDeviceInfo_getInfoWithBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "device Info = %@", (uint8_t *)&v12, 0xCu);
  }

  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "error = %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end