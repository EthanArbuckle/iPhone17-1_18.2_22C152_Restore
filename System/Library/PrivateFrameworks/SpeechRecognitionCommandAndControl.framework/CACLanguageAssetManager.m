@interface CACLanguageAssetManager
+ (BOOL)isAssetsInstalledForBestLocale;
+ (BOOL)isAssetsInstalledForLocale:(id)a3;
+ (id)downloadedLocaleIdentifiers;
+ (id)downloadingLocaleIdentifiers;
+ (id)sharedManager;
- (BOOL)isInstallationStatusStale;
- (BOOL)isRegisteredForCallback;
- (CACLanguageAssetManager)init;
- (NSDictionary)cachedInstallationStatus;
- (NSDictionary)downloadProgress;
- (NSMutableDictionary)downloadErrorDictionary;
- (NSMutableDictionary)downloadProgressDictionary;
- (NSMutableDictionary)lastReportedProgressDictionary;
- (id)downloadProgressForLanguage:(id)a3;
- (id)installationStatus;
- (id)purgeInstalledAsset;
- (id)supportedLocaleIdentifiers;
- (unint64_t)errorStatusForLanguage:(id)a3;
- (void)_downloadProgressCallback:(__CFDictionary *)a3;
- (void)_handleErrorInDownloadForLanguage:(id)a3;
- (void)_sendProgressNotificationIfNeededForLanguage:(id)a3;
- (void)_updateInstallationStatusFromDownloadStatus:(__CFDictionary *)a3;
- (void)cancelDownloadOfLanguage:(id)a3;
- (void)markInstallationStatusStale;
- (void)registerForCallback;
- (void)setCachedInstallationStatus:(id)a3;
- (void)setDownloadErrorDictionary:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloadProgressDictionary:(id)a3;
- (void)setIsInstallationStatusStale:(BOOL)a3;
- (void)setIsRegisteredForCallback:(BOOL)a3;
- (void)setLastReportedProgressDictionary:(id)a3;
- (void)startDownloadOfLanguage:(id)a3;
@end

@implementation CACLanguageAssetManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sCACLanguageAssetManager;
  return v2;
}

uint64_t __40__CACLanguageAssetManager_sharedManager__block_invoke()
{
  sCACLanguageAssetManager = [objc_allocWithZone((Class)CACLanguageAssetManager) init];
  return MEMORY[0x270F9A758]();
}

- (CACLanguageAssetManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CACLanguageAssetManager;
  v2 = [(CACLanguageAssetManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    downloadProgressDictionary = v2->_downloadProgressDictionary;
    v2->_downloadProgressDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    lastReportedProgressDictionary = v2->_lastReportedProgressDictionary;
    v2->_lastReportedProgressDictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    downloadErrorDictionary = v2->_downloadErrorDictionary;
    v2->_downloadErrorDictionary = (NSMutableDictionary *)v7;

    v2->_isInstallationStatusStale = 1;
  }
  return v2;
}

- (id)installationStatus
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(CACLanguageAssetManager *)self isInstallationStatusStale])
  {
    uint64_t v3 = (void *)[(id)RXObjectCopyProperty() mutableCopy];
    v4 = +[CACPreferences sharedPreferences];
    uint64_t v5 = [v4 userSelectableLocaleIdentifiers];
    v6 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_306_0);

    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (([v7 containsObject:v13] & 1) == 0) {
            [v3 removeObjectForKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(CACLanguageAssetManager *)self setCachedInstallationStatus:v3];
    [(CACLanguageAssetManager *)self setIsInstallationStatusStale:0];
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_markInstallationStatusStale object:0];
    [(CACLanguageAssetManager *)self performSelector:sel_markInstallationStatusStale withObject:0 afterDelay:10.0];
  }
  v14 = [(CACLanguageAssetManager *)self cachedInstallationStatus];
  return v14;
}

uint64_t __45__CACLanguageAssetManager_installationStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
}

- (void)markInstallationStatusStale
{
}

- (void)startDownloadOfLanguage:(id)a3
{
  id v6 = a3;
  v4 = [(CACLanguageAssetManager *)self installationStatus];
  uint64_t v5 = [v4 objectForKey:v6];

  if (([v5 hasPrefix:@"Version:"] & 1) == 0) {
    [(CACLanguageAssetManager *)self registerForCallback];
  }
  RXObjectSetProperty();
}

- (void)cancelDownloadOfLanguage:(id)a3
{
}

- (id)purgeInstalledAsset
{
  uint64_t v3 = RXObjectCopyProperty();
  [(CACLanguageAssetManager *)self markInstallationStatusStale];
  return v3;
}

- (id)supportedLocaleIdentifiers
{
  return (id)RXObjectCopyProperty();
}

- (id)downloadProgressForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (unint64_t)errorStatusForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 integerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)registerForCallback
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__CACLanguageAssetManager_registerForCallback__block_invoke;
  v2[3] = &unk_264D11D98;
  objc_copyWeak(&v3, &location);
  MEMORY[0x23EC8E850](v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__CACLanguageAssetManager_registerForCallback__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _downloadProgressCallback:a2];
}

+ (BOOL)isAssetsInstalledForBestLocale
{
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = [v3 bestLocaleIdentifier];
  LOBYTE(a1) = [a1 isAssetsInstalledForLocale:v4];

  return (char)a1;
}

+ (BOOL)isAssetsInstalledForLocale:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [a1 downloadedLocaleIdentifiers];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CACLanguageAssetManager_isAssetsInstalledForLocale___block_invoke;
  v8[3] = &unk_264D11DC0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __54__CACLanguageAssetManager_isAssetsInstalledForLocale___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = +[CACLocaleUtilities normalizedLocaleIdentifier:a2];
  id v6 = +[CACLocaleUtilities normalizedLocaleIdentifier:*(void *)(a1 + 32)];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (id)downloadedLocaleIdentifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v14 = [MEMORY[0x263EFF9C0] set];
  v2 = +[CACLanguageAssetManager sharedManager];
  id v3 = [v2 installationStatus];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = +[CACLanguageAssetManager sharedManager];
  uint64_t v5 = [v4 supportedLocaleIdentifiers];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        v12 = [v3 objectForKey:v11];
        if ([v12 hasPrefix:@"Version:"]) {
          [v14 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v14;
}

+ (id)downloadingLocaleIdentifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = +[CACLanguageAssetManager sharedManager];
  v22 = [v2 installationStatus];

  id v3 = +[CACLanguageAssetManager downloadedLocaleIdentifiers];
  id v21 = [MEMORY[0x263EFF9C0] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = +[CACPreferences sharedPreferences];
  uint64_t v5 = [v4 userSelectableLocaleIdentifiers];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v3 containsObject:v10] & 1) == 0)
        {
          uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
          v12 = [v22 objectForKey:v11];
          uint64_t v13 = +[CACLanguageAssetManager sharedManager];
          id v14 = [v13 downloadProgressForLanguage:v11];

          v15 = [v14 objectForKey:@"DownloadProgressDictionaryKeyPercentage"];
          [v15 floatValue];
          float v17 = v16;

          if (v12
            || ([v14 objectForKey:@"DownloadProgressDictionaryKeyCompleted"],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                char v19 = [v18 BOOLValue],
                v18,
                (v19 & 1) == 0)
            && v17 > 0.0)
          {
            [v21 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v21;
}

- (void)_downloadProgressCallback:(__CFDictionary *)a3
{
  -[CACLanguageAssetManager setDownloadProgress:](self, "setDownloadProgress:");
  [(CACLanguageAssetManager *)self _updateInstallationStatusFromDownloadStatus:a3];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"CACNotificationAssetDownloadProgressChanged" object:0];
}

- (void)_updateInstallationStatusFromDownloadStatus:(__CFDictionary *)a3
{
  v59[4] = *MEMORY[0x263EF8340];
  id v5 = CFDictionaryGetValue(a3, @"Language");
  uint64_t v6 = CFDictionaryGetValue(a3, @"Phase");
  if ([v6 isEqualToString:@"Idle"]) {
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"DownloadFailed"])
  {
    [(CACLanguageAssetManager *)self markInstallationStatusStale];
    if (CFDictionaryGetValue(a3, @"Error") != (const void *)*MEMORY[0x263EFFD08]
      && CFDictionaryGetValue(a3, @"Error"))
    {
      uint64_t v7 = CFDictionaryGetValue(a3, @"Error");
      uint64_t v8 = CACLogAssetDownload();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:]((uint64_t)v7, v8);
      }

      if (v5)
      {
        id v9 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
        [v9 setObject:&unk_26EB4CD98 forKey:v5];

        [(CACLanguageAssetManager *)self _handleErrorInDownloadForLanguage:v5];
      }
    }
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"Stalled"])
  {
    uint64_t v10 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
    [v10 setObject:&unk_26EB4CDB0 forKey:v5];

    [(CACLanguageAssetManager *)self _handleErrorInDownloadForLanguage:v5];
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"Downloaded"])
  {
    [(CACLanguageAssetManager *)self markInstallationStatusStale];
    uint64_t v11 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
    [v11 setObject:&unk_26EB4CDC8 forKey:v5];

    [(CACLanguageAssetManager *)self _handleErrorInDownloadForLanguage:v5];
    v12 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
    uint64_t v13 = [v12 objectForKey:v5];
    [v13 setObject:MEMORY[0x263EFFA88] forKey:@"DownloadProgressDictionaryKeyCompleted"];

    id v14 = CACLogAssetDownload();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:]((uint64_t)v5, self);
    }

LABEL_21:
    [(CACLanguageAssetManager *)self _sendProgressNotificationIfNeededForLanguage:v5];
    goto LABEL_22;
  }
  if (([v6 isEqualToString:@"Cancelled"] & 1) != 0
    || [v6 isEqualToString:@"CancelFailed"])
  {
    v15 = CACLogAssetDownload();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:]((uint64_t)v6, v15);
    }

    float v16 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
    float v17 = [v16 objectForKey:v5];
    [v17 setObject:MEMORY[0x263EFFA80] forKey:@"DownloadProgressDictionaryKeyCompleted"];

    long long v18 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
    char v19 = [v18 objectForKey:v5];
    [v19 setObject:&unk_26EB4CDE0 forKey:@"DownloadProgressDictionaryKeyPercentage"];

    [(CACLanguageAssetManager *)self markInstallationStatusStale];
    goto LABEL_21;
  }
  if (![v6 isEqualToString:@"Downloading"])
  {
    [(CACLanguageAssetManager *)self markInstallationStatusStale];
    long long v25 = CACLogAssetDownload();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.7((uint64_t)v6, v25);
    }
    goto LABEL_31;
  }
  v20 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
  [v20 setObject:&unk_26EB4CDC8 forKey:v5];

  [(CACLanguageAssetManager *)self _handleErrorInDownloadForLanguage:v5];
  float valuePtr = -1.0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"TimeRemaining");
  CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
  float v56 = -1.0;
  CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(a3, @"BytesWritten");
  CFNumberGetValue(v22, kCFNumberFloatType, &v56);
  float v55 = -1.0;
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a3, @"BytesTotal");
  CFNumberGetValue(v23, kCFNumberFloatType, &v55);
  if (valuePtr == -1.0 && v56 == -1.0 && v55 <= 0.0)
  {
    long long v25 = CACLogAssetDownload();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.6(v25, v26, v27, v28, v29, v30, v31, v32);
    }
LABEL_31:

    goto LABEL_22;
  }
  if (v56 == -1.0 || v55 <= 0.0)
  {
    long long v25 = CACLogAssetDownload();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.4(v25, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_31;
  }
  if (valuePtr == -1.0)
  {
    long long v25 = CACLogAssetDownload();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.5(v25, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_31;
  }
  v58[0] = @"DownloadProgressDictionaryKeyPercentage";
  *(float *)&double v24 = v56 / v55;
  v33 = [NSNumber numberWithFloat:v24];
  v59[0] = v33;
  v58[1] = @"DownloadProgressDictionaryKeyTimeRemaining";
  *(float *)&double v34 = valuePtr;
  v35 = [NSNumber numberWithFloat:v34];
  v59[1] = v35;
  v58[2] = @"DownloadProgressDictionaryKeyTotalBytes";
  *(float *)&double v36 = v55;
  v37 = [NSNumber numberWithFloat:v36];
  v58[3] = @"DownloadProgressDictionaryKeyCompleted";
  v59[2] = v37;
  v59[3] = MEMORY[0x263EFFA80];
  v38 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
  v39 = (void *)[v38 mutableCopy];

  if (v39)
  {
    v40 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
    [v40 setObject:v39 forKey:v5];
  }
  [(CACLanguageAssetManager *)self _sendProgressNotificationIfNeededForLanguage:v5];

LABEL_22:
}

- (void)_sendProgressNotificationIfNeededForLanguage:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CACLanguageAssetManager *)self downloadProgressDictionary];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [(CACLanguageAssetManager *)self lastReportedProgressDictionary];
  uint64_t v8 = [v7 objectForKey:v4];

  id v9 = [v6 objectForKey:@"DownloadProgressDictionaryKeyPercentage"];
  [v9 floatValue];
  float v11 = v10;

  v12 = [v6 objectForKey:@"DownloadProgressDictionaryKeyTotalBytes"];
  [v12 floatValue];
  float v14 = v13;

  v15 = [v6 objectForKey:@"DownloadProgressDictionaryKeyTimeRemaining"];
  [v15 floatValue];
  float v17 = v16;

  long long v18 = [v8 objectForKey:@"DownloadProgressDictionaryKeyPercentage"];
  [v18 floatValue];
  float v20 = v19;

  id v21 = [v8 objectForKey:@"DownloadProgressDictionaryKeyTotalBytes"];
  [v21 floatValue];
  float v23 = v22;

  double v24 = [v8 objectForKey:@"DownloadProgressDictionaryKeyTimeRemaining"];
  [v24 floatValue];
  float v26 = v25;

  uint64_t v27 = [v6 objectForKey:@"DownloadProgressDictionaryKeyCompleted"];
  int v28 = [v27 BOOLValue];

  if (!v6 || v28 || v20 != v11 || v26 != v17 || v23 != v14)
  {
    if (v6)
    {
      uint64_t v29 = [(CACLanguageAssetManager *)self lastReportedProgressDictionary];
      [v29 setObject:v6 forKey:v4];
    }
    uint64_t v30 = CACLogAssetDownload();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412546;
      id v34 = v4;
      __int16 v35 = 2048;
      double v36 = v11;
      _os_log_impl(&dword_238377000, v30, OS_LOG_TYPE_DEFAULT, "percent %@: %f", (uint8_t *)&v33, 0x16u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationAssetDownloadProgressChanged", 0, 0, 1u);
    uint64_t v32 = CACLogAssetDownload();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[CACLanguageAssetManager _sendProgressNotificationIfNeededForLanguage:]((uint64_t)v4, v32);
    }
  }
}

- (void)_handleErrorInDownloadForLanguage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CACLanguageAssetManager *)self downloadErrorDictionary];
  uint64_t v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = CACLogAssetDownload();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:]((uint64_t)v4, self);
  }

  if (v7)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationAssetDownloadProgressErrorOccured", 0, 0, 1u);
    float v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"CACNotificationAssetDownloadErrorOccured" object:v4];

    float v11 = CACLogAssetDownload();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      float v13 = @"CACNotificationAssetDownloadProgressErrorOccured";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_238377000, v11, OS_LOG_TYPE_INFO, "Sent error notification %@ for language %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (NSDictionary)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (BOOL)isRegisteredForCallback
{
  return self->_isRegisteredForCallback;
}

- (void)setIsRegisteredForCallback:(BOOL)a3
{
  self->_isRegisteredForCallback = a3;
}

- (NSMutableDictionary)downloadProgressDictionary
{
  return self->_downloadProgressDictionary;
}

- (void)setDownloadProgressDictionary:(id)a3
{
}

- (NSMutableDictionary)lastReportedProgressDictionary
{
  return self->_lastReportedProgressDictionary;
}

- (void)setLastReportedProgressDictionary:(id)a3
{
}

- (NSMutableDictionary)downloadErrorDictionary
{
  return self->_downloadErrorDictionary;
}

- (void)setDownloadErrorDictionary:(id)a3
{
}

- (NSDictionary)cachedInstallationStatus
{
  return self->_cachedInstallationStatus;
}

- (void)setCachedInstallationStatus:(id)a3
{
}

- (BOOL)isInstallationStatusStale
{
  return self->_isInstallationStatusStale;
}

- (void)setIsInstallationStatusStale:(BOOL)a3
{
  self->_isInstallationStatusStale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInstallationStatus, 0);
  objc_storeStrong((id *)&self->_downloadErrorDictionary, 0);
  objc_storeStrong((id *)&self->_lastReportedProgressDictionary, 0);
  objc_storeStrong((id *)&self->_downloadProgressDictionary, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Error in asset download: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  int v2 = [a2 downloadProgressDictionary];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_238377000, v3, v4, "Setting completion dict for language %@: %@", v5, v6, v7, v8, v9);
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "Received Cancel phase %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unrecognized download phase received %@", (uint8_t *)&v2, 0xCu);
}

- (void)_sendProgressNotificationIfNeededForLanguage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"CACNotificationAssetDownloadProgressChanged";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "Sent notification %@ for language %@", (uint8_t *)&v2, 0x16u);
}

- (void)_handleErrorInDownloadForLanguage:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 downloadErrorDictionary];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_238377000, v3, v4, "Error for  language %@. Error Dictionary: %@", v5, v6, v7, v8, v9);
}

@end