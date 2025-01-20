@interface FCFeedTransformationSort
+ (id)transformationWithSortMethod:(int64_t)a3;
+ (id)transformationWithSortMethod:(int64_t)a3 configurationSet:(int64_t)a4 personalizer:(id)a5;
+ (id)transformationWithSortMethod:(int64_t)a3 personalizer:(id)a4;
- (id)transformFeedItems:(id)a3;
@end

@implementation FCFeedTransformationSort

+ (id)transformationWithSortMethod:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      v3 = objc_opt_new();
      break;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)[[NSString alloc] initWithFormat:@"this sort method needs a personalizer, please use the +transformationWithSortMethod:personalizer: variant"];
        int v6 = 136315906;
        v7 = "+[FCFeedTransformationSort transformationWithSortMethod:]";
        __int16 v8 = 2080;
        v9 = "FCFeedTransformationSort.m";
        __int16 v10 = 1024;
        int v11 = 43;
        __int16 v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
      }
      goto LABEL_5;
    default:
LABEL_5:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)transformationWithSortMethod:(int64_t)a3 configurationSet:(int64_t)a4 personalizer:(id)a5
{
  id v7 = a5;
  if (a3 == 3)
  {
    if (NSClassFromString(&cfstr_Xctest.isa))
    {
      uint64_t v8 = objc_opt_new();
    }
    else
    {
      uint64_t v8 = +[FCFeedTransformationPersonalizedSort transformationWithPersonalizer:v7 configurationSet:a4];
    }
  }
  else
  {
    uint64_t v8 = +[FCFeedTransformationSort transformationWithSortMethod:a3];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)transformationWithSortMethod:(int64_t)a3 personalizer:(id)a4
{
  return (id)[a1 transformationWithSortMethod:a3 configurationSet:0 personalizer:a4];
}

- (id)transformFeedItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCFeedTransformationSort transformFeedItems:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCFeedTransformationSort.m";
    __int16 v13 = 1024;
    int v14 = 84;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedTransformationSort transformFeedItems:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

@end