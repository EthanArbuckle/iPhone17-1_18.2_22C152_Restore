@interface BKAppURLHandler
- (BKAppURLHandler)initWithLibraryAssetProvider:(id)a3;
- (BKAppURLHandlingDelegate)delegate;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BOOL)_handleShowAudiobooksMainWithTransaction:(id)a3;
- (BOOL)_handleShowMangaMainWithTransaction:(id)a3;
- (BOOL)_handleShowReadingNowWithTransaction:(id)a3;
- (id)_newShowAssetTransactionFromExistingTransaction:(id)a3 forAssetID:(id)a4 isAudiobook:(BOOL)a5;
- (id)locationFromURLFragment:(id)a3;
- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 remainingPath:(id *)a4 needsBookID:(id *)a5 transaction:(id)a6;
- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 remainingPath:(id *)a6 canScheduleOperations:(BOOL)a7 transaction:(id)a8;
- (id)sceneManager;
- (void)handleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7 completion:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setLibraryAssetProvider:(id)a3;
@end

@implementation BKAppURLHandler

- (void)setDelegate:(id)a3
{
}

- (BKAppURLHandler)initWithLibraryAssetProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKAppURLHandler;
  v5 = [(BKAppURLHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_libraryAssetProvider, v4);
  }

  return v6;
}

- (id)locationFromURLFragment:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  id v4 = (__CFString *)CFURLCopyFragment(v3, &stru_100A70340);
  id v27 = 0;
  id v5 = +[BKEpubCFILocation locationForCFI:v4 error:&v27];
  id v6 = v27;
  if (v5) {
    goto LABEL_20;
  }
  if (!-[__CFString hasPrefix:](v4, "hasPrefix:", @"annotationID(")
    || ![(__CFString *)v4 hasSuffix:@""]))
  {
    id v15 = objc_alloc((Class)BKAnchorPathLocation);
    v7 = [(__CFURL *)v3 fragment];
    id v5 = [v15 initWithOrdinal:-1 anchor:v7 andPath:0];
    goto LABEL_14;
  }
  v7 = -[__CFString substringWithRange:](v4, "substringWithRange:", 13, (char *)[(__CFString *)v4 length] - 14);
  objc_super v8 = +[AEAnnotationProvider sharedInstance];
  v9 = [v8 uiManagedObjectContext];
  v10 = +[AEAnnotation annotationIncludingDeletedWithUUID:v7 assetID:0 inManagedObjectContext:v9];
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    id v5 = 0;
    goto LABEL_13;
  }
  id v5 = [v10 location];
  if (!v5)
  {
    v12 = [v11 annotationLocation];

    if (!v12) {
      goto LABEL_11;
    }
    v13 = [v11 annotationLocation];
    v14 = (char *)[v13 rangeOfString:@"#"];
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {

      goto LABEL_11;
    }
    [v13 substringFromIndex:v14 + 1];
    v16 = uint64_t v26 = 0;
    id v5 = +[BKEpubCFILocation locationForCFI:v16 error:&v26];

    if (!v5)
    {
LABEL_11:
      v17 = [v11 plAbsolutePhysicalLocation];
      id v18 = [v17 unsignedIntegerValue];

      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v24 = objc_alloc((Class)BKPageLocation);
        v25 = [v11 plAbsolutePhysicalLocation];
        id v5 = [v24 initWithOrdinal:0 andOffset:[v25 unsignedIntegerValue]];

        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

LABEL_14:
  if (!v5)
  {
    v19 = BCIMLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[BKAppURLHandler locationFromURLFragment:]";
      __int16 v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppURLHandler.m";
      __int16 v32 = 1024;
      int v33 = 139;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v20 = BCIMLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [(__CFURL *)v3 absoluteString];
      v22 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "@\"Error parsing CFI from URL %@: %@\"", buf, 0x16u);
    }
    id v5 = 0;
  }
LABEL_20:

  return v5;
}

- (void)handleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v42 = a7;
  id v15 = a8;
  id v16 = [objc_alloc((Class)NSURLComponents) initWithURL:v12 resolvingAgainstBaseURL:0];
  v17 = [v16 path];
  unsigned __int8 v39 = [v17 hasPrefix:@"/assetid"];

  unsigned __int8 v38 = [v13 isEqualToString:@"__self__"];
  id v18 = [v12 scheme];
  v19 = v14;
  if ([v18 length])
  {
    v20 = [v12 scheme];
    if ([v20 caseInsensitiveCompare:@"itms-bookss"])
    {
      v21 = [v12 scheme];
      BOOL v22 = [v21 caseInsensitiveCompare:@"itms-books"] == 0;
    }
    else
    {
      BOOL v22 = 1;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  v23 = [v12 scheme];
  if ([v23 length])
  {
    id v24 = [v12 scheme];
    BOOL v25 = [v24 caseInsensitiveCompare:@"ibooks"] == 0;
  }
  else
  {
    BOOL v25 = 0;
  }

  if (v22
    && (+[BSUIURL URLWithURL:v12],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        [v26 actionString],
        id v27 = objc_claimAutoreleasedReturnValue(),
        id v28 = [v27 length],
        v27,
        v26,
        v28))
  {
    v29 = [(BKAppURLHandler *)self delegate];
    __int16 v30 = [v29 storePresenter];
    [v30 showStore:v12 sourceApplication:v13 annotation:v19 transaction:v42];

    id v31 = objc_retainBlock(v15);
    __int16 v32 = v31;
    if (v31) {
      (*((void (**)(id, uint64_t))v31 + 2))(v31, 1);
    }

    int v33 = v42;
  }
  else
  {
    v34 = dispatch_group_create();
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    char v72 = 0;
    dispatch_group_enter(v34);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100159108;
    v68[3] = &unk_100A487B8;
    v70 = v71;
    v35 = v34;
    v69 = v35;
    [v12 bc_isStoreProductURLWithCompletion:v68];
    dispatch_group_enter(v35);
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    char v67 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10015911C;
    v63[3] = &unk_100A487B8;
    v65 = v66;
    v36 = v35;
    v64 = v36;
    [v12 bc_isBookStoreURLWithCompletion:v63];
    dispatch_group_enter(v36);
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    char v62 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100159130;
    v58[3] = &unk_100A487B8;
    v60 = v61;
    v37 = v36;
    v59 = v37;
    [v12 bc_isStoreURLWithCompletion:v58];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100159144;
    block[3] = &unk_100A487E0;
    v51 = v66;
    v52 = v71;
    v53 = v61;
    unsigned __int8 v54 = v38;
    unsigned __int8 v55 = v39;
    int v33 = v42;
    id v44 = v12;
    v45 = self;
    id v46 = v42;
    id v47 = v13;
    id v48 = v19;
    BOOL v56 = a6;
    BOOL v57 = v25;
    id v49 = v16;
    id v50 = v15;
    dispatch_group_notify(v37, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v66, 8);

    _Block_object_dispose(v71, 8);
  }
}

- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 remainingPath:(id *)a4 needsBookID:(id *)a5 transaction:(id)a6
{
  id v9 = a3;
  v10 = [v9 host];
  v11 = +[NSURL assetIDFromURL:v9];
  CFURLRef v12 = [v9 absoluteURL];

  id v13 = (__CFString *)CFURLCopyPath(v12);
  if ([(__CFString *)v13 hasPrefix:@"/"])
  {
    uint64_t v14 = [(__CFString *)v13 substringFromIndex:1];

    id v13 = (__CFString *)v14;
  }
  id v15 = [(__CFString *)v13 componentsSeparatedByString:@"/"];
  id v16 = [v15 objectAtIndex:0];
  v17 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v16, &stru_100A70340);

  if (a4)
  {
    id v18 = [v15 subarrayWithRange:1, (char *)[v15 count] - 1];
    *a4 = [v18 componentsJoinedByString:@"/"];
  }
  if ([v10 isEqualToString:@"storeid"])
  {
    v19 = [(BKAppURLHandler *)self libraryAssetProvider];
    v20 = [v19 libraryAssetOnMainQueueWithStoreID:v17];
    v21 = 0;
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"bookid"])
  {
    BOOL v22 = v17;
    v21 = v22;
    if (a5) {
      *a5 = v22;
    }
    v19 = [(BKAppURLHandler *)self libraryAssetProvider];
    v20 = [v19 libraryAssetOnMainQueueWithEpubID:v21];
LABEL_11:

    if (v20) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  v21 = 0;
LABEL_14:
  if ([v11 length])
  {
    v23 = [(BKAppURLHandler *)self libraryAssetProvider];
    v20 = [v23 libraryAssetOnMainQueueWithAssetID:v11];
    goto LABEL_19;
  }
  v20 = 0;
LABEL_17:
  if (![v10 isEqualToString:@"filename"]) {
    goto LABEL_20;
  }
  id v24 = v17;
  v23 = [(BKAppURLHandler *)self libraryAssetProvider];
  uint64_t v25 = [v23 libraryAssetOnMainQueueWithFilename:v24];

  v20 = (void *)v25;
LABEL_19:

LABEL_20:

  return v20;
}

- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 remainingPath:(id *)a6 canScheduleOperations:(BOOL)a7 transaction:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a8;
  v41[0] = 0;
  id v16 = [(BKAppURLHandler *)self p_libraryAssetFromIbooksSchemeURL:v14 remainingPath:a6 needsBookID:v41 transaction:v15];
  id v17 = v41[0];
  objc_opt_class();
  id v18 = +[BKLibraryManager defaultManager];
  v19 = [v18 dataSourceWithIdentifier:@"com.apple.ibooks.plist.untethered"];
  v20 = BUDynamicCast();

  unsigned __int8 v21 = [v16 canOpen];
  if (v16) {
    unsigned __int8 v22 = v21;
  }
  else {
    unsigned __int8 v22 = 0;
  }
  if (v9 && (v22 & 1) == 0)
  {
    unsigned __int8 v23 = v21;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10015A4A8;
    v35[3] = &unk_100A48830;
    v35[4] = self;
    id v24 = v14;
    id v36 = v24;
    id v37 = v30;
    id v38 = v29;
    id v25 = v15;
    id v39 = v25;
    unsigned __int8 v40 = v23;
    uint64_t v26 = objc_retainBlock(v35);
    if ([v20 hasDigestChangedSinceFetch])
    {
      id v27 = +[BKLibraryManager defaultManager];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10015AA24;
      v31[3] = &unk_100A45980;
      v31[4] = self;
      id v32 = v24;
      id v33 = v25;
      v34 = v26;
      [v27 reloadDataSource:v20 completion:v31];
    }
    else
    {
      ((void (*)(void *, void *, id))v26[2])(v26, v16, v17);
    }
  }

  return v16;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (id)_newShowAssetTransactionFromExistingTransaction:(id)a3 forAssetID:(id)a4 isAudiobook:(BOOL)a5
{
  id v6 = a3;
  v7 = [(BKAppURLHandler *)self sceneManager];
  objc_super v8 = [v7 defaultSceneControllerForTransaction:v6];

  id v9 = [v8 newShowAssetTransaction];
  return v9;
}

- (BOOL)_handleShowReadingNowWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppURLHandler *)self delegate];
  id v6 = [v5 storePresenter];
  [v6 showReadingNowWithTransaction:v4];

  return 1;
}

- (BOOL)_handleShowAudiobooksMainWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppURLHandler *)self delegate];
  id v6 = [v5 storePresenter];
  [v6 showAudiobookStoreWithTransaction:v4];

  return 1;
}

- (BOOL)_handleShowMangaMainWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppURLHandler *)self delegate];
  id v6 = [v5 storePresenter];
  [v6 showMangaStoreWithTransaction:v4];

  return 1;
}

- (BKAppURLHandlingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAppURLHandlingDelegate *)WeakRetained;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryAssetProvider);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryAssetProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

@end