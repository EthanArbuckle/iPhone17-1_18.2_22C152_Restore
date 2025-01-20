@interface WFShortcutServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (INUIVoiceShortcutRemoteServingInterface)delegate;
- (void)buildForAddingShortcut:(id)a3;
- (void)buildForEditingVoiceShortcut:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WFShortcutServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface];
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (INUIVoiceShortcutRemoteServingInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (INUIVoiceShortcutRemoteServingInterface *)WeakRetained;
}

- (void)buildForEditingVoiceShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(WFShortcutServiceContext *)self delegate];
  [v5 buildForEditingVoiceShortcut:v4];
}

- (void)buildForAddingShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(WFShortcutServiceContext *)self delegate];
  [v5 buildForAddingShortcut:v4];
}

@end