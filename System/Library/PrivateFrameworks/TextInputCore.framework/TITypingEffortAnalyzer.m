@interface TITypingEffortAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (BOOL)hasCursorMovement;
- (BOOL)hasEmojiInKeyboardInputs:(id)a3;
- (BOOL)hasEmojiInput;
- (BOOL)isEmojiSearchCandidateSelection:(id)a3;
- (BOOL)isFlickInput:(id)a3;
- (BOOL)isPopupVariantInput:(id)a3 inputMode:(id)a4;
- (BOOL)isTenKeyInputMode:(id)a3;
- (TITypingEffortAnalyzer)init;
- (id)countActions;
- (id)countOutput;
- (id)keyStringWithCode:(int64_t)a3 fromLayout:(id)a4;
- (int)countComposedCharactersInText:(id)a3;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)addActionsForArrowKey:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5;
- (void)addActionsForCursorEvent:(id)a3 lastAction:(id)a4 nextAction:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7;
- (void)addActionsForCut:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5;
- (void)addActionsForDeleteWord:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5;
- (void)addActionsForPaste:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5;
- (void)addActionsForWordEntry:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5;
- (void)addCountsForAlignedEntry:(id)a3 toOutputSummary:(id)a4;
- (void)addCountsForEmojiInputs:(id)a3 toOutputSummary:(id)a4;
- (void)addCountsForPropertyWithName:(id)a3 andEmojiSearchPropertyName:(id)a4 contributesToTotal:(BOOL)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7;
- (void)addCountsForWord:(id)a3 toOutputSummary:(id)a4;
- (void)addKeyboardInputActionsForKeyboardInputs:(id)a3 inputMode:(id)a4 toActionSummary:(id)a5 andKeyboardInputTouches:(id)a6 emojiSearchMode:(BOOL)a7;
- (void)addPathAndCandidateBarActionsForWordEntry:(id)a3 toActionSummary:(id)a4 andPathTouches:(id)a5 emojiSearchMode:(BOOL)a6;
- (void)addPathWeightActionsForTouches:(id)a3 withLayout:(id)a4 forWord:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7;
- (void)addSpecialKeyActionsForFirstTouch:(id)a3 andLastTouch:(id)a4 fromLayout:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7;
- (void)addTouchRelatedActionsForTouches:(id)a3 layouts:(id)a4 acceptedCandidate:(id)a5 toActionSummary:(id)a6 keyboardInputTouches:(id)a7 pathTouches:(id)a8 emojiSearchMode:(BOOL)a9;
- (void)dispatchEventWithActionSummary:(id)a3 outputSummary:(id)a4;
- (void)registerEventSpec;
@end

@implementation TITypingEffortAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignedSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

- (void)dispatchEventWithActionSummary:(id)a3 outputSummary:(id)a4
{
  v146[86] = *MEMORY[0x1E4F143B8];
  session = self->_session;
  id v7 = a4;
  id v8 = a3;
  v9 = [(TITypingSession *)session userActionHistory];
  v10 = [v9 lastObject];
  uint64_t v11 = [v10 keyboardState];

  v12 = [TIKBAnalyticsMetricsContext alloc];
  v13 = [(TITypingSession *)self->_session sessionParams];
  v14 = [v13 activeInputModes];
  v15 = [(TITypingSession *)self->_session sessionParams];
  v16 = [v15 testingParameters];
  v144 = (void *)v11;
  v17 = [(TIKBAnalyticsMetricsContext *)v12 initWithKeyboardState:v11 activeInputModes:v14 testingParameters:v16];

  v18 = [(TITypingSession *)self->_session userActionHistory];
  v19 = [v18 firstObject];
  v20 = [v19 keyboardState];
  v21 = [v20 documentState];

  v22 = [v21 contextBeforeInput];
  if (v22)
  {
    v23 = [v21 contextBeforeInput];
    BOOL v24 = [v23 length] != 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  v25 = [v21 contextAfterInput];
  if (v25)
  {
    v26 = [v21 contextAfterInput];
    BOOL v27 = [v26 length] != 0;
  }
  else
  {
    BOOL v27 = 0;
  }

  v28 = [v21 selectedText];
  v143 = v21;
  if (v28)
  {
    v29 = [v21 selectedText];
    uint64_t v30 = [v29 length];

    if (v30) {
      BOOL v27 = 1;
    }
  }

  uint64_t v31 = v27 | v24;
  BOOL v32 = (int)[v8 totalInputActions] > 0;
  BOOL v33 = (int)[v7 charactersOutput] > 0;
  self->_hasCursorMovement = (int)[v8 cursorMovements] > 0;
  int v34 = [v8 emojiSelections];
  int v35 = [v8 emojiCandidateSelections] + v34;
  int v36 = [v8 emojiSearchCandidateSelections];
  if ((v35 + v36 < 0) ^ __OFADD__(v35, v36) | (v35 + v36 == 0)) {
    BOOL v37 = 0;
  }
  else {
    BOOL v37 = 1;
  }
  self->_hasEmojiInput = v37;
  +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:self->_alignedSession];
  double v39 = v38;
  v145[0] = @"totalInputActions";
  v142 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "totalInputActions"));
  v146[0] = v142;
  v145[1] = @"characterKeyTaps";
  v141 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "characterKeyTaps"));
  v146[1] = v141;
  v145[2] = @"backspaceKeyTaps";
  v140 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "backspaceKeyTaps"));
  v146[2] = v140;
  v145[3] = @"spaceKeyTaps";
  v139 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "spaceKeyTaps"));
  v146[3] = v139;
  v145[4] = @"returnKeyTaps";
  v138 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "returnKeyTaps"));
  v146[4] = v138;
  v145[5] = @"shiftKeyTaps";
  v137 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "shiftKeyTaps"));
  v146[5] = v137;
  v145[6] = @"moreKeyTaps";
  v136 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "moreKeyTaps"));
  v146[6] = v136;
  v145[7] = @"emojiKeyTaps";
  v135 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiKeyTaps"));
  v146[7] = v135;
  v145[8] = @"unknownKeyTaps";
  v134 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "unknownKeyTaps"));
  v146[8] = v134;
  v145[9] = @"paths";
  v133 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "paths"));
  v146[9] = v133;
  v145[10] = @"pathsWithWeight1";
  v132 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight1"));
  v146[10] = v132;
  v145[11] = @"pathsWithWeight2";
  v131 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight2"));
  v146[11] = v131;
  v145[12] = @"pathsWithWeight3";
  v130 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight3"));
  v146[12] = v130;
  v145[13] = @"pathsWithWeight4";
  v129 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight4"));
  v146[13] = v129;
  v145[14] = @"pathsWithWeight5";
  v128 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight5"));
  v146[14] = v128;
  v145[15] = @"pathsWithWeight6";
  v127 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight6"));
  v146[15] = v127;
  v145[16] = @"pathsWithWeight7";
  v126 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight7"));
  v146[16] = v126;
  v145[17] = @"pathsWithWeight8";
  v125 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight8"));
  v146[17] = v125;
  v145[18] = @"pathsWithWeight9";
  v124 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight9"));
  v146[18] = v124;
  v145[19] = @"pathsWithWeight10";
  v123 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pathsWithWeight10"));
  v146[19] = v123;
  v145[20] = @"flicks";
  v122 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "flicks"));
  v146[20] = v122;
  v145[21] = @"gestures";
  v121 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "gestures"));
  v146[21] = v121;
  v145[22] = @"popupVariants";
  v120 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "popupVariants"));
  v146[22] = v120;
  v145[23] = @"cursorMovements";
  v119 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "cursorMovements"));
  v146[23] = v119;
  v145[24] = @"candidateSelections";
  v118 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "candidateSelections"));
  v146[24] = v118;
  v145[25] = @"cuts";
  v117 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "cuts"));
  v146[25] = v117;
  v145[26] = @"pastes";
  v116 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pastes"));
  v146[26] = v116;
  v145[27] = @"emojiSelections";
  v115 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSelections"));
  v146[27] = v115;
  v145[28] = @"emojiCandidateSelections";
  v114 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiCandidateSelections"));
  v146[28] = v114;
  v145[29] = @"emojiSearchCharacterKeyTaps";
  v113 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchCharacterKeyTaps"));
  v146[29] = v113;
  v145[30] = @"emojiSearchBackspaceKeyTaps";
  v112 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchBackspaceKeyTaps"));
  v146[30] = v112;
  v145[31] = @"emojiSearchSpaceKeyTaps";
  v111 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchSpaceKeyTaps"));
  v146[31] = v111;
  v145[32] = @"emojiSearchShiftKeyTaps";
  v110 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchShiftKeyTaps"));
  v146[32] = v110;
  v145[33] = @"emojiSearchMoreKeyTaps";
  v109 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchMoreKeyTaps"));
  v146[33] = v109;
  v145[34] = @"emojiSearchEmojiKeyTaps";
  v108 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchEmojiKeyTaps"));
  v146[34] = v108;
  v145[35] = @"emojiSearchUnknownKeyTaps";
  v107 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchUnknownKeyTaps"));
  v146[35] = v107;
  v145[36] = @"emojiSearchPaths";
  v106 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPaths"));
  v146[36] = v106;
  v145[37] = @"emojiSearchPathsWithWeight1";
  v105 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight1"));
  v146[37] = v105;
  v145[38] = @"emojiSearchPathsWithWeight2";
  v104 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight2"));
  v146[38] = v104;
  v145[39] = @"emojiSearchPathsWithWeight3";
  v103 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight3"));
  v146[39] = v103;
  v145[40] = @"emojiSearchPathsWithWeight4";
  v102 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight4"));
  v146[40] = v102;
  v145[41] = @"emojiSearchPathsWithWeight5";
  v101 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight5"));
  v146[41] = v101;
  v145[42] = @"emojiSearchPathsWithWeight6";
  v100 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight6"));
  v146[42] = v100;
  v145[43] = @"emojiSearchPathsWithWeight7";
  v99 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight7"));
  v146[43] = v99;
  v145[44] = @"emojiSearchPathsWithWeight8";
  v98 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight8"));
  v146[44] = v98;
  v145[45] = @"emojiSearchPathsWithWeight9";
  v97 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight9"));
  v146[45] = v97;
  v145[46] = @"emojiSearchPathsWithWeight10";
  v96 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight10"));
  v146[46] = v96;
  v145[47] = @"emojiSearchFlicks";
  v95 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchFlicks"));
  v146[47] = v95;
  v145[48] = @"emojiSearchGestures";
  v94 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchGestures"));
  v146[48] = v94;
  v145[49] = @"emojiSearchPopupVariants";
  v93 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchPopupVariants"));
  v146[49] = v93;
  v145[50] = @"emojiSearchCursorMovements";
  v92 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchCursorMovements"));
  v146[50] = v92;
  v145[51] = @"emojiSearchCandidateSelections";
  v91 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchCandidateSelections"));
  v146[51] = v91;
  v145[52] = @"emojiSearchCuts";
  v90 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "emojiSearchCuts"));
  v146[52] = v90;
  v145[53] = @"emojiSearchPastes";
  v40 = NSNumber;
  uint64_t v41 = [v8 emojiSearchPastes];

  v89 = [v40 numberWithInt:v41];
  v146[53] = v89;
  v145[54] = @"emojisOutput";
  v88 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "emojisOutput"));
  v146[54] = v88;
  v145[55] = @"wordsOutput";
  v87 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "wordsOutput"));
  v146[55] = v87;
  v145[56] = @"charactersOutput";
  v86 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "charactersOutput"));
  v146[56] = v86;
  v145[57] = @"char1WordsOutput";
  v85 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char1WordsOutput"));
  v146[57] = v85;
  v145[58] = @"char2WordsOutput";
  v84 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char2WordsOutput"));
  v146[58] = v84;
  v145[59] = @"char3WordsOutput";
  v83 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char3WordsOutput"));
  v146[59] = v83;
  v145[60] = @"char4WordsOutput";
  v82 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char4WordsOutput"));
  v146[60] = v82;
  v145[61] = @"char5WordsOutput";
  v81 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char5WordsOutput"));
  v146[61] = v81;
  v145[62] = @"char6WordsOutput";
  v80 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char6WordsOutput"));
  v146[62] = v80;
  v145[63] = @"char7WordsOutput";
  v79 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char7WordsOutput"));
  v146[63] = v79;
  v145[64] = @"char8WordsOutput";
  v78 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "char8WordsOutput"));
  v146[64] = v78;
  v145[65] = @"char9PlusWordsOutput";
  v42 = NSNumber;
  uint64_t v43 = [v7 char9PlusWordsOutput];

  v77 = [v42 numberWithInt:v43];
  v146[65] = v77;
  v145[66] = @"hasExistingText";
  v75 = [NSNumber numberWithBool:v31];
  v146[66] = v75;
  v145[67] = @"hasInput";
  v74 = [NSNumber numberWithBool:v32];
  v146[67] = v74;
  v145[68] = @"hasOutput";
  v73 = [NSNumber numberWithBool:v33];
  v146[68] = v73;
  v145[69] = @"hasCursorMovement";
  v72 = [NSNumber numberWithBool:self->_hasCursorMovement];
  v146[69] = v72;
  v145[70] = @"hasEmojiInput";
  v71 = [NSNumber numberWithBool:self->_hasEmojiInput];
  v146[70] = v71;
  v145[71] = kFeatureKeyboardUsage;
  v70 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v69 = [v70 featureUsageMetricFromName:kFeatureKeyboardUsage forContext:v17];
  v146[71] = v69;
  v145[72] = kFeatureContinuousPathUsage;
  v68 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v67 = [v68 featureUsageMetricFromName:kFeatureContinuousPathUsage forContext:v17];
  v146[72] = v67;
  v145[73] = kFeatureAutocorrectionUsage;
  v66 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v65 = [v66 featureUsageMetricFromName:kFeatureAutocorrectionUsage forContext:v17];
  v146[73] = v65;
  v145[74] = kFeatureCandidateBarUsage;
  v64 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v63 = [v64 featureUsageMetricFromName:kFeatureCandidateBarUsage forContext:v17];
  v146[74] = v63;
  v145[75] = kFeatureMultilingualUsage;
  v62 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v61 = [v62 featureUsageMetricFromName:kFeatureMultilingualUsage forContext:v17];
  v146[75] = v61;
  v145[76] = kFeatureStringTypingSpeed;
  v60 = [(TITypingSession *)self->_session featureUsageMetricsCache];
  v59 = [v60 featureUsageMetricFromName:kFeatureStringTypingSpeed forContext:v17];
  v146[76] = v59;
  v145[77] = kFeatureStringAssetAvailabilityStatus;
  v58 = [(TITypingSession *)self->_session sessionParams];
  uint64_t v44 = [v58 assetAvailabilityStatus];
  v45 = @"Installed";
  if (!v44) {
    v45 = @"Unavailable";
  }
  v46 = v45;
  v146[77] = v46;
  v145[78] = kFeatureStringSessionAlignmentConfidence;
  v47 = [MEMORY[0x1E4FAE268] bucketRatioWithValue:10 bucketCount:v39];
  v146[78] = v47;
  v145[79] = kFeatureStringKeyboardLanguage;
  v48 = [(TIAnalyticsMetricsContext *)v17 inputLanguage];
  v146[79] = v48;
  v145[80] = kFeatureStringKeyboardRegion;
  v49 = [(TIAnalyticsMetricsContext *)v17 inputRegion];
  v146[80] = v49;
  v145[81] = kFeatureStringKeyboardVariant;
  v50 = [(TIKBAnalyticsMetricsContext *)v17 inputVariant];
  v146[81] = v50;
  v145[82] = kFeatureStringKeyboardSecondaryLanguage;
  v51 = [(TIKBAnalyticsMetricsContext *)v17 secondaryLanguage];
  v146[82] = v51;
  v145[83] = kFeatureStringKeyboardSecondaryRegion;
  [(TIKBAnalyticsMetricsContext *)v17 secondaryRegion];
  v53 = v52 = v17;
  v146[83] = v53;
  v145[84] = kFeatureStringKeyboardLayout;
  v54 = [(TIKBAnalyticsMetricsContext *)v52 layoutName];
  v146[84] = v54;
  v145[85] = kFeatureStringKeyboardType;
  v55 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:[(TIKBAnalyticsMetricsContext *)v52 keyboardType]];
  v146[85] = v55;
  v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:86];

  v56 = [MEMORY[0x1E4FAE260] sharedInstance];
  v57 = [(TIKBAnalyticsMetricsContext *)v52 testingParameters];
  [v56 dispatchEventWithName:@"typingEffort" payload:v76 testingParameters:v57 allowSparsePayload:0];
}

- (void)registerEventSpec
{
  v113[86] = *MEMORY[0x1E4F143B8];
  v88 = (void *)MEMORY[0x1E4FAE248];
  v112 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalInputActions" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[0] = v112;
  v111 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"characterKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[1] = v111;
  v110 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"backspaceKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[2] = v110;
  v109 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"spaceKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[3] = v109;
  v108 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"returnKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[4] = v108;
  v107 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"shiftKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[5] = v107;
  v106 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"moreKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[6] = v106;
  v105 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[7] = v105;
  v104 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"unknownKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[8] = v104;
  v103 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"paths" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[9] = v103;
  v102 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight1" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[10] = v102;
  v101 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight2" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[11] = v101;
  v100 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight3" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[12] = v100;
  v99 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight4" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[13] = v99;
  v98 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight5" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[14] = v98;
  v97 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight6" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[15] = v97;
  v96 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight7" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[16] = v96;
  v95 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight8" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[17] = v95;
  v94 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight9" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[18] = v94;
  v93 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pathsWithWeight10" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[19] = v93;
  v92 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"flicks" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[20] = v92;
  v91 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"gestures" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[21] = v91;
  v90 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"popupVariants" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[22] = v90;
  v87 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"cursorMovements" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[23] = v87;
  v86 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"candidateSelections" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[24] = v86;
  v85 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"cuts" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[25] = v85;
  v84 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pastes" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[26] = v84;
  v83 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSelections" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[27] = v83;
  v82 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiCandidateSelections" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[28] = v82;
  v81 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchCharacterKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[29] = v81;
  v80 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchBackspaceKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[30] = v80;
  v79 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchSpaceKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[31] = v79;
  v78 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchShiftKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[32] = v78;
  v77 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchMoreKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[33] = v77;
  v76 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchEmojiKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[34] = v76;
  v75 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchUnknownKeyTaps" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[35] = v75;
  v74 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPaths" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[36] = v74;
  v73 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight1" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[37] = v73;
  v72 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight2" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[38] = v72;
  v71 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight3" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[39] = v71;
  v70 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight4" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[40] = v70;
  v69 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight5" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[41] = v69;
  v68 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight6" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[42] = v68;
  v67 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight7" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[43] = v67;
  v66 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight8" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[44] = v66;
  v65 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight9" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[45] = v65;
  v64 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPathsWithWeight10" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[46] = v64;
  v63 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchFlicks" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[47] = v63;
  v62 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchGestures" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[48] = v62;
  v61 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPopupVariants" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[49] = v61;
  v60 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchCursorMovements" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[50] = v60;
  v59 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchCandidateSelections" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[51] = v59;
  v58 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchCuts" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[52] = v58;
  v57 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearchPastes" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[53] = v57;
  v56 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojisOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[54] = v56;
  v55 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"wordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[55] = v55;
  v54 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"charactersOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[56] = v54;
  v53 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char1WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[57] = v53;
  v52 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char2WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[58] = v52;
  v51 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char3WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[59] = v51;
  v50 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char4WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[60] = v50;
  v49 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char5WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[61] = v49;
  v48 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char6WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[62] = v48;
  v47 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char7WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[63] = v47;
  v46 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char8WordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[64] = v46;
  v45 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"char9PlusWordsOutput" minValue:&unk_1F3FA7C70 maxValue:0 significantDigits:0];
  v113[65] = v45;
  uint64_t v44 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasExistingText"];
  v113[66] = v44;
  uint64_t v43 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasInput"];
  v113[67] = v43;
  v42 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasOutput"];
  v113[68] = v42;
  uint64_t v41 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasCursorMovement"];
  v113[69] = v41;
  v40 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasEmojiInput"];
  v113[70] = v40;
  v2 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v3 = kFeatureKeyboardUsage;
  double v39 = TIFeatureUsageAllowedValues();
  double v38 = [v2 stringFieldSpecWithName:v3 allowedValues:v39];
  v113[71] = v38;
  v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureContinuousPathUsage;
  BOOL v37 = TIFeatureUsageAllowedValues();
  int v36 = [v4 stringFieldSpecWithName:v5 allowedValues:v37];
  v113[72] = v36;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureAutocorrectionUsage;
  int v35 = TIFeatureUsageAllowedValues();
  int v34 = [v6 stringFieldSpecWithName:v7 allowedValues:v35];
  v113[73] = v34;
  id v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureCandidateBarUsage;
  BOOL v33 = TIFeatureUsageAllowedValues();
  BOOL v32 = [v8 stringFieldSpecWithName:v9 allowedValues:v33];
  v113[74] = v32;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureMultilingualUsage;
  uint64_t v31 = TIFeatureUsageAllowedValues();
  uint64_t v30 = [v10 stringFieldSpecWithName:v11 allowedValues:v31];
  v113[75] = v30;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureStringTypingSpeed;
  v29 = TITypingSpeedAllowedValues();
  v28 = [v12 stringFieldSpecWithName:v13 allowedValues:v29];
  v113[76] = v28;
  v14 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v15 = kFeatureStringAssetAvailabilityStatus;
  BOOL v27 = TIAssetAvailabilityStatusAllowedValues();
  v16 = [v14 stringFieldSpecWithName:v15 allowedValues:v27];
  v113[77] = v16;
  v17 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:kFeatureStringSessionAlignmentConfidence minValue:&unk_1F3FA7C70 maxValue:&unk_1F3FA7C88 significantDigits:0];
  v113[78] = v17;
  v18 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v113[79] = v18;
  v19 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v113[80] = v19;
  v20 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v113[81] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v113[82] = v21;
  v22 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v113[83] = v22;
  v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v113[84] = v23;
  BOOL v24 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v113[85] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:86];
  v89 = [v88 eventSpecWithName:@"typingEffort" inputModeRequired:0 fieldSpecs:v25];

  v26 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v26 registerEventSpec:v89];
}

- (void)addCountsForPropertyWithName:(id)a3 andEmojiSearchPropertyName:(id)a4 contributesToTotal:(BOOL)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v21 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = [v21 isEqualToString:@"emojiSelections"] | v7;
  if (v14 == 1 && !self->_emojiPlaneActive)
  {
    objc_msgSend(v13, "setEmojiKeyTaps:", objc_msgSend(v13, "emojiKeyTaps") + 1);
    objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
    self->_emojiPlaneActive = 1;
  }
  id v15 = v21;
  if (v7)
  {
    if (!self->_emojiSearchActive)
    {
      objc_msgSend(v13, "setEmojiSearchCursorMovements:", objc_msgSend(v13, "emojiSearchCursorMovements") + 1);
      objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
      id v15 = v21;
      self->_emojiSearchActive = 1;
    }
  }
  else
  {
    if (self->_emojiSearchActive)
    {
      objc_msgSend(v13, "setEmojiSearchEmojiKeyTaps:", objc_msgSend(v13, "emojiSearchEmojiKeyTaps") + 1);
      objc_msgSend(v13, "setReturnKeyTaps:", objc_msgSend(v13, "returnKeyTaps") - 1);
      id v15 = v21;
      self->_emojiSearchActive = 0;
    }
    if ((v14 & 1) == 0 && self->_emojiPlaneActive)
    {
      objc_msgSend(v13, "setMoreKeyTaps:", objc_msgSend(v13, "moreKeyTaps") + 1);
      objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
      id v15 = v21;
      self->_emojiPlaneActive = 0;
    }
  }
  if (v12 != 0 && v7) {
    v16 = v12;
  }
  else {
    v16 = v15;
  }
  id v17 = v16;
  v18 = [v13 valueForKey:v17];
  int v19 = [v18 intValue];

  v20 = [NSNumber numberWithInt:(v19 + 1)];
  [v13 setValue:v20 forKey:v17];

  if (v9) {
    objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
  }
}

- (int)countComposedCharactersInText:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__TITypingEffortAnalyzer_countComposedCharactersInText___block_invoke;
  v6[3] = &unk_1E6E2D2F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return (int)v3;
}

uint64_t __56__TITypingEffortAnalyzer_countComposedCharactersInText___block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)hasEmojiInKeyboardInputs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "string", (void)v10);
        char v8 = [v7 _containsEmoji];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)addCountsForWord:(id)a3 toOutputSummary:(id)a4
{
  id v7 = a4;
  int v6 = [(TITypingEffortAnalyzer *)self countComposedCharactersInText:a3];
  if (v6 >= 1)
  {
    switch(v6)
    {
      case 1:
        objc_msgSend(v7, "setChar1WordsOutput:", objc_msgSend(v7, "char1WordsOutput") + 1);
        break;
      case 2:
        objc_msgSend(v7, "setChar2WordsOutput:", objc_msgSend(v7, "char2WordsOutput") + 1);
        break;
      case 3:
        objc_msgSend(v7, "setChar3WordsOutput:", objc_msgSend(v7, "char3WordsOutput") + 1);
        break;
      case 4:
        objc_msgSend(v7, "setChar4WordsOutput:", objc_msgSend(v7, "char4WordsOutput") + 1);
        break;
      case 5:
        objc_msgSend(v7, "setChar5WordsOutput:", objc_msgSend(v7, "char5WordsOutput") + 1);
        break;
      case 6:
        objc_msgSend(v7, "setChar6WordsOutput:", objc_msgSend(v7, "char6WordsOutput") + 1);
        break;
      case 7:
        objc_msgSend(v7, "setChar7WordsOutput:", objc_msgSend(v7, "char7WordsOutput") + 1);
        break;
      case 8:
        objc_msgSend(v7, "setChar8WordsOutput:", objc_msgSend(v7, "char8WordsOutput") + 1);
        break;
      default:
        objc_msgSend(v7, "setChar9PlusWordsOutput:", objc_msgSend(v7, "char9PlusWordsOutput") + 1);
        break;
    }
    objc_msgSend(v7, "setWordsOutput:", objc_msgSend(v7, "wordsOutput") + 1);
  }
}

- (void)addCountsForEmojiInputs:(id)a3 toOutputSummary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) string];
        int v12 = [v11 _containsEmoji];

        if (v12) {
          objc_msgSend(v6, "setEmojisOutput:", objc_msgSend(v6, "emojisOutput") + 1);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)addCountsForAlignedEntry:(id)a3 toOutputSummary:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v20 originalWord];
  uint64_t v8 = [v7 editedEntry];
  uint64_t v9 = [v20 originalWord];
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 editedEntry];

    uint64_t v10 = (void *)v11;
  }

  int v12 = [v10 acceptedCandidate];
  long long v13 = [v12 candidate];
  long long v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v15 = [v13 stringByTrimmingCharactersInSet:v14];

  long long v16 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  id v17 = [(id)v15 stringByTrimmingCharactersInSet:v16];

  uint64_t v18 = [v10 keyboardState];
  LOBYTE(v15) = [v18 emojiSearchMode];

  if ((v15 & 1) == 0)
  {
    if ([v17 _containsEmoji])
    {
      objc_msgSend(v6, "setEmojisOutput:", objc_msgSend(v6, "emojisOutput") + 1);
    }
    else
    {
      int v19 = [v20 alignedKeyboardInputs];
      [(TITypingEffortAnalyzer *)self addCountsForEmojiInputs:v19 toOutputSummary:v6];

      [(TITypingEffortAnalyzer *)self addCountsForWord:v17 toOutputSummary:v6];
    }
  }
}

- (id)countOutput
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(TITypingSessionAligned *)self->_alignedSession alignedEntries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(TITypingEffortAnalyzer *)self addCountsForAlignedEntry:*(void *)(*((void *)&v11 + 1) + 8 * i) toOutputSummary:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(TITypingSessionAligned *)self->_alignedSession completeText];
  objc_msgSend(v3, "setCharactersOutput:", -[TITypingEffortAnalyzer countComposedCharactersInText:](self, "countComposedCharactersInText:", v9));

  return v3;
}

- (BOOL)isEmojiSearchCandidateSelection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 acceptedString];
  if (v4)
  {
    uint64_t v5 = [v3 acceptedString];
    uint64_t v6 = [v5 length];

    if (v6
      && ([v3 acceptedCandidate],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isContinuousPathConversion],
          v7,
          (v8 & 1) == 0)
      && ([v3 wordEntryType] & 4) != 0)
    {
      uint64_t v10 = [v3 acceptedCandidate];
      long long v11 = [v10 candidate];
      LOBYTE(v4) = [v11 _containsEmoji];
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)addActionsForPaste:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
}

- (void)addActionsForCut:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
}

- (void)addActionsForArrowKey:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
}

- (void)addActionsForCursorEvent:(id)a3 lastAction:(id)a4 nextAction:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  BOOL v7 = a7;
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(TITypingSession *)self->_session userActionHistory];
  id v16 = [v15 firstObject];
  if (v16 == v26)
  {

    goto LABEL_17;
  }
  id v17 = [(TITypingSession *)self->_session userActionHistory];
  id v18 = [v17 lastObject];

  if (v18 == v26) {
    goto LABEL_17;
  }
  int v19 = [v12 keyboardState];
  int v20 = [v19 emojiSearchMode];
  int v21 = v20;
  if (!v7)
  {
    if (v20)
    {
      v23 = v12;
LABEL_13:
      int v24 = [v23 actionType];

      if (v24 == 2) {
        goto LABEL_17;
      }
LABEL_16:
      [(TITypingEffortAnalyzer *)self addCountsForPropertyWithName:@"cursorMovements" andEmojiSearchPropertyName:@"emojiSearchCursorMovements" contributesToTotal:1 toActionSummary:v14 emojiSearchMode:v7];
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }

  if (!v21) {
    goto LABEL_17;
  }
  v22 = [v12 keyboardState];
  if (![v22 emojiSearchMode] || objc_msgSend(v12, "actionType"))
  {

    goto LABEL_8;
  }
  BOOL v25 = [(TITypingEffortAnalyzer *)self isEmojiSearchCandidateSelection:v12];

  if (!v25)
  {
LABEL_8:
    int v19 = [v13 keyboardState];
    if (([v19 emojiSearchMode] & 1) == 0)
    {
      v23 = v13;
      goto LABEL_13;
    }
    goto LABEL_15;
  }
LABEL_17:
}

- (id)keyStringWithCode:(int64_t)a3 fromLayout:(id)a4
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__TITypingEffortAnalyzer_keyStringWithCode_fromLayout___block_invoke;
  v6[3] = &unk_1E6E2E0E0;
  v6[4] = &v7;
  void v6[5] = a3;
  [a4 enumerateKeysUsingBlock:v6];
  if (v8[3])
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __55__TITypingEffortAnalyzer_keyStringWithCode_fromLayout___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) == a3)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)addSpecialKeyActionsForFirstTouch:(id)a3 andLastTouch:(id)a4 fromLayout:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  BOOL v7 = a7;
  id v20 = a3;
  id v12 = a4;
  id v13 = a6;
  if (a5)
  {
    id v14 = a5;
    BOOL v15 = [v12 forcedKeyCode] == -1;
    id v16 = v20;
    if (!v15) {
      id v16 = v12;
    }
    id v17 = -[TITypingEffortAnalyzer keyStringWithCode:fromLayout:](self, "keyStringWithCode:fromLayout:", [v16 forcedKeyCode], v14);

    if ([v17 isEqualToString:@"shift"])
    {
      id v18 = @"shiftKeyTaps";
      int v19 = @"emojiSearchShiftKeyTaps";
    }
    else if ([v17 isEqualToString:@"more"])
    {
      id v18 = @"moreKeyTaps";
      int v19 = @"emojiSearchMoreKeyTaps";
    }
    else if ([v17 isEqualToString:@"\n"])
    {
      id v18 = @"returnKeyTaps";
      int v19 = @"emojiSearchEmojiKeyTaps";
    }
    else
    {
      if (![v17 isEqualToString:@" "])
      {
LABEL_13:

        goto LABEL_14;
      }
      id v18 = @"spaceKeyTaps";
      int v19 = @"emojiSearchSpaceKeyTaps";
    }
    [(TITypingEffortAnalyzer *)self addCountsForPropertyWithName:v18 andEmojiSearchPropertyName:v19 contributesToTotal:1 toActionSummary:v13 emojiSearchMode:v7];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)addPathWeightActionsForTouches:(id)a3 withLayout:(id)a4 forWord:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    [v13 frame];
    double v17 = v16;
    [v13 frame];
    double v19 = v18;
    [v13 frame];
    double v21 = v20;
    [v13 frame];
    double v23 = v22;
    if (v21 <= 0.0 || v22 <= 0.0)
    {
      uint64_t v41 = IXADefaultLogFacility();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s Invalid layout dimensions: width: %f height: %f", "-[TITypingEffortAnalyzer addPathWeightActionsForTouches:withLayout:forWord:toActionSummary:emojiSearchMode:]", *(void *)&v21, *(void *)&v23);
        *(_DWORD *)buf = 138412290;
        v45 = v42;
        _os_log_error_impl(&dword_1E3F0E000, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    else
    {
      if ((unint64_t)[v12 count] < 2) {
        goto LABEL_8;
      }
      double v43 = v17;
      double v24 = 0.0;
      unint64_t v25 = 1;
      do
      {
        id v26 = [v12 objectAtIndex:v25 - 1];
        [v26 location];
        double v27 = v23;
        double v28 = v21;
        double v30 = v29;
        double v32 = v31;

        BOOL v33 = [v12 objectAtIndex:v25];
        [v33 location];
        double v35 = v34;
        double v37 = v36;

        double v38 = v30 - v43;
        double v21 = v28;
        double v23 = v27;
        double v24 = v24
            + sqrt(((v35 - v43) / v21 - v38 / v21) * ((v35 - v43) / v21 - v38 / v21)+ ((v37 - v19) / v27 - (v32 - v19) / v27) * ((v37 - v19) / v27 - (v32 - v19) / v27));
        ++v25;
      }
      while ([v12 count] > v25);
      if (v24 >= 0.5)
      {
        if (v24 >= 1.0)
        {
          if (v24 >= 1.5)
          {
            if (v24 >= 2.0)
            {
              if (v24 >= 2.5)
              {
                if (v24 >= 3.0)
                {
                  if (v24 >= 3.5)
                  {
                    if (v24 >= 4.0)
                    {
                      if (v24 >= 4.5) {
                        v40 = @"pathsWithWeight10";
                      }
                      else {
                        v40 = @"pathsWithWeight9";
                      }
                      if (v24 >= 4.5) {
                        double v39 = @"emojiSearchPathsWithWeight10";
                      }
                      else {
                        double v39 = @"emojiSearchPathsWithWeight9";
                      }
                    }
                    else
                    {
                      double v39 = @"emojiSearchPathsWithWeight8";
                      v40 = @"pathsWithWeight8";
                    }
                  }
                  else
                  {
                    double v39 = @"emojiSearchPathsWithWeight7";
                    v40 = @"pathsWithWeight7";
                  }
                }
                else
                {
                  double v39 = @"emojiSearchPathsWithWeight6";
                  v40 = @"pathsWithWeight6";
                }
              }
              else
              {
                double v39 = @"emojiSearchPathsWithWeight5";
                v40 = @"pathsWithWeight5";
              }
            }
            else
            {
              double v39 = @"emojiSearchPathsWithWeight4";
              v40 = @"pathsWithWeight4";
            }
          }
          else
          {
            double v39 = @"emojiSearchPathsWithWeight3";
            v40 = @"pathsWithWeight3";
          }
        }
        else
        {
          double v39 = @"emojiSearchPathsWithWeight2";
          v40 = @"pathsWithWeight2";
        }
      }
      else
      {
LABEL_8:
        double v39 = @"emojiSearchPathsWithWeight1";
        v40 = @"pathsWithWeight1";
      }
      [(TITypingEffortAnalyzer *)self addCountsForPropertyWithName:v40 andEmojiSearchPropertyName:v39 contributesToTotal:0 toActionSummary:v15 emojiSearchMode:v7];
    }
  }
}

- (void)addTouchRelatedActionsForTouches:(id)a3 layouts:(id)a4 acceptedCandidate:(id)a5 toActionSummary:(id)a6 keyboardInputTouches:(id)a7 pathTouches:(id)a8 emojiSearchMode:(BOOL)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v38 = a5;
  id v39 = a6;
  id v40 = a7;
  id v41 = a8;
  id v15 = (void *)[a3 mutableCopy];
  double v37 = v14;
  double v16 = (void *)[v14 mutableCopy];
  if (![v15 count]) {
    goto LABEL_33;
  }
  unint64_t v17 = 0x1E4F28000uLL;
  do
  {
    double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    double v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    double v20 = [v16 objectAtIndex:0];
    uint64_t v21 = [v20 integerValue];

    double v22 = [(TITypingSession *)self->_session layouts];
    double v23 = [v22 objectAtIndexedSubscript:v21];

    double v24 = [v15 objectAtIndex:0];
    unint64_t v25 = [*(id *)(v17 + 3792) numberWithInteger:0];
    [v19 addObject:v25];

    [v18 addObject:v24];
    id v26 = 0;
    if ((unint64_t)[v15 count] < 2) {
      goto LABEL_16;
    }
    uint64_t v27 = 1;
    while (1)
    {
      id v28 = [v15 objectAtIndex:v27];
      uint64_t v29 = [v28 pathIndex];
      if (v29 != [v24 pathIndex]) {
        goto LABEL_11;
      }
      if (![v28 stage]) {
        break;
      }
      if ([v28 stage] == 2
        || [v28 stage] == 3
        || [v28 stage] == 5)
      {
        id v28 = v28;
        double v31 = [*(id *)(v17 + 3792) numberWithInt:v27];
        [v19 addObject:v31];

        [v18 addObject:v28];
        id v26 = v28;
        goto LABEL_15;
      }
      double v30 = [*(id *)(v17 + 3792) numberWithInt:v27];
      [v19 addObject:v30];

      [v18 addObject:v28];
LABEL_11:

      if ([v15 count] <= (unint64_t)++v27)
      {
        id v26 = 0;
        goto LABEL_16;
      }
    }
    id v26 = 0;
LABEL_15:

LABEL_16:
    if ([v24 stage])
    {

      double v24 = 0;
      goto LABEL_18;
    }
    if (v24 && v26)
    {
      if (v41 && [v41 containsObject:v26])
      {
        double v32 = [v38 candidate];
        [(TITypingEffortAnalyzer *)self addPathWeightActionsForTouches:v18 withLayout:v23 forWord:v32 toActionSummary:v39 emojiSearchMode:a9];
        goto LABEL_21;
      }
      if (([v40 containsObject:v26] & 1) == 0) {
        [(TITypingEffortAnalyzer *)self addSpecialKeyActionsForFirstTouch:v24 andLastTouch:v26 fromLayout:v23 toActionSummary:v39 emojiSearchMode:a9];
      }
    }
    else
    {
LABEL_18:
      if (IXACanLogMessageAtLevel())
      {
        double v32 = IXADefaultLogFacility();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          double v36 = objc_msgSend(NSString, "stringWithFormat:", @"%s An incomplete touch path was detected", "-[TITypingEffortAnalyzer addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:]");
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v36;
          _os_log_debug_impl(&dword_1E3F0E000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
LABEL_21:
      }
    }
    uint64_t v33 = [v19 count] - 1;
    if (v33 >= 0)
    {
      do
      {
        double v34 = [v19 objectAtIndex:v33];
        uint64_t v35 = [v34 integerValue];

        [v15 removeObjectAtIndex:v35];
        [v16 removeObjectAtIndex:v35];
        --v33;
      }
      while (v33 != -1);
    }

    unint64_t v17 = 0x1E4F28000;
  }
  while ([v15 count]);
LABEL_33:
}

- (void)addPathAndCandidateBarActionsForWordEntry:(id)a3 toActionSummary:(id)a4 andPathTouches:(id)a5 emojiSearchMode:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 acceptedCandidate];
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = [v10 acceptedString];
    if (v15)
    {
      double v16 = (void *)v15;
      unint64_t v17 = [v10 acceptedString];
      uint64_t v18 = [v17 length];

      if (v18)
      {
        double v19 = [v10 acceptedCandidate];
        int v20 = [v19 isContinuousPathConversion];

        if (v20)
        {
          uint64_t v21 = [v10 allTouches];
          uint64_t v22 = [v21 count];

          if (v22)
          {
            double v23 = [v10 allTouches];
            double v24 = [v23 lastObject];
            [v12 addObject:v24];

            unint64_t v25 = @"paths";
            id v26 = @"emojiSearchPaths";
            goto LABEL_11;
          }
          double v31 = IXADefaultLogFacility();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            double v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s A continuous path conversion with no touch data was found.", "-[TITypingEffortAnalyzer addPathAndCandidateBarActionsForWordEntry:toActionSummary:andPathTouches:emojiSearchMode:]");
            *(_DWORD *)buf = 138412290;
            double v34 = v32;
            _os_log_error_impl(&dword_1E3F0E000, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        else if (([v10 wordEntryType] & 4) != 0)
        {
          uint64_t v27 = [v10 acceptedCandidate];
          id v28 = [v27 candidate];
          int v29 = [v28 _containsEmoji];

          if (!v29)
          {
            unint64_t v25 = @"candidateSelections";
            double v30 = self;
            id v26 = 0;
            goto LABEL_16;
          }
          unint64_t v25 = @"emojiCandidateSelections";
          id v26 = @"emojiSearchCandidateSelections";
LABEL_11:
          double v30 = self;
LABEL_16:
          [(TITypingEffortAnalyzer *)v30 addCountsForPropertyWithName:v25 andEmojiSearchPropertyName:v26 contributesToTotal:1 toActionSummary:v11 emojiSearchMode:v6];
        }
      }
    }
    else
    {
    }
  }
}

- (BOOL)isTenKeyInputMode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = TIInputModeGetNormalizedIdentifier();
  uint64_t v5 = TIInputModeGetSWLayout();

  BOOL v6 = [NSString stringWithFormat:@"%@@sw=%@", v4, v5];
  char v7 = [&unk_1F3FA78E0 containsObject:v6];

  return v7;
}

- (BOOL)isPopupVariantInput:(id)a3 inputMode:(id)a4
{
  id v6 = a4;
  if ([a3 isPopupVariant]) {
    BOOL v7 = ![(TITypingEffortAnalyzer *)self isTenKeyInputMode:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isFlickInput:(id)a3
{
  id v3 = a3;
  if ([v3 isFlick]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isGesture];
  }

  return v4;
}

- (void)addKeyboardInputActionsForKeyboardInputs:(id)a3 inputMode:(id)a4 toActionSummary:(id)a5 andKeyboardInputTouches:(id)a6 emojiSearchMode:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = v7;
  id v46 = v13;
  id v15 = a5;
  id v16 = a6;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v17 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v48;
    id v45 = v15;
    id v43 = v12;
    BOOL v42 = v7;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v12);
        }
        uint64_t v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
        uint64_t v22 = [v21 touchEvent];

        if (v22)
        {
          double v23 = [v21 touchEvent];
          [v16 addObject:v23];
        }
        if (([v21 isSynthesizedByAcceptingCandidate] & 1) == 0)
        {
          double v24 = [v21 touchEvent];

          if (v24) {
            goto LABEL_37;
          }
          id v28 = [v21 string];
          int v29 = [v28 _containsEmoji];

          if (v29)
          {
            unint64_t v25 = self;
            id v26 = @"emojiSelections";
            uint64_t v27 = 0;
            id v15 = v45;
            goto LABEL_24;
          }
          id v15 = v45;
          if ([v46 isEqualToString:@"ko_KR@sw=Korean10Key;hw=Automatic"])
          {
LABEL_37:
            if ([(TITypingEffortAnalyzer *)self isFlickInput:v21])
            {
              unint64_t v25 = self;
              id v26 = @"flicks";
              uint64_t v27 = @"emojiSearchFlicks";
              goto LABEL_24;
            }
            if ([(TITypingEffortAnalyzer *)self isPopupVariantInput:v21 inputMode:v46])
            {
              unint64_t v25 = self;
              id v26 = @"popupVariants";
              uint64_t v27 = @"emojiSearchPopupVariants";
              goto LABEL_24;
            }
            if ([v21 isBackspace])
            {
              unint64_t v25 = self;
              id v26 = @"backspaceKeyTaps";
              uint64_t v27 = @"emojiSearchBackspaceKeyTaps";
              goto LABEL_24;
            }
            double v30 = [v21 string];
            if ([v30 isEqualToString:@" "])
            {

LABEL_23:
              unint64_t v25 = self;
              id v26 = @"spaceKeyTaps";
              uint64_t v27 = @"emojiSearchSpaceKeyTaps";
LABEL_24:
              [(TITypingEffortAnalyzer *)v25 addCountsForPropertyWithName:v26 andEmojiSearchPropertyName:v27 contributesToTotal:1 toActionSummary:v15 emojiSearchMode:v14];
              goto LABEL_25;
            }
            double v31 = [v21 string];
            double v32 = [(TITypingSession *)self->_session sessionParams];
            uint64_t v33 = [v32 wordSeparator];
            int v44 = [v31 isEqualToString:v33];

            id v12 = v43;
            BOOL v14 = v42;

            id v15 = v45;
            if (v44) {
              goto LABEL_23;
            }
            double v34 = [v21 string];
            int v35 = [v34 isEqualToString:@"\n"];

            if (v35)
            {
              double v36 = self;
              double v37 = @"returnKeyTaps";
              id v38 = 0;
            }
            else
            {
              id v39 = [v21 string];
              uint64_t v40 = [v39 length];

              double v36 = self;
              if (v40 == 1)
              {
                double v37 = @"characterKeyTaps";
                id v38 = @"emojiSearchCharacterKeyTaps";
              }
              else
              {
                double v37 = @"unknownKeyTaps";
                id v38 = @"unknownKeyTaps";
              }
            }
            BOOL v14 = v42;
            [(TITypingEffortAnalyzer *)v36 addCountsForPropertyWithName:v37 andEmojiSearchPropertyName:v38 contributesToTotal:1 toActionSummary:v45 emojiSearchMode:v42];
            id v12 = v43;
          }
        }
LABEL_25:
        ++v20;
      }
      while (v18 != v20);
      uint64_t v41 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
      uint64_t v18 = v41;
    }
    while (v41);
  }
}

- (void)addActionsForDeleteWord:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v16 = (id)objc_opt_new();
  id v10 = [v9 keyboardState];
  id v11 = [v10 inputMode];

  id v12 = [v9 allKeyboardInputs];
  [(TITypingEffortAnalyzer *)self addKeyboardInputActionsForKeyboardInputs:v12 inputMode:v11 toActionSummary:v8 andKeyboardInputTouches:v16 emojiSearchMode:v5];

  id v13 = [v9 allTouches];
  BOOL v14 = [v9 touchLayouts];

  LOBYTE(v15) = v5;
  [(TITypingEffortAnalyzer *)self addTouchRelatedActionsForTouches:v13 layouts:v14 acceptedCandidate:0 toActionSummary:v8 keyboardInputTouches:v16 pathTouches:0 emojiSearchMode:v15];
}

- (void)addActionsForWordEntry:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v18 = (id)objc_opt_new();
  id v10 = objc_opt_new();
  id v11 = [v9 keyboardState];
  id v12 = [v11 inputMode];

  id v13 = [v9 allKeyboardInputs];
  [(TITypingEffortAnalyzer *)self addKeyboardInputActionsForKeyboardInputs:v13 inputMode:v12 toActionSummary:v8 andKeyboardInputTouches:v18 emojiSearchMode:v5];

  [(TITypingEffortAnalyzer *)self addPathAndCandidateBarActionsForWordEntry:v9 toActionSummary:v8 andPathTouches:v10 emojiSearchMode:v5];
  BOOL v14 = [v9 allTouches];
  uint64_t v15 = [v9 touchLayouts];
  id v16 = [v9 acceptedCandidate];

  LOBYTE(v17) = v5;
  [(TITypingEffortAnalyzer *)self addTouchRelatedActionsForTouches:v14 layouts:v15 acceptedCandidate:v16 toActionSummary:v8 keyboardInputTouches:v18 pathTouches:v10 emojiSearchMode:v17];
}

- (id)countActions
{
  id v3 = objc_opt_new();
  char v4 = [(TITypingSession *)self->_session userActionHistory];
  int v5 = [v4 count];

  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    BOOL v7 = 0;
    uint64_t v8 = v5 - 1;
    uint64_t v9 = v5;
    do
    {
      id v10 = v7;
      id v11 = [(TITypingSession *)self->_session userActionHistory];
      BOOL v7 = [v11 objectAtIndex:v6];

      id v12 = [v7 keyboardState];
      uint64_t v13 = [v12 emojiSearchMode];

      switch([v7 actionType])
      {
        case 0u:
          [(TITypingEffortAnalyzer *)self addActionsForWordEntry:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        case 1u:
          [(TITypingEffortAnalyzer *)self addActionsForDeleteWord:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        case 2u:
          if (v6 >= v8)
          {
            uint64_t v15 = 0;
          }
          else
          {
            BOOL v14 = [(TITypingSession *)self->_session userActionHistory];
            uint64_t v15 = [v14 objectAtIndex:v6 + 1];
          }
          [(TITypingEffortAnalyzer *)self addActionsForCursorEvent:v7 lastAction:v10 nextAction:v15 toActionSummary:v3 emojiSearchMode:v13];

          break;
        case 3u:
          [(TITypingEffortAnalyzer *)self addActionsForDocumentStateChange:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        case 6u:
          [(TITypingEffortAnalyzer *)self addActionsForArrowKey:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        case 8u:
          [(TITypingEffortAnalyzer *)self addActionsForCut:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        case 9u:
          [(TITypingEffortAnalyzer *)self addActionsForPaste:v7 toActionSummary:v3 emojiSearchMode:v13];
          break;
        default:
          break;
      }

      ++v6;
    }
    while (v9 != v6);
  }

  return v3;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    *(_DWORD *)&self->_emojiPlaneActive = 0;
    id v11 = [(TITypingEffortAnalyzer *)self countActions];
    id v12 = [(TITypingEffortAnalyzer *)self countOutput];
    [(TITypingEffortAnalyzer *)self dispatchEventWithActionSummary:v11 outputSummary:v12];
  }
  return a5 != 0;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TITypingEffortAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TITypingEffortAnalyzer;
  v2 = [(TITypingEffortAnalyzer *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(TITypingEffortAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end