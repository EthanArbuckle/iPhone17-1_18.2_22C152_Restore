@interface PUWhatsNewWelcomeViewController
+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5;
+ (void)resetLastPresentationInfo;
- (PUWhatsNewWelcomeViewController)initWithCompletionHandler:(id)a3;
- (id)_completionHandler;
- (void)_handleContinueButton:(id)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation PUWhatsNewWelcomeViewController

- (void).cxx_destruct
{
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_handleContinueButton:(id)a3
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PUWhatsNewWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5F2EA60;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PUWhatsNewWelcomeViewController;
  id v7 = v6;
  [(PUWhatsNewWelcomeViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

void __76__PUWhatsNewWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setInteger:12 forKey:@"LastWhatsNewShown"];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) _completionHandler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) _completionHandler];
    v5[2](v5, 1);

    id v6 = *(void **)(a1 + 32);
    [v6 _setCompletionHandler:0];
  }
}

- (PUWhatsNewWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = PULocalizedString(@"WHATS_NEW_WELCOME_TITLE");
  v36.receiver = self;
  v36.super_class = (Class)PUWhatsNewWelcomeViewController;
  id v6 = [(PUWhatsNewWelcomeViewController *)&v36 initWithTitle:v5 detailText:0 icon:0];

  if (v6)
  {
    uint64_t v7 = PULocalizedString(@"WHATS_NEW_DESIGN_TITLE");
    uint64_t v8 = PULocalizedString(@"WHATS_NEW_DESIGN_CONTENT");
    v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"apple.photos"];
    id v10 = [v9 imageWithRenderingMode:2];

    v32 = (void *)v7;
    v30 = (void *)v8;
    [(PUWhatsNewWelcomeViewController *)v6 addBulletedListItemWithTitle:v7 description:v8 image:v10];
    v11 = PULocalizedString(@"WHATS_NEW_COLLECTIONS_TITLE");
    uint64_t v12 = PULocalizedString(@"WHATS_NEW_COLLECTIONS_CONTENT");
    v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.2.crop.square.stack"];
    uint64_t v14 = [v13 imageWithRenderingMode:2];

    v34 = (void *)v14;
    v35 = (void *)v12;
    [(PUWhatsNewWelcomeViewController *)v6 addBulletedListItemWithTitle:v11 description:v12 image:v14];
    v15 = PULocalizedString(@"WHATS_NEW_CUSTOMIZABLE_TITLE");
    uint64_t v16 = PULocalizedString(@"WHATS_NEW_CUSTOMIZABLE_CONTENT");
    v17 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"arrow.trianglehead.swap"];
    uint64_t v18 = [v17 imageWithRenderingMode:2];

    v33 = (void *)v16;
    v31 = (void *)v18;
    [(PUWhatsNewWelcomeViewController *)v6 addBulletedListItemWithTitle:v15 description:v16 image:v18];
    if (PLPlatformGenerativeModelSystemsSupported())
    {
      v19 = PULocalizedString(@"WHATS_NEW_APPLE_INTELLIGENCE_TITLE");
      v20 = PULocalizedString(@"WHATS_NEW_APPLE_INTELLIGENCE_CONTENT");
      [MEMORY[0x1E4FB1818] _systemImageNamed:@"apple.intelligence"];
      v22 = id v21 = v4;
      v23 = [v22 imageWithRenderingMode:2];

      id v4 = v21;
      [(PUWhatsNewWelcomeViewController *)v6 addBulletedListItemWithTitle:v19 description:v20 image:v23];
    }
    v24 = [MEMORY[0x1E4F83A80] boldButton];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = PULocalizedString(@"WHATS_NEW_WELCOME_CONTINUE");
    [v24 setTitle:v25 forState:0];

    [v24 addTarget:v6 action:sel__handleContinueButton_ forControlEvents:0x2000];
    v26 = [(PUWhatsNewWelcomeViewController *)v6 buttonTray];
    [v26 addButton:v24];

    v27 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__handleContinueButton_];
    [(PUWhatsNewWelcomeViewController *)v6 addKeyCommand:v27];

    [(PUWhatsNewWelcomeViewController *)v6 setModalPresentationStyle:2];
    [(PUWhatsNewWelcomeViewController *)v6 setModalInPresentation:1];
    v28 = (void *)[v4 copy];
    [(PUWhatsNewWelcomeViewController *)v6 _setCompletionHandler:v28];
  }
  return v6;
}

+ (void)resetLastPresentationInfo
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"LastWhatsNewShown"];
}

+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = (void (**)(id, void))a5;
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v10 = [v9 integerForKey:@"LastWhatsNewShown"];

  v11 = +[PUWelcomeSettings sharedInstance];
  uint64_t v12 = [v11 whatsNewBehavior];

  if (!v12 || (v12 != 1 ? (BOOL v13 = v10 <= 11) : (BOOL v13 = 0), v13))
  {
    uint64_t v14 = [[PUWhatsNewWelcomeViewController alloc] initWithCompletionHandler:v8];
    [v15 presentViewController:v14 animated:1 completion:0];
    v7[2](v7);
  }
  else
  {
    v8[2](v8, 0);
  }
}

@end