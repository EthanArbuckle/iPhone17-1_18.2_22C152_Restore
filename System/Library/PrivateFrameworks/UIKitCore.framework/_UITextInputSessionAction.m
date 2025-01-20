@interface _UITextInputSessionAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (BOOL)isMergeableWith:(id)a3;
- (NSString)appBundleId;
- (NSString)keyboardLayout;
- (NSString)keyboardType;
- (NSString)keyboardVariant;
- (NSString)language;
- (NSString)region;
- (_NSRange)relativeRangeBefore;
- (_UITextInputSessionBeganAction)asBegan;
- (_UITextInputSessionCopyAction)asCopy;
- (_UITextInputSessionCutAction)asCut;
- (_UITextInputSessionDeletionAction)asDeletion;
- (_UITextInputSessionDictationBeganAction)asDictationBegan;
- (_UITextInputSessionDictationEndedAction)asDictationEnded;
- (_UITextInputSessionEndAction)asEnd;
- (_UITextInputSessionInsertionAction)asInsertion;
- (_UITextInputSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress;
- (_UITextInputSessionPasteAction)asPaste;
- (_UITextInputSessionRedoAction)asRedo;
- (_UITextInputSessionReplaceTextAction)asReplaceText;
- (_UITextInputSessionReplaceWithCandidateAction)asReplaceWithCandidate;
- (_UITextInputSessionSelectionAction)asSelection;
- (_UITextInputSessionUndoAction)asUndo;
- (id)description;
- (id)inputModeUniqueString;
- (int64_t)flagOptions;
- (int64_t)inputActionCount;
- (int64_t)inputActionCountFromMergedActions;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)netCharacterCount;
- (int64_t)source;
- (int64_t)textInputActionsSource;
- (int64_t)textInputActionsType;
- (unint64_t)insertedEmojiCount;
- (unint64_t)insertedPunctuationCount;
- (unint64_t)insertedTextLength;
- (unint64_t)largestSingleDeletionLength;
- (unint64_t)largestSingleInsertionLength;
- (unint64_t)removedEmojiCount;
- (unint64_t)removedPunctuationCount;
- (unint64_t)removedTextLength;
- (void)setAppBundleId:(id)a3;
- (void)setFlagOptions:(int64_t)a3;
- (void)setInputActionCountFromMergedActions:(int64_t)a3;
- (void)setInsertedEmojiCount:(unint64_t)a3;
- (void)setInsertedPunctuationCount:(unint64_t)a3;
- (void)setInsertedTextLength:(unint64_t)a3;
- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setKeyboardVariant:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLargestSingleDeletionLength:(unint64_t)a3;
- (void)setLargestSingleInsertionLength:(unint64_t)a3;
- (void)setRegion:(id)a3;
- (void)setRelativeRangeBefore:(_NSRange)a3;
- (void)setRemovedEmojiCount:(unint64_t)a3;
- (void)setRemovedPunctuationCount:(unint64_t)a3;
- (void)setRemovedTextLength:(unint64_t)a3;
- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
- (void)setTextInputActionsSource:(int64_t)a3;
- (void)setTextInputActionsType:(int64_t)a3;
@end

@implementation _UITextInputSessionAction

- (_UITextInputSessionBeganAction)asBegan
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionBeganAction *)v3;
}

- (_UITextInputSessionEndAction)asEnd
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionEndAction *)v3;
}

- (_UITextInputSessionInsertionAction)asInsertion
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionInsertionAction *)v3;
}

- (_UITextInputSessionDeletionAction)asDeletion
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionDeletionAction *)v3;
}

- (_UITextInputSessionSelectionAction)asSelection
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionSelectionAction *)v3;
}

- (_UITextInputSessionCopyAction)asCopy
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionCopyAction *)v3;
}

- (_UITextInputSessionCutAction)asCut
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionCutAction *)v3;
}

- (_UITextInputSessionPasteAction)asPaste
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionPasteAction *)v3;
}

- (_UITextInputSessionUndoAction)asUndo
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionUndoAction *)v3;
}

- (_UITextInputSessionRedoAction)asRedo
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionRedoAction *)v3;
}

- (_UITextInputSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionKeyboardDockItemButtonPressAction *)v3;
}

- (_UITextInputSessionDictationBeganAction)asDictationBegan
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionDictationBeganAction *)v3;
}

- (_UITextInputSessionDictationEndedAction)asDictationEnded
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionDictationEndedAction *)v3;
}

- (_UITextInputSessionReplaceWithCandidateAction)asReplaceWithCandidate
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionReplaceWithCandidateAction *)v3;
}

- (_UITextInputSessionReplaceTextAction)asReplaceText
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UITextInputSessionReplaceTextAction *)v3;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  return 0;
}

- (BOOL)changedContent
{
  return 0;
}

- (BOOL)isCapableOfTextInsertion
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = NSString;
  v7 = [(_UITextInputSessionAction *)self appBundleId];
  v8 = [v6 stringWithFormat:@"appBundleId=%@", v7];
  [v5 addObject:v8];

  v9 = NSString;
  v10 = +[UITextInputSessionActionAnalytics stringValueForSource:[(_UITextInputSessionAction *)self source]];
  v11 = [v9 stringWithFormat:@"source=%@", v10];
  [v5 addObject:v11];

  v12 = NSString;
  v13 = _UITextInputActionsSourceString([(_UITextInputSessionAction *)self textInputActionsSource]);
  v14 = [v12 stringWithFormat:@"textInputActionsSource=%@", v13];
  [v5 addObject:v14];

  v15 = NSString;
  v16 = _UITextInputActionsTypeString([(_UITextInputSessionAction *)self textInputActionsType]);
  v17 = [v15 stringWithFormat:@"textInputActionsType=%@", v16];
  [v5 addObject:v17];

  if ([(_UITextInputSessionAction *)self changedContent])
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"removedTextLength=%lu", -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    [v5 addObject:v18];

    v19 = objc_msgSend(NSString, "stringWithFormat:", @"insertedTextLength=%lu", -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    [v5 addObject:v19];

    v20 = objc_msgSend(NSString, "stringWithFormat:", @"removedEmojiCount=%lu", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount"));
    [v5 addObject:v20];

    v21 = objc_msgSend(NSString, "stringWithFormat:", @"insertedEmojiCount=%lu", -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount"));
    [v5 addObject:v21];

    v22 = objc_msgSend(NSString, "stringWithFormat:", @"removedPunctuationCount=%lu", -[_UITextInputSessionAction removedPunctuationCount](self, "removedPunctuationCount"));
    [v5 addObject:v22];

    v23 = objc_msgSend(NSString, "stringWithFormat:", @"insertedPunctuationCount=%lu", -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount"));
    [v5 addObject:v23];

    v24 = objc_msgSend(NSString, "stringWithFormat:", @"largestSingleDeletionLength=%lu", -[_UITextInputSessionAction largestSingleDeletionLength](self, "largestSingleDeletionLength"));
    [v5 addObject:v24];

    v25 = objc_msgSend(NSString, "stringWithFormat:", @"largestSingleInsertionLength=%lu", -[_UITextInputSessionAction largestSingleInsertionLength](self, "largestSingleInsertionLength"));
    [v5 addObject:v25];
  }
  v26 = [(_UITextInputSessionAction *)self language];
  if (v26
    || ([(_UITextInputSessionAction *)self region], (v26 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(_UITextInputSessionAction *)self keyboardVariant],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(_UITextInputSessionAction *)self keyboardLayout],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    v27 = NSString;
    v28 = [(_UITextInputSessionAction *)self inputModeUniqueString];
    v29 = [v27 stringWithFormat:@"inputMode=%@", v28];
    [v5 addObject:v29];

    goto LABEL_9;
  }
  v39 = [(_UITextInputSessionAction *)self keyboardType];

  if (v39) {
    goto LABEL_8;
  }
LABEL_9:
  if ([(_UITextInputSessionAction *)self flagOptions])
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"flagOptions=%lu", -[_UITextInputSessionAction flagOptions](self, "flagOptions"));
    [v5 addObject:v30];
  }
  if ([(_UITextInputSessionAction *)self inputActionCount])
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"inputActionCount=%lu", -[_UITextInputSessionAction inputActionCount](self, "inputActionCount"));
    [v5 addObject:v31];
  }
  if ([(_UITextInputSessionAction *)self relativeRangeBefore]
    || ([(_UITextInputSessionAction *)self relativeRangeBefore], v32))
  {
    v33 = NSString;
    v41.location = [(_UITextInputSessionAction *)self relativeRangeBefore];
    v34 = NSStringFromRange(v41);
    v35 = [v33 stringWithFormat:@"relativeRangeBefore=%@", v34];
    [v5 addObject:v35];
  }
  v36 = [v5 componentsJoinedByString:@", "];
  v37 = [v4 stringByAppendingFormat:@": %@", v36];

  return v37;
}

- (void)setSource:(int64_t)a3
{
  if (self->_source != a3) {
    self->_source = a3;
  }
  int64_t v4 = a3 - 1;
  uint64_t v5 = 2;
  uint64_t v6 = 1;
  uint64_t v7 = 4;
  switch(v4)
  {
    case 0:
      goto LABEL_7;
    case 1:
      goto LABEL_10;
    case 2:
      uint64_t v6 = 6;
      goto LABEL_10;
    case 3:
      uint64_t v7 = 3;
LABEL_7:
      uint64_t v5 = 1;
      break;
    case 4:
      uint64_t v6 = 5;
      goto LABEL_10;
    case 5:
      break;
    case 6:
      uint64_t v6 = 2;
LABEL_10:
      uint64_t v5 = 5;
      uint64_t v7 = v6;
      break;
    case 7:
      uint64_t v5 = 16;
      uint64_t v7 = 4;
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v5 = 0;
      break;
  }
  [(_UITextInputSessionAction *)self setTextInputActionsSource:v7];
  [(_UITextInputSessionAction *)self setTextInputActionsType:v5];
}

- (int64_t)inputActionCount
{
  return [(_UITextInputSessionAction *)self inputActionCountFromMergedActions] + 1;
}

- (void)setInsertedTextLength:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 150, @"Attempted to set insertedTextLength on an action of class %@, which does not support changing content", v9 object file lineNumber description];
  }
  self->_insertedTextLength = a3;
  int64_t v6 = a3 - [(_UITextInputSessionAction *)self removedTextLength];
  [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:0];
  [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:0];
  if (v6 < 1)
  {
    if (v6 < 0)
    {
      [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:-v6];
    }
  }
  else
  {
    [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:v6];
  }
}

- (void)setRemovedTextLength:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 171, @"Attempted to set removedTextLength on an action of class %@, which does not support changing content", v9 object file lineNumber description];
  }
  self->_removedTextLength = a3;
  int64_t v6 = [(_UITextInputSessionAction *)self insertedTextLength] - a3;
  [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:0];
  [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:0];
  if (v6 < 1)
  {
    if (v6 < 0)
    {
      [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:-v6];
    }
  }
  else
  {
    [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:v6];
  }
}

- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 190, @"Attempted to set insertedTextLength on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_insertedTextLength = a3;
}

- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 198, @"Attempted to set removedTextLength on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_removedTextLength = a3;
}

- (void)setInsertedEmojiCount:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 206, @"Attempted to set insertedEmojiCount on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_insertedEmojiCount = a3;
}

- (void)setRemovedEmojiCount:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 214, @"Attempted to set removedEmojiCount on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_removedEmojiCount = a3;
}

- (void)setInsertedPunctuationCount:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 222, @"Attempted to set insertedPunctuationCount on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_insertedPunctuationCount = a3;
}

- (void)setRemovedPunctuationCount:(unint64_t)a3
{
  if (a3 && ![(_UITextInputSessionAction *)self changedContent])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"UITextInputSessionAction.m", 230, @"Attempted to set removedPunctuationCount on an action of class %@, which does not support changing content", v8 object file lineNumber description];
  }
  self->_removedPunctuationCount = a3;
}

- (int64_t)netCharacterCount
{
  unint64_t v3 = [(_UITextInputSessionAction *)self insertedTextLength];
  return v3 - [(_UITextInputSessionAction *)self removedTextLength];
}

- (id)inputModeUniqueString
{
  keyboardType = @"None";
  language = (__CFString *)self->_language;
  region = (__CFString *)self->_region;
  if (!language) {
    language = @"None";
  }
  if (!region) {
    region = @"None";
  }
  keyboardVariant = (__CFString *)self->_keyboardVariant;
  keyboardLayout = (__CFString *)self->_keyboardLayout;
  if (!keyboardVariant) {
    keyboardVariant = @"None";
  }
  if (!keyboardLayout) {
    keyboardLayout = @"None";
  }
  if (self->_keyboardType) {
    keyboardType = (__CFString *)self->_keyboardType;
  }
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", language, @"|", region, @"|", keyboardVariant, @"|", keyboardLayout, @"|", keyboardType];
}

- (BOOL)isMergeableWith:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UITextInputSessionAction *)self source];
  if (v5 == [v4 source]
    && (int64_t v6 = -[_UITextInputSessionAction flagOptions](self, "flagOptions"), v6 == [v4 flagOptions])
    && (int64_t v7 = [(_UITextInputSessionAction *)self textInputActionsSource],
        v7 == [v4 textInputActionsSource])
    && (int64_t v8 = [(_UITextInputSessionAction *)self textInputActionsType],
        v8 == [v4 textInputActionsType]))
  {
    v9 = [(_UITextInputSessionAction *)self inputModeUniqueString];
    v10 = [v4 inputModeUniqueString];
    if ([v9 isEqualToString:v10])
    {
      v11 = [(_UITextInputSessionAction *)self appBundleId];
      v12 = [v4 appBundleId];
      char v13 = [v11 isEqualToString:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (int64_t)source
{
  return self->_source;
}

- (_NSRange)relativeRangeBefore
{
  NSUInteger length = self->_relativeRangeBefore.length;
  NSUInteger location = self->_relativeRangeBefore.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRelativeRangeBefore:(_NSRange)a3
{
  self->_relativeRangeBefore = a3;
}

- (int64_t)textInputActionsSource
{
  return self->_textInputActionsSource;
}

- (void)setTextInputActionsSource:(int64_t)a3
{
  self->_textInputActionsSource = a3;
}

- (int64_t)textInputActionsType
{
  return self->_textInputActionsType;
}

- (void)setTextInputActionsType:(int64_t)a3
{
  self->_textInputActionsType = a3;
}

- (unint64_t)insertedTextLength
{
  return self->_insertedTextLength;
}

- (unint64_t)insertedEmojiCount
{
  return self->_insertedEmojiCount;
}

- (unint64_t)insertedPunctuationCount
{
  return self->_insertedPunctuationCount;
}

- (unint64_t)removedTextLength
{
  return self->_removedTextLength;
}

- (unint64_t)removedEmojiCount
{
  return self->_removedEmojiCount;
}

- (unint64_t)removedPunctuationCount
{
  return self->_removedPunctuationCount;
}

- (int64_t)inputActionCountFromMergedActions
{
  return self->_inputActionCountFromMergedActions;
}

- (void)setInputActionCountFromMergedActions:(int64_t)a3
{
  self->_inputActionCountFromMergedActions = a3;
}

- (unint64_t)largestSingleInsertionLength
{
  return self->_largestSingleInsertionLength;
}

- (void)setLargestSingleInsertionLength:(unint64_t)a3
{
  self->_largestSingleInsertionLength = a3;
}

- (unint64_t)largestSingleDeletionLength
{
  return self->_largestSingleDeletionLength;
}

- (void)setLargestSingleDeletionLength:(unint64_t)a3
{
  self->_largestSingleDeletionLength = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (void)setKeyboardVariant:(id)a3
{
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (int64_t)flagOptions
{
  return self->_flagOptions;
}

- (void)setFlagOptions:(int64_t)a3
{
  self->_flagOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end