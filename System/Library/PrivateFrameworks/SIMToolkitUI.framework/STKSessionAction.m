@interface STKSessionAction
+ (id)_sessionActionFromBSAction:(id)a3;
- (BSAction)_BSAction;
- (BSXPCCoding)sessionData;
- (STKSessionAction)initWithBehavior:(id)a3 data:(id)a4 responseBlock:(id)a5;
- (STKSessionBehavior)behavior;
- (id)_init;
- (id)_initWithBSAction:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sendResponse:(int64_t)a3;
- (void)sendResponse:(int64_t)a3 withContext:(id)a4;
@end

@implementation STKSessionAction

+ (id)_sessionActionFromBSAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 info];
  v5 = [v4 objectForSetting:1];

  v6 = NSClassFromString(v5);
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()]) {
    v7 = (void *)[[v6 alloc] _initWithBSAction:v3];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)STKSessionAction;
  return [(STKSessionAction *)&v3 init];
}

- (id)_initWithBSAction:(id)a3
{
  id v5 = a3;
  v6 = [(STKSessionAction *)self _init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 3, a3);
  }

  return v7;
}

- (STKSessionAction)initWithBehavior:(id)a3 data:(id)a4 responseBlock:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"STKSessionAction.m", 60, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"STKSessionAction.m", 59, @"Invalid parameter not satisfying: %@", @"behavior" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"STKSessionAction.m", 61, @"Invalid parameter not satisfying: %@", @"responseBlock" object file lineNumber description];

LABEL_4:
  v14 = __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke((uint64_t)v12, v10);
  v15 = __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke((uint64_t)v14, v11);
  id v16 = objc_alloc_init(MEMORY[0x263F29C78]);
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [v16 setObject:v18 forSetting:1];

  [v16 setObject:v14 forSetting:2];
  [v16 setObject:v15 forSetting:3];
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  [v16 setObject:v20 forSetting:4];

  v21 = [(STKSessionAction *)self _init];
  v22 = (STKSessionAction *)v21;
  if (v21)
  {
    objc_storeStrong(v21 + 1, a3);
    objc_storeStrong((id *)&v22->_data, a4);
    id v23 = objc_alloc(MEMORY[0x263F29BB0]);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke_2;
    v30[3] = &unk_2645F49D8;
    id v31 = v13;
    uint64_t v24 = [v23 initWithInfo:v16 timeout:0 forResponseOnQueue:v30 withHandler:0.0];
    action = v22->_action;
    v22->_action = (BSAction *)v24;
  }
  return v22;
}

id __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [v2 encodeWithXPCDictionary:v3];

  return v3;
}

void __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  xpc_object_t v3 = [v8 error];

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = [v8 info];
    id v5 = [v4 objectForSetting:1];

    if (v5) {
      [v5 unsignedIntegerValue];
    }
    v6 = [v8 info];
    v7 = [v6 objectForSetting:2];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"STKSessionAction.m" lineNumber:101 description:@"Must be invalidated before it can be deallocated."];
  }
  v5.receiver = self;
  v5.super_class = (Class)STKSessionAction;
  [(STKSessionAction *)&v5 dealloc];
}

- (STKSessionBehavior)behavior
{
  behavior = self->_behavior;
  if (!behavior)
  {
    v4 = [(BSAction *)self->_action info];
    objc_super v5 = [v4 objectForSetting:2];

    if ([v5 conformsToProtocol:&unk_26D46CCF8])
    {
      v6 = [[STKSessionBehavior alloc] initWithXPCDictionary:v5];
      v7 = self->_behavior;
      self->_behavior = v6;
    }
    behavior = self->_behavior;
  }

  return behavior;
}

- (BSXPCCoding)sessionData
{
  data = self->_data;
  if (!data)
  {
    v4 = [(BSAction *)self->_action info];
    objc_super v5 = [v4 objectForSetting:3];

    if ([v5 conformsToProtocol:&unk_26D46CCF8])
    {
      v6 = [(BSAction *)self->_action info];
      v7 = [v6 objectForSetting:4];

      id v8 = NSClassFromString(v7);
      if (v8)
      {
        v9 = (BSXPCCoding *)[[v8 alloc] initWithXPCDictionary:v5];
        id v10 = self->_data;
        self->_data = v9;
      }
    }

    data = self->_data;
  }

  return data;
}

- (void)sendResponse:(int64_t)a3
{
}

- (void)sendResponse:(int64_t)a3 withContext:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F29C78];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forSetting:1];

  [v8 setObject:v7 forSetting:2];
  id v10 = self->_action;
  action = self->_action;
  self->_action = 0;

  id v12 = [MEMORY[0x263F29BC0] responseWithInfo:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__STKSessionAction_sendResponse_withContext___block_invoke;
  v14[3] = &unk_2645F4A00;
  v15 = v10;
  v13 = v10;
  [(BSAction *)v13 sendResponse:v12 withCompletion:v14];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(BSAction *)self->_action invalidate];
    action = self->_action;
    self->_action = 0;
  }
}

- (BSAction)_BSAction
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end