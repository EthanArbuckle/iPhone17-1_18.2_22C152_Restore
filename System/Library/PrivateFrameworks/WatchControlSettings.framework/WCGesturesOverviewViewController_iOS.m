@interface WCGesturesOverviewViewController_iOS
+ (id)createGesturesOverviewViewController;
- (WCOnboardingObserver)onboardingObserver;
- (void)_tryItOutOnAppleWatch;
- (void)dismissOnboarding;
- (void)setOnboardingObserver:(id)a3;
- (void)viewDidLoad;
@end

@implementation WCGesturesOverviewViewController_iOS

+ (id)createGesturesOverviewViewController
{
  v2 = [WCGesturesOverviewViewController_iOS alloc];
  v3 = WCLocalizedString(@"grey.onboarding.title");
  v4 = [(WCGesturesOverviewViewController_iOS *)v2 initWithTitle:v3 detailText:0 icon:0];

  return v4;
}

- (void)viewDidLoad
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)WCGesturesOverviewViewController_iOS;
  [(OBBaseWelcomeController *)&v24 viewDidLoad];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = WCAvailableGreyEvents();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v7), "integerValue", (void)v20);
        v9 = WCNameForGreyEvent(v8);
        v10 = WCOnboardingDescriptionForGreyEvent(v8);
        v11 = WCOnboardingImageForGreyEvent(v8, 1);
        [(WCGesturesOverviewViewController_iOS *)self addBulletedListItemWithTitle:v9 description:v10 image:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  v12 = [MEMORY[0x263F5B898] boldButton];
  v13 = WCLocalizedString(@"grey.onboarding.try.it.out.on.watch.action");
  [v12 setTitle:v13 forState:0];

  [v12 addTarget:self action:sel__tryItOutOnAppleWatch forControlEvents:64];
  v14 = [(WCGesturesOverviewViewController_iOS *)self buttonTray];
  [v14 addButton:v12];

  v15 = [(WCGesturesOverviewViewController_iOS *)self navigationController];
  v16 = [v15 viewControllers];
  uint64_t v17 = [v16 count];

  if (v17 == 1)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_dismissOnboarding];
    v19 = [(OBBaseWelcomeController *)self navigationItem];
    [v19 setLeftBarButtonItem:v18];
  }
}

- (void)dismissOnboarding
{
}

- (void)_tryItOutOnAppleWatch
{
  id v2 = +[WatchControlSettings sharedInstance];
  [v2 setRequestToShowPracticeGrey:1];
}

- (WCOnboardingObserver)onboardingObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingObserver);
  return (WCOnboardingObserver *)WeakRetained;
}

- (void)setOnboardingObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end