@interface ICQLiftUIPresenter
- (ACAccount)account;
- (BOOL)embedInViewController:(id)a3;
- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)pushInNavigationController:(id)a3 animated:(BOOL)a4;
- (ICQLiftUIController)controller;
- (ICQLiftUIPresenter)initWithContent:(id)a3 account:(id)a4 data:(id)a5;
- (ICQLiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5;
- (ICQLiftUIPresenter)initWithURL:(id)a3 content:(id)a4 account:(id)a5 data:(id)a6;
- (ICQLiftUIPresenterDelegate)delegate;
- (NSData)content;
- (NSDictionary)data;
- (NSURL)liftUIPageURL;
- (void)didCancel;
- (void)didCancelWithUserInfo:(id)a3;
- (void)didFinish;
- (void)didFinishWithUserInfo:(id)a3;
- (void)didLoadWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performICQActionWithName:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)reloadWithHeaders:(id)a3;
- (void)setAccount:(id)a3;
- (void)setContent:(id)a3;
- (void)setController:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLiftUIPageURL:(id)a3;
- (void)updateStoreDataForKey:(id)a3 value:(id)a4;
@end

@implementation ICQLiftUIPresenter

- (ICQLiftUIPresenter)initWithURL:(id)a3 content:(id)a4 account:(id)a5 data:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICQLiftUIPresenter;
  v15 = [(ICQLiftUIPresenter *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_liftUIPageURL, a3);
    objc_storeStrong((id *)&v16->_content, a4);
    objc_storeStrong((id *)&v16->_data, a6);
    if (!v13)
    {
      v17 = [MEMORY[0x263EFB210] defaultStore];
      objc_msgSend(v17, "aa_primaryAppleAccount");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_account, v13);
    v18 = objc_alloc_init(ICQLiftUIController);
    controller = v16->_controller;
    v16->_controller = v18;
  }
  return v16;
}

- (ICQLiftUIPresenter)initWithContent:(id)a3 account:(id)a4 data:(id)a5
{
  return [(ICQLiftUIPresenter *)self initWithURL:0 content:a3 account:a4 data:a5];
}

- (ICQLiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5
{
  return [(ICQLiftUIPresenter *)self initWithURL:a3 content:0 account:a4 data:a5];
}

- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(ICQLiftUIPresenter *)self liftUIPageURL];
  if (v7)
  {

LABEL_4:
    v9 = [(ICQLiftUIPresenter *)self content];

    v10 = _ICQGetLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v23 = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page with preloaded data in viewcontroller %@", (uint8_t *)&v23, 0xCu);
      }

      id v12 = (void *)MEMORY[0x263F82E10];
      id v13 = [(ICQLiftUIPresenter *)self controller];
      id v14 = [(ICQLiftUIPresenter *)self content];
      v15 = [(ICQLiftUIPresenter *)self account];
      v16 = [(ICQLiftUIPresenter *)self data];
      uint64_t v17 = [v12 makeLiftUIViewControllerForController:v13 withContent:v14 account:v15 presenter:self data:v16];
    }
    else
    {
      if (v11)
      {
        v18 = [(ICQLiftUIPresenter *)self liftUIPageURL];
        int v23 = 138412546;
        id v24 = v18;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page at URL %@ in viewcontroller %@", (uint8_t *)&v23, 0x16u);
      }
      v19 = (void *)MEMORY[0x263F82E10];
      id v13 = [(ICQLiftUIPresenter *)self controller];
      id v14 = [(ICQLiftUIPresenter *)self liftUIPageURL];
      v15 = [(ICQLiftUIPresenter *)self account];
      v16 = [(ICQLiftUIPresenter *)self data];
      uint64_t v17 = [v19 makeLiftUIViewControllerForController:v13 withURL:v14 account:v15 presenter:self data:v16];
    }
    v20 = v17;

    [MEMORY[0x263F82E10] ICQUIUpsellPrefferredPresentationSize];
    -[NSObject setPreferredContentSize:](v20, "setPreferredContentSize:");
    [v6 presentPreferredSizeWithViewController:v20 animated:v4 completion:0];
    BOOL v21 = 1;
    goto LABEL_12;
  }
  v8 = [(ICQLiftUIPresenter *)self content];

  if (v8) {
    goto LABEL_4;
  }
  v20 = _ICQGetLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[ICQLiftUIPresenter presentInViewController:animated:]();
  }
  BOOL v21 = 0;
LABEL_12:

  return v21;
}

- (BOOL)embedInViewController:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ICQLiftUIPresenter *)self liftUIPageURL];
  if (v5)
  {

LABEL_4:
    v7 = [(ICQLiftUIPresenter *)self content];

    v8 = _ICQGetLogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v21 = 138412290;
        id v22 = v4;
        _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Embedding LiftUI page with preloaded data in viewcontroller %@", (uint8_t *)&v21, 0xCu);
      }

      v10 = (void *)MEMORY[0x263F82E10];
      BOOL v11 = [(ICQLiftUIPresenter *)self controller];
      id v12 = [(ICQLiftUIPresenter *)self content];
      id v13 = [(ICQLiftUIPresenter *)self account];
      id v14 = [(ICQLiftUIPresenter *)self data];
      uint64_t v15 = [v10 makeLiftUIViewControllerForController:v11 withContent:v12 account:v13 presenter:self data:v14];
    }
    else
    {
      if (v9)
      {
        v16 = [(ICQLiftUIPresenter *)self liftUIPageURL];
        int v21 = 138412546;
        id v22 = v16;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Embedding LiftUI page at URL %@ in viewcontroller %@", (uint8_t *)&v21, 0x16u);
      }
      uint64_t v17 = (void *)MEMORY[0x263F82E10];
      BOOL v11 = [(ICQLiftUIPresenter *)self controller];
      id v12 = [(ICQLiftUIPresenter *)self liftUIPageURL];
      id v13 = [(ICQLiftUIPresenter *)self account];
      id v14 = [(ICQLiftUIPresenter *)self data];
      uint64_t v15 = [v17 makeLiftUIViewControllerForController:v11 withURL:v12 account:v13 presenter:self data:v14];
    }
    v18 = v15;

    [v4 addChildAndPinToEdgesWithChildViewController:v18];
    BOOL v19 = 1;
    goto LABEL_12;
  }
  id v6 = [(ICQLiftUIPresenter *)self content];

  if (v6) {
    goto LABEL_4;
  }
  v18 = _ICQGetLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[ICQLiftUIPresenter presentInViewController:animated:]();
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)pushInNavigationController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(ICQLiftUIPresenter *)self liftUIPageURL];
  if (v7)
  {

LABEL_4:
    BOOL v9 = [(ICQLiftUIPresenter *)self content];

    v10 = _ICQGetLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v23 = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page with preloaded data in navigationController %@", (uint8_t *)&v23, 0xCu);
      }

      id v12 = (void *)MEMORY[0x263F82E10];
      id v13 = [(ICQLiftUIPresenter *)self controller];
      id v14 = [(ICQLiftUIPresenter *)self content];
      uint64_t v15 = [(ICQLiftUIPresenter *)self account];
      v16 = [(ICQLiftUIPresenter *)self data];
      uint64_t v17 = [v12 makeLiftUIViewControllerForController:v13 withContent:v14 account:v15 presenter:self data:v16];
    }
    else
    {
      if (v11)
      {
        v18 = [(ICQLiftUIPresenter *)self liftUIPageURL];
        int v23 = 138412546;
        id v24 = v18;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page at URL %@ in navigationController %@", (uint8_t *)&v23, 0x16u);
      }
      BOOL v19 = (void *)MEMORY[0x263F82E10];
      id v13 = [(ICQLiftUIPresenter *)self controller];
      id v14 = [(ICQLiftUIPresenter *)self liftUIPageURL];
      uint64_t v15 = [(ICQLiftUIPresenter *)self account];
      v16 = [(ICQLiftUIPresenter *)self data];
      uint64_t v17 = [v19 makeLiftUIViewControllerForController:v13 withURL:v14 account:v15 presenter:self data:v16];
    }
    v20 = v17;

    [v6 pushViewController:v20 animated:v4];
    BOOL v21 = 1;
    goto LABEL_12;
  }
  v8 = [(ICQLiftUIPresenter *)self content];

  if (v8) {
    goto LABEL_4;
  }
  v20 = _ICQGetLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[ICQLiftUIPresenter presentInViewController:animated:]();
  }
  BOOL v21 = 0;
LABEL_12:

  return v21;
}

- (void)updateStoreDataForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICQLiftUIPresenter *)self controller];
  [v8 updateStoreDataForKey:v7 value:v6];
}

- (void)reloadWithHeaders:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[ICQLiftUIPresenter reloadWithHeaders:]();
  }
}

- (void)didLoadWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    BOOL v9 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "LiftUI load completed success: %@ error: %@", buf, 0x16u);
  }
  v10 = [(ICQLiftUIPresenter *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__ICQLiftUIPresenter_didLoadWithSuccess_error___block_invoke;
    block[3] = &unk_264921C30;
    block[4] = self;
    BOOL v14 = v4;
    id v13 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __47__ICQLiftUIPresenter_didLoadWithSuccess_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 liftUIPresenter:*(void *)(a1 + 32) didLoadWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)didFinish
{
}

- (void)didCancel
{
}

- (void)didFinishWithUserInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "LiftUI flow completed with parameters %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ICQLiftUIPresenter_didFinishWithUserInfo___block_invoke;
  v7[3] = &unk_264921B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __44__ICQLiftUIPresenter_didFinishWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v4;
  if (v3) {
    [v4 liftUIPresenterDidComplete:v5 userInfo:*(void *)(a1 + 40)];
  }
  else {
    [v4 liftUIPresenterDidComplete:v5];
  }
}

- (void)didCancelWithUserInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "LiftUI flow has been dismissed with parameters %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ICQLiftUIPresenter_didCancelWithUserInfo___block_invoke;
  v7[3] = &unk_264921B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __44__ICQLiftUIPresenter_didCancelWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v4;
  if (v3) {
    [v4 liftUIPresenterDidCancel:v5 userInfo:*(void *)(a1 + 40)];
  }
  else {
    [v4 liftUIPresenterDidCancel:v5];
  }
}

- (void)performICQActionWithName:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = _ICQActionForServerActionString();
  id v10 = [(ICQLiftUIPresenter *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__ICQLiftUIPresenter_performICQActionWithName_parameters_completion___block_invoke;
    v12[3] = &unk_264922B08;
    v12[4] = self;
    uint64_t v15 = v9;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
  else
  {
    [MEMORY[0x263F88908] performAction:v9 parameters:v7 options:0];
    if (v8) {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
}

void __69__ICQLiftUIPresenter_performICQActionWithName_parameters_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 liftUIPresenter:*(void *)(a1 + 32) performAction:*(void *)(a1 + 56) parameters:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (NSURL)liftUIPageURL
{
  return self->_liftUIPageURL;
}

- (void)setLiftUIPageURL:(id)a3
{
}

- (ICQLiftUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQLiftUIPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (ICQLiftUIController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liftUIPageURL, 0);
}

- (void)presentInViewController:animated:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Unable to create LiftUI VIewController -- URL and content are both nil!", v2, v3, v4, v5, v6);
}

- (void)reloadWithHeaders:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "LiftUI reload is not yet supported", v2, v3, v4, v5, v6);
}

@end