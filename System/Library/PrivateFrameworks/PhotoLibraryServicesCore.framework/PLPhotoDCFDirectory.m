@interface PLPhotoDCFDirectory
+ (id)fileGroupRequiredEmptyExtensions;
+ (id)fileGroupRequiredEmptyPrefixes;
+ (void)initializeFileGroupPrefixAndExtensions;
- (BOOL)_canAddItemWithPrefix:(id)a3;
- (BOOL)_canAddItemWithPrefix:(id)a3 minimumFileGroupNumber:(int)a4;
- (BOOL)canAddFileGroupWithGroupNumber:(int)a3;
- (BOOL)canAddImage;
- (BOOL)canAddVideo;
- (BOOL)considerInvalidFileGroups;
- (BOOL)isEntensionValid:(id)a3;
- (PLPhotoDCFDirectory)initWithName:(id)a3 number:(int)a4 dcimDirectory:(id)a5;
- (id)_lastUsedFileGroupUserInfoKey;
- (id)_nextAvailableFileGroupWithPrefix:(id)a3 extension:(id)a4;
- (id)dcimDirectory;
- (id)fileGroups;
- (id)fullPath;
- (id)nextAvailableFileGroup;
- (id)nextAvailableVideoFileGroupWithExtension:(id)a3;
- (unsigned)_calculateBaseDirectoryValue;
- (void)ensureDirectoryExists;
- (void)removeFileGroup:(id)a3;
- (void)setConsiderInvalidFileGroups:(BOOL)a3;
@end

@implementation PLPhotoDCFDirectory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileGroupsByNumber, 0);
  objc_storeStrong((id *)&self->_dcimDirectory, 0);
}

- (void)setConsiderInvalidFileGroups:(BOOL)a3
{
  self->_considerInvalidFileGroups = a3;
}

- (BOOL)considerInvalidFileGroups
{
  return self->_considerInvalidFileGroups;
}

- (void)removeFileGroup:(id)a3
{
  id v6 = a3;
  [v6 deleteFiles];
  fileGroupsByNumber = self->_fileGroupsByNumber;
  if (fileGroupsByNumber)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "number"));
    [(NSMutableDictionary *)fileGroupsByNumber removeObjectForKey:v5];
  }
}

- (id)nextAvailableVideoFileGroupWithExtension:(id)a3
{
  return [(PLPhotoDCFDirectory *)self _nextAvailableFileGroupWithPrefix:@"MOV" extension:a3];
}

- (id)nextAvailableFileGroup
{
  return [(PLPhotoDCFDirectory *)self _nextAvailableFileGroupWithPrefix:@"IMG" extension:@"JPG"];
}

- (id)_nextAvailableFileGroupWithPrefix:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  [(PLPhotoDCIMDirectory *)self->_dcimDirectory lockDirectory];
  [(PLPhotoDCIMDirectory *)self->_dcimDirectory reloadUserInfo];
  dcimDirectory = self->_dcimDirectory;
  v8 = [(PLPhotoDCFDirectory *)self _lastUsedFileGroupUserInfoKey];
  v9 = [(PLPhotoDCIMDirectory *)dcimDirectory userInfoObjectForKey:v8];
  self->_int lastUsedFileGroupNumber = [v9 intValue];

  int lastUsedFileGroupNumber = self->_lastUsedFileGroupNumber;
  uint64_t v11 = (lastUsedFileGroupNumber + 1);
  unsigned int v12 = [(PLPhotoDCFDirectory *)self _calculateBaseDirectoryValue];
  unsigned int v13 = v12 + v11;
  if ([(PLPhotoDCFDirectory *)self canAddFileGroupWithGroupNumber:v11]) {
    goto LABEL_8;
  }
  if (!self->_fileGroupsByNumber) {
    id v14 = [(PLPhotoDCFDirectory *)self fileGroups];
  }
  if (lastUsedFileGroupNumber >= 998)
  {
LABEL_8:
    if (lastUsedFileGroupNumber > 998)
    {
      v22 = 0;
      v19 = v30;
      goto LABEL_14;
    }
    uint64_t v18 = v13 % 0x2710;
  }
  else
  {
    do
    {
      fileGroupsByNumber = self->_fileGroupsByNumber;
      v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v12 - 10000 * (v13 / 0x2710) + v11];
      v17 = [(NSMutableDictionary *)fileGroupsByNumber objectForKeyedSubscript:v16];

      if (!v17) {
        break;
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v11 != 999);
    uint64_t v18 = v12 - 10000 * (v13 / 0x2710) + v11;
  }
  v19 = v30;
  v20 = [PLPhotoDCFFileGroup alloc];
  v21 = [NSString stringWithFormat:@"%@_%04d", v6, v18];
  v22 = [(PLPhotoDCFFileGroup *)v20 initWithName:v21 number:v18 directory:self];

  [(PLPhotoDCFFileGroup *)v22 addExtension:v30];
  v23 = self->_fileGroupsByNumber;
  v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v18];
  [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

  int maxFileGroupNumber = self->_maxFileGroupNumber;
  if ((int)v18 > maxFileGroupNumber) {
    int maxFileGroupNumber = v18;
  }
  self->_int maxFileGroupNumber = maxFileGroupNumber;
LABEL_14:
  v26 = self->_dcimDirectory;
  v27 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  v28 = [(PLPhotoDCFDirectory *)self _lastUsedFileGroupUserInfoKey];
  [(PLPhotoDCIMDirectory *)v26 setUserInfoObject:v27 forKey:v28];

  self->_int lastUsedFileGroupNumber = v11;
  [(PLPhotoDCIMDirectory *)self->_dcimDirectory saveUserInfo];
  [(PLPhotoDCIMDirectory *)self->_dcimDirectory unlockDirectory];

  return v22;
}

- (id)fileGroups
{
  if (!self->_fileGroupsByNumber)
  {
    v3 = [(PLPhotoDCIMDirectory *)self->_dcimDirectory dcimPath];
    uint64_t v4 = [v3 stringByAppendingPathComponent:self->super._name];

    v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    v34 = (void *)v4;
    v5 = [v33 contentsOfDirectoryAtPath:v4 error:0];
    uint64_t v6 = [v5 count];
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v6];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileGroupsByNumber = self->_fileGroupsByNumber;
    self->_fileGroupsByNumber = v7;

    if (v6 >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v30 = *MEMORY[0x1E4F28310];
      v10 = &off_1E589E000;
      v36 = v5;
      do
      {
        uint64_t v11 = (void *)MEMORY[0x19F38F510]();
        unsigned int v39 = 0;
        unsigned int v12 = [v5 objectAtIndex:v9];
        unsigned int v13 = objc_msgSend(v10[163], "validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:", v12, 12, 8, &v39, 4, 4, 0);
        id v14 = [v13 pathExtension];
        if (v14)
        {
          if ([(PLPhotoDCFDirectory *)self isEntensionValid:v14]
            || [(PLPhotoDCFDirectory *)self considerInvalidFileGroups])
          {
            if (!v13 || ([(PLPhotoDCFFileGroup *)v14 isEqualToString:&stru_1EEBF74F0] & 1) != 0) {
              goto LABEL_16;
            }
            v15 = self->_fileGroupsByNumber;
            v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v39];
            v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

            if (!v17)
            {
              uint64_t v18 = [v34 stringByAppendingPathComponent:v12];
              v31 = [v33 attributesOfItemAtPath:v18 error:0];

              v35 = [v31 objectForKey:v30];
              v19 = [PLPhotoDCFFileGroup alloc];
              v20 = [v13 stringByDeletingPathExtension];
              v17 = [(PLPhotoDCFFileGroup *)v19 initWithName:v20 number:v39 directory:self];

              [(PLPhotoDCFFileGroup *)v17 setDate:v35];
              v21 = self->_fileGroupsByNumber;
              v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v39];
              [(NSMutableDictionary *)v21 setObject:v17 forKeyedSubscript:v22];

              int maxFileGroupNumber = self->_maxFileGroupNumber;
              if (maxFileGroupNumber <= (int)v39) {
                int maxFileGroupNumber = v39;
              }
              self->_int maxFileGroupNumber = maxFileGroupNumber;
              [v32 addObject:v17];
            }
            [(PLPhotoDCFFileGroup *)v17 addExtension:v14];
            v5 = v36;
          }
          else
          {
            v17 = v14;
            id v14 = 0;
          }

          v10 = &off_1E589E000;
        }
LABEL_16:

        ++v9;
      }
      while (v6 != v9);
    }
  }
  if (![(PLPhotoDCFDirectory *)self considerInvalidFileGroups])
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = self->_fileGroupsByNumber;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __33__PLPhotoDCFDirectory_fileGroups__block_invoke;
    v37[3] = &unk_1E589EE30;
    id v38 = v24;
    id v26 = v24;
    [(NSMutableDictionary *)v25 enumerateKeysAndObjectsUsingBlock:v37];
    [(NSMutableDictionary *)self->_fileGroupsByNumber removeObjectsForKeys:v26];
  }
  v27 = [(NSMutableDictionary *)self->_fileGroupsByNumber allValues];
  v28 = [v27 sortedArrayUsingSelector:sel_compare_];

  return v28;
}

void __33__PLPhotoDCFDirectory_fileGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && ([v5 isValid] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (BOOL)isEntensionValid:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:@"TH2"] & 1) == 0
    && ![v3 isEqualToString:@"THO"];

  return v4;
}

- (void)ensureDirectoryExists
{
  id v2 = [(PLPhotoDCFDirectory *)self fullPath];
  MEMORY[0x1F41092F8](v2, 448);
}

- (id)fullPath
{
  id v3 = [(PLPhotoDCIMDirectory *)self->_dcimDirectory dcimPath];
  BOOL v4 = [v3 stringByAppendingPathComponent:self->super._name];

  return v4;
}

- (BOOL)canAddVideo
{
  return [(PLPhotoDCFDirectory *)self _canAddItemWithPrefix:@"MOV"];
}

- (BOOL)canAddImage
{
  return [(PLPhotoDCFDirectory *)self _canAddItemWithPrefix:@"IMG"];
}

- (BOOL)_canAddItemWithPrefix:(id)a3
{
  BOOL v4 = [(PLPhotoDCFDirectory *)self _canAddItemWithPrefix:a3 minimumFileGroupNumber:(self->_lastUsedFileGroupNumber + 1)];
  if (!v4 && self->_lastUsedFileGroupNumber != 999)
  {
    self->_int lastUsedFileGroupNumber = 999;
    dcimDirectory = self->_dcimDirectory;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:999];
    id v7 = [(PLPhotoDCFDirectory *)self _lastUsedFileGroupUserInfoKey];
    [(PLPhotoDCIMDirectory *)dcimDirectory setUserInfoObject:v6 forKey:v7];

    [(PLPhotoDCIMDirectory *)self->_dcimDirectory saveUserInfo];
  }
  return v4;
}

- (BOOL)_canAddItemWithPrefix:(id)a3 minimumFileGroupNumber:(int)a4
{
  if ([(PLPhotoDCFDirectory *)self canAddFileGroupWithGroupNumber:*(void *)&a4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(PLPhotoDCFDirectory *)self fileGroups];
    uint64_t v8 = [v7 count];
    if (v8) {
      char v6 = 0;
    }
    else {
      char v6 = a4 < 999;
    }
    if (a4 <= 999)
    {
      unint64_t v9 = v8;
      if (v8 >= 1)
      {
        do
        {
          v10 = [v7 objectAtIndex:v9 - 1];
          int v11 = [v10 number];
          v6 |= v11 < 999;

          if (v11 <= a4 || v9 < 2) {
            break;
          }
          --v9;
        }
        while ((v6 & 1) == 0);
      }
    }
  }
  return v6 & 1;
}

- (BOOL)canAddFileGroupWithGroupNumber:(int)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x3E7) {
    return 0;
  }
  id v5 = self;
  unsigned int v6 = [(PLPhotoDCFDirectory *)self _calculateBaseDirectoryValue];
  +[PLPhotoDCFDirectory initializeFileGroupPrefixAndExtensions];
  id v7 = +[PLPhotoDCFDirectory fileGroupRequiredEmptyPrefixes];
  uint64_t v8 = +[PLPhotoDCFDirectory fileGroupRequiredEmptyExtensions];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v7;
  uint64_t v30 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v10 = (v6 + a3) % 0x2710;
    uint64_t v11 = *(void *)v38;
    unint64_t v12 = 0x1E4F29000uLL;
    unint64_t v13 = 0x1E4F28000uLL;
    v31 = v9;
    v32 = v8;
    uint64_t v28 = v10;
    v29 = v5;
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v9);
        }
        v15 = [*(id *)(v12 + 24) stringWithFormat:@"%@_%04d", *(void *)(*((void *)&v37 + 1) + 8 * v14), v10];
        v16 = [(PLPhotoDCFDirectory *)v5 fullPath];
        v17 = [v16 stringByAppendingPathComponent:v15];

        uint64_t v18 = [*(id *)(v13 + 3256) defaultManager];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v19 = v8;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [v17 stringByAppendingPathExtension:*(void *)(*((void *)&v33 + 1) + 8 * i)];
              char v25 = [v18 fileExistsAtPath:v24];

              if (v25)
              {

                BOOL v3 = 0;
                id v9 = v31;
                uint64_t v8 = v32;
                goto LABEL_21;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        ++v14;
        id v5 = v29;
        id v9 = v31;
        uint64_t v8 = v32;
        uint64_t v11 = v27;
        uint64_t v10 = v28;
        unint64_t v12 = 0x1E4F29000;
        unint64_t v13 = 0x1E4F28000;
      }
      while (v14 != v30);
      BOOL v3 = 1;
      uint64_t v30 = [v31 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }
  else
  {
    BOOL v3 = 1;
  }
LABEL_21:

  return v3;
}

- (unsigned)_calculateBaseDirectoryValue
{
  return 1000 * self->super._number - 100000;
}

- (id)dcimDirectory
{
  return self->_dcimDirectory;
}

- (PLPhotoDCFDirectory)initWithName:(id)a3 number:(int)a4 dcimDirectory:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLPhotoDCFDirectory;
  uint64_t v10 = [(PLPhotoDCFObject *)&v16 initWithName:a3 number:v6];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dcimDirectory, a5);
    dcimDirectory = v11->_dcimDirectory;
    unint64_t v13 = [(PLPhotoDCFDirectory *)v11 _lastUsedFileGroupUserInfoKey];
    uint64_t v14 = [(PLPhotoDCIMDirectory *)dcimDirectory userInfoObjectForKey:v13];
    v11->_int lastUsedFileGroupNumber = [v14 intValue];
  }
  return v11;
}

- (id)_lastUsedFileGroupUserInfoKey
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"LastFileGroupNumber-%d", self->super._number);
}

+ (id)fileGroupRequiredEmptyExtensions
{
  return (id)__fileGroupRequiredEmptyExtensions;
}

+ (id)fileGroupRequiredEmptyPrefixes
{
  return (id)__fileGroupRequiredEmptyPrefixes;
}

+ (void)initializeFileGroupPrefixAndExtensions
{
}

uint64_t __61__PLPhotoDCFDirectory_initializeFileGroupPrefixAndExtensions__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"IMG", @"MOV", 0);
  v1 = (void *)__fileGroupRequiredEmptyPrefixes;
  __fileGroupRequiredEmptyPrefixes = v0;

  __fileGroupRequiredEmptyExtensions = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"JPG", @"PNG", @"TIF", @"GIF", @"MOV", 0);
  return MEMORY[0x1F41817F8]();
}

@end