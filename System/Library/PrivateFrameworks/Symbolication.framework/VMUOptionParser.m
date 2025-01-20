@interface VMUOptionParser
- (BOOL)abortOnError;
- (BOOL)parametersShowAsAssignment;
- (BOOL)singleHyphenLongNames;
- (NSString)customUsageDescription;
- (NSString)discussion;
- (NSString)purposeDescription;
- (NSString)syntaxDescription;
- (VMUOptionParser)init;
- (id)parseArguments:(char *)a3 withBlock:(id)a4;
- (id)parseArgumentsArray:(id)a3 withBlock:(id)a4;
- (int)optind;
- (void)clearOptionDescriptions;
- (void)dealloc;
- (void)printOptionDescriptions:(id)a3;
- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 flags:(unint64_t)a8 handler:(id)a9;
- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 handler:(id)a8;
- (void)setAbortOnError:(BOOL)a3;
- (void)setCustomUsageDescription:(id)a3;
- (void)setDiscussion:(id)a3;
- (void)setParametersShowAsAssignment:(BOOL)a3;
- (void)setPurposeDescription:(id)a3;
- (void)setSingleHyphenLongNames:(BOOL)a3;
- (void)setSyntaxDescription:(id)a3;
- (void)usage:(id)a3;
- (void)usage:(id)a3 shouldExit:(BOOL)a4;
@end

@implementation VMUOptionParser

- (VMUOptionParser)init
{
  v13.receiver = self;
  v13.super_class = (Class)VMUOptionParser;
  v2 = [(VMUOptionParser *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    optionDescriptions = v2->_optionDescriptions;
    v2->_optionDescriptions = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    appleInternalOptionDescriptions = v2->_appleInternalOptionDescriptions;
    v2->_appleInternalOptionDescriptions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    optionBlockByString = v2->_optionBlockByString;
    v2->_optionBlockByString = (NSMutableDictionary *)v7;

    callBacks.version = 1;
    callBacks.retain = 0;
    callBacks.copyDescription = 0;
    callBacks.equal = 0;
    callBacks.release = (CFArrayReleaseCallBack)_arrayFreeValue;
    v2->_longOptStructs = CFArrayCreateMutable(0, 0, &callBacks);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@":"];
    shortOpts = v2->_shortOpts;
    v2->_shortOpts = (NSMutableString *)v9;

    v2->_parametersShowAsAssignment = 1;
  }
  return v2;
}

- (void)dealloc
{
  longOptStructs = self->_longOptStructs;
  if (longOptStructs)
  {
    CFRelease(longOptStructs);
    self->_longOptStructs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUOptionParser;
  [(VMUOptionParser *)&v4 dealloc];
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 handler:(id)a8
{
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 flags:(unint64_t)a8 handler:(id)a9
{
  char v9 = a8;
  id v45 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  context = (void *)MEMORY[0x1AD0D9F90]();
  if (v45)
  {
    size_t v19 = [v45 length] + 33;
    id v43 = v17;
    id v20 = v18;
    id v21 = v16;
    char v22 = v9;
    v23 = (char *)malloc_type_malloc(v19, 0x189F0BE4uLL);
    id v24 = v45;
    strlcpy(v23 + 32, (const char *)[v24 UTF8String], v19);
    *(void *)v23 = v23 + 32;
    *((_DWORD *)v23 + 2) = a5;
    *((void *)v23 + 2) = 0;
    *((_DWORD *)v23 + 6) = 1;
    v25 = v23;
    char v9 = v22;
    id v16 = v21;
    id v18 = v20;
    id v17 = v43;
    CFArrayAppendValue(self->_longOptStructs, v25);
    optionBlockByString = self->_optionBlockByString;
    v27 = (void *)MEMORY[0x1AD0DA230](v18);
    [(NSMutableDictionary *)optionBlockByString setObject:v27 forKey:v24];
  }
  if (v15)
  {
    [(NSMutableString *)self->_shortOpts appendString:v15];
    if (a5 == 1) {
      [(NSMutableString *)self->_shortOpts appendString:@":"];
    }
    v28 = self->_optionBlockByString;
    v29 = (void *)MEMORY[0x1AD0DA230](v18);
    [(NSMutableDictionary *)v28 setObject:v29 forKey:v15];
  }
  if (v17)
  {
    v30 = [MEMORY[0x1E4F28E78] stringWithString:@"        "];
    v31 = v30;
    if (v15)
    {
      [v30 appendFormat:@"-%@", v15];
      if (!v45)
      {
        if (!a5 || !v16) {
          goto LABEL_34;
        }
        BOOL v34 = a5 == 1;
        goto LABEL_22;
      }
      [v31 appendString:@"/"];
      id v32 = v45;
    }
    else
    {
      id v32 = v45;
      if (!v45)
      {
        if (!a5 || !v16) {
          goto LABEL_34;
        }
        BOOL v34 = a5 == 1;
LABEL_26:
        if (self->_parametersShowAsAssignment) {
          uint64_t v35 = 61;
        }
        else {
          uint64_t v35 = 32;
        }
        goto LABEL_29;
      }
    }
    if (self->_singleHyphenLongNames) {
      v33 = "-";
    }
    else {
      v33 = "--";
    }
    [v31 appendFormat:@"%s%@", v33, v32];
    if (!a5 || !v16) {
      goto LABEL_34;
    }
    BOOL v34 = a5 == 1;
    if (!v15) {
      goto LABEL_26;
    }
LABEL_22:
    uint64_t v35 = 32;
LABEL_29:
    BOOL v36 = !v34;
    uint64_t v37 = 93;
    if (!v36) {
      uint64_t v37 = 62;
    }
    uint64_t v42 = v37;
    uint64_t v38 = 91;
    if (!v36) {
      uint64_t v38 = 60;
    }
    [v31 appendFormat:@"%c%c%@%c", v35, v38, v16, v42];
LABEL_34:
    uint64_t v39 = [v31 length];
    [v31 appendFormat:@"[@@@spacing@@@]%@", v17];
    if (v9)
    {
      if (!os_variant_has_internal_content())
      {
LABEL_41:

        goto LABEL_42;
      }
      uint64_t v40 = 40;
    }
    else
    {
      uint64_t v40 = 32;
    }
    [*(id *)((char *)&self->super.isa + v40) addObject:v31];
    unint64_t spacing = self->_spacing;
    if (spacing <= v39 + 2) {
      unint64_t spacing = v39 + 2;
    }
    self->_unint64_t spacing = spacing;
    goto LABEL_41;
  }
LABEL_42:
}

- (int)optind
{
  return *MEMORY[0x1E4F149F8];
}

- (id)parseArgumentsArray:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = malloc_type_malloc(8 * [v6 count] + 8, 0x10040436913F5uLL);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v19;
    v11 = v8;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        *v11++ = [v15 UTF8String];
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  void *v11 = 0;
  id v16 = [(VMUOptionParser *)self parseArguments:v8 withBlock:v7];
  free(v8);

  return v16;
}

- (id)parseArguments:(char *)a3 withBlock:(id)a4
{
  v54 = (void (**)(id, void *, id *))a4;
  id v6 = (void *)MEMORY[0x1AD0D9F90]();
  v55 = (char *)[(NSMutableString *)self->_shortOpts UTF8String];
  if (a3 && *a3)
  {
    uint64_t v7 = 0;
    while (a3[++v7])
      ;
    CFIndex Count = CFArrayGetCount(self->_longOptStructs);
    v51 = (option *)malloc_type_calloc(Count + 1, 0x20uLL, 0x10500402E37B38AuLL);
    if (Count >= 1)
    {
      CFIndex v10 = 0;
      v11 = v51;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_longOptStructs, v10);
        long long v13 = ValueAtIndex[1];
        *(_OWORD *)&v11->name = *ValueAtIndex;
        *(_OWORD *)&v11->flag = v13;
        ++v11;
        ++v10;
      }
      while (Count != v10);
    }
    int v59 = 0;
    uint64_t v14 = getopt_long_only(v7, a3, v55, v51, &v59);
    context = v6;
    v52 = self;
    if (v14 != -1)
    {
      uint64_t v20 = v14;
      long long v21 = 0;
      id v22 = 0;
      v53 = 0;
      uint64_t v23 = (uint64_t *)MEMORY[0x1E4F149E8];
      id v24 = v51;
      while (1)
      {
        uint64_t v25 = *v23;
        if (*v23)
        {
          v26 = [NSString stringWithUTF8String:];
        }
        else
        {
          v26 = 0;
        }
        if (v20 == 63)
        {
          VMUOptionParserError(-1, @"unrecognized option '%s'", v25, v15, v16, v17, v18, v19, (uint64_t)a3[*MEMORY[0x1E4F149F8] - 1]);
        }
        else
        {
          if (v20 != 58)
          {
            if (v20 == 1)
            {
              optionBlockByString = v52->_optionBlockByString;
              if (v24[v59].name) {
                name = v24[v59].name;
              }
              else {
                name = "";
              }
              v29 = [NSString stringWithUTF8String:name];
              v30 = [(NSMutableDictionary *)optionBlockByString objectForKey:v29];

              if (v30)
              {
                id v31 = v53;
                if (v22) {
                  id v32 = v53;
                }
                else {
                  id v32 = 0;
                }
                id v58 = v32;
                ((void (**)(void, void *, id *))v30)[2](v30, v26, &v58);
                id v33 = v58;
                if (v22) {
                  id v31 = v33;
                }
                v53 = v31;
                if (!v22) {
                  id v22 = v33;
                }
              }
            }
            else
            {
              BOOL v34 = v52->_optionBlockByString;
              uint64_t v35 = [NSString stringWithFormat:@"%c", v20, context];
              v30 = [(NSMutableDictionary *)v34 objectForKey:v35];

              if (v30)
              {
                id v36 = v53;
                if (v22) {
                  uint64_t v37 = v53;
                }
                else {
                  uint64_t v37 = 0;
                }
                id v57 = v37;
                ((void (**)(void, void *, id *))v30)[2](v30, v26, &v57);
                id v38 = v57;
                if (v22) {
                  id v36 = v38;
                }
                v53 = v36;
                if (!v22) {
                  id v22 = v38;
                }
              }
              id v24 = v51;
            }
            goto LABEL_41;
          }
          VMUOptionParserError(-1, @"%s flag supplied with no argument", v25, v15, v16, v17, v18, v19, (uint64_t)a3[*MEMORY[0x1E4F149F8] - 1]);
        }
        v30 = v21;
        long long v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_41:

        uint64_t v20 = getopt_long_only(v7, a3, v55, v24, &v59);
        if (v20 == -1) {
          goto LABEL_45;
        }
      }
    }
    v53 = 0;
    id v22 = 0;
    long long v21 = 0;
    id v24 = v51;
LABEL_45:
    int v40 = *MEMORY[0x1E4F149F8];
    int v41 = v7 - 1;
    if (*MEMORY[0x1E4F149F8] <= (int)v7 - 1)
    {
      id v43 = v53;
      while (1)
      {
        if (v54)
        {
          v44 = [NSString stringWithUTF8String:a3[v40]];
          if (v22) {
            id v45 = v43;
          }
          else {
            id v45 = 0;
          }
          id v56 = v45;
          v54[2](v54, v44, &v56);
          id v46 = v56;
          if (v22) {
            id v43 = v46;
          }
          else {
            id v22 = v46;
          }

          int v41 = v7 - 1;
        }
        if (v22) {
          break;
        }
        uint64_t v42 = 0;
        int v47 = *MEMORY[0x1E4F149F8];
        int v40 = *MEMORY[0x1E4F149F8] + 1;
        *MEMORY[0x1E4F149F8] = v40;
        if (v47 >= v41) {
          goto LABEL_60;
        }
      }
      uint64_t v42 = v22;
    }
    else
    {
      uint64_t v42 = v22;
      id v43 = v53;
    }
LABEL_60:
    *MEMORY[0x1E4F149F8] = 0;
    [(NSMutableDictionary *)v52->_optionBlockByString removeAllObjects];
    free(v24);

    if (v42) {
      v48 = v42;
    }
    else {
      v48 = v21;
    }
    id v39 = v48;
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (void)usage:(id)a3 shouldExit:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [v15 userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F28568]];

  v8 = (FILE **)MEMORY[0x1E4F143C8];
  if (v7 && [v15 code]) {
    fprintf(*v8, "[invalid usage]: %s\n\n", (const char *)[v7 UTF8String]);
  }
  customUsageDescription = self->_customUsageDescription;
  if (customUsageDescription)
  {
    fprintf(*v8, "%s\n", [(NSString *)customUsageDescription UTF8String]);
  }
  else
  {
    if (self->_purposeDescription)
    {
      CFIndex v10 = *v8;
      v11 = getprogname();
      fprintf(v10, "%s: %s\n\n", v11, [(NSString *)self->_purposeDescription UTF8String]);
    }
    if (self->_syntaxDescription)
    {
      uint64_t v12 = *v8;
      long long v13 = getprogname();
      fprintf(v12, "Usage: %s %s\n\n", v13, [(NSString *)self->_syntaxDescription UTF8String]);
    }
    discussionDescription = self->_discussionDescription;
    if (discussionDescription) {
      fprintf(*v8, "%s\n\n", [(NSString *)discussionDescription UTF8String]);
    }
    [(VMUOptionParser *)self printOptionDescriptions:self->_optionDescriptions];
    if ([(NSMutableArray *)self->_appleInternalOptionDescriptions count])
    {
      fwrite("\nApple-internal options:\n", 0x19uLL, 1uLL, *v8);
      [(VMUOptionParser *)self printOptionDescriptions:self->_appleInternalOptionDescriptions];
    }
  }
  if (v4)
  {
    if (!self->_abortOnError) {
      exit([v15 code]);
    }
    abort();
  }
}

- (void)usage:(id)a3
{
}

- (void)clearOptionDescriptions
{
  [(NSMutableArray *)self->_optionDescriptions removeAllObjects];
  appleInternalOptionDescriptions = self->_appleInternalOptionDescriptions;

  [(NSMutableArray *)appleInternalOptionDescriptions removeAllObjects];
}

- (void)printOptionDescriptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v14 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 rangeOfString:@"[@@@spacing@@@]"];
        id v9 = [NSString stringWithFormat:@"%*s", self->_spacing - v8, ""];
        CFIndex v10 = [v7 stringByReplacingOccurrencesOfString:@"[@@@spacing@@@]" withString:v9];
        v11 = [NSString stringWithFormat:@"\n%*s", (LODWORD(self->_spacing) + 3), ""];
        uint64_t v12 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:v11];

        if (v7) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s\n", (const char *)[v12 UTF8String]);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (NSString)purposeDescription
{
  return self->_purposeDescription;
}

- (void)setPurposeDescription:(id)a3
{
}

- (NSString)syntaxDescription
{
  return self->_syntaxDescription;
}

- (void)setSyntaxDescription:(id)a3
{
}

- (NSString)discussion
{
  return self->_discussionDescription;
}

- (void)setDiscussion:(id)a3
{
}

- (BOOL)singleHyphenLongNames
{
  return self->_singleHyphenLongNames;
}

- (void)setSingleHyphenLongNames:(BOOL)a3
{
  self->_singleHyphenLongNames = a3;
}

- (BOOL)parametersShowAsAssignment
{
  return self->_parametersShowAsAssignment;
}

- (void)setParametersShowAsAssignment:(BOOL)a3
{
  self->_parametersShowAsAssignment = a3;
}

- (NSString)customUsageDescription
{
  return self->_customUsageDescription;
}

- (void)setCustomUsageDescription:(id)a3
{
}

- (BOOL)abortOnError
{
  return self->_abortOnError;
}

- (void)setAbortOnError:(BOOL)a3
{
  self->_abortOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUsageDescription, 0);
  objc_storeStrong((id *)&self->_shortOpts, 0);
  objc_storeStrong((id *)&self->_optionBlockByString, 0);
  objc_storeStrong((id *)&self->_appleInternalOptionDescriptions, 0);
  objc_storeStrong((id *)&self->_optionDescriptions, 0);
  objc_storeStrong((id *)&self->_discussionDescription, 0);
  objc_storeStrong((id *)&self->_syntaxDescription, 0);

  objc_storeStrong((id *)&self->_purposeDescription, 0);
}

@end