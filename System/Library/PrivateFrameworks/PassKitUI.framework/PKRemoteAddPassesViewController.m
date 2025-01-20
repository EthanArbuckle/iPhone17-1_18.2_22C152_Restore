@interface PKRemoteAddPassesViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
- (PKAddPassesViewControllerDelegate)delegate;
- (void)dealloc;
- (void)ingestionDidFinishWithResult:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteAddPassesViewController

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKRemoteAddPassesViewController;
  [(_UIRemoteViewController *)&v2 dealloc];
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF317180];
}

- (void)ingestionDidFinishWithResult:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PKRemoteAddPassesViewController_ingestionDidFinishWithResult___block_invoke;
  v3[3] = &unk_1E59CB460;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __64__PKRemoteAddPassesViewController_ingestionDidFinishWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  [v2 _ingestionDidFinishWithResult:*(void *)(a1 + 40)];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
}

- (PKAddPassesViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddPassesViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end