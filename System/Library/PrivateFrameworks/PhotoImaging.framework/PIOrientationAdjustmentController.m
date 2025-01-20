@interface PIOrientationAdjustmentController
+ (id)valueKey;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (int64_t)orientation;
- (void)setOrientation:(int64_t)a3;
@end

@implementation PIOrientationAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((NUOrientationIsValid() & 1) == 0)
  {
    v7 = NUAssertLogger_10283();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v11 = NUAssertLogger_10283();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v22 = v15;
        __int16 v23 = 2114;
        v24 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v20 = [NSNumber numberWithInteger:a3];
  v5 = [(PIAdjustmentController *)self adjustment];
  v6 = +[PIOrientationAdjustmentController valueKey];
  [v5 setObject:v20 forKeyedSubscript:v6];
}

- (int64_t)orientation
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIOrientationAdjustmentController valueKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

+ (id)valueKey
{
  return @"value";
}

@end