@interface MBTask
+ (id)sanitizeStringForFilename:(id)a3;
+ (id)taskWithCommand:(id)a3;
+ (id)taskWithCommandWithArguments:(id)a3;
- (MBTask)init;
- (NSArray)argv;
- (NSString)redirectStderrToFileAtPath;
- (NSString)redirectStdoutToFileAtPath;
- (int)exec;
- (int)redirectStderrToFileDescriptor;
- (int)redirectStdoutToFileDescriptor;
- (int)waitStatus;
- (void)resetRedirect;
- (void)setArgv:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandWithArguments:(id)a3;
- (void)setRedirectStderrToFileAtPath:(id)a3;
- (void)setRedirectStderrToFileDescriptor:(int)a3;
- (void)setRedirectStdoutToFileAtPath:(id)a3;
- (void)setRedirectStdoutToFileDescriptor:(int)a3;
@end

@implementation MBTask

- (MBTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBTask;
  result = [(MBTask *)&v3 init];
  if (result) {
    *(void *)&result->_redirectStdoutToFileDescriptor = -1;
  }
  return result;
}

+ (id)taskWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v9];

  v6 = [a1 taskWithCommandWithArguments:v5];

  return v6;
}

+ (id)taskWithCommandWithArguments:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setCommandWithArguments:v3];

  return v4;
}

+ (id)sanitizeStringForFilename:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

    v6 = [v5 stringByReplacingOccurrencesOfString:@"\" withString:@"'""];
    v7 = ;

    v8 = [v7 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

    uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"'" withString:&stru_100418BA8];

    v10 = objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", @"("), CFSTR("-");

    v11 = objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", @""), @"-");

    v12 = [v11 stringByReplacingOccurrencesOfString:@"[" withString:@"-"];

    v13 = [v12 stringByReplacingOccurrencesOfString:@"]" withString:@"-"];

    if (![(__CFString *)v13 length])
    {

      v13 = @"empty-string";
    }
  }
  else
  {
    v13 = @"nil";
  }
  return v13;
}

- (void)setCommand:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v6];

  [(MBTask *)self setCommandWithArguments:v5];
}

- (void)setCommandWithArguments:(id)a3
{
  id v19 = a3;
  id v4 = +[NSMutableArray array];
  if (![v19 length]) {
    goto LABEL_22;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  uint64_t v9 = -1;
  uint64_t v10 = 1;
  do
  {
    unsigned int v11 = [v19 characterAtIndex:v5];
    if (v11 != 39 || (v7 & 1) != 0)
    {
      if ((v11 != 34) | v8 & 1)
      {
        BOOL v13 = v11 != 32;
        v12 = v19;
        if ((v13 | v8 | v7)) {
          goto LABEL_18;
        }
      }
      else
      {
        v12 = v19;
        if ((v7 & 1) == 0)
        {
          int v8 = 0;
          int v7 = 1;
          goto LABEL_17;
        }
      }
    }
    else
    {
      v12 = v19;
      if ((v8 & 1) == 0)
      {
        int v7 = 0;
        int v8 = 1;
LABEL_17:
        uint64_t v9 = v5;
LABEL_18:
        uint64_t v17 = v10;
        goto LABEL_19;
      }
    }
    if (v10 != 1)
    {
      v14 = objc_msgSend(v12, "substringWithRange:", v6, v10 - 1);
      v15 = v14;
      if (v9 != -1)
      {
        uint64_t v16 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_100418BA8);

        v15 = (void *)v16;
      }
      [v4 addObject:v15];

      v12 = v19;
    }
    int v7 = 0;
    int v8 = 0;
    uint64_t v17 = 0;
    v6 += v10;
    uint64_t v9 = -1;
LABEL_19:
    uint64_t v10 = v17 + 1;
    ++v5;
  }
  while (v5 < (unint64_t)[v12 length]);
  if (v17)
  {
    v18 = objc_msgSend(v19, "substringWithRange:", v6, v17);
    [v4 addObject:v18];
  }
LABEL_22:
  [(MBTask *)self setArgv:v4];
}

- (int)exec
{
  id v3 = [(MBTask *)self argv];
  if (![v3 count]) {
    __assert_rtn("-[MBTask exec]", "MBTask.m", 157, "self.argv.count > 0");
  }

  id v4 = [(MBTask *)self argv];
  unint64_t v5 = (char **)malloc_type_malloc(8 * (void)[v4 count] + 8, 0x10040436913F5uLL);

  uint64_t v6 = [(MBTask *)self argv];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(MBTask *)self argv];
      id v10 = [v9 objectAtIndexedSubscript:v8];
      v5[v8] = strdup((const char *)[v10 fileSystemRepresentation]);

      ++v8;
      unsigned int v11 = [(MBTask *)self argv];
      id v12 = [v11 count];
    }
    while (v8 < (unint64_t)v12);
  }
  BOOL v13 = [(MBTask *)self argv];
  v5[(void)[v13 count]] = 0;

  v14 = (posix_spawn_file_actions_t *)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  int v15 = posix_spawn_file_actions_init(v14);
  if (v15)
  {
    int v16 = v15;
    uint64_t v17 = __error();
    v44 = strerror(*v17);
    NSLog(@"Unable to initialize the file actions properly (%s).", v44);
  }
  else
  {
    v24 = [(MBTask *)self redirectStdoutToFileAtPath];
    id v25 = [v24 length];

    if (v25
      && ([(MBTask *)self redirectStdoutToFileAtPath],
          id v26 = objc_claimAutoreleasedReturnValue(),
          int v16 = posix_spawn_file_actions_addopen(v14, 1, (const char *)[v26 fileSystemRepresentation], 513, 0x1B6u), v26, v16))
    {
      v27 = __error();
      v45 = strerror(*v27);
      NSLog(@"Unable to redirect stdin (%s).", v45);
    }
    else
    {
      v28 = [(MBTask *)self redirectStderrToFileAtPath];
      id v29 = [v28 length];

      if (v29
        && ([(MBTask *)self redirectStderrToFileAtPath],
            id v30 = objc_claimAutoreleasedReturnValue(),
            int v16 = posix_spawn_file_actions_addopen(v14, 2, (const char *)[v30 fileSystemRepresentation], 513, 0x1B6u), v30, v16))
      {
        v31 = __error();
        v46 = strerror(*v31);
        NSLog(@"Unable to redirect stderr (%s).", v46);
      }
      else if (([(MBTask *)self redirectStdoutToFileDescriptor] == -1 {
              || (int v32 = posix_spawn_file_actions_adddup2(v14, [(MBTask *)self redirectStdoutToFileDescriptor], 1)) == 0)&& ([(MBTask *)self redirectStderrToFileDescriptor] == -1|| (int v32 = posix_spawn_file_actions_adddup2(v14, [(MBTask *)self redirectStderrToFileDescriptor], 2)) == 0))
      }
      {
        pid_t v50 = 0;
        v34 = [(MBTask *)self argv];
        id v35 = [v34 objectAtIndexedSubscript:0];
        v36 = (const char *)[v35 fileSystemRepresentation];
        int v16 = posix_spawnp(&v50, v36, v14, 0, v5, environ);

        if (v16)
        {
          v37 = [(MBTask *)self argv];
          v38 = [v37 componentsJoinedByString:@", "];
          v39 = strerror(v16);
          NSLog(@"Unable to spawn a new process (argv: [%@], error: %s).", v38, v39);

          self->_waitStatus = 0;
        }
        else
        {
          v40 = signal(2, (void (__cdecl *)(int))1);
          if (v40 == (void (__cdecl *)(int))-1)
          {
            NSLog(@"Unable to retrieve handler for SIGINT.");
            waitpid(v50, &self->_waitStatus, 0);
          }
          else
          {
            v41 = v40;
            v42 = dispatch_get_global_queue(0, 0);
            v43 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, v42);

            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_1002A4624;
            handler[3] = &unk_1004155F0;
            pid_t v49 = v50;
            handler[4] = self;
            dispatch_source_set_event_handler(v43, handler);
            dispatch_resume(v43);
            waitpid(v50, &self->_waitStatus, 0);
            signal(2, v41);
            dispatch_source_cancel(v43);
          }
        }
      }
      else
      {
        int v16 = v32;
        v33 = __error();
        v47 = strerror(*v33);
        NSLog(@"Unable to perform spawn action (%s).", v47);
      }
    }
  }
  v18 = *v5;
  if (*v5)
  {
    id v19 = v5 + 1;
    do
    {
      free(v18);
      v20 = *v19++;
      v18 = v20;
    }
    while (v20);
  }
  free(v5);
  if (posix_spawn_file_actions_destroy(v14))
  {
    v21 = __error();
    v22 = strerror(*v21);
    NSLog(@"Unable to detroy the file actions properly (%s).", v22);
  }
  free(v14);
  if (!v16) {
    return self->_waitStatus;
  }
  return v16;
}

- (void)resetRedirect
{
  [(MBTask *)self setRedirectStdoutToFileAtPath:0];
  [(MBTask *)self setRedirectStdoutToFileDescriptor:0xFFFFFFFFLL];
  [(MBTask *)self setRedirectStderrToFileAtPath:0];
  [(MBTask *)self setRedirectStderrToFileDescriptor:0xFFFFFFFFLL];
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
}

- (NSString)redirectStdoutToFileAtPath
{
  return self->_redirectStdoutToFileAtPath;
}

- (void)setRedirectStdoutToFileAtPath:(id)a3
{
}

- (int)redirectStdoutToFileDescriptor
{
  return self->_redirectStdoutToFileDescriptor;
}

- (void)setRedirectStdoutToFileDescriptor:(int)a3
{
  self->_redirectStdoutToFileDescriptor = a3;
}

- (NSString)redirectStderrToFileAtPath
{
  return self->_redirectStderrToFileAtPath;
}

- (void)setRedirectStderrToFileAtPath:(id)a3
{
}

- (int)redirectStderrToFileDescriptor
{
  return self->_redirectStderrToFileDescriptor;
}

- (void)setRedirectStderrToFileDescriptor:(int)a3
{
  self->_redirectStderrToFileDescriptor = a3;
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectStderrToFileAtPath, 0);
  objc_storeStrong((id *)&self->_redirectStdoutToFileAtPath, 0);
  objc_storeStrong((id *)&self->_argv, 0);
}

@end