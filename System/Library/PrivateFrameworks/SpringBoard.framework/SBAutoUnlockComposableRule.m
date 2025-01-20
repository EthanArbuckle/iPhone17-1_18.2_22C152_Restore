@interface SBAutoUnlockComposableRule
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (SBAutoUnlockComposableRule)init;
- (void)addAutoUnlockRule:(id)a3;
- (void)removeAutoUnlockRule:(id)a3;
@end

@implementation SBAutoUnlockComposableRule

- (SBAutoUnlockComposableRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBAutoUnlockComposableRule;
  v2 = [(SBAutoUnlockComposableRule *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    rules = v2->_rules;
    v2->_rules = v3;
  }
  return v2;
}

- (void)addAutoUnlockRule:(id)a3
{
}

- (void)removeAutoUnlockRule:(id)a3
{
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  rules = self->_rules;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBAutoUnlockComposableRule_shouldAutoUnlockForSource___block_invoke;
  v6[3] = &unk_1E6B00A38;
  int v7 = a3;
  v6[4] = &v8;
  [(NSMutableSet *)rules enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __56__SBAutoUnlockComposableRule_shouldAutoUnlockForSource___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 shouldAutoUnlockForSource:*(unsigned int *)(a1 + 40)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end