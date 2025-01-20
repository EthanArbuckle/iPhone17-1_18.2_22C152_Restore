@interface CRLWPiOSStorageSpellChecker
+ (BOOL)canCheckSpelling;
+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5;
+ (id)p_determineLanguage;
+ (id)p_language;
+ (void)initialize;
+ (void)p_inputLanguageDidChangeNotification:(id)a3;
- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6;
- (CRLWPiOSStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5;
- (UITextChecker)textChecker;
- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3;
- (id)suggestionsForRange:(_NSRange)a3;
- (void)dealloc;
- (void)setTextChecker:(id)a3;
@end

@implementation CRLWPiOSStorageSpellChecker

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:a1 selector:"p_inputLanguageDidChangeNotification:" name:UITextInputCurrentInputModeDidChangeNotification object:0];

    id v8 = +[UIApplication sharedApplication];
    v4 = [v8 textInputMode];
    v5 = [v4 primaryLanguage];
    id v6 = [v5 copy];
    v7 = (void *)qword_1016A9120;
    qword_1016A9120 = (uint64_t)v6;
  }
}

+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CRLWPiOSStorageSpellChecker alloc] initWithStorage:v9 selectionPath:v8 orSearchCanvasDelegate:v7];

  return v10;
}

- (id)suggestionsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(CRLWPStorageSpellChecker *)self p_textSourceWithoutDeletionsWithSubRange:"p_textSourceWithoutDeletionsWithSubRange:"];
  id v7 = [v6 charRangeMappedFromStorage:location length:length];
  if (v8)
  {
    id v9 = v7;
    uint64_t v10 = v8;
    v11 = [(CRLWPiOSStorageSpellChecker *)self textChecker];
    v12 = [v6 string];
    v13 = +[CRLWPiOSStorageSpellChecker p_language];
    v14 = [v11 guessesForWordRange:v9 inString:v10 language:v12];
  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

+ (BOOL)canCheckSpelling
{
  v2 = [a1 p_language];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (void)p_inputLanguageDidChangeNotification:(id)a3
{
  id v4 = a3;
  byte_101719C80 = 0;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8A00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107CE80();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8A20);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPiOSStorageSpellChecker p_inputLanguageDidChangeNotification:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:74 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  uint64_t v8 = +[UIApplication sharedApplication];
  id v9 = [v8 textInputMode];
  uint64_t v10 = [v9 primaryLanguage];

  id v11 = a1;
  objc_sync_enter(v11);
  id v12 = (id)qword_1016A9120;
  objc_storeStrong((id *)&qword_1016A9120, v10);
  objc_sync_exit(v11);

  if (!v12 || ([v10 isEqualToString:v12] & 1) == 0)
  {
    v13.receiver = v11;
    v13.super_class = (Class)&OBJC_METACLASS___CRLWPiOSStorageSpellChecker;
    [super p_inputLanguageDidChangeNotification:v4];
  }
}

+ (id)p_determineLanguage
{
  BOOL v3 = +[UITextChecker availableLanguages];
  id v4 = [v3 copy];

  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = (id)qword_1016A9120;
  objc_sync_exit(v5);

  if (v6 && [v6 length])
  {
    id v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if ([v4 containsObject:v7])
    {
      id v7 = v7;
      id v8 = v7;
    }
    else if ((unint64_t)[v7 length] < 2)
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v10 = [v7 substringWithRange:0, 2];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v4;
      id v8 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v11);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v14, "rangeOfString:", v10, (void)v17)) {
              BOOL v16 = 0;
            }
            else {
              BOOL v16 = v15 == 2;
            }
            if (v16)
            {
              id v8 = v14;
              goto LABEL_24;
            }
          }
          id v8 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_24:
    }
  }
  else
  {
    id v8 = [v4 firstObject];
    id v7 = v6;
  }

  return v8;
}

+ (id)p_language
{
  if (!byte_101719C80)
  {
    v2 = [a1 p_determineLanguage];
    id v3 = [v2 copy];
    id v4 = (void *)qword_1016A9128;
    qword_1016A9128 = (uint64_t)v3;

    byte_101719C80 = 1;
  }
  id v5 = (void *)qword_1016A9128;

  return v5;
}

- (CRLWPiOSStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8A40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107CF14();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8A60);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPiOSStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:]");
    objc_super v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 149, 0, "invalid nil value for '%{public}s'", "storage");
  }
  v25.receiver = self;
  v25.super_class = (Class)CRLWPiOSStorageSpellChecker;
  v14 = [(CRLWPStorageSpellChecker *)&v25 initWithStorage:v8 selectionPath:v9 orSearchCanvasDelegate:v10];
  uint64_t v15 = v14;
  BOOL v16 = 0;
  if (v8 && v14)
  {
    long long v17 = (UITextChecker *)objc_alloc_init((Class)UITextChecker);
    textChecker = v15->_textChecker;
    v15->_textChecker = v17;

    uint64_t v19 = [objc_opt_class() p_language];
    language = v15->_language;
    v15->_language = (NSString *)v19;

    v21 = objc_alloc_init(CRLWPSpellingResults);
    spellingResults = v15->super._spellingResults;
    v15->super._spellingResults = v21;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v15 selector:"i_resetSpellCheckingForNotification:" name:@"CRLWPSpellCheckingLearnedWordsChangedNotification" object:0];

    BOOL v16 = v15;
  }

  return v16;
}

- (void)dealloc
{
  [(CRLWPStorageSpellChecker *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPiOSStorageSpellChecker;
  [(CRLWPStorageSpellChecker *)&v3 dealloc];
}

- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    id v10 = -[CRLWPStorageSpellChecker p_textSourceWithoutDeletionsWithSubRange:](self, "p_textSourceWithoutDeletionsWithSubRange:", location, length);
    id v11 = [v10 string];
    uint64_t v12 = [(char *)[v10 charRangeMappedFromStorage:location length:length]];
    uint64_t v14 = v13;
    unint64_t v15 = (unint64_t)&v12[v13];
    if (&v12[v13] > [v11 length])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8A80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CFC4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8AA0);
      }
      BOOL v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v16);
      }
      long long v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPiOSStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:177 isFatal:0 description:"attempt to spellcheck past end of string"];
    }
    if (v15 <= (unint64_t)[v11 length])
    {
      uint64_t v19 = +[CRLWPiOSStorageSpellChecker p_language];
      [(CRLWPiOSStorageSpellChecker *)self textChecker];
      id v36 = v9;
      long long v20 = v37 = v11;
      v21 = v11;
      v22 = (void *)v19;
      v23 = v10;
      v24 = self;
      objc_super v25 = (char *)[v20 rangeOfMisspelledWordInString:v21 range:v12 startingAt:v14 wrap:v12 language:0];
      uint64_t v27 = v26;

      while (v25 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        id v28 = [v23 charRangeMappedToStorage:v25, v27];
        uint64_t v30 = v29;
        [v23 substringWithRange:v28, v29];
        v32 = v31 = v12;
        -[CRLWPStorageSpellChecker i_addMisspelledWord:atIndex:ifValidForRange:toResults:](v24, "i_addMisspelledWord:atIndex:ifValidForRange:toResults:", v32, 0x7FFFFFFFFFFFFFFFLL, v28, v30, v36);

        uint64_t v12 = v31;
        v33 = [(CRLWPiOSStorageSpellChecker *)v24 textChecker];
        objc_super v25 = (char *)[v33 rangeOfMisspelledWordInString:v37 range:v31 startingAt:v14 wrap:0 language:v22];
        uint64_t v27 = v34;
      }
      id v9 = v36;
      id v11 = v37;
      id v10 = v23;
    }
  }
  return 1;
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 textInputMode];
  id v7 = [v6 primaryLanguage];

  id v8 = [(CRLWPStorageSpellChecker *)self rangeOfNumericalSuffixPrecedingCharIndex:a3 forLocale:v7];
  NSUInteger v10 = v9;

  NSUInteger v11 = (NSUInteger)v8;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_textChecker, 0);
}

@end