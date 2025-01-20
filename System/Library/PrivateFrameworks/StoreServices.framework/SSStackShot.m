@interface SSStackShot
+ (id)generateSymbolicatedStackShot;
+ (id)generateSymbolicatedStackShotPromise;
@end

@implementation SSStackShot

+ (id)generateSymbolicatedStackShot
{
  v2 = [a1 generateSymbolicatedStackShotPromise];
  v3 = [v2 resultWithTimeout:0 error:10.0];

  return v3;
}

+ (id)generateSymbolicatedStackShotPromise
{
  if (+[SSDevice deviceIsInternalBuild])
  {
    v2 = objc_alloc_init(SSPromise);
    v3 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
    v4 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SSStackShot_generateSymbolicatedStackShotPromise__block_invoke;
    v10[3] = &unk_1E5BA7018;
    v5 = v2;
    v11 = v5;
    v12 = v3;
    id v6 = v3;
    dispatch_async(v4, v10);

    v7 = v12;
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __51__SSStackShot_generateSymbolicatedStackShotPromise__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  if (CSIsNull())
  {
    v2 = *(void **)(a1 + 32);
    SSError(@"SSErrorDomain", 100, @"Stack Shot Failed", @"Failed to create symbolicator");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:");
  }
  else
  {
    mach_absolute_time();
    CSSymbolicatorGetArchitecture();
    int v3 = CSArchitectureIs64Bit();
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = a1;
    id obj = *(id *)(a1 + 40);
    uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v22)
    {
      unint64_t v24 = 0;
      if (v3) {
        uint64_t v4 = 16;
      }
      else {
        uint64_t v4 = 8;
      }
      uint64_t v19 = *(void *)v28;
      uint64_t v20 = v4;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = [*(id *)(*((void *)&v27 + 1) + 8 * i) unsignedIntegerValue];
          CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
          CSSymbolicatorGetSymbolWithAddressAtTime();
          v26 = 0;
          uint64_t Range = CSSymbolGetRange();
          Name = (const char *)CSSymbolGetName();
          if (Name) {
            asprintf(&v26, " %s + %llu", Name, v6 - Range);
          }
          CSSymbolOwnerGetSourceInfoWithAddress();
          uint64_t Filename = CSSourceInfoGetFilename();
          v25 = 0;
          if (Filename)
          {
            v10 = (const char *)Filename;
            int LineNumber = CSSourceInfoGetLineNumber();
            asprintf(&v25, " (%s:%u)", v10, LineNumber);
          }
          uint64_t v12 = CSSymbolOwnerGetName();
          if (v12) {
            v13 = (const char *)v12;
          }
          else {
            v13 = "";
          }
          v15 = v25;
          v14 = v26;
          if (!v26) {
            v14 = "";
          }
          if (!v25) {
            v15 = "";
          }
          v16 = objc_msgSend(NSString, "stringWithFormat:", @"%-3d %-30s\t0x%0*llx%s%s\n", v24 + i, v13, v20, v6, v14, v15);
          if (v26) {
            free(v26);
          }
          if (v25) {
            free(v25);
          }
          [v21 appendString:v16];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        unint64_t v24 = (v24 + i);
      }
      while (v22);
    }

    [*(id *)(v17 + 32) finishWithResult:v21];
  }
}

@end