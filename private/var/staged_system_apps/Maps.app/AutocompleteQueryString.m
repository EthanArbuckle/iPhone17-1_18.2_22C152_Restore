@interface AutocompleteQueryString
- (AutocompleteQueryString)init;
- (AutocompleteQueryString)initWithQuery:(id)a3;
- (AutocompleteQueryString)initWithQuery:(id)a3 requiredMatchLength:(unint64_t)a4;
- (BOOL)matchesString:(id)a3;
- (NSArray)queryTerms;
- (id)matchesInString:(id)a3;
- (id)matchesInStringTerms:(id)a3 displayString:(id)a4;
@end

@implementation AutocompleteQueryString

- (AutocompleteQueryString)init
{
  return 0;
}

- (AutocompleteQueryString)initWithQuery:(id)a3
{
  return [(AutocompleteQueryString *)self initWithQuery:a3 requiredMatchLength:1];
}

- (AutocompleteQueryString)initWithQuery:(id)a3 requiredMatchLength:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AutocompleteQueryString;
  v8 = [(AutocompleteQueryString *)&v17 init];
  if (v8)
  {
    v9 = sub_100603814();
    uint64_t v10 = [v7 stringByTrimmingCharactersInSet:v9];
    query = v8->_query;
    v8->_query = (NSString *)v10;

    objc_storeStrong((id *)&v8->_unsanitazedQuery, a3);
    v8->_isCJK = [(NSString *)v8->_query _navigation_isCJK];
    v8->_requiredMatchLength = a4;
    v12 = v8->_query;
    v13 = sub_100603814();
    uint64_t v14 = [(NSString *)v12 componentsSeparatedByCharactersInSet:v13];
    queryTerms = v8->_queryTerms;
    v8->_queryTerms = (NSArray *)v14;
  }
  return v8;
}

- (BOOL)matchesString:(id)a3
{
  v4 = [(AutocompleteQueryString *)self matchesInString:a3];
  v5 = v4;
  if (v4) {
    BOOL v6 = (unint64_t)[v4 totalMatchLength] >= self->_requiredMatchLength;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)matchesInString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && [(NSString *)self->_query length]
    && [(NSArray *)self->_queryTerms count])
  {
    v5 = sub_100603814();
    BOOL v6 = [v4 stringByTrimmingCharactersInSet:v5];

    id v7 = sub_100603814();
    v8 = [v6 componentsSeparatedByCharactersInSet:v7];

    v9 = [(AutocompleteQueryString *)self matchesInStringTerms:v8 displayString:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)matchesInStringTerms:(id)a3 displayString:(id)a4
{
  id v6 = a3;
  id v44 = a4;
  v42 = v6;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = sub_100103DFC;
  v94 = sub_100104788;
  id v95 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_100103DFC;
  v88 = sub_100104788;
  id v89 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_100103DFC;
  v82 = sub_100104788;
  id v83 = 0;
  id v45 = [v6 mutableCopy];
  id v7 = [v45 count];
  BOOL isCJK = self->_isCJK;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v70 = 0;
  v71 = (double *)&v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  v43 = +[NSMutableArray array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v9 = self->_queryTerms;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v66 objects:v96 count:16];
  v40 = self;
  if (v10)
  {
    uint64_t v11 = *(void *)v67;
    obj = v9;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v67 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v62 = 0;
        v63 = &v62;
        uint64_t v64 = 0x2020000000;
        char v65 = 0;
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x2020000000;
        uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100604084;
        v46[3] = &unk_1012F21F8;
        BOOL v57 = !isCJK;
        v46[4] = v13;
        v50 = &v62;
        v51 = &v74;
        id v47 = v43;
        v52 = &v58;
        v53 = &v78;
        v54 = &v70;
        id v48 = v44;
        id v49 = v42;
        v55 = &v90;
        v56 = &v84;
        [v45 enumerateObjectsUsingBlock:v46];
        int v14 = *((unsigned __int8 *)v63 + 24);
        if (!*((unsigned char *)v63 + 24))
        {

          _Block_object_dispose(&v58, 8);
          _Block_object_dispose(&v62, 8);
LABEL_15:
          v19 = 0;
          goto LABEL_27;
        }
        [v45 removeObjectsInRange:0, v59[3] + 1];

        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(&v62, 8);
        if (!v14) {
          goto LABEL_15;
        }
      }
      v9 = obj;
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v96 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v7) {
    v71[3] = v71[3] / (double)(unint64_t)v7;
  }
  v15 = [v43 lastObject];
  if ([(NSArray *)v15 length])
  {
    id v16 = [(id)v79[5] length];
    *(float *)&double v17 = (float)(unint64_t)v16 / (float)(unint64_t)[(NSArray *)v15 length];
    v18 = +[NSNumber numberWithFloat:v17];
  }
  else
  {
    v18 = 0;
  }
  NSUInteger v20 = [(NSString *)v40->_unsanitazedQuery length];
  *(float *)&double v21 = (float)v20 / (float)(unint64_t)[v44 length];
  v22 = +[NSNumber numberWithFloat:v21];
  obj = v15;
  v23 = [v44 uppercaseString];
  v24 = [(NSString *)v40->_unsanitazedQuery uppercaseString];
  id v25 = [v23 rangeOfString:v24];

  if (v25 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = 0;
  }
  else
  {
    v26 = +[NSNumber numberWithUnsignedInteger:v25];
  }
  v27 = [v44 uppercaseString];
  v28 = [(NSString *)v40->_query uppercaseString];
  v29 = (char *)[v27 rangeOfString:v28];
  uint64_t v31 = v30;

  v32 = v40;
  if (&v29[v31] <= [v44 length])
  {
    v34 = [v44 substringFromIndex:];
    if ([v34 length])
    {
      v35 = sub_100603814();
      id v36 = [v34 rangeOfCharacterFromSet:v35];

      BOOL v33 = v36 == 0;
    }
    else
    {
      BOOL v33 = 1;
    }

    v32 = v40;
  }
  else
  {
    BOOL v33 = 0;
  }
  v37 = [AutocompleteQueryStringMatch alloc];
  LOBYTE(v39) = v33;
  v19 = [(AutocompleteQueryStringMatch *)v37 initWithQueryTerms:v32->_queryTerms stringTerms:v42 matchingTerms:v43 totalMatchLength:v75[3] fractionOfMatch:v18 prefixLastTokenMatchCover:v22 prefixMatchCover:v71[3] prefixMatchPosition:v26 prefixMatchesWordBoundary:v39 firstPrefixToken:v91[5] secondPrefixToken:v85[5]];

LABEL_27:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

  return v19;
}

- (NSArray)queryTerms
{
  return self->_queryTerms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTerms, 0);
  objc_storeStrong((id *)&self->_unsanitazedQuery, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end