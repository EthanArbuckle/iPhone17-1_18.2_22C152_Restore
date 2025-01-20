@interface _SBUIPopoverExtensionContext
- (_SBUIPopoverExtensionHostInterface)hostService;
- (void)requestDismiss;
- (void)setHostService:(id)a3;
@end

@implementation _SBUIPopoverExtensionContext

- (void)requestDismiss
{
  id v2 = [(_SBUIPopoverExtensionContext *)self hostService];
  [v2 _extensionRequestsDismiss];
}

- (_SBUIPopoverExtensionHostInterface)hostService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostService);
  return (_SBUIPopoverExtensionHostInterface *)WeakRetained;
}

- (void)setHostService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end