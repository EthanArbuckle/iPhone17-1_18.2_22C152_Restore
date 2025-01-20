@interface PKRemoteAddSecureElementPassViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
- (void)didFinishWithPasses:(id)a3 error:(id)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteAddSecureElementPassViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
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
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "View service terminated with error: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [(PKRemoteAddSecureElementPassViewController *)self didFinishWithPasses:0 error:v6];
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKRemoteAddSecureElementPassViewController *)self parentViewController];
  [v8 didFinishWithPasses:v7 error:v6];
}

@end