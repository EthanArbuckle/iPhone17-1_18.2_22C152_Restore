@interface PLPhotoDCIMDirectory
- (BOOL)hasChangedExternally;
- (PLPhotoDCIMDirectory)initWithDCIMPath:(id)a3;
- (id)_userInfoPath;
- (id)dcfDirectories;
- (id)dcimPath;
- (id)miscPath;
- (id)nextAvailableDirectory;
- (id)posterImagePath;
- (id)userInfo;
- (id)userInfoObjectForKey:(id)a3;
- (void)clearDCFDirectories;
- (void)dealloc;
- (void)lockDirectory;
- (void)recreateInfoPlist;
- (void)reloadUserInfo;
- (void)saveUserInfo;
- (void)setHasChangedExternally:(BOOL)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)unlockDirectory;
@end

@implementation PLPhotoDCIMDirectory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_topLevelDirectories, 0);
  objc_storeStrong((id *)&self->_posterImagePath, 0);
  objc_storeStrong((id *)&self->_miscPath, 0);
  objc_storeStrong((id *)&self->_dcimPath, 0);
}

- (void)setHasChangedExternally:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(PLPhotoDCIMDirectory *)self setUserInfoObject:v4 forKey:@"DCIMChangedExternally"];
}

- (BOOL)hasChangedExternally
{
  v2 = [(PLPhotoDCIMDirectory *)self userInfoObjectForKey:@"DCIMChangedExternally"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)unlockDirectory
{
  dcimDirectoryLock = self->_dcimDirectoryLock;
  if (dcimDirectoryLock)
  {
    dcimDirectoryLock->l_type = 0;
    fcntl(self->_dcimDirectoryLockDescriptor, 8, &self->_dcimDirectoryLock);
    close(self->_dcimDirectoryLockDescriptor);
    free(self->_dcimDirectoryLock);
    self->_dcimDirectoryLock = 0;
    self->_dcimDirectoryLockDescriptor = -1;
  }
}

- (void)lockDirectory
{
  p_dcimDirectoryLock = &self->_dcimDirectoryLock;
  if (!self->_dcimDirectoryLock)
  {
    self->_dcimDirectoryLock = (flock *)malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
    int v4 = open([(NSString *)self->_dcimPath UTF8String], 2);
    self->_dcimDirectoryLockDescriptor = v4;
    dcimDirectoryLock = self->_dcimDirectoryLock;
    if (!dcimDirectoryLock || v4 < 0)
    {
      free(dcimDirectoryLock);
      self->_dcimDirectoryLock = 0;
      self->_dcimDirectoryLockDescriptor = -1;
    }
    else
    {
      *(_DWORD *)&dcimDirectoryLock->l_type = 3;
      dcimDirectoryLock->l_start = 0;
      dcimDirectoryLock->l_len = 0;
      self->_dcimDirectoryLock->l_pid = getpid();
      fcntl(self->_dcimDirectoryLockDescriptor, 9, p_dcimDirectoryLock);
    }
  }
}

- (id)nextAvailableDirectory
{
  v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [(PLPhotoDCIMDirectory *)self dcfDirectories];
  int lastUsedDirectoryNumber = self->_lastUsedDirectoryNumber;
  if (lastUsedDirectoryNumber >= 1000) {
    uint64_t v5 = 100;
  }
  else {
    uint64_t v5 = lastUsedDirectoryNumber;
  }
  do
  {
    CFDictionaryGetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)v5);
    v6 = (PLPhotoDCFDirectory *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      if ([(PLPhotoDCFDirectory *)v6 canAddImage]
        && [(PLPhotoDCFDirectory *)v7 canAddVideo])
      {
        goto LABEL_17;
      }

      v7 = 0;
      if ((int)v5 <= 998) {
        uint64_t v5 = (v5 + 1);
      }
      else {
        uint64_t v5 = 100;
      }
    }
    else
    {
      v8 = [PLPhotoDCFDirectory alloc];
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%03dAPPLE", v5);
      v7 = [(PLPhotoDCFDirectory *)v8 initWithName:v9 number:v5 dcimDirectory:self];

      CFDictionarySetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)v5, v7);
      [(NSMutableArray *)self->_topLevelDirectories addObject:v7];
    }
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v5 == lastUsedDirectoryNumber;
    }
  }
  while (!v10);
  if (v7)
  {
LABEL_17:
    self->_int lastUsedDirectoryNumber = v5;
    v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
    v12 = v14;
    [v14 setObject:v11 forKey:@"DCFLastDirectoryNumber"];

    goto LABEL_19;
  }
  v12 = v14;
LABEL_19:

  return v7;
}

- (void)clearDCFDirectories
{
  topLevelDirectories = self->_topLevelDirectories;
  self->_topLevelDirectories = 0;

  topLevelDirectoriesByNumber = self->_topLevelDirectoriesByNumber;
  if (topLevelDirectoriesByNumber)
  {
    CFRelease(topLevelDirectoriesByNumber);
    self->_topLevelDirectoriesByNumber = 0;
  }
  unusableTopLevelDirectoryNumbers = self->_unusableTopLevelDirectoryNumbers;
  if (unusableTopLevelDirectoryNumbers)
  {
    CFRelease(unusableTopLevelDirectoryNumbers);
    self->_unusableTopLevelDirectoryNumbers = 0;
  }
  [(PLPhotoDCIMDirectory *)self saveUserInfo];
}

- (id)dcfDirectories
{
  topLevelDirectories = self->_topLevelDirectories;
  if (!topLevelDirectories)
  {
    v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v4 = [v24 contentsOfDirectoryAtPath:self->_dcimPath error:0];
    uint64_t v5 = [v4 count];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
    self->_topLevelDirectoriesByNumber = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    self->_unusableTopLevelDirectoryNumbers = CFSetCreateMutable(0, 0, 0);
    if (v5 >= 1)
    {
      uint64_t v7 = 0;
      while (1)
      {
        v8 = (void *)MEMORY[0x19F38F510]();
        LODWORD(key) = 0;
        v9 = [v4 objectAtIndex:v7];
        BOOL v10 = +[PLPhotoDCFObject validDCFNameForName:v9, 8, 8, &key, 0, 3, @"APPLE" requiredLength nameLength number numberRange suffix];
        if (v10) {
          break;
        }
LABEL_10:

        if (v5 == ++v7) {
          goto LABEL_13;
        }
      }
      uint64_t v11 = CFDictionaryGetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key);
      uint64_t v12 = [v6 valueForKey:v10];
      if (v12 | v11)
      {
      }
      else if (!CFSetGetValue(self->_unusableTopLevelDirectoryNumbers, (const void *)(int)key))
      {
        v13 = [PLPhotoDCFDirectory alloc];
        uint64_t v11 = [(PLPhotoDCFDirectory *)v13 initWithName:v10 number:key dcimDirectory:self];
        CFDictionarySetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key, (const void *)v11);
        [v6 setObject:v11 forKey:v10];
        goto LABEL_9;
      }
      [v6 removeObjectForKey:v10];
      CFDictionaryRemoveValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key);
      CFSetAddValue(self->_unusableTopLevelDirectoryNumbers, (const void *)(int)key);
LABEL_9:

      goto LABEL_10;
    }
LABEL_13:
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v15 = [v6 allValues];
    v16 = (NSMutableArray *)[v14 initWithArray:v15];
    v17 = self->_topLevelDirectories;
    self->_topLevelDirectories = v16;

    id v18 = (id)[(NSMutableArray *)self->_topLevelDirectories sortedArrayUsingSelector:sel_compare_];
    v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v20 = [v19 objectForKey:@"DCFLastDirectoryNumber"];
    int v21 = [v20 intValue];
    if (v21 <= 100) {
      int v22 = 100;
    }
    else {
      int v22 = v21;
    }
    self->_int lastUsedDirectoryNumber = v22;

    topLevelDirectories = self->_topLevelDirectories;
  }
  return topLevelDirectories;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoDCIMDirectory *)self userInfo];
  [v8 setObject:v7 forKey:v6];

  self->_userInfoDidChange = 1;
}

- (id)userInfoObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPhotoDCIMDirectory *)self userInfo];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)reloadUserInfo
{
  userInfo = self->_userInfo;
  self->_userInfo = 0;

  id v4 = [(PLPhotoDCIMDirectory *)self userInfo];
}

- (void)recreateInfoPlist
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28CB8] defaultManager];
  v31 = v30 = self;
  id v3 = [v31 contentsOfDirectoryAtPath:self->_dcimPath error:0];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3 && [v3 count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v4 = v3;
    uint64_t v34 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (!v34)
    {
LABEL_28:

      goto LABEL_29;
    }
    v28 = v3;
    obuint64_t j = v4;
    char v5 = 0;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x19F38F510]();
        unsigned int v42 = 0;
        v9 = +[PLPhotoDCFObject validDCFNameForName:v7, 8, 8, &v42, 0, 3, @"APPLE" requiredLength nameLength number numberRange suffix];
        if (v9)
        {
          id v35 = v9;
          BOOL v10 = [(NSString *)v30->_dcimPath stringByAppendingPathComponent:v7];
          uint64_t v11 = [v31 contentsOfDirectoryAtPath:v10 error:0];

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
          v36 = v8;
          uint64_t v37 = i;
          if (v13)
          {
            uint64_t v14 = v13;
            int v15 = 0;
            LODWORD(v16) = 0;
            uint64_t v17 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v12);
                }
                v19 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                v20 = (void *)MEMORY[0x19F38F510]();
                int v21 = [v19 stringByDeletingPathExtension];
                int v22 = [v21 componentsSeparatedByString:@"_"];

                if ((unint64_t)[v22 count] >= 2)
                {
                  v23 = [v22 objectAtIndex:1];
                  int v24 = [v23 intValue];

                  int v15 = v24 + 100000 - 1000 * v42 + 10000 * ((int)(1000 * v42 - 100000) / 10000);
                }
                if ((int)v16 <= v15) {
                  uint64_t v16 = v15;
                }
                else {
                  uint64_t v16 = v16;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v14);
          }
          else
          {
            uint64_t v16 = 0;
          }

          v25 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
          v26 = objc_msgSend(NSString, "stringWithFormat:", @"LastFileGroupNumber-%d", v42);
          [v32 setObject:v25 forKey:v26];

          char v5 = 1;
          v27 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
          [v32 setObject:v27 forKey:@"DCIMChangedExternally"];

          id v8 = v36;
          uint64_t i = v37;
          v9 = v35;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v34);

    id v3 = v28;
    if (v5)
    {
      id v4 = [(PLPhotoDCIMDirectory *)v30 _userInfoPath];
      [v32 writeToFile:v4 atomically:0];
      goto LABEL_28;
    }
  }
LABEL_29:
}

- (id)userInfo
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [(PLPhotoDCIMDirectory *)self _userInfoPath];
    v31 = v4;
    char v6 = [v4 fileExistsAtPath:v5];
    uint64_t v7 = self;
    if ((v6 & 1) == 0) {
      [(PLPhotoDCIMDirectory *)self recreateInfoPlist];
    }
    v30 = (void *)v5;
    id v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v5];
    v9 = self->_userInfo;
    self->_userInfo = v8;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_userInfo allKeys];
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v36;
      do
      {
        uint64_t v14 = 0;
        uint64_t v32 = v11;
        do
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
          uint64_t v16 = (void *)MEMORY[0x19F38F510]();
          if ([v15 hasPrefix:@"LastFileGroupNumber"])
          {
            uint64_t v17 = v13;
            uint64_t v18 = v12;
            v19 = objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 3);
            uint64_t v20 = [v19 intValue];
            int v21 = objc_msgSend(NSString, "stringWithFormat:", @"%03dAPPLE", v20);
            [(PLPhotoDCIMDirectory *)v7 dcimPath];
            v23 = int v22 = v7;
            int v24 = [v23 stringByAppendingPathComponent:v21];

            uint64_t v7 = v22;
            char v34 = 0;
            if (![v31 fileExistsAtPath:v24 isDirectory:&v34] || !v34)
            {
              [(NSMutableDictionary *)v22->_userInfo removeObjectForKey:v15];
              v22->_userInfoDidChange = 1;
            }

            uint64_t v12 = v18;
            uint64_t v13 = v17;
            uint64_t v11 = v32;
          }
          else
          {
            uint64_t v12 = [v15 isEqualToString:@"DCIMChangedExternally"] | v12;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }

    v25 = v7;
    userInfo = v7->_userInfo;
    if (userInfo)
    {
      if (v12) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v29 = v25->_userInfo;
    v25->_userInfo = v28;

    userInfo = v25->_userInfo;
    if ((v12 & 1) == 0)
    {
LABEL_21:
      v26 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      [(NSMutableDictionary *)userInfo setObject:v26 forKey:@"DCIMChangedExternally"];

      userInfo = v25->_userInfo;
    }
  }
LABEL_22:
  return userInfo;
}

- (void)saveUserInfo
{
  if (self->_userInfoDidChange)
  {
    userInfo = self->_userInfo;
    id v4 = [(PLPhotoDCIMDirectory *)self _userInfoPath];
    [(NSMutableDictionary *)userInfo writeToFile:v4 atomically:0];

    self->_userInfoDidChange = 0;
  }
}

- (id)posterImagePath
{
  posterImagePath = self->_posterImagePath;
  if (!posterImagePath)
  {
    id v4 = [(PLPhotoDCIMDirectory *)self miscPath];
    uint64_t v5 = [v4 stringByAppendingPathComponent:@"PosterImage.jpg"];
    char v6 = self->_posterImagePath;
    self->_posterImagePath = v5;

    posterImagePath = self->_posterImagePath;
  }
  return posterImagePath;
}

- (id)miscPath
{
  v10[1] = *MEMORY[0x1E4F143B8];
  miscPath = self->_miscPath;
  if (!miscPath)
  {
    id v4 = [(NSString *)self->_dcimPath stringByAppendingPathComponent:@".MISC"];
    uint64_t v5 = self->_miscPath;
    self->_miscPath = v4;

    uint64_t v9 = *MEMORY[0x1E4F28330];
    v10[0] = &unk_1EEC14680;
    char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 createDirectoryAtPath:self->_miscPath withIntermediateDirectories:1 attributes:v6 error:0];

    miscPath = self->_miscPath;
  }
  return miscPath;
}

- (id)dcimPath
{
  return self->_dcimPath;
}

- (void)dealloc
{
  [(PLPhotoDCIMDirectory *)self saveUserInfo];
  topLevelDirectoriesByNumber = self->_topLevelDirectoriesByNumber;
  if (topLevelDirectoriesByNumber) {
    CFRelease(topLevelDirectoriesByNumber);
  }
  unusableTopLevelDirectoryNumbers = self->_unusableTopLevelDirectoryNumbers;
  if (unusableTopLevelDirectoryNumbers) {
    CFRelease(unusableTopLevelDirectoryNumbers);
  }
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoDCIMDirectory;
  [(PLPhotoDCIMDirectory *)&v5 dealloc];
}

- (PLPhotoDCIMDirectory)initWithDCIMPath:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoDCIMDirectory;
  objc_super v5 = [(PLPhotoDCIMDirectory *)&v12 init];
  char v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      dcimPath = v6->_dcimPath;
      v6->_dcimPath = (NSString *)v7;

      uint64_t v13 = *MEMORY[0x1E4F28330];
      v14[0] = &unk_1EEC14680;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v10 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v9 error:0];

      v6->_int lastUsedDirectoryNumber = 100;
      v6->_dcimDirectoryLockDescriptor = -1;
    }
    else
    {
      uint64_t v9 = v5;
      char v6 = 0;
    }
  }
  return v6;
}

- (id)_userInfoPath
{
  v2 = [(PLPhotoDCIMDirectory *)self miscPath];
  id v3 = [v2 stringByAppendingPathComponent:@"Info.plist"];

  return v3;
}

@end