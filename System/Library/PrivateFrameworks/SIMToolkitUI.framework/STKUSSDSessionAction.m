@interface STKUSSDSessionAction
- (STKUSSDSessionAction)initWithInputData:(id)a3 response:(id)a4;
- (STKUSSDSessionData)sessionData;
- (void)sendSuccessWithResponse:(id)a3;
@end

@implementation STKUSSDSessionAction

- (STKUSSDSessionAction)initWithInputData:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__STKUSSDSessionAction_initWithInputData_response___block_invoke;
  v13[3] = &unk_2645F4398;
  id v14 = v6;
  v12.receiver = self;
  v12.super_class = (Class)STKUSSDSessionAction;
  id v9 = v6;
  v10 = [(STKSessionAction *)&v12 initWithBehavior:v8 data:v7 responseBlock:v13];

  return v10;
}

void __51__STKUSSDSessionAction_initWithInputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v6;
  }
  else {
    id v5 = 0;
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v5);
}

- (STKUSSDSessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKUSSDSessionAction;
  v2 = [(STKSessionAction *)&v4 sessionData];

  return (STKUSSDSessionData *)v2;
}

- (void)sendSuccessWithResponse:(id)a3
{
}

@end