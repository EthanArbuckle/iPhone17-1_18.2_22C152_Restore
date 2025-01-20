@interface PIPerfPowerService
- (PIPerfPowerRecord)record;
- (PIPerfPowerService)init;
- (PIPerfPowerService)initWithIdentifier:(id)a3 operation:(int64_t)a4;
- (PIPerfPowerServiceIdentifier)identifier;
- (int64_t)operation;
- (void)beginMeasuring;
- (void)endMeasuring;
- (void)measureBlock:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation PIPerfPowerService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setRecord:(id)a3
{
}

- (PIPerfPowerRecord)record
{
  return self->_record;
}

- (int64_t)operation
{
  return self->_operation;
}

- (PIPerfPowerServiceIdentifier)identifier
{
  return self->_identifier;
}

- (void)measureBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17 = (void (**)(void))a3;
  if (!v17)
  {
    v4 = NUAssertLogger_14928();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v6 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v8 = NUAssertLogger_14928();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific(*v6);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        __int16 v20 = 2114;
        v21 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  [(PIPerfPowerService *)self beginMeasuring];
  v17[2]();
  [(PIPerfPowerService *)self endMeasuring];
}

- (void)endMeasuring
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(PIPerfPowerService *)self identifier];

  if (!v3) {
    return;
  }
  id v39 = [(PIPerfPowerService *)self record];
  if (!v39)
  {
    v8 = NUAssertLogger_14928();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [NSString stringWithFormat:@"Not already measuring performance"];
      *(_DWORD *)buf = 138543362;
      v41 = v9;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v12 = NUAssertLogger_14928();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v26 = dispatch_get_specific(*v10);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v10 = [v27 callStackSymbols];
        v29 = [v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v26;
        __int16 v42 = 2114;
        v43 = v29;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v10 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v18 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  v4 = [v39 startTime];

  if (!v4)
  {
    v15 = NUAssertLogger_14928();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"Invalid measurement record, expected a start time"];
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x1E4F7A308];
    v17 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v12 = NUAssertLogger_14928();
    int v18 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v17)
    {
      if (v18)
      {
        v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        v10 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v10;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_29:

      int v23 = _NUAssertFailHandler();
      goto LABEL_30;
    }
LABEL_27:
    if (v18)
    {
      v30 = dispatch_get_specific(*v10);
      v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      v10 = [v31 callStackSymbols];
      v33 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v30;
      __int16 v42 = 2114;
      v43 = v33;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_29;
  }
  v5 = [v39 endTime];

  if (v5)
  {
    __int16 v20 = NUAssertLogger_14928();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [NSString stringWithFormat:@"Invalid measurement record, expected no end time"];
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v12 = NUAssertLogger_14928();
    int v23 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_32;
    }
LABEL_30:
    if (v23)
    {
      v34 = dispatch_get_specific(*v10);
      v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v34;
      __int16 v42 = 2114;
      v43 = v38;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_32:

    _NUAssertFailHandler();
  }
  v6 = [MEMORY[0x1E4F1C9C8] now];
  [v39 setEndTime:v6];

  [v39 identifier];
  v7 = [v39 payload];
  PPSSendTelemetry();

  [(PIPerfPowerService *)self setRecord:0];
}

- (void)beginMeasuring
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(PIPerfPowerService *)self identifier];

  if (v3)
  {
    v4 = [(PIPerfPowerService *)self record];

    if (v4)
    {
      v12 = NUAssertLogger_14928();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = [NSString stringWithFormat:@"Already measuring performance"];
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v14 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v16 = NUAssertLogger_14928();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v17)
        {
          __int16 v20 = dispatch_get_specific(*v14);
          v21 = (void *)MEMORY[0x1E4F29060];
          id v22 = v20;
          int v23 = [v21 callStackSymbols];
          v24 = [v23 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v27 = v20;
          __int16 v28 = 2114;
          v29 = v24;
          _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v17)
      {
        int v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    v5 = objc_alloc_init(PIPerfPowerRecord);
    [(PIPerfPowerService *)self setRecord:v5];

    v6 = [(PIPerfPowerService *)self identifier];
    uint64_t v7 = [v6 telemetryId];
    v8 = [(PIPerfPowerService *)self record];
    [v8 setIdentifier:v7];

    int64_t v9 = [(PIPerfPowerService *)self operation];
    v10 = [(PIPerfPowerService *)self record];
    [v10 setOperation:v9];

    id v25 = [MEMORY[0x1E4F1C9C8] now];
    v11 = [(PIPerfPowerService *)self record];
    [v11 setStartTime:v25];
  }
}

- (PIPerfPowerService)initWithIdentifier:(id)a3 operation:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = (PIPerfPowerServiceIdentifier *)a3;
  if (a4 <= 0)
  {
    v11 = NUAssertLogger_14928();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "operation > 0");
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_14928();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        __int16 v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        id v22 = [v20 callStackSymbols];
        int v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        __int16 v27 = 2114;
        __int16 v28 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  v24.receiver = self;
  v24.super_class = (Class)PIPerfPowerService;
  v8 = [(PIPerfPowerService *)&v24 init];
  identifier = v8->_identifier;
  v8->_identifier = v7;

  v8->_operation = a4;
  return v8;
}

- (PIPerfPowerService)init
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
      uint64_t v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      int64_t v9 = NSStringFromClass(v8);
      v10 = NSStringFromSelector(a2);
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
          id v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          BOOL v16 = [v14 callStackSymbols];
          BOOL v17 = [v16 componentsJoinedByString:@"\n"];
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
      __int16 v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      id v22 = [v20 callStackSymbols];
      int v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      __int16 v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    objc_super v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14944);
  }
}

@end