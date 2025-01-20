@interface SBKeyboardFocusPolicy
+ (SBKeyboardFocusPolicy)new;
+ (id)build:(id)a3;
- (BOOL)cameraIsHosted;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSuppressRemoteDeferring;
- (BSAuditHistory)auditHistory;
- (NSString)debugDescription;
- (NSString)description;
- (SBKeyboardFocusPolicy)init;
- (SBKeyboardFocusTarget)keyboardFocusTarget;
- (SBWindowScene)sbWindowSceneAncestor;
- (id)_initWithCopyOf:(id *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)advicePolicy;
- (unint64_t)hash;
- (void)_init;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBKeyboardFocusPolicy

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

void __51__SBKeyboardFocusPolicy_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"keyboardFocusTarget"];
  v3 = *(void **)(a1 + 32);
  v4 = NSStringFromSBKeyboardFocusAdviceAcceptancePolicy(*(void *)(*(void *)(a1 + 40) + 16));
  [v3 appendString:v4 withName:@"selectionPolicy"];

  id v5 = (id)[*(id *)(a1 + 32) appendInteger:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) withName:@"shouldSuppressRemoteDeferring"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 25) withName:@"cameraIsHosted" ifEqualTo:1];
  if ([*(id *)(a1 + 32) hasDebugStyle])
  {
    id v8 = [*(id *)(*(void *)(a1 + 40) + 32) items];
    if ([v8 count]) {
      id v7 = (id)[*(id *)(a1 + 32) appendObject:v8 withName:@"auditHistory"];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowSceneAncestor);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_keyboardFocusTarget, 0);
}

- (BSAuditHistory)auditHistory
{
  return self->_auditHistory;
}

- (void)_init
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:sel__init object:v1 file:@"SBKeyboardFocusPolicy.m" lineNumber:59 description:@"_SBKeyboardFocusPolicy cannot be subclassed"];
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)SBKeyboardFocusPolicy;
    v1 = objc_msgSendSuper2(&v8, sel_init);
    if (v1)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F4F698]);
      id v5 = (void *)v1[4];
      v1[4] = v4;
    }
  }
  return v1;
}

- (id)_initWithCopyOf:(id *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = (id *)-[SBKeyboardFocusPolicy _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      a1[2] = v3[2];
      *((unsigned char *)a1 + 24) = *((unsigned char *)v3 + 24);
      *((unsigned char *)a1 + 25) = *((unsigned char *)v3 + 25);
      objc_storeStrong(a1 + 4, v3[4]);
      id WeakRetained = objc_loadWeakRetained(v3 + 5);
      objc_storeWeak(a1 + 5, WeakRetained);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)v4;
    if (BSEqualObjects()
      && v5[2] == self->_selectionPolicy
      && *((unsigned __int8 *)v5 + 24) == self->_shouldSuppressRemoteDeferring
      && *((unsigned __int8 *)v5 + 25) == self->_cameraIsHosted)
    {
      id WeakRetained = objc_loadWeakRetained(v5 + 5);
      id v7 = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBKeyboardFocusPolicy_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendBodySectionWithName:0 block:v6];
}

- (SBWindowScene)sbWindowSceneAncestor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
  return (SBWindowScene *)WeakRetained;
}

- (SBKeyboardFocusTarget)keyboardFocusTarget
{
  return self->_keyboardFocusTarget;
}

- (int64_t)advicePolicy
{
  return self->_selectionPolicy;
}

+ (id)build:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = -[SBKeyboardFocusPolicy _init]([SBMutableKeyboardFocusPolicy alloc]);
  v3[2](v3, v4);

  id v5 = (void *)[v4 copy];
  return v5;
}

- (SBKeyboardFocusPolicy)init
{
  uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[SBKeyboardFocusPolicy init]"];
  [v3 handleFailureInFunction:v4 file:@"SBKeyboardFocusPolicy.m" lineNumber:48 description:@"cannot directly allocate _SBKeyboardFocusPolicy"];

  return 0;
}

+ (SBKeyboardFocusPolicy)new
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"+[SBKeyboardFocusPolicy new]"];
  [v2 handleFailureInFunction:v3 file:@"SBKeyboardFocusPolicy.m" lineNumber:53 description:@"cannot directly allocate _SBKeyboardFocusPolicy"];

  return 0;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SBKeyboardFocusTarget *)self->_keyboardFocusTarget hash];
  id v4 = [NSNumber numberWithInteger:self->_selectionPolicy];
  uint64_t v5 = [v4 hash] ^ v3;

  id v6 = [NSNumber numberWithBool:self->_shouldSuppressRemoteDeferring];
  uint64_t v7 = [v6 hash];

  char v8 = [NSNumber numberWithBool:self->_cameraIsHosted];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
  unint64_t v11 = v9 ^ [WeakRetained hash];

  unint64_t v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  return v12 ^ (v12 >> 31);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBMutableKeyboardFocusPolicy alloc];
  return -[SBKeyboardFocusPolicy _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (NSString)debugDescription
{
  unint64_t v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (BOOL)shouldSuppressRemoteDeferring
{
  return self->_shouldSuppressRemoteDeferring;
}

- (BOOL)cameraIsHosted
{
  return self->_cameraIsHosted;
}

@end