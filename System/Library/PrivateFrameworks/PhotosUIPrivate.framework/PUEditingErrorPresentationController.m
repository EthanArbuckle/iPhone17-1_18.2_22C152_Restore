@interface PUEditingErrorPresentationController
+ (BOOL)errorIsDownloadError:(id)a3;
+ (id)_hardwareModelSpecificMessageForKeyPrefix:(id)a3;
+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4;
+ (int64_t)editingErrorTypeFromError:(id)a3;
- (BOOL)shouldShowFileRadarAction;
- (PUEditingErrorPresentationController)initWithError:(id)a3 forAsset:(id)a4;
- (PUEditingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4;
- (id)additionalRadarDescriptionLinesForAsset:(id)a3;
- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6;
- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4;
@end

@implementation PUEditingErrorPresentationController

- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v38 = a6;
  unint64_t v12 = [(id)objc_opt_class() editingErrorTypeFromError:v10];
  unint64_t v13 = v12;
  if (v12 > 3) {
    v14 = @"Unknown";
  }
  else {
    v14 = off_1E5F25B10[v12];
  }
  v15 = PLUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v40 = v14;
    __int16 v41 = 2114;
    v42 = v10;
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Edit: Will show \"Unable to edit\" dialogue. Error Type: %{public}@. Actual Error: %{public}@", buf, 0x16u);
  }

  v16 = [MEMORY[0x1E4F1CA48] array];
  v17 = [MEMORY[0x1E4F1CA48] array];
  v18 = PULocalizedString(@"OK");
  if (v13 - 1 > 2)
  {
    v26 = objc_opt_class();
    v27 = [(PUErrorPresentationController *)self assets];
    v28 = [v27 firstObject];
    LODWORD(v26) = [v26 assetIsStandardVideo:v28];

    v29 = PLPhotoEditGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v20 = v11;
    if (v26)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_ERROR, "Error loading base video: %@", buf, 0xCu);
      }

      v19 = PULocalizedString(@"VIDEOEDIT_LOAD_FAILED_TITLE");
      v31 = @"VIDEOEDIT_LOAD_FAILED_MESSAGE";
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_ERROR, "Error loading base image: %@", buf, 0xCu);
      }

      v19 = PULocalizedString(@"PHOTOEDIT_EDIT_LOAD_IMAGE_FAILED_TITLE");
      v31 = @"PHOTOEDIT_EDIT_LOAD_IMAGE_FAILED_MESSAGE";
    }
    v21 = PULocalizedString(v31);
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v32 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY] %@", v21, v10];

LABEL_23:
      v21 = (void *)v32;
    }
  }
  else
  {
    BOOL v37 = v7;
    if (v13 == 3)
    {
      v19 = PULocalizedString(@"PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_TITLE");
      v20 = v11;
      v21 = [(id)objc_opt_class() _mediaSpecificMessageForKeyPrefix:@"PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_MESSAGE_" forAssets:v11];
      v33 = objc_opt_class();
      v34 = PULocalizedString(@"PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_MANAGE_BUTTON_TITLE");
      v35 = [v33 alertActionForNavigatingToDestination:9 withTitle:v34 completion:v38];

      [v17 addObject:v35];
      uint64_t v36 = PULocalizedString(@"CANCEL");

      v18 = (void *)v36;
    }
    else if (v13 == 2)
    {
      v19 = PULocalizedString(@"PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_TITLE");
      v20 = v11;
      v21 = [(id)objc_opt_class() _mediaSpecificMessageForKeyPrefix:@"PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_MESSAGE_" forAssets:v11];
      v22 = objc_opt_class();
      v23 = PULocalizedString(@"PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_MANAGE_BUTTON_TITLE");
      v24 = [v22 alertActionForNavigatingToDestination:10 withTitle:v23 completion:v38];

      [v17 addObject:v24];
      uint64_t v25 = PULocalizedString(@"CANCEL");

      v18 = (void *)v25;
    }
    else
    {
      v20 = v11;
      v19 = [(id)objc_opt_class() _mediaSpecificMessageForKeyPrefix:@"PHOTOEDIT_EDIT_LOAD_NETWORK_ERROR_TITLE_" forAssets:v11];
      v21 = [(id)objc_opt_class() _hardwareModelSpecificMessageForKeyPrefix:@"PHOTOEDIT_EDIT_LOAD_NETWORK_ERROR_MESSAGE_"];
    }
    if (v37)
    {
      uint64_t v32 = [v21 stringByAppendingString:@"\n\n[Internal Only] If you feel like this network error is unexpected, please file a radar (and explain why)."];

      [v16 addObject:@"Can you reach the internet in other apps?"];
      [v16 addObject:@"Do you have any cellular restrictions on Photos?"];
      goto LABEL_23;
    }
  }
  [(PUErrorPresentationController *)self setAlertTitle:v19];
  [(PUErrorPresentationController *)self setAlertMessage:v21];
  [(PUErrorPresentationController *)self setAdditionalQuestionsInRadarDescription:v16];
  [(PUErrorPresentationController *)self setAdditionalAlertActions:v17];
  [(PUErrorPresentationController *)self setDismissButtonTitle:v18];
}

- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4
{
  [(PUErrorPresentationController *)self setRadarTitle:@"[Unable to Edit TTR]: <Add brief error description>", a4];
  [(PUErrorPresentationController *)self setRadarComponentID:@"476277" name:@"Photos UI Edit" version:@"iOS"];
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v3;
  v6 = NSString;
  if ([v5 isAdjusted]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  v8 = [v6 stringWithFormat:@"Is Adjusted: %@", v7];
  [v4 addObject:v8];

  v9 = NSString;
  if ([v5 isContentAdjustmentAllowed]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  id v11 = [v9 stringWithFormat:@"Content Adjustment Allowed: %@", v10];
  [v4 addObject:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v12 = NSString;
    id v13 = v5;
    if ([v13 needsDeferredProcessing]) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    v15 = [v12 stringWithFormat:@"Needs Deferred Processing: %@", v14];
    [v4 addObject:v15];

    v16 = NSString;
    int v17 = [v13 isPhotoStreamPhoto];

    if (v17) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    v19 = [v16 stringWithFormat:@"Is Shared Album Asset: %@", v18];
    [v4 addObject:v19];
  }
  if ([v5 isLivePhoto])
  {
    v20 = NSString;
    if ([v5 hasPhotoColorAdjustments]) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    v22 = [v20 stringWithFormat:@"Significant color adjustments between image and video (e.g. HDR): %@", v21];
    [v4 addObject:v22];
  }
  v23 = [v5 pathForOriginalImageFile];

  if (v23)
  {
    v24 = NSString;
    uint64_t v25 = [v5 pathForOriginalImageFile];
    v26 = [v25 lastPathComponent];
    [v24 stringWithFormat:@"%@ (Original Image file)", v26];
LABEL_26:
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v27 = [v5 pathForOriginalVideoFile];

  if (v27)
  {
    v28 = NSString;
    uint64_t v25 = [v5 pathForOriginalVideoFile];
    v26 = [v25 lastPathComponent];
    [v28 stringWithFormat:@"%@ (Original Video file)", v26];
    goto LABEL_26;
  }
  v29 = [v5 pathForTrimmedVideoFile];

  if (v29)
  {
    BOOL v30 = NSString;
    uint64_t v25 = [v5 pathForTrimmedVideoFile];
    v26 = [v25 lastPathComponent];
    [v30 stringWithFormat:@"%@ (Original Trimmed Video file)", v26];
    goto LABEL_26;
  }
  v31 = &stru_1F06BE7B8;
LABEL_27:
  uint64_t v32 = [NSString stringWithFormat:@"Path: %@", v31];
  [v4 addObject:v32];

  return v4;
}

- (BOOL)shouldShowFileRadarAction
{
  v2 = +[PUPhotoEditProtoSettings sharedInstance];
  char v3 = [v2 showFileRadarButtonForEditEntryOnInternalInstalls];

  return v3;
}

- (PUEditingErrorPresentationController)initWithError:(id)a3 forAsset:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaType:", objc_msgSend(v7, "mediaType"));
  v9 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaSubtypes:", objc_msgSend(v7, "mediaSubtypes"));
  unint64_t v10 = +[PUEditingErrorPresentationController editingErrorTypeFromError:v6];
  if (v10 > 3) {
    id v11 = @"Unknown";
  }
  else {
    id v11 = off_1E5F25B10[v10];
  }
  unint64_t v12 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = [v7 uuid];
    *(_DWORD *)buf = 138544386;
    v22 = v13;
    __int16 v23 = 2114;
    v24 = v8;
    __int16 v25 = 2114;
    v26 = v9;
    __int16 v27 = 2114;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Error loading asset %{public}@ of type: %{public}@ and subtype: %{public}@ for editing. Determined Error Type: %{public}@. Raw Error: %@", buf, 0x34u);
  }
  id v20 = v6;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v19 = v7;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v18.receiver = self;
  v18.super_class = (Class)PUEditingErrorPresentationController;
  v16 = [(PUErrorPresentationController *)&v18 initWithErrors:v14 forAssets:v15];

  return v16;
}

- (PUEditingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 firstObject];
  unint64_t v9 = +[PUEditingErrorPresentationController editingErrorTypeFromError:v8];
  if (v9 > 3) {
    unint64_t v10 = @"Unknown";
  }
  else {
    unint64_t v10 = off_1E5F25B10[v9];
  }
  id v11 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = [v6 count];
    __int16 v17 = 2114;
    objc_super v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Error loading assets. # assets: %lu. First Error Type: %{public}@. First Raw Error: %@", buf, 0x20u);
  }

  v14.receiver = self;
  v14.super_class = (Class)PUEditingErrorPresentationController;
  unint64_t v12 = [(PUErrorPresentationController *)&v14 initWithErrors:v7 forAssets:v6];

  return v12;
}

+ (BOOL)errorIsDownloadError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  char v6 = [(id)objc_opt_class() isNetworkRelatedError:v3];

  char v7 = [v4 isEqualToString:*MEMORY[0x1E4F39800]];
  if (v5 == 3303) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  char v9 = v8 | v6;

  return v9;
}

+ (id)_hardwareModelSpecificMessageForKeyPrefix:(id)a3
{
  id v3 = PXLocalizationKeyByAddingDeviceModelSuffix();
  v4 = PULocalizedString(v3);

  return v4;
}

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4
{
  v4 = PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
  uint64_t v5 = PULocalizedString(v4);

  return v5;
}

+ (int64_t)editingErrorTypeFromError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 simulateEditEntryError];

  if (v5)
  {
    char v6 = +[PUPhotoEditProtoSettings sharedInstance];
    unint64_t v7 = [v6 simulatedEditingEntryErrorType];

    char v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 > 3) {
        char v9 = @"Unknown";
      }
      else {
        char v9 = off_1E5F25B10[v7];
      }
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Editing Error Presentation: Will return SIMULATED error '%{public}@', because of debug settings", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_16;
  }
  if (![(id)objc_opt_class() errorIsDownloadError:v3])
  {
    id v13 = [v3 userInfo];
    char v8 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = [(id)objc_opt_class() editingErrorTypeFromError:v8];
    }
    else {
      unint64_t v7 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  int v10 = PLCPLIsInAirplaneMode();
  int v11 = PLCPLIsCellularRestricted();
  uint64_t v12 = 3;
  if (!v11) {
    uint64_t v12 = 1;
  }
  if (v10) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = v12;
  }
LABEL_17:

  return v7;
}

@end