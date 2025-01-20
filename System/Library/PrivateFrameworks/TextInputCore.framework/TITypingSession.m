@interface TITypingSession
+ (BOOL)supportsSecureCoding;
- (BOOL)didReceiveSecureFieldEvent;
- (BOOL)fromLegacyRecording;
- (BOOL)includeInputToLastDeletion;
- (BOOL)includeInputToLastWord;
- (BOOL)isCurrentWordEmpty;
- (BOOL)testForRapidDeleteContextChange:(id)a3;
- (NSArray)originalWords;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSLocale)locale;
- (NSMutableArray)layouts;
- (NSMutableArray)userActionHistory;
- (NSMutableDictionary)touchesHistory;
- (NSString)applicationID;
- (NSString)candidateAcceptedTrigger;
- (NSString)contextChangeTrigger;
- (NSString)description;
- (NSString)layoutName;
- (NSString)startContext;
- (NSUUID)sessionId;
- (TIDeleteWordEvent)lastDeletion;
- (TIFeatureUsageMetricsCache)featureUsageMetricsCache;
- (TIKeyboardInput)lastInput;
- (TIKeyboardState)savedDeleteInputKeyboardState;
- (TIKeyboardTouchEvent)timeCalibrationTouch;
- (TITypingSession)init;
- (TITypingSession)initWithCoder:(id)a3;
- (TITypingSession)initWithLocale:(id)a3 keyboardLayout:(id)a4;
- (TITypingSessionParams)sessionParams;
- (TIWordEntry)currentWord;
- (TIWordEntry)lastWord;
- (_NSRange)safeRangeFromRange:(_NSRange)a3 fromArray:(id)a4;
- (double)calibratedCurrentTimestamp;
- (double)calibratedTimeBase;
- (id)committedWordDeletionWithDocumentState:(id)a3 keyboardState:(id)a4;
- (id)createContextChangeEventWithClass:(Class)a3 documentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9;
- (id)currentInputsInRange:(_NSRange)a3;
- (id)currentLayoutsInRange:(_NSRange)a3;
- (id)currentTouchesInRange:(_NSRange)a3;
- (id)keyStringWithCode:(int64_t)a3 fromLayoutIndex:(id)a4;
- (id)uncommittedWordDeletionFromInputsWithRange:(_NSRange)a3;
- (id)uncommittedWordEntryFromInputsWithRange:(_NSRange)a3 documentState:(id)a4 cancelled:(BOOL)a5;
- (int)candidatesAccepted;
- (int)candidatesAcceptedWithText;
- (int64_t)lastActivePathIndex;
- (unint64_t)currentLayoutID;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4;
- (void)addKeyInput:(id)a3 keyboardState:(id)a4;
- (void)addTouchEvent:(id)a3;
- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11;
- (void)candidatesOffered:(id)a3 keyboardState:(id)a4;
- (void)changingContextWithTrigger:(id)a3;
- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10;
- (void)encodeWithCoder:(id)a3;
- (void)endSessionWithTimestamp:(id)a3;
- (void)handleUncommittedWord;
- (void)initContextChangeEvent:(id)a3 withDocumentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9;
- (void)insertUncommittedUserAction:(id)a3;
- (void)layoutDidChange:(id)a3 keyboardState:(id)a4;
- (void)removeInputsAndTouchesWithRange:(_NSRange)a3;
- (void)removeInputsInRange:(_NSRange)a3;
- (void)removeLayoutsInRange:(_NSRange)a3;
- (void)removeTouchesInRange:(_NSRange)a3;
- (void)resetCurrentWord;
- (void)resolveInputs:(id)a3 cancelledTextRange:(_NSRange *)a4 leadingBackspaceRange:(_NSRange *)a5 trailingTextRange:(_NSRange *)a6;
- (void)setApplicationID:(id)a3;
- (void)setCalibratedTimeBase:(double)a3;
- (void)setCandidateAcceptedTrigger:(id)a3;
- (void)setCandidatesAccepted:(int)a3;
- (void)setCandidatesAcceptedWithText:(int)a3;
- (void)setClientID:(id)a3 keyboardState:(id)a4;
- (void)setContextChangeTrigger:(id)a3;
- (void)setCurrentLayoutID:(unint64_t)a3;
- (void)setCurrentWord:(id)a3;
- (void)setDidReceiveSecureFieldEvent:(BOOL)a3;
- (void)setEndTime:(id)a3;
- (void)setFeatureUsageMetricsCache:(id)a3;
- (void)setFromLegacyRecording:(BOOL)a3;
- (void)setIncludeInputToLastDeletion:(BOOL)a3;
- (void)setIncludeInputToLastWord:(BOOL)a3;
- (void)setLastActivePathIndex:(int64_t)a3;
- (void)setLastDeletion:(id)a3;
- (void)setLastInput:(id)a3;
- (void)setLastWord:(id)a3;
- (void)setLayoutName:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setLocale:(id)a3;
- (void)setOriginalWords:(id)a3;
- (void)setSavedDeleteInputKeyboardState:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionParams:(id)a3;
- (void)setStartContext:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimeCalibrationTouch:(id)a3;
- (void)setTouchesHistory:(id)a3;
- (void)setUserActionHistory:(id)a3;
- (void)updateCachedStateAfterLastInputWithKeyboardState:(id)a3;
- (void)updateCachedStateBeforeFirstInputWithKeyboardState:(id)a3;
@end

@implementation TITypingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchesHistory, 0);
  objc_storeStrong((id *)&self->_timeCalibrationTouch, 0);
  objc_storeStrong((id *)&self->_contextChangeTrigger, 0);
  objc_storeStrong((id *)&self->_candidateAcceptedTrigger, 0);
  objc_storeStrong((id *)&self->_lastDeletion, 0);
  objc_storeStrong((id *)&self->_lastWord, 0);
  objc_storeStrong((id *)&self->_savedDeleteInputKeyboardState, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_currentWord, 0);
  objc_storeStrong((id *)&self->_originalWords, 0);
  objc_storeStrong((id *)&self->_userActionHistory, 0);
  objc_storeStrong((id *)&self->_featureUsageMetricsCache, 0);
  objc_storeStrong((id *)&self->_sessionParams, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_startContext, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_cachedCandidatesOffered, 0);

  objc_storeStrong((id *)&self->_cachedKeyboardStates, 0);
}

- (void)setLastActivePathIndex:(int64_t)a3
{
  self->_lastActivePathIndex = a3;
}

- (int64_t)lastActivePathIndex
{
  return self->_lastActivePathIndex;
}

- (void)setTouchesHistory:(id)a3
{
}

- (NSMutableDictionary)touchesHistory
{
  return self->_touchesHistory;
}

- (void)setCalibratedTimeBase:(double)a3
{
  self->_calibratedTimeBase = a3;
}

- (double)calibratedTimeBase
{
  return self->_calibratedTimeBase;
}

- (void)setTimeCalibrationTouch:(id)a3
{
}

- (TIKeyboardTouchEvent)timeCalibrationTouch
{
  return (TIKeyboardTouchEvent *)objc_getProperty(self, a2, 200, 1);
}

- (void)setContextChangeTrigger:(id)a3
{
}

- (NSString)contextChangeTrigger
{
  return self->_contextChangeTrigger;
}

- (void)setCandidateAcceptedTrigger:(id)a3
{
}

- (NSString)candidateAcceptedTrigger
{
  return self->_candidateAcceptedTrigger;
}

- (void)setIncludeInputToLastDeletion:(BOOL)a3
{
  self->_includeInputToLastDeletion = a3;
}

- (BOOL)includeInputToLastDeletion
{
  return self->_includeInputToLastDeletion;
}

- (void)setIncludeInputToLastWord:(BOOL)a3
{
  self->_includeInputToLastWord = a3;
}

- (BOOL)includeInputToLastWord
{
  return self->_includeInputToLastWord;
}

- (void)setLastDeletion:(id)a3
{
}

- (TIDeleteWordEvent)lastDeletion
{
  return self->_lastDeletion;
}

- (void)setLastWord:(id)a3
{
}

- (TIWordEntry)lastWord
{
  return self->_lastWord;
}

- (void)setCurrentLayoutID:(unint64_t)a3
{
  self->_currentLayoutID = a3;
}

- (unint64_t)currentLayoutID
{
  return self->_currentLayoutID;
}

- (void)setSavedDeleteInputKeyboardState:(id)a3
{
}

- (TIKeyboardState)savedDeleteInputKeyboardState
{
  return self->_savedDeleteInputKeyboardState;
}

- (void)setLastInput:(id)a3
{
}

- (TIKeyboardInput)lastInput
{
  return self->_lastInput;
}

- (void)setCurrentWord:(id)a3
{
}

- (void)setOriginalWords:(id)a3
{
}

- (NSArray)originalWords
{
  return self->_originalWords;
}

- (void)setUserActionHistory:(id)a3
{
}

- (NSMutableArray)userActionHistory
{
  return self->_userActionHistory;
}

- (void)setCandidatesAcceptedWithText:(int)a3
{
  self->_candidatesAcceptedWithText = a3;
}

- (int)candidatesAcceptedWithText
{
  return self->_candidatesAcceptedWithText;
}

- (void)setCandidatesAccepted:(int)a3
{
  self->_candidatesAccepted = a3;
}

- (int)candidatesAccepted
{
  return self->_candidatesAccepted;
}

- (void)setFeatureUsageMetricsCache:(id)a3
{
}

- (TIFeatureUsageMetricsCache)featureUsageMetricsCache
{
  return self->_featureUsageMetricsCache;
}

- (void)setSessionParams:(id)a3
{
}

- (TITypingSessionParams)sessionParams
{
  return self->_sessionParams;
}

- (void)setDidReceiveSecureFieldEvent:(BOOL)a3
{
  self->_didReceiveSecureFieldEvent = a3;
}

- (BOOL)didReceiveSecureFieldEvent
{
  return self->_didReceiveSecureFieldEvent;
}

- (void)setApplicationID:(id)a3
{
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setSessionId:(id)a3
{
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLayouts:(id)a3
{
}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (void)setStartContext:(id)a3
{
}

- (NSString)startContext
{
  return self->_startContext;
}

- (void)setLayoutName:(id)a3
{
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (void)setFromLegacyRecording:(BOOL)a3
{
  self->_fromLegacyRecording = a3;
}

- (BOOL)fromLegacyRecording
{
  return self->_fromLegacyRecording;
}

- (_NSRange)safeRangeFromRange:(_NSRange)a3 fromArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  if (location >= [v6 count])
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (location + length > [v6 count])
  {
    NSUInteger length = [v6 count] - location;
  }

  NSUInteger v7 = location;
  NSUInteger v8 = length;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)removeLayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 touchLayoutsM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(TITypingSession *)self currentWord];
    v11 = [v12 touchLayoutsM];
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);
  }
}

- (void)removeTouchesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 allTouchesM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(TITypingSession *)self currentWord];
    v11 = [v12 allTouchesM];
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);
  }
}

- (void)removeInputsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 allKeyboardInputsM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(TITypingSession *)self currentWord];
    v11 = [v12 allKeyboardInputsM];
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);
  }
}

- (id)currentLayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 touchLayoutsM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v12 = [(TITypingSession *)self currentWord];
    v13 = [v12 touchLayoutsM];
    v14 = objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v11 = (void *)[v14 mutableCopy];
  }

  return v11;
}

- (id)currentTouchesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 allTouchesM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v12 = [(TITypingSession *)self currentWord];
    v13 = [v12 allTouchesM];
    v14 = objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v11 = (void *)[v14 mutableCopy];
  }

  return v11;
}

- (id)currentInputsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TITypingSession *)self currentWord];
  NSUInteger v7 = [v6 allKeyboardInputsM];
  uint64_t v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  uint64_t v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v12 = [(TITypingSession *)self currentWord];
    v13 = [v12 allKeyboardInputsM];
    v14 = objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v11 = (void *)[v14 mutableCopy];
  }

  return v11;
}

- (void)resolveInputs:(id)a3 cancelledTextRange:(_NSRange *)a4 leadingBackspaceRange:(_NSRange *)a5 trailingTextRange:(_NSRange *)a6
{
  id v9 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__23133;
  v18[4] = __Block_byref_object_dispose__23134;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__23133;
  v16[4] = __Block_byref_object_dispose__23134;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__TITypingSession_resolveInputs_cancelledTextRange_leadingBackspaceRange_trailingTextRange___block_invoke;
  v15[3] = &unk_1E6E2E108;
  v15[4] = v18;
  v15[5] = v16;
  v15[6] = &v24;
  v15[7] = &v20;
  v15[8] = &v32;
  v15[9] = &v28;
  [v9 enumerateObjectsUsingBlock:v15];
  unint64_t v11 = v21[3] + v29[3];
  if (v11 >= [v9 count])
  {
    NSUInteger v12 = 0;
  }
  else
  {
    NSUInteger v12 = [v9 count] - v11;
    NSUInteger v10 = v11;
  }
  NSUInteger v13 = v29[3];
  a4->NSUInteger location = v33[3];
  a4->NSUInteger length = v13;
  NSUInteger v14 = v21[3];
  a5->NSUInteger location = v25[3];
  a5->NSUInteger length = v14;
  a6->NSUInteger location = v10;
  a6->NSUInteger length = v12;
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

void __92__TITypingSession_resolveInputs_cancelledTextRange_leadingBackspaceRange_trailingTextRange___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v11];
  int v5 = [v11 isBackspace];
  id v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (!v5)
  {
    [v6 addObject:v11];
    goto LABEL_13;
  }
  if (![v6 count])
  {
    uint64_t v10 = *(void *)(a1[6] + 8);
    if (*(void *)(v10 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v10 + 24) = a3;
    }
    uint64_t v8 = [*(id *)(*(void *)(a1[4] + 8) + 40) count];
    uint64_t v9 = a1[7];
    goto LABEL_12;
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) removeLastObject];
  if (![*(id *)(*(void *)(a1[5] + 8) + 40) count]
    && *(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(a1[8] + 8);
    if (*(void *)(v7 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v7 + 24) = 0;
    }
    uint64_t v8 = [*(id *)(*(void *)(a1[4] + 8) + 40) count];
    uint64_t v9 = a1[9];
LABEL_12:
    *(void *)(*(void *)(v9 + 8) + 24) += v8;
    [*(id *)(*(void *)(a1[4] + 8) + 40) removeAllObjects];
  }
LABEL_13:
}

- (void)insertUncommittedUserAction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    int v5 = [(TITypingSession *)self userActionHistory];
    unint64_t v6 = [v5 count];

    if (v6 >= 2)
    {
      uint64_t v7 = [(TITypingSession *)self userActionHistory];
      uint64_t v8 = [v7 lastObject];

      int v9 = [v8 actionType];
      if (v9 != 2 && v9 != 12)
      {
        if (v9 == 11)
        {

LABEL_7:
          uint64_t v10 = [(TITypingSession *)self userActionHistory];
          id v11 = [(TITypingSession *)self userActionHistory];
          objc_msgSend(v10, "insertObject:atIndex:", v15, objc_msgSend(v11, "count") - 1);

LABEL_13:
          id v4 = v15;
          goto LABEL_14;
        }
        goto LABEL_11;
      }
      NSUInteger v12 = [v8 documentState];
      NSUInteger v13 = [v12 contextBeforeInput];
      if (v13 || ([v12 selectedText], (NSUInteger v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_11:
        goto LABEL_12;
      }
      NSUInteger v14 = [v12 contextAfterInput];

      if (!v14) {
        goto LABEL_7;
      }
    }
LABEL_12:
    uint64_t v10 = [(TITypingSession *)self userActionHistory];
    [v10 addObject:v15];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)removeInputsAndTouchesWithRange:(_NSRange)a3
{
  NSUInteger v4 = 2 * a3.location;
  NSUInteger v5 = 2 * a3.length;
  -[TITypingSession removeInputsInRange:](self, "removeInputsInRange:");
  -[TITypingSession removeTouchesInRange:](self, "removeTouchesInRange:", v4, v5);

  -[TITypingSession removeLayoutsInRange:](self, "removeLayoutsInRange:", v4, v5);
}

- (id)committedWordDeletionWithDocumentState:(id)a3 keyboardState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[TIDeleteWordEvent alloc] initWithTIKeyboardState:v6];

  [(TIUserAction *)v8 setDocumentState:v7];
  int v9 = [(TIWordEntry *)self->_currentWord allKeyboardInputs];
  [(TIDeleteWordEvent *)v8 addKeyInputs:v9];

  uint64_t v10 = [(TIWordEntry *)self->_currentWord allTouches];
  id v11 = [(TIWordEntry *)self->_currentWord touchLayouts];
  [(TIDeleteWordEvent *)v8 addTouches:v10 withLayoutIDs:v11];

  NSUInteger v12 = [(TIWordEntry *)self->_currentWord candidatesOffered];
  [(TIDeleteWordEvent *)v8 addCandidatesOffered:v12];

  NSUInteger v13 = [(TIDeleteWordEvent *)v8 allTouches];
  NSUInteger v14 = [v13 lastObject];
  [v14 timestamp];
  -[TIUserAction setEndTime:](v8, "setEndTime:");

  id v15 = [(TIDeleteWordEvent *)v8 allTouches];
  v16 = [v15 firstObject];
  [v16 timestamp];
  -[TIUserAction setStartTime:](v8, "setStartTime:");

  [(TITypingSession *)self calibratedCurrentTimestamp];
  -[TIUserAction setOccurenceTime:](v8, "setOccurenceTime:");

  return v8;
}

- (id)uncommittedWordDeletionFromInputsWithRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    int v7 = LODWORD(a3.location) + LODWORD(a3.length);
    uint64_t v8 = [(NSMutableArray *)self->_cachedKeyboardStates objectAtIndexedSubscript:a3.location + a3.length];
    int v9 = [v8 documentState];
    v3 = [[TIDeleteWordEvent alloc] initWithTIKeyboardState:v8];
    [(TIUserAction *)v3 setDocumentState:v9];
    uint64_t v10 = 2 * length;
    id v11 = -[TITypingSession currentInputsInRange:](self, "currentInputsInRange:", location, length);
    [(TIDeleteWordEvent *)v3 setAllKeyboardInputsM:v11];

    NSUInteger v12 = -[TITypingSession currentTouchesInRange:](self, "currentTouchesInRange:", 2 * location, v10);
    [(TIDeleteWordEvent *)v3 setAllTouchesM:v12];

    NSUInteger v13 = -[TITypingSession currentLayoutsInRange:](self, "currentLayoutsInRange:", 2 * location, v10);
    [(TIDeleteWordEvent *)v3 setTouchLayoutsM:v13];

    unint64_t v14 = v7 - 1;
    if (v14 < [(NSMutableArray *)self->_cachedCandidatesOffered count])
    {
      id v15 = (void *)MEMORY[0x1E4F1CA48];
      v16 = [(NSMutableArray *)self->_cachedCandidatesOffered objectAtIndexedSubscript:v14];
      id v17 = [v15 arrayWithObject:v16];
      [(TIDeleteWordEvent *)v3 setCandidatesOfferedM:v17];
    }
    v18 = [(TIDeleteWordEvent *)v3 allTouches];
    id v19 = [v18 lastObject];
    [v19 timestamp];
    -[TIUserAction setEndTime:](v3, "setEndTime:");

    uint64_t v20 = [(TIDeleteWordEvent *)v3 allTouches];
    v21 = [v20 firstObject];
    [v21 timestamp];
    -[TIUserAction setStartTime:](v3, "setStartTime:");

    [(TITypingSession *)self calibratedCurrentTimestamp];
    -[TIUserAction setOccurenceTime:](v3, "setOccurenceTime:");
  }

  return v3;
}

- (id)uncommittedWordEntryFromInputsWithRange:(_NSRange)a3 documentState:(id)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = objc_alloc_init(TIWordEntry);
    uint64_t v10 = v11;
    if (v9)
    {
      [(TIUserAction *)v11 setDocumentState:v9];
    }
    else
    {
      NSUInteger v12 = [(NSMutableArray *)self->_cachedKeyboardStates objectAtIndexedSubscript:location];
      NSUInteger v13 = [v12 documentState];
      [(TIUserAction *)v10 setDocumentState:v13];
    }
    int v14 = location + length;
    id v15 = [(NSMutableArray *)self->_cachedKeyboardStates objectAtIndexedSubscript:location + length];
    [(TIUserAction *)v10 setKeyboardState:v15];

    uint64_t v16 = 2 * length;
    id v17 = -[TITypingSession currentInputsInRange:](self, "currentInputsInRange:", location, length);
    [(TIWordEntry *)v10 setAllKeyboardInputsM:v17];

    v18 = -[TITypingSession currentTouchesInRange:](self, "currentTouchesInRange:", 2 * location, v16);
    [(TIWordEntry *)v10 setAllTouchesM:v18];

    id v19 = -[TITypingSession currentLayoutsInRange:](self, "currentLayoutsInRange:", 2 * location, v16);
    [(TIWordEntry *)v10 setTouchLayoutsM:v19];

    unint64_t v20 = v14 - 1;
    if (v20 < [(NSMutableArray *)self->_cachedCandidatesOffered count])
    {
      v21 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v22 = [(NSMutableArray *)self->_cachedCandidatesOffered objectAtIndexedSubscript:v20];
      uint64_t v23 = [v21 arrayWithObject:v22];
      [(TIWordEntry *)v10 setCandidatesOfferedM:v23];
    }
    uint64_t v24 = [MEMORY[0x1E4FAE318] candidateWithCandidate:&stru_1F3F7A998 forInput:&stru_1F3F7A998];
    [(TIWordEntry *)v10 setAcceptedCandidate:v24];

    [(TIWordEntry *)v10 setAcceptedString:&stru_1F3F7A998];
    v25 = [(TIWordEntry *)v10 allTouches];
    uint64_t v26 = [v25 firstObject];
    [v26 timestamp];
    -[TIUserAction setStartTime:](v10, "setStartTime:");

    uint64_t v27 = [(TIWordEntry *)v10 allTouches];
    uint64_t v28 = [v27 lastObject];
    [v28 timestamp];
    -[TIUserAction setEndTime:](v10, "setEndTime:");

    [(TITypingSession *)self calibratedCurrentTimestamp];
    -[TIUserAction setOccurenceTime:](v10, "setOccurenceTime:");
    [(TIWordEntry *)v10 setCancelled:v5];
    [(TIWordEntry *)v10 setOrigin:4];
  }

  return v10;
}

- (void)handleUncommittedWord
{
  if (!self->_currentWord) {
    return;
  }
  if (![(NSMutableArray *)self->_cachedKeyboardStates count])
  {
    if ([(TITypingSession *)self didReceiveSecureFieldEvent]) {
      goto LABEL_6;
    }
LABEL_11:
    BOOL v5 = [(TITypingSession *)self currentWord];
    id v6 = [v5 allKeyboardInputs];
    uint64_t v7 = [v6 count];

    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v8 = [(TITypingSession *)self currentWord];
    id v9 = [v8 allKeyboardInputs];
    [(TITypingSession *)self resolveInputs:v9 cancelledTextRange:&v24 leadingBackspaceRange:&v22 trailingTextRange:&v20];

    uint64_t v10 = v22;
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(TITypingSession *)self currentWord];
      NSUInteger v12 = [v11 allKeyboardInputs];
      uint64_t v13 = [v12 count];

      uint64_t v14 = -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", 0, v13, 0, v20 == 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v15 = -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", v24, v25, 0, 1);
        [(TITypingSession *)self insertUncommittedUserAction:v15];

        uint64_t v10 = v22;
      }
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = v21 + v23;
        v18 = -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:");
        uint64_t v16 = [v18 documentState];

        id v19 = -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", v10, v17, v16, 0);
        [(TITypingSession *)self insertUncommittedUserAction:v19];

        goto LABEL_20;
      }
      uint64_t v14 = -[TITypingSession uncommittedWordDeletionFromInputsWithRange:](self, "uncommittedWordDeletionFromInputsWithRange:", v10, v23);
    }
    uint64_t v16 = (void *)v14;
    [(TITypingSession *)self insertUncommittedUserAction:v14];
LABEL_20:

    [(TITypingSession *)self resetCurrentWord];
    return;
  }
  v3 = [(NSMutableArray *)self->_cachedKeyboardStates objectAtIndexedSubscript:0];
  if (![v3 secureTextEntry])
  {
    BOOL v4 = [(TITypingSession *)self didReceiveSecureFieldEvent];

    if (v4) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }

LABEL_6:
  [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
LABEL_7:

  [(TITypingSession *)self resetCurrentWord];
}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v8 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [NSString stringWithFormat:@"%s CI clientID: '%@'", "-[TITypingSession setClientID:keyboardState:]", v6];
      *(_DWORD *)buf = 138412290;
      id v11 = v9;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (([v7 secureTextEntry] & 1) != 0
    || [(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
  }
  else
  {
    [(TITypingSession *)self setApplicationID:v6];
    [(TITypingSession *)self updateCachedStateBeforeFirstInputWithKeyboardState:v7];
  }
}

- (void)initContextChangeEvent:(id)a3 withDocumentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9
{
  BOOL v9 = a6;
  id v13 = a7;
  id v14 = a4;
  id v16 = a3;
  [v16 setDocumentState:v14];
  id v15 = [v14 selectedText];

  objc_msgSend(v16, "setIsSelection:", objc_msgSend(v15, "length") != 0);
  [v16 setExtendsPriorWord:v9];
  objc_msgSend(v16, "setInWordRange:", a8.location, a8.length);
  [v16 setInWord:v13];

  [v16 setSelectionLocation:a9];
  [(TITypingSession *)self calibratedCurrentTimestamp];
  objc_msgSend(v16, "setOccurenceTime:");
}

- (id)createContextChangeEventWithClass:(Class)a3 documentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9
{
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = (void *)[[a3 alloc] initWithTIKeyboardState:v15];
  -[TITypingSession initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", v17, v16, v15, v9, v14, a8.location, a8.length, a9);

  return v17;
}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a10;
  if (IXACanLogMessageAtLevel())
  {
    v18 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = [NSString stringWithFormat:@"%s CC trigger: %@ wordDelete: %d cursorMoved: %d extendsPriorWord: %d", "-[TITypingSession contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]", self->_contextChangeTrigger, v13, v12, v11];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (([v17 secureTextEntry] & 1) == 0
    && ![(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    id v19 = [(TITypingSession *)self contextChangeTrigger];
    uint64_t v20 = (void *)*MEMORY[0x1E4FAE5A0];

    uint64_t v21 = (id *)MEMORY[0x1E4FAE5B0];
    if (v19 == v20)
    {
      uint64_t v24 = [(TITypingSession *)self lastInput];
      int v25 = [v24 isBackspace];

      if (v25)
      {
        uint64_t v26 = [(TITypingSession *)self lastInput];
        [v26 setRapidDelete:1];
      }
    }
    else if ([(TITypingSession *)self fromLegacyRecording])
    {
      uint64_t v22 = [(TITypingSession *)self lastInput];
      if ([v22 isBackspace])
      {
        uint64_t v23 = [(TITypingSession *)self lastInput];
        if ([v23 isRapidDelete])
        {
        }
        else
        {
          BOOL v59 = [(TITypingSession *)self testForRapidDeleteContextChange:v17];

          if (!v59)
          {
LABEL_20:
            if (v13) {
              goto LABEL_21;
            }
            [(TITypingSession *)self setContextChangeTrigger:*MEMORY[0x1E4FAE5A8]];
            goto LABEL_25;
          }
          uint64_t v22 = [(TITypingSession *)self lastInput];
          [v22 setRapidDelete:1];
        }
      }

      goto LABEL_20;
    }
    if (v13)
    {
LABEL_21:
      *(_OWORD *)buf = 0uLL;
      v62[0] = 0;
      v62[1] = 0;
      v61[0] = 0;
      v61[1] = 0;
      uint64_t v28 = [(TITypingSession *)self currentWord];
      v29 = [v28 allKeyboardInputs];
      [(TITypingSession *)self resolveInputs:v29 cancelledTextRange:buf leadingBackspaceRange:v62 trailingTextRange:v61];

      if (*(void *)buf != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v30 = [(TITypingSession *)self uncommittedWordEntryFromInputsWithRange:*(_OWORD *)buf documentState:0 cancelled:1];
        [(TITypingSession *)self insertUncommittedUserAction:v30];

        [(TITypingSession *)self removeInputsAndTouchesWithRange:*(_OWORD *)buf];
      }
      uint64_t v31 = [(TITypingSession *)self committedWordDeletionWithDocumentState:v15 keyboardState:v17];
      uint64_t v32 = [(TITypingSession *)self userActionHistory];
      [v32 addObject:v31];

      [(TITypingSession *)self setLastDeletion:v31];
      [(TITypingSession *)self setIncludeInputToLastDeletion:1];
      [(TITypingSession *)self resetCurrentWord];

      goto LABEL_44;
    }
LABEL_25:
    v33 = [(TITypingSession *)self lastInput];
    char v34 = [v33 isBackspace];

    if (v34)
    {
LABEL_44:
      objc_storeStrong((id *)&self->_contextChangeTrigger, *v21);
      goto LABEL_45;
    }
    uint64_t v35 = [(TITypingSession *)self userActionHistory];
    uint64_t v36 = [v35 count];
    v37 = (void *)MEMORY[0x1E4FAE588];
    BOOL v60 = v11;
    if (v36)
    {

LABEL_32:
      v42 = [(TITypingSession *)self contextChangeTrigger];
      int v43 = [v42 isEqualToString:*v37];

      if (v43)
      {
        v44 = [TIGainFocusEvent alloc];
        v45 = [(TITypingSession *)self locale];
        v46 = [(TIGainFocusEvent *)v44 initWithTIKeyboardState:v17 andLocale:v45];

        -[TITypingSession initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", v46, v15, v17, v60, v16, a8.location, a8.length, a9);
        uint64_t v21 = (id *)MEMORY[0x1E4FAE5B0];
      }
      else
      {
        v47 = [(TITypingSession *)self contextChangeTrigger];
        int v48 = [v47 isEqualToString:*MEMORY[0x1E4FAE590]];

        uint64_t v21 = (id *)MEMORY[0x1E4FAE5B0];
        if (!v48)
        {
          v49 = [(TITypingSession *)self contextChangeTrigger];
          int v50 = [v49 isEqualToString:*MEMORY[0x1E4FAE5A8]];

          if (!v50)
          {
            v51 = [(TITypingSession *)self contextChangeTrigger];
            int v52 = [v51 isEqualToString:*MEMORY[0x1E4FAE578]];

            if (!v52)
            {
              v53 = [(TITypingSession *)self contextChangeTrigger];
              int v54 = [v53 isEqualToString:v20];

              if (!v54)
              {
                v55 = [(TITypingSession *)self contextChangeTrigger];
                int v56 = [v55 isEqualToString:*MEMORY[0x1E4FAE580]];

                if (!v56)
                {
                  v57 = [(TITypingSession *)self contextChangeTrigger];
                  [v57 isEqualToString:*MEMORY[0x1E4FAE598]];
                }
              }
            }
          }
        }
        -[TITypingSession createContextChangeEventWithClass:documentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "createContextChangeEventWithClass:documentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", objc_opt_class(), v15, v17, v60, v16, a8.location, a8.length, a9);
        v46 = (TIGainFocusEvent *)objc_claimAutoreleasedReturnValue();
      }
      v58 = [(TITypingSession *)self userActionHistory];
      [v58 addObject:v46];

      goto LABEL_44;
    }
    v38 = (void *)MEMORY[0x1E4FAE588];
    v39 = [(TITypingSession *)self contextChangeTrigger];
    if ([v39 isEqualToString:*MEMORY[0x1E4FAE5B0]])
    {

      v37 = v38;
    }
    else
    {
      v40 = [(TITypingSession *)self contextChangeTrigger];
      int v41 = [v40 isEqualToString:*MEMORY[0x1E4FAE5A8]];

      v37 = v38;
      if (!v41) {
        goto LABEL_32;
      }
    }
    [(TITypingSession *)self setContextChangeTrigger:*v37];
    goto LABEL_32;
  }
  [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
LABEL_45:
}

- (void)changingContextWithTrigger:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  if (IXACanLogMessageAtLevel())
  {
    BOOL v5 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [NSString stringWithFormat:@"%s TC trigger: %@", "-[TITypingSession changingContextWithTrigger:]", v4];
      *(_DWORD *)buf = 138412290;
      BOOL v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  contextChangeTrigger = self->_contextChangeTrigger;
  self->_contextChangeTrigger = v4;
}

- (id)keyStringWithCode:(int64_t)a3 fromLayoutIndex:(id)a4
{
  id v6 = a4;
  id v7 = [(TITypingSession *)self layouts];
  uint64_t v8 = [v6 integerValue];

  BOOL v9 = [v7 objectAtIndexedSubscript:v8];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__TITypingSession_keyStringWithCode_fromLayoutIndex___block_invoke;
  v12[3] = &unk_1E6E2E0E0;
  v12[4] = &v13;
  v12[5] = a3;
  [v9 enumerateKeysUsingBlock:v12];
  if (v14[3])
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    uint64_t v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __53__TITypingSession_keyStringWithCode_fromLayoutIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) == a3)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  BOOL v11 = a8;
  uint64_t v349 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v324 = a4;
  id v18 = a5;
  id v326 = a6;
  id v327 = a7;
  id v19 = a11;
  if (self->_currentWord)
  {
    long long buf = 0uLL;
    v342[0] = 0;
    v342[1] = 0;
    v341[0] = 0;
    v341[1] = 0;
    uint64_t v20 = [(TITypingSession *)self currentWord];
    uint64_t v21 = [v20 allKeyboardInputs];
    [(TITypingSession *)self resolveInputs:v21 cancelledTextRange:&buf leadingBackspaceRange:v342 trailingTextRange:v341];

    if ((void)buf != 0x7FFFFFFFFFFFFFFFLL && v342[0] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:");
      [(TITypingSession *)self insertUncommittedUserAction:v22];

      [(TITypingSession *)self removeInputsAndTouchesWithRange:buf];
    }
  }
  v328 = v19;
  uint64_t v23 = [(TITypingSession *)self lastWord];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    int v25 = [(TITypingSession *)self userActionHistory];
    uint64_t v26 = [v25 lastObject];
    uint64_t v27 = [(TITypingSession *)self lastWord];

    if (v26 == v27)
    {
      v38 = [(TITypingSession *)self lastWord];
      int v39 = [v38 wordEntryType] & 0xE0;

      if (v39)
      {
        v40 = [(TITypingSession *)self lastWord];
        int v41 = [v40 acceptedString];
        v42 = [v17 candidate];
        int v43 = [v41 isEqualToString:v42];

        if (v43)
        {
          [(TITypingSession *)self setCandidateAcceptedTrigger:*MEMORY[0x1E4FAE558]];
          uint64_t v28 = v324;
          uint64_t v35 = v328;
          goto LABEL_20;
        }
      }
    }
  }
  uint64_t v28 = v324;
  if (IXACanLogMessageAtLevel())
  {
    v29 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v114 = NSString;
      candidateAcceptedTrigger = self->_candidateAcceptedTrigger;
      v116 = [v17 candidate];
      v117 = [v17 input];
      id v118 = [v114 stringWithFormat:@"%s CA trigger: %@ candidate: %@ input: %@ predictionBarHit: %d", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", candidateAcceptedTrigger, v116, v117, v11];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v118;
      _os_log_debug_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v30 = [(TITypingSession *)self candidateAcceptedTrigger];
  char v31 = [v30 isEqualToString:*MEMORY[0x1E4FAE568]];

  if (v31)
  {
    int v32 = 1;
  }
  else
  {
    v33 = [(TITypingSession *)self candidateAcceptedTrigger];
    int v34 = [v33 isEqualToString:*MEMORY[0x1E4FAE560]];

    int v32 = v11 & ~v34;
  }
  uint64_t v35 = v328;
  [(TITypingSession *)self setCandidatesAccepted:[(TITypingSession *)self candidatesAccepted] + 1];
  uint64_t v36 = (void *)MEMORY[0x1E4FAE268];
  v37 = [v17 candidate];
  LODWORD(v36) = [v36 hasNonWhitespaceNonPunctuationText:v37];

  if (v36) {
    [(TITypingSession *)self setCandidatesAcceptedWithText:[(TITypingSession *)self candidatesAcceptedWithText] + 1];
  }
  if (([v328 secureTextEntry] & 1) != 0
    || [(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
    [(TITypingSession *)self resetCurrentWord];
LABEL_19:
    [(TITypingSession *)self setCandidateAcceptedTrigger:*MEMORY[0x1E4FAE558]];
    goto LABEL_20;
  }
  if (v32)
  {
    if (self->_currentWord) {
      goto LABEL_28;
    }
    v44 = [(TITypingSession *)self lastWord];
    v45 = [v44 acceptedCandidate];
    v46 = [(TITypingSession *)self lastWord];
    [v46 setOriginalCandidate:v45];

    v47 = [(TITypingSession *)self lastWord];
    int v48 = [v47 acceptedString];
    v49 = [(TITypingSession *)self lastWord];
    [v49 setOriginalAcceptedString:v48];

    int v50 = [(TITypingSession *)self lastWord];
    [v50 setAcceptedCandidate:v17];

    v51 = [v17 candidate];
    int v52 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v53 = [v51 stringByTrimmingCharactersInSet:v52];
    int v54 = [(TITypingSession *)self lastWord];
    [v54 setAcceptedString:v53];

    v55 = [(TITypingSession *)self lastWord];
    [v55 setWordEntryType:4];

    int v56 = [(TITypingSession *)self lastWord];
    objc_msgSend(v56, "setWordEntryType:", objc_msgSend(v56, "wordEntryType") | 8);
  }
  if (!self->_currentWord) {
    goto LABEL_19;
  }
LABEL_28:
  [(TITypingSession *)self calibratedCurrentTimestamp];
  -[TIUserAction setOccurenceTime:](self->_currentWord, "setOccurenceTime:");
  [(TIUserAction *)self->_currentWord setKeyboardState:v328];
  v322 = [v18 contextBeforeInput];
  v57 = [(TIWordEntry *)self->_currentWord candidatesOffered];
  int v58 = [v57 count];

  v321 = v18;
  if (v58 < 1)
  {
    v62 = 0;
  }
  else
  {
    BOOL v59 = [(TIWordEntry *)self->_currentWord candidatesOffered];
    BOOL v60 = [v59 objectAtIndex:(v58 - 1)];
    v61 = [v60 corrections];
    v62 = [v61 autocorrection];

    if (![v17 sourceMask])
    {
      v63 = [v62 candidate];
      uint64_t v64 = [v17 candidate];
      if ([v64 isEqualToString:v63])
      {
        id v65 = v62;

        id v17 = v65;
      }
    }
  }
  v66 = [v17 candidate];
  v316 = v62;
  v67 = [v62 candidate];
  v68 = [(TITypingSession *)self locale];
  int v69 = [v66 smartQuoteInsensitiveStringEquivalent:v67 forLocale:v68];

  char v70 = [v17 isAutocorrection];
  v71 = (void *)MEMORY[0x1E4FAE540];
  if ((v70 & 1) == 0)
  {
    v66 = [(TITypingSession *)self candidateAcceptedTrigger];
    if (![v66 isEqualToString:*v71]) {
      goto LABEL_44;
    }
  }
  if ((v69 ^ 1 | v32) & 1) != 0 || ([v17 isContinuousPathConversion])
  {
    if (v70) {
      goto LABEL_45;
    }
LABEL_44:

    goto LABEL_45;
  }
  char v72 = [v17 isToucanInlineCompletionCandidate];
  if ((v70 & 1) == 0) {

  }
  if ((v72 & 1) == 0)
  {
    v66 = [(TITypingSession *)self currentWord];
    objc_msgSend(v66, "setWordEntryType:", objc_msgSend(v66, "wordEntryType") | 1);
    goto LABEL_44;
  }
LABEL_45:
  if ([v17 isCompletionCandidate])
  {
    v73 = [(TITypingSession *)self currentWord];
    objc_msgSend(v73, "setWordEntryType:", objc_msgSend(v73, "wordEntryType") | 2);
  }
  if (v32)
  {
    v74 = [(TITypingSession *)self currentWord];
    objc_msgSend(v74, "setWordEntryType:", objc_msgSend(v74, "wordEntryType") | 4);

    v75 = [(TITypingSession *)self currentWord];
    objc_msgSend(v75, "setWordEntryType:", objc_msgSend(v75, "wordEntryType") | 0x10);
  }
  v76 = [(TITypingSession *)self candidateAcceptedTrigger];
  int v77 = [v76 isEqualToString:*v71];

  if (v77)
  {
    v78 = [(TITypingSession *)self currentWord];
    objc_msgSend(v78, "setWordEntryType:", objc_msgSend(v78, "wordEntryType") | 0x20);
  }
  v79 = [(TITypingSession *)self candidateAcceptedTrigger];
  int v80 = [v79 isEqualToString:*MEMORY[0x1E4FAE548]];

  if (v80)
  {
    v81 = [(TITypingSession *)self currentWord];
    objc_msgSend(v81, "setWordEntryType:", objc_msgSend(v81, "wordEntryType") | 0x40);
  }
  v82 = [(TITypingSession *)self candidateAcceptedTrigger];
  int v83 = [v82 isEqualToString:*MEMORY[0x1E4FAE550]];

  if (v83)
  {
    v84 = [(TITypingSession *)self currentWord];
    objc_msgSend(v84, "setWordEntryType:", objc_msgSend(v84, "wordEntryType") | 0x80);
  }
  if ([v17 isToucanInlineCompletionCandidate])
  {
    v85 = [(TITypingSession *)self currentWord];
    objc_msgSend(v85, "setWordEntryType:", objc_msgSend(v85, "wordEntryType") | 0x100);
  }
  uint64_t v86 = ([v17 usageTrackingMask] >> 18) & 1;
  v87 = [(TITypingSession *)self currentWord];
  [v87 setIsMultilingual:v86];

  uint64_t v88 = ([v17 sourceMask] >> 5) & 1;
  v89 = [(TITypingSession *)self currentWord];
  [v89 setIsOOV:v88];

  if (([v17 sourceMask] & 0x8000) != 0) {
    uint64_t v90 = 1;
  }
  else {
    uint64_t v90 = ([v17 sourceMask] >> 17) & 1;
  }
  v91 = [(TITypingSession *)self currentWord];
  [v91 setIsFromStaticLexicon:v90];

  uint64_t v92 = ([v17 usageTrackingMask] >> 17) & 1;
  v93 = [(TITypingSession *)self currentWord];
  [v93 setIsContinuousPathCompletion:v92];

  id v17 = v17;
  v94 = [v324 string];
  LODWORD(v93) = [v94 endsInPunctuation];

  if (v93 && !a9)
  {
    v95 = [(TITypingSession *)self lastWord];
    v96 = [v95 acceptedCandidate];
    if ([v96 isContinuousPathConversion])
    {
      v97 = [v324 string];
      char v98 = [v97 isEqualToString:@" "];

      if ((v98 & 1) == 0)
      {
        v99 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v100 = [v322 componentsSeparatedByCharactersInSet:v99];
        v101 = [v100 lastObject];

        uint64_t v102 = [v17 candidate];
        if (v102)
        {
          v103 = (void *)v102;
          v104 = [v17 candidate];
          char v105 = [v101 isEqualToString:v104];

          if ((v105 & 1) == 0)
          {
            v106 = [v321 contextBeforeInput];
            v107 = [v17 candidate];
            uint64_t v108 = [v106 stringByAppendingString:v107];

            v322 = (void *)v108;
          }
        }
        id v109 = objc_alloc(MEMORY[0x1E4FAE318]);
        v110 = [v324 string];
        v111 = [v324 string];
        v323 = (void *)[v109 initWithCandidate:v110 forInput:v111];

        v112 = [(TITypingSession *)self currentWord];
        [v112 setIsPunctuationEntryFollowingAWord:1];

        goto LABEL_74;
      }
    }
    else
    {
    }
    v101 = [v324 string];
    if ([v101 isEqual:@" "])
    {
      v323 = v17;
LABEL_74:

      goto LABEL_75;
    }
    char v113 = [v17 isToucanInlineCompletionCandidate];

    if ((v113 & 1) == 0)
    {
      v119 = [v17 candidate];
      v120 = [v324 string];
      v121 = [v119 stringByAppendingString:v120];
      v323 = [v17 candidateByReplacingWithCandidate:v121];

      v101 = [(TITypingSession *)self currentWord];
      [v101 setIsPunctuationEntryFollowingAWord:1];
      goto LABEL_74;
    }
  }
  v323 = v17;
LABEL_75:
  char v122 = [v17 isContinuousPathConversion];
  if (v324)
  {
    if ((v122 & 1) == 0)
    {
      v123 = [v324 string];
      char v124 = [v123 _containsEmoji];

      if ((v124 & 1) == 0)
      {
        [(TITypingSession *)self setIncludeInputToLastWord:1];
        v125 = [(TITypingSession *)self currentWord];
        [v125 setInputTriggeredTextAccepted:v324];
      }
    }
  }
  v126 = [v323 candidate];
  v127 = [(TITypingSession *)self currentWord];
  [v127 setAcceptedString:v126];

  if ([v17 isContinuousPathConversion] && !a9)
  {
    v128 = [(TITypingSession *)self currentWord];
    v129 = [v128 acceptedString];
    v130 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v131 = [v129 stringByTrimmingCharactersInSet:v130];
    v132 = [(TITypingSession *)self currentWord];
    [v132 setAcceptedString:v131];

    uint64_t v35 = v328;
  }
  v133 = [(TITypingSession *)self currentWord];
  [v133 setAcceptedCandidate:v323];

  v134 = [(TITypingSession *)self currentWord];
  [v134 setInputContext:v326];

  v135 = [(TITypingSession *)self currentWord];
  [v135 setInputStem:v327];

  v136 = [(TITypingSession *)self currentWord];
  v137 = [v136 allTouches];
  v138 = [v137 lastObject];
  [v138 timestamp];
  double v140 = v139;
  v141 = [(TITypingSession *)self currentWord];
  [v141 setEndTime:v140];

  v142 = [(TITypingSession *)self currentWord];
  v143 = [v142 allTouches];
  v144 = [v143 firstObject];
  [v144 timestamp];
  double v146 = v145;
  v147 = [(TITypingSession *)self currentWord];
  [v147 setStartTime:v146];

  v148 = [(TITypingSession *)self currentWord];
  [v148 setKeyboardState:v35];

  v149 = [v323 candidate];
  uint64_t v150 = [v149 length];

  if (!v150)
  {
    BOOL v151 = a9;
    goto LABEL_90;
  }
  BOOL v151 = a9;
  if (a9) {
    goto LABEL_90;
  }
  v152 = [v321 contextBeforeInput];
  if ([v152 hasSuffix:v327])
  {
  }
  else
  {
    v153 = [v321 contextBeforeInput];
    v154 = [v323 candidate];
    int v155 = [v153 hasSuffix:v154];

    if (!v155) {
      goto LABEL_90;
    }
  }
  v156 = [v321 contextBeforeInput];
  uint64_t v157 = [v156 length];
  v158 = [v323 candidate];
  uint64_t v159 = v157 - [v158 length];

  if ((v159 & 0x8000000000000000) == 0)
  {
    v160 = [v321 contextBeforeInput];
    uint64_t v161 = [v160 substringToIndex:v159];

    v322 = (void *)v161;
  }
LABEL_90:
  if (v321)
  {
    id v162 = objc_alloc(MEMORY[0x1E4FAE2A8]);
    v163 = [v321 markedText];
    v164 = [v321 selectedText];
    v165 = [v321 contextAfterInput];
    uint64_t v166 = [v321 selectedRangeInMarkedText];
    v168 = objc_msgSend(v162, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v322, v163, v164, v165, v166, v167);
    v169 = [(TITypingSession *)self currentWord];
    [v169 setDocumentState:v168];

    uint64_t v35 = v328;
  }
  if (v151)
  {
    v170 = [(TITypingSession *)self currentWord];
    [v170 setCandidateIndex:a10];
  }
  v171 = [(TITypingSession *)self currentWord];
  v172 = [v171 acceptedCandidate];
  int v173 = [v172 isContinuousPathConversion];

  if (v173)
  {
    v174 = [(TITypingSession *)self currentWord];
    v175 = [v174 allTouchesM];
    if ([v175 count])
    {
      v176 = [(TITypingSession *)self currentWord];
      v177 = [v176 allTouchesM];
      v178 = [v177 objectAtIndexedSubscript:0];
      int v179 = [v178 stage];

      uint64_t v35 = v328;
      if (v179 != 1) {
        goto LABEL_109;
      }
    }
    else
    {
    }
    v180 = [(TITypingSession *)self touchesHistory];
    v181 = NSNumber;
    v182 = [v324 touchEvent];
    v183 = objc_msgSend(v181, "numberWithInteger:", objc_msgSend(v182, "pathIndex"));
    v184 = [v180 objectForKey:v183];

    if ([v184 count])
    {
      v185 = [(TITypingSession *)self currentWord];
      v186 = [v185 allTouchesM];
      [v186 removeAllObjects];

      long long v340 = 0u;
      long long v338 = 0u;
      long long v339 = 0u;
      long long v337 = 0u;
      id v187 = v184;
      uint64_t v188 = [v187 countByEnumeratingWithState:&v337 objects:v348 count:16];
      if (v188)
      {
        uint64_t v189 = v188;
        uint64_t v190 = *(void *)v338;
        do
        {
          for (uint64_t i = 0; i != v189; ++i)
          {
            if (*(void *)v338 != v190) {
              objc_enumerationMutation(v187);
            }
            v192 = *(void **)(*((void *)&v337 + 1) + 8 * i);
            v193 = [(TITypingSession *)self currentWord];
            v194 = [v192 touch];
            objc_msgSend(v193, "addTouchEvent:withLayoutId:", v194, objc_msgSend(v192, "layoutId"));

            v195 = [(TITypingSession *)self lastWord];
            v196 = [v195 allTouchesM];
            v197 = [v192 touch];
            [v196 removeObject:v197];
          }
          uint64_t v189 = [v187 countByEnumeratingWithState:&v337 objects:v348 count:16];
        }
        while (v189);
      }

      uint64_t v28 = v324;
      uint64_t v35 = v328;
    }
  }
LABEL_109:
  if (IXACanLogMessageAtLevel())
  {
    v198 = IXASessionDetailsLogFacility();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG))
    {
      v251 = NSString;
      v252 = [(TITypingSession *)self currentWord];
      v253 = wordEntryDetailForLog(v252, 0);
      id v254 = [v251 stringWithFormat:@"%s %@", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v253];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v254;
      _os_log_debug_impl(&dword_1E3F0E000, v198, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  v199 = [(TITypingSession *)self currentWord];
  v200 = [v199 acceptedCandidate];
  int v201 = [v200 isToucanInlineCompletionCandidate];

  if (!v201) {
    goto LABEL_174;
  }
  v202 = [(TITypingSession *)self currentWord];
  v203 = [v202 allKeyboardInputs];
  uint64_t v204 = [v203 count];

  if (!v204)
  {
    v205 = [(TITypingSession *)self currentWord];
    v206 = [v205 acceptedCandidate];

    v207 = [v206 input];
    if ([v207 endsInWhitespace])
    {
      v208 = [v206 candidate];
      v209 = [v206 input];
      int v210 = [v208 hasPrefix:v209];

      if (!v210)
      {
LABEL_119:

        goto LABEL_120;
      }
      v317 = [(TITypingSession *)self currentWord];
      v211 = [v317 documentState];
      v212 = [v206 candidate];
      v213 = [v206 input];
      v214 = objc_msgSend(v212, "substringToIndex:", objc_msgSend(v213, "length"));
      v215 = [v211 documentStateAfterInsertingText:v214];
      v216 = [(TITypingSession *)self currentWord];
      [v216 setDocumentState:v215];

      uint64_t v35 = v328;
      v217 = [v206 candidate];
      v218 = [v206 input];
      v219 = objc_msgSend(v217, "substringFromIndex:", objc_msgSend(v218, "length"));
      v220 = [(TITypingSession *)self currentWord];
      [v220 setAcceptedString:v219];

      v207 = [(TITypingSession *)self currentWord];
      v221 = [v207 acceptedString];
      v222 = [v206 candidateByReplacingWithCandidate:v221 input:&stru_1F3F7A998 rawInput:&stru_1F3F7A998];
      v223 = [(TITypingSession *)self currentWord];
      [v223 setAcceptedCandidate:v222];
    }
    goto LABEL_119;
  }
LABEL_120:
  v224 = [(TITypingSession *)self currentWord];
  v225 = [v224 acceptedString];
  v226 = [v225 componentsSeparatedByString:@" "];

  if ((unint64_t)[v226 count] >= 2)
  {
    v314 = v226;
    if (!v28)
    {
      v250 = 0;
      v325 = 0;
      goto LABEL_167;
    }
    v227 = [(TITypingSession *)self currentWord];
    v228 = [v227 allTouchesM];
    if ((unint64_t)[v228 count] < 3)
    {
      v250 = 0;
      v325 = 0;
    }
    else
    {
      v229 = [(TITypingSession *)self currentWord];
      [v229 touchLayoutsM];
      v230 = v311 = v227;
      uint64_t v318 = [v230 count];
      v231 = [(TITypingSession *)self currentWord];
      v232 = [v231 allTouchesM];
      uint64_t v233 = [v232 count];

      if (v318 != v233)
      {
        v250 = 0;
        v325 = 0;
        uint64_t v35 = v328;
        goto LABEL_167;
      }
      v312 = [MEMORY[0x1E4F28E60] indexSet];
      v307 = [MEMORY[0x1E4F28E60] indexSet];
      v234 = [(TITypingSession *)self currentWord];
      v235 = [v234 allTouchesM];
      int v236 = [v235 count];

      uint64_t v237 = (v236 - 1);
      if (v236 - 1 >= 0)
      {
        v306 = 0;
        v309 = 0;
        uint64_t v319 = -1;
        uint64_t v238 = -1;
        while (1)
        {
          v239 = [(TITypingSession *)self currentWord];
          v240 = [v239 allTouchesM];
          v241 = [v240 objectAtIndexedSubscript:v237];

          v242 = [(TITypingSession *)self currentWord];
          v243 = [v242 touchLayoutsM];
          v244 = [v243 objectAtIndexedSubscript:v237];

          if ([v241 pathIndex] == v238)
          {
            [v312 addIndex:v237];
            if (![v241 stage])
            {
              if (!v309)
              {
                v309 = -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", [v241 forcedKeyCode], v244);
              }
              uint64_t v238 = -2;
            }
          }
          else
          {
            if ([v241 pathIndex] == v319)
            {
              [v307 addIndex:v237];
              if ([v241 stage]) {
                goto LABEL_145;
              }
              if (!v306)
              {
                v306 = -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", [v241 forcedKeyCode], v244);
              }
              uint64_t v245 = -2;
LABEL_144:
              uint64_t v319 = v245;
              goto LABEL_145;
            }
            if (v238 == -1)
            {
              if ([v241 stage] == 2)
              {
                [v312 addIndex:v237];
                uint64_t v238 = [v241 pathIndex];
                uint64_t v247 = -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", [v241 forcedKeyCode], v244);

                v309 = (void *)v247;
              }
              else
              {
                uint64_t v238 = -3;
              }
              goto LABEL_145;
            }
            if (v319 == -1)
            {
              if ([v241 stage] == 2)
              {
                [v307 addIndex:v237];
                uint64_t v319 = [v241 pathIndex];
                uint64_t v246 = -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", [v241 forcedKeyCode], v244);

                v306 = (void *)v246;
                goto LABEL_145;
              }
              uint64_t v245 = -3;
              goto LABEL_144;
            }
          }
LABEL_145:

          if ((unint64_t)(v319 + 1) >= 0xFFFFFFFFFFFFFFFELL
            && (unint64_t)(v238 + 1) >= 0xFFFFFFFFFFFFFFFELL)
          {
            uint64_t v28 = v324;
            goto LABEL_157;
          }
          BOOL v249 = v237-- <= 0;
          uint64_t v28 = v324;
          if (v249) {
            goto LABEL_157;
          }
        }
      }
      v309 = 0;
      v306 = 0;
      uint64_t v238 = -1;
      uint64_t v319 = -1;
LABEL_157:
      v255 = [MEMORY[0x1E4F28E60] indexSet];
      if (v238 == -2)
      {
        v256 = [v28 string];
        int v257 = [v309 isEqualToString:v256];

        if (v257)
        {
          [v255 addIndexes:v312];
          if (v319 == -2)
          {
            if ([v306 isEqualToString:@"more"]) {
              [v255 addIndexes:v307];
            }
          }
        }
      }
      uint64_t v35 = v328;
      if ([v255 count])
      {
        v258 = [(TITypingSession *)self currentWord];
        v259 = [v258 allTouchesM];
        v250 = [v259 objectsAtIndexes:v255];

        v260 = [(TITypingSession *)self currentWord];
        v261 = [v260 touchLayoutsM];
        v325 = [v261 objectsAtIndexes:v255];

        v262 = [(TITypingSession *)self currentWord];
        v263 = [v262 allTouchesM];
        [v263 removeObjectsAtIndexes:v255];

        v264 = [(TITypingSession *)self currentWord];
        v265 = [v264 touchLayoutsM];
        [v265 removeObjectsAtIndexes:v255];
      }
      else
      {
        v250 = 0;
        v325 = 0;
      }

      v227 = v312;
      v228 = v307;
    }

LABEL_167:
    v266 = [(TITypingSession *)self currentWord];
    v267 = [v266 acceptedCandidate];

    v268 = [(TITypingSession *)self currentWord];
    v269 = [v268 keyboardState];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v344 = 0x3032000000;
    v345 = __Block_byref_object_copy__23133;
    v346 = __Block_byref_object_dispose__23134;
    v270 = [(TITypingSession *)self currentWord];
    id v347 = [v270 documentState];

    v271 = [(TITypingSession *)self currentWord];
    [v271 endTime];
    uint64_t v273 = v272;

    v329[0] = MEMORY[0x1E4F143A8];
    v329[1] = 3221225472;
    v329[2] = __152__TITypingSession_candidateAccepted_withInput_documentState_inputContext_inputStem_predictionBarHit_useCandidateSelection_candidateIndex_keyboardState___block_invoke;
    v329[3] = &unk_1E6E2E0B8;
    id v320 = v267;
    id v330 = v320;
    p_long long buf = &buf;
    id v274 = v269;
    id v331 = v274;
    v332 = self;
    id v333 = v226;
    id v334 = v35;
    uint64_t v336 = v273;
    [v333 enumerateObjectsUsingBlock:v329];
    v275 = v325;
    if (v250 && v325)
    {
      v276 = (void *)[v250 mutableCopy];
      [(TITypingSession *)self currentWord];
      v278 = id v277 = v274;
      [v278 setAllTouchesM:v276];

      v279 = (void *)[v325 mutableCopy];
      v280 = [(TITypingSession *)self currentWord];
      [v280 setTouchLayoutsM:v279];

      id v274 = v277;
    }
    v281 = [v28 string];
    int v282 = [v281 endsInPunctuation] & !a9;

    if (v282 == 1)
    {
      v313 = [(TITypingSession *)self currentWord];
      v308 = [v313 acceptedCandidate];
      v310 = [(TITypingSession *)self currentWord];
      v283 = [v310 acceptedCandidate];
      v284 = [v283 candidate];
      v285 = [v28 string];
      [v284 stringByAppendingString:v285];
      v286 = id v315 = v274;
      [v308 candidateByReplacingWithCandidate:v286];
      v288 = v287 = v250;
      v289 = [(TITypingSession *)self currentWord];
      [v289 setAcceptedCandidate:v288];

      v250 = v287;
      uint64_t v35 = v328;

      v290 = [(TITypingSession *)self currentWord];
      v291 = [v290 acceptedCandidate];
      v292 = [v291 candidate];
      v293 = [(TITypingSession *)self currentWord];
      [v293 setAcceptedString:v292];

      id v274 = v315;
      v275 = v325;

      v294 = [(TITypingSession *)self currentWord];
      [v294 setIsPunctuationEntryFollowingAWord:1];
    }
    _Block_object_dispose(&buf, 8);

    v226 = v314;
  }

LABEL_174:
  v295 = [(TITypingSession *)self currentWord];
  [v295 setOrigin:4];

  v296 = [(TITypingSession *)self userActionHistory];
  v297 = [(TITypingSession *)self currentWord];
  [v296 addObject:v297];

  id v18 = v321;
  if (IXACanLogMessageAtLevel())
  {
    v298 = IXASessionDetailsLogFacility();
    if (os_log_type_enabled(v298, OS_LOG_TYPE_DEBUG))
    {
      v301 = NSString;
      v302 = [(TITypingSession *)self currentWord];
      v303 = wordEntryDetailForLog(v302, 3);
      id v304 = [v301 stringWithFormat:@"%s %@", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v303];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v304;
      _os_log_debug_impl(&dword_1E3F0E000, v298, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      id v18 = v321;
    }
  }
  if (IXACanLogMessageAtLevel())
  {
    v299 = IXASessionDetailsLogFacility();
    if (os_log_type_enabled(v299, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s CA detail ----------------", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]");
      id v305 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v305;
      _os_log_debug_impl(&dword_1E3F0E000, v299, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  v300 = [(TITypingSession *)self currentWord];
  [(TITypingSession *)self setLastWord:v300];

  [(TITypingSession *)self resetCurrentWord];
  [(TITypingSession *)self setCandidateAcceptedTrigger:*MEMORY[0x1E4FAE558]];

LABEL_20:
}

void __152__TITypingSession_candidateAccepted_withInput_documentState_inputContext_inputStem_predictionBarHit_useCandidateSelection_candidateIndex_keyboardState___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    if ([*(id *)(a1 + 56) count] - 1 <= a3)
    {
      BOOL v60 = [*(id *)(a1 + 32) candidateByReplacingWithCandidate:v5 input:&stru_1F3F7A998 rawInput:&stru_1F3F7A998];
      v61 = [*(id *)(a1 + 48) currentWord];
      [v61 setAcceptedCandidate:v60];

      v62 = [*(id *)(a1 + 48) currentWord];
      [v62 setAcceptedString:v5];

      v63 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
      uint64_t v64 = [*(id *)(a1 + 48) currentWord];
      [v64 setDocumentState:v63];

      id v65 = (void *)[*(id *)(a1 + 40) copy];
      v66 = [*(id *)(a1 + 48) currentWord];
      [v66 setKeyboardState:v65];

      v67 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) documentStateAfterInsertingText:v5];
      v68 = [*(id *)(a1 + 48) currentWord];
      int v69 = [v68 keyboardState];
      [v69 setDocumentState:v67];

      char v70 = [*(id *)(a1 + 48) currentWord];
      [v70 setInputStem:&stru_1F3F7A998];

      v71 = [*(id *)(a1 + 48) currentWord];
      char v72 = [v71 documentState];
      v73 = [v72 contextBeforeInput];
      v74 = [*(id *)(a1 + 48) currentWord];
      [v74 setInputContext:v73];

      v75 = [MEMORY[0x1E4F1CA48] array];
      v76 = [*(id *)(a1 + 48) currentWord];
      [v76 setCandidatesOfferedM:v75];

      int v77 = [MEMORY[0x1E4F1CA48] array];
      v78 = [*(id *)(a1 + 48) currentWord];
      [v78 setAllKeyboardInputsM:v77];

      v79 = [MEMORY[0x1E4F1CA48] array];
      int v80 = [*(id *)(a1 + 48) currentWord];
      [v80 setAllTouchesM:v79];

      v81 = [MEMORY[0x1E4F1CA48] array];
      v82 = [*(id *)(a1 + 48) currentWord];
      [v82 setTouchLayoutsM:v81];

      double v83 = *(double *)(a1 + 80);
      v84 = [*(id *)(a1 + 48) currentWord];
      [v84 setOccurenceTime:v83];

      double v85 = *(double *)(a1 + 80);
      uint64_t v86 = [*(id *)(a1 + 48) currentWord];
      [v86 setStartTime:v85];

      double v87 = *(double *)(a1 + 80);
      uint64_t v88 = [*(id *)(a1 + 48) currentWord];
      [v88 setEndTime:v87];

      goto LABEL_11;
    }
    id v6 = objc_alloc_init(TIWordEntry);
    id v7 = [*(id *)(a1 + 32) candidateByReplacingWithCandidate:v5 input:&stru_1F3F7A998 rawInput:&stru_1F3F7A998];
    [(TIWordEntry *)v6 setAcceptedCandidate:v7];

    uint64_t v8 = [(TIWordEntry *)v6 acceptedCandidate];
    BOOL v9 = [v8 candidate];
    [(TIWordEntry *)v6 setAcceptedString:v9];

    uint64_t v10 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
    [(TIUserAction *)v6 setDocumentState:v10];

    BOOL v11 = (void *)[*(id *)(a1 + 64) copy];
    [(TIUserAction *)v6 setKeyboardState:v11];

    BOOL v12 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) documentStateAfterInsertingText:v5];
    uint64_t v13 = [(TIUserAction *)v6 keyboardState];
    [v13 setDocumentState:v12];

    id v14 = [(TIUserAction *)v6 keyboardState];
    uint64_t v15 = [v14 documentState];
    uint64_t v16 = [v15 documentStateAfterInsertingText:@" "];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    id v19 = [*(id *)(a1 + 48) currentWord];
    -[TIWordEntry setWordEntryType:](v6, "setWordEntryType:", [v19 wordEntryType]);

    [(TIWordEntry *)v6 setInputStem:&stru_1F3F7A998];
    uint64_t v20 = [(TIUserAction *)v6 documentState];
    uint64_t v21 = [v20 contextBeforeInput];
    [(TIWordEntry *)v6 setInputContext:v21];

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    [(TIWordEntry *)v6 setCandidatesOfferedM:v22];

    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    [(TIWordEntry *)v6 setAllKeyboardInputsM:v23];

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    [(TIWordEntry *)v6 setAllTouchesM:v24];

    int v25 = [MEMORY[0x1E4F1CA48] array];
    [(TIWordEntry *)v6 setTouchLayoutsM:v25];

    [(TIUserAction *)v6 setOccurenceTime:*(double *)(a1 + 80)];
    [(TIUserAction *)v6 setStartTime:*(double *)(a1 + 80)];
    [(TIUserAction *)v6 setEndTime:*(double *)(a1 + 80)];
    [(TIWordEntry *)v6 setOrigin:4];
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAccepted:", objc_msgSend(*(id *)(a1 + 48), "candidatesAccepted") + 1);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAcceptedWithText:", objc_msgSend(*(id *)(a1 + 48), "candidatesAcceptedWithText") + 1);
    uint64_t v26 = [*(id *)(a1 + 48) userActionHistory];
    [v26 addObject:v6];

    if (IXACanLogMessageAtLevel())
    {
      uint64_t v27 = IXASessionDetailsLogFacility();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = NSString;
        v29 = wordEntryDetailForLog(v6, 2);
        uint64_t v30 = [v28 stringWithFormat:@"%s %@", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]_block_invoke", v29];
        *(_DWORD *)long long buf = 138412290;
        v91 = v30;
LABEL_13:
        _os_log_debug_impl(&dword_1E3F0E000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_8;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = objc_alloc_init(TIWordEntry);
    char v31 = [*(id *)(a1 + 32) candidateByReplacingWithCandidate:v5];
    [(TIWordEntry *)v6 setAcceptedCandidate:v31];

    int v32 = [(TIWordEntry *)v6 acceptedCandidate];
    v33 = [v32 candidate];
    [(TIWordEntry *)v6 setAcceptedString:v33];

    int v34 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
    [(TIUserAction *)v6 setDocumentState:v34];

    uint64_t v35 = (void *)[*(id *)(a1 + 40) copy];
    [(TIUserAction *)v6 setKeyboardState:v35];

    uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) documentStateAfterInsertingText:v5];
    v37 = [(TIUserAction *)v6 keyboardState];
    [v37 setDocumentState:v36];

    v38 = [(TIUserAction *)v6 keyboardState];
    int v39 = [v38 documentState];
    uint64_t v40 = [v39 documentStateAfterInsertingText:@" "];
    uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    int v43 = [*(id *)(a1 + 48) currentWord];
    -[TIWordEntry setWordEntryType:](v6, "setWordEntryType:", [v43 wordEntryType]);

    v44 = [*(id *)(a1 + 48) currentWord];
    v45 = [v44 inputStem];
    [(TIWordEntry *)v6 setInputStem:v45];

    v46 = [*(id *)(a1 + 48) currentWord];
    v47 = [v46 inputContext];
    [(TIWordEntry *)v6 setInputContext:v47];

    int v48 = [*(id *)(a1 + 48) currentWord];
    v49 = [v48 candidatesOfferedM];
    [(TIWordEntry *)v6 setCandidatesOfferedM:v49];

    int v50 = [*(id *)(a1 + 48) currentWord];
    v51 = [v50 allKeyboardInputsM];
    [(TIWordEntry *)v6 setAllKeyboardInputsM:v51];

    int v52 = [*(id *)(a1 + 48) currentWord];
    v53 = [v52 allTouchesM];
    [(TIWordEntry *)v6 setAllTouchesM:v53];

    int v54 = [*(id *)(a1 + 48) currentWord];
    v55 = [v54 touchLayoutsM];
    [(TIWordEntry *)v6 setTouchLayoutsM:v55];

    int v56 = [*(id *)(a1 + 48) currentWord];
    [v56 occurenceTime];
    -[TIUserAction setOccurenceTime:](v6, "setOccurenceTime:");

    v57 = [*(id *)(a1 + 48) currentWord];
    [v57 startTime];
    -[TIUserAction setStartTime:](v6, "setStartTime:");

    int v58 = [*(id *)(a1 + 48) currentWord];
    [v58 endTime];
    -[TIUserAction setEndTime:](v6, "setEndTime:");

    [(TIWordEntry *)v6 setOrigin:4];
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAccepted:", objc_msgSend(*(id *)(a1 + 48), "candidatesAccepted") + 1);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAcceptedWithText:", objc_msgSend(*(id *)(a1 + 48), "candidatesAcceptedWithText") + 1);
    BOOL v59 = [*(id *)(a1 + 48) userActionHistory];
    [v59 addObject:v6];

    if (IXACanLogMessageAtLevel())
    {
      uint64_t v27 = IXASessionDetailsLogFacility();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v89 = NSString;
        v29 = wordEntryDetailForLog(v6, 1);
        uint64_t v30 = [v89 stringWithFormat:@"%s %@", "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]_block_invoke", v29];
        *(_DWORD *)long long buf = 138412290;
        v91 = v30;
        goto LABEL_13;
      }
LABEL_8:
    }
  }

LABEL_11:
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  if (IXACanLogMessageAtLevel())
  {
    id v5 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [NSString stringWithFormat:@"%s TA trigger: %@", "-[TITypingSession acceptingCandidateWithTrigger:]", v4];
      *(_DWORD *)long long buf = 138412290;
      BOOL v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  candidateAcceptedTrigger = self->_candidateAcceptedTrigger;
  self->_candidateAcceptedTrigger = v4;
}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v8 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = NSString;
      id v14 = [v6 corrections];
      uint64_t v15 = [v14 autocorrection];
      uint64_t v16 = [v6 predictions];
      uint64_t v17 = [v13 stringWithFormat:@"%s CO autocorrection: %@ predictions: %@", "-[TITypingSession candidatesOffered:keyboardState:]", v15, v16];
      *(_DWORD *)long long buf = 138412290;
      id v19 = v17;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (([v7 secureTextEntry] & 1) == 0
    && ![(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    BOOL v9 = [v6 corrections];
    uint64_t v10 = [v9 autocorrection];
    if (v10)
    {
    }
    else
    {
      BOOL v11 = [v6 predictions];

      if (!v11) {
        goto LABEL_12;
      }
    }
    BOOL v12 = [(TITypingSession *)self currentWord];
    [v12 addCandidateOffered:v6];

    [(NSMutableArray *)self->_cachedCandidatesOffered addObject:v6];
    [(TITypingSession *)self updateCachedStateBeforeFirstInputWithKeyboardState:v7];
    goto LABEL_12;
  }
  [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
LABEL_12:
}

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v8 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s LC firstKeyString: '%s'", "-[TITypingSession layoutDidChange:keyboardState:]", objc_msgSend(v6, "firstKeyString"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (([v7 secureTextEntry] & 1) != 0
    || [(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
  }
  else if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = -1;
    BOOL v9 = [(TITypingSession *)self layouts];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__TITypingSession_layoutDidChange_keyboardState___block_invoke;
    v14[3] = &unk_1E6E2E090;
    id v10 = v6;
    id v15 = v10;
    p_long long buf = &buf;
    uint64_t v17 = &v18;
    [v9 enumerateObjectsUsingBlock:v14];

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      [(NSMutableArray *)self->_layouts addObject:v10];
      BOOL v11 = [(TITypingSession *)self layouts];
      uint64_t v12 = [v11 count];
      v19[3] = v12 - 1;
    }
    [(TITypingSession *)self setCurrentLayoutID:v19[3]];
    [(TITypingSession *)self updateCachedStateBeforeFirstInputWithKeyboardState:v7];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __49__TITypingSession_layoutDidChange_keyboardState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)addTouchEvent:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IXACanLogMessageAtLevel())
  {
    id v6 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v32 = [NSString stringWithFormat:@"%s TO touch: %@", "-[TITypingSession addTouchEvent:]", v5];
      *(_DWORD *)long long buf = 138412290;
      int v48 = v32;
      _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (![(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    if (!self->_timeCalibrationTouch)
    {
      objc_storeStrong((id *)&self->_timeCalibrationTouch, a3);
      self->_double calibratedTimeBase = CFAbsoluteTimeGetCurrent();
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v7 = self->_userActionHistory;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v42 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            [v5 timestamp];
            double v14 = v13;
            double calibratedTimeBase = self->_calibratedTimeBase;
            [v12 occurenceTime];
            [v12 setOccurenceTime:v14 - (calibratedTimeBase + v16)];
          }
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v9);
      }
    }
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      uint64_t v17 = TIOSLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v33 = NSString;
        [v5 timestamp];
        uint64_t v35 = objc_msgSend(v33, "stringWithFormat:", @"%s touch %lf", "-[TITypingSession addTouchEvent:]", v34);
        *(_DWORD *)long long buf = 138412290;
        int v48 = v35;
        _os_log_debug_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    uint64_t v18 = objc_alloc_init(TIKBSessionTouchInfo);
    [(TIKBSessionTouchInfo *)v18 setTouch:v5];
    [(TIKBSessionTouchInfo *)v18 setLayoutId:self->_currentLayoutID];
    id v19 = [(TITypingSession *)self touchesHistory];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "pathIndex"));
    uint64_t v21 = [v19 objectForKey:v20];

    if (![v5 stage])
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA48] array];

      uint64_t v21 = (void *)v22;
    }
    [v21 addObject:v18];
    if ([v5 stage] == 2)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v36 = v18;
        uint64_t v26 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            v29 = [(TITypingSession *)self currentWord];
            uint64_t v30 = [v28 touch];
            objc_msgSend(v29, "addTouchEvent:withLayoutId:", v30, objc_msgSend(v28, "layoutId"));
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v25);
        uint64_t v18 = v36;
      }
    }
    else
    {
      if (!v21)
      {
LABEL_35:

        goto LABEL_36;
      }
      id v23 = [(TITypingSession *)self touchesHistory];
      char v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "pathIndex"));
      [v23 setObject:v21 forKey:v31];
    }
    goto LABEL_35;
  }
LABEL_36:
}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  id v8 = a4;
  if (([v8 secureTextEntry] & 1) != 0
    || [(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
  }
  else
  {
    id v6 = [[TIPathAction alloc] initWithSyllableCount:a3 keyboardState:v8];
    [(TITypingSession *)self calibratedCurrentTimestamp];
    -[TIUserAction setOccurenceTime:](v6, "setOccurenceTime:");
    id v7 = [(TITypingSession *)self userActionHistory];
    [v7 addObject:v6];
  }
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    id v8 = IXASessionEventsLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [NSString stringWithFormat:@"%s KI input: %@", "-[TITypingSession addKeyInput:keyboardState:]", v6];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (([v7 secureTextEntry] & 1) != 0
    || [(TITypingSession *)self didReceiveSecureFieldEvent])
  {
    [(TITypingSession *)self setDidReceiveSecureFieldEvent:1];
  }
  else
  {
    if ([(TITypingSession *)self includeInputToLastWord])
    {
      uint64_t v9 = [(TITypingSession *)self lastWord];
      [v9 addKeyInput:v6];

      [(TITypingSession *)self setLastWord:0];
    }
    else if ([(TITypingSession *)self includeInputToLastDeletion])
    {
      uint64_t v10 = [(TITypingSession *)self lastDeletion];
      [v10 addKeyInput:v6];

      [(TITypingSession *)self setLastDeletion:0];
    }
    else
    {
      BOOL v11 = [(TITypingSession *)self currentWord];
      [v11 addKeyInput:v6];

      uint64_t v12 = [(TITypingSession *)self currentWord];
      [v12 setKeyboardState:v7];

      [(TITypingSession *)self updateCachedStateAfterLastInputWithKeyboardState:v7];
    }
    [(TITypingSession *)self setIncludeInputToLastWord:0];
    [(TITypingSession *)self setIncludeInputToLastDeletion:0];
    [(TITypingSession *)self setLastInput:v6];
    if ([v6 isBackspace])
    {
      double v13 = self;
      id v14 = v7;
    }
    else
    {
      double v13 = self;
      id v14 = 0;
    }
    [(TITypingSession *)v13 setSavedDeleteInputKeyboardState:v14];
  }
}

- (BOOL)testForRapidDeleteContextChange:(id)a3
{
  id v5 = a3;
  id v6 = [(TITypingSession *)self savedDeleteInputKeyboardState];

  if (v6)
  {
    id v7 = [v5 documentState];
    id v8 = [(TITypingSession *)self savedDeleteInputKeyboardState];
    uint64_t v9 = [v8 documentState];

    uint64_t v10 = [v7 contextAfterInput];
    if (!v10)
    {
      uint64_t v14 = [v9 contextAfterInput];
      if (v14)
      {
        id v15 = (void *)v14;
        BOOL v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    BOOL v11 = [v7 contextAfterInput];
    if (!v11 || ([v9 contextAfterInput], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v16 = [v7 contextAfterInput];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [v9 contextAfterInput];
        id v19 = [v7 contextAfterInput];
        char v12 = [v18 isEqualToString:v19] ^ 1;

        if (!v11) {
          goto LABEL_12;
        }
      }
      else
      {
        char v12 = 0;
        if (!v11)
        {
LABEL_12:

          if ((v12 & 1) == 0)
          {
            uint64_t v20 = [v7 contextBeforeInput];
            if (!v20
              || (uint64_t v21 = (void *)v20,
                  [v7 contextBeforeInput],
                  uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                  int v23 = [v22 isEqualToString:&stru_1F3F7A998],
                  v22,
                  v21,
                  v23))
            {
              id v15 = [v9 contextBeforeInput];
              BOOL v13 = (unint64_t)[v15 length] > 1;
              goto LABEL_17;
            }
            uint64_t v25 = [v9 contextBeforeInput];
            uint64_t v26 = [v7 contextBeforeInput];
            int v27 = [v25 hasPrefix:v26];

            if (v27)
            {
              id v15 = [v9 contextBeforeInput];
              uint64_t v28 = [v15 length];
              v29 = [v7 contextBeforeInput];
              BOOL v13 = (unint64_t)(v28 - [v29 length]) > 1;

              goto LABEL_17;
            }
          }
          BOOL v13 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    else
    {
      char v12 = 1;
    }

    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (void)updateCachedStateAfterLastInputWithKeyboardState:(id)a3
{
  id v7 = a3;
  [(TITypingSession *)self updateCachedStateBeforeFirstInputWithKeyboardState:v7];
  BOOL v4 = v7;
  if (v7)
  {
    cachedKeyboardStates = self->_cachedKeyboardStates;
    id v6 = (void *)[v7 copy];
    [(NSMutableArray *)cachedKeyboardStates addObject:v6];

    BOOL v4 = v7;
  }
}

- (void)updateCachedStateBeforeFirstInputWithKeyboardState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    id v4 = (id)[(NSMutableArray *)self->_cachedKeyboardStates count];
    id v5 = v8;
    if (!v4)
    {
      cachedKeyboardStates = self->_cachedKeyboardStates;
      id v7 = (void *)[v8 copy];
      [(NSMutableArray *)cachedKeyboardStates addObject:v7];

      id v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)resetCurrentWord
{
  currentWord = self->_currentWord;
  self->_currentWord = 0;

  [(NSMutableArray *)self->_cachedKeyboardStates removeAllObjects];
  cachedCandidatesOffered = self->_cachedCandidatesOffered;

  [(NSMutableArray *)cachedCandidatesOffered removeAllObjects];
}

- (TIWordEntry)currentWord
{
  currentWord = self->_currentWord;
  if (!currentWord)
  {
    id v4 = objc_alloc_init(TIWordEntry);
    id v5 = self->_currentWord;
    self->_currentWord = v4;

    currentWord = self->_currentWord;
  }

  return currentWord;
}

- (BOOL)isCurrentWordEmpty
{
  return self->_currentWord == 0;
}

- (double)calibratedCurrentTimestamp
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  timeCalibrationTouch = self->_timeCalibrationTouch;
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = Current;
  if (!timeCalibrationTouch) {
    return -Current;
  }
  double calibratedTimeBase = self->_calibratedTimeBase;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  double v7 = v5 - calibratedTimeBase;
  if (TICanLogMessageAtLevel_logLevel)
  {
    id v8 = TIOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = NSString;
      [(TIKeyboardTouchEvent *)self->_timeCalibrationTouch timestamp];
      BOOL v13 = objc_msgSend(v11, "stringWithFormat:", @"%s calibrated timestamp %lf", "-[TITypingSession calibratedCurrentTimestamp]", v7 + v12);
      *(_DWORD *)long long buf = 138412290;
      id v15 = v13;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [(TIKeyboardTouchEvent *)self->_timeCalibrationTouch timestamp];
  return v7 + v9;
}

- (void)endSessionWithTimestamp:(id)a3
{
  id v4 = a3;
  [(TITypingSession *)self handleUncommittedWord];
  [(TITypingSession *)self setEndTime:v4];
}

- (NSUUID)sessionId
{
  sessionId = self->_sessionId;
  if (!sessionId)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    double v5 = self->_sessionId;
    self->_sessionId = v4;

    sessionId = self->_sessionId;
  }
  id v6 = sessionId;

  return v6;
}

- (NSString)description
{
  v2 = [(TITypingSession *)self userActionHistory];
  v3 = [v2 componentsJoinedByString:@"; "];

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  userActionHistory = self->_userActionHistory;
  id v5 = a3;
  [v5 encodeObject:userActionHistory forKey:@"userActionHistory"];
  [v5 encodeObject:self->_layoutName forKey:@"layoutName"];
  [v5 encodeObject:self->_startContext forKey:@"startContext"];
  [v5 encodeObject:self->_layouts forKey:@"layouts"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_startTime forKey:@"startTime"];
  [v5 encodeObject:self->_endTime forKey:@"endTime"];
  [v5 encodeObject:self->_sessionId forKey:@"sessionId"];
  [v5 encodeObject:self->_applicationID forKey:@"applicationID"];
  [v5 encodeBool:self->_didReceiveSecureFieldEvent forKey:@"didReceiveSecureFieldEvent"];
  [v5 encodeBool:self->_candidatesAccepted != 0 forKey:@"candidatesAccepted"];
  [v5 encodeBool:self->_candidatesAcceptedWithText != 0 forKey:@"candidatesAcceptedWithText"];
}

- (TITypingSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TITypingSession;
  id v5 = [(TITypingSession *)&v36 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    BOOL v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"userActionHistory"];
    userActionHistory = v5->_userActionHistory;
    v5->_userActionHistory = (NSMutableArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutName"];
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startContext"];
    startContext = v5->_startContext;
    v5->_startContext = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"layouts"];
    layouts = v5->_layouts;
    v5->_layouts = (NSMutableArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionId"];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationID"];
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v31;

    v5->_didReceiveSecureFieldEvent = [v4 decodeBoolForKey:@"didReceiveSecureFieldEvent"];
    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    touchesHistory = v5->_touchesHistory;
    v5->_touchesHistory = (NSMutableDictionary *)v33;

    v5->_candidatesAccepted = [v4 decodeIntForKey:@"candidatesAccepted"];
    v5->_candidatesAcceptedWithText = [v4 decodeIntForKey:@"candidatesAcceptedWithText"];
  }

  return v5;
}

- (TITypingSession)initWithLocale:(id)a3 keyboardLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TITypingSession;
  uint64_t v9 = [(TITypingSession *)&v27 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    userActionHistory = v9->_userActionHistory;
    v9->_userActionHistory = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    layouts = v9->_layouts;
    v9->_layouts = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_locale, a3);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    startTime = v9->_startTime;
    v9->_startTime = (NSDate *)v14;

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSUUID *)v16;

    timeCalibrationTouch = v9->_timeCalibrationTouch;
    v9->_timeCalibrationTouch = 0;
    v9->_double calibratedTimeBase = 0.0;

    savedDeleteInputKeyboardState = v9->_savedDeleteInputKeyboardState;
    v9->_savedDeleteInputKeyboardState = 0;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    touchesHistory = v9->_touchesHistory;
    v9->_touchesHistory = (NSMutableDictionary *)v20;

    if (v8)
    {
      [(NSMutableArray *)v9->_layouts addObject:v8];
      v9->_currentLayoutID = 0;
    }
    objc_storeStrong((id *)&v9->_contextChangeTrigger, (id)*MEMORY[0x1E4FAE5B0]);
    objc_storeStrong((id *)&v9->_candidateAcceptedTrigger, (id)*MEMORY[0x1E4FAE558]);
    v9->_candidatesAccepted = 0;
    v9->_candidatesAcceptedWithText = 0;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    cachedKeyboardStates = v9->_cachedKeyboardStates;
    v9->_cachedKeyboardStates = (NSMutableArray *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    cachedCandidatesOffered = v9->_cachedCandidatesOffered;
    v9->_cachedCandidatesOffered = (NSMutableArray *)v24;
  }
  return v9;
}

- (TITypingSession)init
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(TITypingSession *)self initWithLocale:v3 keyboardLayout:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end