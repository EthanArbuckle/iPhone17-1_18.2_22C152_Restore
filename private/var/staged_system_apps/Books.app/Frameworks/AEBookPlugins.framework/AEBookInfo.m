@interface AEBookInfo
+ (BOOL)isUndesirableImageData:(id)a3;
+ (id)_nonUpdatedAnnotationsForDocumentOrdinal:(id)a3 assetID:(id)a4 moc:(id)a5;
+ (id)bookFromDatabaseKey:(id)a3 withMOC:(id)a4;
+ (id)bookObjectIDsWithPredicate:(id)a3 inMoc:(id)a4;
+ (id)booksWithPredicate:(id)a3 inMoc:(id)a4;
+ (id)booksWithPredicate:(id)a3 sortBy:(id)a4 ascending:(BOOL)a5 fetchLimit:(int)a6 inMoc:(id)a7;
+ (id)booksWithPredicate:(id)a3 sortDescriptors:(id)a4 inMoc:(id)a5;
+ (id)databaseKeyFromStoreId:(id)a3 andUniqueId:(id)a4;
+ (id)defaultAnnotationCreatorIdentifier;
+ (id)excludeDeletedBooksPredicate;
+ (id)linearDocumentPredicateForDatabaseKey:(id)a3;
+ (id)newBlankBook:(id)a3;
+ (id)storeURLForBookStoreId:(id)a3 isAudiobook:(BOOL)a4;
+ (int)bookFormatByFilePath:(id)a3;
- (AEAnnotationProvider)annotationProvider;
- (BEBookViewModel)epub;
- (BEProtocolCacheItem)cacheItem;
- (BKLocation)firstDocumentLocation;
- (BKLocation)readingLocation;
- (BKStyleManager)styleManager;
- (BOOL)bumpReadingLocationAnnotationVersionToMinimumVersion:(id)a3;
- (BOOL)currentlyDownloading;
- (BOOL)exists;
- (BOOL)hasBuiltInFonts;
- (BOOL)hasDuplicatedDocument;
- (BOOL)hasMediaOverlayElements;
- (BOOL)hasPhysicalPages;
- (BOOL)hasUpsellPage;
- (BOOL)hidesSpine;
- (BOOL)isBookVersioned;
- (BOOL)isCorrectPassword:(id)a3 forDocument:(id)a4;
- (BOOL)isEncryptionLegal;
- (BOOL)isFixedLayout;
- (BOOL)isInteractive;
- (BOOL)isLandscapeProhibited;
- (BOOL)isManagedBook;
- (BOOL)isPageProgressionRTL;
- (BOOL)isPasswordDialogNeeded;
- (BOOL)isPortraitProhibited;
- (BOOL)isProtected;
- (BOOL)isReadyToOpen;
- (BOOL)isScrollModeDisabled;
- (BOOL)isStoreBook;
- (BOOL)languageDefaultsToHorizontalTextFlow;
- (BOOL)needsGenericCoverArt;
- (BOOL)needsReparsing;
- (BOOL)obeyPageBreaks;
- (BOOL)shouldAllowRemoteInspection;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)suppressTOC;
- (BOOL)visibleSpine;
- (BOOL)wantsJumpBackHistory;
- (BOOL)wasParsed;
- (CGSize)fixedLayoutSizeForDocumentWithOrdinal:(unint64_t)a3;
- (NSNumber)isPreorder;
- (NSNumber)storeFrontId;
- (NSString)assetLogID;
- (NSString)embeddedArtHref;
- (NSString)password;
- (NSString)shortBookTitle;
- (id)_makeFileUrlIfPossible:(id)a3;
- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6;
- (id)allDocuments;
- (id)annotationsOnMainQueue;
- (id)assetType;
- (id)basePlusContentPath;
- (id)baseURL;
- (id)confirmBagContents;
- (id)dictionaryRepresentation;
- (id)documentAtPath:(id)a3;
- (id)documentContainingLocation:(id)a3;
- (id)documentWithOrdinal:(unint64_t)a3;
- (id)documentsWithPath:(id)a3 sortBy:(id)a4 limit:(int64_t)a5;
- (id)embeddedArtHrefMinusSubpath;
- (id)embeddedArtSinf;
- (id)embeddedArtURL;
- (id)firstDocument;
- (id)lastDocument;
- (id)linearDocuments;
- (id)mimeFromHref:(id)a3;
- (id)navigationInfosForDocument:(id)a3;
- (id)newestAnnotationWithPredicate:(id)a3 rangeCheck:(BOOL)a4 moc:(id)a5;
- (id)physicalPageMap;
- (id)physicalPageMapForDocument:(id)a3;
- (id)readingLocationAnnotation:(BOOL)a3 moc:(id)a4;
- (id)sortedDocuments;
- (id)url;
- (id)urlForDocument:(id)a3;
- (id)urlForHref:(id)a3;
- (id)versionNumberHumanReadable;
- (int)bkPageProgressionDirection;
- (int)contentType;
- (int)languageDefaultPageProgressDirection;
- (int)openToSpread;
- (int)orientationLock;
- (int64_t)_documentOrdinalForHref:(id)a3;
- (int64_t)linearOrdinal:(int64_t)a3 offsetByDistance:(int64_t)a4;
- (int64_t)scrollModeOrientation;
- (int64_t)writingDirection;
- (unint64_t)linearDocumentCount;
- (unint64_t)linearIndexForOrdinal:(unint64_t)a3;
- (unint64_t)readingDocumentCount;
- (void)_adjustAnnotation:(id)a3 withLocation:(id)a4 selectedText:(id)a5 representativeText:(id)a6 updateStyle:(BOOL)a7;
- (void)_cacheURL;
- (void)_clearTransient;
- (void)_setBitMask:(unint64_t)a3 enabled:(BOOL)a4;
- (void)_setValidMediaOverlayElementCount:(int64_t)a3;
- (void)addChapters:(id)a3;
- (void)addChaptersObject:(id)a3;
- (void)addLandmarks:(id)a3;
- (void)addLandmarksObject:(id)a3;
- (void)addPhysicalPages:(id)a3;
- (void)addPhysicalPagesObject:(id)a3;
- (void)addSinfInfoObject:(id)a3;
- (void)calculatePasswordRequired;
- (void)checkAnnotationsForDuplicatedDocuments;
- (void)dealloc;
- (void)deleteAnnotation:(id)a3;
- (void)deleteParsedRelationships;
- (void)deleteSelfMaintainedRelationships;
- (void)didSave;
- (void)didTurnIntoFault;
- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6;
- (void)initializeAnnotationProviderWithAssetID:(id)a3;
- (void)removeChapters:(id)a3;
- (void)removeLandmarks:(id)a3;
- (void)removePhysicalPages:(id)a3;
- (void)removeSinfInfo:(id)a3;
- (void)resetAsNewlyDownloaded;
- (void)resetPersistentCache;
- (void)saveAnnotationsManagedObjectContext;
- (void)setAnnotationProvider:(id)a3;
- (void)setAssetLogID:(id)a3;
- (void)setBookAuthor:(id)a3;
- (void)setBookBundlePath:(id)a3;
- (void)setBookTitle:(id)a3;
- (void)setContentType:(int)a3;
- (void)setCurrentlyDownloading:(BOOL)a3;
- (void)setFixedLayout:(BOOL)a3;
- (void)setGenre:(id)a3;
- (void)setHasBuiltInFonts:(BOOL)a3;
- (void)setHidesSpine:(BOOL)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setIsPreorder:(id)a3;
- (void)setLandscapeProhibited:(BOOL)a3;
- (void)setObeyPageBreaks:(BOOL)a3;
- (void)setOpenToSpread:(int)a3;
- (void)setPassword:(id)a3;
- (void)setPortraitProhibited:(BOOL)a3;
- (void)setPublisherLocation:(id)a3;
- (void)setPublisherName:(id)a3;
- (void)setPublisherYear:(id)a3;
- (void)setReadingLocation:(id)a3;
- (void)setSingletonAnnotationType:(int)a3 location:(id)a4 modificationHandler:(id)a5;
- (void)setSortAuthor:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTemporaryItemIdentifier:(id)a3;
- (void)setupBaseURL;
- (void)setupFileSizeContentType;
@end

@implementation AEBookInfo

- (BOOL)hasUpsellPage
{
  if (+[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled])
  {
    v3 = [(AEBookInfo *)self sampleContent];
    if ([v3 BOOLValue]) {
      LOBYTE(v4) = 1;
    }
    else {
      unsigned int v4 = ![(AEBookInfo *)self isStoreBook];
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)excludeDeletedBooksPredicate
{
  id v2 = [objc_alloc((Class)NSNumber) initWithBool:1];
  v3 = +[NSPredicate predicateWithFormat:@"deletedFlag != %@", v2];

  return v3;
}

+ (id)linearDocumentPredicateForDatabaseKey:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND documentOrdinal >= 0 AND nonlinearElement == FALSE", a3];
}

+ (id)bookFromDatabaseKey:(id)a3 withMOC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = +[NSPredicate predicateWithFormat:@"databaseKey ==[n] %@", v5];
    v8 = [v6 entity:@"AEBookInfo" withPredicate:v7 sortBy:0 ascending:0 fetchLimit:1];
    if ([v8 count])
    {
      v9 = [v8 objectAtIndex:0];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)booksWithPredicate:(id)a3 sortBy:(id)a4 ascending:(BOOL)a5 fetchLimit:(int)a6 inMoc:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  v14 = [(id)objc_opt_class() excludeDeletedBooksPredicate];
  v15 = +[NSManagedObjectContext mergePredicate:v13 andPredicate:v14];

  v16 = [v11 entity:@"AEBookInfo" withPredicate:v15 sortBy:v12 ascending:v8 fetchLimit:a6];

  return v16;
}

+ (id)booksWithPredicate:(id)a3 sortDescriptors:(id)a4 inMoc:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() excludeDeletedBooksPredicate];
  id v11 = +[NSManagedObjectContext mergePredicate:v9 andPredicate:v10];

  id v12 = [v7 entity:@"AEBookInfo" withPredicate:v11 sortDescriptors:v8 fetchLimit:0 prefetchRelationships:0];

  return v12;
}

+ (id)booksWithPredicate:(id)a3 inMoc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() excludeDeletedBooksPredicate];
  id v8 = +[NSManagedObjectContext mergePredicate:v6 andPredicate:v7];

  id v9 = [v5 entity:@"AEBookInfo" withPredicate:v8 sortBy:0 ascending:0 fetchLimit:0];

  return v9;
}

+ (id)bookObjectIDsWithPredicate:(id)a3 inMoc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() excludeDeletedBooksPredicate];
  id v8 = +[NSManagedObjectContext mergePredicate:v6 andPredicate:v7];

  id v9 = [v5 objectIDsWithPredicate:v8 forEntity:@"AEBookInfo"];

  return v9;
}

+ (id)newBlankBook:(id)a3
{
  id v3 = a3;
  id v4 = [v3 newByClass:objc_opt_class()];

  return v4;
}

- (BOOL)exists
{
  id v2 = [(AEBookInfo *)self bookBundlePath];
  id v3 = objc_alloc_init((Class)NSFileManager);
  unsigned __int8 v4 = 0;
  if ([v2 length] && v2) {
    unsigned __int8 v4 = [v3 fileExistsAtPath:v2];
  }

  return v4;
}

- (id)basePlusContentPath
{
  basePlusContentPath = self->_basePlusContentPath;
  if (!basePlusContentPath)
  {
    unsigned __int8 v4 = [(AEBookInfo *)self bookContentSubpath];
    id v5 = [v4 length];

    id v6 = [(AEBookInfo *)self bookBundlePath];
    id v7 = v6;
    if (v5)
    {
      id v8 = [(AEBookInfo *)self bookContentSubpath];
      id v9 = [(NSString *)v7 stringByAppendingPathComponent:v8];
      v10 = self->_basePlusContentPath;
      self->_basePlusContentPath = v9;
    }
    else
    {
      id v11 = self->_basePlusContentPath;
      self->_basePlusContentPath = v6;
      id v7 = v11;
    }

    unsigned int v12 = [(NSString *)self->_basePlusContentPath characterAtIndex:(char *)[(NSString *)self->_basePlusContentPath length] - 1];
    basePlusContentPath = self->_basePlusContentPath;
    if (v12 != 47)
    {
      id v13 = [(NSString *)basePlusContentPath stringByAppendingString:@"/"];
      v14 = self->_basePlusContentPath;
      self->_basePlusContentPath = v13;

      basePlusContentPath = self->_basePlusContentPath;
    }
  }

  return basePlusContentPath;
}

- (void)setupFileSizeContentType
{
  id v3 = [(AEBookInfo *)self bookBundlePath];
  [(AEBookInfo *)self setContentType:+[AEBookInfo bookFormatByFilePath:v3]];

  if ([(AEBookInfo *)self contentType] == 2)
  {
    id v9 = objc_alloc_init((Class)NSFileManager);
    unsigned __int8 v4 = [(AEBookInfo *)self bookBundlePath];
    id v5 = [v9 attributesOfItemAtPath:v4 error:0];

    id v6 = [v5 objectForKey:NSFileSize];
    [(AEBookInfo *)self setFileSize:v6];
  }
  else
  {
    if ([(AEBookInfo *)self contentType]) {
      return;
    }
    id v7 = [(AEBookInfo *)self fileSize];
    unsigned int v8 = [v7 intValue];

    if (!v8) {
      return;
    }
    id v9 = [objc_alloc((Class)NSNumber) initWithInt:0];
    -[AEBookInfo setFileSize:](self, "setFileSize:");
  }
}

- (AEAnnotationProvider)annotationProvider
{
  annotationProvider = self->_annotationProvider;
  if (!annotationProvider)
  {
    [(AEBookInfo *)self initializeAnnotationProviderWithAssetID:0];
    annotationProvider = self->_annotationProvider;
  }

  return annotationProvider;
}

- (void)initializeAnnotationProviderWithAssetID:(id)a3
{
  id v4 = a3;
  if (!self->_annotationProvider)
  {
    id v5 = [(AEBookInfo *)self url];
    if (v5)
    {
      id v6 = +[AEPluginRegistry sharedInstance];
      id v7 = [v6 pluginForURL:v5];

      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_13859C();
        }
        BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v8) {
          sub_138560(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
      v16 = [v7 helperForURL:v5 withOptions:0];
      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1384D4();
        }
        BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v17) {
          sub_138498(v17, v18, v19, v20, v21, v22, v23, v24);
        }
      }
      v25 = [v16 annotationProviderWithCoordination:0 forAssetID:v4];
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_13840C();
        }
        BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v26) {
          sub_1383D0(v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_138344();
      }
      BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34) {
        sub_138308(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      v25 = +[AEAnnotationProvider sharedInstance];
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_13827C();
        }
        BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v42) {
          sub_138240(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        v25 = 0;
      }
    }
    annotationProvider = self->_annotationProvider;
    self->_annotationProvider = v25;

    if (!self->_annotationProvider)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1381B4();
      }
      BOOL v51 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v51) {
        sub_138178(v51, v52, v53, v54, v55, v56, v57, v58);
      }
    }
  }
}

- (void)setupBaseURL
{
  if (!self->_baseUrl)
  {
    uint64_t v3 = BEURLSchemeiBooks;
    id v4 = [(AEBookInfo *)self databaseKey];
    id v7 = +[NSString stringWithFormat:@"%@://%@", v3, v4];

    if (v7)
    {
      id v5 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v7];
      baseUrl = self->_baseUrl;
      self->_baseUrl = v5;
    }
  }
}

- (void)setBookAuthor:(id)a3
{
  id v4 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"bookAuthor"];
  id v5 = [v4 stringByConvertingControlCharactersToSpace];

  [(AEBookInfo *)self setPrimitiveValue:v5 forKey:@"bookAuthor"];

  [(AEBookInfo *)self didChangeValueForKey:@"bookAuthor"];
}

- (void)setSortAuthor:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"sortAuthor"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"sortAuthor"];

    [(AEBookInfo *)self didChangeValueForKey:@"sortAuthor"];
  }
}

- (void)setBookTitle:(id)a3
{
  id v4 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"bookTitle"];
  id v5 = [v4 stringByConvertingControlCharactersToSpace];

  [(AEBookInfo *)self setPrimitiveValue:v5 forKey:@"bookTitle"];

  [(AEBookInfo *)self didChangeValueForKey:@"bookTitle"];
}

- (void)setSortTitle:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"sortTitle"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"sortTitle"];

    [(AEBookInfo *)self didChangeValueForKey:@"sortTitle"];
  }
}

- (void)setTemporaryItemIdentifier:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"temporaryItemIdentifier"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"temporaryItemIdentifier"];

    [(AEBookInfo *)self didChangeValueForKey:@"temporaryItemIdentifier"];
  }
}

- (void)setPublisherName:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"publisherName"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"publisherName"];

    [(AEBookInfo *)self didChangeValueForKey:@"publisherName"];
  }
}

- (void)setPublisherLocation:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"publisherLocation"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"publisherLocation"];

    [(AEBookInfo *)self didChangeValueForKey:@"publisherLocation"];
  }
}

- (void)setPublisherYear:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"publisherYear"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"publisherYear"];

    [(AEBookInfo *)self didChangeValueForKey:@"publisherYear"];
  }
}

- (void)setStoreId:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AEBookInfo *)self willChangeValueForKey:@"storeId"];
    id v4 = [v5 stringByConvertingControlCharactersToSpace];
    [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"storeId"];

    [(AEBookInfo *)self didChangeValueForKey:@"storeId"];
  }
}

- (void)setGenre:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  if (!v4) {
    CFStringRef v4 = &stru_1DF0D8;
  }
  id v6 = (__CFString *)v4;
  [(AEBookInfo *)self willChangeValueForKey:@"genre"];
  id v5 = [(__CFString *)v6 stringByConvertingControlCharactersToSpace];
  [(AEBookInfo *)self setPrimitiveValue:v5 forKey:@"genre"];

  [(AEBookInfo *)self didChangeValueForKey:@"genre"];
}

- (BOOL)needsGenericCoverArt
{
  unsigned int v3 = [(AEBookInfo *)self contentType];
  if (v3 == 2) {
    return 0;
  }
  if (v3) {
    return 1;
  }
  CFStringRef v4 = [(AEBookInfo *)self iTunesArtHref];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(AEBookInfo *)self embeddedArtHref];
    BOOL v5 = v6 == 0;
  }
  return v5;
}

- (void)_clearTransient
{
  url = self->_url;
  self->_url = 0;

  baseUrl = self->_baseUrl;
  self->_baseUrl = 0;

  basePlusContentPath = self->_basePlusContentPath;
  self->_basePlusContentPath = 0;

  password = self->_password;
  self->_password = 0;

  id v7 = self;
  objc_sync_enter(v7);
  sortedDocuments = v7->_sortedDocuments;
  v7->_sortedDocuments = 0;

  objc_sync_exit(v7);
  linearDocuments = v7->_linearDocuments;
  v7->_linearDocuments = 0;

  v7->_readingDocumentCount = 0;
  v7->_linearDocumentCount = 0;
  linearOrdinalMap = v7->_linearOrdinalMap;
  v7->_linearOrdinalMap = 0;

  shouldDisableOptimizeSpeed = v7->_shouldDisableOptimizeSpeed;
  v7->_shouldDisableOptimizeSpeed = 0;

  v7->_mediaOverlayElementCountValid = 0;
  v7->_mediaOverlayElementCount = 0;
}

- (void)dealloc
{
  [(AEBookInfo *)self _clearTransient];
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  annotationProvider = self->_annotationProvider;
  self->_annotationProvider = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEBookInfo;
  [(AEBookInfo *)&v5 dealloc];
}

- (id)baseURL
{
  baseUrl = self->_baseUrl;
  if (!baseUrl)
  {
    [(AEBookInfo *)self setupBaseURL];
    baseUrl = self->_baseUrl;
  }

  return baseUrl;
}

- (id)_makeFileUrlIfPossible:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && ([v4 isFileURL] & 1) == 0)
  {
    id v6 = [v5 path];
    if ([v6 rangeOfString:@".jpg" options:1] != (id)0x7FFFFFFFFFFFFFFFLL
      || [v6 rangeOfString:@".png" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(AEBookInfo *)self basePlusContentPath];
      BOOL v8 = [v7 stringByAppendingPathComponent:v6];

      uint64_t v9 = +[NSURL fileURLWithPath:v8 isDirectory:0];

      objc_super v5 = (void *)v9;
    }
  }

  return v5;
}

- (NSString)embeddedArtHref
{
  unsigned int v3 = [(AEBookInfo *)self embeddedArtHrefRejected];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4)
  {
    objc_super v5 = 0;
  }
  else
  {
    [(AEBookInfo *)self willAccessValueForKey:@"embeddedArtHref"];
    objc_super v5 = [(AEBookInfo *)self primitiveValueForKey:@"embeddedArtHref"];
    [(AEBookInfo *)self didAccessValueForKey:@"embeddedArtHref"];
  }

  return (NSString *)v5;
}

- (id)embeddedArtURL
{
  unsigned int v3 = [(AEBookInfo *)self embeddedArtHref];
  if (v3)
  {
    unsigned __int8 v4 = [(AEBookInfo *)self bookBundlePath];
    objc_super v5 = v4;
    if (v4)
    {
      id v6 = [v4 stringByAppendingPathComponent:v3];

      objc_super v5 = +[NSURL fileURLWithPath:v6 isDirectory:0];
    }
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)embeddedArtHrefMinusSubpath
{
  unsigned int v3 = [(AEBookInfo *)self embeddedArtHref];
  if (v3)
  {
    unsigned __int8 v4 = [(AEBookInfo *)self bookContentSubpath];
    if (v4)
    {
      if ([v3 hasPrefix:@"/"])
      {
        uint64_t v5 = [v3 substringFromIndex:1];

        unsigned int v3 = (void *)v5;
      }
      if ([v4 hasPrefix:@"/"])
      {
        uint64_t v6 = [v4 substringFromIndex:1];

        unsigned __int8 v4 = (void *)v6;
      }
      if (![v3 rangeOfString:v4])
      {
        uint64_t v8 = [v3 substringFromIndex:v7];

        unsigned int v3 = (void *)v8;
      }
    }
  }

  return v3;
}

+ (BOOL)isUndesirableImageData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  if ([(__CFData *)v3 hash] != (id)153495661 && (unint64_t)[(__CFData *)v3 length] <= 0x4000000)
  {
    uint64_t v6 = CGImageSourceCreateWithData(v3, 0);
    if (!v6)
    {
      char IsLegacyGenericBookCoverImageSource = 0;
      goto LABEL_4;
    }
    uint64_t v7 = v6;
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      uint64_t v10 = CFDictionaryGetValue(v8, @"PixelWidth");
      uint64_t v11 = CFDictionaryGetValue(v9, @"PixelHeight");
      CFRelease(v9);
      if ((uint64_t)[v10 integerValue] > 0x4000 || (uint64_t)objc_msgSend(v11, "integerValue") > 0x4000)
      {

        char IsLegacyGenericBookCoverImageSource = 1;
LABEL_13:
        CFRelease(v7);
        goto LABEL_4;
      }
    }
    char IsLegacyGenericBookCoverImageSource = BKGenericBookCoverIsLegacyGenericBookCoverImageSource();
    goto LABEL_13;
  }
  char IsLegacyGenericBookCoverImageSource = 1;
LABEL_4:

  return IsLegacyGenericBookCoverImageSource;
}

- (id)embeddedArtSinf
{
  CFDataRef v3 = [(AEBookInfo *)self sinfInfo];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(AEBookInfo *)self embeddedArtHrefMinusSubpath];
    if ([v5 length])
    {
      uint64_t v6 = [(AEBookInfo *)self documentAtPath:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        CFDictionaryRef v8 = [v6 sinfNumber];
        CFDictionaryRef v9 = +[NSPredicate predicateWithFormat:@"sinfNumber ==[n] %@", v8];

        uint64_t v10 = [(AEBookInfo *)self sinfInfo];
        uint64_t v11 = [v10 filteredSetUsingPredicate:v9];

        if ([v11 count] == (char *)&dword_0 + 1)
        {
          uint64_t v12 = [v11 anyObject];
          uint64_t v13 = [v12 sinfBlob];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)confirmBagContents
{
  id v2 = self;
  CFDataRef v3 = [(AEBookInfo *)self sinfInfo];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(AEBookInfo *)v2 embeddedArtURL];
    uint64_t v6 = [(AEBookInfo *)v2 embeddedArtSinf];
    if (!v6 || ([v5 isFileURL] & 1) == 0)
    {
      [(AEBookInfo *)v2 sortedDocuments];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v43 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      if (v43)
      {
        uint64_t v38 = v5;
        uint64_t v39 = v6;
        uint64_t v41 = v2;
        uint64_t v42 = *(void *)v52;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v52 != v42) {
              objc_enumerationMutation(obj);
            }
            CFDictionaryRef v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            CFDictionaryRef v9 = [v8 sinfNumber];
            int v10 = [v9 intValue];

            if (v10 >= 1)
            {
              uint64_t v44 = i;
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              uint64_t v11 = [(AEBookInfo *)v2 sinfInfo];
              id v12 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v48;
LABEL_12:
                uint64_t v15 = 0;
                while (1)
                {
                  if (*(void *)v48 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
                  BOOL v17 = [v16 sinfNumber];
                  unsigned int v18 = [v17 intValue];
                  uint64_t v19 = [v8 sinfNumber];
                  unsigned int v20 = [v19 intValue];

                  if (v18 == v20) {
                    break;
                  }
                  if (v13 == (id)++v15)
                  {
                    id v13 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
                    if (v13) {
                      goto LABEL_12;
                    }
                    goto LABEL_18;
                  }
                }
                id v21 = v16;

                if (!v8) {
                  goto LABEL_22;
                }
                id v2 = v41;
                i = v44;
                if (v21)
                {
                  uint64_t v23 = [(AEBookInfo *)v41 basePlusContentPath];
                  uint64_t v24 = [v8 href];
                  v25 = [v23 stringByAppendingPathComponent:v24];

                  uint64_t v5 = +[NSURL fileURLWithPath:v25 isDirectory:0];

                  uint64_t v26 = [v21 sinfBlob];

                  uint64_t v6 = (void *)v26;
                  goto LABEL_28;
                }
              }
              else
              {
LABEL_18:

                id v21 = 0;
LABEL_22:
                id v2 = v41;
                i = v44;
              }
            }
          }
          id v43 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
        }
        while (v43);
        uint64_t v5 = v38;
        uint64_t v6 = v39;
      }
LABEL_28:
    }
    if ([v5 isFileURL])
    {
      char v46 = 0;
      uint64_t v28 = [v5 path];
      id v45 = 0;
      uint64_t v29 = +[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:v28 sinfData:v6 refetch:&v46 error:&v45];
      id v22 = v45;

      if (!v29 && v46)
      {
        uint64_t v30 = v5;
        uint64_t v31 = [v22 domain];
        if ([v31 isEqualToString:fd45c988dd8cc08fce2e58d17f4ed2]) {
          BOOL v32 = [v22 code] == (id)-996;
        }
        else {
          BOOL v32 = 0;
        }

        uint64_t v33 = AssetEngineErrorDomain;
        uint64_t v55 = AssetEngineErrorIsFamilyRemovalKey;
        BOOL v34 = +[NSNumber numberWithBool:v32];
        uint64_t v56 = v34;
        uint64_t v35 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        uint64_t v36 = +[NSError errorWithDomain:v33 code:2002 userInfo:v35];

        id v22 = (id)v36;
        uint64_t v5 = v30;
      }
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)urlForHref:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v4 stringWithPercentEscape];

    uint64_t v7 = [(AEBookInfo *)self baseURL];
    CFDictionaryRef v8 = +[NSURL URLWithString:v6 relativeToURL:v7];
  }
  else
  {
    uint64_t v6 = 0;
    CFDictionaryRef v8 = 0;
  }

  return v8;
}

- (NSString)shortBookTitle
{
  id v2 = [(AEBookInfo *)self bookTitle];
  id v3 = [v2 rangeOfString:@": "];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL
    && (id v3 = [v2 rangeOfString:@"; "], v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    && (id v3 = [v2 rangeOfString:@" / "], v3 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 substringToIndex:v3];
  }
  uint64_t v5 = v4;

  return (NSString *)v5;
}

- (int)contentType
{
  [(AEBookInfo *)self willAccessValueForKey:@"contentType"];
  id v3 = [(AEBookInfo *)self primitiveValueForKey:@"contentType"];
  int v4 = [v3 intValue];

  [(AEBookInfo *)self didAccessValueForKey:@"contentType"];
  return v4;
}

- (void)setContentType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(AEBookInfo *)self contentType] != a3)
  {
    id v5 = [objc_alloc((Class)NSNumber) initWithInt:v3];
    [(AEBookInfo *)self willChangeValueForKey:@"contentType"];
    [(AEBookInfo *)self setPrimitiveValue:v5 forKey:@"contentType"];
    [(AEBookInfo *)self didChangeValueForKey:@"contentType"];
  }
}

+ (int)bookFormatByFilePath:(id)a3
{
  return BookFormatByFilePath();
}

- (NSNumber)storeFrontId
{
  [(AEBookInfo *)self willAccessValueForKey:@"storeFrontId"];
  id v3 = [(AEBookInfo *)self primitiveValueForKey:@"storeFrontId"];
  [(AEBookInfo *)self didAccessValueForKey:@"storeFrontId"];
  if (!v3)
  {
    int v4 = [(AEBookInfo *)self bookBundlePath];
    id v5 = [v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

    if (v5)
    {
      uint64_t v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];
      uint64_t v7 = [v6 objectForKey:@"s"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [objc_alloc((Class)NSScanner) initWithString:v7];
        uint64_t v10 = 0;
        id v3 = 0;
        if ([v8 scanLongLong:&v10])
        {
          id v3 = +[NSNumber numberWithUnsignedLongLong:v10];
        }

        goto LABEL_9;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = v7;
LABEL_9:

        if (v3) {
          [(AEBookInfo *)self setStoreFrontId:v3];
        }
        goto LABEL_13;
      }
    }
    id v3 = 0;
LABEL_13:
  }

  return (NSNumber *)v3;
}

- (void)deleteSelfMaintainedRelationships
{
  id v5 = [(AEBookInfo *)self managedObjectContext];
  id v3 = [(AEBookInfo *)self databaseKey];
  int v4 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey ==[n] %@", v3];

  [v5 batchDeleteEntity:@"BKMediaOverlayElement" matching:v4 prefetchRelationships:0];
  [v5 batchDeleteEntity:@"BKDocument" matching:v4 prefetchRelationships:0];
  [v5 batchDeleteEntity:@"BKDocumentPageCount" matching:v4 prefetchRelationships:0];
  [v5 batchDeleteEntity:@"BKChapterPageCount" matching:v4 prefetchRelationships:0];
}

- (void)deleteParsedRelationships
{
  int v4 = [(AEBookInfo *)self managedObjectContext];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = [(AEBookInfo *)self chapters];
  id v6 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v52;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(id *)(*((void *)&v51 + 1) + 8 * (void)v10);

        [v4 deleteObject:v8];
        uint64_t v10 = (char *)v10 + 1;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v7);
  }
  id v12 = [(AEBookInfo *)self chapters];
  [(AEBookInfo *)self removeChapters:v12];

  id v13 = self;
  objc_sync_enter(v13);
  sortedDocuments = v13->_sortedDocuments;
  v13->_sortedDocuments = 0;

  objc_sync_exit(v13);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v15 = [(AEBookInfo *)v13 landmarks];
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v16)
  {
    id v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v48;
    do
    {
      unsigned int v20 = 0;
      id v21 = v18;
      do
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v15);
        }
        id v18 = *(id *)(*((void *)&v47 + 1) + 8 * (void)v20);

        [v4 deleteObject:v18];
        unsigned int v20 = (char *)v20 + 1;
        id v21 = v18;
      }
      while (v17 != v20);
      id v17 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v17);
  }
  id v22 = [(AEBookInfo *)v13 landmarks];
  [(AEBookInfo *)v13 removeLandmarks:v22];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v23 = [(AEBookInfo *)v13 physicalPages];
  id v24 = [v23 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v24)
  {
    id v25 = v24;
    id v26 = 0;
    uint64_t v27 = *(void *)v44;
    do
    {
      uint64_t v28 = 0;
      uint64_t v29 = v26;
      do
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v23);
        }
        id v26 = *(id *)(*((void *)&v43 + 1) + 8 * (void)v28);

        [v4 deleteObject:v26];
        uint64_t v28 = (char *)v28 + 1;
        uint64_t v29 = v26;
      }
      while (v25 != v28);
      id v25 = [v23 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v25);
  }
  uint64_t v30 = [(AEBookInfo *)v13 physicalPages];
  [(AEBookInfo *)v13 removePhysicalPages:v30];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v31 = [(AEBookInfo *)v13 sinfInfo];
  id v32 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v32)
  {
    id v33 = v32;
    id v34 = 0;
    uint64_t v35 = *(void *)v40;
    do
    {
      uint64_t v36 = 0;
      uint64_t v37 = v34;
      do
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v31);
        }
        id v34 = *(id *)(*((void *)&v39 + 1) + 8 * (void)v36);

        [v4 deleteObject:v34];
        uint64_t v36 = (char *)v36 + 1;
        uint64_t v37 = v34;
      }
      while (v33 != v36);
      id v33 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v33);
  }
  uint64_t v38 = [(AEBookInfo *)v13 sinfInfo];
  [(AEBookInfo *)v13 removeSinfInfo:v38];

  [(AEBookInfo *)v13 setParserVersion:0];
  [(AEBookInfo *)v13 setParserOPFPath:0];
  [(AEBookInfo *)v13 setParserNCXPath:0];
  [(AEBookInfo *)v13 setEmbeddedArtHref:0];
  [(AEBookInfo *)v13 setEmbeddedArtHrefRejected:0];
  [(AEBookInfo *)v13 setHasComputedFixedLayoutSize:0];
}

- (void)resetPersistentCache
{
  id v3 = [(AEBookInfo *)self persistentCachePath];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = +[IMPersistentCacheManager sharedInstance];
    id v6 = [(AEBookInfo *)self persistentCachePath];
    id v7 = [v5 cacheForPath:v6 maxSize:0];

    [v7 clear];
  }
}

- (void)resetAsNewlyDownloaded
{
  [(AEBookInfo *)self _clearTransient];
  [(AEBookInfo *)self deleteSelfMaintainedRelationships];
  [(AEBookInfo *)self deleteParsedRelationships];
  [(AEBookInfo *)self resetPersistentCache];
  [(AEBookInfo *)self setFixedLayout:0];

  [(AEBookInfo *)self setInteractive:0];
}

- (BOOL)wasParsed
{
  id v2 = [(AEBookInfo *)self parserVersion];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isReadyToOpen
{
  BOOL v3 = [(AEBookInfo *)self isDownloading];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4) {
    return 0;
  }
  id v5 = [(AEBookInfo *)self bookBundlePath];

  if (!v5) {
    return 0;
  }

  return [(AEBookInfo *)self isEncryptionLegal];
}

- (BOOL)isBookVersioned
{
  id v2 = [(AEBookInfo *)self versionNumberHumanReadable];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)versionNumberHumanReadable
{
  BOOL v3 = +[AEAssetEngine libraryMgr];
  unsigned __int8 v4 = [(AEBookInfo *)self url];
  id v5 = [v3 metadataForAssetAtURL:v4 needsCoordination:1];

  if (v5)
  {
    id v6 = +[IMLibraryPlist humanReadablePublicationVersionFromPlistEntry:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isProtected
{
  id v2 = [(AEBookInfo *)self sinfInfo];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isStoreBook
{
  id v2 = [(AEBookInfo *)self storeId];
  BOOL v3 = [v2 longLongValue] != 0;

  return v3;
}

- (BOOL)isManagedBook
{
  id v2 = [(AEBookInfo *)self url];
  BOOL v3 = +[IMLibraryPlist isManagedBookFromURL:v2];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldAllowRemoteInspection
{
  return ![(AEBookInfo *)self isProtected];
}

- (void)calculatePasswordRequired
{
  if ([(AEBookInfo *)self contentType] == 2)
  {
    BOOL v3 = [(AEBookInfo *)self isPasswordRequired];

    if (!v3)
    {
      unsigned __int8 v4 = +[AEPdfCache sharedInstance];
      id v8 = [v4 copyCacheObjectForBook:self];

      id v5 = v8;
      if (v8)
      {
        id v6 = [v8 document];
        id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isLocked]);
        [(AEBookInfo *)self setIsPasswordRequired:v7];

        id v5 = v8;
      }
    }
  }
}

- (BOOL)isPasswordDialogNeeded
{
  if ([(AEBookInfo *)self contentType] != 2) {
    return 0;
  }
  [(AEBookInfo *)self calculatePasswordRequired];
  BOOL v3 = [(AEBookInfo *)self isPasswordRequired];
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  id v5 = +[AEPdfCache sharedInstance];
  id v6 = [v5 copyCacheObjectForBook:self];

  if (v6)
  {
    id v7 = [v6 document];
    unsigned __int8 v8 = [v7 isLocked];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isCorrectPassword:(id)a3 forDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AEBookInfo *)self contentType] == 2)
  {
    id v8 = [v6 length];
    unsigned __int8 v9 = 0;
    if (v7 && v8) {
      unsigned __int8 v9 = [v7 unlockWithPassword:v6];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)setPassword:(id)a3
{
  if (self->_password != a3)
  {
    unsigned int v4 = (NSString *)[a3 copy];
    password = self->_password;
    self->_password = v4;

    id v6 = +[AEPdfCache sharedInstance];
  }
}

- (BOOL)isEncryptionLegal
{
  if (![(AEBookInfo *)self isProtected]) {
    return 1;
  }
  BOOL v3 = [(AEBookInfo *)self sinfInfo];
  unsigned int v4 = [v3 anyObject];

  id v5 = [v4 sinfNumber];
  BOOL v6 = (int)[v5 intValue] > 0;

  return v6;
}

- (BOOL)currentlyDownloading
{
  id v2 = [(AEBookInfo *)self isDownloading];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCurrentlyDownloading:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AEBookInfo *)self isDownloading];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithBool:v3];
    [(AEBookInfo *)self setIsDownloading:v7];
  }
}

- (void)didTurnIntoFault
{
  [(AEBookInfo *)self _clearTransient];
  v3.receiver = self;
  v3.super_class = (Class)AEBookInfo;
  [(AEBookInfo *)&v3 didTurnIntoFault];
}

- (void)didSave
{
  [(AEBookInfo *)self _clearTransient];
  [(AEBookInfo *)self saveAnnotationsManagedObjectContext];
  v3.receiver = self;
  v3.super_class = (Class)AEBookInfo;
  [(AEBookInfo *)&v3 didSave];
}

+ (id)databaseKeyFromStoreId:(id)a3 andUniqueId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = [v5 length], id v8 = v5, (unint64_t)v7 > 1)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v9 = [v6 length], id v8 = v6, (unint64_t)v9 >= 2))
  {
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)mimeFromHref:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(AEBookInfo *)self databaseKey];
    id v6 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND href == %@", v5, v4];

    id v7 = [(AEBookInfo *)self managedObjectContext];
    id v8 = +[NSEntityDescription entityForName:@"BKDocument" inManagedObjectContext:v7];

    id v9 = objc_alloc_init((Class)NSFetchRequest);
    [v9 setEntity:v8];
    id v10 = +[NSArray arrayWithObjects:@"mime", 0];
    [v9 setPropertiesToFetch:v10];

    [v9 setResultType:2];
    [v9 setPredicate:v6];
    uint64_t v11 = [(AEBookInfo *)self managedObjectContext];
    id v17 = 0;
    id v12 = [v11 executeFetchRequest:v9 error:&v17];
    id v13 = v17;

    if (v13) {
      [v13 logRecursively];
    }
    if ([v12 count] == (char *)&dword_0 + 1)
    {
      uint64_t v14 = [v12 objectAtIndex:0];
      uint64_t v15 = [v14 objectForKey:@"mime"];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)newestAnnotationWithPredicate:(id)a3 rangeCheck:(BOOL)a4 moc:(id)a5
{
  BOOL v5 = a4;
  id v7 = [a5 entity:@"AEAnnotation" withPredicate:a3 sortBy:@"annotationCreationDate" ascending:0 fetchLimit:1];
  id v8 = v7;
  if (v7 && [v7 count])
  {
    id v9 = [v8 objectAtIndex:0];
    if (v9 && v5)
    {
      unint64_t v10 = [(AEBookInfo *)self readingDocumentCount];
      if (v10 < (unint64_t)[v9 ordinal])
      {

        id v9 = 0;
      }
      if ([v9 annotationType] == 3)
      {
        uint64_t v11 = -[AEBookInfo documentWithOrdinal:](self, "documentWithOrdinal:", [v9 ordinal]);
        id v12 = v11;
        if (v11)
        {
          id v13 = [v11 nonlinearElement];
          unsigned int v14 = [v13 BOOLValue];

          if (v14)
          {

            id v9 = 0;
          }
        }
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)readingLocationAnnotation:(BOOL)a3 moc:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AEBookInfo *)self assetID];
  id v8 = +[AEAnnotation predicateForGlobalAnnotationWithAssetID:v7];

  id v9 = [(AEBookInfo *)self newestAnnotationWithPredicate:v8 rangeCheck:v4 moc:v6];

  if (v9)
  {
    unint64_t v10 = [v9 annotationCreatorIdentifier];

    if (!v10) {
      [v9 setAnnotationCreatorIdentifier:kAEAnnotationCreatorIdentifier_iBooks];
    }
  }

  return v9;
}

- (BKLocation)firstDocumentLocation
{
  objc_super v3 = [(AEBookInfo *)self firstDocumentHref];
  int64_t v4 = [(AEBookInfo *)self _documentOrdinalForHref:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [v3 rangeOfString:@"#"];
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    id v7 = [v3 substringToIndex:v5];
    int64_t v4 = [(AEBookInfo *)self _documentOrdinalForHref:v7];

    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = v4;
  if ([(AEBookInfo *)self linearIndexForOrdinal:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    id v8 = [(AEBookInfo *)self linearDocuments];
    if ([v8 count])
    {
      id v9 = [v8 objectAtIndexedSubscript:0];
      uint64_t v6 = (uint64_t)[v9 unboxedDocumentOrdinal];
    }
    int64_t v4 = v6;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t v11 = [[BKLocation alloc] initWithOrdinal:v10];

  return v11;
}

- (int64_t)_documentOrdinalForHref:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(AEBookInfo *)self managedObjectContext];
    uint64_t v6 = [(AEBookInfo *)self databaseKey];
    id v7 = +[NSPredicate predicateWithFormat:@"href ==[n] %@ AND bookDatabaseKey == %@", v4, v6];

    id v8 = [v5 copyEntityProperty:@"documentOrdinal" fromEntityName:@"BKDocument" withPredicate:v7];
    id v9 = [v8 objectForKey:@"documentOrdinal"];

    if (v9) {
      int64_t v10 = (int64_t)[v9 integerValue];
    }
    else {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)_adjustAnnotation:(id)a3 withLocation:(id)a4 selectedText:(id)a5 representativeText:(id)a6 updateStyle:(BOOL)a7
{
  BOOL v7 = a7;
  id v26 = a3;
  id v12 = a4;
  id v13 = a6;
  unsigned int v14 = +[AEAnnotation optimizedSelectedTextForSerialization:a5];
  uint64_t v15 = +[AEAnnotation optimizedRepresentativeTextForSerialization:v13 selectedText:v14];

  [v26 setOrdinal:[v12 ordinal]];
  id v16 = +[NSDate date];
  [v26 setAnnotationCreationDate:v16];

  [v26 setAnnotationSelectedText:v14];
  [v26 setAnnotationRepresentativeText:v15];
  [v26 setLocation:v12];
  id v17 = [(AEBookInfo *)self assetID];
  [v26 setAnnotationAssetID:v17];

  [v26 setSpineIndexUpdated:1];
  if (v7)
  {
    id v18 = +[NSUserDefaults standardUserDefaults];
    uint64_t v19 = [v18 objectForKey:BKDefaultHighlightColor[0]];
    [v26 setAnnotationStyle:[v19 intValue]];

    unsigned int v20 = +[NSUserDefaults standardUserDefaults];
    [v26 setAnnotationIsUnderline:[v20 BOOLForKey:BKDefaultUnderlineState]];
  }
  if ([(AEBookInfo *)self isBookVersioned]) {
    [(AEBookInfo *)self bumpReadingLocationAnnotationVersionToMinimumVersion:kAEAnnotationVersion_4];
  }
  if ([(AEBookInfo *)self hasDuplicatedDocument])
  {
    id v21 = [v12 ordinal];
    id v22 = [(AEBookInfo *)self sortedDocuments];
    if (v21)
    {
      uint64_t v23 = 0;
      while (1)
      {
        id v24 = [v22 objectAtIndexedSubscript:v23];
        id v25 = [v24 isDuplicateSpineEntry];

        if (v25) {
          break;
        }

        if (v21 == (id)++v23) {
          goto LABEL_12;
        }
      }
      [v26 bumpAnnotationVersionToMinimumVersion:kAEAnnotationVersion_5];
    }
LABEL_12:
  }
}

+ (id)defaultAnnotationCreatorIdentifier
{
  return kAEAnnotationCreatorIdentifier_iBooks;
}

- (void)setSingletonAnnotationType:(int)a3 location:(id)a4 modificationHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (((unint64_t)[v8 ordinal] & 0x8000000000000000) == 0)
  {
    int64_t v10 = [(AEBookInfo *)self annotationProvider];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_D2AC4;
    v11[3] = &unk_1DD338;
    int v14 = a3;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    [v10 performBlockOnUserSideQueueAndWait:v11];
  }
}

- (void)setReadingLocation:(id)a3
{
}

- (BKLocation)readingLocation
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int64_t v10 = sub_D2D34;
  uint64_t v11 = sub_D2D44;
  id v12 = 0;
  objc_super v3 = [(AEBookInfo *)self annotationProvider];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_D2D4C;
  v6[3] = &unk_1DD360;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockOnUserSideQueueAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BKLocation *)v4;
}

- (unint64_t)readingDocumentCount
{
  unint64_t result = self->_readingDocumentCount;
  if (!result)
  {
    id v4 = [(AEBookInfo *)self managedObjectContext];
    id v5 = [(AEBookInfo *)self databaseKey];
    uint64_t v6 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND documentOrdinal >= 0", v5];

    self->_readingDocumentCount = (unint64_t)[v4 countEntity:@"BKDocument" withPredicate:v6];
    return self->_readingDocumentCount;
  }
  return result;
}

- (id)sortedDocuments
{
  id v2 = self;
  objc_sync_enter(v2);
  sortedDocuments = v2->_sortedDocuments;
  if (!sortedDocuments)
  {
    id v4 = [(AEBookInfo *)v2 databaseKey];
    id v5 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND documentOrdinal >= 0", v4];

    uint64_t v6 = [(AEBookInfo *)v2 managedObjectContext];
    uint64_t v7 = [v6 entity:@"BKDocument" withPredicate:v5 sortBy:@"documentOrdinal" ascending:1 fetchLimit:0];

    id v8 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v7];
    uint64_t v9 = v2->_sortedDocuments;
    v2->_sortedDocuments = v8;

    sortedDocuments = v2->_sortedDocuments;
  }
  id v10 = [(NSArray *)sortedDocuments copy];
  objc_sync_exit(v2);

  return v10;
}

- (BOOL)hasDuplicatedDocument
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(AEBookInfo *)self sortedDocuments];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) isDuplicateSpineEntry];
        unsigned __int8 v7 = [v6 BOOLValue];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (unint64_t)linearDocumentCount
{
  unint64_t result = self->_linearDocumentCount;
  if (!result)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [(AEBookInfo *)self databaseKey];
    uint64_t v6 = [v4 linearDocumentPredicateForDatabaseKey:v5];

    unsigned __int8 v7 = [(AEBookInfo *)self managedObjectContext];
    self->_linearDocumentCount = (int64_t)[v7 countEntity:@"BKDocument" withPredicate:v6];

    return self->_linearDocumentCount;
  }
  return result;
}

- (id)linearDocuments
{
  linearDocuments = self->_linearDocuments;
  if (!linearDocuments)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [(AEBookInfo *)self databaseKey];
    uint64_t v6 = [v4 linearDocumentPredicateForDatabaseKey:v5];

    unsigned __int8 v7 = [(AEBookInfo *)self managedObjectContext];
    id v8 = [v7 entity:@"BKDocument" withPredicate:v6 sortBy:@"documentOrdinal" ascending:1 fetchLimit:0];

    long long v9 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v8];
    long long v10 = self->_linearDocuments;
    self->_linearDocuments = v9;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v11 = self->_linearDocuments;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v19;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * (void)v16) setLinearDocumentIndex:(char *)v16 + v14];
          id v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        v14 += (uint64_t)v16;
      }
      while (v13);
    }

    linearDocuments = self->_linearDocuments;
  }

  return linearDocuments;
}

- (id)allDocuments
{
  id v3 = [(AEBookInfo *)self databaseKey];
  uint64_t v4 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@", v3];

  id v5 = [(AEBookInfo *)self managedObjectContext];
  uint64_t v6 = [v5 entity:@"BKDocument" withPredicate:v4 sortBy:@"documentOrdinal" ascending:1 fetchLimit:0];

  id v7 = [objc_alloc((Class)NSArray) initWithArray:v6];

  return v7;
}

- (int64_t)linearOrdinal:(int64_t)a3 offsetByDistance:(int64_t)a4
{
  unint64_t v6 = [(AEBookInfo *)self linearIndexForOrdinal:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 + a4;
  if (v7 >= [(AEBookInfo *)self linearDocumentCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = [(AEBookInfo *)self linearDocuments];
  long long v9 = [v8 objectAtIndexedSubscript:v7];
  id v10 = [v9 unboxedDocumentOrdinal];

  return (int64_t)v10;
}

- (unint64_t)linearIndexForOrdinal:(unint64_t)a3
{
  linearOrdinalMap = self->_linearOrdinalMap;
  if (!linearOrdinalMap)
  {
    unint64_t v6 = [(AEBookInfo *)self linearDocuments];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_D35F0;
    v14[3] = &unk_1DD388;
    unint64_t v7 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v7;
    [v6 enumerateObjectsUsingBlock:v14];
    id v8 = self->_linearOrdinalMap;
    self->_linearOrdinalMap = v7;
    long long v9 = v7;

    linearOrdinalMap = self->_linearOrdinalMap;
  }
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  long long v11 = [(NSDictionary *)linearOrdinalMap objectForKey:v10];

  if (v11) {
    unint64_t v12 = (unint64_t)[v11 unsignedIntegerValue];
  }
  else {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (CGSize)fixedLayoutSizeForDocumentWithOrdinal:(unint64_t)a3
{
  uint64_t v4 = [(AEBookInfo *)self documentWithOrdinal:a3];
  if (!v4)
  {
    uint64_t v4 = [(AEBookInfo *)self lastDocument];
  }
  [v4 fixedLayoutSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)firstDocument
{
  id v2 = [(AEBookInfo *)self sortedDocuments];
  id v3 = [v2 firstObject];

  return v3;
}

- (id)lastDocument
{
  id v2 = [(AEBookInfo *)self sortedDocuments];
  id v3 = [v2 lastObject];

  return v3;
}

- (id)documentWithOrdinal:(unint64_t)a3
{
  uint64_t v4 = [(AEBookInfo *)self sortedDocuments];
  if ((unint64_t)[v4 count] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [v4 objectAtIndex:a3];
  }

  return v5;
}

- (id)urlForDocument:(id)a3
{
  uint64_t v4 = [a3 href];
  if ([v4 length])
  {
    uint64_t v5 = [v4 stringWithPercentEscape];

    double v6 = [(AEBookInfo *)self baseURL];
    double v7 = +[NSURL URLWithString:v5 relativeToURL:v6];

    uint64_t v4 = (void *)v5;
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)documentsWithPath:(id)a3 sortBy:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    double v10 = [(AEBookInfo *)self databaseKey];
    long long v11 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND href ==[n] %@", v10, v8];

    unint64_t v12 = [(AEBookInfo *)self managedObjectContext];
    id v13 = [v12 entity:@"BKDocument" withPredicate:v11 sortBy:v9 ascending:0 fetchLimit:a5];
  }
  else
  {
    id v13 = +[NSArray array];
  }

  return v13;
}

- (id)documentAtPath:(id)a3
{
  id v3 = [(AEBookInfo *)self documentsWithPath:a3 sortBy:@"documentOrdinal" limit:0];
  uint64_t v4 = [v3 lastObject];

  return v4;
}

- (id)documentContainingLocation:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[AEBookInfo documentWithOrdinal:](self, "documentWithOrdinal:", [a3 ordinal]);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)checkAnnotationsForDuplicatedDocuments
{
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x3032000000;
  long long v52 = sub_D2D34;
  long long v53 = sub_D2D44;
  id v54 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_D2D34;
  v47[4] = sub_D2D44;
  id v48 = 0;
  id v2 = [(AEBookInfo *)self annotationProvider];
  uint64_t v3 = [v2 uiManagedObjectContext];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_D3F60;
  v43[3] = &unk_1DD3B0;
  long long v45 = v47;
  v43[4] = self;
  id v44 = v3;
  long long v46 = &v49;
  id v24 = v44;
  [v44 performBlockAndWait:v43];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [(AEBookInfo *)self sortedDocuments];
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (([v9 isDeleted] & 1) == 0)
        {
          double v10 = [v9 isDuplicateSpineEntry];
          if (v10) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v6 <= 0;
          }
          int v12 = !v11;

          if (v12)
          {
            id v13 = [v9 documentOrdinal];
            uint64_t v14 = (char *)[v13 integerValue];

            uint64_t v15 = +[NSNumber numberWithInteger:&v14[-v6]];
            id v16 = [(AEBookInfo *)self assetID];
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_D3FDC;
            v33[3] = &unk_1DD3D8;
            id v17 = v15;
            id v34 = v17;
            id v18 = v16;
            id v35 = v18;
            id v19 = v24;
            id v36 = v19;
            uint64_t v37 = v6;
            uint64_t v38 = v14;
            [v19 performBlockAndWait:v33];
            long long v20 = (void *)v50[5];
            if (v20)
            {
              id v21 = [v20 ordinal];
              if (v21 == [v17 integerValue])
              {
                uint64_t v29 = 0;
                uint64_t v30 = &v29;
                uint64_t v31 = 0x2020000000;
                char v32 = 0;
                v28[0] = _NSConcreteStackBlock;
                v28[1] = 3221225472;
                v28[2] = sub_D41FC;
                v28[3] = &unk_1DD400;
                v28[4] = v47;
                v28[5] = &v49;
                v28[6] = &v29;
                v28[7] = v6;
                [v19 performBlockAndWait:v28];
                if (*((unsigned char *)v30 + 24))
                {
                  [(AEBookInfo *)self setReadingLocation:v50[5]];
                  id v22 = (void *)v50[5];
                  v50[5] = 0;
                }
                _Block_object_dispose(&v29, 8);
              }
            }
          }
          uint64_t v23 = [v9 isDuplicateSpineEntry];

          if (v23) {
            ++v6;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v5);

    if (v6 >= 1)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_D4278;
      v26[3] = &unk_1DBF08;
      v26[4] = self;
      id v27 = v24;
      [v27 performBlockAndWait:v26];
    }
  }
  else
  {
  }
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(&v49, 8);
}

- (id)annotationsOnMainQueue
{
  uint64_t v4 = [(AEBookInfo *)self assetID];
  id v5 = +[AEAnnotation annotationsPredicate:v4];

  uint64_t v6 = [(AEBookInfo *)self annotationProvider];
  uint64_t v7 = [v6 uiManagedObjectContext];
  id v8 = [v7 entity:@"AEAnnotation" withPredicate:v5 sortBy:@"annotationCreationDate" ascending:1 fetchLimit:0];

  return v8;
}

+ (id)_nonUpdatedAnnotationsForDocumentOrdinal:(id)a3 assetID:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[NSThread isMainThread])
  {
    BOOL v11 = +[AEAnnotation predicateForAnnotationsWithAssetID:ordinal:](AEAnnotation, "predicateForAnnotationsWithAssetID:ordinal:", v8, [v7 intValue]);
    v19[0] = v11;
    uint64_t v12 = kAEAnnotationSpineIndexUpdated;
    id v13 = +[NSNull null];
    uint64_t v14 = +[NSPredicate predicateWithFormat:@"%K == NO OR %K == %@", v12, v12, v13];
    v19[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v19 count:2];
    id v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

    id v17 = [v9 entity:@"AEAnnotation" withPredicate:v16 sortBy:@"annotationCreationDate" ascending:1 fetchLimit:0];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)deleteAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 annotationAssetID];
    unsigned int v7 = [v4 annotationType];
    id v8 = [v4 annotationUuid];
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "deleteAnnotation: assetID: %@, type: %d, uuid: %@", (uint8_t *)&v12, 0x1Cu);
  }
  id v9 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_138628((uint64_t)v4, v9);
  }

  double v10 = [(AEBookInfo *)self annotationProvider];
  BOOL v11 = [v4 managedObjectContext];
  [v10 deleteAnnotation:v4];
  [v10 saveManagedObjectContext:v11];
}

- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  if (a4) {
    [(AEBookInfo *)self _adjustAnnotation:a3 withLocation:a4 selectedText:a5 representativeText:a6 updateStyle:0];
  }
}

- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10 || ((unint64_t)[v10 ordinal] & 0x8000000000000000) != 0)
  {
    id v17 = 0;
  }
  else
  {
    id v13 = +[AEBookInfo defaultAnnotationCreatorIdentifier];
    __int16 v14 = [(AEBookInfo *)self assetID];
    unsigned int v15 = [(AEBookInfo *)self annotationProvider];
    __int16 v16 = [v15 uiManagedObjectContext];
    id v17 = +[AEAnnotation insertAnnotationWithAssetID:v14 creatorIdentifier:v13 annotationUuid:0 intoManagedObjectContext:v16];

    [v17 setAnnotationType:v8];
    [(AEBookInfo *)self _adjustAnnotation:v17 withLocation:v10 selectedText:v11 representativeText:v12 updateStyle:1];
    id v18 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v17 annotationAssetID];
      unsigned int v20 = [v17 annotationType];
      id v21 = [v17 annotationUuid];
      int v24 = 138412802;
      id v25 = v19;
      __int16 v26 = 1024;
      unsigned int v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "addAnnotation: assetID: %@, type: %d, uuid: %@", (uint8_t *)&v24, 0x1Cu);
    }
    id v22 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1386A0((uint64_t)v17, v22);
    }
  }

  return v17;
}

- (BOOL)bumpReadingLocationAnnotationVersionToMinimumVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(AEBookInfo *)self annotationProvider];
  uint64_t v6 = [v5 uiManagedObjectContext];
  unsigned int v7 = [(AEBookInfo *)self readingLocationAnnotation:0 moc:v6];

  id v8 = [v7 annotationVersion];
  id v9 = v8;
  if (v8 && (v8 == v4 || [v8 compare:v4 options:64] != (id)-1))
  {
    BOOL v10 = 0;
  }
  else
  {
    [v7 setAnnotationVersion:v4];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)addChapters:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"chapters" withSetMutation:1 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"chapters"];
  [v4 unionSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"chapters" withSetMutation:1 usingObjects:v5];
}

- (void)addChaptersObject:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:v4, 0];
  [(AEBookInfo *)self willChangeValueForKey:@"chapters" withSetMutation:1 usingObjects:v6];
  id v5 = [(AEBookInfo *)self primitiveValueForKey:@"chapters"];
  [v5 addObject:v4];

  [(AEBookInfo *)self didChangeValueForKey:@"chapters" withSetMutation:1 usingObjects:v6];
}

- (void)removeChapters:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"chapters" withSetMutation:2 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"chapters"];
  [v4 minusSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"chapters" withSetMutation:2 usingObjects:v5];
}

- (void)addLandmarks:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"landmarks" withSetMutation:1 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"landmarks"];
  [v4 unionSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"landmarks" withSetMutation:1 usingObjects:v5];
}

- (void)addLandmarksObject:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:v4, 0];
  [(AEBookInfo *)self willChangeValueForKey:@"landmarks" withSetMutation:1 usingObjects:v6];
  id v5 = [(AEBookInfo *)self primitiveValueForKey:@"landmarks"];
  [v5 addObject:v4];

  [(AEBookInfo *)self didChangeValueForKey:@"landmarks" withSetMutation:1 usingObjects:v6];
}

- (void)removeLandmarks:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"landmarks" withSetMutation:2 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"landmarks"];
  [v4 minusSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"landmarks" withSetMutation:2 usingObjects:v5];
}

- (void)addPhysicalPages:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"physicalPages" withSetMutation:1 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"physicalPages"];
  [v4 unionSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"physicalPages" withSetMutation:1 usingObjects:v5];
}

- (void)addPhysicalPagesObject:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:v4, 0];
  [(AEBookInfo *)self willChangeValueForKey:@"physicalPages" withSetMutation:1 usingObjects:v6];
  id v5 = [(AEBookInfo *)self primitiveValueForKey:@"physicalPages"];
  [v5 addObject:v4];

  [(AEBookInfo *)self didChangeValueForKey:@"physicalPages" withSetMutation:1 usingObjects:v6];
}

- (void)removePhysicalPages:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"physicalPages" withSetMutation:2 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"physicalPages"];
  [v4 minusSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"physicalPages" withSetMutation:2 usingObjects:v5];
}

- (BOOL)hasPhysicalPages
{
  id v2 = [(AEBookInfo *)self physicalPages];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)physicalPageMap
{
  if ([(AEBookInfo *)self hasPhysicalPages])
  {
    BOOL v3 = +[NSPredicate predicateWithFormat:@"bookInfo == %@", self];
    id v4 = [(AEBookInfo *)self managedObjectContext];
    id v5 = +[NSArray arrayWithObjects:@"name", @"href", 0];
    id v6 = [v4 copyEntityPropertiesArray:v5 fromEntityName:@"BKPhysicalPage" withPredicate:v3 sortBy:@"absoluteOrder" ascending:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)physicalPageMapForDocument:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AEBookInfo *)self hasPhysicalPages];
  id v6 = 0;
  if (v4 && v5)
  {
    unsigned int v7 = [v4 href];
    id v8 = +[NSPredicate predicateWithFormat:@"baseHref == %@ && bookInfo == %@", v7, self];

    id v9 = [(AEBookInfo *)self managedObjectContext];
    BOOL v10 = +[NSArray arrayWithObjects:@"name", @"href", 0];
    id v6 = [v9 copyEntityPropertiesArray:v10 fromEntityName:@"BKPhysicalPage" withPredicate:v8 sortBy:@"absoluteOrder" ascending:1];
  }

  return v6;
}

- (id)navigationInfosForDocument:(id)a3
{
  if (a3)
  {
    id v4 = [a3 href];
    unsigned int v5 = +[NSPredicate predicateWithFormat:@"baseHref == %@ && bookInfo == %@", v4, self];

    id v6 = [(AEBookInfo *)self managedObjectContext];
    unsigned int v7 = +[NSArray arrayWithObjects:@"name", @"href", 0];
    id v8 = [v6 copyEntityPropertiesArray:v7 fromEntityName:@"BKNavigationInfo" withPredicate:v5 sortBy:@"absoluteOrder" ascending:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)addSinfInfoObject:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:v4, 0];
  [(AEBookInfo *)self willChangeValueForKey:@"sinfInfo" withSetMutation:1 usingObjects:v6];
  unsigned int v5 = [(AEBookInfo *)self primitiveValueForKey:@"sinfInfo"];
  [v5 addObject:v4];

  [(AEBookInfo *)self didChangeValueForKey:@"sinfInfo" withSetMutation:1 usingObjects:v6];
}

- (void)removeSinfInfo:(id)a3
{
  id v5 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"sinfInfo" withSetMutation:2 usingObjects:v5];
  id v4 = [(AEBookInfo *)self primitiveValueForKey:@"sinfInfo"];
  [v4 minusSet:v5];

  [(AEBookInfo *)self didChangeValueForKey:@"sinfInfo" withSetMutation:2 usingObjects:v5];
}

- (BOOL)suppressTOC
{
  id v2 = [(AEBookInfo *)self chapters];
  BOOL v3 = (unint64_t)[v2 count] < 2;

  return v3;
}

- (BOOL)needsReparsing
{
  BOOL v3 = [(AEBookInfo *)self parseDate];
  BOOL v4 = v3 == 0;

  if (!v3)
  {
    id v5 = _ITEpubParsingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(AEBookInfo *)self assetLogID];
      unsigned int v7 = [(AEBookInfo *)self assetID];
      int v20 = 138543618;
      id v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "\"We've never parsed %{public}@ - %@\"", (uint8_t *)&v20, 0x16u);
    }
  }
  uint64_t v8 = [(AEBookInfo *)self updateDate];
  if (v8)
  {
    id v9 = (void *)v8;
    BOOL v10 = [(AEBookInfo *)self parseDate];

    if (v10)
    {
      id v11 = [(AEBookInfo *)self updateDate];
      id v12 = [(AEBookInfo *)self parseDate];
      id v13 = (char *)[v11 compare:v12];

      if (v13 == (unsigned char *)&dword_0 + 1)
      {
        __int16 v14 = _ITEpubParsingLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          unsigned int v15 = [(AEBookInfo *)self updateDate];
          __int16 v16 = [(AEBookInfo *)self parseDate];
          id v17 = [(AEBookInfo *)self assetLogID];
          id v18 = [(AEBookInfo *)self assetID];
          int v20 = 138544130;
          id v21 = v15;
          __int16 v22 = 2114;
          uint64_t v23 = v16;
          __int16 v24 = 2114;
          id v25 = v17;
          __int16 v26 = 2112;
          unsigned int v27 = v18;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "\"UpdateDate: %{public}@ parseDate: %{public}@ -- %{public}@ - %@\"", (uint8_t *)&v20, 0x2Au);
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

- (BOOL)wantsJumpBackHistory
{
  if ([(AEBookInfo *)self contentType]) {
    return 0;
  }
  else {
    return ![(AEBookInfo *)self isFixedLayout];
  }
}

- (void)_setBitMask:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v8 = (unint64_t)[v7 longLongValue];

  if (v4) {
    unint64_t v9 = v8 | a3;
  }
  else {
    unint64_t v9 = v8 & ~a3;
  }
  id v10 = [objc_alloc((Class)NSNumber) initWithLongLong:v9];
  [(AEBookInfo *)self setAppleDisplayOptions:v10];
}

- (BOOL)isPageProgressionRTL
{
  return [(AEBookInfo *)self bkPageProgressionDirection] == 1;
}

- (int64_t)writingDirection
{
  BOOL v3 = [(AEBookInfo *)self bookLanguage];
  if (v3)
  {

LABEL_3:
    BOOL v4 = [(AEBookInfo *)self bookLanguage];
    NSWritingDirection v5 = +[NSParagraphStyle defaultWritingDirectionForLanguage:v4];

    return v5;
  }
  unsigned int v7 = [(AEBookInfo *)self pageProgressionDirection];

  if (!v7) {
    goto LABEL_3;
  }
  return [(AEBookInfo *)self isPageProgressionRTL];
}

- (BOOL)isScrollModeDisabled
{
  return 0;
}

- (int64_t)scrollModeOrientation
{
  uint64_t v3 = [(AEBookInfo *)self scrollDirection];
  BOOL v4 = (void *)v3;
  if (v3) {
    NSWritingDirection v5 = (__CFString *)v3;
  }
  else {
    NSWritingDirection v5 = @"default";
  }
  id v6 = v5;

  if ([(__CFString *)v6 isEqualToString:@"default"])
  {
    if ([(AEBookInfo *)self languageDefaultsToHorizontalTextFlow]
      || ![(AEBookInfo *)self isPageProgressionRTL])
    {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v7 = 0;
    goto LABEL_10;
  }
  if ([(__CFString *)v6 isEqualToString:@"horizontal"]) {
    goto LABEL_9;
  }
LABEL_7:
  int64_t v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)hasBuiltInFonts
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 6) & 1;

  return v3;
}

- (void)setHasBuiltInFonts:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AEBookInfo *)self hasBuiltInFonts] != a3)
  {
    [(AEBookInfo *)self _setBitMask:64 enabled:v3];
    [(AEBookInfo *)self setUseGlobalContentStyle:&__kCFBooleanFalse];
  }
}

- (BOOL)isFixedLayout
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  BOOL v3 = [v2 longLongValue] & 1;

  return v3;
}

- (void)setFixedLayout:(BOOL)a3
{
}

- (BOOL)isInteractive
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 8) & 1;

  return v3;
}

- (void)setInteractive:(BOOL)a3
{
}

- (int)openToSpread
{
  unint64_t v3 = [(AEBookInfo *)self appleDisplayOptions];
  unsigned __int8 v4 = [v3 longLongValue];

  if ((v4 & 0x20) != 0)
  {
    id v6 = [(AEBookInfo *)self appleDisplayOptions];
    unint64_t v7 = (unint64_t)[v6 longLongValue];

    return (v7 >> 4) & 1;
  }
  else
  {
    LODWORD(v5) = -1;
  }
  return v5;
}

- (void)setOpenToSpread:(int)a3
{
  if (*(void *)&a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(AEBookInfo *)self _setBitMask:32 enabled:0];
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    [(AEBookInfo *)self _setBitMask:32 enabled:1];
    BOOL v4 = v5 == 1;
  }

  [(AEBookInfo *)self _setBitMask:16 enabled:v4];
}

- (BOOL)obeyPageBreaks
{
  unint64_t v3 = [(AEBookInfo *)self appleDisplayOptions];
  if (([v3 longLongValue] & 2) != 0) {
    LOBYTE(v4) = 1;
  }
  else {
    unsigned int v4 = ![(AEBookInfo *)self isStoreBook];
  }

  return v4;
}

- (void)setObeyPageBreaks:(BOOL)a3
{
}

- (int)orientationLock
{
  unsigned int v3 = [(AEBookInfo *)self isPortraitProhibited];
  unsigned int v4 = v3 ^ [(AEBookInfo *)self isLandscapeProhibited];
  if (v3) {
    int v5 = 2;
  }
  else {
    int v5 = 1;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isPortraitProhibited
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 2) & 1;

  return v3;
}

- (void)setPortraitProhibited:(BOOL)a3
{
}

- (BOOL)isLandscapeProhibited
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 3) & 1;

  return v3;
}

- (void)setLandscapeProhibited:(BOOL)a3
{
}

- (BOOL)hidesSpine
{
  id v2 = [(AEBookInfo *)self appleDisplayOptions];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 7) & 1;

  return v3;
}

- (void)setHidesSpine:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AEBookInfo *)self hidesSpine] != a3)
  {
    [(AEBookInfo *)self _setBitMask:128 enabled:v3];
  }
}

- (BOOL)visibleSpine
{
  return 0;
}

- (id)assetType
{
  unsigned int v3 = [(AEBookInfo *)self contentType];
  if (v3 == 3)
  {
    unsigned int v4 = [(AEBookInfo *)self aeAssetType];
  }
  else if (v3 == 2)
  {
    unsigned int v4 = @"application/pdf";
  }
  else if (v3)
  {
    unsigned int v4 = &stru_1DF0D8;
  }
  else if ([(AEBookInfo *)self isFixedLayout])
  {
    unsigned int v4 = @"application/ePubPictureBook";
  }
  else
  {
    unsigned int v4 = @"application/ePub";
  }

  return v4;
}

- (id)url
{
  [(AEBookInfo *)self _cacheURL];
  url = self->_url;

  return url;
}

- (void)_cacheURL
{
  if (!self->_url)
  {
    id obj = self;
    objc_sync_enter(obj);
    if (!self->_url)
    {
      unsigned int v3 = [(AEBookInfo *)obj bookBundlePath];

      if (v3)
      {
        id v4 = objc_alloc((Class)NSURL);
        int v5 = [(AEBookInfo *)obj bookBundlePath];
        id v6 = (NSURL *)[v4 initFileURLWithPath:v5];
        url = self->_url;
        self->_url = v6;
      }
    }
    objc_sync_exit(obj);
  }
}

- (void)setBookBundlePath:(id)a3
{
  id v4 = a3;
  [(AEBookInfo *)self willChangeValueForKey:@"bookBundlePath"];
  url = self->_url;
  self->_url = 0;

  [(AEBookInfo *)self setPrimitiveValue:v4 forKey:@"bookBundlePath"];

  [(AEBookInfo *)self didChangeValueForKey:@"bookBundlePath"];
}

- (id)dictionaryRepresentation
{
  unsigned int v3 = [(AEBookInfo *)self entity];
  id v4 = [v3 attributesByName];
  int v5 = [v4 allKeys];

  id v6 = [(AEBookInfo *)self dictionaryWithValuesForKeys:v5];

  return v6;
}

- (void)_setValidMediaOverlayElementCount:(int64_t)a3
{
  self->_mediaOverlayElementCount = a3;
  self->_mediaOverlayElementCountValid = 1;
}

- (BOOL)hasMediaOverlayElements
{
  if (!self->_mediaOverlayElementCountValid)
  {
    unsigned int v3 = [(AEBookInfo *)self databaseKey];
    id v4 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND mediaOverlayHref != NULL", v3];

    int v5 = [(AEBookInfo *)self managedObjectContext];
    id v6 = [v5 countEntity:@"BKDocument" withPredicate:v4];

    [(AEBookInfo *)self _setValidMediaOverlayElementCount:v6];
  }
  return self->_mediaOverlayElementCount > 0;
}

- (void)saveAnnotationsManagedObjectContext
{
  [(AEBookInfo *)self _cacheURL];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D6104;
  block[3] = &unk_1DAB88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  p_shouldDisableOptimizeSpeed = &self->_shouldDisableOptimizeSpeed;
  shouldDisableOptimizeSpeed = self->_shouldDisableOptimizeSpeed;
  if (!shouldDisableOptimizeSpeed)
  {
    id v4 = [(AEBookInfo *)self bookBundlePath];
    int v5 = [v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

    if (v5)
    {
      id v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];
      unint64_t v7 = v6;
      if (v6)
      {
        unint64_t v8 = [v6 objectForKey:@"shouldDisableOptimizeSpeed"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          objc_storeStrong((id *)p_shouldDisableOptimizeSpeed, v8);
        }
      }
      else
      {
        char isKindOfClass = 1;
      }
    }
    else
    {
      char isKindOfClass = 1;
    }
    uint64_t v10 = +[NSNumber numberWithBool:isKindOfClass & 1];
    id v11 = *p_shouldDisableOptimizeSpeed;
    *p_shouldDisableOptimizeSpeed = (NSNumber *)v10;

    shouldDisableOptimizeSpeed = *p_shouldDisableOptimizeSpeed;
  }

  return [(NSNumber *)shouldDisableOptimizeSpeed BOOLValue];
}

- (NSString)assetLogID
{
  return self->assetLogID;
}

- (void)setAssetLogID:(id)a3
{
}

- (NSNumber)isPreorder
{
  return self->isPreorder;
}

- (void)setIsPreorder:(id)a3
{
}

- (void)setAnnotationProvider:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->isPreorder, 0);
  objc_storeStrong((id *)&self->assetLogID, 0);
  objc_storeStrong((id *)&self->_shouldDisableOptimizeSpeed, 0);
  objc_storeStrong((id *)&self->_linearOrdinalMap, 0);
  objc_storeStrong((id *)&self->_linearDocuments, 0);
  objc_storeStrong((id *)&self->_sortedDocuments, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_basePlusContentPath, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_baseUrl, 0);
}

- (BEProtocolCacheItem)cacheItem
{
  id v2 = self;
  unsigned int v3 = [(AEBookInfo *)v2 assetID];
  objc_getAssociatedObject(v2, "cacheItem");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)BEProtocolCacheItem);
    [v4 setBookID:v3];
    int v5 = [(AEBookInfo *)v2 basePlusContentPath];
    [v4 setRootPath:v5];

    id v6 = [(AEBookInfo *)v2 bookEpubId];
    [v4 setBookEpubId:v6];

    unint64_t v7 = [(AEBookInfo *)v2 bookEpubIdWithUUIDScheme];
    [v4 setBookEpubIdWithUUIDScheme:v7];

    unint64_t v8 = [(AEBookInfo *)v2 sinfInfo];
    unint64_t v9 = [v8 allObjects];

    if ([v9 count])
    {
      uint64_t v10 = [v9 valueForKey:@"sinfNumber"];
      id v11 = [v9 valueForKey:@"sinfBlob"];
      id v12 = [objc_alloc((Class)NSDictionary) initWithObjects:v11 forKeys:v10];
      [v4 setSinfInfo:v12];
    }
    id v13 = [(AEBookInfo *)v2 databaseKey];
    __int16 v14 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey ==[n] %@", v13];

    id v15 = [objc_alloc((Class)NSArray) initWithObjects:@"mime", @"fileSize", @"sinfNumber", @"compressionAlgorithm", @"encryptionAlgorithm", @"href", 0];
    __int16 v16 = [(AEBookInfo *)v2 managedObjectContext];
    id v17 = [v16 copyEntityPropertiesArray:v15 fromEntityName:@"BKDocument" withPredicate:v14 sortBy:0 ascending:1];

    if ([v17 count])
    {
      id v18 = [v17 valueForKey:@"href"];
      id v19 = [objc_alloc((Class)NSDictionary) initWithObjects:v17 forKeys:v18];
      [v4 setDocuments:v19];
    }
    objc_setAssociatedObject(v2, "cacheItem", v4, (char *)&dword_0 + 1);
  }

  return (BEProtocolCacheItem *)v4;
}

- (BKStyleManager)styleManager
{
  unsigned int v3 = objc_getAssociatedObject(self, "styleManager");
  if (!v3)
  {
    id v4 = [(AEBookInfo *)self bookLanguage];
    unsigned int v3 = +[BKStyleManager styleManagerWithLanguage:v4];

    objc_setAssociatedObject(self, "styleManager", v3, (char *)&dword_0 + 1);
  }

  return (BKStyleManager *)v3;
}

+ (id)storeURLForBookStoreId:(id)a3 isAudiobook:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 longLongValue])
  {
    id v6 = +[AEUserPublishing sharedInstance];
    unint64_t v7 = [v6 storeURLForStoreId:v5 dataSource:0];
    unint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      CFStringRef v10 = @"book";
      if (v4) {
        CFStringRef v10 = @"audiobook";
      }
      id v11 = +[NSString stringWithFormat:@"https://books.apple.com/%@/id%@", v10, v5];
      id v9 = [objc_alloc((Class)NSURL) initWithString:v11];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int)bkPageProgressionDirection
{
  id v2 = [(AEBookInfo *)self pageProgressionDirection];
  int v3 = [v2 isEqualToString:AEHelperStringMetadataPageProgressionRightToLeftValue];

  return v3;
}

- (BOOL)languageDefaultsToHorizontalTextFlow
{
  id v2 = [(AEBookInfo *)self bookLanguage];
  unsigned __int8 v3 = +[IMLanguageUtilities languageDefaultsToHorizontalOrientation:v2];

  return v3;
}

- (int)languageDefaultPageProgressDirection
{
  id v2 = [(AEBookInfo *)self bookLanguage];
  unsigned int v3 = +[IMLanguageUtilities languageDefaultsToPageProgressLeftToRight:v2] ^ 1;

  return v3;
}

- (BEBookViewModel)epub
{
  id v2 = self;
  id v3 = AEBookInfo.epub.getter();

  return (BEBookViewModel *)v3;
}

@end