@interface TUICursorAccessoryAssertionController
- (NSHashTable)assertions;
- (TUICursorAccessoryAssertionControllerSubject)subject;
- (id)createAssertionWithType:(unint64_t)a3 accessory:(id)a4;
- (id)debugDescription;
- (void)beginTrackingAssertion:(id)a3;
- (void)dealloc;
- (void)endTrackingAssertion:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setSubject:(id)a3;
- (void)updateSubjectWithAssertionState;
@end

@implementation TUICursorAccessoryAssertionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_destroyWeak((id *)&self->_subject);
}

- (void)setAssertions:(id)a3
{
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setSubject:(id)a3
{
}

- (TUICursorAccessoryAssertionControllerSubject)subject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subject);
  return (TUICursorAccessoryAssertionControllerSubject *)WeakRetained;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TUICursorAccessoryAssertionController *)self assertions];
  v7 = [v6 allObjects];
  v8 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v7];

  return v8;
}

- (void)updateSubjectWithAssertionState
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = TUIAssertionLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[TUICursorAccessoryAssertionController updateSubjectWithAssertionState]";
    _os_log_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [(TUICursorAccessoryAssertionController *)self assertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        switch([v13 accessoryType])
        {
          case 1:
            uint64_t v14 = [v13 accessory];
            v15 = v7;
            v7 = (void *)v14;
            goto LABEL_13;
          case 2:
            uint64_t v17 = [v13 accessory];
            v15 = v10;
            v10 = (void *)v17;
            goto LABEL_13;
          case 4:
            uint64_t v16 = [v13 accessory];
            v15 = v8;
            v8 = (void *)v16;
            goto LABEL_13;
          case 8:
            uint64_t v18 = [v13 accessory];
            v15 = v9;
            v9 = (void *)v18;
LABEL_13:

            break;
          default:
            continue;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  v19 = [MEMORY[0x1E4F1CA48] array];
  v20 = v19;
  if (v9)
  {
    [v19 addObject:v9];
    if (!v8)
    {
LABEL_28:
      v25 = [(TUICursorAccessoryAssertionController *)self subject];
      [v25 setScrollAwayIndicatorEnabled:0];

      v22 = [(TUICursorAccessoryAssertionController *)self subject];
      v23 = v22;
      uint64_t v24 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    if (!v8)
    {
      if (v10) {
        [v19 addObject:v10];
      }
      if (v7) {
        [v20 addObject:v7];
      }
      goto LABEL_28;
    }
    [v19 addObject:v8];
  }
  v21 = [(TUICursorAccessoryAssertionController *)self subject];
  [v21 setScrollAwayIndicatorEnabled:1];

  v22 = [(TUICursorAccessoryAssertionController *)self subject];
  v23 = v22;
  uint64_t v24 = 1;
LABEL_29:
  [v22 setSelectedTextIndicatorEnabled:v24];

  v26 = [(TUICursorAccessoryAssertionController *)self subject];
  [v26 setAutoHideEnabled:v9 == 0];

  v27 = [(TUICursorAccessoryAssertionController *)self subject];
  [v27 setCursorAccessories:v20];
}

- (void)dealloc
{
  v3 = [(TUICursorAccessoryAssertionController *)self subject];

  if (v3)
  {
    v4 = [(TUICursorAccessoryAssertionController *)self assertions];
    [v4 removeAllObjects];

    [(TUICursorAccessoryAssertionController *)self updateSubjectWithAssertionState];
    [(TUICursorAccessoryAssertionController *)self setSubject:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)TUICursorAccessoryAssertionController;
  [(TUICursorAccessoryAssertionController *)&v5 dealloc];
}

- (void)endTrackingAssertion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accessoryType];
  uint64_t v6 = [(TUICursorAccessoryAssertionController *)self assertions];
  [v6 removeObject:v4];

  if (v5 == 4)
  {
    v7 = [(TUICursorAccessoryAssertionController *)self assertions];
    v8 = [v7 allObjects];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "accessoryType", (void)v16) == 4)
          {
            v15 = [(TUICursorAccessoryAssertionController *)self assertions];
            [v15 removeObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  [(TUICursorAccessoryAssertionController *)self updateSubjectWithAssertionState];
}

- (void)beginTrackingAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUICursorAccessoryAssertionController *)self assertions];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(TUICursorAccessoryAssertionController *)self setAssertions:v6];
  }
  v7 = [(TUICursorAccessoryAssertionController *)self assertions];
  [v7 addObject:v4];

  [(TUICursorAccessoryAssertionController *)self updateSubjectWithAssertionState];
}

- (id)createAssertionWithType:(unint64_t)a3 accessory:(id)a4
{
  id v6 = a4;
  v7 = [[TUICursorAccessoryAssertion alloc] initWithAccessoryType:a3 accessory:v6 controller:self];

  [(TUICursorAccessoryAssertionController *)self beginTrackingAssertion:v7];
  return v7;
}

@end