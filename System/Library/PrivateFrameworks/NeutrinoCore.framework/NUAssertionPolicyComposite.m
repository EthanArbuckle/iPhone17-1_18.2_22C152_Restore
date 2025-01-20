@interface NUAssertionPolicyComposite
- (NSArray)policies;
- (NUAssertionPolicyComposite)init;
- (void)addPolicy:(id)a3;
- (void)notifyAssertion:(id)a3;
@end

@implementation NUAssertionPolicyComposite

- (void).cxx_destruct
{
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)notifyAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NUAssertionPolicyComposite *)self policies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) notifyAssertion:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addPolicy:(id)a3
{
}

- (NUAssertionPolicyComposite)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUAssertionPolicyComposite;
  v2 = [(NUAssertionPolicyComposite *)&v6 init];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  policies = v2->_policies;
  v2->_policies = v3;

  return v2;
}

@end