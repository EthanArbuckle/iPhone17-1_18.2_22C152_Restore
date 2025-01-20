@interface NSURL(PRSAdditions)
- (BOOL)prs_isPosterSnapshot;
- (BOOL)prs_isPurgable;
- (BOOL)prs_unmarkAsPurgable;
- (uint64_t)prs_URLExists:()PRSAdditions;
- (uint64_t)prs_isDirectory;
- (uint64_t)prs_setPurgable:()PRSAdditions afterDate:error:;
- (void)prs_unmarkAsPurgable;
@end

@implementation NSURL(PRSAdditions)

- (BOOL)prs_isPosterSnapshot
{
  v1 = [a1 lastPathComponent];
  if ([v1 hasPrefix:@"SNAPSHOT"])
  {
    v2 = [v1 pathExtension];
    if ([v2 caseInsensitiveCompare:@"atx"]) {
      BOOL v3 = [v2 caseInsensitiveCompare:@"png"] == 0;
    }
    else {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)prs_isDirectory
{
  id v4 = 0;
  [a1 getResourceValue:&v4 forKey:*MEMORY[0x1E4F1C5C0] error:0];
  id v1 = v4;
  uint64_t v2 = [v1 isEqual:*MEMORY[0x1E4F1C5B8]];

  return v2;
}

- (BOOL)prs_isPurgable
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  fsctl((const char *)[a1 fileSystemRepresentation], 0x40304A6DuLL, &v3, 0);
  return (~(_WORD)v3 & 0xE00) == 0 || (void)v4 != 0;
}

- (uint64_t)prs_setPurgable:()PRSAdditions afterDate:error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v7 = a1;
    v8 = (const char *)[v7 fileSystemRepresentation];
    if (!objc_msgSend(v7, "prs_isDirectory")) {
      goto LABEL_7;
    }
    memset(v32, 0, sizeof(v32));
    fsctl(v8, 0x40184A03uLL, v32, 0);
    if (LODWORD(v32[0]) == 1) {
      goto LABEL_7;
    }
    uint64_t v31 = 0;
    long long v30 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    *(_OWORD *)&v15[8] = 0u;
    *(void *)v15 = 0x100000001;
    if (fsctl(v8, 0xC1104A71uLL, v15, 0))
    {
      uint64_t v9 = 0;
    }
    else
    {
LABEL_7:
      memset((char *)v32 + 8, 0, 40);
      *(void *)&v32[0] = 66048;
      if (v6)
      {
        *(void *)&v32[1] = 0x80000;
        [v6 timeIntervalSince1970];
        *(void *)&v32[2] = 1000000000 * (unint64_t)v10;
      }
      int v11 = fsctl(v8, 0xC0304A6FuLL, v32, 0);
      uint64_t v9 = v11 == 0;
      if (v11)
      {
        int v12 = v11;
        v13 = PRSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v15 = 138412802;
          *(void *)&v15[4] = v7;
          *(_WORD *)&v15[12] = 2112;
          *(void *)&v15[14] = v6;
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = v12;
          _os_log_error_impl(&dword_1A78AC000, v13, OS_LOG_TYPE_ERROR, "Error marking '%@' as purgable %@ - %d", v15, 0x1Cu);
        }
      }
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend(a1, "prs_unmarkAsPurgable");
  }

  return v9;
}

- (BOOL)prs_unmarkAsPurgable
{
  id v1 = a1;
  uint64_t v5 = 0;
  int v2 = fsctl((const char *)[v1 fileSystemRepresentation], 0xC0084A44uLL, &v5, 0);
  if (v2)
  {
    long long v3 = PRSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(NSURL(PRSAdditions) *)(uint64_t)v1 prs_unmarkAsPurgable];
    }
  }
  return v2 == 0;
}

- (uint64_t)prs_URLExists:()PRSAdditions
{
  if (([a1 isFileURL] & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"NSURL_PRSAdditions.m", 136, @"Invalid parameter not satisfying: %@", @"[self isFileURL]" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [a1 path];
  uint64_t v8 = [v6 fileExistsAtPath:v7 isDirectory:a3];

  return v8;
}

- (void)prs_unmarkAsPurgable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A78AC000, log, OS_LOG_TYPE_ERROR, "Error marking '%@' as purgable - %d", (uint8_t *)&v3, 0x12u);
}

@end