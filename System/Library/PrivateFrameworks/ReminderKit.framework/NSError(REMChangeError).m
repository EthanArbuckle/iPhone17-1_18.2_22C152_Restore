@interface NSError(REMChangeError)
+ (__CFString)_defaultDescriptionForREMChangeErrorCode:()REMChangeError;
+ (id)errorWithREMChangeErrorCode:()REMChangeError;
+ (id)errorWithREMChangeErrorCode:()REMChangeError debugDescription:;
+ (id)errorWithREMChangeErrorCode:()REMChangeError description:underlyingError:;
+ (id)errorWithREMChangeErrorCode:()REMChangeError underlyingError:;
@end

@implementation NSError(REMChangeError)

+ (__CFString)_defaultDescriptionForREMChangeErrorCode:()REMChangeError
{
  if (a3 < 0xC) {
    return off_1E61DC098[a3];
  }
  v4 = +[REMLog changeTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[NSError(REMChangeError) _defaultDescriptionForREMChangeErrorCode:](v4);
  }

  return 0;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError
{
  v5 = objc_msgSend(a1, "_defaultDescriptionForREMChangeErrorCode:");
  v6 = [a1 errorWithREMChangeErrorCode:a3 description:v5 underlyingError:0];

  return v6;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError debugDescription:
{
  v6 = NSString;
  v7 = a4;
  uint64_t v8 = [a1 _defaultDescriptionForREMChangeErrorCode:a3];
  v9 = (void *)v8;
  v10 = &stru_1F1339A18;
  if (v7) {
    v10 = v7;
  }
  v11 = [v6 stringWithFormat:@"%@ {%@}", v8, v10];

  v12 = [a1 errorWithREMChangeErrorCode:a3 description:v11 underlyingError:0];

  return v12;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError underlyingError:
{
  id v6 = a4;
  v7 = [a1 _defaultDescriptionForREMChangeErrorCode:a3];
  uint64_t v8 = [a1 errorWithREMChangeErrorCode:a3 description:v7 underlyingError:v6];

  return v8;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError description:underlyingError:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  if (v7 | v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    v10 = v9;
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    v11 = (void *)[v10 copy];
  }
  else
  {
    v11 = 0;
  }
  v12 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = [NSNumber numberWithInteger:a3];
    int v16 = 138412802;
    v17 = v15;
    __int16 v18 = 2112;
    unint64_t v19 = v7;
    __int16 v20 = 2112;
    unint64_t v21 = v8;
    _os_log_debug_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_DEBUG, "ERROR: REMChangeError occurred - code=%@, desc=%@, nserror=%@", (uint8_t *)&v16, 0x20u);
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.ReminderKit.REMChangeErrorDomain" code:a3 userInfo:v11];

  return v13;
}

+ (void)_defaultDescriptionForREMChangeErrorCode:()REMChangeError .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Unknown ReminderKit change tracking error code.", v1, 2u);
}

@end