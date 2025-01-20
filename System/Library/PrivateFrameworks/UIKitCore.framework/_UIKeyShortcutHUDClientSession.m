@interface _UIKeyShortcutHUDClientSession
- (BOOL)textEditingSessionWasTornDown;
- (_UIKeyShortcutHUDConfiguration)configuration;
- (void)setConfiguration:(id)a3;
- (void)setTextEditingSessionWasTornDown:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDClientSession

- (_UIKeyShortcutHUDConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)textEditingSessionWasTornDown
{
  return self->_textEditingSessionWasTornDown;
}

- (void)setTextEditingSessionWasTornDown:(BOOL)a3
{
  self->_textEditingSessionWasTornDown = a3;
}

- (void).cxx_destruct
{
}

@end