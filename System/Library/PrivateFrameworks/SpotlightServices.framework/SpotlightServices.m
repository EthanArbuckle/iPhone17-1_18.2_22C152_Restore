id SSRedactString(void *a1, int a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t vars8;

  v3 = a1;
  if (SSRedactString_onceToken != -1) {
    dispatch_once(&SSRedactString_onceToken, &__block_literal_global_21);
  }
  if (SSRedactString_isSearchToolDebugMode || (v4 = [v3 length], v4 <= 4))
  {
    v5 = v3;
  }
  else
  {
    v7 = v4;
    v8 = NSString;
    v9 = [v3 substringToIndex:3];
    v10 = (void *)v9;
    if (a2)
    {
      v11 = [v3 substringFromIndex:v7 - 1];
      v5 = [v8 stringWithFormat:@"%@...%@<%lu chars>", v10, v11, v7];
    }
    else
    {
      v5 = [v8 stringWithFormat:@"%@...<%lu chars>", v9, v7];
    }
  }
  return v5;
}

id SSGeneralLog()
{
  v0 = &unk_1EBA25000;
  v1 = (void *)SSLogHandles;
  if (!SSLogHandles)
  {
    if (SSInitLogging_once != -1)
    {
      dispatch_once(&SSInitLogging_once, &__block_literal_global_18);
      v0 = (void *)&unk_1EBA25000;
    }
    v1 = (void *)v0[366];
  }
  return v1;
}

CFPropertyListRef SICreateDictionaryWithContentsOfURL(const __CFURL *a1, __CFError **a2)
{
  return _createDictionaryWithContentsOfURL(a1, 0, a2);
}

CFPropertyListRef _createDictionaryWithContentsOfURL(CFURLRef fileURL, int a2, __CFError **a3)
{
  v6 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E4F1CF80], fileURL);
  if (!v6)
  {
    if (a3)
    {
      CFStringRef v11 = @"File at URL is not readable";
      goto LABEL_15;
    }
    return 0;
  }
  v7 = v6;
  if (!CFReadStreamOpen(v6))
  {
    CFRelease(v7);
    goto LABEL_13;
  }
  if (a2) {
    CFOptionFlags v8 = 2;
  }
  else {
    CFOptionFlags v8 = 0;
  }
  CFPropertyListRef v9 = CFPropertyListCreateWithStream(0, v7, 0, v8, 0, 0);
  CFReadStreamClose(v7);
  CFRelease(v7);
  if (!v9)
  {
LABEL_13:
    if (a3)
    {
      CFStringRef v11 = @"File at URL is not a valid property list";
      goto LABEL_15;
    }
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(v9);
  if (v10 != CFDictionaryGetTypeID())
  {
    if (a3)
    {
      CFStringRef v11 = @"Property list at URL is not a dictionary";
LABEL_15:
      CFPropertyListRef v9 = 0;
      *a3 = _createErrorWithMessageAndURL(v11, fileURL);
      return v9;
    }
    return 0;
  }
  return v9;
}

CFPropertyListRef SICreateMutableDictionaryWithContentsOfURL(const __CFURL *a1, __CFError **a2)
{
  return _createDictionaryWithContentsOfURL(a1, 1, a2);
}

CFErrorRef _createErrorWithMessageAndURL(const __CFString *a1, CFURLRef anURL)
{
  if (anURL) {
    CFStringRef v3 = CFURLCopyPath(anURL);
  }
  else {
    CFStringRef v3 = 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@: %@", a1, v3);
  if (!v5)
  {
    CFErrorRef v8 = 0;
    if (!v3) {
      return v8;
    }
    goto LABEL_6;
  }
  CFStringRef v6 = v5;
  Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D170], v6);
  CFErrorRef v8 = CFErrorCreate(v4, @"com.apple.SpotlightIndex.ErrorDomain", 0, Mutable);
  CFRelease(v6);
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
  return v8;
}

BOOL isFsType(int a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(&v5, 0x878uLL);
  return !fstatfs(a1, &v5) && !strcmp(v5.f_fstypename, a2);
}

BOOL isExFat(int a1)
{
  return isFsType(a1, "exfat");
}

BOOL isMsDos(int a1)
{
  return isFsType(a1, "msdos");
}

BOOL isFat32(int a1)
{
  return isFsType(a1, "fat32");
}

id SSGetDisabledBundleSet()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v1 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:v1];
    [v2 removeObject:@"com.apple.application"];
    [v2 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v2 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v2 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    [v2 removeObject:@"com.apple.FileProvider.LocalStorage"];
    if ([v1 containsObject:@"com.apple.DocumentsApp"])
    {
      [v2 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
      [v2 addObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
      [v2 addObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
      [v2 addObject:@"com.apple.FileProvider.LocalStorage"];
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C978] array];
  }

  CFStringRef v3 = [v0 setWithArray:v2];

  return v3;
}

id SSGetDisabledAppSet()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v8 = 0;
  CFPropertyListRef v9 = &v8;
  uint64_t v10 = 0x3032000000;
  CFStringRef v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v13 = (id)CFPreferencesCopyValue(@"SBSearchDisabledApps", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v1 = (void *)v9[5];
  if (!v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __SPCopyPrefsDisabledApps_block_invoke;
    block[3] = &unk_1E634C070;
    block[4] = &v8;
    if (SPCopyPrefsDisabledApps_onceToken != -1) {
      dispatch_once(&SPCopyPrefsDisabledApps_onceToken, block);
    }
    v1 = (void *)v9[5];
    if (!v1)
    {
      uint64_t v2 = [MEMORY[0x1E4F1C978] array];
      CFStringRef v3 = (void *)v9[5];
      v9[5] = v2;

      v1 = (void *)v9[5];
    }
  }
  id v4 = v1;
  _Block_object_dispose(&v8, 8);

  statfs v5 = [v0 setWithArray:v4];

  return v5;
}

void sub_1BDB2EC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __SPCopyPrefsDisabledApps_block_invoke(uint64_t a1)
{
  if (!CFPreferencesGetAppBooleanValue(@"11.2.Migrated", @"com.apple.spotlightui", 0))
  {
    DMGetPreviousBuildVersion();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (([v6 hasPrefix:@"15A"] & 1) != 0
      || [v6 hasPrefix:@"15B"])
    {
      CFPropertyListRef v2 = CFPreferencesCopyValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;

      statfs v5 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (v5) {
        CFPreferencesSetAppValue(@"SBSearchDisabledApps", v5, @"com.apple.spotlightui");
      }
    }
    CFPreferencesSetAppValue(@"11.2.Migrated", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.spotlightui");
  }
}

size_t doBlockCompression(const uint8_t *a1, size_t a2, uint8_t **a3, compression_algorithm a4)
{
  size_t v8 = a2 + 4096;
  CFPropertyListRef v9 = (uint8_t *)malloc_type_malloc(a2 + 4096, 0xA8E18B33uLL);
  *a3 = v9;
  return compression_encode_buffer(v9, v8, a1, a2, 0, a4);
}

size_t doBlockDecompression(const uint8_t *a1, size_t a2, size_t a3, uint8_t **a4, compression_algorithm a5, int *a6)
{
  *a6 = -1;
  int TemporaryFileOfSize = allocateTemporaryFileOfSize(a3, 2);
  if ((TemporaryFileOfSize & 0x80000000) == 0)
  {
    int v13 = TemporaryFileOfSize;
    v14 = (uint8_t *)mmap(0, a3, 3, 1, TemporaryFileOfSize, 0);
    *a4 = v14;
    if (v14 != (uint8_t *)-1)
    {
      size_t result = compression_decode_buffer(v14, a3, a1, a2, 0, a5);
      if (result)
      {
        *a6 = v13;
        return result;
      }
    }
    close(v13);
  }
  return 0;
}

uint64_t allocateTemporaryFileOfSize(off_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15[0] = 0x300000002;
  v15[1] = 0;
  v15[2] = a1;
  v15[3] = 0;
  id v4 = NSHomeDirectory();
  statfs v5 = objc_msgSend(NSString, "stringWithFormat:", @"/Library/Spotlight/Backup/temp_%lu.dat", a2);
  id v6 = [v4 stringByAppendingPathComponent:v5];

  id v7 = v6;
  uint64_t v8 = open((const char *)[v7 UTF8String], 514, 384);
  if ((v8 & 0x80000000) != 0)
  {
    int v13 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      allocateTemporaryFileOfSize_cold_1();
    }

    goto LABEL_13;
  }
  uint64_t v9 = v8;
  if (fcntl(v8, 42, v15) == -1)
  {
    uint64_t v10 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = *__error();
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl(&dword_1BDB2A000, v10, OS_LOG_TYPE_INFO, "preallocated temporary file failed. %d\n", buf, 8u);
    }
  }
  if (ftruncate(v9, a1) == -1)
  {
    v12 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      allocateTemporaryFileOfSize_cold_2(v12);
    }

    close(v9);
LABEL_13:
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1BDB33CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BDB340A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BDB34E38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB357A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

const char *isEventSearchIntent()
{
  size_t result = (const char *)intentLabel();
  if (result)
  {
    v1 = result;
    if (!strncmp(result, "INTENT_FLIGHT", 0xDuLL) || !strncmp(v1, "INTENT_HOTEL", 0xCuLL)) {
      return (const char *)1;
    }
    else {
      return (const char *)(strncmp(v1, "INTENT_RESTAURANT", 0x11uLL) == 0);
    }
  }
  return result;
}

uint64_t translateKey(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"default"])
  {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFELL;
  }
  else
  {
    uint64_t v3 = [v1 integerValue];
    if ((unint64_t)(v3 - 1) >= 0x3FF) {
      uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v2 = v3;
    }
  }

  return v2;
}

uint64_t indexForItem(uint64_t a1, void *a2)
{
  if (a1 == 0x7FFFFFFFFFFFFFFELL)
  {
    id v3 = a2;
    uint64_t v4 = [v3 count];
    uint64_t v5 = [v3 lastIndex];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5 + 1;
    }
    [v3 addIndex:v6];
  }
  else
  {
    uint64_t v4 = objc_msgSend(a2, "countOfIndexesInRange:", 0, a1);
  }

  return v4;
}

uint64_t isQUIntentMatchBundle(int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 <= 21)
  {
    uint64_t v5 = 0;
    switch(a1)
    {
      case 0:
        goto LABEL_22;
      case 1:
        if ((SSSectionIsSyndicatedPhotos(v3) & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 2:
        uint64_t v6 = PRSRankingMailBundleString;
        goto LABEL_14;
      case 3:
        uint64_t v6 = PRSRankingMessagesBundleString;
        goto LABEL_14;
      case 4:
        uint64_t v6 = PRSRankingNotesBundleString;
        goto LABEL_14;
      case 5:
        if (([v3 isEqualToString:@"com.apple.DocumentsApp"] & 1) != 0
          || ([v4 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0
          || ([v4 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0)
        {
          goto LABEL_15;
        }
        uint64_t v6 = SSResultBundleIdFileProviderManagedDocument;
        goto LABEL_14;
      default:
        goto LABEL_16;
    }
  }
  switch(a1)
  {
    case 22:
      uint64_t v6 = PRSRankingSafariBundleString;
      break;
    case 23:
      uint64_t v6 = PRSRankingCalendarBundleString;
      break;
    case 24:
      uint64_t v6 = PRSRankingRemindersBundleString;
      break;
    default:
      goto LABEL_16;
  }
LABEL_14:
  if ([v4 isEqualToString:*v6])
  {
LABEL_15:
    uint64_t v5 = 1;
    goto LABEL_22;
  }
LABEL_16:
  id v7 = (const char *)intentLabel();
  if (v7
    && ((uint64_t v8 = v7, !strncmp(v7, "INTENT_FLIGHT", 0xDuLL))
     || !strncmp(v8, "INTENT_HOTEL", 0xCuLL)
     || !strncmp(v8, "INTENT_RESTAURANT", 0x11uLL)))
  {
    uint64_t v5 = [v4 isEqualToString:@"com.apple.spotlight.events"];
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_22:

  return v5;
}

void sub_1BDB412C0(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1BDB441C0(_Unwind_Exception *a1)
{
}

uint64_t SPSpamDemotionDisabled()
{
  if (SPSpamDemotionDisabled_onceToken != -1) {
    dispatch_once(&SPSpamDemotionDisabled_onceToken, &__block_literal_global_516);
  }
  return SPSpamDemotionDisabled__spamDemotionDisabled;
}

uint64_t __SPSpamDemotionDisabled_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingSpamDemotionDisabled"];

  if (v3) {
    char v1 = [v3 BOOLValue];
  }
  else {
    char v1 = 0;
  }
  SPSpamDemotionDisabled__spamDemotionDisabled = v1;
  return MEMORY[0x1F41817F8]();
}

uint64_t SPBlockGroupingEnabled()
{
  if (SPBlockGroupingEnabled_onceToken != -1) {
    dispatch_once(&SPBlockGroupingEnabled_onceToken, &__block_literal_global_524);
  }
  return SPBlockGroupingEnabled__blockGroupingEnabled;
}

uint64_t __SPBlockGroupingEnabled_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingBlockGroupingEnabled"];

  if (v3) {
    char v1 = [v3 BOOLValue];
  }
  else {
    char v1 = 0;
  }
  SPBlockGroupingEnabled__blockGroupingEnabled = v1;
  return MEMORY[0x1F41817F8]();
}

uint64_t SPExperimentalScoringEnabled()
{
  if (SPExperimentalScoringEnabled_onceToken != -1) {
    dispatch_once(&SPExperimentalScoringEnabled_onceToken, &__block_literal_global_529);
  }
  return SPExperimentalScoringEnabled__experimentalScoringEnabled;
}

uint64_t __SPExperimentalScoringEnabled_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingExperimentalScoringEnabled"];

  if (v3) {
    char v1 = [v3 BOOLValue];
  }
  else {
    char v1 = 0;
  }
  SPExperimentalScoringEnabled__experimentalScoringEnabled = v1;
  return MEMORY[0x1F41817F8]();
}

float SPRankingTopHitMustBeOverrideMinScore()
{
  if (SPRankingTopHitMustBeOverrideMinScore_onceToken != -1) {
    dispatch_once(&SPRankingTopHitMustBeOverrideMinScore_onceToken, &__block_literal_global_534);
  }
  return *(float *)&SPRankingTopHitMustBeOverrideMinScore__topHitMustBeOverrideMinScore;
}

void __SPRankingTopHitMustBeOverrideMinScore_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingTopHitMustBeOverrideMinScore"];

  char v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    char v1 = v3;
    SPRankingTopHitMustBeOverrideMinScore__topHitMustBeOverrideMinScore = v2;
  }
}

float SPRankingTopHitMustBeOverrideMinFileScore()
{
  if (SPRankingTopHitMustBeOverrideMinFileScore_onceToken != -1) {
    dispatch_once(&SPRankingTopHitMustBeOverrideMinFileScore_onceToken, &__block_literal_global_539);
  }
  return *(float *)&SPRankingTopHitMustBeOverrideMinFileScore__topHitMustBeOverrideMinFileScore;
}

void __SPRankingTopHitMustBeOverrideMinFileScore_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingTopHitMustBeOverrideMinFileScore"];

  char v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    char v1 = v3;
    SPRankingTopHitMustBeOverrideMinFileScore__topHitMustBeOverrideMinFileScore = v2;
  }
}

float SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore()
{
  if (SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken != -1) {
    dispatch_once(&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken, &__block_literal_global_544);
  }
  return *(float *)&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore__topHitMustBeOverrideMinSpellCorrectedAppScore;
}

void __SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore"];

  char v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    char v1 = v3;
    SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore__topHitMustBeOverrideMinSpellCorrectedAppScore = v2;
  }
}

BOOL preferShortCutOverFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[v3 attributes], 7uLL);
  uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 7uLL);
  if ([v5 isEqualToString:v6])
  {
    id v7 = [v3 L2FeatureVector];
    [v7 scoreForFeature:165];
    float v9 = v8;

    uint64_t v10 = [v4 L2FeatureVector];
    [v10 scoreForFeature:165];
    float v12 = v11;

    BOOL v13 = v9 == v12 && v9 != 2147500000.0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t preferContactOverMusic(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 L2FeatureVector];
  [v5 scoreForFeature:165];
  float v7 = v6;

  float v8 = SSMinContactsTopHitScore();
  if (v7 == 2147500000.0) {
    goto LABEL_7;
  }
  float v9 = [v3 L2FeatureVector];
  [v9 originalL2Score];
  float v11 = v10;

  if (v11 <= v8) {
    goto LABEL_7;
  }
  float v12 = [v4 L2FeatureVector];
  [v12 scoreForFeature:167];
  float v14 = v13;

  uint64_t v15 = [v4 L2FeatureVector];
  [v15 scoreForFeature:185];
  float v17 = v16;

  uint64_t v18 = [v4 L2FeatureVector];
  [v18 scoreForFeature:181];
  float v20 = v19;

  v21 = [v4 L2FeatureVector];
  [v21 scoreForFeature:876];
  float v23 = v22;

  if (v14 != 2147500000.0 || v17 != 2147500000.0 || (uint64_t v24 = 1, v20 == 2147500000.0) && v23 == 2147500000.0) {
LABEL_7:
  }
    uint64_t v24 = 0;

  return v24;
}

BOOL preferAppOverPhotosApp(void *a1)
{
  char v1 = [a1 L2FeatureVector];
  [v1 scoreForFeature:165];
  float v3 = v2;

  return v3 != 2147500000.0;
}

void logRule(void *a1, void *a2, void *a3, void *a4)
{
  id v19 = a1;
  id v7 = a2;
  id v8 = a3;
  float v9 = a4;
  if (v9 && isInternalDevice)
  {
    if (v7 && v8)
    {
      float v10 = (void *)MEMORY[0x1E4F28E78];
      float v11 = [v7 identifier];
      float v12 = [v8 identifier];
      float v13 = [v10 stringWithFormat:@"item1=%@ item2=%@", v11, v12];

LABEL_8:
      uint64_t v15 = [(__CFString *)v9 objectForKey:v19];
      if (v15)
      {
        float v16 = v15;
        float v17 = @"1";
        id v18 = v13;
      }
      else
      {
        float v16 = (__CFString *)objc_opt_new();
        [(__CFString *)v16 setObject:@"1" forKey:v13];
        uint64_t v15 = v9;
        float v17 = v16;
        id v18 = v19;
      }
      [(__CFString *)v15 setObject:v17 forKey:v18];

      goto LABEL_12;
    }
    if (v7)
    {
      float v14 = (void *)MEMORY[0x1E4F28E78];
      float v11 = [v7 identifier];
      float v13 = [v14 stringWithFormat:@"item=%@", v11];
      goto LABEL_8;
    }
  }
LABEL_12:
}

uint64_t compareBestLocalResultsWithRules(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v5 rankingItem];
  float v9 = [v6 rankingItem];
  float v10 = [v5 rankingItem];
  int v11 = [v10 shouldHideUnderShowMore];

  float v12 = [v6 rankingItem];
  int v13 = [v12 shouldHideUnderShowMore];

  if ((v11 & 1) != 0 || !v13)
  {
    if (((v11 ^ 1 | v13) & 1) == 0)
    {
      float v22 = @"rule:l3_local:should_hide_under_show_more";
      float v23 = v5;
      goto LABEL_10;
    }
    id v18 = [v8 L2FeatureVector];
    if (v18)
    {
      id v19 = [v8 L2FeatureVector];
      [v19 scoreForFeature:3234];
      BOOL v21 = v20 != 0.0;
    }
    else
    {
      BOOL v21 = 0;
    }

    v25 = [v8 L2FeatureVector];
    if (v25)
    {
      v26 = [v9 L2FeatureVector];
      [v26 scoreForFeature:3234];
      BOOL v28 = v27 != 0.0;
    }
    else
    {
      BOOL v28 = 0;
    }

    if (([v8 bundleIDType] & 0x200000) == 0 || (objc_msgSend(v9, "bundleIDType") & 0x800) == 0)
    {
      if (([v8 bundleIDType] & 0x800) != 0 && (objc_msgSend(v9, "bundleIDType") & 0x200000) != 0)
      {
        if (!preferShortCutOverFile(v9, v8)) {
          goto LABEL_52;
        }
        float v22 = @"rule:l3_local:prefer_shortcut_over_file";
      }
      else
      {
        if (([v8 bundleIDType] & 4) != 0 && (objc_msgSend(v9, "bundleIDType") & 0x200) != 0)
        {
          if (!preferContactOverMusic(v8, v9)) {
            goto LABEL_52;
          }
          float v14 = @"rule:l3_local:prefer_contact_over_music";
          goto LABEL_39;
        }
        if (([v8 bundleIDType] & 0x200) == 0 || (objc_msgSend(v9, "bundleIDType") & 4) == 0)
        {
          if (([v8 bundleIDType] & 0x100) == 0 && (objc_msgSend(v8, "bundleIDType") & 0x10000) == 0
            || ([v9 bundleIDType] & 0x40000) == 0)
          {
            if (([v8 bundleIDType] & 0x40000) != 0
              && (([v9 bundleIDType] & 0x100) != 0 || (objc_msgSend(v9, "bundleIDType") & 0x10000) != 0))
            {
              if (preferAppOverPhotosApp(v9))
              {
                float v22 = @"rule:l3_local:prefer_apps_over_photosapp";
                goto LABEL_46;
              }
LABEL_52:
              uint64_t v17 = 0;
              goto LABEL_53;
            }
            if (([v8 bundleIDType] & 4) != 0 && objc_msgSend(v8, "isPerfectMatch"))
            {
              float v14 = @"rule:l3_local:contact_is_perfect_match";
LABEL_55:
              uint64_t v15 = v5;
              goto LABEL_4;
            }
            if (([v9 bundleIDType] & 4) != 0 && objc_msgSend(v9, "isPerfectMatch"))
            {
              float v22 = @"rule:l3_local:contact_is_perfect_match";
            }
            else
            {
              if (v21 && !v28)
              {
                float v14 = @"rule:l3_local:contact_is_associate_with_tophit_contact";
                goto LABEL_55;
              }
              if (!v28 || v21) {
                goto LABEL_52;
              }
              float v22 = @"rule:l3_local:contact_is_associate_with_tophit_contact";
            }
            float v23 = v6;
LABEL_10:
            uint64_t v24 = 0;
LABEL_11:
            logRule(v22, v23, v24, v7);
            uint64_t v17 = -1;
            goto LABEL_53;
          }
          v29 = [v8 L2FeatureVector];
          [v29 scoreForFeature:165];
          float v31 = v30;

          if (v31 == 2147500000.0) {
            goto LABEL_52;
          }
          float v14 = @"rule:l3_local:prefer_apps_over_photosapp";
LABEL_39:
          uint64_t v15 = v5;
          float v16 = v6;
          goto LABEL_5;
        }
        if (!preferContactOverMusic(v9, v8)) {
          goto LABEL_52;
        }
        float v22 = @"rule:l3_local:prefer_contact_over_music";
      }
LABEL_46:
      float v23 = v6;
      uint64_t v24 = v5;
      goto LABEL_11;
    }
    if (!preferShortCutOverFile(v8, v9)) {
      goto LABEL_52;
    }
    float v14 = @"rule:l3_local:prefer_shortcut_over_file";
    goto LABEL_39;
  }
  float v14 = @"rule:l3_local:should_hide_under_show_more";
  uint64_t v15 = v6;
LABEL_4:
  float v16 = 0;
LABEL_5:
  logRule(v14, v15, v16, v7);
  uint64_t v17 = 1;
LABEL_53:

  return v17;
}

void sub_1BDB4CF54(_Unwind_Exception *a1)
{
}

void sub_1BDB4F97C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1BDB4FD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDB50CC8(_Unwind_Exception *a1)
{
}

id getTrialDictionaryForLengthAndTermCount(id *a1, unint64_t a2, unint64_t a3)
{
  -[SSCompactValueArray objectAtIndex:](a1, a3);
  id v4 = (id *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SSCompactValueArray objectAtIndex:](v4, a2);

  return v5;
}

uint64_t isLLMQUIntentMatchBundle(int a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((a1 & 1) != 0 && ([v3 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
    || (a1 & 2) != 0 && ([v4 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || (a1 & 4) != 0 && (SSSectionIsSyndicatedPhotos(v4) & 1) != 0
    || (a1 & 8) != 0 && ([v4 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
    || (a1 & 0x10) != 0 && ([v4 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0
    || (a1 & 0x20) != 0 && ([v4 isEqualToString:@"com.apple.mobilecal"] & 1) != 0
    || (a1 & 0x40) != 0 && ([v4 isEqualToString:@"com.apple.reminders"] & 1) != 0
    || (*(void *)&a1 & 0x3C000) != 0
    && [v4 isEqualToString:@"com.apple.spotlight.events"]
    && (_os_feature_enabled_impl() & 1) != 0
    || (a1 & 0x100) != 0
    && (([v4 isEqualToString:@"com.apple.MobileAddressBook"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.spotlight.contacts"] & 1) != 0)
    || (a1 & 0x200) != 0
    && (([v4 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0)
    || (a1 & 0x1000000) != 0 && ([v4 isEqualToString:@"com.apple.VoiceMemos"] & 1) != 0
    || (a1 & 0x4000000) != 0 && ([v4 isEqualToString:@"com.apple.Passbook"] & 1) != 0
    || (a1 & 0x8000000) != 0 && ([v4 isEqualToString:@"com.apple.freeform"] & 1) != 0
    || (a1 & 0x3C00) != 0
    && (([v4 isEqualToString:@"com.apple.DocumentsApp"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"] & 1) != 0)
    || (*(void *)&a1 & 0x800000) != 0
    && ([v4 isEqualToString:@"com.apple.mobilephone"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else if ((a1 & 0x2000000) != 0)
  {
    uint64_t v5 = [v4 isEqualToString:@"com.apple.journal"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

double SSRankingManagerTopHitThreshold(void *a1, unint64_t a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v5, a2, a3, 0);
  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v5, a2, a3, 1);

    if (![v7 count])
    {
      double v10 = 2.0;
      goto LABEL_6;
    }
    id v6 = v7;
  }
  id v8 = [v6 objectAtIndexedSubscript:0];
  [v8 doubleValue];
  double v10 = v9;

LABEL_6:
  return v10;
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode = result;
  return result;
}

void __loadRankingThresholdingParameters_block_invoke()
{
  v0 = SSDefaultsGetAssetPath(@"rankingConfig.plist");
  if (v0)
  {
    char v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v0];
    float v2 = v1;
    if (v1)
    {
      id v3 = [v1 objectForKey:@"AcrossBundleAbsoluteThreshold"];
      id v4 = [v2 objectForKey:@"AcrossBundleRelativeThreshold"];
      id v5 = [v2 objectForKey:@"InBundleRelativeThreshold"];
      id v6 = [v2 objectForKey:@"InBundleAbsoluteThreshold"];
      if (v3)
      {
        [v3 floatValue];
        acrossBundleAbsoluteThreshold = v7;
      }
      if (v4)
      {
        [v4 floatValue];
        acrossBundleRelativeThreshold = v8;
      }
      if (v5)
      {
        [v5 floatValue];
        inBundleRelativeThreshold = v9;
      }
      if (v6)
      {
        double v10 = [v6 objectForKey:@"com.apple.DocumentsApp"];
        int v11 = [v6 objectForKey:@"com.apple.mobileslideshow"];
        if (v10)
        {
          [v10 floatValue];
          inBundleAbsoluteThresholdForFiles = v12;
        }
        if (v11)
        {
          [v11 floatValue];
          inBundleAbsoluteThresholdForPhotos = v13;
        }
      }
      float v14 = [v2 objectForKey:@"FreshnessThresholdNumDays"];
      uint64_t v15 = v14;
      if (v14)
      {
        BOOL v21 = v3;
        float v16 = [v14 objectForKey:@"FutureEventMailOrMessages"];
        uint64_t v17 = [v15 objectForKey:@"FutureMailOrMessages"];
        id v18 = [v15 objectForKey:@"FutureEventGeneric"];
        id v19 = [v15 objectForKey:@"FutureGeneric"];
        if (v16) {
          futureEventFromQUMailAndMessagesRecencyThreshold = [v16 intValue];
        }
        if (v17) {
          futureFromQUMailAndMessagesRecencyThreshold = [v17 intValue];
        }
        if (v18) {
          futureEventFromQUGenericRecencyThreshold = [v18 intValue];
        }
        if (v19) {
          futureFromQUGenericRecencyThreshold = [v19 intValue];
        }

        id v3 = v21;
      }
      float v20 = SSGeneralLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __loadRankingThresholdingParameters_block_invoke_cold_2((uint64_t)v2, v20);
      }
    }
  }
  else
  {
    float v2 = SSGeneralLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __loadRankingThresholdingParameters_block_invoke_cold_1(v2);
    }
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t json_writer_init_with_buffer(uint64_t result, unint64_t a2)
{
  if (a2 < 0x21) {
    return 0;
  }
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)uint64_t result = 0xFFFFFFFFLL;
  *(void *)(result + 16) = a2 - 32;
  *(void *)(result + 24) = result + 32;
  *(_WORD *)(result + _Block_object_dispose(&STACK[0x200], 8) = 1;
  *(unsigned char *)(result + 10) = 1;
  return result;
}

unsigned char *json_writer_create_with_path(const char *a1, uint64_t a2)
{
  unint64_t v3 = a2 + 32;
  id v4 = malloc_type_malloc(a2 + 32, 0xABF88379uLL);
  if (!json_writer_init_with_buffer((uint64_t)v4, v3) || (v5 = open(a1, 1537, 438), *(_DWORD *)id v4 = v5, v5 == -1))
  {
    free(v4);
    return 0;
  }
  else
  {
    v4[10] = 0;
  }
  return v4;
}

void json_writer_dispose(int *a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2 != -1)
    {
      if (!a1[1])
      {
        json_writer_flush((ssize_t)a1);
        int v2 = *a1;
      }
      close(v2);
    }
    free(a1);
  }
}

ssize_t json_writer_flush(ssize_t result)
{
  if (!*(_DWORD *)(result + 4))
  {
    ssize_t v1 = result;
    if (!*(unsigned char *)(result + 10))
    {
      uint64_t result = write(*(_DWORD *)result, (const void *)(result + 32), *(void *)(result + 24) - (result + 32));
      if (result == -1)
      {
        uint64_t result = (ssize_t)__error();
        int v2 = *(_DWORD *)result;
        if (!*(_DWORD *)result) {
          int v2 = -1;
        }
        *(_DWORD *)(v1 + 4) = v2;
      }
      *(void *)(v1 + 24) = v1 + 32;
    }
  }
  return result;
}

uint64_t json_writer_get_data(uint64_t result, void *a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 4))
    {
      return 0;
    }
    else
    {
      if (a2) {
        *a2 = result + 32;
      }
      return *(void *)(result + 24) - result - 32;
    }
  }
  return result;
}

uint64_t json_writer_get_err(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 4);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t json_writer_get_fd(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

_DWORD *json_writer_add_raw_value(uint64_t a1, char *__src, size_t __n)
{
  if (!*(_WORD *)(a1 + 8)) {
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  }
  if (__n == -1) {
    __n = strlen(__src);
  }
  uint64_t result = _json_writer_add((_DWORD *)a1, __src, __n);
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  return result;
}

_DWORD *_json_writer_add(_DWORD *result, char *__src, size_t __n)
{
  if (__n)
  {
    unint64_t v3 = result;
    if (!result[1])
    {
      size_t v4 = __n;
      uint64_t v6 = (char *)(result + 8);
      uint64_t result = (_DWORD *)*((void *)result + 3);
      while (1)
      {
        size_t v7 = v6 - (char *)result + *((void *)v3 + 2);
        if (v4 <= v7)
        {
          uint64_t result = memcpy(result, __src, v4);
          *((void *)v3 + 3) += v4;
          return result;
        }
        if (*((unsigned char *)v3 + 10))
        {
          int v8 = 7;
          goto LABEL_13;
        }
        memcpy(result, __src, v7);
        if (write(*v3, v3 + 8, *((void *)v3 + 2)) == -1) {
          break;
        }
        *((void *)v3 + 3) = v6;
        __src += v7;
        uint64_t result = v3 + 8;
        v4 -= v7;
        if (!v4) {
          return result;
        }
      }
      uint64_t result = __error();
      int v8 = *result;
      if (!*result) {
        int v8 = -1;
      }
LABEL_13:
      v3[1] = v8;
    }
  }
  return result;
}

_DWORD *json_writer_add_true(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "true", 4uLL);
}

_DWORD *json_writer_add_false(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "false", 5uLL);
}

_DWORD *json_writer_add_null(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "null", 4uLL);
}

_DWORD *json_writer_add_uint64(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x80uLL, "%llu", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_add_int64(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x80uLL, "%lld", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_add_double(_DWORD *result, double a2)
{
  uint64_t v2 = (uint64_t)result;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    result[1] = 22;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    *(_OWORD *)__str = 0u;
    long long v4 = 0u;
    snprintf(__str, 0x80uLL, "%.*g", 17, a2);
    return json_writer_add_raw_value(v2, __str, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

_DWORD *json_writer_add_uint32(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x80uLL, "%u", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_begin_array(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 8) && !*(unsigned char *)(a1 + 9)) {
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  }
  uint64_t result = _json_writer_add((_DWORD *)a1, "[", 1uLL);
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 1;
  return result;
}

_DWORD *json_writer_end_array(uint64_t a1)
{
  uint64_t result = _json_writer_add((_DWORD *)a1, "]", 1uLL);
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  return result;
}

_DWORD *json_writer_begin_dictionary(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 8) && !*(unsigned char *)(a1 + 9)) {
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  }
  uint64_t result = _json_writer_add((_DWORD *)a1, "{", 1uLL);
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 1;
  return result;
}

_DWORD *json_writer_end_dictionary(uint64_t a1)
{
  uint64_t result = _json_writer_add((_DWORD *)a1, "}", 1uLL);
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  return result;
}

_DWORD *json_writer_add_key(uint64_t a1, char *a2, size_t a3, int a4)
{
  if (*(unsigned char *)(a1 + 9) && !*(_DWORD *)(a1 + 4)) {
    *(_DWORD *)(a1 + 4) = -1;
  }
  if (!*(unsigned char *)(a1 + 8)) {
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  }
  _json_writer_add((_DWORD *)a1, "\"", 1uLL);
  if (a4)
  {
    if (a3 == -1) {
      a3 = strlen(a2);
    }
    _json_writer_add((_DWORD *)a1, a2, a3);
  }
  else
  {
    if (a3 == -1) {
      a3 = strlen(a2);
    }
    _json_writer_add_string_escaping((_DWORD *)a1, a2, a3);
  }
  uint64_t result = _json_writer_add((_DWORD *)a1, "\":", 2uLL);
  *(unsigned char *)(a1 + 9) = 1;
  return result;
}

_DWORD *_json_writer_add_string_escaping(_DWORD *result, char *a2, uint64_t a3)
{
  __src[0] = 92;
  if (a3)
  {
    uint64_t v3 = a3;
    long long v4 = result;
    long long v5 = a2;
    long long v6 = a2;
    do
    {
      int v8 = *v6++;
      int v7 = v8;
      if ((v8 & 0x80) == 0)
      {
        int v9 = v7 - 8;
        char v10 = 98;
        switch(v9)
        {
          case 0:
            goto LABEL_9;
          case 1:
            char v10 = 116;
            goto LABEL_9;
          case 2:
            char v10 = 110;
            goto LABEL_9;
          case 4:
            char v10 = 102;
            goto LABEL_9;
          case 5:
            char v10 = 114;
LABEL_9:
            __src[1] = v10;
            _json_writer_add(v4, a2, v5 - a2);
            uint64_t result = _json_writer_add(v4, __src, 2uLL);
            a2 = v6;
            break;
          default:
            break;
        }
      }
      ++v5;
      --v3;
    }
    while (v3);
    if (v6 != a2)
    {
      return _json_writer_add(v4, a2, v5 - a2);
    }
  }
  return result;
}

_DWORD *json_writer_add_string(_DWORD *result, char *a2, size_t a3, int a4)
{
  if (a2)
  {
    uint64_t v7 = (uint64_t)result;
    if (!*((unsigned char *)result + 8) && !*((unsigned char *)result + 9)) {
      _json_writer_add(result, ",", 1uLL);
    }
    _json_writer_add((_DWORD *)v7, "\"", 1uLL);
    if (a4)
    {
      if (a3 == -1) {
        a3 = strlen(a2);
      }
      _json_writer_add((_DWORD *)v7, a2, a3);
    }
    else
    {
      if (a3 == -1) {
        a3 = strlen(a2);
      }
      _json_writer_add_string_escaping((_DWORD *)v7, a2, a3);
    }
    uint64_t result = _json_writer_add((_DWORD *)v7, "\"", 1uLL);
    *(_WORD *)(v7 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  }
  return result;
}

BOOL SSThresholdRankedItem(void *a1, void *a2, uint64_t a3, char a4, void *a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a5;
  float v14 = [v11 sectionBundleIdentifier];
  id v15 = v13;
  if (SPQueryKindIsSearchToolSearch_onceToken_0 != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken_0, &__block_literal_global_3);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_0) {
    goto LABEL_4;
  }
  if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking_0)
  {

LABEL_18:
    if (SSSectionIsMailOrPommesCTL(v14))
    {
      [v11 pommesL1Score];
      if (v21 >= 0.001) {
        goto LABEL_5;
      }
      [v11 embeddingSimilarity];
      if (v22 >= 0.6) {
        goto LABEL_5;
      }
      float v16 = @"[L1]";
    }
    else
    {
      if ((a4 & 1) != 0 || ![MEMORY[0x1E4FA5D58] isCalendarBundle:v14]) {
        goto LABEL_5;
      }
      float v23 = SSCompactRankingAttrsGetValue((int8x8_t *)[v11 attributes], 0x12uLL);
      uint64_t v24 = v23;
      if (v23 && ([v23 timeIntervalSinceNow], *(float *)&double v25 = v25 / -86400.0, *(float *)&v25 > 30.0)) {
        float v16 = @"[Freshness]";
      }
      else {
        float v16 = 0;
      }
    }
    goto LABEL_6;
  }
  if (([v15 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || [v15 hasPrefix:@"com.apple.intelligenceflow"])
  {
LABEL_4:

LABEL_5:
    float v16 = 0;
    goto LABEL_6;
  }
  char v20 = [v15 hasPrefix:@"com.apple.ondeviceeval"];

  float v16 = 0;
  if (a6 != 12 && (v20 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_6:
  uint64_t v17 = [(__CFString *)v16 length];
  if (v17)
  {
    id v18 = SSPommesRankerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v26 = SSRedactString(v12, 0);
      float v27 = [v11 description];
      int v28 = 138413314;
      v29 = v14;
      __int16 v30 = 2048;
      uint64_t v31 = a3;
      __int16 v32 = 2112;
      v33 = v26;
      __int16 v34 = 2112;
      v35 = v16;
      __int16 v36 = 2112;
      v37 = v27;
      _os_log_debug_impl(&dword_1BDB2A000, v18, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"][thresholded] %@ item: %@", (uint8_t *)&v28, 0x34u);
    }
  }

  return v17 != 0;
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke_0()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking_0 = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_0 = result;
  return result;
}

void updateSafariRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a2;
  int v8 = SSCompactRankingAttrsGetValue((int8x8_t *)[v6 attributes], 0x69uLL);
  int v9 = [v6 interestingDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = 0.0;
  double v12 = exp(trunc(fmax(a4 - v10, 0.0)) / 86400.0 * -1.39 / 30.0);

  id v13 = v6;
  id v14 = v7;
  uint64_t v74 = 0;
  SSCompactRankingAttrsGetFloat([v13 attributes], 0x14BuLL, (_DWORD *)&v74 + 1);
  SSCompactRankingAttrsGetFloat([v13 attributes], 0x41uLL, &v74);
  id v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[v13 attributes], 0x3CuLL);
  float v16 = [v13 contentType];
  int v17 = [v16 isEqualToString:@"com.apple.safari.bookmark"];
  int v69 = [v16 isEqualToString:@"com.apple.safari.readinglist"];
  id v18 = &off_1BDC5D000;
  double v19 = 0.0;
  if ([v15 count])
  {
    int v67 = v17;
    id v64 = v14;
    v65 = v8;
    char v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v99 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v71 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * i) timeIntervalSinceReferenceDate];
          double v27 = trunc(fmax(a4 - v26, 0.0)) / 86400.0;
          if (v27 <= 30.0)
          {
            int v28 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v27];
            [v20 addObject:v28];

            double v19 = v19 + exp(v27 * -0.23);
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v99 count:16];
      }
      while (v23);
    }

    if ([v20 count])
    {
      double v19 = fmin(v19, 1.0);
      id v18 = &off_1BDC5D000;
      double v11 = fmin(log((double)(unint64_t)([v20 count] + 1)) / 2.7080502, 1.0);
      id v14 = v64;
      int v8 = v65;
      int v17 = v67;
    }
    else
    {
      id v14 = v64;
      int v8 = v65;
      int v17 = v67;
      id v18 = &off_1BDC5D000;
    }
  }
  if (*((float *)&v74 + 1) <= 0.0) {
    double v29 = *(float *)&v74;
  }
  else {
    double v29 = *((float *)&v74 + 1) / 100.0;
  }
  double v30 = fmin(log(v29 + 1.0) / *((double *)v18 + 116), 1.0);
  uint64_t v31 = [v13 identifier];
  uint64_t v32 = [v31 length];

  if (v32)
  {
    v33 = SSPommesRankerLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v66 = [v13 sectionBundleIdentifier];
      SSRedactString(v14, 0);
      v50 = int v68 = v17;
      uint64_t v51 = [v13 identifier];
      *(_DWORD *)buf = 138414850;
      v78 = v66;
      __int16 v79 = 2048;
      uint64_t v80 = a3;
      __int16 v81 = 2112;
      v82 = v50;
      __int16 v83 = 2112;
      uint64_t v84 = v51;
      v52 = (void *)v51;
      __int16 v85 = 2048;
      double v86 = *((float *)&v74 + 1);
      __int16 v87 = 2048;
      double v88 = *(float *)&v74;
      __int16 v89 = 2048;
      double v90 = v30;
      __int16 v91 = 2048;
      double v92 = v11;
      __int16 v93 = 2048;
      double v94 = v19;
      __int16 v95 = 1024;
      int v96 = v68;
      __int16 v97 = 1024;
      int v98 = v69;
      _os_log_debug_impl(&dword_1BDB2A000, v33, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Engagement break down for item %@: visit count score=%.04f, used count=%.04f (normed: %.04f), distinct dates score=%.04f, decayed engagement dates score=%.04f (bookmark=%d, readinglist=%d)", buf, 0x68u);

      int v17 = v68;
    }
  }
  double v34 = v11 * 0.15 + v30 * 0.4 + v19 * 0.45 + 0.65;
  if (v34 > 1.0) {
    double v34 = 1.0;
  }
  if (v17 | v69) {
    double v35 = v34;
  }
  else {
    double v35 = v11 * 0.15 + v30 * 0.4 + v19 * 0.45;
  }

  [v13 pommesL1Score];
  float v37 = v36;
  double v38 = v36;
  if (_os_feature_enabled_impl())
  {
    [v13 embeddingSimilarity];
    if (v37 >= v39) {
      double v40 = v38;
    }
    else {
      double v40 = v39;
    }
    double v38 = fmin(v40, 1.0);
  }
  double v41 = v12 * 0.14 + v38 * 0.5 + v35 * 0.36;
  *(float *)&double v41 = v41;
  [v13 setL2Score:v41];
  v42 = [v13 identifier];
  uint64_t v43 = [v42 length];

  if (v43)
  {
    v44 = SSPommesRankerLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v53 = [v13 sectionBundleIdentifier];
      v54 = SSRedactString(v14, 0);
      [v13 identifier];
      v56 = id v55 = v14;
      int v57 = [v8 unsignedIntValue];
      [v13 pommesL1Score];
      double v59 = v58;
      [v13 embeddingSimilarity];
      double v61 = v60;
      [v13 l2Score];
      *(_DWORD *)v99 = 138414594;
      v100 = v53;
      __int16 v101 = 2048;
      uint64_t v102 = a3;
      __int16 v103 = 2112;
      v104 = v54;
      __int16 v105 = 2112;
      v106 = v56;
      __int16 v107 = 1024;
      int v108 = v57;
      __int16 v109 = 2048;
      double v110 = v59;
      __int16 v111 = 2048;
      double v112 = v61;
      __int16 v113 = 2048;
      double v114 = v12;
      __int16 v115 = 2048;
      double v116 = v35;
      __int16 v117 = 2048;
      double v118 = v62;
      _os_log_debug_impl(&dword_1BDB2A000, v44, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness=%.04f, engagement=%.04f, L2=%.04f", v99, 0x62u);

      id v14 = v55;
    }
  }
  v75[0] = @"embSim";
  v45 = (void *)MEMORY[0x1E4F28ED0];
  [v13 embeddingSimilarity];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  v76[0] = v46;
  v75[1] = @"freshness";
  v47 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
  v76[1] = v47;
  v75[2] = @"engagement";
  v48 = [MEMORY[0x1E4F28ED0] numberWithDouble:v35];
  v76[2] = v48;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  [v13 setL2Features:v49];
}

void updateCalendarRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  int v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x69uLL);
  [v7 pommesL1Score];
  float v11 = v10;
  double v12 = v10;
  if (_os_feature_enabled_impl())
  {
    [v7 embeddingSimilarity];
    if (v11 >= v13) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    double v12 = fmin(v14, 1.0);
  }
  id v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x11uLL);
  float v16 = v15;
  if (v15)
  {
    [v15 timeIntervalSinceReferenceDate];
    double v18 = fmax(exp((v17 - a4) / 86400.0 * dbl_1BDC5D3F0[(v17 - a4) / 86400.0 > 0.0]), 0.0);
  }
  else
  {
    double v18 = 0.0;
  }
  double v19 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x12uLL);
  char v20 = v19;
  if (v19)
  {
    [v19 timeIntervalSinceReferenceDate];
    double v18 = fmax(v18, exp((v21 - a4) / 86400.0 * dbl_1BDC5D3F0[(v21 - a4) / 86400.0 > 0.0]));
  }
  double v22 = v18 * 0.8 + v12 * 0.2;
  *(float *)&double v22 = v22;
  [v7 setL2Score:v22];
  uint64_t v23 = [v7 identifier];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    double v25 = SSPommesRankerLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      double v30 = [v7 sectionBundleIdentifier];
      double v38 = SSRedactString(v8, 0);
      uint64_t v31 = [v7 identifier];
      int v32 = [v9 unsignedIntValue];
      [v7 pommesL1Score];
      double v34 = v33;
      [v7 embeddingSimilarity];
      double v36 = v35;
      [v7 l2Score];
      *(_DWORD *)buf = 138414338;
      v42 = v30;
      __int16 v43 = 2048;
      uint64_t v44 = a3;
      __int16 v45 = 2112;
      v46 = v38;
      __int16 v47 = 2112;
      v48 = v31;
      __int16 v49 = 1024;
      int v50 = v32;
      __int16 v51 = 2048;
      double v52 = v34;
      __int16 v53 = 2048;
      double v54 = v36;
      __int16 v55 = 2048;
      double v56 = v18;
      __int16 v57 = 2048;
      double v58 = v37;
      _os_log_debug_impl(&dword_1BDB2A000, v25, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness=%.04f, L2=%.04f", buf, 0x58u);
    }
  }
  v39[0] = @"embSim";
  double v26 = (void *)MEMORY[0x1E4F28ED0];
  [v7 embeddingSimilarity];
  double v27 = objc_msgSend(v26, "numberWithFloat:");
  v39[1] = @"freshness";
  v40[0] = v27;
  int v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:v18];
  v40[1] = v28;
  double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  [v7 setL2Features:v29];
}

void updateMessagesRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  int v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x69uLL);
  [v7 pommesL1Score];
  float v11 = v10;
  double v12 = v10;
  if (_os_feature_enabled_impl())
  {
    [v7 embeddingSimilarity];
    if (v11 >= v13) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    double v12 = fmin(v14, 1.0);
  }
  id v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x20uLL);
  float v16 = v15;
  if (v15)
  {
    [v15 timeIntervalSinceReferenceDate];
    double v18 = exp(trunc(fmax(a4 - v17, 0.0)) / 86400.0 * -0.25 / 30.0);
  }
  else
  {
    double v18 = 0.0;
  }
  double v19 = v18 * 0.2 + v12 * 0.8;
  *(float *)&double v19 = v19;
  [v7 setL2Score:v19];
  char v20 = [v7 identifier];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    double v22 = SSPommesRankerLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      double v27 = [v7 sectionBundleIdentifier];
      int v28 = SSRedactString(v8, 0);
      double v29 = [v7 identifier];
      int v30 = [v9 unsignedIntValue];
      [v7 pommesL1Score];
      double v32 = v31;
      [v7 embeddingSimilarity];
      double v34 = v33;
      [v7 l2Score];
      *(_DWORD *)buf = 138414594;
      float v39 = v27;
      __int16 v40 = 2048;
      uint64_t v41 = a3;
      __int16 v42 = 2112;
      __int16 v43 = v28;
      __int16 v44 = 2112;
      __int16 v45 = v29;
      __int16 v46 = 1024;
      int v47 = v30;
      __int16 v48 = 2048;
      double v49 = v32;
      __int16 v50 = 2048;
      double v51 = v34;
      __int16 v52 = 2112;
      __int16 v53 = v16;
      __int16 v54 = 2048;
      double v55 = v18;
      __int16 v56 = 2048;
      double v57 = v35;
      _os_log_debug_impl(&dword_1BDB2A000, v22, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, creationDate=%@, freshness=%.04f, L2=%.04f", buf, 0x62u);
    }
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F28ED0];
  objc_msgSend(v7, "embeddingSimilarity", @"embSim");
  uint64_t v24 = objc_msgSend(v23, "numberWithFloat:");
  v36[1] = @"freshness";
  v37[0] = v24;
  double v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v18];
  v37[1] = v25;
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  [v7 setL2Features:v26];
}

void updateMailRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  int v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[v7 attributes], 0x69uLL);
  float v10 = [v7 mailDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = 0.0;
  double v13 = exp(trunc(fmax(a4 - v11, 0.0)) / 86400.0 * -0.25 / 30.0);

  id v14 = v7;
  id v15 = v8;
  uint64_t v67 = 0;
  float v66 = 0.0;
  SSCompactRankingAttrsGetFloat([v14 attributes], 0x163uLL, (_DWORD *)&v67 + 1);
  SSCompactRankingAttrsGetFloat([v14 attributes], 0x161uLL, &v67);
  SSCompactRankingAttrsGetFloat([v14 attributes], 0x41uLL, &v66);
  float v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[v14 attributes], 0x3CuLL);
  double v17 = 0.0;
  if ([v16 count])
  {
    double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v90 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v57 = a3;
      id v58 = v15;
      uint64_t v59 = v9;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v63 != v23) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * i) timeIntervalSinceReferenceDate];
          double v26 = trunc(fmax(a4 - v25, 0.0)) / 86400.0;
          if (v26 <= 30.0)
          {
            double v27 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v26];
            [v18 addObject:v27];

            double v17 = v17 + exp(v26 * -0.14);
            ++v22;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v90 count:16];
      }
      while (v21);

      if (v22 < 1)
      {
        double v12 = 0.0;
      }
      else
      {
        double v17 = v17 / (double)v22;
        double v12 = fmin(log((double)(unint64_t)([v18 count] + 1)) / 1.60943791, 1.0);
      }
      id v15 = v58;
      int v9 = v59;
      a3 = v57;
    }
    else
    {
    }
  }
  double v28 = fmin(log((float)(v66 + 1.0)) / 2.99573227, 1.0);
  uint64_t v29 = v67;
  int v30 = [v14 identifier];
  uint64_t v31 = [v30 length];

  if (v31)
  {
    double v32 = SSPommesRankerLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      float v60 = [v14 sectionBundleIdentifier];
      __int16 v46 = SSRedactString(v15, 0);
      uint64_t v47 = [v14 identifier];
      *(_DWORD *)buf = 138414594;
      long long v71 = v60;
      __int16 v72 = 2048;
      uint64_t v73 = a3;
      __int16 v74 = 2112;
      v75 = v46;
      __int16 v76 = 2112;
      uint64_t v77 = v47;
      __int16 v48 = (void *)v47;
      __int16 v78 = 2048;
      double v79 = *((float *)&v67 + 1);
      __int16 v80 = 2048;
      double v81 = *(float *)&v67;
      __int16 v82 = 2048;
      double v83 = v66;
      __int16 v84 = 2048;
      double v85 = v28;
      __int16 v86 = 2048;
      double v87 = v12;
      __int16 v88 = 2048;
      double v89 = v17;
      _os_log_debug_impl(&dword_1BDB2A000, v32, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Engagement break down for item %@: replied=%.04f, flagged=%.04f, used count=%.04f (normed: %.04f), distinct dates=%.04f, decayed engagement=%.04f", buf, 0x66u);
    }
  }
  double v33 = *(float *)&v29 * 0.3 + *((float *)&v29 + 1) * 0.2 + v28 * 0.15 + v12 * 0.1 + v17 * 0.25;

  [v14 pommesL1Score];
  [v14 embeddingSimilarity];
  if (([v9 integerValue] & 2) != 0) {
    [v14 embeddingSimilarity];
  }
  _os_feature_enabled_impl();
  [v14 pommesL1Score];
  double v35 = v34;
  [v14 embeddingSimilarity];
  double v37 = v35 + v36 * 0.6 + v13 * 0.1 + v33 * 0.05;
  *(float *)&double v37 = v37;
  [v14 setL2Score:v37];
  double v38 = [v14 identifier];
  uint64_t v39 = [v38 length];

  if (v39)
  {
    __int16 v40 = SSPommesRankerLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      double v49 = [v14 sectionBundleIdentifier];
      double v61 = SSRedactString(v15, 0);
      __int16 v50 = [v14 identifier];
      int v51 = [v9 unsignedIntValue];
      [v14 pommesL1Score];
      double v53 = v52;
      [v14 embeddingSimilarity];
      double v55 = v54;
      [v14 l2Score];
      *(_DWORD *)double v90 = 138414594;
      __int16 v91 = v49;
      __int16 v92 = 2048;
      uint64_t v93 = a3;
      __int16 v94 = 2112;
      __int16 v95 = v61;
      __int16 v96 = 2112;
      __int16 v97 = v50;
      __int16 v98 = 1024;
      int v99 = v51;
      __int16 v100 = 2048;
      double v101 = v53;
      __int16 v102 = 2048;
      double v103 = v55;
      __int16 v104 = 2048;
      double v105 = v13;
      __int16 v106 = 2048;
      double v107 = v33;
      __int16 v108 = 2048;
      double v109 = v56;
      _os_log_debug_impl(&dword_1BDB2A000, v40, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness = %.04f, engagement = %.04f, L2=%.04f", v90, 0x62u);
    }
  }
  v68[0] = @"embSim";
  uint64_t v41 = (void *)MEMORY[0x1E4F28ED0];
  [v14 embeddingSimilarity];
  __int16 v42 = objc_msgSend(v41, "numberWithFloat:");
  v69[0] = v42;
  v68[1] = @"freshness";
  __int16 v43 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
  v69[1] = v43;
  v68[2] = @"engagement";
  __int16 v44 = [MEMORY[0x1E4F28ED0] numberWithDouble:v33];
  v69[2] = v44;
  __int16 v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  [v14 setL2Features:v45];
}

void sub_1BDB67820(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t openbyid()
{
  if (device_id_onceToken != -1) {
    dispatch_once(&device_id_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = openbyid_np();
  if ((v0 & 0x80000000) != 0)
  {
    uint64_t v1 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      openbyid_cold_1();
    }
  }
  return v0;
}

void __device_id_block_invoke()
{
  memset(&v4, 0, sizeof(v4));
  uint64_t v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v1 = [v0 URLsForDirectory:5 inDomains:1];
  uint64_t v2 = [v1 objectAtIndexedSubscript:0];

  id v3 = v2;
  if (stat((const char *)[v3 fileSystemRepresentation], &v4)) {
    __device_id_block_invoke_cold_1();
  }
  device_id_deviceID = v4.st_dev;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void __68__spotlight_l3_1_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[spotlight_l3_1 alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__spotlight_l3_1_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [spotlight_l3_1Output alloc];
    id v7 = [v14 featureValueForName:@"y"];
    id v8 = [v7 multiArrayValue];
    int v9 = [v14 featureValueForName:@"id_features"];
    uint64_t v10 = [v9 multiArrayValue];
    double v11 = [(spotlight_l3_1Output *)v6 initWithY:v8 id_features:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = *(void (**)(uint64_t, void, spotlight_l3_1Output *))(v12 + 16);
    double v11 = a3;
    v13(v12, 0, v11);
  }
}

void __67__spotlight_l3_1_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [spotlight_l3_1Output alloc];
    id v7 = [v14 featureValueForName:@"y"];
    id v8 = [v7 multiArrayValue];
    int v9 = [v14 featureValueForName:@"id_features"];
    uint64_t v10 = [v9 multiArrayValue];
    double v11 = [(spotlight_l3_1Output *)v6 initWithY:v8 id_features:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = *(void (**)(uint64_t, void, spotlight_l3_1Output *))(v12 + 16);
    double v11 = a3;
    v13(v12, 0, v11);
  }
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

id removeLeadingSpaces(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  id v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v4 = 0;
  while (objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", v4)))
  {
    if (v2 == ++v4)
    {
      uint64_t v4 = v2;
      break;
    }
  }
  if (v4)
  {
    id v5 = [v1 substringFromIndex:v4];
  }
  else
  {
LABEL_8:
    id v5 = v1;
  }
  uint64_t v6 = v5;

  return v6;
}

void __65__calibration_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[calibration alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__calibration_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [calibrationOutput alloc];
    id v7 = [v12 featureValueForName:@"output"];
    id v8 = [v7 multiArrayValue];
    int v9 = [(calibrationOutput *)v6 initWithOutput:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = *(void (**)(uint64_t, void, calibrationOutput *))(v10 + 16);
    int v9 = a3;
    v11(v10, 0, v9);
  }
}

void __64__calibration_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [calibrationOutput alloc];
    id v7 = [v12 featureValueForName:@"output"];
    id v8 = [v7 multiArrayValue];
    int v9 = [(calibrationOutput *)v6 initWithOutput:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = *(void (**)(uint64_t, void, calibrationOutput *))(v10 + 16);
    int v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1BDB775E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id v15 = v14;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BDB7BB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BDB7C028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1BDB7C198(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB81A14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB81AC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB81B74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB81C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB81E98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDB846D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1BDB864BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SSDefaultQueryParseResultsForQueryString(void *a1, uint64_t a2, char a3, int a4, int a5, int a6, uint64_t a7, int a8, unsigned __int8 a9, unsigned __int8 a10, char a11, char a12)
{
  id v14 = a1;
  id v15 = objc_opt_new();
  [v15 setObject:&stru_1F1824018 forKey:@"completionString"];
  [v15 setObject:&stru_1F1824018 forKey:@"query"];
  [v15 setObject:MEMORY[0x1E4F1CC28] forKey:@"isMath"];
  id v16 = v14;
  unint64_t v70 = [v16 length];
  BOOL v17 = SSStringStartsWithDoubleQuote(v16);
  BOOL v18 = SSStringEndsWithDoubleQuote(v16);
  int v19 = SSStringEndsWithSpace(v16);
  if (a11) {
    unsigned int v72 = looksLikeMath(v16);
  }
  else {
    unsigned int v72 = 0;
  }
  BOOL v20 = hasDigit(v16);
  BOOL v73 = v18;
  int v21 = v19;
  if (a3)
  {
    BOOL v22 = v17;
    int v23 = 1;
  }
  else
  {
    int v24 = v18 | v19;
    BOOL v22 = v17;
    int v23 = v17 & v24;
  }
  v74[0] = 0;
  double v25 = SSPhraseQueryEscapeString(v16, v74);
  id v26 = v74[0];
  double v27 = objc_opt_new();
  long long v71 = v26;
  if (![v26 count]) {
    goto LABEL_71;
  }
  if (v23)
  {
    double v28 = @"cwd";
    if (a4) {
      double v28 = @"cwds";
    }
    uint64_t v29 = v28;
    objc_msgSend(v27, "appendString:", @"(");
    appendMainQueryString(v27, v25, v29, 0, a9, 1, v70 > 3);

    [v27 appendFormat:@" || _kMDItemLaunchString=\"%@\"cwd", v25];
LABEL_17:
    [v27 appendString:@""]);
    goto LABEL_71;
  }
  BOOL v30 = v22;
  int v31 = v21;
  if (v30 && (v73 & v21 & 1) == 0)
  {
    BOOL v22 = v30;
    double v32 = @"cwd";
    if (a4) {
      double v32 = @"cwds";
    }
    double v33 = v32;
    objc_msgSend(v27, "appendString:", @"(");
    appendMainQueryString(v27, v25, v33, 1, a9, 1, v70 > 3);

    goto LABEL_17;
  }
  int v61 = a5;
  if (a5)
  {
    BOOL v34 = v70 > 3;
    if (v70 > 3) {
      int v35 = v72 ^ 1;
    }
    else {
      int v35 = 0;
    }
  }
  else
  {
    BOOL v34 = v70 > 3;
    int v35 = 0;
  }
  if (v70 > 2) {
    int v36 = 1;
  }
  else {
    int v36 = v35;
  }
  if ((v36 | v31 | a10) != 1 || (v72 & v20) != 0)
  {
    if (!v70) {
      goto LABEL_53;
    }
    double v37 = (char *)[v16 UTF8String];
    if (!v37) {
      goto LABEL_53;
    }
    unsigned int v38 = *v37;
    if (*v37 < 0)
    {
      unint64_t v39 = (unint64_t)*v37 >> 4;
      char v40 = ~(_BYTE)v39;
      uint64_t v41 = utf8_byte_length_utf8_len_table[v39];
      v38 &= utf8_to_code_point_utf8_first_char_mask[v41];
      if ((v40 & 0xC) == 0)
      {
        uint64_t v41 = v41 <= 2 ? 2 : v41;
        uint64_t v42 = v41 - 1;
        __int16 v43 = v37 + 1;
        do
        {
          unsigned int v44 = v38;
          char v45 = *v43++;
          unsigned int v38 = v45 & 0x3F | (v38 << 6);
          --v42;
        }
        while (v42);
        if (v38 >> 8 >= 0x11 && ((v44 & 0x3FFFFFC) == 0x44 || ((v44 << 6) - 11904) >> 7 < 0x197 || v38 - 65376 < 0x50)) {
          goto LABEL_54;
        }
      }
    }
    unsigned int v46 = v38 & 0xFFFFFF00;
    BOOL v47 = v38 - 127462 < 0x1A || v46 == 129280;
    BOOL v48 = v47 || (v38 & 0xFFFFFFF0) == 65024;
    if (v48 || v38 - 9984 < 0xC0 || v46 == 9728 || v38 - 127744 < 0x350 || (v38 & 0xFFFFFF80) == 0x1F680)
    {
LABEL_54:
      int v64 = 1;
      BOOL v34 = 1;
    }
    else
    {
LABEL_53:
      int v64 = 0;
      BOOL v34 = 0;
    }
  }
  else
  {
    int v64 = 1;
  }
  double v49 = @"cwdt";
  if (a4) {
    double v49 = @"cwdts";
  }
  int v69 = v49;
  __int16 v50 = @"false";
  if (v61 && a8)
  {
    SSDisplayNameAdditionsQuery(v25, v69, v35);
    __int16 v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  long long v63 = v50;
  if ((v35 & a6) == 1)
  {
    [NSString stringWithFormat:@"((kMDItemContentURL=\"%@*\"%@f070 || kMDItemTitle=\"%@*\"%@f070 || kMDItemContentURL=\"*%@*\"%@ || kMDItemTitle=\"*%@*\"%@) && _kMDItemBundleID=\"com.apple.mobilesafari\"", v25, v69, v25, v69, v25, v69, v25, v69];
    float v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v66 = @"false";
  }
  if ((v35 & a12) == 1)
  {
    [NSString stringWithFormat:@"(**=\"%@*\"%@f070)", v25, v69];
    int v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v51 = @"false";
  }
  char v52 = 1;
  uint64_t v67 = v51;
  int v21 = v31;
  BOOL v22 = v30;
  if ((unint64_t)[v26 count] > 1)
  {
    int v53 = a9;
  }
  else
  {
    int v53 = a9;
    if ((v64 & v34 & 1) == 0)
    {
      float v54 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      char v52 = objc_msgSend(v54, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", objc_msgSend(v16, "length") - 1));
    }
  }
  objc_msgSend(v27, "appendString:", @"(");
  appendMainQueryString(v27, v25, v69, 1, v53, v64 | v52, v70 > 3);
  [v27 appendFormat:@" || %@ || %@ || %@"], v63, v66, v67);

LABEL_71:
  if ((v21 | (v22 && v73)) == 1)
  {
    id v55 = v25;
  }
  else
  {
    id v55 = [v25 stringByAppendingString:@"*"];
  }
  float v56 = v55;
  uint64_t v57 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v58 = [v56 stringByTrimmingCharactersInSet:v57];

  [v15 setObject:v58 forKey:@"completionString"];
  [v15 setObject:v27 forKey:@"query"];
  uint64_t v59 = [MEMORY[0x1E4F28ED0] numberWithBool:v72];
  [v15 setObject:v59 forKey:@"isMath"];

  return v15;
}

void appendMainQueryString(void *a1, void *a2, void *a3, int a4, int a5, char a6, int a7)
{
  id v28 = a1;
  id v13 = a2;
  id v14 = a3;
  uint64_t v15 = [v14 stringByAppendingString:@"i"];
  id v16 = (void *)v15;
  BOOL v17 = "";
  if (a4) {
    BOOL v17 = "*";
  }
  if (a6)
  {
    if (a5)
    {
      uint64_t v25 = v15;
      double v27 = @"com.apple.mobileslideshow";
      id v21 = v13;
      int v23 = v17;
      id v19 = v14;
      BOOL v18 = @"(*=\"%@%s\"%@) || (kMDItemTextContent=\"%@%s\"%@ && _kMDItemBundleID!=\"%@\"i)";
LABEL_8:
      objc_msgSend(v28, "appendFormat:", v18, v13, v17, v19, v21, v23, v25, v27);
      goto LABEL_11;
    }
    [v28 appendFormat:@"(**=\"%@%s\"%@)", v13, v17, v14, v20, v22, v24, v26];
  }
  else
  {
    if (a7)
    {
      uint64_t v25 = v15;
      double v27 = @"com.apple.MobileSMS";
      id v21 = v13;
      int v23 = v17;
      id v19 = v14;
      BOOL v18 = @"(*=\"%@%s\"%@) || (kMDItemTextContent=\"%@%s\"%@ && _kMDItemBundleID=\"%@\"i)";
      goto LABEL_8;
    }
    [v28 appendFormat:@"(*=\"%@%s\"%@)", v13, v17, v14, v20, v22, v24, v26];
  }
LABEL_11:
}

id SSQueryParseResultsForQueryString(void *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = SSGeneralLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  double v11 = v9;
  id v12 = v11;
  unint64_t v144 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SSQueryParseResultsForQueryString", (const char *)&unk_1BDC948EA, buf, 2u);
  }
  v143 = v12;

  id v13 = [NSString stringWithString:v7];
  id v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"queryID"];

  if (!v15)
  {
    uint64_t v166 = -1;
    if (v13) {
      goto LABEL_6;
    }
LABEL_10:
    [0 length];
    v155 = 0;
    goto LABEL_11;
  }
  id v16 = [v14 objectForKeyedSubscript:@"queryID"];
  uint64_t v166 = [v16 longValue];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_6:
  v155 = (void *)__MDQueryCopyTextTerms();
  if (![v155 length] && objc_msgSend(v13, "length"))
  {
    id v17 = v13;

    v155 = v17;
  }
LABEL_11:
  BOOL v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF matches %@", @"^([0-9]+(\\.[0-9]*)?)([\\+|-|\\*|/]([0-9]+(\\.[0-9]*)?))*[ ]*$"];
  v142 = v18;
  if (v13) {
    [v18 evaluateWithObject:v13];
  }
  os_signpost_id_t spid = v10;
  id v19 = [v14 objectForKeyedSubscript:@"isSearchToolClient"];
  unsigned int v20 = [v19 BOOLValue];

  unsigned int v164 = v20;
  if (v20)
  {
    [v14 removeObjectForKey:@"isSearchToolClient"];
    if (SSEnableSearchToolCleanSlate(1u)) {
      [v14 setValue:&unk_1F1861280 forKey:@"kMDQueryOptionEmbeddingGenerationTimeout"];
    }
  }
  if (SSQueryParseResultsForQueryString_onceToken != -1) {
    dispatch_once(&SSQueryParseResultsForQueryString_onceToken, &__block_literal_global_20);
  }
  v149 = v7;
  v147 = v8;
  if (!(SSQueryParseResultsForQueryString_isVisualSemanticSearchEnabled | SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled)
    || a5)
  {
    int v23 = SSGeneralLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = @"YES";
      *(void *)&v178[10] = @"disabling";
      if (a5) {
        uint64_t v25 = @"NO";
      }
      else {
        uint64_t v25 = @"YES";
      }
      *(_DWORD *)buf = 134219010;
      if (SSQueryParseResultsForQueryString_isVisualSemanticSearchEnabled) {
        uint64_t v26 = @"YES";
      }
      else {
        uint64_t v26 = @"NO";
      }
      *(void *)v178 = v166;
      *(_WORD *)&v178[8] = 2112;
      if (!SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled) {
        uint64_t v24 = @"NO";
      }
      __int16 v179 = 2112;
      v180 = v25;
      __int16 v181 = 2112;
      *(void *)v182 = v26;
      *(_WORD *)&v182[8] = 2112;
      *(void *)&v182[10] = v24;
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_INFO, "[SSQueryParser][POMMES][qid=%ld] %@ semantic search, callerEnabled: %@, isVisualSemanticSearchEnabled: %@, isTextSemanticSearchEnabled: %@", buf, 0x34u);
    }
    BOOL v22 = 0;
  }
  else
  {
    unint64_t v21 = [MEMORY[0x1E4F63D70] currentWithUseCaseIdentifiers:SSQueryParseResultsForQueryString_useCaseIdentifiers];
    BOOL v22 = v21 <= 1 && (unint64_t)[v13 composedLength] > 1;
    int v23 = SSGeneralLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (v22) {
        double v27 = @"enabling";
      }
      else {
        double v27 = @"disabling";
      }
      if (SSQueryParseResultsForQueryString_isVisualSemanticSearchEnabled) {
        id v28 = @"YES";
      }
      else {
        id v28 = @"NO";
      }
      if (SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled) {
        uint64_t v29 = @"YES";
      }
      else {
        uint64_t v29 = @"NO";
      }
      if (v21 >= 2) {
        BOOL v30 = @"NO";
      }
      else {
        BOOL v30 = @"YES";
      }
      uint64_t v31 = [v13 composedLength];
      *(_DWORD *)buf = 134219522;
      *(void *)v178 = v166;
      *(_WORD *)&v178[8] = 2112;
      *(void *)&v178[10] = v27;
      __int16 v179 = 2112;
      v180 = @"YES";
      __int16 v181 = 2112;
      *(void *)v182 = v28;
      *(_WORD *)&v182[8] = 2112;
      *(void *)&v182[10] = v29;
      __int16 v183 = 2112;
      v184 = v30;
      __int16 v185 = 2048;
      uint64_t v186 = v31;
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_INFO, "[SSQueryParser][POMMES][qid=%ld] %@ semantic search, callerEnabled: %@, isVisualSemanticSearchEnabled: %@, isTextSemanticSearchEnabled: %@, isGMOptedIn: %@, queryLength: %lu", buf, 0x48u);
    }
  }

  double v32 = [MEMORY[0x1E4F28ED0] numberWithBool:v22];
  double v33 = v14;
  [v14 setValue:v32 forKey:@"kMDQueryOptionEmbeddingEnabledKey"];

  BOOL v34 = [v14 objectForKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
  v145 = v33;
  v146 = v13;
  QueryDictionaryWithOptionsDict = (void *)__MDQueryCreateQueryDictionaryWithOptionsDict();
  int v36 = QueryDictionaryWithOptionsDict;
  if (!QueryDictionaryWithOptionsDict)
  {
    v138 = [NSString stringWithFormat:@"**=\"%@*\"cwd", v155];
    v167 = @"kMDUserQueryDictionaryQueryConfidenceNoneValue";
    unsigned int v135 = 0;
    unsigned int v136 = [@"kMDUserQueryDictionaryQueryConfidenceNoneValue" isEqualToString:@"kMDUserQueryDictionaryQueryConfidenceHighValue"];
    v151 = 0;
    v154 = 0;
    id v84 = 0;
    v162 = 0;
    id v148 = &unk_1F1861298;
    id v150 = (id)MEMORY[0x1E4F1CBF0];
    v157 = (void *)MEMORY[0x1E4F1CBF0];
    id v159 = (id)MEMORY[0x1E4F1CBF0];
    id v163 = (id)MEMORY[0x1E4F1CC08];
    v165 = (void *)MEMORY[0x1E4F1CC08];
    id v137 = (id)MEMORY[0x1E4F1CC08];
    id v160 = (id)MEMORY[0x1E4F1CBF0];
    unsigned int v85 = v164;
    goto LABEL_117;
  }
  uint64_t v37 = [QueryDictionaryWithOptionsDict objectForKey:@"kMDUserQueryDictionaryQueryInputAttributesKey"];
  unsigned int v38 = (void *)v37;
  unint64_t v39 = (void *)MEMORY[0x1E4F1CC08];
  if (v37) {
    char v40 = (void *)v37;
  }
  else {
    char v40 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v41 = v40;

  id v148 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryTokenCountKey"];

  id v42 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryStringKey"];
  __int16 v43 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryDefaultStringKey"];
  uint64_t v44 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryRankingTermsKey"];
  char v45 = (void *)v44;
  if (v44) {
    unsigned int v46 = (void *)v44;
  }
  else {
    unsigned int v46 = v39;
  }
  id v163 = v46;

  uint64_t v47 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryRankingCategoriesKey"];
  BOOL v48 = (void *)v47;
  if (v47) {
    double v49 = (void *)v47;
  }
  else {
    double v49 = v39;
  }
  id v137 = v49;

  uint64_t v50 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryAttributedInputKey"];
  int v51 = (void *)v50;
  char v52 = (void *)MEMORY[0x1E4F1CBF0];
  if (v50) {
    int v53 = (void *)v50;
  }
  else {
    int v53 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v150 = v53;

  uint64_t v54 = [v36 objectForKey:@"kMDUserQueryDictionaryQuerySuggestionsKey"];
  id v55 = (void *)v54;
  if (v54) {
    float v56 = (void *)v54;
  }
  else {
    float v56 = v52;
  }
  id v160 = v56;

  uint64_t v57 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryAdvancedComponentsKey"];
  id v58 = (void *)v57;
  if (v57) {
    uint64_t v59 = (void *)v57;
  }
  else {
    uint64_t v59 = v52;
  }
  id v159 = v59;

  uint64_t v60 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryUnderstandingOutputKey"];
  int v61 = (void *)v60;
  if (v60) {
    long long v62 = (void *)v60;
  }
  else {
    long long v62 = v39;
  }
  id v63 = v62;

  v165 = v63;
  if (![v63 count])
  {
    int v64 = SSGeneralLog();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v178 = v166;
      _os_log_impl(&dword_1BDB2A000, v64, OS_LOG_TYPE_INFO, "[SSQueryParser][POMMES][qid=%ld] SSQueryParseResultsForQueryString: Got empty queryUnderstandingOutput from parse", buf, 0xCu);
    }

    if ([v150 count])
    {
      v175 = @"attributedParses";
      id v176 = v150;
      uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];

      v165 = (void *)v65;
    }
  }
  if (v22)
  {
    float v66 = [v41 objectForKeyedSubscript:@"embeddingResultKey"];
    if (!v66) {
      goto LABEL_91;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_91;
    }
    id v139 = v41;
    uint64_t v67 = (void *)MEMORY[0x1E4F28DC0];
    int v68 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    long long v71 = objc_msgSend(v68, "setWithObjects:", v69, v70, objc_opt_class(), 0);
    id v172 = 0;
    unsigned int v72 = [v67 unarchivedObjectOfClasses:v71 fromData:v66 error:&v172];
    id v73 = v172;

    if (v73)
    {
      __int16 v74 = SSGeneralLog();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        SSQueryParseResultsForQueryString_cold_7();
      }
    }
    id v41 = v139;
    if (!v72)
    {
LABEL_91:
      unsigned int v72 = SSGeneralLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        SSQueryParseResultsForQueryString_cold_1();
      }
      v162 = 0;
      v154 = 0;
      goto LABEL_94;
    }
    v75 = (void *)[v165 mutableCopy];
    __int16 v76 = [v72 objectForKeyedSubscript:*MEMORY[0x1E4F23240]];
    if ([v76 length])
    {
      uint64_t v77 = [objc_alloc(MEMORY[0x1E4F238A8]) initWithEncodedData:v76];
      __int16 v78 = v77;
      if (v77)
      {
        v156 = v76;
        v161 = v75;
        id v153 = v42;
        double v79 = [v77 properties];
        __int16 v80 = [v79 objectForKey:@"vec_scale"];

        double v81 = [v78 properties];
        __int16 v82 = [v81 objectForKey:@"vec_bias"];

        if (v80 && v82)
        {
          [v161 setObject:v80 forKeyedSubscript:@"embeddingScale"];
          [v161 setObject:v82 forKeyedSubscript:@"embeddingBias"];
        }
        double v83 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", -[NSObject version](v78, "version"));
        v75 = v161;
        [v161 setObject:v83 forKey:@"embeddingVersion"];

        id v42 = v153;
        __int16 v76 = v156;
      }
      else
      {
        __int16 v80 = SSGeneralLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          SSQueryParseResultsForQueryString_cold_6();
        }
      }

      [v75 setObject:v76 forKeyedSubscript:@"kQPQueryPhotoEmbeddingEncodedData"];
      id v41 = v139;
    }
    else
    {
      __int16 v78 = SSGeneralLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        SSQueryParseResultsForQueryString_cold_5();
      }
    }

    if (SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled)
    {
      uint64_t v120 = [v149 composedLength];
      if ((v164 & 1) == 0)
      {
        unint64_t v121 = v120;
        unsigned int v122 = [v148 unsignedIntValue];
        if (v121 < 5 || v122 < 2)
        {
          v128 = SSGeneralLog();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            v158 = v76;
            v130 = v75;
            id v131 = v42;
            if (SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled) {
              v132 = @"YES";
            }
            else {
              v132 = @"NO";
            }
            int v133 = [v148 unsignedIntValue];
            *(_DWORD *)buf = 134219010;
            *(void *)v178 = v166;
            *(_WORD *)&v178[8] = 2112;
            *(void *)&v178[10] = v132;
            id v42 = v131;
            v75 = v130;
            __int16 v76 = v158;
            __int16 v179 = 2112;
            v180 = @"NO";
            __int16 v181 = 1024;
            *(_DWORD *)v182 = v133;
            *(_WORD *)&v182[4] = 2048;
            *(void *)&v182[6] = v121;
            _os_log_error_impl(&dword_1BDB2A000, v128, OS_LOG_TYPE_ERROR, "[SSQueryParser][POMMES][qid=%ld] disabling text semantic search, FeatureFlag: %@, isSearchTool: %@, tokenCount: %d, queryLength: %lu", buf, 0x30u);
          }

          v162 = 0;
          v154 = 0;
          id v41 = v139;
          goto LABEL_161;
        }
      }
      v154 = [v72 objectForKeyedSubscript:*MEMORY[0x1E4F233E8]];
      if (v154)
      {
        int v123 = SSEnableSearchToolCleanSlate(v164);
        uint64_t v124 = 100;
        if (v123) {
          uint64_t v124 = 200;
        }
        double v125 = 0.939999998;
        if (v123) {
          double v125 = 1.79999995;
        }
        v162 = [NSString stringWithFormat:@"aNN.data(%@, 0, %ld, %f, %u)", @"_kMDItemPrimaryTextEmbedding", v124, *(void *)&v125, 0];
        v126 = SSGeneralLog();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG)) {
          SSQueryParseResultsForQueryString_cold_4();
        }

        if (v164) {
          [v75 setObject:v154 forKeyedSubscript:@"kQPQueryTextEmbeddingEncodedData"];
        }
        goto LABEL_161;
      }
      v127 = SSGeneralLog();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
        SSQueryParseResultsForQueryString_cold_3();
      }
    }
    else
    {
      v127 = SSGeneralLog();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
        SSQueryParseResultsForQueryString_cold_2();
      }
    }

    v162 = 0;
    v154 = 0;
LABEL_161:
    id v129 = v75;

    v165 = v129;
LABEL_94:

    goto LABEL_95;
  }
  v162 = 0;
  v154 = 0;
LABEL_95:
  if (![v43 length])
  {
    uint64_t v86 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryNLPStringKey"];

    __int16 v43 = (void *)v86;
  }
  double v87 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryKindKey"];
  v167 = [v36 objectForKey:@"kMDUserQueryDictionaryQueryConfidenceKey"];
  v138 = v43;
  if (-[__CFString isEqualToString:](v167, "isEqualToString:", @"kMDUserQueryDictionaryQueryConfidenceHighValue")&& v42&& ![v42 isEqualToString:v43])
  {
    v152 = v87;
    id v140 = v41;
    id v88 = v42;
    double v89 = (void *)[v163 mutableCopy];
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    id v90 = v163;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v168 objects:v174 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v169;
      do
      {
        for (uint64_t i = 0; i != v92; ++i)
        {
          if (*(void *)v169 != v93) {
            objc_enumerationMutation(v90);
          }
          uint64_t v95 = *(void *)(*((void *)&v168 + 1) + 8 * i);
          __int16 v96 = [v90 objectForKey:v95];
          if ((int)[v96 intValue] < 100 || (int)objc_msgSend(v96, "intValue") >= 201) {
            [v89 removeObjectForKey:v95];
          }
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v168 objects:v174 count:16];
      }
      while (v92);
    }

    id v84 = v88;
    id v41 = v140;
    if (![v89 count]) {
      [v89 setValue:&unk_1F18612B0 forKey:v88];
    }
    id v42 = v89;

    v157 = [v42 keysSortedByValueUsingComparator:&__block_literal_global_192];
    id v163 = v42;
    unsigned int v85 = v164;
    double v87 = v152;
  }
  else
  {
    id v84 = v43;
    v157 = (void *)MEMORY[0x1E4F1CBF0];
    unsigned int v85 = v164;
  }

  unsigned int v136 = [(__CFString *)v167 isEqualToString:@"kMDUserQueryDictionaryQueryConfidenceHighValue"];
  if (v87)
  {
    v151 = v87;
    unsigned int v135 = [v87 isEqualToString:@"kMDQueryAdvancedSyntaxQuery"];
  }
  else
  {
    v151 = 0;
    unsigned int v135 = 0;
  }
LABEL_117:
  __int16 v97 = v84;
  __int16 v98 = [MEMORY[0x1E4F1CA48] array];
  v141 = v34;
  if ([v34 isEqualToString:@"com.apple.Spotlight"])
  {
    int v99 = [NSString stringWithFormat:@"(_kMDItemBundleID!=\"%@\" || kMDItemMailboxes!=\"mailbox.junk\", @"com.apple.mobilemail""];
    [v98 addObject:v99];
  }
  if (v85)
  {
    if (![v98 count])
    {
      v173[0] = @"com.apple.application";
      v173[1] = @"com.apple.Preferences";
      v173[2] = @"com.apple.shortcuts";
      v173[3] = @"com.apple.tips";
      v173[4] = @"com.apple.mobilesafari";
      v173[5] = @"com.apple.AppStore";
      v173[6] = @"com.jamfsoftware.selfservice";
      v173[7] = @"com.apple.usernotificationsd";
      v173[8] = @"com.apple.photoanalysisd";
      __int16 v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:9];
      double v101 = (void *)[v100 mutableCopy];

      __int16 v102 = NSString;
      double v103 = [v101 componentsJoinedByString:@", "];
      __int16 v104 = [v102 stringWithFormat:@"!FieldMatch(_kMDItemBundleID, %@)", v103];
      [v98 addObject:v104];
    }
    if ([v98 count])
    {
      double v105 = SSGeneralLog();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v106 = [v98 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v178 = v106;
        _os_log_impl(&dword_1BDB2A000, v105, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] filterQueries count=%lu", buf, 0xCu);
      }

      if ([v98 count])
      {
        uint64_t v107 = 0;
        unsigned int v108 = 1;
        do
        {
          double v109 = SSGeneralLog();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v110 = [v98 objectAtIndexedSubscript:v107];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v178 = v108 - 1;
            *(_WORD *)&v178[4] = 2112;
            *(void *)&v178[6] = v110;
            _os_log_impl(&dword_1BDB2A000, v109, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] filterQueries[%d]=%@", buf, 0x12u);
          }
          uint64_t v107 = v108;
        }
        while ([v98 count] > (unint64_t)v108++);
      }
    }
  }
  double v112 = objc_opt_new();
  [v112 setObject:v97 forKey:@"nlQuery"];
  [v112 setObject:v138 forKey:@"defaultQuery"];
  if ([v162 length])
  {
    [v112 setObject:v162 forKey:@"annQuery"];
    [v112 setObject:v154 forKey:@"textEmbeddingData"];
  }
  [v112 setObject:v160 forKey:@"suggestions"];
  [v112 setObject:v137 forKey:@"rankCategories"];
  [v112 setObject:v163 forKey:@"rankTerms"];
  [v112 setObject:v157 forKey:@"queryTerms"];
  [v112 setObject:v150 forKey:@"attributedParses"];
  [v112 setObject:v159 forKey:@"advancedComponents"];
  [v112 setObject:v167 forKey:@"confidence"];
  __int16 v113 = [MEMORY[0x1E4F28ED0] numberWithBool:v136];
  [v112 setObject:v113 forKey:@"isNLQuery"];

  double v114 = [MEMORY[0x1E4F28ED0] numberWithBool:v135];
  [v112 setObject:v114 forKey:@"isAdvancedSyntax"];

  __int16 v115 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  [v112 setObject:v115 forKey:@"hasTargetApplicationURL"];

  [v112 setObject:v165 forKey:@"queryUnderstandingOutput"];
  [v112 setObject:v98 forKey:@"filterQueries"];
  double v116 = v143;
  __int16 v117 = v116;
  if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v117, OS_SIGNPOST_INTERVAL_END, spid, "SSQueryParseResultsForQueryString", (const char *)&unk_1BDC948EA, buf, 2u);
  }

  id v118 = v112;
  return v118;
}

void __SSQueryParseResultsForQueryString_block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  if (v0) {
    LOBYTE(v0) = _os_feature_enabled_impl();
  }
  SSQueryParseResultsForQueryString_isVisualSemanticSearchEnabled = v0;
  int v1 = _os_feature_enabled_impl();
  if (v1)
  {
    int v1 = _os_feature_enabled_impl();
    if (v1) {
      LOBYTE(v1) = _os_feature_enabled_impl();
    }
  }
  SSQueryParseResultsForQueryString_isTextSemanticSearchEnabled = v1;
  uint64_t v2 = (void *)SSQueryParseResultsForQueryString_useCaseIdentifiers;
  SSQueryParseResultsForQueryString_useCaseIdentifiers = (uint64_t)&unk_1F1864538;
}

uint64_t __SSQueryParseResultsForQueryString_block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 intValue];
  if (v6 == [v5 intValue])
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v8 = [v4 intValue];
    if (v8 > (int)[v5 intValue]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

id SSParseResultsForTopHitQueryWithString(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, int a8, unsigned __int8 a9, char a10, unsigned __int8 a11, unsigned __int8 a12, unsigned __int8 a13, char a14)
{
  id v17 = a2;
  id v18 = a1;
  id v19 = objc_opt_new();
  uint64_t v20 = MEMORY[0x1E4F1CC28];
  [v19 setObject:MEMORY[0x1E4F1CC28] forKey:@"isNLQuery"];
  [v19 setObject:v20 forKey:@"isAdvancedSyntax"];
  [v19 setObject:v20 forKey:@"isMath"];
  uint64_t v21 = MEMORY[0x1E4F1CBF0];
  [v19 setObject:MEMORY[0x1E4F1CBF0] forKey:@"suggestions"];
  uint64_t v22 = MEMORY[0x1E4F1CC08];
  [v19 setObject:MEMORY[0x1E4F1CC08] forKey:@"rankCategories"];
  [v19 setObject:v22 forKey:@"rankTerms"];
  [v19 setObject:v21 forKey:@"queryTerms"];
  [v19 setObject:&stru_1F1824018 forKey:@"query"];
  int v23 = SSQueryParseResultsForQueryString(v18, v17, a7, a5, 0);

  uint64_t v24 = SSDefaultQueryParseResultsForQueryString(v18, 0, a6, a7, a8, a9, 0, a11, a12, a13, 0, a14);

  uint64_t v25 = [v23 objectForKeyedSubscript:@"nlQuery"];
  if (!v23)
  {
    uint64_t v28 = 0;
    if (v24) {
      goto LABEL_9;
    }
LABEL_5:
    uint64_t v29 = [v23 objectForKeyedSubscript:@"defaultQuery"];
    uint64_t v30 = 0;
    if (!v25) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  uint64_t v26 = [v23 objectForKeyedSubscript:@"isNLQuery"];
  if (v26)
  {
    double v27 = [v23 objectForKeyedSubscript:@"isNLQuery"];
    uint64_t v28 = [v27 BOOLValue];
  }
  else
  {
    uint64_t v28 = 0;
  }

  if (!v24) {
    goto LABEL_5;
  }
LABEL_9:
  uint64_t v29 = [v24 objectForKeyedSubscript:@"query"];
  uint64_t v31 = [v24 objectForKeyedSubscript:@"isMath"];
  if (v31)
  {
    double v32 = [v24 objectForKeyedSubscript:@"isMath"];
    uint64_t v30 = [v32 BOOLValue];
  }
  else
  {
    uint64_t v30 = 0;
  }

  if (!v25)
  {
LABEL_15:
    id v35 = v29;
    if (!v24) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_13:
  if (!v29) {
    goto LABEL_15;
  }
  double v33 = [v23 objectForKeyedSubscript:@"defaultQuery"];
  char v34 = [v25 isEqualToString:v33];

  if (v34) {
    goto LABEL_15;
  }
  id v35 = [NSString stringWithFormat:@"(%@ || %@)", v25, v29];
  uint64_t v30 = v30 & ~v28;
  if (v24) {
LABEL_16:
  }
    [v19 setValuesForKeysWithDictionary:v24];
LABEL_17:
  [v19 setValuesForKeysWithDictionary:v23];
  [v19 setObject:v35 forKey:@"query"];
  int v36 = [MEMORY[0x1E4F28ED0] numberWithBool:v28];
  [v19 setObject:v36 forKey:@"isNLQuery"];

  uint64_t v37 = [MEMORY[0x1E4F28ED0] numberWithBool:v30];
  [v19 setObject:v37 forKey:@"isMath"];

  return v19;
}

id SSQueryParserStripKindFromString(void *a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v29 = a1;
  id v30 = a2;
  uint64_t v31 = SSQueryParseResultsForQueryString(v29, v30, 0, 0, 1);
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = __Block_byref_object_copy__3;
  int v61 = __Block_byref_object_dispose__3;
  id v62 = 0;
  id v62 = (id)objc_opt_new();
  id v3 = [v31 objectForKeyedSubscript:@"attributedParses"];
  if (v3)
  {
    id v4 = [v31 objectForKeyedSubscript:@"attributedParses"];
    id v5 = [v4 firstObject];
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v6 = [v5 length];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __SSQueryParserStripKindFromString_block_invoke;
  v54[3] = &unk_1E634CAC0;
  id v55 = v5;
  float v56 = &v57;
  id v28 = v55;
  objc_msgSend(v55, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v54);
  [v31 objectForKeyedSubscript:@"advancedComponents"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v51;
    uint64_t v36 = *MEMORY[0x1E4F28540];
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v63 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v47 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              id v13 = [v8 objectForKeyedSubscript:v12];
              id v14 = [v13 objectForKeyedSubscript:@"TYPE"];
              if (v14)
              {
                uint64_t v15 = [v13 objectForKeyedSubscript:@"TYPE"];
                char v16 = [v15 isEqualToString:@"KINDS:IMAGES"];

                if (v16)
                {
                  uint64_t v40 = 0;
                  id v41 = &v40;
                  uint64_t v42 = 0x3032000000;
                  __int16 v43 = __Block_byref_object_copy__3;
                  uint64_t v44 = __Block_byref_object_dispose__3;
                  id v45 = 0;
                  id v45 = [MEMORY[0x1E4F1CA48] array];
                  uint64_t v17 = [v12 length];
                  v39[0] = MEMORY[0x1E4F143A8];
                  v39[1] = 3221225472;
                  void v39[2] = __SSQueryParserStripKindFromString_block_invoke_2;
                  v39[3] = &unk_1E634CAE8;
                  v39[4] = v12;
                  v39[5] = &v40;
                  objc_msgSend(v12, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v17, v36, 4, 0, v39);
                  id v18 = (void *)MEMORY[0x1E4F28FD8];
                  id v19 = [(id)v41[5] componentsJoinedByString:&stru_1F1824018];
                  id v38 = 0;
                  uint64_t v20 = [v18 regularExpressionWithPattern:v19 options:1 error:&v38];
                  id v21 = v38;

                  uint64_t v22 = (void *)v58[5];
                  uint64_t v23 = [v22 length];
                  v37[0] = MEMORY[0x1E4F143A8];
                  v37[1] = 3221225472;
                  void v37[2] = __SSQueryParserStripKindFromString_block_invoke_3;
                  v37[3] = &unk_1E634CB10;
                  v37[4] = &v57;
                  objc_msgSend(v20, "enumerateMatchesInString:options:range:usingBlock:", v22, 0, 0, v23, v37);

                  _Block_object_dispose(&v40, 8);
                }
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v63 count:16];
          }
          while (v9);
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v34);
  }

  uint64_t v24 = (void *)v58[5];
  uint64_t v25 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v26 = [v24 stringByTrimmingCharactersInSet:v25];

  _Block_object_dispose(&v57, 8);
  return v26;
}

void sub_1BDB88C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __SSQueryParserStripKindFromString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v20 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) string];
  id v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);

  if (([v8 isEqualToString:@"kind:"] & 1) == 0)
  {
    if (![v20 count]) {
      goto LABEL_11;
    }
    uint64_t v9 = [v20 objectForKeyedSubscript:@"kQPKeyword"];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      double v11 = [v20 objectForKeyedSubscript:@"kQPKeyword"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = @"kQPKeyword";
LABEL_9:
        id v18 = [v20 objectForKeyedSubscript:v13];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:v18];

        goto LABEL_12;
      }
    }
    uint64_t v14 = [v20 objectForKeyedSubscript:@"kQPTopic"];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      char v16 = [v20 objectForKeyedSubscript:@"kQPTopic"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        id v13 = @"kQPTopic";
        goto LABEL_9;
      }
    }
    id v19 = [v20 objectForKeyedSubscript:@"kQPKind"];

    if (!v19) {
LABEL_11:
    }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:v8];
  }
LABEL_12:
}

void __SSQueryParserStripKindFromString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:@"\\s*?"];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v9];
}

void __SSQueryParserStripKindFromString_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [a2 range];
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v6, &stru_1F1824018, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "length"));
}

uint64_t SSQueryParserCancelWithReferenceDict()
{
  return MEMORY[0x1F412F400]();
}

uint64_t SSQueryParserPreheat()
{
  return MEMORY[0x1F412F410]();
}

uint64_t SSQueryParserCooldown()
{
  return MEMORY[0x1F412F408]();
}

uint64_t __SSRedactString_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSRedactString_isSearchToolDebugMode = result;
  return result;
}

id SSRedactSuggestionIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 length]
    && [v4 isEqualToString:@"com.apple.searchd.suggestions"]
    && [v3 length]
    && (unint64_t v5 = [v3 rangeOfString:@":"], v5 != 0x7FFFFFFFFFFFFFFFLL)
    && (unint64_t v6 = v5, v5 < [v3 length] - 1))
  {
    uint64_t v7 = NSString;
    id v8 = [v3 substringToIndex:v6];
    id v9 = [v3 substringFromIndex:v6 + 1];
    uint64_t v10 = SSRedactString(v9, 1);
    id v11 = [v7 stringWithFormat:@"%@:%@", v8, v10];
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

void SSInitLogging()
{
  if (SSInitLogging_once != -1) {
    dispatch_once(&SSInitLogging_once, &__block_literal_global_18);
  }
}

void __SSInitLogging_block_invoke()
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    os_log_t v1 = os_log_create("com.apple.SpotlightServices", SSLogSubsystem_block_invoke_categories[i]);
    uint64_t v2 = (void *)SSLogHandles[i];
    SSLogHandles[i] = (uint64_t)v1;
  }
}

id SSPommesRankerLog()
{
  int v0 = &unk_1EBA25000;
  os_log_t v1 = (void *)qword_1EBA25B78;
  if (!qword_1EBA25B78)
  {
    if (SSInitLogging_once != -1)
    {
      dispatch_once(&SSInitLogging_once, &__block_literal_global_18);
      int v0 = (void *)&unk_1EBA25000;
    }
    os_log_t v1 = (void *)v0[367];
  }
  return v1;
}

id SSRecentResultsLog()
{
  int v0 = &unk_1EBA25000;
  os_log_t v1 = (void *)qword_1EBA25B80;
  if (!qword_1EBA25B80)
  {
    if (SSInitLogging_once != -1)
    {
      dispatch_once(&SSInitLogging_once, &__block_literal_global_18);
      int v0 = (void *)&unk_1EBA25000;
    }
    os_log_t v1 = (void *)v0[368];
  }
  return v1;
}

uint64_t localeChangeCallback(uint64_t a1, void *a2)
{
  return [a2 update];
}

void sub_1BDB910B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t isMacOS()
{
  return 0;
}

uint64_t isIpad()
{
  if (isIpad_onceToken != -1) {
    dispatch_once(&isIpad_onceToken, &__block_literal_global_23);
  }
  return isIpad_isIpad;
}

uint64_t __isIpad_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isIpad_isIpad = result == 3;
  return result;
}

id SSBundleIdentifiersForSyndicatedPhotos()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.mobileslideshow";
  v2[1] = @"com.apple.plphotosctl";
  v2[2] = @"com.apple.searchd.syndicatedPhotos";
  v2[3] = @"com.apple.searchd.syndicatedPhotos.MobileSMS";
  v2[4] = @"com.apple.searchd.syndicatedPhotos.mobilenotes";
  v2[5] = @"com.apple.spotlight.syndicatedPhotos.fileProvider";
  v2[6] = @"com.apple.searchd.syndicatedPhotos.mobileslideshow";
  int v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  return v0;
}

uint64_t SSSectionIsSyndicatedPhotos(void *a1)
{
  uint64_t v1 = SSSectionIsSyndicatedPhotos_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&SSSectionIsSyndicatedPhotos_onceToken, &__block_literal_global_320);
  }
  uint64_t v3 = [(id)SSSectionIsSyndicatedPhotos_photosBundleIdentifiers containsObject:v2];

  return v3;
}

void __SSSectionIsSyndicatedPhotos_block_invoke()
{
  int v0 = (void *)MEMORY[0x1E4F1CAD0];
  SSBundleIdentifiersForSyndicatedPhotos();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 setWithArray:v3];
  id v2 = (void *)SSSectionIsSyndicatedPhotos_photosBundleIdentifiers;
  SSSectionIsSyndicatedPhotos_photosBundleIdentifiers = v1;
}

uint64_t SSSectionIsMailOrPommesCTL(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilemail"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.pommesctl"];
  }

  return v2;
}

uint64_t SSPommesRankingIsEnabled(void *a1, int a2)
{
  id v3 = a1;
  if (SSSectionIsMailOrPommesCTL(v3)) {
    goto LABEL_2;
  }
  if (([v3 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0
    || [v3 isEqualToString:@"com.argos.BlendABApp2"])
  {
LABEL_5:
    uint64_t v4 = _os_feature_enabled_impl();
    goto LABEL_6;
  }
  if (([v3 isEqualToString:@"com.apple.mobilecal"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0
    && (SSSectionIsSyndicatedPhotos(v3) & 1) == 0)
  {
    if ([v3 isEqualToString:@"com.apple.spotlight.events"]
      || [v3 isEqualToString:@"com.apple.reminders"]
      || [v3 isEqualToString:@"com.apple.mobilenotes"]
      || ([v3 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0
      || ([v3 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
      || [v3 isEqualToString:@"com.apple.DocumentsApp"])
    {
      goto LABEL_5;
    }
    if (SSPommesRankingIsEnabled_onceToken == -1)
    {
      if (!a2)
      {
LABEL_20:
        uint64_t v4 = 0;
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&SSPommesRankingIsEnabled_onceToken, &__block_literal_global_327);
      if (!a2) {
        goto LABEL_20;
      }
    }
    if (([(id)SSPommesRankingIsEnabled_searchToolOnlyBundles containsObject:v3] & 1) == 0) {
      goto LABEL_20;
    }
  }
LABEL_2:
  uint64_t v4 = 1;
LABEL_6:

  return v4;
}

uint64_t __SSPommesRankingIsEnabled_block_invoke()
{
  SSPommesRankingIsEnabled_searchToolOnlyBundles = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.Passbook", @"com.apple.VoiceMemos", @"com.apple.freeform", @"com.apple.mobilephone", @"com.apple.journal", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t SSPommesRankingForSectionBundle(void *a1)
{
  return SSPommesRankingIsEnabled(a1, 0);
}

BOOL SSIsAppleInternalAppPath(void *a1)
{
  return [a1 rangeOfString:@"/AppleInternal/Applications"] != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL SSIsXcodeInternalAppPath(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 rangeOfString:@"/Contents/Developer/Platforms"] != 0x7FFFFFFFFFFFFFFFLL
    && [v1 rangeOfString:@"/AppleInternal/Applications"] != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

id SSStringFromTopHit(uint64_t a1)
{
  if (SSStringFromTopHit_onceToken != -1) {
    dispatch_once(&SSStringFromTopHit_onceToken, &__block_literal_global_356);
  }
  BOOL v2 = (void *)SSStringFromTopHit__topHitValueStrings;
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown SFTopHit Value: %d", a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v6 = v5;

  return v6;
}

void __SSStringFromTopHit_block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  v5[0] = v0;
  v6[0] = @"SFTopHitNo";
  id v1 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  v5[1] = v1;
  v6[1] = @"SFTopHitShouldBe";
  BOOL v2 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
  v5[2] = v2;
  v6[2] = @"SFTopHitMustBe";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  uint64_t v4 = (void *)SSStringFromTopHit__topHitValueStrings;
  SSStringFromTopHit__topHitValueStrings = v3;
}

id SSStringFromTopHitReasonType(uint64_t a1)
{
  if (SSStringFromTopHitReasonType_onceToken != -1) {
    dispatch_once(&SSStringFromTopHitReasonType_onceToken, &__block_literal_global_373_0);
  }
  BOOL v2 = (void *)SSStringFromTopHitReasonType__topHitReasonStrings;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown TopHitReason: %d", a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v6 = v5;

  return v6;
}

void __SSStringFromTopHitReasonType_block_invoke()
{
  v30[27] = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  v29[0] = v28;
  v30[0] = @"TopHitReasonNone";
  double v27 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  v29[1] = v27;
  v30[1] = @"TopHitReasonSpellCorrectedApp";
  uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
  v29[2] = v26;
  v30[2] = @"TopHitReasonFileAboveThreshold";
  uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithInt:3];
  v29[3] = v25;
  v30[3] = @"TopHitReasonRemindersAboveThreshold";
  uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithInt:4];
  v29[4] = v24;
  v30[4] = @"TopHitReasonNotesAboveThreshold";
  uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:5];
  v29[5] = v23;
  v30[5] = @"TopHitReasonContactsAboveThreshold";
  uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithInt:6];
  v29[6] = v22;
  v30[6] = @"TopHitReasonRecentForTophit";
  id v21 = [MEMORY[0x1E4F28ED0] numberWithInt:7];
  v29[7] = v21;
  v30[7] = @"TopHitReasonCalculationConversion";
  id v20 = [MEMORY[0x1E4F28ED0] numberWithInt:8];
  v29[8] = v20;
  v30[8] = @"TopHitReasonFuzzyResult";
  id v19 = [MEMORY[0x1E4F28ED0] numberWithInt:9];
  v29[9] = v19;
  v30[9] = @"TopHitReasonVendorOnlyMatch";
  id v18 = [MEMORY[0x1E4F28ED0] numberWithInt:10];
  v29[10] = v18;
  v30[10] = @"TopHitReasonMessagesAboveThreshold";
  char v17 = [MEMORY[0x1E4F28ED0] numberWithInt:11];
  v29[11] = v17;
  v30[11] = @"TopHitReasonShortcutsAboveThreshold";
  char v16 = [MEMORY[0x1E4F28ED0] numberWithInt:12];
  v29[12] = v16;
  v30[12] = @"TopHitReasonSafariTopHit";
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
  v29[13] = v15;
  v30[13] = @"TopHitReasonAppInDock";
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:14];
  v29[14] = v14;
  v30[14] = @"TopHitReasonAppInitialsMatch";
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInt:15];
  v29[15] = v13;
  v30[15] = @"TopHitReasonSettingsMaxCep";
  id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:16];
  v29[16] = v12;
  v30[16] = @"TopHitReasonPhotosMediaType";
  int v0 = [MEMORY[0x1E4F28ED0] numberWithInt:17];
  v29[17] = v0;
  v30[17] = @"TopHitReasonMostRecentShortcutResult";
  id v1 = [MEMORY[0x1E4F28ED0] numberWithInt:18];
  v29[18] = v1;
  v30[18] = @"TopHitReasonNLP";
  BOOL v2 = [MEMORY[0x1E4F28ED0] numberWithInt:19];
  v29[19] = v2;
  v30[19] = @"TopHitReasonShortcutsBundle";
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:20];
  v29[20] = v3;
  v30[20] = @"TopHitReasonWorldClock";
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:21];
  v29[21] = v4;
  v30[21] = @"TopHitReasonDataDetectorQuickAction";
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:24];
  v29[22] = v5;
  v30[22] = @"TopHitReasonPersonalizedRanking";
  unint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v29[23] = v6;
  v30[23] = @"TopHitReasonRecentForAboveThresholdTopHit";
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:26];
  v29[24] = v7;
  v30[24] = @"TopHitReasonPreferenceWithHasShortcut";
  id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:27];
  v29[25] = v8;
  v30[25] = @"TopHitReasonNoPommesAndAboveThreshold";
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:28];
  v29[26] = v9;
  v30[26] = @"TopHitReasonNominateLocalTopHitsFromSections";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:27];
  uint64_t v11 = (void *)SSStringFromTopHitReasonType__topHitReasonStrings;
  SSStringFromTopHitReasonType__topHitReasonStrings = v10;
}

void SSLogTopHitWithReasonType(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7 = a2;
  SSStringFromTopHitReasonType(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  SSLogTopHitWithReasonString(a1, v7, v8, a4);
}

void SSLogTopHitWithReasonString(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 rankingItem];
    uint64_t v10 = [v9 displayName];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v7 sectionBundleIdentifier];
  if ([v11 isEqualToString:@"com.apple.mobilesafari"])
  {
    id v12 = @"(private)";
  }
  else
  {
    SSRedactString(v10, 1);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v13 = SSStringFromTopHit(a1);
  uint64_t v14 = SSGeneralLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v7 sectionBundleIdentifier];
    uint64_t v16 = [v7 applicationBundleIdentifier];
    char v17 = (void *)v16;
    int v19 = 138413570;
    id v18 = &stru_1F1824018;
    id v20 = v15;
    __int16 v21 = 2112;
    if (a4) {
      id v18 = @"[Classic Spotlight] ";
    }
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][TopHit Rules] result.sectionBundleIdentifier: %@, result.applicationBundleIdentifier: %@, Title: %@, TopHit: %@, Reason: %@%@", (uint8_t *)&v19, 0x3Eu);
  }
}

uint64_t SSSetTopHitWithReasonString(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a3;
  id v8 = a2;
  [v8 setTopHit:a1];
  SSLogTopHitWithReasonString(a1, v8, v7, a4);

  return a1;
}

uint64_t SSSetTopHitWithReasonType(uint64_t a1, void *a2, uint64_t a3, int a4, int a5)
{
  id v9 = a2;
  [v9 setTopHit:a1];
  if (a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      uint64_t v11 = [v10 rankingItem];

      if (v11)
      {
        id v12 = [v10 rankingItem];
        [v12 setTopHitReason:a3];
      }
    }
  }
  SSLogTopHitWithReasonType(a1, v9, a3, a4);

  return a1;
}

uint64_t SSResultTypeIsServer(unsigned int a1)
{
  return (a1 < 0x1C) & (0xC020002u >> a1);
}

uint64_t SSResultTypeIsSuggestion(unsigned int a1)
{
  return (a1 < 0x27) & (0x4FF8038000uLL >> a1);
}

uint64_t SSResultTypeIsLocalSuggestion(unsigned int a1)
{
  return (a1 < 0x28) & (0xCD80008000uLL >> a1);
}

uint64_t SSSuggestionTypeForResultType(int a1)
{
  int v1 = a1 - 15;
  uint64_t result = 6;
  switch(v1)
  {
    case 2:
      uint64_t result = 1;
      break;
    case 12:
      uint64_t result = 11;
      break;
    case 13:
      uint64_t result = 12;
      break;
    case 14:
      uint64_t result = 14;
      break;
    case 15:
      return result;
    case 17:
      uint64_t result = 5;
      break;
    case 18:
      uint64_t result = 13;
      break;
    default:
      uint64_t result = 7;
      break;
  }
  return result;
}

id SSRoundDouble(int a1, double a2)
{
  BOOL v3 = a2 < 0.0;
  if (a2 == 0.0)
  {
    uint64_t v4 = &unk_1F18612C8;
  }
  else
  {
    double v8 = -a2;
    if (!v3) {
      double v8 = a2;
    }
    double v9 = log10(v8);
    double v10 = __exp10((double)(int)(a1 - vcvtpd_s64_f64(v9)));
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)(uint64_t)round(v10 * a2) / v10];
  }
  return v4;
}

uint64_t SSRoundUInt64(unint64_t a1)
{
  if (a1 >= 0x3E9) {
    unint64_t v1 = 10000 * (a1 / 0x2710);
  }
  else {
    unint64_t v1 = a1;
  }
  return [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v1];
}

id SSValuesFromPlistWithPath(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 fileExistsAtPath:v1],
        v2,
        v3))
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v1 options:8 error:0];
    if (![v4 length]) {
      goto LABEL_17;
    }
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __SSValuesFromPlistWithPath_block_invoke;
    __int16 v25 = &__block_descriptor_40_e5_v8__0l;
    id v26 = v5;
    uint64_t v6 = _MDPlistContainerCreateWithBytesAndDeallocator();
    if (v6)
    {
      id v7 = (const void *)v6;
      double v8 = (void *)_MDPlistContainerCopyRootObject();
      double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v9, "addEntriesFromDictionary:", v15, (void)v18);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
        }
        while (v12);
      }

      if ([v9 count]) {
        id v16 = v9;
      }
      else {
        id v16 = 0;
      }
      CFRelease(v7);
    }
    else
    {
LABEL_17:
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __SSValuesFromPlistWithPath_block_invoke(uint64_t a1)
{
}

uint64_t SSScreenTimeStatusForApplicationPathWithCompletionHandler(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0);
  }
  return 0;
}

uint64_t SSScreenTimeStatusForFilePathWithCompletionHandler()
{
  return 0;
}

void SSScreenTimeStatusClearCache()
{
  if (onceCacheToken != -1) {
    dispatch_once(&onceCacheToken, &__block_literal_global_685);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
  [(id)checkedScreenTimeStatusCache removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
}

uint64_t SSScreenTimeStatusForBundleIDWithCompletionHandler(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (onceCacheToken == -1)
  {
    if (v3)
    {
LABEL_3:
      os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
      char v5 = [(id)checkedScreenTimeStatusCache containsObject:v3];
      if (v4 || (v5 & 1) == 0)
      {
        [(id)checkedScreenTimeStatusCache addObject:v3];
        uint64_t v6 = [(id)screenTimeStatusForBundleCache containsObject:v3];
        os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
        id v7 = v3;
        id v8 = v4;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __updateScreenTimeStatusForBundleId_block_invoke;
        v10[3] = &unk_1E634CF60;
        id v11 = v7;
        id v12 = v8;
        dispatch_async((dispatch_queue_t)screenTimeStatusFetchQueue, v10);
      }
      else
      {
        uint64_t v6 = [(id)screenTimeStatusForBundleCache containsObject:v3];
        os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
      }
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&onceCacheToken, &__block_literal_global_685);
    if (v3) {
      goto LABEL_3;
    }
  }
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

uint64_t SSHiddenStatusForBundleIDWithCompletionHandler(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = SSGetDisabledBundleSet();
  uint64_t v6 = [MEMORY[0x1E4F74230] sharedConnection];
  id v7 = [v6 restrictedAppBundleIDs];

  if (v7)
  {
    id v8 = [v7 allObjects];
    [v5 addObjectsFromArray:v8];
  }
  if (!v3)
  {
    uint64_t v9 = 0;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = [v5 containsObject:v3];
  if (v4) {
LABEL_5:
  }
    v4[2](v4, v9);
LABEL_6:

  return v9;
}

id strippedURL(void *a1)
{
  id v1 = a1;
  if (strippedURL_onceToken != -1) {
    dispatch_once(&strippedURL_onceToken, &__block_literal_global_475);
  }
  if ([v1 hasPrefix:@"http://www."])
  {
    uint64_t v2 = [v1 substringFromIndex:11];

    id v1 = (id)v2;
  }
  if ([v1 hasPrefix:@"https://www."])
  {
    uint64_t v3 = [v1 substringFromIndex:12];

    id v1 = (id)v3;
  }
  if ([v1 hasPrefix:@"https://"])
  {
    uint64_t v4 = [v1 substringFromIndex:8];

    id v1 = (id)v4;
  }
  if ([v1 hasPrefix:@"http://"])
  {
    uint64_t v5 = [v1 substringFromIndex:7];

    id v1 = (id)v5;
  }
  uint64_t v6 = [v1 stringByTrimmingCharactersInSet:strippedURL_trimSet];

  return v6;
}

uint64_t __strippedURL_block_invoke()
{
  strippedURL_trimSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/"];
  return MEMORY[0x1F41817F8]();
}

void handleHiddenResult(void *a1, void *a2, void *a3)
{
  id v12 = a1;
  id v5 = a2;
  if (v5 != v12)
  {
    id v6 = a3;
    id v7 = [v6 hiddenExtResults];
    id v8 = [v7 arrayByAddingObject:v12];
    [v6 setHiddenExtResults:v8];

    objc_msgSend(v5, "setNoGoTakeover:", objc_msgSend(v12, "noGoTakeover") | objc_msgSend(v5, "noGoTakeover"));
    uint64_t v9 = [v5 duplicatedItems];

    if (!v9)
    {
      id v10 = objc_opt_new();
      [v5 setDuplicatedItems:v10];
    }
    id v11 = [v5 duplicatedItems];
    [v11 addObject:v12];
  }
}

id SSGetCurrentLocale(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (SSGetCurrentLocale_onceToken != -1) {
    dispatch_once(&SSGetCurrentLocale_onceToken, &__block_literal_global_493);
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__4;
  v9[4] = __Block_byref_object_dispose__4;
  id v10 = 0;
  id v4 = v3;
  id v10 = v4;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __SSGetCurrentLocale_block_invoke_2;
  v7[3] = &unk_1E634CEC0;
  v7[4] = v9;
  v7[5] = v8;
  v7[6] = &v11;
  [(id)SSGetCurrentLocale_localeObserver currentLocaleWithPreferredLanguagesBlock:v7];
  id v5 = (id)v12[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v5;
}

void sub_1BDB92FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __SSGetCurrentLocale_block_invoke()
{
  SSGetCurrentLocale_localeObserver = objc_alloc_init(SSLocaleObserver);
  return MEMORY[0x1F41817F8]();
}

void __SSGetCurrentLocale_block_invoke_2(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v12 = a3;
  id v8 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (v8) {
    [v8 addObjectsFromArray:v12];
  }
  uint64_t v9 = *(unsigned char **)(*(void *)(a1[5] + 8) + 24);
  if (v9) {
    *uint64_t v9 = a4;
  }
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

uint64_t SSSplitCounts(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t *a9, void *a10)
{
  if (a2 == 0x7FFFFFFF || (uint64_t v10 = result, result >= a2) && (uint64_t v10 = result, a2 >= 1)) {
    uint64_t v10 = a2;
  }
  if (a5 == 0x7FFFFFFF || (uint64_t v11 = a4, a4 >= a5) && (uint64_t v11 = a4, a5 >= 1)) {
    uint64_t v11 = a5;
  }
  if (v10 && v11)
  {
    uint64_t v12 = (uint64_t)((double)a7 * 0.5);
    if (a7 <= 2) {
      uint64_t v12 = 1;
    }
    if (v12 < v10) {
      uint64_t v10 = v12;
    }
    uint64_t v13 = a7 - v11;
    if (a7 - v10 <= v11) {
      uint64_t v13 = v10;
    }
    if (a7 - v10 < v11) {
      uint64_t v11 = a7 - v10;
    }
  }
  else
  {
    if (v11 >= a7) {
      uint64_t v14 = a7;
    }
    else {
      uint64_t v14 = v11;
    }
    if (v11) {
      uint64_t v11 = v14;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v10 >= a7) {
      uint64_t v13 = a7;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  if (v13 >= result) {
    uint64_t v13 = result;
  }
  if (v13 >= a2) {
    uint64_t v13 = a2;
  }
  if (v11 >= a4) {
    uint64_t v11 = a4;
  }
  if (v11 >= a5) {
    uint64_t v15 = a5;
  }
  else {
    uint64_t v15 = v11;
  }
  uint64_t v16 = a3 - 1;
  if (a3 - 1 >= (unint64_t)(v13 - 1)) {
    uint64_t v16 = v13 - 1;
  }
  uint64_t v17 = v13 - 1 - v16;
  uint64_t v18 = ~v16 + a7;
  if (a3 < 1)
  {
    uint64_t v17 = v13;
    uint64_t v18 = a7;
  }
  if (!v13)
  {
    uint64_t v17 = 0;
    uint64_t v18 = a7;
  }
  uint64_t v19 = a6 - 1;
  if (a6 - 1 >= (unint64_t)(v15 - 1)) {
    uint64_t v19 = v15 - 1;
  }
  uint64_t v20 = v15 - 1 - v19;
  uint64_t v21 = v18 + ~v19;
  if (a6 < 1)
  {
    uint64_t v20 = v15;
    uint64_t v21 = v18;
  }
  if (v15) {
    uint64_t v18 = v21;
  }
  else {
    uint64_t v20 = 0;
  }
  if (a2 >= result) {
    uint64_t v22 = result;
  }
  else {
    uint64_t v22 = a2;
  }
  if (a5 >= a4) {
    uint64_t v23 = a4;
  }
  else {
    uint64_t v23 = a5;
  }
  while (v20 + v17 < v18)
  {
    if (a2 && v17 >= v22)
    {
      uint64_t v24 = 1;
      if (a5 && v20 >= v23) {
        break;
      }
    }
    else
    {
      ++v17;
      if (a5) {
        BOOL v25 = v20 < v23;
      }
      else {
        BOOL v25 = 1;
      }
      uint64_t v24 = v25;
    }
    v20 += v24;
  }
  if (a8) {
    *a8 = v17;
  }
  if (a9) {
    *a9 = v20;
  }
  if (a10) {
    *a10 = v20 + v17;
  }
  return result;
}

BOOL _SSGetMDPlistObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  if (_SSGetMDPlistObject_oncePathCacheToken != -1) {
    dispatch_once(&_SSGetMDPlistObject_oncePathCacheToken, &__block_literal_global_497);
  }
  return _SSGetMDPlistObject_sAppExtrasContainer && _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

uint64_t SSExtraApplicationVersion()
{
  long long v2 = 0uLL;
  uint64_t v3 = 0;
  BOOL v0 = _SSGetMDPlistObject((uint64_t)"v", 1, (uint64_t)&v2);
  uint64_t result = 0;
  if (v0)
  {
    if (_MDPlistGetPlistObjectType() == 226
      || _MDPlistGetPlistObjectType() == 35
      || _MDPlistGetPlistObjectType() == 227
      || _MDPlistGetPlistObjectType() == 51)
    {
      return _MDPlistNumberGetIntValue();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SSApplicationHasExtraInformation(void *a1)
{
  id v1 = a1;
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  uint64_t v2 = 0;
  if (_SSGetMDPlistObject((uint64_t)"n", 1, (uint64_t)&v9))
  {
    long long v5 = v9;
    uint64_t v7 = v10;
    if (_MDPlistGetPlistObjectType() == 241)
    {
      uint64_t v2 = objc_msgSend(v1, "UTF8String", v5, v7);
      if (v2 && _MDPlistDictionaryGetPlistObjectForKey()) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  if (!_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v9)
    || (v6 = v9, uint64_t v8 = v10, _MDPlistGetPlistObjectType() != 241)
    || !v2 && !objc_msgSend(v1, "UTF8String", v6, v8)
    || !_MDPlistDictionaryGetPlistObjectForKey())
  {
    uint64_t v3 = 0;
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v3 = 1;
LABEL_14:

  return v3;
}

id SSBuildExtraApplicationAlternateNames(void *a1, void *a2, char a3)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (!v5) {
    goto LABEL_9;
  }
  long long v61 = 0uLL;
  uint64_t v62 = 0;
  if (!_SSGetMDPlistObject((uint64_t)"n", 1, (uint64_t)&v61)) {
    goto LABEL_9;
  }
  long long v74 = v61;
  *(void *)&long long v75 = v62;
  if (_MDPlistGetPlistObjectType() != 241) {
    goto LABEL_9;
  }
  long long v59 = 0uLL;
  uint64_t v60 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v34 = v5;
  [v34 UTF8String];
  long long v74 = v61;
  *(void *)&long long v75 = v62;
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && (long long v74 = v59, *(void *)&v75 = v60, _MDPlistGetPlistObjectType() == 241))
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v74 = 0u;
    uint64_t v55 = 0;
    float v56 = &v55;
    uint64_t v57 = 0x2020000000;
    int v58 = 0;
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    long long v50 = __SSBuildExtraApplicationAlternateNames_block_invoke;
    long long v51 = &unk_1E634CEE8;
    long long v52 = &v55;
    long long v53 = &v83;
    uint64_t v54 = &v74;
    *(_OWORD *)buf = v59;
    *(void *)&buf[16] = v60;
    _MDPlistDictionaryIterate();
    switch(*((_DWORD *)v56 + 6))
    {
      case 1:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        id v73 = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        goto LABEL_23;
      case 2:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        v72[0] = v7;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v83 + 1)];
        v72[1] = v11;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
        goto LABEL_22;
      case 3:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        v71[0] = v7;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v83 + 1)];
        v71[1] = v11;
        uint64_t v12 = [NSString stringWithUTF8String:(void)v84];
        v71[2] = v12;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
        goto LABEL_21;
      case 4:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        v70[0] = v7;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v83 + 1)];
        v70[1] = v11;
        uint64_t v12 = [NSString stringWithUTF8String:(void)v84];
        v70[2] = v12;
        uint64_t v13 = [NSString stringWithUTF8String:*((void *)&v84 + 1)];
        v70[3] = v13;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
        goto LABEL_20;
      case 5:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        v69[0] = v7;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v83 + 1)];
        v69[1] = v11;
        uint64_t v12 = [NSString stringWithUTF8String:(void)v84];
        v69[2] = v12;
        uint64_t v13 = [NSString stringWithUTF8String:*((void *)&v84 + 1)];
        void v69[3] = v13;
        uint64_t v14 = [NSString stringWithUTF8String:(void)v85];
        v69[4] = v14;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:5];
        goto LABEL_19;
      case 6:
        uint64_t v7 = [NSString stringWithUTF8String:(void)v83];
        v68[0] = v7;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v83 + 1)];
        v68[1] = v11;
        uint64_t v12 = [NSString stringWithUTF8String:(void)v84];
        v68[2] = v12;
        uint64_t v13 = [NSString stringWithUTF8String:*((void *)&v84 + 1)];
        void v68[3] = v13;
        uint64_t v14 = [NSString stringWithUTF8String:(void)v85];
        v68[4] = v14;
        uint64_t v15 = [NSString stringWithUTF8String:*((void *)&v85 + 1)];
        v68[5] = v15;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:6];

LABEL_19:
LABEL_20:

LABEL_21:
LABEL_22:

LABEL_23:
        if (*((_DWORD *)v56 + 6))
        {
          if ((a3 & 1) == 0)
          {
            [MEMORY[0x1E4F1CA20] preferredLanguages];
            uint64_t v16 = (void *)MDRetrieveBestAvailableLanguage();
            uint64_t v67 = v16;
            uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];

            uint64_t v8 = (void *)v17;
          }
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          obuint64_t j = v8;
          uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v66 count:16];
          if (!v18) {
            goto LABEL_61;
          }
          uint64_t v36 = *(void *)v45;
          *(void *)&long long v19 = 138412802;
          long long v33 = v19;
LABEL_28:
          uint64_t v37 = v18;
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v45 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
            long long v42 = 0uLL;
            uint64_t v43 = 0;
            if (!v21) {
              goto LABEL_59;
            }
            id v22 = v21;
            [v22 UTF8String];
            *(_OWORD *)buf = v59;
            *(void *)&buf[16] = v60;
            if (!_MDPlistDictionaryGetPlistObjectForKey()) {
              goto LABEL_59;
            }
            *(_OWORD *)buf = v42;
            *(void *)&buf[16] = v43;
            unsigned int v23 = _MDPlistGetPlistObjectType() - 240;
            if (v23 > 5 || ((1 << v23) & 0x31) == 0) {
              goto LABEL_59;
            }
            *(_OWORD *)buf = v42;
            *(void *)&buf[16] = v43;
            uint64_t v24 = (void *)_MDPlistContainerCopyObject();
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v34;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v65 = v24;
              _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "adding name %@ %@ %@", buf, 0x20u);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v26 = v24;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v27 = v26;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v63 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v39;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v39 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v31 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v32 = v31;
                      if ([v32 length])
                      {
                        if (!v6)
                        {
                          id v6 = [MEMORY[0x1E4F1CA80] set];
                        }
                        objc_msgSend(v6, "addObject:", v32, v33);
                      }
                    }
                  }
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v63 count:16];
                }
                while (v28);
              }

              goto LABEL_57;
            }
LABEL_58:

LABEL_59:
            if (++v20 == v37)
            {
              uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v66 count:16];
              if (!v18)
              {
LABEL_61:

                id v9 = v6;
                goto LABEL_63;
              }
              goto LABEL_28;
            }
          }
          id v25 = v24;
          if ([v25 length])
          {
            if (!v6)
            {
              id v6 = [MEMORY[0x1E4F1CA80] set];
            }
            objc_msgSend(v6, "addObject:", v25, v33);
          }
LABEL_57:

          goto LABEL_58;
        }
        id v9 = v6;

LABEL_63:
        _Block_object_dispose(&v55, 8);
        break;
      default:
        id v9 = v6;
        goto LABEL_63;
    }
  }
  else
  {
LABEL_9:
    id v9 = v6;
  }

  return v9;
}

void sub_1BDB93F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

id SSAllLocalizedExtraApplicationKeywords(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_7;
  }
  long long v4 = 0uLL;
  uint64_t v5 = 0;
  uint64_t v2 = 0;
  if (!_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v4)) {
    goto LABEL_8;
  }
  if (_MDPlistGetPlistObjectType() == 241
    && ([v1 UTF8String], _MDPlistDictionaryGetPlistObjectForKey())
    && _MDPlistGetPlistObjectType() == 241)
  {
    uint64_t v2 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
LABEL_7:
    uint64_t v2 = 0;
  }
LABEL_8:

  return v2;
}

id SSExtraApplicationKeywords(void *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    goto LABEL_8;
  }
  long long v21 = 0uLL;
  uint64_t v22 = 0;
  if (!_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v21)) {
    goto LABEL_8;
  }
  long long v31 = v21;
  *(void *)&long long v32 = v22;
  if (_MDPlistGetPlistObjectType() != 241) {
    goto LABEL_8;
  }
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  id v2 = v1;
  [v2 UTF8String];
  long long v31 = v21;
  *(void *)&long long v32 = v22;
  if (!_MDPlistDictionaryGetPlistObjectForKey()) {
    goto LABEL_8;
  }
  long long v31 = v19;
  *(void *)&long long v32 = v20;
  if (_MDPlistGetPlistObjectType() == 241)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    *(_OWORD *)buf = v19;
    *(void *)&buf[16] = v20;
    _MDPlistDictionaryIterate();
    switch(*((_DWORD *)v16 + 6))
    {
      case 1:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        id v30 = v3;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        goto LABEL_22;
      case 2:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        v29[0] = v3;
        uint64_t v7 = [NSString stringWithUTF8String:*((void *)&v40 + 1)];
        v29[1] = v7;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        goto LABEL_21;
      case 3:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        v28[0] = v3;
        uint64_t v7 = [NSString stringWithUTF8String:*((void *)&v40 + 1)];
        v28[1] = v7;
        uint64_t v8 = [NSString stringWithUTF8String:(void)v41];
        v28[2] = v8;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
        goto LABEL_20;
      case 4:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        v27[0] = v3;
        uint64_t v7 = [NSString stringWithUTF8String:*((void *)&v40 + 1)];
        v27[1] = v7;
        uint64_t v8 = [NSString stringWithUTF8String:(void)v41];
        v27[2] = v8;
        id v9 = [NSString stringWithUTF8String:*((void *)&v41 + 1)];
        v27[3] = v9;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
        goto LABEL_19;
      case 5:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        v26[0] = v3;
        uint64_t v7 = [NSString stringWithUTF8String:*((void *)&v40 + 1)];
        v26[1] = v7;
        uint64_t v8 = [NSString stringWithUTF8String:(void)v41];
        v26[2] = v8;
        id v9 = [NSString stringWithUTF8String:*((void *)&v41 + 1)];
        v26[3] = v9;
        uint64_t v10 = [NSString stringWithUTF8String:(void)v42];
        v26[4] = v10;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
        goto LABEL_18;
      case 6:
        uint64_t v3 = [NSString stringWithUTF8String:(void)v40];
        v25[0] = v3;
        uint64_t v7 = [NSString stringWithUTF8String:*((void *)&v40 + 1)];
        v25[1] = v7;
        uint64_t v8 = [NSString stringWithUTF8String:(void)v41];
        v25[2] = v8;
        id v9 = [NSString stringWithUTF8String:*((void *)&v41 + 1)];
        v25[3] = v9;
        uint64_t v10 = [NSString stringWithUTF8String:(void)v42];
        v25[4] = v10;
        uint64_t v11 = [NSString stringWithUTF8String:*((void *)&v42 + 1)];
        v25[5] = v11;
        long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];

LABEL_18:
LABEL_19:

LABEL_20:
LABEL_21:

LABEL_22:
        if (*((_DWORD *)v16 + 6))
        {
          [MEMORY[0x1E4F1CA20] preferredLanguages];
          uint64_t v12 = (void *)MDRetrieveBestAvailableLanguage();
          uint64_t v13 = v12;
          if (v12
            && (id v14 = v12,
                [v14 UTF8String],
                *(_OWORD *)buf = v19,
                *(void *)&buf[16] = v20,
                _MDPlistDictionaryGetPlistObjectForKey())
            && (memset(buf, 0, sizeof(buf)), (_MDPlistGetPlistObjectType() & 0xFFFFFFFE) == 0xF4))
          {
            memset(buf, 0, sizeof(buf));
            uint64_t v5 = (void *)_MDPlistContainerCopyObject();
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v14;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v2;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v24 = v5;
              _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "adding keyword %@ %@ %@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
        else
        {
          uint64_t v5 = 0;
        }
        break;
      default:
        uint64_t v5 = 0;
        long long v4 = 0;
        break;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
LABEL_8:
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1BDB94778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _SSGetAbbreviationsMDPlistObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  if (_SSGetAbbreviationsMDPlistObject_oncePathCacheToken != -1) {
    dispatch_once(&_SSGetAbbreviationsMDPlistObject_oncePathCacheToken, &__block_literal_global_507);
  }
  return _SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer
      && _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

uint64_t SSAbbreviationsVersion()
{
  long long v2 = 0uLL;
  uint64_t v3 = 0;
  BOOL v0 = _SSGetAbbreviationsMDPlistObject((uint64_t)"v", 1, (uint64_t)&v2);
  uint64_t result = 0;
  if (v0)
  {
    if (_MDPlistGetPlistObjectType() == 226
      || _MDPlistGetPlistObjectType() == 35
      || _MDPlistGetPlistObjectType() == 227
      || _MDPlistGetPlistObjectType() == 51)
    {
      return _MDPlistNumberGetIntValue();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id SSAllLengthyOriginals(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    long long v4 = [a1 lowercaseString];
    uint64_t v5 = [v3 lowercaseString];

    if (!v5
      || [(__CFString *)v5 hasPrefix:@"en"]
      && (unint64_t)[(__CFString *)v5 length] >= 3)
    {

      uint64_t v5 = @"en";
    }
    long long v9 = 0uLL;
    uint64_t v10 = 0;
    id v6 = v5;
    uint64_t v7 = 0;
    if (_SSGetAbbreviationsMDPlistObject([(__CFString *)v6 UTF8String], [(__CFString *)v6 length], (uint64_t)&v9))
    {
      if (_MDPlistGetPlistObjectType() == 241
        && ([v4 UTF8String],
            _MDPlistDictionaryGetPlistObjectForKey())
        && _MDPlistGetPlistObjectType() == 240)
      {
        uint64_t v7 = (void *)_MDPlistContainerCopyObject();
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

id SSBuildTTRURL(void *a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v48 = a3;
  uint64_t v7 = [NSString stringWithFormat:@"<Build>"];
  long long v45 = (void *)_CFCopySupplementalVersionDictionary();
  uint64_t v8 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  long long v44 = v8;
  if (v8)
  {
    id v9 = v8;

    uint64_t v7 = v9;
  }
  uint64_t v10 = [MEMORY[0x1E4F28E78] string];
  long long v46 = v7;
  [v10 appendFormat:@"Build: %@\n\n", v7];
  long long v47 = v5;
  [v10 appendFormat:@"Query: %@\n\n", v5];
  [v10 appendString:@"Results:\n"];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v50 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [v10 appendString:@"\n"];
        uint64_t v15 = [v14 title];
        uint64_t v16 = [v14 bundleIdentifier];
        objc_msgSend(v10, "appendFormat:", @"%@ <%@> maxInitiallyVisibleResults: %lu, isInitiallyHidden; %d\n",
          v15,
          v16,
          [v14 maxInitiallyVisibleResults],
          [v14 isInitiallyHidden]);

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v17 = [v14 results];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v53 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = [*(id *)(*((void *)&v52 + 1) + 8 * j) ttrDescription];
              [v10 appendFormat:@"\t%@", v22];

              [v10 appendString:@"\n"];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v19);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v12);
  }

  unsigned int v23 = [MEMORY[0x1E4F28E78] stringWithString:@"Problem Summary: \n\nSteps to Reproduce: \n\nRegression Information: \n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information. ***\n\n===  DEBUG INFO  ===\n\n"];
  [v23 appendFormat:@"%@\n\n", v10];
  uint64_t v24 = &stru_1F1824018;
  if (v48) {
    uint64_t v24 = v48;
  }
  [v23 appendFormat:@"%@\n\n", v24];
  id v25 = SSDefaultsGetResources();
  id v26 = [v25 getTTRLogs];
  long long v39 = v23;
  [v23 appendString:v26];

  uint64_t v43 = SSExtensionIdentifiersForSections(obj);
  id v27 = objc_opt_new();
  [v27 setScheme:@"tap-to-radar"];
  [v27 setHost:@"new"];
  long long v51 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:@"Spotlight (New Bugs)"];
  v60[0] = v51;
  long long v42 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:@"iOS"];
  v60[1] = v42;
  long long v41 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:@"312963"];
  v60[2] = v41;
  uint64_t v28 = (void *)MEMORY[0x1E4F290C8];
  long long v40 = [v43 componentsJoinedByString:@","];
  uint64_t v29 = [v28 queryItemWithName:@"ExtensionIdentifiers" value:v40];
  v60[3] = v29;
  id v30 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:@"Other Bug"];
  v60[4] = v30;
  long long v31 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
  v60[5] = v31;
  long long v32 = (void *)MEMORY[0x1E4F290C8];
  long long v33 = [NSString stringWithFormat:@"%@: ", v46];
  long long v34 = [v32 queryItemWithName:@"Title" value:v33];
  v60[6] = v34;
  long long v35 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:v23];
  v60[7] = v35;
  long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:8];
  [v27 setQueryItems:v36];

  long long v37 = [v27 URL];

  return v37;
}

id SSExtensionIdentifiersForSections(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    id v5 = &unk_1F1864610;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "bundleIdentifier", (void)v10);
        int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v7);

        if (IsSyndicatedPhotos)
        {
          id v5 = [&unk_1F1864610 arrayByAddingObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics"];
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = &unk_1F1864610;
  }
LABEL_12:

  return v5;
}

uint64_t isImageOrVideoContentType(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  if ([v1 conformsToType:*MEMORY[0x1E4F44448]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F44400]];
  }

  return v2;
}

uint64_t isMessagesAttachmentCoreSpotlightId(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"at_"];
}

id SSAppNameForBundleId(void *a1)
{
  id v1 = a1;
  id v8 = 0;
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:1 error:&v8];
  id v3 = v8;
  uint64_t v4 = [v2 localizedName];

  if (v3)
  {
    id v5 = SSGeneralLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      SSAppNameForBundleId_cold_1((uint64_t)v1, (uint64_t)v3, v5);
    }
  }
  if (!v4)
  {
    if ([v1 isEqualToString:@"com.apple.mobileslideshow"])
    {
      id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v4 = [v6 localizedStringForKey:@"PHOTOS_APP_NAME" value:&stru_1F1824018 table:@"SpotlightServices"];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

id SSBundlesDonatingPhotos()
{
  if (SSBundlesDonatingPhotos_onceToken != -1) {
    dispatch_once(&SSBundlesDonatingPhotos_onceToken, &__block_literal_global_624);
  }
  BOOL v0 = (void *)SSBundlesDonatingPhotos_bundlesDonatingPhotos;
  return v0;
}

void __SSBundlesDonatingPhotos_block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.mobileslideshow";
  v2[1] = @"com.apple.mobilenotes";
  v2[2] = @"com.apple.MobileSMS";
  v2[3] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  v2[4] = @"com.apple.FileProvider.LocalStorage";
  v2[5] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  v2[6] = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  id v1 = (void *)SSBundlesDonatingPhotos_bundlesDonatingPhotos;
  SSBundlesDonatingPhotos_bundlesDonatingPhotos = v0;
}

uint64_t utf32BEToHex(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t syllableToConsonant(uint64_t result)
{
  if ((result - 4352) >= 0x13)
  {
    if ((result - 44032) >> 2 > 0xAE8)
    {
      if ((result - 12593) > 0x1D) {
        return 0;
      }
      else {
        return dword_1BDC5D6B0[(int)result - 12593];
      }
    }
    else
    {
      return ((28533 * (unsigned __int16)(result + 21504)) >> 24) | 0x1100;
    }
  }
  return result;
}

uint64_t syllableToConsonantCompatibility(uint64_t a1)
{
  uint64_t result = syllableToConsonant(a1);
  if (result) {
    return koreanConsonantTable[(result - 4352)];
  }
  return result;
}

uint64_t addUtf32BEToBufferAtIndexFromHex(uint64_t result, void *a2, int a3)
{
  uint64_t v3 = (*a2)++;
  *(unsigned char *)(result + v3) = HIBYTE(a3);
  uint64_t v4 = (*a2)++;
  *(unsigned char *)(result + v4) = BYTE2(a3);
  uint64_t v5 = (*a2)++;
  *(unsigned char *)(result + v5) = BYTE1(a3);
  uint64_t v6 = (*a2)++;
  *(unsigned char *)(result + v6) = a3;
  return result;
}

CFStringRef createConsonantsStringForKorean(const __CFString *a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0xC000100u);
  size_t v6 = MaximumSizeForEncoding + 1;
  uint64_t v7 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x8418548AuLL);
  if (!v7)
  {
    uint64_t v15 = SSGeneralLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v19 = 138412290;
    CFStringRef v20 = a1;
    uint64_t v16 = "[consonantString] Failed malloc for bufferUtf32, string: %@";
LABEL_23:
    _os_log_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0xCu);
    goto LABEL_24;
  }
  id v8 = v7;
  if (!CFStringGetCString(a1, v7, v6, 0x18000100u))
  {
    free(v8);
    uint64_t v15 = SSGeneralLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v19 = 138412290;
    CFStringRef v20 = a1;
    uint64_t v16 = "[consonantString] Failed to get utf32be for string: %@";
    goto LABEL_23;
  }
  id v9 = (UInt8 *)malloc_type_malloc(v6, 0x83479AF2uLL);
  if (!v9)
  {
    uint64_t v15 = SSGeneralLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v19 = 138412290;
    CFStringRef v20 = a1;
    uint64_t v16 = "[consonantString] Failed malloc for consonantsBuffer, string: %@";
    goto LABEL_23;
  }
  long long v10 = v9;
  if (MaximumSizeForEncoding >= 1)
  {
    CFIndex v11 = 0;
    long long v12 = (unsigned int *)&v8[MaximumSizeForEncoding];
    long long v13 = (unsigned int *)v8;
    while (1)
    {
      unsigned int v14 = syllableToConsonant(bswap32(*v13));
      if (!a2) {
        goto LABEL_9;
      }
      if (v14) {
        break;
      }
LABEL_11:
      if (++v13 >= v12) {
        goto LABEL_20;
      }
    }
    unsigned int v14 = koreanConsonantTable[v14 - 4352];
LABEL_9:
    if (v14)
    {
      *(_DWORD *)&v10[v11] = bswap32(v14);
      v11 += 4;
    }
    goto LABEL_11;
  }
  CFIndex v11 = 0;
  long long v13 = (unsigned int *)v8;
LABEL_20:
  *(unsigned char *)long long v13 = 0;
  free(v8);
  CFStringRef v17 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, v11, 0x18000100u, 0);
  free(v10);
  if (!v17)
  {
    uint64_t v15 = SSGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      CFStringRef v20 = a1;
      uint64_t v16 = "[consonantString] consonantsString is null for string: %@";
      goto LABEL_23;
    }
LABEL_24:

    return 0;
  }
  return v17;
}

uint64_t SSSnippetModernizationEnabled()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v5 = 0;
  int v1 = [v0 BOOLeanForKey:@"SnippetModernization" didFailWithError:&v5];
  uint64_t v2 = v5;

  if (v2) {
    int v3 = 1;
  }
  else {
    int v3 = v1;
  }
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSAppTopHitWithShortcutsEnabled()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v5 = 0;
  int v1 = [v0 BOOLeanForKey:@"AppTopHitWithShortcuts" didFailWithError:&v5];
  uint64_t v2 = v5;

  if (v2) {
    int v3 = 1;
  }
  else {
    int v3 = v1;
  }
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSShortcutsAppSectionEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t SSAppVendedTopHitViewsEnabled()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v5 = 0;
  int v1 = [v0 BOOLeanForKey:@"AppVendedTopHits" didFailWithError:&v5];
  uint64_t v2 = v5;

  if (v2) {
    int v3 = 1;
  }
  else {
    int v3 = v1;
  }
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSPriorityIndexFastPathEnabled()
{
  uint64_t v0 = SSDefaultsGetResources();
  id v5 = 0;
  uint64_t v1 = [v0 BOOLeanForKey:@"EnablePriorityIndexFastPath" didFailWithError:&v5];
  id v2 = v5;

  if (v2)
  {
    int v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SSPriorityIndexFastPathEnabled_cold_1();
    }

    uint64_t v1 = 1;
  }

  return v1;
}

uint64_t SSPriorityIndexLimitBundles()
{
  uint64_t v0 = SSDefaultsGetResources();
  id v5 = 0;
  uint64_t v1 = [v0 BOOLeanForKey:@"PriorityIndexLimitBundles" didFailWithError:&v5];
  id v2 = v5;

  if (v2)
  {
    int v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SSPriorityIndexLimitBundles_cold_1();
    }

    uint64_t v1 = 1;
  }

  return v1;
}

uint64_t SSPriorityIndexDelayMilliseconds()
{
  uint64_t v0 = SSDefaultsGetResources();
  id v5 = 0;
  uint64_t v1 = [v0 longForKey:@"PriorityIndexDelayMilliseconds" didFailWithError:&v5];
  id v2 = v5;

  if (v2)
  {
    int v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SSPriorityIndexDelayMilliseconds_cold_1((uint64_t)v2, v3);
    }

    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t SSIsCounterFactual()
{
  uint64_t v0 = SSDefaultsGetResources();
  id v5 = 0;
  uint64_t v1 = [v0 BOOLeanForKey:@"IsCounterFactual" didFailWithError:&v5];
  id v2 = v5;

  if (v2)
  {
    int v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SSIsCounterFactual_cold_1((uint64_t)v2, v3);
    }

    uint64_t v1 = 0;
  }

  return v1;
}

id SSFetchAttributeValueIsValid(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = v2;
            goto LABEL_14;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t SSPrepareItemsLimit(void *a1, void *a2)
{
  id v3 = a2;
  if ([a1 isEqualToString:@"com.apple.mobilemail"])
  {
    unint64_t v4 = [v3 length];
    if (v4 <= 6) {
      int v5 = 25;
    }
    else {
      int v5 = 40;
    }
    if (v4 == 8) {
      int v6 = 50;
    }
    else {
      int v6 = v5;
    }
    if (v4 <= 8) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = 65;
    }
    if (v4 >= 5) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 20;
    }
  }
  else
  {
    uint64_t v8 = 20;
  }

  return v8;
}

uint64_t SSSpotlightL1Compare(void *a1, void *a2, double *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v5, "test_indexScore");
  unint64_t v9 = v8;
  uint64_t v10 = objc_msgSend(v6, "test_indexScore");
  if (v7 | v9 && v10 | v11)
  {
    if (__PAIR128__(v11, v10) < __PAIR128__(v9, v7)) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    if (v9 == v11 && v7 == v10) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = v12;
    }
  }
  else
  {
    double v15 = *a3;
    uint64_t v16 = [v5 interestingDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = vabdd_f64(v15, v17);

    double v19 = *a3;
    CFStringRef v20 = [v6 interestingDate];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = vabdd_f64(v19, v21);

    uint64_t v23 = -1;
    if (v18 >= v22) {
      uint64_t v23 = 1;
    }
    if (v18 == v22) {
      uint64_t v23 = 0;
    }
    uint64_t v14 = v23;
  }

  return v14;
}

void SSBinaryHeapApplierFunction(uint64_t a1, uint64_t a2)
{
  id v3 = (void (**)(void, void, void))MEMORY[0x1C1885400](a2);
  char v4 = 0;
  ((void (**)(void, uint64_t, char *))v3)[2](v3, a1, &v4);
}

void __initCacheOnce_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)checkedScreenTimeStatusCache;
  checkedScreenTimeStatusCache = v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)screenTimeStatusForBundleCache;
  screenTimeStatusForBundleCache = v2;

  id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v4 = dispatch_queue_create("screenTimeStatusBundleFetchQueue", v6);
  id v5 = (void *)screenTimeStatusFetchQueue;
  screenTimeStatusFetchQueue = (uint64_t)v4;
}

void __updateScreenTimeStatusForBundleId_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = 0;
  dispatch_queue_t v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
  id v5 = v10;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __updateScreenTimeStatusForBundleId_block_invoke_2;
    v7[3] = &unk_1E634CF38;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v4 getDeviceManagementPolicyWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

void __updateScreenTimeStatusForBundleId_block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a2 != 0;
  os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2) {
    [(id)screenTimeStatusForBundleCache addObject:v5];
  }
  else {
    [(id)screenTimeStatusForBundleCache removeObject:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
  if (*(void *)(a1 + 40))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __updateScreenTimeStatusForBundleId_block_invoke_3;
    v6[3] = &unk_1E634CF10;
    id v7 = *(id *)(a1 + 40);
    BOOL v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __updateScreenTimeStatusForBundleId_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

CFTypeRef SSBinaryHeapRetainFunction(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

void SSBinaryHeapReleaseFunction(int a1, CFTypeRef cf)
{
}

uint64_t SSBinaryHeapCompareInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a3 + 16) + 16))();
  uint64_t v4 = 1;
  if (v3 != -1) {
    uint64_t v4 = -1;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

id comparatorWithBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)MEMORY[0x1C1885400](a2);
  return v2;
}

id comparatorForDateAttribute_block_invoke_2(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = comparatorForDateAttribute_block_invoke_3;
  v4[3] = &__block_descriptor_36_e11_q24__0_8_16l;
  int v5 = a2;
  id v2 = (void *)MEMORY[0x1C1885400](v4);
  return v2;
}

uint64_t comparatorForDateAttribute_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[a2 attributes], *(int *)(a1 + 32));
  id v7 = (int8x8_t *)[v5 attributes];

  uint64_t v8 = SSCompactRankingAttrsGetValue(v7, *(int *)(a1 + 32));
  id v9 = (void *)v8;
  if (v6)
  {
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() ^ 1;
    if (v9)
    {
LABEL_3:
      objc_opt_class();
      int v11 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_6;
    }
  }
  else
  {
    int v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  int v11 = 0;
LABEL_6:
  if ((v10 | v11))
  {
    getpid();
    SimulateCrash();
    if ((v10 ^ 1 | v11)) {
      uint64_t v12 = v11 & (v10 ^ 1) & 1;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    [v6 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v9 timeIntervalSinceReferenceDate];
    if (v14 < v15) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = v14 > v15;
    }
  }

  return v12;
}

void *comparatorForPastDateRecency_block_invoke_4()
{
  return &__block_literal_global_23;
}

uint64_t comparatorForPastDateRecency_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 mostRecentUsedDate];
  double v7 = v6;
  [v5 mostRecentUsedDate];
  if (v7 >= v8)
  {
    [v4 mostRecentUsedDate];
    double v11 = v10;
    [v5 mostRecentUsedDate];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void *comparatorForFutureDateRecency_block_invoke_6()
{
  return &__block_literal_global_27;
}

uint64_t comparatorForFutureDateRecency_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 closestUpComingDate];
  double v7 = v6;
  [v5 closestUpComingDate];
  if (v7 <= v8)
  {
    [v4 closestUpComingDate];
    double v11 = v10;
    [v5 closestUpComingDate];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void sub_1BDB99284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getFilteredSuggestionResults(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v15;
LABEL_5:
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        if ((a2 & 0x8000000000000000) == 0 && v9 + v11 >= a2) {
          break;
        }
        objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v14 + 1) + 8 * v11++), (void)v14);
        if (v8 == v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          uint64_t v9 = v12;
          if (v8) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

void __getFeaturesForSuggestionResult_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  id v3 = (void *)getFeaturesForSuggestionResult_sFeatureClasses;
  getFeaturesForSuggestionResult_sFeatureClasses = v2;
}

uint64_t assetIsValid(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Canned"] & 1) != 0
    || ([v1 isEqualToString:@"Default"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"Experimental"];
  }

  return v2;
}

uint64_t getAssetTypeForName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Canned"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Default"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Experimental"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = -1;
  }

  return v2;
}

id SSDefaultsGetResources()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)sSRResources;
  if (!sSRResources)
  {
    id v1 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v2 = [v1 processName];

    if (v2 && [v2 length])
    {
      uint64_t v8 = @"SRResourcesOwner";
      v9[0] = v2;
      id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
    else
    {
      id v3 = 0;
    }
    uint64_t v4 = [MEMORY[0x1E4FA5DB8] sharedResourcesManager];
    uint64_t v5 = [v4 resourcesForClient:@"Spotlight" options:v3];
    uint64_t v6 = (void *)sSRResources;
    sSRResources = v5;

    uint64_t v0 = (void *)sSRResources;
  }
  return v0;
}

void SSDefaultsSetResources(id obj)
{
}

void SSDefaultsLogForTrigger(void *a1, uint64_t a2)
{
  id v3 = a1;
  SSDefaultsGetResources();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 logForTrigger:v3 queryID:a2];
}

id SSDefaultsGetAssetPath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SSDefaultsGetResources();
  id v3 = [v2 filePathArrayForKey:@"SpotlightServices"];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__5;
  long long v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __SSDefaultsGetAssetPath_block_invoke;
  v7[3] = &unk_1E634D100;
  id v4 = v1;
  id v8 = v4;
  uint64_t v9 = &v10;
  [v3 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1BDBA0364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __SSDefaultsGetAssetPath_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 hasSuffix:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t SSDefaultsSetBullseyeForTesting(uint64_t result)
{
  state_enabled_bullseye_testing = result;
  return result;
}

BOOL SSDefaultsGetState(unint64_t a1)
{
  if (state_enabled_bullseye_testing) {
    return 1;
  }
  if (a1 > 6) {
    return 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SSDefaultsGetState_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (state_once_tokens[a1] != -1)
  {
    unint64_t v2 = a1;
    dispatch_once(&state_once_tokens[a1], block);
    a1 = v2;
  }
  return state_enabled_values[a1] != 0;
}

uint64_t __SSDefaultsGetState_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  char v2 = 0;
  id v3 = @"SPBullseyeFilterLocalSuggestions";
  switch(*(void *)(result + 32))
  {
    case 0:
      char v2 = 0;
      id v3 = @"SPBullseyeResultNoiseReduction";
      goto LABEL_8;
    case 1:
      char v2 = 0;
      id v3 = @"SPUIBullseyeSuggestions";
      goto LABEL_8;
    case 2:
      char v2 = 0;
      id v3 = @"SPSearchEnableBullseyeRanking";
      goto LABEL_8;
    case 3:
      id v3 = @"SPBullseyeAllowDictionaryTopResult";
      goto LABEL_7;
    case 4:
      goto LABEL_8;
    case 6:
      id v3 = @"SPUIBullseyeShowDebugLocalSuggestions";
LABEL_7:
      char v2 = 1;
LABEL_8:
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
      id v5 = [v4 objectForKey:v3];

      if ((v2 & 1) == 0 && !v5
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 BOOLValue])
      {
        state_enabled_values[*(void *)(v1 + 32)] = 1;
      }
      uint64_t result = MEMORY[0x1F41817F8]();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SSEnableLocalDetailText()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"LocalDetailText"];

  return v1;
}

uint64_t SSEnableSpotlightKnowledge()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"EnableSpotlightKnowledge"];

  return v1;
}

uint64_t SSPreferLocalResultsOnLocalEngagment()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"PreferLocalResultsOnEngagment"];

  return v1;
}

uint64_t SSCreateAsTypedSuggestion()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"CreateAsTypedSuggestion"];

  return v1;
}

uint64_t SSShowSearchInApps()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"ShowSearchInApps"];

  return v1;
}

uint64_t SSShowMusicRec()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"MusicRecTest"];

  return v1;
}

uint64_t SSDisplayLateServerSuggestions()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"DisplayLateServerSuggestions"];

  return v1;
}

uint64_t SSIgnoreMaxCountForSingleSuggestionsType()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 BOOLeanForKey:@"IgnoreMaxCountForSingleSuggestionsType"];

  return v1;
}

uint64_t SSMaxLocalSuggestionCount()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 longForKey:@"MaxSuggestionCount"];

  return v1;
}

uint64_t SSMaxServerSuggestionCount()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 longForKey:@"MaxServerSuggestionCount"];

  return v1;
}

uint64_t SSMaxTotalSuggestions()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 longForKey:@"MaxTotalSuggestions"];

  return v1;
}

uint64_t SSMaxSectionsBelowSuggestions()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 longForKey:@"MaxSectionsBelowSuggestions"];

  return v1;
}

uint64_t SSLocalDisplayPosition()
{
  uint64_t v0 = SSDefaultsGetResources();
  uint64_t v1 = [v0 longForKey:@"LocalDisplayPosition"];

  return v1;
}

float SSMinTopHitScore()
{
  uint64_t v0 = SSDefaultsGetResources();
  [v0 doubleForKey:@"MinTopHitScore"];
  float v2 = v1;

  return v2;
}

float SSMinSpellCorrectedAppTopHitScore()
{
  uint64_t v0 = SSDefaultsGetResources();
  [v0 doubleForKey:@"MinSpellCorrectedAppTopHitScore"];
  float v2 = v1;

  return v2;
}

double SSLocalSuggestionThreshold()
{
  uint64_t v0 = SSDefaultsGetResources();
  [v0 doubleForKey:@"LocalSuggestionThreshold"];
  double v2 = v1;

  return v2;
}

double SSServerSuggestionThreshold()
{
  uint64_t v0 = SSDefaultsGetResources();
  [v0 doubleForKey:@"ServerSuggestionThreshold"];
  double v2 = v1;

  return v2;
}

BOOL SSEnableSpotlightTopHitPersonalizedRanking()
{
  if (SSEnableSpotlightTopHitPersonalizedRanking_onceToken != -1) {
    dispatch_once(&SSEnableSpotlightTopHitPersonalizedRanking_onceToken, &__block_literal_global_28);
  }
  if (!SSEnableSpotlightTopHitPersonalizedRanking_expirationDate
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0],
        uint64_t v0 = objc_claimAutoreleasedReturnValue(),
        uint64_t v1 = [v0 compare:SSEnableSpotlightTopHitPersonalizedRanking_expirationDate],
        v0,
        v1 == 1))
  {
    double v2 = SSDefaultsGetResources();
    id v3 = v2;
    if (v2) {
      char v4 = [v2 BOOLeanForKey:@"EnableSpotlightTopHitPersonalizedRanking"];
    }
    else {
      char v4 = 1;
    }
    SSEnableSpotlightTopHitPersonalizedRanking_runtimeEnabled = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    uint64_t v6 = (void *)SSEnableSpotlightTopHitPersonalizedRanking_expirationDate;
    SSEnableSpotlightTopHitPersonalizedRanking_expirationDate = v5;
  }
  if (SSEnableSpotlightTopHitPersonalizedRanking_featureEnabled) {
    BOOL v7 = SSEnableSpotlightTopHitPersonalizedRanking_runtimeEnabled == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7;
}

uint64_t __SSEnableSpotlightTopHitPersonalizedRanking_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSpotlightTopHitPersonalizedRanking_featureEnabled = result;
  return result;
}

uint64_t SSEnableSpotlightPersonalizedRanking2024()
{
  if (testingDefaults
    && [(id)testingDefaults BOOLForKey:@"PersonalizedRanking2024Override"])
  {
    uint64_t v0 = (void *)testingDefaults;
    return [v0 BOOLForKey:@"PersonalizedRanking2024Enabled"];
  }
  else
  {
    if (SSEnableSpotlightPersonalizedRanking2024_onceToken != -1) {
      dispatch_once(&SSEnableSpotlightPersonalizedRanking2024_onceToken, &__block_literal_global_110_0);
    }
    return SSEnableSpotlightPersonalizedRanking2024_enabled;
  }
}

uint64_t __SSEnableSpotlightPersonalizedRanking2024_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSpotlightPersonalizedRanking2024_enabled = result;
  return result;
}

uint64_t SSEnableSearchToolCleanSlate(unsigned int a1)
{
  if (SSEnableSearchToolCleanSlate_onceToken != -1) {
    dispatch_once(&SSEnableSearchToolCleanSlate_onceToken, &__block_literal_global_113);
  }
  if (SSEnableSearchToolCleanSlate_enabled) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t __SSEnableSearchToolCleanSlate_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSearchToolCleanSlate_enabled = result;
  return result;
}

uint64_t SSEnableSpotlightIntentModeling()
{
  if (testingDefaults
    && [(id)testingDefaults BOOLForKey:@"SpotlightIntentModelingOverride"])
  {
    uint64_t v0 = (void *)testingDefaults;
    return [v0 BOOLForKey:@"SpotlightIntentModelingEnabled"];
  }
  else
  {
    if (SSEnableSpotlightIntentModeling_onceToken != -1) {
      dispatch_once(&SSEnableSpotlightIntentModeling_onceToken, &__block_literal_global_122);
    }
    return SSEnableSpotlightIntentModeling_enabled;
  }
}

uint64_t __SSEnableSpotlightIntentModeling_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSpotlightIntentModeling_enabled = result;
  return result;
}

BOOL SSEnableSpotlightFullPageRanking()
{
  if (SSEnableSpotlightFullPageRanking_onceToken != -1) {
    dispatch_once(&SSEnableSpotlightFullPageRanking_onceToken, &__block_literal_global_125);
  }
  if (!SSEnableSpotlightFullPageRanking_expirationDate
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0],
        uint64_t v0 = objc_claimAutoreleasedReturnValue(),
        uint64_t v1 = [v0 compare:SSEnableSpotlightFullPageRanking_expirationDate],
        v0,
        v1 == 1))
  {
    double v2 = SSDefaultsGetResources();
    id v3 = v2;
    if (v2) {
      char v4 = [v2 BOOLeanForKey:@"SpotlightFullPageRankingDisabled"] ^ 1;
    }
    else {
      char v4 = 1;
    }
    SSEnableSpotlightFullPageRanking_runtimeEnabled = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    uint64_t v6 = (void *)SSEnableSpotlightFullPageRanking_expirationDate;
    SSEnableSpotlightFullPageRanking_expirationDate = v5;
  }
  if (SSEnableSpotlightFullPageRanking_featureEnabled) {
    BOOL v7 = SSEnableSpotlightFullPageRanking_runtimeEnabled == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7;
}

uint64_t __SSEnableSpotlightFullPageRanking_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSpotlightFullPageRanking_featureEnabled = result;
  return result;
}

uint64_t SSEnableTextSemanticSearchCalibration()
{
  if (SSEnableTextSemanticSearchCalibration_onceToken != -1) {
    dispatch_once(&SSEnableTextSemanticSearchCalibration_onceToken, &__block_literal_global_131_0);
  }
  return SSEnableTextSemanticSearchCalibration_enabled;
}

uint64_t __SSEnableTextSemanticSearchCalibration_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableTextSemanticSearchCalibration_enabled = result;
  return result;
}

uint64_t SSEnableSearchToolAbsoluteThresholding()
{
  if (SSEnableSearchToolAbsoluteThresholding_onceToken != -1) {
    dispatch_once(&SSEnableSearchToolAbsoluteThresholding_onceToken, &__block_literal_global_134);
  }
  return SSEnableSearchToolAbsoluteThresholding_enabled;
}

uint64_t __SSEnableSearchToolAbsoluteThresholding_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableSearchToolAbsoluteThresholding_enabled = result;
  return result;
}

BOOL SSEnableAppSearchV2()
{
  if (SSEnableAppSearchV2_onceToken != -1) {
    dispatch_once(&SSEnableAppSearchV2_onceToken, &__block_literal_global_137);
  }
  if (!SSEnableAppSearchV2_expirationDate
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0],
        uint64_t v0 = objc_claimAutoreleasedReturnValue(),
        uint64_t v1 = [v0 compare:SSEnableAppSearchV2_expirationDate],
        v0,
        v1 == 1))
  {
    double v2 = SSDefaultsGetResources();
    id v3 = v2;
    if (v2) {
      char v4 = [v2 BOOLeanForKey:@"AppSearchV2"];
    }
    else {
      char v4 = 1;
    }
    SSEnableAppSearchV2_runtimeEnabled = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    uint64_t v6 = (void *)SSEnableAppSearchV2_expirationDate;
    SSEnableAppSearchV2_expirationDate = v5;
  }
  if (SSEnableAppSearchV2_featureEnabled) {
    BOOL v7 = SSEnableAppSearchV2_runtimeEnabled == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7;
}

uint64_t __SSEnableAppSearchV2_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SSEnableAppSearchV2_featureEnabled = result;
  return result;
}

uint64_t SSEnableSpotlightPersonalizedRankingFeedbackLogging()
{
  if (!SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0],
        uint64_t v0 = objc_claimAutoreleasedReturnValue(),
        uint64_t v1 = [v0 compare:SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate],
        v0,
        v1 == 1))
  {
    double v2 = SSDefaultsGetResources();
    id v3 = v2;
    if (v2) {
      char v4 = [v2 BOOLeanForKey:@"EnableSpotlightPersonalizedRankingFeedbackLogging"];
    }
    else {
      char v4 = 1;
    }
    SSEnableSpotlightPersonalizedRankingFeedbackLogging_enabled = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    uint64_t v6 = (void *)SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate;
    SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate = v5;
  }
  return SSEnableSpotlightPersonalizedRankingFeedbackLogging_enabled;
}

float SSMinFileTopHitScore()
{
  uint64_t v0 = +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, @"com.apple.DocumentsApp");
  uint64_t v1 = v0;
  if (v0)
  {
    double v2 = [v0 firstObject];
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 2.22507386e-308;
  }
  if (SSMinFileTopHitScore_onceToken != -1) {
    dispatch_once(&SSMinFileTopHitScore_onceToken, &__block_literal_global_147);
  }
  if (v4 == 2.22507386e-308)
  {
    int v5 = SSMinFileTopHitScore_sMinFileTopHitScore;
  }
  else
  {
    *(float *)&int v5 = v4;
    SSMinFileTopHitScore_sMinFileTopHitScore = v5;
  }

  return *(float *)&v5;
}

void __SSMinFileTopHitScore_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPBullseyeMinFileTopHitScore"];

  uint64_t v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v1 = v3;
  }
  else
  {
    float v2 = -1.0;
  }
  SSMinFileTopHitScore_sMinFileTopHitScore = LODWORD(v2);
}

float SSMinRemindersTopHitScore()
{
  uint64_t v0 = +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, @"com.apple.reminders");
  uint64_t v1 = v0;
  if (v0)
  {
    float v2 = [v0 firstObject];
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = -1.79769313e308;
  }
  if (SSMinRemindersTopHitScore_onceToken != -1) {
    dispatch_once(&SSMinRemindersTopHitScore_onceToken, &__block_literal_global_152);
  }
  if (v4 == -1.79769313e308)
  {
    int v5 = SSMinRemindersTopHitScore_sMinRemindersTopHitScore;
  }
  else
  {
    *(float *)&int v5 = v4;
    SSMinRemindersTopHitScore_sMinRemindersTopHitScore = v5;
  }

  return *(float *)&v5;
}

void __SSMinRemindersTopHitScore_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPBullseyeMinRemindersTopHitScore"];

  uint64_t v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v1 = v3;
  }
  else
  {
    int v2 = -1085485875;
  }
  SSMinRemindersTopHitScore_sMinRemindersTopHitScore = v2;
}

float SSMinNotesTopHitScore()
{
  uint64_t v0 = +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, @"com.apple.mobilenotes");
  uint64_t v1 = v0;
  if (v0)
  {
    int v2 = [v0 firstObject];
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = -1.79769313e308;
  }
  if (SSMinNotesTopHitScore_onceToken != -1) {
    dispatch_once(&SSMinNotesTopHitScore_onceToken, &__block_literal_global_157);
  }
  if (v4 == -1.79769313e308)
  {
    int v5 = SSMinNotesTopHitScore_sMinNotesTopHitScore;
  }
  else
  {
    *(float *)&int v5 = v4;
    SSMinNotesTopHitScore_sMinNotesTopHitScore = v5;
  }

  return *(float *)&v5;
}

void __SSMinNotesTopHitScore_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPBullseyeMinNotesTopHitScore"];

  uint64_t v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v1 = v3;
  }
  else
  {
    float v2 = -1.0;
  }
  SSMinNotesTopHitScore_sMinNotesTopHitScore = LODWORD(v2);
}

float SSMinContactsTopHitScore()
{
  uint64_t v0 = +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, @"com.apple.MobileAddressBook");
  uint64_t v1 = v0;
  if (v0)
  {
    float v2 = [v0 firstObject];
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = -1.79769313e308;
  }
  if (SSMinContactsTopHitScore_onceToken != -1) {
    dispatch_once(&SSMinContactsTopHitScore_onceToken, &__block_literal_global_162);
  }
  if (v4 == -1.79769313e308)
  {
    int v5 = SSMinContactsTopHitScore_sMinContactsTopHitScore;
  }
  else
  {
    *(float *)&int v5 = v4;
    SSMinContactsTopHitScore_sMinContactsTopHitScore = v5;
  }

  return *(float *)&v5;
}

void __SSMinContactsTopHitScore_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPBullseyeMinContactsTopHitScore"];

  uint64_t v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v1 = v3;
  }
  else
  {
    int v2 = -1102263091;
  }
  SSMinContactsTopHitScore_sMinContactsTopHitScore = v2;
}

float SSMinSMSTopHitScore()
{
  uint64_t v0 = +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, @"com.apple.MobileSMS");
  uint64_t v1 = v0;
  if (v0)
  {
    int v2 = [v0 firstObject];
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = -1.79769313e308;
  }
  if (SSMinSMSTopHitScore_onceToken != -1) {
    dispatch_once(&SSMinSMSTopHitScore_onceToken, &__block_literal_global_167);
  }
  if (v4 == -1.79769313e308)
  {
    int v5 = SSMinSMSTopHitScore_sMinSMSTopHitScore;
  }
  else
  {
    *(float *)&int v5 = v4;
    SSMinSMSTopHitScore_sMinSMSTopHitScore = v5;
  }

  return *(float *)&v5;
}

void __SSMinSMSTopHitScore_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  id v3 = [v0 objectForKey:@"SPBullseyeMinSMSTopHitScore"];

  uint64_t v1 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v1 = v3;
  }
  else
  {
    int v2 = -1071225242;
  }
  SSMinSMSTopHitScore_sMinSMSTopHitScore = v2;
}

BOOL SSDemoteNonExactMatchBundle()
{
  uint64_t v0 = +[SSRankingManager getDemoteNonExactMatchBundle]();
  uint64_t v1 = v0;
  if (v0)
  {
    int v2 = [v0 firstObject];
    [v2 floatValue];
    float v4 = v3;
  }
  else
  {
    float v4 = 1.0;
  }
  float v5 = *(float *)&SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle;
  if (v4 != *(float *)&SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle)
  {
    SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle = LODWORD(v4);
    float v5 = v4;
  }
  BOOL v6 = v5 == 1.0;

  return v6;
}

void SSInitNSUserDefaultsForTesting()
{
  if (SSInitNSUserDefaultsForTesting_onceToken != -1) {
    dispatch_once(&SSInitNSUserDefaultsForTesting_onceToken, &__block_literal_global_172);
  }
}

uint64_t __SSInitNSUserDefaultsForTesting_block_invoke()
{
  testingDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlight.defaults.testing"];
  return MEMORY[0x1F41817F8]();
}

char *PRSModelManagerAssociatedObjectKeyForType(uint64_t a1)
{
  return off_1E634D120[a1];
}

void sub_1BDBA38FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDBA399C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDBA3BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDBA4D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

float sMaxPicker_block_invoke(float result, float a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

float sMinPicker_block_invoke_2(float result, float a2)
{
  if (result >= a2) {
    return a2;
  }
  return result;
}

id lowercase_keys(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKey:", v8, (void)v12);
        uint64_t v10 = [v8 lowercaseString];
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

id PRSDirectivesManagerDescriptorsForModelInputScore()
{
  v2[47] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kMDItemUserIsSender";
  v2[1] = @"kMDItemContentCreationRecent";
  v2[2] = @"kMDItemEscapedWord";
  v2[3] = @"kMDItemCreationDateThisYear";
  v2[4] = @"kMDItemLastUsedDateThisYear";
  v2[5] = @"kMDItemContentCreationThisMonth";
  v2[6] = @"kMDItemLastUsedDateThisMonth";
  v2[7] = @"kMDItemContentCreationThisWeek";
  void v2[8] = @"kMDItemLastUsedDateThisWeek";
  v2[9] = @"kMDItemEventTodayToNextYear";
  v2[10] = @"kMDItemEventLastMonthToToday";
  v2[11] = @"kMDItemEventTodayToNextMonth";
  v2[12] = @"kMDItemEventTodayToNextWeek";
  v2[13] = @"kMDItemEventTodayToLastWeek";
  v2[14] = @"kMDItemEventYesterdayToToday";
  v2[15] = @"kMDItemEventToday";
  v2[16] = @"kMDItemTextContentTokenizedMatch";
  v2[17] = @"kMDItemAuthorsOrRecipientsTokenizedPrefixMatch";
  v2[18] = @"kMDItemDescriptionTokenizedPrefixMatch";
  v2[19] = @"kMDItemAlbumTokenizedPrefixMatch";
  v2[20] = @"kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch";
  v2[21] = @"kMDItemDescriptionPrefixWordMatch";
  v2[22] = @"kMDItemAlbumPrefixWordMatch";
  v2[23] = @"kMDItemAuthorsOrRecipientsPrefixWordMatch";
  v2[24] = @"kMDItemDescriptionExactPrefixMatch";
  v2[25] = @"kMDItemAlbumNonTokenizedPrefixMatch";
  v2[26] = @"kMDItemAuthorsOrRecipientsExactMatch";
  v2[27] = @"kMDItemDescriptionNonTokenizedWordMatch";
  v2[28] = @"kMDItemAlbumNonTokenizedWordMatch";
  v2[29] = @"kMDItemUserActivity";
  v2[30] = @"kMDItemAlternateNameNonTokenizedWordMatch";
  v2[31] = @"kMDItemAlternateNamePrefixWordMatch";
  v2[32] = @"kMDItemAlternateNameExactMatch";
  v2[33] = @"kMDItemShortcutRecent";
  v2[34] = @"kMDItemDueDateInLastOneToNextTwentyFourHours";
  v2[35] = @"kMDItemDueDateInLastOneToNextOneHour";
  v2[36] = @"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch";
  v2[37] = @"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch";
  v2[38] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch";
  v2[39] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch";
  v2[40] = @"kMDItemDisplayNameOrSubjectOrTitleExactMatch";
  v2[41] = @"kMDItemSpecialCondition1";
  v2[42] = @"kMDItemSpecialCondition2";
  v2[43] = @"kMDItemSpecialCondition3";
  v2[44] = @"kMDItemSpecialCondition4";
  v2[45] = @"kMDItemSpecialCondition5";
  v2[46] = @"kMDItemShortcutWithinBagParamValue";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:47];
  return v0;
}

uint64_t getBinForValue(uint64_t a1, uint64_t a2, unint64_t a3, float a4)
{
  if (*(float *)(a1 + 4 * a2) >= a4) {
    return a2;
  }
  while (a3 != 1)
  {
    unint64_t v4 = a3;
    a3 >>= 1;
    uint64_t v5 = a2 + (v4 >> 1);
    float v6 = *(float *)(a1 + 4 * v5);
    if (v6 <= a4)
    {
      a3 = v4 - a3;
      a2 += v4 >> 1;
      if (v6 >= a4) {
        return v5;
      }
    }
  }
  return a2 + 1;
}

id whiteSpaceCharacterSet()
{
  if (whiteSpaceCharacterSet_onceToken != -1) {
    dispatch_once(&whiteSpaceCharacterSet_onceToken, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)whiteSpaceCharacterSet_sTrimSet;
  return v0;
}

uint64_t __whiteSpaceCharacterSet_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  id v1 = (void *)whiteSpaceCharacterSet_sTrimSet;
  whiteSpaceCharacterSet_sTrimSet = v0;

  int v2 = (void *)whiteSpaceCharacterSet_sTrimSet;
  return objc_msgSend(v2, "addCharactersInRange:", 65532, 0xFFFFLL);
}

id reorderRanges(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1CA48];
  int v2 = [a1 sortedArrayUsingComparator:&__block_literal_global_4];
  id v3 = [v1 arrayWithArray:v2];

  return v3;
}

uint64_t __reorderRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 rangeValue];
  if (v6 > [v5 rangeValue]) {
    goto LABEL_5;
  }
  unint64_t v7 = [v4 rangeValue];
  if (v7 < [v5 rangeValue])
  {
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  [v4 rangeValue];
  unint64_t v10 = v9;
  [v5 rangeValue];
  if (v10 < v11)
  {
LABEL_5:
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  [v4 rangeValue];
  unint64_t v14 = v13;
  [v5 rangeValue];
  if (v14 <= v15) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
LABEL_6:

  return v8;
}

void mergeRanges(void *a1)
{
  id v7 = a1;
  id v1 = [MEMORY[0x1E4F28E60] indexSet];
  if ((unint64_t)[v7 count] >= 2)
  {
    unint64_t v2 = 1;
    do
    {
      id v3 = [v7 objectAtIndexedSubscript:v2 - 1];
      uint64_t v4 = [v3 rangeValue];

      id v5 = [v7 objectAtIndexedSubscript:v2];
      uint64_t v6 = [v5 rangeValue];

      if (v4 == v6) {
        [v1 addIndex:v2];
      }
      ++v2;
    }
    while (v2 < [v7 count]);
  }
  if ([v1 count]) {
    [v7 removeObjectsAtIndexes:v1];
  }
}

id getMatchedRanges(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  uint64_t v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  id v25 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  if ([v3 length])
  {
    id v5 = SSGeneralLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = [v4 queryTerms];
      uint64_t v17 = [v4 queryString];
      double v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "queryID"));
      *(_DWORD *)buf = 138478595;
      id v27 = v3;
      __int16 v28 = 2113;
      uint64_t v29 = v16;
      __int16 v30 = 2113;
      long long v31 = v17;
      __int16 v32 = 2113;
      long long v33 = v18;
      _os_log_debug_impl(&dword_1BDB2A000, v5, OS_LOG_TYPE_DEBUG, "getting matched ranges for string: %{private}@ queryTerms: %{private}@ queryString: %{private}@ queryID: %{private}@", buf, 0x2Au);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __getMatchedRanges_block_invoke;
    v19[3] = &unk_1E634D240;
    v19[4] = &v20;
    [v4 evaluateAttribute:v3 ignoreSubtokens:1 skipTranscriptions:1 withHandler:v19];
    if (![(id)v21[5] count])
    {
      uint64_t v6 = [v4 queryString];
      uint64_t v7 = [v3 localizedStandardRangeOfString:v6];
      uint64_t v9 = v8;

      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v10 = (void *)v21[5];
        unint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, v9);
        [v10 addObject:v11];
      }
    }
    uint64_t v12 = reorderRanges((void *)v21[5]);
    unint64_t v13 = (void *)v21[5];
    v21[5] = v12;

    mergeRanges((void *)v21[5]);
  }
  id v14 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v14;
}

void sub_1BDBAB64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __getMatchedRanges_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

id getFormattedTexts(void *a1, void *a2)
{
  return getFormattedTextsWithHeadTruncation(a1, a2, 1);
}

id getFormattedTextsWithHeadTruncation(void *a1, void *a2, int a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a1;
  id v43 = (id)objc_opt_new();
  uint64_t v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[\t\n]", @" ", 1024, 0, objc_msgSend(v6, "length"));

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v8)
  {
    int v41 = 0;
    unint64_t v9 = 0;
    uint64_t v42 = *(void *)v53;
    int v39 = a3 ^ 1;
    long long v38 = v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "rangeValue", v38);
        unint64_t v13 = v12;
        unint64_t v14 = [v7 length];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v15 = v11 - v9;
          BOOL v16 = v11 == v9 || v15 > v14;
          if (!v16 && v11 <= v14)
          {
            if (((v39 | v41) & 1) == 0 && v15 >= 0xB)
            {
              if ((unint64_t)[v7 length] < 0x15)
              {
                int v41 = 0;
              }
              else
              {
                uint64_t v46 = 0;
                long long v47 = &v46;
                uint64_t v48 = 0x3010000000;
                uint64_t v49 = "";
                uint64_t v50 = 0;
                uint64_t v51 = 0;
                v44[0] = MEMORY[0x1E4F143A8];
                v44[1] = 3221225472;
                v45[0] = __getFormattedTextsWithHeadTruncation_block_invoke;
                v45[1] = &unk_1E634CA78;
                v45[2] = &v46;
                objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", v9, v11 - v9, 1283, v44);
                unint64_t v9 = v47[4];
                unint64_t v15 = v47[5];
                double v18 = [MEMORY[0x1E4F9A0E0] textWithString:@"…"];
                [v43 addObject:v18];

                _Block_object_dispose(&v46, 8);
                int v41 = 1;
              }
            }
            uint64_t v19 = (void *)MEMORY[0x1E4F9A0E0];
            uint64_t v20 = objc_msgSend(v7, "substringWithRange:", v9, v15);
            double v21 = [v19 textWithString:v20];

            [v43 addObject:v21];
          }
        }
        unint64_t v22 = [v7 length];
        unint64_t v9 = v11 + v13;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0 && v13 <= v22 && v9 <= v22)
        {
          id v26 = (void *)MEMORY[0x1E4F9A0E0];
          id v27 = objc_msgSend(v7, "substringWithRange:", v11, v13);
          __int16 v28 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v29 = [v27 stringByTrimmingCharactersInSet:v28];
          __int16 v30 = [v26 textWithString:v29];

          [v30 setIsEmphasized:1];
          [v43 addObject:v30];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  uint64_t v31 = [v7 length];
  if (v9)
  {
    unint64_t v32 = v31;
    unint64_t v33 = [v7 length];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v32 != v9 && v32 - v9 <= v33 && v32 <= v33)
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F9A0E0];
      long long v35 = [v7 substringWithRange:v9];
      long long v36 = [v34 textWithString:v35];

      [v43 addObject:v36];
    }
  }

  return v43;
}

void sub_1BDBABB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void removeMatchedRangesFromStringInTitle(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    id v30 = v10;
    if (removeMatchedRangesFromStringInTitle_onceToken != -1) {
      dispatch_once(&removeMatchedRangesFromStringInTitle_onceToken, &__block_literal_global_10);
    }
    id v31 = v7;
    unint64_t v32 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          unint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v16 = [v15 rangeValue];
          unint64_t v18 = v17;
          unint64_t v19 = [v8 length];
          if (v16 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0 && v18 <= v19 && v16 + v18 <= v19)
          {
            uint64_t v23 = [v15 rangeValue];
            id v25 = objc_msgSend(v8, "substringWithRange:", v23, v24);
            if ([v25 rangeOfCharacterFromSet:removeMatchedRangesFromStringInTitle_symbolsAndPunctuations] != 0x7FFFFFFFFFFFFFFFLL)
            {

              uint64_t v29 = v32;
              goto LABEL_27;
            }
            id v26 = whiteSpaceCharacterSet();
            id v27 = [v25 stringByTrimmingCharactersInSet:v26];
            int v28 = [v9 localizedCaseInsensitiveContainsString:v27];

            if (v28) {
              [v32 addObject:v15];
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v29 = v32;
    [obj removeObjectsInArray:v32];
LABEL_27:

    id v10 = v30;
    id v7 = v31;
  }
}

void __removeMatchedRangesFromStringInTitle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  id v2 = (void *)removeMatchedRangesFromStringInTitle_symbolsAndPunctuations;
  removeMatchedRangesFromStringInTitle_symbolsAndPunctuations = v1;

  id v3 = (void *)removeMatchedRangesFromStringInTitle_symbolsAndPunctuations;
  id v4 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v3 formUnionWithCharacterSet:v4];
}

id formattedTextsForStringWithMatchesFromEvaluator(void *a1, void *a2, void *a3)
{
  return formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(a1, a2, a3, 1);
}

id formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a1;
  char v10 = [v8 containsString:v9];
  uint64_t v11 = [v9 precomposedStringWithCanonicalMapping];

  if (v10)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = getMatchedRanges(v11, v7);
  }
  removeMatchedRangesFromStringInTitle(v12, v11, v8, v7);
  uint64_t v13 = getFormattedTextsWithHeadTruncation(v11, v12, a4);

  return v13;
}

id getHighlightedRichText(void *a1, void *a2, void *a3, int a4)
{
  id v4 = formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(a1, a2, a3, a4);
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    [v5 setFormattedTextPieces:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __getFormattedTextsWithHeadTruncation_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) += a6;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 32) = a5;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) >= 0xAuLL) {
    *a7 = 1;
  }
  return result;
}

double getSpecialThreshold(void *a1, unint64_t a2, unint64_t a3, int a4, double a5)
{
  id v9 = a1;
  char v10 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v9, a2, a3, 0);
  if ([v10 count] <= (unint64_t)a4)
  {
    uint64_t v11 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v9, a2, a3, 1);
    if ([v11 count] > (unint64_t)a4)
    {
      uint64_t v13 = [v11 objectAtIndexedSubscript:a4];
      [v13 doubleValue];
      a5 = v14;
    }
  }
  else
  {
    uint64_t v11 = [v10 objectAtIndexedSubscript:a4];
    [v11 doubleValue];
    a5 = v12;
  }

  return a5;
}

void sub_1BDBB926C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t __57__rankingSceneClassification_updateBoundingBoxOfDetector__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*(unsigned int *)(a3 + 8)];
  id v5 = [*(id *)(a1 + 32) sceneReferenceDictionary];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) sceneReferenceDictionary];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (!v7 || ([v7 boundingBoxRatio], v8 == 0.0))
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v9 = [v7 boundingBox];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBoundingBox:v9];

      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __72__rankingSceneClassification_matchScoreWhenLabelMatched_userQueryToken___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "tokenMatchForMatchInfoToken:");
  if ([v3 type])
  {
    uint64_t v4 = [*(id *)(a1 + 32) exactSceneMatch];
    if ((v4 & 1) != 0 || ![v3 exactMatchAtFirstPosition])
    {
      [*(id *)(a1 + 32) setExactSceneMatch:v4];
    }
    else
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 16) original];
      uint64_t v6 = [v5 length];
      id v7 = [v24 original];
      if (v6 == [v7 length])
      {
        double v8 = [v24 original];
        uint64_t v9 = [v8 length];
        uint64_t v10 = [*(id *)(a1 + 40) original];
        objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v9 == objc_msgSend(v10, "length"));
      }
      else
      {
        [*(id *)(a1 + 32) setExactSceneMatch:0];
      }
    }
    [*(id *)(a1 + 32) boundingBoxRatio];
    if (v11 == 0.0) {
      [*(id *)(a1 + 32) updateBoundingBoxOfDetector];
    }
    double matched = tokenMatchRatio(v24, *(void **)(*(void *)(a1 + 32) + 16));
    [*(id *)(a1 + 32) matchedBoundingBoxScore];
    double v14 = v13;
    [*(id *)(a1 + 32) boundingBoxRatio];
    double v16 = matched * v15;
    if (v14 >= v16) {
      double v16 = v14;
    }
    [*(id *)(a1 + 32) setMatchedBoundingBoxScore:v16];
    [*(id *)(a1 + 32) matchedConfidenceScore];
    double v18 = v17;
    [*(id *)(a1 + 32) confidence];
    double v20 = matched * v19;
    if (v18 >= v20) {
      double v20 = v18;
    }
    [*(id *)(a1 + 32) setMatchedConfidenceScore:v20];
    double v21 = *(void **)(a1 + 32);
    double v22 = 1.0 / (double)(unint64_t)[v21 totalLabels];
    [v21 matchedSceneLabelRatio];
    [v21 setMatchedSceneLabelRatio:v23 + matched * v22];
  }
}

double tokenMatchRatio(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 tokenize];
  id v5 = [v3 tokenize];

  if ([v5 count])
  {
    double v6 = (double)(unint64_t)[v4 count];
    double v7 = v6 / (double)(unint64_t)[v5 count];
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

void __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke(uint64_t a1, void *a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__7;
  void v10[4] = __Block_byref_object_dispose__7;
  id v11 = 0;
  id v11 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 120);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke_2;
  v6[3] = &unk_1E634D398;
  void v6[4] = v3;
  uint64_t v9 = v10;
  id v5 = v11;
  id v7 = v5;
  id v8 = *(id *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v10, 8);
}

void sub_1BDBB9998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v30 = a2;
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  BOOL v4 = v3 > [v30 unsignedLongValue];
  id v5 = v30;
  if (v4)
  {
    double v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectAtIndexedSubscript:", objc_msgSend(v30, "unsignedLongValue"));
    id v7 = [v6 tokenMatchForMatchInfoToken:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    if ([v7 type])
    {
      uint64_t v8 = [*(id *)(a1 + 32) exactSceneMatch];
      if ((v8 & 1) != 0 || ![v7 exactMatchAtFirstPosition])
      {
        [*(id *)(a1 + 32) setExactSceneMatch:v8];
      }
      else
      {
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) tokens];
        uint64_t v10 = [v9 count];
        id v11 = [*(id *)(a1 + 40) tokens];
        if (v10 == [v11 count])
        {
          double v12 = [*(id *)(a1 + 40) tokens];
          uint64_t v13 = [v12 count];
          double v14 = [*(id *)(a1 + 48) tokens];
          objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v13 == objc_msgSend(v14, "count"));
        }
        else
        {
          [*(id *)(a1 + 32) setExactSceneMatch:0];
        }
      }
      [*(id *)(a1 + 32) boundingBoxRatio];
      if (v15 == 0.0) {
        [*(id *)(a1 + 32) updateBoundingBoxOfDetector];
      }
      double v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      double v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectAtIndexedSubscript:", objc_msgSend(v30, "unsignedLongValue"));
      double matched = tokenMatchRatio(v16, v17);

      [*(id *)(a1 + 32) matchedBoundingBoxScore];
      double v20 = v19;
      [*(id *)(a1 + 32) boundingBoxRatio];
      double v22 = matched * v21;
      if (v20 >= v22) {
        double v22 = v20;
      }
      [*(id *)(a1 + 32) setMatchedBoundingBoxScore:v22];
      [*(id *)(a1 + 32) matchedConfidenceScore];
      double v24 = v23;
      [*(id *)(a1 + 32) confidence];
      double v26 = matched * v25;
      if (v24 >= v26) {
        double v26 = v24;
      }
      [*(id *)(a1 + 32) setMatchedConfidenceScore:v26];
      id v27 = *(void **)(a1 + 32);
      double v28 = 1.0 / (double)(unint64_t)[v27 totalSynonyms];
      [v27 matchedSceneSynonymsRatio];
      [v27 setMatchedSceneSynonymsRatio:v29 + matched * v28];
    }

    id v5 = v30;
  }
}

void SSRearrangeDuplicatesInSection(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [v1 bundleIdentifier];
  int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v2);

  if (IsSyndicatedPhotos)
  {
    BOOL v4 = [v1 resultSet];
    id v5 = [v4 array];

    unint64_t v6 = [v5 count];
    if (v6 > [v1 maxInitiallyVisibleResults])
    {
      double v21 = [v1 resultSet];
      id v7 = [v21 array];
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if ([v7 count])
      {
        unint64_t v11 = 0;
        do
        {
          double v12 = [v7 objectAtIndexedSubscript:v11];
          uint64_t v13 = [v12 rankingItem];

          double v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[v13 attributes], 3uLL);
          if (v14)
          {
            if ([v8 containsObject:v14])
            {
              [v9 addIndex:v11];
              double v15 = SSPommesRankerLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                [v13 identifier];
                double v16 = v20 = v10;
                *(_DWORD *)buf = 138412546;
                double v23 = v16;
                __int16 v24 = 2112;
                double v25 = v14;
                _os_log_debug_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEBUG, "[Pommes-L2] found near duplicate photo: %@, container: %@", buf, 0x16u);

                id v10 = v20;
              }
            }
            else
            {
              [v8 addObject:v14];
            }
          }

          ++v11;
        }
        while (v11 < [v7 count]);
      }

      if ([v9 count])
      {
        double v17 = [v1 resultSet];
        double v18 = [v17 objectsAtIndexes:v9];

        double v19 = [v1 resultSet];
        [v19 removeObjectsAtIndexes:v9];
      }
    }
  }
}

void sub_1BDBBBA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

void sub_1BDBBBC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBBBF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __ConvertMatchedKeyToType_block_invoke()
{
  uint64_t v0 = (void *)ConvertMatchedKeyToType_matchedKeyTypeDict;
  ConvertMatchedKeyToType_matchedKeyTypeDict = (uint64_t)&unk_1F1864998;
}

void __getMatchInfoDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (![v4 containsString:@"kMD"])
    {
      double v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      uint64_t v13 = [v4 stringByReplacingOccurrencesOfString:@"*" withString:&stru_1F1824018];
      [v12 addObject:v13];

      goto LABEL_8;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v8 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    goto LABEL_6;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    id v9 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getMatchInfoDictionary_block_invoke_2;
    v14[3] = &unk_1E634D4F8;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = v10;
    uint64_t v16 = v11;
    [v8 enumerateObjectsUsingBlock:v14];

LABEL_6:
  }
LABEL_8:
}

void __getMatchInfoDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  id v6 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"*" withString:&stru_1F1824018];

  [v6 addObject:v5];
}

void __getMatchInfoDictionary_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__7;
  double v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  id v19 = (id)objc_opt_new();
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_491];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __getMatchInfoDictionary_block_invoke_5;
  uint64_t v11 = &unk_1E634D590;
  uint64_t v13 = &v14;
  id v12 = *(id *)(a1 + 32);
  [v7 enumerateObjectsUsingBlock:&v8];
  if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11)) {
    [*(id *)(a1 + 40) setObject:v15[5] forKeyedSubscript:v5];
  }

  _Block_object_dispose(&v14, 8);
}

void sub_1BDBBDF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getMatchInfoDictionary_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 length];
  unint64_t v6 = [v4 length];

  if (v5 < v6) {
    return 1;
  }
  else {
    return -1;
  }
}

void __getMatchInfoDictionary_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"*" withString:&stru_1F1824018];

  unint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __getMatchInfoDictionary_block_invoke_6;
  uint64_t v11 = &unk_1E634D568;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];
  if (*((unsigned char *)v15 + 24) && objc_msgSend(v6, "length", v8, v9, v10, v11))
  {
    id v7 = [[SSTokenizedString alloc] initWithString:v6 locale:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
  _Block_object_dispose(&v14, 8);
}

void sub_1BDBBE144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMatchInfoDictionary_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 original];
  int v7 = [v6 containsString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __computeSceneClassificationSignals_block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v16 = a3;
  if ([v16 sceneMatchedType])
  {
    [v16 matchScoreFromMatchInfo:a1[4] userQueryToken:a1[5]];
    [v16 matchedBoundingBoxScore];
    id v4 = *(double **)(*(void *)(a1[6] + 8) + 24);
    *id v4 = v5 + *v4;
    [v16 matchedConfidenceScore];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 24);
    *(double *)(v6 + _Block_object_dispose(&STACK[0x238], 8) = v7 + *(double *)(v6 + 8);
    [v16 matchedSceneLabelRatio];
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 24);
    *(double *)(v8 + 16) = v9 + *(double *)(v8 + 16);
    [v16 matchedSceneSynonymsRatio];
    uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24);
    *(double *)(v10 + 24) = v11 + *(double *)(v10 + 24);
    char v12 = [v16 exactSceneMatch];
    uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 24);
    double v14 = 1.0;
    if ((v12 & 1) == 0) {
      double v14 = *(double *)(v13 + 32);
    }
    *(double *)(v13 + 32) = v14;
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t json_utf8_string(uint64_t result, unsigned char *a2, unint64_t a3)
{
  if (result)
  {
    id v3 = *(char **)(result + 8);
    if (*(_DWORD *)result == 5)
    {
      uint64_t v4 = *(void *)(result + 16);
      unint64_t v5 = (unint64_t)&a2[a3];
      uint64_t v6 = a2;
      if (v4 >= 1)
      {
        unint64_t v7 = (unint64_t)&v3[v4];
        uint64_t v8 = a2;
        do
        {
          unint64_t v9 = *v3;
          if ((json_char_table[v9] & 0x40) != 0)
          {
            double v14 = (unsigned __int8 *)(v3 + 2);
            uint64_t v15 = v3[1];
            int v16 = json_char_table[v15];
            if ((v16 & 0x10000) != 0)
            {
              if ((v16 & 0x40) != 0)
              {
                do
                {
                  if ((unint64_t)v14 >= v7) {
                    break;
                  }
                  int v19 = *v14++;
                }
                while ((json_char_table[v19] & 0x40) != 0);
              }
              if ((unint64_t)v14 <= v7 - 4)
              {
                uint64_t v20 = 0;
                int v21 = 0;
                do
                {
                  uint64_t v22 = v14[v20];
                  int v23 = (char)v22;
                  int v24 = json_char_table[v22];
                  int v25 = (v23 - 87) | (16 * v21);
                  if ((v24 & 0x10) == 0) {
                    int v25 = v21;
                  }
                  if ((v24 & 8) != 0) {
                    int v25 = (v23 - 55) | (16 * v21);
                  }
                  int v21 = (v23 - 48) | (16 * v21);
                  if ((v24 & 2) == 0) {
                    int v21 = v25;
                  }
                  ++v20;
                }
                while (v20 != 4);
                unsigned int v26 = (unsigned __int16)v21;
                if ((uint64_t)(v7 - (void)v14) < 5)
                {
                  double v11 = v14;
                }
                else
                {
                  double v11 = v14 + 4;
                  if ((unint64_t)(v14 + 5) < v7
                    && (unsigned __int16)((unsigned __int16)v21 >> 11) >= 0x1Bu
                    && (unsigned __int16)((unsigned __int16)v21 >> 10) <= 0x36u
                    && (json_char_table[*v11] & 0x40) != 0
                    && (uint64_t)(v7 - (void)v11) >= 3
                    && (json_char_table[v14[5]] & 0x10000) != 0)
                  {
                    uint64_t v27 = 0;
                    int v28 = 0;
                    double v11 = v14 + 6;
                    do
                    {
                      uint64_t v29 = v11[v27];
                      int v30 = (char)v29;
                      int v31 = json_char_table[v29];
                      int v32 = (v30 - 87) | (16 * v28);
                      if ((v31 & 0x10) == 0) {
                        int v32 = v28;
                      }
                      if ((v31 & 8) != 0) {
                        int v32 = (v30 - 55) | (16 * v28);
                      }
                      int v28 = (v30 - 48) | (16 * v28);
                      if ((v31 & 2) == 0) {
                        int v28 = v32;
                      }
                      ++v27;
                    }
                    while (v27 != 4);
                    int v33 = (unsigned __int16)v28 >> 10;
                    int v34 = ((unsigned __int16)v28 + 9216) | ((v26 << 10) - 56623104);
                    long long v35 = v14 + 12;
                    if ((uint64_t)(v7 - (void)v11) <= 6) {
                      long long v35 = v11;
                    }
                    if (v33 == 55)
                    {
                      double v11 = v35;
                      unsigned int v26 = v34;
                    }
                  }
                }
                if ((int)v26 >= 128)
                {
                  if (v26 >= 0x800)
                  {
                    uint64_t v37 = 4 * (v26 < 0x110000);
                    if (v26 < 0x10000) {
                      uint64_t v37 = 3;
                    }
                    uint64_t v6 = &v8[v37];
                    if ((unint64_t)&v8[v37] < v5)
                    {
                      if (!HIWORD(v26))
                      {
                        v8[2] = v26 & 0x3F | 0x80;
                        v8[1] = (v26 >> 6) & 0x3F | 0x80;
                        unsigned int v26 = (v26 >> 12) | 0xFFFFFFE0;
                        uint64_t v36 = 3;
                        goto LABEL_75;
                      }
                      if (HIWORD(v26) > 0x10u)
                      {
                        uint64_t v36 = 0;
                      }
                      else
                      {
                        v8[3] = v26 & 0x3F | 0x80;
                        v8[2] = (v26 >> 6) & 0x3F | 0x80;
                        v8[1] = (v26 >> 12) & 0x3F | 0x80;
                        unsigned int v26 = (v26 >> 18) | 0xFFFFFFF0;
                        uint64_t v36 = 4;
LABEL_75:
                        *uint64_t v8 = v26;
                      }
                      uint64_t v6 = &v8[v36];
                      goto LABEL_77;
                    }
                  }
                  else
                  {
                    uint64_t v6 = v8 + 2;
                    if ((unint64_t)(v8 + 2) < v5)
                    {
                      v8[1] = v26 & 0x3F | 0x80;
                      unsigned int v26 = (v26 >> 6) | 0xFFFFFFC0;
                      uint64_t v36 = 2;
                      goto LABEL_75;
                    }
                  }
                }
                else
                {
                  uint64_t v6 = v8 + 1;
                  if ((unint64_t)(v8 + 1) < v5)
                  {
                    uint64_t v36 = 1;
                    goto LABEL_75;
                  }
                }
                if (v8 + 1 == (unsigned char *)v5)
                {
LABEL_72:
                  *uint64_t v8 = 0;
                  goto LABEL_77;
                }
              }
              else
              {
                double v11 = v14;
              }
              uint64_t v6 = v8;
            }
            else
            {
              if ((v16 & 0x1E0) != 0)
              {
                HIDWORD(v1_Block_object_dispose(&STACK[0x238], 8) = v15;
                LODWORD(v1_Block_object_dispose(&STACK[0x238], 8) = v15 - 98;
                unsigned int v17 = v18 >> 1;
                if (v17 <= 9 && ((0x345u >> v17) & 1) != 0) {
                  LOBYTE(v15) = byte_1BDC5D900[v17];
                }
              }
              uint64_t v6 = v8 + 1;
              if ((unint64_t)(v8 + 1) >= v5)
              {
                if (v8 + 1 == (unsigned char *)v5)
                {
                  *uint64_t v8 = 0;
                  double v11 = v14;
                  uint64_t v6 = (unsigned char *)v5;
                  goto LABEL_77;
                }
              }
              else
              {
                *uint64_t v8 = v15;
              }
              double v11 = v14;
            }
          }
          else
          {
            uint64_t v10 = utf8_byte_length_noerror_utf8_len_table[v9 >> 4];
            uint64_t v6 = &v8[v10];
            double v11 = (unsigned __int8 *)&v3[v10];
            if ((unint64_t)&v8[v10] < v5 && (unint64_t)v11 <= v7)
            {
              do
              {
                char v13 = *v3++;
                *v8++ = v13;
                --v10;
              }
              while (v10);
              goto LABEL_77;
            }
            if (v8 + 1 == (unsigned char *)v5) {
              goto LABEL_72;
            }
          }
LABEL_77:
          uint64_t v8 = v6;
          id v3 = (char *)v11;
        }
        while ((unint64_t)v11 < v7);
      }
      if ((unint64_t)v6 < v5) {
        unsigned char *v6 = 0;
      }
      uint64_t v40 = v6 - a2;
      return v40 + 1;
    }
    if (v3)
    {
      unint64_t v38 = *(void *)(result + 16);
      if (v38)
      {
        if (v38 >= a3)
        {
          if (!a3)
          {
LABEL_99:
            uint64_t v40 = *(void *)(result + 16);
            return v40 + 1;
          }
          unint64_t v38 = a3 - 1;
          if (a3 != 1)
          {
            int v41 = a2;
            unint64_t v42 = a3 - 1;
            do
            {
              char v43 = *v3++;
              *v41++ = v43;
              --v42;
            }
            while (v42);
          }
        }
        else
        {
          for (uint64_t i = 0; i != v38; ++i)
            a2[i] = v3[i];
        }
        a2[v38] = 0;
        goto LABEL_99;
      }
    }
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  else if (!a2)
  {
    return result;
  }
  if (a3)
  {
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t json_parse()
{
  uint64_t v0 = (char *)MEMORY[0x1F4188790]();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  char v7 = v6;
  uint64_t v8 = v0;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  long long v54 = v0;
  size_t v55 = 0;
  long long v56 = 0;
  uint64_t v57 = v0;
  if ((v1 & 0x8000000000000000) != 0)
  {
    if (!v0)
    {
      unint64_t v9 = 0;
      long long v56 = 0;
      uint64_t v51 = 0;
      long long v52 = 0;
      uint64_t v53 = 0;
      char v50 = 0;
LABEL_236:
      double v11 = v8;
LABEL_237:
      if (v9 == v11) {
        goto LABEL_250;
      }
      while (1)
      {
        uint64_t v47 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v47] & 1) == 0) {
          break;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
      if (v7)
      {
LABEL_250:
        unint64_t v9 = v11;
      }
      else if (v9 != v11)
      {
        goto LABEL_246;
      }
      if (v5) {
        *unint64_t v5 = v9 - v8;
      }
      return 1;
    }
    size_t v1 = strlen(v0);
  }
  unint64_t v9 = &v8[v1];
  size_t v55 = v1;
  long long v56 = &v8[v1];
  uint64_t v51 = 0;
  long long v52 = 0;
  uint64_t v53 = 0;
  char v50 = 0;
  if (!v1) {
    goto LABEL_236;
  }
  uint64_t v49 = v5;
  bzero(v58, 0x1000uLL);
  LODWORD(v10) = 0;
  while (1)
  {
    double v11 = v54;
    char v12 = v56;
    if (v54 >= v56) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = *v54;
    }
    int v14 = json_char_table[v13];
    if ((v14 & 0x20) != 0)
    {
      if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
        goto LABEL_248;
      }
      if ((int)v10 >= 1023)
      {
        double v11 = v54;
        goto LABEL_246;
      }
      goto LABEL_16;
    }
    if ((v14 & 0x202) != 0) {
      break;
    }
    if (v13 == 91)
    {
      if (v56 - v54 >= 1) {
        double v11 = ++v54;
      }
      if ((int)v10 >= 1023) {
        goto LABEL_246;
      }
      uint64_t v10 = (int)v10 + 1;
      v58[v10] = 2;
      (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, 4, 0, &v50);
      if (v11 >= v12) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = *v11;
      }
      if (json_char_table[v41])
      {
        unint64_t v42 = v54;
        while (1)
        {
          if (v11 >= v12)
          {
            if ((json_char_table[0] & 1) == 0)
            {
              long long v54 = v42;
              goto LABEL_151;
            }
          }
          else
          {
            uint64_t v41 = *v11;
            if ((json_char_table[v41] & 1) == 0)
            {
              long long v54 = v42;
              break;
            }
          }
          if (v12 - v11 >= 1) {
            unint64_t v42 = ++v11;
          }
        }
      }
      if (v41 != 93) {
        goto LABEL_151;
      }
      if (v12 - v11 >= 1) {
        long long v54 = v11 + 1;
      }
      v58[v10] = 1;
      unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      uint64_t v19 = v3;
      uint64_t v20 = 5;
      goto LABEL_189;
    }
    if (v13 != 123)
    {
      if ((v14 & 0xE000) == 0)
      {
        if ((v14 & 1) == 0) {
          goto LABEL_246;
        }
        long long v44 = v54;
        while (1)
        {
          uint64_t v45 = v11 >= v56 ? 0 : *v11;
          if ((json_char_table[v45] & 1) == 0) {
            break;
          }
          if (v56 - v11 >= 1) {
            long long v44 = ++v11;
          }
        }
        long long v54 = v44;
        goto LABEL_151;
      }
      long long v52 = v54;
      if (v56 - v54 < 5)
      {
        if (v56 - v54 != 4) {
          goto LABEL_246;
        }
LABEL_200:
        if (*(_DWORD *)v54 == 1702195828)
        {
          LODWORD(v51) = 2;
        }
        else
        {
          if (*(_DWORD *)v54 != 1819047278) {
            goto LABEL_246;
          }
          LODWORD(v51) = 1;
        }
        uint64_t v53 = 4;
        double v11 = v54 + 4;
      }
      else
      {
        if (*(_DWORD *)v54 != 1936482662 || v54[4] != 101) {
          goto LABEL_200;
        }
        LODWORD(v51) = 3;
        uint64_t v53 = 5;
        double v11 = v54 + 5;
      }
      long long v54 = v11;
      if ((int)v10 >= 1023) {
        goto LABEL_246;
      }
LABEL_16:
      uint64_t v10 = (int)v10 + 1;
      v58[v10] = 1;
      unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      unint64_t v18 = &v51;
      uint64_t v19 = v3;
      uint64_t v20 = 6;
LABEL_17:
      v17(v19, v20, v18, &v50);
      goto LABEL_78;
    }
    if (v56 - v54 >= 1) {
      double v11 = ++v54;
    }
    if ((int)v10 >= 1023) {
      goto LABEL_246;
    }
    uint64_t v10 = (int)v10 + 1;
    v58[v10] = 3;
    (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, 1, 0, &v50);
    if (v11 >= v12) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = *v11;
    }
    int v22 = json_char_table[v21];
    if ((v22 & 1) == 0) {
      goto LABEL_179;
    }
    int v23 = v54;
    while (v11 < v12)
    {
      uint64_t v21 = *v11;
      int v22 = json_char_table[v21];
      if ((v22 & 1) == 0)
      {
        long long v54 = v23;
LABEL_179:
        if ((v22 & 0x20) != 0) {
          goto LABEL_218;
        }
        if (v21 != 125) {
          goto LABEL_246;
        }
        if (v12 - v11 >= 1) {
          long long v54 = v11 + 1;
        }
        v58[v10] = 1;
        unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
        uint64_t v19 = v3;
        uint64_t v20 = 3;
LABEL_189:
        unint64_t v18 = 0;
        goto LABEL_17;
      }
LABEL_29:
      if (v12 - v11 >= 1) {
        int v23 = ++v11;
      }
    }
    if (json_char_table[0]) {
      goto LABEL_29;
    }
    long long v54 = v23;
    if ((json_char_table[0] & 0x20) == 0) {
      goto LABEL_246;
    }
LABEL_218:
    if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
      goto LABEL_248;
    }
    double v11 = v54;
    if (v54 >= v56) {
      uint64_t v46 = 0;
    }
    else {
      uint64_t v46 = *v54;
    }
    if (json_char_table[v46])
    {
      unint64_t v38 = v54;
      while (1)
      {
        if (v11 >= v56)
        {
          if ((json_char_table[0] & 1) == 0)
          {
LABEL_258:
            long long v54 = v38;
            goto LABEL_246;
          }
        }
        else
        {
          uint64_t v46 = *v11;
          if ((json_char_table[v46] & 1) == 0)
          {
            long long v54 = v38;
            break;
          }
        }
        if (v56 - v11 >= 1) {
          unint64_t v38 = ++v11;
        }
      }
    }
    if (v46 != 58) {
      goto LABEL_246;
    }
    if (v56 - v11 >= 1) {
      long long v54 = v11 + 1;
    }
LABEL_150:
    v58[v10] = 4;
    (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 2, &v51, &v50);
LABEL_151:
    if (v50) {
      return 0;
    }
  }
  long long v52 = v54;
  LODWORD(v51) = 6;
  if (v54 >= v56) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = *v54;
  }
  if ((json_char_table[v15] & 0x200) != 0)
  {
    int v16 = v54;
    if (v56 - v54 >= 1) {
      int v16 = ++v54;
    }
    if (v16 >= v56) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = *v16;
    }
  }
  else
  {
    int v16 = v54;
  }
  if ((json_char_table[v15] & 4) != 0)
  {
    if (v56 - v16 >= 1) {
      long long v54 = ++v16;
    }
    if (v16 >= v56) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = *v16;
    }
    int v27 = json_char_table[v26];
    if ((v27 & 0x800) != 0)
    {
      if (v56 - v16 <= 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    if ((v27 & 0x1000) == 0)
    {
      if ((v27 & 2) == 0) {
        goto LABEL_74;
      }
      if (v56 - v16 > 0) {
        ++v16;
      }
LABEL_256:
      LODWORD(v51) = 0;
      double v11 = v16;
      goto LABEL_247;
    }
    if (v56 - v16 <= 0) {
      goto LABEL_129;
    }
LABEL_128:
    long long v54 = ++v16;
    goto LABEL_129;
  }
  LOWORD(v24) = json_char_table[0];
  while (2)
  {
    uint64_t v25 = v56 - v16;
LABEL_40:
    if (v16 >= v56)
    {
      if ((json_char_table[0] & 2) == 0) {
        goto LABEL_55;
      }
LABEL_42:
      if (v25 >= 1)
      {
        long long v54 = ++v16;
        continue;
      }
      goto LABEL_40;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0) {
    goto LABEL_42;
  }
  int v24 = json_char_table[*v16];
LABEL_55:
  if ((v24 & 0x1000) != 0)
  {
    if (v25 <= 0)
    {
LABEL_129:
      LODWORD(v51) = 7;
      if (v16 >= v56) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = *v16;
      }
      if (v56 - v16 >= 1 && (json_char_table[v39] & 0x600) != 0) {
LABEL_133:
      }
        long long v54 = ++v16;
      while (1)
      {
        uint64_t v40 = v16 >= v56 ? 0 : *v16;
        if ((json_char_table[v40] & 2) == 0) {
          goto LABEL_74;
        }
        if (v56 - v16 >= 1) {
          goto LABEL_133;
        }
      }
    }
    goto LABEL_128;
  }
  if ((v24 & 0x800) == 0) {
    goto LABEL_74;
  }
  if (v25 >= 1) {
LABEL_60:
  }
    long long v54 = ++v16;
LABEL_61:
  LODWORD(v51) = 7;
  if (v16 >= v56)
  {
    uint64_t v28 = 0;
  }
  else
  {
    long long v54 = v16 + 1;
    uint64_t v28 = *v16++;
  }
  if ((json_char_table[v28] & 2) == 0) {
    goto LABEL_256;
  }
  LOWORD(v29) = json_char_table[0];
  while (2)
  {
    uint64_t v30 = v56 - v16;
LABEL_66:
    if (v16 >= v56)
    {
      if ((json_char_table[0] & 2) == 0) {
        goto LABEL_73;
      }
LABEL_68:
      if (v30 >= 1)
      {
        long long v54 = ++v16;
        continue;
      }
      goto LABEL_66;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0) {
    goto LABEL_68;
  }
  int v29 = json_char_table[*v16];
LABEL_73:
  if ((v29 & 0x1000) != 0)
  {
    if (v30 < 1) {
      goto LABEL_129;
    }
    goto LABEL_128;
  }
LABEL_74:
  if (v16 > v56)
  {
    long long v54 = v56;
    int v16 = v56;
  }
  uint64_t v53 = v16 - v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 6, &v51, &v50);
  if ((int)v10 >= 1023) {
    goto LABEL_256;
  }
  uint64_t v10 = (int)v10 + 1;
  v58[v10] = 1;
LABEL_78:
  unint64_t v9 = v56;
  double v11 = v54;
  while (2)
  {
    if (v11 >= v9) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = *v11;
    }
    if (json_char_table[v31])
    {
      while (1)
      {
        uint64_t v32 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v32] & 1) == 0) {
          break;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
      if (v11 < v9)
      {
        uint64_t v31 = *v11;
        break;
      }
      uint64_t v31 = 0;
LABEL_91:
      int v33 = v58[v10 - 1];
      if (v33 == 2)
      {
        if (v31 != 93) {
          goto LABEL_151;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
        uint64_t v34 = 5;
      }
      else
      {
        if (v33 != 4)
        {
          if (v33) {
            goto LABEL_151;
          }
          unint64_t v5 = v49;
          goto LABEL_237;
        }
        if (v31 != 125) {
          goto LABEL_151;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
        uint64_t v34 = 3;
      }
      v58[v10 - 1] = 1;
      (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, v34, 0, &v50);
      --v10;
      continue;
    }
    break;
  }
  if (v31 != 44) {
    goto LABEL_91;
  }
  uint64_t v10 = (int)v10 - 1;
  int v35 = v58[v10];
  if (v35 == 2)
  {
    if (v9 - v11 >= 1) {
      long long v54 = v11 + 1;
    }
    goto LABEL_151;
  }
  if (v35 == 4)
  {
    if (v9 - v11 >= 1) {
      long long v54 = ++v11;
    }
    v58[v10] = 3;
    if (v11 >= v9) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = *v11;
    }
    if (json_char_table[v36])
    {
      while (1)
      {
        if (v11 >= v9)
        {
          if ((json_char_table[0] & 1) == 0)
          {
            uint64_t v36 = 0;
            break;
          }
        }
        else
        {
          uint64_t v36 = *v11;
          if ((json_char_table[v36] & 1) == 0) {
            break;
          }
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
    }
    if ((json_char_table[v36] & 0x20) != 0)
    {
      if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
        goto LABEL_248;
      }
      double v11 = v54;
      if (v54 >= v56) {
        uint64_t v37 = 0;
      }
      else {
        uint64_t v37 = *v54;
      }
      if (json_char_table[v37])
      {
        unint64_t v38 = v54;
        while (1)
        {
          if (v11 >= v56)
          {
            if ((json_char_table[0] & 1) == 0) {
              goto LABEL_258;
            }
          }
          else
          {
            uint64_t v37 = *v11;
            if ((json_char_table[v37] & 1) == 0)
            {
              long long v54 = v38;
              break;
            }
          }
          if (v56 - v11 >= 1) {
            unint64_t v38 = ++v11;
          }
        }
      }
      if (v37 == 58)
      {
        if (v56 - v11 >= 1) {
          long long v54 = v11 + 1;
        }
        goto LABEL_150;
      }
    }
  }
LABEL_246:
  LODWORD(v51) = 0;
LABEL_247:
  long long v52 = v11;
  uint64_t v53 = 0;
LABEL_248:
  (*(void (**)(uint64_t, void, uint64_t *, char *))(v3 + 16))(v3, 0, &v51, &v50);
  return 0;
}

uint64_t jscon_scan_string(char **a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  unint64_t v5 = *a1;
  if (v4 - *a1 >= 1) {
    *a1 = ++v5;
  }
  *(void *)(a2 + _Block_object_dispose(&STACK[0x238], 8) = v5;
  *(_DWORD *)a2 = 4;
  char v6 = v5;
  while (1)
  {
    char v7 = (char *)memchr(v6, 34, v4 - (unsigned char *)v6);
    if (!v7)
    {
      *(_DWORD *)a2 = 0;
      *(void *)(a2 + _Block_object_dispose(&STACK[0x238], 8) = v6;
      double v11 = (void *)(a2 + 16);
      goto LABEL_29;
    }
    uint64_t v8 = (unsigned __int8 *)v7;
    char v6 = v7 + 1;
    *a1 = v7 + 1;
    if (*(v7 - 1) != 92) {
      break;
    }
    *(_DWORD *)a2 = 5;
    if (*(v7 - 2) == 92)
    {
      uint64_t v9 = 0;
      do
        int v10 = v7[v9-- - 3];
      while (v10 == 92);
      if (((1 - v9) & 1) == 0) {
        break;
      }
    }
  }
  *(void *)(a2 + 16) = v7 - v5;
  double v11 = (void *)(a2 + 16);
  char v12 = (unsigned __int8 *)memchr(v5, 92, v7 - v5);
  for (uint64_t i = 1; v12 && v12 < v8; uint64_t i = 1)
  {
    *(_DWORD *)a2 = 5;
    int v14 = (char *)(v12 + 2);
    int v15 = json_char_table[v12[1]];
    if ((v15 & 0x1E0) == 0)
    {
      if ((v15 & 0x10000) == 0 || v8 - (unsigned __int8 *)v14 < 4) {
        goto LABEL_28;
      }
      if ((json_char_table[v12[2]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 3);
        goto LABEL_28;
      }
      if ((json_char_table[v12[3]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 4);
        goto LABEL_28;
      }
      if ((json_char_table[v12[4]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 5);
LABEL_28:
        *(_DWORD *)a2 = 0;
        *(void *)(a2 + _Block_object_dispose(&STACK[0x238], 8) = v14 - 1;
LABEL_29:
        uint64_t i = 0;
        *double v11 = 0;
        return i;
      }
      int v14 = (char *)(v12 + 6);
      if ((json_char_table[v12[5]] & 0x1A) == 0) {
        goto LABEL_28;
      }
    }
    char v12 = (unsigned __int8 *)memchr(v14, 92, v8 - (unsigned __int8 *)v14);
  }
  return i;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BDBC1BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float timeDecay(void *a1, float a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  float v5 = 0.0;
  if (a2 >= 0.0)
  {
    float v6 = a2 / 1440.0;
    if ((float)(a2 / 1440.0) < 1.0)
    {
      char v7 = [v3 objectAtIndexedSubscript:0];
      [v7 floatValue];
      float v5 = 1.0 - (float)(v6 * (float)(1.0 - v8));
LABEL_20:

      goto LABEL_21;
    }
    if (v6 < 3.0)
    {
      char v7 = [v3 objectAtIndexedSubscript:0];
      [v7 floatValue];
      float v10 = v9;
      double v11 = [v4 objectAtIndexedSubscript:0];
      [v11 floatValue];
      float v13 = v12;
      int v14 = [v4 objectAtIndexedSubscript:1];
      [v14 floatValue];
      float v16 = v13 - v15;
      float v17 = v6 + -1.0;
      float v18 = -0.5;
LABEL_8:
      float v23 = v16 * v18;
LABEL_19:
      float v5 = v10 + (float)(v23 * v17);

      goto LABEL_20;
    }
    if (v6 < 7.0)
    {
      char v7 = [v3 objectAtIndexedSubscript:1];
      [v7 floatValue];
      float v10 = v19;
      double v11 = [v4 objectAtIndexedSubscript:1];
      [v11 floatValue];
      float v21 = v20;
      int v14 = [v4 objectAtIndexedSubscript:2];
      [v14 floatValue];
      float v16 = v21 - v22;
      float v17 = v6 + -3.0;
      float v18 = -0.25;
      goto LABEL_8;
    }
    if (v6 < 30.0)
    {
      char v7 = [v3 objectAtIndexedSubscript:2];
      [v7 floatValue];
      float v10 = v24;
      double v11 = [v4 objectAtIndexedSubscript:2];
      [v11 floatValue];
      float v26 = v25;
      int v14 = [v4 objectAtIndexedSubscript:3];
      [v14 floatValue];
      float v28 = v26 - v27;
      float v17 = v6 + -7.0;
      float v29 = -23.0;
LABEL_18:
      float v23 = v28 / v29;
      goto LABEL_19;
    }
    if (v6 >= 90.0)
    {
      if (v6 < 365.0)
      {
        char v7 = [v3 objectAtIndexedSubscript:4];
        [v7 floatValue];
        float v10 = v35;
        double v11 = [v4 objectAtIndexedSubscript:4];
        [v11 floatValue];
        float v37 = v36;
        int v14 = [v4 objectAtIndexedSubscript:5];
        [v14 floatValue];
        float v28 = v37 - v38;
        float v17 = v6 + -90.0;
        float v29 = -275.0;
        goto LABEL_18;
      }
      if (v6 >= 540.0)
      {
        if (v6 >= 1095.0) {
          goto LABEL_21;
        }
        char v7 = [v3 objectAtIndexedSubscript:6];
        [v7 floatValue];
        float v5 = (float)((float)(1095.0 - v6) * v44) / 555.0;
        goto LABEL_20;
      }
      char v7 = [v3 objectAtIndexedSubscript:5];
      [v7 floatValue];
      float v10 = v39;
      double v11 = [v4 objectAtIndexedSubscript:5];
      [v11 floatValue];
      float v41 = v40;
      int v14 = [v4 objectAtIndexedSubscript:6];
      [v14 floatValue];
      float v28 = v41 - v42;
      float v17 = v6 + -365.0;
      *(float *)&int v34 = -175.0;
    }
    else
    {
      char v7 = [v3 objectAtIndexedSubscript:3];
      [v7 floatValue];
      float v10 = v30;
      double v11 = [v4 objectAtIndexedSubscript:3];
      [v11 floatValue];
      float v32 = v31;
      int v14 = [v4 objectAtIndexedSubscript:4];
      [v14 floatValue];
      float v28 = v32 - v33;
      float v17 = v6 + -30.0;
      *(float *)&int v34 = -60.0;
    }
    float v29 = *(float *)&v34;
    goto LABEL_18;
  }
LABEL_21:

  return v5;
}

void sub_1BDBC714C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1BDBC7728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBC7FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBC82FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBC8E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1BDBC9688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1BDBC99EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBC9CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBCA454(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t chooseTopicality(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4 = _os_feature_enabled_impl() & a3;
  SSEnableSearchToolCleanSlate(a3);
  if (!_os_feature_enabled_impl() || !v4 || (uint64_t result = _os_feature_enabled_impl(), !result))
  {
    uint64_t result = _os_feature_enabled_impl();
    if ((result & v4) != 1) {
      return _os_feature_enabled_impl();
    }
  }
  return result;
}

id extractStringFromArray(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_4:
    id v3 = v2;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 count])
  {
    int v4 = [v1 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v3 = 0;
    if (isKindOfClass)
    {
      id v2 = [v1 objectAtIndexedSubscript:0];
      goto LABEL_4;
    }
  }
  else
  {
LABEL_9:
    id v3 = 0;
  }
LABEL_10:

  return v3;
}

void sub_1BDBCC420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDBDA298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id rankingAttributeNameArray()
{
  if (rankingAttributeNameArray_onceToken != -1) {
    dispatch_once(&rankingAttributeNameArray_onceToken, &__block_literal_global_46);
  }
  uint64_t v0 = (void *)rankingAttributeNameArray_rankingAttributeNames;
  return v0;
}

void __rankingAttributeNameArray_block_invoke()
{
  v34[384] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23020];
  v34[0] = *MEMORY[0x1E4F22C60];
  v34[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F22C30];
  v34[2] = *MEMORY[0x1E4F23670];
  v34[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F22B30];
  v34[4] = *MEMORY[0x1E4F235C0];
  v34[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22CE8];
  v34[6] = *MEMORY[0x1E4F22C58];
  v34[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F230F0];
  v34[8] = *MEMORY[0x1E4F23780];
  v34[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F236A8];
  v34[10] = *MEMORY[0x1E4F22B50];
  v34[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F22C70];
  v34[12] = *MEMORY[0x1E4F23658];
  v34[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F234E0];
  v34[14] = *MEMORY[0x1E4F236A0];
  v34[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F235A8];
  v34[16] = *MEMORY[0x1E4F235A0];
  v34[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F22D38];
  v34[18] = *MEMORY[0x1E4F22D58];
  v34[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F23690];
  v34[20] = *MEMORY[0x1E4F23160];
  v34[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F23648];
  v34[22] = *MEMORY[0x1E4F23698];
  v34[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F22C48];
  v34[24] = *MEMORY[0x1E4F22CB8];
  v34[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F22C68];
  v34[26] = *MEMORY[0x1E4F22A68];
  v34[27] = v13;
  uint64_t v14 = *MEMORY[0x1E4F22D30];
  v34[28] = *MEMORY[0x1E4F22C00];
  v34[29] = v14;
  uint64_t v15 = *MEMORY[0x1E4F22CD0];
  v34[30] = *MEMORY[0x1E4F22A10];
  v34[31] = v15;
  uint64_t v16 = *MEMORY[0x1E4F22AF8];
  v34[32] = *MEMORY[0x1E4F22C38];
  v34[33] = v16;
  uint64_t v17 = *MEMORY[0x1E4F22B18];
  v34[34] = *MEMORY[0x1E4F23638];
  v34[35] = v17;
  uint64_t v18 = *MEMORY[0x1E4F22AD8];
  v34[36] = *MEMORY[0x1E4F22F30];
  v34[37] = v18;
  uint64_t v19 = *MEMORY[0x1E4F23230];
  v34[38] = *MEMORY[0x1E4F22A30];
  v34[39] = v19;
  uint64_t v20 = *MEMORY[0x1E4F235D8];
  v34[40] = *MEMORY[0x1E4F22D48];
  v34[41] = v20;
  uint64_t v21 = *MEMORY[0x1E4F23130];
  v34[42] = *MEMORY[0x1E4F230F8];
  v34[43] = v21;
  uint64_t v22 = *MEMORY[0x1E4F22A28];
  v34[44] = *MEMORY[0x1E4F235D0];
  v34[45] = v22;
  uint64_t v23 = *MEMORY[0x1E4F22B10];
  v34[46] = *MEMORY[0x1E4F23578];
  v34[47] = v23;
  uint64_t v24 = *MEMORY[0x1E4F23078];
  v34[48] = *MEMORY[0x1E4F234A0];
  v34[49] = v24;
  uint64_t v25 = *MEMORY[0x1E4F22F98];
  v34[50] = *MEMORY[0x1E4F22D28];
  v34[51] = v25;
  uint64_t v26 = *MEMORY[0x1E4F22FC0];
  v34[52] = *MEMORY[0x1E4F231E0];
  v34[53] = v26;
  uint64_t v27 = *MEMORY[0x1E4F23448];
  v34[54] = *MEMORY[0x1E4F22CF0];
  v34[55] = v27;
  uint64_t v28 = *MEMORY[0x1E4F22FB8];
  v34[56] = *MEMORY[0x1E4F23188];
  v34[57] = v28;
  uint64_t v29 = *MEMORY[0x1E4F22A78];
  v34[58] = *MEMORY[0x1E4F23100];
  v34[59] = v29;
  uint64_t v30 = *MEMORY[0x1E4F22A70];
  v34[60] = *MEMORY[0x1E4F23680];
  v34[61] = v30;
  uint64_t v31 = *MEMORY[0x1E4F230C8];
  v34[62] = *MEMORY[0x1E4F22A80];
  v34[63] = v31;
  v34[64] = *MEMORY[0x1E4F236E0];
  v34[65] = *MEMORY[0x1E4F23678];
  v34[66] = *MEMORY[0x1E4F22B00];
  v34[67] = *MEMORY[0x1E4F23438];
  v34[68] = *MEMORY[0x1E4F23440];
  v34[69] = *MEMORY[0x1E4F22B78];
  v34[70] = *MEMORY[0x1E4F22B70];
  v34[71] = *MEMORY[0x1E4F230D0];
  v34[72] = *MEMORY[0x1E4F234D0];
  v34[73] = *MEMORY[0x1E4F23190];
  v34[74] = *MEMORY[0x1E4F23058];
  v34[75] = *MEMORY[0x1E4F231C8];
  v34[76] = *MEMORY[0x1E4F23028];
  v34[77] = *MEMORY[0x1E4F23770];
  v34[78] = *MEMORY[0x1E4F23198];
  v34[79] = *MEMORY[0x1E4F233F8];
  v34[80] = *MEMORY[0x1E4F23400];
  v34[81] = *MEMORY[0x1E4F236F0];
  v34[82] = *MEMORY[0x1E4F23580];
  v34[83] = *MEMORY[0x1E4F22FB0];
  v34[84] = *MEMORY[0x1E4F22CC0];
  v34[85] = *MEMORY[0x1E4F22FA8];
  v34[86] = *MEMORY[0x1E4F22BF0];
  v34[87] = *MEMORY[0x1E4F234F8];
  v34[88] = *MEMORY[0x1E4F22D68];
  v34[89] = *MEMORY[0x1E4F22B40];
  v34[90] = *MEMORY[0x1E4F23408];
  v34[91] = *MEMORY[0x1E4F22C28];
  v34[92] = *MEMORY[0x1E4F23610];
  v34[93] = *MEMORY[0x1E4F23200];
  v34[94] = *MEMORY[0x1E4F23208];
  v34[95] = *MEMORY[0x1E4F23210];
  v34[96] = *MEMORY[0x1E4F22C10];
  v34[97] = *MEMORY[0x1E4F23390];
  v34[98] = *MEMORY[0x1E4F23398];
  v34[99] = *MEMORY[0x1E4F233B0];
  v34[100] = *MEMORY[0x1E4F23660];
  v34[101] = *MEMORY[0x1E4F23758];
  v34[102] = *MEMORY[0x1E4F235E8];
  v34[103] = @"kMDQueryResultTextContentDistances";
  v34[104] = *MEMORY[0x1E4F23760];
  v34[105] = *MEMORY[0x1E4F23790];
  v34[106] = *MEMORY[0x1E4F23600];
  v34[107] = *MEMORY[0x1E4F237A8];
  v34[108] = *MEMORY[0x1E4F23468];
  v34[109] = *MEMORY[0x1E4F23478];
  v34[110] = *MEMORY[0x1E4F23488];
  v34[111] = *MEMORY[0x1E4F23470];
  v34[112] = *MEMORY[0x1E4F23480];
  v34[113] = *MEMORY[0x1E4F23490];
  v34[114] = *MEMORY[0x1E4F23450];
  v34[115] = *MEMORY[0x1E4F23458];
  v34[116] = *MEMORY[0x1E4F23460];
  v34[117] = *MEMORY[0x1E4F23380];
  v34[118] = *MEMORY[0x1E4F230A0];
  v34[119] = *MEMORY[0x1E4F22FF0];
  v34[120] = *MEMORY[0x1E4F23290];
  v34[121] = *MEMORY[0x1E4F232E0];
  v34[122] = *MEMORY[0x1E4F23250];
  v34[123] = *MEMORY[0x1E4F23248];
  v34[124] = *MEMORY[0x1E4F232D8];
  v34[125] = *MEMORY[0x1E4F23278];
  v34[126] = *MEMORY[0x1E4F23270];
  v34[127] = *MEMORY[0x1E4F23280];
  v34[128] = *MEMORY[0x1E4F232F8];
  v34[129] = *MEMORY[0x1E4F23340];
  v34[130] = *MEMORY[0x1E4F23338];
  v34[131] = *MEMORY[0x1E4F23368];
  v34[132] = *MEMORY[0x1E4F23330];
  v34[133] = *MEMORY[0x1E4F23350];
  v34[134] = *MEMORY[0x1E4F23370];
  v34[135] = *MEMORY[0x1E4F23298];
  v34[136] = *MEMORY[0x1E4F232C0];
  v34[137] = *MEMORY[0x1E4F232A0];
  v34[138] = *MEMORY[0x1E4F232B0];
  v34[139] = *MEMORY[0x1E4F23378];
  v34[140] = *MEMORY[0x1E4F23260];
  v34[141] = *MEMORY[0x1E4F23318];
  v34[142] = *MEMORY[0x1E4F22A18];
  v34[143] = *MEMORY[0x1E4F22A20];
  v34[144] = *MEMORY[0x1E4F22CA0];
  v34[145] = *MEMORY[0x1E4F22A60];
  v34[146] = *MEMORY[0x1E4F233A0];
  v34[147] = *MEMORY[0x1E4F233A8];
  v34[148] = *MEMORY[0x1E4F23750];
  v34[149] = *MEMORY[0x1E4F234D8];
  v34[150] = *MEMORY[0x1E4F22AB0];
  v34[151] = *MEMORY[0x1E4F22B08];
  v34[152] = *MEMORY[0x1E4F22AB8];
  v34[153] = *MEMORY[0x1E4F22AA8];
  v34[154] = *MEMORY[0x1E4F22AD0];
  v34[155] = *MEMORY[0x1E4F235C8];
  v34[156] = *MEMORY[0x1E4F22C18];
  v34[157] = *MEMORY[0x1E4F22AF0];
  v34[158] = *MEMORY[0x1E4F22AE8];
  v34[159] = *MEMORY[0x1E4F233F0];
  v34[160] = *MEMORY[0x1E4F23798];
  v34[161] = *MEMORY[0x1E4F23310];
  v34[162] = *MEMORY[0x1E4F23528];
  v34[163] = *MEMORY[0x1E4F23508];
  v34[164] = *MEMORY[0x1E4F23530];
  v34[165] = *MEMORY[0x1E4F23540];
  v34[166] = *MEMORY[0x1E4F23548];
  v34[167] = *MEMORY[0x1E4F23518];
  v34[168] = *MEMORY[0x1E4F23538];
  v34[169] = *MEMORY[0x1E4F23510];
  v34[170] = *MEMORY[0x1E4F23550];
  v34[171] = *MEMORY[0x1E4F23568];
  v34[172] = *MEMORY[0x1E4F23560];
  v34[173] = *MEMORY[0x1E4F23520];
  v34[174] = *MEMORY[0x1E4F23558];
  v34[175] = *MEMORY[0x1E4F23268];
  v34[176] = *MEMORY[0x1E4F23620];
  v34[177] = *MEMORY[0x1E4F23628];
  v34[178] = *MEMORY[0x1E4F230B8];
  v34[179] = *MEMORY[0x1E4F22B38];
  v34[180] = *MEMORY[0x1E4F23640];
  v34[181] = *MEMORY[0x1E4F22B68];
  v34[182] = *MEMORY[0x1E4F23328];
  v34[183] = *MEMORY[0x1E4F23358];
  v34[184] = *MEMORY[0x1E4F23308];
  v34[185] = *MEMORY[0x1E4F23348];
  v34[186] = *MEMORY[0x1E4F23360];
  v34[187] = *MEMORY[0x1E4F22D18];
  v34[188] = *MEMORY[0x1E4F22D20];
  v34[189] = *MEMORY[0x1E4F22D10];
  v34[190] = *MEMORY[0x1E4F22D00];
  v34[191] = *MEMORY[0x1E4F22D08];
  v34[192] = *MEMORY[0x1E4F22CF8];
  v34[193] = *MEMORY[0x1E4F23688];
  v34[194] = *MEMORY[0x1E4F22FF8];
  v34[195] = *MEMORY[0x1E4F22BF8];
  v34[196] = *MEMORY[0x1E4F234E8];
  v34[197] = *MEMORY[0x1E4F234F0];
  v34[198] = *MEMORY[0x1E4F232A8];
  v34[199] = *MEMORY[0x1E4F232B8];
  v34[200] = *MEMORY[0x1E4F23180];
  v34[201] = *MEMORY[0x1E4F23178];
  v34[202] = *MEMORY[0x1E4F23170];
  v34[203] = *MEMORY[0x1E4F23168];
  v34[204] = *MEMORY[0x1E4F23220];
  v34[205] = *MEMORY[0x1E4F23218];
  v34[206] = *MEMORY[0x1E4F23228];
  v34[207] = *MEMORY[0x1E4F22E60];
  v34[208] = *MEMORY[0x1E4F22E70];
  v34[209] = *MEMORY[0x1E4F22A50];
  v34[210] = *MEMORY[0x1E4F22BE8];
  v34[211] = *MEMORY[0x1E4F22C90];
  v34[212] = *MEMORY[0x1E4F22C98];
  v34[213] = *MEMORY[0x1E4F22FC8];
  v34[214] = *MEMORY[0x1E4F22FE0];
  v34[215] = *MEMORY[0x1E4F23068];
  v34[216] = *MEMORY[0x1E4F232E8];
  v34[217] = *MEMORY[0x1E4F233C0];
  v34[218] = *MEMORY[0x1E4F233E0];
  v34[219] = *MEMORY[0x1E4F23498];
  v34[220] = *MEMORY[0x1E4F234A8];
  v34[221] = *MEMORY[0x1E4F235B8];
  v34[222] = *MEMORY[0x1E4F235F8];
  v34[223] = *MEMORY[0x1E4F23150];
  v34[224] = *MEMORY[0x1E4F23070];
  v34[225] = *MEMORY[0x1E4F231F0];
  v34[226] = *MEMORY[0x1E4F231F8];
  v34[227] = *MEMORY[0x1E4F23738];
  v34[228] = *MEMORY[0x1E4F23730];
  v34[229] = *MEMORY[0x1E4F22F20];
  v34[230] = *MEMORY[0x1E4F22E50];
  v34[231] = *MEMORY[0x1E4F22E58];
  v34[232] = *MEMORY[0x1E4F22E00];
  v34[233] = *MEMORY[0x1E4F22DE8];
  v34[234] = *MEMORY[0x1E4F22DF0];
  v34[235] = *MEMORY[0x1E4F22DF8];
  v34[236] = *MEMORY[0x1E4F22DD8];
  v34[237] = *MEMORY[0x1E4F22E48];
  v34[238] = *MEMORY[0x1E4F22DA8];
  v34[239] = *MEMORY[0x1E4F22DC0];
  v34[240] = *MEMORY[0x1E4F22E18];
  v34[241] = *MEMORY[0x1E4F22E30];
  v34[242] = *MEMORY[0x1E4F22E08];
  v34[243] = *MEMORY[0x1E4F22D78];
  v34[244] = *MEMORY[0x1E4F22EE0];
  v34[245] = *MEMORY[0x1E4F22DD0];
  v34[246] = *MEMORY[0x1E4F22E40];
  v34[247] = *MEMORY[0x1E4F22DA0];
  v34[248] = *MEMORY[0x1E4F22DB8];
  v34[249] = *MEMORY[0x1E4F22DC8];
  v34[250] = *MEMORY[0x1E4F22DB0];
  v34[251] = *MEMORY[0x1E4F22E10];
  v34[252] = *MEMORY[0x1E4F22E28];
  v34[253] = *MEMORY[0x1E4F22E38];
  v34[254] = *MEMORY[0x1E4F22E20];
  v34[255] = *MEMORY[0x1E4F22E88];
  v34[256] = *MEMORY[0x1E4F22E98];
  v34[257] = *MEMORY[0x1E4F22E90];
  v34[258] = *MEMORY[0x1E4F22E68];
  v34[259] = *MEMORY[0x1E4F22E78];
  v34[260] = *MEMORY[0x1E4F22E80];
  v34[261] = *MEMORY[0x1E4F22EC8];
  v34[262] = *MEMORY[0x1E4F22EA8];
  v34[263] = *MEMORY[0x1E4F22ED0];
  v34[264] = *MEMORY[0x1E4F22EF8];
  v34[265] = *MEMORY[0x1E4F22EF0];
  v34[266] = *MEMORY[0x1E4F22D90];
  v34[267] = *MEMORY[0x1E4F22D88];
  v34[268] = *MEMORY[0x1E4F23138];
  v34[269] = *MEMORY[0x1E4F22A88];
  v34[270] = *MEMORY[0x1E4F22A90];
  v34[271] = *MEMORY[0x1E4F23570];
  v34[272] = *MEMORY[0x1E4F235F0];
  v34[273] = *MEMORY[0x1E4F233E8];
  v34[274] = *MEMORY[0x1E4F22EA0];
  v34[275] = *MEMORY[0x1E4F22F40];
  v34[276] = *MEMORY[0x1E4F22F08];
  v34[277] = *MEMORY[0x1E4F22F10];
  v34[278] = *MEMORY[0x1E4F22BD0];
  v34[279] = *MEMORY[0x1E4F22BD8];
  v34[280] = *MEMORY[0x1E4F22B80];
  v34[281] = *MEMORY[0x1E4F22C20];
  v34[282] = *MEMORY[0x1E4F23118];
  v34[283] = *MEMORY[0x1E4F23110];
  v34[284] = *MEMORY[0x1E4F23108];
  v34[285] = *MEMORY[0x1E4F235B0];
  v34[286] = *MEMORY[0x1E4F22D60];
  v34[287] = *MEMORY[0x1E4F23650];
  v34[288] = *MEMORY[0x1E4F22EE8];
  v34[289] = *MEMORY[0x1E4F22CD8];
  v34[290] = *MEMORY[0x1E4F22DE0];
  v34[291] = *MEMORY[0x1E4F22EB8];
  v34[292] = *MEMORY[0x1E4F22D80];
  v34[293] = *MEMORY[0x1E4F22ED8];
  v34[294] = *MEMORY[0x1E4F22EB0];
  v34[295] = *MEMORY[0x1E4F22EC0];
  v34[296] = *MEMORY[0x1E4F22F18];
  v34[297] = *MEMORY[0x1E4F22F28];
  v34[298] = *MEMORY[0x1E4F22F00];
  v34[299] = *MEMORY[0x1E4F22D98];
  v34[300] = *MEMORY[0x1E4F23120];
  v34[301] = *MEMORY[0x1E4F22B48];
  v34[302] = *MEMORY[0x1E4F22A58];
  v34[303] = *MEMORY[0x1E4F22B60];
  v34[304] = *MEMORY[0x1E4F22BC0];
  v34[305] = *MEMORY[0x1E4F22BE0];
  v34[306] = *MEMORY[0x1E4F22BB8];
  v34[307] = *MEMORY[0x1E4F22BA0];
  v34[308] = *MEMORY[0x1E4F22BA8];
  v34[309] = *MEMORY[0x1E4F22B98];
  v34[310] = *MEMORY[0x1E4F22BB0];
  v34[311] = *MEMORY[0x1E4F22BC8];
  v34[312] = *MEMORY[0x1E4F22B90];
  v34[313] = *MEMORY[0x1E4F22B88];
  v34[314] = *MEMORY[0x1E4F22C88];
  v34[315] = *MEMORY[0x1E4F22C80];
  v34[316] = *MEMORY[0x1E4F22CA8];
  v34[317] = *MEMORY[0x1E4F22D70];
  v34[318] = *MEMORY[0x1E4F23388];
  v34[319] = *MEMORY[0x1E4F23668];
  v34[320] = *MEMORY[0x1E4F234B8];
  v34[321] = *MEMORY[0x1E4F22F58];
  v34[322] = *MEMORY[0x1E4F22F78];
  v34[323] = *MEMORY[0x1E4F22F60];
  v34[324] = *MEMORY[0x1E4F22F80];
  v34[325] = *MEMORY[0x1E4F22F88];
  v34[326] = *MEMORY[0x1E4F22F48];
  v34[327] = *MEMORY[0x1E4F22F68];
  v34[328] = *MEMORY[0x1E4F22F70];
  v34[329] = *MEMORY[0x1E4F22F90];
  v34[330] = *MEMORY[0x1E4F22F50];
  v34[331] = *MEMORY[0x1E4F22CB0];
  v34[332] = *MEMORY[0x1E4F234B0];
  v34[333] = *MEMORY[0x1E4F22C08];
  v34[334] = *MEMORY[0x1E4F23060];
  v34[335] = *MEMORY[0x1E4F22FD0];
  v34[336] = *MEMORY[0x1E4F23158];
  v34[337] = *MEMORY[0x1E4F23418];
  v34[338] = *MEMORY[0x1E4F23428];
  v34[339] = *MEMORY[0x1E4F23420];
  v34[340] = *MEMORY[0x1E4F23430];
  v34[341] = *MEMORY[0x1E4F23038];
  v34[342] = *MEMORY[0x1E4F231A8];
  v34[343] = *MEMORY[0x1E4F22C50];
  v34[344] = *MEMORY[0x1E4F236C0];
  v34[345] = *MEMORY[0x1E4F236B0];
  v34[346] = *MEMORY[0x1E4F236B8];
  v34[347] = *MEMORY[0x1E4F23410];
  v34[348] = *MEMORY[0x1E4F234C8];
  v34[349] = *MEMORY[0x1E4F22A98];
  v34[350] = *MEMORY[0x1E4F23700];
  v34[351] = *MEMORY[0x1E4F236F8];
  v34[352] = *MEMORY[0x1E4F23140];
  v34[353] = *MEMORY[0x1E4F23710];
  v34[354] = *MEMORY[0x1E4F23740];
  v34[355] = *MEMORY[0x1E4F23748];
  v34[356] = *MEMORY[0x1E4F234C0];
  v34[357] = *MEMORY[0x1E4F22AE0];
  v34[358] = *MEMORY[0x1E4F233C8];
  v34[359] = *MEMORY[0x1E4F22A38];
  v34[360] = *MEMORY[0x1E4F23000];
  v34[361] = *MEMORY[0x1E4F236E8];
  v34[362] = *MEMORY[0x1E4F23728];
  v34[363] = *MEMORY[0x1E4F23720];
  v34[364] = *MEMORY[0x1E4F23718];
  v34[365] = *MEMORY[0x1E4F237B0];
  v34[366] = *MEMORY[0x1E4F23048];
  v34[367] = *MEMORY[0x1E4F231B8];
  v34[368] = *MEMORY[0x1E4F23050];
  v34[369] = *MEMORY[0x1E4F231C0];
  v34[370] = *MEMORY[0x1E4F23030];
  v34[371] = *MEMORY[0x1E4F231A0];
  v34[372] = *MEMORY[0x1E4F23040];
  v34[373] = *MEMORY[0x1E4F231B0];
  v34[374] = *MEMORY[0x1E4F236D8];
  v34[375] = *MEMORY[0x1E4F22CC8];
  v34[376] = *MEMORY[0x1E4F22C40];
  v34[377] = *MEMORY[0x1E4F23608];
  v34[378] = *MEMORY[0x1E4F236C8];
  v34[379] = *MEMORY[0x1E4F236D0];
  v34[380] = *MEMORY[0x1E4F22FE8];
  v34[381] = *MEMORY[0x1E4F230D8];
  v34[382] = *MEMORY[0x1E4F22FD8];
  v34[383] = *MEMORY[0x1E4F235E0];
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:384];
  float v33 = (void *)rankingAttributeNameArray_rankingAttributeNames;
  rankingAttributeNameArray_rankingAttributeNames = v32;
}

id rankingPrefetchedAttributesArray()
{
  if (rankingPrefetchedAttributesArray_onceToken != -1) {
    dispatch_once(&rankingPrefetchedAttributesArray_onceToken, &__block_literal_global_15_0);
  }
  uint64_t v0 = (void *)rankingPrefetchedAttributesArray_prefetchedAttributeNames;
  return v0;
}

void __rankingPrefetchedAttributesArray_block_invoke()
{
  rankingAttributeNameArray();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = objc_msgSend(v2, "subarrayWithRange:", 0, 332);
  uint64_t v1 = (void *)rankingPrefetchedAttributesArray_prefetchedAttributeNames;
  rankingPrefetchedAttributesArray_prefetchedAttributeNames = v0;
}

id rankingExtraPrefetchedAttributesArray()
{
  if (rankingExtraPrefetchedAttributesArray_onceToken != -1) {
    dispatch_once(&rankingExtraPrefetchedAttributesArray_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames;
  return v0;
}

void __rankingExtraPrefetchedAttributesArray_block_invoke()
{
  v49[384] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23020];
  v48[0] = *MEMORY[0x1E4F22C60];
  v48[1] = v0;
  v49[0] = &unk_1F1861AA8;
  v49[1] = &unk_1F1861AA8;
  uint64_t v1 = *MEMORY[0x1E4F22C30];
  v48[2] = *MEMORY[0x1E4F23670];
  v48[3] = v1;
  v49[2] = &unk_1F1861AA8;
  v49[3] = &unk_1F1861AA8;
  uint64_t v2 = *MEMORY[0x1E4F22B30];
  v48[4] = *MEMORY[0x1E4F235C0];
  v48[5] = v2;
  v49[4] = &unk_1F1861AA8;
  v49[5] = &unk_1F1861AA8;
  uint64_t v3 = *MEMORY[0x1E4F22CE8];
  v48[6] = *MEMORY[0x1E4F22C58];
  v48[7] = v3;
  v49[6] = &unk_1F1861AA8;
  v49[7] = &unk_1F1861AA8;
  uint64_t v4 = *MEMORY[0x1E4F230F0];
  v48[8] = *MEMORY[0x1E4F23780];
  v48[9] = v4;
  v49[8] = &unk_1F1861AA8;
  v49[9] = &unk_1F1861AA8;
  uint64_t v5 = *MEMORY[0x1E4F236A8];
  v48[10] = *MEMORY[0x1E4F22B50];
  v48[11] = v5;
  v49[10] = &unk_1F1861AA8;
  v49[11] = &unk_1F1861AA8;
  uint64_t v6 = *MEMORY[0x1E4F22C70];
  v48[12] = *MEMORY[0x1E4F23658];
  v48[13] = v6;
  v49[12] = &unk_1F1861AA8;
  v49[13] = &unk_1F1861AA8;
  uint64_t v7 = *MEMORY[0x1E4F234E0];
  v48[14] = *MEMORY[0x1E4F236A0];
  v48[15] = v7;
  v49[14] = &unk_1F1861AA8;
  v49[15] = &unk_1F1861AA8;
  uint64_t v8 = *MEMORY[0x1E4F235A8];
  v48[16] = *MEMORY[0x1E4F235A0];
  v48[17] = v8;
  v49[16] = &unk_1F1861AA8;
  v49[17] = &unk_1F1861AA8;
  uint64_t v9 = *MEMORY[0x1E4F22D38];
  v48[18] = *MEMORY[0x1E4F22D58];
  v48[19] = v9;
  v49[18] = &unk_1F1861AA8;
  v49[19] = &unk_1F1861AA8;
  uint64_t v10 = *MEMORY[0x1E4F23690];
  v48[20] = *MEMORY[0x1E4F23160];
  v48[21] = v10;
  v49[20] = &unk_1F1861AA8;
  v49[21] = &unk_1F1861AA8;
  uint64_t v11 = *MEMORY[0x1E4F23648];
  v48[22] = *MEMORY[0x1E4F23698];
  v48[23] = v11;
  v49[22] = &unk_1F1861AA8;
  v49[23] = &unk_1F1861AA8;
  uint64_t v12 = *MEMORY[0x1E4F22C48];
  v48[24] = *MEMORY[0x1E4F22CB8];
  v48[25] = v12;
  v49[24] = &unk_1F1861AA8;
  v49[25] = &unk_1F1861AA8;
  uint64_t v13 = *MEMORY[0x1E4F22C68];
  v48[26] = *MEMORY[0x1E4F22A68];
  v48[27] = v13;
  v49[26] = &unk_1F1861AA8;
  v49[27] = &unk_1F1861AA8;
  uint64_t v14 = *MEMORY[0x1E4F22D30];
  v48[28] = *MEMORY[0x1E4F22C00];
  v48[29] = v14;
  v49[28] = &unk_1F1861AA8;
  v49[29] = &unk_1F1861AA8;
  uint64_t v15 = *MEMORY[0x1E4F22CD0];
  v48[30] = *MEMORY[0x1E4F22A10];
  v48[31] = v15;
  v49[30] = &unk_1F1861AA8;
  v49[31] = &unk_1F1861AA8;
  uint64_t v16 = *MEMORY[0x1E4F22AF8];
  v48[32] = *MEMORY[0x1E4F22C38];
  v48[33] = v16;
  v49[32] = &unk_1F1861AA8;
  v49[33] = &unk_1F1861AA8;
  uint64_t v17 = *MEMORY[0x1E4F22B18];
  v48[34] = *MEMORY[0x1E4F23638];
  v48[35] = v17;
  v49[34] = &unk_1F1861AA8;
  v49[35] = &unk_1F1861AA8;
  uint64_t v18 = *MEMORY[0x1E4F22AD8];
  v48[36] = *MEMORY[0x1E4F22F30];
  v48[37] = v18;
  v49[36] = &unk_1F1861AA8;
  v49[37] = &unk_1F1861AA8;
  uint64_t v19 = *MEMORY[0x1E4F23230];
  v48[38] = *MEMORY[0x1E4F22A30];
  v48[39] = v19;
  v49[38] = &unk_1F1861AA8;
  v49[39] = &unk_1F1861AA8;
  uint64_t v20 = *MEMORY[0x1E4F235D8];
  v48[40] = *MEMORY[0x1E4F22D48];
  v48[41] = v20;
  v49[40] = &unk_1F1861AA8;
  v49[41] = &unk_1F1861AA8;
  uint64_t v21 = *MEMORY[0x1E4F23130];
  v48[42] = *MEMORY[0x1E4F230F8];
  v48[43] = v21;
  v49[42] = &unk_1F1861AA8;
  v49[43] = &unk_1F1861AA8;
  uint64_t v22 = *MEMORY[0x1E4F22A28];
  v48[44] = *MEMORY[0x1E4F235D0];
  v48[45] = v22;
  v49[44] = &unk_1F1861AA8;
  v49[45] = &unk_1F1861AA8;
  uint64_t v23 = *MEMORY[0x1E4F22B10];
  v48[46] = *MEMORY[0x1E4F23578];
  v48[47] = v23;
  v49[46] = &unk_1F1861AA8;
  v49[47] = &unk_1F1861AA8;
  uint64_t v24 = *MEMORY[0x1E4F23078];
  v48[48] = *MEMORY[0x1E4F234A0];
  v48[49] = v24;
  v49[48] = &unk_1F1861AA8;
  v49[49] = &unk_1F1861AA8;
  uint64_t v25 = *MEMORY[0x1E4F22F98];
  v48[50] = *MEMORY[0x1E4F22D28];
  v48[51] = v25;
  v49[50] = &unk_1F1861AA8;
  v49[51] = &unk_1F1861AA8;
  uint64_t v26 = *MEMORY[0x1E4F22FC0];
  v48[52] = *MEMORY[0x1E4F231E0];
  v48[53] = v26;
  v49[52] = &unk_1F1861AA8;
  v49[53] = &unk_1F1861AA8;
  uint64_t v27 = *MEMORY[0x1E4F23448];
  v48[54] = *MEMORY[0x1E4F22CF0];
  v48[55] = v27;
  v49[54] = &unk_1F1861AA8;
  v49[55] = &unk_1F1861AA8;
  uint64_t v28 = *MEMORY[0x1E4F22FB8];
  v48[56] = *MEMORY[0x1E4F23188];
  v48[57] = v28;
  v49[56] = &unk_1F1861AA8;
  v49[57] = &unk_1F1861AA8;
  uint64_t v29 = *MEMORY[0x1E4F22A78];
  v48[58] = *MEMORY[0x1E4F23100];
  v48[59] = v29;
  v49[58] = &unk_1F1861AA8;
  v49[59] = &unk_1F1861AA8;
  uint64_t v30 = *MEMORY[0x1E4F22A70];
  v48[60] = *MEMORY[0x1E4F23680];
  v48[61] = v30;
  v49[60] = &unk_1F1861AA8;
  v49[61] = &unk_1F1861AA8;
  uint64_t v31 = *MEMORY[0x1E4F230C8];
  v48[62] = *MEMORY[0x1E4F22A80];
  v48[63] = v31;
  v49[62] = &unk_1F1861AA8;
  v49[63] = &unk_1F1861AA8;
  v48[64] = *MEMORY[0x1E4F236E0];
  v49[64] = &unk_1F1861AA8;
  v48[65] = *MEMORY[0x1E4F23678];
  v49[65] = &unk_1F1861AA8;
  v48[66] = *MEMORY[0x1E4F22B00];
  v49[66] = &unk_1F1861AA8;
  v48[67] = *MEMORY[0x1E4F23438];
  v49[67] = &unk_1F1861AA8;
  v48[68] = *MEMORY[0x1E4F23440];
  v49[68] = &unk_1F1861AA8;
  v48[69] = *MEMORY[0x1E4F22B78];
  v49[69] = &unk_1F1861AA8;
  v48[70] = *MEMORY[0x1E4F22B70];
  v49[70] = &unk_1F1861AA8;
  v48[71] = *MEMORY[0x1E4F230D0];
  v49[71] = &unk_1F1861AA8;
  v48[72] = *MEMORY[0x1E4F234D0];
  v49[72] = &unk_1F1861AA8;
  v48[73] = *MEMORY[0x1E4F23190];
  v49[73] = &unk_1F1861AA8;
  v48[74] = *MEMORY[0x1E4F23058];
  v49[74] = &unk_1F1861AA8;
  v48[75] = *MEMORY[0x1E4F231C8];
  v49[75] = &unk_1F1861AA8;
  v48[76] = *MEMORY[0x1E4F23028];
  v49[76] = &unk_1F1861AA8;
  v48[77] = *MEMORY[0x1E4F23770];
  v49[77] = &unk_1F1861AA8;
  v48[78] = *MEMORY[0x1E4F23198];
  v49[78] = &unk_1F1861AA8;
  v48[79] = *MEMORY[0x1E4F233F8];
  v49[79] = &unk_1F1861AA8;
  v48[80] = *MEMORY[0x1E4F23400];
  v49[80] = &unk_1F1861AA8;
  v48[81] = *MEMORY[0x1E4F236F0];
  v48[82] = *MEMORY[0x1E4F23580];
  v48[83] = *MEMORY[0x1E4F22FB0];
  v48[84] = *MEMORY[0x1E4F22CC0];
  v48[85] = *MEMORY[0x1E4F22FA8];
  v48[86] = *MEMORY[0x1E4F22BF0];
  v48[87] = *MEMORY[0x1E4F234F8];
  v48[88] = *MEMORY[0x1E4F22D68];
  v48[89] = *MEMORY[0x1E4F22B40];
  v48[90] = *MEMORY[0x1E4F23408];
  v48[91] = *MEMORY[0x1E4F22C28];
  v48[92] = *MEMORY[0x1E4F23610];
  v48[93] = *MEMORY[0x1E4F23200];
  v48[94] = *MEMORY[0x1E4F23208];
  v48[95] = *MEMORY[0x1E4F23210];
  v48[96] = *MEMORY[0x1E4F22C10];
  v48[97] = *MEMORY[0x1E4F23390];
  v48[98] = *MEMORY[0x1E4F23398];
  v48[99] = *MEMORY[0x1E4F233B0];
  v48[100] = *MEMORY[0x1E4F23660];
  v48[101] = *MEMORY[0x1E4F23758];
  v48[102] = *MEMORY[0x1E4F235E8];
  v49[81] = &unk_1F1861AA8;
  v48[103] = @"kMDQueryResultTextContentDistances";
  v48[104] = *MEMORY[0x1E4F23760];
  v48[105] = *MEMORY[0x1E4F23790];
  v48[106] = *MEMORY[0x1E4F23600];
  v48[107] = *MEMORY[0x1E4F237A8];
  v48[108] = *MEMORY[0x1E4F23468];
  v48[109] = *MEMORY[0x1E4F23478];
  v48[110] = *MEMORY[0x1E4F23488];
  v48[111] = *MEMORY[0x1E4F23470];
  v48[112] = *MEMORY[0x1E4F23480];
  v48[113] = *MEMORY[0x1E4F23490];
  v48[114] = *MEMORY[0x1E4F23450];
  v48[115] = *MEMORY[0x1E4F23458];
  v48[116] = *MEMORY[0x1E4F23460];
  v48[117] = *MEMORY[0x1E4F23380];
  v48[118] = *MEMORY[0x1E4F230A0];
  v48[119] = *MEMORY[0x1E4F22FF0];
  v48[120] = *MEMORY[0x1E4F23290];
  v48[121] = *MEMORY[0x1E4F232E0];
  v48[122] = *MEMORY[0x1E4F23250];
  v48[123] = *MEMORY[0x1E4F23248];
  v48[124] = *MEMORY[0x1E4F232D8];
  v48[125] = *MEMORY[0x1E4F23278];
  v48[127] = *MEMORY[0x1E4F23280];
  v48[130] = *MEMORY[0x1E4F23338];
  v48[133] = *MEMORY[0x1E4F23350];
  v48[136] = *MEMORY[0x1E4F232C0];
  v48[139] = *MEMORY[0x1E4F23378];
  v48[142] = *MEMORY[0x1E4F22A18];
  v48[145] = *MEMORY[0x1E4F22A60];
  v48[148] = *MEMORY[0x1E4F23750];
  v48[151] = *MEMORY[0x1E4F22B08];
  v48[154] = *MEMORY[0x1E4F22AD0];
  v48[157] = *MEMORY[0x1E4F22AF0];
  v48[160] = *MEMORY[0x1E4F23798];
  v48[163] = *MEMORY[0x1E4F23508];
  v48[166] = *MEMORY[0x1E4F23548];
  v48[169] = *MEMORY[0x1E4F23510];
  v48[172] = *MEMORY[0x1E4F23560];
  v48[175] = *MEMORY[0x1E4F23268];
  v48[178] = *MEMORY[0x1E4F230B8];
  v48[181] = *MEMORY[0x1E4F22B68];
  v48[184] = *MEMORY[0x1E4F23308];
  v48[187] = *MEMORY[0x1E4F22D18];
  v48[190] = *MEMORY[0x1E4F22D00];
  v48[193] = *MEMORY[0x1E4F23688];
  v48[196] = *MEMORY[0x1E4F234E8];
  v48[199] = *MEMORY[0x1E4F232B8];
  v48[202] = *MEMORY[0x1E4F23170];
  v48[205] = *MEMORY[0x1E4F23218];
  v48[208] = *MEMORY[0x1E4F22E70];
  v48[211] = *MEMORY[0x1E4F22C90];
  v48[214] = *MEMORY[0x1E4F22FE0];
  v48[217] = *MEMORY[0x1E4F233C0];
  v48[220] = *MEMORY[0x1E4F234A8];
  v48[223] = *MEMORY[0x1E4F23150];
  v48[226] = *MEMORY[0x1E4F231F8];
  v48[229] = *MEMORY[0x1E4F22F20];
  v48[232] = *MEMORY[0x1E4F22E00];
  v48[235] = *MEMORY[0x1E4F22DF8];
  v48[238] = *MEMORY[0x1E4F22DA8];
  v48[241] = *MEMORY[0x1E4F22E30];
  v48[244] = *MEMORY[0x1E4F22EE0];
  v48[247] = *MEMORY[0x1E4F22DA0];
  v48[250] = *MEMORY[0x1E4F22DB0];
  v48[253] = *MEMORY[0x1E4F22E38];
  v49[82] = &unk_1F1861AA8;
  v48[255] = *MEMORY[0x1E4F22E88];
  v49[254] = &unk_1F1861AA8;
  v49[83] = &unk_1F1861AA8;
  v48[254] = *MEMORY[0x1E4F22E20];
  v49[253] = &unk_1F1861AA8;
  v48[252] = *MEMORY[0x1E4F22E28];
  v49[251] = &unk_1F1861AA8;
  v49[252] = &unk_1F1861AA8;
  v49[84] = &unk_1F1861AA8;
  v48[251] = *MEMORY[0x1E4F22E10];
  v49[250] = &unk_1F1861AA8;
  v48[249] = *MEMORY[0x1E4F22DC8];
  v49[248] = &unk_1F1861AA8;
  v49[249] = &unk_1F1861AA8;
  v49[85] = &unk_1F1861AA8;
  v48[248] = *MEMORY[0x1E4F22DB8];
  v49[247] = &unk_1F1861AA8;
  v48[246] = *MEMORY[0x1E4F22E40];
  v49[245] = &unk_1F1861AA8;
  v49[246] = &unk_1F1861AA8;
  v49[86] = &unk_1F1861AA8;
  v48[245] = *MEMORY[0x1E4F22DD0];
  v49[244] = &unk_1F1861AA8;
  v48[243] = *MEMORY[0x1E4F22D78];
  v49[242] = &unk_1F1861AA8;
  v49[243] = &unk_1F1861AA8;
  v49[87] = &unk_1F1861AA8;
  v48[242] = *MEMORY[0x1E4F22E08];
  v49[241] = &unk_1F1861AA8;
  v48[240] = *MEMORY[0x1E4F22E18];
  v49[239] = &unk_1F1861AA8;
  v49[240] = &unk_1F1861AA8;
  v49[88] = &unk_1F1861AA8;
  v48[239] = *MEMORY[0x1E4F22DC0];
  v49[238] = &unk_1F1861AA8;
  v48[237] = *MEMORY[0x1E4F22E48];
  v49[236] = &unk_1F1861AA8;
  v49[237] = &unk_1F1861AA8;
  v49[89] = &unk_1F1861AA8;
  v48[236] = *MEMORY[0x1E4F22DD8];
  v49[235] = &unk_1F1861AA8;
  v48[234] = *MEMORY[0x1E4F22DF0];
  v49[233] = &unk_1F1861AA8;
  v49[234] = &unk_1F1861AA8;
  v49[90] = &unk_1F1861AA8;
  v48[233] = *MEMORY[0x1E4F22DE8];
  v49[232] = &unk_1F1861AA8;
  v48[231] = *MEMORY[0x1E4F22E58];
  v49[230] = &unk_1F1861AA8;
  v49[231] = &unk_1F1861AA8;
  v49[91] = &unk_1F1861AA8;
  v48[230] = *MEMORY[0x1E4F22E50];
  v49[229] = &unk_1F1861AA8;
  v48[228] = *MEMORY[0x1E4F23730];
  v49[227] = &unk_1F1861AA8;
  v49[228] = &unk_1F1861AA8;
  v49[92] = &unk_1F1861AA8;
  v48[227] = *MEMORY[0x1E4F23738];
  v49[226] = &unk_1F1861AA8;
  v48[225] = *MEMORY[0x1E4F231F0];
  v49[224] = &unk_1F1861AA8;
  v49[225] = &unk_1F1861AA8;
  v49[93] = &unk_1F1861AA8;
  v48[224] = *MEMORY[0x1E4F23070];
  v49[223] = &unk_1F1861AA8;
  v48[222] = *MEMORY[0x1E4F235F8];
  v49[221] = &unk_1F1861AA8;
  v49[222] = &unk_1F1861AA8;
  v49[94] = &unk_1F1861AA8;
  v48[221] = *MEMORY[0x1E4F235B8];
  v49[220] = &unk_1F1861AA8;
  v48[219] = *MEMORY[0x1E4F23498];
  v49[218] = &unk_1F1861AA8;
  v49[219] = &unk_1F1861AA8;
  v49[95] = &unk_1F1861AA8;
  v48[218] = *MEMORY[0x1E4F233E0];
  v49[217] = &unk_1F1861AA8;
  v48[216] = *MEMORY[0x1E4F232E8];
  v49[215] = &unk_1F1861AA8;
  v49[216] = &unk_1F1861AA8;
  v49[96] = &unk_1F1861AA8;
  v48[215] = *MEMORY[0x1E4F23068];
  v49[214] = &unk_1F1861AA8;
  v48[213] = *MEMORY[0x1E4F22FC8];
  v49[212] = &unk_1F1861AA8;
  v49[213] = &unk_1F1861AA8;
  v49[97] = &unk_1F1861AA8;
  v48[212] = *MEMORY[0x1E4F22C98];
  v49[211] = &unk_1F1861AA8;
  v48[210] = *MEMORY[0x1E4F22BE8];
  v49[209] = &unk_1F1861AA8;
  v49[210] = &unk_1F1861AA8;
  v49[98] = &unk_1F1861AA8;
  v48[209] = *MEMORY[0x1E4F22A50];
  v49[208] = &unk_1F1861AA8;
  v48[207] = *MEMORY[0x1E4F22E60];
  v49[206] = &unk_1F1861AA8;
  v49[207] = &unk_1F1861AA8;
  v49[99] = &unk_1F1861AA8;
  v48[206] = *MEMORY[0x1E4F23228];
  v49[205] = &unk_1F1861AA8;
  v48[204] = *MEMORY[0x1E4F23220];
  v49[203] = &unk_1F1861AA8;
  v49[204] = &unk_1F1861AA8;
  v49[100] = &unk_1F1861AA8;
  v48[203] = *MEMORY[0x1E4F23168];
  v49[202] = &unk_1F1861AA8;
  v48[201] = *MEMORY[0x1E4F23178];
  v49[200] = &unk_1F1861AA8;
  v49[201] = &unk_1F1861AA8;
  v49[101] = &unk_1F1861AA8;
  v48[200] = *MEMORY[0x1E4F23180];
  v49[199] = &unk_1F1861AA8;
  v48[198] = *MEMORY[0x1E4F232A8];
  v49[197] = &unk_1F1861AA8;
  v49[198] = &unk_1F1861AA8;
  v49[102] = &unk_1F1861AA8;
  v48[197] = *MEMORY[0x1E4F234F0];
  v49[196] = &unk_1F1861AA8;
  v48[195] = *MEMORY[0x1E4F22BF8];
  v49[194] = &unk_1F1861AA8;
  v49[195] = &unk_1F1861AA8;
  v49[103] = &unk_1F1861AA8;
  v48[194] = *MEMORY[0x1E4F22FF8];
  v49[193] = &unk_1F1861AA8;
  v48[192] = *MEMORY[0x1E4F22CF8];
  v49[191] = &unk_1F1861AA8;
  v49[192] = &unk_1F1861AA8;
  v49[104] = &unk_1F1861AA8;
  v48[191] = *MEMORY[0x1E4F22D08];
  v49[190] = &unk_1F1861AA8;
  v48[189] = *MEMORY[0x1E4F22D10];
  v49[188] = &unk_1F1861AA8;
  v49[189] = &unk_1F1861AA8;
  v49[105] = &unk_1F1861AA8;
  v48[188] = *MEMORY[0x1E4F22D20];
  v49[187] = &unk_1F1861AA8;
  v48[186] = *MEMORY[0x1E4F23360];
  v49[185] = &unk_1F1861AA8;
  v49[186] = &unk_1F1861AA8;
  v49[106] = &unk_1F1861AA8;
  v48[185] = *MEMORY[0x1E4F23348];
  v49[184] = &unk_1F1861AA8;
  v48[183] = *MEMORY[0x1E4F23358];
  v49[182] = &unk_1F1861AA8;
  v49[183] = &unk_1F1861AA8;
  v49[107] = &unk_1F1861AA8;
  v48[182] = *MEMORY[0x1E4F23328];
  v49[181] = &unk_1F1861AA8;
  v48[180] = *MEMORY[0x1E4F23640];
  v49[179] = &unk_1F1861AA8;
  v49[180] = &unk_1F1861AA8;
  v49[108] = &unk_1F1861AA8;
  v48[179] = *MEMORY[0x1E4F22B38];
  v49[178] = &unk_1F1861AA8;
  v48[177] = *MEMORY[0x1E4F23628];
  v49[176] = &unk_1F1861AA8;
  v49[177] = &unk_1F1861AA8;
  v49[109] = &unk_1F1861AA8;
  v48[176] = *MEMORY[0x1E4F23620];
  v49[175] = &unk_1F1861AA8;
  v48[174] = *MEMORY[0x1E4F23558];
  v49[173] = &unk_1F1861AA8;
  v49[174] = &unk_1F1861AA8;
  v49[110] = &unk_1F1861AA8;
  v48[173] = *MEMORY[0x1E4F23520];
  v49[172] = &unk_1F1861AA8;
  v48[171] = *MEMORY[0x1E4F23568];
  v49[170] = &unk_1F1861AA8;
  v49[171] = &unk_1F1861AA8;
  v49[111] = &unk_1F1861AA8;
  v48[170] = *MEMORY[0x1E4F23550];
  v49[169] = &unk_1F1861AA8;
  v48[168] = *MEMORY[0x1E4F23538];
  v49[167] = &unk_1F1861AA8;
  v49[168] = &unk_1F1861AA8;
  v49[112] = &unk_1F1861AA8;
  v48[167] = *MEMORY[0x1E4F23518];
  v49[166] = &unk_1F1861AA8;
  v48[165] = *MEMORY[0x1E4F23540];
  v49[164] = &unk_1F1861AA8;
  v49[165] = &unk_1F1861AA8;
  v49[113] = &unk_1F1861AA8;
  v48[164] = *MEMORY[0x1E4F23530];
  v49[163] = &unk_1F1861AA8;
  v48[162] = *MEMORY[0x1E4F23528];
  v49[161] = &unk_1F1861AA8;
  v49[162] = &unk_1F1861AA8;
  v49[114] = &unk_1F1861AA8;
  v48[161] = *MEMORY[0x1E4F23310];
  v49[160] = &unk_1F1861AA8;
  v48[159] = *MEMORY[0x1E4F233F0];
  v49[158] = &unk_1F1861AA8;
  v49[159] = &unk_1F1861AA8;
  v49[115] = &unk_1F1861AA8;
  v48[158] = *MEMORY[0x1E4F22AE8];
  v49[157] = &unk_1F1861AA8;
  v48[156] = *MEMORY[0x1E4F22C18];
  v49[155] = &unk_1F1861AA8;
  v49[156] = &unk_1F1861AA8;
  v49[116] = &unk_1F1861AA8;
  v48[155] = *MEMORY[0x1E4F235C8];
  v49[154] = &unk_1F1861AA8;
  v48[153] = *MEMORY[0x1E4F22AA8];
  v49[152] = &unk_1F1861AA8;
  v49[153] = &unk_1F1861AA8;
  v49[117] = &unk_1F1861AA8;
  v48[152] = *MEMORY[0x1E4F22AB8];
  v49[151] = &unk_1F1861AA8;
  v48[150] = *MEMORY[0x1E4F22AB0];
  v49[149] = &unk_1F1861AA8;
  v49[150] = &unk_1F1861AA8;
  v49[118] = &unk_1F1861AA8;
  v48[149] = *MEMORY[0x1E4F234D8];
  v49[148] = &unk_1F1861AA8;
  v48[147] = *MEMORY[0x1E4F233A8];
  v49[146] = &unk_1F1861AA8;
  v49[147] = &unk_1F1861AA8;
  v49[119] = &unk_1F1861AA8;
  v48[146] = *MEMORY[0x1E4F233A0];
  v49[145] = &unk_1F1861AA8;
  v48[144] = *MEMORY[0x1E4F22CA0];
  v49[143] = &unk_1F1861AA8;
  v49[144] = &unk_1F1861AA8;
  v49[120] = &unk_1F1861AA8;
  v48[143] = *MEMORY[0x1E4F22A20];
  v49[142] = &unk_1F1861AA8;
  v48[141] = *MEMORY[0x1E4F23318];
  v49[140] = &unk_1F1861AA8;
  v49[141] = &unk_1F1861AA8;
  v49[121] = &unk_1F1861AA8;
  v48[140] = *MEMORY[0x1E4F23260];
  v49[139] = &unk_1F1861AA8;
  v48[138] = *MEMORY[0x1E4F232B0];
  v49[137] = &unk_1F1861AA8;
  v49[138] = &unk_1F1861AA8;
  v49[122] = &unk_1F1861AA8;
  v48[137] = *MEMORY[0x1E4F232A0];
  v49[136] = &unk_1F1861AA8;
  v48[135] = *MEMORY[0x1E4F23298];
  v49[134] = &unk_1F1861AA8;
  v49[135] = &unk_1F1861AA8;
  v49[123] = &unk_1F1861AA8;
  v48[134] = *MEMORY[0x1E4F23370];
  v49[133] = &unk_1F1861AA8;
  v48[132] = *MEMORY[0x1E4F23330];
  v49[131] = &unk_1F1861AA8;
  v49[132] = &unk_1F1861AA8;
  v49[124] = &unk_1F1861AA8;
  v48[131] = *MEMORY[0x1E4F23368];
  v49[130] = &unk_1F1861AA8;
  v48[129] = *MEMORY[0x1E4F23340];
  v49[128] = &unk_1F1861AA8;
  v49[129] = &unk_1F1861AA8;
  v49[125] = &unk_1F1861AA8;
  v48[128] = *MEMORY[0x1E4F232F8];
  v49[127] = &unk_1F1861AA8;
  v48[126] = *MEMORY[0x1E4F23270];
  v49[126] = &unk_1F1861AA8;
  v49[255] = &unk_1F1861AA8;
  v48[256] = *MEMORY[0x1E4F22E98];
  v49[256] = &unk_1F1861AA8;
  v48[257] = *MEMORY[0x1E4F22E90];
  v49[257] = &unk_1F1861AA8;
  v48[258] = *MEMORY[0x1E4F22E68];
  v49[258] = &unk_1F1861AA8;
  v48[259] = *MEMORY[0x1E4F22E78];
  v49[259] = &unk_1F1861AA8;
  v48[260] = *MEMORY[0x1E4F22E80];
  v49[260] = &unk_1F1861AA8;
  v48[261] = *MEMORY[0x1E4F22EC8];
  v49[261] = &unk_1F1861AA8;
  v48[262] = *MEMORY[0x1E4F22EA8];
  v49[262] = &unk_1F1861AA8;
  v48[263] = *MEMORY[0x1E4F22ED0];
  v49[263] = &unk_1F1861AA8;
  v48[264] = *MEMORY[0x1E4F22EF8];
  v49[264] = &unk_1F1861AA8;
  v48[265] = *MEMORY[0x1E4F22EF0];
  v49[265] = &unk_1F1861AA8;
  v48[266] = *MEMORY[0x1E4F22D90];
  v49[266] = &unk_1F1861AA8;
  v48[267] = *MEMORY[0x1E4F22D88];
  v49[267] = &unk_1F1861AA8;
  v48[268] = *MEMORY[0x1E4F23138];
  v49[268] = &unk_1F1861AA8;
  v48[269] = *MEMORY[0x1E4F22A88];
  v49[269] = &unk_1F1861AA8;
  v48[270] = *MEMORY[0x1E4F22A90];
  v49[270] = &unk_1F1861AA8;
  v48[271] = *MEMORY[0x1E4F23570];
  v49[271] = &unk_1F1861AA8;
  v48[272] = *MEMORY[0x1E4F235F0];
  v49[272] = &unk_1F1861AA8;
  v48[273] = *MEMORY[0x1E4F233E8];
  v49[273] = &unk_1F1861AA8;
  v48[274] = *MEMORY[0x1E4F22EA0];
  v49[274] = &unk_1F1861AA8;
  v48[275] = *MEMORY[0x1E4F22F40];
  v49[275] = &unk_1F1861AA8;
  v48[276] = *MEMORY[0x1E4F22F08];
  v49[276] = &unk_1F1861AA8;
  v48[277] = *MEMORY[0x1E4F22F10];
  v49[277] = &unk_1F1861AA8;
  v48[278] = *MEMORY[0x1E4F22BD0];
  v49[278] = &unk_1F1861AA8;
  v48[279] = *MEMORY[0x1E4F22BD8];
  v49[279] = &unk_1F1861AA8;
  v48[280] = *MEMORY[0x1E4F22B80];
  v49[280] = &unk_1F1861AA8;
  v48[281] = *MEMORY[0x1E4F22C20];
  v49[281] = &unk_1F1861AA8;
  v48[282] = *MEMORY[0x1E4F23118];
  v49[282] = &unk_1F1861AA8;
  v48[283] = *MEMORY[0x1E4F23110];
  v49[283] = &unk_1F1861AA8;
  v48[284] = *MEMORY[0x1E4F23108];
  v49[284] = &unk_1F1861AA8;
  v48[285] = *MEMORY[0x1E4F235B0];
  v49[285] = &unk_1F1861AA8;
  v48[286] = *MEMORY[0x1E4F22D60];
  v49[286] = &unk_1F1861AA8;
  v48[287] = *MEMORY[0x1E4F23650];
  v49[287] = &unk_1F1861AA8;
  v48[288] = *MEMORY[0x1E4F22EE8];
  v49[288] = &unk_1F1861AA8;
  v48[289] = *MEMORY[0x1E4F22CD8];
  v49[289] = &unk_1F1861AA8;
  v48[290] = *MEMORY[0x1E4F22DE0];
  v49[290] = &unk_1F1861AA8;
  v48[291] = *MEMORY[0x1E4F22EB8];
  v49[291] = &unk_1F1861AA8;
  v48[292] = *MEMORY[0x1E4F22D80];
  v49[292] = &unk_1F1861AA8;
  v48[293] = *MEMORY[0x1E4F22ED8];
  v49[293] = &unk_1F1861AA8;
  v48[294] = *MEMORY[0x1E4F22EB0];
  v49[294] = &unk_1F1861AA8;
  v48[295] = *MEMORY[0x1E4F22EC0];
  v49[295] = &unk_1F1861AA8;
  v48[296] = *MEMORY[0x1E4F22F18];
  v49[296] = &unk_1F1861AA8;
  v48[297] = *MEMORY[0x1E4F22F28];
  v49[297] = &unk_1F1861AA8;
  v48[298] = *MEMORY[0x1E4F22F00];
  v49[298] = &unk_1F1861AA8;
  v48[299] = *MEMORY[0x1E4F22D98];
  v49[299] = &unk_1F1861AA8;
  v48[300] = *MEMORY[0x1E4F23120];
  v49[300] = &unk_1F1861AA8;
  v48[301] = *MEMORY[0x1E4F22B48];
  v49[301] = &unk_1F1861AA8;
  v48[302] = *MEMORY[0x1E4F22A58];
  v49[302] = &unk_1F1861AA8;
  v48[303] = *MEMORY[0x1E4F22B60];
  v49[303] = &unk_1F1861AA8;
  v48[304] = *MEMORY[0x1E4F22BC0];
  v49[304] = &unk_1F1861AA8;
  v48[305] = *MEMORY[0x1E4F22BE0];
  v49[305] = &unk_1F1861AA8;
  v48[306] = *MEMORY[0x1E4F22BB8];
  v49[306] = &unk_1F1861AA8;
  v48[307] = *MEMORY[0x1E4F22BA0];
  v49[307] = &unk_1F1861AA8;
  v48[308] = *MEMORY[0x1E4F22BA8];
  v49[308] = &unk_1F1861AA8;
  v48[309] = *MEMORY[0x1E4F22B98];
  v49[309] = &unk_1F1861AA8;
  v48[310] = *MEMORY[0x1E4F22BB0];
  v49[310] = &unk_1F1861AA8;
  v48[311] = *MEMORY[0x1E4F22BC8];
  v49[311] = &unk_1F1861AA8;
  v48[312] = *MEMORY[0x1E4F22B90];
  v49[312] = &unk_1F1861AA8;
  v48[313] = *MEMORY[0x1E4F22B88];
  v49[313] = &unk_1F1861AA8;
  v48[314] = *MEMORY[0x1E4F22C88];
  v49[314] = &unk_1F1861AA8;
  v48[315] = *MEMORY[0x1E4F22C80];
  v49[315] = &unk_1F1861AA8;
  v48[316] = *MEMORY[0x1E4F22CA8];
  v49[316] = &unk_1F1861AA8;
  v48[317] = *MEMORY[0x1E4F22D70];
  v49[317] = &unk_1F1861AA8;
  v48[318] = *MEMORY[0x1E4F23388];
  v49[318] = &unk_1F1861AA8;
  v48[319] = *MEMORY[0x1E4F23668];
  v49[319] = &unk_1F1861AA8;
  v48[320] = *MEMORY[0x1E4F234B8];
  v49[320] = &unk_1F1861AA8;
  v48[321] = *MEMORY[0x1E4F22F58];
  v49[321] = &unk_1F1861AA8;
  v48[322] = *MEMORY[0x1E4F22F78];
  v49[322] = &unk_1F1861AA8;
  v48[323] = *MEMORY[0x1E4F22F60];
  v49[323] = &unk_1F1861AA8;
  v48[324] = *MEMORY[0x1E4F22F80];
  v49[324] = &unk_1F1861AA8;
  v48[325] = *MEMORY[0x1E4F22F88];
  v49[325] = &unk_1F1861AA8;
  v48[326] = *MEMORY[0x1E4F22F48];
  v49[326] = &unk_1F1861AA8;
  v48[327] = *MEMORY[0x1E4F22F68];
  v49[327] = &unk_1F1861AA8;
  v48[328] = *MEMORY[0x1E4F22F70];
  v49[328] = &unk_1F1861AA8;
  v48[329] = *MEMORY[0x1E4F22F90];
  v49[329] = &unk_1F1861AA8;
  v48[330] = *MEMORY[0x1E4F22F50];
  v48[331] = *MEMORY[0x1E4F22CB0];
  v49[330] = &unk_1F1861AA8;
  v49[331] = &unk_1F1861AC0;
  v48[332] = *MEMORY[0x1E4F234B0];
  v49[332] = &unk_1F1861AA8;
  v48[333] = *MEMORY[0x1E4F22C08];
  v49[333] = &unk_1F1861AA8;
  v48[334] = *MEMORY[0x1E4F23060];
  v49[334] = &unk_1F1861AA8;
  v48[335] = *MEMORY[0x1E4F22FD0];
  v49[335] = &unk_1F1861AA8;
  v48[336] = *MEMORY[0x1E4F23158];
  v49[336] = &unk_1F1861AA8;
  v48[337] = *MEMORY[0x1E4F23418];
  v49[337] = &unk_1F1861AA8;
  v48[338] = *MEMORY[0x1E4F23428];
  v49[338] = &unk_1F1861AA8;
  v48[339] = *MEMORY[0x1E4F23420];
  v49[339] = &unk_1F1861AA8;
  v48[340] = *MEMORY[0x1E4F23430];
  v49[340] = &unk_1F1861AA8;
  v48[341] = *MEMORY[0x1E4F23038];
  v49[341] = &unk_1F1861AA8;
  v48[342] = *MEMORY[0x1E4F231A8];
  v49[342] = &unk_1F1861AA8;
  v48[343] = *MEMORY[0x1E4F22C50];
  v49[343] = &unk_1F1861AA8;
  v48[344] = *MEMORY[0x1E4F236C0];
  v49[344] = &unk_1F1861AA8;
  v48[345] = *MEMORY[0x1E4F236B0];
  v49[345] = &unk_1F1861AA8;
  v48[346] = *MEMORY[0x1E4F236B8];
  v49[346] = &unk_1F1861AA8;
  v48[347] = *MEMORY[0x1E4F23410];
  v49[347] = &unk_1F1861AA8;
  v48[348] = *MEMORY[0x1E4F234C8];
  v49[348] = &unk_1F1861AA8;
  v48[349] = *MEMORY[0x1E4F22A98];
  v49[349] = &unk_1F1861AA8;
  v48[350] = *MEMORY[0x1E4F23700];
  v49[350] = &unk_1F1861AA8;
  v48[351] = *MEMORY[0x1E4F236F8];
  v49[351] = &unk_1F1861AA8;
  v48[352] = *MEMORY[0x1E4F23140];
  v49[352] = &unk_1F1861AA8;
  v48[353] = *MEMORY[0x1E4F23710];
  v49[353] = &unk_1F1861AA8;
  v48[354] = *MEMORY[0x1E4F23740];
  v49[354] = &unk_1F1861AA8;
  v48[355] = *MEMORY[0x1E4F23748];
  v49[355] = &unk_1F1861AA8;
  v48[356] = *MEMORY[0x1E4F234C0];
  v49[356] = &unk_1F1861AA8;
  v48[357] = *MEMORY[0x1E4F22AE0];
  v49[357] = &unk_1F1861AA8;
  v48[358] = *MEMORY[0x1E4F233C8];
  v49[358] = &unk_1F1861AA8;
  v48[359] = *MEMORY[0x1E4F22A38];
  v49[359] = &unk_1F1861AA8;
  v48[360] = *MEMORY[0x1E4F23000];
  v49[360] = &unk_1F1861AA8;
  v48[361] = *MEMORY[0x1E4F236E8];
  v49[361] = &unk_1F1861AA8;
  v48[362] = *MEMORY[0x1E4F23728];
  v49[362] = &unk_1F1861AA8;
  v48[363] = *MEMORY[0x1E4F23720];
  v49[363] = &unk_1F1861AA8;
  v48[364] = *MEMORY[0x1E4F23718];
  v49[364] = &unk_1F1861AA8;
  v48[365] = *MEMORY[0x1E4F237B0];
  v49[365] = &unk_1F1861AA8;
  v48[366] = *MEMORY[0x1E4F23048];
  v49[366] = &unk_1F1861AA8;
  v48[367] = *MEMORY[0x1E4F231B8];
  v49[367] = &unk_1F1861AA8;
  v48[368] = *MEMORY[0x1E4F23050];
  v49[368] = &unk_1F1861AA8;
  v48[369] = *MEMORY[0x1E4F231C0];
  v49[369] = &unk_1F1861AA8;
  v48[370] = *MEMORY[0x1E4F23030];
  v49[370] = &unk_1F1861AA8;
  v48[371] = *MEMORY[0x1E4F231A0];
  v49[371] = &unk_1F1861AA8;
  v48[372] = *MEMORY[0x1E4F23040];
  v49[372] = &unk_1F1861AA8;
  v48[373] = *MEMORY[0x1E4F231B0];
  v49[373] = &unk_1F1861AA8;
  v48[374] = *MEMORY[0x1E4F236D8];
  v49[374] = &unk_1F1861AA8;
  v48[375] = *MEMORY[0x1E4F22CC8];
  v49[375] = &unk_1F1861AA8;
  v48[376] = *MEMORY[0x1E4F22C40];
  v49[376] = &unk_1F1861AA8;
  v48[377] = *MEMORY[0x1E4F23608];
  v49[377] = &unk_1F1861AA8;
  v48[378] = *MEMORY[0x1E4F236C8];
  v48[379] = *MEMORY[0x1E4F236D0];
  v48[380] = *MEMORY[0x1E4F22FE8];
  v48[381] = *MEMORY[0x1E4F230D8];
  v48[382] = *MEMORY[0x1E4F22FD8];
  v48[383] = *MEMORY[0x1E4F235E0];
  v49[378] = &unk_1F1861AA8;
  v49[379] = &unk_1F1861AA8;
  v49[380] = &unk_1F1861AA8;
  v49[381] = &unk_1F1861AA8;
  v49[382] = &unk_1F1861AA8;
  v49[383] = &unk_1F1861AA8;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:384];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v34 = (void *)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames;
  rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames = (uint64_t)v33;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  float v35 = rankingAttributeNameArray();
  uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        float v41 = objc_msgSend(v32, "objectForKeyedSubscript:", v40, (void)v43);
        float v42 = v41;
        if (v41 && [v41 intValue] == 2) {
          [(id)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames addObject:v40];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v37);
  }
}

uint64_t rankingAttributeIndexForName(void *a1)
{
  id v1 = a1;
  if (rankingAttributeIndexForName_onceToken != -1) {
    dispatch_once(&rankingAttributeIndexForName_onceToken, &__block_literal_global_25_0);
  }
  uint64_t v2 = [(id)rankingAttributeIndexForName_attributeToRankingIndexMap objectForKeyedSubscript:v1];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = (int)[v2 intValue];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void __rankingAttributeIndexForName_block_invoke()
{
  v51[384] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23020];
  v50[0] = *MEMORY[0x1E4F22C60];
  v50[1] = v0;
  v51[0] = &unk_1F1861AD8;
  v51[1] = &unk_1F1861AF0;
  uint64_t v1 = *MEMORY[0x1E4F22C30];
  v50[2] = *MEMORY[0x1E4F23670];
  v50[3] = v1;
  v51[2] = &unk_1F1861B08;
  v51[3] = &unk_1F1861B20;
  uint64_t v2 = *MEMORY[0x1E4F22B30];
  v50[4] = *MEMORY[0x1E4F235C0];
  v50[5] = v2;
  v51[4] = &unk_1F1861B38;
  v51[5] = &unk_1F1861B50;
  uint64_t v3 = *MEMORY[0x1E4F22CE8];
  v50[6] = *MEMORY[0x1E4F22C58];
  v50[7] = v3;
  v51[6] = &unk_1F1861B68;
  v51[7] = &unk_1F1861B80;
  uint64_t v4 = *MEMORY[0x1E4F230F0];
  v50[8] = *MEMORY[0x1E4F23780];
  v50[9] = v4;
  v51[8] = &unk_1F1861B98;
  v51[9] = &unk_1F1861BB0;
  uint64_t v5 = *MEMORY[0x1E4F236A8];
  v50[10] = *MEMORY[0x1E4F22B50];
  v50[11] = v5;
  v51[10] = &unk_1F1861BC8;
  v51[11] = &unk_1F1861BE0;
  uint64_t v6 = *MEMORY[0x1E4F22C70];
  v50[12] = *MEMORY[0x1E4F23658];
  v50[13] = v6;
  v51[12] = &unk_1F1861BF8;
  v51[13] = &unk_1F1861C10;
  uint64_t v7 = *MEMORY[0x1E4F234E0];
  v50[14] = *MEMORY[0x1E4F236A0];
  v50[15] = v7;
  v51[14] = &unk_1F1861C28;
  v51[15] = &unk_1F1861C40;
  uint64_t v8 = *MEMORY[0x1E4F235A8];
  v50[16] = *MEMORY[0x1E4F235A0];
  v50[17] = v8;
  v51[16] = &unk_1F1861C58;
  v51[17] = &unk_1F1861C70;
  uint64_t v9 = *MEMORY[0x1E4F22D38];
  v50[18] = *MEMORY[0x1E4F22D58];
  v50[19] = v9;
  v51[18] = &unk_1F1861C88;
  v51[19] = &unk_1F1861CA0;
  uint64_t v10 = *MEMORY[0x1E4F23690];
  v50[20] = *MEMORY[0x1E4F23160];
  v50[21] = v10;
  v51[20] = &unk_1F1861CB8;
  v51[21] = &unk_1F1861CD0;
  uint64_t v11 = *MEMORY[0x1E4F23648];
  v50[22] = *MEMORY[0x1E4F23698];
  v50[23] = v11;
  v51[22] = &unk_1F1861CE8;
  v51[23] = &unk_1F1861D00;
  uint64_t v12 = *MEMORY[0x1E4F22C48];
  v50[24] = *MEMORY[0x1E4F22CB8];
  v50[25] = v12;
  v51[24] = &unk_1F1861D18;
  v51[25] = &unk_1F1861D30;
  uint64_t v13 = *MEMORY[0x1E4F22C68];
  v50[26] = *MEMORY[0x1E4F22A68];
  v50[27] = v13;
  v51[26] = &unk_1F1861D48;
  v51[27] = &unk_1F1861D60;
  uint64_t v14 = *MEMORY[0x1E4F22D30];
  v50[28] = *MEMORY[0x1E4F22C00];
  v50[29] = v14;
  v51[28] = &unk_1F1861D78;
  v51[29] = &unk_1F1861D90;
  uint64_t v15 = *MEMORY[0x1E4F22CD0];
  v50[30] = *MEMORY[0x1E4F22A10];
  v50[31] = v15;
  v51[30] = &unk_1F1861DA8;
  v51[31] = &unk_1F1861DC0;
  uint64_t v16 = *MEMORY[0x1E4F22AF8];
  v50[32] = *MEMORY[0x1E4F22C38];
  v50[33] = v16;
  v51[32] = &unk_1F1861DD8;
  v51[33] = &unk_1F1861DF0;
  uint64_t v17 = *MEMORY[0x1E4F22B18];
  v50[34] = *MEMORY[0x1E4F23638];
  v50[35] = v17;
  v51[34] = &unk_1F1861E08;
  v51[35] = &unk_1F1861E20;
  uint64_t v18 = *MEMORY[0x1E4F22AD8];
  v50[36] = *MEMORY[0x1E4F22F30];
  v50[37] = v18;
  v51[36] = &unk_1F1861E38;
  v51[37] = &unk_1F1861E50;
  uint64_t v19 = *MEMORY[0x1E4F23230];
  v50[38] = *MEMORY[0x1E4F22A30];
  v50[39] = v19;
  v51[38] = &unk_1F1861E68;
  v51[39] = &unk_1F1861E80;
  uint64_t v20 = *MEMORY[0x1E4F235D8];
  v50[40] = *MEMORY[0x1E4F22D48];
  v50[41] = v20;
  v51[40] = &unk_1F1861E98;
  v51[41] = &unk_1F1861EB0;
  uint64_t v21 = *MEMORY[0x1E4F23130];
  v50[42] = *MEMORY[0x1E4F230F8];
  v50[43] = v21;
  v51[42] = &unk_1F1861EC8;
  v51[43] = &unk_1F1861EE0;
  uint64_t v22 = *MEMORY[0x1E4F22A28];
  v50[44] = *MEMORY[0x1E4F235D0];
  v50[45] = v22;
  v51[44] = &unk_1F1861EF8;
  v51[45] = &unk_1F1861F10;
  uint64_t v23 = *MEMORY[0x1E4F22B10];
  v50[46] = *MEMORY[0x1E4F23578];
  v50[47] = v23;
  v51[46] = &unk_1F1861F28;
  v51[47] = &unk_1F1861F40;
  uint64_t v24 = *MEMORY[0x1E4F23078];
  v50[48] = *MEMORY[0x1E4F234A0];
  v50[49] = v24;
  v51[48] = &unk_1F1861F58;
  v51[49] = &unk_1F1861F70;
  uint64_t v25 = *MEMORY[0x1E4F22F98];
  v50[50] = *MEMORY[0x1E4F22D28];
  v50[51] = v25;
  v51[50] = &unk_1F1861F88;
  v51[51] = &unk_1F1861FA0;
  uint64_t v26 = *MEMORY[0x1E4F22FC0];
  v50[52] = *MEMORY[0x1E4F231E0];
  v50[53] = v26;
  v51[52] = &unk_1F1861FB8;
  v51[53] = &unk_1F1861FD0;
  uint64_t v27 = *MEMORY[0x1E4F23448];
  v50[54] = *MEMORY[0x1E4F22CF0];
  v50[55] = v27;
  v51[54] = &unk_1F1861FE8;
  v51[55] = &unk_1F1862000;
  uint64_t v28 = *MEMORY[0x1E4F22FB8];
  v50[56] = *MEMORY[0x1E4F23188];
  v50[57] = v28;
  v51[56] = &unk_1F1862018;
  v51[57] = &unk_1F1862030;
  uint64_t v29 = *MEMORY[0x1E4F22A78];
  v50[58] = *MEMORY[0x1E4F23100];
  v50[59] = v29;
  v51[58] = &unk_1F1862048;
  v51[59] = &unk_1F1862060;
  uint64_t v30 = *MEMORY[0x1E4F22A70];
  v50[60] = *MEMORY[0x1E4F23680];
  v50[61] = v30;
  v51[60] = &unk_1F1862078;
  v51[61] = &unk_1F1862090;
  uint64_t v31 = *MEMORY[0x1E4F230C8];
  v50[62] = *MEMORY[0x1E4F22A80];
  v50[63] = v31;
  v51[62] = &unk_1F18620A8;
  v51[63] = &unk_1F18620C0;
  v50[64] = *MEMORY[0x1E4F236E0];
  v51[64] = &unk_1F18620D8;
  v50[65] = *MEMORY[0x1E4F23678];
  v51[65] = &unk_1F18620F0;
  v50[66] = *MEMORY[0x1E4F22B00];
  v51[66] = &unk_1F1862108;
  v50[67] = *MEMORY[0x1E4F23438];
  v51[67] = &unk_1F1862120;
  v50[68] = *MEMORY[0x1E4F23440];
  v51[68] = &unk_1F1862138;
  v50[69] = *MEMORY[0x1E4F22B78];
  v51[69] = &unk_1F1862150;
  v50[70] = *MEMORY[0x1E4F22B70];
  v51[70] = &unk_1F1862168;
  v50[71] = *MEMORY[0x1E4F230D0];
  v51[71] = &unk_1F1862180;
  v50[72] = *MEMORY[0x1E4F234D0];
  v51[72] = &unk_1F1862198;
  v50[73] = *MEMORY[0x1E4F23190];
  v51[73] = &unk_1F18621B0;
  v50[74] = *MEMORY[0x1E4F23058];
  v51[74] = &unk_1F18621C8;
  v50[75] = *MEMORY[0x1E4F231C8];
  v51[75] = &unk_1F18621E0;
  v50[76] = *MEMORY[0x1E4F23028];
  v51[76] = &unk_1F18621F8;
  v50[77] = *MEMORY[0x1E4F23770];
  v51[77] = &unk_1F1862210;
  v50[78] = *MEMORY[0x1E4F23198];
  v51[78] = &unk_1F1862228;
  v50[79] = *MEMORY[0x1E4F233F8];
  v51[79] = &unk_1F1862240;
  v50[80] = *MEMORY[0x1E4F23400];
  v51[80] = &unk_1F1862258;
  v50[81] = *MEMORY[0x1E4F236F0];
  v51[81] = &unk_1F1862270;
  v50[82] = *MEMORY[0x1E4F23580];
  v51[82] = &unk_1F1862288;
  v50[83] = *MEMORY[0x1E4F22FB0];
  v51[83] = &unk_1F18622A0;
  v50[84] = *MEMORY[0x1E4F22CC0];
  v51[84] = &unk_1F18622B8;
  v50[85] = *MEMORY[0x1E4F22FA8];
  v51[85] = &unk_1F18622D0;
  v50[86] = *MEMORY[0x1E4F22BF0];
  v51[86] = &unk_1F18622E8;
  v50[87] = *MEMORY[0x1E4F234F8];
  v51[87] = &unk_1F1862300;
  v50[88] = *MEMORY[0x1E4F22D68];
  v51[88] = &unk_1F1862318;
  v50[89] = *MEMORY[0x1E4F22B40];
  v51[89] = &unk_1F1862330;
  v50[90] = *MEMORY[0x1E4F23408];
  v51[90] = &unk_1F1862348;
  v50[91] = *MEMORY[0x1E4F22C28];
  v51[91] = &unk_1F1862360;
  v50[92] = *MEMORY[0x1E4F23610];
  v51[92] = &unk_1F1862378;
  v50[93] = *MEMORY[0x1E4F23200];
  v51[93] = &unk_1F1862390;
  v50[94] = *MEMORY[0x1E4F23208];
  v51[94] = &unk_1F18623A8;
  v50[95] = *MEMORY[0x1E4F23210];
  v51[95] = &unk_1F18623C0;
  v50[96] = *MEMORY[0x1E4F22C10];
  v51[96] = &unk_1F18623D8;
  v50[97] = *MEMORY[0x1E4F23390];
  v51[97] = &unk_1F18623F0;
  v50[98] = *MEMORY[0x1E4F23398];
  v51[98] = &unk_1F1862408;
  v50[99] = *MEMORY[0x1E4F233B0];
  v51[99] = &unk_1F1862420;
  v50[100] = *MEMORY[0x1E4F23660];
  v51[100] = &unk_1F1862438;
  v50[101] = *MEMORY[0x1E4F23758];
  v51[101] = &unk_1F1862450;
  v50[102] = *MEMORY[0x1E4F235E8];
  v51[102] = &unk_1F1862468;
  v50[103] = @"kMDQueryResultTextContentDistances";
  v51[103] = &unk_1F1862480;
  v50[104] = *MEMORY[0x1E4F23760];
  v51[104] = &unk_1F1862498;
  v50[105] = *MEMORY[0x1E4F23790];
  v51[105] = &unk_1F18624B0;
  v50[106] = *MEMORY[0x1E4F23600];
  v51[106] = &unk_1F18624C8;
  v50[107] = *MEMORY[0x1E4F237A8];
  v51[107] = &unk_1F18624E0;
  v50[108] = *MEMORY[0x1E4F23468];
  v51[108] = &unk_1F18624F8;
  v50[109] = *MEMORY[0x1E4F23478];
  v51[109] = &unk_1F1862510;
  v50[110] = *MEMORY[0x1E4F23488];
  v51[110] = &unk_1F1862528;
  v50[253] = *MEMORY[0x1E4F22E38];
  v50[255] = *MEMORY[0x1E4F22E88];
  v50[254] = *MEMORY[0x1E4F22E20];
  v51[254] = &unk_1F18632A8;
  v51[253] = &unk_1F1863290;
  v50[247] = *MEMORY[0x1E4F22DA0];
  v51[252] = &unk_1F1863278;
  v51[251] = &unk_1F1863260;
  v50[252] = *MEMORY[0x1E4F22E28];
  v50[251] = *MEMORY[0x1E4F22E10];
  v50[249] = *MEMORY[0x1E4F22DC8];
  v50[250] = *MEMORY[0x1E4F22DB0];
  v51[250] = &unk_1F1863248;
  v51[249] = &unk_1F1863230;
  v50[248] = *MEMORY[0x1E4F22DB8];
  v51[248] = &unk_1F1863218;
  v51[247] = &unk_1F1863200;
  v50[241] = *MEMORY[0x1E4F22E30];
  v51[246] = &unk_1F18631E8;
  v51[245] = &unk_1F18631D0;
  v50[246] = *MEMORY[0x1E4F22E40];
  v50[245] = *MEMORY[0x1E4F22DD0];
  v50[243] = *MEMORY[0x1E4F22D78];
  v50[244] = *MEMORY[0x1E4F22EE0];
  v51[244] = &unk_1F18631B8;
  v51[243] = &unk_1F18631A0;
  v50[242] = *MEMORY[0x1E4F22E08];
  v51[242] = &unk_1F1863188;
  v51[241] = &unk_1F1863170;
  v50[235] = *MEMORY[0x1E4F22DF8];
  v51[240] = &unk_1F1863158;
  v51[239] = &unk_1F1863140;
  v50[240] = *MEMORY[0x1E4F22E18];
  v50[239] = *MEMORY[0x1E4F22DC0];
  v50[237] = *MEMORY[0x1E4F22E48];
  v50[238] = *MEMORY[0x1E4F22DA8];
  v51[238] = &unk_1F1863128;
  v51[237] = &unk_1F1863110;
  v50[236] = *MEMORY[0x1E4F22DD8];
  v51[236] = &unk_1F18630F8;
  v51[235] = &unk_1F18630E0;
  v50[229] = *MEMORY[0x1E4F22F20];
  v51[234] = &unk_1F18630C8;
  v51[233] = &unk_1F18630B0;
  v50[234] = *MEMORY[0x1E4F22DF0];
  v50[233] = *MEMORY[0x1E4F22DE8];
  v50[231] = *MEMORY[0x1E4F22E58];
  v50[232] = *MEMORY[0x1E4F22E00];
  v51[232] = &unk_1F1863098;
  v51[231] = &unk_1F1863080;
  v50[230] = *MEMORY[0x1E4F22E50];
  v51[230] = &unk_1F1863068;
  v51[229] = &unk_1F1863050;
  v50[223] = *MEMORY[0x1E4F23150];
  v51[228] = &unk_1F1863038;
  v51[227] = &unk_1F1863020;
  v50[228] = *MEMORY[0x1E4F23730];
  v50[227] = *MEMORY[0x1E4F23738];
  v50[225] = *MEMORY[0x1E4F231F0];
  v50[226] = *MEMORY[0x1E4F231F8];
  v51[226] = &unk_1F1863008;
  v51[225] = &unk_1F1862FF0;
  v50[224] = *MEMORY[0x1E4F23070];
  v51[224] = &unk_1F1862FD8;
  v51[223] = &unk_1F1862FC0;
  v50[217] = *MEMORY[0x1E4F233C0];
  v51[222] = &unk_1F1862FA8;
  v51[221] = &unk_1F1862F90;
  v50[222] = *MEMORY[0x1E4F235F8];
  v50[221] = *MEMORY[0x1E4F235B8];
  v50[219] = *MEMORY[0x1E4F23498];
  v50[220] = *MEMORY[0x1E4F234A8];
  v51[220] = &unk_1F1862F78;
  v51[219] = &unk_1F1862F60;
  v50[218] = *MEMORY[0x1E4F233E0];
  v51[218] = &unk_1F1862F48;
  v51[217] = &unk_1F1862F30;
  v50[211] = *MEMORY[0x1E4F22C90];
  v51[216] = &unk_1F1862F18;
  v51[215] = &unk_1F1862F00;
  v50[216] = *MEMORY[0x1E4F232E8];
  v50[215] = *MEMORY[0x1E4F23068];
  v50[213] = *MEMORY[0x1E4F22FC8];
  v50[214] = *MEMORY[0x1E4F22FE0];
  v51[214] = &unk_1F1862EE8;
  v51[213] = &unk_1F1862ED0;
  v50[212] = *MEMORY[0x1E4F22C98];
  v51[212] = &unk_1F1862EB8;
  v51[211] = &unk_1F1862EA0;
  v50[205] = *MEMORY[0x1E4F23218];
  v51[210] = &unk_1F1862E88;
  v51[209] = &unk_1F1862E70;
  v50[210] = *MEMORY[0x1E4F22BE8];
  v50[209] = *MEMORY[0x1E4F22A50];
  v50[207] = *MEMORY[0x1E4F22E60];
  v50[208] = *MEMORY[0x1E4F22E70];
  v51[208] = &unk_1F1862E58;
  v51[207] = &unk_1F1862E40;
  v50[206] = *MEMORY[0x1E4F23228];
  v51[206] = &unk_1F1862E28;
  v51[205] = &unk_1F1862E10;
  v50[199] = *MEMORY[0x1E4F232B8];
  v51[204] = &unk_1F1862DF8;
  v51[203] = &unk_1F1862DE0;
  v50[204] = *MEMORY[0x1E4F23220];
  v50[203] = *MEMORY[0x1E4F23168];
  v50[201] = *MEMORY[0x1E4F23178];
  v50[202] = *MEMORY[0x1E4F23170];
  v51[202] = &unk_1F1862DC8;
  v51[201] = &unk_1F1862DB0;
  v50[200] = *MEMORY[0x1E4F23180];
  v51[200] = &unk_1F1862D98;
  v51[199] = &unk_1F1862D80;
  v50[193] = *MEMORY[0x1E4F23688];
  v51[198] = &unk_1F1862D68;
  v51[197] = &unk_1F1862D50;
  v50[198] = *MEMORY[0x1E4F232A8];
  v50[197] = *MEMORY[0x1E4F234F0];
  v50[195] = *MEMORY[0x1E4F22BF8];
  v50[196] = *MEMORY[0x1E4F234E8];
  v51[196] = &unk_1F1862D38;
  v51[195] = &unk_1F1862D20;
  v50[194] = *MEMORY[0x1E4F22FF8];
  v51[194] = &unk_1F1862D08;
  v51[193] = &unk_1F1862CF0;
  v50[187] = *MEMORY[0x1E4F22D18];
  v51[192] = &unk_1F1862CD8;
  v51[191] = &unk_1F1862CC0;
  v50[192] = *MEMORY[0x1E4F22CF8];
  v50[191] = *MEMORY[0x1E4F22D08];
  v50[189] = *MEMORY[0x1E4F22D10];
  v50[190] = *MEMORY[0x1E4F22D00];
  v51[190] = &unk_1F1862CA8;
  v51[189] = &unk_1F1862C90;
  v50[188] = *MEMORY[0x1E4F22D20];
  v51[188] = &unk_1F1862C78;
  v51[187] = &unk_1F1862C60;
  v50[181] = *MEMORY[0x1E4F22B68];
  v51[186] = &unk_1F1862C48;
  v51[185] = &unk_1F1862C30;
  v50[186] = *MEMORY[0x1E4F23360];
  v50[185] = *MEMORY[0x1E4F23348];
  v50[183] = *MEMORY[0x1E4F23358];
  v50[184] = *MEMORY[0x1E4F23308];
  v51[184] = &unk_1F1862C18;
  v51[183] = &unk_1F1862C00;
  v50[182] = *MEMORY[0x1E4F23328];
  v51[182] = &unk_1F1862BE8;
  v51[181] = &unk_1F1862BD0;
  v50[175] = *MEMORY[0x1E4F23268];
  v51[180] = &unk_1F1862BB8;
  v51[179] = &unk_1F1862BA0;
  v50[180] = *MEMORY[0x1E4F23640];
  v50[179] = *MEMORY[0x1E4F22B38];
  v50[177] = *MEMORY[0x1E4F23628];
  v50[178] = *MEMORY[0x1E4F230B8];
  v51[178] = &unk_1F1862B88;
  v51[177] = &unk_1F1862B70;
  v50[176] = *MEMORY[0x1E4F23620];
  v51[176] = &unk_1F1862B58;
  uint64_t v32 = *MEMORY[0x1E4F23470];
  v51[175] = &unk_1F1862B40;
  v50[111] = v32;
  v51[174] = &unk_1F1862B28;
  v51[172] = &unk_1F1862AF8;
  v51[173] = &unk_1F1862B10;
  v50[174] = *MEMORY[0x1E4F23558];
  v50[173] = *MEMORY[0x1E4F23520];
  v50[172] = *MEMORY[0x1E4F23560];
  v51[111] = &unk_1F1862540;
  v50[171] = *MEMORY[0x1E4F23568];
  v51[171] = &unk_1F1862AE0;
  uint64_t v33 = *MEMORY[0x1E4F23480];
  v51[170] = &unk_1F1862AC8;
  v50[112] = v33;
  v51[169] = &unk_1F1862AB0;
  v50[170] = *MEMORY[0x1E4F23550];
  v50[169] = *MEMORY[0x1E4F23510];
  v51[112] = &unk_1F1862558;
  v50[168] = *MEMORY[0x1E4F23538];
  v51[168] = &unk_1F1862A98;
  uint64_t v34 = *MEMORY[0x1E4F23490];
  v51[167] = &unk_1F1862A80;
  v50[113] = v34;
  v51[166] = &unk_1F1862A68;
  v50[167] = *MEMORY[0x1E4F23518];
  v50[166] = *MEMORY[0x1E4F23548];
  v51[113] = &unk_1F1862570;
  v50[165] = *MEMORY[0x1E4F23540];
  v51[165] = &unk_1F1862A50;
  uint64_t v35 = *MEMORY[0x1E4F23450];
  v51[164] = &unk_1F1862A38;
  v50[114] = v35;
  v51[163] = &unk_1F1862A20;
  v50[164] = *MEMORY[0x1E4F23530];
  v50[163] = *MEMORY[0x1E4F23508];
  v51[114] = &unk_1F1862588;
  v50[162] = *MEMORY[0x1E4F23528];
  v51[162] = &unk_1F1862A08;
  uint64_t v36 = *MEMORY[0x1E4F23458];
  v51[161] = &unk_1F18629F0;
  v50[115] = v36;
  v51[160] = &unk_1F18629D8;
  v50[161] = *MEMORY[0x1E4F23310];
  v50[160] = *MEMORY[0x1E4F23798];
  v51[115] = &unk_1F18625A0;
  v50[159] = *MEMORY[0x1E4F233F0];
  v51[159] = &unk_1F18629C0;
  uint64_t v37 = *MEMORY[0x1E4F23460];
  v51[158] = &unk_1F18629A8;
  v50[116] = v37;
  v51[157] = &unk_1F1862990;
  v50[158] = *MEMORY[0x1E4F22AE8];
  v50[157] = *MEMORY[0x1E4F22AF0];
  v51[116] = &unk_1F18625B8;
  v50[156] = *MEMORY[0x1E4F22C18];
  v51[156] = &unk_1F1862978;
  uint64_t v38 = *MEMORY[0x1E4F23380];
  v51[155] = &unk_1F1862960;
  v50[117] = v38;
  v51[154] = &unk_1F1862948;
  v50[155] = *MEMORY[0x1E4F235C8];
  v50[154] = *MEMORY[0x1E4F22AD0];
  v51[117] = &unk_1F18625D0;
  v50[153] = *MEMORY[0x1E4F22AA8];
  v51[153] = &unk_1F1862930;
  uint64_t v39 = *MEMORY[0x1E4F230A0];
  v51[152] = &unk_1F1862918;
  v50[118] = v39;
  v51[151] = &unk_1F1862900;
  v50[152] = *MEMORY[0x1E4F22AB8];
  v50[151] = *MEMORY[0x1E4F22B08];
  v51[118] = &unk_1F18625E8;
  v50[150] = *MEMORY[0x1E4F22AB0];
  v51[150] = &unk_1F18628E8;
  uint64_t v40 = *MEMORY[0x1E4F22FF0];
  v51[149] = &unk_1F18628D0;
  v50[119] = v40;
  v51[148] = &unk_1F18628B8;
  v50[149] = *MEMORY[0x1E4F234D8];
  v50[148] = *MEMORY[0x1E4F23750];
  v51[119] = &unk_1F1862600;
  v50[147] = *MEMORY[0x1E4F233A8];
  v51[147] = &unk_1F18628A0;
  uint64_t v41 = *MEMORY[0x1E4F23290];
  v51[146] = &unk_1F1862888;
  v50[120] = v41;
  v51[145] = &unk_1F1862870;
  v50[146] = *MEMORY[0x1E4F233A0];
  v50[145] = *MEMORY[0x1E4F22A60];
  v51[120] = &unk_1F1862618;
  v50[144] = *MEMORY[0x1E4F22CA0];
  v51[144] = &unk_1F1862858;
  uint64_t v42 = *MEMORY[0x1E4F232E0];
  v51[143] = &unk_1F1862840;
  v50[121] = v42;
  v51[142] = &unk_1F1862828;
  v50[143] = *MEMORY[0x1E4F22A20];
  v50[142] = *MEMORY[0x1E4F22A18];
  v51[121] = &unk_1F1862630;
  v50[141] = *MEMORY[0x1E4F23318];
  v51[141] = &unk_1F1862810;
  uint64_t v43 = *MEMORY[0x1E4F23250];
  v51[140] = &unk_1F18627F8;
  v50[122] = v43;
  v51[139] = &unk_1F18627E0;
  v50[140] = *MEMORY[0x1E4F23260];
  v50[139] = *MEMORY[0x1E4F23378];
  v51[122] = &unk_1F1862648;
  v50[138] = *MEMORY[0x1E4F232B0];
  v51[138] = &unk_1F18627C8;
  uint64_t v44 = *MEMORY[0x1E4F23248];
  v51[137] = &unk_1F18627B0;
  v50[123] = v44;
  v51[136] = &unk_1F1862798;
  v50[137] = *MEMORY[0x1E4F232A0];
  v50[136] = *MEMORY[0x1E4F232C0];
  v51[123] = &unk_1F1862660;
  v50[135] = *MEMORY[0x1E4F23298];
  v51[135] = &unk_1F1862780;
  uint64_t v45 = *MEMORY[0x1E4F232D8];
  v51[134] = &unk_1F1862768;
  v50[124] = v45;
  v51[133] = &unk_1F1862750;
  v50[134] = *MEMORY[0x1E4F23370];
  v50[133] = *MEMORY[0x1E4F23350];
  v51[124] = &unk_1F1862678;
  v50[132] = *MEMORY[0x1E4F23330];
  v51[132] = &unk_1F1862738;
  uint64_t v46 = *MEMORY[0x1E4F23278];
  v51[131] = &unk_1F1862720;
  v50[125] = v46;
  v51[130] = &unk_1F1862708;
  v50[131] = *MEMORY[0x1E4F23368];
  v50[130] = *MEMORY[0x1E4F23338];
  v51[125] = &unk_1F1862690;
  v50[129] = *MEMORY[0x1E4F23340];
  v51[129] = &unk_1F18626F0;
  uint64_t v47 = *MEMORY[0x1E4F23270];
  v51[128] = &unk_1F18626D8;
  v50[126] = v47;
  v51[127] = &unk_1F18626C0;
  v50[128] = *MEMORY[0x1E4F232F8];
  v50[127] = *MEMORY[0x1E4F23280];
  v51[126] = &unk_1F18626A8;
  v51[255] = &unk_1F18632C0;
  v50[256] = *MEMORY[0x1E4F22E98];
  v51[256] = &unk_1F18632D8;
  v50[257] = *MEMORY[0x1E4F22E90];
  v51[257] = &unk_1F18632F0;
  v50[258] = *MEMORY[0x1E4F22E68];
  v51[258] = &unk_1F1863308;
  v50[259] = *MEMORY[0x1E4F22E78];
  v51[259] = &unk_1F1863320;
  v50[260] = *MEMORY[0x1E4F22E80];
  v51[260] = &unk_1F1863338;
  v50[261] = *MEMORY[0x1E4F22EC8];
  v51[261] = &unk_1F1863350;
  v50[262] = *MEMORY[0x1E4F22EA8];
  v51[262] = &unk_1F1863368;
  v50[263] = *MEMORY[0x1E4F22ED0];
  v51[263] = &unk_1F1863380;
  v50[264] = *MEMORY[0x1E4F22EF8];
  v51[264] = &unk_1F1863398;
  v50[265] = *MEMORY[0x1E4F22EF0];
  v51[265] = &unk_1F18633B0;
  v50[266] = *MEMORY[0x1E4F22D90];
  v51[266] = &unk_1F18633C8;
  v50[267] = *MEMORY[0x1E4F22D88];
  v51[267] = &unk_1F18633E0;
  v50[268] = *MEMORY[0x1E4F23138];
  v51[268] = &unk_1F18633F8;
  v50[269] = *MEMORY[0x1E4F22A88];
  v51[269] = &unk_1F1863410;
  v50[270] = *MEMORY[0x1E4F22A90];
  v51[270] = &unk_1F1863428;
  v50[271] = *MEMORY[0x1E4F23570];
  v51[271] = &unk_1F1863440;
  v50[272] = *MEMORY[0x1E4F235F0];
  v51[272] = &unk_1F1863458;
  v50[273] = *MEMORY[0x1E4F233E8];
  v51[273] = &unk_1F1863470;
  v50[274] = *MEMORY[0x1E4F22EA0];
  v51[274] = &unk_1F1863488;
  v50[275] = *MEMORY[0x1E4F22F40];
  v51[275] = &unk_1F18634A0;
  v50[276] = *MEMORY[0x1E4F22F08];
  v51[276] = &unk_1F18634B8;
  v50[277] = *MEMORY[0x1E4F22F10];
  v51[277] = &unk_1F18634D0;
  v50[278] = *MEMORY[0x1E4F22BD0];
  v51[278] = &unk_1F18634E8;
  v50[279] = *MEMORY[0x1E4F22BD8];
  v51[279] = &unk_1F1863500;
  v50[280] = *MEMORY[0x1E4F22B80];
  v51[280] = &unk_1F1863518;
  v50[281] = *MEMORY[0x1E4F22C20];
  v51[281] = &unk_1F1863530;
  v50[282] = *MEMORY[0x1E4F23118];
  v51[282] = &unk_1F1863548;
  v50[283] = *MEMORY[0x1E4F23110];
  v51[283] = &unk_1F1863560;
  v50[284] = *MEMORY[0x1E4F23108];
  v51[284] = &unk_1F1863578;
  v50[285] = *MEMORY[0x1E4F235B0];
  v51[285] = &unk_1F1863590;
  v50[286] = *MEMORY[0x1E4F22D60];
  v51[286] = &unk_1F18635A8;
  v50[287] = *MEMORY[0x1E4F23650];
  v51[287] = &unk_1F18635C0;
  v50[288] = *MEMORY[0x1E4F22EE8];
  v51[288] = &unk_1F18635D8;
  v50[289] = *MEMORY[0x1E4F22CD8];
  v51[289] = &unk_1F18635F0;
  v50[290] = *MEMORY[0x1E4F22DE0];
  v51[290] = &unk_1F1863608;
  v50[291] = *MEMORY[0x1E4F22EB8];
  v51[291] = &unk_1F1863620;
  v50[292] = *MEMORY[0x1E4F22D80];
  v51[292] = &unk_1F1863638;
  v50[293] = *MEMORY[0x1E4F22ED8];
  v51[293] = &unk_1F1863650;
  v50[294] = *MEMORY[0x1E4F22EB0];
  v51[294] = &unk_1F1863668;
  v50[295] = *MEMORY[0x1E4F22EC0];
  v51[295] = &unk_1F1863680;
  v50[296] = *MEMORY[0x1E4F22F18];
  v51[296] = &unk_1F1863698;
  v50[297] = *MEMORY[0x1E4F22F28];
  v51[297] = &unk_1F18636B0;
  v50[298] = *MEMORY[0x1E4F22F00];
  v51[298] = &unk_1F18636C8;
  v50[299] = *MEMORY[0x1E4F22D98];
  v51[299] = &unk_1F18636E0;
  v50[300] = *MEMORY[0x1E4F23120];
  v51[300] = &unk_1F18636F8;
  v50[301] = *MEMORY[0x1E4F22B48];
  v51[301] = &unk_1F1863710;
  v50[302] = *MEMORY[0x1E4F22A58];
  v51[302] = &unk_1F1863728;
  v50[303] = *MEMORY[0x1E4F22B60];
  v51[303] = &unk_1F1863740;
  v50[304] = *MEMORY[0x1E4F22BC0];
  v51[304] = &unk_1F1863758;
  v50[305] = *MEMORY[0x1E4F22BE0];
  v51[305] = &unk_1F1863770;
  v50[306] = *MEMORY[0x1E4F22BB8];
  v51[306] = &unk_1F1863788;
  v50[307] = *MEMORY[0x1E4F22BA0];
  v51[307] = &unk_1F18637A0;
  v50[308] = *MEMORY[0x1E4F22BA8];
  v51[308] = &unk_1F18637B8;
  v50[309] = *MEMORY[0x1E4F22B98];
  v51[309] = &unk_1F18637D0;
  v50[310] = *MEMORY[0x1E4F22BB0];
  v51[310] = &unk_1F18637E8;
  v50[311] = *MEMORY[0x1E4F22BC8];
  v51[311] = &unk_1F1863800;
  v50[312] = *MEMORY[0x1E4F22B90];
  v51[312] = &unk_1F1863818;
  v50[313] = *MEMORY[0x1E4F22B88];
  v51[313] = &unk_1F1863830;
  v50[314] = *MEMORY[0x1E4F22C88];
  v51[314] = &unk_1F1863848;
  v50[315] = *MEMORY[0x1E4F22C80];
  v51[315] = &unk_1F1863860;
  v50[316] = *MEMORY[0x1E4F22CA8];
  v51[316] = &unk_1F1863878;
  v50[317] = *MEMORY[0x1E4F22D70];
  v51[317] = &unk_1F1863890;
  v50[318] = *MEMORY[0x1E4F23388];
  v51[318] = &unk_1F18638A8;
  v50[319] = *MEMORY[0x1E4F23668];
  v51[319] = &unk_1F18638C0;
  v50[320] = *MEMORY[0x1E4F234B8];
  v51[320] = &unk_1F18638D8;
  v50[321] = *MEMORY[0x1E4F22F58];
  v51[321] = &unk_1F18638F0;
  v50[322] = *MEMORY[0x1E4F22F78];
  v51[322] = &unk_1F1863908;
  v50[323] = *MEMORY[0x1E4F22F60];
  v51[323] = &unk_1F1863920;
  v50[324] = *MEMORY[0x1E4F22F80];
  v51[324] = &unk_1F1863938;
  v50[325] = *MEMORY[0x1E4F22F88];
  v51[325] = &unk_1F1863950;
  v50[326] = *MEMORY[0x1E4F22F48];
  v51[326] = &unk_1F1863968;
  v50[327] = *MEMORY[0x1E4F22F68];
  v51[327] = &unk_1F1863980;
  v50[328] = *MEMORY[0x1E4F22F70];
  v51[328] = &unk_1F1863998;
  v50[329] = *MEMORY[0x1E4F22F90];
  v51[329] = &unk_1F18639B0;
  v50[330] = *MEMORY[0x1E4F22F50];
  v51[330] = &unk_1F18639C8;
  v50[331] = *MEMORY[0x1E4F22CB0];
  v51[331] = &unk_1F18639E0;
  v50[332] = *MEMORY[0x1E4F234B0];
  v51[332] = &unk_1F18639F8;
  v50[333] = *MEMORY[0x1E4F22C08];
  v51[333] = &unk_1F1863A10;
  v50[334] = *MEMORY[0x1E4F23060];
  v51[334] = &unk_1F1863A28;
  v50[335] = *MEMORY[0x1E4F22FD0];
  v51[335] = &unk_1F1863A40;
  v50[336] = *MEMORY[0x1E4F23158];
  v51[336] = &unk_1F1863A58;
  v50[337] = *MEMORY[0x1E4F23418];
  v51[337] = &unk_1F1863A70;
  v50[338] = *MEMORY[0x1E4F23428];
  v51[338] = &unk_1F1863A88;
  v50[339] = *MEMORY[0x1E4F23420];
  v51[339] = &unk_1F1863AA0;
  v50[340] = *MEMORY[0x1E4F23430];
  v51[340] = &unk_1F1863AB8;
  v50[341] = *MEMORY[0x1E4F23038];
  v51[341] = &unk_1F1863AD0;
  v50[342] = *MEMORY[0x1E4F231A8];
  v51[342] = &unk_1F1863AE8;
  v50[343] = *MEMORY[0x1E4F22C50];
  v51[343] = &unk_1F1863B00;
  v50[344] = *MEMORY[0x1E4F236C0];
  v51[344] = &unk_1F1863B18;
  v50[345] = *MEMORY[0x1E4F236B0];
  v51[345] = &unk_1F1863B30;
  v50[346] = *MEMORY[0x1E4F236B8];
  v51[346] = &unk_1F1863B48;
  v50[347] = *MEMORY[0x1E4F23410];
  v51[347] = &unk_1F1863B60;
  v50[348] = *MEMORY[0x1E4F234C8];
  v51[348] = &unk_1F1863B78;
  v50[349] = *MEMORY[0x1E4F22A98];
  v51[349] = &unk_1F1863B90;
  v50[350] = *MEMORY[0x1E4F23700];
  v51[350] = &unk_1F1863BA8;
  v50[351] = *MEMORY[0x1E4F236F8];
  v51[351] = &unk_1F1863BC0;
  v50[352] = *MEMORY[0x1E4F23140];
  v51[352] = &unk_1F1863BD8;
  v50[353] = *MEMORY[0x1E4F23710];
  v51[353] = &unk_1F1863BF0;
  v50[354] = *MEMORY[0x1E4F23740];
  v51[354] = &unk_1F1863C08;
  v50[355] = *MEMORY[0x1E4F23748];
  v51[355] = &unk_1F1863C20;
  v50[356] = *MEMORY[0x1E4F234C0];
  v51[356] = &unk_1F1863C38;
  v50[357] = *MEMORY[0x1E4F22AE0];
  v51[357] = &unk_1F1863C50;
  v50[358] = *MEMORY[0x1E4F233C8];
  v51[358] = &unk_1F1863C68;
  v50[359] = *MEMORY[0x1E4F22A38];
  v51[359] = &unk_1F1863C80;
  v50[360] = *MEMORY[0x1E4F23000];
  v51[360] = &unk_1F1863C98;
  v50[361] = *MEMORY[0x1E4F236E8];
  v51[361] = &unk_1F1863CB0;
  v50[362] = *MEMORY[0x1E4F23728];
  v51[362] = &unk_1F1863CC8;
  v50[363] = *MEMORY[0x1E4F23720];
  v51[363] = &unk_1F1863CE0;
  v50[364] = *MEMORY[0x1E4F23718];
  v51[364] = &unk_1F1863CF8;
  v50[365] = *MEMORY[0x1E4F237B0];
  v51[365] = &unk_1F1863D10;
  v50[366] = *MEMORY[0x1E4F23048];
  v51[366] = &unk_1F1863D28;
  v50[367] = *MEMORY[0x1E4F231B8];
  v51[367] = &unk_1F1863D40;
  v50[368] = *MEMORY[0x1E4F23050];
  v51[368] = &unk_1F1863D58;
  v50[369] = *MEMORY[0x1E4F231C0];
  v51[369] = &unk_1F1863D70;
  v50[370] = *MEMORY[0x1E4F23030];
  v51[370] = &unk_1F1863D88;
  v50[371] = *MEMORY[0x1E4F231A0];
  v51[371] = &unk_1F1863DA0;
  v50[372] = *MEMORY[0x1E4F23040];
  v51[372] = &unk_1F1863DB8;
  v50[373] = *MEMORY[0x1E4F231B0];
  v51[373] = &unk_1F1863DD0;
  v50[374] = *MEMORY[0x1E4F236D8];
  v51[374] = &unk_1F1863DE8;
  v50[375] = *MEMORY[0x1E4F22CC8];
  v51[375] = &unk_1F1863E00;
  v50[376] = *MEMORY[0x1E4F22C40];
  v51[376] = &unk_1F1863E18;
  v50[377] = *MEMORY[0x1E4F23608];
  v51[377] = &unk_1F1863E30;
  v50[378] = *MEMORY[0x1E4F236C8];
  v51[378] = &unk_1F1863E48;
  v50[379] = *MEMORY[0x1E4F236D0];
  v51[379] = &unk_1F1863E60;
  v50[380] = *MEMORY[0x1E4F22FE8];
  v51[380] = &unk_1F1863E78;
  v50[381] = *MEMORY[0x1E4F230D8];
  v51[381] = &unk_1F1863E90;
  v50[382] = *MEMORY[0x1E4F22FD8];
  v51[382] = &unk_1F1863EA8;
  v50[383] = *MEMORY[0x1E4F235E0];
  v51[383] = &unk_1F1863EC0;
  uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:384];
  uint64_t v49 = (void *)rankingAttributeIndexForName_attributeToRankingIndexMap;
  rankingAttributeIndexForName_attributeToRankingIndexMap = v48;
}

void *SSCompactRankingAttrsAlloc(uint64_t a1)
{
  uint64_t result = malloc_type_calloc(1uLL, 8 * a1 + 152, 0x6D73363EuLL);
  *uint64_t result = -1;
  return result;
}

void SSCompactRankingAttrsDealloc(char *a1)
{
  if (!a1) {
    return;
  }
  unsigned int v2 = 0;
  uint64_t v3 = (int8x8_t *)(a1 + 8);
  do
  {
    uint64_t v4 = 1 << v2;
    if (v2 < 0x40)
    {
      uint64_t v5 = *((void *)a1 + 1);
      if ((v5 & v4) == 0) {
        goto LABEL_24;
      }
      unsigned __int8 v6 = 0;
      uint64_t v7 = 0;
      goto LABEL_19;
    }
    if (v2 < 0x140) {
      char v8 = 4;
    }
    else {
      char v8 = 5;
    }
    if (v2 < 0x100) {
      char v8 = 3;
    }
    if (v2 < 0xC0) {
      char v8 = 2;
    }
    if (v2 >= 0x80) {
      unsigned __int8 v6 = v8;
    }
    else {
      unsigned __int8 v6 = 1;
    }
    uint64_t v5 = *(void *)&a1[8 * v6 + 8];
    if ((v5 & v4) != 0)
    {
      uint64_t v7 = 0;
      uint64_t v9 = v6;
      uint64_t v10 = v3;
      do
      {
        int8x8_t v11 = *v10++;
        uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
        v12.i16[0] = vaddlv_u8(v12);
        v7 += v12.u32[0];
        --v9;
      }
      while (v9);
LABEL_19:
      uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)(v5 & (v4 - 1)));
      v13.i16[0] = vaddlv_u8(v13);
      uint64_t v14 = v13.u32[0] + v7;
      if (v14 >= 0)
      {
        if ((*(void *)&a1[8 * v6 + 56] & v4) != 0)
        {
          free(*(void **)&a1[8 * v14 + 152]);
        }
        else if ((*(void *)&a1[8 * v6 + 104] & v4) != 0)
        {
          CFRelease(*(CFTypeRef *)&a1[8 * v14 + 152]);
        }
      }
    }
LABEL_24:
    ++v2;
  }
  while (v2 != 384);
  free(a1);
}

int8x8_t *SSCompactRankingAttrsCopy(uint64_t a1)
{
  if (a1)
  {
    uint8x8_t v2 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 40));
    v2.i16[0] = vaddlv_u8(v2);
    uint8x8_t v3 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 48));
    v3.i16[0] = vaddlv_u8(v3);
    size_t v4 = 8
       * (vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 24))))))+ v2.u32[0]+ v3.u32[0])+ 152;
    uint64_t v5 = (int8x8_t *)malloc_type_calloc(1uLL, v4, 0x6D73363EuLL);
    *uint64_t v5 = (int8x8_t)-1;
    memcpy(v5, (const void *)a1, v4);
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = 1 << v6;
      if (v6 >= 0x40) {
        break;
      }
      int8x8_t v8 = v5[1];
      if ((*(void *)&v8 & v7) != 0)
      {
        unsigned __int8 v9 = 0;
        uint64_t v10 = 0;
LABEL_19:
        uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v8 & (v7 - 1)));
        v16.i16[0] = vaddlv_u8(v16);
        uint64_t v17 = v16.u32[0] + v10;
        if (v17 >= 0)
        {
          if ((*(void *)(a1 + 8 * v9 + 56) & v7) != 0)
          {
            int v18 = _SpotlightDefineRankingTypes_[v6];
            if (v18 != 16)
            {
              if (v18 == 32)
              {
                uint64_t v23 = *(uint64_t **)(a1 + 8 * v17 + 152);
                uint64_t v24 = *v23;
                size_t v25 = 8 * *v23;
                uint64_t v26 = malloc_type_malloc(v25 + 8, 0xA249111uLL);
                void *v26 = v24;
                memcpy(v26 + 1, v23 + 1, v25);
                v5[v17 + 19] = (int8x8_t)v26;
              }
              else
              {
                if (v18 != 64) {
                  SSCompactRankingAttrsCopy_cold_1();
                }
                uint64_t v19 = *(uint64_t **)(a1 + 8 * v17 + 152);
                uint64_t v20 = *v19;
                uint64_t v21 = v19[1];
                uint64_t v22 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
                *uint64_t v22 = v20;
                v22[1] = v21;
                v5[v17 + 19] = (int8x8_t)v22;
              }
            }
          }
          else if ((*(void *)(a1 + 8 * v9 + 104) & v7) != 0)
          {
            CFRetain(*(CFTypeRef *)(a1 + 8 * v17 + 152));
          }
        }
      }
LABEL_28:
      if (++v6 == 384) {
        return v5;
      }
    }
    if (v6 < 0x140) {
      char v11 = 4;
    }
    else {
      char v11 = 5;
    }
    if (v6 < 0x100) {
      char v11 = 3;
    }
    if (v6 < 0xC0) {
      char v11 = 2;
    }
    if (v6 >= 0x80) {
      unsigned __int8 v9 = v11;
    }
    else {
      unsigned __int8 v9 = 1;
    }
    int8x8_t v8 = v5[v9 + 1];
    if ((*(void *)&v8 & v7) == 0) {
      goto LABEL_28;
    }
    uint64_t v10 = 0;
    uint64_t v12 = v9;
    uint8x8_t v13 = v5 + 1;
    do
    {
      int8x8_t v14 = *v13++;
      uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
      v15.i16[0] = vaddlv_u8(v15);
      v10 += v15.u32[0];
      --v12;
    }
    while (v12);
    goto LABEL_19;
  }
  return 0;
}

void SSCompactRankingAttrsAddValue(int8x8_t *a1, unint64_t a2, void *a3)
{
  id v6 = a3;
  switch(_SpotlightDefineRankingTypes_[a2])
  {
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_3;
      }
      break;
    default:
LABEL_3:
      uint64_t v5 = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 0, 1);
      if (v5 != -1) {
        a1[v5 + 19] = (int8x8_t)v6;
      }
      break;
  }
}

uint64_t _SSCompactRankingAttrsDataIndexForInsert(int8x8_t *a1, unint64_t a2, int a3, int a4)
{
  if (*(void *)a1 >= (int64_t)a2) {
    return -1;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(a1[1]);
  v4.i16[0] = vaddlv_u8(v4);
  uint64_t v5 = v4.u32[0];
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(a1[2]);
  v6.i16[0] = vaddlv_u8(v6);
  uint64_t v7 = v6.u32[0];
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(a1[3]);
  v8.i16[0] = vaddlv_u8(v8);
  uint64_t v9 = v8.u32[0];
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(a1[4]);
  v10.i16[0] = vaddlv_u8(v10);
  uint64_t v11 = v10.u32[0];
  uint8x8_t v12 = (uint8x8_t)vcnt_s8(a1[5]);
  v12.i16[0] = vaddlv_u8(v12);
  uint64_t v13 = v12.u32[0];
  uint8x8_t v14 = (uint8x8_t)vcnt_s8(a1[6]);
  v14.i16[0] = vaddlv_u8(v14);
  uint64_t v15 = v7 + v5 + v9 + v11 + v13 + v14.u32[0];
  uint64_t v16 = 1 << a2;
  uint64_t v17 = 1;
  uint64_t v18 = 2;
  uint64_t v19 = 3;
  uint64_t v20 = 4;
  if (a2 >= 0x140) {
    uint64_t v20 = 5;
  }
  if (a2 >= 0x100) {
    uint64_t v19 = v20;
  }
  if (a2 >= 0xC0) {
    uint64_t v18 = v19;
  }
  if (a2 >= 0x80) {
    uint64_t v17 = v18;
  }
  if ((uint64_t)a2 < 64) {
    uint64_t v17 = 0;
  }
  uint64_t v21 = &a1[v17];
  *(void *)&v21[1] |= v16;
  if (a3)
  {
    uint64_t v22 = v21 + 7;
LABEL_16:
    *(void *)v22 |= v16;
    goto LABEL_17;
  }
  if (a4)
  {
    uint64_t v22 = &a1[v17 + 13];
    goto LABEL_16;
  }
LABEL_17:
  *a1 = (int8x8_t)a2;
  return v15;
}

uint64_t SSCompactRankingAttrsAddFloat(int8x8_t *a1, unint64_t a2, float a3)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0) {
    SSCompactRankingAttrsAddFloat_cold_1();
  }
  uint64_t result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 0, 0);
  if (result != -1) {
    *(float *)a1[result + 19].i32 = a3;
  }
  return result;
}

uint64_t SSCompactRankingAttrsAddInt64Array(int8x8_t *a1, unint64_t a2, const void *a3, int a4)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0) {
    SSCompactRankingAttrsAddInt64Array_cold_1();
  }
  uint8x8_t v8 = malloc_type_malloc(8 * (a4 + 1), 0x100004000313F17uLL);
  *uint8x8_t v8 = a4;
  memcpy(v8 + 1, a3, 8 * a4);
  uint64_t result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (result != -1) {
    a1[result + 19] = (int8x8_t)v8;
  }
  return result;
}

void SSCompactRankingAttrsAddInt64ArrayFromNSArray(int8x8_t *a1, unint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0) {
    SSCompactRankingAttrsAddInt64ArrayFromNSArray_cold_1();
  }
  uint8x8_t v6 = v5;
  uint64_t v7 = [v5 count];
  uint8x8_t v8 = malloc_type_malloc(8 * v7 + 8, 0x100004000313F17uLL);
  *uint8x8_t v8 = v7;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    int v13 = 1;
    do
    {
      uint64_t v14 = 0;
      int v15 = v13;
      uint64_t v16 = &v8[v13];
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v16[v14] = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "integerValue", (void)v18);
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int v13 = v15 + v14;
    }
    while (v11);
  }

  uint64_t v17 = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (v17 != -1) {
    a1[v17 + 19] = (int8x8_t)v8;
  }
}

uint64_t SSCompactRankingAttrsAddInt128(int8x8_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0) {
    SSCompactRankingAttrsAddInt128_cold_1();
  }
  uint8x8_t v8 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  *uint8x8_t v8 = a3;
  v8[1] = a4;
  uint64_t result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (result != -1) {
    a1[result + 19] = (int8x8_t)v8;
  }
  return result;
}

void SSCompactRankingAttrsUpdateValue(int8x8_t *a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v6 = 1 << a2;
  if ((uint64_t)a2 < 64)
  {
    int8x8_t v7 = a1[1];
    if ((*(void *)&v7 & v6) == 0) {
      goto LABEL_19;
    }
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (a2 >= 0x140) {
    uint64_t v11 = 5;
  }
  if (a2 >= 0x100) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0xC0) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x80) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 1;
  }
  int8x8_t v7 = a1[v12 + 1];
  if ((*(void *)&v7 & v6) != 0)
  {
    uint64_t v8 = 0;
    int v13 = a1 + 1;
    do
    {
      int8x8_t v14 = *v13++;
      uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
      v15.i16[0] = vaddlv_u8(v15);
      v8 += v15.u32[0];
      --v12;
    }
    while (v12);
LABEL_17:
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v7 & (v6 - 1)));
    v16.i16[0] = vaddlv_u8(v16);
    uint64_t v17 = v16.u32[0] + v8;
    if (v17 != -1)
    {
      long long v18 = &a1[v17];
      id v19 = v5;
      CFRelease(*(CFTypeRef *)&v18[19]);
      v18[19] = (int8x8_t)v19;
      id v5 = v19;
    }
  }
LABEL_19:
}

int8x8_t *SSCompactRankingAttrsUpdateFloat(int8x8_t *result, unint64_t a2, float a3)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0) {
    SSCompactRankingAttrsUpdateFloat_cold_1();
  }
  if (result)
  {
    uint64_t v3 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      int8x8_t v4 = result[1];
      if ((*(void *)&v4 & v3) == 0) {
        return result;
      }
      uint64_t v5 = 0;
      goto LABEL_18;
    }
    uint64_t v6 = 2;
    uint64_t v7 = 3;
    uint64_t v8 = 4;
    if (a2 >= 0x140) {
      uint64_t v8 = 5;
    }
    if (a2 >= 0x100) {
      uint64_t v7 = v8;
    }
    if (a2 >= 0xC0) {
      uint64_t v6 = v7;
    }
    if (a2 >= 0x80) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 1;
    }
    int8x8_t v4 = result[v9 + 1];
    if ((*(void *)&v4 & v3) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v10 = result + 1;
      do
      {
        int8x8_t v11 = *v10++;
        uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
        v12.i16[0] = vaddlv_u8(v12);
        v5 += v12.u32[0];
        --v9;
      }
      while (v9);
LABEL_18:
      uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v4 & (v3 - 1)));
      v13.i16[0] = vaddlv_u8(v13);
      uint64_t v14 = v13.u32[0] + v5;
      if (v14 != -1) {
        *(float *)result[v14 + 19].i32 = a3;
      }
    }
  }
  return result;
}

void SSCompactRankingAttrsUpdateInt64Array(int8x8_t *a1, unint64_t a2, const void *a3, int a4)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0) {
    SSCompactRankingAttrsUpdateInt64Array_cold_1();
  }
  if (a1)
  {
    uint64_t v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      int8x8_t v8 = a1[1];
      if ((*(void *)&v8 & v7) == 0) {
        return;
      }
      uint64_t v9 = 0;
      goto LABEL_18;
    }
    uint64_t v10 = 2;
    uint64_t v11 = 3;
    uint64_t v12 = 4;
    if (a2 >= 0x140) {
      uint64_t v12 = 5;
    }
    if (a2 >= 0x100) {
      uint64_t v11 = v12;
    }
    if (a2 >= 0xC0) {
      uint64_t v10 = v11;
    }
    if (a2 >= 0x80) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 1;
    }
    int8x8_t v8 = a1[v13 + 1];
    if ((*(void *)&v8 & v7) != 0)
    {
      uint64_t v9 = 0;
      uint64_t v14 = a1 + 1;
      do
      {
        int8x8_t v15 = *v14++;
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
        v16.i16[0] = vaddlv_u8(v16);
        v9 += v16.u32[0];
        --v13;
      }
      while (v13);
LABEL_18:
      uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v8 & (v7 - 1)));
      v17.i16[0] = vaddlv_u8(v17);
      uint64_t v18 = v17.u32[0] + v9;
      if (v18 != -1)
      {
        id v19 = malloc_type_malloc(8 * (a4 + 1), 0x100004000313F17uLL);
        *id v19 = a4;
        memcpy(v19 + 1, a3, 8 * a4);
        long long v20 = &a1[v18];
        free(*(void **)&v20[19]);
        v20[19] = (int8x8_t)v19;
      }
    }
  }
}

void SSCompactRankingAttrsUpdateInt64ArrayFromNSArray(int8x8_t *a1, unint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0) {
    SSCompactRankingAttrsUpdateInt64ArrayFromNSArray_cold_1();
  }
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      int8x8_t v8 = a1[1];
      if ((*(void *)&v8 & v7) == 0) {
        goto LABEL_27;
      }
      uint64_t v9 = 0;
      goto LABEL_18;
    }
    uint64_t v10 = 2;
    uint64_t v11 = 3;
    uint64_t v12 = 4;
    if (a2 >= 0x140) {
      uint64_t v12 = 5;
    }
    if (a2 >= 0x100) {
      uint64_t v11 = v12;
    }
    if (a2 >= 0xC0) {
      uint64_t v10 = v11;
    }
    if (a2 >= 0x80) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 1;
    }
    int8x8_t v8 = a1[v13 + 1];
    if ((*(void *)&v8 & v7) != 0)
    {
      uint64_t v9 = 0;
      uint64_t v14 = a1 + 1;
      do
      {
        int8x8_t v15 = *v14++;
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
        v16.i16[0] = vaddlv_u8(v16);
        v9 += v16.u32[0];
        --v13;
      }
      while (v13);
LABEL_18:
      uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v8 & (v7 - 1)));
      v17.i16[0] = vaddlv_u8(v17);
      uint64_t v18 = v17.u32[0] + v9;
      if (v18 != -1)
      {
        uint64_t v19 = [v5 count];
        long long v20 = malloc_type_malloc(8 * v19 + 8, 0x100004000313F17uLL);
        *long long v20 = v19;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v21 = v6;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v31;
          int v25 = 1;
          do
          {
            uint64_t v26 = 0;
            int v27 = v25;
            uint64_t v28 = &v20[v25];
            do
            {
              if (*(void *)v31 != v24) {
                objc_enumerationMutation(v21);
              }
              v28[v26] = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v26), "integerValue", (void)v30);
              ++v26;
            }
            while (v23 != v26);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
            int v25 = v27 + v26;
          }
          while (v23);
        }

        uint64_t v29 = &a1[v18];
        free(*(void **)&v29[19]);
        v29[19] = (int8x8_t)v20;
      }
    }
  }
LABEL_27:
}

void SSCompactRankingAttrsUpdateInt128(int8x8_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0) {
    SSCompactRankingAttrsUpdateInt128_cold_1();
  }
  if (a1)
  {
    uint64_t v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      int8x8_t v8 = a1[1];
      if ((*(void *)&v8 & v7) == 0) {
        return;
      }
      uint64_t v9 = 0;
      goto LABEL_18;
    }
    uint64_t v10 = 2;
    uint64_t v11 = 3;
    uint64_t v12 = 4;
    if (a2 >= 0x140) {
      uint64_t v12 = 5;
    }
    if (a2 >= 0x100) {
      uint64_t v11 = v12;
    }
    if (a2 >= 0xC0) {
      uint64_t v10 = v11;
    }
    if (a2 >= 0x80) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 1;
    }
    int8x8_t v8 = a1[v13 + 1];
    if ((*(void *)&v8 & v7) != 0)
    {
      uint64_t v9 = 0;
      uint64_t v14 = a1 + 1;
      do
      {
        int8x8_t v15 = *v14++;
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
        v16.i16[0] = vaddlv_u8(v16);
        v9 += v16.u32[0];
        --v13;
      }
      while (v13);
LABEL_18:
      uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v8 & (v7 - 1)));
      v17.i16[0] = vaddlv_u8(v17);
      uint64_t v18 = v17.u32[0] + v9;
      if (v18 != -1)
      {
        uint64_t v19 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        *uint64_t v19 = a3;
        v19[1] = a4;
        long long v20 = &a1[v18];
        free(*(void **)&v20[19]);
        v20[19] = (int8x8_t)v19;
      }
    }
  }
}

int8x8_t *SSCompactRankingAttrsDoesItemExist(int8x8_t *result, unint64_t a2)
{
  if (result)
  {
    uint64_t v2 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      uint64_t v5 = 2;
      uint64_t v6 = 3;
      uint64_t v7 = 4;
      if (a2 >= 0x140) {
        uint64_t v7 = 5;
      }
      if (a2 >= 0x100) {
        uint64_t v6 = v7;
      }
      if (a2 >= 0xC0) {
        uint64_t v5 = v6;
      }
      if (a2 >= 0x80) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = 1;
      }
      int8x8_t v3 = result[v8 + 1];
      if ((*(void *)&v3 & v2) != 0)
      {
        uint64_t v4 = 0;
        uint64_t v9 = result + 1;
        do
        {
          int8x8_t v10 = *v9++;
          uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
          v11.i16[0] = vaddlv_u8(v11);
          v4 += v11.u32[0];
          --v8;
        }
        while (v8);
        goto LABEL_17;
      }
    }
    else
    {
      int8x8_t v3 = result[1];
      if ((*(void *)&v3 & v2) != 0)
      {
        uint64_t v4 = 0;
LABEL_17:
        uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v3 & (v2 - 1)));
        v12.i16[0] = vaddlv_u8(v12);
        return (int8x8_t *)(v12.u32[0] + v4 >= 0);
      }
    }
    return 0;
  }
  return result;
}

int8x8_t *SSCompactRankingAttrsGetValue(int8x8_t *a1, unint64_t a2)
{
  if (!a1) {
    return a1;
  }
  uint64_t v2 = 1 << a2;
  if ((uint64_t)a2 >= 64)
  {
    uint64_t v5 = 2;
    uint64_t v6 = 3;
    uint64_t v7 = 4;
    if (a2 >= 0x140) {
      uint64_t v7 = 5;
    }
    if (a2 >= 0x100) {
      uint64_t v6 = v7;
    }
    if (a2 >= 0xC0) {
      uint64_t v5 = v6;
    }
    if (a2 >= 0x80) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 1;
    }
    int8x8_t v3 = a1[v8 + 1];
    if ((*(void *)&v3 & v2) == 0) {
      return (int8x8_t *)0;
    }
    uint64_t v4 = 0;
    uint64_t v9 = a1 + 1;
    do
    {
      int8x8_t v10 = *v9++;
      uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
      v11.i16[0] = vaddlv_u8(v11);
      v4 += v11.u32[0];
      --v8;
    }
    while (v8);
  }
  else
  {
    int8x8_t v3 = a1[1];
    if ((*(void *)&v3 & v2) == 0) {
      return (int8x8_t *)0;
    }
    uint64_t v4 = 0;
  }
  uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v3 & (v2 - 1)));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] + v4 >= 0)
  {
    a1 = (int8x8_t *)a1[v12.u32[0] + 19 + v4];
    return a1;
  }
  return (int8x8_t *)0;
}

uint64_t SSCompactRankingAttrsGetFloat(uint64_t result, unint64_t a2, _DWORD *a3)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0) {
    SSCompactRankingAttrsGetFloat_cold_1();
  }
  if (result)
  {
    uint64_t v3 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      uint64_t v6 = 2;
      uint64_t v7 = 3;
      uint64_t v8 = 4;
      if (a2 >= 0x140) {
        uint64_t v8 = 5;
      }
      if (a2 >= 0x100) {
        uint64_t v7 = v8;
      }
      if (a2 >= 0xC0) {
        uint64_t v6 = v7;
      }
      if (a2 >= 0x80) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 1;
      }
      uint64_t v4 = *(void *)(result + 8 * v9 + 8);
      if ((v4 & v3) != 0)
      {
        uint64_t v5 = 0;
        int8x8_t v10 = (int8x8_t *)(result + 8);
        do
        {
          int8x8_t v11 = *v10++;
          uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
          v12.i16[0] = vaddlv_u8(v12);
          v5 += v12.u32[0];
          --v9;
        }
        while (v9);
LABEL_18:
        uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)(v4 & (v3 - 1)));
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] + v5 >= 0)
        {
          *a3 = *(_DWORD *)(result + 8 * (v13.u32[0] + v5) + 152);
          return 1;
        }
      }
    }
    else
    {
      uint64_t v4 = *(void *)(result + 8);
      if ((v4 & v3) != 0)
      {
        uint64_t v5 = 0;
        goto LABEL_18;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetInt128(uint64_t result, unint64_t a2, void *a3)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0) {
    SSCompactRankingAttrsGetInt128_cold_1();
  }
  if (result)
  {
    uint64_t v3 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      uint64_t v6 = 2;
      uint64_t v7 = 3;
      uint64_t v8 = 4;
      if (a2 >= 0x140) {
        uint64_t v8 = 5;
      }
      if (a2 >= 0x100) {
        uint64_t v7 = v8;
      }
      if (a2 >= 0xC0) {
        uint64_t v6 = v7;
      }
      if (a2 >= 0x80) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 1;
      }
      uint64_t v4 = *(void *)(result + 8 * v9 + 8);
      if ((v4 & v3) != 0)
      {
        uint64_t v5 = 0;
        int8x8_t v10 = (int8x8_t *)(result + 8);
        do
        {
          int8x8_t v11 = *v10++;
          uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
          v12.i16[0] = vaddlv_u8(v12);
          v5 += v12.u32[0];
          --v9;
        }
        while (v9);
LABEL_18:
        uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)(v4 & (v3 - 1)));
        v13.i16[0] = vaddlv_u8(v13);
        uint64_t v14 = v13.u32[0] + v5;
        if (v14 >= 0)
        {
          uint64_t v15 = *(void *)(*(void *)(result + 8 * v14 + 152) + 8);
          *a3 = **(void **)(result + 8 * v14 + 152);
          a3[1] = v15;
          return 1;
        }
      }
    }
    else
    {
      uint64_t v4 = *(void *)(result + 8);
      if ((v4 & v3) != 0)
      {
        uint64_t v5 = 0;
        goto LABEL_18;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetArrayInt64(uint64_t result, unint64_t a2, void *__dst, int a4)
{
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0) {
    SSCompactRankingAttrsGetArrayInt64_cold_1();
  }
  if (result)
  {
    uint64_t v4 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      uint64_t v7 = 2;
      uint64_t v8 = 3;
      uint64_t v9 = 4;
      if (a2 >= 0x140) {
        uint64_t v9 = 5;
      }
      if (a2 >= 0x100) {
        uint64_t v8 = v9;
      }
      if (a2 >= 0xC0) {
        uint64_t v7 = v8;
      }
      if (a2 >= 0x80) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 1;
      }
      uint64_t v5 = *(void *)(result + 8 * v10 + 8);
      if ((v5 & v4) != 0)
      {
        uint64_t v6 = 0;
        int8x8_t v11 = (int8x8_t *)(result + 8);
        do
        {
          int8x8_t v12 = *v11++;
          uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
          v13.i16[0] = vaddlv_u8(v13);
          v6 += v13.u32[0];
          --v10;
        }
        while (v10);
LABEL_18:
        uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)(v5 & (v4 - 1)));
        v14.i16[0] = vaddlv_u8(v14);
        if (v14.u32[0] + v6 >= 0)
        {
          uint64_t v15 = *(void **)(result + 8 * (v14.u32[0] + v6) + 152);
          if (*v15 == a4)
          {
            memcpy(__dst, v15 + 1, 8 * *v15);
            return 1;
          }
        }
      }
    }
    else
    {
      uint64_t v5 = *(void *)(result + 8);
      if ((v5 & v4) != 0)
      {
        uint64_t v6 = 0;
        goto LABEL_18;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetCount(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = 0;
    int64x2_t v2 = 0uLL;
    do
    {
      int64x2_t v2 = (int64x2_t)vpadalq_u32((uint64x2_t)v2, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(result + 8 + v1)))));
      v1 += 16;
    }
    while (v1 != 32);
    return vaddvq_s64(v2);
  }
  return result;
}

void SSCompactRankingAttrsInsertValue(int8x8_t *a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  int v7 = _SpotlightDefineRankingTypes_[a2];
  if (v7 > 15)
  {
    switch(v7)
    {
      case 16:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 floatValue];
          SSCompactRankingAttrsAddFloat(a1, a2, v8);
        }
        break;
      case 32:
        id v9 = v5;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v9 count]
          && ([v9 objectAtIndexedSubscript:0],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v10,
              (isKindOfClass & 1) != 0))
        {
          SSCompactRankingAttrsAddInt64ArrayFromNSArray(a1, a2, v9);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v9;
            uint8x8_t v13 = (const void *)[v12 bytes];
            unint64_t v14 = [v12 length];

            SSCompactRankingAttrsAddInt64Array(a1, a2, v13, v14 >> 3);
          }
        }

        break;
      case 64:
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        ranking_index_score_init(&v15, v5);
        SSCompactRankingAttrsAddInt128(a1, a2, v15, v16);
        break;
    }
  }
  else if ((v7 - 8) < 6)
  {
    SSCompactRankingAttrsAddValue(a1, a2, v5);
  }
}

uint64_t _featureInfoEqual(id *a1, void *a2)
{
  return [*a1 isEqualToString:*a2];
}

CFHashCode _featureInfoHash(CFTypeRef *a1)
{
  return CFHash(*a1);
}

void sub_1BDBEA400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

BOOL getBoolFromFlaggedFeature(int a1, int a2, int a3)
{
  if (a1 == 1965) {
    int v3 = 4;
  }
  else {
    int v3 = a1 == 1931;
  }
  if (a1 == 1966) {
    unsigned int v4 = 2;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1 == 1854) {
    int v5 = 32;
  }
  else {
    int v5 = 0;
  }
  if (a1 == 1853) {
    int v6 = 8;
  }
  else {
    int v6 = v5;
  }
  if (a1 == 1852) {
    int v7 = 16;
  }
  else {
    int v7 = v6;
  }
  if (a1 <= 1930) {
    unsigned int v4 = v7;
  }
  return (a3 & (v4 >> 1)) != 0 && (v4 & a2) != 0;
}

void decodeRankingScores(unsigned __int8 *a1, int a2, char *__dst)
{
  memcpy(__dst, sDefaultScores, 0x328CuLL);
  if (a2)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    float v8 = a1;
    do
    {
      unsigned int v10 = *v8++;
      unsigned int v9 = v10;
      int v11 = v10 & 0xC0;
      unsigned int v12 = v10 & 0x3F;
      if (v11 == 64)
      {
        float v13 = (float)v12;
        if (v12 == 63) {
          float v13 = 2147500000.0;
        }
        *(float *)&__dst[4 * v6] = v13;
        goto LABEL_16;
      }
      if (v12)
      {
        unsigned int v14 = v9 & 0x1F;
        if ((v9 & 0x20) != 0)
        {
          float v8 = a1 + 2;
          unsigned int v14 = a1[1] | (v14 << 8);
        }
        if (v11)
        {
LABEL_11:
          if (v9 >= 0xC0) {
            bzero(&__dst[4 * v6], 4 * v14 + 4);
          }
          goto LABEL_15;
        }
      }
      else
      {
        unsigned int v14 = 0;
        if (v11) {
          goto LABEL_11;
        }
      }
      memcpy(&__dst[4 * v6], v8, 4 * v14 + 4);
      v8 += 4 * v14 + 4;
LABEL_15:
      v7 += v14;
LABEL_16:
      uint64_t v6 = (unsigned __int16)++v7;
      a1 = v8;
    }
    while ((unsigned __int16)v7 < 0xCA3u);
  }
}

void sub_1BDBECCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

id operatorCharacterSet()
{
  if (operatorCharacterSet_onceToken != -1) {
    dispatch_once(&operatorCharacterSet_onceToken, &__block_literal_global_49);
  }
  uint64_t v0 = (void *)operatorCharacterSet_operatorCharSet;
  return v0;
}

void __operatorCharacterSet_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"()/*+-"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)operatorCharacterSet_operatorCharSet;
  operatorCharacterSet_operatorCharSet = v0;
}

id suffixTrimSetForMathQueries()
{
  if (suffixTrimSetForMathQueries_onceToken != -1) {
    dispatch_once(&suffixTrimSetForMathQueries_onceToken, &__block_literal_global_33_0);
  }
  uint64_t v0 = (void *)suffixTrimSetForMathQueries_sMathCharacterSet;
  return v0;
}

void __suffixTrimSetForMathQueries_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  id v5 = (id)[v0 mutableCopy];

  uint64_t v1 = operatorCharacterSet();
  [v5 formUnionWithCharacterSet:v1];

  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v5 formUnionWithCharacterSet:v2];

  uint64_t v3 = [v5 copy];
  unsigned int v4 = (void *)suffixTrimSetForMathQueries_sMathCharacterSet;
  suffixTrimSetForMathQueries_sMathCharacterSet = v3;
}

uint64_t looksLikeMath(void *a1)
{
  id v1 = a1;
  if (looksLikeMath_onceToken != -1) {
    dispatch_once(&looksLikeMath_onceToken, &__block_literal_global_35);
  }
  uint64_t v2 = [v1 rangeOfCharacterFromSet:looksLikeMath_alphaCharacterSet];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v1 rangeOfCharacterFromSet:looksLikeMath_mathCharacterSet] != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      BOOL v6 = 1;
      goto LABEL_17;
    }
  }
  else if (v2 || v3 != [v1 length])
  {
    unsigned int v4 = suffixTrimSetForMathQueries();
    uint64_t v5 = [v1 rangeOfCharacterFromSet:v4];

    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != [v1 length] - 1) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = [v1 rangeOfCharacterFromSet:looksLikeMath_numbersCharacterSet options:8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v7 + v8;
    if (v7 + v8 < (unint64_t)[v1 length])
    {
      while (1)
      {
        uint64_t v10 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", looksLikeMath_xCharacterSet, 8, v9, objc_msgSend(v1, "length") - v9);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v12 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", looksLikeMath_numbersCharacterSet, 8, v10 + v11, objc_msgSend(v1, "length") - (v10 + v11));
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v14 = v12;
        uint64_t v9 = v12 + v13;
        if (v12 + v13 >= (unint64_t)[v1 length])
        {
          BOOL v6 = v14 != 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_17;
        }
      }
    }
  }
  BOOL v6 = 0;
LABEL_17:
  uint64_t v15 = v6 & ([v1 hasPrefix:@"0x"] ^ 1);

  return v15;
}

void __looksLikeMath_block_invoke()
{
  uint64_t v0 = suffixTrimSetForMathQueries();
  id v12 = (id)[v0 mutableCopy];

  id v1 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  [v12 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v12 copy];
  uint64_t v3 = (void *)looksLikeMath_mathCharacterSet;
  looksLikeMath_mathCharacterSet = v2;

  uint64_t v4 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v5 = (void *)looksLikeMath_alphaCharacterSet;
  looksLikeMath_alphaCharacterSet = v4;

  uint64_t v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"x"];
  uint64_t v7 = (void *)looksLikeMath_xCharacterSet;
  looksLikeMath_xCharacterSet = v6;

  uint64_t v8 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
  uint64_t v9 = (void *)looksLikeMath_numbersCharacterSet;
  looksLikeMath_numbersCharacterSet = v8;

  uint64_t v10 = (void *)looksLikeMath_numbersCharacterSet;
  uint64_t v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".,"];
  [v10 formUnionWithCharacterSet:v11];
}

BOOL looksLikeURL(void *a1)
{
  id v1 = a1;
  if ([v1 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  uint64_t v2 = [v1 rangeOfString:@"://"];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v1 substringFromIndex:v2 + v3];

    id v1 = (id)v4;
  }
  uint64_t v5 = [v1 rangeOfString:@"/"];
  if ([v1 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v1 substringToIndex:v5];

      id v1 = (id)v7;
    }
    uint64_t v8 = [v1 componentsSeparatedByString:@"."];
    uint64_t v9 = [v8 lastObject];

    BOOL v6 = _CFHostIsDomainTopLevel() != 0;
  }
  else
  {
LABEL_5:
    BOOL v6 = 0;
  }

  return v6;
}

BOOL hasDigit(void *a1)
{
  uint64_t v1 = hasDigit_digitsOnceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&hasDigit_digitsOnceToken, &__block_literal_global_58);
  }
  uint64_t v3 = [v2 rangeOfCharacterFromSet:hasDigit_digits];

  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __hasDigit_block_invoke()
{
  hasDigit_digits = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  return MEMORY[0x1F41817F8]();
}

id SSDisplayNameFuzzyQuery(void *a1, void *a2)
{
  uint64_t v3 = a2;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"cwdt";
  }
  id v5 = a1;
  BOOL v6 = [(__CFString *)v4 stringByAppendingString:@"f070"];
  uint64_t v7 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", *MEMORY[0x1E4F22CE8], v5, v6];

  return v7;
}

id SSDisplayNameAdditionsQuery(void *a1, void *a2, char a3)
{
  id v5 = a1;
  BOOL v6 = a2;
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"cwdt";
  }
  uint64_t v8 = NSString;
  if (a3)
  {
    uint64_t v9 = SSDisplayNameFuzzyQuery(v5, v7);
    uint64_t v10 = [v8 stringWithFormat:@"(kMDItemDisplayNameCorrections=\"%@*\"%@ || %@)", v5, @"cd", v9];
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"(kMDItemDisplayNameCorrections=\"%@*\"%@)", v5, @"cd"];
  }

  return v10;
}

id SSNormalizedQueryString(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_opt_new();
  uint64_t v3 = [v1 stringByFoldingWithOptions:385 locale:0];
  uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "length", (void)v14)) {
          [v2 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v2 componentsJoinedByString:@" "];

  return v12;
}

id SSEscapedStringForSearchQuery(void *a1)
{
  id v1 = [a1 decomposedStringWithCanonicalMapping];
  id v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\"", @"\\\"", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

BOOL SSStringStartsWithDoubleQuote(void *a1)
{
  id v1 = a1;
  if ([v1 length]) {
    BOOL v2 = [v1 characterAtIndex:0] == 34
  }
      || [v1 characterAtIndex:0] == 8220;
  else {
    BOOL v2 = 0;
  }

  return v2;
}

BOOL SSStringEndsWithDoubleQuote(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] < 2) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1) == 34
  }
      || objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1) == 8221;

  return v2;
}

uint64_t SSStringEndsWithSpace(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    BOOL v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v3 = objc_msgSend(v2, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1));
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id SSQueryEscapeString(void *a1, void *a2)
{
  uint64_t v3 = [a1 escapedStringForSearchQuery];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v5 = [v3 componentsSeparatedByCharactersInSet:v4];
    id v6 = [v5 mapNonEmpty:&__block_literal_global_83_0];

    id v7 = v6;
    *a2 = v7;
  }
  return v3;
}

id __SSQueryEscapeString_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id SSPhraseQueryEscapeString(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = SSStringStartsWithDoubleQuote(v3);
  BOOL v5 = SSStringEndsWithDoubleQuote(v3);
  if (v4)
  {
    if (v5) {
      objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    }
    else {
    id v7 = [v3 substringFromIndex:1];
    }
    id v6 = (void *)[v7 copy];
  }
  else
  {
    id v6 = (void *)[v3 copy];
  }
  uint64_t v8 = [v6 escapedStringForSearchQuery];
  if (a2)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v8 componentsSeparatedByCharactersInSet:v9];
    uint64_t v11 = [v10 mapNonEmpty:&__block_literal_global_85];

    id v12 = v11;
    *a2 = v12;
  }
  return v8;
}

id __SSPhraseQueryEscapeString_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id SSPhraseQueryUnquoteString(void *a1)
{
  id v1 = a1;
  BOOL v2 = SSStringStartsWithDoubleQuote(v1);
  BOOL v3 = SSStringEndsWithDoubleQuote(v1);
  if (v2)
  {
    if (v3) {
      objc_msgSend(v1, "substringWithRange:", 1, objc_msgSend(v1, "length") - 2);
    }
    else {
    BOOL v5 = [v1 substringFromIndex:1];
    }
    BOOL v4 = (void *)[v5 copy];
  }
  else
  {
    BOOL v4 = (void *)[v1 copy];
  }

  return v4;
}

id SSQueryDisplayNameFuzzyQuery(void *a1, void *a2)
{
  BOOL v3 = a2;
  if (v3) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = @"cwdt";
  }
  id v5 = a1;
  id v6 = [(__CFString *)v4 stringByAppendingString:@"f070"];

  id v7 = [NSString stringWithFormat:@"%@=\"%@*\"%@", *MEMORY[0x1E4F22CE8], v5, v6];

  return v7;
}

uint64_t findIndexOfFirstGreaterOrEqualInRange(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  while (a3 <= a4)
  {
    unint64_t v4 = (a4 + a3) >> 1;
    if (*(void *)(a2 + 8 * v4) >= a1)
    {
      if (a4 + a3 < 2) {
        return v4;
      }
      a4 = v4 - 1;
      if (*(void *)(a2 + 8 * (v4 - 1)) < a1) {
        return v4;
      }
    }
    else
    {
      a3 = v4 + 1;
    }
  }
  return 0x7FFFFFFFLL;
}

uint64_t findMin(uint64_t result, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  if (a2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = 0x7FFFFFFFLL;
    do
    {
      if (v4) {
        BOOL v7 = *(void *)(result + 8 * v4) >= v5;
      }
      else {
        BOOL v7 = 0;
      }
      if (!v7)
      {
        unint64_t v5 = *(void *)(result + 8 * v4);
        uint64_t v6 = v4;
      }
      ++v4;
    }
    while (a2 != v4);
  }
  else
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0x7FFFFFFFLL;
  }
  *a3 = v5;
  *a4 = v6;
  return result;
}

uint64_t minSpanLenContainingPair(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v4 = 0x7FFFFFFFLL;
  if (a2 && a4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v9 = *a3;
    BOOL v7 = a3 + 1;
    unint64_t v8 = v9;
    uint64_t v4 = -1;
    while (1)
    {
      unint64_t v10 = *(void *)(a1 + 8 * v5);
      while (1)
      {
        uint64_t v11 = v8 - v10;
        if (v10 > v8) {
          uint64_t v11 = v10 - v8;
        }
        if (v11 < v4 || v4 == -1) {
          uint64_t v4 = v11;
        }
        if (v10 < v8) {
          break;
        }
        if (a4 - 1 == v6) {
          return v4;
        }
        unint64_t v8 = v7[v6++];
      }
      if (v5 == a2 - 1) {
        break;
      }
      ++v5;
    }
  }
  return v4;
}

id PRSLogCategoryDefault()
{
  if (PRSLogCategoryDefault_onceToken != -1) {
    dispatch_once(&PRSLogCategoryDefault_onceToken, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)PRSLogCategoryDefault_defaultLog;
  return v0;
}

uint64_t __PRSLogCategoryDefault_block_invoke()
{
  PRSLogCategoryDefault_defaultLog = (uint64_t)os_log_create("com.apple.spotlight", "spotlight-services");
  return MEMORY[0x1F41817F8]();
}

id PRSLogCategoryAnonymousPipeline()
{
  if (PRSLogCategoryAnonymousPipeline_onceToken != -1) {
    dispatch_once(&PRSLogCategoryAnonymousPipeline_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)PRSLogCategoryAnonymousPipeline_anonymousPipelineLog;
  return v0;
}

uint64_t __PRSLogCategoryAnonymousPipeline_block_invoke()
{
  PRSLogCategoryAnonymousPipeline_anonymousPipelineLog = (uint64_t)os_log_create("com.apple.spotlight", "anonymous-pipeline");
  return MEMORY[0x1F41817F8]();
}

void sub_1BDBF4564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BDBF4C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void ranking_index_score_init(void *a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length] == 16)
    {
      BOOL v3 = (void *)[v5 bytes];
      uint64_t v4 = v3[1];
      *a1 = *v3;
      a1[1] = v4;
    }
  }
}

float getNumReviews(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (!v1)
  {
    float v16 = -1.0;
    goto LABEL_54;
  }
  unint64_t v3 = [v1 length];
  if (v3 < 2)
  {
    [v2 floatValue];
    float v16 = v17;
    goto LABEL_54;
  }
  unint64_t v4 = v3;
  unint64_t v5 = v3 - 1;
  uint64_t v6 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v7 = [v2 rangeOfCharacterFromSet:v6 options:4];

  if (v7 + 1 < v4) {
    uint64_t v8 = v7 + 1;
  }
  else {
    uint64_t v8 = v5;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = v8;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if (v9 <= v4) {
    unint64_t v11 = v4;
  }
  else {
    unint64_t v11 = v9;
  }
  while (v11 != v9)
  {
    char v12 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v2, "characterAtIndex:", v9));
    unint64_t v13 = v9 + 1;
    if (v5 != v9)
    {
      ++v9;
      if (v12) {
        continue;
      }
    }
    unint64_t v11 = v13 - 1;
    break;
  }
  int v14 = [v2 characterAtIndex:v11];
  if (v14 > 76)
  {
    if (v14 == 84)
    {
      float v15 = 1.0e12;
      goto LABEL_47;
    }
    if (v14 == 77)
    {
      float v15 = 1000000.0;
      goto LABEL_47;
    }
LABEL_27:
    float v15 = 1.0;
    if (v11 < v4)
    {
      uint64_t v18 = 0;
      while (1)
      {
        uint64_t v19 = sLargeNumberStringList[v18];
        if (![(__CFString *)v19 length])
        {

          float v15 = 1.0;
          goto LABEL_47;
        }
        long long v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v21 = [v20 localizedStringForKey:v19 value:&stru_1F1824018 table:@"LargeNumberMultipliers"];

        float v15 = 1.0;
        if (!v21 || ![v21 length] || (objc_msgSend(v21, "isEqualToString:", v19) & 1) != 0) {
          break;
        }
        if ([v21 length] + v11 <= v4)
        {
          uint64_t v22 = objc_msgSend(v2, "substringWithRange:", v11, objc_msgSend(v21, "length"));
          if ([v22 hasPrefix:v21])
          {
            uint64_t v23 = sLargeNumberMultiplierList[v18];
            if ([(__CFString *)v23 length])
            {
              uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              int v25 = [v24 localizedStringForKey:v23 value:&stru_1F1824018 table:@"LargeNumberMultipliers"];

              if (v25 && [v25 length] && (objc_msgSend(v25, "isEqualToString:", v23) & 1) == 0)
              {
                [v25 floatValue];
                float v15 = v26;
              }
            }
            break;
          }
        }
        if (++v18 == 5) {
          goto LABEL_47;
        }
      }
    }
    goto LABEL_47;
  }
  if (v14 == 66)
  {
    float v15 = 1000000000.0;
    goto LABEL_47;
  }
  if (v14 != 75) {
    goto LABEL_27;
  }
  float v15 = 1000.0;
LABEL_47:
  if (v11 >= v5) {
    unint64_t v27 = v5;
  }
  else {
    unint64_t v27 = v11;
  }
  if (v15 == 1.0) {
    unint64_t v28 = v27 + 1;
  }
  else {
    unint64_t v28 = v27;
  }
  uint64_t v29 = objc_msgSend(v2, "substringWithRange:", 0, v28);
  id v30 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  long long v31 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v30 setLocale:v31];

  [v30 setNumberStyle:1];
  long long v32 = [v30 numberFromString:v29];
  [v32 floatValue];
  float v16 = v15 * v33;

LABEL_54:
  return v16;
}

float getNumReviewsInParens(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  float NumReviews = -1.0;
  if (v1)
  {
    if ((unint64_t)[v1 length] >= 3)
    {
      int v4 = [v2 characterAtIndex:0];
      int v5 = objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1);
      if (v4 == 40 && v5 == 41)
      {
        uint64_t v6 = objc_msgSend(v2, "substringWithRange:", 1, objc_msgSend(v2, "length") - 2);
        float NumReviews = getNumReviews(v6);
      }
    }
  }

  return NumReviews;
}

float getReviewRating(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  float v3 = -1.0;
  if (v1
    && (unint64_t)[v1 length] >= 2
    && objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1) == 37)
  {
    int v4 = objc_msgSend(v2, "substringWithRange:", 0, objc_msgSend(v2, "length") - 1);
    int v5 = v4;
    if (v4 && [v4 length])
    {
      [v5 floatValue];
      float v3 = v6 * 0.01;
    }
  }
  return v3;
}

id getDetailedRowCardSection(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 inlineCard];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  float v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  if (!v7)
  {

    goto LABEL_8;
  }
  uint64_t v8 = (void *)v7;
  unint64_t v9 = [v3 inlineCard];
  unint64_t v10 = [v9 cardSections];
  unint64_t v11 = [v10 count];

  if (v11 <= a2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_10;
  }
  char v12 = [v3 inlineCard];
  unint64_t v13 = [v12 cardSections];
  int v5 = [v13 objectAtIndex:a2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v14 = v5;
LABEL_9:

LABEL_10:
  return v14;
}

id getDetailedRowCardSectionTitle(void *a1)
{
  id v1 = getDetailedRowCardSection(a1, 0);
  BOOL v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  id v3 = [v1 title];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = [v2 title];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    float v6 = [v2 title];
    id v3 = [v6 text];
  }
  else
  {
LABEL_5:
    id v3 = 0;
  }
LABEL_6:

  return v3;
}

id getDetailedRowCardSectionDescription(void *a1, unint64_t a2)
{
  id v3 = getDetailedRowCardSection(a1, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 descriptions];
    if (!v5) {
      goto LABEL_9;
    }
    float v6 = [v4 descriptions];
    unint64_t v7 = [v6 count];

    if (v7 > a2)
    {
      uint64_t v8 = [v4 descriptions];
      unint64_t v9 = [v8 objectAtIndex:a2];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v5 = [v9 text];
      }
      else
      {
        int v5 = 0;
      }

      goto LABEL_9;
    }
  }
  int v5 = 0;
LABEL_9:

  return v5;
}

id getDetailedRowCardSectionDescriptionRichText(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = getDetailedRowCardSection(a1, a2);
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 descriptions];
    if (!v6) {
      goto LABEL_9;
    }
    unint64_t v7 = [v5 descriptions];
    unint64_t v8 = [v7 count];

    if (v8 > a3)
    {
      unint64_t v9 = [v5 descriptions];
      unint64_t v10 = [v9 objectAtIndex:a3];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v10;
      }
      else {
        id v6 = 0;
      }

      goto LABEL_9;
    }
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

id getDetailedRowCardSectionFootnoteRichText(void *a1, unint64_t a2)
{
  BOOL v2 = getDetailedRowCardSection(a1, a2);
  id v3 = v2;
  if (v2 && ([v2 footnote], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    int v5 = [v3 footnote];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id getDetailedRowCardSectionDescriptionRichTextText(void *a1, unint64_t a2, unint64_t a3)
{
  id v3 = getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 text];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

id getDetailedRowCardSectionDescriptionFormattedText(void *a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  int v5 = getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 formattedTextPieces];
    if (!v7) {
      goto LABEL_9;
    }
    unint64_t v8 = [v6 formattedTextPieces];
    unint64_t v9 = [v8 count];

    if (v9 > a4)
    {
      unint64_t v10 = [v6 formattedTextPieces];
      unint64_t v11 = [v10 objectAtIndex:a4];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v7 = [v11 text];
      }
      else
      {
        unint64_t v7 = 0;
      }

      goto LABEL_9;
    }
  }
  unint64_t v7 = 0;
LABEL_9:

  return v7;
}

id getDetailedRowCardSectionDescriptionMultipleFormattedTexts(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v7 = getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  unint64_t v8 = v7;
  if (v7
    && ([v7 formattedTextPieces], unint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
    && ([v8 formattedTextPieces],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    char v12 = [v8 formattedTextPieces];
    uint64_t v13 = [v12 count] - 1;

    if (!a5)
    {
      id v14 = [v8 formattedTextPieces];
      a5 = [v14 count];
    }
    float v15 = [v8 formattedTextPieces];
    unint64_t v16 = [v15 count];

    if (v16 <= a4) {
      a4 = 0;
    }
    unint64_t v17 = a4 + a5;
    uint64_t v18 = [v8 formattedTextPieces];
    unint64_t v19 = [v18 count];

    if (v17 <= v19) {
      unint64_t v20 = v17;
    }
    else {
      unint64_t v20 = v13;
    }
    id v21 = objc_opt_new();
    if (a4 < v20)
    {
      do
      {
        uint64_t v22 = [v8 formattedTextPieces];
        uint64_t v23 = [v22 objectAtIndex:a4];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = [v23 text];
          if (v24)
          {
            int v25 = (void *)v24;
            float v26 = [v23 text];
            uint64_t v27 = [v26 length];

            if (v27)
            {
              unint64_t v28 = [v23 text];
              [v21 appendString:v28];
            }
          }
        }

        ++a4;
      }
      while (v20 != a4);
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

id getRichTitleCardSection(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 inlineCard];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  id v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  if (!v7)
  {

    goto LABEL_8;
  }
  unint64_t v8 = (void *)v7;
  unint64_t v9 = [v3 inlineCard];
  unint64_t v10 = [v9 cardSections];
  unint64_t v11 = [v10 count];

  if (v11 <= a2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_10;
  }
  char v12 = [v3 inlineCard];
  uint64_t v13 = [v12 cardSections];
  int v5 = [v13 objectAtIndex:a2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v14 = v5;
LABEL_9:

LABEL_10:
  return v14;
}

id getRichTitleCardSectionTitle(void *a1)
{
  id v1 = getRichTitleCardSection(a1, 0);
  BOOL v2 = v1;
  if (v1)
  {
    id v3 = [v1 title];

    if (v3)
    {
      id v3 = [v2 title];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id getRichTitleCardSectionSubtitle(void *a1)
{
  id v1 = getRichTitleCardSection(a1, 0);
  BOOL v2 = v1;
  if (v1)
  {
    id v3 = [v1 subtitle];

    if (v3)
    {
      id v3 = [v2 subtitle];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t getSocialMediaPostCardSection()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionName()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionPostRichText()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionPostFormattedText()
{
  return 0;
}

id getResultTitle(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 title];
  if (v2)
  {
    id v3 = [v1 title];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v5 = [v1 title];
      BOOL v2 = [v5 text];
    }
    else
    {
      BOOL v2 = 0;
    }
  }

  return v2;
}

id getResultURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 url];
  if (v2
    && (id v3 = (void *)v2,
        [v1 url],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        v3,
        (isKindOfClass & 1) != 0))
  {
    id v6 = [v1 url];
    uint64_t v7 = [v6 absoluteString];

    unint64_t v8 = [v1 url];
    unint64_t v9 = [v8 scheme];
    unint64_t v10 = [v7 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F1824018];

    unint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"://" withString:&stru_1F1824018];

    if (v11 && [v11 length]) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id getDescriptionCardSection(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 inlineCard];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  id v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  if (!v7)
  {

    goto LABEL_8;
  }
  unint64_t v8 = (void *)v7;
  unint64_t v9 = [v3 inlineCard];
  unint64_t v10 = [v9 cardSections];
  unint64_t v11 = [v10 count];

  if (v11 <= a2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_10;
  }
  id v12 = [v3 inlineCard];
  uint64_t v13 = [v12 cardSections];
  int v5 = [v13 objectAtIndex:a2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v14 = v5;
LABEL_9:

LABEL_10:
  return v14;
}

id getDescriptionCardSectionDescription(void *a1, unint64_t a2)
{
  uint64_t v2 = getDescriptionCardSection(a1, a2);
  id v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  uint64_t v4 = [v2 descriptionText];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  id v6 = [v3 descriptionText];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = [v3 descriptionText];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = [v8 text];
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else
  {
LABEL_6:
    unint64_t v9 = 0;
  }

  return v9;
}

id getCardSection(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 inlineCard];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  id v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  if (!v7)
  {

    goto LABEL_8;
  }
  unint64_t v8 = (void *)v7;
  unint64_t v9 = [v3 inlineCard];
  unint64_t v10 = [v9 cardSections];
  unint64_t v11 = [v10 count];

  if (v11 <= a2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_10;
  }
  id v12 = [v3 inlineCard];
  uint64_t v13 = [v12 cardSections];
  int v5 = [v13 objectAtIndex:a2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v14 = v5;
LABEL_9:

LABEL_10:
  return v14;
}

id getScoreboardCardSection(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 inlineCard];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  id v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  if (!v7)
  {

    goto LABEL_8;
  }
  unint64_t v8 = (void *)v7;
  unint64_t v9 = [v3 inlineCard];
  unint64_t v10 = [v9 cardSections];
  unint64_t v11 = [v10 count];

  if (v11 <= a2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_10;
  }
  id v12 = [v3 inlineCard];
  uint64_t v13 = [v12 cardSections];
  int v5 = [v13 objectAtIndex:a2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v14 = v5;
LABEL_9:

LABEL_10:
  return v14;
}

id getScoreboardCardSectionTitle(void *a1, unint64_t a2)
{
  uint64_t v2 = getScoreboardCardSection(a1, a2);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accessibilityDescription];

    if (v4)
    {
      uint64_t v4 = [v3 accessibilityDescription];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id getDetailedRowCardSectionFootnoteText(void *a1, unint64_t a2)
{
  uint64_t v2 = getDetailedRowCardSectionFootnoteRichText(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 text];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id getSecondNumberStr(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3
    && [v3 length]
    && ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v4 rangeOfCharacterFromSet:v5],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = [v4 substringFromIndex:v6];
    unint64_t v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v11 = [v9 rangeOfCharacterFromSet:v10];

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v9 substringFromIndex:v11];
      if (a2)
      {
        id v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v13 = [v7 rangeOfCharacterFromSet:v12];

        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          [v9 substringFromIndex:v11];
        }
        else {
        uint64_t v14 = [v7 substringToIndex:v13];
        }

        uint64_t v7 = (void *)v14;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id getSecondLineFirstNumberStr(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3
    && [v3 length]
    && ([MEMORY[0x1E4F28B88] newlineCharacterSet],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v4 rangeOfCharacterFromSet:v5],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = [v4 substringFromIndex:v6];
    unint64_t v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v11 = [v9 rangeOfCharacterFromSet:v10];

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v9 substringFromIndex:v11];
      if (a2)
      {
        id v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v13 = [v7 rangeOfCharacterFromSet:v12];

        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          [v9 substringFromIndex:v11];
        }
        else {
        uint64_t v14 = [v7 substringToIndex:v13];
        }

        uint64_t v7 = (void *)v14;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id getSuffixYearStr(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1
    || ![v1 length]
    || ([MEMORY[0x1E4F28B88] punctuationCharacterSet],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v2 rangeOfCharacterFromSet:v3 options:4],
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    int v5 = 0;
    goto LABEL_5;
  }
  id v7 = [v2 substringToIndex:v4];
  uint64_t v8 = 4;
  unint64_t v9 = v7;
  while (1)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v11 = [v9 rangeOfCharacterFromSet:v10 options:4];
    uint64_t v13 = v12;

    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 != 1) {
      goto LABEL_16;
    }
    if (v8 == 1) {
      break;
    }
    uint64_t v15 = [v9 substringToIndex:v11];

    unint64_t v9 = (void *)v15;
LABEL_16:
    if (!--v8)
    {
      int v5 = 0;
      goto LABEL_19;
    }
  }
  int v5 = objc_msgSend(v7, "substringWithRange:", v11, 4);
LABEL_19:

LABEL_5:
  return v5;
}

float getNumYearsAgo(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  float v5 = (float)([v4 component:4 fromDate:v2] - a1);

  return v5;
}

id getPrefixYearStr(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1
    || ![v1 length]
    || ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v2 rangeOfCharacterFromSet:v3],
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    float v5 = 0;
    goto LABEL_5;
  }
  id v7 = [v2 substringToIndex:v4];
  float v5 = 0;
  if ([v7 length])
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = v7;
    while (1)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      uint64_t v13 = [v11 rangeOfCharacterFromSet:v12];

      if (v13)
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_25;
        }
        unint64_t v10 = v13 + v8;
        unint64_t v14 = v13 + 1;
        if (v14 < [v11 length])
        {
          uint64_t v15 = [v11 substringFromIndex:v14];
          uint64_t v9 = 1;
LABEL_21:

          uint64_t v11 = (void *)v15;
          goto LABEL_22;
        }
        uint64_t v9 = 1;
      }
      else
      {
        if ((unint64_t)[v11 length] < 2)
        {
          uint64_t v15 = (uint64_t)v11;
        }
        else
        {
          uint64_t v15 = [v11 substringFromIndex:1];
        }
        if (++v9 == 4)
        {
          objc_msgSend(v7, "substringWithRange:", v10, 4);
          uint64_t v11 = v5;
          float v5 = v14 = 1;
          goto LABEL_21;
        }
        uint64_t v11 = (void *)v15;
        unint64_t v14 = 1;
      }
LABEL_22:
      v8 += v14;
      if (v8 >= [v7 length]) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v11 = v7;
LABEL_25:

LABEL_5:
  return v5;
}

id getCompletedQuery(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 completedQuery];

    if (v3)
    {
      id v3 = [v2 completedQuery];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id getCorrectedQuery(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 correctedQuery];

    if (v3)
    {
      id v3 = [v2 correctedQuery];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id getTextAfterDateAndSeparator(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && [v1 length]
    && ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v2 rangeOfCharacterFromSet:v3],
        v3,
        v4 != 0x7FFFFFFFFFFFFFFFLL)
    && (unint64_t v5 = v4 + 1, v5 < [v2 length]))
  {
    uint64_t v6 = [v2 substringFromIndex:v5];
    id v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v8 = [v6 rangeOfCharacterFromSet:v7];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v9 = v8 + 1, v9 >= [v6 length]))
    {
      uint64_t v13 = 0;
    }
    else
    {
      unint64_t v10 = [v6 substringFromIndex:v9];
      uint64_t v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v12 = [v10 rangeOfCharacterFromSet:v11];

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = [v10 substringToIndex:v12];
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

float sMeanAccumulator_block_invoke(uint64_t a1, float *a2)
{
  uint64_t v2 = sRequiredAttributesCount;
  if (sRequiredAttributesCount)
  {
    int v3 = 0;
    float v4 = 0.0;
    do
    {
      float v5 = *a2++;
      float v6 = v5;
      BOOL v7 = v5 == -100.0;
      if (v5 == -100.0) {
        float v6 = -0.0;
      }
      float v4 = v4 + v6;
      if (!v7) {
        ++v3;
      }
      --v2;
    }
    while (v2);
  }
  else
  {
    int v3 = 0;
    float v4 = 0.0;
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  return v4 / (float)v3;
}

double sMaxAccumulator_block_invoke_2(uint64_t a1, float *a2)
{
  uint64_t v2 = sRequiredAttributesCount;
  if (!sRequiredAttributesCount) {
    return -3.53369685e72;
  }
  double result = -3.53369685e72;
  do
  {
    float v4 = *a2++;
    float v5 = v4;
    if (v4 > *(float *)&result && v5 != -100.0) {
      *(float *)&double result = v5;
    }
    --v2;
  }
  while (v2);
  return result;
}

double sMinAccumulator_block_invoke_3(uint64_t a1, float *a2)
{
  uint64_t v2 = sRequiredAttributesCount;
  if (!sRequiredAttributesCount) {
    return 3.53369517e72;
  }
  double result = 3.53369517e72;
  do
  {
    float v4 = *a2++;
    float v5 = v4;
    if (v4 < *(float *)&result && v5 != -100.0) {
      *(float *)&double result = v5;
    }
    --v2;
  }
  while (v2);
  return result;
}

float defaultValueForCrossAttributeFeature(uint64_t a1)
{
  float result = 2147500000.0;
  if ((unint64_t)(a1 - 18) >= 0xA) {
    return 0.0;
  }
  return result;
}

char *requiredParsecTextTypes()
{
  return &sParsecTextTypesList;
}

id PRSRankingItemRequiredAttributes()
{
  if (PRSRankingItemRequiredAttributes_onceToken != -1) {
    dispatch_once(&PRSRankingItemRequiredAttributes_onceToken, &__block_literal_global_164);
  }
  uint64_t v0 = (void *)PRSRankingItemRequiredAttributes_sRequiredAttributes;
  return v0;
}

void __PRSRankingItemRequiredAttributes_block_invoke()
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F22B18];
  v41[0] = *MEMORY[0x1E4F236F0];
  v41[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F236F8];
  v41[2] = *MEMORY[0x1E4F23700];
  v41[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F23710];
  v41[4] = *MEMORY[0x1E4F23140];
  v41[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F23748];
  v41[6] = *MEMORY[0x1E4F23740];
  v41[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22AE0];
  v41[8] = *MEMORY[0x1E4F234C0];
  v41[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F233C8];
  v41[10] = v41[0];
  v41[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23000];
  v41[12] = *MEMORY[0x1E4F22A38];
  v41[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F23728];
  v41[14] = *MEMORY[0x1E4F236E8];
  v41[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F23718];
  v41[16] = *MEMORY[0x1E4F23720];
  v41[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F23798];
  v41[18] = *MEMORY[0x1E4F237B0];
  v41[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F234A0];
  v41[20] = *MEMORY[0x1E4F22B10];
  v41[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F22A10];
  v41[22] = *MEMORY[0x1E4F22D28];
  v41[23] = v11;
  v41[24] = @"kMDQueryResultNewMatchedExtraQueriesField";
  v41[25] = @"_kMDItemLaunchString";
  uint64_t v12 = *MEMORY[0x1E4F23418];
  v41[26] = @"_kMDItemShortcutLastUsedDate";
  v41[27] = v12;
  uint64_t v13 = *MEMORY[0x1E4F23420];
  v41[28] = *MEMORY[0x1E4F23428];
  v41[29] = v13;
  uint64_t v14 = *MEMORY[0x1E4F23438];
  v41[30] = *MEMORY[0x1E4F23430];
  v41[31] = v14;
  uint64_t v15 = *MEMORY[0x1E4F22AF8];
  v41[32] = *MEMORY[0x1E4F22C38];
  v41[33] = v15;
  uint64_t v16 = *MEMORY[0x1E4F23038];
  v41[34] = *MEMORY[0x1E4F22B50];
  v41[35] = v16;
  uint64_t v17 = *MEMORY[0x1E4F23048];
  v41[36] = *MEMORY[0x1E4F231A8];
  v41[37] = v17;
  uint64_t v18 = *MEMORY[0x1E4F23050];
  v41[38] = *MEMORY[0x1E4F231B8];
  v41[39] = v18;
  uint64_t v19 = *MEMORY[0x1E4F23030];
  v41[40] = *MEMORY[0x1E4F231C0];
  v41[41] = v19;
  uint64_t v20 = *MEMORY[0x1E4F23040];
  v41[42] = *MEMORY[0x1E4F231A0];
  v41[43] = v20;
  uint64_t v21 = *MEMORY[0x1E4F23670];
  v41[44] = *MEMORY[0x1E4F231B0];
  v41[45] = v21;
  uint64_t v22 = *MEMORY[0x1E4F22D48];
  uint64_t v42 = *MEMORY[0x1E4F22C00];
  uint64_t v43 = v22;
  uint64_t v23 = *MEMORY[0x1E4F235A0];
  uint64_t v44 = *MEMORY[0x1E4F23380];
  uint64_t v45 = v23;
  uint64_t v24 = *MEMORY[0x1E4F236C0];
  uint64_t v46 = *MEMORY[0x1E4F22C50];
  uint64_t v47 = v24;
  uint64_t v25 = *MEMORY[0x1E4F236B8];
  uint64_t v48 = *MEMORY[0x1E4F236B0];
  uint64_t v49 = v25;
  uint64_t v26 = *MEMORY[0x1E4F230F0];
  uint64_t v50 = *MEMORY[0x1E4F23410];
  uint64_t v51 = v26;
  uint64_t v27 = *MEMORY[0x1E4F22D58];
  uint64_t v52 = *MEMORY[0x1E4F235A8];
  uint64_t v53 = v27;
  uint64_t v28 = *MEMORY[0x1E4F22D30];
  uint64_t v54 = v42;
  uint64_t v55 = v28;
  uint64_t v29 = *MEMORY[0x1E4F22A98];
  long long v56 = @"_kMDItemRelatedActivityLaunchCount";
  uint64_t v57 = v29;
  uint64_t v58 = *MEMORY[0x1E4F236A8];
  uint64_t v59 = @"_kMDItemUserActivityRequiredString";
  uint64_t v60 = @"kMDItemContentType";
  uint64_t v61 = *MEMORY[0x1E4F22C48];
  uint64_t v62 = *MEMORY[0x1E4F23608];
  uint64_t v63 = *MEMORY[0x1E4F236C8];
  uint64_t v64 = *MEMORY[0x1E4F236D0];
  uint64_t v65 = *MEMORY[0x1E4F23268];
  uint64_t v66 = *MEMORY[0x1E4F23540];
  uint64_t v67 = *MEMORY[0x1E4F23548];
  uint64_t v68 = *MEMORY[0x1E4F22C30];
  uint64_t v69 = *MEMORY[0x1E4F23020];
  uint64_t v70 = *MEMORY[0x1E4F230D0];
  uint64_t v71 = *MEMORY[0x1E4F230A0];
  uint64_t v72 = *MEMORY[0x1E4F22FF0];
  uint64_t v74 = *MEMORY[0x1E4F23468];
  uint64_t v75 = *MEMORY[0x1E4F23478];
  uint64_t v76 = *MEMORY[0x1E4F23470];
  uint64_t v77 = *MEMORY[0x1E4F23480];
  uint64_t v78 = *MEMORY[0x1E4F23450];
  uint64_t v79 = *MEMORY[0x1E4F23458];
  uint64_t v80 = *MEMORY[0x1E4F23460];
  uint64_t v81 = *MEMORY[0x1E4F22C40];
  uint64_t v82 = *MEMORY[0x1E4F23678];
  uint64_t v83 = *MEMORY[0x1E4F234F8];
  uint64_t v84 = *MEMORY[0x1E4F22D68];
  uint64_t v85 = *MEMORY[0x1E4F22CB0];
  uint64_t v86 = *MEMORY[0x1E4F22C70];
  double v87 = @"kMDQueryResultTextContentDistances";
  uint64_t v88 = *MEMORY[0x1E4F23230];
  uint64_t v89 = *MEMORY[0x1E4F23290];
  uint64_t v90 = *MEMORY[0x1E4F22CA0];
  uint64_t v91 = *MEMORY[0x1E4F22A60];
  uint64_t v92 = *MEMORY[0x1E4F22CC8];
  uint64_t v93 = *MEMORY[0x1E4F22AA8];
  uint64_t v94 = *MEMORY[0x1E4F22F30];
  uint64_t v95 = *MEMORY[0x1E4F22C68];
  uint64_t v96 = *MEMORY[0x1E4F232F8];
  uint64_t v97 = *MEMORY[0x1E4F23308];
  uint64_t v98 = *MEMORY[0x1E4F232E0];
  uint64_t v99 = *MEMORY[0x1E4F23298];
  uint64_t v100 = *MEMORY[0x1E4F23370];
  uint64_t v101 = *MEMORY[0x1E4F232C0];
  uint64_t v102 = *MEMORY[0x1E4F23280];
  uint64_t v103 = *MEMORY[0x1E4F23278];
  uint64_t v104 = *MEMORY[0x1E4F23250];
  uint64_t v105 = *MEMORY[0x1E4F23340];
  uint64_t v106 = *MEMORY[0x1E4F23368];
  uint64_t v107 = *MEMORY[0x1E4F23348];
  uint64_t v108 = *MEMORY[0x1E4F23350];
  uint64_t v109 = *MEMORY[0x1E4F23360];
  uint64_t v110 = *MEMORY[0x1E4F23270];
  uint64_t v111 = *MEMORY[0x1E4F23248];
  uint64_t v112 = *MEMORY[0x1E4F232D8];
  uint64_t v113 = *MEMORY[0x1E4F23330];
  uint64_t v114 = *MEMORY[0x1E4F232A0];
  uint64_t v115 = *MEMORY[0x1E4F232B0];
  uint64_t v116 = *MEMORY[0x1E4F23378];
  uint64_t v117 = *MEMORY[0x1E4F23260];
  uint64_t v118 = *MEMORY[0x1E4F22A18];
  uint64_t v119 = *MEMORY[0x1E4F22A20];
  uint64_t v30 = *MEMORY[0x1E4F23680];
  uint64_t v120 = @"kMDQueryResultHasTextContentMatch";
  uint64_t v121 = *MEMORY[0x1E4F22FC0];
  uint64_t v122 = *MEMORY[0x1E4F234D0];
  uint64_t v123 = *MEMORY[0x1E4F23530];
  uint64_t v124 = *MEMORY[0x1E4F23518];
  uint64_t v125 = *MEMORY[0x1E4F23560];
  uint64_t v73 = v30;
  uint64_t v126 = *MEMORY[0x1E4F23550];
  uint64_t v127 = *MEMORY[0x1E4F230C8];
  uint64_t v128 = v30;
  uint64_t v129 = *MEMORY[0x1E4F22A88];
  uint64_t v130 = *MEMORY[0x1E4F22A90];
  uint64_t v131 = *MEMORY[0x1E4F23738];
  uint64_t v132 = *MEMORY[0x1E4F23730];
  uint64_t v133 = *MEMORY[0x1E4F23138];
  uint64_t v134 = *MEMORY[0x1E4F23698];
  uint64_t v135 = *MEMORY[0x1E4F23690];
  uint64_t v136 = *MEMORY[0x1E4F23770];
  uint64_t v137 = *MEMORY[0x1E4F22CD8];
  uint64_t v138 = *MEMORY[0x1E4F22F20];
  uint64_t v139 = *MEMORY[0x1E4F22DA8];
  uint64_t v140 = *MEMORY[0x1E4F22DC0];
  uint64_t v141 = *MEMORY[0x1E4F22DA0];
  uint64_t v142 = *MEMORY[0x1E4F22DB8];
  uint64_t v143 = *MEMORY[0x1E4F22DC8];
  uint64_t v144 = *MEMORY[0x1E4F22DB0];
  uint64_t v145 = *MEMORY[0x1E4F22D90];
  uint64_t v146 = *MEMORY[0x1E4F22D88];
  uint64_t v147 = *MEMORY[0x1E4F22E18];
  uint64_t v148 = *MEMORY[0x1E4F22E30];
  uint64_t v149 = *MEMORY[0x1E4F22E10];
  uint64_t v150 = *MEMORY[0x1E4F22E28];
  uint64_t v151 = *MEMORY[0x1E4F22E38];
  uint64_t v152 = *MEMORY[0x1E4F22E20];
  uint64_t v153 = *MEMORY[0x1E4F22EF8];
  uint64_t v154 = *MEMORY[0x1E4F22EF0];
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:159];
  if (_os_feature_enabled_impl())
  {
    uint64_t v32 = *MEMORY[0x1E4F23790];
    v40[0] = *MEMORY[0x1E4F23760];
    v40[1] = v32;
    float v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v34 = [v31 arrayByAddingObjectsFromArray:v33];

    if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    {
      long long v31 = [v34 arrayByAddingObject:*MEMORY[0x1E4F233E8]];
    }
    else
    {
      long long v31 = v34;
    }
  }
  uint64_t v35 = requiredTextFeatureAttributes();
  uint64_t v36 = requiredContactAttributes();
  uint64_t v37 = [v35 arrayByAddingObjectsFromArray:v36];
  uint64_t v38 = [v37 arrayByAddingObjectsFromArray:v31];
  uint64_t v39 = (void *)PRSRankingItemRequiredAttributes_sRequiredAttributes;
  PRSRankingItemRequiredAttributes_sRequiredAttributes = v38;
}

id requiredTextFeatureAttributes()
{
  if (requiredTextFeatureAttributes_onceToken != -1) {
    dispatch_once(&requiredTextFeatureAttributes_onceToken, &__block_literal_global_1178);
  }
  uint64_t v0 = (void *)requiredTextFeatureAttributes_attrs;
  return v0;
}

id requiredContactAttributes()
{
  if (requiredContactAttributes_onceToken != -1) {
    dispatch_once(&requiredContactAttributes_onceToken, &__block_literal_global_1180);
  }
  uint64_t v0 = (void *)requiredContactAttributes_attrs;
  return v0;
}

uint64_t updateVIPList(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  pthread_mutex_lock(&sVIPLock);
  uint64_t v5 = (void *)sVipList;
  sVipList = (uint64_t)v3;
  id v6 = v3;

  uint64_t v7 = (void *)sVipEmails;
  sVipEmails = (uint64_t)v4;

  return pthread_mutex_unlock(&sVIPLock);
}

uint64_t updateMeEmailAddresses(void *a1)
{
  id v1 = a1;
  pthread_mutex_lock(&sVIPLock);
  uint64_t v2 = (void *)sMeEmailAddresses;
  sMeEmailAddresses = (uint64_t)v1;

  return pthread_mutex_unlock(&sVIPLock);
}

BOOL shouldUpdateCrossAttributeFeature(unint64_t a1, float a2, float a3)
{
  if (a1 < 0x12) {
    return a3 > a2;
  }
  if (a1 - 18 >= 0xA) {
    shouldUpdateCrossAttributeFeature_cold_1();
  }
  return a3 < a2;
}

unint64_t updatedCrossAttributeFeature(unint64_t result, uint64_t a2, float a3)
{
  float v3 = *(float *)(a2 + 4 * result);
  if (result < 0x12)
  {
    if (v3 >= a3) {
      return result;
    }
    goto LABEL_3;
  }
  if (result - 18 > 9) {
    shouldUpdateCrossAttributeFeature_cold_1();
  }
  if (v3 > a3) {
LABEL_3:
  }
    *(float *)(a2 + 4 * result) = a3;
  return result;
}

unint64_t numBitsSet(unint64_t result, unint64_t a2)
{
  uint64_t v2 = 0;
  float v3 = 0.0;
  do
  {
    uint64_t v4 = ((2 * a2) << ~(_BYTE)v2) | (result >> v2);
    if ((v2 & 0x40) != 0) {
      uint64_t v4 = a2 >> v2;
    }
    if (v4) {
      float v3 = v3 + 1.0;
    }
    ++v2;
  }
  while (v2 != 128);
  return result;
}

uint64_t maskFromRankingDescriptors(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = [(id)sRankingQueryIndexDictionary objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        char v9 = [v8 unsignedIntegerValue];
        uint64_t v10 = 1 << v9;
        if ((v9 & 0x40) != 0) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = 1 << v9;
        }
        if ((v9 & 0x40) == 0) {
          uint64_t v10 = 0;
        }
        v5 |= v10;
        v4 |= v11;
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

float sqDistancesToCosine(void *a1)
{
  id v1 = a1;
  float v2 = 0.0;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v1;
      if ([v3 count] == 3)
      {
        uint64_t v4 = 0;
        float v5 = 3.4028e38;
        do
        {
          uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
          [v6 floatValue];
          float v8 = v7;

          if (v5 >= v8) {
            float v5 = v8;
          }
          ++v4;
        }
        while (v4 != 3);
        if (v5 >= 0.0 && v5 <= 4.0) {
          float v2 = (float)(v5 * -0.5) + 1.0;
        }
      }
    }
  }

  return v2;
}

uint64_t countsArrayComparator_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 count] != 8 || objc_msgSend(v4, "count") != 8) {
    countsArrayComparator_block_invoke_4_cold_1();
  }
  uint64_t v6 = [v4 objectAtIndexedSubscript:4];
  float v7 = [v5 objectAtIndexedSubscript:4];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    char v9 = [v4 objectAtIndexedSubscript:5];
    uint64_t v10 = [v5 objectAtIndexedSubscript:5];
    uint64_t v8 = [v9 compare:v10];

    if (!v8)
    {
      uint64_t v11 = [v4 objectAtIndexedSubscript:6];
      uint64_t v12 = [v5 objectAtIndexedSubscript:6];
      uint64_t v8 = [v11 compare:v12];

      if (!v8)
      {
        long long v13 = [v4 objectAtIndexedSubscript:7];
        long long v14 = [v5 objectAtIndexedSubscript:7];
        uint64_t v8 = [v13 compare:v14];

        if (!v8)
        {
          long long v15 = [v4 objectAtIndexedSubscript:0];
          long long v16 = [v5 objectAtIndexedSubscript:0];
          uint64_t v8 = [v15 compare:v16];

          if (!v8)
          {
            uint64_t v17 = [v4 objectAtIndexedSubscript:1];
            uint64_t v18 = [v5 objectAtIndexedSubscript:1];
            uint64_t v8 = [v17 compare:v18];

            if (!v8)
            {
              uint64_t v19 = [v4 objectAtIndexedSubscript:2];
              uint64_t v20 = [v5 objectAtIndexedSubscript:2];
              uint64_t v8 = [v19 compare:v20];

              if (!v8)
              {
                uint64_t v21 = [v4 objectAtIndexedSubscript:3];
                uint64_t v22 = [v5 objectAtIndexedSubscript:3];
                uint64_t v8 = [v21 compare:v22];
              }
            }
          }
        }
      }
    }
  }

  return v8;
}

void initQueryTermMatchCounts_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      size_t v4 = 2 * a2;
      id v5 = malloc_type_malloc(2 * a2, 0x1000040BDFB0063uLL);
      *(void *)a3 = v5;
      bzero(v5, v4);
      *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x238], 8) = 0;
    }
  }
}

BOOL hasAllQueryTermMatchCounts_block_invoke_6(uint64_t a1, uint64_t a2, unsigned __int16 **a3)
{
  if (!a2 || !a3) {
    return 1;
  }
  uint64_t v3 = a2 - 1;
  if (a2 != 1)
  {
    size_t v4 = *a3;
    do
    {
      if (!*v4++) {
        return 0;
      }
    }
    while (--v3);
  }
  return *((_WORD *)a3 + 4) != 0;
}

void destroyQueryTermMatchCounts_block_invoke_7(uint64_t a1, uint64_t a2, void **a3)
{
  if (a2 && a3)
  {
    if (*a3) {
      free(*a3);
    }
  }
}

uint64_t updateMatchCountsQueryMatchCounts_block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4, _WORD *a5, uint64_t a6)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  long long v13 = [v10 queryTerms];
  uint64_t v14 = [v13 count];

  MDTokenizerCreate();
  long long v15 = objc_opt_new();
  MDTokenizerGetTokens();
  MDTokenizerDispose();
  id v29 = v15;
  id v32 = v11;
  uint64_t v16 = [v15 count];
  uint64_t v28 = (uint64_t)&v28;
  unint64_t v17 = (2 * v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v35 = (char *)&v28 - v17;
  bzero((char *)&v28 - v17, 2 * v16);
  uint64_t v34 = (char *)&v28 - v17;
  bzero((char *)&v28 - v17, 2 * v16);
  unint64_t v18 = (2 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = (char *)&v28 - v18;
  bzero((char *)&v28 - v18, 2 * v14);
  id v33 = v10;
  bzero((char *)&v28 - v18, 2 * v14);
  id v31 = v12;
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero(v35, 2 * v16);
  bzero(v34, 2 * v16);
  uint64_t v19 = v30;
  bzero(v30, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  uint64_t v67 = 0;
  uint64_t v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = v35;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = v34;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = v19;
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = (char *)&v28 - v18;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = (char *)&v28 - v18;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = (char *)&v28 - v18;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  void v36[2] = updateMatchCountsQueryMatchCounts_block_invoke_9;
  v36[3] = &unk_1E635A580;
  uint64_t v45 = v14;
  id v20 = v31;
  id v37 = v20;
  uint64_t v35 = (char *)v32;
  id v38 = v35;
  uint64_t v39 = &v59;
  uint64_t v40 = &v55;
  uint64_t v41 = &v67;
  uint64_t v42 = &v63;
  uint64_t v43 = &v51;
  id v21 = v33;
  uint64_t v46 = v16;
  uint64_t v44 = &v47;
  uint64_t v22 = [v33 evaluateAttribute:v20 ignoreSubtokens:1 strongCompounds:1 skipTranscriptions:0 withHandler:v36];
  a5[6] = v22;
  if (v14)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(_WORD *)(v60[3] + 2 * i) == 1) {
        ++a5[2];
      }
      if (*(_WORD *)(v56[3] + 2 * i) == 1) {
        ++a5[3];
      }
      if (*(_WORD *)(v52[3] + 2 * i))
      {
        ++a5[4];
        if (a6) {
          ++*(_WORD *)(a6 + 8);
        }
      }
      if (*(_WORD *)(v48[3] + 2 * i))
      {
        ++a5[5];
        if (a6)
        {
          if (*(void *)a6) {
            ++*(_WORD *)(*(void *)a6 + 2 * i);
          }
        }
      }
    }
  }
  if (v16)
  {
    uint64_t v24 = (unsigned __int16 *)v68[3];
    uint64_t v25 = (_WORD *)v64[3];
    do
    {
      int v26 = *v24++;
      if (v26 == 1) {
        ++*a5;
      }
      if (*v25 == 1) {
        ++a5[1];
      }
      ++v25;
      --v16;
    }
    while (v16);
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  return v22;
}

void sub_1BDC056F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 176), 8);
  _Block_object_dispose((const void *)(v1 + 208), 8);
  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void copyValueTokensCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = NSString;
  id v7 = a4;
  uint64_t v8 = [v6 stringWithCharacters:a1 length:a2];
  id v9 = [v8 decomposedStringWithCanonicalMapping];

  [v7 addObject:v9];
}

void updateMatchCountsQueryMatchCounts_block_invoke_9(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if ((a2 & 5) == 1)
  {
    if (*(void *)(a1 + 96) <= a6)
    {
      uint64_t v14 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 96);
        uint64_t v23 = [*(id *)(a1 + 32) length];
        uint64_t v24 = *(void *)(a1 + 40);
        int v36 = 134220034;
        unint64_t v37 = a6;
        __int16 v38 = 2048;
        uint64_t v39 = v22;
        __int16 v40 = 2048;
        uint64_t v41 = v23;
        __int16 v42 = 2112;
        uint64_t v43 = v24;
        __int16 v44 = 2048;
        unint64_t v45 = a2;
        __int16 v46 = 2048;
        unint64_t v47 = a3;
        __int16 v48 = 2048;
        unint64_t v49 = a4;
        __int16 v50 = 2048;
        unint64_t v51 = a5;
        __int16 v52 = 2048;
        unint64_t v53 = a7;
        _os_log_error_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex (%lu) >= queryTermCount (%lu), value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", (uint8_t *)&v36, 0x5Cu);
      }

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = *(void *)(a1 + 96);
        uint64_t v26 = [*(id *)(a1 + 32) length];
        uint64_t v27 = *(void *)(a1 + 40);
        int v36 = 134220034;
        unint64_t v37 = a6;
        __int16 v38 = 2048;
        uint64_t v39 = v25;
        __int16 v40 = 2048;
        uint64_t v41 = v26;
        __int16 v42 = 2112;
        uint64_t v43 = v27;
        __int16 v44 = 2048;
        unint64_t v45 = a2;
        __int16 v46 = 2048;
        unint64_t v47 = a3;
        __int16 v48 = 2048;
        unint64_t v49 = a4;
        __int16 v50 = 2048;
        unint64_t v51 = a5;
        __int16 v52 = 2048;
        unint64_t v53 = a7;
        _os_log_fault_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "matchedQueryTermIndex (%lu) >= queryTermCount (%lu), value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", (uint8_t *)&v36, 0x5Cu);
      }
    }
    if (*(void *)(a1 + 104) <= a7)
    {
      long long v15 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(a1 + 96);
        uint64_t v28 = *(void *)(a1 + 104);
        uint64_t v30 = [*(id *)(a1 + 32) length];
        unint64_t v31 = *(void *)(a1 + 40);
        int v36 = 134220290;
        unint64_t v37 = a7;
        __int16 v38 = 2048;
        uint64_t v39 = v28;
        __int16 v40 = 2048;
        uint64_t v41 = v29;
        __int16 v42 = 2048;
        uint64_t v43 = v30;
        __int16 v44 = 2112;
        unint64_t v45 = v31;
        __int16 v46 = 2048;
        unint64_t v47 = a2;
        __int16 v48 = 2048;
        unint64_t v49 = a3;
        __int16 v50 = 2048;
        unint64_t v51 = a4;
        __int16 v52 = 2048;
        unint64_t v53 = a5;
        __int16 v54 = 2048;
        unint64_t v55 = a6;
        _os_log_error_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_ERROR, "matchedTokenIndex (%lu) >= valueTermCount (%lu), queryTermCount = %lu, value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedQueryTermIndex: %lu", (uint8_t *)&v36, 0x66u);
      }

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v33 = *(void *)(a1 + 96);
        uint64_t v32 = *(void *)(a1 + 104);
        uint64_t v34 = [*(id *)(a1 + 32) length];
        unint64_t v35 = *(void *)(a1 + 40);
        int v36 = 134220290;
        unint64_t v37 = a7;
        __int16 v38 = 2048;
        uint64_t v39 = v32;
        __int16 v40 = 2048;
        uint64_t v41 = v33;
        __int16 v42 = 2048;
        uint64_t v43 = v34;
        __int16 v44 = 2112;
        unint64_t v45 = v35;
        __int16 v46 = 2048;
        unint64_t v47 = a2;
        __int16 v48 = 2048;
        unint64_t v49 = a3;
        __int16 v50 = 2048;
        unint64_t v51 = a4;
        __int16 v52 = 2048;
        unint64_t v53 = a5;
        __int16 v54 = 2048;
        unint64_t v55 = a6;
        _os_log_fault_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "matchedTokenIndex (%lu) >= valueTermCount (%lu), queryTermCount = %lu, value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedQueryTermIndex: %lu", (uint8_t *)&v36, 0x66u);
      }
    }
    unint64_t v16 = *(void *)(a1 + 96);
    if (v16)
    {
      if (v16 > a6 && *(void *)(a1 + 104) > a7)
      {
        if (a7 == a6)
        {
          if ((a2 & 2) == 0)
          {
            if (v16 - 1 == a6)
            {
              uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              ++*(_WORD *)(v17 + 2 * a6);
            }
            goto LABEL_20;
          }
          uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          ++*(_WORD *)(v20 + 2 * a6);
        }
        else if ((a2 & 2) == 0)
        {
LABEL_20:
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          ++*(_WORD *)(v18 + 2 * a7);
          if (v16 - 1 != a6) {
            return;
          }
          uint64_t v19 = *(void *)(a1 + 80);
LABEL_25:
          ++*(_WORD *)(*(void *)(*(void *)(v19 + 8) + 24) + 2 * a6);
          return;
        }
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        ++*(_WORD *)(v21 + 2 * a7);
        if (v16 - 1 == a6) {
          return;
        }
        uint64_t v19 = *(void *)(a1 + 88);
        goto LABEL_25;
      }
    }
  }
}

uint64_t updateMatchCounts_block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, _WORD *a5)
{
  return (*((uint64_t (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
          + 2))((uint64_t)updateMatchCountsQueryMatchCounts, a2, a3, a4, a5, 0);
}

BOOL hasMatchWithCounts_block_invoke_11(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, char a6, int a7)
{
  BOOL result = 0;
  if (!a2) {
    return result;
  }
  uint64_t v8 = WORD2(a4);
  if (!WORD2(a4)) {
    return result;
  }
  unint64_t v9 = HIWORD(a3);
  if (a7) {
    return WORD2(a4) == a2 && WORD2(a4) == v9;
  }
  uint64_t v11 = WORD2(a3);
  if (WORD2(a4) == 1)
  {
    if ((_WORD)a3) {
      char v12 = a5;
    }
    else {
      char v12 = 1;
    }
    if (WORD2(a3)) {
      BOOL v13 = a2 == 1;
    }
    else {
      BOOL v13 = 0;
    }
    BOOL result = 1;
    if (v13 || (v12 & 1) == 0) {
      return result;
    }
    return 0;
  }
  if ((a6 & 1) == 0) {
    return (WORD2(a3) | (unint64_t)(unsigned __int16)a3) != 0;
  }
  if (a5) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v11 = (unsigned __int16)a3;
  }
  if (v11 != v8) {
    return 0;
  }
  if (!a5) {
    unint64_t v9 = WORD1(a3);
  }
  BOOL result = 1;
  if (v9 != v11 && v9 != v11 - 1) {
    return 0;
  }
  return result;
}

uint64_t hasAsTypedMatchWithCounts_block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 == 1)
  {
    if (!((unsigned __int16)a4 | (unint64_t)HIWORD(a4))) {
      return 0;
    }
  }
  else if (((_WORD)a4 || HIWORD(a4) != a2) && ((unsigned __int16)a4 != 1 || HIWORD(a4) != a2 - 1))
  {
    return 0;
  }
  return 1;
}

void sub_1BDC0947C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1BDC0BA18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 560), 8);
  _Unwind_Resume(a1);
}

uint64_t prs_feature_population_ctx_reset_for_item(uint64_t result)
{
  uint64_t v1 = 0;
  *(_DWORD *)(result + 156) = 0;
  *(_OWORD *)(result + 140) = xmmword_1BDC5DC50;
  int64x2_t v2 = (int64x2_t)xmmword_1BDC5D800;
  int64x2_t v3 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  uint64x2_t v4 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  int64x2_t v5 = (int64x2_t)xmmword_1BDC5D810;
  int64x2_t v6 = vdupq_n_s64(4uLL);
  v7.i64[0] = 0x4F0000004F000000;
  v7.i64[1] = 0x4F0000004F000000;
  do
  {
    *(int8x16_t *)(result + 28 + v1) = vandq_s8(v7, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v4, (uint64x2_t)vaddq_s64(v5, v3)), (int32x4_t)vcgtq_u64(v4, (uint64x2_t)vaddq_s64(v2, v3))));
    int64x2_t v2 = vaddq_s64(v2, v6);
    int64x2_t v5 = vaddq_s64(v5, v6);
    v1 += 16;
  }
  while (v1 != 112);
  *(void *)(result + 160) = 0;
  *(void *)(result + 16_Block_object_dispose(&STACK[0x238], 8) = 0;
  return result;
}

void prs_feature_population_ctx_reset_for_property(uint64_t a1, const __CFString *a2, char a3)
{
  *(void *)(a1 + 184) = 0x7FFFFFFFFFFFFFFFLL;
  CFArrayRef v6 = *(const __CFArray **)(a1 + 16);
  CFIndex Count = CFArrayGetCount(v6);
  uint64_t v8 = Count;
  if (a3)
  {
    if (Count < 1) {
      goto LABEL_11;
    }
  }
  else if (CFEqual(@"kMDItemDescription", a2) || v8 <= 0)
  {
    goto LABEL_11;
  }
  CFIndex v9 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v9);
    if (CFEqual(a2, ValueAtIndex)) {
      break;
    }
    if (v8 == ++v9) {
      goto LABEL_11;
    }
  }
  *(void *)(a1 + 184) = v9;
LABEL_11:
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)a1);
  uint64_t v11 = *(__CFArray **)(a1 + 8);
  CFArrayRemoveAllValues(v11);
}

void sub_1BDC0D54C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 440), 8);
  _Block_object_dispose((const void *)(v1 + 472), 8);
  _Block_object_dispose((const void *)(v1 + 504), 8);
  _Block_object_dispose((const void *)(v1 + 536), 8);
  _Block_object_dispose((const void *)(v1 + 568), 8);
  _Block_object_dispose((const void *)(v1 + 600), 8);
  _Unwind_Resume(a1);
}

uint64_t statisticsFromValues(uint64_t result, unint64_t a2, float *a3, float *a4, float *a5, float *a6, float *a7, int a8, double a9, double a10, double a11, float a12, double a13, double a14, double a15)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v15 = 0;
      float v16 = 0.0;
      float v17 = 2147500000.0;
      float v18 = 0.0;
      do
      {
        if (a8)
        {
          a12 = *(float *)(result + 4 * v15);
        }
        else
        {
          LOWORD(a12) = *(_WORD *)(result + 2 * v15);
          a12 = (float)LODWORD(a12);
        }
        if (v17 >= a12) {
          float v17 = a12;
        }
        if (v18 < a12) {
          float v18 = a12;
        }
        float v16 = v16 + a12;
        ++v15;
      }
      while (a2 != v15);
      uint64_t v19 = 0;
      float v20 = 0.0;
      if (v17 == 2147500000.0) {
        float v17 = 0.0;
      }
      float v21 = (float)a2;
      float v22 = v16 / (float)a2;
      do
      {
        if (a8)
        {
          LODWORD(a15) = *(_DWORD *)(result + 4 * v19);
        }
        else
        {
          LOWORD(a15) = *(_WORD *)(result + 2 * v19);
          *(float *)&a15 = (float)LODWORD(a15);
        }
        a15 = (float)(v22 - *(float *)&a15) * (float)(v22 - *(float *)&a15);
        float v20 = a15 + v20;
        ++v19;
      }
      while (a2 != v19);
    }
    else
    {
      float v21 = (float)0;
      float v17 = 0.0;
      float v22 = 0.0 / (float)0;
      float v16 = 0.0;
      float v18 = 0.0;
      float v20 = 0.0;
    }
    *a5 = v20 / v21;
    *a3 = v16;
    *a4 = v22;
    *a6 = v17;
    *a7 = v18;
  }
  return result;
}

id getResultPropertyValue(void *a1, char a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFArrayRef v6 = 0;
    goto LABEL_16;
  }
  id v4 = v3;
  int64x2_t v5 = v4;
  if ((a2 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(v4, "PRSRankingItemAdditions_title");
LABEL_14:
    CFArrayRef v6 = (void *)v7;
    goto LABEL_15;
  }
  if ((a2 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(v4, "PRSRankingItemAdditions_description");
    goto LABEL_14;
  }
  if ((a2 & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(v4, "PRSRankingItemAdditions_url");
    goto LABEL_14;
  }
  if ((a2 & 0x10) != 0)
  {
    uint64_t v7 = objc_msgSend(v4, "PRSRankingItemAdditions_completedQuery");
    goto LABEL_14;
  }
  if ((a2 & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend(v4, "PRSRankingItemAdditions_correctedQuery");
    goto LABEL_14;
  }
  CFArrayRef v6 = 0;
LABEL_15:

LABEL_16:
  return v6;
}

uint64_t comparePreferences_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CFArrayRef v6 = [v4 L2FeatureVector];
  [v6 scoreForFeature:97];
  float v8 = v7;

  CFIndex v9 = [v5 L2FeatureVector];
  [v9 scoreForFeature:97];
  float v11 = v10;

  char v12 = [v4 L2FeatureVector];
  [v12 scoreForFeature:109];
  float v14 = v13;

  uint64_t v15 = [v5 L2FeatureVector];
  [v15 scoreForFeature:109];
  float v17 = v16;

  BOOL v18 = v14 <= 0.0 && v8 <= 0.0;
  if (!v18 && v11 <= 0.0 && v17 <= 0.0) {
    goto LABEL_7;
  }
  BOOL v20 = v17 <= 0.0 && v11 <= 0.0;
  if (!v20 && v8 <= 0.0 && v14 <= 0.0)
  {
LABEL_14:
    uint64_t v19 = -1;
    goto LABEL_15;
  }
  uint64_t v60 = 0;
  SSCompactRankingAttrsGetFloat([v4 attributes], 0x15BuLL, (_DWORD *)&v60 + 1);
  SSCompactRankingAttrsGetFloat([v5 attributes], 0x15BuLL, &v60);
  LODWORD(v22) = HIDWORD(v60);
  if (*((float *)&v60 + 1) > *(float *)&v60) {
    goto LABEL_7;
  }
  if (*((float *)&v60 + 1) < *(float *)&v60) {
    goto LABEL_14;
  }
  uint64_t v23 = objc_msgSend(v4, "L2FeatureVector", v22);
  [v23 scoreForFeature:41];
  float v25 = v24;

  uint64_t v26 = [v5 L2FeatureVector];
  [v26 scoreForFeature:41];
  float v28 = v27;

  if (v25 > v28) {
    goto LABEL_7;
  }
  if (v25 < v28) {
    goto LABEL_14;
  }
  uint64_t v29 = [v4 L2FeatureVector];
  [v29 scoreForFeature:213];
  float v31 = v30;

  uint64_t v32 = [v5 L2FeatureVector];
  [v32 scoreForFeature:213];
  float v34 = v33;

  if (v31 < v34) {
    goto LABEL_7;
  }
  if (v31 > v34) {
    goto LABEL_14;
  }
  unint64_t v35 = [v4 L2FeatureVector];
  [v35 scoreForFeature:212];
  float v37 = v36;

  __int16 v38 = [v5 L2FeatureVector];
  [v38 scoreForFeature:212];
  float v40 = v39;

  if (v37 < v40) {
    goto LABEL_7;
  }
  if (v37 > v40) {
    goto LABEL_14;
  }
  uint64_t v41 = [v4 L2FeatureVector];
  [v41 scoreForFeature:134];
  float v43 = v42;

  __int16 v44 = [v5 L2FeatureVector];
  [v44 scoreForFeature:134];
  float v46 = v45;

  if (v43 > v46) {
    goto LABEL_7;
  }
  if (v43 < v46) {
    goto LABEL_14;
  }
  unint64_t v47 = [v4 L2FeatureVector];
  [v47 scoreForFeature:135];
  float v49 = v48;

  __int16 v50 = [v5 L2FeatureVector];
  [v50 scoreForFeature:135];
  float v52 = v51;

  if (v49 > v52)
  {
LABEL_7:
    uint64_t v19 = 1;
    goto LABEL_15;
  }
  if (v49 < v52) {
    goto LABEL_14;
  }
  unint64_t v53 = [v4 L2FeatureVector];
  [v53 scoreForFeature:79];
  float v55 = v54;

  uint64_t v56 = [v5 L2FeatureVector];
  [v56 scoreForFeature:79];
  float v58 = v57;

  if (v55 >= v58) {
    uint64_t v59 = 0;
  }
  else {
    uint64_t v59 = -1;
  }
  if (v55 > v58) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v59;
  }
LABEL_15:

  return v19;
}

uint64_t compareSafariResults_block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isSafariTopHit];
  int v7 = [v5 isSafariTopHit];
  if (((v6 ^ 1) & 1) != 0 || v7)
  {
    if ((v7 ^ 1 | v6) == 1)
    {
      if ((v6 ^ 1 | v7 ^ 1)) {
        goto LABEL_10;
      }
      CFIndex v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 0xDuLL);
      float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[v5 attributes], 0xDuLL);
      unint64_t v11 = [v9 length];
      unint64_t v12 = [v10 length];

      uint64_t v8 = v11 > v12 ? 1 : -1;
      if (v11 == v12) {
LABEL_10:
      }
        uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t compareShortcuts_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v17 = 0;
  SSCompactRankingAttrsGetFloat([v4 attributes], 0x15BuLL, (_DWORD *)&v17 + 1);
  SSCompactRankingAttrsGetFloat([v5 attributes], 0x15BuLL, &v17);
  LODWORD(v6) = HIDWORD(v17);
  if (*((float *)&v17 + 1) <= *(float *)&v17)
  {
    if (*((float *)&v17 + 1) < *(float *)&v17)
    {
      uint64_t v7 = -1;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v4, "L2FeatureVector", v6);
      [v8 scoreForFeature:165];
      float v10 = v9;

      unint64_t v11 = [v5 L2FeatureVector];
      [v11 scoreForFeature:165];
      uint64_t v13 = v12 == 0.0 && v10 != 0.0;
      BOOL v14 = v12 != 0.0 && v10 == 0.0;
      uint64_t v15 = v13 << 63 >> 63;
      if (v14) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v15;
      }
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t compareShortcutsNames_block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 L2FeatureVector];
  [v5 scoreForFeature:165];
  float v7 = v6;

  uint64_t v8 = [v4 L2FeatureVector];

  [v8 scoreForFeature:165];
  uint64_t v10 = v9 == 0.0 && v7 != 0.0;
  BOOL v11 = v9 != 0.0 && v7 == 0.0;
  uint64_t v12 = v10 << 63 >> 63;
  if (v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }

  return v13;
}

uint64_t compareApplications_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 L2FeatureVector];
  int v6 = [v5 isAppInDock];

  float v7 = [v4 L2FeatureVector];

  int v8 = [v7 isAppInDock];
  if (v6 ^ 1 | v8) {
    return (uint64_t)((unint64_t)(v8 & (v6 ^ 1u)) << 63) >> 63;
  }
  else {
    return 1;
  }
}

CFMutableArrayRef prs_feature_population_ctx_init(uint64_t a1, CFIndex capacity)
{
  char v2 = capacity;
  CFIndex v4 = capacity;
  id v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  *(void *)a1 = CFArrayCreateMutable(0, capacity, MEMORY[0x1E4F1D510]);
  CFMutableArrayRef result = CFArrayCreateMutable(0, v4, v5);
  uint64_t v7 = 0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x238], 8) = result;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 156) = 0;
  *(_OWORD *)(a1 + 140) = xmmword_1BDC5DC50;
  int64x2_t v8 = (int64x2_t)xmmword_1BDC5D800;
  int64x2_t v9 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  int64x2_t v11 = (int64x2_t)xmmword_1BDC5D810;
  int64x2_t v12 = vdupq_n_s64(4uLL);
  v13.i64[0] = 0x4F0000004F000000;
  v13.i64[1] = 0x4F0000004F000000;
  do
  {
    *(int8x16_t *)(a1 + 28 + v7) = vandq_s8(v13, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v10, (uint64x2_t)vaddq_s64(v11, v9)), (int32x4_t)vcgtq_u64(v10, (uint64x2_t)vaddq_s64(v8, v9))));
    int64x2_t v8 = vaddq_s64(v8, v12);
    int64x2_t v11 = vaddq_s64(v11, v12);
    v7 += 16;
  }
  while (v7 != 112);
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 16_Block_object_dispose(&STACK[0x238], 8) = 0;
  *(void *)(a1 + 176) = 0;
  return result;
}

CFIndex prs_feature_population_ctx_reset_with_important_properties(uint64_t a1, CFTypeRef cf)
{
  CFIndex v4 = *(const void **)(a1 + 16);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 16) = CFRetain(cf);
  CFIndex result = CFArrayGetCount((CFArrayRef)cf);
  *(void *)(a1 + 176) = result;
  return result;
}

void prs_feature_population_ctx_destroy(uint64_t a1)
{
  char v2 = *(const void **)a1;
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(const void **)(a1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x238], 8) = 0;
}

void __requiredTextFeatureAttributes_block_invoke()
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23658];
  v21[0] = *MEMORY[0x1E4F22CE8];
  v21[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F22B30];
  v21[2] = *MEMORY[0x1E4F235C0];
  v21[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F234B0];
  v21[4] = *MEMORY[0x1E4F22AD8];
  v21[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F23160];
  v21[6] = *MEMORY[0x1E4F22A68];
  v21[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22C58];
  v21[8] = *MEMORY[0x1E4F22A78];
  v21[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F23190];
  v21[10] = *MEMORY[0x1E4F22CD0];
  v21[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F22C08];
  v21[12] = *MEMORY[0x1E4F230C8];
  v21[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22FD0];
  v21[14] = *MEMORY[0x1E4F23060];
  v21[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F22AE0];
  v21[16] = *MEMORY[0x1E4F23158];
  v21[17] = v8;
  uint64_t v22 = *MEMORY[0x1E4F22B18];
  uint64_t v23 = v22;
  uint64_t v24 = *MEMORY[0x1E4F233C8];
  uint64_t v25 = v24;
  uint64_t v9 = *MEMORY[0x1E4F23250];
  uint64_t v26 = *MEMORY[0x1E4F232E0];
  uint64_t v27 = v9;
  uint64_t v10 = *MEMORY[0x1E4F232D8];
  uint64_t v28 = *MEMORY[0x1E4F23248];
  uint64_t v29 = v10;
  uint64_t v11 = *MEMORY[0x1E4F23270];
  uint64_t v30 = *MEMORY[0x1E4F23278];
  uint64_t v31 = v11;
  uint64_t v12 = *MEMORY[0x1E4F232F8];
  uint64_t v32 = *MEMORY[0x1E4F23280];
  uint64_t v33 = v12;
  uint64_t v13 = *MEMORY[0x1E4F23350];
  uint64_t v34 = *MEMORY[0x1E4F23340];
  uint64_t v35 = v13;
  uint64_t v14 = *MEMORY[0x1E4F23298];
  uint64_t v36 = *MEMORY[0x1E4F23370];
  uint64_t v37 = v14;
  uint64_t v15 = *MEMORY[0x1E4F232A0];
  uint64_t v38 = *MEMORY[0x1E4F232C0];
  uint64_t v39 = v15;
  uint64_t v16 = *MEMORY[0x1E4F23260];
  uint64_t v40 = *MEMORY[0x1E4F23378];
  uint64_t v41 = v16;
  uint64_t v17 = *MEMORY[0x1E4F22A20];
  uint64_t v42 = *MEMORY[0x1E4F22A18];
  uint64_t v43 = v17;
  uint64_t v18 = *MEMORY[0x1E4F236D8];
  uint64_t v44 = *MEMORY[0x1E4F22FC0];
  uint64_t v45 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:42];
  BOOL v20 = (void *)requiredTextFeatureAttributes_attrs;
  requiredTextFeatureAttributes_attrs = v19;
}

void __requiredContactAttributes_block_invoke()
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F231C8];
  v4[0] = *MEMORY[0x1E4F23058];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F23198];
  v4[2] = *MEMORY[0x1E4F23028];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v3 = (void *)requiredContactAttributes_attrs;
  requiredContactAttributes_attrs = v2;
}

void __requiredParsecTextFeatureAttributes_block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F22CD0];
  v3[0] = *MEMORY[0x1E4F23658];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F23660];
  v3[3] = @"kParsecCompletedQuery";
  v3[4] = @"kParsecCorrectedQuery";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  uint64_t v2 = (void *)requiredParsecTextFeatureAttributes_attrs;
  requiredParsecTextFeatureAttributes_attrs = v1;
}

id WorldClockDebugLog()
{
  if (WorldClockDebugLog_onceToken != -1) {
    dispatch_once(&WorldClockDebugLog_onceToken, &__block_literal_global_395);
  }
  uint64_t v0 = (void *)WorldClockDebugLog_log;
  return v0;
}

void sub_1BDC18604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

uint64_t __WorldClockDebugLog_block_invoke()
{
  WorldClockDebugLog_log = (uint64_t)os_log_create("com.apple.SpotlightServices", "WorldClock");
  return MEMORY[0x1F41817F8]();
}

BOOL gShouldUpdateOnMax_block_invoke(float a1, float a2)
{
  return a2 < 2147500000.0 && a2 > a1;
}

BOOL gShouldUpdateOnMin_block_invoke_2(float a1, float a2)
{
  return a2 > -1.0 && a2 < a1;
}

void updateVIPRankingQuery(void *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    objc_msgSend(v2, "appendFormat:", @"FieldMatch(%@,"), *MEMORY[0x1E4F22B18];
    objc_msgSend(v3, "appendFormat:", @"FieldMatch(%@,"), *MEMORY[0x1E4F233C8];
    objc_msgSend(v4, "appendFormat:", @"FieldMatch(%@,"), *MEMORY[0x1E4F22D48];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v1;
    obuint64_t j = v1;
    uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v32;
      uint64_t v23 = *(void *)v32;
LABEL_4:
      uint64_t v9 = 0;
      uint64_t v24 = v6;
      while (1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        if (v7 == 20) {
          break;
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v26 = v7;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v11 = [v10 objectForKey:@"emailAddresses"];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                [v2 appendFormat:@"\"%@\",", v16];
                [v3 appendFormat:@"\"%@\",", v16];
                [v4 appendFormat:@"\"%@\",", v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v13);
          }

          int v7 = v26;
          uint64_t v8 = v23;
          uint64_t v6 = v24;
        }
        else
        {
          [v2 appendFormat:@"\"%@\",", v10];
          [v3 appendFormat:@"\"%@\",", v10];
          [v4 appendFormat:@"\"%@\",", v10];
        }
        ++v7;
        if (++v9 == v6)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    replaceLastCharacterOfString(v2);
    replaceLastCharacterOfString(v3);
    replaceLastCharacterOfString(v4);
    pthread_mutex_lock(&sVIPLock_0);
    uint64_t v17 = (void *)sReceiverInVIPQuery;
    sReceiverInVIPQuery = (uint64_t)v3;
    id v18 = v3;

    uint64_t v19 = (void *)sSenderInVIPQuery;
    sSenderInVIPQuery = (uint64_t)v2;
    id v20 = v2;

    float v21 = (void *)sEmailAddressInVIPQuery;
    sEmailAddressInVIPQuery = (uint64_t)v4;

    pthread_mutex_unlock(&sVIPLock_0);
    id v1 = v22;
  }
}

void replaceLastCharacterOfString(void *a1)
{
  id v1 = a1;
  [v1 replaceCharactersInRange:objc_msgSend(v1, "length") - 1, 1, @"" withString]);
}

void updatePhoneFavoritesQuery(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = objc_opt_new();
    objc_msgSend(v2, "appendFormat:", @"FieldMatch(%@,"), *MEMORY[0x1E4F22B10];
    objc_msgSend(v3, "appendFormat:", @"FieldMatch(%@,"), *MEMORY[0x1E4F234A0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v18;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v7 + v9 == 20) {
          break;
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        [v2 appendFormat:@"%@,", v10];
        [v3 appendFormat:@"%@,", v10];
        if (v6 == ++v9)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          v7 += v9;
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    replaceLastCharacterOfString(v2);
    replaceLastCharacterOfString(v3);
    pthread_mutex_lock(&sVIPLock_0);
    uint64_t v11 = (void *)sSenderInPhoneFavoritesQuery;
    sSenderInPhoneFavoritesQuery = (uint64_t)v2;
    id v12 = v2;

    uint64_t v13 = (void *)sReceiverInPhoneFavoritesQuery;
    sReceiverInPhoneFavoritesQuery = (uint64_t)v3;
    id v14 = v3;

    uint64_t v15 = [v4 copy];
    uint64_t v16 = (void *)sPhoneFavorites;
    sPhoneFavorites = v15;

    pthread_mutex_unlock(&sVIPLock_0);
  }
}

BOOL addEndChar(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = (([v3 isEqualToString:*MEMORY[0x1E4F22B18]] & 1) != 0
     || [v3 isEqualToString:*MEMORY[0x1E4F233C8]])
    && ![v4 containsString:@"@"];

  return v5;
}

void PRSRankingQueryInfoAdd(void *a1, int a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if ((a2 & 1) == 0 && *a1 <= 0xFFuLL)
  {
    *((_DWORD *)a1 + *a1 + 2) = a2;
    a1[*a1 + 129] = a3;
    id v9 = v8;
    objc_storeStrong((id *)&a1[*a1 + 385], a4);
    id v8 = v9;
    ++*a1;
  }
}

uint64_t PRSRankingQueryImportantBits(int a1)
{
  id v1 = &sPRSImportantBitsSuggestions;
  if (a1) {
    id v1 = &sPRSImportantBitsSearch;
  }
  return *v1;
}

id PRSRankingItemRankerAddJunkFilter(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if ([v9 isEqualToString:@"false"])
          {
            uint64_t v10 = v2;
            uint64_t v11 = @"false";
          }
          else
          {
            if (![v9 isEqualToString:@"true"])
            {
              char v15 = [v9 hasPrefix:@"$"];
              id v16 = [NSString alloc];
              long long v17 = v16;
              if (v15)
              {
                long long v18 = [v9 substringFromIndex:1];
                long long v19 = (void *)[v17 initWithFormat:@"$(kMDItemIsLikelyJunk!=*||InRange(kMDItemIsLikelyJunk,0,0)) && (%@)", v18];
                [v2 addObject:v19];
              }
              else
              {
                long long v18 = (void *)[v16 initWithFormat:@"(!InRange(kMDItemIsLikelyJunk,1,1)) && (%@)", v9];
                [v2 addObject:v18];
              }

              goto LABEL_21;
            }
            uint64_t v10 = v2;
            uint64_t v11 = CFSTR("(!InRange(kMDItemIsLikelyJunk,1,1)");
          }
          [v10 addObject:v11];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v2 addObject:v8];
            continue;
          }
          id v12 = v8;
          id v9 = [v12 objectForKey:@"kCIMatchArray"];
          if (v9)
          {
            uint64_t v13 = (void *)[v12 mutableCopy];

            id v14 = PRSRankingItemRankerAddJunkFilter(v9);
            [v13 setObject:v14 forKey:@"kCIMatchArray"];

            id v12 = v13;
          }
          [v2 addObject:v12];
        }
LABEL_21:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v2;
}

id _PRSRankingQueries(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10, void *a11, uint64_t a12, unsigned __int8 a13, void *a14, void *a15)
{
  char v15 = (void *)MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  long long v17 = v16;
  long long v19 = v18;
  long long v21 = v20;
  long long v23 = v22;
  uint64_t v25 = v24;
  long long v27 = v26;
  long long v29 = v28;
  v540[8] = *MEMORY[0x1E4F143B8];
  id v394 = v15;
  id v478 = v29;
  id v514 = v27;
  id v30 = v25;
  id v512 = v23;
  id v393 = v21;
  id v392 = v19;
  id v453 = v17;
  id v454 = a9;
  id v457 = a11;
  id v31 = a14;
  id v391 = a15;
  v507 = v30;
  v380 = v31;
  if (([v391 isEqualToString:@"com.apple.searchd"] & 1) != 0
    || [MEMORY[0x1E4FA5D58] usingPommesRankingForClientBundle:v391])
  {
    long long v32 = v457;
    if (((v394 != 0) & a13) != 0) {
      long long v32 = v394;
    }
    id v33 = v32;
    if (getPortraitPeopleQueryWithTimeout_once != -1) {
      dispatch_once(&getPortraitPeopleQueryWithTimeout_once, &__block_literal_global_1369);
    }
    unint64_t v515 = 0;
    v516 = &v515;
    uint64_t v517 = 0x3032000000;
    v518 = __Block_byref_object_copy__12;
    v519 = __Block_byref_object_dispose__12;
    id v520 = 0;
    dispatch_group_t v34 = dispatch_group_create();
    uint64_t v35 = (void *)getPortraitPeopleQueryWithTimeout_portraitQueue;
    v527[0] = MEMORY[0x1E4F143A8];
    v527[1] = 3221225472;
    v527[2] = __getPortraitPeopleQueryWithTimeout_block_invoke_2;
    v527[3] = &unk_1E634C768;
    v529 = &v515;
    id v36 = v33;
    id v528 = v36;
    uint64_t v37 = v527;
    uint64_t v38 = v35;
    uint64_t v39 = v34;
    qos_class_t v40 = qos_class_self();
    if (v40 < 0x1A) {
      dispatch_block_t v41 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
    }
    else {
      dispatch_block_t v41 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v40, 0, v37);
    }
    uint64_t v42 = v41;

    dispatch_group_async(v39, v38, v42);
    dispatch_time_t v43 = dispatch_time(0, 20000000);
    if (dispatch_group_wait(v39, v43))
    {
      uint64_t v44 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v526[0] = 0;
        _os_log_impl(&dword_1BDB2A000, v44, OS_LOG_TYPE_DEFAULT, "Portrait query timed out", (uint8_t *)v526, 2u);
      }

      v449 = @"false";
    }
    else
    {
      v449 = (__CFString *)(id)v516[5];
    }

    _Block_object_dispose(&v515, 8);
  }
  else
  {
    v449 = @"false";
  }
  if (v478)
  {
    BOOL v492 = SSStringStartsWithDoubleQuote(v478);
    BOOL v490 = SSStringEndsWithDoubleQuote(v478);
    int v45 = SSStringEndsWithSpace(v478);
  }
  else
  {
    BOOL v492 = 0;
    BOOL v490 = 0;
    int v45 = 0;
  }
  unint64_t v499 = [v30 length];
  uint64_t v46 = "**";
  if (v499 < 4) {
    uint64_t v46 = "*";
  }
  v496 = v46;
  if (v512 && [v512 count])
  {
    unint64_t v47 = [v512 componentsJoinedByString:@" "];
  }
  else
  {
    unint64_t v47 = SSPhraseQueryEscapeString(v478, 0);
  }
  id v473 = v47;

  float v48 = _recencyInterval(@"-1Y", @"-1M", @"+1Y", @"-1M");
  v540[0] = v48;
  float v49 = _recencyInterval(@"-270d", @"-1d", @"+1Y", @"-1M");
  v540[1] = v49;
  __int16 v50 = _recencyInterval(@"-180d", @"-1d", @"+6M", @"-1M");
  v540[2] = v50;
  float v51 = _recencyInterval(@"-90d", @"-1d", @"+3M", @"-1M");
  v540[3] = v51;
  float v52 = _recencyInterval(@"-30d", @"-1d", @"+1M", @"-1M");
  v540[4] = v52;
  unint64_t v53 = _recencyInterval(@"-15d", @"-1d", @"+2w", @"-1M");
  v540[5] = v53;
  float v54 = _recencyInterval(@"-7d", @"-1d", @"+1w", @"-2w");
  v540[6] = v54;
  float v55 = _recencyInterval(@"-1d", @"-1d", @"+1d", @"-1d");
  v540[7] = v55;
  v508 = [MEMORY[0x1E4F1C978] arrayWithObjects:v540 count:8];

  if (sMeCardEmailsQuery)
  {
LABEL_27:
    id v450 = 0;
    goto LABEL_45;
  }
  if (![v393 count])
  {
    if ([v392 length])
    {
      [NSString stringWithFormat:@"(%@=\"%@\"", *MEMORY[0x1E4F22B10], v392];
      id v450 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    goto LABEL_27;
  }
  uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", CFSTR("(FieldMatch(%@,"), *MEMORY[0x1E4F22B18]);
  long long v524 = 0u;
  long long v525 = 0u;
  long long v522 = 0u;
  long long v523 = 0u;
  id v57 = v393;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v522 objects:v539 count:16];
  if (v58)
  {
    int v59 = 0;
    uint64_t v60 = *(void *)v523;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v523 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = @"\"%@\"";
        if (v59 + i)
        {
          if (v59 + i == 20) {
            goto LABEL_39;
          }
          uint64_t v62 = @",\"%@\"";
        }
        objc_msgSend(v56, "appendFormat:", v62, *(void *)(*((void *)&v522 + 1) + 8 * i));
      }
      uint64_t v58 = [v57 countByEnumeratingWithState:&v522 objects:v539 count:16];
      v59 += i;
    }
    while (v58);
  }
LABEL_39:

  if ([v392 length]) {
    [v56 appendFormat:@"||%@=\"%@\"]"), *MEMORY[0x1E4F22B10], v392);
  }
  else {
    [v56 appendString:@""]);
  }
  id v450 = v56;

LABEL_45:
  if ([v454 count] && !sSenderInVIPQuery) {
    updateVIPRankingQuery(v454);
  }
  if ([v453 count] && !sSenderInPhoneFavoritesQuery) {
    updatePhoneFavoritesQuery(v453);
  }
  pthread_mutex_lock(&sVIPLock_0);
  if (sMeCardEmailsQuery) {
    uint64_t v63 = (void *)sMeCardEmailsQuery;
  }
  else {
    uint64_t v63 = v450;
  }
  objc_storeStrong((id *)&sMeCardEmailsQuery, v63);
  uint64_t v64 = [(id)sMeCardEmailsQuery length];
  uint64_t v65 = (__CFString *)sMeCardEmailsQuery;
  if (!v64) {
    uint64_t v65 = @"false";
  }
  v511 = v65;
  uint64_t v66 = [(id)sReceiverInVIPQuery length];
  uint64_t v67 = (__CFString *)sReceiverInVIPQuery;
  if (!v66) {
    uint64_t v67 = @"false";
  }
  v455 = v67;
  uint64_t v68 = [(id)sSenderInVIPQuery length];
  uint64_t v69 = (__CFString *)sSenderInVIPQuery;
  if (!v68) {
    uint64_t v69 = @"false";
  }
  v489 = v69;
  uint64_t v70 = [(id)sEmailAddressInVIPQuery length];
  uint64_t v71 = (__CFString *)sEmailAddressInVIPQuery;
  if (!v70) {
    uint64_t v71 = @"false";
  }
  v448 = v71;
  uint64_t v72 = [(id)sSenderInPhoneFavoritesQuery length];
  uint64_t v73 = (__CFString *)sSenderInPhoneFavoritesQuery;
  if (!v72) {
    uint64_t v73 = @"false";
  }
  v477 = v73;
  uint64_t v74 = [(id)sReceiverInPhoneFavoritesQuery length];
  uint64_t v75 = (__CFString *)sReceiverInPhoneFavoritesQuery;
  if (!v74) {
    uint64_t v75 = @"false";
  }
  v447 = v75;
  pthread_mutex_unlock(&sVIPLock_0);
  uint64_t v76 = [(__CFString *)v489 length];
  uint64_t v77 = (void *)MEMORY[0x1E4F23710];
  if (v76 || [(__CFString *)v477 length])
  {
    v505 = [NSString stringWithFormat:@"InRange(%@,1,1)", *v77];
    if ([(__CFString *)v489 length])
    {
      uint64_t v78 = [NSString stringWithFormat:@"((%@) || (%@))", v505, v489];

      v505 = (__CFString *)v78;
    }
    if ([(__CFString *)v477 length])
    {
      uint64_t v79 = [NSString stringWithFormat:@"%@ || %@", v505, v477];

      v505 = (__CFString *)v79;
    }
    if ([(id)sReceiverInVIPQuery length])
    {
      uint64_t v80 = [NSString stringWithFormat:@"((%@) || (%@))", v505, v455];

      v505 = (__CFString *)v80;
    }
  }
  else
  {
    v505 = @"false";
  }
  uint64_t v503 = *MEMORY[0x1E4F22CE8];
  uint64_t v81 = __MDQueryStringCreateForRanking();
  uint64_t v82 = (void *)v81;
  if (v81) {
    uint64_t v83 = (__CFString *)v81;
  }
  else {
    uint64_t v83 = @"false";
  }
  v467 = v83;

  uint64_t v84 = __MDQueryStringCreateForRanking();
  uint64_t v85 = (void *)v84;
  if (v84) {
    uint64_t v86 = (__CFString *)v84;
  }
  else {
    uint64_t v86 = @"false";
  }
  v468 = v86;

  uint64_t v87 = __MDQueryStringCreateForRanking();
  uint64_t v88 = (void *)v87;
  if (v87) {
    uint64_t v89 = (__CFString *)v87;
  }
  else {
    uint64_t v89 = @"false";
  }
  v472 = v89;

  uint64_t v90 = __MDQueryStringCreateForRanking();
  uint64_t v91 = (void *)v90;
  if (v90) {
    uint64_t v92 = (__CFString *)v90;
  }
  else {
    uint64_t v92 = @"false";
  }
  v485 = v92;

  uint64_t v93 = __MDQueryStringCreateForRanking();
  uint64_t v94 = (void *)v93;
  if (v93) {
    uint64_t v95 = (__CFString *)v93;
  }
  else {
    uint64_t v95 = @"false";
  }
  v469 = v95;

  uint64_t v96 = __MDQueryStringCreateForRanking();
  uint64_t v97 = (void *)v96;
  if (v96) {
    uint64_t v98 = (__CFString *)v96;
  }
  else {
    uint64_t v98 = @"false";
  }
  v442 = v98;

  uint64_t v502 = *MEMORY[0x1E4F235C0];
  uint64_t v99 = __MDQueryStringCreateForRanking();
  uint64_t v100 = (void *)v99;
  if (v99) {
    uint64_t v101 = (__CFString *)v99;
  }
  else {
    uint64_t v101 = @"false";
  }
  v462 = v101;

  uint64_t v102 = __MDQueryStringCreateForRanking();
  uint64_t v103 = (void *)v102;
  if (v102) {
    uint64_t v104 = (__CFString *)v102;
  }
  else {
    uint64_t v104 = @"false";
  }
  v464 = v104;

  uint64_t v105 = __MDQueryStringCreateForRanking();
  uint64_t v106 = (void *)v105;
  if (v105) {
    uint64_t v107 = (__CFString *)v105;
  }
  else {
    uint64_t v107 = @"false";
  }
  v470 = v107;

  uint64_t v108 = __MDQueryStringCreateForRanking();
  uint64_t v109 = (void *)v108;
  if (v108) {
    uint64_t v110 = (__CFString *)v108;
  }
  else {
    uint64_t v110 = @"false";
  }
  v484 = v110;

  uint64_t v111 = __MDQueryStringCreateForRanking();
  uint64_t v112 = (void *)v111;
  if (v111) {
    uint64_t v113 = (__CFString *)v111;
  }
  else {
    uint64_t v113 = @"false";
  }
  v466 = v113;

  uint64_t v501 = *MEMORY[0x1E4F22B30];
  uint64_t v114 = __MDQueryStringCreateForRanking();
  uint64_t v115 = (void *)v114;
  if (v114) {
    uint64_t v116 = (__CFString *)v114;
  }
  else {
    uint64_t v116 = @"false";
  }
  v446 = v116;

  uint64_t v117 = __MDQueryStringCreateForRanking();
  uint64_t v118 = (void *)v117;
  if (v117) {
    uint64_t v119 = (__CFString *)v117;
  }
  else {
    uint64_t v119 = @"false";
  }
  v486 = v119;

  uint64_t v120 = __MDQueryStringCreateForRanking();
  uint64_t v121 = (void *)v120;
  if (v120) {
    uint64_t v122 = (__CFString *)v120;
  }
  else {
    uint64_t v122 = @"false";
  }
  v488 = v122;

  uint64_t v123 = __MDQueryStringCreateForRanking();
  uint64_t v124 = (void *)v123;
  if (v123) {
    uint64_t v125 = (__CFString *)v123;
  }
  else {
    uint64_t v125 = @"false";
  }
  v487 = v125;

  uint64_t v126 = __MDQueryStringCreateForRanking();
  uint64_t v127 = (void *)v126;
  if (v126) {
    uint64_t v128 = (__CFString *)v126;
  }
  else {
    uint64_t v128 = @"false";
  }
  v471 = v128;

  uint64_t v129 = *MEMORY[0x1E4F232F8];
  uint64_t v130 = __MDQueryStringCreateForRanking();
  uint64_t v131 = (void *)v130;
  if (v130) {
    uint64_t v132 = (__CFString *)v130;
  }
  else {
    uint64_t v132 = @"false";
  }
  v461 = v132;

  uint64_t v133 = __MDQueryStringCreateForRanking();
  uint64_t v134 = (void *)v133;
  if (v133) {
    uint64_t v135 = (__CFString *)v133;
  }
  else {
    uint64_t v135 = @"false";
  }
  v480 = v135;

  uint64_t v136 = __MDQueryStringCreateForRanking();
  uint64_t v137 = (void *)v136;
  if (v136) {
    uint64_t v138 = (__CFString *)v136;
  }
  else {
    uint64_t v138 = @"false";
  }
  v483 = v138;

  uint64_t v139 = __MDQueryStringCreateForRanking();
  uint64_t v140 = (void *)v139;
  if (v139) {
    uint64_t v141 = (__CFString *)v139;
  }
  else {
    uint64_t v141 = @"false";
  }
  v481 = v141;

  uint64_t v142 = __MDQueryStringCreateForRanking();
  uint64_t v143 = (void *)v142;
  if (v142) {
    uint64_t v144 = (__CFString *)v142;
  }
  else {
    uint64_t v144 = @"false";
  }
  v479 = v144;

  uint64_t v498 = *MEMORY[0x1E4F234B0];
  uint64_t v145 = __MDQueryStringCreateForRanking();
  uint64_t v146 = (void *)v145;
  if (v145) {
    uint64_t v147 = (__CFString *)v145;
  }
  else {
    uint64_t v147 = @"false";
  }
  v456 = v147;

  uint64_t v148 = __MDQueryStringCreateForRanking();
  uint64_t v149 = (void *)v148;
  if (v148) {
    uint64_t v150 = (__CFString *)v148;
  }
  else {
    uint64_t v150 = @"false";
  }
  v474 = v150;

  uint64_t v151 = __MDQueryStringCreateForRanking();
  uint64_t v152 = (void *)v151;
  if (v151) {
    uint64_t v153 = (__CFString *)v151;
  }
  else {
    uint64_t v153 = @"false";
  }
  v476 = v153;

  uint64_t v154 = __MDQueryStringCreateForRanking();
  uint64_t v155 = (void *)v154;
  if (v154) {
    v156 = (__CFString *)v154;
  }
  else {
    v156 = @"false";
  }
  v475 = v156;

  uint64_t v157 = __MDQueryStringCreateForRanking();
  v158 = (void *)v157;
  if (v157) {
    id v159 = (__CFString *)v157;
  }
  else {
    id v159 = @"false";
  }
  v452 = v159;

  uint64_t v509 = *MEMORY[0x1E4F23658];
  uint64_t v160 = __MDQueryStringCreateForRanking();
  v161 = (void *)v160;
  if (v160) {
    v162 = (__CFString *)v160;
  }
  else {
    v162 = @"false";
  }
  v458 = v162;

  uint64_t v163 = __MDQueryStringCreateForRanking();
  unsigned int v164 = (void *)v163;
  if (v163) {
    v165 = (__CFString *)v163;
  }
  else {
    v165 = @"false";
  }
  v459 = v165;

  uint64_t v166 = __MDQueryStringCreateForRanking();
  v167 = (void *)v166;
  if (v166) {
    long long v168 = (__CFString *)v166;
  }
  else {
    long long v168 = @"false";
  }
  v463 = v168;

  uint64_t v169 = __MDQueryStringCreateForRanking();
  long long v170 = (void *)v169;
  if (v169) {
    long long v171 = (__CFString *)v169;
  }
  else {
    long long v171 = @"false";
  }
  v482 = v171;

  uint64_t v172 = __MDQueryStringCreateForRanking();
  v173 = (void *)v172;
  if (v172) {
    v174 = (__CFString *)v172;
  }
  else {
    v174 = @"false";
  }
  v460 = v174;

  uint64_t v175 = __MDQueryStringCreateForRanking();
  id v176 = (void *)v175;
  if (v175) {
    v177 = (__CFString *)v175;
  }
  else {
    v177 = @"false";
  }
  v465 = v177;

  uint64_t v178 = __MDQueryStringCreateForRanking();
  __int16 v179 = (void *)v178;
  if (v178) {
    v180 = (__CFString *)v178;
  }
  else {
    v180 = @"false";
  }
  v445 = v180;

  uint64_t v181 = __MDQueryStringCreateForRanking();
  v182 = (void *)v181;
  if (v181) {
    __int16 v183 = (__CFString *)v181;
  }
  else {
    __int16 v183 = @"false";
  }
  v444 = v183;

  uint64_t v184 = __MDQueryStringCreateForRanking();
  __int16 v185 = (void *)v184;
  if (v184) {
    uint64_t v186 = (__CFString *)v184;
  }
  else {
    uint64_t v186 = @"false";
  }
  v443 = v186;

  uint64_t v187 = __MDQueryStringCreateForRanking();
  v188 = (void *)v187;
  if (v187) {
    v189 = (__CFString *)v187;
  }
  else {
    v189 = @"false";
  }
  v441 = v189;

  uint64_t v190 = __MDQueryStringCreateForRanking();
  v191 = (void *)v190;
  if (v190) {
    v192 = (__CFString *)v190;
  }
  else {
    v192 = @"false";
  }
  v440 = v192;

  uint64_t v193 = __MDQueryStringCreateForRanking();
  v194 = (void *)v193;
  if (v193) {
    v195 = (__CFString *)v193;
  }
  else {
    v195 = @"false";
  }
  v439 = v195;

  uint64_t v196 = __MDQueryStringCreateForRanking();
  v197 = (void *)v196;
  if (v196) {
    v198 = (__CFString *)v196;
  }
  else {
    v198 = @"false";
  }
  v438 = v198;

  uint64_t v199 = __MDQueryStringCreateForRanking();
  v200 = (void *)v199;
  if (v199) {
    v201 = (__CFString *)v199;
  }
  else {
    v201 = @"false";
  }
  v437 = v201;

  uint64_t v202 = *MEMORY[0x1E4F22AE0];
  uint64_t v203 = __MDQueryStringCreateForRanking();
  v204 = (void *)v203;
  if (v203) {
    v205 = (__CFString *)v203;
  }
  else {
    v205 = @"false";
  }
  v388 = v205;

  uint64_t v206 = __MDQueryStringCreateForRanking();
  v207 = (void *)v206;
  if (v206) {
    v208 = (__CFString *)v206;
  }
  else {
    v208 = @"false";
  }
  v389 = v208;

  uint64_t v209 = __MDQueryStringCreateForRanking();
  v210 = (void *)v209;
  if (v209) {
    v211 = (__CFString *)v209;
  }
  else {
    v211 = @"false";
  }
  v420 = v211;

  uint64_t v212 = __MDQueryStringCreateForRanking();
  v213 = (void *)v212;
  if (v212) {
    v214 = (__CFString *)v212;
  }
  else {
    v214 = @"false";
  }
  v390 = v214;

  uint64_t v215 = __MDQueryStringCreateForRanking();
  v216 = (void *)v215;
  if (v215) {
    v217 = (__CFString *)v215;
  }
  else {
    v217 = @"false";
  }
  v387 = v217;

  if ([v514 length])
  {
    uint64_t v218 = __MDQueryStringCreateForRanking();
    v219 = (void *)v218;
    if (v218) {
      v220 = (__CFString *)v218;
    }
    else {
      v220 = @"false";
    }
    v436 = v220;
  }
  else
  {
    v436 = @"false";
  }
  uint64_t v221 = __MDQueryStringCreateForRanking();
  v222 = (void *)v221;
  if (v221) {
    v223 = (__CFString *)v221;
  }
  else {
    v223 = @"false";
  }
  v435 = v223;

  uint64_t v224 = __MDQueryStringCreateForRanking();
  v225 = (void *)v224;
  if (v224) {
    v226 = (__CFString *)v224;
  }
  else {
    v226 = @"false";
  }
  v431 = v226;

  uint64_t v227 = __MDQueryStringCreateForRanking();
  v228 = (void *)v227;
  if (v227) {
    v229 = (__CFString *)v227;
  }
  else {
    v229 = @"false";
  }
  v434 = v229;

  uint64_t v230 = __MDQueryStringCreateForRanking();
  v231 = (void *)v230;
  if (v230) {
    v232 = (__CFString *)v230;
  }
  else {
    v232 = @"false";
  }
  v433 = v232;

  uint64_t v233 = __MDQueryStringCreateForRanking();
  v234 = (void *)v233;
  if (v233) {
    v235 = (__CFString *)v233;
  }
  else {
    v235 = @"false";
  }
  v427 = v235;

  uint64_t v236 = __MDQueryStringCreateForRanking();
  v237 = (void *)v236;
  if (v236) {
    v238 = (__CFString *)v236;
  }
  else {
    v238 = @"false";
  }
  v429 = v238;

  uint64_t v239 = __MDQueryStringCreateForRanking();
  v240 = (void *)v239;
  if (v239) {
    v241 = (__CFString *)v239;
  }
  else {
    v241 = @"false";
  }
  v432 = v241;

  uint64_t v242 = __MDQueryStringCreateForRanking();
  v243 = (void *)v242;
  if (v242) {
    v244 = (__CFString *)v242;
  }
  else {
    v244 = @"false";
  }
  v430 = v244;

  uint64_t v245 = __MDQueryStringCreateForRanking();
  v246 = (void *)v245;
  if (v245) {
    v247 = (__CFString *)v245;
  }
  else {
    v247 = @"false";
  }
  v424 = v247;

  uint64_t v248 = __MDQueryStringCreateForRanking();
  v249 = (void *)v248;
  if (v248) {
    v250 = (__CFString *)v248;
  }
  else {
    v250 = @"false";
  }
  v428 = v250;

  uint64_t v251 = __MDQueryStringCreateForRanking();
  v252 = (void *)v251;
  if (v251) {
    v253 = (__CFString *)v251;
  }
  else {
    v253 = @"false";
  }
  v426 = v253;

  uint64_t v254 = __MDQueryStringCreateForRanking();
  v255 = (void *)v254;
  if (v254) {
    v256 = (__CFString *)v254;
  }
  else {
    v256 = @"false";
  }
  v425 = v256;

  uint64_t v257 = __MDQueryStringCreateForRanking();
  v258 = (void *)v257;
  if (v257) {
    v259 = (__CFString *)v257;
  }
  else {
    v259 = @"false";
  }
  v423 = v259;

  uint64_t v260 = __MDQueryStringCreateForRanking();
  v261 = (void *)v260;
  if (v260) {
    v262 = (__CFString *)v260;
  }
  else {
    v262 = @"false";
  }
  v422 = v262;

  uint64_t v263 = __MDQueryStringCreateForRanking();
  v264 = (void *)v263;
  if (v263) {
    v265 = (__CFString *)v263;
  }
  else {
    v265 = @"false";
  }
  v421 = v265;

  v417 = [NSString stringWithFormat:@"((%@) || (%@)) && (!InRange(_kMDItemShortcutLastUsedDate, 0, $time.now(-%dd)))", v465, v445, 150];
  bzero(&v515, 0x1408uLL);
  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@ || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)) && (%@)", v472, v470, v488, v476, v511, v483, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v463, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  else {
  v266 = [NSString stringWithFormat:@"((%@) || ((%@ || %@ || %@) && %@) || (%@)) && (%@)", v472, v470, v488, v483, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v463, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemSpecialCondition1", v266);

  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"((%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)) && (%@)", v485, v484, v487, v475, v511, v481, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v482, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  else {
  v267 = [NSString stringWithFormat:@"((%@) || ((%@ || %@ || %@) && %@) || (%@)) && (%@)", v485, v484, v487, v481, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v482, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemSpecialCondition2", v267);

  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)", v469, v466, v471, v452, v511, v479, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v460];
  }
  else {
  v268 = [NSString stringWithFormat:@"(%@) || ((%@ || %@ || %@) && %@) || (%@)", v469, v466, v471, v479, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v460];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemSpecialCondition3", v268);

  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)", v468, v464, v486, v474, v511, v480, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v459];
  }
  else {
  v269 = [NSString stringWithFormat:@"(%@) || ((%@ || %@ || %@) && %@) || (%@)", v468, v464, v486, v480, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v459];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemSpecialCondition4", v269);

  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)", v467, v462, v446, v456, v511, v461, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v458];
  }
  else {
  v270 = [NSString stringWithFormat:@"(%@) || ((%@ || %@ || %@) && %@) || (%@)", v467, v462, v446, v461, @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))", v458];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemSpecialCondition5", v270);

  v271 = [NSString stringWithFormat:@"InRange(%@,1,1) || kMDItemUserTags=\"*\"", *v77];
  PRSRankingQueryInfoAdd(&v515, 0, @"ItemIsFlagged", v271);

  PRSRankingQueryInfoAdd(&v515, 0, @"PortraitImportantPeople", v449);
  PRSRankingQueryInfoAdd(&v515, 0, @"PhoneFavoritesInReceivers", v447);
  PRSRankingQueryInfoAdd(&v515, 0, @"PhoneFavoritesInSender", v477);
  PRSRankingQueryInfoAdd(&v515, 0, @"VIPInEmails", v448);
  PRSRankingQueryInfoAdd(&v515, 0, @"receiver_is_vip2", v455);
  PRSRankingQueryInfoAdd(&v515, 0, @"sender_is_vip2", v489);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemNamedLocationExactWord", v441);
  PRSRankingQueryInfoAdd(&v515, 8, @"kMDItemNamedLocationExactPrefix", v443);
  PRSRankingQueryInfoAdd(&v515, 16, @"kMDItemNamedLocationExact", v444);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemArtistPrefixTokenized", v439);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemArtistPrefixWord", v438);
  PRSRankingQueryInfoAdd(&v515, 4, @"kMDItemArtistExactWord", v437);
  PRSRankingQueryInfoAdd(&v515, 8, @"kMDItemArtistExactPrefix", v440);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemAuthorsPrefixTokenized", v488);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemRecipientsPrefixTokenized", v476);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemAuthorsPrefixWord", v487);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemRecipientsPrefixWord", v475);
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemAuthorsExactPrefix", v486);
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemRecipientsExactPrefix", v474);
  PRSRankingQueryInfoAdd(&v515, 128, @"kMDItemAuthorsExact", v486);
  PRSRankingQueryInfoAdd(&v515, 128, @"kMDItemRecipientsExact", v456);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemDisplayNamePrefixWord", v485);
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemSubjectPrefixWord", v484);
  v272 = [NSString stringWithFormat:@"(%@) && (%@)", v482, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemTitlePrefixWord", v272);

  if (v473)
  {
    v273 = [NSString stringWithFormat:@"%@=\"%@*\"cd", @"kMDItemUserTags", v473];
    PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemRankingTagMatch", v273);
  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemRankingTagMatch", @"false");
  }
  if ([(__CFString *)v511 length]) {
    v274 = v511;
  }
  else {
    v274 = @"false";
  }
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemUserIsSender", v274);
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemContentCreationRecent", @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemMailDateReceived_Ranking,$time.today(-7d),$time.now(+1d)))");
  if (v473)
  {
    v275 = [NSString stringWithFormat:@"%s=\"%@*\"cwdt", v496, v473];
    PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEscapedWord", v275);
  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEscapedWord", @"false");
  }
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemCreationDateThisYear", @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1Y),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1Y), $time.now))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemLastUsedDateThisYear", @"InRange(kMDItemLastUsedDate_Ranking,$time.today(-1Y),$time.now)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemContentCreationThisMonth", @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1M),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1M), $time.now))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemLastUsedDateThisMonth", @"InRange(kMDItemLastUsedDate_Ranking,$time.today(-1M),$time.now)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemContentCreationThisWeek", @"(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1w),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1w), $time.now))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemLastUsedDateThisWeek", @"InRange(kMDItemLastUsedDate_Ranking,$time.today(-1w),$time.now)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventTodayToNextYear", @"InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1Y))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventLastMonthToToday", @"InRange(kMDItemStartDate_Ranking,$time.today(-1M),$time.today)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventTodayToNextMonth", @"InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1M))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventTodayToNextWeek", @"InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1w))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventTodayToLastWeek", @"InRange(kMDItemStartDate_Ranking,$time.today(-1w),$time.today)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventYesterdayToToday", @"InRange(kMDItemStartDate,$time.today(-1d),$time.today)");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemEventToday", @"InRange(kMDItemStartDate,$time.today,$time.today(+1d))");
  if (v499 >= 4) {
    v276 = v435;
  }
  else {
    v276 = @"false";
  }
  if (v499 >= 4) {
    v277 = v436;
  }
  else {
    v277 = @"false";
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemTextContentTokenizedMatch", v276);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemTextContentMatch", v277);
  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@ || (%@ && %@) || %@)", v488, v476, v511, v483];
  }
  else {
  v278 = [NSString stringWithFormat:@"(%@ || %@)", v488, v483];
  }
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemAuthorsOrRecipientsTokenizedPrefixMatch", v278);

  v279 = [NSString stringWithFormat:@"%@", v434];
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemDescriptionTokenizedPrefixMatch", v279);

  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemAlbumTokenizedPrefixMatch", v432);
  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@ || (%@ && %@) || %@)", v487, v475, v511, v481];
  }
  else {
  v280 = [NSString stringWithFormat:@"(%@ || %@)", v487, v481];
  }
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch", v280);

  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemDescriptionPrefixWordMatch", v433);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemComposerPrefixWordMatch", v426);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemAlbumPrefixWordMatch", v430);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemComposerNonTokenizedPrefixMatch", v428);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemComposerNonTokenizedWordMatch", v425);
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemAppSBLaunchedDateLastWeek", @"InRange(_kMDItemApplicationLastLaunchedDate,$time.today(-7d),$time.today(+1d))");
  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@ || (%@ && %@) || %@)", v486, v474, v511, v480];
  }
  else {
  v281 = [NSString stringWithFormat:@"(%@ || %@)", v486, v480];
  }
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemAuthorsOrRecipientsPrefixWordMatch", v281);

  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemDescriptionExactPrefixMatch", v431);
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemAlbumNonTokenizedPrefixMatch", v429);
  if ([(__CFString *)v511 length]) {
    [NSString stringWithFormat:@"(%@ || (%@ && %@) || %@)", v471, v452, v511, v479];
  }
  else {
  v282 = [NSString stringWithFormat:@"%@ || %@", v471, v479];
  }
  PRSRankingQueryInfoAdd(&v515, 32, @"kMDItemAuthorsOrRecipientsExactMatch", v282);

  v283 = [NSString stringWithFormat:@"%@", v427];
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemDescriptionNonTokenizedWordMatch", v283);

  v284 = [NSString stringWithFormat:@"%@", v424];
  PRSRankingQueryInfoAdd(&v515, 4, @"kMDItemAlbumNonTokenizedWordMatch", v284);

  v285 = [NSString stringWithFormat:@"(_kMDItemUserActivityEligibleForPublicIndexing=1 || _kMDItemUserActivityEligibleForPublicIndexing=0)"];
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemUserActivity", v285);

  PRSRankingQueryInfoAdd(&v515, 32, @"kMDItemAlternateNameNonTokenizedWordMatch", v421);
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemAlternateNamePrefixWordMatch", v422);
  PRSRankingQueryInfoAdd(&v515, 128, @"kMDItemAlternateNameExactMatch", v423);
  v286 = [NSString stringWithFormat:@"%@ && (_kMDItemShortcutLastUsedDate>$time.now(-3d))", v465];
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemShortcutRecent", v286);

  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemDueDateInLastOneToNextTwentyFourHours", @"InRange(kMDItemDueDate,$time.today(-1h),$time.today(+1d))");
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemDueDateInLastOneToNextOneHour", @"InRange(kMDItemDueDate,$time.now(-1h),$time.now(+1h))");
  unint64_t v287 = [v457 length];
  unint64_t v288 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen];
  v289 = [NSString stringWithFormat:@"%@", v442];
  PRSRankingQueryInfoAdd(&v515, 2 * (v287 > v288), @"kMDItemDisplayNameCorrections", v289);

  v290 = [NSString stringWithFormat:@"((%@) || (%@) || (%@) || (%@)) && (%@)", v472, v470, v463, v483, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch", v290);

  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemContentCreationDateToday", @"(InRange(kMDItemContentCreationDate,$time.today(-1d),$time.now) || InRange(kMDItemDateAdded, $time.today(-1d), $time.now) || InRange(com_apple_mail_dateReceived, $time.today(-1d), $time.now))");
  if (v505) {
    v291 = v505;
  }
  else {
    v291 = @"false";
  }
  PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemBoostedVIPFavorites", v291);
  if (v505)
  {
    v292 = NSString;
    v293 = [v508 objectAtIndexedSubscript:4];
    v294 = [v292 stringWithFormat:@"(%@ && %@)", v505, v293];
    PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemBoostedVIPFavoritesRecent", v294);
  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 0, @"kMDItemBoostedVIPFavoritesRecent", @"false");
  }
  v295 = [NSString stringWithFormat:@"((%@) || (%@) || (%@) || (%@)) && (%@)", v485, v484, v482, v481, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  PRSRankingQueryInfoAdd(&v515, 512, @"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch", v295);

  v296 = [NSString stringWithFormat:@"((%@) || (%@) || (%@) || (%@)) && (%@)", v469, v466, v460, v479, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  PRSRankingQueryInfoAdd(&v515, 32, @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch", v296);

  v297 = [NSString stringWithFormat:@"(%@) || (%@) || (%@) || (%@)", v468, v464, v459, v480];
  PRSRankingQueryInfoAdd(&v515, 64, @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch", v297);

  v298 = [NSString stringWithFormat:@"(%@) || (%@) || (%@) || (%@)", v467, v462, v458, v461];
  PRSRankingQueryInfoAdd(&v515, 128, @"kMDItemDisplayNameOrSubjectOrTitleExactMatch", v298);

  v299 = [v508 objectAtIndexedSubscript:0];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency365Days", v299);

  v300 = [v508 objectAtIndexedSubscript:1];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency270Days", v300);

  v301 = [v508 objectAtIndexedSubscript:2];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency180Days", v301);

  v302 = [v508 objectAtIndexedSubscript:3];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency90Days", v302);

  v303 = [v508 objectAtIndexedSubscript:4];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency30Days", v303);

  v304 = [v508 objectAtIndexedSubscript:5];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency15Days", v304);

  v305 = [v508 objectAtIndexedSubscript:6];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency7Days", v305);

  v306 = [v508 objectAtIndexedSubscript:7];
  PRSRankingQueryInfoAdd(&v515, 0, @"PRSRankingRecency1Days", v306);

  uint64_t v307 = *MEMORY[0x1E4F22B18];
  v538[0] = v501;
  uint64_t v451 = v307;
  v538[1] = v307;
  v538[2] = v503;
  v538[3] = v502;
  v538[4] = v509;
  v538[5] = v129;
  uint64_t v308 = *MEMORY[0x1E4F23298];
  v538[6] = *MEMORY[0x1E4F232E0];
  v538[7] = v308;
  uint64_t v309 = *MEMORY[0x1E4F232C0];
  v538[8] = *MEMORY[0x1E4F23370];
  v538[9] = v309;
  uint64_t v310 = *MEMORY[0x1E4F23278];
  v538[10] = *MEMORY[0x1E4F23280];
  v538[11] = v310;
  uint64_t v311 = *MEMORY[0x1E4F23340];
  v538[12] = *MEMORY[0x1E4F23250];
  v538[13] = v311;
  uint64_t v312 = *MEMORY[0x1E4F23270];
  v538[14] = *MEMORY[0x1E4F23350];
  v538[15] = v312;
  uint64_t v313 = *MEMORY[0x1E4F232D8];
  v538[16] = *MEMORY[0x1E4F23248];
  v538[17] = v313;
  uint64_t v314 = *MEMORY[0x1E4F232B0];
  v538[18] = *MEMORY[0x1E4F232A0];
  v538[19] = v314;
  uint64_t v315 = *MEMORY[0x1E4F23260];
  v538[20] = *MEMORY[0x1E4F23378];
  v538[21] = v315;
  v538[22] = *MEMORY[0x1E4F22A20];
  v497 = [MEMORY[0x1E4F1C978] arrayWithObjects:v538 count:23];
  uint64_t v536 = v509;
  v535 = @"com.apple.mobilemail";
  v316 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v535 count:1];
  v537 = v316;
  v500 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v537 forKeys:&v536 count:1];

  v533[0] = v202;
  v533[1] = v129;
  v534[0] = &stru_1F1824018;
  v534[1] = &stru_1F1824018;
  v495 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v534 forKeys:v533 count:2];
  v532[0] = v202;
  v532[1] = v129;
  v494 = [MEMORY[0x1E4F1C978] arrayWithObjects:v532 count:2];
  id v317 = v512;
  v419 = _countingRankingQueryArray(v317, v497, 1);
  v418 = _countingRankingQueryArray(v317, v497, 0);
  v318 = NSString;
  v513 = v317;
  v319 = _rankingQueryPolicyComposite(v317, v497, v500, 0);
  v412 = [v318 stringWithFormat:@"((%@) && (kMDItemInterestingDate_Ranking==*))", v319];

  v320 = NSString;
  v321 = _rankingQueryPolicyComposite(v513, v497, v500, 1);
  v411 = [v320 stringWithFormat:@"((%@) && (kMDItemInterestingDate_Ranking==*))", v321];

  PRSRankingQueryInfoAdd(&v515, 1024, @"PRSRankingPrefixCount", v419);
  PRSRankingQueryInfoAdd(&v515, 2048, @"PRSRankingExactCount", v418);
  v410 = _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, v492, v490, v45, a12);
  uint64_t v322 = v509;
  uint64_t v323 = v202;
  if ((unint64_t)[v513 count] < 6)
  {
    uint64_t v325 = 7;
  }
  else
  {
    double v324 = (double)(unint64_t)[v513 count] * 1.5;
    if (v324 < 20.0) {
      double v324 = 20.0;
    }
    uint64_t v325 = (int)v324;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v416 = v390;
  }
  else
  {
    v326 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 7u, v492, v490, v45, a12, 0);
    v327 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 0, 1u);
    v328 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 0, 2u);
    _rankingJoinedTCClauses(v326, v327, v328, v325);
    v416 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v415 = v420;
  }
  else
  {
    v329 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 7u, v492, v490, v45, a12, 1);
    v330 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 1, 1u);
    v331 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 1, 2u);
    _rankingJoinedTCClauses(v329, v330, v331, v325);
    v415 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v414 = v420;
  }
  else
  {
    v332 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, v492, v490, v45, a12, 1);
    v333 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, 0, 1, 1u);
    v334 = _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, 0, 1, 2u);
    _rankingJoinedTCClauses(v332, v333, v334, 0);
    v414 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  v386 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 0, 1u);
  v383 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 1, 1u);
  v382 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, 0, 1, 1u);
  v405 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 1u);
  v404 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 1u);
  v407 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 1u);
  v409 = _rankingMultiPhraseQueryComposite(v513, 1, 0, v45, a12, 0, 1, 1u);
  v385 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 0, 2u);
  v384 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 1, 2u);
  v381 = _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, 0, 1, 2u);
  v403 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 2u);
  v406 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 2u);
  v402 = _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 2u);
  v408 = _rankingMultiPhraseQueryComposite(v513, 1, 0, v45, a12, 0, 1, 2u);
  if ((unint64_t)[v513 count] < 2)
  {
    v493 = @"false";
  }
  else
  {
    id v335 = v386;
    id v336 = v385;
    _rankingJoinedTCClauses(v335, v336, @"false", v325);
    v493 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v491 = @"false";
  }
  else
  {
    id v337 = v383;
    id v338 = v384;
    _rankingJoinedTCClauses(v337, v338, @"false", v325);
    v491 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v413 = @"false";
  }
  else
  {
    id v339 = v382;
    id v340 = v381;
    _rankingJoinedTCClauses(v339, v340, @"false", v325);
    v413 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  v531[0] = v501;
  v531[1] = v451;
  uint64_t v341 = *MEMORY[0x1E4F233C8];
  v531[2] = v498;
  v531[3] = v341;
  v531[4] = v502;
  v531[5] = v322;
  v531[6] = v503;
  v531[7] = v323;
  v401 = [MEMORY[0x1E4F1C978] arrayWithObjects:v531 count:8];
  v379 = _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, 255, 0, v45, a12, 1);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingMostlyExactMultiFieldsDomainTCMatch", v379);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCNearMatch", v416);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTwoTermsMultiPhraseTCNearMatch", v493);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCOrderedMatch", v415);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTwoTermsMultiPhraseTCOrderedMatch", v491);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCOrderedPhraseMatch", v414);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTwoTermsMultiPhraseTCOrderedPhraseMatch", v413);
  v400 = _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, 1u, 1, v45, a12);
  v399 = _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, 1u, 0, v45, a12);
  if ((unint64_t)[v513 count] < 2)
  {
    v398 = v389;
  }
  else
  {
    v342 = _rankingTCNearQueryHelper(v513, v507, v494, v495, v325, 1, 1, v45, a12, 0);
    v343 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 1u);
    v344 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 2u);
    _rankingJoinedTCClauses(v342, v343, v344, v325);
    v398 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] < 2)
  {
    v397 = v388;
  }
  else
  {
    v345 = _rankingTCNearQueryHelper(v513, v507, v494, v495, v325, 1, 1, v45, a12, 1);
    v346 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 1u);
    v347 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 2u);
    _rankingJoinedTCClauses(v345, v346, v347, v325);
    v397 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v322 = v509;
    uint64_t v323 = v202;
  }
  if ((unint64_t)[v513 count] >= 2)
  {
    v348 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 1, v45, a12, 1);
    v349 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 1u);
    v350 = _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 2u);
    _rankingJoinedTCClauses(v348, v349, v350, 0);
    v396 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_342:
    uint64_t v322 = v509;
    uint64_t v323 = v202;
    goto LABEL_344;
  }
  if ((unint64_t)[v507 length] >= 3)
  {
    v351 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 1, v45, a12, 1);
    _rankingJoinedTCClauses(v351, @"false", @"false", 0);
    v396 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_342;
  }
  v396 = v387;
LABEL_344:
  if ((unint64_t)[v513 count] < 2)
  {
    if ((unint64_t)[v507 length] < 3)
    {
      v395 = v387;
      goto LABEL_350;
    }
    v355 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 0, v45, a12, 1);
    _rankingJoinedTCClauses(v355, @"false", @"false", 0);
    v395 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v352 = _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 0, v45, a12, 1);
    v353 = _rankingMultiPhraseTCQueryComposite(v513, 1, 0, v45, a12, 0, 1, 1u);
    v354 = _rankingMultiPhraseTCQueryComposite(v513, 1, 0, v45, a12, 0, 1, 2u);
    _rankingJoinedTCClauses(v352, v353, v354, 0);
    v395 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v322 = v509;
  uint64_t v323 = v202;
LABEL_350:
  v378 = _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, 255, 0, v45, a12, 0);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingMostlyExactMultiFieldsTCMatch", v378);
  v377 = _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, v325, 0, v45, a12, 0);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingMostlyExactMultiFieldsTCNearMatch", v377);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCMostlyExactOrderedPhraseMatch", v395);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch", v409);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch", v408);
  v530[0] = v501;
  v530[1] = v451;
  v530[2] = v498;
  v530[3] = v502;
  v530[4] = v322;
  v530[5] = v503;
  v530[6] = v323;
  v504 = [MEMORY[0x1E4F1C978] arrayWithObjects:v530 count:7];
  v506 = _rankingMultiFieldsTCNearQueryCombo(v513, v504, v500, v325, 1u, v45, a12, 0);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingExactMultiFieldsTCNearMatch", v506);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCExactNearMatch", v398);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTermMultiPhraseTCExactNearMatch", v405);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTwoTermsMultiPhraseTCExactNearMatch", v403);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCExactOrderedMatch", v397);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTermMultiPhraseTCExactOrderedMatch", v404);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch", v406);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTCExactOrderedPhraseMatch", v396);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch", v407);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch", v402);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSPolicyFieldsPrefixMatch", v412);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSPolicyFieldsPhraseMatchBit", v410);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSPolicyFieldsMostlyExactPhraseMatchBit", v399);
  PRSRankingQueryInfoAdd(&v515, 2, @"exact_policy_flag_bit", v411);
  PRSRankingQueryInfoAdd(&v515, 2, @"PRSPolicyFieldsExactPhraseMatchBit", v400);
  PRSRankingQueryInfoAdd(&v515, 2, @"kMDItemShortcutWithinBagParamValue", v417);
  v510 = [MEMORY[0x1E4F1C978] arrayWithObjects:v521 count:v515];
  if (!a10) {
    goto LABEL_381;
  }
  v356 = objc_opt_new();
  if (!v515) {
    goto LABEL_379;
  }
  unint64_t v357 = 0;
  uint64_t v358 = 0;
  do
  {
    v359 = (uint64_t *)(&v515 + v357);
    if ([(id)v359[129] length])
    {
      v360 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v358];
      [v356 setObject:v360 forKeyedSubscript:v359[129]];
    }
    else
    {
      v360 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v358];
      v361 = objc_msgSend(NSString, "stringWithFormat:", @"unused%d", v357);
      [v356 setObject:v360 forKeyedSubscript:v361];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v362 = (id)v521[v357];
      v363 = [v362 objectForKeyedSubscript:@"kCIBitCount"];
      uint64_t v364 = [v363 integerValue];

      if (v364 <= 1) {
        uint64_t v365 = 1;
      }
      else {
        uint64_t v365 = v364;
      }
    }
    else
    {
      uint64_t v365 = 1;
    }
    int v366 = *((_DWORD *)&v515 + v357 + 2) & 0x2FE;
    uint64_t v368 = sPRSImportantBitsSuggestions;
    uint64_t v367 = *(void *)algn_1EBA219A8;
    uint64_t v370 = sPRSImportantBitsSearch;
    uint64_t v369 = *(void *)algn_1EBA21998;
    int v371 = *((_DWORD *)&v515 + v357 + 2) & 0xC00;
    do
    {
      if (v366)
      {
        uint64_t v372 = 1 << v358;
        if ((v358 & 0x40) != 0) {
          uint64_t v373 = 1 << v358;
        }
        else {
          uint64_t v373 = 0;
        }
        if ((v358 & 0x40) != 0) {
          uint64_t v372 = 0;
        }
        v368 |= v372;
        v367 |= v373;
        sPRSImportantBitsSuggestions = v368;
        *(void *)algn_1EBA219A8 = v367;
      }
      else
      {
        if (!v371) {
          goto LABEL_377;
        }
        uint64_t v372 = 1 << v358;
        if ((v358 & 0x40) != 0) {
          uint64_t v373 = 1 << v358;
        }
        else {
          uint64_t v373 = 0;
        }
        if ((v358 & 0x40) != 0) {
          uint64_t v372 = 0;
        }
      }
      v369 |= v373;
      v370 |= v372;
      sPRSImportantBitsSearch = v370;
      *(void *)algn_1EBA21998 = v369;
LABEL_377:
      ++v358;
      --v365;
    }
    while (v365);
    ++v357;
  }
  while (v515 > v357);
LABEL_379:
  if (sRankingQueryIndexDictionary_0) {
    __assert_rtn("_PRSRankingQueries", "PRSRankingItemRanker.m", 2934, "sRankingQueryIndexDictionary == nil");
  }
  objc_storeStrong((id *)&sRankingQueryIndexDictionary_0, v356);

LABEL_381:
  v374 = PRSRankingItemRankerAddJunkFilter(v510);

  for (uint64_t j = 3080; j != 5128; j += 8)
  return v374;
}

void sub_1BDC20E14(_Unwind_Exception *a1)
{
}

id _recencyInterval(void *a1, void *a2, void *a3, void *a4)
{
  int v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v59 = a4;
  id v51 = a3;
  id v45 = a2;
  id v8 = a1;
  uint64_t v60 = (void *)[[v7 alloc] initWithCapacity:4];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  [NSString stringWithFormat:@"(InRange(kMDItemInterestingDate_Ranking,$time.today(%@),$time.now(%@)))", v8, @"+1d"];
  v63 = uint64_t v62 = v9;
  [v9 addObject:v63];
  uint64_t v10 = [NSString stringWithFormat:@"(!FieldMatch(%@, %@, %@, %@))", @"_kMDItemBundleID", @"com.apple.mobilecal", @"com.apple.reminders", @"com.apple.mobilemail"];
  [v9 addObject:v10];

  uint64_t v11 = NSString;
  id v12 = [v9 componentsJoinedByString:@" && "];
  id v57 = [v11 stringWithFormat:@"(%@)", v12];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  uint64_t v61 = [NSString stringWithFormat:@"(InRange(kMDItemContentCreationDate_Ranking,$time.today(%@),$time.now(%@)))", v8, @"+1d"];
  [v13 addObject:v61];
  id v14 = [NSString stringWithFormat:@"(%@ == \"%@\", @"_kMDItemBundleID", @"com.apple.mobilemail""];
  uint64_t v58 = v13;
  [v13 addObject:v14];

  char v15 = [NSString stringWithFormat:@"(kMDItemUserSharedReceivedDate != *)"];
  [v13 addObject:v15];

  id v16 = [NSString stringWithFormat:@"(kMDItemUserSharedSentDate != *)"];
  [v13 addObject:v16];

  long long v17 = NSString;
  long long v18 = [v13 componentsJoinedByString:@" && "];
  unint64_t v53 = [v17 stringWithFormat:@"(%@)", v18];

  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v56 = [NSString stringWithFormat:@"(InRange(kMDItemUserSharedReceivedDate,$time.today(%@),$time.now(%@)))", v8, @"+1d"];
  float v54 = [NSString stringWithFormat:@"(InRange(kMDItemUserSharedSentDate,$time.today(%@),$time.now(%@)))", v8, @"+1d"];

  float v55 = v20;
  [v20 addObject:v56];
  [v20 addObject:v54];
  long long v21 = NSString;
  long long v22 = [v20 componentsJoinedByString:@" || "];
  __int16 v50 = [v21 stringWithFormat:@"(%@)", v22];

  float v49 = v19;
  [v19 addObject:v50];
  long long v23 = [NSString stringWithFormat:@"(%@ == \"%@\", @"_kMDItemBundleID", @"com.apple.mobilemail""];
  [v19 addObject:v23];

  long long v24 = NSString;
  uint64_t v25 = [v19 componentsJoinedByString:@" && "];
  unint64_t v47 = [v24 stringWithFormat:@"(%@)", v25];

  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  float v48 = [NSString stringWithFormat:@"(InRange(kMDItemInterestingDate_Ranking,$time.today(%@),$time.now(%@)))", v45, v51];

  [v26 addObject:v48];
  long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v28 = [NSString stringWithFormat:@"((%@ == \"%@\", @"_kMDItemBundleID", @"com.apple.reminders""];
  uint64_t v46 = v27;
  [v27 addObject:v28];

  long long v29 = [NSString stringWithFormat:@"(%@ == \"%@\", @"_kMDItemBundleID", @"com.apple.mobilecal""];
  [v27 addObject:v29];

  id v30 = NSString;
  id v31 = [v27 componentsJoinedByString:@" || "];
  float v52 = [v30 stringWithFormat:@"(%@)", v31];

  [v26 addObject:v52];
  long long v32 = NSString;
  id v33 = [v26 componentsJoinedByString:@" && "];
  dispatch_group_t v34 = [v32 stringWithFormat:@"(%@)", v33];

  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v36 = [NSString stringWithFormat:@"(InRange(kMDItemContentModificationDate_Ranking,$time.today(%@),$time.now(%@)))", v59, @"+1d"];

  [v35 addObject:@"(kMDItemDueDate != *)"];
  [v35 addObject:v36];
  uint64_t v37 = [NSString stringWithFormat:@"(%@ == \"%@\", @"_kMDItemBundleID", @"com.apple.reminders""];
  [v35 addObject:v37];

  uint64_t v38 = NSString;
  uint64_t v39 = [v35 componentsJoinedByString:@" && "];
  qos_class_t v40 = [v38 stringWithFormat:@"(%@)", v39];

  [v60 addObject:v57];
  [v60 addObject:v53];
  [v60 addObject:v47];
  [v60 addObject:v34];
  [v60 addObject:v40];
  dispatch_block_t v41 = NSString;
  uint64_t v42 = [v60 componentsJoinedByString:@" || "];
  dispatch_time_t v43 = [v41 stringWithFormat:@"(%@)", v42];

  return v43;
}

id _countingRankingQueryArray(void *a1, void *a2, int a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v35 = a2;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v7 = [v5 count];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = @"*";
    if (!a3) {
      uint64_t v10 = &stru_1F1824018;
    }
    qos_class_t v40 = v10;
    id v33 = v6;
    id v34 = v5;
    uint64_t v32 = v7;
    do
    {
      uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      if (v9 < [v5 count])
      {
        unint64_t v36 = v9;
        uint64_t v11 = [v5 objectAtIndex:v9];
        id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        obuint64_t j = v35;
        uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v42;
          do
          {
            uint64_t v16 = 0;
            uint64_t v38 = v14;
            do
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(obj);
              }
              long long v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
              if (addEndChar(v17, v11))
              {
                long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
                long long v19 = [NSString stringWithFormat:@"(%@=\"%@%@@\"%@)", v17, v11, &stru_1F1824018, @"cwd"];
                [v18 addObject:v19];

                long long v20 = [NSString stringWithFormat:@"(%@=\"%@%@.*\"%@)", v17, v11, v40, @"cd"];
                [v18 addObject:v20];

                long long v21 = [NSString stringWithFormat:@"(%@=\"%@%@_*\"%@)", v17, v11, v40, @"cd"];
                [v18 addObject:v21];

                long long v22 = NSString;
                uint64_t v14 = v38;
                long long v23 = [v18 componentsJoinedByString:@" || "];
                long long v24 = [v22 stringWithFormat:@"(%@)", v23];
              }
              else
              {
                long long v24 = [NSString stringWithFormat:@"(%@=\"%@%@\"%@)", v17, v11, v40, @"cwd"];
              }
              [v12 addObject:v24];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
          }
          while (v14);
        }

        if ([v12 count])
        {
          uint64_t v25 = [v12 componentsJoinedByString:@" || "];
          [v37 addObject:v25];
        }
        uint64_t v6 = v33;
        id v5 = v34;
        uint64_t v8 = v32;
        unint64_t v9 = v36;
      }
      uint64_t v26 = NSString;
      long long v27 = [v37 componentsJoinedByString:@" || "];
      long long v28 = [v26 stringWithFormat:@"(%@) && %@", v27, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];

      [v6 addObject:v28];
      ++v9;
    }
    while (v9 != v8);
  }
  v45[0] = @"kCIMatchArray";
  v45[1] = @"kCIBitCount";
  v46[0] = v6;
  long long v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:3];
  v46[1] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

  return v30;
}

__CFString *_rankingQueryPolicyComposite(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v54 = a2;
  id v70 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float v55 = v7;
  uint64_t v53 = [v7 count];
  if (v53 < 1) {
    goto LABEL_52;
  }
  uint64_t v9 = 0;
  uint64_t v68 = *MEMORY[0x1E4F22B50];
  uint64_t v67 = *MEMORY[0x1E4F22D48];
  uint64_t v66 = *MEMORY[0x1E4F22B18];
  uint64_t v64 = *MEMORY[0x1E4F233C8];
  uint64_t v62 = *MEMORY[0x1E4F22A38];
  uint64_t v60 = *MEMORY[0x1E4F23000];
  uint64_t v58 = *MEMORY[0x1E4F23008];
  uint64_t v59 = *MEMORY[0x1E4F22A40];
  uint64_t v61 = *MEMORY[0x1E4F233D0];
  uint64_t v63 = *MEMORY[0x1E4F22B20];
  uint64_t v65 = *MEMORY[0x1E4F22D50];
  uint64_t v51 = *MEMORY[0x1E4F23268];
  float v52 = v8;
  int v69 = a4;
  do
  {
    uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v57 = v9;
    uint64_t v10 = [v55 objectAtIndex:v9];
    uint64_t v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v54, "count"));
    uint64_t v72 = [v70 allKeys];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = v54;
    uint64_t v11 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (!v11) {
      goto LABEL_40;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v75;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v75 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v74 + 1) + 8 * v14);
        if ([v72 containsObject:v15])
        {
          uint64_t v16 = [v70 valueForKey:v15];
          if ([v16 count])
          {
            long long v17 = NSString;
            long long v18 = [v16 componentsJoinedByString:@","];
            long long v19 = [v17 stringWithFormat:@"(!FieldMatch(%@,%@))", v68, v18];
          }
          else
          {
            long long v19 = 0;
          }
        }
        else
        {
          long long v19 = 0;
        }
        BOOL v20 = addEndChar(v15, v10);
        if (a4)
        {
          if (v20)
          {
            long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            long long v22 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v15, v10, @"cwd"];
            [v21 addObject:v22];

            long long v23 = [NSString stringWithFormat:@"(%@=\"%@.*\"%@)", v15, v10, @"cd"];
            [v21 addObject:v23];

            long long v24 = [NSString stringWithFormat:@"(%@=\"%@_*\"%@)", v15, v10, @"cd"];
            [v21 addObject:v24];

            uint64_t v25 = NSString;
            uint64_t v26 = [v21 componentsJoinedByString:@" || "];
            long long v27 = [v25 stringWithFormat:@"(%@)", v26];

            a4 = v69;
            if (v19) {
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v15, v10, @"cwd"];
          long long v27 = LABEL_23:;
          if (!v19) {
            goto LABEL_25;
          }
LABEL_24:
          uint64_t v31 = [NSString stringWithFormat:@"(%@ && %@)", v27, v19];

          long long v27 = (void *)v31;
          goto LABEL_25;
        }
        if (!v20)
        {
          [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v15, v10, @"cwd"];
          goto LABEL_23;
        }
        long long v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
        if ([v15 isEqualToString:v67])
        {
          long long v29 = NSString;
          __int16 v50 = v10;
          uint64_t v30 = v65;
LABEL_35:
          [v29 stringWithFormat:@"(%@=\"%@*\"%@)", v30, v50, @"cwd"];
          goto LABEL_36;
        }
        if ([v15 isEqualToString:v66])
        {
          long long v29 = NSString;
          __int16 v50 = v10;
          uint64_t v30 = v63;
          goto LABEL_35;
        }
        if ([v15 isEqualToString:v64])
        {
          long long v29 = NSString;
          __int16 v50 = v10;
          uint64_t v30 = v61;
          goto LABEL_35;
        }
        if ([v15 isEqualToString:v62])
        {
          long long v29 = NSString;
          __int16 v50 = v10;
          uint64_t v30 = v59;
          goto LABEL_35;
        }
        int v32 = [v15 isEqualToString:v60];
        long long v29 = NSString;
        if (v32)
        {
          __int16 v50 = v10;
          uint64_t v30 = v58;
          goto LABEL_35;
        }
        [NSString stringWithFormat:@"(%@=\"%@*@\"%@)", v15, v10, @"cwd"];
        id v33 = LABEL_36:;
        [v28 addObject:v33];

        id v34 = [NSString stringWithFormat:@"(%@=\"%@*.*\"%@)", v15, v10, @"cd"];
        [v28 addObject:v34];

        id v35 = [NSString stringWithFormat:@"(%@=\"%@*_*\"%@)", v15, v10, @"cd"];
        [v28 addObject:v35];

        unint64_t v36 = NSString;
        uint64_t v37 = [v28 componentsJoinedByString:@" || "];
        long long v27 = [v36 stringWithFormat:@"(%@)", v37];

        a4 = v69;
        if (v19) {
          goto LABEL_24;
        }
LABEL_25:
        [v73 addObject:v27];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v38 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
      uint64_t v12 = v38;
    }
    while (v38);
LABEL_40:

    uint64_t v39 = @"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))";
    if ((a4 & 1) == 0)
    {
      unint64_t v40 = [v10 length:@"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))"];
      BOOL v41 = v40 == 2 && v57 == v53 - 1;
      long long v42 = @"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))";
      if (v41) {
        long long v42 = @"((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))";
      }
      if (v40 <= 2) {
        uint64_t v39 = v42;
      }
      else {
        uint64_t v39 = @"((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))";
      }
    }
    long long v43 = objc_msgSend(NSString, "stringWithFormat:", v39, v68, @"com.apple.mobileslideshow", v51, @"_kMDItemOCRContentLevel1", v10, @"cwd");
    [v73 addObject:v43];

    if ([v73 count])
    {
      long long v44 = [v73 componentsJoinedByString:@" || "];
      [v56 addObject:v44];
    }
    id v45 = NSString;
    uint64_t v46 = [v56 componentsJoinedByString:@" || "];
    unint64_t v47 = [v45 stringWithFormat:@"(%@) && %@", v46, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
    id v8 = v52;
    [v52 addObject:v47];

    uint64_t v9 = v57 + 1;
  }
  while (v57 + 1 != v53);
LABEL_52:
  if ([v8 count])
  {
    uint64_t v48 = [v8 componentsJoinedByString:@" && "];
  }
  else
  {
    uint64_t v48 = @"false";
  }

  return v48;
}

__CFString *_rankingPhraseQueryPolicyComposite(void *a1, void *a2, void *a3, void *a4, unsigned __int8 a5, int a6, unsigned __int8 a7, uint64_t a8)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v14 = a1;
  id v15 = a2;
  id v16 = a3;
  id v92 = a4;
  if (![v15 length])
  {
    long long v19 = @"false";
    goto LABEL_107;
  }
  uint64_t v17 = [v14 count];
  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  id v90 = v15;
  uint64_t v95 = v18;
  id v80 = v16;
  uint64_t v81 = v17;
  uint64_t v78 = v14;
  unsigned __int8 v77 = a7;
  int v79 = a6;
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    if (a5)
    {
      BOOL v20 = 0;
      if ((a6 | a7) & a5)
      {
        char v96 = 1;
        uint64_t v82 = 0;
        uint64_t v83 = 0;
        uint64_t v88 = 0;
        uint64_t v84 = 0;
        uint64_t v85 = 0;
LABEL_46:
        id v16 = v80;
        goto LABEL_47;
      }
      uint64_t v85 = 0;
      long long v21 = 0;
    }
    else
    {
      char v97 = (a6 | a7) & a5;
      long long v21 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v15, "length") + v17);
      if (v17 >= 1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          long long v23 = [v14 objectAtIndex:i];
          if (i) {
            [v21 appendString:@" "];
          }
          [v21 appendString:v23];
          [v21 appendString:@"*"];
        }
      }
      BOOL v20 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v15, "length") + v17);
      if (v17 >= 1)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          uint64_t v25 = [v14 objectAtIndex:j];
          if (j) {
            [v20 appendString:@"_"];
          }
          [v20 appendString:v25];
          if (v17 - 1 != j) {
            [v20 appendString:@"*"];
          }
        }
      }
      uint64_t v85 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v15, "length") + v17);
      uint64_t v26 = v17 - 1;
      if (v17 >= 1)
      {
        uint64_t v27 = 0;
        do
        {
          long long v28 = [v14 objectAtIndex:v27];
          if (v27) {
            [v85 appendString:@"."];
          }
          [v85 appendString:v28];
          if (v26 != v27) {
            [v85 appendString:@"*"];
          }

          ++v27;
          uint64_t v17 = v81;
        }
        while (v81 != v27);
      }
      if (v97)
      {
        uint64_t v82 = 0;
        uint64_t v83 = v20;
        uint64_t v88 = v21;
        uint64_t v84 = 0;
        char v96 = 1;
        goto LABEL_45;
      }
      a7 = v77;
    }
    uint64_t v88 = v21;
    uint64_t v83 = v20;
    if (v79 && (a7 & 1) != 0)
    {
      uint64_t v82 = 0;
      char v96 = 0;
      uint64_t v84 = 0;
      goto LABEL_46;
    }
    long long v29 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v15, "length") + v17);
    if (v17 >= 1)
    {
      uint64_t v30 = 0;
      do
      {
        uint64_t v31 = [v14 objectAtIndex:v30];
        if (v30) {
          [v29 appendString:@"_"];
        }
        [v29 appendString:v31];

        ++v30;
      }
      while (v81 != v30);
    }
    uint64_t v84 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v15, "length") + v81);
    uint64_t v82 = v29;
    if (v81 >= 1)
    {
      for (uint64_t k = 0; k != v81; ++k)
      {
        id v33 = [v14 objectAtIndex:k];
        if (k) {
          [v84 appendString:@"."];
        }
        [v84 appendString:v33];
      }
    }
    char v96 = 0;
LABEL_45:
    long long v18 = v95;
    goto LABEL_46;
  }
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v88 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  char v96 = 1;
LABEL_47:
  id v34 = [v92 allKeys];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  obuint64_t j = v16;
  uint64_t v35 = [obj countByEnumeratingWithState:&v98 objects:v102 count:16];
  uint64_t v87 = v34;
  if (!v35) {
    goto LABEL_78;
  }
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)v99;
  uint64_t v89 = *MEMORY[0x1E4F22B50];
  uint64_t v86 = *(void *)v99;
  do
  {
    uint64_t v38 = 0;
    uint64_t v93 = v36;
    do
    {
      if (*(void *)v99 != v37) {
        objc_enumerationMutation(obj);
      }
      uint64_t v39 = *(void **)(*((void *)&v98 + 1) + 8 * v38);
      if ([v34 containsObject:v39])
      {
        unint64_t v40 = [v92 valueForKey:v39];
        if ([v40 count])
        {
          BOOL v41 = NSString;
          long long v42 = [v40 componentsJoinedByString:@","];
          long long v43 = [v41 stringWithFormat:@"(!FieldMatch(%@,%@))", v89, v42];

          long long v18 = v95;
        }
        else
        {
          long long v43 = 0;
        }
      }
      else
      {
        long long v43 = 0;
      }
      if ((v96 & 1) == 0)
      {
        if (a5)
        {
          BOOL v47 = addEndChar(v39, v15);
          if (v79 & v77)
          {
            if (!v47)
            {
LABEL_64:
              [NSString stringWithFormat:@"(%@=\"%@\"%@)", v39, v15, @"cwd"];
              goto LABEL_72;
            }
LABEL_68:
            long long v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            uint64_t v51 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v82, @"cwd"];
            [v44 addObject:v51];

            uint64_t v37 = v86;
            float v52 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v84, @"cwd"];
            [v44 addObject:v52];

            id v34 = v87;
            uint64_t v53 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v82, @"cd"];
            [v44 addObject:v53];

            uint64_t v36 = v93;
            [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v84, @"cd"];
            goto LABEL_69;
          }
          if (v47) {
            goto LABEL_68;
          }
          [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v15, @"cwd"];
        }
        else
        {
          if (addEndChar(v39, v88))
          {
            long long v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            uint64_t v48 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v83, @"cwd"];
            [v44 addObject:v48];

            uint64_t v37 = v86;
            float v49 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v85, @"cwd"];
            [v44 addObject:v49];

            __int16 v50 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v83, @"cd"];
            [v44 addObject:v50];

            uint64_t v36 = v93;
            id v34 = v87;
            [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v85, @"cd"];
            goto LABEL_69;
          }
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v39, v88, @"cwd"];
        }
        uint64_t v58 = LABEL_72:;
        if (!v43) {
          goto LABEL_74;
        }
LABEL_73:
        uint64_t v59 = [NSString stringWithFormat:@"(%@ && %@)", v58, v43];

        uint64_t v58 = (void *)v59;
        goto LABEL_74;
      }
      if (!addEndChar(v39, v15)) {
        goto LABEL_64;
      }
      long long v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
      id v45 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v15, @"cwd"];
      [v44 addObject:v45];

      uint64_t v46 = [NSString stringWithFormat:@"(%@=\"%@.*\"%@)", v39, v15, @"cd"];
      [v44 addObject:v46];

      uint64_t v36 = v93;
      [NSString stringWithFormat:@"(%@=\"%@_*\"%@)", v39, v15, @"cd"];
      id v54 = LABEL_69:;
      [v44 addObject:v54];

      float v55 = NSString;
      uint64_t v56 = [v44 componentsJoinedByString:@" || "];
      uint64_t v57 = v55;
      long long v18 = v95;
      uint64_t v58 = [v57 stringWithFormat:@"(%@)", v56];

      id v15 = v90;
      if (v43) {
        goto LABEL_73;
      }
LABEL_74:
      [v18 addObject:v58];

      ++v38;
    }
    while (v36 != v38);
    uint64_t v60 = [obj countByEnumeratingWithState:&v98 objects:v102 count:16];
    uint64_t v36 = v60;
  }
  while (v60);
LABEL_78:

  if (v96)
  {
    uint64_t v61 = [NSString stringWithFormat:@"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))", *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268], @"_kMDItemOCRContentLevel1", v15, @"cwd"];
    [v18 addObject:v61];
    id v14 = v78;
    id v16 = v80;
    uint64_t v62 = v88;
    uint64_t v63 = v83;
    uint64_t v64 = v84;
    goto LABEL_106;
  }
  id v14 = v78;
  id v16 = v80;
  uint64_t v62 = v88;
  uint64_t v63 = v83;
  uint64_t v64 = v84;
  if (a5)
  {
    if (v79 && (v77 & 1) != 0)
    {
      uint64_t v65 = NSString;
      uint64_t v66 = *MEMORY[0x1E4F22B50];
      goto LABEL_105;
    }
    uint64_t v61 = [v78 lastObject];
    unint64_t v71 = [v61 length];
    if (v61 && (v71 > 2 || v81 >= 2 && v71 == 2)) {
      uint64_t v72 = @"((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))";
    }
    else {
      uint64_t v72 = @"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))";
    }
    uint64_t v73 = objc_msgSend(NSString, "stringWithFormat:", v72, *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268], @"_kMDItemOCRContentLevel1", v15, @"cwd");
    [v18 addObject:v73];
  }
  else
  {

    if (v81 <= 1)
    {
      uint64_t v62 = 0;
      uint64_t v66 = *MEMORY[0x1E4F22B50];
    }
    else
    {
      uint64_t v62 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(0, "length"));
      uint64_t v61 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v62, "length"));
      for (uint64_t m = 0; m != v81; ++m)
      {
        uint64_t v68 = [v78 objectAtIndex:m];
        unint64_t v69 = [v68 length];
        if (m)
        {
          [v62 appendString:@" "];
          [v61 appendString:@" "];
        }
        [v62 appendString:v68];
        [v61 appendString:v68];
        [v62 appendString:@"*"];
        if (v69 > 2 || v81 - 1 == m && v69 == 2) {
          [v61 appendString:@"*"];
        }
      }
      uint64_t v66 = *MEMORY[0x1E4F22B50];
      if (v61)
      {
        id v70 = [NSString stringWithFormat:@"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))", v66, @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268], @"_kMDItemOCRContentLevel1", v61, @"cwd"];
        long long v18 = v95;
        [v95 addObject:v70];

        id v15 = v90;
        uint64_t v63 = v83;
        uint64_t v64 = v84;
        id v16 = v80;
        goto LABEL_106;
      }
      id v15 = v90;
      long long v18 = v95;
      uint64_t v63 = v83;
      uint64_t v64 = v84;
      id v16 = v80;
    }
    uint64_t v65 = NSString;
LABEL_105:
    uint64_t v61 = [v65 stringWithFormat:@"((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))", v66, @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268], @"_kMDItemOCRContentLevel1", v15, @"cwd"];
    [v18 addObject:v61];
  }
LABEL_106:

  long long v74 = NSString;
  long long v75 = [v18 componentsJoinedByString:@" || "];
  long long v19 = [v74 stringWithFormat:@"(%@) && %@", v75, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];

LABEL_107:
  return v19;
}

__CFString *_rankingMultiPhraseTCQueryComposite(void *a1, char a2, unsigned __int8 a3, unsigned __int8 a4, uint64_t a5, unsigned __int8 a6, char a7, unsigned int a8)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  if ([v15 count] <= (unint64_t)a8)
  {
    long long v22 = @"false";
  }
  else
  {
    uint64_t v16 = a8;
    uint64_t v17 = *MEMORY[0x1E4F22B18];
    v28[0] = *MEMORY[0x1E4F22B30];
    v28[1] = v17;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    uint64_t v27 = *MEMORY[0x1E4F22AE0];
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    char v24 = a2;
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v15];
    objc_msgSend(v18, "removeObjectsInRange:", v16, objc_msgSend(v18, "count") - v16);
    long long v19 = [v18 componentsJoinedByString:@" "];
    BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v15];
    objc_msgSend(v20, "removeObjectsInRange:", 0, v16);
    long long v21 = [v20 componentsJoinedByString:@" "];
    _rankingMultiPhraseQueryCompositeHelper(v18, v19, v26, v20, v21, v25, v20, v21, a6, a7, v24, a3, a4, a5, 1u);
    long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v22;
}

__CFString *_rankingJoinedTCClauses(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if (v7 && ([v7 isEqualToString:@"false"] & 1) == 0) {
    [v10 addObject:v7];
  }
  if (v8 && ([v8 isEqualToString:@"false"] & 1) == 0) {
    [v10 addObject:v8];
  }
  if (v9 && ([v9 isEqualToString:@"false"] & 1) == 0) {
    [v10 addObject:v9];
  }
  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
    if (a4) {
      id v14 = @"$";
    }
    else {
      id v14 = &stru_1F1824018;
    }
    id v15 = (__CFString *)[v13 initWithString:v14];
    uint64_t v16 = NSString;
    uint64_t v17 = [v10 componentsJoinedByString:@" || "];
    long long v18 = (void *)v17;
    if (v12 == 1) {
      long long v19 = @"%@";
    }
    else {
      long long v19 = @"(%@)";
    }
    BOOL v20 = objc_msgSend(v16, "stringWithFormat:", v19, v17);
    [(__CFString *)v15 appendString:v20];
  }
  else
  {
    id v15 = @"false";
  }

  return v15;
}

__CFString *_rankingMultiPhraseQueryComposite(void *a1, char a2, unsigned __int8 a3, unsigned __int8 a4, uint64_t a5, unsigned __int8 a6, char a7, unsigned int a8)
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  if ([v15 count] <= (unint64_t)a8)
  {
    long long v23 = @"false";
  }
  else
  {
    uint64_t v16 = a8;
    uint64_t v17 = *MEMORY[0x1E4F22B18];
    v29[0] = *MEMORY[0x1E4F22B30];
    v29[1] = v17;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v18 = *MEMORY[0x1E4F235C0];
    v28[0] = *MEMORY[0x1E4F22CE8];
    v28[1] = v18;
    v28[2] = *MEMORY[0x1E4F23658];
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
    char v25 = a2;
    long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v15];
    objc_msgSend(v19, "removeObjectsInRange:", v16, objc_msgSend(v19, "count") - v16);
    BOOL v20 = [v19 componentsJoinedByString:@" "];
    long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v15];
    objc_msgSend(v21, "removeObjectsInRange:", 0, v16);
    long long v22 = [v21 componentsJoinedByString:@" "];
    _rankingMultiPhraseQueryCompositeHelper(v19, v20, v27, v21, v22, v26, v21, v22, a6, a7, v25, a3, a4, a5, 0);
    long long v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v23;
}

__CFString *_rankingMultiFieldsTCNearQueryCombo(void *a1, void *a2, void *a3, uint64_t a4, unsigned int a5, int a6, uint64_t a7, char a8)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a1;
  id v76 = a2;
  id v75 = a3;
  if ((unint64_t)[v12 count] < 2)
  {
    id v13 = @"false";
    goto LABEL_79;
  }
  id v74 = v12;
  if ((unint64_t)[v12 count] >= 9)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v76];
    uint64_t v91 = *MEMORY[0x1E4F235F8];
    if ((objc_msgSend(v14, "containsObject:") & 1) == 0) {
      [v14 addObject:v91];
    }
    id v15 = v12;
    id v16 = v14;
    id v17 = v75;
    if ((unint64_t)[v15 count] >= 2)
    {
      uint64_t v37 = [v15 count];
      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v37];
      uint64_t v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      if ((a7 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        int v39 = 1;
      }
      else {
        int v39 = a6;
      }
      uint64_t v78 = v17;
      id v90 = [v17 allKeys];
      uint64_t v80 = v37;
      if (v37 < 1)
      {
        *(void *)&v87[4] = 0;
      }
      else
      {
        uint64_t v40 = 0;
        *(_DWORD *)&v87[8] = 0;
        *(void *)uint64_t v87 = v39 | a5;
        uint64_t v83 = *MEMORY[0x1E4F22B50];
        uint64_t v77 = *MEMORY[0x1E4F22D40];
        id v71 = v16;
        id v72 = v15;
        id v70 = v38;
        do
        {
          [v85 removeAllObjects];
          BOOL v41 = [v15 objectAtIndex:v40];
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          obuint64_t j = v16;
          uint64_t v42 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
          uint64_t v73 = v40;
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v94;
            uint64_t v79 = v40 + 1;
            id v45 = v85;
            do
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v94 != v44) {
                  objc_enumerationMutation(obj);
                }
                BOOL v47 = *(void **)(*((void *)&v93 + 1) + 8 * i);
                if ([v90 containsObject:v47])
                {
                  uint64_t v48 = [v78 valueForKey:v47];
                  if ([v48 count])
                  {
                    float v49 = NSString;
                    __int16 v50 = [v48 componentsJoinedByString:@","];
                    uint64_t v51 = v49;
                    id v45 = v85;
                    float v52 = [v51 stringWithFormat:@"(!FieldMatch(%@,%@))", v83, v50];
                  }
                  else
                  {
                    float v52 = 0;
                  }
                }
                else
                {
                  float v52 = 0;
                }
                if ([v47 isEqualToString:v91])
                {
                  uint64_t v53 = [NSString stringWithFormat:@"(!FieldMatch(%@,%@))", v83, @"com.apple.mobileslideshow"];
                  id v54 = [NSString stringWithFormat:@"(!%@>0)", v77];
                  uint64_t v55 = [NSString stringWithFormat:@"(%@ && %@)", v53, v54];

                  float v52 = (void *)v55;
                  id v45 = v85;
                }
                if (v87[0])
                {
                  uint64_t v56 = v41;
                }
                else
                {
                  uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v41, "length"));

                  [v56 appendString:v41];
                  if (v79 == v80
                    && (![v47 isEqualToString:v91]
                     || (unint64_t)[v41 length] >= 3))
                  {
                    [v56 appendString:@"*"];
                  }
                  *(void *)&v87[4] = v56;
                }
                uint64_t v57 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v47, v56, @"cwd"];
                if (v52)
                {
                  uint64_t v58 = [NSString stringWithFormat:@"(%@ && %@)", v57, v52];

                  uint64_t v57 = (void *)v58;
                }
                [v45 addObject:v57];
              }
              uint64_t v43 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
            }
            while (v43);
          }
          else
          {
            id v45 = v85;
          }

          if ((unint64_t)[v45 count] < 2)
          {
            uint64_t v61 = [v45 firstObject];
          }
          else
          {
            uint64_t v59 = NSString;
            uint64_t v60 = [v45 componentsJoinedByString:@" || "];
            uint64_t v61 = [v59 stringWithFormat:@"(%@)", v60];
          }
          id v16 = v71;
          id v15 = v72;
          uint64_t v38 = v70;
          [v70 addObject:v61];

          uint64_t v40 = v73 + 1;
        }
        while (v73 + 1 != v80);
      }
      unint64_t v66 = [v38 count];
      uint64_t v67 = NSString;
      if (v66 <= 1)
      {
        uint64_t v68 = [v38 firstObject];
        [v67 stringWithFormat:@"%@", v68];
      }
      else
      {
        uint64_t v68 = [v38 componentsJoinedByString:@" && "];
        [v67 stringWithFormat:@"(%@)", v68];
      }
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v12 = v74;

      id v17 = v78;
    }
    else
    {
      id v13 = @"false";
    }

    goto LABEL_78;
  }
  unint64_t v18 = [v12 count];
  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  id v16 = v19;
  if (v18)
  {
    uint64_t v84 = v19;
    uint64_t v20 = 0;
    BOOL v92 = 0;
    unsigned __int8 v82 = a4 + 1;
    uint64_t v21 = -1;
    do
    {
      ++v20;
      long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v74];
      objc_msgSend(v22, "removeObjectsInRange:", v20, objc_msgSend(v22, "count") + v21);
      long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v74];
      objc_msgSend(v23, "removeObjectsInRange:", 0, v20);
      char v24 = [v23 componentsJoinedByString:@" "];
      char v25 = _rankingMultiFieldsTCNearQuery(v22, v76, v75, v23, v24, a4, a5, a6, a7, 1, a8);
      uint64_t v26 = v25;
      if (v25 && ([v25 isEqualToString:@"false"] & 1) == 0)
      {
        if (v82 >= 2u && !v92) {
          BOOL v92 = (unint64_t)[v23 count] > 1;
        }
        [v84 addObject:v26];
      }

      --v21;
    }
    while (v18 != v20);
    if (v18 >= 2)
    {
      uint64_t v27 = -1;
      for (uint64_t j = 1; j != v18; ++j)
      {
        long long v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v74];
        objc_msgSend(v29, "removeObjectsInRange:", j, objc_msgSend(v29, "count") + v27);
        uint64_t v30 = [v29 componentsJoinedByString:@" "];
        uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v74];
        objc_msgSend(v31, "removeObjectsInRange:", 0, j);
        int v32 = _rankingMultiFieldsTCNearQuery(v31, v76, v75, v29, v30, a4, a5, a6, a7, 0, a8);
        id v33 = v32;
        if (v32 && ([v32 isEqualToString:@"false"] & 1) == 0)
        {
          if (v82 >= 2u && !v92) {
            BOOL v92 = (unint64_t)[v29 count] > 1;
          }
          [v84 addObject:v33];
        }

        --v27;
      }
    }
    id v16 = v84;
    uint64_t v34 = [v84 count];
    if (v34)
    {
      unint64_t v35 = v34;
      if (v92) {
        uint64_t v36 = @"$";
      }
      else {
        uint64_t v36 = &stru_1F1824018;
      }
      id v12 = v74;
      goto LABEL_67;
    }
    id v13 = @"false";
    id v12 = v74;
  }
  else
  {
    uint64_t v62 = [v19 count];
    if (v62)
    {
      unint64_t v35 = v62;
      uint64_t v36 = &stru_1F1824018;
LABEL_67:
      id v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v36];
      uint64_t v63 = NSString;
      if (v35 < 2)
      {
        uint64_t v64 = [v16 firstObject];
        [v63 stringWithFormat:@"%@", v64];
      }
      else
      {
        uint64_t v64 = [v16 componentsJoinedByString:@" || "];
        [v63 stringWithFormat:@"(%@)", v64];
      uint64_t v65 = };
      [(__CFString *)v13 appendString:v65];

      goto LABEL_78;
    }
    id v13 = @"false";
  }
LABEL_78:

LABEL_79:
  return v13;
}

__CFString *_rankingTCNearQueryHelper(void *a1, void *a2, void *a3, void *a4, unsigned int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v55 = a1;
  id v14 = a2;
  id v15 = a3;
  id v59 = a4;
  uint64_t v60 = v14;
  uint64_t v53 = v15;
  if (![v14 length])
  {
    id v16 = @"false";
    id v17 = @"cwd";
    goto LABEL_77;
  }
  uint64_t v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count") + 2);
  if (a10)
  {
    uint64_t v61 = @"cwd";
  }
  else
  {
    objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c", 116);
    uint64_t v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    uint64_t v18 = 110;
    if (a10) {
      uint64_t v18 = 111;
    }
    objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c(%d)", v18, a5);
    float v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v52 = @"cwd";
  }
  uint64_t v54 = [v55 count];
  if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    int v19 = 1;
  }
  else {
    int v19 = (a7 | a8) & a6;
  }
  uint64_t v62 = [v59 allKeys];
  if ((v19 | a6))
  {
    uint64_t v57 = 0;
  }
  else
  {
    uint64_t v57 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v14, "length") + v54);
    if (v54 >= 1)
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        uint64_t v21 = [v55 objectAtIndex:i];
        if (i) {
          [v57 appendString:@" "];
        }
        [v57 appendString:v21];
        [v57 appendString:@"*"];
      }
    }
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v22 = v15;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v68;
    uint64_t v56 = *MEMORY[0x1E4F22B50];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        if ([v62 containsObject:v26])
        {
          uint64_t v27 = [v59 valueForKey:v26];
          long long v28 = v27;
          if (v27 && [v27 length])
          {
            long long v29 = [NSString stringWithFormat:@"(%@==%@)", v56, v28];
          }
          else
          {
            long long v29 = 0;
          }
        }
        else
        {
          long long v29 = 0;
        }
        if (v19)
        {
          uint64_t v30 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v26, v60, v61];
        }
        else if (a6)
        {
          if (a7 & a8) {
            [NSString stringWithFormat:@"(%@=\"%@\"%@)", v26, v60, v61];
          }
          else {
          uint64_t v30 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v26, v60, v61];
          }
        }
        else
        {
          uint64_t v30 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v26, v57, v61];
        }
        uint64_t v31 = (void *)v30;
        if (v29)
        {
          uint64_t v32 = [NSString stringWithFormat:@"(%@ && %@)", v30, v29];

          uint64_t v31 = (void *)v32;
        }
        [v63 addObject:v31];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v23);
  }

  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = ___rankingTCNearQueryHelper_block_invoke;
  v64[3] = &unk_1E635AFB8;
  v64[4] = v65;
  id v33 = (void (**)(void, void, void, void))MEMORY[0x1C1885400](v64);
  if (v19) {
    goto LABEL_46;
  }
  if ((a6 & 1) == 0)
  {

    if (v54 < 2) {
      goto LABEL_62;
    }
    uint64_t v57 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(0, "length"));
    uint64_t v36 = 0;
    do
    {
      uint64_t v37 = [v55 objectAtIndex:v36];
      if (v36) {
        [v57 appendString:@" "];
      }
      [v57 appendString:v37];
      if ((unint64_t)[v37 length] > 2
        || (uint64_t v38 = v36 + 1, v36 + 1 == v54) && (unint64_t)[v37 length] >= 2)
      {
        [v57 appendString:@"*"];
        uint64_t v38 = v36 + 1;
      }

      uint64_t v36 = v38;
    }
    while (v38 != v54);
    if (v57)
    {
      int v39 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v57, v52];
      ((void (**)(void, void *, void *, void))v33)[2](v33, v63, v39, 0);
      unint64_t v35 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v57, v52];

      ((void (**)(void, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
    }
    else
    {
LABEL_62:
      uint64_t v40 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v60, v52];
      ((void (**)(void, void *, void *, void))v33)[2](v33, v63, v40, 0);
      unint64_t v35 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v60, v52];

      ((void (**)(void, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
      uint64_t v57 = 0;
    }
    goto LABEL_76;
  }
  if (a7 && (a8 & 1) != 0)
  {
LABEL_46:
    uint64_t v34 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v60, v52];
    ((void (**)(void, void *, void *, void))v33)[2](v33, v63, v34, 0);
    unint64_t v35 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v60, v52];

    ((void (**)(void, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
  }
  else
  {
    BOOL v41 = [v55 lastObject];
    unint64_t v42 = [v41 length];
    unint64_t v43 = v42;
    if (v41 && (v42 > 2 || v54 >= 2 && v42 == 2)) {
      uint64_t v44 = @"(%@=\"%@*\"%@)";
    }
    else {
      uint64_t v44 = @"(%@=\"%@\"%@)";
    }
    id v45 = objc_msgSend(NSString, "stringWithFormat:", v44, *MEMORY[0x1E4F235F8], v60, v52);
    ((void (**)(void, void *, void *, void))v33)[2](v33, v63, v45, 0);
    if (v41 && (v43 > 2 || v54 >= 2 && v43 == 2)) {
      uint64_t v46 = @"(%@=\"%@*\"%@)";
    }
    else {
      uint64_t v46 = @"(%@=\"%@\"%@)";
    }
    unint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", v46, @"_kMDItemOCRContentLevel1", v60, v52);

    ((void (**)(void, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
  }
LABEL_76:

  BOOL v47 = NSString;
  uint64_t v48 = [v63 componentsJoinedByString:@" || "];
  id v16 = [v47 stringWithFormat:@"(%@)", v48];

  _Block_object_dispose(v65, 8);
  id v17 = v52;
LABEL_77:

  return v16;
}

void sub_1BDC24A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id PRSRankingQueryIndexDictionary()
{
  if (PRSRankingQueryIndexDictionary_onceToken != -1) {
    dispatch_once(&PRSRankingQueryIndexDictionary_onceToken, &__block_literal_global_744);
  }
  uint64_t v0 = (void *)sRankingQueryIndexDictionary_0;
  return v0;
}

id __PRSRankingQueryIndexDictionary_block_invoke()
{
  return _PRSRankingQueries(0, @"init", @"*=*", @"init", (uint64_t)&unk_1F1864868, 0, 0, 0, 0, 1, @"init", 0, 0, 0, 0);
}

id PRSRankingQueriesWithUserQuery(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, unsigned __int8 a12, void *a13, void *a14)
{
  id v36 = a14;
  id v34 = a13;
  id v18 = a10;
  id v31 = a9;
  id v32 = a8;
  id v39 = a7;
  id v19 = a6;
  id v20 = a5;
  id v30 = a4;
  id v21 = a3;
  id v22 = a2;
  id v38 = a1;
  id v23 = PRSRankingQueryIndexDictionary();
  uint64_t v24 = (uint64_t)v20;
  char v25 = v20;
  uint64_t v26 = v19;
  uint64_t v27 = _PRSRankingQueries((uint64_t)v38, (uint64_t)v22, (uint64_t)v21, (uint64_t)v30, v24, (uint64_t)v19, (uint64_t)v39, (uint64_t)v32, v31, 0, v18, a11, a12, v34, v36);

  return v27;
}

uint64_t bundleFeatureHasAssociatedResultSetFeature(unint64_t a1)
{
  return (a1 < 0x2C) & (0x9F000FFFFFFuLL >> a1);
}

uint64_t comp(void *a1, void *a2)
{
  if (*a1 > *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 != *a2;
  }
}

uint64_t shouldUpdateFuncForSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C) {
    shouldUpdateFuncForSnippetFeature_cold_1();
  }
  return (uint64_t)*(&off_1E635AFD8 + a1);
}

uint64_t associatedResultSetL2FeatureFromSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C) {
    associatedResultSetL2FeatureFromSnippetFeature_cold_1();
  }
  return word_1BDC5F36C[a1];
}

uint64_t associatedL2FeatureFromSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C) {
    associatedL2FeatureFromSnippetFeature_cold_1();
  }
  return word_1BDC5F3C4[a1];
}

float defaultValueForResultSetSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C) {
    defaultValueForResultSetSnippetFeature_cold_1();
  }
  return flt_1BDC5F41C[a1];
}

float resultset_computation_ctx_init(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0xACuLL, 0xBA4C8731uLL);
  *(void *)a1 = v2;
  memset_pattern16(v2, &unk_1BDC5D330, 0xACuLL);
  unint64_t v3 = 0;
  *(_WORD *)(a1 + _Block_object_dispose(&STACK[0x468], 8) = 0;
  *(unsigned char *)(a1 + 10) = 0;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  do
  {
    if (v3 >= 0x2C) {
      defaultValueForResultSetSnippetFeature_cold_1();
    }
    float result = flt_1BDC5F41C[v3];
    *(float *)(a1 + 24 + 4 * v3++) = result;
  }
  while (v3 != 44);
  return result;
}

void resultset_computation_ctx_destroy(void **a1)
{
  id v1 = *a1;
  if (v1) {
    free(v1);
  }
}

uint64_t PRSRankingSDEnabledFlagState()
{
  if (PRSRankingSDEnabledFlagState_onceToken != -1) {
    dispatch_once(&PRSRankingSDEnabledFlagState_onceToken, &__block_literal_global_994);
  }
  return PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags;
}

uint64_t hasPolicyPhraseMatch(void *a1, unint64_t a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = 0;
  if (a3) {
    id v7 = (char *)&sPhrasePolicyWordFeatureList;
  }
  else {
    id v7 = (char *)&sPhrasePolicyFeatureList;
  }
  float v8 = 2147500000.0;
  do
  {
    id v9 = [v5 L2FeatureVector];
    [v9 scoreForFeature:*(unsigned __int16 *)&v7[v6]];
    float v11 = v10;

    if (v11 < v8 && v11 > 0.0) {
      float v8 = v11;
    }
    v6 += 2;
  }
  while (v6 != 8);
  if (([v5 bundleIDType] & 8) != 0)
  {
    id v13 = [v5 L2FeatureVector];
    id v14 = v13;
    BOOL v15 = a3 == 0;
    unsigned int v16 = 278;
    goto LABEL_21;
  }
  if (([v5 bundleIDType] & 2) != 0) {
    goto LABEL_20;
  }
  if (([v5 bundleIDType] & 0x200) != 0)
  {
    uint64_t v25 = 0;
    if (a3) {
      uint64_t v26 = (char *)&sMusicPhrasePolicyWordFeatureList;
    }
    else {
      uint64_t v26 = (char *)&sMusicPhrasePolicyFeatureList;
    }
    do
    {
      uint64_t v27 = [v5 L2FeatureVector];
      [v27 scoreForFeature:*(unsigned __int16 *)&v26[v25]];
      float v29 = v28;

      if (v29 < v8 && v29 > 0.0) {
        float v8 = v29;
      }
      v25 += 2;
    }
    while (v25 != 6);
    goto LABEL_29;
  }
  if (([v5 bundleIDType] & 0x10) != 0)
  {
LABEL_20:
    id v13 = [v5 L2FeatureVector];
    id v14 = v13;
    BOOL v15 = a3 == 0;
    unsigned int v16 = 284;
    goto LABEL_21;
  }
  if (([v5 bundleIDType] & 0x40000) == 0 && (objc_msgSend(v5, "bundleIDType") & 0x2000000) == 0)
  {
    if (([v5 bundleIDType] & 0x20) == 0) {
      goto LABEL_29;
    }
    id v13 = [v5 L2FeatureVector];
    id v14 = v13;
    BOOL v15 = a3 == 0;
    unsigned int v16 = 266;
    goto LABEL_21;
  }
  uint64_t v51 = 0;
  if (a3) {
    float v52 = (char *)&sPhotosAppPhrasePolicyWordFeatureList;
  }
  else {
    float v52 = (char *)&sPhotosAppPhrasePolicyFeatureList;
  }
  do
  {
    uint64_t v53 = [v5 L2FeatureVector];
    [v53 scoreForFeature:*(unsigned __int16 *)&v52[v51]];
    float v55 = v54;

    if (v55 < v8 && v55 > 0.0) {
      float v8 = v55;
    }
    v51 += 2;
  }
  while (v51 != 30);
  uint64_t v57 = [v5 exactMatchedKeyword];
  unint64_t v58 = [v57 length];

  if (v58 > 2)
  {
    id v13 = [v5 L2FeatureVector];
    id v14 = v13;
    BOOL v15 = a3 == 0;
    unsigned int v16 = 296;
LABEL_21:
    if (v15) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v16 + 1;
    }
    [v13 scoreForFeature:v17];
    float v19 = v18;

    if (v19 < v8 && v19 > 0.0) {
      float v8 = v19;
    }
  }
LABEL_29:
  float v21 = ((double)a2 + 1.0) / (double)a2;
  if (v8 == v21 || v8 < 2147500000.0 && v8 < v21 && v8 > 0.0) {
    goto LABEL_33;
  }
  if (([v5 bundleIDType] & 0x100000) != 0)
  {
    if (a2 < 2)
    {
LABEL_102:
      if (([v5 bundleIDType] & 0x40000) != 0)
      {
        if (a2 < 2)
        {
LABEL_108:
          uint64_t v22 = 0;
          goto LABEL_34;
        }
      }
      else
      {
        int v111 = [v5 bundleIDType];
        if (a2 < 2 || (v111 & 0x2000000) == 0) {
          goto LABEL_108;
        }
      }
      uint64_t v112 = [v5 L2FeatureVector];
      [v112 scoreForFeature:2366];
      float v114 = v113;

      if (v114 == 0.0) {
        goto LABEL_108;
      }
LABEL_33:
      uint64_t v22 = 1;
      goto LABEL_34;
    }
  }
  else
  {
    char v24 = [v5 bundleIDType];
    if (a2 < 2 || (v24 & 8) == 0) {
      goto LABEL_102;
    }
  }
  id v31 = [v5 L2FeatureVector];
  id v32 = v31;
  if (a3) {
    uint64_t v33 = 279;
  }
  else {
    uint64_t v33 = 278;
  }
  [v31 scoreForFeature:v33];
  float v35 = v34;

  if (v35 > 0.0 && v35 < 2147500000.0) {
    goto LABEL_33;
  }
  id v36 = [v5 L2FeatureVector];
  [v36 scoreForFeature:2364];
  float v38 = v37;

  id v39 = [v5 L2FeatureVector];
  [v39 scoreForFeature:2365];
  float v41 = v40;

  unint64_t v42 = [v5 L2FeatureVector];
  [v42 scoreForFeature:2366];
  float v44 = v43;

  id v45 = [v5 L2FeatureVector];
  [v45 scoreForFeature:2];
  float v47 = v46;

  BOOL v48 = v38 != 0.0;
  if (v41 != 0.0) {
    BOOL v48 = 1;
  }
  if (v44 != 0.0) {
    BOOL v48 = 1;
  }
  int v49 = v47 != 0.0 || v48;
  if (a3)
  {
    if (!v49) {
      goto LABEL_87;
    }
    if (-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2) >= a2) {
      goto LABEL_33;
    }
    unint64_t v50 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
  }
  else
  {
    id v59 = [v5 L2FeatureVector];
    [v59 scoreForFeature:2356];
    float v61 = v60;

    uint64_t v62 = [v5 L2FeatureVector];
    [v62 scoreForFeature:2357];
    float v64 = v63;

    uint64_t v65 = [v5 L2FeatureVector];
    [v65 scoreForFeature:2358];
    float v67 = v66;

    long long v68 = [v5 L2FeatureVector];
    [v68 scoreForFeature:2362];
    float v70 = v69;

    BOOL v71 = v61 != 0.0;
    if (v64 != 0.0) {
      BOOL v71 = 1;
    }
    if (v67 != 0.0) {
      BOOL v71 = 1;
    }
    if (v70 != 0.0) {
      BOOL v71 = 1;
    }
    if (((v71 | v49) & 1) == 0) {
      goto LABEL_87;
    }
    if (-[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x100008008, a2) >= a2) {
      goto LABEL_33;
    }
    unint64_t v50 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 49160, a2);
  }
  if (v50 >= a2) {
    goto LABEL_33;
  }
LABEL_87:
  uint64_t v72 = [v5 L2FeatureVector];
  [v72 scoreForFeature:2372];
  float v74 = v73;

  id v75 = [v5 L2FeatureVector];
  [v75 scoreForFeature:2373];
  float v77 = v76;

  uint64_t v78 = [v5 L2FeatureVector];
  [v78 scoreForFeature:2374];
  float v80 = v79;

  uint64_t v81 = [v5 L2FeatureVector];
  [v81 scoreForFeature:2375];
  float v83 = v82;

  uint64_t v84 = [v5 L2FeatureVector];
  [v84 scoreForFeature:2376];
  float v86 = v85;

  uint64_t v87 = [v5 L2FeatureVector];
  [v87 scoreForFeature:2377];
  float v89 = v88;

  uint64_t v22 = 1;
  if (v74 == 0.0 && v77 == 0.0 && v80 == 0.0 && v83 == 0.0 && v86 == 0.0 && v89 == 0.0)
  {
    if (a3) {
      goto LABEL_99;
    }
    id v90 = [v5 L2FeatureVector];
    [v90 scoreForFeature:2367];
    float v92 = v91;

    long long v93 = [v5 L2FeatureVector];
    [v93 scoreForFeature:2368];
    float v95 = v94;

    long long v96 = [v5 L2FeatureVector];
    [v96 scoreForFeature:2369];
    float v98 = v97;

    long long v99 = [v5 L2FeatureVector];
    [v99 scoreForFeature:2370];
    float v101 = v100;

    uint64_t v102 = [v5 L2FeatureVector];
    [v102 scoreForFeature:2371];
    float v104 = v103;

    uint64_t v22 = 1;
    if (v92 == 0.0 && v95 == 0.0 && v98 == 0.0 && v101 == 0.0 && v104 == 0.0)
    {
LABEL_99:
      uint64_t v105 = [v5 L2FeatureVector];
      [v105 scoreForFeature:1929];
      float v107 = v106;

      if (v107 != 0.0) {
        goto LABEL_33;
      }
      uint64_t v108 = [v5 L2FeatureVector];
      [v108 scoreForFeature:2363];
      float v110 = v109;

      if (v110 != 0.0) {
        goto LABEL_33;
      }
      if ((a3 & 1) == 0)
      {
        uint64_t v115 = [v5 L2FeatureVector];
        [v115 scoreForFeature:1928];
        float v117 = v116;

        if (v117 != 0.0) {
          goto LABEL_33;
        }
        uint64_t v118 = [v5 L2FeatureVector];
        [v118 scoreForFeature:2361];
        float v120 = v119;

        if (v120 != 0.0) {
          goto LABEL_33;
        }
      }
      goto LABEL_102;
    }
  }
LABEL_34:

  return v22;
}

void __PRSRankingSDEnabledFlagState_block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
  if ([v0 BOOLForKey:@"SDEnabledSendRankingFeatures"]) {
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 2u;
  }
  if ([v0 BOOLForKey:@"SDEnabledArchiveParsecResults"]) {
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 4u;
  }
  if ([v0 BOOLForKey:@"SDEnabledUnarchiveParsecResults "]) {
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 8u;
  }
}

uint64_t get_thread_count()
{
  if (get_thread_count_onceToken != -1) {
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_1005);
  }
  return get_thread_count_batch_size;
}

uint64_t __get_thread_count_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v2 = 0x1900000006;
  size_t v1 = 4;
  return sysctl(v2, 2u, &get_thread_count_batch_size, &v1, 0, 0);
}

BOOL hasPolicyNearMatch(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  BOOL v8 = 0;
  if (a2 >= 2)
  {
    id v5 = [v3 L2FeatureVector];
    [v5 scoreForFeature:2356];
    float v7 = v6;

    if (v7 != 0.0) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

BOOL hasPolicySecondaryMatch(void *a1, unint64_t a2, unint64_t a3, void *a4, char a5, void *a6)
{
  id v11 = a1;
  id v12 = a4;
  id v13 = a6;
  if (([v11 bundleIDType] & 0x100000) != 0
    || ([v11 bundleIDType] & 8) != 0
    || ([v11 bundleIDType] & 2) != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __hasPolicySecondaryMatch_block_invoke;
    block[3] = &unk_1E634C270;
    id v15 = v13;
    id v75 = v15;
    if (hasPolicySecondaryMatch_onceToken != -1) {
      dispatch_once(&hasPolicySecondaryMatch_onceToken, block);
    }
    unsigned int v16 = [v11 L2FeatureVector];
    [v16 scoreForFeature:2];
    float v18 = v17;

    if (v18 != 0.0) {
      goto LABEL_8;
    }
    id v20 = [v11 L2FeatureVector];
    [v20 scoreForFeature:2364];
    float v22 = v21;

    id v23 = [v11 L2FeatureVector];
    [v23 scoreForFeature:2365];
    float v25 = v24;

    uint64_t v26 = [v11 L2FeatureVector];
    [v26 scoreForFeature:2366];
    float v28 = v27;

    BOOL v14 = 1;
    if (v22 != 0.0) {
      goto LABEL_9;
    }
    if (v25 != 0.0) {
      goto LABEL_9;
    }
    if (v28 != 0.0) {
      goto LABEL_9;
    }
    if ((a5 & 1) == 0)
    {
      float v29 = [v11 L2FeatureVector];
      [v29 scoreForFeature:2356];
      float v31 = v30;

      id v32 = [v11 L2FeatureVector];
      [v32 scoreForFeature:2357];
      float v34 = v33;

      float v35 = [v11 L2FeatureVector];
      [v35 scoreForFeature:2358];
      float v37 = v36;

      float v38 = [v11 L2FeatureVector];
      [v38 scoreForFeature:2362];
      float v40 = v39;

      BOOL v14 = 1;
      if (v31 != 0.0 || v34 != 0.0 || v37 != 0.0 || v40 != 0.0) {
        goto LABEL_9;
      }
    }
    unint64_t v41 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v11, 0x10005C02CLL, a2);
    if (([v11 bundleIDType] & 2) != 0) {
      unint64_t v41 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v11, 0x1000004002, a2);
    }
    if (v41 >= a2) {
      goto LABEL_8;
    }
    char v42 = hasPolicySecondaryMatch_bit1;
    unint64_t v43 = -[PRSRankingItem indexScore]((uint64_t)v11);
    uint64_t v45 = ((2 * v44) << ~v42) | (v43 >> v42);
    if ((v42 & 0x40) != 0) {
      uint64_t v45 = v44 >> v42;
    }
    if (v45)
    {
      float v46 = [v11 L2FeatureVector];
      [v46 scoreForFeature:210];
      float v48 = v47;

      if (v48 > 0.0 && v48 < 2147500000.0) {
        goto LABEL_8;
      }
      if (([v11 bundleIDType] & 2) != 0)
      {
        BOOL v71 = [v11 L2FeatureVector];
        [v71 scoreForFeature:198];
        float v73 = v72;

        if (v73 > 0.0 && v73 < 2147500000.0) {
          goto LABEL_8;
        }
      }
      int v49 = [v11 L2FeatureVector];
      [v49 scoreForFeature:1036];
      float v51 = v50;

      if (v51 > 0.0 && v51 < 2147500000.0) {
        goto LABEL_8;
      }
    }
    BOOL v14 = 1;
    uint64_t v52 = 1 << hasPolicySecondaryMatch_bit2;
    if ((hasPolicySecondaryMatch_bit2 & 0x40) != 0) {
      uint64_t v53 = 1 << hasPolicySecondaryMatch_bit2;
    }
    else {
      uint64_t v53 = 0;
    }
    if ((hasPolicySecondaryMatch_bit2 & 0x40) != 0) {
      uint64_t v52 = 0;
    }
    uint64_t v54 = 1 << hasPolicySecondaryMatch_bit3;
    if ((hasPolicySecondaryMatch_bit3 & 0x40) != 0) {
      uint64_t v55 = 1 << hasPolicySecondaryMatch_bit3;
    }
    else {
      uint64_t v55 = 0;
    }
    if ((hasPolicySecondaryMatch_bit3 & 0x40) != 0) {
      uint64_t v54 = 0;
    }
    uint64_t v56 = v54 | v52;
    uint64_t v57 = v55 | v53;
    uint64_t v58 = 1 << hasPolicySecondaryMatch_bit5;
    if ((hasPolicySecondaryMatch_bit5 & 0x40) != 0) {
      uint64_t v59 = 0;
    }
    else {
      uint64_t v59 = 1 << hasPolicySecondaryMatch_bit5;
    }
    if ((hasPolicySecondaryMatch_bit5 & 0x40) == 0) {
      uint64_t v58 = 0;
    }
    uint64_t v60 = 1 << hasPolicySecondaryMatch_bit6;
    if ((hasPolicySecondaryMatch_bit6 & 0x40) != 0) {
      uint64_t v61 = 1 << hasPolicySecondaryMatch_bit6;
    }
    else {
      uint64_t v61 = 0;
    }
    if ((hasPolicySecondaryMatch_bit6 & 0x40) != 0) {
      uint64_t v60 = 0;
    }
    uint64_t v62 = v56 | v59 | v60;
    uint64_t v63 = v57 | v58 | v61;
    uint64_t v64 = -[PRSRankingItem indexScore]((uint64_t)v11);
    if (v62 & v64 | v63 & v65) {
      goto LABEL_9;
    }
    if ((isUpper5_c(v11, v65, v15) & 1) != 0
      || isUpper6_r(v11, v66, a3, v12, v15)
      || (isUpper7_0(v11, v67, v15) & 1) != 0
      || (isUpper7_0(v11, v68, v15) & 1) != 0
      || isUpper7(v11, v69, v15)
      || isUpper7_r(v11, a2, a3, v12)
      || isLowerScore_c0(v11, a2, v15))
    {
LABEL_8:
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = isLowerScore_c(v11, v70, v15);
    }
LABEL_9:

    goto LABEL_10;
  }
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

void __hasPolicySecondaryMatch_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCNearMatch"];
  hasPolicySecondaryMatch_bit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"exact_policy_flag_bit"];
  hasPolicySecondaryMatch_bit2 = [v3 integerValue];

  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"];
  hasPolicySecondaryMatch_bit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactOrderedMatch"];
  [v5 integerValue];

  float v6 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactNearMatch"];
  hasPolicySecondaryMatch_bit5 = [v6 integerValue];

  id v7 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactNearMatch"];
  hasPolicySecondaryMatch_bit6 = [v7 integerValue];
}

uint64_t isUpper5_c(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_c_block_invoke;
  block[3] = &unk_1E634C270;
  id v15 = v4;
  uint64_t v5 = isUpper5_c_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper5_c_onceToken, block);
  }
  char v8 = isUpper5_c_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  unint64_t v11 = v10;

  if ((v8 & 0x40) != 0) {
    unint64_t v12 = v11 >> v8;
  }
  else {
    unint64_t v12 = ((2 * v11) << ~v8) | (v9 >> v8);
  }

  return v12 & 1;
}

BOOL isUpper6_r(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v8 = a1;
  id v9 = a4;
  id v10 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper6_r_block_invoke;
  block[3] = &unk_1E634C270;
  id v11 = v10;
  id v19 = v11;
  if (isUpper6_r_onceToken != -1) {
    dispatch_once(&isUpper6_r_onceToken, block);
  }
  if ((isUpper6_r_upperBit & 0x40) != 0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 1 << isUpper6_r_upperBit;
  }
  if ((isUpper6_r_upperBit & 0x40) != 0) {
    uint64_t v13 = 1 << isUpper6_r_upperBit;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = -[PRSRankingItem indexScore]((uint64_t)v8);
  BOOL v16 = a3 >= 2
     && v12 & v14 | v13 & v15
     && ([v9 isEqualToString:@"co"] & 1) == 0
     && ![v9 isEqualToString:@"com"];

  return v16;
}

uint64_t isUpper7_0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper7_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v15 = v4;
  uint64_t v5 = isUpper7_0_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper7_0_onceToken, block);
  }
  char v8 = isUpper7_0_policyPhraseBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  unint64_t v11 = v10;

  if ((v8 & 0x40) != 0) {
    unint64_t v12 = v11 >> v8;
  }
  else {
    unint64_t v12 = ((2 * v11) << ~v8) | (v9 >> v8);
  }

  return v12 & 1;
}

BOOL isUpper7(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper7_block_invoke;
  block[3] = &unk_1E634C270;
  id v19 = v4;
  uint64_t v5 = isUpper7_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper7_onceToken, block);
  }
  uint64_t v8 = 1 << isUpper7_policyBit;
  if ((isUpper7_policyBit & 0x40) != 0) {
    uint64_t v9 = 1 << isUpper7_policyBit;
  }
  else {
    uint64_t v9 = 0;
  }
  if ((isUpper7_policyBit & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = 1 << isUpper7_prefixBit;
  if ((isUpper7_prefixBit & 0x40) != 0) {
    uint64_t v11 = 1 << isUpper7_prefixBit;
  }
  else {
    uint64_t v11 = 0;
  }
  if ((isUpper7_prefixBit & 0x40) != 0) {
    uint64_t v10 = 0;
  }
  uint64_t v12 = v10 | v8;
  uint64_t v13 = v11 | v9;
  uint64_t v14 = -[PRSRankingItem indexScore]((uint64_t)v7);
  uint64_t v16 = v15;

  return (v12 & v14 | v13 & v16) != 0;
}

BOOL isUpper7_r(void *a1, unint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  BOOL v10 = 1;
  if (-[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v7, 32, a2) < a2)
  {
    unint64_t v9 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v7, 393216, a2);
    if (a3 < 2
      || v9 < a2
      || ([v8 isEqualToString:@"co"] & 1) != 0
      || [v8 isEqualToString:@"com"])
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

BOOL isLowerScore_c0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isLowerScore_c0_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v18 = v7;
  if (isLowerScore_c0_onceToken != -1) {
    dispatch_once(&isLowerScore_c0_onceToken, block);
  }
  char v8 = isLowerScore_c0_bit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  BOOL v15 = 1;
  if ((v11 & 1) == 0
    || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2)
    && (([v5 bundleIDType] & 2) == 0
     || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2)))
  {
    uint64_t v12 = [v5 L2FeatureVector];
    [v12 scoreForFeature:18];
    float v14 = v13;

    if (v14 != 1.0 || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2)) {
      BOOL v15 = 0;
    }
  }

  return v15;
}

BOOL isLowerScore_c(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isLowerScore_c_block_invoke;
  block[3] = &unk_1E634C270;
  id v6 = v5;
  id v17 = v6;
  if (isLowerScore_c_onceToken != -1) {
    dispatch_once(&isLowerScore_c_onceToken, block);
  }
  char v7 = isLowerScore_c_bit;
  unint64_t v8 = -[PRSRankingItem indexScore]((uint64_t)v4);
  uint64_t v10 = ((2 * v9) << ~v7) | (v8 >> v7);
  if ((v7 & 0x40) != 0) {
    uint64_t v10 = v9 >> v7;
  }
  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = [v4 L2FeatureVector];
    [v12 scoreForFeature:18];
    float v14 = v13;

    BOOL v11 = v14 == 1.0;
  }

  return v11;
}

BOOL isUpper1_0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper1_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v23 = v4;
  uint64_t v5 = isUpper1_0_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper1_0_onceToken, block);
  }
  uint64_t v8 = 1 << isUpper1_0_bit1;
  if ((isUpper1_0_bit1 & 0x40) != 0) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 1 << isUpper1_0_bit1;
  }
  if ((isUpper1_0_bit1 & 0x40) == 0) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = 1 << isUpper1_0_bit2;
  if ((isUpper1_0_bit2 & 0x40) != 0) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 1 << isUpper1_0_bit2;
  }
  if ((isUpper1_0_bit2 & 0x40) == 0) {
    uint64_t v10 = 0;
  }
  uint64_t v12 = v10 | v8;
  uint64_t v13 = v11 | v9;
  uint64_t v14 = 1 << isUpper1_0_bit3;
  if ((isUpper1_0_bit3 & 0x40) != 0) {
    uint64_t v15 = 1 << isUpper1_0_bit3;
  }
  else {
    uint64_t v15 = 0;
  }
  if ((isUpper1_0_bit3 & 0x40) != 0) {
    uint64_t v14 = 0;
  }
  uint64_t v16 = v13 | v14;
  uint64_t v17 = v12 | v15;
  uint64_t v18 = -[PRSRankingItem indexScore]((uint64_t)v7);
  uint64_t v20 = v19;

  return (v16 & v18 | v17 & v20) != 0;
}

void __isUpper1_0_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsExactPhraseMatchBit"];
  isUpper1_0_bit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch"];
  isUpper1_0_bit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch"];
  isUpper1_0_bit3 = [v4 integerValue];
}

BOOL isUpper1(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper1_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v24 = v7;
  if (isUpper1_onceToken != -1) {
    dispatch_once(&isUpper1_onceToken, block);
  }
  if ((isUpper1_bit & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 1 << isUpper1_bit;
  }
  if ((isUpper1_bit & 0x40) != 0) {
    uint64_t v9 = 1 << isUpper1_bit;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v12 = v8 & v10 | v9 & v11;
  if (v12)
  {
    unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2);
    uint64_t v14 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2);
    unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2);
    if (!v14 || v15 < 2 || v13 < a2)
    {
      unint64_t v16 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
      if (!-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2) || v16 < a2)
      {
        uint64_t v17 = [v5 L2FeatureVector];
        [v17 scoreForFeature:1044];
        float v19 = v18;

        float v20 = ((double)a2 + 1.0) / (double)a2;
        if (v19 != v20 && (v19 >= 2147500000.0 || v19 >= v20 || v19 <= 0.0))
        {
          float v21 = [v5 L2FeatureVector];
          [v21 scoreForFeature:279];
        }
      }
    }
  }

  return v12 != 0;
}

void __isUpper1_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCExactOrderedPhraseMatch"];
  isUpper1_bit = [v1 integerValue];
}

uint64_t isUpper2_0_2(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper2_0_2_block_invoke;
    block[3] = &unk_1E634C270;
    id v56 = v6;
    if (isUpper2_0_2_onceToken != -1) {
      dispatch_once(&isUpper2_0_2_onceToken, block);
    }
    uint64_t v9 = 1 << isUpper2_0_2_bit2;
    if ((isUpper2_0_2_bit2 & 0x40) != 0) {
      uint64_t v10 = 1 << isUpper2_0_2_bit2;
    }
    else {
      uint64_t v10 = 0;
    }
    if ((isUpper2_0_2_bit2 & 0x40) != 0) {
      uint64_t v9 = 0;
    }
    uint64_t v11 = 1 << isUpper2_0_2_bit5;
    if ((isUpper2_0_2_bit5 & 0x40) != 0) {
      uint64_t v12 = 1 << isUpper2_0_2_bit5;
    }
    else {
      uint64_t v12 = 0;
    }
    if ((isUpper2_0_2_bit5 & 0x40) != 0) {
      uint64_t v11 = 0;
    }
    uint64_t v13 = v11 | v9;
    uint64_t v14 = v12 | v10;
    uint64_t v15 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v13 & v15 | v14 & v16)
    {
      uint64_t v17 = [v5 L2FeatureVector];
      [v17 scoreForFeature:2439];
      float v19 = v18;

      if (v19 > 0.0) {
        goto LABEL_49;
      }
      if (([v5 bundleIDType] & 2) != 0)
      {
        float v20 = [v5 L2FeatureVector];
        [v20 scoreForFeature:2431];
        float v22 = v21;

        if (v22 > 0.0) {
          goto LABEL_49;
        }
      }
    }
    uint64_t v23 = 1 << isUpper2_0_2_bit3;
    if ((isUpper2_0_2_bit3 & 0x40) != 0) {
      uint64_t v24 = 1 << isUpper2_0_2_bit3;
    }
    else {
      uint64_t v24 = 0;
    }
    if ((isUpper2_0_2_bit3 & 0x40) != 0) {
      uint64_t v23 = 0;
    }
    uint64_t v25 = 1 << isUpper2_0_2_bit6;
    if ((isUpper2_0_2_bit6 & 0x40) != 0) {
      uint64_t v26 = 1 << isUpper2_0_2_bit6;
    }
    else {
      uint64_t v26 = 0;
    }
    if ((isUpper2_0_2_bit6 & 0x40) != 0) {
      uint64_t v25 = 0;
    }
    uint64_t v27 = v25 | v23;
    uint64_t v28 = v26 | v24;
    uint64_t v29 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v27 & v29 | v28 & v30)
    {
      float v31 = [v5 L2FeatureVector];
      [v31 scoreForFeature:2439];
      float v33 = v32;

      if (v33 > 0.0) {
        goto LABEL_49;
      }
      if (([v5 bundleIDType] & 2) != 0)
      {
        float v34 = [v5 L2FeatureVector];
        [v34 scoreForFeature:2431];
        float v36 = v35;

        if (v36 > 0.0) {
          goto LABEL_49;
        }
      }
    }
    char v37 = isUpper2_0_2_bit1;
    unint64_t v38 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v40 = ((2 * v39) << ~v37) | (v38 >> v37);
    if ((v37 & 0x40) != 0) {
      uint64_t v40 = v39 >> v37;
    }
    if ((v40 & 1) == 0) {
      goto LABEL_52;
    }
    unint64_t v41 = [v5 L2FeatureVector];
    [v41 scoreForFeature:217];
    float v43 = v42;

    float v44 = ((double)a2 + 2.0) / (double)a2;
    if (v43 < 2147500000.0 && v43 <= v44 && v43 > 0.0) {
      goto LABEL_49;
    }
    uint64_t v45 = [v5 L2FeatureVector];
    [v45 scoreForFeature:223];
    float v47 = v46;

    if (v47 < 2147500000.0 && v47 <= v44 && v47 > 0.0) {
      goto LABEL_49;
    }
    float v48 = [v5 L2FeatureVector];
    [v48 scoreForFeature:211];
    float v50 = v49;

    if (v50 < 2147500000.0 && v50 <= v44 && v50 > 0.0) {
      goto LABEL_49;
    }
    if (([v5 bundleIDType] & 2) != 0
      && ([v5 L2FeatureVector],
          float v51 = objc_claimAutoreleasedReturnValue(),
          [v51 scoreForFeature:199],
          float v53 = v52,
          v51,
          v53 < 2147500000.0)
      && v53 <= v44
      && v53 > 0.0)
    {
LABEL_49:
      uint64_t v8 = 1;
    }
    else
    {
LABEL_52:
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __isUpper2_0_2_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"exact_policy_flag_bit"];
  isUpper2_0_2_bit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_2_bit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_2_bit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactNearMatch"];
  isUpper2_0_2_bit5 = [v5 integerValue];

  id v6 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactNearMatch"];
  isUpper2_0_2_bit6 = [v6 integerValue];
}

uint64_t isUpper2_0_3(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper2_0_3_block_invoke;
    block[3] = &unk_1E634C270;
    id v56 = v6;
    if (isUpper2_0_3_onceToken != -1) {
      dispatch_once(&isUpper2_0_3_onceToken, block);
    }
    uint64_t v9 = 1 << isUpper2_0_3_bit2;
    if ((isUpper2_0_3_bit2 & 0x40) != 0) {
      uint64_t v10 = 1 << isUpper2_0_3_bit2;
    }
    else {
      uint64_t v10 = 0;
    }
    if ((isUpper2_0_3_bit2 & 0x40) != 0) {
      uint64_t v9 = 0;
    }
    uint64_t v11 = 1 << isUpper2_0_3_bit5;
    if ((isUpper2_0_3_bit5 & 0x40) != 0) {
      uint64_t v12 = 1 << isUpper2_0_3_bit5;
    }
    else {
      uint64_t v12 = 0;
    }
    if ((isUpper2_0_3_bit5 & 0x40) != 0) {
      uint64_t v11 = 0;
    }
    uint64_t v13 = v11 | v9;
    uint64_t v14 = v12 | v10;
    uint64_t v15 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v13 & v15 | v14 & v16)
    {
      uint64_t v17 = [v5 L2FeatureVector];
      [v17 scoreForFeature:2440];
      float v19 = v18;

      if (v19 > 0.0) {
        goto LABEL_49;
      }
      if (([v5 bundleIDType] & 2) != 0)
      {
        float v20 = [v5 L2FeatureVector];
        [v20 scoreForFeature:2432];
        float v22 = v21;

        if (v22 > 0.0) {
          goto LABEL_49;
        }
      }
    }
    uint64_t v23 = 1 << isUpper2_0_3_bit3;
    if ((isUpper2_0_3_bit3 & 0x40) != 0) {
      uint64_t v24 = 1 << isUpper2_0_3_bit3;
    }
    else {
      uint64_t v24 = 0;
    }
    if ((isUpper2_0_3_bit3 & 0x40) != 0) {
      uint64_t v23 = 0;
    }
    uint64_t v25 = 1 << isUpper2_0_3_bit6;
    if ((isUpper2_0_3_bit6 & 0x40) != 0) {
      uint64_t v26 = 1 << isUpper2_0_3_bit6;
    }
    else {
      uint64_t v26 = 0;
    }
    if ((isUpper2_0_3_bit6 & 0x40) != 0) {
      uint64_t v25 = 0;
    }
    uint64_t v27 = v25 | v23;
    uint64_t v28 = v26 | v24;
    uint64_t v29 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v27 & v29 | v28 & v30)
    {
      float v31 = [v5 L2FeatureVector];
      [v31 scoreForFeature:2440];
      float v33 = v32;

      if (v33 > 0.0) {
        goto LABEL_49;
      }
      if (([v5 bundleIDType] & 2) != 0)
      {
        float v34 = [v5 L2FeatureVector];
        [v34 scoreForFeature:2432];
        float v36 = v35;

        if (v36 > 0.0) {
          goto LABEL_49;
        }
      }
    }
    char v37 = isUpper2_0_3_bit1;
    unint64_t v38 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v40 = ((2 * v39) << ~v37) | (v38 >> v37);
    if ((v37 & 0x40) != 0) {
      uint64_t v40 = v39 >> v37;
    }
    if ((v40 & 1) == 0) {
      goto LABEL_52;
    }
    unint64_t v41 = [v5 L2FeatureVector];
    [v41 scoreForFeature:217];
    float v43 = v42;

    float v44 = ((double)a2 + 3.0) / (double)a2;
    if (v43 < 2147500000.0 && v43 <= v44 && v43 > 0.0) {
      goto LABEL_49;
    }
    uint64_t v45 = [v5 L2FeatureVector];
    [v45 scoreForFeature:223];
    float v47 = v46;

    if (v47 < 2147500000.0 && v47 <= v44 && v47 > 0.0) {
      goto LABEL_49;
    }
    float v48 = [v5 L2FeatureVector];
    [v48 scoreForFeature:211];
    float v50 = v49;

    if (v50 < 2147500000.0 && v50 <= v44 && v50 > 0.0) {
      goto LABEL_49;
    }
    if (([v5 bundleIDType] & 2) != 0
      && ([v5 L2FeatureVector],
          float v51 = objc_claimAutoreleasedReturnValue(),
          [v51 scoreForFeature:199],
          float v53 = v52,
          v51,
          v53 < 2147500000.0)
      && v53 <= v44
      && v53 > 0.0)
    {
LABEL_49:
      uint64_t v8 = 1;
    }
    else
    {
LABEL_52:
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __isUpper2_0_3_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"exact_policy_flag_bit"];
  isUpper2_0_3_bit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_3_bit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_3_bit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactNearMatch"];
  isUpper2_0_3_bit5 = [v5 integerValue];

  id v6 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactNearMatch"];
  isUpper2_0_3_bit6 = [v6 integerValue];
}

uint64_t isUpper2_0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper2_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v6 = v5;
  id v40 = v6;
  if (isUpper2_0_onceToken != -1) {
    dispatch_once(&isUpper2_0_onceToken, block);
  }
  uint64_t v7 = 1;
  uint64_t v8 = 1 << isUpper2_0_bit2;
  if ((isUpper2_0_bit2 & 0x40) != 0) {
    uint64_t v9 = 1 << isUpper2_0_bit2;
  }
  else {
    uint64_t v9 = 0;
  }
  if ((isUpper2_0_bit2 & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = 1 << isUpper2_0_bit3;
  if ((isUpper2_0_bit3 & 0x40) != 0) {
    uint64_t v11 = 1 << isUpper2_0_bit3;
  }
  else {
    uint64_t v11 = 0;
  }
  if ((isUpper2_0_bit3 & 0x40) != 0) {
    uint64_t v10 = 0;
  }
  uint64_t v12 = v10 | v8;
  uint64_t v13 = v11 | v9;
  uint64_t v14 = 1 << isUpper2_0_bit5;
  if ((isUpper2_0_bit5 & 0x40) != 0) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 1 << isUpper2_0_bit5;
  }
  if ((isUpper2_0_bit5 & 0x40) == 0) {
    uint64_t v14 = 0;
  }
  uint64_t v16 = 1 << isUpper2_0_bit6;
  if ((isUpper2_0_bit6 & 0x40) != 0) {
    uint64_t v17 = 1 << isUpper2_0_bit6;
  }
  else {
    uint64_t v17 = 0;
  }
  if ((isUpper2_0_bit6 & 0x40) != 0) {
    uint64_t v16 = 0;
  }
  uint64_t v18 = v12 | v15 | v16;
  uint64_t v19 = v13 | v14 | v17;
  uint64_t v20 = -[PRSRankingItem indexScore]((uint64_t)v4);
  if (!(v18 & v20 | v19 & v21))
  {
    char v22 = isUpper2_0_bit1;
    unint64_t v23 = -[PRSRankingItem indexScore]((uint64_t)v4);
    uint64_t v25 = ((2 * v24) << ~v22) | (v23 >> v22);
    if ((v22 & 0x40) != 0) {
      uint64_t v25 = v24 >> v22;
    }
    if ((v25 & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v26 = [v4 L2FeatureVector];
    [v26 scoreForFeature:217];
    float v28 = v27;

    if (v28 > 0.0 && v28 < 2147500000.0) {
      goto LABEL_33;
    }
    uint64_t v29 = [v4 L2FeatureVector];
    [v29 scoreForFeature:223];
    float v31 = v30;

    if (v31 > 0.0 && v31 < 2147500000.0) {
      goto LABEL_33;
    }
    float v32 = [v4 L2FeatureVector];
    [v32 scoreForFeature:211];
    float v34 = v33;

    if (v34 > 0.0 && v34 < 2147500000.0) {
      goto LABEL_33;
    }
    if (([v4 bundleIDType] & 2) != 0
      && ([v4 L2FeatureVector],
          float v35 = objc_claimAutoreleasedReturnValue(),
          [v35 scoreForFeature:199],
          float v37 = v36,
          v35,
          v37 > 0.0)
      && v37 < 2147500000.0)
    {
LABEL_33:
      uint64_t v7 = 1;
    }
    else
    {
LABEL_37:
      uint64_t v7 = 0;
    }
  }

  return v7;
}

void __isUpper2_0_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"exact_policy_flag_bit"];
  isUpper2_0_bit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_bit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactOrderedMatch"];
  isUpper2_0_bit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCExactNearMatch"];
  isUpper2_0_bit5 = [v5 integerValue];

  id v6 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCExactNearMatch"];
  isUpper2_0_bit6 = [v6 integerValue];
}

uint64_t isUpper2(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper2_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v36 = v7;
  if (isUpper2_onceToken != -1) {
    dispatch_once(&isUpper2_onceToken, block);
  }
  uint64_t v8 = 1 << isUpper2_bit4;
  if ((isUpper2_bit4 & 0x40) != 0) {
    uint64_t v9 = 1 << isUpper2_bit4;
  }
  else {
    uint64_t v9 = 0;
  }
  if ((isUpper2_bit4 & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = 1 << isUpper2_bit7;
  if ((isUpper2_bit7 & 0x40) != 0) {
    uint64_t v11 = 1 << isUpper2_bit7;
  }
  else {
    uint64_t v11 = 0;
  }
  if ((isUpper2_bit7 & 0x40) != 0) {
    uint64_t v10 = 0;
  }
  uint64_t v12 = v10 | v8;
  uint64_t v13 = v11 | v9;
  uint64_t v14 = -[PRSRankingItem indexScore]((uint64_t)v5);
  if (!(v12 & v14 | v13 & v15)) {
    goto LABEL_25;
  }
  unint64_t v16 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2);
  uint64_t v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2);
  unint64_t v18 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2);
  if (v17 && v18 >= 2 && v16 >= a2) {
    goto LABEL_23;
  }
  unint64_t v19 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
  if (v17)
  {
    if (v19 >= a2) {
      goto LABEL_23;
    }
  }
  uint64_t v20 = [v5 L2FeatureVector];
  [v20 scoreForFeature:1043];
  float v22 = v21;

  if (v22 > 0.0 && v22 < 2147500000.0) {
    goto LABEL_23;
  }
  unint64_t v23 = [v5 L2FeatureVector];
  [v23 scoreForFeature:277];
  float v25 = v24;

  if (v25 > 0.0 && v25 < 2147500000.0) {
    goto LABEL_23;
  }
  if (([v5 bundleIDType] & 2) == 0)
  {
LABEL_25:
    uint64_t v26 = 0;
    goto LABEL_26;
  }
  unint64_t v28 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2);
  if ((unint64_t)-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2) >= 2
    && v28 >= a2)
  {
    goto LABEL_23;
  }
  uint64_t v29 = [v5 L2FeatureVector];
  [v29 scoreForFeature:1043];
  float v31 = v30;

  if (v31 > 0.0 && v31 < 2147500000.0) {
    goto LABEL_23;
  }
  float v32 = [v5 L2FeatureVector];
  [v32 scoreForFeature:283];
  float v34 = v33;

  uint64_t v26 = 0;
  if (v34 > 0.0 && v34 < 2147500000.0) {
LABEL_23:
  }
    uint64_t v26 = 1;
LABEL_26:

  return v26;
}

void __isUpper2_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCExactOrderedMatch"];
  isUpper2_bit4 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCExactNearMatch"];
  isUpper2_bit7 = [v3 integerValue];
}

uint64_t isUpper3_0(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper3_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v51 = v7;
  if (isUpper3_0_onceToken != -1) {
    dispatch_once(&isUpper3_0_onceToken, block);
  }
  uint64_t v8 = 1;
  uint64_t v9 = 1 << isUpper3_0_almostExactBit1;
  if ((isUpper3_0_almostExactBit1 & 0x40) != 0) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 1 << isUpper3_0_almostExactBit1;
  }
  if ((isUpper3_0_almostExactBit1 & 0x40) == 0) {
    uint64_t v9 = 0;
  }
  uint64_t v11 = 1 << isUpper3_0_almostExactBit2;
  if ((isUpper3_0_almostExactBit2 & 0x40) != 0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 1 << isUpper3_0_almostExactBit2;
  }
  if ((isUpper3_0_almostExactBit2 & 0x40) == 0) {
    uint64_t v11 = 0;
  }
  uint64_t v13 = v11 | v9;
  uint64_t v14 = v12 | v10;
  uint64_t v15 = 1 << isUpper3_0_almostExactBit3;
  if ((isUpper3_0_almostExactBit3 & 0x40) != 0) {
    uint64_t v16 = 1 << isUpper3_0_almostExactBit3;
  }
  else {
    uint64_t v16 = 0;
  }
  if ((isUpper3_0_almostExactBit3 & 0x40) != 0) {
    uint64_t v15 = 0;
  }
  uint64_t v17 = v14 | v15;
  uint64_t v18 = v13 | v16;
  uint64_t v19 = -[PRSRankingItem indexScore]((uint64_t)v5);
  if (!(v17 & v19 | v18 & v20))
  {
    char v21 = isUpper3_0_policyBit;
    unint64_t v22 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v24 = ((2 * v23) << ~v21) | (v22 >> v21);
    if ((v21 & 0x40) != 0) {
      uint64_t v24 = v23 >> v21;
    }
    if ((v24 & 1) == 0) {
      goto LABEL_56;
    }
    unint64_t v25 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 4, a2);
    unint64_t v26 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 4, a2);
    if (v25)
    {
      if (v25 >= a2 - 1)
      {
        if (v26)
        {
          if (v26 >= a2)
          {
            float v27 = [v5 L2FeatureVector];
            [v27 scoreForFeature:212];
            float v29 = v28;

            float v30 = ((double)a2 + 1.0) / (double)a2;
            if (v29 == v30 || v29 < 2147500000.0 && v29 < v30 && v29 > 0.0) {
              goto LABEL_55;
            }
          }
        }
      }
    }
    if (([v5 bundleIDType] & 2) != 0)
    {
      unint64_t v31 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
      unint64_t v32 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 2, a2);
      if (v31)
      {
        if (v31 >= a2 - 1)
        {
          if (v32)
          {
            if (v32 >= a2)
            {
              float v33 = [v5 L2FeatureVector];
              [v33 scoreForFeature:212];
              float v35 = v34;

              float v36 = ((double)a2 + 1.0) / (double)a2;
              if (v35 == v36 || v35 < 2147500000.0 && v35 < v36 && v35 > 0.0) {
                goto LABEL_55;
              }
            }
          }
        }
      }
    }
    unint64_t v37 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 8, a2);
    unint64_t v38 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 8, a2);
    if (v37)
    {
      if (v37 >= a2 - 1)
      {
        if (v38)
        {
          if (v38 >= a2)
          {
            unint64_t v39 = [v5 L2FeatureVector];
            [v39 scoreForFeature:218];
            float v41 = v40;

            float v42 = ((double)a2 + 1.0) / (double)a2;
            if (v41 == v42 || v41 < 2147500000.0 && v41 < v42 && v41 > 0.0) {
              goto LABEL_55;
            }
          }
        }
      }
    }
    unint64_t v43 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x8000, a2);
    unint64_t v44 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x8000, a2);
    if (!v43)
    {
LABEL_56:
      uint64_t v8 = 0;
      goto LABEL_57;
    }
    uint64_t v8 = 0;
    if (v43 >= a2 - 1)
    {
      if (v44)
      {
        if (v44 >= a2)
        {
          uint64_t v45 = [v5 L2FeatureVector];
          [v45 scoreForFeature:218];
          float v47 = v46;

          float v48 = ((double)a2 + 1.0) / (double)a2;
          if (v47 == v48 || (uint64_t v8 = 0, v47 < 2147500000.0) && v47 < v48 && v47 > 0.0) {
LABEL_55:
          }
            uint64_t v8 = 1;
        }
      }
    }
  }
LABEL_57:

  return v8;
}

void __isUpper3_0_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch"];
  isUpper3_0_almostExactBit1 = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch"];
  isUpper3_0_almostExactBit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsMostlyExactPhraseMatchBit"];
  isUpper3_0_almostExactBit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch"];
  isUpper3_0_policyBit = [v5 integerValue];
}

uint64_t isUpper3(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper3_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v38 = v7;
  if (isUpper3_onceToken != -1) {
    dispatch_once(&isUpper3_onceToken, block);
  }
  char v8 = isUpper3_policyBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  }
  unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 8, a2);
  uint64_t v14 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x8000, a2);
  if (v12 < a2 - 1) {
    goto LABEL_9;
  }
  unint64_t v16 = v14;
  uint64_t v17 = [v5 L2FeatureVector];
  [v17 scoreForFeature:212];
  float v19 = v18;

  float v20 = ((double)a2 + 1.0) / (double)a2;
  if (v19 == v20 || v19 < 2147500000.0 && v19 < v20 && v19 > 0.0) {
    goto LABEL_50;
  }
  if (([v5 bundleIDType] & 2) != 0)
  {
    float v33 = [v5 L2FeatureVector];
    [v33 scoreForFeature:200];
    float v35 = v34;

    if (v35 == v20 || v35 < 2147500000.0 && v35 < v20 && v35 > 0.0) {
      goto LABEL_50;
    }
  }
  char v21 = [v5 L2FeatureVector];
  [v21 scoreForFeature:218];
  float v23 = v22;

  if (v23 == v20 || v23 < 2147500000.0 && v23 < v20 && v23 > 0.0) {
    goto LABEL_50;
  }
  if (a2 >= 3 && v13
    || a2 >= 4 && v13 > 1
    || ([v5 L2FeatureVector],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        [v24 scoreForFeature:224],
        float v26 = v25,
        v24,
        v26 == v20))
  {
LABEL_50:
    uint64_t v15 = 1;
    goto LABEL_51;
  }
  BOOL v27 = a2 <= 2 || v16 == 0;
  BOOL v28 = !v27;
  BOOL v29 = a2 > 3 && v16 > 1;
  BOOL v30 = v29;
  BOOL v31 = v26 > 0.0 && v26 < v20;
  BOOL v32 = v31 && v26 < 2147500000.0;
  uint64_t v15 = 1;
  if (!v32 && !v28 && !v30) {
LABEL_9:
  }
    uint64_t v15 = 0;
LABEL_51:

  return v15;
}

void __isUpper3_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPrefixMatch"];
  isUpper3_policyBit = [v1 integerValue];
}

uint64_t isUpper4_0(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper4_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v17 = v7;
  if (isUpper4_0_onceToken != -1) {
    dispatch_once(&isUpper4_0_onceToken, block);
  }
  char v8 = isUpper4_0_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    uint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000002, a2);
  }
  if (!a2) {
    goto LABEL_15;
  }
  if (a2 != 1)
  {
    unint64_t v14 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v14 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x1000000002, a2);
    }
    if (v14 >= a2) {
      goto LABEL_11;
    }
LABEL_15:
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  if (!v12) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v13 = 1;
LABEL_16:

  return v13;
}

void __isUpper4_0_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCMostlyExactOrderedPhraseMatch"];
  isUpper4_0_upperBit = [v1 integerValue];
}

uint64_t isUpper4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper4_block_invoke;
  block[3] = &unk_1E634C270;
  id v15 = v4;
  uint64_t v5 = isUpper4_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper4_onceToken, block);
  }
  char v8 = isUpper4_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  unint64_t v11 = v10;

  if ((v8 & 0x40) != 0) {
    unint64_t v12 = v11 >> v8;
  }
  else {
    unint64_t v12 = ((2 * v11) << ~v8) | (v9 >> v8);
  }

  return v12 & 1;
}

void __isUpper4_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCMostlyExactOrderedPhraseMatch"];
  isUpper4_upperBit = [v1 integerValue];
}

uint64_t isUpper2_1(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper2_1_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v16 = v7;
  if (isUpper2_1_onceToken != -1) {
    dispatch_once(&isUpper2_1_onceToken, block);
  }
  char v8 = isUpper2_1_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  }
  if (v12 >= a2) {
    uint64_t v13 = 1;
  }
  else {
LABEL_9:
  }
    uint64_t v13 = 0;

  return v13;
}

void __isUpper2_1_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_1_upperBit = [v1 integerValue];
}

uint64_t isUpper2_1_2(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper2_1_2_block_invoke;
    block[3] = &unk_1E634C270;
    id v28 = v6;
    if (isUpper2_1_2_onceToken != -1) {
      dispatch_once(&isUpper2_1_2_onceToken, block);
    }
    char v9 = isUpper2_1_2_upperBit;
    unint64_t v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0) {
      uint64_t v12 = v11 >> v9;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
    }
    if (v13 < a2) {
      goto LABEL_11;
    }
    id v15 = [v5 L2FeatureVector];
    [v15 scoreForFeature:2443];
    float v17 = v16;

    float v18 = [v5 L2FeatureVector];
    [v18 scoreForFeature:2503];
    float v20 = v19;

    char v21 = [v5 L2FeatureVector];
    [v21 scoreForFeature:2439];
    float v23 = v22;

    uint64_t v8 = 1;
    if (v17 > 0.0 || v20 > 0.0 || v23 > 0.0) {
      goto LABEL_12;
    }
    if (([v5 bundleIDType] & 2) != 0
      && ([v5 L2FeatureVector],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          [v24 scoreForFeature:2431],
          float v26 = v25,
          v24,
          v26 > 0.0))
    {
      uint64_t v8 = 1;
    }
    else
    {
LABEL_11:
      uint64_t v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

void __isUpper2_1_2_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_1_2_upperBit = [v1 integerValue];
}

uint64_t isUpper2_1_3(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper2_1_3_block_invoke;
    block[3] = &unk_1E634C270;
    id v28 = v6;
    if (isUpper2_1_3_onceToken != -1) {
      dispatch_once(&isUpper2_1_3_onceToken, block);
    }
    char v9 = isUpper2_1_3_upperBit;
    unint64_t v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0) {
      uint64_t v12 = v11 >> v9;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
    }
    if (v13 < a2) {
      goto LABEL_11;
    }
    id v15 = [v5 L2FeatureVector];
    [v15 scoreForFeature:2444];
    float v17 = v16;

    float v18 = [v5 L2FeatureVector];
    [v18 scoreForFeature:2504];
    float v20 = v19;

    char v21 = [v5 L2FeatureVector];
    [v21 scoreForFeature:2440];
    float v23 = v22;

    uint64_t v8 = 1;
    if (v17 > 0.0 || v20 > 0.0 || v23 > 0.0) {
      goto LABEL_12;
    }
    if (([v5 bundleIDType] & 2) != 0
      && ([v5 L2FeatureVector],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          [v24 scoreForFeature:2432],
          float v26 = v25,
          v24,
          v26 > 0.0))
    {
      uint64_t v8 = 1;
    }
    else
    {
LABEL_11:
      uint64_t v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

void __isUpper2_1_3_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_1_3_upperBit = [v1 integerValue];
}

uint64_t isUpper2_2_2(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper2_2_2_block_invoke;
  block[3] = &unk_1E634C270;
  id v10 = v8;
  id v42 = v10;
  if (isUpper2_2_2_onceToken != -1) {
    dispatch_once(&isUpper2_2_2_onceToken, block);
  }
  char v11 = isUpper2_2_2_upperBit;
  unint64_t v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
  uint64_t v14 = ((2 * v13) << ~v11) | (v12 >> v11);
  if ((v11 & 0x40) != 0) {
    uint64_t v14 = v13 >> v11;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_19;
  }
  unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
  if (([v7 bundleIDType] & 2) != 0) {
    unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
  }
  if (![v9 count]) {
    goto LABEL_19;
  }
  float v16 = [v9 lastObject];
  unint64_t v17 = [v16 length];

  uint64_t v18 = 0;
  if (v15 >= a2 && v17 >= 2)
  {
    float v19 = [v7 L2FeatureVector];
    [v19 scoreForFeature:2443];
    float v21 = v20;

    float v22 = [v7 L2FeatureVector];
    [v22 scoreForFeature:2503];
    float v24 = v23;

    float v25 = [v7 L2FeatureVector];
    [v25 scoreForFeature:2439];
    float v27 = v26;

    id v28 = [v7 L2FeatureVector];
    [v28 scoreForFeature:2467];
    float v30 = v29;

    BOOL v31 = [v7 L2FeatureVector];
    [v31 scoreForFeature:2499];
    float v33 = v32;

    uint64_t v18 = 1;
    if (v21 <= 0.0 && v24 <= 0.0 && v27 <= 0.0 && v30 <= 0.0 && v33 <= 0.0)
    {
      if (([v7 bundleIDType] & 2) == 0) {
        goto LABEL_19;
      }
      float v34 = [v7 L2FeatureVector];
      [v34 scoreForFeature:2431];
      float v36 = v35;

      unint64_t v37 = [v7 L2FeatureVector];
      [v37 scoreForFeature:2471];
      float v39 = v38;

      if (v36 <= 0.0 && v39 <= 0.0) {
LABEL_19:
      }
        uint64_t v18 = 0;
    }
  }

  return v18;
}

void __isUpper2_2_2_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_2_2_upperBit = [v1 integerValue];
}

uint64_t isUpper2_2_3(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper2_2_3_block_invoke;
    block[3] = &unk_1E634C270;
    id v41 = v8;
    if (isUpper2_2_3_onceToken != -1) {
      dispatch_once(&isUpper2_2_3_onceToken, block);
    }
    char v11 = isUpper2_2_3_upperBit;
    unint64_t v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
    uint64_t v14 = ((2 * v13) << ~v11) | (v12 >> v11);
    if ((v11 & 0x40) != 0) {
      uint64_t v14 = v13 >> v11;
    }
    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
    unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
    if (([v7 bundleIDType] & 2) != 0) {
      unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
    }
    if (![v9 count]) {
      goto LABEL_21;
    }
    float v16 = [v9 lastObject];
    unint64_t v17 = [v16 length];

    uint64_t v10 = 0;
    if (v15 >= a2 && v17 >= 2)
    {
      uint64_t v18 = [v7 L2FeatureVector];
      [v18 scoreForFeature:2444];
      float v20 = v19;

      float v21 = [v7 L2FeatureVector];
      [v21 scoreForFeature:2504];
      float v23 = v22;

      float v24 = [v7 L2FeatureVector];
      [v24 scoreForFeature:2440];
      float v26 = v25;

      float v27 = [v7 L2FeatureVector];
      [v27 scoreForFeature:2468];
      float v29 = v28;

      float v30 = [v7 L2FeatureVector];
      [v30 scoreForFeature:2500];
      float v32 = v31;

      uint64_t v10 = 1;
      if (v20 <= 0.0 && v23 <= 0.0 && v26 <= 0.0 && v29 <= 0.0 && v32 <= 0.0)
      {
        if (([v7 bundleIDType] & 2) == 0) {
          goto LABEL_21;
        }
        float v33 = [v7 L2FeatureVector];
        [v33 scoreForFeature:2432];
        float v35 = v34;

        float v36 = [v7 L2FeatureVector];
        [v36 scoreForFeature:2472];
        float v38 = v37;

        if (v35 <= 0.0 && v38 <= 0.0) {
LABEL_21:
        }
          uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __isUpper2_2_3_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_2_3_upperBit = [v1 integerValue];
}

uint64_t isUpper2_2(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper2_2_block_invoke;
  block[3] = &unk_1E634C270;
  id v10 = v8;
  id v21 = v10;
  if (isUpper2_2_onceToken != -1) {
    dispatch_once(&isUpper2_2_onceToken, block);
  }
  char v11 = isUpper2_2_upperBit;
  unint64_t v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
  uint64_t v14 = ((2 * v13) << ~v11) | (v12 >> v11);
  if ((v11 & 0x40) != 0) {
    uint64_t v14 = v13 >> v11;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_12;
  }
  unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
  if (([v7 bundleIDType] & 2) != 0) {
    unint64_t v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
  }
  if ([v9 count]
    && ([v9 lastObject],
        float v16 = objc_claimAutoreleasedReturnValue(),
        unint64_t v17 = [v16 length],
        v16,
        v15 >= a2)
    && v17 > 1)
  {
    uint64_t v18 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v18 = 0;
  }

  return v18;
}

void __isUpper2_2_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingExactMultiFieldsTCNearMatch"];
  isUpper2_2_upperBit = [v1 integerValue];
}

uint64_t isUpper5_0(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v17 = v7;
  if (isUpper5_0_onceToken != -1) {
    dispatch_once(&isUpper5_0_onceToken, block);
  }
  char v8 = isUpper5_0_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  }
  if (!a2) {
    goto LABEL_16;
  }
  if (a2 != 1)
  {
    if (v12 < a2 - 1) {
      goto LABEL_16;
    }
    unint64_t v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 32780, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 2, a2);
    }
    if (v13 < a2) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  if (v12) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v14 = 0;
LABEL_17:

  return v14;
}

void __isUpper5_0_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5_0_upperBit = [v1 integerValue];
}

uint64_t isUpper5_0r(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_0r_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v17 = v7;
  if (isUpper5_0r_onceToken != -1) {
    dispatch_once(&isUpper5_0r_onceToken, block);
  }
  char v8 = isUpper5_0r_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 294956, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    unint64_t v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  }
  if (!a2) {
    goto LABEL_16;
  }
  if (a2 != 1)
  {
    if (v12 < a2 - 1) {
      goto LABEL_16;
    }
    unint64_t v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 294956, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 2, a2);
    }
    if (v13 < a2) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  if (v12) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v14 = 0;
LABEL_17:

  return v14;
}

void __isUpper5_0r_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5_0r_upperBit = [v1 integerValue];
}

BOOL isUpper5_s(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_s_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v16 = v7;
  if (isUpper5_s_onceToken != -1) {
    dispatch_once(&isUpper5_s_onceToken, block);
  }
  char v8 = isUpper5_s_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  BOOL v13 = 0;
  if (v11)
  {
    uint64_t v12 = ([v5 bundleIDType] & 2) != 0 ? 0x1000004002 : 0x10000C00CLL;
    if (-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, v12, a2) >= a2 - 1
      && -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, v12, a2) >= a2)
    {
      BOOL v13 = 1;
    }
  }

  return v13;
}

void __isUpper5_s_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5_s_upperBit = [v1 integerValue];
}

uint64_t isUpper5__2(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper5__2_block_invoke;
    block[3] = &unk_1E634C270;
    id v52 = v6;
    if (isUpper5__2_onceToken != -1) {
      dispatch_once(&isUpper5__2_onceToken, block);
    }
    char v9 = isUpper5__2_upperBit;
    unint64_t v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0) {
      uint64_t v12 = v11 >> v9;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_21;
    }
    BOOL v13 = [v5 L2FeatureVector];
    [v13 scoreForFeature:2597];
    float v50 = v14;

    unint64_t v15 = [v5 L2FeatureVector];
    [v15 scoreForFeature:2627];
    float v17 = v16;

    uint64_t v18 = [v5 L2FeatureVector];
    [v18 scoreForFeature:2611];
    float v20 = v19;

    id v21 = [v5 L2FeatureVector];
    [v21 scoreForFeature:2599];
    float v23 = v22;

    float v24 = [v5 L2FeatureVector];
    [v24 scoreForFeature:2629];
    float v26 = v25;

    float v27 = [v5 L2FeatureVector];
    [v27 scoreForFeature:2631];
    float v29 = v28;

    float v30 = [v5 L2FeatureVector];
    [v30 scoreForFeature:2603];
    float v32 = v31;

    float v33 = [v5 L2FeatureVector];
    [v33 scoreForFeature:2633];
    float v35 = v34;

    float v36 = [v5 L2FeatureVector];
    [v36 scoreForFeature:2635];
    float v38 = v37;

    uint64_t v8 = 1;
    *(float *)&double v39 = v50;
    if (v50 <= 0.0
      && v17 <= 0.0
      && v20 <= 0.0
      && v23 <= 0.0
      && v26 <= 0.0
      && v29 <= 0.0
      && v32 <= 0.0
      && v35 <= 0.0
      && v38 <= 0.0)
    {
      if ((objc_msgSend(v5, "bundleIDType", v39) & 2) == 0) {
        goto LABEL_21;
      }
      float v40 = [v5 L2FeatureVector];
      [v40 scoreForFeature:2593];
      float v42 = v41;

      unint64_t v43 = [v5 L2FeatureVector];
      [v43 scoreForFeature:2627];
      float v45 = v44;

      float v46 = [v5 L2FeatureVector];
      [v46 scoreForFeature:2613];
      float v48 = v47;

      uint64_t v8 = 1;
      if (v42 <= 0.0 && v45 <= 0.0 && v48 <= 0.0) {
LABEL_21:
      }
        uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __isUpper5__2_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5__2_upperBit = [v1 integerValue];
}

uint64_t isUpper5__3(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __isUpper5__3_block_invoke;
    block[3] = &unk_1E634C270;
    id v52 = v6;
    if (isUpper5__3_onceToken != -1) {
      dispatch_once(&isUpper5__3_onceToken, block);
    }
    char v9 = isUpper5__3_upperBit;
    unint64_t v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    uint64_t v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0) {
      uint64_t v12 = v11 >> v9;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_21;
    }
    BOOL v13 = [v5 L2FeatureVector];
    [v13 scoreForFeature:2598];
    float v50 = v14;

    unint64_t v15 = [v5 L2FeatureVector];
    [v15 scoreForFeature:2628];
    float v17 = v16;

    uint64_t v18 = [v5 L2FeatureVector];
    [v18 scoreForFeature:2612];
    float v20 = v19;

    id v21 = [v5 L2FeatureVector];
    [v21 scoreForFeature:2600];
    float v23 = v22;

    float v24 = [v5 L2FeatureVector];
    [v24 scoreForFeature:2630];
    float v26 = v25;

    float v27 = [v5 L2FeatureVector];
    [v27 scoreForFeature:2632];
    float v29 = v28;

    float v30 = [v5 L2FeatureVector];
    [v30 scoreForFeature:2604];
    float v32 = v31;

    float v33 = [v5 L2FeatureVector];
    [v33 scoreForFeature:2634];
    float v35 = v34;

    float v36 = [v5 L2FeatureVector];
    [v36 scoreForFeature:2636];
    float v38 = v37;

    uint64_t v8 = 1;
    *(float *)&double v39 = v50;
    if (v50 <= 0.0
      && v17 <= 0.0
      && v20 <= 0.0
      && v23 <= 0.0
      && v26 <= 0.0
      && v29 <= 0.0
      && v32 <= 0.0
      && v35 <= 0.0
      && v38 <= 0.0)
    {
      if ((objc_msgSend(v5, "bundleIDType", v39) & 2) == 0) {
        goto LABEL_21;
      }
      float v40 = [v5 L2FeatureVector];
      [v40 scoreForFeature:2594];
      float v42 = v41;

      unint64_t v43 = [v5 L2FeatureVector];
      [v43 scoreForFeature:2628];
      float v45 = v44;

      float v46 = [v5 L2FeatureVector];
      [v46 scoreForFeature:2614];
      float v48 = v47;

      uint64_t v8 = 1;
      if (v42 <= 0.0 && v45 <= 0.0 && v48 <= 0.0) {
LABEL_21:
      }
        uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __isUpper5__3_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5__3_upperBit = [v1 integerValue];
}

uint64_t isUpper5(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_block_invoke;
  block[3] = &unk_1E634C270;
  id v15 = v4;
  uint64_t v5 = isUpper5_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper5_onceToken, block);
  }
  char v8 = isUpper5_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  unint64_t v11 = v10;

  if ((v8 & 0x40) != 0) {
    unint64_t v12 = v11 >> v8;
  }
  else {
    unint64_t v12 = ((2 * v11) << ~v8) | (v9 >> v8);
  }

  return v12 & 1;
}

void __isUpper5_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5_upperBit = [v1 integerValue];
}

void __isUpper5_c_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCMatch"];
  isUpper5_c_upperBit = [v1 integerValue];
}

uint64_t isUpper5_1(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper5_1_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v16 = v7;
  if (isUpper5_1_onceToken != -1) {
    dispatch_once(&isUpper5_1_onceToken, block);
  }
  char v8 = isUpper5_1_upperBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  uint64_t v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0) {
    uint64_t v11 = v10 >> v8;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t v12 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x10001C00CLL, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    unint64_t v12 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
  }
  if (v12 >= a2) {
    uint64_t v13 = 1;
  }
  else {
LABEL_9:
  }
    uint64_t v13 = 0;

  return v13;
}

void __isUpper5_1_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsTCNearMatch"];
  isUpper5_1_upperBit = [v1 integerValue];
}

uint64_t isUpper6(void *a1, unint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  id v11 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper6_block_invoke;
  block[3] = &unk_1E634C270;
  id v12 = v11;
  id v23 = v12;
  if (isUpper6_onceToken != -1) {
    dispatch_once(&isUpper6_onceToken, block);
  }
  char v13 = isUpper6_upperBit;
  unint64_t v14 = -[PRSRankingItem indexScore]((uint64_t)v9);
  uint64_t v16 = ((2 * v15) << ~v13) | (v14 >> v13);
  if ((v13 & 0x40) != 0) {
    uint64_t v16 = v15 >> v13;
  }
  if ((v16 & 1) == 0) {
    goto LABEL_22;
  }
  unint64_t v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v9, 0x10007C02CLL, a2);
  if (([v9 bundleIDType] & 2) != 0) {
    unint64_t v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
  }
  if (!a2) {
    goto LABEL_22;
  }
  if (a2 != 1)
  {
    if (v17 < a2 - 1) {
      goto LABEL_22;
    }
    unint64_t v19 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v9, 0x10007C02CLL, a2);
    if (([v9 bundleIDType] & 2) != 0) {
      unint64_t v19 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
    }
    if (a3 < 2 || v19 < a2) {
      goto LABEL_22;
    }
LABEL_20:
    if (([v10 isEqualToString:@"co"] & 1) == 0
      && ![v10 isEqualToString:@"com"])
    {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  if (!v17)
  {
    uint64_t v20 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x10000, 1);
    if (a3 < 2 || !v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
LABEL_11:
  uint64_t v18 = 1;
LABEL_23:

  return v18;
}

void __isUpper6_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsDomainTCMatch"];
  isUpper6_upperBit = [v1 integerValue];
}

void __isUpper6_r_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingMostlyExactMultiFieldsDomainTCMatch"];
  isUpper6_r_upperBit = [v1 integerValue];
}

void __isUpper7_0_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPhraseMatchBit"];
  isUpper7_0_policyPhraseBit = [v1 integerValue];
}

uint64_t isUpper7_1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isUpper7_1_block_invoke;
  block[3] = &unk_1E634C270;
  id v15 = v4;
  uint64_t v5 = isUpper7_1_onceToken;
  id v6 = v4;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&isUpper7_1_onceToken, block);
  }
  char v8 = isUpper7_1_prefixBit;
  unint64_t v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  unint64_t v11 = v10;

  if ((v8 & 0x40) != 0) {
    unint64_t v12 = v11 >> v8;
  }
  else {
    unint64_t v12 = ((2 * v11) << ~v8) | (v9 >> v8);
  }

  return v12 & 1;
}

void __isUpper7_1_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch"];
  isUpper7_1_prefixBit = [v1 integerValue];
}

void __isUpper7_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch"];
  isUpper7_prefixBit = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPrefixMatch"];
  isUpper7_policyBit = [v3 integerValue];
}

uint64_t isLowerScore_0(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isLowerScore_0_block_invoke;
  block[3] = &unk_1E634C270;
  id v7 = v6;
  id v22 = v7;
  if (isLowerScore_0_onceToken != -1) {
    dispatch_once(&isLowerScore_0_onceToken, block);
  }
  if ((isLowerScore_0_topBit & 0x40) != 0) {
    unint64_t v8 = -1 << isLowerScore_0_topBit;
  }
  else {
    unint64_t v8 = (-1 << isLowerScore_0_topBit) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)isLowerScore_0_topBit);
  }
  if ((isLowerScore_0_topBit & 0x40) != 0) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1 << isLowerScore_0_topBit;
  }
  char v10 = isLowerScore_0_lowerBit;
  uint64_t v11 = -[PRSRankingItem indexScore]((uint64_t)v5);
  unint64_t v13 = v12 & ~v8;
  uint64_t v14 = v13 >> v10;
  uint64_t v15 = ((2 * v13) << ~v10) | ((v11 & (unint64_t)~v9) >> v10);
  if ((v10 & 0x40) != 0)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v14;
  }
  if (!(v15 | v16)) {
    goto LABEL_22;
  }
  uint64_t v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
  if (([v5 bundleIDType] & 2) != 0) {
    uint64_t v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
  }
  if (!a2) {
    goto LABEL_22;
  }
  if (a2 != 1)
  {
    unint64_t v19 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
    if (([v5 bundleIDType] & 2) != 0) {
      unint64_t v19 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
    }
    if (v19 >= a2) {
      goto LABEL_18;
    }
LABEL_22:
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  if (!v17) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v18 = 1;
LABEL_23:

  return v18;
}

void __isLowerScore_0_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"kMDItemShortcutWithinBagParamValue"];
  isLowerScore_0_topBit = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCNearMatch"];
  isLowerScore_0_lowerBit = [v3 integerValue];
}

void __isLowerScore_c0_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"kMDItemTextContentTokenizedMatch"];
  isLowerScore_c0_bit = [v1 integerValue];
}

void __isLowerScore_c_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKey:@"kMDItemTextContentTokenizedMatch"];
  isLowerScore_c_bit = [v1 integerValue];
}

BOOL isLowerScore(void *a1, unint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  id v11 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __isLowerScore_block_invoke;
  block[3] = &unk_1E634C270;
  id v12 = v11;
  id v37 = v12;
  if (isLowerScore_onceToken[0] != -1) {
    dispatch_once(isLowerScore_onceToken, block);
  }
  if ((isLowerScore_topBit & 0x40) != 0) {
    unint64_t v13 = -1 << isLowerScore_topBit;
  }
  else {
    unint64_t v13 = (-1 << isLowerScore_topBit) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)isLowerScore_topBit);
  }
  if ((isLowerScore_topBit & 0x40) != 0) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1 << isLowerScore_topBit;
  }
  char v15 = isLowerScore_lowerBit;
  uint64_t v16 = -[PRSRankingItem indexScore]((uint64_t)v9);
  unint64_t v18 = v17 & ~v13;
  uint64_t v19 = v18 >> v15;
  uint64_t v20 = ((2 * v18) << ~v15) | ((v16 & (unint64_t)~v14) >> v15);
  if ((v15 & 0x40) != 0)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = v19;
  }
  if (v20 | v21) {
    goto LABEL_26;
  }
  id v22 = [v9 L2FeatureVector];
  [v22 scoreForFeature:278];
  float v24 = v23;

  if (v24 > 0.0 && v24 < 2147500000.0) {
    goto LABEL_26;
  }
  float v25 = [v9 L2FeatureVector];
  [v25 scoreForFeature:1037];
  float v27 = v26;

  if (v27 > 0.0 && v27 < 2147500000.0) {
    goto LABEL_26;
  }
  unint64_t v28 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x10005C02CLL, a2);
  if (([v9 bundleIDType] & 2) != 0) {
    unint64_t v28 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
  }
  if (v28 >= a2
    || isUpper6_r(v9, v29, a3, v10, v12)
    || (isUpper7_0(v9, v30, v12) & 1) != 0
    || (isUpper7_1(v9, v31, v12) & 1) != 0
    || isUpper7(v9, v32, v12)
    || isUpper7_r(v9, a2, a3, v10)
    || isLowerScore_c0(v9, a2, v12))
  {
LABEL_26:
    BOOL v34 = 1;
  }
  else
  {
    BOOL v34 = isLowerScore_c(v9, v33, v12);
  }

  return v34;
}

void __isLowerScore_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"kMDItemShortcutWithinBagParamValue"];
  isLowerScore_topBit = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCNearMatch"];
  isLowerScore_lowerBit = [v3 integerValue];
}

void updateBatch(void *a1, unint64_t *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, double a8)
{
  id v36 = a1;
  id v15 = a5;
  id v35 = a6;
  id v16 = a7;
  if (!a2) {
    goto LABEL_30;
  }
  unint64_t v17 = [v36 count];
  if (*a2 >= v17) {
    goto LABEL_30;
  }
  unint64_t v18 = v17;
  double v19 = (double)a4;
  id v34 = v16;
  while (1)
  {
    uint64_t v20 = objc_msgSend(v36, "objectAtIndex:");
    if (![v15 containsObject:v20]) {
      break;
    }
    ++*a2;
LABEL_26:

    if (*a2 >= v18) {
      goto LABEL_30;
    }
  }
  if (a3)
  {
    uint64_t v21 = [v20 L2FeatureVector];
    [v21 scoreForFeature:a3];
    float v23 = v22;

    if (v23 == 0.0) {
      goto LABEL_29;
    }
LABEL_19:
    uint64_t v31 = SSCompactRankingAttrsGetValue((int8x8_t *)[v20 attributes], 0x51uLL);
    if (v31)
    {
      if ([v35 containsObject:v31])
      {
        ++*a2;
        [v16 addObject:v20];
LABEL_25:

        goto LABEL_26;
      }
      [v15 addObject:v20];
      uint64_t v32 = v35;
      uint64_t v33 = v31;
    }
    else
    {
      uint64_t v32 = v15;
      uint64_t v33 = v20;
    }
    [v32 addObject:v33];
    ++*a2;
    goto LABEL_25;
  }
  if (!a4) {
    goto LABEL_19;
  }
  uint64_t v24 = a4;
  float v25 = SSCompactRankingAttrsGetValue((int8x8_t *)[v20 attributes], 0x17AuLL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    float v26 = SSCompactRankingAttrsGetValue((int8x8_t *)[v20 attributes], 0x17BuLL);

    objc_opt_class();
    float v25 = v26;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
  }
  id v27 = v25;
  if (!v27)
  {
    float v26 = 0;
LABEL_15:
    uint64_t v29 = SSCompactRankingAttrsGetValue((int8x8_t *)[v20 attributes], 0x20uLL);
    unint64_t v28 = 0;
    goto LABEL_16;
  }
  unint64_t v28 = v27;
  uint64_t v29 = [v27 lastObject];
  float v26 = v28;
LABEL_16:
  if (v29)
  {
    [v29 timeIntervalSinceReferenceDate];
    if (v30 - a8 >= v19)
    {

      a4 = v24;
      id v16 = v34;
      goto LABEL_19;
    }
  }

  id v16 = v34;
LABEL_29:

LABEL_30:
}

BOOL hasParsecPolicyPhraseMatch(void *a1, unint64_t a2, int a3)
{
  id v5 = [a1 L2FeatureVector];
  id v6 = v5;
  if (a3) {
    uint64_t v7 = 2100;
  }
  else {
    uint64_t v7 = 2099;
  }
  [v5 scoreForFeature:v7];
  float v9 = v8;

  float v10 = 2147500000.0;
  if (v9 < 2147500000.0 && v9 > 0.0) {
    float v10 = v9;
  }
  float v12 = ((double)a2 + 1.0) / (double)a2;
  return v10 == v12;
}

void sub_1BDC3D208(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    uint64_t v4 = *(void *)(v2 - 304) - 48;
    do
    {
      __destructor_8_s0_s16_s40(v4 + v1);
      v1 -= 48;
    }
    while (v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __destructor_8_s0_s16_s40(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
}

void __getPortraitPeopleQueryWithTimeout_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.searchd.portraitQueue", v2);
  uint64_t v1 = (void *)getPortraitPeopleQueryWithTimeout_portraitQueue;
  getPortraitPeopleQueryWithTimeout_portraitQueue = (uint64_t)v0;
}

void __getPortraitPeopleQueryWithTimeout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = *(id *)(v8 + 32);
  if (getPortraitPeopleQuery_once != -1) {
    dispatch_once(&getPortraitPeopleQuery_once, &__block_literal_global_1372);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F89DE8]);
  [v10 setTargetBundleIdentifier:@"com.apple.Spotlight"];
  [v10 setContext:v9];
  [v10 setOnlyQueryMostRelevantContacts:1];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  uint64_t v14 = (void *)getPortraitPeopleQuery_ppContactStore;
  id v34 = 0;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  unint64_t v28 = __getPortraitPeopleQuery_block_invoke_2;
  uint64_t v29 = &unk_1E635AF90;
  id v15 = v12;
  id v30 = v15;
  id v16 = v11;
  id v31 = v16;
  id v17 = v13;
  id v32 = v17;
  uint64_t v33 = v35;
  [v14 iterRankedContactsWithQuery:v10 error:&v34 block:&v26];
  id v18 = v34;
  bzero(v39, 0x2000uLL);
  uint64_t v19 = *MEMORY[0x1E4F22B18];
  v38[0] = *MEMORY[0x1E4F234A8];
  v38[1] = v19;
  uint64_t v37 = *MEMORY[0x1E4F23230];
  uint64_t v36 = *MEMORY[0x1E4F22A08];
  uint64_t matched = addFieldMatchQuery((uint64_t)v38, 2, v16, v39, 4096, 1);
  uint64_t v21 = addFieldMatchQuery((uint64_t)&v37, 1, v15, &v39[2 * matched], 4096 - matched, matched == 0) + matched;
  uint64_t v22 = addFieldMatchQuery((uint64_t)&v36, 1, v17, &v39[2 * v21], 4096 - v21, v21 == 0) + v21;
  if (v22)
  {
    objc_msgSend(NSString, "stringWithCharacters:length:", v39, v22, v26, v27, v28, v29, v30, v31);
    float v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v23 = @"false";
  }

  _Block_object_dispose(v35, 8);
  uint64_t v24 = *(void *)(*(void *)(v8 + 40) + 8);
  float v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

void sub_1BDC3DA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getPortraitPeopleQuery_block_invoke()
{
  getPortraitPeopleQuery_ppContactStore = (uint64_t)objc_alloc_init(MEMORY[0x1E4F89DF0]);
  return MEMORY[0x1F41817F8]();
}

void __getPortraitPeopleQuery_block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v13 = [a2 contact];
  id v5 = (void *)a1[4];
  id v6 = [v13 phoneNumbers];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = (void *)a1[5];
  uint64_t v8 = [v13 emailAddresses];
  [v7 addObjectsFromArray:v8];

  id v9 = (void *)a1[6];
  id v10 = [v13 socialProfiles];
  [v9 addObjectsFromArray:v10];

  uint64_t v11 = *(void *)(a1[7] + 8);
  unint64_t v12 = *(void *)(v11 + 24) + 1;
  *(void *)(v11 + 24) = v12;
  if (v12 >= 0x41) {
    *a3 = 1;
  }
}

uint64_t addFieldMatchQuery(uint64_t a1, uint64_t a2, void *a3, char *a4, uint64_t a5, char a6)
{
  id v10 = a3;
  uint64_t v31 = objc_msgSend(@"FieldMatch("), "length";
  uint64_t v11 = [v10 count];
  id v35 = a4;
  if (!a2) {
    goto LABEL_30;
  }
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  unint64_t v38 = (unint64_t)&a4[2 * a5 - 2];
  uint64_t v30 = a2;
  unint64_t v14 = 0x1E4F89000uLL;
  do
  {
    id v15 = *(id *)(a1 + 8 * v13);
    uint64_t v16 = [v15 length];
    if (v16) {
      BOOL v17 = v12 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      goto LABEL_27;
    }
    uint64_t v32 = v13;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v34 = v16;
    uint64_t v36 = v15;
    uint64_t v37 = v31 + 1 + v16;
    do
    {
      uint64_t v20 = objc_msgSend(v10, "objectAtIndexedSubscript:", v18, v30);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_24;
      }
      uint64_t v21 = [v20 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v22 = v14;
        uint64_t v23 = [v21 length];
        uint64_t v24 = v23 + 3;
        if (v19)
        {
          if ((unint64_t)&a4[2 * v24] >= v38) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v25 = v37 + v24;
          if (a4 != v35) {
            v25 += 2;
          }
          if ((unint64_t)&a4[2 * v25] >= v38)
          {
            uint64_t v19 = 0;
LABEL_22:
            unint64_t v14 = v22;
            goto LABEL_23;
          }
          if ((a6 & 1) == 0)
          {
            *(_DWORD *)a4 = 8126588;
            a4 += 4;
          }
          objc_msgSend(@"FieldMatch("), "getCharacters:range:", a4, 0, v31;
          uint64_t v26 = &a4[2 * v31];
          objc_msgSend(v36, "getCharacters:range:", v26, 0, v34);
          a4 = &v26[2 * v34];
          a6 = 0;
        }
        *(_DWORD *)a4 = 2228268;
        uint64_t v27 = a4 + 4;
        objc_msgSend(v21, "getCharacters:range:", v27, 0, v23);
        unint64_t v28 = (_WORD *)v27 + v23;
        *unint64_t v28 = 34;
        a4 = (char *)(v28 + 1);
        if (v19 == 20)
        {

          a2 = v30;
          unint64_t v14 = v22;
          uint64_t v13 = v32;
          id v15 = v36;
          goto LABEL_26;
        }
        ++v19;
        goto LABEL_22;
      }
LABEL_23:

LABEL_24:
      ++v18;
    }
    while (v12 != v18);
    a2 = v30;
    uint64_t v13 = v32;
    id v15 = v36;
    if (!v19) {
      goto LABEL_27;
    }
LABEL_26:
    *(_WORD *)a4 = 41;
    a4 += 2;
LABEL_27:

    ++v13;
  }
  while (v13 != a2);
LABEL_30:

  return (a4 - v35) >> 1;
}

__CFString *_rankingMultiPhraseQueryCompositeHelper(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9, char a10, char a11, unsigned __int8 a12, unsigned __int8 a13, uint64_t a14, unsigned __int8 a15)
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v22 = a1;
  id v23 = a2;
  id v24 = a3;
  id v128 = a4;
  id v142 = a5;
  id v25 = a6;
  id v127 = a7;
  id v126 = a8;
  if (![v23 length])
  {
    uint64_t v34 = @"false";
    id v35 = @"cwd";
    uint64_t v36 = @"cwd";
    uint64_t v37 = @"cwd";
    goto LABEL_146;
  }
  uint64_t v26 = [v22 count];
  uint64_t v143 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count") + 1);
  id v134 = v23;
  uint64_t v125 = v25;
  id v122 = v24;
  if ((a14 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v130 = 0;
    uint64_t v133 = 0;
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    uint64_t v29 = 0;
    char v30 = 1;
    char v31 = 1;
LABEL_4:
    uint64_t v32 = v128;
    goto LABEL_5;
  }
  if (a11)
  {
    uint64_t v29 = 0;
    uint64_t v32 = v128;
    if ((a12 | a13) & a11)
    {
      char v30 = 1;
      uint64_t v133 = 0;
      char v31 = 1;
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v130 = 0;
      goto LABEL_5;
    }
    unint64_t v28 = 0;
    uint64_t v27 = 0;
    uint64_t v133 = 0;
  }
  else
  {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
    if (v26 >= 1)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        float v86 = [v22 objectAtIndex:i];
        if (i) {
          [v27 appendString:@" "];
        }
        [v27 appendString:v86];
        [v27 appendString:@"*"];
      }
    }
    uint64_t v133 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
    if (v26 >= 1)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        float v88 = [v22 objectAtIndex:j];
        if (j) {
          [v133 appendString:@"_"];
        }
        [v133 appendString:v88];
        if (v26 - 1 != j) {
          [v133 appendString:@"*"];
        }
      }
    }
    unint64_t v28 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
    if (v26 >= 1)
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        id v90 = [v22 objectAtIndex:k];
        if (k) {
          [v28 appendString:@"."];
        }
        [v28 appendString:v90];
        if (v26 - 1 != k) {
          [v28 appendString:@"*"];
        }
      }
    }
    if ((a12 | a13) & a11)
    {
      uint64_t v130 = 0;
      char v30 = 0;
      uint64_t v29 = 0;
      char v31 = 1;
      goto LABEL_4;
    }
    uint64_t v32 = v128;
  }
  if (a12 && (a13 & 1) != 0)
  {
    uint64_t v130 = 0;
    char v31 = 0;
    uint64_t v29 = 0;
    char v30 = a11;
  }
  else
  {
    float v95 = v27;
    long long v96 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
    if (v26 >= 1)
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        float v98 = [v22 objectAtIndex:m];
        if (m) {
          [v96 appendString:@"_"];
        }
        [v96 appendString:v98];
      }
    }
    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
    uint64_t v130 = v96;
    if (v26 >= 1)
    {
      for (uint64_t n = 0; n != v26; ++n)
      {
        float v100 = [v22 objectAtIndex:n];
        if (n) {
          [v29 appendString:@"."];
        }
        [v29 appendString:v100];
      }
    }
    char v31 = 0;
    uint64_t v32 = v128;
    uint64_t v27 = v95;
    char v30 = a11;
  }
LABEL_5:
  uint64_t v129 = v29;
  uint64_t v132 = v28;
  uint64_t v136 = v27;
  id v121 = v22;
  if (a10)
  {
    uint64_t v33 = @"cwd";
  }
  else
  {
    objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c", 116);
    uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v123 = [v32 count];
  uint64_t v124 = [v127 count];
  unint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  obuint64_t j = v24;
  uint64_t v135 = v33;
  double v39 = v134;
  uint64_t v139 = v38;
  uint64_t v144 = [obj countByEnumeratingWithState:&v150 objects:v155 count:16];
  if (v144)
  {
    char v120 = v30;
    uint64_t v40 = 0;
    int v41 = a15;
    if (v124) {
      int v41 = 0;
    }
    uint64_t v42 = *(void *)v151;
    if (v123) {
      int v43 = v41;
    }
    else {
      int v43 = 1;
    }
    if (v26 <= 1) {
      int v43 = 0;
    }
    int v131 = v43;
    uint64_t v138 = *(void *)v151;
    char v137 = v31;
    while (1)
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v151 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v150 + 1) + 8 * v44);
        if (v31)
        {
          BOOL v46 = addEndChar(*(void **)(*((void *)&v150 + 1) + 8 * v44), v39);
LABEL_26:
          if (v46)
          {
            float v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            float v48 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v45, v39, v33];
            [v47 addObject:v48];

            float v49 = [NSString stringWithFormat:@"(%@=\"%@.*\"%@)", v45, v39, @"cd"];
            [v47 addObject:v49];

            char v31 = v137;
            [NSString stringWithFormat:@"(%@=\"%@_*\"%@)", v45, v39, @"cd"];
            id v56 = LABEL_36:;
            [v47 addObject:v56];

            uint64_t v57 = NSString;
            uint64_t v42 = v138;
            uint64_t v58 = [v47 componentsJoinedByString:@" || "];
            uint64_t v59 = [v57 stringWithFormat:@"(%@)", v58];

            uint64_t v40 = (void *)v59;
            unint64_t v38 = v139;
            goto LABEL_39;
          }
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v45, v39, v33];
          goto LABEL_38;
        }
        if ((a11 & 1) == 0)
        {
          if (addEndChar(*(void **)(*((void *)&v150 + 1) + 8 * v44), v136))
          {
            float v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            float v53 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v45, v133, v33];
            [v47 addObject:v53];

            uint64_t v54 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v45, v132, v33];
            [v47 addObject:v54];

            double v39 = v134;
            uint64_t v55 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v45, v133, @"cd"];
            [v47 addObject:v55];

            char v31 = v137;
            uint64_t v33 = v135;
            [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v45, v132, @"cd"];
            goto LABEL_36;
          }
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v45, v136, v33];
          goto LABEL_38;
        }
        BOOL v46 = addEndChar(*(void **)(*((void *)&v150 + 1) + 8 * v44), v39);
        if ((a12 & a13 & 1) != 0 || !v131) {
          goto LABEL_26;
        }
        if (v46)
        {
          float v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
          float v50 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v45, v130, v33];
          [v47 addObject:v50];

          id v51 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v45, v129, v135];
          [v47 addObject:v51];

          uint64_t v33 = v135;
          id v52 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v45, v130, @"cd"];
          [v47 addObject:v52];

          char v31 = v137;
          double v39 = v134;
          [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v45, v129, @"cd"];
          goto LABEL_36;
        }
        [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v45, v39, v33];
LABEL_38:
        uint64_t v40 = v47 = v40;
LABEL_39:

        [v38 addObject:v40];
        ++v44;
      }
      while (v144 != v44);
      uint64_t v60 = [obj countByEnumeratingWithState:&v150 objects:v155 count:16];
      uint64_t v144 = v60;
      if (!v60)
      {

        uint64_t v32 = v128;
        char v30 = v120;
        break;
      }
    }
  }

  unint64_t v61 = [v38 count];
  uint64_t v62 = NSString;
  if (v61 < 2)
  {
    uint64_t v63 = [v38 firstObject];
    [v62 stringWithFormat:@"%@", v63];
  }
  else
  {
    uint64_t v63 = [v38 componentsJoinedByString:@" || "];
    [v62 stringWithFormat:@"(%@)", v63];
  }
  id obja = (id)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    uint64_t v64 = 0;
  }
  else
  {
    uint64_t v64 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v142, "length") + v123);
    if (v123 >= 1)
    {
      for (iuint64_t i = 0; ii != v123; ++ii)
      {
        uint64_t v66 = [v32 objectAtIndex:ii];
        if (ii) {
          [v64 appendString:@" "];
        }
        [v64 appendString:v66];
        [v64 appendString:@"*"];
      }
    }
  }
  uint64_t v145 = v64;
  if (a10)
  {
    uint64_t v36 = @"cwd";
  }
  else
  {
    objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c", 116);
    uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v67 = v125;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v146 objects:v154 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v147;
    do
    {
      for (juint64_t j = 0; jj != v69; ++jj)
      {
        if (*(void *)v147 != v70) {
          objc_enumerationMutation(v67);
        }
        uint64_t v72 = *(void *)(*((void *)&v146 + 1) + 8 * jj);
        if (v31)
        {
LABEL_63:
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v72, v142, v36];
          goto LABEL_68;
        }
        if (a11)
        {
          if (a12 & a13) {
            goto LABEL_63;
          }
          [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v72, v142, v36];
        }
        else
        {
          [NSString stringWithFormat:@"(%@=\"%@\"%@)", v72, v64, v36];
        }
        float v73 = LABEL_68:;
        [v143 addObject:v73];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v146 objects:v154 count:16];
    }
    while (v69);
  }

  if (a15 && v124 > 1)
  {
    float v74 = v143;
    if (a9)
    {
      uint64_t v75 = 110;
      if (a10) {
        uint64_t v75 = 111;
      }
      objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c(%d)", v75, a9);
      float v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v31) {
        goto LABEL_76;
      }
    }
    else
    {
      float v76 = @"cwd";
      if (v31)
      {
LABEL_76:
        id v77 = v126;
        uint64_t v78 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v126, v76];
        float v79 = v78;
        goto LABEL_77;
      }
    }
    if (a11)
    {
      id v25 = v125;
      if (a12 && (a13 & 1) != 0)
      {
        long long v93 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v126, v76];
        ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v93, v143, v93, 0);
        float v80 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v126, v76];

        ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v94, v143, v80, 1);
      }
      else
      {
        float v114 = [v127 lastObject];
        if ((unint64_t)[v114 length] <= 1 || v114 == 0) {
          float v116 = @"(%@=\"%@\"%@)";
        }
        else {
          float v116 = @"(%@=\"%@*\"%@)";
        }
        float v117 = objc_msgSend(NSString, "stringWithFormat:", v116, *MEMORY[0x1E4F235F8], v126, v76);
        ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v117, v143, v117, 0);
        ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v118, v143, v117, 0);
        float v80 = objc_msgSend(NSString, "stringWithFormat:", v116, @"_kMDItemOCRContentLevel1", v126, v76);

        ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v119, v143, v80, 1);
        float v74 = v143;
      }
LABEL_138:

      id v35 = v76;
      id v23 = v134;
      if ((unint64_t)[v74 count] < 2)
      {
        uint64_t v111 = [v74 count];
        uint64_t v112 = NSString;
        if (v111 != 1)
        {
          uint64_t v84 = obja;
          uint64_t v34 = [NSString stringWithFormat:@"(%@ && %@)", obja, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
          goto LABEL_144;
        }
        float v110 = [v74 componentsJoinedByString:@" || "];
        uint64_t v84 = obja;
        [v112 stringWithFormat:@"(%@ && %@ && %@)", obja, v110, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
      }
      else
      {
        float v109 = NSString;
        float v110 = [v74 componentsJoinedByString:@" || "];
        uint64_t v84 = obja;
        [v109 stringWithFormat:@"(%@ && (%@) && %@)", obja, v110, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
      }
      uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_144:
      id v22 = v121;
      id v24 = v122;
      goto LABEL_145;
    }
    float v101 = v76;
    float v80 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(0, "length"));
    for (kuint64_t k = 0; kk != v124; ++kk)
    {
      float v103 = [v127 objectAtIndex:kk];
      unint64_t v104 = [v103 length];
      if (kk) {
        [v80 appendString:@" "];
      }
      [v80 appendString:v103];
      if (v104 > 2 || v124 - 1 == kk && v104 == 2) {
        [v80 appendString:@"*"];
      }
    }
    uint64_t v105 = *MEMORY[0x1E4F235F8];
    float v76 = v101;
    if (v80)
    {
      float v106 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v105, v80, v101];
      float v74 = v143;
      ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v106, v143, v106, 0);
      float v107 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v80, v76];

      ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v108, v143, v107, 1);
      goto LABEL_137;
    }
    id v77 = v126;
    uint64_t v78 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v105, v126, v101];
    float v79 = v78;
    float v74 = v143;
LABEL_77:
    ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v78, v74, v78, 0);
    float v80 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v77, v76];

    ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v81, v74, v80, 1);
LABEL_137:
    id v25 = v125;
    goto LABEL_138;
  }
  float v74 = v143;
  id v23 = v134;
  if ((unint64_t)[v143 count] < 2)
  {
    uint64_t v91 = [v143 count];
    float v92 = NSString;
    uint64_t v84 = obja;
    if (v91 != 1)
    {
      uint64_t v34 = [NSString stringWithFormat:@"(%@ && %@)", obja, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
      goto LABEL_115;
    }
    float v83 = [v143 componentsJoinedByString:@" || "];
    [v92 stringWithFormat:@"(%@ && %@ && %@)", obja, v83, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  else
  {
    float v82 = NSString;
    float v83 = [v143 componentsJoinedByString:@" || "];
    uint64_t v84 = obja;
    [v82 stringWithFormat:@"(%@ && (%@) && %@)", obja, v83, @"!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"];
  }
  uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_115:
  id v35 = @"cwd";
  id v22 = v121;
  id v24 = v122;
  id v25 = v125;
LABEL_145:

  uint64_t v37 = v135;
LABEL_146:

  return v34;
}

void ___rankingMultiPhraseQueryCompositeHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v5 = NSString;
  uint64_t v6 = *MEMORY[0x1E4F22B50];
  if (a4)
  {
    uint64_t v7 = *MEMORY[0x1E4F23268];
    id v8 = a3;
    id v9 = a2;
    [v5 stringWithFormat:@"(%@==\"%@\" || %@>0)", v6, @"com.apple.mobileslideshow", v7];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [NSString stringWithFormat:@"(%@ && %@)", v8, v13];

    [v9 addObject:v10];
  }
  else
  {
    id v11 = a3;
    id v12 = a2;
    id v13 = [v5 stringWithFormat:@"(!FieldMatch(%@,%@))", v6, @"com.apple.mobileslideshow"];
    id v10 = [NSString stringWithFormat:@"(!%@>0)", *MEMORY[0x1E4F22D40]];
    id v9 = [NSString stringWithFormat:@"(%@ && %@ && %@)", v11, v13, v10];

    [v12 addObject:v9];
  }
}

__CFString *_rankingMultiFieldsTCNearQuery(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, char a7, char a8, uint64_t a9, char a10, char a11)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v18 = a1;
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = v18;
  id v24 = v19;
  id v25 = v23;
  id v26 = v24;
  id v98 = v20;
  id v27 = v21;
  id v87 = v22;
  id v90 = v26;
  uint64_t v91 = v25;
  float v85 = v27;
  if ([v25 count])
  {
    float v89 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
    float v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
    float v86 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v28 = [v27 count];
    *(void *)&long long v88 = v28;
    if (a6)
    {
      uint64_t v84 = @"cwd";
      if (v28 >= 2)
      {
        if (a6 == 255) {
          [@"cwd" stringByAppendingString:@"t"];
        }
        else {
          objc_msgSend(@"cwd", "stringByAppendingFormat:", @"%c(%d)", 110, a6);
        }
        uint64_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v84 = @"cwd";
    }
    *((void *)&v88 + 1) = [v25 count];
    if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      char v31 = 1;
    }
    else {
      char v31 = a8;
    }
    float v100 = [v98 allKeys];
    char v32 = v31 | a7;
    uint64_t v94 = *((void *)&v88 + 1) - 1;
    if (*((uint64_t *)&v88 + 1) >= 1)
    {
      uint64_t v95 = 0;
      char v97 = a7 & a8;
      uint64_t v96 = *MEMORY[0x1E4F22B50];
      uint64_t v92 = *MEMORY[0x1E4F233C8];
      do
      {
        [v101 removeAllObjects];
        uint64_t v33 = [v91 objectAtIndex:v95];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        obuint64_t j = v90;
        uint64_t v34 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
        if (!v34) {
          goto LABEL_68;
        }
        uint64_t v35 = *(void *)v106;
        BOOL v37 = v95 == v94 && (void)v88 == 0;
        BOOL v93 = v37;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v106 != v35) {
              objc_enumerationMutation(obj);
            }
            double v39 = *(void **)(*((void *)&v105 + 1) + 8 * i);
            if ([v100 containsObject:v39])
            {
              uint64_t v40 = [v98 valueForKey:v39];
              if ([v40 count])
              {
                int v41 = NSString;
                uint64_t v42 = [v40 componentsJoinedByString:@","];
                int v43 = [v41 stringWithFormat:@"(!FieldMatch(%@,%@))", v96, v42];
              }
              else
              {
                int v43 = 0;
              }
            }
            else
            {
              int v43 = 0;
            }
            if (v32)
            {
              if (a11 || !addEndChar(v39, v33)) {
                goto LABEL_52;
              }
LABEL_39:
              uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
              uint64_t v45 = [NSString stringWithFormat:@"(%@=\"%@@\"%@)", v39, v33, @"cwd"];
              [v44 addObject:v45];

              BOOL v46 = [NSString stringWithFormat:@"(%@=\"%@.*\"%@)", v39, v33, @"cd"];
              [v44 addObject:v46];

              float v47 = [NSString stringWithFormat:@"(%@=\"%@_*\"%@)", v39, v33, @"cd"];
              [v44 addObject:v47];

              float v48 = NSString;
              float v49 = [v44 componentsJoinedByString:@" || "];
              float v50 = [v48 stringWithFormat:@"(%@)", v49];

              goto LABEL_40;
            }
            if (v97)
            {
              if (a11 || !addEndChar(v39, v33)) {
                goto LABEL_52;
              }
              goto LABEL_39;
            }
            if (a10)
            {
              if (!v93 || ([v39 isEqualToString:v92] & 1) != 0) {
                goto LABEL_51;
              }
              if (a11 || !addEndChar(v39, v33)) {
                goto LABEL_63;
              }
            }
            else
            {
              if (v95 != v94 || ([v39 isEqualToString:v92] & 1) != 0)
              {
LABEL_51:
                if (a11 || !addEndChar(v39, v33))
                {
LABEL_52:
                  uint64_t v51 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", v39, v33, @"cwd"];
                  goto LABEL_64;
                }
                goto LABEL_39;
              }
              if (a11 || !addEndChar(v39, v33))
              {
LABEL_63:
                uint64_t v51 = [NSString stringWithFormat:@"(%@=\"%@*\"%@)", v39, v33, @"cwd"];
LABEL_64:
                float v50 = (void *)v51;
                if (!v43) {
                  goto LABEL_66;
                }
LABEL_65:
                uint64_t v58 = [NSString stringWithFormat:@"(%@ && %@)", v50, v43];

                float v50 = (void *)v58;
                goto LABEL_66;
              }
            }
            id v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            float v53 = [NSString stringWithFormat:@"(%@=\"%@*@\"%@)", v39, v33, @"cwd"];
            [v52 addObject:v53];

            uint64_t v54 = [NSString stringWithFormat:@"(%@=\"%@*.*\"%@)", v39, v33, @"cd"];
            [v52 addObject:v54];

            uint64_t v55 = [NSString stringWithFormat:@"(%@=\"%@*_*\"%@)", v39, v33, @"cd"];
            [v52 addObject:v55];

            id v56 = NSString;
            uint64_t v57 = [v52 componentsJoinedByString:@" || "];
            float v50 = [v56 stringWithFormat:@"(%@)", v57];

LABEL_40:
            if (v43) {
              goto LABEL_65;
            }
LABEL_66:
            [v101 addObject:v50];
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
        }
        while (v34);
LABEL_68:

        if ((unint64_t)[v101 count] < 2)
        {
          unint64_t v61 = [v101 firstObject];
        }
        else
        {
          uint64_t v59 = NSString;
          uint64_t v60 = [v101 componentsJoinedByString:@" || "];
          unint64_t v61 = [v59 stringWithFormat:@"(%@)", v60];
        }
        [v89 addObject:v61];

        ++v95;
      }
      while (v95 != *((void *)&v88 + 1));
    }
    v103[0] = 0;
    v103[1] = v103;
    v103[2] = 0x2020000000;
    char v104 = 0;
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = ___rankingMultiFieldsTCNearQueryHelper_block_invoke;
    v102[3] = &unk_1E635AFB8;
    v102[4] = v103;
    uint64_t v62 = (void (**)(void, void, void, void))MEMORY[0x1C1885400](v102);
    if (!(void)v88)
    {
LABEL_101:
      if ((unint64_t)[v86 count] < 2)
      {
        if ([v86 count] != 1)
        {
          id v77 = 0;
LABEL_108:
          unint64_t v78 = [v89 count];
          float v79 = NSString;
          if (v78 < 2)
          {
            float v80 = [v89 firstObject];
            [v79 stringWithFormat:@"%@", v80];
          }
          else
          {
            float v80 = [v89 componentsJoinedByString:@" && "];
            [v79 stringWithFormat:@"(%@)", v80];
          uint64_t v81 = };

          if (v88 == 0)
          {
            uint64_t v29 = @"false";
          }
          else
          {
            if (*((void *)&v88 + 1)) {
              float v82 = v81;
            }
            else {
              float v82 = v77;
            }
            uint64_t v29 = v82;
          }

          _Block_object_dispose(v103, 8);
          char v30 = v84;
          goto LABEL_118;
        }
        float v76 = NSString;
        float v74 = [v86 firstObject];
        uint64_t v75 = [v76 stringWithFormat:@"%@", v74];
      }
      else
      {
        float v73 = NSString;
        float v74 = [v86 componentsJoinedByString:@" || "];
        uint64_t v75 = [v73 stringWithFormat:@"(%@)", v74];
      }
      id v77 = (void *)v75;

      if (v77) {
        [v89 addObject:v77];
      }
      goto LABEL_108;
    }
    if (v32)
    {
      uint64_t v63 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", *MEMORY[0x1E4F235F8], v87, v84];
      ((void (**)(void, void *, void *, void))v62)[2](v62, v86, v63, 0);
      uint64_t v64 = [NSString stringWithFormat:@"(%@=\"%@\"%@)", @"_kMDItemOCRContentLevel1", v87, v84];

      ((void (**)(void, void *, void *, uint64_t))v62)[2](v62, v86, v64, 1);
LABEL_100:

      goto LABEL_101;
    }
    uint64_t v65 = [v85 lastObject];
    unint64_t v66 = [v65 length];
    unint64_t v67 = v66;
    if (a10)
    {
      BOOL v68 = (uint64_t)v88 > 1;
      uint64_t v69 = @"(%@=\"%@*\"%@)";
      if (v66 != 2) {
        BOOL v68 = 0;
      }
      if (v66 > 2 || v68)
      {
LABEL_87:
        uint64_t v70 = objc_msgSend(NSString, "stringWithFormat:", v69, *MEMORY[0x1E4F235F8], v87, v84);
        ((void (**)(void, void *, void *, void))v62)[2](v62, v86, v70, 0);
        if (a10)
        {
          BOOL v71 = (uint64_t)v88 > 1;
          uint64_t v72 = @"(%@=\"%@*\"%@)";
          if (v67 != 2) {
            BOOL v71 = 0;
          }
          if (v67 > 2 || v71) {
            goto LABEL_99;
          }
        }
        else if ((v67 > 2 || (uint64_t)v88 >= 2 && v67 == 2) && !*((void *)&v88 + 1))
        {
          uint64_t v72 = @"(%@=\"%@*\"%@)";
          goto LABEL_99;
        }
        uint64_t v72 = @"(%@=\"%@\"%@)";
LABEL_99:
        uint64_t v64 = objc_msgSend(NSString, "stringWithFormat:", v72, @"_kMDItemOCRContentLevel1", v87, v84);

        ((void (**)(void, void *, void *, uint64_t))v62)[2](v62, v86, v64, 1);
        goto LABEL_100;
      }
    }
    else if ((v66 > 2 || (uint64_t)v88 >= 2 && v66 == 2) && !*((void *)&v88 + 1))
    {
      uint64_t v69 = @"(%@=\"%@*\"%@)";
      goto LABEL_87;
    }
    uint64_t v69 = @"(%@=\"%@\"%@)";
    goto LABEL_87;
  }
  uint64_t v29 = @"false";
  char v30 = @"cwd";
LABEL_118:

  return v29;
}

void sub_1BDC40248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void ___rankingMultiFieldsTCNearQueryHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v11 = a2;
  id v7 = a3;
  if (a4)
  {
    id v8 = [NSString stringWithFormat:@"(%@==\"%@\" || %@>0)", *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268]];
    id v9 = [NSString stringWithFormat:@"(%@ && %@)", v7, v8];
    [v11 addObject:v9];
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      goto LABEL_6;
    }
    id v8 = [NSString stringWithFormat:@"(!FieldMatch(%@,%@))", *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow"];
    id v9 = [NSString stringWithFormat:@"(!%@>0)", *MEMORY[0x1E4F22D40]];
    id v10 = [NSString stringWithFormat:@"(%@ && %@ && %@)", v7, v8, v9];
    [v11 addObject:v10];
  }
LABEL_6:
}

void ___rankingTCNearQueryHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v11 = a2;
  id v7 = a3;
  if (a4)
  {
    id v8 = [NSString stringWithFormat:@"(%@==\"%@\" || %@>0)", *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow", *MEMORY[0x1E4F23268]];
    id v9 = [NSString stringWithFormat:@"(%@ && %@)", v7, v8];
    [v11 addObject:v9];
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      goto LABEL_6;
    }
    id v8 = [NSString stringWithFormat:@"(!FieldMatch(%@,%@))", *MEMORY[0x1E4F22B50], @"com.apple.mobileslideshow"];
    id v9 = [NSString stringWithFormat:@"(!%@>0)", *MEMORY[0x1E4F22D40]];
    id v10 = [NSString stringWithFormat:@"(%@ && %@ && %@)", v7, v8, v9];
    [v11 addObject:v10];
  }
LABEL_6:
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke_1()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking_1 = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_1 = result;
  return result;
}

uint64_t NextTermResultCompare(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 16);
  id v5 = *(id *)(a2 + 16);
  if (![v4 type] && objc_msgSend(v5, "type") == 1) {
    goto LABEL_6;
  }
  if (![v5 type] && objc_msgSend(v4, "type") == 1) {
    goto LABEL_10;
  }
  [v4 distance];
  double v7 = v6;
  [v5 distance];
  if (v7 >= v8)
  {
    [v4 distance];
    double v11 = v10;
    [v5 distance];
    if (v11 <= v12)
    {
      unint64_t v13 = [v4 position];
      if (v13 < [v5 position]) {
        goto LABEL_6;
      }
      unint64_t v14 = [v4 position];
      if (v14 <= [v5 position])
      {
        uint64_t v16 = *(void **)(a1 + 40);
        BOOL v17 = [v4 neighbor];
        if ([v16 hasPrefix:v17])
        {
          id v18 = *(void **)(a2 + 40);
          id v19 = [v5 neighbor];
          LODWORD(v1_Block_object_dispose(&STACK[0x468], 8) = [v18 hasPrefix:v19];

          if (!v18) {
            goto LABEL_6;
          }
        }
        else
        {
        }
        id v20 = *(void **)(a1 + 40);
        id v21 = [v4 neighbor];
        if ([v20 hasPrefix:v21])
        {
        }
        else
        {
          id v22 = *(void **)(a2 + 40);
          id v23 = [v5 neighbor];
          LOBYTE(v22) = [v22 hasPrefix:v23];

          if (v22) {
            goto LABEL_10;
          }
        }
        unint64_t v24 = *(void *)(a1 + 32);
        unint64_t v25 = *(void *)(a2 + 32);
        if (v24 <= v25)
        {
          uint64_t v9 = v24 < v25;
          goto LABEL_11;
        }
        goto LABEL_6;
      }
    }
LABEL_10:
    uint64_t v9 = 1;
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v9 = -1;
LABEL_11:

  return v9;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id spotlightSuggestionWithCurrentSuggestion(void *a1, void *a2, uint64_t a3)
{
  v19[21] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a2;
  id v7 = a1;
  double v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v19[0] = v8;
  v19[1] = &unk_1F1863F98;
  v19[2] = &unk_1F1863FB0;
  v19[3] = &unk_1F1863F98;
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v19[4] = v9;
  void v19[5] = &unk_1F1863FC8;
  v19[6] = &unk_1F1863FC8;
  v19[7] = &unk_1F1864230;
  v19[8] = &unk_1F1864230;
  v19[9] = &unk_1F1864230;
  v19[10] = &unk_1F1864230;
  v19[11] = &unk_1F1864240;
  v19[12] = &unk_1F1864230;
  v19[13] = &unk_1F1864230;
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v19[14] = v10;
  v19[15] = &unk_1F1863FC8;
  v19[16] = MEMORY[0x1E4F1CC28];
  v19[17] = MEMORY[0x1E4F1CC38];
  v19[18] = MEMORY[0x1E4F1CC38];
  v19[19] = MEMORY[0x1E4F1CC38];
  v19[20] = &unk_1F1863FC8;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:21];

  if (isMacOS())
  {
    double v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v12 = SSBundlesDonatingPhotos();
  }
  unint64_t v13 = (void *)MEMORY[0x1E4F23870];
  BOOL v17 = @"photosBundleIDs";
  id v18 = v12;
  unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v15 = [v13 suggestionWithCurrentSuggestion:v7 userQueryString:v6 completion:v6 attributes:MEMORY[0x1E4F1CBF0] scores:v11 options:v14];

  return v15;
}

void sub_1BDC47ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BDC48BE8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1BDC494D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1BDC49678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, uint64_t a11)
{
  *(_OWORD *)uint64_t v11 = a9;
  *(_OWORD *)(v11 + 16) = a10;
  *(void *)(v11 + 32) = a11;
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1BDC4B3F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

id SSMarketplaceKitUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SSMarketplaceKitUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SSMarketplaceKitUtilities()
{
  return self;
}

id SSMarketplaceKitUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SSMarketplaceKitUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SSMarketplaceKitUtilities);
}

uint64_t dispatch thunk of static SSMarketplaceKitUtilities.distributorPriorityList()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SSMarketplaceKitUtilities.distributorPriorityListChangedNotifationName()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void allocateTemporaryFileOfSize_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "Error in opening temporary file.\n", v2, v3, v4, v5, v6);
}

void allocateTemporaryFileOfSize_cold_2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1BDB2A000, a1, OS_LOG_TYPE_ERROR, "Serious error in writing temporary file. %d\n", (uint8_t *)v3, 8u);
}

void __loadRankingThresholdingParameters_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  int v2 = @"rankingConfig.plist";
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "[SpotlightRanking] [SearchTool] Config file %@ with thresholding parameters for ranking not found. Using default values.", (uint8_t *)&v1, 0xCu);
}

void __loadRankingThresholdingParameters_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [SearchTool] Ranking thresholding parameters loaded: %@", (uint8_t *)&v2, 0xCu);
}

void openbyid_cold_1()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BDB2A000, v1, v2, "openbyid_np failed, errno:%d(%s)", v3, v4, v5, v6, v7);
}

void __device_id_block_invoke_cold_1()
{
  __assert_rtn("device_id_block_invoke", "NSURL+SPAdditions.m", 32, "stat(path, &st) == 0 && \"could not get device ID\"");
}

void SSQueryParseResultsForQueryString_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[SSQueryParser][POMMES][qid=%ld] failed to get any query embedding", v2, v3, v4, v5, v6);
}

void SSQueryParseResultsForQueryString_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1BDB2A000, v1, OS_LOG_TYPE_ERROR, "[SSQueryParser][POMMES][qid=%ld] disabling text semantic search, FeatureFlag: %@", v2, 0x16u);
}

void SSQueryParseResultsForQueryString_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[SSQueryParser][POMMES][qid=%ld] failed to get any text query embedding", v2, v3, v4, v5, v6);
}

void SSQueryParseResultsForQueryString_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1BDB2A000, v0, OS_LOG_TYPE_DEBUG, "[SSQueryParser][POMMES][qid=%ld] semanticQuery, using <%@>", v1, 0x16u);
}

void SSQueryParseResultsForQueryString_cold_5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[SSQueryParser][POMMES][qid=%ld] failed to get any photo query embedding", v2, v3, v4, v5, v6);
}

void SSQueryParseResultsForQueryString_cold_6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[SSQueryParser][POMMES][qid=%ld] failed to deserialize photo query _CSEmbedding", v2, v3, v4, v5, v6);
}

void SSQueryParseResultsForQueryString_cold_7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_1BDB2A000, v0, OS_LOG_TYPE_ERROR, "[SSQueryParser][POMMES][qid=%ld] failed to deserialize the embedding data dictionary with error: %@", v1, 0x16u);
}

void SSAppNameForBundleId_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "Error getting appName for bundleId:%@ with error:%@", (uint8_t *)&v3, 0x16u);
}

void SSPriorityIndexFastPathEnabled_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1BDB2A000, v0, OS_LOG_TYPE_ERROR, "Error retrieving %@ value: %@", (uint8_t *)v1, 0x16u);
}

void SSPriorityIndexLimitBundles_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1BDB2A000, v0, OS_LOG_TYPE_ERROR, "Error retrieving %@ value: %@", (uint8_t *)v1, 0x16u);
}

void SSPriorityIndexDelayMilliseconds_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "Error retrieving PriorityIndexDelayMilliseconds value: %@", (uint8_t *)&v2, 0xCu);
}

void SSIsCounterFactual_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "Error retrieving IsCounterFactual value: %@", (uint8_t *)&v2, 0xCu);
}

void SSCompactRankingAttrsCopy_cold_1()
{
}

void SSCompactRankingAttrsAddFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddFloat", "SSCompactRankingAttrsData.m", 368, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsAddInt64Array_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt64Array", "SSCompactRankingAttrsData.m", 379, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsAddInt64ArrayFromNSArray_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt64ArrayFromNSArray", "SSCompactRankingAttrsData.m", 394, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsAddInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt128", "SSCompactRankingAttrsData.m", 416, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsUpdateFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateFloat", "SSCompactRankingAttrsData.m", 455, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsUpdateInt64Array_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt64Array", "SSCompactRankingAttrsData.m", 466, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsUpdateInt64ArrayFromNSArray_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt64ArrayFromNSArray", "SSCompactRankingAttrsData.m", 483, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsUpdateInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt128", "SSCompactRankingAttrsData.m", 506, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsGetFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetFloat", "SSCompactRankingAttrsData.m", 546, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsGetInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetInt128", "SSCompactRankingAttrsData.m", 559, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsGetArrayInt64_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetArrayInt64", "SSCompactRankingAttrsData.m", 572, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void shouldUpdateCrossAttributeFeature_cold_1()
{
}

void countsArrayComparator_block_invoke_4_cold_1()
{
  __assert_rtn("countsArrayComparator_block_invoke_4", "PRSRankingItem.m", 5833, "array1.count == 8 && array1.count == 8");
}

void shouldUpdateFuncForSnippetFeature_cold_1()
{
}

void associatedResultSetL2FeatureFromSnippetFeature_cold_1()
{
}

void associatedL2FeatureFromSnippetFeature_cold_1()
{
}

void defaultValueForResultSetSnippetFeature_cold_1()
{
}

uint64_t sub_1BDC4F950()
{
  return MEMORY[0x1F40ECF10]();
}

uint64_t sub_1BDC4F960()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

void CFBinaryHeapApplyFunction(CFBinaryHeapRef heap, CFBinaryHeapApplierFunction applier, void *context)
{
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x1F40D7368](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1F40D7370](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1F40D7378](heap);
}

CFIndex CFBinaryHeapGetCountOfValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x1F40D7380](heap, value);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1F40D7388](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

uint64_t CS_simplifyItemArray()
{
  return MEMORY[0x1F40DEF18]();
}

uint64_t DDResultGetShipmentTrackingUrlString()
{
  return MEMORY[0x1F4117258]();
}

uint64_t DDResultHasProperties()
{
  return MEMORY[0x1F4117288]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1F41172A0]();
}

uint64_t DDResultIsValidPhoneNumber()
{
  return MEMORY[0x1F41172A8]();
}

uint64_t DMGetPreviousBuildVersion()
{
  return MEMORY[0x1F41173C0]();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1F4116E60]();
}

uint64_t GEOUsageSearchFoundationFeedbackDataForMapsData()
{
  return MEMORY[0x1F411C440]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1F411BB40]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

uint64_t MDRetrieveBestAvailableLanguage()
{
  return MEMORY[0x1F412F070]();
}

uint64_t MDTokenizerCreate()
{
  return MEMORY[0x1F412F078]();
}

uint64_t MDTokenizerDispose()
{
  return MEMORY[0x1F412F080]();
}

uint64_t MDTokenizerGetTokens()
{
  return MEMORY[0x1F412F098]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t PFSceneTaxonomyNodeVisitDetectors()
{
  return MEMORY[0x1F4140808]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1F415C308]();
}

uint64_t SILanguageModelCreateWithOptions()
{
  return MEMORY[0x1F415BA20]();
}

uint64_t SILanguageModelIsContentTokenInString()
{
  return MEMORY[0x1F415BA48]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1F4116EB0]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x1F4163A30]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x1F4163A88]();
}

uint64_t WFTopHitContextualActionTypeForBundleIdentifier()
{
  return MEMORY[0x1F41680B8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x1F40D56A0]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1F40D9260]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1F40D9350]();
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x1F412F120]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x1F412F128]();
}

uint64_t _MDPlistBooleanGetValue()
{
  return MEMORY[0x1F412F138]();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return MEMORY[0x1F412F1D8]();
}

uint64_t _MDPlistBytesCreateTrusted()
{
  return MEMORY[0x1F412F208]();
}

uint64_t _MDPlistContainerAddCString()
{
  return MEMORY[0x1F412F240]();
}

uint64_t _MDPlistContainerAddDoubleValue()
{
  return MEMORY[0x1F412F258]();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return MEMORY[0x1F412F288]();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return MEMORY[0x1F412F290]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x1F412F2A0]();
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return MEMORY[0x1F412F2A8]();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return MEMORY[0x1F412F2B0]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x1F412F2B8]();
}

uint64_t _MDPlistContainerCreateWithBytesAndDeallocator()
{
  return MEMORY[0x1F412F2C0]();
}

uint64_t _MDPlistContainerEndContainer()
{
  return MEMORY[0x1F412F2D8]();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return MEMORY[0x1F412F2E0]();
}

uint64_t _MDPlistContainerGetPlistObjectAtKeyArray()
{
  return MEMORY[0x1F412F2F8]();
}

uint64_t _MDPlistDictionaryGetCount()
{
  return MEMORY[0x1F412F308]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x1F412F310]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x1F412F318]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x1F412F328]();
}

uint64_t _MDPlistGetRootPlistObjectFromPlist()
{
  return MEMORY[0x1F412F340]();
}

uint64_t _MDPlistNumberGetDoubleValue()
{
  return MEMORY[0x1F412F348]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x1F412F350]();
}

uint64_t _MDPlistStringGetValue()
{
  return MEMORY[0x1F412F358]();
}

uint64_t _MDStringCopyAbbreviations()
{
  return MEMORY[0x1F412F3D0]();
}

uint64_t _SICreateContactMailCounts()
{
  return MEMORY[0x1F412FD28]();
}

uint64_t _SICreateContactSMSCounts()
{
  return MEMORY[0x1F412FD30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __MDQueryCopyTextTerms()
{
  return MEMORY[0x1F412F3E8]();
}

uint64_t __MDQueryCreateQueryDictionaryWithOptionsDict()
{
  return MEMORY[0x1F412F3F0]();
}

uint64_t __MDQueryStringCreateForRanking()
{
  return MEMORY[0x1F412F420]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1F40C9CC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1F40C9CC8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t appErrorScore()
{
  return MEMORY[0x1F415BA00]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_read_data_into_fd()
{
  return MEMORY[0x1F417E0B0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_bzip2()
{
  return MEMORY[0x1F417E160]();
}

uint64_t archive_read_support_format_tar()
{
  return MEMORY[0x1F417E198]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1F417E1E8]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E1F8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1F417E200]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t compress_file_in_place()
{
  return MEMORY[0x1F412FD38]();
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC0E0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t intentLabel()
{
  return MEMORY[0x1F4147678]();
}

uint64_t isAppPrefixMatch()
{
  return MEMORY[0x1F415BA08]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t logForCSLogCategoryPersonalization()
{
  return MEMORY[0x1F40DEF20]();
}

uint64_t logForCSLogCategoryPhotosQU()
{
  return MEMORY[0x1F40DEF28]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1F40CD118]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

void sync(void)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}