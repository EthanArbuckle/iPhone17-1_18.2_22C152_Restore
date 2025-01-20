@interface _UIFocusMoveTest
- (BOOL)_dataSourceShouldResetFocusBeforeIteration:(unint64_t)a3;
- (BOOL)resetsFocusBeforeIterations;
- (UIFocusEnvironment)containerFocusEnvironment;
- (_UIFocusMoveTest)initWithIdentifier:(id)a3;
- (_UIFocusMoveTestDataSource)dataSource;
- (_UIFocusMoveTestDelegate)delegate;
- (double)_dataSourceDelayBeforeMove:(unint64_t)a3 duringIteration:(unint64_t)a4;
- (double)movementDelay;
- (unint64_t)_dataSourceHeadingForMove:(unint64_t)a3 duringIteration:(unint64_t)a4;
- (unint64_t)_dataSourceMaximumNumberOfMovesDuringIteration:(unint64_t)a3;
- (unint64_t)_dataSourceNumberOfIterations;
- (unint64_t)maximumMovesPerIteration;
- (unint64_t)movementHeading;
- (unint64_t)numberOfIterations;
- (void)_notifyDelegateDidFinishIteration:(unint64_t)a3;
- (void)_notifyDelegateDidMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5;
- (void)_notifyDelegateWillMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5;
- (void)_notifyDelegateWillStartIteration:(unint64_t)a3;
- (void)_performFocusMovement;
- (void)_performFocusMovementAfterDelayForMove:(unint64_t)a3 iteration:(unint64_t)a4;
- (void)_resetFocusIfNecessaryBeforeIteration:(unint64_t)a3;
- (void)main;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)reset;
- (void)setContainerFocusEnvironment:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumMovesPerIteration:(unint64_t)a3;
- (void)setMovementDelay:(double)a3;
- (void)setMovementHeading:(unint64_t)a3;
- (void)setNumberOfIterations:(unint64_t)a3;
- (void)setResetsFocusBeforeIterations:(BOOL)a3;
@end

@implementation _UIFocusMoveTest

- (_UIFocusMoveTest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusMoveTest;
  result = [(_UIFocusTest *)&v4 initWithIdentifier:a3];
  if (result)
  {
    result->_numberOfIterations = 1;
    result->_maximumMovesPerIteration = -1;
    result->_movementDelay = 0.0;
    result->_movementHeading = 8;
    result->_resetsFocusBeforeIterations = 1;
  }
  return result;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMoveTest;
  [(_UIFocusTest *)&v3 reset];
  self->_activeNumberOfIterations = 0;
  self->_currentMove = 0;
  self->_currentIteration = 0;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v7 = (void (**)(void))a3;
  v5 = [(_UIFocusMoveTest *)self containerFocusEnvironment];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIFocusMoveTest.m" lineNumber:69 description:@"Focus move test must having a container focus environment before being run."];
  }
  self->_activeNumberOfIterations = [(_UIFocusMoveTest *)self _dataSourceNumberOfIterations];
  v7[2]();
}

- (void)main
{
  if (self->_activeNumberOfIterations) {
    [(_UIFocusMoveTest *)self _performFocusMovementAfterDelayForMove:0 iteration:0];
  }
}

- (void)_performFocusMovementAfterDelayForMove:(unint64_t)a3 iteration:(unint64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  -[_UIFocusMoveTest _dataSourceDelayBeforeMove:duringIteration:](self, "_dataSourceDelayBeforeMove:duringIteration:");
  double v8 = v7;
  if (!a3)
  {
    [(_UIFocusMoveTest *)self _resetFocusIfNecessaryBeforeIteration:a4];
    [(_UIFocusMoveTest *)self _notifyDelegateWillStartIteration:a4];
  }
  self->_currentMove = a3;
  self->_currentIteration = a4;
  v10[0] = *MEMORY[0x1E4F1C4B0];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(_UIFocusMoveTest *)self performSelector:sel__performFocusMovement withObject:0 afterDelay:v9 inModes:v8];
}

- (void)_performFocusMovement
{
  if ([(_UIFocusTest *)self state] == 2)
  {
    unint64_t currentMove = self->_currentMove;
    unint64_t currentIteration = self->_currentIteration;
    unint64_t v5 = [(_UIFocusMoveTest *)self _dataSourceMaximumNumberOfMovesDuringIteration:currentIteration];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerFocusEnvironment);
    id v14 = +[UIFocusSystem focusSystemForEnvironment:WeakRetained];

    unint64_t v7 = [(_UIFocusMoveTest *)self _dataSourceHeadingForMove:currentMove duringIteration:currentIteration];
    double v8 = [(id)UIApp delegate];
    v9 = [v8 window];

    v10 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v14];
    v11 = +[_UIFocusMovementInfo _movementWithHeading:v7 isInitial:1];
    [(_UIFocusMovementRequest *)v10 setMovementInfo:v11];

    [(_UIFocusMoveTest *)self _notifyDelegateWillMoveFocusAlongHeading:v7 forMove:currentMove duringIteration:currentIteration];
    unsigned int v12 = [v14 _performFocusMovement:v10];
    [(_UIFocusMoveTest *)self _notifyDelegateDidMoveFocusAlongHeading:v7 forMove:currentMove duringIteration:currentIteration];
    if (!v12 || (unint64_t v13 = currentMove + v12, v13 == v5))
    {
      [(_UIFocusMoveTest *)self _notifyDelegateDidFinishIteration:++currentIteration];
      unint64_t v13 = 0;
    }
    if (currentIteration == self->_activeNumberOfIterations) {
      [(_UIFocusTest *)self stop];
    }
    else {
      [(_UIFocusMoveTest *)self _performFocusMovementAfterDelayForMove:v13 iteration:currentIteration];
    }
  }
}

- (void)_resetFocusIfNecessaryBeforeIteration:(unint64_t)a3
{
  if ([(_UIFocusMoveTest *)self _dataSourceShouldResetFocusBeforeIteration:a3])
  {
    objc_super v4 = [(_UIFocusMoveTest *)self containerFocusEnvironment];
    id v6 = +[UIFocusSystem focusSystemForEnvironment:v4];

    unint64_t v5 = [(_UIFocusMoveTest *)self containerFocusEnvironment];
    [v6 requestFocusUpdateToEnvironment:v5];

    [v6 updateFocusIfNeeded];
  }
}

- (_UIFocusMoveTestDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusMoveTest;
  v2 = [(_UIFocusTest *)&v4 delegate];
  return (_UIFocusMoveTestDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFocusMoveTest *)self delegate];

  v10.receiver = self;
  v10.super_class = (Class)_UIFocusMoveTest;
  [(_UIFocusTest *)&v10 setDelegate:v4];
  if (v5 != v4)
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 16;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v9;
  }
}

- (void)_notifyDelegateWillStartIteration:(unint64_t)a3
{
  id v5 = [(_UIFocusMoveTest *)self delegate];
  if (v5 && (*(_WORD *)&self->_flags & 2) != 0)
  {
    id v6 = v5;
    [v5 _focusMoveTest:self willStartIteration:a3];
    id v5 = v6;
  }
}

- (void)_notifyDelegateDidFinishIteration:(unint64_t)a3
{
  id v5 = [(_UIFocusMoveTest *)self delegate];
  if (v5 && (*(_WORD *)&self->_flags & 4) != 0)
  {
    id v6 = v5;
    [v5 _focusMoveTest:self didFinishIteration:a3];
    id v5 = v6;
  }
}

- (void)_notifyDelegateWillMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5
{
  __int16 v9 = [(_UIFocusMoveTest *)self delegate];
  if (v9 && (*(_WORD *)&self->_flags & 8) != 0)
  {
    id v10 = v9;
    [v9 _focusMoveTest:self willMoveFocusAlongHeading:a3 forMove:a4 duringIteration:a5];
    __int16 v9 = v10;
  }
}

- (void)_notifyDelegateDidMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5
{
  __int16 v9 = [(_UIFocusMoveTest *)self delegate];
  if (v9 && (*(_WORD *)&self->_flags & 0x10) != 0)
  {
    id v10 = v9;
    [v9 _focusMoveTest:self didMoveFocusAlongHeading:a3 forMove:a4 duringIteration:a5];
    __int16 v9 = v10;
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 32;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 64;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 128;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 256;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 512;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v9;
  }
}

- (unint64_t)_dataSourceNumberOfIterations
{
  unint64_t v3 = [(_UIFocusMoveTest *)self numberOfIterations];
  id v4 = [(_UIFocusMoveTest *)self dataSource];
  __int16 v5 = v4;
  if (v4 && (*(_WORD *)&self->_flags & 0x20) != 0) {
    unint64_t v3 = [v4 _numberOfIterationsInFocusMoveTest:self];
  }

  return v3;
}

- (unint64_t)_dataSourceMaximumNumberOfMovesDuringIteration:(unint64_t)a3
{
  unint64_t v5 = [(_UIFocusMoveTest *)self maximumMovesPerIteration];
  __int16 v6 = [(_UIFocusMoveTest *)self dataSource];
  __int16 v7 = v6;
  if (v6 && (*(_WORD *)&self->_flags & 0x40) != 0) {
    unint64_t v5 = [v6 _focusMoveTest:self maximumNumberOfMovesDuringIteration:a3];
  }

  return v5;
}

- (double)_dataSourceDelayBeforeMove:(unint64_t)a3 duringIteration:(unint64_t)a4
{
  [(_UIFocusMoveTest *)self movementDelay];
  double v8 = v7;
  __int16 v9 = [(_UIFocusMoveTest *)self dataSource];
  id v10 = v9;
  if (v9 && (*(_WORD *)&self->_flags & 0x80) != 0)
  {
    [v9 _focusMoveTest:self delayBeforeMove:a3 duringIteration:a4];
    double v8 = v11;
  }

  return v8;
}

- (unint64_t)_dataSourceHeadingForMove:(unint64_t)a3 duringIteration:(unint64_t)a4
{
  unint64_t v7 = [(_UIFocusMoveTest *)self movementHeading];
  double v8 = [(_UIFocusMoveTest *)self dataSource];
  __int16 v9 = v8;
  if (v8 && (*(_WORD *)&self->_flags & 0x100) != 0) {
    unint64_t v7 = [v8 _focusMoveTest:self headingForMove:a3 duringIteration:a4];
  }

  return v7;
}

- (BOOL)_dataSourceShouldResetFocusBeforeIteration:(unint64_t)a3
{
  char v5 = [(_UIFocusMoveTest *)self resetsFocusBeforeIterations];
  __int16 v6 = [(_UIFocusMoveTest *)self dataSource];
  unint64_t v7 = v6;
  if (v6 && (*(_WORD *)&self->_flags & 0x200) != 0) {
    char v5 = [v6 _focusMoveTest:self shouldResetFocusBeforeIteration:a3];
  }

  return v5;
}

- (UIFocusEnvironment)containerFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerFocusEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (void)setContainerFocusEnvironment:(id)a3
{
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)setNumberOfIterations:(unint64_t)a3
{
  self->_numberOfIterations = a3;
}

- (unint64_t)maximumMovesPerIteration
{
  return self->_maximumMovesPerIteration;
}

- (void)setMaximumMovesPerIteration:(unint64_t)a3
{
  self->_maximumMovesPerIteration = a3;
}

- (double)movementDelay
{
  return self->_movementDelay;
}

- (void)setMovementDelay:(double)a3
{
  self->_movementDelay = a3;
}

- (unint64_t)movementHeading
{
  return self->_movementHeading;
}

- (void)setMovementHeading:(unint64_t)a3
{
  self->_movementHeading = a3;
}

- (BOOL)resetsFocusBeforeIterations
{
  return self->_resetsFocusBeforeIterations;
}

- (void)setResetsFocusBeforeIterations:(BOOL)a3
{
  self->_resetsFocusBeforeIterations = a3;
}

- (_UIFocusMoveTestDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (_UIFocusMoveTestDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_containerFocusEnvironment);
}

@end