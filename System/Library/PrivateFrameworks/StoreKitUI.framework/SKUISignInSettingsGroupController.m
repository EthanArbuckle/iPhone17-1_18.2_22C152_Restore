@interface SKUISignInSettingsGroupController
- (BOOL)isAuthenticating;
- (id)_keyForSettingDescription:(id)a3;
- (id)_settingDescriptionForKey:(id)a3;
- (id)_submitSettingDescription;
- (id)valueForSettingDescription:(id)a3;
- (void)_attemptSignInWithAccountName:(id)a3 password:(id)a4;
- (void)_becomeFirstResponderWithKey:(id)a3;
- (void)_resignFirstResponder;
- (void)_signInFailed:(id)a3 error:(id)a4;
- (void)_signInSuccess:(id)a3;
- (void)_updateFieldsAuthenticating:(BOOL)a3;
- (void)_updateValidation;
- (void)isAuthenticating;
- (void)returnInSettingDescription:(id)a3;
- (void)setValue:(id)a3 forSettingDescription:(id)a4;
- (void)submitSettingDescription:(id)a3;
@end

@implementation SKUISignInSettingsGroupController

- (BOOL)isAuthenticating
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUISignInSettingsGroupController *)v3 isAuthenticating];
      }
    }
  }
  return self->_authenticating;
}

- (void)returnInSettingDescription:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISignInSettingsGroupController returnInSettingDescription:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [(SKUISignInSettingsGroupController *)self _keyForSettingDescription:v4];
  if ([v13 isEqualToString:@"accountName"])
  {
    [(SKUISignInSettingsGroupController *)self _becomeFirstResponderWithKey:@"password"];
  }
  else
  {
    [(SKUISignInSettingsGroupController *)self _resignFirstResponder];
    if (self->_valid) {
      [(SKUISignInSettingsGroupController *)self _attemptSignInWithAccountName:self->_accountName password:self->_password];
    }
  }
}

- (void)setValue:(id)a3 forSettingDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUISignInSettingsGroupController setValue:forSettingDescription:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [(SKUISignInSettingsGroupController *)self _keyForSettingDescription:v7];
  if (v16) {
    [(SKUISignInSettingsGroupController *)self setValue:v6 forKey:v16];
  }
  [(SKUISignInSettingsGroupController *)self _updateValidation];
}

- (void)submitSettingDescription:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISignInSettingsGroupController submitSettingDescription:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUISignInSettingsGroupController *)self _resignFirstResponder];
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v13 = v4;
    uint64_t v14 = v13;
    if (self->_valid && [v13 fieldType] == 1) {
      [(SKUISignInSettingsGroupController *)self _attemptSignInWithAccountName:self->_accountName password:self->_password];
    }
  }
}

- (id)valueForSettingDescription:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISignInSettingsGroupController valueForSettingDescription:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUISignInSettingsGroupController *)self _keyForSettingDescription:v4];
  if (v13)
  {
    uint64_t v14 = [(SKUISignInSettingsGroupController *)self valueForKey:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_attemptSignInWithAccountName:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SKUISignInSettingsGroupController *)self _updateFieldsAuthenticating:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F100]);
  [v9 setServiceType:2];
  [v9 setUsername:v6];
  [v9 _setPassword:v7];
  [v9 setIsUsernameEditable:0];
  [v9 setShouldAllowAppleIDCreation:0];
  uint64_t v10 = [(SKUISettingsGroupController *)self delegate];
  uint64_t v11 = [v10 owningViewControllerForSettingsGroupController:self];
  [v9 setPresentingViewController:v11];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke;
  v13[3] = &unk_1E6424FC0;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v14 = v12;
  [v8 authenticateWithContext:v9 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_5;
    v7[3] = &unk_1E6423FF8;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_2;
    block[3] = &unk_1E6424298;
    id v12 = v5;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v13 = *(id *)(a1 + 32);
    dispatch_sync(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v14);
  }
}

void __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_2(id *a1)
{
  v2 = [MEMORY[0x1E4FA8260] contextForSignIn];
  BOOL v3 = [a1[4] objectForKey:*MEMORY[0x1E4F4EE10]];
  [v2 setAccountName:v3];

  id v4 = [a1[4] objectForKey:*MEMORY[0x1E4F4EDE8]];
  [v2 setInitialPassword:v4];

  id v5 = [a1[4] objectForKey:*MEMORY[0x1E4F4ED98]];
  [v2 setAltDSID:v5];

  [v2 setAllowsRetry:0];
  [v2 setCanSetActiveAccount:1];
  [v2 setPromptStyle:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_3;
  v7[3] = &unk_1E6424F98;
  objc_copyWeak(&v9, a1 + 6);
  id v8 = a1[5];
  [v6 startWithAuthenticateResponseBlock:v7];

  objc_destroyWeak(&v9);
}

void __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_4;
  v9[3] = &unk_1E6424F70;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(void *)(a1 + 32))
  {
    if (!v2) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v2)
  {
LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _signInFailed:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [*(id *)(a1 + 32) authenticatedAccount];
  [WeakRetained _signInSuccess:v4];

LABEL_6:
LABEL_7:
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  [v5 _updateFieldsAuthenticating:0];
}

void __76__SKUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _signInFailed:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _updateFieldsAuthenticating:0];
}

- (void)_updateFieldsAuthenticating:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_authenticating != a3)
  {
    BOOL v3 = a3;
    self->_authenticating = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(SKUISettingsGroupController *)self settingDescriptions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      BOOL v9 = !v3;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = [(SKUISettingsGroupController *)self _viewForSettingDescription:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 setEnabled:v9];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_becomeFirstResponderWithKey:(id)a3
{
  id v5 = [(SKUISignInSettingsGroupController *)self _settingDescriptionForKey:a3];
  id v4 = -[SKUISettingsGroupController _viewForSettingDescription:](self, "_viewForSettingDescription:");
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    [v4 beginEdits];
  }
}

- (id)_keyForSettingDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_keyMapping objectForKey:v4];
  if (!v5)
  {
    if (!self->_keyMapping)
    {
      uint64_t v6 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      keyMapping = self->_keyMapping;
      self->_keyMapping = v6;
    }
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      id v8 = v4;
      uint64_t v9 = [v8 fieldType];
      if (v9)
      {
        if (v9 == 1)
        {
          id v5 = @"valid";
LABEL_13:

          [(NSMapTable *)self->_keyMapping setObject:v5 forKey:v8];
          goto LABEL_17;
        }
      }
      else
      {
        id v10 = [v8 viewElement];
        id v11 = [v10 textInputViewElement];
        long long v12 = v11;
        if (v11)
        {
          if ([v11 isSecure]) {
            id v5 = @"password";
          }
          else {
            id v5 = @"accountName";
          }

          goto LABEL_13;
        }
      }
    }
    id v5 = 0;
  }
LABEL_17:

  return v5;
}

- (void)_resignFirstResponder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(SKUISettingsGroupController *)self settingDescriptions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(SKUISettingsGroupController *)self _viewForSettingDescription:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if ([v8 isMemberOfClass:objc_opt_class()]) {
          [v8 commitEdits];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_settingDescriptionForKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  keyMapping = self->_keyMapping;
  if (keyMapping)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [(NSMapTable *)keyMapping keyEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        long long v12 = [(NSMapTable *)self->_keyMapping objectForKey:v11];
        if ([v4 isEqualToString:v12]) {
          break;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v11;

      if (v13) {
        goto LABEL_23;
      }
    }
    else
    {
LABEL_10:
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [(SKUISettingsGroupController *)self settingDescriptions];
  id v13 = (id)[v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v14);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v18 = [(SKUISignInSettingsGroupController *)self _keyForSettingDescription:0];
        if ([v4 isEqualToString:v18])
        {
          id v13 = v17;

          goto LABEL_22;
        }
      }
      id v13 = (id)[v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_22:

LABEL_23:

  return v13;
}

- (void)_signInFailed:(id)a3 error:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [(SKUISettingsGroupController *)self delegate];
  uint64_t v8 = [v7 owningViewControllerForSettingsGroupController:self];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    uint64_t v10 = [v9 clientContext];
    long long v11 = v10;
    long long v12 = (void *)MEMORY[0x1E4FB1418];
    if (v10) {
      [v10 localizedStringForKey:@"CANNOT_LOGIN_TITLE"];
    }
    else {
    id v13 = +[SKUIClientContext localizedStringForKey:@"CANNOT_LOGIN_TITLE" inBundles:0];
    }
    uint64_t v14 = [v6 localizedDescription];
    uint64_t v15 = [v12 alertControllerWithTitle:v13 message:v14 preferredStyle:1];

    v16 = (void *)MEMORY[0x1E4FB1410];
    if (v11) {
      [v11 localizedStringForKey:@"OK"];
    }
    else {
    uint64_t v17 = +[SKUIClientContext localizedStringForKey:@"OK" inBundles:0];
    }
    v18 = [v16 actionWithTitle:v17 style:0 handler:0];
    [v15 addAction:v18];

    [v9 presentViewController:v15 animated:1 completion:0];
  }
  v19 = [(SKUISettingsGroupController *)self settingsGroupDescription];
  if (v19)
  {
    long long v20 = [v6 description];
    long long v21 = [v19 viewElement];
    long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"failed", @"result", v23, @"accountName", v20, @"reason", 0);
    [v21 dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v22 completionBlock:0];
  }
}

- (void)_signInSuccess:(id)a3
{
  id v10 = a3;
  id v4 = [(SKUISettingsGroupController *)self settingsGroupDescription];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 viewElement];
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v8 = [v10 accountName];
    id v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"success", @"result", v8, @"accountName", 0);

    [v6 dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v9 completionBlock:0];
  }
}

- (id)_submitSettingDescription
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(SKUISettingsGroupController *)self settingDescriptions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isMemberOfClass:objc_opt_class()])
        {
          id v8 = v7;
          if ([v8 fieldType] == 1) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (void)_updateValidation
{
  if ([(NSString *)self->_accountName length]) {
    BOOL v3 = [(NSString *)self->_password length] != 0;
  }
  else {
    BOOL v3 = 0;
  }
  self->_valid = v3;
  id v4 = [(SKUISignInSettingsGroupController *)self _submitSettingDescription];
  [(SKUISettingsGroupController *)self _reloadSettingDescription:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_keyMapping, 0);

  objc_storeStrong((id *)&self->_accountName, 0);
}

- (void)isAuthenticating
{
}

- (void)returnInSettingDescription:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setValue:(uint64_t)a3 forSettingDescription:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)submitSettingDescription:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)valueForSettingDescription:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end