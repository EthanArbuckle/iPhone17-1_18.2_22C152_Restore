@interface TTRUndoManagerActionContext
- (TTRUndoManager)undoManagerOfLastRegisteredUndo;
- (void)setUndoManagerOfLastRegisteredUndo:(id)a3;
@end

@implementation TTRUndoManagerActionContext

- (TTRUndoManager)undoManagerOfLastRegisteredUndo
{
  return self->_undoManagerOfLastRegisteredUndo;
}

- (void)setUndoManagerOfLastRegisteredUndo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end