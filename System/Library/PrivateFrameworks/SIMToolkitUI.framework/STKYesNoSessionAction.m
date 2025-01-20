@interface STKYesNoSessionAction
- (STKYesNoSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5;
- (void)sendSuccessWithSelectedResponse:(BOOL)a3;
@end

@implementation STKYesNoSessionAction

- (STKYesNoSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__STKYesNoSessionAction_initWithBehavior_inputData_response___block_invoke;
  v13[3] = &unk_2645F4398;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)STKYesNoSessionAction;
  id v9 = v8;
  v10 = [(STKSessionAction *)&v12 initWithBehavior:a3 data:a4 responseBlock:v13];

  return v10;
}

void __61__STKYesNoSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)sendSuccessWithSelectedResponse:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(STKSessionAction *)self sendResponse:0 withContext:v4];
}

@end