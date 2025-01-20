@interface TIKeyboardInputManagerState
+ (BOOL)supportsSecureCoding;
- (BOOL)acceptAutocorrectionCommitsInline;
- (BOOL)acceptInputString:(id)a3;
- (BOOL)canHandleKeyHitTest;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)hasSupplementalPrefix;
- (BOOL)ignoreContinuousPathRequirements;
- (BOOL)ignoresDeadKeys;
- (BOOL)inputStringAcceptsCurrentCandidateIfSelected:(id)a3;
- (BOOL)inputStringIsExemptFromChecker;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)newInputAcceptsUserSelectedCandidate;
- (BOOL)nextInputWouldStartSentence;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldDeleteAutospaceBeforeTerminator:(id)a3;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldFixupIncompleteRomaji;
- (BOOL)shouldSuppressAutocorrectionWithTerminator:(id)a3;
- (BOOL)stringEndsWord:(id)a3;
- (BOOL)suppliesCompletions;
- (BOOL)supportsNumberKeySelection;
- (BOOL)supportsReversionUI;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)suppressCompletionsForFieldEditor;
- (BOOL)suppressPlaceholderCandidate;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesAutocorrectionLists;
- (BOOL)usesCandidateSelection;
- (BOOL)usesContinuousPath;
- (BOOL)usesContinuousPathProgressiveCandidates;
- (BOOL)usesLiveConversion;
- (BOOL)usesPunctuationKeysForRowNavigation;
- (NSNumber)learningFlagsForLastAcceptedCandidate;
- (NSString)inputString;
- (NSString)replacementForDoubleSpace;
- (NSString)searchStringForMarkedText;
- (NSString)shadowTyping;
- (NSString)wordSeparator;
- (TICharacterSetDescription)inputsPreventingAcceptSelectedCandidate;
- (TICharacterSetDescription)inputsToReject;
- (TICharacterSetDescription)shortcutCompletions;
- (TICharacterSetDescription)supplementalLexiconWordExtraCharacters;
- (TICharacterSetDescription)terminatorsDeletingAutospace;
- (TICharacterSetDescription)terminatorsPreventingAutocorrection;
- (TICharacterSetDescription)wordCharacters;
- (TIKeyEventMap)keyEventMap;
- (TIKeyboardBehaviors)keyboardBehaviors;
- (TIKeyboardCandidate)autocorrectionRecordForInputString;
- (TIKeyboardInputManagerState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)autoquoteType;
- (unint64_t)initialCandidateBatchCount;
- (unint64_t)inputCount;
- (unint64_t)inputIndex;
- (unint64_t)learningFlagsMaskForLastAcceptedCandidate;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptAutocorrectionCommitsInline:(BOOL)a3;
- (void)setAutocorrectionRecordForInputString:(id)a3;
- (void)setAutoquoteType:(unint64_t)a3;
- (void)setCanHandleKeyHitTest:(BOOL)a3;
- (void)setCommitsAcceptedCandidate:(BOOL)a3;
- (void)setDelayedCandidateList:(BOOL)a3;
- (void)setHasSupplementalPrefix:(BOOL)a3;
- (void)setIgnoreContinuousPathRequirements:(BOOL)a3;
- (void)setIgnoresDeadKeys:(BOOL)a3;
- (void)setInitialCandidateBatchCount:(unint64_t)a3;
- (void)setInputCount:(unint64_t)a3;
- (void)setInputIndex:(unint64_t)a3;
- (void)setInputString:(id)a3;
- (void)setInputStringIsExemptFromChecker:(BOOL)a3;
- (void)setInputsPreventingAcceptSelectedCandidate:(id)a3;
- (void)setInputsToReject:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setKeyEventMap:(id)a3;
- (void)setKeyboardBehaviors:(id)a3;
- (void)setLearningFlagsForLastAcceptedCandidate:(id)a3;
- (void)setLearningFlagsMaskForLastAcceptedCandidate:(unint64_t)a3;
- (void)setNewInputAcceptsUserSelectedCandidate:(BOOL)a3;
- (void)setNextInputWouldStartSentence:(BOOL)a3;
- (void)setReplacementForDoubleSpace:(id)a3;
- (void)setSearchStringForMarkedText:(id)a3;
- (void)setShadowTyping:(id)a3;
- (void)setShortcutCompletions:(id)a3;
- (void)setShouldAddModifierSymbolsToWordCharacters:(BOOL)a3;
- (void)setShouldExtendPriorWord:(BOOL)a3;
- (void)setShouldFixupIncompleteRomaji:(BOOL)a3;
- (void)setSupplementalLexiconWordExtraCharacters:(id)a3;
- (void)setSuppliesCompletions:(BOOL)a3;
- (void)setSupportsNumberKeySelection:(BOOL)a3;
- (void)setSupportsReversionUI:(BOOL)a3;
- (void)setSupportsSetPhraseBoundary:(BOOL)a3;
- (void)setSuppressCompletionsForFieldEditor:(BOOL)a3;
- (void)setSuppressPlaceholderCandidate:(BOOL)a3;
- (void)setTerminatorsDeletingAutospace:(id)a3;
- (void)setTerminatorsPreventingAutocorrection:(id)a3;
- (void)setUsesAutoDeleteWord:(BOOL)a3;
- (void)setUsesAutocorrectionLists:(BOOL)a3;
- (void)setUsesCandidateSelection:(BOOL)a3;
- (void)setUsesContinuousPath:(BOOL)a3;
- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3;
- (void)setUsesLiveConversion:(BOOL)a3;
- (void)setUsesPunctuationKeysForRowNavigation:(BOOL)a3;
- (void)setWordCharacters:(id)a3;
- (void)setWordSeparator:(id)a3;
@end

@implementation TIKeyboardInputManagerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchStringForMarkedText, 0);
  objc_storeStrong((id *)&self->_terminatorsDeletingAutospace, 0);
  objc_storeStrong((id *)&self->_terminatorsPreventingAutocorrection, 0);
  objc_storeStrong((id *)&self->_inputsToReject, 0);
  objc_storeStrong((id *)&self->_inputsPreventingAcceptSelectedCandidate, 0);
  objc_storeStrong((id *)&self->_shortcutCompletions, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWordExtraCharacters, 0);
  objc_storeStrong((id *)&self->_wordCharacters, 0);
  objc_storeStrong((id *)&self->_shadowTyping, 0);
  objc_storeStrong((id *)&self->_replacementForDoubleSpace, 0);
  objc_storeStrong((id *)&self->_keyEventMap, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_wordSeparator, 0);
  objc_storeStrong((id *)&self->_autocorrectionRecordForInputString, 0);

  objc_storeStrong((id *)&self->_keyboardBehaviors, 0);
}

- (void)setSearchStringForMarkedText:(id)a3
{
}

- (NSString)searchStringForMarkedText
{
  return self->_searchStringForMarkedText;
}

- (void)setLearningFlagsMaskForLastAcceptedCandidate:(unint64_t)a3
{
  self->_learningFlagsMaskForLastAcceptedCandidate = a3;
}

- (unint64_t)learningFlagsMaskForLastAcceptedCandidate
{
  return self->_learningFlagsMaskForLastAcceptedCandidate;
}

- (void)setHasSupplementalPrefix:(BOOL)a3
{
  self->_hasSupplementalPrefix = a3;
}

- (BOOL)hasSupplementalPrefix
{
  return self->_hasSupplementalPrefix;
}

- (void)setTerminatorsDeletingAutospace:(id)a3
{
}

- (TICharacterSetDescription)terminatorsDeletingAutospace
{
  return self->_terminatorsDeletingAutospace;
}

- (void)setTerminatorsPreventingAutocorrection:(id)a3
{
}

- (TICharacterSetDescription)terminatorsPreventingAutocorrection
{
  return self->_terminatorsPreventingAutocorrection;
}

- (void)setInputsToReject:(id)a3
{
}

- (TICharacterSetDescription)inputsToReject
{
  return self->_inputsToReject;
}

- (void)setInputsPreventingAcceptSelectedCandidate:(id)a3
{
}

- (TICharacterSetDescription)inputsPreventingAcceptSelectedCandidate
{
  return self->_inputsPreventingAcceptSelectedCandidate;
}

- (void)setShortcutCompletions:(id)a3
{
}

- (TICharacterSetDescription)shortcutCompletions
{
  return self->_shortcutCompletions;
}

- (void)setSupplementalLexiconWordExtraCharacters:(id)a3
{
}

- (TICharacterSetDescription)supplementalLexiconWordExtraCharacters
{
  return self->_supplementalLexiconWordExtraCharacters;
}

- (void)setWordCharacters:(id)a3
{
}

- (TICharacterSetDescription)wordCharacters
{
  return self->_wordCharacters;
}

- (void)setInitialCandidateBatchCount:(unint64_t)a3
{
  self->_initialCandidateBatchCount = a3;
}

- (unint64_t)initialCandidateBatchCount
{
  return self->_initialCandidateBatchCount;
}

- (void)setShouldAddModifierSymbolsToWordCharacters:(BOOL)a3
{
  self->_shouldAddModifierSymbolsToWordCharacters = a3;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return self->_shouldAddModifierSymbolsToWordCharacters;
}

- (void)setShadowTyping:(id)a3
{
}

- (NSString)shadowTyping
{
  return self->_shadowTyping;
}

- (void)setReplacementForDoubleSpace:(id)a3
{
}

- (NSString)replacementForDoubleSpace
{
  return self->_replacementForDoubleSpace;
}

- (void)setKeyEventMap:(id)a3
{
}

- (TIKeyEventMap)keyEventMap
{
  return self->_keyEventMap;
}

- (void)setKeyboardBehaviors:(id)a3
{
}

- (TIKeyboardBehaviors)keyboardBehaviors
{
  return self->_keyboardBehaviors;
}

- (void)setInputString:(id)a3
{
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputIndex:(unint64_t)a3
{
  self->_inputIndex = a3;
}

- (unint64_t)inputIndex
{
  return self->_inputIndex;
}

- (void)setInputCount:(unint64_t)a3
{
  self->_inputCount = a3;
}

- (unint64_t)inputCount
{
  return self->_inputCount;
}

- (void)setWordSeparator:(id)a3
{
}

- (NSString)wordSeparator
{
  return self->_wordSeparator;
}

- (void)setAutocorrectionRecordForInputString:(id)a3
{
}

- (TIKeyboardCandidate)autocorrectionRecordForInputString
{
  return self->_autocorrectionRecordForInputString;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  if (([v4 _isSingleEmoji] & 1) == 0)
  {
    uint64_t v6 = [v4 _firstLongCharacter];
    v7 = [(TIKeyboardInputManagerState *)self wordCharacters];
    v8 = [v7 characterSet];
    char v9 = [v8 longCharacterIsMember:v6];

    if ((v9 & 1) == 0)
    {
      if (![(TIKeyboardInputManagerState *)self hasSupplementalPrefix]
        || (-[TIKeyboardInputManagerState supplementalLexiconWordExtraCharacters](self, "supplementalLexiconWordExtraCharacters"), v11 = objc_claimAutoreleasedReturnValue(), [v11 characterSet], v12 = objc_claimAutoreleasedReturnValue(), char v13 = objc_msgSend(v12, "longCharacterIsMember:", v6), v12, v11, (v13 & 1) == 0))
      {
        if (!-[TIKeyboardInputManagerState shouldAddModifierSymbolsToWordCharacters](self, "shouldAddModifierSymbolsToWordCharacters")|| ([v4 _isModifierSymbol] & 1) == 0)
        {
          v14 = [(TIKeyboardInputManagerState *)self shortcutCompletions];
          v15 = [v14 characterSet];
          char v16 = [v15 longCharacterIsMember:v6];

          char v5 = v16 ^ 1;
          goto LABEL_6;
        }
      }
    }
    goto LABEL_5;
  }
  char v5 = 1;
LABEL_6:

  return v5;
}

- (BOOL)shouldDeleteAutospaceBeforeTerminator:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  char v5 = [(TIKeyboardInputManagerState *)self terminatorsDeletingAutospace];

  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [(TIKeyboardInputManagerState *)self terminatorsDeletingAutospace];
  v7 = [v6 characterSet];
  uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];
  uint64_t v10 = v9;

  if (!v8) {
    BOOL v11 = v10 == [v4 length];
  }
  else {
LABEL_4:
  }
    BOOL v11 = 0;

  return v11;
}

- (BOOL)shouldSuppressAutocorrectionWithTerminator:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  char v5 = [(TIKeyboardInputManagerState *)self terminatorsPreventingAutocorrection];

  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [(TIKeyboardInputManagerState *)self terminatorsPreventingAutocorrection];
  v7 = [v6 characterSet];
  uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];
  uint64_t v10 = v9;

  if (!v8) {
    BOOL v11 = v10 == [v4 length];
  }
  else {
LABEL_4:
  }
    BOOL v11 = 0;

  return v11;
}

- (BOOL)inputStringAcceptsCurrentCandidateIfSelected:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(TIKeyboardInputManagerState *)self inputsPreventingAcceptSelectedCandidate];

    if (v5)
    {
      uint64_t v6 = [(TIKeyboardInputManagerState *)self inputsPreventingAcceptSelectedCandidate];
      v7 = [v6 characterSet];
      uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];

      BOOL v9 = v8 != 0;
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

- (BOOL)acceptInputString:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(TIKeyboardInputManagerState *)self inputsToReject],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(TIKeyboardInputManagerState *)self inputsToReject];
    v7 = [v6 characterSet];
    uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];

    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [+[TIKeyboardInputManagerState allocWithZone:](TIKeyboardInputManagerState, "allocWithZone:") init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_mask.integerValue = self->_mask.integerValue;
    uint64_t v7 = [(NSString *)self->_replacementForDoubleSpace copyWithZone:a3];
    replacementForDoubleSpace = v6->_replacementForDoubleSpace;
    v6->_replacementForDoubleSpace = (NSString *)v7;

    uint64_t v9 = [(NSString *)self->_wordSeparator copyWithZone:a3];
    wordSeparator = v6->_wordSeparator;
    v6->_wordSeparator = (NSString *)v9;

    v6->_initialCandidateBatchCount = self->_initialCandidateBatchCount;
    v6->_shouldAddModifierSymbolsToWordCharacters = self->_shouldAddModifierSymbolsToWordCharacters;
    BOOL v11 = [(TICharacterSetDescription *)self->_wordCharacters copyWithZone:a3];
    wordCharacters = v6->_wordCharacters;
    v6->_wordCharacters = v11;

    char v13 = [(TICharacterSetDescription *)self->_supplementalLexiconWordExtraCharacters copyWithZone:a3];
    supplementalLexiconWordExtraCharacters = v6->_supplementalLexiconWordExtraCharacters;
    v6->_supplementalLexiconWordExtraCharacters = v13;

    v15 = [(TICharacterSetDescription *)self->_shortcutCompletions copyWithZone:a3];
    shortcutCompletions = v6->_shortcutCompletions;
    v6->_shortcutCompletions = v15;

    v17 = [(TICharacterSetDescription *)self->_inputsPreventingAcceptSelectedCandidate copyWithZone:a3];
    inputsPreventingAcceptSelectedCandidate = v6->_inputsPreventingAcceptSelectedCandidate;
    v6->_inputsPreventingAcceptSelectedCandidate = v17;

    v19 = [(TICharacterSetDescription *)self->_inputsToReject copyWithZone:a3];
    inputsToReject = v6->_inputsToReject;
    v6->_inputsToReject = v19;

    v21 = [(TICharacterSetDescription *)self->_terminatorsPreventingAutocorrection copyWithZone:a3];
    terminatorsPreventingAutocorrection = v6->_terminatorsPreventingAutocorrection;
    v6->_terminatorsPreventingAutocorrection = v21;

    v23 = [(TICharacterSetDescription *)self->_terminatorsDeletingAutospace copyWithZone:a3];
    terminatorsDeletingAutospace = v6->_terminatorsDeletingAutospace;
    v6->_terminatorsDeletingAutospace = v23;

    objc_storeStrong((id *)&v6->_keyboardBehaviors, self->_keyboardBehaviors);
    uint64_t v25 = [(NSString *)self->_inputString copyWithZone:a3];
    inputString = v6->_inputString;
    v6->_inputString = (NSString *)v25;

    v6->_hasSupplementalPrefix = self->_hasSupplementalPrefix;
    v6->_inputIndex = self->_inputIndex;
    v6->_inputCount = self->_inputCount;
    uint64_t v27 = [(NSString *)self->_shadowTyping copyWithZone:a3];
    shadowTyping = v6->_shadowTyping;
    v6->_shadowTyping = (NSString *)v27;

    objc_storeStrong((id *)&v6->_autocorrectionRecordForInputString, self->_autocorrectionRecordForInputString);
    objc_storeStrong((id *)&v6->_keyEventMap, self->_keyEventMap);
    v6->_learningFlagsMaskForLastAcceptedCandidate = self->_learningFlagsMaskForLastAcceptedCandidate;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t integerValue = self->_mask.integerValue;
  id v24 = v4;
  if (integerValue)
  {
    [v4 encodeInteger:integerValue forKey:@"mask"];
    id v4 = v24;
  }
  replacementForDoubleSpace = self->_replacementForDoubleSpace;
  if (replacementForDoubleSpace)
  {
    [v24 encodeObject:replacementForDoubleSpace forKey:@"replacementForDoubleSpace"];
    id v4 = v24;
  }
  wordSeparator = self->_wordSeparator;
  if (wordSeparator)
  {
    [v24 encodeObject:wordSeparator forKey:@"wordSeparator"];
    id v4 = v24;
  }
  unint64_t initialCandidateBatchCount = self->_initialCandidateBatchCount;
  if (initialCandidateBatchCount)
  {
    [v24 encodeInteger:initialCandidateBatchCount forKey:@"initialCandidateBatchCount"];
    id v4 = v24;
  }
  if (self->_shouldAddModifierSymbolsToWordCharacters)
  {
    [v24 encodeBool:1 forKey:@"shouldAddModifierSymbolsToWordCharacters"];
    id v4 = v24;
  }
  wordCharacters = self->_wordCharacters;
  if (wordCharacters)
  {
    [v24 encodeObject:wordCharacters forKey:@"wordCharacters"];
    id v4 = v24;
  }
  supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  if (supplementalLexiconWordExtraCharacters)
  {
    [v24 encodeObject:supplementalLexiconWordExtraCharacters forKey:@"supplementalLexiconWordExtraCharacters"];
    id v4 = v24;
  }
  shortcutCompletions = self->_shortcutCompletions;
  if (shortcutCompletions)
  {
    [v24 encodeObject:shortcutCompletions forKey:@"shortcutCompletions"];
    id v4 = v24;
  }
  inputsPreventingAcceptSelectedCandidate = self->_inputsPreventingAcceptSelectedCandidate;
  if (inputsPreventingAcceptSelectedCandidate)
  {
    [v24 encodeObject:inputsPreventingAcceptSelectedCandidate forKey:@"inputsPreventingAcceptSelectedCandidate"];
    id v4 = v24;
  }
  inputsToReject = self->_inputsToReject;
  if (inputsToReject)
  {
    [v24 encodeObject:inputsToReject forKey:@"inputsToReject"];
    id v4 = v24;
  }
  terminatorsPreventingAutocorrection = self->_terminatorsPreventingAutocorrection;
  if (terminatorsPreventingAutocorrection)
  {
    [v24 encodeObject:terminatorsPreventingAutocorrection forKey:@"terminatorsPreventingAutocorrection"];
    id v4 = v24;
  }
  terminatorsDeletingAutospace = self->_terminatorsDeletingAutospace;
  if (terminatorsDeletingAutospace)
  {
    [v24 encodeObject:terminatorsDeletingAutospace forKey:@"terminatorsDeletingAutospace"];
    id v4 = v24;
  }
  keyboardBehaviors = self->_keyboardBehaviors;
  if (keyboardBehaviors)
  {
    [v24 encodeObject:keyboardBehaviors forKey:@"keyboardBehaviors"];
    id v4 = v24;
  }
  inputString = self->_inputString;
  if (inputString)
  {
    [v24 encodeObject:inputString forKey:@"inputString"];
    id v4 = v24;
  }
  [v4 encodeBool:self->_hasSupplementalPrefix forKey:@"hasSupplementalPrefix"];
  unint64_t inputIndex = self->_inputIndex;
  if (inputIndex) {
    [v24 encodeInteger:inputIndex forKey:@"inputIndex"];
  }
  unint64_t inputCount = self->_inputCount;
  if (inputCount) {
    [v24 encodeInteger:inputCount forKey:@"inputCount"];
  }
  shadowTyping = self->_shadowTyping;
  if (shadowTyping) {
    [v24 encodeObject:shadowTyping forKey:@"shadowTyping"];
  }
  autocorrectionRecordForInputString = self->_autocorrectionRecordForInputString;
  if (autocorrectionRecordForInputString) {
    [v24 encodeObject:autocorrectionRecordForInputString forKey:@"autocorrectionRecordForInputString"];
  }
  keyEventMap = self->_keyEventMap;
  if (keyEventMap) {
    [v24 encodeObject:keyEventMap forKey:@"keyEventMap"];
  }
  if (self->_learningFlagsMaskForLastAcceptedCandidate)
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v24 encodeObject:v23 forKey:@"learningFlagsMaskForLastAcceptedCandidate"];
  }
}

- (TIKeyboardInputManagerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)TIKeyboardInputManagerState;
  char v5 = [(TIKeyboardInputManagerState *)&v47 init];
  if (v5)
  {
    v5->_mask.int64_t integerValue = [v4 decodeIntegerForKey:@"mask"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordSeparator"];
    uint64_t v7 = [v6 copy];
    wordSeparator = v5->_wordSeparator;
    v5->_wordSeparator = (NSString *)v7;

    v5->_shouldAddModifierSymbolsToWordCharacters = [v4 decodeBoolForKey:@"shouldAddModifierSymbolsToWordCharacters"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordCharacters"];
    uint64_t v10 = [v9 copy];
    wordCharacters = v5->_wordCharacters;
    v5->_wordCharacters = (TICharacterSetDescription *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementalLexiconWordExtraCharacters"];
    uint64_t v13 = [v12 copy];
    supplementalLexiconWordExtraCharacters = v5->_supplementalLexiconWordExtraCharacters;
    v5->_supplementalLexiconWordExtraCharacters = (TICharacterSetDescription *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutCompletions"];
    uint64_t v16 = [v15 copy];
    shortcutCompletions = v5->_shortcutCompletions;
    v5->_shortcutCompletions = (TICharacterSetDescription *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputsPreventingAcceptSelectedCandidate"];
    uint64_t v19 = [v18 copy];
    inputsPreventingAcceptSelectedCandidate = v5->_inputsPreventingAcceptSelectedCandidate;
    v5->_inputsPreventingAcceptSelectedCandidate = (TICharacterSetDescription *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputsToReject"];
    uint64_t v22 = [v21 copy];
    inputsToReject = v5->_inputsToReject;
    v5->_inputsToReject = (TICharacterSetDescription *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminatorsPreventingAutocorrection"];
    uint64_t v25 = [v24 copy];
    terminatorsPreventingAutocorrection = v5->_terminatorsPreventingAutocorrection;
    v5->_terminatorsPreventingAutocorrection = (TICharacterSetDescription *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminatorsDeletingAutospace"];
    uint64_t v28 = [v27 copy];
    terminatorsDeletingAutospace = v5->_terminatorsDeletingAutospace;
    v5->_terminatorsDeletingAutospace = (TICharacterSetDescription *)v28;

    v5->_unint64_t initialCandidateBatchCount = [v4 decodeIntegerForKey:@"initialCandidateBatchCount"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardBehaviors"];
    keyboardBehaviors = v5->_keyboardBehaviors;
    v5->_keyboardBehaviors = (TIKeyboardBehaviors *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputString"];
    uint64_t v33 = [v32 copy];
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v33;

    v5->_hasSupplementalPrefix = [v4 decodeBoolForKey:@"hasSupplementalPrefix"];
    v5->_unint64_t inputIndex = [v4 decodeIntegerForKey:@"inputIndex"];
    v5->_unint64_t inputCount = [v4 decodeIntegerForKey:@"inputCount"];
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowTyping"];
    uint64_t v36 = [v35 copy];
    shadowTyping = v5->_shadowTyping;
    v5->_shadowTyping = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocorrectionRecordForInputString"];
    autocorrectionRecordForInputString = v5->_autocorrectionRecordForInputString;
    v5->_autocorrectionRecordForInputString = (TIKeyboardCandidate *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyEventMap"];
    keyEventMap = v5->_keyEventMap;
    v5->_keyEventMap = (TIKeyEventMap *)v40;

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replacementForDoubleSpace"];
    uint64_t v43 = [v42 copy];
    replacementForDoubleSpace = v5->_replacementForDoubleSpace;
    v5->_replacementForDoubleSpace = (NSString *)v43;

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learningFlagsMaskForLastAcceptedCandidate"];
    v5->_learningFlagsMaskForLastAcceptedCandidate = [v45 unsignedIntValue];
  }
  return v5;
}

- (void)setAcceptAutocorrectionCommitsInline:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFBFFFFF | v3);
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 6) & 1;
}

- (void)setShouldFixupIncompleteRomaji:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFDFFFFF | v3);
}

- (BOOL)shouldFixupIncompleteRomaji
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 5) & 1;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFEFFFFF | v3);
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 4) & 1;
}

- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFBFFFF | v3);
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 2) & 1;
}

- (void)setDelayedCandidateList:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (BOOL)delayedCandidateList
{
  return *((unsigned char *)&self->_mask.fields + 3) & 1;
}

- (void)setUsesLiveConversion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (BOOL)usesLiveConversion
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (void)setIgnoreContinuousPathRequirements:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (BOOL)ignoreContinuousPathRequirements
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (void)setUsesContinuousPath:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFDFFFF | v3);
}

- (BOOL)usesContinuousPath
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 1) & 1;
}

- (void)setAutoquoteType:(unint64_t)a3
{
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFE7FFF | ((a3 & 3) << 15));
}

- (unint64_t)autoquoteType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 15) & 3;
}

- (void)setSuppressPlaceholderCandidate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFDFFF | v3);
}

- (BOOL)suppressPlaceholderCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 5) & 1;
}

- (void)setUsesAutocorrectionLists:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFBFFF | v3);
}

- (BOOL)usesAutocorrectionLists
{
  return (BYTE1(self->_mask.integerValue) >> 6) & 1;
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFEFF | v3);
}

- (BOOL)usesCandidateSelection
{
  return BYTE1(self->_mask.integerValue) & 1;
}

- (void)setUsesAutoDeleteWord:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFF7F | v3);
}

- (BOOL)usesAutoDeleteWord
{
  return LOBYTE(self->_mask.integerValue) >> 7;
}

- (void)setSuppressCompletionsForFieldEditor:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFBF | v3);
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return (LOBYTE(self->_mask.integerValue) >> 6) & 1;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFDF | v3);
}

- (BOOL)supportsSetPhraseBoundary
{
  return (LOBYTE(self->_mask.integerValue) >> 5) & 1;
}

- (void)setUsesPunctuationKeysForRowNavigation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFF7FFFF | v3);
}

- (void)setSupportsNumberKeySelection:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFEF | v3);
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 3) & 1;
}

- (BOOL)supportsNumberKeySelection
{
  return (LOBYTE(self->_mask.integerValue) >> 4) & 1;
}

- (void)setSuppliesCompletions:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFF7 | v3);
}

- (BOOL)suppliesCompletions
{
  return (LOBYTE(self->_mask.integerValue) >> 3) & 1;
}

- (void)setSupportsReversionUI:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFBFFFFFF | v3);
}

- (BOOL)supportsReversionUI
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 2) & 1;
}

- (void)setShouldExtendPriorWord:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFB | v3);
}

- (BOOL)shouldExtendPriorWord
{
  return (LOBYTE(self->_mask.integerValue) >> 2) & 1;
}

- (void)setNextInputWouldStartSentence:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFF7FF | v3);
}

- (BOOL)nextInputWouldStartSentence
{
  return (BYTE1(self->_mask.integerValue) >> 3) & 1;
}

- (void)setInputStringIsExemptFromChecker:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFEFFF | v3);
}

- (BOOL)inputStringIsExemptFromChecker
{
  return (BYTE1(self->_mask.integerValue) >> 4) & 1;
}

- (void)setIgnoresDeadKeys:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFD | v3);
}

- (BOOL)ignoresDeadKeys
{
  return (LOBYTE(self->_mask.integerValue) >> 1) & 1;
}

- (void)setNewInputAcceptsUserSelectedCandidate:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFBFF | v3);
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 2) & 1;
}

- (void)setCommitsAcceptedCandidate:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFDFF | v3);
}

- (BOOL)commitsAcceptedCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 1) & 1;
}

- (void)setCanHandleKeyHitTest:(BOOL)a3
{
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFE | a3);
}

- (BOOL)canHandleKeyHitTest
{
  return self->_mask.integerValue & 1;
}

- (void)setLearningFlagsForLastAcceptedCandidate:(id)a3
{
  self->_learningFlagsMaskForLastAcceptedCandidate = [a3 unsignedIntValue];
}

- (NSNumber)learningFlagsForLastAcceptedCandidate
{
  return (NSNumber *)[NSNumber numberWithUnsignedInt:LODWORD(self->_learningFlagsMaskForLastAcceptedCandidate)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end