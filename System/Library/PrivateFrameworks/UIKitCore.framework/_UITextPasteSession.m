@interface _UITextPasteSession
- (BOOL)isAnimating;
- (NSArray)originalItems;
- (NSAttributedString)pasteResult;
- (UITextPasteController)controller;
- (UITextPasteCoordinator)coordinator;
- (UITextPasteSessionDelegate)delegate;
- (UITextRange)hiddenRange;
- (UITextRange)range;
- (_UITextPasteProgressSupport)progressSupport;
- (id)positionedPasteResult;
- (void)animationCompleted;
- (void)animationStarted;
- (void)setController:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHiddenRange:(id)a3;
- (void)setOriginalItems:(id)a3;
- (void)setPasteResult:(id)a3;
- (void)setProgressSupport:(id)a3;
- (void)setRange:(id)a3;
@end

@implementation _UITextPasteSession

- (id)positionedPasteResult
{
  v3 = [(_UITextPasteSession *)self pasteResult];
  if (v3)
  {
    v4 = [(_UITextPasteSession *)self pasteResult];
    v5 = [(_UITextPasteSession *)self range];
    v6 = [v5 start];
    v7 = +[_UIPositionedAttributedString attributedString:v4 atPosition:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)animationStarted
{
  v3 = [(_UITextPasteSession *)self hiddenRange];

  if (!v3) {
    self->_animating = 1;
  }
}

- (void)animationCompleted
{
  if (self->_animating)
  {
    self->_animating = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained _restorePasteResultForSession:self];
  }
}

- (UITextPasteSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITextPasteSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextPasteController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (UITextPasteController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UITextPasteCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (_UITextPasteProgressSupport)progressSupport
{
  return self->_progressSupport;
}

- (void)setProgressSupport:(id)a3
{
}

- (NSAttributedString)pasteResult
{
  return self->_pasteResult;
}

- (void)setPasteResult:(id)a3
{
}

- (NSArray)originalItems
{
  return self->_originalItems;
}

- (void)setOriginalItems:(id)a3
{
}

- (UITextRange)hiddenRange
{
  return self->_hiddenRange;
}

- (void)setHiddenRange:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenRange, 0);
  objc_storeStrong((id *)&self->_originalItems, 0);
  objc_storeStrong((id *)&self->_pasteResult, 0);
  objc_storeStrong((id *)&self->_progressSupport, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_delegate);
}

@end