@interface PKRemotePaymentSetupViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)serviceViewControllerInterface;
- (void)didFinishWithPasses:(id)a3 error:(id)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemotePaymentSetupViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF2FA030];
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKRemotePaymentSetupViewController_didFinishWithPasses_error___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PKRemotePaymentSetupViewController_didFinishWithPasses_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  [v2 didFinishWithPasses:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupViewController view service did terminated with error: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [(PKRemotePaymentSetupViewController *)self didFinishWithPasses:0 error:v6];
}

@end