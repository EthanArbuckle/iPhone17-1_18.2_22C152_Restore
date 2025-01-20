@interface SXVideoAdStateManager
- (NFStateMachine)stateMachine;
- (SXVideoAdStateManager)init;
- (id)onFailBlock;
- (id)onFinishBlock;
- (id)onLearnMoreBlock;
- (id)onPauseBlock;
- (id)onPlayBlock;
- (id)onResumeBlock;
- (id)onSkipBlock;
- (void)failWithError:(id)a3;
- (void)finish;
- (void)learnMore;
- (void)onFail:(id)a3;
- (void)onFinish:(id)a3;
- (void)onLearnMore:(id)a3;
- (void)onPause:(id)a3;
- (void)onPlay:(id)a3;
- (void)onResume:(id)a3;
- (void)onSkip:(id)a3;
- (void)pause;
- (void)play;
- (void)resume;
- (void)skip;
@end

@implementation SXVideoAdStateManager

- (SXVideoAdStateManager)init
{
  v59[3] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)SXVideoAdStateManager;
  v2 = [(SXVideoAdStateManager *)&v53 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F59E90]) initWithName:@"idle"];
    v4 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"playing"];
    v5 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"paused"];
    v50 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"finished"];
    v49 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"failed"];
    v42 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"learning"];
    v45 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"skipped"];
    id v6 = objc_alloc(MEMORY[0x263F59E88]);
    v7 = (void *)MEMORY[0x263EFFA08];
    v59[0] = v3;
    v59[1] = v5;
    v43 = (void *)v3;
    v59[2] = v42;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
    v9 = [v7 setWithArray:v8];
    v48 = (void *)[v6 initWithName:@"play" transitionFromStates:v9 toState:v4];

    id v10 = objc_alloc(MEMORY[0x263F59E88]);
    v11 = (void *)MEMORY[0x263EFFA08];
    v58 = v4;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    v13 = [v11 setWithArray:v12];
    v47 = (void *)[v10 initWithName:@"pause" transitionFromStates:v13 toState:v5];

    id v14 = objc_alloc(MEMORY[0x263F59E88]);
    v15 = (void *)MEMORY[0x263EFFA08];
    v57[0] = v3;
    v57[1] = v4;
    v57[2] = v5;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
    v17 = [v15 setWithArray:v16];
    v46 = (void *)[v14 initWithName:@"fail" transitionFromStates:v17 toState:v49];

    id v18 = objc_alloc(MEMORY[0x263F59E88]);
    v19 = (void *)MEMORY[0x263EFFA08];
    v56 = v4;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    v21 = [v19 setWithArray:v20];
    v44 = (void *)[v18 initWithName:@"finish" transitionFromStates:v21 toState:v50];

    id v22 = objc_alloc(MEMORY[0x263F59E88]);
    v23 = (void *)MEMORY[0x263EFFA08];
    v55[0] = v4;
    v55[1] = v5;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    v25 = [v23 setWithArray:v24];
    v41 = (void *)[v22 initWithName:@"learnMore" transitionFromStates:v25 toState:v42];

    id v26 = objc_alloc(MEMORY[0x263F59E88]);
    v27 = (void *)MEMORY[0x263EFFA08];
    v54[0] = v4;
    v54[1] = v5;
    v54[2] = v42;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
    v29 = [v27 setWithArray:v28];
    v40 = (void *)[v26 initWithName:@"skip" transitionFromStates:v29 toState:v45];

    id v30 = (id)[v5 onWillEnter:&__block_literal_global_56];
    id v31 = (id)[v50 onWillEnter:&__block_literal_global_42];
    id v32 = (id)[v49 onWillEnter:&__block_literal_global_44];
    id v33 = (id)[v45 onWillEnter:&__block_literal_global_47];
    id v34 = (id)[v42 onWillEnter:&__block_literal_global_49];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __29__SXVideoAdStateManager_init__block_invoke_6;
    v51[3] = &unk_264653178;
    id v52 = v43;
    id v35 = v43;
    id v36 = (id)[v4 onWillEnter:v51];
    uint64_t v37 = [objc_alloc(MEMORY[0x263F59E80]) initWithState:v35 withOwner:v2];
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (NFStateMachine *)v37;

    [(NFStateMachine *)v2->_stateMachine addState:v4];
    [(NFStateMachine *)v2->_stateMachine addState:v5];
    [(NFStateMachine *)v2->_stateMachine addState:v50];
    [(NFStateMachine *)v2->_stateMachine addState:v49];
    [(NFStateMachine *)v2->_stateMachine addState:v45];
    [(NFStateMachine *)v2->_stateMachine addState:v42];
    [(NFStateMachine *)v2->_stateMachine addEvent:v48];
    [(NFStateMachine *)v2->_stateMachine addEvent:v47];
    [(NFStateMachine *)v2->_stateMachine addEvent:v46];
    [(NFStateMachine *)v2->_stateMachine addEvent:v44];
    [(NFStateMachine *)v2->_stateMachine addEvent:v41];
    [(NFStateMachine *)v2->_stateMachine addEvent:v40];
    [(NFStateMachine *)v2->_stateMachine activate];
  }
  return v2;
}

void __29__SXVideoAdStateManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v3 = [v5 onPauseBlock];

  if (v3)
  {
    v4 = [v5 onPauseBlock];
    v4[2]();
  }
}

void __29__SXVideoAdStateManager_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v3 = [v5 onFinishBlock];

  if (v3)
  {
    v4 = [v5 onFinishBlock];
    v4[2]();
  }
}

void __29__SXVideoAdStateManager_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v4 = a3;
  id v5 = [v4 onFailBlock];

  if (v5)
  {
    id v6 = [v11 context];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v11 context];
      v9 = [v8 error];
    }
    else
    {
      v9 = 0;
    }
    id v10 = [v4 onFailBlock];
    ((void (**)(void, void *))v10)[2](v10, v9);
  }
}

void __29__SXVideoAdStateManager_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v3 = [v5 onSkipBlock];

  if (v3)
  {
    id v4 = [v5 onSkipBlock];
    v4[2]();
  }
}

void __29__SXVideoAdStateManager_init__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v3 = [v5 onLearnMoreBlock];

  if (v3)
  {
    id v4 = [v5 onLearnMoreBlock];
    v4[2]();
  }
}

void __29__SXVideoAdStateManager_init__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = [a2 fromState];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v10 = [v12 onPlayBlock];

    v8 = v12;
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v9 = [v12 onPlayBlock];
  }
  else
  {
    v7 = [v12 onResumeBlock];

    v8 = v12;
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v9 = [v12 onResumeBlock];
  }
  id v11 = (void *)v9;
  (*(void (**)(void))(v9 + 16))();

  v8 = v12;
LABEL_7:
}

- (void)play
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"play" withContext:0];
}

- (void)pause
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"pause" withContext:0];
}

- (void)resume
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"play" withContext:0];
}

- (void)finish
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"finish" withContext:0];
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  v7 = [[SXVideoAdStateManagerErrorContext alloc] initWithError:v4];

  id v5 = [(SXVideoAdStateManager *)self stateMachine];
  id v6 = (id)[v5 fireEventWithName:@"fail" withContext:v7];
}

- (void)learnMore
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"learnMore" withContext:0];
}

- (void)skip
{
  id v3 = [(SXVideoAdStateManager *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"skip" withContext:0];
}

- (id)onPlayBlock
{
  return self->onPlayBlock;
}

- (void)onPlay:(id)a3
{
}

- (id)onPauseBlock
{
  return self->onPauseBlock;
}

- (void)onPause:(id)a3
{
}

- (id)onResumeBlock
{
  return self->onResumeBlock;
}

- (void)onResume:(id)a3
{
}

- (id)onFinishBlock
{
  return self->onFinishBlock;
}

- (void)onFinish:(id)a3
{
}

- (id)onFailBlock
{
  return self->onFailBlock;
}

- (void)onFail:(id)a3
{
}

- (id)onLearnMoreBlock
{
  return self->onLearnMoreBlock;
}

- (void)onLearnMore:(id)a3
{
}

- (id)onSkipBlock
{
  return self->onSkipBlock;
}

- (void)onSkip:(id)a3
{
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->onSkipBlock, 0);
  objc_storeStrong(&self->onLearnMoreBlock, 0);
  objc_storeStrong(&self->onFailBlock, 0);
  objc_storeStrong(&self->onFinishBlock, 0);
  objc_storeStrong(&self->onResumeBlock, 0);
  objc_storeStrong(&self->onPauseBlock, 0);
  objc_storeStrong(&self->onPlayBlock, 0);
}

@end