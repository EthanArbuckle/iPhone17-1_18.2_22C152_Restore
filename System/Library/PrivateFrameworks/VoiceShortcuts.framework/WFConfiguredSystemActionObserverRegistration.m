@interface WFConfiguredSystemActionObserverRegistration
- (NSHashTable)observers;
- (NSString)actionType;
- (NSString)userDefaultsKey;
- (NSUserDefaults)userDefaults;
- (WFConfiguredSystemActionObserverRegistration)initWithUserDefaults:(id)a3 userDefaultsKey:(id)a4 actionType:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionType:(id)a3;
- (void)setObservers:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserDefaultsKey:(id)a3;
@end

@implementation WFConfiguredSystemActionObserverRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userDefaultsKey, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setUserDefaultsKey:(id)a3
{
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setActionType:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)dealloc
{
  v3 = [(WFConfiguredSystemActionObserverRegistration *)self userDefaults];
  v4 = [(WFConfiguredSystemActionObserverRegistration *)self userDefaultsKey];
  [v3 removeObserver:self forKeyPath:v4 context:0];

  v5.receiver = self;
  v5.super_class = (Class)WFConfiguredSystemActionObserverRegistration;
  [(WFConfiguredSystemActionObserverRegistration *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  v25 = v7;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  if (v10)
  {
    v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
  }
  else
  {
    v14 = 0;
  }
  v24 = v10;
  if (v13)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, 0, v10, v7);
  }
  else
  {
    v15 = 0;
  }
  v16 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[WFConfiguredSystemActionObserverRegistration observeValueForKeyPath:ofObject:change:context:]";
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2112;
    v36 = v15;
    _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_INFO, "%s Configured system action changed from: %@ to %@.", buf, 0x20u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v17 = [(WFConfiguredSystemActionObserverRegistration *)self observers];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v23 = [(WFConfiguredSystemActionObserverRegistration *)self actionType];
        [v22 configuredSystemActionChangedForType:v23 oldAction:v14 newAction:v15];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }
}

- (WFConfiguredSystemActionObserverRegistration)initWithUserDefaults:(id)a3 userDefaultsKey:(id)a4 actionType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFConfiguredSystemActionObserverRegistration;
  v12 = [(WFConfiguredSystemActionObserverRegistration *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionType, a5);
    objc_storeStrong((id *)&v13->_userDefaults, a3);
    objc_storeStrong((id *)&v13->_userDefaultsKey, a4);
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    [v9 addObserver:v13 forKeyPath:v10 options:3 context:0];
    v16 = v13;
  }

  return v13;
}

@end