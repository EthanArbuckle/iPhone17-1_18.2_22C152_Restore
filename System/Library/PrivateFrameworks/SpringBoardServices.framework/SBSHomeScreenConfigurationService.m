@interface SBSHomeScreenConfigurationService
+ (void)beginConfigurationSessionWithInvalidationHandler:(id)a3 completion:(id)a4;
@end

@implementation SBSHomeScreenConfigurationService

+ (void)beginConfigurationSessionWithInvalidationHandler:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[SBSHomeScreenConfigurationServiceProxy initWithInvalidationHandler:]((id *)[SBSHomeScreenConfigurationServiceProxy alloc], v6);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__SBSHomeScreenConfigurationService_beginConfigurationSessionWithInvalidationHandler_completion___block_invoke;
  v10[3] = &unk_1E566B930;
  v11 = v7;
  id v12 = v5;
  id v8 = v5;
  v9 = v7;
  [v9 beginConfigurationSessionWithCompletion:v10];
}

uint64_t __97__SBSHomeScreenConfigurationService_beginConfigurationSessionWithInvalidationHandler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end