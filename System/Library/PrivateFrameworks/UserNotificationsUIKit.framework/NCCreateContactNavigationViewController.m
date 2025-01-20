@interface NCCreateContactNavigationViewController
+ (id)navigationControllerWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6;
- (id)_initWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6;
- (void)_cancelAddToContacts:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
@end

@implementation NCCreateContactNavigationViewController

+ (id)navigationControllerWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[NCCreateContactNavigationViewController alloc] _initWithContact:v12 bundleIdentifier:v11 imageData:v10 presenterDelegate:v9];

  return v13;
}

- (id)_initWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1E4FB3820];
  id v15 = a5;
  v16 = [v14 sharedInstance];
  v17 = (void *)[v16 newCuratedContactForContact:v11 imageData:v15 bundleIdentifier:v12];

  v18 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v17];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  [v18 setContactStore:v19];

  [v18 setDelegate:self];
  [v18 setActions:32];
  v20 = [v18 navigationItem];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelAddToContacts_];
  [v20 setRightBarButtonItem:v21];

  v25.receiver = self;
  v25.super_class = (Class)NCCreateContactNavigationViewController;
  v22 = [(NCCreateContactNavigationViewController *)&v25 initWithRootViewController:v18];
  p_isa = (id *)&v22->super.super.super.super.super.isa;
  if (v22)
  {
    [(NCModalNavigationController *)v22 setPresenterDelegate:v13];
    objc_storeStrong(p_isa + 178, a3);
    objc_storeStrong(p_isa + 179, a4);
  }

  return p_isa;
}

- (void)_cancelAddToContacts:(id)a3
{
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  objc_msgSend(a4, "identifier", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v8 length])
  {
    v6 = [MEMORY[0x1E4FB3820] sharedInstance];
    [v6 didAddToCuratedContactsForContact:self->_contact bundleIdentifier:self->_bundleIdentifier cnContactIdentifier:v8];
  }
  if (a4)
  {
    v7 = [(NCModalNavigationController *)self presenterDelegate];
    if (objc_opt_respondsToSelector()) {
      [v7 createContactNavigationControllerDidComplete:self];
    }
  }
  [(NCCreateContactNavigationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end