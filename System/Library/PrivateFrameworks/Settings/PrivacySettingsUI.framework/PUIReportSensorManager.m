@interface PUIReportSensorManager
+ (id)_iconFromImage:(id)a3;
+ (id)applicationBundleIdentifierForCategory:(id)a3;
+ (id)iconTypeIdentifierForCategory:(id)a3;
+ (id)localizedStringForCategory:(id)a3;
- (BOOL)shouldIncludeBundleID:(id)a3;
- (NSArray)allEvents;
- (id)bundleIDsAndLatestDatesFromEvents:(id)a3;
- (id)categoriesAndLatestDatesFromEvents:(id)a3;
- (id)events:(id)a3 filtered:(id)a4;
- (id)eventsFiltered:(id)a3;
- (id)loadAllEvents;
- (void)dataDidChange;
- (void)reloadDataWithCompletion:(id)a3;
- (void)setAllEvents:(id)a3;
@end

@implementation PUIReportSensorManager

+ (id)localizedStringForCategory:(id)a3
{
  v16[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F93538];
  v15[0] = *MEMORY[0x1E4F93520];
  v15[1] = v4;
  v16[0] = @"LOCATION";
  v16[1] = @"PHOTOS";
  uint64_t v5 = *MEMORY[0x1E4F93530];
  v15[2] = *MEMORY[0x1E4F93510];
  v15[3] = v5;
  v16[2] = @"CAMERA";
  v16[3] = @"MICROPHONE";
  uint64_t v6 = *MEMORY[0x1E4F93528];
  v15[4] = *MEMORY[0x1E4F93518];
  v15[5] = v6;
  v16[4] = @"CONTACTS";
  v16[5] = @"MEDIALIBRARY";
  v15[6] = *MEMORY[0x1E4F93540];
  v16[6] = @"SCREEN_RECORDING";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  v8 = [v7 objectForKeyedSubscript:v3];
  v9 = PUI_LocalizedStringForAppReport(v8);

  uint64_t v10 = [v9 length];
  v11 = v9;
  if (!v10)
  {
    v12 = _PUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PUIReportSensorManager localizedStringForCategory:]((uint64_t)v3, v12);
    }

    v11 = v3;
  }
  id v13 = v11;

  return v13;
}

+ (id)iconTypeIdentifierForCategory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke();
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

id __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke()
{
  if (PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_token_7 != -1) {
    dispatch_once(&PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_token_7, &__block_literal_global_46);
  }
  v0 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_7;
  return v0;
}

void __56__PUIReportSensorManager_iconTypeIdentifierForCategory___block_invoke_2()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F93530];
  v4[0] = *MEMORY[0x1E4F93520];
  v4[1] = v0;
  v5[0] = @"com.apple.graphic-icon.location";
  v5[1] = @"com.apple.graphic-icon.microphone-access";
  uint64_t v1 = *MEMORY[0x1E4F93510];
  v4[2] = *MEMORY[0x1E4F93540];
  v4[3] = v1;
  v5[2] = @"com.apple.graphic-icon.screen-recording";
  v5[3] = @"com.apple.graphic-icon.camera";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  id v3 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_7;
  PUIReportSensorManagerDataHasChangedNotification_block_invoke_na_once_object_7 = v2;
}

+ (id)applicationBundleIdentifierForCategory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke();
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

id __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke()
{
  if (PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_token_8 != -1) {
    dispatch_once(&PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_token_8, &__block_literal_global_62);
  }
  uint64_t v0 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_8;
  return v0;
}

void __65__PUIReportSensorManager_applicationBundleIdentifierForCategory___block_invoke_2()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F93528];
  v3[0] = *MEMORY[0x1E4F93518];
  v3[1] = v0;
  v4[0] = @"com.apple.MobileAddressBook";
  v4[1] = @"com.apple.Music";
  v3[2] = *MEMORY[0x1E4F93538];
  v4[2] = @"com.apple.mobileslideshow";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_8;
  PUIReportSensorManagerDataHasChangedNotification_block_invoke_2_na_once_object_8 = v1;
}

+ (id)_iconFromImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = v5;

  if (v3 && ([v3 CGImage], (uint64_t v7 = LICreateIconForImage()) != 0))
  {
    v8 = (CGImage *)v7;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v7 scale:0 orientation:v6];
    CGImageRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dataDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PUIReportSensorManagerDataHasChangedNotification" object:0];
}

- (BOOL)shouldIncludeBundleID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  double v6 = [v5 appTags];
  char v7 = [v6 containsObject:@"hidden"] ^ 1;

  return v7;
}

- (void)reloadDataWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke;
  v7[3] = &unk_1E6E9D8B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadAllEvents];
  [*(id *)(a1 + 32) setAllEvents:v2];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6E9D8B0;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __51__PUIReportSensorManager_reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) dataDidChange];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)loadAllEvents
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PUIReportSensorManager loadAllEvents]";
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "%s: Starting query for SFNetworkDomainTracker data", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = (id)objc_opt_new();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v3 = (void *)getPAAccessReaderClass_softClass_0;
  uint64_t v19 = getPAAccessReaderClass_softClass_0;
  if (!getPAAccessReaderClass_softClass_0)
  {
    *(void *)v25 = MEMORY[0x1E4F143A8];
    *(void *)&v25[8] = 3221225472;
    *(void *)&v25[16] = __getPAAccessReaderClass_block_invoke_0;
    v26 = &unk_1E6E9C7F8;
    v27 = &v16;
    __getPAAccessReaderClass_block_invoke_0((uint64_t)v25);
    id v3 = (void *)v17[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v16, 8);
  id v5 = [v4 sharedInstance];
  id v15 = 0;
  id v6 = [v5 publisherForReportWithError:&v15];
  id v7 = v15;

  if (v7)
  {
    id v8 = _PUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 136315394;
      *(void *)&v25[4] = "-[PUIReportSensorManager loadAllEvents]";
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v7;
      _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "%s: Error when fetching access records, %@", v25, 0x16u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__PUIReportSensorManager_loadAllEvents__block_invoke_83;
    v14[3] = &unk_1E6E9DDB0;
    v14[4] = &buf;
    id v9 = (id)[v6 sinkWithCompletion:&__block_literal_global_82 receiveInput:v14];
  }
  uint64_t v10 = _PUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(*((void *)&buf + 1) + 40) count];
    *(_DWORD *)v25 = 136315394;
    *(void *)&v25[4] = "-[PUIReportSensorManager loadAllEvents]";
    *(_WORD *)&v25[12] = 2048;
    *(void *)&v25[14] = v11;
    _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s: Finished query for SFNetworkDomainTracker data: %lu items.", v25, 0x16u);
  }

  v12 = (void *)[*(id *)(*((void *)&buf + 1) + 40) copy];
  _Block_object_dispose(&buf, 8);

  return v12;
}

void __39__PUIReportSensorManager_loadAllEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state])
  {
    id v3 = _PUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 error];
      int v5 = 136315394;
      id v6 = "-[PUIReportSensorManager loadAllEvents]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Error when sinking access records, %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

uint64_t __39__PUIReportSensorManager_loadAllEvents__block_invoke_83(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)bundleIDsAndLatestDatesFromEvents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 136315394;
    long long v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          objc_msgSend(v11, "startTime", v25, (void)v26);
          double v13 = v12;
          v14 = [v11 access];
          id v15 = [v14 accessor];
          uint64_t v16 = [v15 identifier];
          v17 = [v4 objectForKeyedSubscript:v16];
          [v17 timeIntervalSinceReferenceDate];
          double v19 = v18;

          if (v19 < v13)
          {
            v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13];
            uint64_t v21 = [v14 accessor];
            v22 = [v21 identifier];
            [v4 setObject:v20 forKeyedSubscript:v22];
          }
        }
        else
        {
          v14 = _PUILoggingFacility();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v25;
            v31 = "-[PUIReportSensorManager bundleIDsAndLatestDatesFromEvents:]";
            __int16 v32 = 2112;
            v33 = v11;
            _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record class, %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }

  v23 = (void *)[v4 copy];
  return v23;
}

- (id)categoriesAndLatestDatesFromEvents:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 136315394;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          objc_msgSend(v11, "startTime", v23, (void)v24);
          double v13 = v12;
          v14 = [v11 access];
          id v15 = [v14 category];
          uint64_t v16 = [v4 objectForKeyedSubscript:v15];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17;

          if (v18 < v13)
          {
            double v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13];
            v20 = [v14 category];
            [v4 setObject:v19 forKeyedSubscript:v20];
          }
        }
        else
        {
          v14 = _PUILoggingFacility();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v23;
            long long v29 = "-[PUIReportSensorManager categoriesAndLatestDatesFromEvents:]";
            __int16 v30 = 2112;
            v31 = v11;
            _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record class, %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  uint64_t v21 = (void *)[v4 copy];
  return v21;
}

- (id)eventsFiltered:(id)a3
{
  id v4 = a3;
  id v5 = [(PUIReportSensorManager *)self allEvents];
  uint64_t v6 = [(PUIReportSensorManager *)self events:v5 filtered:v4];

  return v6;
}

- (id)events:(id)a3 filtered:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(id, void))a4;
  if (v6)
  {
    long long v7 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
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
          if (v6[2](v6, v13)) {
            objc_msgSend(v7, "addObject:", v13, (void)v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    id v14 = (id)[v7 copy];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (NSArray)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)localizedStringForCategory:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "+[PUIReportSensorManager localizedStringForCategory:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s: unknown category: %@", (uint8_t *)&v2, 0x16u);
}

@end