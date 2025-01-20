@interface NSMutableDictionary(FCAccountActionQueue)
- (id)fc_dequeueTransactions;
- (uint64_t)fc_enqueueActionType:()FCAccountActionQueue;
- (void)fc_enqueueTransaction:()FCAccountActionQueue withMaxTransactionCount:;
- (void)fc_popActionTypesUpToCount:()FCAccountActionQueue;
- (void)fc_setLocalDataHintIfNeeded:()FCAccountActionQueue;
@end

@implementation NSMutableDictionary(FCAccountActionQueue)

- (void)fc_setLocalDataHintIfNeeded:()FCAccountActionQueue
{
  v5 = [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [NSNumber numberWithBool:a3];
    [a1 setObject:v7 forKeyedSubscript:@"FCFileCoordinatedAccountActionQueueLocalDataHintKey"];
  }
}

- (void)fc_popActionTypesUpToCount:()FCAccountActionQueue
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
  id v7 = [v5 arrayWithArray:v6];

  objc_msgSend(v7, "removeObjectsInRange:", 0, a3);
  [a1 setObject:v7 forKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
}

- (id)fc_dequeueTransactions
{
  uint64_t v2 = [a1 objectForKeyedSubscript:@"a"];
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    v4 = (void *)v2;
  }
  id v5 = v4;

  [a1 removeObjectForKey:@"a"];
  return v5;
}

- (uint64_t)fc_enqueueActionType:()FCAccountActionQueue
{
  uint64_t v3 = 0;
  if (a3 <= 6)
  {
    if (((1 << a3) & 0x26) != 0)
    {
      uint64_t v6 = [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueLocalDataHintKey"];
      uint64_t v3 = [v6 BOOLValue];
    }
    else if (((1 << a3) & 0x48) == 0)
    {
      return v3;
    }
    id v7 = [NSNumber numberWithBool:v3];
    [a1 setObject:v7 forKeyedSubscript:@"FCFileCoordinatedAccountActionQueueLocalDataHintKey"];

    uint64_t v8 = [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    v12 = (void *)[v11 mutableCopy];
    v13 = [NSNumber numberWithInteger:a3];
    [v12 addObject:v13];

    [a1 setObject:v12 forKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
    return 1;
  }
  return v3;
}

- (void)fc_enqueueTransaction:()FCAccountActionQueue withMaxTransactionCount:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transaction");
    *(_DWORD *)buf = 136315906;
    v14 = "-[NSMutableDictionary(FCAccountActionQueue) fc_enqueueTransaction:withMaxTransactionCount:]";
    __int16 v15 = 2080;
    v16 = "NSDictionary+FCTodayPrivateDataTransactionQueue.m";
    __int16 v17 = 1024;
    int v18 = 28;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v7 = [a1 objectForKeyedSubscript:@"a"];
  uint64_t v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  id v11 = (void *)[v10 mutableCopy];
  [v11 addObject:v6];
  objc_msgSend(v11, "fc_trimFromFrontToMaxCount:", a4);
  [a1 setObject:v11 forKeyedSubscript:@"a"];
}

@end