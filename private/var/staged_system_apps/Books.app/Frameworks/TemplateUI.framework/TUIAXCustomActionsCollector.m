@interface TUIAXCustomActionsCollector
- (NSArray)customActionsForPress;
- (NSDictionary)customActionByRefIdAndTrigger;
- (TUIAXCustomActionsCollector)init;
- (void)addActionTriggerHandler:(id)a3 controlIdentifier:(id)a4;
@end

@implementation TUIAXCustomActionsCollector

- (TUIAXCustomActionsCollector)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIAXCustomActionsCollector;
  v2 = [(TUIAXCustomActionsCollector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    customActionByRefIdAndTrigger = v2->_customActionByRefIdAndTrigger;
    v2->_customActionByRefIdAndTrigger = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    customActionsForPress = v2->_customActionsForPress;
    v2->_customActionsForPress = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)addActionTriggerHandler:(id)a3 controlIdentifier:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  v6 = [v5 actionsData];
  v28 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = v6;
  id obj = [v6 allTriggers];
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v10);
        v12 = [TUIAXCustomAction alloc];
        v13 = [v26 behaviorDataForTrigger:v11];
        v14 = [v5 actionObject];
        v15 = [v5 actionDelegate];
        v16 = [(TUIAXCustomAction *)v12 initWithTrigger:v11 actionData:v13 actionObject:v14 actionDelegate:v15 controlIdentifier:v27];

        [v28 setObject:v16 forKey:v11];
        if ([v11 isEqualToString:@"press"]) {
          [(NSMutableArray *)self->_customActionsForPress addObject:v16];
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [v5 refId];
  if (v17)
  {
    v18 = (void *)v17;
    customActionByRefIdAndTrigger = self->_customActionByRefIdAndTrigger;
    v20 = [v5 refId];
    v21 = [(NSMutableDictionary *)customActionByRefIdAndTrigger objectForKey:v20];

    if (!v21)
    {
      v22 = self->_customActionByRefIdAndTrigger;
      v23 = [v5 refId];
      [(NSMutableDictionary *)v22 setObject:v28 forKey:v23];
    }
  }
}

- (NSDictionary)customActionByRefIdAndTrigger
{
  return &self->_customActionByRefIdAndTrigger->super;
}

- (NSArray)customActionsForPress
{
  return &self->_customActionsForPress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActionsForPress, 0);

  objc_storeStrong((id *)&self->_customActionByRefIdAndTrigger, 0);
}

@end