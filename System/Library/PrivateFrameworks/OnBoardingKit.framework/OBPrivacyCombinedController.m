@interface OBPrivacyCombinedController
+ (void)presentPrivacyCombinedControllerOverController:(id)a3 dismissHandler:(id)a4;
- (BOOL)allowsOpeningSafari;
- (BOOL)presentedFromPrivacyPane;
- (BOOL)underlineLinks;
- (NSString)displayLanguage;
- (OBAdditionalDisplayLanguageManager)additionalDisplayLanguageManager;
- (OBPrivacyCombinedController)init;
- (OBPrivacyCombinedController)initWithBundles:(id)a3;
- (UIColor)customTintColor;
- (void)setAdditionalDisplayLanguageManager:(id)a3;
- (void)setAllowsOpeningSafari:(BOOL)a3;
- (void)setCustomTintColor:(id)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setPresentedFromPrivacyPane:(BOOL)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation OBPrivacyCombinedController

- (OBPrivacyCombinedController)init
{
  return [(OBPrivacyCombinedController *)self initWithBundles:0];
}

- (OBPrivacyCombinedController)initWithBundles:(id)a3
{
  id v4 = a3;
  if ([(OBPrivacyCombinedController *)self isMemberOfClass:objc_opt_class()])
  {
    v5 = [[OBPrivacyCombinedController_iOS alloc] initWithBundles:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyCombinedController;
    v5 = [(OBTableWelcomeController *)&v8 initWithTitle:&stru_1EEC28768 detailText:0 icon:0 adoptTableViewScrollView:1];
  }
  [(OBWelcomeController *)v5 setTemplateType:1];
  v6 = +[OBCapabilities sharedCapabilities];
  -[OBPrivacyCombinedController setAllowsOpeningSafari:](v5, "setAllowsOpeningSafari:", [v6 preventOpeningSafari] ^ 1);

  return &v5->super;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyCombinedController;
  [(OBWelcomeController *)&v5 viewDidAppear:a3];
  if ([(OBPrivacyCombinedController *)self isMovingToParentViewController])
  {
    id v4 = +[OBAnalyticsManager sharedManager];
    [v4 logPresentationOfPrivacyUnifiedAbout];
  }
}

+ (void)presentPrivacyCombinedControllerOverController:(id)a3 dismissHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout];
  [v7 setDismissHandler:v5];

  [v7 setPresentingViewController:v6];
  [v7 setModalPresentationStyle:0];
  [v7 present];
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (void)setCustomTintColor:(id)a3
{
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafari = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setDisplayLanguage:(id)a3
{
}

- (BOOL)presentedFromPrivacyPane
{
  return self->_presentedFromPrivacyPane;
}

- (void)setPresentedFromPrivacyPane:(BOOL)a3
{
  self->_presentedFromPrivacyPane = a3;
}

- (OBAdditionalDisplayLanguageManager)additionalDisplayLanguageManager
{
  return self->_additionalDisplayLanguageManager;
}

- (void)setAdditionalDisplayLanguageManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDisplayLanguageManager, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
}

void __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

void __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id v3 = [*(id *)(a1 + 32) tableView];
    [v3 selectRowAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];
  }
}

@end