@interface SBUIPopoverExtensionHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)__shouldRemoteViewControllerFenceOperations;
- (BOOL)_canShowWhileLocked;
- (_SBUIPopoverExtensionHostDelegate)delegate;
- (void)_extensionRequestsDismiss;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SBUIPopoverExtensionHostViewController

- (void)_extensionRequestsDismiss
{
  id v3 = [(SBUIPopoverExtensionHostViewController *)self delegate];
  [v3 popoverHostExtensionRequestsDismiss:self];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD20748];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD19C58];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SBUIPopoverExtensionHostViewController viewServiceDidTerminateWithError:]((uint64_t)v4, v5);
  }

  v6 = [(SBUIPopoverExtensionHostViewController *)self delegate];
  [v6 popoverHostExtensionDidExit:self];
}

- (_SBUIPopoverExtensionHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBUIPopoverExtensionHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "Popover Extension did terminate with error: %@", (uint8_t *)&v2, 0xCu);
}

@end