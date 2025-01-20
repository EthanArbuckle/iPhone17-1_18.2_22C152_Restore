@interface PKExtensionRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (PKExtensionRemoteViewControllerDelegate)delegate;
- (id)exportedInterface;
- (id)serviceViewControllerInterface;
- (void)setDelegate:(id)a3;
@end

@implementation PKExtensionRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF430DF0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3256C0];
}

- (id)serviceViewControllerInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serviceViewControllerInterface];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 exportedInterface];
}

- (PKExtensionRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKExtensionRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end