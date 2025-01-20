@interface ICHashtagController
+ (BOOL)isBeginningHashtagAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5;
+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3;
+ (BOOL)isValidPrefixCharacter:(unsigned __int16)a3 languageHasSpaces:(BOOL)a4;
+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4;
+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5;
+ (BOOL)range:(_NSRange)a3 isPrefixedWithHashtagForString:(id)a4;
+ (BOOL)shouldAutoConvertToTag;
+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4;
+ (_NSRange)rangeOfLastCharacterInRange:(_NSRange)a3;
+ (void)setShouldAutoConvertToTag:(BOOL)a3;
- (BOOL)allowsHashtag;
- (BOOL)isUpdatingKeyboard;
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICHashtagAnalyticsDelegate)analyticsDelegate;
- (ICHashtagController)initWithNote:(id)a3;
- (ICHashtagKeyboardDelegate)hashtagKeyboardDelegate;
- (ICHashtagKeyboardDelegate)hashtagTableKeyboardDelegate;
- (ICHashtagsNode)hashtagsTree;
- (ICNote)note;
- (ICTableColumnTextView)tableTextView;
- (NSMutableDictionary)hashtagSuggestionsDictionary;
- (NSMutableSet)hashtagsNames;
- (UITextView)textView;
- (_NSRange)editedRange;
- (id)checkForHashtagInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6;
- (id)hashtagSuggestionsForKey:(id)a3;
- (unint64_t)maxNameLength;
- (void)associateHashtagSuggestion:(id)a3 withKey:(id)a4;
- (void)crossAppHashtagDidChange:(id)a3;
- (void)dealloc;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setEditedRange:(_NSRange)a3;
- (void)setHashtagKeyboardDelegate:(id)a3;
- (void)setHashtagSuggestionsDictionary:(id)a3;
- (void)setHashtagTableKeyboardDelegate:(id)a3;
- (void)setHashtagsNames:(id)a3;
- (void)setHashtagsTree:(id)a3;
- (void)setIsUpdatingKeyboard:(BOOL)a3;
- (void)setMaxNameLength:(unint64_t)a3;
- (void)setNote:(id)a3;
- (void)setTableTextView:(id)a3;
- (void)setTextView:(id)a3;
- (void)updateHashtagsAssociations;
@end

@implementation ICHashtagController

- (ICHashtagController)initWithNote:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICHashtagController;
  v5 = [(ICHashtagController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_note, v4);
    [(ICHashtagController *)v6 updateHashtagsAssociations];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_crossAppHashtagDidChange_ name:@"ICCrossAppHashtagDisplayTextUpdatedNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel_accountWasDeleted_ name:@"ICAccountWasDeletedNotification" object:0];
  }
  return v6;
}

- (void)updateHashtagsAssociations
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(ICHashtagController *)self allowsHashtag])
  {
    v3 = [(ICHashtagController *)self note];
    id v4 = [v3 account];
    v5 = [v4 managedObjectContext];
    v6 = +[ICHashtag allVisibleHashtagsInContext:v5];

    v7 = +[ICHashtagSuggestionItem suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:v6];
    [(ICHashtagController *)self setMaxNameLength:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICHashtagController *)self setHashtagSuggestionsDictionary:v8];

    v9 = objc_alloc_init(ICHashtagsNode);
    [(ICHashtagController *)self setHashtagsTree:v9];

    objc_super v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 4 * objc_msgSend(v7, "count"));
    [(ICHashtagController *)self setHashtagsNames:v10];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "displayText", (void)v23);
          v18 = objc_msgSend(v17, "ic_tokenSafeText");
          [(ICHashtagController *)self associateHashtagSuggestion:v16 withKey:v18];

          v19 = [v16 displayText];
          unint64_t v20 = [v19 length];

          unint64_t v21 = [(ICHashtagController *)self maxNameLength];
          if (v20 <= v21) {
            unint64_t v22 = v21;
          }
          else {
            unint64_t v22 = v20;
          }
          [(ICHashtagController *)self setMaxNameLength:v22];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }
  }
}

- (void)setMaxNameLength:(unint64_t)a3
{
  self->_maxNameLength = a3;
}

- (void)setHashtagsTree:(id)a3
{
}

- (void)setHashtagsNames:(id)a3
{
}

- (void)setHashtagSuggestionsDictionary:(id)a3
{
}

- (BOOL)allowsHashtag
{
  v3 = [(ICHashtagController *)self note];
  if ([v3 isPasswordProtected])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(ICHashtagController *)self note];
    int v4 = [v5 isSharedReadOnly] ^ 1;
  }
  return v4;
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  return (ICNote *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICHashtagController;
  [(ICHashtagController *)&v4 dealloc];
}

- (id)checkForHashtagInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  id v12 = a3;
  if ([(ICHashtagController *)self allowsHashtag]
    && ([v12 string],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unint64_t v14 = [v13 length],
        v13,
        v10 + v9 <= v14))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3010000000;
    v42[3] = &unk_1C3E4C23B;
    long long v43 = xmmword_1C3DD2F80;
    v16 = objc_alloc_init(ICHashtagsCheckResults);
    v17 = objc_opt_class();
    v18 = [v12 string];
    int v19 = objc_msgSend(v17, "isBeginningHashtagAtSelectionRange:inString:languageHasSpaces:", location, length, v18, v6);

    if (v19)
    {
      -[ICHashtagsCheckResults setRangeOfHashtag:](v16, "setRangeOfHashtag:", location - 1, 1);
      unint64_t v20 = [(ICHashtagController *)self note];
      unint64_t v21 = [v20 account];
      unint64_t v22 = [v21 managedObjectContext];
      long long v23 = +[ICHashtag allVisibleHashtagsInContext:v22];

      long long v24 = +[ICHashtagSuggestionItem suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:v23];
      long long v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
      [(ICHashtagsCheckResults *)v16 setMatchingHashtagSuggestions:v25];

      v15 = v16;
    }
    else
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x3032000000;
      v40[3] = __Block_byref_object_copy__2;
      v40[4] = __Block_byref_object_dispose__2;
      id v41 = [(ICHashtagController *)self hashtagsTree];
      long long v26 = [v12 string];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __88__ICHashtagController_checkForHashtagInString_inRange_selectionRange_languageHasSpaces___block_invoke;
      v34[3] = &unk_1E64A47A0;
      v37 = v40;
      v38 = v42;
      v34[4] = self;
      id v35 = v12;
      BOOL v39 = v6;
      v27 = v16;
      v36 = v27;
      objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", v10, v9, 2, v34);

      if ([(ICHashtagsCheckResults *)v27 rangeOfHashtag] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(ICHashtagsCheckResults *)v27 rangeOfHashtag];
        uint64_t v28 = [(ICHashtagsCheckResults *)v27 rangeOfHashtag];
        [(ICHashtagsCheckResults *)v27 rangeOfHashtag];
        -[ICHashtagsCheckResults setRangeOfHashtag:](v27, "setRangeOfHashtag:", v28 - 1, v29 + 1);
      }
      if ([(ICHashtagsCheckResults *)v27 rangeOfHashtag] == 0x7FFFFFFFFFFFFFFFLL
        || ([(ICHashtagsCheckResults *)v27 rangeOfHashtag], !v30))
      {
        v15 = 0;
      }
      else
      {
        v31 = [(ICHashtagsCheckResults *)v27 matchingHashtagSuggestions];
        uint64_t v32 = [v31 count];

        if (!v32) {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"results.matchingHashtagSuggestions.count > 0" functionName:"-[ICHashtagController checkForHashtagInString:inRange:selectionRange:languageHasSpaces:]" simulateCrash:1 showAlert:0 format:@"No matching hashtags"];
        }
        v15 = v27;
      }

      _Block_object_dispose(v40, 8);
    }

    _Block_object_dispose(v42, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __88__ICHashtagController_checkForHashtagInString_inRange_selectionRange_languageHasSpaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v35 = objc_msgSend(a2, "ic_tokenSafeText");
  uint64_t v7 = [v35 length];
  id v8 = v35;
  if (v7)
  {
    NSUInteger v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      id v11 = objc_msgSend(v8, "ic_substringWithRange:", v10, 1);
      id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
      uint64_t v13 = [v12 objectForKey:v11];

      if (!v13) {
        break;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
      unint64_t v14 = [v11 length];
      if (v14 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v14;
      }
      v10 += v15;

      unint64_t v16 = [v35 length];
      NSUInteger v9 = v13;
      id v8 = v35;
      if (v10 >= v16) {
        goto LABEL_10;
      }
    }
    *(_OWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = xmmword_1C3DD2F80;
    uint64_t v17 = [*(id *)(a1 + 32) hashtagsTree];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    int v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    unint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
    uint64_t v13 = [v20 objectForKey:v11];

    id v8 = v35;
    if (!v13) {
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v21 = objc_msgSend((id)objc_opt_class(), "range:appendingSubstringRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3, a4);
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    *(void *)(v22 + 32) = v21;
    *(void *)(v22 + 40) = v23;
    long long v24 = objc_opt_class();
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v26 = [*(id *)(a1 + 40) string];
    LODWORD(v24) = objc_msgSend(v24, "range:hasValidPrefixCharacterForString:languageHasSpaces:", *(void *)(v25 + 32), *(void *)(v25 + 40), v26, *(unsigned __int8 *)(a1 + 72));

    if (v24)
    {
      v27 = objc_opt_class();
      uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v29 = [*(id *)(a1 + 40) string];
      LODWORD(v27) = objc_msgSend(v27, "range:isPrefixedWithHashtagForString:", *(void *)(v28 + 32), *(void *)(v28 + 40), v29);

      if (v27)
      {
        objc_msgSend(*(id *)(a1 + 48), "setRangeOfHashtag:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        uint64_t v30 = [v13 possibleHashtagSuggestions];
        v31 = (void *)[v30 copy];
        [*(id *)(a1 + 48) setMatchingHashtagSuggestions:v31];
      }
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v13;
    id v34 = v13;

    id v8 = v35;
  }
LABEL_14:
}

- (void)crossAppHashtagDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICHashtagController_crossAppHashtagDidChange___block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__ICHashtagController_crossAppHashtagDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHashtagsAssociations];
}

- (void)associateHashtagSuggestion:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 length])
  {
    NSUInteger v9 = [(ICHashtagController *)self hashtagsNames];
    [v9 addObject:v8];

    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__2;
    uint64_t v22 = __Block_byref_object_dispose__2;
    id v23 = [(ICHashtagController *)self hashtagsTree];
    uint64_t v10 = [v8 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__ICHashtagController_associateHashtagSuggestion_withKey___block_invoke;
    v15[3] = &unk_1E64A47C8;
    uint64_t v17 = &v18;
    id v11 = v6;
    id v16 = v11;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v15);
    [(id)v19[5] addHashtagSuggestion:v11];
    id v12 = [(ICHashtagController *)self hashtagSuggestionsDictionary];
    uint64_t v13 = [v12 objectForKey:v8];

    if (v13) {
      [v13 addObject:v11];
    }
    else {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v11, 0);
    }
    unint64_t v14 = [(ICHashtagController *)self hashtagSuggestionsDictionary];
    [v14 setObject:v13 forKey:v8];

    _Block_object_dispose(&v18, 8);
  }
}

void __58__ICHashtagController_associateHashtagSuggestion_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) children];
  objc_super v4 = [v3 objectForKey:v7];

  if (!v4)
  {
    objc_super v4 = objc_alloc_init(ICHashtagsNode);
    [(ICHashtagsNode *)v4 setKey:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addChild:v4];
  }
  [(ICHashtagsNode *)v4 addPossibleHashtagSuggestion:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)hashtagSuggestionsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICHashtagController *)self hashtagSuggestionsDictionary];
  id v6 = objc_msgSend(v4, "ic_tokenSafeText");

  id v7 = [v5 objectForKey:v6];
  id v8 = (void *)[v7 copy];

  return v8;
}

+ (_NSRange)rangeOfLastCharacterInRange:(_NSRange)a3
{
  NSUInteger v3 = a3.length != 0;
  if (a3.length) {
    NSUInteger v4 = a3.length + a3.location - 1;
  }
  else {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.NSUInteger length = v3;
  result.NSUInteger location = v4;
  return result;
}

+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger location = a4.location;
  }
  else {
    NSUInteger location = a3.location;
  }
  NSUInteger v5 = a4.location + a4.length - location;
  result.NSUInteger length = v5;
  result.NSUInteger location = location;
  return result;
}

+ (BOOL)isBeginningHashtagAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  uint64_t v10 = v9;
  char v11 = 0;
  if (location && !length)
  {
    if (location - 1 >= [v9 length])
    {
      char v11 = 0;
    }
    else
    {
      int v12 = [v10 characterAtIndex:location - 1];
      __int16 v20 = v12;
      char v18 = 1;
      int v19 = [NSString stringWithCharacters:&v20 length:1];
      uint64_t v13 = [v19 stringByApplyingTransform:*MEMORY[0x1E4F1C4C8] reverse:0];
      unint64_t v14 = objc_msgSend(NSString, "ic_hashtagCharacterString");
      int v15 = [v13 isEqualToString:v14];

      if (v12 == 35) {
        int v15 = 1;
      }
      if (location < [v10 length]) {
        char v18 = objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", location, 0, v10);
      }
      char v16 = objc_msgSend(a1, "range:hasValidPrefixCharacterForString:languageHasSpaces:", location - 1, 0, v10, v5);
      if (v15) {
        char v11 = v18 & v16;
      }
      else {
        char v11 = 0;
      }
    }
  }

  return v11;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithHashtagForString:(id)a4
{
  int64_t location = a3.location;
  id v5 = a4;
  id v6 = v5;
  BOOL v7 = location < 1;
  unint64_t v8 = location - 1;
  BOOL v9 = !v7 && v8 < [v5 length] && objc_msgSend(v6, "characterAtIndex:", v8) == 35;

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t location = a3.location;
  id v8 = a4;
  BOOL v9 = v8;
  if (location)
  {
    if (location < 1 || (unint64_t v10 = location - 1, v10 >= [v8 length])) {
      char v11 = 0;
    }
    else {
      char v11 = objc_msgSend(a1, "isValidPrefixCharacter:languageHasSpaces:", objc_msgSend(v9, "characterAtIndex:", v10), v5);
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (BOOL)isValidPrefixCharacter:(unsigned __int16)a3 languageHasSpaces:(BOOL)a4
{
  if (!a4) {
    return 1;
  }
  uint64_t v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v5 characterIsMember:v4])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v6 = [v7 characterIsMember:v4];
  }
  return v6;
}

+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = location + length;
  if (v9 < 0 || v9 >= (unint64_t)[v7 length]) {
    char v10 = 0;
  }
  else {
    char v10 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v8, "characterAtIndex:", v9));
  }

  return v10;
}

+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v4 characterIsMember:v3])
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v5 = [v6 characterIsMember:v3];
  }
  return v5;
}

+ (BOOL)shouldAutoConvertToTag
{
  objc_opt_class();
  v2 = [MEMORY[0x1E4F837D0] objectForKey:@"ICHashtagsShouldAutoConvertToTagDefaultsKey"];
  uint64_t v3 = ICCheckedDynamicCast();

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (void)setShouldAutoConvertToTag:(BOOL)a3
{
}

- (ICHashtagKeyboardDelegate)hashtagKeyboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagKeyboardDelegate);
  return (ICHashtagKeyboardDelegate *)WeakRetained;
}

- (void)setHashtagKeyboardDelegate:(id)a3
{
}

- (ICHashtagKeyboardDelegate)hashtagTableKeyboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagTableKeyboardDelegate);
  return (ICHashtagKeyboardDelegate *)WeakRetained;
}

- (void)setHashtagTableKeyboardDelegate:(id)a3
{
}

- (BOOL)isUpdatingKeyboard
{
  return self->_isUpdatingKeyboard;
}

- (void)setIsUpdatingKeyboard:(BOOL)a3
{
  self->_isUpdatingKeyboard = a3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentInsertionController);
  return (ICAttachmentInsertionController *)WeakRetained;
}

- (void)setNote:(id)a3
{
}

- (_NSRange)editedRange
{
  NSUInteger length = self->_editedRange.length;
  NSUInteger location = self->_editedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEditedRange:(_NSRange)a3
{
  self->_editedRange = a3;
}

- (ICTableColumnTextView)tableTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableTextView);
  return (ICTableColumnTextView *)WeakRetained;
}

- (void)setTableTextView:(id)a3
{
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (ICHashtagAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (ICHashtagAnalyticsDelegate *)WeakRetained;
}

- (NSMutableDictionary)hashtagSuggestionsDictionary
{
  return self->_hashtagSuggestionsDictionary;
}

- (NSMutableSet)hashtagsNames
{
  return self->_hashtagsNames;
}

- (ICHashtagsNode)hashtagsTree
{
  return self->_hashtagsTree;
}

- (unint64_t)maxNameLength
{
  return self->_maxNameLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtagsTree, 0);
  objc_storeStrong((id *)&self->_hashtagsNames, 0);
  objc_storeStrong((id *)&self->_hashtagSuggestionsDictionary, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_tableTextView);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_hashtagTableKeyboardDelegate);
  objc_destroyWeak((id *)&self->_hashtagKeyboardDelegate);
}

@end