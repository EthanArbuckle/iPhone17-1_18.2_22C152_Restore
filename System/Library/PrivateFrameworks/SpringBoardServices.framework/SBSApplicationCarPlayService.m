@interface SBSApplicationCarPlayService
- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 inVehicle:(id)a4 withCompletion:(id)a5;
- (void)fetchIconStateForVehicleId:(id)a3 withCompletion:(id)a4;
@end

@implementation SBSApplicationCarPlayService

- (void)fetchIconStateForVehicleId:(id)a3 withCompletion:(id)a4
{
  id v4 = a4;
  if (v4)
  {
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SBSApplicationCarPlayService_fetchIconStateForVehicleId_withCompletion___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __74__SBSApplicationCarPlayService_fetchIconStateForVehicleId_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 inVehicle:(id)a4 withCompletion:(id)a5
{
  id v5 = a5;
  if (v5)
  {
    v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SBSApplicationCarPlayService_fetchApplicationIconInformationForBundleIdentifier_inVehicle_withCompletion___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __108__SBSApplicationCarPlayService_fetchApplicationIconInformationForBundleIdentifier_inVehicle_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end