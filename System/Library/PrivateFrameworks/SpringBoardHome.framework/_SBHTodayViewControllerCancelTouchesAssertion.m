@interface _SBHTodayViewControllerCancelTouchesAssertion
- (NSArray)assertions;
- (_SBHTodayViewControllerCancelTouchesAssertion)init;
- (_SBHTodayViewControllerCancelTouchesAssertion)initWithAssertions:(id)a3;
- (void)invalidate;
@end

@implementation _SBHTodayViewControllerCancelTouchesAssertion

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_SBHTodayViewControllerCancelTouchesAssertion *)self assertions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (_SBHTodayViewControllerCancelTouchesAssertion)initWithAssertions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBHTodayViewControllerCancelTouchesAssertion;
  uint64_t v5 = [(_SBHTodayViewControllerCancelTouchesAssertion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assertions = v5->_assertions;
    v5->_assertions = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (_SBHTodayViewControllerCancelTouchesAssertion)init
{
  return [(_SBHTodayViewControllerCancelTouchesAssertion *)self initWithAssertions:MEMORY[0x1E4F1CBF0]];
}

@end