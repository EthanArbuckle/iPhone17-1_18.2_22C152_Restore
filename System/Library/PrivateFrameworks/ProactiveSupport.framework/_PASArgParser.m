@interface _PASArgParser
+ (_PASArgParser)parserWithHandler:(id)a3;
+ (id)BOOLValueForArgument:(id)a3 error:(id *)a4;
+ (id)enumValueForArgument:(id)a3 withMapping:(id)a4 error:(id *)a5;
+ (id)numberValueForArgument:(id)a3 error:(id *)a4;
+ (id)simpleParserWithHelpGenerator:(id)a3 version:(id)a4 handler:(id)a5;
- (NSMutableArray)registeredOptions;
- (NSMutableArray)registeredSubcommands;
- (NSMutableSet)requiredOptions;
- (_PASArgParser)initWithHandler:(id)a3;
- (id)_argumentParseTemplate:(id)a3 longArgs:(option *)a4;
- (id)description;
- (id)handler;
- (id)naiveUsageHelpWithPositionalArgString:(id)a3;
- (id)optionLongHelp;
- (id)optionShortHelp;
- (id)subcommandLongHelp;
- (int)invokeHandlerWithArguments:(const char *)a3 count:(int)a4 parseErrorCode:(int)a5 error:(id *)a6;
- (void)registerOption:(id)a3;
- (void)registerSubcommand:(id)a3;
- (void)setRequiredOptions:(id)a3;
@end

@implementation _PASArgParser

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_requiredOptions, 0);
  objc_storeStrong((id *)&self->_registeredOptions, 0);

  objc_storeStrong((id *)&self->_registeredSubcommands, 0);
}

- (id)handler
{
  return self->_handler;
}

- (void)setRequiredOptions:(id)a3
{
}

- (NSMutableSet)requiredOptions
{
  return self->_requiredOptions;
}

- (NSMutableArray)registeredOptions
{
  return self->_registeredOptions;
}

- (NSMutableArray)registeredSubcommands
{
  return self->_registeredSubcommands;
}

- (id)_argumentParseTemplate:(id)a3 longArgs:(option *)a4
{
  id v7 = a3;
  if (!a4)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_PASArgParser.m", 622, @"Invalid parameter not satisfying: %@", @"longArgsRef" object file lineNumber description];
  }
  v8 = objc_opt_new();
  if (v7)
  {
    v9 = [v7 registeredOptions];
  }
  else
  {
    v9 = self->_registeredOptions;
  }
  v10 = v9;
  v11 = (option *)malloc_type_calloc([(NSMutableArray *)v9 count] + 1, 0x20uLL, 0x10500402E37B38AuLL);
  if (!v11)
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v25);
  }
  v12 = v11;
  if ([(NSMutableArray *)v10 count])
  {
    unint64_t v13 = 0;
    p_val = &v12->val;
    do
    {
      v15 = [(NSMutableArray *)v10 objectAtIndexedSubscript:v13];
      id v16 = [v15 name];
      *((void *)p_val - 3) = [v16 UTF8String];

      v17 = [v15 argMetavar];
      *(p_val - 4) = v17 != 0;

      v18 = [v15 shortName];

      if (v18)
      {
        *((void *)p_val - 1) = 0;
        id v19 = [v15 shortName];
        int *p_val = *(char *)[v19 UTF8String];
      }
      else
      {
        *((void *)p_val - 1) = v15 + 8;
        int *p_val = 1;
      }
      v20 = [v15 shortName];

      if (v20)
      {
        v21 = [v15 shortName];
        [v8 appendString:v21];

        v22 = [v15 argMetavar];

        if (v22) {
          [v8 appendString:@":"];
        }
      }

      ++v13;
      p_val += 8;
    }
    while (v13 < [(NSMutableArray *)v10 count]);
  }
  *a4 = v12;

  return v8;
}

- (int)invokeHandlerWithArguments:(const char *)a3 count:(int)a4 parseErrorCode:(int)a5 error:(id *)a6
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  *MEMORY[0x1E4F149F8] = 1;
  v10 = (_DWORD *)MEMORY[0x1E4F149F0];
  *MEMORY[0x1E4F149F0] = 0;
  *MEMORY[0x1E4F14A00] = 0;
  *MEMORY[0x1E4F14A08] = 1;
  v11 = objc_opt_new();
  v96 = objc_opt_new();
  unint64_t v12 = 0x1E4F29000uLL;
  v93 = a3;
  v94 = v11;
  v85 = self;
  int v92 = a4;
  if (a4 < 2)
  {
    id v23 = 0;
  }
  else
  {
    unint64_t v13 = [NSString stringWithUTF8String:a3[1]];
    if (!v13)
    {
      v81 = [MEMORY[0x1E4F28B00] currentHandler];
      [v81 handleFailureInMethod:a2 object:v85 file:@"_PASArgParser.m" lineNumber:478 description:@"possibleSubcommand: stringWithUTF8String unexpectedly returned nil"];

      self = v85;
    }
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v14 = self->_registeredSubcommands;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v106;
      while (2)
      {
        unint64_t v18 = v12;
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v106 != v17) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          v21 = [v20 name];
          char v22 = [v21 isEqualToString:v13];

          if (v22)
          {
            id v23 = v20;

            if (v23)
            {
              int v9 = 0;
              ++*MEMORY[0x1E4F149F8];
            }
            else
            {
              int v9 = 1;
            }
            v11 = v94;
            self = v85;
            unint64_t v12 = v18;
            goto LABEL_18;
          }
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v105 objects:v116 count:16];
        unint64_t v12 = v18;
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v23 = 0;
    int v9 = 1;
    v11 = v94;
    self = v85;
LABEL_18:
    a3 = v93;
    a4 = v92;
  }
  _DWORD *v10 = 0;
  int v104 = 0;
  v103 = 0;
  [(_PASArgParser *)self _argumentParseTemplate:v23 longArgs:&v103];
  v24 = self;
  id v25 = objc_claimAutoreleasedReturnValue();
  v91 = (char *)[v25 UTF8String];

  if (v9)
  {
    v95 = v24->_registeredOptions;
    v89 = (void *)[(NSMutableSet *)v24->_requiredOptions mutableCopy];
  }
  else
  {
    v95 = [v23 registeredOptions];
    v26 = [v23 requiredOptions];
    v89 = (void *)[v26 mutableCopy];
  }
  char v83 = v9;
  id v87 = v23;
  char v97 = 0;
  id v90 = 0;
  uint64_t v88 = *MEMORY[0x1E4F28588];
LABEL_23:
  int v27 = getopt_long(a4, (char *const *)a3, v91, v103, &v104);
  if (v27 == -1)
  {
    v63 = v87;
    goto LABEL_58;
  }
  int v28 = v27;
  if (v27 == 63) {
    int v29 = *MEMORY[0x1E4F14A00];
  }
  else {
    int v29 = v27;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v30 = v95;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v99 objects:v115 count:16];
  if (!v31) {
    goto LABEL_56;
  }
  uint64_t v32 = v31;
  uint64_t v33 = *(void *)v100;
  while (2)
  {
    for (uint64_t j = 0; j != v32; ++j)
    {
      if (*(void *)v100 != v33) {
        objc_enumerationMutation(v30);
      }
      v35 = *(void **)(*((void *)&v99 + 1) + 8 * j);
      name = v103->name;
      if (v103->name)
      {
        v37 = v103 + 1;
        while (1)
        {
          id v38 = [v35 name];
          int v39 = strcmp(name, (const char *)[v38 UTF8String]);

          if (!v39)
          {
            flag = v37[-1].flag;
            if (flag)
            {
              if (*flag == 1) {
                break;
              }
            }
          }
          v41 = v37->name;
          ++v37;
          name = v41;
          if (!v41) {
            goto LABEL_38;
          }
        }
        int *flag = 0;
LABEL_44:
        if ([v35 required])
        {
          v45 = [v35 name];
          [v89 removeObject:v45];
        }
        v46 = [v35 argMetavar];

        v11 = v94;
        unint64_t v12 = 0x1E4F29000uLL;
        a4 = v92;
        if (v46)
        {
          v47 = NSString;
          if (v28 == 63 || !*MEMORY[0x1E4F149E8])
          {
            v55 = [v35 name];
            v54 = [v47 stringWithFormat:@"Option: \"%@\" missing required argument", v55];

            v56 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v113 = v88;
            v114 = v54;
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
            uint64_t v58 = [v56 errorWithDomain:@"_PASArgParser" code:0 userInfo:v57];

            v49 = 0;
            id v90 = (id)v58;
            goto LABEL_54;
          }
          uint64_t v48 = objc_msgSend(NSString, "stringWithUTF8String:");
        }
        else
        {
          uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
        }
        v49 = (void *)v48;
        v50 = [v35 name];
        [v94 setObject:v49 forKeyedSubscript:v50];

        v51 = [v35 name];
        char v52 = [v51 isEqualToString:@"help"];

        v97 |= v52;
        v53 = [v35 shortName];

        if (!v53)
        {
LABEL_55:
          a3 = v93;

          goto LABEL_23;
        }
        v54 = [v35 shortName];
        [v94 setObject:v49 forKeyedSubscript:v54];
LABEL_54:

        goto LABEL_55;
      }
LABEL_38:
      v42 = [v35 shortName];

      if (v42)
      {
        id v43 = [v35 shortName];
        v44 = (char *)[v43 UTF8String];

        if (v29 == *v44) {
          goto LABEL_44;
        }
      }
    }
    uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v99 objects:v115 count:16];
    if (v32) {
      continue;
    }
    break;
  }
LABEL_56:

  unint64_t v12 = 0x1E4F29000uLL;
  a3 = v93;
  v59 = objc_msgSend(NSString, "stringWithFormat:", @"Unrecognized option: (%s)", v93[*MEMORY[0x1E4F149F8] - 1]);
  v60 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v111 = v88;
  v112 = v59;
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
  uint64_t v62 = [v60 errorWithDomain:@"_PASArgParser" code:0 userInfo:v61];

  id v90 = (id)v62;
  v11 = v94;
  v63 = v87;
  a4 = v92;
LABEL_58:
  if ((v97 & 1) == 0 && [v89 count])
  {
    v64 = [v89 allObjects];
    v65 = objc_msgSend(v64, "_pas_componentsJoinedByString:", @", ");

    v66 = [*(id *)(v12 + 24) stringWithFormat:@"Missing required options: %@", v65];
    v67 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v109 = v88;
    v110 = v66;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    uint64_t v69 = [v67 errorWithDomain:@"_PASArgParser" code:0 userInfo:v68];

    v63 = v87;
    id v90 = (id)v69;
  }
  uint64_t v70 = (int)*MEMORY[0x1E4F149F8];
  if (a4 > (int)v70)
  {
    int v71 = a4 - v70;
    v72 = &a3[v70];
    do
    {
      v73 = [*(id *)(v12 + 24) stringWithUTF8String:*v72];
      if (!v73)
      {
        v74 = [MEMORY[0x1E4F28B00] currentHandler];
        [v74 handleFailureInMethod:a2 object:v85 file:@"_PASArgParser.m" lineNumber:585 description:@"posArgStr: stringWithUTF8String unexpectedly returned nil"];

        v63 = v87;
      }
      [v96 addObject:v73];

      ++v72;
      --v71;
    }
    while (v71);
  }
  free(v103);
  id v75 = v90;
  if (v90)
  {
    v76 = a6;
    int v77 = a5;
    if (a6) {
      goto LABEL_68;
    }
  }
  else
  {
    if (v83)
    {
      v79 = [[_PASArgToplevelHandlerParams alloc] initWithParser:v85 options:v11 positionalArguments:v96];
      int v77 = (*((uint64_t (**)(void))v85->_handler + 2))();
      id v75 = 0;
    }
    else
    {
      v79 = [[_PASArgSubcommandHandlerParams alloc] initWithSubcommand:v63 options:v11 positionalArguments:v96];
      v80 = [v63 handler];
      id v98 = 0;
      int v77 = ((uint64_t (**)(void, _PASArgToplevelHandlerParams *, id *))v80)[2](v80, v79, &v98);
      id v75 = v98;
    }
    v76 = a6;

    if (a6)
    {
LABEL_68:
      id v75 = v75;
      id *v76 = v75;
    }
  }

  return v77;
}

- (id)naiveUsageHelpWithPositionalArgString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] stringWithString:@"Usage:\n  "];
  v6 = [MEMORY[0x1E4F28F80] processInfo];
  id v7 = [v6 processName];
  [v5 appendString:v7];

  if ([(NSMutableArray *)self->_registeredSubcommands count]) {
    [v5 appendString:@" [SUBCOMMAND]"];
  }
  v8 = [(_PASArgParser *)self optionShortHelp];
  [v5 appendString:v8];

  if (v4) {
    [v5 appendString:v4];
  }
  [v5 appendString:@"\n"];
  int v9 = [(_PASArgParser *)self subcommandLongHelp];
  [v5 appendString:v9];

  v10 = [(_PASArgParser *)self optionLongHelp];
  [v5 appendString:v10];

  return v5;
}

- (id)subcommandLongHelp
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  if ([(NSMutableArray *)self->_registeredSubcommands count]) {
    [v3 appendString:@"\nSubcommand Details:\n"];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_registeredSubcommands;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 name];
        v11 = [v9 helpDescription];
        [v3 appendFormat:@"  %@ -- %@\n", v10, v11, (void)v13];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)optionLongHelp
{
  return makeOptionLongHelp(self->_registeredOptions);
}

- (id)optionShortHelp
{
  return makeOptionShortHelp(self->_registeredOptions);
}

- (void)registerOption:(id)a3
{
  id v6 = a3;
  [(NSMutableArray *)self->_registeredOptions addObject:v6];
  if ([v6 required])
  {
    requiredOptions = self->_requiredOptions;
    uint64_t v5 = [v6 name];
    [(NSMutableSet *)requiredOptions addObject:v5];
  }
}

- (void)registerSubcommand:(id)a3
{
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"_PASArgParser"];
  if ([(NSMutableArray *)self->_registeredOptions count])
  {
    [v3 appendString:@"\n  Registered Options:\n"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = self->_registeredOptions;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
  if ([(NSMutableArray *)self->_registeredSubcommands count])
  {
    [v3 appendString:@"\n  Registered Subcommands:\n"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v9 = self->_registeredSubcommands;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v15 + 1) + 8 * j)];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v11);
    }
  }

  return v3;
}

- (_PASArgParser)initWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_PASArgParser.m", 340, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)_PASArgParser;
  uint64_t v6 = [(_PASArgParser *)&v17 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    registeredSubcommands = v6->_registeredSubcommands;
    v6->_registeredSubcommands = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    registeredOptions = v6->_registeredOptions;
    v6->_registeredOptions = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    requiredOptions = v6->_requiredOptions;
    v6->_requiredOptions = (NSMutableSet *)v11;

    uint64_t v13 = MEMORY[0x1A6245320](v5);
    id handler = v6->_handler;
    v6->_id handler = (id)v13;
  }
  return v6;
}

+ (id)simpleParserWithHelpGenerator:(id)a3 version:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"_PASArgParser.m", 360, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63___PASArgParser_simpleParserWithHelpGenerator_version_handler___block_invoke;
  v20[3] = &unk_1E5AEADB0;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  id v21 = v13;
  id v14 = v11;
  id v23 = v14;
  long long v15 = [a1 parserWithHandler:v20];
  long long v16 = +[_PASArgOption optionWithName:@"help" shortName:@"h" help:@"Display a help page."];
  [v15 registerOption:v16];

  if (v13)
  {
    objc_super v17 = +[_PASArgOption optionWithName:@"version" shortName:@"V" help:@"Display the program name and version."];
    [v15 registerOption:v17];
  }

  return v15;
}

+ (_PASArgParser)parserWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithHandler:v4];

  return (_PASArgParser *)v5;
}

+ (id)enumValueForArgument:(id)a3 withMapping:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, a1, @"_PASArgParser.m", 326, @"Invalid parameter not satisfying: %@", @"[argument isKindOfClass:[NSString class]]" object file lineNumber description];
    }
    id v12 = v9;
    uint64_t v13 = [v10 objectForKeyedSubscript:v12];
    id v11 = (void *)v13;
    if (a5 && !v13)
    {
      id v14 = [NSString stringWithFormat:@"Argument value \"%@\" does not correspond an enum value.", v12];
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28588];
      v20[0] = v14;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a5 = [v15 errorWithDomain:@"_PASArgParser" code:0 userInfo:v16];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)numberValueForArgument:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, a1, @"_PASArgParser.m", 308, @"Invalid parameter not satisfying: %@", @"[argument isKindOfClass:[NSString class]]" object file lineNumber description];
    }
    id v9 = v7;
    id v10 = objc_opt_new();
    v8 = [v10 numberFromString:v9];

    if (a4 && !v8)
    {
      id v11 = [NSString stringWithFormat:@"Argument value \"%@\" cannot be converted to a number.", v9];
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28588];
      v17[0] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a4 = [v12 errorWithDomain:@"_PASArgParser" code:0 userInfo:v13];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)BOOLValueForArgument:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, a1, @"_PASArgParser.m", 285, @"Invalid parameter not satisfying: %@", @"[argument isKindOfClass:[NSString class]]" object file lineNumber description];
      }
      id v8 = v7;
      id v9 = [v8 lowercaseString];
      if ([v9 isEqualToString:@"yes"])
      {
      }
      else
      {
        char v10 = [v8 isEqualToString:@"1"];

        if ((v10 & 1) == 0)
        {
          id v12 = [v8 lowercaseString];
          if ([v12 isEqualToString:@"no"])
          {
          }
          else
          {
            char v13 = [v8 isEqualToString:@"0"];

            if ((v13 & 1) == 0)
            {
              if (a4)
              {
                id v14 = [NSString stringWithFormat:@"Argument value \"%@\" cannot be converted to BOOLean.", v8];
                long long v15 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v18 = *MEMORY[0x1E4F28588];
                v19[0] = v14;
                uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
                *a4 = [v15 errorWithDomain:@"_PASArgParser" code:0 userInfo:v16];

                a4 = 0;
              }
              goto LABEL_10;
            }
          }
          a4 = (id *)MEMORY[0x1E4F1CC28];
LABEL_10:

          goto LABEL_11;
        }
      }
      a4 = (id *)MEMORY[0x1E4F1CC38];
      goto LABEL_10;
    }
  }
  a4 = 0;
LABEL_11:

  return a4;
}

@end