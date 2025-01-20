@interface SBHCompoundAssertion
- (NSString)description;
- (NSString)reason;
- (SBHCompoundAssertion)init;
- (SBHCompoundAssertion)initWithReason:(id)a3;
- (SBHCompoundAssertion)initWithReason:(id)a3 assertions:(id)a4;
- (void)addAssertion:(id)a3;
- (void)addAssertions:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)invalidate;
@end

@implementation SBHCompoundAssertion

- (SBHCompoundAssertion)initWithReason:(id)a3
{
  return [(SBHCompoundAssertion *)self initWithReason:a3 assertions:MEMORY[0x1E4F1CBF0]];
}

- (SBHCompoundAssertion)initWithReason:(id)a3 assertions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHCompoundAssertion;
  v8 = [(SBHCompoundAssertion *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    uint64_t v11 = [v7 mutableCopy];
    assertions = v8->_assertions;
    v8->_assertions = (NSMutableArray *)v11;
  }
  return v8;
}

- (SBHCompoundAssertion)init
{
  return [(SBHCompoundAssertion *)self initWithReason:&stru_1F2FA0300 assertions:MEMORY[0x1E4F1CBF0]];
}

- (void)addAssertion:(id)a3
{
}

- (void)addAssertions:(id)a3
{
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __35__SBHCompoundAssertion_description__block_invoke;
  v10 = &unk_1E6AACA90;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __35__SBHCompoundAssertion_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_assertions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBHCompoundAssertion *)self reason];
  [v6 appendString:v4 withName:@"reason"];

  id v5 = (id)[v6 appendObject:self->_assertions withName:@"assertions"];
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end