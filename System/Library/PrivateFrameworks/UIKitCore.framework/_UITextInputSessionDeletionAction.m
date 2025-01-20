@interface _UITextInputSessionDeletionAction
- (BOOL)changedContent;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _UITextInputSessionDeletionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if ([(_UITextInputSessionAction *)self isMergeableWith:v4])
  {
    v5 = [v4 asDeletion];
    if (!v5)
    {
      int64_t v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[_UITextInputSessionAction setRemovedTextLengthWithoutTracking:](self, "setRemovedTextLengthWithoutTracking:", [v5 removedTextLength] + -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ [v5 inputActionCount]);
    -[_UITextInputSessionDeletionAction setOptions:](self, "setOptions:", [v5 options] | -[_UITextInputSessionDeletionAction options](self, "options"));
    -[_UITextInputSessionAction setRemovedEmojiCount:](self, "setRemovedEmojiCount:", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount") + [v5 removedEmojiCount]);
    unint64_t v6 = [(_UITextInputSessionAction *)self largestSingleDeletionLength];
    unint64_t v7 = [v5 removedTextLength];
    if (v6 <= v7) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = v6;
    }
    [(_UITextInputSessionAction *)self setLargestSingleDeletionLength:v8];
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

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextInputSessionDeletionAction;
  v3 = [(_UITextInputSessionAction *)&v10 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"removedTextLength=%lu", -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
  [v4 addObject:v5];

  unint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"removedEmojiCount=%lu", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount"));
  [v4 addObject:v6];

  unint64_t v7 = [v4 componentsJoinedByString:@", "];
  unint64_t v8 = [v3 stringByAppendingFormat:@", %@", v7];

  return v8;
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

@end