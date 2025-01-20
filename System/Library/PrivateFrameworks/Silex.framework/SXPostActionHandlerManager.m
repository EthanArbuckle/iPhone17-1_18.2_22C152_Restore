@interface SXPostActionHandlerManager
- (NSMutableDictionary)postActionHandlers;
- (SXPostActionHandlerManager)init;
- (void)addPostActionHandler:(id)a3 forActionType:(id)a4;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
- (void)removePostActionHandler:(id)a3 forActionType:(id)a4;
@end

@implementation SXPostActionHandlerManager

- (SXPostActionHandlerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXPostActionHandlerManager;
  v2 = [(SXPostActionHandlerManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    postActionHandlers = v2->_postActionHandlers;
    v2->_postActionHandlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addPostActionHandler:(id)a3 forActionType:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(SXPostActionHandlerManager *)self postActionHandlers];
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v9 = [(SXPostActionHandlerManager *)self postActionHandlers];
    v10 = [MEMORY[0x263EFF9C0] set];
    [v9 setObject:v10 forKey:v6];

    v11 = [(SXPostActionHandlerManager *)self postActionHandlers];
    v8 = [v11 objectForKey:v6];
  }
  [v8 addObject:v12];
}

- (void)removePostActionHandler:(id)a3 forActionType:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  v7 = [(SXPostActionHandlerManager *)self postActionHandlers];
  v8 = [v7 objectForKey:v10];

  [v8 removeObject:v6];
  if (![v8 count])
  {
    v9 = [(SXPostActionHandlerManager *)self postActionHandlers];
    [v9 removeObjectForKey:v10];
  }
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(SXPostActionHandlerManager *)self postActionHandlers];
  v8 = [v6 type];
  v9 = [v7 objectForKey:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SXPostActionHandlerManager_handledAction_state___block_invoke;
  v11[3] = &unk_2646542F8;
  id v12 = v6;
  unint64_t v13 = a4;
  id v10 = v6;
  [v9 enumerateObjectsUsingBlock:v11];
}

uint64_t __50__SXPostActionHandlerManager_handledAction_state___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handledAction:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)postActionHandlers
{
  return self->_postActionHandlers;
}

- (void).cxx_destruct
{
}

@end