@interface _SSUSoundScapesDelegateForwarder
- (NSXPCConnection)connection;
- (SSUSoundscapesPickerControllerDelegate)delegate;
- (_EXHostViewController)viewController;
- (id)initForViewController:(id)a3;
- (void)cleanup;
- (void)mediaPickerConfirmChoices;
- (void)pickerDismissed;
- (void)requestDismiss;
- (void)selectedSoundScapes:(id)a3 withError:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewController:(id)a3;
- (void)updateNavigationItem;
@end

@implementation _SSUSoundScapesDelegateForwarder

- (id)initForViewController:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SSUSoundScapesDelegateForwarder;
  v5 = [(_SSUSoundScapesDelegateForwarder *)&v24 init];
  v6 = v5;
  if (v5)
  {
    [(_SSUSoundScapesDelegateForwarder *)v5 setViewController:v4];
    v7 = +[SSUSoundScapesPickerManager pickerIdentity];
    v8 = (void *)MEMORY[0x263F086E0];
    v9 = [v7 url];
    v10 = [v8 bundleWithURL:v9];

    v11 = [v10 localizedStringForKey:@"AMBIENTSOUNDS" value:0 table:0];
    v12 = [(_SSUSoundScapesDelegateForwarder *)v6 viewController];
    v13 = [v12 navigationItem];
    [v13 setTitle:v11];

    if (!v6->_doneButton)
    {
      v14 = [v10 localizedStringForKey:@"DONE" value:0 table:0];
      uint64_t v15 = [objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v14 style:2 target:v6 action:sel_mediaPickerConfirmChoices];
      doneButton = v6->_doneButton;
      v6->_doneButton = (UIBarButtonItem *)v15;

      v17 = [(_SSUSoundScapesDelegateForwarder *)v6 viewController];
      v18 = [v17 navigationItem];
      [v18 setRightBarButtonItem:v6->_doneButton];

      v19 = [(_SSUSoundScapesDelegateForwarder *)v6 viewController];
      v20 = [v19 navigationItem];
      [v20 setLargeTitleDisplayMode:2];
    }
    v21 = [(_SSUSoundScapesDelegateForwarder *)v6 viewController];
    v22 = [v21 view];
    [v22 setClipsToBounds:1];

    [(_SSUSoundScapesDelegateForwarder *)v6 updateNavigationItem];
    v6->_exiting = 0;
  }
  return v6;
}

- (void)updateNavigationItem
{
  [(UIBarButtonItem *)self->_doneButton setEnabled:self->_lastPickedArchive != 0];
}

- (void)mediaPickerConfirmChoices
{
  self->_exiting = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___SSUSoundScapesDelegateForwarder_mediaPickerConfirmChoices__block_invoke;
  block[3] = &unk_26551E060;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)selectedSoundScapes:(id)a3 withError:(id)a4
{
  v6 = (MPPlaybackArchive *)a3;
  v7 = (NSError *)a4;
  lastPickedArchive = self->_lastPickedArchive;
  self->_lastPickedArchive = v6;
  v9 = v6;

  lastPickedError = self->_lastPickedError;
  self->_lastPickedError = v7;
  v11 = v7;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___SSUSoundScapesDelegateForwarder_selectedSoundScapes_withError___block_invoke;
  block[3] = &unk_26551E060;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)requestDismiss
{
  self->_exiting = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50___SSUSoundScapesDelegateForwarder_requestDismiss__block_invoke;
  block[3] = &unk_26551E060;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)pickerDismissed
{
  if (!self->_exiting)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    id v4 = [WeakRetained placeholderView];
    id v7 = [v4 viewWithTag:10001];

    [v7 setHidden:0];
    v5 = [(_SSUSoundScapesDelegateForwarder *)self viewController];
    v6 = [v5 navigationItem];
    [v6 setRightBarButtonItem:0];
  }
}

- (void)cleanup
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___SSUSoundScapesDelegateForwarder_cleanup__block_invoke;
  block[3] = &unk_26551E060;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

- (SSUSoundscapesPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSUSoundscapesPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_EXHostViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (_EXHostViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_lastPickedError, 0);

  objc_storeStrong((id *)&self->_lastPickedArchive, 0);
}

@end