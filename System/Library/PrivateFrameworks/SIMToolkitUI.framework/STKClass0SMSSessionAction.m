@interface STKClass0SMSSessionAction
- (STKClass0SMSSessionAction)initWithInputData:(id)a3 response:(id)a4;
- (STKClass0SMSSessionData)sessionData;
@end

@implementation STKClass0SMSSessionAction

- (STKClass0SMSSessionAction)initWithInputData:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__STKClass0SMSSessionAction_initWithInputData_response___block_invoke;
  v13[3] = &unk_2645F4398;
  id v14 = v6;
  v12.receiver = self;
  v12.super_class = (Class)STKClass0SMSSessionAction;
  id v9 = v6;
  v10 = [(STKSessionAction *)&v12 initWithBehavior:v8 data:v7 responseBlock:v13];

  return v10;
}

uint64_t __56__STKClass0SMSSessionAction_initWithInputData_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (STKClass0SMSSessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKClass0SMSSessionAction;
  v2 = [(STKSessionAction *)&v4 sessionData];

  return (STKClass0SMSSessionData *)v2;
}

@end