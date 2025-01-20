@interface _UIFeedbackGeneratorConfiguration
+ (BOOL)_enableHIDFeedbackForAllGenerators;
+ (id)_configurationWithKey:(id)a3 preparationBlock:(id)a4;
+ (id)_configurationWithKey:(id)a3 requiredSupportLevel:(int64_t)a4 preparationBlock:(id)a5;
+ (id)_disabledConfiguration;
+ (id)defaultConfiguration;
- (BOOL)_setupIfNecessary;
- (BOOL)_shouldEnable;
- (BOOL)defaultEnabled;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSetup;
- (BOOL)settingsEnabled;
- (Class)clientClass;
- (NSArray)feedbackKeyPaths;
- (NSArray)hidFeedbackPatternNameKeyPaths;
- (NSSet)usedFeedbacks;
- (NSString)_stats_key;
- (NSString)descriptionKey;
- (NSString)usage;
- (_UIFeedbackGeneratorConfiguration)init;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)_updateFeedbackForOutputMode:(id)a3;
- (id)_updateFeedbacksForOutputMode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)preparationBlock;
- (id)tweakedConfigurationForCaller:(id)a3 usage:(id)a4;
- (int64_t)activationStyle;
- (int64_t)outputMode;
- (int64_t)requiredPeripheralSupportLevel;
- (int64_t)requiredSupportLevel;
- (void)_updateEnabled;
- (void)dealloc;
- (void)setActivationStyle:(int64_t)a3;
- (void)setClientClass:(Class)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOutputMode:(int64_t)a3;
- (void)setPreparationBlock:(id)a3;
- (void)setRequiredPeripheralSupportLevel:(int64_t)a3;
- (void)setRequiredSupportLevel:(int64_t)a3;
- (void)setSettingsEnabled:(BOOL)a3;
- (void)setSetup:(BOOL)a3;
- (void)setUsage:(id)a3;
- (void)set_stats_key:(id)a3;
@end

@implementation _UIFeedbackGeneratorConfiguration

- (BOOL)_setupIfNecessary
{
  BOOL v3 = [(_UIFeedbackGeneratorConfiguration *)self isSetup];
  if (!v3)
  {
    [(_UIFeedbackGeneratorConfiguration *)self setSetup:1];
    if ([(_UIFeedbackGeneratorConfiguration *)self requiredSupportLevel] == -1)
    {
      BOOL v6 = 0;
    }
    else
    {
      v4 = +[UIDevice currentDevice];
      uint64_t v5 = [v4 _feedbackSupportLevel];
      BOOL v6 = v5 >= [(_UIFeedbackGeneratorConfiguration *)self requiredSupportLevel];
    }
    if ([(_UIFeedbackGeneratorConfiguration *)self requiredPeripheralSupportLevel] == -1) {
      int v7 = [(id)objc_opt_class() _enableHIDFeedbackForAllGenerators] ^ 1;
    }
    else {
      int v7 = 0;
    }
    if (((v6 | v7) & 1) == 0)
    {
      v8 = +[UIDevice currentDevice];
      uint64_t v9 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v8);
      BOOL v6 = v9 >= [(_UIFeedbackGeneratorConfiguration *)self requiredPeripheralSupportLevel];
    }
    if ((_UIFeedbackEngineSupportsAll() & 1) != 0 || v6)
    {
      preparationBlock = (void (**)(id, _UIFeedbackGeneratorConfiguration *))self->_preparationBlock;
      if (preparationBlock) {
        preparationBlock[2](preparationBlock, self);
      }
      else {
        [(_UIFeedbackGeneratorConfiguration *)self setSettingsEnabled:0];
      }
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v12 = +[_UIFeedbackPreferences sharedPreferences];
      [v11 addObserver:self selector:sel__preferencesUpdated_ name:0x1ED11D580 object:v12];
    }
    else
    {
      [(_UIFeedbackGeneratorConfiguration *)self setSettingsEnabled:0];
    }
    [(_UIFeedbackGeneratorConfiguration *)self _updateEnabled];
  }
  return !v3;
}

+ (id)_configurationWithKey:(id)a3 requiredSupportLevel:(int64_t)a4 preparationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setActivationStyle:2];
  objc_msgSend(v10, "set_stats_key:", v9);

  [v10 setPreparationBlock:v8];
  [v10 setSettingsEnabled:1];
  [v10 setRequiredSupportLevel:a4];
  return v10;
}

- (void)setActivationStyle:(int64_t)a3
{
  self->_activationStyle = a3;
}

- (void)setSettingsEnabled:(BOOL)a3
{
  if (self->_settingsEnabled != a3)
  {
    self->_settingsEnabled = a3;
    if ([(_UIFeedbackGeneratorConfiguration *)self isSetup])
    {
      [(_UIFeedbackGeneratorConfiguration *)self _updateEnabled];
    }
  }
}

- (void)setOutputMode:(int64_t)a3
{
  if (self->_outputMode != a3)
  {
    self->_outputMode = a3;
    if ([(_UIFeedbackGeneratorConfiguration *)self isSetup])
    {
      [(_UIFeedbackGeneratorConfiguration *)self _updateEnabled];
    }
  }
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setPreparationBlock:(id)a3
{
}

- (_UIFeedbackGeneratorConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 init];
  BOOL v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(_UIFeedbackGeneratorConfiguration *)v2 set_stats_key:v4];

  [(_UIFeedbackGeneratorConfiguration *)v2 setOutputMode:1];
  [(_UIFeedbackGeneratorConfiguration *)v2 setRequiredSupportLevel:0];
  [(_UIFeedbackGeneratorConfiguration *)v2 setRequiredPeripheralSupportLevel:-1];
  return v2;
}

- (void)set_stats_key:(id)a3
{
}

- (void)setRequiredSupportLevel:(int64_t)a3
{
  self->_requiredSupportLevel = a3;
}

- (void)setRequiredPeripheralSupportLevel:(int64_t)a3
{
  self->_requiredPeripheralSupportLevel = a3;
}

+ (id)_configurationWithKey:(id)a3 preparationBlock:(id)a4
{
  return (id)[a1 _configurationWithKey:a3 requiredSupportLevel:0 preparationBlock:a4];
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (int64_t)requiredSupportLevel
{
  return self->_requiredSupportLevel;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return self->_requiredPeripheralSupportLevel;
}

+ (BOOL)_enableHIDFeedbackForAllGenerators
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v5 = _UIInternalPreference_EnableHIDFeedbackForAllGenerators,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableHIDFeedbackForAllGenerators))
  {
    BOOL v3 = 0;
  }
  else
  {
    do
    {
      BOOL v3 = v2 < v5;
      if (v2 < v5) {
        break;
      }
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_EnableHIDFeedbackForAllGenerators, @"EnableHIDFeedbackForAllGenerators", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v5 = _UIInternalPreference_EnableHIDFeedbackForAllGenerators;
    }
    while (v2 != _UIInternalPreference_EnableHIDFeedbackForAllGenerators);
  }
  return byte_1E8FD5124 && v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)_updateEnabled
{
  BOOL v3 = [(_UIFeedbackGeneratorConfiguration *)self _shouldEnable];
  [(_UIFeedbackGeneratorConfiguration *)self setEnabled:v3];
}

- (BOOL)_shouldEnable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(_UIFeedbackGeneratorConfiguration *)self outputMode];
  if (!v3) {
    goto LABEL_16;
  }
  int v4 = v3;
  BOOL v5 = [(_UIFeedbackGeneratorConfiguration *)self settingsEnabled];
  LOBYTE(v6) = v5;
  if ((~v4 & 3) == 0 || !v5) {
    return v6;
  }
  if ([(_UIFeedbackGeneratorConfiguration *)self defaultEnabled])
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (![(_UIFeedbackGeneratorConfiguration *)self isSetup])
  {
LABEL_16:
    LOBYTE(v6) = 0;
    return v6;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v7 = [(_UIFeedbackGeneratorConfiguration *)self usedFeedbacks];
  uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v11 = [v10 hapticOutputMode];
        if ((~([v10 audioOutputMode] | v11) & 3) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v6;
}

- (int64_t)outputMode
{
  return self->_outputMode;
}

- (BOOL)settingsEnabled
{
  return self->_settingsEnabled;
}

- (BOOL)defaultEnabled
{
  int v2 = +[_UIFeedbackPreferences sharedPreferences];
  BOOL v3 = [v2 enabledFeedbackTypesForCategory:0] != 0;

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)_stats_key
{
  return self->__stats_key;
}

- (id)tweakedConfigurationForCaller:(id)a3 usage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UIFeedbackGeneratorConfiguration *)self tweakedConfigurationForClass:objc_opt_class() usage:v5];

  return v6;
}

- (void)dealloc
{
  if (self->_setup)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v4 = +[_UIFeedbackPreferences sharedPreferences];
    [v3 removeObserver:self name:0x1ED11D580 object:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIFeedbackGeneratorConfiguration;
  [(_UIFeedbackGeneratorConfiguration *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stats_key, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong(&self->_preparationBlock, 0);
  objc_storeStrong((id *)&self->_usedFeedbacks, 0);
}

- (id)_updateFeedbackForOutputMode:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIFeedbackGeneratorConfiguration *)self outputMode];
  if (v5 == 1)
  {
    id v6 = v4;
  }
  else
  {
    int64_t v7 = v5;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__79;
    v21 = __Block_byref_object_dispose__79;
    id v22 = v4;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v10 = __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke;
    int v11 = &unk_1E52ECEC0;
    long long v13 = v15;
    int64_t v14 = v7;
    v12 = &v17;
    __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke(v9, 1);
    v10(v9, 2);
    id v6 = (id)v18[5];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);
  }
  return v6;
}

- (NSSet)usedFeedbacks
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  usedFeedbacks = self->_usedFeedbacks;
  if (!usedFeedbacks)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int64_t v5 = [(_UIFeedbackGeneratorConfiguration *)self feedbackKeyPaths];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      id v9 = off_1E52D5000;
      unint64_t v10 = 0x1E4F1C000uLL;
      unint64_t v11 = 0x1E4F1C000uLL;
      v21 = v5;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v13 = [(_UIFeedbackGeneratorConfiguration *)self valueForKeyPath:*(void *)(*((void *)&v22 + 1) + 8 * v12)];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v4 addObject:v13];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v4 addObjectsFromArray:v13];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v13 allValues];
                  int64_t v14 = v9;
                  unint64_t v15 = v10;
                  v17 = unint64_t v16 = v11;
                  [v4 addObjectsFromArray:v17];

                  unint64_t v11 = v16;
                  unint64_t v10 = v15;
                  id v9 = v14;
                  int64_t v5 = v21;
                }
              }
            }
          }

          ++v12;
        }
        while (v7 != v12);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    uint64_t v18 = [(_UIFeedbackGeneratorConfiguration *)self _updateFeedbacksForOutputMode:v4];
    uint64_t v19 = self->_usedFeedbacks;
    self->_usedFeedbacks = v18;

    usedFeedbacks = self->_usedFeedbacks;
  }
  return usedFeedbacks;
}

- (id)_updateFeedbacksForOutputMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIFeedbackGeneratorConfiguration *)self outputMode] == 1)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = -[_UIFeedbackGeneratorConfiguration _updateFeedbackForOutputMode:](self, "_updateFeedbackForOutputMode:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (NSArray)feedbackKeyPaths
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int64_t)activationStyle
{
  return self->_activationStyle;
}

+ (id)defaultConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [self->_preparationBlock copy];
  id v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  objc_storeStrong((id *)v4 + 4, self->_clientClass);
  uint64_t v7 = [(NSString *)self->_usage copy];
  uint64_t v8 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v7;

  *((unsigned char *)v4 + 8) = self->_settingsEnabled;
  *((void *)v4 + 8) = self->_activationStyle;
  *((void *)v4 + 6) = self->_requiredSupportLevel;
  *((void *)v4 + 7) = self->_requiredPeripheralSupportLevel;
  *((void *)v4 + 9) = self->_outputMode;
  uint64_t v9 = [(NSString *)self->__stats_key copy];
  unint64_t v10 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v9;

  if ([(_UIFeedbackGeneratorConfiguration *)self isSetup])
  {
    *((unsigned char *)v4 + 9) = 1;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    unint64_t v11 = [(_UIFeedbackGeneratorConfiguration *)self feedbackKeyPaths];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v17 = [(_UIFeedbackGeneratorConfiguration *)self valueForKeyPath:v16];
          if (v17) {
            [v4 setValue:v17 forKeyPath:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [(_UIFeedbackGeneratorConfiguration *)self hidFeedbackPatternNameKeyPaths];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * j);
          long long v24 = [(_UIFeedbackGeneratorConfiguration *)self valueForKeyPath:v23];
          if (v24) {
            [v4 setValue:v24 forKeyPath:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = [(_UIFeedbackGeneratorConfiguration *)self feedbackKeyPaths];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v12 = [(_UIFeedbackGeneratorConfiguration *)self valueForKeyPath:v11];
          uint64_t v13 = [v5 valueForKeyPath:v11];
          id v14 = v12;
          id v15 = v13;
          if (v14 == v15)
          {
          }
          else
          {
            uint64_t v16 = v15;
            if (v14) {
              BOOL v17 = v15 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17)
            {
LABEL_34:

LABEL_35:
              BOOL v29 = 0;
              goto LABEL_36;
            }
            char v18 = [v14 isEqual:v15];

            if ((v18 & 1) == 0) {
              goto LABEL_35;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = [(_UIFeedbackGeneratorConfiguration *)self hidFeedbackPatternNameKeyPaths];
    uint64_t v19 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v6);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          long long v24 = [(_UIFeedbackGeneratorConfiguration *)self valueForKeyPath:v23];
          long long v25 = [v5 valueForKeyPath:v23];
          id v14 = v24;
          id v26 = v25;
          if (v14 == v26)
          {
          }
          else
          {
            uint64_t v16 = v26;
            if (v14) {
              BOOL v27 = v26 == 0;
            }
            else {
              BOOL v27 = 1;
            }
            if (v27) {
              goto LABEL_34;
            }
            char v28 = [v14 isEqual:v26];

            if ((v28 & 1) == 0) {
              goto LABEL_35;
            }
          }
        }
        uint64_t v20 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
        BOOL v29 = 1;
      }
      while (v20);
    }
    else
    {
      BOOL v29 = 1;
    }
LABEL_36:
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSStringFromSelector(sel_isEnabled);
  uint64_t v9 = v3;
  id v4 = NSStringFromSelector(sel_activationStyle);
  unint64_t v10 = v4;
  id v5 = NSStringFromSelector(sel_requiredSupportLevel);
  uint64_t v11 = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  uint64_t v7 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);

  return v7;
}

- (NSString)descriptionKey
{
  if (self->_clientClass && [(NSString *)self->_usage length])
  {
    BOOL v3 = NSString;
    id v4 = NSStringFromClass(self->_clientClass);
    id v5 = [v3 stringWithFormat:@"%@.%@", v4, self->_usage];
  }
  else
  {
    id v6 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v6);
  }
  return (NSString *)v5;
}

- (NSArray)hidFeedbackPatternNameKeyPaths
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v7 = a3;
  if ([(id)objc_opt_class() _enableHIDFeedbackForAllGenerators]
    && (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v8 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:0x1ED11BE80 deviceType:a4 senderID:a5];
  }
  else
  {
    id v8 = v7;
  }
  uint64_t v9 = v8;

  return v9;
}

+ (id)_disabledConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setSettingsEnabled:0];
  return v2;
}

- (id)preparationBlock
{
  return self->_preparationBlock;
}

- (Class)clientClass
{
  return self->_clientClass;
}

- (void)setClientClass:(Class)a3
{
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
}

@end