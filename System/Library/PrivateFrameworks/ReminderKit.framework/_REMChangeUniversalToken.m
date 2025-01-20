@interface _REMChangeUniversalToken
+ (BOOL)supportsSecureCoding;
+ (id)universalToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUniversal;
- (_REMChangeUniversalToken)initWithCoder:(id)a3;
- (int64_t)compareToken:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _REMChangeUniversalToken

+ (id)universalToken
{
  if (universalToken_once != -1) {
    dispatch_once(&universalToken_once, &__block_literal_global_9);
  }
  v2 = (void *)universalToken_sUniversalToken;

  return v2;
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  v5 = +[REMLog changeTracking];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[_REMChangeUniversalToken compareToken:error:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:0];
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  v4 = +[REMLog changeTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[_REMChangeUniversalToken isEqual:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = objc_opt_class();
  v13 = REMSpecificCast(v12, v3);

  return v13 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_REMChangeUniversalToken)initWithCoder:(id)a3
{
  if (([a3 decodeBoolForKey:@"isUniversal"] & 1) == 0)
  {
    uint64_t v6 = +[REMLog changeTracking];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_REMChangeUniversalToken initWithCoder:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v4 = [(id)objc_opt_class() universalToken];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isUniversal
{
  return 1;
}

- (void)compareToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "rem_log_fault_if (!isUniversal) -- isUniversal == NO on decoded universal change token", a5, a6, a7, a8, 0);
}

@end