@interface FCTagSubscriptionOrderAssigner
- (FCTagSubscriptionOrderAssigner)init;
- (id)_assignOrderToSubscriptions:(void *)a1 withInitialOrder:(uint64_t)a2 orderSpacing:(uint64_t)a3;
- (id)assignOrderToTagSubscriptions:(id)a1;
- (void)initWithInitialOrder:(uint64_t)a3 orderSpacing:;
@end

@implementation FCTagSubscriptionOrderAssigner

- (FCTagSubscriptionOrderAssigner)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagSubscriptionOrderAssigner init]";
    __int16 v9 = 2080;
    v10 = "FCTagSubscriptionOrderAssigner.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagSubscriptionOrderAssigner init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)initWithInitialOrder:(uint64_t)a3 orderSpacing:
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)FCTagSubscriptionOrderAssigner;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (id)assignOrderToTagSubscriptions:(id)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = "-[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:]";
      __int16 v16 = 2080;
      v17 = "FCTagSubscriptionOrderAssigner.m";
      __int16 v18 = 1024;
      int v19 = 42;
      __int16 v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    objc_super v5 = objc_opt_new();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke_2;
    v10[3] = &unk_1E5B583F8;
    id v11 = v4;
    id v12 = a1;
    id v6 = v5;
    id v13 = v6;
    objc_msgSend(v11, "fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:", &__block_literal_global_129, v10);
    v7 = v13;
    a1 = v6;
  }
  return a1;
}

id __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = [a2 order];
  uint64_t v4 = [v2 numberWithInt:v3 == 0];

  return v4;
}

void __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  if ([a3 BOOLValue])
  {
    if (a4)
    {
      __int16 v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a4 - 1];
      v10 = [v9 order];
      uint64_t v11 = [v10 longLongValue];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = a4 + a5;
    if (v12 == [*(id *)(a1 + 32) count])
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = v31;
      id v15 = v14;
      if (a4)
      {
        if (v13)
        {
          if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
            *(_DWORD *)buf = 136315906;
            v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inOpenEndRangeWithPreviousValue:]";
            __int16 v34 = 2080;
            v35 = "FCTagSubscriptionOrderAssigner.m";
            __int16 v36 = 1024;
            int v37 = 141;
            __int16 v38 = 2114;
            v39 = v27;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          unint64_t v16 = *(void *)(v13 + 16);
          uint64_t v17 = v16 + v11;
LABEL_23:
          v24 = v15;
LABEL_29:
          v26 = -[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:withInitialOrder:orderSpacing:](v24, v17, v16);
LABEL_30:

          [*(id *)(a1 + 48) addObjectsFromArray:v26];
          goto LABEL_31;
        }
      }
      else if (v13)
      {
        if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
          *(_DWORD *)buf = 136315906;
          v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptionsInOpenRange:]";
          __int16 v34 = 2080;
          v35 = "FCTagSubscriptionOrderAssigner.m";
          __int16 v36 = 1024;
          int v37 = 158;
          __int16 v38 = 2114;
          v39 = v29;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v17 = *(void *)(v13 + 8);
        unint64_t v16 = *(void *)(v13 + 16);
        goto LABEL_23;
      }
    }
    else
    {
      __int16 v18 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v12];
      int v19 = [v18 order];
      uint64_t v20 = [v19 longLongValue];

      uint64_t v21 = *(void *)(a1 + 40);
      id v22 = v31;
      v23 = v22;
      if (a4)
      {
        if (v21)
        {
          if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
            *(_DWORD *)buf = 136315906;
            v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inClosedRangeWithPreviousValue:nextValue:]";
            __int16 v34 = 2080;
            v35 = "FCTagSubscriptionOrderAssigner.m";
            __int16 v36 = 1024;
            int v37 = 106;
            __int16 v38 = 2114;
            v39 = v28;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          unint64_t v16 = (v20 - v11) / (unint64_t)([v23 count] + 1);
          uint64_t v17 = v16 + v11;
          v24 = v23;
          goto LABEL_29;
        }
      }
      else if (v21)
      {
        if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
          *(_DWORD *)buf = 136315906;
          v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inOpenStartRangeWithNextValue:]";
          __int16 v34 = 2080;
          v35 = "FCTagSubscriptionOrderAssigner.m";
          __int16 v36 = 1024;
          int v37 = 123;
          __int16 v38 = 2114;
          v39 = v30;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        unint64_t v25 = *(void *)(v21 + 16);
        uint64_t v17 = v20 - [v23 count] * v25;
        v24 = v23;
        unint64_t v16 = v25;
        goto LABEL_29;
      }
    }
    v26 = 0;
    goto LABEL_30;
  }
LABEL_31:
}

- (id)_assignOrderToSubscriptions:(void *)a1 withInitialOrder:(uint64_t)a2 orderSpacing:(uint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptions != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v11 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:withInitialOrder:orderSpacing:]";
    __int16 v12 = 2080;
    uint64_t v13 = "FCTagSubscriptionOrderAssigner.m";
    __int16 v14 = 1024;
    int v15 = 176;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__FCTagSubscriptionOrderAssigner__assignOrderToSubscriptions_withInitialOrder_orderSpacing___block_invoke;
  v9[3] = &__block_descriptor_48_e75____FCReorderableTagSubscription__24__0Q8___FCReorderableTagSubscription__16l;
  v9[4] = a2;
  v9[5] = a3;
  id v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlockWithIndex:", v9);

  return v6;
}

id __92__FCTagSubscriptionOrderAssigner__assignOrderToSubscriptions_withInitialOrder_orderSpacing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32) + *(void *)(a1 + 40) * a2;
  id v5 = a3;
  id v6 = [v3 numberWithLongLong:v4];
  v7 = (void *)[v5 copyWithOrder:v6];

  return v7;
}

@end