@interface SXLayoutOperation
- (BOOL)executing;
- (BOOL)finished;
- (BOOL)isAsynchronous;
- (BOOL)layoutBlueprint:(id)a3 containsComponents:(id)a4;
- (SXColumnLayouter)layouter;
- (SXComponentSizerEngine)componentSizerEngine;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXLayoutBlueprint)layoutBlueprint;
- (SXLayoutBlueprintFactory)layoutBlueprintFactory;
- (SXLayoutOperation)initWithTask:(id)a3 layouter:(id)a4 DOMObjectProvider:(id)a5 componentSizerEngine:(id)a6 layoutBlueprintFactory:(id)a7;
- (SXLayoutTask)task;
- (double)duration;
- (double)startTime;
- (id)afterBlock;
- (id)beforeBlock;
- (id)createLayoutBlueprintForComponents:(id)a3;
- (id)layoutWithBlueprint:(id)a3;
- (void)afterLayout:(id)a3;
- (void)beforeLayout:(id)a3;
- (void)cancelOperation;
- (void)finishBookKeeping;
- (void)layouter:(id)a3 didFinishLayoutForComponentBlueprint:(id)a4 layoutBlueprint:(id)a5 shouldContinueLayout:(BOOL *)a6;
- (void)prepareLayoutBlueprint:(id)a3;
- (void)registerComponent:(id)a3 layoutBlueprint:(id)a4 componentIndex:(unint64_t)a5;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
- (void)startBookKeeping;
- (void)updateLayoutBlueprint:(id)a3 components:(id)a4 requiresInvalidation:(BOOL *)a5;
@end

@implementation SXLayoutOperation

- (SXLayoutOperation)initWithTask:(id)a3 layouter:(id)a4 DOMObjectProvider:(id)a5 componentSizerEngine:(id)a6 layoutBlueprintFactory:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutOperation;
  v17 = [(SXLayoutOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_task, a3);
    objc_storeStrong((id *)&v18->_DOMObjectProvider, a5);
    objc_storeStrong((id *)&v18->_componentSizerEngine, a6);
    objc_storeStrong((id *)&v18->_layoutBlueprintFactory, a7);
    objc_storeStrong((id *)&v18->_layouter, a4);
    [v13 setDelegate:v18];
  }

  return v18;
}

- (void)start
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(SXLayoutOperation *)self isCancelled])
  {
    [(SXLayoutOperation *)self cancelOperation];
  }
  else
  {
    v3 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = [(SXLayoutOperation *)self task];
      v6 = [v5 identifier];
      v7 = [(SXLayoutOperation *)self task];
      int v22 = 138543618;
      v23 = v6;
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Starting layout operation for task, task-identifier=%{public}@, task: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    [(SXLayoutOperation *)self startBookKeeping];
    v8 = [(SXLayoutOperation *)self task];
    v9 = [v8 blueprint];

    [(SXLayoutOperation *)self prepareLayoutBlueprint:v9];
    v10 = [(SXLayoutOperation *)self beforeBlock];

    if (v10)
    {
      v11 = [(SXLayoutOperation *)self beforeBlock];
      ((void (**)(void, void *))v11)[2](v11, v9);
    }
    if (([(SXLayoutOperation *)self isCancelled] & 1) == 0)
    {
      while (1)
      {
        v12 = v9;
        v9 = [(SXLayoutOperation *)self layoutWithBlueprint:v9];

        uint64_t v13 = [(SXLayoutOperation *)self afterBlock];
        if (v13)
        {
          id v14 = (void *)v13;
          char v15 = [(SXLayoutOperation *)self isCancelled];

          if ((v15 & 1) == 0)
          {
            id v16 = [(SXLayoutOperation *)self afterBlock];
            ((void (**)(void, void *))v16)[2](v16, v9);
          }
        }
        if ([(SXLayoutOperation *)self isCancelled]) {
          break;
        }
        v17 = [(SXLayoutOperation *)self task];
        v18 = [v17 instructions];
        if ([v18 areFulfilledForBlueprint:v9])
        {
          v19 = [(SXLayoutOperation *)self DOMObjectProvider];
          id v20 = [v19 components];
          BOOL v21 = [(SXLayoutOperation *)self layoutBlueprint:v9 containsComponents:v20];

          if (v21) {
            break;
          }
        }
        else
        {
        }
      }
      objc_storeStrong((id *)&self->_layoutBlueprint, v9);
    }
    [(SXLayoutOperation *)self finishBookKeeping];
  }
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)cancelOperation
{
  [(SXLayoutOperation *)self startBookKeeping];
  [(SXLayoutOperation *)self finishBookKeeping];
}

- (void)startBookKeeping
{
  self->_startTime = CACurrentMediaTime();
  [(SXLayoutOperation *)self willChangeValueForKey:@"isExecuting"];
  [(SXLayoutOperation *)self setExecuting:1];
  [(SXLayoutOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)finishBookKeeping
{
  self->_duration = CACurrentMediaTime() - self->_startTime;
  v3 = [(SXLayoutOperation *)self completionBlock];

  if (v3)
  {
    v4 = [(SXLayoutOperation *)self completionBlock];
    v4[2]();

    [(SXLayoutOperation *)self setCompletionBlock:0];
  }
  [(SXLayoutOperation *)self willChangeValueForKey:@"isExecuting"];
  [(SXLayoutOperation *)self setExecuting:0];
  [(SXLayoutOperation *)self didChangeValueForKey:@"isExecuting"];
  [(SXLayoutOperation *)self willChangeValueForKey:@"isFinished"];
  [(SXLayoutOperation *)self setFinished:1];
  [(SXLayoutOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)prepareLayoutBlueprint:(id)a3
{
}

- (id)layoutWithBlueprint:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    BOOL v21 = [(SXLayoutOperation *)self DOMObjectProvider];
    int v22 = [v21 components];
    v5 = [(SXLayoutOperation *)self createLayoutBlueprintForComponents:v22];

    v23 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = v23;
      v25 = [(SXLayoutOperation *)self task];
      uint64_t v26 = [v25 identifier];
      *(_DWORD *)v55 = 138412546;
      *(void *)&v55[4] = v5;
      *(_WORD *)&v55[12] = 2112;
      *(void *)&v55[14] = v26;
      _os_log_impl(&dword_222AC5000, v24, OS_LOG_TYPE_DEFAULT, "Created new layout blueprint, layout-blueprint=%@, task-identifier=%@", v55, 0x16u);
    }
    goto LABEL_18;
  }
  v5 = v4;
  v6 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = [(SXLayoutOperation *)self task];
    v9 = [v8 identifier];
    *(_DWORD *)v55 = 138412546;
    *(void *)&v55[4] = v9;
    *(_WORD *)&v55[12] = 1024;
    *(_DWORD *)&v55[14] = [v5 isComplete];
    _os_log_impl(&dword_222AC5000, v7, OS_LOG_TYPE_DEFAULT, "Validating existing layout, task-identifier=%@, layoutIsComplete=%d", v55, 0x12u);
  }
  v10 = [(SXLayoutOperation *)self task];
  v11 = [v10 instructions];
  char v12 = [v11 areFulfilledForBlueprint:v5];

  if (v12)
  {
    uint64_t v13 = [(SXLayoutOperation *)self DOMObjectProvider];
    id v14 = [v13 components];
    BOOL v15 = [(SXLayoutOperation *)self layoutBlueprint:v5 containsComponents:v14];

    id v16 = (void *)SXLayoutLog;
    BOOL v17 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v18 = v16;
        v19 = [(SXLayoutOperation *)self task];
        id v20 = [v19 identifier];
        *(_DWORD *)v55 = 138412290;
        *(void *)&v55[4] = v20;
        _os_log_impl(&dword_222AC5000, v18, OS_LOG_TYPE_DEFAULT, "No layout required, blueprint is valid, task-identifier=%@", v55, 0xCu);
      }
      goto LABEL_23;
    }
    if (!v17) {
      goto LABEL_15;
    }
    v28 = v16;
    v29 = [(SXLayoutOperation *)self task];
    v30 = [v29 identifier];
    *(_DWORD *)v55 = 138412290;
    *(void *)&v55[4] = v30;
    v31 = "Requiring layout, DOM contains components that are not in provided blueprint, task-identifier=%@";
    goto LABEL_14;
  }
  v27 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    v29 = [(SXLayoutOperation *)self task];
    v30 = [v29 identifier];
    *(_DWORD *)v55 = 138412290;
    *(void *)&v55[4] = v30;
    v31 = "Requiring layout, instructions are not fullfilled with provided blueprint, task-identifier=%@";
LABEL_14:
    _os_log_impl(&dword_222AC5000, v28, OS_LOG_TYPE_DEFAULT, v31, v55, 0xCu);
  }
LABEL_15:
  v32 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v34 = [(SXLayoutOperation *)self task];
    v35 = [v34 identifier];
    *(_DWORD *)v55 = 138412290;
    *(void *)&v55[4] = v35;
    _os_log_impl(&dword_222AC5000, v33, OS_LOG_TYPE_DEFAULT, "Updating existing layout blueprint, task-identifier=%@", v55, 0xCu);
  }
  v36 = [(SXLayoutOperation *)self DOMObjectProvider];
  v37 = [v36 components];
  [(SXLayoutOperation *)self updateLayoutBlueprint:v5 components:v37 requiresInvalidation:0];

LABEL_18:
  v38 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    v40 = [(SXLayoutOperation *)self task];
    v41 = [v40 identifier];
    *(_DWORD *)v55 = 138412290;
    *(void *)&v55[4] = v41;
    _os_log_impl(&dword_222AC5000, v39, OS_LOG_TYPE_DEFAULT, "Invalidating components in layout, task-identifier=%@", v55, 0xCu);
  }
  [v5 invalidateDependentsOfInvalidatedComponents];
  v42 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v43 = v42;
    v44 = [(SXLayoutOperation *)self task];
    v45 = [v44 identifier];
    *(_DWORD *)v55 = 138412290;
    *(void *)&v55[4] = v45;
    _os_log_impl(&dword_222AC5000, v43, OS_LOG_TYPE_DEFAULT, "Starting layout for task, task-identifier=%@", v55, 0xCu);
  }
  v46 = [SXLayoutDescription alloc];
  v47 = [(SXLayoutOperation *)self task];
  v48 = [v47 identifier];
  v49 = [(SXLayoutDescription *)v46 initWithTaskIdentifier:v48];

  v55[0] = 0;
  v50 = [(SXLayoutOperation *)self layouter];
  v51 = [(SXLayoutOperation *)self task];
  v52 = [v51 options];
  v53 = [v52 columnLayout];
  [v50 layoutBlueprint:v5 columnLayout:v53 description:v49 shouldContinue:v55];

LABEL_23:
  return v5;
}

- (BOOL)layoutBlueprint:(id)a3 containsComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [v7 componentAtIndex:v8];
      v10 = [v9 identifier];
      v11 = [v6 componentBlueprintForComponentIdentifier:v10];

      if (!v11) {
        break;
      }
      id v12 = v11;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 layoutBlueprint];

        if (v13)
        {
          id v14 = [v9 identifier];
          BOOL v15 = [v7 componentsForContainerComponentWithIdentifier:v14];

          id v16 = [v12 layoutBlueprint];
          BOOL v17 = [(SXLayoutOperation *)self layoutBlueprint:v16 containsComponents:v15];

          if (!v17)
          {
            v19 = [v12 component];
            id v20 = [v19 identifier];
            [v6 invalidateSizeForComponentWithIdentifier:v20];

            break;
          }
        }
      }

      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_9;
      }
    }

    BOOL v18 = 0;
  }
  else
  {
LABEL_9:
    BOOL v18 = 1;
  }

  return v18;
}

- (void)updateLayoutBlueprint:(id)a3 components:(id)a4 requiresInvalidation:(BOOL *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v9 = [v7 componentIdentifiers];
  v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v16 = [v8 componentForIdentifier:v15];

        if (!v16)
        {
          BOOL v17 = [v7 componentBlueprintForComponentIdentifier:v15];
          [v7 unregisterLayout:v17];
          if (a5) {
            *a5 = 1;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    uint64_t v18 = 0;
    while (1)
    {
      v19 = [v8 componentAtIndex:v18];
      id v20 = [v19 identifier];
      BOOL v21 = [v7 componentBlueprintForComponentIdentifier:v20];

      if (!v21)
      {
        [(SXLayoutOperation *)self registerComponent:v19 layoutBlueprint:v7 componentIndex:v18];
        int v22 = [v7 componentIdentifiers];
        unint64_t v23 = [v22 count] - 1;

        if (v18 + 1 < v23)
        {
          __int16 v24 = [v7 componentIdentifiers];
          v25 = [v24 objectAtIndex:v18 + 1];

          uint64_t v26 = [v7 componentBlueprintForComponentIdentifier:v25];
          [v7 invalidatePositionForComponentWithIdentifier:v25];
        }
        if (a5) {
          *a5 = 1;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      id v27 = v21;
      v28 = [v19 identifier];
      v29 = [v8 componentsForContainerComponentWithIdentifier:v28];

      v30 = [v27 layoutBlueprint];
      if (!v30) {
        break;
      }
      char v35 = 0;
      [(SXLayoutOperation *)self updateLayoutBlueprint:v30 components:v29 requiresInvalidation:&v35];
      if (v35)
      {
        v31 = [v27 component];
        [v31 identifier];
        v32 = v33 = v29;
        [v7 invalidateSizeForComponentWithIdentifier:v32];

        v29 = v33;
LABEL_25:
      }
LABEL_27:

      if (++v18 >= (unint64_t)[v8 count]) {
        goto LABEL_28;
      }
    }
    v31 = [(SXLayoutOperation *)self createLayoutBlueprintForComponents:v29];
    [v27 setLayoutBlueprint:v31];
    [v31 setParentLayoutBlueprint:v7];
    if (a5) {
      *a5 = 1;
    }
    goto LABEL_25;
  }
LABEL_28:
}

- (id)createLayoutBlueprintForComponents:(id)a3
{
  id v4 = a3;
  v5 = [(SXLayoutOperation *)self layoutBlueprintFactory];
  id v6 = [(SXLayoutOperation *)self task];
  id v7 = [v6 options];
  id v8 = [v5 createLayoutBlueprintWithLayoutOptions:v7];

  if ([v4 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v4 componentAtIndex:v9];
      [(SXLayoutOperation *)self registerComponent:v10 layoutBlueprint:v8 componentIndex:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        uint64_t v12 = [v11 identifier];
        uint64_t v13 = [v8 componentBlueprintForComponentIdentifier:v12];

        id v14 = [v11 identifier];

        uint64_t v15 = [v4 componentsForContainerComponentWithIdentifier:v14];

        id v16 = [(SXLayoutOperation *)self createLayoutBlueprintForComponents:v15];
        [v13 setLayoutBlueprint:v16];
        [v16 setParentLayoutBlueprint:v8];
      }
      ++v9;
    }
    while (v9 < [v4 count]);
  }

  return v8;
}

- (void)registerComponent:(id)a3 layoutBlueprint:(id)a4 componentIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(SXLayoutOperation *)self DOMObjectProvider];
  id v11 = [v9 layout];
  id v16 = [v10 componentLayoutForIdentifier:v11];

  uint64_t v12 = [(SXLayoutOperation *)self componentSizerEngine];
  uint64_t v13 = [v8 layoutOptions];
  id v14 = [(SXLayoutOperation *)self DOMObjectProvider];
  uint64_t v15 = [v12 sizerForComponent:v9 componentLayout:v16 layoutOptions:v13 DOMObjectProvider:v14];

  [v8 registerLayout:v16 sizer:v15 forComponent:v9 atIndex:a5];
}

- (void)layouter:(id)a3 didFinishLayoutForComponentBlueprint:(id)a4 layoutBlueprint:(id)a5 shouldContinueLayout:(BOOL *)a6
{
  task = self->_task;
  id v10 = a5;
  id v11 = a4;
  id v14 = [(SXLayoutTask *)task instructions];
  [v14 didLayoutComponentBlueprint:v11 blueprint:v10];

  uint64_t v12 = [v10 rootLayoutBlueprint];

  LOBYTE(task) = [v14 areFulfilledForBlueprint:v12];
  if (task) {
    char v13 = 0;
  }
  else {
    char v13 = [(SXLayoutOperation *)self isCancelled] ^ 1;
  }
  *a6 = v13;
}

- (BOOL)executing
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (id)beforeBlock
{
  return self->_beforeBlock;
}

- (void)beforeLayout:(id)a3
{
}

- (id)afterBlock
{
  return self->_afterBlock;
}

- (void)afterLayout:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (SXComponentSizerEngine)componentSizerEngine
{
  return self->_componentSizerEngine;
}

- (SXLayoutBlueprintFactory)layoutBlueprintFactory
{
  return self->_layoutBlueprintFactory;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXColumnLayouter)layouter
{
  return self->_layouter;
}

- (SXLayoutTask)task
{
  return self->_task;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_layouter, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_componentSizerEngine, 0);
  objc_storeStrong(&self->_afterBlock, 0);
  objc_storeStrong(&self->_beforeBlock, 0);
  objc_storeStrong((id *)&self->_layoutBlueprint, 0);
}

@end