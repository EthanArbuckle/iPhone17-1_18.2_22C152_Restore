@interface PLState
+ (void)load;
- (BOOL)updateWithEntry:(id)a3;
- (BOOL)updateWithValue:(id)a3;
- (NSDate)stateChangeTime;
- (NSString)entryKey;
- (PLState)initWithStateId:(unint64_t)a3 entryKey:(id)a4 currValue:(id)a5;
- (id)currValue;
- (id)lastValue;
- (unint64_t)stateId;
- (void)setCurrValue:(id)a3;
- (void)setLastValue:(id)a3;
- (void)setStateChangeTime:(id)a3;
- (void)updateWithLastEntry;
@end

@implementation PLState

- (NSDate)stateChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)updateWithValue:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(PLState *)self currValue],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqual:v5],
        v5,
        (v6 & 1) == 0))
  {
    v8 = [(PLState *)self currValue];
    [(PLState *)self setLastValue:v8];

    [(PLState *)self setCurrValue:v4];
    v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLState updateWithValue:](self, v9);
    }

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)currValue
{
  return objc_getProperty(self, a2, 16, 1);
}

+ (void)load
{
  v2 = objc_opt_class();
  if ([v2 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v3 = objc_opt_class();
    if (v3 != objc_opt_class())
    {
      uint64_t v4 = objc_opt_class();
      +[PLStateTrackingComposition registerState:v4];
    }
  }
}

- (PLState)initWithStateId:(unint64_t)a3 entryKey:(id)a4 currValue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLState;
  v11 = [(PLState *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_stateId = a3;
    objc_storeStrong((id *)&v11->_entryKey, a4);
    objc_storeStrong(&v12->_lastValue, a5);
    objc_storeStrong(&v12->_currValue, a5);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    stateChangeTime = v12->_stateChangeTime;
    v12->_stateChangeTime = (NSDate *)v13;
  }
  return v12;
}

- (void)updateWithLastEntry
{
  uint64_t v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 storage];
  v5 = [(PLState *)self entryKey];
  id v8 = [v4 lastEntryForKey:v5];

  char v6 = v8;
  if (v8)
  {
    [(PLState *)self updateWithEntry:v8];
    BOOL v7 = [(PLState *)self currValue];
    [(PLState *)self setLastValue:v7];

    char v6 = v8;
  }
}

- (BOOL)updateWithEntry:(id)a3
{
  return 0;
}

- (id)lastValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setLastValue:(id)a3
{
}

- (void)setCurrValue:(id)a3
{
}

- (void)setStateChangeTime:(id)a3
{
}

- (unint64_t)stateId
{
  return self->_stateId;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKey, 0);
  objc_storeStrong((id *)&self->_stateChangeTime, 0);
  objc_storeStrong(&self->_currValue, 0);
  objc_storeStrong(&self->_lastValue, 0);
}

- (void)updateWithValue:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [a1 lastValue];
  BOOL v7 = [a1 currValue];
  int v8 = 138412802;
  id v9 = v5;
  __int16 v10 = 2112;
  v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "%@ Last:%@ Curr:%@", (uint8_t *)&v8, 0x20u);
}

@end