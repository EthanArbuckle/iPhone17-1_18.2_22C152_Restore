@interface NTPBBloomFilterInfo(FCAdditions)
+ (id)fc_emptyBloomFilterInfo;
+ (id)fc_fullBloomFilterInfo;
- (uint64_t)fc_maybeContainsURL:()FCAdditions;
@end

@implementation NTPBBloomFilterInfo(FCAdditions)

+ (id)fc_fullBloomFilterInfo
{
  v0 = objc_opt_new();
  char v3 = -1;
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v3 length:1];
  [v0 setBloomFilterData:v1];

  [v0 setHashFunctionCount:1];
  return v0;
}

+ (id)fc_emptyBloomFilterInfo
{
  v0 = objc_opt_new();
  char v3 = 0;
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v3 length:1];
  [v0 setBloomFilterData:v1];

  [v0 setHashFunctionCount:1];
  return v0;
}

- (uint64_t)fc_maybeContainsURL:()FCAdditions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F82D18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [a1 bloomFilterData];
  v8 = objc_msgSend(v6, "initWithData:hashFunctionCount:", v7, (int)objc_msgSend(a1, "hashFunctionCount"));

  v9 = objc_msgSend(v5, "nb_domain");

  v10 = [v9 lowercaseString];

  if (v10)
  {
    id v11 = v10;
    v12 = (void *)FCWebURLResolutionLog;
    if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = [a1 bloomFilterData];
      *(_DWORD *)buf = 134218499;
      uint64_t v19 = [v14 length];
      __int16 v20 = 1024;
      int v21 = [a1 hashFunctionCount];
      __int16 v22 = 2117;
      id v23 = v11;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "using bloom filter of length %zd, hash function count %d to query %{sensitive}@", buf, 0x1Cu);
    }
    uint64_t v15 = [v8 maybeContainsString:v11];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke;
    v17[3] = &unk_1E5B4C090;
    v17[4] = a1;
    __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke((uint64_t)v17);
    uint64_t v15 = 0;
  }

  return v15;
}

@end