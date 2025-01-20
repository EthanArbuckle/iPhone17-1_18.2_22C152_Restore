@interface SDAirDropHandlerProfiles
- (BOOL)canHandleTransfer;
- (BOOL)importData;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerProfiles)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)triggerImport;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerProfiles

- (SDAirDropHandlerProfiles)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerProfiles;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.Preferences"];
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 metaData];
  v5 = [v4 rawFiles];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:v9];
        v12 = [v11 pathExtension];

        LODWORD(v11) = SFIsManagedConfigurationType();
        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerProfiles;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x400;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v13 = @"PROFILE";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  v14 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  long long v15 = v6;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  LODWORD(v6) = [(SDAirDropHandler *)self isModernProgress];
  uint64_t v9 = SFLocalizedStringForKey();
  if (v6) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4, v12);
  }
  else {
  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);
  }

  return v10;
}

- (void)updatePossibleActions
{
  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerProfiles;
  [(SDAirDropHandler *)&v13 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandler *)self bundleProxy];
  unint64_t v4 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v3];

  id location = 0;
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_100128644;
  v10 = &unk_1008CA128;
  objc_copyWeak(&v11, &location);
  [v4 setActionHandler:&v7];
  v14 = v4;
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v7, v8, v9, v10);
  id v6 = [(SDAirDropHandler *)self transfer];
  [v6 setPossibleActions:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)triggerImport
{
  BOOL v3 = [(SDAirDropHandlerProfiles *)self importData];
  unint64_t v4 = [(SDAirDropHandler *)self completionHandler];
  v4[2](v4, v3, 0, 1);
}

- (BOOL)importData
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(SDAirDropHandler *)self transfer];
  BOOL v3 = [v2 completedURLs];

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v26;
    char v21 = 1;
    *(void *)&long long v5 = 138412546;
    long long v20 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = [v9 path:v20];
        id v24 = 0;
        id v11 = +[NSData dataWithContentsOfFile:v10 options:0 error:&v24];
        id v12 = v24;

        if (v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          long long v15 = +[MCProfileConnection sharedConnection];
          long long v16 = [v9 path];
          long long v17 = [v16 lastPathComponent];
          id v23 = 0;
          id v18 = [v15 queueFileDataForAcceptance:v11 originalFileName:v17 outError:&v23];
          id v12 = v23;

          if (!v12) {
            goto LABEL_17;
          }
          v14 = airdrop_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v30 = v9;
            __int16 v31 = 2112;
            id v32 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to queue file data for acceptance %@ with error: %@", buf, 0x16u);
          }
          char v21 = 0;
        }
        else
        {
          v14 = airdrop_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v30 = v9;
            __int16 v31 = 2112;
            id v32 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to load data for %@ with error: %@", buf, 0x16u);
          }
        }

LABEL_17:
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (!v6) {
        goto LABEL_21;
      }
    }
  }
  char v21 = 1;
LABEL_21:

  return v21 & 1;
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  long long v5 = (void (**)(id, BOOL, void))a4;
  v5[2](v5, [(SDAirDropHandlerProfiles *)self importData], 0);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end