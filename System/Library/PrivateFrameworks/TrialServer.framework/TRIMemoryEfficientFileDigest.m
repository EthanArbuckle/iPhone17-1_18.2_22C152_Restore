@interface TRIMemoryEfficientFileDigest
+ (id)sha256DigestForFile:(id)a3;
@end

@implementation TRIMemoryEfficientFileDigest

+ (id)sha256DigestForFile:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28CB0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3];
  id v21 = 0;
  v6 = [v4 fileHandleForReadingFromURL:v5 error:&v21];
  id v7 = v21;

  if (v6)
  {
    v8 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
    memset(&c, 0, sizeof(c));
    uint64_t v9 = CC_SHA256_Init(&c);
    while (1)
    {
      v10 = (void *)MEMORY[0x1E016E7F0](v9);
      id v20 = 0;
      v11 = [v6 readDataUpToLength:0x20000 error:&v20];
      id v12 = v20;
      if (!v11) {
        break;
      }
      if (![v11 length])
      {

        v17 = v8;
        v18 = (unsigned __int8 *)[v17 mutableBytes];
        if (!v18)
        {
          id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
          objc_exception_throw(v19);
        }
        CC_SHA256_Final(v18, &c);
        v15 = v17;
        goto LABEL_12;
      }
      id v13 = v11;
      CC_SHA256_Update(&c, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v3;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to read from %{public}@ during digest creation with error %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      c.count[0] = 138543618;
      *(void *)&c.count[1] = v3;
      LOWORD(c.hash[1]) = 2114;
      *(void *)((char *)&c.hash[1] + 2) = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to create handle for %{public}@ with error %{public}@", (uint8_t *)&c, 0x16u);
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

@end