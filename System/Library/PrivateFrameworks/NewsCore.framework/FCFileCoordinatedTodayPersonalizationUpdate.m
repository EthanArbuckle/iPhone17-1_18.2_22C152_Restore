@interface FCFileCoordinatedTodayPersonalizationUpdate
- (FCFileCoordinatedDictionary)fileCoordinatedDictionary;
- (FCFileCoordinatedTodayPersonalizationUpdate)init;
- (FCFileCoordinatedTodayPersonalizationUpdate)initWithFileURL:(id)a3;
- (id)consumeUpdates;
- (void)clearUpdates;
- (void)readWithAccessor:(id)a3;
- (void)setFileCoordinatedDictionary:(id)a3;
- (void)submitUpdate:(id)a3 withCompletion:(id)a4;
@end

@implementation FCFileCoordinatedTodayPersonalizationUpdate

void __61__FCFileCoordinatedTodayPersonalizationUpdate_consumeUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:@"TodayPersonalizationUpdateKey"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 setObject:0 forKeyedSubscript:@"TodayPersonalizationUpdateKey"];
}

- (id)consumeUpdates
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  id v11 = 0;
  v2 = [(FCFileCoordinatedTodayPersonalizationUpdate *)self fileCoordinatedDictionary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__FCFileCoordinatedTodayPersonalizationUpdate_consumeUpdates__block_invoke;
  v5[3] = &unk_1E5B55BD0;
  v5[4] = &v6;
  [v2 writeSyncWithAccessor:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (void).cxx_destruct
{
}

- (FCFileCoordinatedTodayPersonalizationUpdate)initWithFileURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFileCoordinatedTodayPersonalizationUpdate initWithFileURL:]";
    __int16 v16 = 2080;
    v17 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    __int16 v18 = 1024;
    int v19 = 51;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v13.receiver = self;
  v13.super_class = (Class)FCFileCoordinatedTodayPersonalizationUpdate;
  v5 = [(FCFileCoordinatedTodayPersonalizationUpdate *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [[FCFileCoordinatedDictionary alloc] initWithFileURL:v4 allowedClasses:v8];
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v9;
  }
  return v5;
}

- (FCFileCoordinatedTodayPersonalizationUpdate)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFileCoordinatedTodayPersonalizationUpdate init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedTodayPersonalizationUpdate init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)readWithAccessor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCFileCoordinatedTodayPersonalizationUpdate readWithAccessor:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    __int16 v14 = 1024;
    int v15 = 74;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedTodayPersonalizationUpdate *)self fileCoordinatedDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__FCFileCoordinatedTodayPersonalizationUpdate_readWithAccessor___block_invoke;
  v8[3] = &unk_1E5B4DDF8;
  id v9 = v4;
  id v6 = v4;
  [v5 readWithAccessor:v8];
}

void __64__FCFileCoordinatedTodayPersonalizationUpdate_readWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6
    && ([v6 objectForKeyedSubscript:@"TodayPersonalizationUpdateKey"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [v6 objectForKeyedSubscript:@"TodayPersonalizationUpdateKey"];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)submitUpdate:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "update");
    *(_DWORD *)buf = 136315906;
    int v15 = "-[FCFileCoordinatedTodayPersonalizationUpdate submitUpdate:withCompletion:]";
    __int16 v16 = 2080;
    v17 = "FCFileCoordinatedTodayPersonalizationUpdate.m";
    __int16 v18 = 1024;
    int v19 = 91;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v15 = (const char *)@"Storing a personalization event from News Today Widget.";
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  id v9 = [(FCFileCoordinatedTodayPersonalizationUpdate *)self fileCoordinatedDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__FCFileCoordinatedTodayPersonalizationUpdate_submitUpdate_withCompletion___block_invoke;
  v12[3] = &unk_1E5B4BF78;
  id v13 = v6;
  id v10 = v6;
  [v9 writeWithAccessor:v12 completion:v7];
}

void __75__FCFileCoordinatedTodayPersonalizationUpdate_submitUpdate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 objectForKeyedSubscript:@"TodayPersonalizationUpdateKey"];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    [v6 setObject:v4 forKeyedSubscript:@"TodayPersonalizationUpdateKey"];
  }
  v5 = [v6 objectForKeyedSubscript:@"TodayPersonalizationUpdateKey"];
  [v5 addObject:*(void *)(a1 + 32)];
}

- (void)clearUpdates
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = @"Clearing events from News Today Widget";
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v4 = [(FCFileCoordinatedTodayPersonalizationUpdate *)self fileCoordinatedDictionary];
  [v4 writeWithAccessor:&__block_literal_global_88 completion:0];
}

uint64_t __59__FCFileCoordinatedTodayPersonalizationUpdate_clearUpdates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:0 forKeyedSubscript:@"TodayPersonalizationUpdateKey"];
}

- (void)setFileCoordinatedDictionary:(id)a3
{
}

@end