@interface CRLURLBoardItemProvider
+ (BOOL)canInitWithURL:(id)a3;
+ (NSArray)supportedRemoteURLSchemes;
- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate;
- (CRLProgress)progress;
- (CRLURLBoardItemProvider)initWithURL:(id)a3 fallbackBoardItemProvider:(id)a4 isDetectedURL:(BOOL)a5 suggestedName:(id)a6;
- (NSDictionary)pasteboardDescription;
- (NSError)error;
- (NSString)suggestedName;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3;
- (void)cancel;
- (void)p_provideBoardItemWithFinalURL:(id)a3 factory:(id)a4 completionHandler:(id)a5;
- (void)p_provideBoardItemWithURL:(id)a3 factory:(id)a4 completionHandler:(id)a5;
- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CRLURLBoardItemProvider

+ (NSArray)supportedRemoteURLSchemes
{
  return +[CRLBoardItemImporter supportedRemoteURLSchemes];
}

+ (BOOL)canInitWithURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    v4 = [v3 crl_fileTypeIdentifierHandlingFileCoordinationPromises];
    if (v4)
    {
      +[CRLBoardItemImporter supportedFileUTTypes];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            if (objc_msgSend(v4, "conformsToType:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
            {
              v10 = +[CRLInfoImporterBoardItemProvider disallowedTypes];
              unsigned int v11 = [v4 crl_conformsToAnyUTType:v10];

              if (!v11)
              {
                unsigned int v13 = 1;
                v12 = v5;
                goto LABEL_16;
              }
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      v12 = [v4 identifier];
      unsigned int v13 = +[CRLFileItemImporter protected_canImportFileAtURL:v3 type:v12];
LABEL_16:
    }
    else
    {
      unsigned int v13 = 0;
    }

    unsigned __int8 v14 = v13 != 0;
  }
  else
  {
    unsigned __int8 v14 = +[CRLBoardItemImporter canImportRemoteURL:v3];
  }

  return v14;
}

- (CRLURLBoardItemProvider)initWithURL:(id)a3 fallbackBoardItemProvider:(id)a4 isDetectedURL:(BOOL)a5 suggestedName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CRLURLBoardItemProvider;
  unsigned __int8 v14 = [(CRLURLBoardItemProvider *)&v29 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_initialURL, a3);
    objc_storeStrong((id *)&v15->_suggestedName, a6);
    if ([v11 isFileURL])
    {
      long long v16 = [[CRLSandboxedURL alloc] initWithURL:v11];
      sandboxedURL = v15->_sandboxedURL;
      v15->_sandboxedURL = v16;
    }
    objc_storeStrong((id *)&v15->_fallbackBoardItemProvider, a4);
    long long v18 = objc_alloc_init(CRLScaledProgress);
    importerProgress = v15->_importerProgress;
    v15->_importerProgress = v18;

    v20 = [[CRLBasicProgress alloc] initWithMaxValue:1.0];
    [(CRLScaledProgress *)v15->_importerProgress setProgress:v20];

    [(CRLScaledProgress *)v15->_importerProgress setMaxValue:50.0];
    v21 = [[CRLFakeProgress alloc] initWithMaxValue:1 numberOfStages:50.0];
    fileCoordinationProgress = v15->_fileCoordinationProgress;
    v15->_fileCoordinationProgress = v21;

    v23 = [CRLProgressGroup alloc];
    v24 = v15->_importerProgress;
    v30[0] = v15->_fileCoordinationProgress;
    v30[1] = v24;
    v25 = +[NSArray arrayWithObjects:v30 count:2];
    v26 = [(CRLProgressGroup *)v23 initWithChildren:v25];
    progress = v15->_progress;
    v15->_progress = v26;

    v15->_isDetectedURL = a5;
  }

  return v15;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRLFakeProgress *)self->_fileCoordinationProgress start];
  if ([(NSURL *)self->_initialURL isFileURL])
  {
    initialURL = self->_initialURL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10018938C;
    v9[3] = &unk_1014DC318;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    +[CSCloudSharing existingShareForFileOrFolderURL:initialURL completionHandler:v9];
  }
  else
  {
    [(CRLURLBoardItemProvider *)self p_provideBoardItemWithURL:self->_initialURL factory:v6 completionHandler:v7];
  }
}

- (void)p_provideBoardItemWithURL:(id)a3 factory:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v10 isFileURL])
  {
    id v11 = objc_alloc_init((Class)NSFileCoordinator);
    id v12 = +[NSFileAccessIntent readingIntentWithURL:v10 options:0];

    long long v18 = v12;
    id v13 = +[NSArray arrayWithObjects:&v18 count:1];
    unsigned __int8 v14 = +[NSOperationQueue mainQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10018955C;
    v15[3] = &unk_1014D7D50;
    v15[4] = self;
    v15[5] = v12;
    id v16 = v8;
    id v17 = v9;
    [v11 coordinateAccessWithIntents:v13 queue:v14 byAccessor:v15];

    id v10 = v11;
  }
  else
  {
    [(CRLFakeProgress *)self->_fileCoordinationProgress advanceToStage:1];
    [(CRLURLBoardItemProvider *)self p_provideBoardItemWithFinalURL:v10 factory:v8 completionHandler:v9];
  }
}

- (void)p_provideBoardItemWithFinalURL:(id)a3 factory:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CRLBoardItemImporter alloc] initWithURL:v10 boardItemFactory:v9];

  itemImporter = self->_itemImporter;
  self->_itemImporter = v11;

  if (self->_itemImporter)
  {
    id v13 = [(CRLURLBoardItemProvider *)self suggestedName];
    [(CRLBoardItemImporter *)self->_itemImporter setSuggestedName:v13];

    unsigned __int8 v14 = [(CRLBoardItemImporter *)self->_itemImporter progress];
    [(CRLScaledProgress *)self->_importerProgress setProgress:v14];
    [(CRLBoardItemImporter *)self->_itemImporter setDelegate:self];
    v15 = self->_itemImporter;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10018989C;
    v16[3] = &unk_1014D0AB0;
    v16[4] = self;
    id v17 = v8;
    [(CRLBoardItemImporter *)v15 importBoardItemWithCompletionHandler:v16];
  }
  else
  {
    unsigned __int8 v14 = [(CRLURLBoardItemProvider *)self delegate];
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v14 importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
    }
    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)cancel
{
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  fallbackBoardItem = self->_fallbackBoardItem;
  if (fallbackBoardItem)
  {
    id v3 = fallbackBoardItem;
  }
  else
  {
    id v3 = [(CRLBoardItemImporter *)self->_itemImporter boardItem];
  }

  return v3;
}

- (NSError)error
{
  if (self->_fallbackBoardItem)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(CRLBoardItemImporter *)self->_itemImporter error];
  }

  return (NSError *)v2;
}

- (unint64_t)uploadDataLength
{
  if (self->_fallbackBoardItem) {
    return 0;
  }
  else {
    return [(CRLBoardItemImporter *)self->_itemImporter uploadDataLength];
  }
}

- (unint64_t)embeddedDataLength
{
  if (self->_fallbackBoardItem) {
    return 0;
  }
  else {
    return [(CRLBoardItemImporter *)self->_itemImporter embeddedDataLength];
  }
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v9 = (void (**)(id, void, uint64_t))a6;
  id v10 = [(CRLURLBoardItemProvider *)self delegate];
  id v11 = v10;
  if (v10) {
    [v10 importableBoardItemProvider:self needsMediaCompatibilityFeedbackWithReasons:a4 forMediaType:a5 usingBlock:v9];
  }
  else {
    v9[2](v9, 0, 1);
  }
}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  uint64_t v4 = [(CRLURLBoardItemProvider *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
    }
  }

  _objc_release_x2();
}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(CRLURLBoardItemProvider *)self boardItem];
  if (!v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    initialURL = self->_initialURL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100189BC0;
    v12[3] = &unk_1014CBBB0;
    dispatch_semaphore_t v13 = v7;
    id v9 = v7;
    [(CRLURLBoardItemProvider *)self p_provideBoardItemWithURL:initialURL factory:v5 completionHandler:v12];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v10 = [(CRLURLBoardItemProvider *)self boardItem];

  return v10;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (NSDictionary)pasteboardDescription
{
  return self->pasteboardDescription;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->pasteboardDescription, 0);
  objc_storeStrong((id *)&self->_fallbackBoardItem, 0);
  objc_storeStrong((id *)&self->_fallbackBoardItemProvider, 0);
  objc_storeStrong((id *)&self->_itemImporter, 0);
  objc_storeStrong((id *)&self->_importerProgress, 0);
  objc_storeStrong((id *)&self->_fileCoordinationProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);

  objc_storeStrong((id *)&self->_sandboxedURL, 0);
}

@end