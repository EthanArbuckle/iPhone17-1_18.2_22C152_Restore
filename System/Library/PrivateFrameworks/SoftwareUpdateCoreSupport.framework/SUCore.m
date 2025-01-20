@interface SUCore
+ (BOOL)arrayIsEqual:(id)a3 to:(id)a4;
+ (BOOL)dataIsEqual:(id)a3 to:(id)a4;
+ (BOOL)dateIsEqual:(id)a3 to:(id)a4;
+ (BOOL)dictionaryIsEqual:(id)a3 to:(id)a4;
+ (BOOL)errorIsEqual:(id)a3 to:(id)a4;
+ (BOOL)numberIsEqual:(id)a3 to:(id)a4;
+ (BOOL)objectIsEqual:(id)a3 to:(id)a4;
+ (BOOL)setFileMetadata:(const char *)a3 forKey:(id)a4 value:(id)a5;
+ (BOOL)stringIsEqual:(id)a3 to:(id)a4;
+ (id)beginTransactionWithName:(id)a3;
+ (id)errorNameForCode:(int64_t)a3;
+ (id)getFileMetadata:(const char *)a3 forKey:(id)a4;
+ (id)limitString:(id)a3 toMaxLength:(unint64_t)a4 providingSubstitutionMap:(id)a5;
+ (id)sharedCore;
+ (id)sharedSUCoreDomainAppending:(id)a3;
+ (id)stringFromDate:(id)a3;
+ (id)stringFromTriState:(int64_t)a3;
+ (void)endTransaction:(id)a3 withName:(id)a4;
- (NSString)baseDomain;
- (NSString)filesystemBaseDir;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)delegateCallbackQueue;
- (OS_dispatch_queue)miscellaneousTaksQueue;
- (OS_dispatch_queue)waitedOperationQueue;
- (SUCore)init;
- (id)buildError:(int64_t)a3 underlying:(id)a4 description:(id)a5;
- (id)commonDomain;
- (id)commonFilesystemBaseDir;
- (id)selectCompletionQueue:(id)a3;
- (id)selectDelegateCallbackQueue:(id)a3;
- (void)setBaseDomain:(id)a3;
- (void)setFilesystemBaseDir:(id)a3;
@end

@implementation SUCore

+ (id)sharedCore
{
  if (sharedCore_coreOnce != -1) {
    dispatch_once(&sharedCore_coreOnce, &__block_literal_global_2);
  }
  v2 = (void *)sharedCore_core;
  return v2;
}

- (id)commonDomain
{
  v2 = [(SUCore *)self baseDomain];
  if (!v2) {
    v2 = @"com.apple.su";
  }
  return v2;
}

- (NSString)baseDomain
{
  return self->_baseDomain;
}

- (SUCore)init
{
  v23.receiver = self;
  v23.super_class = (Class)SUCore;
  v2 = [(SUCore *)&v23 init];
  v3 = v2;
  if (v2)
  {
    baseDomain = v2->_baseDomain;
    v2->_baseDomain = 0;

    filesystemBaseDir = v3->_filesystemBaseDir;
    v3->_filesystemBaseDir = 0;

    v6 = (const char *)[@"com.apple.su.completions" UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v8;

    v10 = (const char *)[@"com.apple.su.delegate_callbacks" UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    delegateCallbackQueue = v3->_delegateCallbackQueue;
    v3->_delegateCallbackQueue = (OS_dispatch_queue *)v12;

    v14 = (const char *)[@"com.apple.su.waited_operations" UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    waitedOperationQueue = v3->_waitedOperationQueue;
    v3->_waitedOperationQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)[@"com.apple.su.misc_tasks" UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    miscellaneousTaksQueue = v3->_miscellaneousTaksQueue;
    v3->_miscellaneousTaksQueue = (OS_dispatch_queue *)v20;
  }
  return v3;
}

+ (BOOL)stringIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToString:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)setBaseDomain:(id)a3
{
}

uint64_t __20__SUCore_sharedCore__block_invoke()
{
  sharedCore_core = objc_alloc_init(SUCore);
  return MEMORY[0x1F41817F8]();
}

- (id)commonFilesystemBaseDir
{
  v2 = [(SUCore *)self filesystemBaseDir];
  if (!v2) {
    v2 = @"/var/tmp/SoftwareUpdateCore";
  }
  return v2;
}

- (id)selectCompletionQueue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v5 = [(SUCore *)self completionQueue];
  }

  return v5;
}

- (id)selectDelegateCallbackQueue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v5 = [(SUCore *)self delegateCallbackQueue];
  }

  return v5;
}

- (id)buildError:(int64_t)a3 underlying:(id)a4 description:(id)a5
{
  return (id)[MEMORY[0x1E4F28C58] buildCheckedSUCoreError:a3 underlying:a4 description:a5];
}

+ (id)beginTransactionWithName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = +[SUCore sharedSUCoreDomainAppending:a3];
  id v4 = +[SUCoreLog sharedLogger];
  unint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1B4EC2000, v5, OS_LOG_TYPE_DEFAULT, "[TRANSACTION] BEGIN with domain %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = v3;
  [v6 UTF8String];
  v7 = (void *)os_transaction_create();

  return v7;
}

+ (void)endTransaction:(id)a3 withName:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[SUCore sharedSUCoreDomainAppending:a4];
  v7 = +[SUCoreLog sharedLogger];

  char v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = @"NOTNULL";
    if (!v5) {
      int v9 = @"NULL";
    }
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[TRANSACTION] END   with domain %{public}@ (transaction=%{public}@)", (uint8_t *)&v10, 0x16u);
  }
}

+ (id)sharedSUCoreDomainAppending:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ![v3 isEqualToString:&stru_1F0D92C90])
  {
    id v9 = [NSString alloc];
    id v6 = +[SUCore sharedCore];
    v7 = [v6 commonDomain];
    uint64_t v8 = [v9 initWithFormat:@"%@.%@", v7, v4];
  }
  else
  {
    id v5 = [NSString alloc];
    id v6 = +[SUCore sharedCore];
    v7 = [v6 commonDomain];
    uint64_t v8 = [v5 initWithString:v7];
  }
  int v10 = (void *)v8;

  return v10;
}

+ (id)errorNameForCode:(int64_t)a3
{
  return +[SUCoreErrorInformation nameForSUCoreCode:a3];
}

+ (BOOL)dictionaryIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToDictionary:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)arrayIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToArray:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)numberIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToNumber:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)dataIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToData:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)dateIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        char v8 = [(id)v5 isEqualToDate:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)errorIsEqual:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  int v10 = 10;
  uint64_t v11 = (uint64_t)v8;
  uint64_t v12 = (uint64_t)v7;
  while (v12 | v11)
  {
    if (!v12) {
      goto LABEL_11;
    }
    if (!v11) {
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    v13 = [(id)v12 domain];
    uint64_t v14 = [(id)v11 domain];
    int v15 = [v13 isEqualToString:v14];

    if (!v15 || (uint64_t v16 = [(id)v12 code], v16 != objc_msgSend((id)v11, "code")))
    {
LABEL_11:
      BOOL v21 = 0;
      goto LABEL_12;
    }
    v17 = [(id)v12 userInfo];
    uint64_t v18 = [v17 safeObjectForKey:v9 ofClass:objc_opt_class()];

    v19 = [(id)v11 userInfo];
    uint64_t v20 = [v19 safeObjectForKey:v9 ofClass:objc_opt_class()];

    uint64_t v11 = v20;
    uint64_t v12 = v18;
    if (!--v10)
    {
      BOOL v21 = 1;
      uint64_t v12 = v18;
      uint64_t v11 = v20;
      goto LABEL_12;
    }
  }
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

+ (BOOL)objectIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6) {
      char v8 = [(id)v5 isEqual:v6];
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (id)limitString:(id)a3 toMaxLength:(unint64_t)a4 providingSubstitutionMap:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (__CFString *)v7;
  int v10 = v9;
  uint64_t v11 = v9;
  if (a4)
  {
    uint64_t v11 = v9;
    if ([(__CFString *)v9 length] > a4)
    {
      if (v8)
      {
        uint64_t v12 = [v8 count] + 1;
        uint64_t v11 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"KEYMAP(%llu)", v12);

        v13 = (void *)[[NSString alloc] initWithFormat:@"  %@ = %@", v11, v10];
        if (v13) {
          [v8 addObject:v13];
        }
      }
      else
      {
        uint64_t v11 = @"(present)";
        unint64_t v14 = [@"(present)" length];

        if (v14 > a4) {
          uint64_t v11 = @"X";
        }
      }
    }
  }

  return v11;
}

+ (id)stringFromDate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (stringFromDate__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      unint64_t v5 = [(id)stringFromDate____dateFormatter stringFromDate:v4];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&stringFromDate__onceToken, &__block_literal_global_57);
    if (v4) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = @"none";
LABEL_6:

  return v5;
}

void __25__SUCore_stringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)stringFromDate____dateFormatter;
  stringFromDate____dateFormatter = (uint64_t)v0;

  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)stringFromDate____dateFormatter setLocale:v4];
  [(id)stringFromDate____dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  v2 = (void *)stringFromDate____dateFormatter;
  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];
}

+ (id)stringFromTriState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"SUCoreTriStateUnknown";
  }
  else {
    return off_1E60B6A38[a3];
  }
}

+ (id)getFileMetadata:(const char *)a3 forKey:(id)a4
{
  unint64_t v5 = (const char *)[a4 UTF8String];
  ssize_t v6 = getxattr(a3, v5, 0, 0, 0, 1);
  if (v6 < 0)
  {
    id v10 = 0;
  }
  else
  {
    size_t v7 = v6;
    id v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v6];
    ssize_t v9 = getxattr(a3, v5, (void *)[v8 mutableBytes], v7, 0, 1);
    if (v9 < 0)
    {
      id v10 = 0;
    }
    else
    {
      [v8 setLength:v9];
      id v10 = v8;
    }
  }
  return v10;
}

+ (BOOL)setFileMetadata:(const char *)a3 forKey:(id)a4 value:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  ssize_t v9 = (const char *)[v7 UTF8String];
  id v10 = v8;
  uint64_t v11 = (const void *)[v10 bytes];
  size_t v12 = [v10 length];

  return setxattr(a3, v9, v11, v12, 0, 1) == 0;
}

- (NSString)filesystemBaseDir
{
  return self->_filesystemBaseDir;
}

- (void)setFilesystemBaseDir:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return self->_delegateCallbackQueue;
}

- (OS_dispatch_queue)waitedOperationQueue
{
  return self->_waitedOperationQueue;
}

- (OS_dispatch_queue)miscellaneousTaksQueue
{
  return self->_miscellaneousTaksQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneousTaksQueue, 0);
  objc_storeStrong((id *)&self->_waitedOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_filesystemBaseDir, 0);
  objc_storeStrong((id *)&self->_baseDomain, 0);
}

@end