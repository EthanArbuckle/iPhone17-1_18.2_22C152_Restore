@interface UITextServicesInteraction
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_UITextServicesResponderProxy)responderProxy;
- (void)_addShortcut:(id)a3;
- (void)_beginSessionWithType:(int64_t)a3 sender:(id)a4;
- (void)_define:(id)a3;
- (void)_removeShareController;
- (void)_removeShortcutController;
- (void)_share:(id)a3;
- (void)_translate:(id)a3;
- (void)finishSetup;
- (void)setResponderProxy:(id)a3;
@end

@implementation UITextServicesInteraction

- (void)finishSetup
{
  v3 = [(UITextInteraction *)self _textInput];
  v4 = +[_UITextServicesResponderProxy _proxyWithResponder:v3];
  [(UITextServicesInteraction *)self setResponderProxy:v4];

  id v5 = [(UITextServicesInteraction *)self responderProxy];
  [v5 setDelegate:self];
}

- (void)_beginSessionWithType:(int64_t)a3 sender:(id)a4
{
  id v6 = a4;
  if (a3 > 7)
  {
    if (a3 == 32)
    {
      id v7 = v6;
      [(UITextServicesInteraction *)self _translate:v6];
      goto LABEL_11;
    }
    if (a3 != 16)
    {
      if (a3 != 8) {
        goto LABEL_12;
      }
      id v7 = v6;
      [(UITextServicesInteraction *)self _share:v6];
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a3 == 2)
  {
LABEL_9:
    id v7 = v6;
    [(UITextServicesInteraction *)self _define:v6];
    goto LABEL_11;
  }
  if (a3 != 4) {
    goto LABEL_12;
  }
  id v7 = v6;
  [(UITextServicesInteraction *)self _addShortcut:v6];
LABEL_11:
  id v6 = v7;
LABEL_12:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5 = [(UITextInteraction *)self _textInput];
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v5 isSecureTextEntry] & 1) == 0)
  {
    id v7 = +[_UITextServiceSessionContext selectedTextRangeForTextInput:v5];
    if (sel__share_ == a3 || sel_share_ == a3)
    {
      if (qword_1EB25CFB8 != -1) {
        dispatch_once(&qword_1EB25CFB8, &__block_literal_global_561);
      }
      v9 = [v5 textInRange:v7];
      v10 = [v9 stringByTrimmingCharactersInSet:_MergedGlobals_3_26];

      if (![v10 length]) {
        goto LABEL_34;
      }
      v11 = [v5 textInputView];
      char v6 = [v11 _canShowTextServiceForType:8];
    }
    else
    {
      if (sel__define_ == a3)
      {
        v12 = [v5 textInputView];
        v10 = v12;
        uint64_t v13 = 2;
      }
      else
      {
        if (sel__translate_ != a3 && sel_translate_ != a3)
        {
          if (sel__addShortcut_ != a3 && sel_addShortcut_ != a3)
          {
            if (sel_showWritingTools_ == a3)
            {
              v10 = [v5 textInputView];
              char v6 = [v10 _shouldDisplayWritingToolsCalloutBarItem];
LABEL_35:

              goto LABEL_36;
            }
LABEL_27:
            char v6 = 0;
LABEL_36:

            goto LABEL_37;
          }
          v14 = +[_UITextServiceSession textServiceSessionForType:4];
          char v15 = [v14 isDisplaying];

          if (v15 & 1) != 0 || ([v7 isEmpty]) {
            goto LABEL_27;
          }
          v10 = [v5 textInputView];
          if ([v10 _canShowTextServiceForType:4]
            && TIEnabledInputModesAllowOneToManyShortcuts())
          {
            v11 = [v5 textInRange:v7];
            if (![v11 _containsCJScripts]
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v10 _inPopover] & 1) != 0)
            {
              char v6 = 0;
            }
            else
            {
              v17 = +[UIDevice currentDevice];
              uint64_t v18 = [v17 userInterfaceIdiom];

              if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                v19 = [v10 window];
                char v20 = [v19 _isTextEffectsWindow];

                char v6 = v20 ^ 1;
              }
              else
              {
                char v6 = 1;
              }
            }
            goto LABEL_24;
          }
LABEL_34:
          char v6 = 0;
          goto LABEL_35;
        }
        v12 = [v5 textInputView];
        v10 = v12;
        uint64_t v13 = 32;
      }
      if (![v12 _canShowTextServiceForType:v13]) {
        goto LABEL_34;
      }
      v11 = [v5 textInRange:v7];
      char v6 = [v11 length] != 0;
    }
LABEL_24:

    goto LABEL_35;
  }
  char v6 = 0;
LABEL_37:

  return v6;
}

void __57__UITextServicesInteraction_canPerformAction_withSender___block_invoke()
{
  v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v1 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  __int16 v5 = -4;
  v2 = [NSString stringWithCharacters:&v5 length:1];
  [v0 addCharactersInString:v2];
  uint64_t v3 = [v0 copy];
  v4 = (void *)_MergedGlobals_3_26;
  _MergedGlobals_3_26 = v3;
}

- (void)_removeShareController
{
}

- (void)_share:(id)a3
{
  v4 = [(UITextInteraction *)self _textInput];
  __int16 v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UITextServicesInteraction *)self _removeShareController];
  }
  id v7 = +[_UITextServiceSessionContext sessionContextForType:8 withTextInput:v4];
  v8 = [(UITextInteraction *)self view];
  v9 = [v8 _showServiceForType:8 withContext:v7];
  shareSession = self->_shareSession;
  self->_shareSession = v9;

  v11 = self->_shareSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__UITextServicesInteraction__share___block_invoke;
  v12[3] = &unk_1E530A908;
  v12[4] = self;
  [(_UITextServiceSession *)v11 setDismissedHandler:v12];
}

void __36__UITextServicesInteraction__share___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = 0;
}

- (void)_removeShortcutController
{
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(UITextInteraction *)self _textInput];
  uint64_t v6 = [(UITextInteraction *)self assistantDelegate];
  id v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UITextServicesInteraction *)self _removeShortcutController];
  }
  v9 = +[_UITextServiceSessionContext sessionContextForType:4 withTextInput:v5];
  v10 = [(UITextInteraction *)self view];
  v11 = [v10 _showServiceForType:4 withContext:v9];
  learnSession = self->_learnSession;
  self->_learnSession = v11;

  [v5 resignFirstResponder];
  objc_initWeak(&location, self);
  uint64_t v13 = self->_learnSession;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__UITextServicesInteraction__addShortcut___block_invoke;
  v15[3] = &unk_1E530A930;
  objc_copyWeak(&v17, &location);
  id v14 = v6;
  id v16 = v14;
  [(_UITextServiceSession *)v13 setDismissedHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __42__UITextServicesInteraction__addShortcut___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[15];
    WeakRetained[15] = 0;
    id v7 = WeakRetained;

    id v4 = +[UIDevice currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    WeakRetained = v7;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      uint64_t v6 = [*(id *)(a1 + 32) activeSelection];
      [v6 clearSelection];

      [*(id *)(a1 + 32) setNeedsSelectionDisplayUpdate];
      WeakRetained = v7;
    }
  }
}

- (void)_define:(id)a3
{
  uint64_t v5 = [(UITextInteraction *)self _textInput];
  if (self->_lookupSession)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITextServicesInteraction.m" lineNumber:274 description:@"Shouldn't have a lookup session"];
  }
  uint64_t v6 = +[_UITextServiceSessionContext sessionContextForType:16 withTextInput:v5];
  id v7 = [(UITextInteraction *)self view];
  uint64_t v8 = [v7 _showServiceForType:16 withContext:v6];
  lookupSession = self->_lookupSession;
  self->_lookupSession = v8;

  v10 = self->_lookupSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__UITextServicesInteraction__define___block_invoke;
  v12[3] = &unk_1E530A908;
  v12[4] = self;
  [(_UITextServiceSession *)v10 setDismissedHandler:v12];
}

void __37__UITextServicesInteraction__define___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = 0;
}

- (void)_translate:(id)a3
{
  uint64_t v5 = [(UITextInteraction *)self _textInput];
  if (self->_translateSession)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITextServicesInteraction.m" lineNumber:286 description:@"Shouldn't have a translate session"];
  }
  uint64_t v6 = +[_UITextServiceSessionContext sessionContextForType:32 withTextInput:v5];
  id v7 = [(UITextInteraction *)self view];
  uint64_t v8 = [v7 _showServiceForType:32 withContext:v6];
  translateSession = self->_translateSession;
  self->_translateSession = v8;

  v10 = self->_translateSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__UITextServicesInteraction__translate___block_invoke;
  v12[3] = &unk_1E530A908;
  v12[4] = self;
  [(_UITextServiceSession *)v10 setDismissedHandler:v12];
}

void __40__UITextServicesInteraction__translate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 144);
  *(void *)(v1 + 144) = 0;
}

- (_UITextServicesResponderProxy)responderProxy
{
  return self->_responderProxy;
}

- (void)setResponderProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderProxy, 0);
  objc_storeStrong((id *)&self->_translateSession, 0);
  objc_storeStrong((id *)&self->_lookupSession, 0);
  objc_storeStrong((id *)&self->_shareSession, 0);
  objc_storeStrong((id *)&self->_learnSession, 0);
  objc_storeStrong((id *)&self->_definitionSession, 0);
}

@end