@interface TIRevisionHistory
+ (id)documentStateTrimmedToSentenceForState:(id)a3;
- (BOOL)isDeletingBackwards;
- (BOOL)isRapidDeleteActive;
- (BOOL)isSelectionContainedByToken:(_TIRevisionHistoryTokenIterator)a3;
- (BOOL)isWordToken:(_TIRevisionHistoryTokenIterator)a3;
- (BOOL)matchesContextAfterSelection:(id)a3;
- (BOOL)matchesContextBeforeSelection:(id)a3;
- (BOOL)matchesDocumentState:(id)a3;
- (BOOL)matchesSelectedText:(id)a3;
- (BOOL)originalIterator:(_TIRevisionHistoryTokenIterator)a3 matchesRevisedDocumentRange:(_NSRange)a4 andTokenID:(TITokenID)a5;
- (BOOL)shouldReportRevisionToDP;
- (BOOL)shouldValidateOriginalIterator:(_TIRevisionHistoryTokenIterator)a3 withRevisedDocumentRange:(_NSRange)a4 forRevision:(id)a5;
- (BOOL)validateTokenizationForRevisedDocumentRange:(_NSRange)a3 andTokenID:(TITokenID)a4 forRevision:(id)a5;
- (NSMutableArray)tokenization;
- (NSString)documentText;
- (TILRUDictionary)autocorrectionHistory;
- (TILRUDictionary)recentAutocorrections;
- (TIRevisionHistory)init;
- (TIRevisionHistory)initWithLocale:(id)a3;
- (TIRevisionHistoryDelegate)delegate;
- (TIRevisionHistoryToken)lastRejectedToken;
- (_NSRange)deletionRangeToObtainDocumentState:(id)a3;
- (_NSRange)documentRangeOfTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3;
- (_NSRange)inputRangeForReplacement:(id)a3;
- (_NSRange)selectedRange;
- (_NSRange)selectedTokenRangeWithIterator:(_TIRevisionHistoryTokenIterator)a3;
- (_TIRevisionHistoryTokenIterator)currentTokenIterator;
- (_TIRevisionHistoryTokenIterator)iteratorUpperBoundForSelectionStart;
- (_TIRevisionHistoryTokenIterator)nextTokenIterator:(_TIRevisionHistoryTokenIterator)a3;
- (_TIRevisionHistoryTokenIterator)popSelectedTextFromTokenizer;
- (_TIRevisionHistoryTokenIterator)previousTokenIterator:(_TIRevisionHistoryTokenIterator)a3;
- (_TIRevisionHistoryTokenIterator)resetTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3 withRange:(_NSRange)a4 fromDocumentLocation:(unint64_t)a5;
- (id)contextForTokenAtIndex:(unint64_t)a3;
- (id)currentUserTyping;
- (id)currentWord;
- (id)documentState;
- (id)nonEmptyTokensInRange:(_NSRange)a3;
- (id)tokenAtIterator:(_TIRevisionHistoryTokenIterator)a3;
- (id)wordTokenContainingSelection;
- (unint64_t)tokenizeDocumentTextInRange:(_NSRange)a3 withTokenHandler:(id)a4;
- (void)acceptCurrentSentence;
- (void)acceptText:(id)a3 isAutocorrection:(BOOL)a4 isAutoshifted:(BOOL)a5;
- (void)acceptToken:(id)a3 contextTokens:(id)a4 saveToDifferentialPrivacy:(int)a5;
- (void)acceptTokensInRange:(_NSRange)a3;
- (void)addRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 inDocumentRange:(_NSRange)a5 toRevision:(id)a6;
- (void)adjustTokenOffsetAfterDeletedTokenRange:(_NSRange)a3 withDeletedCharacterCount:(unint64_t)a4;
- (void)annotateTokensCreatedFromDocumentState;
- (void)collectPFLTelemetryForTokenAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)enumerateSentenceStemUsingBlock:(id)a3;
- (void)enumerateSentenceStemUsingIteratorBlock:(id)a3;
- (void)handleRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 forRevision:(id)a5;
- (void)insertText:(id)a3;
- (void)mergeTokenizationsForRevision:(id)a3;
- (void)migrateUserTypingFromDeletedTokens:(id)a3 toInsertedTokens:(id)a4 withUsageLearningMask:(unsigned int)a5 usageTrackingMask:(unsigned int)a6;
- (void)pushSelectedTextToTokenizerForRevision:(id)a3;
- (void)rejectCandidate:(id)a3 forInput:(id)a4 hint:(int)a5;
- (void)rejectToken:(id)a3 contextTokens:(id)a4 negativeLearningHint:(int)a5 withRevisedToken:(id)a6;
- (void)rejectTokensInRange:(_NSRange)a3 negativeLearningHint:(int)a4 newRevision:(id)a5;
- (void)replaceSelectionWithText:(id)a3 latinInputString:(id)a4 negativeLearningHint:(int)a5 selectedTokenReplacementHandler:(id)a6;
- (void)resetToDocumentState:(id)a3;
- (void)setAutocorrectionHistory:(id)a3;
- (void)setCurrentTokenIterator:(_TIRevisionHistoryTokenIterator)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentText:(id)a3;
- (void)setIsDeletingBackwards:(BOOL)a3;
- (void)setIsRapidDeleteActive:(BOOL)a3;
- (void)setLastRejectedToken:(id)a3;
- (void)setRecentAutocorrections:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShouldReportRevisionToDP:(BOOL)a3;
- (void)syncToDocumentState:(id)a3;
- (void)tokenizer;
@end

@implementation TIRevisionHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRejectedToken, 0);
  objc_storeStrong((id *)&self->_tokenization, 0);
  objc_storeStrong((id *)&self->_documentText, 0);
  objc_storeStrong((id *)&self->_autocorrectionHistory, 0);

  objc_storeStrong((id *)&self->_recentAutocorrections, 0);
}

- (void)setIsRapidDeleteActive:(BOOL)a3
{
  self->_isRapidDeleteActive = a3;
}

- (BOOL)isRapidDeleteActive
{
  return self->_isRapidDeleteActive;
}

- (void)setIsDeletingBackwards:(BOOL)a3
{
  self->_isDeletingBackwards = a3;
}

- (BOOL)isDeletingBackwards
{
  return self->_isDeletingBackwards;
}

- (void)setShouldReportRevisionToDP:(BOOL)a3
{
  self->_shouldReportRevisionToDP = a3;
}

- (BOOL)shouldReportRevisionToDP
{
  return self->_shouldReportRevisionToDP;
}

- (void)setLastRejectedToken:(id)a3
{
}

- (TIRevisionHistoryToken)lastRejectedToken
{
  return self->_lastRejectedToken;
}

- (void)tokenizer
{
  return self->_tokenizer;
}

- (void)setCurrentTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  self->_currentTokenIterator = a3;
}

- (_TIRevisionHistoryTokenIterator)currentTokenIterator
{
  unint64_t documentLocation = self->_currentTokenIterator.documentLocation;
  unint64_t tokenIndex = self->_currentTokenIterator.tokenIndex;
  result.unint64_t documentLocation = documentLocation;
  result.unint64_t tokenIndex = tokenIndex;
  return result;
}

- (NSMutableArray)tokenization
{
  return self->_tokenization;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDocumentText:(id)a3
{
}

- (NSString)documentText
{
  return self->_documentText;
}

- (void)setAutocorrectionHistory:(id)a3
{
}

- (TILRUDictionary)autocorrectionHistory
{
  return self->_autocorrectionHistory;
}

- (void)setRecentAutocorrections:(id)a3
{
}

- (TILRUDictionary)recentAutocorrections
{
  return self->_recentAutocorrections;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIRevisionHistoryDelegate *)a3;
}

- (TIRevisionHistoryDelegate)delegate
{
  return self->_delegate;
}

- (id)currentUserTyping
{
  v2 = [(TIRevisionHistory *)self wordTokenContainingSelection];
  v3 = [v2 userTyping];

  return v3;
}

- (id)currentWord
{
  v2 = [(TIRevisionHistory *)self wordTokenContainingSelection];
  v3 = [v2 tokenInputString];

  return v3;
}

- (void)enumerateSentenceStemUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v10 = [(TIRevisionHistory *)self selectedRange];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__TIRevisionHistory_enumerateSentenceStemUsingBlock___block_invoke;
  v6[3] = &unk_1E6E2B670;
  id v7 = v4;
  v8 = v9;
  v6[4] = self;
  id v5 = v4;
  [(TIRevisionHistory *)self enumerateSentenceStemUsingIteratorBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __53__TIRevisionHistory_enumerateSentenceStemUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "tokenAtIterator:", a2, a3);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "documentRangeOfTokenAtIterator:", a2, a3);
  uint64_t v10 = v8;
  unint64_t v11 = v9;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v13 = *(void *)(v12 + 24);
  if (v13 <= v8 + v9) {
    unint64_t v14 = v9;
  }
  else {
    unint64_t v14 = v13 - v8;
  }
  *(void *)(v12 + 24) = v8;
  uint64_t v15 = *(void *)(a1 + 40);
  v16 = [v17 tokenInputString];
  (*(void (**)(uint64_t, void *, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v16, v10, v11, v10, v14, [v17 tokenID], a4);
}

- (void)syncToDocumentState:(id)a3
{
  id v8 = a3;
  if (!-[TIRevisionHistory matchesDocumentState:](self, "matchesDocumentState:"))
  {
    if (![(TIRevisionHistory *)self isDeletingBackwards]
      || (uint64_t v4 = [(TIRevisionHistory *)self deletionRangeToObtainDocumentState:v8],
          v4 == 0x7FFFFFFFFFFFFFFFLL)
      || !v5
      || (-[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v4, v5),
          -[TIRevisionHistory replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:](self, "replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:", &stru_1F3F7A998, 0, 2, 0), -[TIRevisionHistory selectedRange](self, "selectedRange") == 0)&& ([v8 contextBeforeInput], v6 = objc_claimAutoreleasedReturnValue(), uint64_t v7 = objc_msgSend(v6, "length"), v6, v7))
    {
      [(TIRevisionHistory *)self setIsDeletingBackwards:0];
      [(TIRevisionHistory *)self acceptCurrentSentence];
      [(TIRevisionHistory *)self resetToDocumentState:v8];
    }
  }
}

- (BOOL)matchesDocumentState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contextBeforeInput];
  BOOL v6 = [(TIRevisionHistory *)self matchesContextBeforeSelection:v5];

  if (v6
    && ([v4 selectedText],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [(TIRevisionHistory *)self matchesSelectedText:v7],
        v7,
        v8))
  {
    unint64_t v9 = [v4 contextAfterInput];
    BOOL v10 = [(TIRevisionHistory *)self matchesContextAfterSelection:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)matchesContextAfterSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 length];
    uint64_t v7 = [(TIRevisionHistory *)self documentText];
    uint64_t v8 = [v7 length];
    uint64_t v9 = [(TIRevisionHistory *)self selectedRange];
    uint64_t v11 = v8 - (v10 + v9);

    if (v6 != v11)
    {
      BOOL v19 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = [(TIRevisionHistory *)self documentText];
    uint64_t v13 = [(TIRevisionHistory *)self selectedRange];
    BOOL v15 = objc_msgSend(v12, "compare:options:range:", v5, 2, v13 + v14, objc_msgSend(v5, "length")) == 0;
  }
  else
  {
    uint64_t v16 = [(TIRevisionHistory *)self selectedRange];
    uint64_t v18 = v16 + v17;
    uint64_t v12 = [(TIRevisionHistory *)self documentText];
    BOOL v15 = v18 == [v12 length];
  }
  BOOL v19 = v15;

LABEL_10:
  return v19;
}

- (BOOL)matchesSelectedText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 length];
    [(TIRevisionHistory *)self selectedRange];
    if (v6 == v7)
    {
      uint64_t v8 = [(TIRevisionHistory *)self documentText];
      uint64_t v9 = [(TIRevisionHistory *)self selectedRange];
      BOOL v11 = objc_msgSend(v8, "compare:options:range:", v5, 2, v9, v10) == 0;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    [(TIRevisionHistory *)self selectedRange];
    BOOL v11 = v12 == 0;
  }

  return v11;
}

- (BOOL)matchesContextBeforeSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 length];
    if (v6 == [(TIRevisionHistory *)self selectedRange])
    {
      uint64_t v7 = [(TIRevisionHistory *)self documentText];
      BOOL v8 = objc_msgSend(v7, "compare:options:range:", v5, 2, 0, -[TIRevisionHistory selectedRange](self, "selectedRange")) == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = [(TIRevisionHistory *)self selectedRange] == 0;
  }

  return v8;
}

- (void)acceptCurrentSentence
{
  [(TIRevisionHistory *)self setIsDeletingBackwards:0];
  unint64_t v3 = [(TIRevisionHistory *)self currentTokenIterator];
  uint64_t v5 = v4;
  uint64_t v6 = [(TIRevisionHistory *)self tokenization];
  if (v3 >= [v6 count])
  {
    uint64_t v10 = 0;
    unint64_t v8 = v3;
LABEL_7:

    id v13 = (id)v10;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = v3;
    while (1)
    {
      id v13 = v7;
      unint64_t v9 = [v7 tokenID];

      if (HIDWORD(v9) == 2) {
        break;
      }
      uint64_t v10 = -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", v8, v5);

      unint64_t v8 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v8, v5);
      uint64_t v5 = v11;
      uint64_t v6 = [(TIRevisionHistory *)self tokenization];
      unint64_t v12 = [v6 count];
      uint64_t v7 = (void *)v10;
      if (v8 >= v12) {
        goto LABEL_7;
      }
    }
  }
  -[TIRevisionHistory acceptTokensInRange:](self, "acceptTokensInRange:", v3, v8 - v3);
}

- (void)acceptText:(id)a3 isAutocorrection:(BOOL)a4 isAutoshifted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(TIRevisionHistory *)self setIsDeletingBackwards:0];
  uint64_t v9 = [(TIRevisionHistory *)self inputRangeForReplacement:v8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v9, v10);
    if (v5) {
      int v11 = 2;
    }
    else {
      int v11 = 0;
    }
    int v12 = v11 | [v8 isAutocorrection];
    if (v6) {
      int v13 = v12 | 4;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v8 candidate];
    if (v14) {
      BOOL v15 = (__CFString *)v14;
    }
    else {
      BOOL v15 = &stru_1F3F7A998;
    }
    uint64_t v16 = [v8 latinCandidate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__TIRevisionHistory_acceptText_isAutocorrection_isAutoshifted___block_invoke;
    v17[3] = &unk_1E6E2B648;
    v17[4] = self;
    int v19 = v13;
    id v18 = v8;
    [(TIRevisionHistory *)self replaceSelectionWithText:v15 latinInputString:v16 negativeLearningHint:0 selectedTokenReplacementHandler:v17];
  }
}

void __63__TIRevisionHistory_acceptText_isAutocorrection_isAutoshifted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  BOOL v5 = *(void **)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  objc_msgSend(v5, "migrateUserTypingFromDeletedTokens:toInsertedTokens:withUsageLearningMask:usageTrackingMask:", v8, v7, v4, objc_msgSend(v6, "usageTrackingMask"));
}

- (_NSRange)inputRangeForReplacement:(id)a3
{
  id v4 = a3;
  [(TIRevisionHistory *)self selectedRange];
  if (v5)
  {
    BOOL v6 = [(TIRevisionHistory *)self documentText];
    id v7 = [v4 input];
    uint64_t v8 = [(TIRevisionHistory *)self selectedRange];
    uint64_t v10 = objc_msgSend(v6, "compare:options:range:", v7, 2, v8, v9);

    if (v10)
    {
      NSUInteger v11 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = [(TIRevisionHistory *)self selectedRange];
      NSUInteger v11 = v15;
    }
  }
  else
  {
    int v13 = [v4 input];
    unint64_t v14 = [v13 length];

    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 <= [(TIRevisionHistory *)self selectedRange])
    {
      uint64_t v16 = [(TIRevisionHistory *)self selectedRange] - v14;
      uint64_t v17 = [(TIRevisionHistory *)self documentText];
      id v18 = [v4 input];
      uint64_t v19 = objc_msgSend(v17, "compare:options:range:", v18, 2, v16, v14);

      if (v19) {
        NSUInteger v11 = 0;
      }
      else {
        NSUInteger v11 = v14;
      }
      if (!v19) {
        uint64_t v12 = v16;
      }
    }
    else
    {
      NSUInteger v11 = 0;
    }
  }

  NSUInteger v20 = v12;
  NSUInteger v21 = v11;
  result.NSUInteger length = v21;
  result.NSUInteger location = v20;
  return result;
}

- (void)rejectCandidate:(id)a3 forInput:(id)a4 hint:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  [(TIRevisionHistory *)self setIsDeletingBackwards:0];
  if (TIAdaptationAutocorrectionRejectionV2Enabled())
  {
    uint64_t v10 = [(TIRevisionHistory *)self delegate];
    [v10 registerNegativeEvidence:v8 tokenID:0 contextTokens:0 intended:v9 intendedTokenID:0 hint:v5];
  }
  else
  {
    char v22 = 0;
    NSUInteger v11 = [(TIRevisionHistory *)self delegate];
    id v21 = 0;
    uint64_t v12 = [v11 findTokenIDForWord:v8 contextTokens:0 tokenLookupMode:5 surfaceFormPtr:&v21 hasCaseInsensitiveStaticVariant:&v22];
    id v13 = v21;

    id v14 = v8;
    if (v13)
    {
      id v15 = v13;

      id v14 = v15;
    }
    uint64_t v16 = [(TIRevisionHistory *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 findTokenIDForWord:v9 contextTokens:0 tokenLookupMode:5 surfaceFormPtr:&v20 hasCaseInsensitiveStaticVariant:&v22];
    id v18 = v20;

    uint64_t v19 = [(TIRevisionHistory *)self delegate];
    [v19 registerNegativeEvidence:v14 tokenID:v12 contextTokens:0 intended:v9 intendedTokenID:v17 hint:v5];
  }
}

- (void)deleteBackward
{
  [(TIRevisionHistory *)self setIsDeletingBackwards:1];
  [(TIRevisionHistory *)self selectedRange];
  if (!v3 && [(TIRevisionHistory *)self selectedRange])
  {
    id v4 = [(TIRevisionHistory *)self documentText];
    uint64_t v5 = objc_msgSend(v4, "_rangeOfBackwardDeletionClusterAtIndex:", -[TIRevisionHistory selectedRange](self, "selectedRange") - 1);
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v5, v6);
  }

  [(TIRevisionHistory *)self replaceSelectionWithText:&stru_1F3F7A998 latinInputString:0 negativeLearningHint:2 selectedTokenReplacementHandler:0];
}

- (void)insertText:(id)a3
{
  id v5 = a3;
  [(TIRevisionHistory *)self setIsDeletingBackwards:0];
  if (TIAdaptationAutocorrectionRejectionV2Enabled()) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 0;
  }
  [(TIRevisionHistory *)self replaceSelectionWithText:v5 latinInputString:0 negativeLearningHint:v4 selectedTokenReplacementHandler:0];
}

- (_NSRange)deletionRangeToObtainDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TIRevisionHistory *)self documentState];
  uint64_t v6 = +[TIRevisionHistory documentStateTrimmedToSentenceForState:v5];

  id v7 = +[TIRevisionHistory documentStateTrimmedToSentenceForState:v4];

  id v8 = [v6 selectedText];
  if ([v8 length]) {
    goto LABEL_10;
  }
  id v9 = [v7 selectedText];
  if ([v9 length])
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v10 = [v6 contextBeforeInput];
  unint64_t v11 = [v10 length];
  uint64_t v12 = [v7 contextBeforeInput];
  if (v11 <= [v12 length])
  {

    goto LABEL_9;
  }
  id v13 = [v6 contextAfterInput];
  uint64_t v48 = [v13 length];
  if (v48
    || ([v7 contextAfterInput],
        v41 = objc_claimAutoreleasedReturnValue(),
        [v41 length]))
  {
    id v14 = NSString;
    uint64_t v15 = [v6 contextAfterInput];
    v43 = [v7 contextAfterInput];
    v45 = (void *)v15;
    if (!objc_msgSend(v14, "_string:matchesString:", v15))
    {
      int v50 = 0;
      goto LABEL_35;
    }
    int v16 = 1;
  }
  else
  {
    int v16 = 0;
  }
  v29 = [v7 contextBeforeInput];
  if ([v29 length])
  {
    v39 = v13;
    [v6 contextBeforeInput];
    v30 = LODWORD(v40) = v16;
    v31 = [v7 contextBeforeInput];
    int v50 = [v30 hasPrefix:v31];

    if (v40)
    {
      id v13 = v39;
      goto LABEL_35;
    }
    id v13 = v39;
  }
  else
  {

    int v50 = 1;
    if (v16)
    {
LABEL_35:
      v32 = v41;

      if (v48) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  v32 = v41;
  if (!v48) {
LABEL_36:
  }

LABEL_37:
  if (v50)
  {
    v33 = [v6 contextBeforeInput];
    uint64_t v34 = [v33 length];
    v35 = [v7 contextBeforeInput];
    uint64_t v24 = v34 - [v35 length];

    uint64_t v25 = [(TIRevisionHistory *)self selectedRange] - v24;
    goto LABEL_24;
  }
LABEL_11:
  uint64_t v17 = [v7 contextBeforeInput];
  if ([v17 length])
  {
    id v18 = [v6 contextBeforeInput];
    if ((unint64_t)[v18 length] >= 0xC)
    {
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v19 = [v6 contextBeforeInput];
    if (![v19 length])
    {
LABEL_20:

      goto LABEL_21;
    }
    id v20 = [v7 contextBeforeInput];
    id v21 = [v6 contextBeforeInput];
    if ([v20 isEqualToString:v21])
    {
LABEL_19:

      goto LABEL_20;
    }
    char v22 = [v6 selectedText];
    if ([v22 length])
    {
LABEL_18:

      goto LABEL_19;
    }
    v23 = [v7 selectedText];
    if ([v23 length])
    {

      goto LABEL_18;
    }
    v49 = [v6 contextAfterInput];
    uint64_t v44 = [v49 length];
    if (v44
      || ([v7 contextAfterInput],
          uint64_t v40 = objc_claimAutoreleasedReturnValue(),
          [(id)v40 length]))
    {
      v46 = NSString;
      v51 = [v6 contextAfterInput];
      [v7 contextAfterInput];
      v28 = v42 = v23;
      int v47 = [v46 _string:v51 matchesString:v28];

      v23 = v42;
      if (v44) {
        goto LABEL_44;
      }
    }
    else
    {
      int v47 = 1;
    }

LABEL_44:
    if (v47)
    {
      uint64_t v36 = [(TIRevisionHistory *)self selectedRange];
      v37 = [v6 contextBeforeInput];
      uint64_t v25 = v36 - [v37 length];

      v38 = [v6 contextBeforeInput];
      uint64_t v24 = [v38 length];

      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_22:

LABEL_23:
  uint64_t v24 = 0;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  NSUInteger v26 = v25;
  NSUInteger v27 = v24;
  result.NSUInteger length = v27;
  result.NSUInteger location = v26;
  return result;
}

- (id)documentState
{
  uint64_t v3 = [(TIRevisionHistory *)self documentText];
  id v4 = objc_msgSend(v3, "substringToIndex:", -[TIRevisionHistory selectedRange](self, "selectedRange"));

  [(TIRevisionHistory *)self selectedRange];
  if (v5)
  {
    uint64_t v6 = [(TIRevisionHistory *)self documentText];
    uint64_t v7 = [(TIRevisionHistory *)self selectedRange];
    id v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = [(TIRevisionHistory *)self documentText];
  uint64_t v11 = [(TIRevisionHistory *)self selectedRange];
  id v13 = [v10 substringFromIndex:v11 + v12];

  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE2A8]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v4, 0, v9, v13, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v14;
}

- (id)wordTokenContainingSelection
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__9763;
  id v9 = __Block_byref_object_dispose__9764;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__TIRevisionHistory_wordTokenContainingSelection__block_invoke;
  v4[3] = &unk_1E6E2B5F8;
  v4[4] = self;
  v4[5] = &v5;
  [(TIRevisionHistory *)self enumerateSentenceStemUsingIteratorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __49__TIRevisionHistory_wordTokenContainingSelection__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isSelectionContainedByToken:", a2, a3)
    && objc_msgSend(*(id *)(a1 + 32), "isWordToken:", a2, a3))
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "tokenAtIterator:", a2, a3);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || a3 < [*(id *)(a1 + 32) selectedRange])
  {
    *a4 = 1;
  }
}

- (BOOL)isWordToken:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t tokenIndex = a3.tokenIndex;
  id v4 = [(TIRevisionHistory *)self tokenization];
  uint64_t v5 = [v4 objectAtIndex:tokenIndex];

  if ((unint64_t)[v5 tokenID] >> 32) {
    BOOL v6 = (((unint64_t)[v5 tokenID] >> 32) - 500) < 0xFFFFFE0D;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isSelectionContainedByToken:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t v4 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", a3.tokenIndex, a3.documentLocation);
  uint64_t v6 = v5;
  if (v4 > [(TIRevisionHistory *)self selectedRange]) {
    return 0;
  }
  uint64_t v8 = [(TIRevisionHistory *)self selectedRange];
  return v8 + v9 <= v4 + v6;
}

- (void)enumerateSentenceStemUsingIteratorBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, uint64_t, void, char *))a3;
  char v14 = 0;
  uint64_t v5 = [(TIRevisionHistory *)self iteratorUpperBoundForSelectionStart];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    unint64_t v9 = 0;
    do
    {
      uint64_t v7 = -[TIRevisionHistory previousTokenIterator:](self, "previousTokenIterator:", v7, v8);
      uint64_t v8 = v10;
      uint64_t v11 = -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", v7, v10);
      v4[2](v4, v7, v8, &v14);
      if ((unint64_t)[v11 tokenID] >> 32 == 1)
      {
        ++v9;
        if (v14) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v9 > 2;
        }
        char v13 = v12;
        char v14 = v13;
      }
    }
    while (!v14 && v7);
  }
}

- (_TIRevisionHistoryTokenIterator)iteratorUpperBoundForSelectionStart
{
  for (uint64_t i = [(TIRevisionHistory *)self currentTokenIterator];
        ;
        uint64_t i = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v5, v6))
  {
    unint64_t v5 = i;
    unint64_t v6 = v4;
    uint64_t v7 = [(TIRevisionHistory *)self tokenization];
    if (v5 >= [v7 count]) {
      break;
    }
    unint64_t v8 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", v5, v6);
    unint64_t v9 = [(TIRevisionHistory *)self selectedRange];

    if (v8 > v9) {
      goto LABEL_6;
    }
  }

LABEL_6:
  unint64_t v10 = v5;
  unint64_t v11 = v6;
  result.unint64_t documentLocation = v11;
  result.unint64_t tokenIndex = v10;
  return result;
}

- (void)resetToDocumentState:(id)a3
{
  id v27 = a3;
  [(TIRevisionHistory *)self setDocumentText:&stru_1F3F7A998];
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", 0, 0);
  unint64_t v4 = [(TIRevisionHistory *)self tokenization];
  [v4 removeAllObjects];

  [(TIRevisionHistory *)self tokenizer];
  LMStreamTokenizerReset();
  -[TIRevisionHistory setCurrentTokenIterator:](self, "setCurrentTokenIterator:", 0, 0);
  [(TIRevisionHistory *)self setLastRejectedToken:0];
  unint64_t v5 = -[TITokenizationRevision initWithTokenIterator:]([TITokenizationRevision alloc], "initWithTokenIterator:", 0, 0);
  unint64_t v6 = [v27 contextBeforeInput];

  if (v6)
  {
    uint64_t v7 = [(TIRevisionHistory *)self documentText];
    unint64_t v8 = [v27 contextBeforeInput];
    unint64_t v9 = [v7 stringByAppendingString:v8];
    [(TIRevisionHistory *)self setDocumentText:v9];

    unint64_t v10 = [v27 contextBeforeInput];
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", 0, [v10 length]);

    [(TIRevisionHistory *)self pushSelectedTextToTokenizerForRevision:v5];
  }
  unint64_t v11 = [v27 selectedText];

  if (v11)
  {
    BOOL v12 = [(TIRevisionHistory *)self documentText];
    char v13 = [v27 selectedText];
    char v14 = [v12 stringByAppendingString:v13];
    [(TIRevisionHistory *)self setDocumentText:v14];

    uint64_t v15 = [(TIRevisionHistory *)self selectedRange];
    uint64_t v17 = v15 + v16;
    id v18 = [v27 selectedText];
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v17, [v18 length]);

    [(TIRevisionHistory *)self pushSelectedTextToTokenizerForRevision:v5];
  }
  else
  {
    uint64_t v19 = [(TIRevisionHistory *)self selectedRange];
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v19 + v20, 0);
  }
  id v21 = [v27 contextAfterInput];

  if (v21)
  {
    char v22 = [(TIRevisionHistory *)self documentText];
    v23 = [v27 contextAfterInput];
    uint64_t v24 = [v22 stringByAppendingString:v23];
    [(TIRevisionHistory *)self setDocumentText:v24];
  }
  [(TIRevisionHistory *)self mergeTokenizationsForRevision:v5];
  uint64_t v25 = [(TIRevisionHistory *)self tokenization];
  NSUInteger v26 = [(TITokenizationRevision *)v5 branchTokens];
  [v25 setArray:v26];

  [(TIRevisionHistory *)self annotateTokensCreatedFromDocumentState];
}

- (void)annotateTokensCreatedFromDocumentState
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(TIContextTokens);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(TIRevisionHistory *)self tokenization];
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    uint64_t v4 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v4) {
          objc_enumerationMutation(obj);
        }
        unint64_t v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v6 setAccepted:1];
        if (!((unint64_t)[v6 tokenID] >> 32))
        {
          uint64_t v7 = [v6 tokenInputString];
          uint64_t v8 = [v7 length];

          if (v8)
          {
            unint64_t v9 = [(TIRevisionHistory *)self delegate];
            unint64_t v10 = [v6 tokenInputString];
            objc_msgSend(v6, "setTokenID:", objc_msgSend(v9, "findTokenIDForWord:contextTokens:tokenLookupMode:", v10, v3, 37));
          }
        }
        unint64_t v11 = [v6 tokenInputString];
        if ([v11 length])
        {
          BOOL v12 = [(TIRevisionHistory *)self autocorrectionHistory];
          char v13 = [v6 tokenInputString];
          char v14 = [v12 objectForKey:v13];
        }
        else
        {
          char v14 = 0;
        }

        uint64_t v15 = [v14 candidate];
        uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v17 = [v15 stringByTrimmingCharactersInSet:v16];

        id v18 = [v6 tokenInputString];
        LODWORD(v16) = [v17 hasPrefix:v18];

        if (v16)
        {
          uint64_t v19 = [v14 input];
          [v6 setUserTyping:v19];

          objc_msgSend(v6, "setUsageTrackingMask:", objc_msgSend(v14, "usageTrackingMask"));
          if ([v14 isContinuousPathConversion]) {
            int v20 = 0x80000;
          }
          else {
            int v20 = 0;
          }
          objc_msgSend(v6, "setUsageTrackingMask:", objc_msgSend(v6, "usageTrackingMask") | v20);
        }
        if ([v14 isAutocorrection])
        {
          [v6 setUsageLearningMask:1];
          id v21 = [(TIRevisionHistory *)self recentAutocorrections];
          char v22 = [v6 tokenInputString];
          [v21 objectForKeyedSubscript:v22];
          v23 = v14;
          uint64_t v24 = i;
          uint64_t v25 = v17;
          NSUInteger v26 = self;
          id v27 = v3;
          v29 = uint64_t v28 = v4;
          int v33 = [v29 isAutocorrection];

          uint64_t v4 = v28;
          uint64_t v3 = v27;
          self = v26;
          uint64_t v17 = v25;
          uint64_t i = v24;
          char v14 = v23;

          if (v33) {
            objc_msgSend(v6, "setUsageLearningMask:", objc_msgSend(v6, "usageLearningMask") | 4);
          }
        }
        uint64_t v30 = [v6 tokenID];
        v31 = [v6 tokenInputString];
        [(TIContextTokens *)v3 appendToken:v30 string:v31];
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v34);
  }
}

- (void)replaceSelectionWithText:(id)a3 latinInputString:(id)a4 negativeLearningHint:(int)a5 selectedTokenReplacementHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(TIRevisionHistory *)self popSelectedTextFromTokenizer];
  uint64_t v14 = v13;
  uint64_t v15 = -[TITokenizationRevision initWithTokenIterator:]([TITokenizationRevision alloc], "initWithTokenIterator:", v12, v13);
  uint64_t v43 = v14;
  uint64_t v16 = -[TIRevisionHistory selectedTokenRangeWithIterator:](self, "selectedTokenRangeWithIterator:", v12, v14);
  -[TITokenizationRevision setOriginalSelectedTokenRange:](v15, "setOriginalSelectedTokenRange:", v16, v17);
  [(TIRevisionHistory *)self selectedRange];
  uint64_t v19 = v18;
  int v20 = [(TIRevisionHistory *)self documentText];
  uint64_t v21 = [(TIRevisionHistory *)self selectedRange];
  v23 = objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v21, v22, v9);
  [(TIRevisionHistory *)self setDocumentText:v23];

  int v47 = v9;
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", -[TIRevisionHistory selectedRange](self, "selectedRange"), [v9 length]);
  uint64_t v24 = [(TITokenizationRevision *)v15 originalSelectedTokenRange];
  -[TIRevisionHistory adjustTokenOffsetAfterDeletedTokenRange:withDeletedCharacterCount:](self, "adjustTokenOffsetAfterDeletedTokenRange:withDeletedCharacterCount:", v24, v25, v19);
  [(TIRevisionHistory *)self pushSelectedTextToTokenizerForRevision:v15];
  [(TIRevisionHistory *)self mergeTokenizationsForRevision:v15];
  uint64_t v26 = [(TITokenizationRevision *)v15 branchedTokenIndex];
  uint64_t v27 = [(TITokenizationRevision *)v15 mergedTokenIndex];
  unint64_t v28 = v27 - [(TITokenizationRevision *)v15 branchedTokenIndex];
  -[TIRevisionHistory rejectTokensInRange:negativeLearningHint:newRevision:](self, "rejectTokensInRange:negativeLearningHint:newRevision:", v26, v28, a5, v15);
  v46 = (void (**)(void, void, void))v11;
  if (v11)
  {
    uint64_t v29 = [(TITokenizationRevision *)v15 originalSelectedTokenRange];
    uint64_t v44 = -[TIRevisionHistory nonEmptyTokensInRange:](self, "nonEmptyTokensInRange:", v29, v30);
  }
  else
  {
    uint64_t v44 = 0;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v31 = [(TITokenizationRevision *)v15 branchTokens];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) setTokenLatinInputString:v10];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v33);
  }

  long long v36 = [(TIRevisionHistory *)self tokenization];
  long long v37 = [(TITokenizationRevision *)v15 branchTokens];
  objc_msgSend(v36, "replaceObjectsInRange:withObjectsFromArray:", v26, v28, v37);

  if (v46)
  {
    uint64_t v38 = -[TIRevisionHistory selectedTokenRangeWithIterator:](self, "selectedTokenRangeWithIterator:", v12, v43);
    uint64_t v40 = -[TIRevisionHistory nonEmptyTokensInRange:](self, "nonEmptyTokensInRange:", v38, v39);
    ((void (**)(void, void *, void *))v46)[2](v46, v44, v40);
  }
  -[TIRevisionHistory acceptTokensInRange:](self, "acceptTokensInRange:", v12, [(TIRevisionHistory *)self currentTokenIterator] - v12);
  uint64_t v41 = [(TIRevisionHistory *)self selectedRange];
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v41 + v42, 0);
}

- (void)mergeTokenizationsForRevision:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIRevisionHistory *)self documentText];
  unint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 stringByAppendingString:@"\n"];
  [(TIRevisionHistory *)self setDocumentText:v7];

  uint64_t v8 = [(TIRevisionHistory *)self selectedRange];
  uint64_t v10 = v8 + v9;
  id v11 = [(TIRevisionHistory *)self documentText];
  uint64_t v12 = [v11 length];
  uint64_t v13 = [(TIRevisionHistory *)self selectedRange];
  uint64_t v15 = v12 - (v14 + v13);

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __51__TIRevisionHistory_mergeTokenizationsForRevision___block_invoke;
  uint64_t v21 = &unk_1E6E2B5B0;
  uint64_t v22 = self;
  id v16 = v4;
  id v23 = v16;
  -[TIRevisionHistory tokenizeDocumentTextInRange:withTokenHandler:](self, "tokenizeDocumentTextInRange:withTokenHandler:", v10, v15, &v18);
  if (objc_msgSend(v16, "branchedTokenIndex", v18, v19, v20, v21, v22) == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v16, "setBranchedTokenIndex:", objc_msgSend(v16, "originalIterator"));
  }
  if ([v16 mergedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [(TIRevisionHistory *)self tokenization];
    objc_msgSend(v16, "setMergedTokenIndex:", objc_msgSend(v17, "count"));
  }
  [(TIRevisionHistory *)self setDocumentText:v6];
  [(TIRevisionHistory *)self tokenizer];
  LMStreamTokenizerPopBytes();
}

BOOL __51__TIRevisionHistory_mergeTokenizationsForRevision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) mergedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)pushSelectedTextToTokenizerForRevision:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIRevisionHistory *)self selectedRange];
  uint64_t v7 = v6;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __60__TIRevisionHistory_pushSelectedTextToTokenizerForRevision___block_invoke;
  id v16 = &unk_1E6E2B5B0;
  uint64_t v17 = self;
  id v8 = v4;
  id v18 = v8;
  -[TIRevisionHistory tokenizeDocumentTextInRange:withTokenHandler:](self, "tokenizeDocumentTextInRange:withTokenHandler:", v5, v7, &v13);
  if (objc_msgSend(v8, "branchedTokenIndex", v13, v14, v15, v16, v17) == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = [v8 originalIterator];
  }
  else {
    uint64_t v9 = [v8 branchedTokenIndex];
  }
  uint64_t v10 = v9;
  id v11 = [v8 branchTokens];
  uint64_t v12 = [v11 count] + v10;

  -[TIRevisionHistory setCurrentTokenIterator:](self, "setCurrentTokenIterator:", v12, [v8 revisedDocumentLocation]);
}

uint64_t __60__TIRevisionHistory_pushSelectedTextToTokenizerForRevision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

- (void)handleRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 forRevision:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(TIRevisionHistory *)self documentText];
  uint64_t v11 = objc_msgSend(v10, "_rangeOfString:fromLocation:", v8, objc_msgSend(v9, "revisedDocumentLocation"));
  uint64_t v13 = v12;

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    uint64_t v14 = TIOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v20 = NSString;
      uint64_t v15 = [v9 revisedDocumentLocation];
      id v16 = [(TIRevisionHistory *)self documentText];
      uint64_t v17 = [(TIRevisionHistory *)self selectedRange];
      [(TIRevisionHistory *)self selectedRange];
      uint64_t v19 = [v20 stringWithFormat:@"%s ERROR: Unexpected token %@ for location %lu in %@, with selected range (%lu,%lu)", "-[TIRevisionHistory handleRevisedTokenString:withTokenID:forRevision:]", v8, v15, v16, v17, v18];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v19;
      _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (!-[TIRevisionHistory validateTokenizationForRevisedDocumentRange:andTokenID:forRevision:](self, "validateTokenizationForRevisedDocumentRange:andTokenID:forRevision:", v11, v13, a4, v9))-[TIRevisionHistory addRevisedTokenString:withTokenID:inDocumentRange:toRevision:](self, "addRevisedTokenString:withTokenID:inDocumentRange:toRevision:", v8, a4, v11, v13, v9); {
  [v9 setRevisedDocumentLocation:v11 + v13];
  }
}

- (void)addRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 inDocumentRange:(_NSRange)a5 toRevision:(id)a6
{
  NSUInteger location = a5.location;
  id v9 = a6;
  id v10 = a3;
  uint64_t v12 = objc_alloc_init(TIRevisionHistoryToken);
  [(TIRevisionHistoryToken *)v12 setTokenInputString:v10];
  [(TIRevisionHistoryToken *)v12 setTokenID:a4];
  -[TIRevisionHistoryToken setOffset:](v12, "setOffset:", location - [v9 revisedDocumentLocation]);
  [(TIRevisionHistoryToken *)v12 setUserTyping:v10];

  uint64_t v11 = [v9 branchTokens];

  [v11 addObject:v12];
}

- (BOOL)validateTokenizationForRevisedDocumentRange:(_NSRange)a3 andTokenID:(TITokenID)a4 forRevision:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  unint64_t v10 = [v9 originalIterator];
  uint64_t v12 = v11;
  if (!-[TIRevisionHistory shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:](self, "shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:", v10, v11, location, length, v9))
  {
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
  while (1)
  {
    unint64_t v13 = [v9 originalSelectedTokenRange];
    BOOL v15 = v10 < v13 || v10 - v13 >= v14;
    BOOL v16 = !v15;
    if (v15
      && -[TIRevisionHistory originalIterator:matchesRevisedDocumentRange:andTokenID:](self, "originalIterator:matchesRevisedDocumentRange:andTokenID:", v10, v12, location, length, a4))
    {
      break;
    }
    [v9 setMergedTokenIndex:0x7FFFFFFFFFFFFFFFLL];
    if ([v9 branchedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      [v9 setBranchedTokenIndex:v10];
    }
    if (v16)
    {
      ++v10;
LABEL_16:
      objc_msgSend(v9, "setOriginalIterator:", v10, v12);
      goto LABEL_17;
    }
    unint64_t v17 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", v10, v12);
    unint64_t v10 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v10, v12);
    uint64_t v12 = v18;
    if (v17 < location + length) {
      goto LABEL_16;
    }
LABEL_17:
    if (!-[TIRevisionHistory shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:](self, "shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:", v10, v12, location, length, v9))goto LABEL_18; {
  }
    }
  unint64_t v21 = -[TIRevisionHistory resetTokenAtIterator:withRange:fromDocumentLocation:](self, "resetTokenAtIterator:withRange:fromDocumentLocation:", v10, v12, location, length, [v9 revisedDocumentLocation]);
  uint64_t v23 = v22;
  if ([v9 mergedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v24 = [v9 originalSelectedTokenRange];
    if (v21 >= v24 + v25)
    {
      if (length)
      {
        [v9 setMergedTokenIndex:v21];
        if ([v9 branchedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v9, "setBranchedTokenIndex:", objc_msgSend(v9, "mergedTokenIndex"));
        }
      }
    }
  }
  uint64_t v26 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v21, v23);
  objc_msgSend(v9, "setOriginalIterator:", v26, v27);
  BOOL v19 = 1;
LABEL_19:

  return v19;
}

- (_TIRevisionHistoryTokenIterator)resetTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3 withRange:(_NSRange)a4 fromDocumentLocation:(unint64_t)a5
{
  NSUInteger location = a4.location;
  unint64_t tokenIndex = a3.tokenIndex;
  id v8 = -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", a3.tokenIndex, a3.documentLocation, a4.location, a4.length);
  [v8 setOffset:location - a5];

  unint64_t v9 = tokenIndex;
  unint64_t v10 = a5;
  result.unint64_t documentLocation = v10;
  result.unint64_t tokenIndex = v9;
  return result;
}

- (BOOL)shouldValidateOriginalIterator:(_TIRevisionHistoryTokenIterator)a3 withRevisedDocumentRange:(_NSRange)a4 forRevision:(id)a5
{
  NSUInteger location = a4.location;
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  id v9 = a5;
  unint64_t v10 = [v9 originalSelectedTokenRange];
  if (tokenIndex >= v10 && tokenIndex - v10 < v11)
  {
    BOOL v13 = 1;
    goto LABEL_12;
  }
  if ([v9 branchedTokenIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (documentLocation > location)
    {
      BOOL v13 = 0;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v16 = [(TIRevisionHistory *)self tokenization];
    BOOL v13 = tokenIndex < [v16 count];

    goto LABEL_12;
  }
  uint64_t v14 = [(TIRevisionHistory *)self selectedRange];
  BOOL v13 = 0;
  if (location >= v14 + v15 && documentLocation <= location) {
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

- (BOOL)originalIterator:(_TIRevisionHistoryTokenIterator)a3 matchesRevisedDocumentRange:(_NSRange)a4 andTokenID:(TITokenID)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  unint64_t v11 = [(TIRevisionHistory *)self tokenization];
  unint64_t v12 = [v11 count];

  if (tokenIndex >= v12) {
    return 0;
  }
  BOOL v13 = [(TIRevisionHistory *)self tokenization];
  uint64_t v14 = [v13 objectAtIndex:tokenIndex];

  if ((!HIDWORD(*(unint64_t *)&a5) || [v14 tokenID] == a5)
    && [v14 offset] + documentLocation == location)
  {
    uint64_t v15 = [v14 tokenInputString];
    BOOL v16 = [v15 length] == length;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)adjustTokenOffsetAfterDeletedTokenRange:(_NSRange)a3 withDeletedCharacterCount:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v8 = a3.location + a3.length;
  id v9 = [(TIRevisionHistory *)self tokenization];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    for (uint64_t i = 0; length; --length)
    {
      unint64_t v12 = [(TIRevisionHistory *)self tokenization];
      BOOL v13 = [v12 objectAtIndex:location];

      uint64_t v14 = [v13 offset];
      uint64_t v15 = [v13 tokenInputString];
      i += v14 + [v15 length];

      ++location;
    }
    BOOL v16 = [(TIRevisionHistory *)self tokenization];
    id v19 = [v16 objectAtIndex:v8];

    uint64_t v17 = [v19 offset];
    [(TIRevisionHistory *)self selectedRange];
    [v19 setOffset:i - a4 + v17 + v18];
  }
}

- (unint64_t)tokenizeDocumentTextInRange:(_NSRange)a3 withTokenHandler:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  NSUInteger v8 = [(TIRevisionHistory *)self documentText];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke;
  v12[3] = &unk_1E6E2B588;
  v12[4] = self;
  id v13 = v7;
  uint64_t v14 = &v15;
  id v9 = v7;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", location, length, 514, v12);

  unint64_t v10 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v10;
}

void __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 4 * a4;
  unint64_t v12 = (char *)v14 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = 0;
  id v13 = [*(id *)(a1 + 32) documentText];
  objc_msgSend(v13, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v12, v11, v21, 4, 0, a3, a4, 0);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  [*(id *)(a1 + 32) tokenizer];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke_2;
  v14[3] = &unk_1E6E2B560;
  BOOL v16 = &v17;
  id v15 = *(id *)(a1 + 40);
  LMStreamTokenizerPushBytes();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v21[0];
  if (!*((unsigned char *)v18 + 24)) {
    *a7 = 1;
  }

  _Block_object_dispose(&v17, 8);
}

void __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  if ([v6 hasDoubleZWJ])
  {
    uint64_t v4 = [v6 stringRemovingDoubleZWJ];

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (_TIRevisionHistoryTokenIterator)popSelectedTextFromTokenizer
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  BOOL v16 = "";
  uint64_t v17 = [(TIRevisionHistory *)self currentTokenIterator];
  uint64_t v18 = v3;
  if ([(TIRevisionHistory *)self selectedRange])
  {
    uint64_t v4 = [(TIRevisionHistory *)self documentText];
    uint64_t v5 = [(TIRevisionHistory *)self selectedRange];
    uint64_t v7 = objc_msgSend(v4, "_UTF8SizeOfRange:", v5, v6);

    if (v7)
    {
      [(TIRevisionHistory *)self tokenizer];
      LMStreamTokenizerPopBytes();
    }
  }
  else
  {
    [(TIRevisionHistory *)self tokenizer];
    LMStreamTokenizerReset();
    NSUInteger v8 = v14;
    void v14[4] = 0;
    v8[5] = 0;
  }
  unint64_t v9 = v14[4];
  unint64_t v10 = v14[5];
  _Block_object_dispose(&v13, 8);
  unint64_t v11 = v9;
  unint64_t v12 = v10;
  result.unint64_t documentLocation = v12;
  result.unint64_t tokenIndex = v11;
  return result;
}

uint64_t __49__TIRevisionHistory_popSelectedTextFromTokenizer__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v2;
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v6 = a2;
    uint64_t v7 = result;
    do
    {
      _TIRevisionHistoryTokenIterator result = objc_msgSend(*(id *)(v7 + 32), "previousTokenIterator:", *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 40), v10, v11, v12, v13);
      uint64_t v8 = *(void *)(*(void *)(v7 + 40) + 8);
      *(void *)(v8 + 32) = result;
      *(void *)(v8 + 40) = v9;
      --v6;
    }
    while (v6);
  }
  return result;
}

- (id)nonEmptyTokensInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3.length]; length; --length)
  {
    uint64_t v7 = [(TIRevisionHistory *)self tokenization];
    uint64_t v8 = [v7 objectAtIndex:location];

    uint64_t v9 = [v8 tokenInputString];
    uint64_t v10 = [v9 length];

    if (v10) {
      [i addObject:v8];
    }

    ++location;
  }

  return i;
}

- (_NSRange)selectedTokenRangeWithIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  uint64_t v6 = [(TIRevisionHistory *)self tokenization];
  if (tokenIndex >= [v6 count])
  {
    NSUInteger v7 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

    uint64_t v8 = v15;
  }
  else
  {
    NSUInteger v7 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v9 = [(TIRevisionHistory *)self selectedRange];
      unint64_t v11 = v9 + v10;

      if (documentLocation >= v11) {
        break;
      }
      uint64_t v12 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", tokenIndex, documentLocation);
      unint64_t v14 = v12;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL,
            v12 + v13 > (unint64_t)[(TIRevisionHistory *)self selectedRange])
        && (uint64_t v8 = tokenIndex, tokenIndex != 0x7FFFFFFFFFFFFFFFLL))
      {
        uint64_t v16 = [(TIRevisionHistory *)self selectedRange];
        if (v14 < v16 + v17) {
          ++v7;
        }
        uint64_t v15 = v8;
      }
      unint64_t tokenIndex = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", tokenIndex, documentLocation);
      unint64_t documentLocation = v18;
      uint64_t v6 = [(TIRevisionHistory *)self tokenization];
      uint64_t v8 = v15;
      if (tokenIndex >= [v6 count]) {
        goto LABEL_13;
      }
    }
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v19 = tokenIndex;
  }
  else {
    NSUInteger v19 = v8;
  }
  NSUInteger v20 = v7;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (_TIRevisionHistoryTokenIterator)previousTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  uint64_t v5 = [(TIRevisionHistory *)self tokenization];
  uint64_t v6 = [v5 objectAtIndex:--tokenIndex];

  uint64_t v7 = [v6 offset];
  uint64_t v8 = [v6 tokenInputString];
  uint64_t v9 = documentLocation - v7 - [v8 length];

  unint64_t v10 = tokenIndex;
  unint64_t v11 = v9;
  result.unint64_t documentLocation = v11;
  result.unint64_t tokenIndex = v10;
  return result;
}

- (_TIRevisionHistoryTokenIterator)nextTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  uint64_t v5 = [(TIRevisionHistory *)self tokenization];
  uint64_t v6 = [v5 objectAtIndex:tokenIndex];

  uint64_t v7 = [v6 offset];
  uint64_t v8 = [v6 tokenInputString];
  uint64_t v9 = v7 + documentLocation + [v8 length];

  unint64_t v10 = tokenIndex + 1;
  unint64_t v11 = v9;
  result.unint64_t documentLocation = v11;
  result.unint64_t tokenIndex = v10;
  return result;
}

- (_NSRange)documentRangeOfTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  uint64_t v5 = [(TIRevisionHistory *)self tokenization];
  uint64_t v6 = [v5 objectAtIndex:tokenIndex];

  NSUInteger v7 = [v6 offset] + documentLocation;
  uint64_t v8 = [v6 tokenInputString];
  uint64_t v9 = [v8 length];

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (id)tokenAtIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t tokenIndex = a3.tokenIndex;
  uint64_t v4 = [(TIRevisionHistory *)self tokenization];
  uint64_t v5 = [v4 objectAtIndex:tokenIndex];

  return v5;
}

- (void)collectPFLTelemetryForTokenAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(TIRevisionHistory *)self tokenization];
  uint64_t v15 = [v5 objectAtIndex:a3];

  unint64_t v6 = [v15 tokenID];
  NSUInteger v7 = v15;
  if (HIDWORD(v6) == 2)
  {
    unint64_t v6 = [v15 isAccepted];
    NSUInteger v7 = v15;
    if ((v6 & 1) == 0)
    {
      uint64_t v8 = [(TIRevisionHistory *)self tokenization];
      unint64_t v9 = [v8 count];

      unint64_t v10 = 0;
      do
      {
        if (a3 >= v9) {
          break;
        }
        ++v10;
        NSUInteger v11 = [(TIRevisionHistory *)self tokenization];
        uint64_t v12 = [v11 objectAtIndex:a3];

        unint64_t v13 = [v12 tokenID];
        --a3;
      }
      while (HIDWORD(v13) != 1);
      NSUInteger v7 = v15;
      if (v10 >= 5)
      {
        unint64_t v14 = [(TIRevisionHistory *)self delegate];
        [v14 incrementUsageTrackingKeyForAppWithIsSentence:1];

        NSUInteger v7 = v15;
      }
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)migrateUserTypingFromDeletedTokens:(id)a3 toInsertedTokens:(id)a4 withUsageLearningMask:(unsigned int)a5 usageTrackingMask:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a5;
  id v35 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    unint64_t v9 = 0;
    int v10 = v6 & 5;
    int v33 = v10;
    while (1)
    {
      NSUInteger v11 = [v8 objectAtIndex:v9];
      if (v9 >= [v35 count])
      {
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v12 = [v35 objectAtIndex:v9];
      }
      uint64_t v13 = [v12 userTyping];
      unint64_t v14 = (void *)v13;
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      else {
        uint64_t v15 = &stru_1F3F7A998;
      }
      [v11 setUserTyping:v15];

      uint64_t v16 = [v8 lastObject];
      if (v11 != v16) {
        goto LABEL_18;
      }
      unint64_t v17 = [v8 count];
      unint64_t v18 = [v35 count];

      if (v17 < v18) {
        break;
      }
LABEL_19:
      objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v12, "usageLearningMask"));
      objc_msgSend(v11, "setUsageTrackingMask:", objc_msgSend(v12, "usageTrackingMask"));
      uint64_t v27 = [v11 tokenInputString];
      unint64_t v28 = [v11 userTyping];
      char v29 = [v27 isEqualToString:v28];

      if ((v29 & 1) == 0) {
        objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v11, "usageLearningMask") | v10);
      }
      if (!v9)
      {
        if ((v6 & 2) != 0) {
          objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v11, "usageLearningMask") | 2);
        }
        uint64_t v30 = [v11 tokenInputString];
        v31 = [v12 tokenInputString];
        char v32 = [v30 isEqualToString:v31];

        if ((v32 & 1) == 0) {
          [v11 setUsageTrackingMask:a6];
        }
      }

      if (++v9 >= [v8 count]) {
        goto LABEL_27;
      }
    }
    uint64_t v19 = v6;
    id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v21 = [v12 userTyping];
    uint64_t v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (__CFString *)v21;
    }
    else {
      uint64_t v23 = &stru_1F3F7A998;
    }
    uint64_t v16 = (void *)[v20 initWithString:v23];

    for (unint64_t i = v9 + 1; i < [v35 count]; ++i)
    {
      uint64_t v25 = [v35 objectAtIndex:i];
      uint64_t v26 = [v25 userTyping];
      [v16 appendFormat:@" %@", v26];
    }
    [v11 setUserTyping:v16];
    uint64_t v6 = v19;
    int v10 = v33;
LABEL_18:

    goto LABEL_19;
  }
LABEL_27:
}

- (void)rejectTokensInRange:(_NSRange)a3 negativeLearningHint:(int)a4 newRevision:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  if (length)
  {
    id v20 = v9;
    int v10 = 0;
    NSUInteger v11 = location - 1;
    do
    {
      uint64_t v12 = [v20 branchedTokenIndex];
      if (!v10 || ![v10 size])
      {
        uint64_t v13 = [(TIRevisionHistory *)self contextForTokenAtIndex:v11 + length];

        int v10 = (void *)v13;
      }
      unint64_t v14 = v11 + length - v12;
      uint64_t v15 = [(TIRevisionHistory *)self tokenization];
      uint64_t v16 = [v15 objectAtIndex:v11 + length];

      unint64_t v17 = [v20 branchTokens];
      if (v14 >= [v17 count])
      {
        uint64_t v19 = 0;
      }
      else
      {
        unint64_t v18 = [v20 branchTokens];
        uint64_t v19 = [v18 objectAtIndex:v14];
      }
      [(TIRevisionHistory *)self rejectToken:v16 contextTokens:v10 negativeLearningHint:v5 withRevisedToken:v19];
      if ([v10 size]) {
        [v10 popBack];
      }

      --length;
    }
    while (length);

    id v9 = v20;
  }
}

- (void)acceptTokensInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v6 = -[TIRevisionHistory contextForTokenAtIndex:](self, "contextForTokenAtIndex:");
    uint64_t v40 = *MEMORY[0x1E4FAEE10];
    uint64_t v42 = *MEMORY[0x1E4FAEE08];
    uint64_t v43 = v6;
    do
    {
      NSUInteger v7 = [(TIRevisionHistory *)self tokenization];
      id v8 = [v7 objectAtIndex:location];

      if ((unint64_t)[v8 tokenID] >> 32
        || ([v8 tokenInputString],
            id v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 length],
            v9,
            !v10))
      {
        BOOL v19 = 0;
      }
      else
      {
        unsigned __int8 v49 = 0;
        NSUInteger v11 = [(TIRevisionHistory *)self delegate];
        uint64_t v12 = [v8 tokenInputString];
        id v48 = 0;
        unint64_t v13 = [v11 findTokenIDForWord:v12 contextTokens:v6 tokenLookupMode:22 surfaceFormPtr:&v48 hasCaseInsensitiveStaticVariant:&v49];
        id v14 = v48;

        BOOL v15 = v49 == 0;
        if (HIDWORD(v13) || ([v8 isAccepted] & 1) != 0)
        {
          [v8 setTokenID:v13];
        }
        else
        {
          uint64_t v30 = [(TIRevisionHistory *)self delegate];
          v31 = [v8 tokenInputString];
          id v47 = v14;
          uint64_t v32 = [v30 addWord:v31 contextTokens:v43 surfaceFormPtr:&v47];
          id v45 = v47;

          [v8 setTokenID:v32];
          uint64_t v33 = [(TIRevisionHistory *)self lastRejectedToken];
          if (!v33) {
            goto LABEL_25;
          }
          uint64_t v34 = (void *)v33;
          id v35 = [(TIRevisionHistory *)self lastRejectedToken];
          long long v36 = [v35 tokenInputString];
          long long v37 = [v8 tokenInputString];
          char v41 = [v36 isEqualToString:v37];
          int v38 = v49;

          if (v41)
          {
LABEL_25:
            id v14 = v45;
          }
          else
          {
            if (!v38)
            {
              uint64_t v39 = [(TIRevisionHistory *)self delegate];
              [v39 incrementUsageTrackingKey:v40];
            }
            id v14 = v45;
          }
        }
        BOOL v46 = v15;
        if (v14
          && ([v8 tokenDictionaryString],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v14 isEqualToString:v16],
              v16,
              (v17 & 1) == 0))
        {
          [v8 setTokenDictionaryString:v14];
        }
        else
        {
          unint64_t v18 = [v8 tokenInputString];
          [v8 setTokenDictionaryString:v18];
        }
        uint64_t v20 = [(TIRevisionHistory *)self lastRejectedToken];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v22 = [(TIRevisionHistory *)self lastRejectedToken];
          uint64_t v23 = [v22 tokenInputString];
          [v8 tokenInputString];
          uint64_t v24 = v44 = v14;
          char v25 = [v23 isEqualToString:v24];
          int v26 = v49;

          id v14 = v44;
          if ((v25 & 1) == 0 && !v26)
          {
            uint64_t v27 = [(TIRevisionHistory *)self delegate];
            [v27 incrementUsageTrackingKey:v42];

            id v14 = v44;
          }
        }

        uint64_t v6 = v43;
        BOOL v19 = v46;
      }
      [(TIRevisionHistory *)self collectPFLTelemetryForTokenAtIndex:location];
      [(TIRevisionHistory *)self acceptToken:v8 contextTokens:v6 saveToDifferentialPrivacy:v19];
      uint64_t v28 = [v8 tokenID];
      char v29 = [v8 tokenInputString];
      [v6 appendToken:v28 string:v29];

      ++location;
      --length;
    }
    while (length);
  }
}

- (id)contextForTokenAtIndex:(unint64_t)a3
{
  uint64_t v5 = objc_alloc_init(TIContextTokens);
  if (a3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = a3 - 1;
    while (1)
    {
      id v8 = [(TIRevisionHistory *)self tokenization];
      id v9 = [v8 objectAtIndex:v7];

      if ((unint64_t)[v9 tokenID] >> 32 == 1 && (unint64_t)++v6 >= 3) {
        break;
      }

      if (--v7 == -1) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    unint64_t v7 = 0;
  }
  if (v7 < a3)
  {
    do
    {
      uint64_t v10 = [(TIRevisionHistory *)self tokenization];
      NSUInteger v11 = [v10 objectAtIndex:v7];

      uint64_t v12 = [v11 tokenID];
      unint64_t v13 = [v11 tokenInputString];
      [(TIContextTokens *)v5 appendToken:v12 string:v13];

      ++v7;
    }
    while (a3 != v7);
  }
  id v14 = [(TIRevisionHistory *)self delegate];
  [v14 fillReversedConversationHistoryInContext:v5];

  return v5;
}

- (void)rejectToken:(id)a3 contextTokens:(id)a4 negativeLearningHint:(int)a5 withRevisedToken:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v27 isAccepted])
  {
    uint64_t v12 = [v27 tokenInputString];
    unint64_t v13 = [v11 tokenInputString];
    if (![v12 isEqualToString:v13])
    {
      id v14 = [v27 tokenInputString];
      if ([v14 length])
      {
        BOOL v15 = [v27 tokenInputString];
        char v16 = [v15 _containsSymbolsAndPunctuationOnly];

        if (v16)
        {
LABEL_13:
          uint64_t v21 = [(TIRevisionHistory *)self delegate];
          if ([v21 isStringBasedModel]) {
            [v27 tokenInputString];
          }
          else {
          BOOL v19 = [v27 tokenDictionaryString];
          }

          uint64_t v22 = [v27 tokenLatinInputString];
          if (v22)
          {
            uint64_t v20 = [v27 tokenLatinInputString];
          }
          else
          {
            uint64_t v20 = &stru_1F3F7A998;
          }

          uint64_t v23 = [(TIRevisionHistory *)self delegate];
          objc_msgSend(v23, "decrementLanguageModelCount:latinInputString:tokenID:contextTokens:", v19, v20, objc_msgSend(v27, "tokenID"), v10);

          if (a5 && (((unint64_t)[v27 tokenID] >> 32) - 500) <= 0xFFFFFE0C)
          {
            uint64_t v24 = [(TIRevisionHistory *)self delegate];
            char v25 = [v27 tokenInputString];
            [v24 softLearningRegisterDeleted:v25];
          }
          [v27 setAccepted:0];
          if ((unint64_t)[v27 tokenID] >> 32 == 1)
          {
            [(TIRevisionHistory *)self setShouldReportRevisionToDP:0];
          }
          else
          {
            int v26 = [(TIRevisionHistory *)self lastRejectedToken];

            if (v26) {
              [(TIRevisionHistory *)self setShouldReportRevisionToDP:0];
            }
            if ((((unint64_t)[v27 tokenID] >> 32) - 500) <= 0xFFFFFE0C) {
              [(TIRevisionHistory *)self setLastRejectedToken:v27];
            }
          }
          goto LABEL_28;
        }
        char v17 = [(TIRevisionHistory *)self delegate];
        [v17 incrementUsageTrackingKey:*MEMORY[0x1E4FAEE18]];

        uint64_t v12 = [(TIRevisionHistory *)self delegate];
        objc_msgSend(v12, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", *MEMORY[0x1E4FAEB28], objc_msgSend(v27, "usageTrackingMask"));
LABEL_12:

        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  char v18 = [v27 usageLearningMask];
  if (a5
    && (v18 & 4) != 0
    && (((unint64_t)[v27 tokenID] >> 32) - 500) <= 0xFFFFFE0C)
  {
    BOOL v19 = [(TIRevisionHistory *)self delegate];
    uint64_t v20 = [v27 tokenInputString];
    [v19 softLearningRegisterDeleted:v20];
LABEL_28:
  }
}

- (void)acceptToken:(id)a3 contextTokens:(id)a4 saveToDifferentialPrivacy:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isAccepted]) {
    goto LABEL_37;
  }
  [v8 setAccepted:1];
  if ((((unint64_t)[v8 tokenID] >> 32) - 500) <= 0xFFFFFE0C)
  {
    if (([v8 usageLearningMask] & 4) != 0) {
      [v8 userTyping];
    }
    else {
    id v10 = [v8 tokenInputString];
    }
    id v11 = [(TIRevisionHistory *)self delegate];
    uint64_t v12 = [v8 tokenInputString];
    [v11 softLearningRegisterAccepted:v12 typed:v10];
  }
  uint64_t v13 = [(TIRevisionHistory *)self lastRejectedToken];
  if (v13)
  {
    id v14 = (void *)v13;
    unint64_t v15 = [v8 tokenID];

    if (HIDWORD(v15) != 1)
    {
      char v16 = [v8 tokenInputString];
      char v17 = [(TIRevisionHistory *)self lastRejectedToken];
      char v18 = [v17 userTyping];
      int v19 = [v16 isEqualToString:v18];

      if (v19)
      {
        uint64_t v20 = [(TIRevisionHistory *)self delegate];
        uint64_t v21 = *MEMORY[0x1E4FAEAF0];
        uint64_t v22 = [(TIRevisionHistory *)self lastRejectedToken];
        objc_msgSend(v20, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", v21, objc_msgSend(v22, "usageTrackingMask"));
      }
      else
      {
        if (([v8 usageLearningMask] & 4) != 0)
        {
LABEL_14:
          if ([(TIRevisionHistory *)self shouldReportRevisionToDP])
          {
            char v25 = [v8 tokenInputString];
            if ([v25 _containsSymbolsAndPunctuationOnly])
            {
            }
            else
            {
              int v26 = [v8 tokenInputString];
              id v27 = [(TIRevisionHistory *)self lastRejectedToken];
              uint64_t v28 = [v27 userTyping];
              if ([v26 localizedCaseInsensitiveCompare:v28])
              {
                char v29 = [(TIRevisionHistory *)self lastRejectedToken];
                BOOL v30 = ([v29 usageTrackingMask] & 0x80000) == 0;
              }
              else
              {
                BOOL v30 = 0;
              }

              if (v30) {
                uint64_t v5 = v5 | 2;
              }
              else {
                uint64_t v5 = v5;
              }
            }
          }
          [(TIRevisionHistory *)self setLastRejectedToken:0];
          [(TIRevisionHistory *)self setShouldReportRevisionToDP:1];
          goto LABEL_24;
        }
        uint64_t v20 = [(TIRevisionHistory *)self delegate];
        uint64_t v22 = [(TIRevisionHistory *)self lastRejectedToken];
        uint64_t v23 = [v22 tokenInputString];
        uint64_t v24 = [v8 tokenInputString];
        [v20 registerRevisionFrom:v23 to:v24 contextTokens:v9];
      }
      goto LABEL_14;
    }
  }
LABEL_24:
  if ((unint64_t)[v8 tokenID] >> 32 != 2
    && (unint64_t)[v8 tokenID] >> 32 != 1)
  {
    v31 = [(TIRevisionHistory *)self delegate];
    [v31 incrementUsageTrackingKeyForAppWithIsSentence:0];
  }
  uint64_t v32 = [(TIRevisionHistory *)self delegate];
  if ([v32 isStringBasedModel]) {
    [v8 tokenInputString];
  }
  else {
  uint64_t v33 = [v8 tokenDictionaryString];
  }

  uint64_t v34 = [v8 tokenLatinInputString];
  if (v34)
  {
    id v35 = [v8 tokenLatinInputString];
  }
  else
  {
    id v35 = &stru_1F3F7A998;
  }

  long long v36 = [(TIRevisionHistory *)self delegate];
  objc_msgSend(v36, "incrementLanguageModelCount:latinInputString:tokenID:contextTokens:saveToDifferentialPrivacy:", v33, v35, objc_msgSend(v8, "tokenID"), v9, v5);

  if (!((unint64_t)[v8 tokenID] >> 32))
  {
    long long v37 = [(TIRevisionHistory *)self delegate];
    int v38 = [v37 isStringBasedModel];

    if (v38)
    {
      char v42 = 0;
      uint64_t v39 = [(TIRevisionHistory *)self delegate];
      uint64_t v40 = [v8 tokenInputString];
      uint64_t v41 = 0;
      objc_msgSend(v8, "setTokenID:", objc_msgSend(v39, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", v40, v9, 22, &v41, &v42));
    }
  }

LABEL_37:
}

- (TIRevisionHistory)initWithLocale:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIRevisionHistory;
  uint64_t v5 = [(TIRevisionHistory *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    documentText = v5->_documentText;
    v5->_documentText = v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tokenization = v5->_tokenization;
    v5->_tokenization = v8;

    uint64_t v10 = LMStreamTokenizerCreate();
    v5->_tokenizer = (void *)v10;
    v5->_shouldReportRevisionToDP = 1;
    if (!v10)
    {

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (TIRevisionHistory)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(TIRevisionHistory *)self initWithLocale:v3];

  return v4;
}

- (void)dealloc
{
  if (self->_tokenizer) {
    LMStreamTokenizerRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)TIRevisionHistory;
  [(TIRevisionHistory *)&v3 dealloc];
}

+ (id)documentStateTrimmedToSentenceForState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 contextBeforeInput];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F3F7A998;
  }
  uint64_t v7 = [v3 selectedText];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_1F3F7A998;
  }
  uint64_t v10 = [(__CFString *)v6 stringByAppendingString:v9];
  uint64_t v11 = [v3 contextAfterInput];
  objc_super v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_1F3F7A998;
  }
  id v14 = [v10 stringByAppendingString:v13];

  unint64_t v15 = [v3 contextBeforeInput];
  uint64_t v16 = [v15 length];
  char v17 = [v3 selectedText];
  uint64_t v18 = [v17 length];

  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__9763;
  char v42 = __Block_byref_object_dispose__9764;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__9763;
  long long v36 = __Block_byref_object_dispose__9764;
  id v37 = 0;
  uint64_t v19 = [v14 length];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__TIRevisionHistory_documentStateTrimmedToSentenceForState___block_invoke;
  v26[3] = &unk_1E6E2B620;
  uint64_t v30 = v16;
  uint64_t v31 = v18;
  id v27 = v14;
  uint64_t v28 = &v38;
  char v29 = &v32;
  id v20 = v14;
  objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", 0, v19, 4, v26);
  uint64_t v21 = (void *)MEMORY[0x1E4FAE2A8];
  uint64_t v22 = v39[5];
  uint64_t v23 = [v3 selectedText];

  uint64_t v24 = [v21 documentStateWithContextBefore:v22 selectedText:v23 contextAfter:v33[5]];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __60__TIRevisionHistory_documentStateTrimmedToSentenceForState___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v11 = a2;
  unint64_t v12 = *(void *)(a1 + 56);
  unint64_t v13 = a3 + a4;
  BOOL v14 = v12 > a3 && v13 >= v12;
  id v23 = v11;
  if (v14)
  {
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, v12 - a3);
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    char v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v11 = v23;
    unint64_t v12 = *(void *)(a1 + 56);
  }
  unint64_t v18 = *(void *)(a1 + 64) + v12;
  if (a3 <= v18 && v13 > v18)
  {
    uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v18, v13 - v18);
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    id v11 = v23;
  }
  if (a7 && a3 > *(void *)(a1 + 64) + *(void *)(a1 + 56)) {
    *a7 = 1;
  }
}

@end