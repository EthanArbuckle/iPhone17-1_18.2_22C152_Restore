@interface ICSearchProfiler
+ (void)logProfilingWithMessage:(id)a3;
+ (void)logProfilingWithMessage:(id)a3 searchQueryOperation:(id)a4;
+ (void)resetProfileTimer;
@end

@implementation ICSearchProfiler

+ (void)resetProfileTimer
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = (void *)profilingTimer;
  profilingTimer = v2;
}

+ (void)logProfilingWithMessage:(id)a3
{
}

+ (void)logProfilingWithMessage:(id)a3 searchQueryOperation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.notes", "SearchProfiling");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[ICSearchProfiler logProfilingWithMessage:searchQueryOperation:]((uint64_t)v6, (uint64_t)v5, v7);
  }
}

+ (void)logProfilingWithMessage:(NSObject *)a3 searchQueryOperation:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(id)profilingTimer timeIntervalSinceNow];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 2048;
  double v12 = -v6;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "%@: %@: %f", (uint8_t *)&v7, 0x20u);
}

@end