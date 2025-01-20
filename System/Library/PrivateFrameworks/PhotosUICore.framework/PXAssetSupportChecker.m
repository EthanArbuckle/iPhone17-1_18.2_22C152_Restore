@interface PXAssetSupportChecker
+ (BOOL)isSupportedAsset:(id)a3 type:(int64_t)a4;
+ (void)_alertTitleAndMessageForAsset:(id)a3 type:(int64_t)a4 title:(id *)a5 message:(id *)a6;
+ (void)_presentAlertWithTitle:(id)a3 message:(id)a4 knowledgeBaseURL:(id)a5 alertControllerPresenter:(id)a6 completionHandler:(id)a7;
+ (void)checkIsSupportedAndPresentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6;
+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandlerWithReason:(id)a5;
+ (void)presentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6;
+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 uti:(id)a5 codecName:(id)a6 alertControllerPresenter:(id)a7 completionHandler:(id)a8;
@end

@implementation PXAssetSupportChecker

+ (void)checkIsSupportedAndPresentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 211, @"Invalid parameter not satisfying: %@", @"alertControllerPresenter" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_7:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 212, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 210, @"Invalid parameter not satisfying: %@", @"displayAsset" object file lineNumber description];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_7;
  }
LABEL_4:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke;
  v20[3] = &unk_1E5DB3068;
  id v24 = a1;
  int64_t v25 = a4;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [a1 checkIsSupportedAsset:v16 type:a4 completionHandlerWithReason:v20];
}

void __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4, uint64_t a5)
{
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    id v22 = 0;
    id v23 = 0;
    [v12 _alertTitleAndMessageForAsset:v11 type:v13 title:&v23 message:&v22];
    id v14 = v23;
    id v15 = v22;
    if (PFOSVariantHasInternalDiagnostics())
    {
      id v16 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY]", v15];

      if (v9 | v10)
      {
        uint64_t v17 = [v16 stringByAppendingFormat:@" uti:%@ codecName:%@", v9, v10];

        id v16 = (void *)v17;
      }
      if ((unint64_t)(a5 - 2) > 7)
      {
        id v15 = v16;
      }
      else
      {
        id v15 = [v16 stringByAppendingFormat:@"\n%@", off_1E5DB3088[a5 - 2]];
      }
    }
    uint64_t v18 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5DD3128;
    v19 = *(void **)(a1 + 56);
    id v21 = *(id *)(a1 + 48);
    [v19 presentAlertWithTitle:v14 message:v15 uti:v9 codecName:v10 alertControllerPresenter:v18 completionHandler:v20];
  }
}

uint64_t __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)presentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 197, @"Invalid parameter not satisfying: %@", @"displayAsset" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 198, @"Invalid parameter not satisfying: %@", @"alertControllerPresenter" object file lineNumber description];

LABEL_3:
  id v22 = 0;
  id v23 = 0;
  [a1 _alertTitleAndMessageForAsset:v11 type:a4 title:&v23 message:&v22];
  id v14 = v23;
  id v15 = v22;
  id v16 = v15;
  if (!v14)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 203, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
LABEL_9:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 204, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v15) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v17 = +[PXMediaTypeInfoManager knowledgeBaseFallbackURL];
  [a1 _presentAlertWithTitle:v14 message:v16 knowledgeBaseURL:v17 alertControllerPresenter:v12 completionHandler:v13];
}

+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 uti:(id)a5 codecName:(id)a6 alertControllerPresenter:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  unint64_t v17 = (unint64_t)a5;
  unint64_t v18 = (unint64_t)a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_9:
    int64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 183, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 182, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

  if (!v16) {
    goto LABEL_9;
  }
LABEL_3:
  if (v19) {
    goto LABEL_4;
  }
LABEL_10:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 184, @"Invalid parameter not satisfying: %@", @"alertControllerPresenter" object file lineNumber description];

LABEL_4:
  if (v17 | v18)
  {
    id v21 = +[PXMediaTypeInfoManager sharedManager];
    double v22 = *(double *)&PXMediaTypeInfoManagerDefaultTimeout;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __112__PXAssetSupportChecker_presentAlertWithTitle_message_uti_codecName_alertControllerPresenter_completionHandler___block_invoke;
    v27[3] = &unk_1E5DB3040;
    id v32 = a1;
    id v28 = v15;
    id v29 = v16;
    id v30 = v19;
    id v31 = v20;
    [v21 mediaTypeInfoURLForUTI:v17 codecName:v18 timeout:v27 completionHandler:v22];
  }
  else
  {
    id v23 = +[PXMediaTypeInfoManager knowledgeBaseFallbackURL];
    [a1 _presentAlertWithTitle:v15 message:v16 knowledgeBaseURL:v23 alertControllerPresenter:v19 completionHandler:v20];
  }
}

uint64_t __112__PXAssetSupportChecker_presentAlertWithTitle_message_uti_codecName_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 64) _presentAlertWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) knowledgeBaseURL:a2 alertControllerPresenter:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandlerWithReason:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 110, @"Invalid parameter not satisfying: %@", @"displayAsset" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 111, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke;
    aBlock[3] = &unk_1E5DB2FA0;
    id v13 = v12;
    id v25 = v13;
    v26 = v11;
    id v14 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
    if (a4 || ([v13 isVideo] & 1) == 0)
    {
      v14[2](v14, 1, 0);
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F390D8]);
      [v15 setSynchronous:1];
      [v15 setVersion:2];
      id v16 = [MEMORY[0x1E4F390D0] defaultManager];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_2;
      v20[3] = &unk_1E5DB3018;
      id v23 = v14;
      id v21 = v15;
      id v22 = v13;
      id v17 = v15;
      [v16 requestAVProxyForAsset:v22 options:v17 resultHandler:v20];
    }
  }
  else
  {
    v11[2](v11, 1, 0, 0, 0);
  }
}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    id v5 = 0;
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  int v4 = [MEMORY[0x1E4F38EB8] isOriginalKnownUnsupportedFormatForAsset:v3 failureInfo:&v8];
  id v5 = v8;
  if (v4)
  {
LABEL_5:
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F393F0]];
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F393E8]];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_6:
}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v12 = 0;
    [MEMORY[0x1E4F8A358] isAVAssetEditable:a2 reason:&v12];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  int v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  id v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F39800]])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 3164)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) setNetworkAccessAllowed:1];
  v7 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_3;
  v10[3] = &unk_1E5DB2FF0;
  id v11 = *(id *)(a1 + 48);
  [v7 requestAVProxyForAsset:v8 options:v9 resultHandler:v10];

LABEL_8:
}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  if (a2)
  {
    char v3 = [MEMORY[0x1E4F8A358] isAVAssetEditable:a2 reason:&v10];
    uint64_t v4 = v10;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_4;
  v6[3] = &unk_1E5DB2FC8;
  id v5 = *(id *)(a1 + 32);
  char v9 = v3;
  id v7 = v5;
  uint64_t v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandler___block_invoke;
  v10[3] = &unk_1E5DB2F78;
  id v11 = v8;
  id v9 = v8;
  [a1 checkIsSupportedAsset:a3 type:a4 completionHandlerWithReason:v10];
}

uint64_t __70__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isSupportedAsset:(id)a3 type:(int64_t)a4
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PXAssetSupportChecker_isSupportedAsset_type___block_invoke;
  v9[3] = &unk_1E5DB2F50;
  id v11 = &v12;
  uint64_t v6 = v5;
  uint64_t v10 = v6;
  +[PXAssetSupportChecker checkIsSupportedAsset:v4 type:0 completionHandler:v9];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__PXAssetSupportChecker_isSupportedAsset_type___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)_presentAlertWithTitle:(id)a3 message:(id)a4 knowledgeBaseURL:(id)a5 alertControllerPresenter:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (uint64_t (**)(id, void *))a6;
  id v17 = a7;
  if (!v15)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 62, @"Invalid parameter not satisfying: %@", @"knowledgeBaseURL" object file lineNumber description];
  }
  unint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v14 preferredStyle:1];
  id v19 = (void *)MEMORY[0x1E4FB1410];
  id v20 = PXLocalizedStringFromTable(@"PXAssetSupportChecker_UnsupportedFormat_Alert_MoreInfoButton", @"PhotosUICore");
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke;
  v32[3] = &unk_1E5DC7010;
  id v21 = v15;
  id v33 = v21;
  id v22 = v17;
  id v34 = v22;
  id v23 = [v19 actionWithTitle:v20 style:0 handler:v32];
  [v18 addAction:v23];

  id v24 = (void *)MEMORY[0x1E4FB1410];
  id v25 = PXLocalizedStringFromTable(@"PXAssetSupportChecker_UnsupportedFormat_Alert_OkButton", @"PhotosUICore");
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_3;
  v30[3] = &unk_1E5DCE788;
  v26 = (void (**)(void))v22;
  id v31 = v26;
  v27 = [v24 actionWithTitle:v25 style:0 handler:v30];
  [v18 addAction:v27];

  char v28 = v16[2](v16, v18);
  if (v26 && (v28 & 1) == 0) {
    v26[2](v26);
  }
}

void __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5DCCA98;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 openURL:v3 withCompletionHandler:v4];
}

uint64_t __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)_alertTitleAndMessageForAsset:(id)a3 type:(int64_t)a4 title:(id *)a5 message:(id *)a6
{
  id v11 = a3;
  id v19 = v11;
  if (a5)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 34, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

    id v11 = v19;
    if (a6) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PXAssetSupportChecker.m", 35, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

  id v11 = v19;
LABEL_3:
  uint64_t v12 = [v11 mediaType];
  if (v12 == 1)
  {
    int v13 = 1;
  }
  else
  {
    if (v12 != 2)
    {
      unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"PXAssetSupportChecker.m" lineNumber:46 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int v13 = 0;
  }
  if (a4 == 1)
  {
    PXLocalizedStringFromTable(@"PXAssetSupportChecker_UnsupportedFormat_Playback_Video_Title", @"PhotosUICore");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = @"PXAssetSupportChecker_UnsupportedFormat_Playback_Video_Message";
  }
  else
  {
    if (a4) {
      goto LABEL_18;
    }
    if (v13) {
      id v14 = @"PXAssetSupportChecker_UnsupportedFormat_Edit_Photo_Title";
    }
    else {
      id v14 = @"PXAssetSupportChecker_UnsupportedFormat_Edit_Video_Title";
    }
    if (v13) {
      id v15 = @"PXAssetSupportChecker_UnsupportedFormat_Edit_Photo_Message";
    }
    else {
      id v15 = @"PXAssetSupportChecker_UnsupportedFormat_Edit_Video_Message";
    }
    PXLocalizedStringFromTable(v14, @"PhotosUICore");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  PXLocalizedStringFromTable(v15, @"PhotosUICore");
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
}

@end