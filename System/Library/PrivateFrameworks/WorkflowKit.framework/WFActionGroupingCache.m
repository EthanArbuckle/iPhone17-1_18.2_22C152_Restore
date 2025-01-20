@interface WFActionGroupingCache
- (NSDictionary)actionsByGroupingIdentifier;
- (NSMutableDictionary)contents;
- (WFActionGroupingCache)init;
- (id)actionsForGroupingIdentifier:(id)a3;
- (void)addAction:(id)a3 sortingWithWorkflowActions:(id)a4;
- (void)removeAction:(id)a3;
- (void)sortActionsForGroupingIdentifier:(id)a3 withWorkflowActions:(id)a4;
@end

@implementation WFActionGroupingCache

- (void).cxx_destruct
{
}

- (NSMutableDictionary)contents
{
  return self->_contents;
}

- (id)actionsForGroupingIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_contents objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)sortActionsForGroupingIdentifier:(id)a3 withWorkflowActions:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_contents objectForKey:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__WFActionGroupingCache_sortActionsForGroupingIdentifier_withWorkflowActions___block_invoke;
  v9[3] = &unk_1E654F3A0;
  id v10 = v6;
  id v8 = v6;
  [v7 sortUsingComparator:v9];
}

uint64_t __78__WFActionGroupingCache_sortActionsForGroupingIdentifier_withWorkflowActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (void)removeAction:(id)a3
{
  id v6 = a3;
  v4 = [v6 groupingIdentifier];
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_contents objectForKey:v4];
    if ([v5 count] == 1 && objc_msgSend(v5, "containsObject:", v6)) {
      [(NSMutableDictionary *)self->_contents removeObjectForKey:v4];
    }
    else {
      [v5 removeObject:v6];
    }
  }
}

- (void)addAction:(id)a3 sortingWithWorkflowActions:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 groupingIdentifier];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_contents objectForKey:v7];
    if (v8)
    {
      v9 = v8;
      [v8 addObject:v10];
      if (v6) {
        [(WFActionGroupingCache *)self sortActionsForGroupingIdentifier:v7 withWorkflowActions:v6];
      }
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
      [(NSMutableDictionary *)self->_contents setObject:v9 forKey:v7];
    }
  }
}

- (NSDictionary)actionsByGroupingIdentifier
{
  v2 = (void *)[(NSMutableDictionary *)self->_contents copy];
  return (NSDictionary *)v2;
}

- (WFActionGroupingCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFActionGroupingCache;
  v2 = [(WFActionGroupingCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contents = v2->_contents;
    v2->_contents = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

@end