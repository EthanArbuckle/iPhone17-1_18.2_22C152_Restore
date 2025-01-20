@interface SBHardwareButtonGestureParametersProviderBase
- (NSMapTable)observers;
- (NSString)description;
- (SBHardwareButtonGestureParameters)hardwareButtonGestureParameters;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addHardwareButtonGestureParametersObserver:(id)a3;
- (void)publishUpdatedParameters:(id)a3;
- (void)removeHardwareButtonGestureParametersObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation SBHardwareButtonGestureParametersProviderBase

- (NSString)description
{
  return (NSString *)[(SBHardwareButtonGestureParametersProviderBase *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHardwareButtonGestureParametersProviderBase *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHardwareButtonGestureParametersProviderBase *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHardwareButtonGestureParametersProviderBase *)self succinctDescriptionBuilder];
  v5 = [(SBHardwareButtonGestureParametersProviderBase *)self hardwareButtonGestureParameters];
  id v6 = (id)[v4 appendObject:v5 withName:@"hardwareButtonGestureParameters"];

  return v4;
}

- (void)addHardwareButtonGestureParametersObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSMapTable *)observers setObject:MEMORY[0x1E4F1CC38] forKey:v4];
}

- (void)removeHardwareButtonGestureParametersObserver:(id)a3
{
}

- (void)publishUpdatedParameters:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "provider:didUpdateButtonGestureParameters:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

- (SBHardwareButtonGestureParameters)hardwareButtonGestureParameters
{
  return 0;
}

@end