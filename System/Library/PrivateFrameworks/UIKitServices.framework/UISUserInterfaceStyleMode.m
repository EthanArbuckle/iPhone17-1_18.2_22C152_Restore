@interface UISUserInterfaceStyleMode
- ($0AC6E346AE4835514AAA8AC86D8F4844)override;
- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)customSchedule;
- (NSString)debugDescription;
- (UISUserInterfaceStyleMode)initWithDelegate:(id)a3;
- (id)_commonAnalyticsEventDictionary;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)modeValue;
- (int64_t)suggestedAutomaticModeValue;
- (void)_setOverride:(id)a3 force:(BOOL)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCustomSchedule:(id *)a3;
- (void)setModeValue:(int64_t)a3;
- (void)setOverride:(id)a3;
@end

@implementation UISUserInterfaceStyleMode

- (UISUserInterfaceStyleMode)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UISUserInterfaceStyleMode;
  v5 = [(UISUserInterfaceStyleMode *)&v12 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_delegate, v4);

    if (v4)
    {
      v8 = _UISUserInterfaceStyleModeUserDefaults();
      [v8 addObserver:v6 forKeyPath:@"UserInterfaceStyleMode" options:1 context:0];

      v9 = _UISUserInterfaceStyleModeUserDefaults();
      [v9 addObserver:v6 forKeyPath:@"Override" options:1 context:0];

      v10 = _UISUserInterfaceStyleModeUserDefaults();
      [v10 addObserver:v6 forKeyPath:@"CustomSchedule" options:1 context:0];

      v6->_observingDefaults = 1;
    }
  }

  return v6;
}

- (void)dealloc
{
  if (self->_observingDefaults)
  {
    v3 = _UISUserInterfaceStyleModeUserDefaults();
    [v3 removeObserver:self forKeyPath:@"UserInterfaceStyleMode"];

    id v4 = _UISUserInterfaceStyleModeUserDefaults();
    [v4 removeObserver:self forKeyPath:@"Override"];

    v5 = _UISUserInterfaceStyleModeUserDefaults();
    [v5 removeObserver:self forKeyPath:@"CustomSchedule"];
  }
  v6.receiver = self;
  v6.super_class = (Class)UISUserInterfaceStyleMode;
  [(UISUserInterfaceStyleMode *)&v6 dealloc];
}

- (int64_t)modeValue
{
  v2 = _UISUserInterfaceStyleModeUserDefaults();
  int64_t v3 = [v2 integerForKey:@"UserInterfaceStyleMode"];

  if ((unint64_t)(v3 - 1) >= 2 && v3 != 102 && v3 != 100) {
    return 1;
  }
  return v3;
}

- (void)setModeValue:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = _UISUserInterfaceStyleModeServiceLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [MEMORY[0x1E4F62878] processHandle];
    *(_DWORD *)buf = 138543618;
    objc_super v12 = v6;
    __int16 v13 = 2050;
    int64_t v14 = a3;
    _os_log_impl(&dword_191ABF000, v5, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" is requesting to change the mode to %{public}ld", buf, 0x16u);
  }
  if ((unint64_t)(a3 - 1) < 2 || a3 == 100 || a3 == 102)
  {
    if ([(UISUserInterfaceStyleMode *)self modeValue] != a3)
    {
      id v7 = _UISUserInterfaceStyleModeUserDefaults();
      [v7 setInteger:a3 forKey:@"UserInterfaceStyleMode"];

      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0x64)
      {
        v8 = _UISUserInterfaceStyleModeUserDefaults();
        [v8 setInteger:a3 forKey:@"MostRecentAutomaticMode"];
      }
      -[UISUserInterfaceStyleMode _setOverride:force:](self, "_setOverride:force:", 0, 0, 1);
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    v9 = _UISUserInterfaceStyleModeServiceLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [MEMORY[0x1E4F62878] processHandle];
      *(_DWORD *)buf = 138543618;
      objc_super v12 = v10;
      __int16 v13 = 2050;
      int64_t v14 = a3;
      _os_log_error_impl(&dword_191ABF000, v9, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" provided an invalid mode %{public}ld, ignoring", buf, 0x16u);
    }
  }
}

id __42__UISUserInterfaceStyleMode_setModeValue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _commonAnalyticsEventDictionary];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"currentMode"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"previousMode"];

  return v2;
}

- (int64_t)suggestedAutomaticModeValue
{
  v2 = _UISUserInterfaceStyleModeUserDefaults();
  int64_t v3 = [v2 integerForKey:@"MostRecentAutomaticMode"];

  if ((unint64_t)(v3 - 1) >= 2 && v3 != 102 && v3 != 100) {
    return 100;
  }
  return v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)override
{
  int64_t v3 = _UISUserInterfaceStyleModeUserDefaults();
  id v4 = [v3 dictionaryForKey:@"Override"];

  if (v4)
  {
    v5 = [v4 objectForKey:@"Style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = [v5 integerValue];
    }
    else {
      unint64_t v6 = -1;
    }
    v8 = [v4 objectForKey:@"Timing"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = [v8 integerValue];
    }
    else {
      unint64_t v7 = -1;
    }
  }
  else
  {
    unint64_t v7 = -1;
    unint64_t v6 = -1;
  }
  if (([(UISUserInterfaceStyleMode *)self modeValue] & 0xFFFFFFFFFFFFFFFDLL) != 0x64
    || v6 > 2
    || v7 > 2
    || (v7 == 0) == (v6 != 0))
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
  }

  int64_t v9 = v6;
  int64_t v10 = v7;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setOverride:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = _UISUserInterfaceStyleModeServiceLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [MEMORY[0x1E4F62878] processHandle];
    int v8 = 138543874;
    int64_t v9 = v7;
    __int16 v10 = 2050;
    int64_t v11 = var0;
    __int16 v12 = 2050;
    int64_t v13 = var1;
    _os_log_impl(&dword_191ABF000, v6, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" set override: %{public}ld %{public}ld", (uint8_t *)&v8, 0x20u);
  }
  -[UISUserInterfaceStyleMode _setOverride:force:](self, "_setOverride:force:", var0, var1, 0);
}

- (void)_setOverride:(id)a3 force:(BOOL)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3.var0 <= 2uLL && a3.var1 <= 2uLL && (a3.var0 != 0) != (a3.var1 == 0))
  {
    if (a4) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UISUserInterfaceStyleMode.m", 317, @"Invalid parameter not satisfying: %@", @"overrideIsValid(newOverride)" object file lineNumber description];

    if (a4) {
      goto LABEL_6;
    }
  }
  if (([(UISUserInterfaceStyleMode *)self modeValue] & 0xFFFFFFFFFFFFFFFDLL) != 0x64) {
    return;
  }
LABEL_6:
  if (var0 | var1)
  {
    v15[0] = @"Style";
    __int16 v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:var0];
    v15[1] = @"Timing";
    v16[0] = v10;
    int64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:var1];
    v16[1] = v11;
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    int64_t v13 = _UISUserInterfaceStyleModeUserDefaults();
    [v13 setObject:v12 forKey:@"Override"];

    if (a4) {
      return;
    }
  }
  else
  {
    int64_t v9 = _UISUserInterfaceStyleModeUserDefaults();
    [v9 removeObjectForKey:@"Override"];

    if (a4) {
      return;
    }
  }
  AnalyticsSendEventLazy();
}

id __48__UISUserInterfaceStyleMode__setOverride_force___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _commonAnalyticsEventDictionary];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"overrideStyle"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"overrideTiming"];

  return v2;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)customSchedule
{
  id v4 = _UISUserInterfaceStyleModeUserDefaults();
  id v18 = [v4 dictionaryForKey:@"CustomSchedule"];

  if (!v18) {
    goto LABEL_27;
  }
  v5 = [v18 objectForKey:@"Begin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unint64_t v7 = [v6 objectForKey:@"Hour"];
    objc_opt_class();
    unint64_t v8 = (objc_opt_isKindOfClass() & 1) != 0 ? [v7 integerValue] : -1;
    __int16 v10 = [v6 objectForKey:@"Minute"];

    objc_opt_class();
    int64_t v9 = (objc_opt_isKindOfClass() & 1) != 0 ? [v10 integerValue] : -1;
  }
  else
  {
    unint64_t v8 = -1;
    int64_t v9 = -1;
  }
  int64_t v11 = [v18 objectForKey:@"End"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    int64_t v13 = [v12 objectForKey:@"Hour"];
    objc_opt_class();
    unint64_t v14 = (objc_opt_isKindOfClass() & 1) != 0 ? [v13 integerValue] : -1;
    v16 = [v12 objectForKey:@"Minute"];

    objc_opt_class();
    int64_t v15 = (objc_opt_isKindOfClass() & 1) != 0 ? [v16 integerValue] : -1;
  }
  else
  {
    unint64_t v14 = -1;
    int64_t v15 = -1;
  }

  if (v8 > 0x17 || v9 < 0 || v9 > 59 || v14 > 0x17 || v15 < 0 || v15 > 59)
  {
LABEL_27:
    retstr->int64_t var0 = 0u;
    retstr->int64_t var1 = 0u;
  }
  else
  {
    retstr->var0.int64_t var0 = v8;
    retstr->var0.int64_t var1 = v9;
    retstr->var1.int64_t var0 = v14;
    retstr->var1.int64_t var1 = v15;
  }

  return result;
}

- (void)setCustomSchedule:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3->var0.var0 > 0x17uLL
    || (int64_t var1 = a3->var0.var1, var1 < 0)
    || var1 > 59
    || a3->var1.var0 > 0x17uLL
    || (int64_t v7 = a3->var1.var1, v7 < 0)
    || v7 >= 60)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UISUserInterfaceStyleMode.m", 383, @"Invalid parameter not satisfying: %@", @"scheduleIsValid(newSchedule)" object file lineNumber description];
  }
  unint64_t v8 = _UISUserInterfaceStyleModeServiceLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = [MEMORY[0x1E4F62878] processHandle];
    int64_t var0 = a3->var0.var0;
    int64_t v11 = a3->var0.var1;
    int64_t v12 = a3->var1.var0;
    int64_t v13 = a3->var1.var1;
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    __int16 v31 = 2050;
    int64_t v32 = var0;
    __int16 v33 = 2050;
    int64_t v34 = v11;
    __int16 v35 = 2050;
    int64_t v36 = v12;
    __int16 v37 = 2050;
    int64_t v38 = v13;
    _os_log_impl(&dword_191ABF000, v8, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" set custom schedule: %{public}ld %{public}ld %{public}ld %{public}ld", buf, 0x34u);
  }
  v27[0] = @"Begin";
  v25[0] = @"Hour";
  unint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3->var0.var0];
  v25[1] = @"Minute";
  v26[0] = v14;
  int64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3->var0.var1];
  v26[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v27[1] = @"End";
  v28[0] = v16;
  v23[0] = @"Hour";
  v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3->var1.var0];
  v23[1] = @"Minute";
  v24[0] = v17;
  id v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3->var1.var1];
  v24[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v28[1] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  v21 = _UISUserInterfaceStyleModeUserDefaults();
  [v21 setObject:v20 forKey:@"CustomSchedule"];

  AnalyticsSendEventLazy();
}

id __47__UISUserInterfaceStyleMode_setCustomSchedule___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _commonAnalyticsEventDictionary];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"beginHour"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"beginMinute"];

  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  [v2 setObject:v5 forKeyedSubscript:@"endHour"];

  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  [v2 setObject:v6 forKeyedSubscript:@"endMinute"];

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userInterfaceStyleModeDidChange:self];
}

- (id)_commonAnalyticsEventDictionary
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];

  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"bundleID"];
  }
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v5 component:32 fromDate:v6];

  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
  [v2 setObject:v8 forKeyedSubscript:@"currentHour"];

  return v2;
}

- (NSString)debugDescription
{
  return (NSString *)[(UISUserInterfaceStyleMode *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(UISUserInterfaceStyleMode *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int64_t v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[UISUserInterfaceStyleMode modeValue](self, "modeValue"), @"modeValue");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(UISUserInterfaceStyleMode *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F62810];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = (id)objc_msgSend(v6, "appendInteger:withName:", -[UISUserInterfaceStyleMode modeValue](self, "modeValue"), @"modeValue");
  unint64_t v8 = [v6 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__UISUserInterfaceStyleMode_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E57351C0;
  id v9 = v6;
  id v13 = v9;
  unint64_t v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __67__UISUserInterfaceStyleMode_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "suggestedAutomaticModeValue"), @"suggestedAutomaticModeValue");
  int64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) override];
  if (v4 | v5)
  {
    id v6 = [NSString stringWithFormat:@"UISUserInterfaceStyleModeOverride(style: %ld, timing: %ld)", v4, v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"override" skipIfNil:1];

  id v9 = *(void **)(a1 + 32);
  unint64_t v8 = *(void **)(a1 + 40);
  if (v8)
  {
    [v8 customSchedule];
    uint64_t v10 = *((void *)&v16 + 1);
    uint64_t v11 = v16;
    uint64_t v13 = *((void *)&v17 + 1);
    uint64_t v12 = v17;
    if ((void)v16 == 22)
    {
      if (*((void *)&v16 + 1) || v17 != 7) {
        goto LABEL_17;
      }
      unint64_t v14 = @"UISUserInterfaceStyleModeScheduleDefault";
      goto LABEL_18;
    }
    if ((void)v16)
    {
LABEL_17:
      unint64_t v14 = [NSString stringWithFormat:@"UISUserInterfaceStyleModeSchedule(beginTime: %ld:%ld, endTime: %ld:%ld)", v11, v10, v12, v13, v16, v17];
      goto LABEL_18;
    }
    if (*((void *)&v16 + 1))
    {
LABEL_16:
      uint64_t v11 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  if (v12) {
    goto LABEL_16;
  }
  uint64_t v11 = 0;
  unint64_t v14 = 0;
  if (v13) {
    goto LABEL_17;
  }
LABEL_18:
  id v15 = (id)[v9 appendObject:v14 withName:@"customSchedule" skipIfNil:1];
}

- (void).cxx_destruct
{
}

@end