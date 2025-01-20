@interface SBSUIRemoteAlertItemContentViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)getPreferredContentSizeWithReplyBlock:(id)a3;
- (void)invalidatePreferredContentSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBSUIRemoteAlertItemContentViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBSUIRemoteAlertItemContentViewController;
  [(SBSUIRemoteAlertItemContentViewController *)&v3 viewDidLoad];
  [(SBSUIRemoteAlertItemContentViewController *)self invalidatePreferredContentSize];
}

- (void)invalidatePreferredContentSize
{
  id v3 = [(SBSUIRemoteAlertItemContentViewController *)self _remoteViewControllerProxy];
  [(SBSUIRemoteAlertItemContentViewController *)self preferredContentSize];
  objc_msgSend(v3, "setPreferredContentSize:");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSUIRemoteAlertItemContentViewController;
  [(SBSUIRemoteAlertItemContentViewController *)&v3 viewDidLayoutSubviews];
  [(SBSUIRemoteAlertItemContentViewController *)self invalidatePreferredContentSize];
}

- (void)getPreferredContentSizeWithReplyBlock:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    [(SBSUIRemoteAlertItemContentViewController *)self preferredContentSize];
    (*((void (**)(id))a3 + 2))(v5);
  }
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD5B140];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD3EED8];
}

@end