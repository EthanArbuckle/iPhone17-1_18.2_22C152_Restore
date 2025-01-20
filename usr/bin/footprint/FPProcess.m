@interface FPProcess
+ (FPProcess)processWithBsdInfo:(proc_bsdinfo *)a3;
+ (FPProcess)processWithPid:(int)a3;
+ (id)_nameForBsdInfo:(proc_bsdinfo *)a3;
+ (id)allProcessesExcludingPids:(id)a3;
+ (id)childPidsForPids:(id)a3;
+ (id)pidsForStringDescriptions:(id)a3 errors:(id *)a4;
+ (id)removeIdleExitCleanProcessesFrom:(id)a3;
- (BOOL)_isAlive;
- (BOOL)_populateTask;
- (BOOL)breakDownPhysFootprint;
- (BOOL)hiddenFromDisplay;
- (BOOL)is64bit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTranslated;
- (FPProcess)init;
- (FPProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (FPSharedCache)sharedCache;
- (NSArray)memoryRegions;
- (NSDictionary)auxData;
- (NSString)displayString;
- (NSString)name;
- (id)asNumber;
- (id)description;
- (id)errors;
- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5;
- (id)globalErrors;
- (id)warnings;
- (int)idleExitStatus;
- (int)pid;
- (int)priority;
- (unint64_t)_gatherPageSize;
- (unint64_t)hash;
- (unint64_t)pageSize;
- (void)_addGlobalError:(id)a3;
- (void)gatherData;
- (void)setDisplayString:(id)a3;
- (void)setHiddenFromDisplay:(BOOL)a3;
- (void)setIs64bit:(BOOL)a3;
- (void)setIsTranslated:(BOOL)a3;
- (void)setMemoryRegions:(id)a3;
- (void)setName:(id)a3;
- (void)setPageSize:(unint64_t)a3;
- (void)setPid:(int)a3;
- (void)setSharedCache:(id)a3;
@end

@implementation FPProcess

- (FPProcess)init
{
  v12.receiver = self;
  v12.super_class = (Class)FPProcess;
  v2 = [(FPProcess *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(FPProcess *)v2 setMemoryRegions:0];
    uint64_t v4 = objc_opt_new();
    errors = v3->_errors;
    v3->_errors = (NSMutableArray *)v4;

    uint64_t v6 = objc_opt_new();
    warnings = v3->_warnings;
    v3->_warnings = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    globalErrors = v3->_globalErrors;
    v3->_globalErrors = (NSMutableArray *)v8;

    *(void *)&v3->_idleExitStatus = 0xFFFFFFFF00000000;
    v10 = v3;
  }

  return v3;
}

- (FPProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  uint64_t v4 = [(FPProcess *)self init];
  v5 = v4;
  if (v4)
  {
    [(FPProcess *)v4 setPid:a3->pbi_pid];
    v5->_is64bit = (a3->pbi_flags & 0x10) != 0;
    if (![(FPProcess *)v5 _populateTask])
    {
      v10 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = +[FPProcess _nameForBsdInfo:a3];
    [(FPProcess *)v5 setName:v6];

    v7 = [(FPProcess *)v5 name];
    uint64_t v8 = +[NSString stringWithFormat:@"%@ [%d]", v7, [(FPProcess *)v5 pid]];
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v8;

    v5->_pageSize = [(FPProcess *)v5 _gatherPageSize];
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

+ (FPProcess)processWithBsdInfo:(proc_bsdinfo *)a3
{
  v3 = &off_100028638;
  if (a3->pbi_flags) {
    v3 = off_100028630;
  }
  id v4 = [objc_alloc(*v3) initWithBsdInfo:a3];

  return (FPProcess *)v4;
}

+ (FPProcess)processWithPid:(int)a3
{
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  int v4 = sub_100006A78(a3, v7);
  v5 = 0;
  if (v4)
  {
    v5 = [a1 processWithBsdInfo:v7];
  }

  return (FPProcess *)v5;
}

- (void)_addGlobalError:(id)a3
{
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  int pid = self->_pid;
  return pid == [a3 pid];
}

- (BOOL)_populateTask
{
  return 0;
}

- (void)gatherData
{
}

- (id)globalErrors
{
  return self->_globalErrors;
}

- (id)errors
{
  return +[NSArray arrayWithArray:self->_errors];
}

- (id)warnings
{
  return self->_warnings;
}

+ (id)_nameForBsdInfo:(proc_bsdinfo *)a3
{
  *(void *)v18 = 0x800000001;
  size_t size = 0;
  size_t v17 = 8;
  if (!sysctl(v18, 2u, &size, &v17, 0, 0))
  {
    *(void *)v18 = 0x3100000001;
    pbi_int pid = a3->pbi_pid;
    int v4 = (char *)malloc_type_malloc(size, 0x2A8C5BC3uLL);
    if (v4)
    {
      v5 = v4;
      if (!sysctl(v18, 3u, v4, &size, 0, 0))
      {
        size_t v6 = 0;
        v5[size - 1] = 0;
        do
        {
          size_t v7 = v6;
          if (v5[v6++]) {
            BOOL v9 = size > v7;
          }
          else {
            BOOL v9 = 0;
          }
        }
        while (v9);
        if (size > v7)
        {
          do
          {
            size_t v10 = v6 - 1;
            if (v5[v6++ - 1]) {
              BOOL v12 = 0;
            }
            else {
              BOOL v12 = size > v10;
            }
          }
          while (v12);
          if (size > v10)
          {
            id v13 = [objc_alloc((Class)NSString) initWithUTF8String:&v5[v6 - 2]];
            v14 = [v13 lastPathComponent];

            free(v5);
            goto LABEL_18;
          }
        }
      }
      free(v5);
    }
  }
  v14 = sub_100006B78((uint64_t)FPProcess, (uint64_t)a3);
LABEL_18:

  return v14;
}

- (id)asNumber
{
  return +[NSNumber numberWithLong:self->_pid];
}

+ (id)allProcessesExcludingPids:(id)a3
{
  id v3 = a3;
  unint64_t v18 = 0;
  int v4 = (unsigned int *)sub_100006F04(&v18);
  if (v4)
  {
    v5 = v4;
    size_t v17 = +[NSMapTable strongToStrongObjectsMapTable];
    unint64_t v6 = v18;
    if (v18)
    {
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        uint64_t v9 = v5[34 * v7 + 3];
        size_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9, v17);
        unsigned __int8 v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          BOOL v12 = +[FPProcess processWithBsdInfo:&v5[34 * v7]];
          if (v12)
          {
            id v13 = +[NSNumber numberWithInt:v9];
            [v17 setObject:v12 forKey:v13];
          }
        }
        uint64_t v7 = v8;
      }
      while (v6 > v8++);
    }
    free(v5);
    v15 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)pidsForStringDescriptions:(id)a3 errors:(id *)a4
{
  id v6 = a3;
  uint64_t v53 = 0;
  v35 = (unsigned int *)sub_100006F04(&v53);
  if (v35)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    v36 = a4;
    if (a4) {
      v33 = objc_opt_new();
    }
    else {
      v33 = 0;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v32 = v6;
    id obj = v6;
    id v39 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v39)
    {
      uint64_t v8 = v53;
      uint64_t v37 = v53;
      uint64_t v38 = *(void *)v50;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v50 != v38) {
            objc_enumerationMutation(obj);
          }
          size_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v11 = [objc_alloc((Class)NSScanner) initWithString:v10];
          int v48 = -1;
          unsigned int v12 = [v11 scanInt:&v48];
          v43 = +[NSMutableDictionary dictionary];
          v42 = v11;
          if (v8)
          {
            v40 = i;
            char v13 = 0;
            char v14 = 0;
            v15 = v35;
            while (1)
            {
              uint64_t v16 = v15[3];
              id v17 = [a1 _nameForBsdInfo:v15];
              if ([v10 isEqualToString:v17])
              {
                unint64_t v18 = +[NSNumber numberWithInt:v16];
                [v7 setObject:v10 forKeyedSubscript:v18];
                char v13 = 1;
              }
              else
              {
                if (![v17 containsString:v10])
                {
                  if (v16 == v48) {
                    unsigned int v19 = v12;
                  }
                  else {
                    unsigned int v19 = 0;
                  }
                  if (v19 == 1)
                  {
                    v29 = +[NSNull null];
                    v30 = +[NSNumber numberWithInt:v16];
                    [v7 setObject:v29 forKeyedSubscript:v30];

                    i = v40;
                    goto LABEL_41;
                  }
                  goto LABEL_23;
                }
                unint64_t v18 = +[NSNumber numberWithInt:v16];
                [v43 setObject:v10 forKeyedSubscript:v18];
              }

              char v14 = 1;
LABEL_23:
              v15 += 34;

              if (!--v8)
              {
                if (!((v36 == 0) | v14 & 1))
                {
                  id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to find pid for process matching '%@'", v10];
                  [v33 addObject:v20];
                }
                i = v40;
                if (v13) {
                  goto LABEL_42;
                }
                goto LABEL_30;
              }
            }
          }
          if (v36)
          {
            id v21 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to find pid for process matching '%@'", v10];
            [v33 addObject:v21];
          }
LABEL_30:
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v17 = v43;
          id v22 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v45;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
                v27 = [v7 objectForKeyedSubscript:v26];

                if (!v27)
                {
                  v28 = [v17 objectForKeyedSubscript:v26];
                  [v7 setObject:v28 forKeyedSubscript:v26];
                }
              }
              id v23 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
            }
            while (v23);
          }
LABEL_41:

LABEL_42:

          uint64_t v8 = v37;
        }
        id v39 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v39);
    }

    if (v36 && [v33 count]) {
      id *v36 = [v33 copy];
    }
    free(v35);

    id v6 = v32;
  }
  else
  {
    uint64_t v7 = 0;
    if (a4) {
      *a4 = &off_10002C170;
    }
  }

  return v7;
}

+ (id)childPidsForPids:(id)a3
{
  id v3 = a3;
  unint64_t v25 = 0;
  int v4 = (char *)sub_100006F04(&v25);
  if (v4)
  {
    id v20 = +[NSMutableArray array];
    id v5 = [v3 mutableCopy];
    id v19 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      while (1)
      {
        id v6 = v5;
        if (!objc_msgSend(v5, "count", v19)) {
          break;
        }
        if (v25)
        {
          for (unint64_t i = 0; i < v25; ++i)
          {
            uint64_t v8 = &v4[136 * i];
            int v9 = *((_DWORD *)v8 + 4);
            uint64_t v10 = *((int *)v8 + 3);
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v11 = v6;
            id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v22;
              while (2)
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v22 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  if (v9 == [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) longValue])
                  {
                    uint64_t v16 = +[NSNumber numberWithLong:v10];
                    if (([v3 containsObject:v16] & 1) == 0
                      && ([v20 containsObject:v16] & 1) == 0)
                    {
                      [v19 addObject:v16];
                    }

                    goto LABEL_19;
                  }
                }
                id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
                if (v13) {
                  continue;
                }
                break;
              }
            }
LABEL_19:
          }
        }
        [v20 addObjectsFromArray:v19];
        [v6 removeAllObjects];
        id v5 = v19;

        id v19 = v6;
        if (!v5)
        {
          id v17 = 0;
          id v19 = v6;
          goto LABEL_24;
        }
      }
      id v17 = v5;
    }
    else
    {
      id v17 = 0;
    }
LABEL_24:
    free(v4);
    int v4 = v20;
  }

  return v4;
}

+ (id)removeIdleExitCleanProcessesFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v3 objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 idleExitStatus] == 2)
        {
          id v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 pid]);
          [v4 removeObjectForKey:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSDictionary)auxData
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (BOOL)_isAlive
{
  return 0;
}

- (BOOL)breakDownPhysFootprint
{
  return sub_1000113C4();
}

- (id)description
{
  uint64_t v3 = [(FPProcess *)self pid];
  id v4 = [(FPProcess *)self name];
  id v5 = +[NSString stringWithFormat:@"FPProcess[%d] %@", v3, v4];

  return v5;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  return 0;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_int pid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)is64bit
{
  return self->_is64bit;
}

- (void)setIs64bit:(BOOL)a3
{
  self->_is64bit = a3;
}

- (BOOL)isTranslated
{
  return self->_isTranslated;
}

- (void)setIsTranslated:(BOOL)a3
{
  self->_isTranslated = a3;
}

- (FPSharedCache)sharedCache
{
  return self->_sharedCache;
}

- (void)setSharedCache:(id)a3
{
}

- (NSArray)memoryRegions
{
  return self->_memoryRegions;
}

- (void)setMemoryRegions:(id)a3
{
}

- (int)idleExitStatus
{
  return self->_idleExitStatus;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (BOOL)hiddenFromDisplay
{
  return self->_hiddenFromDisplay;
}

- (void)setHiddenFromDisplay:(BOOL)a3
{
  self->_hiddenFromDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_memoryRegions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_globalErrors, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_errors, 0);

  objc_storeStrong((id *)&self->_sharedCache, 0);
}

@end