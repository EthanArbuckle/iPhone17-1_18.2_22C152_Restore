@interface NUAdjustment
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjustment:(id)a3;
- (NSDictionary)settings;
- (NSString)debugDescription;
- (NSString)description;
- (NUAdjustment)init;
- (NUAdjustment)initWithAdjustmentSchema:(id)a3;
- (NUAdjustment)initWithIdentifier:(id)a3;
- (NUAdjustmentSchema)schema;
- (NUIdentifier)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)reset;
@end

@implementation NUAdjustment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NUAdjustmentSchema)schema
{
  return self->_schema;
}

- (void)reset
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(NUAdjustment *)self schema];
  if (!v3)
  {
    v13 = NUAssertLogger_15272();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = NSString;
      v15 = [(NUAdjustment *)self identifier];
      v16 = [v14 stringWithFormat:@"No schema registered for identifier '%@'", v15];
      *(_DWORD *)buf = 138543362;
      v38 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_15272();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v22;
        __int16 v39 = 2114;
        v40 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v27 = [(NUAdjustment *)self identifier];
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment reset]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 188, @"No schema registered for identifier '%@'", v28, v29, v30, v31, v27);
  }
  v4 = v3;
  v5 = [v3 settings];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        v12 = [v11 defaultValue];
        [(NUAdjustment *)self setValue:v12 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }
}

- (BOOL)isEqualToAdjustment:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NUAdjustment *)self identifier];
  uint64_t v6 = [v4 identifier];
  int v7 = [v5 isEqualToIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = [(NUAdjustment *)self schema];
    v9 = v8;
    if (!v8)
    {
      v13 = NUAssertLogger_15272();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = NSString;
        v15 = [(NUAdjustment *)self identifier];
        v16 = [v14 stringWithFormat:@"No schema registered for identifier '%@'", v15];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v18 = NUAssertLogger_15272();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v19)
        {
          v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v23 = (void *)MEMORY[0x1E4F29060];
          id v24 = v22;
          v25 = [v23 callStackSymbols];
          uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v22;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          uint64_t v27 = (void *)v26;
          _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v19)
      {
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      uint64_t v28 = [(NUAdjustment *)self identifier];
      _NUAssertFailHandler((uint64_t)"-[NUAdjustment isEqualToAdjustment:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 162, @"No schema registered for identifier '%@'", v29, v30, v31, v32, v28);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v37 = 1;
    uint64_t v10 = [v8 settings];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __36__NUAdjustment_isEqualToAdjustment___block_invoke;
    v33[3] = &unk_1E5D94DD8;
    v33[4] = self;
    id v34 = v4;
    long long v35 = buf;
    [v10 enumerateKeysAndObjectsUsingBlock:v33];

    BOOL v11 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __36__NUAdjustment_isEqualToAdjustment___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  int v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 valueForKey:v8];
  uint64_t v10 = [*(id *)(a1 + 40) valueForKey:v8];

  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (!v11)
  {
    v12 = [v15 defaultValue];
    v13 = v10;
    goto LABEL_9;
  }
  if (v9 && !v10)
  {
    v12 = [v15 defaultValue];
    v13 = v9;
LABEL_9:
    char v14 = [v13 isEqual:v12];

    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v9 && v10 && ([v9 isEqual:v10] & 1) == 0)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_11:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUAdjustment *)self isEqualToAdjustment:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(NUAdjustment *)self identifier];
  unint64_t v3 = 0x4EA01FA48FF05 * [v2 hash];

  return v3;
}

- (NUIdentifier)identifier
{
  v2 = [(NUAdjustment *)self schema];
  unint64_t v3 = [v2 identifier];

  return (NUIdentifier *)v3;
}

- (NSDictionary)settings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NUAdjustment *)self schema];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = objc_msgSend(v3, "settings", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          BOOL v11 = [(NUAdjustment *)self valueForKey:v10];
          if (v11) {
            [v4 setObject:v11 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)debugDescription
{
  unint64_t v3 = [(NUAdjustment *)self settings];
  id v4 = [(NUAdjustment *)self identifier];
  BOOL v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"PortraitVideo"];

  if (v6)
  {
    uint64_t v7 = (void *)[v3 mutableCopy];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"disparityKeyframes"];
    v9 = v8;
    if (v8 && (unint64_t)[v8 count] >= 6)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu keyframes", objc_msgSend(v9, "count"));
      [v7 setObject:v10 forKeyedSubscript:@"disparityKeyframes"];
    }
    BOOL v11 = [v7 objectForKeyedSubscript:@"cinematographyState"];
    v12 = v11;
    if (v11)
    {
      long long v13 = [v11 objectForKeyedSubscript:@"user_tracks"];
      if (v13)
      {
        long long v14 = (void *)[v12 mutableCopy];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", @"user_tracks; removing for clarity",
          @"user_tracks");
        [v7 setObject:v14 forKeyedSubscript:@"cinematographyState"];
      }
    }
  }
  else
  {
    uint64_t v7 = v3;
  }
  long long v15 = NSString;
  uint64_t v16 = objc_opt_class();
  v17 = [(NUAdjustment *)self identifier];
  uint64_t v18 = [v15 stringWithFormat:@"<%@:%p> id=%@ settings=%@", v16, self, v17, v7];

  return (NSString *)v18;
}

- (NSString)description
{
  unint64_t v3 = [(NUAdjustment *)self settings];
  id v4 = [v3 description];

  if ((unint64_t)[v4 length] >= 0x65)
  {
    BOOL v5 = [v4 substringToIndex:75];
    uint64_t v6 = [v5 stringByAppendingString:@"..."];

    id v4 = (void *)v6;
  }
  uint64_t v7 = NSString;
  uint64_t v8 = objc_opt_class();
  v9 = [(NUAdjustment *)self identifier];
  uint64_t v10 = [v7 stringWithFormat:@"<%@:%p> id=%@ settings=%@", v8, self, v9, v4];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = [(NUAdjustment *)self schema];
  if (!v4)
  {
    v9 = NUAssertLogger_15272();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSString;
      BOOL v11 = [(NUAdjustment *)self identifier];
      v12 = [v10 stringWithFormat:@"No schema registered for identifier '%@'", v11];
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v14 = NUAssertLogger_15272();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        __int16 v46 = 2114;
        v47 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v30 = [(NUAdjustment *)self identifier];
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment copyWithZone:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 51, @"No schema registered for identifier '%@'", v31, v32, v33, v34, v30);
  }
  BOOL v5 = v4;
  uint64_t v6 = [v4 copyAdjustment:self];
  if (!v6)
  {
    uint64_t v18 = NUAssertLogger_15272();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = [NSString stringWithFormat:@"[NUAdjustment copyWithZone] failed. check logs for more details. adjustment: %@", self];
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_15272();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        long long v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        __int16 v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2114;
        v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment copyWithZone:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 55, @"[NUAdjustment copyWithZone] failed. check logs for more details. adjustment: %@", v40, v41, v42, v43, (uint64_t)self);
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (NUAdjustment)initWithIdentifier:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v12 = NUAssertLogger_15272();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_15272();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v40;
        __int16 v79 = 2114;
        v80 = v44;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 34, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  BOOL v5 = v4;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    BOOL v19 = NUAssertLogger_15272();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"Unable to instantiate abstract class %@", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v78 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_15272();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v49;
        __int16 v79 = 2114;
        v80 = v53;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v54 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 35, @"Unable to instantiate abstract class %@", v55, v56, v57, v58, v54);
  }
  uint64_t v7 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v8 = [v7 schemaWithIdentifier:v5];
  if (!v8)
  {
    uint64_t v26 = NUAssertLogger_15272();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = [NSString stringWithFormat:@"Unable to instantiate adjustment with invalid identifier %@", v5];
      *(_DWORD *)buf = 138543362;
      v78 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_15272();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v59;
        __int16 v79 = 2114;
        v80 = v63;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 39, @"Unable to instantiate adjustment with invalid identifier %@", v64, v65, v66, v67, (uint64_t)v5);
  }
  v9 = v8;
  if ([v8 type] != 1)
  {
    uint64_t v33 = NUAssertLogger_15272();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [NSString stringWithFormat:@"Attempted to instantiate adjustment with invalid schema type %@", v9];
      *(_DWORD *)buf = 138543362;
      v78 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_15272();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        v71 = [v69 callStackSymbols];
        v72 = [v71 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v68;
        __int16 v79 = 2114;
        v80 = v72;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 40, @"Attempted to instantiate adjustment with invalid schema type %@", v73, v74, v75, v76, (uint64_t)v9);
  }
  uint64_t v10 = [(NUAdjustment *)self initWithAdjustmentSchema:v9];

  return v10;
}

- (NUAdjustment)initWithAdjustmentSchema:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (NUAdjustmentSchema *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_15272();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustmentSchema != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_15272();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        BOOL v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      long long v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustment initWithAdjustmentSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 26, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"adjustmentSchema != nil");
  }
  BOOL v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUAdjustment;
  uint64_t v6 = [(NUAdjustment *)&v25 init];
  schema = v6->_schema;
  v6->_schema = v5;

  return v6;
}

- (NUAdjustment)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15285);
  }
  unint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    BOOL v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15285);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15285);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    long long v14 = [v12 callStackSymbols];
    BOOL v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUAdjustment init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 21, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end