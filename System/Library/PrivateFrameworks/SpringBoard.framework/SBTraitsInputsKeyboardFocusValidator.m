@interface SBTraitsInputsKeyboardFocusValidator
- (UIKBArbiterClientFocusContext)focusContext;
- (id)description;
- (id)validateInputs:(id)a3 withContext:(id)a4;
- (void)setFocusContext:(id)a3;
@end

@implementation SBTraitsInputsKeyboardFocusValidator

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsInputsKeyboardFocusValidator;
  v4 = [(SBTraitsInputsValidator *)&v9 description];
  v5 = [v3 stringWithString:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusContext);
  v7 = [WeakRetained sceneIdentity];
  [v5 appendFormat:@", focused scene identity: %@, contextID: %ul", v7, objc_msgSend(WeakRetained, "contextID")];

  return v5;
}

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBTraitsInputsKeyboardFocusValidator;
  v7 = [(SBTraitsInputsValidator *)&v28 validateInputs:a3 withContext:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusContext);
  if (WeakRetained)
  {
    objc_super v9 = [v6 acquiredParticipants];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke;
    v26[3] = &unk_1E6B02E18;
    id v10 = WeakRetained;
    id v27 = v10;
    v11 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v26);

    if (v11)
    {
    }
    else
    {
      v12 = [v6 acquiredParticipants];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke_2;
      v24[3] = &unk_1E6B02E18;
      id v25 = v10;
      v11 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v24);

      if (!v11) {
        goto LABEL_6;
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4FAFF90]);
    v14 = [v7 interfaceIdiomInputs];
    v15 = [v7 userInterfaceStyleInputs];
    [v7 deviceOrientationInputs];
    v16 = id v23 = v6;
    id v17 = objc_alloc(MEMORY[0x1E4FAFFA0]);
    v18 = [v11 uniqueIdentifier];
    v19 = (void *)[v17 initWithKeyboardFocusedParticipantUniqueIdentifier:v18];
    v20 = [v7 ambientPresentationInputs];
    uint64_t v21 = [v13 initWithInterfaceIdiomInputs:v14 userInterfaceStyleInputs:v15 deviceOrientationInputs:v16 keyboardInputs:v19 ambientPresentationInputs:v20];

    id v6 = v23;
    v7 = (void *)v21;
  }
LABEL_6:

  return v7;
}

uint64_t __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 participantAssociatedSceneIdentityTokens:v3];
    id v6 = [*(id *)(a1 + 32) sceneIdentity];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend(v4, "participantAssociatedWindows:", v3, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) _contextId];
          if (v10 == [*(id *)(a1 + 32) contextID])
          {
            uint64_t v11 = 1;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (UIKBArbiterClientFocusContext)focusContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusContext);
  return (UIKBArbiterClientFocusContext *)WeakRetained;
}

- (void)setFocusContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end