@interface SDAirDropHandlerVoiceMemos
+ (void)importMemosForItems:(id)a3 completion:(id)a4;
- (BOOL)canHandleTransfer;
- (BOOL)canHandleTransferRegardlessOfBundleID;
- (BOOL)shouldEndAfterOpen;
- (NSArray)openAppURLs;
- (SDAirDropHandlerVoiceMemos)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)importMemosWithCompletion:(id)a3;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)setOpenAppURLs:(id)a3;
- (void)triggerImport;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerVoiceMemos

- (SDAirDropHandlerVoiceMemos)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerVoiceMemos;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.VoiceMemos"];
}

- (BOOL)canHandleTransferRegardlessOfBundleID
{
  unsigned int v3 = [(SDAirDropHandler *)self isJustFiles];
  int v4 = SFVoiceMemosAppAvailable();
  BOOL v5 = 0;
  if (v3 && v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(SDAirDropHandler *)self transfer];
    v7 = [v6 metaData];
    v8 = [v7 items];

    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) type];
          int v14 = SFIsVoiceMemo();

          if (!v14)
          {
            BOOL v5 = 0;
            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 1;
LABEL_13:
  }
  return v5;
}

- (BOOL)canHandleTransfer
{
  unsigned int v3 = [(SDAirDropHandler *)self transfer];
  int v4 = [v3 metaData];
  BOOL v5 = [v4 senderBundleID];
  unsigned __int8 v6 = [v5 isEqual:@"com.apple.VoiceMemos"];

  return v6 & [(SDAirDropHandlerVoiceMemos *)self canHandleTransferRegardlessOfBundleID];
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerVoiceMemos;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x1000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v13 = @"VOICE_MEMO";
  BOOL v5 = +[NSNumber numberWithUnsignedInteger:v4];
  int v14 = v5;
  unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v15 = v6;
  v7 = +[NSArray arrayWithObjects:&v15 count:1];
  v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  LODWORD(v6) = [(SDAirDropHandler *)self isModernProgress];
  id v9 = SFLocalizedStringForKey();
  if (v6) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4, v12);
  }
  else {
  id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);
  }

  return v10;
}

- (void)updatePossibleActions
{
  v20.receiver = self;
  v20.super_class = (Class)SDAirDropHandlerVoiceMemos;
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
    v7 = [v4 identifier];
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [(SDAirDropHandler *)self singleItemActionTitle];
    uint64_t v11 = [(SDAirDropHandler *)self singleItemActionTitle];
    id v5 = [v6 initWithTransferIdentifier:v7 actionIdentifier:v9 title:v10 singleItemTitle:v11 type:1];
  }
  id location = 0;
  objc_initWeak(&location, self);
  int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_1000E2D1C;
  long long v17 = &unk_1008CA128;
  objc_copyWeak(&v18, &location);
  [v5 setActionHandler:&v14];
  id v21 = v5;
  uint64_t v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v14, v15, v16, v17);
  CFStringRef v13 = [(SDAirDropHandler *)self transfer];
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
  v3[2] = sub_1000E2E20;
  v3[3] = &unk_1008CD080;
  objc_copyWeak(&v4, &location);
  [(SDAirDropHandlerVoiceMemos *)self importMemosWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)importMemosWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 completedURLs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E2FB4;
  v8[3] = &unk_1008CD0A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[SDAirDropHandlerVoiceMemos importMemosForItems:v6 completion:v8];
}

+ (void)importMemosForItems:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v21 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1000E33A8;
  v33[4] = sub_1000E33B8;
  id v34 = 0;
  id v34 = +[NSMutableArray array];
  id v6 = dispatch_group_create();
  for (unint64_t i = 0; (unint64_t)[v5 count] > i; ++i)
  {
    dispatch_group_enter(v6);
    v8 = [v5 objectAtIndexedSubscript:i];
    id v9 = [v8 URLByDeletingPathExtension];
    id v10 = [v9 lastPathComponent];

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start importing voice memo for %@", buf, 0xCu);
    }

    CFStringRef v13 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E33C0;
    block[3] = &unk_1008CD0F8;
    id v28 = v8;
    id v29 = v10;
    id v30 = v11;
    v32 = v33;
    v31 = v6;
    id v14 = v11;
    id v15 = v10;
    id v16 = v8;
    dispatch_async(v13, block);
  }
  long long v17 = sub_1001B1BE4();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E3674;
  v22[3] = &unk_1008CD120;
  v23 = v6;
  id v24 = v5;
  v26 = v33;
  id v25 = v21;
  id v18 = v21;
  id v19 = v5;
  objc_super v20 = v6;
  dispatch_async(v17, v22);

  _Block_object_dispose(v33, 8);
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E37FC;
  v6[3] = &unk_1008CD148;
  id v7 = a4;
  id v5 = v7;
  [(SDAirDropHandlerVoiceMemos *)self importMemosWithCompletion:v6];
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v9 = (void (**)(id, BOOL, void))a4;
  id v5 = [(SDAirDropHandlerVoiceMemos *)self openAppURLs];
  id v6 = [(SDAirDropHandler *)self bundleProxy];
  id v7 = [v6 bundleIdentifier];
  BOOL v8 = [(SDAirDropHandler *)self openURLs:v5 bundleIdentifier:v7];

  v9[2](v9, v8, 0);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (NSArray)openAppURLs
{
  return self->_openAppURLs;
}

- (void)setOpenAppURLs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end