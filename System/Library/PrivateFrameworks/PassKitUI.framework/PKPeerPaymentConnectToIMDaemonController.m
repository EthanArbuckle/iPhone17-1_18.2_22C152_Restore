@interface PKPeerPaymentConnectToIMDaemonController
@end

@implementation PKPeerPaymentConnectToIMDaemonController

void ___PKPeerPaymentConnectToIMDaemonController_block_invoke()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Connecting to IMDaemonController", buf, 2u);
  }

  v1 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v1 addListenerID:@"PKPeerPaymentUIUtilities" capabilities:(*MEMORY[0x1E4F6C530] | *MEMORY[0x1E4F6C508]) | *MEMORY[0x1E4F6C518]];

  v2 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v2 blockUntilConnected];

  v3 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v3 _setBlocksConnectionAtResume:1];

  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Connected to IMDaemonController", v4, 2u);
  }
}

@end