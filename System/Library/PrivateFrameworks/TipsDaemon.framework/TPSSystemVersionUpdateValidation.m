@interface TPSSystemVersionUpdateValidation
- (BOOL)validateLastMajorSystemVersionUpdateSinceTimeInterval:(double)a3 desiredOrder:(int64_t)a4;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSystemVersionUpdateValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, BOOL, void))a3;
  v5 = [(TPSTargetingValidation *)self value];
  uint64_t v6 = [v5 TPSSafeIntegerForKey:@"type"];

  v7 = [(TPSTargetingValidation *)self value];
  [v7 TPSSafeDoubleForKey:@"interval"];
  double v9 = v8;

  v10 = [(TPSTargetingValidation *)self value];
  uint64_t v11 = [v10 TPSSafeIntegerForKey:@"order"];

  if (v6)
  {
    v12 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TPSSystemVersionUpdateValidation validateWithCompletion:](v6);
    }

    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [(TPSSystemVersionUpdateValidation *)self validateLastMajorSystemVersionUpdateSinceTimeInterval:v11 desiredOrder:v9];
  }
  v14 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v14];
  }

  v4[2](v4, v13, 0);
}

- (BOOL)validateLastMajorSystemVersionUpdateSinceTimeInterval:(double)a3 desiredOrder:(int64_t)a4
{
  uint64_t v6 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  v7 = [v6 lastMajorVersionUpdateDate];

  if (v7)
  {
    if ((unint64_t)(a4 - 2) > 0xFFFFFFFFFFFFFFFCLL)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      v12 = [v7 dateByAddingTimeInterval:a3];
      BOOL v10 = [v11 compare:v12] == a4;

      goto LABEL_11;
    }
    double v8 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TPSSystemVersionUpdateValidation validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:](a4);
    }
  }
  else
  {
    double v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TPSSystemVersionUpdateValidation validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:](v9);
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Unsupported system version update type: %@", v4, v5, v6, v7, 2u);
}

- (void)validateLastMajorSystemVersionUpdateSinceTimeInterval:(os_log_t)log desiredOrder:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4492000, log, OS_LOG_TYPE_ERROR, "Unable to find last major version update date", v1, 2u);
}

- (void)validateLastMajorSystemVersionUpdateSinceTimeInterval:(uint64_t)a1 desiredOrder:.cold.2(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Invalid ordered parameter: %@", v4, v5, v6, v7, 2u);
}

@end