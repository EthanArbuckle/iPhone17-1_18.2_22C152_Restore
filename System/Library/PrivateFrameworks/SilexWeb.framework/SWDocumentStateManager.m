@interface SWDocumentStateManager
- (BOOL)isDocumentReady;
- (NFStateMachine)stateMachine;
- (NSMutableArray)onLoadBlocks;
- (NSMutableArray)onReadyBlocks;
- (NSMutableArray)onUnloadBlocks;
- (SWDocumentStateManager)initWithUserContentController:(id)a3;
- (WKUserContentController)userContentController;
- (void)documentIsReady;
- (void)documentStartedLoading;
- (void)documentWillUnload;
- (void)onLoad:(id)a3;
- (void)onReady:(id)a3;
- (void)onUnload:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation SWDocumentStateManager

- (SWDocumentStateManager)initWithUserContentController:(id)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SWDocumentStateManager;
  v6 = [(SWDocumentStateManager *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userContentController, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    onReadyBlocks = v7->_onReadyBlocks;
    v7->_onReadyBlocks = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    onLoadBlocks = v7->_onLoadBlocks;
    v7->_onLoadBlocks = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    onUnloadBlocks = v7->_onUnloadBlocks;
    v7->_onUnloadBlocks = (NSMutableArray *)v12;

    v38 = [[SWWeakScriptMessageHandler alloc] initWithScriptMessageHandler:v7];
    [v5 addScriptMessageHandler:v38 name:@"documentReady"];
    v37 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"window.webkit.messageHandlers.documentReady.postMessage({});",
                    0,
                    1);
    [v5 addUserScript:v37];
    v35 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"idle"];
    v14 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"loading"];
    id v15 = (id)[v14 onWillEnter:&__block_literal_global];
    v16 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"ready"];
    id v17 = (id)[v16 onWillEnter:&__block_literal_global_18];
    v18 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"unload"];
    id v19 = (id)[v18 onWillEnter:&__block_literal_global_23];
    id v39 = v5;
    id v20 = objc_alloc(MEMORY[0x263F59E88]);
    v21 = (void *)MEMORY[0x263EFFA08];
    v42[0] = v35;
    v42[1] = v18;
    v42[2] = v16;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
    v23 = [v21 setWithArray:v22];
    v36 = (void *)[v20 initWithName:@"loading" transitionFromStates:v23 toState:v14];

    id v24 = objc_alloc(MEMORY[0x263F59E88]);
    v25 = [MEMORY[0x263EFFA08] setWithObject:v14];
    v26 = (void *)[v24 initWithName:@"ready" transitionFromStates:v25 toState:v16];

    id v27 = objc_alloc(MEMORY[0x263F59E88]);
    v28 = (void *)MEMORY[0x263EFFA08];
    v41[0] = v14;
    v41[1] = v16;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    v30 = [v28 setWithArray:v29];
    v31 = (void *)[v27 initWithName:@"unload" transitionFromStates:v30 toState:v18];

    id v5 = v39;
    uint64_t v32 = [objc_alloc(MEMORY[0x263F59E80]) initWithState:v35 withOwner:v7];
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = (NFStateMachine *)v32;

    [(NFStateMachine *)v7->_stateMachine addState:v14];
    [(NFStateMachine *)v7->_stateMachine addState:v16];
    [(NFStateMachine *)v7->_stateMachine addState:v18];
    [(NFStateMachine *)v7->_stateMachine addEvent:v36];
    [(NFStateMachine *)v7->_stateMachine addEvent:v26];
    [(NFStateMachine *)v7->_stateMachine addEvent:v31];
    [(NFStateMachine *)v7->_stateMachine activate];
  }
  return v7;
}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "onLoadBlocks", 0);
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "onReadyBlocks", 0);
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "onUnloadBlocks", 0);
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)documentStartedLoading
{
  id v3 = [(SWDocumentStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"loading" withContext:0];
}

- (void)documentIsReady
{
  id v3 = [(SWDocumentStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"ready" withContext:0];
}

- (void)documentWillUnload
{
  id v3 = [(SWDocumentStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"unload" withContext:0];
}

- (void)onReady:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWDocumentStateManager *)self onReadyBlocks];
    uint64_t v5 = (void *)MEMORY[0x22A621430](v4);

    [v6 addObject:v5];
  }
}

- (void)onLoad:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWDocumentStateManager *)self onLoadBlocks];
    uint64_t v5 = (void *)MEMORY[0x22A621430](v4);

    [v6 addObject:v5];
  }
}

- (void)onUnload:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWDocumentStateManager *)self onUnloadBlocks];
    uint64_t v5 = (void *)MEMORY[0x22A621430](v4);

    [v6 addObject:v5];
  }
}

- (BOOL)isDocumentReady
{
  id v2 = [(SWDocumentStateManager *)self stateMachine];
  id v3 = [v2 state];
  id v4 = [v3 name];
  char v5 = [v4 isEqualToString:@"ready"];

  return v5;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  char v5 = objc_msgSend(a4, "name", a3);
  int v6 = [v5 isEqualToString:@"documentReady"];

  if (v6)
  {
    [(SWDocumentStateManager *)self documentIsReady];
  }
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (NSMutableArray)onReadyBlocks
{
  return self->_onReadyBlocks;
}

- (NSMutableArray)onLoadBlocks
{
  return self->_onLoadBlocks;
}

- (NSMutableArray)onUnloadBlocks
{
  return self->_onUnloadBlocks;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_onUnloadBlocks, 0);
  objc_storeStrong((id *)&self->_onLoadBlocks, 0);
  objc_storeStrong((id *)&self->_onReadyBlocks, 0);

  objc_storeStrong((id *)&self->_userContentController, 0);
}

@end