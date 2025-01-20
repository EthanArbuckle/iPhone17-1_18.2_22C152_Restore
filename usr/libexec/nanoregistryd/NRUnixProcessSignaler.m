@interface NRUnixProcessSignaler
+ (BOOL)signalProcessNamed:(id)a3 withSignal:(int)a4;
+ (int)_findProcessNamed:(id)a3;
+ (int)findProcessNamed:(id)a3;
+ (void)killProcessNamed:(id)a3;
@end

@implementation NRUnixProcessSignaler

+ (void)killProcessNamed:(id)a3
{
}

+ (int)_findProcessNamed:(id)a3
{
  id v3 = a3;
  for (i = 0; ; i = 0)
  {
    *(void *)size = 0;
    int v5 = sysctl(dword_10011A6B8, 3u, 0, (size_t *)size, 0, 0);
    if (v5 == -1) {
      int v5 = *__error();
    }
    if (v5) {
      break;
    }
    i = (char *)malloc_type_malloc(*(size_t *)size, 0xCBD8A6C1uLL);
    if (!i)
    {
      int v5 = 12;
      break;
    }
    int v5 = sysctl(dword_10011A6B8, 3u, i, (size_t *)size, 0, 0);
    if (v5 == -1) {
      int v5 = *__error();
    }
    if (v5 != 12)
    {
      if (v5)
      {
        BOOL v6 = 1;
        goto LABEL_14;
      }
      break;
    }
    free(i);
  }
  BOOL v6 = v5 != 0;
LABEL_14:
  if (v6 && i != 0)
  {
    free(i);
    i = 0;
  }
  if (v6)
  {
    if (v5 || !i) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (!v5 && i)
  {
    if (*(void *)size >= 0x288uLL)
    {
      unint64_t v8 = *(void *)size / 0x288uLL;
      v9 = i + 243;
      while (1)
      {
        int v10 = *(_DWORD *)(v9 - 203);
        id v11 = v3;
        if (!strcmp(v9, (const char *)[v11 UTF8String])) {
          break;
        }
        v9 += 648;
        if (!--v8) {
          goto LABEL_29;
        }
      }
      free(i);
      if (v10 != -1)
      {
        v18 = nr_daemon_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (!v19) {
          goto LABEL_39;
        }
        v14 = nr_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)size = 138412546;
          *(void *)&size[4] = v11;
          __int16 v21 = 2048;
          uint64_t v22 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NRUnixProcessSignaler: Found process %@ PID %ld", size, 0x16u);
        }
        goto LABEL_37;
      }
LABEL_30:
      v12 = nr_daemon_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        v14 = nr_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)size = 138412290;
          *(void *)&size[4] = v3;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NRUnixProcessSignaler: Did not find process %@", size, 0xCu);
        }
        goto LABEL_36;
      }
LABEL_38:
      int v10 = -1;
      goto LABEL_39;
    }
LABEL_29:
    free(i);
    goto LABEL_30;
  }
LABEL_33:
  v15 = nr_daemon_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

  if (!v16) {
    goto LABEL_38;
  }
  v14 = nr_daemon_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000F9248(v5, v14);
  }
LABEL_36:
  int v10 = -1;
LABEL_37:

LABEL_39:
  return v10;
}

+ (int)findProcessNamed:(id)a3
{
  unint64_t v5 = 0;
  do
  {
    int result = [a1 _findProcessNamed:a3];
    if (v5 > 3) {
      break;
    }
    ++v5;
  }
  while (result == -1);
  return result;
}

+ (BOOL)signalProcessNamed:(id)a3 withSignal:(int)a4
{
  id v6 = a3;
  pid_t v7 = [a1 findProcessNamed:v6];
  if (v7 == -1)
  {
    int v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000F92C0((uint64_t)v6, v12);
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  int v8 = v7;
  if (kill(v7, a4) == -1)
  {
    BOOL v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000F9338(v8, (uint64_t)v6, v12);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

@end