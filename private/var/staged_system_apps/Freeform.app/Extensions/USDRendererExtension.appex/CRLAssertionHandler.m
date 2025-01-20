@interface CRLAssertionHandler
+ (BOOL)isQAFatalAssertionsEnabled;
+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4;
+ (id)packedBacktraceString;
+ (id)packedBacktraceStringWithReturnAddresses:(id)a3;
+ (id)performBlockIgnoringAssertions:(id)a3;
+ (id)performBlockIgnoringAssertionsAndReturnList:(id)a3;
+ (id)performBlockIgnoringFatalAssertions:(id)a3;
+ (id)performBlockIgnoringQAFatalAssertions:(id)a3;
+ (int)_atomicIncrementAssertCount;
+ (void)_logBacktraceWithCallStackSymbols:(id)a3;
+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 description:(const char *)a7;
+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 format:(id)a7 args:(char *)a8;
+ (void)logFullBacktrace;
+ (void)simulateCrashWithMessage:(id)a3;
@end

@implementation CRLAssertionHandler

+ (id)performBlockIgnoringAssertions:(id)a3
{
  v3 = [a1 p_performBlockIgnoringAssertions:a3 onlyFatal:0];
  v4 = [v3 lastObject];

  return v4;
}

+ (id)performBlockIgnoringAssertionsAndReturnList:(id)a3
{
  return [a1 p_performBlockIgnoringAssertions:a3 onlyFatal:0];
}

+ (id)performBlockIgnoringFatalAssertions:(id)a3
{
  v3 = [a1 p_performBlockIgnoringAssertions:a3 onlyFatal:1];
  v4 = [v3 lastObject];

  return v4;
}

+ (id)performBlockIgnoringQAFatalAssertions:(id)a3
{
  id v4 = a3;
  v5 = [a1 p_performBlockIgnoringAssertions:v4 onlyFatal:[a1 isQAFatalAssertionsEnabled]];

  v6 = [v5 lastObject];

  return v6;
}

+ (BOOL)isQAFatalAssertionsEnabled
{
  return 0;
}

+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4
{
  v5 = (void (**)(void))a3;
  v6 = +[NSMutableArray array];
  id v7 = objc_retainBlock((id)qword_100095B00);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CE8C;
  v14[3] = &unk_1000820D0;
  BOOL v16 = a4;
  id v8 = v6;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  v10 = (void *)qword_100095B00;
  qword_100095B00 = (uint64_t)v9;

  v5[2](v5);
  id v11 = objc_retainBlock(v7);
  v12 = (void *)qword_100095B00;
  qword_100095B00 = (uint64_t)v11;

  return v8;
}

+ (void)logFullBacktrace
{
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &stru_1000820F0);
  }
  v3 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10005DBC0(v3);
  }
  [a1 simulateCrashWithMessage:@"+[CRLAssert logBacktrace]"];
}

+ (void)_logBacktraceWithCallStackSymbols:(id)a3
{
  id v4 = a3;
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &stru_100082110);
  }
  v5 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10005DC6C(v5, (uint64_t)v4);
  }
  [a1 simulateCrashWithMessage:@"+[CRLAssert logBacktrace]"];
}

+ (id)packedBacktraceString
{
  v3 = +[NSThread callStackReturnAddresses];
  id v4 = [a1 packedBacktraceStringWithReturnAddresses:v3];

  return v4;
}

+ (id)packedBacktraceStringWithReturnAddresses:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableData data];
  v5 = +[NSMutableSet set];
  if (qword_100095B08 != -1) {
    dispatch_once(&qword_100095B08, &stru_100082130);
  }
  id v55 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v73;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v73 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v72 + 1) + 8 * i) pointerValue];
        memset(&v79, 0, sizeof(v79));
        if (dladdr(v11, &v79))
        {
          v12 = +[NSValue valueWithPointer:v79.dli_fbase];
          if (([v5 containsObject:v12] & 1) == 0)
          {
            [v5 addObject:v12];
            os_unfair_lock_lock((os_unfair_lock_t)&dword_100095B20);
            v13 = [(id)qword_100095B18 objectForKeyedSubscript:v12];
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_100095B20);
            if (v13)
            {
              v14 = v55;
              id v15 = v13;
            }
            else
            {
              v14 = v6;
              id v15 = v12;
            }
            [v14 addObject:v15];
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v8);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v68 objects:v78 count:16];
  v54 = v16;
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v69;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v69 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
        v22 = (const mach_header_64 *)[v21 pointerValue];
        int magic = v22->magic;
        if ((int)v22->magic > -17958195)
        {
          if (magic != -17958193)
          {
            if (magic != -17958194) {
              continue;
            }
LABEL_28:
            p_reserved = (const mach_header_64 *)&v22->reserved;
            goto LABEL_30;
          }
        }
        else
        {
          if (magic == -822415874) {
            goto LABEL_28;
          }
          if (magic != -805638658) {
            continue;
          }
        }
        p_reserved = v22 + 1;
LABEL_30:
        uint32_t ncmds = v22->ncmds;
        if (ncmds)
        {
          unsigned int v26 = 1;
          while (1)
          {
            uint64_t cputype = p_reserved->cputype;
            if (p_reserved->magic == 27 && cputype == 24) {
              break;
            }
            p_reserved = (const mach_header_64 *)((char *)p_reserved + cputype);
            if (p_reserved) {
              BOOL v29 = v26 >= ncmds;
            }
            else {
              BOOL v29 = 1;
            }
            ++v26;
            if (v29) {
              goto LABEL_44;
            }
          }
          v79.dli_fname = 0;
          v30 = getsegmentdata(v22, "__TEXT", (unint64_t *)&v79);
          if (v30)
          {
            v31 = v30;
            v32 = +[NSMutableDictionary dictionaryWithSharedKeySet:qword_100095B10];
            id v33 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&p_reserved->cpusubtype];
            [v32 setObject:v33 forKeyedSubscript:@"uuid"];

            v34 = +[NSValue valueWithPointer:v31];
            [v32 setObject:v34 forKeyedSubscript:@"loadaddr"];

            os_unfair_lock_lock((os_unfair_lock_t)&dword_100095B20);
            [(id)qword_100095B18 setObject:v32 forKeyedSubscript:v21];
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_100095B20);
            [v55 addObject:v32];

            id v16 = v54;
          }
        }
LABEL_44:
        ;
      }
      id v18 = [v16 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v18);
  }

  id v67 = [v55 count];
  [v4 appendBytes:&v67 length:8];
  id v66 = [obj count];
  [v4 appendBytes:&v66 length:8];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v35 = v55;
  id v36 = [v35 countByEnumeratingWithState:&v62 objects:v77 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v63;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v62 + 1) + 8 * (void)k);
        v79.dli_fname = 0;
        v79.dli_fbase = 0;
        v41 = [v40 objectForKeyedSubscript:@"uuid"];
        [v41 getUUIDBytes:&v79];

        id v61 = 0;
        v42 = [v40 objectForKeyedSubscript:@"loadaddr"];
        id v43 = [v42 pointerValue];

        id v61 = v43;
        [v4 appendBytes:&v79 length:16];
        [v4 appendBytes:&v61 length:8];
      }
      id v37 = [v35 countByEnumeratingWithState:&v62 objects:v77 count:16];
    }
    while (v37);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v44 = obj;
  id v45 = [v44 countByEnumeratingWithState:&v57 objects:v76 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v58;
    do
    {
      for (m = 0; m != v46; m = (char *)m + 1)
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v57 + 1) + 8 * (void)m);
        v79.dli_fname = 0;
        v79.dli_fname = (const char *)[v49 pointerValue];
        [v4 appendBytes:&v79 length:8];
      }
      id v46 = [v44 countByEnumeratingWithState:&v57 objects:v76 count:16];
    }
    while (v46);
  }

  id v50 = objc_alloc_init((Class)NSMutableData);
  v51 = [v4 crl_compressWithAlgorithm:774 operation:0];
  LODWORD(v61) = 843347010;
  [v50 appendBytes:&v61 length:4];
  v79.dli_fname = (const char *)[v51 length];
  [v50 appendBytes:&v79 length:8];
  [v50 appendData:v51];
  v52 = [v50 base64EncodedStringWithOptions:0];

  return v52;
}

+ (void)simulateCrashWithMessage:(id)a3
{
  id v3 = a3;
  if (qword_100095B30 != -1)
  {
    id v7 = v3;
    dispatch_once(&qword_100095B30, &stru_100082150);
    id v3 = v7;
  }
  id v4 = (void (*)(uint64_t, void, id))off_100095B28;
  if (off_100095B28)
  {
    id v6 = v3;
    uint64_t v5 = getpid();
    v4(v5, 0, v6);
    id v3 = v6;
  }
}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 format:(id)a7 args:(char *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [objc_alloc((Class)NSString) crl_initUnRedactedWithFormat:v16 arguments:a8];

  if (qword_100095B00)
  {
    (*(void (**)(void))(qword_100095B00 + 16))();
  }
  else
  {
    v24[0] = @"CRLAssertNotificationDescriptionKey";
    v24[1] = @"CRLAssertNotificationFileKey";
    v25[0] = v17;
    v25[1] = v15;
    v24[2] = @"CRLAssertNotificationLineNumberKey";
    id v18 = +[NSNumber numberWithInteger:a5];
    v25[2] = v18;
    v25[3] = v14;
    v24[3] = @"CRLAssertNotificationFunctionNameKey";
    v24[4] = @"CRLAssertNotificationAssertionCountKey";
    uint64_t v19 = atomic_load((unsigned int *)dword_100095B38);
    v20 = +[NSNumber numberWithInt:v19];
    v25[4] = v20;
    v24[5] = @"CRLAssertNotificationFatalnessNameKey";
    v21 = +[NSNumber numberWithBool:v10];
    v25[5] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 postNotificationName:@"CRLAssertNotification" object:a1 userInfo:v22];
  }
}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 description:(const char *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NSString stringWithUTF8String:a7];
  [a1 handleFailureInFunction:v13 file:v12 lineNumber:a5 isFatal:v8 format:v14 args:&v15];
}

+ (int)_atomicIncrementAssertCount
{
  return atomic_fetch_add(dword_100095B38, 1u);
}

@end