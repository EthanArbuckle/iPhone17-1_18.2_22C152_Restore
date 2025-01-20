@interface BKBookCacheController
+ (id)sharedInstance;
- (BKBookCacheController)init;
- (NSCountedSet)openBooks;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)serialQueue;
- (void)cachedURLForAssetURL:(id)a3 completion:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setMetadataForAssetID:(id)a3 withHelper:(id)a4 pageCount:(int64_t)a5;
- (void)setOpenBooks:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation BKBookCacheController

+ (id)sharedInstance
{
  if (qword_100B4A5A0 != -1) {
    dispatch_once(&qword_100B4A5A0, &stru_100A4A0C0);
  }
  v2 = (void *)qword_100B4A598;

  return v2;
}

- (BKBookCacheController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKBookCacheController;
  v2 = [(BKBookCacheController *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSCountedSet);
    [(BKBookCacheController *)v2 setOpenBooks:v3];

    dispatch_queue_t v4 = dispatch_queue_create("BKBookCacheController.access", 0);
    [(BKBookCacheController *)v2 setAccessQueue:v4];

    dispatch_queue_t v5 = dispatch_queue_create("BKBookCacheController.serial", 0);
    [(BKBookCacheController *)v2 setSerialQueue:v5];
  }
  return v2;
}

- (void)setMetadataForAssetID:(id)a3 withHelper:(id)a4 pageCount:(int64_t)a5
{
  id v39 = a3;
  id v7 = a4;
  if (v39 && v7)
  {
    v8 = +[BKLibraryManager defaultManager];
    id v9 = [v8 newManagedObjectContext];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 2 %s %@", "-[BKBookCacheController setMetadataForAssetID:withHelper:pageCount:]", v39);
    [v9 setName:v10];

    v11 = [v8 libraryMutableAssetWithAssetID:v39 inManagedObjectContext:v9];
    v12 = v11;
    if (!v11)
    {
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v13 = [v11 author];
    if (!v13
      || (v14 = (void *)v13,
          [v12 author],
          v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 isEqualToString:BKLibrarySortLastUnknownAuthorString],
          v15,
          v14,
          v16))
    {
      v17 = [v7 helperMetadataForKey:AEHelperStringMetadataAuthorKey needsCoordination:1];
      if ([v17 length]) {
        [v12 setAuthor:v17];
      }
    }
    v18 = [v12 title];

    if (!v18)
    {
      uint64_t v19 = [v7 helperMetadataForKey:AEHelperStringMetadataTitleKey needsCoordination:1];
      if (v19) {
        v20 = (__CFString *)v19;
      }
      else {
        v20 = &stru_100A70340;
      }
      [v12 setTitle:v20];
    }
    v21 = [v12 genre];

    if (!v21)
    {
      uint64_t v22 = [v7 helperMetadataForKey:AEHelperStringMetadataGenreKey needsCoordination:1];
      if (v22) {
        v23 = (__CFString *)v22;
      }
      else {
        v23 = &stru_100A70340;
      }
      [v12 setGenre:v23];
    }
    v24 = [v12 epubID];

    if (!v24)
    {
      uint64_t v25 = [v7 helperMetadataForKey:AEHelperStringMetadataBookIdUrlIdentifierKey needsCoordination:1];
      if (v25) {
        v26 = (__CFString *)v25;
      }
      else {
        v26 = &stru_100A70340;
      }
      [v12 setEpubID:v26];
    }
    v27 = [v12 language];

    if (!v27)
    {
      uint64_t v28 = [v7 helperMetadataForKey:AEHelperStringMetadataLanguageKey needsCoordination:1];
      if (v28) {
        v29 = (__CFString *)v28;
      }
      else {
        v29 = &stru_100A70340;
      }
      [v12 setLanguage:v29];
    }
    v30 = [v12 pageProgressionDirection];

    if (v30)
    {
      unsigned int v31 = 0;
    }
    else
    {
      v32 = [v7 helperMetadataForKey:AEHelperStringMetadataPageProgressionKey needsCoordination:1];
      if (v32)
      {
        [v12 setPageProgressionDirection:v32];
        unsigned int v31 = [v32 isEqualToString:AEHelperStringMetadataPageProgressionRightToLeftValue];
      }
      else
      {
        unsigned int v31 = 0;
      }
    }
    v33 = [v12 coverWritingMode];

    if (v33)
    {
      if (!v31)
      {
LABEL_44:
        id v38 = [v12 pageCount];
        if ((unint64_t)(a5 - 1) <= 0x7FFFFFFFFFFFFFFDLL && !v38 && [v12 pageCount] != (id)a5) {
          [v12 setPageCount:a5];
        }
        if ([v9 hasChanges]) {
          [v9 saveLibrary];
        }
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v34 = [v7 helperMetadataForKey:AEHelperStringMetadataCoverWritingModeKey needsCoordination:1];
      if (v34)
      {
        v35 = (void *)v34;
        [v12 setCoverWritingMode:v34];
        LOBYTE(v31) = [v35 imIsVerticalWritingMode];
      }
      if ((v31 & 1) == 0) {
        goto LABEL_44;
      }
    }
    v36 = [v12 temporaryAssetID];
    if ([v36 length])
    {
      v37 = +[BCCacheManager defaultCacheManager];
      [v37 incrementVersionForIdentifier:v39];
    }
    goto LABEL_44;
  }
LABEL_51:
}

- (void)cachedURLForAssetURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BKBookCacheController *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B8334;
  v11[3] = &unk_100A44120;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (NSCountedSet)openBooks
{
  return self->_openBooks;
}

- (void)setOpenBooks:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_openBooks, 0);
}

@end