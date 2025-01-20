@interface TVRXKeyboardController
- (BOOL)isEditing;
- (NSString)text;
- (TVRCKeyboardAttributes)attributes;
- (TVRXKeyboardControllerDelegate)delegate;
- (TVRXKeyboardImpl)_keyboardImpl;
- (id)_init;
- (void)_beginSessionWithAttributes:(id)a3;
- (void)_editingSessionUpdatedAttributes:(id)a3;
- (void)_editingSessionUpdatedText:(id)a3;
- (void)_endSession;
- (void)_setKeyboardImpl:(id)a3;
- (void)sendReturnKey;
- (void)sendTextActionPayload:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation TVRXKeyboardController

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRXKeyboardController;
  return [(TVRXKeyboardController *)&v3 init];
}

- (BOOL)isEditing
{
  return [(TVRXKeyboardImpl *)self->_keyboardImpl isEditing];
}

- (TVRCKeyboardAttributes)attributes
{
  return (TVRCKeyboardAttributes *)[(TVRXKeyboardImpl *)self->_keyboardImpl attributes];
}

- (NSString)text
{
  v2 = [(TVRXKeyboardImpl *)self->_keyboardImpl text];
  objc_super v3 = v2;
  if (!v2) {
    v2 = &stru_26DA49BC8;
  }
  v4 = v2;

  return v4;
}

- (void)setText:(id)a3
{
  v4 = &stru_26DA49BC8;
  if (a3) {
    v4 = (__CFString *)a3;
  }
  v5 = v4;
  [(TVRXKeyboardImpl *)self->_keyboardImpl setText:v5];
}

- (void)sendReturnKey
{
}

- (void)sendTextActionPayload:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(TVRXKeyboardImpl *)self->_keyboardImpl setTextActionPayload:v4];
  }
}

- (void)_setKeyboardImpl:(id)a3
{
  v5 = (TVRXKeyboardImpl *)a3;
  p_keyboardImpl = &self->_keyboardImpl;
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl != v5)
  {
    int v8 = [(TVRXKeyboardImpl *)keyboardImpl isEditing];
    [(TVRXKeyboardImpl *)*p_keyboardImpl setKeyboardController:0];
    v9 = *p_keyboardImpl;
    *p_keyboardImpl = 0;

    if (v8) {
      [(TVRXKeyboardController *)self _endSession];
    }
    objc_storeStrong((id *)&self->_keyboardImpl, a3);
    [(TVRXKeyboardImpl *)self->_keyboardImpl setKeyboardController:self];
    if ([(TVRXKeyboardImpl *)self->_keyboardImpl isEditing])
    {
      v10 = [(TVRXKeyboardImpl *)self->_keyboardImpl attributes];
      [(TVRXKeyboardController *)self _beginSessionWithAttributes:v10];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)_editingSessionUpdatedText:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained keyboardController:self didUpdateText:v5];
  }
}

- (void)_editingSessionUpdatedAttributes:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained keyboardController:self didUpdateAttributes:v5];
  }
}

- (void)_beginSessionWithAttributes:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained keyboardController:self beganTextEditingWithAttributes:v5];
  }
}

- (void)_endSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained keyboardControllerEndedTextEditing:self];
  }
}

- (TVRXKeyboardControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRXKeyboardControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRXKeyboardImpl)_keyboardImpl
{
  return self->_keyboardImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardImpl, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end