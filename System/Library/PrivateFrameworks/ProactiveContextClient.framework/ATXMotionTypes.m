@interface ATXMotionTypes
+ (id)stringForMotionType:(int64_t)a3;
+ (int64_t)motionTypeForString:(id)a3 found:(BOOL *)a4;
@end

@implementation ATXMotionTypes

+ (id)stringForMotionType:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return off_1E6BE6CE0[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXMotionTypes stringForMotionType:](a3, v5);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForMotionType called with invalid ATXMotionType of %tu", a3);
  return @"Error";
}

+ (int64_t)motionTypeForString:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  int64_t v7 = 0;
  while (1)
  {
    int64_t v8 = v7;
    v9 = [a1 stringForMotionType:v7];
    int v10 = [v9 isEqualToString:v6];

    if (v10) {
      break;
    }
    int64_t v7 = v8 + 1;
    if (v8 == 4)
    {
      if (!a4) {
        goto LABEL_9;
      }
      BOOL v11 = 0;
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_8:
  *a4 = v11;
LABEL_9:

  return v8;
}

+ (void)stringForMotionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "stringForMotionType called with invalid ATXMotionType of %tu", (uint8_t *)&v2, 0xCu);
}

@end