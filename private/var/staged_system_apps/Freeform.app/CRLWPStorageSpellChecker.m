@interface CRLWPStorageSpellChecker
+ (BOOL)canCheckSpelling;
+ (Class)concreteClass;
+ (id)conditionalSpellCheckerForStorage:(id)a3;
+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5;
+ (void)p_inputLanguageDidChangeNotification:(id)a3;
- (BOOL)hasValidResultsForRange:(_NSRange)a3;
- (BOOL)hasValidResultsForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6;
- (BOOL)i_setResults:(id)a3 grammarResults:(id)a4 shouldSync:(BOOL)a5;
- (BOOL)isBusy;
- (BOOL)shouldCheckAtCharIndex:(unint64_t)a3;
- (CRLSearchCanvasDelegate)searchCanvasDelegate;
- (CRLWPRangeArray)misspelledRanges;
- (CRLWPRangeArray)ungrammaticRanges;
- (CRLWPStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5;
- (_NSRange)dirtyRange;
- (_NSRange)firstErrorInRange:(_NSRange)a3;
- (_NSRange)p_extendRangeToBeChecked:(_NSRange)a3 delta:(int64_t)a4;
- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3;
- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3;
- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4;
- (id)grammarResults;
- (id)p_textSourceWithoutDeletionsWithSubRange:(_NSRange)a3;
- (id)spellingErrors;
- (id)suggestionsForRange:(_NSRange)a3;
- (void)checkRange:(_NSRange)a3 synchronously:(BOOL)a4;
- (void)cleanup;
- (void)dealloc;
- (void)findErrorsInRange:(_NSRange)a3 onHit:(id)a4 stop:(BOOL *)a5;
- (void)i_addMisspelledWord:(id)a3 atIndex:(unint64_t)a4 ifValidForRange:(_NSRange)a5 toResults:(id)a6;
- (void)i_resetSpellCheckingForNotification:(id)a3;
- (void)setSearchCanvasDelegate:(id)a3;
- (void)synchronouslyCheckRange:(_NSRange)a3;
@end

@implementation CRLWPStorageSpellChecker

+ (Class)concreteClass
{
  return (Class)objc_opt_class();
}

+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(objc_msgSend(a1, "concreteClass"), "newSpellCheckerForStorage:selectionPath:orSearchCanvasDelegate:", v8, v9, v10);

  return v11;
}

+ (id)conditionalSpellCheckerForStorage:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_msgSend(a1, "concreteClass"), "conditionalSpellCheckerForStorage:", v4);

  return v5;
}

+ (BOOL)canCheckSpelling
{
  return 1;
}

- (id)suggestionsForRange:(_NSRange)a3
{
  return &__NSArray0__struct;
}

+ (void)p_inputLanguageDidChangeNotification:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRLWPSpellCheckerLanguageDidChangeNotification" object:a1];
}

- (id)p_textSourceWithoutDeletionsWithSubRange:(_NSRange)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  return WeakRetained;
}

- (_NSRange)p_extendRangeToBeChecked:(_NSRange)a3 delta:(int64_t)a4
{
  length = (char *)a3.length;
  location = (unsigned char *)a3.location;
  if (a4 < 0 && !a3.length)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
    id v8 = [WeakRetained length];

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_storage);
      sub_100189DF8(v24, v9, 0, 0, (char *)[v9 paragraphCount] - 1, 1);

      BOOL v10 = location == sub_100189F3C((uint64_t)v24);
      id v11 = objc_loadWeakRetained((id *)&self->_storage);
      id v12 = v11;
      if (v10)
      {
        length = (char *)((unsigned char *)[v11 nextCharacterIndex:location] - location);
      }
      else
      {
        v13 = [v11 previousCharacterIndex:location];

        id v12 = objc_loadWeakRetained((id *)&self->_storage);
        length = (char *)((unsigned char *)[v12 nextCharacterIndex:location] - v13);
        location = v13;
      }

      sub_100189C94(v24);
    }
    else
    {
      length = 0;
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_storage);
  id v15 = [v14 rangeByExpandingToIncludePartialWords:location, length];
  NSUInteger v17 = v16;

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL && v17 == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500F98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BEA6C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500FB8);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:]");
    v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:118 isFatal:0 description:"Bad extended range"];
  }
  NSUInteger v22 = (NSUInteger)v15;
  NSUInteger v23 = v17;
  result.length = v23;
  result.location = v22;
  return result;
}

- (CRLWPStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRLWPStorageSpellChecker;
  id v9 = [(CRLWPStorageSpellChecker *)&v21 init];
  if ([(CRLWPStorageSpellChecker *)v9 isMemberOfClass:objc_opt_class()])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500FD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BEAF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500FF8);
    }
    BOOL v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:127 isFatal:0 description:"illegal instantiation of abstract class CRLWPStorageSpellChecker"];
  }
  if (v9
    && ((unsigned __int8 v13 = [(CRLWPStorageSpellChecker *)v9 isMemberOfClass:objc_opt_class()],
         !v7)
      ? (char v14 = 1)
      : (char v14 = v13),
        (v14 & 1) == 0))
  {
    objc_storeWeak((id *)&v9->_storage, v7);
    objc_storeStrong((id *)&v9->_searchCanvasDelegate, a5);
    uint64_t v16 = objc_opt_new();
    checkedRanges = v9->_checkedRanges;
    v9->_checkedRanges = (CRLWPMutableRangeArray *)v16;

    uint64_t v18 = objc_opt_new();
    dirtyRanges = v9->_dirtyRanges;
    v9->_dirtyRanges = (CRLWPMutableDirtyRangeArray *)v18;

    id v15 = v9;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501018);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BEB7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501038);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker dealloc]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 143, 0, "expected nil value for '%{public}s'", "_storage");
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLWPStorageSpellChecker;
  [(CRLWPStorageSpellChecker *)&v7 dealloc];
}

- (void)cleanup
{
}

- (CRLWPRangeArray)misspelledRanges
{
  return [(CRLWPCheckingResults *)self->_spellingResults ranges];
}

- (id)spellingErrors
{
  return [(CRLWPCheckingResults *)self->_spellingResults results];
}

- (CRLWPRangeArray)ungrammaticRanges
{
  grammarResults = self->_grammarResults;
  if (grammarResults)
  {
    v3 = [(CRLWPCheckingResults *)grammarResults ranges];
  }
  else
  {
    v3 = objc_opt_new();
  }

  return (CRLWPRangeArray *)v3;
}

- (id)grammarResults
{
  return [(CRLWPCheckingResults *)self->_grammarResults results];
}

- (BOOL)isBusy
{
  return 0;
}

- (void)synchronouslyCheckRange:(_NSRange)a3
{
}

- (void)checkRange:(_NSRange)a3 synchronously:(BOOL)a4
{
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    p_storage = &self->_storage;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
    id v9 = [WeakRetained length];
    NSUInteger v10 = location + length;

    if (location + length <= (unint64_t)v9)
    {
      id v14 = [(CRLWPSpellingResults *)self->_spellingResults copy];
      NSUInteger v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = sub_10024715C(v17, self->_grammarResults);
      id v15 = [v18 copy];

      if (length)
      {
        id v19 = -[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:](self, "p_extendRangeToBeChecked:delta:", location, length, 0);
        uint64_t v21 = v20;
        id v22 = [(CRLWPStorageSpellChecker *)self dirtyRange];
        uint64_t v24 = v23;
        int64_t v25 = [(CRLWPDirtyRangeArray *)self->_dirtyRanges delta];
        if ([(CRLWPRangeArray *)self->_checkedRanges rangeCount])
        {
          if (v22 != (id)0x7FFFFFFFFFFFFFFFLL || v25)
          {
            v50 = (char *)[(CRLWPRangeArray *)self->_checkedRanges superRange];
            uint64_t v48 = v28;
            v30 = (char *)-[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:](self, "p_extendRangeToBeChecked:delta:", v22, v24, v25);
            uint64_t v31 = v29;
            if (v29)
            {
              -[CRLWPRangeArray intersection:](self->_checkedRanges, "intersection:", v30, v29);
              v49 = (CRLWPRangeArray *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v49 = -[CRLWPRangeArray initWithRange:]([CRLWPRangeArray alloc], "initWithRange:", v30, 0);
            }
            id v32 = [(CRLWPRangeArray *)v49 superRange];
            uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
            if (v33) {
              uint64_t v35 = v33;
            }
            else {
              uint64_t v35 = 0;
            }
            if (v33) {
              uint64_t v34 = (uint64_t)v32;
            }
            uint64_t v46 = v34;
            v47 = (CRLWPMutableRangeArray *)objc_opt_new();
            BOOL v36 = &v30[v31] > v50;
            v27 = v47;
            if (v36 && v30 <= &v50[v48] && v35)
            {
              -[CRLWPMutableRangeArray removeRange:](self->_checkedRanges, "removeRange:", v46, v35);
              -[CRLWPMutableRangeArray addRange:](v47, "addRange:", v46, v35);
            }
            -[CRLWPMutableRangeArray addRange:](v47, "addRange:", v19, v21);
            if (v50 != (char *)0x7FFFFFFFFFFFFFFFLL || v48) {
              [(CRLWPMutableRangeArray *)v47 subtract:self->_checkedRanges];
            }
            v26 = (CRLWPMutableRangeArray *)v49;
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_1004EF148;
            v62[3] = &unk_1015010A0;
            v62[4] = self;
            id v37 = (id)objc_opt_new();
            id v63 = v37;
            [(CRLWPRangeArray *)v47 enumerateRanges:v62];
            [(CRLWPMutableRangeArray *)self->_checkedRanges subtract:v37];
            [v14 removeResultsForRanges:v37];
            [v15 removeResultsForRanges:v37];
            *(void *)buf = 0;
            *(void *)v65 = buf;
            *(void *)&v65[8] = 0x2020000000;
            v65[16] = 1;
            if ([v37 rangeCount])
            {
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = sub_1004EF198;
              v57[3] = &unk_1015010C8;
              v60 = buf;
              v57[4] = self;
              id v58 = v14;
              id v59 = v15;
              char v61 = 1;
              [v37 enumerateRanges:v57];
            }
            else
            {
              [(CRLWPMutableDirtyRangeArray *)self->_dirtyRanges clear];
            }
            if (*(unsigned char *)(*(void *)v65 + 24)) {
              [(CRLWPMutableRangeArray *)self->_checkedRanges unionWith:v37];
            }
            _Block_object_dispose(buf, 8);
          }
          else
          {
            v26 = -[CRLWPRangeArray initWithRange:]([CRLWPMutableRangeArray alloc], "initWithRange:", v19, v21);
            [(CRLWPMutableRangeArray *)v26 subtract:self->_checkedRanges];
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1004EF1DC;
            v55[3] = &unk_1015010A0;
            v55[4] = self;
            v27 = objc_alloc_init(CRLWPMutableRangeArray);
            v56 = v27;
            [(CRLWPRangeArray *)v26 enumerateRanges:v55];
            [v14 removeResultsForRanges:v27];
            [v15 removeResultsForRanges:v27];
            if ([(CRLWPRangeArray *)v27 rangeCount])
            {
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_1004EF22C;
              v51[3] = &unk_1015010F0;
              v51[4] = self;
              id v52 = v14;
              id v53 = v15;
              char v54 = 1;
              [(CRLWPRangeArray *)v27 enumerateRanges:v51];
            }
            else
            {
              [(CRLWPMutableDirtyRangeArray *)self->_dirtyRanges clear];
            }
            [(CRLWPMutableRangeArray *)self->_checkedRanges unionWith:v27];
          }
        }
        else if (-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:](self, "i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:", v19, v21, v14, v15, 1))
        {
          -[CRLWPMutableRangeArray concatenateRange:](self->_checkedRanges, "concatenateRange:", v19, v21);
        }
      }
      else
      {
        [(CRLWPMutableRangeArray *)self->_checkedRanges clear];
        [v14 clear];
        [v15 clear];
      }
      v38 = (char *)[(CRLWPRangeArray *)self->_checkedRanges superRange];
      uint64_t v40 = v39;
      id v41 = objc_loadWeakRetained((id *)p_storage);
      LODWORD(v38) = &v38[v40] > [v41 length];

      if (v38)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501110);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010BEC2C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501130);
        }
        v42 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker checkRange:synchronously:]");
        v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v43 file:v44 lineNumber:317 isFatal:0 description:"checked ranges exceed storage"];
      }
      [(CRLWPStorageSpellChecker *)self i_setResults:v14 grammarResults:v15 shouldSync:0];
    }
    else
    {
      unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501058);
      }
      id v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        id v45 = objc_loadWeakRetained((id *)p_storage);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v11;
        *(_WORD *)v65 = 2082;
        *(void *)&v65[2] = "-[CRLWPStorageSpellChecker checkRange:synchronously:]";
        *(_WORD *)&v65[10] = 2082;
        *(void *)&v65[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
        __int16 v66 = 1024;
        int v67 = 189;
        __int16 v68 = 2048;
        NSUInteger v69 = v10;
        __int16 v70 = 2048;
        id v71 = [v45 length];
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad text range past end of storage (%lu vs %lu)", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501078);
      }
      unsigned __int8 v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker checkRange:synchronously:]");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
      id v16 = objc_loadWeakRetained((id *)p_storage);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 189, 0, "Bad text range past end of storage (%lu vs %lu)", v10, [v16 length]);
    }
  }
}

- (BOOL)i_setResults:(id)a3 grammarResults:(id)a4 shouldSync:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004EF3D8;
  v13[3] = &unk_101501158;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  unsigned int v11 = objc_retainBlock(v13);
  LOBYTE(v7) = ((uint64_t (*)(void))v11[2])();

  return (char)v7;
}

- (BOOL)shouldCheckAtCharIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501178);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BECB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501198);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker shouldCheckAtCharIndex:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:358 isFatal:0 description:"Bogus char index"];
  }
  if ([(CRLWPStorageSpellChecker *)self dirtyRange] == (id)0x7FFFFFFFFFFFFFFFLL && v8 == 0) {
    return 0;
  }
  id v10 = [(CRLWPStorageSpellChecker *)self dirtyRange];
  return a3 >= (unint64_t)v10 && a3 - (unint64_t)v10 < v11;
}

- (BOOL)hasValidResultsForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  id v8 = [WeakRetained wordAtCharIndex:a3 includePreviousWord:1];
  NSUInteger v10 = v9;

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && v10 == 0)
  {
    BOOL v12 = 1;
    if (!a4) {
      return v12;
    }
  }
  else
  {
    BOOL v12 = [(CRLWPRangeArray *)self->_checkedRanges containsCharacterAtIndex:v8 inclusive:0];
    if (!a4) {
      return v12;
    }
  }
  if (v12)
  {
    a4->NSUInteger location = (NSUInteger)v8;
    a4->NSUInteger length = v10;
  }
  return v12;
}

- (BOOL)hasValidResultsForRange:(_NSRange)a3
{
  if (a3.length) {
    return [(CRLWPRangeArray *)self->_checkedRanges containsRange:a3.location];
  }
  else {
    return [(CRLWPRangeArray *)self->_checkedRanges containsCharacterAtIndex:a3.location inclusive:1];
  }
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v5 = 0;
  p_storage = &self->_storage;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  id v9 = [WeakRetained length];

  if ((unint64_t)v9 >= a3)
  {
    id v10 = objc_loadWeakRetained((id *)p_storage);
    id v11 = [v10 wordAtCharIndex:a3 includePreviousWord:1];
    NSUInteger v13 = v12;

    if (-[CRLWPRangeArray intersectsRange:](self->_checkedRanges, "intersectsRange:", v11, v13))
    {
      id v14 = [(CRLWPStorageSpellChecker *)self misspelledRanges];
      id v15 = [v14 rangesIntersecting:v11, v13];

      if ([v15 rangeCount])
      {
        uint64_t v6 = (uint64_t)[v15 rangeAtIndex:0];
        NSUInteger v5 = v16;
        if (!-[CRLWPRangeArray containsRange:](self->_checkedRanges, "containsRange:", v11, v13))
        {
          NSUInteger v5 = v13;
          uint64_t v6 = (uint64_t)v11;
        }
      }
    }
  }
  NSUInteger v17 = v6;
  NSUInteger v18 = v5;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)firstErrorInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v6 = 0;
  id v7 = [(CRLWPStorageSpellChecker *)self misspelledRanges];
  [v7 rangesIntersecting:location length];

  if ([v8 rangeCount])
  {
    v12.NSUInteger location = (NSUInteger)[v8 rangeAtIndex:0];
    v14.NSUInteger location = location;
    v14.NSUInteger length = length;
    NSRange v9 = NSIntersectionRange(v12, v14);
    NSUInteger v6 = v9.length;
    if (v9.length)
    {
      NSUInteger v5 = v9.location;
    }
    else
    {
      NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v6 = 0;
    }
  }

  NSUInteger v10 = v5;
  NSUInteger v11 = v6;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015011B8);
  }
  NSUInteger v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    NSUInteger v11 = (objc_class *)objc_opt_class();
    NSRange v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 67110146;
    unsigned int v24 = v9;
    __int16 v25 = 2082;
    v26 = "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]";
    __int16 v27 = 2082;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
    __int16 v29 = 1024;
    int v30 = 450;
    __int16 v31 = 2114;
    id v32 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015011D8);
  }
  NSUInteger v13 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    NSRange v14 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v24 = v9;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]");
  NSUInteger v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
  NSUInteger v17 = (objc_class *)objc_opt_class();
  NSUInteger v18 = NSStringFromClass(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 450, 0, "Abstract method not overridden by %{public}@", v18);

  id v19 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v19);
  uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v20, "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]");
  id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v21 userInfo:0];

  objc_exception_throw(v22);
}

- (void)i_resetSpellCheckingForNotification:(id)a3
{
  [(CRLWPMutableRangeArray *)self->_checkedRanges clear];
  [(CRLWPCheckingResults *)self->_spellingResults clear];
  [(CRLWPCheckingResults *)self->_grammarResults clear];
  dirtyRanges = self->_dirtyRanges;

  [(CRLWPMutableDirtyRangeArray *)dirtyRanges clear];
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015011F8);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    NSUInteger v5 = (objc_class *)objc_opt_class();
    NSUInteger v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v18 = v3;
    __int16 v19 = 2082;
    uint64_t v20 = "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]";
    __int16 v21 = 2082;
    id v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
    __int16 v23 = 1024;
    int v24 = 462;
    __int16 v25 = 2114;
    v26 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501218);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = v3;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  unsigned int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]");
  NSUInteger v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
  NSUInteger v11 = (objc_class *)objc_opt_class();
  NSRange v12 = NSStringFromClass(v11);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 462, 0, "Abstract method not overridden by %{public}@", v12);

  NSUInteger v13 = (objc_class *)objc_opt_class();
  NSRange v14 = NSStringFromClass(v13);
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v14, "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4
{
  id v6 = a4;
  if ((unint64_t)[v6 length] <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501238);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BEDC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501258);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]");
    unsigned int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:467 isFatal:0 description:"Locale string is too short."];
  }
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v11 = 0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501278);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BED3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501298);
    }
    NSRange v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    NSRange v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:471 isFatal:0 description:"Invalid charIndex."];
  }
  else
  {
    if (qword_1016A9E00 != -1) {
      dispatch_once(&qword_1016A9E00, &stru_1015012B8);
    }
    id v15 = &qword_1016A9DB0;
    if (([v6 hasPrefix:@"en"] & 1) == 0)
    {
      if ([v6 hasPrefix:@"fr"])
      {
        id v15 = &qword_1016A9DB8;
      }
      else if (([v6 hasPrefix:@"it"] & 1) != 0 {
             || ([v6 hasPrefix:@"gl"] & 1) != 0)
      }
      {
        id v15 = &qword_1016A9DC0;
      }
      else if ([v6 hasPrefix:@"pt"])
      {
        if ([v6 hasSuffix:@"BR"]) {
          id v15 = &qword_1016A9DD0;
        }
        else {
          id v15 = &qword_1016A9DC8;
        }
      }
      else if ([v6 hasPrefix:@"es"])
      {
        id v15 = &qword_1016A9DD8;
      }
      else if ([v6 hasPrefix:@"ca"])
      {
        id v15 = &qword_1016A9DE0;
      }
      else if ([v6 hasPrefix:@"el"])
      {
        id v15 = &qword_1016A9DE8;
      }
      else if ([v6 hasPrefix:@"nl"])
      {
        id v15 = &qword_1016A9DF0;
      }
      else if ([v6 hasPrefix:@"uk"])
      {
        id v15 = &qword_1016A9DF8;
      }
    }
    id v13 = (id)*v15;
    NSRange v14 = -[CRLWPStorageSpellChecker p_textSourceWithoutDeletionsWithSubRange:](self, "p_textSourceWithoutDeletionsWithSubRange:", 0, a3);
    id v16 = (char *)[v14 charIndexMappedFromStorage:a3];
    NSUInteger v17 = sub_1001CCC80(v16, 0, v14);
    if (v17 <= v16) {
      unsigned int v18 = v16;
    }
    else {
      unsigned int v18 = v17;
    }
    if (v17 >= v16) {
      __int16 v19 = v16;
    }
    else {
      __int16 v19 = v17;
    }
    uint64_t v20 = [v14 substringWithRange:v19, v18 - v19];
    __int16 v21 = +[NSCharacterSet decimalDigitCharacterSet];
    id v22 = (char *)[v20 rangeOfCharacterFromSet:v21 options:4];

    if (v22 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v23 = +[NSCharacterSet letterCharacterSet];
      BOOL v24 = [v20 rangeOfCharacterFromSet:v23 options:0 range:0] == (id)0x7FFFFFFFFFFFFFFFLL;

      if (v24)
      {
        __int16 v25 = [v20 substringFromIndex:v22];
        if ([v13 containsObject:v25])
        {
          unsigned int v26 = [v25 characterAtIndex:1];
          __int16 v27 = [v25 length];
          uint64_t v28 = -2;
          if (v26 != 46) {
            uint64_t v28 = -1;
          }
          uint64_t v10 = (uint64_t)[v14 charRangeMappedToStorage:v16 - &v27[v28]];
          NSUInteger v11 = v29;
        }
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          if (v22 && [v20 characterAtIndex:v22 - 1] == 49)
          {
            if (qword_1016A9E10 != -1) {
              dispatch_once(&qword_1016A9E10, &stru_1015012D8);
            }
            unsigned int v30 = [(id)qword_1016A9E08 containsObject:v25];
          }
          else
          {
            if (qword_1016A9E20[0] != -1) {
              dispatch_once(qword_1016A9E20, &stru_1015012F8);
            }
            unsigned int v30 = [(id)qword_1016A9E18 containsObject:v25];
          }
          if (v30)
          {
            uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
            NSUInteger v11 = 0;
          }
        }
      }
    }
  }
  NSUInteger v31 = v10;
  NSUInteger v32 = v11;
  result.NSUInteger length = v32;
  result.NSUInteger location = v31;
  return result;
}

- (void)findErrorsInRange:(_NSRange)a3 onHit:(id)a4 stop:(BOOL *)a5
{
  NSUInteger length = a3.length;
  NSUInteger v6 = a3.location;
  v49 = (void (**)(id, void *))a4;
  -[CRLWPStorageSpellChecker checkRange:synchronously:](self, "checkRange:synchronously:", v6, length, 1);
  id v52 = [(CRLWPStorageSpellChecker *)self misspelledRanges];
  v51 = [(CRLWPStorageSpellChecker *)self ungrammaticRanges];
  id v8 = [v52 indexForRange:v6 length];
  id v9 = [v51 indexForRange:v6 length:length];
  if (!*a5)
  {
    unint64_t v11 = (unint64_t)v9;
    unint64_t v47 = v6 + length;
    NSUInteger location = (id *)&self->_storage;
    *(void *)&long long v10 = 67109378;
    long long v45 = v10;
    do
    {
      if ((v8 >= objc_msgSend(v52, "rangeCount", v45) || (unint64_t)objc_msgSend(v52, "rangeAtIndex:", v8) >= v47)
        && (v11 >= (unint64_t)[v51 rangeCount]
         || (unint64_t)[v51 rangeAtIndex:v11] >= v47))
      {
        break;
      }
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v12 = 0;
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v15 = 0;
      if (v8 < [v52 rangeCount])
      {
        unint64_t v14 = (unint64_t)[v52 rangeAtIndex:v8];
        uint64_t v15 = v16;
      }
      if (v11 < (unint64_t)[v51 rangeCount])
      {
        unint64_t v13 = (unint64_t)[v51 rangeAtIndex:v11];
        uint64_t v12 = v17;
      }
      if (v14 <= v13)
      {
        uint64_t v28 = [(CRLWPStorageSpellChecker *)self spellingErrors];
        v50 = [v28 objectAtIndexedSubscript:v8];

        __int16 v25 = 0;
        __int16 v21 = v8 + 1;
      }
      else
      {
        unsigned int v18 = (objc_class *)objc_opt_class();
        __int16 v19 = [(CRLWPStorageSpellChecker *)self grammarResults];
        uint64_t v20 = [v19 objectAtIndexedSubscript:v11];
        __int16 v21 = v8;
        id v22 = sub_10024715C(v18, v20);

        __int16 v23 = (objc_class *)objc_opt_class();
        BOOL v24 = [v22 first];
        __int16 v25 = sub_10024715C(v23, v24);

        unsigned int v26 = (objc_class *)objc_opt_class();
        __int16 v27 = [v22 second];
        v50 = sub_10024715C(v26, v27);

        ++v11;
        unint64_t v14 = v13;
        uint64_t v15 = v12;
      }
      id v29 = (id)objc_opt_class();
      unsigned int v30 = [(CRLWPStorageSpellChecker *)self searchCanvasDelegate];
      if (v30)
      {
        NSUInteger v31 = [(CRLWPStorageSpellChecker *)self searchCanvasDelegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          uint64_t v33 = [(CRLWPStorageSpellChecker *)self searchCanvasDelegate];
          id WeakRetained = objc_loadWeakRetained(location);
          id v29 = [v33 wpSelectionClassForStorage:WeakRetained];
        }
      }
      uint64_t v35 = [(CRLWPStorageSpellChecker *)self searchCanvasDelegate];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        unsigned int v41 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501318);
        }
        v42 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          unsigned int v54 = v41;
          __int16 v55 = 2082;
          v56 = "-[CRLWPStorageSpellChecker findErrorsInRange:onHit:stop:]";
          __int16 v57 = 2082;
          id v58 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
          __int16 v59 = 1024;
          int v60 = 711;
          _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No selection path will be provided to this search reference!", buf, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501338);
        }
        v43 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
        {
          v44 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = v45;
          unsigned int v54 = v41;
          __int16 v55 = 2114;
          v56 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        id v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker findErrorsInRange:onHit:stop:]");
        v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:711 isFatal:0 description:"No selection path will be provided to this search reference!"];
        uint64_t v40 = 0;
      }
      else
      {
        id v37 = objc_loadWeakRetained(location);
        v38 = [v29 selectionWithRange:v14, v15];
        uint64_t v39 = [(CRLWPStorageSpellChecker *)self searchCanvasDelegate];
        uint64_t v40 = +[CRLWPSearchReference searchReferenceWithStorage:v37 selection:v38 searchCanvasDelegate:v39];
      }
      v49[2](v49, v40);

      id v8 = v21;
    }
    while (!*a5);
  }
}

- (_NSRange)dirtyRange
{
  id v2 = [(CRLWPDirtyRangeArray *)self->_dirtyRanges superRange];
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (void)i_addMisspelledWord:(id)a3 atIndex:(unint64_t)a4 ifValidForRange:(_NSRange)a5 toResults:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  uint64_t v12 = [WeakRetained smartFieldAtCharIndex:location attributeKind:6 effectiveRange:0];

  if (!v12 && location <= 0x7FFFFFFFFFFFFFFELL) {
    [v10 addResult:v13 forRange:location, length];
  }
}

- (CRLSearchCanvasDelegate)searchCanvasDelegate
{
  return self->_searchCanvasDelegate;
}

- (void)setSearchCanvasDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCanvasDelegate, 0);
  objc_storeStrong((id *)&self->_dirtyRanges, 0);
  objc_storeStrong((id *)&self->_grammarResults, 0);
  objc_storeStrong((id *)&self->_spellingResults, 0);
  objc_storeStrong((id *)&self->_checkedRanges, 0);

  objc_destroyWeak((id *)&self->_storage);
}

@end