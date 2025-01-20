@interface CRLShapeSearchIndex
- (CRLLocale)p_locale;
- (CRLShapeSearchIndex)initWithLocale:(id)a3;
- (NSCharacterSet)p_whitespaceCharacterSet;
- (NSDictionary)p_searchIndex;
- (_NSRange)p_rangeOfSearchTerm:(id)a3 inString:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5;
- (id)p_keywords;
- (id)p_permuteStrings:(id)a3;
- (id)p_predicateWithSearchTerm:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4;
- (id)p_resultsDictionaryForSearchTerm:(id)a3 withFilteredKeywords:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5;
- (id)p_resultsForKeyword:(id)a3;
- (id)p_resultsForSearchTermBasedOnAnchoredSearch:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4;
- (id)p_sortedFilteredKeywordsForSearchTerm:(id)a3 usingPredicate:(id)a4;
- (id)resultsForSearchTerm:(id)a3;
- (void)addSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4 priority:(unint64_t)a5;
- (void)addSearchResults:(id)a3;
- (void)p_removeSearchResultWithIdentifier:(id)a3 forTokenizedKeyword:(id)a4;
- (void)p_tokenizeKeywordIfNeeded:(id)a3 yieldingKeyword:(id)a4;
- (void)removeSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4;
- (void)setP_locale:(id)a3;
- (void)setP_searchIndex:(id)a3;
- (void)setP_whitespaceCharacterSet:(id)a3;
@end

@implementation CRLShapeSearchIndex

- (CRLShapeSearchIndex)initWithLocale:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLShapeSearchIndex;
  v6 = [(CRLShapeSearchIndex *)&v12 init];
  if (v6)
  {
    uint64_t v7 = +[NSDictionary dictionary];
    searchIndex = v6->_searchIndex;
    v6->_searchIndex = (NSDictionary *)v7;

    objc_storeStrong((id *)&v6->_locale, a3);
    uint64_t v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    whitespaceCharacterSet = v6->_whitespaceCharacterSet;
    v6->_whitespaceCharacterSet = (NSCharacterSet *)v9;
  }
  return v6;
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v6 = [(CRLShapeSearchIndex *)self p_whitespaceCharacterSet];
    uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

    v8 = [v7 crl_stringWithNormalizedHyphensAndQuotationMarks];

    uint64_t v9 = [(CRLShapeSearchIndex *)self p_locale];
    v10 = [v9 locale];
    v11 = [v8 stringByFoldingWithOptions:128 locale:v10];

    objc_super v12 = -[CRLShapeSearchIndex p_resultsForSearchTermBasedOnAnchoredSearch:shouldPerformDiacriticInsensitiveSearch:](self, "p_resultsForSearchTermBasedOnAnchoredSearch:shouldPerformDiacriticInsensitiveSearch:", v8, [v8 isEqualToString:v11]);
  }
  else
  {
    objc_super v12 = &__NSArray0__struct;
  }

  return v12;
}

- (void)addSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4 priority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v23[0] = v8;
      v22[0] = @"CRLShapeSearchIndexIdentifierKey";
      v22[1] = @"CRLShapeSearchIndexKeywords";
      id v21 = v9;
      v11 = +[NSArray arrayWithObjects:&v21 count:1];
      v23[1] = v11;
      v22[2] = @"CRLShapeSearchIndexPriorities";
      objc_super v12 = +[NSNumber numberWithUnsignedInteger:a5];
      v20 = v12;
      v13 = +[NSArray arrayWithObjects:&v20 count:1];
      v23[2] = v13;
      v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
      v24 = v14;
      v15 = +[NSArray arrayWithObjects:&v24 count:1];
      [(CRLShapeSearchIndex *)self addSearchResults:v15];

LABEL_22:
      goto LABEL_23;
    }
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6708);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079F70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6728);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v19);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResultWithIdentifier:forKeyword:priority:]");
    objc_super v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 116, 0, "Invalid parameter not satisfying: %{public}s", "keyword != nil");
    goto LABEL_22;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D66C8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10107A020();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D66E8);
  }
  v16 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v16);
  }
  v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResultWithIdentifier:forKeyword:priority:]");
  v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 115, 0, "Invalid parameter not satisfying: %{public}s", "identifier != nil");

  if (!v10) {
    goto LABEL_13;
  }
LABEL_23:
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeSearchIndex *)self p_searchIndex];
  id v43 = [v5 mutableCopy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v42 = *(void *)v49;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v8);
        v10 = [v9 objectForKeyedSubscript:@"CRLShapeSearchIndexIdentifierKey"];
        if (!v10)
        {
          unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6748);
          }
          objc_super v12 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v53 = v11;
            __int16 v54 = 2082;
            v55 = "-[CRLShapeSearchIndex addSearchResults:]";
            __int16 v56 = 2082;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
            __int16 v58 = 1024;
            int v59 = 134;
            __int16 v60 = 2082;
            v61 = "identifier != nil";
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6768);
          }
          v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v35 = v13;
            v36 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v53 = v11;
            __int16 v54 = 2114;
            v55 = v36;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]");
          v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 134, 0, "Invalid parameter not satisfying: %{public}s", "identifier != nil");
        }
        v16 = (objc_class *)objc_opt_class();
        v17 = [v9 objectForKeyedSubscript:@"CRLShapeSearchIndexKeywords"];
        v18 = sub_10024715C(v16, v17);

        if (!v18)
        {
          unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6788);
          }
          v20 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v53 = v19;
            __int16 v54 = 2082;
            v55 = "-[CRLShapeSearchIndex addSearchResults:]";
            __int16 v56 = 2082;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
            __int16 v58 = 1024;
            int v59 = 136;
            __int16 v60 = 2082;
            v61 = "keywords != nil";
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D67A8);
          }
          id v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v37 = v21;
            v38 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v53 = v19;
            __int16 v54 = 2114;
            v55 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]");
          v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 136, 0, "Invalid parameter not satisfying: %{public}s", "keywords != nil");
        }
        uint64_t v24 = objc_opt_class();
        v25 = [v9 objectForKeyedSubscript:@"CRLShapeSearchIndexPriorities"];
        v26 = sub_1002469D0(v24, v25);

        if (v26)
        {
          id v27 = [v26 count];
          if (v27 != [v18 count])
          {
            unsigned int v28 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D67C8);
            }
            v29 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v53 = v28;
              __int16 v54 = 2082;
              v55 = "-[CRLShapeSearchIndex addSearchResults:]";
              __int16 v56 = 2082;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
              __int16 v58 = 1024;
              int v59 = 138;
              __int16 v60 = 2082;
              v61 = "priorities == nil || priorities.count == keywords.count";
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D67E8);
            }
            v30 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v39 = v30;
              v40 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v53 = v28;
              __int16 v54 = 2114;
              v55 = v40;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]");
            v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 138, 0, "Invalid parameter not satisfying: %{public}s", "priorities == nil || priorities.count == keywords.count");
          }
        }
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10010A608;
        v44[3] = &unk_1014D6838;
        v44[4] = self;
        id v45 = v43;
        id v46 = v26;
        id v47 = v10;
        id v33 = v10;
        id v34 = v26;
        [v18 enumerateObjectsUsingBlock:v44];

        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v7 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v7);
  }

  [(CRLShapeSearchIndex *)self setP_searchIndex:v43];
}

- (void)removeSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010A908;
  v6[3] = &unk_1014D6860;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(CRLShapeSearchIndex *)v7 p_tokenizeKeywordIfNeeded:a4 yieldingKeyword:v6];
}

- (id)p_keywords
{
  v2 = [(CRLShapeSearchIndex *)self p_searchIndex];
  v3 = [v2 allKeys];

  return v3;
}

- (id)p_resultsForKeyword:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeSearchIndex *)self p_searchIndex];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 copy];

  return v7;
}

- (void)p_tokenizeKeywordIfNeeded:(id)a3 yieldingKeyword:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (qword_1016A90B8 != -1) {
    dispatch_once(&qword_1016A90B8, &stru_1014D6880);
  }
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [v6 length];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10010ADCC;
  v47[3] = &unk_1014D68A8;
  id v10 = v8;
  id v48 = v10;
  [v6 enumerateSubstringsInRange:0 options:3 usingBlock:v47];
  v32 = v10;
  unsigned int v11 = [(CRLShapeSearchIndex *)self p_permuteStrings:v10];
  id v12 = [v11 mutableCopy];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v13 = [(CRLShapeSearchIndex *)self p_whitespaceCharacterSet];
  id v33 = v6;
  v14 = [v6 componentsSeparatedByCharactersInSet:v13];

  id obj = v14;
  id v15 = [v14 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        unsigned int v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ((unint64_t)[v19 length] >= 2)
        {
          [v12 addObject:v19];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v20 = [v19 componentsSeparatedByCharactersInSet:qword_1016A90C0];
          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
                if ((unint64_t)[v25 length] >= 2) {
                  [v12 addObject:v25];
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v39 objects:v50 count:16];
            }
            while (v22);
          }
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }

  [v12 addObject:v33];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = [k crl_stringWithNormalizedHyphensAndQuotationMarks];
        v7[2](v7, v31);
      }
      id v28 = [v26 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v28);
  }
}

- (id)p_permuteStrings:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      id v7 = [v6 mutableCopy];

      unint64_t v8 = ++v5;
      if (v5 < (unint64_t)[v3 count])
      {
        do
        {
          [v7 appendString:@" "];
          id v9 = [v3 objectAtIndexedSubscript:v8];
          [v7 appendString:v9];

          ++v8;
        }
        while (v8 < (unint64_t)[v3 count]);
      }
      [v4 addObject:v7];
    }
    while (v5 < (unint64_t)[v3 count]);
  }

  return v4;
}

- (void)p_removeSearchResultWithIdentifier:(id)a3 forTokenizedKeyword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CRLShapeSearchIndex *)self p_searchIndex];
  id v9 = [v8 mutableCopy];

  id v10 = [(CRLShapeSearchIndex *)self p_resultsForKeyword:v7];
  id v11 = [v10 mutableCopy];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10010B09C;
  id v16 = &unk_1014D68D0;
  id v12 = v6;
  id v17 = v12;
  v18 = &v19;
  [v11 enumerateObjectsUsingBlock:&v13];
  if (v20[3] != 0x7FFFFFFFFFFFFFFFLL) {
    [v11 removeObjectAtIndex:v13, v14, v15, v16];
  }
  if (objc_msgSend(v11, "count", v13, v14, v15, v16)) {
    [v9 setObject:v11 forKeyedSubscript:v7];
  }
  else {
    [v9 removeObjectForKey:v7];
  }
  [(CRLShapeSearchIndex *)self setP_searchIndex:v9];

  _Block_object_dispose(&v19, 8);
}

- (id)p_resultsForSearchTermBasedOnAnchoredSearch:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRLShapeSearchIndex *)self p_predicateWithSearchTerm:v6 shouldPerformDiacriticInsensitiveSearch:v4];
  unint64_t v8 = [(CRLShapeSearchIndex *)self p_sortedFilteredKeywordsForSearchTerm:v6 usingPredicate:v7];
  id v9 = [(CRLShapeSearchIndex *)self p_resultsDictionaryForSearchTerm:v6 withFilteredKeywords:v8 shouldPerformDiacriticInsensitiveSearch:v4];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [v9 allKeys];
  id v12 = [v11 sortedArrayUsingSelector:"compare:"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i) v20];
        [v10 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v10;
}

- (_NSRange)p_rangeOfSearchTerm:(id)a3 inString:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5
{
  if (a5) {
    id v5 = _[a4 localizedStandardRangeOfString:a3];
  }
  else {
    id v5 = [a4 rangeOfString:a3 options:9];
  }
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (id)p_predicateWithSearchTerm:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010B3B8;
  v8[3] = &unk_1014D68F8;
  v8[4] = self;
  id v9 = a3;
  BOOL v10 = a4;
  id v5 = v9;
  NSUInteger v6 = +[NSPredicate predicateWithBlock:v8];

  return v6;
}

- (id)p_sortedFilteredKeywordsForSearchTerm:(id)a3 usingPredicate:(id)a4
{
  id v5 = a4;
  NSUInteger v6 = [(CRLShapeSearchIndex *)self p_keywords];
  id v7 = [v6 filteredArrayUsingPredicate:v5];

  unint64_t v8 = [v7 sortedArrayUsingComparator:&stru_1014D6938];

  return v8;
}

- (id)p_resultsDictionaryForSearchTerm:(id)a3 withFilteredKeywords:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[NSMutableDictionary dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = [(CRLShapeSearchIndex *)self p_resultsForKeyword:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10010B654;
        v18[3] = &unk_1014D6960;
        id v19 = v10;
        long long v20 = self;
        id v21 = v8;
        BOOL v22 = a5;
        [v15 enumerateObjectsUsingBlock:v18];
      }
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v10;
}

- (CRLLocale)p_locale
{
  return self->_locale;
}

- (void)setP_locale:(id)a3
{
}

- (NSDictionary)p_searchIndex
{
  return self->_searchIndex;
}

- (void)setP_searchIndex:(id)a3
{
}

- (NSCharacterSet)p_whitespaceCharacterSet
{
  return self->_whitespaceCharacterSet;
}

- (void)setP_whitespaceCharacterSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitespaceCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end