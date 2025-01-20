@interface PKRemotePerformActionSetupViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (void)didCancelAction;
- (void)didPerformAction;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemotePerformActionSetupViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF32CCC0];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3259E0];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPerformActionSetupViewController view service terminated with error: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PKRemotePerformActionSetupViewController *)self didCancelAction];
}

- (void)didCancelAction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKRemotePerformActionSetupViewController_didCancelAction__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PKRemotePerformActionSetupViewController_didCancelAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentViewController];
  [v1 didCancel];
}

- (void)didPerformAction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKRemotePerformActionSetupViewController_didPerformAction__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__PKRemotePerformActionSetupViewController_didPerformAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentViewController];
  [v1 didFinish];
}

@end