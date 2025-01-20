@interface STKListItemsSessionAction
- (STKListItemsSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5;
- (STKListItemsSessionData)sessionData;
- (void)sendSuccessWithSelectedItemIndex:(unint64_t)a3;
@end

@implementation STKListItemsSessionAction

- (STKListItemsSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__STKListItemsSessionAction_initWithBehavior_inputData_response___block_invoke;
  v13[3] = &unk_2645F4398;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)STKListItemsSessionAction;
  id v9 = v8;
  v10 = [(STKSessionAction *)&v12 initWithBehavior:a3 data:a4 responseBlock:v13];

  return v10;
}

void __65__STKListItemsSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (STKListItemsSessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKListItemsSessionAction;
  v2 = [(STKTextSessionAction *)&v4 sessionData];

  return (STKListItemsSessionData *)v2;
}

- (void)sendSuccessWithSelectedItemIndex:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(STKSessionAction *)self sendResponse:0 withContext:v4];
}

@end