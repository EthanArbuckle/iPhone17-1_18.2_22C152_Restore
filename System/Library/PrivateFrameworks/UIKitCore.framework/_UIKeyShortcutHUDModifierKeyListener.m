@interface _UIKeyShortcutHUDModifierKeyListener
- (_UIKeyShortcutHUDKeyListenerDelegate)delegate;
- (int64_t)currentModifierFlags;
- (void)handleKeyboardEvent:(id)a3;
- (void)setCurrentModifierFlags:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIKeyShortcutHUDModifierKeyListener

- (void)handleKeyboardEvent:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [v9 modifierFlags] & 0xFFFFFFFFFFFEFFFFLL;
  int64_t currentModifierFlags = self->_currentModifierFlags;
  self->_int64_t currentModifierFlags = v4;
  if ([v9 _isModifierKey])
  {
    [v9 _isKeyDown];
  }
  else
  {
    char v6 = [v9 _isGlobeKey];
    if ([v9 _isKeyDown] && (v6 & 1) == 0)
    {
      v7 = [(_UIKeyShortcutHUDModifierKeyListener *)self delegate];
      [v7 modifierKeyListenerDidPressNonModifierKey:self];
      goto LABEL_8;
    }
  }
  unint64_t v8 = currentModifierFlags ^ v4;
  if (!v8) {
    goto LABEL_9;
  }
  v7 = [(_UIKeyShortcutHUDModifierKeyListener *)self delegate];
  [v7 modifierKeyListener:self didUpdateModifierFlag:v8];
LABEL_8:

LABEL_9:
}

- (_UIKeyShortcutHUDKeyListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDKeyListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentModifierFlags
{
  return self->_currentModifierFlags;
}

- (void)setCurrentModifierFlags:(int64_t)a3
{
  self->_int64_t currentModifierFlags = a3;
}

- (void).cxx_destruct
{
}

@end