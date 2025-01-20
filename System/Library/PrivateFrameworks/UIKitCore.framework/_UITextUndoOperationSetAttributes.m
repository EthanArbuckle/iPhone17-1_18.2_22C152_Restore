@interface _UITextUndoOperationSetAttributes
- (_UITextUndoOperationSetAttributes)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4;
- (void)undoRedo;
@end

@implementation _UITextUndoOperationSetAttributes

- (_UITextUndoOperationSetAttributes)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UITextUndoOperationSetAttributes;
  v8 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v17, sel_initWithAffectedRange_inputController_, location, length, v7);
  if (v8)
  {
    id v9 = objc_alloc((Class)off_1E52D5040);
    v10 = [v7 _textStorage];
    uint64_t v11 = [(_UIUndoTextOperation *)v8 affectedRange];
    uint64_t v13 = objc_msgSend(v9, "initWithTextStorage:range:", v10, v11, v12);
    attributes = v8->_attributes;
    v8->_attributes = (_NSAttributeRun *)v13;

    v15 = v8;
  }

  return v8;
}

- (void)undoRedo
{
  v4 = [(_UIUndoTextOperation *)self inputController];
  v5 = [v4 _textStorage];
  if (v5)
  {
    [v4 _setUndoRedoInProgress:1];
    uint64_t v6 = [(_NSAttributeRun *)self->_attributes range];
    if (objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", v6, v7, 0))
    {
      uint64_t v8 = [(_UIUndoTextOperation *)self affectedRange];
      uint64_t v10 = v9;
      uint64_t v11 = (_NSAttributeRun *)objc_msgSend(objc_alloc((Class)off_1E52D5040), "initWithTextStorage:range:", v5, v8, v9);
      [v4 undoWillChangeText];
      [(_NSAttributeRun *)self->_attributes restoreAttributesOfTextStorage:v5];
      attributes = self->_attributes;
      self->_attributes = v11;
      uint64_t v13 = v11;

      uint64_t v14 = [(_UIUndoTextOperation *)self affectedRange];
      uint64_t v16 = v15;
      objc_msgSend(v4, "setSelectedRange:", v14, v15);
      objc_super v17 = objc_msgSend(v5, "attributedSubstringFromRange:", v14, v16);
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", v8, v10, v17);

      objc_msgSend(v4, "scrollRangeToVisible:", v14, v16);
      v18 = [v4 undoManager];
      v19 = [v4 _textStorage];
      [v18 registerUndoWithTarget:v19 selector:sel__UIUndoRedoTextOperation_ object:self];

      [v4 _invalidateTypingAttributes];
    }
    [v4 _setUndoRedoInProgress:0];
    v21.receiver = self;
    v21.super_class = (Class)_UITextUndoOperationSetAttributes;
    [(_UIUndoTextOperation *)&v21 undoRedo];
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"NSTextStorage_Undo.m", 167, @"Incorrect or nil NSTextStorage requested for undo operation: %@", self object file lineNumber description];
  }
}

- (void).cxx_destruct
{
}

@end