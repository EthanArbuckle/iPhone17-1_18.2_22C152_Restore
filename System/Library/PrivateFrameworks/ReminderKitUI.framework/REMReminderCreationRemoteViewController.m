@interface REMReminderCreationRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (REMReminderCreationPublicViewController)publicViewController;
- (void)setPublicViewController:(id)a3;
- (void)viewHostDidDismiss;
- (void)viewServiceDidCancel;
- (void)viewServiceDidFailWithError:(id)a3;
- (void)viewServiceDidFinish;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewServicePreferredSizeDidChange:(CGSize)a3;
@end

@implementation REMReminderCreationRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMReminderCreationRemoteViewController;
  id v4 = a3;
  [(_UIRemoteViewController *)&v5 viewServiceDidTerminateWithError:v4];
  -[REMReminderCreationRemoteViewController viewServiceDidFailWithError:](self, "viewServiceDidFailWithError:", v4, v5.receiver, v5.super_class);
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C96DE60];
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "rem_reminderCreationRemoteViewControllerExportedInterface");
}

- (void)viewServicePreferredSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(REMReminderCreationRemoteViewController *)self publicViewController];
  objc_msgSend(v5, "viewServicePreferredSizeDidChange:", width, height);
}

- (void)viewServiceDidCancel
{
  id v2 = [(REMReminderCreationRemoteViewController *)self publicViewController];
  [v2 viewServiceDidCancel];
}

- (void)viewServiceDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderCreationRemoteViewController *)self publicViewController];
  [v5 viewServiceDidFailWithError:v4];
}

- (void)viewServiceDidFinish
{
  id v2 = [(REMReminderCreationRemoteViewController *)self publicViewController];
  [v2 viewServiceDidFinish];
}

- (void)viewHostDidDismiss
{
  v3 = [(REMReminderCreationRemoteViewController *)self viewServiceViewController];
  [v3 viewHostDidDismiss];

  [(REMReminderCreationRemoteViewController *)self setPublicViewController:0];
}

- (REMReminderCreationPublicViewController)publicViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicViewController);

  return (REMReminderCreationPublicViewController *)WeakRetained;
}

- (void)setPublicViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end