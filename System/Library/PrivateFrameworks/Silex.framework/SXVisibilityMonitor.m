@interface SXVisibilityMonitor
- (BOOL)appeared;
- (BOOL)locked;
- (NFStateMachine)stateMachine;
- (NFStateMachineState)appearedState;
- (NFStateMachineState)appearingState;
- (NFStateMachineState)disappearedState;
- (NFStateMachineState)disappearingState;
- (NSMutableArray)didAppearBlocks;
- (NSMutableArray)didDisappearBlocks;
- (NSMutableArray)visiblePercentageBlocks;
- (NSMutableArray)willAppearBlocks;
- (NSMutableArray)willDisappearBlocks;
- (SXVisibilityMonitor)initWithObject:(id)a3 visiblePercentageProvider:(id)a4;
- (SXVisiblePercentageProviding)visiblePercentageProvider;
- (double)visiblePercentage;
- (id)object;
- (int64_t)lockCount;
- (unint64_t)state;
- (void)determineVisiblePercentage;
- (void)didAppear;
- (void)didDisappear;
- (void)lock;
- (void)onDidAppear:(id)a3;
- (void)onDidDisappear:(id)a3;
- (void)onVisiblePercentageChange:(id)a3;
- (void)onWillAppear:(id)a3;
- (void)onWillDisappear:(id)a3;
- (void)setLockCount:(int64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setVisiblePercentage:(double)a3;
- (void)unlock;
- (void)willAppear;
- (void)willDisappear;
@end

@implementation SXVisibilityMonitor

- (SXVisibilityMonitor)initWithObject:(id)a3 visiblePercentageProvider:(id)a4
{
  v60[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)SXVisibilityMonitor;
  v8 = [(SXVisibilityMonitor *)&v56 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    willAppearBlocks = v8->_willAppearBlocks;
    v8->_willAppearBlocks = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    didAppearBlocks = v8->_didAppearBlocks;
    v8->_didAppearBlocks = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    visiblePercentageBlocks = v8->_visiblePercentageBlocks;
    v8->_visiblePercentageBlocks = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    willDisappearBlocks = v8->_willDisappearBlocks;
    v8->_willDisappearBlocks = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    didDisappearBlocks = v8->_didDisappearBlocks;
    v8->_didDisappearBlocks = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v8->_visiblePercentageProvider, a4);
    objc_storeWeak(&v8->_object, v6);
    v8->_state = 0;
    uint64_t v19 = [objc_alloc(MEMORY[0x263F59E90]) initWithName:@"appearing"];
    appearingState = v8->_appearingState;
    v8->_appearingState = (NFStateMachineState *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F59E90]) initWithName:@"appeared"];
    appearedState = v8->_appearedState;
    v8->_appearedState = (NFStateMachineState *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F59E90]) initWithName:@"disappearing"];
    disappearingState = v8->_disappearingState;
    v8->_disappearingState = (NFStateMachineState *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263F59E90]) initWithName:@"disappeared"];
    disappearedState = v8->_disappearedState;
    v8->_disappearedState = (NFStateMachineState *)v25;

    id v27 = (id)[(NFStateMachineState *)v8->_appearingState onDidEnter:&__block_literal_global_30];
    id v28 = (id)[(NFStateMachineState *)v8->_appearedState onDidEnter:&__block_literal_global_14];
    id v29 = (id)[(NFStateMachineState *)v8->_disappearingState onDidEnter:&__block_literal_global_16];
    id v30 = (id)[(NFStateMachineState *)v8->_disappearedState onDidEnter:&__block_literal_global_18_0];
    id v31 = objc_alloc(MEMORY[0x263F59E88]);
    v32 = (void *)MEMORY[0x263EFFA08];
    v60[0] = v8->_disappearedState;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
    v34 = [v32 setWithArray:v33];
    v35 = (void *)[v31 initWithName:@"appearing" transitionFromStates:v34 toState:v8->_appearingState];

    id v36 = objc_alloc(MEMORY[0x263F59E88]);
    v37 = (void *)MEMORY[0x263EFFA08];
    v38 = v8->_disappearingState;
    v59[0] = v8->_appearingState;
    v59[1] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
    v40 = [v37 setWithArray:v39];
    v41 = (void *)[v36 initWithName:@"appeared" transitionFromStates:v40 toState:v8->_appearedState];

    id v42 = objc_alloc(MEMORY[0x263F59E88]);
    v43 = (void *)MEMORY[0x263EFFA08];
    v58 = v8->_appearedState;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    v45 = [v43 setWithArray:v44];
    v46 = (void *)[v42 initWithName:@"disappearing" transitionFromStates:v45 toState:v8->_disappearingState];

    id v47 = objc_alloc(MEMORY[0x263F59E88]);
    v48 = (void *)MEMORY[0x263EFFA08];
    v49 = v8->_disappearingState;
    v57[0] = v8->_appearingState;
    v57[1] = v49;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
    v51 = [v48 setWithArray:v50];
    v52 = (void *)[v47 initWithName:@"disappeared" transitionFromStates:v51 toState:v8->_disappearedState];

    uint64_t v53 = [objc_alloc(MEMORY[0x263F59E80]) initWithState:v8->_disappearedState withOwner:v8];
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (NFStateMachine *)v53;

    [(NFStateMachine *)v8->_stateMachine addState:v8->_appearedState];
    [(NFStateMachine *)v8->_stateMachine addEvent:v35];
    [(NFStateMachine *)v8->_stateMachine addEvent:v41];
    [(NFStateMachine *)v8->_stateMachine addEvent:v46];
    [(NFStateMachine *)v8->_stateMachine addEvent:v52];
    [(NFStateMachine *)v8->_stateMachine activate];
  }
  return v8;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setState:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "willAppearBlocks", 0);
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [MEMORY[0x263F59E70] asVoid];

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setState:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "didAppearBlocks", 0);
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [MEMORY[0x263F59E70] asVoid];

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setState:3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "willDisappearBlocks", 0);
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [MEMORY[0x263F59E70] asVoid];

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setState:4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "didDisappearBlocks", 0);
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [MEMORY[0x263F59E70] asVoid];

  return v10;
}

- (void)lock
{
  int64_t v3 = [(SXVisibilityMonitor *)self lockCount] + 1;
  [(SXVisibilityMonitor *)self setLockCount:v3];
}

- (void)unlock
{
  int64_t v3 = [(SXVisibilityMonitor *)self lockCount] - 1;
  [(SXVisibilityMonitor *)self setLockCount:v3];
}

- (BOOL)locked
{
  return [(SXVisibilityMonitor *)self lockCount] > 0;
}

- (BOOL)appeared
{
  v2 = self;
  int64_t v3 = [(SXVisibilityMonitor *)self stateMachine];
  v4 = [v3 state];
  v5 = [(SXVisibilityMonitor *)v2 appearedState];
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)onWillAppear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVisibilityMonitor *)self willAppearBlocks];
  v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onDidAppear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVisibilityMonitor *)self didAppearBlocks];
  v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onVisiblePercentageChange:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVisibilityMonitor *)self visiblePercentageBlocks];
  v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onWillDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVisibilityMonitor *)self willDisappearBlocks];
  v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onDidDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVisibilityMonitor *)self didDisappearBlocks];
  v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)willAppear
{
  id v3 = [(SXVisibilityMonitor *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"appearing" withContext:0];
}

- (void)didAppear
{
  id v3 = [(SXVisibilityMonitor *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"appeared" withContext:0];
}

- (void)willDisappear
{
  id v3 = [(SXVisibilityMonitor *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"disappearing" withContext:0];
}

- (void)didDisappear
{
  id v3 = [(SXVisibilityMonitor *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"disappeared" withContext:0];
}

- (void)determineVisiblePercentage
{
  if ([(SXVisibilityMonitor *)self locked]) {
    return;
  }
  id v3 = [(SXVisibilityMonitor *)self visiblePercentageProvider];
  id v4 = [(SXVisibilityMonitor *)self object];
  [v3 visiblePercentageOfObject:v4];
  double v6 = v5;

  [(SXVisibilityMonitor *)self setVisiblePercentage:v6];
  uint64_t v7 = [(SXVisibilityMonitor *)self stateMachine];
  uint64_t v8 = [v7 state];
  uint64_t v9 = [(SXVisibilityMonitor *)self appearedState];
  if (v8 != v9 || v6 >= 1.0)
  {

    goto LABEL_8;
  }

  if (v6 < 0.0)
  {
LABEL_8:
    v10 = [(SXVisibilityMonitor *)self stateMachine];
    uint64_t v11 = [v10 state];
    long long v12 = [(SXVisibilityMonitor *)self disappearedState];
    if (v11 == v12 && v6 <= 1.0)
    {

      if (v6 > 0.0) {
        [(SXVisibilityMonitor *)self willAppear];
      }
    }
    else
    {
    }
    goto LABEL_13;
  }
  [(SXVisibilityMonitor *)self willDisappear];
LABEL_13:
  long long v13 = [(SXVisibilityMonitor *)self stateMachine];
  long long v14 = [v13 state];
  long long v15 = [(SXVisibilityMonitor *)self disappearedState];

  if (v14 == v15 || v6 > 0.0)
  {
    v16 = [(SXVisibilityMonitor *)self stateMachine];
    uint64_t v17 = [v16 state];
    v18 = [(SXVisibilityMonitor *)self appearedState];

    if (v17 != v18 && v6 >= 1.0)
    {
      [(SXVisibilityMonitor *)self didAppear];
    }
  }
  else
  {
    [(SXVisibilityMonitor *)self didDisappear];
  }
}

- (void)setVisiblePercentage:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_visiblePercentage != a3)
  {
    self->_visiblePercentage = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(SXVisibilityMonitor *)self visiblePercentageBlocks];
    double v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(double))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(a3);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SXVisiblePercentageProviding)visiblePercentageProvider
{
  return self->_visiblePercentageProvider;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)appearingState
{
  return self->_appearingState;
}

- (NFStateMachineState)appearedState
{
  return self->_appearedState;
}

- (NFStateMachineState)disappearingState
{
  return self->_disappearingState;
}

- (NFStateMachineState)disappearedState
{
  return self->_disappearedState;
}

- (NSMutableArray)willAppearBlocks
{
  return self->_willAppearBlocks;
}

- (NSMutableArray)didAppearBlocks
{
  return self->_didAppearBlocks;
}

- (NSMutableArray)visiblePercentageBlocks
{
  return self->_visiblePercentageBlocks;
}

- (NSMutableArray)willDisappearBlocks
{
  return self->_willDisappearBlocks;
}

- (NSMutableArray)didDisappearBlocks
{
  return self->_didDisappearBlocks;
}

- (int64_t)lockCount
{
  return self->_lockCount;
}

- (void)setLockCount:(int64_t)a3
{
  self->_lockCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_willDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_visiblePercentageBlocks, 0);
  objc_storeStrong((id *)&self->_didAppearBlocks, 0);
  objc_storeStrong((id *)&self->_willAppearBlocks, 0);
  objc_storeStrong((id *)&self->_disappearedState, 0);
  objc_storeStrong((id *)&self->_disappearingState, 0);
  objc_storeStrong((id *)&self->_appearedState, 0);
  objc_storeStrong((id *)&self->_appearingState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_visiblePercentageProvider, 0);
  objc_destroyWeak(&self->_object);
}

@end