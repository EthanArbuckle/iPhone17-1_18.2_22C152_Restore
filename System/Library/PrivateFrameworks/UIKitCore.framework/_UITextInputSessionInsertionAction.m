@interface _UITextInputSessionInsertionAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (unint64_t)withAlternativesCount;
- (void)setOptions:(unint64_t)a3;
- (void)setWithAlternativesCount:(unint64_t)a3;
@end

@implementation _UITextInputSessionInsertionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if ([(_UITextInputSessionAction *)self isMergeableWith:v4])
  {
    v5 = [v4 asInsertion];
    if (!v5)
    {
      int64_t v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[_UITextInputSessionAction setInsertedTextLengthWithoutTracking:](self, "setInsertedTextLengthWithoutTracking:", [v5 insertedTextLength]+ -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ [v5 inputActionCount]);
    -[_UITextInputSessionInsertionAction setWithAlternativesCount:](self, "setWithAlternativesCount:", -[_UITextInputSessionInsertionAction withAlternativesCount](self, "withAlternativesCount")+ [v5 withAlternativesCount]);
    -[_UITextInputSessionInsertionAction setOptions:](self, "setOptions:", [v5 options] | -[_UITextInputSessionInsertionAction options](self, "options"));
    -[_UITextInputSessionAction setInsertedEmojiCount:](self, "setInsertedEmojiCount:", -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount")+ [v5 insertedEmojiCount]);
    -[_UITextInputSessionAction setInsertedPunctuationCount:](self, "setInsertedPunctuationCount:", -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount")+ [v5 insertedPunctuationCount]);
    unint64_t v6 = [(_UITextInputSessionAction *)self largestSingleInsertionLength];
    unint64_t v7 = [v5 insertedTextLength];
    if (v6 <= v7) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = v6;
    }
    [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:v8];
    v9 = [v4 language];
    if (v9)
    {
    }
    else
    {
      v11 = [v4 region];

      if (!v11)
      {
LABEL_12:
        int64_t v10 = 1;
        goto LABEL_13;
      }
    }
    v12 = [v4 language];
    [(_UITextInputSessionAction *)self setLanguage:v12];

    v13 = [v4 region];
    [(_UITextInputSessionAction *)self setRegion:v13];

    v14 = [v4 keyboardVariant];
    [(_UITextInputSessionAction *)self setKeyboardVariant:v14];

    v15 = [v4 keyboardLayout];
    [(_UITextInputSessionAction *)self setKeyboardLayout:v15];

    v16 = [v4 keyboardType];
    [(_UITextInputSessionAction *)self setKeyboardType:v16];

    goto LABEL_12;
  }
  int64_t v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (int64_t)inputActionCount
{
  BOOL v3 = [(_UITextInputSessionAction *)self source] != 1
    && [(_UITextInputSessionAction *)self source] != 8;
  return [(_UITextInputSessionAction *)self inputActionCountFromMergedActions] + v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)withAlternativesCount
{
  return self->_withAlternativesCount;
}

- (void)setWithAlternativesCount:(unint64_t)a3
{
  self->_withAlternativesCount = a3;
}

@end