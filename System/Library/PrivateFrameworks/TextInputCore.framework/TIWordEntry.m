@interface TIWordEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelled;
- (BOOL)candidateContainsEmoji;
- (BOOL)deleted;
- (BOOL)editActionExtendsPriorWord;
- (BOOL)endsWithNewLine;
- (BOOL)extendsPriorWord;
- (BOOL)followsContinuousPath;
- (BOOL)includesCursorEdits;
- (BOOL)includesOrientationChange;
- (BOOL)isContinuousPathCompletion;
- (BOOL)isFromStaticLexicon;
- (BOOL)isMultilingual;
- (BOOL)isOOV;
- (BOOL)isPeriodFromDoubleSpaceEntry;
- (BOOL)isPunctuationEntryFollowingAWord;
- (BOOL)isRetrocorrection;
- (BOOL)originalWordInAlignment;
- (BOOL)startsWithNewLine;
- (BOOL)wasRevised;
- (NSArray)allKeyboardInputs;
- (NSArray)allTouches;
- (NSArray)candidatesOffered;
- (NSArray)touchLayouts;
- (NSMutableArray)allEdits;
- (NSMutableArray)allKeyboardInputsM;
- (NSMutableArray)allTouchesM;
- (NSMutableArray)candidatesOfferedM;
- (NSMutableArray)touchLayoutsM;
- (NSString)acceptedString;
- (NSString)inputContext;
- (NSString)inputStem;
- (NSString)orientation;
- (NSString)originalAcceptedString;
- (TIKeyboardCandidate)acceptedCandidate;
- (TIKeyboardCandidate)originalCandidate;
- (TIKeyboardInput)inputTriggeredTextAccepted;
- (TIWordEntry)editedEntry;
- (TIWordEntry)init;
- (TIWordEntry)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithContext;
- (id)documentContextBeforeInput;
- (id)resolveBackspacesInKeyboardInputs;
- (id)textFromResolvedKeyboardInputs:(id)a3;
- (id)trimmedDocumentContextBeforeInput;
- (int)editActionType;
- (int)leadingBackspaceCountFromResolvedKeyboardInputs:(id)a3;
- (int)origin;
- (int)touchAlignmentConf;
- (int)unfinishedWordEntryTreatment;
- (int)wordAlignmentConf;
- (int)wordEntryType;
- (int64_t)candidateIndex;
- (int64_t)layoutID;
- (unint64_t)alignmentConflicts;
- (unint64_t)sessionIndex;
- (void)addCandidateOffered:(id)a3;
- (void)addKeyInput:(id)a3;
- (void)addTouchEvent:(id)a3 withLayoutId:(unint64_t)a4;
- (void)addUserEdit:(id)a3;
- (void)clearCandidatesOffered;
- (void)clearKeyInputs;
- (void)clearTouches;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptedCandidate:(id)a3;
- (void)setAcceptedString:(id)a3;
- (void)setAlignmentConflicts:(unint64_t)a3;
- (void)setAllEdits:(id)a3;
- (void)setAllKeyboardInputsM:(id)a3;
- (void)setAllTouchesM:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCandidateIndex:(int64_t)a3;
- (void)setCandidatesOfferedM:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setEditActionExtendsPriorWord:(BOOL)a3;
- (void)setEditActionType:(int)a3;
- (void)setExtendsPriorWord:(BOOL)a3;
- (void)setFollowsContinuousPath:(BOOL)a3;
- (void)setIncludesCursorEdits:(BOOL)a3;
- (void)setIncludesOrientationChange:(BOOL)a3;
- (void)setInputContext:(id)a3;
- (void)setInputStem:(id)a3;
- (void)setInputTriggeredTextAccepted:(id)a3;
- (void)setIsContinuousPathCompletion:(BOOL)a3;
- (void)setIsFromStaticLexicon:(BOOL)a3;
- (void)setIsMultilingual:(BOOL)a3;
- (void)setIsOOV:(BOOL)a3;
- (void)setIsPunctuationEntryFollowingAWord:(BOOL)a3;
- (void)setIsRetrocorrection:(BOOL)a3;
- (void)setLayoutID:(int64_t)a3;
- (void)setOrientation:(id)a3;
- (void)setOrigin:(int)a3;
- (void)setOriginalAcceptedString:(id)a3;
- (void)setOriginalCandidate:(id)a3;
- (void)setOriginalWordInAlignment:(BOOL)a3;
- (void)setSessionIndex:(unint64_t)a3;
- (void)setTouchAlignmentConf:(int)a3;
- (void)setTouchLayoutsM:(id)a3;
- (void)setUnfinishedWordEntryTreatment:(int)a3;
- (void)setWordAlignmentConf:(int)a3;
- (void)setWordEntryType:(int)a3;
- (void)trimLeadingAndTrailingCharacters:(id)a3 fromResolvedInputs:(id)a4;
@end

@implementation TIWordEntry

- (id)trimmedDocumentContextBeforeInput
{
  v2 = [(TIWordEntry *)self documentContextBeforeInput];
  v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (id)documentContextBeforeInput
{
  v2 = [(TIUserAction *)self documentState];
  uint64_t v3 = [v2 contextBeforeInput];

  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_1F3F7A998;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEdits, 0);
  objc_storeStrong((id *)&self->_inputContext, 0);
  objc_storeStrong((id *)&self->_inputStem, 0);
  objc_storeStrong((id *)&self->_originalCandidate, 0);
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
  objc_storeStrong((id *)&self->_touchLayoutsM, 0);
  objc_storeStrong((id *)&self->_candidatesOfferedM, 0);
  objc_storeStrong((id *)&self->_allTouchesM, 0);
  objc_storeStrong((id *)&self->_allKeyboardInputsM, 0);
  objc_storeStrong((id *)&self->_inputTriggeredTextAccepted, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
  objc_storeStrong((id *)&self->_originalAcceptedString, 0);

  objc_storeStrong((id *)&self->_acceptedString, 0);
}

- (void)setOrigin:(int)a3
{
  self->_origin = a3;
}

- (int)origin
{
  return self->_origin;
}

- (void)setOriginalWordInAlignment:(BOOL)a3
{
  self->_originalWordInAlignment = a3;
}

- (BOOL)originalWordInAlignment
{
  return self->_originalWordInAlignment;
}

- (void)setIsPunctuationEntryFollowingAWord:(BOOL)a3
{
  self->_isPunctuationEntryFollowingAWord = a3;
}

- (BOOL)isPunctuationEntryFollowingAWord
{
  return self->_isPunctuationEntryFollowingAWord;
}

- (void)setCandidateIndex:(int64_t)a3
{
  self->_candidateIndex = a3;
}

- (int64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (void)setAlignmentConflicts:(unint64_t)a3
{
  self->_alignmentConflicts = a3;
}

- (unint64_t)alignmentConflicts
{
  return self->_alignmentConflicts;
}

- (void)setSessionIndex:(unint64_t)a3
{
  self->_sessionIndex = a3;
}

- (unint64_t)sessionIndex
{
  return self->_sessionIndex;
}

- (void)setAllEdits:(id)a3
{
}

- (void)setEditActionExtendsPriorWord:(BOOL)a3
{
  self->_editActionExtendsPriorWord = a3;
}

- (BOOL)editActionExtendsPriorWord
{
  return self->_editActionExtendsPriorWord;
}

- (int)editActionType
{
  return self->_editActionType;
}

- (void)setUnfinishedWordEntryTreatment:(int)a3
{
  self->_unfinishedWordEntryTreatment = a3;
}

- (int)unfinishedWordEntryTreatment
{
  return self->_unfinishedWordEntryTreatment;
}

- (void)setFollowsContinuousPath:(BOOL)a3
{
  self->_followsContinuousPath = a3;
}

- (BOOL)followsContinuousPath
{
  return self->_followsContinuousPath;
}

- (void)setInputContext:(id)a3
{
}

- (NSString)inputContext
{
  return self->_inputContext;
}

- (void)setInputStem:(id)a3
{
}

- (NSString)inputStem
{
  return self->_inputStem;
}

- (void)setOriginalCandidate:(id)a3
{
}

- (TIKeyboardCandidate)originalCandidate
{
  return self->_originalCandidate;
}

- (void)setAcceptedCandidate:(id)a3
{
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setTouchLayoutsM:(id)a3
{
}

- (NSMutableArray)touchLayoutsM
{
  return self->_touchLayoutsM;
}

- (void)setCandidatesOfferedM:(id)a3
{
}

- (NSMutableArray)candidatesOfferedM
{
  return self->_candidatesOfferedM;
}

- (void)setAllTouchesM:(id)a3
{
}

- (NSMutableArray)allTouchesM
{
  return self->_allTouchesM;
}

- (void)setAllKeyboardInputsM:(id)a3
{
}

- (NSMutableArray)allKeyboardInputsM
{
  return self->_allKeyboardInputsM;
}

- (void)setLayoutID:(int64_t)a3
{
  self->_layoutID = a3;
}

- (int64_t)layoutID
{
  return self->_layoutID;
}

- (void)setTouchAlignmentConf:(int)a3
{
  self->_touchAlignmentConf = a3;
}

- (int)touchAlignmentConf
{
  return self->_touchAlignmentConf;
}

- (void)setWordAlignmentConf:(int)a3
{
  self->_wordAlignmentConf = a3;
}

- (int)wordAlignmentConf
{
  return self->_wordAlignmentConf;
}

- (void)setInputTriggeredTextAccepted:(id)a3
{
}

- (TIKeyboardInput)inputTriggeredTextAccepted
{
  return self->_inputTriggeredTextAccepted;
}

- (void)setIsContinuousPathCompletion:(BOOL)a3
{
  self->_isContinuousPathCompletion = a3;
}

- (BOOL)isContinuousPathCompletion
{
  return self->_isContinuousPathCompletion;
}

- (void)setIsFromStaticLexicon:(BOOL)a3
{
  self->_isFromStaticLexicon = a3;
}

- (BOOL)isFromStaticLexicon
{
  return self->_isFromStaticLexicon;
}

- (void)setIsOOV:(BOOL)a3
{
  self->_isOOV = a3;
}

- (BOOL)isOOV
{
  return self->_isOOV;
}

- (void)setIsMultilingual:(BOOL)a3
{
  self->_isMultilingual = a3;
}

- (BOOL)isMultilingual
{
  return self->_isMultilingual;
}

- (void)setIsRetrocorrection:(BOOL)a3
{
  self->_isRetrocorrection = a3;
}

- (BOOL)isRetrocorrection
{
  return self->_isRetrocorrection;
}

- (void)setIncludesOrientationChange:(BOOL)a3
{
  self->_includesOrientationChange = a3;
}

- (BOOL)includesOrientationChange
{
  return self->_includesOrientationChange;
}

- (void)setIncludesCursorEdits:(BOOL)a3
{
  self->_includesCursorEdits = a3;
}

- (BOOL)includesCursorEdits
{
  return self->_includesCursorEdits;
}

- (void)setExtendsPriorWord:(BOOL)a3
{
  self->_extendsPriorWord = a3;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setWordEntryType:(int)a3
{
  self->_wordEntryType = a3;
}

- (int)wordEntryType
{
  return self->_wordEntryType;
}

- (void)setOrientation:(id)a3
{
}

- (NSString)orientation
{
  return self->_orientation;
}

- (void)setOriginalAcceptedString:(id)a3
{
}

- (NSString)originalAcceptedString
{
  return self->_originalAcceptedString;
}

- (void)setAcceptedString:(id)a3
{
}

- (NSString)acceptedString
{
  return self->_acceptedString;
}

- (BOOL)wasRevised
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(TIWordEntry *)self allEdits];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) acceptedString];
        v9 = [(TIWordEntry *)self acceptedString];
        int v10 = [v8 isEqual:v9];

        if (!v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)textFromResolvedKeyboardInputs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isBackspace", (void)v16) & 1) == 0)
        {
          v12 = [(TIWordEntry *)self inputTriggeredTextAccepted];

          if (v11 != v12)
          {
            long long v13 = [v11 string];
            [v5 appendString:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];

  return v14;
}

- (int)leadingBackspaceCountFromResolvedKeyboardInputs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      int v9 = v6 + v5;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "isBackspace", (void)v11))
        {
          int v9 = v6 + v8;
          goto LABEL_12;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      int v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)trimLeadingAndTrailingCharacters:(id)a3 fromResolvedInputs:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 firstObject];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      if ([v7 isBackspace]) {
        break;
      }
      uint64_t v8 = [v7 string];
      int v9 = [v8 stringByTrimmingCharactersInSet:v18];
      uint64_t v10 = [v9 length];

      if (v10) {
        break;
      }
      [v5 removeObject:v7];
      uint64_t v11 = [v5 firstObject];

      uint64_t v7 = (void *)v11;
    }
    while (v11);
  }
  uint64_t v12 = [v5 lastObject];
  if (v12)
  {
    long long v13 = (void *)v12;
    do
    {
      if ([v13 isBackspace]) {
        break;
      }
      long long v14 = [v13 string];
      long long v15 = [v14 stringByTrimmingCharactersInSet:v18];
      uint64_t v16 = [v15 length];

      if (v16) {
        break;
      }
      [v5 removeObject:v13];
      uint64_t v17 = [v5 lastObject];

      long long v13 = (void *)v17;
    }
    while (v17);
  }
}

- (id)resolveBackspacesInKeyboardInputs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(TIWordEntry *)self allKeyboardInputs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [v3 lastObject];
        if (v10 && [v9 isBackspace] && (objc_msgSend(v10, "isBackspace") & 1) == 0) {
          [v3 removeLastObject];
        }
        else {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }

  return v3;
}

- (BOOL)candidateContainsEmoji
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TIWordEntry *)self allKeyboardInputsM];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) string];
        char v7 = [v6 _containsEmoji];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setEditActionType:(int)a3
{
  if (a3) {
    self->_editActionType = a3;
  }
}

- (void)addUserEdit:(id)a3
{
  id v11 = a3;
  if ([(TIWordEntry *)self origin] == 1)
  {
    uint64_t v4 = [(TIWordEntry *)self allEdits];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = [(TIWordEntry *)self acceptedString];
      char v7 = [v11 acceptedString];
      int v8 = [v6 isEqualToString:v7];

      if (v8) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
      [v11 setOrigin:v9];
    }
  }
  long long v10 = [(TIWordEntry *)self allEdits];
  [v10 addObject:v11];
}

- (BOOL)isPeriodFromDoubleSpaceEntry
{
  uint64_t v3 = [(TIKeyboardCandidate *)self->_acceptedCandidate candidate];
  if ([v3 isEqualToString:@"."])
  {
    uint64_t v4 = [(TIKeyboardCandidate *)self->_acceptedCandidate input];
    char v5 = [v4 isEqualToString:@" "];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)endsWithNewLine
{
  uint64_t v3 = [(TIWordEntry *)self acceptedString];

  if (v3)
  {
    uint64_t v4 = [(TIWordEntry *)self allKeyboardInputs];
    int v5 = [v4 count];

    uint64_t v6 = (v5 - 1);
    if (v5 - 1 >= 0)
    {
      char v7 = 0;
      char v8 = 0;
      do
      {
        uint64_t v9 = [(TIWordEntry *)self allKeyboardInputs];
        long long v10 = [v9 objectAtIndex:v6];

        id v11 = [v10 string];

        if (v11)
        {
          long long v12 = (void *)MEMORY[0x1E4F28B88];
          long long v13 = [v10 string];
          uint64_t v14 = [v12 characterSetWithCharactersInString:v13];

          long long v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          int v16 = [v15 isSupersetOfSet:v14];

          if (v16)
          {
            if ((v8 & 1) == 0) {
              goto LABEL_15;
            }
            char v8 = 1;
            char v7 = 1;
          }
          else
          {
            uint64_t v17 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            char v18 = [v17 isSupersetOfSet:v14];

            if (!(v7 & 1 | ((v18 & 1) == 0)))
            {
LABEL_15:

              return v16;
            }
            v8 |= v18;
          }
        }
      }
      while (v6-- > 0);
    }
  }
  LOBYTE(v16) = 0;
  return v16;
}

- (BOOL)startsWithNewLine
{
  uint64_t v4 = [(TIWordEntry *)self acceptedString];

  if (!v4) {
    return 0;
  }
  int v5 = [(TIWordEntry *)self allKeyboardInputs];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
LABEL_12:
    char v21 = 0;
    return v21 & v2;
  }
  unint64_t v7 = 0;
  char v8 = 0;
  char v9 = 0;
  while (1)
  {
    long long v10 = [(TIWordEntry *)self allKeyboardInputs];
    id v11 = [v10 objectAtIndex:v7];

    long long v12 = [v11 string];

    if (v12) {
      break;
    }
LABEL_11:

    ++v7;
    long long v19 = [(TIWordEntry *)self allKeyboardInputs];
    unint64_t v20 = [v19 count];

    if (v20 <= v7) {
      goto LABEL_12;
    }
  }
  long long v13 = (void *)MEMORY[0x1E4F28B88];
  uint64_t v14 = [v11 string];
  long long v15 = [v13 characterSetWithCharactersInString:v14];

  int v16 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  int v2 = [v16 isSupersetOfSet:v15];

  if (v2)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
    char v9 = 1;
    char v8 = 1;
    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  char v18 = [v17 isSupersetOfSet:v15];

  if (v8 & 1 | ((v18 & 1) == 0))
  {
    v9 |= v18;
LABEL_10:

    goto LABEL_11;
  }
LABEL_14:

  char v21 = 1;
  return v21 & v2;
}

- (NSArray)touchLayouts
{
  int v2 = [(TIWordEntry *)self touchLayoutsM];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)candidatesOffered
{
  int v2 = [(TIWordEntry *)self candidatesOfferedM];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allTouches
{
  int v2 = [(TIWordEntry *)self allTouchesM];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allKeyboardInputs
{
  int v2 = [(TIWordEntry *)self allKeyboardInputsM];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)clearTouches
{
  uint64_t v3 = [(TIWordEntry *)self allTouchesM];
  [v3 removeAllObjects];

  id v4 = [(TIWordEntry *)self touchLayoutsM];
  [v4 removeAllObjects];
}

- (void)addTouchEvent:(id)a3 withLayoutId:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TIWordEntry *)self allTouchesM];
  [v7 addObject:v6];

  id v9 = [(TIWordEntry *)self touchLayoutsM];
  char v8 = [NSNumber numberWithInteger:a4];
  [v9 addObject:v8];
}

- (void)clearCandidatesOffered
{
  id v2 = [(TIWordEntry *)self candidatesOfferedM];
  [v2 removeAllObjects];
}

- (void)addCandidateOffered:(id)a3
{
  id v4 = a3;
  int v5 = [(TIWordEntry *)self candidatesOfferedM];
  [v5 removeAllObjects];

  id v6 = [(TIWordEntry *)self candidatesOfferedM];
  [v6 addObject:v4];
}

- (void)clearKeyInputs
{
  id v2 = [(TIWordEntry *)self allKeyboardInputsM];
  [v2 removeAllObjects];
}

- (void)addKeyInput:(id)a3
{
  id v4 = a3;
  id v5 = [(TIWordEntry *)self allKeyboardInputsM];
  [v5 addObject:v4];
}

- (id)descriptionWithContext
{
  uint64_t v3 = NSString;
  id v4 = [(TIUserAction *)self documentState];
  id v5 = [v4 contextBeforeInput];
  id v6 = [(TIWordEntry *)self acceptedString];
  unint64_t v7 = [v3 stringWithFormat:@"%@ <%@>", v5, v6];

  return v7;
}

- (id)description
{
  uint64_t v3 = [(TIWordEntry *)self acceptedString];

  if (v3)
  {
    id v4 = [(TIWordEntry *)self acceptedString];
  }
  else
  {
    id v4 = &stru_1F3F7A998;
  }

  return v4;
}

- (TIWordEntry)editedEntry
{
  id v2 = [(TIWordEntry *)self allEdits];
  uint64_t v3 = [v2 lastObject];

  return (TIWordEntry *)v3;
}

- (NSMutableArray)allEdits
{
  allEdits = self->_allEdits;
  if (!allEdits)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_allEdits;
    self->_allEdits = v4;

    allEdits = self->_allEdits;
  }

  return allEdits;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIWordEntry;
  id v4 = a3;
  [(TIUserAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_allKeyboardInputsM, @"allKeyboardInputsM", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_allTouchesM forKey:@"allTouchesM"];
  [v4 encodeObject:self->_touchLayoutsM forKey:@"touchLayoutsM"];
  [v4 encodeObject:self->_candidatesOfferedM forKey:@"candidatesOfferedM"];
  [v4 encodeObject:self->_acceptedString forKey:@"acceptedString"];
  [v4 encodeObject:self->_acceptedCandidate forKey:@"acceptedCandidate"];
  [v4 encodeObject:self->_originalAcceptedString forKey:@"originalAcceptedString"];
  [v4 encodeObject:self->_originalCandidate forKey:@"originalCandidate"];
  [v4 encodeObject:self->_orientation forKey:@"orientation"];
  [v4 encodeInt:self->_wordEntryType forKey:@"wordEntryType"];
  [v4 encodeBool:self->_deleted forKey:@"deleted"];
  [v4 encodeBool:self->_cancelled forKey:@"cancelled"];
  [v4 encodeBool:self->_includesCursorEdits forKey:@"includesCursorEdits"];
  [v4 encodeBool:self->_includesOrientationChange forKey:@"includesOrientationChange"];
  [v4 encodeBool:self->_extendsPriorWord forKey:@"extendsPriorWord"];
  [v4 encodeBool:self->_isRetrocorrection forKey:@"isRetrocorrection"];
  [v4 encodeBool:self->_isMultilingual forKey:@"isMultilingual"];
  [v4 encodeBool:self->_isContinuousPathCompletion forKey:@"isContinuousPathCompletion"];
  [v4 encodeObject:self->_inputStem forKey:@"inputStem"];
  [v4 encodeObject:self->_inputContext forKey:@"inputContext"];
  [v4 encodeInteger:self->_layoutID forKey:@"layoutID"];
  [v4 encodeInteger:self->_candidateIndex forKey:@"candidateIndex"];
  [v4 encodeObject:self->_inputTriggeredTextAccepted forKey:@"inputTriggeredTextAccepted"];
  [v4 encodeBool:self->_isPunctuationEntryFollowingAWord forKey:@"isPunctuationEntryFollowingAWord"];
  [v4 encodeInt:self->_unfinishedWordEntryTreatment forKey:@"unfinishedWordEntryTreatment"];
  [v4 encodeBool:self->_originalWordInAlignment forKey:@"originalWordInAlignment"];
  [v4 encodeInt:self->_origin forKey:@"origin"];
}

- (TIWordEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)TIWordEntry;
  objc_super v5 = [(TIUserAction *)&v43 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"allKeyboardInputsM"];
    allKeyboardInputsM = v5->_allKeyboardInputsM;
    v5->_allKeyboardInputsM = (NSMutableArray *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    long long v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"allTouchesM"];
    allTouchesM = v5->_allTouchesM;
    v5->_allTouchesM = (NSMutableArray *)v14;

    int v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    char v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"touchLayoutsM"];
    touchLayoutsM = v5->_touchLayoutsM;
    v5->_touchLayoutsM = (NSMutableArray *)v19;

    char v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"candidatesOffered"];
    candidatesOfferedM = v5->_candidatesOfferedM;
    v5->_candidatesOfferedM = (NSMutableArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptedString"];
    acceptedString = v5->_acceptedString;
    v5->_acceptedString = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptedCandidate"];
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalAcceptedString"];
    originalAcceptedString = v5->_originalAcceptedString;
    v5->_originalAcceptedString = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalCandidate"];
    originalCandidate = v5->_originalCandidate;
    v5->_originalCandidate = (TIKeyboardCandidate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orientation"];
    orientation = v5->_orientation;
    v5->_orientation = (NSString *)v34;

    v5->_wordEntryType = [v4 decodeIntForKey:@"wordEntryType"];
    v5->_deleted = [v4 decodeBoolForKey:@"deleted"];
    v5->_cancelled = [v4 decodeBoolForKey:@"cancelled"];
    v5->_includesCursorEdits = [v4 decodeBoolForKey:@"includesCursorEdits"];
    v5->_includesOrientationChange = [v4 decodeBoolForKey:@"includesOrientationChange"];
    v5->_extendsPriorWord = [v4 decodeBoolForKey:@"extendsPriorWord"];
    v5->_isRetrocorrection = [v4 decodeBoolForKey:@"isRetrocorrection"];
    v5->_isMultilingual = [v4 decodeBoolForKey:@"isMultilingual"];
    v5->_isOOV = [v4 decodeBoolForKey:@"isOOV"];
    v5->_isContinuousPathCompletion = [v4 decodeBoolForKey:@"isContinuousPathCompletion"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputStem"];
    inputStem = v5->_inputStem;
    v5->_inputStem = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputContext"];
    inputContext = v5->_inputContext;
    v5->_inputContext = (NSString *)v38;

    v5->_layoutID = [v4 decodeIntegerForKey:@"layoutID"];
    v5->_candidateIndex = [v4 decodeIntegerForKey:@"candidateIndex"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputTriggeredTextAccepted"];
    inputTriggeredTextAccepted = v5->_inputTriggeredTextAccepted;
    v5->_inputTriggeredTextAccepted = (TIKeyboardInput *)v40;

    v5->_isPunctuationEntryFollowingAWord = [v4 decodeBoolForKey:@"isPunctuationEntryFollowingAWord"];
    v5->_unfinishedWordEntryTreatment = [v4 decodeIntForKey:@"unfinishedWordEntryTreatment"];
    v5->_originalWordInAlignment = [v4 decodeBoolForKey:@"originalWordInAlignment"];
    v5->_origin = [v4 decodeIntForKey:@"origin"];
    [(TIUserAction *)v5 setActionType:0];
  }

  return v5;
}

- (TIWordEntry)init
{
  v12.receiver = self;
  v12.super_class = (Class)TIWordEntry;
  id v2 = [(TIUserAction *)&v12 initWithTIKeyboardState:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    allKeyboardInputsM = v2->_allKeyboardInputsM;
    v2->_allKeyboardInputsM = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    allTouchesM = v2->_allTouchesM;
    v2->_allTouchesM = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    candidatesOfferedM = v2->_candidatesOfferedM;
    v2->_candidatesOfferedM = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    touchLayoutsM = v2->_touchLayoutsM;
    v2->_touchLayoutsM = (NSMutableArray *)v9;

    v2->_unfinishedWordEntryTreatment = 0;
    v2->_origin = 0;
    [(TIUserAction *)v2 setActionType:0];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end