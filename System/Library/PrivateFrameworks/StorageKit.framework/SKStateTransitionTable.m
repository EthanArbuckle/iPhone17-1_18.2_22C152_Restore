@interface SKStateTransitionTable
+ (id)tableWithTransitionEntries:(id)a3;
+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4;
- (NSMutableDictionary)entriesMap;
- (id)entryForState:(id)a3 event:(id)a4;
- (id)selectorTarget;
- (void)setEntriesMap:(id)a3;
- (void)setSelectorTarget:(id)a3;
@end

@implementation SKStateTransitionTable

+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_opt_new();
  [v6 setEntriesMap:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v6 entriesMap];
        v13 = [v11 state];
        v14 = [v12 objectForKeyedSubscript:v13];

        if (!v14)
        {
          v14 = objc_opt_new();
          v15 = [v6 entriesMap];
          v16 = [v11 state];
          [v15 setObject:v14 forKeyedSubscript:v16];
        }
        v17 = [v11 event];
        [v14 objectForKeyedSubscript:v17];
        if (objc_claimAutoreleasedReturnValue()) {
          +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]();
        }

        if ([v11 selector])
        {
          [v11 selector];
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]();
          }
          v18 = [v11 state];
          v19 = [v11 event];
          uint64_t v20 = [v11 selector];
          v21 = [v11 nextState];
          v22 = +[SKStateTransitionEntry entryWithState:v18 event:v19 selector:v20 nextState:v21];
          v23 = [v11 event];
          [v14 setObject:v22 forKeyedSubscript:v23];
        }
        else
        {
          v18 = [v11 state];
          v19 = [v11 event];
          v21 = [v11 action];
          v22 = [v11 nextState];
          v23 = +[SKStateTransitionEntry entryWithState:v18 event:v19 action:v21 nextState:v22];
          v24 = [v11 event];
          [v14 setObject:v23 forKeyedSubscript:v24];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  [v6 setSelectorTarget:v27];

  return v6;
}

+ (id)tableWithTransitionEntries:(id)a3
{
  return (id)[a1 tableWithTransitionEntries:a3 selectorTarget:0];
}

- (id)entryForState:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SKStateTransitionTable *)self entriesMap];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = [v9 objectForKeyedSubscript:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
}

- (id)selectorTarget
{
  return self->_selectorTarget;
}

- (void)setSelectorTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectorTarget, 0);

  objc_storeStrong((id *)&self->_entriesMap, 0);
}

+ (void)tableWithTransitionEntries:selectorTarget:.cold.1()
{
}

+ (void)tableWithTransitionEntries:selectorTarget:.cold.2()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 83, "events[entry.event] == nil");
}

@end