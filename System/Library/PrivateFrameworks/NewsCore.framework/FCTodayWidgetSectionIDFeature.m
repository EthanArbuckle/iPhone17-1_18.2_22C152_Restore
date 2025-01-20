@interface FCTodayWidgetSectionIDFeature
- (FCTodayWidgetSectionIDFeature)init;
- (void)initWithPersonalizationIdentifier:(void *)a1;
- (void)initWithSectionID:(void *)a1;
@end

@implementation FCTodayWidgetSectionIDFeature

- (void)initWithPersonalizationIdentifier:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    unint64_t v5 = [v3 length];
    uint64_t v6 = [@"f8" length];
    if (v5 <= [@"+" length] + v6)
    {
      v8 = 0;
    }
    else
    {
      v7 = [v4 substringFromIndex:objc_msgSend(@"+", "length") + objc_msgSend(@"f8", "length")];
      a1 = -[FCTodayWidgetSectionIDFeature initWithSectionID:](a1, v7);

      v8 = a1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FCTodayWidgetSectionIDFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[FCTodayWidgetSectionIDFeature initWithSectionID:](self, &stru_1EF8299B8);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTodayWidgetSectionIDFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 888;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  unint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTodayWidgetSectionIDFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)initWithSectionID:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCTodayWidgetSectionIDFeature;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      uint64_t v6 = [NSString stringWithFormat:@"%@%@%@", @"f8", @"+", v4];
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end