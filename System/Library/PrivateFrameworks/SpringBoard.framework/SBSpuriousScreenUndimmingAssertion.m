@interface SBSpuriousScreenUndimmingAssertion
+ (BOOL)isAnyActive;
+ (id)debugDescription;
+ (void)_accessListWithBlock:(id)a3;
- (SBSpuriousScreenUndimmingAssertion)initWithIdentifier:(id)a3;
- (id)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBSpuriousScreenUndimmingAssertion

+ (void)_accessListWithBlock:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_accessListWithBlock__onceToken != -1) {
      dispatch_once(&_accessListWithBlock__onceToken, &__block_literal_global_376);
    }
    v4 = _accessListWithBlock__queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke_2;
    block[3] = &unk_1E6AF5300;
    id v6 = v3;
    dispatch_sync(v4, block);
  }
}

void __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke()
{
  uint64_t v0 = BSDispatchQueueCreateWithQualityOfService();
  v1 = (void *)_accessListWithBlock__queue;
  _accessListWithBlock__queue = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:258 valueOptions:0x10000 capacity:2];
  id v3 = (void *)_accessListWithBlock__weakPointerToIdentifierMap;
  _accessListWithBlock__weakPointerToIdentifierMap = v2;
}

uint64_t __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isAnyActive
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBSpuriousScreenUndimmingAssertion_isAnyActive__block_invoke;
  v4[3] = &unk_1E6B0C9F0;
  v4[4] = &v5;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__SBSpuriousScreenUndimmingAssertion_isAnyActive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

+ (id)debugDescription
{
  char v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  char v8 = __54__SBSpuriousScreenUndimmingAssertion_debugDescription__block_invoke;
  v9 = &unk_1E6B0CA18;
  id v10 = v2;
  id v3 = v2;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:&v6];
  v4 = [NSString stringWithFormat:@"[%@]", v3, v6, v7, v8, v9];

  return v4;
}

void __54__SBSpuriousScreenUndimmingAssertion_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [v3 objectForKey:v8];
        if ([*(id *)(a1 + 32) length]) {
          [*(id *)(a1 + 32) appendString:@", "];
        }
        [*(id *)(a1 + 32) appendFormat:@"<%p:%@>", v8, v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (SBSpuriousScreenUndimmingAssertion)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSpuriousScreenUndimmingAssertion;
  uint64_t v5 = [(SBSpuriousScreenUndimmingAssertion *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBSpuriousScreenUndimmingAssertion_initWithIdentifier___block_invoke;
    v9[3] = &unk_1E6B0CA18;
    long long v10 = v5;
    +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:v9];
  }
  return v5;
}

void __57__SBSpuriousScreenUndimmingAssertion_initWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 8);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Adding spurious screen undimming assertion <%p:%{public}@>", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v3, "setObject:forKey:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (void)dealloc
{
  [(SBSpuriousScreenUndimmingAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSpuriousScreenUndimmingAssertion;
  [(SBSpuriousScreenUndimmingAssertion *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, self->_identifier];

  return v6;
}

- (void)invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SBSpuriousScreenUndimmingAssertion_invalidate__block_invoke;
  v2[3] = &unk_1E6B0CA18;
  v2[4] = self;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:v2];
}

void __48__SBSpuriousScreenUndimmingAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 8);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Removing spurious screen undimming assertion <%p:%{public}@>", (uint8_t *)&v7, 0x16u);
  }

  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end