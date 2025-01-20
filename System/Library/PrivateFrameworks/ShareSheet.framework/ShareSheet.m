id getLPLinkMetadataClass()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLPLinkMetadataClass_softClass_1;
  v7 = getLPLinkMetadataClass_softClass_1;
  if (!getLPLinkMetadataClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLPLinkMetadataClass_block_invoke_1;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AD9F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, float a2)
{
  float *v3 = a2;
  void *v2 = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

Class __getFBDisplayManagerClass_block_invoke(uint64_t a1)
{
  FrontBoardLibrary();
  Class result = objc_getClass("FBDisplayManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFBDisplayManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFBDisplayManagerClass_block_invoke_cold_1();
    return (Class)__getFBDisplayManagerClass_block_invoke_0(v3);
  }
  return result;
}

void __getFBDisplayManagerClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("FBDisplayManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFBDisplayManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFBDisplayManagerClass_block_invoke_cold_1();
    FrontBoardLibrary();
  }
}

void FrontBoardLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __FrontBoardLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A22320;
    uint64_t v3 = 0;
    FrontBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void FrontBoardLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!FrontBoardLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __FrontBoardLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A236C0;
    uint64_t v3 = 0;
    FrontBoardLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!FrontBoardLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void initSFUILinkMetadataSerializationForLocalUseOnly(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v7[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary)
  {
    v7[1] = MEMORY[0x1E4F143A8];
    v7[2] = 3221225472;
    v7[3] = __SharingUILibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5A215E8;
    uint64_t v9 = 0;
    SharingUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v6 = (void *)v7[0];
    uint64_t v5 = (void *)SharingUILibraryCore_frameworkLibrary;
    if (SharingUILibraryCore_frameworkLibrary)
    {
      if (!v7[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = (void *)abort_report_np();
    }
    free(v6);
    goto LABEL_5;
  }
  uint64_t v5 = (void *)SharingUILibraryCore_frameworkLibrary;
LABEL_5:
  softLinkSFUILinkMetadataSerializationForLocalUseOnly = (uint64_t (*)())dlsym(v5, "SFUILinkMetadataSerializationForLocalUseOnly");
  ((void (*)(id, id))softLinkSFUILinkMetadataSerializationForLocalUseOnly)(v3, v4);
}

uint64_t __SharingUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SHSheetIsCollaborationItemEligibleForActivity(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4 || [(id)objc_opt_class() activityCategory] == 1 || (objc_opt_respondsToSelector())
    && ![v3 type])
  {
    id v6 = v3;
    if ([v6 isiCloudDrive])
    {
      uint64_t v5 = 1;
    }
    else if ([v6 isCollaborativeURL])
    {
      v7 = [v4 activityType];
      uint64_t v5 = [v7 isEqualToString:@"com.apple.UIKit.activity.Message"];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

id SHSheetCollaborativeItemNotSupportedAlertController(void *a1)
{
  id v1 = a1;
  long long v2 = _ShareSheetBundle();
  id v3 = [v2 localizedStringForKey:@"Move to iCloud Title" value:@"Move to iCloud" table:@"Localizable"];

  id v4 = _ShareSheetBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"Move to iCloud Body" value:@"This item isn't stored in iCloud. You'll need to move it to iCloud or another supported cloud source before you can collaborate." table:@"Localizable"];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v1);

  v7 = _ShareSheetBundle();
  long long v8 = [v7 localizedStringForKey:@"Move to iCloud OK" value:@"OK" table:@"Localizable"];

  uint64_t v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v6 preferredStyle:1];
  uint64_t v10 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:1 handler:&__block_literal_global];
  [v9 addAction:v10];

  return v9;
}

id SHSheetModeRestrictionAlertController(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v8 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v9 = [v5 alertTitle];
  uint64_t v10 = [v5 alertMessage];
  v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = [v5 alertDismissButtonTitle];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __SHSheetModeRestrictionAlertController_block_invoke;
  v28[3] = &unk_1E5A21648;
  id v14 = v7;
  id v29 = v14;
  v15 = [v12 actionWithTitle:v13 style:1 handler:v28];
  [v11 addAction:v15];

  v16 = [v5 alertRecoverySuggestionButtonTitle];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4FB1410];
    v18 = [v5 alertRecoverySuggestionButtonTitle];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __SHSheetModeRestrictionAlertController_block_invoke_2;
    v24 = &unk_1E5A21670;
    id v25 = v5;
    id v26 = v6;
    id v27 = v14;
    v19 = [v17 actionWithTitle:v18 style:0 handler:&v21];
    objc_msgSend(v11, "addAction:", v19, v21, v22, v23, v24);
  }
  return v11;
}

uint64_t __SHSheetModeRestrictionAlertController_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __SHSheetModeRestrictionAlertController_block_invoke_2(uint64_t a1)
{
  long long v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) alertRecoverySuggestionButtonLaunchURL];

  if (v3)
  {
    id v4 = [*v2 alertRecoverySuggestionButtonLaunchURL];
    id v5 = [v4 scheme];
    id v6 = [v5 lowercaseString];
    int v7 = [v6 isEqualToString:@"prefs"];

    long long v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v9 = [*v2 alertRecoverySuggestionButtonLaunchURL];
    if (v7)
    {
      v16 = 0;
      LOBYTE(v10) = [v8 openSensitiveURL:v9 withOptions:0 error:&v16];
      v11 = v16;
    }
    else
    {
      v15 = 0;
      int v10 = [v8 openURL:v9 withOptions:0 error:&v15];
      v11 = v15;
    }
    id v12 = v11;

    if ((v10 & 1) == 0)
    {
      v13 = share_sheet_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __SHSheetModeRestrictionAlertController_block_invoke_2_cold_1(v2, (uint64_t)v12, v13);
      }
    }
  }
  if (([*v2 allowContinueToMode] & 1) == 0) {
    [*(id *)(a1 + 40) _cancel];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void _UIDICArchiveEnumerateFilePaths(void *a1, void *a2, char a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1FD0];
  id v6 = a2;
  id v7 = a1;
  id v8 = [v5 alloc];
  uint64_t v9 = [v7 path];

  int v10 = (void *)[v8 initWithArchivePath:v9];
  [v10 setExcludeDotFilesFromResults:a3 & 1];
  v11 = [MEMORY[0x1E4F1CA48] array];
  id v14 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___UIDICArchiveEnumerateFilePaths_block_invoke;
  v15[3] = &unk_1E5A21698;
  id v16 = v11;
  id v12 = v11;
  [v10 enumerateLogicalItemsWithBlock:v15 error:&v14];
  id v13 = v14;
  v6[2](v6, v12, v13);
}

void _UIDICArchiveExtractArchiveSubpathToRoot(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  v11 = a4;
  if (v10)
  {
    id v12 = [v10 path];
    id v13 = 0;
  }
  else
  {
    id v14 = NSTemporaryDirectory();
    v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v15 UUIDString];
    v17 = [v14 stringByAppendingPathComponent:v16];

    id v12 = v17;
    id v13 = v12;
  }
  id v18 = objc_alloc(MEMORY[0x1E4FB1FC8]);
  v19 = [v8 path];
  v20 = (void *)[v18 initWithSourceArchivePath:v19 destinationExtractionRootPath:v12];

  [v20 setSourceArchiveExtractionRootPath:v9];
  id v48 = 0;
  int v21 = [v20 extractArchiveContent:&v48];
  id v22 = v48;
  id v47 = v8;
  if (!v21) {
    goto LABEL_7;
  }
  if (!v9)
  {
    id v42 = v10;
    id v43 = v20;
    v30 = [v8 lastPathComponent];
    v31 = [v30 stringByDeletingPathExtension];
    v32 = [v31 pathExtension];
    v33 = [v32 lowercaseString];

    v34 = v33;
    if ([v33 length])
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___payloadItemURLByExtensionMatchingHeuristicInExtractionController_block_invoke;
      v50 = &unk_1E5A216C0;
      uint64_t v52 = a5;
      id v51 = v33;
      v35 = [v43 extractedContentAbsolutePathsMatchingPredicate:buf];
      v36 = [v35 firstObject];

      if (v36)
      {
        id v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v36];
      }
      else
      {
        id v25 = 0;
      }
      id v8 = v47;

      v34 = v33;
    }
    else
    {
      id v25 = 0;
      id v8 = v47;
    }

    id v10 = v42;
    if (v25) {
      goto LABEL_25;
    }
    v44 = objc_opt_new();
    v37 = [v44 contentsOfDirectoryAtPath:v12 error:0];
    if ([v37 count] == 1
      && ([v37 firstObject],
          v38 = objc_claimAutoreleasedReturnValue(),
          int shouldExcludePath = _shouldExcludePath(v38, a5),
          v38,
          id v8 = v47,
          !shouldExcludePath))
    {
      v40 = (void *)MEMORY[0x1E4F1CB10];
      v46 = [v37 firstObject];
      v41 = [v12 stringByAppendingPathComponent:v46];
      id v25 = [v40 fileURLWithPath:v41];

      id v8 = v47;
      if (v25) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    id v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    if (!v25) {
      goto LABEL_7;
    }
LABEL_25:
    if (v13)
    {
      id v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    }
    else
    {
      id v29 = 0;
    }
    goto LABEL_28;
  }
  v23 = (void *)MEMORY[0x1E4F1CB10];
  v24 = [v12 stringByAppendingPathComponent:v9];
  id v25 = [v23 fileURLWithPath:v24];

  id v8 = v47;
  if (v25) {
    goto LABEL_25;
  }
LABEL_7:
  id v26 = share_sheet_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v8 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_DEFAULT, "ERROR: Unable to load archive: %@ (extraction subpath = %@)", buf, 0x16u);

    id v8 = v47;
  }

  if (v13)
  {
    v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v28 removeItemAtPath:v13 error:0];

    id v8 = v47;
    id v29 = 0;
    id v25 = 0;
    id v13 = 0;
  }
  else
  {
    id v29 = 0;
    id v25 = 0;
  }
LABEL_28:
  v11[2](v11, v25, v29, v22);
}

uint64_t _shouldExcludePath(void *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return 0;
  }
  id v3 = [a1 lastPathComponent];
  uint64_t v4 = [v3 hasPrefix:@"."];

  return v4;
}

BOOL ___payloadItemURLByExtensionMatchingHeuristicInExtractionController_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (_shouldExcludePath(v5, *(void *)(a1 + 40)))
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v5 pathExtension];
    id v8 = [v7 lowercaseString];
    *a3 = [v8 isEqualToString:*(void *)(a1 + 32)];

    BOOL v6 = *a3 != 0;
  }

  return v6;
}

void sub_1A0ADF9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ADFC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationFooterViewModelClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SocialLayerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A21708;
    uint64_t v6 = 0;
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SocialLayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SLCollaborationFooterViewModel");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSLCollaborationFooterViewModelClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSLCollaborationFooterViewModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLPLinkMetadataClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LinkPresentationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A21720;
    uint64_t v6 = 0;
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!LinkPresentationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LPLinkMetadata");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getLPLinkMetadataClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLPLinkMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LinkPresentationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary = result;
  return result;
}

id SHSheetContentSectionTypeDescription(char a1)
{
  if (a1)
  {
    long long v2 = _SHSheetAddContentSectionTypeToDescription(@"SHSheetContentSectionTypeCustomView", 0);
    if ((a1 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  long long v2 = 0;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    uint64_t v3 = _SHSheetAddContentSectionTypeToDescription(@"SHSheetContentSectionTypePeople", v2);

    long long v2 = (void *)v3;
  }
LABEL_6:
  if ((a1 & 4) != 0)
  {
    uint64_t v6 = _SHSheetAddContentSectionTypeToDescription(@"SHSheetContentSectionTypeApps", v2);

    long long v2 = (void *)v6;
    if ((a1 & 8) == 0)
    {
LABEL_8:
      if ((a1 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v7 = _SHSheetAddContentSectionTypeToDescription(@"SHSheetContentSectionTypeActions", v2);

  long long v2 = (void *)v7;
  if ((a1 & 0x10) != 0)
  {
LABEL_9:
    uint64_t v4 = _SHSheetAddContentSectionTypeToDescription(@"SHSheetContentSectionTypeActionsHero", v2);

    long long v2 = (void *)v4;
  }
LABEL_10:
  return v2;
}

id _SHSheetAddContentSectionTypeToDescription(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    uint64_t v5 = [v4 stringByAppendingFormat:@"|"];
LABEL_5:
    uint64_t v6 = (__CFString *)v5;
    goto LABEL_6;
  }
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    goto LABEL_5;
  }
  uint64_t v6 = &stru_1EF308000;
LABEL_6:
  uint64_t v7 = [(__CFString *)v6 stringByAppendingString:v3];

  return v7;
}

void sub_1A0AE29D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A0AE53E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AE61F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _convertToSingleLine(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 newlineCharacterSet];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  uint64_t v5 = [v4 componentsJoinedByString:@" "];

  return v5;
}

Class __getSFUIActivityImageProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SharingUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A21868;
    uint64_t v6 = 0;
    SharingUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SharingUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFUIActivityImageProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getSFUIActivityImageProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFUIActivityImageProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A0AE9A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPLinkMetadataClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LinkPresentationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A21880;
    uint64_t v6 = 0;
    LinkPresentationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!LinkPresentationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LPLinkMetadata");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getLPLinkMetadataClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLPLinkMetadataClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LinkPresentationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A0AEA5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SharedWithYouCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharedWithYouCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A0AEB1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initMCProfileConnection()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_39);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

void *__ManagedConfigurationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

Class initWKWebView()
{
  if (WebKitLibrary_sOnce != -1) {
    dispatch_once(&WebKitLibrary_sOnce, &__block_literal_global_43);
  }
  Class result = objc_getClass("WKWebView");
  classWKWebView = (uint64_t)result;
  getWKWebViewClass = (uint64_t (*)())WKWebViewFunction;
  return result;
}

id WKWebViewFunction()
{
  return (id)classWKWebView;
}

void *__WebKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/WebKit.framework/WebKit", 2);
  WebKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSFAddToHomeScreenViewController()
{
  if (SafariServicesLibrary_sOnce != -1) {
    dispatch_once(&SafariServicesLibrary_sOnce, &__block_literal_global_47);
  }
  Class result = objc_getClass("SFAddToHomeScreenViewController");
  classSFAddToHomeScreenViewController = (uint64_t)result;
  getSFAddToHomeScreenViewControllerClass = (uint64_t (*)())SFAddToHomeScreenViewControllerFunction;
  return result;
}

id SFAddToHomeScreenViewControllerFunction()
{
  return (id)classSFAddToHomeScreenViewController;
}

void *__SafariServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 2);
  SafariServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1A0AEBFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSFUIShareSheetRemoteSettingsHelperClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSFUIShareSheetRemoteSettingsHelperClass_softClass;
  uint64_t v7 = getSFUIShareSheetRemoteSettingsHelperClass_softClass;
  if (!getSFUIShareSheetRemoteSettingsHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AEEE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SharingUILibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A21950;
    uint64_t v6 = 0;
    SharingUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SharingUILibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFUIShareSheetRemoteSettingsHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getSFUIShareSheetRemoteSettingsHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFUIShareSheetRemoteSettingsHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

id getSFUIShareSheetActivityCellSpecClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSFUIShareSheetActivityCellSpecClass_softClass;
  uint64_t v7 = getSFUIShareSheetActivityCellSpecClass_softClass;
  if (!getSFUIShareSheetActivityCellSpecClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSFUIShareSheetActivityCellSpecClass_block_invoke;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getSFUIShareSheetActivityCellSpecClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AF1E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AF40E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AF4240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AF43F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetActivityCellSpecClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SharingUILibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A219E0;
    uint64_t v6 = 0;
    SharingUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SharingUILibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFUIShareSheetActivityCellSpec");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFUIShareSheetActivityCellSpecClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingUILibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1A0AF8548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _cacheKeyWithMatchingAttributes(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"NSExtensionActivationRule"];
  id v3 = [v1 objectForKeyedSubscript:@"NSExtensionPointName"];
  uint64_t v4 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = v5;
  if (v2)
  {
    int v21 = v3;
    id v22 = v5;
    v23 = v2;
    id v24 = v1;
    [v2 objectForKeyedSubscript:@"extensionItems"];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:@"attachments"];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = [*(id *)(*((void *)&v26 + 1) + 8 * j) objectForKeyedSubscript:@"registeredTypeIdentifiers"];
                [v4 addObjectsFromArray:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    uint64_t v2 = v23;
    id v1 = v24;
    id v3 = v21;
    uint64_t v6 = v22;
  }
  [v4 sortUsingSelector:sel_caseInsensitiveCompare_];
  v17 = [v4 componentsJoinedByString:@"|"];
  [v6 appendString:v17];

  [v6 appendString:@"/"];
  if (v3)
  {
    id v18 = [v3 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    v19 = [v18 componentsJoinedByString:@"|"];
    [v6 appendString:v19];
  }
  return v6;
}

void sub_1A0AF8C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AF8F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

_UIMatchingExtensionsResult *_syncGetExtensionsResultWithMatchingAttributes(void *a1, int a2, const void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = objc_alloc_init(_UIMatchingExtensionsResult);
  uint64_t v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Started extension discovery", buf, 2u);
  }

  uint64_t v8 = share_sheet_log();
  uint64_t v9 = share_sheet_log();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, a3);

  if (a2)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      v11 = "PreheatInitialExtensionDiscovery";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, v11, " enableTelemetry=YES ", buf, 2u);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    v11 = "InitialExtensionDiscovery";
    goto LABEL_10;
  }

  id v22 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v5 error:&v22];

  id v13 = v22;
  [(_UIMatchingExtensionsResult *)v6 setExtensions:v12];

  uint64_t v14 = share_sheet_log();
  v15 = share_sheet_log();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, a3);

  if (a2)
  {
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      v17 = "PreheatInitialExtensionDiscovery";
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v14, OS_SIGNPOST_INTERVAL_END, v16, v17, " enableTelemetry=YES ", buf, 2u);
    }
  }
  else if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    v17 = "InitialExtensionDiscovery";
    goto LABEL_18;
  }

  id v18 = share_sheet_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(_UIMatchingExtensionsResult *)v6 extensions];
    uint64_t v20 = [v19 count];
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = v20;
    _os_log_impl(&dword_1A0AD8000, v18, OS_LOG_TYPE_DEFAULT, "Finished extension discovery (matched %{public}ld extensions)", buf, 0xCu);
  }
  [(_UIMatchingExtensionsResult *)v6 setError:v13];

  return v6;
}

void sub_1A0AF9840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
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

void *__getDMPerformMigrationIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __DataMigrationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5A21A98;
    uint64_t v7 = 0;
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
    if (DataMigrationLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "DMPerformMigrationIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMPerformMigrationIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DataMigrationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataMigrationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A0AFA384(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, uint64_t a15, long long a16)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v16 = objc_begin_catch(a1);
      v17 = share_sheet_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v16 name];
        id v19 = [v16 reason];
        uint64_t v20 = [v16 userInfo];
        LODWORD(buf) = 136447234;
        *(void *)((char *)&buf + 4) = "-[UIMailActivity _saveDraft:]";
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v18;
        a14 = 2114;
        LOWORD(a16) = 2114;
        *(void *)((char *)&a16 + 2) = v19;
        WORD5(a16) = 2114;
        *(void *)((char *)&a16 + 12) = v20;
        _os_log_error_impl(&dword_1A0AD8000, v17, OS_LOG_TYPE_ERROR, "%{public}s: Warning: Exception %{public}@ trying to archive mail draft identifier %{public}@: %{public}@.\nUser info = %{public}@", (uint8_t *)&buf, 0x34u);
      }
      objc_end_catch();
      JUMPOUT(0x1A0AFA32CLL);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x1A0AFA330);
  }
  _Unwind_Resume(a1);
}

void sub_1A0AFA888(_Unwind_Exception *a1)
{
}

void sub_1A0AFC4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

Class initMFMailComposeViewController()
{
  if (MessageUILibrary_sOnce != -1) {
    dispatch_once(&MessageUILibrary_sOnce, &__block_literal_global_7);
  }
  Class result = objc_getClass("MFMailComposeViewController");
  classMFMailComposeViewController = (uint64_t)result;
  getMFMailComposeViewControllerClass = (uint64_t (*)())MFMailComposeViewControllerFunction;
  return result;
}

id MFMailComposeViewControllerFunction()
{
  return (id)classMFMailComposeViewController;
}

void *__MessageUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  MessageUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initMCProfileConnection_0()
{
  if (ManagedConfigurationLibrary_sOnce_0 != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce_0, &__block_literal_global_315);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_0 = (uint64_t)result;
  getMCProfileConnectionClass_0 = (uint64_t (*)())MCProfileConnectionFunction_0;
  return result;
}

id MCProfileConnectionFunction_0()
{
  return (id)classMCProfileConnection_0;
}

void *__ManagedConfigurationLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initQLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3 = QuickLookLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_319);
  }
  softLinkQLTypeCopyUTIForURLAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyUTIForURLAndMimeType");
  uint64_t v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType)(v5, v4);

  return v6;
}

void *__QuickLookLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initQLTypeCopyBestMimeTypeForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3 = QuickLookLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_319);
  }
  softLinkQLTypeCopyBestMimeTypeForURLAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyBestMimeTypeForURLAndMimeType");
  uint64_t v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyBestMimeTypeForURLAndMimeType)(v5, v4);

  return v6;
}

uint64_t initQLTypeCopyBestMimeTypeForFileNameAndMimeType(void *a1, void *a2)
{
  uint64_t v3 = QuickLookLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_319);
  }
  softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyBestMimeTypeForFileNameAndMimeType");
  uint64_t v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType)(v5, v4);

  return v6;
}

void *__MessageLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Message.framework/Message", 2);
  MessageLibrary_sLib = (uint64_t)result;
  return result;
}

id initValMCFeatureAccountModificationAllowed()
{
  if (ManagedConfigurationLibrary_sOnce_0 != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce_0, &__block_literal_global_315);
  }
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib_0, "MCFeatureAccountModificationAllowed");
  if (v0) {
    objc_storeStrong((id *)&constantValMCFeatureAccountModificationAllowed, *v0);
  }
  getMCFeatureAccountModificationAllowed = (uint64_t (*)())MCFeatureAccountModificationAllowedFunction;
  id v1 = (void *)constantValMCFeatureAccountModificationAllowed;
  return v1;
}

id MCFeatureAccountModificationAllowedFunction()
{
  return (id)constantValMCFeatureAccountModificationAllowed;
}

uint64_t _UIActivityOpenInApplicationTypeForActivityType(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple.UIKit.activity.RemoteOpenInApplication-InPlace"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 hasPrefix:@"com.apple.UIKit.activity.RemoteOpenInApplication-ByCopy"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = [v1 hasPrefix:@"com.apple.UIKit.activity.RemoteOpenInApplication"];
  }

  return v2;
}

id imageLoadingQueue()
{
  v0 = (void *)imageLoadingQueue_imageLoadingQueue;
  if (!imageLoadingQueue_imageLoadingQueue)
  {
    id v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.ActivityImageLoading", v1);
    uint64_t v3 = (void *)imageLoadingQueue_imageLoadingQueue;
    imageLoadingQueue_imageLoadingQueue = (uint64_t)v2;

    v0 = (void *)imageLoadingQueue_imageLoadingQueue;
  }
  return v0;
}

void _loadItemProvidersFromActivityItemsStartingAtIndex(void *a1, unint64_t a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = _itemLoaderQueue();
  dispatch_assert_queue_V2(v18);

  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke;
  v121[3] = &unk_1E5A21E88;
  id v19 = v13;
  id v122 = v19;
  unint64_t v126 = a2;
  char v127 = a4;
  id v20 = v15;
  id v123 = v20;
  id v21 = v16;
  id v124 = v21;
  id v22 = v17;
  id v125 = v22;
  v79 = (void *)MEMORY[0x1A6229A90](v121);
  unint64_t v23 = [v19 count];
  uint64_t v24 = share_sheet_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if (v23 > a2)
  {
    if (v25)
    {
      *(_DWORD *)buf = 67240192;
      int v139 = a2;
      _os_log_impl(&dword_1A0AD8000, v24, OS_LOG_TYPE_INFO, "Examining item at index %{public}d", buf, 8u);
    }

    long long v26 = [v19 objectAtIndexedSubscript:a2];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v31 = share_sheet_log();
      long long v30 = v79;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        int v139 = a2;
        _os_log_impl(&dword_1A0AD8000, v31, OS_LOG_TYPE_INFO, "Adding item at index %{public}d as-is.", buf, 8u);
      }

      (*((void (**)(id, void *, void *))v21 + 2))(v21, v26, v26);
      long long v32 = _itemLoaderQueue();
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_540;
      v83[3] = &unk_1E5A21FF0;
      id v85 = v79;
      id v84 = v14;
      dispatch_async(v32, v83);

      id v33 = v85;
      goto LABEL_72;
    }
    id v27 = v26;
    id v77 = v22;
    if (([v20 isEqualToString:@"com.apple.UIKit.activity.Message"] & 1) != 0
      || ([v20 isEqualToString:@"com.apple.UIKit.activity.Mail"] & 1) != 0)
    {
      int v28 = 0;
    }
    else
    {
      int v28 = [v20 isEqualToString:@"com.apple.UIKit.activity.SaveToCameraRoll"] ^ 1;
    }
    v78 = v27;
    v34 = [v27 registeredTypeIdentifiers];
    int v35 = [v34 containsObject:@"com.apple.group-activities.activity"];

    if (v35 && v28)
    {
      uint64_t v36 = _itemLoaderQueue();
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_522;
      v116[3] = &unk_1E5A21EB0;
      id v119 = v21;
      v37 = v78;
      id v117 = v78;
      long long v30 = v79;
      id v120 = v79;
      id v118 = v14;
      dispatch_async(v36, v116);

      v38 = v119;
LABEL_23:
      id v22 = v77;
LABEL_71:

      id v33 = v37;
LABEL_72:

      goto LABEL_73;
    }
    if (a4 && [MEMORY[0x1E4F9F6B8] hasiWorkSendCopyRepresentationForItemProvider:v78])
    {
      v39 = share_sheet_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        int v139 = a2;
        _os_log_impl(&dword_1A0AD8000, v39, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as URL for copy type identifier", buf, 8u);
      }

      v40 = (void *)MEMORY[0x1E4F9F6B8];
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_524;
      v110[3] = &unk_1E5A21F00;
      unint64_t v115 = a2;
      id v113 = v21;
      v37 = v78;
      id v111 = v78;
      id v114 = v79;
      id v112 = v14;
      long long v30 = v79;
      [v40 loadiWorkCopyRepresentationURLForItemProvider:v111 completionHandler:v110];

      v38 = v113;
      goto LABEL_23;
    }
    id v41 = v78;
    id v75 = v20;
    v76 = v14;
    if (([v41 canLoadObjectOfClass:objc_opt_class()] & 1) != 0
      || ([v41 canLoadObjectOfClass:objc_opt_class()] & 1) == 0
      && (([v41 canLoadObjectOfClass:objc_opt_class()] & 1) != 0
       || ![v41 canLoadObjectOfClass:objc_opt_class()]))
    {
      uint64_t v43 = [v41 preferredPresentationStyle];

      if (v43 == 1)
      {
LABEL_40:
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_3;
        v89[3] = &unk_1E5A21FC8;
        id v92 = v21;
        id v90 = v41;
        long long v30 = v79;
        id v71 = v79;
        id v93 = v71;
        id v70 = v14;
        id v91 = v70;
        id v33 = v90;
        v74 = v89;
        if (_loadItemProviderInline_onceToken != -1) {
          dispatch_once(&_loadItemProviderInline_onceToken, &__block_literal_global_549);
        }
        id v22 = v77;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        id v50 = (id)_loadItemProviderInline_loadableClasses;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v128 objects:buf count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v129;
          while (2)
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v129 != v53) {
                objc_enumerationMutation(v50);
              }
              v55 = *(objc_class **)(*((void *)&v128 + 1) + 8 * i);
              if (objc_msgSend(v33, "canLoadObjectOfClass:", v55, v70, v71))
              {
                v56 = share_sheet_log();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  v57 = NSStringFromClass(v55);
                  *(_DWORD *)v133 = 67240450;
                  *(_DWORD *)&v133[4] = MEMORY[0x1E4F148E0];
                  LOWORD(v134) = 2114;
                  *(void *)((char *)&v134 + 2) = v57;
                  _os_log_impl(&dword_1A0AD8000, v56, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as class %{public}@", v133, 0x12u);
                }
                *(void *)v133 = MEMORY[0x1E4F143A8];
                *(void *)&long long v134 = 3221225472;
                *((void *)&v134 + 1) = ___loadItemProviderInline_block_invoke_550;
                v135 = &unk_1E5A22018;
                v137 = v55;
                v58 = v74;
                v136 = v74;
                id v59 = (id)[v33 loadObjectOfClass:v55 completionHandler:v133];

                char v72 = 1;
                id v20 = v75;
                id v22 = v77;
                long long v30 = v79;
                goto LABEL_66;
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v128 objects:buf count:16];
            if (v52) {
              continue;
            }
            break;
          }
          char v72 = 0;
          id v20 = v75;
          id v22 = v77;
          long long v30 = v79;
        }
        else
        {
          char v72 = 0;
        }
        v58 = v74;
LABEL_66:

        id v14 = v76;
        if (v72) {
          goto LABEL_72;
        }
        v68 = share_sheet_log();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          _loadItemProvidersFromActivityItemsStartingAtIndex_cold_1(a2, v68);
        }

        v69 = _itemLoaderQueue();
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_539;
        v86[3] = &unk_1E5A21FF0;
        id v88 = v71;
        id v87 = v70;
        dispatch_async(v69, v86);

        v38 = v88;
LABEL_70:
        v37 = v78;
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v42 = [v41 preferredPresentationStyle];

      if (v42 != 2) {
        goto LABEL_40;
      }
    }
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v73 = v41;
    v38 = [v41 registeredContentTypes];
    uint64_t v44 = [v38 countByEnumeratingWithState:&v106 objects:v132 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v107;
      uint64_t v47 = *MEMORY[0x1E4F44378];
      while (2)
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v107 != v46) {
            objc_enumerationMutation(v38);
          }
          v49 = *(void **)(*((void *)&v106 + 1) + 8 * j);
          if ([v49 conformsToType:v47])
          {
            if ([v49 conformsToType:*MEMORY[0x1E4F444F8]]
              && ([v49 conformsToType:*MEMORY[0x1E4F443B8]] & 1) == 0
              && [v73 canLoadObjectOfClass:objc_opt_class()])
            {
              v60 = share_sheet_log();
              id v20 = v75;
              id v22 = v77;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67240192;
                int v139 = a2;
                _os_log_impl(&dword_1A0AD8000, v60, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as a URL", buf, 8u);
              }

              uint64_t v61 = objc_opt_class();
              v100[0] = MEMORY[0x1E4F143A8];
              v100[1] = 3221225472;
              v100[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_527;
              v100[3] = &unk_1E5A21F00;
              unint64_t v105 = a2;
              v62 = &v103;
              id v103 = v21;
              id v101 = v73;
              id v104 = v79;
              id v102 = v76;
              long long v30 = v79;
              id v63 = (id)[v101 loadObjectOfClass:v61 completionHandler:v100];

              id v64 = v101;
            }
            else
            {
              v65 = share_sheet_log();
              id v20 = v75;
              id v22 = v77;
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67240450;
                int v139 = a2;
                __int16 v140 = 2114;
                v141 = v49;
                _os_log_impl(&dword_1A0AD8000, v65, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as a file of type %{public}@", buf, 0x12u);
              }

              v94[0] = MEMORY[0x1E4F143A8];
              v94[1] = 3221225472;
              v94[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_529;
              v94[3] = &unk_1E5A21FA0;
              v62 = (id *)v95;
              id v66 = v76;
              unint64_t v99 = a2;
              v95[0] = v66;
              v95[1] = v49;
              long long v30 = v79;
              id v97 = v79;
              id v98 = v21;
              id v96 = v73;
              id v67 = (id)[v96 loadFileRepresentationForContentType:v49 openInPlace:1 completionHandler:v94];

              id v64 = v97;
            }

            id v14 = v76;
            goto LABEL_70;
          }
        }
        uint64_t v45 = [v38 countByEnumeratingWithState:&v106 objects:v132 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }

    id v20 = v75;
    id v14 = v76;
    id v41 = v73;
    goto LABEL_40;
  }
  if (v25)
  {
    *(_DWORD *)buf = 67240192;
    int v139 = a2;
    _os_log_impl(&dword_1A0AD8000, v24, OS_LOG_TYPE_INFO, "Finished examining all %{public}d items.", buf, 8u);
  }

  long long v29 = _itemLoaderQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_541;
  block[3] = &unk_1E5A21FF0;
  id v82 = v22;
  id v81 = v14;
  dispatch_async(v29, block);

  long long v26 = v82;
  long long v30 = v79;
LABEL_73:
}

void _updateActivityItemMappingWithResolvedActivityItem(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = +[_UIActivityItemMapping _originalActivityItemForActivityItem:v6];
  if (v4)
  {
    id v5 = +[_UIActivityItemMapping _activityViewControllerForActivityItem:v6];
    +[_UIActivityItemMapping _addActivityItem:v3 activityViewController:v5 originalActivityItem:v4];
  }
}

void sub_1A0B01154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B012C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _UIActivityImageForBundleIdentifier(void *a1, int a2, uint64_t a3)
{
  id v5 = a1;
  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v5];
    uint64_t v7 = [v6 appState];
    int v8 = [v7 isInstalled];

    if (v8)
    {
      uint64_t v9 = (id *)MEMORY[0x1E4F6F298];
      if (a2 != 10) {
        uint64_t v9 = (id *)MEMORY[0x1E4F6F2B8];
      }
      os_signpost_id_t v10 = (objc_class *)MEMORY[0x1E4F6F248];
      id v11 = *v9;
      uint64_t v12 = (void *)[[v10 alloc] initWithBundleIdentifier:v5];
      id v13 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:v11];

      id v14 = [(objc_class *)getSFUIActivityImageProviderClass() tintImageDescriptor:v13 withUserInterfaceStyle:a3 forGraphicIcon:0];

      id v15 = [v12 imageForImageDescriptor:v14];
      id v16 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v17 = [v15 CGImage];
      [v15 scale];
      id v18 = objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v17, 0);
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void sub_1A0B022BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _UIActivityItemTypesSet(void *a1)
{
  __activityItemTypes = 0;
  ItemTypesSet(a1);
}

void ItemTypesSet(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (~(_WORD)__activityItemTypes & 0x10C2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v7 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v6 activityType:0];
        }
        else
        {
          uint64_t v7 = 0;
        }
        __int16 v8 = __activityItemTypes;
        if ((__activityItemTypes & 1) == 0)
        {
          int v9 = IsString(v6);
          __int16 v8 = __activityItemTypes;
          if (v9)
          {
            __int16 v8 = __activityItemTypes | 1;
            __activityItemTypes |= 1uLL;
          }
        }
        if ((v8 & 2) == 0)
        {
          int v10 = IsImage(v6, v7);
          __int16 v8 = __activityItemTypes;
          if (v10)
          {
            __int16 v8 = __activityItemTypes | 2;
            __activityItemTypes |= 2uLL;
          }
        }
        if ((v8 & 4) == 0)
        {
          int v11 = IsURL(v6);
          __int16 v8 = __activityItemTypes;
          if (v11)
          {
            __int16 v8 = __activityItemTypes | 4;
            __activityItemTypes |= 4uLL;
          }
        }
        if ((v8 & 8) == 0)
        {
          int v12 = IsFileURL(v6);
          __int16 v8 = __activityItemTypes;
          if (v12)
          {
            __int16 v8 = __activityItemTypes | 8;
            __activityItemTypes |= 8uLL;
          }
        }
        if ((v8 & 0x10) == 0)
        {
          int v13 = IsCopyable(v6);
          __int16 v8 = __activityItemTypes;
          if (v13)
          {
            __int16 v8 = __activityItemTypes | 0x10;
            __activityItemTypes |= 0x10uLL;
          }
        }
        if ((v8 & 0x20) == 0)
        {
          int v14 = IsPrintable(v6);
          __int16 v8 = __activityItemTypes;
          if (v14)
          {
            __int16 v8 = __activityItemTypes | 0x20;
            __activityItemTypes |= 0x20uLL;
          }
        }
        if ((v8 & 0x40) == 0)
        {
          int v15 = IsVideo(v6, v7);
          __int16 v8 = __activityItemTypes;
          if (v15)
          {
            __int16 v8 = __activityItemTypes | 0x40;
            __activityItemTypes |= 0x40uLL;
          }
        }
        if ((v8 & 0x80) == 0)
        {
          int v16 = IsPDF(v6, v7);
          __int16 v8 = __activityItemTypes;
          if (v16)
          {
            __int16 v8 = __activityItemTypes | 0x80;
            __activityItemTypes |= 0x80uLL;
          }
        }
        if ((v8 & 0x100) == 0)
        {
          int v17 = IsDictionary(v6);
          __int16 v8 = __activityItemTypes;
          if (v17)
          {
            __int16 v8 = __activityItemTypes | 0x100;
            __activityItemTypes |= 0x100uLL;
          }
        }
        if ((v8 & 0x200) == 0)
        {
          int v18 = IsPassbook(v6);
          __int16 v8 = __activityItemTypes;
          if (v18)
          {
            __int16 v8 = __activityItemTypes | 0x200;
            __activityItemTypes |= 0x200uLL;
          }
        }
        if ((v8 & 0x400) == 0)
        {
          int v19 = IsContact(v6);
          __int16 v8 = __activityItemTypes;
          if (v19)
          {
            __int16 v8 = __activityItemTypes | 0x400;
            __activityItemTypes |= 0x400uLL;
          }
        }
        if ((v8 & 0x800) == 0)
        {
          int v20 = IsData(v6);
          __int16 v8 = __activityItemTypes;
          if (v20)
          {
            __int16 v8 = __activityItemTypes | 0x800;
            __activityItemTypes |= 0x800uLL;
          }
        }
        if ((v8 & 0x1000) == 0)
        {
          int v21 = IsAudio(v6, v7);
          __int16 v8 = __activityItemTypes;
          if (v21)
          {
            __int16 v8 = __activityItemTypes | 0x1000;
            __activityItemTypes |= 0x1000uLL;
          }
        }
        if ((v8 & 0x4000) == 0 && IsItemProvider(v6)) {
          __activityItemTypes |= 0x4000uLL;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = [v6 allValues];
          ItemTypesSet();
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v3);
  }
}

uint64_t _UIActivityItemTypes()
{
  return __activityItemTypes;
}

id _UIActivityItemsWithTypes(void *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v8)
  {
    int v10 = 0;
    goto LABEL_76;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v31;
  unsigned int v27 = a5;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v7);
      }
      int v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v14 = [v13 allValues];
        int v15 = _UIActivityItemsWithTypes(v14, a2, a3, a4, a5);

        if (!v10)
        {
          int v10 = [MEMORY[0x1E4F1CA48] array];
        }
        [v10 addObjectsFromArray:v15];

        continue;
      }
      if (!IsItemProvider(v13))
      {
        if (a2 & 0x10C2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          int v16 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v13 activityType:0];
          if (a2) {
            goto LABEL_19;
          }
LABEL_22:
          int v17 = 0;
          if ((a2 & 2) != 0) {
            goto LABEL_23;
          }
        }
        else
        {
          int v16 = 0;
          if ((a2 & 1) == 0) {
            goto LABEL_22;
          }
LABEL_19:
          int v17 = IsString(v13);
          if ((a2 & 2) != 0)
          {
LABEL_23:
            if ((v17 & 1) == 0) {
              int v17 = IsImage(v13, v16);
            }
          }
        }
        if ((a2 & 4) != 0 && (v17 & 1) == 0) {
          int v17 = IsURL(v13);
        }
        if ((a2 & 8) != 0 && (v17 & 1) == 0) {
          int v17 = IsFileURL(v13);
        }
        if ((a2 & 0x10) != 0 && (v17 & 1) == 0) {
          int v17 = IsCopyable(v13);
        }
        if ((a2 & 0x20) != 0 && (v17 & 1) == 0) {
          int v17 = IsPrintable(v13);
        }
        if ((a2 & 0x40) != 0 && (v17 & 1) == 0) {
          int v17 = IsVideo(v13, v16);
        }
        if ((a2 & 0x80) != 0 && (v17 & 1) == 0) {
          int v17 = IsPDF(v13, v16);
        }
        if ((a2 & 0x100) != 0 && (v17 & 1) == 0) {
          int v17 = IsDictionary(v13);
        }
        if ((a2 & 0x200) != 0 && (v17 & 1) == 0) {
          int v17 = IsPassbook(v13);
        }
        if ((a2 & 0x400) != 0 && (v17 & 1) == 0) {
          int v17 = IsContact(v13);
        }
        if ((a2 & 0x800) != 0 && (v17 & 1) == 0) {
          int v17 = IsData(v13);
        }
        if ((a2 & 0x1000) != 0 && (v17 & 1) == 0) {
          int v17 = IsAudio(v13, v16);
        }
        id v18 = v7;
        if (a2 & 0x2000) == 0 || (v17)
        {
          if (!v17)
          {
LABEL_71:

            id v7 = v18;
            continue;
          }
        }
        else
        {
          id v19 = v13;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          a5 = v27;
          if ((isKindOfClass & 1) == 0) {
            goto LABEL_71;
          }
        }
        id v21 = v13;
        if (!v10)
        {
          int v10 = [MEMORY[0x1E4F1CA48] array];
        }
        if ((a3 & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = [v21 string];

            id v21 = (id)v22;
            a5 = v27;
          }
        }
        long long v23 = ImageForItem(v21, a4, a5);
        long long v24 = v23;
        if (v23)
        {
          id v25 = v23;

          id v21 = v25;
          a5 = v27;
        }
        [v10 addObject:v21];

        goto LABEL_71;
      }
      if ((a2 & 0x4000) != 0 && IsItemProvider(v13))
      {
        if (!v10)
        {
          int v10 = [MEMORY[0x1E4F1CA48] array];
        }
        [v10 addObject:v13];
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v9);
LABEL_76:

  return v10;
}

uint64_t IsItemProvider(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t IsString(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsImage(void *a1, void *a2)
{
  id v6 = a1;
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v10 = IsALAsset();
      if (v10
        && (getALAssetPropertyType(),
            uint64_t v2 = objc_claimAutoreleasedReturnValue(),
            [v6 valueForProperty:v2],
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            getALAssetTypePhoto(),
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            ([v3 isEqualToString:v4] & 1) != 0))
      {
        uint64_t v8 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((IsImageFile((uint64_t)v6) & 1) != 0 || (IsPhotoAssetURL(v6) & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && IsImageData(v6, v7)
          || (_UIActivityItemIsLivePhoto(v6) & 1) != 0)
        {
          uint64_t v8 = 1;
          if (!v10) {
            goto LABEL_4;
          }
        }
        else
        {
          uint64_t v8 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F225F8], v6);
          if ((v10 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }

      goto LABEL_4;
    }
  }
  uint64_t v8 = 1;
LABEL_4:

  return v8;
}

uint64_t IsURL(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = 0;
LABEL_10:
      uint64_t v5 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F226F8], v1);
      goto LABEL_11;
    }
    id v2 = [v1 URL];
  }
  uint64_t v3 = v2;
  if (!v2) {
    goto LABEL_10;
  }
  if ([v2 isFileURL]) {
    goto LABEL_10;
  }
  uint64_t v4 = [v3 scheme];
  uint64_t v5 = 1;
  uint64_t v6 = [v4 compare:@"assets-library" options:1];

  if (!v6) {
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

uint64_t IsFileURL(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 isFileURL];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t IsCopyable(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsPrintable(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsVideo(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E4F22660]))
    {
      uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v7 = [v3 path];
      if ([v6 fileExistsAtPath:v7])
      {
        uint64_t v8 = [v3 path];
        uint64_t IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v8);
      }
      else
      {
        uint64_t IsCompatibleWithSavedPhotosAlbum = 1;
      }
    }
    else
    {
      uint64_t IsCompatibleWithSavedPhotosAlbum = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (IsVideoAssetURL(v3) & 1) != 0
      || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v11 = (void *)*MEMORY[0x1E4F22660], v4)
      && (isKindOfClass & 1) != 0
      && UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F22660]))
    {
      uint64_t IsCompatibleWithSavedPhotosAlbum = 1;
    }
    else
    {
      uint64_t IsCompatibleWithSavedPhotosAlbum = IsConformingToTypeFromItemProvider(v11, v3);
    }
  }

  return IsCompatibleWithSavedPhotosAlbum;
}

uint64_t IsPDF(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E4F22668]) != 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4)
      {
        uint64_t v6 = UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F22668]) != 0;
      }
      else
      {
        uint64_t v8 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
        if (v8)
        {
          uint64_t v9 = v8;
          CFStringRef Type = CGImageSourceGetType(v8);
          if (Type) {
            uint64_t v6 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E4F22668]) != 0;
          }
          else {
            uint64_t v6 = 0;
          }
          CFRelease(v9);
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
    }
    else
    {
      uint64_t v6 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F22668], v3);
    }
  }

  return v6;
}

uint64_t IsDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t IsPassbook(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 isFileURL])
  {
    uint64_t v2 = _UIActivityUTIForURL(v1);
    uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F224C8]];
  }
  else
  {
    uint64_t v3 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F224C8], v1);
  }

  return v3;
}

uint64_t IsContact(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 isFileURL])
  {
    uint64_t v2 = _UIActivityUTIForURL(v1);
    uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F22718]];
  }
  else
  {
    uint64_t v3 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F22718], v1);
  }

  return v3;
}

uint64_t IsData(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E4F22590], v1);
  }

  return v2;
}

uint64_t IsAudio(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E4F22538]) != 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v8 = (void *)*MEMORY[0x1E4F22538];
    if (v4 && (isKindOfClass & 1) != 0 && UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F22538])) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = IsConformingToTypeFromItemProvider(v8, v3);
    }
  }

  return v6;
}

id ImageForItem(void *a1, int a2, int a3)
{
  id v5 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_21:
    int v12 = v6;
    goto LABEL_22;
  }
  if (_UIActivityItemIsLivePhoto(v5))
  {
    id v6 = [v5 image];
    goto LABEL_21;
  }
  if (IsALAsset())
  {
    id v7 = getALAssetPropertyType();
    uint64_t v8 = [v5 valueForProperty:v7];
    uint64_t v9 = getALAssetTypePhoto();
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      if (!a2)
      {
        NewRepresentationFromPhotoAsset(v5, 0);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      id v11 = v5;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __ImageForItem_block_invoke;
      v27[3] = &unk_1E5A22040;
      id v28 = v11;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __ImageForItem_block_invoke_2;
      v25[3] = &unk_1E5A22068;
      id v26 = v28;
      int v12 = +[UIActivityItemImageRep activityItemImageRepWithAsset:v28 thumbnailProvider:v27 dataProvider:v25];

      id v13 = v28;
LABEL_9:

      goto LABEL_22;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4FB1818] imageWithCIImage:v5];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v5 scheme];
    if (v14)
    {
      int v15 = (void *)v14;
      int v16 = [v5 scheme];
      if ([v16 compare:@"assets-library" options:1])
      {
      }
      else
      {
        int v18 = IsPhotoAssetURL(v5);

        if (v18)
        {
          if (!a2)
          {
            RepresentationFromPhotoAssetURL(v5, 0);
            id v6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __ImageForItem_block_invoke_3;
          v23[3] = &unk_1E5A22040;
          id v24 = v5;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __ImageForItem_block_invoke_4;
          v21[3] = &unk_1E5A22068;
          id v22 = v24;
          int v12 = +[UIActivityItemImageRep activityItemImageRepWithAsset:v22 thumbnailProvider:v23 dataProvider:v21];

          id v13 = v24;
          goto LABEL_9;
        }
      }
    }
    if (a3 && [v5 isFileURL] && IsImageFile((uint64_t)v5))
    {
      id v19 = (void *)MEMORY[0x1E4FB1818];
      int v20 = [v5 path];
      int v12 = [v19 imageWithContentsOfFile:v20];
    }
    else
    {
      int v12 = 0;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  int v12 = 0;
  if (objc_opt_isKindOfClass())
  {
    if (a3)
    {
      int v12 = 0;
      if (IsImageData(v5, 0))
      {
        id v6 = [MEMORY[0x1E4FB1818] imageWithData:v5];
        goto LABEL_21;
      }
    }
  }
LABEL_22:

  return v12;
}

BOOL _UIActivityHasAtMoreThan(void *a1, uint64_t a2, uint64_t a3)
{
  return NumberOfItems(a1, a3, a2) > a3;
}

uint64_t NumberOfItems(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_31;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v11, 0, (void)v17);
      }
      else
      {
        int v12 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v11 allValues];
        v8 += NumberOfItems(v13, a2, a3);

        uint64_t v14 = v8;
        if (v8 > a2) {
          goto LABEL_29;
        }
      }
      else
      {
        if (a3 > 63)
        {
          if (a3 == 64)
          {
            if ((IsVideo(v11, v12) & 1) == 0) {
              goto LABEL_26;
            }
          }
          else if (a3 != 4096 || !IsAudio(v11, v12))
          {
            goto LABEL_26;
          }
        }
        else if (a3 == 2)
        {
          if ((IsImage(v11, v12) & 1) == 0) {
            goto LABEL_26;
          }
        }
        else if (a3 != 4 || (IsURL(v11) & 1) == 0)
        {
          goto LABEL_26;
        }
        uint64_t v14 = v8 + 1;
        if (v8++ >= a2)
        {
LABEL_29:

          uint64_t v8 = v14;
          goto LABEL_31;
        }
      }
LABEL_26:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_31:

  return v8;
}

uint64_t _UIActivityItemCountOfType(void *a1, uint64_t a2)
{
  return NumberOfItems(a1, 0x7FFFFFFFLL, a2);
}

id _UIActivityItemsGetStrings(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_26;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = [v9 allValues];
        id v11 = _UIActivityItemsGetStringsAndURLs(v10, a2);

        if ([v11 count])
        {
          if (!v6)
          {
            uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
          }
          [v6 addObjectsFromArray:v11];
        }
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a2)
        {
LABEL_12:
          id v12 = v9;
        }
        else
        {
          id v12 = [v9 string];
        }
        id v11 = v12;
        if (!v12) {
          goto LABEL_18;
        }
        if (!v6)
        {
          uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
        }
        [v6 addObject:v11];
LABEL_17:
      }
LABEL_18:
      ++v8;
    }
    while (v5 != v8);
    uint64_t v13 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    uint64_t v5 = v13;
  }
  while (v13);
LABEL_26:

  return v6;
}

id _UIActivityItemsGetStringsAndURLs(void *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_33;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v19;
  unint64_t v8 = 0x1E4F1C000uLL;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v3);
      }
      int v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 allValues];
        id v12 = _UIActivityItemsGetStringsAndURLs(v11, a2);

        if ([v12 count])
        {
          if (!v6)
          {
            uint64_t v6 = [*(id *)(v8 + 2632) array];
          }
          [v6 addObjectsFromArray:v12];
        }
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a2)
        {
LABEL_12:
          id v13 = v10;
        }
        else
        {
          id v13 = [v10 string];
        }
        id v12 = v13;
        if (!v13) {
          goto LABEL_24;
        }
LABEL_14:
        if (!v6)
        {
          uint64_t v6 = [*(id *)(v8 + 2632) array];
        }
        if (([v6 containsObject:v12] & 1) == 0) {
          [v6 addObject:v12];
        }
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 || ([v10 isFileURL])
      {
        id v12 = 0;
        goto LABEL_24;
      }
      uint64_t v14 = [v10 scheme];
      uint64_t v15 = [v14 compare:@"assets-library" options:1];

      if (!v15)
      {
        id v12 = 0;
        unint64_t v8 = 0x1E4F1C000;
        goto LABEL_24;
      }
      id v12 = [v10 absoluteString];
      unint64_t v8 = 0x1E4F1C000;
      if (v12) {
        goto LABEL_14;
      }
LABEL_24:

      ++v9;
    }
    while (v5 != v9);
    uint64_t v16 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v5 = v16;
  }
  while (v16);
LABEL_33:

  return v6;
}

id _UIActivityItemsGetWebURLs(void *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 allValues];
          id v12 = _UIActivityItemsGetWebURLs(v11, a2);

          if ([v12 count]) {
            [v4 addObjectsFromArray:v12];
          }
LABEL_9:

          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "isFileURL", (void)v18) & 1) == 0)
        {
          id v13 = [v10 scheme];
          uint64_t v14 = [v13 compare:@"assets-library" options:1];

          if (v14)
          {
            id v15 = v10;
            id v12 = v15;
            if (a2)
            {
              uint64_t v16 = [v15 absoluteString];

              id v12 = (void *)v16;
            }
            [v4 addObject:v12];
            goto LABEL_9;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

id _UIActivityItemsGetImages(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 allValues];
          id v13 = _UIActivityItemsGetImages(v12, a2, a3);

          if ([v13 count])
          {
            if (!v8)
            {
              uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
            }
            [v8 addObjectsFromArray:v13];
          }
        }
        else
        {
          id v13 = ImageForItem(v11, a2, a3);
          if (v13)
          {
            if (!v8)
            {
              uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
            }
            [v8 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id _UIActivityItemsGetImagesAndVideos(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v2)
  {
    uint64_t v4 = 0;
    goto LABEL_41;
  }
  uint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v19;
  unint64_t v6 = 0x1E4F1C000uLL;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 allValues];
        int v10 = _UIActivityItemsGetImagesAndVideos();

        if ([v10 count])
        {
          if (!v4)
          {
            uint64_t v4 = [*(id *)(v6 + 2632) array];
          }
          [v4 addObjectsFromArray:v10];
        }
        goto LABEL_20;
      }
      if (!_UIActivityItemIsLivePhoto(v8))
      {
        int v10 = ImageForItem(v8, 0, 0);
        if (v10)
        {
          if (!v4)
          {
            uint64_t v4 = [*(id *)(v6 + 2632) array];
          }
          id v11 = v4;
          id v12 = v10;
LABEL_19:
          [v11 addObject:v12];
LABEL_20:

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && IsImageData(v8, 0))
        {
          if (!v4) {
            goto LABEL_26;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !IsFileURL(v8)) {
            goto LABEL_20;
          }
          id v13 = [v8 path];
          BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v13);

          if (IsCompatibleWithSavedPhotosAlbum)
          {
            unint64_t v6 = 0x1E4F1C000uLL;
            if (!v4)
            {
              uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
            }
            long long v15 = [v8 path];
            [v4 addObject:v15];

            goto LABEL_20;
          }
          unint64_t v6 = 0x1E4F1C000;
          if (!IsImageFile((uint64_t)v8)) {
            goto LABEL_20;
          }
          if (!v4)
          {
LABEL_26:
            uint64_t v4 = [*(id *)(v6 + 2632) array];
          }
        }
        id v11 = v4;
        id v12 = v8;
        goto LABEL_19;
      }
      if (!v4)
      {
        uint64_t v4 = [*(id *)(v6 + 2632) array];
      }
      [v4 addObject:v8];
LABEL_21:
      ++v7;
    }
    while (v3 != v7);
    uint64_t v16 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v3 = v16;
  }
  while (v16);
LABEL_41:

  return v4;
}

uint64_t _UIActivityItemIsLivePhoto(void *a1)
{
  id v1 = a1;
  if (NSClassFromString(&cfstr_Phlivephoto.isa)) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

BOOL IsImageData(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  CFDataRef v5 = +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:v3];
  if (v4
    || (+[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v3 activityType:0], (uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v6 = UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;
  }
  else
  {
    uint64_t v8 = CGImageSourceCreateWithData(v5, 0);
    if (v8)
    {
      uint64_t v9 = v8;
      CFStringRef Type = CGImageSourceGetType(v8);
      if (Type) {
        BOOL v6 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;
      }
      else {
        BOOL v6 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

uint64_t IsImageFile(uint64_t a1)
{
  id v1 = +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:a1];
  if ([v1 isFileURL])
  {
    _UIActivityUTIForURL(v1);
    CFStringRef v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    id v3 = (__CFString *)v2;
    if (v2
      && UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225F8])
      && (CGImageSourceRef v4 = CGImageSourceCreateWithURL((CFURLRef)v1, 0)) != 0)
    {
      CFRelease(v4);
      uint64_t v5 = 1;
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

  return v5;
}

id _UIActivityItemsGetAttachments(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v2)
  {
    CGImageSourceRef v4 = 0;
    goto LABEL_30;
  }
  uint64_t v3 = v2;
  CGImageSourceRef v4 = 0;
  uint64_t v5 = *(void *)v13;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v7 allValues];
        uint64_t v9 = _UIActivityItemsGetAttachments();

        if ([v9 count])
        {
          if (!v4)
          {
            CGImageSourceRef v4 = [MEMORY[0x1E4F1CA48] array];
          }
          [v4 addObjectsFromArray:v9];
        }
LABEL_11:

        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (((objc_opt_isKindOfClass() & 1) == 0
           || (IsFileURL(v7) & 1) == 0 && (IsPhotoAssetURL(v7) & 1) == 0 && !IsVideoAssetURL(v7))
          && !IsItemProvider(v7))
        {
          uint64_t v9 = ImageForItem(v7, 0, 0);
          if (v9)
          {
            if (!v4)
            {
              CGImageSourceRef v4 = [MEMORY[0x1E4F1CA48] array];
            }
            [v4 addObject:v9];
          }
          goto LABEL_11;
        }
      }
      if (!v4)
      {
        CGImageSourceRef v4 = [MEMORY[0x1E4F1CA48] array];
      }
      [v4 addObject:v7];
LABEL_21:
      ++v6;
    }
    while (v3 != v6);
    uint64_t v10 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    uint64_t v3 = v10;
  }
  while (v10);
LABEL_30:

  return v4;
}

uint64_t IsPhotoAssetURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:v1];
  uint64_t v3 = [v2 scheme];
  if (v3 && (CGImageSourceRef v4 = v3, v5 = [v3 compare:@"assets-library" options:1], v4, !v5))
  {
    CFStringRef v7 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v1 activityType:0];
    uint64_t v8 = (__CFString *)v7;
    if (v7)
    {
      uint64_t v6 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;
    }
    else
    {
      uint64_t v9 = getALAssetTypePhoto();
      uint64_t v6 = IsAssetURL(v1, v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t IsVideoAssetURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:v1];
  uint64_t v3 = [v2 scheme];
  if (v3 && (CGImageSourceRef v4 = v3, v5 = [v3 compare:@"assets-library" options:1], v4, !v5))
  {
    CFStringRef v7 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v1 activityType:0];
    uint64_t v8 = (__CFString *)v7;
    if (v7)
    {
      uint64_t v6 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E4F22660]) != 0;
    }
    else
    {
      uint64_t v9 = getALAssetTypeVideo();
      uint64_t v6 = IsAssetURL(v1, v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id _UIActivityItemsGetUTIs(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v19 = a2;
  CGImageSourceRef v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    long long v18 = (void *)*MEMORY[0x1E4F226F8];
    uint64_t v9 = *MEMORY[0x1E4F22688];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = ___UIActivityItemsGetUTIs_block_invoke;
          v20[3] = &unk_1E5A21E60;
          id v21 = v4;
          [v11 enumerateKeysAndObjectsUsingBlock:v20];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v4 addObject:v9];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = v9;
              id v13 = v11;
              if ([v13 isFileURL])
              {
                _UIActivityUTIForURL(v13);
                id v14 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v14 = v18;
              }
              uint64_t v16 = v14;
              if (v14) {
                [v4 addObject:v14];
              }

              uint64_t v9 = v12;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v15 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v11 activityType:v19];
                if (v15) {
                  [v4 addObject:v15];
                }
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return v4;
}

__CFString *_UIActivityUTIForURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 pathExtension];
  id v3 = [v2 lowercaseString];

  if ([(__CFString *)v3 isEqualToString:@"log"])
  {
    CGImageSourceRef v4 = (__CFString *)*MEMORY[0x1E4F22688];
  }
  else
  {
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v3, 0);
    uint64_t v6 = (__CFString *)PreferredIdentifierForTag;
    if (PreferredIdentifierForTag && UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E4F22530])) {
      uint64_t v7 = (__CFString *)softLinkQLTypeCopyUTIForURLAndMimeType_0(v1, 0);
    }
    else {
      uint64_t v7 = v6;
    }
    CGImageSourceRef v4 = v7;
  }
  return v4;
}

id _itemLoaderQueue()
{
  if (_itemLoaderQueue_onceToken != -1) {
    dispatch_once(&_itemLoaderQueue_onceToken, &__block_literal_global_516);
  }
  v0 = (void *)_itemLoaderQueue_queue;
  return v0;
}

void ___itemLoaderQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ShareSheet.itemLoaderQueue", v2);
  id v1 = (void *)_itemLoaderQueue_queue;
  _itemLoaderQueue_queue = (uint64_t)v0;
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke(uint64_t a1, uint64_t a2)
{
  return _loadItemProvidersFromActivityItemsStartingAtIndex(*(void *)(a1 + 32), *(void *)(a1 + 64) + 1, a2, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_522(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_524(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = share_sheet_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_524_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 67240192;
    int v19 = v9;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as URL for copy type identifier", buf, 8u);
  }

  uint64_t v10 = _itemLoaderQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_525;
  block[3] = &unk_1E5A21ED8;
  id v13 = v5;
  id v16 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  id v11 = v5;
  dispatch_async(v10, block);
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_525(void *a1)
{
  if (a1[4]) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1[8] + 16);
  return v2();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_527(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = share_sheet_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_527_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 67240192;
    int v19 = v9;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as a URL", buf, 8u);
  }

  uint64_t v10 = _itemLoaderQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_528;
  block[3] = &unk_1E5A21ED8;
  id v13 = v5;
  id v16 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  id v11 = v5;
  dispatch_async(v10, block);
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_528(void *a1)
{
  if (a1[4]) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1[8] + 16);
  return v2();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_529(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  id v38 = 0;
  id v38 = *(id *)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_529_cold_1();
    }

    uint64_t v10 = _itemLoaderQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_530;
    block[3] = &unk_1E5A21F28;
    id v35 = *(id *)(a1 + 56);
    uint64_t v36 = v37;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)&uint8_t buf[4] = v12;
      LOWORD(v40) = 2114;
      *(void *)((char *)&v40 + 2) = v13;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as a file of type %{public}@", buf, 0x12u);
    }

    if (v7)
    {
      *(void *)buf = 0;
      *(void *)&long long v40 = buf;
      *((void *)&v40 + 1) = 0x3032000000;
      id v41 = __Block_byref_object_copy__1;
      uint64_t v42 = __Block_byref_object_dispose__1;
      id v43 = 0;
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
      uint64_t v15 = v40;
      obuint64_t j = *(id *)(v40 + 40);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_532;
      v23[3] = &unk_1E5A21F78;
      id v16 = v7;
      char v32 = a3;
      long long v29 = v37;
      long long v30 = buf;
      id v17 = *(void **)(a1 + 64);
      uint64_t v31 = *(void *)(a1 + 72);
      uint64_t v18 = *(void *)(a1 + 40);
      id v24 = v16;
      uint64_t v25 = v18;
      id v27 = v17;
      id v26 = *(id *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      [v14 coordinateReadingItemAtURL:v16 options:1 error:&obj byAccessor:v23];
      objc_storeStrong((id *)(v15 + 40), obj);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      int v19 = _itemLoaderQueue();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_2;
      v20[3] = &unk_1E5A21F28;
      id v21 = *(id *)(a1 + 56);
      long long v22 = v37;
      dispatch_async(v19, v20);
    }
  }
  _Block_object_dispose(v37, 8);
}

void sub_1A0B0613C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
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

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_530(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_532(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGImageSourceRef v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    if (!v5) {
      goto LABEL_12;
    }
  }
  if (!*(unsigned char *)(a1 + 96))
  {
    id v6 = [v5 lastPathComponent];
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v9 = [v8 temporaryDirectory];

      uint64_t v10 = _newTempDir(v9, @"com.apple.ShareSheet.Activity");
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
    uint64_t v13 = (void *)_newTempDir(v7, @"com.apple.ShareSheet.representation");
    id v14 = [v13 URLByAppendingPathComponent:v6 isDirectory:0];
    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    obuint64_t j = *(id *)(v16 + 40);
    int v17 = [v15 moveItemAtURL:v5 toURL:v14 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);

    if (v17)
    {
      uint64_t v18 = v5;
      id v5 = v14;
    }
    else
    {
      uint64_t v18 = share_sheet_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_532_cold_1();
      }
    }
  }
LABEL_12:
  int v19 = _itemLoaderQueue();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_536;
  v23[3] = &unk_1E5A21F50;
  id v24 = v5;
  id v26 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  id v27 = v20;
  uint64_t v28 = v21;
  long long v22 = v5;
  dispatch_async(v19, v23);
}

uint64_t _newTempDir(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CGImageSourceRef v4 = [a1 path];
  id v5 = [NSString stringWithFormat:@".%@.XXXXXX", v3];

  id v6 = [v4 stringByAppendingPathComponent:v5];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v9 = v14;
  uint64_t v10 = 0;
  if (v8)
  {
    bzero(v15, 0x401uLL);
    [v6 getFileSystemRepresentation:v15 maxLength:1024];
    if (mkdtemp(v15))
    {
      uint64_t v11 = [NSString stringWithUTF8String:v15];
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:1];
    }
    else
    {
      uint64_t v11 = share_sheet_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        _newTempDir_cold_2(v11);
      }
      uint64_t v10 = 0;
    }
  }
  if (v9)
  {
    uint64_t v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      _newTempDir_cold_1((uint64_t)v9, v12);
    }
  }
  return v10;
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_536(void *a1)
{
  if (a1[4]) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1[7] + 16);
  return v2();
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  CGImageSourceRef v4 = _itemLoaderQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_4;
  block[3] = &unk_1E5A21ED8;
  id v7 = v3;
  id v10 = a1[6];
  id v8 = a1[4];
  id v11 = a1[7];
  id v9 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_4(void *a1)
{
  if (a1[4]) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1[8] + 16);
  return v2();
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_539(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_540(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_541(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ___loadItemProviderInline_block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)_loadItemProviderInline_loadableClasses;
  _loadItemProviderInline_loadableClasses = v0;
}

void ___loadItemProviderInline_block_invoke_550(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = share_sheet_log();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___loadItemProviderInline_block_invoke_550_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromClass(*(Class *)(a1 + 40));
    v10[0] = 67240450;
    v10[1] = MEMORY[0x1E4F148E0];
    __int16 v11 = 2114;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as class %{public}@", (uint8_t *)v10, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

Class initSFUIActivityImageProvider()
{
  if (SharingUILibrary_sOnce != -1) {
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_557);
  }
  Class result = objc_getClass("SFUIActivityImageProvider");
  classSFUIActivityImageProvider = (uint64_t)result;
  getSFUIActivityImageProviderClass = (uint64_t (*)())SFUIActivityImageProviderFunction;
  return result;
}

id SFUIActivityImageProviderFunction()
{
  return (id)classSFUIActivityImageProvider;
}

void *__SharingUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t IsALAsset()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = [v1 isEqualToString:@"ALAsset"];

  return v2;
}

uint64_t IsConformingToTypeFromItemProvider(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (IsItemProvider(v4)) {
    uint64_t v5 = [v4 hasItemConformingToTypeIdentifier:v3];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id initValALAssetPropertyType()
{
  if (AssetsLibraryLibrary_sOnce != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_565);
  }
  uint64_t v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetPropertyType");
  if (v0) {
    objc_storeStrong((id *)&constantValALAssetPropertyType, *v0);
  }
  getALAssetPropertyCFStringRef Type = (uint64_t (*)())ALAssetPropertyTypeFunction;
  uint64_t v1 = (void *)constantValALAssetPropertyType;
  return v1;
}

id ALAssetPropertyTypeFunction()
{
  return (id)constantValALAssetPropertyType;
}

void *__AssetsLibraryLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/AssetsLibrary.framework/AssetsLibrary", 2);
  AssetsLibraryLibrary_sLib = (uint64_t)result;
  return result;
}

id initValALAssetTypePhoto()
{
  if (AssetsLibraryLibrary_sOnce != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_565);
  }
  uint64_t v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetTypePhoto");
  if (v0) {
    objc_storeStrong((id *)&constantValALAssetTypePhoto, *v0);
  }
  getALAssetTypePhoto = (uint64_t (*)())ALAssetTypePhotoFunction;
  uint64_t v1 = (void *)constantValALAssetTypePhoto;
  return v1;
}

id ALAssetTypePhotoFunction()
{
  return (id)constantValALAssetTypePhoto;
}

uint64_t __ImageForItem_block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v2 = [*(id *)(a1 + 32) thumbnail];
  return [v1 imageWithCGImage:v2];
}

id __ImageForItem_block_invoke_2(uint64_t a1)
{
  int v2 = dyld_program_sdk_at_least();
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    NewRepresentationFromPhotoAsset(v3, 2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = [v3 defaultRepresentation];
    uint64_t v6 = [v5 size];
    id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:v6];
    id v8 = v7;
    if (!v7
      || (id v4 = v7,
          !objc_msgSend(v5, "getBytes:fromOffset:length:error:", objc_msgSend(v4, "mutableBytes"), 0, v6, 0)))
    {

      id v4 = 0;
    }
  }
  return v4;
}

id NewRepresentationFromPhotoAsset(void *a1, int a2)
{
  id v3 = a1;
  id v4 = getALAssetPropertyType();
  uint64_t v5 = [v3 valueForProperty:v4];
  uint64_t v6 = getALAssetTypePhoto();
  int v7 = [v5 isEqualToString:v6];

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  id v8 = [v3 defaultRepresentation];
  if (v8)
  {
    switch(a2)
    {
      case 0:
        id v11 = objc_alloc(MEMORY[0x1E4FB1818]);
        uint64_t v12 = [v8 fullScreenImage];
        [v8 scale];
        uint64_t v9 = [v11 initWithCGImage:v12 scale:0 orientation:v13];
        goto LABEL_10;
      case 2:
        id v14 = objc_alloc(MEMORY[0x1E4FB1818]);
        uint64_t v15 = [v8 fullScreenImage];
        [v8 scale];
        int v17 = (UIImage *)[v14 initWithCGImage:v15 scale:0 orientation:v16];
        CFStringRef v18 = (const __CFString *)[v8 UTI];
        if (UTTypeConformsTo(v18, (CFStringRef)*MEMORY[0x1E4F22610])) {
          UIImageJPEGRepresentation(v17, 0.8);
        }
        else {
        id v10 = UIImagePNGRepresentation(v17);
        }

        goto LABEL_15;
      case 1:
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v3, "thumbnail"));
LABEL_10:
        id v10 = (void *)v9;
        goto LABEL_15;
    }
  }
  id v10 = 0;
LABEL_15:

LABEL_16:
  return v10;
}

id __ImageForItem_block_invoke_3(uint64_t a1)
{
  return RepresentationFromPhotoAssetURL(*(void **)(a1 + 32), 1);
}

id RepresentationFromPhotoAssetURL(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__1;
  long long v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v4 = objc_alloc_init(getALAssetsLibraryClass());
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __RepresentationFromPhotoAssetURL_block_invoke;
  block[3] = &unk_1E5A220E0;
  id v14 = v4;
  id v15 = v3;
  int v18 = a2;
  dispatch_semaphore_t v16 = v5;
  int v17 = &v19;
  int v7 = v5;
  id v8 = v3;
  id v9 = v4;
  dispatch_async(v6, block);

  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v10);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void sub_1A0B0711C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __ImageForItem_block_invoke_4(uint64_t a1)
{
  return RepresentationFromPhotoAssetURL(*(void **)(a1 + 32), 2);
}

void __RepresentationFromPhotoAssetURL_block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __RepresentationFromPhotoAssetURL_block_invoke_2;
  v8[3] = &unk_1E5A22090;
  int v10 = *(_DWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v9 = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __RepresentationFromPhotoAssetURL_block_invoke_3;
  v6[3] = &unk_1E5A220B8;
  id v7 = *(id *)(a1 + 48);
  [v2 assetForURL:v3 resultBlock:v8 failureBlock:v6];
}

void __RepresentationFromPhotoAssetURL_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = NewRepresentationFromPhotoAsset(a2, *(_DWORD *)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32)))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

intptr_t __RepresentationFromPhotoAssetURL_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class initALAssetsLibrary()
{
  if (AssetsLibraryLibrary_sOnce != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_565);
  }
  Class result = objc_getClass("ALAssetsLibrary");
  classALAssetsLibrary = (uint64_t)result;
  getALAssetsLibraryClass = (uint64_t (*)(void))ALAssetsLibraryFunction;
  return result;
}

id ALAssetsLibraryFunction()
{
  return (id)classALAssetsLibrary;
}

uint64_t IsAssetURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:v3];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v6 = objc_alloc_init((Class)getALAssetsLibraryClass());
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IsAssetURL_block_invoke;
  block[3] = &unk_1E5A22130;
  id v17 = v6;
  id v18 = v5;
  dispatch_semaphore_t v20 = v7;
  uint64_t v21 = &v22;
  id v19 = v4;
  long long v9 = v7;
  id v10 = v4;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v8, block);

  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v13);
  uint64_t v14 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void sub_1A0B074E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __IsAssetURL_block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __IsAssetURL_block_invoke_2;
  v6[3] = &unk_1E5A22108;
  uint64_t v9 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __IsAssetURL_block_invoke_3;
  v4[3] = &unk_1E5A220B8;
  id v5 = *(id *)(a1 + 56);
  [v2 assetForURL:v3 resultBlock:v6 failureBlock:v4];
}

intptr_t __IsAssetURL_block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = (void (*)(void))getALAssetPropertyType;
  id v4 = a2;
  id v5 = v3();
  id v6 = [v4 valueForProperty:v5];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v6 isEqualToString:a1[4]];
  id v7 = a1[5];
  return dispatch_semaphore_signal(v7);
}

intptr_t __IsAssetURL_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id initValALAssetTypeVideo()
{
  if (AssetsLibraryLibrary_sOnce != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_565);
  }
  uint64_t v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetTypeVideo");
  if (v0) {
    objc_storeStrong((id *)&constantValALAssetTypeVideo, *v0);
  }
  getALAssetTypeVideo = (uint64_t (*)())ALAssetTypeVideoFunction;
  uint64_t v1 = (void *)constantValALAssetTypeVideo;
  return v1;
}

id ALAssetTypeVideoFunction()
{
  return (id)constantValALAssetTypeVideo;
}

uint64_t initQLTypeCopyUTIForURLAndMimeType_0(void *a1, void *a2)
{
  uint64_t v3 = QuickLookLibrary_sOnce_0;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_0, &__block_literal_global_581);
  }
  softLinkQLTypeCopyUTIForURLAndMimeType_0 = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib_0, "QLTypeCopyUTIForURLAndMimeType");
  uint64_t v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType_0)(v5, v4);

  return v6;
}

void *__QuickLookLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1A0B08AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B08FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _UIActivityIsAirdrop(void *a1)
{
  uint64_t v1 = [a1 activityType];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

  return v2;
}

Class initLPLinkMetadata()
{
  if (LinkPresentationLibrary_sOnce != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce, &__block_literal_global_9);
  }
  Class result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata = (uint64_t)result;
  getLPLinkMetadataClass_0 = (uint64_t (*)())LPLinkMetadataFunction;
  return result;
}

id LPLinkMetadataFunction()
{
  return (id)classLPLinkMetadata;
}

void *__LinkPresentationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSFUIActivityImageProvider_0()
{
  if (SharingUILibrary_sOnce_0 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_0, &__block_literal_global_10);
  }
  Class result = objc_getClass("SFUIActivityImageProvider");
  classSFUIActivityImageProvider_0 = (uint64_t)result;
  getSFUIActivityImageProviderClass_0 = (uint64_t (*)())SFUIActivityImageProviderFunction_0;
  return result;
}

id SFUIActivityImageProviderFunction_0()
{
  return (id)classSFUIActivityImageProvider_0;
}

void *__SharingUILibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initIMSharedMessageSendingUtilities()
{
  if (IMSharedUtilitiesLibrary_sOnce != -1) {
    dispatch_once(&IMSharedUtilitiesLibrary_sOnce, &__block_literal_global_182);
  }
  Class result = objc_getClass("IMSharedMessageSendingUtilities");
  classIMSharedMessageSendingUtilities = (uint64_t)result;
  getIMSharedMessageSendingUtilitiesClass = (uint64_t (*)())IMSharedMessageSendingUtilitiesFunction;
  return result;
}

id IMSharedMessageSendingUtilitiesFunction()
{
  return (id)classIMSharedMessageSendingUtilities;
}

void *__IMSharedUtilitiesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 2);
  IMSharedUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initMCProfileConnection_1()
{
  if (ManagedConfigurationLibrary_sOnce_1 != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce_1, &__block_literal_global_186);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_1 = (uint64_t)result;
  getMCProfileConnectionClass_1 = (uint64_t (*)())MCProfileConnectionFunction_1;
  return result;
}

id MCProfileConnectionFunction_1()
{
  return (id)classMCProfileConnection_1;
}

void *__ManagedConfigurationLibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initMFMessageComposeViewController()
{
  if (MessageUILibrary_sOnce_0 != -1) {
    dispatch_once(&MessageUILibrary_sOnce_0, &__block_literal_global_190);
  }
  Class result = objc_getClass("MFMessageComposeViewController");
  classMFMessageComposeViewController = (uint64_t)result;
  getMFMessageComposeViewControllerClass = (uint64_t (*)())MFMessageComposeViewControllerFunction;
  return result;
}

id MFMessageComposeViewControllerFunction()
{
  return (id)classMFMessageComposeViewController;
}

void *__MessageUILibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  MessageUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initLPSharingMetadataWrapper()
{
  if (LinkPresentationLibrary_sOnce_0 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_0, &__block_literal_global_194);
  }
  Class result = objc_getClass("LPSharingMetadataWrapper");
  classLPSharingMetadataWrapper = (uint64_t)result;
  getLPSharingMetadataWrapperClass = (uint64_t (*)())LPSharingMetadataWrapperFunction;
  return result;
}

id LPSharingMetadataWrapperFunction()
{
  return (id)classLPSharingMetadataWrapper;
}

void *__LinkPresentationLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1A0B0D25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B0D458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSceneWorkspaceClass_block_invoke(uint64_t a1)
{
  FrontBoardLibrary();
  Class result = objc_getClass("FBSceneWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFBSceneWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFBSceneWorkspaceClass_block_invoke_cold_1();
    return (Class)__FrontBoardLibraryCore_block_invoke();
  }
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A0B0FA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B11614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B16984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B18390(_Unwind_Exception *a1)
{
  if (v2) {
    objc_destroyWeak(v1);
  }
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1A0B18D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initSFUIActivityImageProvider_1()
{
  if (SharingUILibrary_sOnce_1 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_1, &__block_literal_global_712);
  }
  Class result = objc_getClass("SFUIActivityImageProvider");
  classSFUIActivityImageProvider_1 = (uint64_t)result;
  getSFUIActivityImageProviderClass_1 = (uint64_t (*)())SFUIActivityImageProviderFunction_1;
  return result;
}

id SFUIActivityImageProviderFunction_1()
{
  return (id)classSFUIActivityImageProvider_1;
}

void *__SharingUILibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initSFUIPeopleSuggestionImageProvider()
{
  if (SharingUILibrary_sOnce_1 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_1, &__block_literal_global_712);
  }
  Class result = objc_getClass("SFUIPeopleSuggestionImageProvider");
  classSFUIPeopleSuggestionImageProvider = (uint64_t)result;
  getSFUIPeopleSuggestionImageProviderClass = (uint64_t (*)())SFUIPeopleSuggestionImageProviderFunction;
  return result;
}

id SFUIPeopleSuggestionImageProviderFunction()
{
  return (id)classSFUIPeopleSuggestionImageProvider;
}

Class initLPLinkView()
{
  if (LinkPresentationLibrary_sOnce_1 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_1, &__block_literal_global_717);
  }
  Class result = objc_getClass("LPLinkView");
  classLPLinkView = (uint64_t)result;
  getLPLinkViewClass = (uint64_t (*)())LPLinkViewFunction;
  return result;
}

id LPLinkViewFunction()
{
  return (id)classLPLinkView;
}

void *__LinkPresentationLibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initPUCarouselSharingViewController()
{
  if (PhotosUIPrivateLibrary_sOnce != -1) {
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_721);
  }
  Class result = objc_getClass("PUCarouselSharingViewController");
  classPUCarouselSharingViewController = (uint64_t)result;
  getPUCarouselSharingViewControllerClass = (uint64_t (*)())PUCarouselSharingViewControllerFunction;
  return result;
}

id PUCarouselSharingViewControllerFunction()
{
  return (id)classPUCarouselSharingViewController;
}

void *__PhotosUIPrivateLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PhotosUIPrivate.framework/PhotosUIPrivate", 2);
  PhotosUIPrivateLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSFUITTRReporter()
{
  if (SharingUILibrary_sOnce_1 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_1, &__block_literal_global_712);
  }
  Class result = objc_getClass("SFUITTRReporter");
  classSFUITTRReporter = (uint64_t)result;
  getSFUITTRReporterClass = (uint64_t (*)())SFUITTRReporterFunction;
  return result;
}

id SFUITTRReporterFunction()
{
  return (id)classSFUITTRReporter;
}

Class initLPLinkRendererSizeClassParameters()
{
  if (LinkPresentationLibrary_sOnce_1 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_1, &__block_literal_global_717);
  }
  Class result = objc_getClass("LPLinkRendererSizeClassParameters");
  classLPLinkRendererSizeClassParameters = (uint64_t)result;
  getLPLinkRendererSizeClassParametersClass = (uint64_t (*)())LPLinkRendererSizeClassParametersFunction;
  return result;
}

id LPLinkRendererSizeClassParametersFunction()
{
  return (id)classLPLinkRendererSizeClassParameters;
}

Class initRPTTestRunner()
{
  if (RecapPerformanceTestingLibrary_sOnce != -1) {
    dispatch_once(&RecapPerformanceTestingLibrary_sOnce, &__block_literal_global_727);
  }
  Class result = objc_getClass("RPTTestRunner");
  classRPTTestRunner = (uint64_t)result;
  getRPTTestRunnerClass = (uint64_t (*)())RPTTestRunnerFunction;
  return result;
}

id RPTTestRunnerFunction()
{
  return (id)classRPTTestRunner;
}

void *__RecapPerformanceTestingLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/RecapPerformanceTesting.framework/RecapPerformanceTesting", 2);
  RecapPerformanceTestingLibrary_sLib = (uint64_t)result;
  return result;
}

Class initRPTScrollViewTestParameters()
{
  if (RecapPerformanceTestingLibrary_sOnce != -1) {
    dispatch_once(&RecapPerformanceTestingLibrary_sOnce, &__block_literal_global_727);
  }
  Class result = objc_getClass("RPTScrollViewTestParameters");
  classRPTScrollViewTestParameters = (uint64_t)result;
  getRPTScrollViewTestParametersClass = (uint64_t (*)())RPTScrollViewTestParametersFunction;
  return result;
}

id RPTScrollViewTestParametersFunction()
{
  return (id)classRPTScrollViewTestParameters;
}

Class initLPLinkMetadata_0()
{
  if (LinkPresentationLibrary_sOnce_2 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_2, &__block_literal_global_14);
  }
  Class result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata_0 = (uint64_t)result;
  getLPLinkMetadataClass_1 = (uint64_t (*)())LPLinkMetadataFunction_0;
  return result;
}

id LPLinkMetadataFunction_0()
{
  return (id)classLPLinkMetadata_0;
}

void *__LinkPresentationLibrary_block_invoke_2()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_2 = (uint64_t)result;
  return result;
}

uint64_t initPLLogRegisteredEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (PowerLogLibrary_sOnce != -1) {
    dispatch_once(&PowerLogLibrary_sOnce, &__block_literal_global_581_0);
  }
  id v8 = (uint64_t (*)())dlsym((void *)PowerLogLibrary_sLib, "PLLogRegisteredEvent");
  softLinkPLLogRegisteredEvent = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

void *__PowerLogLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
  PowerLogLibrary_sLib = (uint64_t)result;
  return result;
}

id _ShareSheetBundle()
{
  uint64_t v0 = (void *)_ShareSheetBundle_sharingUIBundle;
  if (!_ShareSheetBundle_sharingUIBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v2 = (void *)_ShareSheetBundle_sharingUIBundle;
    _ShareSheetBundle_sharingUIBundle = v1;

    uint64_t v0 = (void *)_ShareSheetBundle_sharingUIBundle;
  }
  return v0;
}

uint64_t _SharingUIAuditTokenForCurrentProcess@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)a1, &task_info_outCnt);
}

id _ShareSheetBundleIDFromAuditToken()
{
  if (CPCopyBundleIdentifierAndTeamFromAuditToken()) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = (void *)CPCopyBundleIdentifierFromAuditToken();
  }
  if (!v0) {
    NSLog(&cfstr_CannotGetBundl.isa);
  }
  return v0;
}

uint64_t _ShareSheetCurrentDeviceClassFromPresentationStyle(int a1)
{
  int v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;

  if (!_ShareSheetPlatformPrefersPopover())
  {
    if (v6 == 568.0 && v4 == 320.0) {
      return 0;
    }
    BOOL v11 = v6 == 693.0 && v4 == 320.0;
    if (!v11 && (v6 != 667.0 || v4 != 375.0))
    {
      if (v6 == 736.0 && v4 == 414.0) {
        return 2;
      }
      if (v6 == 812.0 && v4 == 375.0) {
        return 3;
      }
      if (v6 == 844.0 && v4 == 390.0 || v6 == 852.0 && v4 == 393.0) {
        return 4;
      }
      if (v6 == 896.0 && v4 == 414.0) {
        return 5;
      }
      if (v6 == 926.0 && v4 == 428.0 || v6 == 932.0 && v4 == 430.0) {
        return 6;
      }
      id v12 = share_sheet_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        _ShareSheetCurrentDeviceClassFromPresentationStyle_cold_1(v12, v4, v6);
      }
    }
    return 1;
  }
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 6)
  {
    if (a1) {
      return 9;
    }
    else {
      return 10;
    }
  }
  else if (v4 == 768.0)
  {
    return 7;
  }
  else
  {
    return 8;
  }
}

BOOL _ShareSheetPlatformPrefersPopover()
{
  uint64_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  return (v1 & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

id share_sheet_log()
{
  if (share_sheet_log_onceToken != -1) {
    dispatch_once(&share_sheet_log_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)share_sheet_log___logger;
  return v0;
}

id magic_head_log()
{
  if (magic_head_log_onceToken != -1) {
    dispatch_once(&magic_head_log_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)magic_head_log___logger;
  return v0;
}

uint64_t __magic_head_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.sharing", "MagicHead");
  uint64_t v1 = magic_head_log___logger;
  magic_head_log___logger = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __share_sheet_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ShareSheet", "ShareSheet");
  uint64_t v1 = share_sheet_log___logger;
  share_sheet_log___logger = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id _UIKitUserDefaults()
{
  if (_UIKitUserDefaults_onceToken != -1) {
    dispatch_once(&_UIKitUserDefaults_onceToken, &__block_literal_global_12);
  }
  os_log_t v0 = (void *)_UIKitUserDefaults_result;
  return v0;
}

uint64_t _ShareSheetIsAppleApp()
{
  if (_ShareSheetIsAppleApp_onceToken != -1) {
    dispatch_once(&_ShareSheetIsAppleApp_onceToken, &__block_literal_global_18);
  }
  return _ShareSheetIsAppleApp_isAppleApp;
}

BOOL _ShareSheetCanAccessContactsInCurrentProcess()
{
  return [getCNContactStoreClass() authorizationStatusForEntityType:0] == 3;
}

id getCNContactStoreClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCNContactStoreClass_softClass;
  uint64_t v7 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNContactStoreClass_block_invoke;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getCNContactStoreClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0B1FA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _ShareSheetDeviceScreenScale()
{
  if (_ShareSheetDeviceScreenScale_didCheck != -1) {
    dispatch_once(&_ShareSheetDeviceScreenScale_didCheck, &__block_literal_global_23);
  }
  return *(double *)&_ShareSheetDeviceScreenScale_scale;
}

uint64_t _ShareSheetIsCamera()
{
  if (_ShareSheetIsCamera_didCheck != -1) {
    dispatch_once(&_ShareSheetIsCamera_didCheck, &__block_literal_global_25);
  }
  return _ShareSheetIsCamera_isCamera;
}

uint64_t _ShareSheetIsSafari()
{
  if (_ShareSheetIsSafari_didCheck != -1) {
    dispatch_once(&_ShareSheetIsSafari_didCheck, &__block_literal_global_30);
  }
  return _ShareSheetIsSafari_isSafari;
}

uint64_t _ShareSheetIsBrowser()
{
  if (_ShareSheetIsBrowser_onceToken != -1) {
    dispatch_once(&_ShareSheetIsBrowser_onceToken, &__block_literal_global_38);
  }
  return _ShareSheetIsBrowser_hostHasEntitlement;
}

uint64_t _ShareSheetIsRealityLauncher()
{
  if (_ShareSheetIsRealityLauncher_onceToken != -1) {
    dispatch_once(&_ShareSheetIsRealityLauncher_onceToken, &__block_literal_global_43_0);
  }
  return _ShareSheetIsRealityLauncher_isRealityLauncher;
}

uint64_t _ShareSheetPrefersModernRemoteScene()
{
  return _os_feature_enabled_impl();
}

uint64_t _ShareSheetPlatformWantsRemoteOptions()
{
  return 0;
}

uint64_t _ShareSheetImageAnalysisAllowed()
{
  if (_ShareSheetIsMessagesApp_didCheck != -1) {
    dispatch_once(&_ShareSheetIsMessagesApp_didCheck, &__block_literal_global_84);
  }
  return _ShareSheetIsMessagesApp_isMessages;
}

uint64_t _ShareSheetHostCanRenderInProcess()
{
  if (_ShareSheetHostCanUseCustomViewController_onceToken != -1) {
    dispatch_once(&_ShareSheetHostCanUseCustomViewController_onceToken, &__block_literal_global_89);
  }
  return _ShareSheetHostCanUseCustomViewController_hostHasEntitlement;
}

BOOL _ShareSheetCanUseCustomViewController()
{
  if (_ShareSheetIsPhotos_didCheck != -1) {
    dispatch_once(&_ShareSheetIsPhotos_didCheck, &__block_literal_global_94);
  }
  if (_ShareSheetIsPhotos_isPhotos) {
    return 1;
  }
  if (_ShareSheetIsPhotosMessagesApp_didCheck != -1) {
    dispatch_once(&_ShareSheetIsPhotosMessagesApp_didCheck, &__block_literal_global_99);
  }
  if (_ShareSheetIsPhotosMessagesApp_isPhotos) {
    return 1;
  }
  if (_ShareSheetIsCamera_didCheck != -1) {
    dispatch_once(&_ShareSheetIsCamera_didCheck, &__block_literal_global_25);
  }
  if (_ShareSheetIsCamera_isCamera) {
    return 1;
  }
  if (_ShareSheetIsClips_didCheck != -1) {
    dispatch_once(&_ShareSheetIsClips_didCheck, &__block_literal_global_104);
  }
  if (_ShareSheetIsClips_IsClips) {
    return 1;
  }
  if (_ShareSheetIsMusic_didCheck != -1) {
    dispatch_once(&_ShareSheetIsMusic_didCheck, &__block_literal_global_109);
  }
  if (_ShareSheetIsMusic_IsMusic) {
    return 1;
  }
  if (_ShareSheetIsTV_didCheck != -1) {
    dispatch_once(&_ShareSheetIsTV_didCheck, &__block_literal_global_114);
  }
  if (_ShareSheetIsTV_IsTV) {
    return 1;
  }
  if (_ShareSheetIsFaceTime_didCheck != -1) {
    dispatch_once(&_ShareSheetIsFaceTime_didCheck, &__block_literal_global_119);
  }
  if (_ShareSheetIsFaceTime_IsFaceTime) {
    return 1;
  }
  if (_ShareSheetIsInCallService_didCheck != -1) {
    dispatch_once(&_ShareSheetIsInCallService_didCheck, &__block_literal_global_124);
  }
  if (_ShareSheetIsInCallService_IsInCallService) {
    return 1;
  }
  if (_ShareSheetHostCanUseCustomViewController_onceToken != -1) {
    dispatch_once(&_ShareSheetHostCanUseCustomViewController_onceToken, &__block_literal_global_89);
  }
  return _ShareSheetHostCanUseCustomViewController_hostHasEntitlement != 0;
}

uint64_t _ShareSheetIsSupportedPrintActivity(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v3 = objc_opt_isKindOfClass();

  return v3 & ~isKindOfClass & 1;
}

double _ShareSheetPopoverSize()
{
  os_log_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 6;

  return dbl_1A0BA0060[v1];
}

double _ShareSheetFormSheetSize()
{
  os_log_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 6) {
    return 480.0;
  }
  int v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 _referenceBounds];
  double v2 = 540.0;

  return v2;
}

double _ShareSheetDefaultSheetSize()
{
  return 568.0;
}

uint64_t _ShareSheetCanAccessPeopleSuggestions(unsigned char *a1)
{
  if (_ShareSheetCanAccessPeopleSuggestions_onceToken != -1) {
    dispatch_once(&_ShareSheetCanAccessPeopleSuggestions_onceToken, &__block_literal_global_52);
  }
  if (!_ShareSheetCanAccessPeopleSuggestions_hostHasEntitlement)
  {
    BOOL v3 = 0;
    if (a1) {
      *a1 = 1;
    }
    return v3;
  }
  uint64_t v2 = [getCNContactStoreClass() authorizationStatusForEntityType:0];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  BOOL v3 = v2 == 3;
  BOOL v40 = v2 == 3;
  if (v2)
  {
LABEL_27:
    if (a1)
    {
      if (!v3) {
        *a1 = 0;
      }
    }
    _Block_object_dispose(&v37, 8);
    return v3;
  }
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v4 = (uint64_t *)getkTCCServiceAddressBookSymbolLoc_ptr;
  v49 = (void *)getkTCCServiceAddressBookSymbolLoc_ptr;
  if (!getkTCCServiceAddressBookSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    id v43 = __getkTCCServiceAddressBookSymbolLoc_block_invoke;
    uint64_t v44 = &unk_1E5A216E8;
    uint64_t v45 = &v46;
    double v5 = (void *)TCCLibrary();
    uint64_t v6 = dlsym(v5, "kTCCServiceAddressBook");
    *(void *)(v45[1] + 24) = v6;
    getkTCCServiceAddressBookSymbolLoc_ptr = *(void *)(v45[1] + 24);
    uint64_t v4 = (uint64_t *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v4) {
    goto LABEL_36;
  }
  uint64_t v7 = *v4;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v8 = (void (*)(uint64_t))gettcc_service_singleton_for_CF_nameSymbolLoc_ptr;
  v49 = gettcc_service_singleton_for_CF_nameSymbolLoc_ptr;
  if (!gettcc_service_singleton_for_CF_nameSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    id v43 = __gettcc_service_singleton_for_CF_nameSymbolLoc_block_invoke;
    uint64_t v44 = &unk_1E5A216E8;
    uint64_t v45 = &v46;
    uint64_t v9 = (void *)TCCLibrary();
    id v10 = dlsym(v9, "tcc_service_singleton_for_CF_name");
    *(void *)(v45[1] + 24) = v10;
    gettcc_service_singleton_for_CF_nameSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
    uint64_t v8 = (void (*)(uint64_t))v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v8) {
    goto LABEL_36;
  }
  BOOL v11 = v8(v7);
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  id v12 = (void (*)(void))gettcc_message_options_createSymbolLoc_ptr;
  v49 = gettcc_message_options_createSymbolLoc_ptr;
  if (!gettcc_message_options_createSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    id v43 = __gettcc_message_options_createSymbolLoc_block_invoke;
    uint64_t v44 = &unk_1E5A216E8;
    uint64_t v45 = &v46;
    dispatch_time_t v13 = (void *)TCCLibrary();
    uint64_t v14 = dlsym(v13, "tcc_message_options_create");
    *(void *)(v45[1] + 24) = v14;
    gettcc_message_options_createSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
    id v12 = (void (*)(void))v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v12) {
    goto LABEL_36;
  }
  v12();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  dispatch_semaphore_t v16 = (void (*)(id, uint64_t))gettcc_message_options_set_reply_handler_policySymbolLoc_ptr;
  v49 = gettcc_message_options_set_reply_handler_policySymbolLoc_ptr;
  if (!gettcc_message_options_set_reply_handler_policySymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    id v43 = __gettcc_message_options_set_reply_handler_policySymbolLoc_block_invoke;
    uint64_t v44 = &unk_1E5A216E8;
    uint64_t v45 = &v46;
    id v17 = (void *)TCCLibrary();
    id v18 = dlsym(v17, "tcc_message_options_set_reply_handler_policy");
    *(void *)(v45[1] + 24) = v18;
    gettcc_message_options_set_reply_handler_policySymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
    dispatch_semaphore_t v16 = (void (*)(id, uint64_t))v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v16) {
    goto LABEL_36;
  }
  v16(v15, 1);

  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  id v19 = (void (*)(void))gettcc_credential_singleton_for_selfSymbolLoc_ptr;
  v49 = gettcc_credential_singleton_for_selfSymbolLoc_ptr;
  if (!gettcc_credential_singleton_for_selfSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    id v43 = __gettcc_credential_singleton_for_selfSymbolLoc_block_invoke;
    uint64_t v44 = &unk_1E5A216E8;
    uint64_t v45 = &v46;
    dispatch_semaphore_t v20 = (void *)TCCLibrary();
    uint64_t v21 = dlsym(v20, "tcc_credential_singleton_for_self");
    *(void *)(v45[1] + 24) = v21;
    gettcc_credential_singleton_for_selfSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
    id v19 = (void (*)(void))v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (v19)
  {
    uint64_t v22 = v19();
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    long long v23 = (void (*)(void))gettcc_server_singleton_defaultSymbolLoc_ptr;
    v49 = gettcc_server_singleton_defaultSymbolLoc_ptr;
    if (!gettcc_server_singleton_defaultSymbolLoc_ptr)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      id v43 = __gettcc_server_singleton_defaultSymbolLoc_block_invoke;
      uint64_t v44 = &unk_1E5A216E8;
      uint64_t v45 = &v46;
      uint64_t v24 = (void *)TCCLibrary();
      char v25 = dlsym(v24, "tcc_server_singleton_default");
      *(void *)(v45[1] + 24) = v25;
      gettcc_server_singleton_defaultSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
      long long v23 = (void (*)(void))v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (v23)
    {
      id v26 = v23();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2;
      v36[3] = &unk_1E5A225C8;
      v36[4] = &v37;
      v36[5] = v7;
      id v27 = v26;
      id v28 = v15;
      id v29 = v22;
      id v30 = v11;
      uint64_t v31 = v36;
      uint64_t v46 = 0;
      uint64_t v47 = &v46;
      uint64_t v48 = 0x2020000000;
      char v32 = gettcc_server_message_request_authorizationSymbolLoc_ptr;
      v49 = gettcc_server_message_request_authorizationSymbolLoc_ptr;
      if (!gettcc_server_message_request_authorizationSymbolLoc_ptr)
      {
        uint64_t v41 = MEMORY[0x1E4F143A8];
        uint64_t v42 = 3221225472;
        id v43 = __gettcc_server_message_request_authorizationSymbolLoc_block_invoke;
        uint64_t v44 = &unk_1E5A216E8;
        uint64_t v45 = &v46;
        long long v33 = (void *)TCCLibrary();
        v34 = dlsym(v33, "tcc_server_message_request_authorization");
        *(void *)(v45[1] + 24) = v34;
        gettcc_server_message_request_authorizationSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
        char v32 = (void *)v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (v32)
      {
        ((void (*)(id, id, id, id, void, void *))v32)(v27, v28, v29, v30, 0, v31);

        BOOL v3 = *((unsigned char *)v38 + 24) != 0;
        goto LABEL_27;
      }
    }
    dlerror();
    uint64_t result = abort_report_np();
  }
  else
  {
LABEL_36:
    dlerror();
    uint64_t result = abort_report_np();
  }
  __break(1u);
  return result;
}

void sub_1A0B20938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B20C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _ShareSheetSupportsSharePlayStartFromApp()
{
  if (_ShareSheetSupportsSharePlayStartFromApp_onceToken != -1) {
    dispatch_once(&_ShareSheetSupportsSharePlayStartFromApp_onceToken, &__block_literal_global_61);
  }
  return _ShareSheetSupportsSharePlayStartFromApp_hostEntitledForSharePlay;
}

uint64_t _ShareSheetHostCanPerformActivitySkippingShareSheet()
{
  if (_ShareSheetHostCanPerformActivitySkippingShareSheet_onceToken != -1) {
    dispatch_once(&_ShareSheetHostCanPerformActivitySkippingShareSheet_onceToken, &__block_literal_global_66);
  }
  return _ShareSheetHostCanPerformActivitySkippingShareSheet_hostEntitledForPerformActivity;
}

id _ShareSheetRegisteredTypeIdentifiers(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    uint64_t v19 = *(void *)v27;
    id v20 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v21 = v5;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 objectForKey:@"attachments"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v10 = v9;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v23;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v23 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v16 = [v15 objectForKey:@"registeredTypeIdentifiers"];
                    if (v16) {
                      [v2 addObjectsFromArray:v16];
                    }
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v12);
            }

            uint64_t v6 = v19;
            id v3 = v20;
            uint64_t v5 = v21;
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v17 = (void *)[v2 copy];
  return v17;
}

id _ShareSheetOpenInSupportedTypeIdentifiers(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _ShareSheetRegisteredTypeIdentifiers(a1);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (!SFIsImage())
        {

          id v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v6 = v1;
LABEL_11:

  return v6;
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ContactsLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A225E8;
    uint64_t v6 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ContactsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CNContactStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCNContactStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkTCCServiceAddressBookSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "kTCCServiceAddressBook");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkTCCServiceAddressBookSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TCCLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __TCCLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5A22600;
    uint64_t v5 = 0;
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = TCCLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!TCCLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __TCCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TCCLibraryCore_frameworkLibrary = result;
  return result;
}

void *__gettcc_message_options_createSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_message_options_create");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_message_options_createSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__gettcc_message_options_set_reply_handler_policySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_message_options_set_reply_handler_policy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_message_options_set_reply_handler_policySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__gettcc_credential_singleton_for_selfSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_credential_singleton_for_self");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_credential_singleton_for_selfSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__gettcc_server_singleton_defaultSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_server_singleton_default");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_singleton_defaultSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__gettcc_server_message_request_authorizationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_server_message_request_authorization");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_message_request_authorizationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__gettcc_authorization_record_get_authorization_rightSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "tcc_authorization_record_get_authorization_right");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

id __ItemsFromUIActivityItems(void *a1)
{
  v56[5] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__2;
  uint64_t v51 = __Block_byref_object_dispose__2;
  id v52 = 0;
  id v52 = [MEMORY[0x1E4F1CA48] arrayWithArray:v1];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__2;
  uint64_t v45 = __Block_byref_object_dispose__2;
  id v46 = 0;
  id v46 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v2 = (void *)[(id)v48[5] copy];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = ____ItemsFromUIActivityItems_block_invoke;
  v40[3] = &unk_1E5A22628;
  v40[4] = &v41;
  v40[5] = &v47;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v40];

  v35.i64[0] = MEMORY[0x1E4F143A8];
  v35.i64[1] = 3221225472;
  uint64_t v36 = ____ItemsFromUIActivityItems_block_invoke_2;
  uint64_t v37 = &unk_1E5A22650;
  id v38 = &v47;
  uint64_t v39 = &v41;
  ____ItemsFromUIActivityItems_block_invoke_2(&v35, 1024, v3, 0);
  v36(&v35, 512, *MEMORY[0x1E4F224C8], 0);
  v36(&v35, 128, *MEMORY[0x1E4F22668], 0);
  uint64_t v4 = *MEMORY[0x1E4F225F8];
  v36(&v35, 2, *MEMORY[0x1E4F225F8], 1u);
  v36(&v35, 64, *MEMORY[0x1E4F22660], 1u);
  v36(&v35, 4096, *MEMORY[0x1E4F22538], 1u);
  uint64_t v5 = _UIActivityItemsWithTypes((void *)v48[5], 1, 1u, 0, 0);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = ____ItemsFromUIActivityItems_block_invoke_4;
  v34[3] = &unk_1E5A22628;
  v34[4] = &v41;
  v34[5] = &v47;
  [v5 enumerateObjectsUsingBlock:v34];
  v36(&v35, 8, *MEMORY[0x1E4F225B8], 0);
  uint64_t v6 = *MEMORY[0x1E4F22590];
  v36(&v35, 2048, *MEMORY[0x1E4F22590], 0);
  v56[0] = *MEMORY[0x1E4F226F8];
  v56[1] = v4;
  uint64_t v7 = *MEMORY[0x1E4F22688];
  v56[2] = *MEMORY[0x1E4F226A8];
  v56[3] = v7;
  v56[4] = v6;
  long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:5];
  uint64_t v54 = *MEMORY[0x1E4F284B8];
  uint64_t v55 = *MEMORY[0x1E4F284B0];
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  long long v10 = _UIActivityItemsWithTypes((void *)v48[5], 0x4000, 0, 0, 0);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ____ItemsFromUIActivityItems_block_invoke_5;
  v29[3] = &unk_1E5A226A0;
  id v11 = v8;
  id v30 = v11;
  id v12 = v9;
  id v31 = v12;
  uint64_t v32 = &v41;
  long long v33 = &v47;
  [v10 enumerateObjectsUsingBlock:v29];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v14 = _UIActivityItemsWithTypes((void *)v48[5], 4, 0, 0, 0);
  uint64_t v15 = [v13 arrayWithArray:v14];

  if ([v15 count])
  {
    long long v24 = v5;
    id v16 = v1;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          [(id)v42[5] addObject:v21];
          [(id)v48[5] removeObjectIdenticalTo:v21];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v53 count:16];
      }
      while (v18);
    }

    uint64_t v5 = v24;
    id v1 = v16;
  }
  id v22 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v22;
}

void sub_1A0B22064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
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

id __NSExtensionItemsFromUIActivityItems(void *a1, void *a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  id v85 = __Block_byref_object_copy__2;
  v86 = __Block_byref_object_dispose__2;
  id v87 = 0;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v87 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__2;
  v80 = __Block_byref_object_dispose__2;
  id v81 = 0;
  id v81 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke;
  v74[3] = &unk_1E5A226C8;
  id v32 = v5;
  id v75 = v32;
  if (____NSExtensionItemsFromUIActivityItems_block_invoke((uint64_t)v74)) {
    char v33 = 1;
  }
  else {
    char v33 = [v6 sourceAppIsManaged];
  }
  long long v8 = (void *)[(id)v77[5] copy];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_2;
  v70[3] = &unk_1E5A226F0;
  char v72 = &v82;
  id v9 = v7;
  id v71 = v9;
  v73 = &v76;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v70];

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  id v64 = ____NSExtensionItemsFromUIActivityItems_block_invoke_3;
  v65 = &unk_1E5A22740;
  v68 = &v76;
  id v10 = v6;
  id v66 = v10;
  v69 = &v82;
  id v11 = v9;
  id v67 = v11;
  ____NSExtensionItemsFromUIActivityItems_block_invoke_3((uint64_t)v63, 1024, (void *)*MEMORY[0x1E4F22718], 0);
  v64((uint64_t)v63, 512, (void *)*MEMORY[0x1E4F224C8], 0);
  v64((uint64_t)v63, 128, (void *)*MEMORY[0x1E4F22668], 0);
  v64((uint64_t)v63, 2, (void *)*MEMORY[0x1E4F225F8], 1u);
  v64((uint64_t)v63, 64, (void *)*MEMORY[0x1E4F22660], 1u);
  v64((uint64_t)v63, 4096, (void *)*MEMORY[0x1E4F22538], 1u);
  id v12 = _UIActivityItemsWithTypes((void *)v77[5], 1, 1u, 0, 0);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_5;
  v58[3] = &unk_1E5A22790;
  id v36 = v10;
  id v59 = v36;
  uint64_t v61 = &v82;
  id v13 = v11;
  id v60 = v13;
  v62 = &v76;
  [v12 enumerateObjectsUsingBlock:v58];
  v64((uint64_t)v63, 8, (void *)*MEMORY[0x1E4F225B8], 0);
  v64((uint64_t)v63, 2048, (void *)*MEMORY[0x1E4F22590], 0);
  id v31 = v12;
  uint64_t v14 = _UIActivityItemsWithTypes((void *)v77[5], 0x4000, 0, 0, 0);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_7;
  v54[3] = &unk_1E5A227B8;
  v56 = &v82;
  id v15 = v13;
  id v55 = v15;
  v57 = &v76;
  [v14 enumerateObjectsUsingBlock:v54];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__2;
  id v52 = __Block_byref_object_dispose__2;
  id v53 = 0;
  id v53 = [MEMORY[0x1E4F1CA48] array];
  v34 = _UIActivityItemsWithTypes((void *)v77[5], 0x2000, 0, 0, 0);
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  id v17 = _UIActivityItemsWithTypes((void *)v77[5], 4, 0, 0, 0);
  uint64_t v18 = [v16 arrayWithArray:v17];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_8;
  v43[3] = &unk_1E5A22808;
  id v35 = v18;
  id v44 = v35;
  id v19 = v15;
  id v45 = v19;
  id v46 = &v48;
  uint64_t v47 = &v76;
  [v34 enumerateObjectsUsingBlock:v43];
  if ([v35 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v35;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v88 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v40;
      long long v23 = (void *)*MEMORY[0x1E4F226F8];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v26 = _NSItemProviderForUIActivityItem(v25, v23, v36);
          if (v26)
          {
            [(id)v83[5] addObject:v26];
            if (v19) {
              (*((void (**)(id, void *, void *))v19 + 2))(v19, v26, v25);
            }
            [(id)v77[5] removeObjectIdenticalTo:v25];
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v88 count:16];
      }
      while (v21);
    }
  }
  if ([(id)v83[5] count])
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F28C80]);
    [v27 setAttachments:v83[5]];
    [(id)v49[5] insertObject:v27 atIndex:0];
  }
  long long v28 = (void *)v49[5];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_10;
  v37[3] = &__block_descriptor_33_e32_v32__0__NSExtensionItem_8Q16_B24l;
  char v38 = v33;
  [v28 enumerateObjectsUsingBlock:v37];
  id v29 = (id)v49[5];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  return v29;
}

void sub_1A0B22D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

id _NSItemProviderForUIActivityItem(void *a1, void *a2, void *a3)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    id v9 = v7;
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    uint64_t v11 = *MEMORY[0x1E4F225F8];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    id v36 = ___NSItemProviderForUIActivityItemImageRep_block_invoke;
    uint64_t v37 = &unk_1E5A22768;
    id v12 = v8;
    id v38 = v12;
    [v10 registerItemForTypeIdentifier:v11 loadHandler:&v34];
    id v13 = [v12 asset];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v15 = [v12 asset];
    if ((isKindOfClass & 1) == 0)
    {
      getALAssetClass();
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0)
      {
        id v15 = 0;
LABEL_13:
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = ___NSItemProviderForUIActivityItemImageRep_block_invoke_3;
        v39[3] = &unk_1E5A22768;
        id v40 = v12;
        id v26 = v12;
        [v10 setPreviewImageHandler:v39];

        goto LABEL_14;
      }
      id v17 = [v12 asset];
      uint64_t v18 = getALAssetPropertyAssetURL();
      id v15 = [v17 valueForProperty:v18];
    }
    if (v15)
    {
      uint64_t v19 = *MEMORY[0x1E4F226F8];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v30 = ___NSItemProviderForUIActivityItemImageRep_block_invoke_2;
      id v31 = &unk_1E5A22850;
      id v32 = v9;
      id v15 = v15;
      id v33 = v15;
      [v10 registerItemForTypeIdentifier:v19 loadHandler:&v28];
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v25 = [v7 activityType];
    _UIActivityGetTypeIdentifier(v5, v6, (uint64_t)v25);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v26 = [v7 activityType];
    [v7 thumbnailSize];
    +[_UIActivityItemMapping _itemProviderForActivityItem:typeIdentifier:thumbnailSize:activityType:](_UIActivityItemMapping, "_itemProviderForActivityItem:typeIdentifier:thumbnailSize:activityType:", v5, v9, v26);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  id v20 = v5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v21 = *MEMORY[0x1E4F226F8];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = ___NSItemProviderForUIActivityItemURLRep_block_invoke;
  id v31 = &unk_1E5A22768;
  id v22 = v20;
  id v32 = v22;
  [v10 registerItemForTypeIdentifier:v21 loadHandler:&v28];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  id v36 = ___NSItemProviderForUIActivityItemURLRep_block_invoke_2;
  uint64_t v37 = &unk_1E5A22768;
  id v9 = v22;
  id v38 = v9;
  [v10 setPreviewImageHandler:&v34];
  if ([v9 attachmentURLType])
  {
    v41[0] = @"SLAttachmentURLType";
    long long v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "attachmentURLType"));
    v39[0] = v23;
    long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v41 count:1];
    [v10 setUserInfo:v24];
  }
LABEL_15:

  return v10;
}

id _UIActivityGetTypeIdentifier(void *a1, void *a2, uint64_t a3)
{
  CFDataRef v5 = a1;
  id v6 = a2;
  id v7 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v5 activityType:a3];
  if (![v7 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = CGImageSourceCreateWithData(v5, 0);
      if (v8)
      {
        id v9 = v8;
        CFStringRef Type = CGImageSourceGetType(v8);
        CFRelease(v9);
      }
      else
      {
        CFStringRef Type = 0;
      }

      id v7 = (void *)Type;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFData *)v5 isFileURL])
      {
        CFDataRef v11 = v5;
        id v12 = _UIActivityUTIForURL(v11);
        if (![v12 length])
        {
          id v13 = CGImageSourceCreateWithURL(v11, 0);
          uint64_t v14 = v13;
          if (!v13)
          {
LABEL_13:

            id v7 = v14;
            goto LABEL_14;
          }
          uint64_t v15 = CGImageSourceGetType(v13);

          CFRelease(v14);
          id v12 = (void *)v15;
        }
        uint64_t v14 = v12;
        id v12 = v14;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  if (![v7 length])
  {
    id v16 = v6;

    id v7 = v16;
  }

  return v7;
}

void sub_1A0B23EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _NSExtensionItemsFromActivityItemValues(void *a1)
{
  return __NSExtensionItemsFromUIActivityItems(a1, 0, 0);
}

id _NSExtensionItemsFromActivityItemValuesWithProcessingBlock(void *a1, void *a2)
{
  return __NSExtensionItemsFromUIActivityItems(a1, 0, a2);
}

id _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(void *a1, void *a2)
{
  return __NSExtensionItemsFromUIActivityItems(a1, a2, 0);
}

uint64_t _UICanExcludeExtensionActivities()
{
  if (_UICanExcludeExtensionActivities_onceToken != -1) {
    dispatch_once(&_UICanExcludeExtensionActivities_onceToken, &__block_literal_global_16);
  }
  return _UICanExcludeExtensionActivities_hostHasEntitlement;
}

BOOL _UIExtensionElectionStateIsIgnore(void *a1)
{
  id v1 = [a1 applicationExtension];
  uint64_t v2 = [v1 _plugIn];
  uint64_t v3 = [v2 userElection];

  return v3 == 2;
}

uint64_t _UIShouldExcludeExtensionWithActivityType(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"com.apple.ExtensionTester.NullPlugin"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.ExtensionTester.NullShareSheet"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.ist.AppleDirectory.extension"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.contextkit.ProofOfContext.ContentExtractionActionExtension"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.LocalAuthentication.GuiTestApp.LANonUIActionExtension.LANonUIActionExtension"];
  }

  return v2;
}

Class initALAsset()
{
  if (AssetsLibraryLibrary_sOnce_0 != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_44);
  }
  Class result = objc_getClass("ALAsset");
  classALAsset = (uint64_t)result;
  getALAssetClass = (uint64_t (*)())ALAssetFunction;
  return result;
}

id ALAssetFunction()
{
  return (id)classALAsset;
}

void *__AssetsLibraryLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/AssetsLibrary.framework/AssetsLibrary", 2);
  AssetsLibraryLibrary_sLib_0 = (uint64_t)result;
  return result;
}

id initValALAssetPropertyAssetURL()
{
  if (AssetsLibraryLibrary_sOnce_0 != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_44);
  }
  uint64_t v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib_0, "ALAssetPropertyAssetURL");
  if (v0) {
    objc_storeStrong((id *)&constantValALAssetPropertyAssetURL, *v0);
  }
  getALAssetPropertyAssetURL = (uint64_t (*)())ALAssetPropertyAssetURLFunction;
  id v1 = (void *)constantValALAssetPropertyAssetURL;
  return v1;
}

id ALAssetPropertyAssetURLFunction()
{
  return (id)constantValALAssetPropertyAssetURL;
}

id initValALAssetsLibraryErrorDomain()
{
  if (AssetsLibraryLibrary_sOnce_0 != -1) {
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_44);
  }
  uint64_t v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib_0, "ALAssetsLibraryErrorDomain");
  if (v0) {
    objc_storeStrong((id *)&constantValALAssetsLibraryErrorDomain, *v0);
  }
  getALAssetsLibraryErrorDomain = (uint64_t (*)())ALAssetsLibraryErrorDomainFunction;
  id v1 = (void *)constantValALAssetsLibraryErrorDomain;
  return v1;
}

id ALAssetsLibraryErrorDomainFunction()
{
  return (id)constantValALAssetsLibraryErrorDomain;
}

void sub_1A0B250E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1A0B256B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSAddParticipantsViewControllerClass()
{
  uint64_t v4 = 0;
  CFDataRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCSAddParticipantsViewControllerClass_softClass;
  uint64_t v7 = getCSAddParticipantsViewControllerClass_softClass;
  if (!getCSAddParticipantsViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCSAddParticipantsViewControllerClass_block_invoke;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getCSAddParticipantsViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0B25A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFAirDropViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SharingUILibraryCore_block_invoke_3;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A228C0;
    uint64_t v6 = 0;
    SharingUILibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SharingUILibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFAirDropViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSFAirDropViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFAirDropViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingUILibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_3 = result;
  return result;
}

void __getCSSharingOptionsViewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSSharingOptionsViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSSharingOptionsViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCSSharingOptionsViewControllerClass_block_invoke_cold_1();
    CloudSharingUILibrary();
  }
}

void CloudSharingUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CloudSharingUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CloudSharingUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A228D8;
    uint64_t v3 = 0;
    CloudSharingUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CloudSharingUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CloudSharingUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudSharingUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCSAddParticipantsViewControllerClass_block_invoke(uint64_t a1)
{
  CloudSharingUILibrary();
  Class result = objc_getClass("CSAddParticipantsViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSAddParticipantsViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCSAddParticipantsViewControllerClass_block_invoke_cold_1();
    return (Class)-[NSItemProvider(SHSheetGroupActivity) loadGroupActivityMetadataWithCompletion:](v3);
  }
  return result;
}

Class initLPLinkMetadata_1()
{
  if (LinkPresentationLibrary_sOnce_3 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_3, &__block_literal_global_17);
  }
  Class result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata_1 = (uint64_t)result;
  getLPLinkMetadataClass_2 = (uint64_t (*)())LPLinkMetadataFunction_1;
  return result;
}

id LPLinkMetadataFunction_1()
{
  return (id)classLPLinkMetadata_1;
}

void *__LinkPresentationLibrary_block_invoke_3()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_3 = (uint64_t)result;
  return result;
}

id SHSheetCustomHeaderButtonTitle(int a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = _ShareSheetBundle();
    long long v2 = [v1 localizedStringForKey:@"SHARE_SHEET_SHAREPLAY_BUTTON_TITLE" value:@"SharePlay" table:@"Localizable"];

    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v4 = [NSString stringWithFormat:@" %@", v2];
    v24[0] = *MEMORY[0x1E4FB12B8];
    long long v5 = [MEMORY[0x1E4FB1618] whiteColor];
    v25[0] = v5;
    v24[1] = *MEMORY[0x1E4FB12B0];
    uint64_t v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v25[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v8 = (void *)[v3 initWithString:v4 attributes:v7];

    id v9 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
    id v10 = (void *)MEMORY[0x1E4FB1830];
    CFDataRef v11 = [MEMORY[0x1E4FB1618] whiteColor];
    id v12 = [v10 configurationWithHierarchicalColor:v11];
    id v13 = [v9 configurationByApplyingConfiguration:v12];

    uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shareplay" withConfiguration:v13];
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1398]);
    [v15 setImage:v14];
    if (UIAccessibilityIsInvertColorsEnabled())
    {
      [v8 size];
      double v17 = v16 + 2.0;
      [v14 size];
      double v19 = v18;
      [v14 size];
      objc_msgSend(v15, "setBounds:", 0.0, -2.0, v19 * (v17 / v20), v17);
    }
    uint64_t v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v15];
    id v22 = (void *)[v21 mutableCopy];

    [v22 appendAttributedString:v8];
  }
  else
  {
    id v22 = 0;
  }
  return v22;
}

id SHSheetCustomHeaderButtonColor(int a1)
{
  if (a1)
  {
    id v1 = [MEMORY[0x1E4FB1618] systemGreenColor];
    long long v2 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    id v3 = [v1 resolvedColorWithTraitCollection:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id SHSheetCollaborationModeTitle(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (v1 && ([v1 BOOLValue] & 1) == 0)
  {
    uint64_t v4 = _ShareSheetBundle();
    id v3 = [v4 localizedStringForKey:@"SEND_LINK" value:@"Send Link" table:@"Localizable"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id SHSheetTintColor()
{
  uint64_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 6)
  {
    long long v2 = [MEMORY[0x1E4FB1618] labelColor];
    goto LABEL_8;
  }
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 keyWindow];
  long long v2 = [v4 tintColor];

  if (v2)
  {
    long long v5 = [MEMORY[0x1E4FB1618] whiteColor];
    if ([v2 isEqual:v5])
    {
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
      int v7 = [v2 isEqual:v6];

      if (!v7) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = [MEMORY[0x1E4FB1618] systemBlueColor];

  long long v2 = (void *)v8;
LABEL_8:
  return v2;
}

uint64_t __SanitizeStringForUseAsFileName_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/\\""];
  uint64_t v1 = SanitizeStringForUseAsFileName___illegalFileNameCharacters;
  SanitizeStringForUseAsFileName___illegalFileNameCharacters = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

Class initQLPreviewController()
{
  if (QuickLookLibrary_sOnce_1 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_1, &__block_literal_global_238);
  }
  Class result = objc_getClass("QLPreviewController");
  classQLPreviewController = (uint64_t)result;
  getQLPreviewControllerClass = (uint64_t (*)())QLPreviewControllerFunction;
  return result;
}

id QLPreviewControllerFunction()
{
  return (id)classQLPreviewController;
}

void *__QuickLookLibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initQLDismissAction()
{
  if (QuickLookLibrary_sOnce_1 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_1, &__block_literal_global_238);
  }
  Class result = objc_getClass("QLDismissAction");
  classQLDismissAction = (uint64_t)result;
  getQLDismissActionClass = (uint64_t (*)())QLDismissActionFunction;
  return result;
}

id QLDismissActionFunction()
{
  return (id)classQLDismissAction;
}

id canonicalPathForPath(void *a1)
{
  uint64_t v1 = [a1 stringByResolvingSymlinksInPath];
  long long v2 = [v1 stringByStandardizingPath];

  return v2;
}

Class initFPSandboxingURLWrapper()
{
  if (FileProviderLibrary_sOnce != -1) {
    dispatch_once(&FileProviderLibrary_sOnce, &__block_literal_global_20);
  }
  Class result = objc_getClass("FPSandboxingURLWrapper");
  classFPSandboxingURLWrapper = (uint64_t)result;
  getFPSandboxingURLWrapperClass = (uint64_t (*)())FPSandboxingURLWrapperFunction;
  return result;
}

id FPSandboxingURLWrapperFunction()
{
  return (id)classFPSandboxingURLWrapper;
}

void *__FileProviderLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2);
  FileProviderLibrary_sLib = (uint64_t)result;
  return result;
}

Class ___isUnitTesting_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  _isUnitTesting_isUnitTesting = result != 0;
  return result;
}

void sub_1A0B2F0BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0B2F270(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_1A0B2F81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2F8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2F980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B2FF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B301DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B302C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B304B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B306E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B3079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B30F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B31044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B3111C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B311D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A0B31294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

Class initCKContainerSetupInfo()
{
  if (CloudKitLibrary_sOnce != -1) {
    dispatch_once(&CloudKitLibrary_sOnce, &__block_literal_global_340);
  }
  Class result = objc_getClass("CKContainerSetupInfo");
  classCKContainerSetupInfo = (uint64_t)result;
  getCKContainerSetupInfoClass = (uint64_t (*)())CKContainerSetupInfoFunction;
  return result;
}

id CKContainerSetupInfoFunction()
{
  return (id)classCKContainerSetupInfo;
}

void *__CloudKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
  CloudKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCKShare()
{
  if (CloudKitLibrary_sOnce != -1) {
    dispatch_once(&CloudKitLibrary_sOnce, &__block_literal_global_340);
  }
  Class result = objc_getClass("CKShare");
  classCKShare = (uint64_t)result;
  getCKShareClass = (uint64_t (*)())CKShareFunction;
  return result;
}

id CKShareFunction()
{
  return (id)classCKShare;
}

uint64_t _UIActivityHelperActivityItemsIncludeICloudDriveURL(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isFileURL", (void)v9))
        {
          if (CloudDocsLibrary_sOnce != -1) {
            dispatch_once(&CloudDocsLibrary_sOnce, &__block_literal_global_24);
          }
          if (objc_msgSend(v6, "br_isInMobileDocuments"))
          {
            uint64_t v7 = 1;
            goto LABEL_15;
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_15:

  return v7;
}

void *__CloudDocsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
  CloudDocsLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1A0B3522C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B355E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B359E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B37BA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0B39E54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0B3B424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B3B7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B3C768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B40DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIActivityFromApplicationExtension(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"NSExtensionExcludedFromShareSheet"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v1;
      __int16 v17 = 2112;
      double v18 = @"NSExtensionExcludedFromShareSheet";
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Excluded extension:%@ reason:%@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [v1 extensionPointIdentifier];
    int v8 = [v7 isEqualToString:@"com.apple.share-services"];

    if (v8
      || ([v1 identifier],
          long long v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isEqualToString:@"net.box.BoxNet.collaborateShareExtension"],
          v9,
          v10))
    {
      long long v11 = (objc_class *)objc_opt_class();
    }
    else
    {
      long long v12 = [v1 attributes];
      id v13 = [v12 valueForKey:@"UIApplicationExtensionIsFileProviderSpecific"];
      long long v11 = (objc_class *)objc_opt_class();
    }
    uint64_t v6 = (void *)[[v11 alloc] initWithApplicationExtension:v1];
  }

  return v6;
}

id _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(void *a1, int a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a1;
  uint64_t v5 = [v3 dictionary];
  long long v9 = @"extensionItems";
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v5 setObject:v6 forKeyedSubscript:@"NSExtensionActivationRule"];
  if (a2)
  {
    uint64_t v7 = [&unk_1EF33A138 stringValue];
    [v5 setObject:v7 forKeyedSubscript:@"NSUserElection"];
  }
  return v5;
}

Class initMCProfileConnection_2()
{
  if (ManagedConfigurationLibrary_sOnce_2 != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce_2, &__block_literal_global_189);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_2 = (uint64_t)result;
  getMCProfileConnectionClass_2 = (uint64_t (*)())MCProfileConnectionFunction_2;
  return result;
}

id MCProfileConnectionFunction_2()
{
  return (id)classMCProfileConnection_2;
}

void *__ManagedConfigurationLibrary_block_invoke_2()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_2 = (uint64_t)result;
  return result;
}

id _UIQLPreviewUTIForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3 = InitializeQuickLookFunctions_onceToken;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_90);
  }
  uint64_t v6 = (void *)QLTypeCopyUTIForURLAndMimeTypeFx(v5, v4);

  return v6;
}

Class _UIQLPreviewControllerClass()
{
  return getQLPreviewControllerClass_0();
}

Class _UIQLDismissActionClass()
{
  return getQLDismissActionClass_0();
}

uint64_t _UIQLCanPreviewContentWithUTI(void *a1)
{
  uint64_t v1 = InitializeQuickLookFunctions_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_90);
  }
  uint64_t v3 = QLPreviewControllerSupportsContentTypeFx(v2);

  return v3;
}

uint64_t _UIQLCanPreviewItem(void *a1)
{
  uint64_t v1 = (Class (__cdecl *)())getQLPreviewControllerClass_0;
  id v2 = a1;
  uint64_t v3 = [(objc_class *)v1() canPreviewItem:v2];

  return v3;
}

uint64_t _UIQLPreviewNeedsHelpDecompressingURL(void *a1)
{
  uint64_t v1 = InitializeQuickLookFunctions_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_90);
  }
  uint64_t v3 = QLPreviewNeedsHelpUnzippingURLFx(v2);

  return v3;
}

Class initQLPreviewController_0()
{
  if (QuickLookLibrary_sOnce_2 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_27);
  }
  Class result = objc_getClass("QLPreviewController");
  classQLPreviewController_0 = (uint64_t)result;
  getQLPreviewControllerClass_0 = (uint64_t (*)())QLPreviewControllerFunction_0;
  return result;
}

id QLPreviewControllerFunction_0()
{
  return (id)classQLPreviewController_0;
}

void *__QuickLookLibrary_block_invoke_2()
{
  Class result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_2 = (uint64_t)result;
  return result;
}

Class initQLDismissAction_0()
{
  if (QuickLookLibrary_sOnce_2 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_27);
  }
  Class result = objc_getClass("QLDismissAction");
  classQLDismissAction_0 = (uint64_t)result;
  getQLDismissActionClass_0 = (uint64_t (*)())QLDismissActionFunction_0;
  return result;
}

id QLDismissActionFunction_0()
{
  return (id)classQLDismissAction_0;
}

void *__InitializeQuickLookFunctions_block_invoke()
{
  if (QuickLookLibrary_sOnce_2 != -1) {
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)QuickLookLibrary_sLib_2;
  QLPreviewControllerSupportsContentTypeFx = dlsym((void *)QuickLookLibrary_sLib_2, "QLPreviewControllerSupportsContentType");
  QLPreviewNeedsHelpUnzippingURLFx = dlsym(v0, "QLPreviewNeedsHelpUnzippingURL");
  Class result = dlsym(v0, "QLTypeCopyUTIForURLAndMimeType");
  QLTypeCopyUTIForURLAndMimeTypeFx = (uint64_t (*)(void, void))result;
  return result;
}

void sub_1A0B42AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B42D18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B437E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B43AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SHQuickNoteLog()
{
  if (SHQuickNoteLog_onceToken != -1) {
    dispatch_once(&SHQuickNoteLog_onceToken, &__block_literal_global_29);
  }
  uint64_t v0 = (void *)SHQuickNoteLog___logger;
  return v0;
}

void sub_1A0B44738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A22E00;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void ExtensionKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ExtensionKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ExtensionKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A22E18;
    uint64_t v3 = 0;
    ExtensionKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ExtensionKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ExtensionKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ExtensionKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSYIsLinkableUserActivitySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SynapseLibrary();
  uint64_t result = dlsym(v2, "SYIsLinkableUserActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSYIsLinkableUserActivitySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SynapseLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SynapseLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SynapseLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5A22E30;
    uint64_t v5 = 0;
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SynapseLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!SynapseLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SynapseLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SynapseLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __SHQuickNoteLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.sharing", "QuickNote");
  uint64_t v1 = SHQuickNoteLog___logger;
  SHQuickNoteLog___logger = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

Class __getSYNotesActivationRequestClass_block_invoke(uint64_t a1)
{
  SynapseLibrary();
  Class result = objc_getClass("SYNotesActivationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSYNotesActivationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSYNotesActivationRequestClass_block_invoke_cold_1();
    return (Class)__getSYNotesActivationCommandClass_block_invoke(v3);
  }
  return result;
}

Class __getSYNotesActivationCommandClass_block_invoke(uint64_t a1)
{
  SynapseLibrary();
  Class result = objc_getClass("SYNotesActivationCommand");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSYNotesActivationCommandClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getSYNotesActivationCommandClass_block_invoke_cold_1();
    return (Class)+[UISUIActivityExtensionItemData supportsSecureCoding];
  }
  return result;
}

void sub_1A0B46104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id SHSheetUISpecPlaceholderColor(uint64_t a1)
{
  if (a1 == 2)
  {
    double v1 = 1.0;
    double v2 = 1.0;
    double v3 = 1.0;
  }
  else
  {
    double v1 = 0.0;
    double v2 = 0.0;
    double v3 = 0.0;
  }
  SEL v4 = [MEMORY[0x1E4FB1618] colorWithRed:v1 green:v2 blue:v3 alpha:0.05];
  return v4;
}

id UIActivityContentHelperOptionsButtonAction(int a1, void *a2, void *a3)
{
  uint64_t v5 = (Class (__cdecl *)())getLPButtonActionClass;
  id v6 = a3;
  id v7 = a2;
  Class v8 = v5();
  long long v9 = UIActivityContentHelperOptionsButtonText(a1, v7);

  int v10 = [(objc_class *)v8 actionWithTitle:v9 image:0 handler:v6];

  return v10;
}

id UIActivityContentHelperOptionsButtonText(int a1, void *a2)
{
  id v3 = a2;
  SEL v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v6 = _ShareSheetBundle();
      id v5 = [v6 localizedStringForKey:@"Options" value:@"Options" table:@"Localizable"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id UIActivityContentHelperCollaborationButtonAction(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    Class v8 = _ShareSheetBundle();
    id v7 = [v8 localizedStringForKey:@"Collaborative" value:@"Collaborative" table:@"Localizable"];
  }
  id v9 = objc_alloc(getLPImageClass());
  int v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill"];
  long long v11 = (void *)[v9 initWithPlatformImage:v10];

  id v12 = objc_alloc(getLPImageClass());
  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2"];
  uint64_t v14 = (void *)[v12 initWithPlatformImage:v13];

  int v15 = [(objc_class *)getLPButtonActionClass() actionWithTitle:v7 image:v14 handler:v6];
  [v15 setVisibleImage:v11];
  [v15 setSelected:a1];

  return v15;
}

id UIActivityContentHelperCopyButtonAction(int a1, void *a2)
{
  id v3 = a2;
  SEL v4 = _ShareSheetBundle();
  id v5 = [v4 localizedStringForKey:@"Send Copy" value:@"Send Copy" table:@"Localizable"];

  id v6 = objc_alloc(getLPImageClass());
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.fill"];
  Class v8 = (void *)[v6 initWithPlatformImage:v7];

  id v9 = objc_alloc(getLPImageClass());
  int v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc"];
  long long v11 = (void *)[v9 initWithPlatformImage:v10];

  id v12 = [(objc_class *)getLPButtonActionClass() actionWithTitle:v5 image:v11 handler:v3];

  [v12 setVisibleImage:v8];
  [v12 setSelected:a1 ^ 1u];

  return v12;
}

id UIActivityContentHelperCollaborationSubtitle(void *a1)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    SEL v4 = _ShareSheetBundle();
    id v3 = [v4 localizedStringForKey:@"COLLABORATION_HEADER_SUBTITLE" value:@"Collaboration" table:@"Localizable"];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v6 = [NSString stringWithFormat:@" %@", v3];
  v26[0] = *MEMORY[0x1E4FB12B8];
  id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v27[0] = v7;
  v26[1] = *MEMORY[0x1E4FB12B0];
  Class v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v27[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  int v10 = (void *)[v5 initWithString:v6 attributes:v9];

  long long v11 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  id v12 = (void *)MEMORY[0x1E4FB1830];
  id v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v14 = [v12 configurationWithHierarchicalColor:v13];
  int v15 = [v11 configurationByApplyingConfiguration:v14];

  id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill" withConfiguration:v15];
  id v17 = objc_alloc_init(MEMORY[0x1E4FB1398]);
  [v17 setImage:v16];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    [v10 size];
    double v19 = v18 + 2.0;
    [v16 size];
    double v21 = v20;
    [v16 size];
    objc_msgSend(v17, "setBounds:", 0.0, -2.0, v21 * (v19 / v22), v19);
  }
  long long v23 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
  long long v24 = (void *)[v23 mutableCopy];

  [v24 appendAttributedString:v10];
  return v24;
}

Class initLPButtonAction()
{
  if (LinkPresentationLibrary_sOnce_4 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_4, &__block_literal_global_30);
  }
  Class result = objc_getClass("LPButtonAction");
  classLPButtonAction = (uint64_t)result;
  getLPButtonActionClass = (uint64_t (*)())LPButtonActionFunction;
  return result;
}

id LPButtonActionFunction()
{
  return (id)classLPButtonAction;
}

void *__LinkPresentationLibrary_block_invoke_4()
{
  Class result = dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_4 = (uint64_t)result;
  return result;
}

Class initLPImage()
{
  if (LinkPresentationLibrary_sOnce_4 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_4, &__block_literal_global_30);
  }
  Class result = objc_getClass("LPImage");
  classLPImage = (uint64_t)result;
  getLPImageClass = (uint64_t (*)())LPImageFunction;
  return result;
}

id LPImageFunction()
{
  return (id)classLPImage;
}

void sub_1A0B48024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B4AAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B4ABD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B4AEA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1A0B4BAFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(void *a1, const char *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = a1;
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Attempt to invoke -%@ on %@, which is not supported for proxies to out-of-process activities.", v6, v5 format];
}

id _UIActivityGetBuiltinActivities()
{
  v17[15] = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(UIAirDropActivity);
  v17[0] = v16;
  int v15 = objc_alloc_init(UISharePlayActivity);
  v17[1] = v15;
  uint64_t v14 = objc_alloc_init(UICollaborationInviteWithLinkActivity);
  v17[2] = v14;
  id v13 = objc_alloc_init(UICollaborationCopyLinkActivity);
  v17[3] = v13;
  id v12 = objc_alloc_init(SUIShareActivity);
  v17[4] = v12;
  long long v11 = objc_alloc_init(UIAddToReadingListActivity);
  v17[5] = v11;
  os_log_t v0 = objc_alloc_init(UISaveToCameraRollActivity);
  v17[6] = v0;
  id v1 = objc_alloc_init(UICopyToPasteboardActivity);
  v17[7] = v1;
  double v2 = objc_alloc_init(UIAssignToContactActivity);
  v17[8] = v2;
  id v3 = objc_alloc_init(UIPrintActivity);
  v17[9] = v3;
  uint64_t v4 = objc_alloc_init(_UICloudSharingActivity);
  v17[10] = v4;
  id v5 = objc_alloc_init(UIMessageActivity);
  v17[11] = v5;
  id v6 = objc_alloc_init(UIMailActivity);
  v17[12] = v6;
  id v7 = objc_alloc_init(SHQuickNoteActivity);
  v17[13] = v7;
  Class v8 = objc_alloc_init(UIAddToHomeScreenActivity);
  v17[14] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:15];

  return v9;
}

id _UIActivityGetPrintingBasedActivities()
{
  if (_UIActivityGetPrintingBasedActivities_once != -1) {
    dispatch_once(&_UIActivityGetPrintingBasedActivities_once, &__block_literal_global_31);
  }
  os_log_t v0 = (void *)_UIActivityGetPrintingBasedActivities___printingBasedActivities;
  return v0;
}

id _UIActivityGetOrderedBuiltinActivitiesFromActivities(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    double v2 = +[_UIActivityUserDefaults builtinActivityOrder];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___UIActivityGetOrderedBuiltinActivitiesFromActivities_block_invoke;
    v6[3] = &unk_1E5A23070;
    id v7 = v2;
    id v3 = v2;
    uint64_t v4 = [v1 sortedArrayWithOptions:16 usingComparator:v6];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

uint64_t _UIActivityCanDisplayActivityForApplicationProxy(void *a1)
{
  id v1 = [a1 appState];
  double v2 = v1;
  if (v1 && [v1 isInstalled]) {
    uint64_t v3 = [v2 isRestricted] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _UIActivityCanDisplayActivityForApplicationWithBundleID(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a1];
  uint64_t CanDisplayActivityForApplicationProxy = _UIActivityCanDisplayActivityForApplicationProxy(v1);

  return CanDisplayActivityForApplicationProxy;
}

void sub_1A0B4EBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B4FC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B50374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B50960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B51658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ScanForPrintingItems(void *a1, void *a2, char *a3, char *a4, BOOL *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = [v9 allValues];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          ScanForPrintingItems(*(void *)(*((void *)&v30 + 1) + 8 * i), v10, a3, a4, a5);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
LABEL_9:

    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([MEMORY[0x1E4F934B0] canPrintData:v9])
    {
      [v10 addObject:v9];
      id v16 = CGImageSourceCreateWithData((CFDataRef)v9, 0);
      if (v16)
      {
        id v17 = v16;
        CFStringRef Type = CGImageSourceGetType(v16);
        if (Type) {
          BOOL v19 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;
        }
        else {
          BOOL v19 = 0;
        }
        CFRelease(v17);
      }
      else
      {
        BOOL v19 = 0;
      }
      if (*a3) {
        char v25 = 1;
      }
      else {
        char v25 = v19;
      }
      *a3 = v25;
      if (*a4) {
        char v26 = 1;
      }
      else {
        char v26 = !v19;
      }
      *a4 = v26;
      *a5 = !v19;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 isFileURL])
    {
      if (![MEMORY[0x1E4F934B0] canPrintURL:v9]) {
        goto LABEL_38;
      }
      [v10 addObject:v9];
      _UIActivityUTIForURL(v9);
      CFStringRef v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      long long v11 = (void *)v20;
      if (v20
        && UTTypeConformsTo(v20, (CFStringRef)*MEMORY[0x1E4F225F8])
        && (CGImageSourceRef v21 = CGImageSourceCreateWithURL((CFURLRef)v9, 0)) != 0)
      {
        CFRelease(v21);
        char v22 = 1;
      }
      else
      {
        char v22 = 0;
      }
      if (*a3) {
        char v27 = 1;
      }
      else {
        char v27 = v22;
      }
      *a3 = v27;
      char v28 = v22 ^ 1;
      if (*a4) {
        char v29 = 1;
      }
      else {
        char v29 = v28;
      }
      *a4 = v29;
      *a5 = v28;
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = [v9 scheme];
      uint64_t v24 = [v23 compare:@"assets-library" options:1];

      if (!v24)
      {
        if ([MEMORY[0x1E4F934B0] canPrintURL:v9])
        {
LABEL_16:
          [v10 addObject:v9];
          *a3 = 1;
        }
      }
    }
  }
LABEL_38:
}

void initSFUILinkMetadataSerializationForLocalUseOnly_0(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v7[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_4)
  {
    v7[1] = MEMORY[0x1E4F143A8];
    v7[2] = 3221225472;
    v7[3] = __SharingUILibraryCore_block_invoke_4;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5A231D8;
    uint64_t v9 = 0;
    SharingUILibraryCore_frameworkLibrary_4 = _sl_dlopen();
    id v6 = (void *)v7[0];
    id v5 = (void *)SharingUILibraryCore_frameworkLibrary_4;
    if (SharingUILibraryCore_frameworkLibrary_4)
    {
      if (!v7[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v6 = (void *)abort_report_np();
    }
    free(v6);
    goto LABEL_5;
  }
  id v5 = (void *)SharingUILibraryCore_frameworkLibrary_4;
LABEL_5:
  softLinkSFUILinkMetadataSerializationForLocalUseOnly_0 = (uint64_t (*)())dlsym(v5, "SFUILinkMetadataSerializationForLocalUseOnly");
  ((void (*)(id, id))softLinkSFUILinkMetadataSerializationForLocalUseOnly_0)(v3, v4);
}

uint64_t __SharingUILibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_4 = result;
  return result;
}

void sub_1A0B5812C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t _UISecureStandardPropertyListClasses()
{
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return objc_msgSend(v14, "setWithObjects:", v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

id _UISecureDecodeExtensionItemsWithKey(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C78];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 valueForKey:@"_extensionContextHostProtocolAllowedClassesForItems"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = _UISecureStandardPropertyListClasses();
  [v7 unionSet:v8];

  uint64_t v9 = [v5 decodeObjectOfClasses:v7 forKey:v4];

  return v9;
}

void _UISecureEncodeCGSizeWithKey(void *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4F29238];
  id v8 = a2;
  id v9 = a1;
  objc_msgSend(v7, "valueWithCGSize:", a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v10 forKey:v8];
}

double _UISecureDecodeCGSizeWithKeyAndDefaultSize(void *a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:v5];

  if (v7)
  {
    [v7 CGSizeValue];
    a3 = v8;
  }

  return a3;
}

void sub_1A0B58CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary();
  }
}

void LinkPresentationLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __LinkPresentationLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A23278;
    uint64_t v3 = 0;
    LinkPresentationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!LinkPresentationLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __LinkPresentationLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getLPImageClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getLPImageClass_block_invoke_cold_1();
    return (Class)+[UIAddToReadingListActivity _xpcAttributes];
  }
  return result;
}

Class initSSReadingList()
{
  if (SafariServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&SafariServicesLibrary_sOnce_0, &__block_literal_global_36);
  }
  Class result = objc_getClass("SSReadingList");
  classSSReadingList = (uint64_t)result;
  getSSReadingListClass = (uint64_t (*)())SSReadingListFunction;
  return result;
}

id SSReadingListFunction()
{
  return (id)classSSReadingList;
}

void *__SafariServicesLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 2);
  SafariServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1A0B5D438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initPHPhotoLibrary()
{
  if (PhotosLibrary_sOnce != -1) {
    dispatch_once(&PhotosLibrary_sOnce, &__block_literal_global_164);
  }
  Class result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary = (uint64_t)result;
  getPHPhotoLibraryClass = (uint64_t (*)())PHPhotoLibraryFunction;
  return result;
}

id PHPhotoLibraryFunction()
{
  return (id)classPHPhotoLibrary;
}

void *__PhotosLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  PhotosLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1A0B5E78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B5EE78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B5EEFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B5EFD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B5F118(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B5F1F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B5F2CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id iconsToIncludeInIconArrayForDocumentProxy(void *a1)
{
  id v1 = a1;
  long long v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v1 format:3];
  if (v3) {
    [v2 addObject:v3];
  }
  SEL v4 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v1 format:6];

  if (v4) {
    [v2 addObject:v4];
  }
  if (![v2 count])
  {
    id v5 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v1 format:4];

    if (v5) {
      [v2 addObject:v5];
    }
    SEL v4 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v1 format:7];

    if (v4) {
      [v2 addObject:v4];
    }
  }

  return v2;
}

void sub_1A0B5FA08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B60970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  id v4 = v3[10];
  char v27 = v3;
  char v5 = _UIAppUseModernRotationAndPresentationBehaviors();
  if (v4)
  {
    if ((v5 & 1) != 0
      || ([MEMORY[0x1E4FB16C8] currentDevice],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceIdiom],
          v6,
          (v7 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      id v9 = v3[10];
      id v10 = [v27[19] popoverPresentationController];
      [v10 setBarButtonItem:v9];

      id v11 = [v3[10] view];
      double v8 = v11;
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          uint64_t v13 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v12];
          if (v13) {
            break;
          }
          uint64_t v14 = [v12 superview];

          uint64_t v12 = (void *)v14;
        }
        while (v14);
      }
      else
      {
        uint64_t v13 = 0;
      }
      [v13 presentViewController:v27[19] animated:a2 completion:0];
    }
    else
    {
      double v8 = [v27 popoverController];
      [v8 presentPopoverFromBarButtonItem:v3[10] permittedArrowDirections:15 animated:a2];
    }
  }
  else if ((v5 & 1) != 0 {
         || ([MEMORY[0x1E4FB16C8] currentDevice],
  }
             int v15 = objc_claimAutoreleasedReturnValue(),
             uint64_t v16 = [v15 userInterfaceIdiom],
             v15,
             (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    double v17 = *((double *)v27 + 5);
    double v18 = *((double *)v27 + 6);
    double v19 = *((double *)v27 + 7);
    double v20 = *((double *)v27 + 8);
    CGImageSourceRef v21 = [v27[19] popoverPresentationController];
    objc_msgSend(v21, "setSourceRect:", v17, v18, v19, v20);

    id v22 = v27[9];
    long long v23 = [v27[19] popoverPresentationController];
    [v23 setSourceView:v22];

    id v24 = v27[9];
    if (v24)
    {
      char v25 = v24;
      do
      {
        double v8 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v25];
        if (v8) {
          break;
        }
        uint64_t v26 = [v25 superview];

        char v25 = (void *)v26;
      }
      while (v26);
    }
    else
    {
      double v8 = 0;
    }
    [v8 presentViewController:v27[19] animated:a2 completion:0];
  }
  else
  {
    double v8 = [v27 popoverController];
    objc_msgSend(v8, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v27[9], 15, a2, *((double *)v27 + 5), *((double *)v27 + 6), *((double *)v27 + 7), *((double *)v27 + 8));
  }
}

void sub_1A0B610EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A0B616B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A0B61F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1A0B627B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_1A0B62CA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A0B62E8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A0B633A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B638E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __genericDocumentIcons_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F22430];
  id v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/content"];
  id v4 = [v0 documentProxyForURL:v1 isContentManaged:0 sourceAuditToken:0];

  uint64_t v2 = iconsToIncludeInIconArrayForDocumentProxy(v4);
  uint64_t v3 = (void *)genericDocumentIcons_icons;
  genericDocumentIcons_icons = v2;
}

void __passKitIconsIfIsPassKitDocument_block_invoke()
{
  if (PassKitLibrary_sOnce != -1) {
    dispatch_once(&PassKitLibrary_sOnce, &__block_literal_global_439);
  }
  if (PassKitUILibrary_sOnce != -1) {
    dispatch_once(&PassKitUILibrary_sOnce, &__block_literal_global_442);
  }
  id v2 = objc_alloc_init(NSClassFromString(&cfstr_Pkpass.isa));
  uint64_t v0 = [v2 mailAttachmentIcon];
  id v1 = (void *)passKitIconsIfIsPassKitDocument_genericPassIcon;
  passKitIconsIfIsPassKitDocument_genericPassIcon = v0;
}

void *__PassKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__PassKitUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitUI.framework/PassKitUI", 2);
  PassKitUILibrary_sLib = (uint64_t)result;
  return result;
}

void initFPExtendBookmarkForDocumentURL(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = FileProviderLibrary_sOnce_0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&FileProviderLibrary_sOnce_0, &__block_literal_global_448);
  }
  softLinkFPExtendBookmarkForDocumentURL = (uint64_t (*)())dlsym((void *)FileProviderLibrary_sLib_0, "FPExtendBookmarkForDocumentURL");
  ((void (*)(uint64_t, uint64_t, id))softLinkFPExtendBookmarkForDocumentURL)(a1, a2, v6);
}

void *__FileProviderLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
  FileProviderLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1A0B661D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id tempURLForJobName(void *a1)
{
  id v1 = [a1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
  if ((unint64_t)[v1 length] >= 0x51)
  {
    uint64_t v2 = [v1 substringToIndex:80];

    id v1 = (void *)v2;
  }
  uint64_t v3 = NSString;
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = [v3 stringWithFormat:@"%@/%@.pdf", v4, v1];

  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];

  return v6;
}

Class initMCProfileConnection_3()
{
  if (ManagedConfigurationLibrary_sOnce_3 != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce_3, &__block_literal_global_39);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_3 = (uint64_t)result;
  getMCProfileConnectionClass_3 = (uint64_t (*)())MCProfileConnectionFunction_3;
  return result;
}

id MCProfileConnectionFunction_3()
{
  return (id)classMCProfileConnection_3;
}

void *__ManagedConfigurationLibrary_block_invoke_3()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_3 = (uint64_t)result;
  return result;
}

void sh_dispatch_on_main_queue(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    id v1 = block;
  }
}

void sub_1A0B66F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_1A0B672AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_1A0B676B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_1A0B68870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A0B6AB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B6B3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initSFUILoadedMetadataCollection()
{
  if (SharingUILibrary_sOnce_2 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_2, &__block_literal_global_40);
  }
  Class result = objc_getClass("SFUILoadedMetadataCollection");
  classSFUILoadedMetadataCollection = (uint64_t)result;
  getSFUILoadedMetadataCollectionClass = (uint64_t (*)())SFUILoadedMetadataCollectionFunction;
  return result;
}

id SFUILoadedMetadataCollectionFunction()
{
  return (id)classSFUILoadedMetadataCollection;
}

void *__SharingUILibrary_block_invoke_2()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_2 = (uint64_t)result;
  return result;
}

void _UIShimSetIsContentManaged(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_respondsToSelector()) {
    [v3 setIsContentManaged:a2];
  }
  else {
    [v3 setSourceIsManaged:a2];
  }
}

void _UIShimSetUnderbarIsContentManaged(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_respondsToSelector()) {
    [v3 _setIsContentManaged:a2];
  }
  else {
    [v3 _setSourceIsManaged:a2];
  }
}

Class initTUCallCenter()
{
  if (TelephonyUtilitiesLibrary_sOnce != -1) {
    dispatch_once(&TelephonyUtilitiesLibrary_sOnce, &__block_literal_global_57);
  }
  Class result = objc_getClass("TUCallCenter");
  classTUCallCenter = (uint64_t)result;
  getTUCallCenterClass = (uint64_t (*)())TUCallCenterFunction;
  return result;
}

id TUCallCenterFunction()
{
  return (id)classTUCallCenter;
}

void *__TelephonyUtilitiesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 2);
  TelephonyUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1A0B6C474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B6CAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSceneWorkspaceClass_block_invoke_0(uint64_t a1)
{
  FrontBoardLibrary_0();
  Class result = objc_getClass("FBSceneWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFBSceneWorkspaceClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFBSceneWorkspaceClass_block_invoke_cold_1();
    return (Class)__FrontBoardLibraryCore_block_invoke_0();
  }
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  FrontBoardLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __UIEnumerateApplicationsInPreferredOrderForOpeningDocument(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = *MEMORY[0x1E4F224A8];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F224A8]];
  uint64_t v7 = [v3 applicationsAvailableForOpeningWithHandlerRanks:v6 error:0];
  double v8 = [v7 objectForKey:v5];
  id v9 = (void *)[v8 mutableCopy];

  [v3 applicationsAvailableForOpeningWithError:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
      uint64_t v16 = [v9 containsObject:v15];
      char v17 = 0;
      v4[2](v4, v15, v16, &v17);
      if (v17) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void _UIEnumerateApplicationsInPreferredOrderForOpeningDocument(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = [v5 containerOwnerApplicationIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___UIEnumerateApplicationsInPreferredOrderForOpeningDocument_block_invoke;
  v13[3] = &unk_1E5A236E0;
  id v14 = v6;
  id v15 = v8;
  id v16 = v5;
  id v17 = v7;
  id v9 = v7;
  id v10 = v5;
  id v11 = v8;
  id v12 = v6;
  __UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v10, v13);
}

uint64_t _UISUIActivityRealActivityTypeForOpeningDocumentWithApplicationID(uint64_t a1)
{
  return [NSString stringWithFormat:@"com.apple.UIKit.activity.OpenWithApp-%@", a1];
}

id _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"applicationIdentifier";
  v6[0] = a1;
  id v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = a1;
  id v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id _UISUIActivityExtensionItemDataRequestForOpeningDocumentWithApplicationByCopy(void *a1, int a2)
{
  id v3 = UIActivityTypeRemoteOpenInApplicationUsingByCopyOpeningMethod;
  if (!a2) {
    id v3 = UIActivityTypeRemoteOpenInApplicationUsingInPlaceOpeningMethod;
  }
  id v4 = *v3;
  id v5 = _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID(a1);
  id v6 = objc_opt_new();
  id v7 = +[UISUIActivityExtensionItemDataRequest requestForActivity:v6 activityType:v4 activitySpecificMetadata:v5];

  return v7;
}

BOOL _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(void *a1, void *a2)
{
  id v3 = a1;
  if (objc_msgSend(a2, "ui_canOpenInPlace"))
  {
    id v4 = [v3 dataContainerURL];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t _UIApplicationCanOpenInPlaceByReferenceOriginalFile(void *a1, void *a2)
{
  id v3 = a1;
  if (objc_msgSend(a2, "ui_canOpenInPlace")) {
    uint64_t v4 = [v3 supportsOpenInPlace];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL _UIIsArchiveExtension(void *a1)
{
  id v1 = a1;
  if (v1
    && (CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v1, 0)) != 0)
  {
    CFStringRef v3 = PreferredIdentifierForTag;
    BOOL v4 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E4F22748])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F225E0])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F22560])
      || UTTypeConformsTo(v3, @"org.gnu.gnu-tar-archive") != 0;
    CFRelease(v3);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t _UIIsIWorkArchiveURL(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1
    && ([v1 pathExtension],
        CFStringRef v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = _UIIsArchiveExtension(v3),
        v3,
        v4))
  {
    BOOL v5 = [v2 lastPathComponent];
    id v6 = _UIStringByDeletingArchiveExtensions(v5);

    id v7 = [v6 pathExtension];
    if ([v7 length])
    {
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F224F8];
      id v9 = [v6 pathExtension];
      CFStringRef PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v8, v9, 0);

      id v11 = [(__CFString *)PreferredIdentifierForTag lowercaseString];
      uint64_t v12 = [v11 hasPrefix:@"com.apple.iwork"];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id _UIStringByDeletingArchiveExtensions(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  CFStringRef v3 = [v1 pathExtension];
  if ([v3 length])
  {
    while (_UIIsArchiveExtension(v3))
    {
      BOOL v4 = [v2 firstObject];
      char v5 = [v4 isEqualToString:v3];

      if ((v5 & 1) == 0) {
        [v2 insertObject:v3 atIndex:0];
      }
      id v6 = [v1 stringByDeletingPathExtension];

      id v7 = [v6 pathExtension];

      CFStringRef v3 = v7;
      id v1 = v6;
      if (![v7 length]) {
        goto LABEL_8;
      }
    }
  }
  id v6 = v1;
  id v7 = v3;
LABEL_8:

  return v6;
}

id _UIActivityDefaultOpenApplicationLaunchServiceOptions()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F626A0];
  v3[0] = *MEMORY[0x1E4F62688];
  v3[1] = v0;
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = MEMORY[0x1E4F1CC38];
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

void _setIsContentManagedIfResctrictableActivity(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 conformsToProtocol:&unk_1EF35DBA0]) {
    [v3 setIsContentManaged:a2];
  }
}

uint64_t _canPerformActivityWithItems(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v7 conformsToProtocol:&unk_1EF35DBA0]) {
    [v7 setSourceApplicationBundleID:v9];
  }
  if (!v10) {
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v7 canPerformWithCollaborationItem:v10 activityItems:v8];
LABEL_8:
    uint64_t v12 = v11;
    goto LABEL_9;
  }
  if ([(id)objc_opt_class() activityCategory])
  {
LABEL_7:
    uint64_t v11 = [v7 canPerformWithActivityItems:v8];
    goto LABEL_8;
  }
  id v14 = [v10 sendCopyItemPlaceholderValues];
  _UIActivityItemTypesSet(v14);
  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = v8;
  }
  uint64_t v12 = [v7 canPerformWithActivityItems:v15];
  if (v14)
  {
    _UIActivityItemTypesSet(v8);
  }
LABEL_9:

  return v12;
}

id _mapArray(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = a2;
  char v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

void sub_1A0B710F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void PeopleSuggesterLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PeopleSuggesterLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A237B8;
    uint64_t v3 = 0;
    PeopleSuggesterLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PeopleSuggesterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PeopleSuggesterLibraryCore_frameworkLibrary = result;
  return result;
}

Class initCNContactPickerViewController()
{
  if (ContactsUILibrary_sOnce != -1) {
    dispatch_once(&ContactsUILibrary_sOnce, &__block_literal_global_45);
  }
  Class result = objc_getClass("CNContactPickerViewController");
  classCNContactPickerViewController = (uint64_t)result;
  getCNContactPickerViewControllerClass = (uint64_t (*)())CNContactPickerViewControllerFunction;
  return result;
}

id CNContactPickerViewControllerFunction()
{
  return (id)classCNContactPickerViewController;
}

void *__ContactsUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 2);
  ContactsUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initCNContactViewController()
{
  if (ContactsUILibrary_sOnce != -1) {
    dispatch_once(&ContactsUILibrary_sOnce, &__block_literal_global_45);
  }
  Class result = objc_getClass("CNContactViewController");
  classCNContactViewController = (uint64_t)result;
  getCNContactViewControllerClass = (uint64_t (*)())CNContactViewControllerFunction;
  return result;
}

id CNContactViewControllerFunction()
{
  return (id)classCNContactViewController;
}

id initValCNContactThumbnailImageDataKey()
{
  if (ContactsLibrary_sOnce != -1) {
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_143);
  }
  uint64_t v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactThumbnailImageDataKey");
  if (v0) {
    objc_storeStrong((id *)&constantValCNContactThumbnailImageDataKey, *v0);
  }
  getCNContactThumbnailImageDataKey = (uint64_t (*)())CNContactThumbnailImageDataKeyFunction;
  id v1 = (void *)constantValCNContactThumbnailImageDataKey;
  return v1;
}

id CNContactThumbnailImageDataKeyFunction()
{
  return (id)constantValCNContactThumbnailImageDataKey;
}

void *__ContactsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 2);
  ContactsLibrary_sLib = (uint64_t)result;
  return result;
}

id initValCNContactCropRectKey()
{
  if (ContactsLibrary_sOnce != -1) {
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_143);
  }
  uint64_t v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactCropRectKey");
  if (v0) {
    objc_storeStrong((id *)&constantValCNContactCropRectKey, *v0);
  }
  getCNContactCropRectKey = (uint64_t (*)())CNContactCropRectKeyFunction;
  id v1 = (void *)constantValCNContactCropRectKey;
  return v1;
}

id CNContactCropRectKeyFunction()
{
  return (id)constantValCNContactCropRectKey;
}

id initValCNContactFullscreenImageDataKey()
{
  if (ContactsLibrary_sOnce != -1) {
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_143);
  }
  uint64_t v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactFullscreenImageDataKey");
  if (v0) {
    objc_storeStrong((id *)&constantValCNContactFullscreenImageDataKey, *v0);
  }
  getCNContactFullscreenImageDataKey = (uint64_t (*)())CNContactFullscreenImageDataKeyFunction;
  id v1 = (void *)constantValCNContactFullscreenImageDataKey;
  return v1;
}

id CNContactFullscreenImageDataKeyFunction()
{
  return (id)constantValCNContactFullscreenImageDataKey;
}

void sub_1A0B74A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SHSheetIsPresentedInPopover(void *a1)
{
  id v1 = a1;
  BOOL v2 = 1;
  uint64_t v3 = [v1 _existingPresentationControllerImmediate:0 effective:1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = [v1 popoverPresentationController];
    if (!v4)
    {
      char v5 = [v1 _popoverController];
      BOOL v2 = v5 != 0;
    }
  }

  return v2;
}

uint64_t SHSheetPresentationControllerPresentationStyle(void *a1)
{
  id v1 = [a1 _existingPresentationControllerImmediate:0 effective:1];
  if (v1 || !_ShareSheetPlatformPrefersPopover()) {
    uint64_t v2 = [v1 presentationStyle];
  }
  else {
    uint64_t v2 = 7;
  }

  return v2;
}

void sub_1A0B76120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A0B764A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

Class initSFAirDropViewController()
{
  if (SharingUILibrary_sOnce_3 != -1) {
    dispatch_once(&SharingUILibrary_sOnce_3, &__block_literal_global_47);
  }
  Class result = objc_getClass("SFAirDropViewController");
  classSFAirDropViewController = (uint64_t)result;
  getSFAirDropViewControllerClass = (uint64_t (*)())SFAirDropViewControllerFunction;
  return result;
}

id SFAirDropViewControllerFunction()
{
  return (id)classSFAirDropViewController;
}

void *__SharingUILibrary_block_invoke_3()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_3 = (uint64_t)result;
  return result;
}

void sub_1A0B78C1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    uint64_t v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SHSheetImageIdentificationUtilities personIdResultsFromImage:]((uint64_t)v10, v11);
    }

    objc_end_catch();
    JUMPOUT(0x1A0B78BFCLL);
  }
  _Unwind_Resume(exception_object);
}

id getMADPersonIdentificationRequestClass()
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMADPersonIdentificationRequestClass_softClass;
  uint64_t v7 = getMADPersonIdentificationRequestClass_softClass;
  if (!getMADPersonIdentificationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    void v3[2] = __getMADPersonIdentificationRequestClass_block_invoke;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getMADPersonIdentificationRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0B78D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMADPersonIdentificationRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADPersonIdentificationRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADPersonIdentificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADPersonIdentificationRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary();
  }
}

void MediaAnalysisServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5A23848;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getMADServiceClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (_UIActivityGroupViewFlowLayout *)__getMADServiceClass_block_invoke_cold_1();
    [(_UIActivityGroupViewFlowLayout *)v2 setEditingGestureRecognizer:v4];
  }
}

void sub_1A0B79E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B7BEAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0B7C0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPiTunesMediaPlaylistMetadataClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    void v4[3] = __LinkPresentationLibraryCore_block_invoke_2;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A23920;
    uint64_t v6 = 0;
    LinkPresentationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!LinkPresentationLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LPiTunesMediaPlaylistMetadata");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLPiTunesMediaPlaylistMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LinkPresentationLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1A0B7C960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initSLComposeViewController()
{
  if (SocialLibrary_sOnce != -1) {
    dispatch_once(&SocialLibrary_sOnce, &__block_literal_global_49);
  }
  Class result = objc_getClass("SLComposeViewController");
  classSLComposeViewController = (uint64_t)result;
  getSLComposeViewControllerClass = (uint64_t (*)())SLComposeViewControllerFunction;
  return result;
}

id SLComposeViewControllerFunction()
{
  return (id)classSLComposeViewController;
}

void *__SocialLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Social.framework/Social", 2);
  SocialLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSSVMediaSocialShareExtension()
{
  if (StoreServicesLibrary_sOnce != -1) {
    dispatch_once(&StoreServicesLibrary_sOnce, &__block_literal_global_125);
  }
  Class result = objc_getClass("SSVMediaSocialShareExtension");
  classSSVMediaSocialShareExtension = (uint64_t)result;
  getSSVMediaSocialShareExtensionClass = (uint64_t (*)())SSVMediaSocialShareExtensionFunction;
  return result;
}

id SSVMediaSocialShareExtensionFunction()
{
  return (id)classSSVMediaSocialShareExtension;
}

void *__StoreServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1A0B7EAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

UISUISecurityContext *airdropSupplementalSecurityContextForURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 path];
  SEL v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"/var/tmp", @"/var/mobile", @"/var/root", @"/var", @"/", 0);
  id v4 = +[UISUISecurityScopedResource scopedResourcesForAncestorsOfItemWithAbsolutePath:v2 traversalStopPaths:v3 allowedAccess:1];
  long long v5 = +[UISUISecurityScopedResource scopedResourceWithURL:v1 allowedAccess:1];

  if (v5)
  {
    uint64_t v6 = [v4 arrayByAddingObject:v5];

    id v4 = (void *)v6;
  }
  uint64_t v7 = [[UISUISecurityContext alloc] initWithSecurityScopedResources:v4];

  return v7;
}

void sub_1A0B7F4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B82D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B83028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B831B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B8342C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WebPrivacyLibraryCore()
{
  if (!WebPrivacyLibraryCore_frameworkLibrary) {
    WebPrivacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WebPrivacyLibraryCore_frameworkLibrary;
}

uint64_t __WebPrivacyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebPrivacyLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A0B84B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIActivityGroupActivityCellFont(void *a1, void *a2)
{
  SEL v3 = a1;
  id v4 = a2;
  if (v3 && UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    maximumSizeCategory(v4);
    long long v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v3, v5);

    if (v6 != NSOrderedAscending)
    {
      uint64_t v7 = maximumSizeCategory(v4);

      SEL v3 = (NSString *)v7;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4FB17A0];
    uint64_t v9 = *MEMORY[0x1E4FB28C8];
    uint64_t v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];
    uint64_t v11 = [v8 preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v10];

    uint64_t v12 = [v11 fontDescriptorWithSymbolicTraits:0x8000];

    uint64_t v13 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v12 size:0.0];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v12 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v12 _scaledValueForValue:11.0];
    uint64_t v13 = objc_msgSend(v14, "systemFontOfSize:");
  }
  long long v15 = (void *)v13;

  return v15;
}

_UIActivityGroupActivityCellTitleLabel *createTitleLabel()
{
  uint64_t v0 = objc_alloc_init(_UIActivityGroupActivityCellTitleLabel);
  id v1 = [MEMORY[0x1E4FB1618] darkTextColor];
  [(_UIActivityGroupActivityCellTitleLabel *)v0 setTextColor:v1];

  uint64_t v2 = [MEMORY[0x1E4FB1618] clearColor];
  [(_UIActivityGroupActivityCellTitleLabel *)v0 setBackgroundColor:v2];

  [(_UIActivityGroupActivityCellTitleLabel *)v0 setMinimumScaleFactor:0.75];
  [(_UIActivityGroupActivityCellTitleLabel *)v0 setTextAlignment:1];
  return v0;
}

double getChickletSize()
{
  uint64_t v0 = +[UIActivity _activityImageForActionRepresentationImage:0];
  [v0 size];
  double v2 = v1;

  return v2;
}

double getTitleLabelHeightForWidthTextAndSizeCategory(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)sTitleLabel;
  if (!sTitleLabel)
  {
    uint64_t v8 = createTitleLabel();
    uint64_t v9 = (void *)sTitleLabel;
    sTitleLabel = v8;

    uint64_t v7 = (void *)sTitleLabel;
  }
  [v7 setText:v5];
  objc_msgSend((id)sTitleLabel, "sizeThatFits:sizeCategory:", v6, a3, 1.79769313e308);
  double v11 = v10;
  NSLog(&cfstr_ReturningThisH.isa, *(void *)&v10);

  return v11;
}

id getTitleLabelFontForWidthTextAndSizeCategory(void *a1, double a2)
{
  id v3 = a1;
  id v4 = (void *)sTitleLabel;
  if (!sTitleLabel)
  {
    uint64_t v5 = createTitleLabel();
    id v6 = (void *)sTitleLabel;
    sTitleLabel = v5;

    id v4 = (void *)sTitleLabel;
  }
  [v4 setText:@"\n"];
  objc_msgSend((id)sTitleLabel, "sizeThatFits:sizeCategory:", v3, a2, 1.79769313e308);
  objc_msgSend((id)sTitleLabel, "setFrame:", 0.0, 0.0, a2, v7);
  uint64_t v8 = [(id)sTitleLabel font];

  return v8;
}

id maximumSizeCategory(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __maximumSizeCategory_block_invoke;
  block[3] = &unk_1E5A21900;
  id v7 = v1;
  uint64_t v2 = maximumSizeCategory_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&maximumSizeCategory_onceToken, block);
  }
  id v4 = (id)maximumSizeCategory_maxCategory;

  return v4;
}

void __maximumSizeCategory_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  id v3 = (void **)MEMORY[0x1E4FB2798];
  if (v2 >= v1) {
    double v4 = v1;
  }
  else {
    double v4 = v2;
  }
  if (v4 > 320.0) {
    id v3 = (void **)MEMORY[0x1E4FB2790];
  }
  uint64_t v5 = *v3;
  objc_storeStrong((id *)&maximumSizeCategory_maxCategory, v5);
}

id getSFUIShareSheetActivityCellSpecClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSFUIShareSheetActivityCellSpecClass_softClass_0;
  uint64_t v7 = getSFUIShareSheetActivityCellSpecClass_softClass_0;
  if (!getSFUIShareSheetActivityCellSpecClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    void v3[2] = __getSFUIShareSheetActivityCellSpecClass_block_invoke_0;
    v3[3] = &unk_1E5A216E8;
    v3[4] = &v4;
    __getSFUIShareSheetActivityCellSpecClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0B86D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetActivityCellSpecClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharingUILibraryCore_frameworkLibrary_5)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    void v4[3] = __SharingUILibraryCore_block_invoke_5;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A23BB0;
    uint64_t v6 = 0;
    SharingUILibraryCore_frameworkLibrary_5 = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!SharingUILibraryCore_frameworkLibrary_5)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFUIShareSheetActivityCellSpec");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)__getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFUIShareSheetActivityCellSpecClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingUILibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  SharingUILibraryCore_frameworkLibrary_5 = result;
  return result;
}

void sub_1A0B8C684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SHSheetContentHelperFindScrollView(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28F60];
  id v2 = a1;
  id v3 = [v1 predicateWithBlock:&__block_literal_global_54];
  uint64_t v4 = [v2 subviews];

  long long v5 = [v4 filteredArrayUsingPredicate:v3];

  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_4];

  return v6;
}

uint64_t __SHSheetContentHelperFindScrollView_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __SHSheetContentHelperFindScrollView_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  return v6 > v8;
}

void __SHSheetModeRestrictionAlertController_block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = [*a1 alertRecoverySuggestionButtonLaunchURL];
  int v6 = 138412546;
  double v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "### Launch URL failed: %@, %@\n", (uint8_t *)&v6, 0x16u);
}

uint64_t __getSLCollaborationFooterViewModelClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPLinkMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SHSheetContentDataSourceManager _updateCurrentStateWithChangeRequest:](v0);
}

uint64_t __getSFUIActivityImageProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_SWCollaborationShareOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1(v0);
}

uint64_t __getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1(v0);
}

void _loadItemProvidersFromActivityItemsStartingAtIndex_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Could not load any suitable representation of item at index %{public}d. Dropping it.", (uint8_t *)v2, 8u);
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_524_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A0AD8000, v0, v1, "Loading item at index %{public}d as  URL for copy type identifier caused an error: %{public}@");
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_527_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A0AD8000, v0, v1, "Loading item at index %{public}d as a URL caused an error: %{public}@");
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_529_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_ERROR, "Loading item at index %{public}d as a data object of type %{public}@ caused an error: %{public}@", v3, 0x1Cu);
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_532_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_ERROR, "Could not move file representation of item at index %{public}d of type %{public}@ to a temporary location.", v1, 0x12u);
}

void _newTempDir_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Could not create temporary directory. Error: %@", (uint8_t *)&v2, 0xCu);
}

void _newTempDir_cold_2(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A0AD8000, a1, OS_LOG_TYPE_ERROR, "Could not create temporary directory. Error: %s", (uint8_t *)&v4, 0xCu);
}

void ___loadItemProviderInline_block_invoke_550_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromClass(*(Class *)(a1 + 40));
  v6[0] = 67240706;
  v6[1] = MEMORY[0x1E4F148E0];
  __int16 v7 = 2114;
  __int16 v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "Loading item at index %{public}d as class %{public}@ caused an error: %{public}@", (uint8_t *)v6, 0x1Cu);
}

uint64_t __getFBSceneWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFBDisplayManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getFBDisplayManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[UIActivityContentViewController _configureAirDropCell:withChange:](v0);
}

void _ShareSheetCurrentDeviceClassFromPresentationStyle_cold_1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A0AD8000, a1, OS_LOG_TYPE_ERROR, "Screen size %{public}@ not recognized, falling back to 4.7\" iPhone specs", (uint8_t *)&v5, 0xCu);
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:request:delegate:](v0);
}

uint64_t __getSFAirDropViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSSharingOptionsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSSharingOptionsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSAddParticipantsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSAddParticipantsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_UIHostActivityProxy initWithCoder:](v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_EXQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getSYNotesActivationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSYNotesActivationCommandClass_block_invoke_cold_1(v0);
}

uint64_t __getSYNotesActivationCommandClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SHSheetServiceManager update](v0);
}

uint64_t __getLPImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:](v0);
}

uint64_t __getMADPersonIdentificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(UISocialActivity *)v0 initWithActivityType:v2];
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEndPage(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC8](url, mediaBox, auxiliaryInfo);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x1F41092D0]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  MEMORY[0x1F40DF7F0](line, charIndex, secondaryOffset);
  return result;
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F41165A0]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSDirectionalEdgeInsets NSDirectionalEdgeInsetsFromString(NSString *string)
{
  MEMORY[0x1F4166A90](string);
  result.trailing = v4;
  result.bottom = v3;
  result.leading = v2;
  result.top = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AB8](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t SFAirDropDeviceNameIsSuspicious()
{
  return MEMORY[0x1F4150208]();
}

uint64_t SFAirDropTransferChangeStateDescription()
{
  return MEMORY[0x1F4150210]();
}

uint64_t SFFilterStringsFromList()
{
  return MEMORY[0x1F4150280]();
}

uint64_t SFGenerateTypeList()
{
  return MEMORY[0x1F4150288]();
}

uint64_t SFIsImage()
{
  return MEMORY[0x1F4150290]();
}

uint64_t SFIsStringURLSafelyConvertible()
{
  return MEMORY[0x1F4150298]();
}

uint64_t SFLocalizedStringForKey()
{
  return MEMORY[0x1F41502A0]();
}

uint64_t SFNonBreakingStringFromDeviceName()
{
  return MEMORY[0x1F4150320]();
}

uint64_t SFSandboxExtensionDataByFileURLPathForURLs()
{
  return MEMORY[0x1F4150328]();
}

uint64_t SFSuggestedAirDropThumbnailSize()
{
  return MEMORY[0x1F4150330]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1F4166B10]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4166BB8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1F4166F10](videoPath);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE40](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFArrayRef)MEMORY[0x1F40DEE58](inTagClass, inTag, inConformingToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1F4116BF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _UIAppUseModernRotationAndPresentationBehaviors()
{
  return MEMORY[0x1F4166FA0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

uint64_t sf_dispatch_on_main_queue()
{
  return MEMORY[0x1F4150338]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}