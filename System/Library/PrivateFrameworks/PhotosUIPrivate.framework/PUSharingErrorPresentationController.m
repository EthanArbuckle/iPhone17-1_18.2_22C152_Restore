@interface PUSharingErrorPresentationController
+ (BOOL)errorIsDownloadError:(id)a3;
+ (BOOL)errorIsLowDiskSpaceError:(id)a3;
+ (BOOL)errorIsUserNeedsReviewCloudSettingsError:(id)a3;
+ (id)_defaultTitleForDownloadErrorForAssets:(id)a3 forSource:(unint64_t)a4;
+ (id)_defaultTitleForSource:(unint64_t)a3 assets:(id)a4;
+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4;
+ (int64_t)errorTypeFromSimulatedErrorType:(int64_t)a3;
+ (int64_t)sharingErrorTypeFromError:(id)a3;
- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3;
- (BOOL)shouldShowFileRadarAction;
- (NSDictionary)itemSourcesByAssetUUID;
- (PUSharingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4 fromSource:(unint64_t)a5 preparationType:(int64_t)a6;
- (id)additionalRadarDescriptionLinesForAsset:(id)a3;
- (int64_t)preparationType;
- (unint64_t)source;
- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6;
- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4;
- (void)setItemSourcesByAssetUUID:(id)a3;
@end

@implementation PUSharingErrorPresentationController

- (void).cxx_destruct
{
}

- (void)setItemSourcesByAssetUUID:(id)a3
{
}

- (NSDictionary)itemSourcesByAssetUUID
{
  return self->_itemSourcesByAssetUUID;
}

- (int64_t)preparationType
{
  return self->_preparationType;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = [(id)objc_opt_class() sharingErrorTypeFromError:v9];
  unint64_t v12 = v11;
  if (v11 > 9) {
    v13 = @"Unknown";
  }
  else {
    v13 = off_1E5F242E0[v11];
  }
  v14 = PLUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = [(PUErrorPresentationController *)self errors];
    *(_DWORD *)buf = 138543618;
    v90 = v13;
    __int16 v91 = 2114;
    v92 = v15;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Sharing Error Presentation: Will show \"Unable to share\" dialogue. Error Type: %{public}@. Reported errors: %{public}@", buf, 0x16u);
  }
  v16 = [MEMORY[0x1E4F1CA48] array];
  v17 = [MEMORY[0x1E4F1CA48] array];
  v18 = PULocalizedString(@"OK");
  v88 = v9;
  if (v12 != 8)
  {
    if (v12 - 1 > 2)
    {
      switch(v12)
      {
        case 4uLL:
          v87 = v16;
          v29 = PULocalizedString(@"SHARING_PREPARATION_LOW_DISK_SPACE_TITLE");
          v33 = objc_opt_class();
          v34 = [(PUErrorPresentationController *)self assets];
          v35 = [v33 _mediaSpecificMessageForKeyPrefix:@"SHARING_PREPARATION_LOW_DISK_SPACE_MESSAGE_" forAssets:v34];

          uint64_t v36 = objc_opt_class();
          v37 = PULocalizedString(@"SHARING_PREPARATION_LOW_DISK_SPACE_MANAGE_BUTTON_TITLE");
          v38 = (void *)v36;
          v39 = v17;
          id v40 = v10;
          v41 = [v38 alertActionForNavigatingToDestination:2 withTitle:v37 completion:v10];

          v42 = v39;
          [v39 addObject:v41];
          uint64_t v43 = PULocalizedString(@"CANCEL");

          if (!v7) {
            goto LABEL_34;
          }
          uint64_t v44 = [v35 stringByAppendingString:@"\n\n[Internal Only] If you feel like this storage error is unexpected, please file a radar (and explain why)."];

          v45 = @"What does Settings->General->About report that you have for available storage?";
          goto LABEL_33;
        case 5uLL:
          v87 = v16;
          v29 = PULocalizedString(@"SHARING_PREPARATION_CMM_ICLOUD_QUOTA_EXCEEDED_TITLE");
          v35 = PULocalizedString(@"SHARING_PREPARATION_CMM_ICLOUD_QUOTA_EXCEEDED_MESSAGE");
          uint64_t v56 = objc_opt_class();
          v57 = PULocalizedString(@"SHARING_PREPARATION_ICLOUD_STORAGE_MANAGE_BUTTON_TITLE");
          v58 = (void *)v56;
          v59 = v17;
          id v40 = v10;
          v41 = [v58 alertActionForNavigatingToDestination:4 withTitle:v57 completion:v10];

          v42 = v59;
          [v59 addObject:v41];
          uint64_t v43 = PULocalizedString(@"CANCEL");

          if (v7)
          {
            uint64_t v44 = [v35 stringByAppendingString:@"\n\n[Internal Only] If you feel like this error is unexpected, please file a radar (and explain why)."];

            v45 = @"How much iCloud space do you have available?";
LABEL_33:
            [v87 addObject:v45];
            v35 = (void *)v44;
          }
LABEL_34:

          v18 = (void *)v43;
          id v10 = v40;
          v17 = v42;
          v16 = v87;
          goto LABEL_60;
        case 6uLL:
          v60 = objc_opt_class();
          v61 = [(PUErrorPresentationController *)self assets];
          v29 = objc_msgSend(v60, "_defaultTitleForDownloadErrorForAssets:forSource:", v61, -[PUSharingErrorPresentationController source](self, "source"));

          if ([(PUSharingErrorPresentationController *)self source] == 3)
          {
            v62 = objc_opt_class();
            v63 = [(PUErrorPresentationController *)self assets];
            v35 = [v62 _mediaSpecificMessageForKeyPrefix:@"PHOTO_PICKER_PREPARATION_CPL_NOT_READY_ERROR_MESSAGE_" forAssets:v63];
          }
          else
          {
            v35 = PULocalizedString(@"SHARING_PREPARATION_CPL_NOT_READY_ERROR_MESSAGE");
          }
          if (!v7) {
            goto LABEL_60;
          }
          uint64_t v69 = [v35 stringByAppendingString:@"\n\n[Internal Only] If you feel like this iCloud Photos-related error is unexpected, please file a radar (and explain why)."];

          [v16 addObject:@"Did you recently upgrade your OS and reboot?"];
          [v16 addObject:@"Did you install any roots recently?"];
          v70 = @"Did you sign in/out of iCloud recently?";
          break;
        case 7uLL:
          v29 = PULocalizedString(@"SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_TITLE");
          v86 = v17;
          if ([(PUSharingErrorPresentationController *)self preparationType] == 1)
          {
            v35 = PULocalizedString(@"SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_CMM_MESSAGE");
          }
          else
          {
            v71 = objc_opt_class();
            v72 = [(PUErrorPresentationController *)self assets];
            v35 = [v71 _mediaSpecificMessageForKeyPrefix:@"SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_MESSAGE_" forAssets:v72];
          }
          v73 = objc_opt_class();
          v74 = PULocalizedString(@"SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_GO_TO_SETTINGS_BUTTON_TITLE");
          id v75 = v10;
          v76 = [v73 alertActionForNavigatingToDestination:4 withTitle:v74 completion:v10];

          [v86 addObject:v76];
          uint64_t v77 = PULocalizedString(@"CANCEL");

          if (v7)
          {
            uint64_t v78 = [v35 stringByAppendingString:@"\n\n[Internal Only] If you feel like this error is unexpected, please file a radar (and explain why)."];

            v35 = (void *)v78;
          }

          v18 = (void *)v77;
          id v10 = v75;
          v17 = v86;
          goto LABEL_60;
        default:
          unint64_t v52 = [(PUSharingErrorPresentationController *)self source];
          v53 = objc_opt_class();
          v54 = [(PUErrorPresentationController *)self assets];
          v29 = [v53 _defaultTitleForSource:v52 assets:v54];

          switch(v52)
          {
            case 1uLL:
              v55 = @"POST_TO_SHARED_ALBUM_PREPARATION_ERROR_MESSAGE";
              goto LABEL_59;
            case 3uLL:
              v83 = objc_opt_class();
              v84 = [(PUErrorPresentationController *)self assets];
              v35 = [v83 _mediaSpecificMessageForKeyPrefix:@"PHOTO_PICKER_PREPARATION_ERROR_MESSAGE_" forAssets:v84];

              goto LABEL_60;
            case 4uLL:
              v55 = @"SYNDICATION_SAVE_PREPARATION_ERROR_MESSAGE";
              goto LABEL_59;
            case 5uLL:
              v55 = @"RENDER_PREPARATION_ERROR_MESSAGE";
              goto LABEL_59;
            default:
              v55 = @"SHARING_PREPARATION_ERROR_MESSAGE";
LABEL_59:
              v35 = PULocalizedString(v55);
              break;
          }
          goto LABEL_60;
      }
      goto LABEL_45;
    }
    if ([(PUSharingErrorPresentationController *)self preparationType] == 1) {
      goto LABEL_16;
    }
    v27 = [v9 domain];
    if ([v27 isEqualToString:*MEMORY[0x1E4F39800]])
    {
      uint64_t v28 = [v9 code];

      if (v28 == 6001)
      {
LABEL_16:
        if (v12 == 2)
        {
          v29 = PULocalizedString(@"SHARING_PREPARATION_AIRPLANE_MODE_TITLE");
          v30 = objc_opt_class();
          v31 = [(PUErrorPresentationController *)self assets];
          v32 = @"SHARING_PREPARATION_AIRPLANE_MODE_CMM_MESSAGE_";
LABEL_28:
          v35 = [v30 _mediaSpecificMessageForKeyPrefix:v32 forAssets:v31];

          uint64_t v48 = objc_opt_class();
          v49 = PULocalizedString(@"SHARING_PREPARATION_AIRPLANE_MODE_MANAGE_BUTTON_TITLE");
          v50 = (void *)v48;
          uint64_t v51 = 10;
LABEL_42:
          v67 = [v50 alertActionForNavigatingToDestination:v51 withTitle:v49 completion:v10];

          [v17 addObject:v67];
          uint64_t v68 = PULocalizedString(@"CANCEL");

          v18 = (void *)v68;
LABEL_43:
          if (!v7) {
            goto LABEL_60;
          }
          uint64_t v69 = [v35 stringByAppendingString:@"\n\n[Internal Only] If you feel like this network error is unexpected, please file a radar (and explain why)."];

          [v16 addObject:@"Can you reach the internet in other apps?"];
          v70 = @"Do you have any cellular restrictions on Photos?";
LABEL_45:
          [v16 addObject:v70];
          v35 = (void *)v69;
          goto LABEL_60;
        }
        if (v12 != 3)
        {
          v29 = PULocalizedString(@"SHARING_PREPARATION_CMM_NETWORK_ERROR_TITLE");
          v35 = PULocalizedString(@"SHARING_PREPARATION_CMM_NETWORK_ERROR_MESSAGE");
          goto LABEL_43;
        }
        v29 = PULocalizedString(@"SHARING_PREPARATION_CELLULAR_RESTRICTED_TITLE");
        v35 = PULocalizedString(@"SHARING_PREPARATION_CELLULAR_RESTRICTED_CMM_MESSAGE");
        goto LABEL_41;
      }
    }
    else
    {
    }
    if (v12 == 2)
    {
      v29 = PULocalizedString(@"SHARING_PREPARATION_AIRPLANE_MODE_TITLE");
      v30 = objc_opt_class();
      v31 = [(PUErrorPresentationController *)self assets];
      v32 = @"SHARING_PREPARATION_AIRPLANE_MODE_MESSAGE_";
      goto LABEL_28;
    }
    if (v12 != 3)
    {
      v79 = objc_opt_class();
      v80 = [(PUErrorPresentationController *)self assets];
      v29 = objc_msgSend(v79, "_defaultTitleForDownloadErrorForAssets:forSource:", v80, -[PUSharingErrorPresentationController source](self, "source"));

      v81 = objc_opt_class();
      v82 = [(PUErrorPresentationController *)self assets];
      v35 = [v81 _mediaSpecificMessageForKeyPrefix:@"SHARING_PREPARATION_NETWORK_ERROR_MESSAGE_" forAssets:v82];

      goto LABEL_43;
    }
    v29 = PULocalizedString(@"SHARING_PREPARATION_CELLULAR_RESTRICTED_TITLE");
    v64 = objc_opt_class();
    v65 = [(PUErrorPresentationController *)self assets];
    v35 = [v64 _mediaSpecificMessageForKeyPrefix:@"SHARING_PREPARATION_CELLULAR_RESTRICTED_MESSAGE_" forAssets:v65];

LABEL_41:
    uint64_t v66 = objc_opt_class();
    v49 = PULocalizedString(@"SHARING_PREPARATION_CELLULAR_RESTRICTED_MANAGE_BUTTON_TITLE");
    v50 = (void *)v66;
    uint64_t v51 = 9;
    goto LABEL_42;
  }
  v19 = v16;
  v20 = v17;
  id v21 = v10;
  v22 = [v9 userInfo];
  v23 = [v22 objectForKey:*MEMORY[0x1E4F90918]];

  if (!v23)
  {
    v24 = [MEMORY[0x1E4F906A0] sharedInstance];
    int v25 = [v24 simulateError];

    if (v25)
    {
      v26 = PLUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "Sharing Error Presentation: Simulating a fake required size of 100MB for Sharing GIF -> Shared Albums error", buf, 2u);
      }

      v23 = &unk_1F078BB88;
    }
    else
    {
      v23 = 0;
    }
  }
  v46 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v23, "longLongValue"), 3);
  v29 = PULocalizedString(@"SHARED_STREAM_GIF_SIZE_LIMIT_ERROR_TITLE");
  v47 = PULocalizedString(@"SHARED_STREAM_GIF_SIZE_LIMIT_ERROR_MESSAGE");
  v85 = v46;
  v35 = PUStringWithValidatedFormat();

  id v10 = v21;
  v17 = v20;
  v16 = v19;
LABEL_60:
  -[PUErrorPresentationController setAlertTitle:](self, "setAlertTitle:", v29, v85);
  [(PUErrorPresentationController *)self setAlertMessage:v35];
  [(PUErrorPresentationController *)self setAdditionalQuestionsInRadarDescription:v16];
  [(PUErrorPresentationController *)self setAdditionalAlertActions:v17];
  [(PUErrorPresentationController *)self setDismissButtonTitle:v18];
}

- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4
{
  unint64_t v5 = [(PUSharingErrorPresentationController *)self source];
  if (v5 > 5) {
    v6 = &stru_1F06BE7B8;
  }
  else {
    v6 = off_1E5F242B0[v5];
  }
  BOOL v7 = [NSString stringWithFormat:@"%@: [Unable to Share TTR]: <Add brief error description>", v6];
  [(PUErrorPresentationController *)self setRadarTitle:v7];

  v8 = [(PUSharingErrorPresentationController *)self itemSourcesByAssetUUID];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [(PUErrorPresentationController *)self setAssetsListDescription:@"Assets with Preparation Errors"];
  }
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 originalFilename];
    BOOL v7 = [NSString stringWithFormat:@"Filename: %@", v6];
    [v5 addObject:v7];
  }
  v8 = objc_msgSend(v4, "pl_managedAsset");
  uint64_t v9 = [v8 additionalAttributes];
  id v10 = [v9 deferredPhotoIdentifier];

  unint64_t v11 = [NSString stringWithFormat:@"Deferred Identifier: %@", v10];
  [v5 addObject:v11];

  unint64_t v12 = [(PUSharingErrorPresentationController *)self itemSourcesByAssetUUID];
  v13 = [v4 uuid];
  v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    v15 = [v14 sharingUUID];
    v16 = [NSString stringWithFormat:@"Preparation ID (in Logs): %@", v15];
    [v5 addObject:v16];

    v17 = [v14 lastPreparationError];

    v18 = @"*YES*";
    if (!v17) {
      v18 = @"NO";
    }
    v19 = [NSString stringWithFormat:@"Preparation Error: %@", v18];
    [v5 addObject:v19];
  }
  return v5;
}

- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUSharingErrorPresentationController *)self itemSourcesByAssetUUID];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = [(PUSharingErrorPresentationController *)self itemSourcesByAssetUUID];
    v8 = [v4 uuid];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    id v10 = [v9 lastPreparationError];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)shouldShowFileRadarAction
{
  v2 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v3 = [v2 showFileRadarButtonOnInternalInstalls];

  return v3;
}

- (PUSharingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4 fromSource:(unint64_t)a5 preparationType:(int64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PUSharingErrorPresentationController;
  result = [(PUErrorPresentationController *)&v9 initWithErrors:a3 forAssets:a4];
  if (result)
  {
    result->_source = a5;
    result->_preparationType = a6;
  }
  return result;
}

+ (BOOL)errorIsUserNeedsReviewCloudSettingsError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  int v6 = [(id)objc_opt_class() errorIsAuthenticationRelatedCPLError:v3];
  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    v8 = [v3 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    char v7 = [(id)objc_opt_class() errorIsAuthenticationRelatedCPLError:v9];
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F393B0]]) {
    BOOL v10 = v5 == 4;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10
    || ((int v11 = [v4 isEqualToString:*MEMORY[0x1E4F39800]], v5 == 6012) ? (v12 = v11) : (v12 = 0),
        ((v6 | v12) & 1) != 0))
  {
    char v13 = 1;
  }
  else
  {
    char v14 = [v4 isEqualToString:*MEMORY[0x1E4F39810]];
    if (v5 == 4) {
      char v15 = v14;
    }
    else {
      char v15 = 0;
    }
    char v13 = v15 & v7;
  }

  return v13;
}

+ (BOOL)errorIsLowDiskSpaceError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  char v6 = [(id)objc_opt_class() errorIsLowDiskSpaceRelatedCPLError:v3];
  if (v6)
  {
    int v7 = 1;
  }
  else
  {
    v8 = [v3 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    int v10 = [(id)objc_opt_class() errorIsLowDiskSpaceRelatedCPLError:v9];
    int v7 = v10 ^ 1;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F90910]] && v5 == -110) {
    goto LABEL_11;
  }
  int v11 = [v4 isEqualToString:*MEMORY[0x1E4F39810]] ^ 1;
  if (v5 != 4) {
    int v11 = 1;
  }
  if ((v11 | v7) != 1 || [v4 isEqualToString:*MEMORY[0x1E4F281F8]] && v5 == 640)
  {
LABEL_11:
    char v12 = 1;
  }
  else
  {
    char v14 = [v4 isEqualToString:*MEMORY[0x1E4F28798]];
    if (v5 == 28) {
      char v15 = v14;
    }
    else {
      char v15 = 0;
    }
    char v12 = v6 | v15;
  }

  return v12;
}

+ (BOOL)errorIsDownloadError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  char v6 = [(id)objc_opt_class() isNetworkRelatedError:v3];
  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    v8 = [v3 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    char v10 = [(id)objc_opt_class() isNetworkRelatedError:v9];
    char v7 = v10 ^ 1;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F90910]] && v5 == -101
    || ((uint64_t v11 = *MEMORY[0x1E4F39810], [v4 isEqualToString:*MEMORY[0x1E4F39810]])
      ? (BOOL v12 = v5 == 3)
      : (BOOL v12 = 0),
        v12))
  {
    char v14 = 1;
  }
  else
  {
    int v13 = [v4 isEqualToString:v11] ^ 1;
    if (v5 != 4) {
      LOBYTE(v13) = 1;
    }
    char v14 = v6 | (v13 | v7) ^ 1;
  }

  return v14;
}

+ (id)_defaultTitleForSource:(unint64_t)a3 assets:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1uLL:
      char v6 = @"POST_TO_SHARED_ALBUM_PREPARATION_ERROR_TITLE";
      goto LABEL_7;
    case 3uLL:
      uint64_t v7 = [(id)objc_opt_class() _mediaSpecificMessageForKeyPrefix:@"PHOTO_PICKER_PREPARATION_ERROR_TITLE_" forAssets:v5];
      goto LABEL_8;
    case 4uLL:
      char v6 = @"SYNDICATION_SAVE_PREPARATION_ERROR_TITLE";
      goto LABEL_7;
    case 5uLL:
      char v6 = @"RENDER_PREPARATION_ERROR_TITLE";
      goto LABEL_7;
    default:
      char v6 = @"SHARING_PREPARATION_ERROR_TITLE";
LABEL_7:
      uint64_t v7 = PULocalizedString(v6);
LABEL_8:
      v8 = (void *)v7;

      return v8;
  }
}

+ (id)_defaultTitleForDownloadErrorForAssets:(id)a3 forSource:(unint64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0uLL:
      char v6 = @"SHARING_PREPARATION_NETWORK_ERROR_TITLE";
      break;
    case 1uLL:
      char v6 = @"POST_TO_SHARED_ALBUM_PREPARATION_ERROR_TITLE";
      break;
    case 2uLL:
    case 3uLL:
      PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
      char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      char v6 = @"SYNDICATION_SAVE_PREPARATION_ERROR_TITLE";
      break;
    case 5uLL:
      char v6 = @"RENDER_PREPARATION_ERROR_TITLE";
      break;
    default:
      char v6 = 0;
      break;
  }
  uint64_t v7 = PULocalizedString(v6);

  return v7;
}

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4
{
  id v4 = PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
  id v5 = PULocalizedString(v4);

  return v5;
}

+ (int64_t)errorTypeFromSimulatedErrorType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 9) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)sharingErrorTypeFromError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v5 = [v4 simulateError];

  char v6 = [MEMORY[0x1E4F906A0] sharedInstance];
  uint64_t v7 = [v6 simulatedErrorType];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    char v14 = [v3 domain];
    uint64_t v9 = [v3 code];
    if ([(id)objc_opt_class() errorIsDownloadError:v3])
    {
      int v10 = PLCPLIsInAirplaneMode();
      int v11 = PLCPLIsCellularRestricted();
      uint64_t v12 = 3;
      if (!v11) {
        uint64_t v12 = 1;
      }
      if (v10) {
        unint64_t v13 = 2;
      }
      else {
        unint64_t v13 = v12;
      }
    }
    else if ([(id)objc_opt_class() errorIsLowDiskSpaceError:v3])
    {
      unint64_t v13 = 4;
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4F39800]] && v9 == 6008)
    {
      unint64_t v13 = 5;
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4F8AD00]] && v9 == 15)
    {
      unint64_t v13 = 6;
    }
    else if ([(id)objc_opt_class() errorIsUserNeedsReviewCloudSettingsError:v3])
    {
      unint64_t v13 = 7;
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4F90910]] && v9 == -102)
    {
      unint64_t v13 = 8;
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4F393B0]] && v9 == 5)
    {
      unint64_t v13 = 9;
    }
    else
    {
      v18 = [v3 userInfo];
      v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v13 = [(id)objc_opt_class() sharingErrorTypeFromError:v19];
      }
      else {
        unint64_t v13 = 0;
      }
    }
  }
  else
  {
    unint64_t v13 = [(id)objc_opt_class() errorTypeFromSimulatedErrorType:v7];
    char v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v13 > 9) {
        v16 = @"Unknown";
      }
      else {
        v16 = off_1E5F242E0[v13];
      }
      int v20 = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Sharing Error Presentation: Will return SIMULATED error '%{public}@', because of debug settings", (uint8_t *)&v20, 0xCu);
    }
  }

  return v13;
}

@end