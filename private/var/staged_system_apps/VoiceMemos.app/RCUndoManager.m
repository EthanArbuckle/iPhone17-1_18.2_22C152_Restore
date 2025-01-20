@interface RCUndoManager
- (BOOL)canUndo;
- (BOOL)undoDisabled;
- (void)setUndoDisabled:(BOOL)a3;
@end

@implementation RCUndoManager

- (BOOL)canUndo
{
  if ([(RCUndoManager *)self undoDisabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RCUndoManager;
  return [(RCUndoManager *)&v4 canUndo];
}

- (BOOL)undoDisabled
{
  return self->_undoDisabled;
}

- (void)setUndoDisabled:(BOOL)a3
{
  self->_undoDisabled = a3;
}

@end