@interface WBSReaderFontDownloadManager
+ (WBSReaderFontDownloadManager)sharedManager;
- (BOOL)hasOngoingRequestForFont:(id)a3;
- (WBSReaderFontDownloadManager)init;
- (double)downloadProgressForFont:(id)a3;
- (void)downloadFont:(id)a3;
@end

@implementation WBSReaderFontDownloadManager

+ (WBSReaderFontDownloadManager)sharedManager
{
  {
    v2 = (WBSReaderFontDownloadManager *)+[WBSReaderFontDownloadManager sharedManager]::sharedInstance;
  }
  else
  {
    v2 = objc_alloc_init(WBSReaderFontDownloadManager);
    +[WBSReaderFontDownloadManager sharedManager]::sharedInstance = (uint64_t)v2;
  }
  return v2;
}

- (WBSReaderFontDownloadManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSReaderFontDownloadManager;
  v2 = [(WBSReaderFontDownloadManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    fontFamilyToProgress = v2->_fontFamilyToProgress;
    v2->_fontFamilyToProgress = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)hasOngoingRequestForFont:(id)a3
{
  fontFamilyToProgress = self->_fontFamilyToProgress;
  v4 = [a3 familyName];
  v5 = [(NSMutableDictionary *)fontFamilyToProgress objectForKeyedSubscript:v4];
  LOBYTE(fontFamilyToProgress) = v5 != 0;

  return (char)fontFamilyToProgress;
}

- (double)downloadProgressForFont:(id)a3
{
  fontFamilyToProgress = self->_fontFamilyToProgress;
  v4 = [a3 familyName];
  v5 = [(NSMutableDictionary *)fontFamilyToProgress objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)downloadFont:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    fontFamilyToProgress = self->_fontFamilyToProgress;
    double v7 = [v4 familyName];
    [(NSMutableDictionary *)fontFamilyToProgress setObject:&unk_1EFC228E8 forKeyedSubscript:v7];

    v14[0] = *MEMORY[0x1E4F24538];
    v8 = [v5 familyName];
    v14[1] = *MEMORY[0x1E4F245E8];
    v15[0] = v8;
    v15[1] = &unk_1EFC22900;
    CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    CTFontDescriptorRef v10 = CTFontDescriptorCreateWithAttributes(v9);
    CFArrayRef v11 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
    CFRelease(v10);
    progressBlock[0] = MEMORY[0x1E4F143A8];
    progressBlock[1] = 3221225472;
    progressBlock[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke;
    progressBlock[3] = &unk_1E5C9F198;
    progressBlock[4] = self;
    id v13 = v5;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v11, 0, progressBlock);
  }
}

uint64_t __45__WBSReaderFontDownloadManager_downloadFont___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_2;
      block[3] = &unk_1E5C8D980;
      id v4 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v22 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      break;
    case 1:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_4;
      v16[3] = &unk_1E5C8D980;
      v5 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v16);

      break;
    case 5:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_3;
      v18[3] = &unk_1E5C8D6E0;
      uint64_t v6 = *(void *)(a1 + 32);
      double v7 = *(void **)(a1 + 40);
      v20 = a3;
      v18[4] = v6;
      id v19 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v18);

      break;
    case 8:
      v8 = [a3 objectForKey:*MEMORY[0x1E4F24488]];
      CFDictionaryRef v9 = (id)WBS_LOG_CHANNEL_PREFIXReader();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        CTFontDescriptorRef v10 = [*(id *)(a1 + 40) familyName];
        CFArrayRef v11 = objc_msgSend(v8, "safari_privacyPreservingDescription");
        __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_cold_1(v10, v11, buf, v9);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_23;
      v14[3] = &unk_1E5C8D980;
      v12 = *(void **)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      id v15 = v12;
      dispatch_async(MEMORY[0x1E4F14428], v14);

      break;
    default:
      return 1;
  }
  return 1;
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = @"WBSReaderFontDownloadNotificationUserInfoKey";
  v7[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSReaderFontDownloadDidBeginNotification" object:v4 userInfo:v5];
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_3(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x1E4F24490]];
  [v2 doubleValue];
  double v4 = v3;

  v5 = [NSNumber numberWithDouble:v4];
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  double v7 = [*(id *)(a1 + 40) familyName];
  [v6 setObject:v5 forKeyedSubscript:v7];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v12 = @"WBSReaderFontDownloadNotificationUserInfoKey";
  v13[0] = v9;
  CFArrayRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v8 postNotificationName:@"WBSReaderFontDownloadProgressDidChangeNotification" object:v10 userInfo:v11];
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_4(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  double v3 = [*(id *)(a1 + 40) familyName];
  [v2 removeObjectForKey:v3];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8 = @"WBSReaderFontDownloadNotificationUserInfoKey";
  v9[0] = v5;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 postNotificationName:@"WBSReaderFontDownloadDidFinishNotification" object:v6 userInfo:v7];
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_23(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  double v3 = [*(id *)(a1 + 40) familyName];
  [v2 removeObjectForKey:v3];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8 = @"WBSReaderFontDownloadNotificationUserInfoKey";
  v9[0] = v5;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 postNotificationName:@"WBSReaderFontDownloadDidFailNotification" object:v6 userInfo:v7];
}

- (void).cxx_destruct
{
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Downloading %{public}@ failed: %{public}@", buf, 0x16u);
}

@end