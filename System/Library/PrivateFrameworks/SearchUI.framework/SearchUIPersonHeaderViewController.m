@interface SearchUIPersonHeaderViewController
+ (id)downtimeBadgeStyleSettings;
- (BOOL)showingDowntimeBadge;
- (BOOL)userIsUnavailable;
- (CNGroupIdentityActionItem)openContactAction;
- (NSArray)statusSubcriptions;
- (NSObject)downtimeStatusObserver;
- (SKStatusSubscriptionService)subscriptionService;
- (SearchUIPersonHeaderViewController)init;
- (SearchUIPersonHeaderViewController)initWithDowntimeButton:(BOOL)a3;
- (id)STUserID;
- (id)actionsViewConfigurationWithDowntimeButton:(BOOL)a3;
- (id)contactNameFor:(id)a3;
- (void)dealloc;
- (void)groupIdentityDidUpdate:(id)a3;
- (void)handleConfirmDowntimeToggleFor:(id)a3;
- (void)handleErrorResultFromDowntimeToggleFor:(id)a3 withError:(id)a4;
- (void)setDowntimeStatusObserver:(id)a3;
- (void)setOpenContactAction:(id)a3;
- (void)setShowingDowntimeBadge:(BOOL)a3;
- (void)setStatusSubcriptions:(id)a3;
- (void)setSubscriptionService:(id)a3;
- (void)setupDowntimeStatusSubscription;
- (void)updateDowntimeBadge;
- (void)updateDowntimeBadgeForceRecheck:(BOOL)a3;
- (void)updateSubscriptions;
- (void)updateWithContact:(id)a3 isActualContact:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation SearchUIPersonHeaderViewController

+ (id)downtimeBadgeStyleSettings
{
  id v2 = objc_alloc(MEMORY[0x1E4F1BB60]);
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  v4 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  v5 = (void *)[v2 initWithPosition:0 color:v3 backgroundColor:v4 cropStyle:0];

  [v5 setContentMode:4];
  return v5;
}

- (SearchUIPersonHeaderViewController)init
{
  return [(SearchUIPersonHeaderViewController *)self initWithDowntimeButton:0];
}

- (id)contactNameFor:(id)a3
{
  return (id)[MEMORY[0x1E4F1B910] stringFromContact:a3 style:1000];
}

- (void)handleErrorResultFromDowntimeToggleFor:(id)a3 withError:(id)a4
{
  id v6 = a4;
  v7 = [(SearchUIPersonHeaderViewController *)self contactNameFor:a3];
  v8 = +[SearchUIUtilities localizedStringForKey:@"DOWNTIME_TOGGLE_ERROR_TITLE"];
  v9 = NSString;
  v10 = +[SearchUIUtilities localizedStringForKey:@"DOWNTIME_TOGGLE_ERROR_MESSAGE_FORMAT"];
  v11 = [v9 stringWithValidatedFormat:v10, @"%@", 0, v7 validFormatSpecifiers error];

  v12 = SearchUIGeneralLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[SearchUIPersonHeaderViewController handleErrorResultFromDowntimeToggleFor:withError:]((uint64_t)v6, v12);
  }

  v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v11 preferredStyle:1];
  v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = +[SearchUIUtilities localizedStringForKey:@"CONFIRMATION_ACTION_TITLE"];
  v16 = [v14 actionWithTitle:v15 style:0 handler:0];

  [v13 addAction:v16];
  [v13 setPreferredAction:v16];
  [(SearchUIPersonHeaderViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)handleConfirmDowntimeToggleFor:(id)a3
{
  id v4 = a3;
  v5 = +[SearchUIDowntimeManager sharedManager];
  id v6 = [(SearchUIPersonHeaderViewController *)self STUserID];
  int v7 = [v5 statusForSTUserID:v6 forceRecheck:1];

  v8 = [(SearchUIPersonHeaderViewController *)self contactNameFor:v4];
  BOOL v9 = v7 > 0;
  if (v7 <= 0) {
    v10 = @"DOWNTIME_TOGGLE_OFF_TO_ON_CONFIRM";
  }
  else {
    v10 = @"DOWNTIME_TOGGLE_ON_TO_OFF_CONFIRM";
  }
  if (v7 <= 0) {
    v11 = @"DOWNTIME_TOGGLE_OFF_TO_ON";
  }
  else {
    v11 = @"DOWNTIME_TOGGLE_ON_TO_OFF";
  }
  v12 = +[SearchUIUtilities localizedStringForKey:v10];
  v13 = v11;
  v14 = NSString;
  v15 = +[SearchUIUtilities localizedStringForKey:v13];

  v16 = [v14 stringWithValidatedFormat:v15, @"%@", 0, v8 validFormatSpecifiers error];

  v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v16 preferredStyle:0];
  v18 = (void *)MEMORY[0x1E4FB1410];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke;
  v24[3] = &unk_1E6E73F60;
  v24[4] = self;
  id v25 = v4;
  id v19 = v4;
  v20 = [v18 actionWithTitle:v12 style:2 * v9 handler:v24];
  [v17 addAction:v20];
  [v17 setPreferredAction:v20];
  v21 = (void *)MEMORY[0x1E4FB1410];
  v22 = +[SearchUIUtilities localizedStringForKey:@"CANCEL"];
  v23 = [v21 actionWithTitle:v22 style:1 handler:0];

  [v17 addAction:v23];
  [(SearchUIPersonHeaderViewController *)self presentViewController:v17 animated:1 completion:0];
}

void __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) STUserID];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke_2;
  v5[3] = &unk_1E6E73168;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 toggleOnDemandDowntimeForUserID:v3 completionHandler:v5];
}

uint64_t __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) handleErrorResultFromDowntimeToggleFor:*(void *)(a1 + 40) withError:a2];
  }
  v3 = *(void **)(a1 + 32);
  return [v3 updateDowntimeBadgeForceRecheck:1];
}

- (id)actionsViewConfigurationWithDowntimeButton:(BOOL)a3
{
  BOOL v3 = a3;
  if (actionsViewConfigurationWithDowntimeButton__onceToken != -1) {
    dispatch_once(&actionsViewConfigurationWithDowntimeButton__onceToken, &__block_literal_global_33);
  }
  objc_initWeak(&location, self);
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_2;
    aBlock[3] = &unk_1E6E740D0;
    objc_copyWeak(&v20, &location);
    v5 = _Block_copy(aBlock);
    id v6 = objc_alloc(MEMORY[0x1E4F1BBC8]);
    int v7 = +[SearchUIUtilities localizedStringForKey:@"DOWNTIME_TITLE"];
    v8 = (void *)[v6 initWithTitle:v7 actionType:@"SearchUICNActionTypeDowntime" systemImageName:@"downtime" overrideEnabledState:1 actionBlock:v5];

    [v8 setShouldPresentDisambiguationUI:0];
    BOOL v9 = [(id)actionsViewConfigurationWithDowntimeButton__baseActions arrayByAddingObject:v8];

    v10 = &v20;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_3;
    v17[3] = &unk_1E6E740D0;
    objc_copyWeak(&v18, &location);
    v11 = _Block_copy(v17);
    id v12 = objc_alloc(MEMORY[0x1E4F1BBC8]);
    v13 = +[SearchUIUtilities localizedStringForKey:@"INFO"];
    v14 = (void *)[v12 initWithTitle:v13 actionType:@"SearchUICNActionTypeOpenContact" systemImageName:@"person.crop.circle.fill" actionBlock:v11];

    [v14 setShouldPresentDisambiguationUI:0];
    BOOL v9 = [(id)actionsViewConfigurationWithDowntimeButton__baseActions arrayByAddingObject:v14];
    [(SearchUIPersonHeaderViewController *)self setOpenContactAction:v14];

    v10 = &v18;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1BBD8]) initWithDefaultActionItems:v9 displaysUnavailableActionTypes:1 actionViewStyle:6];

  return v15;
}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke()
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  v1 = (void *)[v0 initWithTitle:0 actionType:*MEMORY[0x1E4F1AD48] actionBlock:0];
  v10[0] = v1;
  id v2 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  BOOL v3 = (void *)[v2 initWithTitle:0 actionType:*MEMORY[0x1E4F1AD20] actionBlock:0];
  v10[1] = v3;
  id v4 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  v5 = (void *)[v4 initWithTitle:0 actionType:*MEMORY[0x1E4F1AD78] actionBlock:0];
  v10[2] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  int v7 = (void *)[v6 initWithTitle:0 actionType:*MEMORY[0x1E4F1AD38] actionBlock:0];
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  BOOL v9 = (void *)actionsViewConfigurationWithDowntimeButton__baseActions;
  actionsViewConfigurationWithDowntimeButton__baseActions = v8;
}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained group];
  id v2 = [v1 contacts];
  BOOL v3 = [v2 firstObject];
  [WeakRetained handleConfirmDowntimeToggleFor:v3];
}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_opt_new();
  id v2 = [WeakRetained group];
  BOOL v3 = [v2 contacts];
  id v4 = [v3 firstObject];
  v5 = [v4 identifier];
  [v1 setCoreSpotlightIdentifier:v5];

  id v6 = +[SearchUIUtilities bundleIdentifierForApp:5];
  [v1 setApplicationBundleIdentifier:v6];

  int v7 = +[SearchUICommandHandler handlerForCommand:v1 environment:0];
  [v7 performCommand:v1 triggerEvent:2 environment:0];
}

- (SearchUIPersonHeaderViewController)initWithDowntimeButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1BBC0]);
  id v6 = (void *)[v5 initGroupWithName:0 photo:0 contacts:MEMORY[0x1E4F1CBF0]];
  int v7 = [(SearchUIPersonHeaderViewController *)self actionsViewConfigurationWithDowntimeButton:v3];
  uint64_t v8 = (void *)MEMORY[0x1E4F1BB50];
  BOOL v9 = +[SearchUIContactCache sharedCache];
  v10 = [v9 contactStore];
  v11 = [v8 settingsWithContactStore:v10 cacheSize:0 threeDTouchEnabled:1];
  v14.receiver = self;
  v14.super_class = (Class)SearchUIPersonHeaderViewController;
  id v12 = [(CNGroupIdentityHeaderViewController *)&v14 initWithGroupIdentity:v6 actionsViewConfiguration:v7 avatarViewControllerSettings:v11];

  if (v12) {
    [(SearchUIPersonHeaderViewController *)v12 setupDowntimeStatusSubscription];
  }

  return v12;
}

- (id)STUserID
{
  id v2 = [(CNGroupIdentityHeaderViewController *)self group];
  BOOL v3 = [v2 contacts];
  id v4 = [v3 firstObject];
  id v5 = +[SearchUIDowntimeManager screenTimeUserIDForContact:v4];

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIPersonHeaderViewController;
  [(CNGroupIdentityHeaderViewController *)&v6 viewDidLoad];
  [(SearchUIPersonHeaderViewController *)self updateDowntimeBadge];
  id v3 = objc_alloc(MEMORY[0x1E4FA8008]);
  id v4 = (void *)[v3 initWithStatusTypeIdentifier:*MEMORY[0x1E4F4F168]];
  [(SearchUIPersonHeaderViewController *)self setSubscriptionService:v4];

  id v5 = [(SearchUIPersonHeaderViewController *)self subscriptionService];
  [v5 addDelegate:self queue:MEMORY[0x1E4F14428]];

  [(SearchUIPersonHeaderViewController *)self updateSubscriptions];
}

- (void)groupIdentityDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIPersonHeaderViewController;
  [(CNGroupIdentityHeaderViewController *)&v4 groupIdentityDidUpdate:a3];
  [(SearchUIPersonHeaderViewController *)self updateDowntimeBadge];
  [(SearchUIPersonHeaderViewController *)self updateSubscriptions];
}

- (void)updateWithContact:(id)a3 isActualContact:(BOOL)a4
{
  LODWORD(v4) = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  uint64_t v8 = [(SearchUIPersonHeaderViewController *)self view];
  [v8 setAlpha:v7];

  BOOL v9 = v6;
  if (v6)
  {
    uint64_t v4 = v4;
  }
  else
  {
    BOOL v9 = objc_opt_new();
    [v9 setNickname:@" "];
    uint64_t v4 = 0;
  }
  v10 = [(SearchUIPersonHeaderViewController *)self openContactAction];
  [v10 setShouldOverrideEnabledState:v4];

  v11 = [(SearchUIPersonHeaderViewController *)self openContactAction];
  [v11 setOverrideEnabledState:v4];

  id v12 = objc_alloc(MEMORY[0x1E4F1BBC0]);
  v15[0] = v9;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  objc_super v14 = (void *)[v12 initGroupWithName:0 photo:0 contacts:v13];

  [(SearchUIPersonHeaderViewController *)self groupIdentityDidUpdate:v14];
}

- (void)updateSubscriptions
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v2];
}

void __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) group];
  uint64_t v4 = [v3 contacts];
  id v5 = [v4 firstObject];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = +[SearchUIUtilities skHandlesFromContact:v5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 32) subscriptionService];
        v13 = [v12 statusSubscriptionForHandle:v11];

        if (v13)
        {
          [v13 retainTransientSubscriptionAssertionWithCompletion:0];
          [v2 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  objc_super v14 = (void *)[v2 copy];
  [*(id *)(a1 + 32) setStatusSubcriptions:v14];

  char v15 = [*(id *)(a1 + 32) userIsUnavailable];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke_2;
  v17[3] = &unk_1E6E727F8;
  void v17[4] = *(void *)(a1 + 32);
  id v18 = v5;
  char v19 = v15;
  id v16 = v5;
  +[SearchUIUtilities dispatchMainIfNecessary:v17];
}

void __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) group];
  id v2 = [v7 contacts];
  id v3 = [v2 firstObject];
  if ([v3 isEqual:*(void *)(a1 + 40)])
  {
    char v4 = [*(id *)(a1 + 32) showingDowntimeBadge];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
      id v6 = *(void **)(a1 + 32);
      [v6 setShouldShowContactBusy:v5];
    }
  }
  else
  {
  }
}

- (BOOL)userIsUnavailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(SearchUIPersonHeaderViewController *)self statusSubcriptions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) currentStatus];
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F170]) initWithPublishedStatus:v6];
        uint64_t v8 = v7;
        if (v7 && ([v7 isAvailable] & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)updateDowntimeBadge
{
}

- (void)updateDowntimeBadgeForceRecheck:(BOOL)a3
{
  uint64_t v5 = [(SearchUIPersonHeaderViewController *)self STUserID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SearchUIPersonHeaderViewController_updateDowntimeBadgeForceRecheck___block_invoke;
  v7[3] = &unk_1E6E727F8;
  id v8 = v5;
  uint64_t v9 = self;
  BOOL v10 = a3;
  id v6 = v5;
  +[SearchUIUtilities dispatchMainIfNecessary:v7];
}

void __70__SearchUIPersonHeaderViewController_updateDowntimeBadgeForceRecheck___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) STUserID];
  LODWORD(v2) = [v2 isEqualToUserID:v3];

  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v4 = +[SearchUIDowntimeManager sharedManager];
  uint64_t v5 = [*(id *)(a1 + 40) STUserID];
  int v6 = [v4 statusForSTUserID:v5 forceRecheck:*(unsigned __int8 *)(a1 + 48)];

  if (v6 > 0 == [*(id *)(a1 + 40) showingDowntimeBadge]) {
    return;
  }
  [*(id *)(a1 + 40) setShowingDowntimeBadge:v6 > 0];
  if (v6 >= 1)
  {
    id v7 = +[SearchUISymbolImage uiImageWithSymbolName:@"downtime"];
    [*(id *)(a1 + 40) setAvatarBadgeImage:v7];

    id v9 = [(id)objc_opt_class() downtimeBadgeStyleSettings];
    [*(id *)(a1 + 40) setAvatarBadgeStyleSettings:v9];
  }
  else
  {
LABEL_7:
    id v8 = *(void **)(a1 + 40);
    [v8 setAvatarBadgeImage:0];
  }
}

- (void)setupDowntimeStatusSubscription
{
  uint64_t v3 = [(SearchUIPersonHeaderViewController *)self downtimeStatusObserver];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = +[SearchUIDowntimeManager sharedManager];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __69__SearchUIPersonHeaderViewController_setupDowntimeStatusSubscription__block_invoke;
    id v9 = &unk_1E6E740F8;
    objc_copyWeak(&v10, &location);
    uint64_t v5 = [v4 addObserverForDowntimeStatuses:&v6];
    -[SearchUIPersonHeaderViewController setDowntimeStatusObserver:](self, "setDowntimeStatusObserver:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __69__SearchUIPersonHeaderViewController_setupDowntimeStatusSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained STUserID];
  uint64_t v5 = [v4 dsid];
  uint64_t v6 = [v5 stringValue];
  int v7 = [v3 isEqualToString:v6];

  if (v7) {
    [WeakRetained updateDowntimeBadge];
  }
}

- (void)dealloc
{
  id v3 = +[SearchUIDowntimeManager sharedManager];
  uint64_t v4 = [(SearchUIPersonHeaderViewController *)self downtimeStatusObserver];
  [v3 removeObserver:v4];

  downtimeStatusObserver = self->_downtimeStatusObserver;
  self->_downtimeStatusObserver = 0;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIPersonHeaderViewController;
  [(SearchUIPersonHeaderViewController *)&v6 dealloc];
}

- (SKStatusSubscriptionService)subscriptionService
{
  return (SKStatusSubscriptionService *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setSubscriptionService:(id)a3
{
}

- (NSArray)statusSubcriptions
{
  return (NSArray *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setStatusSubcriptions:(id)a3
{
}

- (NSObject)downtimeStatusObserver
{
  return self->_downtimeStatusObserver;
}

- (void)setDowntimeStatusObserver:(id)a3
{
}

- (BOOL)showingDowntimeBadge
{
  return self->_showingDowntimeBadge;
}

- (void)setShowingDowntimeBadge:(BOOL)a3
{
  self->_showingDowntimeBadge = a3;
}

- (CNGroupIdentityActionItem)openContactAction
{
  return (CNGroupIdentityActionItem *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setOpenContactAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openContactAction, 0);
  objc_storeStrong((id *)&self->_downtimeStatusObserver, 0);
  objc_storeStrong((id *)&self->_statusSubcriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionService, 0);
}

- (void)handleErrorResultFromDowntimeToggleFor:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIPersonHeaderViewController: toggled downtime with error: %@", (uint8_t *)&v2, 0xCu);
}

@end