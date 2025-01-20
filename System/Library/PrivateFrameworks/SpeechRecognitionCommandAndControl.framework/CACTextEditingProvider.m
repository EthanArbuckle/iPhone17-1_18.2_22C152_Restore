@interface CACTextEditingProvider
- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased;
- (BOOL)isTextDisambiguationSupported;
- (BOOL)isVisibleTextRange:(_NSRange)a3;
- (BOOL)isVisibleTextRect:(CGRect)a3;
- (BOOL)marker:(id)a3 precedesMarker:(id)a4;
- (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4;
- (BOOL)shouldInsertInterWordSpaces;
- (CACTextEditingProvider)initWithSpokenCommand:(id)a3 axElement:(id)a4;
- (CGRect)rectForRange:(_NSRange)a3;
- (Class)textMarkerClass;
- (Class)textMarkerRangeClass;
- (SRCSTextEditing)textEditingEngine;
- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3;
- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3;
- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5;
- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8;
- (id)emojisMatchingTextInStrings:(id)a3;
- (id)firstPositionTextMarker;
- (id)lastPositionTextMarker;
- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6;
- (id)markerRangeForLineAtTextMarker:(id)a3;
- (id)nBestListFromPreviousTextInsertion;
- (id)selectionTextMarkerRange;
- (id)stringForTextMarkerRange:(id)a3;
- (id)textMarkerRangeFromPreviousTextInsertion;
- (int)searchGranularity;
- (int)statusOfEmojisFoundInString:(id)a3;
- (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4;
- (void)applyFormat;
- (void)deleteText;
- (void)deleteTextAtTextMarkerRange:(id)a3;
- (void)formatSelectionBold;
- (void)formatSelectionItalics;
- (void)formatSelectionUnderline;
- (void)handleCorrectionRequestWithStrings:(id)a3;
- (void)handleErrorIdentifier:(id)a3 withObjects:(id)a4;
- (void)handleSearchResultsWithRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4;
- (void)handleTextDisambiguationWithPhraseMatchResults:(id)a3 actionBlock:(id)a4;
- (void)insertAttributedString:(id)a3;
- (void)insertString:(id)a3;
- (void)performTextCopy;
- (void)performTextCut;
- (void)performTextPaste;
- (void)performTextRedo;
- (void)performTextSelectAll;
- (void)performTextUndo;
- (void)registerInsertedStringCategoryIdentifer:(id)a3;
- (void)setCompletionDeterminedManually:(BOOL)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setSelectionToTextMarkerRange:(id)a3;
@end

@implementation CACTextEditingProvider

- (CACTextEditingProvider)initWithSpokenCommand:(id)a3 axElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CACTextEditingProvider;
  v9 = [(CACTextEditingProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spokenCommand, a3);
    objc_storeStrong((id *)&v10->_axElement, a4);
    uint64_t v11 = objc_opt_new();
    textEditingEngine = v10->_textEditingEngine;
    v10->_textEditingEngine = (SRCSTextEditing *)v11;

    [(SRCSTextEditing *)v10->_textEditingEngine setProvider:v10];
    [(SRCSTextEditing *)v10->_textEditingEngine setDelayAfterSelectionBeforeExecutingAction:0.125];
  }

  return v10;
}

- (Class)textMarkerClass
{
  return (Class)objc_opt_class();
}

- (Class)textMarkerRangeClass
{
  return (Class)objc_opt_class();
}

- (void)formatSelectionBold
{
}

- (void)formatSelectionItalics
{
}

- (void)formatSelectionUnderline
{
}

- (void)applyFormat
{
}

- (void)performTextCopy
{
}

- (void)performTextCut
{
}

- (void)performTextPaste
{
}

- (void)performTextUndo
{
}

- (void)performTextRedo
{
}

- (void)performTextSelectAll
{
}

- (CGRect)rectForRange:(_NSRange)a3
{
  -[AXElement rectForRange:](self->_axElement, "rectForRange:", a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isVisibleTextRange:(_NSRange)a3
{
  return -[AXElement isVisibleTextRange:](self->_axElement, "isVisibleTextRange:", a3.location, a3.length);
}

- (BOOL)isVisibleTextRect:(CGRect)a3
{
  return -[AXElement isVisibleTextRect:](self->_axElement, "isVisibleTextRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)selectionTextMarkerRange
{
  return [(AXElement *)self->_axElement cacTextSelectionCACTextMarkerRange];
}

- (id)firstPositionTextMarker
{
  return [(AXElement *)self->_axElement cacFirstPosition];
}

- (id)lastPositionTextMarker
{
  return [(AXElement *)self->_axElement cacLastPosition];
}

- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6
{
  return (id)[(SRCSTextEditing *)self->_textEditingEngine markerRangeForEnumerationType:a3 desiredBlock:*(void *)&a4 count:a5 options:*(void *)&a6];
}

- (id)markerRangeForLineAtTextMarker:(id)a3
{
  uint64_t v4 = -[AXElement lineRangeForPosition:](self->_axElement, "lineRangeForPosition:", [a3 index]);
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v4, v3);
}

- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8
{
  return (id)[(SRCSTextEditing *)self->_textEditingEngine actOnStrings:a3 ambiguityResolution:a4 substringSearchGranularity:*(void *)&a5 alwaysCallActionOnClosestMatch:a6 options:a7 actionBlock:a8];
}

- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5
{
  return (id)[(SRCSTextEditing *)self->_textEditingEngine actOnRange:a3 options:a4 actionBlock:a5];
}

- (void)setSelectionToTextMarkerRange:(id)a3
{
}

- (id)stringForTextMarkerRange:(id)a3
{
  return [(AXElement *)self->_axElement cacStringForCACTextMarkerRange:a3];
}

- (void)deleteTextAtTextMarkerRange:(id)a3
{
}

- (void)deleteText
{
}

- (id)textMarkerRangeFromPreviousTextInsertion
{
  uint64_t v3 = [(CACTextEditingProvider *)self _rangeFromPreviousTextInsertionForAXElement:self->_axElement];
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v3, v2);
}

- (id)nBestListFromPreviousTextInsertion
{
  return [(CACTextEditingProvider *)self _nBestListFromPreviousTextInsertionForAXElement:self->_axElement];
}

- (int)searchGranularity
{
  uint64_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v3 = 2 * ([v2 dictationRecognizerMode] == 3);

  return v3;
}

- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased
{
  uint64_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v3 = [v2 isNextPreviousResolverSpokenCommandEmojiBased];

  return v3;
}

- (id)emojisMatchingTextInStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = +[CACEmojiManager sharedManager];
        v12 = [v11 emojisForText:v10 skinToneFilter:1];

        if ([v12 count]) {
          [v4 addObjectsFromArray:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isTextDisambiguationSupported
{
  return 1;
}

- (int)statusOfEmojisFoundInString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CACEmojiManager sharedManager];
  uint64_t v5 = [v4 countOfEmojisInString:v3];

  return v5 > 0;
}

- (BOOL)shouldInsertInterWordSpaces
{
  uint64_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v3 = [v2 dictationRecognizerMode];

  if ((v3 - 4) > 0xFFFFFFFD) {
    return 0;
  }
  uint64_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v5 = [v4 doesCurrentLanguageSupportInterWordSpaces];

  return v5;
}

- (void)handleTextDisambiguationWithPhraseMatchResults:(id)a3 actionBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v32 + 1) + 8 * v13) markerRange];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  long long v15 = [CACDisambiguationHandler alloc];
  long long v16 = +[CACLabeledElementsCollection labeledElementsFromTextMarkerRanges:v8 axElement:self->_axElement];
  long long v17 = [(CACDisambiguationHandler *)v15 initWithLabeledElements:v16];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke;
  v30[3] = &unk_264D122B0;
  id v18 = v7;
  v30[4] = self;
  id v31 = v18;
  [(CACDisambiguationHandler *)v17 setChosenLabeledElementHandler:v30];
  uint64_t v19 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v19 setDisambiguationHandler:v17];

  v20 = +[CACDisplayManager sharedManager];
  [v20 startShowingTransientOverlayForType:@"NumberedElements"];

  v21 = +[CACPreferences sharedPreferences];
  if (([v21 userHintsFeatures] & 2) == 0) {
    goto LABEL_14;
  }
  v22 = +[CACUserHintsManager sharedManager];
  int v23 = [v22 shouldDisplayUserHintAfterRegisteringIdentifier:@"DisambiguationPrompt"];

  if (v23)
  {
    v24 = +[CACPreferences sharedPreferences];
    if ([v24 isEnabledForCommandIdentifier:@"System.OverlayChooseLabelWithoutPrefix"])
    {
      v21 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.DisambiguationPrompt"];
    }
    else
    {
      v25 = NSString;
      v26 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.DisambiguationPromptWithCommandAsArgument"];
      v27 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      v28 = [v27 primaryStringForCommandIdentifier:@"System.OverlayChooseLabel"];
      v21 = [v25 stringWithValidatedFormat:v26, @"%@", 0, v28 validFormatSpecifiers error];
    }
    v29 = +[CACDisplayManager sharedManager];
    [v29 displayMessageString:v21 type:0 announcementCompletion:&__block_literal_global_25];

LABEL_14:
  }
}

void __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 textMarkerRange];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) stringForTextMarkerRange:v5];
  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);
}

void __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke_2()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
}

- (void)handleSearchResultsWithRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4
{
  if (a3)
  {
    id v4 = +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:a3 variantOverrides:a4];
    +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:v4];
  }
}

- (void)handleErrorIdentifier:(id)a3 withObjects:(id)a4
{
  id v11 = a4;
  if ([a3 isEqualToString:@"ErrorMessage.TextNotFound"])
  {
    id v5 = [v11 firstObject];

    if (v5)
    {
      id v6 = NSString;
      id v7 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.TextNotFound"];
      uint64_t v8 = [v11 firstObject];
      id v9 = [v6 stringWithValidatedFormat:v7, @"%@", 0, v8 validFormatSpecifiers error];

      uint64_t v10 = +[CACDisplayManager sharedManager];
      [v10 displayMessageString:v9 type:1];
    }
  }
}

- (void)handleCorrectionRequestWithStrings:(id)a3
{
  id v4 = a3;
  id v5 = [(CACTextEditingProvider *)self selectionTextMarkerRange];
  id v6 = [(CACTextEditingProvider *)self stringForTextMarkerRange:v5];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    uint64_t v8 = [(CACTextEditingProvider *)self textEditingEngine];
    [v8 selectCurrentWord];
  }
  id v9 = +[CACDisplayManager sharedManager];
  [v9 showCorrectionsForElement:self->_axElement nBestStrings:v4];
}

- (void)insertString:(id)a3
{
  id v3 = a3;
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v4 insertDictatedString:v3];
}

- (void)insertAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v4 insertDictatedAttributedString:v3];
}

- (void)registerInsertedStringCategoryIdentifer:(id)a3
{
  id v3 = a3;
  id v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v4 = [v5 stagedTextInsertionSpecifier];
  [v4 setInsertedCategoryID:v3];
}

- (void)setExecuting:(BOOL)a3
{
}

- (void)setCompletionDeterminedManually:(BOOL)a3
{
}

- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3 = a3;
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v5 = [v4 previousTextInsertionSpecifier];

  id v6 = [v5 axElement];
  int v7 = [v3 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v5 insertedRange];
    NSUInteger v10 = v9;
  }
  else
  {
    NSUInteger v10 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v5 = [v4 previousTextInsertionSpecifier];

  id v6 = [v5 insertedCategoryID];
  int v7 = [v5 axElement];
  int v8 = [v3 isEqual:v7];

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    NSUInteger v10 = 0;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    NSUInteger v11 = [v5 recognizedParams];
    NSUInteger v12 = [v11 objectForKey:kCACCommandParameterTextSequence];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    NSUInteger v10 = (void *)v13;
    if (v13)
    {
      id v20 = v3;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v15);
          long long v17 = [v16 objectForKey:kCACCommandParameterBuiltInIdentifier];
          int v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            NSUInteger v10 = [v16 objectForKey:kCACCommandParameterTextVariants];
            goto LABEL_17;
          }
          long long v15 = (char *)v15 + 1;
        }
        while (v10 != v15);
        NSUInteger v10 = (void *)[v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_17:
      id v3 = v20;
    }
  }
  return v10;
}

- (BOOL)marker:(id)a3 precedesMarker:(id)a4
{
  return +[CACTextMarker marker:a3 precedesMarker:a4];
}

- (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4
{
  return +[CACTextMarker marker:a3 precedesOrEqualsMarker:a4];
}

- (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4
{
  return +[CACTextMarker lengthFromMarker:a3 toMarker:a4];
}

- (SRCSTextEditing)textEditingEngine
{
  return (SRCSTextEditing *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEditingEngine, 0);
  objc_storeStrong((id *)&self->_axElement, 0);
  objc_storeStrong((id *)&self->_spokenCommand, 0);
}

@end