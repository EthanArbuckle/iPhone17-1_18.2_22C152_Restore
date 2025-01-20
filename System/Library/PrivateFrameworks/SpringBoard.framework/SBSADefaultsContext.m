@interface SBSADefaultsContext
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)alwaysRenderSystemApertureFillOnGPU;
- (BOOL)alwaysShowSystemApertureInSnapshots;
- (BOOL)alwaysShowSystemApertureOnClonedDisplays;
- (BOOL)enableSystemApertureStateCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)neverRenderSystemApertureFillOnGPU;
- (BOOL)suppressDynamicIslandCompletely;
- (SBSADefaultsContext)initWithDefaultsContext:(id)a3;
- (id)copyBySettingAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3;
- (id)copyBySettingAlwaysShowSystemApertureInSnapshots:(BOOL)a3;
- (id)copyBySettingAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3;
- (id)copyBySettingEnableSystemApertureStateCollection:(BOOL)a3;
- (id)copyBySettingNeverRenderSystemApertureFillOnGPU:(BOOL)a3;
- (id)copyBySettingSuppressDynamicIslandCompletely:(BOOL)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3;
- (void)_setAlwaysShowSystemApertureInSnapshots:(BOOL)a3;
- (void)_setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3;
- (void)_setEnableSystemApertureStateCollection:(BOOL)a3;
- (void)_setNeverRenderSystemApertureFillOnGPU:(BOOL)a3;
- (void)_setSuppressDynamicIslandCompletely:(BOOL)a3;
@end

@implementation SBSADefaultsContext

- (id)copyWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSADefaultsContext *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithDefaultsContext:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (SBSADefaultsContext)initWithDefaultsContext:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSADefaultsContext;
  v5 = [(SBSADefaultsContext *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_suppressDynamicIslandCompletely = v4[8];
    v5->_alwaysShowSystemApertureOnClonedDisplays = v4[9];
    v5->_alwaysShowSystemApertureInSnapshots = v4[10];
    v5->_alwaysRenderSystemApertureFillOnGPU = v4[11];
    v5->_neverRenderSystemApertureFillOnGPU = v4[12];
    v5->_enableSystemApertureStateCollection = v4[13];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithDefaultsContext:self];
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

uint64_t __77__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureOnClonedDisplays___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlwaysShowSystemApertureOnClonedDisplays:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __72__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureInSnapshots___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlwaysShowSystemApertureInSnapshots:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __72__SBSADefaultsContext_copyBySettingAlwaysRenderSystemApertureFillOnGPU___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlwaysRenderSystemApertureFillOnGPU:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __71__SBSADefaultsContext_copyBySettingNeverRenderSystemApertureFillOnGPU___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeverRenderSystemApertureFillOnGPU:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __68__SBSADefaultsContext_copyBySettingSuppressDynamicIslandCompletely___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSuppressDynamicIslandCompletely:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_setSuppressDynamicIslandCompletely:(BOOL)a3
{
  self->_suppressDynamicIslandCompletely = a3;
}

- (void)_setNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
  self->_neverRenderSystemApertureFillOnGPU = a3;
}

- (void)_setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
  self->_alwaysShowSystemApertureOnClonedDisplays = a3;
}

- (void)_setAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
  self->_alwaysShowSystemApertureInSnapshots = a3;
}

- (void)_setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
  self->_alwaysRenderSystemApertureFillOnGPU = a3;
}

- (BOOL)neverRenderSystemApertureFillOnGPU
{
  return self->_neverRenderSystemApertureFillOnGPU;
}

- (id)copyBySettingSuppressDynamicIslandCompletely:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBSADefaultsContext_copyBySettingSuppressDynamicIslandCompletely___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

- (id)copyBySettingNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__SBSADefaultsContext_copyBySettingNeverRenderSystemApertureFillOnGPU___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

- (id)copyBySettingAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureOnClonedDisplays___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

- (id)copyBySettingAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureInSnapshots___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

- (id)copyBySettingAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingAlwaysRenderSystemApertureFillOnGPU___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

- (BOOL)alwaysShowSystemApertureInSnapshots
{
  return self->_alwaysShowSystemApertureInSnapshots;
}

- (BOOL)alwaysRenderSystemApertureFillOnGPU
{
  return self->_alwaysRenderSystemApertureFillOnGPU;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL suppressDynamicIslandCompletely = self->_suppressDynamicIslandCompletely;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __31__SBSADefaultsContext_isEqual___block_invoke;
  v35[3] = &unk_1E6AF99E8;
  id v7 = v4;
  id v36 = v7;
  objc_super v8 = [v5 appendBool:suppressDynamicIslandCompletely counterpart:v35];
  BOOL alwaysShowSystemApertureOnClonedDisplays = self->_alwaysShowSystemApertureOnClonedDisplays;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __31__SBSADefaultsContext_isEqual___block_invoke_2;
  v33[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v34 = v10;
  v11 = [v8 appendBool:alwaysShowSystemApertureOnClonedDisplays counterpart:v33];
  BOOL alwaysShowSystemApertureInSnapshots = self->_alwaysShowSystemApertureInSnapshots;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __31__SBSADefaultsContext_isEqual___block_invoke_3;
  v31[3] = &unk_1E6AF99E8;
  id v13 = v10;
  id v32 = v13;
  v14 = [v11 appendBool:alwaysShowSystemApertureInSnapshots counterpart:v31];
  BOOL alwaysRenderSystemApertureFillOnGPU = self->_alwaysRenderSystemApertureFillOnGPU;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __31__SBSADefaultsContext_isEqual___block_invoke_4;
  v29[3] = &unk_1E6AF99E8;
  id v16 = v13;
  id v30 = v16;
  v17 = [v14 appendBool:alwaysRenderSystemApertureFillOnGPU counterpart:v29];
  BOOL neverRenderSystemApertureFillOnGPU = self->_neverRenderSystemApertureFillOnGPU;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __31__SBSADefaultsContext_isEqual___block_invoke_5;
  v27[3] = &unk_1E6AF99E8;
  id v19 = v16;
  id v28 = v19;
  v20 = [v17 appendBool:neverRenderSystemApertureFillOnGPU counterpart:v27];
  BOOL enableSystemApertureStateCollection = self->_enableSystemApertureStateCollection;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __31__SBSADefaultsContext_isEqual___block_invoke_6;
  v25[3] = &unk_1E6AF99E8;
  id v26 = v19;
  id v22 = v19;
  v23 = [v20 appendBool:enableSystemApertureStateCollection counterpart:v25];
  LOBYTE(v19) = [v23 isEqual];

  return (char)v19;
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressDynamicIslandCompletely];
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) alwaysShowSystemApertureOnClonedDisplays];
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) alwaysShowSystemApertureInSnapshots];
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) alwaysRenderSystemApertureFillOnGPU];
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) neverRenderSystemApertureFillOnGPU];
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableSystemApertureStateCollection];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendBool:self->_suppressDynamicIslandCompletely];
  BOOL v5 = [v4 appendBool:self->_alwaysShowSystemApertureOnClonedDisplays];
  v6 = [v5 appendBool:self->_alwaysShowSystemApertureInSnapshots];
  id v7 = [v6 appendBool:self->_alwaysRenderSystemApertureFillOnGPU];
  objc_super v8 = [v7 appendBool:self->_neverRenderSystemApertureFillOnGPU];
  v9 = [v8 appendBool:self->_enableSystemApertureStateCollection];
  unint64_t v10 = [v9 hash];

  return v10;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (id)copyBySettingEnableSystemApertureStateCollection:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingEnableSystemApertureStateCollection___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a3;
  return [(SBSADefaultsContext *)self copyWithBlock:v4];
}

uint64_t __72__SBSADefaultsContext_copyBySettingEnableSystemApertureStateCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnableSystemApertureStateCollection:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)suppressDynamicIslandCompletely
{
  return self->_suppressDynamicIslandCompletely;
}

- (BOOL)alwaysShowSystemApertureOnClonedDisplays
{
  return self->_alwaysShowSystemApertureOnClonedDisplays;
}

- (BOOL)enableSystemApertureStateCollection
{
  return self->_enableSystemApertureStateCollection;
}

- (void)_setEnableSystemApertureStateCollection:(BOOL)a3
{
  self->_BOOL enableSystemApertureStateCollection = a3;
}

@end