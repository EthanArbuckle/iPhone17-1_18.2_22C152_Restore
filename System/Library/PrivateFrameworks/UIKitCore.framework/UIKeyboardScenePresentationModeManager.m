@interface UIKeyboardScenePresentationModeManager
- (BOOL)enhancedWindowingModeEnabled;
- (UIKeyboardScenePresentationModeManagerDelegate)delegate;
- (unint64_t)currentPresentationMode;
- (unint64_t)determinePresentationMode;
- (unint64_t)determineiPadPresentationMode;
- (unint64_t)determineiPhonePresentationMode;
- (unint64_t)presentationMode;
- (void)_enhancedWindowingModeEnabledDidChange:(id)a3;
- (void)didChangeToPresentationMode:(unint64_t)a3;
- (void)enhancedWindowingModeEnabledDidChange:(BOOL)a3;
- (void)setCurrentPresentationMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnhancedWindowingModeEnabled:(BOOL)a3;
@end

@implementation UIKeyboardScenePresentationModeManager

- (unint64_t)presentationMode
{
  unint64_t v3 = [(UIKeyboardScenePresentationModeManager *)self determinePresentationMode];
  unint64_t v4 = v3;
  if (self->_currentPresentationMode != v3)
  {
    self->_currentPresentationMode = v3;
    -[UIKeyboardScenePresentationModeManager didChangeToPresentationMode:](self, "didChangeToPresentationMode:");
    return self->_currentPresentationMode;
  }
  return v4;
}

- (unint64_t)determinePresentationMode
{
  unint64_t v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    return [(UIKeyboardScenePresentationModeManager *)self determineiPadPresentationMode];
  }
  else if (v4)
  {
    return 0;
  }
  else
  {
    return [(UIKeyboardScenePresentationModeManager *)self determineiPhonePresentationMode];
  }
}

- (unint64_t)determineiPhonePresentationMode
{
  return 1;
}

- (unint64_t)determineiPadPresentationMode
{
  if (self->_enhancedWindowingModeEnabled) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)enhancedWindowingModeEnabledDidChange:(BOOL)a3
{
  if (self->_enhancedWindowingModeEnabled != a3)
  {
    self->_enhancedWindowingModeEnabled = a3;
    [(UIKeyboardScenePresentationModeManager *)self presentationMode];
  }
}

- (void)_enhancedWindowingModeEnabledDidChange:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  [(UIKeyboardScenePresentationModeManager *)self enhancedWindowingModeEnabledDidChange:v4];
}

- (void)didChangeToPresentationMode:(unint64_t)a3
{
  v5 = [(UIKeyboardScenePresentationModeManager *)self delegate];

  if (v5)
  {
    id v6 = [(UIKeyboardScenePresentationModeManager *)self delegate];
    [v6 scenePresentationModeManager:self didChangeToMode:a3];
  }
}

- (BOOL)enhancedWindowingModeEnabled
{
  return self->_enhancedWindowingModeEnabled;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3
{
  self->_enhancedWindowingModeEnabled = a3;
}

- (UIKeyboardScenePresentationModeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardScenePresentationModeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)currentPresentationMode
{
  return self->_currentPresentationMode;
}

- (void)setCurrentPresentationMode:(unint64_t)a3
{
  self->_currentPresentationMode = a3;
}

- (void).cxx_destruct
{
}

@end