@interface NUGenericAdjustment
- (NSDictionary)settings;
- (NUGenericAdjustment)initWithAdjustmentSchema:(id)a3;
- (id)valueForKey:(id)a3;
- (void)setSettings:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation NUGenericAdjustment

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  settings = self->_settings;
  if (a3) {
    [(NSMutableDictionary *)settings setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)settings removeObjectForKey:a4];
  }
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_settings objectForKey:a3];
}

- (void)setSettings:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = NUAssertLogger_15272();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger_15272();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGenericAdjustment setSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 223, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"settings != nil");
  }
  id v21 = v4;
  [(NSMutableDictionary *)self->_settings setDictionary:v4];
}

- (NSDictionary)settings
{
  v2 = (void *)[(NSMutableDictionary *)self->_settings copy];

  return (NSDictionary *)v2;
}

- (NUGenericAdjustment)initWithAdjustmentSchema:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUGenericAdjustment;
  v3 = [(NUAdjustment *)&v7 initWithAdjustmentSchema:a3];
  id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  settings = v3->_settings;
  v3->_settings = v4;

  return v3;
}

@end