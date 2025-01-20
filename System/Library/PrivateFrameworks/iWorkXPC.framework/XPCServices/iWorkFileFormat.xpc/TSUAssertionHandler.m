@interface TSUAssertionHandler
+ (BOOL)isQAFatalAssertionsEnabled;
+ (BOOL)shouldLogAssertionBacktrace;
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
+ (void)logBacktraceThrottled;
+ (void)logFullBacktrace;
+ (void)setDelegate:(id)a3;
@end

@implementation TSUAssertionHandler

+ (id)performBlockIgnoringAssertions:(id)a3
{
  id v3 = objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0);
  return [v3 lastObject];
}

+ (id)performBlockIgnoringAssertionsAndReturnList:(id)a3
{
  return objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0);
}

+ (id)performBlockIgnoringFatalAssertions:(id)a3
{
  id v3 = objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 1);
  return [v3 lastObject];
}

+ (id)performBlockIgnoringQAFatalAssertions:(id)a3
{
  id v3 = objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, objc_msgSend(a1, "isQAFatalAssertionsEnabled"));
  return [v3 lastObject];
}

+ (BOOL)isQAFatalAssertionsEnabled
{
  return 1;
}

+ (BOOL)shouldLogAssertionBacktrace
{
  return (byte_1001EB9A8 & 1) == 0;
}

+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4
{
  id v6 = +[NSMutableArray array];
  uint64_t v7 = qword_1001EB9B0;
  char v8 = byte_1001EB9A8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B97A8;
  v10[3] = &unk_1001CEE60;
  BOOL v11 = a4;
  v10[4] = v6;
  qword_1001EB9B0 = (uint64_t)v10;
  byte_1001EB9A8 = 1;
  (*((void (**)(id))a3 + 2))(a3);
  byte_1001EB9A8 = v8;
  qword_1001EB9B0 = v7;
  return v6;
}

+ (void)logBacktraceThrottled
{
  double v3 = CACurrentMediaTime();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001EB9C0);
  if (v3 - *(double *)&qword_1001EA6C0 > 1.0)
  {
    qword_1001EA6C0 = *(void *)&v3;
    qword_1001EB9B8 = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001EB9C0);
LABEL_4:
    [a1 logFullBacktrace];
    return;
  }
  unint64_t v4 = ++qword_1001EB9B8;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001EB9C0);
  if (v4 <= 0xA) {
    goto LABEL_4;
  }
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEE80);
  }
  v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016AECC(v5);
  }
}

+ (void)logFullBacktrace
{
  double v3 = [+[NSThread currentThread] threadDictionary];
  id v4 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"logBacktrace_lastStackAddress"];
  id v5 = [(NSArray *)+[NSThread callStackReturnAddresses] copy];
  if (v4 && [v4 isEqualToArray:v5])
  {
    [a1 _logBacktraceWithCallStackSymbols:&off_1001D6FD8];
  }
  else
  {
    objc_msgSend(a1, "_logBacktraceWithCallStackSymbols:", +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    [(NSMutableDictionary *)v3 setObject:v5 forKeyedSubscript:@"logBacktrace_lastStackAddress"];
  }
}

+ (void)_logBacktraceWithCallStackSymbols:(id)a3
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEEA0);
  }
  id v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016AF10((uint64_t)a3, v5);
  }
  [a1 simulateCrashWithMessage:@"+[TSUAssert logBacktrace]"];
}

+ (id)packedBacktraceString
{
  double v3 = +[NSThread callStackReturnAddresses];
  return _[a1 packedBacktraceStringWithReturnAddresses:v3];
}

+ (id)packedBacktraceStringWithReturnAddresses:(id)a3
{
  id v4 = +[NSMutableData data];
  id v5 = +[NSMutableSet set];
  if (qword_1001EB9C8 != -1) {
    dispatch_once(&qword_1001EB9C8, &stru_1001CEEC0);
  }
  id v48 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v64 objects:v72 count:16];
  id v46 = a3;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v65;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "pointerValue", v46);
        memset(&v71, 0, sizeof(v71));
        if (dladdr(v11, &v71))
        {
          v12 = +[NSValue valueWithPointer:v71.dli_fbase];
          if (([v5 containsObject:v12] & 1) == 0)
          {
            [v5 addObject:v12];
            os_unfair_lock_lock((os_unfair_lock_t)&dword_1001EB9E0);
            v13 = (NSValue *)[(id)qword_1001EB9D8 objectForKeyedSubscript:v12];
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001EB9E0);
            if (v13)
            {
              v14 = v48;
              v15 = v13;
            }
            else
            {
              v14 = v6;
              v15 = v12;
            }
            [v14 addObject:v15];
            a3 = v46;
          }
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v8);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v70, 16, v46);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v61;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v61 != v18) {
          objc_enumerationMutation(v6);
        }
        v20 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        v21 = (const mach_header_64 *)[v20 pointerValue];
        int magic = v21->magic;
        if ((int)v21->magic > -17958195)
        {
          if (magic != -17958193)
          {
            if (magic != -17958194) {
              continue;
            }
LABEL_27:
            p_reserved = (const mach_header_64 *)&v21->reserved;
            goto LABEL_29;
          }
        }
        else
        {
          if (magic == -822415874) {
            goto LABEL_27;
          }
          if (magic != -805638658) {
            continue;
          }
        }
        p_reserved = v21 + 1;
LABEL_29:
        uint32_t ncmds = v21->ncmds;
        if (ncmds)
        {
          unsigned int v25 = 1;
          while (1)
          {
            uint64_t cputype = p_reserved->cputype;
            if (p_reserved->magic == 27 && cputype == 24) {
              break;
            }
            p_reserved = (const mach_header_64 *)((char *)p_reserved + cputype);
            if (p_reserved) {
              BOOL v28 = v25 >= ncmds;
            }
            else {
              BOOL v28 = 1;
            }
            ++v25;
            if (v28) {
              goto LABEL_43;
            }
          }
          v71.dli_fname = 0;
          v29 = getsegmentdata(v21, "__TEXT", (unint64_t *)&v71);
          if (v29)
          {
            v30 = v29;
            v31 = +[NSMutableDictionary dictionaryWithSharedKeySet:qword_1001EB9D0];
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", [objc_alloc((Class)NSUUID) initWithUUIDBytes:&p_reserved->cpusubtype], @"uuid");
            [(NSMutableDictionary *)v31 setObject:+[NSValue valueWithPointer:v30] forKeyedSubscript:@"loadaddr"];
            os_unfair_lock_lock((os_unfair_lock_t)&dword_1001EB9E0);
            [(id)qword_1001EB9D8 setObject:v31 forKeyedSubscript:v20];
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001EB9E0);
            [v48 addObject:v31];
          }
        }
LABEL_43:
        ;
      }
      id v17 = [v6 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v17);
  }

  id v59 = [v48 count];
  [v4 appendBytes:&v59 length:8];
  id v58 = [v47 count];
  [v4 appendBytes:&v58 length:8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v32 = [v48 countByEnumeratingWithState:&v54 objects:v69 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v48);
        }
        v36 = *(void **)(*((void *)&v54 + 1) + 8 * (void)k);
        v71.dli_fname = 0;
        v71.dli_fbase = 0;
        objc_msgSend(objc_msgSend(v36, "objectForKeyedSubscript:", @"uuid"), "getUUIDBytes:", &v71);
        id v53 = 0;
        id v53 = objc_msgSend(objc_msgSend(v36, "objectForKeyedSubscript:", @"loadaddr"), "pointerValue");
        [v4 appendBytes:&v71 length:16];
        [v4 appendBytes:&v53 length:8];
      }
      id v33 = [v48 countByEnumeratingWithState:&v54 objects:v69 count:16];
    }
    while (v33);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v37 = [v47 countByEnumeratingWithState:&v49 objects:v68 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v50;
    do
    {
      for (m = 0; m != v38; m = (char *)m + 1)
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(v47);
        }
        v41 = *(void **)(*((void *)&v49 + 1) + 8 * (void)m);
        v71.dli_fname = 0;
        v71.dli_fname = (const char *)[v41 pointerValue];
        [v4 appendBytes:&v71 length:8];
      }
      id v38 = [v47 countByEnumeratingWithState:&v49 objects:v68 count:16];
    }
    while (v38);
  }
  id v42 = objc_alloc_init((Class)NSMutableData);
  id v43 = objc_msgSend(v4, "tsu_compressWithAlgorithm:operation:", 774, 0);
  LODWORD(v53) = 843347010;
  [v42 appendBytes:&v53 length:4];
  v71.dli_fname = (const char *)[v43 length];
  [v42 appendBytes:&v71 length:8];
  [v42 appendData:v43];
  id v44 = [v42 base64EncodedStringWithOptions:0];

  return v44;
}

+ (void)setDelegate:(id)a3
{
  if (qword_1001EB9E8)
  {
    id v4 = (id)qword_1001EB9E8;
    qword_1001EB9E8 = 0;
  }
  if (a3) {
    qword_1001EB9E8 = (uint64_t)a3;
  }
}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 format:(id)a7 args:(char *)a8
{
  BOOL v9 = a6;
  objc_msgSend(objc_alloc((Class)NSString), "tsu_initUnRedactedWithFormat:arguments:", a7, a8);
  if (qword_1001EB9B0)
  {
    (*(void (**)(void))(qword_1001EB9B0 + 16))();
  }
  else if (qword_1001EB9E8)
  {
    objc_msgSend((id)qword_1001EB9E8, "handleFailureInFunction:file:lineNumber:isFatal:format:message:", a3, a4, a5, v9, a7);
  }
  _objc_release_x7();
}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 description:(const char *)a7
{
  objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:format:args:", a3, a4, a5, a6, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a7), &v7);
}

+ (int)_atomicIncrementAssertCount
{
  return atomic_fetch_add(dword_1001EB9F0, 1u);
}

@end