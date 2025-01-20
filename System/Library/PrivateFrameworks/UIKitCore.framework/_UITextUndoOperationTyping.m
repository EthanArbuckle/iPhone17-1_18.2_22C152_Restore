@interface _UITextUndoOperationTyping
- (BOOL)coalesceAffectedRange:(_NSRange)a3 replacementRange:(_NSRange)a4 selectedRange:(_NSRange)a5 textStorage:(id)a6;
- (BOOL)supportsCoalescing;
- (_UITextUndoOperationTyping)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5;
- (void)undoRedo;
@end

@implementation _UITextUndoOperationTyping

- (_UITextUndoOperationTyping)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UITextUndoOperationTyping;
  v11 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v20, sel_initWithAffectedRange_inputController_, v8, v7, v10);
  v12 = v11;
  if (v11)
  {
    v11->_replacementRange.NSUInteger location = location;
    v11->_replacementRange.NSUInteger length = length;
    id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
    v14 = [v10 _textStorage];
    v15 = objc_msgSend(v14, "_UIUndoRedoAttributedSubstringFromRange:", v8, v7);
    uint64_t v16 = [v13 initWithAttributedString:v15];
    attributedString = v12->_attributedString;
    v12->_attributedString = (NSMutableAttributedString *)v16;

    v18 = v12;
  }

  return v12;
}

- (BOOL)coalesceAffectedRange:(_NSRange)a3 replacementRange:(_NSRange)a4 selectedRange:(_NSRange)a5 textStorage:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a3.length;
  NSUInteger location = a3.location;
  id v11 = a6;
  if (length) {
    goto LABEL_2;
  }
  p_replacementRange = &self->_replacementRange;
  NSUInteger v15 = self->_replacementRange.location;
  NSUInteger v14 = self->_replacementRange.length;
  NSUInteger v16 = v14 + v15;
  if (!v7 || (v16 == location ? (BOOL v17 = v8 == 0) : (BOOL v17 = 0), !v17))
  {
    if (location + v8 != v16)
    {
LABEL_2:
      [(_UIUndoTextOperation *)self affectedRange];
      BOOL v12 = 0;
      goto LABEL_15;
    }
    if (v14 >= v8)
    {
      v14 -= v8;
    }
    else
    {
      NSUInteger v18 = v15 - v8 + v14;
      NSUInteger v14 = 0;
      p_replacementRange->NSUInteger location = v18;
    }
  }
  self->_replacementRange.NSUInteger length = v14 + v7;
  unint64_t v19 = [(_UIUndoTextOperation *)self affectedRange];
  if (p_replacementRange->location < v19)
  {
    unint64_t v21 = v19;
    uint64_t v22 = v20;
    attributedString = self->_attributedString;
    v24 = objc_msgSend(v11, "_UIUndoRedoAttributedSubstringFromRange:", location, v8);
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributedString, "replaceCharactersInRange:withAttributedString:", 0, 0, v24);

    -[_UIUndoTextOperation setAffectedRange:](self, "setAffectedRange:", p_replacementRange->location, v22 + v21 - p_replacementRange->location);
  }
  BOOL v12 = 1;
LABEL_15:

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
    id v10 = [(NSMutableAttributedString *)self->_attributedString string];
    int v11 = objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", location, length, v10);

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
      id v13 = objc_msgSend(v9, "_UIUndoRedoAttributedSubstringFromRange:", location, length);
      NSUInteger v14 = (NSMutableAttributedString *)[v12 initWithAttributedString:v13];

      [v4 undoWillChangeText];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __38___UITextUndoOperationTyping_undoRedo__block_invoke;
      v23[3] = &unk_1E530B1C0;
      v23[5] = location;
      v23[6] = length;
      v23[4] = self;
      [v9 coordinateEditing:v23];
      if ([v5 isUndoing])
      {
        NSUInteger v15 = [(_UIUndoTextOperation *)self affectedRange];
        uint64_t v17 = v16;
      }
      else
      {
        uint64_t v17 = 0;
        NSUInteger v15 = self->_replacementRange.length + self->_replacementRange.location;
      }
      objc_msgSend(v4, "setSelectedRange:", v15, v17);
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", location, length, self->_attributedString);
      objc_msgSend(v4, "scrollRangeToVisible:", v15, v17);
      attributedString = self->_attributedString;
      self->_attributedString = v14;
      uint64_t v20 = v14;

      unint64_t v21 = [v4 _textStorage];
      [v5 registerUndoWithTarget:v21 selector:sel__UIUndoRedoTextOperation_ object:self];
    }
    [v4 _setUndoRedoInProgress:0];
    v22.receiver = self;
    v22.super_class = (Class)_UITextUndoOperationTyping;
    [(_UIUndoTextOperation *)&v22 undoRedo];
  }
  else
  {
    NSUInteger v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"NSTextStorage_Undo.m", 260, @"Incorrect or nil NSTextStorage requested for undo operation %@, ", self object file lineNumber description];
  }
}

- (BOOL)supportsCoalescing
{
  return 1;
}

- (void).cxx_destruct
{
}

@end