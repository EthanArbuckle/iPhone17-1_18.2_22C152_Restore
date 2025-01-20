@interface SBPIPCompoundAssertion
- (NSString)identifier;
- (SBPIPCompoundAssertion)initWithIdentifier:(id)a3 reason:(int64_t)a4;
- (int64_t)reason;
- (void)addAssertionForController:(id)a3 windowScene:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeAssertionForController:(id)a3;
@end

@implementation SBPIPCompoundAssertion

- (SBPIPCompoundAssertion)initWithIdentifier:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPIPCompoundAssertion;
  v7 = [(SBPIPCompoundAssertion *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_reason = a4;
  }

  return v7;
}

- (void)dealloc
{
  v4 = [(NSMapTable *)self->_controllerToStashAssertionMap objectEnumerator];
  v5 = [v4 nextObject];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBPIPCompoundAssertion.m" lineNumber:26 description:@"Deallocated with outstanding assertions"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPCompoundAssertion;
  [(SBPIPCompoundAssertion *)&v7 dealloc];
}

- (void)addAssertionForController:(id)a3 windowScene:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_controllerToStashAssertionMap)
  {
    objc_super v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    controllerToStashAssertionMap = self->_controllerToStashAssertionMap;
    self->_controllerToStashAssertionMap = v7;
  }
  v9 = [v10 acquireStashAssertionForWindowScene:v6 withReason:self->_reason identifier:self->_identifier];
  [(NSMapTable *)self->_controllerToStashAssertionMap setObject:v9 forKey:v10];
}

- (void)removeAssertionForController:(id)a3
{
  controllerToStashAssertionMap = self->_controllerToStashAssertionMap;
  id v6 = a3;
  id v9 = [(NSMapTable *)controllerToStashAssertionMap objectForKey:v6];
  [(NSMapTable *)self->_controllerToStashAssertionMap removeObjectForKey:v6];

  objc_super v7 = v9;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBPIPCompoundAssertion.m" lineNumber:42 description:@"Removing an assertion for a controller which was never registered"];

    objc_super v7 = 0;
  }
  [v7 invalidate];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMapTable *)self->_controllerToStashAssertionMap objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_controllerToStashAssertionMap removeAllObjects];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_controllerToStashAssertionMap, 0);
}

@end