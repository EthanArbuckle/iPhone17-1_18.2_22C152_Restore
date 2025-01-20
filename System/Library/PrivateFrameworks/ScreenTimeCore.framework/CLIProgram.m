@interface CLIProgram
+ (BOOL)handleFormatOption:(id)a3 longOption:(id)a4 argument:(id)a5;
+ (CLIProgram)sharedProgram;
+ (id)commandToOptionsDict;
+ (id)globalOptionSet;
+ (id)nextOptionParser;
+ (void)handleFormatOptionInDictionary:(id)a3;
+ (void)registerGlobalFormatOption;
- (BOOL)startRunLoop;
- (CLIProgram)init;
- (CLIProgramDelegate)delegate;
- (NSString)commandName;
- (NSString)programName;
- (int)main;
- (void)endRunLoopWithSuccess:(BOOL)a3;
- (void)registerAllCLICommands;
- (void)setDelegate:(id)a3;
- (void)setProgramName:(id)a3;
@end

@implementation CLIProgram

+ (id)globalOptionSet
{
  return [(id)qword_1000159C0 _copiedSet];
}

+ (id)commandToOptionsDict
{
  v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)qword_1000159B8;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend((id)qword_1000159B8, "objectForKey:", v8, (void)v13);
        v10 = [v9 _copiedSet];
        v11 = [v8 name];
        [v2 setObject:v10 forKeyedSubscript:v11];
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (CLIProgram)sharedProgram
{
  if ((id)objc_opt_class() != a1)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"CLIProgram.m" lineNumber:52 description:@"Calling +sharedProgram will not return a CLIProgram subclass"];
  }
  if (qword_1000159D8 != -1) {
    dispatch_once(&qword_1000159D8, &stru_1000104F0);
  }
  id v4 = (void *)qword_1000159E0;
  return (CLIProgram *)v4;
}

- (CLIProgram)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLIProgram;
  v2 = [(CLIProgram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    runLoopStateLock = v2->_runLoopStateLock;
    v2->_runLoopStateLock = v3;

    v2->_runLoopState = 0;
  }
  return v2;
}

+ (void)registerGlobalFormatOption
{
}

+ (BOOL)handleFormatOption:(id)a3 longOption:(id)a4 argument:(id)a5
{
  id v7 = a5;
  unsigned int v8 = [a4 isEqualToString:@"format"];
  if (v8) {
    sub_10000962C((uint64_t)a1, v7);
  }

  return v8;
}

+ (void)handleFormatOptionInDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"format"];
  if (v4) {
    sub_10000962C((uint64_t)a1, v4);
  }
  _objc_release_x1();
}

+ (id)nextOptionParser
{
  v2 = +[NSProcessInfo processInfo];
  uint64_t v3 = [v2 arguments];

  uint64_t v4 = qword_100015998;
  id v5 = (char *)[v3 count];
  objc_super v6 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v4, &v5[-qword_100015998]);
  id v7 = [v3 objectsAtIndexes:v6];
  unsigned int v8 = v7;
  if (qword_100015998)
  {
    if ([v7 count])
    {
      v9 = [v8 objectAtIndexedSubscript:0];
      v10 = [v8 objectAtIndexedSubscript:0];
      v11 = +[CLICommand registeredCommandWithName:v10];

      if (v11)
      {
LABEL_6:

        goto LABEL_8;
      }
      if (v9)
      {
        long long v14 = +[CLICommand registeredCommandNames];
        uint64_t v15 = +[CLISuggest correctionForWord:v9 fromCorpus:v14];

        if (v15)
        {
          sub_10000A8A4(@"ambiguous command \"%@\" - did you mean \"%@\"?", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v9);
        }
        else
        {
          sub_10000A8A4(@"unknown command \"%@\"", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v9);
          sub_1000074CC(0);
        }
        exit(64);
      }
    }
    v11 = +[CLICommand registeredCommandWithName:@"help"];
    v9 = 0;
    goto LABEL_6;
  }
  v11 = 0;
LABEL_8:
  v12 = +[CLIOptionParser optionParserWithArguments:v8 forCommand:v11];

  return v12;
}

- (void)registerAllCLICommands
{
  uint64_t v2 = objc_opt_class();
  for (i = objc_opt_new(); ; [i removeAllObjects])
  {
    unsigned int outCount = 0;
    uint64_t v4 = objc_copyClassList(&outCount);
    if (outCount)
    {
      for (unint64_t j = 0; j < outCount; ++j)
      {
        objc_super v6 = v4[j];
        if (v6 != (objc_class *)v2)
        {
          Name = class_getName(v4[j]);
          if (strncmp(Name, "NSKVONotifying_", 0xFuLL))
          {
            Superclass = v6;
            while (1)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass) {
                break;
              }
              if (Superclass == (objc_class *)v2)
              {
                if ([(objc_class *)v6 enabled]) {
                  [i addObject:v6];
                }
                break;
              }
            }
          }
        }
      }
    }
    free(v4);
    int ClassList = objc_getClassList(0, 0);
    if (ClassList < 0 || ClassList == outCount) {
      break;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = i;
  v11 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (k = 0; k != v12; ++k)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_opt_new();
        objc_msgSend(v15, "register", v16);
      }
      v12 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
}

- (NSString)programName
{
  programName = self->_programName;
  if (programName)
  {
    uint64_t v3 = programName;
  }
  else
  {
    id v5 = +[NSProcessInfo processInfo];
    objc_super v6 = [v5 processName];
    id v7 = self->_programName;
    self->_programName = v6;

    uint64_t v3 = v6;
  }
  return v3;
}

- (int)main
{
  uint64_t v3 = +[NSProcessInfo processInfo];
  uint64_t v4 = [v3 environment];
  id v5 = [v4 objectForKeyedSubscript:@"PWD"];

  chdir((const char *)[v5 fileSystemRepresentation]);
  id v7 = [(CLIProgram *)self delegate];
  sub_100009974((uint64_t)self);
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v7 shouldAutomaticallyRegisterCommands]) {
    [(CLIProgram *)self registerAllCLICommands];
  }
  if (objc_opt_respondsToSelector()) {
    [v7 registerGlobalOptions];
  }
  unsigned int v8 = +[CLIProgram nextOptionParser];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v7 parseGlobalOptions:v8])
  {
    int v15 = 1;
  }
  else
  {
    v9 = +[CLIProgram nextOptionParser];
    [v9 validateArguments];
    id v10 = [v9 command];
    v12 = [v9 commandName];
    uint64_t v13 = v12;
    if (!v12)
    {
      uint64_t v13 = [v10 name];
    }
    if (self) {
      objc_setProperty_nonatomic_copy(self, v11, v13, 40);
    }
    if (!v12) {

    }
    unsigned int v14 = [v10 runWithOptions:v9];
    int v15 = v14 ^ 1;
  }

  exit(v15);
}

- (BOOL)startRunLoop
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRef Main = CFRunLoopGetMain();
  if (!CFEqual(Current, Main))
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:313 description:@"-startRunLoop must be called on the main thread"];
  }
  objc_super v6 = self->_runLoopStateLock;
  objc_sync_enter(v6);
  if (self->_runLoopState)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:316 description:@"-startRunLoop called more than once"];
  }
  self->_int64_t runLoopState = 1;
  objc_sync_exit(v6);

  CFRunLoopRun();
  id v7 = self->_runLoopStateLock;
  objc_sync_enter(v7);
  int64_t runLoopState = self->_runLoopState;
  if ((runLoopState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:324 description:@"run loop exited without endRunLoopWithSuccess: being called"];
  }
  self->_int64_t runLoopState = 0;
  objc_sync_exit(v7);

  return runLoopState == 2;
}

- (void)endRunLoopWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v6 = self->_runLoopStateLock;
  objc_sync_enter(v6);
  if (self->_runLoopState != 1)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:333 description:@"-endRunLoopWithSuccess: called without -startRunLoop"];
  }
  int64_t v7 = 2;
  if (!v3) {
    int64_t v7 = 3;
  }
  self->_int64_t runLoopState = v7;
  objc_sync_exit(v6);

  CFRunLoopRef Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (CLIProgramDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProgramName:(id)a3
{
}

- (NSString)commandName
{
  return self->_commandName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_runLoopStateLock, 0);
  objc_storeStrong((id *)&self->_programName, 0);
}

@end