@interface _SBSUICFUserNotificationContentExtensionContext
- (_SBSUICFUserNotificationContentExtensionHostInterface)hostService;
- (void)setHostService:(id)a3;
@end

@implementation _SBSUICFUserNotificationContentExtensionContext

- (_SBSUICFUserNotificationContentExtensionHostInterface)hostService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostService);
  return (_SBSUICFUserNotificationContentExtensionHostInterface *)WeakRetained;
}

- (void)setHostService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end