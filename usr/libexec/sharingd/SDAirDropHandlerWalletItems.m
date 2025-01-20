@interface SDAirDropHandlerWalletItems
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerWalletItems)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)importPassesWithCompletion:(id)a3;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)triggerImport;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerWalletItems

- (SDAirDropHandlerWalletItems)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerWalletItems;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.Passbook"];
}

- (BOOL)canHandleTransfer
{
  unsigned int v3 = [(SDAirDropHandler *)self isJustFiles];
  int v4 = SFWalletAppAvailable();
  if (![(objc_class *)off_100967550() isPassLibraryAvailable]) {
    return 0;
  }
  int v5 = v3 & v4;
  unsigned int v6 = [(objc_class *)off_100967558() canAddPasses];
  BOOL v7 = 0;
  if (v5 == 1 && v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = [(SDAirDropHandler *)self transfer];
    v9 = [v8 metaData];
    v10 = [v9 rawFiles];

    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      uint64_t v14 = kSFOperationFileTypeKey;
      uint64_t v15 = kSFOperationFileNameKey;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v18 = [v17 objectForKeyedSubscript:v14];
          v19 = [v17 objectForKeyedSubscript:v15];
          v20 = [v19 pathExtension];

          LODWORD(v19) = SFIsPass();
          if (!v19)
          {
            BOOL v7 = 0;
            goto LABEL_15;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 1;
LABEL_15:
  }
  return v7;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerWalletItems;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x2000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  int v5 = [(SDAirDropHandler *)self transfer];
  unsigned int v6 = [v5 metaData];
  BOOL v7 = [v6 itemsDescription];
  if ([v7 length])
  {
    v8 = [(SDAirDropHandler *)self transfer];
    v9 = [v8 metaData];
    v10 = [v9 itemsDescription];
  }
  else
  {
    v10 = 0;
  }

  id v11 = 0;
  if (v4 != 1 || !v10) {
    goto LABEL_10;
  }
  id v11 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906F38];
  unsigned int v12 = [(SDAirDropHandler *)self isModernProgress];
  uint64_t v13 = SFLocalizedStringForKey();
  if (v12) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v10, v21);
  }
  else {
  uint64_t v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3, v10);
  }

  if (!v14)
  {
LABEL_10:
    CFStringRef v22 = @"PASS";
    uint64_t v15 = +[NSNumber numberWithUnsignedInteger:v4];
    long long v23 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    long long v24 = v16;
    v17 = +[NSArray arrayWithObjects:&v24 count:1];
    uint64_t v18 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v17];

    LODWORD(v15) = [(SDAirDropHandler *)self isModernProgress];
    v19 = SFLocalizedStringForKey();
    if (v15) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v4, v21);
    }
    else {
    uint64_t v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v3, v4);
    }

    id v11 = (void *)v18;
  }

  return v14;
}

- (void)updatePossibleActions
{
  v20.receiver = self;
  v20.super_class = (Class)SDAirDropHandlerWalletItems;
  [(SDAirDropHandler *)&v20 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandler *)self bundleProxy];

  if (v3)
  {
    unint64_t v4 = [(SDAirDropHandler *)self bundleProxy];
    id v5 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v4];
  }
  else
  {
    id v6 = objc_alloc((Class)SFAirDropAction);
    unint64_t v4 = [(SDAirDropHandler *)self transfer];
    BOOL v7 = [v4 identifier];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [(SDAirDropHandler *)self singleItemActionTitle];
    id v11 = [(SDAirDropHandler *)self singleItemActionTitle];
    id v5 = [v6 initWithTransferIdentifier:v7 actionIdentifier:v9 title:v10 singleItemTitle:v11 type:1];
  }
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000F40B0;
  v17 = &unk_1008CA128;
  objc_copyWeak(&v18, &location);
  [v5 setActionHandler:&v14];
  id v21 = v5;
  unsigned int v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v14, v15, v16, v17);
  uint64_t v13 = [(SDAirDropHandler *)self transfer];
  [v13 setPossibleActions:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)triggerImport
{
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F41B4;
  v3[3] = &unk_1008CD298;
  objc_copyWeak(&v4, &location);
  [(SDAirDropHandlerWalletItems *)self importPassesWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)importPassesWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(objc_class *)off_100967550() isPassLibraryAvailable]
    && [(objc_class *)off_100967558() canAddPasses])
  {
    long long v23 = v5;
    id v22 = objc_alloc_init(off_100967550());
    long long v24 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = [(SDAirDropHandler *)self transfer];
    BOOL v7 = [v6 completedURLs];

    id v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v29 = 0;
          uint64_t v13 = +[NSData dataWithContentsOfURL:v12 options:0 error:&v29];
          id v14 = v29;
          if (v14)
          {
            id v15 = v14;
            v16 = airdrop_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v35 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Wallet pass add failed %@", buf, 0xCu);
            }
          }
          else
          {
            id v17 = objc_alloc((Class)off_100967560());
            id v28 = 0;
            v16 = [v17 initWithData:v13 error:&v28];
            id v15 = v28;
            if (v15 || !v16)
            {
              id v18 = airdrop_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v35 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "PKPass initWithData failed %@", buf, 0xCu);
              }
            }
            else
            {
              [v24 addObject:v16];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000F4654;
    v25[3] = &unk_1008CD2C0;
    id v26 = v24;
    id v5 = v23;
    id v27 = v23;
    id v19 = v24;
    [v22 addPasses:v19 withCompletionHandler:v25];
  }
  else
  {
    objc_super v20 = airdrop_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000F49C8(v20);
    }

    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SDAirDropHandlerWalletItems.m", 161, @"%@ not supported on this platform", objc_opt_class() object file lineNumber description];

    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000F4784;
  v6[3] = &unk_1008CD2E8;
  id v7 = a4;
  id v5 = v7;
  [(SDAirDropHandlerWalletItems *)self importPassesWithCompletion:v6];
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

@end