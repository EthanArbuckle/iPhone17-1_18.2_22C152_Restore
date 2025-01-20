@interface FCPuzzleRank
- (BOOL)defaultRank;
- (BOOL)isProdigyLevel;
- (FCPuzzleRank)initWithDictionary:(id)a3 index:(int64_t)a4;
- (NSString)identifier;
- (NSString)name;
- (int64_t)index;
@end

@implementation FCPuzzleRank

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (FCPuzzleRank)initWithDictionary:(id)a3 index:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCPuzzleRank;
  v7 = [(FCPuzzleRank *)&v16 init];
  if (v7)
  {
    v8 = FCAppConfigurationStringValue(v6, @"name", &stru_1EF8299B8);
    v9 = FCAppConfigurationStringValue(v6, @"identifier", &stru_1EF8299B8);
    char v10 = FCAppConfigurationBoolValue(v6, @"defaultRank", 0);
    char v11 = FCAppConfigurationBoolValue(v6, @"isProdigyLevel", 0);
    if (v8)
    {
      if (v9)
      {
        BOOL v12 = v11;
        objc_storeStrong((id *)&v7->_name, v8);
        objc_storeStrong((id *)&v7->_identifier, v9);
        v7->_defaultRank = v10;
        v7->_isProdigyLevel = v12;
        v7->_index = a4;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "name");
        *(_DWORD *)buf = 136315906;
        v18 = "-[FCPuzzleRank initWithDictionary:index:]";
        __int16 v19 = 2080;
        v20 = "FCPuzzleRank.m";
        __int16 v21 = 1024;
        int v22 = 25;
        __int16 v23 = 2114;
        v24 = v14;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      if (v9) {
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "identifier");
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCPuzzleRank initWithDictionary:index:]";
      __int16 v19 = 2080;
      v20 = "FCPuzzleRank.m";
      __int16 v21 = 1024;
      int v22 = 26;
      __int16 v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
LABEL_10:

    v7 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)index
{
  return self->_index;
}

- (BOOL)defaultRank
{
  return self->_defaultRank;
}

- (BOOL)isProdigyLevel
{
  return self->_isProdigyLevel;
}

@end