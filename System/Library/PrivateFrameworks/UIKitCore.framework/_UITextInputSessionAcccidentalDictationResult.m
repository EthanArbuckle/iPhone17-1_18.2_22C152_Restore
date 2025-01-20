@interface _UITextInputSessionAcccidentalDictationResult
- (_UITextInputSessionKeyboardDockItemButtonPressAction)triggerAction;
- (unint64_t)result;
- (void)setResult:(unint64_t)a3;
- (void)setTriggerAction:(id)a3;
@end

@implementation _UITextInputSessionAcccidentalDictationResult

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (_UITextInputSessionKeyboardDockItemButtonPressAction)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end