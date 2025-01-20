@interface CRLShapeSearchResultsCollection
- (BOOL)hasExactMatches;
- (BOOL)p_hasPartialMatches;
- (BOOL)p_updateSearchResultsForSearchTerm:(id)a3;
- (CRLBasicShapeLibrary)p_basicShapeLibrary;
- (CRLLocale)p_locale;
- (CRLShapeCollectionShape)p_allShapes;
- (CRLShapeCollectionShape)p_exactMatches;
- (CRLShapeCollectionShape)p_partialMatches;
- (CRLShapeLibrary)p_shapeLibrary;
- (CRLShapeSearchResultsCollection)initWithBasicShapeLibrary:(id)a3 searchTerm:(id)a4;
- (CRLShapeSearchResultsCollection)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4 searchTerm:(id)a5;
- (NSMapTable)p_shapeToDisplayNameMap;
- (NSString)name;
- (NSString)searchTerm;
- (id)displayNameForShape:(id)a3;
- (id)indexPathOfShape:(id)a3;
- (id)p_comparatorForSortingMatches;
- (id)p_separateExactAndPartialMatchesFromResults:(id)a3 searchTerm:(id)a4 withProvider:(id)a5 shapeToDisplayNameDict:(id)a6;
- (id)p_shapesByMappingSearchResults:(id)a3 withProvider:(id)a4 shapeToDisplayNameDict:(id)a5;
- (id)shapeAtIndex:(unint64_t)a3;
- (id)shapeAtIndexPath:(id)a3;
- (id)shapeWithIdentifier:(id)a3;
- (int64_t)p_comparePositionOfShape:(id)a3 withOtherShape:(id)a4;
- (int64_t)p_sequentialShapePosition:(id)a3;
- (unint64_t)exactMatchCount;
- (unint64_t)numberOfSections;
- (unint64_t)numberOfShapes;
- (unint64_t)numberOfShapesInSection:(unint64_t)a3;
- (void)resetSearchResults;
- (void)setP_allShapes:(id)a3;
- (void)setP_basicShapeLibrary:(id)a3;
- (void)setP_exactMatches:(id)a3;
- (void)setP_locale:(id)a3;
- (void)setP_partialMatches:(id)a3;
- (void)setP_shapeLibrary:(id)a3;
- (void)setP_shapeToDisplayNameMap:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSearchTerm:(id)a3 completionHandler:(id)a4;
- (void)setSearchTerm:(id)a3 forceUpdate:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation CRLShapeSearchResultsCollection

- (CRLShapeSearchResultsCollection)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4 searchTerm:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 locale];
  v13 = [v10 locale];
  unsigned __int8 v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6188);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC880();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F61A8);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection initWithShapeLibrary:basicShapeLibrary:searchTerm:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:58 isFatal:0 description:"The shape library and basic shape library must be in the same locale."];
  }
  v18 = [(CRLShapeSearchResultsCollection *)self initWithBasicShapeLibrary:v10 searchTerm:v11];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_shapeLibrary, a3);
    [(CRLShapeSearchResultsCollection *)v19 setSearchTerm:v11 completionHandler:0];
  }

  return v19;
}

- (CRLShapeSearchResultsCollection)initWithBasicShapeLibrary:(id)a3 searchTerm:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLShapeSearchResultsCollection;
  id v9 = [(CRLShapeSearchResultsCollection *)&v19 init];
  if (v9)
  {
    id v10 = (NSString *)[v8 copy];
    searchTerm = v9->_searchTerm;
    v9->_searchTerm = v10;

    uint64_t v12 = [v7 locale];
    locale = v9->_locale;
    v9->_locale = (CRLLocale *)v12;

    objc_storeStrong((id *)&v9->_basicShapeLibrary, a3);
    uint64_t v14 = +[NSMapTable strongToStrongObjectsMapTable];
    shapeToDisplayNameMap = v9->_shapeToDisplayNameMap;
    v9->_shapeToDisplayNameMap = (NSMapTable *)v14;

    uint64_t v16 = +[NSArray array];
    allShapes = v9->_allShapes;
    v9->_allShapes = (CRLShapeCollectionShape *)v16;

    [(CRLShapeSearchResultsCollection *)v9 setSearchTerm:v8 completionHandler:0];
  }

  return v9;
}

- (void)setSearchTerm:(id)a3 completionHandler:(id)a4
{
}

- (void)setSearchTerm:(id)a3 forceUpdate:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  unint64_t v14 = (unint64_t)a3;
  id v8 = (void (**)(id, BOOL))a5;
  uint64_t v9 = [(CRLShapeSearchResultsCollection *)self searchTerm];
  if (v14 | v9) {
    unsigned int v10 = [(id)v14 isEqual:v9];
  }
  else {
    unsigned int v10 = 1;
  }

  if (!v10 || v6)
  {
    BOOL v11 = [(CRLShapeSearchResultsCollection *)self p_updateSearchResultsForSearchTerm:v14];
    uint64_t v12 = (NSString *)[(id)v14 copy];
    searchTerm = self->_searchTerm;
    self->_searchTerm = v12;

    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
  v8[2](v8, v11);
LABEL_10:
}

- (void)resetSearchResults
{
  id v3 = [(CRLShapeSearchResultsCollection *)self searchTerm];
  [(CRLShapeSearchResultsCollection *)self p_updateSearchResultsForSearchTerm:v3];
}

- (BOOL)hasExactMatches
{
  return [(CRLShapeSearchResultsCollection *)self exactMatchCount] != 0;
}

- (unint64_t)exactMatchCount
{
  v2 = [(CRLShapeSearchResultsCollection *)self p_exactMatches];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (unint64_t)numberOfShapesInSection:(unint64_t)a3
{
  if ([(CRLShapeSearchResultsCollection *)self numberOfSections] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F61C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC908();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F61E8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection numberOfShapesInSection:]");
    unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 118, 0, "Tried to retrieve the number of shapes in a section (%lu) beyond the size of the number of sections in the search results", a3);

    return 0;
  }
  else
  {
    v5 = [(CRLShapeSearchResultsCollection *)self p_allShapes];
    id v6 = [v5 count];

    return (unint64_t)v6;
  }
}

- (id)shapeAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 indexAtPosition:0];
  id v6 = [v4 indexAtPosition:1];

  unint64_t v7 = [(CRLShapeSearchResultsCollection *)self numberOfShapesInSection:v5];
  if (v5 >= (id)[(CRLShapeSearchResultsCollection *)self numberOfSections]
    || (unint64_t)v6 >= v7)
  {
    if (v7)
    {
      unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6208);
      }
      BOOL v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110658;
        unsigned int v17 = v10;
        __int16 v18 = 2082;
        objc_super v19 = "-[CRLShapeSearchResultsCollection shapeAtIndexPath:]";
        __int16 v20 = 2082;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m";
        __int16 v22 = 1024;
        int v23 = 132;
        __int16 v24 = 2048;
        id v25 = v6;
        __int16 v26 = 2048;
        unint64_t v27 = v7;
        __int16 v28 = 2048;
        id v29 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu, in section: %lu", buf, 0x40u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6228);
      }
      uint64_t v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection shapeAtIndexPath:]");
      unint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 132, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu, in section: %lu", v6, v7, v5);
    }
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = [(CRLShapeSearchResultsCollection *)self p_allShapes];
    uint64_t v9 = [v8 objectAtIndexedSubscript:v6];
  }

  return v9;
}

- (id)indexPathOfShape:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeSearchResultsCollection *)self p_allShapes];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = 0;
  }
  else
  {
    v9[0] = 0;
    v9[1] = v6;
    unint64_t v7 = +[NSIndexPath indexPathWithIndexes:v9 length:2];
  }

  return v7;
}

- (id)displayNameForShape:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeSearchResultsCollection *)self p_shapeToDisplayNameMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSString)name
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Search" value:0 table:0];

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  id v3 = [(CRLShapeSearchResultsCollection *)self p_exactMatches];
  id v4 = (char *)[v3 count];
  id v5 = [(CRLShapeSearchResultsCollection *)self p_partialMatches];
  id v6 = &v4[(void)[v5 count]];

  return (unint64_t)v6;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  id v5 = [(CRLShapeSearchResultsCollection *)self p_allShapes];
  if ((unint64_t)[v5 count] <= a3)
  {
    if ([(CRLShapeSearchResultsCollection *)self numberOfShapes])
    {
      unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6248);
      }
      id v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v13 = v8;
        *(_DWORD *)buf = 67110402;
        unsigned int v15 = v7;
        __int16 v16 = 2082;
        unsigned int v17 = "-[CRLShapeSearchResultsCollection shapeAtIndex:]";
        __int16 v18 = 2082;
        objc_super v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m";
        __int16 v20 = 1024;
        int v21 = 168;
        __int16 v22 = 2048;
        unint64_t v23 = a3;
        __int16 v24 = 2048;
        unint64_t v25 = [(CRLShapeSearchResultsCollection *)self numberOfShapes];
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6268);
      }
      uint64_t v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      unsigned int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection shapeAtIndex:]");
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 168, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu", a3, [(CRLShapeSearchResultsCollection *)self numberOfShapes]);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)shapeWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)p_updateSearchResultsForSearchTerm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
  id v6 = +[NSArray array];
  unsigned int v7 = +[NSArray array];
  id v8 = +[NSArray array];
  uint64_t v9 = +[NSArray array];
  unsigned int v10 = [(CRLShapeSearchResultsCollection *)self p_basicShapeLibrary];
  BOOL v11 = [v10 resultsForSearchTerm:v4];
  uint64_t v12 = [(CRLShapeSearchResultsCollection *)self p_basicShapeLibrary];
  v59 = v4;
  uint64_t obj = v5;
  v13 = [(CRLShapeSearchResultsCollection *)self p_separateExactAndPartialMatchesFromResults:v11 searchTerm:v4 withProvider:v12 shapeToDisplayNameDict:v5];

  if ([v13 count] != (id)4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6288);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACAC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F62A8);
    }
    unint64_t v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    unsigned int v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]");
    __int16 v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:191 isFatal:0 description:"separatedBasicResults must only contain 4 elements."];
  }
  unsigned int v17 = [v13 objectAtIndexedSubscript:0];
  __int16 v18 = [v6 arrayByAddingObjectsFromArray:v17];

  objc_super v19 = [v13 objectAtIndexedSubscript:1];
  __int16 v20 = [v7 arrayByAddingObjectsFromArray:v19];

  int v21 = [v13 objectAtIndexedSubscript:2];
  __int16 v22 = [v8 arrayByAddingObjectsFromArray:v21];

  unint64_t v23 = [v13 objectAtIndexedSubscript:3];
  __int16 v24 = [v9 arrayByAddingObjectsFromArray:v23];

  unint64_t v25 = [(CRLShapeSearchResultsCollection *)self p_shapeLibrary];

  if (v25)
  {
    __int16 v26 = [(CRLShapeSearchResultsCollection *)self p_shapeLibrary];
    unint64_t v27 = [v26 resultsForSearchTerm:v59];
    __int16 v28 = [(CRLShapeSearchResultsCollection *)self p_shapeLibrary];
    id v29 = [(CRLShapeSearchResultsCollection *)self p_separateExactAndPartialMatchesFromResults:v27 searchTerm:v59 withProvider:v28 shapeToDisplayNameDict:obj];

    if ([v29 count] != (id)4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F62C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ACA40();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F62E8);
      }
      v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v30);
      }
      v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]");
      v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:199 isFatal:0 description:"separatedShapeLibraryResults must only contain 4 elements."];
    }
    v33 = [v29 objectAtIndexedSubscript:0];
    uint64_t v34 = [v18 arrayByAddingObjectsFromArray:v33];

    v35 = [v29 objectAtIndexedSubscript:1];
    uint64_t v36 = [v20 arrayByAddingObjectsFromArray:v35];

    v37 = [v29 objectAtIndexedSubscript:2];
    uint64_t v38 = [v22 arrayByAddingObjectsFromArray:v37];

    v39 = [v29 objectAtIndexedSubscript:3];
    uint64_t v40 = [v24 arrayByAddingObjectsFromArray:v39];

    __int16 v24 = (void *)v40;
    __int16 v22 = (void *)v38;
    __int16 v20 = (void *)v36;
    __int16 v18 = (void *)v34;
  }
  v58 = v18;
  uint64_t v41 = [v18 arrayByAddingObjectsFromArray:v20];
  uint64_t v42 = [v22 arrayByAddingObjectsFromArray:v24];
  uint64_t v43 = [(CRLShapeSearchResultsCollection *)self p_exactMatches];
  if (v41 | v43 && ![(id)v41 isEqual:v43])
  {
    HIDWORD(v57) = 1;
  }
  else
  {
    uint64_t v44 = [(CRLShapeSearchResultsCollection *)self p_partialMatches];
    if (v42 | v44 && ![(id)v42 isEqual:v44])
    {
      HIDWORD(v57) = 1;
    }
    else
    {
      uint64_t v45 = [(CRLShapeSearchResultsCollection *)self p_shapeToDisplayNameMap];
      if (obj | v45) {
        HIDWORD(v57) = [(id)obj isEqual:v45] ^ 1;
      }
      else {
        HIDWORD(v57) = 0;
      }
    }
  }

  objc_storeStrong((id *)&self->_shapeToDisplayNameMap, (id)obj);
  v46 = [(CRLShapeSearchResultsCollection *)self p_comparatorForSortingMatches];
  v47 = [(id)v41 sortedArrayUsingComparator:v46];

  v48 = [(CRLShapeSearchResultsCollection *)self p_comparatorForSortingMatches];
  v49 = [(id)v42 sortedArrayUsingComparator:v48];

  objc_storeStrong((id *)&self->_exactMatches, v47);
  objc_storeStrong((id *)&self->_partialMatches, v49);
  v50 = [v47 arrayByAddingObjectsFromArray:v49];
  v51 = v50;
  if (v50)
  {
    v52 = v50;
    allShapes = self->_allShapes;
    self->_allShapes = v52;
  }
  else
  {
    LODWORD(v57) = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6308);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC9B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6328);
    }
    v54 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v54);
    }
    allShapes = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]", v57);
    v55 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
    +[CRLAssertionHandler handleFailureInFunction:allShapes file:v55 lineNumber:228 isFatal:0 description:"allShapes cannot be nil."];
  }
  return BYTE4(v57);
}

- (id)p_separateExactAndPartialMatchesFromResults:(id)a3 searchTerm:(id)a4 withProvider:(id)a5 shapeToDisplayNameDict:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  unint64_t v27 = +[NSMutableArray array];
  __int16 v26 = +[NSMutableArray array];
  BOOL v11 = +[NSMutableArray array];
  unint64_t v25 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        __int16 v18 = [v9 shapeFromSearchResult:v17];
        if (v18)
        {
          if ([v17 priority] && objc_msgSend(v17, "priority") != (id)1)
          {
            uint64_t v19 = [v17 matchingKeyword];
          }
          else
          {
            uint64_t v19 = [v18 name];
          }
          __int16 v20 = (void *)v19;
          [v10 setObject:v19 forKey:v18];

          LODWORD(v20) = [v17 isExactMatch];
          id v21 = [v17 priority];
          if (v20)
          {
            __int16 v22 = v27;
            if (v21 != (id)3)
            {
              if ([v17 priority] == (id)1) {
                __int16 v22 = v27;
              }
              else {
                __int16 v22 = v26;
              }
            }
          }
          else
          {
            __int16 v22 = v11;
            if (v21 != (id)3)
            {
              if ([v17 priority] == (id)1) {
                __int16 v22 = v11;
              }
              else {
                __int16 v22 = v25;
              }
            }
          }
          [v22 addObject:v18];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v14);
  }

  v32[0] = v27;
  v32[1] = v26;
  v32[2] = v11;
  v32[3] = v25;
  unint64_t v23 = +[NSArray arrayWithObjects:v32 count:4];

  return v23;
}

- (id)p_shapesByMappingSearchResults:(id)a3 withProvider:(id)a4 shapeToDisplayNameDict:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003D4454;
  v12[3] = &unk_1014F6350;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = [a3 crl_arrayByMappingObjectsUsingBlock:v12];

  return v10;
}

- (id)p_comparatorForSortingMatches
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D4694;
  v4[3] = &unk_1014F6378;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (int64_t)p_sequentialShapePosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);
  if (v6)
  {
    unsigned int v7 = [(CRLShapeSearchResultsCollection *)self p_shapeLibrary];

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      id v8 = v6;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6398);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ACB50();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F63B8);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_sequentialShapePosition:]");
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 316, 0, "invalid nil value for '%{public}s'", "self.p_shapeLibrary");

      id v6 = v8;
    }
    id v31 = v4;
    id v12 = [(CRLShapeSearchResultsCollection *)self p_shapeLibrary];
    uint64_t v34 = [v12 categories];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v30 = v6;
    id obj = [v6 categoryIDs];
    id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v35)
    {
      uint64_t v36 = 0;
      uint64_t v33 = *(void *)v44;
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v16 = v34;
          unsigned int v17 = (char *)[v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v17)
          {
            __int16 v18 = v17;
            v37 = i;
            uint64_t v19 = 0;
            uint64_t v20 = *(void *)v40;
            do
            {
              id v21 = 0;
              uint64_t v38 = &v18[(void)v19];
              do
              {
                if (*(void *)v40 != v20) {
                  objc_enumerationMutation(v16);
                }
                __int16 v22 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v21) categoryID];
                unsigned int v23 = [v15 isEqual:v22];

                if (v23) {
                  BOOL v24 = &v21[(void)v19] >= (char *)v13;
                }
                else {
                  BOOL v24 = 1;
                }
                if (!v24)
                {
                  id v25 = v15;

                  unint64_t v13 = (unint64_t)&v21[(void)v19];
                  uint64_t v36 = v25;
                  goto LABEL_29;
                }
                ++v21;
              }
              while (v18 != v21);
              __int16 v18 = (char *)[v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
              uint64_t v19 = v38;
            }
            while (v18);
LABEL_29:
            i = v37;
          }
        }
        id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v35);
    }
    else
    {
      uint64_t v36 = 0;
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    uint64_t v27 = (v13 << 16) + 0x10000;
    id v6 = v30;
    id v4 = v31;
    __int16 v26 = v36;
  }
  else
  {
    __int16 v26 = 0;
    uint64_t v27 = 0;
  }
  id v28 = [v4 positionInCategoryWithID:v26];

  return (int64_t)v28 + v27;
}

- (int64_t)p_comparePositionOfShape:(id)a3 withOtherShape:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 != objc_opt_class()) {
    goto LABEL_17;
  }
  if (v8 == objc_opt_class())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v11 = [v6 categoryIDs];
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v17 = [v7 positionInCategoryWithID:v16];
          if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v18 = (unint64_t)v17;
            unint64_t v9 = (unint64_t)[v6 positionInCategoryWithID:v16];
            unint64_t v10 = v18;
            goto LABEL_15;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
  }
  else
  {
    unint64_t v9 = (unint64_t)[v6 positionInCategoryWithID:0];
    unint64_t v10 = (unint64_t)[v7 positionInCategoryWithID:0];
  }
  if (v9 == v10)
  {
LABEL_17:
    unint64_t v9 = [(CRLShapeSearchResultsCollection *)self p_sequentialShapePosition:v6];
    unint64_t v10 = [(CRLShapeSearchResultsCollection *)self p_sequentialShapePosition:v7];
  }
  if (v9 >= v10)
  {
    if (v9 > v10)
    {
      int64_t v19 = 1;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F63D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ACC00();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F63F8);
      }
      uint64_t v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_comparePositionOfShape:withOtherShape:]");
      __int16 v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:376 isFatal:0 description:"Comparison of shape position must return either ascending or descending."];

      int64_t v19 = 0;
    }
  }
  else
  {
    int64_t v19 = -1;
  }

  return v19;
}

- (BOOL)p_hasPartialMatches
{
  v2 = [(CRLShapeSearchResultsCollection *)self p_partialMatches];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (CRLBasicShapeLibrary)p_basicShapeLibrary
{
  return self->_basicShapeLibrary;
}

- (void)setP_basicShapeLibrary:(id)a3
{
}

- (CRLShapeLibrary)p_shapeLibrary
{
  return self->_shapeLibrary;
}

- (void)setP_shapeLibrary:(id)a3
{
}

- (CRLShapeCollectionShape)p_exactMatches
{
  return self->_exactMatches;
}

- (void)setP_exactMatches:(id)a3
{
}

- (CRLShapeCollectionShape)p_partialMatches
{
  return self->_partialMatches;
}

- (void)setP_partialMatches:(id)a3
{
}

- (CRLShapeCollectionShape)p_allShapes
{
  return self->_allShapes;
}

- (void)setP_allShapes:(id)a3
{
}

- (CRLLocale)p_locale
{
  return self->_locale;
}

- (void)setP_locale:(id)a3
{
}

- (NSMapTable)p_shapeToDisplayNameMap
{
  return self->_shapeToDisplayNameMap;
}

- (void)setP_shapeToDisplayNameMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeToDisplayNameMap, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_allShapes, 0);
  objc_storeStrong((id *)&self->_partialMatches, 0);
  objc_storeStrong((id *)&self->_exactMatches, 0);
  objc_storeStrong((id *)&self->_shapeLibrary, 0);
  objc_storeStrong((id *)&self->_basicShapeLibrary, 0);

  objc_storeStrong((id *)&self->_searchTerm, 0);
}

@end