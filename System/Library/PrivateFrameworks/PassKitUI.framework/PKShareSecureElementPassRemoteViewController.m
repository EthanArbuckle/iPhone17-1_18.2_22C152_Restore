@interface PKShareSecureElementPassRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5;
- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4;
@end

@implementation PKShareSecureElementPassRemoteViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF32DAA8];
}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKShareSecureElementPassRemoteViewController *)self parentViewController];
  [v11 didCreateShareURL:v10 activationCode:v9 error:v8];
}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PKShareSecureElementPassRemoteViewController *)self parentViewController];
  [v7 didFinishShareWithDidUserShare:v4 error:v6];
}

@end