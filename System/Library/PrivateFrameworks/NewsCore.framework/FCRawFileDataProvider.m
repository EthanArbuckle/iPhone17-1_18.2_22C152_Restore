@interface FCRawFileDataProvider
- (BOOL)isRawFileConsumable;
- (FCInterestToken)holdToken;
- (FCRawFileDataProvider)init;
- (FCRawFileDataProvider)initWithFilePath:(id)a3;
- (FCRawFileDataProvider)initWithFilePath:(id)a3 holdToken:(id)a4;
- (NSData)data;
- (NSString)filePath;
@end

@implementation FCRawFileDataProvider

- (FCRawFileDataProvider)initWithFilePath:(id)a3 holdToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCRawFileDataProvider;
  v8 = [(FCRawFileDataProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    filePath = v8->_filePath;
    v8->_filePath = (NSString *)v9;

    v8->_isRawFileConsumable = 1;
    objc_storeStrong((id *)&v8->_holdToken, a4);
  }

  return v8;
}

- (NSData)data
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = [(FCRawFileDataProvider *)self filePath];
  v4 = [v2 dataWithContentsOfFile:v3];

  return (NSData *)v4;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (BOOL)isRawFileConsumable
{
  return self->_isRawFileConsumable;
}

- (FCRawFileDataProvider)initWithFilePath:(id)a3
{
  return [(FCRawFileDataProvider *)self initWithFilePath:a3 holdToken:0];
}

- (FCRawFileDataProvider)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRawFileDataProvider init]";
    __int16 v9 = 2080;
    v10 = "FCRawFileDataProvider.m";
    __int16 v11 = 1024;
    int v12 = 44;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCRawFileDataProvider init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCInterestToken)holdToken
{
  return self->_holdToken;
}

@end