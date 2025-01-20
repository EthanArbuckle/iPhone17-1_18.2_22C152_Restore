@interface SWTimeoutManager
- (NFStateMachine)stateMachine;
- (NSMutableArray)timeoutBlocks;
- (NSTimer)timer;
- (SWTimeoutManager)initWithTimeout:(double)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onTimeout:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation SWTimeoutManager

- (SWTimeoutManager)initWithTimeout:(double)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (a3 < 0.0 || v8 == 0 || v9 == 0)
  {
    v13 = 0;
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)SWTimeoutManager;
    v14 = [(SWTimeoutManager *)&v52 init];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [MEMORY[0x263EFF980] array];
      timeoutBlocks = v15->_timeoutBlocks;
      v15->_timeoutBlocks = (NSMutableArray *)v16;

      v42 = +[SWWeakMessageHandler handlerWithMessageHandler:v15];
      [v8 addMessageHandler:v42 name:@"presentable"];
      [v8 addMessageHandler:v42 name:@"loading"];
      [v8 addMessageHandler:v42 name:@"update"];
      v44 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"idle"];
      v18 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"waiting"];
      v19 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"timeout"];
      v43 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"loaded"];
      id v20 = objc_alloc(MEMORY[0x263F59E88]);
      v21 = [MEMORY[0x263EFFA08] setWithObject:v44];
      v41 = (void *)[v20 initWithName:@"waiting" transitionFromStates:v21 toState:v18];

      id v22 = objc_alloc(MEMORY[0x263F59E88]);
      v23 = [MEMORY[0x263EFFA08] setWithObject:v18];
      v39 = (void *)[v22 initWithName:@"timeout" transitionFromStates:v23 toState:v19];

      id v24 = objc_alloc(MEMORY[0x263F59E88]);
      v25 = [MEMORY[0x263EFFA08] setWithObject:v18];
      v40 = (void *)[v24 initWithName:@"loaded" transitionFromStates:v25 toState:v43];

      id v26 = objc_alloc(MEMORY[0x263F59E88]);
      v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v19, v18, v43, 0);
      v28 = (void *)[v26 initWithName:@"reload" transitionFromStates:v27 toState:v44];

      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke;
      v51[3] = &__block_descriptor_40_e55_v24__0__NFStateMachineTransition_8__SWTimeoutManager_16l;
      *(double *)&v51[4] = a3;
      id v29 = (id)[v18 onWillEnter:v51];
      id v30 = (id)[v18 onWillExit:&__block_literal_global_7];
      id v31 = (id)[v19 onWillEnter:&__block_literal_global_21];
      v32 = (void *)[objc_alloc(MEMORY[0x263F59E80]) initWithState:v44 withOwner:v15];
      [v32 addState:v18];
      [v32 addState:v43];
      [v32 addState:v19];
      [v32 addEvent:v41];
      [v32 addEvent:v39];
      [v32 addEvent:v40];
      [v32 addEvent:v28];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_5;
      v49[3] = &unk_2646FFBB8;
      id v33 = v32;
      id v50 = v33;
      [v10 onReady:v49];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_6;
      v47[3] = &unk_2646FFBB8;
      id v34 = v33;
      id v48 = v34;
      [v10 onLoad:v47];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_7;
      v45[3] = &unk_2646FFBB8;
      id v35 = v34;
      id v46 = v35;
      [v10 onUnload:v45];
      stateMachine = v15->_stateMachine;
      v15->_stateMachine = (NFStateMachine *)v35;
      id v37 = v35;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x263EFFA20];
    double v7 = *(double *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_2;
    v10[3] = &unk_2647001E0;
    id v8 = v4;
    id v11 = v8;
    id v9 = [v6 scheduledTimerWithTimeInterval:0 repeats:v10 block:v7];
    [v8 setTimer:v9];
  }
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  id v1 = (id)[v2 fireEventWithName:@"timeout" withContext:0];
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v3 = [v4 timer];
  [v3 invalidate];

  [v4 setTimer:0];
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(a3, "timeoutBlocks", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

id __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_5(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) fireEventWithName:@"waiting" withContext:0];
}

id __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_6(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) fireEventWithName:@"reload" withContext:0];
}

uint64_t __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_7(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) fireEventWithName:@"reload" withContext:0];
  v3 = *(void **)(a1 + 32);
  return [v3 deactivateIfNeeded];
}

- (void)onTimeout:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWTimeoutManager *)self timeoutBlocks];
    uint64_t v5 = (void *)MEMORY[0x22A621430](v4);

    [v6 addObject:v5];
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5 = [(SWTimeoutManager *)self stateMachine];
  id v4 = (id)[v5 fireEventWithName:@"loaded" withContext:0];
}

- (NSMutableArray)timeoutBlocks
{
  return self->_timeoutBlocks;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_timeoutBlocks, 0);
}

@end