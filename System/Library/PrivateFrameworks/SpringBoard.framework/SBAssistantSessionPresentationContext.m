@interface SBAssistantSessionPresentationContext
- (BOOL)allowsHDRContentBelow;
- (BOOL)isAnyAssistantPresentablePresented;
- (BOOL)isAssistantAccessoryPresented;
- (BOOL)isAssistantPresented;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyboardVisible;
- (SiriPresentationOptions)siriPresentationOptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)modality;
- (unint64_t)hash;
- (void)setAllowsHDRContentBelow:(BOOL)a3;
- (void)setAssistantAccessoryPresented:(BOOL)a3;
- (void)setAssistantPresented:(BOOL)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setSiriPresentationOptions:(id)a3;
@end

@implementation SBAssistantSessionPresentationContext

- (BOOL)isAnyAssistantPresentablePresented
{
  if ([(SBAssistantSessionPresentationContext *)self isAssistantPresented]) {
    return 1;
  }
  return [(SBAssistantSessionPresentationContext *)self isAssistantAccessoryPresented];
}

- (int64_t)modality
{
  int64_t result = (int64_t)self->_siriPresentationOptions;
  if (result)
  {
    uint64_t v3 = [(id)result inputType];
    if ((unint64_t)(v3 - 1) > 2) {
      return 0;
    }
    else {
      return qword_1D8FD2C38[v3 - 1];
    }
  }
  return result;
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[SBMutableAssistantSessionPresentationContext allocWithZone:a3] init];
  [(SBAssistantSessionPresentationContext *)v4 setAssistantPresented:[(SBAssistantSessionPresentationContext *)self isAssistantPresented]];
  v5 = [(SBAssistantSessionPresentationContext *)self siriPresentationOptions];
  [(SBAssistantSessionPresentationContext *)v4 setSiriPresentationOptions:v5];

  [(SBAssistantSessionPresentationContext *)v4 setKeyboardVisible:[(SBAssistantSessionPresentationContext *)self isKeyboardVisible]];
  [(SBAssistantSessionPresentationContext *)v4 setAllowsHDRContentBelow:[(SBAssistantSessionPresentationContext *)self allowsHDRContentBelow]];
  [(SBAssistantSessionPresentationContext *)v4 setAssistantAccessoryPresented:[(SBAssistantSessionPresentationContext *)self isAssistantAccessoryPresented]];
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_assistantPresented];
  id v5 = (id)[v3 appendObject:self->_siriPresentationOptions];
  id v6 = (id)[v3 appendBool:self->_keyboardVisible];
  id v7 = (id)[v3 appendBool:self->_allowsHDRContentBelow];
  id v8 = (id)[v3 appendBool:self->_assistantAccessoryPresented];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBAssistantSessionPresentationContext *)a3;
  if (v4 == self)
  {
    char v20 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    BOOL assistantPresented = self->_assistantPresented;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke;
    v30[3] = &unk_1E6AF99E8;
    id v7 = v4;
    v31 = v7;
    id v8 = (id)[v5 appendBool:assistantPresented counterpart:v30];
    siriPresentationOptions = self->_siriPresentationOptions;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_2;
    v28[3] = &unk_1E6AF9E90;
    v10 = v7;
    v29 = v10;
    id v11 = (id)[v5 appendObject:siriPresentationOptions counterpart:v28];
    BOOL keyboardVisible = self->_keyboardVisible;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_3;
    v26[3] = &unk_1E6AF99E8;
    v13 = v10;
    v27 = v13;
    id v14 = (id)[v5 appendBool:keyboardVisible counterpart:v26];
    BOOL allowsHDRContentBelow = self->_allowsHDRContentBelow;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_4;
    v24[3] = &unk_1E6AF99E8;
    v16 = v13;
    v25 = v16;
    id v17 = (id)[v5 appendBool:allowsHDRContentBelow counterpart:v24];
    BOOL assistantAccessoryPresented = self->_assistantAccessoryPresented;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_5;
    v22[3] = &unk_1E6AF99E8;
    v23 = v16;
    id v19 = (id)[v5 appendBool:assistantAccessoryPresented counterpart:v22];
    char v20 = [v5 isEqual];
  }
  return v20;
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAssistantPresented];
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriPresentationOptions];
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isKeyboardVisible];
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowsHDRContentBelow];
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAssistantAccessoryPresented];
}

- (BOOL)isAssistantPresented
{
  return self->_assistantPresented;
}

- (void)setAssistantPresented:(BOOL)a3
{
  self->_BOOL assistantPresented = a3;
}

- (SiriPresentationOptions)siriPresentationOptions
{
  return self->_siriPresentationOptions;
}

- (void)setSiriPresentationOptions:(id)a3
{
}

- (void)setKeyboardVisible:(BOOL)a3
{
  self->_BOOL keyboardVisible = a3;
}

- (BOOL)allowsHDRContentBelow
{
  return self->_allowsHDRContentBelow;
}

- (void)setAllowsHDRContentBelow:(BOOL)a3
{
  self->_BOOL allowsHDRContentBelow = a3;
}

- (BOOL)isAssistantAccessoryPresented
{
  return self->_assistantAccessoryPresented;
}

- (void)setAssistantAccessoryPresented:(BOOL)a3
{
  self->_BOOL assistantAccessoryPresented = a3;
}

- (void).cxx_destruct
{
}

@end