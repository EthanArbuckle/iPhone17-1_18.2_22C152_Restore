@interface VMUClassPatternMatcher
- (BOOL)_matchesClassInfo:(id)a3;
- (BOOL)_parseMallocSizePattern:(id)a3 error:(id *)a4;
- (BOOL)_regex:(id *)a3 matchesName:(id)a4;
- (BOOL)isMatchingKindOfClass;
- (BOOL)matchesNodeDetails:(id)a3 orNodeDescription:(id)a4;
- (VMUClassPatternMatcher)initWithPattern:(id)a3 forArgument:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)resetCachedMatches;
- (void)setMatchingKindOfClass:(BOOL)a3;
@end

@implementation VMUClassPatternMatcher

- (BOOL)isMatchingKindOfClass
{
  return self->_matchingKindOfClass;
}

- (void)setMatchingKindOfClass:(BOOL)a3
{
  if (self->_matchingKindOfClass != a3)
  {
    self->_matchingKindOfClass = a3;
    memoizedRegexResult = self->_memoizedRegexResult;
    if (memoizedRegexResult) {
      CFDictionaryRemoveAllValues(memoizedRegexResult);
    }
  }
}

- (VMUClassPatternMatcher)initWithPattern:(id)a3 forArgument:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  if (v8)
  {
    v49.receiver = self;
    v49.super_class = (Class)VMUClassPatternMatcher;
    self = [(VMUClassPatternMatcher *)&v49 init];
    if (self)
    {
      if (!v9) {
        v9 = &stru_1EFE27F38;
      }
      v10 = [MEMORY[0x1E4F28E58] letterCharacterSet];
      [v10 addCharactersInString:@"_.([@"];
      if ([(__CFString *)v8 rangeOfCharacterFromSet:v10])
      {
        if (!a5)
        {
LABEL_9:

          v17 = 0;
LABEL_23:

          goto LABEL_24;
        }
        VMUOptionParserError(-1, @"error in %@ <classes> pattern '%@' - cannot match the start of a class name", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
LABEL_8:
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if ([(__CFString *)v8 hasSuffix:@"]"])
      {
        uint64_t v18 = [(__CFString *)v8 rangeOfString:@"[" options:4];
        if (!v25)
        {
          if (!a5) {
            goto LABEL_9;
          }
          VMUOptionParserError(-1, @"error in %@ <classes> pattern '%@' - no starting bracket [: %s", v19, v20, v21, v22, v23, v24, (uint64_t)v9);
          goto LABEL_8;
        }
        uint64_t v26 = v18;
        v27 = [(__CFString *)v8 substringFromIndex:v18];
        v28 = [(__CFString *)v8 substringToIndex:v26];

        if (![(VMUClassPatternMatcher *)self _parseMallocSizePattern:v27 error:a5])
        {

          v8 = v28;
          goto LABEL_9;
        }
        if (!v26)
        {

          v28 = @".*";
        }
      }
      else
      {
        v28 = v8;
      }
      if (([(__CFString *)v28 isEqualToString:@"malloc"] & 1) != 0
        || [(__CFString *)v28 isEqualToString:@"non-object"])
      {
        self->_patternMatchesNonObjects = 1;
      }
      else
      {
        v30 = ($019B15D08CAF2F6032DDFBB53180E398 *)malloc_type_malloc(0x20uLL, 0x10700404B019E81uLL);
        self->_classesRegex = v30;
        v8 = v28;
        int v31 = regcomp((regex_t *)v30, (const char *)[(__CFString *)v8 UTF8String], 1);
        if (v31)
        {
          if (!a5) {
            goto LABEL_9;
          }
          regerror(v31, (const regex_t *)self->_classesRegex, v50, 0x800uLL);
          VMUOptionParserError(-1, @"error in %@ <classes> pattern '%@': %s", v32, v33, v34, v35, v36, v37, (uint64_t)v9);
          goto LABEL_8;
        }
        self->_vmRegionsRegex = ($019B15D08CAF2F6032DDFBB53180E398 *)malloc_type_malloc(0x20uLL, 0x10700404B019E81uLL);
        v8 = v8;
        v38 = v8;
        if (([(__CFString *)v8 hasPrefix:@"VM:"] & 1) == 0)
        {
          v38 = v8;
          if (([(__CFString *)v8 hasPrefix:@"Region"] & 1) == 0)
          {
            v38 = v8;
            if (([(__CFString *)v8 hasPrefix:@"Thread"] & 1) == 0)
            {
              v38 = v8;
              if (([(__CFString *)v8 hasPrefix:@".*"] & 1) == 0)
              {
                v38 = [NSString stringWithFormat:@".*%@", v8];
              }
            }
          }
        }
        if (([v38 hasSuffix:@".*"] & 1) == 0)
        {
          uint64_t v39 = [NSString stringWithFormat:@"%@.*", v38];

          v38 = (void *)v39;
        }
        vmRegionsRegex = self->_vmRegionsRegex;
        id v41 = v38;
        int v42 = regcomp((regex_t *)vmRegionsRegex, (const char *)[v41 UTF8String], 1);
        if (v42)
        {
          if (a5)
          {
            regerror(v42, (const regex_t *)self->_vmRegionsRegex, v50, 0x800uLL);
            VMUOptionParserError(-1, @"error in % <region-description> pattern '%@': %s", v43, v44, v45, v46, v47, v48, (uint64_t)v9);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_9;
        }
        self->_memoizedRegexResult = CFDictionaryCreateMutable(0, 0, 0, 0);
      }
      v8 = v28;
    }
    v17 = self;
    goto LABEL_23;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (void)dealloc
{
  classesRegex = self->_classesRegex;
  if (classesRegex) {
    MEMORY[0x1AD0DA620](classesRegex, a2);
  }
  vmRegionsRegex = self->_vmRegionsRegex;
  if (vmRegionsRegex) {
    MEMORY[0x1AD0DA620](vmRegionsRegex, a2);
  }
  memoizedRegexResult = self->_memoizedRegexResult;
  if (memoizedRegexResult) {
    CFRelease(memoizedRegexResult);
  }
  v6.receiver = self;
  v6.super_class = (Class)VMUClassPatternMatcher;
  [(VMUClassPatternMatcher *)&v6 dealloc];
}

- (void)resetCachedMatches
{
}

- (BOOL)_parseMallocSizePattern:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = VMUOptionParserError(-1, @"malloc size pattern '%@' was not of expected format '[size]' or '[lowerSizeBound-upperSizeBound]'", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  id v14 = v6;
  uint64_t v15 = (char *)[v14 UTF8String];
  __s1 = v15;
  if (*v15 != 91)
  {
    id v20 = v13;
    BOOL v19 = 0;
    char v21 = 0;
    int v22 = 0;
    goto LABEL_20;
  }
  int v18 = v15[1];
  uint64_t v16 = v15 + 1;
  LOBYTE(v17) = v18;
  __s1 = v16;
  BOOL v19 = (v18 - 48) < 0xA;
  if ((v18 - 48) > 9)
  {
    int v17 = v17;
  }
  else
  {
    self->_unint64_t allocationSizeLowerBound = _parseAllocationSizeBound((const char **)&__s1);
    uint64_t v16 = __s1;
    int v17 = *__s1;
  }
  if (v17 != 45)
  {
    if (v17 != 43)
    {
      id v20 = 0;
      char v21 = 0;
      int v22 = 0;
      self->_allocationSizeUpperBound = self->_allocationSizeLowerBound;
      goto LABEL_20;
    }
    id v20 = 0;
    int v22 = 0;
    self->_allocationSizeUpperBound = -1;
    __s1 = v16 + 1;
    goto LABEL_14;
  }
  int v23 = v16[1];
  __s1 = v16 + 1;
  if ((v23 - 48) > 9)
  {
    id v20 = 0;
    int v22 = 0;
    self->_allocationSizeUpperBound = -1;
LABEL_14:
    char v21 = 1;
    goto LABEL_20;
  }
  unint64_t v24 = _parseAllocationSizeBound((const char **)&__s1);
  self->_allocationSizeUpperBound = v24;
  if (v24 > 0xF)
  {
    if (v24 >= self->_allocationSizeLowerBound)
    {
      id v20 = 0;
      goto LABEL_19;
    }
    VMUOptionParserError(-1, @"error in malloc size pattern '%@': lower bound of size (%llu) should be <= upper bound of size (%llu)", v25, v26, v27, v28, v29, v30, (uint64_t)v14);
  }
  else
  {
    VMUOptionParserError(-1, @"error in malloc size pattern '%@':  if upper bound of size is given, it must be %llu or more", v25, v26, v27, v28, v29, v30, (uint64_t)v14);
  }
  id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  char v21 = 1;
  int v22 = 1;
LABEL_20:
  if (strcmp(__s1, "]"))
  {
    id v37 = v13;

    id v20 = v37;
  }
  if (((v19 | v22) & 1) == 0)
  {
    id v39 = v13;
LABEL_30:
    id v40 = v39;

    id v20 = v40;
    goto LABEL_31;
  }
  if ((v21 & 1) == 0)
  {
    unint64_t allocationSizeLowerBound = self->_allocationSizeLowerBound;
    if (allocationSizeLowerBound <= 0xF)
    {
      VMUOptionParserError(-1, @"error in malloc size pattern '%@':  size must be %llu or more", v31, v32, v33, v34, v35, v36, (uint64_t)v14);
LABEL_29:
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if ((allocationSizeLowerBound & 0xF) != 0)
    {
      VMUOptionParserError(-1, @"error in malloc size pattern '%@':  size must be a multiple of %llu, or a range like '[lowerSizeBound-upperSizeBound]'", v31, v32, v33, v34, v35, v36, (uint64_t)v14);
      goto LABEL_29;
    }
  }
LABEL_31:
  if (a4 && v20) {
    *a4 = v20;
  }

  return v20 == 0;
}

- (BOOL)_regex:(id *)a3 matchesName:(id)a4
{
  if (!a3) {
    return 0;
  }
  v9.rm_so = 0;
  v9.rm_eo = 0;
  v5 = (const char *)[a4 UTF8String];
  unsigned int v6 = regexec((const regex_t *)a3, v5, 1uLL, &v9, 0);
  unsigned int v7 = v6;
  if (v6 >= 2)
  {
    -[VMUClassPatternMatcher _regex:matchesName:](v6, (const regex_t *)a3);
    return 0;
  }
  else
  {
    BOOL result = 0;
    if (!v7 && !v9.rm_so) {
      return v9.rm_eo == strlen(v5);
    }
  }
  return result;
}

- (BOOL)_matchesClassInfo:(id)a3
{
  id v4 = a3;
  if (v4 && (memoizedRegexResult = self->_memoizedRegexResult) != 0)
  {
    value = 0;
    if (!CFDictionaryGetValueIfPresent(memoizedRegexResult, v4, (const void **)&value))
    {
      classesRegex = self->_classesRegex;
      unsigned int v7 = [v4 className];
      LOBYTE(classesRegex) = [(VMUClassPatternMatcher *)self _regex:classesRegex matchesName:v7];

      if (classesRegex) {
        goto LABEL_9;
      }
      uint64_t v8 = [v4 className];
      regmatch_t v9 = [v4 displayName];
      char v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = self->_classesRegex;
        uint64_t v12 = [v4 displayName];
        LOBYTE(v11) = [(VMUClassPatternMatcher *)self _regex:v11 matchesName:v12];

        if (v11) {
          goto LABEL_9;
        }
      }
      if (self->_matchingKindOfClass
        && ([v4 superclassInfo],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            BOOL v14 = [(VMUClassPatternMatcher *)self _matchesClassInfo:v13],
            v13,
            v14))
      {
LABEL_9:
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 0;
      }
      value = (void *)v15;
      CFDictionarySetValue(self->_memoizedRegexResult, v4, (const void *)v15);
    }
    BOOL v16 = value != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)matchesNodeDetails:(id)a3 orNodeDescription:(id)a4
{
  id v6 = a4;
  if (matchesNodeDetails_orNodeDescription__onceToken != -1) {
    dispatch_once(&matchesNodeDetails_orNodeDescription__onceToken, &__block_literal_global_3);
  }
  if (*(void *)(a3.var0 + 8) >> 60 == 1)
  {
    if ((*(void *)(a3.var0 + 16) || !self->_patternMatchesNonObjects)
      && !-[VMUClassPatternMatcher _matchesClassInfo:](self, "_matchesClassInfo:"))
    {
      goto LABEL_15;
    }
  }
  else if (!v6 {
         || ![(VMUClassPatternMatcher *)self _regex:self->_vmRegionsRegex matchesName:v6])
  }
  {
    goto LABEL_15;
  }
  unint64_t allocationSizeLowerBound = self->_allocationSizeLowerBound;
  if (!allocationSizeLowerBound && !self->_allocationSizeUpperBound
    || (unint64_t v8 = *(void *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL, allocationSizeLowerBound <= v8)
    && v8 <= self->_allocationSizeUpperBound)
  {
    BOOL v9 = 1;
    goto LABEL_16;
  }
LABEL_15:
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

void __63__VMUClassPatternMatcher_matchesNodeDetails_orNodeDescription___block_invoke()
{
  uint64_t v0 = +[VMUClassInfo classInfoWithClassName:@"malloc" binaryPath:&stru_1EFE27F38 type:16];
  v1 = (void *)matchesNodeDetails_orNodeDescription__mallocClassInfo;
  matchesNodeDetails_orNodeDescription__mallocClassInfo = v0;
}

- (void)_regex:(int)a1 matchesName:(const regex_t *)a2 .cold.1(int a1, const regex_t *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  regerror(a1, a2, v2, 0x800uLL);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v4 = v2;
    _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s\n", buf, 0xCu);
  }
}

@end