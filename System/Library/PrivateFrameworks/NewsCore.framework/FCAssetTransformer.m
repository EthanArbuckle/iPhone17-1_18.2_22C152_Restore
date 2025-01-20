@interface FCAssetTransformer
- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5;
@end

@implementation FCAssetTransformer

- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCAssetTransformer transformAssetDataFromFilePath:toFilePath:error:]";
    __int16 v15 = 2080;
    v16 = "FCAssetTransformer.m";
    __int16 v17 = 1024;
    int v18 = 17;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v11 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCAssetTransformer transformAssetDataFromFilePath:toFilePath:error:]"];
  id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

@end