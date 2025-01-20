@interface TVRCRapportRemoteTextInputKeyboardImpl
- (BOOL)editing;
- (BOOL)isEditing;
- (RTIInputSystemSourceSession)currentSession;
- (TVRCKeyboardAttributes)currentAttributes;
- (TVRCRPCompanionLinkClientWrapper)companionLinkWrapper;
- (TVRXKeyboardController)keyboardController;
- (id)attributes;
- (id)text;
- (void)_receivedInputSourceSession:(id)a3;
- (void)_stopObservingTelevisionEditingSession;
- (void)handleTextActionPayload:(id)a3;
- (void)inputSessionDidBegin:(id)a3;
- (void)inputSessionDidDie:(id)a3;
- (void)inputSessionDidEnd:(id)a3;
- (void)setCompanionLinkWrapper:(id)a3;
- (void)setCurrentAttributes:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setKeyboardController:(id)a3;
- (void)setTextActionPayload:(id)a3;
@end

@implementation TVRCRapportRemoteTextInputKeyboardImpl

- (void)setCompanionLinkWrapper:(id)a3
{
  v5 = (TVRCRPCompanionLinkClientWrapper *)a3;
  companionLinkWrapper = self->_companionLinkWrapper;
  if (companionLinkWrapper != v5)
  {
    [(TVRCRPCompanionLinkClientWrapper *)companionLinkWrapper setRTISessionHandler:0];
    objc_storeStrong((id *)&self->_companionLinkWrapper, a3);
    objc_initWeak(&location, self);
    v7 = self->_companionLinkWrapper;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke;
    v11[3] = &unk_2647AFE48;
    objc_copyWeak(&v12, &location);
    [(TVRCRPCompanionLinkClientWrapper *)v7 getCurrentRTISourceSession:v11];
    v8 = self->_companionLinkWrapper;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_1;
    v9[3] = &unk_2647AFE70;
    objc_copyWeak(&v10, &location);
    [(TVRCRPCompanionLinkClientWrapper *)v8 setRTISessionHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = _TVRCRemoteTextInputLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_cold_1((uint64_t)v6, v8);
      }
    }
    else if (v5)
    {
      v9 = _TVRCRemoteTextInputLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Keyboard connected to existing RemoteTextInput source session during setup", v10, 2u);
      }

      [WeakRetained _receivedInputSourceSession:v5];
    }
  }
}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = _TVRCRemoteTextInputLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard received callback for RemoteTextInput session", v6, 2u);
    }

    [WeakRetained _receivedInputSourceSession:v3];
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (id)attributes
{
  return self->_currentAttributes;
}

- (id)text
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [(RTIInputSystemSourceSession *)self->_currentSession documentState];
  id v3 = [v2 documentState];
  v4 = [v3 contextBeforeInput];

  id v5 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard returning RTI text as %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setTextActionPayload:(id)a3
{
  currentSession = self->_currentSession;
  id v4 = a3;
  id v5 = [(RTIInputSystemSourceSession *)currentSession payloadDelegate];
  [v5 handleTextActionPayload:v4];
}

- (void)inputSessionDidBegin:(id)a3
{
  id v4 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did begin", v6, 2u);
  }

  if (!self->_editing)
  {
    self->_editing = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    [WeakRetained _editingSessionBeganWithAttributes:self->_currentAttributes];
  }
}

- (void)inputSessionDidEnd:(id)a3
{
  id v4 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did end", v6, 2u);
  }

  if (self->_editing)
  {
    self->_editing = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    [WeakRetained _editingSessionEnded];
  }
}

- (void)inputSessionDidDie:(id)a3
{
  id v4 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did die", v6, 2u);
  }

  if (self->_editing)
  {
    self->_editing = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    [WeakRetained _editingSessionEnded];
  }
}

- (void)handleTextActionPayload:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = _TVRCRemoteTextInputLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput received text action payload", v14, 2u);
    }

    id v6 = [[TVRCKeyboardAttributes alloc] _init];
    currentAttributes = self->_currentAttributes;
    self->_currentAttributes = v6;

    [(TVRCKeyboardAttributes *)self->_currentAttributes setRtiDataPayload:v4];
    v8 = [(RTIInputSystemSourceSession *)self->_currentSession documentTraits];
    uint64_t v9 = [v8 prompt];

    id v10 = self->_currentAttributes;
    if (v9)
    {
      [(TVRCKeyboardAttributes *)self->_currentAttributes setTitle:v9];
    }
    else
    {
      v11 = [(RTIInputSystemSourceSession *)self->_currentSession documentTraits];
      id v12 = [v11 title];
      [(TVRCKeyboardAttributes *)v10 setTitle:v12];
    }
    if (self->_editing)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
      [WeakRetained _editingSessionUpdatedAttributes:self->_currentAttributes];
    }
    else
    {
      self->_editing = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
      [WeakRetained _editingSessionBeganWithAttributes:self->_currentAttributes];
    }
  }
}

- (void)_stopObservingTelevisionEditingSession
{
  [(RTIInputSystemSourceSession *)self->_currentSession removeSessionDelegate:self];
  currentSession = self->_currentSession;
  self->_currentSession = 0;
}

- (void)_receivedInputSourceSession:(id)a3
{
  id v5 = (RTIInputSystemSourceSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5)
  {
    [(RTIInputSystemSourceSession *)currentSession setForwardingPayloadDelegate:0];
    [(RTIInputSystemSourceSession *)self->_currentSession removeSessionDelegate:self];
    objc_storeStrong((id *)&self->_currentSession, a3);
    [(RTIInputSystemSourceSession *)self->_currentSession addSessionDelegate:self];
    [(RTIInputSystemSourceSession *)self->_currentSession setForwardingPayloadDelegate:self];
    int v7 = [(RTIInputSystemSourceSession *)self->_currentSession currentForwardingDataPayload];
    [(TVRCRapportRemoteTextInputKeyboardImpl *)self handleTextActionPayload:v7];
  }

  MEMORY[0x270F9A758]();
}

- (TVRXKeyboardController)keyboardController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);

  return (TVRXKeyboardController *)WeakRetained;
}

- (void)setKeyboardController:(id)a3
{
}

- (TVRCRPCompanionLinkClientWrapper)companionLinkWrapper
{
  return self->_companionLinkWrapper;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (RTIInputSystemSourceSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (TVRCKeyboardAttributes)currentAttributes
{
  return self->_currentAttributes;
}

- (void)setCurrentAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAttributes, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_companionLinkWrapper, 0);

  objc_destroyWeak((id *)&self->_keyboardController);
}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Keyboard failed to fetch current RemoteTextInput source session from television. Error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end