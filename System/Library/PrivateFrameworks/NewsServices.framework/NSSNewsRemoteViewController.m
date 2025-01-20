@interface NSSNewsRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (void)dismissAnimated:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation NSSNewsRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E11F720];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E118FF8];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NSSNewsRemoteViewController *)self navigationController];

  if (v5)
  {
    id v7 = [(NSSNewsRemoteViewController *)self navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:v3];
  }
  else
  {
    id v7 = [(NSSNewsRemoteViewController *)self presentingViewController];
    [v7 dismissViewControllerAnimated:v3 completion:0];
  }
}

@end