@interface PLGreenController
- (BOOL)greenValuesSimilarToGreenValues:(id)a3;
- (BOOL)isGreenStateValid;
- (NSDictionary)currentGreenValues;
- (PLGreenController)init;
- (void)readValuesFromDisk;
@end

@implementation PLGreenController

- (void).cxx_destruct
{
}

- (NSDictionary)currentGreenValues
{
  return self->_currentGreenValues;
}

- (BOOL)greenValuesSimilarToGreenValues:(id)a3
{
  id v4 = a3;
  if ([(PLGreenController *)self isGreenStateValid])
  {
    v5 = [v4 objectForKeyedSubscript:@"key1"];
    v6 = [(PLGreenController *)self currentGreenValues];
    v7 = [v6 objectForKeyedSubscript:@"key1"];
    char v8 = [v5 isEqual:v7];

    v9 = [v4 objectForKeyedSubscript:@"key2"];
    uint64_t v10 = [(PLGreenController *)self currentGreenValues];
    v11 = [(id)v10 objectForKeyedSubscript:@"key2"];
    char v12 = [v9 isEqual:v11];

    v13 = [v4 objectForKeyedSubscript:@"key3"];
    v14 = [(PLGreenController *)self currentGreenValues];
    v15 = [v14 objectForKeyedSubscript:@"key3"];
    LOBYTE(v10) = [v13 isEqual:v15];

    char v16 = v8 & v12 & v10;
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)isGreenStateValid
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(PLGreenController *)self currentGreenValues];
  v3 = [v2 objectForKeyedSubscript:@"state"];
  uint64_t v4 = [v3 integerValue];

  if (v4 <= 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = 1;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Green state version is %ld, below the required threshold %ld. Cannot compare green values", (uint8_t *)&v6, 0x16u);
  }
  return v4 > 0;
}

- (void)readValuesFromDisk
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist"];
    currentGreenValues = self->_currentGreenValues;
    self->_currentGreenValues = v5;
  }
}

- (PLGreenController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLGreenController;
  v2 = [(PLGreenController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PLGreenController *)v2 readValuesFromDisk];
  }
  return v3;
}

@end