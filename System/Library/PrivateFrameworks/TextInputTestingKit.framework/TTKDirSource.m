@interface TTKDirSource
- (NSDictionary)layouts;
- (NSString)inputMode;
- (float)fileVersion;
- (id)getNextTestCase;
- (id)init:(id)a3;
- (id)onNewLayoutsFound;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)loadLayouts:(id)a3;
- (void)loadRootDir;
- (void)reset;
- (void)setOnNewLayoutsFound:(id)a3;
@end

@implementation TTKDirSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_currTestCaseSource, 0);
  objc_storeStrong((id *)&self->_testCaseFiles, 0);
  objc_storeStrong((id *)&self->_testCaseDirs, 0);
  objc_storeStrong((id *)&self->_currDir, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setOnNewLayoutsFound:(id)a3
{
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSDictionary)layouts
{
  return &self->_layouts->super;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  a3->var0 = 0;
  if (a5)
  {
    do
    {
      id v9 = [(TTKDirSource *)self getNextTestCase];
      unint64_t result = a3->var0;
      if (!v9) {
        break;
      }
      a3->var0 = result + 1;
      a4[result] = v9;
      unint64_t result = a3->var0;
    }
    while (a3->var0 < a5);
  }
  else
  {
    unint64_t result = 0;
  }
  a3->var1 = a4;
  return result;
}

- (void)loadLayouts:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2455C2B00]();
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v65 = 0;
  v52 = v4;
  v7 = [v6 contentsOfDirectoryAtPath:v4 error:&v65];
  id v8 = v65;

  if (!v8)
  {
    v50 = v5;
    id v9 = [v7 sortedArrayUsingSelector:sel_compare_];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v70 count:16];
    v51 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v62;
      location = (id *)&self->_inputMode;
      p_layouts = &self->_layouts;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v62 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if (([v16 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v17 = NSString;
            v69[0] = v52;
            v69[1] = v16;
            v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
            v19 = [v17 pathWithComponents:v18];

            if ([v16 isEqualToString:@"layouts.json"])
            {
              v29 = +[TTKTestCaseReader loadFromFile:v19];
              v30 = [v29 inputMode];
              v31 = (void *)MEMORY[0x263EFF9A0];
              v32 = [v29 layouts];
              v33 = [v31 dictionaryWithDictionary:v32];

              int v34 = [v29 majorVersion];
              int v35 = [v29 minorVersion];
              [v29 fileVersion];
              if (*location)
              {
                v47 = v30;
                locationa = (id *)v29;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                v37 = [v33 allKeys];
                uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v68 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v58;
                  do
                  {
                    for (uint64_t j = 0; j != v39; ++j)
                    {
                      if (*(void *)v58 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      uint64_t v42 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                      v43 = [(NSMutableDictionary *)*p_layouts objectForKey:v42];

                      if (!v43)
                      {
                        v44 = *p_layouts;
                        v45 = [v33 objectForKeyedSubscript:v42];
                        [(NSMutableDictionary *)v44 setObject:v45 forKey:v42];
                      }
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v68 count:16];
                  }
                  while (v39);
                }

                v30 = v47;
                v29 = locationa;
              }
              else
              {
                float v46 = v36;
                objc_storeStrong(location, v30);
                objc_storeStrong((id *)&self->_layouts, v33);
                self->_majorVersion = v34;
                self->_minorVersion = v35;
                self->_fileVersion = v46;
              }

              goto LABEL_35;
            }

            id v10 = v51;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v54 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v53 + 1) + 8 * k);
          if (([v25 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v26 = NSString;
            v66[0] = v52;
            v66[1] = v25;
            v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:2];
            v28 = [v26 pathWithComponents:v27];
            [(TTKDirSource *)self loadLayouts:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v67 count:16];
      }
      while (v22);
    }
LABEL_35:
    v7 = v51;

    id v8 = 0;
    v5 = v50;
  }
}

- (void)reset
{
  currTestCaseSource = self->_currTestCaseSource;
  self->_currTestCaseSource = 0;

  currDir = self->_currDir;
  self->_currDir = (NSString *)&stru_26F2B7E50;

  v5 = [MEMORY[0x263EFF980] array];
  testCaseDirs = self->_testCaseDirs;
  self->_testCaseDirs = v5;

  v7 = [MEMORY[0x263EFF980] array];
  testCaseFiles = self->_testCaseFiles;
  self->_testCaseFiles = v7;

  [(TTKDirSource *)self loadRootDir];
}

- (id)init:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = TTKLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = [v5 cStringUsingEncoding:4];
    _os_log_debug_impl(&dword_23EFD2000, v6, OS_LOG_TYPE_DEBUG, "Loading test cases from directory %s", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)TTKDirSource;
  v7 = [(TTKDirSource *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rootDir, a3);
    [(TTKDirSource *)v8 reset];
  }

  return v8;
}

- (id)getNextTestCase
{
  v3 = (void *)MEMORY[0x2455C2B00](self, a2);
  currTestCaseSource = self->_currTestCaseSource;
  if (currTestCaseSource)
  {
    id v5 = [(TTKTestCaseSource *)currTestCaseSource getNextTestCase];
    if (v5) {
      goto LABEL_15;
    }
    v6 = self->_currTestCaseSource;
    self->_currTestCaseSource = 0;
  }
  if ([(NSMutableArray *)self->_testCaseFiles count])
  {
    v7 = (void *)MEMORY[0x263EFF8C0];
    rootDir = self->_rootDir;
    currDir = self->_currDir;
    objc_super v10 = [(NSMutableArray *)self->_testCaseFiles objectAtIndex:0];
    uint64_t v11 = objc_msgSend(v7, "arrayWithObjects:", rootDir, currDir, v10, 0);

    [(NSMutableArray *)self->_testCaseFiles removeObjectAtIndex:0];
    uint64_t v12 = [NSString pathWithComponents:v11];
    uint64_t v13 = +[TTKTestCaseReader loadFromFile:v12 inputMode:self->_inputMode layouts:self->_layouts];
    v14 = self->_currTestCaseSource;
    self->_currTestCaseSource = v13;

    v15 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];
    if (![v15 count])
    {
LABEL_8:

      goto LABEL_14;
    }
    v16 = [(TTKDirSource *)self onNewLayoutsFound];

    if (v16)
    {
      v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_layouts];
      v18 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];
      [(NSMutableDictionary *)v17 addEntriesFromDictionary:v18];

      layouts = self->_layouts;
      self->_layouts = v17;
      id v20 = v17;

      v15 = [(TTKDirSource *)self onNewLayoutsFound];
      uint64_t v21 = [(TTKTestCaseSource *)self->_currTestCaseSource layouts];

      ((void (**)(void, void *))v15)[2](v15, v21);
      goto LABEL_8;
    }
  }
  else
  {
    if (![(NSMutableArray *)self->_testCaseDirs count])
    {
      id v5 = 0;
      goto LABEL_15;
    }
    uint64_t v22 = [(NSMutableArray *)self->_testCaseDirs objectAtIndex:0];
    uint64_t v23 = self->_currDir;
    self->_currDir = v22;

    [(NSMutableArray *)self->_testCaseDirs removeObjectAtIndex:0];
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_rootDir, self->_currDir, 0);
    uint64_t v12 = [NSString pathWithComponents:v11];
    if (self->_is_multiDir)
    {
      v24 = [[TTKDirSource alloc] init:v12];
      v25 = self->_currTestCaseSource;
      self->_currTestCaseSource = v24;
    }
    else
    {
      v26 = (void *)MEMORY[0x263EFF980];
      v27 = [MEMORY[0x263F08850] defaultManager];
      v28 = [v27 contentsOfDirectoryAtPath:v12 error:0];
      v29 = [v26 arrayWithArray:v28];
      testCaseFiles = self->_testCaseFiles;
      self->_testCaseFiles = v29;

      [(NSMutableArray *)self->_testCaseFiles removeObject:@".DS_Store"];
    }
  }
LABEL_14:
  id v5 = [(TTKDirSource *)self getNextTestCase];

LABEL_15:
  return v5;
}

- (void)loadRootDir
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v3 contentsOfDirectoryAtPath:self->_rootDir error:0];

  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  [(TTKDirSource *)self loadLayouts:self->_rootDir];
  self->_is_multiDir = 1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v29 + 1) + 8 * i) isEqualToString:@"layouts.json"])self->_is_multiDir = 0; {
      }
        }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    p_testCaseFiles = &self->_testCaseFiles;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if ((objc_msgSend(v16, "isEqualToString:", @".DS_Store", p_testCaseFiles) & 1) == 0)
        {
          v17 = NSString;
          v33[0] = self->_rootDir;
          v33[1] = v16;
          v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
          v19 = [v17 pathWithComponents:v18];

          char v24 = 0;
          id v20 = [MEMORY[0x263F08850] defaultManager];
          [v20 fileExistsAtPath:v19 isDirectory:&v24];

          p_testCaseDirs = &self->_testCaseDirs;
          if (v24
            || (char v22 = [v16 isEqualToString:@"layouts.json"],
                p_testCaseDirs = p_testCaseFiles,
                (v22 & 1) == 0))
          {
            [(NSMutableArray *)*p_testCaseDirs addObject:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }
}

@end