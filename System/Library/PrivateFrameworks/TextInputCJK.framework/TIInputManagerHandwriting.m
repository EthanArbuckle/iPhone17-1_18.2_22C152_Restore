@interface TIInputManagerHandwriting
+ (Class)wordSearchClass;
- (BOOL)isDummyCandidate:(id)a3;
- (BOOL)isInCompletionMode;
- (BOOL)shouldCommitInputString;
- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext;
- (BOOL)shouldLearnAcceptedCandidate;
- (BOOL)shouldLookForCompletionCandidates;
- (BOOL)shouldUpdateDictionaryPaths;
- (BOOL)showingFacemarks;
- (BOOL)suppliesCompletions;
- (BOOL)suppressPlaceholderCandidate;
- (BOOL)updateCandidates;
- (BOOL)updateCompletionCandidatesIfAppropriate;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (CHRecognizer)recognizer;
- (CIMCandidateData)candidateData;
- (NSArray)candidates;
- (NSArray)facemarkCandidates;
- (NSArray)proactiveTriggers;
- (NSLocale)recognitionLanguage;
- (NSMutableArray)committedCandidates;
- (NSMutableDictionary)candidateRefsDictionary;
- (RecognizerProvider)recognizerProvider;
- (TIHandwritingStrokes)userDrawing;
- (TIInputManagerHandwriting)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIWordSearchHandwriting)wordSearch;
- (id)addInputObject:(id)a3;
- (id)candidateResultSet;
- (id)defaultCandidate;
- (id)didAcceptCandidate:(id)a3;
- (id)historyForRecognition;
- (id)keyboardCandidateResultSetFromResults;
- (id)keyboardConfigurationLayoutTag;
- (id)markedTextForDefaultCandidate;
- (id)processCandidates:(id)a3 stickers:(id)a4;
- (int)mecabraLanguage;
- (int)recognitionMode;
- (unint64_t)autoquoteType;
- (unint64_t)initialSelectedIndex;
- (unint64_t)predictionOptions:(BOOL)a3;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)cancelRecognition;
- (void)clearCandidateRefsDictionary;
- (void)clearInput;
- (void)clearObservers;
- (void)dealloc;
- (void)deleteFromInputWithContext:(id)a3;
- (void)initImplementation;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)mainThreadUpdateCandidates:(id)a3;
- (void)resetCompletionStates;
- (void)setCandidateRefsDictionary:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setCommittedCandidates:(id)a3;
- (void)setIsInCompletionMode:(BOOL)a3;
- (void)setLearnsCorrection:(BOOL)a3;
- (void)setProactiveTriggers:(id)a3;
- (void)setShouldLearnAcceptedCandidate:(BOOL)a3;
- (void)setShowingFacemarks:(BOOL)a3;
- (void)setUserDrawing:(id)a3;
- (void)suspend;
- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4;
- (void)updateAddressBook;
- (void)updateDictionaryPaths;
- (void)updateUserWordEntries;
@end

@implementation TIInputManagerHandwriting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_candidateRefsDictionary, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_recognizerProvider, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
  objc_storeStrong((id *)&self->_facemarkCandidates, 0);
  objc_storeStrong((id *)&self->_userDrawing, 0);
  objc_storeStrong(&self->_dictionaryUpdateObserver, 0);
  objc_storeStrong(&self->_userDictionaryObserver, 0);
  objc_storeStrong(&self->_contactObserver, 0);
}

- (void)setProactiveTriggers:(id)a3
{
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (void)setCommittedCandidates:(id)a3
{
}

- (NSMutableArray)committedCandidates
{
  return self->_committedCandidates;
}

- (void)setCandidateRefsDictionary:(id)a3
{
}

- (NSMutableDictionary)candidateRefsDictionary
{
  return self->_candidateRefsDictionary;
}

- (TIWordSearchHandwriting)wordSearch
{
  return self->_wordSearch;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setShowingFacemarks:(BOOL)a3
{
  self->_showingFacemarks = a3;
}

- (BOOL)showingFacemarks
{
  return self->_showingFacemarks;
}

- (void)setUserDrawing:(id)a3
{
}

- (TIHandwritingStrokes)userDrawing
{
  return self->_userDrawing;
}

- (void)setShouldLearnAcceptedCandidate:(BOOL)a3
{
  self->_shouldLearnAcceptedCandidate = a3;
}

- (BOOL)shouldLearnAcceptedCandidate
{
  return self->_shouldLearnAcceptedCandidate;
}

- (void)setIsInCompletionMode:(BOOL)a3
{
  self->_isInCompletionMode = a3;
}

- (BOOL)isInCompletionMode
{
  return self->_isInCompletionMode;
}

- (int)recognitionMode
{
  return 2;
}

- (NSLocale)recognitionLanguage
{
  return 0;
}

- (CIMCandidateData)candidateData
{
  candidateData = self->_candidateData;
  if (!candidateData)
  {
    v4 = [CIMCandidateData alloc];
    v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    v6 = [(CIMCandidateData *)v4 initWithInputMode:v5];
    v7 = self->_candidateData;
    self->_candidateData = v6;

    candidateData = self->_candidateData;
  }
  return candidateData;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwriting;
  -[TIInputManagerHandwriting setLearnsCorrection:](&v5, sel_setLearnsCorrection_);
  [(TIInputManagerHandwriting *)self setShouldLearnAcceptedCandidate:v3];
}

- (id)processCandidates:(id)a3 stickers:(id)a4
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v101 = a4;
  v116 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v133 objects:v142 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v134 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v133 + 1) + 8 * i);
        if (([v116 containsObject:v12] & 1) == 0) {
          [v116 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v133 objects:v142 count:16];
    }
    while (v9);
  }

  v13 = (void *)MEMORY[0x263EFF9C0];
  v14 = [v116 valueForKey:@"candidate"];
  v106 = [v13 setWithArray:v14];

  if ([(TIInputManagerHandwriting *)self shouldOmitEmojiCandidates]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 2;
  }
  uint64_t v16 = -[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 10, v7);
  v17 = (void *)v16;
  v18 = &stru_270B867F0;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v103 = v18;

  unint64_t v100 = [(TIInputManagerHandwriting *)self predictionOptions:1];
  [(TIInputManagerHandwriting *)self mecabraLanguage];
  unint64_t v115 = v15;
  v19 = [MEMORY[0x263EFF9C0] setWithCapacity:2 * v15];
  v112 = [MEMORY[0x263EFF980] array];
  uint64_t v20 = [v116 count];
  if (v20)
  {
    unint64_t v21 = v20;
    unint64_t v104 = 0;
    unint64_t v105 = 0;
    uint64_t v22 = 0;
    v107 = self;
    v114 = v19;
    while (1)
    {
      v23 = [v116 objectAtIndex:v22];
      if ([v23 isExtensionCandidate]) {
        goto LABEL_92;
      }
      v24 = [v23 candidate];
      uint64_t v25 = [v24 length];

      if (!v25) {
        goto LABEL_92;
      }
      objc_opt_class();
      v26 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
      id v27 = v26;
      v28 = v27;
      int v29 = 0;
      v111 = v27;
      v113 = v23;
      if (!v22)
      {
        if (v27) {
          break;
        }
      }
LABEL_38:
      if ((v29 & 1) == 0 && v105 < v115)
      {
        unint64_t v44 = v21;
        int v109 = v29;
        if (v22) {
          id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        else {
          id v45 = (id)[v101 mutableCopy];
        }
        v46 = v45;
        v47 = [v113 candidate];
        v48 = (void *)MecabraCopyEmojiCharacterArrayForString();

        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        id v49 = v48;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v129 objects:v141 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v130;
          do
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v130 != v52) {
                objc_enumerationMutation(v49);
              }
              uint64_t v54 = *(void *)(*((void *)&v129 + 1) + 8 * j);
              if (([v19 containsObject:v54] & 1) == 0)
              {
                id v55 = objc_alloc(MEMORY[0x263F7E640]);
                v56 = [v113 input];
                v57 = (void *)[v55 initWithCandidate:v54 forInput:v56];

                v19 = v114;
                [v46 addObject:v57];
                [v114 addObject:v54];
              }
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v129 objects:v141 count:16];
          }
          while (v51);
        }

        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        id v58 = v46;
        uint64_t v59 = [v58 countByEnumeratingWithState:&v125 objects:v140 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = 0;
          uint64_t v62 = *(void *)v126;
          do
          {
            for (uint64_t k = 0; k != v60; ++k)
            {
              if (*(void *)v126 != v62) {
                objc_enumerationMutation(v58);
              }
              uint64_t v64 = *(void *)(*((void *)&v125 + 1) + 8 * k);
              if (v61 + 1 + k <= v115)
              {
                [v116 insertObject:v64 atIndex:++v22];
                ++v44;
              }
              else
              {
                [v112 addObject:v64];
              }
            }
            v61 += v60;
            uint64_t v60 = [v58 countByEnumeratingWithState:&v125 objects:v140 count:16];
          }
          while (v60);

          if (v61) {
            ++v105;
          }
          self = v107;
          v19 = v114;
        }
        else
        {

          self = v107;
        }
        int v29 = v109;

        unint64_t v21 = v44;
        v23 = v113;
        v28 = v111;
      }
      int v65 = v29 ^ 1;
      if (!v28) {
        int v65 = 0;
      }
      if (v65 == 1)
      {
        v66 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
        v67 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "uniqueID"));
        uint64_t v68 = [v66 objectForKey:v67];

        v102 = (void *)v68;
        if (v68)
        {
          v69 = [(TIInputManagerHandwriting *)self wordSearch];
          uint64_t v139 = v68;
          v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
          v71 = [v69 generatePredictionsWithCandidateContext:v70 stringContext:v103 option:v100];
        }
        else
        {
          v71 = 0;
        }
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id v72 = v71;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v121 objects:v138 count:16];
        v19 = v114;
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v108 = 0;
          unint64_t v110 = v21;
          uint64_t v75 = *(void *)v122;
          v28 = v111;
          while (2)
          {
            for (uint64_t m = 0; m != v74; ++m)
            {
              if (*(void *)v122 != v75) {
                objc_enumerationMutation(v72);
              }
              uint64_t v77 = *(void *)(*((void *)&v121 + 1) + 8 * m);
              v78 = MecabraCandidateGetSurface();
              if (v78 && MecabraCandidateGetType() != 6)
              {
                uint64_t v79 = v75;
                v80 = [v28 candidate];
                v81 = [v80 stringByAppendingString:v78];

                v82 = [(TIInputManagerHandwriting *)v107 candidateRefsDictionary];
                v83 = [NSNumber numberWithUnsignedLongLong:v77];
                [v82 setObject:v77 forKeyedSubscript:v83];

                v84 = objc_msgSend(objc_alloc(MEMORY[0x263F7E558]), "initWithCandidate:forInput:uniqueID:completionUniqueID:", v81, 0, objc_msgSend(v111, "uniqueID"), v77);
                [v116 insertObject:v84 atIndex:++v22];
                ++v110;

                if (v108)
                {

                  ++v104;
                  self = v107;
                  unint64_t v21 = v110;
                  v28 = v111;
                  v23 = v113;
                  v19 = v114;
                  goto LABEL_89;
                }
                uint64_t v108 = 1;
                v19 = v114;
                v28 = v111;
                uint64_t v75 = v79;
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v121 objects:v138 count:16];
            if (v74) {
              continue;
            }
            break;
          }

          if (v108) {
            ++v104;
          }
          self = v107;
          unint64_t v21 = v110;
          v23 = v113;
        }
        else
        {

          v28 = v111;
        }
LABEL_89:
      }
      if (v105 >= v115 || v104 > 1)
      {

        goto LABEL_95;
      }
LABEL_92:

      if (++v22 >= v21) {
        goto LABEL_95;
      }
    }
    unint64_t v30 = v21;
    v31 = [(TIInputManagerHandwriting *)self wordSearch];
    v32 = [(TIInputManagerHandwriting *)self committedCandidates];
    v33 = [v31 generateConversionsForCandidate:v28 candidateContext:v32 stringContext:v103];

    if ([v33 count])
    {
      unint64_t v34 = 0;
      uint64_t v22 = 0;
      char v35 = 0;
      do
      {
        v36 = [v33 objectAtIndexedSubscript:v34];

        v37 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:v36];
        v38 = [v37 candidate];
        char v39 = [v106 containsObject:v38];

        if ((v39 & 1) == 0)
        {
          v40 = [(TIInputManagerHandwriting *)v107 candidateRefsDictionary];
          v41 = [NSNumber numberWithUnsignedLongLong:v36];
          [v40 setObject:v36 forKeyedSubscript:v41];

          [v116 insertObject:v37 atIndex:++v22];
          ++v30;
          char v35 = 1;
        }

        ++v34;
      }
      while ([v33 count] > v34);
      if ((v35 & 1) == 0)
      {
        v42 = v33;
        int v29 = 0;
        self = v107;
        unint64_t v21 = v30;
        v23 = v113;
        v19 = v114;
        v28 = v111;
LABEL_37:

        goto LABEL_38;
      }
      v42 = v33;
      self = v107;
      unint64_t v21 = v30;
      v28 = v111;
      if ([v33 count])
      {
        int v29 = 1;
        v43 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v101, "count"));
        [v116 insertObjects:v101 atIndexes:v43];
      }
      else
      {
        int v29 = 1;
      }
      v19 = v114;
    }
    else
    {
      v42 = v33;
      int v29 = 0;
      uint64_t v22 = 0;
      unint64_t v21 = v30;
    }
    v23 = v113;
    goto LABEL_37;
  }
LABEL_95:
  [v116 addObjectsFromArray:v112];

  v85 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v86 = v116;
  uint64_t v87 = [v86 countByEnumeratingWithState:&v117 objects:v137 count:16];
  if (!v87) {
    goto LABEL_112;
  }
  uint64_t v88 = v87;
  uint64_t v89 = *(void *)v118;
  do
  {
    uint64_t v90 = 0;
    do
    {
      if (*(void *)v118 != v89) {
        objc_enumerationMutation(v86);
      }
      v91 = *(void **)(*((void *)&v117 + 1) + 8 * v90);
      v92 = [v91 candidate];
      if ([v92 _graphemeCount] == 1)
      {
        if ([v92 rangeOfCharacterFromSet:v85] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v93 = [v92 _stringByConvertingFromHalfWidthToFullWidth];
          char v94 = [v92 isEqualToString:v93];
          v95 = @"UI-Halfwidth";
          if ((v94 & 1) == 0) {
            goto LABEL_103;
          }
          goto LABEL_104;
        }
        if ([v92 _containsFullwidthLettersAndNumbersOnly]
          && ([v92 _containsHiraganaOrKatakana] & 1) == 0)
        {
          v93 = [v92 _stringByConvertingFromFullWidthToHalfWidth];
          char v96 = [v92 isEqualToString:v93];
          v95 = @"UI-Fullwidth";
          if (v96) {
            goto LABEL_104;
          }
LABEL_103:
          [v91 setAnnotationText:v95];
LABEL_104:
        }
      }

      ++v90;
    }
    while (v88 != v90);
    uint64_t v97 = [v86 countByEnumeratingWithState:&v117 objects:v137 count:16];
    uint64_t v88 = v97;
  }
  while (v97);
LABEL_112:

  return v86;
}

- (int)mecabraLanguage
{
  v2 = [(TIInputManagerHandwriting *)self wordSearch];
  int v3 = [v2 mecabraLanguage];

  return v3;
}

- (id)keyboardConfigurationLayoutTag
{
  if ([(TIInputManagerHandwriting *)self shouldEnableHalfWidthPunctuationForCurrentInputContext])
  {
    v2 = @"HalfWidthPunctuation";
  }
  else
  {
    v2 = @"Default";
  }
  return v2;
}

- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext
{
  int v3 = [(TIInputManagerHandwriting *)self keyboardState];
  v4 = [v3 documentState];
  objc_super v5 = [v4 contextBeforeInput];

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB90]))
  {
    id v6 = -[TIInputManagerHandwriting externalStringToInternal:](self, "externalStringToInternal:");
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = +[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForDocumentContext:v5 composedText:v6];

  return v7;
}

- (BOOL)suppressPlaceholderCandidate
{
  v2 = [(TIInputManagerHandwriting *)self inputString];
  char v3 = [v2 isEqualToString:@"　"];

  return v3;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (unint64_t)autoquoteType
{
  return 1;
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v31 = a3;
  [(TIInputManagerHandwriting *)self setCandidates:0];
  [(TIInputManagerHandwriting *)self resetCompletionStates];
  v4 = [(TIInputManagerHandwriting *)self committedCandidates];
  [v4 removeAllObjects];

  if (![(TIInputManagerHandwriting *)self inputIndex])
  {
    [v31 deleteBackward:1];
    goto LABEL_25;
  }
  objc_super v5 = [(TIInputManagerHandwriting *)self userDrawing];

  if (v5)
  {
    id v6 = [(TIInputManagerHandwriting *)self usageTrackingKeyForStatistic:*MEMORY[0x263F7E8E8]];
    TIStatisticScalarIncrement();
  }
  [(TIInputManagerHandwriting *)self setCandidates:0];
  [(TIInputManagerHandwriting *)self cancelRecognition];
  BOOL v7 = [(TIInputManagerHandwriting *)self userDrawing];
  uint64_t v8 = +[RecognizeDrawingOperation drawingWithStrokes:v7];

  uint64_t v9 = [(TIInputManagerHandwriting *)self recognizer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v11 = [(TIInputManagerHandwriting *)self recognizer];
  if (isKindOfClass)
  {
    id v12 = [(TIInputManagerHandwriting *)self keyboardState];
    v13 = [(TIInputManagerHandwriting *)self historyForRecognition];
    v14 = +[RecognizeDrawingOperation textRecognitionResultsForDrawing:v8 withRecognizer:v11 keyboardState:v12 history:v13 shouldCancel:0];

    [v14 lastTokenStrokeIndexes];
  }
  else
  {
    uint64_t v15 = [(TIInputManagerHandwriting *)self historyForRecognition];
    id v16 = +[RecognizeDrawingOperation recognitionResultsForDrawing:v8 withRecognizer:v11 history:v15 shouldCancel:0];

    v14 = [(TIInputManagerHandwriting *)self recognizer];
    [v14 strokeIndexesForLastCharacter];
  v17 = };

  v18 = [(TIInputManagerHandwriting *)self userDrawing];
  uint64_t v19 = [v18 numberOfStrokes];

  unint64_t v20 = [v17 lastIndex];
  if ([v17 count]) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v19 == 0;
  }
  int v22 = !v21;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    while (1)
    {
      v23 = [(TIInputManagerHandwriting *)self userDrawing];
      unint64_t v24 = [v23 numberOfStrokes];

      if (v20 >= v24) {
        break;
      }
      uint64_t v25 = [(TIInputManagerHandwriting *)self userDrawing];
      [v25 removeStrokeAtIndex:v20];

      unint64_t v20 = [v17 indexLessThanIndex:v20];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
    }
    int v22 = 1;
  }
LABEL_19:
  v26 = [(TIInputManagerHandwriting *)self inputString];
  int v27 = [v26 hasSuffix:*MEMORY[0x263F7EBF8]];

  if (!v27)
  {
    if (v22)
    {
      v28 = [MEMORY[0x263F088D0] indexSetWithIndex:0x7FFFFFFFLL];
      [v31 deleteHandwritingStrokes:v28];
      [(TIInputManagerHandwriting *)self clearInput];

      goto LABEL_24;
    }
    [v31 deleteHandwritingStrokes:v17];
    int v29 = [(TIInputManagerHandwriting *)self userDrawing];
    uint64_t v30 = [v29 numberOfStrokes];

    if (v30) {
      goto LABEL_24;
    }
  }
  [(TIInputManagerHandwriting *)self clearInput];
LABEL_24:

LABEL_25:
}

- (void)clearInput
{
  [(TIInputManagerHandwriting *)self setUserDrawing:0];
  [(TIInputManagerHandwriting *)self setCandidates:0];
  [(TIInputManagerHandwriting *)self clearCandidateRefsDictionary];
  [(TIInputManagerHandwriting *)self cancelRecognition];
  v3.receiver = self;
  v3.super_class = (Class)TIInputManagerHandwriting;
  [(TIInputManagerHandwriting *)&v3 clearInput];
}

- (BOOL)updateCompletionCandidatesIfAppropriate
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TIInputManagerHandwriting *)self shouldLookForCompletionCandidates];
  if (!v3)
  {
    [(TIInputManagerHandwriting *)self resetCompletionStates];
    [(TIInputManagerHandwriting *)self setCandidates:MEMORY[0x263EFFA68]];
    return !v3;
  }
  [(TIInputManagerHandwriting *)self setCandidates:0];
  self->_showingCompletionCandidates = 0;
  [(TIInputManagerHandwriting *)self clearCandidateRefsDictionary];
  v4 = [(TIInputManagerHandwriting *)self contextBeforeWithDesiredLength:10];
  [(TIInputManagerHandwriting *)self setIsInCompletionMode:1];
  objc_super v5 = [MEMORY[0x263F089D8] string];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = [(TIInputManagerHandwriting *)self committedCandidates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v57;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendString:MecabraCandidateGetSurface()];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v8);
  }

  v11 = -[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", [v5 length] + 10);
  id v12 = [(TIInputManagerHandwriting *)self committedCandidates];
  if ([v12 count] && objc_msgSend(v5, "length"))
  {
    char v13 = [v11 hasSuffix:v5];

    if (v13) {
      goto LABEL_14;
    }
    id v12 = [(TIInputManagerHandwriting *)self committedCandidates];
    [v12 removeAllObjects];
  }

LABEL_14:
  v14 = [(TIInputManagerHandwriting *)self committedCandidates];
  uint64_t v15 = [v14 count];

  v40 = v4;
  if (!v15)
  {
    id v16 = v4;
    goto LABEL_21;
  }
  if ([v5 length] && objc_msgSend(v11, "hasSuffix:", v5))
  {
    objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(v5, "length"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v17 = v16;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_22:
  v18 = objc_msgSend(MEMORY[0x263F089D8], "string", v11);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v19 = [(TIInputManagerHandwriting *)self committedCandidates];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v19);
        }
        [v18 appendString:MecabraCandidateGetSurface()];
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v21);
  }

  unint64_t v24 = [MEMORY[0x263EFF980] array];
  uint64_t v25 = [MEMORY[0x263EFF980] array];
  v26 = [[GeneratePredictionsOperation alloc] initWithInputManager:self predictionOptions:[(TIInputManagerHandwriting *)self predictionOptions:0] prefixContext:v17];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke;
  v48[3] = &unk_2655356F0;
  v48[4] = self;
  id v27 = v24;
  id v49 = v27;
  v28 = v26;
  uint64_t v50 = v28;
  id v29 = v25;
  id v51 = v29;
  uint64_t v30 = (void *)MEMORY[0x2611ED830](v48);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_2;
  v44[3] = &unk_2655357B8;
  v44[4] = self;
  id v45 = v27;
  id v46 = v29;
  id v47 = v30;
  id v31 = v29;
  id v32 = v27;
  id v33 = v30;
  unint64_t v34 = (void *)MEMORY[0x2611ED830](v44);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_7;
  v41[3] = &unk_2655357E0;
  v42 = v28;
  id v43 = v34;
  id v35 = v34;
  v36 = v28;
  [(GeneratePredictionsOperation *)v36 setCompletionBlock:v41];
  v37 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  [v37 addOperation:v36];

  return !v3;
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke(id *a1)
{
  v2 = [a1[4] keyboardState];
  BOOL v3 = [v2 documentState];
  if ([v3 documentIsEmpty])
  {
  }
  else
  {
    char v4 = _os_feature_enabled_impl();

    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
  }
  objc_super v5 = (void *)MEMORY[0x263F7EB28];
  id v6 = [a1[4] keyboardState];
  uint64_t v7 = [v6 textInputTraits];
  uint64_t v8 = [v7 textContentType];
  uint64_t v9 = [a1[4] keyboardState];
  uint64_t v10 = [v9 documentState];
  v11 = [v10 contextBeforeInput];
  id v12 = [a1[4] keyboardState];
  char v13 = objc_msgSend(v5, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v8, v11, objc_msgSend(v12, "autofillMode"));

  if (v13) {
    [a1[5] addObject:v13];
  }

LABEL_7:
  v14 = [a1[4] candidateRefsDictionary];
  uint64_t v15 = [a1[6] candidateRefsDictionary];
  [v14 addEntriesFromDictionary:v15];

  id v16 = [a1[6] proactiveTriggers];

  if (v16)
  {
    id v17 = a1[5];
    v18 = [a1[6] proactiveTriggers];
    [v17 addObjectsFromArray:v18];
  }
  [a1[4] setProactiveTriggers:a1[5]];
  uint64_t v19 = [a1[6] candidates];

  if (v19)
  {
    id v20 = a1[7];
    uint64_t v21 = [a1[6] candidates];
    [v20 addObjectsFromArray:v21];
  }
  uint64_t v22 = [a1[6] stickers];

  if (v22)
  {
    id v23 = a1[7];
    unint64_t v24 = [a1[6] stickers];
    [v23 addObjectsFromArray:v24];
  }
  [a1[4] setCandidates:a1[7]];
  if ([a1[7] count]) {
    *((unsigned char *)a1[4] + 576) = 1;
  }
  id v25 = a1[4];
  id v26 = [v25 keyboardCandidateResultSetFromResults];
  [v25 closeCandidateGenerationContextWithResults:v26];
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_2(id *a1)
{
  v2 = [a1[4] keyboardState];
  BOOL v3 = [v2 documentState];
  if (![v3 documentIsEmpty]) {
    goto LABEL_6;
  }
  char v4 = [a1[4] keyboardState];
  uint64_t v5 = [v4 responseContext];
  if (!v5)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [MEMORY[0x263F7EB28] sharedInstance];
  char v8 = [v7 usePQT2Flow];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [a1[4] keyboardState];
    uint64_t v10 = [v9 clientIdentifier];

    v11 = [a1[4] keyboardState];
    id v12 = [v11 recipientIdentifier];

    char v13 = [a1[4] keyboardState];
    [v13 shiftState];

    v14 = [a1[4] inputMode];
    uint64_t v15 = [v14 languageWithRegion];

    id v16 = [a1[4] keyboardState];
    id v17 = [v16 responseContext];

    v18 = handwritingResponseKitBackgroundQueue();
    id v29 = a1[7];
    unint64_t v24 = v10;
    id v25 = v12;
    id v26 = v15;
    id v27 = a1[5];
    id v28 = a1[6];
    id v19 = v15;
    id v20 = v17;
    id v21 = v12;
    id v22 = v10;
    TIDispatchAsync();

    return;
  }
LABEL_7:
  id v23 = (void (*)(void))*((void *)a1[7] + 2);
  v23();
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_7(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_8;
  v3[3] = &unk_2655357E0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 addOperationWithBlock:v3];
}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompletionBlock:0];
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_3(uint64_t a1)
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_4;
  block[3] = &unk_265535718;
  id v20 = v21;
  id v19 = *(id *)(a1 + 88);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F7EAD8]) initWithClientIdentifier:*(void *)(a1 + 32) andRecipientContactInfo:*(void *)(a1 + 40)];
  if (*(_DWORD *)(a1 + 96) == 2) {
    uint64_t v4 = 512;
  }
  else {
    uint64_t v4 = 640;
  }
  id v5 = [MEMORY[0x263F64260] sharedManager];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [v3 identifierForResponseKit];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_5;
  v12[3] = &unk_265535768;
  id v17 = v21;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  v11 = *(void **)(a1 + 80);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  id v16 = *(id *)(a1 + 88);
  [v5 responsesForMessage:v6 maximumResponses:10 forContext:v7 withLanguage:v8 options:v4 completionBlock:v12];

  _Block_object_dispose(v21, 8);
}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  id v6 = a1[6];
  id v7 = a1[7];
  id v4 = v3;
  TIDispatchAsync();
}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_6(uint64_t result)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(result + 72) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = *(id *)(result + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v3) {
      goto LABEL_16;
    }
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    uint64_t v34 = *MEMORY[0x263F64280];
    uint64_t v31 = *MEMORY[0x263F64278];
    id v6 = (void *)MEMORY[0x263F51238];
    unint64_t v7 = 0x263F7E000uLL;
    uint64_t v30 = *(void *)v36;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v32 = v4;
      do
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        uint64_t v10 = [v9 attributes];

        if (v10)
        {
          v11 = [v9 attributes];
          id v12 = [v11 objectForKey:*v6];

          id v13 = [v9 attributes];
          if ([v12 isEqualToString:v34])
          {
            uint64_t v14 = [MEMORY[0x263F7EB38] rewriteMoneyAttributes:v13];

            id v13 = (void *)v14;
          }
          id v15 = (void *)[objc_alloc(*(Class *)(v7 + 2864)) initWithSourceType:1 attributes:v13];
          [*(id *)(v2 + 40) addObject:v15];
        }
        else
        {
          id v16 = [v9 string];

          if (!v16) {
            goto LABEL_14;
          }
          id v17 = objc_alloc(MEMORY[0x263F7E6A0]);
          v18 = [v9 string];
          id v19 = [v9 category];
          id v12 = (void *)[v17 initWithResponseKitString:v18 responseKitCategory:v19 mecabraCandidatePointerValue:0];

          [v12 setTypingEngine:6];
          id v20 = (void *)MEMORY[0x263F64240];
          id v21 = [*(id *)(v2 + 48) inputMode];
          char v22 = [v21 normalizedIdentifier];
          id v23 = TIInputModeGetBaseLanguage();
          [v20 incrementAggdKeyForCategory:0 forAction:v31 withLanguageID:v23];

          unint64_t v24 = (void *)MEMORY[0x263F64240];
          id v25 = [v9 category];
          id v26 = [*(id *)(v2 + 48) inputMode];
          id v27 = [v26 normalizedIdentifier];
          id v28 = TIInputModeGetBaseLanguage();
          id v29 = v24;
          uint64_t v5 = v30;
          unint64_t v7 = 0x263F7E000;
          [v29 incrementAggdKeyForCategory:v25 forAction:v31 withLanguageID:v28];

          uint64_t v4 = v32;
          [*(id *)(v2 + 56) addObject:v12];
        }

LABEL_14:
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v4)
      {
LABEL_16:

        return (*(uint64_t (**)(void))(*(void *)(v2 + 64) + 16))();
      }
    }
  }
  return result;
}

- (void)resetCompletionStates
{
  self->_showingCompletionCandidates = 0;
  [(TIInputManagerHandwriting *)self setIsInCompletionMode:0];
}

- (BOOL)shouldLookForCompletionCandidates
{
  if ([(TIInputManagerHandwriting *)self inputCount])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = [(TIInputManagerHandwriting *)self userDrawing];
    if (v4) {
      LOBYTE(v3) = 0;
    }
    else {
      BOOL v3 = ![(TIInputManagerHandwriting *)self showingFacemarks];
    }
  }
  return v3;
}

- (unint64_t)predictionOptions:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(TIInputManagerHandwriting *)self shouldLearnAcceptedCandidate]) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = v4 | 4;
  }
  id v6 = [(TIInputManagerHandwriting *)self keyboardState];
  int v7 = [v6 candidateSelectionPredictionEnabled];

  if (v7) {
    return v5;
  }
  else {
    return v5 | 0x20;
  }
}

- (void)clearCandidateRefsDictionary
{
  id v2 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
  [v2 removeAllObjects];
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 proactiveTrigger];

  if ([(TIInputManagerHandwriting *)self isInCompletionMode])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();
  if ([v4 isResponseKitCandidate])
  {
    uint64_t v8 = (void *)MEMORY[0x263F64240];
    uint64_t v9 = *MEMORY[0x263F64270];
    uint64_t v10 = [(TIKeyboardInputManagerBase *)self inputMode];
    v11 = [v10 normalizedIdentifier];
    TIInputModeGetBaseLanguage();
    char v69 = isKindOfClass;
    char v12 = v7;
    v14 = id v13 = v5;
    [v8 incrementAggdKeyForCategory:0 forAction:v9 withLanguageID:v14];

    id v15 = (void *)MEMORY[0x263F64240];
    id v16 = [v4 responseKitCategory];
    id v17 = [(TIKeyboardInputManagerBase *)self inputMode];
    v18 = [v17 normalizedIdentifier];
    id v19 = TIInputModeGetBaseLanguage();
    [v15 incrementAggdKeyForCategory:v16 forAction:v9 withLanguageID:v19];

    unint64_t v5 = v13;
    char v7 = v12;
    char isKindOfClass = v69;
  }
  if (!v5) {
    goto LABEL_11;
  }
  if (![(TIInputManagerHandwriting *)self shouldLearnAcceptedCandidate]) {
    goto LABEL_11;
  }
  id v20 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
  id v21 = [v4 proactiveTrigger];
  char v22 = [v21 attributes];
  id v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F7E968]];
  unint64_t v24 = [v20 objectForKeyedSubscript:v23];

  if (v24)
  {
    id v25 = [v4 candidate];
    MecabraCandidateSetDisplayString();

    id v26 = [(TIInputManagerHandwriting *)self wordSearch];
    [v26 acceptCandidate:v24];

    id v27 = [(TIInputManagerHandwriting *)self committedCandidates];
    [v27 addObject:v24];

    char v28 = 1;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
    char v28 = 0;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
  }
  if ([(TIInputManagerHandwriting *)self shouldLearnAcceptedCandidate])
  {
    id v29 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
    uint64_t v30 = [v4 mecabraCandidatePointerValue];
    uint64_t v31 = [v29 objectForKeyedSubscript:v30];

    if (v31)
    {
      uint64_t v32 = [(TIInputManagerHandwriting *)self wordSearch];
      [v32 acceptCandidate:v31];

      id v33 = [(TIInputManagerHandwriting *)self committedCandidates];
      [v33 addObject:v31];

      char v28 = 1;
    }
  }
LABEL_15:
  if ((v7 & 1) != 0 && [(TIInputManagerHandwriting *)self shouldLearnAcceptedCandidate])
  {
    id v34 = v4;
    if ([v34 uniqueID])
    {
      long long v35 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
      long long v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v34, "uniqueID"));
      long long v37 = [v35 objectForKeyedSubscript:v36];

      if (v37)
      {
        long long v38 = [(TIInputManagerHandwriting *)self wordSearch];
        [v38 acceptCandidate:v37];

        char v39 = [(TIInputManagerHandwriting *)self committedCandidates];
        [v39 addObject:v37];

        char v28 = 1;
      }
    }
    if ([v34 completionUniqueID])
    {
      if ([(TIInputManagerHandwriting *)self shouldLearnAcceptedCandidate])
      {
        uint64_t v40 = [(TIInputManagerHandwriting *)self candidateRefsDictionary];
        v41 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v34, "completionUniqueID"));
        v42 = [v40 objectForKeyedSubscript:v41];

        if (v42)
        {
          id v43 = [(TIInputManagerHandwriting *)self wordSearch];
          [v43 acceptCandidate:v42];

          unint64_t v44 = [(TIInputManagerHandwriting *)self committedCandidates];
          [v44 addObject:v42];

          goto LABEL_27;
        }
      }
    }
  }
  if (v28) {
    goto LABEL_28;
  }
  id v34 = [(TIInputManagerHandwriting *)self committedCandidates];
  [v34 removeAllObjects];
LABEL_27:

LABEL_28:
  id v45 = [(TIInputManagerHandwriting *)self committedCandidates];
  unint64_t v46 = [v45 count];

  if (v46 >= 0xB)
  {
    id v47 = [(TIInputManagerHandwriting *)self committedCandidates];
    v48 = [(TIInputManagerHandwriting *)self committedCandidates];
    objc_msgSend(v47, "removeObjectsInRange:", 0, objc_msgSend(v48, "count") - 10);
  }
  id v49 = [v4 candidate];
  uint64_t v50 = [(TIInputManagerHandwriting *)self userDrawing];

  if (v50)
  {
    id v51 = [(TIInputManagerHandwriting *)self usageTrackingKeyForStatistic:*MEMORY[0x263F7E8F0]];
    long long v52 = [(TIInputManagerHandwriting *)self userDrawing];
    [v52 totalNumberOfPoints];
    TIStatisticDistributionPushValue();

    long long v53 = [(TIInputManagerHandwriting *)self usageTrackingKeyForStatistic:*MEMORY[0x263F7E8F8]];
    long long v54 = [(TIInputManagerHandwriting *)self userDrawing];
    [v54 numberOfStrokes];
    TIStatisticDistributionPushValue();
  }
  if ([(TIInputManagerHandwriting *)self isInCompletionMode])
  {
    long long v55 = [(TIInputManagerHandwriting *)self usageTrackingKeyForStatistic:*MEMORY[0x263F7E8E0]];
    TIStatisticScalarIncrement();
  }
  long long v56 = NSString;
  uint64_t v57 = *MEMORY[0x263F7E8D8];
  long long v58 = [(TIInputManagerHandwriting *)self candidates];
  long long v59 = [v56 stringWithFormat:@"%@.%lu", v57, objc_msgSend(v58, "indexOfObject:", v4)];

  uint64_t v60 = [(TIInputManagerHandwriting *)self usageTrackingKeyForStatistic:v59];
  TIStatisticScalarIncrement();

  if ([v4 isAddress])
  {
    uint64_t v61 = [(TIInputManagerHandwriting *)self keyboardState];
    uint64_t v62 = [v61 documentState];
    v63 = [v62 contextBeforeInput];
    if ([v63 length])
    {
      uint64_t v64 = [v49 _firstGrapheme];
      char v65 = [v64 _containsCJScripts];

      if (v65) {
        goto LABEL_40;
      }
      [@" " stringByAppendingString:v49];
      id v49 = v61 = v49;
    }
    else
    {
    }
  }
LABEL_40:
  if (v5) {
    v66 = v49;
  }
  else {
    v66 = 0;
  }
  id v67 = v66;

  return v67;
}

- (void)mainThreadUpdateCandidates:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isCancelled] & 1) == 0)
  {
    unint64_t v5 = [(TIInputManagerHandwriting *)self userDrawing];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x263EFF980];
      char v7 = [v4 candidates];
      id v29 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      char v28 = v4;
      uint64_t v8 = [v4 candidates];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v30 + 1) + 8 * v12) mecabraHandwritingCandidate];
            if (v13)
            {
              uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F7E558]) initWithCandidate:MecabraCandidateGetSurface() forInput:0 uniqueID:v13 completionUniqueID:0];
              [(TIInputManagerHandwriting *)self candidateRefsDictionary];
              v16 = id v15 = self;
              id v17 = [NSNumber numberWithUnsignedLongLong:v13];
              [v16 setObject:v13 forKey:v17];

              self = v15;
              [v29 addObject:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v10);
      }

      id v4 = v28;
      v18 = [v28 stickers];
      id v19 = [(TIInputManagerHandwriting *)self processCandidates:v29 stickers:v18];
      [(TIInputManagerHandwriting *)self setCandidates:v19];

      [(TIInputManagerHandwriting *)self resetCompletionStates];
      id v20 = [(TIInputManagerHandwriting *)self candidates];

      if (v20)
      {
        id v21 = [(TIInputManagerHandwriting *)self candidates];
        char v22 = [(TIInputManagerHandwriting *)self proactiveTriggers];
        id v23 = [(TIInputManagerHandwriting *)self candidateResultSetFromCandidates:v21 proactiveTriggers:v22];
      }
      else
      {
        unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
        id v25 = [MEMORY[0x263EFF9D0] null];
        id v26 = [v24 arrayWithObject:v25];
        [(TIInputManagerHandwriting *)self setCandidates:v26];

        id v23 = [MEMORY[0x263F7E638] dummySet];
      }
      id v27 = [(TIInputManagerHandwriting *)self markedTextForDefaultCandidate];
      [(TIInputManagerHandwriting *)self setInput:v27];

      [(TIInputManagerHandwriting *)self setMarkedText];
      [(TIInputManagerHandwriting *)self closeCandidateGenerationContextWithResults:v23];
    }
  }
}

- (BOOL)updateCandidates
{
  [(TIInputManagerHandwriting *)self cancelRecognition];
  BOOL v3 = [(TIInputManagerHandwriting *)self showingFacemarks];
  if (!v3)
  {
    id v4 = [(TIInputManagerHandwriting *)self userDrawing];

    if (v4)
    {
      unint64_t v5 = [MEMORY[0x263F7EB60] sharedOperationQueue];
      id v6 = [RecognizeDrawingOperation alloc];
      char v7 = [(TIInputManagerHandwriting *)self userDrawing];
      uint64_t v8 = [(TIInputManagerHandwriting *)self historyForRecognition];
      uint64_t v9 = [(RecognizeDrawingOperation *)v6 initWithInputManager:self strokes:v7 history:v8];
      [v5 addOperation:v9];
    }
  }
  return v3;
}

- (id)historyForRecognition
{
  return (id)[(TIInputManagerHandwriting *)self contextBeforeWithDesiredLength:10];
}

- (id)addInputObject:(id)a3
{
  id v4 = a3;
  [(TIInputManagerHandwriting *)self cancelRecognition];
  [(TIInputManagerHandwriting *)self setUserDrawing:v4];

  [(TIInputManagerHandwriting *)self resetCompletionStates];
  unint64_t v5 = [(TIInputManagerHandwriting *)self userDrawing];
  uint64_t v6 = [v5 numberOfStrokes];

  if (!v6) {
    [(TIInputManagerHandwriting *)self clearInput];
  }
  return &stru_270B867F0;
}

- (void)cancelRecognition
{
  BOOL v3 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  id v4 = [v3 operations];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__TIInputManagerHandwriting_cancelRecognition__block_invoke;
  v5[3] = &unk_2655356C8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __46__TIInputManagerHandwriting_cancelRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v9;
    id v4 = [v3 manager];
    unint64_t v5 = *(void **)(a1 + 32);

    if (v4 == v5) {
      [v3 cancel];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    char v7 = [v6 inputManager];
    uint64_t v8 = *(void **)(a1 + 32);

    if (v7 == v8) {
      [v6 cancel];
    }
  }
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 object];

  if (v8)
  {
    id v9 = [v6 object];
    uint64_t v10 = [(TIInputManagerHandwriting *)self addInputObject:v9];
    [v6 setString:v10];
  }
  uint64_t v11 = [v6 string];
  [(TIInputManagerHandwriting *)self setShowingFacemarks:0];
  int v12 = [v11 isEqualToString:@"☻"];
  id v13 = [(TIInputManagerHandwriting *)self candidates];
  uint64_t v14 = v13;
  if (!v12)
  {
    if (v13 && !self->_showingCompletionCandidates)
    {
      uint64_t v22 = [v11 length];

      if (v22)
      {
        [(TIInputManagerHandwriting *)self acceptCurrentCandidateWithContext:v7];
        [(TIInputManagerHandwriting *)self setCandidates:0];
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v17 = [(TIInputManagerHandwriting *)self candidates];
    if (v17)
    {
      BOOL showingCompletionCandidates = self->_showingCompletionCandidates;

      if (!showingCompletionCandidates)
      {
LABEL_13:
        uint64_t v19 = [(TIInputManagerHandwriting *)self markedTextForDefaultCandidate];

        [(TIInputManagerHandwriting *)self setInput:v19];
        [(TIInputManagerHandwriting *)self setMarkedText];
        uint64_t v11 = (void *)v19;
        goto LABEL_22;
      }
    }
    else if (![(TIInputManagerHandwriting *)self inputCount])
    {
      id v20 = [(TIInputManagerHandwriting *)self userDrawing];
      if ([v20 numberOfStrokes])
      {
        BOOL v21 = self->_showingCompletionCandidates;

        if (!v21) {
          goto LABEL_13;
        }
      }
      else
      {
      }
    }
LABEL_21:
    [v7 insertText:v11];
    goto LABEL_22;
  }
  if (v13)
  {
    BOOL v15 = self->_showingCompletionCandidates;

    if (!v15)
    {
      [(TIInputManagerHandwriting *)self acceptCurrentCandidateWithContext:v7];
      [(TIInputManagerHandwriting *)self setCandidates:0];
    }
  }
  id v16 = [(TIInputManagerHandwriting *)self facemarkCandidates];
  [(TIInputManagerHandwriting *)self setCandidates:v16];

  self->_BOOL showingCompletionCandidates = 0;
  [(TIInputManagerHandwriting *)self setShowingFacemarks:1];
  [v6 setString:*MEMORY[0x263F7EBF8]];
  v23.receiver = self;
  v23.super_class = (Class)TIInputManagerHandwriting;
  [(TIInputManagerHandwriting *)&v23 addInput:v6 withContext:v7];
LABEL_22:
}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  if (a4)
  {
    unint64_t v5 = [a3 inputForMarkedText];
    uint64_t v6 = [v5 length];

    if (!v6)
    {
      [(TIInputManagerHandwriting *)self clearInput];
    }
  }
}

- (NSArray)facemarkCandidates
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  facemarkCandidates = self->_facemarkCandidates;
  if (!facemarkCandidates)
  {
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = objc_alloc(MEMORY[0x263EFF960]);
    uint64_t v6 = [(TIKeyboardInputManagerBase *)self inputMode];
    id v7 = [v6 languageWithRegion];
    uint64_t v8 = (void *)[v5 initWithLocaleIdentifier:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)[MEMORY[0x263F8C520] copyFacemarkCandidatesForLocale:v8];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = *MEMORY[0x263F7EBF8];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v15 = (void *)MEMORY[0x263F7E640];
          id v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) string];
          id v17 = [v15 candidateWithCandidate:v16 forInput:v13];
          [(NSArray *)v4 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v18 = self->_facemarkCandidates;
    self->_facemarkCandidates = v4;

    facemarkCandidates = self->_facemarkCandidates;
  }
  return facemarkCandidates;
}

- (id)markedTextForDefaultCandidate
{
  id v2 = [(TIInputManagerHandwriting *)self defaultCandidate];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 candidate];
  }
  else
  {
    id v4 = @"　";
  }

  return v4;
}

- (BOOL)isDummyCandidate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9D0];
  id v4 = a3;
  id v5 = [v3 null];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (unint64_t)initialSelectedIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)defaultCandidate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(TIInputManagerHandwriting *)self candidates];
  if (![v3 count])
  {

    goto LABEL_14;
  }
  int v4 = [(TIInputManagerHandwriting *)self inputCount];

  if (!v4)
  {
LABEL_14:
    id v11 = 0;
    goto LABEL_19;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(TIInputManagerHandwriting *)self candidates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      if (![(TIInputManagerHandwriting *)self isDummyCandidate:v10]
        && ![v10 isExtensionCandidate])
      {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_12:
  }
  uint64_t v12 = [(TIInputManagerHandwriting *)self candidates];
  uint64_t v13 = [v12 objectAtIndex:0];

  id v11 = 0;
  if (![(TIInputManagerHandwriting *)self isDummyCandidate:v13]) {
    id v11 = v13;
  }

LABEL_19:
  return v11;
}

- (id)keyboardCandidateResultSetFromResults
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = __Block_byref_object_copy__787;
  id v29 = __Block_byref_object_dispose__788;
  id v30 = 0;
  id v3 = [(TIInputManagerHandwriting *)self proactiveTriggers];
  if ([v3 count])
  {
  }
  else
  {
    int v4 = [MEMORY[0x263F7EB28] sharedInstance];
    int v5 = [v4 usePQT2Flow];

    if (!v5) {
      goto LABEL_10;
    }
  }
  uint64_t v6 = [(TIInputManagerHandwriting *)self keyboardState];
  uint64_t v7 = [v6 secureCandidateRenderTraits];
  [v7 setDisableHideMyEmail:1];

  uint64_t v8 = [(TIInputManagerHandwriting *)self keyboardState];
  uint64_t v9 = [v8 secureCandidateRenderTraits];

  [v9 singleCellWidth];
  if (v10 > 0.0 && ([v9 singleCellHeight], v11 > 0.0)
    || ([v9 cellWidthOptions], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    uint64_t v13 = [(TIInputManagerHandwriting *)self candidateHandlerForOpenRequest];
    uint64_t v14 = [v13 asynchronous];

    long long v15 = [(TIInputManagerHandwriting *)self proactiveTriggers];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__TIInputManagerHandwriting_keyboardCandidateResultSetFromResults__block_invoke;
    v23[3] = &unk_265535698;
    char v24 = v14;
    v23[4] = self;
    v23[5] = &v25;
    [(TIInputManagerHandwriting *)self generateAndRenderProactiveSuggestionsWithTriggers:v15 withAdditionalPredictions:0 withInput:&stru_270B867F0 async:v14 completionHandler:v23];
  }
  else
  {
    if (!TICanLogMessageAtLevel()) {
      goto LABEL_9;
    }
    long long v15 = TIOSLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s ProactiveQuickType:TI: Not generating proactive candidates - invalid secure candidate width or height trait", "-[TIInputManagerHandwriting keyboardCandidateResultSetFromResults]");
      *(_DWORD *)buf = 138412290;
      long long v32 = v22;
      _os_log_debug_impl(&dword_25EC0A000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

LABEL_9:
LABEL_10:
  if ([(id)v26[5] count])
  {
    long long v16 = (void *)MEMORY[0x263F7E638];
    uint64_t v17 = v26[5];
    long long v18 = [(TIInputManagerHandwriting *)self proactiveTriggers];
    uint64_t v19 = [v16 setWithCandidates:v17 proactiveTriggers:v18];
  }
  else
  {
    long long v18 = [(TIInputManagerHandwriting *)self candidates];
    uint64_t v20 = [(TIInputManagerHandwriting *)self proactiveTriggers];
    uint64_t v19 = [(TIInputManagerHandwriting *)self candidateResultSetFromCandidates:v18 proactiveTriggers:v20];
  }
  _Block_object_dispose(&v25, 8);

  return v19;
}

void __66__TIInputManagerHandwriting_keyboardCandidateResultSetFromResults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (*(unsigned char *)(a1 + 48) && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    int v5 = (void *)MEMORY[0x263F7E638];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [*(id *)(a1 + 32) proactiveTriggers];
    uint64_t v8 = [v5 setWithCandidates:v6 proactiveTriggers:v7];

    [*(id *)(a1 + 32) pushCandidateGenerationContextWithResults:v8];
  }
  if (TICanLogMessageAtLevel())
  {
    uint64_t v9 = TIOSLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double v10 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: Generated proactive candidates: %@", "-[TIInputManagerHandwriting keyboardCandidateResultSetFromResults]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v10;
      _os_log_debug_impl(&dword_25EC0A000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (id)candidateResultSet
{
  if ([(TIInputManagerHandwriting *)self shouldSkipCandidateSelection])
  {
    id v3 = 0;
    goto LABEL_10;
  }
  id v4 = [(TIInputManagerHandwriting *)self userDrawing];
  if (v4)
  {
  }
  else if (![(TIInputManagerHandwriting *)self showingFacemarks])
  {
    if ([(TIInputManagerHandwriting *)self updateCompletionCandidatesIfAppropriate])
    {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if ([(TIInputManagerHandwriting *)self updateCandidates])
  {
LABEL_7:
    id v3 = [(TIInputManagerHandwriting *)self keyboardCandidateResultSetFromResults];
    goto LABEL_10;
  }
LABEL_9:
  id v3 = [MEMORY[0x263F7E638] dummySet];
LABEL_10:
  return v3;
}

- (BOOL)shouldCommitInputString
{
  if (self->_showingCompletionCandidates) {
    return 1;
  }
  id v3 = [(TIInputManagerHandwriting *)self keyboardState];
  char v4 = [v3 hardwareKeyboardMode];

  return v4;
}

- (BOOL)shouldUpdateDictionaryPaths
{
  return 0;
}

- (void)updateDictionaryPaths
{
  if ([(TIInputManagerHandwriting *)self shouldUpdateDictionaryPaths])
  {
    id v3 = [(TIInputManagerHandwriting *)self recognizerProvider];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __50__TIInputManagerHandwriting_updateDictionaryPaths__block_invoke;
    v4[3] = &unk_265535670;
    v4[4] = self;
    [v3 provideRecognizerToBlock:v4];
  }
}

void __50__TIInputManagerHandwriting_updateDictionaryPaths__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F7EB00];
  char v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 inputMode];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v8 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  uint64_t v9 = [v3 loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer:v5 inputModes:v7 onQueue:v8 oldMobileAssetChangeListener:*(void *)(*(void *)(a1 + 32) + 600)];

  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(void **)(v10 + 600);
  *(void *)(v10 + 600) = v9;
}

- (void)updateUserWordEntries
{
  id v3 = self->_userDictionaryObserver;
  char v4 = [(TIInputManagerHandwriting *)self recognizerProvider];
  id v5 = [MEMORY[0x263F7EB58] sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke;
  v10[3] = &unk_265535648;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [v5 addObserver:v10];
  id userDictionaryObserver = self->_userDictionaryObserver;
  self->_id userDictionaryObserver = v7;

  if (v3)
  {
    uint64_t v9 = [MEMORY[0x263F7EB58] sharedInstance];
    [v9 removeObserver:v3];
  }
}

void __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke_2;
  v6[3] = &unk_2655355F8;
  id v7 = v3;
  id v5 = v3;
  [v4 provideRecognizerToBlock:v6];
}

void __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 updateUserDictionaryLexicon:*(void *)(a1 + 32)];
  }
}

- (void)updateAddressBook
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2611ED830](self->_contactObserver, a2);
  char v4 = [(TIInputManagerHandwriting *)self recognizerProvider];
  id v5 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIInputManagerHandwriting:updateAddressBook - adding observer", "-[TIInputManagerHandwriting updateAddressBook]");
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v6;
    _os_log_impl(&dword_25EC0A000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v7 = [MEMORY[0x263F7EB40] sharedInstance];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __46__TIInputManagerHandwriting_updateAddressBook__block_invoke;
  uint64_t v17 = &unk_265535620;
  id v8 = v4;
  id v18 = v8;
  uint64_t v9 = [v7 addContactObserver:&v14];
  id contactObserver = self->_contactObserver;
  self->_id contactObserver = v9;

  if (v3)
  {
    id v11 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIInputManagerHandwriting:updateAddressBook - removing observer", "-[TIInputManagerHandwriting updateAddressBook]", v14, v15, v16, v17);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      _os_log_impl(&dword_25EC0A000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x263F7EB40] sharedInstance];
    [v13 removeContactObserver:v3];
  }
}

void __46__TIInputManagerHandwriting_updateAddressBook__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIInputManagerHandwriting:updateAddressBook - processing %ld contacts", "-[TIInputManagerHandwriting updateAddressBook]_block_invoke", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_25EC0A000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v6 = TICreateNameReadingPairsFromContactCollection();
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__TIInputManagerHandwriting_updateAddressBook__block_invoke_207;
  v9[3] = &unk_2655355F8;
  id v10 = v6;
  id v8 = v6;
  [v7 provideRecognizerToBlock:v9];
}

void __46__TIInputManagerHandwriting_updateAddressBook__block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 updateAddressBookLexicon:*(void *)(a1 + 32)];
  }
}

- (void)suspend
{
  id v3 = [(TIInputManagerHandwriting *)self committedCandidates];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)TIInputManagerHandwriting;
  [(TIKeyboardInputManagerBase *)&v4 suspend];
}

- (void)keyboardActivityDidTransition:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([a3 toState] == 3)
  {
    if (TICanLogMessageAtLevel())
    {
      objc_super v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s releasing CHRecognizer due to kbd inactivity", "-[TIInputManagerHandwriting keyboardActivityDidTransition:]");
        *(_DWORD *)buf = 138412290;
        id v8 = v6;
        _os_log_debug_impl(&dword_25EC0A000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v5 = [(TIInputManagerHandwriting *)self recognizerProvider];
    [v5 unloadRecognizer];
  }
}

- (RecognizerProvider)recognizerProvider
{
  recognizerProvider = self->_recognizerProvider;
  if (!recognizerProvider)
  {
    objc_super v4 = [RecognizerProvider alloc];
    id v5 = [(TIInputManagerHandwriting *)self recognitionLanguage];
    id v6 = [(RecognizerProvider *)v4 initWithRecognitionLanguage:v5 mode:[(TIInputManagerHandwriting *)self recognitionMode]];
    id v7 = self->_recognizerProvider;
    self->_recognizerProvider = v6;

    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_recognizerProvider);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__TIInputManagerHandwriting_recognizerProvider__block_invoke;
    v9[3] = &unk_2655355D0;
    objc_copyWeak(&v10, &location);
    objc_copyWeak(&v11, &from);
    [(RecognizerProvider *)self->_recognizerProvider setRecognizerDidLoadBlock:v9];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    recognizerProvider = self->_recognizerProvider;
  }
  return recognizerProvider;
}

void __47__TIInputManagerHandwriting_recognizerProvider__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained updateAddressBook];

    id v4 = objc_loadWeakRetained(v2);
    [v4 updateUserWordEntries];

    id v8 = objc_loadWeakRetained(v2);
    [v8 updateDictionaryPaths];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [MEMORY[0x263F08A48] mainQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__TIInputManagerHandwriting_recognizerProvider__block_invoke_2;
    v9[3] = &unk_2655355A8;
    id v10 = v5;
    id v7 = v5;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    [v6 addOperationWithBlock:v9];

    objc_destroyWeak(&v11);
  }
}

void __47__TIInputManagerHandwriting_recognizerProvider__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recognizerDidLoadBlock];

  if (v2)
  {
    id v3 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained updateAddressBook];

    id v5 = objc_loadWeakRetained(v3);
    [v5 updateUserWordEntries];

    id v6 = objc_loadWeakRetained(v3);
    [v6 updateDictionaryPaths];
  }
}

- (CHRecognizer)recognizer
{
  id v2 = [(TIInputManagerHandwriting *)self recognizerProvider];
  id v3 = [v2 recognizer];

  return (CHRecognizer *)v3;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_contactObserver)
  {
    id v3 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIInputManagerHandwriting:delloc - removing observer", "-[TIInputManagerHandwriting dealloc]");
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_25EC0A000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v5 = [MEMORY[0x263F7EB40] sharedInstance];
    [v5 removeContactObserver:self->_contactObserver];
  }
  if (self->_userDictionaryObserver)
  {
    id v6 = [MEMORY[0x263F7EB58] sharedInstance];
    [v6 removeObserver:self->_userDictionaryObserver];
  }
  if (self->_dictionaryUpdateObserver)
  {
    objc_msgSend(MEMORY[0x263F7EB00], "removeMobileAssetListener:");
    id dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
    self->_id dictionaryUpdateObserver = 0;
  }
  [(RecognizerProvider *)self->_recognizerProvider setRecognizerDidLoadBlock:0];
  id v8 = [MEMORY[0x263F7EA90] sharedController];
  [v8 removeActivityObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)TIInputManagerHandwriting;
  [(TIInputManagerHandwriting *)&v9 dealloc];
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (TIInputManagerHandwriting)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIInputManagerHandwriting;
  id v7 = [(TIInputManagerHandwriting *)&v18 initWithConfig:v6 keyboardState:a4];
  if (v7)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    candidateRefsDictionary = v7->_candidateRefsDictionary;
    v7->_candidateRefsDictionary = v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    committedCandidates = v7->_committedCandidates;
    v7->_committedCandidates = v10;

    uint64_t v12 = [MEMORY[0x263F7EB70] sharedWordSearchController];
    uint64_t v13 = [v6 inputMode];
    uint64_t v14 = [v12 wordSearchForInputMode:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v7->_wordSearch, v14);
    }
    id v15 = [(TIInputManagerHandwriting *)v7 recognizer];
    long long v16 = [MEMORY[0x263F7EA90] sharedController];
    [v16 addActivityObserver:v7];
  }
  return v7;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)clearObservers
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_contactObserver)
  {
    id v3 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIInputManagerHandwriting:clearObservers - removing observer", "-[TIInputManagerHandwriting(TestingSupport) clearObservers]");
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_25EC0A000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v5 = [MEMORY[0x263F7EB40] sharedInstance];
    [v5 removeContactObserver:self->_contactObserver];

    id contactObserver = self->_contactObserver;
    self->_id contactObserver = 0;
  }
}

@end