@interface SDAirDropHandlerGenericFiles
+ (void)launchFilesToDefaultFolderWithURLs:(id)a3 defaultFolder:(id)a4 openURLs:(id)a5 completion:(id)a6;
- (BOOL)canHandleTransfer;
- (BOOL)isBundleiWorkType:(id)a3;
- (BOOL)shouldEndAfterOpen;
- (BOOL)shouldOpenAutomaticallyAfterUserAccepts;
- (LSBundleProxy)selectedApplication;
- (NSArray)availableApplications;
- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3;
- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (id)actionForBundleProxy:(id)a3;
- (id)actionsForModernReadyForOpen;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)defaultFolder;
- (id)defaultOpenActionBundleID;
- (id)firstReceivedFilename;
- (id)saveToDefaultFolderWithError:(id *)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)acceptActionTriggered;
- (void)addOpenWithActions;
- (void)handleMoveToAppShareSheetSucceeded;
- (void)launchFilesToDefaultFolder;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)performActionWithBundleProxy:(id)a3 completionHandler:(id)a4;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)saveAndUpdateTransfer;
- (void)setAvailableApplications:(id)a3;
- (void)setSelectedApplication:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerGenericFiles

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3
{
  return [(SDAirDropHandlerGenericFiles *)self initWithTransfer:a3 bundleIdentifier:0];
}

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerGenericFiles;
  v7 = [(SDAirDropHandler *)&v13 initWithTransfer:v6 bundleIdentifier:a4];
  if (v7)
  {
    v8 = [[SDAirDropHandleriCloudDrive alloc] initWithTransfer:v6];
    icloudDriveHandler = v7->_icloudDriveHandler;
    v7->_icloudDriveHandler = v8;

    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    workOperationsQueue = v7->_workOperationsQueue;
    v7->_workOperationsQueue = v10;

    [(NSOperationQueue *)v7->_workOperationsQueue setMaxConcurrentOperationCount:1];
  }

  return v7;
}

- (BOOL)shouldEndAfterOpen
{
  v3 = [(SDAirDropHandlerGenericFiles *)self defaultOpenActionBundleID];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(SDAirDropHandlerGenericFiles *)self shouldOpenAutomaticallyAfterUserAccepts];
  }

  return v4;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  v8 = [(SDAirDropHandler *)self transfer];
  [v8 setCompletedURLs:v6];

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled]&& ![(SDAirDropHandlerGenericFiles *)self shouldEndAfterOpen])
  {
    id v13 = 0;
    v10 = [(SDAirDropHandlerGenericFiles *)self saveToDefaultFolderWithError:&v13];
    id v9 = v13;
    if ([(SDAirDropHandlerImportResult *)v10 count])
    {
      v11 = [(SDAirDropHandler *)self transfer];
      [v11 setCompletedURLs:v10];

      v12 = objc_alloc_init(SDAirDropHandlerImportResult);
      [(SDAirDropHandlerImportResult *)v12 setImportedFiles:v10];
      v7[2](v7, v12, 0);

      goto LABEL_5;
    }
  }
  else
  {
    id v9 = 0;
  }
  v10 = objc_alloc_init(SDAirDropHandlerImportResult);
  [(SDAirDropHandlerImportResult *)v10 setImportedFiles:v6];
  ((void (**)(id, SDAirDropHandlerImportResult *, id))v7)[2](v7, v10, v9);
LABEL_5:
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDAirDropHandlerGenericFiles *)self shouldEndAfterOpen])
  {
    v8 = [(SDAirDropHandlerGenericFiles *)self availableApplications];
    id v9 = [v8 firstObject];
    [(SDAirDropHandlerGenericFiles *)self setSelectedApplication:v9];

    v10 = [(SDAirDropHandlerGenericFiles *)self selectedApplication];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100104A98;
    v19[3] = &unk_1008CA150;
    id v20 = v7;
    id v11 = v7;
    [(SDAirDropHandlerGenericFiles *)self performActionWithBundleProxy:v10 completionHandler:v19];

    v12 = v20;
  }
  else
  {
    id v13 = objc_opt_class();
    v14 = [(SDAirDropHandlerGenericFiles *)self defaultFolder];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100104AAC;
    v18[3] = &unk_1008CA900;
    v18[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100104AB8;
    v16[3] = &unk_1008CA150;
    id v17 = v7;
    id v15 = v7;
    [v13 launchFilesToDefaultFolderWithURLs:v6 defaultFolder:v14 openURLs:v18 completion:v16];

    v12 = v17;
  }
}

- (BOOL)canHandleTransfer
{
  BOOL v3 = [(SDAirDropHandler *)self isJustFiles];
  p_availableApplications = &self->_availableApplications;
  if (self->_availableApplications) {
    return [(NSArray *)*p_availableApplications count] && v3;
  }
  v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 metaData];
  id v7 = [v6 items];
  id v8 = [v7 count];

  char v9 = !v3;
  if (v8 != (id)1) {
    char v9 = 1;
  }
  if (v9)
  {
    BOOL v3 = 0;
    return [(NSArray *)*p_availableApplications count] && v3;
  }
  v33 = &self->_availableApplications;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v10 = [(SDAirDropHandler *)self transfer];
  id v11 = [v10 metaData];
  v12 = [v11 rawFiles];

  id obj = v12;
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v13)
  {
    id v15 = 0;
    goto LABEL_30;
  }
  id v14 = v13;
  id v15 = 0;
  uint64_t v36 = *(void *)v40;
  uint64_t v35 = kSFOperationFileNameKey;
  uint64_t v16 = kSFOperationFileTypeKey;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v40 != v36) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      v19 = objc_opt_new();
      id v20 = [v18 objectForKeyedSubscript:v35];
      v21 = [v18 objectForKeyedSubscript:v16];
      v22 = +[LSDocumentProxy documentProxyForName:v20 type:v21 MIMEType:0];
      if ((SFIsCoreType() & 1) == 0)
      {
        id v38 = 0;
        v23 = [v22 applicationsAvailableForOpeningFromAirDropWithError:&v38];
        id v24 = v38;
        [v19 addObjectsFromArray:v23];

        if (v24)
        {
          v25 = airdrop_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to get airdrop available applications for opening %@", buf, 0xCu);
          }
        }
      }
      if ([v19 count])
      {
        if (v15) {
          goto LABEL_18;
        }
      }
      else
      {
        id v37 = 0;
        v26 = [v22 applicationsAvailableForOpeningWithError:&v37];
        id v27 = v37;
        [v19 addObjectsFromArray:v26];

        if (v27)
        {
          v28 = airdrop_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to get available applications for opening %@", buf, 0xCu);
          }
        }
        if (v15)
        {
LABEL_18:
          [v15 intersectOrderedSet:v19];
          goto LABEL_25;
        }
      }
      id v15 = v19;
LABEL_25:
    }
    id v14 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v14);
LABEL_30:

  uint64_t v29 = [v15 array];
  p_availableApplications = v33;
  v30 = *v33;
  *v33 = (NSArray *)v29;

  v31 = airdrop_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100107314((uint64_t)v33, v31);
  }

  BOOL v3 = 1;
  return [(NSArray *)*p_availableApplications count] && v3;
}

- (BOOL)isBundleiWorkType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.Keynote"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.Pages"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.Numbers"];
  }

  return v4;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerGenericFiles;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x1000000;
}

- (id)firstReceivedFilename
{
  v2 = [(SDAirDropHandler *)self transfer];
  objc_super v3 = [v2 metaData];
  unsigned __int8 v4 = [v3 rawFiles];
  v5 = [v4 firstObject];
  id v6 = [v5 objectForKeyedSubscript:kSFOperationFileNameKey];

  return v6;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  if (+[SFAirDropUserDefaults_objc moveToAppEnabled])
  {
    v5 = [(SDAirDropHandlerGenericFiles *)self defaultOpenActionBundleID];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  id v7 = [(SDAirDropHandler *)self transfer];
  if ([v7 userResponse] == (id)1)
  {
    id v8 = [(SDAirDropHandler *)self transfer];
    unsigned int v9 = [v8 needsAction] & v6;

    if (v9 == 1)
    {
      SFLocalizedStringForKey();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (v4 == 1)
  {
    id v11 = [(SDAirDropHandlerGenericFiles *)self firstReceivedFilename];
    v12 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906F50];
    unsigned int v13 = [(SDAirDropHandler *)self isModernProgress];
    id v14 = SFLocalizedStringForKey();
    if (v13) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v11, v21);
    }
    else {
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v3, v11);
    }
  }
  else
  {
    CFStringRef v22 = @"GENERIC_FILE";
    id v15 = +[NSNumber numberWithInteger:v4];
    v23 = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v24 = v16;
    id v17 = +[NSArray arrayWithObjects:&v24 count:1];
    v12 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v17];

    LODWORD(v16) = [(SDAirDropHandler *)self isModernProgress];
    v18 = SFLocalizedStringForKey();
    if (v16) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v4, v21);
    }
    else {
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v3, v4);
    }
  }
  id v10 = v19;

LABEL_18:

  return v10;
}

- (void)updatePossibleActions
{
  v24.receiver = self;
  v24.super_class = (Class)SDAirDropHandlerGenericFiles;
  [(SDAirDropHandler *)&v24 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandler *)self transfer];
  if ([v3 userResponse] != (id)1)
  {
    unint64_t v4 = [(SDAirDropHandler *)self handlingAppBundleID];
    if (SFRemovableSystemAppAvailable())
    {
    }
    else
    {
      v5 = [(SDAirDropHandler *)self handlingAppBundleID];
      BOOL v6 = v5 == 0;

      if (!v6) {
        return;
      }
    }
    id v7 = (objc_class *)objc_opt_class();
    objc_super v3 = NSStringFromClass(v7);
    id v8 = objc_alloc((Class)SFAirDropAction);
    unsigned int v9 = [(SDAirDropHandler *)self transfer];
    id v10 = [v9 identifier];
    id v11 = SFLocalizedStringForKey();
    v12 = [(SDAirDropHandler *)self singleItemActionTitle];
    id v13 = [v8 initWithTransferIdentifier:v10 actionIdentifier:v3 title:v11 singleItemTitle:v12 type:1];

    id location = 0;
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100105548;
    uint64_t v21 = &unk_1008CA128;
    objc_copyWeak(&v22, &location);
    [v13 setActionHandler:&v18];
    if (+[SFAirDropUserDefaults_objc moveToAppEnabled])
    {
      id v14 = [(SDAirDropHandlerGenericFiles *)self defaultOpenActionBundleID];
      BOOL v15 = v14 == 0;
    }
    else
    {
      BOOL v15 = 1;
    }
    [v13 setRequiresUnlockedUI:v15];
    id v25 = v13;
    uint64_t v16 = +[NSArray arrayWithObjects:&v25 count:1];
    id v17 = [(SDAirDropHandler *)self transfer];
    [v17 setPossibleActions:v16];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  if (self->_willUseOpenWithAlert)
  {
    objc_super v3 = SFLocalizedStringForKey();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SDAirDropHandlerGenericFiles;
    objc_super v3 = [(SDAirDropHandler *)&v5 cancelActionTitleToAccompanyActions:a3];
  }

  return v3;
}

- (id)actionForBundleProxy:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v4];
  [v5 setMinRequiredTransferState:6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001056C8;
  v8[3] = &unk_1008CD7A8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 setActionHandler:v8];

  return v5;
}

- (BOOL)shouldOpenAutomaticallyAfterUserAccepts
{
  objc_super v3 = [(SDAirDropHandlerGenericFiles *)self availableApplications];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    uint64_t v5 = [(SDAirDropHandlerGenericFiles *)self availableApplications];
    id v6 = [(id)v5 firstObject];
    id v7 = [v6 bundleIdentifier];

    LODWORD(v5) = [v7 hasPrefix:@"com.apple."];
    int v8 = v5 & ([v7 isEqualToString:@"com.apple.TapToRadar"] ^ 1);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)acceptActionTriggered
{
  if (+[SFAirDropUserDefaults_objc moveToAppEnabled])
  {
    [(SDAirDropHandlerGenericFiles *)self saveAndUpdateTransfer];
  }
  else if ([(SDAirDropHandlerGenericFiles *)self shouldOpenAutomaticallyAfterUserAccepts])
  {
    id v4 = [(SDAirDropHandlerGenericFiles *)self availableApplications];
    uint64_t v5 = [v4 firstObject];
    id v7 = [(SDAirDropHandlerGenericFiles *)self actionForBundleProxy:v5];

    id v6 = [v7 actionHandler];
    v6[2](v6, 0);
  }
  else
  {
    [(SDAirDropHandlerGenericFiles *)self addOpenWithActions];
    self->_willUseOpenWithAlert = 1;
  }
}

- (void)addOpenWithActions
{
  objc_super v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_availableApplications;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    int v8 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = -[SDAirDropHandlerGenericFiles actionForBundleProxy:](self, "actionForBundleProxy:", v10, (void)v17);
        [v3 addObject:v11];

        v12 = [v10 bundleIdentifier];
        LODWORD(v11) = [v12 isEqualToString:@"com.apple.DocumentsApp"];

        v8 &= v11 ^ 1;
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    int v8 = 1;
  }

  if ([(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler canHandleTransfer]) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    [(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler setUseOpenWithText:0];
    id v14 = [(SDAirDropHandler *)self completionHandler];
    [(SDAirDropHandler *)self->_icloudDriveHandler setCompletionHandler:v14];

    BOOL v15 = [(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler action];
    [v3 addObject:v15];
  }
  uint64_t v16 = [(SDAirDropHandler *)self transfer];
  [v16 setPossibleActions:v3];
}

- (void)performActionWithBundleProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = [(SDAirDropHandler *)self applicationProxyForBundleProxy:a3];
  int v8 = [v7 bundleIdentifier];
  id v9 = [v7 appState];
  if (([v9 isInstalled] & 1) == 0)
  {

    goto LABEL_14;
  }
  id v10 = [v7 appState];
  unsigned int v11 = [v10 isRestricted];

  if (v11)
  {
LABEL_14:
    objc_super v24 = +[LSApplicationWorkspace defaultWorkspace];
    id v25 = [(SDAirDropHandler *)self transfer];
    v26 = [v25 completedURLs];
    id v27 = [v26 firstObject];
    [v24 _LSFailedToOpenURL:v27 withBundle:v8];

    v6[2](v6, 1);
    goto LABEL_15;
  }
  uint64_t v29 = v7;
  v28 = v6;
  v32 = objc_opt_new();
  v31 = +[LSApplicationWorkspace defaultWorkspace];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v12 = [(SDAirDropHandler *)self transfer];
  BOOL v13 = [v12 completedURLs];

  id obj = v13;
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    uint64_t v17 = LSMoveDocumentOnOpenKey;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v44 = v17;
        v45 = &__kCFBooleanTrue;
        long long v20 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        uint64_t v21 = [v31 operationToOpenResource:v19 usingApplication:v8 uniqueDocumentIdentifier:0 userInfo:v20 delegate:self];
        id v22 = airdrop_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v41 = v29;
          __int16 v42 = 2112;
          uint64_t v43 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Enqueuing resource open operation for %@, with URL: %@", buf, 0x16u);
        }

        [v32 addObject:v21];
        [(SDAirDropHandler *)self logReceiverBundleID:v8 forAppProxy:0 andURL:0];
      }
      id v15 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v15);
  }

  v23 = [v32 lastObject];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100105F88;
  v33[3] = &unk_1008CAD20;
  uint64_t v7 = v29;
  id v34 = v29;
  id v6 = v28;
  uint64_t v35 = v28;
  [v23 setCompletionBlock:v33];

  [(NSOperationQueue *)self->_workOperationsQueue addOperations:v32 waitUntilFinished:0];
LABEL_15:
}

- (id)defaultOpenActionBundleID
{
  return @"com.apple.DocumentsApp";
}

- (void)saveAndUpdateTransfer
{
  objc_super v3 = [(SDAirDropHandlerGenericFiles *)self saveToDefaultFolderWithError:0];
  id v4 = [(SDAirDropHandler *)self transfer];
  [v4 setCompletedURLs:v3];

  id v5 = [(SDAirDropHandler *)self updateTransferStateHandler];
  v5[2](v5, 7);
}

- (id)defaultFolder
{
  if (![(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler iCloudDriveIsAccessible]) {
    goto LABEL_4;
  }
  objc_super v3 = [(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler iCloudDriveURL];

  if (!v3
    || ([(SDAirDropHandleriCloudDrive *)self->_icloudDriveHandler iCloudDriveURL],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 URLByAppendingPathComponent:@"Downloads" isDirectory:1],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
LABEL_4:
    id v5 = sub_1001B2E7C();
  }

  return v5;
}

- (id)saveToDefaultFolderWithError:(id *)a3
{
  id v5 = [(SDAirDropHandlerGenericFiles *)self defaultFolder];
  id v6 = airdrop_log();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(SDAirDropHandler *)self transfer];
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving files to %@ for transfer %@", (uint8_t *)&v14, 0x16u);
    }
    LOBYTE(v14) = 1;
    id v9 = [(SDAirDropHandler *)self transfer];
    id v10 = [v9 completedURLs];
    unsigned int v11 = sub_1001B3434(v10, v5, &v14, a3);

    if (!(_BYTE)v14)
    {
      v12 = airdrop_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100107440((uint64_t)v5, self);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001073B0(self);
    }

    unsigned int v11 = &__NSArray0__struct;
  }

  return v11;
}

+ (void)launchFilesToDefaultFolderWithURLs:(id)a3 defaultFolder:(id)a4 openURLs:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = (void (**)(id, NSObject *))a5;
  v12 = (void (**)(id, BOOL))a6;
  BOOL v13 = airdrop_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Opening files with Files App for transfer", (uint8_t *)&v27, 2u);
  }

  if ([v9 count] == (id)1)
  {
    int v14 = [v9 objectAtIndexedSubscript:0];
    id v15 = [v14 absoluteString];
    __int16 v16 = [v15 stringByReplacingOccurrencesOfString:@"file://" withString:@"shareddocuments://"];

    uint64_t v17 = +[NSURL URLWithString:v16];
    long long v18 = (void *)v17;
    if (v17)
    {
      uint64_t v29 = v17;
      uint64_t v19 = +[NSArray arrayWithObjects:&v29 count:1];
      v11[2](v11, v19);
    }
    else
    {
      uint64_t v19 = airdrop_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001074EC();
      }
    }

    v12[2](v12, v18 != 0);
  }
  else if ([v9 count])
  {
    if (v10)
    {
      long long v20 = [v10 absoluteString];
      uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"file://" withString:@"shareddocuments://"];

      uint64_t v22 = +[NSURL URLWithString:v21];
      v23 = (void *)v22;
      BOOL v24 = v22 != 0;
      if (v22)
      {
        uint64_t v28 = v22;
        id v25 = +[NSArray arrayWithObjects:&v28 count:1];
        v11[2](v11, v25);
      }
      else
      {
        id v25 = airdrop_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1001074EC();
        }
      }
    }
    else
    {
      uint64_t v21 = airdrop_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100107554();
      }
      BOOL v24 = 0;
    }

    v12[2](v12, v24);
  }
  else
  {
    v26 = airdrop_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100107520();
    }

    v12[2](v12, 0);
  }
}

- (void)launchFilesToDefaultFolder
{
  objc_super v3 = objc_opt_class();
  id v4 = [(SDAirDropHandler *)self transfer];
  id v5 = [v4 completedURLs];
  id v6 = [(SDAirDropHandlerGenericFiles *)self defaultFolder];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100106778;
  v8[3] = &unk_1008CA900;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100106784;
  v7[3] = &unk_1008CA0C0;
  v7[4] = self;
  [v3 launchFilesToDefaultFolderWithURLs:v5 defaultFolder:v6 openURLs:v8 completion:v7];
}

- (void)handleMoveToAppShareSheetSucceeded
{
  v2 = [(SDAirDropHandler *)self transfer];
  objc_super v3 = [v2 completedURLs];

  if ([v3 count])
  {
    id v4 = +[NSFileManager defaultManager];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      id v15 = v3;
      id v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        id v10 = 0;
        unsigned int v11 = v8;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
          id v16 = v11;
          unsigned __int8 v13 = [v4 removeItemAtURL:v12 error:&v16];
          id v8 = v16;

          if ((v13 & 1) == 0)
          {
            int v14 = airdrop_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v22 = v12;
              __int16 v23 = 2112;
              id v24 = v8;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not remove file %@ : %@", buf, 0x16u);
            }
          }
          id v10 = (char *)v10 + 1;
          unsigned int v11 = v8;
        }
        while (v7 != v10);
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v7);

      objc_super v3 = v15;
    }
  }
}

- (id)actionsForModernReadyForOpen
{
  objc_super v3 = [(SDAirDropHandlerGenericFiles *)self defaultOpenActionBundleID];

  if (v3)
  {
    id v4 = +[NSMutableArray array];
    location[0] = 0;
    objc_initWeak(location, self);
    id v5 = [(SDAirDropHandlerGenericFiles *)self defaultOpenActionBundleID];
    int v6 = SFRemovableSystemAppAvailable();
    id v40 = 0;
    id v7 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v5 allowPlaceholder:1 error:&v40];
    id v33 = v40;
    if (v7)
    {
      int v32 = v6;
      SFLocalizedStringForKey();
      if (v6) {
        id v8 = {;
      }
        uint64_t v9 = [v7 localizedName];
        id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

        id v11 = objc_alloc((Class)SFAirDropAction);
        uint64_t v12 = [(SDAirDropHandler *)self transfer];
        unsigned __int8 v13 = [v12 identifier];
        int v14 = [v7 bundleIdentifier];
        id v15 = [(SDAirDropHandler *)self singleItemActionTitle];
        id v16 = [v11 initWithTransferIdentifier:v13 actionIdentifier:v14 title:v10 singleItemTitle:v15 type:3];

        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100106EE8;
        v38[3] = &unk_1008CA128;
        long long v17 = &v39;
        objc_copyWeak(&v39, location);
        [v16 setActionHandler:v38];
      }
      else {
        long long v18 = {;
      }
        long long v19 = [v7 localizedName];
        id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);

        id v20 = objc_alloc((Class)SFAirDropAction);
        uint64_t v21 = [(SDAirDropHandler *)self transfer];
        uint64_t v22 = [v21 identifier];
        __int16 v23 = [v7 bundleIdentifier];
        id v24 = [(SDAirDropHandler *)self singleItemActionTitle];
        id v16 = [v20 initWithTransferIdentifier:v22 actionIdentifier:v23 title:v10 singleItemTitle:v24 type:3];

        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100106F28;
        v36[3] = &unk_1008CA128;
        long long v17 = &v37;
        objc_copyWeak(&v37, location);
        [v16 setActionHandler:v36];
      }
      objc_destroyWeak(v17);

      [v16 setMaxTransferState:8];
      int v6 = v32;
      [v4 addObject:v16];
    }
    else
    {
      id v16 = airdrop_ui_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100107588((uint64_t)v5, (uint64_t)v33, v16);
      }
    }

    if (v6)
    {
      id v25 = SFLocalizedStringForKey();
      id v26 = objc_alloc((Class)SFAirDropAction);
      __int16 v27 = [(SDAirDropHandler *)self transfer];
      uint64_t v28 = [v27 identifier];
      uint64_t v29 = [(SDAirDropHandler *)self singleItemActionTitle];
      id v30 = [v26 initWithTransferIdentifier:v28 actionIdentifier:@"SDMoveToAppActionIdentifier" title:v25 singleItemTitle:v29 type:3];

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100106F98;
      v34[3] = &unk_1008CA128;
      objc_copyWeak(&v35, location);
      [v30 setActionHandler:v34];
      [v30 setMaxTransferState:8];
      [v4 addObject:v30];
      objc_destroyWeak(&v35);
    }
    objc_destroyWeak(location);
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v5 = a4;
  int v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SDAirDropHandlerGenericFiles *)self selectedApplication];
    int v8 = 136315650;
    uint64_t v9 = "-[SDAirDropHandlerGenericFiles openResourceOperation:didFinishCopyingResource:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    unsigned __int8 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ to %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SDAirDropHandlerGenericFiles *)self selectedApplication];
    int v6 = 136315394;
    id v7 = "-[SDAirDropHandlerGenericFiles openResourceOperationDidComplete:]";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  int v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100107610(self);
  }
}

- (NSArray)availableApplications
{
  return self->_availableApplications;
}

- (void)setAvailableApplications:(id)a3
{
}

- (LSBundleProxy)selectedApplication
{
  return self->_selectedApplication;
}

- (void)setSelectedApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedApplication, 0);
  objc_storeStrong((id *)&self->_availableApplications, 0);
  objc_storeStrong((id *)&self->_selectedProxy, 0);
  objc_storeStrong((id *)&self->_selectedHandler, 0);
  objc_storeStrong((id *)&self->_icloudDriveHandler, 0);

  objc_storeStrong((id *)&self->_workOperationsQueue, 0);
}

@end