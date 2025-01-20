@interface TVRCKeyboardController
- (BOOL)isEditing;
- (NSString)text;
- (TVRCKeyboardAttributes)attributes;
- (TVRCKeyboardControllerDelegate)delegate;
- (id)_initWithDevice:(id)a3;
- (void)_setCurrentState:(id)a3;
- (void)sendReturnKey;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation TVRCKeyboardController

- (id)_initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCKeyboardController;
  v5 = [(TVRCKeyboardController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_device, v4);
    v6->_editing = 0;
    attributes = v6->_attributes;
    v6->_attributes = 0;

    text = v6->_text;
    v6->_text = (NSString *)&stru_26DA49BC8;
  }
  return v6;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (NSString)text
{
  if (self->_text) {
    return self->_text;
  }
  else {
    return (NSString *)&stru_26DA49BC8;
  }
}

- (void)setText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  text = self->_text;
  self->_text = v4;

  id v9 = +[TVRCXPCClient sharedInstance];
  v6 = self->_text;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v8 = [WeakRetained identifier];
  [v9 sendInputText:v6 toDeviceWithIdentifier:v8];
}

- (void)sendReturnKey
{
  id v5 = +[TVRCXPCClient sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  id v4 = [WeakRetained identifier];
  [v5 sendInputReturnKeyToDeviceWithIdentifier:v4];
}

- (void)_setCurrentState:(id)a3
{
  if (!a3) {
    return;
  }
  BOOL editing = self->_editing;
  v24 = self->_text;
  v6 = self->_attributes;
  id v7 = a3;
  self->_BOOL editing = [v7 isEditing];
  v8 = [v7 text];
  id v9 = (NSString *)[v8 copy];
  text = self->_text;
  self->_text = v9;

  v11 = [v7 attributes];

  attributes = self->_attributes;
  self->_attributes = v11;

  if (editing)
  {
    if (!self->_editing)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 keyboardControllerEndedTextEditing:self];
      }
      if (!self->_editing) {
        goto LABEL_18;
      }
    }
    if (![(NSString *)v24 isEqualToString:self->_text])
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 keyboardController:self didUpdateText:self->_text];
      }
    }
    if ([(TVRCKeyboardAttributes *)v6 isEqualToAttributes:self->_attributes]) {
      goto LABEL_18;
    }
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_18;
    }
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    [v21 keyboardController:self didUpdateAttributes:self->_attributes];
    goto LABEL_17;
  }
  if (self->_editing)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      [v21 keyboardController:self beganTextEditingWithAttributes:self->_attributes];
LABEL_17:
    }
  }
LABEL_18:
}

- (TVRCKeyboardControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCKeyboardControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_destroyWeak((id *)&self->_device);
}

@end