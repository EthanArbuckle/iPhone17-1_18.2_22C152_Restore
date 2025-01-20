@interface TIKeyboardInputManagerMecabra
+ (Class)wordSearchClass;
+ (id)dummyGeometryData;
+ (id)dummyTouchData;
+ (id)initializedClients;
+ (id)inputMethodWithChainedKeyboardInputManager:(id)a3;
+ (id)offlineLearningHandleForInputMode:(id)a3;
+ (void)removeDynamicDictionaryForInputMode:(id)a3;
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)alreadyGeneratedCandidates;
- (BOOL)apostropheEndsSentence;
- (BOOL)canTypeAndPathSimultaneously;
- (BOOL)hasBackspacedIntoInputString;
- (BOOL)hasCommittedPartialCandidate;
- (BOOL)inputSessionWantsStemWhenEditing;
- (BOOL)isProgressivelyPathing;
- (BOOL)needsTouchEvents;
- (BOOL)preservesComposingInput;
- (BOOL)shouldClearBeforeContinuousPath;
- (BOOL)shouldClearInputOnMarkedTextOutOfSync;
- (BOOL)shouldDelayUpdateComposedText;
- (BOOL)shouldInsertSpaceBeforePredictions;
- (BOOL)shouldResample;
- (BOOL)shouldRescaleTouchPoints;
- (BOOL)shouldUpdateLanguageModel;
- (BOOL)stringContainsActiveSupplementalLexiconSearchPrefix:(id)a3;
- (BOOL)stringEndsWord:(id)a3;
- (BOOL)supportsCandidateGeneration;
- (BOOL)supportsPerRecipientLearning;
- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (BOOL)updateLanguageModelForKeyboardState;
- (BOOL)usesComposingInput;
- (BOOL)usesContinuousPath;
- (BOOL)usesFavonius;
- (BOOL)usesMarkedTextForInput;
- (BOOL)whiteSpaceEndsSentence;
- (CGRect)baseCharacterKeysLayoutFrame;
- (CGRect)currentCharacterKeysLayoutFrame;
- (MCDrawInput)cancelledDrawInput;
- (MCKeyboardInput)composingInput;
- (MCKeyboardInput)previouslyDeletedTypeInput;
- (MCKeyboardInput)previouslyProcessedDeleteInput;
- (NSArray)clearedGeometryDataArray;
- (NSArray)clearedTouchDataArray;
- (NSCharacterSet)validCharacterSetForAutocorrection;
- (NSCharacterSet)validCharacterSetForSegmentation;
- (NSMutableArray)geometryDataArray;
- (NSMutableArray)touchDataArray;
- (NSMutableDictionary)touchDownEvents;
- (NSMutableDictionary)touchUpEvents;
- (NSString)currentClientIdentifier;
- (NSString)currentRecipientIdentifier;
- (NSString)remainingInput;
- (RefPtr<TI::Favonius::KeyboardLayout>)baseCharacterKeysLayout;
- (RefPtr<TI::Favonius::KeyboardLayout>)characterKeysLayoutFrom:(const void *)a3;
- (RefPtr<TI::Favonius::KeyboardLayout>)currentCharacterKeysLayout;
- (RefPtr<TI::Favonius::KeyboardLayout>)currentLayout;
- (TIKeyboardInputManagerMecabra)chainedKeyboardInputManager;
- (TIKeyboardInputManagerMecabra)composingKeyboardInputManager;
- (TIKeyboardInputManagerMecabra)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInputManagerMecabra)initWithKeyboardInputManagerToChain:(id)a3;
- (TIKeyboardInputManagerStickerTask)pendingStickerTask;
- (TIWordSearch)wordSearch;
- (TIWordSearchCandidateResultSet)wordSearchCandidateResultSet;
- (USet)validUSetForAutocorrection;
- (_NSRange)analysisStringRange;
- (__Mecabra)mecabra;
- (id).cxx_construct;
- (id)_convertInputsToSyntheticInputUptoCount:(int)a3 cursorIndex:(id)a4;
- (id)_convertInputsToSyntheticInputWithOffset:(unint64_t)a3;
- (id)adaptationContextReadingForReanalysisString:(id)a3 fromRecentlyCommittedCandidates:(id)a4;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)autocorrectionListFromWordSearchCandidateResultSet:(id)a3 emojiCandidates:(id)a4;
- (id)autocorrectionListWithCandidateCount:(unint64_t)a3;
- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3;
- (id)compositionCompletionHandler;
- (id)convertInput:(id)a3;
- (id)convertInputsToSyntheticInputUptoCount:(int)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)generateRefinementsForCandidate:(id)a3;
- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4;
- (id)geometryModelData;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputsToReject;
- (id)keyboardConfiguration;
- (id)lexiconLocaleOfCandidate:(void *)a3;
- (id)pathedWordSeparator;
- (id)processAcceptedCandidate:(id)a3;
- (id)segmentsFromCandidate:(id)a3 phraseBoundary:(BOOL)a4;
- (id)syllableSeparator;
- (id)touchDataForPathIndex:(int64_t)a3;
- (id)uncommittedText;
- (id)wordSeparator;
- (int)lastCommittedCandidateType;
- (int)mecabraTextContentTypeFromTITextContentType:(id)a3;
- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4;
- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (pair<NSString)_supplementalItemIdentifiersInCurrentSelection;
- (unint64_t)additionalAnalysisOptions;
- (unint64_t)autoquoteType;
- (unint64_t)inputIndexWithDrawInput;
- (unint64_t)maxDrawSamplesWithNoCandidatesResult;
- (unsigned)pathedWordSeparatorChar;
- (void)_completeComposition:(BOOL)a3;
- (void)_replaceComposingInputWithSyntheticInput:(id)a3 internalIndex:(unint64_t)a4;
- (void)abortComposition;
- (void)addProactiveTriggers:(id)a3 withCompletionHandler:(id)a4;
- (void)addStickers:(id)a3 withCompletionHandler:(id)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)cancelComposition;
- (void)candidateRejected:(id)a3;
- (void)clearInput;
- (void)commitComposition;
- (void)completeComposition;
- (void)composeTextWith:(id)a3;
- (void)dealloc;
- (void)deleteFromInputWithContext:(id)a3;
- (void)dropInputPrefix:(unsigned int)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)handlePerformBackgroundMaintenanceNotification;
- (void)incrementUsageTrackingKeysForDeleteFromInput;
- (void)insertDummyGeometryDataAtIndex:(unint64_t)a3;
- (void)insertDummyTouchDataAtIndex:(unint64_t)a3;
- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4;
- (void)lastAcceptedCandidateCorrected;
- (void)logAllCandidates;
- (void)logCommittedCandidate:(id)a3 partial:(BOOL)a4;
- (void)logDocumentContext;
- (void)logInputString;
- (void)mecabraCandidateRefFromCandidate:(id)a3;
- (void)padGeometryForInput:(id)a3 atIndex:(unint64_t)a4;
- (void)processDeleteInputs;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6;
- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7;
- (void)restoreGeometryForInput:(id)a3 atIndex:(unint64_t)a4;
- (void)resume;
- (void)saveGeometryForInput:(id)a3 atIndex:(unint64_t)a4;
- (void)savePartialGeometryData;
- (void)saveTouchDataForEvent:(id)a3 atIndex:(unint64_t)a4;
- (void)setCancelledDrawInput:(id)a3;
- (void)setClearedGeometryDataArray:(id)a3;
- (void)setClearedTouchDataArray:(id)a3;
- (void)setComposingKeyboardInputManager:(id)a3;
- (void)setCompositionCompletionHandler:(id)a3;
- (void)setCurrentClientIdentifier:(id)a3;
- (void)setCurrentRecipientIdentifier:(id)a3;
- (void)setHasBackspacedIntoInputString:(BOOL)a3;
- (void)setHasCommittedPartialCandidate:(BOOL)a3;
- (void)setKeyboardState:(id)a3;
- (void)setLanguageModelAdaptationContext;
- (void)setLastCommittedCandidateType:(int)a3;
- (void)setOriginalInput:(id)a3;
- (void)setPendingStickerTask:(id)a3;
- (void)setPreservesComposingInput:(BOOL)a3;
- (void)setPreviouslyDeletedTypeInput:(id)a3;
- (void)setPreviouslyProcessedDeleteInput:(id)a3;
- (void)setRemainingInput:(id)a3;
- (void)setShouldClearBeforeContinuousPath:(BOOL)a3;
- (void)setWordSearchCandidateResultSet:(id)a3;
- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (void)storeLanguageModelDynamicDataIncludingCache;
- (void)suspend;
- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)tearDown;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
- (void)updateComposedText;
- (void)updateDocumentContext;
- (void)updateProactiveCandidatesForCandidateResultSet:(id)a3 withInput:(id)a4;
- (void)updateUsageStatisticsForCandidate:(id)a3 isPartial:(BOOL)a4;
@end

@implementation TIKeyboardInputManagerMecabra

- (id).cxx_construct
{
  *((void *)self + 78) = 0;
  *((void *)self + 79) = 0;
  *((void *)self + 88) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_touchUpEvents, 0);
  objc_storeStrong((id *)&self->_touchDownEvents, 0);
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_previouslyProcessedDeleteInput, 0);
  objc_storeStrong((id *)&self->_previouslyDeletedTypeInput, 0);
  objc_storeStrong((id *)&self->_wordSearchCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_pendingStickerTask, 0);
  id compositionCompletionHandler = self->_compositionCompletionHandler;
  if (compositionCompletionHandler) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)compositionCompletionHandler);
  }
  objc_storeStrong((id *)&self->_currentLayout.m_ptr, 0);
  objc_storeStrong((id *)&self->_cancelledDrawInput, 0);
  objc_storeStrong((id *)&self->_currentRecipientIdentifier, 0);
  objc_storeStrong((id *)&self->_currentClientIdentifier, 0);
  objc_storeStrong((id *)&self->_clearedTouchDataArray, 0);
  objc_storeStrong((id *)&self->_clearedGeometryDataArray, 0);
  objc_storeStrong((id *)&self->_composingKeyboardInputManager, 0);
  objc_storeStrong((id *)&self->_geometryDataArray, 0);
  chainedKeyboardInputManager = self->chainedKeyboardInputManager;
  if (chainedKeyboardInputManager) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)chainedKeyboardInputManager);
  }
  m_ptr = self->_currentCharacterKeysLayout.m_ptr;
  if (m_ptr) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)m_ptr);
  }
  objc_storeStrong((id *)&self->_baseCharacterKeysLayout.m_ptr, 0);

  objc_storeStrong((id *)&self->_composingInput, 0);
}

- (NSMutableDictionary)touchUpEvents
{
  return (NSMutableDictionary *)self[1].super.super.super.super.isa;
}

- (NSMutableDictionary)touchDownEvents
{
  return self->_touchUpEvents;
}

- (void)setRemainingInput:(id)a3
{
}

- (NSString)remainingInput
{
  return (NSString *)&self->_touchDownEvents->super.super.isa;
}

- (void)setShouldClearBeforeContinuousPath:(BOOL)a3
{
  LOBYTE(self->_lastCommittedCandidateType) = a3;
}

- (BOOL)shouldClearBeforeContinuousPath
{
  return self->_lastCommittedCandidateType;
}

- (void)setPreviouslyProcessedDeleteInput:(id)a3
{
}

- (MCKeyboardInput)previouslyProcessedDeleteInput
{
  return (MCKeyboardInput *)self->_remainingInput;
}

- (void)setPreviouslyDeletedTypeInput:(id)a3
{
}

- (MCKeyboardInput)previouslyDeletedTypeInput
{
  return self->_previouslyProcessedDeleteInput;
}

- (void)setWordSearchCandidateResultSet:(id)a3
{
}

- (TIWordSearchCandidateResultSet)wordSearchCandidateResultSet
{
  return (TIWordSearchCandidateResultSet *)self->_previouslyDeletedTypeInput;
}

- (TIWordSearch)wordSearch
{
  return (TIWordSearch *)self->_wordSearchCandidateResultSet;
}

- (void)setPendingStickerTask:(id)a3
{
}

- (TIKeyboardInputManagerStickerTask)pendingStickerTask
{
  return (TIKeyboardInputManagerStickerTask *)self->_wordSearch;
}

- (void)setCompositionCompletionHandler:(id)a3
{
}

- (id)compositionCompletionHandler
{
  return self->_pendingStickerTask;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)currentLayout
{
  id compositionCompletionHandler = (atomic_uint *)self->_compositionCompletionHandler;
  *v2 = compositionCompletionHandler;
  if (compositionCompletionHandler) {
    atomic_fetch_add(compositionCompletionHandler, 1u);
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (void)setCancelledDrawInput:(id)a3
{
}

- (MCDrawInput)cancelledDrawInput
{
  return (MCDrawInput *)self->_currentLayout.m_ptr;
}

- (void)setPreservesComposingInput:(BOOL)a3
{
  self->_shouldClearBeforeContinuousPath = a3;
}

- (BOOL)preservesComposingInput
{
  return self->_shouldClearBeforeContinuousPath;
}

- (void)setLastCommittedCandidateType:(int)a3
{
  LODWORD(self->_touchDataArray) = a3;
}

- (int)lastCommittedCandidateType
{
  return (int)self->_touchDataArray;
}

- (void)setHasBackspacedIntoInputString:(BOOL)a3
{
  self->_preservesComposingInput = a3;
}

- (BOOL)hasBackspacedIntoInputString
{
  return self->_preservesComposingInput;
}

- (void)setHasCommittedPartialCandidate:(BOOL)a3
{
  self->_hasBackspacedIntoInputString = a3;
}

- (BOOL)hasCommittedPartialCandidate
{
  return self->_hasBackspacedIntoInputString;
}

- (void)setCurrentRecipientIdentifier:(id)a3
{
}

- (NSString)currentRecipientIdentifier
{
  return (NSString *)&self->_cancelledDrawInput->super.super.isa;
}

- (void)setCurrentClientIdentifier:(id)a3
{
}

- (NSString)currentClientIdentifier
{
  return self->_currentRecipientIdentifier;
}

- (void)setClearedTouchDataArray:(id)a3
{
}

- (NSArray)clearedTouchDataArray
{
  return (NSArray *)self->_currentClientIdentifier;
}

- (void)setClearedGeometryDataArray:(id)a3
{
}

- (NSArray)clearedGeometryDataArray
{
  return self->_clearedTouchDataArray;
}

- (void)setComposingKeyboardInputManager:(id)a3
{
}

- (TIKeyboardInputManagerMecabra)composingKeyboardInputManager
{
  return (TIKeyboardInputManagerMecabra *)self->_clearedGeometryDataArray;
}

- (TIKeyboardInputManagerMecabra)chainedKeyboardInputManager
{
  return (TIKeyboardInputManagerMecabra *)self->_geometryDataArray;
}

- (void)processDeleteInputs
{
  v2 = self;
  v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  v4 = [v3 inputs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0x1E6E27000uLL;
    v84 = v2;
    while (1)
    {
      v9 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      v10 = [v9 inputs];
      v11 = [v10 objectAtIndexedSubscript:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_24:

      unint64_t v7 = (v7 + 1);
      uint64_t v6 = (int)v7;
      v32 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      v33 = [v32 inputs];
      unint64_t v34 = [v33 count];

      if (v34 <= (int)v7) {
        return;
      }
    }
    id v12 = v11;
    v13 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
    v14 = v13;
    uint64_t v15 = (v7 - 1);
    if ((int)v7 < 1)
    {
      [v13 removeInputAtIndex:v6];
      v17 = v14;
    }
    else
    {
      v16 = [v13 inputs];
      v17 = [v16 objectAtIndexedSubscript:(v7 - 1)];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && [v12 shouldDeleteAcceptCandidateInput])
      {
        v85 = v17;
        v18 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
        [v18 removeInputAtIndex:v6];

        v19 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
        [v19 removeInputAtIndex:(v7 - 1)];

        if ((int)v7 <= 2) {
          int v20 = 2;
        }
        else {
          int v20 = v7;
        }
        unint64_t v7 = (v20 - 2);
        v21 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
        v22 = [v21 inputs];
        if ([v22 count] <= v7)
        {
        }
        else
        {
          v23 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
          v24 = [v23 inputs];
          [v24 objectAtIndexedSubscript:v7];
          id v25 = v12;
          v27 = unint64_t v26 = v8;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          unint64_t v8 = v26;
          id v12 = v25;

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_21;
          }
          v29 = [(TIKeyboardInputManagerMecabra *)v84 composingInput];
          v30 = [v29 inputs];
          v21 = [v30 objectAtIndexedSubscript:v7];

          [v21 setIncludeSuffixAsSearchString:1];
        }

LABEL_21:
        objc_opt_class();
        v17 = v85;
        v2 = v84;
        if (objc_opt_isKindOfClass()) {
          [(TIKeyboardInputManagerMecabra *)v84 setPreviouslyDeletedTypeInput:v85];
        }
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v31 = [(TIKeyboardInputManagerMecabra *)v2 convertInputsToSyntheticInputUptoCount:v7];
        LODWORD(v7) = 0;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v17;
        v36 = [v35 syllables];
        v37 = (void *)[v36 mutableCopy];

        v38 = [v35 committedText];
        v86 = (void *)[v38 mutableCopy];

        v39 = v35;
        int v87 = 0;
        int v40 = [v35 syllableIndex:&v87];
        v83 = v37;
        uint64_t v41 = [v37 count];
        v42 = v35;
        if (!v41 || v40 < 0)
        {
          int v47 = [v12 deleteBySyllable];
          BOOL v44 = 0;
          uint64_t v48 = 0;
          if (!v47) {
            goto LABEL_59;
          }
        }
        else
        {
          int v43 = v87;
          if (([v12 deleteBySyllable] & 1) == 0)
          {
            if ((v43 & 0x80000000) == 0)
            {
LABEL_41:
              id v57 = [v83 objectAtIndexedSubscript:v40];
              [v83 removeObjectAtIndex:v40];
              if (v87 > 0)
              {
                uint64_t v82 = v40;
                v58 = objc_msgSend(v57, "substringWithRange:", (v87 - 1), 1);
                v59 = (void *)[v57 mutableCopy];
                objc_msgSend(v59, "deleteCharactersInRange:", v87 - 1, 1);
                v39 = v42;
                if ([v59 length]) {
                  [v83 insertObject:v59 atIndex:v82];
                }

                uint64_t v48 = 0;
                goto LABEL_54;
              }
            }
LABEL_57:
            uint64_t v48 = 0;
LABEL_58:
            v39 = v42;
            goto LABEL_59;
          }
          BOOL v44 = v43 >= 0;
          v39 = v35;
        }
        BOOL v81 = v44;
        v49 = [v39 inputs];
        uint64_t v50 = [v49 count];

        if (v50)
        {
          v51 = [v42 inputs];
          int v52 = [v51 count];

          unsigned int v53 = v52 - 1;
          while ((v53 & 0x80000000) == 0)
          {
            v54 = [v42 inputs];
            v55 = [v54 objectAtIndexedSubscript:v53];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {

              break;
            }
            objc_opt_class();
            char v56 = objc_opt_isKindOfClass();

            --v53;
            if (v56)
            {
              if (v81) {
                goto LABEL_41;
              }
              goto LABEL_57;
            }
          }
        }
        if (v81)
        {
          uint64_t v60 = v40;
          id v57 = [v83 objectAtIndexedSubscript:v40];
          [v83 removeObjectAtIndex:v40];
          unint64_t v61 = v87;
          if ([v57 length] <= v61)
          {
            id v57 = v57;
            uint64_t v48 = 1;
            v58 = v57;
          }
          else
          {
            v58 = [v57 substringToIndex:v87];
            v62 = [v57 substringFromIndex:v87];
            if ([v62 length]) {
              [v83 insertObject:v62 atIndex:v60];
            }

            uint64_t v48 = 1;
          }
          v39 = v42;
LABEL_54:

          if (v58)
          {
LABEL_65:
            v69 = [v39 syntheticInputWithCommittedText:v86 syllables:v83];
            v70 = v39;
            v71 = v69;
            unint64_t v7 = objc_msgSend(v69, "syntheticInputWithCursorIndex:", objc_msgSend(v70, "cursorIndex") - objc_msgSend(v58, "length"));

            [(id)v7 setIncludeSuffixAsSearchString:1];
            v72 = -[MCDeleteInput initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:]([MCDeleteInput alloc], "initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:", v58, v48, [v12 shouldDeleteAcceptCandidateInput]);
            [(id)v7 composeNew:v72];
            v73 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
            [v73 removeInputAtIndex:v6];

            v74 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
            [v74 removeInputAtIndex:v15];

            v75 = [(id)v7 text];
            uint64_t v76 = [v75 length];

            if (v76)
            {
              v77 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
              [v77 insertInput:v7 atIndex:v15];

              v78 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
              v79 = [v78 composingInput];

              if (!v79)
              {
                v80 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
                [v80 setComposingInput:v7];
              }
            }

            v17 = v42;
            LODWORD(v7) = 0;
            unint64_t v8 = 0x1E6E27000;
            goto LABEL_23;
          }
LABEL_59:
          if ([v86 length])
          {
            v63 = v39;
            unint64_t v64 = [v39 cursorIndex];
            if (v64 >= [v86 length]) {
              uint64_t v65 = [v86 length];
            }
            else {
              uint64_t v65 = [v63 cursorIndex];
            }
            uint64_t v66 = [v86 rangeOfComposedCharacterSequenceAtIndex:v65 - 1];
            uint64_t v68 = v67;
            v58 = objc_msgSend(v86, "substringWithRange:", v66, v67);
            objc_msgSend(v86, "deleteCharactersInRange:", v66, v68);
            v39 = v42;
          }
          else
          {
            v58 = 0;
          }
          goto LABEL_65;
        }
        uint64_t v48 = 1;
        goto LABEL_58;
      }
      [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      v46 = v45 = v17;
      [v46 removeInputAtIndex:v6];

      v17 = v45;
    }
    LODWORD(v7) = v15;
LABEL_23:

    goto LABEL_24;
  }
}

- (void)_replaceComposingInputWithSyntheticInput:(id)a3 internalIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    unint64_t v8 = [v6 text];
    v9 = v8;
    if (a4)
    {
      uint64_t v10 = [v8 length];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __88__TIKeyboardInputManagerMecabra__replaceComposingInputWithSyntheticInput_internalIndex___block_invoke;
      v14[3] = &unk_1E6E29B40;
      v14[5] = &v16;
      v14[6] = a4;
      v14[4] = v15;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 514, v14);
    }
    v11 = [v7 syntheticInputWithCursorIndex:v17[3]];

    [v11 setIncludeSuffixAsSearchString:0];
    id v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v12 replaceInputAtIndex:0 with:v11];

    v13 = [(TIKeyboardInputManagerMecabra *)self previouslyDeletedTypeInput];

    if (!v13) {
      [(TIKeyboardInputManagerMecabra *)self setPreviouslyDeletedTypeInput:v11];
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);
  }
}

void *__88__TIKeyboardInputManagerMecabra__replaceComposingInputWithSyntheticInput_internalIndex___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (++*(void *)(*(void *)(result[4] + 8) + 24) >= result[6])
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = a3 + a4;
    *a7 = 1;
  }
  return result;
}

- (id)_convertInputsToSyntheticInputWithOffset:(unint64_t)a3
{
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  id v6 = [v5 inputs];
  if ([v6 count] != 1)
  {

LABEL_5:
    v14 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v15 = [v14 documentState];
    uint64_t v16 = [v15 markedText];
    unint64_t v17 = [v16 length];

    uint64_t v18 = [(TIKeyboardInputManager *)self keyboardState];
    id v12 = [v18 documentState];
    uint64_t v19 = [(__CFString *)v12 markedText];
    v11 = v19;
    if (v17 > a3)
    {

      if ([v11 length] <= a3)
      {
        id v12 = &stru_1F3F7A998;
      }
      else
      {
        id v12 = [v11 substringFromIndex:a3];
      }
      unint64_t v26 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v27 = [v26 inputs];
      v28 = [v27 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_17;
      }
      v30 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      id v31 = [v30 inputs];
      v32 = [v31 firstObject];

      if (v32)
      {
        v33 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
        unint64_t v34 = [v32 externalSuffix:v33];

        char v35 = 0;
      }
      else
      {
LABEL_17:
        char v35 = 1;
        unint64_t v34 = &stru_1F3F7A998;
      }
      v36 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
      v37 = [v36 stringByAppendingString:v34];

      if ((v35 & 1) == 0
        && (([(__CFString *)v12 isEqualToString:v34] & 1) != 0
         || ([(__CFString *)v12 isEqualToString:v37] & 1) != 0))
      {
        v13 = 0;
      }
      else
      {
        v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        v39 = [v38 inputs];
        v13 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", [v39 count]);
      }
LABEL_24:

      goto LABEL_28;
    }
    if ([v19 length] == a3)
    {
      int v20 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v21 = [v20 inputs];
      if ((unint64_t)[v21 count] >= 2)
      {
        v22 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        v23 = [v22 inputs];
        v24 = [v23 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          char v46 = [v25 hasKindOf:objc_opt_class()];

          if (v46)
          {
            v13 = 0;
            goto LABEL_30;
          }
          uint64_t v41 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          v42 = [v41 inputs];
          v11 = [v42 firstObject];

          unint64_t v43 = [v11 cursorIndex];
          BOOL v44 = [v11 text];
          unint64_t v45 = [v44 length];

          if (v43 >= v45)
          {
            v13 = 0;
            goto LABEL_29;
          }
          id v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          unint64_t v34 = [(__CFString *)v12 inputs];
          v13 = [(TIKeyboardInputManagerMecabra *)self convertInputsToSyntheticInputUptoCount:[(__CFString *)v34 count]];
          goto LABEL_24;
        }
      }
    }

    v13 = 0;
    v11 = v18;
    goto LABEL_28;
  }
  unint64_t v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  unint64_t v8 = [v7 inputs];
  v9 = [v8 firstObject];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  v11 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  id v12 = [v11 inputs];
  v13 = [(__CFString *)v12 firstObject];
LABEL_28:

LABEL_29:
LABEL_30:

  return v13;
}

- (void)lastAcceptedCandidateCorrected
{
  v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v3)
  {
    id v4 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v4 lastAcceptedCandidateCorrected];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManagerBase *)&v5 lastAcceptedCandidateCorrected];
  }
}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v17)
  {
    uint64_t v18 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v18 registerLearningForCompletion:v12 fullCompletion:v13 context:v14 prefix:v15 mode:v16];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v19 registerLearningForCompletion:v12 fullCompletion:v13 context:v14 prefix:v15 mode:v16];
  }
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v14)
  {
    id v15 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v15 registerLearning:v10 fullCandidate:v11 keyboardState:v12 mode:v13];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v16 registerLearning:v10 fullCandidate:v11 keyboardState:v12 mode:v13];
  }
}

- (void)candidateRejected:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v5)
  {
    id v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v6 candidateRejected:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v7 candidateRejected:v4];
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v10)
  {
    id v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v11 textAccepted:v8 fromPredictiveInputBar:v6 withInput:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v12 textAccepted:v8 fromPredictiveInputBar:v6 withInput:v9];
  }
}

- (void)setOriginalInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v5)
  {
    BOOL v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v6 setOriginalInput:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v7 setOriginalInput:v4];
  }
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  BOOL v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  LOBYTE(v4) = [v6 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];

  return v4;
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (!-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](self, "_adjustPhraseBoundaryInForwardDirection:granularity:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v5)
  {
    id v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v6 adjustPhraseBoundaryInForwardDirection:v3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v7 adjustPhraseBoundaryInForwardDirection:v3];
  }
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v8)
  {
    id v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v9 skipHitTestForTouchEvent:v6 keyboardState:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v10 skipHitTestForTouchEvent:v6 keyboardState:v7];
  }
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v8)
  {
    id v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v10 = (id)[v9 performHitTestForTouchEvent:v6 keyboardState:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    id v10 = [(TIKeyboardInputManager *)&v12 performHitTestForTouchEvent:v6 keyboardState:v7];
  }

  return (int64_t)v10;
}

- (id)generateRefinementsForCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v6 = [v5 generateRefinementsForCandidate:v4];

  return v6;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v9 = [v8 generateReplacementsForString:v7 keyLayout:v6];

  return v9;
}

- (id)autocorrectionListFromWordSearchCandidateResultSet:(id)a3 emojiCandidates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 candidates];
  id v10 = [v7 proactiveCandidates];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    objc_super v12 = [v7 proactiveCandidates];
    id v13 = [v7 candidates];
    uint64_t v14 = [v12 arrayByAddingObjectsFromArray:v13];

    id v9 = (void *)v14;
  }
  id v15 = [v9 firstObject];
  objc_super v16 = [v15 input];
  uint64_t v17 = [v16 length];
  if (v17)
  {
    id v4 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    if ([v4 autoCorrects])
    {
      if (![(TIKeyboardInputManager *)self shouldBlockAutocorrection:v15]) {
        goto LABEL_8;
      }
    }
  }
  id v18 = v8;
  objc_super v19 = [v15 input];
  int v20 = [v15 candidate];
  if ([v19 isEqualToString:v20])
  {

    id v8 = v18;
    if (!v17)
    {
LABEL_9:

      goto LABEL_13;
    }
LABEL_8:

    goto LABEL_9;
  }
  id v31 = self;
  char v21 = [v15 isContinuousPathConversion];

  if (v17) {
  id v8 = v18;
  }
  if ((v21 & 1) == 0)
  {
    v27 = [(TIKeyboardInputManager *)v31 typedStringForEmptyAutocorrection];
    id v24 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:v27];
    id v26 = v9;

    goto LABEL_20;
  }
LABEL_13:
  if ([v15 isSupplementalItemCandidate])
  {
    v22 = (void *)MEMORY[0x1E4FAE318];
    v23 = [v15 input];
    id v24 = [v22 candidateWithUnchangedInput:v23];

    id v25 = v9;
LABEL_17:
    id v26 = v25;
    goto LABEL_20;
  }
  id v24 = v15;
  if ((unint64_t)[v9 count] >= 2)
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  id v26 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:
  if (([v24 isContinuousPathConversion] & 1) == 0) {
    [v24 setConfidence:2];
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v24 alternateCorrections:0];
  v29 = [MEMORY[0x1E4FAE278] listWithCorrections:v28 predictions:v26 emojiList:v8];

  return v29;
}

- (unint64_t)maxDrawSamplesWithNoCandidatesResult
{
  return +[TIMecabraEnvironment maxNumberOfDrawSamples];
}

- (id)lexiconLocaleOfCandidate:(void *)a3
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v4 = 0;
  while (MecabraCandidateGetWordLengthAtIndex())
  {
    uint64_t WordLocaleAtIndex = MecabraCandidateCreateWordLocaleAtIndex();
    if (!WordLocaleAtIndex) {
      goto LABEL_9;
    }
    id v6 = (const void *)WordLocaleAtIndex;
    id v7 = (id)MEMORY[0x1E4E79AD0]();
    if ([v3 indexOfObject:v7] == 0x7FFFFFFFFFFFFFFFLL) {
      [v3 addObject:v7];
    }
    ++v4;

    CFRelease(v6);
  }
  if ([v3 count])
  {
    id v8 = [v3 componentsJoinedByString:@"/"];
    goto LABEL_10;
  }
LABEL_9:
  id v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)inputSessionWantsStemWhenEditing
{
  return 0;
}

- (id)autocorrectionListWithCandidateCount:(unint64_t)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__265;
  v108 = __Block_byref_object_dispose__266;
  v109 = objc_alloc_init(TIWordSearchCandidateResultSet);
  TIInputManager::input_substring((unsigned __int16 *)self->super.super.m_impl + 4, 0, -858993459 * ((*((void *)self->super.super.m_impl + 2) - *((void *)self->super.super.m_impl + 1)) >> 3), (uint64_t)&location);
  KB::ns_string((KB *)&location, v4);
  BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v112 && BYTE6(location) == 1) {
    free(v112);
  }
  id v6 = [(TIKeyboardInputManager *)self inputString];
  if ([(TIKeyboardInputManager *)self shouldGeneratePredictionsForCurrentContext]&& ![(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v5])
  {

    id v6 = &stru_1F3F7A998;
    char v73 = 1;
    v85 = (void *)MEMORY[0x1E4F1CBF0];
    BOOL v5 = &stru_1F3F7A998;
  }
  else
  {
    v85 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
    char v73 = 0;
  }
  v77 = v6;
  id v7 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  v83 = v5;
  if (([v7 autoCorrects] & 1) != 0
    || [(TIKeyboardInputManager_mul *)self isUsingMultilingual])
  {
    uint64_t v8 = 64;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v7 shouldLearnAcceptedCandidate]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v8 | 0x80;
  }
  unint64_t v10 = [(TIKeyboardInputManagerMecabra *)self additionalAnalysisOptions];
  objc_initWeak(&location, self);
  uint64_t v11 = [(TIKeyboardInputManager *)self keyboardState];
  objc_super v12 = [v11 documentState];

  uint64_t v13 = [v12 contextBeforeInput];
  uint64_t v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1F3F7A998;
  }
  BOOL v81 = v15;

  uint64_t v16 = [v12 contextAfterInput];
  uint64_t v17 = (void *)v16;
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  else {
    id v18 = &stru_1F3F7A998;
  }
  v79 = v18;

  objc_super v19 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v20 = [v19 composingInput];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v75 = [v19 composingInput];
  }
  else
  {
    v75 = 0;
  }
  char v21 = (void *)(v9 | v10);

  v74 = v12;
  if (![(TIKeyboardInputManagerMecabra *)self canTypeAndPathSimultaneously])
  {
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v22 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    v23 = [v22 inputs];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v101;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v101 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = objc_opt_new();

            [v29 composeNew:v28];
            objc_super v19 = v29;
            goto LABEL_35;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v100 objects:v110 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_35:
  }
  unsigned int v30 = [(TIKeyboardInputManagerMecabra *)self pathedWordSeparatorChar];
  id v31 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  v32 = (void *)MEMORY[0x1E4F28B48];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __70__TIKeyboardInputManagerMecabra_autocorrectionListWithCandidateCount___block_invoke;
  v87[3] = &unk_1E6E29B18;
  id v33 = v7;
  id v88 = v33;
  objc_copyWeak(v98, &location);
  id v86 = v85;
  id v89 = v86;
  unint64_t v34 = v83;
  v90 = v34;
  v84 = v81;
  v91 = v84;
  uint64_t v82 = v79;
  v92 = v82;
  id v80 = v19;
  id v93 = v80;
  v98[1] = v21;
  id v35 = v75;
  id v94 = v35;
  v95 = self;
  v97 = &v104;
  v36 = v77;
  v96 = v36;
  unsigned int v99 = v30;
  v37 = [v32 blockOperationWithBlock:v87];
  [v31 performOperationAsync:v37];

  v38 = +[TIWordSearch sharedOperationQueue];
  [v38 waitUntilAllOperationsAreFinished];

  v39 = [(id)v105[5] candidates];
  uint64_t v40 = [v39 count];

  if (v40 || !v35)
  {
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v105[5]];
    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v41 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    unint64_t v42 = [v41 totalDrawSamples];
    unint64_t v43 = [(TIKeyboardInputManagerMecabra *)self maxDrawSamplesWithNoCandidatesResult];

    if (v42 > v43)
    {
      BOOL v44 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v44 removeAllInputs];

      unint64_t v45 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      char v46 = [v45 candidates];
      int v47 = [v46 firstObject];
      char v48 = [v47 isContinuousPathConversion];

      if (v48)
      {
        v49 = [(TIKeyboardInputManagerMecabra *)self autocorrectionListWithCandidateCount:a3];
        uint64_t v50 = v74;
        goto LABEL_51;
      }
      uint64_t v51 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      int v52 = (void *)v105[5];
      v105[5] = v51;
    }
  }
  unsigned int v53 = [(id)v105[5] candidates];
  uint64_t v54 = [v53 count];

  if (!v54)
  {
LABEL_46:
    uint64_t v76 = v36;
    v78 = v34;
    id v55 = v33;
    id v57 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
    v63 = [(TIKeyboardInputManager *)self keyboardState];
    if (v73) {
      [v57 emojiAdornmentCandidatesForKeyboardState:v63];
    }
    else {
    uint64_t v65 = [v57 emojiReplacementCandidatesForKeyboardState:v63];
    }
    goto LABEL_50;
  }
  uint64_t v76 = v36;
  v78 = v34;
  id v55 = v33;
  char v56 = [(id)v105[5] candidates];
  id v57 = [v56 objectAtIndexedSubscript:0];

  v58 = NSString;
  v59 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v60 = [v59 documentState];
  unint64_t v61 = [v60 contextBeforeInput];
  v62 = [v57 candidate];
  v63 = [v58 stringWithFormat:@"%@ %@", v61, v62];

  unint64_t v64 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
  uint64_t v65 = [v64 emojiReplacementCandidatesForText:v63];

LABEL_50:
  uint64_t v50 = v74;

  v49 = [(TIKeyboardInputManagerMecabra *)self autocorrectionListFromWordSearchCandidateResultSet:v105[5] emojiCandidates:v65];
  uint64_t v66 = [(TIKeyboardInputManager *)self autocorrectionForCurrentStem];
  uint64_t v67 = [v49 corrections];
  uint64_t v68 = [v67 autocorrection];
  v69 = [v68 candidate];
  v70 = [(TIKeyboardInputManager *)self currentWordStem];
  [v66 setObject:v69 forKey:v70];

  id v33 = v55;
  v36 = v76;
  unint64_t v34 = v78;
LABEL_51:

  objc_destroyWeak(v98);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v104, 8);

  return v49;
}

void __70__TIKeyboardInputManagerMecabra_autocorrectionListWithCandidateCount___block_invoke(uint64_t a1)
{
  id v20 = [*(id *)(a1 + 32) mecabraEnvironment];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  [v20 setGeometryModel:WeakRetained modelData:*(void *)(a1 + 40)];

  if (![*(id *)(a1 + 48) length])
  {
    [v20 setLeftDocumentContext:*(void *)(a1 + 56)];
    [v20 setRightDocumentContext:*(void *)(a1 + 64)];
    [v20 adjustEnvironmentDirectly:0];
  }
  uint64_t v3 = *(void *)(a1 + 72);
  if (!v3)
  {
    if (![v20 analyzeString:*(void *)(a1 + 48) options:*(void *)(a1 + 120)]) {
      goto LABEL_37;
    }
    goto LABEL_7;
  }
  if ([v20 analyzeInput:v3 options:*(void *)(a1 + 120)])
  {
LABEL_7:
    if (*(void *)(a1 + 80)) {
      char v4 = [*(id *)(a1 + 88) shouldInsertSpaceBeforePredictions];
    }
    else {
      char v4 = 0;
    }
    id v5 = 0;
    while (1)
    {
      while (1)
      {
        [*(id *)(a1 + 32) mecabra];
        uint64_t NextCandidate = MecabraGetNextCandidate();
        if (!NextCandidate)
        {

          goto LABEL_37;
        }
        uint64_t v7 = NextCandidate;
        if (MecabraCandidateGetType() != 6) {
          break;
        }
        [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addMecabraProactiveCandidate:v7 triggerSourceType:0];
      }
      id v8 = objc_alloc(MEMORY[0x1E4FAE3B8]);
      if (v5) {
        break;
      }
      if ([*(id *)(a1 + 88) inputSessionWantsStemWhenEditing])
      {
        uint64_t v9 = [*(id *)(a1 + 88) inputStem];
        goto LABEL_18;
      }
      uint64_t v11 = (void *)[v8 initWithMecabraCandidate:v7 input:*(void *)(a1 + 96)];
LABEL_19:
      [v11 setContinuousPathConversion:*(void *)(a1 + 80) != 0];
      if ([*(id *)(a1 + 88) isUsingMultilingual])
      {
        objc_super v12 = [*(id *)(a1 + 88) lexiconLocaleOfCandidate:v7];
        [v11 setLexiconLocale:v12];
      }
      if (*(void *)(a1 + 80))
      {
        if (*(_DWORD *)(a1 + 128))
        {
          if (v4)
          {
            uint64_t v13 = objc_msgSend(NSString, "_stringWithUnichar:");
            uint64_t v14 = [v11 candidate];
            id v15 = [v13 stringByAppendingString:v14];
          }
          else
          {
            id v15 = [v11 candidate];
          }
          uint64_t v16 = [v5 candidate];
          char v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = [v11 candidateByReplacingWithCandidate:v15];

            [v18 setMecabraCandidatePointerValue:0];
            uint64_t v7 = 0;
            uint64_t v11 = v18;
          }
        }
        if (!v5)
        {
          id v5 = v11;
          if ([*(id *)(a1 + 80) isCompleting]) {
            uint64_t v19 = 1;
          }
          else {
            uint64_t v19 = [*(id *)(a1 + 80) isComplete];
          }
          [v5 setShouldAccept:v19];
          uint64_t v11 = v5;
        }
      }
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addMecabraCandidate:v11 mecabraCandidateRef:v7];
    }
    uint64_t v9 = [v5 candidate];
LABEL_18:
    unint64_t v10 = (void *)v9;
    uint64_t v11 = (void *)[v8 initWithMecabraCandidate:v7 input:v9];

    goto LABEL_19;
  }
LABEL_37:
  if (![*(id *)(a1 + 48) length]) {
    [*(id *)(a1 + 32) insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  }
}

- (BOOL)shouldInsertSpaceBeforePredictions
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  char v4 = [v3 documentState];
  id v5 = [v4 contextBeforeInput];

  if ([v5 length]
    && ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v6, "characterIsMember:", (unsigned __int16)objc_msgSend(v5, "_lastLongCharacter")),
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v9 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    int v10 = objc_msgSend(v9, "characterIsMember:", (unsigned __int16)objc_msgSend(v5, "_lastLongCharacter"));

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [v5 _lastGrapheme];
    objc_super v12 = [(TIKeyboardInputManager *)self terminatorsPrecedingAutospace];
    uint64_t v13 = [v12 characterSet];
    uint64_t v14 = [v11 rangeOfCharacterFromSet:v13];

    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      BOOL v8 = [(TIKeyboardInputManager *)self stringEndsWithClosingQuote:v5];
    }
    else {
LABEL_7:
    }
      BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)additionalAnalysisOptions
{
  return 0;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([(TIKeyboardInputManagerMecabra *)self alreadyGeneratedCandidates]
    || ![(TIKeyboardInputManagerMecabra *)self supportsCandidateGeneration])
  {
    uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v11, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v10);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v12, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v9, location, length, v10);
  }
}

- (BOOL)alreadyGeneratedCandidates
{
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  if ([v3 alreadyGeneratedCandidates])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    char v4 = [v5 supportsCandidateGeneration];
  }
  return v4;
}

- (BOOL)supportsCandidateGeneration
{
  return 1;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v11)
  {
    objc_super v12 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v12, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v10);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:](&v13, sel_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler_, v9, location, length, v10);
  }
}

- (id)keyboardConfiguration
{
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  char v4 = [v3 keyboardConfiguration];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManagerMecabra;
    id v6 = [(TIKeyboardInputManager_mul *)&v9 keyboardConfiguration];
  }
  char v7 = v6;

  return v7;
}

- (void)updateProactiveCandidatesForCandidateResultSet:(id)a3 withInput:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 proactiveTriggers];
  if ([v8 count])
  {

    goto LABEL_3;
  }
  uint64_t v19 = +[TIProactiveQuickTypeManager sharedInstance];
  if (([v19 usePQT2Flow] & 1) == 0)
  {

    goto LABEL_17;
  }
  uint64_t v20 = [v7 length];

  if (!v20)
  {
LABEL_3:
    objc_super v9 = [(TIKeyboardInputManager *)self keyboardState];
    BOOL v8 = [v9 secureCandidateRenderTraits];

    id v10 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v11 = [v10 secureCandidateRenderTraits];
    [v11 setDisableHideMyEmail:1];

    [v8 singleCellWidth];
    if (v12 > 0.0 && ([v8 singleCellHeight], v13 > 0.0)
      || ([v8 cellWidthOptions], uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                                                v14,
                                                v14))
    {
      id v15 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
      uint64_t v16 = [v15 asynchronous];

      char v17 = [v6 proactiveTriggers];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __90__TIKeyboardInputManagerMecabra_updateProactiveCandidatesForCandidateResultSet_withInput___block_invoke;
      v22[3] = &unk_1E6E29AF0;
      char v25 = v16;
      v23 = v6;
      uint64_t v24 = self;
      [(TIKeyboardInputManager *)self generateAndRenderProactiveSuggestionsWithTriggers:v17 withAdditionalPredictions:0 withInput:v7 async:v16 completionHandler:v22];

      id v18 = v23;
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_17;
      }
      id v18 = TIOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        char v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s ProactiveQuickType:TI: Not generating proactive candidates - invalid secure candidate width or height trait", "-[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:]");
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

LABEL_17:
  }
}

void __90__TIKeyboardInputManagerMecabra_updateProactiveCandidatesForCandidateResultSet_withInput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setProactiveCandidates:v3];
  if (*(unsigned char *)(a1 + 48) && [v3 count])
  {
    char v4 = [*(id *)(a1 + 40) candidateResultSetFromWordSearchCandidateResultSet:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) pushCandidateGenerationContextWithResults:v4];
  }
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = NSString;
      id v7 = [*(id *)(a1 + 32) proactiveCandidates];
      BOOL v8 = [v6 stringWithFormat:@"%s ProactiveQuickType:TI: Generated proactive candidates: %@", "-[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:]_block_invoke", v7];
      *(_DWORD *)buf = 138412290;
      id v10 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)addProactiveTriggers:(id)a3 withCompletionHandler:(id)a4
{
  id v44 = a3;
  id v46 = a4;
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  id v7 = [v6 textInputTraits];
  BOOL v8 = [v7 textContentType];

  objc_super v9 = [(TIKeyboardInputManager *)self keyboardState];
  id v10 = [v9 textInputTraits];
  uint64_t v11 = [v10 textContentType];
  double v12 = [(TIKeyboardInputManager *)self keyboardState];
  double v13 = [v12 documentState];
  uint64_t v14 = [v13 contextBeforeInput];
  id v15 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v16 = +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v11, v14, [v15 autofillMode]);

  char v17 = [(TIKeyboardInputManager *)self keyboardState];
  id v18 = [v17 documentState];
  uint64_t v19 = [v18 markedText];
  LOBYTE(v10) = [v19 length] != 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6E29A28;
  id v20 = v8;
  id v53 = v20;
  id v21 = v44;
  id v54 = v21;
  id v22 = v16;
  id v55 = v22;
  char v57 = (char)v10;
  id v23 = v46;
  id v56 = v23;
  uint64_t v24 = (void (**)(void *, void))_Block_copy(aBlock);
  char v25 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v26 = [v25 documentState];
  LODWORD(v12) = [v26 documentIsEmpty];

  if (!v12)
  {
    v24[2](v24, 0);
    goto LABEL_8;
  }
  v27 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v28 = [v27 responseContext];
  if (!v28)
  {

    goto LABEL_7;
  }
  v29 = (void *)v28;
  unsigned int v30 = +[TIProactiveQuickTypeManager sharedInstance];
  char v31 = [v30 usePQT2Flow];

  if (v31)
  {
LABEL_7:
    v24[2](v24, 1);
    goto LABEL_8;
  }
  v32 = [(TIKeyboardInputManager *)self keyboardState];
  [v32 shiftState];

  id v33 = [(TIKeyboardInputManagerBase *)self inputMode];
  unint64_t v45 = [v33 languageWithRegion];

  unint64_t v34 = [(TIKeyboardInputManager *)self keyboardState];
  id v35 = [v34 clientIdentifier];

  v36 = [(TIKeyboardInputManager *)self keyboardState];
  v37 = [v36 recipientIdentifier];

  v38 = [(TIKeyboardInputManager *)self keyboardState];
  v39 = [v38 responseContext];

  unint64_t v43 = chineseJapaneseResponseKitBackgroundQueue();
  char v48 = v37;
  v49 = v39;
  uint64_t v51 = v24;
  id v50 = v21;
  id v47 = v45;
  id v40 = v39;
  id v41 = v37;
  id v42 = v35;
  TIDispatchAsync();

LABEL_8:
}

uint64_t __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:*(void *)(a1 + 32)];
    char v4 = v3;
    if (v3)
    {
      id v5 = *(void **)(a1 + 40);
      id v6 = [v3 attributes];
      [v5 addSyntheticMecabraProactiveCandidate:v6 triggerSourceType:2];
    }
  }
  if (_os_feature_enabled_impl() && *(void *)(a1 + 48) && !*(unsigned char *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 40), "addProactiveTrigger:");
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E6E2BDC0;
  uint64_t v19 = v20;
  id v18 = *(id *)(a1 + 80);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  id v3 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:*(void *)(a1 + 32) andRecipientContactInfo:*(void *)(a1 + 40)];
  char v4 = [MEMORY[0x1E4F962A8] sharedManager];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [(TILanguageModelAdaptationContext *)v3 identifierForResponseKit];
  uint64_t v7 = *(void *)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E6E29AA0;
  uint64_t v16 = v20;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void **)(a1 + 80);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  [v4 responsesForMessage:v5 maximumResponses:10 forContext:v6 withLanguage:v8 options:v7 completionBlock:v12];

  _Block_object_dispose(v20, 8);
}

uint64_t __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  TIDispatchAsync();
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_6;
    v8[3] = &unk_1E6E29A50;
    id v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    [v3 enumerateObjectsWithOptions:2 usingBlock:v8];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1, v6, v7);
  }
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 attributes];

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v5 = TIOSLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = NSString;
        v29 = [v3 attributes];
        unsigned int v30 = [v28 stringWithFormat:@"%s ResponseKit:Proactive:TI: received proactive trigger [%@]", "-[TIKeyboardInputManagerMecabra addProactiveTriggers:withCompletionHandler:]_block_invoke_6", v29];
        *(_DWORD *)buf = 138412290;
        id v35 = v30;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    uint64_t v6 = [v3 attributes];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F72330]];

    uint64_t v8 = [v3 attributes];
    if ([v7 isEqualToString:*MEMORY[0x1E4F962C8]])
    {
      uint64_t v9 = +[TIResponseKitManager rewriteMoneyAttributes:v8];

      uint64_t v8 = (void *)v9;
    }
    [*(id *)(a1 + 32) addSyntheticMecabraProactiveCandidate:v8 triggerSourceType:1];

    goto LABEL_11;
  }
  uint64_t v10 = [v3 string];

  if (v10)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v11 = TIOSLogFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        char v31 = NSString;
        v32 = [v3 string];
        id v33 = [v31 stringWithFormat:@"%s ResponseKit:Canned:TI: received canned response [%@]", "-[TIKeyboardInputManagerMecabra addProactiveTriggers:withCompletionHandler:]_block_invoke", v32];
        *(_DWORD *)buf = 138412290;
        id v35 = v33;
        _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) mecabra];
    double v12 = [v3 string];
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();

    if (CandidateFromContextString)
    {
      id v14 = objc_alloc(MEMORY[0x1E4FAE3B8]);
      id v15 = [v3 string];
      uint64_t v16 = [v3 category];
      char v17 = [NSNumber numberWithUnsignedLongLong:CandidateFromContextString];
      uint64_t v7 = (void *)[v14 initWithResponseKitString:v15 responseKitCategory:v16 mecabraCandidatePointerValue:v17];

      [*(id *)(a1 + 32) insertMecabraCandidate:v7 mecabraCandidateRef:CandidateFromContextString atIndex:0];
      id v18 = (void *)MEMORY[0x1E4F96290];
      uint64_t v19 = *MEMORY[0x1E4F962B8];
      id v20 = [*(id *)(a1 + 40) inputMode];
      char v21 = [v20 normalizedIdentifier];
      id v22 = TIInputModeGetBaseLanguage();
      [v18 incrementAggdKeyForCategory:0 forAction:v19 withLanguageID:v22];

      id v23 = (void *)MEMORY[0x1E4F96290];
      uint64_t v24 = [v3 category];
      char v25 = [*(id *)(a1 + 40) inputMode];
      uint64_t v26 = [v25 normalizedIdentifier];
      v27 = TIInputModeGetBaseLanguage();
      [v23 incrementAggdKeyForCategory:v24 forAction:v19 withLanguageID:v27];

LABEL_11:
    }
  }
}

- (void)addStickers:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  uint64_t v8 = [(TIKeyboardInputManagerMecabra *)self pendingStickerTask];

  if (v8)
  {
    uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self pendingStickerTask];
    uint64_t v10 = [v9 stickerCompletionHandler];
    uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self pendingStickerTask];
    double v12 = [v11 candidateResultSet];
    ((void (**)(void, void *))v10)[2](v10, v12);

    [(TIKeyboardInputManagerMecabra *)self setPendingStickerTask:0];
  }
  id v13 = [v6 candidates];
  if (![v13 count]) {
    goto LABEL_9;
  }
  id v14 = [(TIKeyboardInputManager *)self keyboardState];
  if (([v14 imageSuggestionEnabled] & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  BOOL v15 = [(TIKeyboardInputManager *)self shouldOfferStickers];

  if (!v15)
  {
LABEL_10:
    v7[2](v7, v6);
    goto LABEL_11;
  }
  uint64_t v16 = [v6 candidates];
  char v17 = [v16 firstObject];

  id v18 = [(TIKeyboardInputManager *)self stickerCandidateGenerator];
  uint64_t v19 = [v17 candidate];
  id v20 = [v18 generateStickerQueriesForText:v19 tokenize:0];

  if ([v20 count])
  {
    uint64_t v28 = v17;
    char v21 = objc_alloc_init(TIKeyboardInputManagerStickerTask);
    [(TIKeyboardInputManagerStickerTask *)v21 setCandidateResultSet:v6];
    [(TIKeyboardInputManagerStickerTask *)v21 setStickerCompletionHandler:v7];
    [(TIKeyboardInputManagerMecabra *)self setPendingStickerTask:v21];
    objc_initWeak(&location, self);
    id v22 = [(TIKeyboardInputManager *)self keyboardState];
    id v23 = [v22 secureCandidateRenderTraits];
    BOOL v27 = [(TIKeyboardInputManager *)self shouldGeneratePredictionsForCurrentContext];
    uint64_t v24 = [(TIKeyboardInputManagerBase *)self inputMode];
    char v25 = [v24 languageWithRegion];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__TIKeyboardInputManagerMecabra_addStickers_withCompletionHandler___block_invoke;
    v29[3] = &unk_1E6E29A00;
    objc_copyWeak(&v34, &location);
    unsigned int v30 = v21;
    id v31 = v28;
    id v32 = v6;
    id v33 = v7;
    uint64_t v26 = v21;
    [v18 generateStickerCandidatesForSearchableQueries:v20 withRenderTraits:v23 shouldAppend:v27 language:v25 completionHandler:v29];

    char v17 = v28;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[2](v7, v6);
  }

LABEL_11:
}

void __67__TIKeyboardInputManagerMecabra_addStickers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = [WeakRetained pendingStickerTask];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    [WeakRetained setPendingStickerTask:0];
    if ([v3 count])
    {
      uint64_t v7 = +[TIAppAutofillManager sharedInstance];
      uint64_t v8 = [v7 secureCandidateRenderer];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v18 = v3;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v15 = [v8 cachedCandidateForSecureCandidate:v14];
              uint64_t v16 = [*(id *)(a1 + 40) input];
              [v15 setInput:v16];

              char v17 = [*(id *)(a1 + 40) rawInput];
              [v15 setRawInput:v17];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      [*(id *)(a1 + 48) insertStickers:v9];
      id v3 = v18;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (pair<NSString)_supplementalItemIdentifiersInCurrentSelection
{
  id v4 = v2;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  id v6 = [v5 documentState];
  uint64_t v7 = [v6 selectedText];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    void *v4 = 0;
    v4[1] = 0;
  }
  else
  {
    uint64_t v11 = self;
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [(TIKeyboardInputManager *)v11 keyboardState];
    uint64_t v14 = [v13 documentState];
    BOOL v15 = [v14 contextBeforeInput];

    if ([v15 length]) {
      [v12 appendString:v15];
    }

    uint64_t v16 = [(TIKeyboardInputManager *)v11 keyboardState];
    char v17 = [v16 documentState];
    id v18 = [v17 contextAfterInput];

    if ([v18 length]) {
      [v12 appendString:v18];
    }

    if ([v12 length])
    {
      id v41 = v4;
      long long v19 = objc_opt_new();
      long long v20 = [(TIKeyboardInputManager *)v11 keyboardState];
      long long v21 = [v20 documentState];
      long long v22 = [v21 contextBeforeInput];
      unint64_t v23 = [v22 length];

      id v43 = *((id *)v11->super.super.m_impl + 17);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v24 = [(TIKeyboardInputManager *)v11 currentCandidateGenerationContextSupplementalLexicons];
      char v25 = [v24 activeLexicon];
      uint64_t v26 = [v25 items];

      uint64_t v44 = [v26 countByEnumeratingWithState:&v51 objects:v56 count:16];
      BOOL v27 = 0;
      if (v44)
      {
        uint64_t v42 = *(void *)v52;
        id v46 = v12;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v52 != v42) {
              objc_enumerationMutation(v26);
            }
            uint64_t v45 = v28;
            v29 = *(void **)(*((void *)&v51 + 1) + 8 * v28);
            unsigned int v30 = objc_msgSend(v29, "core_nonPhoneticRangesInString:options:locale:", v12, 385, v43);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v48 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  unint64_t v35 = [*(id *)(*((void *)&v47 + 1) + 8 * i) rangeValue];
                  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    unint64_t v37 = v35;
                    BOOL v38 = v35 == 0x7FFFFFFFFFFFFFFFLL || v35 >= v23;
                    if (!v38 && v35 + v36 >= v23)
                    {
                      if (!v27)
                      {
                        BOOL v27 = objc_msgSend(v46, "substringWithRange:", v35, v36);
                      }
                      id v40 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "identifier", v37));
                      [v19 addObject:v40];
                    }
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v32);
            }

            uint64_t v28 = v45 + 1;
            uint64_t v12 = v46;
          }
          while (v45 + 1 != v44);
          uint64_t v44 = [v26 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v44);
      }

      if ([v19 count])
      {
        *id v41 = v27;
        v41[1] = v19;
      }
      else
      {
        *id v41 = 0;
        v41[1] = 0;
      }
    }
    else
    {
      void *v4 = 0;
      v4[1] = 0;
    }
  }
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)segmentsFromCandidate:(id)a3 phraseBoundary:(BOOL)a4
{
  BOOL v26 = a4;
  id v5 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v5])
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    id v6 = [v5 input];
    id v24 = v5;
    BOOL v27 = [v5 candidate];
    int WordCount = MecabraCandidateGetWordCount();
    if (WordCount >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = WordCount;
      uint64_t v25 = WordCount - 1;
      while (1)
      {
        uint64_t NextPhraseBoundary = v10;
        if (v26) {
          uint64_t NextPhraseBoundary = MecabraCandidateGetNextPhraseBoundary();
        }
        if (v11 == 1 && NextPhraseBoundary == -1) {
          break;
        }
        if (NextPhraseBoundary == -1) {
          uint64_t v13 = v25;
        }
        else {
          uint64_t v13 = NextPhraseBoundary;
        }
        if (v10 <= v13)
        {
          uint64_t v15 = 0;
          uint64_t v14 = 0;
          do
          {
            v15 += MecabraCandidateGetWordReadingLengthAtIndex();
            v14 += MecabraCandidateGetWordLengthAtIndex();
            ++v10;
          }
          while (v13 + 1 != v10);
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
        }
        uint64_t v16 = v15 + v8;
        if ([v6 length] >= (unint64_t)(v15 + v8))
        {
          objc_msgSend(v6, "substringWithRange:", v8, v15);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v17 = v6;
        }
        id v18 = v17;
        long long v19 = objc_msgSend(v27, "substringWithRange:", v9, v14);
        long long v20 = objc_alloc_init(TIMecabraSegment);
        [(TIMecabraSegment *)v20 setReading:v18];
        [(TIMecabraSegment *)v20 setSurface:v19];
        [v28 addObject:v20];
        v9 += v14;

        uint64_t v10 = v13 + 1;
        uint64_t v8 = v16;
        if (v13 + 1 >= v11) {
          goto LABEL_22;
        }
      }
      long long v22 = objc_alloc_init(TIMecabraSegment);
      [(TIMecabraSegment *)v22 setReading:v6];
      [(TIMecabraSegment *)v22 setSurface:v27];
      [v28 addObject:v22];
    }
LABEL_22:
    long long v21 = (void *)[v28 copy];

    id v5 = v24;
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (void)mecabraCandidateRefFromCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 proactiveTrigger];

  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    uint64_t v12 = [v8 candidateRefsDictionary];
    uint64_t v13 = [v4 mecabraCandidatePointerValue];
    uint64_t v11 = (void *)[v12 objectForKey:v13];

    goto LABEL_7;
  }
  id v6 = [v4 proactiveTrigger];
  uint64_t v7 = [v6 attributes];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4FAEFD8]];

  if (!v8)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v10 = [v9 candidateRefsDictionary];
  uint64_t v11 = (void *)[v10 objectForKey:v8];

  if (v11)
  {
    uint64_t v12 = [v4 candidate];
    MecabraCandidateSetDisplayString();
LABEL_7:
  }
LABEL_9:

LABEL_11:
  return v11;
}

- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 candidates];
  id v6 = [v4 proactiveCandidates];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 proactiveCandidates];
    uint64_t v9 = [v4 candidates];
    uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

    id v5 = (void *)v10;
  }
  uint64_t v11 = [v4 proactiveTriggers];
  uint64_t v12 = [(TIKeyboardInputManager *)self candidateResultSetFromCandidates:v5 proactiveTriggers:v11];

  uint64_t v13 = [v4 disambiguationCandidates];
  [v12 setDisambiguationCandidates:v13];

  objc_msgSend(v12, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v4, "selectedDisambiguationCandidateIndex"));

  return v12;
}

- (void)deleteFromInputWithContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v10 deleteFromInputWithContext:a3];
  BOOL v7 = [(TIKeyboardInputManagerMecabra *)self usesMarkedTextForInput];
  if (v7)
  {
    id v3 = [(TIKeyboardInputManager *)self keyboardState];
    id v4 = [v3 documentState];
    id v5 = [v4 markedText];
    if (![v5 length])
    {

LABEL_11:
      [(TIKeyboardInputManagerMecabra *)self updateDocumentContext];
      id v3 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
      [v3 adjustEnvironmentOnAction:2];
      goto LABEL_12;
    }
    if ([(TIKeyboardInputManagerMecabra *)self usesMarkedTextForInput])
    {

LABEL_12:
      return;
    }
  }
  else if ([(TIKeyboardInputManagerMecabra *)self usesMarkedTextForInput])
  {
    return;
  }
  uint64_t v8 = [(TIKeyboardInputManager *)self inputString];
  uint64_t v9 = [v8 length];

  if (v7)
  {
  }
  if (!v9) {
    goto LABEL_11;
  }
}

- (void)updateDocumentContext
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  id v8 = [v3 documentState];

  if (v8)
  {
    id v4 = [v8 contextBeforeInput];
    uint64_t v5 = [v8 contextAfterInput];
    if (!v4) {
      id v4 = &stru_1F3F7A998;
    }
    if (v5) {
      id v6 = (__CFString *)v5;
    }
    else {
      id v6 = &stru_1F3F7A998;
    }
    BOOL v7 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v7 setLeftDocumentContext:v4 rightDocumentContext:v6];
  }
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v6 = [v5 handleKeyboardInput:v4];

  if (v6) {
    goto LABEL_23;
  }
  BOOL v7 = [(TIKeyboardInputManager *)self keyboardState];
  id v8 = [v7 documentState];
  uint64_t v9 = [v8 markedText];

  objc_super v10 = [v4 string];
  if (![v9 length] && objc_msgSend(v10, "length"))
  {
    uint64_t v12 = [v10 characterAtIndex:0];
    uint64_t v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    if (![v13 characterIsMember:v12]
      || ![(TIKeyboardInputManagerMecabra *)self whiteSpaceEndsSentence])
    {
      uint64_t v14 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      if (![v14 characterIsMember:v12])
      {
        uint64_t v16 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
        if ([v16 characterIsMember:v12])
        {
          BOOL v17 = [(TIKeyboardInputManagerMecabra *)self apostropheEndsSentence];

          if (v17 || v12 != 39) {
            goto LABEL_10;
          }
        }
        else
        {
        }
        if ([(TIKeyboardInputManagerMecabra *)self usesMarkedTextForInput])
        {
          [(TIKeyboardInputManagerMecabra *)self updateDocumentContext];
          id v18 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
          [v18 adjustEnvironmentOnAction:1];

          [(TIKeyboardInputManagerMecabra *)self setHasCommittedPartialCandidate:0];
          [(TIKeyboardInputManagerMecabra *)self setHasBackspacedIntoInputString:0];
        }
        int v11 = 0;
        goto LABEL_19;
      }
    }
LABEL_10:
    uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v15 declareEndOfSentence];

    int v11 = 1;
LABEL_19:
    [(TIKeyboardInputManagerMecabra *)self setLastCommittedCandidateType:0];
    goto LABEL_20;
  }
  int v11 = 0;
LABEL_20:
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManagerMecabra;
  id v6 = [(TIKeyboardInputManager_mul *)&v21 handleKeyboardInput:v4];
  if (v11)
  {
    long long v19 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v19 clearLeftDocumentContext];
  }
LABEL_23:

  return v6;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    BOOL v5 = [(TIKeyboardInputManager *)&v7 stringEndsWord:v4];
  }

  return v5;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 0;
}

- (BOOL)shouldResample
{
  return 0;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 1;
}

- (BOOL)stringContainsActiveSupplementalLexiconSearchPrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManager *)self currentCandidateGenerationContextSupplementalLexicons];

  if (v5)
  {
    id v6 = [(TIKeyboardInputManager *)self currentCandidateGenerationContextSupplementalLexicons];
    objc_super v7 = [v6 activeLexicon];
    id v8 = v7;
    if (v7)
    {
      __int16 v12 = [v7 searchPrefixCharacter];
      uint64_t v9 = (void *)[[NSString alloc] initWithCharacters:&v12 length:1];
      char v10 = [v4 containsString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)usesMarkedTextForInput
{
  return 1;
}

- (BOOL)apostropheEndsSentence
{
  return 1;
}

- (BOOL)whiteSpaceEndsSentence
{
  return 1;
}

- (void)incrementUsageTrackingKeysForDeleteFromInput
{
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v15 incrementUsageTrackingKeysForDeleteFromInput];
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  id v4 = [v3 inputMode];

  BOOL v5 = [(TIKeyboardInputManager *)self keyboardState];
  id v6 = [v5 documentState];
  objc_super v7 = [v6 markedText];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if (![(TIKeyboardInputManagerMecabra *)self hasBackspacedIntoInputString])
    {
      uint64_t v9 = TIStatisticGetKeyForCandidateAccepted();
      TIStatisticScalarIncrement();

      [(TIKeyboardInputManagerMecabra *)self setHasBackspacedIntoInputString:1];
    }
  }
  else
  {
    int v10 = [(TIKeyboardInputManagerMecabra *)self lastCommittedCandidateType];
    if (v10 == 1)
    {
      int v11 = (id *)MEMORY[0x1E4FAEC20];
    }
    else
    {
      if (v10 != 2) {
        goto LABEL_10;
      }
      int v11 = (id *)MEMORY[0x1E4FAEC30];
    }
    id v12 = *v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = TIStatisticGetKeyForCandidateAccepted();
      TIStatisticScalarIncrement();

      [(TIKeyboardInputManagerMecabra *)self setLastCommittedCandidateType:0];
    }
  }
LABEL_10:
}

- (void)updateUsageStatisticsForCandidate:(id)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 input];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v9 = [v8 inputMode];

    int v10 = TIStatisticGetKeyForCandidateAccepted();
    TIStatisticScalarIncrement();

    if (![(TIKeyboardInputManagerMecabra *)self hasCommittedPartialCandidate])
    {
      int v11 = TIStatisticGetKeyForCandidateAccepted();
      TIStatisticScalarIncrement();

      if (v4)
      {
        [(TIKeyboardInputManagerMecabra *)self setHasCommittedPartialCandidate:1];
      }
      else
      {
        id v12 = TIStatisticGetKeyForCandidateAccepted();
        TIStatisticScalarIncrement();
      }
    }
  }
  if (!v4)
  {
    if (v7) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    [(TIKeyboardInputManagerMecabra *)self setLastCommittedCandidateType:v13];
  }
}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (!v7)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v8 syncMarkedTextForKeyboardState:v6 afterContextChange:v4];
  }
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerMecabra;
  id v8 = a3;
  [(TIKeyboardInputManager *)&v17 syncToKeyboardState:v8 from:a4 afterContextChange:v5];
  if ([(TIKeyboardInputManagerMecabra *)self supportsPerRecipientLearning])
  {
    [(TIKeyboardInputManagerMecabra *)self setLanguageModelAdaptationContext];
  }
  uint64_t v9 = [v8 textInputTraits];
  int v10 = [v9 textContentType];
  uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self mecabraTextContentTypeFromTITextContentType:v10];

  id v12 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  [v12 setMecabraTextContentType:v11];

  uint64_t v13 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  uint64_t v14 = [v8 isScreenLocked];

  [v13 setDisablePersonalData:v14];
  if (v5)
  {
    [(TIKeyboardInputManagerMecabra *)self updateDocumentContext];
    objc_super v15 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v15 adjustEnvironmentOnAction:3];

    [(TIKeyboardInputManagerMecabra *)self setLastCommittedCandidateType:0];
  }
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v16 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v16 removeAllInputs];
  }
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  char v9 = [v8 syncToKeyboardState:v7 completionHandler:v6];

  return v9;
}

- (int)mecabraTextContentTypeFromTITextContentType:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4FAEEE0]])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEE8]])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEC0]])
    {
      int v5 = 3;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEED8]])
    {
      int v5 = 4;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEB0]])
    {
      int v5 = 5;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEF0]])
    {
      int v5 = 6;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEF8]])
    {
      int v5 = 7;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEC8]])
    {
      int v5 = 8;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF00]])
    {
      int v5 = 9;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEED0]])
    {
      int v5 = 10;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEB8]])
    {
      int v5 = 11;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF10]])
    {
      int v5 = 12;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF18]])
    {
      int v5 = 13;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEE78]])
    {
      int v5 = 14;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEE88]])
    {
      int v5 = 15;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEE80]])
    {
      int v5 = 16;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF20]])
    {
      int v5 = 17;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEA0]])
    {
      int v5 = 18;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF08]])
    {
      int v5 = 19;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF28]])
    {
      int v5 = 20;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEEA8]])
    {
      int v5 = 21;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4FAEF30]])
    {
      int v5 = 22;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)setLanguageModelAdaptationContext
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v4 = [v3 clientIdentifier];
  int v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F3F7A998;
  }
  uint64_t v16 = v6;

  id v7 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v8 = [v7 recipientIdentifier];
  char v9 = (void *)v8;
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  else {
    int v10 = &stru_1F3F7A998;
  }
  uint64_t v11 = v10;

  id v12 = [(TIKeyboardInputManagerMecabra *)self currentClientIdentifier];
  if (([(__CFString *)v16 isEqualToString:v12] & 1) == 0)
  {

    goto LABEL_11;
  }
  uint64_t v13 = [(TIKeyboardInputManagerMecabra *)self currentRecipientIdentifier];
  char v14 = [(__CFString *)v11 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
LABEL_11:
    objc_super v15 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v15 setLanguageModelAdaptationContextWithClientIdentifier:v16 recipientIdentifier:v11];

    [(TIKeyboardInputManagerMecabra *)self setCurrentRecipientIdentifier:v11];
    [(TIKeyboardInputManagerMecabra *)self setCurrentClientIdentifier:v16];
  }
}

- (BOOL)supportsPerRecipientLearning
{
  return 0;
}

- (BOOL)updateLanguageModelForKeyboardState
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v4 = [v3 clientIdentifier];

  int v5 = +[TIKeyboardInputManagerMecabra initializedClients];
  id v6 = v5;
  if (v4)
  {
    if (([v5 containsObject:v4] & 1) == 0)
    {
      id v7 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
      uint64_t v8 = [v7 mecabra];

      if (v8)
      {
        char v9 = +[TIWordSearch sharedOperationQueue];
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        objc_super v15 = __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke;
        uint64_t v16 = &unk_1E6E2B8A8;
        uint64_t v18 = v8;
        id v10 = v4;
        id v17 = v10;
        uint64_t v11 = +[NSBlockOperation blockOperationWithBlock:&v13];
        objc_msgSend(v9, "addOperation:", v11, v13, v14, v15, v16);

        [v6 addObject:v10];
      }
    }
  }

  return 1;
}

void __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke(uint64_t a1)
{
  MecabraGetLastOfflineAdaptationTime();
  uint64_t v3 = v2;
  dispatch_time_t v4 = dispatch_time(0, 20000000000);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke_2;
  v5[3] = &unk_1E6E2B8A8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], v5);
}

void __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [[TILanguageModelOfflineLearningStrategyMecabraFavonius alloc] initWithClientIdentifier:*(void *)(a1 + 32)];
  uint64_t v2 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
  [v2 performLearningIfNecessaryWithStrategy:v3 lastAdaptationTime:*(double *)(a1 + 40)];
}

- (BOOL)shouldUpdateLanguageModel
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v2 secureTextEntry]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = TI_DEVICE_UNLOCKED_SINCE_BOOT();
  }

  return v3;
}

- (id)adaptationContextReadingForReanalysisString:(id)a3 fromRecentlyCommittedCandidates:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v5 = a4;
  if (![v5 count])
  {
    uint64_t v13 = 0;
    goto LABEL_53;
  }
  id v6 = [MEMORY[0x1E4F28E78] string];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!MecabraCandidateIsUserWordCandidate()) {
          [v6 appendString:MecabraCandidateGetSurface()];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v6 rangeOfString:v53 options:6];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = 0;
    goto LABEL_52;
  }
  uint64_t v44 = v12;
  id v45 = v5;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (!v16) {
    goto LABEL_45;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v60;
  id v48 = v15;
  long long v49 = v6;
  uint64_t v47 = *(void *)v60;
  while (2)
  {
    uint64_t v19 = 0;
    uint64_t v50 = v17;
    do
    {
      if (*(void *)v60 != v18) {
        objc_enumerationMutation(v15);
      }
      if (!MecabraCandidateIsUserWordCandidate())
      {
        MecabraCandidateGetAnalysisString();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
LABEL_42:

          goto LABEL_43;
        }
        objc_super v21 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
        if ([v21 count])
        {
          unint64_t v22 = [v20 length];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v51 = v21;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = 0;
            uint64_t v27 = *(void *)v56;
            do
            {
              uint64_t v28 = 0;
              uint64_t v29 = v26;
              do
              {
                if (*(void *)v56 != v27) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v30 = [*(id *)(*((void *)&v55 + 1) + 8 * v28) unsignedIntegerValue];
                uint64_t v26 = v30 + v29;
                if (v22 >= v30 + v29)
                {
                  uint64_t v31 = objc_msgSend(v20, "substringWithRange:", v29, v30);
                  [v14 addObject:v31];
                }
                ++v28;
                uint64_t v29 = v26;
              }
              while (v25 != v28);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v67 count:16];
            }
            while (v25);
            id v15 = v48;
            id v6 = v49;
            uint64_t v18 = v47;
LABEL_39:
            uint64_t v17 = v50;
          }
          objc_super v21 = v51;
          goto LABEL_41;
        }
        MecabraCandidateGetSurface();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        if ([v53 isEqualToString:v23])
        {
          id v20 = v20;
          uint64_t v13 = v20;
          id v5 = v45;
        }
        else
        {
          int WordCount = MecabraCandidateGetWordCount();
          if (!WordCount)
          {
LABEL_41:

            goto LABEL_42;
          }
          long long v51 = v21;
          uint64_t v46 = v19;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          uint64_t v35 = 0;
          uint64_t v52 = WordCount;
          while (1)
          {
            uint64_t WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
            unint64_t v37 = objc_msgSend(v23, "substringWithRange:", v35, WordLengthAtIndex);
            uint64_t WordDictionaryReadingLengthAtIndex = MecabraCandidateGetWordDictionaryReadingLengthAtIndex();
            if ([v53 isEqualToString:v37])
            {
              BOOL v38 = MecabraCandidateGetDictionaryReading();
              if (v38) {
                break;
              }
            }
            v35 += WordLengthAtIndex;
            v34 += WordDictionaryReadingLengthAtIndex;

            if (v52 == ++v33)
            {
              id v15 = v48;
              id v6 = v49;
              uint64_t v19 = v46;
              uint64_t v18 = v47;
              goto LABEL_39;
            }
          }
          uint64_t v42 = v38;
          uint64_t v13 = objc_msgSend(v38, "substringWithRange:", v34, WordDictionaryReadingLengthAtIndex);

          id v5 = v45;
          id v15 = v48;
          id v6 = v49;
          objc_super v21 = v51;
        }

        goto LABEL_50;
      }
LABEL_43:
      ++v19;
    }
    while (v19 != v17);
    uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_45:

  v39 = [v6 substringToIndex:v44];
  uint64_t v40 = [v39 _graphemeCount];

  uint64_t v41 = [v53 _graphemeCount];
  if ([v14 count] >= (unint64_t)(v41 + v40))
  {
    objc_msgSend(v14, "subarrayWithRange:", v40, v41);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v15 componentsJoinedByString:&stru_1F3F7A998];
    id v5 = v45;
LABEL_50:
  }
  else
  {
    uint64_t v13 = 0;
    id v5 = v45;
  }

LABEL_52:
LABEL_53:

  return v13;
}

- (void)handlePerformBackgroundMaintenanceNotification
{
  id v5 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  if (v5)
  {
    uint64_t v2 = [TIWordSearchOperationPerformMaintenance alloc];
    unsigned __int8 v3 = [v5 mecabraWrapper];
    dispatch_time_t v4 = [(TIWordSearchOperationPerformMaintenance *)v2 initWithMecabraWrapper:v3];

    [v5 performOperationAsync:v4 withBackgroundActivityAssertion:1];
  }
}

- (id)inputsToReject
{
  uint64_t v2 = [(TIKeyboardInputManager *)self rawInputString];
  uint64_t v3 = [v2 length];

  if (v3) {
    dispatch_time_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FAE290]) initWithCharactersInString:@"\t"];
  }
  else {
    dispatch_time_t v4 = 0;
  }

  return v4;
}

- (id)pathedWordSeparator
{
  if ([(TIKeyboardInputManagerMecabra *)self pathedWordSeparatorChar])
  {
    objc_msgSend(NSString, "_stringWithUnichar:", -[TIKeyboardInputManagerMecabra pathedWordSeparatorChar](self, "pathedWordSeparatorChar"));
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = &stru_1F3F7A998;
  }

  return v3;
}

- (unsigned)pathedWordSeparatorChar
{
  return 0;
}

- (id)wordSeparator
{
  return &stru_1F3F7A998;
}

- (void)resume
{
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager_mul *)&v2 resume];
}

- (void)suspend
{
  uint64_t v3 = [(TIKeyboardInputManager *)self config];
  char v4 = [v3 isTesting];

  if ((v4 & 1) == 0)
  {
    id v5 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v5 saveLearningDictionary];
  }
  id v6 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  [v6 resetMecabraEnvironment];

  [(TIKeyboardInputManagerMecabra *)self handlePerformBackgroundMaintenanceNotification];
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager_mul *)&v7 suspend];
}

- (void)insertDummyTouchDataAtIndex:(unint64_t)a3
{
  id v8 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
  id v5 = [(id)objc_opt_class() dummyTouchData];
  id v6 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
  if ([v6 count] <= a3)
  {
    objc_super v7 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
    objc_msgSend(v8, "insertObject:atIndex:", v5, objc_msgSend(v7, "count"));
  }
  else
  {
    [v8 insertObject:v5 atIndex:a3];
  }
}

- (void)insertDummyGeometryDataAtIndex:(unint64_t)a3
{
  id v5 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  char v4 = [(id)objc_opt_class() dummyGeometryData];
  [v5 insertObject:v4 atIndex:a3];
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v5 storeLanguageModelDynamicDataIncludingCache];
  uint64_t v3 = [(TIKeyboardInputManager *)self rawInputString];
  uint64_t v4 = [v3 length];

  if (v4) {
    [(TIKeyboardInputManagerMecabra *)self logInputString];
  }
}

- (void)logCommittedCandidate:(id)a3 partial:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = [a3 candidate];
  id v6 = [(TIKeyboardInputManager *)self rawInputString];
  if ([v9 length])
  {
    objc_super v7 = @"NO";
    if (v4) {
      objc_super v7 = @"YES";
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Accepted candidate:%@; partial:%@; input:%@\n\n",
      v9,
      v7,
    id v8 = v6);
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v8];
  }
}

- (void)logAllCandidates
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  BOOL v4 = [v3 candidates];

  if ([v4 count])
  {
    uint64_t v25 = self;
    objc_super v5 = [(TIKeyboardInputManager *)self inputString];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v26 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v27 = v6;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v12 = [v11 input];
          if ([v12 length])
          {
            uint64_t v13 = [v11 input];
            if ([v13 isEqualToString:v5])
            {
              uint64_t v14 = [v11 candidate];
            }
            else
            {
              id v15 = NSString;
              uint64_t v16 = [v11 input];
              [v11 candidate];
              uint64_t v18 = v17 = v5;
              uint64_t v19 = v15;
              id v6 = v27;
              uint64_t v14 = [v19 stringWithFormat:@"%@ -> %@", v16, v18];

              objc_super v5 = v17;
            }
          }
          else
          {
            uint64_t v14 = [v11 candidate];
          }

          if (v14) {
            [v6 addObject:v14];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }

    id v20 = NSString;
    objc_super v21 = [v6 componentsJoinedByString:@"; "];
    unint64_t v22 = [v20 stringWithFormat:@"All candidates: %@\n\n", v21];

    if ((unint64_t)[v22 length] >= 0xBB9)
    {
      id v23 = [v22 substringToIndex:3000];
      uint64_t v24 = [v23 stringByAppendingString:@"..."];

      unint64_t v22 = (void *)v24;
    }
    [(TIKeyboardInputManager *)v25 logToTypologyRecorderWithString:v22];

    BOOL v4 = v26;
  }
}

- (void)logDocumentContext
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  id v10 = [v3 documentState];

  BOOL v4 = NSString;
  objc_super v5 = [v10 contextBeforeInput];
  id v6 = [v4 stringWithFormat:@"Context Before Input: %@\n", v5];
  [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = [v10 contextAfterInput];
  uint64_t v9 = [v7 stringWithFormat:@"Context After Input: %@\n", v8];
  [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v9];
}

- (void)logInputString
{
  uint64_t v3 = [(TIKeyboardInputManager *)self rawInputString];
  BOOL v4 = NSString;
  uint64_t v5 = [(__CFString *)v3 length];
  id v6 = @"(none)";
  if (v5) {
    id v6 = v3;
  }
  uint64_t v7 = [v4 stringWithFormat:@"Input String: %@\n", v6];
  [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v7];

  uint64_t v8 = NSString;
  uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  id v10 = [v9 shortDescription];
  uint64_t v11 = [v8 stringWithFormat:@"Keyboard Input: %@\n", v10];
  [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v11];

  uint64_t v12 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  uint64_t v13 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  unint64_t v14 = [(__CFString *)v3 length];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__TIKeyboardInputManagerMecabra_logInputString__block_invoke;
  v23[3] = &unk_1E6E299B8;
  if (v14 >= 0x14) {
    uint64_t v15 = 20;
  }
  else {
    uint64_t v15 = v14;
  }
  id v24 = v13;
  id v25 = v12;
  if (v14 <= 0x14) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = v14 - 20;
  }
  uint64_t v26 = self;
  uint64_t v27 = v28;
  id v17 = v12;
  id v18 = v13;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](v3, "enumerateSubstringsInRange:options:usingBlock:", v16, v15, 2, v23);
  uint64_t v19 = NSString;
  id v20 = [(TIKeyboardInputManagerBase *)self inputMode];
  objc_super v21 = [v20 normalizedIdentifier];
  unint64_t v22 = [v19 stringWithFormat:@"Keyboard: %@\n", v21];
  [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v22];

  [(TIKeyboardInputManagerMecabra *)self logDocumentContext];
  [(TIKeyboardInputManagerMecabra *)self logAllCandidates];

  _Block_object_dispose(v28, 8);
}

void __47__TIKeyboardInputManagerMecabra_logInputString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  *(void *)&v48[164] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v10 >= [*(id *)(a1 + 32) count]
    || (unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v11 >= [*(id *)(a1 + 40) count]))
  {
    *a7 = 1;
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 48) validCharacterSetForAutocorrection];
    char v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

    if (v13)
    {
      unint64_t v14 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      uint64_t v15 = [v14 objectAtIndexedSubscript:2];
      [v15 doubleValue];
      double v17 = v16;

      id v18 = [v14 objectAtIndexedSubscript:5];
      [v18 doubleValue];
      double v20 = v19;

      if (v17 == 0.0) {
        double v17 = v20;
      }
      if ((unint64_t)[v14 count] < 7)
      {
        id v24 = &stru_1F3F7A998;
      }
      else
      {
        objc_super v21 = [v14 objectAtIndexedSubscript:6];
        uint64_t v22 = [v21 integerValue];

        id v23 = @"; flick";
        if (v22 == 1) {
          id v23 = @"; multitap";
        }
        id v24 = v23;
      }
      uint64_t v27 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      unint64_t v28 = [v27 length];
      if (v28 < 0xA9)
      {
        unint64_t v29 = v28;
        id v45 = v27;
        uint64_t v46 = v24;
        [v27 getBytes:v47 length:v28];
        long long v30 = [MEMORY[0x1E4F1CA48] array];
        if ((v29 & 0x7FFFFFFF0) != 0)
        {
          uint64_t v31 = (v29 >> 3) - 1;
          long long v32 = (float *)v48;
          do
          {
            uint64_t v33 = *((unsigned __int16 *)v32 - 2);
            float v34 = *v32;
            v32 += 2;
            uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%C:%f", v33, v34);
            [v30 addObject:v35];

            --v31;
          }
          while (v31);
        }
        id v43 = NSString;
        uint64_t v44 = *(void **)(a1 + 48);
        uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v41 = [v30 componentsJoinedByString:@", "];
        uint64_t v36 = [v14 objectAtIndexedSubscript:0];
        unint64_t v37 = [v14 objectAtIndexedSubscript:1];
        BOOL v38 = [v14 objectAtIndexedSubscript:3];
        v39 = [v14 objectAtIndexedSubscript:4];
        id v24 = v46;
        objc_msgSend(v43, "stringWithFormat:", @"%lu; %@; %@; %@,%@; %@,%@; %.3f; %.3f%@\n",
          v42,
          v9,
          v41,
          v36,
          v37,
          v38,
          v39,
          v20 - v17,
          *(void *)&v20,
        uint64_t v40 = v46);
        [v44 logToTypologyRecorderWithString:v40];

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v9 length];
        uint64_t v27 = v45;
      }
      else
      {
        *a7 = 1;
      }
    }
    else
    {
      id v25 = *(void **)(a1 + 48);
      objc_msgSend(NSString, "stringWithFormat:", @"%lu; %@\n",
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24),
      uint64_t v26 = v9);
      [v25 logToTypologyRecorderWithString:v26];

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v9 length];
    }
  }
}

- (void)saveTouchDataForEvent:(id)a3 atIndex:(unint64_t)a4
{
  id v16 = a3;
  id v6 = [v16 touchEvent];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [(TIKeyboardInputManager *)self keyboardState];
  if (([v7 hardwareKeyboardMode] & 1) != 0 || objc_msgSend(v16, "isPopupVariant"))
  {

LABEL_5:
    uint64_t v8 = [(id)objc_opt_class() dummyTouchData];
    goto LABEL_6;
  }
  int v15 = [v16 isGesture];

  if (v15) {
    goto LABEL_5;
  }
  uint64_t v8 = -[TIKeyboardInputManagerMecabra touchDataForPathIndex:](self, "touchDataForPathIndex:", [v6 pathIndex]);
LABEL_6:
  id v9 = (void *)v8;
  if ([v16 isMultitap])
  {
    unint64_t v10 = &unk_1F3FA7A30;
  }
  else
  {
    if (![v16 isFlick]) {
      goto LABEL_11;
    }
    unint64_t v10 = &unk_1F3FA7A48;
  }
  uint64_t v11 = [v9 arrayByAddingObject:v10];

  id v9 = (void *)v11;
LABEL_11:
  uint64_t v12 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
  char v13 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
  if ([v13 count] <= a4)
  {
    unint64_t v14 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
    objc_msgSend(v12, "insertObject:atIndex:", v9, objc_msgSend(v14, "count"));
  }
  else
  {
    [v12 insertObject:v9 atIndex:a4];
  }
}

- (id)touchDataForPathIndex:(int64_t)a3
{
  v29[6] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self touchDownEvents];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self touchUpEvents];
  uint64_t v8 = [v7 objectForKey:v4];

  if (v6)
  {
    [v6 location];
    double v10 = v9;
    double v12 = v11;
    [v6 timestamp];
    double v14 = v13;
    if (v8)
    {
LABEL_3:
      [v8 location];
      double v16 = v15;
      double v18 = v17;
      [v8 timestamp];
      double v20 = v19;
      goto LABEL_6;
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v14 = 0.0;
    if (v8) {
      goto LABEL_3;
    }
  }
  double v16 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v20 = 0.0;
LABEL_6:
  objc_super v21 = [NSNumber numberWithDouble:v10];
  v29[0] = v21;
  uint64_t v22 = [NSNumber numberWithDouble:v12];
  v29[1] = v22;
  id v23 = [NSNumber numberWithDouble:v14];
  v29[2] = v23;
  id v24 = [NSNumber numberWithDouble:v16];
  v29[3] = v24;
  id v25 = [NSNumber numberWithDouble:v18];
  void v29[4] = v25;
  uint64_t v26 = [NSNumber numberWithDouble:v20];
  v29[5] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  return v27;
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->super.super.m_impl)
  {
    if ([(TIKeyboardInputManager *)self isTypologyEnabled]
      || [(TIKeyboardInputManagerMecabra *)self needsTouchEvents])
    {
      if (![v6 stage])
      {
        uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self touchDownEvents];
        goto LABEL_9;
      }
      if ([v6 stage] == 2)
      {
        uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self touchUpEvents];
LABEL_9:
        double v9 = (void *)v7;
        double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "pathIndex"));
        [v9 setObject:v6 forKey:v10];
      }
    }
    if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]
      || [v6 stage] != 1 && objc_msgSend(v6, "stage") != 2)
    {
LABEL_49:
      v36.receiver = self;
      v36.super_class = (Class)TIKeyboardInputManagerMecabra;
      id v8 = [(TIKeyboardInputManager *)&v36 addTouch:v6 shouldHitTest:v4];
      goto LABEL_50;
    }
    double v11 = [(TIKeyboardInputManager *)self previousTouchEvent];
    if (![(MCDrawInput *)v11 stage])
    {
      int v12 = [v6 stage];

      if (v12 != 1) {
        goto LABEL_24;
      }
      double v13 = [MCDrawInput alloc];
      [(TIKeyboardInputManagerMecabra *)self currentCharacterKeysLayout];
      if ([(TIKeyboardInputManagerMecabra *)self shouldRescaleTouchPoints]) {
        [(TIKeyboardInputManagerMecabra *)self baseCharacterKeysLayout];
      }
      else {
        uint64_t v37 = 0;
      }
      double v11 = [(MCDrawInput *)v13 initWithKeyboardLayout:&v38 rescaleKeyboardLayout:&v37 shouldResample:[(TIKeyboardInputManagerMecabra *)self shouldResample]];
      if (v37) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v37);
      }
      if (v38) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v38);
      }
      double v14 = [(TIKeyboardInputManager *)self previousTouchEvent];
      [(MCDrawInput *)v11 composeWith:v14];

      double v15 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v15 composeNew:v11];

      [(TIKeyboardInputManagerMecabra *)self setPreviouslyDeletedTypeInput:0];
      [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:0];
    }

LABEL_24:
    double v16 = [(TIKeyboardInputManager *)self previousTouchEvent];
    if ([v16 stage] == 1)
    {
      int v17 = [v6 stage];

      if (v17 != 1)
      {
        BOOL v21 = 0;
        BOOL is_far_away_point = 0;
LABEL_35:
        id v25 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        uint64_t v26 = [v25 composingInput];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unint64_t v28 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          unint64_t v29 = [v28 composingInput];

          if ([v29 isDrawing])
          {
            if ([v6 stage] == 2
              && [v6 continuousPathState] != 5)
            {
              uint64_t v31 = [(TIKeyboardInputManagerMecabra *)self composingInput];
              [v31 removeComposingInput];
            }
            else if (is_far_away_point)
            {
              [(TIKeyboardInputManagerMecabra *)self setCancelledDrawInput:v29];
              long long v30 = [(TIKeyboardInputManagerMecabra *)self composingInput];
              [v30 removeComposingInput];

              [(TIKeyboardInputManagerMecabra *)self updateComposedText];
              [(TIKeyboardInputManager *)self setMarkedText];
            }
            else
            {
              [v29 composeWith:v6];
            }
          }
        }
        if (v21)
        {
          long long v32 = [(TIKeyboardInputManagerMecabra *)self cancelledDrawInput];

          if (v32)
          {
            uint64_t v33 = [(TIKeyboardInputManagerMecabra *)self composingInput];
            float v34 = [(TIKeyboardInputManagerMecabra *)self cancelledDrawInput];
            [v33 composeNew:v34];

            [(TIKeyboardInputManagerMecabra *)self setCancelledDrawInput:0];
          }
        }
        if ([v6 stage] == 2) {
          [(TIKeyboardInputManagerMecabra *)self setCancelledDrawInput:0];
        }
        goto LABEL_49;
      }
      double v18 = *(CGFloat **)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
      double v19 = [(TIKeyboardInputManager *)self previousTouchEvent];
      [v19 location];
      if (TI::Favonius::KeyboardLayout::is_far_away_point(v18, v39))
      {
        BOOL is_far_away_point = 0;
      }
      else
      {
        uint64_t v22 = *(CGFloat **)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
        [v6 location];
        BOOL is_far_away_point = TI::Favonius::KeyboardLayout::is_far_away_point(v22, v40);
      }

      id v23 = *(CGFloat **)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
      double v16 = [(TIKeyboardInputManager *)self previousTouchEvent];
      [v16 location];
      if (TI::Favonius::KeyboardLayout::is_far_away_point(v23, v41))
      {
        id v24 = *(CGFloat **)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
        [v6 location];
        BOOL v21 = !TI::Favonius::KeyboardLayout::is_far_away_point(v24, v42);
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
      BOOL is_far_away_point = 0;
    }

    goto LABEL_35;
  }
  id v8 = 0;
LABEL_50:

  return (int64_t)v8;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v45.receiver = self;
  v45.super_class = (Class)TIKeyboardInputManagerMecabra;
  int v12 = -[TIKeyboardInputManager addInput:flags:point:firstDelete:](&v45, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    double v13 = (void *)(*(uint64_t (**)(void, void))(**((void **)self->super.super.m_impl + 23) + 240))(*((void *)self->super.super.m_impl + 23), (*((_DWORD *)self->super.super.m_impl + 24) - 1));
    uint64_t v14 = [(id)objc_opt_class() maxNearbyKeysCountDefault];
    unint64_t v15 = v14 << [(TIKeyboardInputManager_mul *)self isUsingMultilingual];
    uint64_t v37 = v12;
    uint64_t v38 = v11;
    if (v13) {
      WTF::Vector<WTF::RefPtr<TI::Favonius::KeyMatch>,0ul>::Vector(v44, v13);
    }
    else {
      memset(v44, 0, sizeof(v44));
    }
    objc_super v36 = asMCNearbyKeys(v44, v15);
    WTF::Vector<WTF::RefPtr<TI::Favonius::KeyMatch>,0ul>::~Vector(v44);
    double v16 = [MCKeyboardState alloc];
    int v17 = [(TIKeyboardInputManager *)self keyboardState];
    double v18 = [v17 layoutState];
    uint64_t v19 = [v18 userInterfaceIdiom];
    double v20 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v21 = [v20 splitKeyboardMode];
    uint64_t v22 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v23 = [v22 floatingKeyboardMode];
    id v24 = [(TIKeyboardInputManager *)self keyboardState];
    id v25 = -[MCKeyboardState initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:](v16, "initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:", v19, v21, v23, [v24 hardwareKeyboardMode]);

    id v11 = v38;
    uint64_t v26 = [(TIKeyboardInputManager_mul *)self externalStringToInternal:v38];
    if (([v38 isEqualToString:@"^_^"] & 1) != 0
      || [v26 isEqualToString:@"^_^"])
    {
      uint64_t v27 = [MCSyntheticInput alloc];
      v46[0] = @"^_^";
      unint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      unint64_t v29 = [(MCSyntheticInput *)v27 initWithCommittedText:&stru_1F3F7A998 syllables:v28];

      long long v30 = [MCTypeInput alloc];
      uint64_t v31 = [(MCTypeInput *)v30 initWithCharacters:@"☻" nearbyKeys:MEMORY[0x1E4F1CBF0]];
      [(MCKeyboardInput *)v29 composeNew:v31];
      long long v32 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v32 composeNew:v29];

      uint64_t v33 = v36;
    }
    else
    {
      uint64_t v34 = [v26 length];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __66__TIKeyboardInputManagerMecabra_addInput_flags_point_firstDelete___block_invoke;
      v39[3] = &unk_1E6E29990;
      double v42 = x;
      double v43 = y;
      v39[4] = self;
      uint64_t v33 = v36;
      id v40 = v36;
      CGPoint v41 = v25;
      objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v34, 2, v39);
    }
    -[TIKeyboardInputManagerMecabra setShouldClearBeforeContinuousPath:](self, "setShouldClearBeforeContinuousPath:", 1, v36);
    [(TIKeyboardInputManagerMecabra *)self setPreviouslyDeletedTypeInput:0];
    [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:0];

    int v12 = v37;
  }

  return v12;
}

void __66__TIKeyboardInputManagerMecabra_addInput_flags_point_firstDelete___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return;
  }
  double v4 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if (![v5 shouldRescaleTouchPoints]) {
    goto LABEL_8;
  }
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v4 == *MEMORY[0x1E4F1DAD8] && v3 == v8) {
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) currentCharacterKeysLayoutFrame];
  double v11 = v10;
  CGFloat v13 = v12;
  id v29 = v14;
  CGFloat v16 = v15;
  [*(id *)(a1 + 32) baseCharacterKeysLayoutFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v27 = v16;
  v32.origin.double x = v11;
  double v28 = v13;
  v32.origin.double y = v13;
  *(void *)&v32.size.width = v29;
  v32.size.height = v16;
  double v25 = v20;
  v33.origin.double x = v18;
  v33.origin.double y = v25;
  v33.size.width = v22;
  v33.size.height = v24;
  if (!CGRectEqualToRect(v32, v33))
  {
    double v7 = v18 + (v4 - v11) / *(double *)&v29 * v22;
    double v8 = v25 + (v3 - v28) / v27 * v24;
  }
  else
  {
LABEL_8:
    double v7 = v4;
    double v8 = v3;
  }
LABEL_9:
  long long v30 = -[MCTypeInput initWithCharacters:point:nearbyKeys:sourceKeyboardState:]([MCTypeInput alloc], "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", v6, *(void *)(a1 + 40), *(void *)(a1 + 48), v7, v8);

  uint64_t v26 = [*(id *)(a1 + 32) composingInput];
  [v26 composeNew:v30];
}

- (CGRect)currentCharacterKeysLayoutFrame
{
  [(TIKeyboardInputManagerMecabra *)self currentCharacterKeysLayout];
  double v2 = v10[15];
  double v3 = v10[16];
  double v4 = v10[17];
  double v5 = v10[18];
  WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v10);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)currentCharacterKeysLayout
{
  double v4 = v2;
  double v5 = (id *)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
  if (self->_compositionCompletionHandler != *v5)
  {
    double v6 = *(atomic_uint **)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
    if (v6) {
      atomic_fetch_add(v6, 1u);
    }
    id compositionCompletionHandler = self->_compositionCompletionHandler;
    self->_id compositionCompletionHandler = v6;
    if (compositionCompletionHandler) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)compositionCompletionHandler);
    }
    [(TIKeyboardInputManagerMecabra *)self currentLayout];
    [(TIKeyboardInputManagerMecabra *)self characterKeysLayoutFrom:&v11];
    double v8 = v12;
    double v12 = 0;
    chainedKeyboardInputManager = self->chainedKeyboardInputManager;
    self->chainedKeyboardInputManager = v8;
    if (chainedKeyboardInputManager)
    {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)chainedKeyboardInputManager);
      if (v12) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v12);
      }
    }
    double v5 = v11;
    if (v11) {
      double v5 = (id *)WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v11);
    }
  }
  double v10 = self->chainedKeyboardInputManager;
  void *v4 = v10;
  if (v10) {
    atomic_fetch_add((atomic_uint *volatile)v10, 1u);
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)v5;
}

- (CGRect)baseCharacterKeysLayoutFrame
{
  [(TIKeyboardInputManagerMecabra *)self baseCharacterKeysLayout];
  double v2 = v10[15];
  double v3 = v10[16];
  double v4 = v10[17];
  double v5 = v10[18];
  WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v10);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)baseCharacterKeysLayout
{
  double v4 = v2;
  v5.m_ptr = (KeyboardLayout *)[(TIKeyboardInputManagerMecabra *)self shouldRescaleTouchPoints];
  m_ptr = self->_currentCharacterKeysLayout.m_ptr;
  if (!m_ptr)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x4812000000;
    v10[3] = __Block_byref_object_copy__1859;
    v10[4] = __Block_byref_object_dispose__1860;
    v10[5] = "";
    memset(&v10[6], 0, 24);
    double v7 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    double v8 = [v7 baseLayout];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__TIKeyboardInputManagerMecabra_baseCharacterKeysLayout__block_invoke;
    v9[3] = &unk_1E6E29968;
    v9[4] = v10;
    [v8 enumerateKeysUsingBlock:v9];

    operator new();
  }
  void *v4 = m_ptr;
  atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  return v5;
}

void __56__TIKeyboardInputManagerMecabra_baseCharacterKeysLayout__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    double v3 = [NSString stringWithUTF8String:a2];
  }
  else
  {
    double v3 = &stru_1F3F7A998;
  }
  if ([(__CFString *)v3 length] == 1)
  {
    uint64_t v4 = [(__CFString *)v3 _firstChar];
    RefPtr<TI::Favonius::KeyboardLayout> v5 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    LODWORD(v4) = [v5 characterIsMember:v4];

    if (v4)
    {
      KB::String::String((KB::String *)v6, a2);
      operator new();
    }
  }
}

- (RefPtr<TI::Favonius::KeyboardLayout>)characterKeysLayoutFrom:(const void *)a3
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)a3;
  if (*(void *)a3)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x4812000000;
    v12[3] = __Block_byref_object_copy__1859;
    void v12[4] = __Block_byref_object_dispose__1860;
    v12[5] = "";
    memset(&v12[6], 0, 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    double v9 = __57__TIKeyboardInputManagerMecabra_characterKeysLayoutFrom___block_invoke;
    double v10 = &unk_1E6E2C768;
    double v11 = v12;
    double v6 = *(uint64_t **)(v5 + 8);
    for (uint64_t i = *(uint64_t **)(v5 + 16); v6 != i; ++v6)
      v9((uint64_t)v8, v6);
    operator new();
  }
  void *v4 = 0;
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

void __57__TIKeyboardInputManagerMecabra_characterKeysLayoutFrom___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = *(unsigned __int16 *)(*a2 + 12);
  if (!*(_WORD *)(*a2 + 12))
  {
    KB::String::compute_length((unsigned __int16 *)(v3 + 8));
    int v4 = *(unsigned __int16 *)(v3 + 12);
  }
  if (v4 == 1)
  {
    uint64_t v5 = *a2;
    uint64_t v6 = *(void *)(*a2 + 16);
    if (!v6) {
      uint64_t v6 = *a2 + 24;
    }
    uint64_t v11 = v6;
    int v12 = 0;
    int v13 = *(unsigned __int16 *)(v5 + 8);
    int v14 = 0;
    KB::String::iterator::initialize(&v11);
    unsigned __int16 v7 = v14;
    double v8 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    if ([v8 characterIsMember:v7])
    {

      goto LABEL_9;
    }
    double v9 = [MEMORY[0x1E4F28B88] zhuyinCharacterSet];
    int v10 = [v9 characterIsMember:v7];

    if (v10)
    {
LABEL_9:
      KB::String::String((KB::String *)&v11, (const KB::String *)(*a2 + 8));
      if (*(unsigned __int16 *)(*a2 + 40) >= 0xFuLL) {
        operator new[]();
      }
      operator new();
    }
  }
}

- (BOOL)needsTouchEvents
{
  return 0;
}

- (void)dropInputPrefix:(unsigned int)a3
{
  LODWORD(v3) = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager dropInputPrefix:](&v8, sel_dropInputPrefix_);
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  if ([v5 count] <= (unint64_t)v3)
  {
    uint64_t v6 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    uint64_t v3 = [v6 count];
  }
  else
  {
    uint64_t v3 = v3;
  }

  unsigned __int16 v7 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  objc_msgSend(v7, "removeObjectsInRange:", 0, v3);
}

- (void)clearInput
{
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  [v3 removeAllObjects];

  if ([(TIKeyboardInputManager *)self isTypologyEnabled])
  {
    int v4 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
    [v4 removeAllObjects];
  }
  if (![(TIKeyboardInputManagerMecabra *)self preservesComposingInput])
  {
    uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v5 removeAllInputs];
  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager_mul *)&v6 clearInput];
}

- (id)processAcceptedCandidate:(id)a3
{
  id v4 = a3;
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    goto LABEL_12;
  }
  [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v6 = [v5 hasRemainingComposingInput];

  if (!v6
    || [v4 isContinuousPathConversion]
    && ![v4 isPartialCandidate])
  {
    if (v4)
    {
      double v24 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      double v23 = [v24 asInlineText];
    }
    else
    {
      double v23 = 0;
    }
    unsigned __int16 v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v7 removeAllInputs];
    goto LABEL_20;
  }
  unsigned __int16 v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  objc_super v8 = [v7 inputs];
  if ([v8 count] == 2)
  {
    double v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    int v10 = [v9 inputs];
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      int v13 = [v12 inputs];
      int v14 = [v13 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v40 = [v4 isPartialCandidate];

        if (v40)
        {
          uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          CGFloat v16 = [v15 inputs];
          unsigned __int16 v7 = [v16 objectAtIndexedSubscript:0];

          double v17 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          double v18 = [v17 inputs];
          double v19 = [v18 objectAtIndexedSubscript:1];

          double v20 = [v19 candidateText];
          if ([v20 length])
          {
            double v21 = [v19 convertedInput];
            uint64_t v22 = [v21 length];

            if (v22)
            {
              double v23 = 0;
LABEL_47:

              goto LABEL_20;
            }
            uint64_t v26 = [v7 committedText];
            double v20 = (void *)[v26 mutableCopy];

            double v27 = [v7 syllables];
            double v28 = (void *)[v27 mutableCopy];

            if ([v20 length]
              && ([v19 candidateText],
                  id v29 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v30 = [v20 rangeOfString:v29],
                  v29,
                  v30))
            {
              uint64_t v31 = [v19 candidateText];
              double v23 = [v20 stringByAppendingString:v31];
            }
            else
            {
              double v23 = [v19 candidateText];
            }
            int v32 = [v23 length];
            if (v32 >= 1)
            {
              while ([v20 length])
              {
                objc_msgSend(v20, "deleteCharactersInRange:", 0, 1);
                BOOL v33 = __OFSUB__(v32--, 1);
                if ((v32 < 0) ^ v33 | (v32 == 0)) {
                  goto LABEL_45;
                }
              }
LABEL_40:
              if ([v28 count])
              {
                uint64_t v34 = [v28 firstObject];
                uint64_t v35 = (void *)[v34 mutableCopy];

                [v28 removeObjectAtIndex:0];
                do
                {
                  if (![v35 length])
                  {

                    goto LABEL_40;
                  }
                  objc_msgSend(v35, "deleteCharactersInRange:", 0, 1);
                  BOOL v33 = __OFSUB__(v32--, 1);
                }
                while (!((v32 < 0) ^ v33 | (v32 == 0)));
                if ([v35 length]) {
                  [v28 insertObject:v35 atIndex:0];
                }
              }
            }
LABEL_45:
            objc_super v36 = [v7 syntheticInputWithCommittedText:v20 syllables:v28];
            uint64_t v37 = [(TIKeyboardInputManagerMecabra *)self composingInput];
            [v37 removeComposingInput];

            uint64_t v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
            [v38 removeComposingInput];

            CGPoint v39 = [(TIKeyboardInputManagerMecabra *)self composingInput];
            [v39 composeNew:v36];
          }
          else
          {
            double v23 = 0;
          }

          goto LABEL_47;
        }
LABEL_12:
        double v23 = 0;
        goto LABEL_21;
      }
    }
  }

  double v23 = 0;
LABEL_20:

LABEL_21:

  return v23;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self processAcceptedCandidate:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerMecabra;
    uint64_t v5 = [(TIKeyboardInputManager *)&v8 didAcceptCandidate:v4];
  }
  int v6 = (void *)v5;

  return v6;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isResponseKitCandidate])
  {
    objc_super v8 = (void *)MEMORY[0x1E4F96290];
    uint64_t v9 = *MEMORY[0x1E4F962B0];
    int v10 = [(TIKeyboardInputManagerBase *)self inputMode];
    uint64_t v11 = [v10 normalizedIdentifier];
    int v12 = TIInputModeGetBaseLanguage();
    [v8 incrementAggdKeyForCategory:0 forAction:v9 withLanguageID:v12];

    int v13 = (void *)MEMORY[0x1E4F96290];
    int v14 = [v6 responseKitCategory];
    uint64_t v15 = [(TIKeyboardInputManagerBase *)self inputMode];
    CGFloat v16 = [v15 normalizedIdentifier];
    double v17 = TIInputModeGetBaseLanguage();
    [v13 incrementAggdKeyForCategory:v14 forAction:v9 withLanguageID:v17];
  }
  double v18 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  double v19 = [v18 handleAcceptedCandidate:v6 keyboardState:v7];

  if (!v19)
  {
    if ([v6 isAddress])
    {
      double v20 = [(TIKeyboardInputManager *)self keyboardState];
      double v21 = [v20 documentState];
      uint64_t v22 = [v21 contextBeforeInput];
      if (![v22 length])
      {
LABEL_10:

        goto LABEL_11;
      }
      double v23 = [v6 candidate];
      double v24 = [v23 _firstGrapheme];
      if ([v24 _containsCJScripts])
      {

        goto LABEL_10;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v20 = [v6 candidate];
        double v21 = [@" " stringByAppendingString:v20];
        [v6 candidateByReplacingWithCandidate:v21];
        uint64_t v22 = v6;
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
LABEL_11:
    if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]
      || ([v6 candidate],
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          uint64_t v27 = [v26 length],
          v26,
          !v27))
    {
      uint64_t v30 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v30 removeAllInputs];
LABEL_34:

      [(TIKeyboardInputManagerMecabra *)self setPreservesComposingInput:1];
      uint64_t v69 = 0;
      uint64_t v70 = &v69;
      uint64_t v71 = 0x2020000000;
      uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v52 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      id v53 = [v52 candidates];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __71__TIKeyboardInputManagerMecabra_handleAcceptedCandidate_keyboardState___block_invoke;
      v65[3] = &unk_1E6E29940;
      id v6 = v6;
      uint64_t v67 = self;
      uint64_t v68 = &v69;
      id v66 = v6;
      [v53 enumerateObjectsUsingBlock:v65];

      v64.receiver = self;
      v64.super_class = (Class)TIKeyboardInputManagerMecabra;
      double v19 = [(TIKeyboardInputManager *)&v64 handleAcceptedCandidate:v6 keyboardState:v7];
      if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
      {
        [(TIKeyboardInputManagerMecabra *)self updateComposedText];
        [(TIKeyboardInputManager *)self setMarkedText];
      }
      [(TIKeyboardInputManagerMecabra *)self setPreservesComposingInput:0];
      TIInputManager::sync_with_input_from_UI((TIInputManager *)self->super.super.m_impl);
      long long v54 = objc_msgSend(v6, "candidateByReplacingWithSourceMask:", -[TIKeyboardInputManager adjustedSourceMaskFromCandidate:](self, "adjustedSourceMaskFromCandidate:", v6));
      long long v55 = [(TIKeyboardInputManager *)self typingSessionMonitor];
      long long v56 = [(TIKeyboardInputManager *)self keyboardState];
      long long v57 = [v56 documentState];
      long long v58 = [(TIKeyboardInputManager *)self inputContext];
      long long v59 = [(TIKeyboardInputManager *)self inputStem];
      LOBYTE(v61) = 1;
      [v55 candidateAccepted:v54 withInput:0 documentState:v57 inputContext:v58 inputStem:v59 predictionBarHit:0 useCandidateSelection:v61 candidateIndex:v70[3] keyboardState:v7];

      _Block_object_dispose(&v69, 8);
      goto LABEL_37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v28 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v6];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = [MEMORY[0x1E4FAE3B8] convertedInputFromMecabraCandidate:v28];
        if (![v30 length])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v31 = [v6 input];

            uint64_t v30 = (void *)v31;
          }
          else
          {
            int v32 = [MEMORY[0x1E4FAE3B8] inputFromMecabraCandidate:v29];
            uint64_t v33 = [(TIKeyboardInputManagerMecabra *)self convertInput:v32];

            uint64_t v30 = (void *)v33;
          }
        }
      }
      else
      {
        uint64_t v30 = [v6 input];
      }
      if (v30)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:
          uint64_t v35 = [MCAcceptCandidateInput alloc];
          objc_super v36 = [v6 candidate];
          uint64_t v37 = [(MCAcceptCandidateInput *)v35 initWithCandidateText:v36 convertedInput:v30];

          uint64_t v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          CGPoint v39 = [v38 composingInput];
          objc_opt_class();
          char v40 = objc_opt_isKindOfClass();

          CGPoint v41 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          double v42 = v41;
          if (v40)
          {
            double v43 = [v41 composingInput];

            uint64_t v44 = [v43 text];
            double v42 = objc_msgSend(v43, "syntheticInputWithCursorIndex:", objc_msgSend(v44, "length"));

            objc_super v45 = [(TIKeyboardInputManagerMecabra *)self composingInput];
            [v45 replaceComposingInputWith:v42];
          }
          else
          {
            objc_super v45 = [v41 inputs];
            if ((unint64_t)[v45 count] >= 2)
            {
              uint64_t v46 = [(TIKeyboardInputManagerMecabra *)self composingInput];
              long long v63 = [v46 inputs];
              uint64_t v47 = [v63 firstObject];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(TIKeyboardInputManagerMecabra *)self composingInput];
                v49 = id v48 = v46;
                char v62 = [v49 hasDrawInput];

                if (v62)
                {
LABEL_33:
                  long long v51 = [(TIKeyboardInputManagerMecabra *)self composingInput];
                  [v51 composeNew:v37];

                  [(TIKeyboardInputManagerMecabra *)self setPreviouslyDeletedTypeInput:0];
                  [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:0];

                  goto LABEL_34;
                }
                double v42 = [(TIKeyboardInputManagerMecabra *)self composingInput];
                objc_super v45 = [v42 inputs];
                id v50 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", [v45 count]);
              }
              else
              {
              }
            }
          }

          goto LABEL_33;
        }
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v34 = [v6 input];

    uint64_t v30 = (void *)v34;
    goto LABEL_25;
  }
LABEL_37:

  return v19;
}

void __71__TIKeyboardInputManagerMecabra_handleAcceptedCandidate_keyboardState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 candidate];
  objc_super v8 = [*(id *)(a1 + 32) candidate];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = [*(id *)(a1 + 40) composingInput];
      int v11 = [v10 hasDrawInput];

      if (v11) {
        [*(id *)(a1 + 32) setContinuousPathConversion:1];
      }
    }
    *a4 = 1;
  }
}

- (unint64_t)inputIndexWithDrawInput
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    return 0;
  }
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v4 = [v3 hasKindOf:objc_opt_class()];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(TIKeyboardInputManager *)self inputString];
  id v6 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
  id v7 = [v5 stringByReplacingOccurrencesOfString:v6 withString:&stru_1F3F7A998];

  unint64_t v8 = [v7 length];
  int v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v10 = [v9 inputs];
  int v11 = [v10 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    char v13 = [v12 hasKindOf:objc_opt_class()];

    if ((v13 & 1) == 0)
    {
      id v14 = v11;
      uint64_t v15 = [v14 text];
      uint64_t v16 = [v15 length];
      uint64_t v17 = [v14 cursorIndex];

      if (v8 <= v16 - v17) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v16 - v17;
      }
      v8 -= v18;
    }
  }

  return v8;
}

- (id)syllableSeparator
{
  return (id)*MEMORY[0x1E4FAE238];
}

- (id)convertInput:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_convertInputsToSyntheticInputUptoCount:(int)a3 cursorIndex:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 integerValue];
  }
  else {
    uint64_t v8 = -1;
  }
  int v9 = [MCSyntheticInput alloc];
  int v10 = [(MCSyntheticInput *)v9 initWithCommittedText:&stru_1F3F7A998 syllables:MEMORY[0x1E4F1CBF0]];
  int v11 = objc_alloc_init(MCKeyboardInput);
  if (a3 >= 1)
  {
    do
    {
      int v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      char v13 = [v12 inputs];
      id v14 = [v13 firstObject];
      [(MCKeyboardInput *)v10 composeNew:v14];

      uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v16 = [v15 inputs];
      uint64_t v17 = [v16 firstObject];
      [(MCKeyboardInput *)v11 composeNew:v17];

      uint64_t v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v18 removeInputAtIndex:0];

      --a3;
    }
    while (a3);
  }
  double v19 = [(MCKeyboardInput *)v11 asCommittedText];
  double v20 = [(TIKeyboardInputManagerMecabra *)self uncommittedText];
  double v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [(MCKeyboardInput *)v11 asInlineText];
  }
  double v23 = v22;

  double v24 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
  uint64_t v25 = [v24 length];

  if (v25)
  {
    uint64_t v26 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
    uint64_t v27 = [v23 componentsSeparatedByString:v26];
  }
  else
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    if ([v23 length])
    {
      unint64_t v28 = 0;
      do
      {
        id v29 = objc_msgSend(v23, "substringWithRange:", v28, 1);
        [v27 addObject:v29];

        ++v28;
      }
      while ([v23 length] > v28);
    }
  }
  uint64_t v30 = [(MCSyntheticInput *)v10 initWithCommittedText:v19 syllables:v27];
  uint64_t v31 = v30;
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v32 = [(MCSyntheticInput *)v30 syntheticInputWithCursorIndex:v8];

    uint64_t v31 = (void *)v32;
  }
  uint64_t v33 = [v31 text];
  uint64_t v34 = [v33 length];

  if (v34)
  {
    uint64_t v35 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v35 insertInput:v31 atIndex:0];

    objc_super v36 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v37 = [v36 composingInput];

    if (!v37)
    {
      uint64_t v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v38 setComposingInput:v31];
    }
    id v39 = v31;
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (id)uncommittedText
{
  return 0;
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  return 0;
}

- (void)updateComposedText
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v5 = [v3 asInlineText];

    int v4 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v5];
    [(NSMutableString *)self->super.super.m_composedText setString:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerMecabra;
    [(TIKeyboardInputManager *)&v6 updateComposedText];
  }
}

- (void)savePartialGeometryData
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v3 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    int v4 = (void *)[v3 copy];
    [(TIKeyboardInputManagerMecabra *)self setClearedGeometryDataArray:v4];

    if ([(TIKeyboardInputManager *)self isTypologyEnabled])
    {
      id v6 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
      id v5 = (void *)[v6 copy];
      [(TIKeyboardInputManagerMecabra *)self setClearedTouchDataArray:v5];
    }
  }
}

- (void)padGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v6 = [(TIKeyboardInputManager *)self rawInputString];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = [(TIKeyboardInputManager *)self rawInputString];
      uint64_t v9 = [v8 length];

      int v10 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      unint64_t v11 = [v10 count];
      unint64_t v12 = v9 - 1;

      if (v11 < v9 - 1)
      {
        do
        {
          char v13 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          if (a4 - 1 >= [v13 count])
          {
            id v14 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
            -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", [v14 count]);
          }
          else
          {
            [(TIKeyboardInputManagerMecabra *)self insertDummyGeometryDataAtIndex:a4 - 1];
          }

          uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          unint64_t v16 = [v15 count];
        }
        while (v16 < v12);
      }
      if ([(TIKeyboardInputManager *)self isTypologyEnabled])
      {
        uint64_t v17 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
        unint64_t v18 = [v17 count];

        if (v18 < v12)
        {
          unint64_t v19 = a4 - 1;
          do
          {
            double v20 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
            if (v19 >= [v20 count])
            {
              double v21 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", [v21 count]);
            }
            else
            {
              [(TIKeyboardInputManagerMecabra *)self insertDummyTouchDataAtIndex:v19];
            }

            id v22 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
            unint64_t v23 = [v22 count];
          }
          while (v23 < v12);
        }
      }
    }
  }
}

- (void)restoreGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  id v34 = a3;
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v6 = [v34 string];
    unint64_t v7 = [v6 length];

    uint64_t v8 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    unint64_t v9 = [v8 count];

    if (v9 < a4)
    {
      int v10 = [(TIKeyboardInputManagerMecabra *)self clearedGeometryDataArray];

      if (v10)
      {
        unint64_t v11 = [(TIKeyboardInputManagerMecabra *)self clearedGeometryDataArray];
        unint64_t v12 = [v11 count];

        if (v12 >= v7)
        {
          char v13 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          id v14 = [(TIKeyboardInputManagerMecabra *)self clearedGeometryDataArray];
          uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self clearedGeometryDataArray];
          unint64_t v16 = objc_msgSend(v14, "subarrayWithRange:", objc_msgSend(v15, "count") - v7, v7);
          [v13 addObjectsFromArray:v16];
        }
        [(TIKeyboardInputManagerMecabra *)self setClearedGeometryDataArray:0];
      }
    }
    if ([(TIKeyboardInputManager *)self isTypologyEnabled])
    {
      uint64_t v17 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
      unint64_t v18 = [v17 count];

      if (v18 < a4)
      {
        unint64_t v19 = [(TIKeyboardInputManagerMecabra *)self clearedTouchDataArray];

        if (v19)
        {
          double v20 = [(TIKeyboardInputManagerMecabra *)self clearedTouchDataArray];
          unint64_t v21 = [v20 count];

          if (v21 >= v7)
          {
            id v22 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
            unint64_t v23 = [(TIKeyboardInputManagerMecabra *)self clearedTouchDataArray];
            double v24 = [(TIKeyboardInputManagerMecabra *)self clearedTouchDataArray];
            uint64_t v25 = objc_msgSend(v23, "subarrayWithRange:", objc_msgSend(v24, "count") - v7, v7);
            [v22 addObjectsFromArray:v25];
          }
          [(TIKeyboardInputManagerMecabra *)self setClearedTouchDataArray:0];
        }
      }
    }
    [(TIKeyboardInputManagerMecabra *)self padGeometryForInput:v34 atIndex:a4];
    uint64_t v26 = [(TIKeyboardInputManager *)self rawInputString];
    unint64_t v27 = [v26 length];

    unint64_t v28 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    unint64_t v29 = [v28 count];

    if (v29 < v27)
    {
      uint64_t v30 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      if (a4 - 1 >= [v30 count])
      {
        uint64_t v31 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
        -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", [v31 count]);
      }
      else
      {
        [(TIKeyboardInputManagerMecabra *)self insertDummyGeometryDataAtIndex:a4 - 1];
      }
    }
    if ([(TIKeyboardInputManager *)self isTypologyEnabled])
    {
      uint64_t v32 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
      unint64_t v33 = [v32 count];

      if (v33 < v27) {
        [(TIKeyboardInputManagerMecabra *)self saveTouchDataForEvent:v34 atIndex:a4 - 1];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)saveGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  v32[11] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v7 = (*(uint64_t (**)(void, void))(**((void **)self->super.super.m_impl + 23) + 240))(*((void *)self->super.super.m_impl + 23), (*((_DWORD *)self->super.super.m_impl + 24) - 1));
    if (!v7)
    {
LABEL_6:
      [(TIKeyboardInputManagerMecabra *)self restoreGeometryForInput:v6 atIndex:a4];
      goto LABEL_7;
    }
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(TIKeyboardInputManager *)self keyboardState];
    if (([v9 hardwareKeyboardMode] & 1) != 0 || objc_msgSend(v6, "isPopupVariant"))
    {

      goto LABEL_6;
    }
    int v10 = [v6 isGesture];

    if (v10) {
      goto LABEL_6;
    }
    if (s_interface_idiom_is_pad) {
      float v11 = -3.0;
    }
    else {
      float v11 = -2.0;
    }
    unint64_t v12 = [(TIKeyboardInputManagerMecabra *)self validCharacterSetForAutocorrection];
    char v13 = [(TIKeyboardInputManagerMecabra *)self validUSetForAutocorrection];
    if (*v8)
    {
      id v14 = v13;
      int v15 = 0;
      uint64_t v16 = v8[1];
      uint64_t v17 = 8 * *v8;
      while (1)
      {
        if (*(float *)(*(void *)v16 + 32) < v11) {
          goto LABEL_27;
        }
        uint64_t v18 = *(void *)(*(void *)v16 + 8);
        uint64_t v19 = *(void *)(v18 + 16);
        if (!v19) {
          uint64_t v19 = v18 + 24;
        }
        uint64_t v28 = v19;
        int v20 = *(unsigned __int16 *)(v18 + 8);
        int v29 = 0;
        int v30 = v20;
        unsigned int v31 = 0;
        KB::String::iterator::initialize(&v28);
        uint64_t v21 = v31;
        if ([v12 characterIsMember:(unsigned __int16)v31])
        {
          if ((_WORD)v21) {
            goto LABEL_23;
          }
        }
        else if (v14)
        {
          int v22 = MEMORY[0x1E4E7CD40](v14, v21);
          if ((_WORD)v21)
          {
            if (v22)
            {
LABEL_23:
              unint64_t v23 = &v32[v15];
              *(_WORD *)unint64_t v23 = v21;
              *((_DWORD *)v23 + 1) = *(_DWORD *)(*(void *)v16 + 32);
              if (++v15 == 10) {
                goto LABEL_27;
              }
            }
          }
        }
        v16 += 8;
        v17 -= 8;
        if (!v17) {
          goto LABEL_27;
        }
      }
    }
    int v15 = 0;
LABEL_27:
    double v24 = &v32[v15];
    *(_WORD *)double v24 = 0;
    *((_DWORD *)v24 + 1) = 0;
    [(TIKeyboardInputManagerMecabra *)self padGeometryForInput:v6 atIndex:a4];
    uint64_t v25 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v32 length:8 * (v15 + 1)];
    unint64_t v27 = a4 - 1;
    [v25 insertObject:v26 atIndex:v27];

    if ([(TIKeyboardInputManager *)self isTypologyEnabled]) {
      [(TIKeyboardInputManagerMecabra *)self saveTouchDataForEvent:v6 atIndex:v27];
    }
  }
LABEL_7:
}

- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v8 keyLayoutWillChangeTo:v6 from:a4];
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput]
    && ![(TIKeyboardInputManagerMecabra *)self shouldRescaleTouchPoints])
  {
    uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    [v7 setKeyboardLayout:v6];
  }
}

- (USet)validUSetForAutocorrection
{
  return 0;
}

- (NSCharacterSet)validCharacterSetForSegmentation
{
  return (NSCharacterSet *)[MEMORY[0x1E4F28B88] pinyinInputCharacterSet];
}

- (NSCharacterSet)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_95);
  }
  double v2 = (void *)-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__validCharSet;

  return (NSCharacterSet *)v2;
}

uint64_t __67__TIKeyboardInputManagerMecabra_validCharacterSetForAutocorrection__block_invoke()
{
  -[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__validCharSet = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 97, 26);

  return MEMORY[0x1F41817F8]();
}

- (_NSRange)analysisStringRange
{
  double v2 = [(TIKeyboardInputManager *)self rawInputString];
  uint64_t v3 = [v2 length];

  NSUInteger v4 = 0;
  NSUInteger v5 = v3;
  result.NSUInteger length = v5;
  result.id location = v4;
  return result;
}

- (id)geometryModelData
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self analysisStringRange];
    uint64_t v6 = v5;
    uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
    unint64_t v8 = [v7 count];

    uint64_t v3 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL && v6 && v4 < v8 && v4 + v6 <= v8)
    {
      unint64_t v9 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      uint64_t v3 = objc_msgSend(v9, "subarrayWithRange:", v4, v6);
    }
  }

  return v3;
}

- (NSMutableArray)geometryDataArray
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v3 = 0;
  }
  else
  {
    composingKeyboardInputManager = self->_composingKeyboardInputManager;
    if (!composingKeyboardInputManager)
    {
      uint64_t v5 = (TIKeyboardInputManagerMecabra *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = self->_composingKeyboardInputManager;
      self->_composingKeyboardInputManager = v5;

      composingKeyboardInputManager = self->_composingKeyboardInputManager;
    }
    uint64_t v3 = composingKeyboardInputManager;
  }

  return (NSMutableArray *)v3;
}

- (NSMutableArray)touchDataArray
{
  composingInput = self->_composingInput;
  if (!composingInput)
  {
    unint64_t v4 = (MCKeyboardInput *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_composingInput;
    self->_composingInput = v4;

    composingInput = self->_composingInput;
  }

  return (NSMutableArray *)composingInput;
}

- (__Mecabra)mecabra
{
  double v2 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
  uint64_t v3 = (__Mecabra *)[v2 mecabra];

  return v3;
}

- (unint64_t)autoquoteType
{
  return 1;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    return 1;
  }
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  if ([v3 hasDrawInput])
  {
    unint64_t v4 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v5 = [v4 inputForMarkedText];
    BOOL v6 = [v5 length] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)shouldDelayUpdateComposedText
{
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self usesComposingInput];
  if (v3)
  {
    unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    char v5 = [v4 hasDrawInput];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isProgressivelyPathing
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    return 0;
  }
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  unint64_t v4 = [v3 composingInput];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isDrawing];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)usesComposingInput
{
  return 0;
}

- (BOOL)usesContinuousPath
{
  BOOL v3 = [(TIKeyboardInputManager *)self config];
  if ([v3 usesContinuousPath]) {
    BOOL v4 = [(TIKeyboardInputManagerMecabra *)self usesComposingInput];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (MCKeyboardInput)composingInput
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    m_ptr = self->_baseCharacterKeysLayout.m_ptr;
  }
  else {
    m_ptr = 0;
  }

  return (MCKeyboardInput *)m_ptr;
}

- (BOOL)usesFavonius
{
  return 0;
}

- (void)setKeyboardState:(id)a3
{
  id v4 = a3;
  char v5 = [(TIKeyboardInputManager *)self keyboardState];
  int v6 = [v5 canSuggestSupplementalItemsForCurrentSelection];

  int v7 = [v4 canSuggestSupplementalItemsForCurrentSelection];
  if (v6 != v7)
  {
    char v8 = v7;
    unint64_t v9 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    int v10 = [v9 mecabraEnvironment];

    float v11 = [(TIKeyboardInputManagerMecabra *)self wordSearch];
    unint64_t v12 = (void *)MEMORY[0x1E4F28B48];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__TIKeyboardInputManagerMecabra_setKeyboardState___block_invoke;
    v16[3] = &unk_1E6E2B6E0;
    id v17 = v10;
    char v18 = v8;
    id v13 = v10;
    id v14 = [v12 blockOperationWithBlock:v16];
    [v11 performOperationAsync:v14];
  }
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v15 setKeyboardState:v4];
}

uint64_t __50__TIKeyboardInputManagerMecabra_setKeyboardState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) canSuggestSupplementalItemsFlagDidChangeTo:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v4 dealloc];
}

- (TIKeyboardInputManagerMecabra)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  objc_super v4 = [(TIKeyboardInputManager_mul *)&v15 initWithConfig:a3 keyboardState:a4];
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_handlePerformBackgroundMaintenanceNotification name:@"TILanguageModelPerformBackgroundMaintenanceNotification" object:0];

    int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    touchUpEvents = v4->_touchUpEvents;
    v4->_touchUpEvents = v6;

    char v8 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    Class isa = v4[1].super.super.super.super.isa;
    v4[1].super.super.super.super.Class isa = v8;

    cancelledDrawInput = v4->_cancelledDrawInput;
    v4->_cancelledDrawInput = (MCDrawInput *)&stru_1F3F7A998;

    currentRecipientIdentifier = v4->_currentRecipientIdentifier;
    v4->_currentRecipientIdentifier = (NSString *)&stru_1F3F7A998;

    uint64_t v12 = objc_opt_new();
    m_ptr = v4->_baseCharacterKeysLayout.m_ptr;
    v4->_baseCharacterKeysLayout.m_ptr = (KeyboardLayout *)v12;
  }
  return v4;
}

+ (Class)wordSearchClass
{
  return 0;
}

+ (id)initializedClients
{
  if (+[TIKeyboardInputManagerMecabra initializedClients]::onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerMecabra initializedClients]::onceToken, &__block_literal_global_212);
  }
  double v2 = (void *)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients;

  return v2;
}

void __51__TIKeyboardInputManagerMecabra_initializedClients__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  uint64_t v1 = (void *)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients;
  +[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients = v0;

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v2 = [MEMORY[0x1E4F28F08] mainQueue];
  id v3 = (id)[v4 addObserverForName:@"TIKeyboardInputManagerDynamicDictionariesRemovedNotification" object:0 queue:v2 usingBlock:&__block_literal_global_217];
}

uint64_t __51__TIKeyboardInputManagerMecabra_initializedClients__block_invoke_2()
{
  return [(id)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients removeAllObjects];
}

+ (id)offlineLearningHandleForInputMode:(id)a3
{
  id v3 = a3;
  id v4 = [[TILanguageModelOfflineLearningHandleMecabra alloc] initWithInputMode:v3];

  [(TILanguageModelOfflineLearningHandle *)v4 setValid:1];

  return v4;
}

+ (id)dummyTouchData
{
  return &unk_1F3FA7700;
}

+ (id)dummyGeometryData
{
  if (+[TIKeyboardInputManagerMecabra dummyGeometryData]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerMecabra dummyGeometryData]::__onceToken, &__block_literal_global_198);
  }
  double v2 = (void *)+[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData;

  return v2;
}

void __50__TIKeyboardInputManagerMecabra_dummyGeometryData__block_invoke()
{
  v2[0] = 0;
  int v3 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v2 length:8];
  uint64_t v1 = (void *)+[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData;
  +[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData = v0;
}

+ (void)removeDynamicDictionaryForInputMode:(id)a3
{
  id v9 = +[TIInputMode inputModeWithIdentifier:a3];
  int v3 = +[TIWordSearchController sharedWordSearchController];
  id v4 = [v3 wordSearchForInputMode:v9];

  char v5 = +[TIWordSearch sharedOperationQueue];
  int v6 = [TIWordSearchOperationResetLearningDictionaries alloc];
  int v7 = [v4 mecabraWrapper];
  char v8 = [(TIWordSearchOperationResetLearningDictionaries *)v6 initWithMecabraWrapper:v7];
  [v5 addOperation:v8];
}

- (void)tearDown
{
  int v3 = +[TIWordSearch sharedOperationQueue];
  [v3 waitUntilAllOperationsAreFinished];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerMecabra;
  [(TIKeyboardInputManager *)&v4 tearDown];
}

- (void)cancelComposition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)char v5 = 136315394;
    *(void *)&void v5[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) cancelComposition]";
    *(_WORD *)&v5[12] = 2112;
    *(void *)&v5[14] = objc_opt_class();
    id v4 = *(id *)&v5[14];
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  %@ was canceled", v5, 0x16u);
  }
  int v3 = [(TIKeyboardInputManagerMecabra *)self compositionCompletionHandler];

  if (v3) {
    [(TIKeyboardInputManagerMecabra *)self _completeComposition:0];
  }
}

- (void)completeComposition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)char v5 = 136315394;
    *(void *)&void v5[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) completeComposition]";
    *(_WORD *)&v5[12] = 2112;
    *(void *)&v5[14] = objc_opt_class();
    id v4 = *(id *)&v5[14];
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  %@ was completed", v5, 0x16u);
  }
  int v3 = [(TIKeyboardInputManagerMecabra *)self compositionCompletionHandler];

  if (v3) {
    [(TIKeyboardInputManagerMecabra *)self _completeComposition:1];
  }
}

- (void)_completeComposition:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(TIKeyboardInputManagerMecabra *)self compositionCompletionHandler];

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardInputManagerMecabra *)self compositionCompletionHandler];
    v6[2](v6, v3);

    [(TIKeyboardInputManagerMecabra *)self setCompositionCompletionHandler:0];
  }
}

- (void)composeTextWith:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    *(_DWORD *)id location = 136315650;
    *(void *)&location[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) composeTextWith:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = (id)objc_opt_class();
    id v8 = v15;
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  %@ invokes %@", location, 0x20u);
  }
  [(TIKeyboardInputManagerMecabra *)self setComposingKeyboardInputManager:v4];
  objc_initWeak((id *)location, self);
  char v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__TIKeyboardInputManagerMecabra_StackableInputManager__composeTextWith___block_invoke;
  v9[3] = &unk_1E6E29B68;
  objc_copyWeak(&v10, (id *)location);
  [v5 composeText:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)location);
}

void __72__TIKeyboardInputManagerMecabra_StackableInputManager__composeTextWith___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2) {
    [WeakRetained commitComposition];
  }
  else {
    [WeakRetained abortComposition];
  }
}

- (void)abortComposition
{
}

- (void)commitComposition
{
}

- (TIKeyboardInputManagerMecabra)initWithKeyboardInputManagerToChain:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(TIKeyboardInputManager *)self initWithInputMode:0 keyboardState:0];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_geometryDataArray, a3);
  }

  return v7;
}

+ (id)inputMethodWithChainedKeyboardInputManager:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithKeyboardInputManagerToChain:v4];

  return v5;
}

@end