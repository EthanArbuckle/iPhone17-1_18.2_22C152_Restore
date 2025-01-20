@interface CRLBasicShapeLibrary
+ (id)sharedLibrary;
- (BOOL)showConnectionLinesInLibrary;
- (BOOL)showLinesInLibrary;
- (CRLBasicShapeLibrary)initWithLocale:(id)a3;
- (CRLLocale)locale;
- (CRLShapeSearchIndex)p_searchIndex;
- (NSString)name;
- (id)basicShapeAtIndex:(unint64_t)a3;
- (id)p_baseName;
- (id)resultsForSearchTerm:(id)a3;
- (id)shapeFromSearchResult:(id)a3;
- (int64_t)p_shapeTypeAtIndex:(unint64_t)a3;
- (unint64_t)numberOfBasicShapes;
- (void)p_updateSearchIndex:(id)a3;
- (void)setP_searchIndex:(id)a3;
- (void)setShowConnectionLinesInLibrary:(BOOL)a3;
- (void)setShowLinesInLibrary:(BOOL)a3;
@end

@implementation CRLBasicShapeLibrary

+ (id)sharedLibrary
{
  if (qword_1016A9110 != -1) {
    dispatch_once(&qword_1016A9110, &stru_1014D7398);
  }
  v2 = (void *)qword_1016A9108;

  return v2;
}

- (CRLBasicShapeLibrary)initWithLocale:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLBasicShapeLibrary;
  v6 = [(CRLBasicShapeLibrary *)&v11 init];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_showConnectionLinesInLibrary = 257;
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = [[CRLShapeSearchIndex alloc] initWithLocale:v5];
    searchIndex = v7->_searchIndex;
    v7->_searchIndex = v8;

    [(CRLBasicShapeLibrary *)v7 p_updateSearchIndex:v7->_searchIndex];
  }

  return v7;
}

- (NSString)name
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Basic" value:0 table:0];

  return (NSString *)v3;
}

- (unint64_t)numberOfBasicShapes
{
  if (!self->_showLinesInLibrary) {
    return 12;
  }
  if (self->_showConnectionLinesInLibrary) {
    return 15;
  }
  return 14;
}

- (id)basicShapeAtIndex:(unint64_t)a3
{
  v3 = -[CRLBasicShapeLibraryShape initWithShapeType:position:]([CRLBasicShapeLibraryShape alloc], "initWithShapeType:position:", -[CRLBasicShapeLibrary p_shapeTypeAtIndex:](self, "p_shapeTypeAtIndex:"), a3);

  return v3;
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBasicShapeLibrary *)self p_searchIndex];
  v6 = [v5 resultsForSearchTerm:v4];

  return v6;
}

- (id)shapeFromSearchResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  v6 = -[CRLBasicShapeLibrary basicShapeAtIndex:](self, "basicShapeAtIndex:", [v5 unsignedIntegerValue]);

  if (!v6)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D73B8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107ACC0((uint64_t)v4, v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D73D8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary shapeFromSearchResult:]");
    objc_super v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 83, 0, "Basic shape from result is nil: %@", v4 file lineNumber isFatal description];
  }

  return v6;
}

- (id)p_baseName
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Basic" value:0 table:0 localization:@"en"];

  id v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D73F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107AD7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7418);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary p_baseName]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 95, 0, "invalid nil value for '%{public}s'", "englishString");

    id v4 = @"Basic";
  }
  v8 = v4;

  return v8;
}

- (int64_t)p_shapeTypeAtIndex:(unint64_t)a3
{
  if (a3 >= 0x15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7438);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107AE2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7458);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary p_shapeTypeAtIndex:]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 101, 0, "Index for shape type is %lu, but must be less than kCRLShapeTypeCustom (%ld)", a3, 21);
  }
  unint64_t v8 = a3;
  if (a3 <= 2) {
    unint64_t v8 = qword_1011754F8[a3];
  }
  if (!self->_showLinesInLibrary) {
    return a3 + 3;
  }
  if (!self->_showConnectionLinesInLibrary && a3 > 1) {
    return a3 + 1;
  }
  else {
    return v8;
  }
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
  self->_showConnectionLinesInLibrary = a3;
  id v4 = [[CRLShapeSearchIndex alloc] initWithLocale:self->_locale];
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  v6 = self->_searchIndex;

  [(CRLBasicShapeLibrary *)self p_updateSearchIndex:v6];
}

- (BOOL)showConnectionLinesInLibrary
{
  return self->_showConnectionLinesInLibrary;
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  self->_showLinesInLibrary = a3;
  id v4 = [[CRLShapeSearchIndex alloc] initWithLocale:self->_locale];
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  v6 = self->_searchIndex;

  [(CRLBasicShapeLibrary *)self p_updateSearchIndex:v6];
}

- (BOOL)showLinesInLibrary
{
  return self->_showLinesInLibrary;
}

- (void)p_updateSearchIndex:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLBasicShapeLibrary *)self numberOfBasicShapes];
  v33 = self;
  v6 = [(CRLBasicShapeLibrary *)self locale];
  unsigned int v31 = +[CRLShapeLibraryHelper shouldAddBaseShapeNameAndKeywordsForLocale:v6];

  unint64_t v32 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      unint64_t v8 = [(CRLBasicShapeLibrary *)v33 basicShapeAtIndex:v7];
      v9 = +[NSNumber numberWithUnsignedInteger:v7];
      v10 = [v8 name];
      [v4 addSearchResultWithIdentifier:v9 forKeyword:v10 priority:3];

      objc_super v11 = +[NSNumber numberWithUnsignedInteger:v7];
      v12 = [(CRLBasicShapeLibrary *)v33 name];
      [v4 addSearchResultWithIdentifier:v11 forKeyword:v12 priority:2];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v13 = [v8 keywords];
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v39;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            v19 = +[NSNumber numberWithUnsignedInteger:v7];
            [v4 addSearchResultWithIdentifier:v19 forKeyword:v18 priority:2];
          }
          id v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v15);
      }

      if (v31)
      {
        v20 = +[NSNumber numberWithUnsignedInteger:v7];
        v21 = [v8 baseName];
        [v4 addSearchResultWithIdentifier:v20 forKeyword:v21 priority:1];

        v22 = +[NSNumber numberWithUnsignedInteger:v7];
        v23 = [(CRLBasicShapeLibrary *)v33 p_baseName];
        [v4 addSearchResultWithIdentifier:v22 forKeyword:v23 priority:0];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v24 = [v8 baseKeywords];
        id v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v35;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v35 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
              v30 = +[NSNumber numberWithUnsignedInteger:v7];
              [v4 addSearchResultWithIdentifier:v30 forKeyword:v29 priority:0];
            }
            id v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v26);
        }
      }
      ++v7;
    }
    while (v7 != v32);
  }
}

- (CRLLocale)locale
{
  return self->_locale;
}

- (CRLShapeSearchIndex)p_searchIndex
{
  return self->_searchIndex;
}

- (void)setP_searchIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndex, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end