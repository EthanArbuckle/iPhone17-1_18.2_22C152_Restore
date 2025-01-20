@interface SDAirDropHandlerPhotos
+ (id)suitableContentsDescriptionWithSenderName:(id)a3 itemsCount:(int64_t)a4 items:(id)a5 senderIsMe:(BOOL)a6 isVerifiableIdentity:(BOOL)a7 hasPhotos:(BOOL)a8 hasVideos:(BOOL)a9 isModernProgress:(BOOL)a10 transferState:(unint64_t)a11;
- (BOOL)canHandleTransfer;
- (BOOL)hasPhotos;
- (BOOL)hasVideos;
- (BOOL)shouldEndAfterOpen;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)supportsAutoOpen;
- (BOOL)transferContainsAssetBundles:(id)a3;
- (NSArray)assetIdentifiers;
- (NSArray)unprivatizedURLs;
- (SDAirDropHandlerPhotos)initWithTransfer:(id)a3;
- (id)actionsForModernReadyForOpen;
- (id)createDestination;
- (id)defaultOpenActionBundleID;
- (id)suitableContentsDescription;
- (id)transformPhotosAssetBundlesToFoldersIfNeededInCompletedURLs:(id)a3;
- (int64_t)transferTypes;
- (void)handleMoveToAppShareSheetSucceeded;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)prepareForAcceptWithCompletion:(id)a3;
- (void)setAssetIdentifiers:(id)a3;
- (void)setHasPhotos:(BOOL)a3;
- (void)setHasVideos:(BOOL)a3;
- (void)setUnprivatizedURLs:(id)a3;
- (void)triggerImport;
- (void)triggerImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerPhotos

- (SDAirDropHandlerPhotos)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerPhotos;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.mobileslideshow"];
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 metaData];
  v5 = [v4 items];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = [v10 type];
        v12 = [v10 type];
        int v13 = SFIsPhotosAssetBundle();

        if (v13)
        {
          uint64_t v14 = [v10 subtype];

          v11 = (void *)v14;
        }
        if (!self->_hasPhotos) {
          self->_hasPhotos = SFIsImage();
        }
        if (!self->_hasVideos) {
          self->_hasVideos = SFIsVideo();
        }
        if (SFIsImage())
        {
        }
        else
        {
          char v15 = SFIsVideo() | v13;

          if ((v15 & 1) == 0)
          {
            BOOL v16 = 0;
            goto LABEL_21;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_21:

  return v16;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerPhotos;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x200;
}

- (id)suitableContentsDescription
{
  v18 = [(SDAirDropHandler *)self senderName];
  unint64_t v17 = [(SDAirDropHandler *)self totalSharedItemsCount];
  long long v20 = [(SDAirDropHandler *)self transfer];
  long long v19 = [v20 metaData];
  BOOL v16 = [v19 items];
  objc_super v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 metaData];
  id v5 = [v4 senderIsMe];
  id v6 = [(SDAirDropHandler *)self transfer];
  id v7 = [v6 metaData];
  id v8 = [v7 isVerifiableIdentity];
  BOOL hasPhotos = self->_hasPhotos;
  BOOL hasVideos = self->_hasVideos;
  unsigned __int8 v11 = [(SDAirDropHandler *)self isModernProgress];
  v12 = [(SDAirDropHandler *)self transfer];
  BYTE1(v15) = v11;
  LOBYTE(v15) = hasVideos;
  int v13 = +[SDAirDropHandlerPhotos suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos:hasVideos:isModernProgress:transferState:](SDAirDropHandlerPhotos, "suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos:hasVideos:isModernProgress:transferState:", v18, v17, v16, v5, v8, hasPhotos, v15, [v12 transferState]);

  return v13;
}

+ (id)suitableContentsDescriptionWithSenderName:(id)a3 itemsCount:(int64_t)a4 items:(id)a5 senderIsMe:(BOOL)a6 isVerifiableIdentity:(BOOL)a7 hasPhotos:(BOOL)a8 hasVideos:(BOOL)a9 isModernProgress:(BOOL)a10 transferState:(unint64_t)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a5;
  long long v19 = v18;
  if (!v11 || !a9)
  {
    if (v11)
    {
      id v30 = a1;
      BOOL v51 = v13;
      CFStringRef v59 = @"PHOTO";
      v31 = +[NSNumber numberWithInteger:a4];
      v60 = v31;
      v32 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      v61 = v32;
      v33 = &v61;
    }
    else
    {
      if (!a9)
      {
        v35 = 0;
LABEL_31:
        v41 = SFLocalizedStringForKey();
        if (!a10) {
          goto LABEL_35;
        }
LABEL_32:
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, a4, v45, v46);
        goto LABEL_40;
      }
      id v30 = a1;
      BOOL v51 = v13;
      CFStringRef v56 = @"VIDEO";
      v31 = +[NSNumber numberWithInteger:a4];
      v57 = v31;
      v32 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v58 = v32;
      v33 = &v58;
    }
    v34 = +[NSArray arrayWithObjects:v33 count:1];
    v35 = [v30 alertMessageLocalizedKeyForTypeDicts:v34 senderIsMe:v51 isVerifiableIdentity:v12 isModernProgress:a10 transferState:a11];

    goto LABEL_31;
  }
  id v47 = a1;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v20 = [v18 countByEnumeratingWithState:&v52 objects:v67 count:16];
  id v49 = v17;
  BOOL v48 = v12;
  BOOL v50 = v13;
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = 0;
    a4 = 0;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v26 = [v25 type];
        v27 = [v25 type];
        int v28 = SFIsPhotosAssetBundle();

        if (v28)
        {
          uint64_t v29 = [v25 subtype];

          v26 = (void *)v29;
        }
        if (SFIsImage())
        {
          v22 += (uint64_t)[v25 count];
        }
        else if (SFIsVideo())
        {
          a4 += (int64_t)[v25 count];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v52 objects:v67 count:16];
    }
    while (v21);
  }
  else
  {
    uint64_t v22 = 0;
    a4 = 0;
  }
  CFStringRef v64 = @"PHOTO";
  v36 = +[NSNumber numberWithInteger:v22];
  v65 = v36;
  v37 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v66[0] = v37;
  CFStringRef v62 = @"VIDEO";
  v38 = +[NSNumber numberWithInteger:a4];
  v63 = v38;
  v39 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v66[1] = v39;
  v40 = +[NSArray arrayWithObjects:v66 count:2];
  v35 = [v47 alertMessageLocalizedKeyForTypeDicts:v40 senderIsMe:v50 isVerifiableIdentity:v48 isModernProgress:a10 transferState:a11];

  v41 = SFLocalizedStringForKey();
  if (v22 >= 2 && a4 >= 2)
  {
    id v17 = v49;
    if (a10)
    {
      int64_t v45 = a4;
LABEL_29:
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v22, v45, v46);
      goto LABEL_40;
    }
    int64_t v46 = a4;
    goto LABEL_37;
  }
  id v17 = v49;
  if (v22 >= 2)
  {
    if (a10) {
      goto LABEL_29;
    }
LABEL_37:
    int64_t v45 = v22;
    goto LABEL_38;
  }
  if (a4 < 2)
  {
    if (a10) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (a10) {
    goto LABEL_32;
  }
LABEL_35:
  int64_t v45 = a4;
LABEL_38:
  id v44 = v17;
LABEL_39:
  +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v44, v45, v46);
  v42 = LABEL_40:;

  return v42;
}

- (BOOL)supportsAutoOpen
{
  v2 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.mobileslideshow"];
  objc_super v3 = +[RBSProcessHandle handleForPredicate:v2 error:0];
  objc_super v4 = [v3 currentState];
  id v5 = [v4 endowmentNamespaces];
  unsigned __int8 v6 = [v5 containsObject:@"com.apple.frontboard.visibility"];

  return v6 ^ 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (id)transformPhotosAssetBundlesToFoldersIfNeededInCompletedURLs:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v27 = +[NSFileManager defaultManager];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v34;
    v9 = UTTypePackage;
    *(void *)&long long v6 = 138412290;
    long long v25 = v6;
    v26 = v4;
    uint64_t v28 = *(void *)v34;
    do
    {
      v10 = 0;
      id v29 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(NSObject **)(*((void *)&v33 + 1) + 8 * (void)v10);
        BOOL v12 = [v11 pathExtension];
        BOOL v13 = +[UTType typeWithFilenameExtension:v12 conformingToType:v9];
        uint64_t v14 = [v13 identifier];

        if (SFIsPhotosAssetBundle())
        {
          id v15 = [objc_alloc((Class)PFAssetBundle) initWithAssetBundleAtURL:v11];
          BOOL v16 = [v11 URLByDeletingLastPathComponent];
          id v32 = 0;
          id v17 = [v15 writeFolderRepresentationToDirectory:v16 error:&v32];
          id v18 = v32;
          long long v19 = airdrop_log();
          id v20 = v19;
          if (v17)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v25;
              v38 = v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Wrote folder representation of asset bundle to: %@", buf, 0xCu);
            }

            id v31 = 0;
            unsigned __int8 v21 = [v27 removeItemAtURL:v11 error:&v31];
            id v20 = v31;
            if ((v21 & 1) == 0)
            {
              uint64_t v22 = airdrop_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v25;
                v38 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to delete asset bundle after transforming to folder. Error: %@", buf, 0xCu);
              }
            }
            objc_super v4 = v26;
          }
          else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v38 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to create folder representation from asset bundle. Error: %@", buf, 0xCu);
          }

          v9 = UTTypePackage;
          uint64_t v8 = v28;
          id v7 = v29;
        }
        else
        {
          id v17 = 0;
        }
        if (v17) {
          uint64_t v23 = v17;
        }
        else {
          uint64_t v23 = v11;
        }
        [v4 addObject:v23];

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updatePossibleActions
{
  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerPhotos;
  [(SDAirDropHandler *)&v13 updatePossibleActions];
  id v3 = [(SDAirDropHandler *)self bundleProxy];
  objc_super v4 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v3];

  [v4 setRequiresUnlockedUI:0];
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10023598C;
  v10 = &unk_1008CA128;
  objc_copyWeak(&v11, &location);
  [v4 setActionHandler:&v7];
  uint64_t v14 = v4;
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v7, v8, v9, v10);
  long long v6 = [(SDAirDropHandler *)self transfer];
  [v6 setPossibleActions:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)transferContainsAssetBundles:(id)a3
{
  id v3 = [a3 metaData];
  [v3 items];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) type:v11];
        char v9 = SFIsPhotosAssetBundle();

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (void)prepareForAcceptWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Preparing AirDrop for accept", v5, 2u);
  }

  v3[2](v3, 1);
}

- (void)triggerImport
{
  id v3 = [(SDAirDropHandler *)self transfer];
  id v4 = [v3 completedURLs];
  id v5 = [v4 copy];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100235C3C;
  v6[3] = &unk_1008D1E78;
  v6[4] = self;
  [(SDAirDropHandlerPhotos *)self triggerImportWithCompletedURLs:v5 completion:v6];
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, BOOL, void))a4;
  v6[2](v6, [(SDAirDropHandler *)self openURLs:a3], 0);
}

- (void)triggerImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1002361EC;
  v33[4] = sub_1002361FC;
  id v34 = 0;
  uint64_t v8 = +[PHPhotoLibrary sharedPhotoLibrary];
  char v9 = +[NSUUID UUID];
  v10 = [v9 UUIDString];

  long long v11 = [(SDAirDropHandler *)self transfer];
  long long v12 = +[SDAirDropHandler transferURLForTransfer:v11];

  unsigned __int8 v13 = +[SFAirDropUserDefaults_objc moveToAppEnabled];
  long long v14 = +[NSFileManager defaultManager];
  id v15 = airdrop_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [v6 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary preparing import of %d items", buf, 8u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100236204;
  v26[3] = &unk_1008D1EA0;
  id v27 = v6;
  unsigned __int8 v32 = v13;
  id v17 = v12;
  id v28 = v17;
  id v18 = v10;
  id v30 = self;
  id v31 = v33;
  id v29 = v18;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002367D4;
  v21[3] = &unk_1008D1EC8;
  id v19 = v27;
  id v22 = v19;
  uint64_t v23 = self;
  long long v25 = v33;
  id v20 = v7;
  id v24 = v20;
  [v8 performChanges:v26 completionHandler:v21];

  _Block_object_dispose(v33, 8);
}

- (id)defaultOpenActionBundleID
{
  return @"com.apple.mobileslideshow";
}

- (void)handleMoveToAppShareSheetSucceeded
{
  id v3 = [(SDAirDropHandlerPhotos *)self assetIdentifiers];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(SDAirDropHandlerPhotos *)self assetIdentifiers];
    id v6 = [v5 copy];

    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary preparing expunge for %d items", buf, 8u);
    }

    uint64_t v8 = +[PHPhotoLibrary sharedPhotoLibrary];
    char v9 = +[PHAsset fetchAssetsWithLocalIdentifiers:v6 options:0];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100236B98;
    v11[3] = &unk_1008CA6A8;
    id v12 = v6;
    id v10 = v6;
    +[PHAssetChangeRequest performBatchExpungeWithAssets:v9 deleteOptions:0 photoLibrary:v8 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100237358(v8);
    }
  }
}

- (id)actionsForModernReadyForOpen
{
  id v3 = +[NSMutableArray array];
  id location = 0;
  objc_initWeak(&location, self);
  id v4 = SFLocalizedStringForKey();
  id v5 = [(SDAirDropHandler *)self bundleProxy];
  id v6 = [v5 localizedName];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  id v8 = objc_alloc((Class)SFAirDropAction);
  char v9 = [(SDAirDropHandler *)self transfer];
  id v10 = [v9 identifier];
  long long v11 = [(SDAirDropHandler *)self bundleProxy];
  id v12 = [v11 bundleIdentifier];
  unsigned __int8 v13 = [(SDAirDropHandler *)self singleItemActionTitle];
  id v14 = [v8 initWithTransferIdentifier:v10 actionIdentifier:v12 title:v7 singleItemTitle:v13 type:3];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100236FC8;
  v24[3] = &unk_1008CA128;
  objc_copyWeak(&v25, &location);
  [v14 setActionHandler:v24];
  [v14 setMaxTransferState:8];
  [v3 addObject:v14];
  id v15 = SFLocalizedStringForKey();
  id v16 = objc_alloc((Class)SFAirDropAction);
  id v17 = [(SDAirDropHandler *)self transfer];
  id v18 = [v17 identifier];
  id v19 = [(SDAirDropHandler *)self singleItemActionTitle];
  id v20 = [v16 initWithTransferIdentifier:v18 actionIdentifier:@"SDMoveToAppActionIdentifier" title:v15 singleItemTitle:v19 type:3];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002370C0;
  v22[3] = &unk_1008CA128;
  objc_copyWeak(&v23, &location);
  [v20 setActionHandler:v22];
  [v20 setMaxTransferState:8];
  [v3 addObject:v20];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v3;
}

- (id)createDestination
{
  id v3 = NSHomeDirectory();
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  id v9 = 0;
  id v5 = sub_1001B27DC(v4, &v9);
  id v6 = v9;

  if (!v5)
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C6D64(self, (uint64_t)v6, v7);
    }
  }

  return v5;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (BOOL)hasPhotos
{
  return self->_hasPhotos;
}

- (void)setHasPhotos:(BOOL)a3
{
  self->_BOOL hasPhotos = a3;
}

- (BOOL)hasVideos
{
  return self->_hasVideos;
}

- (void)setHasVideos:(BOOL)a3
{
  self->_BOOL hasVideos = a3;
}

- (NSArray)unprivatizedURLs
{
  return self->_unprivatizedURLs;
}

- (void)setUnprivatizedURLs:(id)a3
{
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);

  objc_storeStrong((id *)&self->_unprivatizedURLs, 0);
}

@end