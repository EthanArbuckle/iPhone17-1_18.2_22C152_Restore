@interface UITextInputSessionActionAnalytics
+ (id)allowedValuesForTextInputSource;
+ (id)sharedPunctuationCharacterSet;
+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3;
+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3;
+ (id)stringForReplaceWithCandidateType:(int64_t)a3;
+ (id)stringValueForSource:(int64_t)a3;
+ (void)addEndingObserver:(id)a3;
+ (void)populateActionInputMode:(id)a3;
+ (void)populateActionInputMode:(id)a3 withLanguage:(id)a4;
+ (void)q_notifyEndingObserversWithSessionAnalytics:(id)a3;
+ (void)q_notifyStartingObservers;
+ (void)removeEndingObserver:(id)a3;
- (IATextInputActionsInputMode)inputMode;
- (NSDictionary)keyboardTrialParameters;
- (NSUUID)sessionIdentifier;
- (UITextInputSessionActionAnalytics)init;
- (UITextInputSessionActionAnalytics)initWithEventHandler:(id)a3;
- (UITextInputSessionActionAnalyticsDelegateSource)delegateSource;
- (id)_instanceOfActionClass:(Class)a3;
- (id)_textInsertionActionForText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5;
- (id)allAccumulatorNames;
- (id)allEfficacyAccumulatorNames;
- (id)appBundleId;
- (id)getAppBundleId;
- (id)getDynamicAccumulatorWithName:(id)a3;
- (id)getEfficacyAccumulatorWithName:(id)a3;
- (id)processBundleId;
- (id)q_copyAccumulatorWithName:(id)a3;
- (int64_t)_getActiveTextInputSource;
- (int64_t)flagOptions;
- (int64_t)source;
- (unint64_t)_emojiCountForText:(id)a3;
- (unint64_t)_normalizedTextLength:(id)a3;
- (unint64_t)_optionsForText:(id)a3;
- (unint64_t)_punctuationCountForText:(id)a3;
- (unint64_t)allowCursorMovementCounter;
- (void)_didDeleteBackwardAction:(id)a3;
- (void)_didDeleteBackwardCount:(unint64_t)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5;
- (void)_didDeleteBackwardText:(id)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5;
- (void)_didInsertTextAction:(id)a3 numCharsDeleted:(unint64_t)a4 withLanguage:(id)a5;
- (void)_performWithInputModeOverride:(id)a3 block:(id)a4;
- (void)_performWithTextInputActionsSource:(int64_t)a3 block:(id)a4;
- (void)addAccumulator:(id)a3;
- (void)addDynamicAccumulator:(id)a3;
- (void)addEfficacyAccumulator:(id)a3;
- (void)decrementAllowCursorMovementCount;
- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4;
- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didBegin;
- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4;
- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4;
- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4;
- (void)didCopy;
- (void)didCut;
- (void)didDeleteBackwardCount:(unint64_t)a3;
- (void)didDeleteBackwardText:(id)a3;
- (void)didDeleteKeyPressWithInputSource:(int64_t)a3;
- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4;
- (void)didDictationEnd;
- (void)didGlomojiTap:(unint64_t)a3 originalInputMode:(id)a4 newInputMode:(id)a5;
- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didInsertKeyPressWithInputSource:(int64_t)a3;
- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4;
- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6;
- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5;
- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withNumAlternatives:(int64_t)a5;
- (void)didKBMenuAppear:(unint64_t)a3 originalInputMode:(id)a4;
- (void)didKBMenuDismiss:(unint64_t)a3;
- (void)didKBMenuInteraction:(unint64_t)a3 selectedAction:(unint64_t)a4 newInputMode:(id)a5;
- (void)didKeyPress:(id)a3 inputSource:(int64_t)a4;
- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9;
- (void)didOther;
- (void)didPaste;
- (void)didRedo;
- (void)didReplaceWithCandidate:(int64_t)a3;
- (void)didReplacementForText:(id)a3 withText:(id)a4 withSource:(int64_t)a5 withType:(int64_t)a6 withInputActionCount:(int64_t)a7;
- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4;
- (void)didRevisionBubbleTap;
- (void)didSessionEnd;
- (void)didUndo;
- (void)enumerateAnalytics:(id)a3;
- (void)enumerateSeparateCycleAnalytics:(id)a3;
- (void)incrementAllowCursorMovementCount;
- (void)q_addAccumulator:(id)a3;
- (void)q_addActionAndUpdate:(id)a3;
- (void)q_addDynamicAccumulator:(id)a3;
- (void)q_addEfficacyAccumulator:(id)a3;
- (void)q_flushRecentActions;
- (void)q_setSeparateCycleAccumulatorNames:(id)a3;
- (void)q_setupDefaultAnalytics;
- (void)q_updateAnalyticsFromAccumulators;
- (void)setDelegateSource:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setKeyboardTrialParameters:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)writeAnalytics;
@end

@implementation UITextInputSessionActionAnalytics

+ (id)stringValueForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"Unspecified";
  }
  else {
    return off_1E52DEFA8[a3 - 1];
  }
}

+ (id)allowedValuesForTextInputSource
{
  if (qword_1EB25F268 != -1) {
    dispatch_once(&qword_1EB25F268, &__block_literal_global_68);
  }
  v2 = (void *)_MergedGlobals_967;
  return v2;
}

void __77__UITextInputSessionActionAnalytics_Default__allowedValuesForTextInputSource__block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Unspecified";
  v2[1] = @"KeyboardTap";
  v2[2] = @"KeyboardHardware";
  v2[3] = @"KeyboardThirdParty";
  v2[4] = @"KeyboardPath";
  v2[5] = @"KeyboardCamera";
  v2[6] = @"Pencil";
  v2[7] = @"Dictation";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)_MergedGlobals_967;
  _MergedGlobals_967 = v0;
}

- (void)q_setupDefaultAnalytics
{
  v65[3] = *MEMORY[0x1E4F143B8];
  v3 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Began" type:1 depth:1 block:&__block_literal_global_317];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v3];

  v4 = +[_UITextInputSessionAccumulator accumulatorWithName:@"DictationBegan" type:1 depth:1 block:&__block_literal_global_319];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v4];

  v5 = +[_UITextInputSessionAccumulator accumulatorWithName:@"MultiModalDictationBeganCount" type:1 depth:1 block:&__block_literal_global_321_0];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v5];

  v6 = +[_UITextInputSessionAccumulator accumulatorWithName:@"ModelessUsedAtLeastOnce" type:1 depth:1 block:&__block_literal_global_323];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v6];

  v7 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Insertion" type:1 depth:1 block:&__block_literal_global_325];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v7];

  v8 = +[_UITextInputSessionAccumulator accumulatorWithName:@"EmojiCount" type:1 depth:1 block:&__block_literal_global_327_0];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v8];

  v9 = +[_UITextInputSessionAccumulator accumulatorWithName:@"PunctuationCount" type:1 depth:1 block:&__block_literal_global_329];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v9];

  v10 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Insertion with Alternative" type:1 depth:1 block:&__block_literal_global_331];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v10];

  v11 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Deletion" type:1 depth:1 block:&__block_literal_global_333];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v11];

  v12 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Selection Change" type:1 depth:1 block:&__block_literal_global_335];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v12];

  v13 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Undo" type:1 depth:1 block:&__block_literal_global_337];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v13];

  v14 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Redo" type:1 depth:1 block:&__block_literal_global_339];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v14];

  v15 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Replace With Candidate" type:1 depth:1 block:&__block_literal_global_341];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v15];

  v16 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Replace With Candidate (case)" type:1 depth:1 block:&__block_literal_global_343];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v16];

  v17 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Replace With Latin Candidate" type:1 depth:1 block:&__block_literal_global_345];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v17];

  v18 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Replace With Non-Latin Candidate" type:1 depth:1 block:&__block_literal_global_347];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v18];

  v19 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Undo after Insertion" type:1 depth:2 block:&__block_literal_global_349];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v19];

  v20 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Undo after Deletion" type:1 depth:2 block:&__block_literal_global_351];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v20];

  v21 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Consecutive Selection" type:1 depth:2 block:&__block_literal_global_353];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v21];

  v22 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Consecutive Cursor" type:1 depth:2 block:&__block_literal_global_355];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v22];

  v23 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Consecutive Ranged" type:1 depth:2 block:&__block_literal_global_358];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v23];

  v24 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Triple Selection" type:1 depth:3 block:&__block_literal_global_360];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v24];

  v25 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Triple Cursor" type:1 depth:3 block:&__block_literal_global_362];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v25];

  v26 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Triple Ranged" type:1 depth:3 block:&__block_literal_global_364];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v26];

  v27 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Insertion"];
  v65[0] = v27;
  v28 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Selection Change"];
  v65[1] = v28;
  v29 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Insertion"];
  v65[2] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
  v31 = +[_UITextInputSessionMetaAccumulator accumulatorWithName:@"Insertion-Selection-Insertion" accumulators:v30];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v31];

  v32 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Insertion"];
  v64[0] = v32;
  v33 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Consecutive Selection"];
  v64[1] = v33;
  v34 = [(UITextInputSessionActionAnalytics *)self q_copyAccumulatorWithName:@"Insertion"];
  v64[2] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
  v36 = +[_UITextInputSessionMetaAccumulator accumulatorWithName:@"Insertion-2xSelection-Insertion" accumulators:v35];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v36];

  v37 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Keyboard" type:0 depth:2 block:&__block_literal_global_367];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v37];

  v38 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Emoji", 0, 2, 2, &__block_literal_global_369 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v38];

  v39 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Punctuation", 0, 2, 2, &__block_literal_global_371 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v39];

  v40 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Emoji Edit", 0, 2, 2, &__block_literal_global_373 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v40];

  v41 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Punctuation Edit", 0, 2, 2, &__block_literal_global_375 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v41];

  v42 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation-Selection-Deletion", 0, 3, 1, &__block_literal_global_377 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v42];

  v43 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Whitespace", 0, 2, 2, &__block_literal_global_379 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v43];

  v44 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Dictation to Deletion", 0, 2, 2, &__block_literal_global_381 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v44];

  v45 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Pencil to Keyboard" type:0 depth:2 block:&__block_literal_global_383];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v45];

  v46 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Pencil to Emoji", 0, 2, 2, &__block_literal_global_385 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v46];

  v47 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Pencil to Punctuation", 0, 2, 2, &__block_literal_global_387 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v47];

  v48 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Pencil to Whitespace", 0, 2, 2, &__block_literal_global_389 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v48];

  v49 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Pencil to Deletion" type:0 depth:3 block:&__block_literal_global_391];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v49];

  v50 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Keyboard to Pencil" type:0 depth:2 block:&__block_literal_global_393];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v50];

  v51 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Keyboard to Dictation" type:0 depth:2 block:&__block_literal_global_395];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v51];

  v52 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Camera to Other" type:0 depth:2 block:&__block_literal_global_397];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v52];

  v53 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Camera to Deletion", 0, 2, 2, &__block_literal_global_399 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v53];

  v54 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Edited Dictation with Keyboard", 0, 2, 2, &__block_literal_global_401 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v54];

  v55 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Edited Pencil with Keyboard", 0, 2, 2, &__block_literal_global_403 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v55];

  v56 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Edited Keyboard with Pencil", 0, 2, 2, &__block_literal_global_405 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v56];

  v57 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Edited Camera with Other", 0, 2, 2, &__block_literal_global_407 type depthRange block];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v57];

  v58 = +[_UITextInputSessionAccumulator accumulatorWithName:@"KB Suppression False Positive" type:0 depth:2 block:&__block_literal_global_409];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v58];

  v59 = +[_UITextInputSessionAccumulator accumulatorWithName:@"KB Suppression False Negative" type:0 depth:2 block:&__block_literal_global_411];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v59];

  v60 = +[_UITextInputSessionAccumulator accumulatorWithName:@"Insertion With Pencil" type:0 depth:1 block:&__block_literal_global_413];
  [(UITextInputSessionActionAnalytics *)self q_addAccumulator:v60];

  v61 = +[UIDevice currentDevice];
  uint64_t v62 = [v61 userInterfaceIdiom];

  if (!v62)
  {
    v63 = +[_UITextInputSessionDynamicAccumulator accumulatorWithName:@"com.apple.inputAnalytics.accidentalDictation", 1, 3, &__block_literal_global_418 depthRange block];
    [(UITextInputSessionActionAnalytics *)self q_addDynamicAccumulator:v63];
  }
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asBegan];

  return v3 != 0;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asDictationBegan];

  if (v3) {
    uint64_t v4 = [v3 dictationBeganCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asDictationBegan];

  if (v3) {
    uint64_t v4 = [v3 multiModalDictationBeganCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asDictationBegan];

  if (v3) {
    uint64_t v4 = [v3 modelessUsedAtLeastOnceCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asInsertion];

  if (v3) {
    uint64_t v4 = [v3 insertedTextLength];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asInsertion];

  if (v3) {
    uint64_t v4 = [v3 insertedEmojiCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asInsertion];

  if (v3) {
    uint64_t v4 = [v3 insertedPunctuationCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asInsertion];

  if (v3) {
    uint64_t v4 = [v3 withAlternativesCount];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asDeletion];

  if (v3) {
    uint64_t v4 = [v3 removedTextLength];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

unint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_10(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asSelection];

  [v3 relativeRangeBefore];
  uint64_t v5 = v4;
  [v3 rangeAfter];
  uint64_t v7 = v6;
  uint64_t v8 = [v3 relativeRangeBefore];
  unint64_t v10 = v9;
  uint64_t v11 = [v3 rangeAfter];
  if (v5 != v7)
  {
    if (v10 <= v12) {
      unint64_t v10 = v12;
    }
    [v3 relativeRangeBefore];
    unint64_t v15 = v14;
    [v3 rangeAfter];
    if (v15 >= v16) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v15;
    }
    goto LABEL_15;
  }
  if (v8 != v11)
  {
    unint64_t v18 = [v3 relativeRangeBefore];
    unint64_t v19 = [v3 rangeAfter];
    if (v18 <= v19) {
      unint64_t v10 = v19;
    }
    else {
      unint64_t v10 = v18;
    }
    unint64_t v20 = [v3 relativeRangeBefore];
    unint64_t v21 = [v3 rangeAfter];
    if (v20 >= v21) {
      unint64_t v17 = v21;
    }
    else {
      unint64_t v17 = v20;
    }
LABEL_15:
    unint64_t v13 = v10 - v17;
    goto LABEL_16;
  }
  unint64_t v13 = 0;
LABEL_16:

  return v13;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_11(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asUndo];

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_12(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asRedo];

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asReplaceWithCandidate];

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_14(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asReplaceWithCandidate];

  BOOL v4 = [v3 replaceWithCandidateType] == 1;
  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_15(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asReplaceWithCandidate];

  BOOL v4 = [v3 replaceWithCandidateType] == 2;
  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_16(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  v3 = [v2 asReplaceWithCandidate];

  BOOL v4 = [v3 replaceWithCandidateType] == 3;
  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  BOOL v4 = [v3 asUndo];

  if (!v4
    || (uint64_t v5 = 1,
        [v2 objectAtIndex:1],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 asInsertion],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  BOOL v4 = [v3 asUndo];

  if (!v4
    || (uint64_t v5 = 1,
        [v2 objectAtIndex:1],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 asDeletion],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  BOOL v4 = [v3 asSelection];

  if (!v4
    || (uint64_t v5 = 1,
        [v2 objectAtIndex:1],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 asSelection],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  BOOL v4 = [v3 asSelection];

  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_21;
  v7[3] = &unk_1E52DEF40;
  v7[4] = &v8;
  [v2 enumerateObjectsUsingBlock:v7];
  BOOL v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 asSelection];
  if (!v6
    || (v9 = v6, [v6 relativeRangeBefore], uint64_t v6 = v9, v7)
    || ([v9 rangeAfter], uint64_t v6 = v9, v8))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  BOOL v4 = [v3 asSelection];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_23;
  v7[3] = &unk_1E52DEF40;
  v7[4] = &v8;
  [v2 enumerateObjectsUsingBlock:v7];
  BOOL v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_23(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 asSelection];
  if (v6
    && (v9 = v6, [v6 relativeRangeBefore], uint64_t v6 = v9, v7)
    && ([v9 rangeAfter], uint64_t v6 = v9, v8))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_25;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_25(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 asSelection];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    *(void *)(v7 + 24) = 1;
  }
  else
  {
    *(void *)(v7 + 24) = 2;
    *a4 = 1;
  }
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_27;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_27(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 asSelection];
  if (!v6
    || (v9 = v6, [v6 relativeRangeBefore], uint64_t v6 = v9, v7)
    || ([v9 rangeAfter], uint64_t v6 = v9, v8))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_29;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_29(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 asSelection];
  if (v6
    && (v9 = v6, [v6 relativeRangeBefore], uint64_t v6 = v9, v7)
    && ([v9 rangeAfter], uint64_t v6 = v9, v8))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  BOOL v4 = [v3 asKeyboardDockItemButtonPress];
  uint64_t v5 = [v4 buttonType];
  BOOL v6 = [v4 buttonType] == 2 && objc_msgSend(v4, "buttonPressResult") == 2;
  uint64_t v7 = [v3 source];
  if ((unint64_t)(v7 - 4) >= 5 && v7 != 1
    || (v5 == 1 ? (char v8 = 1) : (char v8 = v6),
        (v8 & 1) != 0
     || (uint64_t v9 = 1,
         [v2 objectAtIndex:1],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         uint64_t v11 = [v10 source],
         v10,
         v11 != 2)))
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_31(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_32;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_32(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v7 = [v18 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = (uint64_t *)(a1 + 32);
    uint64_t v10 = v11;
    uint64_t v12 = *(void *)(*(void *)(v11 + 8) + 24);
    BOOL v13 = a3 != 0;
    if (a3)
    {
      unint64_t v14 = v18;
      if (v12) {
        goto LABEL_11;
      }
      int v15 = [v18 changedContent];
      uint64_t v10 = *v9;
      uint64_t v16 = *(void *)(*v9 + 8);
      if (!v15)
      {
        *(void *)(v16 + 24) = 0;
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(v16 + 24);
      BOOL v13 = 1;
    }
    unint64_t v14 = v18;
LABEL_11:
    if (!v13 || v12) {
      goto LABEL_17;
    }
    if ([v14 source] == 2)
    {
      int v17 = [v18 changedContent];
      uint64_t v10 = *v9;
      if (v17)
      {
        *(void *)(*(void *)(v10 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v10 = *v9;
LABEL_17:
    *(void *)(*(void *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  if (([v7 options] & 1) == 0 || objc_msgSend(v18, "source") == 2)
  {
    uint64_t v9 = (uint64_t *)(a1 + 32);
    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_34;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_34(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v7 = [v18 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = (uint64_t *)(a1 + 32);
    uint64_t v10 = v11;
    uint64_t v12 = *(void *)(*(void *)(v11 + 8) + 24);
    BOOL v13 = a3 != 0;
    if (a3)
    {
      unint64_t v14 = v18;
      if (v12) {
        goto LABEL_11;
      }
      int v15 = [v18 changedContent];
      uint64_t v10 = *v9;
      uint64_t v16 = *(void *)(*v9 + 8);
      if (!v15)
      {
        *(void *)(v16 + 24) = 0;
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(v16 + 24);
      BOOL v13 = 1;
    }
    unint64_t v14 = v18;
LABEL_11:
    if (!v13 || v12) {
      goto LABEL_17;
    }
    if ([v14 source] == 2)
    {
      int v17 = [v18 changedContent];
      uint64_t v10 = *v9;
      if (v17)
      {
        *(void *)(*(void *)(v10 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v10 = *v9;
LABEL_17:
    *(void *)(*(void *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  if (([v7 options] & 2) == 0 || objc_msgSend(v18, "source") == 2)
  {
    uint64_t v9 = (uint64_t *)(a1 + 32);
    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_35(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_36;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_36(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v7 = [v18 asDeletion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = (uint64_t *)(a1 + 32);
    uint64_t v10 = v11;
    uint64_t v12 = *(void *)(*(void *)(v11 + 8) + 24);
    BOOL v13 = a3 != 0;
    if (a3)
    {
      unint64_t v14 = v18;
      if (v12) {
        goto LABEL_11;
      }
      int v15 = [v18 changedContent];
      uint64_t v10 = *v9;
      uint64_t v16 = *(void *)(*v9 + 8);
      if (!v15)
      {
        *(void *)(v16 + 24) = 0;
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(v16 + 24);
      BOOL v13 = 1;
    }
    unint64_t v14 = v18;
LABEL_11:
    if (!v13 || v12) {
      goto LABEL_17;
    }
    if ([v14 source] == 2)
    {
      int v17 = [v18 changedContent];
      uint64_t v10 = *v9;
      if (v17)
      {
        *(void *)(*(void *)(v10 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v10 = *v9;
LABEL_17:
    *(void *)(*(void *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  if (([v7 options] & 1) == 0 || objc_msgSend(v18, "source") == 2)
  {
    uint64_t v9 = (uint64_t *)(a1 + 32);
    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_38;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v7 = [v18 asDeletion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = (uint64_t *)(a1 + 32);
    uint64_t v10 = v11;
    uint64_t v12 = *(void *)(*(void *)(v11 + 8) + 24);
    BOOL v13 = a3 != 0;
    if (a3)
    {
      unint64_t v14 = v18;
      if (v12) {
        goto LABEL_11;
      }
      int v15 = [v18 changedContent];
      uint64_t v10 = *v9;
      uint64_t v16 = *(void *)(*v9 + 8);
      if (!v15)
      {
        *(void *)(v16 + 24) = 0;
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(v16 + 24);
      BOOL v13 = 1;
    }
    unint64_t v14 = v18;
LABEL_11:
    if (!v13 || v12) {
      goto LABEL_17;
    }
    if ([v14 source] == 2)
    {
      int v17 = [v18 changedContent];
      uint64_t v10 = *v9;
      if (v17)
      {
        *(void *)(*(void *)(v10 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v10 = *v9;
LABEL_17:
    *(void *)(*(void *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  if (([v7 options] & 2) == 0 || objc_msgSend(v18, "source") == 2)
  {
    uint64_t v9 = (uint64_t *)(a1 + 32);
    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_40;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_40(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a3)
  {
    int v15 = v7;
    if ([v7 source] == 2 && objc_msgSend(v15, "changedContent"))
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_8;
    }
    uint64_t v10 = (uint64_t *)(a1 + 32);
LABEL_10:
    uint64_t v8 = v15;
    uint64_t v9 = *v10;
LABEL_11:
    *(void *)(*(void *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_12;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = (uint64_t *)(a1 + 32);
  uint64_t v9 = v11;
  if (*(void *)(*(void *)(v11 + 8) + 24)) {
    goto LABEL_11;
  }
  int v15 = v7;
  uint64_t v12 = [v7 asSelection];

  uint64_t v9 = *v10;
  uint64_t v13 = *(void *)(*v10 + 8);
  if (v12)
  {
    *(void *)(v13 + 24) = 0;
LABEL_8:
    uint64_t v8 = v15;
    goto LABEL_12;
  }
  uint64_t v8 = v15;
  if (*(void *)(v13 + 24)) {
    goto LABEL_11;
  }
  if ([v15 source] != 2) {
    goto LABEL_10;
  }
  int v14 = [v15 changedContent];
  uint64_t v9 = *v10;
  uint64_t v8 = v15;
  if (!v14) {
    goto LABEL_11;
  }
  *(void *)(*(void *)(v9 + 8) + 24) = 1;
  *a4 = 1;
LABEL_12:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_41(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_42;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_42(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v7 = [v18 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = (uint64_t *)(a1 + 32);
    uint64_t v10 = v11;
    uint64_t v12 = *(void *)(*(void *)(v11 + 8) + 24);
    BOOL v13 = a3 != 0;
    if (a3)
    {
      int v14 = v18;
      if (v12) {
        goto LABEL_11;
      }
      int v15 = [v18 changedContent];
      uint64_t v10 = *v9;
      uint64_t v16 = *(void *)(*v9 + 8);
      if (!v15)
      {
        *(void *)(v16 + 24) = 0;
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(v16 + 24);
      BOOL v13 = 1;
    }
    int v14 = v18;
LABEL_11:
    if (!v13 || v12) {
      goto LABEL_17;
    }
    if ([v14 source] == 2)
    {
      int v17 = [v18 changedContent];
      uint64_t v10 = *v9;
      if (v17)
      {
        *(void *)(*(void *)(v10 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v10 = *v9;
LABEL_17:
    *(void *)(*(void *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  if (([v7 options] & 4) == 0 || objc_msgSend(v18, "source") == 2)
  {
    uint64_t v9 = (uint64_t *)(a1 + 32);
    goto LABEL_16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_43(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_44;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_44(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = (uint64_t *)(a1 + 32);
    uint64_t v9 = v11;
    if (*(void *)(*(void *)(v11 + 8) + 24)) {
      goto LABEL_12;
    }
    id v18 = v7;
    char v12 = [v7 changedContent];
    uint64_t v9 = *v10;
    uint64_t v13 = *(void *)(*v10 + 8);
    if (v12)
    {
      uint64_t v8 = v18;
      if (!*(void *)(v13 + 24))
      {
        if ([v18 source] == 2)
        {
          int v14 = [v18 changedContent];
          uint64_t v9 = *v10;
          uint64_t v8 = v18;
          if (v14)
          {
            *(void *)(*(void *)(v9 + 8) + 24) = 1;
            *a4 = 1;
            goto LABEL_16;
          }
          goto LABEL_12;
        }
        goto LABEL_11;
      }
LABEL_12:
      *(void *)(*(void *)(v9 + 8) + 24) = 2;
      *a4 = 1;
      goto LABEL_16;
    }
    *(void *)(v13 + 24) = 0;
  }
  else
  {
    id v18 = v7;
    uint64_t v15 = [v7 asDeletion];
    if (!v15 || (uint64_t v16 = (void *)v15, v17 = [v18 source], v16, v17 == 2))
    {
      uint64_t v10 = (uint64_t *)(a1 + 32);
LABEL_11:
      uint64_t v8 = v18;
      uint64_t v9 = *v10;
      goto LABEL_12;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = v18;
LABEL_16:
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  uint64_t v4 = [v3 source];
  BOOL v5 = (unint64_t)(v4 - 4) < 5 || v4 == 1;
  if (!v5
    || (uint64_t v6 = 1,
        [v2 objectAtIndex:1],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 source],
        v7,
        v8 != 3))
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_46(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_47;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_47(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = [v16 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    BOOL v12 = a3 != 0;
    if (a3 && !v11)
    {
      int v13 = [v16 changedContent];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v10 + 8);
      if (!v13)
      {
        *(void *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(v14 + 24);
      BOOL v12 = 1;
    }
    if (v12 && !v11)
    {
      if ([v16 source] == 3)
      {
        int v15 = [v16 changedContent];
        uint64_t v10 = *(void *)(a1 + 32);
        if (v15)
        {
          *(void *)(*(void *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
  }
  else
  {
    char v9 = [v7 options];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      *(void *)(*(void *)(v10 + 8) + 24) = 0;
      goto LABEL_17;
    }
  }
  *(void *)(*(void *)(v10 + 8) + 24) = 2;
  *a4 = 1;
LABEL_17:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_48(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_49;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_49(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = [v16 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    BOOL v12 = a3 != 0;
    if (a3 && !v11)
    {
      int v13 = [v16 changedContent];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v10 + 8);
      if (!v13)
      {
        *(void *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(v14 + 24);
      BOOL v12 = 1;
    }
    if (v12 && !v11)
    {
      if ([v16 source] == 3)
      {
        int v15 = [v16 changedContent];
        uint64_t v10 = *(void *)(a1 + 32);
        if (v15)
        {
          *(void *)(*(void *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
  }
  else
  {
    char v9 = [v7 options];
    uint64_t v10 = *(void *)(a1 + 32);
    if ((v9 & 2) != 0)
    {
      *(void *)(*(void *)(v10 + 8) + 24) = 0;
      goto LABEL_17;
    }
  }
  *(void *)(*(void *)(v10 + 8) + 24) = 2;
  *a4 = 1;
LABEL_17:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_50(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_51;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_51(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = [v16 asInsertion];
  uint64_t v8 = v7;
  if (a3 || !v7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    BOOL v12 = a3 != 0;
    if (a3 && !v11)
    {
      int v13 = [v16 changedContent];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v10 + 8);
      if (!v13)
      {
        *(void *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(v14 + 24);
      BOOL v12 = 1;
    }
    if (v12 && !v11)
    {
      if ([v16 source] == 3)
      {
        int v15 = [v16 changedContent];
        uint64_t v10 = *(void *)(a1 + 32);
        if (v15)
        {
          *(void *)(*(void *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
  }
  else
  {
    char v9 = [v7 options];
    uint64_t v10 = *(void *)(a1 + 32);
    if ((v9 & 4) != 0)
    {
      *(void *)(*(void *)(v10 + 8) + 24) = 0;
      goto LABEL_17;
    }
  }
  *(void *)(*(void *)(v10 + 8) + 24) = 2;
  *a4 = 1;
LABEL_17:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_52(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_53;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_53(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a3)
  {
    uint64_t v14 = v7;
    int v13 = [v7 asDeletion];

    uint64_t v9 = *(void *)(a1 + 32);
    if (!v13)
    {
LABEL_13:
      uint64_t v8 = v14;
      goto LABEL_14;
    }
    *(void *)(*(void *)(v9 + 8) + 24) = 0;
LABEL_11:
    uint64_t v8 = v14;
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(v9 + 8) + 24)) {
    goto LABEL_14;
  }
  uint64_t v14 = v7;
  char v10 = [v7 changedContent];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v9 + 8);
  if ((v10 & 1) == 0)
  {
    *(void *)(v11 + 24) = 0;
    goto LABEL_11;
  }
  uint64_t v8 = v14;
  if (!*(void *)(v11 + 24))
  {
    if ([v14 source] == 3)
    {
      int v12 = [v14 changedContent];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = v14;
      if (v12)
      {
        *(void *)(*(void *)(v9 + 8) + 24) = 1;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    goto LABEL_13;
  }
LABEL_14:
  *(void *)(*(void *)(v9 + 8) + 24) = 2;
  *a4 = 1;
LABEL_15:
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_54(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  if ([v3 source] == 3)
  {
    uint64_t v4 = [v2 objectAtIndex:1];
    uint64_t v5 = [v4 source];
    if ((unint64_t)(v5 - 1) > 7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_186B937A8[v5 - 1];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_55(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  if ([v3 source] == 2)
  {
    uint64_t v4 = [v2 objectAtIndex:1];
    uint64_t v5 = [v4 source];
    if ((unint64_t)(v5 - 1) > 7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_186B937A8[v5 - 1];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_56(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  if ([v3 source] != 7
    || (uint64_t v4 = 1,
        [v2 objectAtIndex:1],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 source],
        v5,
        v6 == 7))
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_57(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_58;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_58(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a3)
  {
    uint64_t v14 = v7;
    int v13 = [v7 asDeletion];

    uint64_t v9 = *(void *)(a1 + 32);
    if (!v13)
    {
LABEL_13:
      uint64_t v8 = v14;
      goto LABEL_14;
    }
    *(void *)(*(void *)(v9 + 8) + 24) = 0;
LABEL_11:
    uint64_t v8 = v14;
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(v9 + 8) + 24)) {
    goto LABEL_14;
  }
  uint64_t v14 = v7;
  char v10 = [v7 changedContent];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v9 + 8);
  if ((v10 & 1) == 0)
  {
    *(void *)(v11 + 24) = 0;
    goto LABEL_11;
  }
  uint64_t v8 = v14;
  if (!*(void *)(v11 + 24))
  {
    if ([v14 source] == 7)
    {
      int v12 = [v14 changedContent];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = v14;
      if (v12)
      {
        *(void *)(*(void *)(v9 + 8) + 24) = 1;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    goto LABEL_13;
  }
LABEL_14:
  *(void *)(*(void *)(v9 + 8) + 24) = 2;
  *a4 = 1;
LABEL_15:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_59(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_60;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_60(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    char v10 = (uint64_t *)(a1 + 32);
    uint64_t v9 = v11;
    if (*(void *)(*(void *)(v11 + 8) + 24)) {
      goto LABEL_17;
    }
    uint64_t v17 = v7;
    char v12 = [v7 changedContent];
    uint64_t v9 = *v10;
    uint64_t v13 = *(void *)(*v10 + 8);
    if (v12)
    {
      uint64_t v8 = v17;
      if (!*(void *)(v13 + 24))
      {
        if ([v17 source] == 2)
        {
          int v14 = [v17 changedContent];
          uint64_t v9 = *v10;
          uint64_t v8 = v17;
          if (v14)
          {
            *(void *)(*(void *)(v9 + 8) + 24) = 1;
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        goto LABEL_16;
      }
LABEL_17:
      *(void *)(*(void *)(v9 + 8) + 24) = 2;
      *a4 = 1;
      goto LABEL_20;
    }
    *(void *)(v13 + 24) = 0;
  }
  else
  {
    uint64_t v17 = v7;
    uint64_t v15 = [v7 source];
    BOOL v16 = (unint64_t)(v15 - 4) < 5 || v15 == 1;
    if (!v16 || ![v17 changedContent])
    {
      char v10 = (uint64_t *)(a1 + 32);
LABEL_16:
      uint64_t v8 = v17;
      uint64_t v9 = *v10;
      goto LABEL_17;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = v17;
LABEL_20:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_61(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_62;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_62(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    char v10 = (uint64_t *)(a1 + 32);
    uint64_t v9 = v11;
    if (*(void *)(*(void *)(v11 + 8) + 24)) {
      goto LABEL_17;
    }
    uint64_t v17 = v7;
    char v12 = [v7 changedContent];
    uint64_t v9 = *v10;
    uint64_t v13 = *(void *)(*v10 + 8);
    if (v12)
    {
      uint64_t v8 = v17;
      if (!*(void *)(v13 + 24))
      {
        if ([v17 source] == 3)
        {
          int v14 = [v17 changedContent];
          uint64_t v9 = *v10;
          uint64_t v8 = v17;
          if (v14)
          {
            *(void *)(*(void *)(v9 + 8) + 24) = 1;
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        goto LABEL_16;
      }
LABEL_17:
      *(void *)(*(void *)(v9 + 8) + 24) = 2;
      *a4 = 1;
      goto LABEL_20;
    }
    *(void *)(v13 + 24) = 0;
  }
  else
  {
    uint64_t v17 = v7;
    uint64_t v15 = [v7 source];
    BOOL v16 = (unint64_t)(v15 - 4) < 5 || v15 == 1;
    if (!v16 || ![v17 changedContent])
    {
      char v10 = (uint64_t *)(a1 + 32);
LABEL_16:
      uint64_t v8 = v17;
      uint64_t v9 = *v10;
      goto LABEL_17;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = v17;
LABEL_20:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_63(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_64;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_64(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (!a3)
  {
    id v15 = v7;
    if ([v7 source] == 3 && objc_msgSend(v15, "changedContent"))
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_17;
    }
    uint64_t v9 = (uint64_t *)(a1 + 32);
LABEL_13:
    uint64_t v8 = *v9;
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = (uint64_t *)(a1 + 32);
  uint64_t v8 = v10;
  if (*(void *)(*(void *)(v10 + 8) + 24)) {
    goto LABEL_15;
  }
  id v15 = v7;
  char v11 = [v7 changedContent];
  uint64_t v8 = *v9;
  uint64_t v12 = *(void *)(*v9 + 8);
  if ((v11 & 1) == 0)
  {
    *(void *)(v12 + 24) = 0;
    goto LABEL_17;
  }
  id v7 = v15;
  if (*(void *)(v12 + 24))
  {
LABEL_15:
    *(void *)(*(void *)(v8 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  uint64_t v13 = [v15 source];
  if ((unint64_t)(v13 - 4) >= 5 && v13 != 1) {
    goto LABEL_13;
  }
  int v14 = [v15 changedContent];
  uint64_t v8 = *v9;
  if (!v14)
  {
LABEL_14:
    id v7 = v15;
    goto LABEL_15;
  }
  *(void *)(*(void *)(v8 + 8) + 24) = 1;
LABEL_17:
  id v7 = v15;
LABEL_18:
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_65(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_66;
  v5[3] = &unk_1E52DEF40;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  BOOL v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_66(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = (uint64_t *)(a1 + 32);
    uint64_t v9 = v11;
    if (*(void *)(*(void *)(v11 + 8) + 24)) {
      goto LABEL_13;
    }
    id v15 = v7;
    char v12 = [v7 changedContent];
    uint64_t v9 = *v10;
    uint64_t v13 = *(void *)(*v10 + 8);
    if (v12)
    {
      uint64_t v8 = v15;
      if (!*(void *)(v13 + 24))
      {
        if ([v15 source] != 7)
        {
          int v14 = [v15 changedContent];
          uint64_t v9 = *v10;
          uint64_t v8 = v15;
          if (v14)
          {
            *(void *)(*(void *)(v9 + 8) + 24) = 1;
            goto LABEL_16;
          }
          goto LABEL_13;
        }
        goto LABEL_12;
      }
LABEL_13:
      *(void *)(*(void *)(v9 + 8) + 24) = 2;
      *a4 = 1;
      goto LABEL_16;
    }
    *(void *)(v13 + 24) = 0;
  }
  else
  {
    id v15 = v7;
    if ([v7 source] != 7 || !objc_msgSend(v15, "changedContent"))
    {
      uint64_t v10 = (uint64_t *)(a1 + 32);
LABEL_12:
      uint64_t v8 = v15;
      uint64_t v9 = *v10;
      goto LABEL_13;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = v15;
LABEL_16:
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_67(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  uint64_t v4 = [v3 source];
  BOOL v5 = (unint64_t)(v4 - 4) < 5 || v4 == 1;
  if (!v5 || ([v3 changedContent] & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v6 = [v2 objectAtIndex:1];
  if ([v6 source] != 3)
  {

    goto LABEL_11;
  }
  id v7 = [v6 asBegan];

  if (!v7)
  {
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = 1;
LABEL_12:

  return v8;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_68(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 firstObject];
  if ([v3 source] != 3) {
    goto LABEL_7;
  }
  uint64_t v4 = [v2 objectAtIndex:1];
  uint64_t v5 = [v4 source];
  if ((unint64_t)(v5 - 4) >= 5 && v5 != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 asBegan];

  if (!v6)
  {
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_69(uint64_t a1, void *a2)
{
  id v2 = [a2 firstObject];
  BOOL v3 = [v2 asInsertion];

  BOOL v5 = [v3 source] == 3 && v3 != 0 && objc_msgSend(v3, "insertedTextLength") != 0;
  return v5;
}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v4 = UITextInputSessionAccidentalDictationCheckForDictationResult(v2);
  BOOL v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = _UITextInputSessionAccidentalDictationOutcomeString([v4 result]);
    *(_DWORD *)buf = 138412546;
    unint64_t v19 = @"com.apple.inputAnalytics.accidentalDictation";
    __int16 v20 = 2112;
    unint64_t v21 = v13;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionDefaultAnalytics][%@] increaseWithActions received result %@ for dictation key", buf, 0x16u);
  }
  uint64_t v6 = UITextInputSessionAccidentalDictationGetAnalyticsPayloadForResult(v2, v4);
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    id v17 = v7;
    AnalyticsSendEventLazy();
    [v3 addObject:v17];
  }
  uint64_t v8 = UITextInputSessionAccidentalDictationCheckForGlobeResult(v2);
  uint64_t v9 = UITextInputSessionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = _UITextInputSessionAccidentalDictationOutcomeString([v8 result]);
    *(_DWORD *)buf = 138412546;
    unint64_t v19 = @"com.apple.inputAnalytics.accidentalDictation";
    __int16 v20 = 2112;
    unint64_t v21 = v14;
    _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionDefaultAnalytics][%@] increaseWithActions received result %@ for globe key", buf, 0x16u);
  }
  uint64_t v10 = UITextInputSessionAccidentalDictationGetAnalyticsPayloadForResult(v2, v8);
  uint64_t v11 = v10;
  if (v10 && [v10 count])
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    id v16 = v11;
    AnalyticsSendEventLazy();
    objc_msgSend(v3, "addObject:", v16, v15, 3221225472, __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_422, &unk_1E52DEF88);
  }
  return v3;
}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_420(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_422(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)addEndingObserver:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)__endingObservers;
  id v7 = v3;
  if (!__endingObservers)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = (void *)__endingObservers;
    __endingObservers = v5;

    id v3 = v7;
    uint64_t v4 = (void *)__endingObservers;
  }
  [v4 addObject:v3];
}

+ (void)removeEndingObserver:(id)a3
{
}

+ (void)q_notifyStartingObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)__endingObservers;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "didBeginSession", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (void)q_notifyEndingObserversWithSessionAnalytics:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)__endingObservers;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [v9 matchingAccumulatorNames];
        long long v11 = (void *)v3[3];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke;
        v13[3] = &unk_1E52F1D70;
        id v14 = v10;
        uint64_t v15 = v9;
        id v12 = v10;
        [v11 enumerateObjectsUsingBlock:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

void __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 name];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke_2;
    v6[3] = &unk_1E52F1D48;
    v6[4] = *(void *)(a1 + 40);
    id v7 = v3;
    [v7 enumerateAnalytics:v6];
  }
}

void __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) name];
    [v3 didEndMatchingAccumulatorName:v4];
  }
}

+ (id)sharedPunctuationCharacterSet
{
  if (qword_1EB260E58 != -1) {
    dispatch_once(&qword_1EB260E58, &__block_literal_global_286);
  }
  id v2 = (void *)qword_1EB260E50;
  return v2;
}

void __66__UITextInputSessionActionAnalytics_sharedPunctuationCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  v1 = (void *)qword_1EB260E50;
  qword_1EB260E50 = v0;
}

- (id)getAppBundleId
{
  if (+[UIKeyboard inputUIOOP]
    && +[UIKeyboard isKeyboardProcess])
  {
    id v2 = +[UIKeyboard keyboardBundleIdentifier];
  }
  else
  {
    id v2 = _UIMainBundleIdentifier();
  }
  return v2;
}

- (UITextInputSessionActionAnalytics)init
{
  v23.receiver = self;
  v23.super_class = (Class)UITextInputSessionActionAnalytics;
  id v2 = [(UITextInputSessionActionAnalytics *)&v23 init];
  id v3 = v2;
  if (v2)
  {
    v2->_maxDepth = 0;
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.UIKit.UITextInputSessionActionAnalytics", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:20];
    recentActions = v3->_recentActions;
    v3->_recentActions = (NSMutableOrderedSet *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:100];
    accumulators = v3->_accumulators;
    v3->_accumulators = (NSMutableSet *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:10];
    efficacyAccumulators = v3->_efficacyAccumulators;
    v3->_efficacyAccumulators = (NSMutableSet *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    dynamicAccumulators = v3->_dynamicAccumulators;
    v3->_dynamicAccumulators = (NSMutableSet *)v13;

    v3->_trackingDuration = 0;
    v3->_allowCursorMovementCounter = 0;
    v3->_overrideSource = 0;
    v3->_useOverrideSourceCounter = 0;
    if (_MergedGlobals_1093)
    {
      [(id)_MergedGlobals_1093 setAnalyticsDelegate:v3];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__UITextInputSessionActionAnalytics_init__block_invoke;
      block[3] = &unk_1E52D9F70;
      uint64_t v22 = v3;
      if (qword_1EB260E60 != -1) {
        dispatch_once(&qword_1EB260E60, block);
      }
    }
    overrideInputModeString = v3->_overrideInputModeString;
    v3->_overrideInputModeString = 0;

    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v3 selector:sel_writeAnalytics name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v16 addObserver:v3 selector:sel_didBegin name:@"UIApplicationDidBecomeActiveNotification" object:0];
    if (!+[UIKeyboard inputUIOOP]
      || +[UIKeyboard isKeyboardProcess])
    {
      [v16 addObserver:v3 selector:sel_didDictationEnd name:@"UIDictationControllerDictationDidFinish" object:0];
    }
    long long v17 = v3->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__UITextInputSessionActionAnalytics_init__block_invoke_57;
    v19[3] = &unk_1E52D9F70;
    __int16 v20 = v3;
    dispatch_async(v17, v19);
  }
  return v3;
}

void __41__UITextInputSessionActionAnalytics_init__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc((Class)getIATextInputActionsAnalyticsClass()) initWithAnalyticsMetadataObserver:*(void *)(a1 + 32)];
  id v2 = (void *)_MergedGlobals_1093;
  _MergedGlobals_1093 = v1;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = UITextInputSessionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI compatible", buf, 2u);
    }
  }
  else
  {
    id v4 = UITextInputSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_debug_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI not compatible", v5, 2u);
    }

    id v3 = _MergedGlobals_1093;
    _MergedGlobals_1093 = 0;
  }
}

void __41__UITextInputSessionActionAnalytics_init__block_invoke_57(uint64_t a1)
{
  v8[10] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "q_setupDefaultAnalytics");
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v8[0] = @"DictationBegan";
  v8[1] = @"Insertion";
  v8[2] = @"EmojiCount";
  v8[3] = @"Dictation to Keyboard";
  v8[4] = @"Dictation to Emoji";
  v8[5] = @"Dictation to Punctuation";
  v8[6] = @"Dictation to Whitespace";
  v8[7] = @"Dictation to Deletion";
  v8[8] = @"ModelessUsedAtLeastOnce";
  v8[9] = @"PunctuationCount";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  id v4 = (void *)[v2 initWithArray:v3];

  objc_msgSend(*(id *)(a1 + 32), "q_setSeparateCycleAccumulatorNames:", v4);
  dispatch_queue_t v5 = [*(id *)(a1 + 32) delegateSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegateSource];
    [v7 _didFinishInit];
  }
}

- (UITextInputSessionActionAnalytics)initWithEventHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(UITextInputSessionActionAnalytics *)self init];
  uint64_t v6 = [objc_alloc((Class)getIATextInputActionsAnalyticsClass()) initWithAnalyticsMetadataObserver:v5 withEventHandler:v4];

  uint64_t v7 = (void *)_MergedGlobals_1093;
  _MergedGlobals_1093 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI compatible", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = UITextInputSessionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI not compatible", v11, 2u);
    }

    long long v8 = _MergedGlobals_1093;
    _MergedGlobals_1093 = 0;
  }

  return v5;
}

- (void)incrementAllowCursorMovementCount
{
}

- (void)decrementAllowCursorMovementCount
{
  unint64_t allowCursorMovementCounter = self->_allowCursorMovementCounter;
  if (allowCursorMovementCounter) {
    self->_unint64_t allowCursorMovementCounter = allowCursorMovementCounter - 1;
  }
}

- (void)enumerateAnalytics:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke;
    v7[3] = &unk_1E52DA160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_flushRecentActions");
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke_2;
  v8[3] = &unk_1E52F1D98;
  id v9 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v8];
  objc_msgSend((id)objc_opt_class(), "q_notifyEndingObserversWithSessionAnalytics:", *(void *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) delegateSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    dispatch_queue_t v5 = [*(id *)(a1 + 32) delegateSource];
    [v5 _didEndEnumeratingAnalytics];
  }
  uint64_t v6 = UITextInputSessionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] enumerateAnalytics: Completed queued publishing", v7, 2u);
  }
}

uint64_t __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enumerateAnalytics:*(void *)(a1 + 32)];
}

- (id)allAccumulatorNames
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_accumulators, "count"));
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__UITextInputSessionActionAnalytics_allAccumulatorNames__block_invoke;
  v9[3] = &unk_1E52D9F98;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __56__UITextInputSessionActionAnalytics_allAccumulatorNames__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "name", (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)q_setSeparateCycleAccumulatorNames:(id)a3
{
}

- (void)enumerateSeparateCycleAnalytics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke;
    v7[3] = &unk_1E52DA160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke_2;
  v5[3] = &unk_1E52F1DC0;
  v5[4] = v1;
  id v6 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v5];
  uint64_t v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] enumerateSeparateCycleAnalytics: Completed queued publishing", v4, 2u);
  }
}

void __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = v3;
  uint64_t v5 = [v3 name];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [v6 enumerateAnalytics:*(void *)(a1 + 40)];
  }
}

- (id)allEfficacyAccumulatorNames
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_efficacyAccumulators, "count"));
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__UITextInputSessionActionAnalytics_allEfficacyAccumulatorNames__block_invoke;
  v9[3] = &unk_1E52D9F98;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __64__UITextInputSessionActionAnalytics_allEfficacyAccumulatorNames__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "name", (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)writeAnalytics
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [(UITextInputSessionActionAnalytics *)self sessionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] writeAnalytics for sessionIdentifier=%@", buf, 0xCu);
  }
  [(UITextInputSessionActionAnalytics *)self didSessionEnd];
  +[UIKBAnalyticsDispatcher sessionAnalyticsEnded:self];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke(uint64_t a1)
{
  id v2 = UITextInputSessionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] writeAnalytics: queued accumulator reset starting", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) enumerateObjectsUsingBlock:&__block_literal_global_68];
  [*(id *)(*(void *)(a1 + 32) + 32) enumerateObjectsUsingBlock:&__block_literal_global_71_3];
  return [*(id *)(*(void *)(a1 + 32) + 40) enumerateObjectsUsingBlock:&__block_literal_global_74];
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_66(uint64_t a1, void *a2)
{
  return [a2 reset];
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reset];
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)addAccumulator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__UITextInputSessionActionAnalytics_addAccumulator___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__UITextInputSessionActionAnalytics_addAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addAccumulator:", *(void *)(a1 + 40));
}

- (void)q_addAccumulator:(id)a3
{
  unint64_t maxDepth = self->_maxDepth;
  id v8 = a3;
  uint64_t v5 = [v8 depthRange];
  unint64_t v7 = v5 + v6;
  if (maxDepth > v5 + v6) {
    unint64_t v7 = maxDepth;
  }
  self->_unint64_t maxDepth = v7;
  [(NSMutableSet *)self->_accumulators addObject:v8];
}

- (id)q_copyAccumulatorWithName:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__115;
  long long v19 = __Block_byref_object_dispose__115;
  id v20 = 0;
  accumulators = self->_accumulators;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __63__UITextInputSessionActionAnalytics_q_copyAccumulatorWithName___block_invoke;
  long long v12 = &unk_1E52F1E48;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v15;
  [(NSMutableSet *)accumulators enumerateObjectsWithOptions:2 usingBlock:&v9];
  unint64_t v7 = objc_msgSend((id)v16[5], "copy", v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __63__UITextInputSessionActionAnalytics_q_copyAccumulatorWithName___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 name];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)addEfficacyAccumulator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__UITextInputSessionActionAnalytics_addEfficacyAccumulator___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __60__UITextInputSessionActionAnalytics_addEfficacyAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addEfficacyAccumulator:", *(void *)(a1 + 40));
}

- (void)q_addEfficacyAccumulator:(id)a3
{
}

- (void)addDynamicAccumulator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__UITextInputSessionActionAnalytics_addDynamicAccumulator___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__UITextInputSessionActionAnalytics_addDynamicAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addDynamicAccumulator:", *(void *)(a1 + 40));
}

- (void)q_addDynamicAccumulator:(id)a3
{
}

- (id)getDynamicAccumulatorWithName:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.name == %@", a3];
  uint64_t v5 = [(NSMutableSet *)self->_dynamicAccumulators filteredSetUsingPredicate:v4];
  if ([v5 count])
  {
    id v6 = [v5 anyObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)getEfficacyAccumulatorWithName:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.name == %@", a3];
  uint64_t v5 = [(NSMutableSet *)self->_efficacyAccumulators filteredSetUsingPredicate:v4];
  if ([v5 count])
  {
    id v6 = [v5 anyObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)q_addActionAndUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableOrderedSet *)self->_recentActions firstObject];
    uint64_t v6 = [v5 mergeActionIfPossible:v4];
    int v7 = UITextInputSessionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218498;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      long long v11 = v5;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] q_addActionAndUpdate: Merge result %lu lastAction:%@ newAction:%@", (uint8_t *)&v8, 0x20u);
    }

    if (v5)
    {
      if (v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      [(UITextInputSessionActionAnalytics *)self q_updateAnalyticsFromAccumulators];
      if ([(NSMutableOrderedSet *)self->_recentActions count] > self->_maxDepth) {
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentActions, "removeObjectsInRange:");
      }
    }
    [(NSMutableOrderedSet *)self->_recentActions insertObject:v4 atIndex:0];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)q_updateAnalyticsFromAccumulators
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableOrderedSet *)self->_recentActions count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = self->_accumulators;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v9 depthRange] <= v3) {
          [v9 increaseWithActions:self->_recentActions];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  if (v3)
  {
    __int16 v10 = [(NSMutableOrderedSet *)self->_recentActions firstObject];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v11 = self->_efficacyAccumulators;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * j) increaseWithAction:v10];
        }
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v13);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v16 = self->_dynamicAccumulators;
  uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v22 + 1) + 8 * k);
        if (objc_msgSend(v21, "depthRange", (void)v22) <= v3) {
          [v21 increaseWithActions:self->_recentActions];
        }
      }
      uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)q_flushRecentActions
{
  [(UITextInputSessionActionAnalytics *)self q_updateAnalyticsFromAccumulators];
  recentActions = self->_recentActions;
  [(NSMutableOrderedSet *)recentActions removeAllObjects];
}

- (int64_t)_getActiveTextInputSource
{
  unint64_t v3 = [(UITextInputSessionActionAnalytics *)self delegateSource];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = [(UITextInputSessionActionAnalytics *)self delegateSource];
  uint64_t v6 = v5;
  if (v4)
  {
    int64_t v7 = [v5 _overrideTextInputSource];
  }
  else
  {
    int v8 = [v5 _delegateAsResponder];

    if (objc_opt_respondsToSelector()) {
      int64_t v7 = [v8 _textInputSource];
    }
    else {
      int64_t v7 = 0;
    }
    uint64_t v6 = v8;
  }

  return v7;
}

- (id)_instanceOfActionClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v5 = objc_alloc_init(a3);
    objc_msgSend(v5, "setSource:", -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource"));
    if (+[UIKeyboard isShowingEmojiSearch]) {
      objc_msgSend(v5, "setFlagOptions:", objc_msgSend(v5, "flagOptions") | 1);
    }
    uint64_t v6 = [(UITextInputSessionActionAnalytics *)self getAppBundleId];
    [v5 setAppBundleId:v6];

    +[UITextInputSessionActionAnalytics populateActionInputMode:v5];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setSessionIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v9) = 0;
    _os_log_fault_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "UITextInputSessionActionAnalytics is nil", (uint8_t *)&v9, 2u);
  }
  if (([(NSUUID *)self->_sessionIdentifier isEqual:v4] & 1) == 0)
  {
    id v5 = UITextInputSessionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sessionIdentifier = self->_sessionIdentifier;
      int v9 = 138412546;
      __int16 v10 = sessionIdentifier;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] setSessionIdentifier:%@ -> %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v6 = (NSUUID *)[v4 copy];
  int64_t v7 = self->_sessionIdentifier;
  self->_sessionIdentifier = v6;
}

- (void)_performWithTextInputActionsSource:(int64_t)a3 block:(id)a4
{
  int64_t overrideSource = self->_overrideSource;
  int64_t v6 = self->_useOverrideSourceCounter + 1;
  self->_int64_t overrideSource = a3;
  self->_useOverrideSourceCounter = v6;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  int64_t v7 = self->_useOverrideSourceCounter - 1;
  self->_int64_t overrideSource = overrideSource;
  self->_useOverrideSourceCounter = v7;
}

- (void)_performWithInputModeOverride:(id)a3 block:(id)a4
{
  int64_t v6 = (NSString *)a3;
  int64_t v7 = self->_overrideInputModeString;
  overrideInputModeString = self->_overrideInputModeString;
  self->_overrideInputModeString = v6;
  __int16 v11 = v6;
  int v9 = (void (**)(void))a4;

  v9[2](v9);
  __int16 v10 = self->_overrideInputModeString;
  self->_overrideInputModeString = v7;
}

- (void)didBegin
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __int16 v10 = [(UITextInputSessionActionAnalytics *)self sessionIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v10;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didBegin: sessionIdentifier=%@", buf, 0xCu);
  }
  id v4 = [(UITextInputSessionActionAnalytics *)self delegateSource];
  id v5 = [v4 _sessionIdentifier];
  [(UITextInputSessionActionAnalytics *)self setSessionIdentifier:v5];

  int64_t v6 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v7 = [v6 asBegan];

  [(id)_MergedGlobals_1093 didSessionBegin];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__UITextInputSessionActionAnalytics_didBegin__block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(queue, v11);
}

uint64_t __45__UITextInputSessionActionAnalytics_didBegin__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v1, "q_notifyStartingObservers");
}

- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9
{
  double y = a7.y;
  double x = a7.x;
  double v13 = a6.y;
  double v14 = a6.x;
  double height = a5.height;
  double width = a5.width;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v20 = UITextInputSessionLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    long long v27 = +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonPressResult:a3];
    long long v28 = +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonType:a4];
    *(_DWORD *)buf = 138414338;
    v44 = v27;
    __int16 v45 = 2112;
    v46 = v28;
    __int16 v47 = 2048;
    double v48 = width;
    __int16 v49 = 2048;
    double v50 = height;
    __int16 v51 = 2048;
    double v52 = v14;
    __int16 v53 = 2048;
    double v54 = v13;
    __int16 v55 = 2048;
    double v56 = x;
    __int16 v57 = 2048;
    double v58 = y;
    __int16 v59 = 2048;
    double v60 = a8;
    _os_log_debug_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didKeyboardDockItemButtonPress:%@ buttonType:%@ buttonSize:(%fw %fh) touchDown:(%f,%f) touchUp:(%f,%f) touchDuration:%f", buf, 0x5Cu);
  }
  uint64_t v21 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  long long v22 = [v21 asKeyboardDockItemButtonPress];

  [v22 setSource:a9];
  +[UITextInputSessionActionAnalytics populateActionInputMode:v22];
  [v22 setButtonPressResult:a3];
  [v22 setButtonType:a4];
  objc_msgSend(v22, "setUiOrientation:", objc_msgSend((id)UIApp, "activeInterfaceOrientation"));
  objc_msgSend(v22, "setButtonSize:", width, height);
  objc_msgSend(v22, "setTouchDownPoint:", v14, v13);
  objc_msgSend(v22, "setTouchUpPoint:", x, y);
  [v22 setTouchDuration:a8];
  int64_t v23 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:](UIInputAnalyticsTranslator, "iaTextInputActionsSourceFor:", [v22 textInputActionsSource]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke;
  v31[3] = &unk_1E52F1E70;
  unint64_t v33 = a3;
  unint64_t v34 = a4;
  double v35 = width;
  double v36 = height;
  double v37 = v14;
  double v38 = v13;
  double v39 = x;
  double v40 = y;
  double v41 = a8;
  int64_t v42 = v23;
  id v24 = v22;
  id v32 = v24;
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:v23 block:v31];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke_2;
  block[3] = &unk_1E52D9F98;
  void block[4] = self;
  id v30 = v24;
  id v26 = v24;
  dispatch_async(queue, block);
}

uint64_t __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke(uint64_t a1)
{
  id v2 = (void *)_MergedGlobals_1093;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 112);
  int64_t v7 = +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:](UIInputAnalyticsTranslator, "iaTextInputActionsTypeFor:", [*(id *)(a1 + 32) textInputActionsType]);
  int64_t v8 = +[UIInputAnalyticsTranslator iaInterfaceOrientationFor:](UIInputAnalyticsTranslator, "iaInterfaceOrientationFor:", [*(id *)(a1 + 32) uiOrientation]);
  double v9 = *(double *)(a1 + 56);
  double v10 = *(double *)(a1 + 64);
  double v11 = *(double *)(a1 + 72);
  double v12 = *(double *)(a1 + 80);
  double v13 = *(double *)(a1 + 88);
  double v14 = *(double *)(a1 + 96);
  return objc_msgSend(v2, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:inputType:uiInterfaceOrientation:", v4, v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v5);
}

uint64_t __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v1, "q_notifyStartingObservers");
}

- (void)didGlomojiTap:(unint64_t)a3 originalInputMode:(id)a4 newInputMode:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  unint64_t v8 = +[UIInputAnalyticsTranslator iaGlomojiButtonTypeFor:a3];
  if (objc_opt_respondsToSelector())
  {
    [(id)_MergedGlobals_1093 didGlomojiTap:v8 originalInputMode:v9 newInputMode:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(id)_MergedGlobals_1093 didGlomojiTap:v9 newInputMode:v7];
  }
}

- (void)didKBMenuAppear:(unint64_t)a3 originalInputMode:(id)a4
{
  id v6 = a4;
  unint64_t v5 = +[UIInputAnalyticsTranslator iaGlomojiButtonTypeFor:a3];
  if (objc_opt_respondsToSelector())
  {
    [(id)_MergedGlobals_1093 didKBMenuAppear:v5 originalInputMode:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(id)_MergedGlobals_1093 didKBMenuAppear:v6];
  }
}

- (void)didKBMenuInteraction:(unint64_t)a3 selectedAction:(unint64_t)a4 newInputMode:(id)a5
{
  id v9 = a5;
  unint64_t v7 = +[UIInputAnalyticsTranslator iaGlomojiSourceTypeFor:a3];
  unint64_t v8 = +[UIInputAnalyticsTranslator iaGlomojiSelectedActionTypeFor:a4];
  if (objc_opt_respondsToSelector()) {
    [(id)_MergedGlobals_1093 didKBMenuInteraction:v7 selectedAction:v8 newInputMode:v9];
  }
}

- (void)didKBMenuDismiss:(unint64_t)a3
{
  unint64_t v3 = +[UIInputAnalyticsTranslator iaGlomojiSourceTypeFor:a3];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = (void *)_MergedGlobals_1093;
    [v4 didKBMenuDismiss:v3];
  }
}

- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v7 = UITextInputSessionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDictationBegin", buf, 2u);
  }

  unint64_t v8 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  id v9 = [v8 asDictationBegan];

  [v9 setSource:2];
  [(id)_MergedGlobals_1093 didDictationBegin:v5 usesMultiModalDictation:v4];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UITextInputSessionActionAnalytics_didDictationBegin_usesMultiModalDictation___block_invoke;
  block[3] = &unk_1E52DD128;
  BOOL v15 = v5;
  BOOL v16 = v4;
  id v13 = v9;
  double v14 = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

uint64_t __79__UITextInputSessionActionAnalytics_didDictationBegin_usesMultiModalDictation___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  unint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setDictationBeganCount:1];
    if (*(unsigned char *)(a1 + 49)) {
      [*(id *)(a1 + 32) setMultiModalDictationBeganCount:1];
    }
  }
  else
  {
    [v3 setModelessUsedAtLeastOnceCount:1];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "q_addActionAndUpdate:", v5);
}

- (void)didDictationEnd
{
  unint64_t v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDictationEnd", buf, 2u);
  }

  BOOL v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  uint64_t v5 = [v4 asDictationEnded];

  [(id)_MergedGlobals_1093 didDictationEnd];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__UITextInputSessionActionAnalytics_didDictationEnd__block_invoke;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __52__UITextInputSessionActionAnalytics_didDictationEnd__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v1, "q_notifyStartingObservers");
}

- (unint64_t)_optionsForText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    unint64_t v5 = v4;
    if (qword_1EB260E70 != -1) {
      dispatch_once(&qword_1EB260E70, &__block_literal_global_103_0);
    }
    uint64_t v6 = [v3 rangeOfCharacterFromSet:qword_1EB260E68];
    unint64_t v7 = 4 * (v6 != 0x7FFFFFFFFFFFFFFFLL);
    if (v5 > 1 || v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = [(id)objc_opt_class() sharedPunctuationCharacterSet];
      uint64_t v9 = [v3 rangeOfCharacterFromSet:v8];

      if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v7 |= 2uLL, v5 >= 2)) {
        v7 |= [v3 _containsEmoji];
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void __53__UITextInputSessionActionAnalytics__optionsForText___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v1 = (void *)qword_1EB260E68;
  qword_1EB260E68 = v0;
}

- (unint64_t)_emojiCountForText:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if ([v3 length] && objc_msgSend(v3, "_containsEmoji"))
  {
    uint64_t v4 = [v3 length];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__UITextInputSessionActionAnalytics__emojiCountForText___block_invoke;
    v7[3] = &unk_1E52F1E98;
    v7[4] = &v8;
    objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v7);
  }
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__UITextInputSessionActionAnalytics__emojiCountForText___block_invoke(uint64_t result)
{
  return result;
}

- (unint64_t)_normalizedTextLength:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([v3 length] && objc_msgSend(v3, "_containsEmoji"))
  {
    uint64_t v4 = [v3 length];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__UITextInputSessionActionAnalytics__normalizedTextLength___block_invoke;
    v8[3] = &unk_1E52F1EC0;
    void v8[4] = &v13;
    void v8[5] = &v9;
    objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v8);
    uint64_t v5 = [v3 length];
    unint64_t v6 = v5 - v10[3] + v14[3];
  }
  else
  {
    unint64_t v6 = [v3 length];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __59__UITextInputSessionActionAnalytics__normalizedTextLength___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) += a4;
  return result;
}

- (unint64_t)_punctuationCountForText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [v3 length];
    uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithString:v3];
    objc_msgSend(v5, "_removeCharactersFromSet:", objc_msgSend((id)objc_opt_class(), "sharedPunctuationCharacterSet"));
    unint64_t v6 = v4 - [v5 length];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (void)populateActionInputMode:(id)a3 withLanguage:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v9 = [v8 currentInputMode];
    id v7 = [v9 identifierWithLayouts];

    if (!v7) {
      goto LABEL_8;
    }
  }
  uint64_t v10 = TIInputModeGetLanguage();
  [v18 setLanguage:v10];

  uint64_t v11 = TIInputModeGetRegion();
  [v18 setRegion:v11];

  uint64_t v12 = TIInputModeGetVariant();
  [v18 setKeyboardVariant:v12];

  if ([v18 source] == 4)
  {
    uint64_t v13 = TIInputModeGetComponentsFromIdentifier();
    double v14 = [v13 objectForKey:@"hw"];
    [v18 setKeyboardLayout:v14];
  }
  else
  {
    uint64_t v13 = TIInputModeGetSWLayout();
    [v18 setKeyboardLayout:v13];
  }

LABEL_8:
  uint64_t v15 = +[UIKeyboardImpl activeInstance];
  uint64_t v16 = [v15 inputDelegateManager];
  int v17 = [v16 hasAsyncCapableInputDelegate];

  if (v17) {
    [v18 setKeyboardType:@"Web"];
  }
}

+ (void)populateActionInputMode:(id)a3
{
}

- (id)_textInsertionActionForText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  uint64_t v12 = [v11 asInsertion];

  objc_msgSend(v12, "setRelativeRangeBefore:", location, length);
  if (v9)
  {
    objc_msgSend(v12, "setInsertedTextLength:", -[UITextInputSessionActionAnalytics _normalizedTextLength:](self, "_normalizedTextLength:", v9));
    objc_msgSend(v12, "setOptions:", -[UITextInputSessionActionAnalytics _optionsForText:](self, "_optionsForText:", v9));
    objc_msgSend(v12, "setInsertedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v9));
    objc_msgSend(v12, "setInsertedPunctuationCount:", -[UITextInputSessionActionAnalytics _punctuationCountForText:](self, "_punctuationCountForText:", v9));
  }
  if (v10) {
    +[UITextInputSessionActionAnalytics populateActionInputMode:v12 withLanguage:v10];
  }

  return v12;
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = UITextInputSessionLog();
  uint64_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      NSUInteger v23 = (NSUInteger)v9;
      __int16 v24 = 2048;
      NSUInteger v25 = location;
      __int16 v26 = 2048;
      NSUInteger v27 = length;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) withLanguage:%@", buf, 0x2Au);
    }

    uint64_t v13 = -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v9, location, length, v10);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __84__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_withLanguage___block_invoke;
    int v17 = &unk_1E52E05A8;
    id v18 = v9;
    id v19 = v13;
    NSUInteger v20 = location;
    NSUInteger v21 = length;
    uint64_t v12 = v13;
    [(UITextInputSessionActionAnalytics *)self _performWithInputModeOverride:v10 block:&v14];
    -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v12, length, v10, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    NSUInteger v23 = location;
    __int16 v24 = 2048;
    NSUInteger v25 = length;
    __int16 v26 = 2112;
    NSUInteger v27 = (NSUInteger)v10;
    _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) withLanguage:%@ called with nil text", buf, 0x20u);
  }
}

uint64_t __84__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_withLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_MergedGlobals_1093, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "textInputActionsType"), *(void *)(a1 + 48), *(void *)(a1 + 56), 0, 0, 0);
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = UITextInputSessionLog();
  uint64_t v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      NSUInteger v28 = (NSUInteger)v11;
      __int16 v29 = 2048;
      NSUInteger v30 = location;
      __int16 v31 = 2048;
      NSUInteger v32 = length;
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_debug_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) selectedTextBefore:'%@' withLanguage:%@", buf, 0x34u);
    }

    if ([v12 length]) {
      [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardText:v12 shouldOverrideInputActionCountToZero:1 withLanguage:v13];
    }
    uint64_t v16 = -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v11, location, length, v13);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke;
    NSUInteger v20 = &unk_1E52F1EE8;
    id v21 = v16;
    long long v22 = self;
    id v23 = v11;
    NSUInteger v25 = location;
    NSUInteger v26 = length;
    id v24 = v12;
    uint64_t v15 = v16;
    [(UITextInputSessionActionAnalytics *)self _performWithInputModeOverride:v13 block:&v17];
    -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v15, 0, v13, v17, v18, v19, v20);
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    NSUInteger v28 = location;
    __int16 v29 = 2048;
    NSUInteger v30 = length;
    __int16 v31 = 2112;
    NSUInteger v32 = (NSUInteger)v12;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) selectedTextBefore:'%@' withLanguage:%@ called with nil text", buf, 0x2Au);
  }
}

void __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) flagOptions] & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "source") == 5)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke_2;
    v3[3] = &unk_1E52E05A8;
    int v2 = *(void **)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 64);
    id v5 = *(id *)(a1 + 56);
    [v2 _performWithTextInputActionsSource:4 block:v3];
  }
  else
  {
    objc_msgSend((id)_MergedGlobals_1093, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "textInputActionsType"), *(void *)(a1 + 64), *(void *)(a1 + 72), 0, *(void *)(a1 + 56), 0);
  }
}

uint64_t __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke_2(void *a1)
{
  objc_msgSend((id)_MergedGlobals_1093, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", a1[4], 1, a1[6], a1[7], 0, a1[5], 0);
  uint64_t v1 = (void *)_MergedGlobals_1093;
  return [v1 didInsertionKeyPressOfKey:0 withType:1];
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4
{
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withNumAlternatives:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = UITextInputSessionLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      NSUInteger v13 = (NSUInteger)v9;
      __int16 v14 = 2048;
      NSUInteger v15 = location;
      __int16 v16 = 2048;
      int64_t v17 = length;
      __int16 v18 = 2048;
      int64_t v19 = a5;
      _os_log_debug_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) withNumAlternatives:%ld", buf, 0x2Au);
    }

    id v11 = -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v9, location, length, 0);
    [v11 setWithAlternativesCount:a5 > 0];
    objc_msgSend((id)_MergedGlobals_1093, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", v9, -[NSObject textInputActionsType](v11, "textInputActionsType"), location, length, 0, 0, 0);
    [(UITextInputSessionActionAnalytics *)self _didInsertTextAction:v11 numCharsDeleted:length withLanguage:0];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218496;
    NSUInteger v13 = location;
    __int16 v14 = 2048;
    NSUInteger v15 = length;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    _os_log_error_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) withNumAlternatives:%ld called with nil text", buf, 0x20u);
  }
}

- (void)_didInsertTextAction:(id)a3 numCharsDeleted:(unint64_t)a4 withLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4) {
    [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardCount:a4 shouldOverrideInputActionCountToZero:1 withLanguage:v9];
  }
  if (([v8 flagOptions] & 1) != 0 && objc_msgSend(v8, "source") == 5)
  {
    [v8 setSource:1];
    +[UITextInputSessionActionAnalytics populateActionInputMode:v8];
    if ([v8 insertedEmojiCount] == 1 && objc_msgSend(v8, "insertedTextLength") == 1) {
      [v8 setInputActionCountFromMergedActions:1];
    }
  }
  queue = self->_queue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __87__UITextInputSessionActionAnalytics__didInsertTextAction_numCharsDeleted_withLanguage___block_invoke;
  NSUInteger v15 = &unk_1E52D9F98;
  __int16 v16 = self;
  id v17 = v8;
  id v11 = v8;
  dispatch_async(queue, &v12);
  [(UITextInputSessionActionAnalytics *)self beginTrackingSessionDurationIfNecessary];
}

uint64_t __87__UITextInputSessionActionAnalytics__didInsertTextAction_numCharsDeleted_withLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)_didDeleteBackwardCount:(unint64_t)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5
{
  BOOL v5 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = UITextInputSessionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    unint64_t v13 = a3;
    _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteBackwardCount:%lu", (uint8_t *)&v12, 0xCu);
  }

  id v10 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  id v11 = [v10 asDeletion];

  [v11 setRemovedTextLength:a3];
  if (v5) {
    objc_msgSend(v11, "setInputActionCountFromMergedActions:", -objc_msgSend(v11, "inputActionCount"));
  }
  if (v8) {
    +[UITextInputSessionActionAnalytics populateActionInputMode:v11 withLanguage:v8];
  }
  [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardAction:v11];
}

- (void)didDeleteBackwardCount:(unint64_t)a3
{
  [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardCount:a3 shouldOverrideInputActionCountToZero:0 withLanguage:0];
  BOOL v5 = (void *)_MergedGlobals_1093;
  int64_t v6 = [(UITextInputSessionActionAnalytics *)self _getActiveTextInputSource];
  uint64_t v7 = 0;
  if ((unint64_t)(v6 - 1) <= 7) {
    uint64_t v7 = qword_186B97B10[v6 - 1];
  }
  int64_t v8 = +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:v7];
  [v5 didDeleteBackwardCount:a3 withType:v8];
}

- (void)_didDeleteBackwardText:(id)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5
{
  BOOL v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = UITextInputSessionLog();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_debug_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteBackwardText:'%@'", (uint8_t *)&v13, 0xCu);
    }

    int v12 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
    id v11 = [v12 asDeletion];

    [v11 setRemovedTextLength:[(UITextInputSessionActionAnalytics *)self _normalizedTextLength:v8]];
    [v11 setRemovedEmojiCount:[(UITextInputSessionActionAnalytics *)self _emojiCountForText:v8]];
    [v11 setOptions:[(UITextInputSessionActionAnalytics *)self _optionsForText:v8]];
    if (v9) {
      +[UITextInputSessionActionAnalytics populateActionInputMode:v11 withLanguage:v9];
    }
    if (v6) {
      -[NSObject setInputActionCountFromMergedActions:](v11, "setInputActionCountFromMergedActions:", -[v11 inputActionCount]);
    }
    [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardAction:v11];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v13) = 0;
    _os_log_error_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didDeleteBackwardText: called with nil text", (uint8_t *)&v13, 2u);
  }
}

- (void)didDeleteBackwardText:(id)a3
{
  id v7 = a3;
  -[UITextInputSessionActionAnalytics _didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:](self, "_didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:");
  id v4 = (void *)_MergedGlobals_1093;
  int64_t v5 = [(UITextInputSessionActionAnalytics *)self _getActiveTextInputSource];
  uint64_t v6 = 0;
  if ((unint64_t)(v5 - 1) <= 7) {
    uint64_t v6 = qword_186B97B10[v5 - 1];
  }
  objc_msgSend(v4, "didDeleteBackwardText:withType:", v7, +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:](UIInputAnalyticsTranslator, "iaTextInputActionsTypeFor:", v6));
}

- (void)_didDeleteBackwardAction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __62__UITextInputSessionActionAnalytics__didDeleteBackwardAction___block_invoke;
  id v10 = &unk_1E52D9F98;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(queue, &v7);
  [(UITextInputSessionActionAnalytics *)self beginTrackingSessionDurationIfNecessary];
}

uint64_t __62__UITextInputSessionActionAnalytics__didDeleteBackwardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3.length != a4.length || a3.location != a4.location)
  {
    unint64_t v9 = [(UITextInputSessionActionAnalytics *)self allowCursorMovementCounter];
    id v10 = UITextInputSessionLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134218752;
        NSUInteger v23 = v7;
        __int16 v24 = 2048;
        NSUInteger v25 = v6;
        __int16 v26 = 2048;
        NSUInteger v27 = location;
        __int16 v28 = 2048;
        NSUInteger v29 = length;
        _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
      }

      id v12 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
      int v13 = [v12 asSelection];

      [v13 setSource:0];
      objc_msgSend(v13, "setRelativeRangeBefore:", location, length);
      objc_msgSend(v13, "setRangeAfter:", v7, v6);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke;
      v21[3] = &__block_descriptor_64_e5_v8__0l;
      v21[4] = v7;
      v21[5] = v6;
      v21[6] = location;
      v21[7] = length;
      [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:v21];
      queue = self->_queue;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke_2;
      __int16 v18 = &unk_1E52D9F98;
      int64_t v19 = self;
      id v20 = v13;
      id v10 = v13;
      dispatch_async(queue, &v15);
      [(UITextInputSessionActionAnalytics *)self beginTrackingSessionDurationIfNecessary];
    }
    else if (v11)
    {
      *(_DWORD *)buf = 134218752;
      NSUInteger v23 = v7;
      __int16 v24 = 2048;
      NSUInteger v25 = v6;
      __int16 v26 = 2048;
      NSUInteger v27 = location;
      __int16 v28 = 2048;
      NSUInteger v29 = length;
      _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics][Skipped - ignoreCursorMovements] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
    }
  }
}

uint64_t __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke(void *a1)
{
  return objc_msgSend((id)_MergedGlobals_1093, "didChangeToSelection:relativeRangeBefore:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didCopy
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCopy", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asCopy];

  [v5 setSource:0];
  [v5 setTextInputActionsType:11];
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:&__block_literal_global_119_0];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didCopy__block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __44__UITextInputSessionActionAnalytics_didCopy__block_invoke()
{
  return [(id)_MergedGlobals_1093 didCopy:0];
}

uint64_t __44__UITextInputSessionActionAnalytics_didCopy__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didCut
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCut", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asCut];

  [v5 setSource:0];
  [v5 setTextInputActionsType:10];
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:&__block_literal_global_122_0];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__UITextInputSessionActionAnalytics_didCut__block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __43__UITextInputSessionActionAnalytics_didCut__block_invoke()
{
  return [(id)_MergedGlobals_1093 didCut:0];
}

uint64_t __43__UITextInputSessionActionAnalytics_didCut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didPaste
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didPaste", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asPaste];

  [v5 setSource:0];
  [v5 setTextInputActionsType:12];
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:&__block_literal_global_125];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__UITextInputSessionActionAnalytics_didPaste__block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __45__UITextInputSessionActionAnalytics_didPaste__block_invoke()
{
  return [(id)_MergedGlobals_1093 didPaste:0];
}

uint64_t __45__UITextInputSessionActionAnalytics_didPaste__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didUndo
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didUndo", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asUndo];

  [v5 setSource:0];
  [v5 setTextInputActionsType:13];
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:&__block_literal_global_128];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didUndo__block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __44__UITextInputSessionActionAnalytics_didUndo__block_invoke()
{
  return [(id)_MergedGlobals_1093 didUndo];
}

uint64_t __44__UITextInputSessionActionAnalytics_didUndo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didRedo
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRedo", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asRedo];

  [v5 setSource:0];
  [v5 setTextInputActionsType:14];
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:0 block:&__block_literal_global_131_0];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didRedo__block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __44__UITextInputSessionActionAnalytics_didRedo__block_invoke()
{
  return [(id)_MergedGlobals_1093 didRedo];
}

uint64_t __44__UITextInputSessionActionAnalytics_didRedo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didReplaceWithCandidate:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v10 = +[UITextInputSessionActionAnalytics stringForReplaceWithCandidateType:a3];
    *(_DWORD *)buf = 138412290;
    id v14 = v10;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didReplaceWithCandidate:'%@'", buf, 0xCu);
  }
  NSUInteger v6 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  id v7 = [v6 asReplaceWithCandidate];

  [v7 setReplaceWithCandidateType:a3];
  objc_msgSend(v7, "setInputActionCountFromMergedActions:", -objc_msgSend(v7, "inputActionCount"));
  [(id)_MergedGlobals_1093 didReplaceWithCandidate:a3];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__UITextInputSessionActionAnalytics_didReplaceWithCandidate___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(queue, v11);
}

uint64_t __61__UITextInputSessionActionAnalytics_didReplaceWithCandidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UITextInputSessionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCandidateBarReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
  }

  [(id)_MergedGlobals_1093 didCandidateBarReplacementForText:v6 withText:v7];
  [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:7 withType:1 withInputActionCount:1];
}

- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UITextInputSessionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCalloutBarReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
  }

  [(id)_MergedGlobals_1093 didCalloutBarReplacementForText:v6 withText:v7];
  [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:8 withType:1 withInputActionCount:1];
}

- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  [(id)_MergedGlobals_1093 didAutocorrectReplacementForText:v6 withText:v7];
  if (v6 && [v6 length])
  {
    if (!v7) {
      id v7 = &stru_1ED0E84C0;
    }
    uint64_t v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didAutocorrectReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:0 withType:6 withInputActionCount:1];
  }
}

- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  [(id)_MergedGlobals_1093 didAutocorrectTapOnCompletionReplacementForText:v6 withText:v7];
  if (v6 && [v6 length])
  {
    if (!v7) {
      id v7 = &stru_1ED0E84C0;
    }
    uint64_t v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didAutocorrectTapOnCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:12 withType:6 withInputActionCount:1];
  }
}

- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  id v7 = (__CFString *)a4;
  [(id)_MergedGlobals_1093 didInlineCompletionReplacementForText:v6 withText:v7];
  if (v6 | (unint64_t)v7)
  {
    if (!v7) {
      id v7 = &stru_1ED0E84C0;
    }
    uint64_t v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      unint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInlineCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:0 withType:15 withInputActionCount:1];
  }
}

- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  id v7 = (__CFString *)a4;
  [(id)_MergedGlobals_1093 didInlineCompletionTapOnCompletionReplacementForText:v6 withText:v7];
  if (v6 | (unint64_t)v7)
  {
    if (!v7) {
      id v7 = &stru_1ED0E84C0;
    }
    uint64_t v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      unint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInlineCompletionTapOnCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:12 withType:15 withInputActionCount:1];
  }
}

- (void)didRevisionBubbleTap
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRevisionBubbleTap", v4, 2u);
  }

  [(id)_MergedGlobals_1093 didRevisionBubbleTap];
  [(UITextInputSessionActionAnalytics *)self didReplacementForText:&stru_1ED0E84C0 withText:&stru_1ED0E84C0 withSource:11 withType:1 withInputActionCount:1];
}

- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(id)_MergedGlobals_1093 didRevisionBubbleReplacementForText:v6 withText:v7];
  if (v6)
  {
    uint64_t v8 = UITextInputSessionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRevisionBubbleReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    [(UITextInputSessionActionAnalytics *)self didReplacementForText:v6 withText:v7 withSource:11 withType:1 withInputActionCount:0];
  }
}

- (void)didReplacementForText:(id)a3 withText:(id)a4 withSource:(int64_t)a5 withType:(int64_t)a6 withInputActionCount:(int64_t)a7
{
  id v12 = (__CFString *)a3;
  uint64_t v13 = v12;
  if (a4)
  {
    if (!v12) {
      uint64_t v13 = &stru_1ED0E84C0;
    }
    id v14 = a4;
    uint64_t v15 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
    uint64_t v16 = [v15 asReplaceText];

    if (a5) {
      [v16 setTextInputActionsSource:a5];
    }
    [v16 setTextInputActionsType:a6];
    objc_msgSend(v16, "setRemovedTextLength:", -[__CFString length](v13, "length"));
    objc_msgSend(v16, "setInsertedTextLength:", objc_msgSend(v14, "length"));
    objc_msgSend(v16, "setOptions:", -[UITextInputSessionActionAnalytics _optionsForText:](self, "_optionsForText:", v13));
    objc_msgSend(v16, "setRemovedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v13));
    objc_msgSend(v16, "setInsertedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v14));
    objc_msgSend(v16, "setRemovedPunctuationCount:", -[UITextInputSessionActionAnalytics _punctuationCountForText:](self, "_punctuationCountForText:", v13));
    unint64_t v17 = [(UITextInputSessionActionAnalytics *)self _punctuationCountForText:v14];

    [v16 setInsertedPunctuationCount:v17];
    objc_msgSend(v16, "setInputActionCountFromMergedActions:", a7 - objc_msgSend(v16, "inputActionCount"));
    queue = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __109__UITextInputSessionActionAnalytics_didReplacementForText_withText_withSource_withType_withInputActionCount___block_invoke;
    v20[3] = &unk_1E52D9F98;
    v20[4] = self;
    id v21 = v16;
    id v19 = v16;
    dispatch_async(queue, v20);
  }
}

uint64_t __109__UITextInputSessionActionAnalytics_didReplacementForText_withText_withSource_withType_withInputActionCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
}

- (void)didSessionEnd
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didSessionEnd - flushing recent actions", buf, 2u);
  }

  id v4 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  int64_t v5 = [v4 asEnd];

  [(id)_MergedGlobals_1093 didSessionEnd];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__UITextInputSessionActionAnalytics_didSessionEnd__block_invoke;
  v8[3] = &unk_1E52D9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __50__UITextInputSessionActionAnalytics_didSessionEnd__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "q_flushRecentActions");
}

- (void)didOther
{
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didOther - flushing recent actions", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UITextInputSessionActionAnalytics_didOther__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__UITextInputSessionActionAnalytics_didOther__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_flushRecentActions");
}

- (void)didInsertKeyPressWithInputSource:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v12 = a3;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertKeyPressWithInputSource:%lu", buf, 0xCu);
  }

  id v6 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  id v7 = [v6 asInsertion];

  [v7 setInsertedTextLength:0];
  [v7 setSource:a3];
  +[UITextInputSessionActionAnalytics populateActionInputMode:v7];
  [v7 setInputActionCountFromMergedActions:1];
  uint64_t v8 = 0;
  if ((unint64_t)(a3 - 1) <= 7) {
    uint64_t v8 = qword_186B97B50[a3 - 1];
  }
  int64_t v9 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__UITextInputSessionActionAnalytics_didInsertKeyPressWithInputSource___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:v9 block:v10];
  [(UITextInputSessionActionAnalytics *)self _didInsertTextAction:v7 numCharsDeleted:0 withLanguage:0];
}

uint64_t __70__UITextInputSessionActionAnalytics_didInsertKeyPressWithInputSource___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_186B97B10[v1];
  }
  return [(id)_MergedGlobals_1093 didInsertionKeyPressOfKey:0 withType:v2];
}

- (void)didDeleteKeyPressWithInputSource:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v12 = a3;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteKeyPressWithInputSource:%lu", buf, 0xCu);
  }

  id v6 = [(UITextInputSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class()];
  id v7 = [v6 asDeletion];

  [v7 setRemovedTextLength:0];
  [v7 setSource:a3];
  +[UITextInputSessionActionAnalytics populateActionInputMode:v7];
  [v7 setInputActionCountFromMergedActions:1];
  uint64_t v8 = 0;
  if ((unint64_t)(a3 - 1) <= 7) {
    uint64_t v8 = qword_186B97B50[a3 - 1];
  }
  int64_t v9 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__UITextInputSessionActionAnalytics_didDeleteKeyPressWithInputSource___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  [(UITextInputSessionActionAnalytics *)self _performWithTextInputActionsSource:v9 block:v10];
  [(UITextInputSessionActionAnalytics *)self _didDeleteBackwardAction:v7];
}

uint64_t __70__UITextInputSessionActionAnalytics_didDeleteKeyPressWithInputSource___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_186B97B10[v1];
  }
  return [(id)_MergedGlobals_1093 didDeletionKeyPressOfKey:0 withType:v2];
}

- (void)didKeyPress:(id)a3 inputSource:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 name];
    int v9 = [v8 isEqual:@"Delete-Key"];

    if (v9) {
      [(UITextInputSessionActionAnalytics *)self didDeleteKeyPressWithInputSource:a4];
    }
    else {
      [(UITextInputSessionActionAnalytics *)self didInsertKeyPressWithInputSource:a4];
    }
  }
  else
  {
    id v10 = UITextInputSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_error_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didKeyPress: called with nil key!", v11, 2u);
    }
  }
}

+ (id)stringForReplaceWithCandidateType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"?";
  }
  else {
    return off_1E52F1F58[a3];
  }
}

+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3
{
  if (a3 > 3) {
    return @"?";
  }
  else {
    return off_1E52F1F78[a3];
  }
}

+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"?";
  }
  else {
    return off_1E52F1F98[a3];
  }
}

- (UITextInputSessionActionAnalyticsDelegateSource)delegateSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateSource);
  return (UITextInputSessionActionAnalyticsDelegateSource *)WeakRetained;
}

- (void)setDelegateSource:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
}

- (IATextInputActionsInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

- (unint64_t)allowCursorMovementCounter
{
  return self->_allowCursorMovementCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegateSource);
  objc_storeStrong((id *)&self->_overrideInputModeString, 0);
  objc_storeStrong((id *)&self->_separateCycleAccumulatorNames, 0);
  objc_storeStrong((id *)&self->_dynamicAccumulators, 0);
  objc_storeStrong((id *)&self->_efficacyAccumulators, 0);
  objc_storeStrong((id *)&self->_accumulators, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)flagOptions
{
  int64_t v2 = +[UIKeyboard isShowingEmojiSearch];
  id v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 inputDelegateManager];
  int v5 = [v4 hasAsyncCapableInputDelegate];

  if (v5) {
    return v2 | 4;
  }
  else {
    return v2;
  }
}

- (id)appBundleId
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(UITextInputSessionActionAnalytics *)self getAppBundleId];
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138477827;
    id v6 = v2;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] appBundleId - returning '%{private}@'", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (id)processBundleId
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v2 = _UIMainBundleIdentifier();
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138477827;
    id v6 = v2;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] processBundleId - returning '%{private}@'", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (int64_t)source
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_useOverrideSourceCounter < 1)
  {
    int64_t v5 = [(UITextInputSessionActionAnalytics *)self _getActiveTextInputSource];
    if ((unint64_t)(v5 - 1) > 7) {
      int64_t v4 = 0;
    }
    else {
      int64_t v4 = qword_186B97B50[v5 - 1];
    }
    id v6 = UITextInputSessionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = +[UITextInputSessionActionAnalytics stringValueForSource:v5];
      int v10 = 138478083;
      __int16 v11 = v9;
      __int16 v12 = 2048;
      int64_t v13 = v4;
      _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] source - returning source '%{private}@' -> %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v3 = UITextInputSessionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = _UITextInputActionsSourceString(self->_overrideSource);
      int v10 = 138477827;
      __int16 v11 = v8;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] source - returning override '%{private}@'", (uint8_t *)&v10, 0xCu);
    }
    return self->_overrideSource;
  }
  return v4;
}

@end