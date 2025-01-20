uint64_t sub_100003510(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = qword_100014C50;
  if (!qword_100014C50)
  {
    v3 = [&off_100011EE0 objectForKeyedSubscript:a1];

    if (v3) {
      result = 73400320;
    }
    else {
      result = 10485760;
    }
    qword_100014C50 = result;
  }
  return result;
}

NSMutableDictionary *sub_100003568()
{
  return +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_100011F08, @"Status", &stru_1000108C8, @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];
}

id sub_1000035D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithUnsignedInt:a1];
  [v10 setObject:v11 forKeyedSubscript:@"Status"];

  if (v9) {
    CFStringRef v12 = v9;
  }
  else {
    CFStringRef v12 = &stru_1000108C8;
  }
  [v10 setObject:v12 forKeyedSubscript:@"Error"];

  if (v8) {
    CFStringRef v13 = v8;
  }
  else {
    CFStringRef v13 = &stru_1000108C8;
  }
  [v10 setObject:v13 forKeyedSubscript:@"Output"];

  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:@"Data"];
  }

  return v10;
}

id sub_1000037C8(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  id v3 = [v1 code];
  v4 = [v1 localizedDescription];

  id v5 = +[NSString stringWithFormat:@"NSError domain:%@, error code: %d. Description: %@", v2, v3, v4];
  id v6 = [v5 UTF8String];

  return v6;
}

id sub_100003874(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v8 = 0;
    id v2 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v1 error:&v8];

    id v3 = v8;
    NSLog(@"Unarchive Error : %@", v3);
    if (v3) {
      NSLog(@"Error : %@", v3);
    }
    [v2 setDecodingFailurePolicy:0];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    v9[3] = objc_opt_class();
    v9[4] = objc_opt_class();
    v4 = +[NSArray arrayWithObjects:v9 count:5];
    id v5 = +[NSSet setWithArray:v4];
    id v6 = [v2 decodeObjectOfClasses:v5 forKey:@"HSArchiverKey"];

    [v2 finishDecoding];
    NSLog(@"recvDict : %@", v6);
    NSLog(@"err : %@", v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_100003A38(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v2 encodeObject:v1 forKey:@"HSArchiverKey"];

    id v3 = [v2 encodedData];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_100003AC8(void *a1)
{
  id v1 = a1;
  id v2 = [v1 length];
  if (v2)
  {
    id v3 = (char *)v2;
    unsigned __int8 v7 = 0;
    v4 = +[NSMutableString stringWithCapacity:2 * (void)v2];
    for (i = 0; i != v3; ++i)
    {
      [v1 getBytes:&v7 range:i];
      [v4 appendFormat:@"%02x", v7];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_100003B8C(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = 0;
  }
  else
  {
    id v2 = +[NSMutableString string];
    if ([v1 length])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = [v1 substringWithRange:v3];
        uint64_t v7 = 0;
        id v5 = v4;
        sscanf((const char *)[v5 UTF8String], "%lx", &v7);
        [v2 appendFormat:@"%c", (char)v7];

        v3 += 2;
      }
      while (v3 < (unint64_t)[v1 length]);
    }
  }

  return v2;
}

id sub_100003C8C(void *a1)
{
  id v1 = [a1 stringByReplacingOccurrencesOfString:@"0x" withString:&stru_1000108C8];
  id v2 = [v1 stringByReplacingOccurrencesOfString:@"0X" withString:&stru_1000108C8];

  unint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:&stru_1000108C8];

  id v4 = [v3 length];
  if (v4)
  {
    CFStringRef v10 = @"Text does not have 2-digit hex chars for every byte";
    goto LABEL_10;
  }
  id v5 = objc_opt_new();
  if (v4)
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v3 substringWithRange:v6];
      id v8 = +[NSScanner scannerWithString:v7];
      int v13 = 0;
      if (([v8 scanHexInt:&v13] & 1) == 0) {
        break;
      }
      char v12 = v13;
      [v5 appendBytes:&v12 length:1];

      v6 += 2;
      if ((unint64_t)v4 <= v6) {
        goto LABEL_6;
      }
    }
    CFStringRef v10 = @"Text has illegal hexadecimal characters";
LABEL_10:
    id v11 = +[NSException exceptionWithName:@"IllegalInput" reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
LABEL_6:

  return v5;
}

uint64_t sub_100003E18(const char **a1, char *a2, int64_t a3, void *a4, id *a5)
{
  *(void *)__fd = 0;
  if (!a4)
  {
    v106 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    v107 = [v106 lastPathComponent];
    +[NSString stringWithFormat:@"Input response dictionary pointer is NULL."];
    v123 = uint64_t v114 = 115;
    sub_100009790(4, @"[%@:%d] %@\n", v108, v109, v110, v111, v112, v113, (uint64_t)v107);

    v9 = 0;
    uint64_t v19 = 0xFFFFFFFFLL;
    v83 = a5;
LABEL_27:
    v84 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    v85 = [v84 lastPathComponent];
    v121 = +[NSString stringWithFormat:@"Error executing command with data, result = %d\n", v19, v114];
    sub_100009790(2, @"[%@:%d] %@\n", v86, v87, v88, v89, v90, v91, (uint64_t)v85);

    v92 = +[NSString stringWithFormat:@"Error executing command with data, result = %d\n", v19, 195, v121];
    v93 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v92, NSLocalizedDescriptionKey, 0);
    if (v83)
    {
      id v94 = [objc_alloc((Class)NSError) initWithDomain:@"HSErrorDomain" code:7 userInfo:v93];
      id *v83 = v94;
      v95 = [v94 localizedDescription];
      [v9 setObject:v95 forKey:@"Error"];

      v96 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      v97 = [v96 lastPathComponent];
      v98 = [*v83 localizedDescription];
      v122 = +[NSString stringWithFormat:@"%@", v98];
      sub_100009790(2, @"[%@:%d] %@\n", v99, v100, v101, v102, v103, v104, (uint64_t)v97);
    }
    goto LABEL_30;
  }
  id v8 = +[NSNumber numberWithInt:7];
  v9 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v8, @"Status", &stru_1000108C8, @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];

  CFStringRef v10 = signal(13, (void (__cdecl *)(int))1);
  id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  char v12 = [v11 lastPathComponent];
  +[NSString stringWithFormat:@"entering hs_execute_command_with_input_data: %s (%p - %zu)\n", *a1, a2, a3];
  v115 = uint64_t v114 = 120;
  sub_100009790(2, @"[%@:%d] %@\n", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  uint64_t v19 = 0xFFFFFFFFLL;
  __fd[0] = -1;
  int v20 = sub_100004668(a1, &__fd[1], 0, __fd);
  if (v20 != -1 && __fd[0] != -1)
  {
    int v21 = v20;
    if (a3 >= 1)
    {
      while (1)
      {
        ssize_t v22 = write(__fd[0], a2, a3);
        if (v22 == -1) {
          break;
        }
        a2 += v22;
        BOOL v23 = a3 <= v22;
        a3 -= v22;
        if (v23) {
          goto LABEL_10;
        }
      }
      v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      v25 = [v24 lastPathComponent];
      v26 = *a1;
      v27 = __error();
      v116 = +[NSString stringWithFormat:@"write failed for %s: %s\n", v26, strerror(*v27), v115];
      sub_100009790(2, @"[%@:%d] %@\n", v28, v29, v30, v31, v32, v33, (uint64_t)v25);
    }
LABEL_10:
    close(__fd[0]);
    v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    v35 = [v34 lastPathComponent];
    v117 = +[NSString stringWithFormat:@"Start Reading output from shell command\n"];
    sub_100009790(2, @"[%@:%d] %@\n", v36, v37, v38, v39, v40, v41, (uint64_t)v35);

    id v42 = objc_alloc_init((Class)NSMutableString);
    ssize_t v43 = read(v21, v128, 0x3FFuLL);
    if (v43 >= 1)
    {
      do
      {
        v128[v43] = 0;
        id v44 = [objc_alloc((Class)NSString) initWithUTF8String:v128];
        [v42 appendString:v44];

        ssize_t v43 = read(v21, v128, 0x3FFuLL);
      }
      while (v43 > 0);
    }
    v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    v46 = [v45 lastPathComponent];
    v118 = +[NSString stringWithFormat:@"waiting for child to exit\n"];
    sub_100009790(2, @"[%@:%d] %@\n", v47, v48, v49, v50, v51, v52, (uint64_t)v46);

    int v126 = 0;
    pid_t v53 = waitpid(__fd[1], &v126, 0);
    v54 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    v55 = [v54 lastPathComponent];
    if (v53 == -1)
    {
      v70 = *a1;
      v71 = __error();
      v68 = +[NSString stringWithFormat:@"waitpid failed for %s: %s\n", v70, strerror(*v71), v118];
      uint64_t v69 = 179;
    }
    else
    {
      v119 = +[NSString stringWithFormat:@"child exited\n"];
      sub_100009790(2, @"[%@:%d] %@\n", v56, v57, v58, v59, v60, v61, (uint64_t)v55);

      if ((v126 & 0x7F) == 0)
      {
        v72 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
        v73 = [v72 lastPathComponent];
        +[NSString stringWithFormat:@"exit status: %d\n", BYTE1(v126), 165, v119];
        v120 = uint64_t v114 = 168;
        sub_100009790(2, @"[%@:%d] %@\n", v74, v75, v76, v77, v78, v79, (uint64_t)v73);

        BYTE1(v72) = BYTE1(v126);
        close(v21);
        uint64_t v19 = BYTE1(v72);
        if (BYTE1(v72)) {
          uint64_t v80 = 7;
        }
        else {
          uint64_t v80 = 0;
        }
        v81 = &CFDictionaryCreate_ptr;
        goto LABEL_23;
      }
      if ((v126 & 0x7F) == 0x7F)
      {
        v54 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
        v55 = [v54 lastPathComponent];
        v68 = +[NSString stringWithFormat:@"%s was stopped by signal %d\n", *a1, (v126 >> 8), v119];
        uint64_t v69 = 175;
      }
      else
      {
        v54 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
        v55 = [v54 lastPathComponent];
        v68 = +[NSString stringWithFormat:@"%s was terminated by signal %d\n", *a1, v126 & 0x7F, v119];
        uint64_t v69 = 171;
      }
    }
    uint64_t v114 = v69;
    sub_100009790(2, @"[%@:%d] %@\n", v62, v63, v64, v65, v66, v67, (uint64_t)v55);
    v81 = &CFDictionaryCreate_ptr;

    close(v21);
    uint64_t v80 = 7;
    uint64_t v19 = 0xFFFFFFFFLL;
LABEL_23:
    v82 = [v81[157] numberWithInt:v80];
    [v9 setObject:v82 forKey:@"Status"];

    [v9 setObject:v42 forKey:@"Output"];
  }
  if (v10 != (void (__cdecl *)(int))-1) {
    signal(13, v10);
  }
  v83 = a5;
  if (v19) {
    goto LABEL_27;
  }
LABEL_30:
  if (a4) {
    *a4 = v9;
  }

  return v19;
}

uint64_t sub_100004668(const char **a1, pid_t *a2, int a3, _DWORD *a4)
{
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  v9 = [v8 lastPathComponent];
  uint64_t v48 = +[NSString stringWithFormat:@"executing %s\n", *a1];
  sub_100009790(2, @"[%@:%d] %@\n", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

  if (pipe(v54) != -1)
  {
    if (a4 && pipe(v53) == -1)
    {
      uint64_t v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      uint64_t v38 = [v37 lastPathComponent];
      uint64_t v39 = *a1;
      uint64_t v40 = __error();
      uint64_t v51 = +[NSString stringWithFormat:@"pipe failed while preparing to execute %s: %s\n", v39, strerror(*v40), v48];
      sub_100009790(2, @"[%@:%d] %@\n", v41, v42, v43, v44, v45, v46, (uint64_t)v38);

      uint64_t v26 = 0xFFFFFFFFLL;
      goto LABEL_18;
    }
    posix_spawn_file_actions_t v52 = 0;
    posix_spawn_file_actions_init(&v52);
    posix_spawn_file_actions_adddup2(&v52, v54[1], 1);
    if (a3) {
      posix_spawn_file_actions_adddup2(&v52, v54[1], 2);
    }
    posix_spawn_file_actions_addclose(&v52, v54[0]);
    if (a4)
    {
      posix_spawn_file_actions_adddup2(&v52, v53[0], 0);
      posix_spawn_file_actions_addclose(&v52, v53[1]);
    }
    int v16 = posix_spawn(a2, *a1, &v52, 0, (char *const *)a1, 0);
    if (v16)
    {
      int v17 = v16;
      uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v49 = +[NSString stringWithFormat:@"posix_spawn %s failed: %s\n", *a1, strerror(v17), v48];
      sub_100009790(2, @"[%@:%d] %@\n", v20, v21, v22, v23, v24, v25, (uint64_t)v19);

      close(v54[0]);
      if (a4)
      {
        close(v53[1]);
        uint64_t v26 = 0xFFFFFFFFLL;
LABEL_14:
        posix_spawn_file_actions_destroy(&v52);
        close(v53[0]);
LABEL_18:
        close(v54[1]);
        return v26;
      }
      uint64_t v26 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v26 = v54[0];
      if (a4)
      {
        *a4 = v53[1];
        goto LABEL_14;
      }
    }
    posix_spawn_file_actions_destroy(&v52);
    goto LABEL_18;
  }
  v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  uint64_t v28 = [v27 lastPathComponent];
  uint64_t v29 = *a1;
  uint64_t v30 = __error();
  uint64_t v50 = +[NSString stringWithFormat:@"pipe failed while preparing to execute %s: %s\n", v29, strerror(*v30), v48];
  sub_100009790(2, @"[%@:%d] %@\n", v31, v32, v33, v34, v35, v36, (uint64_t)v28);

  return 0xFFFFFFFFLL;
}

uint64_t sub_1000049CC(const char **a1, void *a2, id *a3)
{
  if (!a2)
  {
    uint64_t v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    uint64_t v39 = [v38 lastPathComponent];
    v68 = +[NSString stringWithFormat:@"Input response dictionary pointer is NULL."];
    sub_100009790(4, @"[%@:%d] %@\n", v40, v41, v42, v43, v44, v45, (uint64_t)v39);

    id v8 = 0;
    goto LABEL_21;
  }
  unint64_t v6 = &CFDictionaryCreate_ptr;
  uint64_t v7 = +[NSNumber numberWithInt:7];
  id v8 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v7, @"Status", &stru_1000108C8, @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];

  pid_t v72 = 0;
  int v9 = sub_100004668(a1, &v72, 1, 0);
  if (v9 == -1)
  {
LABEL_21:
    uint64_t v34 = 0xFFFFFFFFLL;
LABEL_22:
    uint64_t v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    uint64_t v47 = [v46 lastPathComponent];
    uint64_t v69 = +[NSString stringWithFormat:@"Error executing command, result = %d\n", v34];
    sub_100009790(2, @"[%@:%d] %@\n", v48, v49, v50, v51, v52, v53, (uint64_t)v47);

    v54 = +[NSString stringWithFormat:@"Error executing command, result = %d\n", v34, 266, v69];
    v55 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v54, NSLocalizedDescriptionKey, 0);
    if (a3)
    {
      id v56 = [objc_alloc((Class)NSError) initWithDomain:@"HSErrorDomain" code:7 userInfo:v55];
      *a3 = v56;
      uint64_t v57 = [v56 localizedDescription];
      [v8 setObject:v57 forKey:@"Error"];

      uint64_t v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      uint64_t v59 = [v58 lastPathComponent];
      uint64_t v60 = [*a3 localizedDescription];
      v70 = +[NSString stringWithFormat:@"%@", v60];
      sub_100009790(2, @"[%@:%d] %@\n", v61, v62, v63, v64, v65, v66, (uint64_t)v59);
    }
    if (a2) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v10 = v9;
  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v67 = +[NSString stringWithFormat:@"Start Reading output from shell command\n"];
  sub_100009790(2, @"[%@:%d] %@\n", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  id v19 = objc_alloc_init((Class)NSMutableString);
  ssize_t v20 = read(v10, v73, 0x3FFuLL);
  if (v20 >= 1)
  {
    do
    {
      v73[v20] = 0;
      id v21 = [objc_alloc((Class)NSString) initWithUTF8String:v73];
      [v19 appendString:v21];

      ssize_t v20 = read(v10, v73, 0x3FFuLL);
    }
    while (v20 > 0);
  }
  int v71 = 0;
  if (waitpid(v72, &v71, 0) == -1)
  {
    uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
    uint64_t v24 = [v23 lastPathComponent];
    uint64_t v32 = *a1;
    uint64_t v33 = __error();
    unint64_t v6 = &CFDictionaryCreate_ptr;
    uint64_t v31 = +[NSString stringWithFormat:@"waitpid failed for %s: %s\n", v32, strerror(*v33), v67];
LABEL_15:
    sub_100009790(2, @"[%@:%d] %@\n", v25, v26, v27, v28, v29, v30, (uint64_t)v24);

    close(v10);
    uint64_t v35 = 7;
    uint64_t v34 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  unsigned __int8 v22 = BYTE1(v71);
  if ((v71 & 0x7F) != 0)
  {
    if ((v71 & 0x7F) == 0x7F)
    {
      uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      uint64_t v24 = [v23 lastPathComponent];
      +[NSString stringWithFormat:@"%s was stopped by signal %d\n", *a1, (v71 >> 8), v67];
    }
    else
    {
      uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      uint64_t v24 = [v23 lastPathComponent];
      +[NSString stringWithFormat:@"%s was terminated by signal %d\n", *a1, v71 & 0x7F, v67];
    uint64_t v31 = };
    goto LABEL_15;
  }
  close(v10);
  uint64_t v34 = v22;
  if (v22) {
    uint64_t v35 = 7;
  }
  else {
    uint64_t v35 = 0;
  }
LABEL_16:
  uint64_t v36 = [v6[157] numberWithInt:v35];
  [v8 setObject:v36 forKey:@"Status"];

  [v8 setObject:v19 forKey:@"Output"];
  if (v34) {
    goto LABEL_22;
  }
  if (a2) {
LABEL_18:
  }
    *a2 = v8;
LABEL_19:

  return v34;
}

void sub_100005F9C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];

  id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
  unint64_t v3 = [v18 lastPathComponent];
  if (v2)
  {
    uint64_t v16 = +[NSString stringWithFormat:@"Invoke handler to process new connection."];
    sub_100009790(2, @"[%@:%d] %@\n", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

    id v18 = [*(id *)(a1 + 32) handler];
    (*((void (**)(id, void))v18 + 2))(v18, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v17 = +[NSString stringWithFormat:@"No handler for remote connection."];
    sub_100009790(2, @"[%@:%d] %@\n", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  }
}

id sub_1000061E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) listen:*(void *)(a1 + 40)];
}

void sub_1000062FC(id a1)
{
  qword_100014C60 = objc_alloc_init(HSSepUtil);

  _objc_release_x1();
}

id sub_100006604()
{
  v0 = +[NSArray arrayWithObjects:@"-x", @"boot-args", 0];
  id v11 = 0;
  id v12 = 0;
  +[HSPipeUtil HSPipeUtilExecCommand:@"/usr/sbin/nvram" options:v0 response:&v12 error:&v11];
  id v1 = v12;
  id v2 = v11;
  unint64_t v3 = [v1 objectForKeyedSubscript:@"Output"];
  NSLog(@"Output: %@", v3);

  uint64_t v4 = [v1 objectForKeyedSubscript:@"Output"];
  uint64_t v5 = [v4 dataUsingEncoding:4];

  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:&v10 error:&v9];
  NSLog(@"plist is %@", v6);
  uint64_t v7 = [v6 objectForKey:@"boot-args"];

  return v7;
}

uint64_t sub_100006768()
{
  v0 = sub_100006604();
  id v1 = v0;
  if (v0)
  {
    unsigned int v2 = [v0 containsString:@"rd=md0"];
    BOOL v3 = v2 == 0;
    if (v2) {
      uint64_t v4 = @"Ramdisk";
    }
    else {
      uint64_t v4 = @"NonUI";
    }
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    NSLog(&v4->isa);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_100006908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000692C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = +[NSString stringWithFormat:@"Got xpc remote connection: 0x%lx.", v3];
  sub_100009790(2, @"[%@:%d] %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  objc_copyWeak(&v32, (id *)(a1 + 40));
  id v31 = v3;
  xpc_remote_connection_set_event_handler();
  uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  uint64_t v14 = [v13 lastPathComponent];
  uint64_t v15 = +[NSString stringWithFormat:@"Done with set_event_handler for remote connection."];
  sub_100009790(2, @"[%@:%d] %@\n", v16, v17, v18, v19, v20, v21, (uint64_t)v14);

  xpc_remote_connection_activate();
  unsigned __int8 v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  uint64_t v23 = [v22 lastPathComponent];
  uint64_t v30 = +[NSString stringWithFormat:@"remote coonnection activated."];
  sub_100009790(2, @"[%@:%d] %@\n", v24, v25, v26, v27, v28, v29, (uint64_t)v23);

  objc_destroyWeak(&v32);
}

void sub_100006B2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006B44(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v14 = +[NSString stringWithFormat:@"Got an event on xpc remote connection."];
  sub_100009790(2, @"[%@:%d] %@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  uint64_t v12 = [a1[4] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C94;
  block[3] = &unk_100010608;
  objc_copyWeak(&v18, a1 + 6);
  id v16 = v3;
  id v17 = a1[5];
  id v13 = v3;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
}

void sub_100006C94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained handleEvent:*(void *)(a1 + 32) from:*(void *)(a1 + 40)];
}

BOOL sub_1000079B4()
{
  if (!&_lockdown_copy_checkin_info)
  {
    v0 = getLogHandle();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "lockdown service not found on this system", v2, 2u);
    }
  }
  return &_lockdown_copy_checkin_info != 0;
}

id sub_100007A34()
{
  v0 = +[NSMutableData dataWithLength:0];
  while (1)
  {
    uint64_t v1 = lockdown_recv();
    if (v1) {
      break;
    }
    sleep(1u);
  }
  if (v1 == 4)
  {
    uint64_t v2 = getLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start receiving from the lockdown connection. Buffer size = %lu\n", buf, 0xCu);
    }

    uint64_t v6 = getLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v8 = 134217984;
      id v9 = [v0 length];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done receiving from the lockdown connection. Total received size = %lu\n", v8, 0xCu);
    }

    uint64_t v5 = sub_100003874(v0);
  }
  else
  {
    uint64_t v4 = getLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to receive the size of the message.\n", buf, 2u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

id sub_100007CD0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (!v2)
  {
    uint64_t v4 = getLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "response pointer is NULL\n", buf, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v4 = sub_100003A38(v2);
  unsigned int v5 = [v4 length];
  unsigned int v19 = v5;
  if (v5 > 0xA00000)
  {
    uint64_t v6 = getLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Size of message is too long: %u.\n", buf, 8u);
    }

LABEL_21:
    id v15 = 0;
    goto LABEL_22;
  }
  uint64_t v7 = v4;
  uint64_t v8 = (char *)[v7 bytes];
  uint64_t v9 = lockdown_send();
  uint64_t v10 = getLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 != 4)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to send the size of the message.\n", buf, 2u);
    }

    goto LABEL_21;
  }
  if (v11)
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = v19;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start sending to the lockdown connection. Buffer size = %lu\n", buf, 0xCu);
  }

  unsigned int v12 = v19;
  for (BOOL i = v19 >= 0x400; ; BOOL i = v12 >= 0x400)
  {
    if (i) {
      unsigned int v12 = 1024;
    }
    if (!v12) {
      break;
    }
    uint64_t v14 = lockdown_send();
    if (!v14) {
      break;
    }
    v8 += v14;
    unsigned int v12 = v19 - v14;
    unsigned int v19 = v12;
  }
  id v17 = getLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v7 length];
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = (unint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Done sending to the lockdown connection. Total sent size = %lu\n", buf, 0xCu);
  }

  id v15 = [v7 length];
LABEL_22:

  return v15;
}

void start()
{
  sub_100009664((uint64_t)"com.apple.fusiond");
  uint64_t v1 = dispatch_get_global_queue(0, 0);
  id v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);

  dispatch_source_set_event_handler(v2, &stru_100010698);
  dispatch_resume(v2);
  if (sub_1000079B4())
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.fusiond", 0, 1uLL);
    if (!mach_service)
    {
      uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
      unsigned int v5 = [v4 lastPathComponent];
      uint64_t v20 = +[NSString stringWithFormat:@"Could not create listener for %s", "com.apple.fusiond"];
      sub_100009790(4, @"[%@:%d] %@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

      exit(1);
    }
    id v17 = mach_service;
    id v18 = getLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Handle connection\n", buf, 2u);
    }

    xpc_connection_set_event_handler(v17, &stru_1000106D8);
    xpc_connection_resume(v17);
  }
  else
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.fusiond.message", 0);
    id v13 = (void *)qword_100014C68;
    qword_100014C68 = (uint64_t)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.fusion.remote.xpc_listener", 0);
    remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener();
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    id v16 = getLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "com.apple.fusiond is alive on RemoteXPC", buf, 2u);
    }
  }
  unsigned int v19 = getLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v22 = "com.apple.fusiond";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s started\n", buf, 0xCu);
  }

  dispatch_main();
}

void sub_10000820C(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
  id v2 = [v1 lastPathComponent];
  uint64_t v9 = +[NSString stringWithFormat:@"Got SIGTERM, exiting now.\n"];
  sub_100009790(4, @"[%@:%d] %@\n", v3, v4, v5, v6, v7, v8, (uint64_t)v2);

  exit(0);
}

void sub_100008294(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  uint64_t v3 = getLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got a connection %p", buf, 0xCu);
  }

  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_event_handler(v2, &stru_1000106F8);
    xpc_connection_resume(v2);
  }
  else
  {
    xpc_type_t v5 = type;
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
    uint64_t v7 = [v6 lastPathComponent];
    dispatch_queue_t v14 = +[NSString stringWithFormat:@"Failed to get a connection: %p\n", v5];
    sub_100009790(4, @"[%@:%d] %@\n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  }
}

void sub_100008400(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  uint64_t v3 = getLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got an xpc message\n", buf, 2u);
  }

  if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    unsigned __int8 v22 = getLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Got an invalid connection\n", buf, 2u);
    }
  }
  else
  {
    if (lockdown_copy_checkin_info())
    {
      uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
      xpc_type_t v5 = [v4 lastPathComponent];
      uint64_t v23 = +[NSString stringWithFormat:@"Failed to get lockdown checkin info\n"];
      sub_100009790(4, @"[%@:%d] %@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    }
    values = 0;
    keys = (void *)kLockdownCheckinConnectionInfoKey;
    CFDictionaryRef v12 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v13 = secure_lockdown_checkin();
    dispatch_queue_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
    id v15 = [v14 lastPathComponent];
    uint64_t v24 = +[NSString stringWithFormat:@"Could not checkin with lockdown: %d\n", v13];
    sub_100009790(4, @"[%@:%d] %@\n", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    if (v12) {
      CFRelease(v12);
    }
  }
}

void sub_1000087C4()
{
  v0 = getLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "hcs cancel handler is called", v1, 2u);
  }

  lockdown_disconnect();
  xpc_transaction_end();
}

void sub_100008840(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  xpc_type_t v5 = sub_100007A34();
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:@"SerializedObject"];
    uint64_t v8 = getLogHandle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      uint64_t v43 = v4;
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start processing the message received.\n", buf, 2u);
      }
      uint64_t v42 = v2;

      uint64_t v10 = objc_alloc_init(HSMessageProcessor);
      uint64_t v11 = +[HSMessage supportedClasses];
      CFDictionaryRef v12 = +[NSKeyedUnarchiver unarchiveDataToObject:v7 allowedClasses:v11];
      objc_opt_class();
      id v13 = v3;
      if (objc_opt_isKindOfClass())
      {
        id v14 = v12;
      }
      else
      {
        uint64_t v19 = getLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10000BC98((uint64_t)v12, v19);
        }

        id v14 = 0;
      }
      *(void *)uint64_t v44 = 0;
      [(HSMessageProcessor *)v10 processMessagev1:v14 response:v44];
      id v20 = *(id *)v44;
      uint64_t v21 = getLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Response: %@\n", buf, 0xCu);
      }

      id v22 = v20;
      id v16 = +[NSKeyedArchiver archiveObjectToDict:v22];

      id v3 = v13;
      uint64_t v2 = v42;
      uint64_t v4 = v43;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start processing the message received.\n", buf, 2u);
      }

      uint64_t v10 = objc_alloc_init(HSMessageProcessor);
      *(void *)buf = 0;
      unsigned int v15 = [(HSMessageProcessor *)v10 processMessage:v6 response:buf];
      id v16 = *(id *)buf;
      if (v15)
      {
        uint64_t v17 = getLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10000BC54(v17);
        }
      }
      uint64_t v18 = getLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Response:\n", v44, 2u);
      }

      if (v16)
      {
        [v16 enumerateKeysAndObjectsUsingBlock:&stru_100010780];
      }
      else
      {
        uint64_t v23 = +[NSNumber numberWithInt:6];
        id v16 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v23, @"Status", @"Failed to get a response from the device.", @"Error", 0, @"Data", 0];
      }
    }
    if (!sub_100007CD0(v2, v16))
    {
      id v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
      uint64_t v33 = [v32 lastPathComponent];
      uint64_t v41 = +[NSString stringWithFormat:@"Failed to send message to the host"];
      sub_100009790(4, @"[%@:%d] %@\n", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
    }
  }
  else
  {
    uint64_t v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v40 = +[NSString stringWithFormat:@"Didn't get an error from lockdown but the message is NULL"];
    sub_100009790(4, @"[%@:%d] %@\n", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void sub_100008CFC(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"Data"] & 1) == 0)
  {
    uint64_t v7 = getLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "key = %@, value = %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_100008DE4(id a1, OS_xpc_object *a2)
{
  id v3 = a2;
  uint64_t v2 = v3;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
}

void sub_100008E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_remote_connection_cancel();
  }
  else
  {
    uint64_t v4 = qword_100014C68;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008F50;
    v5[3] = &unk_1000105A0;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_sync(v4, v5);
  }
}

void sub_100008F50(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  uint64_t v4 = getLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v38 = "void _handle_remote_xpc_message(__strong xpc_remote_connection_t, __strong xpc_object_t)";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inside %s", buf, 0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (!reply)
  {
    int v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"];
    id v9 = [v8 lastPathComponent];
    uint64_t v34 = +[NSString stringWithFormat:@"RemoteXPC no reply context"];
    sub_100009790(4, @"[%@:%d] %@\n", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    xpc_remote_connection_cancel();
    goto LABEL_39;
  }
  if (!xpc_dictionary_get_string(v3, "RemotePing"))
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "SerializedObject", &length);
    if (!data)
    {
      getLogHandle();
      uint64_t v19 = (HSMessageProcessor *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v19->super, OS_LOG_TYPE_DEFAULT, "Message Data is NULL.", buf, 2u);
      }
      goto LABEL_38;
    }
    uint64_t v17 = +[NSData dataWithBytes:data length:length];
    if (v17)
    {
      uint64_t v18 = getLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Start processing the message received with request data.\n", buf, 2u);
      }

      uint64_t v19 = objc_alloc_init(HSMessageProcessor);
      id v20 = +[HSMessage supportedClasses];
      uint64_t v21 = +[NSKeyedUnarchiver unarchiveDataToObject:v17 allowedClasses:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
      }
      else
      {
        uint64_t v28 = getLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10000BC98((uint64_t)v21, v28);
        }

        id v22 = 0;
      }
      id v35 = 0;
      [(HSMessageProcessor *)v19 processMessagev1:v22 response:&v35];
      uint64_t v29 = (char *)v35;
      uint64_t v30 = getLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Response: %@\n", buf, 0xCu);
      }

      uint64_t v31 = v29;
      id v25 = +[NSKeyedArchiver archiveObjectToDict:v31];
    }
    else
    {
      if (!v3)
      {
        id v25 = 0;
        uint64_t v19 = 0;
        goto LABEL_35;
      }
      uint64_t v23 = getLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Start processing the message received without request data.\n", buf, 2u);
      }

      uint64_t v19 = objc_alloc_init(HSMessageProcessor);
      id v35 = 0;
      unsigned int v24 = [(HSMessageProcessor *)v19 processMessage:v3 response:&v35];
      id v25 = v35;
      if (v24)
      {
        uint64_t v26 = getLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10000BC54(v26);
        }
      }
      uint64_t v27 = getLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Response:\n", buf, 2u);
      }

      if (v25)
      {
        [v25 enumerateKeysAndObjectsUsingBlock:&stru_1000107E8];
LABEL_35:
        id v32 = getLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = (const char *)v25;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Start Replying for response... %@", buf, 0xCu);
        }

        sub_100003A38(v25);
        id v33 = objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_data(reply, "SerializedObject", [v33 bytes], (size_t)[v33 length]);
        xpc_dictionary_send_reply();

LABEL_38:
        goto LABEL_39;
      }
      id v20 = +[NSNumber numberWithInt:6];
      id v25 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v20, @"Status", @"Failed to get a response from the device.", @"Error", 0, @"Data", 0];
    }

    goto LABEL_35;
  }
  id v6 = (const char *)xpc_remote_connection_copy_remote_address_string();
  id v7 = getLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start Replying ...", buf, 2u);
  }

  xpc_dictionary_set_string(reply, "RemotePing", v6);
  xpc_dictionary_send_reply();
LABEL_39:
}

void sub_10000957C(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"Data"] & 1) == 0)
  {
    id v7 = getLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "key = %@, value = %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_100009664(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000096EC;
  block[3] = &unk_100010718;
  void block[4] = a1;
  if (qword_100014C70 != -1) {
    dispatch_once(&qword_100014C70, block);
  }
}

void sub_1000096EC(uint64_t a1)
{
  byte_100014C80 = 1;
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    id v3 = (void *)qword_100014C78;
    qword_100014C78 = v2;

    uint64_t v4 = *(const char **)(a1 + 32);
  }
  else
  {
    uint64_t v4 = "com.apple.fusiond";
  }
  os_log_t v5 = os_log_create(v4, "device");
  id v6 = (void *)qword_100014C88;
  qword_100014C88 = (uint64_t)v5;

  if (!qword_100014C88 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000BD10();
  }
}

void sub_100009790(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = [objc_alloc((Class)NSMutableString) initWithFormat:v10 arguments:&a9];

  id v12 = objc_alloc_init((Class)NSDateFormatter);
  [v12 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
  uint64_t v13 = +[NSDate date];
  uint64_t v14 = [v12 stringFromDate:v13];
  uint64_t v15 = +[NSString stringWithFormat:@"%@-%@", v14, v11];

  switch(a1)
  {
    case 1:
      id v16 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v15;
        uint64_t v18 = v16;
        *(_DWORD *)buf = 136315138;
        id v30 = [v17 UTF8String];
        uint64_t v19 = v18;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_6;
      }
      break;
    case 2:
      uint64_t v21 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_INFO))
      {
        id v22 = v15;
        uint64_t v18 = v21;
        *(_DWORD *)buf = 136315138;
        id v30 = [v22 UTF8String];
        uint64_t v19 = v18;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s", buf, 0xCu);
      }
      break;
    case 3:
      uint64_t v23 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_DEBUG)) {
        sub_10000BD58(v15, v23);
      }
      break;
    case 4:
      unsigned int v24 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_ERROR)) {
        sub_10000BDFC(v15, v24);
      }
      break;
    default:
      break;
  }
  if (qword_100014C78)
  {
    id v25 = +[NSString stringWithFormat:@"/private/var/log/%@.log", qword_100014C78];
    uint64_t v26 = fopen((const char *)[v25 UTF8String], "a+");
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = v15;
      fwrite([v28 UTF8String], (size_t)[v28 length], 1uLL, v27);
      fflush(v27);
      fclose(v27);
    }
  }
}

id sub_100009A94(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t sub_100009B00(uint64_t a1)
{
  id v20 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:1 error:&v20];
  id v2 = v20;
  id v3 = [v1 componentsSeparatedByString:@"\n"];
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  id v19 = 0;
  os_log_t v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v19];
  id v6 = v19;

  id v7 = [v5 objectForKey:@"ProductBuildVersion"];
  if ([v3 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v12 = v6;
LABEL_8:
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  id v16 = [v3 objectAtIndexedSubscript:0];
  uint64_t v9 = 1;
  id v10 = [v16 dataUsingEncoding:1];
  id v18 = v6;
  +[NSJSONSerialization JSONObjectWithData:v10 options:1 error:&v18];
  id v11 = v17 = v1;
  id v12 = v18;

  uint64_t v13 = [v11 objectForKey:@"os_version"];
  unsigned __int8 v14 = [v13 containsString:v7];

  id v1 = v17;
  if ((v14 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

uint64_t sub_100009CD4(void *a1)
{
  id v2 = &CFDictionaryCreate_ptr;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  char v139 = 0;
  id v122 = objc_alloc_init((Class)NSMutableArray);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v120 = [&off_100011FB0 countByEnumeratingWithState:&v135 objects:v141 count:16];
  id v4 = 0;
  os_log_t v5 = 0;
  if (!v120)
  {
    int v126 = 0;
    goto LABEL_42;
  }
  int v126 = 0;
  uint64_t v119 = *(void *)v136;
  v117 = a1;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v136 != v119) {
        objc_enumerationMutation(&off_100011FB0);
      }
      uint64_t v121 = v6;
      id v7 = *(void **)(*((void *)&v135 + 1) + 8 * v6);
      BOOL v8 = +[NSFileManager defaultManager];
      v125 = v7;
      LODWORD(v7) = [v8 fileExistsAtPath:v7 isDirectory:&v139];

      if (!v7)
      {
        uint64_t v78 = v2[154];
        uint64_t v79 = +[NSNumber numberWithInt:43];
        uint64_t v80 = [v78 dictionaryWithObjectsAndKeys:v79, @"Status", @"Log directory not found", @"Error", 0];

        id v3 = v80;
        *a1 = v3;
        uint64_t v77 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
        uint64_t v81 = [v77 lastPathComponent];
        uint64_t v88 = +[NSString stringWithFormat:@" Response dict populated: %@", v3];
LABEL_36:
        id v12 = (id)v81;
        sub_100009790(2, @"[%@:%d] %@\n", v82, v83, v84, v85, v86, v87, v81);

        goto LABEL_38;
      }
      if (!v139)
      {
        uint64_t v89 = v2[154];
        uint64_t v90 = +[NSNumber numberWithInt:43];
        uint64_t v91 = [v89 dictionaryWithObjectsAndKeys:v90, @"Status", @"Log directory expected. but found file", @"Error", 0];

        id v3 = v91;
        *a1 = v3;
        uint64_t v77 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
        uint64_t v81 = [v77 lastPathComponent];
        uint64_t v88 = +[NSString stringWithFormat:@" Response dict populated: %@", v3];
        goto LABEL_36;
      }
      uint64_t v9 = +[NSFileManager defaultManager];
      id v134 = v126;
      id v10 = [v9 contentsOfDirectoryAtPath:v125 error:&v134];
      id v11 = v134;

      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id v12 = v10;
      id v127 = [v12 countByEnumeratingWithState:&v130 objects:v140 count:16];
      if (v127)
      {
        id obj = v12;
        id v118 = v3;
        uint64_t v124 = *(void *)v131;
        while (1)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v131 != v124) {
              objc_enumerationMutation(obj);
            }
            unsigned __int8 v14 = [v125 stringByAppendingPathComponent:*(void *)(*((void *)&v130 + 1) + 8 * (void)v13)];
            uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
            id v16 = [v15 lastPathComponent];
            uint64_t v110 = +[NSString stringWithFormat:@"File Name: %@", v14];
            sub_100009790(2, @"[%@:%d] %@\n", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

            if (([v14 hasSuffix:@".ips"] & 1) == 0
              && ![v14 hasSuffix:@".log"])
            {
              id v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
              id v32 = [v23 lastPathComponent];
              uint64_t v112 = +[NSString stringWithFormat:@"Suffix Mismatch . Skipping file : %@", v14, 152, v110];
              sub_100009790(2, @"[%@:%d] %@\n", v50, v51, v52, v53, v54, v55, (uint64_t)v32);

              goto LABEL_29;
            }
            id v23 = objc_alloc_init((Class)v2[154]);
            unsigned int v24 = +[NSFileManager defaultManager];
            id v129 = v11;
            id v25 = [v24 attributesOfItemAtPath:v14 error:&v129];
            id v26 = v129;

            if (!v25)
            {
              id v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
              uint64_t v43 = [v32 lastPathComponent];
              uint64_t v111 = +[NSString stringWithFormat:@"Failed to retrieve attributes for %@: (%@)", v14, v26, v110];
              sub_100009790(2, @"[%@:%d] %@\n", v44, v45, v46, v47, v48, v49, (uint64_t)v43);

LABEL_25:
              id v4 = v25;
              goto LABEL_28;
            }
            uint64_t v27 = [v25 objectForKeyedSubscript:NSFileSize];
            id v28 = sub_100009A94(v27);

            if (!v28)
            {
              id v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
              id v56 = [v32 lastPathComponent];
              uint64_t v113 = +[NSString stringWithFormat:@"Failed to retrieve size of %@.", v14, 152, v110];
              sub_100009790(2, @"[%@:%d] %@\n", v57, v58, v59, v60, v61, v62, (uint64_t)v56);

              goto LABEL_25;
            }
            unsigned int v29 = [v14 hasPrefix:@"panic"];
            CFStringRef v30 = @"NO";
            if (!v29) {
              goto LABEL_20;
            }
            char v31 = sub_100009B00((uint64_t)v14);
            id v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
            id v33 = [v32 lastPathComponent];
            if (v31)
            {
              uint64_t v110 = +[NSString stringWithFormat:@"Panic Version and System Version matches. Sending to HOST"];
              sub_100009790(2, @"[%@:%d] %@\n", v34, v35, v36, v37, v38, v39, (uint64_t)v33);

              CFStringRef v30 = @"YES";
              id v2 = &CFDictionaryCreate_ptr;
LABEL_20:
              [v23 setObject:v30 forKey:@"isPanic"];
              id v40 = objc_alloc((Class)NSData);
              id v128 = v5;
              id v32 = [v40 initWithContentsOfFile:v14 options:0 error:&v128];
              id v41 = v128;

              if (v32)
              {
                [v23 setObject:v14 forKey:@"LogFileName"];
                uint64_t v42 = [v25 objectForKeyedSubscript:NSFileSize];
                [v23 setObject:v42 forKey:@"LogFileSize"];

                [v23 setObject:v32 forKey:@"LogFileData"];
                [v122 addObject:v23];
              }
              else
              {
                id v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
                uint64_t v63 = [v32 lastPathComponent];
                uint64_t v114 = +[NSString stringWithFormat:@"Failed to load %@: %@", v14, v41, v110];
                sub_100009790(2, @"[%@:%d] %@\n", v64, v65, v66, v67, v68, v69, (uint64_t)v63);
              }
              id v4 = v25;
              os_log_t v5 = v41;
LABEL_28:
              id v11 = v26;
              goto LABEL_29;
            }
            v115 = +[NSString stringWithFormat:@"Panic Version and System Version does not match. Skipping"];
            sub_100009790(2, @"[%@:%d] %@\n", v70, v71, v72, v73, v74, v75, (uint64_t)v33);

            id v4 = v25;
            id v11 = v26;
            id v2 = &CFDictionaryCreate_ptr;
LABEL_29:

            uint64_t v13 = (char *)v13 + 1;
          }
          while (v127 != v13);
          id v76 = [obj countByEnumeratingWithState:&v130 objects:v140 count:16];
          id v127 = v76;
          if (!v76)
          {
            id v12 = obj;
            uint64_t v77 = obj;
            int v126 = v11;
            a1 = v117;
            id v3 = v118;
            goto LABEL_38;
          }
        }
      }
      uint64_t v77 = v12;
      int v126 = v11;
LABEL_38:

      uint64_t v6 = v121 + 1;
    }
    while ((id)(v121 + 1) != v120);
    id v120 = [&off_100011FB0 countByEnumeratingWithState:&v135 objects:v141 count:16];
  }
  while (v120);
LABEL_42:
  v92 = v2;
  v93 = v3;
  id v94 = [v122 count];
  v95 = v92[154];
  if (v94)
  {
    v96 = +[NSNumber numberWithInt:0];
    v97 = [v95 dictionaryWithObjectsAndKeys:v96, @"Status", &stru_1000108C8, @"Error", v122, @"Data", 0];
    v98 = v122;
    uint64_t v99 = 0;
  }
  else
  {
    v98 = v122;
    uint64_t v99 = 45;
    v96 = +[NSNumber numberWithInt:45];
    v97 = [v95 dictionaryWithObjectsAndKeys:v96, @"Status", &stru_1000108C8, @"Error", 0, @"Data", 0];
  }

  id v100 = v97;
  *a1 = v100;
  uint64_t v101 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"];
  uint64_t v102 = [v101 lastPathComponent];
  v116 = +[NSString stringWithFormat:@" Returning Status: %d", v99];
  sub_100009790(2, @"[%@:%d] %@\n", v103, v104, v105, v106, v107, v108, (uint64_t)v102);

  return v99;
}

void sub_10000A908(id a1)
{
  if (reboot3()) {
    int v1 = -1;
  }
  else {
    int v1 = 0;
  }
  exit(v1);
}

void sub_10000B17C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000B1A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
  os_log_t v5 = [v4 lastPathComponent];
  id v12 = +[NSString stringWithFormat:@"Got xpc remote connection: 0x%lx.", v3];
  sub_100009790(2, @"[%@:%d] %@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v13 = v3;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();

  objc_destroyWeak(&v14);
}

void sub_10000B2D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000B2F0(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"];
  os_log_t v5 = [v4 lastPathComponent];
  id v14 = +[NSString stringWithFormat:@"Got an event on xpc remote connection."];
  sub_100009790(2, @"[%@:%d] %@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  id v12 = [a1[4] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B440;
  block[3] = &unk_100010608;
  objc_copyWeak(&v18, a1 + 6);
  id v16 = v3;
  id v17 = a1[5];
  id v13 = v3;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
}

void sub_10000B440(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained handleEvent:*(void *)(a1 + 32) from:*(void *)(a1 + 40)];
}

void sub_10000BC54(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Process message failed.\n", v1, 2u);
}

void sub_10000BC98(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Some other class type: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_10000BD10()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t", v0, 2u);
}

void sub_10000BD58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = 136315138;
  id v6 = [v3 UTF8String];
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
}

void sub_10000BDFC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = 136315138;
  id v6 = [v3 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t getLogHandle()
{
  return _getLogHandle();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return _launch_activate_socket(name, fds, cnt);
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t reboot3()
{
  return _reboot3();
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
}

uint64_t xpc_remote_connection_copy_remote_address_string()
{
  return _xpc_remote_connection_copy_remote_address_string();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_create_with_connected_fd()
{
  return _xpc_remote_connection_create_with_connected_fd();
}

uint64_t xpc_remote_connection_send_message()
{
  return _xpc_remote_connection_send_message();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hostConnection(void *a1, const char *a2, ...)
{
  return [a1 hostConnection];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listeningQueue(void *a1, const char *a2, ...)
{
  return [a1 listeningQueue];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_messageStr(void *a1, const char *a2, ...)
{
  return [a1 messageStr];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return [a1 sharedSingleton];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_supportedClasses(void *a1, const char *a2, ...)
{
  return [a1 supportedClasses];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}