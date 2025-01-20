@interface _UIStickerPickerServiceRemoteViewController
+ (id)exportedInterface;
+ (id)requestCardViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (_UIStickerPickerRemoteViewControllerDelegate)delegate;
- (void)dismissCard;
- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stageSticker:(id)a3;
- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7;
- (void)stickerPickerCardDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIStickerPickerServiceRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  return (id)[a1 requestViewController:@"StickersAppCardViewController" fromServiceWithBundleIdentifier:@"com.apple.iMessageAppsViewService" connectionHandler:a3];
}

+ (id)serviceViewControllerInterface
{
  if (qword_1EB2607B0 != -1) {
    dispatch_once(&qword_1EB2607B0, &__block_literal_global_219);
  }
  v2 = (void *)_MergedGlobals_1052;
  return v2;
}

+ (id)exportedInterface
{
  if (qword_1EB2607C0 != -1) {
    dispatch_once(&qword_1EB2607C0, &__block_literal_global_84);
  }
  v2 = (void *)qword_1EB2607B8;
  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
  [v5 viewServiceDidTerminateWithError:v4];
}

- (void)stickerPickerCardDidLoad
{
  id v2 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
  [v2 stickerPickerCardDidLoad];
}

- (void)dismissCard
{
  id v2 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
  [v2 dismissCard];
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
  [v17 stageStickerWithIdentifier:v16 representations:v15 name:v14 externalURI:v13 accessibilityLabel:v12];
}

- (void)stageSticker:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
  [v5 stageSticker:v4];
}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v7 = v4;
    id v5 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];

    if (v5)
    {
      v6 = [(_UIStickerPickerServiceRemoteViewController *)self delegate];
      [v6 remoteHandlesRecentsStickerDonationWithCompletionHandler:v7];
    }
    else
    {
      v7[2](v7, 1);
    }
    id v4 = v7;
  }
}

- (_UIStickerPickerRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIStickerPickerRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end