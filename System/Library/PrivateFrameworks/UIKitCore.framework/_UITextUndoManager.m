@interface _UITextUndoManager
- (BOOL)canRedo;
- (BOOL)canUndo;
- (UITextInputController)inputController;
- (void)redo;
- (void)removeAllActions;
- (void)setInputController:(id)a3;
- (void)undo;
@end

@implementation _UITextUndoManager

- (void)setInputController:(id)a3
{
}

- (void)removeAllActions
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v5 = [WeakRetained dontRemoveAllActions];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained((id *)p_inputController);
    [v6 undoManagerWillRemoveAllActions];

    id v7 = objc_loadWeakRetained((id *)p_inputController);
    [v7 stopCoalescing];

    v8.receiver = self;
    v8.super_class = (Class)_UITextUndoManager;
    [(_UITextUndoManager *)&v8 removeAllActions];
  }
}

- (BOOL)canUndo
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained
    && (id v5 = objc_loadWeakRetained((id *)p_inputController),
        char v6 = [v5 isWritingToolsStreamingReplacements],
        v5,
        (v6 & 1) == 0))
  {
    if (!+[UIDictationController isRunning]
      || (BOOL v7 = +[UIDictationController canUndoOrRedo]))
    {
      v9.receiver = self;
      v9.super_class = (Class)_UITextUndoManager;
      LOBYTE(v7) = [(_UITextUndoManager *)&v9 canUndo];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)canRedo
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained
    && (id v5 = objc_loadWeakRetained((id *)p_inputController),
        char v6 = [v5 isWritingToolsStreamingReplacements],
        v5,
        (v6 & 1) == 0))
  {
    if (!+[UIDictationController isRunning]
      || (BOOL v7 = +[UIDictationController canUndoOrRedo]))
    {
      v9.receiver = self;
      v9.super_class = (Class)_UITextUndoManager;
      LOBYTE(v7) = [(_UITextUndoManager *)&v9 canRedo];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)undo
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained undoManagerWillBeginUndoRedo];

  v6.receiver = self;
  v6.super_class = (Class)_UITextUndoManager;
  [(_UITextUndoManager *)&v6 undo];
  id v5 = objc_loadWeakRetained((id *)p_inputController);
  [v5 undoManagerDidFinishUndoRedo];
}

- (void)redo
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained undoManagerWillBeginUndoRedo];

  v6.receiver = self;
  v6.super_class = (Class)_UITextUndoManager;
  [(_UITextUndoManager *)&v6 redo];
  id v5 = objc_loadWeakRetained((id *)p_inputController);
  [v5 undoManagerDidFinishUndoRedo];
}

- (UITextInputController)inputController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  return (UITextInputController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end