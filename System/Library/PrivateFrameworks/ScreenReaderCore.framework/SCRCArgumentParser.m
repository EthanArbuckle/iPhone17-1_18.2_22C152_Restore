@interface SCRCArgumentParser
+ (id)commandPath;
+ (id)processIdentifier;
+ (id)versionString;
- (BOOL)isLaunchedAtLogin;
- (BOOL)parse;
- (NSArray)_arguments;
- (NSMutableArray)_subcommandArray;
- (NSString)appName;
- (SCRCArgumentParser)initWithArgc:(int)a3 argv:(const char *)a4;
- (SCRCArgumentSubcommand)_subcommand;
- (id)_displayHelp:(id)a3;
- (id)_displayVersion:(id)a3;
- (id)setRunningAtStartup:(id)a3;
- (int)run;
- (void)addSubcommand:(id)a3;
- (void)setAppName:(id)a3;
- (void)setIsLaunchedAtLogin:(BOOL)a3;
- (void)set_arguments:(id)a3;
- (void)set_subcommand:(id)a3;
- (void)set_subcommandArray:(id)a3;
- (void)stop;
@end

@implementation SCRCArgumentParser

+ (id)processIdentifier
{
  return 0;
}

+ (id)versionString
{
  return 0;
}

+ (id)commandPath
{
  if (_Parser)
  {
    v2 = [(id)_Parser _arguments];
    v3 = [v2 firstObject];
  }
  else
  {
    v3 = @"unknown";
  }
  return v3;
}

- (SCRCArgumentParser)initWithArgc:(int)a3 argv:(const char *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SCRCArgumentParser;
  v4 = [(SCRCArgumentSubcommand *)&v17 init];
  if (v4)
  {
    v5 = [MEMORY[0x263F08AB0] processInfo];
    v6 = [v5 processName];
    [(SCRCArgumentParser *)v4 setAppName:v6];

    v7 = [(SCRCArgumentParser *)v4 appName];
    uint64_t v8 = [v7 length];

    if (!v8) {
      goto LABEL_6;
    }
    v9 = [MEMORY[0x263F08AB0] processInfo];
    v10 = [v9 arguments];
    [(SCRCArgumentParser *)v4 set_arguments:v10];

    v11 = [(SCRCArgumentParser *)v4 _arguments];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
LABEL_6:
      v15 = 0;
      goto LABEL_7;
    }
    uint64_t v13 = objc_opt_new();
    subcommandArray = v4->__subcommandArray;
    v4->__subcommandArray = (NSMutableArray *)v13;

    [(SCRCArgumentSubcommand *)v4 addOption:104 argument:0 target:v4 action:sel__displayHelp_ argumentDescription:@"Help." required:0];
    [(SCRCArgumentSubcommand *)v4 addOption:118 argument:0 target:v4 action:sel__displayVersion_ argumentDescription:@"Version information." required:0];
  }
  v15 = v4;
LABEL_7:

  return v15;
}

- (void)addSubcommand:(id)a3
{
  id v7 = a3;
  v4 = [(SCRCArgumentParser *)self _subcommandArray];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(SCRCArgumentParser *)self _subcommandArray];
    [v6 addObject:v7];
  }
}

- (BOOL)parse
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  [(SCRCArgumentParser *)self set_subcommand:0];
  v3 = [(SCRCArgumentParser *)self _arguments];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    char v5 = [(SCRCArgumentParser *)self _arguments];
    v6 = [v5 objectAtIndexedSubscript:1];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v7 = [(SCRCArgumentParser *)self _subcommandArray];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v13 = [v12 subcommandName];
          int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            [(SCRCArgumentParser *)self set_subcommand:v12];
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  v15 = (void *)MEMORY[0x263EFF980];
  v16 = [(SCRCArgumentSubcommand *)self optionArray];
  objc_super v17 = [v15 arrayWithArray:v16];

  v18 = [(SCRCArgumentParser *)self _subcommand];
  v19 = [v18 optionArray];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [(SCRCArgumentParser *)self _subcommand];
    v22 = [v21 optionArray];
    [v17 addObjectsFromArray:v22];
  }
  if ([v17 count])
  {
    v23 = self;
    v46 = [MEMORY[0x263EFF980] array];
    [MEMORY[0x263EFFA40] standardUserDefaults];
    v45 = v44 = v17;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v24 = v17;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v52;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          uint64_t v30 = [v29 option];
          if (v30)
          {
            v31 = (void *)v30;
            v32 = [NSString stringWithFormat:@"-%@", v30];
            v33 = [(SCRCArgumentParser *)v23 _arguments];
            int v34 = [v33 containsObject:v32];

            if (v34)
            {
              v35 = [v29 argument];
              uint64_t v36 = [v35 length];

              if (v36)
              {
                v37 = [v45 objectForKey:v31];
                if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  [(SCRCArgumentParser *)v23 _subcommand];

LABEL_44:
                  objc_super v17 = v44;

LABEL_46:
                  BOOL v41 = 0;
                  goto LABEL_47;
                }
                [v29 setArgument:v37];
                [v46 addObject:v29];
              }
              else
              {
                [v46 addObject:v29];
              }
            }
            else if ([v29 required])
            {
              v37 = [(SCRCArgumentParser *)v23 _subcommand];
              goto LABEL_44;
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v24 = v46;
    uint64_t v38 = [v24 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v48;
      objc_super v17 = v44;
      BOOL v41 = 1;
      while (2)
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v48 != v40) {
            objc_enumerationMutation(v24);
          }
          if (([*(id *)(*((void *)&v47 + 1) + 8 * k) process] & 1) == 0)
          {
            v31 = [(SCRCArgumentParser *)v23 _subcommandArray];
            [v31 count];
            goto LABEL_46;
          }
        }
        uint64_t v39 = [v24 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v41 = 1;
      objc_super v17 = v44;
    }
LABEL_47:
  }
  else
  {
    BOOL v41 = 1;
  }

  return v41;
}

- (int)run
{
  v2 = [(SCRCArgumentParser *)self _subcommand];
  int v3 = [v2 run];

  return v3;
}

- (void)stop
{
  id v2 = [(SCRCArgumentParser *)self _subcommand];
  [v2 stop];
}

- (id)_displayVersion:(id)a3
{
  return (id)[NSNumber numberWithBool:0];
}

- (id)_displayHelp:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(id)objc_opt_class() versionString];
  char v5 = [(SCRCArgumentParser *)self _subcommand];
  if (v5)
  {
    v6 = [(SCRCArgumentParser *)self _subcommand];
    id v7 = [v6 optionArray];
  }
  else
  {
    id v7 = [(SCRCArgumentSubcommand *)self optionArray];
  }

  uint64_t v8 = objc_msgSend(v7, "sortedArrayUsingSelector:");
  uint64_t v9 = [(SCRCArgumentParser *)self _subcommand];
  if (v9)
  {
    uint64_t v10 = [(SCRCArgumentParser *)self _subcommand];
    v11 = [v10 subcommandName];
  }
  else
  {
    v11 = @"<subcommand>";
  }

  [v8 count];
  uint64_t v12 = [(SCRCArgumentParser *)self _subcommand];
  uint64_t v13 = [v12 formattedHelpHeader];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v39 = v13;
    objc_super v17 = v7;
    v18 = v11;
    v19 = v4;
    id v20 = 0;
    uint64_t v21 = *(void *)v41;
    do
    {
      uint64_t v22 = 0;
      v23 = v20;
      do
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(id *)(*((void *)&v40 + 1) + 8 * v22);

        id v24 = [v20 argument];
        [v24 length];

        ++v22;
        v23 = v20;
      }
      while (v16 != v22);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v16);

    unint64_t v4 = v19;
    v11 = v18;
    id v7 = v17;
    uint64_t v13 = v39;
  }

  uint64_t v25 = [(SCRCArgumentParser *)self _subcommand];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = v14;
LABEL_17:

    id v14 = v27;
    goto LABEL_18;
  }
  v32 = [(SCRCArgumentParser *)self _subcommandArray];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    int v34 = [(SCRCArgumentParser *)self _subcommandArray];
    uint64_t v27 = [v34 sortedArrayUsingSelector:sel_compare_];

    uint64_t v26 = [v27 objectEnumerator];
    v35 = [v26 nextObject];
    uint64_t v36 = [v35 subcommandName];

    if (v36)
    {
      do
      {
        [v36 length];
        v37 = [v26 nextObject];
        uint64_t v38 = [v37 subcommandName];

        uint64_t v36 = (void *)v38;
      }
      while (v38);
    }
    goto LABEL_17;
  }
LABEL_18:
  v28 = [(SCRCArgumentParser *)self _subcommand];
  v29 = [v28 formattedHelpFooter];

  uint64_t v30 = [NSNumber numberWithBool:0];

  return v30;
}

- (id)setRunningAtStartup:(id)a3
{
  [(SCRCArgumentParser *)self setIsLaunchedAtLogin:1];
  memset(&context, 0, sizeof(context));
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, @"watchForConsoleUserChanges", (SCDynamicStoreCallBack)_consoleUserChanged, &context);
  if (!v3)
  {
    id v13 = [(id)_Parser appName];
    id v14 = (const char *)[v13 UTF8String];
    pid_t v15 = getpid();
    syslog(3, "%s[%d]: could not open session with configd\n", v14, v15);

    id v16 = [(id)_Parser appName];
    objc_super v17 = (const char *)[v16 UTF8String];
    pid_t v18 = getpid();
    int v19 = SCError();
    id v20 = SCErrorString(v19);
    syslog(3, "%s[%d]: error = %s\n", v17, v18, v20);

    goto LABEL_9;
  }
  unint64_t v4 = v3;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, 0);
  CFRelease(0);
  int v6 = SCDynamicStoreSetNotificationKeys(v4, Mutable, 0);
  CFRelease(Mutable);
  if (v6)
  {
    id v7 = [(id)_Parser appName];
    [v7 UTF8String];
    getpid();
    syslog(3, "%s[%d]: could not register notification keys\n");
  }
  else
  {
    CFRunLoopSourceRef RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4, 0);
    if (RunLoopSource)
    {
      uint64_t v22 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v22, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      CFRelease(v22);
      goto LABEL_8;
    }
    id v7 = [(id)_Parser appName];
    [v7 UTF8String];
    getpid();
    syslog(3, "%s[%d]: could not create runloop source\n");
  }

  id v8 = [(id)_Parser appName];
  uint64_t v9 = (const char *)[v8 UTF8String];
  pid_t v10 = getpid();
  int v11 = SCError();
  uint64_t v12 = SCErrorString(v11);
  syslog(3, "%s[%d]: error = %s\n", v9, v10, v12);

LABEL_8:
  CFRelease(v4);
LABEL_9:
  id v24 = [NSNumber numberWithBool:1];
  return v24;
}

- (BOOL)isLaunchedAtLogin
{
  return self->_isLaunchedAtLogin;
}

- (void)setIsLaunchedAtLogin:(BOOL)a3
{
  self->_isLaunchedAtLogin = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSMutableArray)_subcommandArray
{
  return self->__subcommandArray;
}

- (void)set_subcommandArray:(id)a3
{
}

- (SCRCArgumentSubcommand)_subcommand
{
  return self->__subcommand;
}

- (void)set_subcommand:(id)a3
{
}

- (NSArray)_arguments
{
  return self->__arguments;
}

- (void)set_arguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__arguments, 0);
  objc_storeStrong((id *)&self->__subcommand, 0);
  objc_storeStrong((id *)&self->__subcommandArray, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end