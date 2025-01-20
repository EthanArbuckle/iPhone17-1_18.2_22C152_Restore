@interface PLFileDescriptorFuse
+ (void)checkFileDescriptorFuse;
+ (void)logRecentOpenFiles;
@end

@implementation PLFileDescriptorFuse

+ (void)checkFileDescriptorFuse
{
  int v3 = open("/dev/null", 0);
  if (v3 < 0)
  {
    if (*__error() == 24 || *__error() == 23)
    {
      v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "File descriptor fuse blown", v5, 2u);
      }

      [a1 logRecentOpenFiles];
      qword_1E93E3018 = (uint64_t)"File descriptor fuse blown";
      __break(1u);
    }
  }
  else
  {
    close(v3);
  }
}

+ (void)logRecentOpenFiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x19F38BDA0](a1, a2))
  {
    v12.int rlim_cur = 0;
    v12.rlim_max = 0;
    int v2 = getrlimit(8, &v12);
    int v3 = PLBackendGetLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v2 < 0)
    {
      if (v4)
      {
        int v9 = *__error();
        v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v18 = v9;
        *(_WORD *)&v18[4] = 2082;
        *(void *)&v18[6] = v11;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Unable to get the maximum number of open files RLIMIT_NOFILE: %d %{public}s", buf, 0x12u);
      }
    }
    else
    {
      if (v4)
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v18 = v12.rlim_cur;
        *(_WORD *)&v18[8] = 2048;
        *(void *)&v18[10] = v12.rlim_max;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Maximum number of open files RLIMIT_NOFILE, cur: %llu, max: %llu", buf, 0x16u);
      }

      int rlim_cur = v12.rlim_cur;
      if (SLODWORD(v12.rlim_cur) >= 1)
      {
        if (SLODWORD(v12.rlim_cur) >= 25) {
          int v6 = 25;
        }
        else {
          int v6 = v12.rlim_cur;
        }
        int v7 = LODWORD(v12.rlim_cur) - v6;
        do
        {
          if (fcntl(v7, 50, buf) != -1)
          {
            v8 = PLBackendGetLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v13 = 67109378;
              int v14 = v7;
              __int16 v15 = 2080;
              v16 = buf;
              _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "fd %d: %s", v13, 0x12u);
            }
          }
          ++v7;
        }
        while (v7 < rlim_cur);
      }
    }
  }
}

@end