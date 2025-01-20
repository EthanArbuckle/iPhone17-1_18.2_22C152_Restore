@interface RCBackgroundFetchConfiguration
- (NSDate)earliestBeginDate;
- (NSString)sessionIdentifier;
- (NSString)sharedContainerIdentifier;
- (NSString)taskIdentifier;
- (RCBackgroundFetchConfiguration)initWithTaskIdentifier:(id)a3 sessionIdentifier:(id)a4 sharedContainerIdentifier:(id)a5 earliestBeginDate:(id)a6 timeout:(double)a7;
- (RCUnfairLock)accessLock;
- (double)internalTimeout;
- (double)timeout;
- (void)setAccessLock:(id)a3;
- (void)setEarliestBeginDate:(id)a3;
- (void)setInternalTimeout:(double)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSharedContainerIdentifier:(id)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation RCBackgroundFetchConfiguration

- (RCBackgroundFetchConfiguration)initWithTaskIdentifier:(id)a3 sessionIdentifier:(id)a4 sharedContainerIdentifier:(id)a5 earliestBeginDate:(id)a6 timeout:(double)a7
{
  id v11 = a3;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v31.receiver = self;
  v31.super_class = (Class)RCBackgroundFetchConfiguration;
  v17 = [(RCBackgroundFetchConfiguration *)&v31 init];
  if (v17)
  {
    if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:].cold.4();
      if (v14) {
        goto LABEL_7;
      }
    }
    else if (v14)
    {
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:]();
    }
LABEL_7:
    if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:]();
      if (v16) {
        goto LABEL_10;
      }
    }
    else if (v16)
    {
LABEL_10:
      [MEMORY[0x1E4F1C9C8] date];
      v18 = id v29 = v11;
      [v18 dateByAddingTimeInterval:a7];
      id v30 = a4;
      id v19 = a5;
      id v20 = a6;
      id v21 = v15;
      id v22 = v14;
      v24 = id v23 = v13;
      char v25 = objc_msgSend(v24, "rc_isLaterThan:", v16);

      id v13 = v23;
      id v14 = v22;
      id v15 = v21;
      a6 = v20;
      a5 = v19;
      a4 = v30;

      id v11 = v29;
      if ((v25 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:]();
      }
    }
    objc_storeStrong((id *)&v17->_taskIdentifier, v11);
    objc_storeStrong((id *)&v17->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v17->_sharedContainerIdentifier, a5);
    objc_storeStrong((id *)&v17->_earliestBeginDate, a6);
    v17->_internalTimeout = a7;
    v26 = objc_alloc_init(RCUnfairLock);
    accessLock = v17->_accessLock;
    v17->_accessLock = v26;
  }
  return v17;
}

- (double)timeout
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(RCBackgroundFetchConfiguration *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RCBackgroundFetchConfiguration_timeout__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithLockSync:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __41__RCBackgroundFetchConfiguration_timeout__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalTimeout];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setTimeout:(double)a3
{
  v5 = [(RCBackgroundFetchConfiguration *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__RCBackgroundFetchConfiguration_setTimeout___block_invoke;
  v6[3] = &unk_1E5B76088;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [v5 performWithLockSync:v6];
}

uint64_t __45__RCBackgroundFetchConfiguration_setTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInternalTimeout:*(double *)(a1 + 40)];
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sharedContainerIdentifier
{
  return self->_sharedContainerIdentifier;
}

- (void)setSharedContainerIdentifier:(id)a3
{
}

- (NSDate)earliestBeginDate
{
  return self->_earliestBeginDate;
}

- (void)setEarliestBeginDate:(id)a3
{
}

- (RCUnfairLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (double)internalTimeout
{
  return self->_internalTimeout;
}

- (void)setInternalTimeout:(double)a3
{
  self->_internalTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_sharedContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Background request timeout must take delay for scheduled requests into account."];
  int v1 = 136315906;
  v2 = "-[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:]";
  __int16 v3 = 2080;
  double v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/BackgroundURLSessionSupport/RCBackg"
       "roundFetchConfiguration.m";
  __int16 v5 = 1024;
  int v6 = 41;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedContainerIdentifier", v6, 2u);
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionIdentifier", v6, 2u);
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"taskIdentifier", v6, 2u);
}

@end