@interface WFRemotePINEntryViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)isNumericPIN;
- (BOOL)requiresKeyboard;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)simplePIN;
- (WFPINEntryViewControllerProtocol)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)getIsPINPresentWithCompletion:(id)a3;
- (void)permitURLWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)userDidCancel;
- (void)userEnteredCorrectPIN;
- (void)viewDidLoad;
@end

@implementation WFRemotePINEntryViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WFRemotePINEntryViewController;
  [(WFRemotePINEntryViewController *)&v4 viewDidLoad];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = 17;
  }
  [(WFRemotePINEntryViewController *)self setModalPresentationStyle:v3];
}

- (void)dealloc
{
  [(WFRemotePINEntryViewController *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WFRemotePINEntryViewController;
  [(_UIRemoteViewController *)&v3 dealloc];
}

- (void)setURL:(id)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 setURL:a3];
}

- (void)setPageTitle:(id)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 setPageTitle:a3];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7C5040];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7B92F0];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)userEnteredCorrectPIN
{
}

- (void)userDidCancel
{
}

- (void)getIsPINPresentWithCompletion:(id)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 getIsPINPresentWithCompletion:a3];
}

- (void)permitURLWithCompletion:(id)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 permitURLWithCompletion:a3];
}

- (BOOL)requiresKeyboard
{
  return 0;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 2;
}

- (WFPINEntryViewControllerProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (WFPINEntryViewControllerProtocol *)a3;
}

@end