@interface SDAirDropHandler
+ (id)alertMessageLocalizedKeyForTypeDicts:(id)a3 senderIsMe:(BOOL)a4 isVerifiableIdentity:(BOOL)a5 isModernProgress:(BOOL)a6 transferState:(unint64_t)a7;
+ (id)persistedTransfersBaseURL;
+ (id)transferURLForTransfer:(id)a3;
+ (void)logReceiverBundleID:(id)a3 forURL:(id)a4;
- (BOOL)canAutoAccept;
- (BOOL)canHandleTransfer;
- (BOOL)handlingAppInstalled;
- (BOOL)hasFiles;
- (BOOL)hasLinks;
- (BOOL)isActivated;
- (BOOL)isJustFiles;
- (BOOL)isJustLinks;
- (BOOL)isModernProgress;
- (BOOL)openURLs:(id)a3;
- (BOOL)openURLs:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)shouldEndAfterOpen;
- (BOOL)supportsAutoOpen;
- (LSBundleProxy)bundleProxy;
- (NSString)defaultOpenActionBundleID;
- (NSString)handlingAppBundleID;
- (NSString)senderName;
- (NSString)singleItemActionTitle;
- (NSString)suitableContentsDescription;
- (NSString)suitableContentsTitle;
- (SDAirDropHandler)init;
- (SDAirDropHandler)initWithTransfer:(id)a3;
- (SDAirDropHandler)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (SFAirDropTransfer)transfer;
- (id)actionsForModernReadyForOpen;
- (id)alertMessageLocalizedKeyForTypeDicts:(id)a3;
- (id)applicationProxyForBundleProxy:(id)a3;
- (id)bundleProxyFromCandidateIdentifiers:(id)a3 handlesURL:(id)a4;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)completionHandler;
- (id)defaultActionForBundleProxy:(id)a3;
- (id)defaultFolder;
- (id)description;
- (id)moveToShareSheetCompletion;
- (id)updateTransferStateHandler;
- (int64_t)transferTypes;
- (unint64_t)totalSharedItemsCount;
- (void)actionSelected:(id)a3;
- (void)activate;
- (void)addStatusMonitorObservers;
- (void)dealloc;
- (void)handleMoveToAppShareSheetCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)launchMoveToAppShareSheetForFiles:(id)a3;
- (void)logReceiverBundleID:(id)a3 forAppProxy:(id)a4 andURL:(id)a5;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performOpenSharesheetActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithURLs:(id)a3;
- (void)prepareForAcceptWithCompletion:(id)a3;
- (void)prepareOrPerformOpenAction;
- (void)removeItemAtURLToFreeUpSpace:(id)a3;
- (void)removeNotificationObservers;
- (void)setBundleProxy:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHandlingAppBundleID:(id)a3;
- (void)setHandlingAppInstalled:(BOOL)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setMoveToShareSheetCompletion:(id)a3;
- (void)setTransfer:(id)a3;
- (void)setUpdateTransferStateHandler:(id)a3;
- (void)transferUpdated;
- (void)triggerSelectedActionIfAppropriate;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandler

- (SDAirDropHandler)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[NSException raise:NSGenericException, @"%@ is not a valid initializer for %@", v3, v5 format];

  return [(SDAirDropHandler *)self initWithTransfer:0];
}

- (SDAirDropHandler)initWithTransfer:(id)a3
{
  return [(SDAirDropHandler *)self initWithTransfer:a3 bundleIdentifier:0];
}

- (SDAirDropHandler)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SDAirDropHandler;
  v8 = [(SDAirDropHandler *)&v24 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_20;
  }
  [(SDAirDropHandler *)v8 setTransfer:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [v6 metaData];
  v11 = [v10 items];

  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!v9->_hasFiles) {
          v9->_hasFiles = [*(id *)(*((void *)&v20 + 1) + 8 * i) isFile];
        }
        if (!v9->_hasLinks) {
          v9->_hasLinks = [v16 isFile] ^ 1;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  if (v7 && (SFRemovableSystemAppAvailable() & 1) == 0)
  {
    if (SFRemovableSystemAppAvailable()) {
      goto LABEL_17;
    }
    char v17 = 0;
  }
  else
  {
    char v17 = 1;
  }
  v9->_handlingAppInstalled = v17;
LABEL_17:
  objc_storeStrong((id *)&v9->_handlingAppBundleID, a4);
  if (v7 && v9->_handlingAppInstalled)
  {
    v18 = +[LSBundleProxy bundleProxyForIdentifier:v7];
    [(SDAirDropHandler *)v9 setBundleProxy:v18];
  }
LABEL_20:

  return v9;
}

- (void)dealloc
{
  if ([(SDAirDropHandler *)self isActivated]) {
    [(SDAirDropHandler *)self removeNotificationObservers];
  }
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandler;
  [(SDAirDropHandler *)&v3 dealloc];
}

- (void)activate
{
  int64_t v3 = [(SDAirDropHandler *)self transferTypes];
  v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 metaData];
  [v5 setTransferTypes:v3];

  [(SDAirDropHandler *)self addStatusMonitorObservers];

  [(SDAirDropHandler *)self setIsActivated:1];
}

- (id)description
{
  uint64_t v8 = objc_opt_class();
  NSAppendPrintF();
  id v11 = 0;
  v9 = [(SFAirDropTransfer *)self->_transfer identifier];
  NSAppendPrintF();
  id v3 = v11;

  bundleProxy = self->_bundleProxy;
  if (bundleProxy)
  {
    v10 = [(LSBundleProxy *)bundleProxy bundleIdentifier];
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  NSAppendPrintF();
  id v6 = v3;

  return v6;
}

- (void)transferUpdated
{
  id v15 = [(SDAirDropHandler *)self transfer];
  id v3 = [v15 selectedAction];

  if (v3)
  {
    [(SDAirDropHandler *)self triggerSelectedActionIfAppropriate];
LABEL_8:
    id v5 = v15;
    goto LABEL_9;
  }
  v4 = [v15 selectedAction];
  if (v4)
  {

    id v5 = v15;
  }
  else
  {
    id v13 = [v15 possibleActions];
    id v14 = [v13 count];

    id v5 = v15;
    if (v14) {
      goto LABEL_9;
    }
  }
  unint64_t v6 = (unint64_t)[v5 transferState];
  id v5 = v15;
  if (v6 > 9) {
    goto LABEL_9;
  }
  if (((1 << v6) & 0x25E) != 0)
  {
    [(SDAirDropHandler *)self updatePossibleActions];
    goto LABEL_8;
  }
  if (v6 == 7)
  {
    [(SDAirDropHandler *)self prepareOrPerformOpenAction];
    goto LABEL_8;
  }
LABEL_9:
  id v7 = [v5 possibleActions];
  uint64_t v8 = [(SDAirDropHandler *)self cancelActionTitleToAccompanyActions:v7];

  v9 = [v15 cancelAction];
  [v9 setLocalizedTitle:v8];

  v10 = [v15 cancelAction];
  [v10 setSingleItemLocalizedTitle:v8];

  id v11 = [(SDAirDropHandler *)self suitableContentsTitle];
  [v15 setContentsTitle:v11];

  id v12 = [(SDAirDropHandler *)self suitableContentsDescription];
  [v15 setContentsDescription:v12];
}

- (void)actionSelected:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(SDAirDropHandler *)self transfer];
  id v7 = [v6 cancelAction];
  unsigned int v8 = [v7 isEqual:v5];

  if (!v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = [(SDAirDropHandler *)self transfer];
    id v14 = [v13 possibleActions];

    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      char v17 = 0;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v14);
          }
          long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v20 isEqual:v5])
          {
            id v21 = v20;

            char v17 = v21;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);

      if (v17)
      {
        long long v22 = [(SDAirDropHandler *)self transfer];
        [v22 setSelectedAction:v17];

        long long v23 = [(SDAirDropHandler *)self transfer];
        [v23 setPossibleActions:0];

        if ([v17 shouldUpdateUserResponse])
        {
          objc_super v24 = [(SDAirDropHandler *)self transfer];
          id v25 = [v24 userResponse];

          if (!v25)
          {
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100013054;
            v26[3] = &unk_1008CA0C0;
            v26[4] = self;
            [(SDAirDropHandler *)self prepareForAcceptWithCompletion:v26];
          }
        }
        [(SDAirDropHandler *)self triggerSelectedActionIfAppropriate];
        goto LABEL_19;
      }
    }
    else
    {
    }
    char v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SDAirDropHandler.m", 221, @"Failed to find localAction for %@", v5 object file lineNumber description];
LABEL_19:

    goto LABEL_20;
  }
  v9 = [(SDAirDropHandler *)self transfer];
  v10 = [v9 cancelAction];
  id v11 = [(SDAirDropHandler *)self transfer];
  [v11 setSelectedAction:v10];

  id v12 = [(SDAirDropHandler *)self transfer];
  [v12 setUserResponse:2];

LABEL_20:
}

- (void)triggerSelectedActionIfAppropriate
{
  id v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 selectedAction];

  if (v4)
  {
    id v5 = [(SDAirDropHandler *)self transfer];
    id v6 = [v5 transferState];
    id v7 = [v4 minRequiredTransferState];

    if (v6 >= v7)
    {
      v10 = [(SDAirDropHandler *)self transfer];
      id v11 = [v10 transferState];
      id v12 = [v4 maxTransferState];

      if (v11 > v12)
      {
        id v13 = airdrop_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          long long v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot trigger action %@ as it is past requirement", (uint8_t *)&v21, 0xCu);
        }

        uint64_t v8 = [(SDAirDropHandler *)self transfer];
        [(id)v8 setSelectedAction:0];
        goto LABEL_17;
      }
      if (![v4 requiresUnlockedUI]
        || (+[SDStatusMonitor sharedMonitor],
            id v14 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v15 = [v14 deviceUIUnlocked],
            v14,
            (v15 & 1) != 0))
      {
        id v16 = [(SDAirDropHandler *)self transfer];
        id v17 = [v16 transferState];

        if (v17 == (id)4)
        {
          uint64_t v18 = [(SDAirDropHandler *)self transfer];
          [v18 setTransferState:6];
        }
        v19 = airdrop_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          long long v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Triggering action %@", (uint8_t *)&v21, 0xCu);
        }

        long long v20 = [(SDAirDropHandler *)self transfer];
        [v20 setSelectedAction:0];

        uint64_t v8 = [v4 actionHandler];
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
        goto LABEL_17;
      }
      uint64_t v8 = airdrop_log();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        long long v22 = v4;
        v9 = "Delaying trigger of action %@ till UI unlock";
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v8 = airdrop_log();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        long long v22 = v4;
        v9 = "Delaying trigger of action %@ till transferState reaches requirement";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v21, 0xCu);
      }
    }
LABEL_17:
  }
}

- (void)addStatusMonitorObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"lockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
}

- (void)removeNotificationObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  if (self->_hasLinks) {
    return (32 * self->_hasFiles) | 0x2000000;
  }
  else {
    return 32 * self->_hasFiles;
  }
}

- (NSString)suitableContentsTitle
{
  return (NSString *)SFLocalizedStringForKey();
}

- (NSString)suitableContentsDescription
{
  return (NSString *)&stru_1008E7020;
}

- (BOOL)canAutoAccept
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)supportsAutoOpen
{
  return 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (NSString)singleItemActionTitle
{
  return (NSString *)SFLocalizedStringForKey();
}

- (NSString)defaultOpenActionBundleID
{
  return 0;
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  id v3 = [(SDAirDropHandler *)self transfer];
  [v3 transferState];

  v4 = SFLocalizedStringForKey();

  return v4;
}

- (void)updatePossibleActions
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 cancelAction];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v6 = SFLocalizedStringForKey();
    id v7 = objc_alloc((Class)SFAirDropAction);
    uint64_t v8 = [(SDAirDropHandler *)self transfer];
    v9 = [v8 identifier];
    id v10 = [v7 initWithTransferIdentifier:v9 actionIdentifier:@"SDCancelActionIdentifier" title:v6 singleItemTitle:v6 type:2];

    [v10 setMinRequiredTransferState:1];
    [v10 setMaxTransferState:4];
    [v10 setActionHandler:&stru_1008CA100];
    id v11 = [(SDAirDropHandler *)self transfer];
    [v11 setCancelAction:v10];
  }
  id v12 = [(SDAirDropHandler *)self transfer];
  if ([v12 transferState] == (id)3)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v14 = [(SDAirDropHandler *)self transfer];
    BOOL v13 = [v14 transferState] == (id)9;
  }
  if ((SFRemovableSystemAppAvailable() & 1) == 0)
  {
    if (self->_handlingAppBundleID) {
      char v15 = v13;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
      id v16 = objc_alloc((Class)SFAirDropAction);
      id v17 = [(SDAirDropHandler *)self transfer];
      uint64_t v18 = [v17 identifier];
      v19 = +[LSApplicationProxy applicationProxyForSystemPlaceholder:self->_handlingAppBundleID];
      long long v20 = [v19 localizedName];
      int v21 = [(SDAirDropHandler *)self singleItemActionTitle];
      id v22 = [v16 initWithTransferIdentifier:v18 actionIdentifier:@"SDUninstalledAppActionIdentifier" title:v20 singleItemTitle:v21 type:1];

      id v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      long long v27 = sub_1000138D0;
      long long v28 = &unk_1008CA128;
      objc_copyWeak(&v29, &location);
      [v22 setActionHandler:&v25];
      id v31 = v22;
      long long v23 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1, v25, v26, v27, v28);
      objc_super v24 = [(SDAirDropHandler *)self transfer];
      [v24 setPossibleActions:v23];

      objc_destroyWeak(&v29);
    }
  }
  objc_destroyWeak(&location);
}

- (void)prepareOrPerformOpenAction
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  [v3 dockHasDownloadsFolder];

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled])
  {
    id v13 = [(SDAirDropHandler *)self actionsForModernReadyForOpen];
    BOOL v5 = [(SDAirDropHandler *)self transfer];
    [v5 setPossibleActions:v13];
  }
  else
  {
    id v6 = SFLocalizedStringForKey();
    id v7 = objc_alloc((Class)SFAirDropAction);
    uint64_t v8 = [(SDAirDropHandler *)self transfer];
    v9 = [v8 identifier];
    id v10 = [v7 initWithTransferIdentifier:v9 actionIdentifier:@"SDOpenActionIdentifier" title:v6 singleItemTitle:v6 type:3];

    [v10 setMinRequiredTransferState:7];
    [v10 setMaxTransferState:7];
    id location = 0;
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013C70;
    v14[3] = &unk_1008CA128;
    objc_copyWeak(&v15, &location);
    [v10 setActionHandler:v14];
    id v17 = v10;
    id v11 = +[NSArray arrayWithObjects:&v17 count:1];
    id v12 = [(SDAirDropHandler *)self transfer];
    [v12 setPossibleActions:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (id)defaultFolder
{
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 temporaryDirectory];

  return v3;
}

+ (id)persistedTransfersBaseURL
{
  v2 = sub_1001B2E7C();
  id v3 = [v2 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1];

  return v3;
}

+ (id)transferURLForTransfer:(id)a3
{
  id v3 = a3;
  v4 = [v3 customDestinationURL];

  if (v4)
  {
    BOOL v5 = [v3 customDestinationURL];
  }
  else
  {
    id v6 = +[SDAirDropHandler persistedTransfersBaseURL];
    id v7 = [v3 identifier];
    BOOL v5 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];
  }

  return v5;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  BOOL v5 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SDAirDropHandlerImportResult);
  [(SDAirDropHandlerImportResult *)v7 setImportedFiles:v6];

  v5[2](v5, v7, 0);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  v6[2](v6, [(SDAirDropHandler *)self openURLs:a3], 0);
}

- (void)performOpenSharesheetActionWithImportedURLs:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014030;
  v8[3] = &unk_1008CA150;
  id v9 = a4;
  id v6 = v9;
  id v7 = a3;
  [(SDAirDropHandler *)self setMoveToShareSheetCompletion:v8];
  [(SDAirDropHandler *)self launchMoveToAppShareSheetForFiles:v7];
}

- (void)prepareForAcceptWithCompletion:(id)a3
{
}

- (id)actionsForModernReadyForOpen
{
  return &__NSArray0__struct;
}

- (void)performViewActionWithURLs:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  BOOL v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[SDAirDropHandler openURLs:](self, "openURLs:", v5, v6);
}

- (void)launchMoveToAppShareSheetForFiles:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 firstObject];
  unsigned __int8 v6 = [v5 isFileURL];

  if ((v6 & 1) == 0)
  {
    id v7 = [(SDAirDropHandler *)self transfer];
    uint64_t v8 = [v7 completedURLs];

    id v4 = (id)v8;
  }
  if ([v4 count])
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v9 = objc_alloc_init(_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000142FC;
    v15[3] = &unk_1008CA1A0;
    objc_copyWeak(&v16, &location);
    [(SDAirDropMoveToAppShareSheet *)v9 showShareSheetWith:v4 completion:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100015888();
    }

    id v11 = [(SDAirDropHandler *)self moveToShareSheetCompletion];

    if (v11)
    {
      id v12 = [(SDAirDropHandler *)self moveToShareSheetCompletion];
      v12[2](v12, 0);

      [(SDAirDropHandler *)self setMoveToShareSheetCompletion:0];
    }
    id v13 = [(SDAirDropHandler *)self completionHandler];

    if (v13)
    {
      id v14 = [(SDAirDropHandler *)self completionHandler];
      v14[2](v14, 0, 0, 1);
    }
  }
}

- (void)handleMoveToAppShareSheetCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    [(SDAirDropHandler *)self handleMoveToAppShareSheetSucceeded];
  }
  else
  {
    id v7 = airdrop_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v8) {
        sub_1000158F0((uint64_t)v6, v7);
      }
    }
    else if (v8)
    {
      sub_1000158BC();
    }
  }
  id v9 = [(SDAirDropHandler *)self moveToShareSheetCompletion];

  if (v9)
  {
    id v10 = [(SDAirDropHandler *)self moveToShareSheetCompletion];
    v10[2](v10, v4);

    [(SDAirDropHandler *)self setMoveToShareSheetCompletion:0];
  }
  id v11 = [(SDAirDropHandler *)self completionHandler];

  if (v11)
  {
    id v12 = [(SDAirDropHandler *)self completionHandler];
    v12[2](v12, 1, 0, 1);
  }
}

- (id)defaultActionForBundleProxy:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SDAirDropHandler.m" lineNumber:528 description:@"Cannot generate default action for nil bundleProxy"];
  }
  id v6 = objc_alloc((Class)SFAirDropAction);
  id v7 = [(SDAirDropHandler *)self transfer];
  BOOL v8 = [v7 identifier];
  id v9 = [v5 bundleIdentifier];
  id v10 = [v5 localizedName];
  id v11 = [(SDAirDropHandler *)self singleItemActionTitle];
  id v12 = [v6 initWithTransferIdentifier:v8 actionIdentifier:v9 title:v10 singleItemTitle:v11 type:1];

  return v12;
}

- (id)applicationProxyForBundleProxy:(id)a3
{
  id v3 = [a3 bundleIdentifier];
  BOOL v4 = +[LSApplicationProxy applicationProxyForIdentifier:v3];

  return v4;
}

- (BOOL)isJustFiles
{
  return self->_hasFiles && !self->_hasLinks;
}

- (BOOL)isJustLinks
{
  return !self->_hasFiles && self->_hasLinks;
}

- (BOOL)isModernProgress
{
  return +[SFAirDropUserDefaults_objc systemLevelProgressEnabled];
}

- (unint64_t)totalSharedItemsCount
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SDAirDropHandler *)self transfer];
  id v3 = [v2 metaData];
  BOOL v4 = [v3 items];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += (unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * i) count];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)alertMessageLocalizedKeyForTypeDicts:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(SDAirDropHandler *)self transfer];
  unint64_t v7 = [v6 metaData];
  id v8 = [v7 senderIsMe];
  id v9 = [(SDAirDropHandler *)self transfer];
  id v10 = [v9 metaData];
  id v11 = [v10 isVerifiableIdentity];
  BOOL v12 = [(SDAirDropHandler *)self isModernProgress];
  long long v13 = [(SDAirDropHandler *)self transfer];
  long long v14 = [v5 alertMessageLocalizedKeyForTypeDicts:v4 senderIsMe:v8 isVerifiableIdentity:v11 isModernProgress:v12 transferState:[v13 transferState]];

  return v14;
}

+ (id)alertMessageLocalizedKeyForTypeDicts:(id)a3 senderIsMe:(BOOL)a4 isVerifiableIdentity:(BOOL)a5 isModernProgress:(BOOL)a6 transferState:(unint64_t)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  int v9 = a4;
  id v10 = a3;
  if (v7) {
    CFStringRef v11 = @"MODERN_TRANSFER";
  }
  else {
    CFStringRef v11 = @"TRANSFER_FROM";
  }
  BOOL v12 = +[NSMutableString stringWithString:v11];
  long long v13 = airdrop_ui_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v7) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "isModernProgress: %@", buf, 0xCu);
  }

  BOOL v30 = v7;
  if (!v7)
  {
    if ((v8 & ~v9) != 0) {
      CFStringRef v15 = @"_PERSON";
    }
    else {
      CFStringRef v15 = @"_DEVICE";
    }
    [v12 appendString:v15];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v10;
  id v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v21 = [v20 allKeys];
        id v22 = [v21 firstObject];

        [v12 appendFormat:@"_%@", v22];
        long long v23 = [v20 allValues];
        objc_super v24 = [v23 firstObject];
        uint64_t v25 = (uint64_t)[v24 integerValue];

        if (v25 <= 1) {
          CFStringRef v26 = &stru_1008E7020;
        }
        else {
          CFStringRef v26 = @"_PLURAL";
        }
        [v12 appendString:v26];
      }
      id v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  if (v30)
  {
    if (a7 - 2 > 7) {
      goto LABEL_31;
    }
    CFStringRef v27 = @"_CAPITALIZED";
  }
  else
  {
    CFStringRef v27 = @"_IN_PROGRESS";
    switch(a7)
    {
      case 1uLL:
      case 3uLL:
        if (obj) {
          goto LABEL_31;
        }
        CFStringRef v27 = @"_CANCELED";
        break;
      case 2uLL:
        break;
      case 4uLL:
      case 6uLL:
      case 8uLL:
        goto LABEL_31;
      case 7uLL:
        CFStringRef v27 = @"_COMPLETED";
        break;
      default:
        if (obj) {
          goto LABEL_31;
        }
        CFStringRef v27 = @"_FAILED";
        break;
    }
  }
  [v12 appendString:v27];
LABEL_31:
  [v12 appendString:@"_TEXT"];
  id v28 = [v12 copy];

  return v28;
}

- (id)bundleProxyFromCandidateIdentifiers:(id)a3 handlesURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[LSApplicationWorkspace defaultWorkspace];
  int v9 = [v8 URLOverrideForURL:v7];

  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100014DD8;
  long long v20 = &unk_1008CA1C8;
  id v21 = v6;
  id v22 = self;
  id v10 = v6;
  CFStringRef v11 = objc_retainBlock(&v17);
  BOOL v12 = +[LSApplicationWorkspace defaultWorkspace];
  long long v13 = [v12 applicationsAvailableForOpeningURL:v9];

  CFStringRef v14 = [v13 firstObject];
  CFStringRef v15 = ((void (*)(void ***, void *))v11[2])(v11, v14);

  return v15;
}

- (NSString)senderName
{
  v2 = [(SDAirDropHandler *)self transfer];
  id v3 = [v2 metaData];
  id v4 = [v3 senderCompositeName];

  id v5 = SFTruncateAirDropSenderNameForUI();

  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  BOOL v8 = [v7 stringByReplacingOccurrencesOfString:@"\t" withString:@" "];

  int v9 = [v8 stringByReplacingOccurrencesOfString:&stru_1008E7380 withString:&stru_1008E7020];

  return (NSString *)v9;
}

- (void)logReceiverBundleID:(id)a3 forAppProxy:(id)a4 andURL:(id)a5
{
  id v9 = a5;
  if (a4)
  {
    uint64_t v7 = [a4 bundleIdentifier];
    +[SDAirDropHandler logReceiverBundleID:v7 forURL:v9];

    BOOL v8 = (void *)v7;
  }
  else
  {
    +[SDAirDropHandler logReceiverBundleID:a3 forURL:v9];
    BOOL v8 = v9;
  }
}

+ (void)logReceiverBundleID:(id)a3 forURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = v5;
LABEL_3:
    if (([v8 hasPrefix:@"com.apple."] & 1) == 0)
    {

      BOOL v8 = @"3rd-party";
    }
    id v9 = +[NSString stringWithFormat:@"%@%@", @"com.apple.airdrop.transfer.receiver.id.", v8];
    off_100965D28((uint64_t)v9, 1);

    goto LABEL_10;
  }
  if (v6)
  {
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    CFStringRef v11 = [v10 applicationsAvailableForOpeningURL:v7];

    BOOL v12 = [v11 firstObject];
    BOOL v8 = [v12 applicationIdentifier];

    if (v8) {
      goto LABEL_3;
    }
  }
  BOOL v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100015968();
  }
LABEL_10:
}

- (void)removeItemAtURLToFreeUpSpace:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v8 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001599C(v3, v7);
    }
  }
}

- (BOOL)openURLs:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    CFStringRef v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100015A34();
    }
    BOOL v15 = 0;
    goto LABEL_38;
  }
  v44 = self;
  id v8 = airdrop_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = SFCompactStringFromCollection();
      *(_DWORD *)buf = 138412546;
      v53 = v10;
      __int16 v54 = 2112;
      id v55 = v7;
      CFStringRef v11 = "Opening URLs: %@ in %@";
      BOOL v12 = v8;
      uint32_t v13 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  else if (v9)
  {
    id v10 = SFCompactStringFromCollection();
    *(_DWORD *)buf = 138412290;
    v53 = v10;
    CFStringRef v11 = "Opening URLs: %@";
    BOOL v12 = v8;
    uint32_t v13 = 12;
    goto LABEL_10;
  }
  id v40 = v7;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  CFStringRef v14 = v6;
  id v16 = [v14 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v16)
  {
    id v17 = v16;
    id v39 = v6;
    v45 = v14;
    uint64_t v46 = *(void *)v48;
    uint64_t v18 = v44;
    while (1)
    {
      v19 = 0;
      id v43 = v17;
      do
      {
        if (*(void *)v48 != v46) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v19);
        id v21 = [v20 scheme];
        id v22 = [v21 lowercaseString];
        if ([v22 isEqualToString:@"voicememos"]) {
          goto LABEL_25;
        }
        long long v23 = [v20 scheme];
        objc_super v24 = [v23 lowercaseString];
        if ([v24 isEqualToString:@"photos"]) {
          goto LABEL_24;
        }
        uint64_t v25 = [v20 scheme];
        CFStringRef v26 = [v25 lowercaseString];
        if ([v26 isEqualToString:@"x-apple-calevent"]) {
          goto LABEL_23;
        }
        CFStringRef v27 = [v20 scheme];
        id v28 = [v27 lowercaseString];
        if ([v28 isEqualToString:@"shoebox"]) {
          goto LABEL_22;
        }
        v42 = v27;
        v41 = [v20 scheme];
        id v29 = [v41 lowercaseString];
        if ([v29 isEqualToString:@"stocks"])
        {

          CFStringRef v27 = v42;
LABEL_22:

          id v17 = v43;
          uint64_t v18 = v44;
LABEL_23:

          CFStringRef v14 = v45;
LABEL_24:

LABEL_25:
LABEL_26:
          BOOL v30 = +[LSApplicationWorkspace defaultWorkspace];
          unsigned __int8 v31 = [v30 openSensitiveURL:v20 withOptions:0];

          if ((v31 & 1) == 0) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }
        v37 = [v20 scheme];
        long long v36 = [v37 lowercaseString];
        unsigned __int8 v38 = [v36 isEqualToString:@"mobilephone"];

        uint64_t v18 = v44;
        CFStringRef v14 = v45;
        id v17 = v43;
        if (v38) {
          goto LABEL_26;
        }
        v32 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned int v33 = [v32 openURL:v20 withOptions:0];

        if (!v33)
        {
LABEL_34:
          BOOL v15 = 0;
          goto LABEL_35;
        }
LABEL_27:
        [(SDAirDropHandler *)v18 logReceiverBundleID:0 forAppProxy:0 andURL:v20];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v34 = [v14 countByEnumeratingWithState:&v47 objects:v51 count:16];
      id v17 = v34;
      BOOL v15 = 1;
      if (!v34)
      {
LABEL_35:
        id v6 = v39;
        goto LABEL_37;
      }
    }
  }
  BOOL v15 = 0;
LABEL_37:
  id v7 = v40;
LABEL_38:

  return v15;
}

- (BOOL)openURLs:(id)a3
{
  return [(SDAirDropHandler *)self openURLs:a3 bundleIdentifier:0];
}

- (SFAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
}

- (id)updateTransferStateHandler
{
  return self->_updateTransferStateHandler;
}

- (void)setUpdateTransferStateHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)hasFiles
{
  return self->_hasFiles;
}

- (BOOL)hasLinks
{
  return self->_hasLinks;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (id)moveToShareSheetCompletion
{
  return self->_moveToShareSheetCompletion;
}

- (void)setMoveToShareSheetCompletion:(id)a3
{
}

- (LSBundleProxy)bundleProxy
{
  return self->_bundleProxy;
}

- (void)setBundleProxy:(id)a3
{
}

- (BOOL)handlingAppInstalled
{
  return self->_handlingAppInstalled;
}

- (void)setHandlingAppInstalled:(BOOL)a3
{
  self->_handlingAppInstalled = a3;
}

- (NSString)handlingAppBundleID
{
  return self->_handlingAppBundleID;
}

- (void)setHandlingAppBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlingAppBundleID, 0);
  objc_storeStrong((id *)&self->_bundleProxy, 0);
  objc_storeStrong(&self->_moveToShareSheetCompletion, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateTransferStateHandler, 0);

  objc_storeStrong((id *)&self->_transfer, 0);
}

@end