@interface CLTOptionParser
- (BOOL)succeedWithUnkownFlags;
- (BOOL)succeedWithoutArguments;
- (CLTOption)defaultHelpOption;
- (CLTOption)defaultVersionOption;
- (CLTOptionParser)init;
- (CLTOptionParser)initWithArguments:(id)a3;
- (NSArray)additionalHelpLines;
- (NSArray)inputArguments;
- (NSArray)remainingArguments;
- (NSMutableArray)options;
- (NSString)introductionaryDescription;
- (NSString)toolName;
- (NSString)usageOptionsDescription;
- (NSString)versionLine;
- (NSString)versionString;
- (id)helpString;
- (id)parse;
- (id)usageLine;
- (id)usageString;
- (int)parseWithSuccessHandler:(id)a3;
- (void)addOption:(id)a3;
- (void)removeAllOptions;
- (void)setAdditionalHelpLines:(id)a3;
- (void)setDefaultHelpOption:(id)a3;
- (void)setDefaultVersionOption:(id)a3;
- (void)setInputArguments:(id)a3;
- (void)setIntroductionaryDescription:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRemainingArguments:(id)a3;
- (void)setSucceedWithUnkownFlags:(BOOL)a3;
- (void)setSucceedWithoutArguments:(BOOL)a3;
- (void)setToolName:(id)a3;
- (void)setUsageOptionsDescription:(id)a3;
- (void)setVersionString:(id)a3;
@end

@implementation CLTOptionParser

- (CLTOptionParser)init
{
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  v4 = [v3 arguments];
  v5 = [(CLTOptionParser *)self initWithArguments:v4];

  return v5;
}

- (CLTOptionParser)initWithArguments:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLTOptionParser;
  v5 = [(CLTOptionParser *)&v21 init];
  v6 = v5;
  if (v5)
  {
    [(CLTOptionParser *)v5 setInputArguments:v4];
    v7 = [v4 firstObject];
    v8 = [v7 lastPathComponent];
    [(CLTOptionParser *)v6 setToolName:v8];

    [(CLTOptionParser *)v6 setVersionString:@"0.0.1"];
    [(CLTOptionParser *)v6 setUsageOptionsDescription:@"[options]"];
    v9 = (void *)MEMORY[0x1E4F1CA48];
    v10 = objc_opt_new();
    [v10 addShorthand:@"h"];
    [v10 addLongform:@"help"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__CLTOptionParser_initWithArguments___block_invoke;
    v19[3] = &unk_1E5D76FB0;
    v11 = v6;
    v20 = v11;
    [v10 setTriggerAction:v19];
    [v10 setRighthandHelp:@"Shows this help."];
    objc_storeStrong(v11 + 7, v10);

    v12 = objc_opt_new();
    [v12 addLongform:@"version"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__CLTOptionParser_initWithArguments___block_invoke_2;
    v17[3] = &unk_1E5D76FB0;
    v13 = v11;
    v18 = v13;
    [v12 setTriggerAction:v17];
    [v12 setRighthandHelp:@"Shows version and build time."];
    objc_storeStrong(v13 + 8, v12);

    v14 = objc_opt_new();
    [v14 addShorthand:@"v"];
    [v14 addLongform:@"verbose"];
    [v14 setTriggerAction:&__block_literal_global];
    [v14 setRighthandHelp:@"Increase verbosity, can appear multiple times."];
    [v14 setMaxAllowedOccurencies:3];
    objc_storeStrong(v13 + 8, v14);
    v15 = objc_msgSend(v9, "arrayWithObjects:", v10, v12, v14, 0);
    [v13 setOptions:v15];
  }
  return v6;
}

void __37__CLTOptionParser_initWithArguments___block_invoke(uint64_t a1)
{
  if ((_CLTLogLevel & 0x80000000) == 0)
  {
    v1 = NSString;
    v2 = [*(id *)(a1 + 32) helpString];
    id v3 = [v1 stringWithFormat:@"%@", v2];
    id v4 = (const char *)[v3 UTF8String];
    v5 = (FILE **)MEMORY[0x1E4F143D8];
    fputs(v4, (FILE *)*MEMORY[0x1E4F143D8]);

    fflush(*v5);
  }
  exit(0);
}

void __37__CLTOptionParser_initWithArguments___block_invoke_2(uint64_t a1)
{
  if ((_CLTLogLevel & 0x80000000) == 0)
  {
    v1 = NSString;
    v2 = [*(id *)(a1 + 32) versionLine];
    id v3 = [v1 stringWithFormat:@"%@\n", v2];
    id v4 = (const char *)[v3 UTF8String];
    v5 = (FILE **)MEMORY[0x1E4F143D8];
    fputs(v4, (FILE *)*MEMORY[0x1E4F143D8]);

    fflush(*v5);
  }
  exit(0);
}

void __37__CLTOptionParser_initWithArguments___block_invoke_3()
{
}

- (NSString)versionLine
{
  id v3 = NSString;
  id v4 = [(CLTOptionParser *)self toolName];
  v5 = [(CLTOptionParser *)self versionString];
  v6 = [v3 stringWithFormat:@"%@ (v%@) (build time: %s %s)", v4, v5, "Nov 10 2024", "03:10:23"];

  return (NSString *)v6;
}

- (id)helpString
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CLTOptionParser *)self versionLine];
  v8[0] = v3;
  id v4 = [(CLTOptionParser *)self usageString];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v5 componentsJoinedByString:@"\n"];

  return v6;
}

- (id)usageLine
{
  id v3 = NSString;
  id v4 = [(CLTOptionParser *)self toolName];
  v5 = [(CLTOptionParser *)self usageOptionsDescription];
  v6 = [v3 stringWithFormat:@"Usage: %@ %@", v4, v5];

  return v6;
}

- (id)usageString
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CLTOptionParser *)self usageLine];
  v41[0] = v3;
  v41[1] = &stru_1EFF926D0;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(CLTOptionParser *)self introductionaryDescription];

  if (v6)
  {
    v7 = [(CLTOptionParser *)self introductionaryDescription];
    [v5 addObject:v7];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v8 = [(CLTOptionParser *)self options];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    unint64_t v12 = 20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) lefthandHelp];
        unint64_t v15 = [v14 length];

        if (v12 <= v15) {
          unint64_t v12 = v15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v12 = 20;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v29 = self;
  obuint64_t j = [(CLTOptionParser *)self options];
  uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        v20 = v5;
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        objc_super v21 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v22 = NSString;
        v23 = [v21 lefthandHelp];
        v24 = [v23 stringByPaddingToLength:v12 withString:@" " startingAtIndex:0];
        v25 = [v21 righthandHelp];
        v26 = [v22 stringWithFormat:@" %@  %@", v24, v25];

        v5 = v20;
        [v20 addObject:v26];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }

  [v5 addObject:&stru_1EFF926D0];
  if ([(NSArray *)v29->_additionalHelpLines count])
  {
    [v5 addObjectsFromArray:v29->_additionalHelpLines];
    [v5 addObject:&stru_1EFF926D0];
  }
  v27 = [v5 componentsJoinedByString:@"\n"];

  return v27;
}

- (id)parse
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  if ([(NSArray *)self->_inputArguments count] == 1
    && ![(CLTOptionParser *)self succeedWithoutArguments])
  {
    id v4 = [(CLTOptionParser *)self defaultHelpOption];
    v5 = [v4 triggerAction];
    v5[2]();
  }
  v6 = [(NSArray *)self->_inputArguments objectEnumerator];
  id v7 = (id)[v6 nextObject];
  v8 = 0;
  uint64_t v9 = 0;
  v49 = self;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          uint64_t v10 = v9;
          uint64_t v9 = [v6 nextObject];

          if (!v9) {
            goto LABEL_50;
          }
        }
        while (v8 && ([v8 consumeArgument:v9] & 1) != 0);

        if ([v9 isEqual:@"--"])
        {
          v8 = [v6 allObjects];
          [v3 addObjectsFromArray:v8];
LABEL_50:
          long long v37 = 0;
          goto LABEL_51;
        }
        if ([v9 hasPrefix:@"-"]) {
          break;
        }
        [v3 addObject:v9];
        v8 = 0;
      }
      uint64_t v11 = [v9 substringFromIndex:1];
      v48 = v11;
      v45 = v6;
      v46 = v3;
      if ([v11 hasPrefix:@"-"])
      {
        unint64_t v12 = [v11 substringFromIndex:1];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v13 = [(CLTOptionParser *)self options];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v56;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v56 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v19 = [v18 longforms];
              int v20 = [v19 containsObject:v12];

              if (v20)
              {
                long long v35 = [v18 triggerAction];

                if (v35)
                {
                  long long v36 = [v18 triggerAction];
                  v36[2]();
                }
                objc_msgSend(v18, "setOccurencies:", objc_msgSend(v18, "occurencies") + 1);
                id v50 = v18;
                LOBYTE(v21) = 1;
                goto LABEL_40;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v60 count:16];
            if (v15) {
              continue;
            }
            break;
          }
          LOBYTE(v21) = 0;
          id v50 = 0;
LABEL_40:
          uint64_t v11 = v48;
          self = v49;
        }
        else
        {
          LOBYTE(v21) = 0;
          id v50 = 0;
        }
      }
      else if ([v11 length])
      {
        id v50 = 0;
        int v21 = 0;
        unint64_t v22 = 0;
        do
        {
          v23 = objc_msgSend(v11, "substringWithRange:", v22, 1);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          v24 = [(CLTOptionParser *)self options];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            int v47 = v21;
            uint64_t v27 = *(void *)v52;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v52 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                v30 = [v29 shorthands];
                int v31 = [v30 containsObject:v23];

                if (v31)
                {
                  long long v32 = [v29 triggerAction];

                  if (v32)
                  {
                    long long v33 = [v29 triggerAction];
                    v33[2]();
                  }
                  objc_msgSend(v29, "setOccurencies:", objc_msgSend(v29, "occurencies") + 1);
                  id v34 = v29;

                  int v21 = 1;
                  id v50 = v34;
                  uint64_t v11 = v48;
                  self = v49;
                  goto LABEL_35;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
              if (v26) {
                continue;
              }
              break;
            }
            uint64_t v11 = v48;
            self = v49;
            int v21 = v47;
          }
LABEL_35:

          ++v22;
        }
        while (v22 < [v11 length]);
      }
      else
      {
        LOBYTE(v21) = 0;
        id v50 = 0;
      }
      v8 = v50;
      if (!v50 && (v21 & 1) == 0) {
        break;
      }

      v6 = v45;
      id v3 = v46;
    }
    v6 = v45;
    id v3 = v46;
    if (![(CLTOptionParser *)self succeedWithUnkownFlags]) {
      break;
    }

    v8 = 0;
  }
  id v39 = [NSString stringWithFormat:@"Option unknown: %@\n", v9];
  v40 = (const char *)[v39 UTF8String];
  v41 = (FILE **)MEMORY[0x1E4F143C8];
  fputs(v40, (FILE *)*MEMORY[0x1E4F143C8]);

  v42 = NSString;
  v43 = [(CLTOptionParser *)self usageLine];
  id v44 = [v42 stringWithFormat:@"%@\n", v43];
  fputs((const char *)[v44 UTF8String], *v41);

  long long v37 = &unk_1EFF9A818;
  v8 = v11;
LABEL_51:

  return v37;
}

- (int)parseWithSuccessHandler:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  v5 = [(CLTOptionParser *)self parse];
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 intValue];
  }
  else
  {
    if (!v4)
    {
      int v8 = 0;
      goto LABEL_6;
    }
    int v7 = v4[2](v4);
  }
  int v8 = v7;
LABEL_6:

  return v8;
}

- (void)removeAllOptions
{
  id v2 = [(CLTOptionParser *)self options];
  [v2 removeAllObjects];
}

- (void)addOption:(id)a3
{
  id v4 = a3;
  id v5 = [(CLTOptionParser *)self options];
  [v5 addObject:v4];
}

- (NSString)toolName
{
  return self->_toolName;
}

- (void)setToolName:(id)a3
{
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
}

- (NSString)introductionaryDescription
{
  return self->_introductionaryDescription;
}

- (void)setIntroductionaryDescription:(id)a3
{
}

- (NSString)usageOptionsDescription
{
  return self->_usageOptionsDescription;
}

- (void)setUsageOptionsDescription:(id)a3
{
}

- (BOOL)succeedWithoutArguments
{
  return self->_succeedWithoutArguments;
}

- (void)setSucceedWithoutArguments:(BOOL)a3
{
  self->_succeedWithoutArguments = a3;
}

- (BOOL)succeedWithUnkownFlags
{
  return self->_succeedWithUnkownFlags;
}

- (void)setSucceedWithUnkownFlags:(BOOL)a3
{
  self->_succeedWithUnkownFlags = a3;
}

- (NSArray)additionalHelpLines
{
  return self->_additionalHelpLines;
}

- (void)setAdditionalHelpLines:(id)a3
{
}

- (CLTOption)defaultHelpOption
{
  return self->_defaultHelpOption;
}

- (void)setDefaultHelpOption:(id)a3
{
}

- (CLTOption)defaultVersionOption
{
  return self->_defaultVersionOption;
}

- (void)setDefaultVersionOption:(id)a3
{
}

- (NSArray)remainingArguments
{
  return self->_remainingArguments;
}

- (void)setRemainingArguments:(id)a3
{
}

- (NSArray)inputArguments
{
  return self->_inputArguments;
}

- (void)setInputArguments:(id)a3
{
}

- (NSMutableArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_inputArguments, 0);
  objc_storeStrong((id *)&self->_remainingArguments, 0);
  objc_storeStrong((id *)&self->_defaultVersionOption, 0);
  objc_storeStrong((id *)&self->_defaultHelpOption, 0);
  objc_storeStrong((id *)&self->_additionalHelpLines, 0);
  objc_storeStrong((id *)&self->_usageOptionsDescription, 0);
  objc_storeStrong((id *)&self->_introductionaryDescription, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_toolName, 0);
}

@end