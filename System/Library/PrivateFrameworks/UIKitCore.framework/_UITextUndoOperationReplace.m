@interface _UITextUndoOperationReplace
- (_UITextUndoOperationReplace)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5;
- (void)undoRedo;
@end

@implementation _UITextUndoOperationReplace

- (_UITextUndoOperationReplace)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UITextUndoOperationReplace;
  v11 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v20, sel_initWithAffectedRange_inputController_, v8, v7, v10);
  v12 = v11;
  if (v11)
  {
    v11->_replacementRange.NSUInteger location = location;
    v11->_replacementRange.NSUInteger length = length;
    v13 = [v10 _textStorage];
    uint64_t v14 = [(_UIUndoTextOperation *)v12 affectedRange];
    v16 = objc_msgSend(v13, "_UIUndoRedoAttributedSubstringFromRange:", v14, v15);
    uint64_t v17 = [v16 copy];
    attributedString = v12->_attributedString;
    v12->_attributedString = (NSAttributedString *)v17;
  }
  return v12;
}

- (void)undoRedo
{
  v4 = [(_UIUndoTextOperation *)self inputController];
  v5 = [v4 undoManager];
  if ([v5 isUndoing])
  {
    NSUInteger location = self->_replacementRange.location;
    NSUInteger length = self->_replacementRange.length;
  }
  else
  {
    NSUInteger location = [(_UIUndoTextOperation *)self affectedRange];
    NSUInteger length = v8;
  }
  v9 = [v4 _textStorage];
  if (v9)
  {
    [v4 _setUndoRedoInProgress:1];
    id v10 = [(NSAttributedString *)self->_attributedString string];
    int v11 = objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", location, length, v10);

    if (v11)
    {
      v12 = objc_msgSend(v9, "_UIUndoRedoAttributedSubstringFromRange:", location, length);
      [v4 undoWillChangeText];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39___UITextUndoOperationReplace_undoRedo__block_invoke;
      v21[3] = &unk_1E530B1C0;
      v21[5] = location;
      v21[6] = length;
      v21[4] = self;
      [v9 coordinateEditing:v21];
      if ([v5 isUndoing])
      {
        NSUInteger v13 = [(_UIUndoTextOperation *)self affectedRange];
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v15 = 0;
        NSUInteger v13 = self->_replacementRange.length + self->_replacementRange.location;
      }
      objc_msgSend(v4, "setSelectedRange:afterDelta:appliedToRange:", v13, v15, -[NSAttributedString length](self->_attributedString, "length") - length, location, length);
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", location, length, self->_attributedString);
      objc_msgSend(v4, "scrollRangeToVisible:", v13, v15);
      uint64_t v17 = (NSAttributedString *)[v12 copy];
      attributedString = self->_attributedString;
      self->_attributedString = v17;

      v19 = [v4 _textStorage];
      [v5 registerUndoWithTarget:v19 selector:sel__UIUndoRedoTextOperation_ object:self];
    }
    [v4 _setUndoRedoInProgress:0];
    v20.receiver = self;
    v20.super_class = (Class)_UITextUndoOperationReplace;
    [(_UIUndoTextOperation *)&v20 undoRedo];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"NSTextStorage_Undo.m", 117, @"Incorrect or nil NSTextStorage requested for undo operation: %@", self object file lineNumber description];
  }
}

- (void).cxx_destruct
{
}

@end