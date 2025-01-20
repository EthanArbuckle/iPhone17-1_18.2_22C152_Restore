@interface FCVanityURLMapper
- (FCVanityURLMapper)init;
- (FCVanityURLMapper)initWithVanityURLMapping:(id)a3;
- (NTPBVanityURLMapping)vanityURLMapping;
- (id)URLForVanityURL:(id)a3;
- (id)_pathWithTrailingForwardSlashWithPath:(id)a3;
- (id)_standardizedFragmentWithParameters:(id)a3 fragment:(id)a4;
- (id)_standardizedInputPathWithPath:(id)a3;
- (id)_standardizedMappingPathWithPath:(id)a3;
- (id)_standardizedQueryWithParameters:(id)a3 query:(id)a4;
- (void)_setParametersIfNeededWithComponents:(id)a3 parameters:(id)a4;
- (void)_standardizeResultPath:(id)a3;
@end

@implementation FCVanityURLMapper

- (FCVanityURLMapper)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCVanityURLMapper init]";
    __int16 v9 = 2080;
    v10 = "FCVanityURLMapper.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCVanityURLMapper init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCVanityURLMapper)initWithVanityURLMapping:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "vanityURLMapping");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[FCVanityURLMapper initWithVanityURLMapping:]";
    __int16 v13 = 2080;
    v14 = "FCVanityURLMapper.m";
    __int16 v15 = 1024;
    int v16 = 31;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLMapper;
  v5 = [(FCVanityURLMapper *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    vanityURLMapping = v5->_vanityURLMapping;
    v5->_vanityURLMapping = (NTPBVanityURLMapping *)v6;
  }
  return v5;
}

- (id)URLForVanityURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "vanityURL");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCVanityURLMapper URLForVanityURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCVanityURLMapper.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v20) = 43;
    WORD2(v20) = 2114;
    *(void *)((char *)&v20 + 6) = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v20 = __Block_byref_object_copy__86;
  *((void *)&v20 + 1) = __Block_byref_object_dispose__86;
  id v21 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
  uint64_t v6 = [v5 path];
  v7 = [(FCVanityURLMapper *)self _standardizedInputPathWithPath:v6];

  v8 = [(FCVanityURLMapper *)self vanityURLMapping];
  __int16 v9 = [v8 paths];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__FCVanityURLMapper_URLForVanityURL___block_invoke;
  v15[3] = &unk_1E5B5C030;
  v15[4] = self;
  id v10 = v7;
  id v16 = v10;
  id v11 = v5;
  id v17 = v11;
  v18 = buf;
  [v9 enumerateObjectsUsingBlock:v15];

  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __37__FCVanityURLMapper_URLForVanityURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v26 = a2;
  uint64_t v6 = [v26 sourcePath];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v26 destinationPath];

    if (v8)
    {
      __int16 v9 = *(void **)(a1 + 32);
      id v10 = [v26 sourcePath];
      id v11 = [v9 _standardizedMappingPathWithPath:v10];

      id v12 = *(void **)(a1 + 32);
      __int16 v13 = [v26 destinationPath];
      v14 = [v12 _standardizedMappingPathWithPath:v13];

      uint64_t v15 = [*(id *)(a1 + 40) rangeOfString:v11 options:9];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = v15;
        uint64_t v18 = v16;
        uint64_t v19 = (void *)[*(id *)(a1 + 40) mutableCopy];
        objc_msgSend(v19, "replaceCharactersInRange:withString:", v17, v18, v14);
        [*(id *)(a1 + 32) _standardizeResultPath:v19];
        [*(id *)(a1 + 48) setPath:v19];
        long long v20 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v22 = [v26 destinationParameters];
        [v20 _setParametersIfNeededWithComponents:v21 parameters:v22];

        uint64_t v23 = [*(id *)(a1 + 48) URL];
        uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
        v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

        *a4 = 1;
      }
    }
  }
}

- (id)_standardizedInputPathWithPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "path");
    *(_DWORD *)buf = 136315906;
    __int16 v9 = "-[FCVanityURLMapper _standardizedInputPathWithPath:]";
    __int16 v10 = 2080;
    id v11 = "FCVanityURLMapper.m";
    __int16 v12 = 1024;
    int v13 = 79;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCVanityURLMapper *)self _pathWithTrailingForwardSlashWithPath:v4];

  return v5;
}

- (id)_standardizedMappingPathWithPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "path");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCVanityURLMapper _standardizedMappingPathWithPath:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCVanityURLMapper.m";
    __int16 v13 = 1024;
    int v14 = 89;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [NSString stringWithFormat:@"/%@", v4];
  uint64_t v6 = [(FCVanityURLMapper *)self _pathWithTrailingForwardSlashWithPath:v5];

  return v6;
}

- (id)_pathWithTrailingForwardSlashWithPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "path");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCVanityURLMapper _pathWithTrailingForwardSlashWithPath:]";
    __int16 v9 = 2080;
    __int16 v10 = "FCVanityURLMapper.m";
    __int16 v11 = 1024;
    int v12 = 100;
    __int16 v13 = 2114;
    int v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = objc_msgSend(v3, "fc_stringByAppendingStringIfNeeded:", @"/");

  return v4;
}

- (void)_standardizeResultPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "path");
    *(_DWORD *)buf = 136315906;
    uint64_t v6 = "-[FCVanityURLMapper _standardizeResultPath:]";
    __int16 v7 = 2080;
    v8 = "FCVanityURLMapper.m";
    __int16 v9 = 1024;
    int v10 = 107;
    __int16 v11 = 2114;
    int v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  while ([v3 length]
       && objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1) == 47)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
}

- (void)_setParametersIfNeededWithComponents:(id)a3 parameters:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    __int16 v7 = [v6 substringToIndex:1];
    int v8 = [v7 isEqualToString:@"?"];

    if (v8)
    {
      __int16 v9 = [v14 query];
      int v10 = [(FCVanityURLMapper *)self _standardizedQueryWithParameters:v6 query:v9];

      [v14 setPercentEncodedQuery:v10];
    }
    else
    {
      __int16 v11 = [v6 substringToIndex:1];
      int v12 = [v11 isEqualToString:@"#"];

      if (!v12) {
        goto LABEL_7;
      }
      uint64_t v13 = [v14 fragment];
      int v10 = [(FCVanityURLMapper *)self _standardizedFragmentWithParameters:v6 fragment:v13];

      [v14 setFragment:v10];
    }
  }
LABEL_7:
}

- (id)_standardizedQueryWithParameters:(id)a3 query:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "parameters");
    *(_DWORD *)buf = 136315906;
    id v14 = "-[FCVanityURLMapper _standardizedQueryWithParameters:query:]";
    __int16 v15 = 2080;
    uint64_t v16 = "FCVanityURLMapper.m";
    __int16 v17 = 1024;
    int v18 = 136;
    __int16 v19 = 2114;
    long long v20 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    __int16 v7 = (__CFString *)v6;
    int v8 = @"&";
    goto LABEL_7;
  }
  int v8 = &stru_1EF8299B8;
  __int16 v7 = &stru_1EF8299B8;
LABEL_7:
  int v10 = objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", @"?", v8);
  __int16 v11 = [(__CFString *)v7 stringByAppendingString:v10];

  return v11;
}

- (id)_standardizedFragmentWithParameters:(id)a3 fragment:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "parameters");
    *(_DWORD *)buf = 136315906;
    id v14 = "-[FCVanityURLMapper _standardizedFragmentWithParameters:fragment:]";
    __int16 v15 = 2080;
    uint64_t v16 = "FCVanityURLMapper.m";
    __int16 v17 = 1024;
    int v18 = 155;
    __int16 v19 = 2114;
    long long v20 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    __int16 v7 = (__CFString *)v6;
    int v8 = @"&";
    goto LABEL_7;
  }
  int v8 = &stru_1EF8299B8;
  __int16 v7 = &stru_1EF8299B8;
LABEL_7:
  int v10 = objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", @"#", v8);
  __int16 v11 = [(__CFString *)v7 stringByAppendingString:v10];

  return v11;
}

- (NTPBVanityURLMapping)vanityURLMapping
{
  return self->_vanityURLMapping;
}

- (void).cxx_destruct
{
}

@end