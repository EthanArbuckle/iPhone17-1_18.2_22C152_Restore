@interface PSContactsAuthorizationLevelController
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
- (uint64_t)dealloc;
- (unint64_t)_currentTCCAuthorizationRight;
- (void)_addLimitedAccessSection;
- (void)_addPickerUsageSectionIfNeeded;
- (void)_handleContactStoreDidChangeNotification:(id)a3;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)_limitedAccessSectionSpecifiers;
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

@implementation PSContactsAuthorizationLevelController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PSContactsAuthorizationLevelController;
  [(PSListItemsController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PSContactsPrivacyUpgradePromptCompletedNotification" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PSContactsPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"PSContactsPrivacyUpgradePromptCompletedNotification" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  objc_super v5 = (void *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  uint64_t v17 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getCNContactStoreDidChangeNotificationSymbolLoc_block_invoke;
    v12 = &unk_1E5C5D4D8;
    v13 = &v14;
    v6 = (void *)ContactsLibrary();
    v15[3] = (uint64_t)dlsym(v6, "CNContactStoreDidChangeNotification");
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(v13[1] + 24);
    objc_super v5 = (void *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
    v7 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v7);
  }
  [v4 removeObserver:self name:*v5 object:0];

  v8.receiver = self;
  v8.super_class = (Class)PSContactsAuthorizationLevelController;
  [(PSListItemsController *)&v8 dealloc];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"PSContactsPrivacyUpgradePromptAppIdentifierKey"];
  v6 = [(PSContactsAuthorizationLevelController *)self serviceKey];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PSContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E5C5D680;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PSContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  id v4 = [(PSContactsAuthorizationLevelController *)self fullAccessSpecifier];
  [(PSContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v4 contactsTCCAccess:2];
  [(PSListController *)self reloadSpecifier:v4];
}

- (unint64_t)_currentTCCAuthorizationRight
{
  if (_currentTCCAuthorizationRight_onceToken != -1) {
    dispatch_once(&_currentTCCAuthorizationRight_onceToken, &__block_literal_global_2);
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

uint64_t __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = _currentTCCAuthorizationRight_tccServer;
  _currentTCCAuthorizationRight_tccServer = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
    uint64_t v8 = _PSLoggingFacility();
    uint64_t v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting Contacts authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_parentTCCSpecifiers
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PSContactsAuthorizationLevelController;
  v2 = [(PSListItemsController *)&v36 specifiers];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (v8[7] == 3)
        {
          uint64_t v9 = [v8 identifier];
          int v10 = [v9 intValue];

          if (v10 == 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    char v15 = v5 ^ 1;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v18 = [v17 identifier];
        uint64_t v19 = [v18 intValue];

        uint64_t v20 = v17[7];
        if (v20 != 3 || v19 != 4)
        {
          if (v20 == 3) {
            char v22 = v15;
          }
          else {
            char v22 = 1;
          }
          if ((v22 & 1) != 0 || v19)
          {
            if (v20 == 3 && (v19 - 1) <= 1)
            {
              [v17 setProperty:objc_opt_class() forKey:@"cellClass"];
              [(PSContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v17 contactsTCCAccess:v19];
            }
          }
          else
          {
            v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
            [v17 setIdentifier:v23];
          }
          [v3 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v13);
  }

  v25 = (void *)[v3 copy];
  return v25;
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSContactsAuthorizationLevelController;
  id v4 = a3;
  [(PSListController *)&v9 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"appBundleID", v9.receiver, v9.super_class);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  int v7 = [v4 propertyForKey:@"appLocalizedDisplayName"];

  displayName = self->_displayName;
  self->_displayName = v7;
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
        objc_super v9 = objc_msgSend(v8, "values", (void)v17);
        int v10 = [v9 firstObject];
        char v11 = [v10 isEqual:&unk_1EFB73E38];

        uint64_t v12 = [v8 values];
        uint64_t v13 = [v12 firstObject];
        int v14 = [v13 isEqual:&unk_1EFB73E50];

        if ((v11 & 1) != 0 || v14)
        {

          char v15 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_PRIVACY_FOOTER");
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

  char v15 = 0;
LABEL_12:

  return v15;
}

- (id)_pickerUsageSectionSpecifiers
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = bundleIdentifiersWithPickerAccess();
  if ([v3 containsObject:self->_serviceKey])
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    if (!pickerUsageSectionSpecifiers)
    {
      uint64_t v5 = +[PSSpecifier groupSpecifierWithName:0];
      [v5 setProperty:@"CONTACTS_PICKER_INFO_GROUP" forKey:@"id"];
      uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
      [v6 setProperty:@"CONTACTS_PICKER_INFO_CELL" forKey:@"id"];
      int v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4F43D18]];
      [v6 setProperty:v7 forKey:@"height"];

      [v6 setProperty:objc_opt_class() forKey:@"cellClass"];
      v12[0] = v5;
      v12[1] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      objc_super v9 = self->_pickerUsageSectionSpecifiers;
      self->_pickerUsageSectionSpecifiers = v8;

      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    }
    int v10 = pickerUsageSectionSpecifiers;
  }
  else
  {
    int v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)_limitedAccessSectionSpecifiers
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (!self->_limitedAccessSectionSpecifiers)
  {
    id v3 = +[PSSpecifier emptyGroupSpecifier];
    [v3 setProperty:@"CONTACTS_MANUAL_SELECTION_GROUP" forKey:@"id"];
    uint64_t v4 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_MANUAL_SELECTION_BUTTON");
    uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v5 setProperty:v6 forKey:@"enabled"];

    [v5 setProperty:@"CONTACTS_MANUAL_SELECTION_BUTTON" forKey:@"id"];
    [v5 setButtonAction:sel__presentContactsPickerForModifyingSelection];
    v15[0] = v3;
    v15[1] = v5;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    self->_limitedAccessSectionSpecifiers = v7;
  }
  unint64_t v9 = [(PSContactsAuthorizationLevelController *)self _currentTCCAuthorizationRight];
  if (v9 == 3)
  {
    int v10 = self->_limitedAccessSectionSpecifiers;
  }
  else
  {
    uint64_t v11 = v9;
    uint64_t v12 = [MEMORY[0x1E4F42948] currentDevice];
    if ((objc_msgSend(v12, "sf_isInternalInstall") & 1) != 0 || PSDiagnosticsAreEnabled())
    {
      uint64_t v13 = _PSLoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        [(PSContactsAuthorizationLevelController *)v11 _limitedAccessSectionSpecifiers];
      }
    }
    int v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (void)updateContactsCountSubtitleForSpecifier:(id)a3 contactsTCCAccess:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PSContactsAuthorizationLevelController *)self serviceKey];
  id v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v8 = (id)getCNContactStoreClass_softClass;
  uint64_t v26 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    long long v28 = __getCNContactStoreClass_block_invoke;
    long long v29 = &unk_1E5C5D4D8;
    long long v30 = &v23;
    __getCNContactStoreClass_block_invoke((uint64_t)&buf);
    id v8 = v24[3];
  }
  unint64_t v9 = (objc_class *)v8;
  _Block_object_dispose(&v23, 8);
  id v10 = objc_alloc_init(v9);
  uint64_t v11 = v10;
  if (a4 == 1)
  {
    uint64_t v12 = [v10 getLimitedAccessContactsCountForBundle:v7];
    if (v12)
    {
      int v14 = 0;
      goto LABEL_17;
    }
    char v15 = _PSLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore for %@", (uint8_t *)&buf, 0xCu);
    }
    int v14 = 0;
    goto LABEL_15;
  }
  if (a4 != 2)
  {
    int v14 = 0;
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  id v23 = 0;
  uint64_t v12 = [v10 unifiedContactCountWithError:&v23];
  id v13 = v23;
  int v14 = v13;
  if (!v12 && v13)
  {
    char v15 = _PSLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore (%@)", (uint8_t *)&buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  id v16 = v12;

  if (a4 == 1)
  {
    if ([v16 longValue] < 1)
    {
      v21 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_LIMITEDACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL");
      [v6 setProperty:v21 forKey:@"cellSubtitleText"];
    }
    else
    {
      long long v20 = NSString;
      v21 = PS_LocalizedStringForSystemPolicy(@"LIMITEDACCESS_CONTACTS_COUNT_SECONDARY_LABEL");
      uint64_t v22 = objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v16, "longValue"));
      [v6 setProperty:v22 forKey:@"cellSubtitleText"];
    }
    [(PSContactsAuthorizationLevelController *)self setLimitedAccessCount:v16];
    [(PSContactsAuthorizationLevelController *)self setLimitedAccessSpecifier:v6];
  }
  else if (a4 == 2)
  {
    if ([v16 longValue] < 1)
    {
      long long v18 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_FULLACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL");
      [v6 setProperty:v18 forKey:@"cellSubtitleText"];
    }
    else
    {
      long long v17 = NSString;
      long long v18 = PS_LocalizedStringForSystemPolicy(@"FULLACCESS_CONTACTS_COUNT_SECONDARY_LABEL");
      long long v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, objc_msgSend(v16, "longValue"));
      [v6 setProperty:v19 forKey:@"cellSubtitleText"];
    }
    [(PSContactsAuthorizationLevelController *)self setFullAccessSpecifier:v6];
  }
  [(PSListController *)self reloadSpecifier:v6];
}

- (void)contactPicker:(Class)a3 didSelectContacts:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PSContactsAuthorizationLevelController *)self limitedAccessSpecifier];
  [(PSContactsAuthorizationLevelController *)self updateContactsCountSubtitleForSpecifier:v5 contactsTCCAccess:1];
  [(PSListController *)self reloadSpecifier:v5];
  if (![(PSContactsAuthorizationLevelController *)self isAppLinkedWithContactsLimitedAccessSupportedSDK])
  {
    id v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PSContactsAuthorizationLevelController *)self displayName];
      id v8 = [(PSContactsAuthorizationLevelController *)self serviceKey];
      *(_DWORD *)long long buf = 138412546;
      long long v28 = v7;
      __int16 v29 = 2112;
      long long v30 = v8;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "App %@(%@) is linked using SDK that doesn't support LimitedAccess for Contacts", buf, 0x16u);
    }
    unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"Terminating app as selected contacts changed for legacy linked app"];
    if (!v9) {
      goto LABEL_22;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F223B0]);
    uint64_t v11 = [(PSContactsAuthorizationLevelController *)self serviceKey];
    uint64_t v12 = (void *)[v10 initWithBundleIdentifier:v11 URL:0 personaUniqueString:0 personaType:4];

    id v13 = [MEMORY[0x1E4F96408] identityForLSApplicationIdentity:v12];
    if (!v13)
    {
      int v14 = _PSLoggingFacility();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      id v16 = [(PSContactsAuthorizationLevelController *)self displayName];
      v24 = [(PSContactsAuthorizationLevelController *)self serviceKey];
      *(_DWORD *)long long buf = 138412546;
      long long v28 = v16;
      __int16 v29 = 2112;
      long long v30 = v24;
      _os_log_impl(&dword_1A6597000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get process identity for %@(%@)", buf, 0x16u);

LABEL_20:
      goto LABEL_21;
    }
    int v14 = [MEMORY[0x1E4F96430] predicateMatchingIdentity:v13];
    char v15 = [objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v14 context:v9];
    id v16 = v15;
    if (v15)
    {
      id v26 = 0;
      int v17 = [v15 execute:&v26];
      long long v18 = v26;
      long long v19 = v18;
      if (v17)
      {
        long long v20 = _PSLoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [(PSContactsAuthorizationLevelController *)self displayName];
          uint64_t v22 = [(PSContactsAuthorizationLevelController *)self serviceKey];
          *(_DWORD *)long long buf = 138412546;
          long long v28 = v21;
          __int16 v29 = 2112;
          long long v30 = v22;
          id v23 = "Successfully terminated %@(%@)";
LABEL_17:
          _os_log_impl(&dword_1A6597000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if ([v18 code] != 3)
      {
        long long v20 = _PSLoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [(PSContactsAuthorizationLevelController *)self displayName];
          uint64_t v22 = [(PSContactsAuthorizationLevelController *)self serviceKey];
          *(_DWORD *)long long buf = 138412546;
          long long v28 = v21;
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
      long long v19 = _PSLoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [(PSContactsAuthorizationLevelController *)self displayName];
        uint64_t v25 = [(PSContactsAuthorizationLevelController *)self serviceKey];
        *(_DWORD *)long long buf = 138412546;
        long long v28 = v20;
        __int16 v29 = 2112;
        long long v30 = v25;
        _os_log_impl(&dword_1A6597000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create terminate request for %@(%@)", buf, 0x16u);

        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
LABEL_23:
}

- (BOOL)isAppLinkedWithContactsLimitedAccessSupportedSDK
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v4 = [(PSContactsAuthorizationLevelController *)self serviceKey];
  uint64_t v11 = 0;
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];

  if (v5 && ([v5 SDKVersion], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [v5 SDKVersion];
    unint64_t v8 = [v7 compare:@"18.0" options:64];

    BOOL v9 = v8 < 2;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_presentContactsPickerForModifyingSelection
{
  getCNLimitedAccessContactPickerViewControllerClass();
  if (objc_opt_class())
  {
    id v3 = [(PSContactsAuthorizationLevelController *)self limitedAccessCount];
    uint64_t v4 = [v3 longValue];

    id v5 = objc_alloc((Class)getCNLimitedAccessContactPickerViewControllerClass());
    id v6 = [(PSContactsAuthorizationLevelController *)self displayName];
    id v7 = [(PSContactsAuthorizationLevelController *)self serviceKey];
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
      v10[2] = __85__PSContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke;
      v10[3] = &unk_1E5C5D680;
      v10[4] = self;
      [(PSContactsAuthorizationLevelController *)self presentViewController:v9 animated:1 completion:v10];
    }
  }
}

void __85__PSContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _PSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) displayName];
    uint64_t v4 = [*(id *)(a1 + 32) serviceKey];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Edit selected contacts view controller dismissed for %@(%@)", (uint8_t *)&v5, 0x16u);
  }
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    uint64_t v3 = [(PSContactsAuthorizationLevelController *)v2 _currentTCCAuthorizationRight];
    uint64_t v4 = [(PSListController *)v2 specifier];
    int v5 = [v4 propertyForKey:@"hasPickerInfo"];
    int v6 = [v5 BOOLValue];
    if (v3 == 2) {
      int v7 = 0;
    }
    else {
      int v7 = v6;
    }

    uint64_t v8 = [(PSListController *)v2 specifier];
    uint64_t v9 = [v8 propertyForKey:@"hasTCCOptions"];
    int v10 = [v9 BOOLValue];

    uint64_t v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v10)
    {
      uint64_t v12 = [(PSContactsAuthorizationLevelController *)v2 _parentTCCSpecifiers];
      [(NSArray *)v11 addObjectsFromArray:v12];
      id v13 = [v12 firstObject];
      int v14 = [(PSContactsAuthorizationLevelController *)v2 footerStringForSpecifiers:v11];
      if (v14) {
        [v13 setProperty:v14 forKey:@"footerText"];
      }
      char v15 = [(PSContactsAuthorizationLevelController *)v2 _limitedAccessSectionSpecifiers];
      [(NSArray *)v11 addObjectsFromArray:v15];
    }
    id v16 = [(PSContactsAuthorizationLevelController *)v2 _pickerUsageSectionSpecifiers];
    int v17 = v16;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {
        long long v18 = [v16 firstObject];
        long long v19 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_AUTH_HEADER");
        [v18 setName:v19];
      }
      [(NSArray *)v11 addObjectsFromArray:v17];
    }
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v11;
  }
  objc_sync_exit(v2);

  v21 = v2->super.super._specifiers;
  return v21;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PSListController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(PSListController *)self specifierAtIndex:v8];
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 propertyForKey:@"id"];
      int v12 = [v11 isEqual:@"CONTACTS_MANUAL_SELECTION_BUTTON"];

      if (v12)
      {
        [v10 performButtonAction];
        [v6 deselectRowAtIndexPath:v7 animated:1];
      }
      else
      {
        v18.receiver = self;
        v18.super_class = (Class)PSContactsAuthorizationLevelController;
        [(PSListItemsController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
        id v13 = [v10 values];
        int v14 = [v13 firstObject];
        int v15 = [v14 intValue];

        if (v15 == 2)
        {
          [(PSContactsAuthorizationLevelController *)self _removeLimitedAccessSectionIfPresent];
          [(PSContactsAuthorizationLevelController *)self _removePickerUsageSectionIfPresent];
        }
        else if (v15 == 1)
        {
          id v16 = [(NSArray *)self->_limitedAccessSectionSpecifiers firstObject];
          BOOL v17 = [(PSListController *)self containsSpecifier:v16];

          if (!v17)
          {
            [(PSContactsAuthorizationLevelController *)self _addLimitedAccessSection];
            [(PSContactsAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
            [(PSContactsAuthorizationLevelController *)self _presentContactsPickerForModifyingSelection];
          }
        }
        else
        {
          [(PSContactsAuthorizationLevelController *)self _removeLimitedAccessSectionIfPresent];
          [(PSContactsAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
        }
      }
    }
  }
}

- (void)_addLimitedAccessSection
{
  if ([(NSArray *)self->_pickerUsageSectionSpecifiers count]
    && ([(NSArray *)self->_pickerUsageSectionSpecifiers firstObject],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = [(PSListController *)self containsSpecifier:v3],
        v3,
        v4))
  {
    int v5 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
    int64_t v6 = [(PSListController *)self indexOfSpecifier:v5];

    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    [(PSListController *)self insertContiguousSpecifiers:limitedAccessSectionSpecifiers atIndex:v6 animated:1];
  }
  else
  {
    int64_t v8 = self->_limitedAccessSectionSpecifiers;
    [(PSListController *)self addSpecifiersFromArray:v8 animated:1];
  }
}

- (void)_removeLimitedAccessSectionIfPresent
{
  uint64_t v3 = [(NSArray *)self->_limitedAccessSectionSpecifiers firstObject];
  BOOL v4 = [(PSListController *)self containsSpecifier:v3];

  if (v4)
  {
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    [(PSListController *)self removeContiguousSpecifiers:limitedAccessSectionSpecifiers animated:1];
  }
}

- (void)_addPickerUsageSectionIfNeeded
{
  id v6 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  if (-[PSListController containsSpecifier:](self, "containsSpecifier:"))
  {
  }
  else
  {
    uint64_t v3 = bundleIdentifiersWithPickerAccess();
    int v4 = [v3 containsObject:self->_serviceKey];

    if (v4)
    {
      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
      [(PSListController *)self addSpecifiersFromArray:pickerUsageSectionSpecifiers animated:1];
    }
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  uint64_t v3 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  BOOL v4 = [(PSListController *)self containsSpecifier:v3];

  if (v4)
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    [(PSListController *)self removeContiguousSpecifiers:pickerUsageSectionSpecifiers animated:1];
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

- (NSNumber)limitedAccessCount
{
  return self->_limitedAccessCount;
}

- (void)setLimitedAccessCount:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitedAccessSpecifier);
  objc_destroyWeak((id *)&self->_fullAccessSpecifier);
  objc_storeStrong((id *)&self->_limitedAccessCount, 0);
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedAccessSectionSpecifiers, 0);
}

- (uint64_t)dealloc
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1(v0);
}

void __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "Error when requesting Contacts TCC for identity: %@ error: %@");
}

- (void)_limitedAccessSectionSpecifiers
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6597000, a2, OS_LOG_TYPE_DEBUG, "Contacts: Empty specifier are returned, auth = %llu", (uint8_t *)&v2, 0xCu);
}

@end