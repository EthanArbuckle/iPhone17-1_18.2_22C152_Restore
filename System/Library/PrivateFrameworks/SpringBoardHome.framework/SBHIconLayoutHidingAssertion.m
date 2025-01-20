@interface SBHIconLayoutHidingAssertion
- (BOOL)isInvalidated;
- (BOOL)referencesIcon:(id)a3;
- (BOOL)referencesIconInListModel:(id)a3;
- (NSArray)icons;
- (NSString)description;
- (NSString)reason;
- (SBHIconLayoutHidingAssertion)initWithDelegate:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6;
- (SBHIconLayoutHidingAssertionDelegate)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)folderMutationOptions;
- (unint64_t)listMutationOptions;
- (unint64_t)options;
- (void)addIcon:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation SBHIconLayoutHidingAssertion

- (SBHIconLayoutHidingAssertion)initWithDelegate:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBHIconLayoutHidingAssertion;
  v13 = [(SBHIconLayoutHidingAssertion *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v11 mutableCopy];
    icons = v13->_icons;
    v13->_icons = (NSMutableSet *)v14;

    objc_storeWeak((id *)&v13->_delegate, v10);
    uint64_t v16 = [v12 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    v13->_options = a6;
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_FAULT, "SBHIconLayoutHidingAssertion deallocated but not invalidated! Reason: %@", (uint8_t *)&v3, 0xCu);
}

- (NSArray)icons
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_icons copy];
  return (NSArray *)v2;
}

- (BOOL)referencesIcon:(id)a3
{
  return [(NSMutableSet *)self->_icons containsObject:a3];
}

- (BOOL)referencesIconInListModel:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBHIconLayoutHidingAssertion_referencesIconInListModel___block_invoke;
  v4[3] = &unk_1E6AAF238;
  v4[4] = self;
  return [a3 directlyContainsIconPassingTest:v4];
}

uint64_t __58__SBHIconLayoutHidingAssertion_referencesIconInListModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) containsObject:a2];
}

- (void)addIcon:(id)a3
{
  [(NSMutableSet *)self->_icons addObject:a3];
  id v4 = [(SBHIconLayoutHidingAssertion *)self delegate];
  [v4 layoutHidingAssertionDidChange:self];
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    id v4 = [(SBHIconLayoutHidingAssertion *)self delegate];
    [v4 layoutHidingAssertionDidChange:self];
  }
}

- (unint64_t)listMutationOptions
{
  return ([(SBHIconLayoutHidingAssertion *)self options] << 19) & 0x200000;
}

- (unint64_t)folderMutationOptions
{
  unint64_t v2 = [(SBHIconLayoutHidingAssertion *)self options];
  return (v2 << 22) & 0x1000000 | (((v2 >> 4) & 1) << 20) & 0xFFFFFFFFFBFFFFFFLL | (((v2 >> 5) & 1) << 26);
}

- (NSString)description
{
  return (NSString *)[(SBHIconLayoutHidingAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)invalidate
{
  if (![(SBHIconLayoutHidingAssertion *)self isInvalidated])
  {
    id v3 = [(SBHIconLayoutHidingAssertion *)self delegate];
    [v3 layoutHidingAssertionDidInvalidate:self];
    [(SBHIconLayoutHidingAssertion *)self setInvalidated:1];
  }
}

- (id)succinctDescription
{
  unint64_t v2 = [(SBHIconLayoutHidingAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHIconLayoutHidingAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconLayoutHidingAssertion *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBHIconLayoutHidingAssertion *)self icons];
  id v6 = (id)[v4 appendObject:v5 withName:@"icons"];

  v7 = [(SBHIconLayoutHidingAssertion *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  v9 = [(SBHIconLayoutHidingAssertion *)self delegate];
  id v10 = (id)[v4 appendPointer:v9 withName:@"delegate"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBHIconLayoutHidingAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconLayoutHidingAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end