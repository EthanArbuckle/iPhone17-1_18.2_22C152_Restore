@interface UITextChecker
+ (BOOL)_forgetWord:(id)a3 inDictionary:(id)a4;
+ (BOOL)_isWord:(id)a3 inDictionary:(id)a4;
+ (BOOL)_learnWord:(id)a3 inDictionary:(id)a4;
+ (BOOL)grammarCheckingEnabled;
+ (BOOL)grammarCheckingEnabledForLanguage:(id)a3;
+ (BOOL)hasLearnedWord:(NSString *)word;
+ (NSArray)availableLanguages;
+ (__CFSet)createDictHashTable:(BOOL)a3;
+ (id)_dictionaryEntryForName:(id)a3;
+ (id)_wordsInDictionary:(id)a3;
+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5;
+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5 insertionPointIndex:(unint64_t)a6 scriptForBestLanguage:(id *)a7;
+ (id)dictionaryInfo:(id)a3;
+ (id)grammarAutocorrectionForWord:(id)a3;
+ (id)keyboardLanguages;
+ (id)openUserDictionary:(id)a3;
+ (id)postEditor;
+ (int64_t)uniqueSpellDocumentTag;
+ (void)_setDictionaryEntry:(id)a3 forName:(id)a4;
+ (void)_setWords:(id)a3 inDictionary:(id)a4;
+ (void)handleGrammarCorrectionEntries:(id)a3;
+ (void)learnWord:(NSString *)word;
+ (void)noteTextReplacement:(id)a3;
+ (void)noteWordTerminator:(id)a3 replacement:(id)a4;
+ (void)performFinalGrammarChecking;
+ (void)setString:(id)a3 isExemptFromChecker:(BOOL)a4;
+ (void)unlearnWord:(NSString *)word;
- (BOOL)_doneLoading;
- (BOOL)canChangeCaseOfFirstLetterInString:(id)a3 toUpperCase:(BOOL)a4 language:(id)a5;
- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4;
- (NSArray)completionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language;
- (NSArray)guessesForWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language;
- (NSArray)ignoredWords;
- (NSRange)rangeOfMisspelledWordInString:(NSString *)stringToCheck range:(NSRange)range startingAt:(NSInteger)startingOffset wrap:(BOOL)wrapFlag language:(NSString *)language;
- (UITextChecker)init;
- (_NSRange)_chunkAndCheckGrammarInString:(id)a3 language:(id)a4 usingChecker:(id)a5 details:(id *)a6;
- (_NSRange)_chunkAndFindMisspelledWordInString:(id)a3 languages:(id)a4 learnedDictionaries:(id)a5 wordCount:(int64_t *)a6 correction:(id *)a7 usingChecker:(id)a8;
- (_NSRange)checkGrammarOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 details:(id *)a7;
- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7;
- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 languages:(id)a5 wrap:(BOOL)a6 correction:(id *)a7;
- (_NSRange)rangeOfMisspelledWordInString:(id)a3 range:(_NSRange)a4 startingAt:(int64_t)a5 wrap:(BOOL)a6 languages:(id)a7;
- (id)_checker;
- (id)_initWithAsynchronousLoading:(BOOL)a3;
- (id)_nameOfDictionaryForDocumentTag:(int64_t)a3;
- (id)alternativesForPinyinInputString:(id)a3;
- (id)checkString:(id)a3 range:(_NSRange)a4 types:(unint64_t)a5 languages:(id)a6 options:(id)a7;
- (id)correctionForWordRange:(_NSRange)a3 inString:(id)a4 language:(id)a5;
- (id)finalResultsFromCheckingString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6;
- (id)grammarAlternativesForString:(id)a3;
- (id)grammarGuessesForRange:(_NSRange)a3 inString:(id)a4 language:(id)a5;
- (id)postEditor;
- (id)stringForInputString:(id)a3 language:(id)a4;
- (id)suggestWordInLanguage:(id)a3;
- (int64_t)adjustOffsetToNextWordBoundaryInString:(id)a3 startingAt:(int64_t)a4;
- (int64_t)requestGrammarCheckingOfString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)_setDocumentDictionaryName:(id)a3;
- (void)_setLanguageDictionaryName:(id)a3;
- (void)dealloc;
- (void)ignoreWord:(NSString *)wordToIgnore;
- (void)initGlobalsWithAsynchronousLoading:(BOOL)a3;
- (void)initPostEditingWithAsynchronousLoading:(BOOL)a3;
- (void)initUserDictionaries;
- (void)recordResponse:(unint64_t)a3 toGrammarDetailInAnnotatedString:(id)a4 range:(_NSRange)a5;
- (void)releaseAllLexicons;
- (void)resetAllLanguageModels;
- (void)setIgnoredWords:(NSArray *)ignoredWords;
@end

@implementation UITextChecker

+ (BOOL)grammarCheckingEnabled
{
  if (qword_1EB25D698 != -1) {
    dispatch_once(&qword_1EB25D698, &__block_literal_global_505_1);
  }
  return byte_1EB25D5EA;
}

+ (int64_t)uniqueSpellDocumentTag
{
  return uniqueSpellDocumentTag_nextSpellCheckerTag++;
}

- (id)_nameOfDictionaryForDocumentTag:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%10d->0x%10lx", getpid(), a3);
}

- (void)_setLanguageDictionaryName:(id)a3
{
}

- (void)_setDocumentDictionaryName:(id)a3
{
}

- (void)initUserDictionaries
{
  if (!qword_1EB25D5F8)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    v4 = (void *)qword_1EB25D5F8;
    qword_1EB25D5F8 = v3;

    [(id)qword_1EB25D5F8 addObject:*MEMORY[0x1E4F283E0]];
    [(id)qword_1EB25D5F8 addObject:@"en_US"];
    v5 = (void *)qword_1EB25D5F8;
    v6 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:0];
    [v5 addObject:v6];
  }
  if (!qword_1EB25D600)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v8 = (void *)qword_1EB25D600;
    qword_1EB25D600 = v7;
  }
  if (!qword_1EB25D608)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UITextChecker.dictionaries", 0);
    v10 = (void *)qword_1EB25D608;
    qword_1EB25D608 = (uint64_t)v9;
  }
}

- (void)initGlobalsWithAsynchronousLoading:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)MEMORY[0x18C108260](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v7 = (void *)qword_1EB25D5F0;
  qword_1EB25D5F0 = (uint64_t)v6;

  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4BE58]) initWithMaximumCapacity:512];
  dispatch_queue_t v9 = (void *)qword_1EB25D620;
  qword_1EB25D620 = v8;

  [(UITextChecker *)self initUserDictionaries];
  id v10 = objc_alloc_init((Class)getAppleSpellClass());
  v11 = (void *)qword_1EB25D610;
  qword_1EB25D610 = (uint64_t)v10;

  [(id)qword_1EB25D610 spellServer:0 findMisspelledWordInString:@"abcxyz" language:self->_checkerWarmingLanguage wordCount:0 countOnly:0 correction:0];
  if (v3) {
    dispatch_sync(MEMORY[0x1E4F14428], &__block_literal_global_586);
  }
  else {
    _MergedGlobals_7_11 = 1;
  }
}

void __52__UITextChecker_initGlobalsWithAsynchronousLoading___block_invoke()
{
  _MergedGlobals_7_11 = 1;
}

- (void)initPostEditingWithAsynchronousLoading:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)MEMORY[0x18C108260](self, a2);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)qword_1EB25D688;
  uint64_t v15 = qword_1EB25D688;
  if (!qword_1EB25D688)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getTCPostEditorClass_block_invoke;
    v11[3] = &unk_1E52D9900;
    v11[4] = &v12;
    __getTCPostEditorClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = [v6 alloc];
  uint64_t v8 = [v7 initWithChecker:qword_1EB25D610];
  dispatch_queue_t v9 = (void *)qword_1EB25D618;
  qword_1EB25D618 = v8;

  id v10 = (id)objc_msgSend((id)qword_1EB25D618, "grammarDetailForString:range:language:", @"This is a test. This is another.", 16, 4, @"en");
  if (v3) {
    dispatch_sync(MEMORY[0x1E4F14428], &__block_literal_global_77_2);
  }
  else {
    byte_1EB25D5E9 = 1;
  }
}

void __56__UITextChecker_initPostEditingWithAsynchronousLoading___block_invoke()
{
  byte_1EB25D5E9 = 1;
}

- (UITextChecker)init
{
  return (UITextChecker *)[(UITextChecker *)self _initWithAsynchronousLoading:0];
}

- (id)_initWithAsynchronousLoading:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UITextChecker;
  v4 = [(UITextChecker *)&v13 init];
  v4->_usdt = +[UITextChecker uniqueSpellDocumentTag];
  v5 = [(id)objc_opt_class() availableLanguages];
  uint64_t v6 = [v5 firstObject];
  checkerWarmingLanguage = v4->_checkerWarmingLanguage;
  v4->_checkerWarmingLanguage = (NSString *)v6;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke;
  v10[3] = &unk_1E52D9FC0;
  BOOL v12 = a3;
  uint64_t v8 = v4;
  v11 = v8;
  if (_initWithAsynchronousLoading__onceToken != -1) {
    dispatch_once(&_initWithAsynchronousLoading__onceToken, v10);
  }

  return v8;
}

void __46__UITextChecker__initWithAsynchronousLoading___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = dispatch_get_global_queue(17, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke_2;
    v7[3] = &unk_1E52D9F70;
    BOOL v3 = &v8;
    id v8 = *(id *)(a1 + 32);
    v4 = v7;
  }
  else
  {
    [*(id *)(a1 + 32) initGlobalsWithAsynchronousLoading:0];
    if (!+[UITextChecker grammarCheckingEnabled]) {
      return;
    }
    v2 = dispatch_get_global_queue(17, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke_3;
    v5[3] = &unk_1E52D9F70;
    BOOL v3 = &v6;
    id v6 = *(id *)(a1 + 32);
    v4 = v5;
  }
  dispatch_async(v2, v4);
}

uint64_t __46__UITextChecker__initWithAsynchronousLoading___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) initGlobalsWithAsynchronousLoading:1];
  uint64_t result = +[UITextChecker grammarCheckingEnabled];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 initPostEditingWithAsynchronousLoading:1];
  }
  return result;
}

uint64_t __46__UITextChecker__initWithAsynchronousLoading___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) initPostEditingWithAsynchronousLoading:1];
}

- (BOOL)_doneLoading
{
  return _MergedGlobals_7_11;
}

- (void)dealloc
{
  [(UITextChecker *)self setIgnoredWords:0];
  v3.receiver = self;
  v3.super_class = (Class)UITextChecker;
  [(UITextChecker *)&v3 dealloc];
}

- (id)_checker
{
  if (_MergedGlobals_7_11) {
    return (id)qword_1EB25D610;
  }
  else {
    return 0;
  }
}

- (void)resetAllLanguageModels
{
  uint64_t v2 = [(UITextChecker *)self _checker];
  objc_super v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    objc_super v3 = v5;
    if (v4)
    {
      objc_msgSend((id)qword_1EB25D5F0, "lock", v5);
      [v5 resetAllLanguageModels];
      [(id)qword_1EB25D5F0 unlock];
      objc_super v3 = v5;
    }
  }
}

- (void)releaseAllLexicons
{
  uint64_t v2 = [(UITextChecker *)self _checker];
  objc_super v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    objc_super v3 = v5;
    if (v4)
    {
      objc_msgSend((id)qword_1EB25D5F0, "lock", v5);
      [v5 releaseAllLexicons];
      [(id)qword_1EB25D5F0 unlock];
      objc_super v3 = v5;
    }
  }
}

+ (NSArray)availableLanguages
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  getAppleSpellClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_super v3 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ar", @"ars", @"bg_BG", @"cs_CZ", @"da_DK", @"de_DE", @"el_GR", @"en_AU", @"en_CA", @"en_GB", @"en_IN", @"en_NZ", @"en_SG", @"en_US", @"en_ZA", @"es_ES", @"es_MX",
      @"fi_FI",
      @"fr_FR",
      @"ga_IE",
      @"hi",
      @"hu_HU",
      @"it_IT",
      @"nb_NO",
      @"nl_NL",
      @"nn",
      @"pa",
      @"pl_PL",
      @"pt_BR",
      @"pt_PT",
      @"ro_RO",
      @"ru_RU",
      @"sv_SE",
      @"te",
      @"tr_TR",
      @"uk_UA",
      @"vi_VN",
    char v4 = 0);

    goto LABEL_7;
  }
  uint64_t v2 = [getAppleSpellClass() availableLanguages];
  objc_super v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  char v4 = v2;
  if (![v2 count]) {
    goto LABEL_6;
  }
LABEL_7:
  v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = UIKeyboardGetCurrentInputMode();
  if (v7)
  {
    id v8 = TIInputModeGetNormalizedIdentifier();
    if (v8)
    {
      dispatch_queue_t v9 = [v5 member:v8];

      if (v9)
      {
        [v6 addObject:v8];
        [v5 removeObject:v8];
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = (id)UIKeyboardActiveInputModes;
  v11 = v10;
  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = TIInputModeGetNormalizedIdentifier();
          if ([v5 containsObject:v16])
          {
            [v6 addObject:v16];
            [v5 removeObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  v17 = [v5 allObjects];
  [v6 addObjectsFromArray:v17];

  return (NSArray *)v6;
}

+ (id)keyboardLanguages
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[UIKeyboardInputModeController sharedInputModeController];
  objc_super v3 = [v2 currentInputMode];

  char v4 = [v3 multilingualLanguages];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 multilingualLanguages];
  }
  else
  {
    id v7 = [v3 primaryLanguage];

    if (v7)
    {
      id v8 = [v3 languageWithRegion];
      v16[0] = v8;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  dispatch_queue_t v9 = +[UIDictationController sharedInstance];
  id v10 = [v9 detectedLanguage];

  v11 = +[UIDictationController sharedInstance];
  uint64_t v12 = [v11 language];

  if (v10)
  {
    uint64_t v13 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if ([v6 containsObject:v13]) {
      goto LABEL_14;
    }
    uint64_t v14 = [v6 arrayByAddingObject:v13];
  }
  else
  {
    if (!v12 || ([v6 containsObject:v12] & 1) != 0)
    {
      uint64_t v13 = 0;
      goto LABEL_14;
    }
    uint64_t v14 = [v6 arrayByAddingObject:v12];
    uint64_t v13 = 0;
  }

  id v6 = (void *)v14;
LABEL_14:

  return v6;
}

- (int64_t)adjustOffsetToNextWordBoundaryInString:(id)a3 startingAt:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if (a4 >= 1)
  {
    int64_t v7 = v6;
    unint64_t v8 = v6 - a4;
    if (v6 > a4)
    {
      if (qword_1EB25D630 != -1) {
        dispatch_once(&qword_1EB25D630, &__block_literal_global_207_1);
      }
      if ((objc_msgSend((id)qword_1EB25D628, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", a4)) & 1) == 0)
      {
        int64_t v9 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", qword_1EB25D628, 0, a4, v8);
        if (v10) {
          a4 = v9;
        }
        else {
          a4 = v7;
        }
      }
    }
  }

  return a4;
}

void __67__UITextChecker_adjustOffsetToNextWordBoundaryInString_startingAt___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v1 = (void *)qword_1EB25D628;
  qword_1EB25D628 = v0;

  uint64_t v2 = (void *)qword_1EB25D628;
  id v3 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v2 formUnionWithCharacterSet:v3];
}

- (_NSRange)_chunkAndCheckGrammarInString:(id)a3 language:(id)a4 usingChecker:(id)a5 details:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  NSUInteger v13 = NSPageSize();
  unint64_t v14 = [v10 length];
  v37 = v10;
  if (v13 <= v14)
  {
    unint64_t v23 = v14;
    v35 = a6;
    v36 = v12;
    if (v14)
    {
      unint64_t v24 = 0;
      id v19 = 0;
      v25 = 0;
      NSUInteger v26 = v13;
      while (1)
      {
        if (v26 + v24 >= v23)
        {
          v27 = v37;
        }
        else
        {
          v27 = v37;
          uint64_t v28 = objc_msgSend(v37, "paragraphRangeForRange:", v24, v26);
          if (v28 + v29 > v26 + v24) {
            NSUInteger v26 = v28 + v29 - v24;
          }
        }
        long long v20 = objc_msgSend(v27, "substringWithRange:", v24, v26);

        id v38 = 0;
        uint64_t v30 = [v36 spellServer:self checkGrammarInString:v20 language:v11 details:&v38];
        NSUInteger v22 = v31;
        id v32 = v38;
        id v19 = v32;
        if (v22)
        {
          if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
        }
        v24 += v26;
        if (v24 + v13 <= v23) {
          NSUInteger v26 = v13;
        }
        else {
          NSUInteger v26 = v23 - v24;
        }
        v25 = v20;
        if (v23 <= v24) {
          goto LABEL_28;
        }
      }
      if (v35) {
        id *v35 = v32;
      }
      uint64_t v15 = v30 + v24;
      id v12 = v36;
    }
    else
    {
      long long v20 = 0;
      id v19 = 0;
LABEL_28:
      id v12 = v36;
      NSUInteger v22 = 0;
      if (v35) {
        id *v35 = 0;
      }
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    id v39 = 0;
    uint64_t v15 = [v12 spellServer:self checkGrammarInString:v10 language:v11 details:&v39];
    NSUInteger v17 = v16;
    id v18 = v39;
    id v19 = v18;
    long long v20 = 0;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v21 = 0;
    }
    else {
      NSUInteger v21 = v17;
    }
    if (v17) {
      NSUInteger v22 = v21;
    }
    else {
      NSUInteger v22 = 0;
    }
    if (!v17) {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (a6 && v22)
    {
      id v19 = v18;
      long long v20 = 0;
      *a6 = v19;
      NSUInteger v22 = v21;
    }
  }

  NSUInteger v33 = v15;
  NSUInteger v34 = v22;
  result.length = v34;
  result.location = v33;
  return result;
}

- (_NSRange)_chunkAndFindMisspelledWordInString:(id)a3 languages:(id)a4 learnedDictionaries:(id)a5 wordCount:(int64_t *)a6 correction:(id *)a7 usingChecker:(id)a8
{
  id v12 = a3;
  id v33 = a4;
  id v32 = a8;
  NSUInteger v13 = NSPageSize();
  unint64_t v14 = [v12 length];
  uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if (a6) {
    *a6 = -1;
  }
  uint64_t v34 = 0;
  if (v13 <= v14)
  {
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14)
    {
      unint64_t v21 = 0;
      NSUInteger v22 = 0;
      NSUInteger v23 = v13;
      while (1)
      {
        if (v23 && v21 + v23 < v14)
        {
          while ((objc_msgSend(v15, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v21 - 1 + v23)) & 1) == 0)
          {
            if (!--v23)
            {
              if (v21 + v13 <= v14) {
                NSUInteger v23 = v13;
              }
              else {
                NSUInteger v23 = v14 - v21;
              }
              break;
            }
          }
        }
        else
        {
          if (v21 + v13 <= v14) {
            NSUInteger v24 = v13;
          }
          else {
            NSUInteger v24 = v14 - v21;
          }
          if (!v23) {
            NSUInteger v23 = v24;
          }
        }
        v25 = objc_msgSend(v12, "substringWithRange:", v21, v23);

        uint64_t v26 = [v32 spellServer:self findMisspelledWordInString:v25 languages:v33 wordCount:&v34 countOnly:0 correction:a7];
        NSUInteger v20 = v27;
        if (a6) {
          *a6 = (*a6 & ~((*a6 | v34) >> 63)) + v34;
        }
        if (v27 && v26 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        v21 += v23;
        if (v21 + v13 <= v14) {
          NSUInteger v23 = v13;
        }
        else {
          NSUInteger v23 = v14 - v21;
        }
        NSUInteger v22 = v25;
        if (v14 <= v21)
        {

          NSUInteger v20 = 0;
          uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_39;
        }
      }
      uint64_t v30 = v26 + v21;
    }
    else
    {
      NSUInteger v20 = 0;
    }
  }
  else
  {
    uint64_t v16 = [v32 spellServer:self findMisspelledWordInString:v12 languages:v33 wordCount:&v34 countOnly:0 correction:a7];
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v17 == 0) {
      NSUInteger v20 = 0;
    }
    else {
      NSUInteger v20 = v17;
    }
    if (v17) {
      uint64_t v18 = v16;
    }
    uint64_t v30 = v18;
    if (a6) {
      *a6 = v34;
    }
  }
LABEL_39:

  NSUInteger v28 = v30;
  NSUInteger v29 = v20;
  result.length = v29;
  result.location = v28;
  return result;
}

- (_NSRange)rangeOfMisspelledWordInString:(id)a3 range:(_NSRange)a4 startingAt:(int64_t)a5 wrap:(BOOL)a6 languages:(id)a7
{
  BOOL v8 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  id v14 = a7;
  uint64_t v15 = [v13 length];
  if (location || v15 != length)
  {
    id v19 = (void *)MEMORY[0x18C108260](v15);
    NSUInteger v20 = objc_msgSend(v13, "substringWithRange:", location, length);
    if (location + length < a5 && v8) {
      NSUInteger v21 = 0;
    }
    else {
      NSUInteger v21 = a5 - location;
    }
    if (a5 >= location) {
      NSUInteger v22 = v21;
    }
    else {
      NSUInteger v22 = 0;
    }
    uint64_t v23 = [(UITextChecker *)self checkSpellingOfString:v20 startingAt:v22 languages:v14 wrap:v8 correction:0];
    NSUInteger v18 = v24;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v16 = v23 + location;
    }
  }
  else
  {
    uint64_t v16 = [(UITextChecker *)self checkSpellingOfString:v13 startingAt:a5 languages:v14 wrap:v8 correction:0];
    NSUInteger v18 = v17;
  }

  NSUInteger v25 = v16;
  NSUInteger v26 = v18;
  result.NSUInteger length = v26;
  result.NSUInteger location = v25;
  return result;
}

- (NSRange)rangeOfMisspelledWordInString:(NSString *)stringToCheck range:(NSRange)range startingAt:(NSInteger)startingOffset wrap:(BOOL)wrapFlag language:(NSString *)language
{
  BOOL v8 = wrapFlag;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v13 = stringToCheck;
  if (language)
  {
    language = [MEMORY[0x1E4F1C978] arrayWithObject:language];
  }
  uint64_t v14 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v13, location, length, startingOffset, v8, language);
  NSUInteger v16 = v15;

  NSUInteger v17 = v14;
  NSUInteger v18 = v16;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  if (a5)
  {
    a5 = [MEMORY[0x1E4F1C978] arrayWithObject:a5];
  }
  uint64_t v13 = [(UITextChecker *)self checkSpellingOfString:v12 startingAt:a4 languages:a5 wrap:v8 correction:a7];
  NSUInteger v15 = v14;

  NSUInteger v16 = v13;
  NSUInteger v17 = v15;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 languages:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  uint64_t v45 = -1;
  v42 = v11;
  unint64_t v13 = [v11 length];
  v41 = v12;
  NSUInteger v14 = [v12 firstObject];
  NSUInteger v15 = v14;
  if (a7) {
    *a7 = 0;
  }
  id v16 = 0;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v18 = 0;
  id v19 = 0;
  NSUInteger v20 = 0;
  NSUInteger v21 = 0;
  if (v13 && v14)
  {
    if ([v14 isEqualToString:&stru_1ED0E84C0])
    {
      id v16 = 0;
      NSUInteger v18 = 0;
      id v19 = 0;
      NSUInteger v20 = 0;
      NSUInteger v21 = 0;
      goto LABEL_38;
    }
    NSUInteger v22 = (void *)MEMORY[0x18C108260]();
    NSUInteger v20 = [(UITextChecker *)self _checker];
    if (!v20)
    {
      contextb = v22;
      uint64_t v39 = 0;
      id v16 = 0;
      id v19 = 0;
      NSUInteger v21 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_35:
      if (a7)
      {
        id v16 = v16;
        *a7 = v16;
      }
      NSUInteger v18 = (void *)v39;
      goto LABEL_38;
    }
    uint64_t v23 = [(UITextChecker *)self adjustOffsetToNextWordBoundaryInString:v42 startingAt:a4];
    uint64_t v24 = v23;
    if (v8)
    {
      if (v23 >= v13) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = v23;
      }
      if (v23 > 0) {
        uint64_t v24 = v25;
      }
      context = v22;
      if (v24 > 0)
      {
        id v19 = objc_msgSend(v42, "substringFromIndex:", v24, v22);
        uint64_t v39 = [v42 substringToIndex:v24];
        goto LABEL_24;
      }
    }
    else
    {
      if (v23 >= 1 && v23 >= v13)
      {
        id v16 = 0;
        NSUInteger v18 = 0;
        id v19 = 0;
        NSUInteger v21 = 0;
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_38;
      }
      context = v22;
      if (v23 > 0)
      {
        objc_msgSend(v42, "substringFromIndex:", v23, v22);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
        id v19 = v26;
        uint64_t v39 = 0;
LABEL_24:
        objc_msgSend((id)qword_1EB25D5F0, "lock", context);
        [(UITextChecker *)self _setLanguageDictionaryName:v15];
        NSUInteger v27 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
        [(UITextChecker *)self _setDocumentDictionaryName:v27];

        if (a7) {
          NSUInteger v28 = &v44;
        }
        else {
          NSUInteger v28 = 0;
        }
        if (a7) {
          id v44 = 0;
        }
        uint64_t v17 = [(UITextChecker *)self _chunkAndFindMisspelledWordInString:v19 languages:v41 learnedDictionaries:qword_1EB25D5F8 wordCount:&v45 correction:v28 usingChecker:v20];
        NSUInteger v21 = v29;
        uint64_t v30 = v24;
        if (a7)
        {
          id v16 = v44;
          if (!v21)
          {
LABEL_39:
            if (v39)
            {
              uint64_t v45 = -1;
              if (a7) {
                v43 = v16;
              }
              uint64_t v17 = -[UITextChecker _chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:](self, "_chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:");
              NSUInteger v21 = v34;
              if (a7)
              {
                id v35 = v43;

                id v16 = v35;
              }
            }
            goto LABEL_34;
          }
        }
        else
        {
          id v16 = 0;
          if (!v29) {
            goto LABEL_39;
          }
        }
        v17 += v30;
LABEL_34:
        [(id)qword_1EB25D5F0 unlock];
        goto LABEL_35;
      }
    }
    id v26 = v42;
    goto LABEL_23;
  }
LABEL_38:
  NSUInteger v31 = v18;

  NSUInteger v32 = v17;
  NSUInteger v33 = v21;
  result.NSUInteger length = v33;
  result.NSUInteger location = v32;
  return result;
}

- (_NSRange)checkGrammarOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 details:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 length];
  unint64_t v14 = v13;
  if (a7) {
    *a7 = 0;
  }
  id v15 = 0;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v12)
  {
    uint64_t v17 = 0;
    id v18 = 0;
    id v19 = 0;
    NSUInteger v20 = 0;
    goto LABEL_42;
  }
  v40 = a7;
  uint64_t v17 = 0;
  id v18 = 0;
  id v19 = 0;
  NSUInteger v20 = 0;
  if (v13)
  {
    if ([v12 isEqualToString:&stru_1ED0E84C0])
    {
      id v15 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      id v19 = 0;
LABEL_7:
      NSUInteger v20 = 0;
      goto LABEL_42;
    }
    NSUInteger v21 = (void *)MEMORY[0x18C108260]();
    id v19 = [(UITextChecker *)self _checker];
    if (!v19)
    {
      uint64_t v37 = 0;
      contexta = v21;
      id v15 = 0;
      id v18 = 0;
      NSUInteger v20 = 0;
LABEL_39:
      if (v40)
      {
        id v15 = v15;
        id *v40 = v15;
      }
      uint64_t v17 = (void *)v37;
      goto LABEL_42;
    }
    if (v8)
    {
      context = v21;
      if (v14 <= a4) {
        int64_t v22 = 0;
      }
      else {
        int64_t v22 = a4;
      }
      if (a4 <= 0) {
        int64_t v23 = a4;
      }
      else {
        int64_t v23 = v22;
      }
      if (v23 > 0)
      {
        uint64_t v24 = objc_msgSend(v11, "paragraphRangeForRange:", v23, 0);
        uint64_t v26 = v25;
        unint64_t v27 = v23 - v24;
        id v18 = [v11 substringFromIndex:v24];
        uint64_t v37 = [v11 substringToIndex:v24 + v26];
        goto LABEL_27;
      }
    }
    else
    {
      if (a4 >= 1 && v14 <= a4)
      {
        id v15 = 0;
        uint64_t v17 = 0;
        id v18 = 0;
        goto LABEL_7;
      }
      context = v21;
      if (a4 > 0)
      {
        uint64_t v24 = objc_msgSend(v11, "paragraphRangeForRange:", a4, 0);
        unint64_t v27 = a4 - v24;
        id v18 = [v11 substringFromIndex:v24];
LABEL_26:
        uint64_t v37 = 0;
LABEL_27:
        [(id)qword_1EB25D5F0 lock];
        [(UITextChecker *)self _setLanguageDictionaryName:v12];
        NSUInteger v28 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
        [(UITextChecker *)self _setDocumentDictionaryName:v28];

        id v15 = 0;
        while (1)
        {
          id v42 = v15;
          uint64_t v16 = [(UITextChecker *)self _chunkAndCheckGrammarInString:v18 language:v12 usingChecker:v19 details:&v42];
          NSUInteger v20 = v29;
          id v30 = v42;

          id v15 = v30;
          if (!v20) {
            break;
          }
          unint64_t v31 = v16 + v20;
          if ([v15 count] && v31 > v27)
          {
            v16 += v24;
            break;
          }
          unint64_t v32 = [v18 length];
          if (v32 <= v31)
          {

            id v15 = 0;
            NSUInteger v20 = 0;
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
            break;
          }
          if (v27 >= v31) {
            v27 -= v31;
          }
          else {
            unint64_t v27 = 0;
          }
          v24 += v31;
          uint64_t v33 = objc_msgSend(v11, "substringWithRange:", v24, v32 - v31);

          id v18 = (id)v33;
        }
        [(id)qword_1EB25D5F0 unlock];
        goto LABEL_39;
      }
    }
    id v18 = v11;
    uint64_t v24 = 0;
    unint64_t v27 = 0;
    goto LABEL_26;
  }
LABEL_42:
  NSUInteger v34 = v17;

  NSUInteger v35 = v16;
  NSUInteger v36 = v20;
  result.NSUInteger length = v36;
  result.NSUInteger location = v35;
  return result;
}

+ (BOOL)grammarCheckingEnabledForLanguage:(id)a3
{
  id v3 = a3;
  if (qword_1EB25D698 != -1) {
    dispatch_once(&qword_1EB25D698, &__block_literal_global_505_1);
  }
  char v4 = 0;
  if (v3 && byte_1EB25D5EA)
  {
    id v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
    unint64_t v6 = [v5 languageCode];
    char v4 = [v6 isEqualToString:@"en"];
  }
  return v4;
}

+ (id)postEditor
{
  if (byte_1EB25D5E9) {
    return (id)qword_1EB25D618;
  }
  else {
    return 0;
  }
}

- (id)postEditor
{
  return +[UITextChecker postEditor];
}

- (int64_t)requestGrammarCheckingOfString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a7;
  int64_t v14 = atomic_fetch_add(&qword_1EB25D6A0, 1uLL) + 1;
  if (length >= 0x400) {
    NSUInteger length = 1024;
  }
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = [(UITextChecker *)self postEditor];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__UITextChecker_requestGrammarCheckingOfString_range_language_options_completionHandler___block_invoke;
  v21[3] = &unk_1E530C340;
  id v22 = v13;
  int64_t v23 = v14;
  id v19 = v13;
  objc_msgSend(v18, "requestCheckingOfString:range:language:options:completionHandler:", v17, location, length, v16, v15, v21);

  return v14;
}

uint64_t __89__UITextChecker_requestGrammarCheckingOfString_range_language_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (id)finalResultsFromCheckingString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  int64_t v14 = [(UITextChecker *)self postEditor];
  id v15 = v14;
  if (v14)
  {
    if (length >= 0x400) {
      uint64_t v16 = 1024;
    }
    else {
      uint64_t v16 = length;
    }
    id v17 = objc_msgSend(v14, "finalResultsFromCheckingString:range:language:options:", v11, location, v16, v12, v13);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)grammarAlternativesForString:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (qword_1EB25D6A8 != -1) {
    dispatch_once(&qword_1EB25D6A8, &__block_literal_global_531);
  }
  if (byte_1EB25D5EB)
  {
    uint64_t v33 = self;
    uint64_t v37 = v5;
    unint64_t v6 = +[UIKeyboardInputModeController sharedInputModeController];
    int64_t v7 = [v6 currentInputMode];
    uint64_t v39 = [v7 languageWithRegion];

    BOOL v8 = +[UIKeyboardImpl activeInstance];
    int64_t v9 = [v8 keyboardState];
    id v10 = [v9 documentState];

    id v11 = [v10 contextBeforeInput];
    id v12 = [v10 selectedText];
    NSUInteger v35 = v10;
    uint64_t v13 = [v10 contextAfterInput];
    int64_t v14 = &stru_1ED0E84C0;
    if (v11) {
      id v15 = v11;
    }
    else {
      id v15 = &stru_1ED0E84C0;
    }
    if (v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = &stru_1ED0E84C0;
    }
    NSUInteger v34 = (void *)v13;
    if (v13) {
      int64_t v14 = (__CFString *)v13;
    }
    id v17 = [NSString stringWithFormat:@"%@%@%@", v15, v16, v14];
    unint64_t v18 = [v17 length];
    unint64_t v19 = [v4 length];
    unint64_t v20 = [(__CFString *)v11 length];
    uint64_t v21 = [(__CFString *)v12 length];
    NSUInteger v36 = v8;
    id v38 = [v8 smartPunctuationController];
    uint64_t v22 = 0;
    if (v20 >= v19) {
      unint64_t v23 = v20 - v19;
    }
    else {
      unint64_t v23 = 0;
    }
    unint64_t v24 = v21 + v20;
    if (v24 + v19 < v18) {
      unint64_t v18 = v24 + v19;
    }
    while (v18 > v23 + v22)
    {
      unint64_t v25 = objc_msgSend(v17, "rangeOfString:options:range:", v4, 0, v23 + v22, v18 - (v23 + v22));
      if (!v26) {
        break;
      }
      unint64_t v23 = v25;
      uint64_t v22 = v26;
      if (v25 <= v20 && v24 <= v25 + v26)
      {
        unint64_t v27 = [(UITextChecker *)v33 postEditor];
        NSUInteger v28 = objc_msgSend(v27, "grammarDetailForString:range:language:", v17, v23, v22, v39);

        if (v28)
        {
          NSUInteger v29 = _detailByApplyingSmartQuotes((uint64_t)v28, v38);
          id v30 = [v29 objectForKey:@"NSGrammarCorrections"];

          if (v30)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v30 count])
              {
                unint64_t v31 = (void *)[objc_alloc((Class)off_1E52D2EA8) initWithPrimaryString:v4 alternativeStrings:v30];
                [v37 addObject:v31];
              }
            }
          }
        }
        break;
      }
    }

    id v5 = v37;
  }

  return v5;
}

- (id)grammarGuessesForRange:(_NSRange)a3 inString:(id)a4 language:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [(UITextChecker *)self postEditor];
  unint64_t v13 = [v9 length];
  if (v12)
  {
    if (length)
    {
      unint64_t v14 = v13;
      unint64_t v15 = location + length;
      if (location + length <= v13)
      {
        if (+[UITextChecker grammarCheckingEnabledForLanguage:v10])
        {
          uint64_t v16 = +[UIKeyboardImpl activeInstance];
          v52 = [v16 smartPunctuationController];
          uint64_t v49 = [v16 autocorrectionPreferenceForTraits];
          id v17 = v9;
          if (!location && length == v14)
          {
            v47 = v11;
            id v48 = v10;
            v50 = v16;
            unint64_t v18 = [v16 keyboardState];
            unint64_t v19 = [v18 documentState];

            unint64_t v20 = [v19 contextBeforeInput];
            uint64_t v21 = [v19 selectedText];
            v46 = v19;
            uint64_t v22 = [v19 contextAfterInput];
            unint64_t v23 = &stru_1ED0E84C0;
            if (v20) {
              unint64_t v24 = v20;
            }
            else {
              unint64_t v24 = &stru_1ED0E84C0;
            }
            if (v21) {
              unint64_t v25 = v21;
            }
            else {
              unint64_t v25 = &stru_1ED0E84C0;
            }
            if (v22) {
              unint64_t v23 = (__CFString *)v22;
            }
            v43 = (void *)v22;
            uint64_t v26 = [NSString stringWithFormat:@"%@%@%@", v24, v25, v23];
            unint64_t v27 = [v26 length];
            uint64_t v45 = v20;
            unint64_t v28 = [(__CFString *)v20 length];
            id v44 = v21;
            uint64_t v29 = [(__CFString *)v21 length];
            uint64_t v30 = 0;
            if (v28 >= length) {
              NSUInteger location = v28 - length;
            }
            else {
              NSUInteger location = 0;
            }
            unint64_t v31 = v29 + v28;
            if (v29 + v28 + length < v27) {
              unint64_t v27 = v29 + v28 + length;
            }
            while (v27 > location + v30)
            {
              unint64_t v32 = objc_msgSend(v26, "rangeOfString:options:range:", v17, 0, location + v30, v27 - (location + v30));
              if (!v33) {
                break;
              }
              NSUInteger location = v32;
              uint64_t v30 = v33;
              if (v32 <= v28 && v31 <= v32 + v33)
              {
                id v34 = v26;

                NSUInteger length = v30;
                id v17 = v34;
                goto LABEL_26;
              }
            }
            NSUInteger location = 0;
LABEL_26:

            unint64_t v15 = location + length;
            id v11 = v47;
            id v10 = v48;
            uint64_t v16 = v50;
          }
          if (v15 <= [v17 length])
          {
            uint64_t v35 = objc_msgSend(v12, "grammarDetailForString:range:language:", v17, location, length, v10);
            NSUInteger v36 = (void *)v35;
            if (v35)
            {
              v51 = v16;
              uint64_t v37 = _detailByApplyingSmartQuotes(v35, v52);
              id v38 = [v37 objectForKey:@"NSGrammarCorrections"];

              if (v38)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if ([v38 count]) {
                    [v11 addObjectsFromArray:v38];
                  }
                }
              }

              uint64_t v16 = v51;
            }
            if (v49 && ![v11 count])
            {
              uint64_t v39 = objc_msgSend(v12, "reversionForString:range:language:", v17, location, length, v10);
              if (v39)
              {
                v40 = v39;
                v41 = _stringByApplyingSmartQuotes(v39, v52);

                if (v41 && ([v11 containsObject:v41] & 1) == 0) {
                  [v11 addObject:v41];
                }
              }
              else
              {
                v41 = 0;
              }
            }
          }
        }
      }
    }
  }

  return v11;
}

- (void)recordResponse:(unint64_t)a3 toGrammarDetailInAnnotatedString:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v20 = a4;
  id v9 = [(UITextChecker *)self postEditor];
  if (!v9 || !length || location + length > [v20 length]) {
    goto LABEL_27;
  }
  id v10 = [v20 attribute:@"NSGrammarCorrections" atIndex:location effectiveRange:0];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v10 = 0;
    }
  }
  id v11 = [v20 attribute:@"NSGrammarIssueType" atIndex:location effectiveRange:0];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v11 = 0;
    }
  }
  id v12 = [v20 attribute:@"NSGrammarTargetPair" atIndex:location effectiveRange:0];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v12 = 0;
    }
  }
  unint64_t v13 = [v20 attribute:@"NSGrammarConfidenceScore" atIndex:location effectiveRange:0];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      unint64_t v13 = 0;
    }
  }
  uint64_t v14 = [v20 attribute:@"NSGrammarLanguage" atIndex:location effectiveRange:0];
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_20;
    }
  }
  uint64_t v16 = +[UIKeyboardInputModeController sharedInputModeController];
  id v17 = [v16 currentInputMode];
  unint64_t v15 = [v17 languageWithRegion];

LABEL_20:
  if (v10)
  {
    uint64_t v18 = [v10 count];
    if (v11)
    {
      if (v13 && v18 && v15)
      {
        unint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"NSGrammarCorrections", v13, @"NSGrammarConfidenceScore", v11, @"NSGrammarIssueType", v12, @"NSGrammarTargetPair", 0);
        [v9 recordResponse:a3 toGrammarDetail:v19 language:v15];
      }
    }
  }

LABEL_27:
}

+ (id)grammarAutocorrectionForWord:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 _textChoicesAssistant];

  id v6 = 0;
  if (v3 && v5)
  {
    if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
    {
      int64_t v7 = [v5 candidateForFinalString:v3];
      if (v7 && [(id)_recentGrammarCandidates containsObject:v7]) {
        id v6 = v7;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

+ (void)handleGrammarCorrectionEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 _textChoicesAssistant];

  if (v5
    && +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v6 objectForKey:v11];
          unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FAE318]) initWithCandidate:v12 forInput:v11];
          if (objc_opt_respondsToSelector()) {
            [v13 setConfidence:2];
          }
          id v14 = objc_alloc(MEMORY[0x1E4FAE2A0]);
          unint64_t v15 = (void *)[v14 initWithAutocorrection:v13 alternateCorrections:MEMORY[0x1E4F1CBF0]];
          uint64_t v16 = [MEMORY[0x1E4FAE278] listWithCorrections:v15];
          [v5 addList:v16 forCandidate:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v3 = v17;
  }
}

+ (void)noteWordTerminator:(id)a3 replacement:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v6 string];
  }
  uint64_t v9 = v8;
  id v10 = +[UITextChecker keyboardLanguages];
  uint64_t v11 = [v10 firstObject];

  id v12 = +[UIKeyboardImpl activeInstance];
  unint64_t v13 = +[UITextChecker postEditor];
  if (qword_1EB25D640 != -1) {
    dispatch_once(&qword_1EB25D640, &__block_literal_global_244_0);
  }
  id v14 = [v12 inputDelegateManager];
  int v15 = [v14 hasAsyncCapableInputDelegate];

  if (v13)
  {
    if (v9)
    {
      [v9 rangeOfCharacterFromSet:qword_1EB25D638];
      if (v16)
      {
        if (([a1 grammarCheckingEnabledForLanguage:v11] & v15) == 1)
        {
          id v17 = [v12 keyboardState];
          long long v18 = [v17 documentState];

          long long v19 = [v18 contextBeforeInput];
          uint64_t v20 = [v19 length];
          unint64_t v21 = v20;
          if (v19)
          {
            if (v20)
            {
              objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", qword_1EB25D638, 12, 0, v20);
              if (!v22)
              {
                uint64_t v23 = [v19 stringByAppendingString:v9];

                unint64_t v21 = [v23 length];
                long long v19 = v23;
              }
            }
          }
          if (v19 && v21 >= 0xA)
          {
            v28[0] = @"InsertionPoint";
            unint64_t v27 = [NSNumber numberWithUnsignedInteger:v21];
            v28[1] = @"ControlRepeatedAutocorrections";
            v29[0] = v27;
            v29[1] = MEMORY[0x1E4F1CC28];
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
            v25 = unint64_t v24 = v18;
            id v26 = (id)objc_msgSend(v13, "resultsFromCheckingString:range:language:options:", v19, 0, v21, v11, v25);

            long long v18 = v24;
          }
        }
      }
    }
  }
}

void __48__UITextChecker_noteWordTerminator_replacement___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".!?։۔।።᙮‼‽⁇⁈⁉。！．？｡"];
  v1 = (void *)qword_1EB25D638;
  qword_1EB25D638 = v0;
}

+ (void)noteTextReplacement:(id)a3
{
  id v56 = a3;
  id v4 = [v56 replacementText];
  id v5 = [v56 originalText];
  id v6 = +[UITextChecker keyboardLanguages];
  id v7 = [v6 firstObject];

  id v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = +[UITextChecker postEditor];
  if (v9) {
    BOOL v10 = v5 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || v4 == 0;
  if (!v11 && [a1 grammarCheckingEnabledForLanguage:v7])
  {
    uint64_t v49 = v4;
    id v12 = [v8 keyboardState];
    unint64_t v13 = [v12 documentState];

    v47 = v8;
    v55 = [v8 smartPunctuationController];
    id v14 = [v13 contextBeforeInput];
    int v15 = [v13 selectedText];
    v46 = v13;
    uint64_t v16 = [v13 contextAfterInput];
    id v17 = &stru_1ED0E84C0;
    if (v14) {
      long long v18 = v14;
    }
    else {
      long long v18 = &stru_1ED0E84C0;
    }
    if (v15) {
      long long v19 = v15;
    }
    else {
      long long v19 = &stru_1ED0E84C0;
    }
    v52 = (void *)v16;
    if (v16) {
      id v17 = (__CFString *)v16;
    }
    uint64_t v20 = [NSString stringWithFormat:@"%@%@%@", v18, v19, v17];
    unint64_t v21 = v7;
    unint64_t v22 = [v20 length];
    unint64_t v23 = [v5 length];
    v54 = v14;
    unint64_t v24 = [(__CFString *)v14 length];
    v53 = v15;
    uint64_t v25 = [(__CFString *)v15 length];
    uint64_t v26 = 0;
    if (v24 >= v23) {
      unint64_t v27 = v24 - v23;
    }
    else {
      unint64_t v27 = 0;
    }
    unint64_t v28 = v25 + v24;
    if (v25 + v24 + v23 >= v22) {
      unint64_t v29 = v22;
    }
    else {
      unint64_t v29 = v25 + v24 + v23;
    }
    id v7 = v21;
    do
    {
      if (v29 <= v27 + v26
        || (unint64_t v30 = objc_msgSend(v20, "rangeOfString:options:range:", v5, 0, v27 + v26, v29 - (v27 + v26)), !v31))
      {
        uint64_t v35 = 0;
        id v8 = v47;
        id v4 = v49;
        NSUInteger v36 = v46;
        goto LABEL_47;
      }
      unint64_t v27 = v30;
      uint64_t v26 = v31;
    }
    while (v30 > v24 || v28 > v30 + v31);
    unint64_t v32 = objc_msgSend(v9, "grammarDetailForString:range:language:", v20, v30, v31, v21);
    if (v32
      && (uint64_t v33 = v32,
          [v32 objectForKey:@"NSGrammarCorrections"],
          id v34 = objc_claimAutoreleasedReturnValue(),
          v34,
          unint64_t v32 = v33,
          v34))
    {
      uint64_t v35 = 0;
      id v8 = v47;
      id v4 = v49;
      NSUInteger v36 = v46;
    }
    else
    {
      id v44 = v32;
      uint64_t v35 = objc_msgSend(v9, "reversionForString:range:language:", v20, v27, v26, v7);
      if (v35)
      {
        uint64_t v37 = objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v27, v26, v35);
        uint64_t v38 = objc_msgSend(v9, "grammarDetailForString:range:language:", v37, v27, objc_msgSend(v35, "length"), v7);

        unint64_t v32 = (void *)v38;
        id v8 = v47;
        id v4 = v49;
      }
      else
      {
        id v8 = v47;
        id v4 = v49;
        unint64_t v32 = v44;
      }
      NSUInteger v36 = v46;
      if (!v32) {
        goto LABEL_47;
      }
    }
    uint64_t v45 = v32;
    uint64_t v39 = _detailByApplyingSmartQuotes((uint64_t)v32, v55);
    v40 = [v39 objectForKey:@"NSGrammarCorrections"];

    if (v40 && [v40 count])
    {
      if (v35)
      {
        int v48 = [v4 isEqualToString:v35];
        v41 = [v8 inputDelegateManager];
        int v50 = [v41 hasAsyncCapableInputDelegate];

        if (v50)
        {
          if (v48) {
            uint64_t v42 = 5;
          }
          else {
            uint64_t v42 = 3;
          }
          goto LABEL_45;
        }
      }
      else
      {
        v43 = [v40 firstObject];
        int v51 = [v4 isEqual:v43];

        if (v51)
        {
          uint64_t v42 = 1;
LABEL_45:
          [v9 recordResponse:v42 toGrammarDetail:v45 language:v7];
        }
      }
    }

LABEL_47:
  }
}

+ (void)performFinalGrammarChecking
{
  if (qword_1EB25D6B0 != -1) {
    dispatch_once(&qword_1EB25D6B0, &__block_literal_global_537);
  }
  if (byte_1EB25D5EC == 1)
  {
    uint64_t v2 = +[UIKeyboardImpl activeInstance];
    id v3 = [v2 inputDelegateManager];
    id v6 = [v3 textInputDelegate];

    id v4 = v6;
    if (v6)
    {
      char v5 = objc_opt_respondsToSelector();
      id v4 = v6;
      if (v5)
      {
        [v6 performFinalGrammarChecking];
        id v4 = v6;
      }
    }
  }
}

- (id)checkString:(id)a3 range:(_NSRange)a4 types:(unint64_t)a5 languages:(id)a6 options:(id)a7
{
  __int16 v9 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v13 = a6;
  id v57 = a7;
  id v63 = [MEMORY[0x1E4F1CA48] array];
  v58 = v13;
  v61 = [v13 firstObject];
  if (location < location + length)
  {
    NSUInteger v14 = location;
    do
    {
      uint64_t v15 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v59, location, length, v14, 0, v58);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v17 = v16;
      if (!v16) {
        break;
      }
      uint64_t v18 = v15;
      long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29010]), "initWithRange:", v15, v16);
      [v63 addObject:v19];
      NSUInteger v14 = v18 + v17;
    }
    while (v14 < location + length);
  }
  if (+[UITextChecker grammarCheckingEnabledForLanguage:v61])
  {
    v60 = [(UITextChecker *)self postEditor];
    uint64_t v20 = +[UIKeyboardImpl activeInstance];
    id v56 = v20;
    if ((v9 & 0x200) != 0)
    {
      BOOL v22 = [v20 autocorrectionPreferenceForTraits] == 0;
      uint64_t v20 = v56;
      int v21 = !v22;
    }
    else
    {
      int v21 = 0;
    }
    v64 = [v20 smartPunctuationController];
    if (length >= 0x400) {
      uint64_t v23 = 1024;
    }
    else {
      uint64_t v23 = length;
    }
    objc_msgSend(v60, "resultsFromCheckingString:range:language:options:", v59, location, v23, v61, v57);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v67 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
    if (v67)
    {
      uint64_t v66 = *(void *)v79;
      int v62 = v21;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v79 != v66) {
            objc_enumerationMutation(obj);
          }
          uint64_t v68 = v24;
          uint64_t v25 = *(void **)(*((void *)&v78 + 1) + 8 * v24);
          uint64_t v26 = [v25 resultType];
          if (v26 == 512)
          {
            if (v21)
            {
              _resultByApplyingSmartQuotesToResult(v25, v64);
              id v28 = (id)objc_claimAutoreleasedReturnValue();
              id v29 = obj;
              id v30 = v28;
              uint64_t v31 = [v30 range];
              uint64_t v76 = v32;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v72 = v29;
              uint64_t v33 = [v72 countByEnumeratingWithState:&v86 objects:v92 count:16];
              v69 = v30;
              v73 = v30;
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v87;
                v73 = v30;
                uint64_t v70 = *(void *)v87;
                do
                {
                  uint64_t v36 = 0;
                  uint64_t v71 = v34;
                  do
                  {
                    if (*(void *)v87 != v35) {
                      objc_enumerationMutation(v72);
                    }
                    uint64_t v37 = *(void **)(*((void *)&v86 + 1) + 8 * v36);
                    uint64_t v38 = [v37 range];
                    uint64_t v40 = v39;
                    if ([v37 resultType] == 4)
                    {
                      v41 = [v37 grammarDetails];
                      long long v82 = 0u;
                      long long v83 = 0u;
                      long long v84 = 0u;
                      long long v85 = 0u;
                      id v77 = v41;
                      uint64_t v42 = [v77 countByEnumeratingWithState:&v82 objects:v91 count:16];
                      if (v42)
                      {
                        uint64_t v43 = v42;
                        uint64_t v74 = v40;
                        uint64_t v75 = v36;
                        uint64_t v44 = *(void *)v83;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v43; ++i)
                          {
                            if (*(void *)v83 != v44) {
                              objc_enumerationMutation(v77);
                            }
                            v46 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                            if (objc_opt_respondsToSelector())
                            {
                              v47 = [v46 objectForKey:@"NSGrammarRange"];
                              if (v47 && (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                uint64_t v48 = [v47 rangeValue];
                                uint64_t v50 = v49;
                              }
                              else
                              {
                                uint64_t v50 = 0;
                                uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
                              }
                            }
                            else
                            {
                              uint64_t v50 = 0;
                              uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
                            }
                            if (v31 == v48 + v38 && v76 == v50)
                            {
                              int v51 = [UIExtendedCorrectionCheckingResult alloc];
                              v52 = [v69 replacementString];
                              uint64_t v53 = -[UIExtendedCorrectionCheckingResult initWithRange:replacementString:sentenceRange:detail:](v51, "initWithRange:replacementString:sentenceRange:detail:", v31, v76, v52, v38, v74, v46);

                              v73 = (void *)v53;
                              goto LABEL_52;
                            }
                          }
                          uint64_t v43 = [v77 countByEnumeratingWithState:&v82 objects:v91 count:16];
                          if (v43) {
                            continue;
                          }
                          break;
                        }
LABEL_52:
                        uint64_t v35 = v70;
                        uint64_t v34 = v71;
                        uint64_t v36 = v75;
                      }
                    }
                    ++v36;
                  }
                  while (v36 != v34);
                  uint64_t v34 = [v72 countByEnumeratingWithState:&v86 objects:v92 count:16];
                }
                while (v34);
              }

              int v21 = v62;
              unint64_t v27 = v73;
              if (v73)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v54 = [v73 detail];
                  [v60 recordResponse:4 toGrammarDetail:v54 language:v61];
                }
LABEL_59:
                [v63 addObject:v27];
              }
            }
          }
          else if (v26 == 4)
          {
            if (qword_1EB25D6A8 != -1) {
              dispatch_once(&qword_1EB25D6A8, &__block_literal_global_531);
            }
            if (byte_1EB25D5EB)
            {
              unint64_t v27 = _resultByApplyingSmartQuotesToResult(v25, v64);
              if (v27) {
                goto LABEL_59;
              }
            }
          }
          uint64_t v24 = v68 + 1;
        }
        while (v68 + 1 != v67);
        uint64_t v67 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
      }
      while (v67);
    }
  }
  return v63;
}

- (id)correctionForWordRange:(_NSRange)a3 inString:(id)a4 language:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 length];
  if (location || length != v11)
  {
    objc_msgSend(v9, "substringWithRange:", location, length);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v9;
  }
  id v13 = v12;
  id v22 = 0;
  uint64_t v14 = [(UITextChecker *)self checkSpellingOfString:v12 startingAt:0 language:v10 wrap:0 correction:&v22];
  uint64_t v16 = v15;
  id v17 = v22;
  uint64_t v18 = v17;
  if (v16 != length || v14 != 0) {
    id v17 = 0;
  }
  id v20 = v17;

  return v20;
}

- (NSArray)guessesForWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v9 = string;
  id v10 = language;
  if (!v9)
  {
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  id v11 = 0;
  if (![(NSString *)v9 isEqualToString:&stru_1ED0E84C0])
  {
    if (length)
    {
      unint64_t v12 = [(NSString *)v9 length];
      id v11 = 0;
      if (v10)
      {
        if (location + length <= v12)
        {
          if (![(NSString *)v10 isEqualToString:&stru_1ED0E84C0])
          {
            uint64_t v14 = [(UITextChecker *)self _checker];
            if (v14)
            {
              [(id)qword_1EB25D5F0 lock];
              [(UITextChecker *)self _setLanguageDictionaryName:v10];
              uint64_t v15 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
              [(UITextChecker *)self _setDocumentDictionaryName:v15];

              uint64_t v16 = objc_msgSend(v14, "spellServer:suggestGuessesForWordRange:inString:language:", self, location, length, v9, v10);
              [(id)qword_1EB25D5F0 unlock];
            }
            else
            {
              uint64_t v16 = 0;
            }
            id v11 = v16;

            goto LABEL_8;
          }
          goto LABEL_7;
        }
      }
    }
  }
LABEL_8:

  return (NSArray *)v11;
}

- (NSArray)completionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v9 = string;
  id v10 = language;
  if (!v9)
  {
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  id v11 = 0;
  if (![(NSString *)v9 isEqualToString:&stru_1ED0E84C0])
  {
    if (length)
    {
      unint64_t v12 = [(NSString *)v9 length];
      id v11 = 0;
      if (v10)
      {
        if (location + length <= v12)
        {
          if (![(NSString *)v10 isEqualToString:&stru_1ED0E84C0])
          {
            uint64_t v14 = [(UITextChecker *)self _checker];
            if (v14)
            {
              [(id)qword_1EB25D5F0 lock];
              [(UITextChecker *)self _setLanguageDictionaryName:v10];
              uint64_t v15 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
              [(UITextChecker *)self _setDocumentDictionaryName:v15];

              uint64_t v16 = objc_msgSend(v14, "spellServer:suggestCompletionsForPartialWordRange:inString:language:", self, location, length, v9, v10);
              [(id)qword_1EB25D5F0 unlock];
            }
            else
            {
              uint64_t v16 = 0;
            }
            id v11 = v16;

            goto LABEL_8;
          }
          goto LABEL_7;
        }
      }
    }
  }
LABEL_8:

  return (NSArray *)v11;
}

- (id)suggestWordInLanguage:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_1ED0E84C0] & 1) == 0)
  {
    id v7 = [(UITextChecker *)self _checker];
    if (v7)
    {
      [(id)qword_1EB25D5F0 lock];
      [(UITextChecker *)self _setLanguageDictionaryName:v5];
      id v8 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
      [(UITextChecker *)self _setDocumentDictionaryName:v8];

      id v9 = objc_msgSend(v7, "spellServer:suggestWordWithLengthInRange:language:", self, 4, 3, v5);
      [(id)qword_1EB25D5F0 unlock];
    }
    else
    {
      id v9 = 0;
    }
    id v6 = v9;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canChangeCaseOfFirstLetterInString:(id)a3 toUpperCase:(BOOL)a4 language:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9
    && ([v9 isEqualToString:&stru_1ED0E84C0] & 1) == 0
    && ([(UITextChecker *)self _checker], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v12 = (void *)v11;
    [(id)qword_1EB25D5F0 lock];
    [(UITextChecker *)self _setLanguageDictionaryName:v10];
    id v13 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
    [(UITextChecker *)self _setDocumentDictionaryName:v13];

    char v14 = [v12 spellServer:self canChangeCaseOfFirstLetterInString:v8 toUpperCase:v6 language:v10];
    [(id)qword_1EB25D5F0 unlock];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)stringForInputString:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && ([v7 isEqualToString:&stru_1ED0E84C0] & 1) == 0)
  {
    id v10 = [(UITextChecker *)self _checker];
    if (v10)
    {
      [(id)qword_1EB25D5F0 lock];
      [(UITextChecker *)self _setLanguageDictionaryName:v8];
      uint64_t v11 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
      [(UITextChecker *)self _setDocumentDictionaryName:v11];

      unint64_t v12 = [v10 spellServer:self stringForInputString:v6 language:v8];
      [(id)qword_1EB25D5F0 unlock];
    }
    else
    {
      unint64_t v12 = 0;
    }
    id v9 = v12;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)alternativesForPinyinInputString:(id)a3
{
  id v4 = a3;
  char v5 = [(UITextChecker *)self _checker];
  if (v5)
  {
    [(id)qword_1EB25D5F0 lock];
    [(UITextChecker *)self _setLanguageDictionaryName:@"en"];
    id v6 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
    [(UITextChecker *)self _setDocumentDictionaryName:v6];

    id v7 = [v5 spellServer:self alternativesForPinyinInputString:v4 language:@"en"];
    [(id)qword_1EB25D5F0 unlock];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5 insertionPointIndex:(unint64_t)a6 scriptForBestLanguage:(id *)a7
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v71 = a4;
  id v73 = a5;
  id v77 = v10;
  uint64_t v11 = [v10 length];
  unint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  char v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  uint64_t v106 = 0;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__216;
  v101 = __Block_byref_object_dispose__216;
  id v102 = 0;
  id v15 = objc_alloc(MEMORY[0x1E4F28DF0]);
  uint64_t v16 = *MEMORY[0x1E4F28510];
  id v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F28510], *MEMORY[0x1E4F28538], 0);
  uint64_t v18 = (void *)[v15 initWithTagSchemes:v17 options:0];

  [v18 setString:v10];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __114__UITextChecker_bestLanguageForString_fromAlternatives_currentLanguage_insertionPointIndex_scriptForBestLanguage___block_invoke;
  v89[3] = &unk_1E530C368;
  id v90 = v18;
  v94 = &v103;
  id v76 = v12;
  id v91 = v76;
  v95 = &v97;
  unint64_t v96 = a6;
  id v75 = v13;
  id v92 = v75;
  id v72 = v14;
  id v93 = v72;
  id v70 = v90;
  objc_msgSend(v90, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v11, v16, 14, v89);
  long long v19 = (void *)v98[5];
  v98[5] = 0;

  if (!v104[3])
  {
    unint64_t v79 = 0;
    long long v80 = 0;
    unint64_t v22 = 0;
    uint64_t v31 = 0;
    long long v78 = 0;
    goto LABEL_29;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v20 = v76;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v85 objects:v108 count:16];
  if (!v21)
  {
    unint64_t v79 = 0;
    long long v80 = 0;
    unint64_t v22 = 0;
    long long v78 = 0;
    goto LABEL_17;
  }
  unint64_t v79 = 0;
  long long v80 = 0;
  unint64_t v22 = 0;
  long long v78 = 0;
  uint64_t v23 = *(void *)v86;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v86 != v23) {
        objc_enumerationMutation(v20);
      }
      uint64_t v25 = *(void **)(*((void *)&v85 + 1) + 8 * i);
      if (([v25 isEqualToString:@"und"] & 1) == 0)
      {
        uint64_t v26 = [v20 objectForKey:v25];
        unint64_t v27 = [v26 unsignedIntegerValue];

        if (v27 <= v22)
        {
          unint64_t v29 = v27;
          id v28 = v25;
          if (v27 <= v79) {
            continue;
          }
        }
        else
        {
          id v28 = v78;

          long long v80 = v28;
          unint64_t v29 = v22;
          unint64_t v22 = v27;
          long long v78 = v25;
        }
        id v30 = v25;

        unint64_t v79 = v29;
        long long v80 = v28;
      }
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v85 objects:v108 count:16];
  }
  while (v21);
LABEL_17:

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v32 = v75;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v81 objects:v107 count:16];
  if (v33)
  {
    unint64_t v34 = 0;
    uint64_t v31 = 0;
    uint64_t v35 = *(void *)v82;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v82 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v81 + 1) + 8 * j);
        uint64_t v38 = [v32 objectForKey:v37];
        unint64_t v39 = [v38 unsignedIntegerValue];

        if (v39 > v34)
        {
          id v40 = v37;

          unint64_t v34 = v39;
          uint64_t v31 = v40;
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v81 objects:v107 count:16];
    }
    while (v33);
  }
  else
  {
    uint64_t v31 = 0;
  }

LABEL_29:
  if ([v31 isEqualToString:@"Cyrl"])
  {
LABEL_30:
    v41 = 0;
    id v42 = 0;
    goto LABEL_87;
  }
  id v43 = v73;
  id v44 = v78;
  uint64_t v45 = [v44 length];
  if (!v43 || !v44 || (unint64_t v46 = v45, ![v43 hasPrefix:v44]))
  {

    goto LABEL_39;
  }
  if ([v43 length] <= v46)
  {

LABEL_60:
    id v42 = v43;
    uint64_t v62 = [v72 objectForKey:v44];
    goto LABEL_86;
  }
  int v47 = [v43 characterAtIndex:v46];

  if (v47 == 95 || v47 == 45) {
    goto LABEL_60;
  }
LABEL_39:
  uint64_t v48 = (void *)v98[5];
  id v49 = v43;
  id v50 = v48;
  uint64_t v51 = [v50 length];
  if (!v43 || !v50 || (unint64_t v52 = v51, ![v49 hasPrefix:v50]))
  {

    goto LABEL_47;
  }
  if ([v49 length] <= v52)
  {

LABEL_62:
    id v42 = v49;
    uint64_t v62 = [v72 objectForKey:v98[5]];
    goto LABEL_86;
  }
  int v53 = [v49 characterAtIndex:v52];

  if (v53 == 95 || v53 == 45) {
    goto LABEL_62;
  }
LABEL_47:
  id v54 = v49;
  id v55 = v80;
  uint64_t v56 = [v55 length];
  if (!v43 || !v55 || (unint64_t v57 = v56, ![v54 hasPrefix:v55]))
  {

    goto LABEL_55;
  }
  if ([v54 length] <= v57)
  {
  }
  else
  {
    int v58 = [v54 characterAtIndex:v57];

    if (v58 != 95 && v58 != 45) {
      goto LABEL_55;
    }
  }
  if ((double)v79 * 4.0 > (double)(unint64_t)v104[3] || (double)v79 + (double)v79 > (double)v22) {
    goto LABEL_30;
  }
LABEL_55:
  id v59 = (void *)v98[5];
  if (v59 && ([v59 isEqualToString:v44] & 1) == 0)
  {
    int v60 = [v71 containsObject:v98[5]];
    v61 = (void *)v98[5];
    if (v60)
    {
      id v42 = v61;
      goto LABEL_73;
    }
    id v63 = alternativesMatchingLanguage(v71, v61);
    if ([v63 containsObject:v98[5]])
    {
      id v64 = (id)v98[5];
      goto LABEL_71;
    }
    if ([v63 count])
    {
      id v64 = [v63 objectAtIndex:0];
LABEL_71:
      id v42 = v64;
    }
    else
    {
      id v42 = 0;
    }

LABEL_73:
    if (v42)
    {
      uint64_t v62 = [v72 objectForKey:v98[5]];
      goto LABEL_86;
    }
  }
  if ((double)v22 + (double)v22 <= (double)(unint64_t)v104[3]) {
    goto LABEL_30;
  }
  if ([v71 containsObject:v44])
  {
    id v42 = v44;
    goto LABEL_84;
  }
  v65 = alternativesMatchingLanguage(v71, v44);
  if ([v65 containsObject:v54])
  {
    id v66 = v54;
    goto LABEL_82;
  }
  if ([v65 count])
  {
    id v66 = [v65 objectAtIndex:0];
LABEL_82:
    id v42 = v66;
  }
  else
  {
    id v42 = 0;
  }

LABEL_84:
  if (v42)
  {
    uint64_t v62 = [v72 objectForKey:v44];
LABEL_86:
    v41 = (void *)v62;
  }
  else
  {
    v41 = 0;
  }
LABEL_87:
  if (a7) {
    *a7 = v41;
  }
  uint64_t v67 = v93;
  id v68 = v42;

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  return v68;
}

void __114__UITextChecker_bestLanguageForString_fromAlternatives_currentLanguage_insertionPointIndex_scriptForBestLanguage___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v17 = a2;
  id v8 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x1E4F28538] tokenRange:0 sentenceRange:0];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a4;
  if (v17)
  {
    id v9 = [*(id *)(a1 + 40) objectForKey:v17];
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + a4);
    [v10 setObject:v11 forKey:v17];

    unint64_t v12 = *(void *)(a1 + 80);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
      if (a3 < v12 || !*(void *)(v13 + 40)) {
        objc_storeStrong((id *)(v13 + 40), a2);
      }
    }
  }
  if (v8)
  {
    char v14 = [*(id *)(a1 + 48) objectForKey:v8];
    id v15 = *(void **)(a1 + 48);
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + a4);
    [v15 setObject:v16 forKey:v8];

    if (v17) {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v8);
    }
  }
}

+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5
{
  return (id)[a1 bestLanguageForString:a3 fromAlternatives:a4 currentLanguage:a5 insertionPointIndex:0x7FFFFFFFFFFFFFFFLL scriptForBestLanguage:0];
}

+ (__CFSet)createDictHashTable:(BOOL)a3
{
  memset(&v5, 0, 32);
  v5.hash = (CFSetHashCallBack)strHashNoCase;
  v5.equal = (CFSetEqualCallBack)strIsEqualNoCase;
  if (a3) {
    id v3 = (void (__cdecl *)(CFAllocatorRef, const void *))ReallyFree;
  }
  else {
    id v3 = 0;
  }
  v5.release = v3;
  return CFSetCreateMutable(0, 0, &v5);
}

+ (id)openUserDictionary:(id)a3
{
  id v4 = a3;
  CFSetCallBacks v5 = v4;
  if (v4 && ![v4 isEqualToString:*MEMORY[0x1E4F283E0]])
  {
    char v14 = 0;
    goto LABEL_34;
  }
  id v6 = (void *)MEMORY[0x18C108260]();
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__216;
  v41 = __Block_byref_object_dispose__216;
  id v42 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  if (!v7) {
    goto LABEL_10;
  }
  id v8 = connectionToRemoteDataServer();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __dataWithContentsOfUserDictionary_block_invoke;
  v35[3] = &unk_1E52E3C18;
  id v9 = v7;
  uint64_t v36 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v35];

  if (!v10)
  {
LABEL_9:

LABEL_10:
    id v13 = (id)v38[5];
    goto LABEL_11;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __dataWithContentsOfUserDictionary_block_invoke_2;
  v32[3] = &unk_1E530C3E8;
  unint64_t v34 = &v37;
  uint64_t v11 = v9;
  uint64_t v33 = v11;
  [v10 requestTextCheckerLocalDictionaryWithCompletionHandler:v32];
  dispatch_time_t v12 = dispatch_time(0, 3000000000);
  if (!dispatch_semaphore_wait(v11, v12))
  {

    goto LABEL_9;
  }
  NSLog(&cfstr_SRequestedData_0.isa, "dataWithContentsOfUserDictionary", 3);

  id v13 = 0;
LABEL_11:

  _Block_object_dispose(&v37, 8);
  id v15 = v13;
  uint64_t v16 = (char *)[v15 bytes];
  uint64_t v17 = [v15 length];
  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18) {
    goto LABEL_32;
  }
  uint64_t v19 = v17;
  id v30 = v6;
  uint64_t v31 = v5;
  id v20 = (__CFSet *)[a1 createDictHashTable:0];
  uint64_t v21 = MEMORY[0x18C106640](0);
  if (v19 >= 1)
  {
    unint64_t v22 = (unint64_t)&v16[v19];
    uint64_t v23 = -1;
    unint64_t v24 = 1;
    do
    {
      if (!(v23 + 100 * (v24 / 0x64)))
      {
        MEMORY[0x18C106620](v21);
        uint64_t v21 = MEMORY[0x18C106640](0);
      }
      uint64_t v25 = strchr(v16, 10);
      if (!v25) {
        uint64_t v25 = &v16[strlen(v16)];
      }
      if (*v16 != 35)
      {
        uint64_t v26 = [[NSString alloc] initWithBytesNoCopy:v16 length:v25 - v16 encoding:4 freeWhenDone:0];
        if (v26)
        {
          unint64_t v27 = (void *)v26;
          if (CFSetGetValue(v20, v16)) {
            CFSetRemoveValue(v20, v16);
          }
          else {
            CFSetSetValue(v20, v16);
          }
        }
      }
      uint64_t v16 = v25 + 1;
      --v23;
      ++v24;
    }
    while ((unint64_t)(v25 + 1) < v22);
  }
  MEMORY[0x18C106620](v21);
  id v6 = v30;
  CFSetCallBacks v5 = v31;
  if (!v20) {
    goto LABEL_32;
  }
  uint64_t v28 = [objc_allocWithZone((Class)UITextCheckerDictionaryEntry) init];
  if (!v28)
  {
    CFRelease(v20);
LABEL_32:

    id v15 = 0;
    char v14 = 0;
    goto LABEL_33;
  }
  char v14 = (void *)v28;
  *(void *)(v28 + 8) = v20;
  objc_storeStrong((id *)(v28 + 16), v15);
  v14[3] = v19;
LABEL_33:

LABEL_34:
  return v14;
}

+ (id)_dictionaryEntryForName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  CFSetCallBacks v5 = 0;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__216;
  id v6 = qword_1EB25D608;
  uint64_t v17 = __Block_byref_object_dispose__216;
  id v18 = 0;
  if (qword_1EB25D600) {
    BOOL v7 = qword_1EB25D608 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__UITextChecker__dictionaryEntryForName___block_invoke;
    v10[3] = &unk_1E52E3210;
    dispatch_time_t v12 = &v13;
    id v11 = v3;
    dispatch_sync(v6, v10);

    CFSetCallBacks v5 = (void *)v14[5];
  }
  id v8 = v5;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__UITextChecker__dictionaryEntryForName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)qword_1EB25D600 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)_setDictionaryEntry:(id)a3 forName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = qword_1EB25D608;
  if (qword_1EB25D600) {
    BOOL v8 = qword_1EB25D608 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__UITextChecker__setDictionaryEntry_forName___block_invoke;
    v9[3] = &unk_1E52D9F98;
    id v10 = v5;
    id v11 = v6;
    dispatch_sync(v7, v9);
  }
}

uint64_t __45__UITextChecker__setDictionaryEntry_forName___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [(id)qword_1EB25D600 setObject:v1 forKey:*(void *)(a1 + 40)];
  }
  else {
    return [(id)qword_1EB25D600 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

+ (id)dictionaryInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)*MEMORY[0x1E4F283E0];
  }
  id v5 = [a1 _dictionaryEntryForName:v4];
  if (!v5)
  {
    id v5 = [a1 openUserDictionary:v4];
    if (v5
      || (id v5 = (void *)[objc_allocWithZone((Class)UITextCheckerDictionaryEntry) init]) != 0
      && (uint64_t v7 = [a1 createDictHashTable:1], (v5[1] = v7) != 0))
    {
      [a1 _setDictionaryEntry:v5 forName:v4];
    }
  }

  return v5;
}

+ (BOOL)_learnWord:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];
  if (!v7) {
    id v7 = (id)*MEMORY[0x1E4F283E0];
  }
  uint64_t v10 = [a1 dictionaryInfo:v7];
  id v11 = (CFMutableSetRef *)v10;
  if (v10 && (CFSetRef v12 = *(const __CFSet **)(v10 + 8)) != 0 && !CFSetGetValue(v12, v9))
  {
    uint64_t v15 = strdup(v9);
    CFSetSetValue(v11[1], v15);
    appendWordToDictionary(v8, v7);
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_forgetWord:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = (const void *)[v8 UTF8String];
  if (!v7) {
    id v7 = (id)*MEMORY[0x1E4F283E0];
  }
  uint64_t v10 = [a1 dictionaryInfo:v7];
  id v11 = (CFMutableSetRef *)v10;
  if (v10 && (CFSetRef v12 = *(const __CFSet **)(v10 + 8)) != 0 && CFSetGetValue(v12, v9))
  {
    CFSetRemoveValue(v11[1], v9);
    appendWordToDictionary(v8, v7);
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_isWord:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  id v7 = (const void *)[a3 UTF8String];
  if (!v6) {
    id v6 = (id)*MEMORY[0x1E4F283E0];
  }
  uint64_t v8 = [a1 dictionaryInfo:v6];
  id v9 = (void *)v8;
  v11 = v8 && (CFSetRef v10 = *(const __CFSet **)(v8 + 8)) != 0 && CFSetGetValue(v10, v7) != 0;

  return v11;
}

+ (id)_wordsInDictionary:(id)a3
{
  uint64_t v3 = [a1 dictionaryInfo:a3];
  id v4 = (CFSetRef *)v3;
  if (v3 && (CFSetRef v5 = *(const __CFSet **)(v3 + 8)) != 0 && (Count = CFSetGetCount(v5), Count >= 1))
  {
    CFIndex v7 = Count;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = (const void **)NSZoneMalloc(0, 8 * v7);
    if (v9)
    {
      CFSetRef v10 = v9;
      CFSetGetValues(v4[1], v9);
      for (uint64_t i = 0; i != v7; ++i)
      {
        CFSetRef v12 = (const char *)v10[i];
        if (v12)
        {
          BOOL v13 = strchr((char *)v10[i], 10);
          id v14 = [NSString alloc];
          if (v13) {
            size_t v15 = v13 - v12;
          }
          else {
            size_t v15 = strlen(v12);
          }
          uint64_t v16 = (void *)[v14 initWithBytesNoCopy:v12 length:v15 encoding:4 freeWhenDone:0];
          [v8 addObject:v16];
        }
      }
      NSZoneFree(0, v10);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v17 = (void *)[v8 copy];

  return v17;
}

+ (void)_setWords:(id)a3 inDictionary:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 dictionaryInfo:v6];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    [a1 _setDictionaryEntry:0 forName:v6];
  }
  if (v17)
  {
    uint64_t v9 = [v17 count];
    if (v9)
    {
      CFSetRef v10 = 0;
      id v11 = 0;
      uint64_t v12 = v9 - 1;
      BOOL v13 = v17;
      do
      {
        if (v10
          || ([a1 dictionaryInfo:v6],
              CFSetRef v10 = (CFMutableSetRef *)objc_claimAutoreleasedReturnValue(),
              BOOL v13 = v17,
              v10))
        {
          if (v10[1])
          {
            id v14 = [v13 objectAtIndex:v12];

            if (v14)
            {
              id v11 = v14;
              size_t v15 = (const void *)[v11 UTF8String];
              if (CFSetGetValue(v10[1], v15))
              {
                CFSetRemoveValue(v10[1], v15);
              }
              else
              {
                uint64_t v16 = strdup((const char *)v15);
                CFSetSetValue(v10[1], v16);
              }
            }
            else
            {
              id v11 = 0;
            }
            BOOL v13 = v17;
          }
        }
        --v12;
      }
      while (v12 != -1);
    }
  }
}

- (void)ignoreWord:(NSString *)wordToIgnore
{
  id v4 = wordToIgnore;
  CFSetRef v5 = objc_opt_class();
  id v6 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
  [v5 _learnWord:v4 inDictionary:v6];
}

- (NSArray)ignoredWords
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
  CFSetRef v5 = [v3 _wordsInDictionary:v4];

  return (NSArray *)v5;
}

- (void)setIgnoredWords:(NSArray *)ignoredWords
{
  id v4 = ignoredWords;
  CFSetRef v5 = objc_opt_class();
  id v6 = [(UITextChecker *)self _nameOfDictionaryForDocumentTag:self->_usdt];
  [v5 _setWords:v4 inDictionary:v6];
}

+ (void)learnWord:(NSString *)word
{
}

+ (BOOL)hasLearnedWord:(NSString *)word
{
  return [a1 _isWord:word inDictionary:0];
}

+ (void)unlearnWord:(NSString *)word
{
}

- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)qword_1EB25D5F8;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend((id)objc_opt_class(), "_isWord:inDictionary:", v4, *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = [v4 lowercaseString];

  id v4 = v9;
  id v10 = (id)qword_1EB25D620;
  objc_sync_enter(v10);
  id v5 = [(id)qword_1EB25D620 objectForKey:v4];
  objc_sync_exit(v10);

  if (v5)
  {
    LOBYTE(v11) = [v5 BOOLValue];
  }
  else
  {
    id v4 = v4;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    if (v13)
    {
      id v14 = connectionToRemoteDataServer();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __stringIsExemptFromChecker_block_invoke;
      v25[3] = &unk_1E52E3C18;
      size_t v15 = v13;
      uint64_t v26 = v15;
      uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v25];

      if (v16)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __stringIsExemptFromChecker_block_invoke_2;
        v22[3] = &unk_1E52E5B98;
        unint64_t v24 = &v27;
        id v17 = v15;
        uint64_t v23 = v17;
        [v16 string:v4 isExemptFromTextCheckerWithCompletionHandler:v22];
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    uint64_t v11 = *((unsigned char *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
    setCachedExemptionForString(v4, v11);
    id v5 = 0;
  }
LABEL_12:

  return v11;
}

+ (void)setString:(id)a3 isExemptFromChecker:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([v7 length])
  {
    id v5 = [v7 lowercaseString];

    setCachedExemptionForString(v5, v4);
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = v7;
  }
}

- (void).cxx_destruct
{
}

@end