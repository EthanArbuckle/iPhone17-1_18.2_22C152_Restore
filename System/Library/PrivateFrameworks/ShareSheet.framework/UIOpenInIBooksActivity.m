@interface UIOpenInIBooksActivity
+ (id)bestJobNameForActivityItems:(id)a3;
+ (id)defaultJobName;
+ (id)jobNameFormatForFile;
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_appIsDocumentTypeOwner;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isContentManaged;
- (BOOL)shouldUnlinkFile;
- (LSApplicationProxy)applicationProxy;
- (NSOperation)operation;
- (NSString)applicationIdentifier;
- (NSString)sourceApplicationBundleID;
- (NSURL)url;
- (UIOpenInIBooksActivity)init;
- (UIPrintInteractionController)printInteractionController;
- (id)_bundleIdentifierForActivityImageCreation;
- (id)_loadedApplicationProxy;
- (id)activityTitle;
- (id)activityType;
- (int64_t)_defaultSortGroup;
- (void)_finishedCopyingResource:(BOOL)a3;
- (void)_handleSaveToPDFWithCompleted:(BOOL)a3 error:(id)a4;
- (void)_openDocumentWithApplication;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationProxy:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)setPrintInteractionController:(id)a3;
- (void)setShouldUnlinkFile:(BOOL)a3;
- (void)setSourceApplicationBundleID:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation UIOpenInIBooksActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (UIOpenInIBooksActivity)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIOpenInIBooksActivity;
  uint64_t v2 = [(UIActivity *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIOpenInIBooksActivity *)v2 setApplicationIdentifier:@"com.apple.iBooks"];
  }
  return v3;
}

- (int64_t)_defaultSortGroup
{
  return 4;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.OpenInIBooks";
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return @"com.apple.iBooks";
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"OpenIniBooks[Activity]" value:@"Books" table:@"Localizable"];

  return v3;
}

- (BOOL)_appIsDocumentTypeOwner
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(UIOpenInIBooksActivity *)self url];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F22430], "documentProxyForURL:isContentManaged:sourceAuditToken:", v3, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"), 0);
    uint64_t v5 = *MEMORY[0x1E4F224A8];
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F224A8]];
    v7 = [v4 applicationsAvailableForOpeningWithHandlerRanks:v6 error:0];
    v8 = [v7 objectForKey:v5];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "bundleIdentifier", (void)v18);
          char v15 = [v14 isEqualToString:@"com.apple.iBooks"];

          if (v15)
          {
            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 0;
LABEL_12:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(objc_class *)getMCProfileConnectionClass_3() sharedConnection];
  uint64_t v5 = [(UIOpenInIBooksActivity *)self sourceApplicationBundleID];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v8 bundleIdentifier];
  }
  id v9 = objc_msgSend(v4, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", &unk_1EF3399A8, v7, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"));
  int v10 = [v9 containsObject:@"com.apple.iBooks"];

  if (v10
    && ([(UIOpenInIBooksActivity *)self _loadedApplicationProxy],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int CanDisplayActivityForApplicationProxy = _UIActivityCanDisplayActivityForApplicationProxy(v11),
        v11,
        CanDisplayActivityForApplicationProxy))
  {
    char v13 = _UIActivityItemTypes();
    v14 = [(UIOpenInIBooksActivity *)self operation];
    if (v14)
    {
      BOOL v15 = 0;
    }
    else
    {
      BOOL v16 = (_UIActivityItemTypes() & 0x22) != 0;
      BOOL v15 = (v13 & 0x80) == 0 && v16;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (UIPrintInteractionController)printInteractionController
{
  printInteractionController = self->_printInteractionController;
  if (!printInteractionController)
  {
    v4 = (UIPrintInteractionController *)objc_alloc_init(MEMORY[0x1E4F934B0]);
    uint64_t v5 = self->_printInteractionController;
    self->_printInteractionController = v4;

    printInteractionController = self->_printInteractionController;
  }
  return printInteractionController;
}

- (id)_loadedApplicationProxy
{
  v3 = [(UIOpenInIBooksActivity *)self applicationProxy];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F223B8];
    uint64_t v5 = [(UIOpenInIBooksActivity *)self applicationIdentifier];
    v6 = [v4 applicationProxyForIdentifier:v5];
    [(UIOpenInIBooksActivity *)self setApplicationProxy:v6];
  }
  return [(UIOpenInIBooksActivity *)self applicationProxy];
}

- (void)_openDocumentWithApplication
{
  v3 = [(UIOpenInIBooksActivity *)self url];
  v4 = _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  memset(v9, 0, sizeof(v9));
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v9);
  uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v6 = [(UIOpenInIBooksActivity *)self applicationIdentifier];
  id v7 = objc_msgSend(v5, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v3, v6, 0, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"), v9, 0, v4, self);
  [(UIOpenInIBooksActivity *)self setOperation:v7];

  v8 = [(UIOpenInIBooksActivity *)self operation];
  [v8 start];
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__UIOpenInIBooksActivity_openResourceOperation_didFinishCopyingResource___block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__UIOpenInIBooksActivity_openResourceOperation_didFinishCopyingResource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedCopyingResource:1];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__UIOpenInIBooksActivity_openResourceOperation_didFailWithError___block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__UIOpenInIBooksActivity_openResourceOperation_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedCopyingResource:0];
}

- (void)openResourceOperationDidComplete:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__UIOpenInIBooksActivity_openResourceOperationDidComplete___block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__UIOpenInIBooksActivity_openResourceOperationDidComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedCopyingResource:1];
}

- (void)_finishedCopyingResource:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIOpenInIBooksActivity *)self operation];

  if (v5)
  {
    if ([(UIOpenInIBooksActivity *)self shouldUnlinkFile])
    {
      bzero(v8, 0x400uLL);
      v6 = [(UIOpenInIBooksActivity *)self url];
      id v7 = [v6 path];
      [v7 getCString:v8 maxLength:1024 encoding:4];

      unlink(v8);
      [(UIOpenInIBooksActivity *)self setShouldUnlinkFile:0];
    }
    [(UIOpenInIBooksActivity *)self setUrl:0];
    [(UIOpenInIBooksActivity *)self setOperation:0];
    [(UIActivity *)self activityDidFinish:v3];
  }
}

- (void)performActivity
{
  BOOL v3 = [(UIOpenInIBooksActivity *)self url];

  if (v3)
  {
    [(UIOpenInIBooksActivity *)self _openDocumentWithApplication];
  }
  else
  {
    v4 = [(UIOpenInIBooksActivity *)self printInteractionController];
    uint64_t v5 = [v4 printInfo];
    v6 = [v5 jobName];
    id v7 = [v6 stringByStandardizingPath];

    if (!v7 || ![v7 length])
    {
      uint64_t v8 = +[UIOpenInIBooksActivity bestJobNameForActivityItems:0];

      id v7 = (void *)v8;
    }
    uint64_t v9 = tempURLForJobName(v7);
    [(UIOpenInIBooksActivity *)self setUrl:v9];

    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __41__UIOpenInIBooksActivity_performActivity__block_invoke;
    BOOL v15 = &unk_1E5A235B0;
    objc_copyWeak(&v16, &location);
    int v10 = (void *)MEMORY[0x1A6229A90](&v12);
    uint64_t v11 = [(UIOpenInIBooksActivity *)self url];
    [v4 savePDFToURL:v11 completionHandler:v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __41__UIOpenInIBooksActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleSaveToPDFWithCompleted:a3 error:v6];
}

- (void)_handleSaveToPDFWithCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6 || !v4)
  {
    uint64_t v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[UIOpenInIBooksActivity _handleSaveToPDFWithCompleted:error:](self, (uint64_t)v6, v8);
    }

    [(UIOpenInIBooksActivity *)self setUrl:0];
    [(UIOpenInIBooksActivity *)self setShouldUnlinkFile:0];
    [(UIActivity *)self activityDidFinish:0 items:0 error:v6];
  }
  else
  {
    [(UIOpenInIBooksActivity *)self setShouldUnlinkFile:1];
    id v7 = [(UIOpenInIBooksActivity *)self url];

    if (v7) {
      [(UIOpenInIBooksActivity *)self _openDocumentWithApplication];
    }
  }
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_UIActivityItemTypes() & 0x20) != 0)
  {
    id v5 = [(UIOpenInIBooksActivity *)self printInteractionController];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = v4;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v5 setPrintPageRenderer:v41];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v5 setPrintFormatter:v41];
              goto LABEL_35;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v5 setPrintInfo:v41];
            }
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_35:
  }
  else
  {
    id v5 = +[UIOpenInIBooksActivity bestJobNameForActivityItems:v4];
    id v6 = _UIActivityItemsGetImages(v4, 0, 1);
    id v7 = v6;
    if (v6 && [v6 count])
    {
      uint64_t v8 = tempURLForJobName(v5);
      v45 = [v7 objectAtIndex:0];
      [v45 size];
      v50.origin.x = 0.0;
      v50.origin.y = 0.0;
      v50.size.width = v9;
      v50.size.height = v10;
      mediaBox.origin.x = 0.0;
      mediaBox.origin.y = 0.0;
      mediaBox.size.width = v9;
      mediaBox.size.height = v10;
      id v11 = v5;
      uint64_t v12 = (void *)MEMORY[0x1E4F28B50];
      CFURLRef v13 = v8;
      v14 = [v12 mainBundle];
      BOOL v15 = [v14 localizedInfoDictionary];
      id v16 = [v15 objectForKey:@"CFBundleDisplayName"];

      if (!v16)
      {
        v17 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v18 = [v17 infoDictionary];
        id v16 = [v18 objectForKey:@"CFBundleDisplayName"];

        if (!v16)
        {
          long long v19 = [MEMORY[0x1E4F28B50] mainBundle];
          long long v20 = [v19 infoDictionary];
          uint64_t v21 = [v20 objectForKey:@"CFBundleName"];

          if (v21) {
            id v16 = (__CFString *)v21;
          }
          else {
            id v16 = @"Untitled";
          }
        }
      }
      CGFloat v22 = *MEMORY[0x1E4F1DDC8];
      transform.a = *(CGFloat *)MEMORY[0x1E4F1DE08];
      transform.b = v22;
      *(void *)&long long v54 = v11;
      *((void *)&v54 + 1) = v16;
      CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&transform count:2];
      v24 = CGPDFContextCreateWithURL(v13, &mediaBox, v23);

      if (v24)
      {
        CFURLRef v42 = v13;
        v44 = self;
        UIGraphicsPushContext(v24);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v43 = v7;
        id v25 = v7;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:&mediaBox count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v55;
          double v29 = *MEMORY[0x1E4F1DAD8];
          double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v55 != v28) {
                objc_enumerationMutation(v25);
              }
              v32 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              objc_msgSend(v32, "size", v42);
              CGFloat v34 = v33;
              v50.origin.x = 0.0;
              v50.origin.y = 0.0;
              v50.size.width = v35;
              v50.size.height = v33;
              CGContextBeginPage(v24, &v50);
              CGContextSaveGState(v24);
              transform.a = 1.0;
              transform.b = 0.0;
              transform.c = 0.0;
              *(_OWORD *)&transform.d = xmmword_1A0B9FF40;
              transform.ty = v34;
              CGContextConcatCTM(v24, &transform);
              objc_msgSend(v32, "drawAtPoint:", v29, v30);
              CGContextRestoreGState(v24);
              CGContextEndPage(v24);
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:&mediaBox count:16];
          }
          while (v27);
        }

        UIGraphicsPopContext();
        CGPDFContextClose(v24);
        CGContextRelease(v24);
        id v7 = v43;
        self = v44;
        CFURLRef v13 = v42;
      }
    }
    else
    {
      CFURLRef v13 = 0;
    }

    [(UIOpenInIBooksActivity *)self setUrl:v13];
    [(UIOpenInIBooksActivity *)self setShouldUnlinkFile:1];
  }
}

+ (id)defaultJobName
{
  uint64_t v2 = _ShareSheetBundle();
  BOOL v3 = [v2 localizedStringForKey:@"iBooksJobName[Activity]" value:@"Untitled" table:@"Localizable"];

  return v3;
}

+ (id)jobNameFormatForFile
{
  uint64_t v2 = _ShareSheetBundle();
  BOOL v3 = [v2 localizedStringForKey:@"iBooksJobNameForURL[Activity]" value:@"Untitled" table:@"Localizable"];

  return v3;
}

+ (id)bestJobNameForActivityItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      CGFloat v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    CGFloat v10 = NSString;
    id v11 = v9;
    uint64_t v12 = [a1 jobNameFormatForFile];
    CFURLRef v13 = [v11 lastPathComponent];

    v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v14 = [a1 defaultJobName];
LABEL_12:

  return v14;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)shouldUnlinkFile
{
  return self->_shouldUnlinkFile;
}

- (void)setShouldUnlinkFile:(BOOL)a3
{
  self->_shouldUnlinkFile = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setApplicationProxy:(id)a3
{
}

- (NSOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void)setPrintInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

- (void)_handleSaveToPDFWithCompleted:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 url];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "ERROR: opening %{public}@ in Books required saving to PDF first, but that failed with the error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end