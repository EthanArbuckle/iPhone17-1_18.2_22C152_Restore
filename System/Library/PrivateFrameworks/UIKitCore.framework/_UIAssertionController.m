@interface _UIAssertionController
- (BOOL)hasAssertionsForReason:(id)a3;
- (BOOL)hasAssertionsOfType:(unint64_t)a3;
- (_UIAssertionController)initWithAssertionSubject:(id)a3;
- (_UIAssertionControllerSubject)subject;
- (id)debugDescription;
- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4;
- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5;
- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6;
- (void)_beginTrackingAssertion:(id)a3;
- (void)_endTrackingAssertion:(id)a3;
- (void)_enforceSubjectAwarenessOfAssertionState:(BOOL)a3 forAssertionType:(unint64_t)a4;
@end

@implementation _UIAssertionController

- (_UIAssertionController)initWithAssertionSubject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIAssertionController;
  v5 = [(_UIAssertionController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_subject, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeAssertionRecords = v6->_activeAssertionRecords;
    v6->_activeAssertionRecords = v7;
  }
  return v6;
}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  activeAssertionRecords = self->_activeAssertionRecords;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)activeAssertionRecords objectForKey:v4];

  LOBYTE(v4) = [v5 activeAssertionCount] > 0;
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subject);
  objc_storeStrong((id *)&self->_activeAssertionRecords, 0);
}

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4
{
  return [(_UIAssertionController *)self vendAssertionOfType:a3 initialState:a4 reason:0];
}

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5
{
  return [(_UIAssertionController *)self vendAssertionOfType:a3 initialState:a4 reason:a5 requiresExplicitInvalidation:1];
}

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = [[_UIAssertionBase alloc] _initWithType:a3 initialState:v7 reason:v10 requiresExplicitInvalidation:v6];

  [v11 setParentController:self];
  [(_UIAssertionController *)self _beginTrackingAssertion:v11];
  return v11;
}

- (BOOL)hasAssertionsForReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_activeAssertionRecords;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = [(NSMutableDictionary *)v5 objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) reason];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_enforceSubjectAwarenessOfAssertionState:(BOOL)a3 forAssertionType:(unint64_t)a4
{
  BOOL v5 = a3;
  p_subject = &self->_subject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subject);
  int v8 = [WeakRetained assertionActivationStateForType:a4];

  if (v8 != v5)
  {
    id v9 = objc_loadWeakRetained((id *)p_subject);
    [v9 assertionActivationStateChangedToState:v5 forType:a4];
  }
}

- (void)_beginTrackingAssertion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  activeAssertionRecords = self->_activeAssertionRecords;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  int v8 = [(NSMutableDictionary *)activeAssertionRecords objectForKey:v7];

  if (v8)
  {
    int v9 = [v8 initialState];
    if (v9 != [v5 initialState])
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"_UIAssertionController.m" lineNumber:153 description:@"Assertion controller contains existing assertion with a different initial state. This is not allowed."];
    }
    objc_msgSend(v8, "setActiveAssertionCount:", objc_msgSend(v8, "activeAssertionCount") + 1);
    id v10 = _SharedAssertionLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 134218240;
      uint64_t v17 = [v8 type];
      __int16 v18 = 2048;
      uint64_t v19 = [v8 activeAssertionCount];
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_INFO, "Incrementing existing assertion record of type %lu. New active count: %ld", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    char v11 = _SharedAssertionLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      uint64_t v17 = [v5 type];
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_INFO, "Started tracking new assertion of type: %lu", (uint8_t *)&v16, 0xCu);
    }

    id v10 = objc_opt_new();
    [v10 setActiveAssertionCount:1];
    -[NSObject setInitialState:](v10, "setInitialState:", [v5 initialState]);
    -[NSObject setType:](v10, "setType:", [v5 type]);
    v12 = [v5 reason];
    [v10 setReason:v12];

    long long v13 = self->_activeAssertionRecords;
    long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    [(NSMutableDictionary *)v13 setObject:v10 forKey:v14];
  }
  -[_UIAssertionController _enforceSubjectAwarenessOfAssertionState:forAssertionType:](self, "_enforceSubjectAwarenessOfAssertionState:forAssertionType:", [v5 initialState], objc_msgSend(v5, "type"));
}

- (void)_endTrackingAssertion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  activeAssertionRecords = self->_activeAssertionRecords;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  int v8 = [(NSMutableDictionary *)activeAssertionRecords objectForKey:v7];

  if (!v8)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIAssertionController.m" lineNumber:180 description:@"Releasing an assertion that this controller is not aware of."];
  }
  if ([v8 activeAssertionCount] <= 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIAssertionController.m" lineNumber:183 description:@"Active assertion count reached below zero."];
  }
  objc_msgSend(v8, "setActiveAssertionCount:", objc_msgSend(v8, "activeAssertionCount") - 1);
  int v9 = _SharedAssertionLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    uint64_t v17 = [v8 type];
    __int16 v18 = 2048;
    uint64_t v19 = [v8 activeAssertionCount];
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "Decrementing assertion of type %lu. New active count: %ld", (uint8_t *)&v16, 0x16u);
  }

  if (![v8 activeAssertionCount])
  {
    id v10 = _SharedAssertionLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v8 type];
      int v16 = 134217984;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_INFO, "Releasing assertion of type %lu", (uint8_t *)&v16, 0xCu);
    }

    -[_UIAssertionController _enforceSubjectAwarenessOfAssertionState:forAssertionType:](self, "_enforceSubjectAwarenessOfAssertionState:forAssertionType:", [v8 initialState] ^ 1, objc_msgSend(v5, "type"));
    v12 = self->_activeAssertionRecords;
    long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];
  }
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(NSMutableDictionary *)self->_activeAssertionRecords allValues];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (_UIAssertionControllerSubject)subject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subject);
  return (_UIAssertionControllerSubject *)WeakRetained;
}

@end