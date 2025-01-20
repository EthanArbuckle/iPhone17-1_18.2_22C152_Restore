id PXPhotoKitLocalizedMessageForEmptyContainerCollection(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  if (_IsInProgressDuplicatesAlbum(a1))
  {
    v1 = PXLocalizationKeyByAddingDeviceModelSuffix(@"DUPLICATES_EMPTY_PROCESSING_DESCRIPTION_");
    v2 = PXLocalizedStringFromTable(v1, @"PhotosUICore");

    v3 = _PXEmptyPlaceholderAttributedMessageFromString(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t _IsInProgressDuplicatesAlbum(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    v3 = [v2 photoLibrary];
    int v4 = [v3 isInitialDuplicateDetectorProcessingCompleted];
    uint64_t v5 = [v2 assetCollectionSubtype];

    if (v5 == 1000000212) {
      uint64_t v6 = v4 ^ 1u;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id PXPhotoKitLocalizedTitleForEmptyContainerCollection(void *a1)
{
  if (_IsInProgressDuplicatesAlbum(a1))
  {
    id v1 = PXLocalizedStringFromTable(@"DUPLICATES_ALBUM_PROCESSING_TITLE", @"PhotosUICore");
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

id PXPhotoKitLocalizedMessageForRecentlyDeletedDaysRemainingAsset(void *a1, BOOL *a2)
{
  v3 = [a1 trashedDate];
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*MEMORY[0x1E4F8AE18]];
    uint64_t v6 = [v4 components:48 fromDate:v5 toDate:v3 options:0];
    uint64_t v7 = [v6 day];
    if (a2) {
      *a2 = v7 < 4;
    }
    v8 = @"RECENTLY_DELETED_DAYS_REMAINING_BANNER";
    if (v7 < 1) {
      v8 = @"RECENTLY_DELETED_LESS_THAN_DAYS_REMAINING_BANNER";
    }
    v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    v10 = PXLocalizedStringWithValidatedFormat(v9, @"%ld");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t PXSurveyQuestionIsAppleInternal()
{
  v0 = +[PXForYouSettings sharedInstance];
  uint64_t v1 = [v0 showSurveyQuestionsWithProfile] ^ 1;

  return v1;
}

PXRadarConfiguration *PXSurveyQuestionRadarConfiguration(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_alloc_init(PXRadarConfiguration);
  [(PXRadarConfiguration *)v5 setComponent:3];
  [(PXRadarConfiguration *)v5 setClassification:10];
  [(PXRadarConfiguration *)v5 setTitle:v4];

  uint64_t v6 = objc_msgSend(@"I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the metadata (\"time\", \"location\", \"people\", …) that I am providing with this submission, for the purpose of improving Photos Intelligence capabilities. Apple may not use the metadata in any other fashion than as provided herein. Please do not provide any metadata of images that contain third parties without their express written consent or for which you do not have sufficient rights.\n\n    I represent that the metadata are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein. I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the metadata.\n\n    I have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.\n", "uppercaseString");
  [(PXRadarConfiguration *)v5 setDescription:v6];

  [(PXRadarConfiguration *)v5 setKeywordIDs:v3];
  [(PXRadarConfiguration *)v5 setWantsSystemDiagnostics:0];
  [(PXRadarConfiguration *)v5 setWantsPhotosDiagnostics:1];
  return v5;
}

void PXGenerateSurveyQuestionsWithOptions(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke;
  v19[3] = &unk_1E5DD2B90;
  id v20 = v7;
  id v21 = v8;
  v9 = v19;
  id v10 = v7;
  id v11 = v8;
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = PHQuestionOptionsDebugDescription();
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Will try to generate %lu questions for options: %{public}@", buf, 0x16u);
  }
  v26[0] = *MEMORY[0x1E4F8B018];
  v14 = [NSNumber numberWithInteger:a1];
  v27[0] = v14;
  v26[1] = *MEMORY[0x1E4F8AFE0];
  v15 = [NSNumber numberWithUnsignedInteger:a2];
  v27[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  v17 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v18 = [v17 photoAnalysisClient];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___GenerateSurveyQuestionsWithOptions_block_invoke;
  v23 = &unk_1E5DD1780;
  id v24 = v9;
  uint64_t v25 = a1;
  [v18 requestGenerateQuestionsWithOptions:v16 reply:buf];
}

void __PXGenerateSurveyQuestionsWithOptions_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, 0);
    }
  }
  else
  {
    unint64_t v8 = [v5 code] - 27;
    v9 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderFailureAlertTitle", @"PhotosUICore");
    if (v8 >= 0xA)
    {
      PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderFailureAlertMessage", @"PhotosUICore");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_2;
      v29[3] = &unk_1E5DD3280;
      v17 = &v31;
      v23 = *(void **)(a1 + 32);
      id v31 = *(id *)(a1 + 40);
      v18 = &v30;
      id v30 = v6;
      PXPresentFailureWithLocalizedTitle(v9, v19, 0, v30, v23, v29);
    }
    else
    {
      id v10 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderFailureAlertMessageGraph", @"PhotosUICore");
      id v11 = +[PXRootSettings sharedInstance];
      int v12 = [v11 canShowInternalUI];

      if (v12)
      {
        v13 = NSString;
        v14 = [v6 localizedDescription];
        uint64_t v15 = [v13 stringWithFormat:@"%@\n\nINTERNAL ONLY:\n%@", v10, v14];

        id v10 = (void *)v15;
      }
      v16 = *(void **)(a1 + 32);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_3;
      v24[3] = &unk_1E5DD1730;
      v17 = &v25;
      id v25 = v9;
      v18 = &v26;
      id v19 = v10;
      id v26 = v19;
      id v28 = *(id *)(a1 + 40);
      id v20 = v6;
      id v27 = v20;
      id v21 = [v16 presentAlertWithConfigurationHandler:v24];
      if (!v21)
      {
        uint64_t v22 = *(void *)(a1 + 40);
        if (v22) {
          (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0, v20);
        }
      }
    }
  }
}

uint64_t __PXGenerateSurveyQuestionsWithOptions_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __PXGenerateSurveyQuestionsWithOptions_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:*(void *)(a1 + 40)];
  id v5 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_4;
  v6[3] = &unk_1E5DD3280;
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v5 style:0 action:v6];
}

uint64_t __PXGenerateSurveyQuestionsWithOptions_block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void PXGenerateSurveyQuestions(void *a1, void *a2)
{
}

void sub_1AB1E6E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

__CFString *PXDisplayMomentShareTypeDescription(uint64_t a1)
{
  uint64_t v1 = @"receiver";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"sender";
  }
}

id PXStoryDisplayAssetUUIDsFromFetchResult(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v2];
    if (v2 >= 1)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        id v5 = [v1 objectAtIndexedSubscript:i];
        uint64_t v6 = [v5 uuid];
        if (!v6)
        {
          v9 = [MEMORY[0x1E4F28B00] currentHandler];
          id v8 = [NSString stringWithUTF8String:"NSSet<NSString *> * _Nullable PXStoryDisplayAssetUUIDsFromFetchResult(__strong id<PXDisplayAssetFetchResult> _Nullable)"];
          [v9 handleFailureInFunction:v8, @"PXDisplayAssetFetchResult+PXStory.m", 23, @"missing UUID for %@", v5 file lineNumber description];
        }
        [v3 addObject:v6];
      }
    }
    uint64_t v2 = [v3 copy];
  }
  return (id)v2;
}

void sub_1AB1EE558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__293057(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__293058(uint64_t a1)
{
}

void sub_1AB1EED50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1AB1EF190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1AB1EF36C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AB1EFC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB1F0E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1AB1F1F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AB1F2640(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_1AB1F5550(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id _PXInfoMenuElementFocusViewColor()
{
  if (_PXInfoMenuElementFocusViewColor_onceToken != -1) {
    dispatch_once(&_PXInfoMenuElementFocusViewColor_onceToken, &__block_literal_global_293994);
  }
  v0 = (void *)_PXInfoMenuElementFocusViewColor_color;
  return v0;
}

id _PXInfoMenuElementFocusColor()
{
  if (_PXInfoMenuElementFocusColor_onceToken != -1) {
    dispatch_once(&_PXInfoMenuElementFocusColor_onceToken, &__block_literal_global_51_294009);
  }
  v0 = (void *)_PXInfoMenuElementFocusColor_color;
  return v0;
}

id _PXInfoMenuElementSelectedBackgroundColor()
{
  if (_PXInfoMenuElementSelectedBackgroundColor_onceToken != -1) {
    dispatch_once(&_PXInfoMenuElementSelectedBackgroundColor_onceToken, &__block_literal_global_55_294003);
  }
  v0 = (void *)_PXInfoMenuElementSelectedBackgroundColor_color;
  return v0;
}

id _PXInfoMenuElementNormalColor()
{
  if (_PXInfoMenuElementNormalColor_onceToken != -1) {
    dispatch_once(&_PXInfoMenuElementNormalColor_onceToken, &__block_literal_global_47_293999);
  }
  v0 = (void *)_PXInfoMenuElementNormalColor_color;
  return v0;
}

void sub_1AB1F8F88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AB1F9078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AB1FA390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AB1FA8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB1FB000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB1FCF04(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1AB1FD10C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1AB1FE7E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1AB1FEB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB1FF2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB1FFFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB2001D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB200418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB20062C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id getMFMessageComposeViewControllerClass_295455()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMFMessageComposeViewControllerClass_softClass_295469;
  uint64_t v7 = getMFMessageComposeViewControllerClass_softClass_295469;
  if (!getMFMessageComposeViewControllerClass_softClass_295469)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMFMessageComposeViewControllerClass_block_invoke_295470;
    v3[3] = &unk_1E5DD2B08;
    v3[4] = &v4;
    __getMFMessageComposeViewControllerClass_block_invoke_295470((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AB201AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMessageComposeViewControllerClass_block_invoke_295470(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MessageUILibraryCore_frameworkLibrary_295471)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MessageUILibraryCore_block_invoke_295472;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5DD2208;
    uint64_t v8 = 0;
    MessageUILibraryCore_frameworkLibrary_295471 = _sl_dlopen();
  }
  if (!MessageUILibraryCore_frameworkLibrary_295471)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MessageUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXSharedLibraryComposeMessageActionPerformer+iOS.m", 23, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MFMessageComposeViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getMFMessageComposeViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXSharedLibraryComposeMessageActionPerformer+iOS.m", 24, @"Unable to find class %s", "MFMessageComposeViewController");

LABEL_10:
    __break(1u);
  }
  getMFMessageComposeViewControllerClass_softClass_295469 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessageUILibraryCore_block_invoke_295472()
{
  uint64_t result = _sl_dlopen();
  MessageUILibraryCore_frameworkLibrary_295471 = result;
  return result;
}

void sub_1AB203AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 168), 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__295926(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__295927(uint64_t a1)
{
}

uint64_t _StackItemIndexForSpriteIndexInLayout(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v10 = -1;
  if (![v5 isSpriteIndex:a1 decoratingSpriteWithIndex:&v10]
    || (uint64_t v7 = [v5 convertSpriteIndex:v10 toDescendantLayout:v6], v7 == -1))
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = [v6 itemForSpriteIndex:v7];
  }

  return v8;
}

void sub_1AB206D64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1AB20A234(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AB20C004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB20FE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB20FF94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AB2101A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AB213178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PXSharedLibraryFeatureSupported()
{
  return PLIsPhotosReliveWidget() ^ 1;
}

id PXContentLockedPlaceholderConfiguration(uint64_t a1, unint64_t a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FB1658] emptyConfiguration];
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
  [v8 setImage:v9];

  if (a1 == 1)
  {
    if (a2 > 6)
    {
      unsigned int v10 = 0;
    }
    else
    {
      unsigned int v10 = PXLocalizedStringFromTable(off_1E5DD29F0[a2], @"PhotosUICore");
    }
    [v8 setText:v10];
    if (a3)
    {
      uint64_t v11 = @"PXContentPrivacyAuthenticationRequiredUnlockButtonTitleAlbum";
LABEL_12:
      int v12 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
      v13 = [v8 buttonProperties];
      v14 = [v13 configuration];
      [v14 setTitle:v12];

      unsigned int v10 = [v8 buttonProperties];
      [v10 setPrimaryAction:v7];
    }
  }
  else
  {
    if (a2 > 6)
    {
      unsigned int v10 = 0;
    }
    else
    {
      unsigned int v10 = PXLocalizedStringFromTable(off_1E5DD2A28[a2], @"PhotosUICore");
    }
    [v8 setText:v10];
    if (a3)
    {
      uint64_t v11 = @"PXContentPrivacyAuthenticationRequiredUnlockButtonTitleGeneric";
      goto LABEL_12;
    }
  }

  uint64_t v15 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = @"NO";
    if (a3) {
      v16 = @"YES";
    }
    uint64_t v17 = v16;
    int v19 = 138543362;
    id v20 = v17;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Created content privacy placeholder configuration (show unlock button: %{public}@)", (uint8_t *)&v19, 0xCu);
  }
  return v8;
}

id getMFMailComposeViewControllerClass_299522()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMFMailComposeViewControllerClass_softClass_299544;
  uint64_t v7 = getMFMailComposeViewControllerClass_softClass_299544;
  if (!getMFMailComposeViewControllerClass_softClass_299544)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMFMailComposeViewControllerClass_block_invoke_299545;
    v3[3] = &unk_1E5DD2B08;
    v3[4] = &v4;
    __getMFMailComposeViewControllerClass_block_invoke_299545((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AB2181E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMailComposeViewControllerClass_block_invoke_299545(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MessageUILibraryCore_frameworkLibrary_299546)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MessageUILibraryCore_block_invoke_299547;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5DD2B28;
    uint64_t v8 = 0;
    MessageUILibraryCore_frameworkLibrary_299546 = _sl_dlopen();
  }
  if (!MessageUILibraryCore_frameworkLibrary_299546)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MessageUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXCMMDebugSharingSuggestionViewController.m", 28, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MFMailComposeViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getMFMailComposeViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXCMMDebugSharingSuggestionViewController.m", 29, @"Unable to find class %s", "MFMailComposeViewController");

LABEL_10:
    __break(1u);
  }
  getMFMailComposeViewControllerClass_softClass_299544 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessageUILibraryCore_block_invoke_299547()
{
  uint64_t result = _sl_dlopen();
  MessageUILibraryCore_frameworkLibrary_299546 = result;
  return result;
}

__CFString *PXGDiagnosticsSpriteProbeEventTypeDescription(unint64_t a1)
{
  if (a1 > 7) {
    return @"??";
  }
  else {
    return off_1E5DD2C88[a1];
  }
}

void sub_1AB21E2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__300769(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__300770(uint64_t a1)
{
}

void sub_1AB21EDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB220624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1AB2225F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB222760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _Dismiss(void *a1, void *a2, void *a3)
{
  id v6 = a1;
  id v5 = a3;
  [a2 setUserInteractionEnabled:1];
  if (v6)
  {
    [v6 dismissViewControllerAnimated:1 completion:v5];
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

void sub_1AB22AB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PXPhotosDetailsViewSourceOriginDescription(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_1E5DD3428[a1];
  }
}

void sub_1AB22DCB8(_Unwind_Exception *a1)
{
}

double VKMClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

double VKMMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

uint64_t sub_1AB22F55C()
{
  return MEMORY[0x1F4104D28]();
}

uint64_t sub_1AB22F56C()
{
  return MEMORY[0x1F4104D30]();
}

uint64_t sub_1AB22F58C()
{
  return MEMORY[0x1F4104D40]();
}

uint64_t sub_1AB22F59C()
{
  return MEMORY[0x1F4104D48]();
}

uint64_t sub_1AB22F5AC()
{
  return MEMORY[0x1F4104D50]();
}

uint64_t sub_1AB22F5BC()
{
  return MEMORY[0x1F4104D58]();
}

uint64_t sub_1AB22F5CC()
{
  return MEMORY[0x1F4104D60]();
}

uint64_t sub_1AB22F5DC()
{
  return MEMORY[0x1F4104D68]();
}

uint64_t sub_1AB22F5EC()
{
  return MEMORY[0x1F40D3A18]();
}

uint64_t sub_1AB22F5FC()
{
  return MEMORY[0x1F40D3B30]();
}

uint64_t sub_1AB22F60C()
{
  return MEMORY[0x1F40D3B70]();
}

uint64_t sub_1AB22F63C()
{
  return MEMORY[0x1F40D3C18]();
}

uint64_t sub_1AB22F64C()
{
  return MEMORY[0x1F40D3C40]();
}

uint64_t sub_1AB22F65C()
{
  return MEMORY[0x1F40D3C48]();
}

uint64_t sub_1AB22F66C()
{
  return MEMORY[0x1F40D3C60]();
}

uint64_t sub_1AB22F68C()
{
  return MEMORY[0x1F40D3C88]();
}

uint64_t sub_1AB22F6AC()
{
  return MEMORY[0x1F40D3CF8]();
}

uint64_t sub_1AB22F6BC()
{
  return MEMORY[0x1F40D3D08]();
}

uint64_t sub_1AB22F6CC()
{
  return MEMORY[0x1F40D3D18]();
}

uint64_t sub_1AB22F6DC()
{
  return MEMORY[0x1F40D3D28]();
}

uint64_t sub_1AB22F6EC()
{
  return MEMORY[0x1F40D3D30]();
}

uint64_t sub_1AB22F71C()
{
  return MEMORY[0x1F40D3D80]();
}

uint64_t sub_1AB22F72C()
{
  return MEMORY[0x1F40D3DA0]();
}

uint64_t sub_1AB22F73C()
{
  return MEMORY[0x1F40D3E88]();
}

uint64_t sub_1AB22F74C()
{
  return MEMORY[0x1F40D3E98]();
}

uint64_t sub_1AB22F75C()
{
  return MEMORY[0x1F40D3EB0]();
}

uint64_t sub_1AB22F76C()
{
  return MEMORY[0x1F40D3EB8]();
}

uint64_t sub_1AB22F77C()
{
  return MEMORY[0x1F40D3EC8]();
}

uint64_t sub_1AB22F78C()
{
  return MEMORY[0x1F40D3F08]();
}

uint64_t sub_1AB22F79C()
{
  return MEMORY[0x1F40D3F20]();
}

uint64_t sub_1AB22F7AC()
{
  return MEMORY[0x1F40D3F28]();
}

uint64_t sub_1AB22F7BC()
{
  return MEMORY[0x1F40D3FE0]();
}

uint64_t sub_1AB22F7CC()
{
  return MEMORY[0x1F40D3FE8]();
}

uint64_t sub_1AB22F7DC()
{
  return MEMORY[0x1F40D4018]();
}

uint64_t sub_1AB22F7EC()
{
  return MEMORY[0x1F40D4080]();
}

uint64_t sub_1AB22F7FC()
{
  return MEMORY[0x1F40D4090]();
}

uint64_t sub_1AB22F80C()
{
  return MEMORY[0x1F40D40A0]();
}

uint64_t sub_1AB22F81C()
{
  return MEMORY[0x1F40D40B8]();
}

uint64_t sub_1AB22F82C()
{
  return MEMORY[0x1F40D40E8]();
}

uint64_t sub_1AB22F83C()
{
  return MEMORY[0x1F40D40F8]();
}

uint64_t sub_1AB22F84C()
{
  return MEMORY[0x1F40D4120]();
}

uint64_t sub_1AB22F85C()
{
  return MEMORY[0x1F40D4130]();
}

uint64_t sub_1AB22F86C()
{
  return MEMORY[0x1F40D4138]();
}

uint64_t sub_1AB22F87C()
{
  return MEMORY[0x1F40D4150]();
}

uint64_t sub_1AB22F88C()
{
  return MEMORY[0x1F40D4198]();
}

uint64_t sub_1AB22F89C()
{
  return MEMORY[0x1F40D41B0]();
}

uint64_t sub_1AB22F8AC()
{
  return MEMORY[0x1F40D41B8]();
}

uint64_t sub_1AB22F8BC()
{
  return MEMORY[0x1F40D41D0]();
}

uint64_t sub_1AB22F8CC()
{
  return MEMORY[0x1F40D4200]();
}

uint64_t sub_1AB22F8DC()
{
  return MEMORY[0x1F40D4268]();
}

uint64_t sub_1AB22F8EC()
{
  return MEMORY[0x1F40D4270]();
}

uint64_t sub_1AB22F8FC()
{
  return MEMORY[0x1F40D4288]();
}

uint64_t sub_1AB22F90C()
{
  return MEMORY[0x1F40D4290]();
}

uint64_t sub_1AB22F91C()
{
  return MEMORY[0x1F40D42A0]();
}

uint64_t sub_1AB22F92C()
{
  return MEMORY[0x1F40D42B0]();
}

uint64_t sub_1AB22F93C()
{
  return MEMORY[0x1F40D42D8]();
}

uint64_t sub_1AB22F94C()
{
  return MEMORY[0x1F40D42E0]();
}

uint64_t sub_1AB22F95C()
{
  return MEMORY[0x1F40D42F8]();
}

uint64_t sub_1AB22F96C()
{
  return MEMORY[0x1F40D4300]();
}

uint64_t sub_1AB22F97C()
{
  return MEMORY[0x1F40D4318]();
}

uint64_t sub_1AB22F98C()
{
  return MEMORY[0x1F40D4328]();
}

uint64_t sub_1AB22F99C()
{
  return MEMORY[0x1F40D4330]();
}

uint64_t sub_1AB22F9AC()
{
  return MEMORY[0x1F40D4340]();
}

uint64_t sub_1AB22F9BC()
{
  return MEMORY[0x1F40D4358]();
}

uint64_t sub_1AB22F9CC()
{
  return MEMORY[0x1F40D4360]();
}

uint64_t sub_1AB22F9DC()
{
  return MEMORY[0x1F40D4370]();
}

uint64_t sub_1AB22F9EC()
{
  return MEMORY[0x1F40D4388]();
}

uint64_t sub_1AB22F9FC()
{
  return MEMORY[0x1F40D4398]();
}

uint64_t sub_1AB22FA0C()
{
  return MEMORY[0x1F40D43A8]();
}

uint64_t sub_1AB22FA1C()
{
  return MEMORY[0x1F40D4430]();
}

uint64_t sub_1AB22FA2C()
{
  return MEMORY[0x1F40D4540]();
}

uint64_t sub_1AB22FA3C()
{
  return MEMORY[0x1F40D4558]();
}

uint64_t sub_1AB22FA4C()
{
  return MEMORY[0x1F40D4570]();
}

uint64_t sub_1AB22FA6C()
{
  return MEMORY[0x1F40D4598]();
}

uint64_t sub_1AB22FA8C()
{
  return MEMORY[0x1F4104C60]();
}

uint64_t sub_1AB22FA9C()
{
  return MEMORY[0x1F40D45C8]();
}

uint64_t sub_1AB22FAAC()
{
  return MEMORY[0x1F40D45D8]();
}

uint64_t sub_1AB22FABC()
{
  return MEMORY[0x1F40D45E0]();
}

uint64_t sub_1AB22FACC()
{
  return MEMORY[0x1F40D45F8]();
}

uint64_t sub_1AB22FADC()
{
  return MEMORY[0x1F40D4608]();
}

uint64_t sub_1AB22FAEC()
{
  return MEMORY[0x1F40D4620]();
}

uint64_t sub_1AB22FAFC()
{
  return MEMORY[0x1F40D4660]();
}

uint64_t sub_1AB22FB0C()
{
  return MEMORY[0x1F40D4668]();
}

uint64_t sub_1AB22FB1C()
{
  return MEMORY[0x1F40D4670]();
}

uint64_t sub_1AB22FB2C()
{
  return MEMORY[0x1F40D4678]();
}

uint64_t sub_1AB22FB3C()
{
  return MEMORY[0x1F40D4688]();
}

uint64_t sub_1AB22FB4C()
{
  return MEMORY[0x1F40D4690]();
}

uint64_t sub_1AB22FB5C()
{
  return MEMORY[0x1F40D4698]();
}

uint64_t sub_1AB22FB7C()
{
  return MEMORY[0x1F40D46B0]();
}

uint64_t sub_1AB22FB8C()
{
  return MEMORY[0x1F40D46E0]();
}

uint64_t sub_1AB22FB9C()
{
  return MEMORY[0x1F40D4708]();
}

uint64_t sub_1AB22FBAC()
{
  return MEMORY[0x1F40D4720]();
}

uint64_t sub_1AB22FBBC()
{
  return MEMORY[0x1F40D4730]();
}

uint64_t sub_1AB22FBCC()
{
  return MEMORY[0x1F40D4750]();
}

uint64_t sub_1AB22FBDC()
{
  return MEMORY[0x1F40D4798]();
}

uint64_t sub_1AB22FBFC()
{
  return MEMORY[0x1F40D4800]();
}

uint64_t sub_1AB22FC0C()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_1AB22FC1C()
{
  return MEMORY[0x1F40D48B8]();
}

uint64_t sub_1AB22FC2C()
{
  return MEMORY[0x1F40D48D0]();
}

uint64_t sub_1AB22FC3C()
{
  return MEMORY[0x1F40D48F0]();
}

uint64_t sub_1AB22FC4C()
{
  return MEMORY[0x1F40D4908]();
}

uint64_t sub_1AB22FC5C()
{
  return MEMORY[0x1F40D4910]();
}

uint64_t sub_1AB22FC7C()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1AB22FC8C()
{
  return MEMORY[0x1F40E2FB8]();
}

uint64_t sub_1AB22FC9C()
{
  return MEMORY[0x1F40E2FE0]();
}

uint64_t sub_1AB22FCAC()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1AB22FCBC()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1AB22FCCC()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1AB22FCDC()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1AB22FCEC()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1AB22FCFC()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1AB22FD0C()
{
  return MEMORY[0x1F40E3288]();
}

uint64_t sub_1AB22FD1C()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1AB22FD2C()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1AB22FD3C()
{
  return MEMORY[0x1F40E32C8]();
}

uint64_t sub_1AB22FD4C()
{
  return MEMORY[0x1F40E32E8]();
}

uint64_t sub_1AB22FD5C()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1AB22FD6C()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1AB22FD7C()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1AB22FD8C()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1AB22FD9C()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1AB22FDAC()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1AB22FDBC()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1AB22FDCC()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1AB22FDDC()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1AB22FDEC()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1AB22FDFC()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1AB22FE0C()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1AB22FE1C()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1AB22FE2C()
{
  return MEMORY[0x1F40E3740]();
}

uint64_t sub_1AB22FE3C()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1AB22FE4C()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1AB22FE5C()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1AB22FE6C()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1AB22FE7C()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1AB22FE8C()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1AB22FE9C()
{
  return MEMORY[0x1F40E38E0]();
}

uint64_t sub_1AB22FEAC()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1AB22FEBC()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1AB22FECC()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1AB22FEDC()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1AB22FEEC()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1AB22FEFC()
{
  return MEMORY[0x1F40E3B40]();
}

uint64_t sub_1AB22FF0C()
{
  return MEMORY[0x1F40E3B48]();
}

uint64_t sub_1AB22FF1C()
{
  return MEMORY[0x1F4165698]();
}

uint64_t sub_1AB22FF2C()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1AB22FF3C()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1AB22FF4C()
{
  return MEMORY[0x1F41656E0]();
}

uint64_t sub_1AB22FF5C()
{
  return MEMORY[0x1F40F7D18]();
}

uint64_t sub_1AB22FF6C()
{
  return MEMORY[0x1F40F7D30]();
}

uint64_t sub_1AB22FF7C()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1AB22FF8C()
{
  return MEMORY[0x1F40E3C20]();
}

uint64_t sub_1AB22FF9C()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1AB22FFAC()
{
  return MEMORY[0x1F40E3C80]();
}

uint64_t sub_1AB22FFBC()
{
  return MEMORY[0x1F40E3CA0]();
}

uint64_t sub_1AB22FFCC()
{
  return MEMORY[0x1F40E3CB0]();
}

uint64_t sub_1AB22FFDC()
{
  return MEMORY[0x1F40E3CD0]();
}

uint64_t sub_1AB22FFEC()
{
  return MEMORY[0x1F40E3CE8]();
}

uint64_t sub_1AB22FFFC()
{
  return MEMORY[0x1F40E3CF8]();
}

uint64_t sub_1AB23000C()
{
  return MEMORY[0x1F40E3D08]();
}

uint64_t sub_1AB23001C()
{
  return MEMORY[0x1F40E3D10]();
}

uint64_t sub_1AB23002C()
{
  return MEMORY[0x1F40E3D18]();
}

uint64_t sub_1AB23003C()
{
  return MEMORY[0x1F40E3D20]();
}

uint64_t sub_1AB23004C()
{
  return MEMORY[0x1F40E3D28]();
}

uint64_t sub_1AB23005C()
{
  return MEMORY[0x1F40E3E40]();
}

uint64_t sub_1AB23006C()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1AB23007C()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1AB23008C()
{
  return MEMORY[0x1F40E3ED0]();
}

uint64_t sub_1AB23009C()
{
  return MEMORY[0x1F40E3EF8]();
}

uint64_t sub_1AB2300AC()
{
  return MEMORY[0x1F40E3F10]();
}

uint64_t sub_1AB2300BC()
{
  return MEMORY[0x1F40E4028]();
}

uint64_t sub_1AB2300CC()
{
  return MEMORY[0x1F40E4040]();
}

uint64_t sub_1AB2300DC()
{
  return MEMORY[0x1F40E4070]();
}

uint64_t sub_1AB2300EC()
{
  return MEMORY[0x1F40E4078]();
}

uint64_t sub_1AB2300FC()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1AB23010C()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1AB23011C()
{
  return MEMORY[0x1F40E40C0]();
}

uint64_t sub_1AB23012C()
{
  return MEMORY[0x1F40E40D0]();
}

uint64_t sub_1AB23013C()
{
  return MEMORY[0x1F40E40D8]();
}

uint64_t sub_1AB23014C()
{
  return MEMORY[0x1F40E4198]();
}

uint64_t sub_1AB23015C()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1AB23016C()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1AB23017C()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1AB23018C()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1AB23019C()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1AB2301AC()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1AB2301BC()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1AB2301CC()
{
  return MEMORY[0x1F40E43E0]();
}

uint64_t sub_1AB2301DC()
{
  return MEMORY[0x1F40E43E8]();
}

uint64_t sub_1AB2301EC()
{
  return MEMORY[0x1F40E4400]();
}

uint64_t sub_1AB2301FC()
{
  return MEMORY[0x1F40E4418]();
}

uint64_t sub_1AB23020C()
{
  return MEMORY[0x1F40E4428]();
}

uint64_t sub_1AB23021C()
{
  return MEMORY[0x1F40E4430]();
}

uint64_t sub_1AB23022C()
{
  return MEMORY[0x1F40E4438]();
}

uint64_t sub_1AB23023C()
{
  return MEMORY[0x1F40E4440]();
}

uint64_t sub_1AB23024C()
{
  return MEMORY[0x1F40E4450]();
}

uint64_t sub_1AB23025C()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1AB2302AC()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1AB2302DC()
{
  return MEMORY[0x1F40E4518]();
}

uint64_t sub_1AB2302EC()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1AB2302FC()
{
  return MEMORY[0x1F40F7D50]();
}

uint64_t sub_1AB23030C()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1AB23031C()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1AB23032C()
{
  return MEMORY[0x1F40E4570]();
}

uint64_t sub_1AB23033C()
{
  return MEMORY[0x1F40E4588]();
}

uint64_t sub_1AB23034C()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_1AB23035C()
{
  return MEMORY[0x1F40E45C8]();
}

uint64_t sub_1AB23036C()
{
  return MEMORY[0x1F40E45E8]();
}

uint64_t sub_1AB23037C()
{
  return MEMORY[0x1F40E45F8]();
}

uint64_t sub_1AB23038C()
{
  return MEMORY[0x1F40E4600]();
}

uint64_t sub_1AB23039C()
{
  return MEMORY[0x1F40E4620]();
}

uint64_t sub_1AB2303AC()
{
  return MEMORY[0x1F40E4670]();
}

uint64_t sub_1AB2303BC()
{
  return MEMORY[0x1F40E4678]();
}

uint64_t sub_1AB2303CC()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1AB2303DC()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1AB2303EC()
{
  return MEMORY[0x1F40E46D8]();
}

uint64_t sub_1AB2303FC()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1AB23040C()
{
  return MEMORY[0x1F40E47F0]();
}

uint64_t sub_1AB23041C()
{
  return MEMORY[0x1F40E4810]();
}

uint64_t sub_1AB23042C()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1AB23043C()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1AB23044C()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1AB23045C()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1AB23046C()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1AB23047C()
{
  return MEMORY[0x1F40E4958]();
}

uint64_t sub_1AB23048C()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1AB23049C()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1AB2304AC()
{
  return MEMORY[0x1F40E49D0]();
}

uint64_t sub_1AB2304BC()
{
  return MEMORY[0x1F4187840]();
}

uint64_t sub_1AB2304CC()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1AB2304DC()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1AB2304EC()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1AB2304FC()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1AB23050C()
{
  return MEMORY[0x1F40E4A60]();
}

uint64_t sub_1AB23051C()
{
  return MEMORY[0x1F40E4A68]();
}

uint64_t sub_1AB23052C()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1AB23053C()
{
  return MEMORY[0x1F40E4A80]();
}

uint64_t sub_1AB23054C()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1AB23055C()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1AB23056C()
{
  return MEMORY[0x1F40E4AE0]();
}

uint64_t sub_1AB23057C()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1AB23058C()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1AB23059C()
{
  return MEMORY[0x1F40E4B68]();
}

uint64_t sub_1AB2305AC()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1AB2305BC()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1AB2305CC()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1AB2305DC()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1AB2305EC()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1AB2305FC()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1AB23060C()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1AB23061C()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1AB23062C()
{
  return MEMORY[0x1F40E5068]();
}

uint64_t sub_1AB23063C()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1AB23064C()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1AB23065C()
{
  return MEMORY[0x1F40E50C8]();
}

uint64_t sub_1AB23066C()
{
  return MEMORY[0x1F40E50E0]();
}

void sub_1AB23067C()
{
  while (1)
    ;
}

uint64_t sub_1AB23068C()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1AB23069C()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1AB2306AC()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1AB2306BC()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1AB2306CC()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1AB2306DC()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1AB2306EC()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1AB2306FC()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1AB23070C()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1AB23071C()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1AB23072C()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1AB23073C()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_1AB23074C()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1AB23075C()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1AB23076C()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1AB23077C()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1AB23078C()
{
  return MEMORY[0x1F40E5430]();
}

uint64_t sub_1AB23079C()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1AB2307AC()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1AB2307BC()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1AB2307CC()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1AB2307DC()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1AB2307EC()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1AB2307FC()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1AB23080C()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1AB23081C()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1AB23082C()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1AB23083C()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1AB23084C()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1AB23085C()
{
  return MEMORY[0x1F40E5898]();
}

uint64_t sub_1AB23086C()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1AB23087C()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1AB23088C()
{
  return MEMORY[0x1F40E58C0]();
}

uint64_t sub_1AB23089C()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1AB2308AC()
{
  return MEMORY[0x1F40E5930]();
}

uint64_t sub_1AB2308BC()
{
  return MEMORY[0x1F40E5958]();
}

uint64_t sub_1AB2308CC()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1AB2308DC()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1AB2308EC()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1AB2308FC()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1AB23090C()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1AB23091C()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1AB23092C()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1AB23093C()
{
  return MEMORY[0x1F40E5A90]();
}

uint64_t sub_1AB23094C()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1AB23095C()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1AB23096C()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1AB23097C()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1AB23098C()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1AB23099C()
{
  return MEMORY[0x1F40E5B48]();
}

uint64_t sub_1AB2309AC()
{
  return MEMORY[0x1F40E5B50]();
}

uint64_t sub_1AB2309BC()
{
  return MEMORY[0x1F40E5B70]();
}

uint64_t sub_1AB2309CC()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1AB2309DC()
{
  return MEMORY[0x1F40E5BA8]();
}

uint64_t sub_1AB2309EC()
{
  return MEMORY[0x1F40E5BB0]();
}

uint64_t sub_1AB2309FC()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1AB230A0C()
{
  return MEMORY[0x1F40E5BD0]();
}

uint64_t sub_1AB230A1C()
{
  return MEMORY[0x1F40E5BD8]();
}

uint64_t sub_1AB230A2C()
{
  return MEMORY[0x1F40E5BE8]();
}

uint64_t sub_1AB230A3C()
{
  return MEMORY[0x1F40E5C08]();
}

uint64_t sub_1AB230A4C()
{
  return MEMORY[0x1F40E5C28]();
}

uint64_t sub_1AB230A5C()
{
  return MEMORY[0x1F40E5C38]();
}

uint64_t sub_1AB230A6C()
{
  return MEMORY[0x1F40E5C68]();
}

uint64_t sub_1AB230A7C()
{
  return MEMORY[0x1F40E5C98]();
}

uint64_t sub_1AB230A8C()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1AB230A9C()
{
  return MEMORY[0x1F40E5CC0]();
}

uint64_t sub_1AB230AAC()
{
  return MEMORY[0x1F40E5CD0]();
}

uint64_t sub_1AB230ABC()
{
  return MEMORY[0x1F40E5D00]();
}

uint64_t sub_1AB230ACC()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1AB230ADC()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1AB230AEC()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1AB230AFC()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1AB230B0C()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1AB230B1C()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1AB230B2C()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1AB230B3C()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1AB230B4C()
{
  return MEMORY[0x1F41874F0]();
}

uint64_t sub_1AB230B5C()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1AB230B6C()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1AB230B7C()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1AB230B8C()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1AB230B9C()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1AB230BAC()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1AB230BBC()
{
  return MEMORY[0x1F4182D38]();
}

uint64_t sub_1AB230BCC()
{
  return MEMORY[0x1F4182D58]();
}

uint64_t sub_1AB230BDC()
{
  return MEMORY[0x1F40E5F40]();
}

uint64_t sub_1AB230BEC()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1AB230BFC()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1AB230C0C()
{
  return MEMORY[0x1F4141CF0]();
}

void sub_1AB230C1C()
{
  while (1)
    ;
}

void sub_1AB230C2C()
{
  while (1)
    ;
}

void sub_1AB230C3C()
{
  while (1)
    ;
}

uint64_t sub_1AB230C4C()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1AB230C5C()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1AB230C6C()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1AB230C7C()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1AB230C8C()
{
  return MEMORY[0x1F40E74B8]();
}

uint64_t sub_1AB230C9C()
{
  return MEMORY[0x1F40E74C0]();
}

uint64_t sub_1AB230CAC()
{
  return MEMORY[0x1F40E74C8]();
}

uint64_t sub_1AB230CCC()
{
  return MEMORY[0x1F40E74D8]();
}

uint64_t sub_1AB230CEC()
{
  return MEMORY[0x1F40E74E8]();
}

uint64_t sub_1AB230CFC()
{
  return MEMORY[0x1F40E74F0]();
}

uint64_t sub_1AB230D0C()
{
  return MEMORY[0x1F40E74F8]();
}

uint64_t sub_1AB230D1C()
{
  return MEMORY[0x1F40E7500]();
}

uint64_t sub_1AB230D2C()
{
  return MEMORY[0x1F40E7508]();
}

uint64_t sub_1AB230D5C()
{
  return MEMORY[0x1F40E7520]();
}

uint64_t sub_1AB230D6C()
{
  return MEMORY[0x1F40E7580]();
}

uint64_t sub_1AB230D7C()
{
  return MEMORY[0x1F40E7588]();
}

uint64_t sub_1AB230D8C()
{
  return MEMORY[0x1F40E75A0]();
}

uint64_t sub_1AB230D9C()
{
  return MEMORY[0x1F40E75A8]();
}

uint64_t sub_1AB230DAC()
{
  return MEMORY[0x1F40E75B0]();
}

uint64_t sub_1AB230DBC()
{
  return MEMORY[0x1F40E75C0]();
}

uint64_t sub_1AB230DCC()
{
  return MEMORY[0x1F40E75C8]();
}

uint64_t sub_1AB230DDC()
{
  return MEMORY[0x1F40E75D8]();
}

uint64_t sub_1AB230DEC()
{
  return MEMORY[0x1F40E75E8]();
}

uint64_t sub_1AB230DFC()
{
  return MEMORY[0x1F40E75F0]();
}

uint64_t sub_1AB230E0C()
{
  return MEMORY[0x1F40E75F8]();
}

uint64_t sub_1AB230E2C()
{
  return MEMORY[0x1F40E7628]();
}

uint64_t sub_1AB230E3C()
{
  return MEMORY[0x1F40E7640]();
}

uint64_t sub_1AB230E4C()
{
  return MEMORY[0x1F40E7648]();
}

uint64_t sub_1AB230E5C()
{
  return MEMORY[0x1F40E7650]();
}

uint64_t sub_1AB230E6C()
{
  return MEMORY[0x1F40E7660]();
}

uint64_t sub_1AB230E7C()
{
  return MEMORY[0x1F40E7680]();
}

uint64_t sub_1AB230E8C()
{
  return MEMORY[0x1F40E7690]();
}

uint64_t sub_1AB230E9C()
{
  return MEMORY[0x1F40E7698]();
}

uint64_t sub_1AB230EAC()
{
  return MEMORY[0x1F40E76A0]();
}

uint64_t sub_1AB230EBC()
{
  return MEMORY[0x1F40E76A8]();
}

uint64_t sub_1AB230ECC()
{
  return MEMORY[0x1F40E76C0]();
}

uint64_t sub_1AB230EDC()
{
  return MEMORY[0x1F40E76C8]();
}

uint64_t sub_1AB230EEC()
{
  return MEMORY[0x1F40E76D0]();
}

uint64_t sub_1AB230EFC()
{
  return MEMORY[0x1F40E76F0]();
}

uint64_t sub_1AB230F0C()
{
  return MEMORY[0x1F40E76F8]();
}

uint64_t sub_1AB230F1C()
{
  return MEMORY[0x1F40E7700]();
}

uint64_t sub_1AB230F2C()
{
  return MEMORY[0x1F40E7710]();
}

uint64_t sub_1AB230F3C()
{
  return MEMORY[0x1F40E7718]();
}

uint64_t sub_1AB230F4C()
{
  return MEMORY[0x1F40E7720]();
}

uint64_t _s15GroupActivities0A7SessionC12PhotosUICoreAD05OneUpA8ActivityVRszrlE23activityChangePublisherQrvg_0()
{
  return MEMORY[0x1F40E7728]();
}

uint64_t sub_1AB230F6C()
{
  return MEMORY[0x1F40E7738]();
}

uint64_t sub_1AB230F7C()
{
  return MEMORY[0x1F40E7740]();
}

uint64_t sub_1AB230F8C()
{
  return MEMORY[0x1F40E7748]();
}

uint64_t sub_1AB230FDC()
{
  return MEMORY[0x1F40E7788]();
}

uint64_t sub_1AB230FEC()
{
  return MEMORY[0x1F40E7798]();
}

uint64_t sub_1AB230FFC()
{
  return MEMORY[0x1F40E77A0]();
}

uint64_t sub_1AB23100C()
{
  return MEMORY[0x1F40E77A8]();
}

uint64_t sub_1AB23101C()
{
  return MEMORY[0x1F40E77D0]();
}

uint64_t sub_1AB23102C()
{
  return MEMORY[0x1F40E77D8]();
}

uint64_t sub_1AB23103C()
{
  return MEMORY[0x1F40E77E0]();
}

uint64_t sub_1AB23104C()
{
  return MEMORY[0x1F40DFA30]();
}

uint64_t sub_1AB23105C()
{
  return MEMORY[0x1F40DFA40]();
}

uint64_t sub_1AB23106C()
{
  return MEMORY[0x1F40DFA48]();
}

uint64_t sub_1AB23107C()
{
  return MEMORY[0x1F40DFA50]();
}

uint64_t sub_1AB23108C()
{
  return MEMORY[0x1F40DFA58]();
}

uint64_t sub_1AB23109C()
{
  return MEMORY[0x1F40DFA70]();
}

uint64_t sub_1AB2310AC()
{
  return MEMORY[0x1F40DFA78]();
}

uint64_t sub_1AB2310BC()
{
  return MEMORY[0x1F40DFA80]();
}

uint64_t sub_1AB2310CC()
{
  return MEMORY[0x1F40DFA98]();
}

uint64_t sub_1AB2310DC()
{
  return MEMORY[0x1F40DFAA0]();
}

uint64_t sub_1AB2310EC()
{
  return MEMORY[0x1F40DFAA8]();
}

uint64_t sub_1AB2310FC()
{
  return MEMORY[0x1F40DFAB0]();
}

uint64_t sub_1AB23110C()
{
  return MEMORY[0x1F40DFAC8]();
}

uint64_t sub_1AB23111C()
{
  return MEMORY[0x1F411BCE8]();
}

uint64_t sub_1AB23112C()
{
  return MEMORY[0x1F411BCF8]();
}

uint64_t sub_1AB23113C()
{
  return MEMORY[0x1F411BD08]();
}

uint64_t sub_1AB23114C()
{
  return MEMORY[0x1F411BD28]();
}

uint64_t sub_1AB23115C()
{
  return MEMORY[0x1F411BD38]();
}

uint64_t sub_1AB23116C()
{
  return MEMORY[0x1F411BD58]();
}

uint64_t sub_1AB23117C()
{
  return MEMORY[0x1F411BD60]();
}

uint64_t sub_1AB23118C()
{
  return MEMORY[0x1F411BD88]();
}

uint64_t sub_1AB23119C()
{
  return MEMORY[0x1F411BD90]();
}

uint64_t sub_1AB2311AC()
{
  return MEMORY[0x1F411BDA8]();
}

uint64_t sub_1AB2311BC()
{
  return MEMORY[0x1F4141CF8]();
}

uint64_t sub_1AB2311CC()
{
  return MEMORY[0x1F4141D00]();
}

uint64_t sub_1AB2311DC()
{
  return MEMORY[0x1F4141D08]();
}

uint64_t sub_1AB2311EC()
{
  return MEMORY[0x1F4141D30]();
}

uint64_t sub_1AB2311FC()
{
  return MEMORY[0x1F4141D38]();
}

uint64_t sub_1AB23120C()
{
  return MEMORY[0x1F4141D40]();
}

uint64_t sub_1AB23121C()
{
  return MEMORY[0x1F4141D48]();
}

uint64_t sub_1AB23122C()
{
  return MEMORY[0x1F4141D50]();
}

uint64_t sub_1AB23123C()
{
  return MEMORY[0x1F4141D58]();
}

uint64_t sub_1AB23124C()
{
  return MEMORY[0x1F4141D60]();
}

uint64_t sub_1AB23125C()
{
  return MEMORY[0x1F4141D68]();
}

uint64_t sub_1AB23126C()
{
  return MEMORY[0x1F4141D70]();
}

uint64_t sub_1AB23127C()
{
  return MEMORY[0x1F4141D78]();
}

uint64_t sub_1AB23128C()
{
  return MEMORY[0x1F4141D80]();
}

uint64_t sub_1AB23129C()
{
  return MEMORY[0x1F4141D88]();
}

uint64_t sub_1AB2312AC()
{
  return MEMORY[0x1F4141D90]();
}

uint64_t sub_1AB2312BC()
{
  return MEMORY[0x1F4141D98]();
}

uint64_t sub_1AB2312CC()
{
  return MEMORY[0x1F4141DA0]();
}

uint64_t sub_1AB2312DC()
{
  return MEMORY[0x1F4141DA8]();
}

uint64_t sub_1AB2312EC()
{
  return MEMORY[0x1F4141DB0]();
}

uint64_t sub_1AB2312FC()
{
  return MEMORY[0x1F4141DB8]();
}

uint64_t sub_1AB23130C()
{
  return MEMORY[0x1F4141DC0]();
}

uint64_t sub_1AB23131C()
{
  return MEMORY[0x1F4141DC8]();
}

uint64_t sub_1AB23132C()
{
  return MEMORY[0x1F4141DD0]();
}

uint64_t sub_1AB23133C()
{
  return MEMORY[0x1F4141DD8]();
}

uint64_t sub_1AB23134C()
{
  return MEMORY[0x1F4141DE0]();
}

uint64_t sub_1AB23135C()
{
  return MEMORY[0x1F4141DE8]();
}

uint64_t sub_1AB23136C()
{
  return MEMORY[0x1F4141DF0]();
}

uint64_t sub_1AB23137C()
{
  return MEMORY[0x1F4141DF8]();
}

uint64_t sub_1AB23138C()
{
  return MEMORY[0x1F4141E00]();
}

uint64_t sub_1AB23139C()
{
  return MEMORY[0x1F4141E08]();
}

uint64_t sub_1AB2313AC()
{
  return MEMORY[0x1F4141E10]();
}

uint64_t sub_1AB2313BC()
{
  return MEMORY[0x1F4141E18]();
}

uint64_t sub_1AB2313CC()
{
  return MEMORY[0x1F4141E20]();
}

uint64_t sub_1AB2313DC()
{
  return MEMORY[0x1F4141E28]();
}

uint64_t sub_1AB2313EC()
{
  return MEMORY[0x1F4141E30]();
}

uint64_t sub_1AB2313FC()
{
  return MEMORY[0x1F4141E38]();
}

uint64_t sub_1AB23140C()
{
  return MEMORY[0x1F4141E40]();
}

uint64_t sub_1AB23141C()
{
  return MEMORY[0x1F4141E48]();
}

uint64_t sub_1AB23142C()
{
  return MEMORY[0x1F4141E50]();
}

uint64_t sub_1AB23143C()
{
  return MEMORY[0x1F4141E58]();
}

uint64_t sub_1AB23144C()
{
  return MEMORY[0x1F4141E60]();
}

uint64_t sub_1AB23145C()
{
  return MEMORY[0x1F4141E68]();
}

uint64_t sub_1AB23146C()
{
  return MEMORY[0x1F4141E70]();
}

uint64_t sub_1AB23147C()
{
  return MEMORY[0x1F4141E78]();
}

uint64_t sub_1AB23148C()
{
  return MEMORY[0x1F4141E80]();
}

uint64_t sub_1AB23149C()
{
  return MEMORY[0x1F4141E88]();
}

uint64_t sub_1AB2314AC()
{
  return MEMORY[0x1F4141E90]();
}

uint64_t sub_1AB2314BC()
{
  return MEMORY[0x1F4141E98]();
}

uint64_t sub_1AB2314CC()
{
  return MEMORY[0x1F4141EA0]();
}

uint64_t sub_1AB2314DC()
{
  return MEMORY[0x1F4141EA8]();
}

uint64_t sub_1AB2314EC()
{
  return MEMORY[0x1F4141EB0]();
}

uint64_t sub_1AB2314FC()
{
  return MEMORY[0x1F4141EB8]();
}

uint64_t sub_1AB23150C()
{
  return MEMORY[0x1F4141EC0]();
}

uint64_t sub_1AB23151C()
{
  return MEMORY[0x1F4141EC8]();
}

uint64_t sub_1AB23152C()
{
  return MEMORY[0x1F4141ED0]();
}

uint64_t sub_1AB23153C()
{
  return MEMORY[0x1F4141ED8]();
}

uint64_t sub_1AB23154C()
{
  return MEMORY[0x1F4141EE0]();
}

uint64_t sub_1AB23155C()
{
  return MEMORY[0x1F4141EE8]();
}

uint64_t sub_1AB23156C()
{
  return MEMORY[0x1F4141EF0]();
}

uint64_t sub_1AB23157C()
{
  return MEMORY[0x1F4141EF8]();
}

uint64_t sub_1AB23158C()
{
  return MEMORY[0x1F4141F00]();
}

uint64_t sub_1AB23159C()
{
  return MEMORY[0x1F4141F08]();
}

uint64_t sub_1AB2315AC()
{
  return MEMORY[0x1F4141F10]();
}

uint64_t sub_1AB2315BC()
{
  return MEMORY[0x1F4141F18]();
}

uint64_t sub_1AB2315CC()
{
  return MEMORY[0x1F4141F20]();
}

uint64_t sub_1AB2315DC()
{
  return MEMORY[0x1F4141F28]();
}

uint64_t sub_1AB2315EC()
{
  return MEMORY[0x1F4141F30]();
}

uint64_t sub_1AB2315FC()
{
  return MEMORY[0x1F4141F38]();
}

uint64_t sub_1AB23160C()
{
  return MEMORY[0x1F4141F40]();
}

uint64_t sub_1AB23161C()
{
  return MEMORY[0x1F4141F48]();
}

uint64_t sub_1AB23162C()
{
  return MEMORY[0x1F4141F50]();
}

uint64_t sub_1AB23163C()
{
  return MEMORY[0x1F4141F58]();
}

uint64_t sub_1AB23164C()
{
  return MEMORY[0x1F4141F60]();
}

uint64_t sub_1AB23165C()
{
  return MEMORY[0x1F4141F68]();
}

uint64_t sub_1AB23166C()
{
  return MEMORY[0x1F4141F70]();
}

uint64_t sub_1AB23167C()
{
  return MEMORY[0x1F4141F78]();
}

uint64_t sub_1AB23168C()
{
  return MEMORY[0x1F4141F80]();
}

uint64_t sub_1AB23169C()
{
  return MEMORY[0x1F4141F88]();
}

uint64_t sub_1AB2316AC()
{
  return MEMORY[0x1F4141F90]();
}

uint64_t sub_1AB2316BC()
{
  return MEMORY[0x1F4141F98]();
}

uint64_t sub_1AB2316CC()
{
  return MEMORY[0x1F4141FA0]();
}

uint64_t sub_1AB2316DC()
{
  return MEMORY[0x1F4141FA8]();
}

uint64_t sub_1AB2316EC()
{
  return MEMORY[0x1F4141FB0]();
}

uint64_t sub_1AB2316FC()
{
  return MEMORY[0x1F4141FB8]();
}

uint64_t sub_1AB23170C()
{
  return MEMORY[0x1F4141FC0]();
}

uint64_t sub_1AB23171C()
{
  return MEMORY[0x1F4141FC8]();
}

uint64_t sub_1AB23172C()
{
  return MEMORY[0x1F4141FD0]();
}

uint64_t sub_1AB23173C()
{
  return MEMORY[0x1F4141FD8]();
}

uint64_t sub_1AB23174C()
{
  return MEMORY[0x1F4141FE0]();
}

uint64_t sub_1AB23175C()
{
  return MEMORY[0x1F4141FE8]();
}

uint64_t sub_1AB23176C()
{
  return MEMORY[0x1F4141FF0]();
}

uint64_t sub_1AB23177C()
{
  return MEMORY[0x1F4141FF8]();
}

uint64_t sub_1AB23178C()
{
  return MEMORY[0x1F4142000]();
}

uint64_t sub_1AB23179C()
{
  return MEMORY[0x1F4142008]();
}

uint64_t sub_1AB2317AC()
{
  return MEMORY[0x1F4142010]();
}

uint64_t sub_1AB2317BC()
{
  return MEMORY[0x1F4142018]();
}

uint64_t sub_1AB2317CC()
{
  return MEMORY[0x1F4142020]();
}

uint64_t sub_1AB2317DC()
{
  return MEMORY[0x1F4142028]();
}

uint64_t sub_1AB2317EC()
{
  return MEMORY[0x1F4142030]();
}

uint64_t sub_1AB2317FC()
{
  return MEMORY[0x1F4142038]();
}

uint64_t sub_1AB23180C()
{
  return MEMORY[0x1F4142040]();
}

uint64_t sub_1AB23181C()
{
  return MEMORY[0x1F4142048]();
}

uint64_t sub_1AB23182C()
{
  return MEMORY[0x1F4142050]();
}

uint64_t sub_1AB23183C()
{
  return MEMORY[0x1F4142058]();
}

uint64_t sub_1AB23184C()
{
  return MEMORY[0x1F4142060]();
}

uint64_t sub_1AB23185C()
{
  return MEMORY[0x1F4142068]();
}

uint64_t sub_1AB23186C()
{
  return MEMORY[0x1F4142070]();
}

uint64_t sub_1AB23187C()
{
  return MEMORY[0x1F4142078]();
}

uint64_t sub_1AB23188C()
{
  return MEMORY[0x1F4142080]();
}

uint64_t sub_1AB23189C()
{
  return MEMORY[0x1F4142088]();
}

uint64_t sub_1AB2318AC()
{
  return MEMORY[0x1F4142090]();
}

uint64_t sub_1AB2318BC()
{
  return MEMORY[0x1F4142098]();
}

uint64_t sub_1AB2318CC()
{
  return MEMORY[0x1F41420A0]();
}

uint64_t sub_1AB2318DC()
{
  return MEMORY[0x1F41420A8]();
}

uint64_t sub_1AB2318EC()
{
  return MEMORY[0x1F41420B0]();
}

uint64_t sub_1AB2318FC()
{
  return MEMORY[0x1F41420B8]();
}

uint64_t sub_1AB23190C()
{
  return MEMORY[0x1F41420C0]();
}

uint64_t sub_1AB23191C()
{
  return MEMORY[0x1F41420C8]();
}

uint64_t sub_1AB23192C()
{
  return MEMORY[0x1F41420D0]();
}

uint64_t sub_1AB23193C()
{
  return MEMORY[0x1F41420D8]();
}

uint64_t sub_1AB23194C()
{
  return MEMORY[0x1F41420E0]();
}

uint64_t sub_1AB23195C()
{
  return MEMORY[0x1F41420E8]();
}

uint64_t sub_1AB23196C()
{
  return MEMORY[0x1F41420F0]();
}

uint64_t sub_1AB23197C()
{
  return MEMORY[0x1F41420F8]();
}

uint64_t sub_1AB23198C()
{
  return MEMORY[0x1F4142100]();
}

uint64_t sub_1AB23199C()
{
  return MEMORY[0x1F4142108]();
}

uint64_t sub_1AB2319AC()
{
  return MEMORY[0x1F4142110]();
}

uint64_t sub_1AB2319BC()
{
  return MEMORY[0x1F4142118]();
}

uint64_t sub_1AB2319CC()
{
  return MEMORY[0x1F4142120]();
}

uint64_t sub_1AB2319DC()
{
  return MEMORY[0x1F4142128]();
}

uint64_t sub_1AB2319EC()
{
  return MEMORY[0x1F4142130]();
}

uint64_t sub_1AB2319FC()
{
  return MEMORY[0x1F4142138]();
}

uint64_t sub_1AB231A0C()
{
  return MEMORY[0x1F4142140]();
}

uint64_t sub_1AB231A1C()
{
  return MEMORY[0x1F4142148]();
}

uint64_t sub_1AB231A2C()
{
  return MEMORY[0x1F4142150]();
}

uint64_t sub_1AB231A3C()
{
  return MEMORY[0x1F4142158]();
}

uint64_t sub_1AB231A4C()
{
  return MEMORY[0x1F4142160]();
}

uint64_t sub_1AB231A5C()
{
  return MEMORY[0x1F4142168]();
}

uint64_t sub_1AB231A6C()
{
  return MEMORY[0x1F4142170]();
}

uint64_t sub_1AB231A7C()
{
  return MEMORY[0x1F4142178]();
}

uint64_t sub_1AB231A8C()
{
  return MEMORY[0x1F4142180]();
}

uint64_t sub_1AB231A9C()
{
  return MEMORY[0x1F4142188]();
}

uint64_t sub_1AB231AAC()
{
  return MEMORY[0x1F4142190]();
}

uint64_t sub_1AB231ABC()
{
  return MEMORY[0x1F4142198]();
}

uint64_t sub_1AB231ACC()
{
  return MEMORY[0x1F41421A0]();
}

uint64_t sub_1AB231ADC()
{
  return MEMORY[0x1F41421A8]();
}

uint64_t sub_1AB231AEC()
{
  return MEMORY[0x1F41421B0]();
}

uint64_t sub_1AB231AFC()
{
  return MEMORY[0x1F41421B8]();
}

uint64_t sub_1AB231B0C()
{
  return MEMORY[0x1F41421C0]();
}

uint64_t sub_1AB231B1C()
{
  return MEMORY[0x1F41421C8]();
}

uint64_t sub_1AB231B2C()
{
  return MEMORY[0x1F41421D0]();
}

uint64_t sub_1AB231B3C()
{
  return MEMORY[0x1F41421D8]();
}

uint64_t sub_1AB231B4C()
{
  return MEMORY[0x1F41421E0]();
}

uint64_t sub_1AB231B5C()
{
  return MEMORY[0x1F41421E8]();
}

uint64_t sub_1AB231B6C()
{
  return MEMORY[0x1F41421F0]();
}

uint64_t sub_1AB231B7C()
{
  return MEMORY[0x1F41421F8]();
}

uint64_t sub_1AB231B8C()
{
  return MEMORY[0x1F4142200]();
}

uint64_t sub_1AB231B9C()
{
  return MEMORY[0x1F4142208]();
}

uint64_t sub_1AB231BAC()
{
  return MEMORY[0x1F4142210]();
}

uint64_t sub_1AB231BBC()
{
  return MEMORY[0x1F4142218]();
}

uint64_t sub_1AB231BCC()
{
  return MEMORY[0x1F4142220]();
}

uint64_t sub_1AB231BDC()
{
  return MEMORY[0x1F4142228]();
}

uint64_t sub_1AB231BEC()
{
  return MEMORY[0x1F4142230]();
}

uint64_t sub_1AB231BFC()
{
  return MEMORY[0x1F4142238]();
}

uint64_t sub_1AB231C0C()
{
  return MEMORY[0x1F4142240]();
}

uint64_t sub_1AB231C1C()
{
  return MEMORY[0x1F4142248]();
}

uint64_t sub_1AB231C2C()
{
  return MEMORY[0x1F4142250]();
}

uint64_t sub_1AB231C3C()
{
  return MEMORY[0x1F4142258]();
}

uint64_t sub_1AB231C4C()
{
  return MEMORY[0x1F4142260]();
}

uint64_t sub_1AB231C5C()
{
  return MEMORY[0x1F4142268]();
}

uint64_t sub_1AB231C6C()
{
  return MEMORY[0x1F4142270]();
}

uint64_t sub_1AB231C7C()
{
  return MEMORY[0x1F4142278]();
}

uint64_t sub_1AB231C8C()
{
  return MEMORY[0x1F4142280]();
}

uint64_t sub_1AB231C9C()
{
  return MEMORY[0x1F4142288]();
}

uint64_t sub_1AB231CAC()
{
  return MEMORY[0x1F4142290]();
}

uint64_t sub_1AB231CBC()
{
  return MEMORY[0x1F4142298]();
}

uint64_t sub_1AB231CCC()
{
  return MEMORY[0x1F41422A0]();
}

uint64_t sub_1AB231CDC()
{
  return MEMORY[0x1F41422A8]();
}

uint64_t sub_1AB231CEC()
{
  return MEMORY[0x1F41422B0]();
}

uint64_t sub_1AB231CFC()
{
  return MEMORY[0x1F41422B8]();
}

uint64_t sub_1AB231D0C()
{
  return MEMORY[0x1F41422C0]();
}

uint64_t sub_1AB231D1C()
{
  return MEMORY[0x1F41422C8]();
}

uint64_t sub_1AB231D2C()
{
  return MEMORY[0x1F41422D0]();
}

uint64_t sub_1AB231D3C()
{
  return MEMORY[0x1F41422D8]();
}

uint64_t sub_1AB231D4C()
{
  return MEMORY[0x1F41422E0]();
}

uint64_t sub_1AB231D5C()
{
  return MEMORY[0x1F41422E8]();
}

uint64_t sub_1AB231D6C()
{
  return MEMORY[0x1F41422F0]();
}

uint64_t sub_1AB231D7C()
{
  return MEMORY[0x1F41422F8]();
}

uint64_t sub_1AB231D8C()
{
  return MEMORY[0x1F4142300]();
}

uint64_t sub_1AB231D9C()
{
  return MEMORY[0x1F4142308]();
}

uint64_t sub_1AB231DAC()
{
  return MEMORY[0x1F4142310]();
}

uint64_t sub_1AB231DBC()
{
  return MEMORY[0x1F4142318]();
}

uint64_t sub_1AB231DCC()
{
  return MEMORY[0x1F4142320]();
}

uint64_t sub_1AB231DDC()
{
  return MEMORY[0x1F4142328]();
}

uint64_t sub_1AB231DEC()
{
  return MEMORY[0x1F4142330]();
}

uint64_t sub_1AB231DFC()
{
  return MEMORY[0x1F4142338]();
}

uint64_t sub_1AB231E0C()
{
  return MEMORY[0x1F4142340]();
}

uint64_t sub_1AB231E1C()
{
  return MEMORY[0x1F4142348]();
}

uint64_t sub_1AB231E2C()
{
  return MEMORY[0x1F4142350]();
}

uint64_t sub_1AB231E3C()
{
  return MEMORY[0x1F4142358]();
}

uint64_t sub_1AB231E4C()
{
  return MEMORY[0x1F4142360]();
}

uint64_t sub_1AB231E5C()
{
  return MEMORY[0x1F4142368]();
}

uint64_t sub_1AB231E6C()
{
  return MEMORY[0x1F4142370]();
}

uint64_t sub_1AB231E7C()
{
  return MEMORY[0x1F4142378]();
}

uint64_t sub_1AB231E8C()
{
  return MEMORY[0x1F4142380]();
}

uint64_t sub_1AB231E9C()
{
  return MEMORY[0x1F4142388]();
}

uint64_t sub_1AB231EAC()
{
  return MEMORY[0x1F4142390]();
}

uint64_t sub_1AB231EBC()
{
  return MEMORY[0x1F4142398]();
}

uint64_t sub_1AB231ECC()
{
  return MEMORY[0x1F41423A0]();
}

uint64_t sub_1AB231EDC()
{
  return MEMORY[0x1F41423A8]();
}

uint64_t sub_1AB231EEC()
{
  return MEMORY[0x1F41423B0]();
}

uint64_t sub_1AB231EFC()
{
  return MEMORY[0x1F41423B8]();
}

uint64_t sub_1AB231F0C()
{
  return MEMORY[0x1F41423C0]();
}

uint64_t sub_1AB231F1C()
{
  return MEMORY[0x1F41423C8]();
}

uint64_t sub_1AB231F2C()
{
  return MEMORY[0x1F41423D0]();
}

uint64_t sub_1AB231F3C()
{
  return MEMORY[0x1F41423D8]();
}

uint64_t sub_1AB231F4C()
{
  return MEMORY[0x1F41423E0]();
}

uint64_t sub_1AB231F5C()
{
  return MEMORY[0x1F41423E8]();
}

uint64_t sub_1AB231F6C()
{
  return MEMORY[0x1F41423F0]();
}

uint64_t sub_1AB231F7C()
{
  return MEMORY[0x1F41423F8]();
}

uint64_t sub_1AB231F8C()
{
  return MEMORY[0x1F4142400]();
}

uint64_t sub_1AB231F9C()
{
  return MEMORY[0x1F4142408]();
}

uint64_t sub_1AB231FAC()
{
  return MEMORY[0x1F4142410]();
}

uint64_t sub_1AB231FBC()
{
  return MEMORY[0x1F4142418]();
}

uint64_t sub_1AB231FCC()
{
  return MEMORY[0x1F4142420]();
}

uint64_t sub_1AB231FDC()
{
  return MEMORY[0x1F4142428]();
}

uint64_t sub_1AB231FEC()
{
  return MEMORY[0x1F4142430]();
}

uint64_t sub_1AB231FFC()
{
  return MEMORY[0x1F4142438]();
}

uint64_t sub_1AB23200C()
{
  return MEMORY[0x1F4142440]();
}

uint64_t sub_1AB23201C()
{
  return MEMORY[0x1F4142448]();
}

uint64_t sub_1AB23202C()
{
  return MEMORY[0x1F4142450]();
}

uint64_t sub_1AB23203C()
{
  return MEMORY[0x1F4142458]();
}

uint64_t sub_1AB23204C()
{
  return MEMORY[0x1F4142460]();
}

uint64_t sub_1AB23205C()
{
  return MEMORY[0x1F4142468]();
}

uint64_t sub_1AB23206C()
{
  return MEMORY[0x1F4142470]();
}

uint64_t sub_1AB23207C()
{
  return MEMORY[0x1F4142478]();
}

uint64_t sub_1AB23208C()
{
  return MEMORY[0x1F4142480]();
}

uint64_t sub_1AB23209C()
{
  return MEMORY[0x1F4142488]();
}

uint64_t sub_1AB2320AC()
{
  return MEMORY[0x1F4142490]();
}

uint64_t sub_1AB2320BC()
{
  return MEMORY[0x1F4142498]();
}

uint64_t sub_1AB2320CC()
{
  return MEMORY[0x1F41424A0]();
}

uint64_t sub_1AB2320DC()
{
  return MEMORY[0x1F41424A8]();
}

uint64_t sub_1AB2320EC()
{
  return MEMORY[0x1F41424B0]();
}

uint64_t sub_1AB2320FC()
{
  return MEMORY[0x1F41424B8]();
}

uint64_t sub_1AB23210C()
{
  return MEMORY[0x1F41424C0]();
}

uint64_t sub_1AB23211C()
{
  return MEMORY[0x1F41424C8]();
}

uint64_t sub_1AB23212C()
{
  return MEMORY[0x1F41424D0]();
}

uint64_t sub_1AB23213C()
{
  return MEMORY[0x1F41424D8]();
}

uint64_t sub_1AB23214C()
{
  return MEMORY[0x1F41424E0]();
}

uint64_t sub_1AB23215C()
{
  return MEMORY[0x1F41424E8]();
}

uint64_t sub_1AB23216C()
{
  return MEMORY[0x1F41424F0]();
}

uint64_t sub_1AB23217C()
{
  return MEMORY[0x1F41424F8]();
}

uint64_t sub_1AB23218C()
{
  return MEMORY[0x1F4142500]();
}

uint64_t sub_1AB23219C()
{
  return MEMORY[0x1F4142508]();
}

uint64_t sub_1AB2321AC()
{
  return MEMORY[0x1F4142510]();
}

uint64_t sub_1AB2321BC()
{
  return MEMORY[0x1F4142518]();
}

uint64_t sub_1AB2321CC()
{
  return MEMORY[0x1F4142520]();
}

uint64_t sub_1AB2321DC()
{
  return MEMORY[0x1F4142528]();
}

uint64_t sub_1AB2321EC()
{
  return MEMORY[0x1F4142530]();
}

uint64_t sub_1AB2321FC()
{
  return MEMORY[0x1F4142538]();
}

uint64_t sub_1AB23220C()
{
  return MEMORY[0x1F4142540]();
}

uint64_t sub_1AB23221C()
{
  return MEMORY[0x1F4142548]();
}

uint64_t sub_1AB23222C()
{
  return MEMORY[0x1F4142550]();
}

uint64_t sub_1AB23223C()
{
  return MEMORY[0x1F4142558]();
}

uint64_t sub_1AB23224C()
{
  return MEMORY[0x1F4142560]();
}

uint64_t sub_1AB23225C()
{
  return MEMORY[0x1F4142568]();
}

uint64_t sub_1AB23226C()
{
  return MEMORY[0x1F4142570]();
}

uint64_t sub_1AB23227C()
{
  return MEMORY[0x1F4142578]();
}

uint64_t sub_1AB23228C()
{
  return MEMORY[0x1F4142580]();
}

uint64_t sub_1AB23229C()
{
  return MEMORY[0x1F4142588]();
}

uint64_t sub_1AB2322AC()
{
  return MEMORY[0x1F4142590]();
}

uint64_t sub_1AB2322BC()
{
  return MEMORY[0x1F4142598]();
}

uint64_t sub_1AB2322CC()
{
  return MEMORY[0x1F41425A0]();
}

uint64_t sub_1AB2322DC()
{
  return MEMORY[0x1F41425A8]();
}

uint64_t sub_1AB2322EC()
{
  return MEMORY[0x1F41425B0]();
}

uint64_t sub_1AB2322FC()
{
  return MEMORY[0x1F41425B8]();
}

uint64_t sub_1AB23230C()
{
  return MEMORY[0x1F41425C0]();
}

uint64_t sub_1AB23231C()
{
  return MEMORY[0x1F41425C8]();
}

uint64_t sub_1AB23232C()
{
  return MEMORY[0x1F41425D0]();
}

uint64_t sub_1AB23233C()
{
  return MEMORY[0x1F41425D8]();
}

uint64_t sub_1AB23234C()
{
  return MEMORY[0x1F41425E0]();
}

uint64_t sub_1AB23235C()
{
  return MEMORY[0x1F41425E8]();
}

uint64_t sub_1AB23236C()
{
  return MEMORY[0x1F41425F0]();
}

uint64_t sub_1AB23237C()
{
  return MEMORY[0x1F41425F8]();
}

uint64_t sub_1AB23238C()
{
  return MEMORY[0x1F4142600]();
}

uint64_t sub_1AB23239C()
{
  return MEMORY[0x1F4142610]();
}

uint64_t sub_1AB2323AC()
{
  return MEMORY[0x1F4142618]();
}

uint64_t sub_1AB2323BC()
{
  return MEMORY[0x1F4142620]();
}

uint64_t sub_1AB2323CC()
{
  return MEMORY[0x1F4142628]();
}

uint64_t sub_1AB2323DC()
{
  return MEMORY[0x1F4142630]();
}

uint64_t sub_1AB2323EC()
{
  return MEMORY[0x1F4142638]();
}

uint64_t sub_1AB2323FC()
{
  return MEMORY[0x1F4142640]();
}

uint64_t sub_1AB23240C()
{
  return MEMORY[0x1F4142648]();
}

uint64_t sub_1AB23241C()
{
  return MEMORY[0x1F4142650]();
}

uint64_t sub_1AB23242C()
{
  return MEMORY[0x1F4142658]();
}

uint64_t sub_1AB23243C()
{
  return MEMORY[0x1F4142660]();
}

uint64_t sub_1AB23244C()
{
  return MEMORY[0x1F4142668]();
}

uint64_t sub_1AB23245C()
{
  return MEMORY[0x1F4142670]();
}

uint64_t sub_1AB23246C()
{
  return MEMORY[0x1F4142678]();
}

uint64_t sub_1AB23247C()
{
  return MEMORY[0x1F4142680]();
}

uint64_t sub_1AB23248C()
{
  return MEMORY[0x1F4142688]();
}

uint64_t sub_1AB23249C()
{
  return MEMORY[0x1F4142690]();
}

uint64_t sub_1AB2324AC()
{
  return MEMORY[0x1F4142698]();
}

uint64_t sub_1AB2324BC()
{
  return MEMORY[0x1F41426A0]();
}

uint64_t sub_1AB2324CC()
{
  return MEMORY[0x1F41426A8]();
}

uint64_t sub_1AB2324DC()
{
  return MEMORY[0x1F41426B0]();
}

uint64_t sub_1AB2324EC()
{
  return MEMORY[0x1F41426B8]();
}

uint64_t sub_1AB2324FC()
{
  return MEMORY[0x1F41426C0]();
}

uint64_t sub_1AB23250C()
{
  return MEMORY[0x1F41426C8]();
}

uint64_t sub_1AB23251C()
{
  return MEMORY[0x1F41426D0]();
}

uint64_t sub_1AB23252C()
{
  return MEMORY[0x1F41426D8]();
}

uint64_t sub_1AB23253C()
{
  return MEMORY[0x1F41426E0]();
}

uint64_t sub_1AB23254C()
{
  return MEMORY[0x1F41426E8]();
}

uint64_t sub_1AB23255C()
{
  return MEMORY[0x1F41426F0]();
}

uint64_t sub_1AB23256C()
{
  return MEMORY[0x1F41426F8]();
}

uint64_t sub_1AB23257C()
{
  return MEMORY[0x1F4142700]();
}

uint64_t sub_1AB23258C()
{
  return MEMORY[0x1F4142708]();
}

uint64_t sub_1AB23259C()
{
  return MEMORY[0x1F4142710]();
}

uint64_t sub_1AB2325AC()
{
  return MEMORY[0x1F4142718]();
}

uint64_t sub_1AB2325BC()
{
  return MEMORY[0x1F4142720]();
}

uint64_t sub_1AB2325CC()
{
  return MEMORY[0x1F4142728]();
}

uint64_t sub_1AB2325DC()
{
  return MEMORY[0x1F4142730]();
}

uint64_t sub_1AB2325EC()
{
  return MEMORY[0x1F4142738]();
}

uint64_t sub_1AB2325FC()
{
  return MEMORY[0x1F4142740]();
}

uint64_t sub_1AB23260C()
{
  return MEMORY[0x1F4142748]();
}

uint64_t sub_1AB23261C()
{
  return MEMORY[0x1F4142750]();
}

uint64_t sub_1AB23262C()
{
  return MEMORY[0x1F4142758]();
}

uint64_t sub_1AB23263C()
{
  return MEMORY[0x1F4142760]();
}

uint64_t sub_1AB23264C()
{
  return MEMORY[0x1F4142768]();
}

uint64_t sub_1AB23265C()
{
  return MEMORY[0x1F4142770]();
}

uint64_t sub_1AB23266C()
{
  return MEMORY[0x1F4142778]();
}

uint64_t sub_1AB23267C()
{
  return MEMORY[0x1F4142780]();
}

uint64_t sub_1AB23268C()
{
  return MEMORY[0x1F4142788]();
}

uint64_t sub_1AB23269C()
{
  return MEMORY[0x1F4142790]();
}

uint64_t sub_1AB2326AC()
{
  return MEMORY[0x1F4142798]();
}

uint64_t sub_1AB2326BC()
{
  return MEMORY[0x1F41427A0]();
}

uint64_t sub_1AB2326CC()
{
  return MEMORY[0x1F41427A8]();
}

uint64_t sub_1AB2326DC()
{
  return MEMORY[0x1F41427B0]();
}

uint64_t sub_1AB2326EC()
{
  return MEMORY[0x1F41427B8]();
}

uint64_t sub_1AB2326FC()
{
  return MEMORY[0x1F41427C0]();
}

uint64_t sub_1AB23270C()
{
  return MEMORY[0x1F41427C8]();
}

uint64_t sub_1AB23271C()
{
  return MEMORY[0x1F41427D0]();
}

uint64_t sub_1AB23272C()
{
  return MEMORY[0x1F41427D8]();
}

uint64_t sub_1AB23273C()
{
  return MEMORY[0x1F41427E0]();
}

uint64_t sub_1AB23274C()
{
  return MEMORY[0x1F41427E8]();
}

uint64_t sub_1AB23275C()
{
  return MEMORY[0x1F41427F0]();
}

uint64_t sub_1AB23276C()
{
  return MEMORY[0x1F41427F8]();
}

uint64_t sub_1AB23277C()
{
  return MEMORY[0x1F4142800]();
}

uint64_t sub_1AB23278C()
{
  return MEMORY[0x1F4142808]();
}

uint64_t sub_1AB23279C()
{
  return MEMORY[0x1F4142810]();
}

uint64_t sub_1AB2327AC()
{
  return MEMORY[0x1F4142818]();
}

uint64_t sub_1AB2327BC()
{
  return MEMORY[0x1F4142820]();
}

uint64_t sub_1AB2327CC()
{
  return MEMORY[0x1F4142828]();
}

uint64_t sub_1AB2327DC()
{
  return MEMORY[0x1F4142830]();
}

uint64_t sub_1AB2327EC()
{
  return MEMORY[0x1F4142838]();
}

uint64_t sub_1AB2327FC()
{
  return MEMORY[0x1F4142840]();
}

uint64_t sub_1AB23280C()
{
  return MEMORY[0x1F4142848]();
}

uint64_t sub_1AB23281C()
{
  return MEMORY[0x1F4142850]();
}

uint64_t sub_1AB23282C()
{
  return MEMORY[0x1F4142858]();
}

uint64_t sub_1AB23283C()
{
  return MEMORY[0x1F4142860]();
}

uint64_t sub_1AB23284C()
{
  return MEMORY[0x1F4142868]();
}

uint64_t sub_1AB23285C()
{
  return MEMORY[0x1F4142870]();
}

uint64_t sub_1AB23286C()
{
  return MEMORY[0x1F4142878]();
}

uint64_t sub_1AB23287C()
{
  return MEMORY[0x1F4142880]();
}

uint64_t sub_1AB23288C()
{
  return MEMORY[0x1F4142888]();
}

uint64_t sub_1AB23289C()
{
  return MEMORY[0x1F4142890]();
}

uint64_t sub_1AB2328AC()
{
  return MEMORY[0x1F4142898]();
}

uint64_t sub_1AB2328BC()
{
  return MEMORY[0x1F41428A0]();
}

uint64_t sub_1AB2328CC()
{
  return MEMORY[0x1F41428A8]();
}

uint64_t sub_1AB2328DC()
{
  return MEMORY[0x1F41428B0]();
}

uint64_t sub_1AB2328EC()
{
  return MEMORY[0x1F41428B8]();
}

uint64_t sub_1AB2328FC()
{
  return MEMORY[0x1F41428C0]();
}

uint64_t sub_1AB23290C()
{
  return MEMORY[0x1F41428C8]();
}

uint64_t sub_1AB23291C()
{
  return MEMORY[0x1F41428D0]();
}

uint64_t sub_1AB23292C()
{
  return MEMORY[0x1F41428D8]();
}

uint64_t sub_1AB23293C()
{
  return MEMORY[0x1F41428E0]();
}

uint64_t sub_1AB23294C()
{
  return MEMORY[0x1F41428E8]();
}

uint64_t sub_1AB23295C()
{
  return MEMORY[0x1F41428F0]();
}

uint64_t sub_1AB23296C()
{
  return MEMORY[0x1F41428F8]();
}

uint64_t sub_1AB23297C()
{
  return MEMORY[0x1F4142900]();
}

uint64_t sub_1AB23298C()
{
  return MEMORY[0x1F4142908]();
}

uint64_t sub_1AB23299C()
{
  return MEMORY[0x1F4142910]();
}

uint64_t sub_1AB2329AC()
{
  return MEMORY[0x1F4142918]();
}

uint64_t sub_1AB2329BC()
{
  return MEMORY[0x1F4142920]();
}

uint64_t sub_1AB2329CC()
{
  return MEMORY[0x1F4142928]();
}

uint64_t sub_1AB2329DC()
{
  return MEMORY[0x1F4142930]();
}

uint64_t sub_1AB2329EC()
{
  return MEMORY[0x1F4142938]();
}

uint64_t sub_1AB2329FC()
{
  return MEMORY[0x1F4142940]();
}

uint64_t sub_1AB232A0C()
{
  return MEMORY[0x1F4142948]();
}

uint64_t sub_1AB232A1C()
{
  return MEMORY[0x1F4142950]();
}

uint64_t sub_1AB232A2C()
{
  return MEMORY[0x1F4142958]();
}

uint64_t sub_1AB232A3C()
{
  return MEMORY[0x1F4142960]();
}

uint64_t sub_1AB232A4C()
{
  return MEMORY[0x1F4142968]();
}

uint64_t sub_1AB232A5C()
{
  return MEMORY[0x1F4142970]();
}

uint64_t sub_1AB232A6C()
{
  return MEMORY[0x1F4142978]();
}

uint64_t sub_1AB232A7C()
{
  return MEMORY[0x1F4142980]();
}

uint64_t sub_1AB232A8C()
{
  return MEMORY[0x1F4142988]();
}

uint64_t sub_1AB232A9C()
{
  return MEMORY[0x1F4142990]();
}

uint64_t sub_1AB232AAC()
{
  return MEMORY[0x1F4142998]();
}

uint64_t sub_1AB232ABC()
{
  return MEMORY[0x1F41429A0]();
}

uint64_t sub_1AB232ACC()
{
  return MEMORY[0x1F41429A8]();
}

uint64_t sub_1AB232ADC()
{
  return MEMORY[0x1F41429B0]();
}

uint64_t sub_1AB232AEC()
{
  return MEMORY[0x1F41429B8]();
}

uint64_t sub_1AB232AFC()
{
  return MEMORY[0x1F41429C0]();
}

uint64_t sub_1AB232B0C()
{
  return MEMORY[0x1F41429C8]();
}

uint64_t sub_1AB232B1C()
{
  return MEMORY[0x1F41429D0]();
}

uint64_t sub_1AB232B2C()
{
  return MEMORY[0x1F41429D8]();
}

uint64_t sub_1AB232B3C()
{
  return MEMORY[0x1F41429E0]();
}

uint64_t sub_1AB232B4C()
{
  return MEMORY[0x1F41429E8]();
}

uint64_t sub_1AB232B5C()
{
  return MEMORY[0x1F41429F0]();
}

uint64_t sub_1AB232B6C()
{
  return MEMORY[0x1F41429F8]();
}

uint64_t sub_1AB232B7C()
{
  return MEMORY[0x1F4142A00]();
}

uint64_t sub_1AB232B8C()
{
  return MEMORY[0x1F4142A08]();
}

uint64_t sub_1AB232B9C()
{
  return MEMORY[0x1F4142A10]();
}

uint64_t sub_1AB232BAC()
{
  return MEMORY[0x1F4142A18]();
}

uint64_t sub_1AB232BBC()
{
  return MEMORY[0x1F4142A20]();
}

uint64_t sub_1AB232BCC()
{
  return MEMORY[0x1F4142A28]();
}

uint64_t sub_1AB232BDC()
{
  return MEMORY[0x1F4142A30]();
}

uint64_t sub_1AB232BEC()
{
  return MEMORY[0x1F4142A38]();
}

uint64_t sub_1AB232BFC()
{
  return MEMORY[0x1F4142A40]();
}

uint64_t sub_1AB232C0C()
{
  return MEMORY[0x1F4142A48]();
}

uint64_t sub_1AB232C1C()
{
  return MEMORY[0x1F4142A50]();
}

uint64_t sub_1AB232C2C()
{
  return MEMORY[0x1F4142A58]();
}

uint64_t sub_1AB232C3C()
{
  return MEMORY[0x1F4142A60]();
}

uint64_t sub_1AB232C4C()
{
  return MEMORY[0x1F4142A68]();
}

uint64_t sub_1AB232C5C()
{
  return MEMORY[0x1F4142A70]();
}

uint64_t sub_1AB232C6C()
{
  return MEMORY[0x1F4142A78]();
}

uint64_t sub_1AB232C7C()
{
  return MEMORY[0x1F4142A80]();
}

uint64_t sub_1AB232C8C()
{
  return MEMORY[0x1F4142A88]();
}

uint64_t sub_1AB232C9C()
{
  return MEMORY[0x1F4142A90]();
}

uint64_t sub_1AB232CAC()
{
  return MEMORY[0x1F4142A98]();
}

uint64_t sub_1AB232CBC()
{
  return MEMORY[0x1F4142AA0]();
}

uint64_t sub_1AB232CCC()
{
  return MEMORY[0x1F4142AA8]();
}

uint64_t sub_1AB232CDC()
{
  return MEMORY[0x1F4142AB0]();
}

uint64_t sub_1AB232CEC()
{
  return MEMORY[0x1F4142AB8]();
}

uint64_t sub_1AB232CFC()
{
  return MEMORY[0x1F4142AC0]();
}

uint64_t sub_1AB232D0C()
{
  return MEMORY[0x1F4142AC8]();
}

uint64_t sub_1AB232D1C()
{
  return MEMORY[0x1F4142AD0]();
}

uint64_t sub_1AB232D2C()
{
  return MEMORY[0x1F4142AD8]();
}

uint64_t sub_1AB232D4C()
{
  return MEMORY[0x1F4142AE8]();
}

uint64_t sub_1AB232D5C()
{
  return MEMORY[0x1F4142AF0]();
}

uint64_t sub_1AB232D6C()
{
  return MEMORY[0x1F4142AF8]();
}

uint64_t sub_1AB232D7C()
{
  return MEMORY[0x1F4142B00]();
}

uint64_t sub_1AB232D8C()
{
  return MEMORY[0x1F4142B08]();
}

uint64_t sub_1AB232D9C()
{
  return MEMORY[0x1F4142B10]();
}

uint64_t sub_1AB232DAC()
{
  return MEMORY[0x1F4142B18]();
}

uint64_t sub_1AB232DBC()
{
  return MEMORY[0x1F4142B20]();
}

uint64_t sub_1AB232DCC()
{
  return MEMORY[0x1F4142B28]();
}

uint64_t sub_1AB232DDC()
{
  return MEMORY[0x1F4142B30]();
}

uint64_t sub_1AB232DEC()
{
  return MEMORY[0x1F4142B38]();
}

uint64_t sub_1AB232DFC()
{
  return MEMORY[0x1F4142B40]();
}

uint64_t sub_1AB232E0C()
{
  return MEMORY[0x1F4142B48]();
}

uint64_t sub_1AB232E1C()
{
  return MEMORY[0x1F4142B50]();
}

uint64_t sub_1AB232E2C()
{
  return MEMORY[0x1F4142B58]();
}

uint64_t sub_1AB232E3C()
{
  return MEMORY[0x1F4142B60]();
}

uint64_t sub_1AB232E4C()
{
  return MEMORY[0x1F4142B68]();
}

uint64_t sub_1AB232E5C()
{
  return MEMORY[0x1F4142B70]();
}

uint64_t sub_1AB232E6C()
{
  return MEMORY[0x1F4142B78]();
}

uint64_t sub_1AB232E7C()
{
  return MEMORY[0x1F4142B80]();
}

uint64_t sub_1AB232E8C()
{
  return MEMORY[0x1F4142B88]();
}

uint64_t sub_1AB232E9C()
{
  return MEMORY[0x1F4142B90]();
}

uint64_t sub_1AB232EAC()
{
  return MEMORY[0x1F4142B98]();
}

uint64_t sub_1AB232EBC()
{
  return MEMORY[0x1F4142BA0]();
}

uint64_t sub_1AB232ECC()
{
  return MEMORY[0x1F4142BA8]();
}

uint64_t sub_1AB232EDC()
{
  return MEMORY[0x1F4142BB0]();
}

uint64_t sub_1AB232EEC()
{
  return MEMORY[0x1F4142BB8]();
}

uint64_t sub_1AB232EFC()
{
  return MEMORY[0x1F4142BC0]();
}

uint64_t sub_1AB232F0C()
{
  return MEMORY[0x1F4142BC8]();
}

uint64_t sub_1AB232F1C()
{
  return MEMORY[0x1F4142BD0]();
}

uint64_t sub_1AB232F2C()
{
  return MEMORY[0x1F4142BD8]();
}

uint64_t sub_1AB232F3C()
{
  return MEMORY[0x1F4142BE0]();
}

uint64_t sub_1AB232F4C()
{
  return MEMORY[0x1F4142BE8]();
}

uint64_t sub_1AB232F5C()
{
  return MEMORY[0x1F4142BF0]();
}

uint64_t sub_1AB232F6C()
{
  return MEMORY[0x1F4142BF8]();
}

uint64_t sub_1AB232F7C()
{
  return MEMORY[0x1F4142C00]();
}

uint64_t sub_1AB232F8C()
{
  return MEMORY[0x1F4142C08]();
}

uint64_t sub_1AB232F9C()
{
  return MEMORY[0x1F4142C10]();
}

uint64_t sub_1AB232FAC()
{
  return MEMORY[0x1F4142C18]();
}

uint64_t sub_1AB232FBC()
{
  return MEMORY[0x1F4142C20]();
}

uint64_t sub_1AB232FCC()
{
  return MEMORY[0x1F4142C28]();
}

uint64_t sub_1AB232FDC()
{
  return MEMORY[0x1F4142C30]();
}

uint64_t sub_1AB232FEC()
{
  return MEMORY[0x1F4142C38]();
}

uint64_t sub_1AB232FFC()
{
  return MEMORY[0x1F4142C40]();
}

uint64_t sub_1AB23300C()
{
  return MEMORY[0x1F4142C48]();
}

uint64_t sub_1AB23301C()
{
  return MEMORY[0x1F4142C50]();
}

uint64_t sub_1AB23302C()
{
  return MEMORY[0x1F4142C58]();
}

uint64_t sub_1AB23303C()
{
  return MEMORY[0x1F4142C60]();
}

uint64_t sub_1AB23304C()
{
  return MEMORY[0x1F4142C68]();
}

uint64_t sub_1AB23305C()
{
  return MEMORY[0x1F4142C70]();
}

uint64_t sub_1AB23306C()
{
  return MEMORY[0x1F4142C78]();
}

uint64_t sub_1AB23307C()
{
  return MEMORY[0x1F4142C80]();
}

uint64_t sub_1AB23308C()
{
  return MEMORY[0x1F4142C88]();
}

uint64_t sub_1AB23309C()
{
  return MEMORY[0x1F4142C90]();
}

uint64_t sub_1AB2330AC()
{
  return MEMORY[0x1F4142C98]();
}

uint64_t sub_1AB2330BC()
{
  return MEMORY[0x1F4142CA0]();
}

uint64_t sub_1AB2330CC()
{
  return MEMORY[0x1F4142CA8]();
}

uint64_t sub_1AB2330DC()
{
  return MEMORY[0x1F4142CB0]();
}

uint64_t sub_1AB2330EC()
{
  return MEMORY[0x1F4142CB8]();
}

uint64_t sub_1AB2330FC()
{
  return MEMORY[0x1F4142CC0]();
}

uint64_t sub_1AB23310C()
{
  return MEMORY[0x1F4142CC8]();
}

uint64_t sub_1AB23311C()
{
  return MEMORY[0x1F4142CD0]();
}

uint64_t sub_1AB23312C()
{
  return MEMORY[0x1F4142CD8]();
}

uint64_t sub_1AB23313C()
{
  return MEMORY[0x1F4142CE0]();
}

uint64_t sub_1AB23314C()
{
  return MEMORY[0x1F4142CE8]();
}

uint64_t sub_1AB23315C()
{
  return MEMORY[0x1F4142CF0]();
}

uint64_t sub_1AB23316C()
{
  return MEMORY[0x1F4142CF8]();
}

uint64_t sub_1AB23317C()
{
  return MEMORY[0x1F4142D00]();
}

uint64_t sub_1AB23318C()
{
  return MEMORY[0x1F4142D08]();
}

uint64_t sub_1AB23319C()
{
  return MEMORY[0x1F4142D10]();
}

uint64_t sub_1AB2331AC()
{
  return MEMORY[0x1F4142D18]();
}

uint64_t sub_1AB2331BC()
{
  return MEMORY[0x1F4142D20]();
}

uint64_t sub_1AB2331CC()
{
  return MEMORY[0x1F4142D28]();
}

uint64_t sub_1AB2331DC()
{
  return MEMORY[0x1F4142D30]();
}

uint64_t sub_1AB2331EC()
{
  return MEMORY[0x1F4142D38]();
}

uint64_t sub_1AB2331FC()
{
  return MEMORY[0x1F4142D40]();
}

uint64_t sub_1AB23320C()
{
  return MEMORY[0x1F4142D48]();
}

uint64_t sub_1AB23322C()
{
  return MEMORY[0x1F4143198]();
}

uint64_t sub_1AB23323C()
{
  return MEMORY[0x1F41431A0]();
}

uint64_t sub_1AB23324C()
{
  return MEMORY[0x1F41431A8]();
}

uint64_t sub_1AB23325C()
{
  return MEMORY[0x1F4143228]();
}

uint64_t sub_1AB23326C()
{
  return MEMORY[0x1F4143230]();
}

uint64_t sub_1AB23327C()
{
  return MEMORY[0x1F4143238]();
}

uint64_t sub_1AB2332AC()
{
  return MEMORY[0x1F4143268]();
}

uint64_t sub_1AB2332BC()
{
  return MEMORY[0x1F4143270]();
}

uint64_t sub_1AB2332CC()
{
  return MEMORY[0x1F4140AD0]();
}

uint64_t sub_1AB2332DC()
{
  return MEMORY[0x1F4140AD8]();
}

uint64_t sub_1AB2332EC()
{
  return MEMORY[0x1F4140AE0]();
}

uint64_t sub_1AB2332FC()
{
  return MEMORY[0x1F4140AE8]();
}

uint64_t sub_1AB23330C()
{
  return MEMORY[0x1F4140AF0]();
}

uint64_t sub_1AB23331C()
{
  return MEMORY[0x1F4140B00]();
}

uint64_t sub_1AB23332C()
{
  return MEMORY[0x1F4140B08]();
}

uint64_t sub_1AB23333C()
{
  return MEMORY[0x1F4140B10]();
}

uint64_t sub_1AB23334C()
{
  return MEMORY[0x1F4140B20]();
}

uint64_t sub_1AB23335C()
{
  return MEMORY[0x1F4140B28]();
}

uint64_t sub_1AB23336C()
{
  return MEMORY[0x1F4140B30]();
}

uint64_t sub_1AB23337C()
{
  return MEMORY[0x1F4140B50]();
}

uint64_t sub_1AB23338C()
{
  return MEMORY[0x1F4140B58]();
}

uint64_t sub_1AB23339C()
{
  return MEMORY[0x1F4140B60]();
}

uint64_t sub_1AB2333AC()
{
  return MEMORY[0x1F4140B68]();
}

uint64_t sub_1AB2333BC()
{
  return MEMORY[0x1F4140B70]();
}

uint64_t sub_1AB2333CC()
{
  return MEMORY[0x1F4140B78]();
}

uint64_t sub_1AB2333DC()
{
  return MEMORY[0x1F4140B80]();
}

uint64_t sub_1AB2333EC()
{
  return MEMORY[0x1F4140C08]();
}

uint64_t sub_1AB2333FC()
{
  return MEMORY[0x1F4140C10]();
}

uint64_t sub_1AB23340C()
{
  return MEMORY[0x1F4140C18]();
}

uint64_t sub_1AB23341C()
{
  return MEMORY[0x1F4140C20]();
}

uint64_t sub_1AB23342C()
{
  return MEMORY[0x1F4140C28]();
}

uint64_t sub_1AB23343C()
{
  return MEMORY[0x1F4140C30]();
}

uint64_t sub_1AB23344C()
{
  return MEMORY[0x1F4140C38]();
}

uint64_t sub_1AB23345C()
{
  return MEMORY[0x1F4140C40]();
}

uint64_t sub_1AB23346C()
{
  return MEMORY[0x1F4140C48]();
}

uint64_t sub_1AB23347C()
{
  return MEMORY[0x1F4140C50]();
}

uint64_t sub_1AB23348C()
{
  return MEMORY[0x1F4140C58]();
}

uint64_t sub_1AB23349C()
{
  return MEMORY[0x1F4140C60]();
}

uint64_t sub_1AB2334AC()
{
  return MEMORY[0x1F4140C68]();
}

uint64_t sub_1AB2334BC()
{
  return MEMORY[0x1F4140C80]();
}

uint64_t sub_1AB2334CC()
{
  return MEMORY[0x1F4140C88]();
}

uint64_t sub_1AB2334DC()
{
  return MEMORY[0x1F4140C90]();
}

uint64_t sub_1AB2334EC()
{
  return MEMORY[0x1F4140C98]();
}

uint64_t sub_1AB2334FC()
{
  return MEMORY[0x1F4140CA0]();
}

uint64_t sub_1AB23350C()
{
  return MEMORY[0x1F4140CA8]();
}

uint64_t sub_1AB23351C()
{
  return MEMORY[0x1F4140CD0]();
}

uint64_t sub_1AB23352C()
{
  return MEMORY[0x1F4140CD8]();
}

uint64_t sub_1AB23353C()
{
  return MEMORY[0x1F4140CE0]();
}

uint64_t sub_1AB23354C()
{
  return MEMORY[0x1F4140CE8]();
}

uint64_t sub_1AB23355C()
{
  return MEMORY[0x1F4140CF0]();
}

uint64_t sub_1AB23356C()
{
  return MEMORY[0x1F4140CF8]();
}

uint64_t sub_1AB23357C()
{
  return MEMORY[0x1F4140D00]();
}

uint64_t sub_1AB23358C()
{
  return MEMORY[0x1F4140D08]();
}

uint64_t sub_1AB23359C()
{
  return MEMORY[0x1F4140D10]();
}

uint64_t sub_1AB2335AC()
{
  return MEMORY[0x1F4140D18]();
}

uint64_t sub_1AB2335BC()
{
  return MEMORY[0x1F4140D20]();
}

uint64_t sub_1AB2335CC()
{
  return MEMORY[0x1F4140D40]();
}

uint64_t sub_1AB2335DC()
{
  return MEMORY[0x1F4140D48]();
}

uint64_t sub_1AB2335EC()
{
  return MEMORY[0x1F4140D58]();
}

uint64_t sub_1AB2335FC()
{
  return MEMORY[0x1F4140D68]();
}

uint64_t sub_1AB23360C()
{
  return MEMORY[0x1F4140D88]();
}

uint64_t sub_1AB23361C()
{
  return MEMORY[0x1F4140D90]();
}

uint64_t sub_1AB23362C()
{
  return MEMORY[0x1F4140D98]();
}

uint64_t sub_1AB23363C()
{
  return MEMORY[0x1F4140DA0]();
}

uint64_t sub_1AB23364C()
{
  return MEMORY[0x1F4140DB8]();
}

uint64_t sub_1AB23365C()
{
  return MEMORY[0x1F4140DC0]();
}

uint64_t sub_1AB23366C()
{
  return MEMORY[0x1F4140DE8]();
}

uint64_t sub_1AB23367C()
{
  return MEMORY[0x1F4140DF0]();
}

uint64_t sub_1AB23368C()
{
  return MEMORY[0x1F4140DF8]();
}

uint64_t sub_1AB23369C()
{
  return MEMORY[0x1F4140E00]();
}

uint64_t sub_1AB2336AC()
{
  return MEMORY[0x1F4140E08]();
}

uint64_t sub_1AB2336BC()
{
  return MEMORY[0x1F4140E10]();
}

uint64_t sub_1AB2336CC()
{
  return MEMORY[0x1F4140E18]();
}

uint64_t sub_1AB2336DC()
{
  return MEMORY[0x1F4140E20]();
}

uint64_t sub_1AB2336EC()
{
  return MEMORY[0x1F4140E70]();
}

uint64_t sub_1AB2336FC()
{
  return MEMORY[0x1F4140E78]();
}

uint64_t sub_1AB23370C()
{
  return MEMORY[0x1F4140E80]();
}

uint64_t sub_1AB23371C()
{
  return MEMORY[0x1F4140E88]();
}

uint64_t sub_1AB23372C()
{
  return MEMORY[0x1F4140EA8]();
}

uint64_t sub_1AB23373C()
{
  return MEMORY[0x1F4140EB0]();
}

uint64_t sub_1AB23374C()
{
  return MEMORY[0x1F4140EB8]();
}

uint64_t sub_1AB23375C()
{
  return MEMORY[0x1F4140EC0]();
}

uint64_t sub_1AB23376C()
{
  return MEMORY[0x1F4140EC8]();
}

uint64_t sub_1AB23377C()
{
  return MEMORY[0x1F4140EE0]();
}

uint64_t sub_1AB23378C()
{
  return MEMORY[0x1F4140EE8]();
}

uint64_t sub_1AB23379C()
{
  return MEMORY[0x1F4140EF0]();
}

uint64_t sub_1AB2337AC()
{
  return MEMORY[0x1F4140F18]();
}

uint64_t sub_1AB2337BC()
{
  return MEMORY[0x1F4140F88]();
}

uint64_t sub_1AB2337CC()
{
  return MEMORY[0x1F4140F90]();
}

uint64_t sub_1AB2337EC()
{
  return MEMORY[0x1F4140FA0]();
}

uint64_t sub_1AB2337FC()
{
  return MEMORY[0x1F4140FA8]();
}

uint64_t sub_1AB23380C()
{
  return MEMORY[0x1F4140FB0]();
}

uint64_t sub_1AB23381C()
{
  return MEMORY[0x1F4140FC0]();
}

uint64_t sub_1AB23382C()
{
  return MEMORY[0x1F4140FC8]();
}

uint64_t sub_1AB23383C()
{
  return MEMORY[0x1F4140FD0]();
}

uint64_t sub_1AB23384C()
{
  return MEMORY[0x1F4140FE0]();
}

uint64_t sub_1AB23385C()
{
  return MEMORY[0x1F4140FF8]();
}

uint64_t sub_1AB23386C()
{
  return MEMORY[0x1F4141000]();
}

uint64_t sub_1AB23387C()
{
  return MEMORY[0x1F4141008]();
}

uint64_t sub_1AB23388C()
{
  return MEMORY[0x1F4141030]();
}

uint64_t sub_1AB23389C()
{
  return MEMORY[0x1F4141038]();
}

uint64_t sub_1AB2338AC()
{
  return MEMORY[0x1F4141040]();
}

uint64_t sub_1AB2338BC()
{
  return MEMORY[0x1F4141048]();
}

uint64_t sub_1AB2338CC()
{
  return MEMORY[0x1F4141050]();
}

uint64_t sub_1AB2338DC()
{
  return MEMORY[0x1F4141058]();
}

uint64_t sub_1AB2338FC()
{
  return MEMORY[0x1F4141090]();
}

uint64_t sub_1AB23390C()
{
  return MEMORY[0x1F4141098]();
}

uint64_t sub_1AB23392C()
{
  return MEMORY[0x1F41410A8]();
}

uint64_t sub_1AB23393C()
{
  return MEMORY[0x1F41410B0]();
}

uint64_t sub_1AB23394C()
{
  return MEMORY[0x1F41410B8]();
}

uint64_t sub_1AB23395C()
{
  return MEMORY[0x1F41410C0]();
}

uint64_t sub_1AB23396C()
{
  return MEMORY[0x1F41410C8]();
}

uint64_t sub_1AB23397C()
{
  return MEMORY[0x1F41410D0]();
}

uint64_t sub_1AB23398C()
{
  return MEMORY[0x1F41410D8]();
}

uint64_t sub_1AB23399C()
{
  return MEMORY[0x1F4141110]();
}

uint64_t sub_1AB2339AC()
{
  return MEMORY[0x1F4141120]();
}

uint64_t sub_1AB2339BC()
{
  return MEMORY[0x1F4141128]();
}

uint64_t sub_1AB2339CC()
{
  return MEMORY[0x1F4141130]();
}

uint64_t sub_1AB2339DC()
{
  return MEMORY[0x1F4141138]();
}

uint64_t sub_1AB2339EC()
{
  return MEMORY[0x1F4141140]();
}

uint64_t sub_1AB2339FC()
{
  return MEMORY[0x1F4141148]();
}

uint64_t sub_1AB233A0C()
{
  return MEMORY[0x1F4141150]();
}

uint64_t sub_1AB233A1C()
{
  return MEMORY[0x1F4141160]();
}

uint64_t sub_1AB233A2C()
{
  return MEMORY[0x1F4141168]();
}

uint64_t sub_1AB233A3C()
{
  return MEMORY[0x1F4141170]();
}

uint64_t sub_1AB233A4C()
{
  return MEMORY[0x1F4141178]();
}

uint64_t sub_1AB233A5C()
{
  return MEMORY[0x1F41411A8]();
}

uint64_t sub_1AB233A6C()
{
  return MEMORY[0x1F41411B0]();
}

uint64_t sub_1AB233A7C()
{
  return MEMORY[0x1F41411B8]();
}

uint64_t sub_1AB233A8C()
{
  return MEMORY[0x1F41411C8]();
}

uint64_t sub_1AB233A9C()
{
  return MEMORY[0x1F41411D0]();
}

uint64_t sub_1AB233AAC()
{
  return MEMORY[0x1F4141250]();
}

uint64_t sub_1AB233ABC()
{
  return MEMORY[0x1F4141258]();
}

uint64_t sub_1AB233ACC()
{
  return MEMORY[0x1F4141260]();
}

uint64_t sub_1AB233ADC()
{
  return MEMORY[0x1F4141268]();
}

uint64_t sub_1AB233AEC()
{
  return MEMORY[0x1F4141270]();
}

uint64_t sub_1AB233AFC()
{
  return MEMORY[0x1F4141278]();
}

uint64_t sub_1AB233B0C()
{
  return MEMORY[0x1F4141288]();
}

uint64_t sub_1AB233B1C()
{
  return MEMORY[0x1F4141290]();
}

uint64_t sub_1AB233B2C()
{
  return MEMORY[0x1F4141298]();
}

uint64_t sub_1AB233B4C()
{
  return MEMORY[0x1F41412A8]();
}

uint64_t sub_1AB233B5C()
{
  return MEMORY[0x1F41412B8]();
}

uint64_t sub_1AB233B6C()
{
  return MEMORY[0x1F41412C0]();
}

uint64_t sub_1AB233B7C()
{
  return MEMORY[0x1F41412C8]();
}

uint64_t sub_1AB233B8C()
{
  return MEMORY[0x1F41412D0]();
}

uint64_t sub_1AB233B9C()
{
  return MEMORY[0x1F41412D8]();
}

uint64_t sub_1AB233BAC()
{
  return MEMORY[0x1F41412E0]();
}

uint64_t sub_1AB233BBC()
{
  return MEMORY[0x1F41412E8]();
}

uint64_t sub_1AB233BCC()
{
  return MEMORY[0x1F4141308]();
}

uint64_t sub_1AB233BDC()
{
  return MEMORY[0x1F4141360]();
}

uint64_t sub_1AB233BEC()
{
  return MEMORY[0x1F4141368]();
}

uint64_t sub_1AB233C0C()
{
  return MEMORY[0x1F4141378]();
}

uint64_t sub_1AB233C1C()
{
  return MEMORY[0x1F4141380]();
}

uint64_t sub_1AB233C2C()
{
  return MEMORY[0x1F41413A8]();
}

uint64_t sub_1AB233C3C()
{
  return MEMORY[0x1F41413B0]();
}

uint64_t sub_1AB233C4C()
{
  return MEMORY[0x1F41413B8]();
}

uint64_t sub_1AB233C5C()
{
  return MEMORY[0x1F41413C0]();
}

uint64_t sub_1AB233C6C()
{
  return MEMORY[0x1F4141418]();
}

uint64_t sub_1AB233C7C()
{
  return MEMORY[0x1F4141420]();
}

uint64_t sub_1AB233C8C()
{
  return MEMORY[0x1F4141428]();
}

uint64_t sub_1AB233C9C()
{
  return MEMORY[0x1F4141430]();
}

uint64_t sub_1AB233CAC()
{
  return MEMORY[0x1F4141440]();
}

uint64_t sub_1AB233CBC()
{
  return MEMORY[0x1F4141448]();
}

uint64_t sub_1AB233CCC()
{
  return MEMORY[0x1F4141450]();
}

uint64_t sub_1AB233CDC()
{
  return MEMORY[0x1F4141458]();
}

uint64_t sub_1AB233CEC()
{
  return MEMORY[0x1F4141460]();
}

uint64_t sub_1AB233CFC()
{
  return MEMORY[0x1F4141468]();
}

uint64_t sub_1AB233D0C()
{
  return MEMORY[0x1F4141478]();
}

uint64_t sub_1AB233D1C()
{
  return MEMORY[0x1F4141490]();
}

uint64_t sub_1AB233D2C()
{
  return MEMORY[0x1F4141498]();
}

uint64_t sub_1AB233D3C()
{
  return MEMORY[0x1F41414A0]();
}

uint64_t sub_1AB233D4C()
{
  return MEMORY[0x1F41414A8]();
}

uint64_t sub_1AB233D5C()
{
  return MEMORY[0x1F41414B0]();
}

uint64_t sub_1AB233D6C()
{
  return MEMORY[0x1F41414B8]();
}

uint64_t sub_1AB233D7C()
{
  return MEMORY[0x1F41414C0]();
}

uint64_t sub_1AB233D8C()
{
  return MEMORY[0x1F41414C8]();
}

uint64_t sub_1AB233D9C()
{
  return MEMORY[0x1F41414F0]();
}

uint64_t sub_1AB233DAC()
{
  return MEMORY[0x1F41414F8]();
}

uint64_t sub_1AB233DBC()
{
  return MEMORY[0x1F4141500]();
}

uint64_t sub_1AB233DCC()
{
  return MEMORY[0x1F4141508]();
}

uint64_t sub_1AB233DFC()
{
  return MEMORY[0x1F4141520]();
}

uint64_t sub_1AB233E0C()
{
  return MEMORY[0x1F4141528]();
}

uint64_t sub_1AB233E1C()
{
  return MEMORY[0x1F4141530]();
}

uint64_t sub_1AB233E3C()
{
  return MEMORY[0x1F4141540]();
}

uint64_t sub_1AB233E4C()
{
  return MEMORY[0x1F4141548]();
}

uint64_t sub_1AB233E5C()
{
  return MEMORY[0x1F4141550]();
}

uint64_t sub_1AB233E6C()
{
  return MEMORY[0x1F4141558]();
}

uint64_t sub_1AB233E7C()
{
  return MEMORY[0x1F4141560]();
}

uint64_t sub_1AB233E8C()
{
  return MEMORY[0x1F4141568]();
}

uint64_t sub_1AB233E9C()
{
  return MEMORY[0x1F4141578]();
}

uint64_t sub_1AB233EAC()
{
  return MEMORY[0x1F41415E8]();
}

uint64_t sub_1AB233EBC()
{
  return MEMORY[0x1F41415F0]();
}

uint64_t sub_1AB233ECC()
{
  return MEMORY[0x1F41415F8]();
}

uint64_t sub_1AB233EDC()
{
  return MEMORY[0x1F4141600]();
}

uint64_t sub_1AB233EEC()
{
  return MEMORY[0x1F4141648]();
}

uint64_t sub_1AB233EFC()
{
  return MEMORY[0x1F4141658]();
}

uint64_t sub_1AB233F0C()
{
  return MEMORY[0x1F4141660]();
}

uint64_t sub_1AB233F1C()
{
  return MEMORY[0x1F4141668]();
}

uint64_t sub_1AB233F2C()
{
  return MEMORY[0x1F4141670]();
}

uint64_t sub_1AB233F3C()
{
  return MEMORY[0x1F4141678]();
}

uint64_t sub_1AB233F4C()
{
  return MEMORY[0x1F4141680]();
}

uint64_t sub_1AB233F5C()
{
  return MEMORY[0x1F4141688]();
}

uint64_t sub_1AB233F6C()
{
  return MEMORY[0x1F4141690]();
}

uint64_t sub_1AB233F7C()
{
  return MEMORY[0x1F4141698]();
}

uint64_t sub_1AB233F8C()
{
  return MEMORY[0x1F41416B8]();
}

uint64_t sub_1AB233F9C()
{
  return MEMORY[0x1F41416C0]();
}

uint64_t sub_1AB233FAC()
{
  return MEMORY[0x1F41416C8]();
}

uint64_t sub_1AB233FBC()
{
  return MEMORY[0x1F41416D0]();
}

uint64_t sub_1AB233FCC()
{
  return MEMORY[0x1F41416E8]();
}

uint64_t sub_1AB233FDC()
{
  return MEMORY[0x1F41416F0]();
}

uint64_t sub_1AB233FEC()
{
  return MEMORY[0x1F41416F8]();
}

uint64_t sub_1AB233FFC()
{
  return MEMORY[0x1F4141700]();
}

uint64_t sub_1AB23400C()
{
  return MEMORY[0x1F4141708]();
}

uint64_t sub_1AB23401C()
{
  return MEMORY[0x1F4141710]();
}

uint64_t sub_1AB23402C()
{
  return MEMORY[0x1F4141718]();
}

uint64_t sub_1AB23403C()
{
  return MEMORY[0x1F4141720]();
}

uint64_t sub_1AB23404C()
{
  return MEMORY[0x1F4141728]();
}

uint64_t sub_1AB23405C()
{
  return MEMORY[0x1F4141730]();
}

uint64_t sub_1AB23406C()
{
  return MEMORY[0x1F4141748]();
}

uint64_t sub_1AB23407C()
{
  return MEMORY[0x1F4141750]();
}

uint64_t sub_1AB23408C()
{
  return MEMORY[0x1F4141758]();
}

uint64_t sub_1AB23409C()
{
  return MEMORY[0x1F4141760]();
}

uint64_t sub_1AB2340AC()
{
  return MEMORY[0x1F4141768]();
}

uint64_t sub_1AB2340BC()
{
  return MEMORY[0x1F4141770]();
}

uint64_t sub_1AB2340CC()
{
  return MEMORY[0x1F4141778]();
}

uint64_t sub_1AB2340DC()
{
  return MEMORY[0x1F4141788]();
}

uint64_t sub_1AB2340EC()
{
  return MEMORY[0x1F4141790]();
}

uint64_t sub_1AB2340FC()
{
  return MEMORY[0x1F4141798]();
}

uint64_t sub_1AB23410C()
{
  return MEMORY[0x1F41417A0]();
}

uint64_t sub_1AB23411C()
{
  return MEMORY[0x1F41417B0]();
}

uint64_t sub_1AB23412C()
{
  return MEMORY[0x1F41417C0]();
}

uint64_t sub_1AB23414C()
{
  return MEMORY[0x1F41417E8]();
}

uint64_t sub_1AB23415C()
{
  return MEMORY[0x1F41417F0]();
}

uint64_t sub_1AB23416C()
{
  return MEMORY[0x1F41417F8]();
}

uint64_t sub_1AB23417C()
{
  return MEMORY[0x1F4141800]();
}

uint64_t sub_1AB23418C()
{
  return MEMORY[0x1F4141818]();
}

uint64_t sub_1AB23419C()
{
  return MEMORY[0x1F4141820]();
}

uint64_t sub_1AB2341AC()
{
  return MEMORY[0x1F4141828]();
}

uint64_t sub_1AB2341BC()
{
  return MEMORY[0x1F4141830]();
}

uint64_t sub_1AB2341CC()
{
  return MEMORY[0x1F4141838]();
}

uint64_t sub_1AB2341DC()
{
  return MEMORY[0x1F4141840]();
}

uint64_t sub_1AB2341EC()
{
  return MEMORY[0x1F4141848]();
}

uint64_t sub_1AB2341FC()
{
  return MEMORY[0x1F4141850]();
}

uint64_t sub_1AB23420C()
{
  return MEMORY[0x1F4141858]();
}

uint64_t sub_1AB23421C()
{
  return MEMORY[0x1F4141860]();
}

uint64_t sub_1AB23422C()
{
  return MEMORY[0x1F4141868]();
}

uint64_t sub_1AB23423C()
{
  return MEMORY[0x1F4141870]();
}

uint64_t sub_1AB23424C()
{
  return MEMORY[0x1F4141878]();
}

uint64_t sub_1AB23425C()
{
  return MEMORY[0x1F4141880]();
}

uint64_t sub_1AB23426C()
{
  return MEMORY[0x1F41418A0]();
}

uint64_t sub_1AB23428C()
{
  return MEMORY[0x1F41418B0]();
}

uint64_t sub_1AB2342AC()
{
  return MEMORY[0x1F41418D8]();
}

uint64_t sub_1AB2342BC()
{
  return MEMORY[0x1F41418E0]();
}

uint64_t sub_1AB2342CC()
{
  return MEMORY[0x1F41418E8]();
}

uint64_t sub_1AB2342DC()
{
  return MEMORY[0x1F41418F0]();
}

uint64_t sub_1AB2342EC()
{
  return MEMORY[0x1F41418F8]();
}

uint64_t sub_1AB2342FC()
{
  return MEMORY[0x1F4141900]();
}

uint64_t sub_1AB23430C()
{
  return MEMORY[0x1F4141958]();
}

uint64_t sub_1AB23431C()
{
  return MEMORY[0x1F4141960]();
}

uint64_t sub_1AB23432C()
{
  return MEMORY[0x1F4141968]();
}

uint64_t sub_1AB23433C()
{
  return MEMORY[0x1F4141978]();
}

uint64_t sub_1AB23434C()
{
  return MEMORY[0x1F41419C0]();
}

uint64_t sub_1AB23435C()
{
  return MEMORY[0x1F41419C8]();
}

uint64_t sub_1AB23436C()
{
  return MEMORY[0x1F41419D0]();
}

uint64_t sub_1AB23437C()
{
  return MEMORY[0x1F41419D8]();
}

uint64_t sub_1AB23438C()
{
  return MEMORY[0x1F41419E0]();
}

uint64_t sub_1AB23439C()
{
  return MEMORY[0x1F41419E8]();
}

uint64_t sub_1AB2343AC()
{
  return MEMORY[0x1F41419F0]();
}

uint64_t sub_1AB2343BC()
{
  return MEMORY[0x1F41419F8]();
}

uint64_t sub_1AB2343CC()
{
  return MEMORY[0x1F4141A00]();
}

uint64_t sub_1AB2343DC()
{
  return MEMORY[0x1F4141A08]();
}

uint64_t sub_1AB2343FC()
{
  return MEMORY[0x1F4141A18]();
}

uint64_t sub_1AB23440C()
{
  return MEMORY[0x1F4141A20]();
}

uint64_t sub_1AB23441C()
{
  return MEMORY[0x1F4141A30]();
}

uint64_t sub_1AB23442C()
{
  return MEMORY[0x1F4141A38]();
}

uint64_t sub_1AB23443C()
{
  return MEMORY[0x1F4141A40]();
}

uint64_t sub_1AB23444C()
{
  return MEMORY[0x1F4141A48]();
}

uint64_t sub_1AB23445C()
{
  return MEMORY[0x1F4141A90]();
}

uint64_t sub_1AB23446C()
{
  return MEMORY[0x1F4141AC0]();
}

uint64_t sub_1AB23447C()
{
  return MEMORY[0x1F4141AC8]();
}

uint64_t sub_1AB23448C()
{
  return MEMORY[0x1F4141AD0]();
}

uint64_t sub_1AB23449C()
{
  return MEMORY[0x1F4141AD8]();
}

uint64_t sub_1AB2344AC()
{
  return MEMORY[0x1F4141AE0]();
}

uint64_t sub_1AB2344BC()
{
  return MEMORY[0x1F4141AE8]();
}

uint64_t sub_1AB2344CC()
{
  return MEMORY[0x1F4141AF0]();
}

uint64_t sub_1AB2344DC()
{
  return MEMORY[0x1F4141AF8]();
}

uint64_t sub_1AB2344EC()
{
  return MEMORY[0x1F4141B40]();
}

uint64_t sub_1AB2344FC()
{
  return MEMORY[0x1F4141B48]();
}

uint64_t sub_1AB23450C()
{
  return MEMORY[0x1F4141B50]();
}

uint64_t sub_1AB23451C()
{
  return MEMORY[0x1F4141B58]();
}

uint64_t sub_1AB23452C()
{
  return MEMORY[0x1F4141B60]();
}

uint64_t sub_1AB23453C()
{
  return MEMORY[0x1F4141B68]();
}

uint64_t sub_1AB23454C()
{
  return MEMORY[0x1F4141B70]();
}

uint64_t sub_1AB23455C()
{
  return MEMORY[0x1F4141B88]();
}

uint64_t sub_1AB23456C()
{
  return MEMORY[0x1F4141B90]();
}

uint64_t sub_1AB23457C()
{
  return MEMORY[0x1F4141B98]();
}

uint64_t sub_1AB23458C()
{
  return MEMORY[0x1F4141BA0]();
}

uint64_t sub_1AB23459C()
{
  return MEMORY[0x1F4141BA8]();
}

uint64_t sub_1AB2345AC()
{
  return MEMORY[0x1F4141BC0]();
}

uint64_t sub_1AB2345BC()
{
  return MEMORY[0x1F4141BC8]();
}

uint64_t sub_1AB2345CC()
{
  return MEMORY[0x1F4141BD0]();
}

uint64_t sub_1AB2345DC()
{
  return MEMORY[0x1F4141BD8]();
}

uint64_t sub_1AB2345EC()
{
  return MEMORY[0x1F4141BE0]();
}

uint64_t sub_1AB2345FC()
{
  return MEMORY[0x1F4141BE8]();
}

void sub_1AB23460C()
{
  while (1)
    ;
}

void sub_1AB23461C()
{
  while (1)
    ;
}

void sub_1AB23462C()
{
  while (1)
    ;
}

void sub_1AB23463C()
{
  while (1)
    ;
}

void sub_1AB23464C()
{
  while (1)
    ;
}

void sub_1AB23465C()
{
  while (1)
    ;
}

void sub_1AB23466C()
{
  while (1)
    ;
}

void sub_1AB23467C()
{
  while (1)
    ;
}

void sub_1AB23468C()
{
  while (1)
    ;
}

void sub_1AB23469C()
{
  while (1)
    ;
}

void sub_1AB2346AC()
{
  while (1)
    ;
}

void sub_1AB2346BC()
{
  while (1)
    ;
}

void sub_1AB2346CC()
{
  while (1)
    ;
}

void sub_1AB2346DC()
{
  while (1)
    ;
}

uint64_t sub_1AB2346EC()
{
  return off_1F004CFB0();
}

uint64_t sub_1AB2346FC()
{
  return off_1F004CFB8();
}

void sub_1AB23470C()
{
  while (1)
    ;
}

void sub_1AB23471C()
{
  while (1)
    ;
}

void sub_1AB23472C()
{
  while (1)
    ;
}

void sub_1AB23473C()
{
  while (1)
    ;
}

void sub_1AB23474C()
{
  while (1)
    ;
}

void sub_1AB23475C()
{
  while (1)
    ;
}

void sub_1AB23476C()
{
  while (1)
    ;
}

void sub_1AB23477C()
{
  while (1)
    ;
}

void sub_1AB23478C()
{
  while (1)
    ;
}

void sub_1AB23479C()
{
  while (1)
    ;
}

void sub_1AB2347AC()
{
  while (1)
    ;
}

void sub_1AB2347BC()
{
  while (1)
    ;
}

void sub_1AB2347CC()
{
  while (1)
    ;
}

void sub_1AB2347DC()
{
  while (1)
    ;
}

void sub_1AB2347EC()
{
  while (1)
    ;
}

void sub_1AB2347FC()
{
  while (1)
    ;
}

void sub_1AB23480C()
{
  while (1)
    ;
}

void sub_1AB23481C()
{
  while (1)
    ;
}

void sub_1AB23482C()
{
  while (1)
    ;
}

void sub_1AB23483C()
{
  while (1)
    ;
}

void sub_1AB23485C()
{
  while (1)
    ;
}

void sub_1AB23486C()
{
  while (1)
    ;
}

void sub_1AB23487C()
{
  while (1)
    ;
}

void sub_1AB23488C()
{
  while (1)
    ;
}

void sub_1AB23489C()
{
  while (1)
    ;
}

void sub_1AB2348AC()
{
  while (1)
    ;
}

void sub_1AB2348BC()
{
  while (1)
    ;
}

void sub_1AB2348CC()
{
  while (1)
    ;
}

void sub_1AB2348DC()
{
  while (1)
    ;
}

void sub_1AB2348EC()
{
  while (1)
    ;
}

void sub_1AB2348FC()
{
  while (1)
    ;
}

void sub_1AB23490C()
{
  while (1)
    ;
}

void sub_1AB23491C()
{
  while (1)
    ;
}

void sub_1AB23492C()
{
  while (1)
    ;
}

void sub_1AB23493C()
{
  while (1)
    ;
}

void sub_1AB23494C()
{
  while (1)
    ;
}

void sub_1AB23495C()
{
  while (1)
    ;
}

void sub_1AB23496C()
{
  while (1)
    ;
}

void sub_1AB23497C()
{
  while (1)
    ;
}

void sub_1AB23498C()
{
  while (1)
    ;
}

void sub_1AB23499C()
{
  while (1)
    ;
}

void sub_1AB2349AC()
{
  while (1)
    ;
}

void sub_1AB2349BC()
{
  while (1)
    ;
}

void sub_1AB2349CC()
{
  while (1)
    ;
}

void sub_1AB2349DC()
{
  while (1)
    ;
}

void sub_1AB2349EC()
{
  while (1)
    ;
}

void sub_1AB2349FC()
{
  while (1)
    ;
}

void sub_1AB234A0C()
{
  while (1)
    ;
}

void sub_1AB234A1C()
{
  while (1)
    ;
}

void sub_1AB234A2C()
{
  while (1)
    ;
}

void sub_1AB234A3C()
{
  while (1)
    ;
}

void sub_1AB234A4C()
{
  while (1)
    ;
}

void sub_1AB234A5C()
{
  while (1)
    ;
}

void sub_1AB234A6C()
{
  while (1)
    ;
}

void sub_1AB234A7C()
{
  while (1)
    ;
}

void sub_1AB234A8C()
{
  while (1)
    ;
}

void sub_1AB234A9C()
{
  while (1)
    ;
}

void sub_1AB234AAC()
{
  while (1)
    ;
}

void sub_1AB234ABC()
{
  while (1)
    ;
}

void sub_1AB234ACC()
{
  while (1)
    ;
}

void sub_1AB234ADC()
{
  while (1)
    ;
}

void sub_1AB234AEC()
{
  while (1)
    ;
}

void sub_1AB234AFC()
{
  while (1)
    ;
}

void sub_1AB234B0C()
{
  while (1)
    ;
}

void sub_1AB234B1C()
{
  while (1)
    ;
}

void sub_1AB234B2C()
{
  while (1)
    ;
}

void sub_1AB234B3C()
{
  while (1)
    ;
}

void sub_1AB234B4C()
{
  while (1)
    ;
}

void sub_1AB234B5C()
{
  while (1)
    ;
}

void sub_1AB234B6C()
{
  while (1)
    ;
}

uint64_t sub_1AB234B7C()
{
  return MEMORY[0x1F4143288]();
}

void sub_1AB234B8C()
{
  while (1)
    ;
}

void sub_1AB234B9C()
{
  while (1)
    ;
}

void sub_1AB234BAC()
{
  while (1)
    ;
}

void sub_1AB234BBC()
{
  while (1)
    ;
}

void sub_1AB234BCC()
{
  while (1)
    ;
}

void sub_1AB234BDC()
{
  while (1)
    ;
}

void sub_1AB234BEC()
{
  while (1)
    ;
}

void sub_1AB234BFC()
{
  while (1)
    ;
}

void sub_1AB234C0C()
{
  while (1)
    ;
}

void sub_1AB234C1C()
{
  while (1)
    ;
}

void sub_1AB234C2C()
{
  while (1)
    ;
}

void sub_1AB234C3C()
{
  while (1)
    ;
}

void sub_1AB234C4C()
{
  while (1)
    ;
}

void sub_1AB234C5C()
{
  while (1)
    ;
}

void sub_1AB234C6C()
{
  while (1)
    ;
}

void sub_1AB234C7C()
{
  while (1)
    ;
}

void sub_1AB234C8C()
{
  while (1)
    ;
}

void sub_1AB234C9C()
{
  while (1)
    ;
}

void sub_1AB234CAC()
{
  while (1)
    ;
}

void sub_1AB234CBC()
{
  while (1)
    ;
}

void sub_1AB234CCC()
{
  while (1)
    ;
}

void sub_1AB234CDC()
{
  while (1)
    ;
}

void sub_1AB234CEC()
{
  while (1)
    ;
}

void sub_1AB234CFC()
{
  while (1)
    ;
}

void sub_1AB234D0C()
{
  while (1)
    ;
}

void sub_1AB234D1C()
{
  while (1)
    ;
}

void sub_1AB234D2C()
{
  while (1)
    ;
}

void sub_1AB234D3C()
{
  while (1)
    ;
}

void sub_1AB234D4C()
{
  while (1)
    ;
}

void sub_1AB234D5C()
{
  while (1)
    ;
}

void sub_1AB234D6C()
{
  while (1)
    ;
}

void sub_1AB234D7C()
{
  while (1)
    ;
}

void sub_1AB234D8C()
{
  while (1)
    ;
}

void sub_1AB234D9C()
{
  while (1)
    ;
}

void sub_1AB234DAC()
{
  while (1)
    ;
}

void sub_1AB234DBC()
{
  while (1)
    ;
}

void sub_1AB234DCC()
{
  while (1)
    ;
}

void sub_1AB234DDC()
{
  while (1)
    ;
}

void sub_1AB234DEC()
{
  while (1)
    ;
}

void sub_1AB234DFC()
{
  while (1)
    ;
}

void sub_1AB234E0C()
{
  while (1)
    ;
}

void sub_1AB234E1C()
{
  while (1)
    ;
}

void sub_1AB234E2C()
{
  while (1)
    ;
}

void sub_1AB234E3C()
{
  while (1)
    ;
}

void sub_1AB234E4C()
{
  while (1)
    ;
}

void sub_1AB234E5C()
{
  while (1)
    ;
}

void sub_1AB234E6C()
{
  while (1)
    ;
}

void sub_1AB234E7C()
{
  while (1)
    ;
}

void sub_1AB234E8C()
{
  while (1)
    ;
}

void sub_1AB234E9C()
{
  while (1)
    ;
}

void sub_1AB234ECC()
{
  while (1)
    ;
}

void sub_1AB234EDC()
{
  while (1)
    ;
}

void sub_1AB234EEC()
{
  while (1)
    ;
}

void sub_1AB234EFC()
{
  while (1)
    ;
}

void sub_1AB234F0C()
{
  while (1)
    ;
}

uint64_t sub_1AB234F1C()
{
  return off_1F004D3C8();
}

void sub_1AB234F2C()
{
  while (1)
    ;
}

void sub_1AB234F3C()
{
  while (1)
    ;
}

void sub_1AB234F4C()
{
  while (1)
    ;
}

void sub_1AB234F5C()
{
  while (1)
    ;
}

void sub_1AB234F6C()
{
  while (1)
    ;
}

uint64_t sub_1AB234F7C()
{
  return off_1F004D3F8();
}

void sub_1AB234F8C()
{
  while (1)
    ;
}

void sub_1AB234F9C()
{
  while (1)
    ;
}

void sub_1AB234FAC()
{
  while (1)
    ;
}

void sub_1AB234FBC()
{
  while (1)
    ;
}

void sub_1AB234FCC()
{
  while (1)
    ;
}

void sub_1AB234FDC()
{
  while (1)
    ;
}

void sub_1AB234FEC()
{
  while (1)
    ;
}

void sub_1AB234FFC()
{
  while (1)
    ;
}

void sub_1AB23500C()
{
  while (1)
    ;
}

void sub_1AB23501C()
{
  while (1)
    ;
}

void sub_1AB23502C()
{
  while (1)
    ;
}

void sub_1AB23503C()
{
  while (1)
    ;
}

void sub_1AB23504C()
{
  while (1)
    ;
}

void sub_1AB23505C()
{
  while (1)
    ;
}

void sub_1AB23506C()
{
  while (1)
    ;
}

uint64_t sub_1AB23507C()
{
  return off_1F004D478();
}

void sub_1AB23508C()
{
  while (1)
    ;
}

void sub_1AB23509C()
{
  while (1)
    ;
}

uint64_t sub_1AB2350AC()
{
  return off_1F004D490();
}

void sub_1AB2350BC()
{
  while (1)
    ;
}

void sub_1AB2350CC()
{
  while (1)
    ;
}

void sub_1AB2350DC()
{
  while (1)
    ;
}

void sub_1AB2350EC()
{
  while (1)
    ;
}

void sub_1AB2350FC()
{
  while (1)
    ;
}

void sub_1AB23510C()
{
  while (1)
    ;
}

void sub_1AB23511C()
{
  while (1)
    ;
}

void sub_1AB23512C()
{
  while (1)
    ;
}

void sub_1AB23513C()
{
  while (1)
    ;
}

void sub_1AB23514C()
{
  while (1)
    ;
}

void sub_1AB23515C()
{
  while (1)
    ;
}

void sub_1AB23516C()
{
  while (1)
    ;
}

void sub_1AB23517C()
{
  while (1)
    ;
}

void sub_1AB23518C()
{
  while (1)
    ;
}

void sub_1AB23519C()
{
  while (1)
    ;
}

void sub_1AB2351AC()
{
  while (1)
    ;
}

void sub_1AB2351BC()
{
  while (1)
    ;
}

void _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0()
{
  while (1)
    ;
}

void sub_1AB2351DC()
{
  while (1)
    ;
}

void sub_1AB2351EC()
{
  while (1)
    ;
}

void sub_1AB2351FC()
{
  while (1)
    ;
}

void sub_1AB23520C()
{
  while (1)
    ;
}

void sub_1AB23521C()
{
  while (1)
    ;
}

void sub_1AB23522C()
{
  while (1)
    ;
}

void sub_1AB23523C()
{
  while (1)
    ;
}

void sub_1AB23524C()
{
  while (1)
    ;
}

void sub_1AB23525C()
{
  while (1)
    ;
}

void sub_1AB23526C()
{
  while (1)
    ;
}

void sub_1AB23527C()
{
  while (1)
    ;
}

void sub_1AB23528C()
{
  while (1)
    ;
}

void sub_1AB23529C()
{
  while (1)
    ;
}

void sub_1AB2352AC()
{
  while (1)
    ;
}

void sub_1AB2352BC()
{
  while (1)
    ;
}

void sub_1AB2352CC()
{
  while (1)
    ;
}

void sub_1AB2352DC()
{
  while (1)
    ;
}

void sub_1AB2352EC()
{
  while (1)
    ;
}

void sub_1AB2352FC()
{
  while (1)
    ;
}

void sub_1AB23530C()
{
  while (1)
    ;
}

void sub_1AB23531C()
{
  while (1)
    ;
}

void sub_1AB23532C()
{
  while (1)
    ;
}

void sub_1AB23533C()
{
  while (1)
    ;
}

void sub_1AB23534C()
{
  while (1)
    ;
}

void sub_1AB23535C()
{
  while (1)
    ;
}

uint64_t sub_1AB23536C()
{
  return MEMORY[0x1F4112678]();
}

uint64_t sub_1AB23537C()
{
  return MEMORY[0x1F4112690]();
}

uint64_t sub_1AB23538C()
{
  return MEMORY[0x1F4112698]();
}

uint64_t sub_1AB23539C()
{
  return MEMORY[0x1F41126B0]();
}

uint64_t sub_1AB2353AC()
{
  return MEMORY[0x1F41126C0]();
}

uint64_t sub_1AB2353BC()
{
  return MEMORY[0x1F41126E8]();
}

uint64_t sub_1AB2353CC()
{
  return MEMORY[0x1F41126F0]();
}

uint64_t sub_1AB2353DC()
{
  return MEMORY[0x1F41126F8]();
}

uint64_t sub_1AB2353EC()
{
  return MEMORY[0x1F4112708]();
}

uint64_t sub_1AB2353FC()
{
  return MEMORY[0x1F4112720]();
}

uint64_t sub_1AB23540C()
{
  return MEMORY[0x1F4112728]();
}

uint64_t sub_1AB23541C()
{
  return MEMORY[0x1F4112730]();
}

uint64_t sub_1AB23542C()
{
  return MEMORY[0x1F4112828]();
}

uint64_t sub_1AB23543C()
{
  return MEMORY[0x1F4112838]();
}

uint64_t sub_1AB23544C()
{
  return MEMORY[0x1F4112848]();
}

uint64_t sub_1AB23545C()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1AB23546C()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1AB23547C()
{
  return MEMORY[0x1F40E0618]();
}

uint64_t sub_1AB23548C()
{
  return MEMORY[0x1F40F7D58]();
}

uint64_t sub_1AB23549C()
{
  return MEMORY[0x1F4141CD0]();
}

uint64_t sub_1AB2354AC()
{
  return MEMORY[0x1F4141CD8]();
}

uint64_t sub_1AB2354BC()
{
  return MEMORY[0x1F4187850]();
}

uint64_t sub_1AB2354CC()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1AB2354DC()
{
  return MEMORY[0x1F4187870]();
}

uint64_t sub_1AB2354EC()
{
  return MEMORY[0x1F4187898]();
}

uint64_t sub_1AB2354FC()
{
  return MEMORY[0x1F41878A0]();
}

uint64_t sub_1AB23550C()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1AB23551C()
{
  return MEMORY[0x1F41878E0]();
}

uint64_t sub_1AB23552C()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1AB23553C()
{
  return MEMORY[0x1F4187908]();
}

uint64_t sub_1AB23554C()
{
  return MEMORY[0x1F4187918]();
}

uint64_t sub_1AB23555C()
{
  return MEMORY[0x1F4187938]();
}

uint64_t sub_1AB23556C()
{
  return MEMORY[0x1F4187948]();
}

uint64_t sub_1AB23557C()
{
  return MEMORY[0x1F4187950]();
}

uint64_t sub_1AB23558C()
{
  return MEMORY[0x1F4187960]();
}

uint64_t sub_1AB23559C()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_1AB2355AC()
{
  return MEMORY[0x1F4187978]();
}

uint64_t sub_1AB2355BC()
{
  return MEMORY[0x1F41879A0]();
}

uint64_t sub_1AB2355CC()
{
  return MEMORY[0x1F41879A8]();
}

uint64_t sub_1AB2355DC()
{
  return MEMORY[0x1F41879C0]();
}

uint64_t sub_1AB2355EC()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1AB2355FC()
{
  return MEMORY[0x1F4187A00]();
}

uint64_t sub_1AB23560C()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1AB23561C()
{
  return MEMORY[0x1F4187A20]();
}

uint64_t sub_1AB23562C()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1AB23563C()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1AB23564C()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1AB23565C()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1AB23566C()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1AB23567C()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1AB23568C()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1AB23569C()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1AB2356AC()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1AB2356BC()
{
  return MEMORY[0x1F41885A8]();
}

uint64_t sub_1AB2356CC()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1AB2356DC()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1AB2356EC()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1AB2356FC()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1AB23570C()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1AB23571C()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1AB23572C()
{
  return MEMORY[0x1F4188668]();
}

void sub_1AB23573C()
{
  while (1)
    ;
}

uint64_t sub_1AB23574C()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AB23575C()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1AB23576C()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AB23577C()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1AB23578C()
{
  return MEMORY[0x1F4116DB8]();
}

uint64_t sub_1AB23579C()
{
  return MEMORY[0x1F4116DC0]();
}

uint64_t sub_1AB2357AC()
{
  return MEMORY[0x1F4116DC8]();
}

uint64_t sub_1AB2357BC()
{
  return MEMORY[0x1F4116DD0]();
}

uint64_t sub_1AB2357CC()
{
  return MEMORY[0x1F4116DD8]();
}

uint64_t sub_1AB2357DC()
{
  return MEMORY[0x1F4116DE0]();
}

uint64_t sub_1AB2357EC()
{
  return MEMORY[0x1F4116DE8]();
}

uint64_t sub_1AB2357FC()
{
  return MEMORY[0x1F4116DF0]();
}

uint64_t sub_1AB23580C()
{
  return MEMORY[0x1F4116DF8]();
}

uint64_t sub_1AB23581C()
{
  return MEMORY[0x1F4116E00]();
}

uint64_t sub_1AB23582C()
{
  return MEMORY[0x1F4116E08]();
}

uint64_t sub_1AB23583C()
{
  return MEMORY[0x1F41657A0]();
}

uint64_t sub_1AB23584C()
{
  return MEMORY[0x1F41657A8]();
}

uint64_t sub_1AB23585C()
{
  return MEMORY[0x1F41657B0]();
}

uint64_t sub_1AB23586C()
{
  return MEMORY[0x1F41657B8]();
}

uint64_t sub_1AB23587C()
{
  return MEMORY[0x1F41657C0]();
}

uint64_t sub_1AB23588C()
{
  return MEMORY[0x1F41657C8]();
}

uint64_t sub_1AB23589C()
{
  return MEMORY[0x1F41657D0]();
}

uint64_t sub_1AB2358AC()
{
  return MEMORY[0x1F41657D8]();
}

uint64_t sub_1AB2358BC()
{
  return MEMORY[0x1F41657E0]();
}

uint64_t sub_1AB2358CC()
{
  return MEMORY[0x1F41657E8]();
}

uint64_t sub_1AB2358DC()
{
  return MEMORY[0x1F41657F0]();
}

uint64_t sub_1AB2358EC()
{
  return MEMORY[0x1F41657F8]();
}

uint64_t sub_1AB2358FC()
{
  return MEMORY[0x1F4165800]();
}

uint64_t sub_1AB23590C()
{
  return MEMORY[0x1F4165808]();
}

uint64_t sub_1AB23591C()
{
  return MEMORY[0x1F4165810]();
}

uint64_t sub_1AB23592C()
{
  return MEMORY[0x1F4165818]();
}

uint64_t sub_1AB23593C()
{
  return MEMORY[0x1F4165820]();
}

uint64_t sub_1AB23594C()
{
  return MEMORY[0x1F4165828]();
}

uint64_t sub_1AB23595C()
{
  return MEMORY[0x1F4165830]();
}

uint64_t sub_1AB23596C()
{
  return MEMORY[0x1F4165838]();
}

uint64_t sub_1AB23597C()
{
  return MEMORY[0x1F4165840]();
}

uint64_t sub_1AB23598C()
{
  return MEMORY[0x1F4165848]();
}

uint64_t sub_1AB23599C()
{
  return MEMORY[0x1F4165850]();
}

uint64_t sub_1AB2359AC()
{
  return MEMORY[0x1F4165858]();
}

uint64_t sub_1AB2359BC()
{
  return MEMORY[0x1F4165860]();
}

uint64_t sub_1AB2359CC()
{
  return MEMORY[0x1F4165868]();
}

uint64_t sub_1AB2359DC()
{
  return MEMORY[0x1F4165870]();
}

uint64_t sub_1AB2359EC()
{
  return MEMORY[0x1F4165878]();
}

uint64_t sub_1AB2359FC()
{
  return MEMORY[0x1F4165880]();
}

uint64_t sub_1AB235A0C()
{
  return MEMORY[0x1F4165888]();
}

uint64_t sub_1AB235A1C()
{
  return MEMORY[0x1F4165890]();
}

uint64_t sub_1AB235A2C()
{
  return MEMORY[0x1F4165898]();
}

uint64_t sub_1AB235A3C()
{
  return MEMORY[0x1F41658A0]();
}

uint64_t sub_1AB235A4C()
{
  return MEMORY[0x1F4165B30]();
}

uint64_t sub_1AB235A5C()
{
  return MEMORY[0x1F4165B38]();
}

uint64_t sub_1AB235A6C()
{
  return MEMORY[0x1F4165B40]();
}

uint64_t sub_1AB235A7C()
{
  return MEMORY[0x1F4165B48]();
}

uint64_t sub_1AB235A8C()
{
  return MEMORY[0x1F4165B50]();
}

uint64_t sub_1AB235A9C()
{
  return MEMORY[0x1F4165B58]();
}

uint64_t sub_1AB235AAC()
{
  return MEMORY[0x1F4165B60]();
}

uint64_t sub_1AB235ABC()
{
  return MEMORY[0x1F4165B68]();
}

uint64_t sub_1AB235ACC()
{
  return MEMORY[0x1F4165B70]();
}

uint64_t sub_1AB235ADC()
{
  return MEMORY[0x1F4165CB0]();
}

uint64_t sub_1AB235AEC()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1AB235AFC()
{
  return MEMORY[0x1F4165D18]();
}

uint64_t sub_1AB235B0C()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1AB235B1C()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1AB235B2C()
{
  return MEMORY[0x1F4166158]();
}

uint64_t sub_1AB235B3C()
{
  return MEMORY[0x1F4166160]();
}

uint64_t sub_1AB235B4C()
{
  return MEMORY[0x1F4166428]();
}

uint64_t sub_1AB235B5C()
{
  return MEMORY[0x1F4166430]();
}

uint64_t sub_1AB235B6C()
{
  return MEMORY[0x1F4186BA0]();
}

uint64_t sub_1AB235B7C()
{
  return MEMORY[0x1F4102148]();
}

uint64_t sub_1AB235B8C()
{
  return MEMORY[0x1F4102158]();
}

uint64_t sub_1AB235B9C()
{
  return MEMORY[0x1F4102178]();
}

uint64_t sub_1AB235BAC()
{
  return MEMORY[0x1F4102188]();
}

uint64_t sub_1AB235BBC()
{
  return MEMORY[0x1F41021A0]();
}

uint64_t sub_1AB235BCC()
{
  return MEMORY[0x1F41021A8]();
}

uint64_t sub_1AB235BDC()
{
  return MEMORY[0x1F41021C0]();
}

uint64_t sub_1AB235BEC()
{
  return MEMORY[0x1F41021C8]();
}

uint64_t sub_1AB235BFC()
{
  return MEMORY[0x1F41021D0]();
}

uint64_t sub_1AB235C0C()
{
  return MEMORY[0x1F41021E8]();
}

uint64_t sub_1AB235C1C()
{
  return MEMORY[0x1F41021F0]();
}

uint64_t sub_1AB235C2C()
{
  return MEMORY[0x1F4102200]();
}

uint64_t sub_1AB235C3C()
{
  return MEMORY[0x1F4102208]();
}

uint64_t sub_1AB235C4C()
{
  return MEMORY[0x1F4102210]();
}

uint64_t sub_1AB235C5C()
{
  return MEMORY[0x1F4102218]();
}

uint64_t sub_1AB235C6C()
{
  return MEMORY[0x1F4102220]();
}

uint64_t sub_1AB235C7C()
{
  return MEMORY[0x1F4102228]();
}

uint64_t sub_1AB235C8C()
{
  return MEMORY[0x1F4102290]();
}

uint64_t sub_1AB235C9C()
{
  return MEMORY[0x1F41022A8]();
}

uint64_t sub_1AB235CAC()
{
  return MEMORY[0x1F41022C0]();
}

uint64_t sub_1AB235CBC()
{
  return MEMORY[0x1F41022D0]();
}

uint64_t sub_1AB235CCC()
{
  return MEMORY[0x1F41022E8]();
}

uint64_t sub_1AB235CDC()
{
  return MEMORY[0x1F41022F8]();
}

uint64_t sub_1AB235CEC()
{
  return MEMORY[0x1F4102308]();
}

uint64_t sub_1AB235CFC()
{
  return MEMORY[0x1F4102318]();
}

uint64_t sub_1AB235D0C()
{
  return MEMORY[0x1F4102320]();
}

uint64_t sub_1AB235D1C()
{
  return MEMORY[0x1F4102338]();
}

uint64_t sub_1AB235D2C()
{
  return MEMORY[0x1F4102348]();
}

uint64_t sub_1AB235D3C()
{
  return MEMORY[0x1F4102350]();
}

uint64_t sub_1AB235D4C()
{
  return MEMORY[0x1F4102360]();
}

uint64_t sub_1AB235D5C()
{
  return MEMORY[0x1F4102370]();
}

uint64_t sub_1AB235D6C()
{
  return MEMORY[0x1F4102378]();
}

uint64_t sub_1AB235D7C()
{
  return MEMORY[0x1F4102380]();
}

uint64_t sub_1AB235D8C()
{
  return MEMORY[0x1F4102398]();
}

uint64_t sub_1AB235D9C()
{
  return MEMORY[0x1F41023A0]();
}

uint64_t sub_1AB235DAC()
{
  return MEMORY[0x1F41023A8]();
}

uint64_t sub_1AB235DBC()
{
  return MEMORY[0x1F41023B0]();
}

uint64_t sub_1AB235DCC()
{
  return MEMORY[0x1F41023B8]();
}

uint64_t sub_1AB235DDC()
{
  return MEMORY[0x1F41023D0]();
}

uint64_t sub_1AB235DEC()
{
  return MEMORY[0x1F41023D8]();
}

uint64_t sub_1AB235DFC()
{
  return MEMORY[0x1F41023F0]();
}

uint64_t sub_1AB235E0C()
{
  return MEMORY[0x1F4102400]();
}

uint64_t sub_1AB235E1C()
{
  return MEMORY[0x1F4102408]();
}

uint64_t sub_1AB235E2C()
{
  return MEMORY[0x1F4102420]();
}

uint64_t sub_1AB235E3C()
{
  return MEMORY[0x1F4102430]();
}

uint64_t sub_1AB235E4C()
{
  return MEMORY[0x1F4102438]();
}

uint64_t sub_1AB235E5C()
{
  return MEMORY[0x1F4102448]();
}

uint64_t sub_1AB235E6C()
{
  return MEMORY[0x1F4102460]();
}

uint64_t sub_1AB235E7C()
{
  return MEMORY[0x1F4102468]();
}

uint64_t sub_1AB235E8C()
{
  return MEMORY[0x1F4102480]();
}

uint64_t sub_1AB235E9C()
{
  return MEMORY[0x1F4102490]();
}

uint64_t sub_1AB235EAC()
{
  return MEMORY[0x1F41024A0]();
}

uint64_t sub_1AB235EBC()
{
  return MEMORY[0x1F41024B0]();
}

uint64_t sub_1AB235ECC()
{
  return MEMORY[0x1F41024D0]();
}

uint64_t sub_1AB235EEC()
{
  return MEMORY[0x1F41024E8]();
}

uint64_t sub_1AB235EFC()
{
  return MEMORY[0x1F41024F0]();
}

uint64_t sub_1AB235F0C()
{
  return MEMORY[0x1F4102508]();
}

uint64_t sub_1AB235F1C()
{
  return MEMORY[0x1F4102518]();
}

uint64_t sub_1AB235F2C()
{
  return MEMORY[0x1F4102530]();
}

uint64_t sub_1AB235F3C()
{
  return MEMORY[0x1F4102568]();
}

uint64_t sub_1AB235F4C()
{
  return MEMORY[0x1F4102578]();
}

uint64_t sub_1AB235F5C()
{
  return MEMORY[0x1F4102580]();
}

uint64_t sub_1AB235F6C()
{
  return MEMORY[0x1F4102598]();
}

uint64_t sub_1AB235F7C()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t sub_1AB235F8C()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1AB235F9C()
{
  return MEMORY[0x1F40D6740]();
}

uint64_t sub_1AB235FAC()
{
  return MEMORY[0x1F40D6810]();
}

uint64_t sub_1AB235FBC()
{
  return MEMORY[0x1F40D6858]();
}

uint64_t sub_1AB235FCC()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1AB235FDC()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1AB235FEC()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1AB235FFC()
{
  return MEMORY[0x1F40D6948]();
}

uint64_t sub_1AB23600C()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1AB23601C()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1AB23602C()
{
  return MEMORY[0x1F40D6988]();
}

uint64_t sub_1AB23603C()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1AB23604C()
{
  return MEMORY[0x1F40D69A0]();
}

uint64_t sub_1AB23605C()
{
  return MEMORY[0x1F40D69A8]();
}

uint64_t sub_1AB23606C()
{
  return MEMORY[0x1F40D69D8]();
}

uint64_t sub_1AB23607C()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1AB23608C()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1AB23609C()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t sub_1AB2360AC()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1AB2360BC()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1AB2360CC()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1AB2360DC()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1AB2360EC()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1AB2360FC()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1AB23610C()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1AB23611C()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1AB23612C()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1AB23613C()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1AB23614C()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1AB23615C()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1AB23616C()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1AB23617C()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1AB23618C()
{
  return MEMORY[0x1F40D6BB0]();
}

uint64_t sub_1AB23619C()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1AB2361AC()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1AB2361BC()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1AB2361CC()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1AB2361DC()
{
  return MEMORY[0x1F40D6DB8]();
}

uint64_t sub_1AB2361EC()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1AB2361FC()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1AB23620C()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t sub_1AB23621C()
{
  return MEMORY[0x1F40D6E60]();
}

uint64_t sub_1AB23622C()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_1AB23623C()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_1AB23624C()
{
  return MEMORY[0x1F40F7DA8]();
}

uint64_t sub_1AB23625C()
{
  return MEMORY[0x1F40F7E00]();
}

uint64_t sub_1AB23626C()
{
  return MEMORY[0x1F40F7E10]();
}

uint64_t sub_1AB23627C()
{
  return MEMORY[0x1F40F7E20]();
}

uint64_t sub_1AB23628C()
{
  return MEMORY[0x1F40F7E30]();
}

uint64_t sub_1AB23629C()
{
  return MEMORY[0x1F40F7E40]();
}

uint64_t sub_1AB2362AC()
{
  return MEMORY[0x1F40F7E58]();
}

uint64_t sub_1AB2362BC()
{
  return MEMORY[0x1F40F7E60]();
}

uint64_t sub_1AB2362CC()
{
  return MEMORY[0x1F4143290]();
}

uint64_t sub_1AB2362DC()
{
  return MEMORY[0x1F4143298]();
}

uint64_t sub_1AB2362EC()
{
  return MEMORY[0x1F41432A0]();
}

uint64_t sub_1AB2362FC()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1AB23630C()
{
  return MEMORY[0x1F40F7E90]();
}

uint64_t sub_1AB23631C()
{
  return MEMORY[0x1F40F7EB8]();
}

uint64_t sub_1AB23632C()
{
  return MEMORY[0x1F40F7EC0]();
}

uint64_t sub_1AB23633C()
{
  return MEMORY[0x1F40F7EC8]();
}

uint64_t sub_1AB23634C()
{
  return MEMORY[0x1F40F7EE0]();
}

uint64_t sub_1AB23635C()
{
  return MEMORY[0x1F40F7EF0]();
}

uint64_t sub_1AB23636C()
{
  return MEMORY[0x1F41432A8]();
}

uint64_t sub_1AB23637C()
{
  return MEMORY[0x1F40F7F08]();
}

uint64_t sub_1AB23638C()
{
  return MEMORY[0x1F40F7F10]();
}

uint64_t sub_1AB23639C()
{
  return MEMORY[0x1F40F7F20]();
}

uint64_t sub_1AB2363AC()
{
  return MEMORY[0x1F40F7F28]();
}

uint64_t sub_1AB2363BC()
{
  return MEMORY[0x1F40F7F38]();
}

uint64_t sub_1AB2363CC()
{
  return MEMORY[0x1F40F7F40]();
}

uint64_t sub_1AB2363DC()
{
  return MEMORY[0x1F40F7F50]();
}

uint64_t sub_1AB2363EC()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_1AB2363FC()
{
  return MEMORY[0x1F40F7FA0]();
}

uint64_t sub_1AB23640C()
{
  return MEMORY[0x1F40F7FA8]();
}

uint64_t sub_1AB23641C()
{
  return MEMORY[0x1F40F7FB0]();
}

uint64_t sub_1AB23642C()
{
  return MEMORY[0x1F40F7FB8]();
}

uint64_t sub_1AB23643C()
{
  return MEMORY[0x1F40F7FD0]();
}

uint64_t sub_1AB23644C()
{
  return MEMORY[0x1F40F7FD8]();
}

uint64_t sub_1AB23645C()
{
  return MEMORY[0x1F40F8000]();
}

uint64_t sub_1AB23646C()
{
  return MEMORY[0x1F40F8018]();
}

uint64_t sub_1AB23647C()
{
  return MEMORY[0x1F41432B0]();
}

uint64_t sub_1AB23648C()
{
  return MEMORY[0x1F41432B8]();
}

uint64_t sub_1AB23649C()
{
  return MEMORY[0x1F41432C0]();
}

uint64_t sub_1AB2364AC()
{
  return MEMORY[0x1F41432C8]();
}

uint64_t sub_1AB2364BC()
{
  return MEMORY[0x1F41432D0]();
}

uint64_t sub_1AB2364CC()
{
  return MEMORY[0x1F41432D8]();
}

uint64_t sub_1AB2364DC()
{
  return MEMORY[0x1F41432E0]();
}

uint64_t sub_1AB2364EC()
{
  return MEMORY[0x1F41432E8]();
}

uint64_t sub_1AB2364FC()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1AB23650C()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1AB23651C()
{
  return MEMORY[0x1F40F8068]();
}

uint64_t sub_1AB23652C()
{
  return MEMORY[0x1F40F8070]();
}

uint64_t sub_1AB23653C()
{
  return MEMORY[0x1F40F8078]();
}

uint64_t sub_1AB23654C()
{
  return MEMORY[0x1F40F8088]();
}

uint64_t sub_1AB23655C()
{
  return MEMORY[0x1F40F8090]();
}

uint64_t sub_1AB23656C()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1AB23657C()
{
  return MEMORY[0x1F40F80B0]();
}

uint64_t sub_1AB23658C()
{
  return MEMORY[0x1F40F80B8]();
}

uint64_t sub_1AB23659C()
{
  return MEMORY[0x1F40F80D8]();
}

uint64_t sub_1AB2365AC()
{
  return MEMORY[0x1F40F80E8]();
}

uint64_t sub_1AB2365BC()
{
  return MEMORY[0x1F40F80F0]();
}

uint64_t sub_1AB2365CC()
{
  return MEMORY[0x1F40F8108]();
}

uint64_t sub_1AB2365DC()
{
  return MEMORY[0x1F40F8110]();
}

uint64_t sub_1AB2365EC()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1AB2365FC()
{
  return MEMORY[0x1F40F8128]();
}

uint64_t sub_1AB23660C()
{
  return MEMORY[0x1F40F8138]();
}

uint64_t sub_1AB23661C()
{
  return MEMORY[0x1F41432F0]();
}

uint64_t sub_1AB23662C()
{
  return MEMORY[0x1F40F8148]();
}

uint64_t sub_1AB23663C()
{
  return MEMORY[0x1F40F8150]();
}

uint64_t sub_1AB23664C()
{
  return MEMORY[0x1F40F8178]();
}

uint64_t sub_1AB23665C()
{
  return MEMORY[0x1F40F8180]();
}

uint64_t sub_1AB23666C()
{
  return MEMORY[0x1F40F8198]();
}

uint64_t sub_1AB23667C()
{
  return MEMORY[0x1F40F81A0]();
}

uint64_t sub_1AB23668C()
{
  return MEMORY[0x1F40F81B0]();
}

uint64_t sub_1AB23669C()
{
  return MEMORY[0x1F40F81B8]();
}

uint64_t sub_1AB2366AC()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_1AB2366BC()
{
  return MEMORY[0x1F40F81F0]();
}

uint64_t sub_1AB2366CC()
{
  return MEMORY[0x1F40F8200]();
}

uint64_t sub_1AB2366DC()
{
  return MEMORY[0x1F40F8228]();
}

uint64_t sub_1AB2366EC()
{
  return MEMORY[0x1F40F8230]();
}

uint64_t sub_1AB2366FC()
{
  return MEMORY[0x1F40F8238]();
}

uint64_t sub_1AB23670C()
{
  return MEMORY[0x1F40F8240]();
}

uint64_t sub_1AB23671C()
{
  return MEMORY[0x1F40F8278]();
}

uint64_t sub_1AB23672C()
{
  return MEMORY[0x1F40F8288]();
}

uint64_t sub_1AB23673C()
{
  return MEMORY[0x1F40F8290]();
}

uint64_t sub_1AB23674C()
{
  return MEMORY[0x1F40F8298]();
}

uint64_t sub_1AB23675C()
{
  return MEMORY[0x1F40F82A0]();
}

uint64_t sub_1AB23676C()
{
  return MEMORY[0x1F40F82A8]();
}

uint64_t sub_1AB23677C()
{
  return MEMORY[0x1F40F82B8]();
}

uint64_t sub_1AB23678C()
{
  return MEMORY[0x1F40F82C8]();
}

uint64_t sub_1AB23679C()
{
  return MEMORY[0x1F40F82D8]();
}

uint64_t sub_1AB2367AC()
{
  return MEMORY[0x1F40F82F8]();
}

uint64_t sub_1AB2367BC()
{
  return MEMORY[0x1F40F8300]();
}

uint64_t sub_1AB2367CC()
{
  return MEMORY[0x1F40F8308]();
}

uint64_t sub_1AB2367DC()
{
  return MEMORY[0x1F40F8310]();
}

uint64_t sub_1AB2367EC()
{
  return MEMORY[0x1F40F8318]();
}

uint64_t sub_1AB23681C()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1AB23682C()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1AB23683C()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1AB23684C()
{
  return MEMORY[0x1F40F8390]();
}

uint64_t sub_1AB23685C()
{
  return MEMORY[0x1F40F83C8]();
}

uint64_t sub_1AB23686C()
{
  return MEMORY[0x1F40F83D0]();
}

uint64_t sub_1AB23687C()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1AB23688C()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1AB23689C()
{
  return MEMORY[0x1F40F8400]();
}

uint64_t sub_1AB2368AC()
{
  return MEMORY[0x1F40F8420]();
}

uint64_t sub_1AB2368BC()
{
  return MEMORY[0x1F40F8430]();
}

uint64_t sub_1AB2368CC()
{
  return MEMORY[0x1F40F8438]();
}

uint64_t sub_1AB2368DC()
{
  return MEMORY[0x1F40F8450]();
}

uint64_t sub_1AB2368EC()
{
  return MEMORY[0x1F40F8460]();
}

uint64_t sub_1AB2368FC()
{
  return MEMORY[0x1F40F8470]();
}

uint64_t sub_1AB23690C()
{
  return MEMORY[0x1F40F8488]();
}

uint64_t sub_1AB23691C()
{
  return MEMORY[0x1F40F8490]();
}

uint64_t sub_1AB23692C()
{
  return MEMORY[0x1F40F84A0]();
}

uint64_t sub_1AB23693C()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1AB23694C()
{
  return MEMORY[0x1F40F84C8]();
}

uint64_t sub_1AB23695C()
{
  return MEMORY[0x1F40F84E8]();
}

uint64_t sub_1AB23696C()
{
  return MEMORY[0x1F40F8588]();
}

uint64_t sub_1AB23698C()
{
  return MEMORY[0x1F40F85A8]();
}

uint64_t sub_1AB23699C()
{
  return MEMORY[0x1F40F85B8]();
}

uint64_t sub_1AB2369AC()
{
  return MEMORY[0x1F40F85C8]();
}

uint64_t sub_1AB2369BC()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_1AB2369CC()
{
  return MEMORY[0x1F40F8610]();
}

uint64_t sub_1AB2369DC()
{
  return MEMORY[0x1F40F8618]();
}

uint64_t sub_1AB2369EC()
{
  return MEMORY[0x1F40F8628]();
}

uint64_t sub_1AB2369FC()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1AB236A0C()
{
  return MEMORY[0x1F40F8640]();
}

uint64_t sub_1AB236A1C()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1AB236A2C()
{
  return MEMORY[0x1F40F8658]();
}

uint64_t sub_1AB236A4C()
{
  return MEMORY[0x1F40F86E0]();
}

uint64_t sub_1AB236A5C()
{
  return MEMORY[0x1F40F86E8]();
}

uint64_t sub_1AB236A6C()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_1AB236A7C()
{
  return MEMORY[0x1F40F8758]();
}

uint64_t sub_1AB236A8C()
{
  return MEMORY[0x1F40F8760]();
}

uint64_t sub_1AB236A9C()
{
  return MEMORY[0x1F40F8770]();
}

uint64_t sub_1AB236AAC()
{
  return MEMORY[0x1F40F87A8]();
}

uint64_t sub_1AB236ABC()
{
  return MEMORY[0x1F40F87D0]();
}

uint64_t sub_1AB236ACC()
{
  return MEMORY[0x1F40F87E0]();
}

uint64_t sub_1AB236ADC()
{
  return MEMORY[0x1F40F87E8]();
}

uint64_t sub_1AB236AEC()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1AB236AFC()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1AB236B0C()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1AB236B1C()
{
  return MEMORY[0x1F40F8820]();
}

uint64_t sub_1AB236B2C()
{
  return MEMORY[0x1F40F8838]();
}

uint64_t sub_1AB236B3C()
{
  return MEMORY[0x1F40F8840]();
}

uint64_t sub_1AB236B4C()
{
  return MEMORY[0x1F40F8860]();
}

uint64_t sub_1AB236B5C()
{
  return MEMORY[0x1F40F8868]();
}

uint64_t sub_1AB236B6C()
{
  return MEMORY[0x1F40F8870]();
}

uint64_t sub_1AB236B7C()
{
  return MEMORY[0x1F40F8878]();
}

uint64_t sub_1AB236B8C()
{
  return MEMORY[0x1F40F8888]();
}

uint64_t sub_1AB236B9C()
{
  return MEMORY[0x1F40F88A0]();
}

uint64_t sub_1AB236BAC()
{
  return MEMORY[0x1F40F88C0]();
}

uint64_t sub_1AB236BBC()
{
  return MEMORY[0x1F40F88D0]();
}

uint64_t sub_1AB236BCC()
{
  return MEMORY[0x1F40F88D8]();
}

uint64_t sub_1AB236BDC()
{
  return MEMORY[0x1F40F88E0]();
}

uint64_t sub_1AB236BEC()
{
  return MEMORY[0x1F40F88E8]();
}

uint64_t sub_1AB236BFC()
{
  return MEMORY[0x1F40F88F0]();
}

uint64_t sub_1AB236C0C()
{
  return MEMORY[0x1F40F88F8]();
}

uint64_t sub_1AB236C2C()
{
  return MEMORY[0x1F40F8930]();
}

uint64_t sub_1AB236C3C()
{
  return MEMORY[0x1F40F8960]();
}

uint64_t sub_1AB236C4C()
{
  return MEMORY[0x1F40F8970]();
}

uint64_t sub_1AB236C5C()
{
  return MEMORY[0x1F40F8990]();
}

uint64_t sub_1AB236C6C()
{
  return MEMORY[0x1F40F89B0]();
}

uint64_t sub_1AB236C7C()
{
  return MEMORY[0x1F40F89C0]();
}

uint64_t sub_1AB236C8C()
{
  return MEMORY[0x1F40F89C8]();
}

uint64_t sub_1AB236CAC()
{
  return MEMORY[0x1F40F89F0]();
}

uint64_t sub_1AB236CBC()
{
  return MEMORY[0x1F40F89F8]();
}

uint64_t sub_1AB236CCC()
{
  return MEMORY[0x1F40F8A08]();
}

uint64_t sub_1AB236CDC()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1AB236CEC()
{
  return MEMORY[0x1F40F8A68]();
}

uint64_t sub_1AB236CFC()
{
  return MEMORY[0x1F40F8A70]();
}

uint64_t sub_1AB236D0C()
{
  return MEMORY[0x1F40F8A88]();
}

uint64_t sub_1AB236D1C()
{
  return MEMORY[0x1F40F8AA0]();
}

uint64_t sub_1AB236D2C()
{
  return MEMORY[0x1F40F8AC0]();
}

uint64_t sub_1AB236D3C()
{
  return MEMORY[0x1F40F8AE0]();
}

uint64_t sub_1AB236D4C()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1AB236D5C()
{
  return MEMORY[0x1F40F8B08]();
}

uint64_t sub_1AB236D6C()
{
  return MEMORY[0x1F40F8B10]();
}

uint64_t sub_1AB236D7C()
{
  return MEMORY[0x1F40F8B20]();
}

uint64_t sub_1AB236D8C()
{
  return MEMORY[0x1F40F8B30]();
}

uint64_t sub_1AB236D9C()
{
  return MEMORY[0x1F40F8B38]();
}

uint64_t sub_1AB236DAC()
{
  return MEMORY[0x1F40F8B40]();
}

uint64_t sub_1AB236DBC()
{
  return MEMORY[0x1F40F8B48]();
}

uint64_t sub_1AB236DCC()
{
  return MEMORY[0x1F40F8B58]();
}

uint64_t sub_1AB236DDC()
{
  return MEMORY[0x1F40F8B68]();
}

uint64_t sub_1AB236DEC()
{
  return MEMORY[0x1F40F8B90]();
}

uint64_t sub_1AB236DFC()
{
  return MEMORY[0x1F40F8BB8]();
}

uint64_t sub_1AB236E0C()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1AB236E1C()
{
  return MEMORY[0x1F40F8C18]();
}

uint64_t sub_1AB236E2C()
{
  return MEMORY[0x1F40F8C28]();
}

uint64_t sub_1AB236E3C()
{
  return MEMORY[0x1F40F8C30]();
}

uint64_t sub_1AB236E4C()
{
  return MEMORY[0x1F40F8C38]();
}

uint64_t sub_1AB236E7C()
{
  return MEMORY[0x1F40F8C58]();
}

uint64_t sub_1AB236E8C()
{
  return MEMORY[0x1F40F8C60]();
}

uint64_t sub_1AB236E9C()
{
  return MEMORY[0x1F40F8C70]();
}

uint64_t sub_1AB236EAC()
{
  return MEMORY[0x1F40F8C78]();
}

uint64_t sub_1AB236EBC()
{
  return MEMORY[0x1F40F8C80]();
}

uint64_t sub_1AB236ECC()
{
  return MEMORY[0x1F40F8C88]();
}

uint64_t sub_1AB236EDC()
{
  return MEMORY[0x1F40F8C90]();
}

uint64_t sub_1AB236EEC()
{
  return MEMORY[0x1F40F8C98]();
}

uint64_t sub_1AB236EFC()
{
  return MEMORY[0x1F40F8CB0]();
}

uint64_t sub_1AB236F0C()
{
  return MEMORY[0x1F40F8CE8]();
}

uint64_t sub_1AB236F1C()
{
  return MEMORY[0x1F40F8CF0]();
}

uint64_t sub_1AB236F2C()
{
  return MEMORY[0x1F40F8DB8]();
}

uint64_t sub_1AB236F3C()
{
  return MEMORY[0x1F40F8DC8]();
}

uint64_t sub_1AB236F4C()
{
  return MEMORY[0x1F40F8DD0]();
}

uint64_t sub_1AB236F5C()
{
  return MEMORY[0x1F40F8DD8]();
}

uint64_t sub_1AB236F6C()
{
  return MEMORY[0x1F40F8DE0]();
}

uint64_t sub_1AB236F7C()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1AB236F8C()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1AB236F9C()
{
  return MEMORY[0x1F40F8DF8]();
}

uint64_t sub_1AB236FAC()
{
  return MEMORY[0x1F40F8E08]();
}

uint64_t sub_1AB236FBC()
{
  return MEMORY[0x1F40F8E38]();
}

uint64_t sub_1AB236FCC()
{
  return MEMORY[0x1F40F8E70]();
}

uint64_t sub_1AB236FDC()
{
  return MEMORY[0x1F40F8E90]();
}

uint64_t sub_1AB236FEC()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1AB236FFC()
{
  return MEMORY[0x1F40F8EC0]();
}

uint64_t sub_1AB23700C()
{
  return MEMORY[0x1F40F8EC8]();
}

uint64_t sub_1AB23701C()
{
  return MEMORY[0x1F40F8ED0]();
}

uint64_t sub_1AB23702C()
{
  return MEMORY[0x1F40F8ED8]();
}

uint64_t sub_1AB23703C()
{
  return MEMORY[0x1F40F8EE0]();
}

uint64_t sub_1AB23704C()
{
  return MEMORY[0x1F40F8EE8]();
}

uint64_t sub_1AB23705C()
{
  return MEMORY[0x1F40F8EF0]();
}

uint64_t sub_1AB23706C()
{
  return MEMORY[0x1F40F8EF8]();
}

uint64_t sub_1AB23707C()
{
  return MEMORY[0x1F40F8F00]();
}

uint64_t sub_1AB23708C()
{
  return MEMORY[0x1F40F8F08]();
}

uint64_t sub_1AB23709C()
{
  return MEMORY[0x1F40F8F40]();
}

uint64_t sub_1AB2370AC()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1AB2370BC()
{
  return MEMORY[0x1F40F8F68]();
}

uint64_t sub_1AB2370CC()
{
  return MEMORY[0x1F40F8F88]();
}

uint64_t sub_1AB2370DC()
{
  return MEMORY[0x1F40F8F98]();
}

uint64_t sub_1AB2370EC()
{
  return MEMORY[0x1F40F8FB0]();
}

uint64_t sub_1AB2370FC()
{
  return MEMORY[0x1F40F8FB8]();
}

uint64_t sub_1AB23710C()
{
  return MEMORY[0x1F40F8FD0]();
}

uint64_t sub_1AB23711C()
{
  return MEMORY[0x1F40F8FD8]();
}

uint64_t sub_1AB23712C()
{
  return MEMORY[0x1F40F9020]();
}

uint64_t sub_1AB23713C()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_1AB23714C()
{
  return MEMORY[0x1F40F90B0]();
}

uint64_t sub_1AB23715C()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_1AB23716C()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_1AB23717C()
{
  return MEMORY[0x1F4143300]();
}

uint64_t sub_1AB23718C()
{
  return MEMORY[0x1F4143308]();
}

uint64_t sub_1AB23719C()
{
  return MEMORY[0x1F4143320]();
}

uint64_t sub_1AB2371AC()
{
  return MEMORY[0x1F4143328]();
}

uint64_t sub_1AB2371BC()
{
  return MEMORY[0x1F4143330]();
}

uint64_t sub_1AB2371CC()
{
  return MEMORY[0x1F4143338]();
}

uint64_t sub_1AB2371DC()
{
  return MEMORY[0x1F4143340]();
}

uint64_t sub_1AB2371EC()
{
  return MEMORY[0x1F4143348]();
}

uint64_t sub_1AB2371FC()
{
  return MEMORY[0x1F4143350]();
}

uint64_t sub_1AB23720C()
{
  return MEMORY[0x1F4143358]();
}

uint64_t sub_1AB23721C()
{
  return MEMORY[0x1F4143360]();
}

uint64_t sub_1AB23722C()
{
  return MEMORY[0x1F4143368]();
}

uint64_t sub_1AB23723C()
{
  return MEMORY[0x1F4143370]();
}

uint64_t sub_1AB23724C()
{
  return MEMORY[0x1F4143378]();
}

uint64_t sub_1AB23725C()
{
  return MEMORY[0x1F4143380]();
}

uint64_t sub_1AB23726C()
{
  return MEMORY[0x1F4143388]();
}

uint64_t sub_1AB23727C()
{
  return MEMORY[0x1F4143390]();
}

uint64_t sub_1AB23728C()
{
  return MEMORY[0x1F4143398]();
}

uint64_t sub_1AB23729C()
{
  return MEMORY[0x1F41433A0]();
}

uint64_t sub_1AB2372AC()
{
  return MEMORY[0x1F41433A8]();
}

uint64_t sub_1AB2372BC()
{
  return MEMORY[0x1F41433B0]();
}

uint64_t sub_1AB2372CC()
{
  return MEMORY[0x1F41433B8]();
}

uint64_t sub_1AB2372DC()
{
  return MEMORY[0x1F41433C0]();
}

uint64_t sub_1AB2372EC()
{
  return MEMORY[0x1F41433C8]();
}

uint64_t sub_1AB2372FC()
{
  return MEMORY[0x1F41433D0]();
}

uint64_t sub_1AB23730C()
{
  return MEMORY[0x1F41433D8]();
}

uint64_t sub_1AB23731C()
{
  return MEMORY[0x1F41433E0]();
}

uint64_t sub_1AB23732C()
{
  return MEMORY[0x1F41433E8]();
}

uint64_t sub_1AB23733C()
{
  return MEMORY[0x1F41433F0]();
}

uint64_t sub_1AB23734C()
{
  return MEMORY[0x1F41433F8]();
}

uint64_t sub_1AB23735C()
{
  return MEMORY[0x1F4143400]();
}

uint64_t sub_1AB23736C()
{
  return MEMORY[0x1F4143408]();
}

uint64_t sub_1AB23737C()
{
  return MEMORY[0x1F4143428]();
}

uint64_t sub_1AB23738C()
{
  return MEMORY[0x1F4143430]();
}

uint64_t sub_1AB23739C()
{
  return MEMORY[0x1F4143438]();
}

uint64_t sub_1AB2373AC()
{
  return MEMORY[0x1F4143440]();
}

uint64_t sub_1AB2373BC()
{
  return MEMORY[0x1F4143448]();
}

uint64_t sub_1AB2373CC()
{
  return MEMORY[0x1F4143450]();
}

uint64_t sub_1AB2373DC()
{
  return MEMORY[0x1F4143458]();
}

uint64_t sub_1AB2373EC()
{
  return MEMORY[0x1F4143460]();
}

uint64_t sub_1AB2373FC()
{
  return MEMORY[0x1F4143468]();
}

uint64_t sub_1AB23740C()
{
  return MEMORY[0x1F4143470]();
}

uint64_t sub_1AB23741C()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1AB23742C()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1AB23743C()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_1AB23744C()
{
  return MEMORY[0x1F40F9160]();
}

uint64_t sub_1AB23745C()
{
  return MEMORY[0x1F40F9188]();
}

uint64_t sub_1AB23746C()
{
  return MEMORY[0x1F40F91A0]();
}

uint64_t sub_1AB23747C()
{
  return MEMORY[0x1F40F91B8]();
}

uint64_t sub_1AB23748C()
{
  return MEMORY[0x1F40F91E0]();
}

uint64_t sub_1AB23749C()
{
  return MEMORY[0x1F40F91F8]();
}

uint64_t sub_1AB2374AC()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1AB2374BC()
{
  return MEMORY[0x1F40F9230]();
}

uint64_t sub_1AB2374CC()
{
  return MEMORY[0x1F40F9238]();
}

uint64_t sub_1AB2374DC()
{
  return MEMORY[0x1F40F9248]();
}

uint64_t sub_1AB2374EC()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1AB2374FC()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1AB23750C()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1AB23751C()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1AB23752C()
{
  return MEMORY[0x1F40F92F0]();
}

uint64_t sub_1AB23753C()
{
  return MEMORY[0x1F40F9308]();
}

uint64_t sub_1AB23754C()
{
  return MEMORY[0x1F40F9360]();
}

uint64_t sub_1AB23755C()
{
  return MEMORY[0x1F40F9370]();
}

uint64_t sub_1AB23756C()
{
  return MEMORY[0x1F40F9378]();
}

uint64_t sub_1AB23757C()
{
  return MEMORY[0x1F40F9380]();
}

uint64_t sub_1AB23758C()
{
  return MEMORY[0x1F40F93A8]();
}

uint64_t sub_1AB23759C()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_1AB2375AC()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_1AB2375BC()
{
  return MEMORY[0x1F40F93E8]();
}

uint64_t sub_1AB2375CC()
{
  return MEMORY[0x1F40F9420]();
}

uint64_t sub_1AB2375DC()
{
  return MEMORY[0x1F40F9428]();
}

uint64_t sub_1AB2375EC()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1AB2375FC()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1AB23760C()
{
  return MEMORY[0x1F40F94C8]();
}

uint64_t sub_1AB23761C()
{
  return MEMORY[0x1F40F9500]();
}

uint64_t sub_1AB23762C()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1AB23763C()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1AB23764C()
{
  return MEMORY[0x1F40F9570]();
}

uint64_t sub_1AB23765C()
{
  return MEMORY[0x1F40F9588]();
}

uint64_t sub_1AB23766C()
{
  return MEMORY[0x1F40F95B8]();
}

uint64_t sub_1AB23767C()
{
  return MEMORY[0x1F40F95C0]();
}

uint64_t sub_1AB23768C()
{
  return MEMORY[0x1F40F95C8]();
}

uint64_t sub_1AB23769C()
{
  return MEMORY[0x1F40F95F8]();
}

uint64_t sub_1AB2376AC()
{
  return MEMORY[0x1F40F9618]();
}

uint64_t sub_1AB2376BC()
{
  return MEMORY[0x1F40F9628]();
}

uint64_t sub_1AB2376CC()
{
  return MEMORY[0x1F40F9630]();
}

uint64_t sub_1AB2376DC()
{
  return MEMORY[0x1F40F9638]();
}

uint64_t sub_1AB2376EC()
{
  return MEMORY[0x1F40F9648]();
}

uint64_t sub_1AB2376FC()
{
  return MEMORY[0x1F40F9658]();
}

uint64_t sub_1AB23770C()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1AB23771C()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1AB23772C()
{
  return MEMORY[0x1F40F9688]();
}

uint64_t sub_1AB23773C()
{
  return MEMORY[0x1F40F9690]();
}

uint64_t sub_1AB23774C()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1AB23775C()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1AB23776C()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_1AB23777C()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_1AB23778C()
{
  return MEMORY[0x1F40F9718]();
}

uint64_t sub_1AB23779C()
{
  return MEMORY[0x1F40F9720]();
}

uint64_t sub_1AB2377AC()
{
  return MEMORY[0x1F40F97D8]();
}

uint64_t sub_1AB2377BC()
{
  return MEMORY[0x1F40F97E0]();
}

uint64_t sub_1AB2377CC()
{
  return MEMORY[0x1F40F97F0]();
}

uint64_t sub_1AB2377DC()
{
  return MEMORY[0x1F4143478]();
}

uint64_t sub_1AB2377EC()
{
  return MEMORY[0x1F40F9878]();
}

uint64_t sub_1AB2377FC()
{
  return MEMORY[0x1F40F9888]();
}

uint64_t sub_1AB23780C()
{
  return MEMORY[0x1F40F9890]();
}

uint64_t sub_1AB23781C()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1AB23782C()
{
  return MEMORY[0x1F40F98B8]();
}

uint64_t sub_1AB23783C()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1AB23784C()
{
  return MEMORY[0x1F40F99A0]();
}

uint64_t sub_1AB23787C()
{
  return MEMORY[0x1F40F99C8]();
}

uint64_t sub_1AB23788C()
{
  return MEMORY[0x1F40F9A38]();
}

uint64_t sub_1AB23789C()
{
  return MEMORY[0x1F40F9A50]();
}

uint64_t sub_1AB2378AC()
{
  return MEMORY[0x1F40F9A60]();
}

uint64_t sub_1AB2378BC()
{
  return MEMORY[0x1F40F9A80]();
}

uint64_t sub_1AB2378CC()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1AB2378DC()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1AB2378EC()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1AB2378FC()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1AB23790C()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1AB23791C()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1AB23792C()
{
  return MEMORY[0x1F40F9AF0]();
}

uint64_t sub_1AB23793C()
{
  return MEMORY[0x1F40F9AF8]();
}

uint64_t sub_1AB23794C()
{
  return MEMORY[0x1F40F9B00]();
}

uint64_t sub_1AB23795C()
{
  return MEMORY[0x1F40F9B08]();
}

uint64_t sub_1AB23796C()
{
  return MEMORY[0x1F40F9B20]();
}

uint64_t sub_1AB23797C()
{
  return MEMORY[0x1F40F9B30]();
}

uint64_t sub_1AB23798C()
{
  return MEMORY[0x1F40F9B40]();
}

uint64_t sub_1AB23799C()
{
  return MEMORY[0x1F40F9B48]();
}

uint64_t sub_1AB2379AC()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1AB2379BC()
{
  return MEMORY[0x1F40F9B78]();
}

uint64_t sub_1AB2379CC()
{
  return MEMORY[0x1F40F9B88]();
}

uint64_t sub_1AB2379DC()
{
  return MEMORY[0x1F40F9BB8]();
}

uint64_t sub_1AB2379EC()
{
  return MEMORY[0x1F40F9C18]();
}

uint64_t sub_1AB2379FC()
{
  return MEMORY[0x1F40F9C30]();
}

uint64_t sub_1AB237A0C()
{
  return MEMORY[0x1F40F9C38]();
}

uint64_t sub_1AB237A1C()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1AB237A2C()
{
  return MEMORY[0x1F40F9C60]();
}

uint64_t sub_1AB237A3C()
{
  return MEMORY[0x1F40F9C68]();
}

uint64_t sub_1AB237A4C()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1AB237A5C()
{
  return MEMORY[0x1F40F9CB8]();
}

uint64_t sub_1AB237A6C()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1AB237A7C()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1AB237A8C()
{
  return MEMORY[0x1F40F9CF0]();
}

uint64_t sub_1AB237A9C()
{
  return MEMORY[0x1F40F9D00]();
}

uint64_t sub_1AB237AAC()
{
  return MEMORY[0x1F40F9D70]();
}

uint64_t sub_1AB237ABC()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1AB237ACC()
{
  return MEMORY[0x1F40F9DC8]();
}

uint64_t sub_1AB237ADC()
{
  return MEMORY[0x1F40F9DD0]();
}

uint64_t sub_1AB237AEC()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_1AB237AFC()
{
  return MEMORY[0x1F40F9DE8]();
}

uint64_t sub_1AB237B0C()
{
  return MEMORY[0x1F40F9E08]();
}

uint64_t sub_1AB237B1C()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1AB237B2C()
{
  return MEMORY[0x1F40F9E20]();
}

uint64_t sub_1AB237B3C()
{
  return MEMORY[0x1F40F9E30]();
}

uint64_t sub_1AB237B4C()
{
  return MEMORY[0x1F40F9E40]();
}

uint64_t sub_1AB237B5C()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1AB237B6C()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1AB237B7C()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1AB237B9C()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1AB237BAC()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1AB237BBC()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1AB237BCC()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1AB237BDC()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1AB237BEC()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1AB237C0C()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1AB237C1C()
{
  return MEMORY[0x1F40F9F88]();
}

uint64_t sub_1AB237C2C()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1AB237C3C()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1AB237C4C()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1AB237C5C()
{
  return MEMORY[0x1F40FA028]();
}

uint64_t sub_1AB237C6C()
{
  return MEMORY[0x1F40FA038]();
}

uint64_t sub_1AB237C7C()
{
  return MEMORY[0x1F40FA040]();
}

uint64_t sub_1AB237C8C()
{
  return MEMORY[0x1F40FA050]();
}

uint64_t sub_1AB237C9C()
{
  return MEMORY[0x1F40FA080]();
}

uint64_t sub_1AB237CAC()
{
  return MEMORY[0x1F40FA098]();
}

uint64_t sub_1AB237CBC()
{
  return MEMORY[0x1F40FA0B0]();
}

uint64_t sub_1AB237CCC()
{
  return MEMORY[0x1F40FA0C0]();
}

uint64_t sub_1AB237CDC()
{
  return MEMORY[0x1F40FA0F8]();
}

uint64_t sub_1AB237CEC()
{
  return MEMORY[0x1F40FA100]();
}

uint64_t sub_1AB237CFC()
{
  return MEMORY[0x1F40FA108]();
}

uint64_t sub_1AB237D0C()
{
  return MEMORY[0x1F40FA110]();
}

uint64_t sub_1AB237D1C()
{
  return MEMORY[0x1F40FA118]();
}

uint64_t sub_1AB237D2C()
{
  return MEMORY[0x1F40FA120]();
}

uint64_t sub_1AB237D3C()
{
  return MEMORY[0x1F40FA140]();
}

uint64_t sub_1AB237D4C()
{
  return MEMORY[0x1F40FA150]();
}

uint64_t sub_1AB237D5C()
{
  return MEMORY[0x1F40FA158]();
}

uint64_t sub_1AB237D6C()
{
  return MEMORY[0x1F40FA180]();
}

uint64_t sub_1AB237D7C()
{
  return MEMORY[0x1F40FA190]();
}

uint64_t sub_1AB237D8C()
{
  return MEMORY[0x1F40FA198]();
}

uint64_t sub_1AB237D9C()
{
  return MEMORY[0x1F40FA1A8]();
}

uint64_t sub_1AB237DAC()
{
  return MEMORY[0x1F40FA1E8]();
}

uint64_t sub_1AB237DBC()
{
  return MEMORY[0x1F40FA220]();
}

uint64_t sub_1AB237DCC()
{
  return MEMORY[0x1F40FA230]();
}

uint64_t sub_1AB237DDC()
{
  return MEMORY[0x1F40FA278]();
}

uint64_t sub_1AB237DEC()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1AB237DFC()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1AB237E0C()
{
  return MEMORY[0x1F40FA2A8]();
}

uint64_t sub_1AB237E1C()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_1AB237E2C()
{
  return MEMORY[0x1F40FA2D8]();
}

uint64_t sub_1AB237E3C()
{
  return MEMORY[0x1F40FA2E0]();
}

uint64_t sub_1AB237E4C()
{
  return MEMORY[0x1F40FA2F0]();
}

uint64_t sub_1AB237E5C()
{
  return MEMORY[0x1F40FA2F8]();
}

uint64_t sub_1AB237E6C()
{
  return MEMORY[0x1F40FA300]();
}

uint64_t sub_1AB237E7C()
{
  return MEMORY[0x1F40FA308]();
}

uint64_t sub_1AB237E8C()
{
  return MEMORY[0x1F40FA348]();
}

uint64_t sub_1AB237E9C()
{
  return MEMORY[0x1F40FA350]();
}

uint64_t sub_1AB237EAC()
{
  return MEMORY[0x1F40FA378]();
}

uint64_t sub_1AB237EBC()
{
  return MEMORY[0x1F40FA380]();
}

uint64_t sub_1AB237ECC()
{
  return MEMORY[0x1F40FA3A0]();
}

uint64_t sub_1AB237EDC()
{
  return MEMORY[0x1F40FA3A8]();
}

uint64_t sub_1AB237EEC()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1AB237EFC()
{
  return MEMORY[0x1F40FA3D0]();
}

uint64_t sub_1AB237F0C()
{
  return MEMORY[0x1F40FA3D8]();
}

uint64_t sub_1AB237F1C()
{
  return MEMORY[0x1F40FA460]();
}

uint64_t sub_1AB237F2C()
{
  return MEMORY[0x1F40FA470]();
}

uint64_t sub_1AB237F3C()
{
  return MEMORY[0x1F40FA490]();
}

uint64_t sub_1AB237F4C()
{
  return MEMORY[0x1F40FA518]();
}

uint64_t sub_1AB237F5C()
{
  return MEMORY[0x1F40FA528]();
}

uint64_t sub_1AB237F6C()
{
  return MEMORY[0x1F40FA538]();
}

uint64_t sub_1AB237F7C()
{
  return MEMORY[0x1F40FA540]();
}

uint64_t sub_1AB237F8C()
{
  return MEMORY[0x1F40FA548]();
}

uint64_t sub_1AB237F9C()
{
  return MEMORY[0x1F40FA558]();
}

uint64_t sub_1AB237FAC()
{
  return MEMORY[0x1F40FA580]();
}

uint64_t sub_1AB237FBC()
{
  return MEMORY[0x1F40FA5A0]();
}

uint64_t sub_1AB237FCC()
{
  return MEMORY[0x1F40FA5A8]();
}

uint64_t sub_1AB237FDC()
{
  return MEMORY[0x1F40FA5B8]();
}

uint64_t sub_1AB237FEC()
{
  return MEMORY[0x1F40FA5D0]();
}

uint64_t sub_1AB237FFC()
{
  return MEMORY[0x1F40FA5D8]();
}

uint64_t sub_1AB23800C()
{
  return MEMORY[0x1F40FA5E0]();
}

uint64_t sub_1AB23801C()
{
  return MEMORY[0x1F40FA5E8]();
}

uint64_t sub_1AB23802C()
{
  return MEMORY[0x1F40FA5F8]();
}

uint64_t sub_1AB23803C()
{
  return MEMORY[0x1F40FA630]();
}

uint64_t sub_1AB23804C()
{
  return MEMORY[0x1F40FA640]();
}

uint64_t sub_1AB23805C()
{
  return MEMORY[0x1F40FA648]();
}

uint64_t sub_1AB23806C()
{
  return MEMORY[0x1F40FA650]();
}

uint64_t sub_1AB23807C()
{
  return MEMORY[0x1F40FA658]();
}

uint64_t sub_1AB23808C()
{
  return MEMORY[0x1F40FA680]();
}

uint64_t sub_1AB23809C()
{
  return MEMORY[0x1F40FA688]();
}

uint64_t sub_1AB2380AC()
{
  return MEMORY[0x1F40FA690]();
}

uint64_t sub_1AB2380BC()
{
  return MEMORY[0x1F40FA6A0]();
}

uint64_t sub_1AB2380CC()
{
  return MEMORY[0x1F40FA6B8]();
}

uint64_t sub_1AB2380DC()
{
  return MEMORY[0x1F40FA6C8]();
}

uint64_t sub_1AB2380EC()
{
  return MEMORY[0x1F40FA6D0]();
}

uint64_t sub_1AB2380FC()
{
  return MEMORY[0x1F40FA6E0]();
}

uint64_t sub_1AB23810C()
{
  return MEMORY[0x1F40FA6E8]();
}

uint64_t sub_1AB23811C()
{
  return MEMORY[0x1F40FA6F8]();
}

uint64_t sub_1AB23812C()
{
  return MEMORY[0x1F40FA708]();
}

uint64_t sub_1AB23813C()
{
  return MEMORY[0x1F40FA748]();
}

uint64_t sub_1AB23814C()
{
  return MEMORY[0x1F40FA750]();
}

uint64_t sub_1AB23815C()
{
  return MEMORY[0x1F40FA768]();
}

uint64_t sub_1AB23816C()
{
  return MEMORY[0x1F40FA770]();
}

uint64_t sub_1AB23817C()
{
  return MEMORY[0x1F40FA778]();
}

uint64_t sub_1AB23818C()
{
  return MEMORY[0x1F40FA790]();
}

uint64_t sub_1AB23819C()
{
  return MEMORY[0x1F40FA798]();
}

uint64_t sub_1AB2381AC()
{
  return MEMORY[0x1F40FA7D0]();
}

uint64_t sub_1AB2381BC()
{
  return MEMORY[0x1F40FA7D8]();
}

uint64_t sub_1AB2381CC()
{
  return MEMORY[0x1F40FA7E0]();
}

uint64_t sub_1AB2381DC()
{
  return MEMORY[0x1F40FA7F8]();
}

uint64_t sub_1AB2381EC()
{
  return MEMORY[0x1F40FA800]();
}

uint64_t sub_1AB2381FC()
{
  return MEMORY[0x1F40FA810]();
}

uint64_t sub_1AB23820C()
{
  return MEMORY[0x1F40FA828]();
}

uint64_t sub_1AB23821C()
{
  return MEMORY[0x1F40FA838]();
}

uint64_t sub_1AB23822C()
{
  return MEMORY[0x1F40FA840]();
}

uint64_t sub_1AB23823C()
{
  return MEMORY[0x1F40FA848]();
}

uint64_t sub_1AB23824C()
{
  return MEMORY[0x1F40FA850]();
}

uint64_t sub_1AB23825C()
{
  return MEMORY[0x1F40FA860]();
}

uint64_t sub_1AB23826C()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1AB23827C()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1AB23828C()
{
  return MEMORY[0x1F40FA8A8]();
}

uint64_t sub_1AB23829C()
{
  return MEMORY[0x1F40FA8B0]();
}

uint64_t sub_1AB2382AC()
{
  return MEMORY[0x1F40FA8C0]();
}

uint64_t sub_1AB2382BC()
{
  return MEMORY[0x1F40FA8D8]();
}

uint64_t sub_1AB2382CC()
{
  return MEMORY[0x1F40FA908]();
}

uint64_t sub_1AB2382DC()
{
  return MEMORY[0x1F40FA918]();
}

uint64_t sub_1AB2382EC()
{
  return MEMORY[0x1F40FA920]();
}

uint64_t sub_1AB2382FC()
{
  return MEMORY[0x1F40FA940]();
}

uint64_t sub_1AB23830C()
{
  return MEMORY[0x1F40FA948]();
}

uint64_t sub_1AB23831C()
{
  return MEMORY[0x1F40FA950]();
}

uint64_t sub_1AB23832C()
{
  return MEMORY[0x1F40FA960]();
}

uint64_t sub_1AB23833C()
{
  return MEMORY[0x1F40FA978]();
}

uint64_t sub_1AB23834C()
{
  return MEMORY[0x1F40FAAA8]();
}

uint64_t sub_1AB23835C()
{
  return MEMORY[0x1F40FAAC0]();
}

uint64_t sub_1AB23836C()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1AB23837C()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1AB23838C()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1AB2383AC()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1AB2383BC()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1AB2383CC()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1AB2383EC()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1AB2383FC()
{
  return MEMORY[0x1F40FABA0]();
}

uint64_t sub_1AB23840C()
{
  return MEMORY[0x1F40FABA8]();
}

uint64_t sub_1AB23841C()
{
  return MEMORY[0x1F40FABB8]();
}

uint64_t sub_1AB23842C()
{
  return MEMORY[0x1F40FABC0]();
}

uint64_t sub_1AB23843C()
{
  return MEMORY[0x1F40FABE0]();
}

uint64_t sub_1AB23844C()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1AB23845C()
{
  return MEMORY[0x1F40FAC00]();
}

uint64_t sub_1AB23846C()
{
  return MEMORY[0x1F40FAC08]();
}

uint64_t sub_1AB23847C()
{
  return MEMORY[0x1F40FAC10]();
}

uint64_t sub_1AB23848C()
{
  return MEMORY[0x1F40FAC18]();
}

uint64_t sub_1AB23849C()
{
  return MEMORY[0x1F40FAC40]();
}

uint64_t sub_1AB2384AC()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_1AB2384BC()
{
  return MEMORY[0x1F40FACA8]();
}

uint64_t sub_1AB2384CC()
{
  return MEMORY[0x1F40FACB0]();
}

uint64_t sub_1AB2384DC()
{
  return MEMORY[0x1F40FACB8]();
}

uint64_t sub_1AB2384EC()
{
  return MEMORY[0x1F40FAD00]();
}

uint64_t sub_1AB2384FC()
{
  return MEMORY[0x1F40FAD08]();
}

uint64_t sub_1AB23850C()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1AB23851C()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_1AB23852C()
{
  return MEMORY[0x1F40FAD88]();
}

uint64_t sub_1AB23853C()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1AB23854C()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1AB23855C()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1AB23856C()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1AB23857C()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1AB23858C()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1AB23859C()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1AB2385AC()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1AB2385BC()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1AB2385CC()
{
  return MEMORY[0x1F40FAE58]();
}

uint64_t sub_1AB2385DC()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1AB2385EC()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1AB2385FC()
{
  return MEMORY[0x1F40FAF08]();
}

uint64_t sub_1AB23860C()
{
  return MEMORY[0x1F40FAF30]();
}

uint64_t sub_1AB23861C()
{
  return MEMORY[0x1F40FAF38]();
}

uint64_t sub_1AB23862C()
{
  return MEMORY[0x1F40FAF40]();
}

uint64_t sub_1AB23863C()
{
  return MEMORY[0x1F40FAF48]();
}

uint64_t sub_1AB23864C()
{
  return MEMORY[0x1F40FAF58]();
}

uint64_t sub_1AB23865C()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1AB23866C()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1AB23867C()
{
  return MEMORY[0x1F40FAFB0]();
}

uint64_t sub_1AB23868C()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1AB23869C()
{
  return MEMORY[0x1F40FAFF0]();
}

uint64_t sub_1AB2386AC()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1AB2386BC()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1AB2386CC()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_1AB2386DC()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1AB2386EC()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1AB2386FC()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1AB23870C()
{
  return MEMORY[0x1F40FB0C8]();
}

uint64_t sub_1AB23871C()
{
  return MEMORY[0x1F40FB0D0]();
}

uint64_t sub_1AB23872C()
{
  return MEMORY[0x1F40FB0E8]();
}

uint64_t sub_1AB23873C()
{
  return MEMORY[0x1F40FB0F8]();
}

uint64_t sub_1AB23874C()
{
  return MEMORY[0x1F40FB108]();
}

uint64_t sub_1AB23875C()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1AB23876C()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1AB23877C()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_1AB23878C()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_1AB23879C()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_1AB2387AC()
{
  return MEMORY[0x1F40FB1A0]();
}

uint64_t sub_1AB2387BC()
{
  return MEMORY[0x1F40FB1A8]();
}

uint64_t sub_1AB2387CC()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1AB2387DC()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_1AB2387EC()
{
  return MEMORY[0x1F40FB1F8]();
}

uint64_t sub_1AB2387FC()
{
  return MEMORY[0x1F40FB208]();
}

uint64_t sub_1AB23880C()
{
  return MEMORY[0x1F40FB2A8]();
}

uint64_t sub_1AB23881C()
{
  return MEMORY[0x1F40FB2D0]();
}

uint64_t sub_1AB23882C()
{
  return MEMORY[0x1F40FB2E8]();
}

uint64_t sub_1AB23883C()
{
  return MEMORY[0x1F40FB308]();
}

uint64_t sub_1AB23884C()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1AB23885C()
{
  return MEMORY[0x1F40FB3A0]();
}

uint64_t sub_1AB23886C()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1AB23887C()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1AB23888C()
{
  return MEMORY[0x1F40FB3D8]();
}

uint64_t sub_1AB23889C()
{
  return MEMORY[0x1F40FB408]();
}

uint64_t sub_1AB2388AC()
{
  return MEMORY[0x1F40FB438]();
}

uint64_t sub_1AB2388BC()
{
  return MEMORY[0x1F40FB440]();
}

uint64_t sub_1AB2388CC()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1AB2388DC()
{
  return MEMORY[0x1F40FB480]();
}

uint64_t sub_1AB2388EC()
{
  return MEMORY[0x1F40FB488]();
}

uint64_t sub_1AB2388FC()
{
  return MEMORY[0x1F40FB490]();
}

uint64_t sub_1AB23890C()
{
  return MEMORY[0x1F40FB498]();
}

uint64_t sub_1AB23891C()
{
  return MEMORY[0x1F40FB4A0]();
}

uint64_t sub_1AB23892C()
{
  return MEMORY[0x1F40FB4A8]();
}

uint64_t sub_1AB23893C()
{
  return MEMORY[0x1F40FB4C8]();
}

uint64_t sub_1AB23894C()
{
  return MEMORY[0x1F40FB528]();
}

uint64_t sub_1AB23895C()
{
  return MEMORY[0x1F40FB538]();
}

uint64_t sub_1AB23896C()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1AB23897C()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1AB23898C()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1AB23899C()
{
  return MEMORY[0x1F40FB598]();
}

uint64_t sub_1AB2389AC()
{
  return MEMORY[0x1F4143480]();
}

uint64_t sub_1AB2389BC()
{
  return MEMORY[0x1F4143488]();
}

uint64_t sub_1AB2389CC()
{
  return MEMORY[0x1F4143490]();
}

uint64_t sub_1AB2389DC()
{
  return MEMORY[0x1F4143498]();
}

uint64_t sub_1AB2389EC()
{
  return MEMORY[0x1F41434A0]();
}

uint64_t sub_1AB2389FC()
{
  return MEMORY[0x1F41434A8]();
}

uint64_t sub_1AB238A0C()
{
  return MEMORY[0x1F41434B0]();
}

uint64_t sub_1AB238A1C()
{
  return MEMORY[0x1F41434B8]();
}

uint64_t sub_1AB238A2C()
{
  return MEMORY[0x1F41434C0]();
}

uint64_t sub_1AB238A3C()
{
  return MEMORY[0x1F41434C8]();
}

uint64_t sub_1AB238A4C()
{
  return MEMORY[0x1F41434D0]();
}

uint64_t sub_1AB238A5C()
{
  return MEMORY[0x1F41434D8]();
}

uint64_t sub_1AB238A6C()
{
  return MEMORY[0x1F41434E0]();
}

uint64_t sub_1AB238A7C()
{
  return MEMORY[0x1F41434E8]();
}

uint64_t sub_1AB238A8C()
{
  return MEMORY[0x1F41434F0]();
}

uint64_t sub_1AB238A9C()
{
  return MEMORY[0x1F41434F8]();
}

uint64_t sub_1AB238AAC()
{
  return MEMORY[0x1F4143500]();
}

uint64_t sub_1AB238ABC()
{
  return MEMORY[0x1F4143508]();
}

uint64_t sub_1AB238ACC()
{
  return MEMORY[0x1F4143510]();
}

uint64_t sub_1AB238ADC()
{
  return MEMORY[0x1F4143518]();
}

uint64_t sub_1AB238AEC()
{
  return MEMORY[0x1F4143520]();
}

uint64_t sub_1AB238AFC()
{
  return MEMORY[0x1F4143528]();
}

uint64_t sub_1AB238B0C()
{
  return MEMORY[0x1F4143530]();
}

uint64_t sub_1AB238B1C()
{
  return MEMORY[0x1F4143538]();
}

uint64_t sub_1AB238B2C()
{
  return MEMORY[0x1F4143540]();
}

uint64_t sub_1AB238B3C()
{
  return MEMORY[0x1F4143548]();
}

uint64_t sub_1AB238B4C()
{
  return MEMORY[0x1F4143550]();
}

uint64_t sub_1AB238B5C()
{
  return MEMORY[0x1F4143558]();
}

uint64_t sub_1AB238B6C()
{
  return MEMORY[0x1F4143560]();
}

uint64_t sub_1AB238B7C()
{
  return MEMORY[0x1F4143568]();
}

uint64_t sub_1AB238B8C()
{
  return MEMORY[0x1F4143570]();
}

uint64_t sub_1AB238B9C()
{
  return MEMORY[0x1F4143578]();
}

uint64_t sub_1AB238BAC()
{
  return MEMORY[0x1F4143580]();
}

uint64_t sub_1AB238BBC()
{
  return MEMORY[0x1F4143588]();
}

uint64_t sub_1AB238BCC()
{
  return MEMORY[0x1F4143590]();
}

uint64_t sub_1AB238BDC()
{
  return MEMORY[0x1F4143598]();
}

uint64_t sub_1AB238BEC()
{
  return MEMORY[0x1F41435A0]();
}

uint64_t sub_1AB238BFC()
{
  return MEMORY[0x1F4104D70]();
}

uint64_t sub_1AB238C0C()
{
  return MEMORY[0x1F4104D78]();
}

uint64_t sub_1AB238C1C()
{
  return MEMORY[0x1F4104D80]();
}

uint64_t sub_1AB238C2C()
{
  return MEMORY[0x1F4104D88]();
}

uint64_t sub_1AB238C3C()
{
  return MEMORY[0x1F4104D90]();
}

uint64_t sub_1AB238C4C()
{
  return MEMORY[0x1F4104D98]();
}

uint64_t sub_1AB238C5C()
{
  return MEMORY[0x1F4104DA0]();
}

uint64_t sub_1AB238C6C()
{
  return MEMORY[0x1F4104DA8]();
}

uint64_t sub_1AB238C7C()
{
  return MEMORY[0x1F41025A0]();
}

uint64_t sub_1AB238C8C()
{
  return MEMORY[0x1F41025A8]();
}

uint64_t sub_1AB238C9C()
{
  return MEMORY[0x1F41025B0]();
}

uint64_t sub_1AB238CAC()
{
  return MEMORY[0x1F41025B8]();
}

uint64_t sub_1AB238CBC()
{
  return MEMORY[0x1F40FB5A0]();
}

uint64_t sub_1AB238CCC()
{
  return MEMORY[0x1F40FB5B8]();
}

uint64_t sub_1AB238CDC()
{
  return MEMORY[0x1F40FB5C0]();
}

uint64_t sub_1AB238CEC()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1AB238CFC()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1AB238D0C()
{
  return MEMORY[0x1F40FB5E8]();
}

uint64_t sub_1AB238D1C()
{
  return MEMORY[0x1F40FB5F0]();
}

uint64_t sub_1AB238D2C()
{
  return MEMORY[0x1F40FB608]();
}

uint64_t sub_1AB238D3C()
{
  return MEMORY[0x1F40FB610]();
}

uint64_t sub_1AB238D4C()
{
  return MEMORY[0x1F40FB628]();
}

uint64_t sub_1AB238D5C()
{
  return MEMORY[0x1F40FB638]();
}

uint64_t sub_1AB238D6C()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1AB238D7C()
{
  return MEMORY[0x1F40FB660]();
}

uint64_t sub_1AB238D8C()
{
  return MEMORY[0x1F40FB6B8]();
}

uint64_t sub_1AB238D9C()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1AB238DAC()
{
  return MEMORY[0x1F40FB6E0]();
}

uint64_t sub_1AB238DBC()
{
  return MEMORY[0x1F40FB6F0]();
}

uint64_t sub_1AB238DCC()
{
  return MEMORY[0x1F40FB710]();
}

uint64_t sub_1AB238DDC()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_1AB238DEC()
{
  return MEMORY[0x1F40FB728]();
}

uint64_t sub_1AB238DFC()
{
  return MEMORY[0x1F40FB760]();
}

uint64_t sub_1AB238E0C()
{
  return MEMORY[0x1F40FB778]();
}

uint64_t sub_1AB238E1C()
{
  return MEMORY[0x1F40FB780]();
}

uint64_t sub_1AB238E2C()
{
  return MEMORY[0x1F40FB788]();
}

uint64_t sub_1AB238E3C()
{
  return MEMORY[0x1F40FB7A8]();
}

uint64_t sub_1AB238E4C()
{
  return MEMORY[0x1F40FB7B8]();
}

uint64_t sub_1AB238E5C()
{
  return MEMORY[0x1F40FB7C0]();
}

uint64_t sub_1AB238E6C()
{
  return MEMORY[0x1F40FB7D0]();
}

uint64_t sub_1AB238E8C()
{
  return MEMORY[0x1F40FB7F8]();
}

uint64_t sub_1AB238E9C()
{
  return MEMORY[0x1F40FB808]();
}

uint64_t sub_1AB238EAC()
{
  return MEMORY[0x1F40FB810]();
}

uint64_t sub_1AB238EBC()
{
  return MEMORY[0x1F40FB828]();
}

uint64_t sub_1AB238ECC()
{
  return MEMORY[0x1F40FB830]();
}

uint64_t sub_1AB238EDC()
{
  return MEMORY[0x1F40FB840]();
}

uint64_t sub_1AB238EEC()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1AB238EFC()
{
  return MEMORY[0x1F40FB880]();
}

uint64_t sub_1AB238F0C()
{
  return MEMORY[0x1F40FB888]();
}

uint64_t sub_1AB238F1C()
{
  return MEMORY[0x1F40FB898]();
}

uint64_t sub_1AB238F2C()
{
  return MEMORY[0x1F40FB8A0]();
}

uint64_t sub_1AB238F3C()
{
  return MEMORY[0x1F40FB8A8]();
}

uint64_t sub_1AB238F4C()
{
  return MEMORY[0x1F40FB8B0]();
}

uint64_t sub_1AB238F5C()
{
  return MEMORY[0x1F40FB8C0]();
}

uint64_t sub_1AB238F6C()
{
  return MEMORY[0x1F40FB910]();
}

uint64_t sub_1AB238F7C()
{
  return MEMORY[0x1F40FB918]();
}

uint64_t sub_1AB238F8C()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1AB238F9C()
{
  return MEMORY[0x1F40FB970]();
}

uint64_t sub_1AB238FAC()
{
  return MEMORY[0x1F40FB990]();
}

uint64_t sub_1AB238FBC()
{
  return MEMORY[0x1F40FB9C0]();
}

uint64_t sub_1AB238FCC()
{
  return MEMORY[0x1F40FB9C8]();
}

uint64_t sub_1AB238FDC()
{
  return MEMORY[0x1F40FB9D8]();
}

uint64_t sub_1AB238FEC()
{
  return MEMORY[0x1F40FBA20]();
}

uint64_t sub_1AB238FFC()
{
  return MEMORY[0x1F40FBA28]();
}

uint64_t sub_1AB23900C()
{
  return MEMORY[0x1F40FBA30]();
}

uint64_t sub_1AB23901C()
{
  return MEMORY[0x1F40FBA58]();
}

uint64_t sub_1AB23902C()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_1AB23903C()
{
  return MEMORY[0x1F40FBA70]();
}

uint64_t sub_1AB23904C()
{
  return MEMORY[0x1F40FBAA8]();
}

uint64_t sub_1AB23905C()
{
  return MEMORY[0x1F40FBAB8]();
}

uint64_t sub_1AB23906C()
{
  return MEMORY[0x1F40FBAE0]();
}

uint64_t sub_1AB23907C()
{
  return MEMORY[0x1F40FBB20]();
}

uint64_t sub_1AB23908C()
{
  return MEMORY[0x1F40FBB48]();
}

uint64_t sub_1AB23909C()
{
  return MEMORY[0x1F40FBB68]();
}

uint64_t sub_1AB2390AC()
{
  return MEMORY[0x1F40FBB70]();
}

uint64_t sub_1AB2390BC()
{
  return MEMORY[0x1F40FBB90]();
}

uint64_t sub_1AB2390CC()
{
  return MEMORY[0x1F40FBB98]();
}

uint64_t sub_1AB2390DC()
{
  return MEMORY[0x1F40FBBC8]();
}

uint64_t sub_1AB2390EC()
{
  return MEMORY[0x1F40FBBD8]();
}

uint64_t sub_1AB2390FC()
{
  return MEMORY[0x1F40FBC10]();
}

uint64_t sub_1AB23910C()
{
  return MEMORY[0x1F40FBC18]();
}

uint64_t sub_1AB23911C()
{
  return MEMORY[0x1F40FBC30]();
}

uint64_t sub_1AB23912C()
{
  return MEMORY[0x1F40FBC40]();
}

uint64_t sub_1AB23913C()
{
  return MEMORY[0x1F40FBC48]();
}

uint64_t sub_1AB23914C()
{
  return MEMORY[0x1F40FBC70]();
}

uint64_t sub_1AB23915C()
{
  return MEMORY[0x1F40FBC78]();
}

uint64_t sub_1AB23916C()
{
  return MEMORY[0x1F40FBC88]();
}

uint64_t sub_1AB23917C()
{
  return MEMORY[0x1F40FBCA0]();
}

uint64_t sub_1AB23918C()
{
  return MEMORY[0x1F40FBCB0]();
}

uint64_t sub_1AB23919C()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1AB2391AC()
{
  return MEMORY[0x1F40FBD00]();
}

uint64_t sub_1AB2391BC()
{
  return MEMORY[0x1F40FBD20]();
}

uint64_t sub_1AB2391CC()
{
  return MEMORY[0x1F40FBD30]();
}

uint64_t sub_1AB2391DC()
{
  return MEMORY[0x1F40FBD38]();
}

uint64_t sub_1AB2391EC()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1AB2391FC()
{
  return MEMORY[0x1F40FBD68]();
}

uint64_t sub_1AB23920C()
{
  return MEMORY[0x1F40FBD78]();
}

uint64_t sub_1AB23921C()
{
  return MEMORY[0x1F40FBD80]();
}

uint64_t sub_1AB23922C()
{
  return MEMORY[0x1F40FBD88]();
}

uint64_t sub_1AB23923C()
{
  return MEMORY[0x1F40FBDC0]();
}

uint64_t sub_1AB23924C()
{
  return MEMORY[0x1F40FBDD8]();
}

uint64_t sub_1AB23925C()
{
  return MEMORY[0x1F40FBDE0]();
}

uint64_t sub_1AB23926C()
{
  return MEMORY[0x1F40FBDF8]();
}

uint64_t sub_1AB23927C()
{
  return MEMORY[0x1F40FBE08]();
}

uint64_t sub_1AB23928C()
{
  return MEMORY[0x1F40FBE10]();
}

uint64_t sub_1AB23929C()
{
  return MEMORY[0x1F40FBE38]();
}

uint64_t sub_1AB2392AC()
{
  return MEMORY[0x1F40FBE50]();
}

uint64_t sub_1AB2392BC()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1AB2392CC()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_1AB2392DC()
{
  return MEMORY[0x1F40FBE88]();
}

uint64_t sub_1AB2392EC()
{
  return MEMORY[0x1F40FBE98]();
}

uint64_t sub_1AB2392FC()
{
  return MEMORY[0x1F40FBEB0]();
}

uint64_t sub_1AB23930C()
{
  return MEMORY[0x1F40FBEE8]();
}

uint64_t sub_1AB23931C()
{
  return MEMORY[0x1F40FBEF0]();
}

uint64_t sub_1AB23932C()
{
  return MEMORY[0x1F40FBF10]();
}

uint64_t sub_1AB23933C()
{
  return MEMORY[0x1F40FBF20]();
}

uint64_t sub_1AB23934C()
{
  return MEMORY[0x1F40FBF38]();
}

uint64_t sub_1AB23935C()
{
  return MEMORY[0x1F40FBF70]();
}

uint64_t sub_1AB23936C()
{
  return MEMORY[0x1F40FBFA0]();
}

uint64_t sub_1AB23937C()
{
  return MEMORY[0x1F40FBFB8]();
}

uint64_t sub_1AB23938C()
{
  return MEMORY[0x1F40FBFD8]();
}

uint64_t sub_1AB23939C()
{
  return MEMORY[0x1F40FBFE8]();
}

uint64_t sub_1AB2393AC()
{
  return MEMORY[0x1F40FBFF0]();
}

uint64_t sub_1AB2393BC()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1AB2393CC()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_1AB2393DC()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_1AB2393EC()
{
  return MEMORY[0x1F40FC028]();
}

uint64_t sub_1AB2393FC()
{
  return MEMORY[0x1F40FC038]();
}

uint64_t sub_1AB23940C()
{
  return MEMORY[0x1F40FC040]();
}

uint64_t sub_1AB23941C()
{
  return MEMORY[0x1F40FC060]();
}

uint64_t sub_1AB23942C()
{
  return MEMORY[0x1F40FC068]();
}

uint64_t sub_1AB23943C()
{
  return MEMORY[0x1F40FC078]();
}

uint64_t sub_1AB23944C()
{
  return MEMORY[0x1F40FC090]();
}

uint64_t sub_1AB23945C()
{
  return MEMORY[0x1F40FC098]();
}

uint64_t sub_1AB23946C()
{
  return MEMORY[0x1F40FC0B0]();
}

uint64_t sub_1AB23947C()
{
  return MEMORY[0x1F40FC0C0]();
}

uint64_t sub_1AB23948C()
{
  return MEMORY[0x1F40FC0E0]();
}

uint64_t sub_1AB23949C()
{
  return MEMORY[0x1F40FC0E8]();
}

uint64_t sub_1AB2394AC()
{
  return MEMORY[0x1F40FC0F0]();
}

uint64_t sub_1AB2394BC()
{
  return MEMORY[0x1F40FC108]();
}

uint64_t sub_1AB2394CC()
{
  return MEMORY[0x1F40FC128]();
}

uint64_t sub_1AB2394DC()
{
  return MEMORY[0x1F40FC130]();
}

uint64_t sub_1AB2394EC()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1AB2394FC()
{
  return MEMORY[0x1F40FC150]();
}

uint64_t sub_1AB23950C()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1AB23951C()
{
  return MEMORY[0x1F40FC168]();
}

uint64_t sub_1AB23952C()
{
  return MEMORY[0x1F40FC170]();
}

uint64_t sub_1AB23953C()
{
  return MEMORY[0x1F40FC190]();
}

uint64_t sub_1AB23954C()
{
  return MEMORY[0x1F40FC1B0]();
}

uint64_t sub_1AB23955C()
{
  return MEMORY[0x1F40FC1B8]();
}

uint64_t sub_1AB23956C()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_1AB23957C()
{
  return MEMORY[0x1F40FC1E0]();
}

uint64_t sub_1AB23958C()
{
  return MEMORY[0x1F40FC1F8]();
}

uint64_t sub_1AB23959C()
{
  return MEMORY[0x1F40FC220]();
}

uint64_t sub_1AB2395AC()
{
  return MEMORY[0x1F40FC228]();
}

uint64_t sub_1AB2395BC()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1AB2395CC()
{
  return MEMORY[0x1F40FC250]();
}

uint64_t sub_1AB2395DC()
{
  return MEMORY[0x1F40FC268]();
}

uint64_t sub_1AB2395EC()
{
  return MEMORY[0x1F40FC278]();
}

uint64_t sub_1AB2395FC()
{
  return MEMORY[0x1F40FC280]();
}

uint64_t sub_1AB23960C()
{
  return MEMORY[0x1F40FC288]();
}

uint64_t sub_1AB23961C()
{
  return MEMORY[0x1F40FC298]();
}

uint64_t sub_1AB23962C()
{
  return MEMORY[0x1F40FC2A0]();
}

uint64_t sub_1AB23963C()
{
  return MEMORY[0x1F40FC2A8]();
}

uint64_t sub_1AB23964C()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1AB23965C()
{
  return MEMORY[0x1F41435A8]();
}

uint64_t sub_1AB23966C()
{
  return MEMORY[0x1F41435B0]();
}

uint64_t sub_1AB23967C()
{
  return MEMORY[0x1F41435B8]();
}

uint64_t sub_1AB23968C()
{
  return MEMORY[0x1F41435C0]();
}

uint64_t sub_1AB23969C()
{
  return MEMORY[0x1F41435C8]();
}

uint64_t sub_1AB2396AC()
{
  return MEMORY[0x1F41435D0]();
}

uint64_t sub_1AB2396BC()
{
  return MEMORY[0x1F41435D8]();
}

uint64_t sub_1AB2396CC()
{
  return MEMORY[0x1F41435E0]();
}

uint64_t sub_1AB2396DC()
{
  return MEMORY[0x1F41435E8]();
}

uint64_t sub_1AB2396EC()
{
  return MEMORY[0x1F41435F0]();
}

uint64_t sub_1AB2396FC()
{
  return MEMORY[0x1F41435F8]();
}

uint64_t sub_1AB23970C()
{
  return MEMORY[0x1F4143600]();
}

uint64_t sub_1AB23971C()
{
  return MEMORY[0x1F4143608]();
}

uint64_t sub_1AB23972C()
{
  return MEMORY[0x1F4143610]();
}

uint64_t sub_1AB23973C()
{
  return MEMORY[0x1F4143618]();
}

uint64_t sub_1AB23974C()
{
  return MEMORY[0x1F4143620]();
}

uint64_t sub_1AB23975C()
{
  return MEMORY[0x1F40FC2F0]();
}

uint64_t sub_1AB23976C()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1AB23977C()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1AB23978C()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1AB23979C()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1AB2397AC()
{
  return MEMORY[0x1F40FC398]();
}

uint64_t sub_1AB2397BC()
{
  return MEMORY[0x1F40FC3A0]();
}

uint64_t sub_1AB2397CC()
{
  return MEMORY[0x1F40FC3A8]();
}

uint64_t sub_1AB2397DC()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1AB2397EC()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1AB2397FC()
{
  return MEMORY[0x1F40FC3E0]();
}

uint64_t sub_1AB23980C()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1AB23981C()
{
  return MEMORY[0x1F40FC400]();
}

uint64_t sub_1AB23982C()
{
  return MEMORY[0x1F40FC408]();
}

uint64_t sub_1AB23983C()
{
  return MEMORY[0x1F40FC428]();
}

uint64_t sub_1AB23984C()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1AB23985C()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1AB23986C()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1AB23987C()
{
  return MEMORY[0x1F40FC4A8]();
}

uint64_t sub_1AB23988C()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_1AB23989C()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1AB2398AC()
{
  return MEMORY[0x1F40FC4F0]();
}

uint64_t sub_1AB2398BC()
{
  return MEMORY[0x1F40FC518]();
}

uint64_t sub_1AB2398CC()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t sub_1AB2398DC()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1AB2398EC()
{
  return MEMORY[0x1F4143628]();
}

uint64_t sub_1AB2398FC()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1AB23990C()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1AB23991C()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_1AB23992C()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1AB23993C()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_1AB23994C()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_1AB23995C()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1AB23996C()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1AB23997C()
{
  return MEMORY[0x1F40FC600]();
}

uint64_t sub_1AB23998C()
{
  return MEMORY[0x1F40FC610]();
}

uint64_t sub_1AB23999C()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_1AB2399AC()
{
  return MEMORY[0x1F40FC628]();
}

uint64_t sub_1AB2399BC()
{
  return MEMORY[0x1F40FC638]();
}

uint64_t sub_1AB2399CC()
{
  return MEMORY[0x1F40FC658]();
}

uint64_t sub_1AB2399FC()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_1AB239A1C()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_1AB239A3C()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1AB239A4C()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1AB239A5C()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1AB239A6C()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1AB239A7C()
{
  return MEMORY[0x1F40FC728]();
}

uint64_t sub_1AB239A8C()
{
  return MEMORY[0x1F40FC738]();
}

uint64_t sub_1AB239A9C()
{
  return MEMORY[0x1F40FC750]();
}

uint64_t sub_1AB239AAC()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1AB239ABC()
{
  return MEMORY[0x1F40FC770]();
}

uint64_t sub_1AB239ACC()
{
  return MEMORY[0x1F40FC778]();
}

uint64_t sub_1AB239ADC()
{
  return MEMORY[0x1F40FC780]();
}

uint64_t sub_1AB239AEC()
{
  return MEMORY[0x1F40FC790]();
}

uint64_t sub_1AB239AFC()
{
  return MEMORY[0x1F40FC7A0]();
}

uint64_t sub_1AB239B0C()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1AB239B1C()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1AB239B2C()
{
  return MEMORY[0x1F40FC7E0]();
}

uint64_t sub_1AB239B3C()
{
  return MEMORY[0x1F40FC838]();
}

uint64_t sub_1AB239B4C()
{
  return MEMORY[0x1F40FC840]();
}

uint64_t sub_1AB239B5C()
{
  return MEMORY[0x1F40FC850]();
}

uint64_t sub_1AB239B6C()
{
  return MEMORY[0x1F40FC858]();
}

uint64_t sub_1AB239B7C()
{
  return MEMORY[0x1F40FC860]();
}

uint64_t sub_1AB239B8C()
{
  return MEMORY[0x1F40FC868]();
}

uint64_t sub_1AB239B9C()
{
  return MEMORY[0x1F40FC888]();
}

uint64_t sub_1AB239BAC()
{
  return MEMORY[0x1F40FC8A8]();
}

uint64_t sub_1AB239BBC()
{
  return MEMORY[0x1F40FC8B0]();
}

uint64_t sub_1AB239BCC()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1AB239BDC()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1AB239BEC()
{
  return MEMORY[0x1F40FC8E0]();
}

uint64_t sub_1AB239BFC()
{
  return MEMORY[0x1F40FC8E8]();
}

uint64_t sub_1AB239C0C()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1AB239C1C()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1AB239C2C()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1AB239C3C()
{
  return MEMORY[0x1F40FC930]();
}

uint64_t sub_1AB239C4C()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1AB239C5C()
{
  return MEMORY[0x1F40FC948]();
}

uint64_t sub_1AB239C6C()
{
  return MEMORY[0x1F40FC950]();
}

uint64_t sub_1AB239C7C()
{
  return MEMORY[0x1F40FC958]();
}

uint64_t sub_1AB239C8C()
{
  return MEMORY[0x1F40FC970]();
}

uint64_t sub_1AB239C9C()
{
  return MEMORY[0x1F40FC980]();
}

uint64_t sub_1AB239CAC()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1AB239CBC()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1AB239CCC()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1AB239CDC()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1AB239CEC()
{
  return MEMORY[0x1F40FC9E0]();
}

uint64_t sub_1AB239CFC()
{
  return MEMORY[0x1F40FC9E8]();
}

uint64_t sub_1AB239D0C()
{
  return MEMORY[0x1F40FC9F0]();
}

uint64_t sub_1AB239D1C()
{
  return MEMORY[0x1F40FC9F8]();
}

uint64_t sub_1AB239D2C()
{
  return MEMORY[0x1F40FCA18]();
}

uint64_t sub_1AB239D3C()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1AB239D4C()
{
  return MEMORY[0x1F40FCA30]();
}

uint64_t sub_1AB239D5C()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_1AB239D6C()
{
  return MEMORY[0x1F40FCA48]();
}

uint64_t sub_1AB239D7C()
{
  return MEMORY[0x1F40FCA58]();
}

uint64_t sub_1AB239D8C()
{
  return MEMORY[0x1F40FCA68]();
}

uint64_t sub_1AB239D9C()
{
  return MEMORY[0x1F40FCA78]();
}

uint64_t sub_1AB239DAC()
{
  return MEMORY[0x1F40FCA98]();
}

uint64_t sub_1AB239DBC()
{
  return MEMORY[0x1F40FCAB0]();
}

uint64_t sub_1AB239DCC()
{
  return MEMORY[0x1F40FCAB8]();
}

uint64_t sub_1AB239DDC()
{
  return MEMORY[0x1F40FCAD0]();
}

uint64_t sub_1AB239DEC()
{
  return MEMORY[0x1F40FCAD8]();
}

uint64_t sub_1AB239DFC()
{
  return MEMORY[0x1F40FCAE0]();
}

uint64_t sub_1AB239E0C()
{
  return MEMORY[0x1F40FCB08]();
}

uint64_t sub_1AB239E1C()
{
  return MEMORY[0x1F40FCB30]();
}

uint64_t sub_1AB239E2C()
{
  return MEMORY[0x1F40FCB38]();
}

uint64_t sub_1AB239E3C()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1AB239E4C()
{
  return MEMORY[0x1F40FCB58]();
}

uint64_t sub_1AB239E5C()
{
  return MEMORY[0x1F40FCB68]();
}

uint64_t sub_1AB239E6C()
{
  return MEMORY[0x1F40FCB78]();
}

uint64_t sub_1AB239E7C()
{
  return MEMORY[0x1F40FCB98]();
}

uint64_t sub_1AB239E8C()
{
  return MEMORY[0x1F40FCBA8]();
}

uint64_t sub_1AB239E9C()
{
  return MEMORY[0x1F40FCBB8]();
}

uint64_t sub_1AB239EAC()
{
  return MEMORY[0x1F40FCBC8]();
}

uint64_t sub_1AB239EBC()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1AB239ECC()
{
  return MEMORY[0x1F40FCBE8]();
}

uint64_t sub_1AB239EDC()
{
  return MEMORY[0x1F40FCBF0]();
}

uint64_t sub_1AB239EEC()
{
  return MEMORY[0x1F40FCBF8]();
}

uint64_t sub_1AB239EFC()
{
  return MEMORY[0x1F40FCC08]();
}

uint64_t sub_1AB239F0C()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_1AB239F1C()
{
  return MEMORY[0x1F40FCC20]();
}

uint64_t sub_1AB239F2C()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1AB239F3C()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1AB239F4C()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1AB239F5C()
{
  return MEMORY[0x1F40FCC68]();
}

uint64_t sub_1AB239F6C()
{
  return MEMORY[0x1F40FCC78]();
}

uint64_t sub_1AB239F7C()
{
  return MEMORY[0x1F40FCC98]();
}

uint64_t sub_1AB239F8C()
{
  return MEMORY[0x1F40FCCA8]();
}

uint64_t sub_1AB239F9C()
{
  return MEMORY[0x1F40FCCC0]();
}

uint64_t sub_1AB239FAC()
{
  return MEMORY[0x1F40FCCD0]();
}

uint64_t sub_1AB239FBC()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_1AB239FCC()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1AB239FDC()
{
  return MEMORY[0x1F40FCD00]();
}

uint64_t sub_1AB239FEC()
{
  return MEMORY[0x1F40FCD10]();
}

uint64_t sub_1AB239FFC()
{
  return MEMORY[0x1F40FCD18]();
}

uint64_t sub_1AB23A00C()
{
  return MEMORY[0x1F40FCD30]();
}

uint64_t sub_1AB23A01C()
{
  return MEMORY[0x1F40FCD60]();
}

uint64_t sub_1AB23A02C()
{
  return MEMORY[0x1F40FCD68]();
}

uint64_t sub_1AB23A03C()
{
  return MEMORY[0x1F40FCD70]();
}

uint64_t sub_1AB23A04C()
{
  return MEMORY[0x1F40FCD78]();
}

uint64_t sub_1AB23A05C()
{
  return MEMORY[0x1F40FCD80]();
}

uint64_t sub_1AB23A06C()
{
  return MEMORY[0x1F40FCD88]();
}

uint64_t sub_1AB23A07C()
{
  return MEMORY[0x1F40FCD90]();
}

uint64_t sub_1AB23A08C()
{
  return MEMORY[0x1F40FCDA0]();
}

uint64_t sub_1AB23A09C()
{
  return MEMORY[0x1F40FCDB8]();
}

uint64_t sub_1AB23A0AC()
{
  return MEMORY[0x1F40FCE00]();
}

uint64_t sub_1AB23A0BC()
{
  return MEMORY[0x1F40FCE08]();
}

uint64_t sub_1AB23A0CC()
{
  return MEMORY[0x1F40FCE18]();
}

uint64_t sub_1AB23A0DC()
{
  return MEMORY[0x1F40FCE28]();
}

uint64_t sub_1AB23A0EC()
{
  return MEMORY[0x1F40FCE48]();
}

uint64_t sub_1AB23A0FC()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1AB23A10C()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1AB23A11C()
{
  return MEMORY[0x1F40FCE88]();
}

uint64_t sub_1AB23A12C()
{
  return MEMORY[0x1F40FCEA0]();
}

uint64_t sub_1AB23A13C()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_1AB23A14C()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1AB23A15C()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_1AB23A16C()
{
  return MEMORY[0x1F40FCEE0]();
}

uint64_t sub_1AB23A17C()
{
  return MEMORY[0x1F40FCEE8]();
}

uint64_t sub_1AB23A18C()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1AB23A19C()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1AB23A1AC()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1AB23A1BC()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1AB23A1CC()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1AB23A1DC()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1AB23A1EC()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1AB23A1FC()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1AB23A20C()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1AB23A21C()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1AB23A22C()
{
  return MEMORY[0x1F4186E00]();
}

uint64_t sub_1AB23A23C()
{
  return MEMORY[0x1F4186E08]();
}

uint64_t sub_1AB23A24C()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1AB23A25C()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1AB23A26C()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1AB23A27C()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1AB23A28C()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1AB23A29C()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1AB23A2AC()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1AB23A2BC()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1AB23A2CC()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1AB23A2DC()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1AB23A2EC()
{
  return MEMORY[0x1F40F4888]();
}

uint64_t sub_1AB23A2FC()
{
  return MEMORY[0x1F40F4898]();
}

uint64_t sub_1AB23A30C()
{
  return MEMORY[0x1F40F48A0]();
}

uint64_t sub_1AB23A31C()
{
  return MEMORY[0x1F40F48B0]();
}

uint64_t sub_1AB23A32C()
{
  return MEMORY[0x1F40F48C8]();
}

uint64_t sub_1AB23A33C()
{
  return MEMORY[0x1F40F48D8]();
}

uint64_t sub_1AB23A34C()
{
  return MEMORY[0x1F40F48E0]();
}

uint64_t sub_1AB23A35C()
{
  return MEMORY[0x1F40F48F0]();
}

uint64_t sub_1AB23A36C()
{
  return MEMORY[0x1F40F4900]();
}

uint64_t sub_1AB23A37C()
{
  return MEMORY[0x1F40F4908]();
}

uint64_t sub_1AB23A38C()
{
  return MEMORY[0x1F40F4918]();
}

uint64_t sub_1AB23A39C()
{
  return MEMORY[0x1F40F4920]();
}

uint64_t sub_1AB23A3AC()
{
  return MEMORY[0x1F40F4928]();
}

uint64_t sub_1AB23A3BC()
{
  return MEMORY[0x1F40F4950]();
}

uint64_t sub_1AB23A3CC()
{
  return MEMORY[0x1F40F4960]();
}

uint64_t sub_1AB23A3DC()
{
  return MEMORY[0x1F40F4970]();
}

uint64_t sub_1AB23A3EC()
{
  return MEMORY[0x1F40F49D0]();
}

uint64_t sub_1AB23A3FC()
{
  return MEMORY[0x1F40F49D8]();
}

uint64_t sub_1AB23A40C()
{
  return MEMORY[0x1F40F49E0]();
}

uint64_t sub_1AB23A41C()
{
  return MEMORY[0x1F40F49E8]();
}

uint64_t sub_1AB23A42C()
{
  return MEMORY[0x1F40F49F0]();
}

uint64_t sub_1AB23A43C()
{
  return MEMORY[0x1F40F49F8]();
}

void sub_1AB23A44C()
{
  while (1)
    ;
}

void sub_1AB23A45C()
{
  while (1)
    ;
}

uint64_t sub_1AB23A46C()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1AB23A47C()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1AB23A48C()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1AB23A49C()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1AB23A4AC()
{
  return MEMORY[0x1F41832D0]();
}

uint64_t sub_1AB23A4BC()
{
  return MEMORY[0x1F41832F0]();
}

uint64_t sub_1AB23A4CC()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1AB23A4DC()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1AB23A4EC()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1AB23A4FC()
{
  return MEMORY[0x1F4183340]();
}

uint64_t sub_1AB23A50C()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1AB23A51C()
{
  return MEMORY[0x1F4183370]();
}

uint64_t sub_1AB23A52C()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1AB23A53C()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1AB23A54C()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1AB23A55C()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1AB23A56C()
{
  return MEMORY[0x1F41834B0]();
}

uint64_t sub_1AB23A57C()
{
  return MEMORY[0x1F41834F0]();
}

uint64_t sub_1AB23A58C()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1AB23A59C()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1AB23A5AC()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1AB23A5BC()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1AB23A5CC()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1AB23A5DC()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1AB23A5EC()
{
  return MEMORY[0x1F41836B0]();
}

uint64_t sub_1AB23A5FC()
{
  return MEMORY[0x1F41836C8]();
}

uint64_t sub_1AB23A60C()
{
  return MEMORY[0x1F4183730]();
}

void sub_1AB23A61C()
{
  while (1)
    ;
}

uint64_t sub_1AB23A62C()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1AB23A63C()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1AB23A64C()
{
  return MEMORY[0x1F40FCEF0]();
}

uint64_t sub_1AB23A65C()
{
  return MEMORY[0x1F41837A8]();
}

uint64_t sub_1AB23A66C()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1AB23A67C()
{
  return MEMORY[0x1F4183820]();
}

uint64_t sub_1AB23A68C()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1AB23A69C()
{
  return MEMORY[0x1F40D4A48]();
}

uint64_t sub_1AB23A6AC()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1AB23A6BC()
{
  return MEMORY[0x1F40E60D8]();
}

uint64_t sub_1AB23A6CC()
{
  return MEMORY[0x1F40E60F0]();
}

uint64_t sub_1AB23A6DC()
{
  return MEMORY[0x1F40E6110]();
}

uint64_t sub_1AB23A6EC()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t sub_1AB23A6FC()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t sub_1AB23A70C()
{
  return MEMORY[0x1F40E6148]();
}

uint64_t sub_1AB23A71C()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1AB23A72C()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1AB23A73C()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1AB23A74C()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1AB23A75C()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1AB23A76C()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1AB23A77C()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1AB23A78C()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1AB23A79C()
{
  return MEMORY[0x1F40E6208]();
}

uint64_t sub_1AB23A7AC()
{
  return MEMORY[0x1F40E6228]();
}

uint64_t sub_1AB23A7BC()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1AB23A7CC()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1AB23A7DC()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1AB23A7EC()
{
  return MEMORY[0x1F40E62E8]();
}

uint64_t sub_1AB23A7FC()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1AB23A80C()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1AB23A81C()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1AB23A82C()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1AB23A83C()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1AB23A84C()
{
  return MEMORY[0x1F4143630]();
}

uint64_t sub_1AB23A85C()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1AB23A86C()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1AB23A87C()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1AB23A88C()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1AB23A89C()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1AB23A8AC()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1AB23A8BC()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1AB23A8CC()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1AB23A8DC()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1AB23A8EC()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1AB23A8FC()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1AB23A90C()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1AB23A91C()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1AB23A92C()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1AB23A93C()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1AB23A94C()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1AB23A95C()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1AB23A96C()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1AB23A97C()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1AB23A98C()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1AB23A99C()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1AB23A9AC()
{
  return MEMORY[0x1F40E6310]();
}

uint64_t sub_1AB23A9BC()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1AB23A9DC()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1AB23A9EC()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1AB23A9FC()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1AB23AA0C()
{
  return MEMORY[0x1F4183C00]();
}

uint64_t sub_1AB23AA1C()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1AB23AA2C()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1AB23AA3C()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1AB23AA4C()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1AB23AA5C()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1AB23AA6C()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1AB23AA7C()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1AB23AA8C()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1AB23AA9C()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1AB23AAAC()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1AB23AABC()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1AB23AACC()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1AB23AADC()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1AB23AAEC()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1AB23AAFC()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1AB23AB0C()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1AB23AB1C()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1AB23AB2C()
{
  return MEMORY[0x1F4183EC8]();
}

void sub_1AB23AB3C()
{
  while (1)
    ;
}

uint64_t sub_1AB23AB4C()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1AB23AB5C()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1AB23AB6C()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1AB23AB7C()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1AB23AB8C()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1AB23AB9C()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1AB23ABAC()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1AB23ABBC()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1AB23ABCC()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1AB23ABDC()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1AB23ABEC()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1AB23ABFC()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1AB23AC0C()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1AB23AC1C()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1AB23AC2C()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1AB23AC3C()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1AB23AC4C()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1AB23AC5C()
{
  return MEMORY[0x1F40D4A70]();
}

uint64_t sub_1AB23AC6C()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1AB23AC7C()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1AB23AC8C()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1AB23AC9C()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1AB23ACAC()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1AB23ACBC()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1AB23ACFC()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1AB23AD0C()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1AB23AD1C()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1AB23AD2C()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1AB23AD3C()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1AB23AD4C()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1AB23AD5C()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1AB23AD6C()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1AB23AD7C()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1AB23AD8C()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t sub_1AB23AD9C()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1AB23ADAC()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1AB23ADBC()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1AB23ADCC()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1AB23ADDC()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1AB23ADEC()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1AB23AE0C()
{
  return MEMORY[0x1F4187D68]();
}

uint64_t sub_1AB23AE1C()
{
  return MEMORY[0x1F4187D70]();
}

uint64_t sub_1AB23AE2C()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1AB23AE3C()
{
  return MEMORY[0x1F4187D80]();
}

uint64_t sub_1AB23AE5C()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1AB23AE7C()
{
  return MEMORY[0x1F4187DB0]();
}

uint64_t sub_1AB23AE8C()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1AB23AE9C()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1AB23AEAC()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1AB23AEBC()
{
  return MEMORY[0x1F4187E50]();
}

uint64_t sub_1AB23AECC()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1AB23AEEC()
{
  return MEMORY[0x1F4187EA0]();
}

uint64_t sub_1AB23AEFC()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t sub_1AB23AF0C()
{
  return MEMORY[0x1F4187EB0]();
}

uint64_t sub_1AB23AF1C()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1AB23AF2C()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1AB23AF3C()
{
  return MEMORY[0x1F4187EC8]();
}

uint64_t sub_1AB23AF4C()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1AB23AF6C()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1AB23AF7C()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1AB23AF8C()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1AB23AF9C()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1AB23AFAC()
{
  return MEMORY[0x1F40E63F0]();
}

uint64_t sub_1AB23AFBC()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1AB23AFCC()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1AB23AFDC()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1AB23AFEC()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1AB23AFFC()
{
  return MEMORY[0x1F41841C0]();
}

uint64_t sub_1AB23B00C()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1AB23B01C()
{
  return MEMORY[0x1F41841F0]();
}

uint64_t sub_1AB23B02C()
{
  return MEMORY[0x1F40E6468]();
}

uint64_t sub_1AB23B03C()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1AB23B04C()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1AB23B05C()
{
  return MEMORY[0x1F4188450]();
}

uint64_t sub_1AB23B06C()
{
  return MEMORY[0x1F41842D8]();
}

uint64_t sub_1AB23B07C()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1AB23B08C()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1AB23B09C()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1AB23B0AC()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1AB23B0BC()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1AB23B0CC()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1AB23B0DC()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1AB23B0EC()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1AB23B0FC()
{
  return MEMORY[0x1F4184438]();
}

uint64_t sub_1AB23B10C()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1AB23B11C()
{
  return MEMORY[0x1F40FCEF8]();
}

uint64_t sub_1AB23B12C()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1AB23B13C()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1AB23B14C()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1AB23B15C()
{
  return MEMORY[0x1F4182DA8]();
}

uint64_t sub_1AB23B16C()
{
  return MEMORY[0x1F4186A30]();
}

uint64_t sub_1AB23B17C()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1AB23B18C()
{
  return MEMORY[0x1F40D9678]();
}

uint64_t sub_1AB23B19C()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1AB23B1AC()
{
  return MEMORY[0x1F40D9690]();
}

uint64_t sub_1AB23B1BC()
{
  return MEMORY[0x1F40E6578]();
}

uint64_t sub_1AB23B1CC()
{
  return MEMORY[0x1F40E65C0]();
}

uint64_t sub_1AB23B1DC()
{
  return MEMORY[0x1F4141C90]();
}

void sub_1AB23B1EC()
{
  while (1)
    ;
}

void sub_1AB23B1FC()
{
  while (1)
    ;
}

void sub_1AB23B20C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B21C()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1AB23B22C()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1AB23B23C()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AB23B24C()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1AB23B25C()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1AB23B26C()
{
  return MEMORY[0x1F40DFB38]();
}

uint64_t sub_1AB23B27C()
{
  return MEMORY[0x1F4187A38]();
}

uint64_t sub_1AB23B28C()
{
  return MEMORY[0x1F40F4700]();
}

uint64_t sub_1AB23B29C()
{
  return MEMORY[0x1F40F4708]();
}

uint64_t sub_1AB23B2AC()
{
  return MEMORY[0x1F41664B8]();
}

uint64_t sub_1AB23B2BC()
{
  return MEMORY[0x1F40D96E0]();
}

uint64_t sub_1AB23B2CC()
{
  return MEMORY[0x1F4143638]();
}

uint64_t sub_1AB23B2DC()
{
  return MEMORY[0x1F4143640]();
}

uint64_t sub_1AB23B2EC()
{
  return MEMORY[0x1F4143648]();
}

void sub_1AB23B2FC()
{
  while (1)
    ;
}

void sub_1AB23B30C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B31C()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1AB23B32C()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1AB23B33C()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1AB23B34C()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1AB23B35C()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1AB23B36C()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1AB23B37C()
{
  return MEMORY[0x1F4186FD0]();
}

uint64_t sub_1AB23B38C()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1AB23B39C()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1AB23B3AC()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1AB23B3BC()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1AB23B3CC()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1AB23B3DC()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1AB23B3EC()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1AB23B3FC()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1AB23B40C()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1AB23B41C()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1AB23B42C()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1AB23B43C()
{
  return MEMORY[0x1F4187110]();
}

void sub_1AB23B44C()
{
  while (1)
    ;
}

void sub_1AB23B45C()
{
  while (1)
    ;
}

void sub_1AB23B46C()
{
  while (1)
    ;
}

void sub_1AB23B47C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B48C()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1AB23B49C()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1AB23B4AC()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1AB23B4BC()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1AB23B4CC()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1AB23B4EC()
{
  return MEMORY[0x1F40E77F8]();
}

uint64_t sub_1AB23B4FC()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1AB23B50C()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1AB23B51C()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1AB23B52C()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1AB23B53C()
{
  return MEMORY[0x1F4166698]();
}

uint64_t sub_1AB23B54C()
{
  return MEMORY[0x1F40F4A18]();
}

uint64_t sub_1AB23B55C()
{
  return MEMORY[0x1F40F4A20]();
}

uint64_t sub_1AB23B56C()
{
  return MEMORY[0x1F41872A0]();
}

uint64_t sub_1AB23B57C()
{
  return MEMORY[0x1F41872A8]();
}

uint64_t sub_1AB23B59C()
{
  return MEMORY[0x1F40D9728]();
}

void sub_1AB23B5AC()
{
  while (1)
    ;
}

void sub_1AB23B5BC()
{
  while (1)
    ;
}

void sub_1AB23B5CC()
{
  while (1)
    ;
}

void sub_1AB23B5DC()
{
  while (1)
    ;
}

void sub_1AB23B5EC()
{
  while (1)
    ;
}

void sub_1AB23B5FC()
{
  while (1)
    ;
}

void sub_1AB23B60C()
{
  while (1)
    ;
}

void sub_1AB23B61C()
{
  while (1)
    ;
}

void sub_1AB23B62C()
{
  while (1)
    ;
}

void sub_1AB23B63C()
{
  while (1)
    ;
}

void sub_1AB23B64C()
{
  while (1)
    ;
}

void sub_1AB23B65C()
{
  while (1)
    ;
}

void sub_1AB23B66C()
{
  while (1)
    ;
}

void sub_1AB23B67C()
{
  while (1)
    ;
}

void sub_1AB23B68C()
{
  while (1)
    ;
}

void sub_1AB23B69C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B6AC()
{
  return off_1F0050790();
}

uint64_t sub_1AB23B6BC()
{
  return MEMORY[0x1F4186B18]();
}

uint64_t sub_1AB23B6CC()
{
  return MEMORY[0x1F4186B30]();
}

uint64_t sub_1AB23B6DC()
{
  return MEMORY[0x1F4186B50]();
}

uint64_t sub_1AB23B6EC()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1AB23B6FC()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1AB23B70C()
{
  return MEMORY[0x1F4143650]();
}

uint64_t sub_1AB23B71C()
{
  return MEMORY[0x1F4104CC8]();
}

uint64_t sub_1AB23B72C()
{
  return MEMORY[0x1F41667F0]();
}

void sub_1AB23B73C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B74C()
{
  return off_1F00507E0();
}

uint64_t sub_1AB23B75C()
{
  return MEMORY[0x1F40E6828]();
}

uint64_t sub_1AB23B76C()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1AB23B77C()
{
  return MEMORY[0x1F40FCF28]();
}

uint64_t sub_1AB23B78C()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1AB23B79C()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1AB23B7AC()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1AB23B7BC()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1AB23B7CC()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1AB23B7DC()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1AB23B7EC()
{
  return MEMORY[0x1F40F4710]();
}

uint64_t sub_1AB23B7FC()
{
  return MEMORY[0x1F40F4718]();
}

uint64_t sub_1AB23B80C()
{
  return MEMORY[0x1F4141C98]();
}

void sub_1AB23B81C()
{
  while (1)
    ;
}

uint64_t sub_1AB23B82C()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1AB23B83C()
{
  return MEMORY[0x1F4166850]();
}

uint64_t sub_1AB23B84C()
{
  return MEMORY[0x1F4166860]();
}

uint64_t sub_1AB23B85C()
{
  return MEMORY[0x1F4166870]();
}

uint64_t sub_1AB23B86C()
{
  return MEMORY[0x1F4166878]();
}

uint64_t sub_1AB23B87C()
{
  return MEMORY[0x1F4166880]();
}

uint64_t sub_1AB23B88C()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1AB23B89C()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1AB23B8AC()
{
  return MEMORY[0x1F41668B8]();
}

uint64_t sub_1AB23B8BC()
{
  return MEMORY[0x1F41668E0]();
}

uint64_t sub_1AB23B8CC()
{
  return MEMORY[0x1F41668F0]();
}

uint64_t sub_1AB23B8DC()
{
  return MEMORY[0x1F41668F8]();
}

uint64_t sub_1AB23B8EC()
{
  return MEMORY[0x1F4166900]();
}

uint64_t sub_1AB23B8FC()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1AB23B90C()
{
  return MEMORY[0x1F4166940]();
}

uint64_t sub_1AB23B91C()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1AB23B92C()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1AB23B93C()
{
  return MEMORY[0x1F4166970]();
}

uint64_t sub_1AB23B94C()
{
  return MEMORY[0x1F4166988]();
}

uint64_t sub_1AB23B95C()
{
  return MEMORY[0x1F4166990]();
}

uint64_t sub_1AB23B96C()
{
  return MEMORY[0x1F4166998]();
}

uint64_t sub_1AB23B97C()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1AB23B98C()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1AB23B99C()
{
  return MEMORY[0x1F41669D0]();
}

uint64_t sub_1AB23B9AC()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1AB23B9BC()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1AB23B9CC()
{
  return MEMORY[0x1F4166A08]();
}

uint64_t sub_1AB23B9DC()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1AB23B9EC()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1AB23B9FC()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1AB23BA0C()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1AB23BA1C()
{
  return MEMORY[0x1F4166A68]();
}

uint64_t sub_1AB23BA2C()
{
  return MEMORY[0x1F40E6940]();
}

uint64_t sub_1AB23BA3C()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1AB23BA4C()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1AB23BA5C()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1AB23BA6C()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1AB23BA7C()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1AB23BA8C()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1AB23BA9C()
{
  return MEMORY[0x1F4143658]();
}

uint64_t sub_1AB23BAAC()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1AB23BABC()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1AB23BACC()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AB23BADC()
{
  return MEMORY[0x1F41846E8]();
}

uint64_t sub_1AB23BAEC()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_1AB23BAFC()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1AB23BB0C()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1AB23BB1C()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1AB23BB2C()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1AB23BB3C()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1AB23BB4C()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1AB23BB5C()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1AB23BB6C()
{
  return MEMORY[0x1F40E6C70]();
}

uint64_t sub_1AB23BB7C()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1AB23BB8C()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1AB23BB9C()
{
  return MEMORY[0x1F40E6CC8]();
}

uint64_t sub_1AB23BBAC()
{
  return MEMORY[0x1F40E6D28]();
}

uint64_t sub_1AB23BBBC()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1AB23BBCC()
{
  return MEMORY[0x1F40E6D48]();
}

uint64_t sub_1AB23BBDC()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1AB23BBEC()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1AB23BBFC()
{
  return MEMORY[0x1F40E6D90]();
}

uint64_t sub_1AB23BC0C()
{
  return MEMORY[0x1F40E6D98]();
}

uint64_t sub_1AB23BC1C()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1AB23BC2C()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1AB23BC3C()
{
  return MEMORY[0x1F4184950]();
}

uint64_t sub_1AB23BC4C()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1AB23BC5C()
{
  return MEMORY[0x1F41849C0]();
}

uint64_t sub_1AB23BC6C()
{
  return MEMORY[0x1F41849C8]();
}

uint64_t sub_1AB23BC7C()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1AB23BC8C()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1AB23BC9C()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1AB23BCAC()
{
  return MEMORY[0x1F4184A88]();
}

uint64_t sub_1AB23BCBC()
{
  return MEMORY[0x1F4184A90]();
}

uint64_t sub_1AB23BCCC()
{
  return MEMORY[0x1F4184AA0]();
}

uint64_t sub_1AB23BCDC()
{
  return MEMORY[0x1F4184AB0]();
}

uint64_t sub_1AB23BCEC()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1AB23BD0C()
{
  return MEMORY[0x1F4184AD8]();
}

uint64_t sub_1AB23BD1C()
{
  return MEMORY[0x1F4184AE0]();
}

uint64_t sub_1AB23BD2C()
{
  return MEMORY[0x1F4184AE8]();
}

uint64_t sub_1AB23BD3C()
{
  return MEMORY[0x1F4184AF0]();
}

uint64_t sub_1AB23BD4C()
{
  return MEMORY[0x1F4184AF8]();
}

uint64_t sub_1AB23BD5C()
{
  return MEMORY[0x1F4184B00]();
}

uint64_t sub_1AB23BD7C()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1AB23BD8C()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1AB23BD9C()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1AB23BDAC()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1AB23BDBC()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1AB23BDCC()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1AB23BDDC()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1AB23BDEC()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1AB23BDFC()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1AB23BE0C()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1AB23BE1C()
{
  return MEMORY[0x1F4184BA0]();
}

uint64_t sub_1AB23BE2C()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1AB23BE3C()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1AB23BE4C()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1AB23BE5C()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1AB23BE6C()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1AB23BE7C()
{
  return MEMORY[0x1F4184C00]();
}

uint64_t sub_1AB23BE8C()
{
  return MEMORY[0x1F40E6DB8]();
}

uint64_t sub_1AB23BE9C()
{
  return MEMORY[0x1F4184C10]();
}

uint64_t sub_1AB23BEAC()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1AB23BEBC()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1AB23BECC()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1AB23BEDC()
{
  return MEMORY[0x1F4184C88]();
}

uint64_t sub_1AB23BEEC()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1AB23BEFC()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1AB23BF0C()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1AB23BF1C()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1AB23BF2C()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1AB23BF3C()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1AB23BF4C()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1AB23BF5C()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_1AB23BF6C()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_1AB23BF7C()
{
  return MEMORY[0x1F4184D10]();
}

uint64_t sub_1AB23BF8C()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1AB23BF9C()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1AB23BFAC()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1AB23BFBC()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1AB23BFCC()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1AB23BFDC()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1AB23BFEC()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1AB23BFFC()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1AB23C00C()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1AB23C01C()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1AB23C02C()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1AB23C03C()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1AB23C04C()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1AB23C05C()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1AB23C06C()
{
  return MEMORY[0x1F4184EE0]();
}

uint64_t sub_1AB23C07C()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1AB23C08C()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1AB23C09C()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1AB23C0AC()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1AB23C0BC()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1AB23C0CC()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1AB23C0DC()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1AB23C0EC()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1AB23C0FC()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1AB23C10C()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1AB23C11C()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1AB23C12C()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1AB23C13C()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1AB23C14C()
{
  return MEMORY[0x1F4187FC8]();
}

uint64_t sub_1AB23C15C()
{
  return MEMORY[0x1F4187FD0]();
}

uint64_t sub_1AB23C16C()
{
  return MEMORY[0x1F4187FE0]();
}

uint64_t sub_1AB23C17C()
{
  return MEMORY[0x1F4187FE8]();
}

uint64_t sub_1AB23C18C()
{
  return MEMORY[0x1F4187FF0]();
}

uint64_t sub_1AB23C19C()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1AB23C1AC()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1AB23C1BC()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1AB23C1CC()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1AB23C1DC()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1AB23C1EC()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AB23C1FC()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1AB23C20C()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1AB23C21C()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1AB23C22C()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1AB23C23C()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1AB23C24C()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1AB23C25C()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1AB23C26C()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1AB23C27C()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1AB23C28C()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1AB23C29C()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1AB23C2AC()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1AB23C2BC()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1AB23C2CC()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AB23C2DC()
{
  return MEMORY[0x1F41853A0]();
}

uint64_t sub_1AB23C2EC()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1AB23C30C()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1AB23C31C()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1AB23C32C()
{
  return MEMORY[0x1F41854C0]();
}

uint64_t sub_1AB23C33C()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1AB23C35C()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1AB23C36C()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1AB23C37C()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1AB23C38C()
{
  return MEMORY[0x1F4185510]();
}

uint64_t sub_1AB23C39C()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1AB23C3AC()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1AB23C3BC()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1AB23C3CC()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1AB23C3DC()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1AB23C3EC()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1AB23C3FC()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1AB23C40C()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1AB23C41C()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1AB23C42C()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1AB23C43C()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1AB23C44C()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1AB23C45C()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1AB23C46C()
{
  return MEMORY[0x1F4185640]();
}

uint64_t sub_1AB23C47C()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1AB23C48C()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1AB23C49C()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1AB23C4AC()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1AB23C4BC()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1AB23C4CC()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1AB23C4DC()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1AB23C4EC()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1AB23C4FC()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1AB23C50C()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1AB23C51C()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1AB23C52C()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1AB23C53C()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1AB23C54C()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1AB23C56C()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1AB23C57C()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1AB23C58C()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1AB23C59C()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1AB23C5AC()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1AB23C5CC()
{
  return MEMORY[0x1F4185AB8]();
}

uint64_t sub_1AB23C5DC()
{
  return MEMORY[0x1F4185B60]();
}

uint64_t sub_1AB23C5EC()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1AB23C5FC()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1AB23C61C()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1AB23C63C()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1AB23C64C()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1AB23C65C()
{
  return MEMORY[0x1F4185DB8]();
}

uint64_t sub_1AB23C66C()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1AB23C67C()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1AB23C68C()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1AB23C6CC()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1AB23C6DC()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1AB23C6EC()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1AB23C6FC()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1AB23C70C()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1AB23C71C()
{
  return MEMORY[0x1F40E6E40]();
}

uint64_t sub_1AB23C72C()
{
  return MEMORY[0x1F4185E38]();
}

uint64_t sub_1AB23C73C()
{
  return MEMORY[0x1F4185E78]();
}

uint64_t sub_1AB23C74C()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1AB23C75C()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1AB23C76C()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1AB23C77C()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1AB23C78C()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1AB23C79C()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1AB23C7AC()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1AB23C7BC()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1AB23C7CC()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1AB23C7DC()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1AB23C7EC()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1AB23C7FC()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1AB23C80C()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1AB23C81C()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1AB23C82C()
{
  return MEMORY[0x1F40E6F30]();
}

uint64_t sub_1AB23C83C()
{
  return MEMORY[0x1F40E6F38]();
}

uint64_t sub_1AB23C84C()
{
  return MEMORY[0x1F40E6F60]();
}

uint64_t sub_1AB23C85C()
{
  return MEMORY[0x1F40E6F68]();
}

uint64_t sub_1AB23C86C()
{
  return MEMORY[0x1F40E6F78]();
}

uint64_t sub_1AB23C87C()
{
  return MEMORY[0x1F40E6F88]();
}

uint64_t sub_1AB23C88C()
{
  return MEMORY[0x1F40E6F98]();
}

uint64_t sub_1AB23C89C()
{
  return MEMORY[0x1F40E6FA0]();
}

uint64_t sub_1AB23C8AC()
{
  return MEMORY[0x1F40E6FC0]();
}

uint64_t sub_1AB23C8BC()
{
  return MEMORY[0x1F40E6FC8]();
}

uint64_t sub_1AB23C8CC()
{
  return MEMORY[0x1F4186138]();
}

uint64_t sub_1AB23C8DC()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1AB23C8EC()
{
  return MEMORY[0x1F4186278]();
}

void sub_1AB23C91C()
{
  while (1)
    ;
}

uint64_t sub_1AB23C92C()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1AB23C96C()
{
  return MEMORY[0x1F41862D8]();
}

uint64_t sub_1AB23C9BC()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1F40D4E10](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1F40D4E28](*(void *)&inSystemSoundID);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x1F40F4AE0]();
}

uint64_t CAImageQueueCreate()
{
  return MEMORY[0x1F40F4AF8]();
}

uint64_t CAImageQueueInsertImage()
{
  return MEMORY[0x1F40F4B70]();
}

uint64_t CAImageQueueInvalidate()
{
  return MEMORY[0x1F40F4B80]();
}

uint64_t CAImageQueueRegisterCVImageBuffer()
{
  return MEMORY[0x1F40F4B90]();
}

uint64_t CAImageQueueSetSize()
{
  return MEMORY[0x1F40F4BC0]();
}

uint64_t CAImageQueueUnregisterBuffer()
{
  return MEMORY[0x1F40F4BC8]();
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

uint64_t CEKDisplayStringForSemanticStyleMakerPreset()
{
  return MEMORY[0x1F410FA78]();
}

uint64_t CEKFontOfSizeAndStyle()
{
  return MEMORY[0x1F410FA80]();
}

uint64_t CEMCreateStringByStrippingEmojiCharacters()
{
  return MEMORY[0x1F4113BB8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7250](alloc, maxLength);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttributes(CFMutableAttributedStringRef aStr, CFRange range, CFDictionaryRef replacement, Boolean clearOtherAttributes)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1F40D86C0](string, range, transform, reverse);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9968]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9998](gray, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A0](gray, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1F40D9A38]();
}

uint64_t CGColorNxMTransformGetTransform()
{
  return MEMORY[0x1F40D9A48]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1F40D9C70]();
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextResetClip(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1F40DA0F0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C0](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C8](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9730]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImagePropertyOrientationFromPXImageOrientation()
{
  while (1)
    ;
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1F40DA9F8]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

uint64_t CGImageWriteEXIFJPEGToPath()
{
  return MEMORY[0x1F40E9A70]();
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC48](provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x1F4166A80](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x1F4114E50]();
}

void CGSizeHash()
{
  while (1)
    ;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

OSStatus CMAudioClockCreate(CFAllocatorRef allocator, CMClockRef *clockOut)
{
  return MEMORY[0x1F40DB850](allocator, clockOut);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC090](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

CMTime *__cdecl CMTimeFoldIntoRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *foldRange)
{
  return (CMTime *)MEMORY[0x1F40DC0F8](retstr, time, foldRange);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

uint64_t CMTimeMultiplyTimeByTimeRatio()
{
  return MEMORY[0x1F40DC188]();
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

uint64_t CPLStatusFromPathManager()
{
  return MEMORY[0x1F413F400]();
}

CFCharacterSetRef CTFontCopyCharacterSet(CTFontRef font)
{
  return (CFCharacterSetRef)MEMORY[0x1F40DF280](font);
}

uint64_t CTFontCopyTallestTextStyleLanguageForString()
{
  return MEMORY[0x1F40DF310]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1F40DF368](font, glyph, matrix);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x1F40DF6C0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1F40DF778](line, *(void *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x1F40DF868](settings, settingCount);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF8B8](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1F40DF8D8](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

uint64_t CTStringIsSuitableForArabicJustification()
{
  return MEMORY[0x1F40DF960]();
}

uint64_t CTStringIsSuitableForVerticalLayout()
{
  return MEMORY[0x1F40DF968]();
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC20](imageBuffer);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC28](imageBuffer);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferCreateFromCVImageBufferRef()
{
  return MEMORY[0x1F40DFCE8]();
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1F40DFE18](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

uint64_t DCIM_CGImageRefFromPLImage()
{
  return MEMORY[0x1F413F940]();
}

uint64_t DCIM_NSStringFromCGRect()
{
  return MEMORY[0x1F413F958]();
}

uint64_t DCIM_blackColor()
{
  return MEMORY[0x1F413F9B0]();
}

uint64_t DCIM_imageWithColor()
{
  return MEMORY[0x1F413F9D8]();
}

uint64_t DCIM_newPLImageWithData()
{
  return MEMORY[0x1F413FA18]();
}

uint64_t DCIM_newPNGRepresentationWithPLImage()
{
  return MEMORY[0x1F413FA30]();
}

uint64_t DCIM_scaleFromPLImage()
{
  return MEMORY[0x1F413FA58]();
}

uint64_t FigGetRotationAngleAndFlipsFromCGAffineTransform()
{
  return MEMORY[0x1F40ED610]();
}

uint64_t GSEventPopRunLoopMode()
{
  return MEMORY[0x1F411C908]();
}

uint64_t GSEventPushRunLoopMode()
{
  return MEMORY[0x1F411C910]();
}

uint64_t ICCreateCorrectionHomographiesWithNewImageCoordinates()
{
  return MEMORY[0x1F4124CF0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1F4122BD8]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1F4122BE0]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

uint64_t MAPurgeCatalogsWithPurpose()
{
  return MEMORY[0x1F412F598]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x1F40ECE10]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x1F40ECE18]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x1F40ECE20]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x1F40ECE48]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  MEMORY[0x1F40ECE50](latitude);
  return result;
}

BOOL MKMapRectContainsPoint(MKMapRect rect, MKMapPoint point)
{
  return MEMORY[0x1F40ECE58]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL MKMapRectContainsRect(MKMapRect rect1, MKMapRect rect2)
{
  return MEMORY[0x1F40ECE60]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t MKMapRectForCoordinateRegion()
{
  return MEMORY[0x1F40ECE68]();
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  MEMORY[0x1F40ECE70]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

MKMapRect MKMapRectIntersection(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x1F40ECE78]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  return MEMORY[0x1F40ECE80]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

MKMapRect MKMapRectOffset(MKMapRect rect, double dx, double dy)
{
  MEMORY[0x1F40ECE88]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

MKMapRect MKMapRectRemainder(MKMapRect rect)
{
  MEMORY[0x1F40ECE90]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL MKMapRectSpans180thMeridian(MKMapRect rect)
{
  return MEMORY[0x1F40ECE98]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x1F40ECEA0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  MEMORY[0x1F40ECEA8]((__n128)a, *(__n128 *)&a.y, (__n128)b, *(__n128 *)&b.y);
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1F40EDE48]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_mainScreenHeight()
{
  return MEMORY[0x1F417CEE0]();
}

uint64_t MobileGestalt_get_mainScreenWidth()
{
  return MEMORY[0x1F417CEE8]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1F417CEF8]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4166A98](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromPLCloudFeedEntryFilter()
{
  return MEMORY[0x1F413F408]();
}

void NSStringFromPXEdgeInsets()
{
  while (1)
    ;
}

void NSStringFromPXGSpriteIndexRange()
{
  while (1)
    ;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NUPixelRectIsEmpty()
{
  return MEMORY[0x1F4130A70]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x1F4130AB0]();
}

uint64_t PELocalizedString()
{
  return MEMORY[0x1F4144170]();
}

uint64_t PFAllPlatformsLivePhotoBundleTypes()
{
  return MEMORY[0x1F4140630]();
}

uint64_t PFArrayRandomObjectWithRandomNumberGenerator()
{
  return MEMORY[0x1F4140638]();
}

uint64_t PFBitmaskDescription()
{
  return MEMORY[0x1F4140640]();
}

uint64_t PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround()
{
  return MEMORY[0x1F4140648]();
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x1F4140660]();
}

uint64_t PFDeviceScreenScale()
{
  return MEMORY[0x1F4140670]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x1F4140678]();
}

uint64_t PFDisplayAssetPlaybackStyleDescription()
{
  return MEMORY[0x1F4140688]();
}

uint64_t PFExists()
{
  return MEMORY[0x1F413F310]();
}

uint64_t PFFigCreateCVPixelBufferFromURL()
{
  return MEMORY[0x1F41406B8]();
}

uint64_t PFFigEncodeCVPixelBufferToURL()
{
  return MEMORY[0x1F41406C8]();
}

uint64_t PFFilter()
{
  return MEMORY[0x1F413F318]();
}

uint64_t PFFrameApplyingContentsRectInBounds()
{
  return MEMORY[0x1F41406E0]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x1F41406F8]();
}

uint64_t PFLocalizedStringWithValidatedFormat()
{
  return MEMORY[0x1F413F330]();
}

uint64_t PFMap()
{
  return MEMORY[0x1F413F338]();
}

uint64_t PFMessagesStackLayoutGeometryGetScale()
{
  return MEMORY[0x1F4140700]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1F413F348]();
}

uint64_t PFOSVariantHasInternalUI()
{
  return MEMORY[0x1F413F350]();
}

uint64_t PFPosterShuffleSmartAlbumsDescription()
{
  return MEMORY[0x1F4140788]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x1F413F368]();
}

uint64_t PFSceneTaxonomyEnumerateTopologicallyOrderedNodes()
{
  return MEMORY[0x1F41407A0]();
}

uint64_t PFSceneTaxonomyNodeExtendedSceneClassId()
{
  return MEMORY[0x1F41407B8]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x1F41407E8]();
}

uint64_t PFShuffledArrayWithRandomNumberGenerator()
{
  return MEMORY[0x1F4140828]();
}

uint64_t PFStoryColorGradeCategoryFromValenceArousal()
{
  return MEMORY[0x1F4140830]();
}

uint64_t PFStoryColorGradeCategoryGetArousal()
{
  return MEMORY[0x1F4140838]();
}

uint64_t PFStoryColorGradeCategoryNamed()
{
  return MEMORY[0x1F4140840]();
}

uint64_t PFStoryColorGradeKindToString()
{
  return MEMORY[0x1F4140850]();
}

uint64_t PFStoryColorGradeSupportedCategories()
{
  return MEMORY[0x1F4140858]();
}

uint64_t PFStoryDurationInfoDescription()
{
  return MEMORY[0x1F4140860]();
}

uint64_t PFStoryOverallDurationInfoDescription()
{
  return MEMORY[0x1F4140868]();
}

uint64_t PFStoryOverallDurationKindDescription()
{
  return MEMORY[0x1F4140870]();
}

uint64_t PFStoryRecipeClipMotionStyleDescription()
{
  return MEMORY[0x1F4140880]();
}

uint64_t PFStoryRecipeClipTransitionKindDescription()
{
  return MEMORY[0x1F4140888]();
}

uint64_t PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision()
{
  return MEMORY[0x1F4140890]();
}

uint64_t PFStoryRecipeSongPaceDescription()
{
  return MEMORY[0x1F4140898]();
}

uint64_t PFStoryRecipeSongPaceFromVisualTempo()
{
  return MEMORY[0x1F41408A0]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x1F413F390]();
}

uint64_t PFStringWithValidatedFormatAndLocale()
{
  return MEMORY[0x1F413F398]();
}

uint64_t PFUIGetLog()
{
  return MEMORY[0x1F413F3A0]();
}

uint64_t PHAssetDeferredProcessingInvalidatesContentWhenCompleted()
{
  return MEMORY[0x1F40F4720]();
}

uint64_t PHAssetDeferredProcessingNeededDescription()
{
  return MEMORY[0x1F40F4728]();
}

uint64_t PHAssetExportRequestPassthroughConversionIsSupportedByType()
{
  return MEMORY[0x1F40F4730]();
}

uint64_t PHAssetImportSourceDescription()
{
  return MEMORY[0x1F40F4738]();
}

uint64_t PHAssetMediaAnalysisStringsWithMultipleAudioClassifications()
{
  return MEMORY[0x1F40F4748]();
}

uint64_t PHAssetMediaAnalysisSyndicationProcessingValueDescription()
{
  return MEMORY[0x1F40F4750]();
}

uint64_t PHAssetMediaSubtypesDebugDescription()
{
  return MEMORY[0x1F40F4758]();
}

uint64_t PHAssetMediaTypeDebugDescription()
{
  return MEMORY[0x1F40F4760]();
}

uint64_t PHAssetOriginalLocationForAsset()
{
  return MEMORY[0x1F40F4768]();
}

uint64_t PHAssetPlaybackStyleDebugDescription()
{
  return MEMORY[0x1F40F4770]();
}

uint64_t PHAssetPlaybackVariationDebugDescription()
{
  return MEMORY[0x1F40F4778]();
}

uint64_t PHAssetSyndicationEligibilityDescription()
{
  return MEMORY[0x1F40F4780]();
}

uint64_t PHAssetSyndicationEligibilityShortDescription()
{
  return MEMORY[0x1F40F4788]();
}

uint64_t PHAssetSyndicationProcessingVersionDescription()
{
  return MEMORY[0x1F40F4798]();
}

uint64_t PHDescriptionForSharingComposition()
{
  return MEMORY[0x1F40F47A0]();
}

uint64_t PHMemoryCreationTypeDescription()
{
  return MEMORY[0x1F40F47B8]();
}

uint64_t PHMemoryMoodForString()
{
  return MEMORY[0x1F40F47C0]();
}

uint64_t PHMemoryPendingStateDescription()
{
  return MEMORY[0x1F40F47C8]();
}

uint64_t PHPhotosHighlightTypeConsideredTrip()
{
  return MEMORY[0x1F40F47E0]();
}

uint64_t PHQuestionOptionsDebugDescription()
{
  return MEMORY[0x1F40F47F0]();
}

uint64_t PHShortDescriptionForPhotosHighlightCategory()
{
  return MEMORY[0x1F40F47F8]();
}

uint64_t PHShortDescriptionForPhotosHighlightEnrichmentState()
{
  return MEMORY[0x1F40F4800]();
}

uint64_t PHShortDescriptionForPhotosHighlightKind()
{
  return MEMORY[0x1F40F4808]();
}

uint64_t PHShortDescriptionForPhotosHighlightType()
{
  return MEMORY[0x1F40F4810]();
}

uint64_t PHShortDescriptionForPhotosHighlightVisibilityState()
{
  return MEMORY[0x1F40F4818]();
}

uint64_t PHStringForMemoryMood()
{
  return MEMORY[0x1F40F4820]();
}

uint64_t PHSuggestionNotificationStateStringWithNotificationState()
{
  return MEMORY[0x1F40F4830]();
}

uint64_t PHSuggestionStateStringWithState()
{
  return MEMORY[0x1F40F4838]();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x1F40F4840]();
}

uint64_t PHSuggestionStringWithType()
{
  return MEMORY[0x1F40F4848]();
}

uint64_t PIAutoLoopFlavorFromString()
{
  return MEMORY[0x1F413F3B8]();
}

uint64_t PLAlbumImportOperationDebugDescription()
{
  return MEMORY[0x1F413F410]();
}

uint64_t PLAnimationTelemetryGetLog()
{
  return MEMORY[0x1F413FAD8]();
}

uint64_t PLAppIntentsGetLog()
{
  return MEMORY[0x1F413FAE0]();
}

uint64_t PLAudioPlaybackGetLog()
{
  return MEMORY[0x1F413FB30]();
}

uint64_t PLBoopGetLog()
{
  return MEMORY[0x1F413FB60]();
}

uint64_t PLCMMTitleAndSubtitleForTitleAndFallbackDates()
{
  return MEMORY[0x1F413F438]();
}

uint64_t PLCPLErrorDebugDescription()
{
  return MEMORY[0x1F413F440]();
}

uint64_t PLCPLRecordDidNotifyDeleteBehaviorForCurrentAccount()
{
  return MEMORY[0x1F413F470]();
}

uint64_t PLCPLShouldNotifyDeleteBehaviorForCurrentAccount()
{
  return MEMORY[0x1F413F480]();
}

uint64_t PLCPLShouldRequireStorageUpgradeForError()
{
  return MEMORY[0x1F413F488]();
}

uint64_t PLCanEnableCloudPhotoLibraryForAccount()
{
  return MEMORY[0x1F413F498]();
}

uint64_t PLCloudFeedGetLog()
{
  return MEMORY[0x1F413FBE8]();
}

uint64_t PLCloudPhotoLibraryLocalModeEnabled()
{
  return MEMORY[0x1F413F4A0]();
}

uint64_t PLContentPrivacyUIGetLog()
{
  return MEMORY[0x1F413FC08]();
}

uint64_t PLCuratedLibraryGetLog()
{
  return MEMORY[0x1F413FC60]();
}

uint64_t PLCurationAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F4C8]();
}

uint64_t PLDragAndDropGetLog()
{
  return MEMORY[0x1F413FCE8]();
}

uint64_t PLDuplicateDetectionGetLog()
{
  return MEMORY[0x1F413FCF0]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1F413FD20]();
}

uint64_t PLGadgetsGetLog()
{
  return MEMORY[0x1F413FD40]();
}

uint64_t PLGenericImageNameForExtension()
{
  return MEMORY[0x1F413F520]();
}

uint64_t PLGraphAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F548]();
}

uint64_t PLGridInlinePlaybackGetLog()
{
  return MEMORY[0x1F413FD68]();
}

uint64_t PLGridZeroGetLog()
{
  return MEMORY[0x1F413FD70]();
}

uint64_t PLHasHomeButton()
{
  return MEMORY[0x1F413FD80]();
}

uint64_t PLHasInternalDiagnostics()
{
  return MEMORY[0x1F413FD88]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x1F413FD90]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1F413FDB8]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1F413FE10]();
}

uint64_t PLIsChinaSKU()
{
  return MEMORY[0x1F413FE28]();
}

uint64_t PLIsCloudPhotoLibraryEnabledForCurrentUser()
{
  return MEMORY[0x1F413F560]();
}

uint64_t PLIsContentPrivacyEnabled()
{
  return MEMORY[0x1F413FE38]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x1F413FE88]();
}

uint64_t PLIsLockdownMode()
{
  return MEMORY[0x1F413FEA8]();
}

uint64_t PLIsMobileSlideShow()
{
  return MEMORY[0x1F413FEC0]();
}

uint64_t PLIsPeopleViewService()
{
  return MEMORY[0x1F413FEE0]();
}

uint64_t PLIsPhotoPicker()
{
  return MEMORY[0x1F413FEE8]();
}

uint64_t PLIsPhotosAppAnyPlatform()
{
  return MEMORY[0x1F413FF00]();
}

uint64_t PLIsPhotosMessagesApp()
{
  return MEMORY[0x1F413FF08]();
}

uint64_t PLIsPhotosReliveWidget()
{
  return MEMORY[0x1F413FF10]();
}

uint64_t PLIsPreferences()
{
  return MEMORY[0x1F413FF18]();
}

uint64_t PLIsSharedAlbumsAllowed()
{
  return MEMORY[0x1F413FF30]();
}

uint64_t PLIsSharedLibrarySuggestionsEnabled()
{
  return MEMORY[0x1F413FF40]();
}

uint64_t PLIsSpotlight()
{
  return MEMORY[0x1F413FF48]();
}

uint64_t PLIsSystemLibraryAccessProhibited()
{
  return MEMORY[0x1F413FF60]();
}

uint64_t PLIsXcTest()
{
  return MEMORY[0x1F413FF80]();
}

uint64_t PLLemonadeGetLog()
{
  return MEMORY[0x1F413FF90]();
}

uint64_t PLLiveStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x1F413F5F0]();
}

uint64_t PLLocalizedCountDescription()
{
  return MEMORY[0x1F413FFC0]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1F413FFC8]();
}

uint64_t PLLocalizedStringForAction()
{
  return MEMORY[0x1F413FFF8]();
}

uint64_t PLManagedAssetPredicateToFetchAssetsSuggestedForSharing()
{
  return MEMORY[0x1F413F628]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F640]();
}

uint64_t PLMemoriesGetLog()
{
  return MEMORY[0x1F4140018]();
}

uint64_t PLOneUpGetLog()
{
  return MEMORY[0x1F4140068]();
}

uint64_t PLParseHashtags()
{
  return MEMORY[0x1F413F698]();
}

uint64_t PLPeopleGetLog()
{
  return MEMORY[0x1F4140088]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x1F41400B8]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1F41400C0]();
}

uint64_t PLPhotoLibraryServicesFrameworkBundle()
{
  return MEMORY[0x1F41400E0]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1F41400F0]();
}

uint64_t PLPhotosSearchCurationGetLog()
{
  return MEMORY[0x1F4140118]();
}

uint64_t PLPhotosSearchGetLog()
{
  return MEMORY[0x1F4140120]();
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return MEMORY[0x1F4140130]();
}

uint64_t PLPhysicalScreenScale()
{
  return MEMORY[0x1F4140138]();
}

uint64_t PLPrettyPrintPList()
{
  return MEMORY[0x1F413F6C8]();
}

uint64_t PLProgressDescription()
{
  return MEMORY[0x1F413F6F0]();
}

uint64_t PLRecordLibrarySizeWithReason()
{
  return MEMORY[0x1F413F700]();
}

uint64_t PLRecordiCPLEnableState()
{
  return MEMORY[0x1F413F708]();
}

uint64_t PLRelatedAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F718]();
}

uint64_t PLRelatedGetLog()
{
  return MEMORY[0x1F4140220]();
}

uint64_t PLRelativePrettyDateForDate()
{
  return MEMORY[0x1F4140228]();
}

uint64_t PLResourceLocalAvailabilityName()
{
  return MEMORY[0x1F413F748]();
}

uint64_t PLResourceLocalAvailabilityTargetName()
{
  return MEMORY[0x1F413F750]();
}

uint64_t PLResourceRemoteAvailabilityName()
{
  return MEMORY[0x1F413F778]();
}

uint64_t PLResourceTypeName()
{
  return MEMORY[0x1F413F780]();
}

uint64_t PLSearchHomeItemTypeName()
{
  return MEMORY[0x1F413F800]();
}

uint64_t PLSearchIndexCategoriesForCategoryMask()
{
  return MEMORY[0x1F413F810]();
}

uint64_t PLSearchIndexCategoryIsPerson()
{
  return MEMORY[0x1F413F818]();
}

uint64_t PLSearchIndexCategoryIsPet()
{
  return MEMORY[0x1F413F820]();
}

uint64_t PLSearchIndexCategoryMaskForCategory()
{
  return MEMORY[0x1F413F828]();
}

uint64_t PLSearchUIParsecAnalyticsGetLog()
{
  return MEMORY[0x1F4140320]();
}

uint64_t PLSearchUIQueryGetLog()
{
  return MEMORY[0x1F4140328]();
}

uint64_t PLSearchableIdentifierFromMessagesSyndicationID()
{
  return MEMORY[0x1F413F880]();
}

uint64_t PLServicesLivePortraitLocalizedFrameworkString()
{
  return MEMORY[0x1F4140338]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x1F4140340]();
}

uint64_t PLServicesSharedLibraryLocalizedFrameworkString()
{
  return MEMORY[0x1F4140350]();
}

uint64_t PLSetFeaturedContentAllowed()
{
  return MEMORY[0x1F4140358]();
}

uint64_t PLSetSharedLibraryAssetTrashedByParticipantsNotificationEnabled()
{
  return MEMORY[0x1F4140360]();
}

uint64_t PLSetSharedLibrarySuggestionsEnabled()
{
  return MEMORY[0x1F4140368]();
}

uint64_t PLSharedAlbumsGetLog()
{
  return MEMORY[0x1F4140378]();
}

uint64_t PLSharedCountFormatter()
{
  return MEMORY[0x1F4140380]();
}

uint64_t PLSharedLibraryGetLog()
{
  return MEMORY[0x1F4140388]();
}

uint64_t PLSharingGetLog()
{
  return MEMORY[0x1F4140390]();
}

uint64_t PLShouldConstructDisplayNameForAppBundle()
{
  return MEMORY[0x1F413F8C0]();
}

uint64_t PLSidebarGetLog()
{
  return MEMORY[0x1F41403A0]();
}

uint64_t PLStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x1F413F8C8]();
}

uint64_t PLStoryGetLog()
{
  return MEMORY[0x1F41403E0]();
}

uint64_t PLStringFromPLQueryComparatorType()
{
  return MEMORY[0x1F41403F0]();
}

uint64_t PLStringFromPLQueryConjunction()
{
  return MEMORY[0x1F41403F8]();
}

uint64_t PLStringFromPLQueryKey()
{
  return MEMORY[0x1F4140400]();
}

uint64_t PLStringFromPLQueryUnit()
{
  return MEMORY[0x1F4140408]();
}

uint64_t PLSuffixForItems()
{
  return MEMORY[0x1F4140438]();
}

uint64_t PLSuppressionContextForMomentShareUUID()
{
  return MEMORY[0x1F4140440]();
}

uint64_t PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs()
{
  return MEMORY[0x1F413F8E0]();
}

uint64_t PLSyndicationGetLog()
{
  return MEMORY[0x1F4140450]();
}

uint64_t PLSyndicationUIGetLog()
{
  return MEMORY[0x1F4140458]();
}

uint64_t PLTimelineGetLog()
{
  return MEMORY[0x1F4140468]();
}

uint64_t PLTipsGetLog()
{
  return MEMORY[0x1F4140470]();
}

uint64_t PLUIActionsGetLog()
{
  return MEMORY[0x1F4140480]();
}

uint64_t PLUIGetLog()
{
  return MEMORY[0x1F4140488]();
}

uint64_t PLUpNextGetLog()
{
  return MEMORY[0x1F41404D8]();
}

uint64_t PLUserSmartAlbumGetLog()
{
  return MEMORY[0x1F41404F0]();
}

uint64_t PLUserStatusGetLog()
{
  return MEMORY[0x1F41404F8]();
}

uint64_t PLUserStatusUIGetLog()
{
  return MEMORY[0x1F4140500]();
}

uint64_t PLVideoPlaybackGetLog()
{
  return MEMORY[0x1F4140518]();
}

uint64_t PLVisualIntelligenceGetLog()
{
  return MEMORY[0x1F4140520]();
}

uint64_t PLWallpaperGetLog()
{
  return MEMORY[0x1F4140528]();
}

uint64_t PNExternalAssetRelevanceProcessingVersionDescription()
{
  return MEMORY[0x1F4141CA0]();
}

uint64_t PTGroupIDIsValid()
{
  return MEMORY[0x1F4145B48]();
}

uint64_t PUPhotosAssetViewShowDebugOverlayView()
{
  return MEMORY[0x1F40F4A28]();
}

void PXAffineTransformDecomposeTranslationScaleRotation()
{
  while (1)
    ;
}

void PXAffineTransformMakeFromRects()
{
  while (1)
    ;
}

void PXAffineTransformMakeHorizontalFlip()
{
  while (1)
    ;
}

void PXAffineTransformMakeRotationAroundPoint()
{
  while (1)
    ;
}

void PXAffineTransformMakeScaleAndRotationAroundPoint()
{
  while (1)
    ;
}

void PXAffineTransformMakeScaleFromPoint()
{
  while (1)
    ;
}

void PXAffineTransformMakeWithTranslationScaleRotation()
{
  while (1)
    ;
}

void PXAffineTransformMakeWithTranslationScaleRotationTransform()
{
  while (1)
    ;
}

void PXAffineTransformOffsetFixpoint()
{
  while (1)
    ;
}

void PXArrayByMovingObjectFromIndexToIndex()
{
  while (1)
    ;
}

void PXArrayFromFrequencySortAndDeduplicationOfNSStringSet()
{
  while (1)
    ;
}

void PXAspectRatioIsPortrait()
{
  while (1)
    ;
}

void PXAssertGetLog()
{
  while (1)
    ;
}

void PXAssetBadgeInfoCreateWithBadges()
{
  while (1)
    ;
}

void PXAssetBadgeInfoCreateWithDuration()
{
  while (1)
    ;
}

void PXAssetBadgeInfoEqualToBadgeInfo()
{
  while (1)
    ;
}

void PXAssetBadgeInfoIsActionable()
{
  while (1)
    ;
}

void PXAssetBadgeInfoIsActionableDisabled()
{
  while (1)
    ;
}

void PXAssetBadgeInfoIsNull()
{
  while (1)
    ;
}

void PXAssetBadgeInfoIsToggleable()
{
  while (1)
    ;
}

void PXAssetBadgeInfoIsToggledOn()
{
  while (1)
    ;
}

void PXAttributedStringForBadgeText()
{
  while (1)
    ;
}

void PXAxisFromUICollectionViewScrollDirection()
{
  while (1)
    ;
}

void PXAxisTransposed()
{
  while (1)
    ;
}

void PXCATransactionShouldLoadContentImmediately()
{
  while (1)
    ;
}

void PXCGImageGetSizeWithOrientation()
{
  while (1)
    ;
}

void PXCanonicalErrorForError()
{
  while (1)
    ;
}

void PXCappedFontWithTextStyle()
{
  while (1)
    ;
}

void PXCappedFontWithTextStyleAndWeight()
{
  while (1)
    ;
}

void PXCappedFontWithTextStyleSymbolicTraits()
{
  while (1)
    ;
}

void PXClamp()
{
  while (1)
    ;
}

void PXContentOffsetFlippedHorizontally()
{
  while (1)
    ;
}

void PXCreateCGImageFromImageSourceWithMaxPixelSize()
{
  while (1)
    ;
}

void PXCreateMutableIntegerArrayRef()
{
  while (1)
    ;
}

void PXDataSourceIdentifierMakeUnique()
{
  while (1)
    ;
}

void PXDebugDescriptionForError()
{
  while (1)
    ;
}

void PXDegreesToRadians()
{
  while (1)
    ;
}

void PXDerivative()
{
  while (1)
    ;
}

void PXDisplayAssetCollectionCurationLengthDescription()
{
  while (1)
    ;
}

void PXDisplayAssetColorNormalizationData()
{
  while (1)
    ;
}

void PXDisplayAssetDetailedCountsDescription()
{
  while (1)
    ;
}

void PXDisplayAssetDetailedCountsSubtract()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultEmpty()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultFastEnumeration()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultFromArray()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultFromAsset()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultFromFetchResults()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultHash()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultScaledWithMultiplier()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultSubfetchResultWithIndexSet()
{
  while (1)
    ;
}

void PXDisplayAssetFetchResultSubfetchResultWithRange()
{
  while (1)
    ;
}

void PXDisplayAssetPlaybackStyleDescription()
{
  while (1)
    ;
}

void PXDistanceBetweenPoints()
{
  while (1)
    ;
}

void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets()
{
  while (1)
    ;
}

void PXEdgeInsetsAdd()
{
  while (1)
    ;
}

void PXEdgeInsetsAddValueForEdges()
{
  while (1)
    ;
}

void PXEdgeInsetsApproximatelyEqualToEdgeInsets()
{
  while (1)
    ;
}

void PXEdgeInsetsBetweenRects()
{
  while (1)
    ;
}

void PXEdgeInsetsByFlippingHorizontally()
{
  while (1)
    ;
}

void PXEdgeInsetsEqualToEdgeInsets()
{
  while (1)
    ;
}

void PXEdgeInsetsEqualToEdgeInsetsForEdges()
{
  while (1)
    ;
}

void PXEdgeInsetsForEdges()
{
  while (1)
    ;
}

void PXEdgeInsetsForRectsFromEdgeInsetsForRect()
{
  while (1)
    ;
}

void PXEdgeInsetsInsetRect()
{
  while (1)
    ;
}

void PXEdgeInsetsInsetRectEdges()
{
  while (1)
    ;
}

void PXEdgeInsetsInsetSize()
{
  while (1)
    ;
}

void PXEdgeInsetsInvert()
{
  while (1)
    ;
}

void PXEdgeInsetsIsNull()
{
  while (1)
    ;
}

void PXEdgeInsetsIsZero()
{
  while (1)
    ;
}

void PXEdgeInsetsMake()
{
  while (1)
    ;
}

void PXEdgeInsetsMakeAll()
{
  while (1)
    ;
}

void PXEdgeInsetsMakeWithValueForEdges()
{
  while (1)
    ;
}

void PXEdgeInsetsMax()
{
  while (1)
    ;
}

void PXEdgeInsetsRoundToPixel()
{
  while (1)
    ;
}

void PXEdgeInsetsScale()
{
  while (1)
    ;
}

void PXEdgeInsetsWithValueForEdges()
{
  while (1)
    ;
}

void PXEdgesFlippedHorizontally()
{
  while (1)
    ;
}

void PXEdgesFlippedVertically()
{
  while (1)
    ;
}

void PXEdgesForAxis()
{
  while (1)
    ;
}

void PXEdgesFromCGRectEdge()
{
  while (1)
    ;
}

void PXEdgesGetCGRectEdge()
{
  while (1)
    ;
}

void PXEnumeratePageKeysForRect()
{
  while (1)
    ;
}

void PXEnumerateSubrangesMatchingTestUsingBlock()
{
  while (1)
    ;
}

void PXExists()
{
  while (1)
    ;
}

void PXFilter()
{
  while (1)
    ;
}

void PXFilterArrayForObjectsOfClass()
{
  while (1)
    ;
}

void PXFind()
{
  while (1)
    ;
}

void PXFirstIndexInSortedRangePassingTest()
{
  while (1)
    ;
}

void PXFlatMap()
{
  while (1)
    ;
}

void PXFloatApproximatelyEqualToFloat()
{
  while (1)
    ;
}

void PXFloatAtan()
{
  while (1)
    ;
}

void PXFloatAtan2()
{
  while (1)
    ;
}

void PXFloatByLinearlyInterpolatingFloats()
{
  while (1)
    ;
}

void PXFloatByParabolicallyInterpolatingFloats()
{
  while (1)
    ;
}

void PXFloatCeilingToPixel()
{
  while (1)
    ;
}

void PXFloatCompare()
{
  while (1)
    ;
}

void PXFloatCos()
{
  while (1)
    ;
}

void PXFloatDenormalize()
{
  while (1)
    ;
}

void PXFloatEqualToFloatWithTolerance()
{
  while (1)
    ;
}

void PXFloatFloorToPixel()
{
  while (1)
    ;
}

void PXFloatGreaterThanFloat()
{
  while (1)
    ;
}

void PXFloatHypot()
{
  while (1)
    ;
}

void PXFloatLog()
{
  while (1)
    ;
}

void PXFloatLog2()
{
  while (1)
    ;
}

void PXFloatNormalize()
{
  while (1)
    ;
}

void PXFloatPow()
{
  while (1)
    ;
}

void PXFloatProgressBetween()
{
  while (1)
    ;
}

void PXFloatRoundInDirection()
{
  while (1)
    ;
}

void PXFloatRoundToPixel()
{
  while (1)
    ;
}

void PXFloatSaturate()
{
  while (1)
    ;
}

void PXFloatSign()
{
  while (1)
    ;
}

void PXFloatSin()
{
  while (1)
    ;
}

void PXFloatTanh()
{
  while (1)
    ;
}

void PXFontCanEncodeString()
{
  while (1)
    ;
}

void PXFontCreate()
{
  while (1)
    ;
}

void PXFontScaleForTextStyle()
{
  while (1)
    ;
}

void PXFontWithTextStyle()
{
  while (1)
    ;
}

void PXFontWithTextStyleAndWeight()
{
  while (1)
    ;
}

void PXFontWithTextStyleSymbolicTraits()
{
  while (1)
    ;
}

void PXFontWithTextStyleSymbolicTraitsAndWeight()
{
  while (1)
    ;
}

void PXFrameRateRangeTypeGetCAFrameRateRange()
{
  while (1)
    ;
}

void PXGAssertErrValidFloat()
{
  while (1)
    ;
}

void PXGAssertErrValidPoint()
{
  while (1)
    ;
}

void PXGAssertErrValidRect()
{
  while (1)
    ;
}

void PXGAssertErrValidSize()
{
  while (1)
    ;
}

void PXGBytesPerPixelForMetalPixelFormat()
{
  while (1)
    ;
}

void PXGCGImageGetOpaque()
{
  while (1)
    ;
}

void PXGCameraForVisibleRect()
{
  while (1)
    ;
}

void PXGClearColorFromColor()
{
  while (1)
    ;
}

void PXGColorOpcodeDescription()
{
  while (1)
    ;
}

void PXGColorSpaceEqual()
{
  while (1)
    ;
}

void PXGColorSpaceNameFromCFStringRef()
{
  while (1)
    ;
}

void PXGColorSpaceSupportsExtendedRange()
{
  while (1)
    ;
}

void PXGCornerRadiusByLinearlyInterpolatingCornerRadii()
{
  while (1)
    ;
}

void PXGCornerRadiusDescription()
{
  while (1)
    ;
}

void PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect()
{
  while (1)
    ;
}

void PXGCornerRadiusIsNull()
{
  while (1)
    ;
}

void PXGCreateBurstImageStackFromImage()
{
  while (1)
    ;
}

void PXGCreateCGImageWithDrawBlock()
{
  while (1)
    ;
}

void PXGCreateMetalTextureFromBytesInCGImage()
{
  while (1)
    ;
}

void PXGCreateMetalTextureToRenderCIImage()
{
  while (1)
    ;
}

void PXGCreateMetalTexturesFromIOSurface()
{
  while (1)
    ;
}

void PXGCreateMetalTexturesFromPixelBuffer()
{
  while (1)
    ;
}

void PXGDarkPlaceholderImage()
{
  while (1)
    ;
}

void PXGDeviceIsKnownToHaveExtendedColorDisplay()
{
  while (1)
    ;
}

void PXGGetColorSpace()
{
  while (1)
    ;
}

void PXGGetColorSpaceName()
{
  while (1)
    ;
}

void PXGGetReconciledColorSpace()
{
  while (1)
    ;
}

void PXGImageDataSpecDescription()
{
  while (1)
    ;
}

void PXGLightPlaceholderImage()
{
  while (1)
    ;
}

void PXGMaxTextureSize()
{
  while (1)
    ;
}

void PXGMediaKindDescription()
{
  while (1)
    ;
}

void PXGMediaKindGetSupportedResize()
{
  while (1)
    ;
}

void PXGMetalCompatibleImageByRedrawingCGImage()
{
  while (1)
    ;
}

void PXGMetalPixelFormatForCIImage()
{
  while (1)
    ;
}

void PXGOffscreenMetalPixelFormatForDrawableFormat()
{
  while (1)
    ;
}

void PXGPixelFormatNameToMetalFormat()
{
  while (1)
    ;
}

void PXGPositionDescription()
{
  while (1)
    ;
}

void PXGRectForTopItemInBurstStackWithRect()
{
  while (1)
    ;
}

void PXGRequiresColorMatching()
{
  while (1)
    ;
}

void PXGResizeRect()
{
  while (1)
    ;
}

void PXGSectionedSpriteTagDecompose()
{
  while (1)
    ;
}

void PXGSectionedSpriteTagGetDataSourceIdentifierHash()
{
  while (1)
    ;
}

void PXGSectionedSpriteTagGetIndexPath()
{
  while (1)
    ;
}

void PXGSectionedSpriteTagMake()
{
  while (1)
    ;
}

void PXGShaderFlagsDescription()
{
  while (1)
    ;
}

void PXGSpriteApplyTransform()
{
  while (1)
    ;
}

void PXGSpriteGeometryTransformDescription()
{
  while (1)
    ;
}

void PXGSpriteIndexRangeIntersection()
{
  while (1)
    ;
}

void PXGSpriteIndexesEnumerateRangesForPositions()
{
  while (1)
    ;
}

void PXGSpriteInfoDescription()
{
  while (1)
    ;
}

void PXGSpriteInfoFlagsDescription()
{
  while (1)
    ;
}

void PXGSpriteStyleDescription()
{
  while (1)
    ;
}

void PXGSpriteStyleUnionClippingRect()
{
  while (1)
    ;
}

void PXGSpriteTextureInfoOrientationFromCGAffineTransform()
{
  while (1)
    ;
}

void PXGSpriteTextureInfoOrientationFromCGOrientation()
{
  while (1)
    ;
}

void PXGSpriteTextureInfoOrientationToCGAffineTransform()
{
  while (1)
    ;
}

void PXGSpriteTextureInfoOrientationToCGOrientation()
{
  while (1)
    ;
}

void PXGStringForOSType()
{
  while (1)
    ;
}

void PXGSupportedPixelBufferFormats()
{
  while (1)
    ;
}

void PXGTungstenGetLog()
{
  while (1)
    ;
}

void PXGUncompressedTypeForOSType()
{
  while (1)
    ;
}

void PXGYCbCrMatrixIsVideoRange()
{
  while (1)
    ;
}

void PXImageDynamicRangeIsGreaterThanStandard()
{
  while (1)
    ;
}

void PXIndexPathFromSimpleIndexPath()
{
  while (1)
    ;
}

void PXInsetRectWithValueForEdges()
{
  while (1)
    ;
}

void PXIsPhotoPicker()
{
  while (1)
    ;
}

void PXIsSyncCallback()
{
  while (1)
    ;
}

void PXIterateAsynchronously()
{
  while (1)
    ;
}

void PXLargestSalientAspectFilledCropRect()
{
  while (1)
    ;
}

void PXLastIndexInSortedRangePassingTest()
{
  while (1)
    ;
}

void PXLocalizedVideoDuration()
{
  while (1)
    ;
}

void PXMap()
{
  while (1)
    ;
}

void PXMapValueFromRangeToNewRange()
{
  while (1)
    ;
}

void PXMatrixMakeOrthoProjection()
{
  while (1)
    ;
}

void PXMatrixMakePerspectiveProjection()
{
  while (1)
    ;
}

void PXMatrixMakeScale()
{
  while (1)
    ;
}

void PXMatrixMakeTranslation()
{
  while (1)
    ;
}

void PXMaxRectEdgeForAxis()
{
  while (1)
    ;
}

void PXMediaTypeForAssets()
{
  while (1)
    ;
}

void PXMinRectEdgeForAxis()
{
  while (1)
    ;
}

void PXPageAlignedRectForCGPoint()
{
  while (1)
    ;
}

void PXPageKeyForCGPoint()
{
  while (1)
    ;
}

void PXPerformWithSyncTokenOnQueue()
{
  while (1)
    ;
}

void PXPixelSizeAreaIsZero()
{
  while (1)
    ;
}

void PXPlatformImageDynamicRangeFromPXImageDynamicRange()
{
  while (1)
    ;
}

void PXPointAdd()
{
  while (1)
    ;
}

void PXPointApproximatelyEqualToPoint()
{
  while (1)
    ;
}

void PXPointByLinearlyInterpolatingPoints()
{
  while (1)
    ;
}

void PXPointCeilingToPixel()
{
  while (1)
    ;
}

void PXPointConvertFromCoordinateSpaceToCoordinateSpace()
{
  while (1)
    ;
}

void PXPointDenormalize()
{
  while (1)
    ;
}

void PXPointDescription()
{
  while (1)
    ;
}

void PXPointIsNull()
{
  while (1)
    ;
}

void PXPointIsValid()
{
  while (1)
    ;
}

void PXPointMultiplyWithFloat()
{
  while (1)
    ;
}

void PXPointNormalize()
{
  while (1)
    ;
}

void PXPointRoundToPixel()
{
  while (1)
    ;
}

void PXPointSetValueForAxis()
{
  while (1)
    ;
}

void PXPointSubtract()
{
  while (1)
    ;
}

void PXPointValueForAxis()
{
  while (1)
    ;
}

void PXProjectValueWithDecelerationRate()
{
  while (1)
    ;
}

void PXRadiansToDegrees()
{
  while (1)
    ;
}

void PXRectApproximatelyEqualToRect()
{
  while (1)
    ;
}

void PXRectArea()
{
  while (1)
    ;
}

void PXRectByFlippingHorizontallyInRect()
{
  while (1)
    ;
}

void PXRectByLinearlyInterpolatingRects()
{
  while (1)
    ;
}

void PXRectClampPoint()
{
  while (1)
    ;
}

void PXRectCompareForHorizontalMovementInVerticalLayout()
{
  while (1)
    ;
}

void PXRectCompareForVerticalMovementInVerticalLayoutWithSourceRect()
{
  while (1)
    ;
}

void PXRectContainsRectWithTolerance()
{
  while (1)
    ;
}

void PXRectConvertFromCoordinateSpaceToCoordinateSpace()
{
  while (1)
    ;
}

void PXRectDenormalize()
{
  while (1)
    ;
}

void PXRectDerivativeIntegrate()
{
  while (1)
    ;
}

void PXRectDescription()
{
  while (1)
    ;
}

void PXRectDiff()
{
  while (1)
    ;
}

void PXRectEdgeAxis()
{
  while (1)
    ;
}

void PXRectEdgeFlippedHorizontally()
{
  while (1)
    ;
}

void PXRectEdgeOpposite()
{
  while (1)
    ;
}

void PXRectEdgeValue()
{
  while (1)
    ;
}

void PXRectFlippedVertically()
{
  while (1)
    ;
}

void PXRectFunctionDerivative()
{
  while (1)
    ;
}

void PXRectGetCenter()
{
  while (1)
    ;
}

void PXRectGetLengthForAxis()
{
  while (1)
    ;
}

void PXRectGetMaxForAxis()
{
  while (1)
    ;
}

void PXRectGetMidForAxis()
{
  while (1)
    ;
}

void PXRectGetMinForAxis()
{
  while (1)
    ;
}

void PXRectIdenticalToRect()
{
  while (1)
    ;
}

void PXRectIntersectWithBasicRemainders()
{
  while (1)
    ;
}

void PXRectIsValid()
{
  while (1)
    ;
}

void PXRectNormalize()
{
  while (1)
    ;
}

void PXRectRoundToPixel()
{
  while (1)
    ;
}

void PXRectScale()
{
  while (1)
    ;
}

void PXRectScaleFromCenter()
{
  while (1)
    ;
}

void PXRectShiftedInsideConstrainingRect()
{
  while (1)
    ;
}

void PXRectShortestDistanceToPoint()
{
  while (1)
    ;
}

void PXRectShrinkToPixel()
{
  while (1)
    ;
}

void PXRectWithAspectRatioFillingRect()
{
  while (1)
    ;
}

void PXRectWithAspectRatioFittingRect()
{
  while (1)
    ;
}

void PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect()
{
  while (1)
    ;
}

void PXRectWithCenterAndSize()
{
  while (1)
    ;
}

void PXRectWithEdges()
{
  while (1)
    ;
}

void PXRectWithOriginAndSize()
{
  while (1)
    ;
}

void PXRectWithSize()
{
  while (1)
    ;
}

void PXRectWithSizeAlignedToRectEdges()
{
  while (1)
    ;
}

void PXRectWithSizeAlignedToRectEdgesWithPadding()
{
  while (1)
    ;
}

void PXReduceF()
{
  while (1)
    ;
}

void PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits()
{
  while (1)
    ;
}

void PXScaledValueForTextStyleWithSymbolicTraits()
{
  while (1)
    ;
}

void PXScrollViewIsScrollableAlongAxis()
{
  while (1)
    ;
}

void PXSectionedFetchResultIndexOfObject()
{
  while (1)
    ;
}

void PXSectionedFetchResultIndexOfObjectInRange()
{
  while (1)
    ;
}

void PXSimpleIndexPathCompare()
{
  while (1)
    ;
}

void PXSimpleIndexPathDescription()
{
  while (1)
    ;
}

void PXSimpleIndexPathFromIndexPath()
{
  while (1)
    ;
}

void PXSizeAdd()
{
  while (1)
    ;
}

void PXSizeApproximatelyEqualOrBiggerThanSize()
{
  while (1)
    ;
}

void PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance()
{
  while (1)
    ;
}

void PXSizeApproximatelyEqualToSize()
{
  while (1)
    ;
}

void PXSizeByLinearlyInterpolatingSize()
{
  while (1)
    ;
}

void PXSizeCeilingToPixel()
{
  while (1)
    ;
}

void PXSizeClampToSize()
{
  while (1)
    ;
}

void PXSizeDescription()
{
  while (1)
    ;
}

void PXSizeGetArea()
{
  while (1)
    ;
}

void PXSizeGetAspectRatio()
{
  while (1)
    ;
}

void PXSizeGetAspectRatioWithDefault()
{
  while (1)
    ;
}

void PXSizeIsEmpty()
{
  while (1)
    ;
}

void PXSizeIsNull()
{
  while (1)
    ;
}

void PXSizeIsValid()
{
  while (1)
    ;
}

void PXSizeLargerThanSize()
{
  while (1)
    ;
}

void PXSizeMakeSquare()
{
  while (1)
    ;
}

void PXSizeMax()
{
  while (1)
    ;
}

void PXSizeMin()
{
  while (1)
    ;
}

void PXSizeRound()
{
  while (1)
    ;
}

void PXSizeRoundToEven()
{
  while (1)
    ;
}

void PXSizeRoundToPixel()
{
  while (1)
    ;
}

void PXSizeSafeInset()
{
  while (1)
    ;
}

void PXSizeScale()
{
  while (1)
    ;
}

void PXSizeSetValueForAxis()
{
  while (1)
    ;
}

void PXSizeSubtract()
{
  while (1)
    ;
}

void PXSizeTranspose()
{
  while (1)
    ;
}

void PXSizeValueForAxis()
{
  while (1)
    ;
}

void PXSizeWithAspectRatioFillingSize()
{
  while (1)
    ;
}

void PXSizeWithAspectRatioFittingSize()
{
  while (1)
    ;
}

void PXSoftClamp()
{
  while (1)
    ;
}

void PXStoryAffineTransformFittingRectsIntoRect()
{
  while (1)
    ;
}

void PXStoryRectApplyAffineTransform()
{
  while (1)
    ;
}

void PXStoryRectDecompose()
{
  while (1)
    ;
}

void PXStoryRectDenormalize()
{
  while (1)
    ;
}

void PXStoryRectDescription()
{
  while (1)
    ;
}

void PXStoryRectEqualToRect()
{
  while (1)
    ;
}

void PXStoryRectFitIntoRect()
{
  while (1)
    ;
}

void PXStoryRectFitIntoUnitRect()
{
  while (1)
    ;
}

void PXStoryRectFromCGRect()
{
  while (1)
    ;
}

void PXStoryRectFromCGRectCenterRotation()
{
  while (1)
    ;
}

void PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint()
{
  while (1)
    ;
}

void PXStoryRectIsEmpty()
{
  while (1)
    ;
}

void PXStoryRectIsNull()
{
  while (1)
    ;
}

void PXStoryRectLinearlyInterpolatingRects()
{
  while (1)
    ;
}

void PXStoryRectNormalize()
{
  while (1)
    ;
}

void PXStoryRectOuterBounds()
{
  while (1)
    ;
}

void PXStoryRectPath()
{
  while (1)
    ;
}

void PXStoryRectsFitIntoRect()
{
  while (1)
    ;
}

void PXSyncCallbackBegin()
{
  while (1)
    ;
}

void PXSyncCallbackEnd()
{
  while (1)
    ;
}

void PXSystemFontOfSizeAndWeight()
{
  while (1)
    ;
}

void PXTileGeometryApplyAffineTransform()
{
  while (1)
    ;
}

void PXTileGeometryDescription()
{
  while (1)
    ;
}

void PXTimebaseConversionFactor()
{
  while (1)
    ;
}

void PXUIApplicationGetFirstKeyWindow()
{
  while (1)
    ;
}

void PXUpdateEndUpdates()
{
  while (1)
    ;
}

void PXUpdateFlagsInvalidate()
{
  while (1)
    ;
}

void PXUpdateIsUpdateNeeded()
{
  while (1)
    ;
}

void PXUpdateSectionedSpriteInfoTagsForItemsInRange()
{
  while (1)
    ;
}

void PXUpdateShouldBeginUpdates()
{
  while (1)
    ;
}

void PXUserInterfaceLayoutDirectionDescription()
{
  while (1)
    ;
}

void PXUserInterfaceStyleFromUITraitCollection()
{
  while (1)
    ;
}

void PXVelocityFlippedHorizontally()
{
  while (1)
    ;
}

uint64_t RPTViewFrameInScreenSpace()
{
  return MEMORY[0x1F4147AB0]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBD8]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x1F415CC00]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1F4166AD8]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1F4166B10]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4166B38]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x1F4166B48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1F4166BB0]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4166BE0]();
}

void UIFontTextStyleFromPXFontTextStyle()
{
  while (1)
    ;
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

void UIImageConfigurationFromPXImageConfiguration()
{
  while (1)
    ;
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CB0](image);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4166EF0]();
}

uint64_t VKCNormalizedSubrectInRect()
{
  return MEMORY[0x1F41679D0]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1F4178E10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MKMapRectThatFits()
{
  return MEMORY[0x1F40ECEE8]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1F413F3A8]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1F413F3B0]();
}

void _PXGArrayCapacityResizeToCount()
{
  while (1)
    ;
}

void _PXGArrayCopyRangeToArray()
{
  while (1)
    ;
}

void _PXGArrayInsertRange()
{
  while (1)
    ;
}

void _PXGArrayRemoveRange()
{
  while (1)
    ;
}

void _PXGArrayResize()
{
  while (1)
    ;
}

void _PXGArrayZeroRange()
{
  while (1)
    ;
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4166FA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1F40C9D48]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1F417DFE0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1F417DFF0]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1F417DFF8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1F417E078]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1F417E1C0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1F417E228]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1F417E248]();
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

float cbrtf(float a1)
{
  MEMORY[0x1F40CA690](a1);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814D8](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
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

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

void exit(int a1)
{
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

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1F40CC6F0]();
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

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1F40F3960](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1F40F3970](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1F40F3A00](path, *(void *)&interface_type);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_moveWeak(id *to, id *from)
{
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
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

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1F41405A8]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1F41405F0]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
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

void px_dispatch_on_main_queue()
{
  while (1)
    ;
}

void px_dispatch_on_main_queue_sync()
{
  while (1)
    ;
}

void px_dispatch_on_main_queue_when_idle_after_delay()
{
  while (1)
    ;
}

void px_dispatch_qos_from_nsqualityofservice()
{
  while (1)
    ;
}

void px_dispatch_queue_create()
{
  while (1)
    ;
}

void px_dispatch_queue_create_serial()
{
  while (1)
    ;
}

void px_dispatch_queue_create_serial_with_priority()
{
  while (1)
    ;
}

void px_dispatch_queue_wait()
{
  while (1)
    ;
}

void px_perform_on_main_runloop()
{
  while (1)
    ;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void rewind(FILE *a1)
{
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

void srand(unsigned int a1)
{
}

void srand48(uint64_t a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1F4188210]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1F41864F8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1F41865D0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x1F4188268]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1F4188270]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x1F4186800]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1F41868A8]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1F41868B0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1F41868D0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1F41868D8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

long double tanh(long double __x)
{
  MEMORY[0x1F40CE430](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtection(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___APApplication(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection)) {
    return dlopenHelper_AppProtection(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APGuard(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection)) {
    return dlopenHelper_AppProtection(result);
  }
  return result;
}