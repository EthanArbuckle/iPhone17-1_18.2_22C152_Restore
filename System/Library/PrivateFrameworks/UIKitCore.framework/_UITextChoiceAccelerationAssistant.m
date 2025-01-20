@interface _UITextChoiceAccelerationAssistant
- (BOOL)autocorrectInlinePromptIsVisible;
- (BOOL)dismissIfPresented;
- (BOOL)keepPromptActive;
- (BOOL)needsUpdate;
- (BOOL)positionIsAtDocumentStart:(id)a3;
- (BOOL)presentTextChoicePromptForText:(id)a3 delay:(double)a4 autocorrectionRects:(id)a5;
- (BOOL)promptIsVisible;
- (BOOL)showAutocorrectReplacementChoicesIfNeeded:(id)a3 forRange:(id)a4;
- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4;
- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4 delay:(double)a5;
- (BOOL)showChoicesForCandidates:(id)a3;
- (BOOL)showChoicesForTextInRange:(id)a3;
- (BOOL)showChoicesForTextInRange:(id)a3 withReplacements:(id)a4 delay:(double)a5;
- (BOOL)showDictationChoicesForTextInRange:(id)a3;
- (BOOL)showPromptForReplacementCandidate:(id)a3;
- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4;
- (BOOL)showPromptForReplacementCandidate:(id)a3 originalCandidate:(id)a4 delay:(double)a5;
- (BOOL)showingPrompt;
- (BOOL)showingPromptsIncludingDictationChoices;
- (BOOL)textChoiceInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4;
- (BOOL)usingCustomInteraction;
- (CGRect)convertedSelectionRect:(id)a3;
- (NSMutableArray)dictationVoiceEditingPrompts;
- (NSMutableArray)underlinedRanges;
- (NSMutableDictionary)savedLists;
- (NSMutableDictionary)underlinedWordData;
- (NSMutableDictionary)underlinedWordDataForDictation;
- (NSString)documentTextToReplace;
- (NSTimer)dictationPromptAutoUpdateTimer;
- (NSTimer)dictationUnderlineDisplayTimer;
- (NSTimer)promptDisplayTimer;
- (TIAutocorrectionList)lastList;
- (TIKeyboardCandidate)candidate;
- (UITextInput)textInputResponder;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)lastAddedPosition;
- (UITextRange)lastRange;
- (_UIAssertion)dictationDisambiguationUIAssertion;
- (_UIAssertion)grabberSuppressionAssertion;
- (_UIAssertion)textChoiceInteractionGrabberSuppressionAssertion;
- (_UITextChoiceAccelerationAssistant)init;
- (_UITextChoiceAccelerationAssistant)initWithInteractionAssistant:(id)a3;
- (_UITextChoiceAccelerationAssistant)initWithTextInputResponder:(id)a3;
- (_UITextChoiceAccelerationBubble)prompt;
- (_UITextChoiceAccelerationPassthroughView)passthroughContainer;
- (_UITextChoiceInteraction)textChoiceInteraction;
- (_UITextChoicesAssistantDelegate)delegate;
- (_UITextUnderlineView)selectionHighlightView;
- (id)_document;
- (id)_existingUnderlineView;
- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4;
- (id)_underlineView;
- (id)activeSelectedRange;
- (id)alternateCorrectionsForList:(id)a3;
- (id)anchorRangeForText:(id)a3;
- (id)autocorrectionForList:(id)a3;
- (id)candidateForFinalString:(id)a3;
- (id)createPromptWithCompletionHandler:(id)a3;
- (id)currentKeyboardSceneDelegate;
- (id)defaultUnderlineColor;
- (id)keyFromRange:(id)a3;
- (id)listForFinalString:(id)a3;
- (id)parentViewForPrompt;
- (id)rangeForTextChoicesAtPosition:(id)a3;
- (id)rangeOfAutocorrectionForString:(id)a3 atPosition:(id)a4 inDocument:(id)a5;
- (id)selectionRectsForRange:(id)a3;
- (id)selectionViewManager;
- (id)textHighlightColor;
- (id)textInputView;
- (id)underlineRectForTextSelectionRect:(id)a3 forCandidate:(id)a4;
- (id)underlineRectFromDocumentRect:(CGRect)a3;
- (id)underlineRectsForCandidate:(id)a3 range:(id)a4;
- (id)underlineRectsForCandidate:(id)a3 selectionRects:(id)a4;
- (id)underlineRectsForInput:(id)a3;
- (id)updateUnderlineRects:(id)a3 forRange:(id)a4;
- (void)_addUnderlineView;
- (void)_removeUnderlinesRelativeToPosition:(id)a3 compare:(int64_t)a4;
- (void)activateUnderlineViewIfNeeded;
- (void)addList:(id)a3 forCandidate:(id)a4;
- (void)addUnderlineForCandidate:(id)a3 range:(id)a4;
- (void)addUnderlinesForCandidate:(id)a3 range:(id)a4;
- (void)adjustRangesAfterPosition:(id)a3 byOffset:(int64_t)a4;
- (void)cancelPendingDictationPromptDisplay;
- (void)cancelPromptDisplay;
- (void)clearSecureCandidateHashes;
- (void)clearUnderlineForPosition:(id)a3;
- (void)clearUnderlinesIfNeededBeforePosition:(id)a3;
- (void)clearUnderlinesInRange:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)decorateTextInRanges:(id)a3 replacementText:(id)a4 allowAutomaticReplacement:(BOOL)a5 autoHide:(BOOL)a6 voiceCommandTrackingUUID:(id)a7 withCompletionHandler:(id)a8;
- (void)decorateTextInRects:(id)a3 targetTextArray:(id)a4 replacementText:(id)a5 deltaRanges:(id)a6 originalSelectedRange:(_NSRange)a7 allowAutomaticReplacement:(BOOL)a8 autoHide:(BOOL)a9 voiceCommandUUID:(id)a10 withCompletionHandler:(id)a11;
- (void)didRecognizeDismissal;
- (void)dismissWithoutSelection;
- (void)fullAutocorrectionForWord:(id)a3 atPosition:(id)a4 completionHandler:(id)a5;
- (void)informAnalyticsOfCompletedCandidateReplacement;
- (void)informAnalyticsOfUpcomingCandidateReplacement;
- (void)presentIfNeededForRange:(id)a3;
- (void)refreshExistingUnderlines;
- (void)releaseSelectionGrabberAssertion;
- (void)removeActivePromptAndUnderline;
- (void)removeAllUnderlines;
- (void)removeAllUnderlinesAnimated:(BOOL)a3;
- (void)removePassthroughContainer;
- (void)removeUnderlinesAfterPosition:(id)a3;
- (void)removeUnderlinesBeforePosition:(id)a3;
- (void)removeWordForRange:(id)a3;
- (void)removeWordForRange:(id)a3 animated:(BOOL)a4;
- (void)resetDictationChoices;
- (void)resetDictationUnderlines;
- (void)restoreInsertionPointPositionWithDocument:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7;
- (void)selectionDidChange;
- (void)setDelegate:(id)a3;
- (void)setDictationDisambiguationUIAssertion:(id)a3;
- (void)setDictationPromptAutoUpdateTimer:(id)a3;
- (void)setDictationUnderlineDisplayTimer:(id)a3;
- (void)setDictationVoiceEditingPrompts:(id)a3;
- (void)setDocumentTextToReplace:(id)a3;
- (void)setGrabberSuppressionAssertion:(id)a3;
- (void)setKeepPromptActive:(BOOL)a3;
- (void)setLastAddedPosition:(id)a3;
- (void)setLastList:(id)a3;
- (void)setLastRange:(id)a3;
- (void)setNeedsUnderlineUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setPassthroughContainer:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setPromptDisplayTimer:(id)a3;
- (void)setSavedLists:(id)a3;
- (void)setSelectionHighlightView:(id)a3;
- (void)setTextChoiceInteraction:(id)a3;
- (void)setTextChoiceInteractionGrabberSuppressionAssertion:(id)a3;
- (void)setUnderlinedRanges:(id)a3;
- (void)setUnderlinedWordData:(id)a3;
- (void)setUnderlinedWordDataForDictation:(id)a3;
- (void)setUsingCustomInteraction:(BOOL)a3;
- (void)setupPassthroughContainer;
- (void)shouldShowPromptForWebKitText:(id)a3 atPosition:(id)a4 completionHandler:(id)a5;
- (void)textChoiceInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4;
- (void)textDidEndScrolling;
- (void)textWillBeginScrolling;
- (void)trackUnderlineForWebKitCandidate:(id)a3;
- (void)underlineTextInRange:(id)a3 revertText:(id)a4;
- (void)underlineTextInRange:(id)a3 revertText:(id)a4 textChoices:(id)a5 isActiveEditingSession:(BOOL)a6;
- (void)updateActivePromptForCandidate:(id)a3 displayRects:(id)a4 highlightOnly:(BOOL)a5;
- (void)updateDictationChoicesFromPromptIndex:(int64_t)a3 completionHandler:(id)a4;
- (void)updateDocumentFromPrompt:(id)a3 completionHandler:(id)a4;
- (void)updatePrompt:(id)a3 forReplacementCandidate:(id)a4;
- (void)updatePromptLocation:(id)a3;
- (void)updateReplacements:(id)a3 forCandidate:(id)a4;
- (void)updateReplacementsForSavedCandidate:(id)a3;
- (void)updateSelectionHighlights;
- (void)updateUnderlineGeometryIfNeeded;
- (void)updateUnderlinesForAddedRange:(id)a3;
- (void)updateUnderlinesIfNeededAfterPosition:(id)a3;
@end

@implementation _UITextChoiceAccelerationAssistant

- (_UITextChoiceAccelerationAssistant)init
{
  return [(_UITextChoiceAccelerationAssistant *)self initWithInteractionAssistant:0];
}

- (_UITextChoiceAccelerationAssistant)initWithInteractionAssistant:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITextChoiceAccelerationAssistant;
  v5 = [(_UITextChoiceAccelerationAssistant *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactionAssistant, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    underlinedRanges = v6->_underlinedRanges;
    v6->_underlinedRanges = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    savedLists = v6->_savedLists;
    v6->_savedLists = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    underlinedWordData = v6->_underlinedWordData;
    v6->_underlinedWordData = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    underlinedWordDataForDictation = v6->_underlinedWordDataForDictation;
    v6->_underlinedWordDataForDictation = (NSMutableDictionary *)v13;

    v6->_usingCustomInteraction = 0;
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel_displayDidChange_ name:@"UITextSelectionWillScroll" object:0];
    [v15 addObserver:v6 selector:sel_displayDidChange_ name:@"UITextSelectionWillZoom" object:0];
    [v15 addObserver:v6 selector:sel_updatePromptLocation_ name:@"UIWindowSceneDidEndLiveResizeNotification" object:0];
  }
  return v6;
}

- (_UITextChoiceAccelerationAssistant)initWithTextInputResponder:(id)a3
{
  id v4 = a3;
  v5 = [(_UITextChoiceAccelerationAssistant *)self initWithInteractionAssistant:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInputResponder, v4);
    v6->_usingCustomInteraction = 1;
    uint64_t v7 = [[_UITextChoiceInteraction alloc] initWithDelegate:v6];
    textChoiceInteraction = v6->_textChoiceInteraction;
    v6->_textChoiceInteraction = v7;
  }
  return v6;
}

- (void)dealloc
{
  prompt = self->_prompt;
  if (prompt)
  {
    [(_UITextChoiceAccelerationBubble *)prompt removeFromSuperview];
    id v4 = self->_prompt;
    self->_prompt = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextChoiceAccelerationAssistant;
  [(_UITextChoiceAccelerationAssistant *)&v5 dealloc];
}

- (BOOL)textChoiceInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (![(_UITextChoiceAccelerationAssistant *)self usingCustomInteraction]
    || [(_UITextChoiceAccelerationAssistant *)self showingPrompt])
  {
    return 0;
  }
  v8 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
  uint64_t v9 = objc_msgSend(v8, "closestPositionToPoint:", x, y);

  BOOL v7 = 0;
  if (v9)
  {
    v10 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v9];

    if (v10) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)textChoiceInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(_UITextChoiceAccelerationAssistant *)self showingPrompt])
  {
    [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
    BOOL v7 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
    objc_msgSend(v7, "closestPositionToPoint:", x, y);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v19;
    if (!v19) {
      goto LABEL_10;
    }
    uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v9)
    {
      v10 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      v12 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      uint64_t v13 = [v12 textRangeFromPosition:v19 toPosition:v19];
      [v10 updateTextChoicePromptSelection:v11 toRange:v13];
    }
  }
  else
  {
    v14 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
    objc_msgSend(v14, "closestPositionToPoint:", x, y);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19) {
      goto LABEL_8;
    }
    uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v19];
    if (!v15
      || (v16 = (void *)v15,
          [(_UITextChoiceAccelerationAssistant *)self textInputResponder],
          objc_super v17 = objc_claimAutoreleasedReturnValue(),
          BOOL v18 = [(_UITextChoiceAccelerationAssistant *)self showAutocorrectReplacementChoicesIfNeeded:v17 forRange:v16], v17, v16, !v18))
    {
LABEL_8:
      [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
    }
  }
  v8 = v19;
LABEL_10:
}

- (_UITextChoiceAccelerationBubble)prompt
{
  prompt = self->_prompt;
  if (!prompt)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self createPromptWithCompletionHandler:0];
    objc_super v5 = self->_prompt;
    self->_prompt = v4;

    prompt = self->_prompt;
  }
  return prompt;
}

- (id)createPromptWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [_UITextChoiceAccelerationBubble alloc];
  v6 = -[_UITextChoiceAccelerationBubble initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __72___UITextChoiceAccelerationAssistant_createPromptWithCompletionHandler___block_invoke;
  uint64_t v15 = &unk_1E52EEC70;
  objc_copyWeak(&v18, &location);
  BOOL v7 = v6;
  v16 = v7;
  id v8 = v4;
  id v17 = v8;
  uint64_t v9 = +[UIAction actionWithHandler:&v12];
  -[UIControl addAction:forControlEvents:](v7, "addAction:forControlEvents:", v9, 64, v12, v13, v14, v15);
  v10 = v7;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_addUnderlineView
{
  v3 = [(_UITextChoiceAccelerationAssistant *)self selectionHighlightView];

  if (!v3)
  {
    id v4 = [_UITextUnderlineView alloc];
    objc_super v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UITextChoiceAccelerationAssistant *)self setSelectionHighlightView:v5];
  }
  v6 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
  id v8 = [v6 _hostViewBelowText];

  BOOL v7 = [(_UITextChoiceAccelerationAssistant *)self selectionHighlightView];
  [v8 addSubview:v7];
}

- (id)_underlineView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
    id v4 = [v3 _underlineView];
  }
  else
  {
    id v4 = self->_selectionHighlightView;
  }
  return v4;
}

- (id)_existingUnderlineView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
    id v4 = [v3 _existingUnderlineView];
  }
  else
  {
    id v4 = self->_selectionHighlightView;
  }
  return v4;
}

- (id)_document
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
    id v4 = [v3 textInput];
  }
  else
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
    objc_super v5 = [v3 activeSelectionController];
    v6 = [v5 selection];
    id v4 = [v6 document];
  }
  return v4;
}

- (id)selectionViewManager
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];

  if (v3)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
    id v5 = [v4 _selectionViewManager];
  }
  else
  {
    BOOL v7 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v7)
    {
      id v8 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      id v5 = [v8 _selectionDisplayInteraction];

      if (!v5)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
        v10 = [v9 textInputView];
        uint64_t v11 = [v10 interactions];

        id v12 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v12 = v15;
                if ([v12 isActivated]) {
                  id v16 = v12;
                }
                else {
                  id v16 = 0;
                }

                goto LABEL_22;
              }
            }
            id v12 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        id v16 = 0;
LABEL_22:

        if (v16) {
          id v17 = v16;
        }
        else {
          id v17 = v12;
        }
        id v5 = v17;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)textInputView
{
  v3 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];

  if (v3)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
    id v5 = [v4 view];
    v6 = [v5 textInputView];
  }
  else
  {
    v6 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
    v6 = [v4 textInputView];
  }

LABEL_6:
  return v6;
}

- (void)activateUnderlineViewIfNeeded
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];

    if (!v3)
    {
      id v5 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
      [v5 activate];
    }
  }
  else
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self selectionHighlightView];

    if (!v4)
    {
      [(_UITextChoiceAccelerationAssistant *)self _addUnderlineView];
    }
  }
}

- (void)cancelPromptDisplay
{
  v3 = [(_UITextChoiceAccelerationAssistant *)self promptDisplayTimer];
  [v3 invalidate];

  [(_UITextChoiceAccelerationAssistant *)self setPromptDisplayTimer:0];
  [(_UITextChoiceAccelerationAssistant *)self removePassthroughContainer];
}

- (void)setNeedsUnderlineUpdate
{
  if (!self->_needsUpdate && !+[UIKeyboard isKeyboardProcess])
  {
    self->_needsUpdate = 1;
    [(_UITextChoiceAccelerationAssistant *)self performSelector:sel_updateUnderlineGeometryIfNeeded withObject:0 afterDelay:0.0];
  }
}

- (void)updateUnderlineGeometryIfNeeded
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdate)
  {
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = [(_UITextChoiceAccelerationAssistant *)self _document];
    char v4 = [v3 isEditing];

    if ((v4 & 1) == 0)
    {
      [(_UITextChoiceAccelerationAssistant *)self removeAllUnderlinesAnimated:0];
      [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
    }
    id v5 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    v6 = (void *)[v5 copy];

    if (![v6 count]) {
      [(_UITextChoiceAccelerationAssistant *)self removeAllUnderlinesAnimated:0];
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v57 count:16];
    uint64_t v9 = v7;
    if (v8)
    {
      uint64_t v10 = v8;
      char v11 = 0;
      uint64_t v12 = *(void *)v54;
      id v50 = v7;
      uint64_t v51 = *(void *)v54;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v52 = v10;
        do
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * v13);
          if (([v14 isEmpty] & 1) == 0)
          {
            uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self _document];
            id v16 = [v15 textInRange:v14];

            id v17 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v14];
            long long v18 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
            long long v19 = [v18 objectForKey:v17];

            if (v19)
            {
              long long v20 = [v19 documentTextToReplace];
              int v21 = [v20 isEqualToString:v16];

              if (v21)
              {
                if ((v11 & 1) == 0)
                {
                  v22 = [(_UITextChoiceAccelerationAssistant *)self selectionRectsForRange:v14];
                  uint64_t v23 = [v22 firstObject];
                  [v23 rect];
                  double v25 = v24;
                  double v27 = v26;

                  v28 = [v19 underlines];
                  v29 = [v28 firstObject];
                  [v29 rect];
                  double v31 = v30;
                  double v33 = v32;

                  if (v25 == v31 && v27 == v33)
                  {
                    v35 = [v22 lastObject];
                    [v35 rect];
                    double v37 = v36;
                    double v39 = v38;
                    v40 = [v19 underlines];
                    v41 = [v40 lastObject];
                    [v41 rect];
                    double v43 = v42;
                    double v45 = v44;

                    id v7 = v50;
                    if (v37 == v43 && v39 == v45)
                    {

                      uint64_t v9 = v50;
                      goto LABEL_31;
                    }
                  }
                  else
                  {
                  }
                }
                v46 = [v19 underlines];
                v47 = [(_UITextChoiceAccelerationAssistant *)self updateUnderlineRects:v46 forRange:v14];
                [v19 setUnderlines:v47];

                id v7 = v50;
                v48 = [v19 underlines];
                [v49 addObjectsFromArray:v48];

                char v11 = 1;
              }
              uint64_t v12 = v51;
            }
            else
            {
              [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v14];
            }

            uint64_t v10 = v52;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      if (v11)
      {
        uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
        [v9 setUnderlineRects:v49];
        goto LABEL_31;
      }
    }
    else
    {
LABEL_31:
    }
    self->_needsUpdate = 0;
  }
}

- (void)refreshExistingUnderlines
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (!+[UIKeyboard isKeyboardProcess])
  {
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    char v4 = (void *)[v3 copy];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (!v5) {
      goto LABEL_48;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v75;
    uint64_t v63 = *(void *)v75;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v64 = v6;
      do
      {
        if (*(void *)v75 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v74 + 1) + 8 * v8);
        uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
        char v11 = [v10 textInRange:v9];

        uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v9];
        uint64_t v13 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
        v14 = [v13 objectForKey:v12];

        if (!v14)
        {
          [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v9];
          goto LABEL_44;
        }
        uint64_t v15 = [v14 documentTextToReplace];
        int v16 = [v15 isEqualToString:v11];

        if (v16)
        {
          id v17 = [v14 underlines];
          long long v18 = [(_UITextChoiceAccelerationAssistant *)self updateUnderlineRects:v17 forRange:v9];
          [v14 setUnderlines:v18];

          long long v19 = [v14 underlines];
          [v65 addObjectsFromArray:v19];

          goto LABEL_44;
        }
        long long v20 = [v9 start];
        int v21 = [(_UITextChoiceAccelerationAssistant *)self _document];
        v22 = [v21 endOfDocument];

        v67 = v22;
        if (v22)
        {
          if (!v20
            || ([(_UITextChoiceAccelerationAssistant *)self _document],
                uint64_t v23 = objc_claimAutoreleasedReturnValue(),
                uint64_t v24 = [v23 comparePosition:v22 toPosition:v20],
                v23,
                v24 == -1))
          {
            id v25 = v22;

            long long v20 = v25;
          }
        }
        double v26 = [(_UITextChoiceAccelerationAssistant *)self _document];
        double v27 = [v26 tokenizer];
        v28 = [v27 rangeEnclosingPosition:v20 withGranularity:1 inDirection:1];

        v68 = v20;
        v69 = v12;
        if (v28 && ([v28 isEmpty] & 1) == 0)
        {
          uint64_t v39 = [(_UITextChoiceAccelerationAssistant *)self _document];
          v29 = [(id)v39 textInRange:v28];

          v40 = [v14 documentTextToReplace];
          LOBYTE(v39) = [v40 isEqualToString:v29];

          if (v39) {
            goto LABEL_30;
          }
        }
        else
        {
          v29 = v11;
        }
        double v30 = [(_UITextChoiceAccelerationAssistant *)self _document];
        double v31 = [v30 tokenizer];
        double v32 = [v31 rangeEnclosingPosition:v20 withGranularity:1 inDirection:0];

        if (v32 && ([v32 isEmpty] & 1) == 0)
        {
          uint64_t v41 = [(_UITextChoiceAccelerationAssistant *)self _document];
          double v33 = [(id)v41 textInRange:v32];

          double v42 = [v14 documentTextToReplace];
          LOBYTE(v41) = [v42 isEqualToString:v33];

          if (v41)
          {
            v29 = v33;
            v28 = v32;
LABEL_30:
            double v45 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
            uint64_t v46 = [v45 indexOfObject:v9];

            v47 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
            v48 = v47;
            v62 = v29;
            if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
              [v47 addObject:v28];
            }
            else {
              [v47 replaceObjectAtIndex:v46 withObject:v28];
            }

            id v49 = [(_UITextChoiceAccelerationAssistant *)self selectionRectsForRange:v28];
            id v50 = [MEMORY[0x1E4F1CA48] array];
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v51 = v49;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v71;
              do
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  if (*(void *)v71 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  long long v56 = -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", *(void *)(*((void *)&v70 + 1) + 8 * i), 0, v62);
                  if (v56) {
                    [v50 addObject:v56];
                  }
                }
                uint64_t v53 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
              }
              while (v53);
            }

            [v14 setUnderlines:v50];
            [v65 addObjectsFromArray:v50];
            v57 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v28];
            uint64_t v58 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
            uint64_t v12 = v69;
            [v58 removeObjectForKey:v69];

            v59 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
            [v59 setObject:v14 forKey:v57];

            uint64_t v7 = v63;
            uint64_t v6 = v64;
            v29 = v62;
            goto LABEL_43;
          }
        }
        else
        {
          double v33 = v29;
        }
        v34 = [(_UITextChoiceAccelerationAssistant *)self _document];
        v35 = [v34 tokenizer];
        double v36 = [v35 positionFromPosition:v20 toBoundary:1 inDirection:0];

        double v37 = [(_UITextChoiceAccelerationAssistant *)self _document];
        double v38 = [v37 tokenizer];
        v28 = [v38 rangeEnclosingPosition:v36 withGranularity:1 inDirection:0];

        if (v28 && ![v28 isEmpty])
        {
          double v43 = [(_UITextChoiceAccelerationAssistant *)self _document];
          v29 = [v43 textInRange:v28];

          double v44 = [v14 documentTextToReplace];
          LODWORD(v43) = [v44 isEqualToString:v29];

          uint64_t v12 = v69;
          if (v43) {
            goto LABEL_30;
          }
          uint64_t v6 = v64;
        }
        else
        {

          v29 = v33;
          uint64_t v6 = v64;
          uint64_t v12 = v69;
        }
        [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v9];
        uint64_t v7 = v63;
LABEL_43:

        char v11 = v29;
LABEL_44:

        ++v8;
      }
      while (v8 != v6);
      uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
      uint64_t v6 = v60;
      if (!v60)
      {
LABEL_48:

        v61 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
        [v61 setUnderlineRects:v65];

        return;
      }
    }
  }
}

- (void)updateUnderlinesForAddedRange:(id)a3
{
  id v20 = a3;
  [(_UITextChoiceAccelerationAssistant *)self activateUnderlineViewIfNeeded];
  char v4 = v20;
  if (v20)
  {
    uint64_t v5 = [v20 start];
    BOOL v6 = [(_UITextChoiceAccelerationAssistant *)self positionIsAtDocumentStart:v5];

    if (!v6)
    {
      uint64_t v7 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v8 = [v7 tokenizer];
      uint64_t v9 = [v20 start];
      uint64_t v10 = [v8 positionFromPosition:v9 toBoundary:2 inDirection:1];

      if (v10)
      {
        char v11 = [(_UITextChoiceAccelerationAssistant *)self _document];
        uint64_t v12 = [v20 start];
        uint64_t v13 = [v11 comparePosition:v12 toPosition:v10];

        if (v13) {
          [(_UITextChoiceAccelerationAssistant *)self removeUnderlinesBeforePosition:v10];
        }
      }
    }
    v14 = [(_UITextChoiceAccelerationAssistant *)self lastAddedPosition];

    if (v14)
    {
      uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self _document];
      int v16 = [v20 end];
      id v17 = [(_UITextChoiceAccelerationAssistant *)self lastAddedPosition];
      uint64_t v18 = [v15 comparePosition:v16 toPosition:v17];

      long long v19 = [v20 end];
      if (v18 != 1)
      {
        [(_UITextChoiceAccelerationAssistant *)self updateUnderlinesIfNeededAfterPosition:v19];
LABEL_12:

        char v4 = v20;
        goto LABEL_13;
      }
    }
    else
    {
      long long v19 = [v20 end];
    }
    [(_UITextChoiceAccelerationAssistant *)self setLastAddedPosition:v19];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)addUnderlinesForCandidate:(id)a3 range:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  [(_UITextChoiceAccelerationAssistant *)self updateUnderlinesForAddedRange:v6];
  uint64_t v7 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForCandidate:v17 range:v6];
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess") && [v7 count])
  {
    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v8)
    {
      uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      uint64_t v10 = [v9 textInputView];
      char v11 = [(_UITextChoiceAccelerationAssistant *)self textChoiceInteraction];
      [v10 addInteraction:v11];
    }
    uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
    [v12 addUnderlines:v7 animated:0];

    uint64_t v13 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    [v13 addObject:v6];

    v14 = +[_UIReplacementCandidate candidateForAutocorrectionCandidate:v17 range:v6];
    [v14 setUnderlines:v7];
    [v14 setUnderlineStyle:1];
    uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    int v16 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v6];
    [v15 setObject:v14 forKey:v16];
  }
}

- (void)addUnderlineForCandidate:(id)a3 range:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v7 = [v18 candidate];
    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self anchorRangeForText:v7];

    uint64_t v9 = [v18 candidate];
    uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForInput:v9];

    char v11 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    [v11 addObject:v8];

    uint64_t v12 = +[_UIReplacementCandidate candidateForAutocorrectionCandidate:v18 range:v8];
    [v12 setUnderlines:v10];
    [v12 setUnderlineStyle:0];
    uint64_t v13 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    v14 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v8];
    [v13 setObject:v12 forKey:v14];
  }
  if (v6)
  {
    if (([v6 isEmpty] & 1) == 0)
    {
      uint64_t v15 = [v6 start];
      if (v15)
      {
        int v16 = (void *)v15;
        id v17 = [v6 end];

        if (v17) {
          [(_UITextChoiceAccelerationAssistant *)self addUnderlinesForCandidate:v18 range:v6];
        }
      }
    }
  }
}

- (void)underlineTextInRange:(id)a3 revertText:(id)a4 textChoices:(id)a5 isActiveEditingSession:(BOOL)a6
{
  BOOL v6 = a6;
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  [(_UITextChoiceAccelerationAssistant *)self updateUnderlinesForAddedRange:v29];
  uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForCandidate:0 range:v29];
  BOOL v13 = +[UIKeyboard isKeyboardProcess];
  if (v29 && !v13)
  {
    v14 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    [v14 addObject:v29];

    uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self _document];
    int v16 = [v15 textInRange:v29];

    if (v16 && [v16 length])
    {
      id v17 = +[_UIReplacementCandidate candidateForDocumentText:v16 revertText:v10 textChoices:0 range:v29 underlineStyle:1 promptStyle:1 promptButton:2];
      [v17 setRevertText:v10];
      [v17 setTextChoices:v11];
      uint64_t v18 = [v12 count];
      BOOL v19 = v18 != 0;
      if (v18) {
        [v17 setUnderlines:v12];
      }
      [v17 setUnderlineStyle:1];
      id v20 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
      int v21 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v29];
      [v20 setObject:v17 forKey:v21];

      if (v6)
      {
        v22 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
        uint64_t v23 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v29];
        [v22 setObject:v17 forKey:v23];
      }
    }
    else
    {
      BOOL v19 = 0;
    }
    uint64_t v24 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
    [v24 addUnderlines:v12 animated:0];

    id v25 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v25)
    {
      double v26 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      double v27 = [v26 textInputView];
      v28 = [(_UITextChoiceAccelerationAssistant *)self textChoiceInteraction];
      [v27 addInteraction:v28];
    }
    if (v19) {
      [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
    }
  }
}

- (void)underlineTextInRange:(id)a3 revertText:(id)a4
{
}

- (id)underlineRectsForCandidate:(id)a3 range:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(_UITextChoiceAccelerationAssistant *)self selectionRectsForRange:a4];
  uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForCandidate:v6 selectionRects:v7];

  return v8;
}

- (id)underlineRectsForCandidate:(id)a3 selectionRects:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", *(void *)(*((void *)&v16 + 1) + 8 * i), v6, (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
  id v6 = [v5 _underlineRectsByDocumentLineForSelectionRange:v4];

  return v6;
}

- (id)updateUnderlineRects:(id)a3 forRange:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UITextChoiceAccelerationAssistant *)self selectionRectsForRange:v7];
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v9 = +[UIKeyboard currentDocumentState];
    uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
    uint64_t v11 = [v7 _asNSRangeRelativeToDocument:v10];
    uint64_t v13 = v12;

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "firstRectForCharacterRange:", v11, v13);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v22 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      uint64_t v23 = [v22 inputOverlayContainer];
      uint64_t v24 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v23, v15, v17, v19, v21);

      v33[0] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

      id v8 = (void *)v25;
    }
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v8 count])
  {
    unint64_t v27 = 0;
    while (1)
    {
      v28 = [v8 objectAtIndex:v27];
      id v29 = [(_UITextChoiceAccelerationAssistant *)self underlineRectForTextSelectionRect:v28 forCandidate:0];
      if (v27 < [v6 count])
      {
        if (v29) {
          break;
        }
      }
      if (v29) {
        goto LABEL_11;
      }
LABEL_12:

      if (++v27 >= [v8 count]) {
        goto LABEL_13;
      }
    }
    double v30 = [v6 objectAtIndex:v27];
    objc_msgSend(v29, "setUnderlineType:", objc_msgSend(v30, "underlineType"));
    double v31 = [v30 underlineColor];
    [v29 setUnderlineColor:v31];

LABEL_11:
    [v26 addObject:v29];
    goto LABEL_12;
  }
LABEL_13:

  return v26;
}

- (id)keyFromRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
  NSUInteger v6 = [v4 _asNSRangeRelativeToDocument:v5];
  NSUInteger v8 = v7;

  id v9 = NSString;
  v14.id location = v6;
  v14.length = v8;
  uint64_t v10 = NSStringFromRange(v14);
  uint64_t v11 = [v9 stringWithFormat:@"%@", v10];

  return v11;
}

- (void)selectionDidChange
{
  if ([(_UITextChoiceAccelerationAssistant *)self usingCustomInteraction])
  {
    v3 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
    if (v3)
    {
      id v5 = v3;
      id v4 = [v3 end];
      [(_UITextChoiceAccelerationAssistant *)self updateUnderlinesIfNeededAfterPosition:v4];

      v3 = v5;
    }
  }
}

- (void)_removeUnderlinesRelativeToPosition:(id)a3 compare:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v30 = self;
  NSUInteger v7 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  NSUInteger v8 = (void *)[v7 copy];

  id v9 = v6;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        NSRange v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v15 = [v14 start];
        if (a4 == -1)
        {
          uint64_t v16 = [v14 end];

          double v15 = (void *)v16;
        }
        double v17 = [(_UITextChoiceAccelerationAssistant *)v30 _document];
        uint64_t v18 = [v17 comparePosition:v15 toPosition:v9];

        if (v18 == a4)
        {
          int64_t v19 = a4;
          uint64_t v20 = v11;
          uint64_t v21 = v12;
          v22 = v9;
          uint64_t v23 = [(_UITextChoiceAccelerationAssistant *)v30 underlinedWordData];
          uint64_t v24 = [(_UITextChoiceAccelerationAssistant *)v30 keyFromRange:v14];
          uint64_t v25 = [v23 objectForKey:v24];

          if (v25)
          {
            id v26 = [v25 underlines];
            [v28 addObjectsFromArray:v26];
          }
          [(_UITextChoiceAccelerationAssistant *)v30 removeWordForRange:v14];

          id v9 = v22;
          uint64_t v12 = v21;
          uint64_t v11 = v20;
          a4 = v19;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  unint64_t v27 = [(_UITextChoiceAccelerationAssistant *)v30 _underlineView];
  [v27 removeUnderlines:v28 animated:1];
}

- (void)removeUnderlinesBeforePosition:(id)a3
{
  id v7 = a3;
  id v4 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  uint64_t v5 = [v4 count];

  id v6 = v7;
  if (v7 && v5)
  {
    [(_UITextChoiceAccelerationAssistant *)self _removeUnderlinesRelativeToPosition:v7 compare:-1];
    id v6 = v7;
  }
}

- (void)removeUnderlinesAfterPosition:(id)a3
{
  if (a3) {
    [(_UITextChoiceAccelerationAssistant *)self _removeUnderlinesRelativeToPosition:a3 compare:1];
  }
}

- (void)clearUnderlinesIfNeededBeforePosition:(id)a3
{
  id v21 = a3;
  id v4 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  uint64_t v5 = [v4 count];

  id v6 = v21;
  if (v21 && v5)
  {
    if ([(_UITextChoiceAccelerationAssistant *)self positionIsAtDocumentStart:v21])
    {
      [(_UITextChoiceAccelerationAssistant *)self removeAllUnderlinesAnimated:0];
      [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
LABEL_15:
      id v6 = v21;
      goto LABEL_16;
    }
    id v7 = [(_UITextChoiceAccelerationAssistant *)self _document];
    NSUInteger v8 = [v7 tokenizer];
    id v9 = [v8 positionFromPosition:v21 toBoundary:1 inDirection:1];

    if (v9)
    {
      uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v11 = [v10 textRangeFromPosition:v9 toPosition:v21];

      if (v11
        && ([(_UITextChoiceAccelerationAssistant *)self _document],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            [v12 textInRange:v11],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isEqualToString:@" "],
            v13,
            v12,
            (v14 & 1) != 0))
      {
        double v15 = [(_UITextChoiceAccelerationAssistant *)self _document];
        uint64_t v16 = [v15 tokenizer];
        uint64_t v17 = [v16 positionFromPosition:v9 toBoundary:1 inDirection:1];

        id v9 = (void *)v17;
        if (!v17) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      uint64_t v18 = [(_UITextChoiceAccelerationAssistant *)self _document];
      int64_t v19 = [v18 tokenizer];
      uint64_t v20 = [v19 positionFromPosition:v9 toBoundary:1 inDirection:1];

      if (v20) {
        [(_UITextChoiceAccelerationAssistant *)self removeUnderlinesBeforePosition:v20];
      }
      [(_UITextChoiceAccelerationAssistant *)self setKeepPromptActive:0];
    }
LABEL_14:
    [(_UITextChoiceAccelerationAssistant *)self updateUnderlinesIfNeededAfterPosition:v21];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateUnderlinesIfNeededAfterPosition:(id)a3
{
  id v14 = a3;
  id v4 = [(_UITextChoiceAccelerationAssistant *)self lastAddedPosition];

  if (v4)
  {
    uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
    id v6 = [(_UITextChoiceAccelerationAssistant *)self lastAddedPosition];
    uint64_t v7 = [v5 comparePosition:v14 toPosition:v6];

    if (v7 == -1)
    {
      NSUInteger v8 = [(_UITextChoiceAccelerationAssistant *)self _document];
      id v9 = [v8 tokenizer];
      uint64_t v10 = [v9 positionFromPosition:v14 toBoundary:2 inDirection:0];

      if (v10)
      {
        uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self _document];
        uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self lastAddedPosition];
        uint64_t v13 = [v11 offsetFromPosition:v10 toPosition:v12];

        if (v13 >= 2)
        {
          [(_UITextChoiceAccelerationAssistant *)self removeAllUnderlinesAnimated:1];
          [(_UITextChoiceAccelerationAssistant *)self setLastAddedPosition:v14];
        }
      }
      [(_UITextChoiceAccelerationAssistant *)self refreshExistingUnderlines];
    }
  }
}

- (void)clearUnderlineForPosition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
    id v6 = [v5 tokenizer];
    uint64_t v7 = [v6 rangeEnclosingPosition:v14 withGranularity:1 inDirection:1];

    if (+[UIKeyboard usesInputSystemUI] && !v7)
    {
      NSUInteger v8 = [(_UITextChoiceAccelerationAssistant *)self _document];
      id v9 = [v8 tokenizer];
      uint64_t v7 = [v9 positionFromPosition:v14 toBoundary:1 inDirection:1];

      if (v7)
      {
        uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
        uint64_t v11 = [v10 tokenizer];
        uint64_t v12 = [v11 positionFromPosition:v7 toBoundary:1 inDirection:1];

        if (v12)
        {
          uint64_t v13 = [(_UITextChoiceAccelerationAssistant *)self _document];
          uint64_t v7 = [v13 textRangeFromPosition:v12 toPosition:v14];

          goto LABEL_7;
        }
        uint64_t v7 = 0;
      }
LABEL_10:

      id v4 = v14;
      goto LABEL_11;
    }
LABEL_7:
    if (v7) {
      [(_UITextChoiceAccelerationAssistant *)self clearUnderlinesInRange:v7 animated:1];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)clearUnderlinesInRange:(id)a3 animated:(BOOL)a4
{
  BOOL v27 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    uint64_t v7 = (void *)[v6 copy];

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v29 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self _document];
          uint64_t v13 = [v5 start];
          id v14 = [v11 end];
          uint64_t v15 = [v12 comparePosition:v13 toPosition:v14];

          uint64_t v16 = [(_UITextChoiceAccelerationAssistant *)self _document];
          uint64_t v17 = [v5 end];
          uint64_t v18 = [v11 start];
          uint64_t v19 = [v16 comparePosition:v17 toPosition:v18];

          if (v15 != 1 && v19 != -1)
          {
            id v21 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
            v22 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v11];
            uint64_t v23 = [v21 objectForKey:v22];

            if (v23)
            {
              uint64_t v24 = [v23 underlines];
              [v26 addObjectsFromArray:v24];
            }
            [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v11 animated:v27];
          }
          ++v10;
        }
        while (v9 != v10);
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    uint64_t v25 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
    [v25 removeUnderlines:v26 animated:v27];
  }
}

- (void)adjustRangesAfterPosition:(id)a3 byOffset:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 || !a4)
  {
    [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
    goto LABEL_21;
  }
  int64_t v38 = a4;
  uint64_t v7 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  uint64_t v8 = (void *)[v7 copy];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v42;
  uint64_t v36 = *(void *)v42;
  id v37 = v6;
  do
  {
    uint64_t v12 = 0;
    uint64_t v40 = v10;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      id v14 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v15 = [v13 start];
      uint64_t v16 = [v14 comparePosition:v15 toPosition:v6];

      if (v16 != -1)
      {
        uint64_t v17 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v13];
        uint64_t v18 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
        uint64_t v19 = [v18 objectForKey:v17];

        if (v19)
        {
          uint64_t v20 = [(_UITextChoiceAccelerationAssistant *)self _document];
          id v21 = [v13 start];
          v22 = [v20 positionFromPosition:v21 offset:v38];

          uint64_t v23 = [(_UITextChoiceAccelerationAssistant *)self _document];
          uint64_t v24 = [v13 end];
          uint64_t v25 = [v23 positionFromPosition:v24 offset:v38];

          id v26 = [(_UITextChoiceAccelerationAssistant *)self _document];
          BOOL v27 = [v26 textRangeFromPosition:v22 toPosition:v25];

          id v28 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
          [v28 removeObjectForKey:v17];

          uint64_t v29 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
          long long v30 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v27];
          [v29 setObject:v19 forKey:v30];

          long long v31 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
          uint64_t v32 = [v31 indexOfObject:v13];

          if (v32 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v33 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
            [v33 replaceObjectAtIndex:v32 withObject:v27];
          }
          uint64_t v11 = v36;
          id v6 = v37;
LABEL_15:

          uint64_t v10 = v40;
        }
        else
        {
          long long v34 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
          uint64_t v35 = [v34 indexOfObject:v13];

          if (v35 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
            [v22 removeObjectAtIndex:v35];
            goto LABEL_15;
          }
        }
      }
      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v10);
LABEL_19:

  [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
LABEL_21:
}

- (BOOL)positionIsAtDocumentStart:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
  id v6 = [v5 beginningOfDocument];

  BOOL v7 = 0;
  if (v4 && v6)
  {
    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self _document];
    BOOL v7 = [v8 comparePosition:v4 toPosition:v6] == 0;
  }
  return v7;
}

- (id)underlineRectForTextSelectionRect:(id)a3 forCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 rect];
  if (v8 == 0.0
    || ([(_UITextChoiceAccelerationAssistant *)self convertedSelectionRect:v6],
        double x = v26.origin.x,
        double y = v26.origin.y,
        double width = v26.size.width,
        double height = v26.size.height,
        CGRectEqualToRect(v26, *MEMORY[0x1E4F1DB20])))
  {
    uint64_t v13 = 0;
  }
  else
  {
    [v6 baselineOffset];
    if (v15 == 0.0) {
      double v16 = height * 0.75;
    }
    else {
      double v16 = v15;
    }
    if (v6)
    {
      [v6 transform];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
    }
    uint64_t v13 = +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v22, x, y, width, height, v16);
    uint64_t v17 = [(_UITextChoiceAccelerationAssistant *)self defaultUnderlineColor];
    if (v7)
    {
      if (TIGetShowCandidateConfidenceValue_onceToken[0] != -1) {
        dispatch_once(TIGetShowCandidateConfidenceValue_onceToken, &__block_literal_global_966);
      }
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4FAE3D8], "sharedPreferencesController", v22, v23, v24);
      uint64_t v19 = [v18 valueForPreferenceKey:@"ShowCandidateConfidence"];

      LODWORD(v18) = [v19 BOOLValue];
      if (v18)
      {
        switch([v7 confidence])
        {
          case 0u:
            uint64_t v20 = +[UIColor systemGreenColor];
            goto LABEL_22;
          case 1u:
            uint64_t v20 = +[UIColor systemYellowColor];
            goto LABEL_22;
          case 2u:
            uint64_t v20 = +[UIColor systemRedColor];
            goto LABEL_22;
          case 3u:
            uint64_t v20 = +[UIColor systemGrayColor];
LABEL_22:
            id v21 = (void *)v20;

            uint64_t v17 = v21;
            break;
          default:
            break;
        }
      }
    }
    objc_msgSend(v13, "setUnderlineColor:", v17, v22, v23, v24);
  }
  return v13;
}

- (CGRect)convertedSelectionRect:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
  if (v5
    || ([(_UITextChoiceAccelerationAssistant *)self activateUnderlineViewIfNeeded],
        [(_UITextChoiceAccelerationAssistant *)self _underlineView],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 rect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(_UITextChoiceAccelerationAssistant *)self _document];
    double v15 = [v14 textInputView];
    objc_msgSend(v5, "convertRect:fromView:", v15, v7, v9, v11, v13);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB20];
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (id)defaultUnderlineColor
{
  v3 = +[UIKeyboard currentDocumentState];
  id v4 = [v3 autocorrectTextBackgroundColor];

  if (v4)
  {
    id v5 = [v3 insertionPointColor];
    double v6 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v5 cgColor]);

    goto LABEL_9;
  }
  double v7 = [(_UITextChoiceAccelerationAssistant *)self _document];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(_UITextChoiceAccelerationAssistant *)self _document];
    uint64_t v10 = [v9 insertionPointColor];
    goto LABEL_7;
  }
  double v11 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

  if (v11)
  {
    double v9 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
    uint64_t v10 = [v9 tintColor];
LABEL_7:
    double v6 = (void *)v10;

    if (v6) {
      goto LABEL_9;
    }
  }
  double v6 = +[UIColor insertionPointColor];
LABEL_9:
  uint64_t v21 = 0;
  double v19 = 0.0;
  double v20 = 0.0;
  if ([v6 getHue:&v21 saturation:&v20 brightness:&v19 alpha:0])
  {
    double v12 = v19 * (v20 * -0.5 + 1.0);
    double v13 = 0.0;
    if (v12 != 0.0 && v12 != 1.0) {
      double v13 = (v19 - v12) / fmin(v12, 1.0 - v12) * 1.2;
    }
    double v20 = fmin(v13, 1.0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59___UITextChoiceAccelerationAssistant_defaultUnderlineColor__block_invoke;
    v18[3] = &__block_descriptor_48_e36___UIColor_16__0__UITraitCollection_8l;
    v18[4] = v21;
    *(double *)&v18[5] = v20;
    uint64_t v15 = +[UIColor colorWithDynamicProvider:v18];
  }
  else
  {
    uint64_t v15 = [v6 colorWithAlphaComponent:0.4];
  }
  double v16 = (void *)v15;

  return v16;
}

- (void)updateSelectionHighlights
{
  p_interactionAssistant = &self->_interactionAssistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);

  if (WeakRetained)
  {
    id v5 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
    id obj = [v5 obtainSelectionGrabberSuppressionAssertion];

    id v6 = objc_loadWeakRetained((id *)p_interactionAssistant);
    [v6 setGrabberSuppressionAssertion:obj];

    objc_storeWeak((id *)&self->_grabberSuppressionAssertion, obj);
    id v7 = objc_loadWeakRetained((id *)p_interactionAssistant);
    [v7 setNeedsSelectionDisplayUpdate];
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)&self->_textInputResponder);

    if (!v8) {
      return;
    }
    id obj = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
    double v9 = [obj _obtainGrabberSuppressionAssertion];
    textChoiceInteractionGrabberSuppressionAssertion = self->_textChoiceInteractionGrabberSuppressionAssertion;
    self->_textChoiceInteractionGrabberSuppressionAssertion = v9;

    [obj setNeedsSelectionUpdate];
    [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
  }
}

- (void)releaseSelectionGrabberAssertion
{
  p_grabberSuppressionAssertion = &self->_grabberSuppressionAssertion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
  [WeakRetained _invalidate];

  objc_storeWeak((id *)p_grabberSuppressionAssertion, 0);
  [(_UIAssertion *)self->_textChoiceInteractionGrabberSuppressionAssertion _invalidate];
  textChoiceInteractionGrabberSuppressionAssertion = self->_textChoiceInteractionGrabberSuppressionAssertion;
  self->_textChoiceInteractionGrabberSuppressionAssertion = 0;
}

- (id)textHighlightColor
{
  v3 = +[UIKeyboard currentDocumentState];
  id v4 = [v3 autocorrectTextBackgroundColor];

  if (v4)
  {
    id v5 = [v3 autocorrectTextBackgroundColor];
    uint64_t v6 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v5 cgColor]);
LABEL_5:
    double v9 = (void *)v6;
LABEL_6:

    goto LABEL_7;
  }
  id v7 = [(_UITextChoiceAccelerationAssistant *)self _document];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v5 = [(_UITextChoiceAccelerationAssistant *)self _document];
    uint64_t v6 = [v5 selectionHighlightColor];
    goto LABEL_5;
  }
  double v11 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

  if (v11)
  {
    double v12 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
    double v13 = [v12 traitCollection];
    double v14 = dbl_186B94D20[[v13 userInterfaceStyle] == 2];

    id v5 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
    uint64_t v15 = [v5 tintColor];
    double v9 = [v15 colorWithAlphaComponent:v14];

    goto LABEL_6;
  }
  double v9 = +[UIColor selectionHighlightColor];
LABEL_7:

  return v9;
}

- (BOOL)promptIsVisible
{
  v3 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  id v4 = [v3 superview];
  if (v4)
  {
    id v5 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    [v5 alpha];
    BOOL v7 = v6 > 0.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)autocorrectInlinePromptIsVisible
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self showingAutocorrectInlinePrompt];
  if (v3)
  {
    LOBYTE(v3) = [(_UITextChoiceAccelerationAssistant *)self promptIsVisible];
  }
  return v3;
}

- (BOOL)showingPrompt
{
  if ([(_UITextChoiceAccelerationAssistant *)self showingAutocorrectInlinePrompt]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
  BOOL v3 = WeakRetained
    || self->_textChoiceInteractionGrabberSuppressionAssertion
    || [(_UITextChoiceAccelerationAssistant *)self promptIsVisible];

  return v3;
}

- (BOOL)showingPromptsIncludingDictationChoices
{
  if ([(_UITextChoiceAccelerationAssistant *)self showingAutocorrectInlinePrompt]
    || [(_UITextChoiceAccelerationAssistant *)self promptIsVisible])
  {
    return 1;
  }
  id v4 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (id)currentKeyboardSceneDelegate
{
  v2 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  BOOL v3 = [v2 inputOverlayContainer];
  id v4 = [v3 keyboardSceneDelegate];

  if (!v4)
  {
    id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  }
  return v4;
}

- (id)parentViewForPrompt
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self currentKeyboardSceneDelegate];
  id v4 = [v3 containerWindow];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    BOOL v7 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    id v6 = [v7 inputOverlayContainer];
  }
  return v6;
}

- (void)updateActivePromptForCandidate:(id)a3 displayRects:(id)a4 highlightOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self parentViewForPrompt];
  if (!v10)
  {
LABEL_14:
    [(_UITextChoiceAccelerationAssistant *)self setKeepPromptActive:0];
    goto LABEL_19;
  }
  BOOL v11 = [(_UITextChoiceAccelerationAssistant *)self keepPromptActive];
  double v12 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  double v13 = [v12 superview];

  BOOL v14 = v13 == v10 && v11;
  uint64_t v15 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  double v16 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  [v10 _convertVisualAltitude:v16 toView:0.0];
  objc_msgSend(v15, "_setVisualAltitude:");

  if (![v9 count])
  {
    BOOL v23 = [(_UITextChoiceAccelerationAssistant *)self keepPromptActive];
    if (!v9 && !v8 && v23)
    {
      double v24 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      [v24 hideForNow];

      [(_UITextChoiceAccelerationAssistant *)self removePassthroughContainer];
    }
    goto LABEL_14;
  }
  [(_UITextChoiceAccelerationAssistant *)self setKeepPromptActive:1];
  double v17 = [v9 firstObject];
  if (v5)
  {
    if (!v14)
    {
      double v18 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      [v18 showChoices:0];
    }
    double v19 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    double v20 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    uint64_t v21 = [v20 inputOverlayContainer];
    double v22 = [(_UITextChoiceAccelerationAssistant *)self textHighlightColor];
    [v19 updateTextBoxHighlightForRect:v17 inTextView:v21 parentView:v10 highlightColor:v22];
  }
  else
  {
    if (!v14)
    {
      double v25 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      [v25 updateButtonForType:1];

      double v26 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      v32[0] = v8;
      double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      id v28 = _candidatesChoicesFromTextChoices(v27, 0);
      uint64_t v29 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      long long v30 = [v29 inputOverlayContainer];
      [v26 updateWithChoices:v28 fromParentView:v10 referenceTextView:v30 presentedFromRect:v17 textHighlightColor:0];

      long long v31 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      [v31 updateButtonName:@"xmark" placement:1 originalText:v8];
    }
    double v19 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    double v20 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    uint64_t v21 = [v20 inputOverlayContainer];
    double v22 = [(_UITextChoiceAccelerationAssistant *)self textHighlightColor];
    [v19 updateForSingleWord:v8 textAnchorRect:v17 inTextView:v21 parentView:v10 highlightColor:v22];
  }

  [(_UITextChoiceAccelerationAssistant *)self setupPassthroughContainer];
LABEL_19:
}

- (void)setupPassthroughContainer
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self passthroughContainer];

  if (!v3)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
    BOOL v5 = [v4 _window];
    id v6 = [v5 windowScene];
    id v9 = [v6 keyWindow];

    if (v9)
    {
      BOOL v7 = [_UITextChoiceAccelerationPassthroughView alloc];
      [v9 bounds];
      id v8 = -[_UITextChoiceAccelerationPassthroughView initWithFrame:delegate:](v7, "initWithFrame:delegate:", self);
      [(UIView *)v8 setAutoresizingMask:18];
      [v9 addSubview:v8];
      [(_UITextChoiceAccelerationAssistant *)self setPassthroughContainer:v8];
    }
  }
}

- (void)removePassthroughContainer
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self passthroughContainer];

  if (v3)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self passthroughContainer];
    [v4 removeFromSuperview];

    [(_UITextChoiceAccelerationAssistant *)self setPassthroughContainer:0];
  }
}

- (void)didRecognizeDismissal
{
  if ([(_UITextChoiceAccelerationAssistant *)self keepPromptActive])
  {
    BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    [v3 acceptAutocorrectionWithCompletionHandler:0];
  }
  else
  {
    if (![(_UITextChoiceAccelerationAssistant *)self dismissIfPresented]) {
      goto LABEL_7;
    }
    BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
    if (v3) {
      [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v3 animated:0];
    }
  }

LABEL_7:
  [(_UITextChoiceAccelerationAssistant *)self resetDictationChoices];
}

- (BOOL)showPromptForReplacementCandidate:(id)a3
{
  return [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:a3 delay:0.0];
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4
{
  return [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:a3 originalCandidate:0 delay:a4];
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 originalCandidate:(id)a4 delay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  [(_UITextChoiceAccelerationAssistant *)self updateSelectionHighlights];
  [(_UITextChoiceAccelerationAssistant *)self setKeepPromptActive:0];
  uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self parentViewForPrompt];
  if (!v10)
  {
    BOOL v30 = 0;
    goto LABEL_38;
  }
  BOOL v11 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  double v12 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  [v10 _convertVisualAltitude:v12 toView:0.0];
  objc_msgSend(v11, "_setVisualAltitude:");

  double v13 = [v8 rangeInDocument];
  BOOL v14 = [v8 underlines];
  if (+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v15 = [v8 documentTextToReplace];
    double v16 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForInput:v15];

    if (![v16 count])
    {
      double v17 = [(_UITextChoiceAccelerationAssistant *)self _document];
      double v18 = [v17 textInRange:v13];

      if (v18 && [v18 length])
      {
        uint64_t v19 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForInput:v18];

        double v16 = (void *)v19;
      }
    }
    BOOL v14 = v16;
  }
  if (!v14 || ![v14 count])
  {
    double v20 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];

    if (v20)
    {
      uint64_t v21 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
      double v22 = [v21 activeSelectionController];
      BOOL v23 = [v22 selection];
      uint64_t v24 = [v23 underlineRectsForRange:v13];

      BOOL v14 = (void *)v24;
    }
  }
  if ([(_UITextChoiceAccelerationAssistant *)self usingCustomInteraction])
  {
    double v25 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v25)
    {
      double v26 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      uint64_t v27 = [v26 selectionRectsForRange:v13];

      BOOL v14 = (void *)v27;
    }
  }
  if (!v14 || ![v14 count])
  {
    id v28 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    uint64_t v29 = [v28 asyncInputDelegate];
    if (v29)
    {
    }
    else
    {
      long long v31 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      uint64_t v32 = [v31 webInputDelegate];

      if (!v32)
      {
        uint64_t v35 = [(_UITextChoiceAccelerationAssistant *)self delegate];
        uint64_t v36 = [v35 asyncWebKitInteractionDelegate];
        uint64_t v38 = [v36 webSelectionRects];
        goto LABEL_25;
      }
    }
    long long v33 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    long long v34 = [v33 inputDelegateManager];
    uint64_t v35 = [v34 selectedTextRange];

    if (!v35)
    {
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v36 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    id v37 = [v36 inputDelegateManager];
    uint64_t v38 = [v37 selectionRectsForRange:v35];

    BOOL v14 = v37;
LABEL_25:

    BOOL v14 = (void *)v38;
    goto LABEL_26;
  }
LABEL_27:
  if ([v14 count]
    && ([v14 firstObject], (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v40 = (void *)v39;
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    id v49 = __96___UITextChoiceAccelerationAssistant_showPromptForReplacementCandidate_originalCandidate_delay___block_invoke;
    id v50 = &unk_1E52EECB8;
    id v51 = v8;
    id v52 = v9;
    uint64_t v53 = self;
    id v41 = v13;
    id v54 = v41;
    id v55 = v10;
    id v42 = v40;
    id v56 = v42;
    long long v43 = (void (**)(void *, void))_Block_copy(&v47);
    [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];
    if (a5 <= 0.0)
    {
      v43[2](v43, 0);
    }
    else
    {
      long long v44 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v43 block:a5];
      [(_UITextChoiceAccelerationAssistant *)self setPromptDisplayTimer:v44];
    }
    if (+[UIKeyboard usesInputSystemUI]
      || [(_UITextChoiceAccelerationAssistant *)self usingCustomInteraction])
    {
      [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v41];
    }
    double v45 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
    BOOL v30 = 1;
    [v45 removeUnderlines:v14 animated:1];
  }
  else
  {
    BOOL v30 = 0;
  }

LABEL_38:
  return v30;
}

- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4
{
  return [(_UITextChoiceAccelerationAssistant *)self showChoicesForAutocorrectionCandidate:a3 range:a4 delay:0.0];
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 length])
    {
      uint64_t v8 = [v6 length];
      id v9 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v10 = [v9 positionFromPosition:v7 offset:-v8];

      if (v10)
      {
        BOOL v11 = [(_UITextChoiceAccelerationAssistant *)self _document];
        double v12 = [v11 textRangeFromPosition:v10 toPosition:v7];

        if (v12)
        {
          double v13 = [(_UITextChoiceAccelerationAssistant *)self _document];
          BOOL v14 = [v13 textInRange:v12];

          if ([v14 isEqualToString:v6]) {
            id v15 = v12;
          }
          else {
            id v15 = 0;
          }
        }
        else
        {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
      id v15 = [v10 textRangeFromPosition:v7 toPosition:v7];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4 delay:(double)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v9 = (TIKeyboardCandidate *)a3;
  id v10 = a4;
  p_candidate = &self->_candidate;
  if (self->_candidate == v9)
  {
    double v13 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    BOOL v14 = [v13 candidate];
    if (v14 == v9)
    {
      id v15 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      double v16 = [v15 superview];
      BOOL v12 = v16 != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  double v17 = [(TIKeyboardCandidate *)v9 candidate];

  if (!v17 || v12)
  {
    [(_UITextChoiceAccelerationAssistant *)self dismissWithoutSelection];
LABEL_25:
    BOOL v32 = 0;
    goto LABEL_26;
  }
  if ([v10 isEmpty])
  {
    double v18 = [v10 start];
    uint64_t v19 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v18];

    if (v19 && ([v19 isEmpty] & 1) == 0)
    {
      double v22 = v10;
      id v10 = v19;
    }
    else
    {
      double v20 = [(TIKeyboardCandidate *)v9 candidate];
      uint64_t v21 = [v10 start];
      double v22 = [(_UITextChoiceAccelerationAssistant *)self _rangeOfText:v20 endingAtPosition:v21];

      if (v22)
      {
        id v23 = v22;

        id v10 = v23;
      }
      else if (!v10)
      {
        goto LABEL_18;
      }
      if ([v10 isEmpty])
      {
LABEL_18:
        uint64_t v24 = v10;
        double v25 = v9;
        v82 = self;
        double v26 = [(_UITextChoiceAccelerationAssistant *)self _document];
        uint64_t v27 = [v26 tokenizer];
        id v28 = v24;
        uint64_t v29 = [v24 start];
        BOOL v30 = [v27 rangeEnclosingPosition:v29 withGranularity:1 inDirection:1];

        if (v30 && ([v30 isEmpty] & 1) == 0)
        {
          id v31 = v30;

          id v28 = v31;
        }
        id v9 = v25;

        id v10 = v28;
        self = v82;
      }
    }
  }
  if (!v10 || ([v10 isEmpty] & 1) != 0) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)p_candidate, a3);
  if (+[UIKeyboard usesInputSystemUI])
  {
    [(_UITextChoiceAccelerationAssistant *)self updateSelectionHighlights];
    long long v34 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    [v34 presentTextChoicePromptForRange:v10];

    uint64_t v35 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    uint64_t v36 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v10];
    id v37 = [v35 objectForKey:v36];

    if (v37)
    {
      [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v10];
      uint64_t v38 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
      uint64_t v39 = [v37 underlines];
      [v38 removeUnderlines:v39 animated:1];
    }
    [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];

    BOOL v32 = 1;
    goto LABEL_26;
  }
  uint64_t v40 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  [v40 setCandidate:v9];

  id v41 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  id v42 = [v41 keyboardState];
  long long v43 = [v42 secureCandidateRenderTraits];
  [v43 singleCellHeight];
  double v45 = v44;
  uint64_t v46 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  [v46 setSecureCandidateHeight:v45];

  uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v48 = [(TIKeyboardCandidate *)v9 candidate];
  id v49 = [(_UITextChoiceAccelerationAssistant *)self listForFinalString:v48];

  id v50 = [(_UITextChoiceAccelerationAssistant *)self alternateCorrectionsForList:v49];
  id v51 = [(TIKeyboardCandidate *)v9 input];
  uint64_t v52 = [v51 length];

  if (v52)
  {
    uint64_t v53 = [(_UITextChoiceAccelerationAssistant *)self _document];
    id v54 = [v53 textInRange:v10];

    id v55 = [(TIKeyboardCandidate *)v9 input];
    int v56 = [v55 isEqualToString:v54];

    if (v56)
    {
      v57 = [(TIKeyboardCandidate *)v9 candidate];
      char v58 = [v57 isEqualToString:v54];

      if (v58)
      {
        int v84 = 0;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v59 = [(TIKeyboardCandidate *)v9 candidate];
    }
    else
    {
      uint64_t v59 = [(TIKeyboardCandidate *)v9 input];
    }
    uint64_t v60 = (void *)v59;
    [v47 addObject:v59];

    int v84 = 1;
    goto LABEL_39;
  }
  int v84 = 0;
LABEL_40:
  v81 = v49;
  if ([v50 count])
  {
    v83 = self;
    uint64_t v80 = v9;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v79 = v50;
    id v61 = v50;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v85 objects:v90 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = 0;
      uint64_t v65 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v86 != v65) {
            objc_enumerationMutation(v61);
          }
          v67 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          if ([v67 isAlternativeInput])
          {
            v68 = [v67 candidate];
            v89 = v68;
            LOBYTE(v84) = 1;
            uint64_t v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];

            uint64_t v64 = (void *)v69;
          }
          long long v70 = [v67 candidate];
          [v47 addObject:v70];
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v85 objects:v90 count:16];
      }
      while (v63);
    }
    else
    {
      uint64_t v64 = 0;
    }

    self = v83;
    int v84 = v84 & ((unint64_t)[v47 count] < 2);
    id v9 = v80;
    id v49 = v81;
    id v50 = v79;
  }
  else
  {
    uint64_t v64 = 0;
  }
  long long v71 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  long long v72 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v10];
  long long v73 = [v71 objectForKey:v72];

  if (!v73)
  {
    long long v74 = [(TIKeyboardCandidate *)v9 candidate];
    [(TIKeyboardCandidate *)v9 input];
    v76 = long long v75 = v50;
    long long v73 = +[_UIReplacementCandidate candidateForDocumentText:v74 revertText:v76 textChoices:0 range:v10 underlineStyle:1 promptStyle:0 promptButton:2];

    id v50 = v75;
    id v49 = v81;
  }
  if ([v47 count]) {
    uint64_t v77 = 1;
  }
  else {
    uint64_t v77 = 2;
  }
  [v73 setPreferredPromptStyle:v77];
  if (v84) {
    uint64_t v78 = 2;
  }
  else {
    uint64_t v78 = 0;
  }
  [v73 setPreferredPromptButton:v78];
  if (v73 && [v47 count]) {
    [v73 setTextChoices:v47];
  }
  [v73 setAlternativeRevertTexts:v64];
  BOOL v32 = [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v73 delay:a5];

LABEL_26:
  return v32;
}

- (void)clearSecureCandidateHashes
{
  secureCandidateHashes = self->_secureCandidateHashes;
  self->_secureCandidateHashes = 0;
}

- (BOOL)showChoicesForCandidates:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 firstObject];
  IsSmartRepldouble y = _candidateSourceIsSmartReply(v5);
  id v54 = self;
  id v55 = v5;
  if (IsSmartReply) {
    goto LABEL_2;
  }
  if ([v5 slotID])
  {
    BOOL v7 = 0;
    int v60 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      int v60 = 0;
      BOOL v7 = 0;
      goto LABEL_7;
    }
    int v60 = 0;
    BOOL v7 = [v5 customInfoType] != 32;
  }
LABEL_7:
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
  int v56 = IsSmartReply;
  char v58 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ((!IsSmartReply || (_candidateSourceIsSmartReply(*(void **)(*((void *)&v61 + 1) + 8 * i)) & 1) == 0)
          && (!v60 || ![v13 slotID]))
        {
          if (!v7) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v13 customInfoType] == 32) {
            continue;
          }
        }
        [v59 addObject:v13];
        BOOL v14 = NSNumber;
        id v15 = v13;
        if (objc_opt_respondsToSelector())
        {
          double v16 = (void *)MEMORY[0x1E4F1CA18];
          double v17 = [v15 methodSignatureForSelector:sel_secureCandidateHash];
          double v18 = [v16 invocationWithMethodSignature:v17];

          [v18 setSelector:sel_secureCandidateHash];
          [v18 setTarget:v15];
          [v18 invoke];
          *(void *)buf = 0;
          [v18 getReturnValue:buf];
          uint64_t v19 = *(void *)buf;

          IsSmartRepldouble y = v56;
        }
        else
        {
          uint64_t v19 = 0;
        }

        double v20 = [v14 numberWithUnsignedInteger:v19];
        uint64_t v8 = v58;
        [v58 addObject:v20];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v10);
  }

  if ([v59 count] && !-[NSArray isEqualToArray:](v54->_secureCandidateHashes, "isEqualToArray:", v8))
  {
    objc_storeStrong((id *)&v54->_secureCandidateHashes, v8);
    double v22 = [obj firstObject];
    uint64_t v23 = [v22 input];
    uint64_t v24 = (void *)v23;
    if (v23) {
      double v25 = (__CFString *)v23;
    }
    else {
      double v25 = &stru_1ED0E84C0;
    }
    double v26 = v25;

    uint64_t v27 = [(_UITextChoiceAccelerationAssistant *)v54 interactionAssistant];
    id v28 = [v27 activeSelection];
    uint64_t v29 = [v28 selectedRange];

    BOOL v30 = +[_UIReplacementCandidate candidateForDocumentText:revertText:candidateChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:candidateChoices:range:underlineStyle:promptStyle:promptButton:", v26, &stru_1ED0E84C0, v59, v29, 0, 2, (unint64_t)[v59 count] < 2);

    id v31 = [(_UITextChoiceAccelerationAssistant *)v54 interactionAssistant];
    BOOL v32 = [v31 activeSelection];
    [v32 caretRect];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
    long long v66 = v41;
    long long v67 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v42 = +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", buf, v34, v36, v38, v40, 0.0);
    v68 = v42;
    long long v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    [v30 setUnderlines:v43];

    double v44 = [(_UITextChoiceAccelerationAssistant *)v54 prompt];
    [v44 setReplacement:v30];

    double v45 = [(_UITextChoiceAccelerationAssistant *)v54 delegate];
    uint64_t v46 = [v45 keyboardState];
    uint64_t v47 = [v46 secureCandidateRenderTraits];
    [v47 singleCellHeight];
    double v49 = v48;
    id v50 = [(_UITextChoiceAccelerationAssistant *)v54 prompt];
    [v50 setSecureCandidateHeight:v49];

    id v51 = _UIKeyboardSmartReplyLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = @"text suggestion";
      if (v60) {
        uint64_t v52 = @"secure";
      }
      if (v56) {
        uint64_t v52 = @"smart reply";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v52;
      _os_log_impl(&dword_1853B0000, v51, OS_LOG_TYPE_DEFAULT, "Text choice assistant is showing prompt for %@ candidates", buf, 0xCu);
    }

    BOOL v21 = [(_UITextChoiceAccelerationAssistant *)v54 showPromptForReplacementCandidate:v30];
    uint64_t v8 = v58;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)updatePromptLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  id v6 = [v5 window];
  BOOL v7 = [v6 windowScene];
  uint64_t v8 = [v4 object];

  if (v7 == v8)
  {
    id v10 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    uint64_t v9 = [v10 replacement];
    [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v9];
  }
}

- (BOOL)showChoicesForTextInRange:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  id v6 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v4];

  BOOL v7 = [v5 objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    [v8 setCandidate:0];

    uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    [v9 setReplacement:v7];

    id v10 = [v7 textChoices];

    if (!v10)
    {
      uint64_t v11 = [v7 revertText];
      v15[0] = v11;
      BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v7 setTextChoices:v12];
    }
    BOOL v13 = [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v7];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)showDictationChoicesForTextInRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
  id v6 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v4];

  BOOL v7 = [v5 objectForKey:v6];

  if (v7) {
    BOOL v8 = [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)showChoicesForTextInRange:(id)a3 withReplacements:(id)a4 delay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 firstObject];
  uint64_t v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 originalText];
    BOOL v13 = [v11 replacementText];
    BOOL v14 = +[_UIReplacementCandidate candidateForDocumentText:v12 revertText:v13 textChoices:0 range:v8 underlineStyle:0 promptStyle:1 promptButton:2];

    if ((unint64_t)[v9 count] >= 2)
    {
      id v15 = [MEMORY[0x1E4F1CA48] array];
      double v16 = [v11 replacementText];

      if (v16)
      {
        double v17 = [v11 replacementText];
        [v15 addObject:v17];
      }
      if ((unint64_t)[v9 count] >= 2)
      {
        unint64_t v18 = 1;
        do
        {
          uint64_t v19 = [v9 objectAtIndex:v18];
          double v20 = [v19 replacementText];

          if (v20)
          {
            BOOL v21 = [v19 replacementText];
            [v15 addObject:v21];
          }
          ++v18;
        }
        while (v18 < [v9 count]);
      }
      [v14 setTextChoices:v15];
      [v14 setPreferredPromptButton:0];
      [v14 setPreferredPromptStyle:2];
    }
    BOOL v22 = [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v14 delay:a5];
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)showAutocorrectReplacementChoicesIfNeeded:(id)a3 forRange:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[UITextReplacementGeneratorForCorrections generatorForTextInput:a3 range:v6 options:32];
  id v8 = v7;
  if (!v7) {
    goto LABEL_12;
  }
  if (([v7 isStringToReplaceMisspelled] & 1) == 0) {
    [v8 forceAutocorrectionGuesses];
  }
  uint64_t v9 = [v8 autocorrectionRecord];
  if (v9 && (v10 = (void *)v9, int v11 = [v8 forceAutocorrectionGuesses], v10, v11))
  {
    BOOL v12 = [v8 autocorrectionRecord];
    BOOL v13 = [(_UITextChoiceAccelerationAssistant *)self showChoicesForAutocorrectionCandidate:v12 range:v6 delay:0.2];
  }
  else
  {
    if (![v8 forceAutocorrectionGuesses])
    {
LABEL_11:
      [(_UITextChoiceAccelerationAssistant *)self dismissWithoutSelection];
LABEL_12:
      BOOL v15 = 0;
      goto LABEL_13;
    }
    BOOL v12 = [v8 replacements];
    BOOL v13 = [(_UITextChoiceAccelerationAssistant *)self showChoicesForTextInRange:v6 withReplacements:v12 delay:0.2];
  }
  BOOL v14 = v13;

  if (!v14) {
    goto LABEL_11;
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (void)updatePrompt:(id)a3 forReplacementCandidate:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 preferredPromptButton];
    id v8 = @"arrow.uturn.backward";
    uint64_t v9 = 1;
    switch(v7)
    {
      case 0:
        uint64_t v9 = 0;
        id v8 = &stru_1ED0E84C0;
        break;
      case 1:
        goto LABEL_6;
      case 3:
        uint64_t v7 = 2;
LABEL_6:
        id v8 = @"xmark";
        uint64_t v9 = v7;
        break;
      case 4:
        uint64_t v9 = 2;
        break;
      case 5:
        if ([v11 labelNumber])
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu.circle.fill", objc_msgSend(v11, "labelNumber"));
          id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v8 = &stru_1ED0E84C0;
        }
        uint64_t v9 = 3;
        break;
      default:
        break;
    }
    objc_msgSend(v11, "updateButtonForType:", objc_msgSend(v6, "preferredPromptButton"));
  }
  else
  {
    id v8 = @"arrow.uturn.backward";
    uint64_t v9 = 1;
  }
  id v10 = [v6 revertText];
  [v11 updateButtonName:v8 placement:v9 originalText:v10];
}

- (id)rangeForTextChoicesAtPosition:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v11 = [v10 start];
          if (v11
            && (BOOL v12 = (void *)v11,
                [v10 end],
                BOOL v13 = objc_claimAutoreleasedReturnValue(),
                v13,
                v12,
                v13))
          {
            BOOL v14 = [(_UITextChoiceAccelerationAssistant *)self _document];
            BOOL v15 = [v10 start];
            uint64_t v16 = [v14 comparePosition:v4 toPosition:v15];

            if (v16 != -1)
            {
              double v17 = [(_UITextChoiceAccelerationAssistant *)self _document];
              unint64_t v18 = [v10 end];
              uint64_t v19 = [v17 comparePosition:v4 toPosition:v18];

              if (v19 != 1)
              {
                id v21 = v10;
                goto LABEL_19;
              }
            }
          }
          else
          {
            double v20 = _UIKeyboardLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v23 = 0;
              _os_log_error_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "And underlined range has no start or no end!", v23, 2u);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
    id v21 = 0;
LABEL_19:
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)updateDictationChoicesFromPromptIndex:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (a3 == -1)
  {
    uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
    uint64_t v12 = [v11 lastObject];
  }
  else
  {
    BOOL v7 = a3 < 1;
    unint64_t v8 = a3 - 1;
    if (v7
      || ([(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          unint64_t v10 = [v9 count],
          v9,
          v8 >= v10))
    {
      BOOL v13 = _UIKeyboardLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_error_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Attempted to update out of bound dictation prompts", v14, 2u);
      }
      goto LABEL_10;
    }
    uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
    uint64_t v12 = [v11 objectAtIndex:v8];
  }
  BOOL v13 = v12;

  if (v13)
  {
    [(_UITextChoiceAccelerationAssistant *)self updateDocumentFromPrompt:v13 completionHandler:v6];
LABEL_10:
  }
}

- (void)updateDocumentFromPrompt:(id)a3 completionHandler:(id)a4
{
  v148[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];
  unint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  [v8 handleTextChoiceBubbleTapped];

  uint64_t v9 = [v6 selectedCandidateChoice];
  if (![v9 slotID])
  {
    unint64_t v10 = [v6 selectedCandidateChoice];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_4;
    }
    uint64_t v16 = [v6 selectedCandidateChoice];
    if (_candidateSourceIsSmartReply(v16))
    {
      double v17 = _UIKeyboardSmartReplyLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Text choice assistant is accepting smart reply candidate", buf, 2u);
      }

      id v18 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      [v18 acceptPredictiveInput:v16];
LABEL_53:

      goto LABEL_5;
    }
    id v18 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
    if (([v18 isEmpty] & 1) == 0)
    {
      uint64_t v19 = v18;
      if (v18)
      {
LABEL_21:
        long long v26 = [(_UITextChoiceAccelerationAssistant *)self _document];
        long long v27 = [v26 textInRange:v19];

        if ([v6 shouldRejectCandidate])
        {
          id v28 = [v6 selectedChoice];
          if ([v28 isEqualToString:@"autocorrection.cancel"])
          {

LABEL_25:
            uint64_t v29 = [(_UITextChoiceAccelerationAssistant *)self delegate];
            [v29 fadeAutocorrectPrompt];

            +[UIKBAnalyticsDispatcher didRevisionBubbleTap];
            goto LABEL_50;
          }
          BOOL v30 = [(_UITextChoiceAccelerationAssistant *)self keepPromptActive];

          if (v30) {
            goto LABEL_25;
          }
        }
        else if ([(_UITextChoiceAccelerationAssistant *)self keepPromptActive])
        {
          goto LABEL_25;
        }
        id v145 = v27;
        if ([v6 promptStyle] == 3)
        {
          id v31 = [v6 replacement];
          BOOL v32 = [v31 rangeInDocument];

          if (v32)
          {
            double v33 = [v6 replacement];
            double v34 = [v33 textChoices];
            double v35 = [v34 objectAtIndexedSubscript:0];
            int v127 = [v35 isEqualToString:0x1ED145080];

            double v36 = [v6 replacement];
            double v37 = [v36 textChoices];
            double v38 = [v37 objectAtIndexedSubscript:0];
            int v138 = [v38 isEqualToString:0x1ED1450A0];

            double v39 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
            double v40 = [(_UITextChoiceAccelerationAssistant *)self _document];
            unint64_t v134 = [v40 _nsrangeForTextRange:v39];
            uint64_t v136 = v41;

            id v42 = [(_UITextChoiceAccelerationAssistant *)self _document];
            long long v43 = [v6 replacement];
            double v44 = [v43 rangeInDocument];
            unint64_t v132 = [v42 _nsrangeForTextRange:v44];
            uint64_t v125 = v45;

            uint64_t v46 = [v6 replacement];
            v142 = [v46 voiceCommandDisambiguationSelectedIndex];

            if (v138)
            {
              uint64_t v47 = [(_UITextChoiceAccelerationAssistant *)self _document];
              double v48 = [v6 replacement];
              double v49 = [v48 rangeInDocument];
              [v47 setSelectedTextRange:v49];
            }
            else if (v127)
            {
              long long v72 = [(_UITextChoiceAccelerationAssistant *)self _document];
              long long v73 = [v6 replacement];
              long long v74 = [v73 rangeInDocument];
              [v72 setSelectedTextRange:v74];

              long long v75 = [(_UITextChoiceAccelerationAssistant *)self _document];
              long long v76 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
              uint64_t v140 = [v75 _nsrangeForTextRange:v76];
              uint64_t v129 = v77;

              uint64_t v78 = [(_UITextChoiceAccelerationAssistant *)self delegate];
              [v78 deleteBackward];

              v79 = [(_UITextChoiceAccelerationAssistant *)self _document];
              uint64_t v80 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
              uint64_t v81 = [v79 _nsrangeForTextRange:v80];

              v82 = [(_UITextChoiceAccelerationAssistant *)self _document];
              LOBYTE(v113) = v134 > v132;
              -[_UITextChoiceAccelerationAssistant restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:](self, "restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:", v82, v134, v136, 0, v140 + v129 - v81, 0, 0, v113);
            }
            else
            {
              v119 = v39;
              v83 = [v6 replacement];
              int v84 = [v83 textChoices];
              uint64_t v85 = [v84 objectAtIndexedSubscript:0];

              v130 = [v6 replacement];
              long long v86 = [v130 rangeInDocument];
              long long v87 = [v6 replacement];
              long long v88 = [v87 documentTextToReplace];
              v141 = (void *)v85;
              uint64_t v89 = +[UITextReplacement replacementWithRange:v86 original:v88 replacement:v85 menuTitle:v85 isDictationCommandReplacement:1];

              v90 = [(_UITextChoiceAccelerationAssistant *)self delegate];
              v117 = (void *)v89;
              [v90 replaceText:v89];

              uint64_t v91 = [v6 replacement];
              v92 = [v91 revertText];

              v93 = [v6 replacement];
              v94 = [v93 textChoices];
              v122 = [v94 firstObject];

              uint64_t v95 = [v141 length];
              v124 = v92;
              uint64_t v96 = v95 - [v92 length];
              v97 = [v6 replacement];
              v98 = [v97 rangeInDocument];

              v99 = [(_UITextChoiceAccelerationAssistant *)self _document];
              v100 = [v98 end];
              v131 = [v99 positionFromPosition:v100 offset:v96];

              v101 = [(_UITextChoiceAccelerationAssistant *)self _document];
              v115 = v98;
              v102 = [v98 start];
              v103 = [v101 textRangeFromPosition:v102 toPosition:v131];

              if (v103)
              {
                v104 = [v6 replacement];
                v105 = [v104 voiceCommandTrackingUUID];

                [(_UITextChoiceAccelerationAssistant *)self resetDictationChoices];
                v148[0] = v124;
                v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:1];
                [(_UITextChoiceAccelerationAssistant *)self underlineTextInRange:v103 revertText:v124 textChoices:v106 isActiveEditingSession:1];

                v147 = v103;
                v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
                [(_UITextChoiceAccelerationAssistant *)self decorateTextInRanges:v107 replacementText:v122 allowAutomaticReplacement:0 autoHide:1 voiceCommandTrackingUUID:v105 withCompletionHandler:v7];
              }
              v108 = [(_UITextChoiceAccelerationAssistant *)self _document];
              LOBYTE(v113) = v134 > v132;
              -[_UITextChoiceAccelerationAssistant restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:](self, "restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:", v108, v134, v136, v132, v125, 0, [v141 length], v113);

              double v39 = v119;
            }
            long long v27 = v145;
            if (v7) {
              v7[2](v7, v142);
            }
            [(_UITextChoiceAccelerationAssistant *)self resetDictationChoices];

            goto LABEL_50;
          }
          v144 = +[UIDictationController activeInstance];
          uint64_t v65 = [v6 deltaRange];
          uint64_t v126 = v66;
          uint64_t v128 = v65;
          v137 = [v6 replacement];
          v139 = [v137 documentTextToReplace];
          v135 = [v6 replacement];
          v133 = [v135 textChoices];
          v121 = [v133 objectAtIndexedSubscript:0];
          uint64_t v67 = [v6 originalSelectedRange];
          uint64_t v118 = v68;
          uint64_t v120 = v67;
          v123 = [v6 replacement];
          v114 = [v123 voiceCommandDisambiguationSelectedIndex];
          v116 = [v6 replacement];
          uint64_t v69 = [v116 voiceCommandDisambiguationTargetCount];
          uint64_t v70 = [v6 replacement];
          long long v71 = [v70 voiceCommandTrackingUUID];
          objc_msgSend(v144, "performTextReplacementForWebKitWithDeltaRange:targetText:replacementText:originalSelectedRange:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:voiceCommandUUID:completionHandler:", v128, v126, v139, v121, v120, v118, v114, v69, v71, v7);

          [(_UITextChoiceAccelerationAssistant *)self resetDictationChoices];
        }
        else
        {
          id v50 = [v6 candidate];
          id v51 = [v50 candidate];

          v143 = v51;
          if ([v51 length])
          {
            uint64_t v52 = [v18 end];
            uint64_t v53 = [(_UITextChoiceAccelerationAssistant *)self _rangeOfText:v51 endingAtPosition:v52];

            if (v53 && ([v53 isEmpty] & 1) == 0)
            {
              id v54 = v53;

              id v55 = v51;
              id v145 = v55;
              uint64_t v19 = v54;
            }
          }
          int v56 = [v6 selectedChoice];
          v57 = [v6 selectedChoice];
          char v58 = +[UITextReplacement replacementWithRange:v19 original:v145 replacement:v56 menuTitle:v57];

          [(_UITextChoiceAccelerationAssistant *)self informAnalyticsOfUpcomingCandidateReplacement];
          uint64_t v59 = [(_UITextChoiceAccelerationAssistant *)self delegate];
          [v59 replaceText:v58];

          if ([v6 shouldRejectCandidate])
          {
            int v60 = [(_UITextChoiceAccelerationAssistant *)self delegate];
            long long v61 = [v6 candidate];
            [v60 rejectAutocorrection:v61];
          }
          [(_UITextChoiceAccelerationAssistant *)self informAnalyticsOfCompletedCandidateReplacement];
          long long v62 = +[UIDictationController activeInstance];
          long long v63 = [v6 replacement];
          long long v64 = [v63 voiceCommandTrackingUUID];
          [v62 markDictationUndoEventWithVoiceCommandUUID:v64 viaTapOnRevertBubble:1];
        }
        long long v27 = v145;
LABEL_50:
        [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v19];
        if (!+[UIKeyboard isKeyboardProcess])
        {
          uint64_t v109 = [v27 length];
          v110 = [v6 selectedChoice];
          uint64_t v111 = v109 - [v110 length];

          v112 = [v19 start];
          [(_UITextChoiceAccelerationAssistant *)self adjustRangesAfterPosition:v112 byOffset:v111];
        }
        goto LABEL_53;
      }
    }
    double v20 = [v18 start];
    id v21 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v20];

    if (!v21)
    {
      BOOL v22 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0)
      {
        id v21 = 0;
        goto LABEL_19;
      }
      long long v24 = [(_UITextChoiceAccelerationAssistant *)self _document];
      long long v25 = [v18 end];
      id v21 = [v24 _rangeOfEnclosingWord:v25];

      if (!v21) {
        goto LABEL_19;
      }
    }
    if (([v21 isEmpty] & 1) == 0)
    {
      id v21 = v21;

      uint64_t v19 = v21;
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    uint64_t v19 = v18;
    goto LABEL_20;
  }

LABEL_4:
  uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  BOOL v13 = [v6 authenticationMessage];
  [v12 _attemptAuthenticationWithMessage:v13];

  BOOL v14 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  BOOL v15 = [v6 selectedCandidateChoice];
  [v14 acceptPredictiveInput:v15];

LABEL_5:
}

- (void)informAnalyticsOfUpcomingCandidateReplacement
{
  +[UIKBAnalyticsDispatcher didRevisionBubbleTap];
  BOOL v3 = +[UIKBAnalyticsDispatcher sharedInstance];
  [v3 setNextCandidateReplacementSource:8];

  id v4 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  uint64_t v5 = [v4 buttonType];

  if (v5 == 1)
  {
    id v6 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    BOOL v7 = @"reversionBubble";
  }
  else
  {
    id v6 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    if (v5) {
      BOOL v7 = @"revisionBubble";
    }
    else {
      BOOL v7 = @"autocorrectionBubble";
    }
  }
  id v8 = v6;
  [v6 acceptingCandidateWithTrigger:v7];
}

- (void)informAnalyticsOfCompletedCandidateReplacement
{
  id v2 = +[UIKBAnalyticsDispatcher sharedInstance];
  [v2 setNextCandidateReplacementSource:0];
}

- (id)activeSelectedRange
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];

  if (v3)
  {
    id v4 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
    uint64_t v5 = [v4 activeSelection];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self interactionAssistant];
      unint64_t v10 = [v9 activeSelectionController];
      id v7 = [v10 selection];
    }
    uint64_t v8 = [v7 selectedRange];
  }
  else
  {
    id v7 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
    uint64_t v8 = [v7 selectedTextRange];
  }
  uint64_t v11 = (void *)v8;

  return v11;
}

- (void)removeWordForRange:(id)a3
{
}

- (void)removeWordForRange:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v6 = [(_UITextChoiceAccelerationAssistant *)self _document];
    id v7 = [v6 textInRange:v27];

    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self candidateForFinalString:v7];
    if (v8)
    {
      uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
      [v9 removeObjectForKey:v7];
    }
  }
  unint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  [v10 removeObject:v27];

  uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v27];
  uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  BOOL v13 = [v12 objectForKey:v11];

  if (v13)
  {
    BOOL v14 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    [v14 removeObjectForKey:v11];

    BOOL v15 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
    [v15 removeObjectForKey:v11];

    uint64_t v16 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
    double v17 = [v13 documentTextToReplace];
    [v16 removeObjectForKey:v17];

    if (!+[UIKeyboard isKeyboardProcess])
    {
      id v18 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
      uint64_t v19 = [v13 underlines];
      [v18 removeUnderlines:v19 animated:v4];

      [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
    }
  }
  uint64_t v20 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
  if (v20)
  {
    id v21 = (void *)v20;
    BOOL v22 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
    uint64_t v23 = [v22 count];

    if (!v23)
    {
      long long v24 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
      long long v25 = [v24 textInputView];
      long long v26 = [(_UITextChoiceAccelerationAssistant *)self textChoiceInteraction];
      [v25 removeInteraction:v26];
    }
  }
}

- (void)removeAllUnderlines
{
}

- (void)removeAllUnderlinesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self _existingUnderlineView];
  [v5 clearAllUnderlinesAnimated:v3];

  id v6 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
  [v6 removeAllObjects];

  id v7 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  [v7 removeAllObjects];

  uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
  [v8 removeAllObjects];

  uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
  [v9 removeAllObjects];

  unint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

  if (v10)
  {
    id v13 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
    uint64_t v11 = [v13 textInputView];
    uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self textChoiceInteraction];
    [v11 removeInteraction:v12];
  }
}

- (void)dismissWithoutSelection
{
  [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];
  [(_UITextChoiceAccelerationAssistant *)self setKeepPromptActive:0];
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    [v3 dismissTextChoicePrompt];
  }
  id v4 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  [v4 removeAnimated:1];
}

- (void)removeActivePromptAndUnderline
{
  [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self promptIsVisible];
  id v15 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
  if ([v15 isEmpty])
  {
    id v4 = [v15 start];
    uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v4];

    if (v5 && ([v5 isEmpty] & 1) == 0)
    {
      id v6 = v5;

      id v15 = v6;
    }
  }
  if (([v15 isEmpty] & 1) == 0)
  {
    id v7 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self keyFromRange:v15];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      unint64_t v10 = [v9 underlines];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        uint64_t v12 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
        id v13 = [v9 underlines];
        [v12 removeUnderlines:v13 animated:1];
      }
      [(_UITextChoiceAccelerationAssistant *)self removeWordForRange:v15];
    }
  }
  if (v3)
  {
    BOOL v14 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    [v14 removeAnimated:1];
  }
}

- (BOOL)dismissIfPresented
{
  if ([(_UITextChoiceAccelerationAssistant *)self keepPromptActive])
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  [(_UITextChoiceAccelerationAssistant *)self cancelPromptDisplay];
  [(_UITextChoiceAccelerationAssistant *)self releaseSelectionGrabberAssertion];
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self promptIsVisible];
  id v4 = [(_UITextChoiceAccelerationAssistant *)self prompt];
  uint64_t v5 = v4;
  if (!v3)
  {
    [v4 reset];
LABEL_10:

    goto LABEL_11;
  }
  [v4 removeAnimated:1];

  if ([(_UITextChoiceAccelerationAssistant *)self usingCustomInteraction])
  {
    id v6 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

    if (v6)
    {
      id v7 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
      uint64_t v5 = [v7 end];

      if (v5)
      {
        uint64_t v8 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];

        if (v8)
        {
          uint64_t v9 = [(_UITextChoiceAccelerationAssistant *)self delegate];
          unint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
          uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self textInputResponder];
          uint64_t v12 = [v11 textRangeFromPosition:v5 toPosition:v5];
          [v9 updateTextChoicePromptSelection:v10 toRange:v12];
        }
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  if (+[UIKeyboard usesInputSystemUI])
  {
    LOBYTE(v3) = [(_UITextChoiceAccelerationAssistant *)self showingPrompt];
    id v13 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    [v13 dismissTextChoicePrompt];
  }
  return v3;
}

- (void)addList:(id)a3 forCandidate:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    id v8 = [a4 candidate];
    id v7 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
    [v7 setObject:v6 forKey:v8];
  }
}

- (id)listForFinalString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)candidateForFinalString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
  id v6 = [v5 objectForKey:v4];

  id v7 = [(_UITextChoiceAccelerationAssistant *)self autocorrectionForList:v6];

  return v7;
}

- (id)alternateCorrectionsForList:(id)a3
{
  BOOL v3 = [a3 corrections];
  id v4 = [v3 alternateCorrections];

  return v4;
}

- (id)autocorrectionForList:(id)a3
{
  BOOL v3 = [a3 corrections];
  id v4 = [v3 autocorrection];

  return v4;
}

- (void)shouldShowPromptForWebKitText:(id)a3 atPosition:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  uint64_t v12 = [v11 objectForKey:v8];

  if (v12)
  {
    v10[2](v10, 1);
  }
  else
  {
    id v13 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    BOOL v14 = [v13 inputDelegateManager];
    id v15 = [v14 asyncCapableInputDelegate];

    if (v15)
    {
      uint64_t v16 = objc_opt_new();
      [v16 setSurroundingGranularity:0];
      [v16 setFlags:197];
      double v17 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      id v18 = [v17 inputDelegateManager];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __97___UITextChoiceAccelerationAssistant_shouldShowPromptForWebKitText_atPosition_completionHandler___block_invoke;
      v19[3] = &unk_1E52EECE0;
      v19[4] = self;
      id v20 = v8;
      id v21 = v9;
      BOOL v22 = v10;
      [v18 requestDocumentContext:v16 completionHandler:v19];
    }
    else
    {
      v10[2](v10, 0);
    }
  }
}

- (void)fullAutocorrectionForWord:(id)a3 atPosition:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  uint64_t v12 = [v11 objectForKey:v8];

  if (!v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UITextChoiceAccelerationAssistant_fullAutocorrectionForWord_atPosition_completionHandler___block_invoke;
    aBlock[3] = &unk_1E52EECE0;
    aBlock[4] = self;
    id v26 = v8;
    id v27 = v9;
    id v13 = v10;
    id v28 = v13;
    long long v24 = _Block_copy(aBlock);
    BOOL v14 = objc_opt_new();
    [v14 setSurroundingGranularity:0];
    [v14 setFlags:197];
    id v15 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    uint64_t v16 = [v15 inputDelegateManager];
    double v17 = [v16 asyncCapableInputDelegate];

    if (v17)
    {
      id v18 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      uint64_t v19 = [v18 inputDelegateManager];
      id v20 = [v19 asyncCapableInputDelegate];

      id v21 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      BOOL v22 = [v21 inputDelegateManager];
      uint64_t v23 = v24;
      [v22 requestDocumentContext:v14 completionHandler:v24];

      if (v20)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
      uint64_t v23 = v24;
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
    id v20 = 0;
    goto LABEL_8;
  }
  (*((void (**)(id, id))v10 + 2))(v10, v8);
LABEL_9:
}

- (id)rangeOfAutocorrectionForString:(id)a3 atPosition:(id)a4 inDocument:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 autocorrectedRanges];
  if (v9)
  {
    id v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
    [v10 caretRectForPosition:v7];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    unint64_t v19 = objc_msgSend(v8, "rangeContainedWithinRect:", v12, v14, v16, v18);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          unint64_t v25 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "rangeValue", (void)v30);
          if (v19 >= v25 && v19 - v25 < v26)
          {
            id v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v25, v26);
            goto LABEL_15;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }
    id v28 = 0;
LABEL_15:
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (void)trackUnderlineForWebKitCandidate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 candidate];

  if (v5)
  {
    id v6 = [v4 candidate];
    id v7 = [(_UITextChoiceAccelerationAssistant *)self anchorRangeForText:v6];

    if (v7)
    {
      if (([v7 isEmpty] & 1) == 0)
      {
        uint64_t v8 = [v7 start];
        if (v8)
        {
          id v9 = (void *)v8;
          id v10 = [v7 end];

          if (v10)
          {
            double v11 = [(_UITextChoiceAccelerationAssistant *)self underlinedRanges];
            [v11 addObject:v7];
          }
        }
      }
    }
    double v12 = +[_UIReplacementCandidate candidateForAutocorrectionCandidate:v4 range:v7];
    [v12 setUnderlineStyle:0];
    double v13 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    double v14 = [v4 candidate];
    [v13 setObject:v12 forKey:v14];
  }
  else
  {
    double v15 = _UIKeyboardLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v16 = 0;
      _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Attempted to track underline for empty candidate", v16, 2u);
    }
  }
}

- (BOOL)presentTextChoicePromptForText:(id)a3 delay:(double)a4 autocorrectionRects:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
  double v11 = [v10 objectForKey:v9];

  if (v11
    && (+[UIKeyboard isKeyboardProcess]
     || ![v11 underlineStyle]))
  {
    double v12 = [(_UITextChoiceAccelerationAssistant *)self savedLists];
    double v13 = [v11 documentTextToReplace];
    double v14 = [v12 objectForKey:v13];

    if (v14)
    {
      double v15 = [v14 corrections];
      double v16 = [v15 autocorrection];
    }
    else
    {
      double v16 = 0;
    }
    if ([v8 count])
    {
      double v17 = [v8 firstObject];
      [v17 CGRectValue];
      long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v26 = *MEMORY[0x1E4F1DAB8];
      long long v24 = v26;
      long long v27 = v25;
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v23 = v28;
      double v18 = +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v26);

      unint64_t v19 = [v8 lastObject];
      [v19 CGRectValue];
      long long v26 = v24;
      long long v27 = v25;
      long long v28 = v23;
      id v20 = +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v26);

      v29[0] = v18;
      v29[1] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v11 setUnderlines:v21];
    }
    [(_UITextChoiceAccelerationAssistant *)self showPromptForReplacementCandidate:v11 originalCandidate:v16 delay:a4];
  }
  return v11 != 0;
}

- (void)updateReplacements:(id)a3 forCandidate:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [v23 firstObject];
  if (v7)
  {
    id v8 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    id v9 = [v8 objectForKey:v6];

    id v10 = [(_UITextChoiceAccelerationAssistant *)self anchorRangeForText:v6];
    if (!v9)
    {
      unint64_t v11 = [v23 count];
      double v12 = [v7 replacementText];
      if (v11 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      id v9 = +[_UIReplacementCandidate candidateForDocumentText:v6 revertText:v12 textChoices:0 range:v10 underlineStyle:0 promptStyle:v13 promptButton:2 * (v11 < 2)];
    }
    if ([v23 count])
    {
      double v14 = [MEMORY[0x1E4F1CA48] array];
      if ([v23 count])
      {
        unint64_t v15 = 0;
        do
        {
          double v16 = [v23 objectAtIndex:v15];
          double v17 = [v16 replacementText];

          if (v17)
          {
            double v18 = [v16 replacementText];
            [v14 addObject:v18];
          }
          ++v15;
        }
        while (v15 < [v23 count]);
      }
      if ([v14 count]) {
        [v9 setTextChoices:v14];
      }
    }
    unint64_t v19 = [v9 textChoices];
    unint64_t v20 = [v19 count];

    if (v20 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 2;
    }
    [v9 setPreferredPromptStyle:v21];
    [v9 setPreferredPromptButton:2 * (v20 < 2)];
    uint64_t v22 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    [v22 setObject:v9 forKey:v6];
  }
}

- (void)updateReplacementsForSavedCandidate:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(_UITextChoiceAccelerationAssistant *)self listForFinalString:v4];
  id v7 = [(_UITextChoiceAccelerationAssistant *)self alternateCorrectionsForList:v6];
  id v8 = [(_UITextChoiceAccelerationAssistant *)self autocorrectionForList:v6];
  id v9 = [v8 input];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    unint64_t v11 = [(_UITextChoiceAccelerationAssistant *)self delegate];
    double v12 = [v11 inputDelegateManager];
    uint64_t v13 = [v12 asyncCapableInputDelegate];

    if (v13)
    {
      double v14 = [(_UITextChoiceAccelerationAssistant *)self delegate];
      unint64_t v15 = [v14 inputDelegateManager];
      double v16 = [v15 selectedText];
    }
    else
    {
      double v16 = 0;
    }
    double v17 = [v8 input];
    int v18 = [v17 isEqualToString:v16];

    if (v18)
    {
      unint64_t v19 = [v8 candidate];
      char v20 = [v19 isEqualToString:v16];

      if (v20)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v21 = [v8 candidate];
    }
    else
    {
      uint64_t v21 = [v8 input];
    }
    uint64_t v22 = (void *)v21;
    [v5 addObject:v21];

    goto LABEL_10;
  }
LABEL_11:
  if ([v7 count])
  {
    double v44 = v8;
    id v23 = v4;
    long long v24 = v6;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v25 = v7;
    id v26 = v7;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = [*(id *)(*((void *)&v46 + 1) + 8 * i) candidate];
          [v5 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v28);
    }

    id v7 = v25;
    id v6 = v24;
    id v4 = v23;
    id v8 = v44;
  }
  if ([v5 count])
  {
    long long v32 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    long long v33 = [v32 objectForKey:v4];

    if (!v33)
    {
      unint64_t v34 = [v5 count];
      uint64_t v35 = [(_UITextChoiceAccelerationAssistant *)self anchorRangeForText:v4];
      [v5 firstObject];
      uint64_t v45 = v6;
      v37 = double v36 = v7;
      if (v34 <= 1) {
        uint64_t v38 = 1;
      }
      else {
        uint64_t v38 = 2;
      }
      long long v33 = +[_UIReplacementCandidate candidateForDocumentText:v4 revertText:v37 textChoices:0 range:v35 underlineStyle:0 promptStyle:v38 promptButton:2 * (v34 < 2)];

      id v7 = v36;
      id v6 = v45;
    }
    double v39 = (void *)[v5 copy];
    [v33 setTextChoices:v39];

    double v40 = [v33 textChoices];
    unint64_t v41 = [v40 count];

    if (v41 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = 2;
    }
    [v33 setPreferredPromptStyle:v42];
    [v33 setPreferredPromptButton:2 * (v41 < 2)];
    long long v43 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    [v43 setObject:v33 forKey:v4];
  }
}

- (void)restoreInsertionPointPositionWithDocument:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7
{
  NSUInteger length = a5.length;
  NSUInteger v8 = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  id v15 = v12;
  if (a7)
  {
    location += a6.length - length;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITextChoiceAccelerationAssistant.m", 4173, @"restoreInsertionPointPositionWithDocument to an invalid range (%lu)", 0x7FFFFFFFFFFFFFFFLL);

      id v12 = v15;
    }
  }
  uint64_t v13 = objc_msgSend(v12, "_textRangeFromNSRange:", location, v8);
  [v15 setSelectedTextRange:v13];
}

- (void)resetDictationChoices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7++) removeAnimated:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  NSUInteger v8 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
  [v8 removeAllObjects];

  id v9 = [(_UITextChoiceAccelerationAssistant *)self dictationDisambiguationUIAssertion];

  if (v9)
  {
    uint64_t v10 = [(_UITextChoiceAccelerationAssistant *)self dictationDisambiguationUIAssertion];
    [v10 _invalidate];

    [(_UITextChoiceAccelerationAssistant *)self setDictationDisambiguationUIAssertion:0];
  }
}

- (void)resetDictationUnderlines
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
    uint64_t v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
          long long v12 = [(_UITextChoiceAccelerationAssistant *)self _underlineView];
          long long v13 = [v11 underlines];
          [v12 removeUnderlines:v13 animated:1];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    long long v14 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
    id v15 = [v14 allKeys];

    uint64_t v16 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordData];
    [v16 removeObjectsForKeys:v15];

    double v17 = [(_UITextChoiceAccelerationAssistant *)self underlinedWordDataForDictation];
    [v17 removeAllObjects];

    if (!+[UIKeyboard isKeyboardProcess]) {
      [(_UITextChoiceAccelerationAssistant *)self setNeedsUnderlineUpdate];
    }
  }
}

- (void)cancelPendingDictationPromptDisplay
{
  BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self dictationUnderlineDisplayTimer];
  [v3 invalidate];

  [(_UITextChoiceAccelerationAssistant *)self setDictationUnderlineDisplayTimer:0];
  uint64_t v4 = [(_UITextChoiceAccelerationAssistant *)self dictationPromptAutoUpdateTimer];
  [v4 invalidate];

  [(_UITextChoiceAccelerationAssistant *)self setDictationPromptAutoUpdateTimer:0];
}

- (void)decorateTextInRanges:(id)a3 replacementText:(id)a4 allowAutomaticReplacement:(BOOL)a5 autoHide:(BOOL)a6 voiceCommandTrackingUUID:(id)a7 withCompletionHandler:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v53 = a4;
  id v54 = a8;
  if (!+[UIKeyboard isKeyboardProcess])
  {
    BOOL v48 = v9;
    long long v14 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];

    if (!v14)
    {
      id v15 = objc_opt_new();
      [(_UITextChoiceAccelerationAssistant *)self setDictationVoiceEditingPrompts:v15];
    }
    [(_UITextChoiceAccelerationAssistant *)self updateSelectionHighlights];
    uint64_t v16 = [(_UITextChoiceAccelerationAssistant *)self textHighlightColor];
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      double v17 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
      uint64_t v18 = [v17 _cursorTintColor];

      uint64_t v52 = (void *)v18;
    }
    else
    {
      uint64_t v52 = v16;
    }
    uint64_t v51 = [v13 count];
    long long v62 = 0u;
    long long v63 = 0u;
    BOOL v19 = v51 == 1 && v10;
    BOOL v47 = v19;
    long long v64 = 0uLL;
    long long v65 = 0uLL;
    id v49 = v13;
    id obj = v13;
    uint64_t v20 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v55 = 0;
      uint64_t v22 = 1;
      uint64_t v23 = *(void *)v63;
      uint64_t v50 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v63 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          id v26 = [(_UITextChoiceAccelerationAssistant *)self underlineRectsForCandidate:0 range:v25];
          if (v25)
          {
            uint64_t v27 = [(_UITextChoiceAccelerationAssistant *)self _document];
            uint64_t v28 = [v27 textInRange:v25];

            if (v28 && [v28 length])
            {
              id v66 = v53;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
              v29 = uint64_t v56 = v22;
              long long v30 = [NSNumber numberWithInt:v55 + i];
              long long v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(obj, "count"));
              long long v32 = +[_UIReplacementCandidate candidateForDocumentText:v28 revertText:v28 textChoices:v29 range:v25 underlineStyle:0 promptStyle:3 promptButton:5 voiceCommandDisambiguationSelectedIndex:v30 voiceCommandDisambiguationTargetCount:v31];

              long long v33 = [(_UITextChoiceAccelerationAssistant *)self createPromptWithCompletionHandler:v54];
              [v33 setPromptStyle:3];
              unint64_t v34 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
              [v34 addObject:v33];

              uint64_t v35 = [(_UITextChoiceAccelerationAssistant *)self parentViewForPrompt];
              [v35 _convertVisualAltitude:v33 toView:0.0];
              objc_msgSend(v33, "_setVisualAltitude:");
              double v36 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
              double v37 = [v26 firstObject];
              [v33 updateWithChoices:0 fromParentView:v35 referenceTextView:v36 presentedFromRect:v37 textHighlightColor:v52];

              [v33 updateButtonForType:5];
              [v33 setReplacement:v32];
              if (v51 != 1) {
                [v33 setLabelNumber:v56];
              }
              [(_UITextChoiceAccelerationAssistant *)self updatePrompt:v33 forReplacementCandidate:v32];
              uint64_t v22 = v56 + 1;

              uint64_t v23 = v50;
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        uint64_t v55 = (v55 + i);
      }
      while (v21);
    }

    uint64_t v38 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
    if ((unint64_t)[v38 count] < 2)
    {
      id v13 = v49;
      double v40 = v52;
      BOOL v41 = v48;
    }
    else
    {
      double v39 = [(_UITextChoiceAccelerationAssistant *)self dictationDisambiguationUIAssertion];

      id v13 = v49;
      double v40 = v52;
      BOOL v41 = v48;
      if (v39) {
        goto LABEL_29;
      }
      uint64_t v38 = +[UIDictationController activeInstance];
      uint64_t v42 = [v38 _obtainDisambiguationUIAssertion];
      [(_UITextChoiceAccelerationAssistant *)self setDictationDisambiguationUIAssertion:v42];
    }
LABEL_29:
    [(_UITextChoiceAccelerationAssistant *)self setupPassthroughContainer];
    if (v47)
    {
      [(_UITextChoiceAccelerationAssistant *)self cancelPendingDictationPromptDisplay];
      long long v43 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];
      double v44 = [v43 firstObject];

      if (v44)
      {
        uint64_t v45 = (void *)MEMORY[0x1E4F1CB00];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke;
        v59[3] = &unk_1E52EED08;
        v59[4] = self;
        id v60 = v44;
        id v61 = v54;
        long long v46 = [v45 scheduledTimerWithTimeInterval:0 repeats:v59 block:0.2];
        [(_UITextChoiceAccelerationAssistant *)self setDictationPromptAutoUpdateTimer:v46];
      }
      else if (v54)
      {
        (*((void (**)(id, void))v54 + 2))(v54, 0);
      }
    }
    else
    {
      if (!v41)
      {
        if (v54) {
          (*((void (**)(id, void))v54 + 2))(v54, 0);
        }
        goto LABEL_39;
      }
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke_2;
      v58[3] = &unk_1E52EC0A8;
      v58[4] = self;
      double v44 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v58 block:0.3];
      [(_UITextChoiceAccelerationAssistant *)self setDictationUnderlineDisplayTimer:v44];
    }

LABEL_39:
  }
}

- (void)decorateTextInRects:(id)a3 targetTextArray:(id)a4 replacementText:(id)a5 deltaRanges:(id)a6 originalSelectedRange:(_NSRange)a7 allowAutomaticReplacement:(BOOL)a8 autoHide:(BOOL)a9 voiceCommandUUID:(id)a10 withCompletionHandler:(id)a11
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v70 = a5;
  id v69 = a6;
  id v68 = a10;
  id v71 = a11;
  if (+[UIKeyboard isKeyboardProcess]) {
    goto LABEL_35;
  }
  uint64_t v18 = [(_UITextChoiceAccelerationAssistant *)self dictationVoiceEditingPrompts];

  if (!v18)
  {
    BOOL v19 = objc_opt_new();
    [(_UITextChoiceAccelerationAssistant *)self setDictationVoiceEditingPrompts:v19];
  }
  [(_UITextChoiceAccelerationAssistant *)self updateSelectionHighlights];
  uint64_t v20 = [(_UITextChoiceAccelerationAssistant *)self textHighlightColor];
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    uint64_t v21 = [(_UITextChoiceAccelerationAssistant *)self selectionViewManager];
    uint64_t v22 = [v21 _cursorTintColor];

    uint64_t v20 = (void *)v22;
  }
  uint64_t v67 = v20;
  uint64_t v23 = [v16 count];
  BOOL v24 = v23 == 1 && a8;
  BOOL v62 = v24;
  if (v23 != [v17 count])
  {
    id v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"_UITextChoiceAccelerationAssistant.m" lineNumber:4332 description:@"rects must match targets"];
  }
  long long v72 = self;
  if (v23)
  {
    uint64_t v25 = 0;
    id v64 = v17;
    id v65 = v16;
    uint64_t v63 = v23;
    do
    {
      id v26 = [v16 objectAtIndexedSubscript:v25];
      uint64_t v27 = [v17 objectAtIndexedSubscript:v25];
      uint64_t v28 = v27;
      if (v27 && [v27 length])
      {
        v78[0] = v70;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
        long long v30 = [NSNumber numberWithInt:v25];
        long long v31 = [NSNumber numberWithInt:v23];
        long long v32 = +[_UIReplacementCandidate candidateForDocumentText:v28 revertText:v28 textChoices:v29 range:0 underlineStyle:0 promptStyle:0 promptButton:5 voiceCommandDisambiguationSelectedIndex:v30 voiceCommandDisambiguationTargetCount:v31];

        [v32 setVoiceCommandTrackingUUID:v68];
        long long v33 = [(_UITextChoiceAccelerationAssistant *)v72 createPromptWithCompletionHandler:v71];
        [v33 setPromptStyle:3];
        unint64_t v34 = [(_UITextChoiceAccelerationAssistant *)v72 dictationVoiceEditingPrompts];
        [v34 addObject:v33];

        uint64_t v35 = [(_UITextChoiceAccelerationAssistant *)v72 parentViewForPrompt];
        [v35 _convertVisualAltitude:v33 toView:0.0];
        objc_msgSend(v33, "_setVisualAltitude:");
        [v26 CGRectValue];
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v44 = [(_UITextChoiceAccelerationAssistant *)v72 delegate];
        uint64_t v45 = [v44 inputOverlayContainer];
        long long v46 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v45, v37, v39, v41, v43);

        uint64_t v23 = v63;
        BOOL v47 = [(_UITextChoiceAccelerationAssistant *)v72 textInputView];
        [v33 updateWithChoices:0 fromParentView:v35 referenceTextView:v47 presentedFromRect:v46 textHighlightColor:v67];

        [v33 updateButtonForType:5];
        [v33 setReplacement:v32];
        if (v63 != 1) {
          [v33 setLabelNumber:v25 + 1];
        }
        if (v69)
        {
          BOOL v48 = [v69 objectAtIndex:v25];
          uint64_t v49 = [v48 rangeValue];
          objc_msgSend(v33, "setDeltaRange:", v49, v50);
        }
        objc_msgSend(v33, "setOriginalSelectedRange:", a7.location, a7.length);
        [(_UITextChoiceAccelerationAssistant *)v72 updatePrompt:v33 forReplacementCandidate:v32];

        id v17 = v64;
        id v16 = v65;
      }

      ++v25;
    }
    while (v23 != v25);
  }
  uint64_t v51 = [(_UITextChoiceAccelerationAssistant *)v72 dictationVoiceEditingPrompts];
  if ((unint64_t)[v51 count] <= 1)
  {
    id v53 = v67;
    goto LABEL_25;
  }
  uint64_t v52 = [(_UITextChoiceAccelerationAssistant *)v72 dictationDisambiguationUIAssertion];

  id v53 = v67;
  if (!v52)
  {
    uint64_t v51 = +[UIDictationController activeInstance];
    id v54 = [v51 _obtainDisambiguationUIAssertion];
    [(_UITextChoiceAccelerationAssistant *)v72 setDictationDisambiguationUIAssertion:v54];

LABEL_25:
  }
  [(_UITextChoiceAccelerationAssistant *)v72 setupPassthroughContainer];
  if (v62)
  {
    [(_UITextChoiceAccelerationAssistant *)v72 cancelPendingDictationPromptDisplay];
    uint64_t v55 = [(_UITextChoiceAccelerationAssistant *)v72 dictationVoiceEditingPrompts];
    uint64_t v56 = [v55 firstObject];

    if (v56)
    {
      v57 = (void *)MEMORY[0x1E4F1CB00];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke;
      v75[3] = &unk_1E52EED08;
      v75[4] = v72;
      id v76 = v56;
      id v77 = v71;
      char v58 = [v57 scheduledTimerWithTimeInterval:0 repeats:v75 block:0.2];
      [(_UITextChoiceAccelerationAssistant *)v72 setDictationPromptAutoUpdateTimer:v58];
    }
  }
  else if (a9)
  {
    uint64_t v59 = (void *)MEMORY[0x1E4F1CB00];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke_2;
    v73[3] = &unk_1E52EED30;
    v73[4] = v72;
    id v74 = v71;
    id v60 = [v59 scheduledTimerWithTimeInterval:0 repeats:v73 block:0.3];
    [(_UITextChoiceAccelerationAssistant *)v72 setDictationUnderlineDisplayTimer:v60];
  }
  else if (v71)
  {
    (*((void (**)(id, void))v71 + 2))(v71, 0);
  }

LABEL_35:
}

- (void)presentIfNeededForRange:(id)a3
{
  id v14 = a3;
  if ([v14 isEmpty])
  {
    uint64_t v4 = [v14 start];
    uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self rangeForTextChoicesAtPosition:v4];

    if (v5) {
      goto LABEL_4;
    }
    uint64_t v6 = [(_UITextChoiceAccelerationAssistant *)self _document];
    uint64_t v7 = [v14 end];
    uint64_t v5 = [v6 _rangeOfEnclosingWord:v7];

    if (v5)
    {
LABEL_4:
      id v8 = v5;

      id v9 = v8;
LABEL_6:
      id v15 = v9;
      BOOL v10 = [(_UITextChoiceAccelerationAssistant *)self _document];
      long long v11 = [v10 textInRange:v15];

      long long v12 = [(_UITextChoiceAccelerationAssistant *)self candidateForFinalString:v11];
      if (v12) {
        [(_UITextChoiceAccelerationAssistant *)self showChoicesForAutocorrectionCandidate:v12 range:v15];
      }
      else {
        [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
      }

      id v13 = v15;
      goto LABEL_11;
    }
  }
  id v9 = v14;
  if (v14) {
    goto LABEL_6;
  }
  [(_UITextChoiceAccelerationAssistant *)self dismissIfPresented];
  id v13 = 0;
LABEL_11:
}

- (id)anchorRangeForText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextChoiceAccelerationAssistant *)self activeSelectedRange];
  if (v5)
  {
    uint64_t v6 = [(_UITextChoiceAccelerationAssistant *)self _document];
    uint64_t v7 = [v5 end];
    id v8 = [v6 _rangeOfText:v4 endingAtPosition:v7];

    if (v8)
    {
      id v9 = v8;

      uint64_t v5 = v9;
    }
  }
  return v5;
}

- (id)underlineRectsForInput:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [(_UITextChoiceAccelerationAssistant *)self anchorRangeForText:v4];
    uint64_t v7 = v6;
    if (v6 && ([v6 isEmpty] & 1) == 0)
    {
      id v8 = +[UIKeyboard currentDocumentState];
      id v9 = [(_UITextChoiceAccelerationAssistant *)self _document];
      uint64_t v10 = [v7 _asNSRangeRelativeToDocument:v9];
      uint64_t v12 = v11;

      uint64_t v21 = v12;
      uint64_t v22 = v10;
      id v13 = objc_msgSend(v8, "rectsForCharacterRange:withGranularity:", v10, v12, 1);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) CGRectValue];
            uint64_t v18 = -[_UITextChoiceAccelerationAssistant underlineRectFromDocumentRect:](self, "underlineRectFromDocumentRect:");
            if (v18) {
              [v5 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }
      if (![v5 count])
      {
        objc_msgSend(v8, "firstRectForCharacterRange:", v22, v21);
        BOOL v19 = -[_UITextChoiceAccelerationAssistant underlineRectFromDocumentRect:](self, "underlineRectFromDocumentRect:");
        if (v19) {
          [v5 addObject:v19];
        }
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)underlineRectFromDocumentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(_UITextChoiceAccelerationAssistant *)self textInputView];
  id v9 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  uint64_t v10 = [v9 inputOverlayContainer];
  objc_msgSend(v8, "convertRect:toCoordinateSpace:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  BOOL v19 = [(_UITextChoiceAccelerationAssistant *)self delegate];
  uint64_t v20 = [v19 inputOverlayContainer];
  uint64_t v21 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v20, v12, v14, v16, v18);

  uint64_t v22 = [(_UITextChoiceAccelerationAssistant *)self underlineRectForTextSelectionRect:v21 forCandidate:0];

  return v22;
}

- (void)textWillBeginScrolling
{
  if ([(_UITextChoiceAccelerationAssistant *)self promptIsVisible])
  {
    BOOL v3 = [(_UITextChoiceAccelerationAssistant *)self prompt];
    id v4 = [v3 replacement];
    IsSmartRepldouble y = _replacementSourceIsSmartReply(v4);

    if (IsSmartReply)
    {
      uint64_t v6 = _UIKeyboardSmartReplyLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Text choice assistant is stashing smart replies as scrolling begins", v10, 2u);
      }

      uint64_t v7 = [(_UITextChoiceAccelerationAssistant *)self prompt];
      id v8 = [v7 replacement];
      stashedReplacement = self->_stashedReplacement;
      self->_stashedReplacement = v8;

      [(_UITextChoiceAccelerationAssistant *)self clearSecureCandidateHashes];
    }
  }
}

- (void)textDidEndScrolling
{
  BOOL v3 = self->_stashedReplacement;
  stashedReplacement = self->_stashedReplacement;
  self->_stashedReplacement = 0;

  if (![(_UITextChoiceAccelerationAssistant *)self promptIsVisible]
    && _replacementSourceIsSmartReply(v3))
  {
    uint64_t v5 = _UIKeyboardSmartReplyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Text choice assistant is restoring stashed smart replies as scrolling ends", v7, 2u);
    }

    uint64_t v6 = [(_UIReplacementCandidate *)v3 candidateChoices];
    [(_UITextChoiceAccelerationAssistant *)self showChoicesForCandidates:v6];
  }
}

- (_UITextChoicesAssistantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextChoicesAssistantDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextInteractionAssistant)interactionAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  return (UITextInteractionAssistant *)WeakRetained;
}

- (UITextInput)textInputResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInputResponder);
  return (UITextInput *)WeakRetained;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (_UITextChoiceAccelerationPassthroughView)passthroughContainer
{
  return self->_passthroughContainer;
}

- (void)setPassthroughContainer:(id)a3
{
}

- (void)setPrompt:(id)a3
{
}

- (BOOL)keepPromptActive
{
  return self->_keepPromptActive;
}

- (void)setKeepPromptActive:(BOOL)a3
{
  self->_keepPromptActive = a3;
}

- (NSMutableArray)dictationVoiceEditingPrompts
{
  return self->_dictationVoiceEditingPrompts;
}

- (void)setDictationVoiceEditingPrompts:(id)a3
{
}

- (NSTimer)dictationPromptAutoUpdateTimer
{
  return self->_dictationPromptAutoUpdateTimer;
}

- (void)setDictationPromptAutoUpdateTimer:(id)a3
{
}

- (NSTimer)dictationUnderlineDisplayTimer
{
  return self->_dictationUnderlineDisplayTimer;
}

- (void)setDictationUnderlineDisplayTimer:(id)a3
{
}

- (NSString)documentTextToReplace
{
  return self->_documentTextToReplace;
}

- (void)setDocumentTextToReplace:(id)a3
{
}

- (UITextRange)lastRange
{
  return self->_lastRange;
}

- (void)setLastRange:(id)a3
{
}

- (TIAutocorrectionList)lastList
{
  return self->_lastList;
}

- (void)setLastList:(id)a3
{
}

- (NSMutableArray)underlinedRanges
{
  return self->_underlinedRanges;
}

- (void)setUnderlinedRanges:(id)a3
{
}

- (NSMutableDictionary)savedLists
{
  return self->_savedLists;
}

- (void)setSavedLists:(id)a3
{
}

- (NSMutableDictionary)underlinedWordData
{
  return self->_underlinedWordData;
}

- (void)setUnderlinedWordData:(id)a3
{
}

- (NSMutableDictionary)underlinedWordDataForDictation
{
  return self->_underlinedWordDataForDictation;
}

- (void)setUnderlinedWordDataForDictation:(id)a3
{
}

- (UITextPosition)lastAddedPosition
{
  return self->_lastAddedPosition;
}

- (void)setLastAddedPosition:(id)a3
{
}

- (NSTimer)promptDisplayTimer
{
  return self->_promptDisplayTimer;
}

- (void)setPromptDisplayTimer:(id)a3
{
}

- (_UIAssertion)grabberSuppressionAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
  return (_UIAssertion *)WeakRetained;
}

- (void)setGrabberSuppressionAssertion:(id)a3
{
}

- (_UITextUnderlineView)selectionHighlightView
{
  return self->_selectionHighlightView;
}

- (void)setSelectionHighlightView:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)usingCustomInteraction
{
  return self->_usingCustomInteraction;
}

- (void)setUsingCustomInteraction:(BOOL)a3
{
  self->_usingCustomInteraction = a3;
}

- (_UITextChoiceInteraction)textChoiceInteraction
{
  return self->_textChoiceInteraction;
}

- (void)setTextChoiceInteraction:(id)a3
{
}

- (_UIAssertion)textChoiceInteractionGrabberSuppressionAssertion
{
  return self->_textChoiceInteractionGrabberSuppressionAssertion;
}

- (void)setTextChoiceInteractionGrabberSuppressionAssertion:(id)a3
{
}

- (_UIAssertion)dictationDisambiguationUIAssertion
{
  return self->_dictationDisambiguationUIAssertion;
}

- (void)setDictationDisambiguationUIAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationDisambiguationUIAssertion, 0);
  objc_storeStrong((id *)&self->_textChoiceInteractionGrabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_textChoiceInteraction, 0);
  objc_storeStrong((id *)&self->_selectionHighlightView, 0);
  objc_destroyWeak((id *)&self->_grabberSuppressionAssertion);
  objc_storeStrong((id *)&self->_promptDisplayTimer, 0);
  objc_storeStrong((id *)&self->_lastAddedPosition, 0);
  objc_storeStrong((id *)&self->_underlinedWordDataForDictation, 0);
  objc_storeStrong((id *)&self->_underlinedWordData, 0);
  objc_storeStrong((id *)&self->_savedLists, 0);
  objc_storeStrong((id *)&self->_underlinedRanges, 0);
  objc_storeStrong((id *)&self->_lastList, 0);
  objc_storeStrong((id *)&self->_lastRange, 0);
  objc_storeStrong((id *)&self->_documentTextToReplace, 0);
  objc_storeStrong((id *)&self->_dictationUnderlineDisplayTimer, 0);
  objc_storeStrong((id *)&self->_dictationPromptAutoUpdateTimer, 0);
  objc_storeStrong((id *)&self->_dictationVoiceEditingPrompts, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_passthroughContainer, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_destroyWeak((id *)&self->_textInputResponder);
  objc_destroyWeak((id *)&self->_interactionAssistant);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureCandidateHashes, 0);
  objc_storeStrong((id *)&self->_stashedReplacement, 0);
}

@end