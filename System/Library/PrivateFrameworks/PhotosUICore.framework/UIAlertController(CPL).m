@interface UIAlertController(CPL)
+ (id)px_alertForCPLEnableError:()CPL actionHandler:cancelHandler:;
+ (id)px_deleteITunesContentAlertWithAssetCount:()CPL includesPhotos:includesVideos:actionHandler:cancelHandler:;
@end

@implementation UIAlertController(CPL)

+ (id)px_alertForCPLEnableError:()CPL actionHandler:cancelHandler:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  switch([v7 code])
  {
    case 6:
      v10 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_RAMP_DISABLED_TITLE", @"PhotosUICore");
      v11 = @"ICLOUDPHOTOS_RAMP_DISABLED_MESSAGE";
      goto LABEL_6;
    case 7:
      v12 = [v7 userInfo];
      v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8AD48]];

      v14 = [v7 userInfo];
      v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F8AD40]];
      uint64_t v16 = [v15 unsignedLongLongValue];

      v17 = [MEMORY[0x1E4F28B68] stringFromByteCount:v16 countStyle:0];
      uint64_t v18 = [v13 availableBytes];
      v19 = [MEMORY[0x1E4FB16C8] currentDevice];
      v20 = [v19 model];
      if (v18 >= 0x100000)
      {
        v21 = [@"ICLOUD_PHOTOS_QUOTA_INSUFFICIENT_MESSAGE_FORMAT_" stringByAppendingString:v20];

        v22 = PXLocalizedStringFromTable(v21, @"PhotosUICore");
        v37 = [MEMORY[0x1E4F28B68] stringFromByteCount:v18 countStyle:0];
        v23 = PXStringWithValidatedFormat();
      }
      else
      {
        v21 = [@"ICLOUD_PHOTOS_QUOTA_EXHAUSTED_MESSAGE_FORMAT_" stringByAppendingString:v20];

        v22 = PXLocalizedStringFromTable(v21, @"PhotosUICore");
        v23 = PXStringWithValidatedFormat();
      }

      v10 = PXLocalizedStringFromTable(@"ICLOUD_PHOTOS_QUOTA_INSUFFICIENT_TITLE", @"PhotosUICore");
      v24 = PXLocalizedStringFromTable(@"ICLOUD_PHOTOS_CANCEL", @"PhotosUICore");
      v25 = PXLocalizedStringFromTable(@"ICLOUD_PHOTOS_VIEW_OPTIONS", @"PhotosUICore");

      goto LABEL_14;
    case 9:
      v23 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_NO_ACCOUNT", @"PhotosUICore");
      v24 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_OK", @"PhotosUICore");
      v25 = 0;
      v10 = 0;
      goto LABEL_14;
    case 11:
      int v26 = MGGetBoolAnswer();
      v27 = @"ICLOUDPHOTOS_NO_CONNECTION_MESSAGE";
      if (v26) {
        v27 = @"ICLOUDPHOTOS_NO_CONNECTION_MESSAGE_WLAN";
      }
      v28 = v27;
      v10 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_NO_CONNECTION_TITLE", @"PhotosUICore");
      v23 = PXLocalizedStringFromTable(v28, @"PhotosUICore");

      goto LABEL_11;
    default:
      v10 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_ENABLE_ERROR_TITLE", @"PhotosUICore");
      v11 = @"ICLOUDPHOTOS_ENABLE_ERROR_MESSAGE";
LABEL_6:
      v23 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
LABEL_11:
      v24 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_OK", @"PhotosUICore");
      v25 = 0;
LABEL_14:
      v29 = PLUIGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        [v7 domain];
        objc_claimAutoreleasedReturnValue();
        PLCPLErrorDebugDescription();
        objc_claimAutoreleasedReturnValue();
        PXDebugDescriptionForError();
      }

      v30 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v23 preferredStyle:1];
      v31 = (void *)MEMORY[0x1E4FB1410];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke;
      v41[3] = &unk_1E5DCE788;
      id v32 = v9;
      id v42 = v32;
      v33 = [v31 actionWithTitle:v24 style:1 handler:v41];
      [v30 addAction:v33];

      if (v25)
      {
        v34 = (void *)MEMORY[0x1E4FB1410];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke_278;
        v38[3] = &unk_1E5DC7010;
        id v39 = v25;
        id v40 = v8;
        v35 = [v34 actionWithTitle:v39 style:0 handler:v38];
        [v30 addAction:v35];
      }
      return v30;
  }
}

+ (id)px_deleteITunesContentAlertWithAssetCount:()CPL includesPhotos:includesVideos:actionHandler:cancelHandler:
{
  id v11 = a6;
  id v12 = a7;
  v13 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_VIDEOS";
  if (a4) {
    v13 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_PHOTOS_VIDEOS";
  }
  v14 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_VIDEOS";
  if (a4) {
    v14 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_PHOTOS_VIDEOS";
  }
  v15 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_PHOTOS_VIDEOS";
  if (!a4) {
    v15 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_VIDEOS";
  }
  BOOL v16 = a5 == 0;
  if (a5) {
    v17 = v13;
  }
  else {
    v17 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_PHOTOS";
  }
  if (a5) {
    uint64_t v18 = v14;
  }
  else {
    uint64_t v18 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_PHOTOS";
  }
  if (v16) {
    v19 = @"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_PHOTOS";
  }
  else {
    v19 = v15;
  }
  id v32 = PXLocalizedStringFromTable(v17, @"PhotosUICore");
  v20 = PXLocalizedStringFromTable(v18, @"PhotosUICore");
  v21 = PXLocalizedStringFromTable(v19, @"PhotosUICore");
  v22 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_DELETE_NONICP_CONTENT_CANCEL", @"PhotosUICore");
  v23 = PXLocalizedStringWithValidatedFormat(v20, @"%d");
  v24 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v32, v23, 1, a3);
  v25 = (void *)MEMORY[0x1E4FB1410];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke;
  v35[3] = &unk_1E5DCE788;
  id v36 = v12;
  id v26 = v12;
  v27 = [v25 actionWithTitle:v22 style:1 handler:v35];
  [v24 addAction:v27];

  v28 = (void *)MEMORY[0x1E4FB1410];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke_2;
  v33[3] = &unk_1E5DCE788;
  id v34 = v11;
  id v29 = v11;
  v30 = [v28 actionWithTitle:v21 style:0 handler:v33];
  [v24 addAction:v30];

  return v24;
}

@end