@interface CRLWPTypesetterTextSource
- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(unint64_t)a4;
- (BOOL)allowsTypographicalFractions;
- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasSmartFields;
- (BOOL)hasSmartFieldsInRange:(_NSRange)a3;
- (BOOL)isAllWhitespaceInRange:(_NSRange)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3;
- (CRLWPTypesetterTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4;
- (NSString)string;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3;
- (_NSRange)range;
- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3;
- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3;
- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5;
- (id).cxx_construct;
- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)characterStyleAtCharIndex:(unint64_t)a3;
- (id)characterStyleAtCharIndex:(unint64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5;
- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)hyperlinkFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5;
- (id)listStyleAtCharIndex:(unint64_t)a3;
- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)listStyleAtParIndex:(unint64_t)a3;
- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)paragraphStyleAtCharIndex:(unint64_t)a3;
- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)paragraphStyleAtParIndex:(unint64_t)a3;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4;
- (id)stringEquivalentFromRange:(_NSRange)a3;
- (int64_t)charIndexForParagraphAtIndex:(unint64_t)a3;
- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6;
- (int64_t)listNumberAtParIndex:(unint64_t)a3;
- (int64_t)nextCharacterIndex:(int64_t)a3;
- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3;
- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (int64_t)previousCharacterIndex:(int64_t)a3;
- (unint64_t)attachmentCount;
- (unint64_t)bidiCharIndexCount;
- (unint64_t)changeCount;
- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3;
- (unint64_t)charIndexMappedToStorage:(unint64_t)a3;
- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)listStartAtParIndex:(unint64_t)a3;
- (unint64_t)listStartAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (unint64_t)paragraphCount;
- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3;
- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (unint64_t)spaceCharIndexCount;
- (unint64_t)storageLength;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4;
- (unsigned)wpKind;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)smartFieldDidChange:(id)a3;
- (void)updateStorageChangeCount;
@end

@implementation CRLWPTypesetterTextSource

- (CRLWPTypesetterTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v107 = a3;
  v116.receiver = self;
  v116.super_class = (Class)CRLWPTypesetterTextSource;
  v7 = [(CRLWPTypesetterTextSource *)&v116 init];
  if (v7)
  {
    if (!v107
      || location > (unint64_t)[v107 length]
      || (unint64_t v8 = location + length, location + length > (unint64_t)[v107 length]))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2CD8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108CB24();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2CF8);
      }
      v91 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d The source storage and/or the specified sub range are invalid.", v92, v93, v94, v95, v96, v97, v98, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
      v99 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]");
      v100 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v99 file:v100 lineNumber:54 isFatal:1 description:"The source storage and/or the specified sub range are invalid."];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v101, v102);
      abort();
    }
    p_source = (id *)&v7->_source;
    objc_storeStrong((id *)&v7->_source, a3);
    p_spaceCharIndexes = &v7->_spaceCharIndexes;
    p_end = &v7->_spaceCharIndexes.__end_;
    if (v7->_spaceCharIndexes.__begin_ == v7->_spaceCharIndexes.__end_ && length >= 2)
    {
      theString = [*p_source string];
      NSUInteger v103 = location;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = sub_1002469D0(v11, *p_source);
      v13 = (void *)v12;
      if (v12)
      {
        BOOL v14 = 0;
        v109 = (void *)v12;
        uint64_t p_end_cap = (uint64_t)&v7->_bidiCharIndexes.__end_cap_;
        p_begin = (void **)&v7->_bidiCharIndexes.__begin_;
        uint64_t p_bidiDirectionMarkIsRTLVector = (uint64_t)&v7->_bidiDirectionMarkIsRTLVector;
        unint64_t v15 = v103;
        unint64_t v108 = v8;
        do
        {
          id v16 = [v13 writingDirectionForParagraphAtCharIndex:v15];
          v17 = (char *)[v13 textRangeForParagraphAtCharIndex:v15];
          v19 = &v17[v18];
          if (v8 >= (unint64_t)&v17[v18]) {
            unint64_t v8 = (unint64_t)&v17[v18];
          }
          if ((unint64_t)v17 <= v15) {
            unint64_t v20 = v15;
          }
          else {
            unint64_t v20 = (unint64_t)v17;
          }
          BOOL v111 = v16 == (id)1;
          if (v16 == (id)1)
          {
            if (v20 < v8)
            {
              BOOL v21 = 0;
              do
              {
                CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v20);
                if (!RangeOfComposedCharactersAtIndex.length)
                {
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E2D18);
                  }
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108CBAC();
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E2D38);
                  }
                  v55 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
                  {
                    +[CRLAssertionHandler packedBacktraceString];
                    objc_claimAutoreleasedReturnValue();
                    sub_1010663B0();
                  }

                  sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d zero-length character", v56, v57, v58, v59, v60, v61, v62, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                  v63 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                  v64 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
                  +[CRLAssertionHandler handleFailureInFunction:v63 file:v64 lineNumber:125 isFatal:1 description:"zero-length character"];

                  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v65, v66);
                  abort();
                }
                v117[0] = 0;
                UChar32 v23 = [(CRLWPTypesetterTextSource *)v7 composedCharacterAtCharIndex:v20 isSurrogatePair:v117];
                int v24 = sub_1001CD248(v23);
                int v25 = v24;
                if (v23 == 9 || v24 == 6 || !v21 && v24 == 4 || !v21 && v24 == 5)
                {
                  unint64_t v26 = RangeOfComposedCharactersAtIndex.length + v20;
                  end = v7->_bidiCharIndexes.__end_;
                  value = v7->_bidiCharIndexes.__end_cap_.__value_;
                  if (end >= value)
                  {
                    begin = (unint64_t *)*p_begin;
                    uint64_t v31 = ((char *)end - (unsigned char *)*p_begin) >> 3;
                    unint64_t v32 = v31 + 1;
                    if ((unint64_t)(v31 + 1) >> 61) {
                      sub_100004E40();
                    }
                    uint64_t v33 = (char *)value - (char *)begin;
                    if (v33 >> 2 > v32) {
                      unint64_t v32 = v33 >> 2;
                    }
                    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v34 = v32;
                    }
                    if (v34)
                    {
                      v35 = (char *)sub_10002B494(p_end_cap, v34);
                      begin = v7->_bidiCharIndexes.__begin_;
                      end = v7->_bidiCharIndexes.__end_;
                    }
                    else
                    {
                      v35 = 0;
                    }
                    v36 = (unint64_t *)&v35[8 * v31];
                    unint64_t *v36 = v26;
                    v29 = v36 + 1;
                    while (end != begin)
                    {
                      unint64_t v37 = *--end;
                      *--v36 = v37;
                    }
                    v7->_bidiCharIndexes.__begin_ = v36;
                    v7->_bidiCharIndexes.__end_ = v29;
                    v7->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v35[8 * v34];
                    if (begin) {
                      operator delete(begin);
                    }
                  }
                  else
                  {
                    unint64_t *end = v26;
                    v29 = end + 1;
                  }
                  v7->_bidiCharIndexes.__end_ = v29;
                  char v115 = 1;
                  sub_100213134(p_bidiDirectionMarkIsRTLVector, &v115);
                }
                BOOL v21 = v25 == 3;
                unint64_t v20 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
              }
              while (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length < v8);
            }
          }
          else
          {
            while (v20 < v8)
            {
              CFRange v38 = CFStringGetRangeOfComposedCharactersAtIndex(theString, v20);
              if (!v38.length)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E2D58);
                }
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_10108CCBC();
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E2D78);
                }
                v67 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
                {
                  +[CRLAssertionHandler packedBacktraceString];
                  objc_claimAutoreleasedReturnValue();
                  sub_1010663B0();
                }

                sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d zero-length character", v68, v69, v70, v71, v72, v73, v74, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                v75 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                v76 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
                +[CRLAssertionHandler handleFailureInFunction:v75 file:v76 lineNumber:149 isFatal:1 description:"zero-length character"];

                SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v77, v78);
                abort();
              }
              v117[0] = 0;
              int v39 = sub_1001CD248([(CRLWPTypesetterTextSource *)v7 composedCharacterAtCharIndex:v20 isSurrogatePair:v117]);
              if (v39 == 3 && v14)
              {
                v41 = v7->_bidiCharIndexes.__end_;
                v40 = v7->_bidiCharIndexes.__end_cap_.__value_;
                if (v41 >= v40)
                {
                  v43 = (unint64_t *)*p_begin;
                  uint64_t v44 = ((char *)v41 - (unsigned char *)*p_begin) >> 3;
                  unint64_t v45 = v44 + 1;
                  if ((unint64_t)(v44 + 1) >> 61) {
                    sub_100004E40();
                  }
                  uint64_t v46 = (char *)v40 - (char *)v43;
                  if (v46 >> 2 > v45) {
                    unint64_t v45 = v46 >> 2;
                  }
                  if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v47 = v45;
                  }
                  if (v47)
                  {
                    v48 = (char *)sub_10002B494(p_end_cap, v47);
                    v43 = v7->_bidiCharIndexes.__begin_;
                    v41 = v7->_bidiCharIndexes.__end_;
                  }
                  else
                  {
                    v48 = 0;
                  }
                  v49 = (unint64_t *)&v48[8 * v44];
                  unint64_t *v49 = v20;
                  v42 = v49 + 1;
                  while (v41 != v43)
                  {
                    unint64_t v50 = *--v41;
                    *--v49 = v50;
                  }
                  v7->_bidiCharIndexes.__begin_ = v49;
                  v7->_bidiCharIndexes.__end_ = v42;
                  v7->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v48[8 * v47];
                  if (v43) {
                    operator delete(v43);
                  }
                }
                else
                {
                  unint64_t *v41 = v20;
                  v42 = v41 + 1;
                }
                v7->_bidiCharIndexes.__end_ = v42;
                char v115 = 0;
                sub_100213134(p_bidiDirectionMarkIsRTLVector, &v115);
                break;
              }
              if (v39 == 1) {
                break;
              }
              unint64_t v20 = v38.location + v38.length;
            }
          }
          if (v15 >= v8)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E2D98);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10108CC34();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E2DB8);
            }
            v79 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_ERROR))
            {
              +[CRLAssertionHandler packedBacktraceString];
              objc_claimAutoreleasedReturnValue();
              sub_1010663B0();
            }

            sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Failed to advance curCharIndex", v80, v81, v82, v83, v84, v85, v86, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
            v87 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]");
            v88 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
            +[CRLAssertionHandler handleFailureInFunction:v87 file:v88 lineNumber:173 isFatal:1 description:"Failed to advance curCharIndex"];

            SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v89, v90);
            abort();
          }
          unint64_t v15 = v8;
          BOOL v14 = v111;
          unint64_t v8 = v108;
          v13 = v109;
        }
        while (v108 > (unint64_t)v19);
      }

      NSUInteger location = v103;
    }
    if (v7->_bidiCharIndexes.__begin_ == v7->_bidiCharIndexes.__end_)
    {
      v53 = -[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]([CRLWPRangeMap alloc], "initWithSubRange:unmappedPairIndexes:", location, length, p_spaceCharIndexes);
      rangeMap = v7->_rangeMap;
      v7->_rangeMap = v53;
    }
    else
    {
      v51 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:isBackwardAffinities:]([CRLWPRangeMap alloc], "initWithSubRange:unmappedIndexes:isBackwardAffinities:", location, length, &v7->_bidiCharIndexes, &v7->_bidiDirectionMarkIsRTLVector);
      rangeMap = v7->_rangeMap;
      v7->_rangeMap = v51;
      p_end = &v7->_bidiCharIndexes.__end_;
      p_spaceCharIndexes = &v7->_bidiCharIndexes;
    }

    v7->_NSUInteger length = length + *p_end - p_spaceCharIndexes->__begin_;
    v7->_storageChangeCount = (unint64_t)[v107 changeCount];
  }

  return v7;
}

- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4
{
  *a4 = 0;
  id v7 = [(CRLWPTextSource *)self->_source length];
  unsigned int v8 = 0;
  if ((unint64_t)v7 > a3)
  {
    unint64_t v9 = (unint64_t)v7;
    unsigned int v8 = [(CRLWPTextSource *)self->_source characterAtIndex:a3];
    unint64_t v10 = a3 + 1;
    if (a3 + 1 < v9)
    {
      unsigned int v11 = [(CRLWPTextSource *)self->_source characterAtIndex:a3];
      unsigned int v12 = [(CRLWPTextSource *)self->_source characterAtIndex:v10];
      if ((v11 & 0xFC00) == 0xD800 && (v12 & 0xFC00) == 56320)
      {
        *a4 = 1;
        return v12 + (v11 << 10) - 56613888;
      }
    }
  }
  return v8;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(unint64_t)a4
{
  unsigned __int8 v7 = -[CRLWPTextSource adjustRangesByDelta:startingAt:](self->_source, "adjustRangesByDelta:startingAt:");
  if (a3)
  {
    id storageChangeCount = self->_storageChangeCount;
    if (storageChangeCount != [(CRLWPTextSource *)self->_source changeCount])
    {
      self->_id storageChangeCount = (unint64_t)[(CRLWPTextSource *)self->_source changeCount];
      if ((v7 & 1) == 0) {
        [(CRLWPRangeMap *)self->_rangeMap adjustByDelta:a3 startingAt:a4];
      }
      return 1;
    }
  }
  return v7;
}

- (_NSRange)range
{
  id v2 = [(CRLWPTextSource *)self->_source range];
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (BOOL)hasSmartFields
{
  return [(CRLWPTextSource *)self->_source hasSmartFields];
}

- (unint64_t)attachmentCount
{
  return (unint64_t)[(CRLWPTextSource *)self->_source attachmentCount];
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)string
{
  id v3 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  NSUInteger length = v4;
  NSUInteger location = (NSUInteger)v3;
  uint64_t v71 = self;
  v5 = [(CRLWPTextSource *)self->_source string];
  v6 = [v5 length];

  unsigned __int8 v7 = self;
  if (v7->_spaceCharIndexes.__end_ != v7->_spaceCharIndexes.__begin_)
  {
    unsigned int v8 = +[NSMutableString string];
    begin = self->_spaceCharIndexes.__begin_;
    end = self->_spaceCharIndexes.__end_;
    if (begin == end)
    {
      unsigned int v12 = (unsigned char *)location;
    }
    else
    {
      NSUInteger v11 = location;
      do
      {
        unsigned int v12 = (unsigned char *)*begin;
        if (v11 > *begin)
        {
          unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2DD8);
          }
          BOOL v14 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v73 = v13;
            __int16 v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            __int16 v76 = 2082;
            CKRecordID v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            __int16 v78 = 1024;
            int v79 = 279;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected index ordering", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2DF8);
          }
          unint64_t v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            unint64_t v26 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v73 = v13;
            __int16 v74 = 2114;
            v75 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
          v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:279 isFatal:0 description:"unexpected index ordering"];
        }
        if (v12 > v6)
        {
          unsigned int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2E18);
          }
          v19 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v73 = v18;
            __int16 v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            __int16 v76 = 2082;
            CKRecordID v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            __int16 v78 = 1024;
            int v79 = 281;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d request for characters past end of string (ruby)", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2E38);
          }
          unint64_t v20 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
          {
            v27 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v73 = v18;
            __int16 v74 = 2114;
            v75 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          BOOL v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
          v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:281 isFatal:0 description:"request for characters past end of string (ruby)"];
        }
        if (v12 >= v6) {
          unsigned int v12 = v6;
        }
        if (v11 <= (unint64_t)v12) {
          UChar32 v23 = v12;
        }
        else {
          UChar32 v23 = (unsigned char *)v11;
        }
        if (v11 >= (unint64_t)v12) {
          int v24 = v12;
        }
        else {
          int v24 = (unsigned char *)v11;
        }
        int v25 = -[CRLWPTextSource substringWithRange:](self->_source, "substringWithRange:", v24, v23 - v24);
        [v8 appendString:v25];

        [v8 appendFormat:@"%C" 8209];
        ++begin;
        NSUInteger v11 = (NSUInteger)v12;
      }
      while (begin != end);
    }
    if (v8)
    {
LABEL_75:
      if (location + length > (unint64_t)v6)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E2F18);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108CDCC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E2F38);
        }
        unint64_t v50 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v51 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
        v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v51 file:v52 lineNumber:324 isFatal:0 description:"request for characters past end of string (extendedString)"];
      }
      if (location + length >= (unint64_t)v6) {
        v53 = v6;
      }
      else {
        v53 = (unsigned char *)(location + length);
      }
      if (v12 <= v53) {
        v54 = v53;
      }
      else {
        v54 = v12;
      }
      if (v12 >= v53) {
        v55 = v53;
      }
      else {
        v55 = v12;
      }
      uint64_t v56 = -[CRLWPTextSource substringWithRange:](v71->_source, "substringWithRange:", v55, v54 - v55);
      [v8 appendString:v56];

      id v57 = v8;
      unsigned int v8 = v57;
      goto LABEL_95;
    }
    goto LABEL_112;
  }
  if (self->_bidiCharIndexes.__end_ != self->_bidiCharIndexes.__begin_)
  {
    uint64_t v70 = +[NSMutableString string];
    v28 = self->_bidiCharIndexes.__begin_;
    uint64_t v69 = self->_bidiCharIndexes.__end_;
    if (v28 == v69)
    {
      unsigned int v12 = (unsigned char *)location;
    }
    else
    {
      int v29 = 0;
      v30 = self->_bidiDirectionMarkIsRTLVector.__begin_;
      NSUInteger v31 = location;
      do
      {
        unint64_t v32 = *v28;
        unint64_t v33 = *v30;
        if (v31 > *v28)
        {
          unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2E58);
          }
          v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v73 = v34;
            __int16 v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            __int16 v76 = 2082;
            CKRecordID v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            __int16 v78 = 1024;
            int v79 = 298;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected index ordering", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2E78);
          }
          v36 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            v48 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v73 = v34;
            __int16 v74 = 2114;
            v75 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          unint64_t v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
          CFRange v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:298 isFatal:0 description:"unexpected index ordering"];
        }
        if (v32 > (unint64_t)v6)
        {
          unsigned int v39 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2E98);
          }
          v40 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v73 = v39;
            __int16 v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            __int16 v76 = 2082;
            CKRecordID v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            __int16 v78 = 1024;
            int v79 = 300;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d request for characters past end of string (bidi)", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E2EB8);
          }
          v41 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
          {
            v49 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v73 = v39;
            __int16 v74 = 2114;
            v75 = v49;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
          v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v42 file:v43 lineNumber:300 isFatal:0 description:"request for characters past end of string (bidi)"];
        }
        if (v32 >= (unint64_t)v6) {
          unsigned int v12 = v6;
        }
        else {
          unsigned int v12 = (unsigned char *)v32;
        }
        if (v31 <= (unint64_t)v12) {
          uint64_t v44 = v12;
        }
        else {
          uint64_t v44 = (unsigned char *)v31;
        }
        if (v31 >= (unint64_t)v12) {
          unint64_t v45 = v12;
        }
        else {
          unint64_t v45 = (unsigned char *)v31;
        }
        uint64_t v46 = -[CRLWPTextSource substringWithRange:](v71->_source, "substringWithRange:", v45, v44 - v45);
        [v70 appendString:v46];

        uint64_t v47 = 8206;
        if ((v33 & (1 << v29)) != 0) {
          uint64_t v47 = 8207;
        }
        [v70 appendFormat:@"%C" v47];
        ++v28;
        v30 += v29 == 63;
        if (v29 == 63) {
          int v29 = 0;
        }
        else {
          ++v29;
        }
        NSUInteger v31 = (NSUInteger)v12;
      }
      while (v28 != v69);
    }
    unsigned int v8 = v70;
    if (v70) {
      goto LABEL_75;
    }
LABEL_112:
    uint64_t v58 = 0;
    goto LABEL_113;
  }
  NSUInteger v59 = location;
  if (!location)
  {
    uint64_t v60 = [(CRLWPTextSource *)self->_source string];
    id v61 = [v60 length];

    unsigned __int8 v7 = self;
    NSUInteger v59 = 0;
    if ((id)length == v61)
    {
      unsigned int v8 = 0;
      id v57 = [(CRLWPTextSource *)self->_source string];
LABEL_95:
      uint64_t v58 = v57;
      goto LABEL_113;
    }
  }
  if (v59 + length > (unint64_t)v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2ED8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108CD44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2EF8);
    }
    uint64_t v62 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v63 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]");
    v64 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v63 file:v64 lineNumber:311 isFatal:0 description:"request for characters past end of string"];

    v81.NSUInteger length = length;
    v81.NSUInteger location = location;
    v82.NSUInteger location = 0;
    v82.NSUInteger length = (NSUInteger)v6;
    NSRange v65 = NSIntersectionRange(v81, v82);
    NSUInteger length = v65.length;
    NSUInteger location = v65.location;
    unsigned __int8 v7 = self;
  }
  uint64_t v58 = -[CRLWPTextSource substringWithRange:](v7->_source, "substringWithRange:", location, length);
  unsigned int v8 = 0;
LABEL_113:

  return (NSString *)v58;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  v6 = (char *)-[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  uint64_t v34 = v7;
  v35 = v6;
  begin = self->_spaceCharIndexes.__begin_;
  end = self->_spaceCharIndexes.__end_;
  if (end == begin)
  {
    v19 = self->_bidiCharIndexes.__begin_;
    unsigned int v18 = self->_bidiCharIndexes.__end_;
    if (v18 == v19)
    {
      NSUInteger v11 = v6;
    }
    else
    {
      int v20 = 0;
      BOOL v21 = self->_bidiDirectionMarkIsRTLVector.__begin_;
      unint64_t v22 = (unint64_t)v6;
      do
      {
        UChar32 v23 = (char *)*v19++;
        NSUInteger v11 = v23;
        unint64_t v24 = *v21 >> v20;
        BOOL v25 = v22 >= (unint64_t)v23;
        if (v22 <= (unint64_t)v23) {
          unint64_t v26 = v11;
        }
        else {
          unint64_t v26 = (char *)v22;
        }
        if (v25) {
          v27 = v11;
        }
        else {
          v27 = (char *)v22;
        }
        uint64_t v28 = v26 - v27;
        -[CRLWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v34, v35);
        int v29 = &a3[v28];
        if (v24) {
          __int16 v30 = 8207;
        }
        else {
          __int16 v30 = 8206;
        }
        unsigned __int16 *v29 = v30;
        a3 = v29 + 1;
        v21 += v20 == 63;
        if (v20 == 63) {
          int v20 = 0;
        }
        else {
          ++v20;
        }
        unint64_t v22 = (unint64_t)v11;
      }
      while (v19 != v18);
    }
  }
  else
  {
    unint64_t v10 = (unint64_t)v6;
    do
    {
      unsigned int v12 = (char *)*begin++;
      NSUInteger v11 = v12;
      BOOL v13 = v10 >= (unint64_t)v12;
      if (v10 <= (unint64_t)v12) {
        BOOL v14 = v11;
      }
      else {
        BOOL v14 = (char *)v10;
      }
      if (v13) {
        unint64_t v15 = v11;
      }
      else {
        unint64_t v15 = (char *)v10;
      }
      uint64_t v16 = v14 - v15;
      -[CRLWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v34, v35);
      v17 = &a3[v16];
      unsigned __int16 *v17 = 8209;
      a3 = v17 + 1;
      unint64_t v10 = (unint64_t)v11;
    }
    while (begin != end);
  }
  source = self->_source;
  if (v11 <= &v35[v34]) {
    unint64_t v32 = &v35[v34];
  }
  else {
    unint64_t v32 = v11;
  }
  if (v11 >= &v35[v34]) {
    unint64_t v33 = &v35[v34];
  }
  else {
    unint64_t v33 = v11;
  }

  -[CRLWPTextSource getCharacters:range:](source, "getCharacters:range:", a3, v33, v32 - v33);
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(CRLWPTextSource *)source hasColumnBreakAtCharIndex:v4];
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  _NSRange v12 = (_NSRange)xmmword_101175810;
  unsigned int v8 = -[CRLWPTextSource smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_source, "smartFieldAtCharIndex:attributeKind:effectiveRange:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:"), a4, &v12);
  v12.NSUInteger location = (NSUInteger)[(CRLWPRangeMap *)self->_rangeMap mappedCharRange:v12];
  v12.NSUInteger length = v9;
  if (a3 < v12.location || a3 - v12.location >= v9)
  {

    unsigned int v8 = 0;
    _NSRange v12 = (_NSRange)xmmword_101175810;
  }
  if (a5) {
    *a5 = v12;
  }

  return v8;
}

- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4
{
  source = self->_source;
  id v7 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);

  return -[CRLWPTextSource smartFieldsWithAttributeKind:intersectingRange:](source, "smartFieldsWithAttributeKind:intersectingRange:", a3, v7, v6);
}

- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3
{
  return [(CRLWPTypesetterTextSource *)self paragraphIndexAtCharIndex:a3 effectiveRange:0];
}

- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v9 = xmmword_101175810;
  id v6 = [(CRLWPTextSource *)self->_source paragraphIndexAtCharIndex:[(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] effectiveRange:&v9];
  if (a4)
  {
    a4->NSUInteger location = (NSUInteger)[(CRLWPRangeMap *)self->_rangeMap mappedCharRange:v9];
    a4->NSUInteger length = v7;
  }
  return (int64_t)v6;
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3
{
  return [(CRLWPTypesetterTextSource *)self paragraphStyleAtCharIndex:a3 effectiveRange:0];
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v9 = xmmword_101175810;
  id v6 = [(CRLWPTextSource *)self->_source paragraphStyleAtCharIndex:[(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] effectiveRange:&v9];
  if (a4)
  {
    a4->NSUInteger location = (NSUInteger)[(CRLWPRangeMap *)self->_rangeMap mappedCharRange:v9];
    a4->NSUInteger length = v7;
  }

  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3
{
  return [(CRLWPTypesetterTextSource *)self characterStyleAtCharIndex:a3 effectiveRange:0];
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(CRLWPTypesetterTextSource *)self characterStyleAtCharIndex:a3 before:1 effectiveRange:a4];
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  BOOL v6 = a4;
  long long v14 = xmmword_101175810;
  source = self->_source;
  unint64_t v9 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  if (a5) {
    unint64_t v10 = &v14;
  }
  else {
    unint64_t v10 = 0;
  }
  NSUInteger v11 = [(CRLWPTextSource *)source characterStyleAtCharIndex:v9 before:v6 effectiveRange:v10];
  if (a5)
  {
    a5->NSUInteger location = (NSUInteger)[(CRLWPRangeMap *)self->_rangeMap mappedCharRange:v14];
    a5->NSUInteger length = v12;
  }

  return v11;
}

- (id)hyperlinkFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v12 = xmmword_101175810;
  source = self->_source;
  unint64_t v7 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  if (a4) {
    unsigned int v8 = &v12;
  }
  else {
    unsigned int v8 = 0;
  }
  unint64_t v9 = [(CRLWPTextSource *)source hyperlinkFieldAtCharIndex:v7 effectiveRange:v8];
  if (a4)
  {
    a4->NSUInteger location = (NSUInteger)[(CRLWPRangeMap *)self->_rangeMap mappedCharRange:v12];
    a4->NSUInteger length = v10;
  }

  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  id v6 = [(CRLWPTextSource *)self->_source wordAtCharIndex:[(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] includePreviousWord:a4];
  rangeMap = self->_rangeMap;

  id v8 = -[CRLWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v6, v5);
  result.NSUInteger length = v9;
  result.NSUInteger location = (NSUInteger)v8;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  id v7 = [(CRLWPTextSource *)self->_source wordAtCharIndex:[(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] includePreviousWord:a4 includeHyphenation:a5];
  rangeMap = self->_rangeMap;

  id v9 = -[CRLWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v7, v6);
  result.NSUInteger length = v10;
  result.NSUInteger location = (NSUInteger)v9;
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return (unsigned __int16)[(CRLWPTextSource *)source characterAtIndex:v4];
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFLocaleRef v11 = (const __CFLocale *)a5;
  CFIndex v12 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  id v13 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  CFIndex v15 = v14;
  uint64_t v16 = [(CRLWPTextSource *)self->_source string];
  v20.NSUInteger location = (CFIndex)v13;
  v20.NSUInteger length = v15;
  CFIndex HyphenationLocationBeforeIndex = CFStringGetHyphenationLocationBeforeIndex(v16, v12, v20, 0, v11, a6);

  if (HyphenationLocationBeforeIndex == -1)
  {
    int64_t v18 = -1;
  }
  else
  {
    while (a3 > HyphenationLocationBeforeIndex)
    {
      if ([(CRLWPTypesetterTextSource *)self characterAtIndex:--a3] == 173)
      {
        CFIndex HyphenationLocationBeforeIndex = a3 + 1;
        break;
      }
    }
    int64_t v18 = [(CRLWPRangeMap *)self->_rangeMap mappedCharIndex:HyphenationLocationBeforeIndex];
  }

  return v18;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(CRLWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return (unint64_t)[(CRLWPTextSource *)source charIndexMappedToStorage:v4];
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  rangeMap = self->_rangeMap;
  id v4 = [(CRLWPTextSource *)self->_source charIndexMappedFromStorage:a3];

  return [(CRLWPRangeMap *)rangeMap mappedCharIndex:v4];
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  source = self->_source;
  id v5 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);

  id v6 = -[CRLWPTextSource charRangeMappedToStorage:](source, "charRangeMappedToStorage:", v5, v4);
  result.NSUInteger length = v7;
  result.NSUInteger location = (NSUInteger)v6;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  rangeMap = self->_rangeMap;
  id v5 = -[CRLWPTextSource charRangeMappedFromStorage:](self->_source, "charRangeMappedFromStorage:", a3.location, a3.length);

  id v6 = -[CRLWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v5, v4);
  result.NSUInteger length = v7;
  result.NSUInteger location = (NSUInteger)v6;
  return result;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  unint64_t v4 = [(CRLWPTypesetterTextSource *)self charIndexMappedFromStorage:a3];

  return [(CRLWPTypesetterTextSource *)self charIndexMappedToStorage:v4];
}

- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[CRLWPTypesetterTextSource charIndexRemappedFromStorage:](self, "charIndexRemappedFromStorage:");
  NSUInteger v7 = (char *)[(CRLWPTypesetterTextSource *)self charIndexRemappedFromStorage:location + length]- v6;
  NSUInteger v8 = v6;
  result.NSUInteger length = (NSUInteger)v7;
  result.NSUInteger location = v8;
  return result;
}

- (unint64_t)changeCount
{
  return self->_storageChangeCount;
}

- (void)updateStorageChangeCount
{
  self->_id storageChangeCount = (unint64_t)[(CRLWPTextSource *)self->_source changeCount];
}

- (unint64_t)storageLength
{
  return (unint64_t)[(CRLWPTextSource *)self->_source storageLength];
}

- (unint64_t)bidiCharIndexCount
{
  return self->_bidiCharIndexes.__end_ - self->_bidiCharIndexes.__begin_;
}

- (unint64_t)spaceCharIndexCount
{
  return self->_spaceCharIndexes.__end_ - self->_spaceCharIndexes.__begin_;
}

- (unsigned)wpKind
{
  return [(CRLWPTextSource *)self->_source wpKind];
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)charIndexForParagraphAtIndex:(unint64_t)a3
{
  long long v5 = xmmword_101176F48;
  id v3 = [(CRLWPTypesetterTextSource *)self paragraphStyleAtParIndex:a3 effectiveRange:&v5];
  return v5;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3
{
  return [(CRLWPTypesetterTextSource *)self paragraphStyleAtParIndex:a3 effectiveRange:0];
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(CRLWPTextSource *)self->_source paragraphStyleAtParIndex:a3 effectiveRange:a4];
}

- (int64_t)listNumberAtParIndex:(unint64_t)a3
{
  return (int64_t)[(CRLWPTextSource *)self->_source listNumberAtParIndex:a3];
}

- (id)listStyleAtParIndex:(unint64_t)a3
{
  return [(CRLWPTypesetterTextSource *)self listStyleAtParIndex:a3 effectiveRange:0];
}

- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(CRLWPTextSource *)self->_source listStyleAtParIndex:a3 effectiveRange:a4];
}

- (id)listStyleAtCharIndex:(unint64_t)a3
{
  return [(CRLWPTextSource *)self->_source listStyleAtCharIndex:a3];
}

- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(CRLWPTextSource *)self->_source listStyleAtCharIndex:a3 effectiveRange:a4];
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  return (unint64_t)[(CRLWPTextSource *)self->_source paragraphLevelAtParIndex:a3];
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return (unint64_t)[(CRLWPTextSource *)self->_source paragraphLevelAtParIndex:a3 effectiveRange:a4];
}

- (unint64_t)listStartAtParIndex:(unint64_t)a3
{
  return (unint64_t)[(CRLWPTextSource *)self->_source listStartAtParIndex:a3];
}

- (unint64_t)listStartAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return (unint64_t)[(CRLWPTextSource *)self->_source listStartAtParIndex:a3 effectiveRange:a4];
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3
{
  return [(CRLWPTextSource *)self->_source isWritingDirectionRightToLeftForParagraphAtParIndex:a3];
}

- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3
{
  id v3 = [(CRLWPTextSource *)self->_source textRangeForParagraphAtIndex:a3];
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (int64_t)nextCharacterIndex:(int64_t)a3
{
  return (int64_t)[(CRLWPTextSource *)self->_source nextCharacterIndex:a3];
}

- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3
{
  source = self->_source;
  int64_t v4 = [(CRLWPTypesetterTextSource *)self paragraphIndexAtCharIndex:a3];

  id v5 = [(CRLWPTextSource *)source textRangeForParagraphAtIndex:v4];
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (int64_t)previousCharacterIndex:(int64_t)a3
{
  return (int64_t)[(CRLWPTextSource *)self->_source previousCharacterIndex:a3];
}

- (void)smartFieldDidChange:(id)a3
{
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return -[CRLWPTextSource stringEquivalentFromRange:](self->_source, "stringEquivalentFromRange:", a3.location, a3.length);
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  id v3 = -[CRLWPTextSource rangeByExpandingToIncludePartialWords:](self->_source, "rangeByExpandingToIncludePartialWords:", a3.location, a3.length);
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  return -[CRLWPTextSource hasSmartFieldsInRange:](self->_source, "hasSmartFieldsInRange:", a3.location, a3.length);
}

- (unint64_t)paragraphCount
{
  return (unint64_t)[(CRLWPTextSource *)self->_source paragraphCount];
}

- (BOOL)allowsTypographicalFractions
{
  return [(CRLWPTextSource *)self->_source allowsTypographicalFractions];
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  return -[CRLWPTextSource isAllWhitespaceInRange:](self->_source, "isAllWhitespaceInRange:", a3.location, a3.length);
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5
{
  return -[CRLWPTextSource languageForTextRange:useStringTokenizer:useDocumentLanguage:](self->_source, "languageForTextRange:useStringTokenizer:useDocumentLanguage:", a3.location, a3.length, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeMap, 0);
  objc_storeStrong((id *)&self->_source, 0);
  begin = self->_bidiDirectionMarkIsRTLVector.__begin_;
  if (begin) {
    operator delete(begin);
  }
  NSUInteger v4 = self->_bidiCharIndexes.__begin_;
  if (v4)
  {
    self->_bidiCharIndexes.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_spaceCharIndexes.__begin_;
  if (v5)
  {
    self->_spaceCharIndexes.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end