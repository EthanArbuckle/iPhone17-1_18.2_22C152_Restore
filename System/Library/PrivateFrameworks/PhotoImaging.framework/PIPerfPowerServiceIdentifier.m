@interface PIPerfPowerServiceIdentifier
+ (id)genEditIdentifier;
- (PIPerfPowerServiceIdentifier)init;
- (PIPerfPowerServiceIdentifier)initWithIdentifier:(PPSTelemetryIdentifier *)a3;
- (PPSTelemetryIdentifier)telemetryId;
@end

@implementation PIPerfPowerServiceIdentifier

- (PPSTelemetryIdentifier)telemetryId
{
  return self->_telemetryId;
}

- (PIPerfPowerServiceIdentifier)initWithIdentifier:(PPSTelemetryIdentifier *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v5 = NUAssertLogger_14928();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != NULL");
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_14928();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        __int16 v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v18.receiver = self;
  v18.super_class = (Class)PIPerfPowerServiceIdentifier;
  result = [(PIPerfPowerServiceIdentifier *)&v18 init];
  result->_telemetryId = a3;
  return result;
}

- (PIPerfPowerServiceIdentifier)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      BOOL v10 = NSStringFromSelector(a2);
      v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14944);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          id v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14944);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      id v15 = v18;
      v22 = [v20 callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14944);
  }
}

+ (id)genEditIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PIPerfPowerServiceIdentifier_genEditIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genEditIdentifier_onceToken != -1) {
    dispatch_once(&genEditIdentifier_onceToken, block);
  }
  v2 = (void *)genEditIdentifier_wrapperIdentifier;
  return v2;
}

void __49__PIPerfPowerServiceIdentifier_genEditIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = PPSCreateTelemetryIdentifier();
  if (v2)
  {
    genEditIdentifier_wrapperIdentifier = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:v2];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_115);
    }
    v3 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9680000, v3, OS_LOG_TYPE_INFO, "Failed to create telemetry identifier", v4, 2u);
    }
  }
}

@end