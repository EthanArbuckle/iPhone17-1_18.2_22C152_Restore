@interface STCommunicationLimitsDowntimeDetailListController
- (BOOL)syncingWhitelistedContacts;
- (CNUIFamilyMemberWhitelistedContactsController)whitelistedContactsController;
- (NSMutableArray)allowedContactsSpecifiers;
- (PSSpecifier)addContactsSpecifier;
- (PSSpecifier)allowContactsOnlySpecifier;
- (PSSpecifier)allowEveryoneSpecifier;
- (PSSpecifier)allowGroupsWithOneContactSpecifier;
- (PSSpecifier)allowSpecificContactsSpecifier;
- (PSSpecifier)allowedCommunicationGroupSpecifier;
- (PSSpecifier)allowedContactsGroupSpecifier;
- (STCommunicationLimits)communicationLimits;
- (id)_allowedCommunicationGroupFooterText:(id)a3;
- (id)_allowedContactDetailLabelText:(id)a3;
- (id)_allowedContactsSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)_downtimeCommunicationLimitForSpecifier:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_didFinishEditingCommunicationLimit;
- (void)_didFinishSyncingWhitelistedContacts;
- (void)_selectLeastRestrictiveOptionIfNecessary;
- (void)_startSyncingWhitelistedContacts;
- (void)_updateAllowedCommunicationGroupFooterText;
- (void)dismissPresentedViewController:(id)a3;
- (void)familyMemberContactsDidChange;
- (void)presentViewController:(id)a3;
- (void)setAddContactsSpecifier:(id)a3;
- (void)setAllowContactsOnlySpecifier:(id)a3;
- (void)setAllowEveryoneSpecifier:(id)a3;
- (void)setAllowGroupsWithOneContactSpecifier:(id)a3;
- (void)setAllowSpecificContactsSpecifier:(id)a3;
- (void)setAllowedCommunicationGroupSpecifier:(id)a3;
- (void)setAllowedContactsGroupSpecifier:(id)a3;
- (void)setAllowedContactsSpecifiers:(id)a3;
- (void)setCommunicationLimits:(id)a3;
- (void)setSyncingWhitelistedContacts:(BOOL)a3;
- (void)setWhitelistedContactsController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STCommunicationLimitsDowntimeDetailListController

- (void)viewDidLoad
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225B06000, log, OS_LOG_TYPE_FAULT, "altDSID is nil. Getting altDSID from iCloud account or FamilyCircle did not succeed.", v1, 2u);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(STCommunicationLimitsDowntimeDetailListController *)self _selectLeastRestrictiveOptionIfNecessary];
  [(STCommunicationLimitsDowntimeDetailListController *)self _didFinishEditingCommunicationLimit];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsDowntimeDetailListController.viewWillDisappear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  [(STCommunicationLimitsDowntimeDetailListController *)&v5 viewWillDisappear:v3];
}

- (void)willResignActive
{
  [(STCommunicationLimitsDowntimeDetailListController *)self _selectLeastRestrictiveOptionIfNecessary];
  [(STCommunicationLimitsDowntimeDetailListController *)self _didFinishEditingCommunicationLimit];
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  [(STCommunicationLimitsDowntimeDetailListController *)&v3 willResignActive];
}

- (void)_didFinishEditingCommunicationLimit
{
  objc_super v3 = [(STCommunicationLimitsDowntimeDetailListController *)self specifier];
  id v8 = [v3 objectForKeyedSubscript:0x26D940528];

  v4 = [(STCommunicationLimitsDowntimeDetailListController *)self communicationLimits];
  objc_super v5 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F60200]];

  objc_msgSend(v4, "setDowntimeCommunicationLimit:", -[STCommunicationLimitsDowntimeDetailListController _downtimeCommunicationLimitForSpecifier:](self, "_downtimeCommunicationLimitForSpecifier:", v6));
  v7 = [v8 contentPrivacyCoordinator];
  [v7 saveCommunicationLimits:v4 completionHandler:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v46 = objc_opt_new();
    v6 = +[STScreenTimeSettingsUIBundle bundle];
    unint64_t v7 = 0x263F5F000uLL;
    v48 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    id v8 = [(STCommunicationLimitsDowntimeDetailListController *)self specifier];
    v9 = [v8 objectForKeyedSubscript:0x26D940528];

    v10 = [v9 viewModel];
    v11 = [v10 me];
    v44 = v9;
    if ([v11 isRemoteUser])
    {
      v12 = [v11 givenName];
      v13 = +[STScreenTimeSettingsUIBundle bundle];
      v14 = v13;
      if (v12)
      {
        uint64_t v15 = [v13 localizedStringForKey:@"CommunicationLimitsRemoteHeaderText" value:&stru_26D9391A8 table:0];

        v16 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v12);
        v14 = (void *)v15;
        unint64_t v7 = 0x263F5F000;
      }
      else
      {
        v16 = [v13 localizedStringForKey:@"CommunicationLimitsRemoteGenericHeaderText" value:&stru_26D9391A8 table:0];
      }
    }
    else
    {
      v12 = +[STScreenTimeSettingsUIBundle bundle];
      v16 = [v12 localizedStringForKey:@"CommunicationLimitsLocalHeaderText" value:&stru_26D9391A8 table:0];
    }

    uint64_t v42 = *MEMORY[0x263F600F8];
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v16);

    [v46 addObject:v48];
    uint64_t v17 = [v6 localizedStringForKey:@"AllowedCommunicationSectionTitle" value:&stru_26D9391A8 table:0];
    v18 = [*(id *)(v7 + 3136) groupSpecifierWithName:v17];
    uint64_t v19 = MEMORY[0x263EFFA88];
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
    [(STCommunicationLimitsDowntimeDetailListController *)self setAllowedCommunicationGroupSpecifier:v18];
    [v46 addObject:v18];
    v45 = v6;
    v41 = [v6 localizedStringForKey:@"AllowSpecificContactsSpecifierName" value:&stru_26D9391A8 table:0];
    v20 = objc_msgSend(*(id *)(v7 + 3136), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    uint64_t v21 = *MEMORY[0x263F600A8];
    [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600A8]];
    [(STCommunicationLimitsDowntimeDetailListController *)self setAllowSpecificContactsSpecifier:v20];
    [v46 addObject:v20];
    v47 = [(STCommunicationLimitsDowntimeDetailListController *)self communicationLimits];
    switch([v47 screenTimeCommunicationLimit])
    {
      case 0:
        uint64_t v22 = [v45 localizedStringForKey:@"AllowEveryoneSpecifierName" value:&stru_26D9391A8 table:0];
        unint64_t v23 = v7;
        v24 = (void *)v22;
        v25 = [*(id *)(v23 + 3136) preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v25 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v21];
        [(STCommunicationLimitsDowntimeDetailListController *)self setAllowEveryoneSpecifier:v25];
        [v46 addObject:v25];
        v26 = 0;
        v27 = 0;
        goto LABEL_16;
      case 1:
        uint64_t v28 = [v45 localizedStringForKey:@"AllowGroupsWithOneContactSpecifierName" value:&stru_26D9391A8 table:0];
        unint64_t v29 = v7;
        v24 = (void *)v28;
        v26 = [*(id *)(v29 + 3136) preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v26 setObject:v19 forKeyedSubscript:*MEMORY[0x263F5FEF8]];
        [v26 setObject:v19 forKeyedSubscript:v21];
        [(STCommunicationLimitsDowntimeDetailListController *)self setAllowGroupsWithOneContactSpecifier:v26];
        [v46 addObject:v26];
        goto LABEL_14;
      case 2:
        uint64_t v30 = [v45 localizedStringForKey:@"AllowContactsOnlySpecifierName" value:&stru_26D9391A8 table:0];
        unint64_t v31 = v7;
        v24 = (void *)v30;
        v27 = [*(id *)(v31 + 3136) preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v27 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v21];
        [(STCommunicationLimitsDowntimeDetailListController *)self setAllowContactsOnlySpecifier:v27];
        [v46 addObject:v27];
        v26 = 0;
        goto LABEL_15;
      case 3:
        v24 = [MEMORY[0x263F08690] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"STCommunicationLimitsDowntimeDetailListController.m" lineNumber:166 description:@"Unexpected general communication policy whitelisted contacts"];
        v26 = 0;
LABEL_14:
        v27 = 0;
LABEL_15:
        v25 = 0;
LABEL_16:

        break;
      default:
        v26 = 0;
        v27 = 0;
        v25 = 0;
        break;
    }
    v43 = (void *)v17;
    switch([v47 downtimeCommunicationLimit])
    {
      case 0:
        uint64_t v32 = *MEMORY[0x263F60200];
        if (!v25) {
          goto LABEL_28;
        }
        v33 = v18;
        v34 = v25;
        goto LABEL_25;
      case 1:
        uint64_t v32 = *MEMORY[0x263F60200];
        if (!v26) {
          goto LABEL_28;
        }
        v33 = v18;
        v34 = v26;
        goto LABEL_25;
      case 2:
        uint64_t v32 = *MEMORY[0x263F60200];
        if (!v27) {
          goto LABEL_28;
        }
        v33 = v18;
        v34 = v27;
LABEL_25:
        [v33 setObject:v34 forKeyedSubscript:v32];
        goto LABEL_26;
      case 3:
        uint64_t v32 = *MEMORY[0x263F60200];
LABEL_28:
        [v18 setObject:v20 forKeyedSubscript:v32];
        v36 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedContactsSpecifiers];
        v35 = (objc_class *)v46;
        [v46 addObjectsFromArray:v36];

        goto LABEL_29;
      default:
        uint64_t v32 = *MEMORY[0x263F60200];
LABEL_26:
        v35 = (objc_class *)v46;
LABEL_29:
        v37 = [v18 objectForKeyedSubscript:v32];
        v38 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedCommunicationGroupFooterText:v37];
        [v18 setObject:v38 forKeyedSubscript:v42];

        v39 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v35;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        break;
    }
  }

  return v4;
}

- (id)_allowedContactsSpecifiers
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v36 = [v4 localizedStringForKey:@"AllowedContactsGroupSpecifierName" value:&stru_26D9391A8 table:0];
  objc_super v5 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:");
  v39 = self;
  v6 = [(STCommunicationLimitsDowntimeDetailListController *)self specifier];
  unint64_t v7 = [v6 objectForKeyedSubscript:0x26D940528];

  v35 = v7;
  id v8 = [v7 viewModel];
  v9 = [v8 me];

  if ([v9 isRemoteUser] && objc_msgSend(v9, "hasPasscode"))
  {
    v10 = [v9 givenName];
    if (v10)
    {
      v11 = [v4 localizedStringForKey:@"AllowedContactsGroupSpecifierRemoteFooterText" value:&stru_26D9391A8 table:0];
      id v12 = [NSString alloc];
      v13 = [MEMORY[0x263EFF960] currentLocale];
      v14 = objc_msgSend(v12, "initWithFormat:locale:", v11, v13, v10);
      [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
    else
    {
      v11 = [v4 localizedStringForKey:@"AllowedContactsGroupSpecifierRemoteGenericFooterText" value:&stru_26D9391A8 table:0];
      [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
  }
  v34 = v9;
  v37 = v4;
  uint64_t v15 = [(STCommunicationLimitsDowntimeDetailListController *)v39 whitelistedContactsController];
  v16 = [v15 familyMemberContactItems];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  uint64_t v18 = *MEMORY[0x263F60308];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F60308]];

  [(STCommunicationLimitsDowntimeDetailListController *)v39 setAllowedContactsGroupSpecifier:v5];
  [v3 addObject:v5];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v16;
  uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v20 = *MEMORY[0x263F600A8];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        v24 = v3;
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x263F5FCA8];
        v27 = [v25 label];
        uint64_t v28 = [v26 preferenceSpecifierNamed:v27 target:v39 set:0 get:sel__allowedContactDetailLabelText_ detail:0 cell:2 edit:0];

        [v28 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v20];
        unint64_t v29 = [v25 detailLabel];
        [v28 setObject:v29 forKeyedSubscript:v18];

        uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v25, "isUnreachable"));
        [v28 setObject:v30 forKeyedSubscript:@"UnreachableContact"];

        uint64_t v3 = v24;
        [v24 addObject:v28];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v21);
  }

  unint64_t v31 = [v37 localizedStringForKey:@"AddContactsSpecifierName" value:&stru_26D9391A8 table:0];
  uint64_t v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v31 target:v39 set:0 get:0 detail:0 cell:13 edit:0];
  [v32 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v20];
  [(STCommunicationLimitsDowntimeDetailListController *)v39 setAddContactsSpecifier:v32];
  [v3 addObject:v32];
  [(STCommunicationLimitsDowntimeDetailListController *)v39 setAllowedContactsSpecifiers:v3];

  return v3;
}

- (id)_allowedContactDetailLabelText:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
}

- (int64_t)_downtimeCommunicationLimitForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STCommunicationLimitsDowntimeDetailListController *)self allowEveryoneSpecifier];

  if (v5 == v4)
  {
    int64_t v8 = 0;
  }
  else
  {
    id v6 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];

    if (v6 == v4)
    {
      int64_t v8 = 2;
    }
    else
    {
      id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];

      if (v7 == v4) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = 3;
      }
    }
  }

  return v8;
}

- (void)familyMemberContactsDidChange
{
  if ([(STCommunicationLimitsDowntimeDetailListController *)self syncingWhitelistedContacts])
  {
    [(STCommunicationLimitsDowntimeDetailListController *)self _didFinishSyncingWhitelistedContacts];
  }
  else
  {
    uint64_t v3 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
    uint64_t v4 = *MEMORY[0x263F60308];
    id v11 = v3;
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
    uint64_t v6 = [v5 unsignedIntegerValue];

    id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
    int64_t v8 = [v7 familyMemberContactItems];
    uint64_t v9 = [v8 count];

    if (v6 != v9)
    {
      [(STCommunicationLimitsDowntimeDetailListController *)self reloadSpecifiers];
      [(STCommunicationLimitsDowntimeDetailListController *)self _selectLeastRestrictiveOptionIfNecessary];
      v10 = [NSNumber numberWithUnsignedInteger:v9];
      [v11 setObject:v10 forKeyedSubscript:v4];
    }
  }
}

- (void)presentViewController:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [MEMORY[0x263F82670] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isiPad");

  if (v5)
  {
    uint64_t v6 = [v13 popoverPresentationController];
    objc_msgSend(v6, "setSourceRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self addContactsSpecifier];
    int v8 = [(STCommunicationLimitsDowntimeDetailListController *)self containsSpecifier:v7];
    uint64_t v9 = [(STCommunicationLimitsDowntimeDetailListController *)self table];
    if (v8)
    {
      v10 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v7];
      id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self tableView:v9 cellForRowAtIndexPath:v10];
      [v6 setSourceView:v11];
    }
    else
    {
      v10 = [(STCommunicationLimitsDowntimeDetailListController *)self allowSpecificContactsSpecifier];
      id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v10];
      id v12 = [(STCommunicationLimitsDowntimeDetailListController *)self tableView:v9 cellForRowAtIndexPath:v11];
      [v6 setSourceView:v12];
    }
    [v6 setPermittedArrowDirections:3];
  }
  [(STCommunicationLimitsDowntimeDetailListController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)dismissPresentedViewController:(id)a3
{
  [(STCommunicationLimitsDowntimeDetailListController *)self dismissViewControllerAnimated:1 completion:0];

  [(STCommunicationLimitsDowntimeDetailListController *)self _selectLeastRestrictiveOptionIfNecessary];
}

- (void)_selectLeastRestrictiveOptionIfNecessary
{
  id v14 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
  uint64_t v3 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
  uint64_t v4 = [v3 familyMemberContactItems];
  if ([v4 count])
  {
LABEL_2:

    goto LABEL_4;
  }
  uint64_t v5 = *MEMORY[0x263F60200];
  uint64_t v6 = [v14 objectForKeyedSubscript:*MEMORY[0x263F60200]];
  id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self allowSpecificContactsSpecifier];

  if (v6 == v7)
  {
    uint64_t v3 = [(STCommunicationLimitsDowntimeDetailListController *)self allowEveryoneSpecifier];
    uint64_t v4 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];
    uint64_t v8 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];
    uint64_t v9 = (void *)v8;
    v10 = v3;
    if (v3 || (v10 = v4) != 0 || (v10 = (void *)v8) != 0) {
      [v14 setObject:v10 forKeyedSubscript:v5];
    }
    id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
    [(STCommunicationLimitsDowntimeDetailListController *)self removeSpecifier:v11 animated:1];

    [(STCommunicationLimitsDowntimeDetailListController *)self reloadSpecifier:v14 animated:0];
    id v12 = [v14 objectForKeyedSubscript:v5];
    id v13 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedCommunicationGroupFooterText:v12];
    [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [(STCommunicationLimitsDowntimeDetailListController *)self _updateAllowedCommunicationGroupFooterText];
    goto LABEL_2;
  }
LABEL_4:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STCommunicationLimitsDowntimeDetailListController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
  v10 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v9];

  id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
  id v12 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v11];

  uint64_t v13 = [v7 section];
  if (v13 == [v12 section])
  {
    unint64_t v29 = v10;
    id v14 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
    uint64_t v15 = [(STCommunicationLimitsDowntimeDetailListController *)self allowSpecificContactsSpecifier];
    v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F60200]];

    v33.receiver = self;
    v33.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
    [(STCommunicationLimitsDowntimeDetailListController *)&v33 tableView:v6 didSelectRowAtIndexPath:v7];
    int64_t v17 = [(STCommunicationLimitsDowntimeDetailListController *)self _downtimeCommunicationLimitForSpecifier:v8];
    uint64_t v18 = [(STCommunicationLimitsDowntimeDetailListController *)self communicationLimits];
    [v18 setDowntimeCommunicationLimit:v17];

    if (v8 != v15 || v16 == v15)
    {
      if (v8 != v15 && v16 == v15)
      {
        v24 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
        [(STCommunicationLimitsDowntimeDetailListController *)self removeSpecifier:v24 animated:1];
      }
    }
    else
    {
      [(STCommunicationLimitsDowntimeDetailListController *)self _startSyncingWhitelistedContacts];
    }
    v25 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedCommunicationGroupFooterText:v8];
    [v14 setObject:v25 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [(STCommunicationLimitsDowntimeDetailListController *)self _updateAllowedCommunicationGroupFooterText];
    v26 = [(STCommunicationLimitsDowntimeDetailListController *)self allowEveryoneSpecifier];

    if (v8 != v26)
    {
      v27 = [(STCommunicationLimitsDowntimeDetailListController *)self specifier];
      uint64_t v28 = [v27 objectForKeyedSubscript:0x26D940528];

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __87__STCommunicationLimitsDowntimeDetailListController_tableView_didSelectRowAtIndexPath___block_invoke;
      v32[3] = &unk_264767658;
      v32[4] = self;
      +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:v28 presentingViewController:self okHandler:v32];
    }
    v10 = v29;
  }
  else
  {
    uint64_t v19 = [v7 section];
    if (v19 == [v10 section])
    {
      uint64_t v20 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
      uint64_t v21 = [(STCommunicationLimitsDowntimeDetailListController *)self addContactsSpecifier];

      if (v8 == v21)
      {
        [v20 performInteraction:0];
        v31.receiver = self;
        v31.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
        [(STCommunicationLimitsDowntimeDetailListController *)&v31 tableView:v6 didSelectRowAtIndexPath:v7];
      }
      else
      {
        [v6 deselectRowAtIndexPath:v7 animated:1];
        uint64_t v22 = [v20 familyMemberContactItems];
        unint64_t v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
        [v20 presentDetailsOfFamilyMemberContactItem:v23];
      }
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
      [(STCommunicationLimitsDowntimeDetailListController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
    }
  }
}

uint64_t __87__STCommunicationLimitsDowntimeDetailListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSyncingWhitelistedContacts];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
  id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v6];

  uint64_t v8 = [v5 section];
  int64_t v9 = v8 == [v7 section];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  id v7 = [(STCommunicationLimitsDowntimeDetailListController *)&v23 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
  int64_t v9 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v8];

  uint64_t v10 = [v6 section];
  if (v10 == [v9 section])
  {
    id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self addContactsSpecifier];
    id v12 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v11];
    char v13 = [v6 isEqual:v12];

    if ((v13 & 1) == 0) {
      [v7 setAccessibilityIdentifier:@"AllowedContact"];
    }
  }
  id v14 = [(STCommunicationLimitsDowntimeDetailListController *)self specifierAtIndexPath:v6];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"UnreachableContact"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    int64_t v17 = [MEMORY[0x263F82818] configurationWithScale:3];
    id v18 = objc_alloc(MEMORY[0x263F82828]);
    uint64_t v19 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle" withConfiguration:v17];
    uint64_t v20 = (void *)[v18 initWithImage:v19];

    uint64_t v21 = [MEMORY[0x263F825C8] systemRedColor];
    [v20 setTintColor:v21];

    [v7 setAccessoryView:v20];
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = objc_msgSend(a5, "row", a3);
  if (a4 == 1)
  {
    uint64_t v8 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
      int64_t v9 = [v11 familyMemberContactItems];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];
      [v11 deleteFamilyMemberContactItem:v10];
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  int64_t v9 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
  uint64_t v10 = [(STCommunicationLimitsDowntimeDetailListController *)self indexPathForSpecifier:v9];
  uint64_t v11 = [v10 section];

  if (v8 == v11)
  {
    id v12 = +[STScreenTimeSettingsUIBundle bundle];
    char v13 = [v12 localizedStringForKey:@"AllowedContactsDeleteConfirmationButtonTitle" value:&stru_26D9391A8 table:0];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
    char v13 = [(STCommunicationLimitsDowntimeDetailListController *)&v15 tableView:v6 titleForDeleteConfirmationButtonForRowAtIndexPath:v7];
  }

  return v13;
}

- (void)_updateAllowedCommunicationGroupFooterText
{
  id v3 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
  [(STCommunicationLimitsDowntimeDetailListController *)self reloadSpecifier:v3 animated:1];
}

- (id)_allowedCommunicationGroupFooterText:(id)a3
{
  id v4 = a3;
  id v5 = [(STCommunicationLimitsDowntimeDetailListController *)self allowEveryoneSpecifier];

  if (v5 == v4)
  {
    id v7 = +[STScreenTimeSettingsUIBundle bundle];
    id v18 = [v7 localizedStringForKey:@"DuringDowntimeEveryoneFooterText" value:&stru_26D9391A8 table:0];
  }
  else
  {
    id v6 = [(STCommunicationLimitsDowntimeDetailListController *)self specifier];
    id v7 = [v6 objectForKeyedSubscript:0x26D940528];

    uint64_t v8 = [v7 viewModel];
    int64_t v9 = [v8 me];

    if ([v9 isRemoteUser])
    {
      uint64_t v10 = [v9 givenName];
      if (v10)
      {
        id v11 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];

        if (v11 == v4)
        {
          v27 = +[STScreenTimeSettingsUIBundle bundle];
          int v16 = [v27 localizedStringForKey:@"DuringDowntimeGroupsWithOneContactRemoteFooterText" value:&stru_26D9391A8 table:0];

          uint64_t v17 = objc_msgSend(NSString, "localizedStringWithFormat:", v16, v10, v10);
        }
        else
        {
          id v12 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];
          char v13 = @"DuringDowntimeSpecificContactsRemoteFooterText";
          if (v12 == v4) {
            char v13 = @"DuringDowntimeContactsOnlyRemoteFooterText";
          }
          id v14 = v13;

          objc_super v15 = +[STScreenTimeSettingsUIBundle bundle];
          int v16 = [v15 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];

          uint64_t v17 = [NSString localizedStringWithValidatedFormat:v16, @"%@", 0, v10 validFormatSpecifiers error];
        }
      }
      else
      {
        id v23 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];

        if (v23 == v4)
        {
          v25 = +[STScreenTimeSettingsUIBundle bundle];
          int v16 = v25;
          v26 = @"DuringDowntimeContactsOnlyRemoteGenericFooterText";
        }
        else
        {
          id v24 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];

          v25 = +[STScreenTimeSettingsUIBundle bundle];
          int v16 = v25;
          if (v24 == v4) {
            v26 = @"DuringDowntimeGroupsWithOneContactRemoteGenericFooterText";
          }
          else {
            v26 = @"DuringDowntimeSpecificContactsRemoteGenericFooterText";
          }
        }
        uint64_t v17 = [v25 localizedStringForKey:v26 value:&stru_26D9391A8 table:0];
      }
      id v18 = (void *)v17;
    }
    else
    {
      id v19 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];

      if (v19 == v4)
      {
        uint64_t v21 = +[STScreenTimeSettingsUIBundle bundle];
        uint64_t v10 = v21;
        uint64_t v22 = @"DuringDowntimeContactsOnlyLocalFooterText";
      }
      else
      {
        id v20 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];

        uint64_t v21 = +[STScreenTimeSettingsUIBundle bundle];
        uint64_t v10 = v21;
        if (v20 == v4) {
          uint64_t v22 = @"DuringDowntimeGroupsWithOneContactLocalFooterText";
        }
        else {
          uint64_t v22 = @"DuringDowntimeSpecificContactsLocalFooterText";
        }
      }
      id v18 = [v21 localizedStringForKey:v22 value:&stru_26D9391A8 table:0];
    }
  }

  return v18;
}

- (void)_startSyncingWhitelistedContacts
{
  id v4 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
  [v4 familyMemberContactItems];

  uint64_t v3 = [v4 fetchStatus];
  if (v3 == 2) {
    [(STCommunicationLimitsDowntimeDetailListController *)self _didFinishSyncingWhitelistedContacts];
  }
  else {
    [(STCommunicationLimitsDowntimeDetailListController *)self setSyncingWhitelistedContacts:(v3 & 0xFFFFFFFFFFFFFFFDLL) == 1];
  }
}

- (void)_didFinishSyncingWhitelistedContacts
{
  [(STCommunicationLimitsDowntimeDetailListController *)self setSyncingWhitelistedContacts:0];
  id v18 = [(STCommunicationLimitsDowntimeDetailListController *)self whitelistedContactsController];
  uint64_t v3 = [v18 familyMemberContactItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsSpecifiers];
    id v6 = [(STCommunicationLimitsDowntimeDetailListController *)self allowEveryoneSpecifier];
    id v7 = [(STCommunicationLimitsDowntimeDetailListController *)self allowContactsOnlySpecifier];
    uint64_t v8 = [(STCommunicationLimitsDowntimeDetailListController *)self allowGroupsWithOneContactSpecifier];
    int64_t v9 = (void *)v8;
    uint64_t v10 = v6;
    if (v6 || (uint64_t v10 = v7) != 0 || (uint64_t v10 = (void *)v8) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    if (v5)
    {
      id v12 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedContactsGroupSpecifier];
      char v13 = [(STCommunicationLimitsDowntimeDetailListController *)self containsSpecifier:v12];

      if ((v13 & 1) == 0) {
        [(STCommunicationLimitsDowntimeDetailListController *)self insertContiguousSpecifiers:v5 afterSpecifier:v11 animated:1];
      }
    }
    else
    {
      id v14 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedContactsSpecifiers];
      [(STCommunicationLimitsDowntimeDetailListController *)self insertContiguousSpecifiers:v14 afterSpecifier:v11 animated:1];
    }
    objc_super v15 = [(STCommunicationLimitsDowntimeDetailListController *)self allowSpecificContactsSpecifier];
    int v16 = [(STCommunicationLimitsDowntimeDetailListController *)self _allowedCommunicationGroupFooterText:v15];
    uint64_t v17 = [(STCommunicationLimitsDowntimeDetailListController *)self allowedCommunicationGroupSpecifier];
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [(STCommunicationLimitsDowntimeDetailListController *)self _updateAllowedCommunicationGroupFooterText];
  }
  else
  {
    [v18 performInteraction:0];
  }
}

- (PSSpecifier)allowedCommunicationGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setAllowedCommunicationGroupSpecifier:(id)a3
{
}

- (PSSpecifier)allowEveryoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAllowEveryoneSpecifier:(id)a3
{
}

- (PSSpecifier)allowContactsOnlySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setAllowContactsOnlySpecifier:(id)a3
{
}

- (PSSpecifier)allowGroupsWithOneContactSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setAllowGroupsWithOneContactSpecifier:(id)a3
{
}

- (PSSpecifier)allowSpecificContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setAllowSpecificContactsSpecifier:(id)a3
{
}

- (PSSpecifier)allowedContactsGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setAllowedContactsGroupSpecifier:(id)a3
{
}

- (PSSpecifier)addContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setAddContactsSpecifier:(id)a3
{
}

- (NSMutableArray)allowedContactsSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setAllowedContactsSpecifiers:(id)a3
{
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setCommunicationLimits:(id)a3
{
}

- (CNUIFamilyMemberWhitelistedContactsController)whitelistedContactsController
{
  return (CNUIFamilyMemberWhitelistedContactsController *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setWhitelistedContactsController:(id)a3
{
}

- (BOOL)syncingWhitelistedContacts
{
  return self->_syncingWhitelistedContacts;
}

- (void)setSyncingWhitelistedContacts:(BOOL)a3
{
  self->_syncingWhitelistedContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedContactsController, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowedContactsSpecifiers, 0);
  objc_storeStrong((id *)&self->_addContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedContactsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowSpecificContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_allowGroupsWithOneContactSpecifier, 0);
  objc_storeStrong((id *)&self->_allowContactsOnlySpecifier, 0);
  objc_storeStrong((id *)&self->_allowEveryoneSpecifier, 0);

  objc_storeStrong((id *)&self->_allowedCommunicationGroupSpecifier, 0);
}

@end