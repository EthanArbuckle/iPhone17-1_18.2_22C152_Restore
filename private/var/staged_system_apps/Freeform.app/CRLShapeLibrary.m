@interface CRLShapeLibrary
+ (CRLShapeLibrary)sharedLibrary;
+ (void)loadDataIfNeededWithCompletion:(id)a3;
- (CRLLocale)locale;
- (CRLShapeLibrary)initWithShapeLibraryURL:(id)a3 categorySortURL:(id)a4 locale:(id)a5;
- (CRLShapeSearchIndex)p_searchIndex;
- (NSArray)categories;
- (NSArray)p_categorySort;
- (NSCache)p_shapeCache;
- (NSDictionary)p_library;
- (NSSet)p_shapeIDsToRemove;
- (NSURL)p_libraryURL;
- (id)p_keywordDelimiterFromLibrary:(id)a3;
- (id)p_libraryByRemovingDenyListedShapes:(id)a3;
- (id)p_parseLibraryFromJSON;
- (id)p_shapeDictionariesByID;
- (id)p_shapeDictionariesByIDFromLibrary:(id)a3;
- (id)p_shapeIDByLocalizationKeyFromLibrary:(id)a3;
- (id)p_sortedCategoriesFromLibrary:(id)a3;
- (id)resultsForSearchTerm:(id)a3;
- (id)shapeFromSearchResult:(id)a3;
- (id)shapeWithID:(id)a3;
- (id)shapeWithLocalizationKey:(id)a3;
- (int64_t)dataLoadStatus;
- (int64_t)p_searchIndexStatus;
- (int64_t)p_setupLibrary;
- (void)p_cacheDataAfterParsingWithSearchIndex:(id)a3;
- (void)p_createSearchIndexWithCompletionHandler:(id)a3;
- (void)p_loadCategoriesAndSearchIndexIfNeeded;
- (void)p_loadDataWithCompletion:(id)a3;
- (void)p_setupLibraryIfNeeded;
- (void)setDataLoadStatus:(int64_t)a3;
- (void)setP_categorySort:(id)a3;
- (void)setP_library:(id)a3;
- (void)setP_libraryURL:(id)a3;
- (void)setP_searchIndex:(id)a3;
- (void)setP_searchIndexStatus:(int64_t)a3;
- (void)setP_shapeCache:(id)a3;
@end

@implementation CRLShapeLibrary

+ (CRLShapeLibrary)sharedLibrary
{
  if (qword_1016A8F08 != -1) {
    dispatch_once(&qword_1016A8F08, &stru_1014CE448);
  }
  v2 = (void *)qword_1016A8F00;

  return (CRLShapeLibrary *)v2;
}

+ (void)loadDataIfNeededWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[CRLShapeLibrary sharedLibrary];
  [v4 p_loadDataWithCompletion:v3];
}

- (CRLShapeLibrary)initWithShapeLibraryURL:(id)a3 categorySortURL:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CRLShapeLibrary;
  v12 = [(CRLShapeLibrary *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_libraryURL, a3);
    if (!v13->_libraryURL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE468);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106B4A4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE488);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary initWithShapeLibraryURL:categorySortURL:locale:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 86, 0, "Invalid parameter not satisfying: %{public}s", "_libraryURL != nil");
    }
    v17 = +[NSDictionary dictionaryWithContentsOfURL:v10];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"CRLShapeLibraryCategorySort"];
    categorySort = v13->_categorySort;
    v13->_categorySort = (NSArray *)v18;

    if (!v13->_categorySort)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE4A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106B408();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE4C8);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary initWithShapeLibraryURL:categorySortURL:locale:]");
      v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 89, 0, "Invalid parameter not satisfying: %{public}s", "_categorySort != nil");
    }
    v23 = +[CRLRemoteDefaults sharedDefaults];
    v24 = [v23 arrayForKey:@"CRLShapeLibraryRemovedShapeIDs"];

    uint64_t v25 = +[NSSet setWithArray:v24];
    shapeIDsToRemove = v13->_shapeIDsToRemove;
    v13->_shapeIDsToRemove = (NSSet *)v25;

    v27 = (NSCache *)objc_alloc_init((Class)NSCache);
    shapeCache = v13->_shapeCache;
    v13->_shapeCache = v27;

    objc_storeStrong((id *)&v13->_locale, a5);
  }

  return v13;
}

- (NSArray)categories
{
  [(CRLShapeLibrary *)self p_loadCategoriesAndSearchIndexIfNeeded];
  categories = self->_categories;

  return categories;
}

- (void)setDataLoadStatus:(int64_t)a3
{
  if (self->_dataLoadStatus != a3)
  {
    self->_dataLoadStatus = a3;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      CFStringRef v7 = @"CRLShapeLibraryLoadingDidFinishNotificationStatusKey";
      id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
      v8 = v4;
      v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

      v6 = +[NSNotificationCenter defaultCenter];
      [v6 postNotificationName:@"CRLShapeLibraryLoadingDidFinishNotification" object:self userInfo:v5];
    }
  }
}

- (id)shapeWithID:(id)a3
{
  id v4 = a3;
  [(CRLShapeLibrary *)self p_setupLibraryIfNeeded];
  if (self->_dataLoadStatus == 3)
  {
    v5 = 0;
  }
  else
  {
    v6 = [v4 stringValue];
    CFStringRef v7 = [(CRLShapeLibrary *)self p_shapeCache];
    v5 = [v7 objectForKey:v6];

    if (!v5)
    {
      v8 = [(CRLShapeLibrary *)self p_shapeDictionariesByID];
      id v9 = [v8 objectForKeyedSubscript:v6];
      if (v9)
      {
        id v10 = [CRLShapeLibraryShape alloc];
        id v11 = [(CRLShapeLibrary *)self p_library];
        v12 = [(CRLShapeLibrary *)self p_keywordDelimiterFromLibrary:v11];
        v5 = [(CRLShapeLibraryShape *)v10 initWithDictionary:v9 keywordDelimiter:v12];

        v13 = [(CRLShapeLibrary *)self p_shapeCache];
        [v13 setObject:v5 forKey:v6];
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)shapeWithLocalizationKey:(id)a3
{
  id v4 = a3;
  [(CRLShapeLibrary *)self p_setupLibraryIfNeeded];
  if (self->_dataLoadStatus == 3)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(CRLShapeLibrary *)self p_library];
    CFStringRef v7 = [(CRLShapeLibrary *)self p_shapeIDByLocalizationKeyFromLibrary:v6];

    v8 = [v7 objectForKeyedSubscript:v4];
    if (v8)
    {
      v5 = [(CRLShapeLibrary *)self shapeWithID:v8];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4 = a3;
  v5 = [(CRLShapeLibrary *)self p_searchIndex];
  v6 = [v5 resultsForSearchTerm:v4];

  return v6;
}

- (id)shapeFromSearchResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [(CRLShapeLibrary *)self shapeWithID:v5];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE4E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B540();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE508);
    }
    CFStringRef v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary shapeFromSearchResult:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 163, 0, "Shape library shape from result is nil: %@", v4 file lineNumber isFatal description];
  }

  return v6;
}

- (void)setP_searchIndexStatus:(int64_t)a3
{
  if (self->_searchIndexStatus != a3)
  {
    self->_searchIndexStatus = a3;
    if (a3 == 2)
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 postNotificationName:@"CRLShapeLibraryIndexingDidFinishNotification" object:self];
    }
  }
}

- (void)p_setupLibraryIfNeeded
{
  int64_t dataLoadStatus = self->_dataLoadStatus;
  if (!dataLoadStatus)
  {
    self->_int64_t dataLoadStatus = 1;
    int64_t dataLoadStatus = [(CRLShapeLibrary *)self p_setupLibrary];
  }
  self->_int64_t dataLoadStatus = dataLoadStatus;
}

- (int64_t)p_setupLibrary
{
  id v3 = [(CRLShapeLibrary *)self p_parseLibraryFromJSON];
  library = self->_library;
  self->_library = v3;

  if (!self->_library) {
    return 3;
  }
  -[CRLShapeLibrary p_sortedCategoriesFromLibrary:](self, "p_sortedCategoriesFromLibrary:");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v5;

  if ([(NSArray *)self->_categories count]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)p_loadCategoriesAndSearchIndexIfNeeded
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE528);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B5D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE548);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_loadCategoriesAndSearchIndexIfNeeded]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:203 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLShapeLibrary *)self p_setupLibraryIfNeeded];
  if (self->_dataLoadStatus == 2 && !self->_searchIndexStatus)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100058640;
    v6[3] = &unk_1014CE570;
    v6[4] = self;
    [(CRLShapeLibrary *)self p_createSearchIndexWithCompletionHandler:v6];
  }
}

- (void)p_loadDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, int64_t))a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE590);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B65C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE5B0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_loadDataWithCompletion:]");
    CFStringRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:214 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLShapeLibrary *)self p_setupLibraryIfNeeded];
  v4[2](v4, self->_dataLoadStatus);

  if (self->_dataLoadStatus == 2 && !self->_searchIndexStatus)
  {
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    id v9 = dispatch_queue_create("com.apple.freeform.CRLShapeLibrary", v8);
    [(CRLShapeLibrary *)self setP_searchIndexStatus:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058908;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (void)p_cacheDataAfterParsingWithSearchIndex:(id)a3
{
  id v4 = (CRLShapeSearchIndex *)a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE5D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B6E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE5F0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_cacheDataAfterParsingWithSearchIndex:]");
    CFStringRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:236 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  [(CRLShapeLibrary *)self setP_searchIndexStatus:2];
}

- (void)p_createSearchIndexWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = [CRLShapeSearchIndex alloc];
  v6 = [(CRLShapeLibrary *)self locale];
  CFStringRef v7 = [(CRLShapeSearchIndex *)v5 initWithLocale:v6];

  v8 = [(CRLShapeLibrary *)self p_shapeDictionariesByID];
  id v9 = [(CRLShapeLibrary *)self p_library];
  id v10 = [(CRLShapeLibrary *)self p_keywordDelimiterFromLibrary:v9];

  id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  v12 = [(CRLShapeLibrary *)self locale];
  unsigned __int8 v13 = +[CRLShapeLibraryHelper shouldAddBaseShapeNameAndKeywordsForLocale:v12];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_100058DD8;
  v19 = &unk_1014CE658;
  v20 = self;
  id v21 = v10;
  unsigned __int8 v23 = v13;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v16];
  -[CRLShapeSearchIndex addSearchResults:](v7, "addSearchResults:", v14, v16, v17, v18, v19, v20);
  v4[2](v4, v7);
}

- (id)p_parseLibraryFromJSON
{
  id v3 = [(CRLShapeLibrary *)self p_libraryURL];
  id v4 = +[NSData dataWithContentsOfURL:v3];

  if (!v4)
  {
    int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE678);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B76C(v12, (uint64_t)self, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE698);
    }
    unsigned __int8 v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_parseLibraryFromJSON]");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    id v14 = [(CRLShapeLibrary *)self p_libraryURL];
    +[CRLAssertionHandler handleFailureInFunction:v6, v5, 306, 0, "No data found at search library URL: %@", v14 file lineNumber isFatal description];

    goto LABEL_24;
  }
  id v17 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v17];
  id v6 = v17;
  if (v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE6B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B8CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE6D8);
    }
    CFStringRef v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_parseLibraryFromJSON]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 311, 0, "Error: Could not parse %@ with error: %@", @"shape_library", v6 file lineNumber isFatal description];

    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014CE6F8);
    }
    id v10 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10106B840((uint64_t)v6, v10);
    }
LABEL_24:
    id v15 = 0;
    goto LABEL_26;
  }
  id v15 = [(CRLShapeLibrary *)self p_libraryByRemovingDenyListedShapes:v5];
LABEL_26:

  return v15;
}

- (id)p_sortedCategoriesFromLibrary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"categories"];
  v50 = self;
  v5 = [(CRLShapeLibrary *)self p_categorySort];
  id v6 = [v5 count];
  if (v6 != [v4 count])
  {
    unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE718);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v45 = v8;
      *(_DWORD *)buf = 67110402;
      unsigned int v64 = v7;
      __int16 v65 = 2082;
      v66 = "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]";
      __int16 v67 = 2082;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m";
      __int16 v69 = 1024;
      int v70 = 323;
      __int16 v71 = 2048;
      id v72 = [v5 count];
      __int16 v73 = 2048;
      id v74 = [v4 count];
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The number of categories in the plist (%lu) must equal the number of categories in the shape librarian data (%lu)", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE738);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]");
    int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 323, 0, "The number of categories in the plist (%lu) must equal the number of categories in the shape librarian data (%lu)", [v5 count], [v4 count]);
  }
  v46 = v5;
  v48 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v49 = +[NSMutableSet set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v4;
  id v12 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v58;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(*((void *)&v57 + 1) + 8 * i);
        id v17 = +[NSMutableIndexSet indexSet];
        uint64_t v18 = [v16 objectForKeyedSubscript:@"shapeIDs"];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100059F00;
        v55[3] = &unk_1014CE760;
        v55[4] = v50;
        id v19 = v17;
        id v56 = v19;
        [v18 enumerateObjectsUsingBlock:v55];
        id v20 = [v19 count];
        if (v20 == [v18 count])
        {
          id v21 = [v16 objectForKeyedSubscript:@"localizationKey"];
          [v49 addObject:v21];
        }
        else
        {
          if ([v19 count])
          {
            id v22 = [v18 mutableCopy];
            [v22 removeObjectsAtIndexes:v19];
            id v23 = [v16 mutableCopy];
            [v23 setObject:v22 forKeyedSubscript:@"shapeIDs"];

            id v16 = v23;
          }
          id v21 = [(CRLShapeLibraryObject *)[CRLShapeLibraryCategory alloc] initWithDictionary:v16];
          v24 = [(CRLShapeLibraryCategory *)v21 localizationKey];
          [v48 setObject:v21 forKeyedSubscript:v24];
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v13);
  }

  uint64_t v25 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v26 = v46;
  id v27 = [v26 countByEnumeratingWithState:&v51 objects:v61 count:16];
  v28 = v48;
  if (v27)
  {
    id v29 = v27;
    uint64_t v30 = *(void *)v52;
    do
    {
      v31 = 0;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v31);
        v33 = [v28 objectForKeyedSubscript:v32];
        if (v33)
        {
          [v25 addObject:v33];
        }
        else if (([v49 containsObject:v32] & 1) == 0)
        {
          unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CE780);
          }
          v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v64 = v34;
            __int16 v65 = 2082;
            v66 = "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]";
            __int16 v67 = 2082;
            v68 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m";
            __int16 v69 = 1024;
            int v70 = 366;
            __int16 v71 = 2112;
            id v72 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Found a category localization key in the plist that doesn't exist in the shape librarian data: %@", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CE7A0);
          }
          v36 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v39 = v36;
            v40 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v64 = v34;
            __int16 v65 = 2114;
            v66 = v40;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]");
          v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
          +[CRLAssertionHandler handleFailureInFunction:v37, v38, 366, 0, "Found a category localization key in the plist that doesn't exist in the shape librarian data: %@", v32 file lineNumber isFatal description];

          v28 = v48;
        }

        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v29 = [v26 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v29);
  }

  if (![v25 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE7C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B984();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE7E0);
    }
    v41 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v41);
    }
    v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]");
    v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v42, v43, 370, 0, "Found no categories in the shape librarian data: %@", obj file lineNumber isFatal description];
  }

  return v25;
}

- (CRLShapeSearchIndex)p_searchIndex
{
  [(CRLShapeLibrary *)self p_loadCategoriesAndSearchIndexIfNeeded];
  searchIndex = self->_searchIndex;

  return searchIndex;
}

- (id)p_shapeDictionariesByID
{
  [(CRLShapeLibrary *)self p_setupLibraryIfNeeded];
  if (self->_dataLoadStatus == 3)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(CRLShapeLibrary *)self p_library];
    id v3 = [(CRLShapeLibrary *)self p_shapeDictionariesByIDFromLibrary:v4];
  }

  return v3;
}

- (id)p_keywordDelimiterFromLibrary:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106BAA0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE820);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_keywordDelimiterFromLibrary:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 391, 0, "invalid nil value for '%{public}s'", "library");
  }
  unsigned int v7 = [v3 objectForKeyedSubscript:@"keywordDelimiter"];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE840);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106BA18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE860);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_keywordDelimiterFromLibrary:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:395 isFatal:0 description:"Shape Librarian data file did not have a keywordDelimiter."];
  }

  return v7;
}

- (id)p_shapeDictionariesByIDFromLibrary:(id)a3
{
  return [a3 objectForKeyedSubscript:@"shapesByID"];
}

- (id)p_shapeIDByLocalizationKeyFromLibrary:(id)a3
{
  return [a3 objectForKeyedSubscript:@"shapeIDByLocKey"];
}

- (id)p_libraryByRemovingDenyListedShapes:(id)a3
{
  id v4 = a3;
  v5 = [(CRLShapeLibrary *)self p_shapeDictionariesByIDFromLibrary:v4];
  id v6 = [v5 mutableCopy];

  unsigned int v7 = [(CRLShapeLibrary *)self p_shapeIDByLocalizationKeyFromLibrary:v4];
  id v23 = [v7 mutableCopy];

  id v22 = v4;
  v8 = [(CRLShapeLibrary *)self p_keywordDelimiterFromLibrary:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [(CRLShapeLibrary *)self p_shapeIDsToRemove];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v15 = [v14 stringValue];
        id v16 = [v6 objectForKeyedSubscript:v15];

        if (v16)
        {
          id v17 = [[CRLShapeLibraryShape alloc] initWithDictionary:v16 keywordDelimiter:v8];
          uint64_t v18 = [(CRLShapeLibraryShape *)v17 localizationKey];
          [v23 removeObjectForKey:v18];
        }
        id v19 = [v14 stringValue];
        [v6 removeObjectForKey:v19];
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  id v20 = [v22 mutableCopy];
  [v20 setObject:v6 forKeyedSubscript:@"shapesByID"];
  [v20 setObject:v23 forKeyedSubscript:@"shapeIDByLocKey"];

  return v20;
}

- (int64_t)dataLoadStatus
{
  return self->_dataLoadStatus;
}

- (CRLLocale)locale
{
  return self->_locale;
}

- (NSArray)p_categorySort
{
  return self->_categorySort;
}

- (void)setP_categorySort:(id)a3
{
}

- (int64_t)p_searchIndexStatus
{
  return self->_searchIndexStatus;
}

- (NSDictionary)p_library
{
  return self->_library;
}

- (void)setP_library:(id)a3
{
}

- (NSURL)p_libraryURL
{
  return self->_libraryURL;
}

- (void)setP_libraryURL:(id)a3
{
}

- (void)setP_searchIndex:(id)a3
{
}

- (NSCache)p_shapeCache
{
  return self->_shapeCache;
}

- (void)setP_shapeCache:(id)a3
{
}

- (NSSet)p_shapeIDsToRemove
{
  return self->_shapeIDsToRemove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeIDsToRemove, 0);
  objc_storeStrong((id *)&self->_shapeCache, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_categorySort, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_categories, 0);
}

@end