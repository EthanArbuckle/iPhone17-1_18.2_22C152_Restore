@interface BFFFinishSetupPINVerificationViewController
- (id)completion;
- (id)stringsBundle;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)loadView;
- (void)setCompletion:(id)a3;
@end

@implementation BFFFinishSetupPINVerificationViewController

- (void)loadView
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupPINVerificationViewController;
  [(BFFFinishSetupPINVerificationViewController *)&v6 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263F5FA90]);
  id v4 = objc_alloc_init(MEMORY[0x263F5FC40]);
  [v4 setEditPaneClass:objc_opt_class()];
  [v4 setProperty:&unk_26D1D8540 forKey:@"mode"];
  [v3 setSpecifier:v4];
  [v3 setPinDelegate:self];
  v7[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(BFFFinishSetupPINVerificationViewController *)self setViewControllers:v5];
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    id v5 = self->_completion;
    self->_completion = 0;
  }
}

- (void)didCancelEnteringPIN
{
  completion = (void (**)(id, void))self->_completion;
  if (completion)
  {
    completion[2](completion, 0);
    id v4 = self->_completion;
    self->_completion = 0;
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end