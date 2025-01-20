@interface _PASPosixUtils
+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 handleStdout:(id)a6 handleStderr:(id)a7;
+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 stdoutData:(id *)a6 stderrData:(id *)a7;
@end

@implementation _PASPosixUtils

+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 stdoutData:(id *)a6 stderrData:(id *)a7
{
  if (a6)
  {
    v13 = objc_opt_new();
    if (a7)
    {
LABEL_3:
      v14 = objc_opt_new();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (a7) {
      goto LABEL_3;
    }
  }
  v14 = 0;
LABEL_6:
  v15 = [v13 handleData];
  v16 = [v14 handleData];
  int v17 = [a1 runCommandWithPath:a3 argv:a4 envp:a5 handleStdout:v15 handleStderr:v16];

  if (a6)
  {
    *a6 = [v13 allData];
  }
  if (a7)
  {
    *a7 = [v14 allData];
  }

  return v17;
}

+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 handleStdout:(id)a6 handleStderr:(id)a7
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create("_PASPosixUtils-runCommandWithPath", v13);

  int v34 = 0;
  v15 = dispatch_group_create();
  posix_spawn_file_actions_t v33 = 0;
  posix_spawn_file_actions_init(&v33);
  if (!v11)
  {
    v16 = 0;
    if (v12) {
      goto LABEL_4;
    }
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v16 = objc_opt_new();
  int v17 = [v16 setupWithSubprocessFd:1 fileActions:&v33 queue:v14 group:v15 readErrno:&v34];
  if (v17 < 0)
  {
    int v20 = v17;
    v18 = 0;
    goto LABEL_29;
  }
  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  v18 = objc_opt_new();
  int v19 = [v18 setupWithSubprocessFd:2 fileActions:&v33 queue:v14 group:v15 readErrno:&v34];
  if (v19 < 0)
  {
    int v20 = v19;
    goto LABEL_29;
  }
LABEL_8:
  pid_t v32 = -1;
  v41[0] = 0;
  if (a5) {
    v21 = a5;
  }
  else {
    v21 = (const char **)v41;
  }
  int v22 = posix_spawn(&v32, a3, &v33, 0, (char *const *)a4, (char *const *)v21);
  if (v22)
  {
    int v23 = v22;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v30 = strerror(v23);
      *(_DWORD *)buf = 136315650;
      v36 = a3;
      __int16 v37 = 2080;
      v38 = v30;
      __int16 v39 = 1024;
      int v40 = v23;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "runCommandWithPath failed to spawn %s: %s (%d)", buf, 0x1Cu);
    }
    *__error() = v23;
  }
  else
  {
    [v16 startReadWithHandler:v11];
    [v18 startReadWithHandler:v12];
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    int v31 = 1;
    do
      *__error() = 0;
    while (waitpid(v32, &v31, 0) < 0 && *__error() == 4);
    if (*__error())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        int v26 = *__error();
        *(_DWORD *)buf = 136315394;
        v36 = v25;
        __int16 v37 = 1024;
        LODWORD(v38) = v26;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "runCommandWithPath failed on waitpid: %s (%d)", buf, 0x12u);
      }
    }
    else
    {
      int v27 = v31;
      if ((v31 & 0x7F) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = a3;
          __int16 v37 = 1024;
          LODWORD(v38) = v27;
          _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "runCommandWithPath subprocess \"%s\" did not exit cleanly (status %d)", buf, 0x12u);
        }
        *__error() = 5;
      }
      else
      {
        int v28 = v34;
        if (!v34)
        {
          int v20 = BYTE1(v31);
          goto LABEL_29;
        }
        *__error() = v28;
      }
    }
  }
  int v20 = -1;
LABEL_29:

  return v20;
}

@end