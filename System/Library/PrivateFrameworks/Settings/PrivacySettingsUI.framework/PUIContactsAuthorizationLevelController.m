@interface PUIContactsAuthorizationLevelController
- (BOOL)isAppLinkedWithContactsLimitedAccessSupportedSDK;
- (NSBundle)entityBundle;
- (NSDictionary)details;
- (NSNumber)limitedAccessCount;
- (NSString)displayName;
- (NSString)serviceKey;
- (PSSpecifier)fullAccessSpecifier;
- (PSSpecifier)limitedAccessSpecifier;
- (id)_limitedAccessSectionSpecifiers;
- (id)_parentTCCSpecifiers;
- (id)_pickerUsageSectionSpecifiers;
- (id)footerStringForSpecifiers:(id)a3;
- (id)specifiers;
- (unint64_t)_currentTCCAuthorizationRight;
- (void)_addLimitedAccessSection;
- (void)_addPickerUsageSectionIfNeeded;
- (void)_handleContactStoreDidChangeNotification:(id)a3;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)_presentContactsPickerForModifyingSelection;
- (void)_removeLimitedAccessSectionIfPresent;
- (void)_removePickerUsageSectionIfPresent;
- (void)contactPicker:(Class)a3 didSelectContacts:(id)a4;
- (void)dealloc;
- (void)setDetails:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEntityBundle:(id)a3;
- (void)setFullAccessSpecifier:(id)a3;
- (void)setLimitedAccessCount:(id)a3;
- (void)setLimitedAccessSpecifier:(id)a3;
- (void)setServiceKey:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateContactsCountSubtitleForSpecifier:(id)a3 contactsTCCAccess:(int)a4;
- (void)viewDidLoad;
@end

@implementation PUIContactsAuthorizationLevelController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PUIContactsAuthorizationLevelController;
  [(PSListItemsController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleContactStoreDidChangeNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PUIContactsPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"PUIContactsPrivacyUpgradePromptCompletedNotification" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F1AF80] object:0];

  v5.receiver = self;
  v5.super_class = (Class)PUIContactsAuthorizationLevelController;
  [(PSListItemsController *)&v5 dealloc];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"PUIContactsPrivacyUpgradePromptAppIdentifierKey"];
  v6 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PUIContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E6E9C758;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __76__PUIContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  id v4 = [(PUIContactsAuthorizationLevelController *)self fullAccessSpecifier];
  [(PUIContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v4 contactsTCCAccess:2];
  [(PUIContactsAuthorizationLevelController *)self reloadSpecifier:v4];
}

- (unint64_t)_currentTCCAuthorizationRight
{
  if (_currentTCCAuthorizationRight_onceToken != -1) {
    dispatch_once(&_currentTCCAuthorizationRight_onceToken, &__block_literal_global_6);
  }
  [(NSString *)self->_serviceKey cStringUsingEncoding:4];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  id v5 = (id)tcc_identity_create();
  tcc_server_message_get_authorization_records_by_identity();
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  _currentTCCAuthorizationRight_tccServer = tcc_server_create();
  return MEMORY[0x1F41817F8]();
}

void __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_service();
    int v7 = (void *)[[NSString alloc] initWithCString:tcc_service_get_name() encoding:4];
    if ([v7 isEqualToString:@"kTCCServiceAddressBook"]) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = tcc_authorization_record_get_authorization_right();
    }
  }
  else
  {
    uint64_t v8 = _PUILoggingFacility();
    uint64_t v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting Contacts authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_parentTCCSpecifiers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PUIContactsAuthorizationLevelController;
  v2 = [(PSListItemsController *)&v38 specifiers];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  uint64_t v6 = (int *)MEMORY[0x1E4F92F28];
  if (v5)
  {
    uint64_t v7 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(char **)(*((void *)&v34 + 1) + 8 * i);
        if (*(void *)&v9[*v6] == 3)
        {
          int v10 = [v9 identifier];
          int v11 = [v10 intValue];

          if (v11 == 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    uint64_t v28 = *MEMORY[0x1E4F930A8];
    char v16 = v5 ^ 1;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(char **)(*((void *)&v30 + 1) + 8 * j);
        v19 = [v18 identifier];
        uint64_t v20 = [v19 intValue];

        uint64_t v21 = *(void *)&v18[*v6];
        if (v21 != 3 || v20 != 4)
        {
          if (v21 == 3) {
            char v23 = v16;
          }
          else {
            char v23 = 1;
          }
          if ((v23 & 1) != 0 || v20)
          {
            if (v21 == 3 && (v20 - 1) <= 1)
            {
              [v18 setProperty:objc_opt_class() forKey:v28];
              [(PUIContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v18 contactsTCCAccess:v20];
            }
          }
          else
          {
            v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
            [v18 setIdentifier:v24];
          }
          [v3 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  v26 = (void *)[v3 copy];
  return v26;
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUIContactsAuthorizationLevelController;
  id v4 = a3;
  [(PUIContactsAuthorizationLevelController *)&v9 setSpecifier:v4];
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  uint64_t v7 = [v4 propertyForKey:@"appLocalizedDisplayName"];

  displayName = self->_displayName;
  self->_displayName = v7;
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  if (!*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(PUIContactsAuthorizationLevelController *)v2 _currentTCCAuthorizationRight];
    uint64_t v5 = [(PUIContactsAuthorizationLevelController *)v2 specifier];
    uint64_t v6 = [v5 propertyForKey:@"hasPickerInfo"];
    int v7 = [v6 BOOLValue];
    if (v4 == 2) {
      int v8 = 0;
    }
    else {
      int v8 = v7;
    }

    objc_super v9 = [(PUIContactsAuthorizationLevelController *)v2 specifier];
    int v10 = [v9 propertyForKey:@"hasTCCOptions"];
    int v11 = [v10 BOOLValue];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v11)
    {
      uint64_t v13 = [(PUIContactsAuthorizationLevelController *)v2 _parentTCCSpecifiers];
      [v12 addObjectsFromArray:v13];
      uint64_t v14 = [v13 firstObject];
      uint64_t v15 = [(PUIContactsAuthorizationLevelController *)v2 footerStringForSpecifiers:v12];
      if (v15) {
        [v14 setProperty:v15 forKey:*MEMORY[0x1E4F93170]];
      }
      char v16 = [(PUIContactsAuthorizationLevelController *)v2 _limitedAccessSectionSpecifiers];
      [v12 addObjectsFromArray:v16];
    }
    v17 = [(PUIContactsAuthorizationLevelController *)v2 _pickerUsageSectionSpecifiers];
    v18 = v17;
    if (v8)
    {
      if ((v11 & 1) == 0)
      {
        v19 = [v17 firstObject];
        uint64_t v20 = PUI_LocalizedStringForPrivacy(@"CONTACTS_AUTH_HEADER");
        [v19 setName:v20];
      }
      [v12 addObjectsFromArray:v18];
    }
    uint64_t v21 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v12;
  }
  objc_sync_exit(v2);

  v22 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  return v22;
}

- (id)_pickerUsageSectionSpecifiers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = bundleIdentifiersWithPickerAccess();
  if ([v3 containsObject:self->_serviceKey])
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    if (!pickerUsageSectionSpecifiers)
    {
      uint64_t v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:0];
      uint64_t v6 = *MEMORY[0x1E4F93188];
      [v5 setProperty:@"CONTACTS_PICKER_INFO_GROUP" forKey:*MEMORY[0x1E4F93188]];
      int v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
      [v7 setProperty:@"CONTACTS_PICKER_INFO_CELL" forKey:v6];
      int v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
      [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93218]];

      [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
      v13[0] = v5;
      v13[1] = v7;
      objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      int v10 = self->_pickerUsageSectionSpecifiers;
      self->_pickerUsageSectionSpecifiers = v9;

      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    }
    int v11 = pickerUsageSectionSpecifiers;
  }
  else
  {
    int v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_limitedAccessSectionSpecifiers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (!self->_limitedAccessSectionSpecifiers)
  {
    uint64_t v3 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    uint64_t v4 = *MEMORY[0x1E4F93188];
    [v3 setProperty:@"CONTACTS_MANUAL_SELECTION_GROUP" forKey:*MEMORY[0x1E4F93188]];
    uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v6 = PUI_LocalizedStringForPrivacy(@"CONTACTS_MANUAL_SELECTION_BUTTON");
    int v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

    int v8 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93130]];

    [v7 setProperty:@"CONTACTS_MANUAL_SELECTION_BUTTON" forKey:v4];
    [v7 setButtonAction:sel__presentContactsPickerForModifyingSelection];
    v13[0] = v3;
    v13[1] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    self->_limitedAccessSectionSpecifiers = v9;
  }
  if ([(PUIContactsAuthorizationLevelController *)self _currentTCCAuthorizationRight] == 3) {
    int v11 = self->_limitedAccessSectionSpecifiers;
  }
  else {
    int v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (void)updateContactsCountSubtitleForSpecifier:(id)a3 contactsTCCAccess:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  objc_super v9 = v8;
  if (a4 == 1)
  {
    uint64_t v15 = [v8 getLimitedAccessContactsCountForBundle:v7];
    if (v15)
    {
      int v10 = (void *)v15;
      id v12 = 0;
      goto LABEL_17;
    }
    uint64_t v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore for %@", buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_15;
  }
  if (a4 != 2)
  {
    id v12 = 0;
LABEL_16:
    int v10 = 0;
    goto LABEL_17;
  }
  id v23 = 0;
  int v10 = [v8 unifiedContactCountWithError:&v23];
  id v11 = v23;
  id v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  if (!v13)
  {
    uint64_t v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore (%@)", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  id v16 = v10;

  if (a4 == 1)
  {
    if ([v16 longValue] < 1)
    {
      uint64_t v21 = PUI_LocalizedStringForPrivacy(@"CONTACTS_LIMITEDACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL");
      [v6 setProperty:v21 forKey:*MEMORY[0x1E4F930A0]];
    }
    else
    {
      uint64_t v20 = NSString;
      uint64_t v21 = PUI_LocalizedStringForPrivacy(@"LIMITEDACCESS_CONTACTS_COUNT_SECONDARY_LABEL");
      v22 = objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v16, "longValue"));
      [v6 setProperty:v22 forKey:*MEMORY[0x1E4F930A0]];
    }
    [(PUIContactsAuthorizationLevelController *)self setLimitedAccessCount:v16];
    [(PUIContactsAuthorizationLevelController *)self setLimitedAccessSpecifier:v6];
  }
  else if (a4 == 2)
  {
    if ([v16 longValue] < 1)
    {
      v18 = PUI_LocalizedStringForPrivacy(@"CONTACTS_FULLACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL");
      [v6 setProperty:v18 forKey:*MEMORY[0x1E4F930A0]];
    }
    else
    {
      v17 = NSString;
      v18 = PUI_LocalizedStringForPrivacy(@"FULLACCESS_CONTACTS_COUNT_SECONDARY_LABEL");
      v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, objc_msgSend(v16, "longValue"));
      [v6 setProperty:v19 forKey:*MEMORY[0x1E4F930A0]];
    }
    [(PUIContactsAuthorizationLevelController *)self setFullAccessSpecifier:v6];
  }
  [(PUIContactsAuthorizationLevelController *)self reloadSpecifier:v6];
}

- (BOOL)isAppLinkedWithContactsLimitedAccessSupportedSDK
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v4 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
  uint64_t v11 = 0;
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];

  if (v5 && ([v5 SDKVersion], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    int v7 = [v5 SDKVersion];
    unint64_t v8 = [v7 compare:@"18.0" options:64];

    BOOL v9 = v8 < 2;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)contactPicker:(Class)a3 didSelectContacts:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PUIContactsAuthorizationLevelController *)self limitedAccessSpecifier];
  [(PUIContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v5 contactsTCCAccess:1];
  [(PUIContactsAuthorizationLevelController *)self reloadSpecifier:v5];
  if (![(PUIContactsAuthorizationLevelController *)self isAppLinkedWithContactsLimitedAccessSupportedSDK])
  {
    id v6 = _PUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(PUIContactsAuthorizationLevelController *)self displayName];
      unint64_t v8 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v7;
      __int16 v29 = 2112;
      long long v30 = v8;
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "App %@(%@) is linked using SDK that doesn't support LimitedAccess for Contacts", buf, 0x16u);
    }
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"Terminating app as selected contacts changed for legacy linked app"];
    if (!v9) {
      goto LABEL_22;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F223B0]);
    uint64_t v11 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
    id v12 = (void *)[v10 initWithBundleIdentifier:v11 URL:0 personaUniqueString:0 personaType:4];

    BOOL v13 = [MEMORY[0x1E4F96408] identityForLSApplicationIdentity:v12];
    if (!v13)
    {
      uint64_t v14 = _PUILoggingFacility();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      id v16 = [(PUIContactsAuthorizationLevelController *)self displayName];
      v24 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      long long v30 = v24;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get process identity for %@(%@)", buf, 0x16u);

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v14 = [MEMORY[0x1E4F96430] predicateMatchingIdentity:v13];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v14 context:v9];
    id v16 = v15;
    if (v15)
    {
      id v26 = 0;
      int v17 = [v15 execute:&v26];
      v18 = v26;
      v19 = v18;
      if (v17)
      {
        uint64_t v20 = _PUILoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [(PUIContactsAuthorizationLevelController *)self displayName];
          v22 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v21;
          __int16 v29 = 2112;
          long long v30 = v22;
          id v23 = "Successfully terminated %@(%@)";
LABEL_17:
          _os_log_impl(&dword_1E4AD5000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if ([v18 code] != 3)
      {
        uint64_t v20 = _PUILoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [(PUIContactsAuthorizationLevelController *)self displayName];
          v22 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v21;
          __int16 v29 = 2112;
          long long v30 = v22;
          id v23 = "Failed to kill %@(%@)";
          goto LABEL_17;
        }
LABEL_18:
      }
    }
    else
    {
      v19 = _PUILoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(PUIContactsAuthorizationLevelController *)self displayName];
        v25 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        long long v30 = v25;
        _os_log_impl(&dword_1E4AD5000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create terminate request for %@(%@)", buf, 0x16u);

        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
LABEL_23:
}

- (void)_presentContactsPickerForModifyingSelection
{
  getCNLimitedAccessContactPickerViewControllerClass();
  if (objc_opt_class())
  {
    id v3 = [(PUIContactsAuthorizationLevelController *)self limitedAccessCount];
    uint64_t v4 = [v3 longValue];

    id v5 = objc_alloc((Class)getCNLimitedAccessContactPickerViewControllerClass());
    id v6 = [(PUIContactsAuthorizationLevelController *)self displayName];
    int v7 = [(PUIContactsAuthorizationLevelController *)self serviceKey];
    if (v4 <= 0) {
      uint64_t v8 = [v5 initDeltaPickerForAppName:v6 bundleId:v7];
    }
    else {
      uint64_t v8 = [v5 initSettingsPickerForAppName:v6 bundleId:v7];
    }
    BOOL v9 = (void *)v8;

    [v9 setDelegate:self];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86__PUIContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke;
      v10[3] = &unk_1E6E9C758;
      v10[4] = self;
      [(PUIContactsAuthorizationLevelController *)self presentViewController:v9 animated:1 completion:v10];
    }
  }
}

void __86__PUIContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) displayName];
    uint64_t v4 = [*(id *)(a1 + 32) serviceKey];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "Edit selected contacts view controller dismissed for %@(%@)", (uint8_t *)&v5, 0x16u);
  }
}

- (id)footerStringForSpecifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "values", (void)v17);
        id v10 = [v9 firstObject];
        char v11 = [v10 isEqual:&unk_1F40803E0];

        id v12 = [v8 values];
        BOOL v13 = [v12 firstObject];
        int v14 = [v13 isEqual:&unk_1F40803F8];

        if ((v11 & 1) != 0 || v14)
        {

          uint64_t v15 = PUI_LocalizedStringForPrivacy(@"CONTACTS_PRIVACY_FOOTER");
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUIContactsAuthorizationLevelController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(PUIContactsAuthorizationLevelController *)self specifierAtIndex:v8];
    id v10 = v9;
    if (v9)
    {
      char v11 = [v9 propertyForKey:*MEMORY[0x1E4F93188]];
      int v12 = [v11 isEqual:@"CONTACTS_MANUAL_SELECTION_BUTTON"];

      if (v12)
      {
        [v10 performButtonAction];
        [v6 deselectRowAtIndexPath:v7 animated:1];
      }
      else
      {
        v18.receiver = self;
        v18.super_class = (Class)PUIContactsAuthorizationLevelController;
        [(PSListItemsController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
        BOOL v13 = [v10 values];
        int v14 = [v13 firstObject];
        int v15 = [v14 intValue];

        if (v15 == 2)
        {
          [(PUIContactsAuthorizationLevelController *)self _removeLimitedAccessSectionIfPresent];
          [(PUIContactsAuthorizationLevelController *)self _removePickerUsageSectionIfPresent];
        }
        else if (v15 == 1)
        {
          id v16 = [(NSArray *)self->_limitedAccessSectionSpecifiers firstObject];
          char v17 = [(PUIContactsAuthorizationLevelController *)self containsSpecifier:v16];

          if ((v17 & 1) == 0)
          {
            [(PUIContactsAuthorizationLevelController *)self _addLimitedAccessSection];
            [(PUIContactsAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
            [(PUIContactsAuthorizationLevelController *)self _presentContactsPickerForModifyingSelection];
          }
        }
        else
        {
          [(PUIContactsAuthorizationLevelController *)self _removeLimitedAccessSectionIfPresent];
          [(PUIContactsAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
        }
      }
    }
  }
}

- (void)_addLimitedAccessSection
{
  if ([(NSArray *)self->_pickerUsageSectionSpecifiers count]
    && ([(NSArray *)self->_pickerUsageSectionSpecifiers firstObject],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [(PUIContactsAuthorizationLevelController *)self containsSpecifier:v3],
        v3,
        v4))
  {
    uint64_t v5 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
    uint64_t v6 = [(PUIContactsAuthorizationLevelController *)self indexOfSpecifier:v5];

    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    [(PUIContactsAuthorizationLevelController *)self insertContiguousSpecifiers:limitedAccessSectionSpecifiers atIndex:v6 animated:1];
  }
  else
  {
    uint64_t v8 = self->_limitedAccessSectionSpecifiers;
    [(PUIContactsAuthorizationLevelController *)self addSpecifiersFromArray:v8 animated:1];
  }
}

- (void)_removeLimitedAccessSectionIfPresent
{
  id v3 = [(NSArray *)self->_limitedAccessSectionSpecifiers firstObject];
  int v4 = [(PUIContactsAuthorizationLevelController *)self containsSpecifier:v3];

  if (v4)
  {
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    [(PUIContactsAuthorizationLevelController *)self removeContiguousSpecifiers:limitedAccessSectionSpecifiers animated:1];
  }
}

- (void)_addPickerUsageSectionIfNeeded
{
  id v6 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  if (-[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:"))
  {
  }
  else
  {
    id v3 = bundleIdentifiersWithPickerAccess();
    int v4 = [v3 containsObject:self->_serviceKey];

    if (v4)
    {
      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
      [(PUIContactsAuthorizationLevelController *)self addSpecifiersFromArray:pickerUsageSectionSpecifiers animated:1];
    }
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  id v3 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  int v4 = [(PUIContactsAuthorizationLevelController *)self containsSpecifier:v3];

  if (v4)
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    [(PUIContactsAuthorizationLevelController *)self removeContiguousSpecifiers:pickerUsageSectionSpecifiers animated:1];
  }
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
}

- (PSSpecifier)fullAccessSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fullAccessSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setFullAccessSpecifier:(id)a3
{
}

- (PSSpecifier)limitedAccessSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_limitedAccessSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setLimitedAccessSpecifier:(id)a3
{
}

- (NSNumber)limitedAccessCount
{
  return self->_limitedAccessCount;
}

- (void)setLimitedAccessCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessCount, 0);
  objc_destroyWeak((id *)&self->_limitedAccessSpecifier);
  objc_destroyWeak((id *)&self->_fullAccessSpecifier);
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedAccessSectionSpecifiers, 0);
}

void __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E4AD5000, v0, v1, "Error when requesting Contacts TCC for identity: %@ error: %@");
}

@end