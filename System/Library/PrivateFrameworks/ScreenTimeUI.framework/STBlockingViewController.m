@interface STBlockingViewController
+ (id)closeApplicationHandler;
+ (id)newTranslucentBlockingViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)fullScreenBehavior;
- (BOOL)isApplicationShieldedWithBundleIdentifier:(id)a3;
- (BOOL)isCategoryShieldedWithIdentifier:(id)a3;
- (BOOL)isChangePolicyButtonHidden;
- (BOOL)isShieldedThroughManagedSettings;
- (BOOL)isShowingPolicyOptions;
- (BOOL)isWebDomainShieldedWithWebURL:(id)a3;
- (BOOL)shouldAllowOneMoreMinute;
- (BOOL)shouldRequestMoreTime;
- (CNContactStore)contactStore;
- (MOCancellable)effectiveSettingsSubscription;
- (MOEffectiveSettingsStore)effectiveSettingsStore;
- (NSString)bundleIdentifier;
- (NSString)categoryIdentifier;
- (NSString)formattedContactHandle;
- (NSString)webDomain;
- (SBSLockScreenService)lockScreenService;
- (STHourglassView)hourglassView;
- (STManagementState)managementState;
- (STMenuButton)askForMoreTimeButton;
- (STMenuButton)ignoreLimitButton;
- (UIButton)addContactButton;
- (UIButton)customPrimaryButton;
- (UIButton)customSecondaryButton;
- (UIButton)enterScreenTimePasscodeButton;
- (UIButton)okButton;
- (UIImageView)communicationLimitView;
- (UIImageView)customImageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (id)_askForMoreTimeMenuProvider;
- (id)_askForTimeResource;
- (id)_enterScreenTimePasscodeAction;
- (id)_iCloudContainer;
- (id)_ignoreForTodayAction;
- (id)_ignoreLimitMenuProvider;
- (id)_newContact;
- (id)_oneMoreMinuteAction;
- (id)_primaryButtonConfiguration;
- (id)_remindMeIn15MinutesAction;
- (id)_secondaryButtonConfiguration;
- (id)_sendRequestAction;
- (id)addContactHandler;
- (id)okButtonHandler;
- (int64_t)_dmfPolicyFromScreenTimeShieldPolicy:(id)a3;
- (int64_t)_managedSettingsShieldPolicyForBundleIdentifier:(id)a3 category:(id)a4;
- (int64_t)_managedSettingsShieldPolicyForCategoryIdentifier:(id)a3;
- (int64_t)_managedSettingsShieldPolicyForWebURL:(id)a3 category:(id)a4;
- (int64_t)policy;
- (void)_addContact;
- (void)_addContact:(id)a3;
- (void)_askForTimeResource;
- (void)_customButtonPressed:(id)a3;
- (void)_didFinishEnteringScreenTimePasscode:(id)a3;
- (void)_enterScreenTimePasscode:(id)a3;
- (void)_handleCustomButtonResponse:(id)a3 forAction:(int64_t)a4 error:(id)a5;
- (void)_hideCustomButtons;
- (void)_iCloudContainer;
- (void)_ignoreLimitForAdditionalTime:(double)a3;
- (void)_ok:(id)a3;
- (void)_oneMoreMinute:(id)a3;
- (void)_sendRequest:(id)a3;
- (void)_showAskForMoreTimeOptions:(id)a3;
- (void)_showDefaultHourglassView;
- (void)_showIgnoreLimitOptions:(id)a3;
- (void)_showPasscodeApprovedOptions;
- (void)_unlockDeviceIfNeededWithCompletionHandler:(id)a3;
- (void)_updateAddContactButton;
- (void)_updateAppearanceForAskPending;
- (void)_updateAppearanceForBlockedContent:(id)a3 messageFormatKey:(id)a4 messageKey:(id)a5;
- (void)_updateAppearanceWithCustomConfiguration:(id)a3 defaultMessageFormatKey:(id)a4 defaultMessageArgument:(id)a5;
- (void)_updateButtons;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contextMenuWillDisplayForButton:(id)a3;
- (void)contextMenuWillEndForButton:(id)a3;
- (void)dealloc;
- (void)handleScreenTimeSettingsGroupChanges;
- (void)hideWithAnimation:(BOOL)a3 completionHandler:(id)a4;
- (void)registerForManagedSettingsEffectiveChanges;
- (void)setAddContactButton:(id)a3;
- (void)setAddContactHandler:(id)a3;
- (void)setAskForMoreTimeButton:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setChangePolicyButtonHidden:(BOOL)a3;
- (void)setCommunicationLimitView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCustomImageView:(id)a3;
- (void)setCustomPrimaryButton:(id)a3;
- (void)setCustomSecondaryButton:(id)a3;
- (void)setEffectiveSettingsSubscription:(id)a3;
- (void)setEnterScreenTimePasscodeButton:(id)a3;
- (void)setFormattedContactHandle:(id)a3;
- (void)setFullScreenBehavior:(BOOL)a3;
- (void)setHourglassView:(id)a3;
- (void)setIgnoreLimitButton:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setOkButton:(id)a3;
- (void)setOkButtonHandler:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setShowingPolicyOptions:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWebDomain:(id)a3;
- (void)shouldAllowOneMoreMinute;
- (void)showWithAnimation:(BOOL)a3 completionHandler:(id)a4;
- (void)unregisterFromManagedSettingsEffectiveChanges;
- (void)updateAppearanceUsingBlockedContactHandles:(id)a3 contactNameByHandle:(id)a4 forBundleIdentifier:(id)a5 isApplicationCurrentlyLimited:(BOOL)a6 contactStore:(id)a7;
- (void)updateAppearanceUsingPolicy:(int64_t)a3 forBundleIdentifier:(id)a4;
- (void)updateAppearanceUsingPolicy:(int64_t)a3 forCategoryIdentifier:(id)a4;
- (void)updateAppearanceUsingPolicy:(int64_t)a3 forWebpageURL:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STBlockingViewController

+ (id)newTranslucentBlockingViewController
{
  v2 = (void *)MEMORY[0x263F1C9E8];
  v3 = +[STScreenTimeUIBundle bundle];
  v4 = [v2 storyboardWithName:@"BlockingUI-Translucent-iOS" bundle:v3];

  v5 = [v4 instantiateInitialViewController];
  uint64_t v6 = objc_opt_new();
  v7 = (void *)v5[137];
  v5[137] = v6;

  uint64_t v8 = objc_opt_new();
  v9 = (void *)v5[141];
  v5[141] = v8;

  uint64_t v10 = objc_opt_new();
  v11 = (void *)v5[145];
  v5[145] = v10;

  return v5;
}

- (void)dealloc
{
  [(SBSLockScreenService *)self->_lockScreenService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STBlockingViewController;
  [(STBlockingViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)STBlockingViewController;
  [(STBlockingViewController *)&v14 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2B0]];
  v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];
  uint64_t v6 = [(STBlockingViewController *)self titleLabel];
  [v6 setFont:v5];

  v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    v9 = [(STBlockingViewController *)self ignoreLimitButton];
    uint64_t v10 = [(STBlockingViewController *)self _ignoreLimitMenuProvider];
    [v9 _setMenuProvider:v10];

    [v9 setShowsMenuAsPrimaryAction:1];
    [v9 setPreferredMenuElementOrder:2];
    [v9 setDelegate:self];
    v11 = [(STBlockingViewController *)self askForMoreTimeButton];
    v12 = [(STBlockingViewController *)self _askForMoreTimeMenuProvider];
    [v11 _setMenuProvider:v12];

    [v11 setShowsMenuAsPrimaryAction:1];
    [v11 setPreferredMenuElementOrder:2];
    [v11 setDelegate:self];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STBlockingViewController.viewDidLoad", v13, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STBlockingViewController;
  [(STBlockingViewController *)&v9 viewWillAppear:a3];
  [(STBlockingViewController *)self registerForManagedSettingsEffectiveChanges];
  v4 = [(STBlockingViewController *)self okButton];
  [v4 setAccessibilityIdentifier:@"ok-button"];

  v5 = [(STBlockingViewController *)self ignoreLimitButton];
  [v5 setAccessibilityIdentifier:@"ignore-limit-button"];

  uint64_t v6 = [(STBlockingViewController *)self askForMoreTimeButton];
  [v6 setAccessibilityIdentifier:@"ask-for-more-time-button"];

  v7 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
  [v7 setAccessibilityIdentifier:@"enter-passcode-button"];

  uint64_t v8 = [(STBlockingViewController *)self addContactButton];
  [v8 setAccessibilityIdentifier:@"add-contact-button"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(STBlockingViewController *)self unregisterFromManagedSettingsEffectiveChanges];
  v5.receiver = self;
  v5.super_class = (Class)STBlockingViewController;
  [(STBlockingViewController *)&v5 viewDidDisappear:v3];
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_opt_new();
    objc_super v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (BOOL)shouldAllowOneMoreMinute
{
  BOOL v3 = [(STBlockingViewController *)self categoryIdentifier];
  v4 = [(STBlockingViewController *)self bundleIdentifier];
  uint64_t v5 = [(STBlockingViewController *)self webDomain];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    v7 = [(STBlockingViewController *)self managementState];
    id v17 = 0;
    uint64_t v8 = [v7 shouldAllowOneMoreMinuteForCategoryIdentifier:v3 error:&v17];
    id v9 = v17;

    if (!v8)
    {
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController shouldAllowOneMoreMinute]();
      }
LABEL_16:

      uint64_t v8 = 0;
    }
  }
  else if (v4)
  {
    v11 = [(STBlockingViewController *)self managementState];
    id v16 = 0;
    uint64_t v8 = [v11 shouldAllowOneMoreMinuteForBundleIdentifier:v4 error:&v16];
    id v9 = v16;

    if (!v8)
    {
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController shouldAllowOneMoreMinute]();
      }
      goto LABEL_16;
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[STBlockingViewController shouldAllowOneMoreMinute]();
      }
      id v9 = 0;
      goto LABEL_16;
    }
    v12 = [(STBlockingViewController *)self managementState];
    id v15 = 0;
    uint64_t v8 = [v12 shouldAllowOneMoreMinuteForWebDomain:v6 error:&v15];
    id v9 = v15;

    if (!v8)
    {
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController shouldAllowOneMoreMinute]();
      }
      goto LABEL_16;
    }
  }
  char v13 = [v8 BOOLValue];

  return v13;
}

- (BOOL)shouldRequestMoreTime
{
  v2 = [(STBlockingViewController *)self managementState];
  char v3 = [v2 shouldRequestMoreTime];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)registerForManagedSettingsEffectiveChanges
{
  v11[1] = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (!self->_effectiveSettingsSubscription)
    {
      char v3 = (void *)MEMORY[0x263F53ED0];
      v4 = (void *)MEMORY[0x263EFFA08];
      v11[0] = *MEMORY[0x263F53E78];
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      uint64_t v6 = [v4 setWithArray:v5];
      v7 = [v3 publisherForGroups:v6];

      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __70__STBlockingViewController_registerForManagedSettingsEffectiveChanges__block_invoke;
      v10[3] = &unk_26449B1D8;
      v10[4] = self;
      uint64_t v8 = [v7 sinkWithReceiveInput:v10];
      effectiveSettingsSubscription = self->_effectiveSettingsSubscription;
      self->_effectiveSettingsSubscription = v8;
    }
  }
}

uint64_t __70__STBlockingViewController_registerForManagedSettingsEffectiveChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*MEMORY[0x263F53E78]];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) isShieldedThroughManagedSettings];
    if (result)
    {
      v4 = *(void **)(a1 + 32);
      return [v4 handleScreenTimeSettingsGroupChanges];
    }
  }
  return result;
}

- (void)unregisterFromManagedSettingsEffectiveChanges
{
  if (_os_feature_enabled_impl())
  {
    effectiveSettingsSubscription = self->_effectiveSettingsSubscription;
    if (effectiveSettingsSubscription)
    {
      [(MOCancellable *)effectiveSettingsSubscription cancel];
      v4 = self->_effectiveSettingsSubscription;
      self->_effectiveSettingsSubscription = 0;
    }
  }
}

- (void)handleScreenTimeSettingsGroupChanges
{
  if (_os_feature_enabled_impl())
  {
    char v3 = [(STBlockingViewController *)self bundleIdentifier];

    if (v3)
    {
      v4 = [(STBlockingViewController *)self bundleIdentifier];
      uint64_t v5 = (void *)[v4 copy];

      [(STBlockingViewController *)self setBundleIdentifier:0];
      uint64_t v6 = [MEMORY[0x263F08A48] mainQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke;
      v23[3] = &unk_26449B200;
      v23[4] = self;
      v24 = v5;
      id v7 = v5;
      [v6 addOperationWithBlock:v23];

      uint64_t v8 = v24;
LABEL_4:

LABEL_7:
      return;
    }
    id v9 = [(STBlockingViewController *)self webDomain];

    if (v9)
    {
      id v7 = (id)objc_opt_new();
      uint64_t v10 = [(STBlockingViewController *)self webDomain];
      v11 = (void *)[v10 copy];
      [v7 setHost:v11];

      v12 = [v7 URL];
      [(STBlockingViewController *)self setWebDomain:0];
      char v13 = [MEMORY[0x263F08A48] mainQueue];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_2;
      v21[3] = &unk_26449B200;
      v21[4] = self;
      id v22 = v12;
      id v14 = v12;
      [v13 addOperationWithBlock:v21];

      goto LABEL_7;
    }
    id v15 = [(STBlockingViewController *)self categoryIdentifier];

    if (v15)
    {
      id v16 = [(STBlockingViewController *)self categoryIdentifier];
      id v17 = (void *)[v16 copy];

      [(STBlockingViewController *)self setCategoryIdentifier:0];
      v18 = [MEMORY[0x263F08A48] mainQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_3;
      v19[3] = &unk_26449B200;
      v19[4] = self;
      v20 = v17;
      id v7 = v17;
      [v18 addOperationWithBlock:v19];

      uint64_t v8 = v20;
      goto LABEL_4;
    }
  }
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearanceUsingPolicy:5 forBundleIdentifier:*(void *)(a1 + 40)];
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearanceUsingPolicy:5 forWebpageURL:*(void *)(a1 + 40)];
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearanceUsingPolicy:5 forCategoryIdentifier:*(void *)(a1 + 40)];
}

- (BOOL)isShieldedThroughManagedSettings
{
  char v3 = [(STBlockingViewController *)self bundleIdentifier];

  if (v3)
  {
    v4 = [(STBlockingViewController *)self bundleIdentifier];
    BOOL v5 = [(STBlockingViewController *)self isApplicationShieldedWithBundleIdentifier:v4];
  }
  else
  {
    id v7 = [(STBlockingViewController *)self webDomain];

    if (v7)
    {
      v4 = objc_opt_new();
      uint64_t v8 = [(STBlockingViewController *)self webDomain];
      id v9 = (void *)[v8 copy];
      [v4 setHost:v9];

      uint64_t v10 = [v4 URL];
      BOOL v6 = [(STBlockingViewController *)self isWebDomainShieldedWithWebURL:v10];

      goto LABEL_6;
    }
    v12 = [(STBlockingViewController *)self categoryIdentifier];

    if (!v12) {
      return 0;
    }
    v4 = [(STBlockingViewController *)self categoryIdentifier];
    BOOL v5 = [(STBlockingViewController *)self isCategoryShieldedWithIdentifier:v4];
  }
  BOOL v6 = v5;
LABEL_6:

  return v6;
}

- (BOOL)isCategoryShieldedWithIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F53EC8];
  id v5 = a3;
  BOOL v6 = (void *)[[v4 alloc] initWithIdentifier:v5];

  id v7 = [(STBlockingViewController *)self effectiveSettingsStore];
  uint64_t v8 = [v7 shield];
  id v9 = [v8 applicationCategories];

  uint64_t v10 = [v9 policy];
  if (v10 == 2
    || v10 == 1
    && ([v9 specificCategories],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 containsObject:v6],
        v11,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    id v14 = [(STBlockingViewController *)self effectiveSettingsStore];
    id v15 = [v14 shield];
    id v16 = [v15 webDomainCategories];

    uint64_t v17 = [v16 policy];
    BOOL v13 = 1;
    if (v17 != 2)
    {
      if (v17 != 1
        || ([v16 specificCategories],
            v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 containsObject:v6],
            v18,
            (v19 & 1) == 0))
      {
        BOOL v13 = 0;
      }
    }
  }
  return v13;
}

- (BOOL)isApplicationShieldedWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v4];
  BOOL v6 = [(STBlockingViewController *)self effectiveSettingsStore];
  id v7 = [v6 shield];
  uint64_t v8 = [v7 applications];

  if (([v8 containsObject:v5] & 1) == 0)
  {
    id v10 = v4;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    v62 = __Block_byref_object_dispose_;
    id v63 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    char v12 = [MEMORY[0x263F318B0] sharedCategories];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __categoryForBundleIdentifier_block_invoke;
    v53[3] = &unk_26449B4C0;
    v56 = &v58;
    id v13 = v10;
    id v54 = v13;
    id v14 = v11;
    id v55 = v14;
    uint64_t v57 = 1;
    [v12 categoryForBundleID:v13 completionHandler:v53];

    [v14 lockWhenCondition:1];
    [v14 unlock];
    id v15 = (id)v59[5];

    _Block_object_dispose(&v58, 8);
    if (!v15)
    {
      BOOL v9 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v16 = [v15 canonicalBundleIdentifier];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v16];
    if (v17 && ([v8 containsObject:v17] & 1) != 0)
    {
      BOOL v9 = 1;
LABEL_33:

      goto LABEL_34;
    }
    v51 = v16;
    id v18 = objc_alloc(MEMORY[0x263F53EC8]);
    char v19 = [v15 identifier];
    v20 = (void *)[v18 initWithIdentifier:v19];

    v21 = [(STBlockingViewController *)self effectiveSettingsStore];
    id v22 = [v21 shield];
    v23 = [v22 applicationCategories];

    uint64_t v24 = [v23 policy];
    v52 = v23;
    if (v24 == 2)
    {
      v27 = [v23 excludedContent];
      if (([v27 containsObject:v5] & 1) == 0)
      {
        v28 = v23;
LABEL_16:
        v29 = [v28 excludedContent];
        char v30 = [v29 containsObject:v17];

        if ((v30 & 1) == 0)
        {
          BOOL v9 = 1;
          id v16 = v51;
LABEL_32:

          goto LABEL_33;
        }
LABEL_17:
        v31 = [v15 primaryWebDomain];
        v32 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v31];
        if (!v32)
        {
          BOOL v9 = 0;
          id v16 = v51;
LABEL_31:

          goto LABEL_32;
        }
        v48 = v31;
        v50 = v20;
        v33 = [(STBlockingViewController *)self effectiveSettingsStore];
        v34 = [v33 shield];
        v35 = [v34 webDomains];

        v49 = v35;
        if ([v35 containsObject:v32])
        {
          BOOL v9 = 1;
          v20 = v50;
          id v16 = v51;
          v31 = v48;
LABEL_30:

          goto LABEL_31;
        }
        v36 = [(STBlockingViewController *)self effectiveSettingsStore];
        v37 = [v36 shield];
        v38 = [v37 webDomainCategories];

        v39 = v38;
        uint64_t v40 = [v38 policy];
        v20 = v50;
        if (v40 == 2)
        {
          v43 = [v39 excludedContent];
          int v47 = [v43 containsObject:v32];

          v31 = v48;
          if (!v47)
          {
LABEL_25:
            BOOL v9 = 1;
LABEL_29:

            id v16 = v51;
            goto LABEL_30;
          }
        }
        else
        {
          v31 = v48;
          if (v40 == 1)
          {
            v41 = [v39 specificCategories];
            int v45 = [v41 containsObject:v50];

            if (v45)
            {
              v42 = [v39 excludedContent];
              char v46 = [v42 containsObject:v32];

              if ((v46 & 1) == 0) {
                goto LABEL_25;
              }
            }
          }
        }
        BOOL v9 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (v24 != 1) {
        goto LABEL_17;
      }
      v25 = [v23 specificCategories];
      int v26 = [v25 containsObject:v20];

      if (!v26) {
        goto LABEL_17;
      }
      v27 = [v23 excludedContent];
      if (([v27 containsObject:v5] & 1) == 0)
      {
        v28 = v23;
        goto LABEL_16;
      }
    }

    goto LABEL_17;
  }
  BOOL v9 = 1;
LABEL_35:

  return v9;
}

- (BOOL)isWebDomainShieldedWithWebURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v5];
  id v7 = [(STBlockingViewController *)self effectiveSettingsStore];
  uint64_t v8 = [v7 shield];
  BOOL v9 = [v8 webDomains];

  if (([v9 containsObject:v6] & 1) == 0)
  {
    id v11 = v4;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    id v63 = __Block_byref_object_copy_;
    v64 = __Block_byref_object_dispose_;
    id v65 = 0;
    char v12 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    id v13 = [MEMORY[0x263F318B0] sharedCategories];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __categoryForWebpageURL_block_invoke;
    v55[3] = &unk_26449B4C0;
    uint64_t v58 = &v60;
    id v14 = v11;
    id v56 = v14;
    id v15 = v12;
    id v57 = v15;
    uint64_t v59 = 1;
    [v13 categoryForDomainURL:v14 completionHandler:v55];

    [v15 lockWhenCondition:1];
    [v15 unlock];
    id v16 = (id)v61[5];

    _Block_object_dispose(&v60, 8);
    if (!v16)
    {
      BOOL v10 = 0;
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v17 = [v16 primaryWebDomain];
    id v18 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v17];
    if (v18 && ([v9 containsObject:v18] & 1) != 0)
    {
      BOOL v10 = 1;
LABEL_33:

      goto LABEL_34;
    }
    v52 = v17;
    id v19 = objc_alloc(MEMORY[0x263F53EC8]);
    v20 = [v16 identifier];
    v53 = (void *)[v19 initWithIdentifier:v20];

    v21 = [(STBlockingViewController *)self effectiveSettingsStore];
    id v22 = [v21 shield];
    v23 = [v22 webDomainCategories];

    uint64_t v24 = [v23 policy];
    id v54 = v23;
    if (v24 == 2)
    {
      v27 = [v23 excludedContent];
      if (([v27 containsObject:v6] & 1) == 0)
      {
        v28 = v23;
LABEL_16:
        v29 = [v28 excludedContent];
        char v30 = [v29 containsObject:v18];

        if ((v30 & 1) == 0)
        {
          BOOL v10 = 1;
          v36 = v54;
LABEL_32:

          uint64_t v17 = v52;
          goto LABEL_33;
        }
LABEL_17:
        v31 = [v16 canonicalBundleIdentifier];
        v32 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v31];
        if (!v32)
        {
          BOOL v10 = 0;
          v36 = v54;
LABEL_31:

          goto LABEL_32;
        }
        v49 = v18;
        v50 = v31;
        v33 = [(STBlockingViewController *)self effectiveSettingsStore];
        v34 = [v33 shield];
        v35 = [v34 applications];

        v51 = v35;
        if ([v35 containsObject:v32])
        {
          BOOL v10 = 1;
          v36 = v54;
          id v18 = v49;
          v31 = v50;
LABEL_30:

          goto LABEL_31;
        }
        v37 = [(STBlockingViewController *)self effectiveSettingsStore];
        v38 = [v37 shield];
        v39 = [v38 applicationCategories];

        uint64_t v40 = v39;
        uint64_t v41 = [v39 policy];
        if (v41 == 2)
        {
          v44 = [v39 excludedContent];
          int v48 = [v44 containsObject:v32];

          id v18 = v49;
          v31 = v50;
          if (!v48)
          {
LABEL_25:
            BOOL v10 = 1;
LABEL_29:

            v36 = v54;
            goto LABEL_30;
          }
        }
        else
        {
          id v18 = v49;
          v31 = v50;
          if (v41 == 1)
          {
            v42 = [v40 specificCategories];
            int v46 = [v42 containsObject:v53];

            if (v46)
            {
              v43 = [v40 excludedContent];
              char v47 = [v43 containsObject:v32];

              if ((v47 & 1) == 0) {
                goto LABEL_25;
              }
            }
          }
        }
        BOOL v10 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (v24 != 1) {
        goto LABEL_17;
      }
      v25 = [v23 specificCategories];
      int v26 = [v25 containsObject:v53];

      if (!v26) {
        goto LABEL_17;
      }
      v27 = [v23 excludedContent];
      if (([v27 containsObject:v6] & 1) == 0)
      {
        v28 = v23;
        goto LABEL_16;
      }
    }

    goto LABEL_17;
  }
  BOOL v10 = 1;
LABEL_35:

  return v10;
}

- (void)setOkButtonHandler:(id)a3
{
  id v4 = a3;
  [(STBlockingViewController *)self loadViewIfNeeded];
  id v5 = (void *)[v4 copy];

  id okButtonHandler = self->_okButtonHandler;
  self->_id okButtonHandler = v5;

  id v7 = [(STBlockingViewController *)self okButton];
  [v7 setHidden:v4 == 0];
}

+ (id)closeApplicationHandler
{
  return &__block_literal_global_0;
}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke()
{
  id v0 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  [v0 openApplication:@"com.apple.springboard" withOptions:0 completion:&__block_literal_global_51];
}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__STBlockingViewController_closeApplicationHandler__block_invoke_2_cold_1();
    }
  }
}

- (void)_ok:(id)a3
{
  id v3 = [(STBlockingViewController *)self okButtonHandler];
  v3[2]();
}

- (void)setChangePolicyButtonHidden:(BOOL)a3
{
  if (self->_changePolicyButtonHidden != a3)
  {
    self->_changePolicyButtonHidden = a3;
    [(STBlockingViewController *)self _updateButtons];
  }
}

- (void)_updateButtons
{
  id v3 = [(STBlockingViewController *)self okButtonHandler];
  id v4 = [(STBlockingViewController *)self okButton];
  [v4 setHidden:v3 == 0];

  [(STBlockingViewController *)self _updateAddContactButton];
  switch([(STBlockingViewController *)self policy])
  {
    case 0:
      BOOL v9 = [(STBlockingViewController *)self ignoreLimitButton];
      [v9 setHidden:1];

      BOOL v10 = [(STBlockingViewController *)self askForMoreTimeButton];
      [v10 setHidden:1];

      id v11 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
      [v11 setHidden:1];

      goto LABEL_7;
    case 1:
      char v12 = [(STBlockingViewController *)self askForMoreTimeButton];
      [v12 setHidden:1];

      id v13 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
      [v13 setHidden:1];

      BOOL v7 = [(STBlockingViewController *)self isChangePolicyButtonHidden];
      uint64_t v8 = [(STBlockingViewController *)self ignoreLimitButton];
      goto LABEL_6;
    case 2:
      id v14 = [(STBlockingViewController *)self ignoreLimitButton];
      [v14 setHidden:1];

      id v15 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
      [v15 setHidden:1];

      BOOL v7 = [(STBlockingViewController *)self isChangePolicyButtonHidden];
      uint64_t v8 = [(STBlockingViewController *)self askForMoreTimeButton];
      goto LABEL_6;
    case 3:
    case 4:
      id v5 = [(STBlockingViewController *)self ignoreLimitButton];
      [v5 setHidden:1];

      BOOL v6 = [(STBlockingViewController *)self askForMoreTimeButton];
      [v6 setHidden:1];

      BOOL v7 = [(STBlockingViewController *)self isChangePolicyButtonHidden];
      uint64_t v8 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
LABEL_6:
      id v16 = v8;
      [v8 setHidden:v7];

LABEL_7:
      [(STBlockingViewController *)self _hideCustomButtons];
      break;
    case 5:
      v31 = [(STBlockingViewController *)self okButton];
      [v31 setHidden:1];

      v32 = [(STBlockingViewController *)self ignoreLimitButton];
      [v32 setHidden:1];

      v33 = [(STBlockingViewController *)self askForMoreTimeButton];
      [v33 setHidden:1];

      v34 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
      [v34 setHidden:1];

      break;
    default:
      break;
  }
  uint64_t v17 = [(STBlockingViewController *)self okButton];
  if ([v17 isHidden]) {
    *(float *)&double v18 = 250.0;
  }
  else {
    *(float *)&double v18 = 750.0;
  }
  [v17 setContentCompressionResistancePriority:0 forAxis:v18];

  id v19 = [(STBlockingViewController *)self ignoreLimitButton];
  if ([v19 isHidden]) {
    *(float *)&double v20 = 250.0;
  }
  else {
    *(float *)&double v20 = 750.0;
  }
  [v19 setContentCompressionResistancePriority:0 forAxis:v20];

  v21 = [(STBlockingViewController *)self askForMoreTimeButton];
  if ([v21 isHidden]) {
    *(float *)&double v22 = 250.0;
  }
  else {
    *(float *)&double v22 = 750.0;
  }
  [v21 setContentCompressionResistancePriority:0 forAxis:v22];

  v23 = [(STBlockingViewController *)self enterScreenTimePasscodeButton];
  if ([v23 isHidden]) {
    *(float *)&double v24 = 250.0;
  }
  else {
    *(float *)&double v24 = 750.0;
  }
  [v23 setContentCompressionResistancePriority:0 forAxis:v24];

  v25 = [(STBlockingViewController *)self addContactButton];
  if ([v25 isHidden]) {
    *(float *)&double v26 = 250.0;
  }
  else {
    *(float *)&double v26 = 750.0;
  }
  [v25 setContentCompressionResistancePriority:0 forAxis:v26];

  v27 = [(STBlockingViewController *)self customPrimaryButton];
  if ([v27 isHidden]) {
    *(float *)&double v28 = 250.0;
  }
  else {
    *(float *)&double v28 = 750.0;
  }
  [v27 setContentCompressionResistancePriority:0 forAxis:v28];

  v29 = [(STBlockingViewController *)self customSecondaryButton];
  if ([v29 isHidden]) {
    *(float *)&double v30 = 250.0;
  }
  else {
    *(float *)&double v30 = 750.0;
  }
  [v29 setContentCompressionResistancePriority:0 forAxis:v30];

  if ([(STBlockingViewController *)self isShowingPolicyOptions]) {
    [(STBlockingViewController *)self dismissViewControllerAnimated:1 completion:0];
  }

  [(STBlockingViewController *)self setShowingPolicyOptions:0];
}

- (void)_updateAddContactButton
{
  id v13 = [(STBlockingViewController *)self formattedContactHandle];
  id v3 = [(STBlockingViewController *)self formattedContactHandle];
  if (v3) {
    BOOL v4 = [(STBlockingViewController *)self isChangePolicyButtonHidden];
  }
  else {
    BOOL v4 = 1;
  }

  id v5 = [(STBlockingViewController *)self addContactButton];
  BOOL v6 = v5;
  if (v4)
  {
    [v5 setHidden:1];
  }
  else
  {
    BOOL v7 = +[STScreenTimeUIBundle bundle];
    uint64_t v8 = [v7 localizedStringForKey:@"AddContactButtonFormat" value:&stru_26CF0D240 table:0];

    id v9 = [NSString alloc];
    BOOL v10 = [MEMORY[0x263EFF960] currentLocale];
    id v11 = objc_msgSend(v9, "initWithFormat:locale:", v8, v10, v13);

    char v12 = [MEMORY[0x263F1C490] plainButtonConfiguration];
    [v12 setTitle:v11];
    [v6 setConfiguration:v12];
    [v6 setHidden:0];
  }
}

- (void)_hideCustomButtons
{
  id v3 = [(STBlockingViewController *)self customPrimaryButton];
  [v3 setHidden:1];

  id v4 = [(STBlockingViewController *)self customSecondaryButton];
  [v4 setHidden:1];
}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forCategoryIdentifier:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    int v8 = _os_feature_enabled_impl();
    if (a3 == 5 && v8) {
      a3 = [(STBlockingViewController *)self _managedSettingsShieldPolicyForCategoryIdentifier:v7];
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"STBlockingViewController.m", 951, @"Invalid parameter not satisfying: %@", @"policy != DMFPolicyOK" object file lineNumber description];

    _os_feature_enabled_impl();
    a3 = 0;
  }
  if ([(STBlockingViewController *)self policy] == a3
    && ([(STBlockingViewController *)self categoryIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:v7],
        v9,
        v10))
  {
    id v11 = +[STBlockingUILog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:]();
    }
  }
  else
  {
    [(STBlockingViewController *)self setPolicy:a3];
    [(STBlockingViewController *)self setFormattedContactHandle:0];
    [(STBlockingViewController *)self setContactStore:0];
    [(STBlockingViewController *)self setCategoryIdentifier:v7];
    [(STBlockingViewController *)self setBundleIdentifier:0];
    [(STBlockingViewController *)self setWebDomain:0];
    switch(a3)
    {
      case 0:
        id v13 = [MEMORY[0x263F08690] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"STBlockingViewController.m" lineNumber:975 description:@"Do not pass DMFPolicyOK to an -updateAppearance method."];
        goto LABEL_19;
      case 1:
      case 2:
      case 4:
        char v12 = [MEMORY[0x263F318B8] localizedNameForIdentifier:v7];
        [(STBlockingViewController *)self _updateAppearanceForBlockedContent:v12 messageFormatKey:@"ReachedCategoryLimitMessageFormat" messageKey:@"ReachedCategoryLimitMessage"];

        break;
      case 3:
        [(STBlockingViewController *)self _updateAppearanceForAskPending];
        break;
      case 5:
        id v14 = [MEMORY[0x263F318B8] localizedNameForIdentifier:v7];
        id v18 = 0;
        id v15 = [MEMORY[0x263F53ED8] configurationForCategoryIdentifier:v7 categoryName:v14 error:&v18];
        id v13 = v18;
        if (!v15)
        {
          id v16 = +[STBlockingUILog log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:]();
          }
        }
        [(STBlockingViewController *)self _updateAppearanceWithCustomConfiguration:v15 defaultMessageFormatKey:@"RestrictedCategoryMessageFormat" defaultMessageArgument:v14];

LABEL_19:
        break;
      default:
        break;
    }
  }
}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    uint64_t v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"STBlockingViewController.m", 1024, @"Invalid parameter not satisfying: %@", @"policy != DMFPolicyOK" object file lineNumber description];
  }
  id v8 = v7;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  id v53 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
  int v10 = [MEMORY[0x263F318B0] sharedCategories];
  v43[0] = (id)MEMORY[0x263EF8330];
  v43[1] = (id)3221225472;
  v43[2] = __categoryForBundleIdentifier_block_invoke;
  v43[3] = &unk_26449B4C0;
  int v46 = &v48;
  id v11 = v8;
  id v44 = v11;
  id v12 = v9;
  id v45 = v12;
  uint64_t v47 = 1;
  [v10 categoryForBundleID:v11 completionHandler:v43];

  [v12 lockWhenCondition:1];
  [v12 unlock];
  id v13 = (id)v49[5];

  _Block_object_dispose(&v48, 8);
  int v14 = _os_feature_enabled_impl();
  if (a3 == 5 && v14) {
    a3 = [(STBlockingViewController *)self _managedSettingsShieldPolicyForBundleIdentifier:v11 category:v13];
  }
  if ([(STBlockingViewController *)self policy] == a3
    && ([(STBlockingViewController *)self bundleIdentifier],
        id v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isEqualToString:v11],
        v15,
        v16))
  {
    uint64_t v17 = +[STBlockingUILog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:]();
    }
  }
  else
  {
    [(STBlockingViewController *)self setPolicy:a3];
    [(STBlockingViewController *)self setFormattedContactHandle:0];
    [(STBlockingViewController *)self setContactStore:0];
    [(STBlockingViewController *)self setCategoryIdentifier:0];
    [(STBlockingViewController *)self setBundleIdentifier:v11];
    [(STBlockingViewController *)self setWebDomain:0];
    switch(a3)
    {
      case 0:
        double v26 = [MEMORY[0x263F08690] currentHandler];
        [v26 handleFailureInMethod:a2 object:self file:@"STBlockingViewController.m" lineNumber:1049 description:@"Do not pass DMFPolicyOK to an -updateAppearance method."];

        break;
      case 1:
      case 2:
      case 4:
        id v18 = v11;
        id v19 = objc_alloc(MEMORY[0x263F01878]);
        v43[0] = 0;
        double v20 = (void *)[v19 initWithBundleIdentifier:v18 allowPlaceholder:1 error:v43];
        id v21 = v43[0];
        double v22 = [v20 localizedName];

        v23 = v22;
        if (!v22)
        {
          double v24 = +[STBlockingUILog log];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:]();
          }

          v23 = v18;
        }
        id v25 = v23;

        [(STBlockingViewController *)self _updateAppearanceForBlockedContent:v25 messageFormatKey:@"ReachedApplicationLimitMessageFormat" messageKey:@"ReachedApplicationLimitMessage"];
        break;
      case 3:
        [(STBlockingViewController *)self _updateAppearanceForAskPending];
        break;
      case 5:
        if (v13)
        {
          v27 = (void *)MEMORY[0x263F53ED8];
          double v28 = [v13 identifier];
          v29 = [v13 localizedName];
          id v42 = 0;
          double v30 = [v27 configurationForBundleIdentifier:v11 categoryIdentifier:v28 categoryName:v29 error:&v42];
          id v31 = v42;

          if (!v30)
          {
            v32 = +[STBlockingUILog log];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:]();
            }
          }
        }
        else
        {
          double v30 = 0;
        }
        id v33 = v11;
        id v34 = objc_alloc(MEMORY[0x263F01878]);
        v43[0] = 0;
        v35 = (void *)[v34 initWithBundleIdentifier:v33 allowPlaceholder:1 error:v43];
        id v36 = v43[0];
        v37 = [v35 localizedName];

        v38 = v37;
        if (!v37)
        {
          v39 = +[STBlockingUILog log];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:]();
          }

          v38 = v33;
        }
        id v40 = v38;

        [(STBlockingViewController *)self _updateAppearanceWithCustomConfiguration:v30 defaultMessageFormatKey:@"RestrictedApplicationMessageFormat" defaultMessageArgument:v40];
        break;
      default:
        break;
    }
  }
}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forWebpageURL:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    if (!a3)
    {
      id v40 = [MEMORY[0x263F08690] currentHandler];
      [v40 handleFailureInMethod:a2, self, @"STBlockingViewController.m", 1134, @"Invalid parameter not satisfying: %@", @"policy != DMFPolicyOK" object file lineNumber description];
    }
    id v8 = [v7 host];
    id v9 = v7;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    id v54 = __Block_byref_object_copy_;
    id v55 = __Block_byref_object_dispose_;
    id v56 = 0;
    int v10 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    id v11 = [MEMORY[0x263F318B0] sharedCategories];
    uint64_t v43 = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    id v45 = __categoryForWebpageURL_block_invoke;
    int v46 = &unk_26449B4C0;
    v49 = &v51;
    id v12 = v9;
    id v47 = v12;
    id v13 = v10;
    id v48 = v13;
    uint64_t v50 = 1;
    [v11 categoryForDomainURL:v12 completionHandler:&v43];

    [v13 lockWhenCondition:1];
    [v13 unlock];
    id v14 = (id)v52[5];

    _Block_object_dispose(&v51, 8);
    int v15 = _os_feature_enabled_impl();
    if (a3 == 5 && v15) {
      a3 = [(STBlockingViewController *)self _managedSettingsShieldPolicyForWebURL:v12 category:v14];
    }
    int v16 = [(STBlockingViewController *)self webDomain];
    if ([(STBlockingViewController *)self policy] == a3
      && (v16 == v8 || [v16 isEqualToString:v8]))
    {
      uint64_t v17 = +[STBlockingUILog log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STBlockingViewController updateAppearanceUsingPolicy:forWebpageURL:]();
      }
    }
    else
    {
      [(STBlockingViewController *)self setPolicy:a3];
      [(STBlockingViewController *)self setFormattedContactHandle:0];
      [(STBlockingViewController *)self setContactStore:0];
      [(STBlockingViewController *)self setCategoryIdentifier:0];
      [(STBlockingViewController *)self setBundleIdentifier:0];
      [(STBlockingViewController *)self setWebDomain:v8];
      switch(a3)
      {
        case 0:
          id v31 = [MEMORY[0x263F08690] currentHandler];
          [v31 handleFailureInMethod:a2 object:self file:@"STBlockingViewController.m" lineNumber:1161 description:@"Do not pass DMFPolicyOK to an -updateAppearance method."];

          break;
        case 1:
        case 2:
        case 4:
          id v18 = v12;
          id v19 = [v18 host];
          if ([v19 length])
          {
            double v20 = v19;
            id v41 = v18;
            id v21 = v18;
            uint64_t v51 = 0;
            v52 = &v51;
            uint64_t v53 = 0x3032000000;
            id v54 = __Block_byref_object_copy_;
            id v55 = __Block_byref_object_dispose_;
            id v56 = 0;
            double v22 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
            v23 = [MEMORY[0x263F318B0] sharedCategories];
            uint64_t v43 = MEMORY[0x263EF8330];
            uint64_t v44 = 3221225472;
            id v45 = __categoryForWebpageURL_block_invoke;
            int v46 = &unk_26449B4C0;
            v49 = &v51;
            id v24 = v21;
            id v47 = v24;
            id v25 = v22;
            id v48 = v25;
            uint64_t v50 = 1;
            [v23 categoryForDomainURL:v24 completionHandler:&v43];

            [v25 lockWhenCondition:1];
            [v25 unlock];
            id v26 = (id)v52[5];

            _Block_object_dispose(&v51, 8);
            v27 = [v26 canonicalBundleIdentifier];
            if (!v27
              || (double v28 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v27 allowPlaceholder:1 error:0], objc_msgSend(v28, "localizedName"), v29 = objc_claimAutoreleasedReturnValue(), v28, !v29))
            {
              double v30 = [v26 primaryWebDomain];
              v29 = objc_msgSend(v30, "_lp_userVisibleHost");
            }
            id v19 = v20;
            if (![v29 length])
            {
              uint64_t v39 = objc_msgSend(v20, "_lp_userVisibleHost");

              v29 = (void *)v39;
            }

            id v18 = v41;
          }
          else
          {
            v29 = 0;
          }

          [(STBlockingViewController *)self _updateAppearanceForBlockedContent:v29 messageFormatKey:@"ReachedWebsiteLimitMessageFormat" messageKey:@"ReachedWebsiteLimitMessage"];
          break;
        case 3:
          [(STBlockingViewController *)self _updateAppearanceForAskPending];
          break;
        case 5:
          v32 = 0;
          if ([v8 length] && v14)
          {
            id v33 = (void *)MEMORY[0x263F53ED8];
            id v34 = [v14 identifier];
            v35 = [v14 localizedName];
            id v42 = 0;
            v32 = [v33 configurationForWebDomain:v8 categoryIdentifier:v34 categoryName:v35 error:&v42];
            id v36 = v42;

            if (!v32)
            {
              v37 = +[STBlockingUILog log];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:]();
              }
            }
          }
          v38 = [v8 _lp_userVisibleHost];
          [(STBlockingViewController *)self _updateAppearanceWithCustomConfiguration:v32 defaultMessageFormatKey:@"RestrictedWebDomainMessageFormat" defaultMessageArgument:v38];

          break;
        default:
          break;
      }
    }
  }
  else
  {
    id v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STBlockingViewController updateAppearanceUsingPolicy:forWebpageURL:]();
    }
  }
}

- (int64_t)_managedSettingsShieldPolicyForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F53EC8]) initWithIdentifier:v4];
  BOOL v6 = [(STBlockingViewController *)self effectiveSettingsStore];
  id v7 = [v6 screenTime];
  id v8 = [v7 categoryShieldPolicies];

  uint64_t v9 = [v8 objectForKeyedSubscript:v5];
  int v10 = (void *)v9;
  if (v9) {
    BOOL v11 = v9 == *MEMORY[0x263F53E68];
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = +[STBlockingUILog log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:]();
    }

    id v13 = [MEMORY[0x263F53EC8] all];
    uint64_t v14 = [v8 objectForKeyedSubscript:v13];

    int v10 = (void *)v14;
  }

  int v15 = +[STBlockingUILog log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:]();
  }

  int64_t v16 = [(STBlockingViewController *)self _dmfPolicyFromScreenTimeShieldPolicy:v10];
  return v16;
}

- (int64_t)_managedSettingsShieldPolicyForBundleIdentifier:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v6];
  uint64_t v9 = [(STBlockingViewController *)self effectiveSettingsStore];
  int v10 = [v9 screenTime];
  BOOL v11 = [v10 applicationShieldPolicies];

  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  id v13 = (void *)v12;
  uint64_t v14 = (void *)*MEMORY[0x263F53E68];
  if (v12) {
    BOOL v15 = v12 == (void)v14;
  }
  else {
    BOOL v15 = 1;
  }
  char v16 = !v15;
  unint64_t v17 = 0x26B54C000uLL;
  if (v7 && (v16 & 1) == 0)
  {
    uint64_t v44 = [v7 canonicalBundleIdentifier];
    if (v44)
    {
      id v18 = +[STBlockingUILog log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.5();
      }

      id v19 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v44];
      double v20 = [v11 objectForKeyedSubscript:v19];

      if (v20 && v20 != v14) {
        goto LABEL_33;
      }
    }
    else
    {
      double v20 = v13;
    }
    uint64_t v43 = [v7 primaryWebDomain];
    if (v43)
    {
      id v21 = +[STBlockingUILog log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.4();
      }
      id v22 = v6;

      v23 = [(STBlockingViewController *)self effectiveSettingsStore];
      id v24 = [v23 screenTime];
      id v25 = [v24 webDomainShieldPolicies];

      id v26 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v43];
      v27 = [v25 objectForKeyedSubscript:v26];

      if (v27)
      {
        id v6 = v22;
        unint64_t v17 = 0x26B54C000;
        if (v27 != v14)
        {
LABEL_32:

          double v20 = v27;
LABEL_33:

          id v13 = v20;
          goto LABEL_34;
        }
      }
      else
      {
        id v6 = v22;
        unint64_t v17 = 0x26B54C000uLL;
      }
    }
    else
    {
      v27 = v20;
    }
    uint64_t v28 = [v7 identifier];
    v29 = [(id)(v17 + 336) log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:]();
    }
    id v41 = v6;

    id v42 = (void *)v28;
    double v30 = (void *)[objc_alloc(MEMORY[0x263F53EC8]) initWithIdentifier:v28];
    id v31 = [(STBlockingViewController *)self effectiveSettingsStore];
    v32 = [v31 screenTime];
    id v33 = [v32 categoryShieldPolicies];

    id v34 = [v33 objectForKeyedSubscript:v30];

    if (!v34 || v34 == v14)
    {
      v35 = +[STBlockingUILog log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:]();
      }

      id v36 = [MEMORY[0x263F53EC8] all];
      uint64_t v37 = [v33 objectForKeyedSubscript:v36];

      id v34 = (void *)v37;
    }
    unint64_t v17 = 0x26B54C000uLL;

    v27 = v34;
    id v6 = v41;
    goto LABEL_32;
  }
LABEL_34:

  v38 = [(id)(v17 + 336) log];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:]();
  }

  int64_t v39 = [(STBlockingViewController *)self _dmfPolicyFromScreenTimeShieldPolicy:v13];
  return v39;
}

- (int64_t)_managedSettingsShieldPolicyForWebURL:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = [a3 host];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v7];
  uint64_t v9 = [(STBlockingViewController *)self effectiveSettingsStore];
  int v10 = [v9 screenTime];
  BOOL v11 = [v10 webDomainShieldPolicies];

  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  id v13 = (void *)v12;
  uint64_t v14 = (void *)*MEMORY[0x263F53E68];
  if (v12) {
    BOOL v15 = v12 == (void)v14;
  }
  else {
    BOOL v15 = 1;
  }
  char v16 = !v15;
  if (v6 && (v16 & 1) == 0)
  {
    uint64_t v43 = [v6 primaryWebDomain];
    if (v43)
    {
      unint64_t v17 = +[STBlockingUILog log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.5();
      }

      id v18 = (void *)[objc_alloc(MEMORY[0x263F53F08]) initWithDomain:v43];
      uint64_t v19 = [v11 objectForKeyedSubscript:v18];

      id v13 = (void *)v19;
    }
    if (!v13 || v13 == v14)
    {
      id v42 = [v6 canonicalBundleIdentifier];
      if (v42)
      {
        double v20 = +[STBlockingUILog log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.4();
        }

        id v21 = [(STBlockingViewController *)self effectiveSettingsStore];
        id v22 = [v21 screenTime];
        v23 = [v22 applicationShieldPolicies];

        id v24 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v42];
        uint64_t v25 = [v23 objectForKeyedSubscript:v24];

        id v13 = (void *)v25;
      }
      if (!v13 || v13 == v14)
      {
        uint64_t v26 = [v6 identifier];
        v27 = +[STBlockingUILog log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:]();
        }
        id v40 = v7;

        id v41 = (void *)v26;
        uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F53EC8]) initWithIdentifier:v26];
        v29 = [(STBlockingViewController *)self effectiveSettingsStore];
        double v30 = [v29 screenTime];
        id v31 = [v30 categoryShieldPolicies];

        v32 = [v31 objectForKeyedSubscript:v28];

        if (!v32 || v32 == v14)
        {
          id v34 = +[STBlockingUILog log];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:]();
          }

          v35 = [MEMORY[0x263F53EC8] all];
          id v33 = v31;
          uint64_t v36 = [v31 objectForKeyedSubscript:v35];

          v32 = (void *)v36;
        }
        else
        {
          id v33 = v31;
        }
        id v7 = v40;

        id v13 = v32;
      }
    }
  }

  uint64_t v37 = +[STBlockingUILog log];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:]();
  }

  int64_t v38 = [(STBlockingViewController *)self _dmfPolicyFromScreenTimeShieldPolicy:v13];
  return v38;
}

- (int64_t)_dmfPolicyFromScreenTimeShieldPolicy:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if ([(id)*MEMORY[0x263F53E70] isEqualToString:v3])
    {
      int64_t v4 = 1;
    }
    else if ([(id)*MEMORY[0x263F53E50] isEqualToString:v3])
    {
      int64_t v4 = 2;
    }
    else if ([(id)*MEMORY[0x263F53E58] isEqualToString:v3])
    {
      int64_t v4 = 3;
    }
    else if ([(id)*MEMORY[0x263F53E60] isEqualToString:v3])
    {
      int64_t v4 = 4;
    }
    else
    {
      int64_t v4 = 5;
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (void)_updateAppearanceForAskPending
{
  [(STBlockingViewController *)self loadViewIfNeeded];
  id v3 = [(STBlockingViewController *)self communicationLimitView];
  [v3 setHidden:1];

  int64_t v4 = [(STBlockingViewController *)self hourglassView];
  [v4 setHidden:0];

  id v9 = +[STScreenTimeUIBundle bundle];
  id v5 = [v9 localizedStringForKey:@"RequestSentTitle" value:&stru_26CF0D240 table:0];
  id v6 = [(STBlockingViewController *)self titleLabel];
  [v6 setText:v5];

  id v7 = [v9 localizedStringForKey:@"RequestSentMessage" value:&stru_26CF0D240 table:0];
  id v8 = [(STBlockingViewController *)self messageLabel];
  [v8 setText:v7];

  [(STBlockingViewController *)self _updateButtons];
}

- (void)updateAppearanceUsingBlockedContactHandles:(id)a3 contactNameByHandle:(id)a4 forBundleIdentifier:(id)a5 isApplicationCurrentlyLimited:(BOOL)a6 contactStore:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v14 count];
  if (!v15)
  {
    id v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"STBlockingViewController.m", 1461, @"Invalid parameter not satisfying: %@", @"blockedContactsCount > 0" object file lineNumber description];
  }
  [(STBlockingViewController *)self setPolicy:0];
  [(STBlockingViewController *)self setCategoryIdentifier:0];
  [(STBlockingViewController *)self setBundleIdentifier:0];
  [(STBlockingViewController *)self setWebDomain:0];
  [(STBlockingViewController *)self setContactStore:v12];

  [(STBlockingViewController *)self loadViewIfNeeded];
  id v35 = +[STScreenTimeUIBundle bundle];
  char v16 = [v14 objectAtIndexedSubscript:0];

  unint64_t v17 = [v13 objectForKeyedSubscript:v16];

  if (v17)
  {
    if (v7) {
      id v18 = @"BlockedContactNameDowntimeMessageFormat";
    }
    else {
      id v18 = @"BlockedContactNameMessageFormat";
    }
    uint64_t v19 = [v35 localizedStringForKey:v18 value:&stru_26CF0D240 table:0];
    id v20 = v17;

    char v16 = v20;
  }
  else if ([v16 destinationIdIsPhoneNumber])
  {
    if (v7) {
      id v21 = @"BlockedPhoneNumberDowntimeMessageFormat";
    }
    else {
      id v21 = @"BlockedPhoneNumberMessageFormat";
    }
    uint64_t v19 = [v35 localizedStringForKey:v21 value:&stru_26CF0D240 table:0];
    id v22 = TUNetworkCountryCode();
    v23 = v22;
    if (!v22)
    {
      v23 = TUHomeCountryCode();
    }
    uint64_t v24 = TUFormattedPhoneNumber();

    if (!v22) {
    char v16 = (void *)v24;
    }
  }
  else
  {
    if ([v16 destinationIdIsEmailAddress])
    {
      uint64_t v25 = @"BlockedEmailAddressMessageFormat";
      uint64_t v26 = @"BlockedEmailAddressDowntimeMessageFormat";
    }
    else
    {
      uint64_t v25 = @"BlockedContactNameMessageFormat";
      uint64_t v26 = @"BlockedContactNameDowntimeMessageFormat";
    }
    if (v7) {
      v27 = v26;
    }
    else {
      v27 = v25;
    }
    uint64_t v19 = [v35 localizedStringForKey:v27 value:&stru_26CF0D240 table:0];
  }
  uint64_t v28 = [(STBlockingViewController *)self hourglassView];
  [v28 setHidden:v7 ^ 1];

  v29 = [(STBlockingViewController *)self communicationLimitView];
  [v29 setHidden:v7];

  double v30 = [v35 localizedStringForKey:@"RestrictedContactTitle" value:&stru_26CF0D240 table:0];
  id v31 = [(STBlockingViewController *)self titleLabel];
  [v31 setText:v30];

  v32 = [NSString localizedStringWithValidatedFormat:v19, @"%lu %@", 0, v15 - 1, v16 validFormatSpecifiers error];
  id v33 = [(STBlockingViewController *)self messageLabel];
  [v33 setText:v32];

  [(STBlockingViewController *)self setFormattedContactHandle:v16];
  [(STBlockingViewController *)self _updateButtons];
}

- (void)_updateAppearanceForBlockedContent:(id)a3 messageFormatKey:(id)a4 messageKey:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  [(STBlockingViewController *)self loadViewIfNeeded];
  int v10 = +[STScreenTimeUIBundle bundle];
  if ([v22 length])
  {
    BOOL v11 = [v10 localizedStringForKey:v8 value:&stru_26CF0D240 table:0];
    id v12 = [NSString localizedStringWithValidatedFormat:v11, @"%@", 0, v22 validFormatSpecifiers error];
  }
  else
  {
    id v12 = [v10 localizedStringForKey:v9 value:&stru_26CF0D240 table:0];
  }
  id v13 = [(STBlockingViewController *)self communicationLimitView];
  [v13 setHidden:1];

  id v14 = [(STBlockingViewController *)self hourglassView];
  [v14 setHidden:0];

  uint64_t v15 = [(STBlockingViewController *)self titleLabel];
  char v16 = [v10 localizedStringForKey:@"TimeLimitTitle" value:&stru_26CF0D240 table:0];
  [v15 setText:v16];

  unint64_t v17 = [(STBlockingViewController *)self messageLabel];
  [v17 setText:v12];
  id v18 = [(STBlockingViewController *)self customImageView];
  [v18 setHidden:1];

  uint64_t v19 = [MEMORY[0x263F1C480] effectWithStyle:9];
  id v20 = [(STBlockingViewController *)self view];
  [v20 setEffect:v19];

  id v21 = [MEMORY[0x263F1C550] labelColor];
  [v15 setTextColor:v21];
  [v17 setTextColor:v21];
  [(STBlockingViewController *)self _updateButtons];
}

- (void)showWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  BOOL v7 = [(STBlockingViewController *)self hourglassView];
  id v8 = v7;
  if (v4 && v7)
  {
    [v7 setInitialState];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke;
    v16[3] = &unk_26449B270;
    id v17 = v8;
    id v18 = v6;
    id v9 = (void *)MEMORY[0x223C21E30](v16);
    int v10 = (void *)MEMORY[0x263F1CB60];
    id v14 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_3;
    v15[3] = &unk_26449B298;
    v15[4] = self;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_4;
    v13[3] = &unk_26449B2C0;
    id v11 = v9;
    [v10 animateWithDuration:v15 animations:v13 completion:0.2];
  }
  else
  {
    [v7 setStateName:0x26CF0D760];
    id v12 = [(STBlockingViewController *)self view];
    [v12 setAlpha:1.0];

    if (v6) {
      v6[2](v6);
    }
  }
}

void __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_2;
  v2[3] = &unk_26449B248;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 animateToStateName:0x26CF0D760 completionHandler:v2];
}

uint64_t __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hideWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  BOOL v7 = [(STBlockingViewController *)self hourglassView];
  id v8 = [(STBlockingViewController *)self view];
  id v9 = v8;
  if (v4 && v7)
  {
    [v8 setUserInteractionEnabled:0];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke;
    v11[3] = &unk_26449B310;
    v11[4] = self;
    id v12 = v9;
    id v13 = v6;
    id v10 = v9;
    [v7 animateToStateName:0x26CF0D780 completionHandler:v11];
  }
  else
  {
    [v8 setAlpha:0.0];

    if (v6) {
      v6[2](v6);
    }
  }
}

void __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_2;
  v6[3] = &unk_26449B298;
  v6[4] = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_3;
  v3[3] = &unk_26449B2E8;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 animateWithDuration:v6 animations:v3 completion:0.25];
}

void __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_showIgnoreLimitOptions:(id)a3
{
  id v4 = +[STScreenTimeUIBundle bundle];
  id v5 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v6 = [v5 userInterfaceIdiom] == 1;

  BOOL v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:v6];
  if ([(STBlockingViewController *)self shouldAllowOneMoreMinute])
  {
    id v8 = [v4 localizedStringForKey:@"OneMoreMinuteButtonTitle" value:&stru_26CF0D240 table:0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke;
    v19[3] = &unk_26449B338;
    v19[4] = self;
    id v9 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:0 handler:v19];
    [v7 addAction:v9];
  }
  id v10 = [v4 localizedStringForKey:@"RemindMeIn15MinutesButtonTitle" value:&stru_26CF0D240 table:0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_2;
  v18[3] = &unk_26449B338;
  v18[4] = self;
  id v11 = [MEMORY[0x263F1C3F0] actionWithTitle:v10 style:0 handler:v18];
  [v7 addAction:v11];

  id v12 = [v4 localizedStringForKey:@"IgnoreLimitForTodayButtonTitle" value:&stru_26CF0D240 table:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_3;
  v17[3] = &unk_26449B338;
  v17[4] = self;
  id v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v12 style:0 handler:v17];
  [v7 addAction:v13];

  id v14 = [v4 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_4;
  v16[3] = &unk_26449B338;
  void v16[4] = self;
  uint64_t v15 = [MEMORY[0x263F1C3F0] actionWithTitle:v14 style:1 handler:v16];
  [v7 addAction:v15];

  [(STBlockingViewController *)self presentViewController:v7 animated:1 completion:0];
  [(STBlockingViewController *)self setShowingPolicyOptions:1];
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _oneMoreMinute:0];
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:900.0];
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:0.0];
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingPolicyOptions:0];
}

- (id)_ignoreLimitMenuProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__STBlockingViewController__ignoreLimitMenuProvider__block_invoke;
  v4[3] = &unk_26449B360;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C21E30](v4, a2);

  return v2;
}

id __52__STBlockingViewController__ignoreLimitMenuProvider__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) shouldAllowOneMoreMinute])
  {
    v2 = [*(id *)(a1 + 32) _oneMoreMinuteAction];
  }
  else
  {
    v2 = 0;
  }
  id v3 = [*(id *)(a1 + 32) _remindMeIn15MinutesAction];
  uint64_t v4 = [*(id *)(a1 + 32) _ignoreForTodayAction];
  id v5 = (void *)v4;
  if (v2)
  {
    id v14 = v2;
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    BOOL v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = &v14;
    uint64_t v8 = 3;
  }
  else
  {
    id v12 = v3;
    uint64_t v13 = v4;
    BOOL v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = &v12;
    uint64_t v8 = 2;
  }
  id v9 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16);
  id v10 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26CF0D240 children:v9];

  return v10;
}

- (id)_oneMoreMinuteAction
{
  id v3 = +[STScreenTimeUIBundle bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"OneMoreMinuteButtonTitle" value:&stru_26CF0D240 table:0];

  id v5 = (void *)MEMORY[0x263F1C3C0];
  BOOL v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"hourglass.badge.plus"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__STBlockingViewController__oneMoreMinuteAction__block_invoke;
  v9[3] = &unk_26449B388;
  v9[4] = self;
  BOOL v7 = [v5 actionWithTitle:v4 image:v6 identifier:0 handler:v9];

  return v7;
}

uint64_t __48__STBlockingViewController__oneMoreMinuteAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _oneMoreMinute:0];
}

- (id)_remindMeIn15MinutesAction
{
  id v3 = +[STScreenTimeUIBundle bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"RemindMeIn15MinutesButtonTitle" value:&stru_26CF0D240 table:0];

  id v5 = (void *)MEMORY[0x263F1C3C0];
  BOOL v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"clock"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__STBlockingViewController__remindMeIn15MinutesAction__block_invoke;
  v9[3] = &unk_26449B388;
  v9[4] = self;
  BOOL v7 = [v5 actionWithTitle:v4 image:v6 identifier:0 handler:v9];

  return v7;
}

uint64_t __54__STBlockingViewController__remindMeIn15MinutesAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:900.0];
}

- (id)_ignoreForTodayAction
{
  id v3 = +[STScreenTimeUIBundle bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"IgnoreLimitForTodayButtonTitle" value:&stru_26CF0D240 table:0];

  id v5 = (void *)MEMORY[0x263F1C3C0];
  BOOL v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark.circle"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__STBlockingViewController__ignoreForTodayAction__block_invoke;
  v9[3] = &unk_26449B388;
  v9[4] = self;
  BOOL v7 = [v5 actionWithTitle:v4 image:v6 identifier:0 handler:v9];

  return v7;
}

uint64_t __49__STBlockingViewController__ignoreForTodayAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:0.0];
}

- (void)_ignoreLimitForAdditionalTime:(double)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke;
  v5[3] = &unk_26449B400;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  uint64_t v4 = (void (**)(void))MEMORY[0x223C21E30](v5, a2);
  if (_os_feature_enabled_impl()) {
    v4[2](v4);
  }
  else {
    [(STBlockingViewController *)self hideWithAnimation:1 completionHandler:v4];
  }
}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _askForTimeResource];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_2;
  v4[3] = &unk_26449B3D8;
  void v4[5] = v3;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "approveAdditionalTime:completionHandler:", v4);
}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F08A48] mainQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3;
  v7[3] = &unk_26449B3B0;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 addOperationWithBlock:v7];
}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3_cold_1(a1, v2, v3);
    }

    [*(id *)(a1 + 40) showWithAnimation:1 completionHandler:0];
  }
  else
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"BlockingViewDidHide" object:*(void *)(a1 + 40)];
  }
}

- (void)_showAskForMoreTimeOptions:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke;
  v3[3] = &unk_26449B298;
  void v3[4] = self;
  [(STBlockingViewController *)self _unlockDeviceIfNeededWithCompletionHandler:v3];
}

void __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke(uint64_t a1)
{
  v2 = +[STScreenTimeUIBundle bundle];
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  uint64_t v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:v4];
  if ([*(id *)(a1 + 32) shouldAllowOneMoreMinute])
  {
    id v6 = [v2 localizedStringForKey:@"OneMoreMinuteButtonTitle" value:&stru_26CF0D240 table:0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_2;
    v17[3] = &unk_26449B338;
    v17[4] = *(void *)(a1 + 32);
    BOOL v7 = [MEMORY[0x263F1C3F0] actionWithTitle:v6 style:0 handler:v17];
    [v5 addAction:v7];
  }
  if ([*(id *)(a1 + 32) shouldRequestMoreTime])
  {
    id v8 = [v2 localizedStringForKey:@"SendRequestButtonTitle" value:&stru_26CF0D240 table:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_3;
    v16[3] = &unk_26449B338;
    void v16[4] = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:0 handler:v16];
    [v5 addAction:v9];
  }
  uint64_t v10 = [v2 localizedStringForKey:@"EnterScreenTimePasscodePromptButtonTitle" value:&stru_26CF0D240 table:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_4;
  v15[3] = &unk_26449B338;
  v15[4] = *(void *)(a1 + 32);
  id v11 = [MEMORY[0x263F1C3F0] actionWithTitle:v10 style:0 handler:v15];
  [v5 addAction:v11];

  id v12 = [v2 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_5;
  v14[3] = &unk_26449B338;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v12 style:1 handler:v14];
  [v5 addAction:v13];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  [*(id *)(a1 + 32) setShowingPolicyOptions:1];
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _oneMoreMinute:0];
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequest:0];
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enterScreenTimePasscode:0];
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingPolicyOptions:0];
}

- (id)_askForMoreTimeMenuProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__STBlockingViewController__askForMoreTimeMenuProvider__block_invoke;
  v4[3] = &unk_26449B360;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C21E30](v4, a2);

  return v2;
}

id __55__STBlockingViewController__askForMoreTimeMenuProvider__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  if ([*(id *)(a1 + 32) shouldAllowOneMoreMinute])
  {
    id v3 = [*(id *)(a1 + 32) _oneMoreMinuteAction];
    [v2 addObject:v3];
  }
  if ([*(id *)(a1 + 32) shouldRequestMoreTime])
  {
    BOOL v4 = [*(id *)(a1 + 32) _sendRequestAction];
    [v2 addObject:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 32) _enterScreenTimePasscodeAction];
  [v2 addObject:v5];

  id v6 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26CF0D240 children:v2];

  return v6;
}

- (id)_sendRequestAction
{
  id v3 = +[STScreenTimeUIBundle bundle];
  BOOL v4 = [v3 localizedStringForKey:@"SendRequestButtonTitle" value:&stru_26CF0D240 table:0];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__STBlockingViewController__sendRequestAction__block_invoke;
  v7[3] = &unk_26449B388;
  void v7[4] = self;
  uint64_t v5 = [MEMORY[0x263F1C3C0] actionWithTitle:v4 image:0 identifier:0 handler:v7];

  return v5;
}

uint64_t __46__STBlockingViewController__sendRequestAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequest:0];
}

- (id)_enterScreenTimePasscodeAction
{
  id v3 = +[STScreenTimeUIBundle bundle];
  BOOL v4 = [v3 localizedStringForKey:@"EnterScreenTimePasscodePromptButtonTitle" value:&stru_26CF0D240 table:0];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__STBlockingViewController__enterScreenTimePasscodeAction__block_invoke;
  v7[3] = &unk_26449B388;
  void v7[4] = self;
  uint64_t v5 = [MEMORY[0x263F1C3C0] actionWithTitle:v4 image:0 identifier:0 handler:v7];

  return v5;
}

uint64_t __58__STBlockingViewController__enterScreenTimePasscodeAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enterScreenTimePasscode:0];
}

- (void)_oneMoreMinute:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke;
  v3[3] = &unk_26449B298;
  void v3[4] = self;
  [(STBlockingViewController *)self hideWithAnimation:1 completionHandler:v3];
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _askForTimeResource];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke_2;
  v3[3] = &unk_26449B428;
  void v3[4] = *(void *)(a1 + 32);
  [v2 approveOneMoreMinuteWithCompletionHandler:v3];
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x263F08A48] mainQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke_3;
  v7[3] = &unk_26449B200;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 addOperationWithBlock:v7];
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __43__STBlockingViewController__oneMoreMinute___block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    [*(id *)(a1 + 40) showWithAnimation:1 completionHandler:0];
  }
  else
  {
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"BlockingViewDidHide" object:*(void *)(a1 + 40)];
  }
}

- (void)_sendRequest:(id)a3
{
  uint64_t v4 = [(STBlockingViewController *)self _askForTimeResource];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__STBlockingViewController__sendRequest___block_invoke;
  v5[3] = &unk_26449B428;
  v5[4] = self;
  [v4 requestAdditionalTime:v5 completionHandler:3600.0];
}

void __41__STBlockingViewController__sendRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__STBlockingViewController__sendRequest___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setPolicy:3];
    uint64_t v5 = [MEMORY[0x263F08A48] mainQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__STBlockingViewController__sendRequest___block_invoke_2;
    v6[3] = &unk_26449B298;
    v6[4] = *(void *)(a1 + 32);
    [v5 addOperationWithBlock:v6];
  }
}

uint64_t __41__STBlockingViewController__sendRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearanceForAskPending];
}

- (void)_enterScreenTimePasscode:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__STBlockingViewController__enterScreenTimePasscode___block_invoke;
  v3[3] = &unk_26449B298;
  void v3[4] = self;
  [(STBlockingViewController *)self _unlockDeviceIfNeededWithCompletionHandler:v3];
}

uint64_t __53__STBlockingViewController__enterScreenTimePasscode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__didFinishEnteringScreenTimePasscode_ name:@"com.apple.screentime.restrictions.did-finish" object:0 suspensionBehavior:4];

  return +[STRemotePasscodeController activateRemotePINUI];
}

- (void)_didFinishEnteringScreenTimePasscode:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F087C8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:@"com.apple.screentime.restrictions.did-finish" object:0];

  uint64_t v7 = [v5 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"success"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = [MEMORY[0x263F08A48] mainQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __65__STBlockingViewController__didFinishEnteringScreenTimePasscode___block_invoke;
    v11[3] = &unk_26449B298;
    v11[4] = self;
    [v10 addOperationWithBlock:v11];
  }
}

uint64_t __65__STBlockingViewController__didFinishEnteringScreenTimePasscode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPasscodeApprovedOptions];
}

- (void)_showPasscodeApprovedOptions
{
  id v3 = +[STScreenTimeUIBundle bundle];
  uint64_t v4 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v5 = [v4 userInterfaceIdiom] == 1;

  uint64_t v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:v5];
  uint64_t v7 = [v3 localizedStringForKey:@"ApproveFor15MinutesButtonTitle" value:&stru_26CF0D240 table:0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke;
  v18[3] = &unk_26449B338;
  v18[4] = self;
  uint64_t v8 = [MEMORY[0x263F1C3F0] actionWithTitle:v7 style:0 handler:v18];
  [v6 addAction:v8];

  int v9 = [v3 localizedStringForKey:@"ApproveForHourButtonTitle" value:&stru_26CF0D240 table:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_2;
  v17[3] = &unk_26449B338;
  v17[4] = self;
  id v10 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:0 handler:v17];
  [v6 addAction:v10];

  id v11 = [v3 localizedStringForKey:@"ApproveAllDayButtonTitle" value:&stru_26CF0D240 table:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_3;
  v16[3] = &unk_26449B338;
  void v16[4] = self;
  id v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v11 style:0 handler:v16];
  [v6 addAction:v12];

  uint64_t v13 = [v3 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_4;
  v15[3] = &unk_26449B338;
  v15[4] = self;
  id v14 = [MEMORY[0x263F1C3F0] actionWithTitle:v13 style:1 handler:v15];
  [v6 addAction:v14];

  [(STBlockingViewController *)self presentViewController:v6 animated:1 completion:0];
  [(STBlockingViewController *)self setShowingPolicyOptions:1];
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:900.0];
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:3600.0];
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ignoreLimitForAdditionalTime:0.0];
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingPolicyOptions:0];
}

- (id)_askForTimeResource
{
  id v3 = [(STBlockingViewController *)self categoryIdentifier];
  uint64_t v4 = [(STBlockingViewController *)self bundleIdentifier];
  uint64_t v5 = [(STBlockingViewController *)self webDomain];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F670D0]) initWithCategoryIdentifier:v3 changeHandler:&__block_literal_global_200];
LABEL_7:
    uint64_t v8 = (void *)v7;
    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F670C0]) initWithBundleIdentifier:v4 changeHandler:&__block_literal_global_200];
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F670F8]) initWithWebsiteDomain:v5 changeHandler:&__block_literal_global_200];
    goto LABEL_7;
  }
  id v10 = +[STBlockingUILog log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[STBlockingViewController _askForTimeResource]();
  }

  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

void __47__STBlockingViewController__askForTimeResource__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = +[STBlockingUILog log];
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = a2;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_21E199000, v10, OS_LOG_TYPE_DEFAULT, "Changed to Ask For Time state %ld, amount granted %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __47__STBlockingViewController__askForTimeResource__block_invoke_cold_1();
  }
}

- (void)_addContact:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__STBlockingViewController__addContact___block_invoke;
  v3[3] = &unk_26449B298;
  void v3[4] = self;
  [(STBlockingViewController *)self _unlockDeviceIfNeededWithCompletionHandler:v3];
}

uint64_t __40__STBlockingViewController__addContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addContact];
}

- (void)_addContact
{
  int v9 = [(STBlockingViewController *)self addContactHandler];
  if (v9)
  {
    id v3 = [(STBlockingViewController *)self addContactButton];
    v9[2](v9, v3);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFEBF8];
    id v5 = [(STBlockingViewController *)self _newContact];
    id v3 = [v4 viewControllerForNewContact:v5];

    [v3 setDelegate:self];
    uint64_t v6 = [(STBlockingViewController *)self contactStore];
    [v3 setContactStore:v6];

    id v7 = [(STBlockingViewController *)self _iCloudContainer];
    [v3 setParentContainer:v7];

    id v8 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v3];
    [(STBlockingViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (id)_newContact
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = [(STBlockingViewController *)self formattedContactHandle];
  if ([v4 destinationIdIsPhoneNumber])
  {
    id v5 = [objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v4];
    id v6 = objc_alloc(MEMORY[0x263EFEAD0]);
    id v7 = (void *)[v6 initWithLabel:*MEMORY[0x263EFE8D0] value:v5];
    v14[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v3 setPhoneNumbers:v8];

LABEL_5:
    goto LABEL_6;
  }
  if ([v4 destinationIdIsEmailAddress])
  {
    id v9 = objc_alloc(MEMORY[0x263EFEAD0]);
    id v5 = [v9 initWithLabel:*MEMORY[0x263EFE8C0] value:v4];
    __int16 v13 = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v3 setEmailAddresses:v7];
    goto LABEL_5;
  }
  id v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    uint64_t v12 = v4;
    _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "Failed to identify handle type for: %{public}@", (uint8_t *)&v11, 0xCu);
  }
LABEL_6:

  return v3;
}

- (id)_iCloudContainer
{
  id v3 = [(STBlockingViewController *)self managementState];
  id v16 = 0;
  uint64_t v4 = [v3 primaryiCloudCardDAVAccountIdentifierWithError:&v16];
  id v5 = v16;

  if (v4)
  {
    id v6 = [MEMORY[0x263EFEA80] predicateForContainersInAccountWithExternalIdentifier:v4];
    id v7 = [(STBlockingViewController *)self contactStore];
    id v15 = v5;
    id v8 = [v7 containersMatchingPredicate:v6 error:&v15];
    id v9 = v15;

    if ([v8 count])
    {
      id v10 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      int v11 = +[STBlockingUILog log];
      uint64_t v12 = v11;
      if (v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "No iCloud container found for user", v14, 2u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[STBlockingViewController _iCloudContainer]();
      }

      id v10 = 0;
    }
  }
  else
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STBlockingViewController _iCloudContainer]();
    }
    id v10 = 0;
    id v9 = v5;
  }

  return v10;
}

- (void)_unlockDeviceIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STBlockingViewController *)self lockScreenService];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__STBlockingViewController__unlockDeviceIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_26449B2C0;
  id v8 = v4;
  id v6 = v4;
  [v5 requestPasscodeUnlockUIWithOptions:0 withCompletion:v7];
}

void __71__STBlockingViewController__unlockDeviceIfNeededWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F08A48] mainQueue];
    [v3 addOperationWithBlock:*(void *)(a1 + 32)];
  }
}

- (void)_updateAppearanceWithCustomConfiguration:(id)a3 defaultMessageFormatKey:(id)a4 defaultMessageArgument:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v132 = a4;
  [(STBlockingViewController *)self loadViewIfNeeded];
  id v10 = [(STBlockingViewController *)self view];
  int v11 = [v8 backgroundColorData];
  id v12 = v10;
  id v13 = v11;
  unint64_t v14 = 0x263F08000uLL;
  if (v13)
  {
    [v12 setHidden:0];
    id v15 = v13;
    id v136 = 0;
    id v16 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v136];
    id v17 = v136;
    if (!v16)
    {
      id v18 = +[STBlockingUILog log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  [v12 setBackgroundColor:v16];
  uint64_t v19 = [v8 backgroundEffectData];
  id v20 = v12;
  if (v19)
  {
    id v21 = (void *)MEMORY[0x263F08928];
    uint64_t v22 = objc_opt_class();
    id v136 = 0;
    v23 = [v21 unarchivedObjectOfClass:v22 fromData:v19 error:&v136];
    id v24 = v136;
    if (v23)
    {
      [v20 setEffect:v23];
    }
    else
    {
      uint64_t v25 = +[STBlockingUILog log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.7();
      }

      uint64_t v26 = [MEMORY[0x263F1C480] effectWithStyle:9];
      [v20 setEffect:v26];
    }
  }
  else
  {
    id v24 = [MEMORY[0x263F1C480] effectWithStyle:9];
    [v20 setEffect:v24];
  }

  uint64_t v27 = [v8 iconData];
  v127 = (void *)v27;
  v128 = v20;
  if (v27)
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v27];
    if (v28)
    {
      v29 = [(STBlockingViewController *)self hourglassView];
      [v29 setHidden:1];

      double v30 = [(STBlockingViewController *)self communicationLimitView];
      [v30 setHidden:1];

      id v31 = [(STBlockingViewController *)self customImageView];
      [v31 setImage:v28];
      [v31 setHidden:0];
    }
    else
    {
      v32 = +[STBlockingUILog log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.6();
      }

      [(STBlockingViewController *)self _showDefaultHourglassView];
    }
  }
  else
  {
    [(STBlockingViewController *)self _showDefaultHourglassView];
  }
  v135 = +[STScreenTimeUIBundle bundle];
  id v33 = [v135 localizedStringForKey:@"RestrictedTitle" value:&stru_26CF0D240 table:0];
  id v34 = [(STBlockingViewController *)self titleLabel];
  id v35 = [v8 title];
  uint64_t v36 = [MEMORY[0x263F1C550] labelColor];
  id v37 = v34;
  id v38 = v35;
  id v39 = v33;
  id v40 = v36;
  id v134 = v8;
  if (v38)
  {
    id v130 = v9;
    id v41 = [v38 text];
    if (v41) {
      id v42 = v41;
    }
    else {
      id v42 = v39;
    }
    [v37 setText:v42];
    uint64_t v43 = [v38 colorData];
    id v44 = v40;
    v123 = self;
    id v45 = v39;
    if (v43)
    {
      int v46 = (void *)MEMORY[0x263F08928];
      uint64_t v47 = objc_opt_class();
      id v136 = 0;
      id v48 = [v46 unarchivedObjectOfClass:v47 fromData:v43 error:&v136];
      id v49 = v136;
      if (!v48)
      {
        uint64_t v50 = +[STBlockingUILog log];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
        }

        unint64_t v14 = 0x263F08000;
      }
    }
    else
    {
      id v48 = 0;
    }
    if (v48) {
      uint64_t v51 = v48;
    }
    else {
      uint64_t v51 = v44;
    }
    id v52 = v51;

    [v37 setTextColor:v52];
    id v8 = v134;
    id v39 = v45;
    self = v123;
    id v9 = v130;
  }
  else
  {
    [v37 setText:v39];
    [v37 setTextColor:v40];
  }

  v126 = v39;
  uint64_t v53 = [v135 localizedStringForKey:v132 value:&stru_26CF0D240 table:0];

  v125 = (void *)v53;
  id v54 = [NSString localizedStringWithValidatedFormat:v53, @"%@", 0, v9 validFormatSpecifiers error];

  id v55 = [(STBlockingViewController *)self messageLabel];
  id v56 = [v8 subtitle];
  id v57 = [MEMORY[0x263F1C550] labelColor];
  id v58 = v55;
  id v59 = v56;
  id v60 = v54;
  id v61 = v57;
  v133 = v60;
  if (v59)
  {
    uint64_t v62 = [v59 text];
    if (v62) {
      id v63 = v62;
    }
    else {
      id v63 = v60;
    }
    [v58 setText:v63];
    v64 = [v59 colorData];
    id v65 = v61;
    if (v64)
    {
      v66 = *(void **)(v14 + 2344);
      uint64_t v67 = objc_opt_class();
      id v136 = 0;
      v68 = [v66 unarchivedObjectOfClass:v67 fromData:v64 error:&v136];
      id v69 = v136;
      if (!v68)
      {
        v70 = +[STBlockingUILog log];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
        }

        id v8 = v134;
      }
    }
    else
    {
      v68 = 0;
    }
    if (v68) {
      v71 = v68;
    }
    else {
      v71 = v65;
    }
    id v72 = v71;

    [v58 setTextColor:v72];
    unint64_t v14 = 0x263F08000uLL;
    id v60 = v133;
  }
  else
  {
    [v58 setText:v60];
    [v58 setTextColor:v61];
  }

  [(STBlockingViewController *)self _updateButtons];
  v73 = [(STBlockingViewController *)self customPrimaryButton];
  v74 = [v135 localizedStringForKey:@"OKButtonTitle" value:&stru_26CF0D240 table:0];
  v75 = [(STBlockingViewController *)self _primaryButtonConfiguration];
  v76 = [v8 primaryButtonColorData];
  v77 = [MEMORY[0x263F1C550] systemBlueColor];
  id v78 = v76;
  if (v78)
  {
    v79 = *(void **)(v14 + 2344);
    uint64_t v80 = objc_opt_class();
    id v136 = 0;
    v81 = [v79 unarchivedObjectOfClass:v80 fromData:v78 error:&v136];
    id v82 = v136;
    if (!v81)
    {
      v83 = +[STBlockingUILog log];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
      }

      unint64_t v14 = 0x263F08000;
    }
  }
  else
  {
    v81 = 0;
  }
  if (v81) {
    v84 = v81;
  }
  else {
    v84 = v77;
  }
  id v85 = v84;

  v86 = [v75 background];
  [v86 setBackgroundColor:v85];

  v87 = [v8 primaryButtonLabel];
  v88 = [MEMORY[0x263F1C550] whiteColor];
  id v89 = v73;
  id v90 = v87;
  id v91 = v74;
  id v92 = v88;
  id v93 = v75;
  v129 = v89;
  v131 = v91;
  if (v90)
  {
    [v89 setHidden:0];
    uint64_t v94 = [v90 text];
    v95 = (void *)v94;
    if (v94) {
      id v96 = (id)v94;
    }
    else {
      id v96 = v91;
    }
    [v93 setTitle:v96];
    v97 = [v90 colorData];
    id v98 = v92;
    if (v97)
    {
      v99 = *(void **)(v14 + 2344);
      uint64_t v100 = objc_opt_class();
      id v136 = 0;
      v101 = [v99 unarchivedObjectOfClass:v100 fromData:v97 error:&v136];
      id v102 = v136;
      if (!v101)
      {
        v103 = +[STBlockingUILog log];
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
        }
      }
      id v8 = v134;
    }
    else
    {
      v101 = 0;
    }
    if (v101) {
      v104 = v101;
    }
    else {
      v104 = v98;
    }
    id v105 = v104;

    [v93 setBaseForegroundColor:v105];
    id v89 = v129;
    [v129 setConfiguration:v93];

    unint64_t v14 = 0x263F08000uLL;
    id v91 = v131;
  }
  else
  {
    [v89 setHidden:1];
    [v93 setTitle:v91];
    [v93 setBaseForegroundColor:v92];
    [v89 setConfiguration:v93];
  }

  v106 = [(STBlockingViewController *)self customSecondaryButton];
  v107 = [(STBlockingViewController *)self _secondaryButtonConfiguration];
  v108 = [v8 secondaryButtonLabel];
  v109 = [MEMORY[0x263F1C550] systemBlueColor];
  id v110 = v106;
  id v111 = v108;
  id v112 = v109;
  id v113 = v107;
  if (v111)
  {
    [v110 setHidden:0];
    v114 = [v111 text];
    [v113 setTitle:v114];
    v115 = [v111 colorData];
    id v116 = v112;
    if (v115)
    {
      v117 = *(void **)(v14 + 2344);
      uint64_t v118 = objc_opt_class();
      id v136 = 0;
      v119 = [v117 unarchivedObjectOfClass:v118 fromData:v115 error:&v136];
      id v120 = v136;
      if (!v119)
      {
        v124 = +[STBlockingUILog log];
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:]();
        }
      }
    }
    else
    {
      v119 = 0;
    }
    if (v119) {
      v121 = v119;
    }
    else {
      v121 = v116;
    }
    id v122 = v121;

    [v113 setBaseForegroundColor:v122];
    [v110 setConfiguration:v113];

    id v8 = v134;
    id v89 = v129;
  }
  else
  {
    [v110 setHidden:1];
    [v113 setTitle:0];
    [v113 setBaseForegroundColor:v112];
    [v110 setConfiguration:v113];
  }

  if ([v110 isHidden]) {
    [v89 setHidden:0];
  }
}

- (id)_primaryButtonConfiguration
{
  uint64_t v2 = [(STBlockingViewController *)self customPrimaryButton];
  id v3 = [MEMORY[0x263F1C490] filledButtonConfiguration];
  id v4 = [MEMORY[0x263F1C460] clearConfiguration];
  id v5 = [v2 configuration];
  id v6 = [v5 background];
  [v6 cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");

  id v7 = [v2 configuration];
  id v8 = [v7 background];
  id v9 = [v8 backgroundColor];
  [v4 setBackgroundColor:v9];

  [v3 setBackground:v4];

  return v3;
}

- (id)_secondaryButtonConfiguration
{
  return (id)[MEMORY[0x263F1C490] plainButtonConfiguration];
}

- (void)_showDefaultHourglassView
{
  id v3 = [(STBlockingViewController *)self hourglassView];
  [v3 setHidden:0];

  id v4 = [(STBlockingViewController *)self communicationLimitView];
  [v4 setHidden:1];

  id v5 = [(STBlockingViewController *)self customImageView];
  [v5 setHidden:1];
}

- (void)_customButtonPressed:(id)a3
{
  uint64_t v4 = [a3 tag];
  id v5 = [(STBlockingViewController *)self bundleIdentifier];
  id v6 = [(STBlockingViewController *)self categoryIdentifier];
  uint64_t v7 = [(STBlockingViewController *)self webDomain];
  id v8 = (void *)v7;
  if (v5)
  {
    id v9 = [MEMORY[0x263F318B0] sharedCategories];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __49__STBlockingViewController__customButtonPressed___block_invoke;
    v18[3] = &unk_26449B498;
    uint64_t v21 = v4;
    id v19 = v5;
    id v20 = self;
    [v9 categoryForBundleID:v19 completionHandler:v18];

    id v10 = v19;
LABEL_3:

    goto LABEL_6;
  }
  if (v6)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_220;
    v17[3] = &unk_26449B470;
    v17[4] = self;
    void v17[5] = v4;
    [MEMORY[0x263F53ED8] handleAction:v4 categoryIdentifier:v6 completionHandler:v17];
    goto LABEL_6;
  }
  if (v7)
  {
    int v11 = [MEMORY[0x263F318B0] sharedCategories];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_2_221;
    v13[3] = &unk_26449B498;
    uint64_t v16 = v4;
    id v14 = v8;
    id v15 = self;
    [v11 categoryForDomainName:v14 completionHandler:v13];

    id v10 = v14;
    goto LABEL_3;
  }
  id v12 = +[STBlockingUILog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[STBlockingViewController _customButtonPressed:]();
  }

LABEL_6:
}

void __49__STBlockingViewController__customButtonPressed___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x263F53ED8];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    id v9 = [a2 identifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_2;
    v11[3] = &unk_26449B470;
    uint64_t v10 = a1[6];
    v11[4] = a1[5];
    void v11[5] = v10;
    [v6 handleAction:v7 bundleIdentifier:v8 categoryIdentifier:v9 completionHandler:v11];
  }
  else
  {
    id v9 = +[STBlockingUILog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1();
    }
  }
}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCustomButtonResponse:a2 forAction:*(void *)(a1 + 40) error:a3];
}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCustomButtonResponse:a2 forAction:*(void *)(a1 + 40) error:a3];
}

void __49__STBlockingViewController__customButtonPressed___block_invoke_2_221(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x263F53ED8];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    id v9 = [a2 identifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_3;
    v11[3] = &unk_26449B470;
    uint64_t v10 = a1[6];
    v11[4] = a1[5];
    void v11[5] = v10;
    [v6 handleAction:v7 webDomain:v8 categoryIdentifier:v9 completionHandler:v11];
  }
  else
  {
    id v9 = +[STBlockingUILog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1();
    }
  }
}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCustomButtonResponse:a2 forAction:*(void *)(a1 + 40) error:a3];
}

- (void)_handleCustomButtonResponse:(id)a3 forAction:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v8 integerValue];
  }
  else
  {
    int v11 = +[STBlockingUILog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STBlockingViewController _handleCustomButtonResponse:forAction:error:]((uint64_t)v9, a4, v11);
    }

    uint64_t v10 = a4 == 1;
  }
  switch(v10)
  {
    case 2:
      id v13 = +[STBlockingUILog log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E199000, v13, OS_LOG_TYPE_DEFAULT, "Deferring response and updating appearance.", buf, 2u);
      }

      [(STBlockingViewController *)self setPolicy:0];
      id v14 = [(STBlockingViewController *)self bundleIdentifier];
      id v15 = [(STBlockingViewController *)self categoryIdentifier];
      uint64_t v16 = [(STBlockingViewController *)self webDomain];
      id v17 = (void *)v16;
      if (v14)
      {
        id v18 = [MEMORY[0x263F08A48] mainQueue];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_222;
        v29[3] = &unk_26449B200;
        v29[4] = self;
        id v30 = v14;
        [v18 addOperationWithBlock:v29];

        id v19 = v30;
      }
      else
      {
        if (!v15)
        {
          if (v16)
          {
            uint64_t v22 = objc_opt_new();
            [v22 setHost:v17];
            v23 = [MEMORY[0x263F08A48] mainQueue];
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_3;
            v25[3] = &unk_26449B200;
            v25[4] = self;
            id v26 = v22;
            id v24 = v22;
            [v23 addOperationWithBlock:v25];
          }
          else
          {
            id v24 = +[STBlockingUILog log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              -[STBlockingViewController _handleCustomButtonResponse:forAction:error:]();
            }
          }

          goto LABEL_22;
        }
        uint64_t v21 = [MEMORY[0x263F08A48] mainQueue];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_2;
        v27[3] = &unk_26449B200;
        v27[4] = self;
        id v28 = v15;
        [v21 addOperationWithBlock:v27];

        id v19 = v28;
      }

LABEL_22:
LABEL_23:

      break;
    case 1:
      id v20 = +[STBlockingUILog log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E199000, v20, OS_LOG_TYPE_DEFAULT, "Closing current application.", buf, 2u);
      }

      id v14 = [MEMORY[0x263F08A48] mainQueue];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke;
      v31[3] = &unk_26449B298;
      v31[4] = self;
      [v14 addOperationWithBlock:v31];
      goto LABEL_23;
    case 0:
      id v12 = +[STBlockingUILog log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "No response needed.", buf, 2u);
      }

      break;
  }
}

void __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke()
{
  id v0 = [(id)objc_opt_class() closeApplicationHandler];
  v0[2]();
}

uint64_t __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_222(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearanceUsingPolicy:5 forBundleIdentifier:*(void *)(a1 + 40)];
}

uint64_t __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearanceUsingPolicy:5 forCategoryIdentifier:*(void *)(a1 + 40)];
}

void __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) URL];
  [v1 updateAppearanceUsingPolicy:5 forWebpageURL:v2];
}

- (void)contextMenuWillDisplayForButton:(id)a3
{
}

- (void)contextMenuWillEndForButton:(id)a3
{
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
}

- (id)okButtonHandler
{
  return self->_okButtonHandler;
}

- (BOOL)isChangePolicyButtonHidden
{
  return self->_changePolicyButtonHidden;
}

- (id)addContactHandler
{
  return objc_getProperty(self, a2, 992, 1);
}

- (void)setAddContactHandler:(id)a3
{
}

- (BOOL)fullScreenBehavior
{
  return self->_fullScreenBehavior;
}

- (void)setFullScreenBehavior:(BOOL)a3
{
  self->_fullScreenBehavior = a3;
}

- (STHourglassView)hourglassView
{
  return (STHourglassView *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setHourglassView:(id)a3
{
}

- (UIImageView)communicationLimitView
{
  return (UIImageView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setCommunicationLimitView:(id)a3
{
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setMessageLabel:(id)a3
{
}

- (UIButton)okButton
{
  return (UIButton *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setOkButton:(id)a3
{
}

- (STMenuButton)ignoreLimitButton
{
  return (STMenuButton *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setIgnoreLimitButton:(id)a3
{
}

- (STMenuButton)askForMoreTimeButton
{
  return (STMenuButton *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setAskForMoreTimeButton:(id)a3
{
}

- (UIButton)enterScreenTimePasscodeButton
{
  return (UIButton *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setEnterScreenTimePasscodeButton:(id)a3
{
}

- (UIButton)addContactButton
{
  return (UIButton *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setAddContactButton:(id)a3
{
}

- (UIImageView)customImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCustomImageView:(id)a3
{
}

- (UIButton)customPrimaryButton
{
  return (UIButton *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setCustomPrimaryButton:(id)a3
{
}

- (UIButton)customSecondaryButton
{
  return (UIButton *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setCustomSecondaryButton:(id)a3
{
}

- (SBSLockScreenService)lockScreenService
{
  return (SBSLockScreenService *)objc_getProperty(self, a2, 1096, 1);
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSString)formattedContactHandle
{
  return (NSString *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setFormattedContactHandle:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 1128, 1);
}

- (BOOL)isShowingPolicyOptions
{
  return self->_showingPolicyOptions;
}

- (void)setShowingPolicyOptions:(BOOL)a3
{
  self->_showingPolicyOptions = a3;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)webDomain
{
  return (NSString *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setWebDomain:(id)a3
{
}

- (MOEffectiveSettingsStore)effectiveSettingsStore
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 1160, 1);
}

- (MOCancellable)effectiveSettingsSubscription
{
  return (MOCancellable *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setEffectiveSettingsSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveSettingsSubscription, 0);
  objc_storeStrong((id *)&self->_effectiveSettingsStore, 0);
  objc_storeStrong((id *)&self->_webDomain, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_formattedContactHandle, 0);
  objc_storeStrong((id *)&self->_lockScreenService, 0);
  objc_storeStrong((id *)&self->_customSecondaryButton, 0);
  objc_storeStrong((id *)&self->_customPrimaryButton, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_addContactButton, 0);
  objc_storeStrong((id *)&self->_enterScreenTimePasscodeButton, 0);
  objc_storeStrong((id *)&self->_askForMoreTimeButton, 0);
  objc_storeStrong((id *)&self->_ignoreLimitButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_communicationLimitView, 0);
  objc_storeStrong((id *)&self->_hourglassView, 0);
  objc_storeStrong(&self->_addContactHandler, 0);

  objc_storeStrong(&self->_okButtonHandler, 0);
}

- (void)shouldAllowOneMoreMinute
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21E199000, v0, v1, "Failed to fetch One More Minute policy for %{public}@: %{public}@");
}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to return to Home Screen: %@", v2, v3, v4, v5, v6);
}

- (void)updateAppearanceUsingPolicy:forCategoryIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21E199000, v0, v1, "Policy didn't change for category “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
}

- (void)updateAppearanceUsingPolicy:forCategoryIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21E199000, v0, v1, "Failed to fetch custom configuration for %{public}@ %{public}@");
}

- (void)updateAppearanceUsingPolicy:forBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21E199000, v0, v1, "Policy didn't change for bundle identifier “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
}

- (void)updateAppearanceUsingPolicy:forBundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21E199000, v0, v1, "Failed to get application record for %{public}@ %{public}@");
}

- (void)updateAppearanceUsingPolicy:forWebpageURL:.cold.1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_21E199000, v0, OS_LOG_TYPE_ERROR, "Received a nil webpageURL. This should never be the case.", v1, 2u);
}

- (void)updateAppearanceUsingPolicy:forWebpageURL:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21E199000, v0, v1, "Policy didn't change for web domain “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
}

- (void)_managedSettingsShieldPolicyForCategoryIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Got Screen Time shield policy “%{public}@” for category identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForCategoryIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for category identifier “%{public}@”, trying the all category", v2, v3, v4, v5, v6);
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Got Screen Time shield policy “%{public}@” for bundle identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying the category identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying primary web domain “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying the canonical bundle identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Got Screen Time shield policy “%{public}@” for domain “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying the category identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying the canonical bundle identifier “%{public}@”");
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying primary web domain “%{public}@”");
}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&void v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2(&dword_21E199000, (uint64_t)a2, a3, "Failed to ignore limit for %f more seconds: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__STBlockingViewController__sendRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to send a request for more time: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_askForTimeResource
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_21E199000, v0, v1, "Tried to create a STAskForTimeResource without a category identifier, bundle identifier, or web domain.", v2, v3, v4, v5, v6);
}

void __47__STBlockingViewController__askForTimeResource__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Changed to unknown Ask For Time State: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_iCloudContainer
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to fetch Contact containers: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to unarchive color %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to create image from data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21E199000, v0, v1, "Failed to unarchive background effect for %{public}@: %{public}@");
}

- (void)_customButtonPressed:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_21E199000, v0, v1, "Custom button pressed with no bundle identifier, category identifier, or web domain.", v2, v3, v4, v5, v6);
}

void __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21E199000, v1, v2, "Failed to fetch category for %{public}@: %{public}@.", (void)v3, DWORD2(v3));
}

- (void)_handleCustomButtonResponse:forAction:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_21E199000, v0, v1, "Received custom shield response with no bundle identifier, category identifier, or web domain.", v2, v3, v4, v5, v6);
}

- (void)_handleCustomButtonResponse:(uint64_t)a1 forAction:(uint64_t)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2(&dword_21E199000, a2, a3, "Failed to get response for action %ld: %{public}@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end