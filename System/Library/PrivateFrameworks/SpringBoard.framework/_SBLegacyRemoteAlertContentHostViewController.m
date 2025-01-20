@interface _SBLegacyRemoteAlertContentHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (NSString)serviceClassName;
- (id)delegate;
- (id)description;
- (void)_getPreferredContentSizeWithReplyBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceClassName:(id)a3;
@end

@implementation _SBLegacyRemoteAlertContentHostViewController

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
  v6 = [(_SBLegacyRemoteAlertContentHostViewController *)self serviceClassName];
  v7 = [v3 stringWithFormat:@"<%@:%p -> %@:%@>", v4, self, v5, v6];

  return v7;
}

- (void)_getPreferredContentSizeWithReplyBlock:(id)a3
{
  id v4 = a3;
  v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88___SBLegacyRemoteAlertContentHostViewController__getPreferredContentSizeWithReplyBlock___block_invoke;
  v7[3] = &unk_1E6AF9730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getPreferredContentSizeWithReplyBlock:v7];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33C37A8];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35B1620];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serviceClassName
{
  return self->_serviceClassName;
}

- (void)setServiceClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
}

@end