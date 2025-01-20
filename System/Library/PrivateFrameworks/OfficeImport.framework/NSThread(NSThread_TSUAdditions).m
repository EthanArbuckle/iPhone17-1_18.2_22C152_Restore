@interface NSThread(NSThread_TSUAdditions)
+ (__CFString)tsu_currentThreadName;
@end

@implementation NSThread(NSThread_TSUAdditions)

+ (__CFString)tsu_currentThreadName
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v0 = [MEMORY[0x263F08B88] isMainThread];
  char v1 = v0;
  v2 = @"MT";
  if (v0) {
    v3 = @"MT";
  }
  else {
    v3 = 0;
  }
  v4 = v3;
  if ((v1 & 1) == 0
    && ([MEMORY[0x263F08A48] currentQueue],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 name],
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v2)
    || ![(__CFString *)v2 length])
  {
    label = dispatch_queue_get_label(0);
    if (label)
    {
      uint64_t v7 = [NSString stringWithCString:label encoding:1];

      v2 = (__CFString *)v7;
    }
    if (!v2) {
      goto LABEL_13;
    }
  }
  if (![(__CFString *)v2 length])
  {
LABEL_13:
    long long v31 = 0u;
    memset(v32, 0, 28);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = pthread_self();
    pthread_getname_np(v8, (char *)&v15, 0x12CuLL);
    if ((_BYTE)v15)
    {
      uint64_t v9 = [NSString stringWithCString:&v15 encoding:1];

      v2 = (__CFString *)v9;
    }
    if (!v2) {
      goto LABEL_23;
    }
  }
  if (!-[__CFString length](v2, "length", v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
          v32[0],
          *(void *)&v32[1],
          *((void *)&v32[1] + 1)))
  {
LABEL_23:
    v10 = objc_msgSend(MEMORY[0x263F08B88], "currentThread", (void)v15);
    uint64_t v11 = [v10 name];

    v2 = (__CFString *)v11;
    if (!v11) {
      goto LABEL_17;
    }
  }
  if (![(__CFString *)v2 length])
  {
LABEL_17:
    v12 = [MEMORY[0x263F08B88] currentThread];
    uint64_t v13 = [v12 description];

    v2 = (__CFString *)v13;
  }
  return v2;
}

@end