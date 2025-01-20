@interface BYGreenController
- (BOOL)_shouldWriteInformedDefaultPlist;
- (BOOL)_shouldWriteInitialPlist;
- (BOOL)_skuRegionCodeIsAmbiguous;
- (BOOL)_writeFilesWithPlist:(id)a3 desiredPlistState:(int)a4;
- (BOOL)_writePlistForLocaleRegionCode:(id)a3 desiredPlistState:(int)a4;
- (BYGreenController)init;
- (id)_extractGreenValuesForEffectivePlace:(unint64_t)a3 desiredPlistState:(int)a4;
- (id)_greenBinaryFilePath;
- (id)_greenPlistFilePath;
- (id)_skuRegionCode;
- (int)_readPlistState;
- (int)plistStateCache;
- (unint64_t)_effectivePlaceForLocaleRegionCode:(id)a3;
- (void)_skuRegionCode;
- (void)setPlistStateCache:(int)a3;
- (void)writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:(id)a3;
- (void)writeInitialPlistIfNecessary;
@end

@implementation BYGreenController

- (BYGreenController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYGreenController;
  v2 = [(BYGreenController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    relevantGreenKeys = v2->_relevantGreenKeys;
    v2->_relevantGreenKeys = (NSArray *)&unk_1EFE4E4F0;

    [(BYGreenController *)v3 setPlistStateCache:0xFFFFFFFFLL];
  }
  return v3;
}

- (void)writeInitialPlistIfNecessary
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(BYGreenController *)self _shouldWriteInitialPlist])
  {
    uint64_t v3 = [(BYGreenController *)self _skuRegionCodeIsAmbiguous] ^ 1;
    v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v5 = [v4 countryCode];
    BOOL v6 = [(BYGreenController *)self _writePlistForLocaleRegionCode:v5 desiredPlistState:v3];

    v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "green file initial did write with success %d", (uint8_t *)v8, 8u);
    }
  }
}

- (void)writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BYGreenController *)self _shouldWriteInformedDefaultPlist])
  {
    BOOL v5 = [(BYGreenController *)self _writePlistForLocaleRegionCode:v4 desiredPlistState:1];
    [(BYGreenController *)self setPlistStateCache:1];
    BOOL v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 1024;
      BOOL v10 = v5;
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "green write informed defaults completed for %@ with success %d", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (int)_readPlistState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(BYGreenController *)self _greenPlistFilePath];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
    int v7 = [(BYGreenController *)self _greenPlistFilePath];
    id v8 = [v6 dictionaryWithContentsOfFile:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v9 = [v8 objectForKeyedSubscript:@"state"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v10 = [v9 intValue];
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    uint64_t v11 = _BYLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, "green file already exists with state %d", (uint8_t *)v13, 8u);
    }
  }
  else
  {
    id v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "green file does not exist", (uint8_t *)v13, 2u);
    }
    int v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldWriteInitialPlist
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(BYGreenController *)self _greenPlistFilePath];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
    int v7 = [(BYGreenController *)self _greenPlistFilePath];
    id v8 = [v6 dictionaryWithContentsOfFile:v7];

    __int16 v9 = [v8 objectForKey:@"state"];
    BOOL v10 = v9 == 0;

    uint64_t v11 = _BYLoggingFacility();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        __int16 v18 = 0;
        v13 = "green file already exists with state key";
        uint64_t v14 = (uint8_t *)&v18;
LABEL_10:
        _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      }
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      v13 = "green file already exists without state key";
      uint64_t v14 = buf;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "green file does not exist", v16, 2u);
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_shouldWriteInformedDefaultPlist
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  LODWORD(v3) = [(BYGreenController *)self plistStateCache];
  if (v3 == -1)
  {
    uint64_t v3 = [(BYGreenController *)self _readPlistState];
    [(BYGreenController *)self setPlistStateCache:v3];
  }
  if ((int)v3 >= 2)
  {
    id v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "green write informed defaults unnecessary. already in state %d", (uint8_t *)v6, 8u);
    }
  }
  return (int)v3 < 2;
}

- (BOOL)_writePlistForLocaleRegionCode:(id)a3 desiredPlistState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = [(BYGreenController *)self _extractGreenValuesForEffectivePlace:[(BYGreenController *)self _effectivePlaceForLocaleRegionCode:a3] desiredPlistState:*(void *)&a4];
  LOBYTE(v4) = [(BYGreenController *)self _writeFilesWithPlist:v6 desiredPlistState:v4];

  return v4;
}

- (BOOL)_writeFilesWithPlist:(id)a3 desiredPlistState:(int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v30 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v30];
    id v23 = v30;
    if (v7)
    {
      id v8 = [(BYGreenController *)self _greenPlistFilePath];
      char v22 = [v7 writeToFile:v8 options:268435457 error:0];
    }
    else
    {
      char v22 = 0;
    }
    int v10 = a4 << 6;
    char v29 = (_BYTE)a4 << 6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v24 = self;
    uint64_t v11 = self->_relevantGreenKeys;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = [v6 objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          int v18 = [v17 BOOLValue];

          if (v18)
          {
            v10 |= 1 << (v14 + i);
            char v29 = v10;
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
        v14 += i;
      }
      while (v13);
    }

    v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v29 length:1];
    v20 = [(BYGreenController *)v24 _greenBinaryFilePath];
    [v19 writeToFile:v20 atomically:1];

    BOOL v9 = v22;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_greenPlistFilePath
{
  return @"/var/mobile/Library/Application Support/com.apple.palette.green.plist";
}

- (id)_greenBinaryFilePath
{
  return @"/var/mobile/Library/Application Support/com.apple.palette.green.bin";
}

- (id)_extractGreenValuesForEffectivePlace:(unint64_t)a3 desiredPlistState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 > 2) {
    int v5 = @"dict4";
  }
  else {
    int v5 = off_1E5D2C530[a3];
  }
  id v6 = [&unk_1EFE4E5C0 objectForKey:v5];
  uint64_t v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v9 = (void *)[v6 mutableCopy];
    int v10 = [NSNumber numberWithInt:v4];
    [v9 setObject:v10 forKeyedSubscript:@"state"];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_skuRegionCode
{
  int v7 = 0;
  uint64_t v2 = MGCopyAnswerWithError();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = [NSString stringWithString:v2];
    CFRelease(v3);
  }
  else
  {
    int v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(BYGreenController *)&v7 _skuRegionCode];
    }

    uint64_t v4 = &stru_1EFE45E30;
  }
  return v4;
}

- (BOOL)_skuRegionCodeIsAmbiguous
{
  uint64_t v2 = [(BYGreenController *)self _skuRegionCode];
  if ([v2 isEqualToString:@"ZP"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:&stru_1EFE45E30];
  }

  return v3;
}

- (unint64_t)_effectivePlaceForLocaleRegionCode:(id)a3
{
  id v4 = a3;
  int v5 = [(BYGreenController *)self _skuRegionCode];
  if ([v5 isEqualToString:@"CH"])
  {
LABEL_2:
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"TA"])
  {
LABEL_4:
    unint64_t v6 = 1;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"ZA"]) {
    goto LABEL_6;
  }
  if (([v5 isEqualToString:@"ZP"] & 1) == 0
    && ![v5 isEqualToString:&stru_1EFE45E30])
  {
    unint64_t v6 = 3;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"CN"]) {
    goto LABEL_2;
  }
  if ([v4 isEqualToString:@"TW"]) {
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"HK"])
  {
LABEL_6:
    unint64_t v6 = 2;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"MO"]) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 3;
  }
LABEL_7:

  return v6;
}

- (int)plistStateCache
{
  return self->_plistStateCache;
}

- (void)setPlistStateCache:(int)a3
{
  self->_plistStateCache = a3;
}

- (void).cxx_destruct
{
}

- (void)_skuRegionCode
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "green region code MG returned NULL; %d",
    (uint8_t *)v3,
    8u);
}

@end