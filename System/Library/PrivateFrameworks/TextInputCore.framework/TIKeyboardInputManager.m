@interface TIKeyboardInputManager
+ (id)dynamicDictionaryFilePathForInputMode:(id)a3;
+ (id)keyboardUserDirectory;
+ (id)offlineLearningHandleForInputMode:(id)a3;
+ (id)recentsFilePathForIdentifier:(id)a3;
+ (id)userDictionaryWordKeyPairsFilePath;
+ (id)vulgarWordUsageDatabaseFileName;
+ (int)shiftContextForShiftState:(int)a3 autocapitalizationType:(unint64_t)a4;
+ (void)clearRecentsFileForIdentifier:(id)a3;
+ (void)removeAllDynamicDictionaries;
+ (void)removeDynamicDictionaryForInputMode:(id)a3;
+ (void)resetResponseKit;
- ($71865D49803C3560DF570D424868A38C)lexiconInfoForInputMode:(SEL)a3;
- ($71865D49803C3560DF570D424868A38C)lexiconInfoForMultilingualDynamic:(SEL)a3;
- ($71865D49803C3560DF570D424868A38C)lexiconInformation;
- (BOOL)_canStartSentenceAfterString:(id)a3 maxRecursionDepth:(unint64_t)a4;
- (BOOL)_canSuggestPhraseCandidate:(void *)a3 withStem:;
- (BOOL)_hasSupplementalPrefix;
- (BOOL)acceptAutocorrectionCommitsInline;
- (BOOL)acceptInputString:(id)a3;
- (BOOL)acceptsCharacter:(unsigned int)a3;
- (BOOL)acceptsRange:(_NSRange)a3 inString:(id)a4;
- (BOOL)allowsAutocorrectionForCurrentInputString;
- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3;
- (BOOL)autocorrectionWasRecentlyRejected:(id)a3;
- (BOOL)autocorrectionWasRecentlyRejectedForCurrentInput;
- (BOOL)blockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5;
- (BOOL)canComputeSentenceContextForInputStem:(id)a3;
- (BOOL)canGenerateCompletionCandidates;
- (BOOL)canHandleKeyHitTest;
- (BOOL)canRetrocorrectInputAtIndex:(unsigned int)a3;
- (BOOL)canStartSentenceAfterString:(id)a3;
- (BOOL)canTrimInputAtIndex:(unsigned int)a3;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3 forced:(BOOL)a4;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (BOOL)dictionaryContainsWord:(id)a3;
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)directlyBlockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5 retrocorrectionComponent:(BOOL)a6;
- (BOOL)doesComposeText;
- (BOOL)doesSelectedTextGenerateEmojiCandidates;
- (BOOL)enablesProactiveQuickType;
- (BOOL)generateAutofillFormWithKeyboardState:(id)a3 completionHandler:(id)a4;
- (BOOL)hasLegacyInputStem;
- (BOOL)hasLegacyInputString;
- (BOOL)ignoresDeadKeys;
- (BOOL)inHardwareKeyboardMode;
- (BOOL)isContinuousPathCandidate:(id)a3 replacementForOriginalConversion:(id)a4;
- (BOOL)isEditingExistingWord;
- (BOOL)isEditingWordPrefix;
- (BOOL)isHardwareKeyboardAutocorrectionEnabled;
- (BOOL)isHighMemoryManager;
- (BOOL)isLinguisticResourceUpdateScheduled;
- (BOOL)isProgressivelyPathing;
- (BOOL)isStickerSuggestionsEnabled;
- (BOOL)isStringBasedModel;
- (BOOL)isTransliterationManager;
- (BOOL)isTypologyEnabled;
- (BOOL)isWordLearningEnabled;
- (BOOL)keyboardConfigurationAssertDefaultKeyPlane;
- (BOOL)newInputAcceptsUserSelectedCandidate;
- (BOOL)nextInputWouldStartSentence;
- (BOOL)nextInputWouldStartSentenceAfterInput:(id)a3;
- (BOOL)removeSuffixOfInputContext:(id)a3;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldAllowContextWord:(id)a3;
- (BOOL)shouldAllowCorrectionOfAcceptedCandidate:(id)a3;
- (BOOL)shouldAutocapitalizePredictionAfterSpace;
- (BOOL)shouldBlockAutocorrection:(id)a3;
- (BOOL)shouldClearInputOnMarkedTextOutOfSync;
- (BOOL)shouldCommitInputString;
- (BOOL)shouldDelayUpdateComposedText;
- (BOOL)shouldDropInputStem;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldFixupIncompleteRomaji;
- (BOOL)shouldGenerateInlineCompletions;
- (BOOL)shouldGeneratePredictionsForCurrentContext;
- (BOOL)shouldGenerateSuggestionsForSelectedText;
- (BOOL)shouldInsertSpaceBeforeInput:(id)a3;
- (BOOL)shouldInsertSpaceBeforePredictions;
- (BOOL)shouldLearnWord:(id)a3;
- (BOOL)shouldMonitorTypingSession;
- (BOOL)shouldOfferStickers;
- (BOOL)shouldOmitEmojiCandidates;
- (BOOL)shouldPromoteAutocorrectionsToInlineCompletions:(id)a3;
- (BOOL)shouldPromoteInlineCompletionsToAutocorrections:(id)a3 inlineCompletions:(id)a4;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)shouldSkipShortcutConversionForDocumentState:(id)a3;
- (BOOL)shouldSuppressLanguageSelectionEvidence;
- (BOOL)shouldSuppressTokenIDLookups;
- (BOOL)shouldUpdateDictionary;
- (BOOL)shouldUpdateLanguageModel;
- (BOOL)spaceAndNextInputWouldStartSentence;
- (BOOL)stringEndsWithClosingQuote:(id)a3;
- (BOOL)stringEndsWord:(id)a3;
- (BOOL)suggestionBlocklistMatchesStrings:(id)a3;
- (BOOL)suppliesCompletions;
- (BOOL)supportsLearning;
- (BOOL)supportsNumberKeySelection;
- (BOOL)supportsReversionUI;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)supportsShortcutConversion;
- (BOOL)suppressCompletionsForFieldEditor;
- (BOOL)suppressPlaceholderCandidate;
- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (BOOL)updateAdaptationContextToKeyboardState:(id)a3 from:(id)a4;
- (BOOL)updateLanguageModelForKeyboardState;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (BOOL)usesContinuousPath;
- (BOOL)usesFavonius;
- (BOOL)usesLiveConversion;
- (BOOL)usesMLTapTyping;
- (BOOL)usesPunctuationKeysForRowNavigation;
- (BOOL)usesRetrocorrection;
- (LanguageModelContext)sentenceContextForInputStem:(SEL)a3 inputContext:(id)a4;
- (NSArray)languageModelAssets;
- (NSCharacterSet)allowPredictionCharacterSet;
- (NSMutableArray)candidateHandlerForOpenRequestStack;
- (NSMutableSet)rejectedConversionsForCurrentContinuousPath;
- (NSString)lastInputString;
- (RefPtr<KB::DictionaryContainer>)getDictionary;
- (TIAutocorrectionList)lastAutocorrectionList;
- (TIAutocorrectionList)lastContinuousPathAutocorrection;
- (TIAutocorrectionList)pregeneratedTypingAutocorrections;
- (TIAutoshiftRegularExpressionLoader)autoshiftRegexLoader;
- (TICandidateHandler)candidateHandlerForOpenRequest;
- (TICounterChangeCache)counterChangeCache;
- (TIEmojiCandidateGenerator)emojiCandidateGenerator;
- (TIFilterParameterLoader)filterParameterLoader;
- (TIInlineCompletionAnalyticsMetadata)inlineCompletionMetadataFrom:(SEL)a3 andBundleId:(id)a4;
- (TIKeyboardCandidate)hitTestCorrectedInputMatchingCandidate;
- (TIKeyboardCandidate)lastAcceptedText;
- (TIKeyboardFeatureSpecialization)keyboardFeatureSpecialization;
- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4 languageSelectionController:(id)a5;
- (TIKeyboardInputManager)initWithInputMode:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInputManagerConfig)config;
- (TIKeyboardInputManagerState)currentState;
- (TIKeyboardLayout)keyLayout;
- (TIKeyboardState)keyboardState;
- (TIKeyboardTouchEvent)previousTouchEvent;
- (TILRUDictionary)autocorrectionForCurrentStem;
- (TILRUDictionary)autocorrectionHistory;
- (TILRUDictionary)autocorrectionListsForWordsInDocument;
- (TILRUDictionary)autocorrectionListsSuggestedForCurrentInput;
- (TILRUDictionary)recentAutocorrections;
- (TILRUDictionary)recentPredictiveInputSelections;
- (TILRUDictionary)rejectedAutocorrections;
- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInserted;
- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInsertedInverse;
- (TILanguageSelectionController)languageSelectionController;
- (TIRevisionHistory)revisionHistory;
- (TISmartPunctuationOptions)smartOptions;
- (TISmartSelector)smartSelector;
- (TIStickerCandidateGenerator)stickerCandidateGenerator;
- (TISupplementalLexiconController)currentCandidateGenerationContextSupplementalLexicons;
- (TITextCheckerExemptions)textCheckerExemptions;
- (TITokenID)addWord:(id)a3 contextTokens:(id)a4 surfaceFormPtr:(id *)a5;
- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5;
- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5 surfaceFormPtr:(id *)a6 hasCaseInsensitiveStaticVariant:(BOOL *)a7;
- (TITypingSessionMonitor)typingSessionMonitor;
- (_NSRange)acceptableRangeFromRange:(_NSRange)a3 inText:(id)a4 withSelectionLocation:(unint64_t)a5;
- (_NSRange)candidateRange;
- (_NSRange)inputStringRangeFromRevisionHistory;
- (_NSRange)legacyInputRangeForTokenRange:(_NSRange)a3;
- (_NSRange)rangeOfUnclosedQuoteMatchingQuote:(id)a3 inString:(id)a4 range:(_NSRange)a5;
- (_NSRange)shortcutSearchRangeForString:(id)a3;
- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7;
- (const)precomposedCharacterSet;
- (double)continuousPathLanguageWeight;
- (float)scoreCandidates:;
- (id).cxx_construct;
- (id)_supplementalCompletionCandidates:(unint64_t)a3;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)autocorrection;
- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5;
- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5 insertingSpace:(BOOL)a6 sharedPrefixLength:(unint64_t)a7;
- (id)autocorrectionCandidates;
- (id)autocorrectionList;
- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3;
- (id)autocorrectionListForSelectedText;
- (id)autocorrectionListWithCandidateCount:(unint64_t)a3;
- (id)autocorrectionRecordForWord:(id)a3;
- (id)cachedAutocorrectionListResponseFor:(id)a3;
- (id)candidateResultSet;
- (id)candidateResultSetFromCandidates:(id)a3;
- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4;
- (id)candidates;
- (id)candidatesForString:(id)a3;
- (id)cannedResponseCandidatesForString:(id)a3;
- (id)checkRejectionHistory:(id)a3;
- (id)closingQuotes;
- (id)completionCandidates:(unint64_t)a3;
- (id)configurationPropertyList;
- (id)contextBeforeWithDesiredLength:(unint64_t)a3;
- (id)contextualDisplayKeys;
- (id)continuousPathCandidates:(unint64_t)a3;
- (id)currentInputModeIdentifier;
- (id)currentWordStem;
- (id)defaultCandidate;
- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)deletedSuffixOfInputContext:(id)a3 whenDeletingFromInputString:(id)a4 withInputIndex:(unint64_t)a5 deletionCount:(unint64_t)a6;
- (id)deltaDictionaryPathForInputMode:(id)a3;
- (id)dictionaryInputMode;
- (id)dictionaryStringForExternalString:(id)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)dynamicDictionaryPathForInputMode:(id)a3;
- (id)dynamicResourcePath;
- (id)extendedAutocorrection:(id)a3 spanningInputsForCandidates:(id)a4 emojis:(id)a5;
- (id)externalStringForDictionaryString:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)filterDuplicatePredictions:(id)a3 autocorrection:(id)a4;
- (id)finishGeneratingInlineCompletions:(id)a3 completion:(id)a4 syncResponse:(BOOL)a5;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5;
- (id)generateCellularCandidatesWithKeyboardState:(id)a3;
- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4;
- (id)generateOneTimeCodeCandidatesWithKeyboardState:(id)a3;
- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4;
- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3;
- (id)getTestingStateObject;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)humanReadableTrace;
- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4;
- (id)indexesOfDuplicatesInCandidates:(id)a3;
- (id)inlineCompletions:(CandidateCollection *)a3 matchedStem:(String *)a4;
- (id)inputContext;
- (id)inputStem;
- (id)inputString;
- (id)inputStringFromDocumentState:(id)a3;
- (id)inputsToReject;
- (id)internalInputContext;
- (id)internalStringToExternal:(id)a3;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)keyboardConfiguration;
- (id)keyboardConfigurationAccentKeyString;
- (id)keyboardConfigurationLayoutTag;
- (id)languageModelAssetsForInputMode:(id)a3;
- (id)layoutTagsForLayout:(id)a3;
- (id)lexiconLocales;
- (id)linguisticContext;
- (id)markedText;
- (id)newInputManagerState;
- (id)newKeyboardContext;
- (id)nonstopPunctuationCharacters;
- (id)openingQuotes;
- (id)originatingAutocorrectionListForCandidate:(id)a3;
- (id)pathToDeltaStaticDictionary;
- (id)pathToDynamicDictionary;
- (id)pathToPhraseDictionary;
- (id)pathToStaticDictionary;
- (id)phraseCandidateCompletedByWord:(const String *)a3 allowNoSuggest:(BOOL)a4 forAutocorrection:(BOOL)a5 shiftContext:(int)a6;
- (id)phraseDictionaryPathForInputMode:(id)a3;
- (id)predictionCandidates:(unint64_t)a3 predictionType:(int)a4;
- (id)proactiveSuggestionsGenerationBlock;
- (id)promoteAutocorrectionsToInlineCompletions:(id)a3 matchedStem:(String *)a4;
- (id)remainingInput;
- (id)replacementForDoubleSpace;
- (id)resourceInputModes;
- (id)revisionListFromAutocorrectionList:(id)a3 afterAcceptingCandidate:(id)a4;
- (id)searchStringForMarkedText;
- (id)sentenceDelimitingCharacters;
- (id)sentencePrefixingCharacters;
- (id)sentenceTrailingCharacters;
- (id)shadowTyping;
- (id)shortcutCompletionsForDocumentState:(id)a3;
- (id)shortcutConversionForDocumentState:(id)a3;
- (id)shortcutConversionForInput:(id)a3 andExistingString:(id)a4 existingStringStartsInMiddleOfWord:(BOOL)a5;
- (id)shortcutConversionForString:(id)a3 stringStartsInMiddleOfWord:(BOOL)a4;
- (id)sortMethodIndexes;
- (id)sortMethodTitles;
- (id)sortMethodsGroupsForCandidates:(id)a3;
- (id)sortMethodsShowExtensionCandidates;
- (id)sortingMethods;
- (id)spaceDeletingCharacters;
- (id)staticDictionaryPathForInputMode:(id)a3;
- (id)suffixOfDesiredString:(id)a3 toAppendToInputString:(id)a4 withInputIndex:(unint64_t)a5 afterDeletionCount:(unint64_t *)a6;
- (id)supplementalAutocorrection;
- (id)supplementalAutocorrectionCandidates;
- (id)supplementalLexiconWordExtraCharacters;
- (id)terminatorsDeletingAutospace;
- (id)terminatorsPrecedingAutospace;
- (id)terminatorsPreventingAutocorrection;
- (id)testingParameters;
- (id)titleForSortingMethod:(id)a3;
- (id)trialParameters;
- (id)trimmedInputStem;
- (id)trimmedInputStemAfterLathamConversion;
- (id)typedStringForEmptyAutocorrection;
- (id)usageTrackingKeyForStatistic:(id)a3;
- (id)wordCharacters;
- (id)wordInInputStem:(id)a3 atIndex:(unint64_t)a4;
- (id)wordSeparator;
- (int)TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:(id)a3;
- (int)precisionPointFromTrialOverride:(id)a3;
- (int)shiftContext;
- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4;
- (int64_t)deleteKeyCount;
- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (int64_t)userInterfaceIdiom;
- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel;
- (shared_ptr<KB::LanguageModel>)loadedLightweightLanguageModel;
- (unint64_t)autoquoteType;
- (unint64_t)countOfWordsIninputStem:(id)a3;
- (unint64_t)initialCandidateBatchCount;
- (unint64_t)initialSelectedIndex;
- (unint64_t)internalIndexOfInputStemSuffix:(id)a3;
- (unint64_t)lastNumCandidatesRequest;
- (unint64_t)linguisticResourceStatus;
- (unint64_t)maxPriorWordTokensAfterTrimming;
- (unint64_t)maximumShortcutLengthAllowed;
- (unint64_t)phraseBoundary;
- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4;
- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4 useCandidateLength:(BOOL)a5;
- (unint64_t)shouldSuppressLearning;
- (unint64_t)userFrequencyOfWord:(id)a3;
- (unint64_t)userFrequencyOfWord:(id)a3 lexiconID:(unsigned int)a4;
- (unsigned)adjustedSourceMaskFromCandidate:(id)a3;
- (unsigned)externalIndexToInternal:(unsigned int)a3;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (unsigned)internalIndexToExternal:(unsigned int)a3;
- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3;
- (unsigned)predominantLexiconInContext;
- (unsigned)simulateAutoshiftIfNecessaryForFlags:(unsigned int)a3;
- (unsigned)sourceMaskForWord:(Word *)a3;
- (unsigned)sourceMaskForWordString:(String *)a3 caseSensitive:(BOOL)a4;
- (unsigned)supplementalPrefix;
- (vector<std::string,)multilingualLocalesOnDisk;
- (void)_recalcSupplementalPrefix;
- (void)acceptCurrentCandidateIfSelectedWithContext:(id)a3;
- (void)acceptCurrentCandidateWithContext:(id)a3;
- (void)acceptInput;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)addItemToConversationHistoryWithText:(id)a3 timestamp:(id)a4 senderID:(id)a5 recipientIdentifiers:(id)a6;
- (void)addMultilingualLexiconsFromDiskToVector:(void *)a3 excluding:(const void *)a4;
- (void)addSynthesizedTouchToInput:(id)a3 keyboardState:(id)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)candidateRejected:(id)a3;
- (void)candidatesOfferedFeedback:(id)a3 keyboardState:(id)a4;
- (void)changingContextWithTrigger:(id)a3;
- (void)checkAndUpdateAdditionalLexicons;
- (void)checkAutocorrectionDictionaries;
- (void)clearHumanReadableTrace;
- (void)clearInput;
- (void)clearSoftLearning;
- (void)continuousPathCandidateRejected:(id)a3;
- (void)dealloc;
- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6;
- (void)decrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5;
- (void)deleteFromInputWithContext:(id)a3;
- (void)didUpdateInputModes:(id)a3;
- (void)displayedCandidateRejected;
- (void)dropInput;
- (void)dropInputPrefix:(unsigned int)a3;
- (void)dynamicDictionariesRemoved:(id)a3;
- (void)dynamicResourceDirectorySet:(id)a3;
- (void)endTypingSessionWithInteractionObservers:(id)a3;
- (void)enumerateWordSuffixesOfString:(id)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)fetchAssetAvailabilityStatusForInputMode:(id)a3 completionHandler:(id)a4;
- (void)fetchTypingSessionParams:(id)a3;
- (void)fillReversedConversationHistoryInContext:(id)a3;
- (void)finishGeneratingAutocorrectionsWithCandidates:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)finishGeneratingCandidates;
- (void)finishGeneratingResponseKitProactiveSuggestions:(id)a3 candidateRange:(_NSRange)a4 completion:(id)a5;
- (void)forceInstallTypologyTraceLogger;
- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5 async:(BOOL)a6 completionHandler:(id)a7;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)generateCannedResponseCandidatesAsyncForString:(id)a3 completionHandler:(id)a4;
- (void)handleTrialParametersUpdateCallback;
- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7;
- (void)incrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 saveToDifferentialPrivacy:(int)a6;
- (void)incrementUsageTrackingKey:(id)a3;
- (void)incrementUsageTrackingKeyForAppWithIsSentence:(BOOL)a3;
- (void)incrementUsageTrackingKeyForAutocorrectionStatistic:(id)a3 autocorrectionTypes:(unsigned int)a4;
- (void)incrementUsageTrackingKeysForDeleteFromInput;
- (void)initImplementation;
- (void)installTypologyTraceLogger;
- (void)learnRecentMessageUserIsRespondingTo;
- (void)loadDictionaries;
- (void)loadFavoniusTypingModel;
- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4;
- (void)logInlineCompletionsToTypology:(id)a3 candidate:(id)a4;
- (void)logTestingParametersToTypology;
- (void)logToTypologyRecorderWithString:(id)a3;
- (void)mobileAssetsChanged:(id)a3;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)parseRecentMessage:(void *)a3;
- (void)popCandidateGenerationContextFromStack;
- (void)prepareForKeyboardActivity;
- (void)prepareForKeyboardInactivity:(int)a3;
- (void)promoteInlineCompletionToAutocorrections:(id)a3 predictions:(id)a4 inlineCompletion:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledPredictions:(id *)a7 matchedStem:(String *)a8;
- (void)pushCandidateGenerationContextOnStack;
- (void)pushCandidateGenerationContextWithResults:(id)a3;
- (void)reconcileCandidates:(void *)a3 forTypedString:(String *)a4 withPhraseCandidate:(void *)a5 replacing:(const String *)a6;
- (void)reconcileConversions:(id)a3;
- (void)reconcileInlineCompletionAndAutocorrections:(id)a3 inlineCompletions:(id)a4 predictions:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledInlineCompletions:(id *)a7 outReconciledPredictions:(id *)a8 matchedStem:(String *)a9;
- (void)recordAcceptedAutocorrection:(id)a3 fromPredictiveInputBar:(BOOL)a4;
- (void)recordRejectedAutocorrectionForAcceptedText:(id)a3 fromPredictiveInputBar:(BOOL)a4;
- (void)recordSuggestedAutocorrectionList:(id)a3;
- (void)refreshInputManagerState;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6;
- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7;
- (void)registerNegativeEvidence:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 intended:(id)a6 intendedTokenID:(TITokenID)a7 hint:(int)a8;
- (void)registerRevisionFrom:(id)a3 to:(id)a4 contextTokens:(id)a5;
- (void)rejectionsDatabase;
- (void)releaseAndRemoveRejectionsDatabase;
- (void)releaseDynamicLanguageModel;
- (void)releaseMRLBuffers;
- (void)removeDynamicResourceDirectory;
- (void)resetConversationHistory;
- (void)resetLMCache:(int)a3;
- (void)resume;
- (void)runMaintenanceTask;
- (void)scheduleLinguisticResourceUpdate;
- (void)scheduleLinguisticResourceUpdateWithReason:(id)a3;
- (void)scoreCandidates:;
- (void)scoreCandidates:(void *)a3;
- (void)setAutocorrectionForCurrentStem:(id)a3;
- (void)setAutoshiftFromInputContext;
- (void)setAutoshiftRegexLoader:(id)a3;
- (void)setCandidateHandlerForOpenRequest:(id)a3;
- (void)setCandidateHandlerForOpenRequestStack:(id)a3;
- (void)setCandidateRange:(_NSRange)a3;
- (void)setCounterChangeCache:(id)a3;
- (void)setDeleteKeyCount:(int64_t)a3;
- (void)setDynamicResourceDirectory:(id)a3;
- (void)setHitTestCorrectedInputMatchingCandidate:(id)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInput:(id)a3 withIndex:(unsigned int)a4;
- (void)setInputIndex:(unsigned int)a3;
- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4;
- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4 didDeleteLastAcceptedPath:(BOOL)a5;
- (void)setIsEditingWordPrefix:(BOOL)a3;
- (void)setKeyLayout:(id)a3;
- (void)setKeyboardEventsLagging:(BOOL)a3;
- (void)setKeyboardState:(id)a3;
- (void)setLastAcceptedText:(id)a3;
- (void)setLastAutocorrectionList:(id)a3;
- (void)setLastContinuousPathAutocorrection:(id)a3;
- (void)setLastInputString:(id)a3;
- (void)setLastNumCandidatesRequest:(unint64_t)a3;
- (void)setLinguisticResourceStatus:(unint64_t)a3 reason:(id)a4;
- (void)setMarkedText;
- (void)setOriginalInput:(id)a3;
- (void)setPhraseBoundaryIfNecessary;
- (void)setPregeneratedTypingAutocorrections:(id)a3;
- (void)setPreviousTouchEvent:(id)a3;
- (void)setProactiveSuggestionsGenerationBlock:(id)a3;
- (void)setRejectedAutocorrection:(id)a3 forInput:(id)a4;
- (void)setRejectedAutocorrectionsDisplayedOrInserted:(id)a3;
- (void)setRejectedAutocorrectionsDisplayedOrInsertedInverse:(id)a3;
- (void)setRejectedConversionsForCurrentContinuousPath:(id)a3;
- (void)setSmartSelector:(id)a3;
- (void)setTestingStateObject:(id)a3;
- (void)setTypingSessionMonitor:(id)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (void)softLearningRegisterAccepted:(id)a3 typed:(id)a4;
- (void)softLearningRegisterDeleted:(id)a3;
- (void)storeLanguageModelDynamicDataIncludingCache;
- (void)suspend;
- (void)syncInputStringToKeyboardState:(id)a3 afterContextChange:(BOOL)a4;
- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4;
- (void)syncToKeyboardState:(id)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
- (void)synchronizeConversationHistoryWithInputContextHistory:(id)a3;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
- (void)tokenizeString:(const String *)a3 context:(void *)a4 sentences:(unsigned int *)a5;
- (void)trackProactiveMetrics:(id)a3 keyboardState:(id)a4;
- (void)transferErrorCorrectionFlagsToInputCandidate:(void *)a3;
- (void)trimInput;
- (void)trimInputAfterLathamConversion;
- (void)updateComposedText;
- (void)updateDictionaryAndLanguageModel;
- (void)updateForRevisitedString:(id)a3;
- (void)updateInlineCompletionOperatingPointForPrimaryLocale;
- (void)updateInputContext;
- (void)updateResponseModelForKeyboardState:(id)a3;
- (void)updateTrialFavoniusLanguagePowerForPrimaryLocale;
- (void)updateTrialNegativeLearningFlagForPrimaryLocale;
- (void)willChangeToKeyboardState:(id)a3 afterContextChange:(BOOL)a4;
- (void)willDropInputStem;
@end

@implementation TIKeyboardInputManager

uint64_t __48__TIKeyboardInputManager_mul_resourceInputModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __50__TIKeyboardInputManager_mul_updateLanguagePriors__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 weightForInputMode:v4];
  float v6 = v5;
  unsigned int v7 = [*(id *)(a1 + 32) lexiconIDForInputMode:v4];

  v8 = *(KB::StaticDictionary **)(a1 + 40);
  uint64_t v9 = KB::StaticDictionary::lexicon_index(v8, v7);
  if (v9 != -1) {
    *(float *)(*((void *)v8 + 3) + 4 * v9) = v6;
  }
  v10 = *(KB::LanguageModelContainer **)(a1 + 48);

  return KB::LanguageModelContainer::set_lexicon_prior_probability(v10, v7, v6);
}

uint64_t __52__TIKeyboardInputManager_mul_shouldUpdateDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) lexiconIDForInputMode:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t result = KB::StaticDictionary::lexicon_index(*(KB::StaticDictionary **)(a1 + 48), result);
    BOOL v5 = result == -1;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

void __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  v3 = NSString;
  uint64_t v4 = a1[4];
  BOOL v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) keyboardState];
  float v6 = [v5 clientIdentifier];
  if ([v3 _string:v4 matchesString:v6])
  {
    unsigned int v7 = NSString;
    uint64_t v8 = a1[5];
    uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) keyboardState];
    v10 = [v9 recipientIdentifier];
    LODWORD(v7) = [v7 _string:v8 matchesString:v10];

    if (!v7) {
      goto LABEL_6;
    }
    BOOL v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) languageSelectionController];
    [v5 setAdaptationContext:v13];
  }
  else
  {
  }
LABEL_6:
  uint64_t v11 = *(void *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke_60(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 weightForInputMode:v4];
  int v6 = v5;
  id v7 = [v4 preferredModelLocaleIdentifier];
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v7 UTF8String]);

  uint64_t v8 = [v4 locale];
  id v9 = [v8 localeIdentifier];
  unsigned int v10 = TILexiconIDForLocaleIdentifier((char *)[v9 UTF8String]);

  uint64_t v11 = (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  if ((v16 & 0x80u) == 0) {
    v12 = (uint64_t *)__p;
  }
  else {
    v12 = (uint64_t *)__p[0];
  }
  if ((v16 & 0x80u) == 0) {
    unint64_t v13 = v16;
  }
  else {
    unint64_t v13 = (unint64_t)__p[1];
  }
  std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v12, v13);
  v14 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, (uint64_t)__p, (uint64_t)__p);
  unsigned int v17 = v10;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)(v14 + 56), v10, &v17)+ 5) = v6;

  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
}

void __193__TIKeyboardInputManager_mul_modelLoaderForModelLocaleMapping_customResourcePaths_dynamicResourcePath_usesLinguisticContext_isMultiLingualModeEnabled_validEnglishTransformerMultilingualConfig___block_invoke(uint64_t a1, void *a2)
{
  id v18 = [a2 preferredModelLocaleIdentifier];
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) objectForKey:v18];
    int v5 = [v4 firstObject];

    int v6 = +[TITrialManagerProxy sharedManager];
    id v7 = [v5 locale];
    uint64_t v8 = [v6 encodedLMTrialParametersForLocale:v7];

    unsigned int v17 = [*(id *)(a1 + 48) languageModelAssetsForInputMode:v5];
    id v9 = [v5 preferredModelLocaleIdentifier];
    uint64_t v10 = [v5 preferredModelLocaleIsMultilingual];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    HIDWORD(v16) = *(unsigned __int8 *)(a1 + 72);
    LOWORD(v7) = *(_WORD *)(a1 + 73);
    unint64_t v13 = [*(id *)(a1 + 48) inputMode];
    LOBYTE(v6) = [v13 isSiriMode];
    LOBYTE(v16) = [v5 doesSupportInlineCompletion];
    BYTE2(v15) = (_BYTE)v6;
    LOWORD(v15) = (_WORD)v7;
    v14 = +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v9, v10, v12, v11, v17, HIDWORD(v16), v15, v8, v16);

    [*(id *)(a1 + 32) setObject:v14 forKey:v18];
  }
}

void __59__TIKeyboardInputManager_mul_modelLocaleToInputModeMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 preferredModelLocaleIdentifier];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  int v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  [v7 addObject:v3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

void __68__TIKeyboardInputManager_mul_listOfModelLocalesFromActiveInputModes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 preferredModelLocaleIdentifier];
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __54__TIKeyboardInputManager_mul_lexiconInformationVector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) weightForInputMode:v3];
  int v5 = v4;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 lexiconInfoForInputMode:v3];
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
    memset(v51, 0, sizeof(v51));
  }
  DWORD2(v60) = v5;
  id v7 = *(uint64_t **)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = v7[7];
  unint64_t v9 = v7[8];
  if (v8 >= v9)
  {
    uint64_t v11 = v7[6];
    uint64_t v12 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - v11) >> 4);
    if ((unint64_t)(v12 + 1) > 0x1745D1745D1745DLL) {
      goto LABEL_65;
    }
    unint64_t v13 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v9 - v11) >> 4);
    uint64_t v14 = 2 * v13;
    if (2 * v13 <= v12 + 1) {
      uint64_t v14 = v12 + 1;
    }
    if (v13 >= 0xBA2E8BA2E8BA2ELL) {
      unint64_t v15 = 0x1745D1745D1745DLL;
    }
    else {
      unint64_t v15 = v14;
    }
    v42[0] = v7 + 8;
    if (v15) {
      unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v15);
    }
    else {
      uint64_t v16 = 0;
    }
    v40[0] = (void *)v15;
    v40[1] = (void *)(v15 + 176 * v12);
    *((void *)&v41 + 1) = v15 + 176 * v16;
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v40[1], (uint64_t)v51);
    *(void *)&long long v41 = (char *)v40[1] + 176;
    std::vector<KB::LexiconInfo>::__swap_out_circular_buffer(v7 + 6, v40);
    uint64_t v10 = v7[7];
    std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)v40);
  }
  else
  {
    uint64_t v10 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>(v8, (uint64_t)v51)
        + 176;
  }
  v7[7] = v10;
  id v17 = [v3 languageWithRegion];
  [v17 UTF8String];
  int v18 = _os_feature_enabled_impl();

  if (!v18) {
    goto LABEL_49;
  }
  v19 = *(void **)(a1 + 32);
  v20 = [v3 locale];
  v21 = [v20 localeIdentifier];
  if (v19)
  {
    [v19 lexiconInfoForMultilingualDynamic:v21];
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    *(_OWORD *)v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)v42 = 0u;
    long long v43 = 0u;
    *(_OWORD *)v40 = 0u;
    long long v41 = 0u;
  }

  DWORD2(v50) = v5;
  v22 = *(uint64_t **)(*(void *)(a1 + 40) + 8);
  unint64_t v23 = v22[7];
  unint64_t v24 = v22[8];
  if (v23 >= v24)
  {
    uint64_t v26 = v22[6];
    uint64_t v27 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v23 - v26) >> 4);
    if ((unint64_t)(v27 + 1) <= 0x1745D1745D1745DLL)
    {
      unint64_t v28 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v24 - v26) >> 4);
      uint64_t v29 = 2 * v28;
      if (2 * v28 <= v27 + 1) {
        uint64_t v29 = v27 + 1;
      }
      if (v28 >= 0xBA2E8BA2E8BA2ELL) {
        unint64_t v30 = 0x1745D1745D1745DLL;
      }
      else {
        unint64_t v30 = v29;
      }
      v39 = v22 + 8;
      if (v30) {
        unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v30);
      }
      else {
        uint64_t v31 = 0;
      }
      __p = (void *)v30;
      uint64_t v36 = v30 + 176 * v27;
      unint64_t v38 = v30 + 176 * v31;
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>(v36, (uint64_t)v40);
      uint64_t v37 = v36 + 176;
      std::vector<KB::LexiconInfo>::__swap_out_circular_buffer(v22 + 6, &__p);
      uint64_t v25 = v22[7];
      std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&__p);
      goto LABEL_32;
    }
LABEL_65:
    abort();
  }
  uint64_t v25 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>(v23, (uint64_t)v40)
      + 176;
LABEL_32:
  v22[7] = v25;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8) + 48;
  v33 = [v3 locale];
  id v34 = [v33 localeIdentifier];
  std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v34 UTF8String]);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>(v32, (uint64_t)&__p, (uint64_t)&__p);
  if (SHIBYTE(v37) < 0) {
    operator delete(__p);
  }

  if (*((void *)&v48 + 1) && BYTE6(v48) == 1) {
    free(*((void **)&v48 + 1));
  }
  if (*((void *)&v46 + 1) && BYTE6(v46) == 1) {
    free(*((void **)&v46 + 1));
  }
  if (v44[1] && BYTE6(v44[0]) == 1) {
    free(v44[1]);
  }
  if (v42[1] && BYTE6(v42[0]) == 1) {
    free(v42[1]);
  }
  if (v40[1] && BYTE6(v40[0]) == 1) {
    free(v40[1]);
  }
LABEL_49:
  if (*((void *)&v58 + 1) && BYTE6(v58) == 1) {
    free(*((void **)&v58 + 1));
  }
  if (*((void *)&v56 + 1) && BYTE6(v56) == 1) {
    free(*((void **)&v56 + 1));
  }
  if (*((void *)&v54 + 1) && BYTE6(v54) == 1) {
    free(*((void **)&v54 + 1));
  }
  if (*((void *)&v52 + 1) && BYTE6(v52) == 1) {
    free(*((void **)&v52 + 1));
  }
  if (v51[1] && BYTE6(v51[0]) == 1) {
    free(v51[1]);
  }
}

void __54__TIKeyboardInputManager_mul_keyLayoutMapAsNearbyKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = *(void **)(a1 + 32);
  unint64_t v9 = a3;
  int v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = a2;
  unint64_t v8 = [v5 arrayWithObjects:&v9 count:1];
  objc_msgSend(v4, "setValue:forKey:", v8, v7, v9, v10);
}

void __51__TIKeyboardInputManager_mul_keyLayoutDidChangeTo___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [NSString stringWithCString:a2 encoding:4];
  uint64_t v12 = [*(id *)(a1 + 32) objectForKey:v11];
  if ([*(id *)(a1 + 40) isShifted])
  {
    uint64_t v13 = [v12 uppercaseString];

    uint64_t v12 = (void *)v13;
  }
  if (v12)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 40);
    KB::utf8_string((KB *)v12, (uint64_t)v15);
    v18.origin.x = a3;
    v18.origin.y = a4;
    v18.size.width = a5;
    v18.size.height = a6;
    TIInputManager::register_key_area(v14, (_LXLexicon *)v15, v18);
    if (v16)
    {
      if (v15[6] == 1) {
        free(v16);
      }
    }
  }
}

BOOL __64__TIKeyboardInputManager_mul_stringIsRecognizedByAlternativeIM___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 candidate];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    int v5 = [v3 lexiconLocale];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __82__TIKeyboardInputManager_mul_shouldPassAlternativeInputAsPrediction_isRecognized___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 lexiconLocale];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __82__TIKeyboardInputManager_mul_candidateArray_withCandidateUniquelyInsertedToFront___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 candidate];
  int v4 = [*(id *)(a1 + 32) candidate];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

id __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v6 = [v5 candidate];
    if (a3)
    {
      id v7 = [v5 lexiconLocale];

      if (!v7)
      {
        id v8 = *(id *)(a1 + 32);

        BOOL v6 = v8;
      }
    }
    id v9 = [v5 candidateByReplacingWithCandidate:v6 input:*(void *)(a1 + 32) rawInput:0];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[TIKeyboardInputManager_mul updateAutocorrectionListGivenOutdatedInput:andUpdatedInput:]_block_invoke";
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Received a candidate that could not be replaced but has to.", (uint8_t *)&v11, 0xCu);
    }
    id v9 = v5;
  }

  return v9;
}

void __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_23(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

void __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

uint64_t __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 candidate];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void *__53__TIKeyboardInputManager_mul_getBetterLexiconLocale___block_invoke(void *result, void *a2)
{
  if (!*(void *)(*(void *)(result[6] + 8) + 40))
  {
    id v2 = result;
    BOOL v3 = (void *)result[4];
    uint64_t v4 = (void *)result[5];
    id v5 = a2;
    BOOL v6 = [v4 candidate];
    uint64_t v7 = [v3 lexiconLocaleOfString:v6 inputMode:v5];

    uint64_t v8 = *(void *)(v2[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = (void *)v2[5];
    uint64_t v11 = *(void *)(*(void *)(v2[6] + 8) + 40);
    return (void *)[v10 setLexiconLocale:v11];
  }
  return result;
}

uint64_t __51__TIKeyboardInputManager_mul_keyboardConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 languageWithRegion];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 34) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequestStack, 0);
  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequest, 0);
  objc_storeStrong((id *)&self->_lastAcceptedText, 0);
  objc_storeStrong((id *)&self->_previousTouchEvent, 0);
  objc_storeStrong((id *)&self->_lastAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInsertedInverse, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInserted, 0);
  objc_storeStrong((id *)&self->_autocorrectionForCurrentStem, 0);
  objc_storeStrong((id *)&self->_pregeneratedTypingAutocorrections, 0);
  objc_storeStrong((id *)&self->_lastInputString, 0);
  objc_storeStrong((id *)&self->_filterParameterLoader, 0);
  objc_storeStrong((id *)&self->_lastContinuousPathAutocorrection, 0);
  objc_storeStrong(&self->_proactiveSuggestionsGenerationBlock, 0);
  objc_storeStrong((id *)&self->_smartSelector, 0);
  objc_storeStrong((id *)&self->_counterChangeCache, 0);
  objc_storeStrong((id *)&self->_typingSessionMonitor, 0);
  objc_storeStrong((id *)&self->_rejectedConversionsForCurrentContinuousPath, 0);
  objc_storeStrong((id *)&self->_hitTestCorrectedInputMatchingCandidate, 0);
  objc_storeStrong((id *)&self->_textCheckerExemptions, 0);
  objc_storeStrong((id *)&self->_autoshiftRegexLoader, 0);
  objc_storeStrong((id *)&self->_autocorrectionListsForWordsInDocument, 0);
  objc_storeStrong((id *)&self->_autocorrectionListsSuggestedForCurrentInput, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrections, 0);
  objc_storeStrong((id *)&self->_recentPredictiveInputSelections, 0);
  objc_storeStrong((id *)&self->_recentAutocorrections, 0);
  objc_storeStrong((id *)&self->_autocorrectionHistory, 0);
  objc_storeStrong((id *)&self->_revisionHistory, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_currentCandidateGenerationContextSupplementalLexicons);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  cntrl = self->_refinery.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  begin = self->conversation_history.__begin_;
  if (begin)
  {
    end = self->conversation_history.__end_;
    BOOL v6 = self->conversation_history.__begin_;
    if (end != begin)
    {
      do
      {
        end = (RecentMessage *)((char *)end - 48);
        std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)end);
      }
      while (end != begin);
      BOOL v6 = self->conversation_history.__begin_;
    }
    self->conversation_history.__end_ = begin;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_testingStateObject, 0);
  objc_storeStrong((id *)&self->_smartOptions, 0);
  objc_storeStrong((id *)&self->_openingQuotes, 0);
  objc_storeStrong((id *)&self->_closingQuotes, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWordExtraCharacters, 0);
  objc_storeStrong((id *)&self->_wordCharacters, 0);
  objc_storeStrong((id *)&self->_synchronizedInputContextHistory, 0);
  objc_storeStrong((id *)&self->_emojiCandidateGenerator, 0);
  objc_storeStrong((id *)&self->_languageSelectionController, 0);
  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  uint64_t v7 = self->m_lightweight_language_model.__cntrl_;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v7);
  }
  uint64_t v8 = self->m_typology_recorder.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v8);
  }
  objc_storeStrong((id *)&self->_cachedLayoutTags, 0);
  objc_storeStrong((id *)&self->_allowPredictionCharacterSet, 0);
  objc_storeStrong((id *)&self->_keyboardFeatureSpecialization, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);

  objc_storeStrong((id *)&self->m_composedText, 0);
}

- (void)setCandidateHandlerForOpenRequestStack:(id)a3
{
}

- (NSMutableArray)candidateHandlerForOpenRequestStack
{
  return self->_candidateHandlerForOpenRequestStack;
}

- (void)setCandidateHandlerForOpenRequest:(id)a3
{
}

- (TICandidateHandler)candidateHandlerForOpenRequest
{
  return self->_candidateHandlerForOpenRequest;
}

- (void)setLastAcceptedText:(id)a3
{
}

- (TIKeyboardCandidate)lastAcceptedText
{
  return self->_lastAcceptedText;
}

- (void)setPreviousTouchEvent:(id)a3
{
}

- (TIKeyboardTouchEvent)previousTouchEvent
{
  return self->_previousTouchEvent;
}

- (void)setLastAutocorrectionList:(id)a3
{
}

- (TIAutocorrectionList)lastAutocorrectionList
{
  return self->_lastAutocorrectionList;
}

- (void)setRejectedAutocorrectionsDisplayedOrInsertedInverse:(id)a3
{
}

- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInsertedInverse
{
  return self->_rejectedAutocorrectionsDisplayedOrInsertedInverse;
}

- (void)setRejectedAutocorrectionsDisplayedOrInserted:(id)a3
{
}

- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInserted
{
  return self->_rejectedAutocorrectionsDisplayedOrInserted;
}

- (void)setAutocorrectionForCurrentStem:(id)a3
{
}

- (TILRUDictionary)autocorrectionForCurrentStem
{
  return self->_autocorrectionForCurrentStem;
}

- (void)setPregeneratedTypingAutocorrections:(id)a3
{
}

- (TIAutocorrectionList)pregeneratedTypingAutocorrections
{
  return self->_pregeneratedTypingAutocorrections;
}

- (void)setLastInputString:(id)a3
{
}

- (NSString)lastInputString
{
  return self->_lastInputString;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (TIFilterParameterLoader)filterParameterLoader
{
  return self->_filterParameterLoader;
}

- (void)setLastNumCandidatesRequest:(unint64_t)a3
{
  self->_lastNumCandidatesRequest = a3;
}

- (unint64_t)lastNumCandidatesRequest
{
  return self->_lastNumCandidatesRequest;
}

- (void)setLastContinuousPathAutocorrection:(id)a3
{
}

- (TIAutocorrectionList)lastContinuousPathAutocorrection
{
  return self->_lastContinuousPathAutocorrection;
}

- (void)setProactiveSuggestionsGenerationBlock:(id)a3
{
}

- (id)proactiveSuggestionsGenerationBlock
{
  return self->_proactiveSuggestionsGenerationBlock;
}

- (void)setSmartSelector:(id)a3
{
}

- (TISmartSelector)smartSelector
{
  return self->_smartSelector;
}

- (void)setCounterChangeCache:(id)a3
{
}

- (TICounterChangeCache)counterChangeCache
{
  return self->_counterChangeCache;
}

- (void)setTypingSessionMonitor:(id)a3
{
}

- (void)setRejectedConversionsForCurrentContinuousPath:(id)a3
{
}

- (NSMutableSet)rejectedConversionsForCurrentContinuousPath
{
  return self->_rejectedConversionsForCurrentContinuousPath;
}

- (void)setHitTestCorrectedInputMatchingCandidate:(id)a3
{
}

- (TIKeyboardCandidate)hitTestCorrectedInputMatchingCandidate
{
  return self->_hitTestCorrectedInputMatchingCandidate;
}

- (void)setDeleteKeyCount:(int64_t)a3
{
  self->_deleteKeyCount = a3;
}

- (int64_t)deleteKeyCount
{
  return self->_deleteKeyCount;
}

- (unint64_t)linguisticResourceStatus
{
  return self->_linguisticResourceStatus;
}

- (TITextCheckerExemptions)textCheckerExemptions
{
  return self->_textCheckerExemptions;
}

- (void)setAutoshiftRegexLoader:(id)a3
{
}

- (TIAutoshiftRegularExpressionLoader)autoshiftRegexLoader
{
  return self->_autoshiftRegexLoader;
}

- (void)setIsEditingWordPrefix:(BOOL)a3
{
  self->_isEditingWordPrefix = a3;
}

- (BOOL)isEditingWordPrefix
{
  return self->_isEditingWordPrefix;
}

- (TILRUDictionary)autocorrectionListsForWordsInDocument
{
  return self->_autocorrectionListsForWordsInDocument;
}

- (TILRUDictionary)autocorrectionListsSuggestedForCurrentInput
{
  return self->_autocorrectionListsSuggestedForCurrentInput;
}

- (TILRUDictionary)rejectedAutocorrections
{
  return self->_rejectedAutocorrections;
}

- (TILRUDictionary)recentPredictiveInputSelections
{
  return self->_recentPredictiveInputSelections;
}

- (TILRUDictionary)recentAutocorrections
{
  return self->_recentAutocorrections;
}

- (TILRUDictionary)autocorrectionHistory
{
  return self->_autocorrectionHistory;
}

- (TIRevisionHistory)revisionHistory
{
  return self->_revisionHistory;
}

- (void)setCandidateRange:(_NSRange)a3
{
  self->_candidateRange = a3;
}

- (_NSRange)candidateRange
{
  p_candidateRange = &self->_candidateRange;
  NSUInteger location = self->_candidateRange.location;
  NSUInteger length = p_candidateRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (BOOL)isWordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (unsigned)supplementalPrefix
{
  return self->_supplementalPrefix;
}

- (TISupplementalLexiconController)currentCandidateGenerationContextSupplementalLexicons
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentCandidateGenerationContextSupplementalLexicons);

  return (TISupplementalLexiconController *)WeakRetained;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (unsigned)sourceMaskForWord:(Word *)a3
{
  int var8 = a3->var8;
  if ((var8 & 0x40000) != 0)
  {
    if (a3->var18) {
      int v4 = 0x20000;
    }
    else {
      int v4 = 0x8000;
    }
  }
  else
  {
    int v4 = 0;
  }
  if ((var8 & 0x80032000) != 0)
  {
    if (a3->var18) {
      int v5 = 0x40000;
    }
    else {
      int v5 = 0x10000;
    }
    v4 |= v5;
  }
  if (a3->var19.var0.var2.var0) {
    v4 |= 0x400u;
  }
  int v6 = (var8 >> 14) & 0xC | (var8 >> 4) & 0x10 | v4;
  if (var8 < 0) {
    v6 |= 0x800u;
  }
  int8x16_t v7 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(var8), (uint32x4_t)xmmword_1E4154C40), (int8x16_t)xmmword_1E4154C50);
  *(int8x8_t *)v7.i8 = vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL));
  return v7.i32[0] | v6 | v7.i32[1];
}

- (unsigned)sourceMaskForWordString:(String *)a3 caseSensitive:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  TIInputManager::matching_words_from_dictionary((TIInputManager *)self->m_impl, (const KB::String *)a3, (const KB::String *)a3, a4, (uint64_t *)&v10);
  int v5 = v10;
  int v6 = v11;
  if (v10 == v11)
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned int v7 = 0;
    do
    {
      KB::Word::Word((KB::Word *)v13, v5);
      unsigned int v8 = [(TIKeyboardInputManager *)self sourceMaskForWord:v13];
      KB::Word::~Word((KB::Word *)v13);
      v7 |= v8;
      v5 += 30;
    }
    while (v5 != v6);
  }
  uint64_t v12 = &v10;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  return v7;
}

- (unsigned)adjustedSourceMaskFromCandidate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 sourceMask];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v6 = [v4 candidate];
    unsigned int v7 = [(TIKeyboardInputManagerBase *)self inputMode];
    unsigned int v8 = [v7 locale];
    KB::utf8_string_tokens_from_string(v6, (KB::String *)v26);

    id v9 = (const KB::String *)v26[0];
    uint64_t v10 = (const KB::String *)v26[1];
    while (v9 != v10)
    {
      KB::String::String((KB::String *)buf, v9);
      KB::String::String((KB::String *)v27, (const KB::String *)buf);
      unsigned int v11 = [(TIKeyboardInputManager *)self sourceMaskForWordString:v27 caseSensitive:0];
      if (v28) {
        BOOL v12 = v27[6] == 1;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12) {
        free(v28);
      }
      if (*((void *)&buf[0] + 1))
      {
        if (BYTE6(buf[0]) == 1) {
          free(*((void **)&buf[0] + 1));
        }
      }
      v5 |= v11;
      id v9 = (const KB::String *)((char *)v9 + 32);
    }
    *(void *)&buf[0] = v26;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 |= 4u;
  }
  if ([v4 isResponseKitCandidate]) {
    int v13 = v5 | 0x2000;
  }
  else {
    int v13 = v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v4 proactiveTrigger];

    if (v14) {
      v13 |= 0x40u;
    }
  }
  unint64_t v15 = [v4 candidate];
  int v16 = [v15 _containsEmoji];

  if (v16) {
    unsigned int v17 = v13 | 0x4000;
  }
  else {
    unsigned int v17 = v13;
  }
  if ([v4 isToucanInlineCompletionCandidate]) {
    v17 |= 0x80000u;
  }
  if (IXACanLogMessageAtLevel())
  {
    CGRect v18 = IXADefaultLogFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = NSString;
      v21 = [v4 candidate];
      v22 = [v4 input];
      [v4 sourceMask];
      unint64_t v23 = TIStatisticCandidateSourceAsString();
      unint64_t v24 = TIStatisticCandidateSourceAsString();
      uint64_t v25 = [v20 stringWithFormat:@"%s SourceMaskTesting |%@|%@|%@|%@|", "-[TIKeyboardInputManager adjustedSourceMaskFromCandidate:]", v21, v22, v23, v24];
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v25;
      _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
    }
  }

  return v17;
}

- (TIStickerCandidateGenerator)stickerCandidateGenerator
{
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT()
    && [(TIKeyboardInputManager *)self isStickerSuggestionsEnabled])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v4 = [v3 languageCode];

    int v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    int v6 = [v5 languageWithRegion];

    if ((_os_feature_enabled_impl() & 1) != 0
      || [v4 hasPrefix:@"en"]
      && [v6 hasPrefix:@"en"])
    {
      unsigned int v7 = +[TIStickerCandidateGenerator sharedInstance];
    }
    else
    {
      unsigned int v7 = 0;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return (TIStickerCandidateGenerator *)v7;
}

- (TIEmojiCandidateGenerator)emojiCandidateGenerator
{
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    emojiCandidateGenerator = self->_emojiCandidateGenerator;
    if (!emojiCandidateGenerator)
    {
      id v4 = [(TIKeyboardInputManager *)self languageSelectionController];
      int v5 = [v4 activeInputModes];

      int v6 = [[TIEmojiCandidateGenerator alloc] initWithActiveInputModes:v5 inputManager:self];
      unsigned int v7 = self->_emojiCandidateGenerator;
      self->_emojiCandidateGenerator = v6;

      emojiCandidateGenerator = self->_emojiCandidateGenerator;
    }
    unsigned int v8 = emojiCandidateGenerator;
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)didUpdateInputModes:(id)a3
{
  id v5 = [a3 activeInputModes];
  id v4 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
  [v4 updateForActiveInputModes:v5];
}

- (TILanguageSelectionController)languageSelectionController
{
  uint64_t v3 = [(TIKeyboardInputManager *)self getTestingStateObject];
  if (v3)
  {
  }
  else if ((TI_DEVICE_UNLOCKED_SINCE_BOOT() & 1) == 0)
  {
    unsigned int v7 = 0;
    goto LABEL_8;
  }
  languageSelectionController = self->_languageSelectionController;
  if (!languageSelectionController)
  {
    id v5 = objc_alloc_init(TILanguageSelectionController);
    int v6 = self->_languageSelectionController;
    self->_languageSelectionController = v5;

    [(TILanguageSelectionController *)self->_languageSelectionController setDelegate:self];
    languageSelectionController = self->_languageSelectionController;
  }
  unsigned int v7 = languageSelectionController;
LABEL_8:

  return v7;
}

- (id)resourceInputModes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (unsigned)predominantLexiconInContext
{
  if (!*((void *)self->m_impl + 29)) {
    return 0;
  }
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  id v4 = [v3 documentState];
  uint64_t v5 = [v4 contextBeforeInput];
  int v6 = (void *)v5;
  if (v5) {
    unsigned int v7 = (__CFString *)v5;
  }
  else {
    unsigned int v7 = &stru_1F3F7A998;
  }
  unsigned int v8 = v7;

  [(TIKeyboardInputManager *)self sentenceContextForInputStem:&stru_1F3F7A998 inputContext:v8];
  unsigned int v9 = (*(uint64_t (**)(void))(**((void **)self->m_impl + 29) + 440))();
  int v16 = (void **)&v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v16);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v14);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v13);
  if (__p) {
    operator delete(__p);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }

  return v9;
}

- (BOOL)isTransliterationManager
{
  return 0;
}

- (void)forceInstallTypologyTraceLogger
{
  uint64_t v3 = (char *)operator new(0x28uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)uint64_t v3 = &unk_1F3F75BC0;
  ptr = (TypologyLogger *)(v3 + 24);
  *((void *)v3 + 3) = &unk_1F3F78E50;
  *((void *)v3 + 4) = CFStringCreateMutable(0, 0);
  cntrl = self->m_typology_recorder.__cntrl_;
  self->m_typology_recorder.__ptr_ = (TypologyLogger *)(v3 + 24);
  self->m_typology_recorder.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
    m_impl = self->m_impl;
    ptr = self->m_typology_recorder.__ptr_;
    uint64_t v3 = (char *)self->m_typology_recorder.__cntrl_;
    if (!v3)
    {
      char v7 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    m_impl = self->m_impl;
  }
  char v7 = 0;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 1, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 1, 1uLL, memory_order_relaxed);
LABEL_6:
  *((void *)m_impl + 71) = ptr;
  unsigned int v8 = (std::__shared_weak_count *)*((void *)m_impl + 72);
  *((void *)m_impl + 72) = v3;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v8);
  }
  if ((v7 & 1) == 0)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v3);
  }
}

- (void)installTypologyTraceLogger
{
  if (self->m_impl)
  {
    uint64_t v3 = [(TIKeyboardInputManager *)self config];
    if ([v3 isTesting])
    {
      id v4 = [(TIKeyboardInputManagerBase *)self typologyPreferences];
      int v5 = [v4 isInternalDeviceWithForcedTypologyLoggingForTesting];

      if (!v5) {
        return;
      }
    }
    else
    {
    }
    int v6 = [(TIKeyboardInputManagerBase *)self typologyPreferences];
    if ([v6 typologyLoggingEnabled])
    {
      char v7 = [(TIKeyboardInputManager *)self keyboardState];
      int v8 = [v7 secureTextEntry];
      char v9 = v8;
      int v10 = v8 ^ 1;

      p_m_typology_recorder = &self->m_typology_recorder;
      if ((self->m_typology_recorder.__ptr_ != 0) == v10) {
        return;
      }
      s_trace_logging_enabled = v10;
      if (v9)
      {
        BOOL v12 = 0;
        ptr = 0;
      }
      else
      {
        BOOL v12 = (std::__shared_weak_count *)operator new(0x28uLL);
        v12->__shared_owners_ = 0;
        v12->__shared_weak_owners_ = 0;
        v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3F75BC0;
        ptr = (TypologyLogger *)&v12[1];
        v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3F78E50;
        v12[1].__shared_owners_ = (uint64_t)CFStringCreateMutable(0, 0);
      }
    }
    else
    {

      p_m_typology_recorder = &self->m_typology_recorder;
      if (!self->m_typology_recorder.__ptr_) {
        return;
      }
      BOOL v12 = 0;
      ptr = 0;
      s_trace_logging_enabled = 0;
    }
    cntrl = (std::__shared_weak_count *)p_m_typology_recorder->__cntrl_;
    p_m_typology_recorder->__ptr_ = ptr;
    p_m_typology_recorder->__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
      ptr = p_m_typology_recorder->__ptr_;
      BOOL v12 = (std::__shared_weak_count *)p_m_typology_recorder->__cntrl_;
    }
    m_impl = self->m_impl;
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *((void *)m_impl + 71) = ptr;
    int v16 = (std::__shared_weak_count *)*((void *)m_impl + 72);
    *((void *)m_impl + 72) = v12;
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    }
    if (v12)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v12);
    }
  }
}

- (BOOL)acceptsRange:(_NSRange)a3 inString:(id)a4
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __48__TIKeyboardInputManager_acceptsRange_inString___block_invoke;
  v6[3] = &unk_1E6E2C0E8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(a4, "_enumerateLongCharactersInRange:usingBlock:", a3.location, a3.length, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__TIKeyboardInputManager_acceptsRange_inString___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) acceptsCharacter:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  LOBYTE(v3) = [v4 acceptsCharacter:v3];

  return v3;
}

- (id)candidateResultSet
{
  uint64_t v3 = [(TIKeyboardInputManager *)self candidates];
  char v4 = [(TIKeyboardInputManager *)self candidateResultSetFromCandidates:v3];

  return v4;
}

- (BOOL)doesSelectedTextGenerateEmojiCandidates
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  char v4 = [v3 documentState];
  int v5 = [v4 selectedText];

  if (v5)
  {
    int v6 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    int v8 = [v6 emojiReplacementCandidates:v7];
  }
  else
  {
    int v8 = 0;
  }
  BOOL v9 = [v8 count] != 0;

  return v9;
}

- (id)typedStringForEmptyAutocorrection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v3)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    unsigned int v17 = __Block_byref_object_copy__11289;
    CGRect v18 = __Block_byref_object_dispose__11290;
    v19 = &stru_1F3F7A998;
    char v4 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v5 = [v4 selectedRange];

    int v6 = [(TIKeyboardInputManager *)self revisionHistory];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__TIKeyboardInputManager_typedStringForEmptyAutocorrection__block_invoke;
    v13[3] = &unk_1E6E2C0C0;
    v13[5] = &v14;
    v13[6] = v5;
    v13[4] = self;
    [v6 enumerateSentenceStemUsingBlock:v13];

    if (!CEMStringIsSingleEmoji())
    {
      uint64_t v7 = [(TIKeyboardInputManager *)self inputStem];
      unint64_t v8 = [*((id *)v15 + 5) length];
      if (v8 > [v7 length]) {
        objc_storeStrong((id *)v15 + 5, v7);
      }
    }
    id v9 = *((id *)v15 + 5);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    TIInputManager::legacy_input_stem((TIInputManager *)self->m_impl, (uint64_t)&v14);
    unsigned int v11 = KB::ns_string((KB *)&v14, v10);
    id v9 = [(TIKeyboardInputManager *)self internalStringToExternal:v11];

    if (v15 && BYTE6(v14) == 1) {
      free(v15);
    }
  }

  return v9;
}

void __59__TIKeyboardInputManager_typedStringForEmptyAutocorrection__block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  id v14 = a2;
  if (a3 < *(void *)(a1 + 48))
  {
    id v20 = v14;
    uint64_t v15 = [*(id *)(a1 + 32) revisionHistory];
    uint64_t v16 = [v15 documentText];
    unsigned int v17 = objc_msgSend(v16, "substringWithRange:", a3, *(void *)(a1 + 48) - a3);

    if (a3 + a4 >= *(void *)(a1 + 48))
    {
      if (![*(id *)(a1 + 32) stringEndsWord:v20]
        || CEMStringIsSingleEmoji())
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v17);
        if ([v20 length] == 1)
        {
          CGRect v18 = [*(id *)(a1 + 32) nonstopPunctuationCharacters];
          char v19 = [v18 containsString:v20];

          if (v19) {
            goto LABEL_11;
          }
        }
      }
    }
    else if (a3 + a4 == a5 + a6 && ([*(id *)(a1 + 32) stringEndsWord:v20] & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v17);
    }
    *a8 = 1;
LABEL_11:

    id v14 = v20;
  }
}

- (BOOL)allowsAutocorrectionForCurrentInputString
{
  return 1;
}

- (BOOL)shouldGeneratePredictionsForCurrentContext
{
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v4 = [v3 predictionEnabled];

  uint64_t v5 = [(TIKeyboardInputManager *)self config];
  if (([v5 usesWordNgramModel] & 1) == 0)
  {
    uint64_t v7 = [(TIKeyboardInputManagerBase *)self inputMode];
    int v8 = [v7 supportsMultilingualKeyboard];

    if ((v8 & v4 & 1) == 0) {
      return 0;
    }
LABEL_5:
    id v9 = [(TIKeyboardInputManager *)self keyboardState];
    char v10 = [v9 documentState];
    unsigned int v11 = [v10 contextBeforeInput];

    if (![v11 length])
    {
      BOOL v6 = 1;
LABEL_21:

      return v6;
    }
    uint64_t v12 = objc_msgSend(v11, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v11, "length") - 1);
    id v14 = objc_msgSend(v11, "substringWithRange:", v12, v13);
    uint64_t v15 = [(TIKeyboardInputManager *)self allowPredictionCharacterSet];
    uint64_t v16 = [v14 rangeOfCharacterFromSet:v15];

    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    if (([v14 _containsEmoji] & 1) == 0)
    {
      if (_os_feature_enabled_impl())
      {
        unsigned int v17 = [(TIKeyboardInputManager *)self keyboardState];
        char v18 = [v17 needContactAutofill];
      }
      else
      {
        char v18 = 0;
      }
      char v19 = [(TIKeyboardInputManagerBase *)self inputMode];
      id v20 = [v19 languageWithRegion];
      int v21 = [v20 isEqualToString:@"th_TH"];

      if (v21)
      {
        if ([(TIKeyboardInputManager *)self inputIndex]) {
          char v22 = v18;
        }
        else {
          char v22 = 1;
        }
        if (v22) {
          goto LABEL_17;
        }
      }
      else if (v18)
      {
LABEL_17:
        BOOL v6 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    BOOL v6 = 0;
    goto LABEL_20;
  }

  if (v4) {
    goto LABEL_5;
  }
  return 0;
}

- (NSCharacterSet)allowPredictionCharacterSet
{
  allowPredictionCharacterSet = self->_allowPredictionCharacterSet;
  if (!allowPredictionCharacterSet)
  {
    int v4 = [MEMORY[0x1E4F28E78] stringWithString:@" \n\t\"(.,?!:;)@#"];
    uint64_t v5 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    BOOL v6 = [v5 sentencePrefixingCharacters];
    [v4 appendString:v6];

    uint64_t v7 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    int v8 = [v7 sentenceDelimitingCharacters];
    [v4 appendString:v8];

    id v9 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    char v10 = [v9 sentenceTrailingCharacters];
    [v4 appendString:v10];

    unsigned int v11 = (void *)MEMORY[0x1E4F28B88];
    uint64_t v12 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    uint64_t v13 = [v12 wordMedialPunctuationCharacters];
    id v14 = [v11 characterSetWithCharactersInString:v13];

    [v4 _removeCharactersFromSet:v14];
    uint64_t v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v4];
    uint64_t v16 = self->_allowPredictionCharacterSet;
    self->_allowPredictionCharacterSet = v15;

    allowPredictionCharacterSet = self->_allowPredictionCharacterSet;
  }

  return allowPredictionCharacterSet;
}

- (void)reconcileConversions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    uint64_t v7 = &stru_1F3F7A998;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        char v10 = [v9 input];
        unint64_t v11 = [v10 length];
        unint64_t v12 = [(__CFString *)v7 length];

        if (v11 > v12)
        {
          uint64_t v13 = [v9 input];

          uint64_t v7 = (__CFString *)v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = &stru_1F3F7A998;
  }
  if ([v3 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v3 objectAtIndex:v14];
      uint64_t v16 = [(__CFString *)v7 length];
      unsigned int v17 = [v15 input];
      uint64_t v18 = v16 - [v17 length];

      if (v18 >= 1)
      {
        char v19 = [(__CFString *)v7 substringToIndex:v18];
        id v20 = [v15 input];
        int v21 = [v19 stringByAppendingString:v20];

        char v22 = [v15 candidate];
        uint64_t v32 = v19;
        unint64_t v23 = [v19 stringByAppendingString:v22];

        uint64_t v24 = [v15 wordOriginFeedbackID];
        uint64_t v25 = [v15 usageTrackingMask];
        uint64_t v26 = [v15 sourceMask];
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4FAE500]) initWithCandidate:v23 forInput:v21 rawInput:0 wordOriginFeedbackID:v24 usageTrackingMask:v25 sourceMask:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = v15;
          objc_msgSend(v27, "setIsFromPhraseDictionary:", objc_msgSend(v28, "isFromPhraseDictionary"));
          objc_msgSend(v27, "setIsFromTextChecker:", objc_msgSend(v28, "isFromTextChecker"));
          uint64_t v29 = [v28 isContinuousPathConversion];

          [v27 setContinuousPathConversion:v29];
        }
        if (self->_supplementalPrefix) {
          objc_msgSend(v27, "core_updateWithSupplementalItemPrefix:");
        }
        uint64_t v30 = [v15 supplementalItemIdentifiers];
        [v27 setSupplementalItemIdentifiers:v30];

        [v3 replaceObjectAtIndex:v14 withObject:v27];
      }

      ++v14;
    }
    while (v14 < [v3 count]);
  }
}

- (id)extendedAutocorrection:(id)a3 spanningInputsForCandidates:(id)a4 emojis:(id)a5
{
  long long v48 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v51 = a5;
  uint64_t v9 = [v7 candidate];
  char v10 = (void *)v9;
  if (v9) {
    unint64_t v11 = (__CFString *)v9;
  }
  else {
    unint64_t v11 = &stru_1F3F7A998;
  }
  long long v52 = v11;

  id v50 = v7;
  uint64_t v12 = [v7 input];
  uint64_t v13 = (void *)v12;
  if (v12) {
    unint64_t v14 = (__CFString *)v12;
  }
  else {
    unint64_t v14 = &stru_1F3F7A998;
  }
  uint64_t v15 = v14;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isSupplementalItemCandidate", v48) & 1) == 0)
        {
          char v22 = [v21 input];
          if (![v22 length]) {
            goto LABEL_21;
          }
          unint64_t v23 = [v21 input];
          if ([(__CFString *)v15 hasSuffix:v23]) {
            goto LABEL_20;
          }
          if (![(__CFString *)v15 length])
          {

LABEL_19:
            uint64_t v26 = [v21 input];
            uint64_t v27 = [v26 length];
            uint64_t v28 = v27 - [(__CFString *)v15 length];

            uint64_t v29 = [v21 input];
            char v22 = [v29 substringToIndex:v28];

            uint64_t v30 = [v22 stringByAppendingString:v52];

            [v22 stringByAppendingString:v15];
            unint64_t v23 = v15;
            uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            long long v52 = (__CFString *)v30;
LABEL_20:

LABEL_21:
            continue;
          }
          uint64_t v24 = [v21 input];
          int v25 = [v24 hasSuffix:v15];

          if (v25) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v18);
  }

  uint64_t v31 = v51;
  if ([v51 count])
  {
    uint64_t v32 = [v51 firstObject];
    long long v33 = [v32 input];
    long long v34 = v50;
    if ([v33 containsString:@" "])
    {
      unint64_t v35 = [v33 length];
      if (v35 > [(__CFString *)v15 length])
      {
        if ([v33 hasSuffix:v15])
        {
          long long v36 = objc_msgSend(v33, "substringToIndex:", objc_msgSend(v33, "length") - -[__CFString length](v15, "length"));
          uint64_t v37 = [v36 stringByAppendingString:v52];

          uint64_t v38 = v33;
          uint64_t v15 = v38;
          long long v52 = (__CFString *)v37;
        }
      }
    }
  }
  else
  {
    long long v34 = v50;
  }
  objc_msgSend(v34, "input", v48);
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v15 == v39)
  {
    id v45 = v34;
  }
  else
  {
    uint64_t v40 = [v34 wordOriginFeedbackID];
    uint64_t v41 = [v34 usageTrackingMask];
    uint64_t v42 = [v34 sourceMask];
    id v43 = objc_alloc(MEMORY[0x1E4FAE500]);
    v44 = [v34 rawInput];
    id v45 = (id)[v43 initWithCandidate:v52 forInput:v15 rawInput:v44 wordOriginFeedbackID:v40 usageTrackingMask:v41 sourceMask:v42];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v45, "setIsFromPhraseDictionary:", objc_msgSend(v34, "isFromPhraseDictionary"));
      objc_msgSend(v45, "setIsFromTextChecker:", objc_msgSend(v34, "isFromTextChecker"));
    }
    uint64_t v31 = v51;
    if (*(_WORD *)(v49 + 282)) {
      objc_msgSend(v45, "core_updateWithSupplementalItemPrefix:");
    }
    long long v46 = [v34 supplementalItemIdentifiers];
    [v45 setSupplementalItemIdentifiers:v46];
  }

  return v45;
}

- (id)completionCandidates:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  ptr = (void *)((unint64_t)self ^ 0x13);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)((unint64_t)self ^ 0x13));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "kbdManager.generateCompletions", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v7 = [(TIKeyboardInputManager *)self shiftContext];
  (*(void (**)(uint8_t *__return_ptr))(*(void *)self->m_impl + 24))(buf);
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0x1CAC083126E978D5 * (((uint64_t)v30 - *(void *)buf) >> 3)];
  char v10 = KB::ns_string((KB *)v34, v9);
  unint64_t v11 = [(TIKeyboardInputManager *)self internalStringToExternal:v10 ignoreCompositionDisabled:1];
  uint64_t v12 = *(KB::Candidate **)buf;
  uint64_t v13 = v30;
  if (*(KB::Candidate **)buf != v30)
  {
    while (!*(void *)v12)
    {
LABEL_20:
      uint64_t v12 = (KB::Candidate *)((char *)v12 + 1000);
      if (v12 == v13) {
        goto LABEL_21;
      }
    }
    id v14 = v11;
    KB::Candidate::capitalized_string(v12, (uint64_t)v27);
    uint64_t v15 = [(TIKeyboardInputManager *)self phraseCandidateCompletedByWord:v27 allowNoSuggest:0 forAutocorrection:0 shiftContext:v7];
    if (v28 && v27[6] == 1) {
      free(v28);
    }
    if (!v15)
    {
      uint64_t v16 = *(void *)v12;
      if (*(void *)v12)
      {
        uint64_t v17 = 240 * v16 - 240;
        uint64_t v18 = (int *)(*((void *)v12 + 1) + 104);
        do
        {
          int v20 = *v18;
          v18 += 60;
          char v19 = v20;
          if ((v20 & 0x10) != 0) {
            break;
          }
          uint64_t v21 = v17;
          v17 -= 240;
        }
        while (v21);
        if ((v19 & 0x10) != 0
          || (v16 & 0xFFFFFFFE) != 0 && !-[TIKeyboardInputManager _canSuggestPhraseCandidate:withStem:](self, v12, v14))
        {
          goto LABEL_19;
        }
      }
      uint64_t v15 = [(TIKeyboardInputManager *)self autocorrectionCandidateForInput:v14 rawInput:v10 withCandidate:v12];
    }
    [v8 addObject:v15];

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:
  kdebug_trace();
  kac_get_log();
  char v22 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, ptr);
  if (v23 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v22, OS_SIGNPOST_INTERVAL_END, v24, "kbdManager.generateCompletions", (const char *)&unk_1E41704BE, v27, 2u);
    }
  }

  if (v35 && v34[6] == 1) {
    free(v35);
  }
  *(void *)uint64_t v27 = &v33;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);
  *(void *)uint64_t v27 = &v32;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);
  *(void *)uint64_t v27 = &v31;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);
  *(void *)uint64_t v27 = buf;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);

  return v8;
}

- (BOOL)_canSuggestPhraseCandidate:(void *)a3 withStem:
{
  id v5 = a3;
  if (a1)
  {
    if (!*(void *)a2) {
      goto LABEL_11;
    }
    uint64_t v6 = 240 * *(void *)a2 - 240;
    uint64_t v7 = (uint64_t *)(*((void *)a2 + 1) + 224);
    do
    {
      uint64_t v9 = *v7;
      v7 += 30;
      uint64_t v8 = v9;
      if (v9) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v6 == 0;
      }
      v6 -= 240;
    }
    while (!v10);
    if (v8 && (KB::Candidate::is_phrase_from_supplemental_lexicon(a2) & 1) == 0)
    {
      uint64_t v13 = [a1 keyboardFeatureSpecialization];
      unsigned int v14 = objc_msgSend(a1, "prefixLengthOfInput:sharedWithCandidate:useCandidateLength:", v5, a2, objc_msgSend(v13, "shouldConvertCandidateToExternal") ^ 1);

      LODWORD(v13) = *(_DWORD *)a2;
      BOOL v11 = v13 - KB::Candidate::index_of_word_containing_position(a2, v14) == 1;
    }
    else
    {
LABEL_11:
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)newKeyboardContext
{
  id v3 = [TIKeyboardInputManagerKeyboardContext alloc];
  uint64_t v4 = [(TIKeyboardInputManager *)self keyboardState];
  id v5 = [(TIKeyboardInputManagerKeyboardContext *)v3 initWithKeyboardState:v4];

  uint64_t v6 = [(TIKeyboardInputManager *)self revisionHistory];
  [(TIKeyboardInputManagerKeyboardContext *)v5 setRevisionHistory:v6];

  return v5;
}

- (int)shiftContext
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v4 = [v3 shiftState];
  id v5 = [(TIKeyboardInputManager *)self keyboardState];
  int v6 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", v4, [v5 autocapitalizationType]);

  return v6;
}

- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3
{
  kdebug_trace();
  kac_get_log();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = (const void *)((unint64_t)self ^ 0x12);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0x12));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.generatePredictions", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  BOOL v10 = [MEMORY[0x1E4F1CA48] array];
  BOOL v11 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
  uint64_t v12 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v13 = [v11 emojiAdornmentCandidatesForKeyboardState:v12];

  unsigned int v14 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v15 = [v14 documentState];
  int v16 = [v15 documentIsEmpty];

  if (v16)
  {
    uint64_t v17 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v18 = [v17 responseContext];
    if (v18)
    {
    }
    else
    {
      char v19 = [(TIKeyboardInputManager *)self keyboardState];
      int v20 = [v19 inputContextHistory];

      if (!v20) {
        goto LABEL_9;
      }
    }
    [(TIKeyboardInputManager *)self learnRecentMessageUserIsRespondingTo];
LABEL_9:
    uint64_t v21 = [(TIKeyboardInputManager *)self keyboardState];
    char v22 = [v21 textInputTraits];
    os_signpost_id_t v23 = [v22 textContentType];

    if (v23 && [v23 length])
    {
      unint64_t v48 = a3;
      os_signpost_id_t v24 = [(TIKeyboardInputManager *)self keyboardState];
      int v25 = [v24 textInputTraits];
      uint64_t v26 = [v25 textContentType];
      uint64_t v27 = +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:v26];

      if (v27) {
        [v10 addObject:v27];
      }

      a3 = v48;
    }
  }
  uint64_t v28 = [(TIKeyboardInputManager *)self predictionCandidates:a3 predictionType:3];
  uint64_t v29 = [v28 predictions];
  [v9 addObjectsFromArray:v29];

  uint64_t v30 = [(TIKeyboardInputManager *)self indexesOfDuplicatesInCandidates:v9];
  [v9 removeObjectsAtIndexes:v30];

  uint64_t v31 = [v28 proactiveTriggers];
  [v10 addObjectsFromArray:v31];

  if (_os_feature_enabled_impl())
  {
    uint64_t v47 = v13;
    uint64_t v49 = v9;
    long long v46 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v32 = [v46 textInputTraits];
    uint64_t v33 = [v32 textContentType];
    long long v34 = [(TIKeyboardInputManager *)self keyboardState];
    [v34 documentState];
    uint64_t v36 = v35 = v10;
    uint64_t v37 = [v36 contextBeforeInput];
    uint64_t v38 = [(TIKeyboardInputManager *)self keyboardState];
    v39 = +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v33, v37, [v38 autofillMode]);

    BOOL v10 = v35;
    if (v39) {
      [v35 addObject:v39];
    }

    int v6 = (const void *)((unint64_t)self ^ 0x12);
    uint64_t v9 = v49;
    uint64_t v13 = v47;
  }
  kdebug_trace();
  kac_get_log();
  uint64_t v40 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v41 = os_signpost_id_make_with_pointer(v40, v6);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v42 = v41;
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)id v50 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v40, OS_SIGNPOST_INTERVAL_END, v42, "kbdManager.generatePredictions", (const char *)&unk_1E41704BE, v50, 2u);
    }
  }

  [MEMORY[0x1E4FAE278] listWithPredictions:v9 emojiList:v13 proactiveTriggers:v10];
  v44 = id v43 = (void *)v13;

  return v44;
}

- (id)indexesOfDuplicatesInCandidates:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__TIKeyboardInputManager_indexesOfDuplicatesInCandidates___block_invoke;
  v9[3] = &unk_1E6E2D9F0;
  id v10 = v5;
  id v6 = v5;
  os_signpost_id_t v7 = [v4 indexesOfObjectsPassingTest:v9];

  return v7;
}

BOOL __58__TIKeyboardInputManager_indexesOfDuplicatesInCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 candidate];
  id v4 = [*(id *)(a1 + 32) member:v3];

  if (!v4) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 != 0;
}

- (id)continuousPathCandidates:(unint64_t)a3
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)self->m_impl + 28);
  if (!v3 || **(void **)(v3 + 8) == *(void *)(*(void *)(v3 + 8) + 8))
  {
    BOOL v11 = 0;
    goto LABEL_170;
  }
  id v5 = self;
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  os_signpost_id_t v7 = [v6 documentState];
  os_signpost_id_t v8 = [v7 selectedText];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(TIKeyboardInputManager *)v5 inputStem];
  }
  v153 = v10;

  uint64_t v12 = [(TIKeyboardInputManager *)v5 keyboardState];
  uint64_t v13 = [v12 documentState];
  unsigned int v14 = [v13 selectedText];
  if (v14)
  {
    v150 = 0;
  }
  else
  {
    TIInputManager::input_substring((unsigned __int16 *)v5->m_impl + 4, 0, *((_DWORD *)v5->m_impl + 24), (uint64_t)&v163);
    v150 = KB::ns_string((KB *)&v163, v15);
    if (v164 && BYTE6(v163) == 1) {
      free(v164);
    }
  }

  if ([(TIKeyboardInputManager *)v5 inputIndex]
    || ![(TIKeyboardInputManager *)v5 shouldInsertSpaceBeforePredictions])
  {
    m_impl = v5->m_impl;
    if (!m_impl[200])
    {
      unsigned int v156 = [(TIKeyboardInputManager *)v5 shiftContext];
      uint64_t v16 = 0;
      goto LABEL_28;
    }
    uint64_t v18 = [NSString _stringWithUnichar:KB::String::last((KB::String *)(m_impl + 200))];
    if ([(TIKeyboardInputManager *)v5 stringEndsWord:v18]
      || ([v18 isEqualToString:@"'"] & 1) != 0)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = [v18 isEqualToString:@"-"] ^ 1;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  unsigned int v19 = [(TIKeyboardInputManager *)v5 shiftContext];
  unsigned int v156 = v19;
  if (v16 && !v19)
  {
    if ([(TIKeyboardInputManager *)v5 shouldAutocapitalizePredictionAfterSpace])
    {
      int v20 = [(TIKeyboardInputManager *)v5 keyboardState];
      unsigned int v156 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", 2, [v20 autocapitalizationType]);
    }
    else
    {
      unsigned int v156 = 0;
    }
    uint64_t v16 = 1;
  }
LABEL_28:
  BOOL v21 = [(TIKeyboardInputManager *)v5 _hasSupplementalPrefix];
  if (KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21;
  }
  if (v22) {
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
  }
  uint64_t v23 = (uint64_t)v5->m_impl;
  v169 = (KB::String **)MEMORY[0x1E4F143A8];
  uint64_t v170 = 0x40000000;
  v171 = ___ZN14TIInputManager6lookupEN2KB10LookupTypeEj14TIShiftContext_block_invoke;
  v172 = &__block_descriptor_tmp_7_5033;
  uint64_t v173 = v23;
  int v174 = 5;
  unsigned int v175 = v156;
  TIInputManager::perform_lookup(v23, 5, a3, (uint64_t)&v169, (uint64_t)&v163);
  os_signpost_id_t v24 = v163;
  int v25 = (KB::Candidate *)v164;
  BOOL v146 = v22;
  if (v163 == v164)
  {
    int v25 = v163;
LABEL_51:
    uint64_t v30 = (uint64_t *)v24;
    goto LABEL_52;
  }
  while (!*(void *)v24)
  {
LABEL_38:
    os_signpost_id_t v24 = (KB::String *)((char *)v24 + 1000);
    if (v24 == v164)
    {
      uint64_t v30 = (uint64_t *)v164;
      goto LABEL_52;
    }
  }
  int v26 = 0;
  uint64_t v27 = (uint64_t *)(*((void *)v24 + 1) + 224);
  uint64_t v28 = 240 * *(void *)v24;
  while (1)
  {
    uint64_t v29 = *v27;
    v27 += 30;
    v26 += v29;
    if ((v26 & 0xFFFFFFFE) != 0) {
      break;
    }
    v28 -= 240;
    if (!v28) {
      goto LABEL_38;
    }
  }
  if (v24 == v164) {
    goto LABEL_51;
  }
  uint64_t v31 = (uint64_t *)((char *)v24 + 1000);
  if ((char *)v24 + 1000 == v164) {
    goto LABEL_51;
  }
  uint64_t v30 = (uint64_t *)v24;
  do
  {
    uint64_t v32 = v31;
    uint64_t v33 = *((void *)v24 + 125);
    if (v33)
    {
      int v34 = 0;
      unint64_t v35 = (uint64_t *)(*((void *)v24 + 126) + 224);
      uint64_t v36 = 240 * v33;
      while (1)
      {
        uint64_t v37 = *v35;
        v35 += 30;
        v34 += v37;
        if ((v34 & 0xFFFFFFFE) != 0) {
          break;
        }
        v36 -= 240;
        if (!v36) {
          goto LABEL_47;
        }
      }
    }
    else
    {
LABEL_47:
      KB::Candidate::operator=(v30, v32);
      v30 += 125;
    }
    uint64_t v31 = v32 + 125;
    os_signpost_id_t v24 = (KB::String *)v32;
  }
  while (v32 + 125 != (uint64_t *)v25);
  int v25 = (KB::Candidate *)v164;
LABEL_52:
  std::vector<KB::Candidate>::erase((uint64_t)&v163, v30, v25);
  uint64_t v38 = (uint64_t *)v163;
  v39 = (KB::Candidate *)v164;
  unsigned int v155 = v16;
  if (v163 == v164)
  {
    v39 = v163;
  }
  else
  {
    while (1)
    {
      if (*v38)
      {
        uint64_t v40 = 240 * *v38 - 240;
        os_signpost_id_t v41 = (int *)(v38[1] + 104);
        do
        {
          int v43 = *v41;
          v41 += 60;
          char v42 = v43;
          if ((v43 & 0x10) != 0) {
            break;
          }
          uint64_t v44 = v40;
          v40 -= 240;
        }
        while (v44);
        if ((v42 & 0x10) != 0) {
          break;
        }
      }
      v38 += 125;
      if (v38 == v164)
      {
        uint64_t v38 = (uint64_t *)v164;
        goto LABEL_72;
      }
    }
    if (v38 != v164)
    {
      id v45 = v38 + 125;
      if (v38 + 125 != v164)
      {
        do
        {
          if (!*v45) {
            goto LABEL_68;
          }
          uint64_t v46 = 240 * *v45 - 240;
          uint64_t v47 = (int *)(v45[1] + 104);
          do
          {
            int v49 = *v47;
            v47 += 60;
            char v48 = v49;
            if ((v49 & 0x10) != 0) {
              break;
            }
            uint64_t v50 = v46;
            v46 -= 240;
          }
          while (v50);
          if ((v48 & 0x10) == 0)
          {
LABEL_68:
            KB::Candidate::operator=(v38, v45);
            v38 += 125;
          }
          v45 += 125;
        }
        while (v45 != (uint64_t *)v39);
        v39 = (KB::Candidate *)v164;
      }
      uint64_t v16 = v155;
    }
  }
LABEL_72:
  std::vector<KB::Candidate>::erase((uint64_t)&v163, v38, v39);
  if (v163 != v164)
  {
    unint64_t v151 = a3;
    id v51 = [(TIKeyboardInputManager *)v5 rejectedConversionsForCurrentContinuousPath];
    uint64_t v52 = [v51 count];

    long long v54 = v163;
    if (v52)
    {
      long long v55 = (KB::String *)v164;
      long long v56 = v5;
      if (v54 != v55)
      {
        do
        {
          long long v57 = [(TIKeyboardInputManager *)v56 lastAcceptedText];

          if (v57)
          {
            if (*(void *)v54 < 2uLL) {
              goto LABEL_88;
            }
            uint64_t v58 = [(TIKeyboardInputManager *)v56 rejectedConversionsForCurrentContinuousPath];
            KB::Word::capitalized_string(*((KB::Word **)v54 + 1), (uint64_t)&v169);
            long long v60 = KB::ns_string((KB *)&v169, v59);
            char v61 = [v58 containsObject:v60];

            if (v170 && BYTE6(v169) == 1) {
              free((void *)v170);
            }

            uint64_t v16 = v155;
            if ((v61 & 1) == 0) {
              goto LABEL_88;
            }
          }
          else
          {
            v62 = [(TIKeyboardInputManager *)v56 rejectedConversionsForCurrentContinuousPath];
            KB::Candidate::capitalized_string(v54, (uint64_t)&v169);
            v64 = KB::ns_string((KB *)&v169, v63);
            int v65 = [v62 containsObject:v64];

            if (v170 && BYTE6(v169) == 1) {
              free((void *)v170);
            }

            uint64_t v16 = v155;
            if (!v65) {
              goto LABEL_88;
            }
          }
          long long v54 = (KB::String *)((char *)v54 + 1000);
        }
        while (v54 != v55);
        long long v54 = v55;
      }
LABEL_88:

      long long v53 = v163;
      if (v54 == v163 || v54 == v164)
      {
        long long v54 = v163;
        if (v16) {
          goto LABEL_92;
        }
        goto LABEL_95;
      }
      long long v53 = (KB::String *)std::__rotate_forward[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<KB::Candidate *>>((uint64_t *)v163, (uint64_t *)v54, (uint64_t *)v54 + 125);
      long long v54 = v163;
    }
    if (v16)
    {
LABEL_92:
      KB::String::space(v53);
      v66 = &KB::String::space(void)::space;
      goto LABEL_96;
    }
LABEL_95:
    KB::String::empty_string(v53);
    v66 = &KB::String::empty_string(void)::empty_string;
LABEL_96:
    KB::Candidate::capitalized_string(v54, (uint64_t)v160);
    v67 = (unsigned __int16 *)KB::String::String((KB::String *)&v169, (const KB::String *)v66);
    KB::String::append(v67, (const KB::String *)v160);
    if (v162 && v161 == 1) {
      free(v162);
    }
    v68 = [(TIKeyboardInputManager *)v5 phraseCandidateCompletedByWord:&v169 allowNoSuggest:0 forAutocorrection:1 shiftContext:v156];
    if (!v68)
    {
      if (*(void *)v54)
      {
        uint64_t v69 = 240 * *(void *)v54 - 240;
        v70 = (int *)(*((void *)v54 + 1) + 104);
        do
        {
          int v72 = *v70;
          v70 += 60;
          char v71 = v72;
          if ((v72 & 0x10) != 0) {
            break;
          }
          uint64_t v73 = v69;
          v69 -= 240;
        }
        while (v73);
        if ((v71 & 0x10) != 0)
        {
          BOOL v11 = 0;
          goto LABEL_158;
        }
      }
      v68 = [(TIKeyboardInputManager *)v5 autocorrectionCandidateForInput:v153 rawInput:v150 withCandidate:v54 insertingSpace:v16 sharedPrefixLength:0x7FFFFFFFFFFFFFFFLL];
    }
    BOOL v74 = 1;
    [v68 setContinuousPathConversion:1];
    v75 = [(TIKeyboardInputManager *)v5 config];
    if ([v75 usesContinuousPathProgressiveCandidates]) {
      BOOL v74 = *((unsigned char *)v5->m_impl + 396) == 0;
    }
    [v68 setShouldAccept:v74];

    if (*((_DWORD *)v5->m_impl + 24) < -858993459
                                      * ((*((void *)v5->m_impl + 2) - *((void *)v5->m_impl + 1)) >> 3))
      [v68 setShouldInsertSpaceAfterSelection:1];
    float v76 = *((float *)v54 + 192);
    double v77 = 0.0;
    if (v76 > 0.00001) {
      double v77 = (float)(*((float *)v54 + 193) / v76);
    }
    [v68 setExcessPathRatio:v77];
    v152 = [v68 candidate];
    if ([v153 length])
    {
      unint64_t v78 = v151;
      uint64_t v79 = v156;
    }
    else
    {
      v80 = [(TIKeyboardInputManager *)v5 config];
      int v81 = [v80 insertsSpaceAfterPredictiveInput];

      unint64_t v78 = v151;
      uint64_t v79 = v156;
      if (v81)
      {
        v82 = [(TIKeyboardInputManager *)v5 wordSeparator];
        uint64_t v83 = [v152 stringByAppendingString:v82];

        v152 = (void *)v83;
      }
    }
    v149 = [MEMORY[0x1E4F1CA48] array];
    v84 = [MEMORY[0x1E4F1CA80] set];
    v154 = v68;
    v85 = [v68 candidate];
    [v84 addObject:v85];

    v88 = v163;
    v87 = v164;
    v148 = v84;
    if ((unint64_t)(0x1CAC083126E978D5 * (((unsigned char *)v164 - (unsigned char *)v163) >> 3)) < 2 || !v78)
    {
LABEL_157:
      [(TIKeyboardInputManager *)v5 reconcileConversions:v149];
      v131 = [(TIKeyboardInputManager *)v5 keyboardState];
      v132 = [v131 layoutState];
      v133 = [v132 inputMode];
      v134 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();

      v135 = NSString;
      v136 = [(TIKeyboardInputManager *)v5 keyboardState];
      v137 = [v136 documentState];
      v138 = [v137 contextBeforeInput];
      v139 = [v154 candidate];
      v140 = [v135 stringWithFormat:@"%@ %@", v138, v139];

      v141 = [(TIKeyboardInputManager *)v5 emojiCandidateGenerator];
      v142 = [v141 emojiReplacementCandidatesForText:v140];

      v143 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v154 alternateCorrections:0];
      BOOL v11 = [MEMORY[0x1E4FAE278] listWithCorrections:v143 predictions:v149 emojiList:v142 proactiveTriggers:0];

LABEL_158:
      if (v170) {
        BOOL v144 = BYTE6(v169) == 1;
      }
      else {
        BOOL v144 = 0;
      }
      if (v144) {
        free((void *)v170);
      }
      goto LABEL_164;
    }
    unint64_t v157 = 0;
    unint64_t v89 = 1;
    v147 = v5;
    while (1)
    {
      v90 = (void *)((char *)v88 + 1000 * v89);
      if (*v90) {
        break;
      }
LABEL_152:
      unint64_t v89 = (v89 + 1);
      if (0x1CAC083126E978D5 * ((v87 - (unsigned char *)v88) >> 3) <= v89 || v157 >= v78) {
        goto LABEL_157;
      }
    }
    if (v16)
    {
      KB::String::space(v86);
      v91 = &KB::String::space(void)::space;
    }
    else
    {
      KB::String::empty_string(v86);
      v91 = &KB::String::empty_string(void)::empty_string;
    }
    KB::Candidate::capitalized_string((KB::String *)((char *)v88 + 1000 * v89), (uint64_t)v158);
    KB::String::String((KB::String *)v160, (const KB::String *)v91);
    KB::String::append(v160, (const KB::String *)v158);
    if (v159 && v158[6] == 1) {
      free(v159);
    }
    v92 = [(TIKeyboardInputManager *)v5 phraseCandidateCompletedByWord:v160 allowNoSuggest:0 forAutocorrection:0 shiftContext:v79];
    if (!v92)
    {
      if (*v90)
      {
        uint64_t v93 = 240 * *v90 - 240;
        v94 = (int *)(v90[1] + 104);
        do
        {
          int v96 = *v94;
          v94 += 60;
          char v95 = v96;
          if ((v96 & 0x10) != 0) {
            break;
          }
          uint64_t v97 = v93;
          v93 -= 240;
        }
        while (v97);
        if ((v95 & 0x10) != 0)
        {
          v92 = 0;
          goto LABEL_148;
        }
      }
      v92 = [(TIKeyboardInputManager *)v5 autocorrectionCandidateForInput:v153 rawInput:v150 withCandidate:(char *)v88 + 1000 * v89 insertingSpace:v16 sharedPrefixLength:0x7FFFFFFFFFFFFFFFLL];
    }
    v98 = [v92 candidate];
    char v99 = [v84 containsObject:v98];

    if (v99)
    {
LABEL_148:

      v86 = (KB::String *)v162;
      if (v162 && v161 == 1) {
        free(v162);
      }
      v88 = v163;
      v87 = v164;
      goto LABEL_152;
    }
    v100 = [v92 candidate];
    [v84 addObject:v100];

    [v92 setContinuousPathConversion:1];
    v101 = (float *)((char *)v88 + 1000 * v89);
    float v102 = v101[192];
    double v103 = 0.0;
    if (v102 > 0.00001) {
      double v103 = (float)(v101[193] / v102);
    }
    [v92 setExcessPathRatio:v103];
    v104 = [v92 candidate];
    id v105 = v152;
    v106 = [v154 input];
    unint64_t v107 = [v106 length];
    v108 = [v92 input];
    unint64_t v109 = [v108 length];

    v110 = [v154 input];
    v111 = v110;
    if (v107 <= v109)
    {
      unint64_t v118 = [v110 length];
      v119 = [v92 input];
      unint64_t v120 = [v119 length];

      if (v118 >= v120)
      {
        v84 = v148;
        goto LABEL_144;
      }
      v121 = [v92 input];
      v122 = [v92 input];
      uint64_t v123 = [v122 length];
      v124 = [v154 input];
      v115 = objc_msgSend(v121, "substringToIndex:", v123 - objc_msgSend(v124, "length"));

      uint64_t v125 = [v115 stringByAppendingString:v105];
      v117 = v105;
      id v105 = (id)v125;
    }
    else
    {
      v112 = [v154 input];
      uint64_t v113 = [v112 length];
      v114 = [v92 input];
      v115 = objc_msgSend(v111, "substringToIndex:", v113 - objc_msgSend(v114, "length"));

      uint64_t v16 = v155;
      uint64_t v116 = [v115 stringByAppendingString:v104];
      v117 = v104;
      v104 = (void *)v116;
    }
    v84 = v148;

LABEL_144:
    v126 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v127 = [v104 stringByTrimmingCharactersInSet:v126];

    if ([v127 isEqualToString:v104]) {
      id v128 = 0;
    }
    else {
      id v128 = v127;
    }
    v129 = [v92 candidateByReplacingWithCandidate:v104 input:v105 label:v128];
    [v149 addObject:v129];
    ++v157;

    id v5 = v147;
    unint64_t v78 = v151;
    uint64_t v79 = v156;
    goto LABEL_148;
  }
  BOOL v11 = 0;
LABEL_164:
  if (v168 && v167[38] == 1) {
    free(v168);
  }
  v169 = (KB::String **)v167;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = (KB::String **)&v166;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = (KB::String **)&v165;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = &v163;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  if (v146) {
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;
  }

LABEL_170:

  return v11;
}

- (id)predictionCandidates:(unint64_t)a3 predictionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v34 = [MEMORY[0x1E4F1CA48] array];
  BOOL v7 = [(TIKeyboardInputManager *)self shouldInsertSpaceBeforePredictions];
  uint64_t v8 = [(TIKeyboardInputManager *)self shiftContext];
  uint64_t v9 = v8;
  BOOL v33 = v7;
  if (v7 && !v8)
  {
    if ([(TIKeyboardInputManager *)self shouldAutocapitalizePredictionAfterSpace])
    {
      id v10 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v9 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", 2, [v10 autocapitalizationType]);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  TIInputManager::lookup((uint64_t)self->m_impl, v4, a3, v9, (uint64_t)&v40);
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  std::vector<KB::Candidate>::__init_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>((KB::Candidate *)&v35, v43, v44, 0x1CAC083126E978D5 * ((v44 - v43) >> 3));
  uint64_t v13 = v35;
  uint64_t v12 = v36;
  if (v36 == v35)
  {
    unsigned int v14 = 0;
  }
  else
  {
    unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0x1CAC083126E978D5 * ((v36 - v35) >> 3)];
    do
    {
      uint64_t v15 = [[TIProactiveTrigger alloc] initWithSourceType:0 attributes:*(void *)(v13 + 976)];
      [v14 addObject:v15];

      v13 += 1000;
    }
    while (v13 != v12);
  }
  uint64_t v31 = &v43;
  uint64_t v16 = KB::ns_string((KB *)v46, v11);
  uint64_t v17 = [(TIKeyboardInputManager *)self internalStringToExternal:v16];
  unsigned int v19 = v40;
  uint64_t v18 = v41;
  if (v40 != v41)
  {
    while (!*(void *)v19)
    {
LABEL_30:
      unsigned int v19 = (KB::Candidate *)((char *)v19 + 1000);
      if (v19 == v18) {
        goto LABEL_31;
      }
    }
    KB::Candidate::capitalized_string(v19, (uint64_t)&v38);
    int v20 = [(TIKeyboardInputManager *)self phraseCandidateCompletedByWord:&v38 allowNoSuggest:0 forAutocorrection:0 shiftContext:v9];
    if (v39) {
      BOOL v21 = BYTE6(v38) == 1;
    }
    else {
      BOOL v21 = 0;
    }
    if (v21) {
      free(v39);
    }
    if (!v20)
    {
      if (*(void *)v19)
      {
        uint64_t v22 = 240 * *(void *)v19 - 240;
        uint64_t v23 = (int *)(*((void *)v19 + 1) + 104);
        do
        {
          int v25 = *v23;
          v23 += 60;
          char v24 = v25;
          if ((v25 & 0x10) != 0) {
            break;
          }
          uint64_t v26 = v22;
          v22 -= 240;
        }
        while (v26);
        if ((v24 & 0x10) != 0)
        {
          int v20 = 0;
LABEL_29:

          goto LABEL_30;
        }
      }
      int v20 = -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v17, v16, v19, v33, 0x7FFFFFFFFFFFFFFFLL, v31);
    }
    uint64_t v27 = objc_msgSend(v20, "input", v31);
    uint64_t v28 = [v27 length];

    if (!v28) {
      [v34 addObject:v20];
    }
    goto LABEL_29;
  }
LABEL_31:
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4FAE278], "listWithPredictions:proactiveTriggers:", v34, v14, v31);

  uint64_t v38 = (void **)&v35;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  if (v47 && v46[6] == 1) {
    free(v47);
  }
  uint64_t v38 = (void **)&v45;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  uint64_t v38 = v32;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  uint64_t v38 = (void **)&v42;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  uint64_t v38 = (void **)&v40;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);

  return v29;
}

- (BOOL)shouldInsertSpaceBeforePredictions
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v4 = [v3 documentState];
  id v5 = [v4 contextBeforeInput];

  if (![v5 length])
  {
    char v12 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1);
  uint64_t v8 = objc_msgSend(v5, "substringWithRange:", v6, v7);
  uint64_t v9 = [(TIKeyboardInputManager *)self terminatorsPrecedingAutospace];
  id v10 = [v9 characterSet];
  if ([v8 rangeOfCharacterFromSet:v10] != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_7;
  }
  char v11 = [v8 _containsEmoji];

  if (v11)
  {
LABEL_7:
    char v12 = 1;
    goto LABEL_8;
  }
  char v12 = [(TIKeyboardInputManager *)self stringEndsWithClosingQuote:v5];
LABEL_8:
  uint64_t v13 = [(TIKeyboardInputManager *)self lastAcceptedText];
  if ([v13 isContinuousPathConversion])
  {
    char v14 = [v8 isEqualToString:@" "];

    v12 |= v14 ^ 1;
  }
  else
  {
  }
LABEL_12:

  return v12;
}

- (BOOL)stringEndsWithClosingQuote:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v4, "length") - 1);
    uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    uint64_t v8 = [(TIKeyboardInputManager *)self smartOptions];
    if ([v8 usesDirectionalQuotes])
    {
      uint64_t v9 = [(TIKeyboardInputManager *)self closingQuotes];
      id v10 = [v9 characterSet];
      uint64_t v11 = [v7 rangeOfCharacterFromSet:v10];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v12 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
    }
    uint64_t v13 = [(TIKeyboardInputManager *)self smartOptions];
    if ([v13 usesDirectionalQuotes])
    {
      char v14 = [(TIKeyboardInputManager *)self openingQuotes];
      uint64_t v15 = [v14 characterSet];
      uint64_t v16 = [v7 rangeOfCharacterFromSet:v15];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    if ([v7 isEqualToString:@"'"])
    {
      if (!v5)
      {
LABEL_13:
        BOOL v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      BOOL v12 = 0;
      if (![v7 isEqualToString:@"\""] || !v5) {
        goto LABEL_20;
      }
    }
    uint64_t v17 = [v4 rangeOfComposedCharacterSequenceAtIndex:v5 - 1];
    unsigned int v19 = objc_msgSend(v4, "substringWithRange:", v17, v18);
    uint64_t v20 = objc_msgSend(@"}]\"'”’.,?!;:…"), "rangeOfString:", v19);
    int v21 = ![(TIKeyboardInputManager *)self stringEndsWord:v19];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      BOOL v12 = v21;
    }
    else {
      BOOL v12 = 1;
    }

    goto LABEL_20;
  }
  BOOL v12 = 0;
LABEL_21:

  return v12;
}

- (_NSRange)rangeOfUnclosedQuoteMatchingQuote:(id)a3 inString:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if (![v9 length]) {
    goto LABEL_5;
  }
  unsigned int v11 = [v9 characterAtIndex:0];
  unsigned int v46 = v11;
  if (v11 == 34)
  {
    int v21 = [(TIKeyboardInputManager *)self smartOptions];
    uint64_t v22 = [v21 rightDoubleQuote];
    BOOL v23 = [v22 length] != 1;

    char v24 = [(TIKeyboardInputManager *)self smartOptions];
    int v25 = [v24 leftDoubleQuote];
    unsigned int v14 = [v25 characterAtIndex:0];

    uint64_t v15 = [(TIKeyboardInputManager *)self smartOptions];
    uint64_t v16 = [v15 rightDoubleQuote];
    uint64_t v17 = v16;
    BOOL v18 = v23;
    goto LABEL_7;
  }
  if (v11 != 39)
  {
LABEL_5:
    NSUInteger v19 = 0;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  BOOL v12 = [(TIKeyboardInputManager *)self smartOptions];
  uint64_t v13 = [v12 leftSingleQuote];
  unsigned int v14 = [v13 characterAtIndex:0];

  uint64_t v15 = [(TIKeyboardInputManager *)self smartOptions];
  uint64_t v16 = [v15 rightSingleQuote];
  uint64_t v17 = v16;
  BOOL v18 = 0;
LABEL_7:
  unsigned int v26 = [v16 characterAtIndex:v18];

  unsigned int v27 = v46;
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", v46, 1);
  objc_msgSend(v28, "addCharactersInRange:", v14, 1);
  objc_msgSend(v28, "addCharactersInRange:", v26, 1);
  id v42 = v9;
  if (length)
  {
    NSUInteger v43 = location + length;
    uint64_t v44 = self;
    NSUInteger v45 = location;
    do
    {
      uint64_t v29 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v28, 6, location, length);
      if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v20 = v29;
      NSUInteger v19 = v30;
      int v31 = [v10 characterAtIndex:v29];
      if (v31 == v14) {
        goto LABEL_24;
      }
      if (v31 == v26) {
        break;
      }
      if (v31 == v27)
      {
        NSUInteger length = v20 - location;
        if (v20 <= location)
        {
          int v35 = 1;
        }
        else
        {
          uint64_t v32 = [v10 rangeOfComposedCharacterSequenceAtIndex:v20 - 1];
          int v34 = objc_msgSend(v10, "substringWithRange:", v32, v33);
          int v35 = [(TIKeyboardInputManager *)v44 stringEndsWord:v34];
        }
        if (v20 + v19 >= v43)
        {
          int v39 = 0;
          NSUInteger location = v45;
        }
        else
        {
          uint64_t v36 = objc_msgSend(v10, "rangeOfComposedCharacterSequenceAtIndex:");
          uint64_t v38 = objc_msgSend(v10, "substringWithRange:", v36, v37);
          int v39 = ![(TIKeyboardInputManager *)v44 stringEndsWord:v38];

          NSUInteger location = v45;
          if (v35 & v39) {
            goto LABEL_24;
          }
        }
        if ((v35 | v39) != 1) {
          break;
        }
        unsigned int v27 = v46;
      }
    }
    while (length);
  }
  NSUInteger v19 = 0;
  unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  id v9 = v42;
LABEL_25:

  NSUInteger v40 = v20;
  NSUInteger v41 = v19;
  result.NSUInteger length = v41;
  result.NSUInteger location = v40;
  return result;
}

- (BOOL)shouldAutocapitalizePredictionAfterSpace
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  int v4 = [v3 autocapitalizationEnabled];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v6 = [v5 autocapitalizationType];

  BOOL result = 1;
  if (v6 == 1 || v6 == 3) {
    return result;
  }
  if (v6 != 2) {
    return 0;
  }

  return [(TIKeyboardInputManager *)self spaceAndNextInputWouldStartSentence];
}

- (BOOL)shouldGenerateSuggestionsForSelectedText
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  int v4 = [v3 documentState];
  uint64_t v5 = [v4 selectedText];

  if ((unint64_t)([v5 length] - 1) > 0x3F)
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v7 = [v6 currentWord];
    char v8 = [v7 isEqualToString:v5];
  }
  return v8;
}

- (void)reconcileCandidates:(void *)a3 forTypedString:(String *)a4 withPhraseCandidate:(void *)a5 replacing:(const String *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned __int16 var2 = a4->var2;
  if (!var2)
  {
    KB::String::compute_length(&a4->var0);
    unsigned __int16 var2 = a4->var2;
  }
  unsigned __int16 v11 = a6->var2;
  if (!v11)
  {
    KB::String::compute_length(&a6->var0);
    unsigned __int16 v11 = a6->var2;
  }
  int v12 = (__int16)(var2 - v11);
  if (v12 < 1)
  {
    if (v12 < 0)
    {
      KB::String::operator=((KB::String *)a4, (KB::String *)a6);
      uint64_t v17 = *(void *)a3;
      for (uint64_t i = *((void *)a3 + 1); i != v17; KB::Candidate::~Candidate((KB::Candidate *)(i - 1000)))
        ;
      *((void *)a3 + 1) = v17;
    }
  }
  else
  {
    if (a4->var4) {
      var4 = a4->var4;
    }
    else {
      var4 = a4->var5;
    }
    uint64_t v22 = var4;
    int var0 = a4->var0;
    int v23 = 0;
    int v24 = var0;
    int v25 = 0;
    KB::String::iterator::initialize((uint64_t *)&v22);
    *(void *)&long long v18 = var4;
    DWORD2(v18) = 0;
    HIDWORD(v18) = var0;
    LODWORD(v19) = 0;
    KB::String::iterator::initialize((uint64_t *)&v18);
    long long v20 = v18;
    uint64_t v21 = v19;
    std::__advance[abi:nn180100]<KB::String::iterator>((KB::String::iterator *)&v20, (unsigned __int16)v12);
    uint64_t v15 = (unsigned __int16 *)KB::String::String((KB::String *)v26, (const KB::String::iterator *)&v22, (const KB::String::iterator *)&v20);
    KB::String::append(v15, (const KB::String *)a6);
    KB::Candidate::Candidate((KB::Candidate *)&v22, (const KB::String *)v26, 0);
    KB::Candidate::operator=((uint64_t *)a5, (uint64_t *)&v22);
    KB::Candidate::~Candidate((KB::Candidate *)&v22);
    if (v27)
    {
      if (v26[6] == 1) {
        free(v27);
      }
    }
  }
}

- (id)autocorrectionListForSelectedText
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  int v4 = [v3 documentState];
  uint64_t v5 = [v4 selectedText];

  uint64_t v6 = [(TIKeyboardInputManager *)self autocorrectionListsForWordsInDocument];
  uint64_t v7 = [v6 objectForKey:v5];

  if (!v7
    || ([(TIKeyboardInputManager *)self keyboardState],
        char v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 shiftState],
        v8,
        v9 != 2)
    && (v9 || [(TIKeyboardInputManager *)self nextInputWouldStartSentence]))
  {
    m_impl = (TIInputManager *)self->m_impl;
    unsigned __int16 v11 = [(TIKeyboardInputManager *)self externalStringToInternal:v5];
    KB::utf8_string(v11, (uint64_t)v14);
    TIInputManager::candidates_for_string(m_impl, (const KB::String *)v14, [(TIKeyboardInputManager *)self shiftContext]);
  }
  id v12 = v7;

  return v12;
}

uint64_t __59__TIKeyboardInputManager_autocorrectionListForSelectedText__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 candidate];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (id)cachedAutocorrectionListResponseFor:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  id v6 = v4;
  KB::String::String((KB::String *)v12, (const char *)[v6 UTF8String]);
  KB::DynamicDictionary::word_from_supplemental_lexicon(*(void *)(*((void *)self->m_impl + 28) + 24), v10);
  if (v11)
  {
    uint64_t v7 = 0;
LABEL_6:
    KB::Word::~Word((KB::Word *)v10);
    goto LABEL_7;
  }
  char v8 = [(TIKeyboardInputManager *)self autocorrectionListsForWordsInDocument];
  uint64_t v7 = [v8 objectForKey:v6];

  if (v11) {
    goto LABEL_6;
  }
LABEL_7:
  if (v13 && v12[6] == 1) {
    free(v13);
  }
LABEL_10:

  return v7;
}

- (void)generateCannedResponseCandidatesAsyncForString:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = +[TIResponseKitManager sharedTIResponseKitManager];
  char v8 = [(TIKeyboardInputManagerBase *)self inputMode];
  int v9 = [v8 normalizedIdentifier];
  id v10 = [(TIKeyboardInputManager *)self keyboardState];
  char v11 = [v10 clientIdentifier];
  id v12 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v13 = [v12 recipientIdentifier];
  BYTE2(v14) = 1;
  LOWORD(v14) = 1;
  objc_msgSend(v15, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v7, v9, v11, v13, 0, 10, v14, v6);
}

- (id)cannedResponseCandidatesForString:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11289;
  long long v20 = __Block_byref_object_dispose__11290;
  id v21 = 0;
  id v4 = a3;
  uint64_t v5 = +[TIResponseKitManager sharedTIResponseKitManager];
  id v6 = [(TIKeyboardInputManagerBase *)self inputMode];
  id v7 = [v6 normalizedIdentifier];
  char v8 = [(TIKeyboardInputManager *)self keyboardState];
  int v9 = [v8 clientIdentifier];
  id v10 = [(TIKeyboardInputManager *)self keyboardState];
  char v11 = [v10 recipientIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__TIKeyboardInputManager_cannedResponseCandidatesForString___block_invoke;
  v15[3] = &unk_1E6E2C090;
  v15[4] = &v16;
  BYTE2(v14) = 0;
  LOWORD(v14) = 1;
  objc_msgSend(v5, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v4, v7, v9, v11, 0, 10, v14, v15);

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __60__TIKeyboardInputManager_cannedResponseCandidatesForString___block_invoke(uint64_t a1, void *a2)
{
}

- (void)updateResponseModelForKeyboardState:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = (void *)v4;
    uint64_t v4 = [(id)v4 secureTextEntry];
    uint64_t v5 = (uint64_t)v7;
    if ((v4 & 1) == 0)
    {
      uint64_t v4 = (uint64_t)TI_DEVICE_UNLOCKED_SINCE_BOOT();
      uint64_t v5 = (uint64_t)v7;
      if (v4)
      {
        id v6 = [v7 inputContextHistory];
        [(TIKeyboardInputManager *)self synchronizeConversationHistoryWithInputContextHistory:v6];

        uint64_t v5 = (uint64_t)v7;
      }
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)shouldAllowContextWord:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  m_impl = self->m_impl;
  if (m_impl && (uint64_t v6 = m_impl[28]) != 0 && **(void **)(v6 + 8) != *(void *)(*(void *)(v6 + 8) + 8))
  {
    id v7 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v4];
    KB::utf8_string(v7, (uint64_t)v17);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    KB::DictionaryContainer::derive_static_words(*((KB::DictionaryContainer **)self->m_impl + 28), &v13, v17);
    if (v13 == v14)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v8 = v13 + 240;
      do
      {
        BOOL v9 = (*(_DWORD *)(v8 - 136) & 0x38000000) == 0;
        BOOL v10 = (*(_DWORD *)(v8 - 136) & 0x38000000) != 0 || v8 == v14;
        v8 += 240;
      }
      while (!v10);
    }
    uint64_t v16 = (void **)&v13;
    std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&v16);
    if (v19) {
      BOOL v11 = v18 == 1;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      free(v19);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldDropInputStem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  m_impl = self->m_impl;
  if (!m_impl
    || !m_impl[29]
    || [(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled])
  {
    return 1;
  }
  uint64_t v6 = [(TIKeyboardInputManager *)self inputStem];
  id v7 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v6];
  KB::utf8_string(v7, (uint64_t)v8);

  char v4 = (*(uint64_t (**)(void))(**((void **)self->m_impl + 29) + 504))();
  if (v9 && v8[6] == 1) {
    free(v9);
  }
  return v4;
}

- (BOOL)suggestionBlocklistMatchesStrings:(id)a3
{
  id v4 = a3;
  m_impl = self->m_impl;
  if (m_impl && (uint64_t v6 = *((void *)m_impl + 29)) != 0)
  {
    id v7 = (std::__shared_weak_count *)*((void *)m_impl + 30);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if ((*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6))
    {
      cntrl = self->m_lightweight_language_model.__cntrl_;
      self->m_lightweight_language_model.__ptr_ = 0;
      self->m_lightweight_language_model.__cntrl_ = 0;
      if (cntrl) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
      }
    }
    else
    {
      [(TIKeyboardInputManager *)self loadedLightweightLanguageModel];
      uint64_t v6 = v14;
      uint64_t v10 = v15;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v7);
      }
      id v7 = v10;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3321888768;
    v12[2] = __60__TIKeyboardInputManager_suggestionBlocklistMatchesStrings___block_invoke;
    v12[3] = &unk_1F3F75A80;
    v12[4] = self;
    v12[5] = v6;
    uint64_t v13 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v9 = [v4 indexOfObjectPassingTest:v12] != 0x7FFFFFFFFFFFFFFFLL;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __60__TIKeyboardInputManager_suggestionBlocklistMatchesStrings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryStringForExternalString:v4];
  KB::utf8_string(v5, (uint64_t)v23);

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (unint64_t *)operator new(8uLL);
  *id v7 = 0x100000000;
  std::string::basic_string[abi:nn180100]<0>(&v21, "");
  v12[0] = (std::string *)operator new(0x18uLL);
  v12[2] = v12[0] + 1;
  v12[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(&v21, v23, v12[0]);
  KB::LanguageModelContext::LanguageModelContext((uint64_t)v13, v7, 1, (uint64_t)v12[0]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40) + 224;
  BOOL v9 = *(uint64_t (**)(uint64_t, long long *, uint64_t, unsigned char *, uint64_t, uint64_t))(*(void *)v6 + 496);

  uint64_t v10 = v9(v6, v23, 0xFFFFFFFFLL, v13, v8, 1);
  uint64_t v20 = (std::string **)&v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v20);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v18);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v17);
  if (__p)
  {
    uint64_t v16 = __p;
    operator delete(__p);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  }
  uint64_t v20 = v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v20);
  if (v22 < 0) {
    operator delete((void *)v21);
  }
  operator delete(v7);
  if (*((void *)&v23[0] + 1) && BYTE6(v23[0]) == 1) {
    free(*((void **)&v23[0] + 1));
  }
  return v10;
}

- (BOOL)usesRetrocorrection
{
  if (![(TIKeyboardInputManager *)self usesCandidateSelection]
    && (m_impl = self->m_impl) != 0
    && *((unsigned char *)m_impl + 690))
  {
    uint64_t v4 = m_impl[29];
    if (v4)
    {
      LODWORD(v4) = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
      if (v4)
      {
        LODWORD(v4) = (*(uint64_t (**)(void))(*(void *)m_impl[29] + 32))(m_impl[29]);
        if (v4) {
          LOBYTE(v4) = *(void *)(m_impl[28] + 32) == 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)shortcutConversionForInput:(id)a3 andExistingString:(id)a4 existingStringStartsInMiddleOfWord:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [(TIKeyboardInputManager *)self externalStringToInternal:a4];
  uint64_t v10 = [v9 stringByAppendingString:v8];

  BOOL v11 = [(TIKeyboardInputManager *)self internalStringToExternal:v10];

  id v12 = [(TIKeyboardInputManager *)self shortcutConversionForString:v11 stringStartsInMiddleOfWord:v5];

  return v12;
}

- (id)shortcutConversionForString:(id)a3 stringStartsInMiddleOfWord:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11289;
  uint64_t v20 = __Block_byref_object_dispose__11290;
  id v21 = 0;
  uint64_t v7 = [(TIKeyboardInputManager *)self shortcutSearchRangeForString:v6];
  if (v8 < 0x41)
  {
    uint64_t v9 = v7;
    unint64_t v10 = v8;
    if (!v7 && v4)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FAE4F8]);
      objc_msgSend(v11, "setString:withSearchRange:", v6, 0, v10);
      if ([v11 advanceToNextToken])
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = v12;
        unint64_t v10 = [v6 length] - v12;
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__TIKeyboardInputManager_shortcutConversionForString_stringStartsInMiddleOfWord___block_invoke;
    v15[3] = &unk_1E6E2C068;
    v15[4] = self;
    void v15[5] = &v16;
    -[TIKeyboardInputManager enumerateWordSuffixesOfString:inRange:usingBlock:](self, "enumerateWordSuffixesOfString:inRange:usingBlock:", v6, v9, v10, v15);
  }
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __81__TIKeyboardInputManager_shortcutConversionForString_stringStartsInMiddleOfWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  unint64_t v8 = *(TIInputManager **)(*(void *)(a1 + 32) + 40);
  KB::utf8_string(v7, (uint64_t)v16);
  TIInputManager::conversion_for_shortcut(v8, (const KB::String *)v16, (KB::Word *)v18);
  if (v17) {
    BOOL v9 = v16[6] == 1;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    free(v17);
  }
  if (v18[0])
  {
    id v10 = objc_alloc(MEMORY[0x1E4FAE3F0]);
    uint64_t v12 = KB::ns_string((KB *)v18, v11);
    uint64_t v13 = [v10 initWithCandidate:v12 forInput:v7];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a5 = 1;
  }
  KB::Word::~Word((KB::Word *)v18);
}

- (_NSRange)shortcutSearchRangeForString:(id)a3
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28B88];
    id v5 = a3;
    id v6 = [v4 whitespaceAndNewlineCharacterSet];
    uint64_t v7 = [v5 rangeOfCharacterFromSet:v6 options:4];
    uint64_t v9 = v8;

    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = v7 + v9;
    }
    uint64_t v10 = [v5 length];

    NSUInteger v11 = v10 - v3;
  }
  else
  {
    NSUInteger v11 = 0;
  }
  NSUInteger v12 = v3;
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

- (BOOL)shouldSkipShortcutConversionForDocumentState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 selectedText];

  if (v4 || ([v3 markedText], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v8 = [v3 contextAfterInput];
    if ([v8 length])
    {
      uint64_t v9 = [v3 contextAfterInput];
      uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      BOOL v6 = [v9 rangeOfCharacterFromSet:v10] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)enumerateWordSuffixesOfString:(id)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  if (length)
  {
    uint64_t v29 = 0;
    NSUInteger v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    NSUInteger v10 = location + length;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    int v23 = __75__TIKeyboardInputManager_enumerateWordSuffixesOfString_inRange_usingBlock___block_invoke;
    uint64_t v24 = &unk_1E6E2C040;
    NSUInteger v28 = location + length;
    id v11 = v8;
    id v25 = v11;
    id v26 = v9;
    unsigned int v27 = &v29;
    NSUInteger v12 = (void (**)(void *, void, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t *))_Block_copy(&v21);
    id v13 = objc_alloc_init(MEMORY[0x1E4FAE4F8]);
    objc_msgSend(v13, "setString:withSearchRange:", v11, location, length, v21, v22, v23, v24);
    uint64_t v14 = [v13 advanceToNextToken];
    if (v15)
    {
      unint64_t v16 = v14;
      uint64_t v17 = v15;
      do
      {
        if (v16 <= location)
        {
          uint64_t v18 = v30;
        }
        else
        {
          objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", location, v16 - location, 514, v12);
          uint64_t v18 = v30;
          if (*((unsigned char *)v30 + 24)) {
            break;
          }
        }
        v12[2](v12, 0, v16, v17, v16, v17, v18 + 3);
        if (*((unsigned char *)v30 + 24)) {
          break;
        }
        NSUInteger location = v16 + v17;
        unint64_t v16 = [v13 advanceToNextToken];
        uint64_t v17 = v19;
      }
      while (v19);
    }
    if (*((unsigned char *)v30 + 24)) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v10 > location;
    }
    if (v20) {
      objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", location, v10 - location, 514, v12);
    }

    _Block_object_dispose(&v29, 8);
  }
}

void __75__TIKeyboardInputManager_enumerateWordSuffixesOfString_inRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *a7 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (BOOL)supportsShortcutConversion
{
  return 1;
}

- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5 insertingSpace:(BOOL)a6 sharedPrefixLength:(unint64_t)a7
{
  BOOL v8 = a6;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  KB::Candidate::capitalized_string((KB::Candidate *)a5, (uint64_t)v121);
  uint64_t v15 = KB::ns_string((KB *)v121, v14);
  if (v122) {
    BOOL v16 = v121[6] == 1;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    free(v122);
  }
  uint64_t v17 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  int v18 = [v17 shouldConvertCandidateToExternal];

  if (v18)
  {
    uint64_t v19 = [(TIKeyboardInputManager *)self internalStringToExternal:v15];

    uint64_t v15 = (void *)v19;
  }
  if (v8)
  {
    id v20 = v15;
    uint64_t v21 = [(TIKeyboardInputManager *)self wordSeparator];
    uint64_t v15 = [v21 stringByAppendingString:v20];
    id v119 = v20;
  }
  else
  {
    id v119 = 0;
  }
  unint64_t v22 = a7;
  if (a7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    a7 = [(TIKeyboardInputManager *)self prefixLengthOfInput:v12 sharedWithCandidate:a5];
    int v23 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    unint64_t v22 = a7;
    if (([v23 shouldConvertCandidateToExternal] & 1) == 0) {
      unint64_t v22 = [(TIKeyboardInputManager *)self prefixLengthOfInput:v12 sharedWithCandidate:a5 useCandidateLength:1];
    }
  }
  if (a7)
  {
    uint64_t v24 = [v12 substringFromIndex:a7];

    id v12 = (id)v24;
  }
  if (v22 && v22 < [v15 length])
  {
    uint64_t v25 = [v15 substringFromIndex:v22];

    uint64_t v15 = (void *)v25;
  }
  id v26 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  unint64_t v120 = self;
  if ([v26 shouldConvertAutocorrectionCandidatesToFullWidth])
  {
    unsigned int v27 = [v12 _lastGrapheme];
    if ([v27 _containsFullwidthLettersAndNumbers])
    {
    }
    else
    {
      [(TIKeyboardInputManager *)self keyboardState];
      unint64_t v118 = v15;
      id v28 = v12;
      v30 = id v29 = v13;
      uint64_t v31 = [v30 layoutState];
      char v32 = [v31 layoutTag];
      int v33 = [v32 isEqualToString:@"Fullwidth"];

      id v13 = v29;
      id v12 = v28;
      uint64_t v15 = v118;

      if (!v33) {
        goto LABEL_27;
      }
    }
    [v15 _stringByConvertingFromHalfWidthToFullWidth];
    uint64_t v15 = v26 = v15;
  }

LABEL_27:
  if ((*(_DWORD *)a5 & 0xFFFFFFFE) != 0) {
    unsigned int v34 = KB::Candidate::index_of_word_containing_position((KB::Candidate *)a5, a7);
  }
  else {
    unsigned int v34 = 0;
  }
  int v35 = [v15 isEqualToString:v12] ^ 1;
  uint64_t v36 = v34;
  uint64_t v38 = *(void *)a5;
  uint64_t v37 = *((void *)a5 + 1);
  uint64_t v39 = v37 + 240 * v34;
  uint64_t v40 = v37 + 240 * *(void *)a5;
  if (*(void *)a5 == v34)
  {
    if (v39 != v40) {
      v35 |= 2u;
    }
LABEL_43:
    if (v39 != v40) {
      v35 |= 4u;
    }
LABEL_45:
    if (v39 != v40) {
      v35 |= 0x40u;
    }
LABEL_47:
    if (v39 != v40) {
      v35 |= 0x100u;
    }
LABEL_49:
    if (v39 != v40) {
      v35 |= 0x200u;
    }
LABEL_51:
    if (v39 == v40) {
      int v44 = v35;
    }
    else {
      int v44 = v35 | 0x2000;
    }
    goto LABEL_54;
  }
  uint64_t v41 = 240 * v38 - 240 * v34;
  uint64_t v42 = v37 + 240 * v34;
  while (!*(_DWORD *)(v42 + 120) || (*(_DWORD *)(v42 + 104) & 0x100000) != 0)
  {
    v42 += 240;
    v41 -= 240;
    if (!v41)
    {
      uint64_t v42 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v42 != v40) {
    v35 |= 2u;
  }
  if (v38 == v34) {
    goto LABEL_43;
  }
  uint64_t v76 = 240 * v38 - 240 * v34;
  uint64_t v77 = v37 + 240 * v34;
  while ((*(unsigned char *)(v77 + 106) & 0x20) == 0)
  {
    v77 += 240;
    v76 -= 240;
    if (!v76)
    {
      uint64_t v77 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v77 != v40) {
    v35 |= 4u;
  }
  if (v38 == v34) {
    goto LABEL_45;
  }
  uint64_t v78 = 240 * v38 - 240 * v34;
  uint64_t v79 = v37 + 240 * v34;
  while ((*(unsigned char *)(v79 + 107) & 1) == 0)
  {
    v79 += 240;
    v78 -= 240;
    if (!v78)
    {
      uint64_t v79 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v79 != v40) {
    v35 |= 0x40u;
  }
  if (v38 == v34) {
    goto LABEL_47;
  }
  uint64_t v80 = 240 * v38 - 240 * v34;
  uint64_t v81 = v37 + 240 * v34;
  while ((*(unsigned char *)(v81 + 107) & 4) == 0)
  {
    v81 += 240;
    v80 -= 240;
    if (!v80)
    {
      uint64_t v81 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v81 != v40) {
    v35 |= 0x100u;
  }
  if (v38 == v34) {
    goto LABEL_49;
  }
  uint64_t v82 = 240 * v38 - 240 * v34;
  uint64_t v83 = v37 + 240 * v34;
  while ((*(_DWORD *)(v83 + 104) & 0x2040000) != 0x2000000)
  {
    v83 += 240;
    v82 -= 240;
    if (!v82)
    {
      uint64_t v83 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v83 != v40) {
    v35 |= 0x200u;
  }
  if (v38 == v34) {
    goto LABEL_51;
  }
  uint64_t v84 = 240 * v38 - 240 * v34;
  while ((*(unsigned char *)(v39 + 105) & 1) == 0)
  {
    v39 += 240;
    v84 -= 240;
    if (!v84)
    {
      uint64_t v39 = v37 + 240 * *(void *)a5;
      break;
    }
  }
  if (v39 == v40) {
    int v44 = v35;
  }
  else {
    int v44 = v35 | 0x2000;
  }
  if (v38 != v34)
  {
    uint64_t v85 = -240 * v34 + 240 * v38 - 240;
    v86 = (uint64_t *)(240 * v34 + v37 + 224);
    do
    {
      uint64_t v88 = *v86;
      v86 += 30;
      uint64_t v87 = v88;
      if (v88) {
        BOOL v89 = 1;
      }
      else {
        BOOL v89 = v85 == 0;
      }
      v85 -= 240;
    }
    while (!v89);
    if (v87) {
      v44 |= 0x100000u;
    }
  }
LABEL_54:
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 2)) {
    v44 |= 0x400u;
  }
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 4)) {
    v44 |= 0x800u;
  }
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 8)) {
    v44 |= 0x1000u;
  }
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 16)) {
    v44 |= 0x4000u;
  }
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 32)) {
    v44 |= 0x8000u;
  }
  BOOL has_error_correction_type = KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v34, 64);
  int v46 = v44 | 0x10000;
  if (!has_error_correction_type) {
    int v46 = v44;
  }
  unsigned int v47 = v46 | *(_WORD *)(*((void *)a5 + 1) + 240 * *(void *)a5 - 134) & 8;
  uint64_t v48 = [v12 rangeOfString:@" "];
  unint64_t v49 = [v15 rangeOfString:@" "];
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v49 < [v12 length]) {
        v47 |= 0x10u;
      }
      else {
        v47 |= 0x80u;
      }
    }
  }
  else
  {
    if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
      int v50 = 2097184;
    }
    else {
      int v50 = 32;
    }
    v47 |= v50;
  }
  uint64_t v51 = *(void *)a5;
  uint64_t v52 = *((void *)a5 + 1);
  if (*(void *)a5)
  {
    long long v53 = (unsigned __int8 *)(v52 + 192);
    uint64_t v54 = 240 * v51;
    while (1)
    {
      int v55 = *v53;
      v53 += 240;
      if (v55) {
        break;
      }
      v54 -= 240;
      if (!v54) {
        goto LABEL_81;
      }
    }
    v47 |= 0x40000u;
  }
LABEL_81:
  uint64_t v56 = v52 + 240 * v51;
  if (*((unsigned char *)a5 + 960)) {
    uint64_t v57 = v47 | 0x20000;
  }
  else {
    uint64_t v57 = v47;
  }
  uint64_t v58 = v52 + 240 * v36;
  if (v51 == v36)
  {
    int v59 = (v58 != v56) << 15;
LABEL_92:
    if (v58 == v56) {
      int v62 = v59;
    }
    else {
      int v62 = v59 | 0x20000;
    }
LABEL_95:
    if (v58 != v56) {
      v62 |= 0x10000u;
    }
LABEL_97:
    if (v58 == v56) {
      int v63 = v62;
    }
    else {
      int v63 = v62 | 0x40000;
    }
LABEL_100:
    if (v58 != v56) {
      v63 |= 4u;
    }
LABEL_102:
    if (v58 != v56) {
      v63 |= 8u;
    }
LABEL_104:
    if (v58 != v56) {
      v63 |= 0x10u;
    }
LABEL_106:
    if (v58 != v56) {
      v63 |= 0x800u;
    }
LABEL_108:
    if (v58 == v56) {
      int v64 = v63;
    }
    else {
      int v64 = v63 | 0x20;
    }
LABEL_111:
    if (v58 != v56) {
      v64 |= 0x80u;
    }
LABEL_113:
    if (v58 != v56) {
      v64 |= 0x100u;
    }
    goto LABEL_115;
  }
  uint64_t v60 = 240 * v51 - 240 * v36;
  uint64_t v61 = v52 + 240 * v36;
  while ((*(unsigned char *)(v61 + 106) & 4) == 0 || *(unsigned char *)(v61 + 192))
  {
    v61 += 240;
    v60 -= 240;
    if (!v60)
    {
      uint64_t v61 = v52 + 240 * v51;
      break;
    }
  }
  int v59 = (v61 != v56) << 15;
  if (v51 == v36) {
    goto LABEL_92;
  }
  uint64_t v90 = 240 * v51 - 240 * v36;
  uint64_t v91 = v52 + 240 * v36;
  while ((*(unsigned char *)(v91 + 106) & 4) == 0 || !*(unsigned char *)(v91 + 192))
  {
    v91 += 240;
    v90 -= 240;
    if (!v90)
    {
      uint64_t v91 = v52 + 240 * v51;
      break;
    }
  }
  if (v91 == v56) {
    int v62 = v59;
  }
  else {
    int v62 = v59 | 0x20000;
  }
  if (v51 == v36) {
    goto LABEL_95;
  }
  uint64_t v92 = 240 * v51 - 240 * v36;
  uint64_t v93 = v52 + 240 * v36;
  while ((*(_DWORD *)(v93 + 104) & 0x80032000) == 0 || *(unsigned char *)(v93 + 192) != 0)
  {
    v93 += 240;
    v92 -= 240;
    if (!v92)
    {
      uint64_t v93 = v52 + 240 * v51;
      break;
    }
  }
  if (v93 != v56) {
    v62 |= 0x10000u;
  }
  if (v51 == v36) {
    goto LABEL_97;
  }
  uint64_t v95 = 240 * v51 - 240 * v36;
  uint64_t v96 = v52 + 240 * v36;
  while ((*(_DWORD *)(v96 + 104) & 0x80032000) == 0 || *(unsigned char *)(v96 + 192) == 0)
  {
    v96 += 240;
    v95 -= 240;
    if (!v95)
    {
      uint64_t v96 = v52 + 240 * v51;
      break;
    }
  }
  int v63 = v62 | 0x40000;
  if (v96 == v56) {
    int v63 = v62;
  }
  if (v51 == v36) {
    goto LABEL_100;
  }
  uint64_t v98 = 240 * v51 - 240 * v36;
  uint64_t v99 = v52 + 240 * v36;
  while ((*(unsigned char *)(v99 + 106) & 1) == 0)
  {
    v99 += 240;
    v98 -= 240;
    if (!v98)
    {
      uint64_t v99 = v52 + 240 * v51;
      break;
    }
  }
  if (v99 != v56) {
    v63 |= 4u;
  }
  if (v51 == v36) {
    goto LABEL_102;
  }
  uint64_t v100 = 240 * v51 - 240 * v36;
  uint64_t v101 = v52 + 240 * v36;
  while ((*(unsigned char *)(v101 + 106) & 2) == 0)
  {
    v101 += 240;
    v100 -= 240;
    if (!v100)
    {
      uint64_t v101 = v52 + 240 * v51;
      break;
    }
  }
  if (v101 != v56) {
    v63 |= 8u;
  }
  if (v51 == v36) {
    goto LABEL_104;
  }
  uint64_t v102 = 240 * v51 - 240 * v36;
  uint64_t v103 = v52 + 240 * v36;
  while ((*(unsigned char *)(v103 + 105) & 1) == 0)
  {
    v103 += 240;
    v102 -= 240;
    if (!v102)
    {
      uint64_t v103 = v52 + 240 * v51;
      break;
    }
  }
  if (v103 != v56) {
    v63 |= 0x10u;
  }
  if (v51 == v36) {
    goto LABEL_106;
  }
  uint64_t v104 = 240 * v51 - 240 * v36;
  uint64_t v105 = v52 + 240 * v36;
  while ((*(_DWORD *)(v105 + 104) & 0x80000000) == 0)
  {
    v105 += 240;
    v104 -= 240;
    if (!v104)
    {
      uint64_t v105 = v52 + 240 * v51;
      break;
    }
  }
  if (v105 != v56) {
    v63 |= 0x800u;
  }
  if (v51 == v36) {
    goto LABEL_108;
  }
  uint64_t v106 = -240 * v36 + 240 * v51 - 240;
  unint64_t v107 = (uint64_t *)(240 * v36 + v52 + 224);
  do
  {
    uint64_t v109 = *v107;
    v107 += 30;
    uint64_t v108 = v109;
    if (v109) {
      BOOL v110 = 1;
    }
    else {
      BOOL v110 = v106 == 0;
    }
    v106 -= 240;
  }
  while (!v110);
  if (v108) {
    v63 |= 0x400u;
  }
  if (v51 == v36) {
    goto LABEL_108;
  }
  uint64_t v111 = 240 * v51 - 240 * v36;
  uint64_t v112 = v58;
  while ((*(unsigned char *)(v112 + 106) & 0x80) == 0)
  {
    v112 += 240;
    v111 -= 240;
    if (!v111)
    {
      uint64_t v112 = v56;
      break;
    }
  }
  if (v112 == v56) {
    int v64 = v63;
  }
  else {
    int v64 = v63 | 0x20;
  }
  if (v51 == v36) {
    goto LABEL_111;
  }
  uint64_t v113 = 240 * v51 - 240 * v36;
  uint64_t v114 = v58;
  while ((*(unsigned char *)(v114 + 107) & 0x10) == 0)
  {
    v114 += 240;
    v113 -= 240;
    if (!v113)
    {
      uint64_t v114 = v56;
      break;
    }
  }
  if (v114 != v56) {
    v64 |= 0x80u;
  }
  if (v51 == v36) {
    goto LABEL_113;
  }
  uint64_t v115 = 240 * v51 - 240 * v36;
  uint64_t v116 = v58;
  while ((*(unsigned char *)(v116 + 107) & 8) == 0)
  {
    v116 += 240;
    v115 -= 240;
    if (!v115)
    {
      uint64_t v116 = v56;
      break;
    }
  }
  if (v116 != v56) {
    v64 |= 0x100u;
  }
  if (v51 != v36)
  {
    uint64_t v117 = 240 * v51 - 240 * v36;
    while ((*(unsigned char *)(v58 + 107) & 0x20) == 0)
    {
      v58 += 240;
      v117 -= 240;
      if (!v117)
      {
        uint64_t v58 = v56;
        break;
      }
    }
  }
LABEL_115:
  if (v58 == v56) {
    unsigned int v65 = v64;
  }
  else {
    unsigned int v65 = v64 | 0x200;
  }
  if (*((unsigned char *)a5 + 963)) {
    uint64_t v66 = v65 | 0x1000;
  }
  else {
    uint64_t v66 = v65;
  }
  v67 = (void *)[objc_alloc(MEMORY[0x1E4FAE500]) initWithCandidate:v15 forInput:v12 rawInput:v13 wordOriginFeedbackID:*((unsigned int *)a5 + 194) usageTrackingMask:v57 sourceMask:v66 learningFlagsMask:*((unsigned __int8 *)a5 + 963)];
  v68 = v67;
  uint64_t v69 = *(void *)a5;
  if (*(void *)a5)
  {
    uint64_t v70 = 240 * v69;
    uint64_t v71 = *((void *)a5 + 1);
    uint64_t v73 = v119;
    int v72 = v120;
    while ((*(unsigned char *)(v71 + 105) & 0x80) == 0)
    {
      v71 += 240;
      v70 -= 240;
      if (!v70) {
        goto LABEL_129;
      }
    }
  }
  else
  {
    uint64_t v71 = *((void *)a5 + 1);
    uint64_t v73 = v119;
    int v72 = v120;
  }
  if (v71 != *((void *)a5 + 1) + 240 * v69) {
    [v67 setIsFromTextChecker:1];
  }
LABEL_129:
  if (v72->_supplementalPrefix) {
    objc_msgSend(v68, "core_updateWithSupplementalItemPrefix:");
  }
  if (v36 >= *(_DWORD *)a5)
  {
    [v68 setSupplementalItemIdentifiers:MEMORY[0x1E4F1CBF0]];
    if (!v73) {
      goto LABEL_136;
    }
    goto LABEL_135;
  }
  BOOL v74 = KB::createNSArray<std::unordered_set<unsigned long long> const&>(*((void *)a5 + 1) + 240 * v36 + 200);
  [v68 setSupplementalItemIdentifiers:v74];

  if (v73) {
LABEL_135:
  }
    [v68 setLabel:v73];
LABEL_136:
  [v68 setTypingEngine:*((unsigned int *)a5 + 248)];
  populateAutocorrectionAccuracyFields(v68, (float *)a5);

  return v68;
}

- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5
{
  return [(TIKeyboardInputManager *)self autocorrectionCandidateForInput:a3 rawInput:a4 withCandidate:a5 insertingSpace:0 sharedPrefixLength:0x7FFFFFFFFFFFFFFFLL];
}

- (BOOL)isEditingExistingWord
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_isEditingWordPrefix) {
    return 1;
  }
  m_impl = self->m_impl;
  uint64_t v6 = m_impl[1];
  id v5 = (char *)(m_impl + 1);
  unsigned int v7 = -858993459 * ((unint64_t)(*((void *)v5 + 1) - v6) >> 3);
  if (*((_DWORD *)v5 + 22) >= v7) {
    return 0;
  }
  TIInputManager::input_substring((unsigned __int16 *)v5, 0, v7, (uint64_t)v15);
  id v9 = KB::ns_string((KB *)v15, v8);
  NSUInteger v10 = [(TIKeyboardInputManager *)self internalStringToExternal:v9];

  if (v17 && v16 == 1) {
    free(v17);
  }
  id v11 = (unsigned __int16 *)self->m_impl;
  TIInputManager::input_substring(v11 + 4, 0, -858993459 * ((*((void *)v11 + 2) - *((void *)v11 + 1)) >> 3), (uint64_t)v15);
  KB::utf8_string(v10, (uint64_t)v13);
  char v12 = TIInputManager::dictionary_contains_word((TIInputManager *)v11, (const KB::String *)v15, (const KB::String *)v13, 0);
  if (v14 && v13[6] == 1) {
    free(v14);
  }
  if (v17)
  {
    if (v16 == 1) {
      free(v17);
    }
  }

  return (v12 & 1) != 0;
}

- (id)phraseCandidateCompletedByWord:(const String *)a3 allowNoSuggest:(BOOL)a4 forAutocorrection:(BOOL)a5 shiftContext:(int)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!self->m_impl) {
    goto LABEL_25;
  }
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = [(TIKeyboardInputManager *)self config];
  if (([v11 usesRetrocorrection] & 1) == 0)
  {

    goto LABEL_25;
  }
  int var0 = a3->var0;

  if (!var0)
  {
LABEL_25:
    unsigned int v34 = 0;
    goto LABEL_26;
  }
  int v44 = 0x100000;
  __int16 v45 = 0;
  char v46 = 0;
  unsigned int v47 = 0;
  char v48 = 0;
  TIInputManager::phrase_completed_by_word((uint64_t)self->m_impl, (KB::String *)a3, (KB::String *)&v44, v8, v7, a6, (KB::Candidate *)&v41);
  if (v41)
  {
    uint64_t v14 = KB::ns_string((KB *)&v44, v13);
    uint64_t v15 = [(TIKeyboardInputManager *)self internalStringToExternal:v14];
    char v16 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v17 = [v16 documentState];
    uint64_t v18 = [v17 selectedText];

    if (v18)
    {
      uint64_t v19 = [(TIKeyboardInputManager *)self keyboardState];
      id v20 = [v19 documentState];
      uint64_t v21 = [v20 selectedText];
      uint64_t v22 = [v15 stringByAppendingString:v21];

      uint64_t v15 = (void *)v22;
    }
    KB::Candidate::capitalized_string((KB::Candidate *)&v41, (uint64_t)v39);
    uint64_t v24 = KB::ns_string((KB *)v39, v23);
    uint64_t v25 = [(TIKeyboardInputManager *)self internalStringToExternal:v24];

    if (v40 && v39[6] == 1) {
      free(v40);
    }
    if ((KB::Candidate::is_phrase_from_supplemental_lexicon((KB::Candidate *)&v41) & 1) == 0)
    {
      unint64_t v26 = [(TIKeyboardInputManager *)self prefixLengthOfInput:v15 sharedWithCandidate:&v41];
      if (v26)
      {
        unint64_t v27 = v26;
        if (([v15 isEqualToString:v25] & 1) == 0)
        {
          uint64_t v28 = [v15 substringFromIndex:v27];

          uint64_t v29 = [v25 substringFromIndex:v27];

          uint64_t v25 = (void *)v29;
          uint64_t v15 = (void *)v28;
        }
      }
    }
    if ([v15 rangeOfString:@" "] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = 33;
    }
    if (v41)
    {
      LODWORD(v31) = 0;
      char v32 = v42;
      uint64_t v33 = 240 * v41;
      do
      {
        if ((*((_DWORD *)v32 + 26) & 0x80020100) != 0) {
          uint64_t v30 = v30 | 0x2000;
        }
        else {
          uint64_t v30 = v30;
        }
        KB::Word::Word((KB::Word *)v38, (size_t *)v32);
        uint64_t v31 = [(TIKeyboardInputManager *)self sourceMaskForWord:v38] | v31;
        KB::Word::~Word((KB::Word *)v38);
        char v32 = (KB::Word *)((char *)v32 + 240);
        v33 -= 240;
      }
      while (v33);
    }
    else
    {
      uint64_t v31 = 0;
    }
    id v36 = objc_alloc(MEMORY[0x1E4FAE500]);
    unsigned int v34 = (void *)[v36 initWithCandidate:v25 forInput:v15 rawInput:v14 wordOriginFeedbackID:v43 usageTrackingMask:v30 sourceMask:v31];
    [v34 setIsFromPhraseDictionary:1];
    if (self->_supplementalPrefix) {
      objc_msgSend(v34, "core_updateWithSupplementalItemPrefix:");
    }
    if (v41)
    {
      uint64_t v37 = KB::createNSArray<std::unordered_set<unsigned long long> const&>((uint64_t)v42 + 200);
      [v34 setSupplementalItemIdentifiers:v37];
    }
    else
    {
      [v34 setSupplementalItemIdentifiers:MEMORY[0x1E4F1CBF0]];
    }
    populateAutocorrectionAccuracyFields(v34, (float *)&v41);
  }
  else
  {
    unsigned int v34 = 0;
  }
  KB::Candidate::~Candidate((KB::Candidate *)&v41);
  if (v47 && v46 == 1) {
    free(v47);
  }
LABEL_26:

  return v34;
}

- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4
{
  return [(TIKeyboardInputManager *)self prefixLengthOfInput:a3 sharedWithCandidate:a4 useCandidateLength:0];
}

- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4 useCandidateLength:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__TIKeyboardInputManager_prefixLengthOfInput_sharedWithCandidate_useCandidateLength___block_invoke;
  aBlock[3] = &unk_1E6E2C018;
  aBlock[4] = self;
  id v9 = _Block_copy(aBlock);
  int v40 = 0x100000;
  unsigned __int16 v41 = 0;
  char v42 = 0;
  unsigned int v43 = 0;
  char v44 = 0;
  uint64_t v10 = *(void *)a4;
  unsigned int v34 = (unsigned int (**)(void, void, void))v9;
  unint64_t v11 = 0;
  if (*(void *)a4)
  {
    char v12 = (const KB::String *)*((void *)a4 + 1);
    uint64_t v13 = 240 * v10 - 240;
    uint64_t v14 = &stru_1F3F7A998;
    do
    {
      unint64_t v15 = [(__CFString *)v14 length];
      unsigned int v16 = v41;
      if (!v41)
      {
        KB::String::compute_length((unsigned __int16 *)&v40);
        unsigned int v16 = v41;
      }
      unint64_t v17 = v16;
      if (!v15) {
        goto LABEL_14;
      }
      if (v15 >= [v8 length]) {
        goto LABEL_14;
      }
      unint64_t v18 = v11;
      uint64_t v19 = self;
      BOOL v20 = v5;
      uint64_t v21 = objc_msgSend(v8, "characterAtIndex:");
      uint64_t v22 = [v8 characterAtIndex:v15];
      uint64_t v23 = v21;
      BOOL v5 = v20;
      self = v19;
      unint64_t v11 = v18;
      if (!v34[2](v34, v23, v22)) {
        goto LABEL_14;
      }
      uint64_t v24 = [(__CFString *)v14 characterAtIndex:v15 - 1];
      uint64_t v25 = *((void *)v12 + 1);
      if (!v25) {
        uint64_t v25 = (uint64_t)v12 + 16;
      }
      uint64_t v36 = v25;
      int v26 = *(unsigned __int16 *)v12;
      int v37 = 0;
      int v38 = v26;
      unsigned int v39 = 0;
      KB::String::iterator::initialize(&v36);
      if (v34[2](v34, v24, v39))
      {
        if (v5) {
          unint64_t v11 = v17;
        }
        else {
          unint64_t v11 = v15;
        }
      }
      else
      {
LABEL_14:
        uint64_t v27 = [v8 length];
        if (v5) {
          unint64_t v28 = v17;
        }
        else {
          unint64_t v28 = v15;
        }
        if (v15 == v27) {
          unint64_t v11 = v28;
        }
      }
      KB::String::append((unsigned __int16 *)&v40, v12);
      uint64_t v30 = KB::ns_string((KB *)&v40, v29);
      uint64_t v31 = [(TIKeyboardInputManager *)self internalStringToExternal:v30];

      if (![v8 hasPrefix:v31]) {
        break;
      }
      char v12 = (const KB::String *)((char *)v12 + 240);
      uint64_t v32 = v13;
      v13 -= 240;
      uint64_t v14 = v31;
    }
    while (v32);
  }
  else
  {
    uint64_t v31 = &stru_1F3F7A998;
  }

  if (v43 && v42 == 1) {
    free(v43);
  }

  return v11;
}

BOOL __85__TIKeyboardInputManager_prefixLengthOfInput_sharedWithCandidate_useCandidateLength___block_invoke(uint64_t a1, unsigned __int16 a2, UChar32 c)
{
  if (u_isspace(c) || ((1 << u_charType(c)) & 0x1C0) != 0) {
    return 0;
  }
  id v8 = [*(id *)(a1 + 32) wordCharacters];
  id v9 = [v8 characterSet];

  BOOL v6 = ![v9 characterIsMember:a2]
    || ([v9 characterIsMember:(unsigned __int16)c] & 1) == 0;

  return v6;
}

- (void)checkAutocorrectionDictionaries
{
  uint64_t v3 = *((void *)self->m_impl + 28);
  if (!v3 || **(void **)(v3 + 8) == *(void *)(*(void *)(v3 + 8) + 8))
  {
    [(TIKeyboardInputManager *)self scheduleLinguisticResourceUpdateWithReason:@"Dictionary not loaded"];
    if ([(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled])
    {
      [(TIKeyboardInputManager *)self updateDictionaryAndLanguageModel];
    }
  }
}

- (void)setAutoshiftFromInputContext
{
  if (self->m_impl)
  {
    uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v4 = [v3 autocapitalizationType];

    if (v4)
    {
      if (v4 == 2)
      {
        BOOL v5 = [(TIKeyboardInputManager *)self inputContext];
        LODWORD(v4) = [(TIKeyboardInputManager *)self canStartSentenceAfterString:v5];
      }
      else
      {
        LODWORD(v4) = 1;
      }
    }
    uint64_t v6 = *((void *)self->m_impl + 1);
    if (-858993459 * ((unint64_t)(*((void *)self->m_impl + 2) - v6) >> 3))
    {
      int v7 = *(_DWORD *)(v6 + 32);
      unsigned int v8 = v7 & 0xFFFFFFFD;
      if ((v7 & v4) != 0) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
      *(_DWORD *)(v6 + 32) = v9 | v8;
    }
  }
}

- (BOOL)canStartSentenceAfterString:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  if (v4 && self->m_impl)
  {
    uint64_t v6 = [(TIKeyboardInputManager *)self autoshiftRegexLoader];

    if (v6) {
      goto LABEL_4;
    }
    int v7 = [(TIKeyboardInputManager *)self sentenceDelimitingCharacters];
    unsigned int v8 = [(TIKeyboardInputManager *)self sentenceTrailingCharacters];
    int v9 = [(TIKeyboardInputManager *)self sentencePrefixingCharacters];
    uint64_t v10 = +[TIAutoshiftRegularExpressionLoader loaderWithSentenceDelimiters:v7 trailingChars:v8 prefixChars:v9];
    [(TIKeyboardInputManager *)self setAutoshiftRegexLoader:v10];

    if (![v4 length]) {
      goto LABEL_7;
    }
    if (![v4 hasSuffix:@"\n"])
    {
LABEL_4:
      BOOL v5 = [(TIKeyboardInputManager *)self _canStartSentenceAfterString:v4 maxRecursionDepth:2];
    }
    else
    {
LABEL_7:
      unint64_t v11 = [(TIKeyboardInputManager *)self config];
      char v12 = [v11 isTesting];

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = [(TIKeyboardInputManager *)self autoshiftRegexLoader];
        [v13 startBackgroundLoad];
      }
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (BOOL)_canStartSentenceAfterString:(id)a3 maxRecursionDepth:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(TIKeyboardInputManager *)self autoshiftRegexLoader];
  unsigned int v8 = [v7 regex];

  int v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  char v11 = 1;
  uint64_t v12 = [v9 rangeAtIndex:1];
  if (v13)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v12 + v13;
    uint64_t v16 = v12 + v13 - 1;
    if ([v6 characterAtIndex:v16] != 46) {
      goto LABEL_8;
    }
    if (v16 && [v6 characterAtIndex:v15 - 2] == 46)
    {
LABEL_6:
      char v11 = 0;
      goto LABEL_16;
    }
    if (v16 == v14)
    {
LABEL_8:
      char v11 = 1;
      goto LABEL_16;
    }
    unint64_t v17 = objc_msgSend(v6, "substringWithRange:", v14, v16 - v14);
    unint64_t v18 = [(TIKeyboardInputManager *)self externalStringToInternal:v17];
    KB::utf8_string(v18, (uint64_t)v24);

    int v20 = KB::string_capitalization((KB *)v24, v19);
    uint64_t v21 = 0;
    if (a4 && v20 == 1)
    {
      uint64_t v22 = [v6 substringToIndex:v14];
      uint64_t v21 = [(TIKeyboardInputManager *)self _canStartSentenceAfterString:v22 maxRecursionDepth:a4 - 1];
    }
    char v11 = TIInputManager::period_ends_sentence_after_word((TIInputManager *)self->m_impl, (const KB::String *)v24, v21);
    if (v25 && v24[6] == 1) {
      free(v25);
    }
  }
LABEL_16:

  return v11;
}

- (BOOL)spaceAndNextInputWouldStartSentence
{
  uint64_t v2 = self;
  uint64_t v3 = [(TIKeyboardInputManager *)self wordSeparator];
  LOBYTE(v2) = [(TIKeyboardInputManager *)v2 nextInputWouldStartSentenceAfterInput:v3];

  return (char)v2;
}

- (BOOL)nextInputWouldStartSentenceAfterInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManager *)self keyboardState];
  int v6 = [v5 autocapitalizationEnabled];

  if (!v6) {
    goto LABEL_4;
  }
  int v7 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v8 = [v7 autocapitalizationType];

  if (v8 != 2) {
    goto LABEL_4;
  }
  int v9 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v10 = [v9 documentState];
  char v11 = [v10 markedText];

  if (!v11)
  {
    uint64_t v14 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v15 = [v14 documentState];
    uint64_t v16 = [v15 contextBeforeInput];
    unint64_t v17 = (void *)v16;
    unint64_t v18 = &stru_1F3F7A998;
    if (v16) {
      unint64_t v18 = (__CFString *)v16;
    }
    uint64_t v19 = v18;

    if (v4)
    {
      uint64_t v20 = [(__CFString *)v19 stringByAppendingString:v4];

      uint64_t v19 = (__CFString *)v20;
    }
    BOOL v12 = [(TIKeyboardInputManager *)self canStartSentenceAfterString:v19];
  }
  else
  {
LABEL_4:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)sentenceTrailingCharacters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  uint64_t v3 = [v2 sentenceTrailingCharacters];

  return v3;
}

- (id)sentenceDelimitingCharacters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  uint64_t v3 = [v2 sentenceDelimitingCharacters];

  return v3;
}

- (id)sentencePrefixingCharacters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  uint64_t v3 = [v2 sentencePrefixingCharacters];

  return v3;
}

- (id)supplementalLexiconWordExtraCharacters
{
  supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  if (!supplementalLexiconWordExtraCharacters)
  {
    id v4 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    BOOL v5 = [v4 supplementalLexiconWordExtraCharacters];
    int v6 = self->_supplementalLexiconWordExtraCharacters;
    self->_supplementalLexiconWordExtraCharacters = v5;

    supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  }

  return supplementalLexiconWordExtraCharacters;
}

- (id)wordCharacters
{
  wordCharacters = self->_wordCharacters;
  if (!wordCharacters)
  {
    id v4 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    BOOL v5 = [v4 wordCharacters];
    int v6 = self->_wordCharacters;
    self->_wordCharacters = v5;

    wordCharacters = self->_wordCharacters;
  }

  return wordCharacters;
}

- (const)precomposedCharacterSet
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  uint64_t v3 = (const USet *)[v2 precomposedCharacterSet];

  return v3;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    id v4 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    [v4 setCurrentUserInterfaceIdiom:a3];
  }
}

- (id)nonstopPunctuationCharacters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  uint64_t v3 = [v2 nonstopPunctuationCharacters];

  return v3;
}

- (void)updateForRevisitedString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v5)
  {
    int v6 = [(TIKeyboardInputManager *)self revisionHistory];
    int v7 = [v6 currentWord];
    int v8 = [v4 isEqualToString:v7];

    if (v8)
    {
      int v9 = [(TIKeyboardInputManager *)self revisionHistory];
      uint64_t v10 = [v9 currentUserTyping];

      if (v10)
      {
        char v11 = [(TIKeyboardInputManager *)self externalStringToInternal:v10];
        m_impl = (char *)self->m_impl;
        KB::utf8_string(v11, (uint64_t)v15);
        KB::String::operator=((KB::String *)(m_impl + 64), (KB::String *)v15);
        if (v17 && v16 == 1) {
          free(v17);
        }
        if (([v10 isEqualToString:v4] & 1) == 0)
        {
          uint64_t v13 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v10];
          uint64_t v14 = self->m_impl;
          KB::utf8_string(v13, (uint64_t)v15);
          KB::String::operator=((KB::String *)(*(void *)(v14[28] + 24) + 56), (KB::String *)v15);
          if (v17 && v16 == 1) {
            free(v17);
          }
        }
      }
    }
  }
}

- (id)autocorrectionRecordForWord:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManager *)self autocorrectionHistory];
  int v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    int v7 = [(TIKeyboardInputManager *)self rejectedAutocorrections];
    int v6 = [v7 objectForKey:v4];
  }

  return v6;
}

- (void)recordAcceptedAutocorrection:(id)a3 fromPredictiveInputBar:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(TIKeyboardInputManager *)self originatingAutocorrectionListForCandidate:v6];
  if (([v7 hasSupplementalItems] & 1) == 0)
  {
    if (v7 && ([v6 isSupplementalItemCandidate] & 1) == 0)
    {
      int v8 = [v6 candidate];
      int v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

      char v11 = [(TIKeyboardInputManager *)self revisionListFromAutocorrectionList:v7 afterAcceptingCandidate:v6];
      BOOL v12 = [(TIKeyboardInputManager *)self autocorrectionListsForWordsInDocument];
      [v12 setObject:v11 forKey:v10];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = objc_msgSend(v6, "candidate", 0);
    uint64_t v14 = [v13 componentsSeparatedByString:@" "];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v19 length])
          {
            uint64_t v20 = [(TIKeyboardInputManager *)self autocorrectionHistory];
            [v20 setObject:v6 forKey:v19];

            if (v4) {
              [(TIKeyboardInputManager *)self recentPredictiveInputSelections];
            }
            else {
            uint64_t v21 = [(TIKeyboardInputManager *)self recentAutocorrections];
            }
            [v21 setObject:v6 forKey:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
}

- (id)revisionListFromAutocorrectionList:(id)a3 afterAcceptingCandidate:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v61 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 isContinuousPathConversion])
  {
    int v7 = [v5 corrections];
    int v8 = [v7 autocorrection];

    if (v8)
    {
      if ([v8 isAutocorrection])
      {
        int v9 = [v8 candidate];
        uint64_t v10 = [v6 candidate];
        char v11 = [v9 isEqualToString:v10];

        if ((v11 & 1) == 0)
        {
          BOOL v12 = [v8 candidate];
          uint64_t v13 = [v6 candidate];
          uint64_t v14 = __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v12, v13, [v8 usageTrackingMask], objc_msgSend(v8, "sourceMask"));

          uint64_t v15 = [v8 supplementalItemIdentifiers];
          [v14 setSupplementalItemIdentifiers:v15];

          [v61 addObject:v14];
        }
      }
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = [v5 predictions];
    uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v63 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v21 = [v20 candidate];
          long long v22 = [v6 candidate];
          char v23 = [v21 isEqualToString:v22];

          if ((v23 & 1) == 0)
          {
            long long v24 = [v20 candidate];
            long long v25 = [v6 candidate];
            uint64_t v26 = __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v24, v25, [v20 usageTrackingMask], objc_msgSend(v20, "sourceMask"));

            uint64_t v27 = [v20 supplementalItemIdentifiers];
            [v26 setSupplementalItemIdentifiers:v27];

            [v61 addObject:v26];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v17);
    }
    goto LABEL_36;
  }
  int v8 = [v6 candidate];
  obuint64_t j = [v6 input];
  if (([obj isEqualToString:v8] & 1) == 0)
  {
    unint64_t v28 = __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(obj, v8, 1, 0);
    [v61 addObject:v28];
  }
  uint64_t v29 = [v5 corrections];
  uint64_t v30 = [v29 autocorrection];
  if (!v30) {
    goto LABEL_23;
  }
  uint64_t v31 = (void *)v30;
  uint64_t v32 = [v5 corrections];
  uint64_t v33 = [v32 autocorrection];
  if (![v33 isAutocorrection])
  {
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  unsigned int v34 = [v5 corrections];
  int v35 = [v34 autocorrection];
  uint64_t v36 = [v35 candidate];
  char v56 = [v36 isEqualToString:v8];

  if ((v56 & 1) == 0)
  {
    uint64_t v29 = [v5 corrections];
    uint64_t v31 = [v29 autocorrection];
    uint64_t v32 = [v31 candidate];
    uint64_t v33 = [v5 corrections];
    uint64_t v57 = [v33 autocorrection];
    uint64_t v37 = [v57 usageTrackingMask];
    int v38 = [v5 corrections];
    unsigned int v39 = [v38 autocorrection];
    int v40 = __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v32, v8, v37, [v39 sourceMask]);
    [v61 addObject:v40];

    goto LABEL_22;
  }
LABEL_24:
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unsigned __int16 v41 = objc_msgSend(v5, "predictions", v5);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v41);
        }
        char v46 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        unsigned int v47 = [v46 candidate];
        char v48 = [v47 isEqualToString:v8];

        if ((v48 & 1) == 0)
        {
          uint64_t v49 = [v46 candidate];
          int v50 = __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v49, v8, [v46 usageTrackingMask], objc_msgSend(v46, "sourceMask"));

          uint64_t v51 = [v46 supplementalItemIdentifiers];
          [v50 setSupplementalItemIdentifiers:v51];

          if (self->_supplementalPrefix) {
            objc_msgSend(v50, "core_updateWithSupplementalItemPrefix:");
          }
          [v61 addObject:v50];
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v43);
  }

  id v5 = v58;
LABEL_36:

  uint64_t v52 = (void *)MEMORY[0x1E4FAE278];
  long long v53 = [v5 emojiList];
  uint64_t v54 = [v52 listWithCorrections:0 predictions:v61 emojiList:v53];

  return v54;
}

id __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v7 length]
    && [v8 length]
    && [v7 hasPrefix:@" "]
    && [v8 hasPrefix:@" "])
  {
    uint64_t v9 = [v7 substringFromIndex:1];

    uint64_t v10 = [v8 substringFromIndex:1];

    id v8 = (id)v10;
    id v7 = (id)v9;
  }
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4FAE500]) initWithCandidate:v7 forInput:v8 rawInput:0 wordOriginFeedbackID:0 usageTrackingMask:a3 sourceMask:a4];

  return v11;
}

- (id)originatingAutocorrectionListForCandidate:(id)a3
{
  id v4 = a3;
  if (([v4 isContinuousPathConversion] & 1) == 0)
  {
    uint64_t v10 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    id v8 = [v4 input];
    id v11 = [v10 objectForKey:v8];
LABEL_5:
    uint64_t v9 = v11;
    goto LABEL_12;
  }
  id v5 = [v4 input];
  int v6 = [v5 isEqualToString:&stru_1F3F7A998];

  id v7 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
  if (v6)
  {
    id v8 = [v4 candidate];
    uint64_t v9 = [v7 objectForKey:v8];
    uint64_t v10 = v7;
    goto LABEL_12;
  }
  BOOL v12 = [v4 input];
  uint64_t v10 = [v7 objectForKey:v12];

  if (v10)
  {
    uint64_t v13 = [v10 corrections];
    id v8 = [v13 autocorrection];

    if ([v8 isContinuousPathConversion]
      && [(TIKeyboardInputManager *)self isContinuousPathCandidate:v4 replacementForOriginalConversion:v8])
    {
      id v11 = v10;
      uint64_t v10 = v11;
      goto LABEL_5;
    }
  }
  id v8 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
  uint64_t v14 = [v4 candidate];
  uint64_t v9 = [v8 objectForKey:v14];

LABEL_12:

  return v9;
}

- (BOOL)isContinuousPathCandidate:(id)a3 replacementForOriginalConversion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isContinuousPathConversion]
    && [v6 isContinuousPathConversion]
    && ([v5 input],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:&stru_1F3F7A998],
        v7,
        (v8 & 1) == 0))
  {
    id v11 = [v6 candidate];
    BOOL v12 = [v5 input];
    char v9 = [v11 hasSuffix:v12];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)recordSuggestedAutocorrectionList:(id)a3
{
  id v11 = a3;
  id v4 = [v11 corrections];
  id v5 = [v4 autocorrection];

  if (!v5) {
    goto LABEL_10;
  }
  if ([v5 isContinuousPathConversion])
  {
    id v6 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    uint64_t v7 = [v5 candidate];
LABEL_6:
    uint64_t v10 = (void *)v7;
    [v6 setObject:v11 forKey:v7];

    goto LABEL_7;
  }
  char v8 = [v5 input];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v6 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    uint64_t v7 = [v5 input];
    goto LABEL_6;
  }
LABEL_7:
  if ([v5 usageTrackingMask] && (objc_msgSend(v5, "isAutocorrection") & 1) == 0) {
    [(TIKeyboardInputManager *)self setHitTestCorrectedInputMatchingCandidate:v5];
  }
LABEL_10:
}

- (BOOL)shouldSuppressTokenIDLookups
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  char v4 = [v3 secureTextEntry];

  if (v4) {
    return 1;
  }
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v7 = [v6 textInputTraits];
  BOOL v5 = [v7 autocorrectionType] == 1;

  return v5;
}

- (BOOL)shouldAllowCorrectionOfAcceptedCandidate:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v3 isFromPhraseDictionary] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0 && ([v3 isFromTextChecker] & 1) != 0
    || ([v3 isForShortcutConversion] & 1) != 0)
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v6 = [v3 input];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      char v8 = [v3 input];
      uint64_t v9 = [v3 candidate];
      if ([v8 isEqualToString:v9]) {
        char v4 = 1;
      }
      else {
        char v4 = [v3 isAutocorrection];
      }
    }
    else
    {
      char v4 = 1;
    }
  }

  return v4;
}

- (void)displayedCandidateRejected
{
  [(TIKeyboardInputManager *)self setDeleteKeyCount:[(TIKeyboardInputManager *)self deleteKeyCount] + 1];
  if (self->m_impl && [(TIKeyboardInputManager *)self deleteKeyCount] <= 1)
  {
    id v3 = [(TIKeyboardInputManager *)self usageTrackingKeyForStatistic:*MEMORY[0x1E4FAEB58]];
    TIStatisticScalarIncrement();
  }
}

- (void)setOriginalInput:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->m_impl)
  {
    id v4 = a3;
    BOOL v5 = [(TIKeyboardInputManager *)self externalStringToInternal:v4];
    KB::utf8_string(v5, (uint64_t)v6);

    KB::String::operator=((KB::String *)((char *)self->m_impl + 32), (KB::String *)v6);
    [(TIKeyboardInputManager *)self updateForRevisitedString:v4];

    if (v7)
    {
      if (v6[6] == 1) {
        free(v7);
      }
    }
  }
}

- (id)currentWordStem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  TIInputManager::legacy_input_stem((TIInputManager *)self->m_impl, (uint64_t)v8);
  id v4 = KB::ns_string((KB *)v8, v3);
  BOOL v5 = [(TIKeyboardInputManager *)self internalStringToExternal:v4];

  if (v9) {
    BOOL v6 = v8[6] == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    free(v9);
  }

  return v5;
}

- (id)inputStem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  m_impl = self->m_impl;
  if (m_impl)
  {
    TIInputManager::input_substring((unsigned __int16 *)m_impl + 4, 0, *((_DWORD *)m_impl + 24), (uint64_t)v8);
    BOOL v5 = KB::ns_string((KB *)v8, v4);
    BOOL v6 = [(TIKeyboardInputManager *)self internalStringToExternal:v5];

    if (v9 && v8[6] == 1) {
      free(v9);
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)inputString
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (m_impl)
  {
    m_composedText = self->m_composedText;
    if (m_composedText)
    {
      BOOL v5 = (void *)[(NSMutableString *)m_composedText copy];
    }
    else
    {
      TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((void *)m_impl + 2) - *((void *)m_impl + 1)) >> 3), (uint64_t)v8);
      BOOL v5 = KB::ns_string((KB *)v8, v6);
      if (v9 && v8[6] == 1) {
        free(v9);
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unsigned)inputCount
{
  m_impl = self->m_impl;
  if (m_impl) {
    return [(TIKeyboardInputManager *)self internalIndexToExternal:-858993459 * ((m_impl[2] - m_impl[1]) >> 3)];
  }
  else {
    return 0;
  }
}

- (unsigned)inputIndex
{
  m_impl = (unsigned int *)self->m_impl;
  if (m_impl) {
    return [(TIKeyboardInputManager *)self internalIndexToExternal:m_impl[24]];
  }
  else {
    return 0;
  }
}

- (void)setInputIndex:(unsigned int)a3
{
  if (self->m_impl)
  {
    unsigned int v4 = [(TIKeyboardInputManager *)self externalIndexToInternal:*(void *)&a3];
    TIInputManager::set_input_index((TIInputManager *)self->m_impl, v4);
    if (v4) {
      BOOL v5 = v4 < -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3);
    }
    else {
      BOOL v5 = 0;
    }
    self->_isEditingWordPrefix = v5;
    [(TIKeyboardInputManager *)self setLastAcceptedText:0];
  }
}

- (void)updateInputContext
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->m_impl)
  {
    id v3 = [(TIKeyboardInputManager *)self keyboardState];
    unsigned int v4 = [v3 documentState];
    uint64_t v5 = [v4 contextBeforeInput];
    BOOL v6 = (void *)v5;
    uint64_t v7 = &stru_1F3F7A998;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    uint64_t v8 = v7;

    uint64_t v9 = [(TIKeyboardInputManager *)self inputStem];
    if ([v9 length])
    {
      if ([(__CFString *)v8 hasSuffix:v9])
      {
        -[__CFString substringToIndex:](v8, "substringToIndex:", -[__CFString length](v8, "length") - [v9 length]);
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v10 = &stru_1F3F7A998;
      }

      uint64_t v8 = v10;
    }
    m_impl = (char *)self->m_impl;
    if (m_impl)
    {
      BOOL v12 = [(TIKeyboardInputManager *)self externalStringToInternal:v8];
      KB::utf8_string(v12, (uint64_t)v21);
      [(TIKeyboardInputManager *)self sentenceContextForInputStem:v9 inputContext:v8];
      KB::String::operator=((KB::String *)(m_impl + 400), (KB::String *)v21);
      KB::LanguageModelContext::operator=((uint64_t)(m_impl + 432), &v13);
      uint64_t v20 = (void **)&v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v20);
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v18);
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v17);
      if (__p)
      {
        uint64_t v16 = __p;
        operator delete(__p);
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v14);
      }
      if (v22)
      {
        if (v21[6] == 1) {
          free(v22);
        }
      }
    }
    [(TIKeyboardInputManager *)self setAutoshiftFromInputContext];
  }
}

- (id)internalInputContext
{
  return KB::ns_string((KB *)((char *)self->m_impl + 400), (const KB::String *)a2);
}

- (id)inputContext
{
  id v3 = KB::ns_string((KB *)((char *)self->m_impl + 400), (const KB::String *)a2);
  unsigned int v4 = [(TIKeyboardInputManager *)self internalStringToExternal:v3];

  return v4;
}

- (void)acceptInput
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  m_impl = (TIInputManager *)self->m_impl;
  if (m_impl)
  {
    TIInputManager::accept_input(m_impl);
    m_composedText = self->m_composedText;
    if (m_composedText)
    {
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)v8);
      BOOL v6 = KB::ns_string((KB *)v8, v5);
      uint64_t v7 = [(TIKeyboardInputManager *)self internalStringToExternal:v6];
      [(NSMutableString *)m_composedText setString:v7];

      if (v9)
      {
        if (v8[6] == 1) {
          free(v9);
        }
      }
    }
  }
}

- (void)clearInput
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->m_impl)
  {
    [(TIKeyboardInputManager *)self checkAutocorrectionDictionaries];
    TIInputManager::clear_input((TIInputManager *)self->m_impl);
    m_composedText = self->m_composedText;
    if (m_composedText)
    {
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)v8);
      uint64_t v5 = KB::ns_string((KB *)v8, v4);
      BOOL v6 = [(TIKeyboardInputManager *)self internalStringToExternal:v5];
      [(NSMutableString *)m_composedText setString:v6];

      if (v9)
      {
        if (v8[6] == 1) {
          free(v9);
        }
      }
    }
    uint64_t v7 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    [v7 removeAllObjects];

    [(TIKeyboardInputManager *)self setHitTestCorrectedInputMatchingCandidate:0];
    [(TIKeyboardInputManager *)self setLastAcceptedText:0];
    self->_lastHitTestKeycode = -1;
    [(TIKeyboardInputManager *)self setLastAutocorrectionList:0];
  }
}

- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(TIKeyboardInputManager *)self deletesComposedTextByComposedCharacterSequence])
  {
    TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)v23);
    uint64_t v8 = KB::ns_string((KB *)v23, v7);
    uint64_t v9 = [(TIKeyboardInputManager *)self internalStringToExternal:v8];

    if (v25 && v24 == 1) {
      free(v25);
    }
    uint64_t v10 = [v9 rangeOfComposedCharacterSequenceAtIndex:a3 - 1];
    BOOL v12 = objc_msgSend(v9, "substringWithRange:", v10, v11);
    m_impl = (TIInputManager *)self->m_impl;
    uint64_t v14 = [(TIKeyboardInputManager *)self externalStringToInternal:v12];
    KB::utf8_string(v14, (uint64_t)v23);
    TIInputManager::delete_suffix_from_input(m_impl, (const KB::String *)v23);
    if (v25 && v24 == 1) {
      free(v25);
    }
  }
  else
  {
    TIInputManager::delete_from_input((TIInputManager *)self->m_impl);
  }
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)v23);
  uint64_t v16 = KB::ns_string((KB *)v23, v15);
  uint64_t v17 = [(TIKeyboardInputManager *)self internalStringToExternal:v16];

  if (v25 && v24 == 1) {
    free(v25);
  }
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v23);
  uint64_t v19 = KB::ns_string((KB *)v23, v18);
  uint64_t v20 = [(TIKeyboardInputManager *)self internalStringToExternal:v19];

  if (v25 && v24 == 1) {
    free(v25);
  }
  uint64_t v21 = [(TIKeyboardInputManager *)self suffixOfDesiredString:v20 toAppendToInputString:self->m_composedText withInputIndex:a3 afterDeletionCount:a4];
  [(NSMutableString *)self->m_composedText setString:v17];
  if (![v21 length])
  {

    uint64_t v21 = 0;
  }

  return v21;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  if (a3) {
    *a3 = 1;
  }
  if (!self->m_impl) {
    goto LABEL_6;
  }
  if ([(TIKeyboardInputManager *)self usesCandidateSelection]) {
    goto LABEL_7;
  }
  uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  BOOL v6 = [v5 documentState];
  uint64_t v7 = [v6 markedText];

  if (!v7)
  {
LABEL_7:
    unsigned int v9 = [(TIKeyboardInputManager *)self inputIndex];
    if ([(NSMutableString *)self->m_composedText length])
    {
      uint64_t v8 = [(TIKeyboardInputManager *)self deleteComposedTextFromIndex:v9 count:a3];
    }
    else
    {
      TIInputManager::delete_from_input((TIInputManager *)self->m_impl);
      uint64_t v8 = 0;
    }
    [(TIKeyboardInputManager *)self setLastAcceptedText:0];
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TIKeyboardInputManager *)self setInput:a3];

  [(TIKeyboardInputManager *)self setInputIndex:v4];
}

- (void)setInput:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->m_impl)
  {
    uint64_t v5 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    [v5 removeAllObjects];

    [(TIKeyboardInputManager *)self checkAutocorrectionDictionaries];
    m_impl = (TIInputManager *)self->m_impl;
    uint64_t v7 = [(TIKeyboardInputManager *)self externalStringToInternal:v4];
    KB::utf8_string(v7, (uint64_t)v9);
    TIInputManager::set_input(m_impl, (const KB::String *)v9);
    if (v10 && v9[6] == 1) {
      free(v10);
    }

    self->_isEditingWordPrefix = 0;
    m_composedText = self->m_composedText;
    if (m_composedText) {
      [(NSMutableString *)m_composedText setString:v4];
    }
    [(TIKeyboardInputManager *)self updateForRevisitedString:v4];
    [(TIKeyboardInputManager *)self setLastAcceptedText:0];
  }
}

- (void)willDropInputStem
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Dropping input stem.", "-[TIKeyboardInputManager willDropInputStem]");
      *(_DWORD *)buf = 138412290;
      BOOL v6 = v4;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if ([(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled]) {
    [(TIKeyboardInputManager *)self updateDictionaryAndLanguageModel];
  }
}

- (void)dropInput
{
  if (self->m_impl)
  {
    [(TIKeyboardInputManager *)self willDropInputStem];
    [(TIKeyboardInputManager *)self dropInputPrefix:*((unsigned int *)self->m_impl + 24)];
    [(TIKeyboardInputManager *)self didDropInputStem];
  }
}

- (void)dropInputPrefix:(unsigned int)a3
{
  if (a3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __42__TIKeyboardInputManager_dropInputPrefix___block_invoke;
      v4[3] = &unk_1E6E2DE00;
      v4[4] = self;
      TIInputManager::drop_input_prefix_and_update_autocorrection_engine((uint64_t)m_impl, *(uint64_t *)&a3, (uint64_t)v4);
    }
  }
}

uint64_t __42__TIKeyboardInputManager_dropInputPrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateComposedText];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateInputContext];
}

- (void)trimInputAfterLathamConversion
{
  m_impl = self->m_impl;
  if (m_impl && m_impl[24])
  {
    if ([(TIKeyboardInputManager *)self usesRetrocorrection])
    {
      id v4 = [(TIKeyboardInputManager *)self trimmedInputStemAfterLathamConversion];
      unint64_t v5 = [(TIKeyboardInputManager *)self internalIndexOfInputStemSuffix:v4];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_13;
      }
      unint64_t v6 = v5;
      unsigned int v7 = v5;
      while (v7 < *((_DWORD *)self->m_impl + 24))
      {
        unsigned int v8 = v7 + 1;
        BOOL v9 = -[TIKeyboardInputManager canRetrocorrectInputAtIndex:](self, "canRetrocorrectInputAtIndex:");
        unsigned int v7 = v8;
        if (!v9) {
          goto LABEL_13;
        }
      }
      if (![(TIKeyboardInputManager *)self canTrimInputAtIndex:v6])
      {
LABEL_13:
      }
      else
      {

        int v10 = *(_DWORD *)(*((void *)self->m_impl + 1) + 40 * (*((_DWORD *)self->m_impl + 24) - 1) + 32);
        [(TIKeyboardInputManager *)self dropInputPrefix:v6];
        if ((v10 & 0x40) == 0 || ![(TIKeyboardInputManager *)self shouldDropInputStem]) {
          return;
        }
      }
    }
    [(TIKeyboardInputManager *)self dropInput];
  }
}

- (id)trimmedInputStemAfterLathamConversion
{
  id v3 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      id v3 = &stru_1F3F7A998;
      if (m_impl[24])
      {
        uint64_t v11 = 0;
        BOOL v12 = &v11;
        uint64_t v13 = 0x3032000000;
        uint64_t v14 = __Block_byref_object_copy__11289;
        uint64_t v15 = __Block_byref_object_dispose__11290;
        uint64_t v16 = &stru_1F3F7A998;
        v10[0] = 0;
        v10[1] = v10;
        v10[2] = 0x2020000000;
        v10[3] = 0;
        unint64_t v5 = [(TIKeyboardInputManager *)self revisionHistory];
        uint64_t v6 = [v5 selectedRange];

        unsigned int v7 = [(TIKeyboardInputManager *)self revisionHistory];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __63__TIKeyboardInputManager_trimmedInputStemAfterLathamConversion__block_invoke;
        v9[3] = &unk_1E6E2BFF0;
        void v9[4] = self;
        v9[5] = &v11;
        v9[6] = v10;
        v9[7] = v6;
        [v7 enumerateSentenceStemUsingBlock:v9];

        id v3 = (__CFString *)(id)v12[5];
        _Block_object_dispose(v10, 8);
        _Block_object_dispose(&v11, 8);
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

void __63__TIKeyboardInputManager_trimmedInputStemAfterLathamConversion__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if (a3 < *(void *)(a1 + 56))
  {
    int v9 = HIDWORD(a7);
    uint64_t v13 = [*(id *)(a1 + 32) revisionHistory];
    uint64_t v14 = [v13 documentText];
    objc_msgSend(v14, "substringWithRange:", a3, *(void *)(a1 + 56) - a3);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

    if (([obj _containsEmoji] & 1) != 0
      || (objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj), a3 + a4 >= *(void *)(a1 + 56))
      && ![*(id *)(a1 + 32) usesRetrocorrection]
      || (v9 - 500) <= 0xFFFFFE0C
      && (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
    {
      *a8 = 1;
    }
  }
}

- (void)trimInput
{
  m_impl = self->m_impl;
  if (m_impl && m_impl[24])
  {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    if ([(TIKeyboardInputManager *)self usesRetrocorrection])
    {
      unint64_t v5 = [(TIKeyboardInputManager *)self trimmedInputStem];
      unint64_t v6 = [(TIKeyboardInputManager *)self internalIndexOfInputStemSuffix:v5];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v7 = v6;
        unsigned int v8 = v6;
        while (v8 < *((_DWORD *)self->m_impl + 24))
        {
          unsigned int v9 = v8 + 1;
          BOOL v10 = -[TIKeyboardInputManager canRetrocorrectInputAtIndex:](self, "canRetrocorrectInputAtIndex:");
          unsigned int v8 = v9;
          if (!v10)
          {
            uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_12;
          }
        }
        if ([(TIKeyboardInputManager *)self canTrimInputAtIndex:v7]) {
          uint64_t v4 = v7;
        }
        else {
          uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
LABEL_12:
    }
    int v11 = *(_DWORD *)(*((void *)self->m_impl + 1) + 40 * (*((_DWORD *)self->m_impl + 24) - 1) + 32);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v11 & 0x40) == 0) {
        return;
      }
    }
    else
    {
      [(TIKeyboardInputManager *)self dropInputPrefix:v4];
      if ((v11 & 0x40) == 0 || ![(TIKeyboardInputManager *)self shouldDropInputStem]) {
        return;
      }
    }
    [(TIKeyboardInputManager *)self dropInput];
  }
}

- (BOOL)canRetrocorrectInputAtIndex:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  KB::String::String((KB::String *)v11, (const KB::String *)(*((void *)self->m_impl + 1) + 40 * a3));
  int v5 = *(_DWORD *)(*((void *)self->m_impl + 1) + 40 * a3 + 32);
  unint64_t v7 = KB::ns_string((KB *)v11, v6);
  char v9 = 0;
  if (!KB::string_has_numbers((KB *)v11, v8) && (v5 & 0x13) != 1)
  {
    if ([(TIKeyboardInputManager *)self stringEndsWord:v7]
      && ((v5 & 0x24) != 0x20 || [v7 isEqualToString:@"\n"]))
    {
      char v9 = [v7 isEqualToString:@" "];
    }
    else
    {
      char v9 = 1;
    }
  }

  if (v12 && v11[6] == 1) {
    free(v12);
  }
  return v9;
}

- (BOOL)canTrimInputAtIndex:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  m_impl = (char *)self->m_impl;
  unsigned int v4 = *((_DWORD *)m_impl + 43);
  if (v4 <= *((_DWORD *)m_impl + 44)) {
    unsigned int v4 = *((_DWORD *)m_impl + 44);
  }
  if (v4 > a3) {
    return 0;
  }
  unsigned int v8 = (const KB::String *)(m_impl + 400);
  TIInputManager::input_substring((unsigned __int16 *)m_impl + 4, 0, a3, (uint64_t)v10);
  KB::String::String((KB::String *)v13, v8);
  KB::String::append(v13, (const KB::String *)v10);
  if (v12 && v11 == 1) {
    free(v12);
  }
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, a3, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3) - a3, (uint64_t)v10);
  BOOL candidates = TIInputManager::should_generate_candidates((uint64_t)self->m_impl, (const KB::String *)v13, (KB::String *)v10, 0);
  if (v12 && v11 == 1) {
    free(v12);
  }
  if (v15 && v14 == 1) {
    free(v15);
  }
  return candidates;
}

- (unint64_t)internalIndexOfInputStemSuffix:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && self->m_impl)
  {
    if ([v4 length])
    {
      unint64_t v7 = [(TIKeyboardInputManager *)self inputStem];
      uint64_t v8 = [v7 rangeOfString:v5 options:12];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = v8;
        unsigned int v10 = [(TIKeyboardInputManager *)self externalIndexToInternal:v8];
        m_impl = (unsigned __int16 *)self->m_impl;
        if (v10 <= *((_DWORD *)m_impl + 24))
        {
          unsigned int v12 = v10;
          TIInputManager::input_substring(m_impl + 4, 0, v10, (uint64_t)v18);
          char v14 = KB::ns_string((KB *)v18, v13);
          uint64_t v15 = [(TIKeyboardInputManager *)self internalStringToExternal:v14];

          uint64_t v16 = [v7 substringToIndex:v9];
          LODWORD(v14) = [v15 isEqualToString:v16];

          if (v14) {
            unint64_t v6 = v12;
          }

          if (v19 && v18[6] == 1) {
            free(v19);
          }
        }
      }
    }
    else
    {
      unint64_t v6 = *((unsigned int *)self->m_impl + 24);
    }
  }

  return v6;
}

- (id)wordInInputStem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TIKeyboardInputManager *)self revisionHistory];

  uint64_t v8 = &stru_1F3F7A998;
  if (v7)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__11289;
    uint64_t v19 = __Block_byref_object_dispose__11290;
    uint64_t v20 = &stru_1F3F7A998;
    int v9 = [(TIKeyboardInputManager *)self countOfWordsIninputStem:v6];
    if (v9 > a4)
    {
      unint64_t v10 = v9 + ~a4;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      char v11 = [(TIKeyboardInputManager *)self revisionHistory];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__TIKeyboardInputManager_wordInInputStem_atIndex___block_invoke;
      unsigned __int16 v13[3] = &unk_1E6E2BFC8;
      v13[5] = &v15;
      v13[6] = v10;
      v13[4] = v14;
      [v11 enumerateSentenceStemUsingBlock:v13];

      _Block_object_dispose(v14, 8);
    }
    uint64_t v8 = (__CFString *)(id)v16[5];
    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

void __50__TIKeyboardInputManager_wordInInputStem_atIndex___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  int v9 = HIDWORD(a7);
  id v12 = a2;
  if ((v9 - 500) <= 0xFFFFFE0C)
  {
    uint64_t v13 = *(void *)(a1[4] + 8);
    unint64_t v14 = *(void *)(v13 + 24);
    if (v14 >= a1[6])
    {
      id v15 = v12;
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      id v12 = v15;
      *a8 = 1;
      uint64_t v13 = *(void *)(a1[4] + 8);
      unint64_t v14 = *(void *)(v13 + 24);
    }
    *(void *)(v13 + 24) = v14 + 1;
  }
}

- (unint64_t)countOfWordsIninputStem:(id)a3
{
  id v4 = a3;
  int v5 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v5)
  {
    uint64_t v13 = 0;
    unint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v6 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v7 = [v6 selectedRange];

    uint64_t v8 = [v4 length];
    int v9 = [(TIKeyboardInputManager *)self revisionHistory];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__TIKeyboardInputManager_countOfWordsIninputStem___block_invoke;
    v12[3] = &unk_1E6E2BFA0;
    v12[5] = v7;
    void v12[6] = v8;
    v12[4] = &v13;
    [v9 enumerateSentenceStemUsingBlock:v12];

    unint64_t v10 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

void *__50__TIKeyboardInputManager_countOfWordsIninputStem___block_invoke(void *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7 = result[5];
  if (a3 < v7 && a3 >= v7 - result[6] && (HIDWORD(a7) - 500) <= 0xFFFFFE0C) {
    ++*(void *)(*(void *)(result[4] + 8) + 24);
  }
  return result;
}

- (id)trimmedInputStem
{
  id v3 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      id v3 = &stru_1F3F7A998;
      if (m_impl[24])
      {
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x3032000000;
        uint64_t v15 = __Block_byref_object_copy__11289;
        uint64_t v16 = __Block_byref_object_dispose__11290;
        uint64_t v17 = &stru_1F3F7A998;
        v11[0] = 0;
        v11[1] = v11;
        v11[2] = 0x2020000000;
        v11[3] = 0;
        unint64_t v5 = [(TIKeyboardInputManager *)self maxPriorWordTokensAfterTrimming];
        id v6 = [(TIKeyboardInputManager *)self revisionHistory];
        uint64_t v7 = [v6 selectedRange];

        uint64_t v8 = [(TIKeyboardInputManager *)self revisionHistory];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __42__TIKeyboardInputManager_trimmedInputStem__block_invoke;
        v10[3] = &unk_1E6E2BF78;
        void v10[4] = self;
        v10[5] = &v12;
        unsigned char v10[6] = v11;
        v10[7] = v7;
        v10[8] = v5;
        [v8 enumerateSentenceStemUsingBlock:v10];

        id v3 = (__CFString *)(id)v13[5];
        _Block_object_dispose(v11, 8);
        _Block_object_dispose(&v12, 8);
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

void __42__TIKeyboardInputManager_trimmedInputStem__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if (a3 >= *(void *)(a1 + 56)) {
    return;
  }
  int v9 = HIDWORD(a7);
  uint64_t v13 = [*(id *)(a1 + 32) revisionHistory];
  uint64_t v14 = [v13 documentText];
  objc_msgSend(v14, "substringWithRange:", a3, *(void *)(a1 + 56) - a3);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  if ([obj _containsEmoji]) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  if (a3 + a4 >= *(void *)(a1 + 56))
  {
    if ([*(id *)(a1 + 32) usesRetrocorrection]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((v9 - 500) <= 0xFFFFFE0C
    && ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64))
  {
LABEL_3:
    *a8 = 1;
  }
LABEL_4:
}

- (unint64_t)maxPriorWordTokensAfterTrimming
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  unint64_t v3 = [v2 maxPriorWordTokensAfterTrimming];

  return v3;
}

- (void)fillReversedConversationHistoryInContext:(id)a3
{
  id v28 = a3;
  uint64_t v4 = [v28 lmContext];
  uint64_t v5 = *((void *)self->m_impl + 29);
  if (v5)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 184))(v5))
    {
      unint64_t v6 = *(void *)(v4 + 48);
      if (v6 <= 2 && *(void *)(v4 + 24) - *(void *)(v4 + 16) <= 0x1FFuLL)
      {
        uint64_t v7 = *(uint64_t **)v4;
        if (!*(void *)v4)
        {
          uint64_t v8 = operator new(0x30uLL);
          v8[1] = 0;
          v8[2] = 0;
          void *v8 = &unk_1F3F75B20;
          v8[4] = 0;
          v8[5] = 0;
          int v9 = *(std::__shared_weak_count **)(v4 + 8);
          v8[3] = 0;
          uint64_t v7 = v8 + 3;
          *(void *)uint64_t v4 = v8 + 3;
          *(void *)(v4 + 8) = v8;
          if (v9)
          {
            std::__shared_weak_count::__release_shared[abi:nn180100](v9);
            uint64_t v7 = *(uint64_t **)v4;
          }
        }
        unint64_t v10 = *(std::__shared_weak_count **)(v4 + 8);
        if (v10) {
          atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v27 = v10;
        end = self->conversation_history.__end_;
        do
        {
          if (end == self->conversation_history.__begin_) {
            break;
          }
          uint64_t v12 = (const KB::LanguageModelContext *)*((void *)end - 2);
          if (!v12)
          {
            [(TIKeyboardInputManager *)self parseRecentMessage:(char *)end - 48];
            uint64_t v12 = (const KB::LanguageModelContext *)*((void *)end - 2);
            if (!v12) {
              continue;
            }
          }
          uint64_t v13 = (KB::LanguageModelContext *)v7[1];
          unint64_t v14 = v7[2];
          if ((unint64_t)v13 >= v14)
          {
            uint64_t v16 = 0x4EC4EC4EC4EC4EC5 * (((uint64_t)v13 - *v7) >> 3);
            unint64_t v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) > 0x276276276276276) {
              abort();
            }
            unint64_t v18 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v14 - *v7) >> 3);
            if (2 * v18 > v17) {
              unint64_t v17 = 2 * v18;
            }
            if (v18 >= 0x13B13B13B13B13BLL) {
              unint64_t v19 = 0x276276276276276;
            }
            else {
              unint64_t v19 = v17;
            }
            if (v19)
            {
              uint64_t v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelContext>>(v19);
            }
            else
            {
              uint64_t v21 = 0;
              uint64_t v20 = 0;
            }
            long long v22 = &v21[104 * v20];
            uint64_t v23 = (uint64_t)KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)&v21[104 * v16], v12);
            uint64_t v15 = (char *)(v23 + 104);
            char v24 = (char *)*v7;
            long long v25 = (char *)v7[1];
            if (v25 == (char *)*v7)
            {
              *uint64_t v7 = v23;
              v7[1] = (uint64_t)v15;
              v7[2] = (uint64_t)v22;
            }
            else
            {
              do
              {
                v25 -= 104;
                uint64_t v23 = KB::LanguageModelContext::LanguageModelContext(v23 - 104, (uint64_t)v25);
              }
              while (v25 != v24);
              uint64_t v26 = (char *)*v7;
              long long v25 = (char *)v7[1];
              *uint64_t v7 = v23;
              v7[1] = (uint64_t)v15;
              v7[2] = (uint64_t)v22;
              if (v25 != v26)
              {
                do
                {
                  v25 -= 104;
                  std::__destroy_at[abi:nn180100]<KB::LanguageModelContext,0>((uint64_t)v25);
                }
                while (v25 != v26);
                long long v25 = v26;
              }
            }
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            uint64_t v15 = (char *)KB::LanguageModelContext::LanguageModelContext(v13, v12) + 104;
          }
          v7[1] = (uint64_t)v15;
          v6 += *((int *)end - 2);
          end = (RecentMessage *)((char *)end - 48);
        }
        while (v6 < 3);
        if (v27) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v27);
        }
      }
    }
  }
}

- (LanguageModelContext)sentenceContextForInputStem:(SEL)a3 inputContext:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(TIKeyboardInputManager *)self canComputeSentenceContextForInputStem:v8])
  {
    uint64_t v42 = v9;
    unint64_t v10 = objc_alloc_init(TIContextTokens);
    char v11 = [(TIContextTokens *)v10 lmContext];
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x4812000000;
    int v59 = __Block_byref_object_copy__334;
    uint64_t v60 = __Block_byref_object_dispose__335;
    uint64_t v61 = "";
    long long v63 = 0;
    uint64_t v64 = 0;
    long long v62 = 0;
    uint64_t v52 = 0;
    long long v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 1;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v14 = [v13 selectedRange];
    uint64_t v15 = v14 - [v8 length];

    uint64_t v16 = [(TIKeyboardInputManager *)self revisionHistory];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __67__TIKeyboardInputManager_sentenceContextForInputStem_inputContext___block_invoke;
    v47[3] = &unk_1E6E2BFF0;
    int v50 = &v56;
    uint64_t v51 = v15;
    uint64_t v49 = &v52;
    id v17 = v12;
    id v48 = v17;
    [v16 enumerateSentenceStemUsingBlock:v47];

    unint64_t v18 = (KB::String *)std::vector<TITokenID>::vector(&v45, (uint64_t)(v57 + 6));
    if (v45 != v46)
    {
      unint64_t v19 = v46 - 8;
      if (v46 - 8 > v45)
      {
        uint64_t v20 = (char *)v45 + 8;
        do
        {
          uint64_t v21 = *((void *)v20 - 1);
          *((void *)v20 - 1) = *(void *)v19;
          *(void *)unint64_t v19 = v21;
          v19 -= 8;
          BOOL v22 = v20 >= v19;
          v20 += 8;
        }
        while (!v22);
      }
    }
    if (*((unsigned char *)v53 + 24))
    {
      char v24 = v45;
      uint64_t v23 = v46;
      id v41 = v8;
      if (v45 == v46)
      {
        std::string::basic_string[abi:nn180100]<0>(&v65, "");
        KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, 0x100000000uLL, (uint64_t)&v65, 0);
        if (v67 < 0) {
          operator delete(v65);
        }
        char v24 = v45;
        uint64_t v23 = v46;
      }
      uint64_t v25 = v23 - v24;
      if ((unint64_t)(v25 >> 3) >= 0x40) {
        unint64_t v26 = (v25 >> 3) - 64;
      }
      else {
        unint64_t v26 = 0;
      }
      if (v26 < v25 >> 3)
      {
        do
        {
          uint64_t v27 = [v17 objectAtIndex:v26];
          if (!*((_DWORD *)v45 + 2 * v26 + 1))
          {
            uint64_t v28 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)(v11 + 8));
            if (v29)
            {
              if (*(_DWORD *)(v28 + 32 * v29 - 8) == 1) {
                uint64_t v30 = v10;
              }
              else {
                uint64_t v30 = 0;
              }
            }
            else
            {
              uint64_t v30 = 0;
            }
            TITokenID v31 = [(TIKeyboardInputManager *)self findTokenIDForWord:v27 contextTokens:v30 tokenLookupMode:5];
            *((TITokenID *)v45 + v26) = v31;
          }
          int v32 = ![(TIKeyboardInputManager *)self shouldAllowContextWord:v27];
          unint64_t v33 = *((void *)v45 + v26);
          id v34 = v27;
          std::string::basic_string[abi:nn180100]<0>(&v65, (char *)[v34 UTF8String]);
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v33, (uint64_t)&v65, v32);
          if (v67 < 0) {
            operator delete(v65);
          }

          ++v26;
        }
        while (v26 < (v46 - (unsigned char *)v45) >> 3);
      }
      unint64_t v35 = v11[3] - v11[2];
      id v8 = v41;
      if (v35)
      {
        uint64_t v36 = v11[3];
        unint64_t v37 = (unint64_t)*(unsigned int *)(v36 - 4) << 32;
        if (v37 == 0x600000000)
        {
          std::string::basic_string[abi:nn180100]<0>(__p, "");
          KB::LanguageModelContext::debug_string_for_token(0x200000000, (uint64_t)__p, (KB::String *)&v65);
          TITokenID v39 = (TITokenID)0x200000000;
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v39, (const KB::String *)&v65, 0);
          if (v66 && BYTE6(v65) == 1) {
            free(v66);
          }
          if (v44 < 0) {
            operator delete(__p[0]);
          }
          std::string::basic_string[abi:nn180100]<0>(&v65, "");
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, 0x100000000uLL, (uint64_t)&v65, 0);
          if (v67 < 0) {
            operator delete(v65);
          }
        }
        else if (v37 == 0x200000000)
        {
          if (v35 >= 9 && *(_DWORD *)(v36 - 12) == 6
            || (unint64_t v18 = (KB::String *)[v42 hasSuffix:@"\n"], v18))
          {
            KB::String::empty_string(v18);
            TITokenID v38 = (TITokenID)0x100000000;
            KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v38, (const KB::String *)&KB::String::empty_string(void)::empty_string, 0);
          }
          else
          {
            KB::LanguageModelContext::pop_back(v11);
          }
        }
      }
      [(TIKeyboardInputManager *)self fillReversedConversationHistoryInContext:v10];
    }
    KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)retstr, (const KB::LanguageModelContext *)v11);
    if (v45)
    {
      char v46 = v45;
      operator delete(v45);
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    if (v62)
    {
      long long v63 = v62;
      operator delete(v62);
    }

    id v9 = v42;
  }
  else
  {
    retstr->var7.var2.int var0 = 0;
    *(_OWORD *)&retstr->var7.int var0 = 0u;
    *(_OWORD *)&retstr->var1.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    retstr->int var0 = 0u;
    *(_OWORD *)&retstr->var1.__begin_ = 0u;
    *(_OWORD *)&retstr->var5.var0.var0.int var0 = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&retstr->var5);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&retstr->var6);
    retstr->var7.int var0 = 0;
    retstr->var7.var1 = 0;
    retstr->var7.var2.int var0 = 0;
  }

  return result;
}

uint64_t __67__TIKeyboardInputManager_sentenceContextForInputStem_inputContext___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  uint64_t v13 = a2;
  uint64_t v14 = v13;
  unint64_t v15 = *(void *)(a1 + 56);
  BOOL v16 = v15 > a3;
  unint64_t v17 = v15 - a3;
  if (v16)
  {
    if (v17 >= a4)
    {
      unint64_t v18 = *(void **)(*(void *)(a1 + 48) + 8);
      uint64_t v20 = (void *)v18[7];
      unint64_t v19 = v18[8];
      unint64_t v35 = v13;
      if ((unint64_t)v20 >= v19)
      {
        uint64_t v22 = v18[6];
        uint64_t v23 = ((uint64_t)v20 - v22) >> 3;
        if ((unint64_t)(v23 + 1) >> 61) {
          abort();
        }
        uint64_t v24 = v19 - v22;
        uint64_t v25 = v24 >> 2;
        if (v24 >> 2 <= (unint64_t)(v23 + 1)) {
          uint64_t v25 = v23 + 1;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26) {
          unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v26);
        }
        else {
          uint64_t v27 = 0;
        }
        uint64_t v28 = (void *)(v26 + 8 * v23);
        unint64_t v29 = v26 + 8 * v27;
        *uint64_t v28 = a7;
        uint64_t v21 = v28 + 1;
        TITokenID v31 = (char *)v18[6];
        uint64_t v30 = (char *)v18[7];
        if (v30 != v31)
        {
          do
          {
            uint64_t v32 = *((void *)v30 - 1);
            v30 -= 8;
            *--uint64_t v28 = v32;
          }
          while (v30 != v31);
          uint64_t v30 = (char *)v18[6];
        }
        v18[6] = v28;
        v18[7] = v21;
        unsigned char v18[8] = v29;
        if (v30) {
          operator delete(v30);
        }
        uint64_t v14 = v35;
      }
      else
      {
        void *v20 = a7;
        uint64_t v21 = v20 + 1;
      }
      v18[7] = v21;
      if (v14) {
        unint64_t v33 = v14;
      }
      else {
        unint64_t v33 = &stru_1F3F7A998;
      }
      uint64_t v13 = (__CFString *)[*(id *)(a1 + 32) insertObject:v33 atIndex:0];
      uint64_t v14 = v35;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a8 = 1;
    }
  }

  return MEMORY[0x1F41817F8](v13, v14);
}

- (void)parseRecentMessage:(void *)a3
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__p = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v9);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v10);
  memset(&v10[8], 0, 24);
  LODWORD(v11) = 0;
  [(TIKeyboardInputManager *)self tokenizeString:a3 context:&v5 sentences:&v11];
  operator new();
}

- (void)tokenizeString:(const String *)a3 context:(void *)a4 sentences:(unsigned int *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x5012000000;
  v9[3] = __Block_byref_object_copy__330;
  void v9[4] = __Block_byref_object_dispose__331;
  v9[5] = "";
  int v10 = 0x100000;
  __int16 v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  char v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  uint64_t v5 = *((void *)self->m_impl + 29);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__TIKeyboardInputManager_tokenizeString_context_sentences___block_invoke;
  v6[3] = &unk_1E6E2BF50;
  v6[4] = self;
  v6[5] = v9;
  void v6[6] = v7;
  v6[7] = a4;
  unsigned char v6[8] = a5;
  (*(void (**)(uint64_t, const String *, void *))(*(void *)v5 + 552))(v5, a3, v6);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v9, 8);
  if (v13)
  {
    if (v12 == 1) {
      free(v13);
    }
  }
}

void __59__TIKeyboardInputManager_tokenizeString_context_sentences___block_invoke(uint64_t a1, KB::String *a2, unint64_t *a3)
{
  unint64_t token_id_for_word = *a3;
  if (!HIDWORD(*a3))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 232);
    KB::cf_string_impl<KB::String>((CFStringRef *)&v14, (unsigned __int16 *)a2);
    long long v7 = v14;
    char v8 = *(void **)(a1 + 32);
    uint64_t v9 = (uint64_t *)(v8[5] + 224);
    uint64_t v10 = *(void *)(a1 + 56);
    __int16 v11 = [v8 inputMode];
    char v12 = [v11 locale];
    unint64_t token_id_for_word = KB::LanguageModel::find_token_id_for_word(v6, v7, v9, v10, 0x35u, (uint64_t)v12, (KB::String *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), (BOOL *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

    if (v7) {
      CFRelease(v7);
    }
  }
  TITokenID v13 = (TITokenID)token_id_for_word;
  KB::LanguageModelContext::append(*(KB::LanguageModelContext **)(a1 + 56), v13, a2, 0);
  if (HIDWORD(token_id_for_word) == 1) {
    ++**(_DWORD **)(a1 + 64);
  }
}

- (id)linguisticContext
{
  unint64_t v3 = objc_alloc_init(TIContextTokens);
  KB::LanguageModelContext::operator=((uint64_t)[(TIContextTokens *)v3 lmContext], (uint64_t *)self->m_impl + 54);

  return v3;
}

- (BOOL)canComputeSentenceContextForInputStem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManager *)self revisionHistory];

  if (v5
    && (unint64_t v6 = [v4 length],
        [(TIKeyboardInputManager *)self revisionHistory],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 selectedRange],
        v7,
        v6 <= v8))
  {
    if ([v4 length])
    {
      uint64_t v10 = [(TIKeyboardInputManager *)self revisionHistory];
      uint64_t v11 = [v10 selectedRange];
      uint64_t v12 = v11 - [v4 length];
      uint64_t v13 = [v4 length];

      char v14 = [(TIKeyboardInputManager *)self revisionHistory];
      uint64_t v15 = [v14 documentText];
      uint64_t v16 = objc_msgSend(v15, "rangeOfString:options:range:", v4, 2, v12, v13);
      uint64_t v18 = v17;

      BOOL v9 = v12 == v16 && v13 == v18;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4 didDeleteLastAcceptedPath:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v30 = a3;
  unint64_t v8 = [(TIKeyboardInputManager *)self revisionHistory];
  [v8 syncToDocumentState:v30];

  if ([(TIKeyboardInputManager *)self shouldExtendPriorWord])
  {
    BOOL v9 = [(TIKeyboardInputManager *)self wordSeparator];
    if ([v9 length]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = !v5;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v12 = [v11 documentState];
  uint64_t v13 = [v12 selectedText];

  if (v13)
  {
    [(TIKeyboardInputManager *)self clearInput];
    char v14 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v15 = [v14 currentWord];

    uint64_t v16 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v17 = [v16 documentState];
    uint64_t v18 = [v17 selectedText];
    int v19 = [v15 isEqualToString:v18];

    if (v19) {
      [(TIKeyboardInputManager *)self setOriginalInput:v15];
    }

    goto LABEL_17;
  }
  if (!v10)
  {
    [(TIKeyboardInputManager *)self clearInput];
LABEL_17:
    uint64_t v27 = 0;
    uint64_t v22 = 0;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v24 = -1;
    goto LABEL_18;
  }
  unint64_t v20 = [(TIKeyboardInputManager *)self inputStringRangeFromRevisionHistory];
  uint64_t v22 = v21;
  uint64_t v23 = [(TIKeyboardInputManager *)self revisionHistory];
  unint64_t v24 = [v23 selectedRange];

  if (v22 && v24 >= v20 && v24 <= v20 + v22)
  {
    uint64_t v25 = [(TIKeyboardInputManager *)self revisionHistory];
    unint64_t v26 = [v25 documentText];
    uint64_t v27 = objc_msgSend(v26, "substringWithRange:", v20, v22);

    [(TIKeyboardInputManager *)self setInput:v27 withIndex:(v24 - v20)];
  }
  else
  {
    [(TIKeyboardInputManager *)self clearInput];
    uint64_t v27 = 0;
  }
LABEL_18:
  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    uint64_t v28 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    unint64_t v29 = [(TIKeyboardInputManager *)self keyboardState];
    objc_msgSend(v28, "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v30, v6, v6 ^ 1, v10, v27, v20, v22, v24, v29);
  }
  [(TIKeyboardInputManager *)self _recalcSupplementalPrefix];
  [(TIKeyboardInputManager *)self updateInputContext];
}

- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4
{
}

- (_NSRange)inputStringRangeFromRevisionHistory
{
  unint64_t v3 = [(TIKeyboardInputManager *)self revisionHistory];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x4012000000;
  id v30 = __Block_byref_object_copy__325;
  TITokenID v31 = __Block_byref_object_dispose__326;
  uint64_t v32 = "";
  long long v33 = xmmword_1E4154B50;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x4012000000;
  uint64_t v23 = __Block_byref_object_copy__325;
  unint64_t v24 = __Block_byref_object_dispose__326;
  uint64_t v25 = "";
  long long v26 = xmmword_1E4154B50;
  long long v7 = [(TIKeyboardInputManager *)self revisionHistory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__TIKeyboardInputManager_inputStringRangeFromRevisionHistory__block_invoke;
  v19[3] = &unk_1E6E2BF28;
  v19[6] = v4;
  v19[7] = v6;
  v19[4] = &v20;
  v19[5] = &v27;
  [v7 enumerateSentenceStemUsingBlock:v19];

  uint64_t v8 = v28[6];
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v21[6];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v11 = 0;
    }
    else
    {
      uint64_t v9 = -[TIKeyboardInputManager legacyInputRangeForTokenRange:](self, "legacyInputRangeForTokenRange:", v10, v21[7]);
      NSUInteger v11 = v16;
    }
  }
  else
  {
    uint64_t v12 = v28[7];
    uint64_t v13 = [(TIKeyboardInputManager *)self revisionHistory];
    char v14 = [v13 documentText];
    uint64_t v9 = -[TIKeyboardInputManager acceptableRangeFromRange:inText:withSelectionLocation:](self, "acceptableRangeFromRange:inText:withSelectionLocation:", v8, v12, v14, v4);
    NSUInteger v11 = v15;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v27, 8);
  NSUInteger v17 = v9;
  NSUInteger v18 = v11;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

void *__61__TIKeyboardInputManager_inputStringRangeFromRevisionHistory__block_invoke(void *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  unint64_t v8 = result[6];
  if (a3 + a4 >= v8)
  {
    if (a3 <= v8)
    {
      uint64_t v9 = *(void *)(result[4] + 8);
      *(void *)(v9 + 48) = a3;
      *(void *)(v9 + 56) = a4;
      if ((HIDWORD(a7) - 500) <= 0xFFFFFE0C)
      {
        uint64_t v10 = *(void *)(result[5] + 8);
        *(void *)(v10 + 48) = a3;
        *(void *)(v10 + 56) = a4;
      }
    }
  }
  else
  {
    *a8 = 1;
  }
  return result;
}

- (_NSRange)acceptableRangeFromRange:(_NSRange)a3 inText:(id)a4 withSelectionLocation:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a5 >= location && (BOOL v11 = location + length >= a5, v12 = location + length - a5, v11))
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    unint64_t v31 = a5;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke;
    v25[3] = &unk_1E6E2BF00;
    v25[4] = self;
    id v15 = v9;
    id v26 = v15;
    uint64_t v27 = &v28;
    objc_msgSend(v15, "enumerateSubstringsInRange:options:usingBlock:", a5, v12, 514, v25);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    unint64_t v24 = a5;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke_2;
    v18[3] = &unk_1E6E2BF00;
    v18[4] = self;
    id v19 = v15;
    uint64_t v20 = &v21;
    objc_msgSend(v19, "enumerateSubstringsInRange:options:usingBlock:", location, a5 - location, 770, v18);
    uint64_t v14 = v22[3];
    NSUInteger v13 = v29[3] - v14;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    NSUInteger v13 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v16 = v14;
  NSUInteger v17 = v13;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

uint64_t __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "acceptsRange:inString:", a3, a4, *(void *)(a1 + 40));
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + a4;
  }
  else {
    *a7 = 1;
  }
  return result;
}

uint64_t __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "acceptsRange:inString:", a3, a4, *(void *)(a1 + 40));
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  else {
    *a7 = 1;
  }
  return result;
}

- (_NSRange)legacyInputRangeForTokenRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v17 = 0;
  NSUInteger v18 = &v17;
  uint64_t v19 = 0x2020000000;
  NSUInteger v20 = a3.location;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  NSUInteger v16 = a3.location + a3.length;
  uint64_t v6 = [(TIKeyboardInputManager *)self revisionHistory];
  long long v7 = [v6 documentText];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__TIKeyboardInputManager_legacyInputRangeForTokenRange___block_invoke;
  v12[3] = &unk_1E6E2BED8;
  v12[4] = self;
  v12[5] = &v17;
  void v12[6] = &v13;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", location, length, 2, v12);

  NSUInteger v8 = v18[3];
  NSUInteger v9 = v14[3] - v8;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

void __56__TIKeyboardInputManager_legacyInputRangeForTokenRange___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ([*(id *)(a1 + 32) stringEndsWord:a2])
  {
    NSUInteger v11 = [*(id *)(a1 + 32) revisionHistory];
    unint64_t v12 = [v11 selectedRange];

    if (a3 >= v12)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
      *a7 = 1;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + a4;
    }
  }
}

- (unsigned)simulateAutoshiftIfNecessaryForFlags:(unsigned int)a3
{
  unsigned int v3 = a3;
  if (a3)
  {
    uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
    if ([v5 autocapitalizationEnabled])
    {
    }
    else
    {
      uint64_t v6 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v7 = [v6 autocapitalizationType];

      if (v7 == 2)
      {
        NSUInteger v8 = [(TIKeyboardInputManager *)self keyboardState];
        NSUInteger v9 = [v8 documentState];
        uint64_t v10 = [v9 contextBeforeInput];
        NSUInteger v11 = (void *)v10;
        unint64_t v12 = &stru_1F3F7A998;
        if (v10) {
          unint64_t v12 = (__CFString *)v10;
        }
        uint64_t v13 = v12;

        BOOL v14 = [(TIKeyboardInputManager *)self canStartSentenceAfterString:v13];
        if (v14) {
          v3 |= 2u;
        }
      }
    }
  }
  return v3;
}

- (BOOL)hasLegacyInputString
{
  if (!self->m_impl) {
    return 0;
  }
  if ([(TIKeyboardInputManager *)self hasLegacyInputStem]) {
    return 1;
  }
  m_impl = self->m_impl;
  unsigned int v5 = m_impl[24];
  uint64_t v6 = *((void *)m_impl + 1);
  unsigned int v7 = -858993459 * ((unint64_t)(*((void *)m_impl + 2) - v6) >> 3);
  unsigned int v8 = v5;
  unsigned int v9 = v7 - v5;
  if (v7 > v5)
  {
    uint64_t v10 = (char *)(v6 + 40 * v5 + 32);
    unsigned int v8 = v5;
    while (1)
    {
      char v11 = *v10;
      v10 += 40;
      if ((v11 & 0x40) != 0) {
        break;
      }
      ++v8;
      if (!--v9)
      {
        unsigned int v8 = v7;
        return v5 < v8;
      }
    }
  }
  return v5 < v8;
}

- (BOOL)hasLegacyInputStem
{
  m_impl = self->m_impl;
  if (!m_impl) {
    return 0;
  }
  uint64_t v3 = *((unsigned int *)m_impl + 24);
  uint64_t v4 = v3 + 1;
  uint64_t v5 = 40 * v3 - 8;
  do
  {
    if (!--v4) {
      break;
    }
    char v6 = *(unsigned char *)(m_impl[1] + v5);
    v5 -= 40;
  }
  while ((v6 & 0x40) == 0);
  return v4 < v3;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = v9;
  if (a6) {
    *a6 = 0;
  }
  if (!self->m_impl)
  {
    id v14 = v9;
    goto LABEL_43;
  }
  unsigned int v11 = [(TIKeyboardInputManager *)self simulateAutoshiftIfNecessaryForFlags:v7];
  BOOL v12 = [(TIKeyboardInputManager *)self stringEndsWord:v10];
  if (v12) {
    unsigned int v13 = v11 | 0x40;
  }
  else {
    unsigned int v13 = v11;
  }
  id v14 = [(TIKeyboardInputManager *)self externalStringToInternal:v10];
  unsigned int v15 = [v14 length];
  unsigned int v34 = [(TIKeyboardInputManager *)self inputIndex];
  uint64_t v39 = 0;
  int v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  if ((v15 & 0xFFFFFFFE) != 0)
  {
    if ((v13 & 4) != 0 && ([v14 isEqualToString:v10] & 1) == 0)
    {
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)&v45);
      v51.NSUInteger location = v15;
      KB::utf8_substring((KB *)v14, 0, v51, (uint64_t)v43);
      KB::String::append((unsigned __int16 *)&v45, (const KB::String *)v43);
      if (v44 && v43[6] == 1) {
        free(v44);
      }
      uint64_t v17 = KB::ns_string((KB *)&v45, v16);
      NSUInteger v18 = [(TIKeyboardInputManager *)self internalStringToExternal:v17];

      unint64_t v19 = [v18 length];
      if (v19 <= [v14 length])
      {
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v20 = [v18 length];
        uint64_t v21 = v20 - [v14 length];
      }
      if ([v18 _rangeOfString:v14 fromLocation:v21] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v23 = v10;

        id v14 = v23;
      }

      if (v46 && BYTE6(v45) == 1) {
        free(v46);
      }
    }
    uint64_t v45 = 0;
    char v46 = &v45;
    uint64_t v47 = 0x2020000000;
    unsigned int v48 = v13;
    uint64_t v24 = [v14 length];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __59__TIKeyboardInputManager_addInput_flags_point_firstDelete___block_invoke;
    v35[3] = &unk_1E6E2BEB0;
    v35[4] = self;
    id v14 = v14;
    id v36 = v14;
    unint64_t v37 = &v45;
    TITokenID v38 = &v39;
    objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 514, v35);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    m_impl = (TIInputManager *)self->m_impl;
    KB::utf8_string((KB *)v14, (uint64_t)&v45);
    TIInputManager::add_input(m_impl, (const KB::String *)&v45, v13);
    if (v46 && BYTE6(v45) == 1) {
      free(v46);
    }
    ++v40[3];
  }
  if (self->m_composedText)
  {
    char v33 = v13;
    unsigned int v13 = v12;
    TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)&v45);
    id v26 = KB::ns_string((KB *)&v45, v25);
    if (v46 && BYTE6(v45) == 1) {
      free(v46);
    }
    uint64_t v27 = *((unsigned int *)self->m_impl + 24);
    uint64_t v28 = [(TIKeyboardInputManager *)self internalStringToExternal:v26];
    uint64_t v29 = objc_msgSend(v28, "substringToIndex:", -[TIKeyboardInputManager internalIndexToExternal:](self, "internalIndexToExternal:", v27));
    uint64_t v30 = [(TIKeyboardInputManager *)self suffixOfDesiredString:v29 toAppendToInputString:self->m_composedText withInputIndex:v34 afterDeletionCount:a6];

    [(NSMutableString *)self->m_composedText setString:v28];
    id v14 = (id)v30;
    BOOL v12 = v13;
    LOBYTE(v13) = v33;
  }
  if (![(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    if ((v13 & 2) != 0)
    {
      if (v34)
      {
        unint64_t v31 = self->m_impl;
        if ((*(unsigned char *)(*((void *)v31 + 1) + 40 * (v34 - 1) + 32) & 0x40) != 0) {
          [(TIKeyboardInputManager *)self dropInputPrefix:(v31[24] - *((_DWORD *)v40 + 6))];
        }
      }
    }
    if (!v12) {
      goto LABEL_42;
    }
    KB::String::clear((KB::String *)((char *)self->m_impl + 64));
    goto LABEL_41;
  }
  if (v12)
  {
    [(TIKeyboardInputManager *)self dropInput];
LABEL_41:
    self->_isEditingWordPrefix = 0;
  }
LABEL_42:
  _Block_object_dispose(&v39, 8);
LABEL_43:

  return v14;
}

void __59__TIKeyboardInputManager_addInput_flags_point_firstDelete___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v6 = *(TIInputManager **)(*(void *)(a1 + 32) + 40);
  v10.NSUInteger location = v10.length;
  KB::utf8_substring(*(KB **)(a1 + 40), a3, v10, (uint64_t)v7);
  TIInputManager::add_input(v6, (const KB::String *)v7, *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if (v8 && v7[6] == 1) {
    free(v8);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) &= 4u;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (void)mobileAssetsChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s New LinguisticData OTA assets are available", "-[TIKeyboardInputManager mobileAssetsChanged:]");
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  [(TIKeyboardInputManager *)self setLinguisticResourceStatus:2 reason:@"Mobile assets changed"];
}

- (void)handleTrialParametersUpdateCallback
{
}

- (void)setLinguisticResourceStatus:(unint64_t)a3 reason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v6 = (__CFString *)a4;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    uint64_t v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = NSString;
      unint64_t v9 = [(TIKeyboardInputManager *)self linguisticResourceStatus];
      if (v9 > 2) {
        _NSRange v10 = "Unknown";
      }
      else {
        _NSRange v10 = off_1E6E2C1F0[v9];
      }
      if (a3 > 2) {
        unsigned int v11 = "Unknown";
      }
      else {
        unsigned int v11 = off_1E6E2C1F0[a3];
      }
      BOOL v12 = @"None";
      if (v6) {
        BOOL v12 = v6;
      }
      unsigned int v13 = [v8 stringWithFormat:@"%s linguisticResourceStatus: %s -> %s (%@)", "-[TIKeyboardInputManager setLinguisticResourceStatus:reason:]", v10, v11, v12];
      *(_DWORD *)buf = 138412290;
      unsigned int v15 = v13;
      _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  self->_linguisticResourceStatus = a3;
}

- (shared_ptr<KB::LanguageModel>)loadedLightweightLanguageModel
{
  uint64_t v3 = v2;
  v31[1] = *MEMORY[0x1E4F143B8];
  p_m_lightweight_language_model = &self->m_lightweight_language_model;
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr)
  {
    cntrl = self->m_lightweight_language_model.__cntrl_;
    void *v3 = ptr;
    v3[1] = (LanguageModel *)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v8 = [(TIKeyboardInputManager *)self config];
    unsigned int v27 = [v8 usesWordNgramModel];

    uint64_t v28 = [(TIKeyboardInputManager *)self dynamicResourcePath];
    unint64_t v9 = [(TIKeyboardInputManager *)self config];
    if ([v9 usesCustomNgramModel])
    {
      _NSRange v10 = [(TIKeyboardInputManager *)self config];
      unsigned int v11 = [v10 ngramModelPath];
      v31[0] = v11;
      BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    }
    else
    {
      BOOL v12 = 0;
    }

    id v26 = [(TIKeyboardInputManager *)self languageModelAssets];
    unsigned int v13 = [(TIKeyboardInputManager *)self dictionaryInputMode];
    id v14 = [v13 preferredModelLocaleIdentifier];
    uint64_t v15 = [v13 preferredModelLocaleIsMultilingual];
    uint64_t v16 = [(TIKeyboardInputManagerBase *)self inputMode];
    char v17 = [v16 isSiriMode];
    LOBYTE(v25) = [v13 doesSupportInlineCompletion];
    BYTE2(v24) = v17;
    LOWORD(v24) = 0;
    NSUInteger v18 = +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v14, v15, v12, v28, v26, v27, v24, 0, v25);

    unint64_t v19 = [(TIKeyboardInputManager *)self lexiconLocales];
    if (v18)
    {
      [v18 lightweightLanguageModelForLanguageLocales:v19];
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }

    uint64_t v20 = [(TIKeyboardInputManager *)self config];
    (*(void (**)(LanguageModel *, uint64_t))(*(void *)v29 + 72))(v29, [v20 includeLightWeightLanguageModelMobileAssets]);

    uint64_t v22 = v29;
    uint64_t v21 = v30;
    if (v30) {
      atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v23 = (std::__shared_weak_count *)p_m_lightweight_language_model->__cntrl_;
    p_m_lightweight_language_model->__ptr_ = v29;
    p_m_lightweight_language_model->__cntrl_ = (__shared_weak_count *)v30;
    if (v23)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v23);
      uint64_t v22 = p_m_lightweight_language_model->__ptr_;
      uint64_t v21 = p_m_lightweight_language_model->__cntrl_;
    }
    void *v3 = v22;
    v3[1] = (LanguageModel *)v21;
    if (v21) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v21 + 1, 1uLL, memory_order_relaxed);
    }
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v30);
    }
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)scoreCandidates:(void *)a3
{
  v4[4] = *MEMORY[0x1E4F143B8];
  ptr = self->_refinery.__ptr_;
  v4[0] = &unk_1F3F75B78;
  v4[3] = v4;
  (*(void (**)(CandidateRefinery *, void *, void *))(*(void *)ptr + 56))(ptr, a3, v4);
  std::__function::__value_func<void ()(KB::Candidate &,float)>::~__value_func[abi:nn180100](v4);
}

- (float)scoreCandidates:
{
  float v4 = a2[187];
  float v5 = a2[189];
  float v6 = a2[190];
  float v7 = logf(*a3);
  a2[188] = v7;
  float result = v4 + (float)(v6 * (float)(v7 + v5));
  a2[186] = result;
  return result;
}

- (void)scoreCandidates:
{
}

- (void)loadFavoniusTypingModel
{
}

- (BOOL)updateLanguageModelForKeyboardState
{
  [(TIKeyboardInputManager *)self loadNewLanguageModel];
  m_impl = self->m_impl;
  uint64_t v5 = *((void *)m_impl + 29);
  float v4 = (std::__shared_weak_count *)*((void *)m_impl + 30);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = v27;
  if (v27 != v5)
  {
    float v7 = self->m_impl;
    uint64_t v8 = v28;
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v9 = (std::__shared_weak_count *)*((void *)v7 + 30);
    *((void *)v7 + 29) = v27;
    *((void *)v7 + 30) = v8;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v9);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v8);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)v27 + 32))(v27))
    {
      _NSRange v10 = [(TIKeyboardInputManager *)self config];
      int v11 = [v10 isTesting];

      BOOL v12 = [(TIKeyboardInputManager *)self config];
      int v13 = [v12 maxWordsPerPrediction];

      id v14 = self->m_impl;
      uint64_t v15 = (atomic_uint *)v14[28];
      uint64_t v24 = v15;
      if (v15)
      {
        atomic_fetch_add(v15, 1u);
        id v14 = self->m_impl;
      }
      uint64_t v16 = (std::__shared_weak_count *)v14[30];
      v23[0] = v14[29];
      v23[1] = (uint64_t)v16;
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      KB::NgramCandidateRefinery::create(&v24, v23, v13, v11, &v25);
      NSUInteger v18 = v25;
      char v17 = v26;
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v16);
      }
      if (v24) {
        WTF::RefCounted<KB::DictionaryContainer>::deref((unsigned int *)v24);
      }
    }
    else
    {
      std::allocate_shared[abi:nn180100]<KB::UnigramCandidateRefinery,std::allocator<KB::UnigramCandidateRefinery>,WTF::RefPtr<KB::DictionaryContainer> const&,void>(&v25, *((atomic_uint **)self->m_impl + 28));
      NSUInteger v18 = v25;
      char v17 = v26;
    }
    unint64_t v19 = self->m_impl;
    v22[0] = (uint64_t)v18;
    v22[1] = (uint64_t)v17;
    if (v17)
    {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      TIInputManager::set_candidate_refinery((uint64_t)v19, v22);
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      TIInputManager::set_candidate_refinery((uint64_t)v19, v22);
    }
    cntrl = self->_refinery.__cntrl_;
    self->_refinery.__ptr_ = v18;
    self->_refinery.__cntrl_ = (__shared_weak_count *)v17;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
  }
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v4);
  }
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v28);
  }
  return v6 != v5;
}

- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel
{
  TITokenID v38 = v2;
  v46[1] = *MEMORY[0x1E4F143B8];
  float v4 = [(TIKeyboardInputManager *)self config];
  HIDWORD(v35) = [v4 usesWordNgramModel];

  uint64_t v5 = [(TIKeyboardInputManager *)self config];
  if ([v5 usesAdaptation])
  {
    uint64_t v39 = [(TIKeyboardInputManager *)self dynamicResourcePath];
  }
  else
  {
    uint64_t v39 = 0;
  }

  uint64_t v6 = [(TIKeyboardInputManager *)self config];
  if ([v6 usesCustomNgramModel])
  {
    float v7 = [(TIKeyboardInputManager *)self config];
    uint64_t v8 = [v7 ngramModelPath];
    v46[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v10 = [(TIKeyboardInputManager *)self languageModelAssets];
  int v11 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  BOOL v12 = +[TITrialManagerProxy sharedManager];
  int v13 = [v11 locale];
  id v14 = [v12 encodedLMTrialParametersForLocale:v13];

  uint64_t v15 = [v11 preferredModelLocaleIdentifier];
  uint64_t v16 = [v11 preferredModelLocaleIsMultilingual];
  char v17 = [(TIKeyboardInputManagerBase *)self inputMode];
  char v18 = [v17 isSiriMode];
  LOBYTE(v35) = [v11 doesSupportInlineCompletion];
  id v36 = (void *)v10;
  BYTE2(v34) = v18;
  LOWORD(v34) = 0;
  unint64_t v37 = (void *)v9;
  unint64_t v19 = +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v15, v16, v9, v39, v10, HIDWORD(v35), v34, v14, v35);

  uint64_t v20 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v21 = [v20 clientIdentifier];

  uint64_t v22 = [(TIKeyboardInputManager *)self keyboardState];
  id v23 = [v22 recipientIdentifier];

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__11289;
  v44[4] = __Block_byref_object_dispose__11290;
  uint64_t v24 = self;
  uint64_t v45 = v24;
  uint64_t v25 = [(TIKeyboardInputManager *)v24 keyboardState];
  id v26 = [v25 clientIdentifier];
  uint64_t v27 = [(TIKeyboardInputManager *)v24 keyboardState];
  uint64_t v28 = [v27 recipientIdentifier];
  uint64_t v29 = [(TIKeyboardInputManager *)v24 lexiconLocales];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__TIKeyboardInputManager_loadNewLanguageModel__block_invoke;
  v40[3] = &unk_1E6E2BE88;
  id v30 = v21;
  id v41 = v30;
  uint64_t v43 = v44;
  id v31 = v23;
  id v42 = v31;
  if (v19)
  {
    [v19 sharedLanguageModelForClient:v26 withRecipient:v28 forLanguageLocales:v29 completion:v40];
  }
  else
  {
    *TITokenID v38 = 0;
    v38[1] = 0;
  }

  _Block_object_dispose(v44, 8);
  result.__cntrl_ = v33;
  result.__ptr_ = v32;
  return result;
}

void __46__TIKeyboardInputManager_loadNewLanguageModel__block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = NSString;
  uint64_t v4 = a1[4];
  uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) keyboardState];
  uint64_t v6 = [v5 clientIdentifier];
  if ([v3 _string:v4 matchesString:v6])
  {
    float v7 = NSString;
    uint64_t v8 = a1[5];
    uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) keyboardState];
    uint64_t v10 = [v9 recipientIdentifier];
    LODWORD(v7) = [v7 _string:v8 matchesString:v10];

    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) languageSelectionController];
    [v5 setAdaptationContext:v13];
  }
  else
  {
  }
LABEL_6:
  uint64_t v11 = *(void *)(a1[6] + 8);
  BOOL v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (id)dynamicResourcePath
{
  uint64_t v2 = [(TIKeyboardInputManager *)self config];
  uint64_t v3 = [v2 dynamicResourcePath];

  return v3;
}

- (id)pathToDynamicDictionary
{
  uint64_t v3 = [(TIKeyboardInputManager *)self config];
  uint64_t v4 = [v3 inputMode];
  uint64_t v5 = [(TIKeyboardInputManager *)self dynamicDictionaryPathForInputMode:v4];

  return v5;
}

- (id)trialParameters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  uint64_t v3 = +[TITrialManagerProxy sharedManager];
  uint64_t v4 = [v2 locale];
  uint64_t v5 = [v3 encodedCATrialParametersForLocale:v4];

  return v5;
}

- (id)testingParameters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self trialParameters];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (void)logTestingParametersToTypology
{
  if (self->m_typology_recorder.__ptr_)
  {
    id v4 = [(TIKeyboardInputManager *)self testingParameters];
    uint64_t v3 = [NSString stringWithFormat:@"LM trial param: %@", v4];
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v3];
  }
}

- (NSArray)languageModelAssets
{
  uint64_t v3 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v4 = [(TIKeyboardInputManager *)self languageModelAssetsForInputMode:v3];

  return (NSArray *)v4;
}

- (id)languageModelAssetsForInputMode:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 isSiriMode];
    uint64_t v6 = @"LanguageModel";
    if (v5) {
      uint64_t v6 = @"SiriLanguageModel";
    }
    float v7 = v6;
    uint64_t v8 = [v4 preferredModelLocaleIdentifier];
    uint64_t v9 = +[TIInputMode inputModeWithIdentifier:isSiriMode:](TIInputMode, "inputModeWithIdentifier:isSiriMode:", v8, [v4 isSiriMode]);

    uint64_t v10 = +[TIAssetManager sharedAssetManager];
    uint64_t v11 = [v10 ddsAssetContentItemsWithContentType:v7 inputMode:v9 filteredWithRegion:0];

    BOOL v12 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [NSString stringWithFormat:@"%s Language model asset content items for %@: %@", "-[TIKeyboardInputManager languageModelAssetsForInputMode:]", v4, v11];
      *(_DWORD *)buf = 138412290;
      id v36 = v29;
      _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v13 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = NSString;
      uint64_t v15 = [v4 normalizedIdentifier];
      uint64_t v16 = [v11 count];
      char v17 = [v11 firstObject];
      char v18 = [v17 path];
      unint64_t v19 = [v14 stringWithFormat:@"%s Language model asset count and path for %@: (%lu, %@)", "-[TIKeyboardInputManager languageModelAssetsForInputMode:]", v15, v16, v18];
      *(_DWORD *)buf = 138412290;
      id v36 = v19;
      _os_log_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = [*(id *)(*((void *)&v30 + 1) + 8 * i) path];
          uint64_t v27 = [v26 path];
          [v20 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v23);
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

- (id)dynamicDictionaryPathForInputMode:(id)a3
{
  if (a3)
  {
    id v4 = [a3 languageWithRegion];
    int v5 = [(TIKeyboardInputManager *)self config];
    uint64_t v6 = [v5 dynamicResourcePath];
    float v7 = UIKeyboardDynamicDictionaryFileWithSiriMode(v4, v6, 0);
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

- (id)pathToPhraseDictionary
{
  id v3 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v4 = [(TIKeyboardInputManager *)self phraseDictionaryPathForInputMode:v3];

  return v4;
}

- (id)phraseDictionaryPathForInputMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(TIKeyboardInputManager *)self config];
    int v6 = [v5 usesCustomStaticDictionary];

    if (v6)
    {
      float v7 = NSString;
      uint64_t v8 = [(TIKeyboardInputManager *)self config];
      uint64_t v9 = [(id)v8 staticDictionaryPath];
      uint64_t v10 = *MEMORY[0x1E4FAE630];
      uint64_t v11 = [v4 languageWithRegion];
      BOOL v12 = [v7 stringWithFormat:@"%@/%@%@.dat", v9, v10, v11];

      id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(v8) = [v13 fileExistsAtPath:v12];

      if ((v8 & 1) == 0)
      {
        id v14 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v12 = UIKeyboardPhraseLexiconPathForInputMode(v4);
    }
    id v14 = v12;
    BOOL v12 = v14;
  }
  else
  {
    id v14 = 0;
    BOOL v12 = 0;
  }
LABEL_8:

  return v14;
}

- (id)pathToDeltaStaticDictionary
{
  id v3 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v4 = [(TIKeyboardInputManager *)self deltaDictionaryPathForInputMode:v3];

  return v4;
}

- (id)deltaDictionaryPathForInputMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(TIKeyboardInputManager *)self config];
    int v6 = [v5 usesCustomStaticDictionary];

    if (v6)
    {
      float v7 = NSString;
      uint64_t v8 = [(TIKeyboardInputManager *)self config];
      uint64_t v9 = [(id)v8 staticDictionaryPath];
      uint64_t v10 = *MEMORY[0x1E4FAE628];
      uint64_t v11 = [v4 languageWithRegion];
      BOOL v12 = [v7 stringWithFormat:@"%@/%@%@.dat", v9, v10, v11];

      id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(v8) = [v13 fileExistsAtPath:v12];

      if ((v8 & 1) == 0)
      {
        id v14 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v12 = UIKeyboardDeltaLexiconPathForInputMode(v4);
    }
    id v14 = v12;
    BOOL v12 = v14;
  }
  else
  {
    id v14 = 0;
    BOOL v12 = 0;
  }
LABEL_8:

  return v14;
}

- (id)pathToStaticDictionary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v4 = [(TIKeyboardInputManager *)self staticDictionaryPathForInputMode:v3];

  if (!v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    int v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      float v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s WARNING: Static dictionary not found", "-[TIKeyboardInputManager pathToStaticDictionary]");
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

  return v4;
}

- (id)staticDictionaryPathForInputMode:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v13 = 0;
    goto LABEL_6;
  }
  int v5 = [(TIKeyboardInputManager *)self config];
  int v6 = [v5 usesCustomStaticDictionary];

  if (!v6)
  {
    uint64_t v16 = [v4 normalizedIdentifier];
    int v17 = TIInputModeUseMorphemeLevelLexicon();

    if (v17) {
      UIKeyboardMorphemeLexiconPathForInputMode(v4);
    }
    else {
      UIKeyboardUnigramLexiconPathForInputMode(v4);
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      char v18 = TIOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = NSString;
        unint64_t v21 = [(TIKeyboardInputManager *)self linguisticResourceStatus];
        if (v21 > 2) {
          uint64_t v22 = "Unknown";
        }
        else {
          uint64_t v22 = off_1E6E2C1F0[v21];
        }
        uint64_t v23 = [v20 stringWithFormat:@"%s linguisticResourceStatus: %s, staticDictPath: %s", "-[TIKeyboardInputManager staticDictionaryPathForInputMode:]", v22, objc_msgSend(v13, "UTF8String")];
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v23;
        _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
  float v7 = NSString;
  uint64_t v8 = [(TIKeyboardInputManager *)self config];
  uint64_t v9 = [v8 staticDictionaryPath];
  uint64_t v10 = *MEMORY[0x1E4FAE760];
  uint64_t v11 = [v4 locale];
  BOOL v12 = [v11 languageCode];
  id v13 = [v7 stringWithFormat:@"%@/%@%@.dat", v9, v10, v12];

  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v9) = [v14 fileExistsAtPath:v13];

  if ((v9 & 1) == 0)
  {
LABEL_6:
    uint64_t v15 = 0;
    goto LABEL_16;
  }
LABEL_15:
  id v13 = v13;
  uint64_t v15 = v13;
LABEL_16:

  return v15;
}

- (void)addMultilingualLexiconsFromDiskToVector:(void *)a3 excluding:(const void *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(TIKeyboardInputManager *)self multilingualLocalesOnDisk];
  uint64_t v6 = v31;
  for (uint64_t i = v32; v6 != i; v6 += 24)
  {
    int v7 = *(char *)(v6 + 23);
    if (v7 >= 0) {
      uint64_t v8 = (uint64_t *)v6;
    }
    else {
      uint64_t v8 = *(uint64_t **)v6;
    }
    if (v7 >= 0) {
      unint64_t v9 = *(unsigned __int8 *)(v6 + 23);
    }
    else {
      unint64_t v9 = *(void *)(v6 + 8);
    }
    unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v8, v9);
    int8x8_t v11 = *(int8x8_t *)((char *)a4 + 8);
    if (v11)
    {
      unint64_t v12 = v10;
      uint8x8_t v13 = (uint8x8_t)vcnt_s8(v11);
      v13.i16[0] = vaddlv_u8(v13);
      unint64_t v14 = v13.u32[0];
      if (v13.u32[0] > 1uLL)
      {
        unint64_t v15 = v10;
        if (v10 >= *(void *)&v11) {
          unint64_t v15 = v10 % *(void *)&v11;
        }
      }
      else
      {
        unint64_t v15 = (*(void *)&v11 - 1) & v10;
      }
      uint64_t v16 = *(unsigned __int8 ***)(*(void *)a4 + 8 * v15);
      if (v16)
      {
        for (uint64_t j = *v16; j; uint64_t j = *(unsigned __int8 **)j)
        {
          unint64_t v18 = *((void *)j + 1);
          if (v12 == v18)
          {
            if (std::equal_to<std::string>::operator()[abi:nn180100](j + 16, (unsigned __int8 *)v6)) {
              goto LABEL_52;
            }
          }
          else
          {
            if (v14 > 1)
            {
              if (v18 >= *(void *)&v11) {
                v18 %= *(void *)&v11;
              }
            }
            else
            {
              v18 &= *(void *)&v11 - 1;
            }
            if (v18 != v15) {
              break;
            }
          }
        }
      }
    }
    unint64_t v19 = [NSString stringWithUTF8String:v8];
    [(TIKeyboardInputManager *)self lexiconInfoForMultilingualDynamic:v19];
    unint64_t v20 = *((void *)a3 + 1);
    unint64_t v21 = *((void *)a3 + 2);
    if (v20 >= v21)
    {
      uint64_t v23 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v20 - *(void *)a3) >> 4);
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) > 0x1745D1745D1745DLL) {
        abort();
      }
      unint64_t v25 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v21 - *(void *)a3) >> 4);
      if (2 * v25 > v24) {
        unint64_t v24 = 2 * v25;
      }
      if (v25 >= 0xBA2E8BA2E8BA2ELL) {
        unint64_t v26 = 0x1745D1745D1745DLL;
      }
      else {
        unint64_t v26 = v24;
      }
      v33[4] = (char *)a3 + 16;
      if (v26) {
        unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v26);
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v28 = v26 + 176 * v23;
      v33[0] = v26;
      v33[1] = v28;
      v33[3] = v26 + 176 * v27;
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v28, (uint64_t)&v34);
      v33[2] = v28 + 176;
      std::vector<KB::LexiconInfo>::__swap_out_circular_buffer((uint64_t *)a3, v33);
      uint64_t v22 = *((void *)a3 + 1);
      std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)v33);
    }
    else
    {
      uint64_t v22 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v20, (uint64_t)&v34) + 176;
    }
    *((void *)a3 + 1) = v22;
    if (v43 && v42 == 1) {
      free(v43);
    }
    if (v41 && v40 == 1) {
      free(v41);
    }
    if (v39 && v38 == 1) {
      free(v39);
    }
    if (v37 && v36 == 1) {
      free(v37);
    }
    if (v35 && BYTE6(v34) == 1) {
      free(v35);
    }

LABEL_52:
    ;
  }
  uint64_t v34 = (void **)&v31;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v34);
}

- (vector<std::string,)multilingualLocalesOnDisk
{
  id v4 = [(TIKeyboardInputManager *)self dynamicResourcePath];
  int v5 = (std::string *)[v4 UTF8String];
  memset(&v54, 0, sizeof(v54));
  uint64_t v6 = (std::string *)((char *)v5 - 1);
  do
  {
    int v7 = v6->__r_.__value_.__s.__data_[1];
    uint64_t v6 = (std::string *)((char *)v6 + 1);
  }
  while (v7);
  std::string::append[abi:nn180100]<char const*,0>(&v54.__pn_, v5, v6);

  if (std::__fs::filesystem::path::__filename(&v54).__size_) {
    std::string::push_back(&v54.__pn_, 47);
  }
  std::string::append[abi:nn180100]<char const*,0>(&v54.__pn_, (std::string *)"mul-dynamic.lm/dynamic-lexicon-*.dat", (std::string *)"");
  if (SHIBYTE(v54.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v54.__pn_.__r_.__value_.__l.__data_, v54.__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v54.__pn_;
  }
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_std::string p = &__p;
  }
  else {
    p_std::string p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int64x2_t v65 = 0uLL;
  long long v66 = 0;
  memset(&v64, 0, sizeof(v64));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::append[abi:nn180100]<char const*,0>(&v64.__pn_, p_p, (std::string *)((char *)p_p + size));
  std::__fs::filesystem::path::filename[abi:nn180100]((uint64_t)&v67, &v64);
  if (SHIBYTE(v67.__end_) < 0)
  {
    std::__split_buffer<std::string>::pointer first = v67.__first_;
    std::string::__init_copy_ctor_external(&__str, (const std::string::value_type *)v67.__first_, (std::string::size_type)v67.__begin_);
    operator delete(first);
  }
  else
  {
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = *(_OWORD *)&v67.__first_;
    __str.__r_.__value_.__r.__words[2] = (std::string::size_type)v67.__end_;
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v11 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v11 = __str.__r_.__value_.__l.__size_;
  }
  if (v11)
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    uint8x8_t v13 = memchr(p_str, 42, v11);
    if (v13) {
      std::string::size_type v14 = v13 - (unsigned char *)p_str;
    }
    else {
      std::string::size_type v14 = -1;
    }
  }
  else
  {
    std::string::size_type v14 = -1;
  }
  std::string::basic_string(&v62, &__str, 0, v14, (std::allocator<char> *)&v67);
  std::string::basic_string(&v61, &__str, v14 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v67);
  std::__fs::filesystem::path::__string_view v15 = std::__fs::filesystem::path::__filename(&v64);
  if (v15.__size_)
  {
    if (SHIBYTE(v64.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      int v17 = (std::__fs::filesystem::path *)v64.__pn_.__r_.__value_.__r.__words[0];
      int64_t v16 = (int64_t)&v15.__data_[-v64.__pn_.__r_.__value_.__r.__words[0]];
      if ((const std::string_view::value_type *)v64.__pn_.__r_.__value_.__l.__size_ >= &v15.__data_[-v64.__pn_.__r_.__value_.__r.__words[0]])
      {
        v64.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)&v15.__data_[-v64.__pn_.__r_.__value_.__r.__words[0]];
        goto LABEL_33;
      }
    }
    else
    {
      int64_t v16 = v15.__data_ - (const std::string_view::value_type *)&v64;
      if ((const std::string_view::value_type *)(v15.__data_ - (const std::string_view::value_type *)&v64) <= (const std::string_view::value_type *)HIBYTE(v64.__pn_.__r_.__value_.__r.__words[2]))
      {
        *((unsigned char *)&v64.__pn_.__r_.__value_.__s + 23) = v16 & 0x7F;
        int v17 = &v64;
LABEL_33:
        v17->__pn_.__r_.__value_.__s.__data_[v16] = 0;
        goto LABEL_34;
      }
    }
LABEL_128:
    abort();
  }
LABEL_34:
  std::__fs::filesystem::__status(&v64, 0);
  if (!LOBYTE(v67.__first_) || LOBYTE(v67.__first_) == 255) {
    goto LABEL_115;
  }
  MEMORY[0x1E4E7BB10](&v59, &v64, 0, 0);
  ptr = v59;
  unint64_t v19 = v60;
  if (!v60)
  {
    v58.__imp_.__ptr_ = v59;
    v58.__imp_.__cntrl_ = 0;
    if (v59) {
      goto LABEL_42;
    }
    goto LABEL_110;
  }
  atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
  unint64_t v20 = v60;
  v58.__imp_.__ptr_ = ptr;
  v58.__imp_.__cntrl_ = v19;
  if (v60)
  {
    atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:nn180100](v20);
    ptr = v58.__imp_.__ptr_;
  }
  if (ptr)
  {
    while (1)
    {
LABEL_42:
      unint64_t v21 = std::__fs::filesystem::directory_iterator::__dereference(&v58);
      if (SHIBYTE(v21->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&p, v21->__p_.__pn_.__r_.__value_.__l.__data_, v21->__p_.__pn_.__r_.__value_.__l.__size_);
      }
      else {
        std::string p = (std::string)v21->__p_;
      }
      std::__fs::filesystem::path::filename[abi:nn180100]((uint64_t)&v67, (std::__fs::filesystem::path *)&p);
      if (SHIBYTE(v67.__end_) < 0)
      {
        std::__split_buffer<std::string>::pointer v22 = v67.__first_;
        std::string::__init_copy_ctor_external(&v56, (const std::string::value_type *)v67.__first_, (std::string::size_type)v67.__begin_);
        operator delete(v22);
      }
      else
      {
        *(_OWORD *)&v56.__r_.__value_.__l.__data_ = *(_OWORD *)&v67.__first_;
        v56.__r_.__value_.__r.__words[2] = (std::string::size_type)v67.__end_;
      }
      uint64_t v23 = (v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v62
          : (std::string *)v62.__r_.__value_.__r.__words[0];
      size_t v24 = (v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? HIBYTE(v62.__r_.__value_.__r.__words[2])
          : v62.__r_.__value_.__l.__size_;
      BOOL v25 = std::string::starts_with[abi:nn180100]((uint64_t)&v56, v23, v24);
      char v26 = HIBYTE(v56.__r_.__value_.__r.__words[2]);
      if (v25)
      {
        size_t v27 = (v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v61.__r_.__value_.__r.__words[2])
            : v61.__r_.__value_.__l.__size_;
        unint64_t v28 = (v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v56.__r_.__value_.__r.__words[2])
            : v56.__r_.__value_.__l.__size_;
        if (v28 >= v27)
        {
          uint64_t v29 = (v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &v56
              : (std::string *)v56.__r_.__value_.__r.__words[0];
          long long v30 = (v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &v61
              : (std::string *)v61.__r_.__value_.__r.__words[0];
          int v31 = std::string_view::compare[abi:nn180100]((uint64_t)v29, v28, v28 - v27, 0xFFFFFFFFFFFFFFFFLL, v30, v27);
          char v26 = HIBYTE(v56.__r_.__value_.__r.__words[2]);
          if (!v31) {
            break;
          }
        }
      }
      if (v26 < 0) {
        goto LABEL_70;
      }
LABEL_71:
      if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(p.__r_.__value_.__l.__data_);
      }
      std::__fs::filesystem::directory_iterator::__increment(&v58, 0);
      if (!v58.__imp_.__ptr_) {
        goto LABEL_110;
      }
    }
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v32 = HIBYTE(v62.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v32 = v62.__r_.__value_.__l.__size_;
    }
    if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v33 = HIBYTE(v56.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v33 = v56.__r_.__value_.__l.__size_;
    }
    std::string::size_type v34 = HIBYTE(v61.__r_.__value_.__r.__words[2]);
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v34 = v61.__r_.__value_.__l.__size_;
    }
    std::string::basic_string(&v55, &v56, v32, v33 - (v32 + v34), (std::allocator<char> *)&v67);
    uint64_t v35 = (_OWORD *)v65.i64[1];
    if (v65.i64[1] >= (unint64_t)v66)
    {
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((v65.i64[1] - v65.i64[0]) >> 3);
      unint64_t v38 = v37 + 1;
      if (v37 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_128;
      }
      if (0x5555555555555556 * (((uint64_t)v66 - v65.i64[0]) >> 3) > v38) {
        unint64_t v38 = 0x5555555555555556 * (((uint64_t)v66 - v65.i64[0]) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v66 - v65.i64[0]) >> 3) >= 0x555555555555555) {
        unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v39 = v38;
      }
      v67.__end_cap_.__value_ = (std::allocator<std::string> *)&v66;
      if (v39)
      {
        char v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v39);
        uint64_t v42 = v41;
      }
      else
      {
        char v40 = 0;
        uint64_t v42 = 0;
      }
      uint64_t v44 = (std::string *)&v40[24 * v37];
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v44, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v45 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
        v44->__r_.__value_.__r.__words[2] = v55.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v44->__r_.__value_.__l.__data_ = v45;
      }
      uint64_t v46 = v65.i64[1];
      uint64_t v47 = v65.i64[0];
      if (v65.i64[1] == v65.i64[0])
      {
        int64x2_t v50 = vdupq_n_s64(v65.u64[1]);
        unsigned int v48 = v44;
      }
      else
      {
        unsigned int v48 = v44;
        do
        {
          long long v49 = *(_OWORD *)(v46 - 24);
          v48[-1].__r_.__value_.__r.__words[2] = *(void *)(v46 - 8);
          *(_OWORD *)&v48[-1].__r_.__value_.__l.__data_ = v49;
          --v48;
          *(void *)(v46 - 16) = 0;
          *(void *)(v46 - 8) = 0;
          *(void *)(v46 - 24) = 0;
          v46 -= 24;
        }
        while (v46 != v47);
        int64x2_t v50 = v65;
      }
      uint64_t v43 = v44 + 1;
      v65.i64[0] = (uint64_t)v48;
      v65.i64[1] = (uint64_t)v43;
      *(int64x2_t *)&v67.__begin_ = v50;
      _NSRange v51 = v66;
      long long v66 = (std::string *)&v40[24 * v42];
      v67.__end_cap_.__value_ = v51;
      v67.__first_ = (std::__split_buffer<std::string>::pointer)v50.i64[0];
      std::__split_buffer<std::string>::~__split_buffer(&v67);
    }
    else
    {
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v65.i64[1], v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v36 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
        *(void *)(v65.i64[1] + 16) = *((void *)&v55.__r_.__value_.__l + 2);
        *uint64_t v35 = v36;
      }
      uint64_t v43 = (std::string *)((char *)v35 + 24);
    }
    v65.i64[1] = (uint64_t)v43;
    if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v55.__r_.__value_.__l.__data_);
    }
    if ((*((unsigned char *)&v56.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_71;
    }
LABEL_70:
    operator delete(v56.__r_.__value_.__l.__data_);
    goto LABEL_71;
  }
LABEL_110:
  if (v58.__imp_.__cntrl_) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v58.__imp_.__cntrl_);
  }
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v60);
  }
  *(int64x2_t *)&retstr->int var0 = v65;
  retstr->var2.int var0 = v66;
  retstr = (vector<std::string, std::allocator<std::string>> *)&v65;
LABEL_115:
  retstr->int var0 = 0;
  retstr->var1 = 0;
  retstr->var2.int var0 = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v64.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__pn_.__r_.__value_.__l.__data_);
  }
  v67.__first_ = (std::__split_buffer<std::string>::pointer)&v65;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v67);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v54.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__pn_.__r_.__value_.__l.__data_);
  }
  return result;
}

- ($71865D49803C3560DF570D424868A38C)lexiconInfoForMultilingualDynamic:(SEL)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  int v5 = (KB *)@"mul";
  if (a4)
  {
    v13[0] = @"mul";
    v13[1] = a4;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    uint64_t v8 = [v6 arrayWithObjects:v13 count:2];
    int v5 = [v8 componentsJoinedByString:@"-"];

    id v9 = v7;
    unint64_t v10 = (char *)[v9 UTF8String];

    unsigned int v11 = TILexiconIDForLocaleIdentifier(v10);
  }
  else
  {
    unsigned int v11 = -2;
  }
  KB::utf8_string(v5, (uint64_t)retstr);
  *(_DWORD *)&retstr->var1.int var0 = 0x100000;
  retstr->var1.unsigned __int16 var2 = 0;
  retstr->var1.var3 = 0;
  retstr->var1.var4 = 0;
  retstr->var1.var5[0] = 0;
  *(_DWORD *)&retstr->var2.int var0 = 0x100000;
  retstr->var2.unsigned __int16 var2 = 0;
  retstr->var2.var3 = 0;
  retstr->var2.var4 = 0;
  retstr->var2.var5[0] = 0;
  *(_DWORD *)&retstr->var3.int var0 = 0x100000;
  retstr->var3.unsigned __int16 var2 = 0;
  retstr->var3.var3 = 0;
  retstr->var3.var4 = 0;
  retstr->var3.var5[0] = 0;
  *(_DWORD *)&retstr->var4.int var0 = 0x100000;
  retstr->var4.unsigned __int16 var2 = 0;
  retstr->var4.var3 = 0;
  retstr->var4.var4 = 0;
  retstr->var4.var5[0] = 0;
  retstr->var5 = v11;
  retstr->var6 = 0;
  retstr->var7 = 1.0;

  return result;
}

- ($71865D49803C3560DF570D424868A38C)lexiconInfoForInputMode:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 locale];
  uint64_t v8 = [v7 localeIdentifier];

  id v9 = v8;
  int v10 = TILexiconIDForLocaleIdentifier((char *)[v9 UTF8String]);
  if ([v6 wantsMultilingualUnionOVS]) {
    char v11 = [v6 wantsMultilingualUnionOVS];
  }
  else {
    char v11 = 0;
  }
  KB::utf8_string((KB *)v9, (uint64_t)retstr);
  *(_DWORD *)&retstr->var1.int var0 = 0x100000;
  p_var1 = &retstr->var1;
  p_var1->unsigned __int16 var2 = 0;
  p_var1->var3 = 0;
  p_var1->var4 = 0;
  p_var1->var5[0] = 0;
  *(_DWORD *)&p_var1[1].int var0 = 0x100000;
  uint64_t v13 = (uint64_t)&p_var1[1];
  p_var1[1].unsigned __int16 var2 = 0;
  p_var1[1].var3 = 0;
  p_var1[1].var4 = 0;
  p_var1[1].var5[0] = 0;
  *(_DWORD *)&p_var1[2].int var0 = 0x100000;
  uint64_t v14 = (uint64_t)&p_var1[2];
  p_var1[2].unsigned __int16 var2 = 0;
  p_var1[2].var3 = 0;
  p_var1[2].var4 = 0;
  p_var1[2].var5[0] = 0;
  *(_DWORD *)&p_var1[3].int var0 = 0x100000;
  uint64_t v15 = (uint64_t)&p_var1[3];
  p_var1[3].unsigned __int16 var2 = 0;
  p_var1[3].var3 = 0;
  p_var1[3].var4 = 0;
  p_var1[3].var5[0] = 0;
  *(_DWORD *)&p_var1[4].int var0 = v10;
  LOBYTE(p_var1[4].var2) = v11;
  LODWORD(p_var1[4].var4) = 0;
  int64_t v16 = [(TIKeyboardInputManager *)self staticDictionaryPathForInputMode:v6];
  if ([(KB *)v16 length])
  {
    KB::utf8_string(v16, (uint64_t)v21);
    KB::String::operator=((uint64_t)p_var1, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1) {
        free(v23);
      }
    }
  }
  int v17 = [(TIKeyboardInputManager *)self deltaDictionaryPathForInputMode:v6];
  if ([(KB *)v17 length])
  {
    KB::utf8_string(v17, (uint64_t)v21);
    KB::String::operator=(v13, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1) {
        free(v23);
      }
    }
  }
  unint64_t v18 = [(TIKeyboardInputManager *)self phraseDictionaryPathForInputMode:v6];
  if ([(KB *)v18 length])
  {
    KB::utf8_string(v18, (uint64_t)v21);
    KB::String::operator=(v14, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1) {
        free(v23);
      }
    }
  }
  unint64_t v19 = [(TIKeyboardInputManager *)self dynamicDictionaryPathForInputMode:v6];
  if ([(KB *)v19 length])
  {
    KB::utf8_string(v19, (uint64_t)v21);
    KB::String::operator=(v15, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1) {
        free(v23);
      }
    }
  }

  return result;
}

- (void)loadDictionaries
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (self->m_impl)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      id v3 = TIOSLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading/reloading dictionaries.", "-[TIKeyboardInputManager loadDictionaries]");
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v4 = [(TIKeyboardInputManager *)self dictionaryInputMode];
    int v5 = [v4 languageWithRegion];

    m_impl = (TIInputManager *)self->m_impl;
    KB::utf8_string(v5, (uint64_t)buf);
    TIInputManager::set_locale_identifier(m_impl, (const KB::String *)buf);
    if (*(void *)&buf[8] && buf[6] == 1) {
      free(*(void **)&buf[8]);
    }
    [(TIKeyboardInputManager *)self lexiconInformation];
    id v7 = operator new(0xB0uLL);
    *(void *)&long long v38 = v7;
    v39[0] = v7 + 88;
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v7, (uint64_t)buf);
    *((void *)&v38 + 1) = v7 + 88;
    if (v50 && v49 == 1) {
      free(v50);
    }
    if (v48 && v47 == 1) {
      free(v48);
    }
    if (v46 && v45 == 1) {
      free(v46);
    }
    if (v44 && v43 == 1) {
      free(v44);
    }
    if (*(void *)&buf[8] && buf[6] == 1) {
      free(*(void **)&buf[8]);
    }
    if (v7[16])
    {
      uint64_t v8 = v5;
      [(KB *)v8 UTF8String];
      if (!_os_feature_enabled_impl()) {
        goto LABEL_97;
      }
      [(TIKeyboardInputManager *)self lexiconInfoForMultilingualDynamic:v8];
      if (*((void *)&v38 + 1) >= v39[0])
      {
        uint64_t v11 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v38 + 1) - v38) >> 4);
        if ((unint64_t)(v11 + 1) > 0x1745D1745D1745DLL) {
          goto LABEL_99;
        }
        unint64_t v12 = 0x5D1745D1745D1746 * ((uint64_t)(v39[0] - v38) >> 4);
        if (v12 <= v11 + 1) {
          unint64_t v12 = v11 + 1;
        }
        if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v39[0] - v38) >> 4)) >= 0xBA2E8BA2E8BA2ELL) {
          unint64_t v13 = 0x1745D1745D1745DLL;
        }
        else {
          unint64_t v13 = v12;
        }
        std::__fs::filesystem::path v54 = v39;
        if (v13) {
          unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v13);
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = v13 + 16 * ((uint64_t)(*((void *)&v38 + 1) - v38) >> 4);
        _NSRange v51 = (void *)v13;
        v52.i64[0] = v15;
        unint64_t v53 = v13 + 176 * v14;
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v15, (uint64_t)buf);
        uint64_t v9 = v15 + 176;
        v52.i64[1] = v15 + 176;
        uint64_t v16 = *((void *)&v38 + 1);
        uint64_t v17 = v52.i64[0];
        if (*((void *)&v38 + 1) == (void)v38)
        {
          int64x2_t v18 = vdupq_n_s64(*((unint64_t *)&v38 + 1));
        }
        else
        {
          do
          {
            v16 -= 176;
            uint64_t v17 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v17 - 176, v16);
          }
          while (v16 != (void)v38);
          int64x2_t v18 = (int64x2_t)v38;
          uint64_t v9 = v52.i64[1];
        }
        *(void *)&long long v38 = v17;
        *((void *)&v38 + 1) = v9;
        int64x2_t v52 = v18;
        unint64_t v19 = v39[0];
        v39[0] = v53;
        unint64_t v53 = v19;
        _NSRange v51 = (void *)v18.i64[0];
        std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v51);
      }
      else
      {
        uint64_t v9 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(*((uint64_t *)&v38 + 1), (uint64_t)buf)+ 176;
      }
      *((void *)&v38 + 1) = v9;
      if (v50 && v49 == 1) {
        free(v50);
      }
      if (v48 && v47 == 1) {
        free(v48);
      }
      if (v46 && v45 == 1) {
        free(v46);
      }
      if (v44 && v43 == 1) {
        free(v44);
      }
      if (*(void *)&buf[8] && buf[6] == 1) {
        free(*(void **)&buf[8]);
      }
      std::string::basic_string[abi:nn180100]<0>(&v51, (char *)[(KB *)v8 UTF8String]);
      *(_OWORD *)buf = 0u;
      long long v41 = 0u;
      int v42 = 1065353216;
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)buf, (uint64_t)&v51, (uint64_t)&v51);
      [(TIKeyboardInputManager *)self addMultilingualLexiconsFromDiskToVector:&v38 excluding:buf];
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)buf);
      if (v52.i8[15] < 0) {
        operator delete(v51);
      }
      [(TIKeyboardInputManager *)self lexiconInfoForMultilingualDynamic:0];
      if (*((void *)&v38 + 1) < v39[0])
      {
        uint64_t v20 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(*((uint64_t *)&v38 + 1), (uint64_t)buf)+ 176;
LABEL_82:
        *((void *)&v38 + 1) = v20;
        if (v50 && v49 == 1) {
          free(v50);
        }
        if (v48 && v47 == 1) {
          free(v48);
        }
        if (v46 && v45 == 1) {
          free(v46);
        }
        if (v44 && v43 == 1) {
          free(v44);
        }
        if (*(void *)&buf[8])
        {
          if (buf[6] == 1) {
            free(*(void **)&buf[8]);
          }
        }
LABEL_97:
        int v31 = [(TIKeyboardInputManager *)self config];
        [v31 isTesting];

        std::string::size_type v32 = self->m_impl;
        memset(v37, 0, sizeof(v37));
        std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(v37, v38, *((uint64_t *)&v38 + 1), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v38 + 1) - v38) >> 4));
        TIInputManager::load_dictionaries((uint64_t)v32, (const __CFString *)v37);
      }
      uint64_t v21 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v38 + 1) - v38) >> 4);
      if ((unint64_t)(v21 + 1) <= 0x1745D1745D1745DLL)
      {
        unint64_t v22 = 0x5D1745D1745D1746 * ((uint64_t)(v39[0] - v38) >> 4);
        if (v22 <= v21 + 1) {
          unint64_t v22 = v21 + 1;
        }
        if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v39[0] - v38) >> 4)) >= 0xBA2E8BA2E8BA2ELL) {
          unint64_t v23 = 0x1745D1745D1745DLL;
        }
        else {
          unint64_t v23 = v22;
        }
        std::__fs::filesystem::path v54 = v39;
        if (v23) {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v23);
        }
        else {
          uint64_t v24 = 0;
        }
        uint64_t v25 = v23 + 176 * v21;
        _NSRange v51 = (void *)v23;
        v52.i64[0] = v25;
        unint64_t v53 = v23 + 176 * v24;
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v25, (uint64_t)buf);
        uint64_t v20 = v25 + 176;
        v52.i64[1] = v25 + 176;
        uint64_t v26 = *((void *)&v38 + 1);
        uint64_t v27 = v38;
        uint64_t v28 = v52.i64[0];
        if (*((void *)&v38 + 1) == (void)v38)
        {
          int64x2_t v29 = vdupq_n_s64(*((unint64_t *)&v38 + 1));
        }
        else
        {
          do
          {
            v26 -= 176;
            uint64_t v28 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v28 - 176, v26);
          }
          while (v26 != v27);
          int64x2_t v29 = (int64x2_t)v38;
          uint64_t v20 = v52.i64[1];
        }
        *(void *)&long long v38 = v28;
        *((void *)&v38 + 1) = v20;
        int64x2_t v52 = v29;
        unint64_t v30 = v39[0];
        v39[0] = v53;
        unint64_t v53 = v30;
        _NSRange v51 = (void *)v29.i64[0];
        std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v51);
        goto LABEL_82;
      }
LABEL_99:
      abort();
    }
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    int v10 = TIOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      std::string::size_type v34 = NSString;
      uint64_t v35 = [(TIKeyboardInputManager *)self dictionaryInputMode];
      long long v36 = [v34 stringWithFormat:@"%s WARNING: Input manager failed to load static dictionary for: %@", "-[TIKeyboardInputManager loadDictionaries]", v35];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    *(void *)buf = &v38;
    std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
}

- ($71865D49803C3560DF570D424868A38C)lexiconInformation
{
  v30[2] = *MEMORY[0x1E4F143B8];
  int v5 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v6 = [v5 locale];
  id v7 = [v6 localeIdentifier];

  KB::utf8_string(v7, (uint64_t)v27);
  uint64_t v8 = [(TIKeyboardInputManager *)self pathToStaticDictionary];
  KB::utf8_string(v8, (uint64_t)v25);

  uint64_t v9 = [(TIKeyboardInputManager *)self pathToDeltaStaticDictionary];
  KB::utf8_string(v9, (uint64_t)v23);

  int v10 = [(TIKeyboardInputManager *)self pathToPhraseDictionary];
  KB::utf8_string(v10, (uint64_t)v21);

  uint64_t v11 = [(TIKeyboardInputManager *)self pathToDynamicDictionary];
  KB::utf8_string(v11, (uint64_t)v19);

  unint64_t v12 = v29;
  if (!v29) {
    unint64_t v12 = (char *)v30;
  }
  if (v27[0]) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = "";
  }
  unsigned int v14 = TILexiconIDForLocaleIdentifier(v13);
  uint64_t v15 = [(TIKeyboardInputManagerBase *)self inputMode];
  if ([v15 wantsMultilingualUnionOVS])
  {
    uint64_t v16 = [(TIKeyboardInputManagerBase *)self inputMode];
    char v17 = [v16 wantsMultilingualUnionOVS];
  }
  else
  {
    char v17 = 0;
  }

  KB::String::String((KB::String *)retstr, (const KB::String *)v27);
  KB::String::String((KB::String *)&retstr->var1, (const KB::String *)v25);
  KB::String::String((KB::String *)&retstr->var2, (const KB::String *)v23);
  KB::String::String((KB::String *)&retstr->var3, (const KB::String *)v21);
  KB::String::String((KB::String *)&retstr->var4, (const KB::String *)v19);
  retstr->var5 = v14;
  retstr->var6 = v17;
  retstr->var7 = 1.0;
  if (v20 && v19[6] == 1) {
    free(v20);
  }
  if (v22 && v21[6] == 1) {
    free(v22);
  }
  if (v24 && v23[6] == 1) {
    free(v24);
  }
  if (v26 && v25[6] == 1) {
    free(v26);
  }
  if (v29 && v28 == 1) {
    free(v29);
  }

  return result;
}

- (id)lexiconLocales
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(TIKeyboardInputManager *)self dictionaryInputMode];
  id v3 = [v2 locale];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)dictionaryInputMode
{
  id v3 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  id v4 = [v3 dictionaryInputMode];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(TIKeyboardInputManager *)self config];
    id v6 = [v7 inputMode];
  }

  return v6;
}

- (void)initImplementation
{
  shared_ptr<KB::LanguageModel> result = self->m_impl;
  if (!result)
  {
    id v4 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    int v5 = [(TIKeyboardInputManager *)self config];
    id v6 = [v5 dynamicResourcePath];
    self->m_impl = (void *)[v4 createInputManager:v6];

    if (self->m_impl)
    {
      id v7 = [(TIKeyboardInputManager *)self config];
      int v8 = [v7 usesContinuousPathRetrocorrection];

      shared_ptr<KB::LanguageModel> result = self->m_impl;
      if (v8)
      {
        uint64_t v9 = *((void *)result + 23);
        if (v9)
        {
          (*(void (**)(void, uint64_t))(*(void *)v9 + 392))(*((void *)result + 23), 1);
          return self->m_impl;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)externalStringForDictionaryString:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager *)self dictionaryUsesExternalEncoding])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(TIKeyboardInputManager *)self internalStringToExternal:v4];
  }
  id v6 = v5;

  return v6;
}

- (id)dictionaryStringForExternalString:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  if ([(TIKeyboardInputManager *)self dictionaryUsesExternalEncoding])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(TIKeyboardInputManager *)self externalStringToInternal:v4];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 dictionaryUsesExternalEncoding];

  return v3;
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  unsigned int v3 = a3;
  m_impl = self->m_impl;
  if (!m_impl) {
    return v3;
  }
  m_composedText = self->m_composedText;
  if (m_composedText)
  {
    if ([(NSMutableString *)m_composedText length] <= (unint64_t)a3)
    {
      id v7 = [(TIKeyboardInputManager *)self externalStringToInternal:self->m_composedText];
      unsigned int v3 = [v7 length];
    }
    else
    {
      id v7 = [(NSMutableString *)self->m_composedText substringToIndex:v3];
      int v8 = [(TIKeyboardInputManager *)self externalStringToInternal:v7];
      unsigned int v3 = [v8 length];
    }
    m_impl = self->m_impl;
    if (!m_impl) {
      return v3;
    }
  }
  unsigned int v9 = -858993459 * ((m_impl[2] - m_impl[1]) >> 3);
  if (v3 >= v9) {
    return v9;
  }
  else {
    return v3;
  }
}

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (m_impl)
  {
    if (self->m_composedText)
    {
      TIInputManager::input_substring(m_impl + 4, 0, a3, (uint64_t)v10);
      id v7 = KB::ns_string((KB *)v10, v6);
      int v8 = [(TIKeyboardInputManager *)self internalStringToExternal:v7];
      unsigned int v3 = [v8 length];

      if (v11)
      {
        if (v10[6] == 1) {
          free(v11);
        }
      }
    }
  }
  return v3;
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  id v6 = [v5 internalStringToExternal:v4];

  return v6;
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  id v6 = [v5 externalStringToInternal:v4];

  return v6;
}

- (void)updateComposedText
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (m_impl && self->m_composedText)
  {
    TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((void *)m_impl + 2) - *((void *)m_impl + 1)) >> 3), (uint64_t)v7);
    id v5 = KB::ns_string((KB *)v7, v4);
    if (v8)
    {
      if (v7[6] == 1) {
        free(v8);
      }
    }
    id v6 = [(TIKeyboardInputManager *)self internalStringToExternal:v5];
    [(NSMutableString *)self->m_composedText setString:v6];
  }
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 deletesByComposedCharacterSequence];

  return v3;
}

- (BOOL)acceptInputString:(id)a3
{
  return 1;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self currentState];
  char v6 = [v5 stringEndsWord:v4];

  return v6;
}

- (id)remainingInput
{
  return 0;
}

- (id)didAcceptCandidate:(id)a3
{
  return 0;
}

- (BOOL)removeSuffixOfInputContext:(id)a3
{
  return 0;
}

- (id)deletedSuffixOfInputContext:(id)a3 whenDeletingFromInputString:(id)a4 withInputIndex:(unint64_t)a5 deletionCount:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (a6)
  {
    uint64_t v11 = [v9 stringByAppendingString:v10];
    unint64_t v12 = [v9 length] + a5;
    if (v12)
    {
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [v11 _rangeOfBackwardDeletionClusterAtIndex:v12 - 1];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        unint64_t v15 = v14;
        ++v13;
        if (v14)
        {
          unint64_t v12 = v14;
          if (v13 < a6) {
            continue;
          }
        }
        goto LABEL_11;
      }
      unint64_t v15 = v12;
    }
    else
    {
      unint64_t v15 = 0;
      unint64_t v13 = 0;
    }
LABEL_11:
    if (v13 == a6 && v15 < [v9 length])
    {
      uint64_t v16 = [v9 substringFromIndex:v15];
    }
    else
    {
      uint64_t v16 = &stru_1F3F7A998;
    }
  }
  else
  {
    uint64_t v16 = &stru_1F3F7A998;
  }

  return v16;
}

- (id)suffixOfDesiredString:(id)a3 toAppendToInputString:(id)a4 withInputIndex:(unint64_t)a5 afterDeletionCount:(unint64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (a6) {
    *a6 = 0;
  }
  if ([v10 length] < a5) {
    a5 = [v11 length];
  }
  if (a5)
  {
    do
    {
      unint64_t v12 = [v11 substringToIndex:a5];
      char v13 = [v9 hasPrefix:v12];

      if (v13) {
        break;
      }
      unint64_t v14 = [v11 _rangeOfBackwardDeletionClusterAtIndex:a5 - 1];
      a5 = v14;
      if (a6) {
        ++*a6;
      }
    }
    while (v14);
  }
  unint64_t v15 = [v9 substringFromIndex:a5];

  return v15;
}

- (BOOL)shouldInsertSpaceBeforeInput:(id)a3
{
  id v4 = a3;
  if (![(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    id v5 = [(TIKeyboardInputManager *)self config];
    char v6 = [v5 insertsSpaceAfterPredictiveInput];

    if ((v6 & 1) == 0)
    {
      int v8 = [(TIKeyboardInputManager *)self lastAcceptedText];
      id v9 = v8;
      if (!v8
        || ![v8 isContinuousPathConversion]
        || ![v9 shouldAccept])
      {
        goto LABEL_16;
      }
      id v10 = [(TIKeyboardInputManager *)self wordSeparator];
      if ([v10 length])
      {
        uint64_t v11 = [v9 candidate];
        unint64_t v12 = [(TIKeyboardInputManager *)self wordSeparator];
        char v13 = [v11 hasSuffix:v12];

        if (v13) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      if ([v4 length])
      {
        unint64_t v14 = [(TIKeyboardInputManager *)self wordSeparator];
        if ([v4 isEqualToString:v14])
        {
LABEL_15:

LABEL_16:
          BOOL v7 = 0;
LABEL_17:

          goto LABEL_18;
        }
        unint64_t v15 = [(TIKeyboardInputManager *)self pathedWordSeparator];
        if ([v4 isEqualToString:v15])
        {

          goto LABEL_15;
        }
        char v17 = [v4 isEqualToString:@"\n"];

        if (v17) {
          goto LABEL_16;
        }
        int64x2_t v18 = [(TIKeyboardInputManager *)self terminatorsDeletingAutospace];
        unint64_t v19 = [v18 characterSet];
        char v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

        if (v20) {
          goto LABEL_16;
        }
        if ([v9 isContinuousPathConversion])
        {
          if ([v9 shouldAccept])
          {
            uint64_t v21 = [(TIKeyboardInputManager *)self spaceDeletingCharacters];
            unint64_t v22 = [v21 characterSet];
            char v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

            if (v23) {
              goto LABEL_16;
            }
          }
        }
        uint64_t v24 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v25 = [v24 documentState];
        uint64_t v26 = [v25 contextBeforeInput];

        uint64_t v27 = -[TIKeyboardInputManager rangeOfUnclosedQuoteMatchingQuote:inString:range:](self, "rangeOfUnclosedQuoteMatchingQuote:inString:range:", v4, v26, 0, [v26 length]);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_16;
        }
      }
      BOOL v7 = 1;
      goto LABEL_17;
    }
  }
  BOOL v7 = 0;
LABEL_18:

  return v7;
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  BOOL v6 = a4;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if ([v8 isResponseKitCandidate])
    {
      id v10 = +[TIProactiveQuickTypeManager sharedInstance];
      int v11 = [v10 usePQT2Flow];

      if (v11)
      {
        unint64_t v12 = +[TIProactiveQuickTypeManager sharedInstance];
        char v13 = [v8 candidate];
        [v12 provideFeedbackForString:v13 type:1 style:1];
      }
    }
  }
  if (v8 && self->m_impl)
  {
    if (([v8 isAutocorrection] & 1) == 0)
    {
      uint64_t v14 = [(TIKeyboardInputManager *)self lastAcceptedText];
      if (v14)
      {
        unint64_t v15 = (void *)v14;
        uint64_t v16 = [(TIKeyboardInputManager *)self lastAcceptedText];
        if ([v16 isContinuousPathConversion])
        {
          char v17 = [(TIKeyboardInputManager *)self lastAcceptedText];
          int64x2_t v18 = [v17 candidate];
          [v8 candidate];
          char v20 = v19 = v9;
          char v115 = [v18 isEqualToString:v20];

          id v9 = v19;
          if (v115) {
            goto LABEL_71;
          }
        }
        else
        {
        }
      }
    }
    uint64_t v21 = [(TIKeyboardInputManager *)self revisionHistory];

    if (v21)
    {
      if ([v8 isAutocorrection])
      {
        [(TIKeyboardInputManager *)self recordAcceptedAutocorrection:v8 fromPredictiveInputBar:v6];
      }
      else
      {
        [(TIKeyboardInputManager *)self recordRejectedAutocorrectionForAcceptedText:v8 fromPredictiveInputBar:v6];
        if ([(TIKeyboardInputManager *)self rejectionsDatabase])
        {
          if (v6)
          {
            unint64_t v22 = [v8 candidate];
            char v23 = [v8 input];
            int v24 = [v22 isEqualToString:v23];

            if (v24)
            {
              uint64_t v25 = [(TIKeyboardInputManager *)self autocorrectionForCurrentStem];
              uint64_t v26 = [v8 input];
              uint64_t v27 = [v25 objectForKey:v26];

              char v28 = [(TIKeyboardInputManager *)self revisionHistory];
              int64x2_t v29 = [v8 input];
              [v28 rejectCandidate:v27 forInput:v29 hint:3];
            }
          }
        }
      }
      if (([v9 isSynthesizedByAcceptingCandidate] & 1) != 0
        || ![v8 isAutocorrection])
      {
        uint64_t v36 = 0;
      }
      else
      {
        unint64_t v30 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
        int v31 = [v8 input];
        std::string::size_type v32 = [v30 objectForKeyedSubscript:v31];
        [v32 autocorrection];
        std::string::size_type v33 = v116 = v9;
        std::string::size_type v34 = [v33 candidate];
        uint64_t v35 = [v8 candidate];
        uint64_t v36 = [v34 isEqualToString:v35];

        id v9 = v116;
      }
      unint64_t v37 = [(TIKeyboardInputManager *)self revisionHistory];
      [v37 acceptText:v8 isAutocorrection:v36 isAutoshifted:TIInputManager::is_autoshift((TIInputManager *)self->m_impl)];
    }
    long long v38 = [(TIKeyboardInputManager *)self rejectionsDatabase];
    if (v38)
    {
      unint64_t v39 = v38;
      if ([v9 isSynthesizedByAcceptingCandidate])
      {
        char v40 = [v8 input];
        long long v41 = [v8 candidate];
        char v42 = [v40 isEqualToString:v41];

        if ((v42 & 1) == 0)
        {
          id v43 = [v8 input];
          uint64_t v44 = (const char *)[v43 UTF8String];
          id v45 = [v8 candidate];
          TI::RejectionsDatabase::insert_acceptance(v39, v44, (const char *)[v45 UTF8String], 1, 0);
        }
      }
    }
    uint64_t v46 = [(TIKeyboardInputManagerBase *)self inputMode];
    TIStatisticsLogCandidateAcceptance(v8, v46);

    if (![(TIKeyboardInputManager *)self usesCandidateSelection])
    {
      id v117 = v9;
      int v47 = [(TIKeyboardInputManager *)self shiftContext];
      uint64_t v114 = [(TIKeyboardInputManager *)self inputStem];
      m_impl = self->m_impl;
      char v49 = [v8 candidate];
      int64x2_t v50 = [(TIKeyboardInputManager *)self externalStringToInternal:v49];
      KB::utf8_string(v50, (uint64_t)v121);
      _NSRange v51 = [v8 input];
      int64x2_t v52 = [(TIKeyboardInputManager *)self externalStringToInternal:v51];
      KB::utf8_string(v52, (uint64_t)v118);
      TIInputManager::text_accepted((uint64_t)m_impl, v121, v118, [v8 wordOriginFeedbackID], v47, objc_msgSend(v8, "isContinuousPathConversion"));
      if (v120 && v119 == 1) {
        free(v120);
      }

      if (v123 && v122 == 1) {
        free(v123);
      }

      [(TIKeyboardInputManager *)self updateComposedText];
      if (![(TIKeyboardInputManager *)self shouldAllowCorrectionOfAcceptedCandidate:v8])
      {
        unint64_t v53 = self->m_impl;
        unsigned int v54 = v53[24];
        unsigned int v55 = v53[43];
        if (v55 <= v54) {
          unsigned int v55 = v53[24];
        }
        if (v53[44] < v54) {
          unsigned int v54 = v53[44];
        }
        v53[43] = v55;
        v53[44] = v54;
      }
      std::string v56 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v57 = [v56 documentState];
      std::__fs::filesystem::directory_iterator v58 = [v8 input];
      int v59 = [v8 candidate];
      uint64_t v60 = [v57 documentStateAfterReplacingText:v58 withText:v59];
      std::string v61 = [(TIKeyboardInputManager *)self keyboardState];
      [v61 setDocumentState:v60];

      if ([v8 isContinuousPathConversion])
      {
        std::string v62 = (void **)self->m_impl;
        (*(void (**)(void *))(*v62[23] + 352))(v62[23]);
        *((_DWORD *)v62 + 98) = -1;
        KB::ContinuousPathDetector::clear_completed_paths(v62 + 41);
        long long v63 = [(TIKeyboardInputManager *)self config];
        char v64 = [v63 usesContinuousPathRetrocorrection];

        if ((v64 & 1) != 0 && !v6) {
          [(TIKeyboardInputManager *)self trimInputAfterLathamConversion];
        }
        else {
          [(TIKeyboardInputManager *)self dropInput];
        }
      }
      else
      {
        [(TIKeyboardInputManager *)self updateComposedText];
        [(TIKeyboardInputManager *)self updateInputContext];
      }
      if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
      {
        int64x2_t v65 = objc_msgSend(v8, "candidateByReplacingWithSourceMask:", -[TIKeyboardInputManager adjustedSourceMaskFromCandidate:](self, "adjustedSourceMaskFromCandidate:", v8));
        long long v66 = [(TIKeyboardInputManager *)self typingSessionMonitor];
        std::__split_buffer<std::string> v67 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v68 = [v67 documentState];
        long long v69 = [(TIKeyboardInputManager *)self inputContext];
        uint64_t v70 = [(TIKeyboardInputManager *)self keyboardState];
        LOBYTE(v113) = 0;
        [v66 candidateAccepted:v65 withInput:v117 documentState:v68 inputContext:v69 inputStem:v114 predictionBarHit:v6 useCandidateSelection:v113 candidateIndex:0x7FFFFFFFFFFFFFFFLL keyboardState:v70];
      }
      uint64_t v71 = [(TIKeyboardInputManager *)self hitTestCorrectedInputMatchingCandidate];

      id v9 = v117;
      if (v71)
      {
        if (([v8 isAutocorrection] & 1) == 0)
        {
          uint64_t v72 = [v8 input];
          uint64_t v73 = [(TIKeyboardInputManager *)self hitTestCorrectedInputMatchingCandidate];
          BOOL v74 = [v73 input];
          int v75 = [v72 isEqualToString:v74];

          if (v75)
          {
            uint64_t v76 = [v8 input];
            TITokenID v77 = [(TIKeyboardInputManager *)self findTokenIDForWord:v76 contextTokens:0 tokenLookupMode:0];

            if (HIDWORD(*(unint64_t *)&v77))
            {
              uint64_t v78 = *MEMORY[0x1E4FAEAE8];
              uint64_t v79 = [(TIKeyboardInputManager *)self hitTestCorrectedInputMatchingCandidate];
              -[TIKeyboardInputManager incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:](self, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", v78, [v79 usageTrackingMask]);
            }
          }
        }
        [(TIKeyboardInputManager *)self setHitTestCorrectedInputMatchingCandidate:0];
      }
      uint64_t v80 = [(TIKeyboardInputManager *)self lastAcceptedText];

      if (v80) {
        [(TIKeyboardInputManager *)self setRejectedConversionsForCurrentContinuousPath:0];
      }
      id v81 = v8;
      uint64_t v82 = v81;
      if ([v81 isContinuousPathConversion])
      {
        uint64_t v83 = [v81 candidate];
        uint64_t v84 = [(TIKeyboardInputManager *)self wordSeparator];
        int v85 = [v83 hasPrefix:v84];

        uint64_t v82 = v81;
        if (v85)
        {
          v86 = [v81 candidate];
          uint64_t v87 = [(TIKeyboardInputManager *)self wordSeparator];
          uint64_t v88 = objc_msgSend(v86, "substringFromIndex:", objc_msgSend(v87, "length"));
          uint64_t v82 = [v81 candidateByReplacingWithCandidate:v88];
        }
      }
      [(TIKeyboardInputManager *)self setLastAcceptedText:v82];
      [(TIKeyboardInputManager *)self refreshInputManagerState];
      if ([v82 shouldInsertSpaceAfterSelection])
      {
        BOOL v89 = [(TIKeyboardInputManager *)self wordSeparator];
        uint64_t v90 = [v89 length];

        if (v90)
        {
          uint64_t v91 = [(TIKeyboardInputManager *)self keyboardState];
          uint64_t v92 = [v91 documentState];
          uint64_t v93 = [(TIKeyboardInputManager *)self wordSeparator];
          v94 = [v92 documentStateAfterInsertingTextAfterSelection:v93];

          uint64_t v95 = [(TIKeyboardInputManager *)self keyboardState];
          uint64_t v96 = (void *)[v95 copy];

          [v96 setDocumentState:v94];
          [(TIKeyboardInputManager *)self syncToKeyboardState:v96];
        }
      }
      if (![v81 isContinuousPathConversion]) {
        goto LABEL_70;
      }
      uint64_t v97 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
      int v98 = [v97 asynchronous];

      if (!v98) {
        goto LABEL_70;
      }
      uint64_t v99 = [(TIKeyboardInputManager *)self predictionCandidates:4 predictionType:3];
      uint64_t v100 = [v99 proactiveTriggers];
      if (v100)
      {
        uint64_t v101 = (void *)v100;
        uint64_t v102 = [(TIKeyboardInputManager *)self lastContinuousPathAutocorrection];
        uint64_t v103 = [v102 emojiList];
        if ([v103 count])
        {

          id v9 = v117;
        }
        else
        {
          uint64_t v106 = [(TIKeyboardInputManager *)self proactiveSuggestionsGenerationBlock];

          id v9 = v117;
          if (v106)
          {
            unint64_t v107 = (void *)MEMORY[0x1E4FAE278];
            uint64_t v108 = [(TIKeyboardInputManager *)self lastContinuousPathAutocorrection];
            uint64_t v109 = [v108 corrections];
            BOOL v110 = [v99 proactiveTriggers];
            uint64_t v111 = [v107 listWithCorrections:v109 predictions:0 emojiList:0 proactiveTriggers:v110];

            uint64_t v112 = [(TIKeyboardInputManager *)self proactiveSuggestionsGenerationBlock];
            ((void (**)(void, void *))v112)[2](v112, v111);

            goto LABEL_69;
          }
        }
      }
      uint64_t v104 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
      [v104 close];

      [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
LABEL_69:

LABEL_70:
      uint64_t v105 = [(TIKeyboardInputManager *)self autocorrectionForCurrentStem];
      [v105 removeAllObjects];

      [(TIKeyboardInputManager *)self setDeleteKeyCount:0];
    }
  }
LABEL_71:
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v5 = a3;
  unint64_t v7 = [(TIKeyboardInputManager *)self phraseBoundary];
  if (v7 > [(TIKeyboardInputManager *)self inputCount]
    || ![(TIKeyboardInputManager *)self supportsSetPhraseBoundary])
  {
    return;
  }
  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v5)
  {
    unsigned int v9 = [(TIKeyboardInputManager *)self inputCount];
    if (a4 < 2)
    {
      uint64_t v10 = v9;
      goto LABEL_10;
    }
    uint64_t v11 = [(TIKeyboardInputManager *)self inputCount];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    if (a4 <= 1)
    {
LABEL_10:
      if (v7 != v10)
      {
        unint64_t v12 = v8 + v7;
        do
        {
          [(TIKeyboardInputManager *)self setPhraseBoundary:v12];
          if ([(TIKeyboardInputManager *)self phraseBoundary] != v7) {
            break;
          }
          BOOL v13 = v10 == v12;
          v12 += v8;
        }
        while (!v13);
      }
      return;
    }
  }

  [(TIKeyboardInputManager *)self setPhraseBoundary:v11];
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3
{
}

- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger v7 = -[TISmartSelector selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:](self->_smartSelector, "selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", a3, a4.location, a4.length, a5, a6, a7);
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  BOOL v6 = [a4 keyLayout];
  [(TIKeyboardInputManager *)self setKeyLayout:v6];

  [(TIKeyboardInputManager *)self addTouch:v7 shouldHitTest:0];
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = [a4 keyLayout];
  [(TIKeyboardInputManager *)self setKeyLayout:v7];

  int64_t v8 = [(TIKeyboardInputManager *)self addTouch:v6 shouldHitTest:1];
  return v8;
}

- (void)setKeyLayout:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_keyLayout = &self->_keyLayout;
  if (([(TIKeyboardLayout *)self->_keyLayout isEqual:v5] & 1) == 0)
  {
    [(TIKeyboardInputManager *)self keyLayoutWillChangeTo:v5 from:*p_keyLayout];
    objc_storeStrong((id *)&self->_keyLayout, a3);
    m_impl = (TIInputManager *)self->m_impl;
    if (m_impl)
    {
      TIInputManager::clear_key_areas(m_impl);
      int64_t v8 = *p_keyLayout;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __39__TIKeyboardInputManager_setKeyLayout___block_invoke;
      unsigned __int16 v17[3] = &unk_1E6E2BE60;
      v17[4] = self;
      [(TIKeyboardLayout *)v8 enumerateKeysUsingBlock:v17];
      [(TIKeyboardInputManager *)self keyLayoutDidChangeTo:*p_keyLayout];
      unsigned int v9 = self->m_impl;
      char v10 = [(TIKeyboardLayout *)*p_keyLayout usesTwoHands];
      v9[280] = v10;
      uint64_t v11 = *((void *)v9 + 40);
      if (v11) {
        *(unsigned char *)(v11 + 112) = v10;
      }
      unint64_t v12 = [(TIKeyboardInputManager *)self currentInputModeIdentifier];
      TIInputModeGetSWLayout();
      BOOL v13 = (KB *)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = (TIInputManager *)self->m_impl;
      KB::utf8_string(v13, (uint64_t)v18);
      TIInputManager::set_layout_name(v14, (const KB::String *)v18);
      if (v19 && v18[6] == 1) {
        free(v19);
      }
      TIInputManager::commit_key_layout((TIInputManager *)self->m_impl);
    }
    if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
    {
      unint64_t v15 = [(TIKeyboardInputManager *)self typingSessionMonitor];
      uint64_t v16 = [(TIKeyboardInputManager *)self keyboardState];
      [v15 layoutDidChange:v5 keyboardState:v16];
    }
  }
}

void __39__TIKeyboardInputManager_setKeyLayout___block_invoke(uint64_t a1, const char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v22[2] = *MEMORY[0x1E4F143B8];
  KB::String::String((KB::String *)v18, a2);
  int v11 = v19;
  if (!v19)
  {
    KB::String::compute_length(v18);
    int v11 = v19;
  }
  if (v11 == 1)
  {
    unint64_t v12 = v21;
    if (!v21) {
      unint64_t v12 = v22;
    }
    unint64_t v15 = v12;
    LODWORD(v16) = 0;
    HIDWORD(v16) = v18[0];
    int v17 = 0;
    KB::String::iterator::initialize((uint64_t *)&v15);
    int v13 = (unsigned __int16)v17;
    unsigned int v14 = [*(id *)(a1 + 32) mapKeyboardLayoutKey:(unsigned __int16)v17];
    if (v14 != v13)
    {
      KB::String::String((uint64_t)&v15, v14);
      KB::String::operator=((uint64_t)v18, (KB::String *)&v15);
      if (v16)
      {
        if (BYTE6(v15) == 1) {
          free(v16);
        }
      }
    }
  }
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  TIInputManager::register_key_area(*(void *)(*(void *)(a1 + 32) + 40), (_LXLexicon *)v18, v23);
  if (v21)
  {
    if (v20 == 1) {
      free(v21);
    }
  }
}

- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3
{
  return a3;
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  id v6 = a3;
  [(TIKeyboardInputManager *)self setKeyLayout:a4];
  id v7 = [(TIKeyboardInputManager *)self candidatesForString:v6];

  return v7;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  [(TIKeyboardInputManager *)self setKeyboardState:a4];
  id v7 = [(TIKeyboardInputManager *)self didAcceptCandidate:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4FAE328]);
  unsigned int v9 = [(TIKeyboardInputManager *)self remainingInput];
  [v8 setString:v9];

  [(TIKeyboardInputManager *)self clearInput];
  char v10 = [v8 string];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    unint64_t v12 = [TIKeyboardInputManagerKeyboardContext alloc];
    int v13 = [(TIKeyboardInputManager *)self keyboardState];
    unsigned int v14 = [(TIKeyboardInputManagerKeyboardContext *)v12 initWithKeyboardState:v13];

    [(TIKeyboardInputManager *)self addInput:v8 withContext:v14];
    unint64_t v15 = [(TIKeyboardInputManagerKeyboardContext *)v14 output];
    uint64_t v16 = [v15 insertionText];

    if (v16)
    {
      int v17 = [(TIKeyboardInputManagerKeyboardContext *)v14 output];
      int64x2_t v18 = [v17 insertionText];
      unsigned __int16 v19 = [v7 stringByAppendingString:v18];
      char v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        unint64_t v22 = [(TIKeyboardInputManagerKeyboardContext *)v14 output];
        id v21 = [v22 insertionText];

        id v7 = v22;
      }

      id v7 = v21;
    }
  }
  self->super._hasHandledInput = 1;
  [(TIKeyboardInputManager *)self setLastAcceptedText:0];

  return v7;
}

- (void)changingContextWithTrigger:(id)a3
{
  id v5 = a3;
  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    id v4 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    [v4 changingContextWithTrigger:v5];
  }
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v5 = a3;
  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    id v4 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    [v4 acceptingCandidateWithTrigger:v5];
  }
}

- (void)candidatesOfferedFeedback:(id)a3 keyboardState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  TIStatisticsLogOfferedCandidateList(v8);
  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    id v7 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    [v7 candidatesOffered:v8 keyboardState:v6];
  }
}

- (void)finishGeneratingCandidates
{
  id v5 = [(TIKeyboardInputManager *)self candidateResultSet];
  if (([v5 isDummySet] & 1) == 0)
  {
    id v3 = v5;
    if (v5)
    {
      BOOL v4 = [(TIKeyboardInputManager *)self usesCandidateSelection];
      id v3 = v5;
      if (v4)
      {
        [(TIKeyboardInputManager *)self setMarkedText];
        id v3 = v5;
      }
    }
    [(TIKeyboardInputManager *)self closeCandidateGenerationContextWithResults:v3];
  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  -[TIKeyboardInputManager setCandidateRange:](self, "setCandidateRange:", location, length);
  [(TIKeyboardInputManager *)self openCandidateGenerationContextWithCandidateHandler:v10];

  [(TIKeyboardInputManager *)self setKeyboardState:v9];
  [(TIKeyboardInputManager *)self setPhraseBoundaryIfNecessary];
  if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) != 0)
  {
    uint64_t v11 = [v9 inputForMarkedText];
    uint64_t v12 = [v11 length];

    if (!v12)
    {
      if (([v9 needOneTimeCodeAutofill] & 1) != 0 || objc_msgSend(v9, "autofillMode") == 3)
      {
        int v13 = [(TIKeyboardInputManager *)self generateOneTimeCodeCandidatesWithKeyboardState:v9];
        if ([v13 count])
        {
LABEL_8:
          unsigned int v14 = [MEMORY[0x1E4FAE310] setWithCandidates:v13];
          [(TIKeyboardInputManager *)self closeCandidateGenerationContextWithResults:v14];

          goto LABEL_4;
        }
      }
      if ([v9 needCellularAutofill] && objc_msgSend(v9, "autofillMode") == 8)
      {
        int v13 = [(TIKeyboardInputManager *)self generateCellularCandidatesWithKeyboardState:v9];
        if ([v13 count]) {
          goto LABEL_8;
        }
      }
      if (([v9 needAutofill] & 1) != 0
        || [v9 autofillMode] == 1
        || [v9 autofillMode] == 2
        || [v9 autofillMode] == 7)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __94__TIKeyboardInputManager_generateCandidatesWithKeyboardState_candidateRange_candidateHandler___block_invoke;
        v15[3] = &unk_1E6E2CB20;
        v15[4] = self;
        [(TIKeyboardInputManager *)self generateAutofillFormWithKeyboardState:v9 completionHandler:v15];
        goto LABEL_4;
      }
    }
  }
  [(TIKeyboardInputManager *)self finishGeneratingCandidates];
LABEL_4:
}

void __94__TIKeyboardInputManager_generateCandidatesWithKeyboardState_candidateRange_candidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [MEMORY[0x1E4FAE310] setWithCandidates:v4];
    [*(id *)(a1 + 32) closeCandidateGenerationContextWithResults:v3];
  }
  else
  {
    [*(id *)(a1 + 32) finishGeneratingCandidates];
  }
}

- (void)finishGeneratingResponseKitProactiveSuggestions:(id)a3 candidateRange:(_NSRange)a4 completion:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger v7 = a4.location;
  v132[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v124 = 0;
  uint64_t v125 = &v124;
  uint64_t v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__11289;
  id v128 = __Block_byref_object_dispose__11290;
  id v11 = v9;
  id v129 = v11;
  uint64_t v12 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v118 = 0;
  char v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__11289;
  char v122 = __Block_byref_object_dispose__11290;
  int v13 = [(TIKeyboardInputManager *)self keyboardState];
  unsigned int v14 = [v13 autofillContext];
  id v123 = [v14 objectForKey:*MEMORY[0x1E4FAE9D8]];

  if (!v119[5])
  {
    uint64_t v15 = +[TIXPCUtils obtainApplicationIdentifierFromConnection:v12];
    uint64_t v16 = (void *)v119[5];
    v119[5] = v15;
  }
  uint64_t v112 = 0;
  uint64_t v113 = &v112;
  uint64_t v114 = 0x3032000000;
  char v115 = __Block_byref_object_copy__11289;
  id v116 = __Block_byref_object_dispose__11290;
  int v17 = [(TIKeyboardInputManager *)self keyboardState];
  int64x2_t v18 = [v17 autofillContext];
  id v117 = [v18 objectForKey:*MEMORY[0x1E4FAE9E8]];

  if (!v113[5])
  {
    uint64_t v19 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v12];
    char v20 = (void *)v113[5];
    v113[5] = v19;
  }
  id v21 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  char v22 = [v21 asynchronous];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke;
  aBlock[3] = &unk_1E6E2BD48;
  aBlock[4] = self;
  uint64_t v109 = &v124;
  id v90 = v10;
  id v108 = v90;
  objc_copyWeak(&v110, &location);
  CGRect v23 = _Block_copy(aBlock);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_2;
  v105[3] = &unk_1E6E2BD98;
  v105[4] = self;
  id v89 = v23;
  id v106 = v89;
  int v24 = _Block_copy(v105);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_4;
  v100[3] = &unk_1E6E2BE10;
  v100[4] = self;
  objc_copyWeak(&v104, &location);
  uint64_t v102 = &v118;
  uint64_t v103 = &v112;
  id v25 = v24;
  id v101 = v25;
  uint64_t v26 = _Block_copy(v100);
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_7;
  v95[3] = &unk_1E6E2BE38;
  uint64_t v97 = &v124;
  objc_copyWeak(&v98, &location);
  char v86 = v22;
  char v99 = v22;
  id v27 = v26;
  id v96 = v27;
  [(TIKeyboardInputManager *)self setProactiveSuggestionsGenerationBlock:v95];
  NSUInteger v28 = v7 + length;
  [(TIKeyboardInputManager *)self setLastNumCandidatesRequest:v28];
  int64x2_t v29 = +[TIProactiveQuickTypeManager sharedInstance];
  unint64_t v30 = [(TIKeyboardInputManager *)self keyboardState];
  int v31 = [v30 documentState];
  uint64_t v88 = v29;
  if ([v31 documentIsEmpty])
  {
    id v87 = v25;
    std::string::size_type v32 = [(TIKeyboardInputManager *)self keyboardState];
    std::string::size_type v33 = [v32 responseContext];
    if (v33)
    {
      int v34 = [v29 usePQT2Flow] ^ 1;
    }
    else
    {
      NSUInteger v82 = v28;
      id v84 = v27;
      uint64_t v35 = v12;
      id v36 = v11;
      unint64_t v37 = [(TIKeyboardInputManager *)self keyboardState];
      long long v38 = [v37 inputContextHistory];
      if (v38) {
        int v34 = [v29 usePQT2Flow] ^ 1;
      }
      else {
        int v34 = 0;
      }

      id v11 = v36;
      uint64_t v12 = v35;
      NSUInteger v28 = v82;
      id v27 = v84;
    }

    id v25 = v87;
    if (v34)
    {
      id v85 = v27;
      unint64_t v39 = [(id)v125[5] corrections];
      char v40 = [v39 autocorrection];
      int v41 = [v40 isContinuousPathConversion];

      if (v41)
      {
        uint64_t v42 = v125[5];
        std::string::basic_string[abi:nn180100]<0>(v93, "Predictions");
        id v43 = v90;
        (*((void (**)(id, uint64_t, void *, void))v90 + 2))(v90, v42, v93, 0);
        id v27 = v85;
        uint64_t v44 = v88;
        if (v94 < 0)
        {
          id v45 = (void *)v93[0];
LABEL_21:
          operator delete(v45);
          goto LABEL_24;
        }
      }
      else
      {
        unint64_t v53 = [(TIKeyboardInputManager *)self keyboardState];
        int v54 = [v53 shiftState];

        unsigned int v55 = [(TIKeyboardInputManager *)self keyboardState];
        std::string v56 = [v55 responseContext];

        if (v56)
        {
          uint64_t v57 = [(TIKeyboardInputManager *)self keyboardState];
          std::__fs::filesystem::directory_iterator v58 = [v57 responseContext];
          v132[0] = v58;
          int v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:1];
          BOOL v80 = [(TIKeyboardInputManager *)self suggestionBlocklistMatchesStrings:v59];
        }
        else
        {
          BOOL v80 = 0;
        }
        NSUInteger v83 = v28;
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        id v81 = v11;
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          uint64_t v60 = TIOSLogFacility();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v70 = NSString;
            uint64_t v71 = [(TIKeyboardInputManager *)self keyboardState];
            [v71 inputContextHistory];
            v73 = int v72 = v54;
            BOOL v74 = [v73 mostRecentTextEntryLogString];
            int v75 = [v70 stringWithFormat:@"%s InputContext Last Entry: %@", "-[TIKeyboardInputManager finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:]", v74];
            *(_DWORD *)buf = 138412290;
            v131 = v75;
            _os_log_debug_impl(&dword_1E3F0E000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            int v54 = v72;
          }
        }
        BOOL v77 = v54 != 2;
        std::string v61 = +[TIResponseKitManager sharedTIResponseKitManager];
        uint64_t v79 = [(TIKeyboardInputManager *)self keyboardState];
        std::string v62 = [v79 responseContext];
        uint64_t v78 = [(TIKeyboardInputManagerBase *)self inputMode];
        long long v63 = [v78 normalizedIdentifier];
        char v64 = [(TIKeyboardInputManager *)self keyboardState];
        int64x2_t v65 = [v64 clientIdentifier];
        long long v66 = [(TIKeyboardInputManager *)self keyboardState];
        std::__split_buffer<std::string> v67 = [v66 recipientIdentifier];
        uint64_t v68 = v125[5];
        long long v69 = [(TIKeyboardInputManager *)self proactiveSuggestionsGenerationBlock];
        BYTE2(v76) = v86;
        BYTE1(v76) = v80;
        LOBYTE(v76) = v77;
        objc_msgSend(v61, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v62, v63, v65, v67, v68, v83, v76, v69);

        id v11 = v81;
        id v43 = v90;
        id v25 = v87;
        id v27 = v85;
        uint64_t v44 = v88;
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v46 = [(id)v125[5] corrections];
  int v47 = [v46 autocorrection];
  if (([v47 isContinuousPathConversion] & 1) == 0)
  {

    uint64_t v44 = v88;
    goto LABEL_23;
  }
  [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  v49 = id v48 = v27;
  char v50 = [v49 asynchronous];

  id v27 = v48;
  uint64_t v44 = v88;
  if ((v50 & 1) == 0)
  {
LABEL_23:
    int64x2_t v52 = [(TIKeyboardInputManager *)self proactiveSuggestionsGenerationBlock];
    v52[2](v52, v125[5]);

    [(TIKeyboardInputManager *)self setLastContinuousPathAutocorrection:0];
    id v43 = v90;
    goto LABEL_24;
  }
  [(TIKeyboardInputManager *)self setLastContinuousPathAutocorrection:v125[5]];
  uint64_t v51 = v125[5];
  std::string::basic_string[abi:nn180100]<0>(__p, "Predictions");
  id v43 = v90;
  (*((void (**)(id, uint64_t, void **, void))v90 + 2))(v90, v51, __p, 0);
  if (v92 < 0)
  {
    id v45 = __p[0];
    goto LABEL_21;
  }
LABEL_24:

  objc_destroyWeak(&v98);
  objc_destroyWeak(&v104);

  objc_destroyWeak(&v110);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v112, 8);

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v124, 8);
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isStickerSuggestionsEnabled])
  {
    if ([v3 count])
    {
      id v4 = [v3 objectAtIndex:0];
      uint64_t v5 = [v4 customInfoType];

      if (v5 == 4096)
      {
        id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];
        uint64_t v7 = [v6 count];

        if (v7)
        {
          id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];
          uint64_t v9 = [v8 count];

          id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];
          id v11 = v10;
          if (v9 == 1)
          {
            if ((unint64_t)[v3 count] <= 2) {
              uint64_t v12 = [v3 count];
            }
            else {
              uint64_t v12 = 2;
            }
            std::string v56 = objc_msgSend(v3, "subarrayWithRange:", 0, v12);
            std::__fs::filesystem::directory_iterator v58 = [v11 arrayByAddingObjectsFromArray:v56];
          }
          else
          {
            std::string v56 = objc_msgSend(v10, "subarrayWithRange:", 0, 2);
            uint64_t v57 = [v3 firstObject];
            std::__fs::filesystem::directory_iterator v58 = [v56 arrayByAddingObject:v57];
          }
        }
        else
        {
          if ((unint64_t)[v3 count] <= 3) {
            uint64_t v55 = [v3 count];
          }
          else {
            uint64_t v55 = 3;
          }
          std::__fs::filesystem::directory_iterator v58 = objc_msgSend(v3, "subarrayWithRange:", 0, v55);
        }
        uint64_t v60 = (void *)MEMORY[0x1E4FAE278];
        std::string v61 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) corrections];
        std::string v62 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) predictions];
        uint64_t v63 = [v60 listWithCorrections:v61 predictions:v62 emojiList:v58];
        uint64_t v64 = *(void *)(*(void *)(a1 + 48) + 8);
        int64x2_t v65 = *(void **)(v64 + 40);
        *(void *)(v64 + 40) = v63;

        uint64_t v66 = *(void *)(a1 + 40);
        uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        std::string::basic_string[abi:nn180100]<0>(v80, "Stickers");
        (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v66 + 16))(v66, v67, v80, 1);
        if (v81 < 0) {
          operator delete(v80[0]);
        }

        goto LABEL_55;
      }
    }
  }
  if ([v3 count])
  {
    uint64_t v13 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:v3 emojiList:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  id location = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v17 = [WeakRetained keyboardState];
  if ([v17 autocorrectionListUIDisplayed])
  {
    int64x2_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) predictions];

    if (v18) {
      goto LABEL_14;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4FAE278];
    id WeakRetained = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) corrections];
    int v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];
    uint64_t v20 = [v19 listWithCorrections:WeakRetained predictions:MEMORY[0x1E4F1CBF0] emojiList:v17];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    char v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
LABEL_14:
  CGRect v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v71 = a1;
  if (!v23) {
    goto LABEL_36;
  }
  int v24 = [v23 predictions];
  if (!v24)
  {
    id v25 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];

    if (v25) {
      goto LABEL_18;
    }
LABEL_36:
    uint64_t v45 = a1;
    if (![v3 count])
    {
      unint64_t v53 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v53)
      {
        int v54 = [v53 predictions];
        if (v54)
        {

          uint64_t v45 = a1;
        }
        else
        {
          uint64_t v45 = a1;
          int v59 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) emojiList];
          if (v59)
          {
          }
          else
          {
            uint64_t v68 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) corrections];
            long long v69 = [v68 autocorrection];

            if (!v69) {
              [*(id *)(*(void *)(*(void *)(v71 + 48) + 8) + 40) setProactiveSuggestionsEmpty:1];
            }
          }
        }
      }
    }
    goto LABEL_37;
  }

LABEL_18:
  id v70 = v3;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) predictions];
  uint64_t v26 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v77 != v28) {
          objc_enumerationMutation(obj);
        }
        unint64_t v30 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        int v31 = +[TIAppAutofillManager sharedInstance];
        std::string::size_type v32 = [v31 secureCandidateRenderer];

        if (v32)
        {
          id v33 = [v32 cachedCandidateForSecureCandidate:v30];
        }
        else
        {
          id v33 = v30;
        }
        int v34 = v33;
        id v35 = objc_loadWeakRetained(location);
        int v36 = [v35 shouldInsertSpaceBeforePredictions];

        if (v36)
        {
          unint64_t v37 = NSString;
          long long v38 = [v34 candidate];
          unint64_t v39 = [v37 stringWithFormat:@" %@", v38];

          char v40 = +[TIAppAutofillManager sharedInstance];
          int v41 = [v40 secureCandidateRenderer];
          uint64_t v42 = [v41 updateCachedCandidate:v34 withCandidateString:v39];

          int v34 = (void *)v42;
          a1 = v71;
        }
        id v43 = [v34 proactiveTrigger];

        if (v43) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setContainsProactiveTriggers:1];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v27);
  }

  uint64_t v44 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  [v44 corrections];
  v46 = uint64_t v45 = a1;
  int v47 = [v46 autocorrection];
  id v48 = [v47 proactiveTrigger];
  unsigned int v49 = [v44 containsProactiveTriggers];
  if (v48) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = v49;
  }
  [v44 setContainsProactiveTriggers:v50];

  id v3 = v70;
LABEL_37:
  uint64_t v51 = *(void *)(v45 + 40);
  uint64_t v52 = *(void *)(*(void *)(*(void *)(v45 + 48) + 8) + 40);
  std::string::basic_string[abi:nn180100]<0>(__p, "Predictions");
  (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v51 + 16))(v51, v52, __p, 1);
  if (v75 < 0) {
    operator delete(__p[0]);
  }
LABEL_55:
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__11289;
  v19[4] = __Block_byref_object_dispose__11290;
  id v20 = (id)[a2 copy];
  id v3 = 0;
  id v4 = 0;
  if ([*(id *)(a1 + 32) shouldOfferStickers])
  {
    id v3 = [*(id *)(a1 + 32) stickerCandidateGenerator];

    if (v3)
    {
      uint64_t v5 = [*(id *)(a1 + 32) stickerCandidateGenerator];
      id v6 = [*(id *)(*(void *)(a1 + 32) + 288) documentState];
      uint64_t v7 = [v6 contextBeforeInput];
      id v3 = [v5 generateStickerQueriesForText:v7 tokenize:1];

      id v8 = [*(id *)(a1 + 32) stickerCandidateGenerator];
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 288) documentState];
      id v10 = [v9 contextBeforeInput];
      id v4 = [v8 generateStickerQueriesForText:v10 tokenize:1 generativeEmojiSearchQueries:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  if ([v3 count] || objc_msgSend(v4, "count"))
  {
    id v11 = [*(id *)(a1 + 32) stickerCandidateGenerator];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 288) secureCandidateRenderTraits];
    uint64_t v13 = [*(id *)(a1 + 32) shouldGeneratePredictionsForCurrentContext];
    uint64_t v14 = [*(id *)(a1 + 32) inputMode];
    uint64_t v15 = [v14 languageWithRegion];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_3;
    v16[3] = &unk_1E6E2BD70;
    int64x2_t v18 = v19;
    id v17 = *(id *)(a1 + 40);
    [v11 generateStickerCandidatesForTaxonomySearchableQueries:v3 generativeEmojiSearchableQueries:v4 withRenderTraits:v12 shouldAppend:v13 language:v15 completionHandler:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(v19, 8);
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__11289;
  v36[4] = __Block_byref_object_dispose__11290;
  id v37 = (id)[a2 copy];
  id v3 = [*(id *)(a1 + 32) keyboardState];
  if ([v3 autofillMode] == 4)
  {
    id v4 = [*(id *)(a1 + 32) keyboardState];
    uint64_t v5 = [v4 documentState];
    id v6 = [v5 contextBeforeInput];
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) keyboardState];
      id v8 = [v7 documentState];
      uint64_t v9 = [v8 contextBeforeInput];
      if ([v9 length])
      {
        BOOL v10 = 0;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      unint64_t v30 = v9;
      int v31 = v8;
      std::string::size_type v32 = v7;
    }
    id v11 = [*(id *)(a1 + 32) keyboardState];
    uint64_t v12 = [v11 documentState];
    uint64_t v13 = [v12 contextAfterInput];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      [*(id *)(a1 + 32) keyboardState];
      uint64_t v15 = v29 = v6;
      uint64_t v16 = [v15 documentState];
      [v16 contextAfterInput];
      id v17 = v5;
      v19 = int64x2_t v18 = v4;
      uint64_t v28 = v11;
      BOOL v10 = [v19 length] == 0;

      id v4 = v18;
      uint64_t v5 = v17;

      id v6 = v29;
    }
    else
    {

      BOOL v10 = 1;
    }
    id v8 = v31;
    uint64_t v7 = v32;
    uint64_t v9 = v30;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_14:

  if (_os_feature_enabled_impl() && v10)
  {
    id v20 = +[TIAppAutofillManager sharedInstance];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    char v22 = [WeakRetained keyboardState];
    CGRect v23 = [v22 secureCandidateRenderTraits];
    id v24 = objc_loadWeakRetained((id *)(a1 + 64));
    id v25 = [v24 keyboardState];
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_5;
    v33[3] = &unk_1E6E2BDE8;
    id v35 = v36;
    id v34 = *(id *)(a1 + 40);
    [v20 generateJustHMEAutofillFormSuggestionWithRenderTraits:v23 withKeyboardState:v25 applicationID:v26 applicationBundleID:v27 completionHandler:v33];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(v36, 8);
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [v4 proactiveTriggers];
  uint64_t v7 = [v4 predictions];
  [WeakRetained generateAndRenderProactiveSuggestionsWithTriggers:v6 withAdditionalPredictions:v7 withInput:&stru_1F3F7A998 async:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 32)];

  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  [v8 setProactiveSuggestionsGenerationBlock:0];
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(id *)(a1 + 32);
  TIDispatchAsync();
}

uint64_t __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6 && [v6 count])
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObjectsFromArray:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldOfferStickers
{
  uint64_t v22 = 0;
  uint64_t v3 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
  uint64_t v4 = [(TIKeyboardState *)self->_keyboardState clientIdentifier];
  unint64_t v5 = [v3 emojiUsageCountForApp:v4 lastEmojiCountUpdateTime:&v22];

  if ([(TIKeyboardInputManager *)self isStickerSuggestionsEnabled])
  {
    id v6 = [(TIKeyboardInputManager *)self stickerCandidateGenerator];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = [(TIKeyboardState *)self->_keyboardState clientIdentifier];
  unint64_t v9 = +[TICandidateGatingManager stickerUsageCountForApp:v8];

  if (_os_feature_enabled_impl())
  {
    BOOL v11 = v5 > 2 || v9 != 0;
    int v12 = v7 && v11;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v14 = [v13 languageCode];

    uint64_t v15 = [(TIKeyboardInputManagerBase *)self inputMode];
    uint64_t v16 = [v15 languageWithRegion];

    if (v7
      && (v5 <= 2 ? (BOOL v17 = v9 == 0) : (BOOL v17 = 0), !v17 && [v14 hasPrefix:@"en"]))
    {
      int v12 = [v16 hasPrefix:@"en"];
    }
    else
    {
      int v12 = 0;
    }
  }
  if (self->_skipStickerSuggestionGating) {
    BOOL v18 = v7;
  }
  else {
    BOOL v18 = v12;
  }
  if (!v18) {
    return 0;
  }
  uint64_t v19 = [(TIKeyboardInputManager *)self keyboardState];
  char v20 = [v19 imageSuggestionEnabled];

  return v20;
}

- (id)finishGeneratingInlineCompletions:(id)a3 completion:(id)a4 syncResponse:(BOOL)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  kdebug_trace();
  kac_get_log();
  unint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, (const void *)((unint64_t)self ^ 0x10));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.generateInlineCompletions", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v57 = 0;
  std::__fs::filesystem::directory_iterator v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = __Block_byref_object_copy__11289;
  std::string v61 = __Block_byref_object_dispose__11290;
  id v42 = v7;
  id v62 = v42;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__TIKeyboardInputManager_finishGeneratingInlineCompletions_completion_syncResponse___block_invoke;
  aBlock[3] = &unk_1E6E2BD20;
  aBlock[4] = self;
  std::string v56 = &v57;
  id v12 = v8;
  id v55 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v77);
  int v41 = v13;
  (*(void (**)(uint8_t *__return_ptr))(*(void *)self->m_impl + 32))(buf);
  if (v76[32])
  {
    id v40 = v12;
    KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v69, (const KB::Candidate **)buf);
    KB::String::String((KB::String *)v73, (const KB::String *)v76);
    KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v50, v69);
    KB::String::String((KB::String *)v67, (const KB::String *)v73);
    uint64_t v14 = [(TIKeyboardInputManager *)self inlineCompletions:v50 matchedStem:v67];
    if (v68 && v67[6] == 1) {
      free(v68);
    }
    uint64_t v63 = (const KB::Candidate **)&v53;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = (const KB::Candidate **)&v52;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = (const KB::Candidate **)&v51;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = (const KB::Candidate **)v50;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    if (v14)
    {
      if ([v14 count])
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        unint64_t v39 = v14;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v66 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v47;
          uint64_t v19 = &stru_1F3F7A998;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v47 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if ([(__CFString *)v19 length])
              {
                uint64_t v22 = [(__CFString *)v19 stringByAppendingString:@", "];

                uint64_t v19 = (__CFString *)v22;
              }
              CGRect v23 = v19;
              id v24 = [v21 candidate];
              uint64_t v19 = [(__CFString *)v19 stringByAppendingString:v24];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v66 count:16];
          }
          while (v17);
        }
        else
        {
          uint64_t v19 = &stru_1F3F7A998;
        }

        [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Sending cached inline completion to UI" candidate:v19];
        uint64_t v14 = v39;
        id v12 = v40;
      }
      else
      {
        [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Cached completions were found but suppressed: sending empty list to UI" candidate:0];
      }
    }
    if (v74 && v73[6] == 1) {
      free(v74);
    }
    uint64_t v63 = (const KB::Candidate **)&v72;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = (const KB::Candidate **)&v71;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = (const KB::Candidate **)&v70;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
    uint64_t v63 = v69;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
  }
  else
  {
    uint64_t v14 = [(id)v58[5] inlineCompletions];
  }
  id v25 = [(id)v58[5] corrections];
  uint64_t v26 = [(id)v58[5] predictions];
  id v44 = 0;
  id v45 = 0;
  id v43 = 0;
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v64);
  [(TIKeyboardInputManager *)self reconcileInlineCompletionAndAutocorrections:v25 inlineCompletions:v14 predictions:v26 outReconciledAutocorrections:&v45 outReconciledInlineCompletions:&v44 outReconciledPredictions:&v43 matchedStem:v64];
  id v27 = v45;
  id v28 = v44;
  id v29 = v43;
  if (v65 && v64[6] == 1) {
    free(v65);
  }

  id v30 = v29;
  int v31 = [v27 autocorrection];

  std::string::size_type v32 = v30;
  if (v31)
  {
    id v33 = [v27 autocorrection];
    std::string::size_type v32 = [(TIKeyboardInputManager *)self filterDuplicatePredictions:v30 autocorrection:v33];
  }
  id v34 = (void *)MEMORY[0x1E4FAE278];
  id v35 = [(id)v58[5] emojiList];
  int v36 = [(id)v58[5] proactiveTriggers];
  id v37 = [v34 listWithCorrections:v27 predictions:v32 emojiList:v35 inlineCompletionList:v28 proactiveTriggers:v36];

  std::__optional_destruct_base<std::tuple<KB::CandidateCollection,KB::String>,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)buf);
  if (v78 && v77[6] == 1) {
    free(v78);
  }

  _Block_object_dispose(&v57, 8);

  return v37;
}

void __84__TIKeyboardInputManager_finishGeneratingInlineCompletions_completion_syncResponse___block_invoke(void *a1, const KB::Candidate **a2, const KB::String *a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  kac_get_log();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, (const void *)(a1[4] ^ 0x10));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v8, OS_SIGNPOST_INTERVAL_END, v10, "kbdManager.generateInlineCompletions", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  os_signpost_id_t v11 = (void *)a1[4];
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v24, a2);
  KB::String::String((KB::String *)v29, a3);
  id v12 = [v11 inlineCompletions:v24 matchedStem:v29];
  if (v30 && v29[6] == 1) {
    free(v30);
  }
  *(void *)buf = &v27;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(void *)buf = &v26;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(void *)buf = &v25;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(void *)buf = v24;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  uint64_t v13 = (void *)MEMORY[0x1E4FAE278];
  uint64_t v14 = [*(id *)(*(void *)(a1[6] + 8) + 40) corrections];
  id v15 = [*(id *)(*(void *)(a1[6] + 8) + 40) predictions];
  uint64_t v16 = [*(id *)(*(void *)(a1[6] + 8) + 40) emojiList];
  uint64_t v17 = [v13 listWithCorrections:v14 predictions:v15 emojiList:v16 inlineCompletions:v12];
  uint64_t v18 = *(void *)(a1[6] + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  uint64_t v20 = a1[5];
  uint64_t v21 = *(void *)(*(void *)(a1[6] + 8) + 40);
  std::string::basic_string[abi:nn180100]<0>(__p, "InlineCompletions");
  (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v20 + 16))(v20, v21, __p, a4);
  if (v23 < 0) {
    operator delete(__p[0]);
  }
}

- (void)finishGeneratingAutocorrectionsWithCandidates:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger v33 = a4.location;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  unint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  int v41 = __Block_byref_object_copy__11289;
  id v42 = __Block_byref_object_dispose__11290;
  id v7 = a3;
  id v43 = v7;
  id v8 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  os_signpost_id_t v9 = [v8 requestToken];

  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v52);
  dispatch_group_t v10 = dispatch_group_create();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke;
  aBlock[3] = &unk_1E6E2BCF8;
  objc_copyWeak(&v36, &location);
  id v11 = v9;
  id v35 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3321888768;
  v44[2] = __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke_2;
  v44[3] = &unk_1F3F75A48;
  objc_copyWeak(&v49, &location);
  uint64_t v13 = v10;
  long long v48 = &v38;
  id v45 = v13;
  long long v46 = self;
  KB::String::String((KB::String *)v50, (const KB::String *)v52);
  id v32 = v11;
  id v47 = v32;
  uint64_t v14 = _Block_copy(v44);
  id v15 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  int v16 = [v15 asynchronous];

  uint64_t v17 = [(TIKeyboardInputManager *)self config];
  int v18 = [v17 isTesting];

  if (v16 && v18)
  {
    uint64_t v19 = [(TIKeyboardInputManager *)self keyboardState];
    int v16 = [v19 needAutofill];
  }
  uint64_t v20 = [(id)v39[5] corrections];
  uint64_t v21 = [v20 autocorrection];
  int v22 = [v21 isContinuousPathConversion];

  if (v22)
  {
    char v23 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
    [v23 pushCandidates:v39[5]];
  }
  else
  {
    NSUInteger v31 = length;
    id v24 = v7;
    if ([(TIKeyboardInputManager *)self shouldGenerateInlineCompletions])
    {
      dispatch_group_enter(v13);
      uint64_t v25 = [(TIKeyboardInputManager *)self finishGeneratingInlineCompletions:v39[5] completion:v14 syncResponse:v16 ^ 1u];
      uint64_t v26 = (void *)v39[5];
      v39[5] = v25;
    }
    char v23 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
    uint64_t v27 = (void *)MEMORY[0x1E4FAE278];
    id v28 = [(id)v39[5] corrections];
    id v29 = [(id)v39[5] inlineCompletions];
    id v30 = [v27 listWithCorrections:v28 inlineCompletionList:v29];
    [v23 pushCandidates:v30];

    id v7 = v24;
    NSUInteger length = v31;
  }

  dispatch_group_enter(v13);
  -[TIKeyboardInputManager finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:](self, "finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:", v39[5], v33, length, v14);
  if (v16) {
    dispatch_group_notify(v13, MEMORY[0x1E4F14428], v12);
  }
  else {
    v12[2](v12);
  }

  if (v51 && v50[6] == 1) {
    free(v51);
  }

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  if (v53 && v52[6] == 1) {
    free(v53);
  }

  _Block_object_dispose(&v38, 8);
}

void __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke(uint64_t a1)
{
  unint64_t v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v17 = WeakRetained;
    id v7 = *(void **)(a1 + 32);
    id v8 = v7;
    if (!v7)
    {
      id v1 = objc_loadWeakRetained(v5);
      uint64_t v2 = [v1 candidateHandlerForOpenRequest];
      uint64_t v9 = [v2 requestToken];
      if (!v9)
      {

        goto LABEL_11;
      }
      uint64_t v3 = (void *)v9;
      id v8 = *(void **)(a1 + 32);
    }
    id v10 = objc_loadWeakRetained(v5);
    id v11 = [v10 candidateHandlerForOpenRequest];
    id v12 = [v11 requestToken];
    int v13 = [v8 isSameRequestAs:v12];

    if (v7)
    {
      id WeakRetained = v17;
      if (!v13) {
        goto LABEL_12;
      }
LABEL_11:
      id v14 = objc_loadWeakRetained(v5);
      id v15 = [v14 candidateHandlerForOpenRequest];
      [v15 close];

      id v16 = objc_loadWeakRetained(v5);
      [v16 setCandidateHandlerForOpenRequest:0];

      id WeakRetained = v17;
      goto LABEL_12;
    }

    id WeakRetained = v17;
    if (v13) {
      goto LABEL_11;
    }
  }
LABEL_12:
}

void __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t **a3, int a4)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && a4)
  {
    if ([v7 containsProactiveTriggers]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsProactiveTriggers];
    }
    if ([v7 proactiveSuggestionsEmpty]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) proactiveSuggestionsEmpty];
    }
    id v12 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
    char v13 = (char)v12;
    id v14 = a3[1];
    if ((char)v12 >= 0) {
      id v15 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
    }
    else {
      id v15 = a3[1];
    }
    if (v15 == (uint64_t *)11)
    {
      id v16 = *a3;
      if ((char)v12 >= 0) {
        id v16 = (uint64_t *)a3;
      }
      uint64_t v17 = *v16;
      uint64_t v18 = *(uint64_t *)((char *)v16 + 3);
      if (v17 == 0x6974636964657250 && v18 == 0x736E6F6974636964)
      {
        id v104 = (void *)MEMORY[0x1E4FAE278];
        uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
        uint64_t v21 = [v7 predictions];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) emojiList];
        int v22 = LODWORD(v108) = v11;
        char v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inlineCompletions];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) proactiveTriggers];
        id v24 = LODWORD(v107) = v10;
        uint64_t v25 = [v104 listWithCorrections:v20 predictions:v21 emojiList:v22 inlineCompletionList:v23 proactiveTriggers:v24];
        uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        id v8 = (id *)(a1 + 64);
        uint64_t v10 = v10;

        uint64_t v11 = v108;
        id v12 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
        id v14 = a3[1];
        char v13 = *((unsigned char *)a3 + 23);
      }
    }
    if (v13 < 0) {
      id v12 = v14;
    }
    if (v12 == (uint64_t *)17)
    {
      id v28 = *a3;
      if (v13 >= 0) {
        id v28 = (uint64_t *)a3;
      }
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      int v31 = *((unsigned __int8 *)v28 + 16);
      if (v29 == 0x6F43656E696C6E49 && v30 == 0x6E6F6974656C706DLL && v31 == 115)
      {
        LODWORD(v108) = v11;
        LODWORD(v107) = v10;
        uint64_t v105 = v8;
        id v34 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
        id v35 = [v7 inlineCompletions];
        id v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) predictions];
        id v37 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
        uint64_t v38 = [v37 autocorrection];
        char v39 = [v38 isAutocorrection];

        if (v39)
        {

          id v35 = 0;
        }
        else
        {
          uint64_t v40 = *(void **)(a1 + 40);
          int v41 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
          id v42 = [v7 inlineCompletions];
          LODWORD(v40) = [v40 shouldPromoteInlineCompletionsToAutocorrections:v41 inlineCompletions:v42];

          if (v40)
          {
            id v43 = [v7 inlineCompletions];
            uint64_t v102 = [v43 objectAtIndexedSubscript:0];

            id v44 = *(void **)(a1 + 40);
            uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
            long long v46 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) predictions];
            id v114 = v36;
            id v115 = v34;
            KB::String::String((KB::String *)v117, (const KB::String *)(a1 + 72));
            id v47 = v44;
            long long v48 = (void *)v45;
            [v47 promoteInlineCompletionToAutocorrections:v45 predictions:v46 inlineCompletion:v102 outReconciledAutocorrections:&v115 outReconciledPredictions:&v114 matchedStem:v117];
            id v101 = v115;

            id v49 = v114;
            if (v118 && v117[6] == 1) {
              free(v118);
            }

            id v34 = v101;
            id v36 = v49;
          }
        }
        uint64_t v103 = v35;
        id v50 = v36;
        uint64_t v51 = v34;
        uint64_t v52 = [v34 autocorrection];

        uint64_t v53 = v50;
        if (v52)
        {
          uint64_t v54 = *(void **)(a1 + 40);
          id v55 = [v34 autocorrection];
          uint64_t v53 = [v54 filterDuplicatePredictions:v50 autocorrection:v55];
        }
        std::string v56 = (void *)MEMORY[0x1E4FAE278];
        uint64_t v57 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) emojiList];
        std::__fs::filesystem::directory_iterator v58 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) proactiveTriggers];
        uint64_t v59 = [v56 listWithCorrections:v51 predictions:v53 emojiList:v57 inlineCompletionList:v103 proactiveTriggers:v58];
        uint64_t v60 = *(void *)(*(void *)(a1 + 56) + 8);
        std::string v61 = *(void **)(v60 + 40);
        *(void *)(v60 + 40) = v59;

        id v8 = v105;
        uint64_t v10 = v107;
        uint64_t v11 = v108;
      }
    }
    if ([*(id *)(a1 + 40) isStickerSuggestionsEnabled])
    {
      id v62 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
      int v63 = (char)v62;
      if ((char)v62 < 0) {
        id v62 = a3[1];
      }
      if (v62 == (uint64_t *)8)
      {
        uint64_t v64 = v63 >= 0 ? a3 : (uint64_t **)*a3;
        if (*v64 == (uint64_t *)0x7372656B63697453)
        {
          LODWORD(v108) = v11;
          int64x2_t v65 = (void *)MEMORY[0x1E4FAE278];
          a3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) corrections];
          uint64_t v66 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) predictions];
          uint64_t v67 = [v7 emojiList];
          uint64_t v68 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inlineCompletions];
          long long v69 = v65;
          uint64_t v11 = v108;
          uint64_t v70 = [v69 listWithCorrections:a3 predictions:v66 emojiList:v67 inlineCompletions:v68];
          uint64_t v71 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v72 = *(void **)(v71 + 40);
          *(void *)(v71 + 40) = v70;
        }
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setContainsProactiveTriggers:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setProactiveSuggestionsEmpty:v11];
    uint64_t v73 = *(void **)(a1 + 48);
    BOOL v74 = v73;
    if (!v73)
    {
      id v75 = objc_loadWeakRetained(v8);
      long long v76 = [v75 candidateHandlerForOpenRequest];
      uint64_t v77 = [v76 requestToken];
      if (!v77)
      {

        goto LABEL_62;
      }
      a3 = (uint64_t **)v77;
      unint64_t v107 = v76;
      id v108 = v75;
      BOOL v74 = *(void **)(a1 + 48);
    }
    id v78 = WeakRetained;
    id v79 = v7;
    BOOL v80 = v8;
    id v81 = objc_loadWeakRetained(v8);
    NSUInteger v82 = [v81 candidateHandlerForOpenRequest];
    uint64_t v83 = [v82 requestToken];
    int v84 = [v74 isSameRequestAs:v83];

    if (v73)
    {
      id v7 = v79;
      id WeakRetained = v78;
      id v8 = v80;
      if (!v84) {
        goto LABEL_81;
      }
    }
    else
    {

      id v7 = v79;
      id WeakRetained = v78;
      id v8 = v80;
      if ((v84 & 1) == 0) {
        goto LABEL_81;
      }
    }
LABEL_62:
    id v109 = v7;
    if (HIBYTE(inline_completions_override))
    {
      if (!(_BYTE)inline_completions_override) {
        goto LABEL_80;
      }
    }
    else if (!_os_feature_enabled_impl())
    {
LABEL_80:
      id v99 = objc_loadWeakRetained(v8);
      uint64_t v100 = [v99 candidateHandlerForOpenRequest];
      [v100 pushCandidates:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

      id v7 = v109;
      goto LABEL_81;
    }
    uint64_t v85 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inlineCompletions];
    if (v85)
    {
      char v86 = (void *)v85;
      id v87 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inlineCompletions];
      uint64_t v88 = [v87 count];

      if (v88)
      {
        id v106 = v8;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v89 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inlineCompletions];
        uint64_t v90 = [v89 countByEnumeratingWithState:&v110 objects:v116 count:16];
        if (v90)
        {
          uint64_t v91 = v90;
          uint64_t v92 = *(void *)v111;
          uint64_t v93 = &stru_1F3F7A998;
          do
          {
            for (uint64_t i = 0; i != v91; ++i)
            {
              if (*(void *)v111 != v92) {
                objc_enumerationMutation(v89);
              }
              uint64_t v95 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              if ([(__CFString *)v93 length])
              {
                uint64_t v96 = [(__CFString *)v93 stringByAppendingString:@", "];

                uint64_t v93 = (__CFString *)v96;
              }
              uint64_t v97 = v93;
              id v98 = [v95 candidate];
              uint64_t v93 = [(__CFString *)v93 stringByAppendingString:v98];
            }
            uint64_t v91 = [v89 countByEnumeratingWithState:&v110 objects:v116 count:16];
          }
          while (v91);
        }
        else
        {
          uint64_t v93 = &stru_1F3F7A998;
        }

        [*(id *)(a1 + 40) logInlineCompletionsToTypology:@"Sending inline completion to UI" candidate:v93];
        id v8 = v106;
      }
    }
    goto LABEL_80;
  }
LABEL_81:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (KB *)a3;
  id v7 = (KB *)a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  *(_OWORD *)std::string __p = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v21);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v22);
  memset(v23, 0, 24);
  int v16 = 0;
  KB::utf8_string(v6, (uint64_t)&v25);
  [(TIKeyboardInputManager *)self tokenizeString:&v25 context:&v17 sentences:&v16];
  if (v26 && BYTE6(v25) == 1) {
    free(v26);
  }
  KB::utf8_string(v7, (uint64_t)v31);
  m_impl = self->m_impl;
  if (m_impl[29])
  {
    uint64_t v9 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v10 = [v9 clientIdentifier];

    m_impl = self->m_impl;
    if (v10)
    {
      uint64_t v11 = m_impl[29];
      id v12 = [(TIKeyboardInputManager *)self keyboardState];
      char v13 = [v12 clientIdentifier];
      KB::utf8_string(v13, (uint64_t)&v25);
      (*(void (**)(uint64_t, void ***))(*(void *)v11 + 264))(v11, &v25);
      if (v26 && BYTE6(v25) == 1) {
        free(v26);
      }

      m_impl = self->m_impl;
    }
  }
  uint64_t v25 = 0;
  uint64_t v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__11289;
  uint64_t v29 = __Block_byref_object_dispose__11290;
  uint64_t v30 = &stru_1F3F7A998;
  (*(void (**)(void *__return_ptr))(*m_impl + 32))(v24);
  std::__optional_destruct_base<std::tuple<KB::CandidateCollection,KB::String>,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v24);
  id v14 = v26[5];
  _Block_object_dispose(&v25, 8);

  if (v32 && v31[6] == 1) {
    free(v32);
  }
  uint64_t v25 = (void **)v23;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v25);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v22);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v21);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*((void *)&v17 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v17 + 1));
  }

  return v14;
}

_WORD *__63__TIKeyboardInputManager_generateInlineCompletions_withPrefix___block_invoke(uint64_t a1, const KB::String *a2)
{
  _NSRange result = *(_WORD **)a2;
  if (*((void *)a2 + 1) != *(void *)a2)
  {
    uint64_t v4 = (KB *)(result + 444);
    if (!result[444]) {
      KB::Candidate::compute_string((KB::Candidate *)result);
    }
    uint64_t v5 = KB::ns_string(v4, a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    return (_WORD *)MEMORY[0x1F41817F8](v5, v7);
  }
  return result;
}

- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = +[TIProactiveQuickTypeManager sharedInstance];
  int v7 = [v6 isAutoPopupEnabled];

  id v8 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v8 autocorrectionListUIDisplayed])
  {

LABEL_4:
    uint64_t v11 = [(TIKeyboardInputManager *)self autocorrectionListWithCandidateCount:location + length];
    goto LABEL_5;
  }
  uint64_t v9 = [(TIKeyboardInputManager *)self keyboardState];
  int v10 = [v9 longPredictionListEnabled];

  if (v10) {
    goto LABEL_4;
  }
  if (!v7)
  {
    uint64_t v18 = [(TIKeyboardInputManager *)self supplementalAutocorrectionCandidates];
    if (!v18)
    {
      uint64_t v18 = [(TIKeyboardInputManager *)self autocorrectionCandidates];
    }
    uint64_t v11 = [MEMORY[0x1E4FAE278] listWithCorrections:v18];

LABEL_5:
    if (v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v13 = [(TIKeyboardInputManager *)self autocorrectionListWithCandidateCount:location + length];
  if (v13)
  {
    id v14 = v13;
    id v15 = (void *)MEMORY[0x1E4FAE278];
    int v16 = [v13 corrections];
    long long v17 = [v14 proactiveTriggers];
    uint64_t v11 = [v15 listWithCorrections:v16 predictions:0 emojiList:0 proactiveTriggers:v17];

    goto LABEL_5;
  }
LABEL_6:
  uint64_t v11 = [MEMORY[0x1E4FAE278] listWithCorrections:0];
LABEL_7:
  [(TIKeyboardInputManager *)self setLastAutocorrectionList:v11];

  return v11;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  [(TIKeyboardInputManager *)self setKeyboardState:v9];
  BOOL v11 = [(TIKeyboardInputManager *)self _hasSupplementalPrefix];
  id v12 = &unk_1EAE42000;
  if (KB::SetOnlySearchSupplementalLexiconForScope::s_shouldOnlySearchSupplementalLexicon) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v11;
  }
  if (v13) {
    KB::SetOnlySearchSupplementalLexiconForScope::s_shouldOnlySearchSupplementalLexicon = 1;
  }
  if (v10)
  {
    id v14 = +[TIProactiveQuickTypeManager sharedInstance];
    int v15 = [v14 isAutoPopupEnabled];

    int v16 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];

    if (v16)
    {
      long long v17 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
      [v17 close];

      [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
    }
    [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:v10];
    uint64_t v18 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
    [v18 open];

    if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) == 0) {
      goto LABEL_10;
    }
    if (([v9 needOneTimeCodeAutofill] & 1) != 0 || objc_msgSend(v9, "autofillMode") == 3)
    {
      NSUInteger v51 = location;
      NSUInteger v30 = length;
      kdebug_trace();
      kac_get_log();
      int v31 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, (const void *)((unint64_t)self ^ 0x11));
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "kbdManager.generateAutofill", (const char *)&unk_1E41704BE, buf, 2u);
        }
      }

      id v34 = [(TIKeyboardInputManager *)self generateOneTimeCodeCandidatesWithKeyboardState:v9];
      kdebug_trace();
      kac_get_log();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v35, (const void *)((unint64_t)self ^ 0x11));
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v37 = v36;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v35, OS_SIGNPOST_INTERVAL_END, v37, "kbdManager.generateAutofill", (const char *)&unk_1E41704BE, buf, 2u);
        }
      }

      if ([v34 count])
      {
        long long v19 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:v34 emojiList:0];

        NSUInteger length = v30;
        NSUInteger location = v51;
        if (v19) {
          goto LABEL_30;
        }
      }
      else
      {

        NSUInteger length = v30;
        NSUInteger location = v51;
      }
    }
    if ([v9 needCellularAutofill] && objc_msgSend(v9, "autofillMode") == 8)
    {
      NSUInteger v38 = location;
      char v39 = [(TIKeyboardInputManager *)self generateCellularCandidatesWithKeyboardState:v9];
      if ([v39 count])
      {
        long long v19 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:v39 emojiList:0];

        NSUInteger location = v38;
        if (v19)
        {
LABEL_30:
          if (([v19 empty] & 1) == 0)
          {
            [v10 pushCandidates:v19];
            [v10 close];
            [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
LABEL_16:

            goto LABEL_17;
          }
LABEL_11:
          uint64_t v20 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
          if (!v20) {
            goto LABEL_14;
          }
          uint64_t v21 = (void *)v20;
          [(TIKeyboardInputManager *)self keyboardState];
          v22 = NSUInteger v50 = location;
          [v22 documentState];
          id v49 = self;
          char v23 = v19;
          v25 = NSUInteger v24 = length;
          uint64_t v26 = [v9 documentState];
          char v27 = [v25 isEqual:v26];

          id v12 = (unsigned char *)&unk_1EAE42000;
          NSUInteger length = v24;
          long long v19 = v23;
          self = v49;

          NSUInteger location = v50;
          if (v27)
          {
            uint64_t v28 = [(TIKeyboardInputManager *)v49 pregeneratedTypingAutocorrections];
          }
          else
          {
LABEL_14:
            uint64_t v28 = -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](self, "generateTypingAutocorrectionsWithCandidateRange:", location, length);
          }
          uint64_t v29 = (void *)v28;
          [(TIKeyboardInputManager *)self setPregeneratedTypingAutocorrections:0];
          -[TIKeyboardInputManager finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:](self, "finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:", v29, location, length, v10);

          goto LABEL_16;
        }
      }
      else
      {

        NSUInteger location = v38;
      }
    }
    if (v15)
    {
      if ([v9 needAutofill])
      {
        NSUInteger v40 = location;
        if ([v9 needContactAutofill])
        {
LABEL_42:
          long long v19 = 0;
          NSUInteger location = v40;
          goto LABEL_11;
        }
LABEL_46:
        kdebug_trace();
        kac_get_log();
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v45 = os_signpost_id_make_with_pointer(v44, (const void *)((unint64_t)self ^ 0x11));
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v46 = v45;
          if (os_signpost_enabled(v44))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v46, "kbdManager.generateAutofill", (const char *)&unk_1E41704BE, buf, 2u);
          }
        }

        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __99__TIKeyboardInputManager_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler___block_invoke;
        v52[3] = &unk_1E6E2BCA8;
        v52[4] = self;
        id v47 = v10;
        id v53 = v47;
        NSUInteger v54 = v40;
        NSUInteger v55 = length;
        if ([(TIKeyboardInputManager *)self generateAutofillFormWithKeyboardState:v9 completionHandler:v52])
        {
          long long v48 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:0];
          [v47 pushCandidates:v48];
        }
        if (v13) {
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      int v41 = [v9 autofillContext];
      id v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4FAE9F0]];
      if (([v42 isEqualToString:@"webauthn"] & 1) != 0 || objc_msgSend(v9, "autofillMode"))
      {
        NSUInteger v40 = location;
        char v43 = [v9 needContactAutofill];

        if (v43) {
          goto LABEL_42;
        }
        goto LABEL_46;
      }
    }
LABEL_10:
    long long v19 = 0;
    goto LABEL_11;
  }
LABEL_17:
  if (v13) {
LABEL_18:
  }
    v12[1184] = 0;
LABEL_19:
}

void __99__TIKeyboardInputManager_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(void *)(a1 + 32) ^ 0x11));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutofill", (const char *)&unk_1E41704BE, v8, 2u);
    }
  }

  if ([v3 count])
  {
    int v7 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:v3 emojiList:0];
    [*(id *)(a1 + 40) pushCandidates:v7];
    [*(id *)(a1 + 40) close];
  }
  else
  {
    int v7 = objc_msgSend(*(id *)(a1 + 32), "generateTypingAutocorrectionsWithCandidateRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:", v7, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

- (id)generateCellularCandidatesWithKeyboardState:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  char v6 = [v5 isScreenLocked];

  if ((v6 & 1) == 0 && [v4 needCellularAutofill] && objc_msgSend(v4, "autofillMode") == 8)
  {
    int v7 = +[TIAppAutofillManager sharedInstance];
    id v8 = [v4 secureCandidateRenderTraits];
    id v9 = [v7 generateCellularCandidatesWithRenderTraits:v8 withKeyboardState:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)generateOneTimeCodeCandidatesWithKeyboardState:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  char v6 = [v5 isScreenLocked];

  if ((v6 & 1) == 0
    && (([v4 needOneTimeCodeAutofill] & 1) != 0 || objc_msgSend(v4, "autofillMode") == 3))
  {
    int v7 = +[TIAppAutofillManager sharedInstance];
    id v8 = [v4 secureCandidateRenderTraits];
    id v9 = [v7 generateOneTimeCodeCandidatesWithRenderTraits:v8 withKeyboardState:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)generateAutofillFormWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TIKeyboardInputManager *)self keyboardState];
  int v9 = [v8 isScreenLocked];

  if (v9) {
    goto LABEL_2;
  }
  if (([v6 needAutofill] & 1) != 0
    || [v6 autofillMode] == 1
    || ([v6 autofillContext],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKeyedSubscript:*MEMORY[0x1E4FAE9F0]],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"webauthn"],
        v12,
        v11,
        v13))
  {
    id v14 = +[TIAppAutofillManager sharedInstance];
    int v15 = [v6 secureCandidateRenderTraits];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke;
    v21[3] = &unk_1E6E2BC80;
    id v22 = v7;
    [v14 generateAutofillFormCandidatesWithRenderTraits:v15 withKeyboardState:v6 completion:v21];

    BOOL v10 = 1;
    goto LABEL_8;
  }
  if ([v6 autofillMode] == 2 || objc_msgSend(v6, "autofillMode") == 7)
  {
    long long v17 = +[TIAppAutofillManager sharedInstance];
    uint64_t v18 = [v6 secureCandidateRenderTraits];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_3;
    v19[3] = &unk_1E6E2BC80;
    id v20 = v7;
    [v17 generateAutofillFormSuggestedUsernameWithRenderTraits:v18 withKeyboardState:v6 completionHandler:v19];
  }
  else
  {
LABEL_2:
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

void __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  TIDispatchAsync();
}

uint64_t __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (TITypingSessionMonitor)typingSessionMonitor
{
  return self->_typingSessionMonitor;
}

- (BOOL)shouldMonitorTypingSession
{
  return self->_typingSessionMonitor != 0;
}

- (void)trackProactiveMetrics:(id)a3 keyboardState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v11 = +[TIConnectionsMetricsTracker sharedInstance];
  id v7 = [v5 documentState];
  uint64_t v8 = [v7 documentIsEmpty];
  int v9 = [v5 textInputTraits];

  BOOL v10 = [v9 textContentType];
  [v11 trackTextFieldEntryWithEmpty:v8 fieldType:v10 trigger:v6];
}

- (void)deleteFromInputWithContext:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self currentWordStem];
  id v6 = [(TIKeyboardInputManager *)self autocorrectionForCurrentStem];
  id v7 = [v6 objectForKey:v5];

  if ([v7 length]) {
    [(TIKeyboardInputManager *)self setRejectedAutocorrection:v7 forInput:v5];
  }
  uint64_t v8 = [(TIKeyboardInputManager *)self autocorrectionHistory];
  int v9 = [v8 objectForKey:v5];

  BOOL v10 = [v9 candidate];

  if ([v10 length])
  {
    id v11 = [v9 input];
    [(TIKeyboardInputManager *)self setRejectedAutocorrection:v10 forInput:v11];
  }
  if (![(TIKeyboardInputManager *)self inputCount]
    && [(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    [(TIKeyboardInputManager *)self inputLocationChanged];
  }
  uint64_t v71 = 0;
  if (![(TIKeyboardInputManager *)self inputIndex])
  {
    int v13 = [(TIKeyboardInputManager *)self keyboardState];
    id v14 = [v13 documentState];
    uint64_t v15 = [v14 markedText];
    if (v15)
    {
      int v16 = (void *)v15;
      BOOL v17 = [(TIKeyboardInputManager *)self supportsSetPhraseBoundary];

      if (v17) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    uint64_t v36 = [(TIKeyboardInputManager *)self lastAcceptedText];
    if (v36)
    {
      os_signpost_id_t v37 = (void *)v36;
      NSUInteger v38 = [(TIKeyboardInputManager *)self lastAcceptedText];
      if ([v38 isContinuousPathConversion])
      {
        char v39 = [(TIKeyboardInputManager *)self config];
        int v40 = [v39 continuousPathDeleteWholeWord];

        if (v40)
        {
          int v41 = [(TIKeyboardInputManager *)self lastAcceptedText];
          id v42 = [v41 candidate];

          char v43 = [(TIKeyboardInputManager *)self lastAcceptedText];
          uint64_t v44 = [v43 input];
          if (v44)
          {
            os_signpost_id_t v45 = (void *)v44;
            uint64_t v67 = v10;
            long long v69 = v5;
            os_signpost_id_t v46 = v9;
            id v47 = [(TIKeyboardInputManager *)self lastAcceptedText];
            long long v48 = [v47 input];
            id v49 = [(TIKeyboardInputManager *)self pathedWordSeparator];
            NSUInteger v50 = [v48 stringByAppendingString:v49];
            int v66 = [v42 hasPrefix:v50];

            if (!v66)
            {
              id v53 = v4;
              int v9 = v46;
              BOOL v10 = v67;
              id v5 = v69;
              goto LABEL_47;
            }
            char v43 = [(TIKeyboardInputManager *)self lastAcceptedText];
            NSUInteger v51 = [v43 input];
            uint64_t v52 = objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v51, "length") + 1);

            id v42 = (void *)v52;
            int v9 = v46;
            BOOL v10 = v67;
            id v5 = v69;
          }
          id v53 = v4;

LABEL_47:
          m_impl = self->m_impl;
          if (m_impl)
          {
            KB::utf8_string((KB *)v42, (uint64_t)v72);
            uint64_t v60 = m_impl[23];
            if (v60) {
              (*(void (**)(uint64_t, unsigned char *))(*(void *)v60 + 112))(v60, v72);
            }
            if (v73 && v72[6] == 1) {
              free(v73);
            }
          }
          id v4 = v53;
          [v53 deleteTextBackward:v42];
          std::string v61 = [(TIKeyboardInputManager *)self lastAcceptedText];
          [(TIKeyboardInputManager *)self continuousPathCandidateRejected:v61];

          [(TIKeyboardInputManager *)self setLastAcceptedText:0];
          uint64_t v54 = 1;
LABEL_54:
          if ([(TIKeyboardInputManager *)self usesCandidateSelection])
          {
            id v62 = [(TIKeyboardInputManager *)self keyboardState];
            [(TIKeyboardInputManager *)self syncMarkedTextForKeyboardState:v62 afterContextChange:0];
          }
          else
          {
            if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
            {
              int v63 = [(TIKeyboardInputManager *)self typingSessionMonitor];
              [v63 changingContextWithTrigger:*MEMORY[0x1E4FAE5B8]];
            }
            uint64_t v64 = [(TIKeyboardInputManager *)self keyboardState];
            int64x2_t v65 = [v64 documentState];
            [(TIKeyboardInputManager *)self setInputStringFromDocumentState:v65 isDeleteEvent:1 didDeleteLastAcceptedPath:v54];
          }
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    [v4 deleteBackward:1];
    uint64_t v54 = [(TIKeyboardInputManager *)self lastAcceptedText];
    if (v54)
    {
      NSUInteger v55 = [(TIKeyboardInputManager *)self lastAcceptedText];
      int v56 = [v55 isContinuousPathConversion];

      if (v56)
      {
        uint64_t v57 = [(TIKeyboardInputManager *)self lastAcceptedText];
        [(TIKeyboardInputManager *)self continuousPathCandidateRejected:v57];

        [(TIKeyboardInputManager *)self setLastAcceptedText:0];
      }
      uint64_t v54 = 0;
    }
    goto LABEL_54;
  }
  if (![(TIKeyboardInputManager *)self usesCandidateSelection])
  {
LABEL_16:
    uint64_t v68 = v5;
    id v20 = v10;
    uint64_t v21 = v9;
    id v22 = v4;
    BOOL v23 = [(TIKeyboardInputManager *)self hasLegacyInputStem];
    NSUInteger v24 = [(TIKeyboardInputManager *)self inputString];
    uint64_t v25 = [(TIKeyboardInputManager *)self inputIndex];
    uint64_t v26 = [(TIKeyboardInputManager *)self inputContext];
    if (v23) {
      [(TIKeyboardInputManager *)self displayedCandidateRejected];
    }
    char v27 = [(TIKeyboardInputManager *)self deleteFromInput:&v71];
    uint64_t v28 = [(TIKeyboardInputManager *)self deletedSuffixOfInputContext:v26 whenDeletingFromInputString:v24 withInputIndex:v25 deletionCount:v71];
    uint64_t v29 = v28;
    if (v27) {
      NSUInteger v30 = v27;
    }
    else {
      NSUInteger v30 = &stru_1F3F7A998;
    }
    int v31 = [v28 stringByAppendingString:v30];

    uint64_t v32 = [v31 length];
    id v4 = v22;
    if (v71) {
      objc_msgSend(v22, "deleteBackward:");
    }
    if (v32) {
      [v22 insertText:v31];
    }
    if (!v23
      && [(TIKeyboardInputManager *)self shouldExtendPriorWord]
      && [(TIKeyboardInputManager *)self hasLegacyInputStem])
    {
      os_signpost_id_t v33 = [(TIKeyboardInputManager *)self keyboardState];
      id v34 = [v33 documentState];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __53__TIKeyboardInputManager_deleteFromInputWithContext___block_invoke;
      v70[3] = &unk_1E6E2BBC0;
      v70[4] = self;
      id v35 = [v34 inputStringWithTerminatorPredicate:v70];

      id v4 = v22;
      [(TIKeyboardInputManager *)self setOriginalInput:v35];
    }
    int v9 = v21;
    BOOL v10 = v20;
    id v5 = v68;
    goto LABEL_30;
  }
  id v12 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v12 shouldSkipCandidateSelection])
  {

    goto LABEL_16;
  }
  uint64_t v18 = [(TIKeyboardInputManager *)self keyboardState];
  char v19 = [v18 suppressingCandidateSelection];

  if (v19) {
    goto LABEL_16;
  }
  id v58 = [(TIKeyboardInputManager *)self deleteFromInput:&v71];
  if (![(TIKeyboardInputManager *)self shouldDelayUpdateComposedText])
  {
    [(TIKeyboardInputManager *)self updateComposedText];
    [(TIKeyboardInputManager *)self setMarkedText];
  }
LABEL_30:
}

uint64_t __53__TIKeyboardInputManager_deleteFromInputWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stringEndsWord:a2];
}

- (void)continuousPathCandidateRejected:(id)a3
{
  id v4 = [a3 candidate];
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  id v10 = [v6 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  id v7 = [(TIKeyboardInputManager *)self rejectedConversionsForCurrentContinuousPath];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    [(TIKeyboardInputManager *)self setRejectedConversionsForCurrentContinuousPath:v8];
  }
  int v9 = [(TIKeyboardInputManager *)self rejectedConversionsForCurrentContinuousPath];
  [v9 addObject:v10];
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 string];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    uint64_t v68 = v7;
    id v10 = [(TIKeyboardInputManager *)self keyboardState];
    unsigned int v11 = [v6 isUppercase];
    if ([v6 isAutoshifted]) {
      unsigned int v12 = v11 | 2;
    }
    else {
      unsigned int v12 = v11;
    }
    if ([v6 isPopupVariant]) {
      v12 |= 4u;
    }
    if ([v6 isMultitap]) {
      v12 |= 8u;
    }
    int v13 = [v6 isGesture];
    if ([v6 isPopupVariant] | v13) {
      v12 |= 4u;
    }
    if ([v6 isSynthesizedByAcceptingCandidate]) {
      uint64_t v14 = v12 | 0x80;
    }
    else {
      uint64_t v14 = v12;
    }
    uint64_t v15 = [v6 string];
    BOOL v16 = [(TIKeyboardInputManager *)self shouldInsertSpaceBeforeInput:v15];

    if (!v16)
    {
LABEL_31:
      uint64_t v69 = 0;
      uint64_t v32 = [(TIKeyboardInputManager *)self inputString];
      uint64_t v33 = [(TIKeyboardInputManager *)self inputIndex];
      uint64_t v34 = [(TIKeyboardInputManager *)self inputContext];
      id v35 = [v6 string];
      uint64_t v36 = [v6 touchEvent];
      [v36 location];
      -[TIKeyboardInputManager addInput:flags:point:firstDelete:](self, "addInput:flags:point:firstDelete:", v35, v14, &v69);
      os_signpost_id_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

      int v66 = (void *)v34;
      uint64_t v67 = (void *)v32;
      NSUInteger v38 = [(TIKeyboardInputManager *)self deletedSuffixOfInputContext:v34 whenDeletingFromInputString:v32 withInputIndex:v33 deletionCount:v69];
      char v39 = v38;
      if (v37) {
        int v40 = v37;
      }
      else {
        int v40 = &stru_1F3F7A998;
      }
      int v41 = [v38 stringByAppendingString:v40];

      if ([(TIKeyboardInputManager *)self usesCandidateSelection]) {
        BOOL v42 = [(TIKeyboardInputManager *)self inputCount] == 0;
      }
      else {
        BOOL v42 = 1;
      }
      id v7 = v68;
      if (([v10 shouldSkipCandidateSelection] & 1) == 0
        && ([v10 suppressingCandidateSelection] & 1) == 0
        && ((v42 | [(TIKeyboardInputManager *)self shouldCommitInputString]) & 1) == 0)
      {
        [(TIKeyboardInputManager *)self setMarkedText];
LABEL_55:
        if ([v6 isSynthesizedByAcceptingCandidate]) {
          [(TIKeyboardInputManager *)self dropInput];
        }
        NSUInteger v55 = [(TIKeyboardInputManager *)self lastAcceptedText];

        if (v55)
        {
          if ([v6 isSynthesizedByAcceptingCandidate])
          {
            int v56 = [(TIKeyboardInputManager *)self lastAcceptedText];
            uint64_t v57 = [(TIKeyboardInputManager *)self lastAcceptedText];
            id v58 = [v57 candidate];
            uint64_t v59 = [v6 string];
            uint64_t v60 = [v58 stringByAppendingString:v59];
            std::string v61 = [v56 candidateByReplacingWithCandidate:v60];
            [(TIKeyboardInputManager *)self setLastAcceptedText:v61];

            id v7 = v68;
          }
          else
          {
            [(TIKeyboardInputManager *)self setLastAcceptedText:0];
            [(TIKeyboardInputManager *)self setRejectedConversionsForCurrentContinuousPath:0];
          }
        }
        TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((void *)self->m_impl + 2) - *((void *)self->m_impl + 1)) >> 3), (uint64_t)&v70);
        int v63 = KB::ns_string((KB *)&v70, v62);
        if (v71 && BYTE6(v70) == 1) {
          free(v71);
        }
        uint64_t v64 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
        int v65 = [v64 shouldClearInput:v63];

        if (v65) {
          [(TIKeyboardInputManager *)self clearInput];
        }

        goto LABEL_67;
      }
      char v43 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v44 = [v43 documentState];
      os_signpost_id_t v45 = [v44 selectedText];

      uint64_t v46 = [v41 length];
      if (!v69)
      {
LABEL_47:
        if (v46) {
          [v68 insertText:v41];
        }
        if ([v10 shortcutConversionEnabled])
        {
          NSUInteger v50 = [v10 documentState];
          NSUInteger v51 = [(TIKeyboardInputManager *)self shortcutConversionForDocumentState:v50];
          uint64_t v52 = [v68 output];
          [v52 setShortcutConversion:v51];
        }
        if (v45 && [(TIKeyboardInputManager *)self shouldExtendPriorWord])
        {
          id v53 = [(TIKeyboardInputManager *)self keyboardState];
          uint64_t v54 = [v53 documentState];
          [(TIKeyboardInputManager *)self setInputStringFromDocumentState:v54 isDeleteEvent:0];
        }
        else
        {
          [(TIKeyboardInputManager *)self trimInput];
        }
        goto LABEL_55;
      }
      if (v45)
      {
        uint64_t v47 = v69 + 1;
      }
      else
      {
        long long v48 = [v10 documentState];
        id v49 = [v48 markedText];

        uint64_t v47 = v69;
        if (!v49)
        {
LABEL_46:
          [v68 deleteBackward:v47];
          goto LABEL_47;
        }
        uint64_t v47 = v69 + 1;
      }
      uint64_t v69 = v47;
      goto LABEL_46;
    }
    uint64_t v70 = 0;
    BOOL v17 = [(TIKeyboardInputManager *)self inputString];
    uint64_t v18 = [(TIKeyboardInputManager *)self inputIndex];
    char v19 = [(TIKeyboardInputManager *)self inputContext];
    id v20 = [(TIKeyboardInputManager *)self lastAcceptedText];
    if ([v20 isContinuousPathConversion])
    {
      uint64_t v21 = [(TIKeyboardInputManager *)self lastAcceptedText];
      char v22 = [v21 shouldAccept];

      if (v22)
      {
        uint64_t v23 = [(TIKeyboardInputManager *)self pathedWordSeparator];
LABEL_23:
        uint64_t v26 = (void *)v23;
        -[TIKeyboardInputManager addInput:flags:point:firstDelete:](self, "addInput:flags:point:firstDelete:", v23, 128, &v70, 0.0, 0.0);
        char v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v28 = [(TIKeyboardInputManager *)self deletedSuffixOfInputContext:v19 whenDeletingFromInputString:v17 withInputIndex:v18 deletionCount:v70];
        uint64_t v29 = v28;
        if (v27) {
          NSUInteger v30 = v27;
        }
        else {
          NSUInteger v30 = &stru_1F3F7A998;
        }
        int v31 = [v28 stringByAppendingString:v30];

        if (v70) {
          objc_msgSend(v68, "deleteBackward:");
        }
        if ([v31 length]) {
          [v68 insertText:v31];
        }
        [(TIKeyboardInputManager *)self dropInput];

        goto LABEL_31;
      }
    }
    else
    {
    }
    uint64_t v23 = [(TIKeyboardInputManager *)self wordSeparator];
    goto LABEL_23;
  }
  if ([v6 isSynthesizedByAcceptingCandidate])
  {
    NSUInteger v24 = [(TIKeyboardInputManager *)self wordSeparator];
    uint64_t v25 = [v24 length];

    if (!v25) {
      [(TIKeyboardInputManager *)self dropInput];
    }
  }
LABEL_67:
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  id v5 = [TIKeyboardInputManagerKeyboardContext alloc];
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  id v7 = [(TIKeyboardInputManagerKeyboardContext *)v5 initWithKeyboardState:v6];

  uint64_t v8 = [(TIKeyboardInputManager *)self revisionHistory];
  [(TIKeyboardInputManagerKeyboardContext *)v7 setRevisionHistory:v8];

  uint64_t v9 = [v4 output];

  if (v9)
  {
    if (![(TIKeyboardInputManager *)self doesComposeText])
    {
      uint64_t v32 = 0;
      goto LABEL_32;
    }
    id v10 = [(TIKeyboardInputManager *)self inputStem];
    unsigned int v11 = [MEMORY[0x1E4F28E78] string];
    int v12 = [v10 length];
    int v13 = [v4 output];
    uint64_t v14 = [v13 deletionCount];

    if (v14)
    {
      unsigned int v15 = v12 - 1;
      if (((v12 - 1) & 0x80000000) == 0)
      {
        unint64_t v16 = 1;
        do
        {
          uint64_t v17 = [v10 _rangeOfBackwardDeletionClusterAtIndex:v15];
          int v19 = v18;
          id v20 = objc_msgSend(v10, "substringWithRange:", v17, v18);
          [v11 insertString:v20 atIndex:0];

          uint64_t v21 = [v4 output];
          unint64_t v22 = [v21 deletionCount];

          if (v22 <= v16) {
            break;
          }
          v15 -= v19;
          ++v16;
        }
        while ((v15 & 0x80000000) == 0);
      }
    }
    signed int v23 = *((_DWORD *)self->m_impl + 24)
        - -[TIKeyboardInputManager externalIndexToInternal:](self, "externalIndexToInternal:", [v10 length] - objc_msgSend(v11, "length"));
    if (v23 >= 1)
    {
      do
      {
        [(TIKeyboardInputManager *)self deleteFromInputWithContext:v7];
        --v23;
      }
      while (v23);
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4FAE328]);
    uint64_t v25 = [v4 output];
    uint64_t v26 = [v25 insertionText];
    [v24 setString:v26];

    [(TIKeyboardInputManager *)self addInput:v24 withContext:v7];
    char v27 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v28 = [v27 documentState];
    uint64_t v29 = [v28 markedText];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      int v31 = [v24 string];
      [(TIKeyboardInputManagerKeyboardContext *)v7 unmarkText:v31];

      [(TIKeyboardInputManager *)self clearInput];
    }
    uint64_t v32 = 0;
    goto LABEL_30;
  }
  id v10 = [v4 string];
  [(TIKeyboardInputManager *)self setLastInputString:v10];
  if (![v4 isDoubleSpace])
  {
    if ([v4 isBackspace])
    {
      [(TIKeyboardInputManager *)self incrementUsageTrackingKeysForDeleteFromInput];
      [(TIKeyboardInputManager *)self deleteFromInputWithContext:v7];
      id v35 = [(TIKeyboardInputManagerKeyboardContext *)v7 output];
      [v35 setProducedByDeleteInput:1];
    }
    else
    {
      BOOL v36 = [(TIKeyboardInputManager *)self usesCandidateSelection];
      if (!v10 || !v36 || ![(TIKeyboardInputManager *)self stringEndsWord:v10])
      {
        os_signpost_id_t v37 = [(TIKeyboardInputManager *)self keyboardState];
        NSUInteger v38 = [v37 textInputTraits];
        if (([v38 secureTextEntry] & 1) == 0)
        {
          char v39 = [(TIKeyboardInputManager *)self keyboardState];
          int v40 = [v39 layoutState];
          int v41 = [v40 layoutTag];
          int v42 = [v41 isEqualToString:@"Fullwidth"];

          if (!v42) {
            goto LABEL_27;
          }
          os_signpost_id_t v37 = [v4 string];
          NSUInteger v38 = [v37 _stringByConvertingFromHalfWidthToFullWidth];
          [v4 setString:v38];
        }

        goto LABEL_27;
      }
      [(TIKeyboardInputManagerKeyboardContext *)v7 insertText:v10];
      [(TIKeyboardInputManager *)self clearInput];
      id v35 = [(TIKeyboardInputManager *)self keyboardState];
      [(TIKeyboardInputManager *)self syncMarkedTextForKeyboardState:v35 afterContextChange:0];
    }

    goto LABEL_28;
  }
  uint64_t v33 = [(TIKeyboardInputManager *)self replacementForDoubleSpace];
  [v4 setString:v33];

  uint64_t v34 = [(TIKeyboardInputManagerKeyboardContext *)v7 output];
  [v34 setUnmarkIfNecessary:1];

  [(TIKeyboardInputManager *)self deleteFromInputWithContext:v7];
LABEL_27:
  [(TIKeyboardInputManager *)self addInput:v4 withContext:v7];
LABEL_28:
  self->super._hasHandledInput = 1;
  [(TIKeyboardInputManager *)self _recalcSupplementalPrefix];
  uint64_t v32 = [(TIKeyboardInputManagerKeyboardContext *)v7 output];
  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    unsigned int v11 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    id v24 = [(TIKeyboardInputManager *)self keyboardState];
    [v11 addKeyInput:v4 keyboardState:v24];
LABEL_30:
  }
LABEL_32:

  return v32;
}

- (id)keyboardConfiguration
{
  [(TIKeyboardInputManager *)self refreshInputManagerState];
  id v3 = objc_alloc_init(MEMORY[0x1E4FAE320]);
  id v4 = [(TIKeyboardInputManager *)self currentState];
  [v3 setInputManagerState:v4];

  id v5 = [(TIKeyboardInputManager *)self keyboardState];
  id v6 = [v5 inputForMarkedText];

  if (v6)
  {
    id v7 = [(TIKeyboardInputManager *)self markedText];
    [v3 setIntermediateText:v7];
  }
  uint64_t v8 = [(TIKeyboardInputManager *)self keyboardConfigurationLayoutTag];
  [v3 setLayoutTag:v8];

  uint64_t v9 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  id v10 = [(TIKeyboardInputManager *)self keyboardState];
  unsigned int v11 = [v9 accentKeyStringForKeyboardState:v10];
  [v3 setAccentKeyString:v11];

  int v12 = [(TIKeyboardInputManager *)self contextualDisplayKeys];
  [v3 setContextualDisplayKeys:v12];

  objc_msgSend(v3, "setAssertDefaultKeyPlane:", -[TIKeyboardInputManager keyboardConfigurationAssertDefaultKeyPlane](self, "keyboardConfigurationAssertDefaultKeyPlane"));
  int v13 = [(TIKeyboardInputManager *)self trialParameters];
  [v3 setTrialParameters:v13];

  return v3;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    id v5 = @"com.apple.keyboard.candidateBar.extendedWithGesture";
  }
  else
  {
    id v5 = @"com.apple.keyboard.resized";
  }
  uint64_t v8 = [[TPSDiscoverabilitySignal alloc] initWithIdentifier:v5];
  id v6 = [(TIKeyboardInputManagerBase *)self inputMode];
  id v7 = [v6 normalizedIdentifier];
  [(TPSDiscoverabilitySignal *)v8 setContext:v7];

  [(TPSDiscoverabilitySignal *)v8 donateSignalWithCompletion:&__block_literal_global_213];
}

void __59__TIKeyboardInputManager_logDiscoverabilityEvent_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (v2)
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v3 = TIOSLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id v4 = [NSString stringWithFormat:@"%s Failed to donate signal: %@", "-[TIKeyboardInputManager logDiscoverabilityEvent:userInfo:]_block_invoke", v2];
        *(_DWORD *)buf = 138412290;
        id v6 = v4;
LABEL_12:
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Event stored", "-[TIKeyboardInputManager logDiscoverabilityEvent:userInfo:]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v6 = v4;
      goto LABEL_12;
    }
LABEL_9:
  }
}

- (void)syncToKeyboardState:(id)a3
{
  id v16 = a3;
  id v4 = [(TIKeyboardInputManager *)self keyboardState];
  id v5 = [v4 documentState];
  if (!v5)
  {
    int v12 = [v16 documentState];
    if (v12)
    {

      goto LABEL_11;
    }
  }
  BOOL v6 = [(TIKeyboardInputManager *)self usesCandidateSelection];
  uint64_t v7 = [v16 documentState];
  uint64_t v8 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v9 = [v8 documentState];
  if (v6) {
    int v10 = [v7 isEqual:v9];
  }
  else {
    int v10 = [v7 isEqualIgnoringMarkedText:v9];
  }
  int v11 = v10 ^ 1;

  if (v5)
  {

    if (v11)
    {
LABEL_11:
      int v13 = +[TIProactiveQuickTypeManager sharedInstance];
      [v13 reset];

      uint64_t v14 = 1;
      goto LABEL_13;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_11;
    }
  }
  uint64_t v14 = 0;
LABEL_13:
  [(TIKeyboardInputManager *)self willChangeToKeyboardState:v16 afterContextChange:v14];
  unsigned int v15 = [(TIKeyboardInputManager *)self keyboardState];
  [(TIKeyboardInputManager *)self setKeyboardState:v16];
  [(TIKeyboardInputManager *)self syncToKeyboardState:v16 from:v15 afterContextChange:v14];
}

- (void)setKeyboardState:(id)a3
{
  id v3 = a3;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (simular_swear_word_policy_v2_setting)
  {
    if (([(id)simular_swear_word_policy_v2_setting BOOLValue] & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (!_os_feature_enabled_impl())
  {
    goto LABEL_38;
  }
  m_impl = (const void **)self->m_impl;
  if (m_impl)
  {
    id v60 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v59 = [v5 clientIdentifier];
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2080;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)[v59 UTF8String];
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Passing client ID to the vulgar word usage database wrapper; client ID: %s",
        (uint8_t *)&v79,
        0x16u);

      m_impl = (const void **)self->m_impl;
    }
    std::string v61 = self;
    uint64_t v7 = [v5 clientIdentifier];
    KB::retain_ptr<__CFDictionary const*>::operator=(m_impl + 75, v7);

    int64x2_t v75 = 0uLL;
    long long v76 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v8 = [v5 inputContextHistory];
    uint64_t v9 = [v8 recipientIdentifiers];
    int v10 = [v9 allObjects];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v72 != v13) {
            objc_enumerationMutation(v10);
          }
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)[*(id *)(*((void *)&v71 + 1) + 8 * i) UTF8String]);
          unsigned int v15 = (_OWORD *)v75.i64[1];
          if (v75.i64[1] >= (unint64_t)v76)
          {
            unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3);
            unint64_t v18 = v17 + 1;
            if (v17 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_71:
            }
              abort();
            if (0x5555555555555556 * (((uint64_t)v76 - v75.i64[0]) >> 3) > v18) {
              unint64_t v18 = 0x5555555555555556 * (((uint64_t)v76 - v75.i64[0]) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v76 - v75.i64[0]) >> 3) >= 0x555555555555555) {
              unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v19 = v18;
            }
            v79.__end_cap_.__value_ = (std::allocator<std::string> *)&v76;
            if (v19) {
              unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v19);
            }
            else {
              uint64_t v20 = 0;
            }
            unint64_t v21 = v19 + 24 * v17;
            long long v22 = *(_OWORD *)__p;
            *(void *)(v21 + 16) = value;
            *(_OWORD *)unint64_t v21 = v22;
            __p[1] = 0;
            value = 0;
            __p[0] = 0;
            uint64_t v23 = v75.i64[1];
            uint64_t v24 = v75.i64[0];
            if (v75.i64[1] == v75.i64[0])
            {
              int64x2_t v27 = vdupq_n_s64(v75.u64[1]);
              unint64_t v25 = v19 + 24 * v17;
            }
            else
            {
              unint64_t v25 = v19 + 24 * v17;
              do
              {
                long long v26 = *(_OWORD *)(v23 - 24);
                *(void *)(v25 - 8) = *(void *)(v23 - 8);
                *(_OWORD *)(v25 - 24) = v26;
                v25 -= 24;
                *(void *)(v23 - 16) = 0;
                *(void *)(v23 - 8) = 0;
                *(void *)(v23 - 24) = 0;
                v23 -= 24;
              }
              while (v23 != v24);
              int64x2_t v27 = v75;
            }
            unint64_t v28 = v21 + 24;
            v75.i64[0] = v25;
            v75.i64[1] = v21 + 24;
            *(int64x2_t *)&v79.__begin_ = v27;
            uint64_t v29 = v76;
            long long v76 = (std::string *)(v19 + 24 * v20);
            v79.__end_cap_.__value_ = v29;
            v79.__first_ = (std::__split_buffer<std::string>::pointer)v27.i64[0];
            std::__split_buffer<std::string>::~__split_buffer(&v79);
            v75.i64[1] = v28;
            if (SHIBYTE(value) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v16 = *(_OWORD *)__p;
            *(void *)(v75.i64[1] + 16) = value;
            *unsigned int v15 = v16;
            v75.i64[1] = (uint64_t)v15 + 24;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v12);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2048;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)(0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3));
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Passing recipient IDs to the vulgar word usage database wrapper; number of IDs: %lu",
        (uint8_t *)&v79,
        0x16u);
    }
    self = v61;
    uint64_t v30 = (char *)v61->m_impl;
    memset(&v68, 0, sizeof(v68));
    std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v68, (long long *)v75.i64[0], (long long *)v75.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3));
    if (v30 + 608 != (char *)&v68) {
      std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>((std::vector<std::string> *)(v30 + 608), (std::string *)v68.__r_.__value_.__l.__data_, (std::string *)v68.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68.__r_.__value_.__l.__size_ - v68.__r_.__value_.__r.__words[0]) >> 3));
    }
    v79.__first_ = &v68;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)&v75;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    id v3 = v60;
  }
LABEL_38:
  int v31 = self->m_impl;
  if (v31 && v31[29])
  {
    id v62 = self;
    __p[0] = 0;
    __p[1] = 0;
    value = 0;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v32 = [v5 inputContextHistory];
    uint64_t v33 = [v32 recipientNames];
    uint64_t v34 = [v33 allObjects];

    uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v65 != v37) {
            objc_enumerationMutation(v34);
          }
          KB::utf8_string(*(KB **)(*((void *)&v64 + 1) + 8 * j), (uint64_t)&v75);
          char v39 = __p[1];
          if (__p[1] >= value)
          {
            int64_t v41 = ((char *)__p[1] - (char *)__p[0]) >> 5;
            if ((unint64_t)(v41 + 1) >> 59) {
              goto LABEL_71;
            }
            unint64_t v42 = ((char *)value - (char *)__p[0]) >> 4;
            if (v42 <= v41 + 1) {
              unint64_t v42 = v41 + 1;
            }
            if ((unint64_t)((char *)value - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v43 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v43 = v42;
            }
            v79.__end_cap_.__value_ = (std::allocator<std::string> *)&value;
            uint64_t v44 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<language_modeling::v1::Token>>(v43);
            uint64_t v45 = (uint64_t)v44 + 32 * v41;
            v79.__first_ = v44;
            v79.__begin_ = (std::__split_buffer<std::string>::pointer)v45;
            v79.__end_cap_.__value_ = (std::string *)((char *)v44 + 32 * v46);
            *(_DWORD *)uint64_t v45 = 0x100000;
            *(_WORD *)(v45 + 4) = 0;
            *(unsigned char *)(v45 + 6) = 0;
            *(void *)(v45 + 8) = 0;
            KB::String::operator=(v45, (KB::String *)&v75);
            std::__split_buffer<std::string>::pointer end = (std::__split_buffer<std::string>::pointer)(v45 + 32);
            v79.__end_ = (std::__split_buffer<std::string>::pointer)(v45 + 32);
            long long v48 = (KB::String *)__p[0];
            uint64_t v47 = (KB::String *)__p[1];
            begin = (char *)v79.__begin_;
            if (__p[1] == __p[0])
            {
              int64x2_t v51 = vdupq_n_s64((unint64_t)__p[1]);
            }
            else
            {
              NSUInteger v50 = &v79.__begin_[-2].__r_.__value_.__s.__data_[16];
              do
              {
                *(_DWORD *)NSUInteger v50 = 0x100000;
                uint64_t v47 = (KB::String *)((char *)v47 - 32);
                *((_WORD *)v50 + 2) = 0;
                v50[6] = 0;
                *((void *)v50 + 1) = 0;
                begin = (char *)KB::String::operator=((uint64_t)v50, v47);
                NSUInteger v50 = begin - 32;
              }
              while (v47 != v48);
              int64x2_t v51 = *(int64x2_t *)__p;
              std::__split_buffer<std::string>::pointer end = v79.__end_;
            }
            __p[0] = begin;
            __p[1] = end;
            *(int64x2_t *)&v79.__begin_ = v51;
            uint64_t v52 = value;
            value = v79.__end_cap_.__value_;
            v79.__end_cap_.__value_ = v52;
            v79.__first_ = (std::__split_buffer<std::string>::pointer)v51.i64[0];
            std::__split_buffer<KB::String>::~__split_buffer((uint64_t)&v79);
          }
          else
          {
            *(_DWORD *)__p[1] = 0x100000;
            void v39[2] = 0;
            *((unsigned char *)v39 + 6) = 0;
            *((void *)v39 + 1) = 0;
            std::__split_buffer<std::string>::pointer end = (std::__split_buffer<std::string>::pointer)(KB::String::operator=((uint64_t)v39, (KB::String *)&v75)
                                                            + 32);
          }
          __p[1] = end;
          if (v75.i64[1] && v75.u8[6] == 1) {
            free((void *)v75.i64[1]);
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v36);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2048;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)(((char *)__p[1] - (char *)__p[0]) >> 5);
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Passing recipient names to the inline completions generator; number of names: %lu",
        (uint8_t *)&v79,
        0x16u);
    }
    self = v62;
    uint64_t v53 = *((void *)v62->m_impl + 29);
    memset(v63, 0, sizeof(v63));
    std::vector<KB::String>::__init_with_size[abi:nn180100]<KB::String*,KB::String*>((KB::String *)v63, (const KB::String *)__p[0], (const KB::String *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 5);
    (*(void (**)(uint64_t, void *))(*(void *)v53 + 240))(v53, v63);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)v63;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)__p;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
  }
  objc_storeStrong((id *)&self->_keyboardState, v3);
  uint64_t v54 = [v5 clientIdentifier];
  if (v54)
  {
    NSUInteger v55 = (void *)v54;
    BOOL v56 = [(TIKeyboardInputManager *)self shouldMonitorTypingSession];

    if (v56)
    {
      uint64_t v57 = [(TIKeyboardInputManager *)self typingSessionMonitor];
      id v58 = [v5 clientIdentifier];
      [v57 setClientID:v58 keyboardState:v5];
    }
  }
  [(TIKeyboardInputManager *)self _recalcSupplementalPrefix];
}

- (void)_recalcSupplementalPrefix
{
  id v3 = +[TITransientLexiconManager sharedInstance];
  id v4 = [v3 supplementalLexicons];
  id v5 = [(TIKeyboardInputManager *)self keyboardState];
  BOOL v6 = objc_msgSend(v4, "lexiconWithIdentifier:", objc_msgSend(v5, "supplementalLexiconIdentifier"));

  if (v6)
  {
    uint64_t v7 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v8 = [v7 documentState];
    uint64_t v9 = [v8 markedText];
    uint64_t v10 = [v9 length];

    uint64_t v11 = 0;
    if (self->m_impl && !v10)
    {
      uint64_t v12 = [(TIKeyboardInputManager *)self inputContext];
      uint64_t v13 = [(TIKeyboardInputManager *)self inputStem];
      uint64_t v11 = [v12 stringByAppendingString:v13];
    }
    if (![v11 length])
    {
      uint64_t v14 = [(TIKeyboardInputManager *)self keyboardState];
      unsigned int v15 = [v14 documentState];
      uint64_t v16 = [v15 string];

      uint64_t v11 = (void *)v16;
    }
    unint64_t v17 = objc_msgSend(v6, "core_searchPrefixSet");
    int v18 = objc_msgSend(v11, "_ti_supplementalPrefixOfLastToken:", v17);
  }
  else
  {
    int v18 = 0;
  }

  self->_supplementalPrefix = v18;
  m_impl = self->m_impl;
  if (m_impl) {
    m_impl[134] = v18;
  }
}

- (void)prepareForKeyboardActivity
{
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr && (*(unsigned int (**)(LanguageModel *, SEL))(*(void *)ptr + 16))(ptr, a2))
  {
    id v4 = *(void (**)(void))(*(void *)self->m_lightweight_language_model.__ptr_ + 208);
    v4();
  }
}

- (void)prepareForKeyboardInactivity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr && (*(unsigned int (**)(LanguageModel *, SEL))(*(void *)ptr + 16))(ptr, a2)) {
    (*(void (**)(LanguageModel *))(*(void *)self->m_lightweight_language_model.__ptr_ + 216))(self->m_lightweight_language_model.__ptr_);
  }

  [(TIKeyboardInputManager *)self resetLMCache:v3];
}

- (BOOL)isHighMemoryManager
{
  return TIInputManager::advanced_models_loaded((TIInputManager *)self->m_impl);
}

- (void)resume
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = TIInputManagerOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSString;
    id v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    BOOL v6 = [v5 normalizedIdentifier];
    uint64_t v7 = [v4 stringWithFormat:@"%s Resume (inputMode=%@)", "-[TIKeyboardInputManager resume]", v6];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v8 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v8 addAssertionForObject:self];

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager;
  [(TIKeyboardInputManagerBase *)&v9 resume];
  [(TIKeyboardInputManager *)self scheduleLinguisticResourceUpdateWithReason:@"Input manager resumed"];
}

- (void)releaseMRLBuffers
{
}

- (void)endTypingSessionWithInteractionObservers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke;
  v6[3] = &unk_1E6E2BC38;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  [(TIKeyboardInputManager *)self fetchTypingSessionParams:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  TIDispatchAsync();

  objc_destroyWeak(&v6);
}

void __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v2);
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    id v5 = [v7 typingSessionMonitor];
    [v5 endSessionWithInteractionObservers:*(void *)(a1 + 32) sessionParams:*(void *)(a1 + 40) timestamp:v4];

    id v6 = [v7 counterChangeCache];
    [v6 keyboardDidSuspendForDate:v4];
  }
}

- (void)resetLMCache:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v6 = m_impl[29];
    if (v6) {
      (*(void (**)(uint64_t, void))(*(void *)v6 + 136))(v6, *(void *)&a3);
    }
  }
  p_m_lightweight_language_model = &self->m_lightweight_language_model;
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr)
  {
    if ((*(unsigned int (**)(LanguageModel *, SEL))(*(void *)ptr + 16))(ptr, a2))
    {
      (*(void (**)(LanguageModel *, uint64_t))(*(void *)p_m_lightweight_language_model->__ptr_ + 136))(p_m_lightweight_language_model->__ptr_, v3);
      objc_super v9 = self->m_impl;
      if (v9)
      {
        uint64_t v10 = v9[29];
        if (v10)
        {
          if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 16))(v10))
          {
            cntrl = self->m_lightweight_language_model.__cntrl_;
            p_m_lightweight_language_model->__ptr_ = 0;
            self->m_lightweight_language_model.__cntrl_ = 0;
            if (cntrl)
            {
              std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
            }
          }
        }
      }
    }
  }
}

- (void)suspend
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = TIInputManagerOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSString;
    id v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    uint64_t v6 = [v5 normalizedIdentifier];
    id v7 = [v4 stringWithFormat:@"%s Suspend (inputMode=%@)", "-[TIKeyboardInputManager suspend]", v6];
    *(_DWORD *)buf = 138412290;
    unint64_t v43 = v7;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  [(TIKeyboardInputManager *)self logTestingParametersToTypology];
  id v8 = [(TIKeyboardInputManager *)self config];
  if (([v8 disableAnalytics] & 1) == 0)
  {
    objc_super v9 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v10 = [v9 layoutState];
    uint64_t v11 = [v10 inputMode];

    if (!v11) {
      goto LABEL_7;
    }
    unsigned int v12 = (*(uint64_t (**)(void))(**((void **)self->m_impl + 23) + 456))(*((void *)self->m_impl + 23));
    id v8 = [(TIKeyboardInputManager *)self config];
    int v13 = [v8 usesContinuousPath];
    uint64_t v14 = [(TIKeyboardInputManager *)self keyboardState];
    unsigned int v15 = [v14 layoutState];
    uint64_t v16 = [v15 inputMode];
    TIStatisticsReportCPStats(v12, v13, v16);
  }
LABEL_7:
  [(TIKeyboardInputManager *)self willChangeToKeyboardState:0 afterContextChange:1];
  unint64_t v17 = [(TIKeyboardInputManager *)self recentAutocorrections];
  [v17 removeAllObjects];

  int v18 = [(TIKeyboardInputManager *)self recentPredictiveInputSelections];
  [v18 removeAllObjects];

  unint64_t v19 = [(TIKeyboardInputManager *)self revisionHistory];
  [v19 acceptCurrentSentence];

  uint64_t v20 = [(TIKeyboardInputManager *)self revisionHistory];
  [v20 syncToDocumentState:0];

  unint64_t v21 = [(TIKeyboardInputManager *)self languageSelectionController];
  [v21 flushBuffer];

  [(TIKeyboardInputManager *)self clearInput];
  [(TIKeyboardInputManager *)self setDeleteKeyCount:0];
  long long v22 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInserted];
  [v22 removeAllObjects];

  uint64_t v23 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInsertedInverse];
  [v23 removeAllObjects];

  uint64_t v24 = [(TIKeyboardInputManager *)self autocorrectionForCurrentStem];
  [v24 removeAllObjects];

  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  unint64_t v25 = [(TIKeyboardInputManager *)self keyboardState];
  int v26 = [v25 secureTextEntry];

  if (v26)
  {
    currentState = self->_currentState;
    self->_currentState = 0;
  }
  [(TIKeyboardInputManager *)self setKeyboardState:0];
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v29 = m_impl[28];
    if (v29)
    {
      uint64_t v30 = *(void *)(v29 + 24);
      int v31 = *(std::__shared_weak_count **)(v30 + 32);
      *(void *)(v30 + 24) = 0;
      *(void *)(v30 + 32) = 0;
      if (v31) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v31);
      }
    }
  }
  [(TIKeyboardInputManager *)self resetLMCache:0];
  uint64_t v32 = [(TIKeyboardInputManager *)self stickerCandidateGenerator];
  [v32 clearCache];

  uint64_t v33 = self->m_impl;
  if (v33)
  {
    uint64_t v34 = v33[23];
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 120))(v34);
    }
  }
  [(TIKeyboardInputManager *)self releaseMRLBuffers];
  [(TIKeyboardInputManager *)self setProactiveSuggestionsGenerationBlock:0];
  v41.receiver = self;
  v41.super_class = (Class)TIKeyboardInputManager;
  [(TIKeyboardInputManagerBase *)&v41 suspend];
  uint64_t v35 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v35 removeAssertionForObject:self];

  uint64_t v36 = +[TIProactiveQuickTypeManager sharedInstance];
  [v36 reset];

  uint64_t v37 = +[TIAppAutofillManager sharedInstance];
  [v37 reset];

  if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
  {
    NSUInteger v38 = [(TIKeyboardInputManager *)self typingSessionMonitor];
    char v39 = [v38 resetInteractionObserversForNextSession];

    [(TIKeyboardInputManager *)self endTypingSessionWithInteractionObservers:v39];
  }
  keyLayout = self->_keyLayout;
  self->_keyLayout = 0;

  [(TIKeyboardInputManager *)self setRejectedConversionsForCurrentContinuousPath:0];
}

- (id)currentInputModeIdentifier
{
  id v2 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v3 = [v2 inputMode];

  return v3;
}

- (void)acceptCurrentCandidateIfSelectedWithContext:(id)a3
{
  id v10 = a3;
  id v4 = [(TIKeyboardInputManager *)self keyboardState];
  int v5 = [v4 userSelectedCurrentCandidate];

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardInputManager *)self keyboardState];
    id v7 = [v6 currentCandidate];

    [v10 acceptCandidate:v7];
    id v8 = [(TIKeyboardInputManager *)self keyboardState];
    objc_super v9 = [(TIKeyboardInputManager *)self handleAcceptedCandidate:v7 keyboardState:v8];

    if (v9) {
      [v10 unmarkText:v9];
    }
  }
}

- (void)acceptCurrentCandidateWithContext:(id)a3
{
  id v11 = a3;
  id v4 = [(TIKeyboardInputManager *)self keyboardState];
  int v5 = [v4 currentCandidate];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(TIKeyboardInputManager *)self defaultCandidate];
  }
  id v8 = v7;

  [v11 acceptCandidate:v8];
  objc_super v9 = [(TIKeyboardInputManager *)self keyboardState];
  id v10 = [(TIKeyboardInputManager *)self handleAcceptedCandidate:v8 keyboardState:v9];

  if (v10) {
    [v11 unmarkText:v10];
  }
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    unint64_t v25 = 0;
    goto LABEL_16;
  }
  unint64_t v8 = [v6 count];
  if ((unint64_t)[v6 count] >= 2)
  {
    objc_super v9 = [v6 objectAtIndex:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (![(TIKeyboardLayoutState *)self->_layoutState hasCandidateKey]) {
        goto LABEL_6;
      }
      id v11 = [(TIKeyboardInputManager *)self keyboardState];
      char v12 = [v11 splitKeyboardMode];

      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
LABEL_8:
      id v28 = v6;
      unint64_t v29 = [(TIKeyboardInputManager *)self candidateRange];
      unint64_t v30 = v8 - v29;
      if (v8 <= v29)
      {
        unint64_t v31 = 0;
      }
      else
      {
        unint64_t v31 = v29;
        [(TIKeyboardInputManager *)self candidateRange];
        if (v32 < v30)
        {
          [(TIKeyboardInputManager *)self candidateRange];
          unint64_t v30 = v33;
        }
        uint64_t v34 = objc_msgSend(v28, "subarrayWithRange:", v31, v30);

        id v28 = (id)v34;
      }
      uint64_t v35 = (void *)MEMORY[0x1E4FAE310];
      unint64_t v36 = [(TIKeyboardInputManager *)self initialSelectedIndex];
      uint64_t v37 = [(TIKeyboardInputManager *)self defaultCandidate];
      NSUInteger v38 = [(TIKeyboardInputManager *)self sortMethodTitles];
      unint64_t v25 = [v35 setWithCandidates:v28 initialSelectedIndex:v36 defaultCandidate:v37 sortMethods:v38 sortMethodGroups:0 indexTitles:0 showExtensionCandidates:0 disambiguationCandidates:0 selectedDisambiguationCandidateIndex:0x7FFFFFFFFFFFFFFFLL proactiveTriggers:v7];

      [v25 setBatchCandidateLocation:v31];
      goto LABEL_15;
    }
  }
  int v26 = [(TIKeyboardInputManager *)self keyboardState];
  int v27 = [v26 needsCandidateMetadata];

  if (!v27) {
    goto LABEL_8;
  }
LABEL_6:
  int v13 = [(TIKeyboardInputManager *)self sortMethodTitles];
  uint64_t v14 = [(TIKeyboardInputManager *)self sortMethodsGroupsForCandidates:v6];
  uint64_t v15 = [(TIKeyboardInputManager *)self sortMethodIndexes];
  uint64_t v16 = (void *)MEMORY[0x1E4F28F60];
  int v40 = (void *)v15;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __77__TIKeyboardInputManager_candidateResultSetFromCandidates_proactiveTriggers___block_invoke;
  v41[3] = &unk_1E6E2BBE8;
  id v42 = v14;
  id v17 = v14;
  int v18 = [v16 predicateWithBlock:v41];
  unint64_t v19 = [v13 filteredArrayUsingPredicate:v18];

  uint64_t v20 = (void *)MEMORY[0x1E4FAE310];
  unint64_t v21 = [(TIKeyboardInputManager *)self initialSelectedIndex];
  [(TIKeyboardInputManager *)self defaultCandidate];
  uint64_t v23 = v22 = v8;
  uint64_t v24 = [(TIKeyboardInputManager *)self sortMethodsShowExtensionCandidates];
  unint64_t v25 = [v20 setWithCandidates:v6 initialSelectedIndex:v21 defaultCandidate:v23 sortMethods:v19 sortMethodGroups:v17 indexTitles:v40 showExtensionCandidates:v24 disambiguationCandidates:0 selectedDisambiguationCandidateIndex:0x7FFFFFFFFFFFFFFFLL proactiveTriggers:v7];

  unint64_t v8 = v22;
LABEL_15:
  [v25 setGeneratedCandidateCount:v8];
LABEL_16:

  return v25;
}

BOOL __77__TIKeyboardInputManager_candidateResultSetFromCandidates_proactiveTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_hasSupplementalPrefix
{
  return self->_supplementalPrefix != 0;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return [(TIKeyboardInputManager *)self candidateResultSetFromCandidates:a3 proactiveTriggers:0];
}

- (id)sortMethodsShowExtensionCandidates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIKeyboardInputManager *)self sortingMethods];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v11 = -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", v10, (void)v15);
          BOOL v12 = [(TIKeyboardInputManager *)self alwaysShowExtensionCandidatesForSortingMethod:v10];
          int v13 = [NSNumber numberWithBool:v12];
          [v4 setObject:v13 forKey:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)sortMethodIndexes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIKeyboardInputManager *)self sortingMethods];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
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
          id v11 = -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", v10, (void)v14);
          BOOL v12 = [(TIKeyboardInputManager *)self indexTitlesForGroupTitles:0 sortingMethod:v10];
          if (v12) {
            [v4 setObject:v12 forKey:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)sortMethodsGroupsForCandidates:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self sortingMethods];
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v17 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          int v13 = (void *)MEMORY[0x1E4E7C3D0]();
          long long v14 = [(TIKeyboardInputManager *)self titleForSortingMethod:v12];
          long long v15 = [(TIKeyboardInputManager *)self groupedCandidatesFromCandidates:v4 usingSortingMethod:v12];
          [v6 setObject:v15 forKey:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v5 = v17;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)sortMethodTitles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIKeyboardInputManager *)self sortingMethods];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)shouldSkipCandidateSelection
{
  id v2 = [(TIKeyboardInputManager *)self keyboardState];
  char v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (id)markedText
{
  char v3 = [(TIKeyboardInputManager *)self rawInputString];
  id v4 = [(TIKeyboardInputManager *)self inputString];
  uint64_t v5 = [(TIKeyboardInputManager *)self inputIndex];
  uint64_t v6 = [(TIKeyboardInputManager *)self searchStringForMarkedText];
  uint64_t v7 = [(TIKeyboardInputManager *)self lastInputString];
  uint64_t v8 = [MEMORY[0x1E4FAE350] intermediateTextWithInputString:v3 displayString:v4 selectionLocation:v5 searchString:v6 lastInputString:v7];

  return v8;
}

- (void)setMarkedText
{
  char v3 = [(TIKeyboardInputManager *)self rawInputString];
  id v4 = [(TIKeyboardInputManager *)self keyboardState];
  [v4 setInputForMarkedText:v3];

  uint64_t v5 = [(TIKeyboardInputManager *)self searchStringForMarkedText];
  uint64_t v6 = [(TIKeyboardInputManager *)self keyboardState];
  [v6 setSearchStringForMarkedText:v5];

  id v12 = [(TIKeyboardInputManager *)self inputString];
  uint64_t v7 = [(TIKeyboardInputManager *)self inputIndex];
  uint64_t v8 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v9 = [v8 documentState];
  uint64_t v10 = objc_msgSend(v9, "documentStateAfterSettingMarkedText:selectedRange:", v12, v7, 0);
  id v11 = [(TIKeyboardInputManager *)self keyboardState];
  [v11 setDocumentState:v10];
}

- (BOOL)shouldOmitEmojiCandidates
{
  char v3 = [(TIKeyboardInputManager *)self keyboardState];
  BOOL v4 = ([v3 omitEmojiCandidates] & 1) != 0
    || [(TIKeyboardInputManager *)self userInterfaceIdiom] == 2
    || [(TIKeyboardInputManager *)self userInterfaceIdiom] == 3;

  return v4;
}

- (BOOL)isStickerSuggestionsEnabled
{
  char v3 = [(TIKeyboardInputManager *)self config];
  if ([v3 isTesting])
  {
    BOOL v4 = [(TIKeyboardInputManager *)self config];
    char v5 = [v4 stickerSuggestionsEnabled];
  }
  else
  {
    char v5 = 1;
  }

  return _os_feature_enabled_impl() & v5;
}

- (BOOL)shouldDelayUpdateComposedText
{
  return 0;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  return 1;
}

- (BOOL)isProgressivelyPathing
{
  return 0;
}

- (BOOL)usesFavonius
{
  return 1;
}

- (id)contextBeforeWithDesiredLength:(unint64_t)a3
{
  BOOL v4 = [(TIKeyboardInputManager *)self keyboardState];
  char v5 = [v4 documentState];
  uint64_t v6 = [v5 contextBeforeInput];

  unint64_t v7 = [v6 length];
  unint64_t v8 = v7 - a3;
  if (v7 > a3)
  {
    if (v8 < v7) {
      unint64_t v8 = objc_msgSend(v6, "rangeOfComposedCharacterSequenceAtIndex:");
    }
    uint64_t v9 = [v6 substringFromIndex:v8];

    uint64_t v6 = (void *)v9;
  }

  return v6;
}

- (id)inputStringFromDocumentState:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__TIKeyboardInputManager_inputStringFromDocumentState___block_invoke;
  v5[3] = &unk_1E6E2BBC0;
  v5[4] = self;
  char v3 = [a3 inputStringWithTerminatorPredicate:v5];

  return v3;
}

uint64_t __55__TIKeyboardInputManager_inputStringFromDocumentState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 _firstLongCharacter];
  if (v4 && ![*(id *)(a1 + 32) acceptsCharacter:v4]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [*(id *)(a1 + 32) stringEndsWord:v3];
  }

  return v5;
}

- (id)inputsToReject
{
  return 0;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 shouldAddModifierSymbolsToWordCharacters];

  return v3;
}

- (id)keyboardBehaviors
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 keyboardBehaviors];

  return v3;
}

- (BOOL)shouldCommitInputString
{
  return 0;
}

- (BOOL)keyboardConfigurationAssertDefaultKeyPlane
{
  return 0;
}

- (id)keyboardConfigurationAccentKeyString
{
  return 0;
}

- (id)contextualDisplayKeys
{
  return 0;
}

- (id)keyboardConfigurationLayoutTag
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v3 = [(TIKeyboardLayoutState *)self->_layoutState softwareLayout];
  uint64_t v4 = [(TIKeyboardInputManager *)self layoutTagsForLayout:v3];

  if ([v4 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v23 = v4;
      uint64_t v7 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "allKeys", v23);
          id v11 = [v10 firstObject];

          id v12 = [v9 objectForKeyedSubscript:v11];
          long long v13 = [(TIKeyboardInputManager *)self keyboardState];
          long long v14 = [v13 documentState];
          long long v15 = [v14 contextBeforeInput];

          unint64_t v16 = [v15 length];
          uint64_t v17 = [v15 length];
          if ([v15 length])
          {
            if (v16 <= 0xA) {
              uint64_t v18 = v17;
            }
            else {
              uint64_t v18 = 10;
            }
            if (v16 <= 0xA) {
              uint64_t v19 = 0;
            }
            else {
              uint64_t v19 = v17 - 10;
            }
            uint64_t v20 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:range:", v12, 4, v19, v18);
          }
          else
          {
            uint64_t v21 = 0;
            uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 + v21 == [v15 length])
          {

            goto LABEL_23;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      id v11 = @"Default";
LABEL_23:
      uint64_t v4 = v23;
    }
    else
    {
      id v11 = @"Default";
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)layoutTagsForLayout:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_cachedLayoutTags objectForKeyedSubscript:v4];
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      uint64_t v7 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
      unint64_t v8 = [v7 layoutTags];
      uint64_t v9 = [v8 objectForKeyedSubscript:v4];

      if (![v9 count]) {
        goto LABEL_14;
      }
      long long v25 = self;
      id v26 = v4;
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obuint64_t j = v9;
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            unint64_t v16 = [v15 objectForKeyedSubscript:@"Tag"];
            uint64_t v17 = (void *)MEMORY[0x1E4F28B88];
            uint64_t v18 = [v15 objectForKeyedSubscript:@"FollowingCharactersInSet"];
            uint64_t v19 = [v17 characterSetWithCharactersInString:v18];

            uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:v16];
            [v10 addObject:v20];
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v12);
      }

      self = v25;
      id v4 = v26;
      if (!v10) {
LABEL_14:
      }
        uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
      cachedLayoutTags = self->_cachedLayoutTags;
      if (!cachedLayoutTags)
      {
        unint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v23 = self->_cachedLayoutTags;
        self->_cachedLayoutTags = v22;

        cachedLayoutTags = self->_cachedLayoutTags;
      }
      [(NSMutableDictionary *)cachedLayoutTags setObject:v10 forKeyedSubscript:v4];
      id v6 = v10;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)checkAndUpdateAdditionalLexicons
{
  uint64_t v2 = *((void *)self->m_impl + 29);
  if (v2) {
    (*(void (**)(void))(*(void *)v2 + 576))();
  }
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(TIKeyboardInputManager *)self updateAdaptationContextToKeyboardState:v8 from:v9];
  if (v5 || v10)
  {
    [(TIKeyboardInputManager *)self scheduleLinguisticResourceUpdateWithReason:@"Context changed"];
    if ([(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled]) {
      [(TIKeyboardInputManager *)self updateDictionaryAndLanguageModel];
    }
    [(TIKeyboardInputManager *)self setRejectedConversionsForCurrentContinuousPath:0];
  }
  [(TIKeyboardInputManager *)self checkAndUpdateAdditionalLexicons];
  uint64_t v11 = [v8 layoutState];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [v8 layoutState];
    char v14 = [v13 isEqual:self->_layoutState];

    if ((v14 & 1) == 0)
    {
      long long v15 = [v8 layoutState];
      unint64_t v16 = (TIKeyboardLayoutState *)[v15 copy];
      layoutState = self->_layoutState;
      self->_layoutState = v16;

      [(TIKeyboardInputManager *)self syncToLayoutState:self->_layoutState];
    }
  }
  uint64_t v18 = [v8 keyLayout];
  [(TIKeyboardInputManager *)self setKeyLayout:v18];

  if (v5)
  {
    uint64_t v19 = +[TIConnectionsMetricsTracker sharedInstance];
    [v19 setInputContextDidChange:1];
  }
  -[TIKeyboardInputManager setAutoCorrects:](self, "setAutoCorrects:", [v8 autocorrectionEnabled]);
  -[TIKeyboardInputManager setAutocapitalizationEnabled:](self, "setAutocapitalizationEnabled:", [v8 autocapitalizationEnabled]);
  -[TIKeyboardInputManager setAutocapitalizationType:](self, "setAutocapitalizationType:", [v8 autocapitalizationType]);
  -[TIKeyboardInputManager setKeyboardEventsLagging:](self, "setKeyboardEventsLagging:", [v8 keyboardEventsLagging]);
  -[TIKeyboardInputManager setInHardwareKeyboardMode:](self, "setInHardwareKeyboardMode:", [v8 hardwareKeyboardMode]);
  -[TIKeyboardInputManager setInSplitKeyboardMode:](self, "setInSplitKeyboardMode:", [v8 splitKeyboardMode]);
  [(TIKeyboardInputManager *)self syncInputStringToKeyboardState:v8 afterContextChange:v5];
  if (![v8 wordLearningEnabled])
  {
    unint64_t v22 = self;
    uint64_t v23 = 0;
    goto LABEL_17;
  }
  if (!self->_didInitialSync
    || v5
    || ([v8 documentState],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 documentIsEmpty],
        v20,
        v21))
  {
    unint64_t v22 = self;
    uint64_t v23 = 1;
LABEL_17:
    [(TIKeyboardInputManager *)v22 setLearnsCorrection:v23];
  }
  if (![v8 secureTextEntry] && TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      long long v25 = (void *)m_impl[28];
      if (v25)
      {
        id v26 = [(TIKeyboardInputManagerBase *)self inputMode];
        KB::DictionaryContainer::load_dynamic_dict(v25, [v26 isSiriMode]);
      }
    }
    [(TITextCheckerExemptions *)self->_textCheckerExemptions setAssertsObservers:1];
  }
  long long v27 = self->m_impl;
  if (v27)
  {
    long long v28 = [(TIKeyboardInputManager *)self keyboardState];
    v27[691] = [v28 autocapitalizationEnabled];
  }
  [(TIKeyboardInputManager *)self installTypologyTraceLogger];
  long long v29 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
  long long v30 = [(TIKeyboardInputManager *)self keyboardState];
  [v29 updateEmojiStatusForKeyboardState:v30];

  long long v31 = +[TIAppAutofillManager sharedInstance];
  unint64_t v32 = [(TIKeyboardInputManager *)self keyboardState];
  [v31 pushQueuedCredentialIfNecessaryForKeyboardState:v32];

  uint64_t v33 = [TIKBAnalyticsMetricsContext alloc];
  uint64_t v34 = [(TIKeyboardInputManager *)self languageSelectionController];
  uint64_t v35 = [v34 activeInputModes];
  unint64_t v36 = [(TIKeyboardInputManager *)self testingParameters];
  uint64_t v37 = [(TIKBAnalyticsMetricsContext *)v33 initWithKeyboardState:v8 activeInputModes:v35 testingParameters:v36];

  counterChangeCache = self->_counterChangeCache;
  char v39 = [v8 statisticChanges];
  [(TICounterChangeCache *)counterChangeCache addStatisticChanges:v39 withContext:v37];

  int v40 = self->_counterChangeCache;
  objc_super v41 = [MEMORY[0x1E4FAE410] sharedInstance];
  id v42 = [v41 flush];
  [(TICounterChangeCache *)v40 addStatisticChanges:v42 withContext:v37];

  if (self->m_impl)
  {
    unint64_t v43 = +[TITrialManagerProxy sharedManager];
    uint64_t v44 = [(TIKeyboardInputManager *)self dictionaryInputMode];
    uint64_t v45 = [v44 locale];
    uint64_t v46 = [v43 inputTranscoderAssetsDirectoryURLForLocale:v45];

    __p.__r_.__value_.__s.__data_[0] = 0;
    char v55 = 0;
    if (v46)
    {
      objc_msgSend(v46, "absoluteString", __p.__r_.__value_.__r.__words[0]);
      id v47 = objc_claimAutoreleasedReturnValue();
      std::optional<std::string>::operator=[abi:nn180100]<char const*,void>(&__p, (std::string::value_type *)[v47 UTF8String]);
    }
    else
    {
      long long v48 = [(TIKeyboardInputManager *)self config];
      id v49 = [v48 mlttBundleURL];

      if (!v49) {
        goto LABEL_32;
      }
      id v47 = [(TIKeyboardInputManager *)self config];
      NSUInteger v50 = [v47 mlttBundleURL];
      id v51 = [v50 absoluteString];
      std::optional<std::string>::operator=[abi:nn180100]<char const*,void>(&__p, (std::string::value_type *)[v51 UTF8String]);
    }
LABEL_32:
    (*(void (**)(void, std::string *))(**((void **)self->m_impl + 23) + 424))(*((void *)self->m_impl + 23), &__p);
    if (v55 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  self->_didInitialSync = 1;
  uint64_t v52 = +[TITransientLexiconManager sharedInstance];
  uint64_t v53 = [v52 supplementalLexicons];
  objc_storeWeak((id *)&self->_currentCandidateGenerationContextSupplementalLexicons, v53);
}

- (BOOL)updateAdaptationContextToKeyboardState:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = NSString;
  id v8 = [v5 recipientIdentifier];
  id v9 = [v6 recipientIdentifier];
  if ([v7 _string:v8 matchesString:v9])
  {
    BOOL v10 = NSString;
    uint64_t v11 = [v5 clientIdentifier];
    uint64_t v12 = [v6 clientIdentifier];
    int v13 = [v10 _string:v11 matchesString:v12] ^ 1;
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)willChangeToKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = a3;
  id v6 = [v28 documentIdentifier];
  if (v6)
  {

LABEL_4:
    uint64_t v9 = [v28 documentIdentifier];
    if (v9)
    {
      BOOL v10 = (void *)v9;
      uint64_t v11 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v12 = [v11 documentIdentifier];

      if (v12)
      {
        int v13 = [v28 documentIdentifier];
        char v14 = [(TIKeyboardInputManager *)self keyboardState];
        long long v15 = [v14 documentIdentifier];
        char v16 = [v13 isEqual:v15];

        if (v16) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_9;
  }
  uint64_t v7 = [(TIKeyboardInputManager *)self keyboardState];
  id v8 = [v7 documentIdentifier];

  if (v8) {
    goto LABEL_4;
  }
  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v17 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v18 = [v17 textInputTraits];
  uint64_t v19 = [v18 recentInputIdentifier];

  if (v19)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4FAE3E8];
    int v21 = [(TIKeyboardInputManager *)self keyboardState];
    unint64_t v22 = [v21 documentState];
    uint64_t v23 = [v22 contextBeforeInput];
    uint64_t v24 = +[TIKeyboardInputManager recentsFilePathForIdentifier:v19];
    [v20 storeInput:v23 forSystemIdentifier:v19 atPath:v24];
  }
  if (![(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    long long v25 = [(TIKeyboardInputManager *)self revisionHistory];
    [v25 syncToDocumentState:0];
  }
  id v26 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
  autocorrectionListsForWordsInDocument = self->_autocorrectionListsForWordsInDocument;
  self->_autocorrectionListsForWordsInDocument = v26;

LABEL_14:
  [(TIKeyboardInputManager *)self updateResponseModelForKeyboardState:v28];
}

- (void)syncInputStringToKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    [(TIKeyboardInputManager *)self syncMarkedTextForKeyboardState:v7 afterContextChange:v4];
  }
  else if (v4 || !self->_didInitialSync)
  {
    self->_lastHitTestKeycode = -1;
    id v6 = [v7 documentState];
    [(TIKeyboardInputManager *)self setInputStringFromDocumentState:v6 isDeleteEvent:0];
  }
}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  uint64_t v6 = [v25 inputForMarkedText];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1F3F7A998;
  }
  uint64_t v9 = v8;

  uint64_t v10 = [(__CFString *)v9 length];
  uint64_t v11 = [(TIKeyboardInputManager *)self rawInputString];
  if ([(__CFString *)v9 isEqualToString:v11])
  {

    if (v10 || !v4)
    {
      uint64_t v12 = [v25 documentState];
      uint64_t v13 = [v12 markedText];
      char v14 = (void *)v13;
      if (v13) {
        long long v15 = (__CFString *)v13;
      }
      else {
        long long v15 = &stru_1F3F7A998;
      }
      char v16 = v15;

      uint64_t v17 = [(TIKeyboardInputManager *)self inputString];
      int v18 = [(__CFString *)v16 isEqualToString:v17];

      if (v18) {
        [(TIKeyboardInputManager *)self setPhraseBoundaryIfNecessary];
      }
      else {
        [(TIKeyboardInputManager *)self setMarkedText];
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v19 = [(TIKeyboardInputManager *)self rawInputString];
  char v20 = [(__CFString *)v9 isEqualToString:v19];

  if ((v20 & 1) != 0
    || [(TIKeyboardInputManager *)self shouldClearInputOnMarkedTextOutOfSync])
  {
    [(TIKeyboardInputManager *)self clearInput];
    if (v4) {
      [(TIKeyboardInputManager *)self inputLocationChanged];
    }
    if (v10)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4FAE328]);
      [v21 setString:v9];
      unint64_t v22 = [TIKeyboardInputManagerKeyboardContext alloc];
      uint64_t v23 = [(TIKeyboardInputManager *)self keyboardState];
      uint64_t v24 = [(TIKeyboardInputManagerKeyboardContext *)v22 initWithKeyboardState:v23];

      [(TIKeyboardInputManager *)self addInput:v21 withContext:v24];
    }
  }
LABEL_20:
}

- (void)syncToLayoutState:(id)a3
{
  id v8 = a3;
  s_interface_idiom_is_pad = [v8 userInterfaceIdiom] == 1;
  if (v8) {
    uint64_t v4 = [v8 userInterfaceIdiom];
  }
  else {
    uint64_t v4 = -1;
  }
  [(TIKeyboardInputManager *)self setUserInterfaceIdiom:v4];
  id v5 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  [v5 specializeInputManager:self->m_impl forLayoutState:v8];

  m_impl = (void **)self->m_impl;
  if (m_impl)
  {
    (*(void (**)(void *, BOOL))(*m_impl[23] + 296))(m_impl[23], [(TIKeyboardInputManager *)self usesContinuousPath]);
    id v7 = (void **)self->m_impl;
    [(TIKeyboardInputManager *)self usesMLTapTyping];
    (*(void (**)(void))(*v7[23] + 320))();
  }
}

- (void)incrementUsageTrackingKeysForDeleteFromInput
{
  char v3 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v4 = [v3 documentState];
  int v5 = [v4 deletingBackwardsWillRemoveText];

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardInputManager *)self usageTrackingKeyForStatistic:*MEMORY[0x1E4FAEB60]];
    TIStatisticScalarIncrement();
  }
  if (![(TIKeyboardInputManager *)self usesCandidateSelection])
  {
    id v21 = [(TIKeyboardInputManager *)self inputString];
    if (![v21 length])
    {
      id v7 = [(TIKeyboardInputManager *)self keyboardState];
      id v8 = [v7 documentState];
      uint64_t v9 = [v8 selectedText];

      id v21 = (id)v9;
    }
    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v11 = [v21 componentsSeparatedByCharactersInSet:v10];
    uint64_t v12 = [v11 lastObject];

    if (![v12 length]) {
      goto LABEL_17;
    }
    uint64_t v13 = [(TIKeyboardInputManager *)self recentAutocorrections];
    char v14 = [v13 objectForKey:v12];

    long long v15 = [(TIKeyboardInputManager *)self recentPredictiveInputSelections];
    char v16 = [v15 objectForKey:v12];

    if (![v14 isAutocorrection] || v16)
    {
      int v20 = [v16 isAutocorrection];
      uint64_t v17 = (void *)MEMORY[0x1E4FAEB50];
      if (v20) {
        uint64_t v17 = (void *)MEMORY[0x1E4FAEB48];
      }
      if ((v20 & 1) == 0 && !v16) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4FAEB40];
    }
    uint64_t v18 = [(TIKeyboardInputManager *)self usageTrackingKeyForStatistic:*v17];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      TIStatisticScalarIncrement();
    }
LABEL_16:

LABEL_17:
  }
}

- (void)incrementUsageTrackingKeyForAppWithIsSentence:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(TIKeyboardInputManager *)self shouldSuppressTokenIDLookups])
  {
    int v5 = [(TIKeyboardInputManager *)self config];
    char v6 = [v5 disableAnalytics];

    if ((v6 & 1) == 0)
    {
      if (-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::onceToken != -1) {
        dispatch_once(&-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::onceToken, &__block_literal_global_11490);
      }
      id v7 = [(TIKeyboardInputManager *)self keyboardState];
      id v13 = [v7 clientIdentifier];

      if ([v13 isEqualToString:@"com.apple.MobileSMS"])
      {
        id v8 = (void *)MEMORY[0x1E4FAED58];
        uint64_t v9 = (void *)MEMORY[0x1E4FAED50];
      }
      else if ([v13 isEqualToString:@"com.apple.mobilemail"])
      {
        id v8 = (void *)MEMORY[0x1E4FAED48];
        uint64_t v9 = (void *)MEMORY[0x1E4FAED40];
      }
      else if ([v13 hasPrefix:@"com.apple"])
      {
        id v8 = (void *)MEMORY[0x1E4FAECD0];
        uint64_t v9 = (void *)MEMORY[0x1E4FAECC8];
      }
      else
      {
        char v10 = [(id)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps containsObject:v13];
        uint64_t v9 = (void *)MEMORY[0x1E4FAED88];
        if (v10)
        {
          id v8 = (void *)MEMORY[0x1E4FAEE40];
        }
        else
        {
          int v11 = [(id)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps containsObject:v13];
          if (v11) {
            uint64_t v9 = (void *)MEMORY[0x1E4FAEE28];
          }
          id v8 = (void *)MEMORY[0x1E4FAED90];
          if (v11) {
            id v8 = (void *)MEMORY[0x1E4FAEE30];
          }
        }
      }
      if (v3) {
        id v8 = v9;
      }
      uint64_t v12 = [(TIKeyboardInputManager *)self usageTrackingKeyForStatistic:*v8];
      TIStatisticScalarIncrement();
    }
  }
}

uint64_t __72__TIKeyboardInputManager_incrementUsageTrackingKeyForAppWithIsSentence___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F3FA7790];
  id v1 = (void *)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps;
  -[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F3FA77A8];
  uint64_t v3 = -[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps;
  -[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

- (void)incrementUsageTrackingKey:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(TIKeyboardInputManager *)self config];
  char v5 = [v4 disableAnalytics];

  if ((v5 & 1) == 0)
  {
    char v6 = [(TIKeyboardInputManager *)self usageTrackingKeyForStatistic:v7];
    TIStatisticScalarIncrement();
  }
}

- (void)incrementUsageTrackingKeyForAutocorrectionStatistic:(id)a3 autocorrectionTypes:(unsigned int)a4
{
  id v10 = a3;
  char v5 = [(TIKeyboardInputManager *)self config];
  char v6 = [v5 disableAnalytics];

  if ((v6 & 1) == 0)
  {
    id v7 = [(TIKeyboardInputManager *)self keyboardState];
    id v8 = [v7 layoutState];
    uint64_t v9 = [v8 inputMode];
    TIStatisticScalarIncrementAutocorrectionKey();
  }
}

- (id)usageTrackingKeyForStatistic:(id)a3
{
  id v4 = a3;
  char v5 = [(TIKeyboardInputManager *)self keyboardState];
  char v6 = [v5 layoutState];
  id v7 = [v6 inputMode];
  id v8 = TIStatisticGetKeyForInputMode();

  return v8;
}

- (void)popCandidateGenerationContextFromStack
{
  uint64_t v3 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  [v3 close];

  [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
  id v4 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequestStack];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    char v6 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequestStack];
    id v7 = [v6 lastObject];
    [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:v7];

    id v8 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequestStack];
    [v8 removeLastObject];
  }
}

- (void)pushCandidateGenerationContextOnStack
{
  uint64_t v3 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequestStack];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequestStack:v4];
  }
  uint64_t v5 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequestStack];
  char v6 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  [v5 addObject:v6];

  [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  [(TIKeyboardInputManager *)self pushCandidateGenerationContextWithResults:a3];
  char v6 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];

  if (!v6) {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v7 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
    [v7 close];

    [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
  }
  return v4;
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  LOBYTE(self) = -[TIKeyboardInputManager closeCandidateGenerationContextWithResults:forced:](self, "closeCandidateGenerationContextWithResults:forced:", v4, [v5 asynchronous] ^ 1);

  return (char)self;
}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  id v17 = a3;
  id v4 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
    char v6 = [v5 inputForMarkedText];

    if (v6)
    {
      id v7 = [(TIKeyboardInputManager *)self markedText];
      [v17 setUncommittedText:v7];
    }
    if (v17)
    {
      id v8 = [v17 proactiveTriggers];
      uint64_t v9 = [v8 firstObject];
      id v10 = [(TIKeyboardInputManager *)self keyboardState];
      [(TIKeyboardInputManager *)self trackProactiveMetrics:v9 keyboardState:v10];

      id v11 = objc_alloc(MEMORY[0x1E4FAE278]);
      uint64_t v12 = [v17 candidates];
      id v13 = (void *)[v11 initWithCandidates:v12];

      char v14 = [(TIKeyboardInputManager *)self typingSessionMonitor];
      long long v15 = [(TIKeyboardInputManager *)self keyboardState];
      [v14 candidatesOffered:v13 keyboardState:v15];
    }
    char v16 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
    [v16 pushCandidateResultSet:v17];
  }
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManager *)self closeCandidateGenerationContextWithResults:0 forced:1];
  [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:v4];

  id v5 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  [v5 open];
}

- (BOOL)shouldUpdateLanguageModel
{
  if (!self->m_impl) {
    return 0;
  }
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  if (([v3 secureTextEntry] & 1) == 0)
  {
    unsigned int v5 = TI_DEVICE_UNLOCKED_SINCE_BOOT();

    if (v5)
    {
      uint64_t v6 = *((void *)self->m_impl + 28);
      if (v6)
      {
        if (**(void **)(v6 + 8) != *(void *)(*(void *)(v6 + 8) + 8))
        {
          uint64_t v3 = [(TIKeyboardState *)self->_keyboardState textInputTraits];
          BOOL v4 = [v3 autocorrectionType] != 1;
          goto LABEL_4;
        }
      }
    }
    return 0;
  }
  BOOL v4 = 0;
LABEL_4:

  return v4;
}

- (BOOL)shouldUpdateDictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v4 = m_impl[28];
    BOOL v5 = !v4
      || **(void **)(v4 + 8) == *(void *)(*(void *)(v4 + 8) + 8)
      || [(TIKeyboardInputManager *)self linguisticResourceStatus] == 2;
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v6 = TIOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v8 = NSString;
        unint64_t v9 = [(TIKeyboardInputManager *)self linguisticResourceStatus];
        if (v9 > 2) {
          id v10 = "Unknown";
        }
        else {
          id v10 = off_1E6E2C1F0[v9];
        }
        id v11 = "False";
        if (v5) {
          id v11 = "True";
        }
        uint64_t v12 = [v8 stringWithFormat:@"%s linguisticResourceStatus: %s, result: %s", "-[TIKeyboardInputManager shouldUpdateDictionary]", v10, v11];
        *(_DWORD *)buf = 138412290;
        char v14 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)updateTrialFavoniusLanguagePowerForPrimaryLocale
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[TITrialManagerProxy sharedManager];
  uint64_t v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  BOOL v5 = [v4 locale];
  uint64_t v6 = [v3 favoniusLanguagePowerOverrideForLocale:v5];

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      [v6 floatValue];
      int v14 = 136315394;
      uint64_t v15 = "-[TIKeyboardInputManager updateTrialFavoniusLanguagePowerForPrimaryLocale]";
      __int16 v16 = 2048;
      double v17 = v13;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Trial: Updating favonius language power to: %f", (uint8_t *)&v14, 0x16u);
    }
    m_impl = (void **)self->m_impl;
    [v6 floatValue];
    (*(void (**)(void))(*m_impl[23] + 496))();
  }
  else
  {
    id v8 = [(TIKeyboardInputManager *)self config];
    unint64_t v9 = [v8 favoniusLanguageModelWeight];

    id v10 = (void **)self->m_impl;
    if (v9)
    {
      id v11 = [(TIKeyboardInputManager *)self config];
      uint64_t v12 = [v11 favoniusLanguageModelWeight];
      [v12 floatValue];
      (*(void (**)(void))(*v10[23] + 496))();
    }
    else
    {
      (*(void (**)(void *, void))(*v10[23] + 496))(v10[23], 0);
    }
  }
}

- (void)updateDictionaryAndLanguageModel
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(TIKeyboardInputManager *)self shouldUpdateDictionary]) {
    [(TIKeyboardInputManager *)self loadDictionaries];
  }
  [(TIKeyboardInputManager *)self updateInlineCompletionOperatingPointForPrimaryLocale];
  if ([(TIKeyboardInputManager *)self shouldUpdateLanguageModel]
    && [(TIKeyboardInputManager *)self updateLanguageModelForKeyboardState])
  {
    [(TIKeyboardInputManager *)self loadFavoniusTypingModel];
    [(TIKeyboardInputManager *)self logTestingParametersToTypology];
  }
  [(TIKeyboardInputManager *)self updateTrialNegativeLearningFlagForPrimaryLocale];
  [(TIKeyboardInputManager *)self updateTrialFavoniusLanguagePowerForPrimaryLocale];
  [(TIKeyboardInputManager *)self setLinguisticResourceStatus:0 reason:@"Dictionary and LM updated"];
  m_impl = self->m_impl;
  uint64_t v4 = *((void *)m_impl + 29);
  if (v4)
  {
    BOOL v5 = (unsigned int *)*((void *)m_impl + 28);
    uint64_t v15 = v5;
    if (v5) {
      atomic_fetch_add((atomic_uint *volatile)v5, 1u);
    }
    (*(void (**)(uint64_t, unsigned int **))(*(void *)v4 + 248))(v4, &v15);
    if (v15) {
      WTF::RefCounted<KB::DictionaryContainer>::deref(v15);
    }
    uint64_t v6 = [TIKBAnalyticsMetricsContext alloc];
    id v7 = [(TIKeyboardInputManager *)self keyboardState];
    id v8 = [(TIKeyboardInputManager *)self languageSelectionController];
    unint64_t v9 = [v8 activeInputModes];
    id v10 = [(TIKeyboardInputManager *)self testingParameters];
    id v11 = [(TIKBAnalyticsMetricsContext *)v6 initWithKeyboardState:v7 activeInputModes:v9 testingParameters:v10];

    uint64_t v12 = *((void *)self->m_impl + 29);
    float v13 = [(TIKeyboardInputManager *)self keyboardState];
    int v14 = [v13 clientIdentifier];
    [(TIKeyboardInputManager *)self inlineCompletionMetadataFrom:v11 andBundleId:v14];
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v12 + 256))(v12, v16);
    if (v35 && v34 == 1) {
      free(v35);
    }
    if (v33 && v32 == 1) {
      free(v33);
    }
    if (v31 && v30 == 1) {
      free(v31);
    }
    if (v29 && v28 == 1) {
      free(v29);
    }
    if (v27 && v26 == 1) {
      free(v27);
    }
    if (v25 && v24 == 1) {
      free(v25);
    }
    if (v23 && v22 == 1) {
      free(v23);
    }
    if (v21 && v20 == 1) {
      free(v21);
    }
    if (v19 && v18 == 1) {
      free(v19);
    }
    if (v17)
    {
      if (v16[6] == 1) {
        free(v17);
      }
    }
  }
}

- (BOOL)isLinguisticResourceUpdateScheduled
{
  unint64_t v3 = [(TIKeyboardInputManager *)self linguisticResourceStatus];
  if (v3 != 1) {
    LOBYTE(v3) = [(TIKeyboardInputManager *)self linguisticResourceStatus] == 2;
  }
  return v3;
}

- (void)scheduleLinguisticResourceUpdateWithReason:(id)a3
{
  id v4 = a3;
  if (![(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled]) {
    [(TIKeyboardInputManager *)self setLinguisticResourceStatus:1 reason:v4];
  }
}

- (void)scheduleLinguisticResourceUpdate
{
}

- (BOOL)isStringBasedModel
{
  uint64_t v2 = *((void *)self->m_impl + 29);
  if (v2) {
    LOBYTE(v2) = (*(uint64_t (**)(void))(*(void *)v2 + 24))();
  }
  return v2;
}

- (void)refreshInputManagerState
{
  BOOL v5 = [(TIKeyboardInputManager *)self usesCandidateSelection];
  BOOL v6 = v5;
  if (v5)
  {
    [(TIKeyboardInputManager *)self inputString];
  }
  else
  {
    uint64_t v2 = [(TIKeyboardInputManager *)self keyboardState];
    unint64_t v3 = [v2 documentState];
    [(TIKeyboardInputManager *)self inputStringFromDocumentState:v3];
  id v7 = };
  id v8 = [(TIKeyboardInputManager *)self currentState];
  [v8 setInputString:v7];

  if (!v6)
  {

    id v7 = v2;
  }

  BOOL v9 = [(TIKeyboardInputManager *)self _hasSupplementalPrefix];
  id v10 = [(TIKeyboardInputManager *)self currentState];
  [v10 setHasSupplementalPrefix:v9];

  uint64_t v11 = [(TIKeyboardInputManager *)self inputCount];
  uint64_t v12 = [(TIKeyboardInputManager *)self currentState];
  [v12 setInputCount:v11];

  uint64_t v13 = [(TIKeyboardInputManager *)self inputIndex];
  int v14 = [(TIKeyboardInputManager *)self currentState];
  [v14 setInputIndex:v13];

  BOOL v15 = [(TIKeyboardInputManager *)self nextInputWouldStartSentence];
  __int16 v16 = [(TIKeyboardInputManager *)self currentState];
  [v16 setNextInputWouldStartSentence:v15];

  double v17 = [(TIKeyboardInputManager *)self shadowTyping];
  char v18 = [(TIKeyboardInputManager *)self currentState];
  [v18 setShadowTyping:v17];

  uint64_t v19 = [(TIKeyboardInputManager *)self keyEventMap];
  char v20 = [(TIKeyboardInputManager *)self currentState];
  [v20 setKeyEventMap:v19];

  id v21 = [(TIKeyboardInputManager *)self replacementForDoubleSpace];
  char v22 = [(TIKeyboardInputManager *)self currentState];
  [v22 setReplacementForDoubleSpace:v21];

  uint64_t v23 = [(TIKeyboardInputManager *)self keyboardState];
  char v24 = [v23 documentState];
  id v25 = [(TIKeyboardInputManager *)self shortcutCompletionsForDocumentState:v24];
  char v26 = [(TIKeyboardInputManager *)self currentState];
  [v26 setShortcutCompletions:v25];

  long long v27 = [(TIKeyboardInputManager *)self inputsToReject];
  char v28 = [(TIKeyboardInputManager *)self currentState];
  [v28 setInputsToReject:v27];

  BOOL v29 = [(TIKeyboardInputManager *)self suppressPlaceholderCandidate];
  char v30 = [(TIKeyboardInputManager *)self currentState];
  [v30 setSuppressPlaceholderCandidate:v29];

  BOOL v31 = [(TIKeyboardInputManager *)self supportsNumberKeySelection];
  char v32 = [(TIKeyboardInputManager *)self currentState];
  [v32 setSupportsNumberKeySelection:v31];

  BOOL v33 = [(TIKeyboardInputManager *)self usesPunctuationKeysForRowNavigation];
  char v34 = [(TIKeyboardInputManager *)self currentState];
  [v34 setUsesPunctuationKeysForRowNavigation:v33];

  BOOL v35 = [(TIKeyboardInputManager *)self usesLiveConversion];
  uint64_t v36 = [(TIKeyboardInputManager *)self currentState];
  [v36 setUsesLiveConversion:v35];

  BOOL v37 = [(TIKeyboardInputManager *)self delayedCandidateList];
  NSUInteger v38 = [(TIKeyboardInputManager *)self currentState];
  [v38 setDelayedCandidateList:v37];

  char v39 = [(TIKeyboardInputManager *)self currentState];
  id v57 = [v39 inputString];

  uint64_t v40 = [v57 length];
  if (v40)
  {
    NSUInteger v38 = [(TIKeyboardInputManager *)self textCheckerExemptions];
    uint64_t v41 = [v38 stringIsExemptFromChecker:v57];
  }
  else
  {
    uint64_t v41 = 0;
  }
  id v42 = [(TIKeyboardInputManager *)self currentState];
  [v42 setInputStringIsExemptFromChecker:v41];

  if (v40) {
  if (v57)
  }
  {
    unint64_t v43 = [(TIKeyboardInputManager *)self autocorrectionRecordForWord:v57];
  }
  else
  {
    unint64_t v43 = 0;
  }
  uint64_t v44 = [(TIKeyboardInputManager *)self currentState];
  [v44 setAutocorrectionRecordForInputString:v43];

  if (v57) {
  BOOL v45 = [(TIKeyboardInputManager *)self usesContinuousPath];
  }
  uint64_t v46 = [(TIKeyboardInputManager *)self currentState];
  [v46 setUsesContinuousPath:v45];

  BOOL v47 = [(TIKeyboardInputManager *)self shouldFixupIncompleteRomaji];
  long long v48 = [(TIKeyboardInputManager *)self currentState];
  [v48 setShouldFixupIncompleteRomaji:v47];

  BOOL v49 = [(TIKeyboardInputManager *)self acceptAutocorrectionCommitsInline];
  NSUInteger v50 = [(TIKeyboardInputManager *)self currentState];
  [v50 setAcceptAutocorrectionCommitsInline:v49];

  id v51 = [(TIKeyboardInputManager *)self config];
  uint64_t v52 = (void *)[v51 shouldIgnoreCPRequirements];
  uint64_t v53 = [(TIKeyboardInputManager *)self currentState];
  [v53 setIgnoreContinuousPathRequirements:v52];

  uint64_t v54 = [(TIKeyboardInputManager *)self lastAcceptedText];
  if (v54)
  {
    uint64_t v52 = [(TIKeyboardInputManager *)self lastAcceptedText];
    uint64_t v55 = [v52 learningFlagsMask];
  }
  else
  {
    uint64_t v55 = 0;
  }
  BOOL v56 = [(TIKeyboardInputManager *)self currentState];
  [v56 setLearningFlagsMaskForLastAcceptedCandidate:v55];

  if (v54) {
}
  }

- (TISmartPunctuationOptions)smartOptions
{
  smartOptions = self->_smartOptions;
  if (!smartOptions)
  {
    id v4 = (void *)MEMORY[0x1E4FAE408];
    BOOL v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    BOOL v6 = [v5 locale];
    id v7 = [v4 smartPunctuationOptionsForLocale:v6];
    id v8 = self->_smartOptions;
    self->_smartOptions = v7;

    smartOptions = self->_smartOptions;
  }

  return smartOptions;
}

- (TIKeyboardInputManagerState)currentState
{
  currentState = self->_currentState;
  if (!currentState)
  {
    id v4 = [(TIKeyboardInputManager *)self newInputManagerState];
    BOOL v5 = self->_currentState;
    self->_currentState = v4;

    currentState = self->_currentState;
  }

  return currentState;
}

- (id)newInputManagerState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FAE340]);
  objc_msgSend(v3, "setCanHandleKeyHitTest:", -[TIKeyboardInputManager canHandleKeyHitTest](self, "canHandleKeyHitTest"));
  objc_msgSend(v3, "setIgnoresDeadKeys:", -[TIKeyboardInputManager ignoresDeadKeys](self, "ignoresDeadKeys"));
  objc_msgSend(v3, "setShouldExtendPriorWord:", -[TIKeyboardInputManager shouldExtendPriorWord](self, "shouldExtendPriorWord"));
  objc_msgSend(v3, "setSupportsReversionUI:", -[TIKeyboardInputManager supportsReversionUI](self, "supportsReversionUI"));
  objc_msgSend(v3, "setSuppliesCompletions:", -[TIKeyboardInputManager suppliesCompletions](self, "suppliesCompletions"));
  objc_msgSend(v3, "setSupportsSetPhraseBoundary:", -[TIKeyboardInputManager supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"));
  objc_msgSend(v3, "setSuppressCompletionsForFieldEditor:", -[TIKeyboardInputManager suppressCompletionsForFieldEditor](self, "suppressCompletionsForFieldEditor"));
  objc_msgSend(v3, "setUsesAutoDeleteWord:", -[TIKeyboardInputManager usesAutoDeleteWord](self, "usesAutoDeleteWord"));
  objc_msgSend(v3, "setAutoquoteType:", -[TIKeyboardInputManager autoquoteType](self, "autoquoteType"));
  objc_msgSend(v3, "setUsesCandidateSelection:", -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"));
  id v4 = [(TIKeyboardInputManager *)self keyboardState];
  objc_msgSend(v3, "setUsesAutocorrectionLists:", objc_msgSend(v4, "autocorrectionListUIDisplayed"));

  objc_msgSend(v3, "setCommitsAcceptedCandidate:", -[TIKeyboardInputManager commitsAcceptedCandidate](self, "commitsAcceptedCandidate"));
  objc_msgSend(v3, "setNewInputAcceptsUserSelectedCandidate:", -[TIKeyboardInputManager newInputAcceptsUserSelectedCandidate](self, "newInputAcceptsUserSelectedCandidate"));
  objc_msgSend(v3, "setInitialCandidateBatchCount:", -[TIKeyboardInputManager initialCandidateBatchCount](self, "initialCandidateBatchCount"));
  BOOL v5 = [(TIKeyboardInputManager *)self wordSeparator];
  [v3 setWordSeparator:v5];

  objc_msgSend(v3, "setShouldAddModifierSymbolsToWordCharacters:", -[TIKeyboardInputManager shouldAddModifierSymbolsToWordCharacters](self, "shouldAddModifierSymbolsToWordCharacters"));
  BOOL v6 = [(TIKeyboardInputManager *)self wordCharacters];
  [v3 setWordCharacters:v6];

  id v7 = [(TIKeyboardInputManager *)self supplementalLexiconWordExtraCharacters];
  [v3 setSupplementalLexiconWordExtraCharacters:v7];

  id v8 = [(TIKeyboardInputManager *)self terminatorsPreventingAutocorrection];
  [v3 setTerminatorsPreventingAutocorrection:v8];

  BOOL v9 = [(TIKeyboardInputManager *)self terminatorsDeletingAutospace];
  [v3 setTerminatorsDeletingAutospace:v9];

  id v10 = [(TIKeyboardInputManager *)self keyboardBehaviors];
  [v3 setKeyboardBehaviors:v10];

  objc_msgSend(v3, "setUsesContinuousPath:", -[TIKeyboardInputManager usesContinuousPath](self, "usesContinuousPath"));
  uint64_t v11 = [(TIKeyboardInputManager *)self config];
  objc_msgSend(v3, "setUsesContinuousPathProgressiveCandidates:", objc_msgSend(v11, "usesContinuousPathProgressiveCandidates"));

  uint64_t v12 = [(TIKeyboardInputManager *)self config];
  objc_msgSend(v3, "setInsertsSpaceAfterPredictiveInput:", objc_msgSend(v12, "insertsSpaceAfterPredictiveInput"));

  uint64_t v13 = [(TIKeyboardInputManager *)self config];
  objc_msgSend(v3, "setIgnoreContinuousPathRequirements:", objc_msgSend(v13, "shouldIgnoreCPRequirements"));

  int v14 = [(TIKeyboardInputManager *)self lastAcceptedText];
  if (v14)
  {
    BOOL v15 = [(TIKeyboardInputManager *)self lastAcceptedText];
    objc_msgSend(v3, "setLearningFlagsMaskForLastAcceptedCandidate:", objc_msgSend(v15, "learningFlagsMask"));
  }
  else
  {
    [v3 setLearningFlagsMaskForLastAcceptedCandidate:0];
  }

  return v3;
}

- (TIKeyboardFeatureSpecialization)keyboardFeatureSpecialization
{
  keyboardFeatureSpecialization = self->_keyboardFeatureSpecialization;
  if (!keyboardFeatureSpecialization)
  {
    id v4 = [(TIKeyboardInputManagerBase *)self inputMode];
    BOOL v5 = +[TIKeyboardFeatureSpecialization createSpecializationForInputMode:v4];
    BOOL v6 = self->_keyboardFeatureSpecialization;
    self->_keyboardFeatureSpecialization = v5;

    id v7 = [(TIKeyboardInputManager *)self config];
    -[TIKeyboardFeatureSpecialization setUseRelaxedOVSPolicy:](self->_keyboardFeatureSpecialization, "setUseRelaxedOVSPolicy:", [v7 allowRelaxedOVSPolicy]);

    id v8 = [(TIKeyboardInputManager *)self config];
    -[TIKeyboardFeatureSpecialization setSkipCandidateQualityFilter:](self->_keyboardFeatureSpecialization, "setSkipCandidateQualityFilter:", [v8 skipCandidateQualityFilter]);

    keyboardFeatureSpecialization = self->_keyboardFeatureSpecialization;
  }

  return keyboardFeatureSpecialization;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(TICounterChangeCache *)self->_counterChangeCache close];
  id v3 = TIInputManagerOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSString;
    BOOL v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    BOOL v6 = [v4 stringWithFormat:@"%s Removing input manager for %@", "-[TIKeyboardInputManager dealloc]", v5];
    *(_DWORD *)buf = 138412290;
    int v14 = v6;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  typingSessionMonitor = self->_typingSessionMonitor;
  if (typingSessionMonitor) {
    [(TITypingSessionMonitor *)typingSessionMonitor tearDown];
  }
  [(TILanguageSelectionController *)self->_languageSelectionController setDelegate:0];
  [(TITextCheckerExemptions *)self->_textCheckerExemptions setAssertsObservers:0];
  m_impl = self->m_impl;
  if (m_impl)
  {
    (*(void (**)(void *))(*(void *)m_impl + 8))(m_impl);
    self->m_impl = 0;
  }
  BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self];

  [(TIRevisionHistory *)self->_revisionHistory setDelegate:0];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  uint64_t v11 = [(TIKeyboardInputManager *)self candidateHandlerForOpenRequest];
  [v11 close];

  [(TIKeyboardInputManager *)self setCandidateHandlerForOpenRequest:0];
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager;
  [(TIKeyboardInputManager *)&v12 dealloc];
}

- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4 languageSelectionController:(id)a5
{
  objc_storeStrong((id *)&self->_languageSelectionController, a5);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_super v12 = [(TIKeyboardInputManager *)self initWithConfig:v11 keyboardState:v10];

  [(TILanguageSelectionController *)v12->_languageSelectionController setDelegate:v12];
  return v12;
}

- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 inputMode];
  v39.receiver = self;
  v39.super_class = (Class)TIKeyboardInputManager;
  id v10 = [(TIKeyboardInputManagerBase *)&v39 initWithInputMode:v9 keyboardState:v8];

  if (v10)
  {
    [(TIKeyboardInputManager *)v10 setKeyboardState:v8];
    id v11 = +[TIKeyboardAssertionManager sharedAssertionManager];
    [v11 addAssertionForObject:v10];

    objc_super v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel_dynamicDictionariesRemoved_ name:@"TIKeyboardInputManagerDynamicDictionariesRemovedNotification" object:0];

    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v10 selector:sel_dynamicResourceDirectorySet_ name:@"TIKeyboardInputManagerDynamicResourceDirectorySetNotification" object:0];

    int v14 = +[TIAppAutofillManager sharedInstance];
    uint64_t v15 = [v14 secureCandidateRenderer];
    __int16 v16 = [(TIKeyboardInputManagerBase *)v10 inputMode];
    double v17 = [v16 languageWithRegion];
    [v15 setLocaleIdentifier:v17];

    objc_storeStrong((id *)&v10->_config, a3);
    char v18 = [[TILRUDictionary alloc] initWithMaximumCapacity:200];
    autocorrectionHistory = v10->_autocorrectionHistory;
    v10->_autocorrectionHistory = v18;

    char v20 = [[TILRUDictionary alloc] initWithMaximumCapacity:12];
    recentAutocorrections = v10->_recentAutocorrections;
    v10->_recentAutocorrections = v20;

    char v22 = [[TILRUDictionary alloc] initWithMaximumCapacity:12];
    recentPredictiveInputSelections = v10->_recentPredictiveInputSelections;
    v10->_recentPredictiveInputSelections = v22;

    char v24 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    rejectedAutocorrectionsDisplayedOrInserted = v10->_rejectedAutocorrectionsDisplayedOrInserted;
    v10->_rejectedAutocorrectionsDisplayedOrInserted = v24;

    char v26 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    rejectedAutocorrectionsDisplayedOrInsertedInverse = v10->_rejectedAutocorrectionsDisplayedOrInsertedInverse;
    v10->_rejectedAutocorrectionsDisplayedOrInsertedInverse = v26;

    char v28 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    autocorrectionForCurrentStem = v10->_autocorrectionForCurrentStem;
    v10->_autocorrectionForCurrentStem = v28;

    char v30 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    rejectedAutocorrections = v10->_rejectedAutocorrections;
    v10->_rejectedAutocorrections = v30;

    char v32 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    autocorrectionListsSuggestedForCurrentInput = v10->_autocorrectionListsSuggestedForCurrentInput;
    v10->_autocorrectionListsSuggestedForCurrentInput = v32;

    char v34 = [[TILRUDictionary alloc] initWithMaximumCapacity:20];
    autocorrectionListsForWordsInDocument = v10->_autocorrectionListsForWordsInDocument;
    v10->_autocorrectionListsForWordsInDocument = v34;

    v10->_isEditingWordPrefix = 0;
    v10->m_impl = [(TIKeyboardInputManager *)v10 initImplementation];
    uint64_t v36 = [(TIKeyboardInputManager *)v10 config];
    [v36 isTesting];

    BOOL v37 = [(TIKeyboardInputManager *)v10 config];
    [v37 isTesting];

    [(TIKeyboardInputManager *)v10 config];
    [(id)objc_claimAutoreleasedReturnValue() allowsSpaceCorrections];
    operator new();
  }

  return 0;
}

void __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke(uint64_t a1, const void *a2)
{
  if (a2) {
    TIInputManager::set_filter_specification_overrides(*(TIInputManager **)(*(void *)(a1 + 32) + 40), a2);
  }
}

void __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleTrialParametersUpdateCallback];
    id WeakRetained = v2;
  }
}

- (TIKeyboardInputManager)initWithInputMode:(id)a3 keyboardState:(id)a4
{
  id v6 = a4;
  id v7 = +[TIKeyboardInputManagerConfig configurationForInputMode:a3];
  id v8 = [(TIKeyboardInputManager *)self initWithConfig:v7 keyboardState:v6];

  return v8;
}

+ (id)offlineLearningHandleForInputMode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 normalizedIdentifier];
  BOOL v5 = TIGetInputModeProperties();

  id v6 = [v5 objectForKey:*MEMORY[0x1E4FAE6B0]];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [[TILanguageModelOfflineLearningHandleFavonius alloc] initWithInputMode:v3];
  [(TILanguageModelOfflineLearningHandle *)v8 setValid:v7];

  return v8;
}

+ (int)shiftContextForShiftState:(int)a3 autocapitalizationType:(unint64_t)a4
{
  if (a4 == 1) {
    int v4 = 3;
  }
  else {
    int v4 = 2;
  }
  if (a4 == 3) {
    int v4 = 4;
  }
  if (a3 != 2) {
    int v4 = 0;
  }
  if (a3 == 3) {
    int v5 = 5;
  }
  else {
    int v5 = v4;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v5;
  }
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  id v5 = a3;
  if (self->m_impl)
  {
    if ([(TIKeyboardInputManager *)self shouldMonitorTypingSession])
    {
      id v6 = [(TIKeyboardInputManager *)self typingSessionMonitor];
      [v6 addTouchEvent:v5];
    }
    m_impl = self->m_impl;
    [v5 location];
    uint64_t v8 = [v5 stage];
    [v5 timestamp];
    uint64_t v9 = [v5 pathIndex];
    uint64_t v10 = [v5 fingerID];
    [v5 radius];
    uint64_t v11 = [v5 forcedKeyCode];
    [v5 continuousPathState];
    int v12 = TIInputManager::add_touch((uint64_t)m_impl, v8, v9, v10, v11);
    int64_t v13 = v12;
    if ([v5 stage] != 2 && v12 != -2) {
      goto LABEL_14;
    }
    if (v12 < 0)
    {
      if (v12 != -2 || self->_lastHitTestKeycode < 0) {
        goto LABEL_13;
      }
    }
    else if (self->_lastHitTestKeycode != -2)
    {
      goto LABEL_13;
    }
    [(TIKeyboardInputManager *)self dropInput];
LABEL_13:
    self->_lastHitTestKeycode = v12;
LABEL_14:
    [(TIKeyboardInputManager *)self setPreviousTouchEvent:v5];
    goto LABEL_15;
  }
  int64_t v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)canHandleKeyHitTest
{
  if (TIGetKeyboardDisableHitTestingValue(void)::onceToken != -1) {
    dispatch_once(&TIGetKeyboardDisableHitTestingValue(void)::onceToken, &__block_literal_global_1323);
  }
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v4 = [(id)v3 valueForPreferenceKey:@"KeyboardDisableHitTesting"];

  LOBYTE(v3) = [v4 BOOLValue];
  if (v3) {
    return 0;
  }
  id v6 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v7 = [v6 canHandleKeyHitTest];

  return v7;
}

- (void)fetchAssetAvailabilityStatusForInputMode:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = +[TIAssetManager sharedAssetManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__TIKeyboardInputManager_TestingSupport__fetchAssetAvailabilityStatusForInputMode_completionHandler___block_invoke;
  v9[3] = &unk_1E6E2BC80;
  id v10 = v5;
  id v8 = v5;
  [v7 ddsAssetsForInputMode:v6 cachedOnly:0 completion:v9];
}

uint64_t __101__TIKeyboardInputManager_TestingSupport__fetchAssetAvailabilityStatusForInputMode_completionHandler___block_invoke(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    [a2 count];
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)fetchTypingSessionParams:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self languageSelectionController];
  id v6 = [v5 activeInputModes];

  char v7 = [(TIKeyboardInputManager *)self wordSeparator];
  id v8 = [(TIKeyboardInputManager *)self testingParameters];
  uint64_t v9 = [(TIKeyboardInputManagerBase *)self inputMode];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__TIKeyboardInputManager_TestingSupport__fetchTypingSessionParams___block_invoke;
  v14[3] = &unk_1E6E2C1D0;
  id v15 = v6;
  id v16 = v7;
  id v17 = v8;
  id v18 = v4;
  id v10 = v4;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  [(TIKeyboardInputManager *)self fetchAssetAvailabilityStatusForInputMode:v9 completionHandler:v14];
}

void __67__TIKeyboardInputManager_TestingSupport__fetchTypingSessionParams___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [[TITypingSessionParams alloc] initWithActiveInputModes:a1[4] wordSeparator:a1[5] testingParameters:a1[6] assetAvailabilityStatus:a2];
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)setTestingStateObject:(id)a3
{
}

- (id)getTestingStateObject
{
  return self->_testingStateObject;
}

- (unint64_t)userFrequencyOfWord:(id)a3 lexiconID:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  m_impl = self->m_impl;
  if (!m_impl) {
    return 0;
  }
  uint64_t v5 = *(void *)&a4;
  id v6 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:a3];
  KB::utf8_string(v6, (uint64_t)v10);
  unint64_t v7 = (*(unsigned int (**)(void, unsigned char *, uint64_t))(**(void **)(m_impl[28] + 24) + 64))(*(void *)(m_impl[28] + 24), v10, v5);
  if (v11) {
    BOOL v8 = v10[6] == 1;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    free(v11);
  }

  return v7;
}

- (unint64_t)userFrequencyOfWord:(id)a3
{
  return [(TIKeyboardInputManager *)self userFrequencyOfWord:a3 lexiconID:0xFFFFFFFFLL];
}

- (RefPtr<KB::DictionaryContainer>)getDictionary
{
  uint64_t v3 = (atomic_uint *)*((void *)self->m_impl + 28);
  void *v2 = v3;
  if (v3) {
    atomic_fetch_add(v3, 1u);
  }
  return (RefPtr<KB::DictionaryContainer>)self;
}

- (BOOL)dictionaryContainsWord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v4];
  id v6 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v4];

  m_impl = (TIInputManager *)self->m_impl;
  KB::utf8_string(v6, (uint64_t)v12);
  KB::utf8_string(v5, (uint64_t)v10);
  char v8 = TIInputManager::dictionary_contains_word(m_impl, (const KB::String *)v12, (const KB::String *)v10, 0);
  if (v11 && v10[6] == 1) {
    free(v11);
  }
  if (v13 && v12[6] == 1) {
    free(v13);
  }

  return v8;
}

- (id)configurationPropertyList
{
  uint64_t v2 = [(TIKeyboardInputManager *)self config];
  uint64_t v3 = [v2 propertyList];

  return v3;
}

- (void)logToTypologyRecorderWithString:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  CFStringRef v5 = v4;
  if (v4)
  {
    ptr = self->m_typology_recorder.__ptr_;
    if (ptr)
    {
      CFStringRef v7 = v4;
      CFStringAppend(*((CFMutableStringRef *)ptr + 1), v4);
      CFStringRef v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)isTypologyEnabled
{
  uint64_t v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  char v3 = [v2 BOOLForKey:53];

  return v3;
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v3 = m_impl[29];
    if (v3)
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 592))(v3, 1);
      id v4 = +[TIResponseKitManager sharedTIResponseKitManager];
      [v4 persistResponseKitDynamicDataToDisk];
    }
  }
}

- (void)clearHumanReadableTrace
{
  ptr = self->m_typology_recorder.__ptr_;
  if (ptr) {
    KB::TypologyLogger::clear((KB::TypologyLogger *)ptr);
  }
}

- (id)humanReadableTrace
{
  ptr = self->m_typology_recorder.__ptr_;
  if (ptr) {
    id v3 = *((id *)ptr + 1);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)addSynthesizedTouchToInput:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 string];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = [v6 string];
    id v11 = [v10 lowercaseString];

    uint64_t v12 = [v6 string];
    char v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      [v6 setUppercase:1];
      if ([(TIKeyboardInputManager *)self nextInputWouldStartSentence]) {
        [v6 setAutoshifted:1];
      }
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = -1;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x5012000000;
  char v30 = __Block_byref_object_copy__1242;
  BOOL v31 = __Block_byref_object_dispose__1243;
  char v32 = "";
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v33 = *MEMORY[0x1E4F1DB20];
  long long v34 = v14;
  if (v11 || [v6 isBackspace])
  {
    id v15 = [v7 keyLayout];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    uint64_t v22[2] = __98__TIKeyboardInputManager_TIHardwareKeyboardExperiments__addSynthesizedTouchToInput_keyboardState___block_invoke;
    void v22[3] = &unk_1E6E2C160;
    id v23 = v11;
    id v24 = v6;
    id v25 = &v27;
    char v26 = &v35;
    [v15 enumerateKeysUsingBlock:v22];
  }
  if (*((_DWORD *)v36 + 6) == -1)
  {
    [v6 setPopupVariant:1];
  }
  else
  {
    double MidX = CGRectGetMidX(*(CGRect *)(v28 + 6));
    double MidY = CGRectGetMidY(*(CGRect *)(v28 + 6));
    id v18 = (void *)MEMORY[0x1E4FAE3A8];
    double v20 = KB::system_uptime(v19);
    id v21 = objc_msgSend(v18, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, *((int *)v36 + 6), MidX, MidY, 12.0, v20);
    [v6 setTouchEvent:v21];
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v35, 8);
}

void __98__TIKeyboardInputManager_TIHardwareKeyboardExperiments__addSynthesizedTouchToInput_keyboardState___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4, double a5, double a6, double a7, double a8)
{
  id v16 = [NSString stringWithUTF8String:a2];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:") & 1) != 0
    || [*(id *)(a1 + 40) isBackspace]
    && [v16 isEqualToString:@"delete"])
  {
    id v15 = *(double **)(*(void *)(a1 + 48) + 8);
    unsigned char v15[6] = a5;
    v15[7] = a6;
    unsigned char v15[8] = a7;
    v15[9] = a8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  int v4 = [v3 hardwareKeyboardMode];

  if (!v4) {
    return 0;
  }
  CFStringRef v5 = [(TIKeyboardInputManager *)self keyboardState];
  char v6 = [v5 autocorrectionEnabled];

  return v6;
}

- (id)shortcutConversionForDocumentState:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager *)self shouldSkipShortcutConversionForDocumentState:v4])
  {
    CFStringRef v5 = 0;
  }
  else
  {
    char v6 = [v4 contextBeforeInput];
    CFStringRef v5 = [(TIKeyboardInputManager *)self shortcutConversionForString:v6 stringStartsInMiddleOfWord:0];
  }

  return v5;
}

- (id)shortcutCompletionsForDocumentState:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager *)self shouldSkipShortcutConversionForDocumentState:v4])
  {
    id v5 = 0;
  }
  else
  {
    char v6 = [v4 contextBeforeInput];
    uint64_t v7 = [(TIKeyboardInputManager *)self shortcutSearchRangeForString:v6];
    if (v8 <= 0x40)
    {
      uint64_t v9 = v7;
      unint64_t v10 = v8;
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __82__TIKeyboardInputManager_ShortcutConversion__shortcutCompletionsForDocumentState___block_invoke;
      uint64_t v19 = &unk_1E6E2E010;
      double v20 = self;
      id v12 = v11;
      id v21 = v12;
      -[TIKeyboardInputManager enumerateWordSuffixesOfString:inRange:usingBlock:](self, "enumerateWordSuffixesOfString:inRange:usingBlock:", v6, v9, v10, &v16);
      char v13 = objc_msgSend(v12, "length", v16, v17, v18, v19, v20);
      if (v13)
      {
        long long v14 = [v12 uppercaseString];
        [v12 appendString:v14];

        char v13 = (void *)[objc_alloc(MEMORY[0x1E4FAE290]) initWithCharactersInString:v12];
      }
      id v5 = v13;
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

void __82__TIKeyboardInputManager_ShortcutConversion__shortcutCompletionsForDocumentState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) externalStringToInternal:a2];
  KB::utf8_string(v3, (uint64_t)v11);

  TIInputManager::single_character_completions_for_shortcut_prefix(*(KB::UserDictionary **)(*(void *)(a1 + 32) + 40), (const KB::String *)v11, (uint64_t)v8);
  if (v8[0])
  {
    id v5 = *(void **)(a1 + 32);
    char v6 = KB::ns_string((KB *)v8, v4);
    uint64_t v7 = [v5 internalStringToExternal:v6];

    [*(id *)(a1 + 40) appendString:v7];
  }
  if (v10 && v9 == 1) {
    free(v10);
  }
  if (v12)
  {
    if (v11[6] == 1) {
      free(v12);
    }
  }
}

- (unint64_t)maximumShortcutLengthAllowed
{
  m_impl = self->m_impl;
  if (m_impl && (v3 = *(uint64_t **)(*(void *)(m_impl[28] + 24) + 24)) != 0 && (uint64_t v4 = *v3) != 0) {
    return *(unsigned int *)(v4 + 88);
  }
  else {
    return 0;
  }
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 0;
}

- (BOOL)supportsNumberKeySelection
{
  return 0;
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  id v4 = a3;

  return v4;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(TIKeyboardInputManager *)self keyboardState];
  int v7 = [v6 longPredictionListEnabled];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FAE308]);
    char v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v5];
    unint64_t v10 = (void *)[v8 initWithTitle:0 candidates:v9];
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return 1;
}

- (id)titleForSortingMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self keyboardState];
  int v6 = [v5 longPredictionListEnabled];

  if (v6) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)sortingMethods
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardState];
  int v3 = [v2 longPredictionListEnabled];

  if (v3) {
    return &unk_1F3FA77C0;
  }
  else {
    return 0;
  }
}

- (id)openingQuotes
{
  openingQuotes = self->_openingQuotes;
  if (!openingQuotes)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FAE3C8]) initWithCharactersInString:@"“‘"];
    id v5 = [(TIKeyboardInputManager *)self smartOptions];
    int v6 = [v5 leftDoubleQuote];
    [v4 addCharactersInString:v6];

    id v7 = [(TIKeyboardInputManager *)self smartOptions];
    id v8 = [v7 leftSingleQuote];
    [v4 addCharactersInString:v8];

    char v9 = self->_openingQuotes;
    self->_openingQuotes = (TICharacterSetDescription *)v4;

    openingQuotes = self->_openingQuotes;
  }

  return openingQuotes;
}

- (id)closingQuotes
{
  closingQuotes = self->_closingQuotes;
  if (!closingQuotes)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FAE3C8]) initWithCharactersInString:@"”’"];
    id v5 = [(TIKeyboardInputManager *)self smartOptions];
    int v6 = [v5 rightDoubleQuote];
    [v4 addCharactersInString:v6];

    id v7 = [(TIKeyboardInputManager *)self smartOptions];
    id v8 = [v7 rightSingleQuote];
    [v4 addCharactersInString:v8];

    char v9 = self->_closingQuotes;
    self->_closingQuotes = (TICharacterSetDescription *)v4;

    closingQuotes = self->_closingQuotes;
  }

  return closingQuotes;
}

- (id)spaceDeletingCharacters
{
  uint64_t v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  int v3 = [v2 spaceDeletingCharacters];

  return v3;
}

- (id)terminatorsPrecedingAutospace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TIKeyboardInputManager_ResultSpecializations__terminatorsPrecedingAutospace__block_invoke;
  block[3] = &unk_1E6E2DE00;
  block[4] = self;
  if (-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::onceToken, block);
  }
  return (id)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::result;
}

void __78__TIKeyboardInputManager_ResultSpecializations__terminatorsPrecedingAutospace__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FAE290]);
  id v6 = [*(id *)(a1 + 32) sentenceDelimitingCharacters];
  int v3 = [v6 stringByAppendingString:@",.:?!]}”’"]);;
  uint64_t v4 = [v2 initWithCharactersInString:v3];
  id v5 = (void *)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::result;
  -[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::_NSRange result = v4;
}

- (id)terminatorsDeletingAutospace
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  int v3 = [v2 terminatorsDeletingAutospace];

  return v3;
}

- (id)terminatorsPreventingAutocorrection
{
  if (-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::onceToken, &__block_literal_global_1106);
  }
  id v2 = (void *)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::result;

  return v2;
}

uint64_t __84__TIKeyboardInputManager_ResultSpecializations__terminatorsPreventingAutocorrection__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE290]), "initWithCharactersInString:", @"@#$%^*_([]\\|");
  uint64_t v1 = -[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::result;
  -[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::_NSRange result = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)nextInputWouldStartSentence
{
  if ([(TIKeyboardInputManager *)self shouldInsertSpaceBeforeInput:0])
  {
    int v3 = [(TIKeyboardInputManager *)self wordSeparator];
    BOOL v4 = [(TIKeyboardInputManager *)self nextInputWouldStartSentenceAfterInput:v3];

    return v4;
  }
  else
  {
    return [(TIKeyboardInputManager *)self nextInputWouldStartSentenceAfterInput:0];
  }
}

- (id)wordSeparator
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  int v3 = [v2 wordSeparator];

  return v3;
}

- (id)replacementForDoubleSpace
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  int v3 = [v2 replacementForDoubleSpace];

  return v3;
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return 0;
}

- (BOOL)suppliesCompletions
{
  return 0;
}

- (id)searchStringForMarkedText
{
  return &stru_1F3F7A998;
}

- (id)shadowTyping
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  m_impl = (char *)self->m_impl;
  if (m_impl)
  {
    KB::String::String((KB::String *)v8, (const KB::String *)(m_impl + 64));
    id v5 = KB::ns_string((KB *)v8, v4);
    id v6 = [(TIKeyboardInputManager *)self internalStringToExternal:v5];

    if (v9 && v8[6] == 1) {
      free(v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)initialCandidateBatchCount
{
  return 0x7FFFFFFFLL;
}

- (unint64_t)initialSelectedIndex
{
  return self->m_initialSelectedIndex;
}

- (id)defaultCandidate
{
  id v3 = objc_alloc(MEMORY[0x1E4FAE318]);
  BOOL v4 = [(TIKeyboardInputManager *)self inputStem];
  id v5 = (void *)[v3 initWithUnchangedInput:v4];

  return v5;
}

- (BOOL)suppressPlaceholderCandidate
{
  return 0;
}

- (unint64_t)autoquoteType
{
  return 2;
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v3 hardwareKeyboardMode])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(TIKeyboardInputManager *)self keyboardState];
    id v6 = [v5 layoutState];
    BOOL v4 = [v6 userInterfaceIdiom] != 2;
  }
  return v4;
}

- (BOOL)commitsAcceptedCandidate
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 0;
}

- (BOOL)usesLiveConversion
{
  return 0;
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return 0;
}

- (BOOL)shouldFixupIncompleteRomaji
{
  return 0;
}

- (double)continuousPathLanguageWeight
{
  id v2 = [(TIKeyboardInputManager *)self config];
  [v2 continuousPathLanguageWeight];
  double v4 = v3;

  return v4;
}

- (BOOL)usesMLTapTyping
{
  if ([(TIKeyboardInputManager *)self userInterfaceIdiom])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    double v4 = [(TIKeyboardInputManager *)self keyboardState];
    if ([v4 hardwareKeyboardMode])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      id v5 = [(TIKeyboardInputManager *)self keyboardState];
      if ([v5 splitKeyboardMode])
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        id v6 = [(TIKeyboardInputManager *)self keyboardState];
        int v3 = [v6 floatingKeyboardMode] ^ 1;
      }
    }
  }
  return v3;
}

- (BOOL)usesContinuousPath
{
  if ([(TIKeyboardInputManager *)self usesCandidateSelection]) {
    return 0;
  }
  double v4 = [(TIKeyboardInputManager *)self config];
  char v5 = [v4 usesContinuousPath];

  return v5;
}

- (BOOL)usesCandidateSelection
{
  return 0;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 0;
}

- (unint64_t)phraseBoundary
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setPhraseBoundaryIfNecessary
{
  if ([(TIKeyboardInputManager *)self supportsSetPhraseBoundary]
    && ![(TIKeyboardInputManager *)self isProgressivelyPathing])
  {
    int v3 = [(TIKeyboardInputManager *)self keyboardState];
    id v7 = [v3 documentState];

    double v4 = v7;
    if (v7)
    {
      uint64_t v5 = [v7 selectedRangeInMarkedText];
      double v4 = v7;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v6 = v5 == [(TIKeyboardInputManager *)self phraseBoundary];
        double v4 = v7;
        if (!v6)
        {
          [(TIKeyboardInputManager *)self setPhraseBoundary:v5];
          double v4 = v7;
        }
      }
    }
  }
}

- (id)candidatesForString:(id)a3
{
  v12[4] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->m_impl
    && (unint64_t)[v4 length] <= 0x40
    && ([v5 _looksLikeURL] & 1) == 0)
  {
    uint64_t v7 = 2 * (u_isupper([v5 _firstLongCharacter]) != 0);
    id v8 = [(TIKeyboardInputManager *)self keyboardState];
    int v9 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", v7, [v8 autocapitalizationType]);

    m_impl = (TIInputManager *)self->m_impl;
    id v11 = [(TIKeyboardInputManager *)self externalStringToInternal:v5];
    KB::utf8_string(v11, (uint64_t)v12);
    TIInputManager::candidates_for_string(m_impl, (const KB::String *)v12, v9);
  }

  return 0;
}

- (id)candidates
{
  int v3 = [(TIKeyboardInputManager *)self keyboardState];
  id v4 = [v3 inputMode];
  uint64_t v5 = +[TIInputMode inputModeWithIdentifier:v4];

  BOOL v6 = [(TIKeyboardInputManagerBase *)self inputMode];
  BOOL v7 = v6 != v5;

  char v8 = [v5 supportsPrediction];
  int v9 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v9 longPredictionListEnabled])
  {
  }
  else
  {

    id v10 = 0;
    if (v6 == v5 || (v8 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v13 = [v12 documentState];
  long long v14 = [(TIKeyboardInputManager *)self shortcutConversionForDocumentState:v13];

  if (v14) {
    [v11 addObject:v14];
  }
  id v15 = [TIAccumulatingCandidateHandler alloc];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __59__TIKeyboardInputManager_ResultSpecializations__candidates__block_invoke;
  id v24 = &unk_1E6E2C138;
  id v16 = v11;
  BOOL v28 = v7;
  char v29 = v8;
  id v25 = v16;
  char v26 = self;
  id v27 = v14;
  id v17 = v14;
  id v18 = [(TIAccumulatingCandidateHandler *)v15 initWithHandlerBlock:&v21];
  [(TIKeyboardInputManager *)self pushCandidateGenerationContextOnStack];
  uint64_t v19 = [(TIKeyboardInputManager *)self keyboardState];
  -[TIKeyboardInputManager generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:](self, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v19, 0, 20, v18);

  [(TIKeyboardInputManager *)self popCandidateGenerationContextFromStack];
  id v10 = v16;

LABEL_8:

  return v10;
}

void __59__TIKeyboardInputManager_ResultSpecializations__candidates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 corrections];
  uint64_t v5 = [v4 autocorrection];

  BOOL v6 = [v3 predictions];
  BOOL v7 = [v3 emojiList];
  if ([v5 isAutocorrection]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  char v8 = [v6 firstObject];
  if (![v8 slotID])
  {
    if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 57))
    {
      int v9 = [*(id *)(a1 + 40) inputMode];
      int v10 = [v9 isSiriMode];

      if (!v10)
      {
        if (!v7) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else
    {
    }
    double v20 = *(void **)(a1 + 32);
    char v8 = [*(id *)(a1 + 40) defaultCandidate];
    [v20 addObject:v8];
  }

  if (v7) {
LABEL_8:
  }
    [*(id *)(a1 + 32) addObjectsFromArray:v7];
LABEL_9:
  if (v6)
  {
    uint64_t v21 = v7;
    uint64_t v22 = v5;
    id v23 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v17 = [v16 candidate];
          id v18 = [*(id *)(a1 + 48) candidate];
          char v19 = [v17 isEqualToString:v18];

          if ((v19 & 1) == 0) {
            [*(id *)(a1 + 32) addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    uint64_t v5 = v22;
    id v3 = v23;
    BOOL v7 = v21;
  }
}

- (id)autocorrectionListWithCandidateCount:(unint64_t)a3
{
  v85[1] = *MEMORY[0x1E4F143B8];
  if (!self->m_impl)
  {
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if ([(TIKeyboardInputManager *)self canGenerateCompletionCandidates])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke;
    aBlock[3] = &unk_1E6E2C110;
    void aBlock[4] = self;
    uint64_t v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) == 0)
    {
      uint64_t v6 = [(TIKeyboardInputManager *)self continuousPathCandidates:a3];
LABEL_12:
      id v9 = (id)v6;
      BOOL v7 = v5[2](v5, v6);
LABEL_13:

LABEL_14:
      goto LABEL_15;
    }
    if ([(TIKeyboardInputManager *)self shouldGenerateSuggestionsForSelectedText]|| [(TIKeyboardInputManager *)self doesSelectedTextGenerateEmojiCandidates])
    {
      uint64_t v6 = [(TIKeyboardInputManager *)self autocorrectionListForSelectedText];
      goto LABEL_12;
    }
    if ([(TIKeyboardInputManager *)self shouldGeneratePredictionsForCurrentContext])
    {
      uint64_t v6 = [(TIKeyboardInputManager *)self autocorrectionListForEmptyInputWithDesiredCandidateCount:a3];
      goto LABEL_12;
    }
    if ([(TIKeyboardInputManager *)self inputCount] > 0x40)
    {
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (TIAdaptationAutocorrectionRejectionV2Enabled())
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v12 = [(TIKeyboardInputManager *)self rejectedAutocorrections];
      uint64_t v13 = [(TIKeyboardInputManager *)self inputString];
      uint64_t v14 = [v12 objectForKey:v13];
      BOOL v11 = v14 != 0;
    }
    unsigned int v15 = [(TIKeyboardInputManager *)self inputCount];
    if (v15 == [(TIKeyboardInputManager *)self inputIndex]
      && [(TIKeyboardInputManager *)self inputIndex]
      && !(*(unsigned int (**)(void))(**((void **)self->m_impl + 23) + 232))(*((void *)self->m_impl
                                                                                              + 23)))
    {
      id v16 = [(TIKeyboardInputManager *)self inputString];
      BOOL v7 = [(TIKeyboardInputManager *)self cachedAutocorrectionListResponseFor:v16];

      if (v7) {
        int v17 = v11;
      }
      else {
        int v17 = 1;
      }
      if (v17 != 1) {
        goto LABEL_14;
      }
    }
    if ([(TIKeyboardInputManager *)self _hasSupplementalPrefix])
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
      char v19 = [(TIKeyboardInputManager *)self _supplementalCompletionCandidates:a3];
      double v20 = (void *)[v18 initWithArray:v19];

      if (!v11)
      {
        uint64_t v21 = [(TIKeyboardInputManager *)self supplementalAutocorrectionCandidates];
LABEL_39:
        uint64_t v22 = v21;
        id v23 = [v21 autocorrection];
LABEL_40:
        long long v24 = [v22 alternateCorrections];
        if ([v22 autocorrectionBlocked] && objc_msgSend(v24, "count"))
        {
          [v24 objectAtIndexedSubscript:0];
          v26 = long long v25 = v24;
          v85[0] = v26;
          long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
          [v27 arrayByAddingObjectsFromArray:v20];
          v29 = unint64_t v28 = a3;

          long long v24 = objc_msgSend(v25, "subarrayWithRange:", 1, objc_msgSend(v25, "count") - 1);

          double v20 = (void *)v29;
          a3 = v28;
        }
        long long v71 = v24;
        uint64_t v30 = [(TIKeyboardInputManager *)self typedStringForEmptyAutocorrection];
        if (!v23)
        {
          id v23 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:v30];
        }
        uint64_t v70 = (void *)v30;
        BOOL v31 = [(TIKeyboardInputManager *)self emojiCandidateGenerator];
        char v32 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v69 = [v31 emojiReplacementCandidatesForKeyboardState:v32];

        long long v74 = self;
        int64x2_t v75 = v5;
        long long v72 = v22;
        if ([v23 isSupplementalItemCandidate]
          && ![(TIKeyboardInputManager *)self _hasSupplementalPrefix])
        {

          id v23 = 0;
        }
        unint64_t v73 = a3;
        long long v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
        id v9 = v23;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        obuint64_t j = v20;
        uint64_t v34 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v80;
          uint64_t v37 = &stru_1F3F7A998;
          uint64_t v77 = v33;
          do
          {
            uint64_t v38 = 0;
            do
            {
              if (*(void *)v80 != v36) {
                objc_enumerationMutation(obj);
              }
              objc_super v39 = *(void **)(*((void *)&v79 + 1) + 8 * v38);
              uint64_t v40 = [v39 candidate];
              char v41 = [v40 isEqualToString:v37];

              if ((v41 & 1) == 0)
              {
                v78[0] = MEMORY[0x1E4F143A8];
                v78[1] = 3221225472;
                v78[2] = __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke_2;
                v78[3] = &unk_1E6E2C7B0;
                v78[4] = v39;
                id v42 = _Block_copy(v78);
                uint64_t v43 = [v33 indexOfObjectPassingTest:v42];
                if (v43 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v44 = v37;
                  BOOL v45 = [v39 candidate];
                  uint64_t v46 = [v9 candidate];
                  BOOL v47 = v9;
                  int v48 = [v45 isEqualToString:v46];

                  if (v48
                    && (int v49 = [v39 isSupplementalItemCandidate],
                        v49 == [v47 isSupplementalItemCandidate]))
                  {
                    objc_opt_class();
                    id v9 = v47;
                    uint64_t v37 = v44;
                    if (objc_opt_isKindOfClass())
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v56 = v9;
                        id v57 = v39;
                        id v58 = [v56 lexiconLocale];

                        if (!v58)
                        {
                          id v59 = [v57 lexiconLocale];
                          [v56 setLexiconLocale:v59];
                        }
                      }
                    }
                  }
                  else
                  {
                    id v9 = v47;
                    uint64_t v37 = v44;
                    if ([v39 isSupplementalItemCandidate]) {
                      goto LABEL_60;
                    }
                    if (v39)
                    {
                      id v50 = v39;
                      id v51 = [v50 candidate];
                      [v50 input];
                      v53 = id v52 = v9;

                      LOBYTE(v50) = [v51 isEqualToString:v53];
                      id v9 = v52;
                      uint64_t v37 = v44;

                      if ((v50 & 1) == 0) {
LABEL_60:
                      }
                        [v77 addObject:v39];
                    }
                  }
                }
                else
                {
                  uint64_t v54 = v43;
                  uint64_t v55 = [v33 objectAtIndexedSubscript:v43];
                  if ([v39 isSupplementalItemCandidate]
                    && ([v55 isSupplementalItemCandidate] & 1) == 0)
                  {
                    [v33 setObject:v39 atIndexedSubscript:v54];
                  }
                }
                long long v33 = v77;
              }
              ++v38;
            }
            while (v35 != v38);
            uint64_t v60 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
            uint64_t v35 = v60;
          }
          while (v60);
        }

        if ([v33 count] <= v73)
        {
          id v61 = v33;
        }
        else
        {
          id v61 = [v33 subarrayWithRange:0];
        }
        id v62 = v61;
        uint64_t v5 = v75;
        int v63 = [(TIKeyboardInputManager *)v74 extendedAutocorrection:v9 spanningInputsForCandidates:v61 emojis:v69];
        long long v64 = [(TIKeyboardInputManager *)v74 autocorrectionForCurrentStem];
        long long v65 = [v63 candidate];
        long long v66 = [(TIKeyboardInputManager *)v74 currentWordStem];
        [v64 setObject:v65 forKey:v66];

        long long v67 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v63 alternateCorrections:v71];
        std::string v68 = [MEMORY[0x1E4FAE278] listWithCorrections:v67 predictions:v62 emojiList:v69];
        BOOL v7 = v5[2](v5, (uint64_t)v68);

        goto LABEL_13;
      }
    }
    else
    {
      double v20 = -[TIKeyboardInputManager completionCandidates:](self, "completionCandidates:", a3 - [0 count]);
      if (!v11)
      {
        uint64_t v21 = [(TIKeyboardInputManager *)self autocorrectionCandidates];
        goto LABEL_39;
      }
    }
    uint64_t v22 = 0;
    id v23 = 0;
    goto LABEL_40;
  }
  char v8 = [(TIKeyboardInputManager *)self supplementalAutocorrectionCandidates];
  if (!v8)
  {
    char v8 = [(TIKeyboardInputManager *)self autocorrectionCandidates];
  }
  BOOL v7 = [MEMORY[0x1E4FAE278] listWithCorrections:v8];

LABEL_15:

  return v7;
}

id __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) recordSuggestedAutocorrectionList:v3];

  return v3;
}

uint64_t __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 candidate];
  id v4 = [*(id *)(a1 + 32) candidate];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)canGenerateCompletionCandidates
{
  if (TITransientLexiconManagerGetActiveSupplementalLexiconWords()) {
    return 1;
  }
  id v4 = [(TIKeyboardInputManager *)self config];
  if ([v4 usesWordNgramModel])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    char v3 = [v5 supportsMultilingualKeyboard];
  }
  return v3;
}

- (id)autocorrectionList
{
  char v3 = [(TIKeyboardInputManager *)self autocorrectionListWithCandidateCount:3];
  [(TIKeyboardInputManager *)self setLastAutocorrectionList:v3];

  return v3;
}

- (void)transferErrorCorrectionFlagsToInputCandidate:(void *)a3
{
  if (*(void *)a3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = *((void *)a3 + 1);
    uint64_t v6 = 240 * *(void *)a3;
    do
    {
      int v7 = *(unsigned __int16 *)(v5 + 4);
      if (!*(_WORD *)(v5 + 4))
      {
        KB::String::compute_length((unsigned __int16 *)v5);
        int v7 = *(unsigned __int16 *)(v5 + 4);
      }
      unsigned int v8 = v4 + v7;
      if (TIInputManager::is_input_hit_test_corrected((TIInputManager *)self->m_impl, v4, v4 + v7)) {
        *(void *)(v5 + 152) = 64;
      }
      v5 += 240;
      unsigned int v4 = v8;
      v6 -= 240;
    }
    while (v6);
  }
}

- (id)autocorrectionCandidates
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if (!self->m_impl) {
    goto LABEL_9;
  }
  char v3 = [(TIKeyboardInputManager *)self keyboardState];
  if (![v3 autocorrectionEnabled]
    || ![(TIKeyboardInputManager *)self allowsAutocorrectionForCurrentInputString])
  {

    goto LABEL_9;
  }
  unsigned int v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  uint64_t v5 = [v4 originalIdentifier];
  char ShouldDisableAutocorrection = TIKeyboardShouldDisableAutocorrection();

  if (ShouldDisableAutocorrection) {
    goto LABEL_9;
  }
  int v7 = [(TIKeyboardInputManager *)self keyboardState];
  if (![v7 hardwareKeyboardMode])
  {

    goto LABEL_14;
  }
  BOOL v8 = [(TIKeyboardInputManager *)self isHardwareKeyboardAutocorrectionEnabled];

  if (!v8)
  {
LABEL_9:
    int v10 = 0;
    goto LABEL_10;
  }
LABEL_14:
  m_impl = self->m_impl;
  int v13 = m_impl[24];
  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = KB::ns_string((KB *)(*((void *)m_impl + 1) + 40 * (v13 - 1)), v9);
  if (![(TIKeyboardInputManager *)self stringEndsWord:v14]
    && (![(TIKeyboardInputManager *)self isEditingExistingWord]
     || [(TIKeyboardInputManager *)self _hasSupplementalPrefix]))
  {
    unsigned int v15 = [(TIKeyboardInputManager *)self currentWordStem];
    id v16 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v15];
    int v17 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    char v18 = [v17 allowsAutocorrectionOfValidWords];

    if ((v18 & 1) == 0)
    {
      char v19 = (TIInputManager *)self->m_impl;
      KB::utf8_string(v16, (uint64_t)&v95);
      KB::utf8_string(v15, (uint64_t)buf);
      char v20 = TIInputManager::dictionary_contains_word(v19, (const KB::String *)&v95, (const KB::String *)buf, 0);
      if (*(void *)&buf[8] && buf[6] == 1) {
        free(*(void **)&buf[8]);
      }
      if (v96 && BYTE6(v95) == 1) {
        free(v96);
      }
      if (v20)
      {
        int v10 = 0;
LABEL_121:

        goto LABEL_122;
      }
    }
    long long v74 = v16;
    TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v101);
    uint64_t v22 = KB::ns_string((KB *)v101, v21);
    id v23 = [(TIKeyboardInputManager *)self internalStringToExternal:v22 ignoreCompositionDisabled:1];

    long long v24 = (const KB::String *)v99;
    unint64_t v73 = v23;
    KB::utf8_string(v23, (uint64_t)v99);
    long long v25 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
    if ([v25 canConvertExternalToExternal])
    {
      long long v26 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
      if ([v26 shouldConvertCandidateToExternal]) {
        long long v24 = (const KB::String *)v101;
      }
    }
    KB::Candidate::Candidate((KB::Candidate *)&v95, v24, 0);
    uint64_t v27 = [(TIKeyboardInputManager *)self shiftContext];
    unint64_t v28 = [(TIKeyboardInputManager *)self phraseCandidateCompletedByWord:v99 allowNoSuggest:1 forAutocorrection:1 shiftContext:v27];
    [v28 setConfidence:0];
    uint64_t v29 = [(TIKeyboardInputManager *)self keyboardState];
    int v30 = [v29 hardwareKeyboardMode];

    if (!v28 && v30)
    {
      BOOL v31 = (TIInputManager *)self->m_impl;
      KB::utf8_string(v16, (uint64_t)buf);
      KB::utf8_string(v15, (uint64_t)v75);
      char v32 = TIInputManager::dictionary_contains_word(v31, (const KB::String *)buf, (const KB::String *)v75, 1);
      if (v76 && v75[6] == 1) {
        free(v76);
      }
      if (*(void *)&buf[8] && buf[6] == 1) {
        free(*(void **)&buf[8]);
      }
      if (v32)
      {
        int v10 = 0;
        long long v33 = v73;
LABEL_115:
        KB::Candidate::~Candidate((KB::Candidate *)&v95);
        if (v100 && v99[6] == 1) {
          free(v100);
        }

        if (v102 && v101[6] == 1) {
          free(v102);
        }
        goto LABEL_121;
      }
    }
    kdebug_trace();
    kac_get_log();
    uint64_t v34 = (id)objc_claimAutoreleasedReturnValue();
    ptr = (void *)((unint64_t)self ^ 0x14);
    os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v34, (const void *)((unint64_t)self ^ 0x14));
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v36 = v35;
      if (os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "kbdManager.generateOnlyAutocorrections", (const char *)&unk_1E41704BE, buf, 2u);
      }
    }

    if (v28)
    {
      uint64_t v38 = 0;
      uint64_t v87 = 0x10000000000000;
      v92[0] = 0;
      char v94 = 0;
      *(_OWORD *)buf = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      __int16 v88 = 0;
      char v89 = 0;
      uint64_t v90 = 0;
      char v91 = 0;
    }
    else
    {
      objc_super v39 = v15;
      [(TIKeyboardInputManager *)self transferErrorCorrectionFlagsToInputCandidate:&v95];
      v92[0] = 0;
      char v94 = 0;
      uint64_t v87 = 0x10000000000000;
      *(_OWORD *)buf = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      __int16 v88 = 0;
      char v89 = 0;
      uint64_t v90 = 0;
      char v91 = 0;
      (*(void (**)(uint8_t *__return_ptr))(*(void *)self->m_impl + 16))(v75);
      KB::CandidateCollection::operator=((uint64_t)buf, (uint64_t)v75);
      KB::String::operator=((uint64_t)&v87 + 4, (KB::String *)v80);
      std::tuple<KB::CandidateCollection,KB::String>::~tuple((uint64_t)v75);
      KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v75, (const KB::Candidate **)buf);
      KB::String::String((KB::String *)v80, (const KB::String *)((char *)&v87 + 4));
      if (*(void **)v75 == v76 && v77 != v78)
      {
        int v63 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
        int v64 = [v63 canConvertExternalToExternal];

        if (v64)
        {
          KB::Candidate::operator=((uint64_t)&v95, v77);
          std::optional<KB::String>::operator=[abi:nn180100]<KB::String,void>((uint64_t)v92, (KB::String *)v80);
        }
      }
      if (v76 != *(void **)v75)
      {
        KB::Candidate::operator=((uint64_t)&v95, *(uint64_t *)v75);
        std::optional<KB::String>::operator=[abi:nn180100]<KB::String,void>((uint64_t)v92, (KB::String *)v80);
      }
      if (v79) {
        char v98 = 1;
      }
      std::tuple<KB::CandidateCollection,KB::String>::~tuple((uint64_t)v75);
      if (!v97[0]) {
        KB::Candidate::compute_string((KB::Candidate *)&v95);
      }
      unsigned int v15 = v39;
      if (KB::String::equal((KB::String *)v97, v24, 0)) {
        goto LABEL_64;
      }
      KB::Candidate::capitalized_string((KB::Candidate *)&v95, (uint64_t)v75);
      unint64_t v28 = [(TIKeyboardInputManager *)self phraseCandidateCompletedByWord:v75 allowNoSuggest:0 forAutocorrection:1 shiftContext:v27];
      if (v76 && v75[6] == 1) {
        free(v76);
      }
      [v28 setConfidence:2];
      if (!v28)
      {
LABEL_64:
        if (v95)
        {
          uint64_t v40 = 240 * v95 - 240;
          char v41 = (int *)((char *)v96 + 104);
          do
          {
            int v43 = *v41;
            v41 += 60;
            char v42 = v43;
            if ((v43 & 0x10) != 0) {
              break;
            }
            uint64_t v44 = v40;
            v40 -= 240;
          }
          while (v44);
          if ((v42 & 0x10) != 0)
          {
            kdebug_trace();
            kac_get_log();
            BOOL v45 = (id)objc_claimAutoreleasedReturnValue();
            os_signpost_id_t v46 = os_signpost_id_make_with_pointer(v45, ptr);
            if (v46 - 1 > 0xFFFFFFFFFFFFFFFDLL)
            {
              int v10 = 0;
              int v48 = v45;
              long long v33 = v73;
            }
            else
            {
              os_signpost_id_t v47 = v46;
              long long v33 = v73;
              if (os_signpost_enabled(v45))
              {
                *(_WORD *)int64x2_t v75 = 0;
                _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v45, OS_SIGNPOST_INTERVAL_END, v47, "kbdManager.generateOnlyAutocorrections", (const char *)&unk_1E41704BE, v75, 2u);
              }
              int v10 = 0;
              int v48 = v45;
            }
            goto LABEL_108;
          }
        }
        unint64_t v28 = 0;
        uint64_t v38 = 1;
      }
      else
      {
        uint64_t v38 = 0;
      }
    }
    long long v71 = v14;
    if (v94)
    {
      int v49 = KB::ns_string((KB *)v92, v37);
      id v50 = v49;
      if (v94)
      {
        id v50 = v49;
        BOOL v45 = v50;
        goto LABEL_77;
      }
    }
    else
    {
      id v50 = 0;
    }
    TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v75);
    BOOL v45 = KB::ns_string((KB *)v75, v51);
    if (v76 && v75[6] == 1) {
      free(v76);
    }
LABEL_77:
    id v52 = [(TIKeyboardInputManager *)self internalStringToExternal:v45 ignoreCompositionDisabled:1];
    if ((v95 & 0xFFFFFFFE) != 0) {
      int v53 = v38;
    }
    else {
      int v53 = 0;
    }
    uint64_t v69 = v50;
    uint64_t v70 = v15;
    if (v53 == 1 && !-[TIKeyboardInputManager _canSuggestPhraseCandidate:withStem:](self, (KB::Candidate *)&v95, v52))
    {
      kdebug_trace();
      kac_get_log();
      uint64_t v54 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v61 = os_signpost_id_make_with_pointer(v54, ptr);
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v62 = v61;
        long long v33 = v73;
        if (os_signpost_enabled(v54))
        {
          *(_WORD *)int64x2_t v75 = 0;
          _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v54, OS_SIGNPOST_INTERVAL_END, v62, "kbdManager.generateOnlyAutocorrections", (const char *)&unk_1E41704BE, v75, 2u);
        }
        int v10 = 0;
        uint64_t v55 = v54;
        goto LABEL_107;
      }
      int v10 = 0;
      uint64_t v55 = v54;
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA48] array];
      if (v38)
      {
        if (v95)
        {
          uint64_t v55 = [(TIKeyboardInputManager *)self autocorrectionCandidateForInput:v52 rawInput:v45 withCandidate:&v95];
          [v55 setConfidence:2];
          uint64_t v38 = [(TIKeyboardInputManager *)self shouldBlockAutocorrection:v55];
          if (v38)
          {
            [v54 addObject:v55];

            uint64_t v55 = 0;
          }
          unint64_t v56 = *((void *)&v82 + 1);
          if (*((void *)&v82 + 1) < (unint64_t)v83)
          {
            unsigned int v68 = v38;
            do
            {
              id v57 = [(TIKeyboardInputManager *)self autocorrectionCandidateForInput:v52 rawInput:v45 withCandidate:v56];
              [v57 setConfidence:2];
              if (v55)
              {
                id v58 = [v55 input];
                id v59 = [v57 input];
                int v60 = [v58 isEqualToString:v59];

                if (v60) {
                  [v54 addObject:v57];
                }
              }

              v56 += 1000;
            }
            while (v56 < (unint64_t)v83);
            uint64_t v38 = v68;
          }
        }
        else
        {
          uint64_t v55 = 0;
          uint64_t v38 = 0;
        }
      }
      else
      {
        uint64_t v55 = [(TIKeyboardInputManager *)self checkRejectionHistory:v28];
      }
      int v10 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v55 alternateCorrections:v54 autocorrectionBlocked:v38];
      kdebug_trace();
      kac_get_log();
      long long v65 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v66 = os_signpost_id_make_with_pointer(v65, ptr);
      if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v67 = v66;
        if (os_signpost_enabled(v65))
        {
          *(_WORD *)int64x2_t v75 = 0;
          _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v65, OS_SIGNPOST_INTERVAL_END, v67, "kbdManager.generateOnlyAutocorrections", (const char *)&unk_1E41704BE, v75, 2u);
        }
      }
    }
    long long v33 = v73;
LABEL_107:

    unsigned int v15 = v70;
    uint64_t v14 = v71;
    int v48 = v69;
LABEL_108:

    if (v90 && v89 == 1) {
      free(v90);
    }
    *(void *)int64x2_t v75 = (char *)&v85 + 8;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
    *(void *)int64x2_t v75 = &v84;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
    *(void *)int64x2_t v75 = (char *)&v82 + 8;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
    *(void *)int64x2_t v75 = buf;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
    id v16 = v74;
    if (v94 && v93 && v92[6] == 1) {
      free(v93);
    }
    goto LABEL_115;
  }
  int v10 = 0;
LABEL_122:

LABEL_10:

  return v10;
}

- (id)autocorrection
{
  id v2 = [(TIKeyboardInputManager *)self autocorrectionCandidates];
  char v3 = [v2 autocorrection];

  return v3;
}

- (id)supplementalAutocorrectionCandidates
{
  char v3 = [(TIKeyboardInputManager *)self keyboardState];
  if (([v3 canSuggestSupplementalItemsForCurrentSelection] & 1) == 0)
  {

LABEL_9:
    int v10 = 0;
    goto LABEL_10;
  }
  unsigned int v4 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v5 = [v4 supplementalLexiconIdentifier];

  if (!v5 || ![(TIKeyboardInputManager *)self _hasSupplementalPrefix]) {
    goto LABEL_9;
  }
  int v6 = KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix;
  if (!KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix) {
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
  }
  int v7 = [(TIKeyboardInputManager *)self autocorrection];
  BOOL v8 = [v7 supplementalItemIdentifiers];
  uint64_t v9 = [v8 count];

  if (v9 == 1) {
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v7 alternateCorrections:0];
  }
  else {
    int v10 = 0;
  }

  if (!v6) {
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;
  }
LABEL_10:

  return v10;
}

- (id)supplementalAutocorrection
{
  id v2 = [(TIKeyboardInputManager *)self supplementalAutocorrectionCandidates];
  char v3 = [v2 autocorrection];

  return v3;
}

- (id)_supplementalCompletionCandidates:(unint64_t)a3
{
  uint64_t v5 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v5 canSuggestSupplementalItemsForCurrentSelection])
  {
    int v6 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v7 = [v6 supplementalLexiconIdentifier];

    if (v7)
    {
      BOOL v8 = [(TIKeyboardInputManager *)self _hasSupplementalPrefix];
      if (KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix || !v8)
      {
        uint64_t v9 = [(TIKeyboardInputManager *)self completionCandidates:a3];
      }
      else
      {
        KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
        uint64_t v9 = [(TIKeyboardInputManager *)self completionCandidates:a3];
        KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:

  return v9;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__11289;
  uint64_t v12 = __Block_byref_object_dispose__11290;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __132__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput___block_invoke;
  void v7[3] = &unk_1E6E2C938;
  v7[4] = &v8;
  [(TIKeyboardInputManager *)self generateAndRenderProactiveSuggestionsWithTriggers:a3 withAdditionalPredictions:a4 withInput:a5 async:0 completionHandler:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __132__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput___block_invoke(uint64_t a1, void *a2)
{
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5 async:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  v100[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void))a7;
  uint64_t v14 = [(TIKeyboardInputManager *)self keyboardState];
  LODWORD(a4) = [v14 isScreenLocked];

  if (!a4)
  {
    BOOL v91 = v8;
    unsigned int v15 = [(TIKeyboardInputManager *)self keyboardState];
    id v16 = [v15 documentState];

    int v17 = [v16 contextBeforeInput];
    uint64_t v96 = v16;
    char v18 = [v16 contextAfterInput];
    char v98 = +[TIProactiveQuickTypeManager sharedInstance];
    uint64_t v97 = v17;
    if ([v17 length])
    {
      char v19 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      int v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v17, "length") - 1));

      int v21 = v20 ^ 1;
    }
    else
    {
      int v21 = 1;
    }
    if ([v18 length])
    {
      uint64_t v22 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      int v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v18, "characterAtIndex:", 0));

      int v24 = v23 ^ 1;
    }
    else
    {
      int v24 = 0;
    }
    uint64_t v95 = v18;
    if ((v21 | v24))
    {
      BOOL v25 = 1;
    }
    else
    {
      long long v26 = [(TIKeyboardInputManager *)self inputStem];
      BOOL v25 = [v26 length] == 0;
    }
    uint64_t v27 = [(TIKeyboardInputManager *)self lastContinuousPathAutocorrection];
    unint64_t v28 = [v27 corrections];
    uint64_t v29 = [v28 autocorrection];
    int v30 = [v29 candidate];
    BOOL v31 = [(TIKeyboardInputManager *)self inputStem];
    int v93 = [v30 hasSuffix:v31];

    char v32 = v98;
    if (([v98 usePQT2Flow] & 1) == 0
      && (([v98 isAutoCompleteEnabled] ^ 1 | v25 | v93) & 1) == 0)
    {
      long long v33 = [(TIKeyboardInputManager *)self keyboardState];
      char v34 = [v33 needContactAutofill];

      if ((v34 & 1) == 0)
      {
        os_signpost_id_t v47 = [(TIKeyboardInputManager *)self keyboardState];
        [(TIKeyboardInputManager *)self trackProactiveMetrics:0 keyboardState:v47];

        char v94 = +[TIAppAutofillManager sharedInstance];
        int v48 = [v94 secureCandidateRenderer];
        int v49 = [(TIKeyboardInputManager *)self keyboardState];
        id v50 = [v49 secureCandidateRenderTraits];
        id v51 = [(TIKeyboardInputManager *)self keyboardState];
        id v52 = [v51 textInputTraits];
        [v52 textContentType];
        int v53 = v13;
        v55 = id v54 = v12;
        unint64_t v56 = v97;
        [v98 generateAndRenderProactiveSuggestionsWithInput:v97 withSecureCandidateRenderer:v48 withRenderTraits:v50 textContentType:v55 async:v91 completion:v53];

        id v12 = v54;
        id v13 = v53;

        char v32 = v98;
LABEL_35:

        goto LABEL_36;
      }
    }
    if ([v98 isEnabled])
    {
      if ([v98 usePQT2Flow])
      {
LABEL_20:
        objc_super v39 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v40 = [v39 supportedPayloadIds];
        uint64_t v41 = [v40 count];

        if (v41)
        {
          char v42 = (void *)MEMORY[0x1E4F1CAD0];
          int v43 = [(TIKeyboardInputManager *)self keyboardState];
          uint64_t v44 = [v43 supportedPayloadIds];
          uint64_t v90 = [v42 setWithArray:v44];
        }
        else
        {
          BOOL v45 = [(TIKeyboardInputManager *)self keyboardState];
          int v46 = [v45 canSendCurrentLocation];

          if (v46)
          {
            uint64_t v90 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.messages.currentLocation"];
          }
          else
          {
            uint64_t v90 = 0;
          }
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke_2;
        aBlock[3] = &unk_1E6E2C1A8;
        void aBlock[4] = self;
        os_signpost_id_t v62 = _Block_copy(aBlock);
        int v63 = [(TIKeyboardInputManager *)self keyboardState];
        int v88 = [v63 shiftState];

        int v64 = [(TIKeyboardInputManager *)self keyboardState];
        long long v65 = [v64 responseContext];

        id v89 = v11;
        id v87 = v12;
        if (v65)
        {
          os_signpost_id_t v66 = [(TIKeyboardInputManager *)self keyboardState];
          os_signpost_id_t v67 = [v66 responseContext];
          v100[0] = v67;
          unsigned int v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:1];
          BOOL v69 = [(TIKeyboardInputManager *)self suggestionBlocklistMatchesStrings:v68];
        }
        else
        {
          BOOL v69 = 0;
        }
        BOOL v70 = v91;
        uint64_t v71 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v92 = +[TIAppAutofillManager sharedInstance];
        long long v86 = [v92 secureCandidateRenderer];
        long long v85 = [(TIKeyboardInputManager *)self keyboardState];
        long long v84 = [v85 secureCandidateRenderTraits];
        long long v83 = [v97 stringByAppendingString:@" "];
        long long v82 = [(TIKeyboardInputManager *)self keyboardState];
        long long v72 = [v82 recipientIdentifier];
        long long v81 = [(TIKeyboardInputManager *)self keyboardState];
        unint64_t v73 = [v81 clientIdentifier];
        long long v80 = [(TIKeyboardInputManagerBase *)self inputMode];
        long long v74 = [v80 languageWithRegion];
        if (v93) {
          BOOL v75 = [(TIKeyboardInputManager *)self shouldInsertSpaceBeforePredictions];
        }
        else {
          BOOL v75 = 0;
        }
        LOBYTE(v78) = v70;
        BYTE1(v77) = v69;
        LOBYTE(v77) = v75;
        BYTE2(v77) = v88 != 2;
        char v32 = v98;
        char v79 = (void *)v71;
        uint64_t v76 = v71;
        id v12 = v87;
        objc_msgSend(v98, "generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:", v89, v76, v87, v86, v84, v83, v72, v73, v74, v77, v90, v62, v78, v13);

        id v11 = v89;
        goto LABEL_34;
      }
      os_signpost_id_t v35 = [v11 firstObject];
      os_signpost_id_t v36 = [(TIKeyboardInputManager *)self keyboardState];
      [(TIKeyboardInputManager *)self trackProactiveMetrics:v35 keyboardState:v36];

      if ([v11 count])
      {
        if (![(TIKeyboardInputManager *)self enablesProactiveQuickType])
        {
          uint64_t v37 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1256];
          uint64_t v38 = [v11 filteredArrayUsingPredicate:v37];

          id v11 = (id)v38;
        }
        goto LABEL_20;
      }
      id v57 = [(TIKeyboardInputManagerBase *)self inputMode];
      id v58 = [v57 languageWithRegion];
      id v59 = [(TIKeyboardInputManager *)self keyboardState];
      int v60 = [v59 textInputTraits];
      os_signpost_id_t v61 = [v60 textContentType];
      [v98 userActionWithNoNewTriggers:v58 fieldType:v61];

      char v32 = v98;
      v13[2](v13, 0);
    }
LABEL_34:
    unint64_t v56 = v97;
    goto LABEL_35;
  }
  v13[2](v13, 0);
LABEL_36:
}

void __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@\n", a2];
  [v2 logToTypologyRecorderWithString:v3];
}

BOOL __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 triggerSourceType] != 0;
}

- (BOOL)enablesProactiveQuickType
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  unsigned int v4 = [v3 textInputTraits];
  if ([v4 disablePrediction])
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = [(TIKeyboardInputManager *)self keyboardState];
    uint64_t v7 = [v6 textInputTraits];
    BOOL v5 = [v7 autocorrectionType] != 1;
  }
  return v5;
}

- (id)keyEventMap
{
  return 0;
}

- (BOOL)inHardwareKeyboardMode
{
  m_impl = self->m_impl;
  return m_impl && m_impl[689] != 0;
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  m_impl = self->m_impl;
  if (m_impl) {
    m_impl[689] = a3;
  }
}

- (void)setKeyboardEventsLagging:(BOOL)a3
{
  *((unsigned char *)self->m_impl + 693) = a3;
}

- (BOOL)ignoresDeadKeys
{
  return 0;
}

- (BOOL)supportsLearning
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 supportsLearning];

  return v3;
}

- (BOOL)supportsReversionUI
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 supportsReversionUI];

  return v3;
}

- (BOOL)shouldExtendPriorWord
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 shouldExtendPriorWord];

  return v3;
}

- (BOOL)doesComposeText
{
  id v2 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
  char v3 = [v2 doesComposeText];

  return v3;
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  [(TIKeyboardInputManager *)self clearDynamicDictionary];
  [(TIKeyboardInputManager *)self releaseDynamicLanguageModel];
  [(TIKeyboardInputManager *)self releaseAndRemoveRejectionsDatabase];

  LXVulgarWordUsageDatabaseReset();
}

- (void)releaseDynamicLanguageModel
{
  m_impl = self->m_impl;
  if (m_impl)
  {
    unsigned int v4 = (std::__shared_weak_count *)*((void *)m_impl + 30);
    *((void *)m_impl + 29) = 0;
    *((void *)m_impl + 30) = 0;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
    std::allocate_shared[abi:nn180100]<KB::UnigramCandidateRefinery,std::allocator<KB::UnigramCandidateRefinery>,WTF::RefPtr<KB::DictionaryContainer> const&,void>(&v9, *((atomic_uint **)self->m_impl + 28));
    BOOL v5 = self->m_impl;
    int v6 = v10;
    uint64_t v7 = v9;
    BOOL v8 = v10;
    if (v10)
    {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      TIInputManager::set_candidate_refinery((uint64_t)v5, &v7);
      std::__shared_weak_count::__release_shared[abi:nn180100](v6);
      [(TIKeyboardInputManager *)self loadFavoniusTypingModel];
      std::__shared_weak_count::__release_shared[abi:nn180100](v6);
    }
    else
    {
      TIInputManager::set_candidate_refinery((uint64_t)v5, &v7);
      [(TIKeyboardInputManager *)self loadFavoniusTypingModel];
    }
  }
}

+ (void)resetResponseKit
{
  id v2 = +[TIResponseKitManager sharedTIResponseKitManager];
  [v2 resetResponseKit];
}

+ (void)clearRecentsFileForIdentifier:(id)a3
{
  if (a3)
  {
    unsigned int v4 = (void *)MEMORY[0x1E4F28CB8];
    id v5 = a3;
    id v7 = [v4 defaultManager];
    int v6 = [a1 recentsFilePathForIdentifier:v5];

    [v7 removeItemAtPath:v6 error:0];
  }
}

+ (id)recentsFilePathForIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    {
      +[TIKeyboardInputManager(DynamicDictionarySpecializations) recentsFilePathForIdentifier:]::dir = TI_KB_USER_DIRECTORY();
    }
    unsigned int v4 = [(id)+[TIKeyboardInputManager(DynamicDictionarySpecializations) recentsFilePathForIdentifier:]::dir stringByAppendingPathComponent:v3];
    id v5 = [v4 stringByAppendingPathExtension:@"recents"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)removeAllDynamicDictionaries
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  id v3 = [v2 supportedInputModeIdentifiers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = TICanonicalInputModeName();
        uint64_t v9 = (void *)TIInputManagerClassForInputMode();
        if (v9)
        {
          [v9 removeDynamicDictionaryForInputMode:v8];
        }
        else
        {
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          uint64_t v10 = TIOSLogFacility();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [NSString stringWithFormat:@"%s No input manager class for input mode: %@", "+[TIKeyboardInputManager(DynamicDictionarySpecializations) removeAllDynamicDictionaries]", v8];
            *(_DWORD *)buf = 138412290;
            int v17 = v11;
            _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

+ (void)removeDynamicDictionaryForInputMode:(id)a3
{
  id v3 = [a1 dynamicDictionaryFilePathForInputMode:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    if ([v4 fileExistsAtPath:v3])
    {
      uint64_t v5 = 0;
      [v4 removeItemAtPath:v3 error:&v5];
    }
  }
}

+ (id)dynamicDictionaryFilePathForInputMode:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([v4 isEqualToString:@"en_US"])
    {
      uint64_t v5 = @"dynamic-text.dat";
    }
    else
    {
      uint64_t v7 = TIInputModeGetLanguageWithRegion();
      uint64_t v5 = [v7 stringByAppendingString:@"-dynamic-text.dat"];
    }
    BOOL v8 = [a1 keyboardUserDirectory];
    uint64_t v6 = [v8 stringByAppendingPathComponent:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)userDictionaryWordKeyPairsFilePath
{
  id v2 = [a1 keyboardUserDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"UserDictionaryWordKeyPairs.plist"];

  return v3;
}

+ (id)vulgarWordUsageDatabaseFileName
{
  id v2 = +[TIKeyboardInputManager keyboardUserDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"VulgarWordUsage.db"];

  return v3;
}

+ (id)keyboardUserDirectory
{
  id v2 = TI_KB_USER_DIRECTORY();
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)setRejectedAutocorrection:(id)a3 forInput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInserted];
  [v8 setObject:v6 forKey:v7];

  id v9 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInsertedInverse];
  [v9 setObject:v7 forKey:v6];
}

- (void)dynamicResourceDirectorySet:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"dynamicResourcePath"];

  if (v5 && [v5 length]) {
    [(TIKeyboardInputManager *)self setDynamicResourceDirectory:v5];
  }
  else {
    [(TIKeyboardInputManager *)self removeDynamicResourceDirectory];
  }
}

- (void)setDynamicResourceDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self config];
  int v6 = [v5 usesAdaptation];

  if (v6) {
    [(TIKeyboardInputManager *)self removeDynamicResourceDirectory];
  }
  id v7 = [(TIKeyboardInputManager *)self config];
  [v7 setDynamicResourcePath:v4];

  BOOL v8 = [(TIKeyboardInputManager *)self config];
  [v8 setUsesAdaptation:1];

  m_impl = (char *)self->m_impl;
  if (m_impl)
  {
    uint64_t v10 = *((void *)m_impl + 29);
    if (!v10) {
      goto LABEL_8;
    }
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v4 UTF8String]);
    (*(void (**)(uint64_t, std::string *))(*(void *)v10 + 112))(v10, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    m_impl = (char *)self->m_impl;
    if (m_impl)
    {
LABEL_8:
      id v11 = (CFTypeRef *)(m_impl + 592);
      std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v4 UTF8String]);
      TI::VulgarWordUsageDatabaseWrapper::set_dynamic_resource_directory(v11, &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
}

- (void)removeDynamicResourceDirectory
{
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v4 = m_impl[29];
    if (v4) {
      (*(void (**)(uint64_t, SEL))(*(void *)v4 + 104))(v4, a2);
    }
  }
  id v5 = [(TIKeyboardInputManager *)self config];
  [v5 setUsesAdaptation:0];

  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  int v6 = (CFTypeRef *)self->m_impl;
  if (v6)
  {
    TI::VulgarWordUsageDatabaseWrapper::removeDynamicResourceDirectory(v6 + 74);
  }
}

- (void)clearSoftLearning
{
  id v2 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (v2)
  {
    TI::RejectionsDatabase::soft_clear_memory(v2);
  }
}

- (void)releaseAndRemoveRejectionsDatabase
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_m_rejectionsDatabase = (TI::RejectionsDatabase **)&self->m_rejectionsDatabase;
  value = (sqlite3 **)self->m_rejectionsDatabase.__ptr_.__value_;
  if (value)
  {
    TI::RejectionsDatabase::clear(value);
    TI::RejectionsDatabase::soft_clear_memory(*p_m_rejectionsDatabase);
    uint64_t v4 = (char *)*p_m_rejectionsDatabase + 8;
    if (*((char *)*p_m_rejectionsDatabase + 31) < 0) {
      uint64_t v4 = *(const char **)v4;
    }
    KB::String::String((KB::String *)v8, v4);
    int v6 = KB::ns_string((KB *)v8, v5);
    if (v9)
    {
      if (v8[6] == 1) {
        free(v9);
      }
    }
    std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100](p_m_rejectionsDatabase, 0);
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtPath:v6 error:0];
  }
}

- (void)recordRejectedAutocorrectionForAcceptedText:(id)a3 fromPredictiveInputBar:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 candidate];
  BOOL v8 = [v6 input];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(TIKeyboardInputManager *)self autocorrectionListsSuggestedForCurrentInput];
    id v11 = [v6 input];
    long long v12 = [v10 objectForKey:v11];

    long long v13 = [v6 input];
    long long v14 = [v12 corrections];
    long long v15 = [v14 autocorrection];
  }
  else
  {
    id v16 = [(TIKeyboardInputManager *)self autocorrectionHistory];
    int v17 = [v6 input];
    long long v15 = [v16 objectForKey:v17];

    char v18 = [(TIKeyboardInputManager *)self autocorrectionListsForWordsInDocument];
    uint64_t v19 = [v6 input];
    long long v12 = [v18 objectForKey:v19];

    long long v13 = [v6 candidate];
  }
  if (([v12 hasSupplementalItems] & 1) == 0)
  {
    if (v12 && ([v6 isSupplementalItemCandidate] & 1) == 0)
    {
      int v20 = [(TIKeyboardInputManager *)self revisionListFromAutocorrectionList:v12 afterAcceptingCandidate:v6];
      int v21 = [(TIKeyboardInputManager *)self autocorrectionListsForWordsInDocument];
      uint64_t v22 = [v6 input];
      [v21 setObject:v20 forKey:v22];
    }
    if ([v15 isAutocorrection])
    {
      int v23 = [(TIKeyboardInputManager *)self rejectedAutocorrections];
      [v23 setObject:v15 forKey:v13];

      int v24 = [(TIKeyboardInputManager *)self autocorrectionHistory];
      BOOL v25 = [v15 candidate];
      [v24 removeObjectForKey:v25];
    }
    else if (v4)
    {
      uint64_t v38 = v13;
      objc_super v39 = v15;
      id v40 = v6;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v26 = [v12 corrections];
      uint64_t v27 = [v26 autocorrection];
      unint64_t v28 = [v27 candidate];
      uint64_t v29 = [v28 componentsSeparatedByString:@" "];

      uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v42 != v32) {
              objc_enumerationMutation(v29);
            }
            char v34 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if ([v34 length])
            {
              os_signpost_id_t v35 = [(TIKeyboardInputManager *)self recentPredictiveInputSelections];
              os_signpost_id_t v36 = [v12 corrections];
              uint64_t v37 = [v36 autocorrection];
              [v35 setObject:v37 forKey:v34];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v31);
      }

      long long v15 = v39;
      id v6 = v40;
      long long v13 = v38;
    }
  }
}

- (void)runMaintenanceTask
{
  if (self->m_impl)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;

    uint64_t v6 = *((void *)self->m_impl + 23);
    if (v6) {
      (*(void (**)(uint64_t, double))(*(void *)v6 + 480))(v6, v5 + -2592000.0);
    }
  }
  id v7 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (v7)
  {
    TI::RejectionsDatabase::prune(v7, (sqlite3 *)0x200000);
  }
}

- (BOOL)autocorrectionWasRecentlyRejectedForCurrentInput
{
  id v3 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInsertedInverse];
  double v4 = [(TIKeyboardInputManager *)self currentWordStem];
  double v5 = [v3 objectForKeyedSubscript:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)autocorrectionWasRecentlyRejected:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[TIKeyboardInputManager checkRejectionHistory:](self, "checkRejectionHistory:");
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldBlockAutocorrection:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TIKeyboardInputManager *)self _hasSupplementalPrefix]
    && [v4 isSupplementalItemCandidate])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[TIKeyboardInputManager(Learning) shouldBlockAutocorrection:]";
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Not blocking autocorrection as its a supplemental candidate", buf, 0xCu);
    }
    goto LABEL_29;
  }
  if ((TIAdaptationAutocorrectionRejectionV2Enabled() & 1) == 0)
  {
    uint64_t v5 = [v4 candidate];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      char v7 = [v4 isSupplementalItemCandidate];

      if ((v7 & 1) == 0)
      {
        BOOL v8 = [(TIKeyboardInputManager *)self rejectedAutocorrectionsDisplayedOrInserted];
        int v9 = [v4 candidate];
        uint64_t v10 = [v8 objectForKey:v9];

        if (v10)
        {
          id v11 = [(TIKeyboardInputManager *)self currentWordStem];
          if ([v10 isEqualToString:v11]
            && ([v10 length] != 1
             || ([v4 sourceMask] & 0x8000) == 0 && (objc_msgSend(v4, "sourceMask") & 0x20000) == 0
             || ([v4 usageTrackingMask] & 2) == 0)
            || (unint64_t)[v11 length] >= 2
            && (unint64_t)[v11 length] <= 0x20
            && [v10 _editDistanceFrom:v11] == 1)
          {

LABEL_25:
            goto LABEL_26;
          }
        }
      }
    }
  }
  if (!v4)
  {
LABEL_29:
    BOOL v27 = 0;
    goto LABEL_30;
  }
  long long v12 = [v4 input];
  long long v13 = [v4 candidate];
  BOOL v14 = [(TIKeyboardInputManager *)self blockedByNegativeLearning:v12 correction:v13 ignoreSoft:0];

  if (!v14)
  {
    long long v15 = [(TIKeyboardInputManager *)self revisionHistory];
    uint64_t v10 = [v15 currentWord];

    unint64_t v16 = [v10 length];
    int v17 = [v4 input];
    if (v16 <= [v17 length])
    {
    }
    else
    {
      char v18 = [v4 input];
      int v19 = [v10 hasSuffix:v18];

      if (v19)
      {
        uint64_t v20 = [v10 length];
        int v21 = [v4 input];
        uint64_t v22 = objc_msgSend(v10, "substringToIndex:", v20 - objc_msgSend(v21, "length"));

        int v23 = objc_msgSend(v4, "candidate", v22);
        v29[1] = v23;
        int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        BOOL v25 = [v24 componentsJoinedByString:&stru_1F3F7A998];

        BOOL v26 = [(TIKeyboardInputManager *)self blockedByNegativeLearning:v10 correction:v25 ignoreSoft:0];
        if (v26) {
          goto LABEL_25;
        }
      }
    }

    goto LABEL_29;
  }
LABEL_26:
  BOOL v27 = 1;
LABEL_30:

  return v27;
}

- (id)checkRejectionHistory:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager *)self shouldBlockAutocorrection:v4])
  {

    id v4 = 0;
  }

  return v4;
}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = (KB *)a3;
  id v12 = a4;
  long long v13 = (KB *)a6;
  id v14 = a7;
  long long v15 = [(TIKeyboardInputManager *)self config];
  char v16 = [v15 disableAnalytics];

  if ((v16 & 1) == 0)
  {
    m_impl = (void **)self->m_impl;
    KB::utf8_string(v11, (uint64_t)&v35);
    KB::utf8_string(v13, (uint64_t)&v32);
    KB::utf8_string(v13, (uint64_t)&__p);
    (*(void (**)(void *, std::string *, void **, void **, void))(*m_impl[23] + 88))(m_impl[23], &v35, &v32, &__p, [(TIKeyboardInputManager *)self TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:v14]);
    if (v30 && BYTE6(__p) == 1) {
      free(v30);
    }
    if (v33 && BYTE6(v32) == 1) {
      free(v33);
    }
    if (v35.__r_.__value_.__l.__size_ && v35.__r_.__value_.__s.__data_[6] == 1) {
      free((void *)v35.__r_.__value_.__l.__size_);
    }
  }
  if (TIIsRegisterLearningModeRejection())
  {
    char v18 = [(TIKeyboardInputManager *)self rejectionsDatabase];
    if (v18)
    {
      int v19 = v18;
      int v20 = [v14 isEqualToString:*MEMORY[0x1E4FAEA78]];
      int v21 = @"hard";
      if (v20) {
        int v21 = @"soft";
      }
      unint64_t v28 = v21;
      int v22 = v20 ^ 1;
      int v23 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v11];

      int v24 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v12];

      BOOL v25 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v13];

      id v11 = v23;
      std::string::basic_string[abi:nn180100]<0>(&v35, (char *)[(KB *)v11 UTF8String]);
      id v12 = v24;
      std::string::basic_string[abi:nn180100]<0>(&v32, (char *)[v12 UTF8String]);
      long long v13 = v25;
      std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[(KB *)v13 UTF8String]);
      TIInlineCompletionsNegativeLearning::registerLearning(v19, &v35, v26, (std::string::size_type)&__p, v22);
      if (v31 < 0) {
        operator delete(__p);
      }
      if (v34 < 0) {
        operator delete(v32);
      }
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      BOOL v27 = operator delete(v35.__r_.__value_.__l.__data_);
      }
      [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v27];
    }
  }
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v23 = a3;
  id v9 = a4;
  id v10 = a6;
  if (([v23 isToucanInlineCompletionCandidate] & 1) != 0
    || [v9 isToucanInlineCompletionCandidate])
  {
    id v11 = [v23 candidate];
    id v12 = [v9 candidate];
    long long v13 = [v23 input];
    [(TIKeyboardInputManager *)self registerLearningForCompletion:v11 fullCompletion:v12 context:0 prefix:v13 mode:v10];

LABEL_4:
    goto LABEL_5;
  }
  if (TIIsRegisterLearningModeRejection())
  {
    [(TIKeyboardInputManager *)self acceptInput];
    if (self->m_impl)
    {
      uint64_t v14 = [v23 candidate];
      if (v14)
      {
        long long v15 = (void *)v14;
        char v16 = [v23 candidate];
        int v17 = [v23 input];
        char v18 = [v16 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          if ([v10 isEqualToString:*MEMORY[0x1E4FAEA78]]) {
            uint64_t v19 = 2;
          }
          else {
            uint64_t v19 = 1;
          }
          int v20 = [(TIKeyboardInputManager *)self revisionHistory];
          int v21 = [v23 candidate];
          int v22 = [v23 input];
          [v20 rejectCandidate:v21 forInput:v22 hint:v19];

          id v11 = [v23 candidate];
          id v12 = [v23 input];
          [(TIKeyboardInputManager *)self setRejectedAutocorrection:v11 forInput:v12];
          goto LABEL_4;
        }
      }
    }
  }
LABEL_5:
}

- (void)candidateRejected:(id)a3
{
  id v14 = a3;
  if ([v14 isToucanInlineCompletionCandidate])
  {
    id v4 = [v14 candidate];
    uint64_t v5 = [v14 input];
    [(TIKeyboardInputManager *)self registerLearningForCompletion:v4 fullCompletion:&stru_1F3F7A998 context:0 prefix:v5 mode:*MEMORY[0x1E4FAEA58]];
LABEL_3:

    goto LABEL_7;
  }
  [(TIKeyboardInputManager *)self acceptInput];
  if (self->m_impl)
  {
    uint64_t v6 = [v14 candidate];
    if (v6)
    {
      char v7 = (void *)v6;
      BOOL v8 = [v14 candidate];
      id v9 = [v14 input];
      char v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        id v11 = [(TIKeyboardInputManager *)self revisionHistory];
        id v12 = [v14 candidate];
        long long v13 = [v14 input];
        [v11 rejectCandidate:v12 forInput:v13 hint:1];

        id v4 = [v14 candidate];
        uint64_t v5 = [v14 input];
        [(TIKeyboardInputManager *)self setRejectedAutocorrection:v4 forInput:v5];
        goto LABEL_3;
      }
    }
  }
LABEL_7:
}

- (TITokenID)addWord:(id)a3 contextTokens:(id)a4 surfaceFormPtr:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (TIContextTokens *)a4;
  *a5 = 0;
  m_impl = self->m_impl;
  if (!m_impl
    || !m_impl[29]
    || ![v8 length]
    || ![(TIKeyboardInputManager *)self shouldLearnWord:v8])
  {
    unint64_t v14 = 0;
    LODWORD(v12) = 0;
    goto LABEL_10;
  }
  id v11 = lmContextOrEmpty(v9);
  LODWORD(v12) = (*(uint64_t (**)(void))(**((void **)self->m_impl + 29) + 440))();
  TITokenID v13 = [(TIKeyboardInputManager *)self findTokenIDForWord:v8 contextTokens:v9 tokenLookupMode:12];
  if (HIDWORD(*(unint64_t *)&v13)) {
    LODWORD(v12) = v13.lexicon_id;
  }
  if (![(TIKeyboardInputManager *)self isStringBasedModel])
  {
    uint64_t v16 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)(v11 + 4));
    if (v17)
    {
      if (*(_DWORD *)(v16 + 32 * v17 - 8) == 1)
      {
        char v18 = [(TIKeyboardInputManager *)self keyboardFeatureSpecialization];
        int v19 = [v18 shouldLearnLowercaseAtBeginningOfSentence];

        if (v19)
        {
          int v20 = [(TIKeyboardInputManagerBase *)self inputMode];
          int v21 = [v20 locale];
          int v22 = [v8 capitalizedStringWithLocale:v21];

          if ([v22 isEqualToString:v8])
          {
            id v23 = [(TIKeyboardInputManagerBase *)self inputMode];
            int v24 = [v23 locale];
            BOOL v25 = [v8 lowercaseStringWithLocale:v24];

            *a5 = (id)[v25 copy];
            id v8 = v25;
          }
        }
      }
    }
    uint64_t v26 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v8];
    unint64_t v27 = (*(uint64_t (**)(void))(**((void **)self->m_impl + 29) + 336))();
    unint64_t v14 = HIDWORD(v27);
    if (HIDWORD(v27))
    {
      unint64_t v12 = v27;
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_33;
      }
      uint64_t v29 = TIOSLogFacility();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        if (*a5) {
          uint64_t v30 = (__CFString *)*a5;
        }
        else {
          uint64_t v30 = &stru_1F3F7A998;
        }
        v31 = [NSString stringWithFormat:@"%s TOKEN: add token, word = %@, _NSRange result = %u/%u/%@", "-[TIKeyboardInputManager(Learning) addWord:contextTokens:surfaceFormPtr:]", v8, v12, v14, v30];
        *(_DWORD *)buf = 138412290;
        std::string v35 = v31;
        _os_log_debug_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v28 = (*(uint64_t (**)(void, id, char *))(**((void **)self->m_impl + 29) + 320))(*((void *)self->m_impl + 29), v8, (char *)self->m_impl + 224);
      unint64_t v14 = HIDWORD(v28);
      if (!HIDWORD(v28))
      {
        LODWORD(v12) = 0;
LABEL_33:

        goto LABEL_10;
      }
      unint64_t v12 = v28;
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_33;
      }
      uint64_t v29 = TIOSLogFacility();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        if (*a5) {
          uint64_t v32 = (__CFString *)*a5;
        }
        else {
          uint64_t v32 = &stru_1F3F7A998;
        }
        long long v33 = [NSString stringWithFormat:@"%s TOKEN: add token, word = %@, returning existing token id = %u/%u/%@", "-[TIKeyboardInputManager(Learning) addWord:contextTokens:surfaceFormPtr:]", v8, v12, v14, v32];
        *(_DWORD *)buf = 138412290;
        std::string v35 = v33;
        _os_log_debug_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

    goto LABEL_33;
  }
  unint64_t v14 = 0;
LABEL_10:

  return (TITokenID)(v12 | (v14 << 32));
}

- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5
{
  char v7 = 0;
  uint64_t v6 = 0;
  return (TITokenID)[(TIKeyboardInputManager *)self findTokenIDForWord:a3 contextTokens:a4 tokenLookupMode:*(void *)&a5 surfaceFormPtr:&v6 hasCaseInsensitiveStaticVariant:&v7];
}

- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5 surfaceFormPtr:(id *)a6 hasCaseInsensitiveStaticVariant:(BOOL *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  TITokenID v13 = (TIContextTokens *)a4;
  *a6 = 0;
  m_impl = self->m_impl;
  if (m_impl
    && m_impl[29]
    && ![(TIKeyboardInputManager *)self shouldSuppressTokenIDLookups]
    && [v12 length])
  {
    [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v12];
    uint64_t v34 = v9;
    long long v15 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v15, (uint64_t)v43);
    int v38 = 0x100000;
    __int16 v39 = 0;
    char v40 = 0;
    long long v41 = 0;
    long long v33 = lmContextOrEmpty(v13);
    v42[0] = 0;
    BOOL v35 = 0;
    uint64_t v16 = self->m_impl;
    uint64_t v17 = v16[29];
    char v18 = v16 + 28;
    int v19 = [(TIKeyboardInputManagerBase *)self inputMode];
    int v20 = [v19 locale];
    unint64_t token_id_for_word = KB::LanguageModel::find_token_id_for_word(v17, (__CFString *)v15, v18, (uint64_t)v33, v34, (uint64_t)v20, (KB::String *)&v38, &v35);

    *a7 = v35;
    if (HIDWORD(token_id_for_word)) {
      BOOL v22 = (unsigned __int16)v38 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (!v22 && !KB::String::equal((KB::String *)v43, (const KB::String *)&v38, 1))
    {
      id v23 = (const char *)v41;
      if (!v41) {
        id v23 = v42;
      }
      if ((_WORD)v38) {
        int v24 = v23;
      }
      else {
        int v24 = "";
      }
      BOOL v25 = [NSString stringWithUTF8String:v24];
      *a6 = [(TIKeyboardInputManager *)self externalStringForDictionaryString:v25];
    }
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v26 = TIOSLogFacility();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = (const char *)v41;
        if (!v41) {
          uint64_t v30 = v42;
        }
        if ((_WORD)v38) {
          char v31 = v30;
        }
        else {
          char v31 = "";
        }
        v32 = [NSString stringWithFormat:@"%s TOKEN: word = %@, lookupmode = %x, _NSRange result = %u/%u/%s", "-[TIKeyboardInputManager(Learning) findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:]", v12, v34, token_id_for_word, HIDWORD(token_id_for_word), v31];
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v32;
        _os_log_debug_impl(&dword_1E3F0E000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    if (v41 && v40 == 1) {
      free(v41);
    }
    if (v44 && v43[6] == 1) {
      free(v44);
    }

    unint64_t v27 = token_id_for_word & 0xFFFFFFFF00000000;
    uint64_t v28 = token_id_for_word;
  }
  else
  {
    uint64_t v28 = 0;
    unint64_t v27 = 0;
  }

  return (TITokenID)(v27 | v28);
}

- (void)learnRecentMessageUserIsRespondingTo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  m_impl = self->m_impl;
  if (m_impl)
  {
    if (m_impl[29])
    {
      uint64_t v3 = m_impl[28];
      if (v3)
      {
        if (**(void **)(v3 + 8) != *(void *)(*(void *)(v3 + 8) + 8)
          && [(TIKeyboardInputManager *)self shouldSuppressLearning] == 4)
        {
          id v15 = [(TIKeyboardInputManager *)self keyboardState];
          uint64_t v5 = [v15 responseContext];
          if (v5)
          {
            uint64_t v6 = (void *)v5;
            char v7 = [(TIKeyboardInputManager *)self keyboardState];
            id v8 = [v7 inputContextHistory];

            if (!v8)
            {
              uint64_t v9 = *((void *)self->m_impl + 29);
              char v10 = [(TIKeyboardInputManager *)self keyboardState];
              id v11 = [v10 responseContext];
              KB::utf8_string(v11, (uint64_t)v16);
              id v12 = (char *)self->m_impl + 224;
              TITokenID v13 = [(TIKeyboardInputManager *)self keyboardState];
              unint64_t v14 = [v13 recipientIdentifier];
              (*(void (**)(uint64_t, unsigned char *, char *, void *, uint64_t, double))(*(void *)v9 + 392))(v9, v16, v12, v14, 2, 0.0);

              if (v17)
              {
                if (v16[6] == 1) {
                  free(v17);
                }
              }
            }
          }
          else
          {
          }
        }
      }
    }
  }
}

- (void)synchronizeConversationHistoryWithInputContextHistory:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(TIKeyboardInputManager *)self keyboardState];
  char v7 = [v6 inputContextHistory];

  uint64_t v8 = [v7 recipientIdentifiers];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    char v10 = [v7 recipientIdentifiers];
    id v11 = [v5 recipientIdentifiers];
    char v12 = [v10 isEqualToSet:v11];

    if ((v12 & 1) == 0)
    {
      [(TIKeyboardInputManager *)self resetConversationHistory];
      synchronizedInputContextHistory = self->_synchronizedInputContextHistory;
      self->_synchronizedInputContextHistory = 0;
    }
  }
  p_synchronizedInputContextHistory = (id *)&self->_synchronizedInputContextHistory;
  id v15 = self->_synchronizedInputContextHistory;
  if (v15) {
    [(TIInputContextHistory *)v15 appendPendingEntriesFromInputContextHistory:v5];
  }
  else {
    objc_storeStrong((id *)&self->_synchronizedInputContextHistory, a3);
  }
  if ([*p_synchronizedInputContextHistory hasPendingEntries])
  {
    id v16 = *p_synchronizedInputContextHistory;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__TIKeyboardInputManager_Learning__synchronizeConversationHistoryWithInputContextHistory___block_invoke;
    unsigned __int16 v17[3] = &unk_1E6E2D6E8;
    v17[4] = self;
    [v16 enumeratePendingEntries:v17];
    [*p_synchronizedInputContextHistory assertCheckpointForCoding];
    [(TIKeyboardInputManager *)self updateInputContext];
  }
}

uint64_t __90__TIKeyboardInputManager_Learning__synchronizeConversationHistoryWithInputContextHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) addItemToConversationHistoryWithText:a2 timestamp:a3 senderID:a4 recipientIdentifiers:a5];
}

- (void)resetConversationHistory
{
  p_conversation_history = &self->conversation_history;
  begin = self->conversation_history.__begin_;
  for (uint64_t i = self->conversation_history.__end_; i != begin; std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)i))
    uint64_t i = (RecentMessage *)((char *)i - 48);
  p_conversation_history->__end_ = begin;
  m_impl = self->m_impl;
  if (m_impl)
  {
    uint64_t v7 = m_impl[29];
    if (v7)
    {
      uint64_t v8 = m_impl[28];
      if (v8)
      {
        if (**(void **)(v8 + 8) != *(void *)(*(void *)(v8 + 8) + 8))
        {
          (*(void (**)(uint64_t, SEL))(*(void *)v7 + 128))(v7, a2);
          id v9 = +[TIResponseKitManager sharedTIResponseKitManager];
          [v9 resetResponseKitConversationHistory];
        }
      }
    }
  }
}

- (void)addItemToConversationHistoryWithText:(id)a3 timestamp:(id)a4 senderID:(id)a5 recipientIdentifiers:(id)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  m_impl = self->m_impl;
  if (!m_impl) {
    goto LABEL_62;
  }
  if (!m_impl[29]) {
    goto LABEL_62;
  }
  uint64_t v15 = m_impl[28];
  if (!v15) {
    goto LABEL_62;
  }
  if (**(void **)(v15 + 8) == *(void *)(*(void *)(v15 + 8) + 8)) {
    goto LABEL_62;
  }
  unint64_t v16 = [v10 length];
  if (v16 > [MEMORY[0x1E4FAE2D0] maxEntryLength]) {
    goto LABEL_62;
  }
  uint64_t v17 = [(TIInputContextHistory *)self->_synchronizedInputContextHistory senderIdentifiers];
  uint64_t v18 = [v17 count];
  if (v12) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  int v21 = v12;
  if (!v19)
  {
    if (![v17 containsObject:v12])
    {
      int v20 = 0;
      int v21 = v12;
      goto LABEL_18;
    }
    int v21 = (const void *)*MEMORY[0x1E4F721A0];
  }
  if (!v21)
  {
    int v77 = v20;
    BOOL v75 = 0;
    goto LABEL_19;
  }
LABEL_18:
  int v77 = v20;
  BOOL v75 = v21;
  CFRetain(v21);
LABEL_19:
  BOOL v22 = self->m_impl;
  uint64_t v24 = v22[29];
  id v23 = (std::__shared_weak_count *)v22[30];
  if (v23)
  {
    atomic_fetch_add_explicit(&v23->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    BOOL v22 = self->m_impl;
  }
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3812000000;
  v90[3] = __Block_byref_object_copy__18126;
  v90[4] = __Block_byref_object_dispose__18127;
  v90[5] = "";
  BOOL v25 = (unsigned int *)v22[28];
  BOOL v91 = v25;
  if (v25) {
    atomic_fetch_add((atomic_uint *volatile)v25, 1u);
  }
  [v10 _stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:200];
  p_conversation_history = &self->conversation_history;
  char v79 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v79, (uint64_t)v92);
  uint64_t v94 = 0;
  int v95 = 0;
  std::__split_buffer<std::string>::pointer end = self->conversation_history.__end_;
  value = self->conversation_history.__end_cap_.__value_;
  long long v74 = v23;
  if (end >= value)
  {
    unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((end - p_conversation_history->__begin_) >> 4);
    if (v32 + 1 > 0x555555555555555) {
      abort();
    }
    uint64_t v69 = v24;
    unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((value - p_conversation_history->__begin_) >> 4);
    uint64_t v34 = 2 * v33;
    if (2 * v33 <= v32 + 1) {
      uint64_t v34 = v32 + 1;
    }
    if (v33 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v35 = 0x555555555555555;
    }
    else {
      unint64_t v35 = v34;
    }
    if (v35 > 0x555555555555555) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v36 = 3 * v35;
    uint64_t v37 = (char *)operator new(48 * v35);
    uint64_t v38 = (uint64_t)&v37[48 * v32];
    *(_DWORD *)uint64_t v38 = 0x100000;
    *(_WORD *)(v38 + 4) = 0;
    os_signpost_id_t v67 = (RecentMessage *)&v37[16 * v36];
    *(unsigned char *)(v38 + 6) = 0;
    *(void *)(v38 + 8) = 0;
    KB::String::operator=(v38, (KB::String *)v92);
    uint64_t v39 = v94;
    uint64_t v94 = 0;
    *(void *)(v38 + 32) = v39;
    *(_DWORD *)(v38 + 40) = v95;
    char v31 = (RecentMessage *)(v38 + 48);
    begin = p_conversation_history->__begin_;
    char v40 = self->conversation_history.__end_;
    long long v72 = (RecentMessage *)(v38 + 48);
    if (v40 == p_conversation_history->__begin_)
    {
      p_conversation_history->__begin_ = (RecentMessage *)v38;
      self->conversation_history.__end_ = v31;
      uint64_t v24 = v69;
      self->conversation_history.__end_cap_.__value_ = v67;
    }
    else
    {
      os_signpost_id_t v66 = &self->conversation_history;
      uint64_t v42 = 0;
      do
      {
        *(_DWORD *)(v38 + v42 - 48) = 0x100000;
        uint64_t v43 = v38 + v42 - 48;
        *(_WORD *)(v43 + 4) = 0;
        *(unsigned char *)(v43 + 6) = 0;
        *(void *)(v43 + 8) = 0;
        uint64_t v44 = KB::String::operator=(v43, (KB::String *)((char *)v40 + v42 - 48));
        uint64_t v45 = *(void *)((char *)v40 + v42 - 16);
        *(void *)((char *)v40 + v42 - 16) = 0;
        *(void *)(v44 + 32) = v45;
        *(_DWORD *)(v44 + 40) = *(_DWORD *)((char *)v40 + v42 - 8);
        v42 -= 48;
      }
      while ((RecentMessage *)((char *)v40 + v42) != begin);
      uint64_t v46 = (RecentMessage *)(v38 + v42);
      p_conversation_history = &self->conversation_history;
      os_signpost_id_t v47 = v66->__begin_;
      char v40 = self->conversation_history.__end_;
      v66->__begin_ = v46;
      char v31 = v72;
      uint64_t v24 = v69;
      self->conversation_history.__end_ = v72;
      self->conversation_history.__end_cap_.__value_ = v67;
      if (v40 != v47)
      {
        do
        {
          char v40 = (RecentMessage *)((char *)v40 - 48);
          std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)v40);
        }
        while (v40 != v47);
        char v40 = v47;
        char v31 = v72;
      }
    }
    id v23 = v74;
    if (v40)
    {
      operator delete(v40);
      char v31 = v72;
    }
  }
  else
  {
    *(_DWORD *)std::__split_buffer<std::string>::pointer end = 0x100000;
    *((_WORD *)end + 2) = 0;
    *((unsigned char *)end + 6) = 0;
    *((void *)end + 1) = 0;
    uint64_t v29 = KB::String::operator=((uint64_t)end, (KB::String *)v92);
    uint64_t v30 = v94;
    uint64_t v94 = 0;
    *(void *)(v29 + 32) = v30;
    *(_DWORD *)(v29 + 40) = v95;
    char v31 = (RecentMessage *)(v29 + 48);
  }
  p_conversation_history->__end_ = v31;
  uint64_t v48 = v94;
  uint64_t v94 = 0;
  if (v48) {
    std::default_delete<KB::LanguageModelContext>::operator()[abi:nn180100](v48);
  }
  if (v93 && v92[6] == 1) {
    free(v93);
  }
  int v49 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3321888768;
  v80[2] = __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke;
  v80[3] = &unk_1F3F78A60;
  uint64_t v87 = v24;
  int v88 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  id v50 = v10;
  id v81 = v50;
  id v89 = v75;
  id v82 = v13;
  id v76 = v17;
  id v83 = v76;
  id v51 = v12;
  id v84 = v51;
  long long v86 = v90;
  id v52 = v11;
  id v85 = v52;
  [v49 performTaskInBackground:v80];

  if (v77)
  {
    synchronizedInputContextHistory = self->_synchronizedInputContextHistory;
    id v70 = v50;
    uint64_t v71 = [(TIInputContextHistory *)synchronizedInputContextHistory mostRecentNonSenderTextEntry];
    unsigned int v68 = +[TIResponseKitManager sharedTIResponseKitManager];
    uint64_t v78 = [(TIKeyboardInputManagerBase *)self inputMode];
    id v54 = [v78 normalizedIdentifier];
    unint64_t v73 = [(TIKeyboardInputManager *)self keyboardState];
    [v73 clientIdentifier];
    v56 = id v55 = v52;
    id v57 = [(TIKeyboardInputManager *)self keyboardState];
    id v58 = [v57 recipientIdentifier];
    LOBYTE(v65) = 1;
    id v64 = v55;
    id v59 = (void *)v71;
    [v68 registerResponseKitResponse:v70 forMessage:v71 withLanguage:v54 withClientID:v56 withSenderID:v51 withRecipientID:v58 withTimestamp:v64 shouldUpdateConversationHistory:v65];

    id v23 = v74;
    int v60 = v79;
    os_signpost_id_t v61 = v76;
  }
  else
  {
    int v60 = v79;
    os_signpost_id_t v61 = v76;
    if (!v50 || !v52 || !v12) {
      goto LABEL_55;
    }
    os_signpost_id_t v62 = +[TIResponseKitManager sharedTIResponseKitManager];
    id v63 = v50;
    id v59 = v62;
    [v62 updateResponseKitConversationHistoryWithMessage:v63 withSenderID:v51 withTimestamp:v52];
  }

LABEL_55:
  if (v88) {
    std::__shared_weak_count::__release_weak(v88);
  }

  _Block_object_dispose(v90, 8);
  if (v91) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v91);
  }
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }

LABEL_62:
}

void __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = *(std::__shared_weak_count **)(a1 + 88);
  id v9 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 64);
  id v3 = (id)v4;
  TIDispatchSync();

  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
}

void __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(std::__shared_weak_count **)(a1 + 88);
  if (!v2)
  {
LABEL_17:
    id v3 = 0;
    goto LABEL_18;
  }
  id v3 = std::__shared_weak_count::lock(v2);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 80);
    if (v4)
    {
      unint64_t v5 = [*(id *)(a1 + 32) length];
      if (!*(void *)(a1 + 96))
      {
        id v6 = [*(id *)(a1 + 40) allObjects];
        id v7 = [v6 componentsJoinedByString:@", "];

        id v8 = [*(id *)(a1 + 48) allObjects];
        id v9 = [v8 componentsJoinedByString:@", "];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315394;
          *(void *)unint64_t v16 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke_2";
          *(_WORD *)&unsigned char v16[8] = 2112;
          *(void *)&v16[10] = v7;
          _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Recipients are: %@", (uint8_t *)&v15, 0x16u);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *(void *)(a1 + 56);
          int v15 = 136315394;
          *(void *)unint64_t v16 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke";
          *(_WORD *)&unsigned char v16[8] = 2112;
          *(void *)&v16[10] = v14;
          _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Sender Identifier: %@", (uint8_t *)&v15, 0x16u);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315394;
          *(void *)unint64_t v16 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke";
          *(_WORD *)&unsigned char v16[8] = 2112;
          *(void *)&v16[10] = v9;
          _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  All-Sender-Identifiers: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      if (v5 <= 0x3FFE)
      {
        KB::utf8_string(*(KB **)(a1 + 32), (uint64_t)&v15);
        uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8) + 48;
        [*(id *)(a1 + 64) timeIntervalSinceReferenceDate];
        (*(void (**)(uint64_t, int *, uint64_t, void, uint64_t))(*(void *)v4 + 392))(v4, &v15, v10, *(void *)(a1 + 96), 2);
        if (*(void *)&v16[4])
        {
          if (v16[2] == 1) {
            free(*(void **)&v16[4]);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:nn180100](v3);
      goto LABEL_17;
    }
  }
LABEL_18:
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id v12 = *(unsigned int **)(v11 + 48);
  *(void *)(v11 + 48) = 0;
  if (v12) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v12);
  }
  id v13 = *(const void **)(a1 + 96);
  if (v13) {
    CFRelease(v13);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
}

- (void)registerRevisionFrom:(id)a3 to:(id)a4 contextTokens:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    if (([v9 isEqualToString:v8] & 1) == 0)
    {
      uint64_t v11 = [(TIKeyboardInputManager *)self rejectionsDatabase];
      if (v11)
      {
        id v12 = v11;
        id v13 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v8];

        uint64_t v14 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v9];

        id v8 = v13;
        int v15 = (const char *)[v8 UTF8String];
        id v9 = v14;
        unint64_t v16 = TI::RejectionsDatabase::insert_acceptance(v12, v15, (const char *)[v9 UTF8String], 1, 0);
        [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v16];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[TIKeyboardInputManager(Learning) registerRevisionFrom:to:contextTokens:]";
    _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  registerRevisionFrom called with nil parameter", buf, 0xCu);
  }
}

- (void)registerNegativeEvidence:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 intended:(id)a6 intendedTokenID:(TITokenID)a7 hint:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  TITokenID v35 = a7;
  TITokenID v36 = a4;
  id v12 = a3;
  id v13 = (TIContextTokens *)a5;
  id v14 = a6;
  id v15 = v14;
  if (v12 && v14 && ([v12 isEqualToString:v14] & 1) == 0)
  {
    if (TIAdaptationAutocorrectionRejectionV2Enabled()) {
      [(TIKeyboardInputManager *)self setRejectedAutocorrection:v12 forInput:v15];
    }
    unint64_t v16 = lmContextOrEmpty(v13);
    if ([(TIKeyboardInputManager *)self shouldSuppressLearning] == 4)
    {
      if (TIAdaptationAutocorrectionRejectionV2Enabled())
      {
        uint64_t v17 = [(TIKeyboardInputManager *)self rejectionsDatabase];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v12];

          int v20 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v15];

          if ([(TIKeyboardInputManager *)self blockedByNegativeLearning:v20 correction:v19 ignoreSoft:1])
          {
            id v15 = v20;
            id v12 = v19;
          }
          else {
            id v23 = {;
          }
            [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v23];

            uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
            [v24 timeIntervalSince1970];
            double v26 = v25;

            id v15 = v20;
            unint64_t v27 = (sqlite3 *)[v15 UTF8String];
            id v12 = v19;
            TI::RejectionsDatabase::insert_rejection(v18, v27, (const char *)[v12 UTF8String], 1, 0, v26);
            if ([v12 hasPrefix:v15]) {
              uint64_t v28 = {;
            }
              [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v28];

              id v29 = v12;
              std::string::basic_string[abi:nn180100]<0>(&v37, (char *)[v29 UTF8String]);
              id v12 = v29;
              std::string::basic_string[abi:nn180100]<0>(&v33, (char *)[v12 UTF8String]);
              id v15 = v15;
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v15 UTF8String]);
              TIInlineCompletionsNegativeLearning::registerLearning(v18, &v37, v30, (std::string::size_type)__p, 1);
              if (v32 < 0) {
                operator delete(__p[0]);
              }
              if (v34 < 0) {
                operator delete(v33);
              }
              if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v37.__r_.__value_.__l.__data_);
              }
            }
          }
        }
      }
      else
      {
        m_impl = self->m_impl;
        if (m_impl)
        {
          uint64_t v22 = m_impl[29];
          if (v22)
          {
            KB::utf8_string((KB *)v12, (uint64_t)&v37);
            (*(void (**)(uint64_t, std::string *, TITokenID *, long long *, TITokenID *, uint64_t))(*(void *)v22 + 360))(v22, &v37, &v36, v16, &v35, v8);
            if (v37.__r_.__value_.__l.__size_)
            {
              if (v37.__r_.__value_.__s.__data_[6] == 1) {
                free((void *)v37.__r_.__value_.__l.__size_);
              }
            }
          }
        }
      }
    }
  }
}

- (void)softLearningRegisterDeleted:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    id v7 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v4];

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    [v8 timeIntervalSince1970];
    double v10 = v9;

    id v4 = v7;
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v4 UTF8String]);
    TI::RejectionsDatabase::soft_add_deleted(v6, &__p, v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    uint64_t v11 = [NSString stringWithFormat:@"[NegativeLearning] [SoftLearning] recording deleted word %@\n", v4];
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v11];
  }
}

- (void)softLearningRegisterAccepted:(id)a3 typed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    double v10 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v6];

    uint64_t v11 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v7];

    id v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSince1970];
    double v14 = v13;

    id v7 = v11;
    std::string::basic_string[abi:nn180100]<0>(&v17, (char *)[v7 UTF8String]);
    id v6 = v10;
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v6 UTF8String]);
    TI::RejectionsDatabase::soft_add_accepted(v9, &v17, &__p, v14);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
    id v15 = [NSString stringWithFormat:@"[NegativeLearning] [SoftLearning] recording accepted word %@ (typed %@)\n", v6, v7];
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v15];
  }
}

- (BOOL)blockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (!v10 || (uint64_t v11 = v10, ([v8 isEqualToString:v9] & 1) != 0))
  {
    BOOL v12 = 0;
    double v13 = v9;
    double v14 = v8;
    goto LABEL_22;
  }
  double v14 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v8];

  double v13 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v9];

  if ([(TIKeyboardInputManager *)self directlyBlockedByNegativeLearning:v14 correction:v13 ignoreSoft:v5 retrocorrectionComponent:0])
  {
LABEL_5:
    BOOL v12 = 1;
    goto LABEL_22;
  }
  if ([v14 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v37 = v5;
    id v15 = [v14 componentsSeparatedByString:@" "];
    unint64_t v16 = [v13 componentsSeparatedByString:@" "];
    uint64_t v17 = [v15 count];
    if (v17 == [v16 count])
    {
      if (![v15 count])
      {
        double v25 = LABEL_13:;
        [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v25];

        goto LABEL_5;
      }
      uint64_t v18 = 0;
      while (1)
      {
        uint64_t v19 = [v15 objectAtIndexedSubscript:v18];
        int v20 = [v16 objectAtIndexedSubscript:v18];
        char v21 = [v19 isEqualToString:v20];

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v15 objectAtIndexedSubscript:v18];
          id v23 = [v16 objectAtIndexedSubscript:v18];
          BOOL v24 = [(TIKeyboardInputManager *)self directlyBlockedByNegativeLearning:v22 correction:v23 ignoreSoft:v37 retrocorrectionComponent:1];

          if (!v24) {
            break;
          }
        }
        if ([v15 count] <= (unint64_t)++v18) {
          goto LABEL_13;
        }
      }
    }

    LODWORD(v5) = v37;
  }
  double v26 = [(TIKeyboardInputManagerBase *)self inputMode];
  unint64_t v27 = [v26 locale];
  uint64_t v28 = [v14 lowercaseStringWithLocale:v27];

  id v29 = [(TIKeyboardInputManagerBase *)self inputMode];
  uint64_t v30 = [v29 locale];
  char v31 = [v13 lowercaseStringWithLocale:v30];

  if (![v31 hasPrefix:v28] || (objc_msgSend(v31, "isEqualToString:", v28) & 1) != 0) {
    goto LABEL_20;
  }
  int v32 = [v14 lengthOfBytesUsingEncoding:4];
  id v33 = v13;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v33 UTF8String]);
  unint64_t v34 = TIInlineCompletionsNegativeLearning::wordBlockedByNegativeLearning(v11, v32, (uint64_t)__p, v5);
  if (v39 < 0) {
    operator delete(__p[0]);
  }
  if (HIDWORD(v34)) {
    TITokenID v36 = {;
  }
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v36];

    BOOL v12 = 1;
  }
  else
  {
LABEL_20:
    BOOL v12 = 0;
  }

LABEL_22:
  return v12;
}

- (BOOL)directlyBlockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5 retrocorrectionComponent:(BOOL)a6
{
  BOOL v6 = a6;
  double v10 = (__CFString *)a3;
  uint64_t v11 = (__CFString *)a4;
  BOOL v12 = [(TIKeyboardInputManager *)self rejectionsDatabase];
  if (v12)
  {
    double v13 = v12;
    double v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSince1970];
    double v16 = v15;

    uint64_t v17 = @"autocorrection";
    if (v6) {
      uint64_t v17 = @"retrocorrection component";
    }
    uint64_t v18 = v17;
    if (!a5)
    {
      if ([(__CFString *)v10 length] == 1 && [(__CFString *)v11 length] == 1)
      {
        int v19 = 1;
      }
      else if (onlyChangesCaseDiacriticsPunctuation(&v10->isa, &v11->isa) || v6)
      {
        int v19 = 3;
      }
      else
      {
        int v19 = 20;
      }
      KB::std_string(v10, &v29);
      KB::std_string(v11, __p);
      int should_block = TI::RejectionsDatabase::soft_should_block((uint64_t)v13, (unsigned __int8 *)&v29, (unsigned __int8 **)__p, v19, v16);
      if (v35 < 0) {
        operator delete(__p[0]);
      }
      if (v31 < 0)
      {
        operator delete(v29);
        if (should_block) {
          goto LABEL_16;
        }
      }
      else if (should_block)
      {
LABEL_16:
        goto LABEL_23;
      }
    }
    uint64_t v22 = v10;
    id v23 = (const char *)[(__CFString *)v22 UTF8String];
    BOOL v24 = v11;
    TI::RejectionsDatabase::get_rejections(v13, v23, (const char *)[(__CFString *)v24 UTF8String], 0, (uint64_t)&v29);
    if (!v33
      || (double v25 = (v16 - v32) / 60.0 / 60.0 / 24.0, v25 > 180.0)
      || (int v26 = v30) == 0
      || log(v25) / 1.38629436 >= (double)(v26 - 1))
    {
      BOOL v20 = 0;
      goto LABEL_25;
    }
    unint64_t v27 = LABEL_23:;
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v27];

    BOOL v20 = 1;
LABEL_25:

    goto LABEL_26;
  }
  BOOL v20 = 0;
LABEL_26:

  return v20;
}

- (void)decrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  TITokenID v61 = a4;
  id v8 = (KB *)a3;
  id v9 = (TIContextTokens *)a5;
  double v10 = v9;
  m_impl = self->m_impl;
  if (!m_impl || !m_impl[29]) {
    goto LABEL_56;
  }
  BOOL v12 = lmContextOrEmpty(v9);
  if (![(TIKeyboardInputManager *)self shouldSuppressLanguageSelectionEvidence])
  {
    double v13 = [(TIKeyboardInputManager *)self languageSelectionController];
    objc_msgSend(v13, "removeTokenString:tokenID:context:contextLength:", v8, a4);
  }
  unint64_t v14 = [(TIKeyboardInputManager *)self shouldSuppressLearning];
  if (v14 == 4)
  {
    uint64_t v15 = *((void *)self->m_impl + 29);
    KB::utf8_string(v8, (uint64_t)v63);
    (*(void (**)(uint64_t, _WORD *, TITokenID *, long long *))(*(void *)v15 + 352))(v15, v63, &v61, v12);
    if (v65 && v64 == 1) {
      free(v65);
    }
LABEL_10:
    double v16 = (KB::DictionaryContainer *)*((void *)self->m_impl + 28);
    KB::utf8_string(v8, (uint64_t)&v67);
    KB::DictionaryContainer::closest_static_match(v16, (const KB::String *)&v67, (KB::Word *)v63);
    if (v67.__begin_ && BYTE6(v67.__first_) == 1) {
      free(v67.__begin_);
    }
    if (simular_swear_word_policy_v2_setting)
    {
      if (([(id)simular_swear_word_policy_v2_setting BOOLValue] & 1) == 0) {
        goto LABEL_50;
      }
    }
    else if (!_os_feature_enabled_impl())
    {
LABEL_50:
      KB::Word::~Word((KB::Word *)v63);
      goto LABEL_51;
    }
    if ((v66[91] & 8) != 0
      && (*(unsigned int (**)(void, void))(**((void **)self->m_impl + 29) + 400))(*((void *)self->m_impl + 29), v61.lexicon_id))
    {
      id v51 = v8;
      uint64_t v17 = [(TIKeyboardInputManager *)self keyboardState];
      id v49 = [v17 clientIdentifier];

      int64x2_t v59 = 0uLL;
      int v60 = 0;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v50 = self;
      uint64_t v18 = [(TIKeyboardInputManager *)self keyboardState];
      int v19 = [v18 inputContextHistory];
      BOOL v20 = [v19 recipientIdentifiers];
      char v21 = [v20 allObjects];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v56 != v24) {
              objc_enumerationMutation(v21);
            }
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)[*(id *)(*((void *)&v55 + 1) + 8 * i) UTF8String]);
            int v26 = (_OWORD *)v59.i64[1];
            if (v59.i64[1] >= (unint64_t)v60)
            {
              unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((v59.i64[1] - v59.i64[0]) >> 3);
              unint64_t v29 = v28 + 1;
              if (v28 + 1 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * (((uint64_t)v60 - v59.i64[0]) >> 3) > v29) {
                unint64_t v29 = 0x5555555555555556 * (((uint64_t)v60 - v59.i64[0]) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v60 - v59.i64[0]) >> 3) >= 0x555555555555555) {
                unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v30 = v29;
              }
              v67.__end_cap_.__value_ = (std::allocator<std::string> *)&v60;
              if (v30) {
                unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v30);
              }
              else {
                uint64_t v31 = 0;
              }
              unint64_t v32 = v30 + 24 * v28;
              long long v33 = *(_OWORD *)__p;
              *(void *)(v32 + 16) = v54;
              *(_OWORD *)unint64_t v32 = v33;
              __p[1] = 0;
              uint64_t v54 = 0;
              __p[0] = 0;
              uint64_t v34 = v59.i64[1];
              uint64_t v35 = v59.i64[0];
              if (v59.i64[1] == v59.i64[0])
              {
                int64x2_t v38 = vdupq_n_s64(v59.u64[1]);
                unint64_t v36 = v30 + 24 * v28;
              }
              else
              {
                unint64_t v36 = v30 + 24 * v28;
                do
                {
                  long long v37 = *(_OWORD *)(v34 - 24);
                  *(void *)(v36 - 8) = *(void *)(v34 - 8);
                  *(_OWORD *)(v36 - 24) = v37;
                  v36 -= 24;
                  *(void *)(v34 - 16) = 0;
                  *(void *)(v34 - 8) = 0;
                  *(void *)(v34 - 24) = 0;
                  v34 -= 24;
                }
                while (v34 != v35);
                int64x2_t v38 = v59;
              }
              unint64_t v39 = v32 + 24;
              v59.i64[0] = v36;
              v59.i64[1] = v32 + 24;
              *(int64x2_t *)&v67.__begin_ = v38;
              char v40 = v60;
              int v60 = (std::string *)(v30 + 24 * v31);
              v67.__end_cap_.__value_ = v40;
              v67.__first_ = (std::__split_buffer<std::string>::pointer)v38.i64[0];
              std::__split_buffer<std::string>::~__split_buffer(&v67);
              v59.i64[1] = v39;
              if (SHIBYTE(v54) < 0) {
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v27 = *(_OWORD *)__p;
              *(void *)(v59.i64[1] + 16) = v54;
              *int v26 = v27;
              v59.i64[1] = (uint64_t)v26 + 24;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v23);
      }

      long long v41 = (char *)TILocaleIdentifierForLexiconID(v61.lexicon_id);
      self = v50;
      uint64_t v42 = (uint64_t)v50->m_impl + 592;
      uint64_t v43 = (char *)v65;
      if (!v65) {
        uint64_t v43 = v66;
      }
      if (v63[0]) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = "";
      }
      id v45 = v49;
      uint64_t v46 = (char *)[v45 UTF8String];
      memset(&v52, 0, sizeof(v52));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v52, (long long *)v59.i64[0], (long long *)v59.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v59.i64[1] - v59.i64[0]) >> 3));
      TI::VulgarWordUsageDatabaseWrapper::decrement_usage_count(v42, v44, v46, (uint64_t *)&v52, v41);
      v67.__first_ = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v67);
      v67.__first_ = (std::__split_buffer<std::string>::pointer)&v59;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v67);

      id v8 = v51;
    }
    goto LABEL_50;
  }
  if (v14 - 3 <= 1) {
    goto LABEL_10;
  }
LABEL_51:
  os_signpost_id_t v47 = self->m_impl;
  KB::utf8_string(v8, (uint64_t)v63);
  uint64_t v48 = v47[23];
  if (v48) {
    (*(void (**)(uint64_t, _WORD *))(*(void *)v48 + 112))(v48, v63);
  }
  if (v65 && v64 == 1) {
    free(v65);
  }
LABEL_56:
}

- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6
{
}

- (void)incrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 saveToDifferentialPrivacy:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  TITokenID v68 = a4;
  double v10 = (KB *)a3;
  uint64_t v11 = (TIContextTokens *)a5;
  BOOL v12 = [(TIKeyboardInputManager *)self getTestingStateObject];

  if (v6 && v12)
  {
    v74[0] = v10;
    double v13 = [NSNumber numberWithUnsignedInteger:v6];
    v74[1] = v13;
    unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];

    uint64_t v15 = [(TIKeyboardInputManager *)self getTestingStateObject];
    [v15 setObject:v14 forKey:@"incrementLanguageModelCount"];
  }
  m_impl = self->m_impl;
  if (m_impl && m_impl[29])
  {
    uint64_t v17 = lmContextOrEmpty(v11);
    if (![(TIKeyboardInputManager *)self shouldSuppressLanguageSelectionEvidence])
    {
      uint64_t v18 = [(TIKeyboardInputManager *)self languageSelectionController];
      objc_msgSend(v18, "addTokenString:tokenID:context:contextLength:", v10, a4);
    }
    unint64_t v19 = [(TIKeyboardInputManager *)self shouldSuppressLearning];
    if (v19 != 4)
    {
      if (v19 - 3 > 1) {
        goto LABEL_63;
      }
LABEL_22:
      double v25 = (KB::DictionaryContainer *)*((void *)self->m_impl + 28);
      KB::utf8_string(v10, (uint64_t)&v75);
      KB::DictionaryContainer::closest_static_match(v25, (const KB::String *)&v75, (KB::Word *)v70);
      if (v75.__begin_ && BYTE6(v75.__first_) == 1) {
        free(v75.__begin_);
      }
      if (simular_swear_word_policy_v2_setting)
      {
        if (([(id)simular_swear_word_policy_v2_setting BOOLValue] & 1) == 0) {
          goto LABEL_62;
        }
      }
      else if (!_os_feature_enabled_impl())
      {
LABEL_62:
        KB::Word::~Word((KB::Word *)v70);
        goto LABEL_63;
      }
      if ((v73[91] & 8) != 0
        && (*(unsigned int (**)(void, void))(**((void **)self->m_impl + 29) + 400))(*((void *)self->m_impl + 29), v68.lexicon_id))
      {
        int v26 = [(TIKeyboardInputManager *)self keyboardState];
        id v56 = [v26 clientIdentifier];

        int64x2_t v66 = 0uLL;
        std::__split_buffer<std::string> v67 = 0;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v57 = self;
        long long v27 = [(TIKeyboardInputManager *)self keyboardState];
        unint64_t v28 = [v27 inputContextHistory];
        unint64_t v29 = [v28 recipientIdentifiers];
        unint64_t v30 = [v29 allObjects];

        uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v69 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v63 != v33) {
                objc_enumerationMutation(v30);
              }
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)[*(id *)(*((void *)&v62 + 1) + 8 * i) UTF8String]);
              uint64_t v35 = (_OWORD *)v66.i64[1];
              if (v66.i64[1] >= (unint64_t)v67)
              {
                unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((v66.i64[1] - v66.i64[0]) >> 3);
                unint64_t v38 = v37 + 1;
                if (v37 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  abort();
                }
                if (0x5555555555555556 * (((uint64_t)v67 - v66.i64[0]) >> 3) > v38) {
                  unint64_t v38 = 0x5555555555555556 * (((uint64_t)v67 - v66.i64[0]) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v67 - v66.i64[0]) >> 3) >= 0x555555555555555) {
                  unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v39 = v38;
                }
                v75.__end_cap_.__value_ = (std::allocator<std::string> *)&v67;
                if (v39) {
                  unint64_t v39 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v39);
                }
                else {
                  uint64_t v40 = 0;
                }
                unint64_t v41 = v39 + 24 * v37;
                long long v42 = *(_OWORD *)__p;
                *(void *)(v41 + 16) = v61;
                *(_OWORD *)unint64_t v41 = v42;
                __p[1] = 0;
                uint64_t v61 = 0;
                __p[0] = 0;
                uint64_t v43 = v66.i64[1];
                uint64_t v44 = v66.i64[0];
                if (v66.i64[1] == v66.i64[0])
                {
                  int64x2_t v47 = vdupq_n_s64(v66.u64[1]);
                  unint64_t v45 = v39 + 24 * v37;
                }
                else
                {
                  unint64_t v45 = v39 + 24 * v37;
                  do
                  {
                    long long v46 = *(_OWORD *)(v43 - 24);
                    *(void *)(v45 - 8) = *(void *)(v43 - 8);
                    *(_OWORD *)(v45 - 24) = v46;
                    v45 -= 24;
                    *(void *)(v43 - 16) = 0;
                    *(void *)(v43 - 8) = 0;
                    *(void *)(v43 - 24) = 0;
                    v43 -= 24;
                  }
                  while (v43 != v44);
                  int64x2_t v47 = v66;
                }
                unint64_t v48 = v41 + 24;
                v66.i64[0] = v45;
                v66.i64[1] = v41 + 24;
                *(int64x2_t *)&v75.__begin_ = v47;
                id v49 = v67;
                std::__split_buffer<std::string> v67 = (std::string *)(v39 + 24 * v40);
                v75.__end_cap_.__value_ = v49;
                v75.__first_ = (std::__split_buffer<std::string>::pointer)v47.i64[0];
                std::__split_buffer<std::string>::~__split_buffer(&v75);
                v66.i64[1] = v48;
                if (SHIBYTE(v61) < 0) {
                  operator delete(__p[0]);
                }
              }
              else
              {
                long long v36 = *(_OWORD *)__p;
                *(void *)(v66.i64[1] + 16) = v61;
                *uint64_t v35 = v36;
                v66.i64[1] = (uint64_t)v35 + 24;
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v62 objects:v69 count:16];
          }
          while (v32);
        }

        id v50 = (char *)TILocaleIdentifierForLexiconID(v68.lexicon_id);
        id v51 = (TI::VulgarWordUsageDatabaseWrapper *)((char *)v57->m_impl + 592);
        std::string v52 = (char *)v72;
        if (!v72) {
          std::string v52 = v73;
        }
        if (v70[0]) {
          int v53 = v52;
        }
        else {
          int v53 = "";
        }
        id v54 = v56;
        long long v55 = (char *)[v54 UTF8String];
        memset(&v59, 0, sizeof(v59));
        std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v59, (long long *)v66.i64[0], (long long *)v66.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v66.i64[1] - v66.i64[0]) >> 3));
        TI::VulgarWordUsageDatabaseWrapper::increment_usage_count(v51, v53, v55, (uint64_t *)&v59, v50);
        v75.__first_ = &v59;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v75);
        v75.__first_ = (std::__split_buffer<std::string>::pointer)&v66;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v75);
      }
      goto LABEL_62;
    }
    if (v6)
    {
      if ((v6 & 2) == 0)
      {
LABEL_11:
        (*(void (**)(void, KB *, TITokenID, uint64_t))(**((void **)self->m_impl + 29) + 368))(*((void *)self->m_impl + 29), v10, a4, v6);
        goto LABEL_18;
      }
      BOOL v20 = [(TIKeyboardInputManager *)self keyboardState];
      if ([v20 autocorrectionEnabled])
      {
        char v21 = [(TIKeyboardInputManager *)self keyboardState];
        uint64_t v22 = [v21 textInputTraits];
        uint64_t v58 = [v22 autocorrectionType];

        if (v58 != 1) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
LABEL_18:
    uint64_t v23 = [(TIKeyboardInputManager *)self dictionaryStringForExternalString:v10];
    uint64_t v24 = *((void *)self->m_impl + 29);
    KB::utf8_string(v23, (uint64_t)v70);
    (*(void (**)(uint64_t, _WORD *, TITokenID *, long long *))(*(void *)v24 + 344))(v24, v70, &v68, v17);
    if (v72 && v71 == 1) {
      free(v72);
    }

    goto LABEL_22;
  }
LABEL_63:
}

- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7
{
}

- (BOOL)shouldLearnWord:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (KB *)a3;
  if (![(TIKeyboardInputManager *)self supportsLearning])
  {
    KB::utf8_string(v4, (uint64_t)v9);
    goto LABEL_5;
  }
  unint64_t v5 = [(TIKeyboardInputManager *)self shouldSuppressLearning];
  KB::utf8_string(v4, (uint64_t)v9);
  if (v5 != 4)
  {
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_6;
  }
  BOOL v7 = KB::count_letters_if_word((KB *)v9, v6) != 0;
LABEL_6:
  if (v10 && v9[6] == 1) {
    free(v10);
  }

  return v7;
}

- (BOOL)shouldSuppressLanguageSelectionEvidence
{
  id v2 = [(TIKeyboardInputManager *)self keyboardState];
  id v3 = [v2 textInputTraits];
  BOOL v4 = [v3 autocorrectionType] == 1;

  return v4;
}

- (unint64_t)shouldSuppressLearning
{
  id v3 = [(TIKeyboardInputManager *)self keyboardState];
  char v4 = [v3 secureTextEntry];

  if (v4) {
    return 0;
  }
  if (![(TIKeyboardInputManager *)self isWordLearningEnabled]) {
    return 1;
  }
  uint64_t v6 = [(TIKeyboardInputManager *)self config];
  int v7 = [v6 usesAdaptation];

  if (!v7) {
    return 1;
  }
  id v8 = [(TIKeyboardInputManager *)self keyboardState];
  id v9 = [v8 textInputTraits];
  uint64_t v10 = [v9 autocorrectionType];

  if (v10 == 1) {
    return 2;
  }
  uint64_t v11 = [(TIKeyboardInputManager *)self currentState];
  char v12 = [v11 learningFlagsMaskForLastAcceptedCandidate];

  if (v12) {
    return 3;
  }
  else {
    return 4;
  }
}

- (void)updateTrialNegativeLearningFlagForPrimaryLocale
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install
    || ([(TIKeyboardInputManager *)self languageSelectionController],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 activeInputModes],
        char v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 count],
        v4,
        v3,
        v5 < 2))
  {
    id v9 = +[TITrialManagerProxy sharedManager];
    uint64_t v6 = [(TIKeyboardInputManagerBase *)self inputMode];
    int v7 = [v6 locale];
    id v8 = [v9 isNegativeLearningEnabledForLocale:v7];

    if (v8) {
      TIOverrideAdaptationAutocorrectionRejectionV2Trial([v8 BOOLValue]);
    }
    else {
      TIRestoreAdaptationAutocorrectionRejectionV2Trial();
    }
  }
  else
  {
    TIRestoreAdaptationAutocorrectionRejectionV2Trial();
  }
}

- (void)rejectionsDatabase
{
  if (!TIAdaptationAutocorrectionRejectionV2Enabled()) {
    return 0;
  }
  id v3 = [(TIKeyboardInputManager *)self config];
  if ([v3 negativeLearningDisabled])
  {

    return 0;
  }
  char v4 = [(TIKeyboardInputManager *)self config];
  int v5 = [v4 usesAdaptation];

  if (!v5) {
    return 0;
  }
  _NSRange result = self->m_rejectionsDatabase.__ptr_.__value_;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)updateInlineCompletionOperatingPointForPrimaryLocale
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[TITrialManagerProxy sharedManager];
  char v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  int v5 = [v4 locale];
  uint64_t v6 = [v3 inlineCompletionOperatingPointOverrideForLocale:v5];

  if (!v6
    || (int v7 = [(TIKeyboardInputManager *)self precisionPointFromTrialOverride:v6],
        v7 == -1))
  {
    if (byte_1EAE411A0) {
      byte_1EAE411A0 = 0;
    }
  }
  else
  {
    int v8 = v7;
    inline_completion_precision_point_override = v7;
    byte_1EAE411A0 = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[TIKeyboardInputManager(InlineCompletions) updateInlineCompletionOperatingPointForPrimaryLocale]";
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Trial: overriding inline completion precision  operating point to %i percent", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (int)precisionPointFromTrialOverride:(id)a3
{
  int result = [a3 intValue];
  if ((result - 70) > 0x14 || ((1 << (result - 70)) & 0x100401) == 0) {
    return -1;
  }
  return result;
}

- (TIInlineCompletionAnalyticsMetadata)inlineCompletionMetadataFrom:(SEL)a3 andBundleId:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v7 = (KB *)a5;
  id v8 = a4;
  int v9 = [v8 inputLanguage];
  KB::utf8_string(v9, (uint64_t)v40);

  uint64_t v10 = [v8 inputRegion];
  KB::utf8_string(v10, (uint64_t)v38);

  __int16 v11 = [v8 inputVariant];
  KB::utf8_string(v11, (uint64_t)v36);

  int v12 = [v8 secondaryLanguage];
  KB::utf8_string(v12, (uint64_t)v34);

  uint64_t v13 = [v8 secondaryRegion];
  KB::utf8_string(v13, (uint64_t)v32);

  unint64_t v14 = [v8 layoutName];
  KB::utf8_string(v14, (uint64_t)v30);

  LOBYTE(v14) = [v8 keyboardType];
  uint64_t v15 = [v8 testingParameters];
  double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FAEF48]];
  KB::utf8_string(v16, (uint64_t)v28);

  uint64_t v17 = [v8 testingParameters];
  uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4FAEF40]];
  KB::utf8_string(v18, (uint64_t)v26);

  unint64_t v19 = [v8 testingParameters];

  BOOL v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FAEF50]];
  KB::utf8_string(v20, (uint64_t)v24);

  KB::utf8_string(v7, (uint64_t)v22);
  KB::String::String((KB::String *)retstr, (const KB::String *)v40);
  KB::String::String((KB::String *)&retstr->var1, (const KB::String *)v38);
  KB::String::String((KB::String *)&retstr->var2, (const KB::String *)v36);
  KB::String::String((KB::String *)&retstr->var3, (const KB::String *)v34);
  KB::String::String((KB::String *)&retstr->var4, (const KB::String *)v32);
  KB::String::String((KB::String *)&retstr->var5, (const KB::String *)v30);
  retstr->var6 = v14;
  KB::String::String((KB::String *)&retstr->var7, (const KB::String *)v22);
  KB::String::String((KB::String *)&retstr->var8, (const KB::String *)v26);
  KB::String::String((KB::String *)&retstr->var9, (const KB::String *)v28);
  KB::String::String((KB::String *)&retstr->var10, (const KB::String *)v24);
  if (v23 && v22[6] == 1) {
    free(v23);
  }
  if (v25 && v24[6] == 1) {
    free(v25);
  }
  if (v27 && v26[6] == 1) {
    free(v27);
  }
  if (v29 && v28[6] == 1) {
    free(v29);
  }
  if (v31 && v30[6] == 1) {
    free(v31);
  }
  if (v33 && v32[6] == 1) {
    free(v33);
  }
  if (v35 && v34[6] == 1) {
    free(v35);
  }
  if (v37 && v36[6] == 1) {
    free(v37);
  }
  if (v39 && v38[6] == 1) {
    free(v39);
  }
  int result = v41;
  if (v41)
  {
    if (v40[6] == 1) {
      free(v41);
    }
  }
  return result;
}

- (int)TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FAEA48]])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA38]])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA50]])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA40]])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA30]])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA88]])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA80]])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA70]])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA58]])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA78]])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA60]])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FAEA68]])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)shouldGenerateInlineCompletions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(TIKeyboardInputManager *)self config];
  if ([v3 isTesting])
  {
    if (HIBYTE(enable_inline_for_testing))
    {
      int v4 = enable_inline_for_testing;

      if (!v4) {
        return 0;
      }
    }
    else
    {
      char v8 = _os_feature_enabled_impl();

      if ((v8 & 1) == 0) {
        return 0;
      }
    }
  }
  else
  {
  }
  if ([(TIKeyboardInputManager *)self isEditingExistingWord]) {
    return 0;
  }
  int v5 = [(TIKeyboardInputManager *)self keyboardState];
  int v6 = [v5 inlineCompletionEnabled];

  if (!v6) {
    return 0;
  }
  if (HIBYTE(inline_completions_override))
  {
    if ((_BYTE)inline_completions_override) {
      return 1;
    }
  }
  else if (_os_feature_enabled_impl())
  {
    return 1;
  }
  uint64_t v10 = [(TIKeyboardInputManager *)self keyboardState];
  __int16 v11 = [v10 clientIdentifier];
  KB::utf8_string(v11, (uint64_t)v12);
  BOOL v7 = isInlineCompletionDefaultAllowlistedApp((KB::String *)v12);
  if (v13 && v12[6] == 1) {
    free(v13);
  }

  return v7;
}

- (BOOL)shouldPromoteInlineCompletionsToAutocorrections:(id)a3 inlineCompletions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!HIBYTE(promote_inline_to_autocorrect))
  {
    if (_os_feature_enabled_impl()) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (!(_BYTE)promote_inline_to_autocorrect) {
    goto LABEL_7;
  }
LABEL_3:
  BOOL v7 = [v5 autocorrection];
  char v8 = [v7 isContinuousPathConversion];

  BOOL v9 = 0;
  if (v6 && (v8 & 1) == 0) {
    BOOL v9 = [v6 count] != 0;
  }
LABEL_8:

  return v9;
}

- (BOOL)shouldPromoteAutocorrectionsToInlineCompletions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (HIBYTE(promote_autocorrect_to_inline))
  {
    if (!(_BYTE)promote_autocorrect_to_inline) {
      goto LABEL_6;
    }
  }
  else if (!_os_feature_enabled_impl())
  {
LABEL_6:
    BOOL v5 = 0;
    goto LABEL_7;
  }
  if ([v4 isContinuousPathConversion]) {
    goto LABEL_6;
  }
  id v7 = [v4 lexiconLocale];
  KB::String::String((KB::String *)v18, (const char *)[v7 UTF8String]);

  m_impl = self->m_impl;
  if (m_impl
    && (uint64_t v9 = m_impl[29]) != 0
    && ((*(uint64_t (**)(uint64_t, unsigned char *))(*(void *)v9 + 168))(v9, v18) & 1) != 0
    || ([v4 sourceMask] & 8) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v10 = NSString;
    __int16 v11 = [v4 candidate];
    int v12 = [v4 lexiconLocale];
    uint64_t v13 = [v10 stringWithFormat:@"Suppressed promotion of %@ (locale: %@, mask: %u) \n", v11, v12, objc_msgSend(v4, "sourceMask")];

    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v13];
    uint64_t v14 = TIInlineCompletionsOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s %s", "-[TIKeyboardInputManager(InlineCompletions) shouldPromoteAutocorrectionsToInlineCompletions:]", objc_msgSend(v13, "UTF8String"));
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    BOOL v5 = 0;
  }
  if (v19 && v18[6] == 1) {
    free(v19);
  }
LABEL_7:

  return v5;
}

- (id)promoteAutocorrectionsToInlineCompletions:(id)a3 matchedStem:(String *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4->var0)
  {
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  WORD2(v20) = 0;
  BYTE6(v20) = 0;
  char v21 = " \t\n";
  LODWORD(v20) = 1048579;
  char v22 = 0;
  KB::string_split_after(&a4->var0, (const KB::String *)&v20, v16);
  if (v21 && BYTE6(v20) == 1) {
    free(v21);
  }
  id v7 = [v6 autocorrection];
  id v8 = [v7 candidate];
  KB::String::String((KB::String *)&v20, (const char *)[v8 UTF8String]);

  KB::String::String((KB::String *)v17, (const KB::String *)(v16[1] - 32));
  uint64_t v9 = *((void *)self->m_impl + 28);
  if (v9)
  {
    atomic_fetch_add((atomic_uint *volatile)v9, 1u);
    if ((unsigned __int16)v20 <= v17[0]) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ((unsigned __int16)v20 > v17[0])
  {
LABEL_7:
    if (KB::CollatorWrapper::sortkey_starts_with((KB::CollatorWrapper *)(*(void *)(v9 + 8) + 72), (_LXLexicon *)&v20, (_LXLexicon *)v17))
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      __int16 v11 = [v6 autocorrection];
      [v11 setConfidence:3];

      int v12 = [v6 autocorrection];
      [v10 addObject:v12];

      uint64_t v13 = [v6 autocorrection];
      uint64_t v14 = [v13 candidate];
      [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Promoting autocorrection to inline completion" candidate:v14];

LABEL_10:
      WTF::RefCounted<KB::DictionaryContainer>::deref((unsigned int *)v9);
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_11:
  if (v19 && v18 == 1) {
    free(v19);
  }
  if (v21 && BYTE6(v20) == 1) {
    free(v21);
  }
  uint64_t v20 = (void **)v16;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v20);
LABEL_19:

  return v10;
}

- (id)filterDuplicatePredictions:(id)a3 autocorrection:(id)a4
{
  double v25 = self;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = *(void *)v30;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "supplementalItemIdentifiers", v25);
        uint64_t v13 = (void *)v12;
        if (v12) {
          uint64_t v14 = (void *)v12;
        }
        else {
          uint64_t v14 = v9;
        }
        id v15 = v14;

        uint64_t v16 = [v6 supplementalItemIdentifiers];
        uint64_t v17 = (void *)v16;
        if (v16) {
          char v18 = (void *)v16;
        }
        else {
          char v18 = v9;
        }
        id v19 = v18;

        uint64_t v20 = [v11 candidate];
        char v21 = [v6 candidate];
        if ([v20 isEqualToString:v21])
        {
          int v22 = [v15 isEqualToArray:v19];

          if (v22)
          {
            uint64_t v23 = [v11 candidate];
            [(TIKeyboardInputManager *)v25 logInlineCompletionsToTypology:@"Removed duplicate prediction due to inline promotion to autocorrection" candidate:v23];

            goto LABEL_17;
          }
        }
        else
        {
        }
        [v27 addObject:v11];
LABEL_17:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  return v27;
}

- (void)promoteInlineCompletionToAutocorrections:(id)a3 predictions:(id)a4 inlineCompletion:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledPredictions:(id *)a7 matchedStem:(String *)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = v15;
  *a7 = v17;
  id v18 = v14;
  *a6 = v18;
  id v19 = [v16 candidate];
  uint64_t v20 = [v19 componentsSeparatedByString:@" "];

  if (a8->var0) {
    unint64_t v21 = KB::String::last((KB::String *)a8) == 32;
  }
  else {
    unint64_t v21 = 1;
  }
  if ([v20 count] > v21)
  {
    long long v57 = [v20 objectAtIndexedSubscript:v21];
    WORD2(v64) = 0;
    BYTE6(v64) = 0;
    long long v65 = " \t\n";
    LODWORD(v64) = 1048579;
    char v66 = 0;
    KB::string_split_after(&a8->var0, (const KB::String *)&v64, v62);
    if (v65 && BYTE6(v64) == 1) {
      free(v65);
    }
    std::string v52 = a7;
    if (a8->var0 && KB::String::last((KB::String *)a8) != 32)
    {
      KB::ns_string((KB *)(v62[1] - 32), v22);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = &stru_1F3F7A998;
    }
    id v56 = self;
    uint64_t v24 = self;
    double v25 = v23;
    id v54 = [(TIKeyboardInputManager *)v24 internalStringToExternal:v23 ignoreCompositionDisabled:1];
    long long v55 = v25;
    int v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE500]), "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:learningFlagsMask:", v57, v54, v25, objc_msgSend(v16, "wordOriginFeedbackID"), objc_msgSend(v16, "usageTrackingMask"), objc_msgSend(v16, "sourceMask"), objc_msgSend(v16, "learningFlagsMask"));
    if ([v20 count] == 1) {
      goto LABEL_14;
    }
    if (HIBYTE(inline_completions_full_acceptance_by_space))
    {
      if (!(_BYTE)inline_completions_full_acceptance_by_space) {
        goto LABEL_14;
      }
    }
    else if ((_os_feature_enabled_impl() & 1) == 0)
    {
LABEL_14:
      id v27 = objc_alloc(MEMORY[0x1E4FAE2A0]);
      if (v18)
      {
        uint64_t v28 = [v18 alternateCorrections];
      }
      else
      {
        uint64_t v28 = 0;
      }
      *a6 = (id)[v27 initWithAutocorrection:v26 alternateCorrections:v28];
      if (v18) {

      }
      long long v29 = [v26 candidate];
      [(TIKeyboardInputManager *)v56 logInlineCompletionsToTypology:@"Promoting (single word) inline completion  to autocorrection" candidate:v29];
LABEL_37:

      long long v64 = (void **)v62;
      std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v64);

      goto LABEL_38;
    }
    id v49 = v20;
    id v51 = v16;
    if (v18)
    {
      long long v30 = [v18 autocorrection];
      long long v31 = [v30 input];

      if (v31)
      {
        long long v32 = [v18 autocorrection];
        uint64_t v33 = (void *)MEMORY[0x1E4FAE318];
        uint64_t v34 = [v32 input];
        uint64_t v35 = [v33 candidateWithUnchangedInput:v34];

        id v36 = objc_alloc(MEMORY[0x1E4FAE2A0]);
        unint64_t v37 = [v18 alternateCorrections];
        *a6 = (id)[v36 initWithAutocorrection:v35 alternateCorrections:v37];
      }
    }
    id v50 = v18;
    long long v29 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v38 = (void *)[v26 copy];
    [v29 addObject:v38];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v53 = v17;
    id v39 = v17;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v59 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          unint64_t v45 = [v44 candidate];
          long long v46 = [v26 candidate];
          char v47 = [v45 isEqualToString:v46];

          if ((v47 & 1) == 0) {
            [v29 addObject:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v41);
    }

    *std::string v52 = (id)[v29 copy];
    unint64_t v48 = [v26 candidate];
    [(TIKeyboardInputManager *)v56 logInlineCompletionsToTypology:@"Promoting (first word of multi word) inline completion  to prediction" candidate:v48];

    id v18 = v50;
    id v16 = v51;
    id v17 = v53;
    uint64_t v20 = v49;
    goto LABEL_37;
  }
  [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Should never get here - if the stem ends in a space and inline completion is produced, it has to have at least two words" candidate:0];
LABEL_38:
}

- (void)reconcileInlineCompletionAndAutocorrections:(id)a3 inlineCompletions:(id)a4 predictions:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledInlineCompletions:(id *)a7 outReconciledPredictions:(id *)a8 matchedStem:(String *)a9
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = [v15 autocorrection];
  id v19 = v15;
  *a6 = v19;
  id v20 = v16;
  *a7 = v20;
  id v21 = v17;
  *a8 = v21;
  if ([(TIKeyboardInputManager *)self shouldPromoteInlineCompletionsToAutocorrections:v19 inlineCompletions:v20])
  {
    id v54 = v20;
    long long v55 = a8;
    id v56 = v21;
    int v22 = [v20 objectAtIndexedSubscript:0];
    if (![v18 isAutocorrection]) {
      goto LABEL_5;
    }
    uint64_t v23 = [v18 staticLinguisticLikelihood];
    if (!v23) {
      goto LABEL_5;
    }
    uint64_t v24 = (void *)v23;
    double v25 = [v22 staticLinguisticLikelihood];
    [v25 floatValue];
    float v27 = v26;
    [v18 staticLinguisticLikelihood];
    v29 = uint64_t v28 = v18;
    [v29 floatValue];
    float v31 = v30;

    id v18 = v28;
    if (v27 <= v31)
    {
      id v49 = [v22 candidate];
      [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Inline completion linguistically inferior to an autocorrect candidate and will be suppressed. Inline completion candidate: " candidate:v49];

      *a7 = 0;
    }
    else
    {
LABEL_5:
      long long v32 = [v22 candidate];
      [(TIKeyboardInputManager *)self logInlineCompletionsToTypology:@"Inline completion linguistically superior - will promote to autocorrect. Inline completion: " candidate:v32];

      KB::String::String((KB::String *)v66, (const KB::String *)a9);
      [(TIKeyboardInputManager *)self promoteInlineCompletionToAutocorrections:v19 predictions:v56 inlineCompletion:v22 outReconciledAutocorrections:a6 outReconciledPredictions:v55 matchedStem:v66];
      if (v67 && v66[6] == 1) {
        free(v67);
      }
      if (*a6)
      {
        uint64_t v33 = [v22 supplementalItemIdentifiers];
        uint64_t v34 = [v33 count];

        if (v34)
        {
          std::string v52 = v18;
          id v53 = v19;
          uint64_t v35 = [v22 candidate];
          id v36 = [v35 componentsSeparatedByString:@" "];
          uint64_t v37 = [v36 count];

          if (v37 == 1)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              long long v65 = "-[TIKeyboardInputManager(InlineCompletions) reconcileInlineCompletionAndAutocorrections:inlineComple"
                    "tions:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictio"
                    "ns:matchedStem:]";
              _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  The inline completion being offered contains supplemental identifiers, removing it, and offering a prediction instead", buf, 0xCu);
            }
            unint64_t v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", self, a7);
            id v39 = (void *)[v22 copy];
            [v38 addObject:v39];

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v40 = v56;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v63 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v58 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  unint64_t v45 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  long long v46 = [v45 candidate];
                  char v47 = [v22 candidate];
                  char v48 = [v46 isEqualToString:v47];

                  if ((v48 & 1) == 0) {
                    [v38 addObject:v45];
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v57 objects:v63 count:16];
              }
              while (v42);
            }

            *long long v55 = (id)[v38 copy];
            self = v50;
            a7 = v51;
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            long long v65 = "-[TIKeyboardInputManager(InlineCompletions) reconcileInlineCompletionAndAutocorrections:inlineCompleti"
                  "ons:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictions:matchedStem:]";
            _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  The inline completeion being offered contains supplemental identifiers, but it contained more than one word", buf, 0xCu);
          }
          [v22 setSupplementalItemIdentifiers:0];
          id v18 = v52;
          id v19 = v53;
        }
      }
    }

    id v20 = v54;
    id v21 = v56;
  }
  if ([v18 isAutocorrection] && (!*a7 || !objc_msgSend(*a7, "count")))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(TIKeyboardInputManager *)self shouldPromoteAutocorrectionsToInlineCompletions:v18])
      {
        KB::String::String((KB::String *)v61, (const KB::String *)a9);
        *a7 = [(TIKeyboardInputManager *)self promoteAutocorrectionsToInlineCompletions:v19 matchedStem:v61];
        if (v62)
        {
          if (v61[6] == 1) {
            free(v62);
          }
        }
      }
    }
  }
}

- (id)inlineCompletions:(CandidateCollection *)a3 matchedStem:(String *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0x1CAC083126E978D5 * ((a3->var0.var1 - a3->var0.var0) >> 3)];
  WORD2(v18) = 0;
  BYTE6(v18) = 0;
  id v19 = " \t\n";
  LODWORD(v18) = 1048579;
  char v20 = 0;
  KB::string_split_after(&a4->var0, (const KB::String *)&v18, v17);
  if (v19 && BYTE6(v18) == 1) {
    free(v19);
  }
  if (a4->var0) {
    KB::String::String((KB::String *)&v18, (const KB::String *)(v17[1] - 32));
  }
  else {
    KB::String::String((KB::String *)&v18, "");
  }
  uint64_t v9 = KB::ns_string((KB *)&v18, v8);
  if (v19 && BYTE6(v18) == 1) {
    free(v19);
  }
  uint64_t v10 = [(TIKeyboardInputManager *)self internalStringToExternal:v9 ignoreCompositionDisabled:1];
  int var0 = a3->var0.var0;
  var1 = a3->var0.var1;
  if (a3->var0.var0 != var1)
  {
    do
    {
      if (*(void *)var0)
      {
        uint64_t v13 = [(TIKeyboardInputManager *)self autocorrectionCandidateForInput:v10 rawInput:v9 withCandidate:var0 insertingSpace:0 sharedPrefixLength:0];
        [v13 setToucanInlineCompletionCandidate:1];
        LODWORD(v14) = *(_DWORD *)(*((void *)var0 + 1) + 240 * *(void *)var0 - 184);
        id v15 = [NSNumber numberWithFloat:v14];
        [v13 setStaticLinguisticLikelihood:v15];

        [v7 addObject:v13];
      }
      int var0 = (Candidate *)((char *)var0 + 1000);
    }
    while (var0 != var1);
  }

  id v18 = (void **)v17;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v18);

  return v7;
}

- (void)logInlineCompletionsToTypology:(id)a3 candidate:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TIInlineCompletionsOSLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSString stringWithFormat:@"%s %@", "-[TIKeyboardInputManager(InlineCompletions) logInlineCompletionsToTypology:candidate:]", v6];
    *(_DWORD *)buf = 138412290;
    double v14 = v9;
    _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (v7) {
    uint64_t v10 = {;
  }
    __int16 v11 = TIInlineCompletionsOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [NSString stringWithFormat:@"%s %@", "-[TIKeyboardInputManager(InlineCompletions) logInlineCompletionsToTypology:candidate:]", v10];
      *(_DWORD *)buf = 138412290;
      double v14 = v12;
      _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v10];
  }
  else
  {
    [(TIKeyboardInputManager *)self logToTypologyRecorderWithString:v6];
  }
}

@end