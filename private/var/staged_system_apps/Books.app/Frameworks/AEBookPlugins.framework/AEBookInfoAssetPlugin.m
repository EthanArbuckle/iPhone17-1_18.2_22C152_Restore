@interface AEBookInfoAssetPlugin
- (AEAnnotationProvider)sharedAnnotationProvider;
- (BOOL)_shouldShowAlertForError:(id)a3;
- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5;
- (BOOL)isEpubURL:(id)a3;
- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7;
- (id)associatedAssetType;
- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6;
- (id)helper:(id)a3 coverImageForURL:(id)a4;
- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5;
- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4;
- (id)supportedFileExtensions;
- (id)supportedUrlSchemes;
- (void)_showAlertForError:(id)a3 forAssetAtURL:(id)a4 transaction:(id)a5;
- (void)helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6;
- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4;
- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5;
- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5;
- (void)setSharedAnnotationProvider:(id)a3;
@end

@implementation AEBookInfoAssetPlugin

- (id)associatedAssetType
{
  return 0;
}

- (BOOL)isEpubURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    v4 = [v3 pathExtension];
    BOOL v5 = [v4 caseInsensitiveCompare:@"epub"] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v14 = +[AEEpubInfoSource sharedInstance];
  v15 = [v14 bookInfoForURL:v11 fromManagedObjectContext:v12 error:a5 needsCoordination:v8 updateDate:v13];

  return v15;
}

- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4
{
  return 0;
}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if ([(AEBookInfoAssetPlugin *)self isEpubURL:v10])
  {
    id v11 = +[AEEpubInfoSource sharedInstance];
    id v12 = [v11 metadataForKey:v9 forURL:v10 needsCoordination:v6];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  id v5 = a4;
  v4 = +[AEEpubInfoSource sharedInstance];
  [v4 resetBookForURL:v5];
}

- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5
{
  id v8 = a4;
  id v6 = a5;
  v7 = +[AEEpubInfoSource sharedInstance];
  [v7 updateCachedURLFrom:v8 to:v6];
}

- (void)helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v29 = v10;
  v28 = [v29 url];
  id v13 = [v11 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_40778;
  v45[4] = sub_40788;
  v14 = self;
  v46 = v14;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_40790;
  v41[3] = &unk_1DB958;
  v44 = v45;
  id v27 = v13;
  id v42 = v27;
  id v15 = v12;
  id v43 = v15;
  v16 = objc_retainBlock(v41);
  v17 = [v11 objectForKey:AEHelperNumberIsApplePubKey];
  unsigned int v18 = [v17 BOOLValue];

  if (v18)
  {
    v19 = +[NSError errorWithDomain:AssetEngineErrorDomain code:1004 userInfo:0];
    if (v19) {
      ((void (*)(void *, void, void, void *))v16[2])(v16, 0, 0, v19);
    }
  }
  else
  {
    v26 = [v11 valueForKey:@"assetID"];
    v20 = +[NSFileAccessIntent readingIntentWithURL:v28 options:1];
    v21 = objc_opt_new();
    v47 = v20;
    v22 = +[NSArray arrayWithObjects:&v47 count:1];
    v23 = objc_opt_new();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_409F0;
    v30[3] = &unk_1DBA48;
    id v31 = v28;
    id v32 = v11;
    v38 = v16;
    id v24 = v20;
    id v33 = v24;
    v34 = v14;
    id v25 = v26;
    id v35 = v25;
    BOOL v40 = a4;
    id v36 = v27;
    id v37 = v29;
    id v39 = v15;
    [v21 coordinateAccessWithIntents:v22 queue:v23 byAccessor:v30];

    v19 = 0;
  }

  _Block_object_dispose(v45, 8);
}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v8 = a3;
  id v9 = [v8 url];
  id v10 = +[AEEpubInfoSource sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_42198;
  v13[3] = &unk_1DBA70;
  v13[4] = self;
  id v11 = v9;
  BOOL v17 = a5;
  id v14 = v11;
  id v15 = &v18;
  v16 = a4;
  [v10 performBackgroundTaskAndWait:v13];

  LOBYTE(v9) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v9;
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  id v5 = -[AEBookInfoAssetPlugin helper:coverImageForURL:](self, "helper:coverImageForURL:", a3, a4, a5.width, a5.height);

  return v5;
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = sub_40778;
  uint64_t v18 = sub_40788;
  id v19 = 0;
  if ([(AEBookInfoAssetPlugin *)self isEpubURL:v5])
  {
    +[AEEpubInfoSource sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_424E8;
    v9[3] = &unk_1DBA98;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v5;
    id v12 = self;
    id v13 = &v14;
    id v6 = v10;
    [v6 performBackgroundTaskAndWait:v9];
  }
  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(AEBookInfoAssetPlugin *)self sharedAnnotationProvider];
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 helperMetadataForKey:AEHelperStringMetadataAssetIDKey needsCoordination:v7];
  }
  id v15 = v14;
  uint64_t v16 = +[UIApplication contextDirectoryForAssetWithID:v14];
  BOOL v17 = +[IMLibraryPlist isManagedBookFromURL:v11];
  id v18 = [v17 BOOLValue];

  id v19 = +[AEAnnotationSerializationManager annotationSerializationManagerWithAssetID:v15 assetURL:v11 bookVersionString:0 pathToAssetContextDirectory:v16 isManagedBook:v18];
  if (([v19 isAssetOfflineWithAssetID:v15] & 1) != 0
    || [v19 takeBookOfflineIfManagedWithAnnotationProvider:v13 assetID:v15])
  {
    uint64_t v20 = [v19 annotationProviderForOfflineDBWithAssetID:v15];

    id v13 = (void *)v20;
  }

  return v13;
}

- (id)supportedFileExtensions
{
  return +[NSArray arrayWithObject:@"epub"];
}

- (id)supportedUrlSchemes
{
  return 0;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)AEPluginDelegateInstance) initWithDelegate:self forURL:v5];

  return v6;
}

- (BOOL)_shouldShowAlertForError:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 code];
  id v5 = [v3 domain];
  id v6 = v5;
  if (v4 == (char *)-996)
  {
    unsigned __int8 v7 = [v5 isEqualToString:fd45c988dd8cc08fce2e58d17f4ed2];
  }
  else
  {
    if (v4 != &stru_3D8.segname[4])
    {
      char v8 = 1;
      goto LABEL_7;
    }
    unsigned __int8 v7 = [v5 isEqualToString:AssetEngineErrorDomain];
  }
  char v8 = v7 ^ 1;
LABEL_7:

  return v8;
}

- (void)_showAlertForError:(id)a3 forAssetAtURL:(id)a4 transaction:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v8) {
    BCReportAssertionFailureWithMessage();
  }
  id v9 = +[AEAssetEngine libraryMgr];
  id v10 = [v9 metadataForAssetAtURL:v7 needsCoordination:1];

  id v11 = +[IMLibraryPlist titleFromPlistEntry:v10];
  id v12 = AEBundle();
  id v13 = [v12 localizedStringForKey:@"OK" value:&stru_1DF0D8 table:0];

  if ([v11 length])
  {
    id v14 = AEBundle();
    id v15 = [v14 localizedStringForKey:@"Cannot Open “%@”" value:&stru_1DF0D8 table:0];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v11);
  }
  else
  {
    id v14 = AEBundle();
    uint64_t v16 = [v14 localizedStringForKey:@"Cannot Open Book" value:&stru_1DF0D8 table:0];
  }

  BOOL v17 = (uint32_t *)[v27 code];
  if ((uint64_t)v17 > 1999)
  {
    if (v17 == &stru_798.reloff)
    {
      id v18 = AEBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"This book is protected by an incompatible technology." value:&stru_1DF0D8 table:0];
      goto LABEL_23;
    }
    if (v17 == (uint32_t *)((char *)&stru_798.reloff + 2)) {
      goto LABEL_21;
    }
    if (v17 == &stru_798.nreloc)
    {
      id v18 = AEBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"This book can’t be downloaded. Check your internet connection, then try again.", &stru_1DF0D8, 0 value table];
      goto LABEL_23;
    }
  }
  else
  {
    if ((unint64_t)(v17 - 250) < 2) {
      goto LABEL_22;
    }
    if (v17 == &stru_20.flags || v17 == (uint32_t *)((char *)&stru_108.size + 1))
    {
      id v18 = AEBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"You must authorize this computer from the Account menu." value:&stru_1DF0D8 table:0];
      goto LABEL_23;
    }
  }
  uint64_t v20 = [v27 domain];
  if ([v20 isEqualToString:AMSErrorDomain])
  {

LABEL_21:
    id v18 = AEBundle();
    uint64_t v19 = [v18 localizedStringForKey:@"This book cannot be opened because required software cannot be downloaded." value:&stru_1DF0D8 table:0];
    goto LABEL_23;
  }
  char v21 = [v27 domain];
  unsigned int v22 = [v21 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (v22) {
    goto LABEL_21;
  }
LABEL_22:
  id v18 = AEBundle();
  uint64_t v19 = [v18 localizedStringForKey:@"It is formatted incorrectly, or is not a format that Apple Books can open.", &stru_1DF0D8, 0 value table];
LABEL_23:
  v23 = (void *)v19;

  id v24 = +[UIAlertController alertControllerWithTitle:v16 message:v23 preferredStyle:1];
  id v25 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v24 addAction:v25];

  v26 = +[AEAssetEngine appInfoMgr];
  [v26 presentViewController:v24 transaction:v8 animated:1 completion:0];
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end