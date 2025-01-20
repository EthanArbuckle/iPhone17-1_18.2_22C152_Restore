@interface OSALegacyXform
+ (id)rollSchemaForward:(id)a3;
+ (id)transformURL:(id)a3 options:(id)a4;
- (BOOL)prepareTemplate:(id)a3 forLogType:(id)a4 error:(id *)a5;
- (BOOL)transformJSON:(id)a3 header:(id)a4 error:(id *)a5 streamingBlock:(id)a6;
- (BOOL)transformLines:(id)a3 withDefinitions:(id)a4 body:(id)a5 header:(id)a6 error:(id *)a7 streamingBlock:(id)a8;
- (OSALegacyXform)init;
- (id)_getValueForKey:(id)a3 fromBody:(id)a4 orHeader:(id)a5;
- (id)_hexDump:(id)a3 offset:(int)a4 indicator:(BOOL)a5;
- (id)formatArm32ThreadState:(id)a3 index:(int)a4;
- (id)formatArm64ThreadState:(id)a3 index:(int)a4;
- (id)formatCallstacks:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5;
- (id)formatFrame:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5;
- (id)formatImages:(id)a3 macosStyle:(BOOL)a4;
- (id)formatInstructionState:(id)a3 index:(int)a4;
- (id)formatLastBranchState:(id)a3 index:(int)a4 withImages:(id)a5;
- (id)formatLastException:(id)a3 withImages:(id)a4;
- (id)formatX86ThreadState:(id)a3 index:(int)a4;
@end

@implementation OSALegacyXform

- (OSALegacyXform)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSALegacyXform;
  v2 = [(OSALegacyXform *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    templates = v2->_templates;
    v2->_templates = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)prepareTemplate:(id)a3 forLogType:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [a3 componentsSeparatedByString:@"\n"];
  [(NSMutableDictionary *)self->_templates setValue:v8 forKey:v7];

  return 0;
}

- (id)formatFrame:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKeyedSubscript:@"imageIndex"];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
  }
  else
  {
    v11 = 0;
  }
  uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = @"???";
  }
  if ((unint64_t)[(__CFString *)v13 length] < 0x1F)
  {
    uint64_t v16 = [(__CFString *)v13 stringByPaddingToLength:30 withString:@" " startingAtIndex:0];
  }
  else
  {
    if (a5) {
      goto LABEL_12;
    }
    v14 = NSString;
    uint64_t v15 = [(__CFString *)v13 substringFromIndex:[(__CFString *)v13 length] - 27];
    uint64_t v16 = [v14 stringWithFormat:@"...%@", v15];

    v13 = (__CFString *)v15;
  }

  v13 = (__CFString *)v16;
LABEL_12:
  v17 = [v11 objectForKeyedSubscript:@"base"];
  uint64_t v18 = [v17 unsignedLongLongValue];

  v19 = [v7 objectForKeyedSubscript:@"imageOffset"];
  uint64_t v20 = [v19 unsignedLongLongValue];

  uint64_t v21 = v18 + v20;
  if ((unint64_t)[v7 count] < 3)
  {
    if (v18 && v20)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%p + %llu", v18, v20);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v21) {
        uint64_t v21 = v20;
      }
      v23 = @"???";
    }
  }
  else
  {
    uint64_t v46 = [v7 objectForKeyedSubscript:@"symbol"];
    v22 = [v7 objectForKeyedSubscript:@"symbolLocation"];
    v44 = v11;
    uint64_t v47 = v18 + v20;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v22 unsignedLongLongValue];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v22;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** ignoring non-numeric symbolLocation: '%@'", buf, 0xCu);
      }
    }
    v45 = v10;
    v24 = [v7 objectForKeyedSubscript:@"sourceFile"];
    uint64_t v25 = [v7 objectForKeyedSubscript:@"sourceLine"];
    v26 = (void *)v25;
    v43 = v22;
    v27 = &stru_1EFE17BD0;
    if (v24 && v25)
    {
      v27 = [NSString stringWithFormat:@" (%@:%@)", v24, v25];
    }
    v28 = [v7 objectForKeyedSubscript:@"inline"];
    v29 = v28;
    v30 = (void *)v46;
    if (v46)
    {
      v31 = NSString;
      int v32 = [v28 BOOLValue];
      v33 = @" [inlined]";
      if (!v32) {
        v33 = &stru_1EFE17BD0;
      }
      v23 = [v31 stringWithFormat:@"%@ + %llu%@%@", v46, v20, v27, v33];
    }
    else
    {
      if (v18 && v20)
      {
        v34 = NSString;
        int v35 = [v28 BOOLValue];
        v36 = @" [inlined]";
        if (!v35) {
          v36 = &stru_1EFE17BD0;
        }
        v23 = [v34 stringWithFormat:@"%p + %llu%@%@", v47 - v20, v20, v27, v36];
      }
      else
      {
        uint64_t v37 = v47;
        if (!v47) {
          uint64_t v37 = v20;
        }
        uint64_t v47 = v37;
        v23 = @"???";
      }
      v38 = [v7 objectForKeyedSubscript:@"region"];
      v39 = v38;
      if (v38)
      {
        v40 = v38;

        v13 = v40;
      }

      v30 = 0;
    }

    v11 = v44;
    v10 = v45;
    uint64_t v21 = v47;
  }
  v41 = [NSString stringWithFormat:@"%@\t%18p %@", v13, v21, v23];

  return v41;
}

- (id)formatCallstacks:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  BOOL v51 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v50 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v57;
    LODWORD(v9) = -1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
        uint64_t v9 = (v9 + 1);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"queue"];
        uint64_t v14 = v13;
        uint64_t v49 = v10;
        uint64_t v47 = (void *)v13;
        v48 = (void *)v12;
        if (v51)
        {
          uint64_t v15 = NSString;
          uint64_t v16 = [v11 objectForKeyedSubscript:@"triggered"];
          v17 = @" Crashed";
          if (!v16) {
            v17 = &stru_1EFE17BD0;
          }
          uint64_t v18 = @": ";
          if (!(v12 | v14)) {
            uint64_t v18 = &stru_1EFE17BD0;
          }
          if (v12) {
            v19 = (__CFString *)v12;
          }
          else {
            v19 = &stru_1EFE17BD0;
          }
          uint64_t v20 = @" Dispatch queue: ";
          if (v14)
          {
            uint64_t v21 = (__CFString *)v14;
          }
          else
          {
            uint64_t v20 = &stru_1EFE17BD0;
            uint64_t v21 = &stru_1EFE17BD0;
          }
          [v15 stringWithFormat:@"Thread %d%@:%@%@%@%@", v9, v17, v18, v19, v20, v21];
        }
        else
        {
          if (v12 | v13)
          {
            if (v12) {
              v22 = (__CFString *)v12;
            }
            else {
              v22 = &stru_1EFE17BD0;
            }
            v23 = @" Dispatch queue: ";
            if (v13)
            {
              v24 = (__CFString *)v13;
            }
            else
            {
              v23 = &stru_1EFE17BD0;
              v24 = &stru_1EFE17BD0;
            }
            v40 = v23;
            v41 = v24;
            uint64_t v25 = [NSString stringWithFormat:@"Thread %d name:  %@%@%@", v9, v22];
            [v8 addObject:v25];
          }
          v26 = NSString;
          uint64_t v16 = [v11 objectForKeyedSubscript:@"triggered"];
          v27 = @" Crashed";
          if (!v16) {
            v27 = &stru_1EFE17BD0;
          }
          [v26 stringWithFormat:@"Thread %d%@:", v9, v27, v40, v41, v42, v43];
        v28 = };
        [v8 addObject:v28];

        v29 = [v11 objectForKeyedSubscript:@"frames"];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v53;
          uint64_t v33 = 0xFFFFFFFFLL;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v29);
              }
              int v35 = NSString;
              v36 = [(OSALegacyXform *)self formatFrame:*(void *)(*((void *)&v52 + 1) + 8 * i) withImages:v50 macosStyle:v51];
              uint64_t v37 = [v35 stringWithFormat:@"%-3d %@", v33 + i + 1, v36];
              [v8 addObject:v37];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
            uint64_t v33 = (v33 + i);
          }
          while (v31);
        }
        [v8 addObject:&stru_1EFE17BD0];

        uint64_t v10 = v49 + 1;
      }
      while (v49 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v46);
  }

  v38 = [v8 componentsJoinedByString:@"\n"];

  return v38;
}

- (id)formatImages:(id)a3 macosStyle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v40 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v45;
    BOOL v36 = v4;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v8 = [v7 objectForKeyedSubscript:@"uuid"];
        uint64_t v9 = v8;
        if (!v4)
        {
          uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EFE17BD0];

          uint64_t v9 = (void *)v10;
        }
        v11 = [v7 objectForKeyedSubscript:@"base"];
        uint64_t v12 = [v11 unsignedLongLongValue];
        uint64_t v13 = [v7 objectForKeyedSubscript:@"size"];
        uint64_t v14 = v12 + [v13 unsignedLongLongValue] - 1;

        uint64_t v15 = [v7 objectForKeyedSubscript:@"name"];
        uint64_t v16 = [v7 objectForKeyedSubscript:@"arch"];
        v17 = [v7 objectForKeyedSubscript:@"path"];
        uint64_t v18 = v17;
        uint64_t v42 = (void *)v16;
        uint64_t v43 = v11;
        if (v4)
        {
          v19 = [v7 objectForKeyedSubscript:@"CFBundleIdentifier"];
          if ([v19 length])
          {
            uint64_t v20 = v19;

            uint64_t v15 = v20;
          }
          uint64_t v21 = [v7 objectForKeyedSubscript:@"CFBundleShortVersionString"];
          if (![(__CFString *)v21 length])
          {

            uint64_t v21 = @"*";
          }
          v22 = NSString;
          if (v15)
          {
            int v23 = 0;
            v24 = v15;
          }
          else if (v18)
          {
            [(__CFString *)v18 lastPathComponent];
            int v23 = 1;
            int v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v24 = v35;
          }
          else
          {
            int v23 = 0;
            v24 = @"???";
          }
          v28 = @"???";
          if (v18) {
            v28 = v18;
          }
          v29 = [v22 stringWithFormat:@"%18p - %18p %@ (%@) <%@> %@", v12, v14, v24, v21, v9, v28];
          [v40 addObject:v29];

          if (v23) {
          BOOL v4 = v36;
          }
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v25 = NSString;
        if (v15)
        {
          int v26 = 0;
          v27 = v15;
        }
        else if (v17)
        {
          [(__CFString *)v17 lastPathComponent];
          v38 = int v26 = 1;
          v27 = (__CFString *)v38;
        }
        else
        {
          int v26 = 0;
          v27 = @"???";
        }
        uint64_t v30 = @"unknown-arch";
        if (v16) {
          uint64_t v30 = (__CFString *)v16;
        }
        uint64_t v31 = @"???";
        if (v18) {
          uint64_t v31 = v18;
        }
        uint64_t v32 = [v25 stringWithFormat:@"%18p - %18p %@ %@  <%@> %@", v12, v14, v27, v30, v9, v31];
        [v40 addObject:v32];

        v19 = (void *)v38;
        if (v26) {
          goto LABEL_33;
        }
LABEL_34:
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v41);
  }

  uint64_t v33 = [v40 componentsJoinedByString:@"\n"];

  return v33;
}

- (id)formatArm32ThreadState:(id)a3 index:(int)a4
{
  uint64_t v50 = *(void *)&a4;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"r"];
  v48 = NSString;
  long long v59 = [v5 objectAtIndexedSubscript:0];
  long long v58 = [v59 objectForKeyedSubscript:@"value"];
  uint64_t v45 = [v58 unsignedIntValue];
  long long v57 = [v5 objectAtIndexedSubscript:1];
  long long v56 = [v57 objectForKeyedSubscript:@"value"];
  uint64_t v42 = [v56 unsignedIntValue];
  long long v55 = [v5 objectAtIndexedSubscript:2];
  long long v54 = [v55 objectForKeyedSubscript:@"value"];
  uint64_t v40 = [v54 unsignedIntValue];
  long long v53 = [v5 objectAtIndexedSubscript:3];
  long long v52 = [v53 objectForKeyedSubscript:@"value"];
  uint64_t v38 = [v52 unsignedIntValue];
  BOOL v51 = [v5 objectAtIndexedSubscript:4];
  uint64_t v49 = [v51 objectForKeyedSubscript:@"value"];
  uint64_t v35 = [v49 unsignedIntValue];
  long long v47 = [v5 objectAtIndexedSubscript:5];
  long long v46 = [v47 objectForKeyedSubscript:@"value"];
  uint64_t v32 = [v46 unsignedIntValue];
  long long v44 = [v5 objectAtIndexedSubscript:6];
  uint64_t v43 = [v44 objectForKeyedSubscript:@"value"];
  uint64_t v30 = [v43 unsignedIntValue];
  uint64_t v41 = [v5 objectAtIndexedSubscript:7];
  uint64_t v39 = [v41 objectForKeyedSubscript:@"value"];
  uint64_t v27 = [v39 unsignedIntValue];
  uint64_t v37 = [v5 objectAtIndexedSubscript:8];
  BOOL v36 = [v37 objectForKeyedSubscript:@"value"];
  uint64_t v25 = [v36 unsignedIntValue];
  v34 = [v5 objectAtIndexedSubscript:9];
  uint64_t v33 = [v34 objectForKeyedSubscript:@"value"];
  uint64_t v22 = [v33 unsignedIntValue];
  uint64_t v31 = [v5 objectAtIndexedSubscript:10];
  v29 = [v31 objectForKeyedSubscript:@"value"];
  uint64_t v19 = [v29 unsignedIntValue];
  v28 = [v5 objectAtIndexedSubscript:11];
  int v26 = [v28 objectForKeyedSubscript:@"value"];
  uint64_t v17 = [v26 unsignedIntValue];
  v24 = [v4 objectForKeyedSubscript:@"ip"];
  int v23 = [v24 objectForKeyedSubscript:@"value"];
  uint64_t v16 = [v23 unsignedIntValue];
  uint64_t v21 = [v4 objectForKeyedSubscript:@"sp"];
  uint64_t v20 = [v21 objectForKeyedSubscript:@"value"];
  uint64_t v6 = [v20 unsignedIntValue];
  uint64_t v18 = [v4 objectForKeyedSubscript:@"lr"];
  id v7 = [v18 objectForKeyedSubscript:@"value"];
  uint64_t v8 = [v7 unsignedIntValue];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"pc"];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"value"];
  uint64_t v11 = [v10 unsignedIntValue];
  uint64_t v12 = [v4 objectForKeyedSubscript:@"cpsr"];

  uint64_t v13 = [v12 objectForKeyedSubscript:@"value"];
  objc_msgSend(v48, "stringWithFormat:", @"Thread %d crashed with ARM Thread State (32-bit):\n    r0: 0x%08x    r1: 0x%08x      r2: 0x%08x      r3: 0x%08x\n    r4: 0x%08x    r5: 0x%08x      r6: 0x%08x      r7: 0x%08x\n    r8: 0x%08x    r9: 0x%08x     r10: 0x%08x     r11: 0x%08x\n    ip: 0x%08x    sp: 0x%08x      lr: 0x%08x      pc: 0x%08x\n  cpsr: 0x%08x", v50, v45, v42, v40, v38, v35, v32, v30, v27, v25, v22, v19, v17, v16, v6, v8,
    v11,
  uint64_t v14 = [v13 unsignedIntValue]);

  return v14;
}

- (id)formatArm64ThreadState:(id)a3 index:(int)a4
{
  uint64_t v98 = *(void *)&a4;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"x"];
  v96 = NSString;
  v119 = [v5 objectAtIndexedSubscript:0];
  v118 = [v119 objectForKeyedSubscript:@"value"];
  uint64_t v93 = [v118 unsignedLongLongValue];
  v117 = [v5 objectAtIndexedSubscript:1];
  v116 = [v117 objectForKeyedSubscript:@"value"];
  uint64_t v91 = [v116 unsignedLongLongValue];
  v115 = [v5 objectAtIndexedSubscript:2];
  v114 = [v115 objectForKeyedSubscript:@"value"];
  uint64_t v88 = [v114 unsignedLongLongValue];
  v113 = [v5 objectAtIndexedSubscript:3];
  v112 = [v113 objectForKeyedSubscript:@"value"];
  uint64_t v86 = [v112 unsignedLongLongValue];
  v111 = [v5 objectAtIndexedSubscript:4];
  v110 = [v111 objectForKeyedSubscript:@"value"];
  uint64_t v83 = [v110 unsignedLongLongValue];
  v109 = [v5 objectAtIndexedSubscript:5];
  v108 = [v109 objectForKeyedSubscript:@"value"];
  uint64_t v81 = [v108 unsignedLongLongValue];
  v107 = [v5 objectAtIndexedSubscript:6];
  v106 = [v107 objectForKeyedSubscript:@"value"];
  uint64_t v79 = [v106 unsignedLongLongValue];
  v105 = [v5 objectAtIndexedSubscript:7];
  v104 = [v105 objectForKeyedSubscript:@"value"];
  uint64_t v76 = [v104 unsignedLongLongValue];
  v103 = [v5 objectAtIndexedSubscript:8];
  v102 = [v103 objectForKeyedSubscript:@"value"];
  uint64_t v73 = [v102 unsignedLongLongValue];
  v101 = [v5 objectAtIndexedSubscript:9];
  v100 = [v101 objectForKeyedSubscript:@"value"];
  uint64_t v71 = [v100 unsignedLongLongValue];
  v99 = [v5 objectAtIndexedSubscript:10];
  v97 = [v99 objectForKeyedSubscript:@"value"];
  uint64_t v69 = [v97 unsignedLongLongValue];
  v95 = [v5 objectAtIndexedSubscript:11];
  v94 = [v95 objectForKeyedSubscript:@"value"];
  uint64_t v66 = [v94 unsignedLongLongValue];
  v92 = [v5 objectAtIndexedSubscript:12];
  v90 = [v92 objectForKeyedSubscript:@"value"];
  uint64_t v63 = [v90 unsignedLongLongValue];
  v89 = [v5 objectAtIndexedSubscript:13];
  v87 = [v89 objectForKeyedSubscript:@"value"];
  uint64_t v61 = [v87 unsignedLongLongValue];
  v85 = [v5 objectAtIndexedSubscript:14];
  v84 = [v85 objectForKeyedSubscript:@"value"];
  uint64_t v59 = [v84 unsignedLongLongValue];
  v82 = [v5 objectAtIndexedSubscript:15];
  v80 = [v82 objectForKeyedSubscript:@"value"];
  uint64_t v56 = [v80 unsignedLongLongValue];
  v78 = [v5 objectAtIndexedSubscript:16];
  v77 = [v78 objectForKeyedSubscript:@"value"];
  uint64_t v53 = [v77 unsignedLongLongValue];
  v75 = [v5 objectAtIndexedSubscript:17];
  v74 = [v75 objectForKeyedSubscript:@"value"];
  uint64_t v51 = [v74 unsignedLongLongValue];
  v72 = [v5 objectAtIndexedSubscript:18];
  v70 = [v72 objectForKeyedSubscript:@"value"];
  uint64_t v49 = [v70 unsignedLongLongValue];
  v68 = [v5 objectAtIndexedSubscript:19];
  v67 = [v68 objectForKeyedSubscript:@"value"];
  uint64_t v46 = [v67 unsignedLongLongValue];
  v65 = [v5 objectAtIndexedSubscript:20];
  v64 = [v65 objectForKeyedSubscript:@"value"];
  uint64_t v44 = [v64 unsignedLongLongValue];
  uint64_t v62 = [v5 objectAtIndexedSubscript:21];
  v60 = [v62 objectForKeyedSubscript:@"value"];
  uint64_t v41 = [v60 unsignedLongLongValue];
  long long v58 = [v5 objectAtIndexedSubscript:22];
  long long v57 = [v58 objectForKeyedSubscript:@"value"];
  uint64_t v39 = [v57 unsignedLongLongValue];
  long long v55 = [v5 objectAtIndexedSubscript:23];
  long long v54 = [v55 objectForKeyedSubscript:@"value"];
  uint64_t v36 = [v54 unsignedLongLongValue];
  long long v52 = [v5 objectAtIndexedSubscript:24];
  uint64_t v50 = [v52 objectForKeyedSubscript:@"value"];
  uint64_t v34 = [v50 unsignedLongLongValue];
  v48 = [v5 objectAtIndexedSubscript:25];
  long long v47 = [v48 objectForKeyedSubscript:@"value"];
  uint64_t v31 = [v47 unsignedLongLongValue];
  uint64_t v45 = [v5 objectAtIndexedSubscript:26];
  uint64_t v43 = [v45 objectForKeyedSubscript:@"value"];
  uint64_t v29 = [v43 unsignedLongLongValue];
  uint64_t v42 = [v5 objectAtIndexedSubscript:27];
  uint64_t v40 = [v42 objectForKeyedSubscript:@"value"];
  uint64_t v25 = [v40 unsignedLongLongValue];
  uint64_t v38 = [v5 objectAtIndexedSubscript:28];
  uint64_t v37 = [v38 objectForKeyedSubscript:@"value"];
  uint64_t v23 = [v37 unsignedLongLongValue];
  uint64_t v35 = [v4 objectForKeyedSubscript:@"fp"];
  uint64_t v33 = [v35 objectForKeyedSubscript:@"value"];
  uint64_t v20 = [v33 unsignedLongLongValue];
  uint64_t v32 = [v4 objectForKeyedSubscript:@"lr"];
  uint64_t v30 = [v32 objectForKeyedSubscript:@"value"];
  uint64_t v19 = [v30 unsignedLongLongValue];
  v28 = [v4 objectForKeyedSubscript:@"sp"];
  uint64_t v27 = [v28 objectForKeyedSubscript:@"value"];
  uint64_t v18 = [v27 unsignedLongLongValue];
  int v26 = [v4 objectForKeyedSubscript:@"pc"];
  v24 = [v26 objectForKeyedSubscript:@"value"];
  uint64_t v17 = [v24 unsignedLongLongValue];
  uint64_t v22 = [v4 objectForKeyedSubscript:@"cpsr"];
  uint64_t v21 = [v22 objectForKeyedSubscript:@"value"];
  uint64_t v6 = [v21 unsignedIntValue];
  id v7 = [v4 objectForKeyedSubscript:@"far"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"value"];
  uint64_t v9 = [v8 unsignedLongLongValue];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"esr"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"value"];
  uint64_t v12 = [v11 unsignedIntValue];
  uint64_t v13 = [v4 objectForKeyedSubscript:@"esr"];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"description"];
  objc_msgSend(v96, "stringWithFormat:", @"Thread %d crashed with ARM Thread State (64-bit):\n    x0: 0x%016qx   x1: 0x%016qx   x2: 0x%016qx   x3: 0x%016qx\n    x4: 0x%016qx   x5: 0x%016qx   x6: 0x%016qx   x7: 0x%016qx\n    x8: 0x%016qx   x9: 0x%016qx  x10: 0x%016qx  x11: 0x%016qx\n   x12: 0x%016qx  x13: 0x%016qx  x14: 0x%016qx  x15: 0x%016qx\n   x16: 0x%016qx  x17: 0x%016qx  x18: 0x%016qx  x19: 0x%016qx\n   x20: 0x%016qx  x21: 0x%016qx  x22: 0x%016qx  x23: 0x%016qx\n   x24: 0x%016qx  x25: 0x%016qx  x26: 0x%016qx  x27: 0x%016qx\n   x28: 0x%016qx   fp: 0x%016llx   lr: 0x%016llx\n    sp: 0x%016llx   pc: 0x%016llx cpsr: 0x%08x\n   far: 0x%016llx  esr: 0x%08x %@", v98, v93, v91, v88, v86, v83, v81, v79, v76, v73, v71, v69, v66, v63, v61, v59,
    v56,
    v53,
    v51,
    v49,
    v46,
    v44,
    v41,
    v39,
    v36,
    v34,
    v31,
    v29,
    v25,
    v23,
    v20,
    v19,
    v18,
    v17,
    v6,
    v9,
    v12,
  uint64_t v15 = v14);

  return v15;
}

- (id)formatX86ThreadState:(id)a3 index:(int)a4
{
  uint64_t v80 = *(void *)&a4;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"rosetta"];
  uint64_t v81 = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = NSString;
    uint64_t v8 = [v5 objectForKeyedSubscript:@"tmp0"];
    v82 = [v8 objectForKeyedSubscript:@"value"];
    uint64_t v9 = [v82 unsignedLongLongValue];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"tmp1"];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"value"];
    uint64_t v12 = [v11 unsignedLongLongValue];
    uint64_t v13 = [v6 objectForKeyedSubscript:@"tmp2"];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"value"];
    v84 = objc_msgSend(v7, "stringWithFormat:", @"\n tmp0: 0x%016qx tmp1: 0x%016qx tmp2: 0x%016qx\n", v9, v12, objc_msgSend(v14, "unsignedLongLongValue"));
  }
  else
  {
    uint64_t v15 = [v4 objectForKeyedSubscript:@"trap"];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"description"];

    v85 = NSString;
    v82 = [v4 objectForKeyedSubscript:@"cr2"];
    uint64_t v10 = [v82 objectForKeyedSubscript:@"value"];
    uint64_t v78 = [v10 unsignedLongLongValue];
    uint64_t v11 = [v4 objectForKeyedSubscript:@"cpu"];
    uint64_t v13 = [v11 objectForKeyedSubscript:@"value"];
    uint64_t v76 = [v13 intValue];
    uint64_t v14 = [v4 objectForKeyedSubscript:@"err"];
    uint64_t v17 = [v14 objectForKeyedSubscript:@"value"];
    uint64_t v18 = [v17 unsignedIntValue];
    v74 = v16;
    if (!v16) {
      uint64_t v16 = &stru_1EFE17BD0;
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"trap"];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"value"];
    v84 = [v85 stringWithFormat:@"  cr2: 0x%016qx\n  \nLogical CPU:     %d\nError Code:      0x%08x %@\nTrap Number:     %d\n", v78, v76, v18, v16, objc_msgSend(v20, "intValue")];

    uint64_t v8 = v74;
  }

  uint64_t v21 = [v4 objectForKeyedSubscript:@"rip"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"value"];

  uint64_t v79 = v22;
  if (v22)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0x%016qx", objc_msgSend(v22, "unsignedLongLongValue"));
    uint64_t v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v83 = @"<unavailable>     ";
  }
  v65 = NSString;
  v77 = [v4 objectForKeyedSubscript:@"rax"];
  v75 = [v77 objectForKeyedSubscript:@"value"];
  uint64_t v62 = [v75 unsignedLongLongValue];
  uint64_t v73 = [v4 objectForKeyedSubscript:@"rbx"];
  v72 = [v73 objectForKeyedSubscript:@"value"];
  uint64_t v59 = [v72 unsignedLongLongValue];
  uint64_t v71 = [v4 objectForKeyedSubscript:@"rcx"];
  v70 = [v71 objectForKeyedSubscript:@"value"];
  uint64_t v57 = [v70 unsignedLongLongValue];
  uint64_t v69 = [v4 objectForKeyedSubscript:@"rdx"];
  v68 = [v69 objectForKeyedSubscript:@"value"];
  uint64_t v54 = [v68 unsignedLongLongValue];
  v67 = [v4 objectForKeyedSubscript:@"rdi"];
  uint64_t v66 = [v67 objectForKeyedSubscript:@"value"];
  uint64_t v52 = [v66 unsignedLongLongValue];
  v64 = [v4 objectForKeyedSubscript:@"rsi"];
  uint64_t v63 = [v64 objectForKeyedSubscript:@"value"];
  uint64_t v49 = [v63 unsignedLongLongValue];
  uint64_t v61 = [v4 objectForKeyedSubscript:@"rbp"];
  v60 = [v61 objectForKeyedSubscript:@"value"];
  uint64_t v47 = [v60 unsignedLongLongValue];
  long long v58 = [v4 objectForKeyedSubscript:@"rsp"];
  uint64_t v56 = [v58 objectForKeyedSubscript:@"value"];
  uint64_t v45 = [v56 unsignedLongLongValue];
  long long v55 = [v4 objectForKeyedSubscript:@"r8"];
  uint64_t v53 = [v55 objectForKeyedSubscript:@"value"];
  uint64_t v42 = [v53 unsignedLongLongValue];
  uint64_t v51 = [v4 objectForKeyedSubscript:@"r9"];
  uint64_t v50 = [v51 objectForKeyedSubscript:@"value"];
  uint64_t v39 = [v50 unsignedLongLongValue];
  v48 = [v4 objectForKeyedSubscript:@"r10"];
  uint64_t v46 = [v48 objectForKeyedSubscript:@"value"];
  uint64_t v37 = [v46 unsignedLongLongValue];
  uint64_t v44 = [v4 objectForKeyedSubscript:@"r11"];
  uint64_t v43 = [v44 objectForKeyedSubscript:@"value"];
  uint64_t v35 = [v43 unsignedLongLongValue];
  uint64_t v41 = [v4 objectForKeyedSubscript:@"r12"];
  uint64_t v40 = [v41 objectForKeyedSubscript:@"value"];
  uint64_t v34 = [v40 unsignedLongLongValue];
  uint64_t v38 = [v4 objectForKeyedSubscript:@"r13"];
  uint64_t v36 = [v38 objectForKeyedSubscript:@"value"];
  uint64_t v23 = [v36 unsignedLongLongValue];
  v24 = [v4 objectForKeyedSubscript:@"r14"];
  uint64_t v25 = [v24 objectForKeyedSubscript:@"value"];
  uint64_t v26 = [v25 unsignedLongLongValue];
  uint64_t v27 = [v4 objectForKeyedSubscript:@"r15"];
  v28 = [v27 objectForKeyedSubscript:@"value"];
  uint64_t v29 = [v28 unsignedLongLongValue];
  uint64_t v30 = [v4 objectForKeyedSubscript:@"rflags"];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"value"];
  objc_msgSend(v65, "stringWithFormat:", @"Thread %d crashed with X86 Thread State (64-bit):\n  rax: 0x%016qx  rbx: 0x%016qx  rcx: 0x%016qx  rdx: 0x%016qx\n  rdi: 0x%016qx  rsi: 0x%016qx  rbp: 0x%016qx  rsp: 0x%016qx\n   r8: 0x%016qx   r9: 0x%016qx  r10: 0x%016qx  r11: 0x%016qx\n  r12: 0x%016qx  r13: 0x%016qx  r14: 0x%016qx  r15: 0x%016qx\n  rip: %@  rfl: 0x%016qx%@", v80, v62, v59, v57, v54, v52, v49, v47, v45, v42, v39, v37, v35, v34, v23, v26,
    v29,
    v83,
    [v31 unsignedLongLongValue],
  uint64_t v32 = v84);

  return v32;
}

- (id)formatLastException:(id)a3 withImages:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = 0xFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = NSString;
        uint64_t v15 = [(OSALegacyXform *)self formatFrame:*(void *)(*((void *)&v20 + 1) + 8 * i) withImages:v7 macosStyle:0];
        uint64_t v16 = [v14 stringWithFormat:@"%-3d %@", v12 + i + 1, v15];
        [v8 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v12 = (v12 + i);
    }
    while (v10);
  }

  uint64_t v17 = [v8 componentsJoinedByString:@"\n"];

  return v17;
}

- (id)formatLastBranchState:(id)a3 index:(int)a4 withImages:(id)a5
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v29 = a5;
  uint64_t v9 = objc_opt_new();
  unint64_t v10 = 0x1E4F29000uLL;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %d last branch register state:", v7);
  v28 = v9;
  [v9 addObject:v11];

  if ([v8 count])
  {
    unint64_t v12 = 0;
    uint64_t v26 = v8;
    do
    {
      uint64_t v13 = [v8 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v13 objectAtIndexedSubscript:2];
      uint64_t v31 = *(void **)(v10 + 24);
      uint64_t v15 = [v13 objectAtIndexedSubscript:0];
      uint64_t v16 = -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:");
      uint64_t v17 = [v13 objectAtIndexedSubscript:1];
      uint64_t v18 = [(OSALegacyXform *)self formatFrame:v17 withImages:v29 macosStyle:1];
      uint64_t v19 = [v14 count];
      if (v19)
      {
        long long v20 = *(void **)(v10 + 24);
        uint64_t v30 = [v14 componentsJoinedByString:@", "];
        id v5 = [v20 stringWithFormat:@"(%@)", v30];
        long long v21 = v5;
      }
      else
      {
        long long v21 = &stru_1EFE17BD0;
      }
      long long v22 = (void *)v15;
      long long v23 = [v31 stringWithFormat:@"  [%02d] (%@) -> (%@)\t%@", v12, v16, v18, v21];
      [v28 addObject:v23];

      if (v19)
      {
      }
      ++v12;
      id v8 = v26;
      unint64_t v10 = 0x1E4F29000;
    }
    while ([v26 count] > v12);
  }
  v24 = [v28 componentsJoinedByString:@"\n"];

  return v24;
}

- (id)_hexDump:(id)a3 offset:(int)a4 indicator:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_opt_new();
  long long v23 = 0u;
  memset(v24, 0, 28);
  long long v21 = 0u;
  long long v22 = 0u;
  *(_DWORD *)__str = 0;
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = [v7 objectAtIndexedSubscript:v9];
      unsigned int v11 = [v10 intValue];

      unint64_t v12 = v9 & 0xF;
      if (v12 == 9)
      {
        BYTE9(v22) = 45;
      }
      else if ((v9 & 0xF) == 0)
      {
        strcpy((char *)v24 + 15, "    ");
        *(void *)&long long v13 = 0x2020202020202020;
        *((void *)&v13 + 1) = 0x2020202020202020;
        long long v23 = v13;
        v24[0] = v13;
        long long v21 = v13;
        long long v22 = v13;
      }
      if (v11 > 0x7F) {
        int v14 = __maskrune(v11, 0x40000uLL);
      }
      else {
        int v14 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v11 + 60) & 0x40000;
      }
      if (v14) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = 46;
      }
      snprintf(__str, 4uLL, "%02x%c", v11, v15);
      uint64_t v16 = (3 * v12);
      *(_WORD *)((char *)&v21 + v16 + 2) = *(_WORD *)__str;
      *(unsigned char *)((v12 | (unint64_t)&v21) + 0x33) = __str[2];
      if (a4 == v9)
      {
        uint64_t v17 = (char *)&v21 + v16;
        v17[1] = 91;
        v17[4] = 93;
        if (v5) {
          __sprintf_chk((char *)&v24[1] + 3, 0, 9uLL, "\t<==");
        }
      }
      if (v12 == 15 || v9 == [v7 count] - 1)
      {
        uint64_t v18 = [NSString stringWithUTF8String:&v21];
        [v8 addObject:v18];
      }
      ++v9;
    }
    while ([v7 count] > v9);
  }

  return v8;
}

- (id)formatInstructionState:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [v6 objectForKeyedSubscript:@"instructionStream"];
  unint64_t v9 = [v6 objectForKeyedSubscript:@"cacheLine"];

  if (v8)
  {
    unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %d instruction stream:", v4);
    [v7 addObject:v10];

    unsigned int v11 = [v8 objectForKeyedSubscript:@"bytes"];
    unint64_t v12 = [v8 objectForKeyedSubscript:@"offset"];
    long long v13 = -[OSALegacyXform _hexDump:offset:indicator:](self, "_hexDump:offset:indicator:", v11, [v12 intValue], 1);
    [v7 addObjectsFromArray:v13];

    if (!v9) {
      goto LABEL_7;
    }
    [v7 addObject:@"  Cacheline:"];
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    int v14 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %d instruction stream (single cacheline):", v4);
    [v7 addObject:v14];
  }
  uint64_t v15 = [v9 objectForKeyedSubscript:@"bytes"];
  uint64_t v16 = [v9 objectForKeyedSubscript:@"offset"];
  uint64_t v17 = -[OSALegacyXform _hexDump:offset:indicator:](self, "_hexDump:offset:indicator:", v15, [v16 intValue], 0);
  [v7 addObjectsFromArray:v17];

LABEL_7:
  uint64_t v18 = [v7 componentsJoinedByString:@"\n"];

  return v18;
}

- (id)_getValueForKey:(id)a3 fromBody:(id)a4 orHeader:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([&unk_1EFE25EB0 containsObject:v8])
  {
    id v11 = [(OSALegacyXform *)self _getValueForKey:@"faultingThread" fromBody:v9 orHeader:0];
    if (!v11)
    {
      uint64_t v26 = 0;
      goto LABEL_21;
    }
    id v12 = [v9 objectForKeyedSubscript:@"threads"];
    long long v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", (int)objc_msgSend(v11, "intValue"));
    int v14 = v13;
    id v15 = v8;
  }
  else
  {
    id v11 = v9;
    if ([v8 hasPrefix:@"metadata:"])
    {
      id v16 = v10;

      uint64_t v17 = [v8 stringByReplacingOccurrencesOfString:@"metadata:" withString:&stru_1EFE17BD0];

      id v11 = v16;
      id v8 = (id)v17;
    }
    uint64_t v18 = [v8 componentsSeparatedByString:@"."];
    uint64_t v19 = [v18 count];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = v18;
    uint64_t v20 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      id v28 = v10;
      id v29 = v9;
      while (2)
      {
        uint64_t v23 = 0;
        uint64_t v24 = v19 - 1;
        v19 -= v21;
        uint64_t v25 = v11;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v12);
          }
          if (v24 == v23) {
            goto LABEL_18;
          }
          id v11 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * v23)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

LABEL_18:
            id v11 = v25;
            id v10 = v28;
            id v9 = v29;
            goto LABEL_19;
          }

          ++v23;
          uint64_t v25 = v11;
        }
        while (v21 != v23);
        uint64_t v21 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
        id v10 = v28;
        id v9 = v29;
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    int v14 = [v12 lastObject];
    long long v13 = v11;
    id v15 = v14;
  }
  uint64_t v26 = objc_msgSend(v13, "objectForKeyedSubscript:", v15, v28, v29, (void)v30);

LABEL_21:
  return v26;
}

- (BOOL)transformJSON:(id)a3 header:(id)a4 error:(id *)a5 streamingBlock:(id)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [v11 objectForKeyedSubscript:@"bug_type"];
  int v14 = [(NSMutableDictionary *)self->_templates objectForKeyedSubscript:v13];
  id v15 = objc_opt_new();
  if (v14)
  {
    BOOL v16 = [(OSALegacyXform *)self transformLines:v14 withDefinitions:v15 body:v10 header:v11 error:a5 streamingBlock:v12];
  }
  else
  {
    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = [NSString stringWithFormat:@"'%@' template not found", v13, *MEMORY[0x1E4F28568]];
      v22[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a5 = [v17 errorWithDomain:@"OSALegacyXform" code:1 userInfo:v19];
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)transformLines:(id)a3 withDefinitions:(id)a4 body:(id)a5 header:(id)a6 error:(id *)a7 streamingBlock:(id)a8
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v54 = a4;
  id v61 = a5;
  id v59 = a6;
  uint64_t v52 = (void (**)(char *, void *))a8;
  id v84 = 0;
  uint64_t v51 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"\\$\\((([^\\)\"]+|\"[^\"]+\")+)\\"), 0, &v84);
  id v48 = v84;
  long long v13 = [(OSALegacyXform *)self _getValueForKey:@"osVersion.train" fromBody:v61 orHeader:v59];
  char v49 = [v13 hasPrefix:@"macOS"];

  uint64_t v50 = [(OSALegacyXform *)self _getValueForKey:@"faultingThread" fromBody:v61 orHeader:0];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v12;
  uint64_t v57 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  BOOL v46 = v57 == 0;
  if (v57)
  {
    long long v58 = 0;
    int v14 = 0;
    uint64_t v56 = *(void *)v81;
    uint64_t v53 = v52 + 2;
    while (1)
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v81 != v56) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        if (v14)
        {
          if (![*(id *)(*((void *)&v80 + 1) + 8 * i) hasPrefix:@"#"]))
          {
            [v58 addObject:v16];
            continue;
          }
          [v54 setObject:v58 forKeyedSubscript:v14];

          long long v58 = 0;
        }
        else
        {
          if ([*(id *)(*((void *)&v80 + 1) + 8 * i) hasPrefix:@"#("]
          {
            int v14 = [v16 substringFromIndex:2];
            uint64_t v17 = objc_opt_new();

            long long v58 = (void *)v17;
            continue;
          }
          uint64_t v76 = 0;
          v77 = &v76;
          uint64_t v78 = 0x2020000000;
          uint64_t v79 = 0;
          uint64_t v18 = objc_msgSend(v16, "rangeOfString:options:", @"\\^\\([^\\)]+\\"), 1040);
          uint64_t v20 = v18;
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v21 = v19;
            uint64_t v22 = objc_msgSend(v16, "substringWithRange:", v18 + 2, v19 - 3);
            uint64_t v23 = [v22 componentsSeparatedByString:@"&"];

            v77[3] = v21 + v20;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            uint64_t v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v72 objects:v87 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v73;
              while (2)
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v73 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  id v28 = *(id *)(*((void *)&v72 + 1) + 8 * j);
                  if ([v28 hasPrefix:@"!"])
                  {
                    uint64_t v29 = [v28 substringFromIndex:1];

                    int v30 = 1;
                    id v28 = (id)v29;
                  }
                  else
                  {
                    int v30 = 0;
                  }
                  int v31 = [v28 hasPrefix:@"*"];
                  if (v31)
                  {
                    uint64_t v32 = [v28 substringFromIndex:1];

                    id v28 = (id)v32;
                  }
                  long long v33 = [(OSALegacyXform *)self _getValueForKey:v28 fromBody:v61 orHeader:v59];
                  int v34 = v33 != 0;
                  if (v33) {
                    int v35 = v31;
                  }
                  else {
                    int v35 = 0;
                  }
                  if (v35 == 1)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
                      int v34 = [v33 count] != 0;
                    }
                    else {
                      int v34 = [v33 BOOLValue];
                    }
                  }
                  BOOL v36 = v30 == v34;

                  if (v36)
                  {
                    uint64_t v41 = v24;
                    goto LABEL_39;
                  }
                }
                uint64_t v25 = [v24 countByEnumeratingWithState:&v72 objects:v87 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v37 = [v16 substringFromIndex:v77[3]];
          v77[3] = 0;
          uint64_t v38 = [v37 length];
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke;
          v62[3] = &unk_1E5D20400;
          uint64_t v39 = v52;
          uint64_t v69 = v39;
          id v40 = v37;
          id v63 = v40;
          v70 = &v76;
          id v64 = v54;
          v65 = self;
          id v66 = v61;
          id v67 = v59;
          char v71 = v49;
          id v68 = v50;
          objc_msgSend(v51, "enumerateMatchesInString:options:range:usingBlock:", v40, 0, 0, v38, v62);
          uint64_t v41 = [v40 substringFromIndex:v77[3]];

          if ([v41 length]) {
            (*v53)(v39, v41);
          }
          (*v53)(v39, @"\n");

          uint64_t v24 = v69;
LABEL_39:

          _Block_object_dispose(&v76, 8);
        }
        int v14 = 0;
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (!v57)
      {

        BOOL v42 = v14 == 0;
        if (a7 && v14)
        {
          uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          uint64_t v86 = @"template has illformed definition";
          uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          *a7 = [v43 errorWithDomain:@"OSALegacyXform" code:2 userInfo:v44];
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
  }
  int v14 = 0;
  long long v58 = 0;
  uint64_t v44 = obj;
LABEL_47:

  BOOL v42 = v46;
LABEL_48:

  return v42;
}

void __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 rangeAtIndex:0];
  uint64_t v6 = v5;
  long long v72 = v3;
  uint64_t v7 = [v3 rangeAtIndex:1];
  uint64_t v9 = v8;
  uint64_t v10 = a1[10];
  uint64_t v11 = *(void *)(*(void *)(a1[11] + 8) + 24);
  id v12 = objc_msgSend((id)a1[4], "substringWithRange:", v11, v4 - v11);
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  uint64_t v69 = v9;
  uint64_t v70 = v7;
  char v71 = objc_msgSend((id)a1[4], "substringWithRange:", v7, v9);
  [v71 componentsSeparatedByString:@"|"];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
  if (!v13) {
    goto LABEL_79;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v97;
  long long v80 = a1;
  uint64_t v74 = *(void *)v97;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v73 = v14;
    do
    {
      if (*(void *)v97 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v96 + 1) + 8 * v16);
      uint64_t v18 = [v17 componentsSeparatedByString:@"#"];
      uint64_t v78 = v16;
      if ([v18 count] == 2)
      {
        uint64_t v19 = (void *)a1[5];
        uint64_t v20 = [v18 objectAtIndexedSubscript:0];
        uint64_t v21 = [v19 objectForKeyedSubscript:v20];

        if (!v21) {
          goto LABEL_78;
        }
        uint64_t v22 = (void *)a1[6];
        uint64_t v23 = [v18 objectAtIndexedSubscript:1];
        uint64_t v24 = [v22 _getValueForKey:v23 fromBody:a1[7] orHeader:a1[8]];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v76 = v24;
          v77 = v18;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v79 = v24;
          uint64_t v25 = [v79 countByEnumeratingWithState:&v92 objects:v106 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = 0;
            uint64_t v28 = *(void *)v93;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v93 != v28) {
                  objc_enumerationMutation(v79);
                }
                uint64_t v30 = *(void *)(*((void *)&v92 + 1) + 8 * i);
                uint64_t v31 = v80[5];
                uint64_t v32 = (void *)v80[6];
                v104[0] = @"<index>";
                long long v33 = [NSNumber numberWithInt:v27 + i];
                v104[1] = @"<item>";
                v105[0] = v33;
                v105[1] = v30;
                int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
                id v91 = 0;
                [v32 transformLines:v21 withDefinitions:v31 body:v34 header:0 error:&v91 streamingBlock:v80[10]];
                id v35 = v91;
              }
              uint64_t v26 = [v79 countByEnumeratingWithState:&v92 objects:v106 count:16];
              uint64_t v27 = (v27 + i);
            }
            while (v26);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_31:

            uint64_t v6 = [(id)a1[4] length];
            uint64_t v4 = 0;
            uint64_t v15 = v74;
            goto LABEL_32;
          }
          uint64_t v76 = v24;
          v77 = v18;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v38 = v24;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v87 objects:v103 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v88;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v88 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v44 = v80[5];
                uint64_t v43 = (void *)v80[6];
                v102[0] = *(void *)(*((void *)&v87 + 1) + 8 * j);
                v101[0] = @"<key>";
                v101[1] = @"<value>";
                uint64_t v45 = objc_msgSend(v38, "objectForKeyedSubscript:");
                v102[1] = v45;
                BOOL v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
                id v86 = 0;
                [v43 transformLines:v21 withDefinitions:v44 body:v46 header:0 error:&v86 streamingBlock:v80[10]];
                id v47 = v86;
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v87 objects:v103 count:16];
            }
            while (v40);
          }
        }
        uint64_t v24 = v76;

        uint64_t v18 = v77;
        uint64_t v14 = v73;
        a1 = v80;
        goto LABEL_31;
      }
      if (([v17 hasPrefix:@"\""] & 1) == 0)
      {
        uint64_t v37 = [(id)a1[6] _getValueForKey:v17 fromBody:a1[7] orHeader:a1[8]];
        if (!v37) {
          goto LABEL_32;
        }
LABEL_35:
        if ([v17 isEqualToString:@"threads"])
        {
          id v48 = (void *)a1[6];
          char v49 = [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
          uint64_t v50 = [v48 formatCallstacks:v37 withImages:v49 macosStyle:*((unsigned __int8 *)a1 + 96)];
LABEL_37:
          uint64_t v51 = (void *)v50;

          goto LABEL_52;
        }
        if (![v17 isEqualToString:@"threadState"])
        {
          if ([v17 isEqualToString:@"instructionState"])
          {
            uint64_t v54 = objc_msgSend((id)a1[6], "formatInstructionState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
          }
          else
          {
            if ([v17 isEqualToString:@"lastBranchState"])
            {
              long long v55 = (void *)a1[6];
              uint64_t v56 = [(id)a1[9] intValue];
              char v49 = [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
              uint64_t v50 = [v55 formatLastBranchState:v37 index:v56 withImages:v49];
              goto LABEL_37;
            }
            if ([v17 isEqualToString:@"lastExceptionBacktrace"])
            {
              long long v58 = (void *)a1[6];
              char v49 = [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
              uint64_t v50 = [v58 formatLastException:v37 withImages:v49];
              goto LABEL_37;
            }
            if ([v17 hasPrefix:@"usedImages"])
            {
              uint64_t v54 = [(id)a1[6] formatImages:v37 macosStyle:*((unsigned __int8 *)a1 + 96)];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                (*(void (**)(void))(a1[10] + 16))();
LABEL_77:

LABEL_78:
                goto LABEL_79;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v54 = [v37 stringValue];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v57 = a1[10];
                  goto LABEL_75;
                }
                if ([v37 count])
                {
                  id v59 = [v37 firstObject];
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();

                  if (isKindOfClass)
                  {
                    id v61 = objc_opt_new();
                    long long v82 = 0u;
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    id v81 = v37;
                    uint64_t v62 = [v81 countByEnumeratingWithState:&v82 objects:v100 count:16];
                    if (v62)
                    {
                      uint64_t v63 = v62;
                      uint64_t v64 = *(void *)v83;
                      do
                      {
                        for (uint64_t k = 0; k != v63; ++k)
                        {
                          if (*(void *)v83 != v64) {
                            objc_enumerationMutation(v81);
                          }
                          id v66 = objc_msgSend(NSString, "stringWithFormat:", @"0x%016qx", objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * k), "longLongValue"));
                          [v61 addObject:v66];
                        }
                        uint64_t v63 = [v81 countByEnumeratingWithState:&v82 objects:v100 count:16];
                      }
                      while (v63);
                    }

                    uint64_t v51 = [v61 componentsJoinedByString:@", "];

LABEL_52:
                    uint64_t v57 = a1[10];
                    if (v51)
                    {
                      (*(void (**)(void, void *))(v57 + 16))(a1[10], v51);
LABEL_76:

                      goto LABEL_77;
                    }
LABEL_75:
                    id v67 = NSString;
                    uint64_t v51 = objc_msgSend((id)a1[4], "substringWithRange:", v70, v69);
                    id v68 = [v67 stringWithFormat:@"{%@}", v51];
                    (*(void (**)(uint64_t, void *))(v57 + 16))(v57, v68);

                    goto LABEL_76;
                  }
                }
                uint64_t v54 = [v37 componentsJoinedByString:@"\n"];
              }
            }
          }
          uint64_t v51 = (void *)v54;
          goto LABEL_52;
        }
        uint64_t v52 = [v37 objectForKeyedSubscript:@"flavor"];
        if ([v52 isEqualToString:@"ARM_THREAD_STATE64"])
        {
          uint64_t v53 = objc_msgSend((id)a1[6], "formatArm64ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }
        else if ([v52 isEqualToString:@"ARM_THREAD_STATE32"])
        {
          uint64_t v53 = objc_msgSend((id)a1[6], "formatArm32ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }
        else
        {
          if (![v52 isEqualToString:@"x86_THREAD_STATE"])
          {
            uint64_t v51 = 0;
            goto LABEL_51;
          }
          uint64_t v53 = objc_msgSend((id)a1[6], "formatX86ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }
        uint64_t v51 = (void *)v53;
LABEL_51:

        goto LABEL_52;
      }
      BOOL v36 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\""];
      uint64_t v37 = [v17 stringByTrimmingCharactersInSet:v36];

      if (v37) {
        goto LABEL_35;
      }
LABEL_32:

      uint64_t v16 = v78 + 1;
    }
    while (v78 + 1 != v14);
    uint64_t v14 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_79:

  *(void *)(*(void *)(a1[11] + 8) + 24) = v4 + v6;
}

+ (id)rollSchemaForward:(id)a3
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v62 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([A-Z_]+), (\\[0x[0-9a-zA-Z]\\])?(.*)$", 0, 0 options error];
  id v65 = (id)objc_opt_new();
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v3;
  uint64_t v68 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v117;
    v60 = v107;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v117 != v66) {
          objc_enumerationMutation(obj);
        }
        long long v72 = *(void **)(*((void *)&v116 + 1) + 8 * v70);
        char v71 = [obj objectForKeyedSubscript:v60];
        if (![v72 isEqualToString:@"asi"])
        {
          if ([v72 isEqualToString:@"termination"])
          {
            id v74 = v71;
            uint64_t v4 = objc_opt_new();
            uint64_t v5 = [v74 objectForKeyedSubscript:@"namespace"];
            [v4 setObject:v5 forKeyedSubscript:@"namespace"];

            uint64_t v6 = [v74 objectForKeyedSubscript:@"code"];
            [v4 setObject:v6 forKeyedSubscript:@"code"];

            uint64_t v7 = [v74 objectForKeyedSubscript:@"flag"];
            [v4 setObject:v7 forKeyedSubscript:@"flag"];

            uint64_t v8 = [v74 objectForKeyedSubscript:@"signal"];
            if (v8) {
              [v4 setObject:v8 forKeyedSubscript:@"indicator"];
            }
            uint64_t v9 = [v74 objectForKeyedSubscript:@"description"];

            if (v9
              || ([v74 objectForKeyedSubscript:@"reason"],
                  (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v110 = 0;
              v111 = &v110;
              uint64_t v112 = 0x3032000000;
              v113 = __Block_byref_object_copy__7;
              v114 = __Block_byref_object_dispose__7;
              id v115 = 0;
              uint64_t v10 = [v9 length];
              v106[0] = MEMORY[0x1E4F143A8];
              v106[1] = 3221225472;
              v107[0] = __36__OSALegacyXform_rollSchemaForward___block_invoke;
              v107[1] = &unk_1E5D20450;
              v109 = &v110;
              id v11 = v9;
              id v108 = v11;
              objc_msgSend(v62, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v10, v106);
              if (v111[5]) {
                id v12 = (void *)v111[5];
              }
              else {
                id v12 = v11;
              }
              uint64_t v13 = [v12 componentsSeparatedByString:@"|"];
              uint64_t v14 = [v13 valueForKey:@"stringByTrimming"];
              [v4 setObject:v14 forKeyedSubscript:@"reasons"];

              _Block_object_dispose(&v110, 8);
            }
            uint64_t v15 = [v74 objectForKeyedSubscript:@"details"];
            uint64_t v16 = v15;
            if (v15)
            {
              uint64_t v17 = [v15 componentsSeparatedByString:@"|"];
              uint64_t v18 = [v17 valueForKey:@"stringByTrimming"];
              [v4 setObject:v18 forKeyedSubscript:@"details"];
            }
            [v65 setObject:v4 forKeyedSubscript:v72];

LABEL_23:
            goto LABEL_24;
          }
          if ([v72 isEqualToString:@"legacyInfo"])
          {
            id v74 = [v71 objectForKeyedSubscript:@"threadTriggered"];
            uint64_t v19 = [v74 objectForKeyedSubscript:@"index"];
            [v65 setObject:v19 forKeyedSubscript:@"faultingThread"];

            [v65 setObject:v71 forKeyedSubscript:v72];
            goto LABEL_23;
          }
          if (![v72 isEqualToString:@"threads"])
          {
            if ([v72 isEqualToString:@"usedImages"])
            {
              id v45 = v71;
              long long v85 = objc_opt_new();
              long long v83 = [obj objectForKeyedSubscript:@"legacyInfo"];
              BOOL v46 = [v83 objectForKeyedSubscript:@"imageExtraInfo"];
              long long v88 = 0u;
              long long v89 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              id v74 = v45;
              uint64_t v47 = [v74 countByEnumeratingWithState:&v86 objects:v120 count:16];
              if (v47)
              {
                int v48 = 0;
                uint64_t v49 = *(void *)v87;
                do
                {
                  uint64_t v50 = 0;
                  uint64_t v51 = v48;
                  do
                  {
                    if (*(void *)v87 != v49) {
                      objc_enumerationMutation(v74);
                    }
                    uint64_t v52 = *(void **)(*((void *)&v86 + 1) + 8 * v50);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v53 = [v46 objectAtIndexedSubscript:v51 + v50];
                      uint64_t v54 = (void *)[v53 mutableCopy];

                      long long v55 = [v52 objectAtIndexedSubscript:0];
                      [v54 setObject:v55 forKeyedSubscript:@"uuid"];

                      uint64_t v56 = [v52 objectAtIndexedSubscript:1];
                      [v54 setObject:v56 forKeyedSubscript:@"base"];

                      uint64_t v57 = [v52 objectAtIndexedSubscript:2];
                      [v54 setObject:v57 forKeyedSubscript:@"source"];

                      [v85 addObject:v54];
                    }
                    ++v50;
                  }
                  while (v47 != v50);
                  uint64_t v47 = [v74 countByEnumeratingWithState:&v86 objects:v120 count:16];
                  int v48 = v51 + v50;
                }
                while (v47);
              }

              [v65 setObject:v85 forKeyedSubscript:v72];
            }
            else
            {
              id v74 = [&unk_1EFE25D88 objectForKeyedSubscript:v72];
              if (v74) {
                objc_msgSend(v65, "setObject:forKeyedSubscript:", v71);
              }
              else {
                [v65 setObject:v71 forKeyedSubscript:v72];
              }
            }
            goto LABEL_23;
          }
          id v74 = (id)objc_opt_new();
          id v20 = v71;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v61 = v20;
          uint64_t v64 = [v20 countByEnumeratingWithState:&v102 objects:v130 count:16];
          if (!v64) {
            goto LABEL_74;
          }
          uint64_t v63 = *(void *)v103;
LABEL_29:
          uint64_t v67 = 0;
          while (1)
          {
            if (*(void *)v103 != v63) {
              objc_enumerationMutation(v61);
            }
            id v79 = *(void **)(*((void *)&v102 + 1) + 8 * v67);
            long long v82 = (void *)[v79 mutableCopy];
            long long v84 = objc_opt_new();
            id v81 = [v79 objectForKeyedSubscript:@"frames"];
            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            uint64_t v21 = [v81 countByEnumeratingWithState:&v98 objects:v129 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v99;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v99 != v22) {
                    objc_enumerationMutation(v81);
                  }
                  uint64_t v24 = *(void **)(*((void *)&v98 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v25 = v24;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v127[0] = @"imageIndex";
                      uint64_t v26 = [v24 objectAtIndexedSubscript:0];
                      v128[0] = v26;
                      v127[1] = @"imageOffset";
                      uint64_t v27 = [v24 objectAtIndexedSubscript:1];
                      v128[1] = v27;
                      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
                      id v25 = (id)[v28 mutableCopy];

                      if ((unint64_t)[v24 count] >= 3)
                      {
                        uint64_t v29 = [v24 objectAtIndexedSubscript:2];
                        [v25 addEntriesFromDictionary:v29];
                      }
                    }
                    else
                    {
                      id v25 = 0;
                    }
                  }
                  [v84 addObject:v25];
                  [v82 setObject:v84 forKeyedSubscript:@"frames"];
                }
                uint64_t v21 = [v81 countByEnumeratingWithState:&v98 objects:v129 count:16];
              }
              while (v21);
            }
            uint64_t v30 = [v79 objectForKeyedSubscript:@"triggered"];
            int v31 = [v30 BOOLValue];

            if (v31)
            {
              uint64_t v32 = [obj objectForKeyedSubscript:@"threadState"];
              if (v32) {
                break;
              }
              uint64_t v32 = [v79 objectForKeyedSubscript:@"threadState"];
              if (v32) {
                break;
              }
            }
LABEL_72:
            [v74 addObject:v82];

            if (++v67 == v64)
            {
              uint64_t v64 = [v61 countByEnumeratingWithState:&v102 objects:v130 count:16];
              if (!v64)
              {
LABEL_74:
                [v65 setObject:v74 forKeyedSubscript:v72];

                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
          long long v75 = (void *)[v32 mutableCopy];
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v78 = v32;
          uint64_t v77 = [v78 countByEnumeratingWithState:&v94 objects:v126 count:16];
          if (!v77) {
            goto LABEL_71;
          }
          uint64_t v76 = *(void *)v95;
          while (2)
          {
            uint64_t v33 = 0;
LABEL_51:
            if (*(void *)v95 != v76) {
              objc_enumerationMutation(v78);
            }
            uint64_t v80 = *(void *)(*((void *)&v94 + 1) + 8 * v33);
            int v34 = objc_msgSend(v78, "objectForKeyedSubscript:");
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v124 = @"value";
              v125 = v34;
              id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
              goto LABEL_55;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = objc_opt_new();
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v36 = v34;
              uint64_t v37 = [v36 countByEnumeratingWithState:&v90 objects:v123 count:16];
              if (v37)
              {
                uint64_t v38 = *(void *)v91;
                do
                {
                  for (uint64_t j = 0; j != v37; ++j)
                  {
                    if (*(void *)v91 != v38) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v40 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                    v121 = @"value";
                    uint64_t v122 = v40;
                    uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
                    [v35 addObject:v41];
                  }
                  uint64_t v37 = [v36 countByEnumeratingWithState:&v90 objects:v123 count:16];
                }
                while (v37);
              }

              int v42 = [v35 count];
              if (v42 <= 28)
              {
                int v43 = v42 - 29;
                do
                  [v35 addObject:&unk_1EFE25D60];
                while (!__CFADD__(v43++, 1));
              }
LABEL_55:
              [v75 setObject:v35 forKeyedSubscript:v80];
            }
            if (++v33 == v77)
            {
              uint64_t v77 = [v78 countByEnumeratingWithState:&v94 objects:v126 count:16];
              if (!v77)
              {
LABEL_71:

                [v82 setObject:v75 forKeyedSubscript:@"threadState"];
                goto LABEL_72;
              }
              continue;
            }
            goto LABEL_51;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v131 = @"unknown";
          v132 = v71;
          id v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
          [v65 setObject:v73 forKeyedSubscript:v72];
        }
LABEL_24:

        ++v70;
      }
      while (v70 != v68);
      uint64_t v58 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
      uint64_t v68 = v58;
    }
    while (v58);
  }

  return v65;
}

uint64_t __36__OSALegacyXform_rollSchemaForward___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 rangeAtIndex:3];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", result, v4);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)transformURL:(id)a3 options:(id)a4
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [OSALog alloc];
  uint64_t v9 = [v5 path];
  id v113 = 0;
  uint64_t v10 = [(OSALog *)v8 initWithPath:v9 forRouting:&stru_1EFE17BD0 options:&unk_1EFE25DB0 error:&v113];
  id v11 = v113;

  if (!v10)
  {
    id v12 = [NSString stringWithFormat:@"Unable to load log '%@'", v5];
    uint64_t v24 = [v11 augmentWithPrefix:v12];
    goto LABEL_89;
  }
  long long v105 = v6;
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28CB0]), "initWithFileDescriptor:", fileno(-[OSALog stream](v10, "stream")));
  uint64_t v13 = MEMORY[0x1AD0D7D80]([(OSALog *)v10 stream]);
  uint64_t v14 = [(OSALog *)v10 metaData];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ips metadata not detected (%ld bytes before newline), attempting to read entire file as payload", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }
  [v12 seekToFileOffset:v13];
  uint64_t v16 = [v12 availableData];
  id v112 = v11;
  uint64_t v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v112];
  id v18 = v112;

  if (v17)
  {
    uint64_t v102 = v16;
    long long v103 = v18;
    uint64_t v19 = [(OSALog *)v10 bugType];
    id v20 = [(OSALog *)v10 metaData];
    uint64_t v21 = [(OSALog *)v10 metaData];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      id v23 = v20;
    }
    else
    {
      id v25 = objc_opt_new();
      uint64_t v26 = [v17 objectForKeyedSubscript:@"bug_type"];

      [v25 setObject:v26 forKeyedSubscript:@"bug_type"];
      uint64_t v27 = [v17 objectForKeyedSubscript:@"isSimulated"];
      [v25 setObject:v27 forKeyedSubscript:@"isSimulated"];

      uint64_t v28 = [v17 objectForKeyedSubscript:@"isCorpse"];
      [v25 setObject:v28 forKeyedSubscript:@"isCorpse"];

      uint64_t v29 = [v17 objectForKeyedSubscript:@"incident_id"];
      [v25 setObject:v29 forKeyedSubscript:@"incident_id"];

      uint64_t v30 = [v17 objectForKeyedSubscript:@"os_version"];
      [v25 setObject:v30 forKeyedSubscript:@"os_version"];

      int v31 = [v17 objectForKeyedSubscript:@"platform"];
      [v25 setObject:v31 forKeyedSubscript:@"platform"];

      id v23 = v25;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = [v23 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v32;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "synthesizing %d items from payload as metadata", buf, 8u);
      }
      uint64_t v33 = [v17 objectForKeyedSubscript:@"parsedData"];
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "this log appears to be from the DA grid, using parsedData section", buf, 2u);
        }
        id v34 = v33;

        uint64_t v17 = v34;
      }

      uint64_t v19 = (void *)v26;
    }
    if ([&unk_1EFE25EC8 containsObject:v19])
    {
      long long v99 = v7;
      id v35 = [v17 objectForKeyedSubscript:@"version"];
      id v100 = v23;
      if ((int)[v35 intValue] >= 2)
      {

        goto LABEL_28;
      }
      id v36 = [v17 objectForKeyedSubscript:@"variantVersion"];
      int v37 = [v36 intValue];

      if (v37 > 1)
      {
        id v23 = v100;
        goto LABEL_28;
      }
      uint64_t v41 = +[OSALegacyXform rollSchemaForward:v17];

      uint64_t v17 = (void *)v41;
      id v23 = v100;
      if (v41)
      {
LABEL_28:
        long long v98 = objc_alloc_init(OSALegacyXform);
        int v42 = [v23 objectForKeyedSubscript:@"os_version"];
        if ([v42 hasPrefix:@"macOS"])
        {
          int v43 = [v23 objectForKeyedSubscript:@"platform"];
          if (v43)
          {
            uint64_t v44 = [v23 objectForKeyedSubscript:@"platform"];
            if ([v44 intValue] == 1)
            {
              BOOL v45 = 1;
            }
            else
            {
              long long v96 = [v23 objectForKeyedSubscript:@"platform"];
              if ([v96 intValue] == 6)
              {
                BOOL v45 = 1;
              }
              else
              {
                uint64_t v47 = [v23 objectForKeyedSubscript:@"platform"];
                BOOL v45 = [v47 intValue] == 10;

                id v23 = v100;
              }
            }
          }
          else
          {
            BOOL v45 = 1;
          }
        }
        else
        {
          BOOL v45 = 0;
        }

        int v48 = [v105 objectForKeyedSubscript:OSATransformOptionMetadata];

        unint64_t v49 = 0x1E4F29000;
        if (!v48)
        {
          if (v45)
          {
LABEL_55:
            uint64_t v54 = &legacyTemplate_9;
LABEL_56:
            uint64_t v16 = v102;
            uint64_t v40 = v98;
            uint64_t v57 = [*(id *)(v49 + 24) stringWithUTF8String:*v54];
            uint64_t v7 = v99;
            long long v97 = (void *)v57;
            if (!v57)
            {
              uint64_t v71 = [v103 augmentWithPrefix:@"Unable to locate template"];
              long long v72 = v103;
              uint64_t v24 = (void *)v71;
LABEL_86:

              goto LABEL_87;
            }
            id v111 = v103;
            long long v95 = v19;
            [(OSALegacyXform *)v98 prepareTemplate:v57 forLogType:v19 error:&v111];
            id v58 = v111;

            id v59 = objc_opt_new();
            id v110 = v58;
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __39__OSALegacyXform_transformURL_options___block_invoke;
            v108[3] = &unk_1E5D20478;
            id v60 = v59;
            id v109 = v60;
            BOOL v61 = [(OSALegacyXform *)v98 transformJSON:v17 header:v23 error:&v110 streamingBlock:v108];
            id v62 = v110;

            id v104 = v60;
            if (!v61)
            {
              uint64_t v24 = [v62 augmentWithPrefix:@"Unable to transform log"];
              goto LABEL_84;
            }
            id v94 = v5;
            id v63 = v60;
            uint64_t v64 = [v105 objectForKeyedSubscript:OSATransformOptionSymbolicate];
            int v65 = [v64 BOOLValue];

            if (!v65)
            {
              uint64_t v24 = v62;
              id v23 = v100;
LABEL_70:
              id v74 = [v105 objectForKeyedSubscript:OSATransformOptionFullReport];
              int v75 = [v74 BOOLValue];

              if (v75)
              {
                id v107 = 0;
                uint64_t v76 = [NSString stringWithContentsOfURL:v94 encoding:4 error:&v107];
                id v77 = v107;
                if (!v76)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                    +[OSALegacyXform transformURL:options:](v77);
                  }
                  uint64_t v76 = @"Unable to load full report.";
                }
                long long v101 = [NSString stringWithFormat:@"%@%@%@\n%@\n", @"-------------------------------------\nTranslated Report (Full Report Below)\n-------------------------------------\n", v63, @"-----------\nFull Report\n-----------\n", v76];
              }
              else
              {
                long long v101 = v63;
              }
              id v78 = [v105 objectForKeyedSubscript:OSATransformOptionPersist];
              id v5 = v94;
              if ([v78 BOOLValue])
              {
                uint64_t v79 = [v101 length];

                if (v79)
                {
                  memcpy(buf, "/tmp/temp.XXXXXX", 0x400uLL);
                  uint64_t v80 = mkstemp((char *)buf);
                  if (v80 == -1)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      +[OSALegacyXform transformURL:options:]();
                    }
                    long long v88 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v118 = *MEMORY[0x1E4F28568];
                    long long v119 = @"Error creating temporary file for symbolicated log";
                    id v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
                    uint64_t v84 = [v88 errorWithDomain:@"OSALegacyXform" code:8 userInfo:v81];
                  }
                  else
                  {
                    id v81 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v80 closeOnDealloc:1];
                    long long v82 = [v101 dataUsingEncoding:4];
                    id v106 = 0;
                    [v81 writeData:v82 error:&v106];
                    id v83 = v106;

                    if (v83)
                    {
                      uint64_t v84 = [v83 augmentWithPrefix:@"failed to persist symbolicated log"];
                      uint64_t v24 = v83;
                    }
                    else
                    {
                      long long v89 = (void *)MEMORY[0x1E4F1CB10];
                      uint64_t v24 = [NSString stringWithUTF8String:buf];
                      long long v90 = [v89 fileURLWithPath:v24];
                      [v7 setObject:v90 forKeyedSubscript:OSATransformResultFileURL];

                      uint64_t v84 = 0;
                    }
                  }
                  uint64_t v40 = v98;

                  uint64_t v24 = (void *)v84;
                  id v62 = v101;
                  goto LABEL_85;
                }
              }
              else
              {
              }
              id v62 = v101;
              [v7 setObject:v101 forKeyedSubscript:OSATransformResultReport];
LABEL_84:
              uint64_t v40 = v98;
LABEL_85:

              uint64_t v16 = v102;
              long long v72 = v104;
              uint64_t v19 = v95;
              goto LABEL_86;
            }
            id v93 = v63;
            long long v92 = [v63 dataUsingEncoding:4];
            uint64_t v66 = symbolicateSpeedTracer(v92, v105);
            objc_opt_class();
            long long v91 = v66;
            if (objc_opt_isKindOfClass())
            {
              uint64_t v67 = [v66 objectForKeyedSubscript:OSATransformResultRadars];
              [v99 setObject:v67 forKeyedSubscript:OSATransformResultRadars];

              uint64_t v68 = [v66 objectForKeyedSubscript:OSATransformResultTracerURL];
              uint64_t v7 = v99;
              [v99 setObject:v68 forKeyedSubscript:OSATransformResultTracerURL];

              uint64_t v24 = [v66 objectForKeyedSubscript:OSATransformResultError];

              uint64_t v69 = [v66 objectForKeyedSubscript:OSATransformResultReport];
              id v70 = v69;
              id v23 = v100;
              if (!v69)
              {
LABEL_69:
                id v63 = v93;

                goto LABEL_70;
              }
              id v70 = v69;
              id v62 = v93;
              id v93 = v70;
            }
            else
            {
              id v73 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v121 = *MEMORY[0x1E4F28568];
              v122[0] = @"No speedtracer results";
              id v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:&v121 count:1];
              uint64_t v24 = [v73 errorWithDomain:@"OSALegacyTransform" code:1 userInfo:v70];
              uint64_t v7 = v99;
              id v23 = v100;
            }

            goto LABEL_69;
          }
LABEL_47:
          uint64_t v54 = &legacyTemplate_109;
          goto LABEL_56;
        }
        uint64_t v50 = (void *)[v23 mutableCopy];
        uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"308", @"309", @"409", @"509", 0);
        int v52 = [v51 containsObject:v19];

        if (v52)
        {
          if (v45) {
            uint64_t v53 = @"9";
          }
          else {
            uint64_t v53 = @"109";
          }
        }
        else
        {
          if (([v19 isEqualToString:@"385"] & 1) == 0)
          {
            id v23 = v100;
            if (![v19 isEqualToString:@"327"])
            {
LABEL_52:
              long long v55 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v50 options:0 error:0];
              if (v55)
              {
                uint64_t v56 = (void *)[[NSString alloc] initWithData:v55 encoding:4];
                [v99 setObject:v56 forKeyedSubscript:OSATransformResultMetadata];

                id v23 = v100;
              }

              unint64_t v49 = 0x1E4F29000uLL;
              if (v45) {
                goto LABEL_55;
              }
              goto LABEL_47;
            }
            uint64_t v53 = @"227";
LABEL_51:
            [v50 setObject:v53 forKeyedSubscript:@"bug_type"];
            goto LABEL_52;
          }
          uint64_t v53 = @"185";
        }
        id v23 = v100;
        goto LABEL_51;
      }
      BOOL v46 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      long long v117 = @"unsupported JSON schema version";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      uint64_t v24 = [v46 errorWithDomain:@"OSALegacyXform" code:4 userInfo:v17];
      uint64_t v40 = v103;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [(OSALog *)v10 bugType];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unsupported log type '%@' effective (%@)", buf, 0x16u);
      }
      uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v114 = *MEMORY[0x1E4F28568];
      id v115 = @"legacy conversion not supported for log type";
      uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      uint64_t v24 = [v39 errorWithDomain:@"OSALegacyXform" code:6 userInfo:v40];
    }
    uint64_t v16 = v102;
LABEL_87:

    goto LABEL_88;
  }
  uint64_t v24 = [v18 augmentWithPrefix:@"Unable to read JSON"];
  uint64_t v19 = v18;
LABEL_88:

  id v11 = (id)v16;
  id v6 = v105;
LABEL_89:

  if (v24)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v85 = [v24 localizedDescription];
      uint64_t v86 = [v85 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v86;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    [v7 setObject:v24 forKeyedSubscript:OSATransformResultError];
  }

  return v7;
}

uint64_t __39__OSALegacyXform_transformURL_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (void).cxx_destruct
{
}

+ (void)transformURL:options:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error creating temporary file for symbolicated log", v0, 2u);
}

+ (void)transformURL:(void *)a1 options:.cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 localizedDescription];
  int v2 = 138543362;
  id v3 = v1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error loading full report: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end