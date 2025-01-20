@interface SUCoreCodeCoverage
+ (id)getCodeCoveragePathForName:(id)a3;
+ (void)_handleSignal:(int)a3 forName:(id)a4;
+ (void)dumpCodeCoverageForName:(id)a3;
+ (void)initializeForName:(id)a3;
+ (void)resetCodeCoverageForName:(id)a3;
@end

@implementation SUCoreCodeCoverage

+ (void)initializeForName:(id)a3
{
  v3 = +[SUCoreLog sharedLogger];
  v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B4EC2000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }
}

+ (void)_handleSignal:(int)a3 forName:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3 == 31)
  {
    v8 = +[SUCoreLog sharedLogger];
    v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Signal handler received SIGUSR2, resetting code coverage", (uint8_t *)v12, 2u);
    }

    +[SUCoreCodeCoverage resetCodeCoverageForName:v5];
  }
  else if (a3 == 30)
  {
    v6 = +[SUCoreLog sharedLogger];
    v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Signal handler received SIGUSR1, dumping code coverage", (uint8_t *)v12, 2u);
    }

    +[SUCoreCodeCoverage dumpCodeCoverageForName:v5];
  }
  else
  {
    v10 = +[SUCoreLog sharedLogger];
    v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Unhandled signal: %d (ignored)", (uint8_t *)v12, 8u);
    }
  }
}

+ (id)getCodeCoveragePathForName:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v15 = 0;
    goto LABEL_11;
  }
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  v6 = NSString;
  uint64_t v7 = getpid();
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [v5 stringFromDate:v8];
  v10 = [v6 stringWithFormat:@"%@/%@.%d.%@.profraw", @"/tmp/ASUCodeCoverage", v4, v7, v9];

  uint64_t v22 = *MEMORY[0x1E4F28330];
  v11 = [MEMORY[0x1E4F28ED0] numberWithInt:511];
  v23[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v13 fileExistsAtPath:@"/tmp/ASUCodeCoverage"])
  {

    id v14 = 0;
  }
  else
  {
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    char v17 = [v16 createDirectoryAtPath:@"/tmp/ASUCodeCoverage" withIntermediateDirectories:0 attributes:v12 error:&v21];
    id v14 = v21;

    if ((v17 & 1) == 0)
    {
      v18 = +[SUCoreLog sharedLogger];
      v19 = [v18 oslog];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[SUCoreCodeCoverage getCodeCoveragePathForName:]((uint64_t)v14, v19);
      }

      id v15 = 0;
      goto LABEL_10;
    }
  }
  id v15 = v10;
LABEL_10:

LABEL_11:
  return v15;
}

+ (void)dumpCodeCoverageForName:(id)a3
{
  v3 = +[SUCoreLog sharedLogger];
  id v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B4EC2000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }
}

+ (void)resetCodeCoverageForName:(id)a3
{
  v3 = +[SUCoreLog sharedLogger];
  id v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B4EC2000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }
}

+ (void)getCodeCoveragePathForName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B4EC2000, a2, OS_LOG_TYPE_ERROR, "[SUCoreCodeCoverage] Unable to create output directory: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end