@interface STKTextSessionAction
- (STKTextSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5;
- (STKTextSessionData)sessionData;
@end

@implementation STKTextSessionAction

- (STKTextSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__STKTextSessionAction_initWithBehavior_inputData_response___block_invoke;
  v13[3] = &unk_2645F4398;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)STKTextSessionAction;
  id v9 = v8;
  v10 = [(STKSessionAction *)&v12 initWithBehavior:a3 data:a4 responseBlock:v13];

  return v10;
}

uint64_t __60__STKTextSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (STKTextSessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKTextSessionAction;
  v2 = [(STKSessionAction *)&v4 sessionData];

  return (STKTextSessionData *)v2;
}

@end