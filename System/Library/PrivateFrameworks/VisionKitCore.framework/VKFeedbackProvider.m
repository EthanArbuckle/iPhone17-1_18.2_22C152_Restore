@interface VKFeedbackProvider
- (NSError)error;
- (UIViewController)presentingViewController;
- (VKCImageAnalysis)imageAnalysis;
- (VKCImageAnalyzerRequest)request;
- (VKFeedbackAssetsProvider)assetsProvider;
- (VKFeedbackProvider)init;
- (id)_jsonRepresentationForAttributesDictionary:(id)a3;
- (void)_captureScreenshots;
- (void)_saveFeedbackAttributesJSON:(id)a3;
- (void)_saveImage:(id)a3 withName:(id)a4;
- (void)_saveScreenshots;
- (void)feedbackProviderViewController:(id)a3 submitWithOptions:(unint64_t)a4 attachments:(id)a5;
- (void)feedbackProviderViewControllerDidCancel:(id)a3;
- (void)provideFeedbackWithType:(unint64_t)a3;
- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 consentPresentingView:(id)a6;
- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 promisedAttachments:(id)a6 userResponseHandler:(id)a7;
- (void)setAssetsProvider:(id)a3;
- (void)setError:(id)a3;
- (void)setImageAnalysis:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation VKFeedbackProvider

- (VKFeedbackProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)VKFeedbackProvider;
  v2 = [(VKFeedbackProvider *)&v18 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [v3 temporaryDirectory];
    v5 = NSString;
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    v8 = [v5 stringWithFormat:@"feedbackAttachments-%@", v7];

    uint64_t v9 = [v4 URLByAppendingPathComponent:v8 isDirectory:1];
    attachmentsFolderURL = v2->_attachmentsFolderURL;
    v2->_attachmentsFolderURL = (NSURL *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    screenshots = v2->_screenshots;
    v2->_screenshots = v11;

    v13 = [[VKFeedbackAttachment alloc] initWithFileName:@"RequestAsset.png" label:@"Request Asset" isOptional:0];
    requestAssetAttachment = v2->_requestAssetAttachment;
    v2->_requestAssetAttachment = v13;

    v15 = [[VKFeedbackAttachment alloc] initWithFileName:@"archive.vkimageanalysis" label:@"Analysis Results" isOptional:0];
    analysisArchiveAttachment = v2->_analysisArchiveAttachment;
    v2->_analysisArchiveAttachment = v15;
  }
  return v2;
}

- (void)provideFeedbackWithType:(unint64_t)a3
{
}

- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 promisedAttachments:(id)a6 userResponseHandler:(id)a7
{
  id v23 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4) {
    [(VKFeedbackProvider *)self _captureScreenshots];
  }
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v15 removeItemAtURL:self->_attachmentsFolderURL error:0];

  self->_type = a3;
  objc_storeStrong((id *)&self->_metadata, a5);
  v16 = (void *)MEMORY[0x1E018E600](v14);
  id userResponseHandler = self->_userResponseHandler;
  self->_id userResponseHandler = v16;

  if (!v13) {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  objc_super v18 = [(VKFeedbackProvider *)self assetsProvider];

  if (v18)
  {
    uint64_t v19 = [v13 arrayByAddingObject:self->_requestAssetAttachment];

    id v13 = (id)v19;
  }
  v20 = [(VKFeedbackProvider *)self imageAnalysis];

  if (v20)
  {
    uint64_t v21 = [v13 arrayByAddingObject:self->_analysisArchiveAttachment];

    id v13 = (id)v21;
  }
  v22 = [[VKFeedbackProviderViewController alloc] initWithOptions:a4 attachments:v13];
  [(VKFeedbackProviderViewController *)v22 setDelegate:self];
  [(VKFeedbackProviderViewController *)v22 present];
}

- (void)feedbackProviderViewControllerDidCancel:(id)a3
{
  (*((void (**)(void))self->_userResponseHandler + 2))();
  id userResponseHandler = self->_userResponseHandler;
  self->_id userResponseHandler = 0;

  [(NSMutableArray *)self->_screenshots removeAllObjects];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtURL:self->_attachmentsFolderURL error:0];
}

- (void)feedbackProviderViewController:(id)a3 submitWithOptions:(unint64_t)a4 attachments:(id)a5
{
  id v7 = a5;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [(NSURL *)self->_attachmentsFolderURL path];
  char v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) != 0
    || (attachmentsFolderURL = self->_attachmentsFolderURL,
        v77[0] = 0,
        [v8 createDirectoryAtURL:attachmentsFolderURL withIntermediateDirectories:1 attributes:0 error:v77], (id v12 = v77[0]) == 0))
  {
    uint64_t v16 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"ComponentName"];
    v17 = (void *)v16;
    objc_super v18 = @"SIML Field Feedback Secured Data";
    if (v16) {
      objc_super v18 = (__CFString *)v16;
    }
    uint64_t v19 = v18;

    uint64_t v20 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"ComponentVersion"];
    uint64_t v21 = (void *)v20;
    v22 = @"Scarlett";
    if (v20) {
      v22 = (__CFString *)v20;
    }
    id v23 = v22;

    uint64_t v24 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"ComponentID"];
    v25 = (void *)v24;
    v26 = @"1179176";
    if (v24) {
      v26 = (__CFString *)v24;
    }
    v27 = v26;

    unint64_t type = self->_type;
    v63 = v8;
    v64 = v19;
    v58 = v27;
    v60 = v23;
    if (type > 3) {
      v29 = 0;
    }
    else {
      v29 = off_1E6BF3248[type];
    }
    v57 = [NSString stringWithFormat:@"[Scarlett] %@ feedback", v29];
    id v30 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v30 appendString:@"Please describe which visual intelligence feature you were trying \n <text selection/OCR, data detectors, MRC codes, visual search>"];
    [v30 appendString:@"\n\n Please describe your steps:"];
    [v30 appendString:@"\n 1. Open <app name> "];
    [v30 appendString:@"\n 2. ... "];
    [v30 appendString:@"\n\nWhat did you see:"];
    [v30 appendString:@"\n\nWhat you expected:"];
    [v30 appendString:@"\n\n(Please attach a screen recording if possible)"];
    [v30 appendString:@"\n\n Extra Information that will help us screen more effectively:"];
    [v30 appendString:@"\n If this is a data detector issue, please also select and copy the OCR text output if possible"];
    [v30 appendString:@"\n If this is a MRC issue, please verify that the MRC correctly works in the Code Scanner app"];
    [v30 appendString:@"\n For visual search issues, also please attach a screenshot of the Siri Search results"];
    v31 = [(VKFeedbackProvider *)self error];

    if (v31)
    {
      v32 = [(VKFeedbackProvider *)self error];
      v33 = [v32 localizedDescription];
      [v30 appendFormat:@"\n\nAnalysis Error: %@", v33];
    }
    uint64_t v34 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"AdditionalText"];
    uint64_t v35 = v34;
    if (v34) {
      [v30 appendFormat:@"\n\n%@", v34];
    }
    v62 = (void *)v35;
    v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setObject:v29 forKey:@"feedback_type"];
    uint64_t v36 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"Client"];
    if (!v36)
    {
      v37 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v36 = [v37 bundleIdentifier];
    }
    v56 = v36;
    [v15 setObject:v36 forKey:@"client_id"];
    [v15 setObject:@"iOS" forKey:@"platform"];
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    v54 = [v55 valueForKey:@"ProductBuildVersion"];
    -[NSObject setObject:forKey:](v15, "setObject:forKey:");
    if ((a4 & 2) != 0)
    {
      v38 = [MEMORY[0x1E4F1CA20] currentLocale];
      v39 = [v38 countryCode];

      v40 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
      v41 = [v40 localizedStringForCountryCode:v39];
      if (v41) {
        [v15 setObject:v41 forKey:@"country"];
      }
    }
    v42 = [(VKFeedbackProvider *)self _jsonRepresentationForAttributesDictionary:v15];
    if (v42)
    {
      [(VKFeedbackProvider *)self _saveFeedbackAttributesJSON:v42];
      v43 = (void *)[[NSString alloc] initWithData:v42 encoding:4];
      [v30 appendFormat:@"\n\nFeedback Attributes:\n%@", v43];
    }
    if (a4) {
      [(VKFeedbackProvider *)self _saveScreenshots];
    }
    v44 = self->_attachmentsFolderURL;
    v45 = [(VKFeedbackProvider *)self assetsProvider];
    v46 = [(VKFeedbackProvider *)self imageAnalysis];
    v47 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke;
    block[3] = &unk_1E6BF3200;
    id v66 = v7;
    v67 = self;
    id v68 = v45;
    v69 = v44;
    unint64_t v76 = a4;
    id v70 = v46;
    id v71 = v57;
    id v72 = v30;
    v73 = v64;
    v74 = v60;
    v75 = v58;
    v59 = v58;
    v61 = v60;
    v48 = v64;
    id v49 = v30;
    id v50 = v57;
    id v51 = v46;
    v52 = v44;
    id v53 = v45;
    dispatch_async(v47, block);

    id v13 = v62;
    v8 = v63;
    id v14 = v56;
  }
  else
  {
    id v13 = v12;
    id v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[VKFeedbackProvider feedbackProviderViewController:submitWithOptions:attachments:]((id *)&self->_attachmentsFolderURL, v13);
    }
    v15 = v14;
  }
}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v39;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v38 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        if (v7 == *(void **)(v8 + 40))
        {
          id v12 = *(void **)(a1 + 48);
          uint64_t v13 = *(void *)(a1 + 56);
          id v37 = 0;
          char v14 = [v12 saveAssetsToFeedbackAttachmentsFolder:v13 error:&v37];
          id v11 = v37;
          if (v14) {
            goto LABEL_19;
          }
          v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_1((uint64_t)v44, (uint64_t)v11);
          }

          goto LABEL_18;
        }
        if (v7 == *(void **)(v8 + 48))
        {
          uint64_t v16 = *(void **)(a1 + 56);
          v17 = [*(id *)(*((void *)&v38 + 1) + 8 * v6) fileName];
          v15 = [v16 URLByAppendingPathComponent:v17];

          objc_super v18 = *(void **)(a1 + 64);
          id v36 = 0;
          [v18 writeSecureCodedArchiveToURL:v15 error:&v36];
          id v11 = v36;
          if (v11)
          {
            uint64_t v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_2((uint64_t)v43, (uint64_t)v11);
            }
          }
LABEL_18:

          goto LABEL_19;
        }
        id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
        char v10 = [v7 fileName];
        id v11 = (id)[v9 initWithString:v10 relativeToURL:*(void *)(a1 + 56)];

        if (v11) {
          [v31 addObject:v11];
        }
LABEL_19:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 56) + 16))();
  uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v21 = [*(id *)(a1 + 56) path];
  v22 = [v20 contentsOfDirectoryAtPath:v21 error:0];

  id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v32 + 1) + 8 * i) relativeToURL:*(void *)(a1 + 56)];
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v26);
  }

  LOBYTE(v30) = (*(_DWORD *)(a1 + 112) & 4) != 0;
  +[VKRadarUtilities createRadarWithTitle:*(void *)(a1 + 72) description:*(void *)(a1 + 80) componentName:*(void *)(a1 + 88) componentVersion:*(void *)(a1 + 96) componentID:*(void *)(a1 + 104) keywordIDs:0 attachmentURLs:v23 includeSysdiagnose:v30];
}

- (id)_jsonRepresentationForAttributesDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    id v8 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:3 error:&v8];
    id v5 = v8;
    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VKFeedbackProvider _jsonRepresentationForAttributesDictionary:](v5);
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VKFeedbackProvider _jsonRepresentationForAttributesDictionary:]((uint64_t)v3, v6);
    }
    id v5 = 0;
    uint64_t v4 = 0;
  }

LABEL_10:
  return v4;
}

- (void)_saveFeedbackAttributesJSON:(id)a3
{
  attachmentsFolderURL = self->_attachmentsFolderURL;
  id v4 = a3;
  id v5 = [(NSURL *)attachmentsFolderURL URLByAppendingPathComponent:@"FeedbackAttributes.json"];
  id v8 = 0;
  [v4 writeToURL:v5 options:2 error:&v8];

  id v6 = v8;
  if (v6)
  {
    id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VKFeedbackProvider _saveFeedbackAttributesJSON:](v6);
    }
  }
}

- (void)_captureScreenshots
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_screenshots removeAllObjects];
  id v3 = [MEMORY[0x1E4F43058] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v11) frame];
        v31.origin.double x = v12;
        v31.origin.double y = v13;
        v31.size.double width = v14;
        v31.size.double height = v15;
        v29.origin.double x = x;
        v29.origin.double y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        CGRect v30 = CGRectUnion(v29, v31);
        double x = v30.origin.x;
        double y = v30.origin.y;
        double width = v30.size.width;
        double height = v30.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F42A58]);
  v17 = [MEMORY[0x1E4F42A60] defaultFormat];
  objc_super v18 = objc_msgSend(v16, "initWithBounds:format:", v17, x, y, width, height);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__VKFeedbackProvider__captureScreenshots__block_invoke;
  v21[3] = &unk_1E6BF3228;
  id v22 = v3;
  id v19 = v3;
  uint64_t v20 = [v18 imageWithActions:v21];
  [(NSMutableArray *)self->_screenshots addObject:v20];
}

unint64_t __41__VKFeedbackProvider__captureScreenshots__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v4 frame];
      objc_msgSend(v4, "drawViewHierarchyInRect:");

      unint64_t result = [*(id *)(a1 + 32) count];
    }
  }
  return result;
}

- (void)_saveScreenshots
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_screenshots;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        if (v5 + v7 < 1)
        {
          uint64_t v9 = @"Screenshot";
        }
        else
        {
          uint64_t v9 = [NSString stringWithFormat:@"%@-%ld", @"Screenshot", v5 + v7];
        }
        uint64_t v10 = [(__CFString *)v9 stringByAppendingString:@".png"];
        [(VKFeedbackProvider *)self _saveImage:v8 withName:v10];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
      v5 += v7;
    }
    while (v4);
  }
}

- (void)_saveImage:(id)a3 withName:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "vk_PNGData");
  if (v7)
  {
    uint64_t v8 = [(NSURL *)self->_attachmentsFolderURL URLByAppendingPathComponent:v6];
    id v11 = 0;
    [v7 writeToURL:v8 options:2 error:&v11];
    id v9 = v11;
    if (v9)
    {
      uint64_t v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[VKFeedbackProvider _saveImage:withName:](v8, v9);
      }
    }
  }
}

- (VKCImageAnalyzerRequest)request
{
  uint64_t v3 = [(VKFeedbackProvider *)self assetsProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(VKFeedbackProvider *)self assetsProvider];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (VKCImageAnalyzerRequest *)v5;
}

- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 consentPresentingView:(id)a6
{
}

- (VKFeedbackAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)setAssetsProvider:(id)a3
{
}

- (VKCImageAnalysis)imageAnalysis
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageAnalysis);
  return (VKCImageAnalysis *)WeakRetained;
}

- (void)setImageAnalysis:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_imageAnalysis);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
  objc_storeStrong(&self->_userResponseHandler, 0);
  objc_storeStrong((id *)&self->_analysisArchiveAttachment, 0);
  objc_storeStrong((id *)&self->_requestAssetAttachment, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_attachmentsFolderURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)feedbackProviderViewController:(id *)a1 submitWithOptions:(void *)a2 attachments:.cold.1(id *a1, void *a2)
{
  uint64_t v3 = [*a1 path];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB266000, v5, v6, "Failed to create attachments disrectory %@. Error: %@", v7, v8, v9, v10, v11);
}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1, a2), "localizedDescription");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_2(&dword_1DB266000, v5, v6, "Error saving analysis assets: %@");
}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1, a2), "localizedDescription");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_2(&dword_1DB266000, v5, v6, "Error archiving analysis object: %@");
}

- (void)_jsonRepresentationForAttributesDictionary:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_1DB266000, v2, v3, "Failed to serialize attributes to JSON: %@", v4, v5, v6, v7, 2u);
}

- (void)_jsonRepresentationForAttributesDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Invalid JSON object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_saveFeedbackAttributesJSON:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_1DB266000, v2, v3, "Failed to save the feedback attributes: %@", v4, v5, v6, v7, 2u);
}

- (void)_saveImage:(void *)a1 withName:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 path];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB266000, v5, v6, "Failed to save image to %@: %@", v7, v8, v9, v10, v11);
}

@end