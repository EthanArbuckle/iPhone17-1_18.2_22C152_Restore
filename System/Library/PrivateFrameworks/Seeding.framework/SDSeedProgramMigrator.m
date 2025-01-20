@interface SDSeedProgramMigrator
+ (BOOL)_enrollInSeedProgram:(int64_t)a3;
+ (BOOL)_enrollInSeedProgramFromCookie;
+ (BOOL)fixupSeedProgramSettings;
+ (void)_enrollInSeedProgramFromCookie;
+ (void)fixupSeedProgramSettings;
@end

@implementation SDSeedProgramMigrator

+ (BOOL)fixupSeedProgramSettings
{
  v2 = +[SDSeedingLogging migrateHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[SDSeedProgramMigrator fixupSeedProgramSettings];
  }

  return 0;
}

+ (BOOL)_enrollInSeedProgramFromCookie
{
  v2 = +[SDSeedingLogging migrateHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[SDSeedProgramMigrator _enrollInSeedProgramFromCookie];
  }

  return 0;
}

+ (BOOL)_enrollInSeedProgram:(int64_t)a3
{
  uint64_t v3 = +[SDSeedingLogging migrateHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[SDSeedProgramMigrator _enrollInSeedProgram:](v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

+ (void)fixupSeedProgramSettings
{
}

+ (void)_enrollInSeedProgramFromCookie
{
}

+ (void)_enrollInSeedProgram:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end