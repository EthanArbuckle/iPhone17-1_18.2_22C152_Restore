@interface AEPDFPlugin
+ (id)associatedAssetType;
+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5;
+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5 showBookmark:(BOOL)a6;
- (AEAnnotationProvider)sharedAnnotationProvider;
- (BCCoverResetting)sharedBookCoverResetter;
- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5;
- (BOOL)isPdfURL:(id)a3;
- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6;
- (id)_updateBook:(id)a3 onMoc:(id)a4 forCurrentURL:(id)a5;
- (id)associatedAssetType;
- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6;
- (id)helper:(id)a3 coverImageForURL:(id)a4;
- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5;
- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)supportedFileExtensions;
- (id)supportedUrlSchemes;
- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4;
- (void)helper:(id)a3 setMetadata:(id)a4 forKey:(id)a5 forURL:(id)a6;
- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5;
- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5;
- (void)loadError:(id)a3;
- (void)sendError:(id)a3 toCompletion:(id)a4;
- (void)sendViewControllerForBook:(id)a3 toCompletion:(id)a4;
- (void)setSharedAnnotationProvider:(id)a3;
- (void)setSharedBookCoverResetter:(id)a3;
- (void)showPasswordDialogForBook:(id)a3 transaction:(id)a4 withCompletion:(id)a5;
@end

@implementation AEPDFPlugin

- (BOOL)isPdfURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    v4 = [v3 pathExtension];
    BOOL v5 = [v4 caseInsensitiveCompare:@"pdf"] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5
{
  return _objc_msgSend(a1, "generateImageForDocument:pageIndex:size:showBookmark:", a3, a4, 0, a5.width, a5.height);
}

+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5 showBookmark:(BOOL)a6
{
  v6 = 0;
  if (a3 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = a6;
    double height = a5.height;
    double width = a5.width;
    v10 = [a3 pageAtIndex:a4];
    v11 = v10;
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      double BoxRectWithRotation = PDFPageGetBoxRectWithRotation(v10, 1);
      double width = v14;
      double v16 = v15;
      v17 = +[UIScreen mainScreen];
      [v17 bounds];
      double v19 = v18;
      double v21 = v20;

      if (width > v19 || v16 > v21)
      {
        CGSizeScaledToFitInSize();
        double width = v23;
      }
    }
    double v24 = BKImageSizeForScreenSize(width);
    double v26 = v25;
    v30[0] = PDFPageImageProperty_DrawBookmark;
    v27 = +[NSNumber numberWithBool:v7];
    v30[1] = PDFPageImageProperty_WithRotation;
    v31[0] = v27;
    v31[1] = &__kCFBooleanTrue;
    v28 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    v6 = [v11 imageOfSize:1 forBox:v28 withOptions:v24, v26];
  }

  return v6;
}

+ (id)associatedAssetType
{
  return @"application/pdf";
}

- (id)associatedAssetType
{
  return @"application/pdf";
}

- (id)supportedFileExtensions
{
  return +[NSArray arrayWithObject:@"pdf"];
}

- (id)supportedUrlSchemes
{
  return 0;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  v6 = [[AEPDFBookHelper alloc] initWithDelegate:self forURL:v5];

  return v6;
}

- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  v13 = [(AEPDFPlugin *)self sharedAnnotationProvider];
  if (v11)
  {
    id v14 = v11;
  }
  else
  {
    id v14 = [v10 helperMetadataForKey:AEHelperStringMetadataAssetIDKey needsCoordination:v7];
  }
  double v15 = v14;
  double v16 = +[IMLibraryPlist isManagedBookFromURL:v12];
  id v17 = [v16 BOOLValue];

  double v18 = +[AEAnnotationSerializationManager annotationSerializationManagerWithAssetID:v15 assetURL:v12 bookVersionString:0 pathToAssetContextDirectory:0 isManagedBook:v17];

  if (([v18 isAssetOfflineWithAssetID:v15] & 1) != 0
    || [v18 takeBookOfflineIfManagedWithAnnotationProvider:v13 assetID:v15])
  {
    uint64_t v19 = [v18 annotationProviderForOfflineDBWithAssetID:v15];

    v13 = (void *)v19;
  }

  return v13;
}

- (id)_updateBook:(id)a3 onMoc:(id)a4 forCurrentURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v11;
  if (v11)
  {
    v13 = [v11 fileSize];
    id v14 = [v13 longLongValue];

    double v15 = +[NSFileManager defaultManager];
    double v16 = [v10 path];
    id v30 = 0;
    id v17 = [v15 attributesOfItemAtPath:v16 error:&v30];
    id v18 = v30;

    id v19 = [v17 fileSize];
    double v20 = v12;
    if (v19)
    {
      id v21 = v19;
      double v20 = v12;
      if (v14 != v19)
      {
        id v29 = 0;
        v22 = +[AEEpubInfoSource sharedInstance];
        [v22 resetBookForURL:v10];

        double v20 = [(AEPDFPlugin *)self _bookInfoForAssetAtURL:v10 withMoc:v9 error:&v29 needsCoordination:1];

        double v23 = +[NSNumber numberWithLongLong:v21];
        [v20 setFileSize:v23];

        if ([v9 hasChanges])
        {
          id v28 = 0;
          unsigned __int8 v24 = [v9 save:&v28];
          id v25 = v28;
          double v26 = v25;
          if ((v24 & 1) == 0) {
            NSLog(@"Error updating book's file size: %@ -- %@", v10, v25);
          }
        }
      }
    }
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  return -[AEPDFPlugin helper:coverImageForURL:size:](self, "helper:coverImageForURL:size:", a3, a4, CGSizeZero.width, CGSizeZero.height);
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  if ([(AEPDFPlugin *)self isPdfURL:v8])
  {
    id v9 = +[AEPdfCache sharedInstance];
    id v10 = [v9 copyCacheObjectForURL:v8];

    id v11 = [v10 document];
    if (v11
      && ([v10 document],
          id v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 isEncrypted],
          v12,
          (v13 & 1) == 0))
    {
      id v14 = +[AEPDFPlugin generateImageForDocument:pageIndex:size:](AEPDFPlugin, "generateImageForDocument:pageIndex:size:", v11, 0, width, height);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if ([(AEPDFPlugin *)self isPdfURL:v10])
  {
    if ([v9 isEqualToString:AEHelperStringMetadataDefaultCollectionNameKey])
    {
      id v11 = @"PDF";
    }
    else if ([v9 isEqualToString:AEHelperStringMetadataCoverArtEffectKey])
    {
      id v11 = (__CFString *)AEHelperStringMetadataCoverArtEffectEdgeSpiralValue;
    }
    else
    {
      id v12 = +[AEEpubInfoSource sharedInstance];
      id v11 = [v12 metadataForKey:v9 forURL:v10 needsCoordination:v6];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)helper:(id)a3 setMetadata:(id)a4 forKey:(id)a5 forURL:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  if ([(AEPDFPlugin *)self isPdfURL:v10])
  {
    id v11 = +[AEEpubInfoSource sharedInstance];
    [v11 setMetadata:v12 forKey:v9 forURL:v10];
  }
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  id v4 = a4;
  id v5 = +[AEEpubInfoSource sharedInstance];
  [v5 resetBookForURL:v4];

  id v6 = +[AEPdfCache sharedInstance];
  [v6 clearNativeObjectCache];
}

- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[AEEpubInfoSource sharedInstance];
  [v8 updateCachedURLFrom:v7 to:v6];

  id v9 = +[AEPdfCache sharedInstance];
  [v9 clearNativeObjectCache];
}

- (void)sendViewControllerForBook:(id)a3 toCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BKPDFModernBookViewController alloc] initWithBook:v7 storeID:0];

  id v9 = [(AEPDFPlugin *)self sharedBookCoverResetter];
  [(BKPDFModernBookViewController *)v8 setSharedBookCoverResetter:v9];

  id v10 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3E368;
  v12[3] = &unk_1DB210;
  unsigned __int8 v13 = v10;
  id v14 = v6;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)sendError:(id)a3 toCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3E438;
  v7[3] = &unk_1DB210;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)loadError:(id)a3
{
  uint64_t v3 = AssetEngineErrorDomain;
  id v4 = (void (**)(id, void, id))a3;
  id v5 = +[NSError errorWithDomain:v3 code:3001 userInfo:0];
  v4[2](v4, 0, v5);
}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 url];
  if ([(AEPDFPlugin *)self isPdfURL:v10])
  {
    id v11 = dispatch_get_global_queue(0, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3E5F8;
    v12[3] = &unk_1DB878;
    id v13 = v10;
    id v14 = self;
    id v16 = v9;
    id v15 = v8;
    dispatch_async(v11, v12);
  }
}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  return 0;
}

- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AEEpubInfoSource sharedInstance];
  id v12 = [v11 bookInfoForURL:v10 fromManagedObjectContext:v9 error:a5 needsCoordination:v6 updateDate:0];

  return v12;
}

- (void)showPasswordDialogForBook:(id)a3 transaction:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  if (!v8) {
    BCReportAssertionFailureWithMessage();
  }
  id v29 = [v7 managedObjectContext];
  id v9 = AEBundle();
  id v10 = [v9 localizedStringForKey:@"PDF Password Protected" value:&stru_1DF0D8 table:0];
  id v11 = AEBundle();
  id v12 = [v11 localizedStringForKey:@"Please type the password below." value:&stru_1DF0D8 table:0];
  id v13 = +[UIAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];

  id v14 = AEBundle();
  id v15 = [v14 localizedStringForKey:@"Cancel" value:&stru_1DF0D8 table:0];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_3F388;
  v38[3] = &unk_1DB8A0;
  v38[4] = self;
  id v16 = v28;
  id v40 = v16;
  id v17 = v13;
  id v39 = v17;
  id v18 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v38];
  [v17 addAction:v18];

  id v19 = AEBundle();
  double v20 = [v19 localizedStringForKey:@"OK" value:&stru_1DF0D8 table:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = sub_3F40C;
  v31[3] = &unk_1DB8C8;
  id v32 = v17;
  id v33 = v7;
  id v34 = v29;
  v35 = self;
  id v36 = v8;
  id v37 = v16;
  id v21 = v8;
  id v22 = v16;
  id v23 = v29;
  id v24 = v7;
  id v25 = v17;
  double v26 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v31];
  [v25 addAction:v26];

  [v25 addTextFieldWithConfigurationHandler:&stru_1DB908];
  v27 = +[AEAssetEngine appInfoMgr];
  [v27 presentViewController:v25 transaction:v21 animated:1 completion:0];
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (BCCoverResetting)sharedBookCoverResetter
{
  return self->_sharedBookCoverResetter;
}

- (void)setSharedBookCoverResetter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, 0);

  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
}

@end