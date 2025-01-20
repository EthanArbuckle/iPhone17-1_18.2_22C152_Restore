@interface SBAnalyticsStateMachineEventHandler
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBAnalyticsStateMachineEventHandler)init;
- (unint64_t)currentState;
- (void)addEdge:(id)a3;
@end

@implementation SBAnalyticsStateMachineEventHandler

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_edges;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "fromState", (void)v15) == self->_currentState)
        {
          unint64_t v13 = [v12 handleEvent:a3 withContext:v6];
          if (self->_currentState != v13)
          {
            self->_currentState = v13;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return 1;
}

- (SBAnalyticsStateMachineEventHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBAnalyticsStateMachineEventHandler;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentState = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edges = v3->_edges;
    v3->_edges = v4;
  }
  return v3;
}

- (void)addEdge:(id)a3
{
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
}

@end