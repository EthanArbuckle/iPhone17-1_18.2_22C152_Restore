@interface THSearchIndex
- (BOOL)cfisLoaded;
- (BOOL)loaded;
- (BOOL)p_isIndexedWord:(id)a3;
- (THSearchIndex)initWithContext:(id)a3;
- (id)addTermWithStem:(id)a3;
- (id)filterOutGlossaryKeysFromOccurrenceMap:(id)a3;
- (id)occurrenceMapForQuery:(id)a3;
- (id)p_cfiForString:(id)a3 paragraphRange:(id)a4;
- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7;
- (id)p_firstIndexedWordInQuery:(id)a3 outWordRange:(_NSRange *)a4 outHasMultipleWords:(BOOL *)a5;
- (id)resultsForQuery:(id)a3 occurrenceMap:(id)a4 searchContextMap:(id)a5 suggestions:(BOOL)a6;
- (id)unambiguousCFIForString:(id)a3;
- (void)addReference:(id)a3 cfi:(id)a4;
- (void)dealloc;
- (void)finishLoading;
- (void)setCfisLoaded:(BOOL)a3;
- (void)unload;
@end

@implementation THSearchIndex

- (THSearchIndex)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THSearchIndex;
  v3 = [(THSearchIndex *)&v5 initWithContext:a3];
  if (v3)
  {
    v3->mTerms = objc_alloc_init(TSLSearchTree);
    v3->mReferences = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v3->mStemmer = [[TSLStemmer alloc] initWithLocale:0];
    long long v6 = xmmword_3447C0;
    __int16 v7 = 4;
    v3->mParagraphBreakCharacterSet = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", +[NSString stringWithCharacters:&v6 length:9]);
  }
  return v3;
}

- (void)unload
{
  [(TSUNoCopyDictionary *)self->mReferences removeAllObjects];
  self->mTerms = objc_alloc_init(TSLSearchTree);

  self->mStemmer = [[TSLStemmer alloc] initWithLocale:0];
  self->mLoaded = 0;
  self->mAllCfisLoaded = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THSearchIndex;
  [(THSearchIndex *)&v3 dealloc];
}

- (id)addTermWithStem:(id)a3
{
  [(THSearchIndex *)self willModify];
  objc_super v5 = [[THModelSearchIndexTerm alloc] initWithStem:a3];
  [(TSLSearchTree *)self->mTerms insertWord:a3 value:v5];
  long long v6 = v5;
  return v5;
}

- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7
{
  v8 = [[THModelSearchResult alloc] initWithTerm:a3 rank:a5->var0 cfi:[(TSUNoCopyDictionary *)self->mReferences objectForKey:a5->var4] pageNumber:a5->var2 displayPageNumber:a5->var3 occurrenceIndex:a6 context:a4];
  if (a7) {
    -[THModelSearchResult setOccurenceCount:](v8, "setOccurenceCount:", (char *)[a7 occurenceCount] + 1);
  }
  return v8;
}

- (BOOL)p_isIndexedWord:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  mTerms = self->mTerms;
  id v5 = -[TSLStemmer stemWord:](self->mStemmer, "stemWord:");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_EC468;
  v7[3] = &unk_4593C0;
  v7[4] = a3;
  v7[5] = &v8;
  [(TSLSearchTree *)mTerms enumerateWordsForPrefix:v5 withBlock:v7];
  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (id)p_firstIndexedWordInQuery:(id)a3 outWordRange:(_NSRange *)a4 outHasMultipleWords:(BOOL *)a5
{
  v20.NSUInteger length = (CFIndex)[a3 length];
  v20.NSUInteger location = 0;
  v9 = CFStringTokenizerCreate(0, (CFStringRef)a3, v20, 0, 0);
  if (v9)
  {
    uint64_t v10 = v9;
    v19 = a4;
    if (CFStringTokenizerAdvanceToNextToken(v9))
    {
      CFStringRef v11 = 0;
      NSUInteger length = 0;
      char v13 = 0;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v10);
        CFStringRef v16 = (id)CFStringCreateWithSubstring(0, (CFStringRef)a3, CurrentTokenRange);
        if (v11)
        {
          char v13 = 1;
          if ([(THSearchIndex *)self p_isIndexedWord:v11]) {
            break;
          }
        }
        CFStringRef v11 = v16;
        NSUInteger location = CurrentTokenRange.location;
        NSUInteger length = CurrentTokenRange.length;
      }
      while (CFStringTokenizerAdvanceToNextToken(v10));
    }
    else
    {
      NSUInteger length = 0;
      CFStringRef v11 = 0;
      char v13 = 0;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    }
    CFRelease(v10);
    BOOL v17 = v13 & 1;
    a4 = v19;
    if (a5) {
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v17 = 0;
    NSUInteger length = 0;
    CFStringRef v11 = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    if (a5) {
LABEL_12:
    }
      *a5 = v17;
  }
  if (a4)
  {
    a4->NSUInteger location = location;
    a4->NSUInteger length = length;
  }
  return (id)v11;
}

- (id)resultsForQuery:(id)a3 occurrenceMap:(id)a4 searchContextMap:(id)a5 suggestions:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v74 = a6;
  if (!a3)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:]");
    CFStringRef v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndex.m"];
    v12 = v10;
    BOOL v6 = v74;
    [v9 handleFailureInFunction:v12 file:v11 lineNumber:175 description:@"Got a nil query"];
  }
  id v13 = [a3 lowercaseString];
  id v75 = +[NSMutableSet set];
  char v92 = 0;
  long long v91 = xmmword_3447B0;
  v81 = v13;
  if ([(THSearchIndex *)self p_firstIndexedWordInQuery:v13 outWordRange:&v91 outHasMultipleWords:&v92]&& (void)v91 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v77 = self;
    id v78 = objc_alloc_init((Class)NSMutableDictionary);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id obj = [a4 allKeys];
    id v72 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (!v72) {
      goto LABEL_87;
    }
    uint64_t v69 = *(void *)v88;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v88 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v14;
        uint64_t v15 = *(void *)(*((void *)&v87 + 1) + 8 * v14);
        CFStringRef v16 = (__CFString *)[a5 objectForKey:v15];
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v76 = [a4 objectForKey:v15];
        id v80 = [v76 countByEnumeratingWithState:&v83 objects:v93 count:16];
        if (v80)
        {
          uint64_t v79 = *(void *)v84;
          v82 = v16;
          do
          {
            BOOL v17 = 0;
            do
            {
              if (*(void *)v84 != v79) {
                objc_enumerationMutation(v76);
              }
              v18 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v17);
              id v19 = objc_msgSend(objc_msgSend(v18, "first"), "inflection");
              CFRange v20 = (unsigned __int16 *)[v18 second];
              v21 = v20;
              uint64_t v22 = v20[1];
              if (v92)
              {
                int v23 = v20[1];
                v24 = v81;
                if (*v20 == 1)
                {
                  int v25 = 1;
                  v24 = v81;
LABEL_21:
                  if (([v19 hasPrefix:v24] & 1) == 0) {
                    goto LABEL_78;
                  }
                  uint64_t v27 = 0;
                  uint64_t v28 = 0;
                  int v29 = 1;
                  if (!v6)
                  {
LABEL_41:
                    if (v29) {
                      id v41 = v19;
                    }
                    else {
                      id v41 = v24;
                    }
                    id v42 = [(THSearchIndex *)v77 p_createModelSearchResultForTerm:v41 searchContext:v82 occurrence:v21 occurrenceIndex:v22 previousEntry:0];
                    [v75 addObject:v42];

                    goto LABEL_78;
                  }
LABEL_57:
                  id v47 = [v19 lowercaseString];
                  id v48 = [v78 objectForKey:v47];
                  v49 = v48;
                  if (v48 && (int)[v48 rank] <= *v21)
                  {
                    [v49 setOccurenceCount:((char *)[v49 occurenceCount]) + 1];
                  }
                  else
                  {
                    id v50 = [(THSearchIndex *)v77 p_createModelSearchResultForTerm:v47 searchContext:v82 occurrence:v21 occurrenceIndex:v22 previousEntry:v49];
                    [v78 setObject:v50 forKey:v47];
                  }
                  if (((v29 | v25 ^ 1) & 1) == 0 && (unint64_t)[v81 length] >= 3)
                  {
                    CFIndex v51 = v28 + v27;
                    v52 = (char *)[(__CFString *)v82 length];
                    v53.NSUInteger length = (CFIndex)(v28 + v27 <= v28 + 1 ? &v52[-v51] : &v52[-v28 - v27 + 1]);
                    v53.NSUInteger location = v51 - (v51 > v28 + 1);
                    v54 = CFStringTokenizerCreate(0, v82, v53, 0, 0);
                    if (v54)
                    {
                      v55 = v54;
                      if (CFStringTokenizerAdvanceToNextToken(v54))
                      {
                        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v55);
                        id v57 = -[__CFString substringWithRange:](v82, "substringWithRange:", v28, CurrentTokenRange.length - v28 + CurrentTokenRange.location);
                        if ([v57 length])
                        {
                          id v58 = [v57 lowercaseString];
                          id v59 = [v78 objectForKey:v58];
                          v60 = v59;
                          if (v59 && (int)[v59 rank] <= *v21)
                          {
                            if (([v47 isEqualToString:v58] & 1) == 0) {
                              [v60 setOccurenceCount:[v60 occurenceCount] + 1];
                            }
                          }
                          else
                          {
                            id v61 = [(THSearchIndex *)v77 p_createModelSearchResultForTerm:v58 searchContext:v82 occurrence:v21 occurrenceIndex:v22 previousEntry:v60];
                            [v78 setObject:v61 forKey:v58];
                          }
                          if (CurrentTokenRange.location > (unint64_t)v51)
                          {
                            id v62 = [v81 lowercaseString];
                            id v63 = [v78 objectForKey:v62];
                            v64 = v63;
                            if (v63 && (int)[v63 rank] <= *v21)
                            {
                              if (([v47 isEqualToString:v62] & 1) == 0) {
                                [v64 setOccurenceCount:[v64 occurenceCount] + 1];
                              }
                            }
                            else
                            {
                              id v65 = [(THSearchIndex *)v77 p_createModelSearchResultForTerm:v62 searchContext:v82 occurrence:v21 occurrenceIndex:v22 previousEntry:v64];
                              [v78 setObject:v65 forKey:v62];
                            }
                          }
                        }
                      }
                      CFRelease(v55);
                    }
                  }
                  goto LABEL_78;
                }
              }
              else
              {
                v24 = v81;
                unsigned int v26 = [v19 isEqualToString:v81];
                int v25 = v26;
                if (!v92) {
                  v24 = v19;
                }
                if (*v21 == 1) {
                  goto LABEL_21;
                }
                if (!v26)
                {
                  int v29 = 0;
                  uint64_t v27 = 0;
                  uint64_t v28 = 0;
                  if (!v6) {
                    goto LABEL_41;
                  }
                  goto LABEL_57;
                }
                int v23 = v21[1];
              }
              if (!v23)
              {
                int v29 = 0;
                uint64_t v27 = 0;
                uint64_t v28 = 0;
                goto LABEL_56;
              }
              v30 = -[__CFString rangeOfString:options:range:](v16, "rangeOfString:options:range:", v19, 1, 0, [(__CFString *)v16 length]);
              uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
              if (v30 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v27 = 0;
                BOOL v32 = 0;
                goto LABEL_47;
              }
              v33 = v30;
              uint64_t v34 = v31;
              uint64_t v35 = 0;
              while ((unint64_t)v33 < (unint64_t)v91)
              {
                uint64_t v27 = 0;
                uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
                int v37 = -1;
LABEL_37:
                uint64_t v22 = (v37 + v22);
                if (++v35 >= (unint64_t)v21[1]) {
                  goto LABEL_46;
                }
                v33 = -[__CFString rangeOfString:options:range:](v82, "rangeOfString:options:range:", v19, 1, &v33[v34], (unsigned char *)[(__CFString *)v82 length] - &v33[v34]);
                uint64_t v34 = v40;
                uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
                if (v33 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v27 = 0;
                  goto LABEL_46;
                }
              }
              v36 = &v33[-v91];
              v38 = (char *)[v24 length] + (void)v36;
              if (v38 <= [(__CFString *)v82 length])
              {
                uint64_t v28 = (uint64_t)-[__CFString rangeOfString:options:range:](v82, "rangeOfString:options:range:", v24, 1, &v33[-v91], [v24 length]);
                uint64_t v27 = v39;
                if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
                  int v37 = -1;
                }
                else {
                  int v37 = 0;
                }
                goto LABEL_37;
              }
              uint64_t v27 = 0;
              uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_46:
              BOOL v6 = v74;
              BOOL v32 = v74;
LABEL_47:
              if (v28 != 0x7FFFFFFFFFFFFFFFLL || !v32)
              {
                if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_78;
                }
                int v29 = 0;
LABEL_56:
                int v25 = 1;
                if (!v6) {
                  goto LABEL_41;
                }
                goto LABEL_57;
              }
              if (!v6) {
                [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndex.m") lineNumber:264 description:@"Only include inflection when building suggestions."];
              }
              id v43 = [v19 lowercaseString];
              id v44 = [v78 objectForKey:v43];
              v45 = v44;
              if (v44 && (int)[v44 rank] <= *v21)
              {
                [v45 setOccurenceCount:[v45 occurenceCount] + 1];
              }
              else
              {
                id v46 = [(THSearchIndex *)v77 p_createModelSearchResultForTerm:v43 searchContext:v82 occurrence:v21 occurrenceIndex:v22 previousEntry:v45];
                [v78 setObject:v46 forKey:v43];
              }
LABEL_78:
              BOOL v17 = (char *)v17 + 1;
              CFStringRef v16 = v82;
            }
            while (v17 != v80);
            id v66 = [v76 countByEnumeratingWithState:&v83 objects:v93 count:16];
            id v80 = v66;
          }
          while (v66);
        }
        uint64_t v14 = v73 + 1;
      }
      while ((id)(v73 + 1) != v72);
      id v72 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
      if (!v72)
      {
LABEL_87:
        [v75 addObjectsFromArray:[v78 allValues]];

        return v75;
      }
    }
  }
  return v75;
}

- (id)occurrenceMapForQuery:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  char v15 = 0;
  id v6 = -[THSearchIndex p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:](self, "p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:", [a3 lowercaseString], 0, &v15);
  id v7 = v6;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_ECFBC;
    v14[3] = &unk_459410;
    v14[4] = v5;
    v14[5] = &v16;
    for (id i = v6;
          (unint64_t)[i length] > 2 || i == v7;
          id i = objc_msgSend(i, "substringToIndex:", (char *)objc_msgSend(i, "length") - 1))
    {
      id v9 = [(TSLStemmer *)self->mStemmer stemWord:i];
      id v10 = v9;
      if (v9)
      {
        unsigned __int8 v11 = [v9 isEqualToString:i];
        mTerms = self->mTerms;
        if (v11) {
          [(TSLSearchTree *)mTerms enumerateWordsForPrefix:i withBlock:v14];
        }
        else {
          [(TSLSearchTree *)mTerms enumerateWordsForPrefix:v10 withBlock:v14];
        }
        if (*((_DWORD *)v17 + 6)) {
          break;
        }
      }
    }
  }
  _Block_object_dispose(&v16, 8);
  return v5;
}

- (id)filterOutGlossaryKeysFromOccurrenceMap:(id)a3
{
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_ED178;
  v6[3] = &unk_459438;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return v4;
}

- (id)p_cfiForString:(id)a3 paragraphRange:(id)a4
{
  CFIndex var1 = a4.var1;
  CFIndex var0 = a4.var0;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = objc_alloc_init((Class)NSMutableSet);
  v18.NSUInteger location = var0;
  v18.NSUInteger length = var1;
  CFStringTokenizerRef v10 = CFStringTokenizerCreate(0, (CFStringRef)a3, v18, 0, 0);
  if (v10)
  {
    unsigned __int8 v11 = v10;
    while (CFStringTokenizerAdvanceToNextToken(v11))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      v12 = (__CFString *)CFStringCreateWithSubstring(0, (CFStringRef)a3, CurrentTokenRange);
      id v13 = [(TSLStemmer *)self->mStemmer newStemmedWord:v12];
      mTerms = self->mTerms;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_ED460;
      v17[3] = &unk_459488;
      v17[4] = v12;
      v17[5] = self;
      v17[6] = v9;
      [(TSLSearchTree *)mTerms enumerateWordsForPrefix:v13 withBlock:v17];

      if ([v9 count])
      {
        if ([v8 count])
        {
          [v8 intersectSet:v9];
          if (![v8 count]) {
            break;
          }
        }
        else
        {
          [v8 unionSet:v9];
        }
        [v9 removeAllObjects];
      }
    }
    CFRelease(v11);
  }
  if ([v8 count] == (char *)&dword_0 + 1) {
    id v15 = [v8 anyObject];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (id)unambiguousCFIForString:(id)a3
{
  v4 = [(__CFString *)[a3 lowercaseString] tsu_stringByReplacingCharactersInSet:self->mParagraphBreakCharacterSet withCharacter:8233];
  v11.NSUInteger length = (CFIndex)[(__CFString *)v4 length];
  v11.NSUInteger location = 0;
  CFStringTokenizerRef v5 = CFStringTokenizerCreate(0, v4, v11, 2uLL, 0);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    id v8 = -[THSearchIndex p_cfiForString:paragraphRange:](self, "p_cfiForString:paragraphRange:", v4, CurrentTokenRange.location, CurrentTokenRange.length);
    if (v8)
    {
      id v9 = v8;
      goto LABEL_8;
    }
  }
  id v9 = 0;
LABEL_8:
  CFRelease(v6);
  return v9;
}

- (void)addReference:(id)a3 cfi:(id)a4
{
}

- (void)finishLoading
{
  self->mLoaded = 1;
}

- (void)setCfisLoaded:(BOOL)a3
{
  self->mAllCfisLoaded = a3;
}

- (BOOL)loaded
{
  return self->mLoaded;
}

- (BOOL)cfisLoaded
{
  return self->mAllCfisLoaded;
}

@end