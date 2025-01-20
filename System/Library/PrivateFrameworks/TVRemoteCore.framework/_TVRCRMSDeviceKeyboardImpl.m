@interface _TVRCRMSDeviceKeyboardImpl
- (BOOL)editing;
- (BOOL)isEditing;
- (TVRMSKeyboardInfo)keyboardInfo;
- (TVRXKeyboardController)keyboardController;
- (_TVRCRMSDeviceKeyboardImplDelegate)delegate;
- (id)_attributesForKeyboardInfo:(id)a3;
- (id)attributes;
- (id)text;
- (int64_t)_keyboardTypeForInfo:(id)a3;
- (void)keyboardSessionBegan:(id)a3;
- (void)keyboardSessionEnded:(id)a3;
- (void)keyboardSessionUpdatedEditingInfo:(id)a3;
- (void)sendReturnKey;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setKeyboardController:(id)a3;
- (void)setKeyboardInfo:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _TVRCRMSDeviceKeyboardImpl

- (void)keyboardSessionBegan:(id)a3
{
  id v12 = a3;
  self->_editing = 1;
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  p_keyboardController = &self->_keyboardController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
  v7 = [(_TVRCRMSDeviceKeyboardImpl *)self attributes];
  [WeakRetained _editingSessionBeganWithAttributes:v7];

  v8 = [v12 text];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_keyboardController);
    v11 = [v12 text];
    [v10 _editingSessionUpdatedText:v11];
  }
}

- (void)keyboardSessionEnded:(id)a3
{
  self->_editing = 0;
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
  [WeakRetained _editingSessionEnded];
}

- (void)keyboardSessionUpdatedEditingInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(_TVRCRMSDeviceKeyboardImpl *)self text];
  v7 = [(_TVRCRMSDeviceKeyboardImpl *)self attributes];
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  v8 = [v5 text];
  char v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = _TVRCRMSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v5 text];
      int v17 = 138543618;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard text changed from %{public}@ to %{public}@", (uint8_t *)&v17, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    v13 = [v5 text];
    [WeakRetained _editingSessionUpdatedText:v13];
  }
  v14 = [(_TVRCRMSDeviceKeyboardImpl *)self attributes];
  if (([v14 isEqualToAttributes:v7] & 1) == 0)
  {
    v15 = _TVRCRMSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard attributes changed", (uint8_t *)&v17, 2u);
    }

    id v16 = objc_loadWeakRetained((id *)&self->_keyboardController);
    [v16 _editingSessionUpdatedAttributes:v14];
  }
}

- (id)attributes
{
  return [(_TVRCRMSDeviceKeyboardImpl *)self _attributesForKeyboardInfo:self->_keyboardInfo];
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)sendReturnKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardImplRequestsSendingReturnKey:self];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v4 = [(TVRMSKeyboardInfo *)self->_keyboardInfo text];
    char v5 = [v7 isEqualToString:v4];

    if ((v5 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained keyboardImpl:self updatedText:v7];
    }
  }
}

- (id)text
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(TVRMSKeyboardInfo *)self->_keyboardInfo text];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice returning current keyboard text as %@", (uint8_t *)&v7, 0xCu);
  }
  char v5 = [(TVRMSKeyboardInfo *)self->_keyboardInfo text];

  return v5;
}

- (id)_attributesForKeyboardInfo:(id)a3
{
  id v4 = a3;
  id v5 = [[TVRCKeyboardAttributes alloc] _init];
  v6 = [v4 title];
  [v5 setTitle:v6];

  objc_msgSend(v5, "_setSecure:", objc_msgSend(v4, "secureText"));
  [v5 _setAutocapitalizationType:0];
  objc_msgSend(v5, "_setKeyboardType:", -[_TVRCRMSDeviceKeyboardImpl _keyboardTypeForInfo:](self, "_keyboardTypeForInfo:", v4));
  uint64_t v7 = [v4 keyboardInputType];

  [v5 _setLikelyPINEntry:v7 == 1];

  return v5;
}

- (int64_t)_keyboardTypeForInfo:(id)a3
{
  uint64_t v3 = [a3 keyboardType];
  if ((unint64_t)(v3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_226798B48[v3 - 1];
  }
}

- (TVRXKeyboardController)keyboardController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);

  return (TVRXKeyboardController *)WeakRetained;
}

- (void)setKeyboardController:(id)a3
{
}

- (_TVRCRMSDeviceKeyboardImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCRMSDeviceKeyboardImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (TVRMSKeyboardInfo)keyboardInfo
{
  return self->_keyboardInfo;
}

- (void)setKeyboardInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_keyboardController);
}

@end