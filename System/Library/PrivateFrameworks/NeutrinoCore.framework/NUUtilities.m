@interface NUUtilities
+ (BOOL)runningUnderDebugger;
@end

@implementation NUUtilities

+ (BOOL)runningUnderDebugger
{
  if (runningUnderDebugger_onceToken != -1) {
    dispatch_once(&runningUnderDebugger_onceToken, &__block_literal_global_27451);
  }
  return runningUnderDebugger_runningUnderDebugger;
}

uint64_t __35__NUUtilities_runningUnderDebugger__block_invoke()
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(void *)v33 = 0xE00000001;
  int v34 = 1;
  pid_t v35 = getpid();
  size_t v1 = 648;
  uint64_t result = sysctl(v33, 4u, v2, &v1, 0, 0);
  runningUnderDebugger_runningUnderDebugger = (v3 & 0x800) != 0;
  return result;
}

@end