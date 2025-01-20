@interface PSWalletPolicyController
- (PSWalletPolicyController)initWithBundleIdentifier:(id)a3;
- (id)specifier;
- (id)walletAuthorizationType;
@end

@implementation PSWalletPolicyController

- (PSWalletPolicyController)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSWalletPolicyController;
  v6 = [(PSWalletPolicyController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v8 = (void *)getFKPrivacySettingsControllerClass_softClass;
    uint64_t v18 = getFKPrivacySettingsControllerClass_softClass;
    if (!getFKPrivacySettingsControllerClass_softClass)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getFKPrivacySettingsControllerClass_block_invoke;
      v14[3] = &unk_1E5C5D4D8;
      v14[4] = &v15;
      __getFKPrivacySettingsControllerClass_block_invoke((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = v8;
    _Block_object_dispose(&v15, 8);
    uint64_t v10 = [[v9 alloc] initWithBundleIdentifier:v7->_bundleIdentifier];
    privacyController = v7->_privacyController;
    v7->_privacyController = v10;
  }
  return v7;
}

- (id)walletAuthorizationType
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [self->_privacyController authorizationType];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (id)specifier
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  if (([v3 containsObject:self->_bundleIdentifier] & 1) != 0
    || [v4 containsObject:self->_bundleIdentifier])
  {
    id v5 = PSBundlePathForPreferenceBundle(@"Privacy/WalletPrivacySettings");
    v6 = SFRuntimeAbsoluteFilePathForPath();

    v7 = [MEMORY[0x1E4F28B50] bundleWithPath:v6];
    if (v7)
    {
      v8 = PS_LocalizedStringForSystemPolicy(@"WALLET");
      v9 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_walletAuthorizationType, [v7 classNamed:@"WalletPrivacySettings.FinanceDataAuthorizationLevelController"], 2, 0);

      [v9 setProperty:self->_bundleIdentifier forKey:@"bundleID"];
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v10 userInterfaceIdiom]) {
        v11 = @"com.apple.PassbookStub";
      }
      else {
        v11 = @"com.apple.Passbook";
      }
      [v9 setObject:v11 forKeyedSubscript:@"appIDForLazyIcon"];

      v12 = PS_LocalizedStringForSystemPolicy(@"WALLET_SELECTED_ACCOUNTS");
      v16[0] = v12;
      objc_super v13 = PS_LocalizedStringForSystemPolicy(@"WALLET_NO_ACCOUNTS");
      v16[1] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      [v9 setValues:&unk_1EFB74300 titles:v14];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
}

@end