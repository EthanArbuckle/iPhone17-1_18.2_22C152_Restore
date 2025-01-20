@interface _UIUndoTextOperation
- (BOOL)supportsCoalescing;
- (UITextInputController)inputController;
- (_NSRange)affectedRange;
- (_UIUndoTextOperation)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4;
- (void)setAffectedRange:(_NSRange)a3;
- (void)setInputController:(id)a3;
@end

@implementation _UIUndoTextOperation

- (_UIUndoTextOperation)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIUndoTextOperation;
  v8 = [(_UIUndoTextOperation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_affectedRange.NSUInteger location = location;
    v8->_affectedRange.NSUInteger length = length;
    objc_storeWeak((id *)&v8->_inputController, v7);
    v10 = v9;
  }

  return v9;
}

- (BOOL)supportsCoalescing
{
  return 0;
}

- (_NSRange)affectedRange
{
  NSUInteger length = self->_affectedRange.length;
  NSUInteger location = self->_affectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAffectedRange:(_NSRange)a3
{
  self->_affectedRange = a3;
}

- (UITextInputController)inputController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  return (UITextInputController *)WeakRetained;
}

- (void)setInputController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end