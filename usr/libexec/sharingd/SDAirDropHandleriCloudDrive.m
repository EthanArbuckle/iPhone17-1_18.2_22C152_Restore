@interface SDAirDropHandleriCloudDrive
- (BOOL)canHandleTransfer;
- (BOOL)iCloudDriveIsAccessible;
- (BOOL)shouldEndAfterOpen;
- (BOOL)useOpenWithText;
- (NSURL)iCloudDriveURL;
- (SDAirDropHandleriCloudDrive)initWithTransfer:(id)a3;
- (SFAirDropAction)action;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)openCompletedItemsWithFilesApp;
- (void)saveCompletedItemsToiCloudDrive;
- (void)setUseOpenWithText:(BOOL)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandleriCloudDrive

- (SDAirDropHandleriCloudDrive)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandleriCloudDrive;
  v3 = [(SDAirDropHandler *)&v9 initWithTransfer:a3];
  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    v5 = off_100966CF8();
    uint64_t v6 = [v4 URLForUbiquityContainerIdentifier:v5];
    iCloudDriveURL = v3->_iCloudDriveURL;
    v3->_iCloudDriveURL = (NSURL *)v6;

    v3->_useOpenWithText = 1;
  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  if (SFFilesAppAvailable()) {
    return 1;
  }
  v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Files App not available", buf, 2u);
  }

  iCloudDriveURL = self->_iCloudDriveURL;
  id v9 = 0;
  unsigned __int8 v3 = [(NSURL *)iCloudDriveURL checkResourceIsReachableAndReturnError:&v9];
  id v6 = v9;
  if ((v3 & 1) == 0)
  {
    v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iCloud drive not enabled or accessible. Error: %@", buf, 0xCu);
    }
  }
  return v3;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriCloudDrive;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x1000000;
}

- (id)suitableContentsDescription
{
  return (id)SFLocalizedStringForKey();
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  return (id)SFLocalizedStringForKey();
}

- (void)updatePossibleActions
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandleriCloudDrive;
  [(SDAirDropHandler *)&v6 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandleriCloudDrive *)self action];
  v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(SDAirDropHandler *)self transfer];
  [v5 setPossibleActions:v4];
}

- (SFAirDropAction)action
{
  action = self->_action;
  if (!action)
  {
    char v4 = SFFilesAppAvailable();
    v5 = SFLocalizedStringForKey();
    id v6 = objc_alloc((Class)SFAirDropAction);
    v7 = [(SDAirDropHandler *)self transfer];
    v8 = [v7 identifier];
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [(SDAirDropHandler *)self singleItemActionTitle];
    v12 = (SFAirDropAction *)[v6 initWithTransferIdentifier:v8 actionIdentifier:v10 title:v5 singleItemTitle:v11 type:1];
    v13 = self->_action;
    self->_action = v12;

    id location = 0;
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008FCC8;
    v15[3] = &unk_1008CBDD0;
    char v17 = v4;
    objc_copyWeak(&v16, &location);
    [(SFAirDropAction *)self->_action setActionHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    action = self->_action;
  }

  return action;
}

- (void)openCompletedItemsWithFilesApp
{
  objc_super v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(SDAirDropHandler *)self transfer];
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Opening files with Files App for transfer %@", buf, 0xCu);
  }
  v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 completedURLs];
  id v7 = [v6 count];

  if (v7)
  {
    v8 = [(SDAirDropHandler *)self transfer];
    id v9 = [v8 completedURLs];
    id v10 = [v9 count];

    if (v10)
    {
      v12 = 0;
      uint64_t v13 = LSMoveDocumentOnOpenKey;
      *(void *)&long long v11 = 138412290;
      long long v30 = v11;
      do
      {
        v14 = [(SDAirDropHandler *)self transfer];
        v15 = [v14 completedURLs];
        BOOL v16 = v12 == (char *)[v15 count] - 1;

        char v17 = [(SDAirDropHandler *)self transfer];
        v18 = [v17 completedURLs];
        v19 = [v18 objectAtIndexedSubscript:v12];

        v20 = airdrop_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Trying to open URL %@", buf, 0xCu);
        }

        uint64_t v36 = v13;
        v37 = &__kCFBooleanTrue;
        v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v22 = +[LSApplicationWorkspace defaultWorkspace];
        v23 = [v22 operationToOpenResource:v19 usingApplication:@"com.apple.DocumentsApp" userInfo:v21];

        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000900AC;
        v31[3] = &unk_1008CBDF8;
        BOOL v34 = v16;
        id v32 = v19;
        v33 = self;
        char v35 = 1;
        id v24 = v19;
        [v23 setCompletionBlock:v31];
        [v23 start];

        ++v12;
        v25 = [(SDAirDropHandler *)self transfer];
        v26 = [v25 completedURLs];
        v27 = (char *)[v26 count];
      }
      while (v12 < v27);
    }
  }
  else
  {
    v28 = airdrop_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000904BC(v28);
    }

    v29 = [(SDAirDropHandler *)self completionHandler];
    v29[2](v29, 0, 0, 1);
  }
}

- (void)saveCompletedItemsToiCloudDrive
{
  unsigned __int8 v14 = 0;
  iCloudDriveURL = self->_iCloudDriveURL;
  char v4 = airdrop_log();
  v5 = v4;
  if (iCloudDriveURL)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SDAirDropHandler *)self transfer];
      *(_DWORD *)buf = 138412290;
      BOOL v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving files to iCloud Drive for transfer %@", buf, 0xCu);
    }
    id v7 = [(SDAirDropHandler *)self transfer];
    v8 = [v7 completedURLs];
    id v9 = self->_iCloudDriveURL;
    id v13 = 0;
    id v10 = sub_1001B3434(v8, v9, &v14, &v13);
    v5 = v13;

    if (!v14)
    {
      long long v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100090544(self, (uint64_t)v5, v11);
      }
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100090500(v5);
  }

  v12 = [(SDAirDropHandler *)self completionHandler];
  v12[2](v12, v14, 0, 1);
}

- (BOOL)iCloudDriveIsAccessible
{
  iCloudDriveURL = self->_iCloudDriveURL;
  uint64_t v4 = 0;
  return [(NSURL *)iCloudDriveURL checkResourceIsReachableAndReturnError:&v4];
}

- (NSURL)iCloudDriveURL
{
  return self->_iCloudDriveURL;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (BOOL)useOpenWithText
{
  return self->_useOpenWithText;
}

- (void)setUseOpenWithText:(BOOL)a3
{
  self->_useOpenWithText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_iCloudDriveURL, 0);
}

@end