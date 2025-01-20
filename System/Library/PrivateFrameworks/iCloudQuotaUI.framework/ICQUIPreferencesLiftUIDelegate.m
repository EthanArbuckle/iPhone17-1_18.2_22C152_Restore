@interface ICQUIPreferencesLiftUIDelegate
- (ACAccount)account;
- (ICQLiftUIPresenter)presenter;
- (ICQUIPreferencesLiftUIDelegate)initWithNavigationController:(id)a3 account:(id)a4;
- (PreferencesRemoteUIDelegateProtocol)delegate;
- (UINavigationController)navigation;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)loadURL:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigation:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation ICQUIPreferencesLiftUIDelegate

- (ICQUIPreferencesLiftUIDelegate)initWithNavigationController:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIPreferencesLiftUIDelegate;
  v9 = [(ICQUIPreferencesLiftUIDelegate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigation, a3);
    objc_storeStrong((id *)&v10->_account, a4);
  }

  return v10;
}

- (void)loadURL:(id)a3
{
  id v4 = a3;
  v5 = [ICQLiftUIPresenter alloc];
  v6 = [(ICQUIPreferencesLiftUIDelegate *)self account];
  id v7 = [(ICQLiftUIPresenter *)v5 initWithURL:v4 account:v6 data:0];

  [(ICQUIPreferencesLiftUIDelegate *)self setPresenter:v7];
  id v8 = [(ICQUIPreferencesLiftUIDelegate *)self presenter];
  [v8 setDelegate:self];

  id v10 = [(ICQUIPreferencesLiftUIDelegate *)self presenter];
  v9 = [(ICQUIPreferencesLiftUIDelegate *)self navigation];
  [v10 pushInNavigationController:v9 animated:1];
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v4 = [(ICQUIPreferencesLiftUIDelegate *)self navigation];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v4 = [(ICQUIPreferencesLiftUIDelegate *)self navigation];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  id v6 = [(ICQUIPreferencesLiftUIDelegate *)self delegate];
  [v6 reloadTopControllerWithAdditionalHeaders:0];
}

- (PreferencesRemoteUIDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PreferencesRemoteUIDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)navigation
{
  return self->_navigation;
}

- (void)setNavigation:(id)a3
{
}

- (ICQLiftUIPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end