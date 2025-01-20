@interface WFSmartPromptsExfiltrationLogger
- (NSMutableDictionary)store;
- (WFSmartPromptsExfiltrationLogger)init;
- (id)attributionSetByRewritingSetWithLoggedCounts:(id)a3 forExfiltratingActionUUID:(id)a4;
- (unint64_t)currentExfiltratedItemCountForActionUUID:(id)a3 contentOrigin:(id)a4;
- (void)logExfiltratedItemsCount:(unint64_t)a3 actionUUID:(id)a4 contentOrigin:(id)a5;
- (void)setStore:(id)a3;
@end

@implementation WFSmartPromptsExfiltrationLogger

- (void).cxx_destruct
{
}

- (void)setStore:(id)a3
{
}

- (NSMutableDictionary)store
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributionSetByRewritingSetWithLoggedCounts:(id)a3 forExfiltratingActionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 attributions];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __107__WFSmartPromptsExfiltrationLogger_attributionSetByRewritingSetWithLoggedCounts_forExfiltratingActionUUID___block_invoke;
    v15 = &unk_1E65599A8;
    v16 = self;
    id v17 = v7;
    v9 = objc_msgSend(v8, "if_map:", &v12);

    objc_msgSend(MEMORY[0x1E4F5A828], "attributionSetWithAttributions:shouldReduceAttributions:", v9, 0, v12, v13, v14, v15, v16);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

id __107__WFSmartPromptsExfiltrationLogger_attributionSetByRewritingSetWithLoggedCounts_forExfiltratingActionUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  v5 = [v4 origin];
  uint64_t v6 = [v2 currentExfiltratedItemCountForActionUUID:v3 contentOrigin:v5];

  id v7 = objc_msgSend(v4, "attributionByUpdatingItemsCount:", objc_msgSend(v4, "count") + v6);

  return v7;
}

- (unint64_t)currentExfiltratedItemCountForActionUUID:(id)a3 contentOrigin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFSmartPromptsExfiltrationLogger *)self store];
  v9 = [v8 objectForKey:v7];

  id v10 = [v9 objectForKey:v6];

  unint64_t v11 = [v10 unsignedIntegerValue];
  return v11;
}

- (void)logExfiltratedItemsCount:(unint64_t)a3 actionUUID:(id)a4 contentOrigin:(id)a5
{
  id v17 = a4;
  id v9 = a5;
  if (v17)
  {
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFSmartPromptsExfiltrationLogger.m", 32, @"Invalid parameter not satisfying: %@", @"actionUUID" object file lineNumber description];

    if (!a3) {
      goto LABEL_7;
    }
  }
  if (v9)
  {
    id v10 = [(WFSmartPromptsExfiltrationLogger *)self store];
    unint64_t v11 = [v10 objectForKey:v17];

    if (!v11)
    {
      unint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v12 = [v11 objectForKey:v9];
    uint64_t v13 = [v12 unsignedIntegerValue];

    v14 = [NSNumber numberWithUnsignedInteger:v13 + a3];
    [v11 setObject:v14 forKey:v9];

    v15 = [(WFSmartPromptsExfiltrationLogger *)self store];
    [v15 setObject:v11 forKey:v17];
  }
LABEL_7:
}

- (WFSmartPromptsExfiltrationLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSmartPromptsExfiltrationLogger;
  v2 = [(WFSmartPromptsExfiltrationLogger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

@end