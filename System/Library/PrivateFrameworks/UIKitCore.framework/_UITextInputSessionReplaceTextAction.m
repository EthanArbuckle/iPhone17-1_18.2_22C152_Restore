@interface _UITextInputSessionReplaceTextAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _UITextInputSessionReplaceTextAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if ([(_UITextInputSessionAction *)self isMergeableWith:v4])
  {
    v5 = [v4 asReplaceText];
    if (!v5)
    {
      int64_t v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[_UITextInputSessionAction setInsertedTextLengthWithoutTracking:](self, "setInsertedTextLengthWithoutTracking:", [v5 insertedTextLength]+ -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    -[_UITextInputSessionAction setRemovedTextLengthWithoutTracking:](self, "setRemovedTextLengthWithoutTracking:", [v5 removedTextLength] + -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ [v5 inputActionCount]);
    -[_UITextInputSessionReplaceTextAction setOptions:](self, "setOptions:", [v5 options] | -[_UITextInputSessionReplaceTextAction options](self, "options"));
    -[_UITextInputSessionAction setRemovedEmojiCount:](self, "setRemovedEmojiCount:", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount") + [v5 removedEmojiCount]);
    -[_UITextInputSessionAction setInsertedEmojiCount:](self, "setInsertedEmojiCount:", -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount")+ [v5 insertedEmojiCount]);
    -[_UITextInputSessionAction setRemovedPunctuationCount:](self, "setRemovedPunctuationCount:", -[_UITextInputSessionAction removedPunctuationCount](self, "removedPunctuationCount")+ [v5 removedPunctuationCount]);
    -[_UITextInputSessionAction setInsertedPunctuationCount:](self, "setInsertedPunctuationCount:", -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount")+ [v5 insertedPunctuationCount]);
    uint64_t v6 = [v5 netCharacterCount];
    unint64_t v7 = v6;
    if (v6 < 1)
    {
      if (v6 < 0)
      {
        unint64_t v11 = [(_UITextInputSessionAction *)self largestSingleDeletionLength];
        if (v11 <= -(uint64_t)v7) {
          unint64_t v12 = -(uint64_t)v7;
        }
        else {
          unint64_t v12 = v11;
        }
        [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:v12];
      }
    }
    else
    {
      unint64_t v8 = [(_UITextInputSessionAction *)self largestSingleInsertionLength];
      if (v8 <= v7) {
        unint64_t v9 = v7;
      }
      else {
        unint64_t v9 = v8;
      }
      [(_UITextInputSessionAction *)self setLargestSingleInsertionLength:v9];
    }
    v13 = [v4 language];
    if (v13)
    {
    }
    else
    {
      v14 = [v4 region];

      if (!v14)
      {
LABEL_19:
        int64_t v10 = 1;
        goto LABEL_20;
      }
    }
    v15 = [v4 language];
    [(_UITextInputSessionAction *)self setLanguage:v15];

    v16 = [v4 region];
    [(_UITextInputSessionAction *)self setRegion:v16];

    v17 = [v4 keyboardVariant];
    [(_UITextInputSessionAction *)self setKeyboardVariant:v17];

    v18 = [v4 keyboardLayout];
    [(_UITextInputSessionAction *)self setKeyboardLayout:v18];

    v19 = [v4 keyboardType];
    [(_UITextInputSessionAction *)self setKeyboardType:v19];

    goto LABEL_19;
  }
  int64_t v10 = 0;
LABEL_21:

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

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end