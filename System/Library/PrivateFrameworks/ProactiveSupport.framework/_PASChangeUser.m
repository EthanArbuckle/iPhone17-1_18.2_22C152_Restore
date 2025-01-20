@interface _PASChangeUser
+ (BOOL)becomeCurrentUser;
@end

@implementation _PASChangeUser

+ (BOOL)becomeCurrentUser
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (getuid()) {
    return 1;
  }
  *__error() = 0;
  v3 = getpwnam("mobile");
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = __error();
      v18 = strerror(*v17);
      int v22 = 136315138;
      v23 = v18;
      v14 = MEMORY[0x1E4F14500];
      v15 = "Warning: failed to get pwInfo: %s\n";
      uint32_t v16 = 12;
      goto LABEL_21;
    }
    return 0;
  }
  v4 = v3;
  if (!v3->pw_uid)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      v14 = MEMORY[0x1E4F14500];
      v15 = "Warning: got pwInfo for uid=0.\n";
      uint32_t v16 = 2;
      goto LABEL_21;
    }
    return 0;
  }
  v5 = getenv("LLVM_PROFILE_FILE");
  if (v5)
  {
    v6 = [NSString stringWithUTF8String:v5];
    v7 = [NSNumber numberWithInt:getpid()];
    v8 = [v7 stringValue];
    v9 = [v6 stringByReplacingOccurrencesOfString:@"%p" withString:v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v22 = 138412290;
      v23 = v9;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Retaining write permission to proile data file: %@", (uint8_t *)&v22, 0xCu);
    }
    v10 = v9;
    chmod((const char *)[v10 fileSystemRepresentation], 0x1B6u);
  }
  *__error() = 0;
  if (setuid(v4->pw_uid) || !getuid())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      pw_name = v4->pw_name;
      v12 = __error();
      v13 = strerror(*v12);
      int v22 = 136315394;
      v23 = pw_name;
      __int16 v24 = 2080;
      v25 = v13;
      v14 = MEMORY[0x1E4F14500];
      v15 = "Warning: failed to setuid to account \"%s\": %s\n";
      uint32_t v16 = 22;
LABEL_21:
      _os_log_error_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, v16);
      return 0;
    }
    return 0;
  }
  BOOL v2 = 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v20 = v4->pw_name;
    uid_t pw_uid = v4->pw_uid;
    int v22 = 136315394;
    v23 = v20;
    __int16 v24 = 1024;
    LODWORD(v25) = pw_uid;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Dropping root privileges to %s (%i)", (uint8_t *)&v22, 0x12u);
  }
  return v2;
}

@end