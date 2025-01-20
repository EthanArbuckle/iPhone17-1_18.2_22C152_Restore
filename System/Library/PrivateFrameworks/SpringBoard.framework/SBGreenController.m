@interface SBGreenController
- (BOOL)_writeGreenValuesToDisk:(id)a3 withState:(unint64_t)a4;
- (SBGreenController)init;
- (id)_defaultValuesDictionaryAndState:(unint64_t *)a3;
- (id)_deviceRegionCode;
- (unint64_t)_effectivePlaceIsAmbiguous:(BOOL *)a3;
- (void)_readFileStateFromDisk;
- (void)performPreBuddyWork;
@end

@implementation SBGreenController

- (SBGreenController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBGreenController;
  v2 = [(SBGreenController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    relevantGreenKeys = v2->_relevantGreenKeys;
    v2->_relevantGreenKeys = (NSArray *)&unk_1F33478C8;

    v3->_fileExistenceState = 0;
  }
  return v3;
}

- (void)performPreBuddyWork
{
  [(SBGreenController *)self _readFileStateFromDisk];
  if (self->_fileExistenceState - 1 <= 1)
  {
    uint64_t v4 = 0;
    v3 = [(SBGreenController *)self _defaultValuesDictionaryAndState:&v4];
    [(SBGreenController *)self _writeGreenValuesToDisk:v3 withState:v4];
  }
}

- (void)_readFileStateFromDisk
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist"];

  unint64_t v5 = 3;
  if (!v4) {
    unint64_t v5 = 1;
  }
  self->_fileExistenceState = v5;
  if (v4)
  {
    objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist"];
    v7 = [v6 objectForKey:@"state"];

    v8 = SBLogGreen();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Read non-empty file from disk", buf, 2u);
      }
      unint64_t v10 = 3;
    }
    else if (v9)
    {
      *(_WORD *)v13 = 0;
      unint64_t v10 = 2;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Empty on disk", v13, 2u);
    }
    else
    {
      unint64_t v10 = 2;
    }

    self->_fileExistenceState = v10;
  }
  else
  {
    v11 = SBLogGreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "File not on disk", v12, 2u);
    }

    self->_fileExistenceState = 1;
  }
}

- (id)_defaultValuesDictionaryAndState:(unint64_t *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_relevantGreenKeys, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v6 = self->_relevantGreenKeys;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v10 forKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v13 = 0;
  if (([(SBGreenController *)self _effectivePlaceIsAmbiguous:&v13] & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [v5 setValue:MEMORY[0x1E4F1CC38] forKey:@"key2"];
  }
  if (a3) {
    *a3 = v13 == 0;
  }
  return v5;
}

- (BOOL)_writeGreenValuesToDisk:(id)a3 withState:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
    [v8 setObject:v9 forKey:@"state"];

    id v32 = 0;
    v25 = v8;
    uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v32];
    id v23 = v32;
    if (v10) {
      char v24 = [v10 writeToFile:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist" options:268435457 error:0];
    }
    else {
      char v24 = 0;
    }
    int v12 = a4 << 6;
    char v31 = (_BYTE)a4 << 6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v26 = self;
    char v13 = self->_relevantGreenKeys;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = [v7 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          int v20 = [v19 BOOLValue];

          if (v20)
          {
            v12 |= 1 << (v16 + i);
            char v31 = v12;
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        v16 += i;
      }
      while (v15);
    }

    v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v31 length:1];
    [v21 writeToFile:@"/var/mobile/Library/Application Support/com.apple.palette.green.bin" options:268435457 error:0];

    self = v26;
    BOOL v11 = v24;
  }
  else
  {
    BOOL v11 = 0;
  }
  [(SBGreenController *)self _readFileStateFromDisk];

  return v11;
}

- (unint64_t)_effectivePlaceIsAmbiguous:(BOOL *)a3
{
  int v4 = [(SBGreenController *)self _deviceRegionCode];
  if ([v4 isEqualToString:@"CH"])
  {
    unint64_t v5 = 0;
    BOOL v6 = 0;
  }
  else if ([v4 isEqualToString:@"TA"])
  {
    BOOL v6 = 0;
    unint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"ZA"])
  {
    BOOL v6 = 0;
    unint64_t v5 = 2;
  }
  else if (([v4 isEqualToString:@"ZP"] & 1) != 0 {
         || [v4 isEqualToString:&stru_1F3084718])
  }
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    uint64_t v8 = [v7 countryCode];

    if ([v8 isEqualToString:@"CN"])
    {
      unint64_t v5 = 0;
    }
    else if ([v8 isEqualToString:@"TW"])
    {
      unint64_t v5 = 1;
    }
    else if ([v8 isEqualToString:@"HK"])
    {
      unint64_t v5 = 2;
    }
    else if ([v8 isEqualToString:@"MO"])
    {
      unint64_t v5 = 2;
    }
    else
    {
      unint64_t v5 = 3;
    }

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    unint64_t v5 = 3;
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (id)_deviceRegionCode
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MGCopyAnswerWithError();
  if (v2)
  {
    v3 = (const void *)v2;
    int v4 = [NSString stringWithString:v2];
    CFRelease(v3);
  }
  else
  {
    unint64_t v5 = SBLogGreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "MG returned NULL; %d", buf, 8u);
    }

    int v4 = &stru_1F3084718;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end