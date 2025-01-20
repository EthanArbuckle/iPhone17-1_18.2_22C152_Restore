@interface SUSUISoftwareUpdateBetaUpdatesController
- (BOOL)isBusy;
- (NSArray)programsList;
- (NSString)appleAccountServiceName;
- (PSSpecifier)appleIDGroupSpecifier;
- (PSSpecifier)appleIDSpecifier;
- (PSSpecifier)mismatchedSpecifier;
- (PSSpecifier)programsGroup;
- (PSSpecifier)unavailableProgramNoticeSpecifier;
- (id)_specifierForBetaProgram:(id)a3 rowIdentifier:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)updateController;
- (void)presentAuthKitController;
- (void)presentAuthenticationDialog;
- (void)setAppleAccountServiceName:(id)a3;
- (void)setAppleIDGroupSpecifier:(id)a3;
- (void)setAppleIDSpecifier:(id)a3;
- (void)setIsBusy:(BOOL)a3;
- (void)setMismatchedSpecifier:(id)a3;
- (void)setProgramsGroup:(id)a3;
- (void)setProgramsList:(id)a3;
- (void)setUnavailableProgramNoticeSpecifier:(id)a3;
- (void)setupProgramListSpecifiers;
- (void)setupProgramsGroupSpecifier;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooter;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SUSUISoftwareUpdateBetaUpdatesController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  [(SUSUISoftwareUpdateBetaUpdatesController *)&v5 viewDidLoad];
  [(SUSUISoftwareUpdateBetaUpdatesController *)v7 setIsBusy:0];
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[v4 localizedStringForKey:@"GET_BETA_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  id v2 = (id)[(SUSUISoftwareUpdateBetaUpdatesController *)v7 navigationItem];
  [v2 setTitle:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  [(SUSUISoftwareUpdateBetaUpdatesController *)&v6 viewDidAppear:a3];
  id v3 = v9;
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"GET_BETA_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  -[PSListController addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:](v3, "addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:");
}

- (id)specifiers
{
  v26 = self;
  SEL v25 = a2;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    for (unint64_t i = 0;
          i < [*(id *)((char *)&v26->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count];
          ++i)
    {
      id v19 = (id)[*(id *)((char *)&v26->super.super.super.super.super.isa+ (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:i];
      id v18 = (id)objc_msgSend(NSNumber, "numberWithInt:", !-[SUSUISoftwareUpdateBetaUpdatesController isBusy](v26, "isBusy"));
      objc_msgSend(v19, "setProperty:forKey:");
    }
    id v27 = *(id *)((char *)&v26->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  }
  else
  {
    [(SUSUISoftwareUpdateBetaUpdatesController *)v26 setupProgramsGroupSpecifier];
    [(SUSUISoftwareUpdateBetaUpdatesController *)v26 setupProgramListSpecifiers];
    [(SUSUISoftwareUpdateBetaUpdatesController *)v26 updateFooter];
    id v23 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:6];
    v13 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 programsGroup];
    objc_msgSend(v23, "addObject:");

    v14 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 programsList];
    objc_msgSend(v23, "addObjectsFromArray:");

    v15 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 appleIDGroupSpecifier];
    objc_msgSend(v23, "addObject:");

    v16 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 mismatchedSpecifier];
    char v21 = 0;
    BOOL v17 = 1;
    if (!v16)
    {
      id v22 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 updateController];
      char v21 = 1;
      BOOL v17 = [v22 betaUpdatesHasInstallationRestriction] != 0;
    }
    if (v21) {

    }
    if (v17)
    {
      v12 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 unavailableProgramNoticeSpecifier];
      objc_msgSend(v23, "addObject:");
    }
    v11 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 appleIDSpecifier];

    if (v11)
    {
      v10 = [(SUSUISoftwareUpdateBetaUpdatesController *)v26 appleIDSpecifier];
      objc_msgSend(v23, "addObject:");
    }
    for (unint64_t j = 0; j < [v23 count]; ++j)
    {
      id v9 = (id)[v23 objectAtIndexedSubscript:j];
      id v8 = (id)objc_msgSend(NSNumber, "numberWithInt:", !-[SUSUISoftwareUpdateBetaUpdatesController isBusy](v26, "isBusy"));
      objc_msgSend(v9, "setProperty:forKey:");
    }
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v23];
    BOOL v7 = (int *)MEMORY[0x263F5FDB8];
    id v3 = (void **)((char *)&v26->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    id v4 = *v3;
    *id v3 = v2;

    id v27 = *(id *)((char *)&v26->super.super.super.super.super.isa + *v7);
    objc_storeStrong(&v23, 0);
  }
  id v5 = v27;
  return v5;
}

- (void)setMismatchedSpecifier:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_mismatchedSpecifier, location[0]);
  objc_storeStrong((id *)&v4->_appleIDSpecifier, 0);
  objc_storeStrong((id *)&v4->_appleIDGroupSpecifier, 0);
  objc_storeStrong(location, 0);
}

- (PSSpecifier)appleIDGroupSpecifier
{
  if (!self->_appleIDGroupSpecifier)
  {
    id v2 = (PSSpecifier *)(id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"BETA_PROGRAMS_APPLE_ID_GROUP"];
    appleIDGroupSpecifier = self->_appleIDGroupSpecifier;
    self->_appleIDGroupSpecifier = v2;
  }
  id v4 = self->_appleIDGroupSpecifier;
  return v4;
}

- (PSSpecifier)unavailableProgramNoticeSpecifier
{
  v38 = self;
  v37[1] = (id)a2;
  if (self->_unavailableProgramNoticeSpecifier)
  {
    v39 = v38->_unavailableProgramNoticeSpecifier;
  }
  else
  {
    id v2 = (PSSpecifier *)(id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26DCD7690 target:0 set:0 get:0 detail:0 cell:4 edit:0];
    unint64_t v30 = 0x26820F000uLL;
    unavailableProgramNoticeSpecifier = v38->_unavailableProgramNoticeSpecifier;
    v38->_unavailableProgramNoticeSpecifier = v2;

    id v31 = *(Class *)((char *)&v38->super.super.super.super.super.isa + *(int *)(v30 + 1800));
    [v31 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    id v32 = [(SUSUISoftwareUpdateBetaUpdatesController *)v38 updateController];
    v37[0] = (id)[v32 betaUpdatesAppleID];

    id v36 = 0;
    uint64_t v35 = 0;
    id v33 = [(SUSUISoftwareUpdateBetaUpdatesController *)v38 updateController];
    uint64_t v34 = [v33 betaUpdatesHasInstallationRestriction];

    uint64_t v35 = v34;
    if (v34 == 2)
    {
      uint64_t v28 = MEMORY[0x263F086E0];
      id v29 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = (id)[v29 localizedStringForKey:@"BETA_UPDATES_MDM_RESTRICTED" value:&stru_26DCD7690 table:@"Software Update"];
      id v5 = v36;
      id v36 = v4;
    }
    else if (v35 == 1)
    {
      uint64_t v26 = MEMORY[0x263F086E0];
      id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = (id)[v27 localizedStringForKey:@"BETA_UPDATES_LOCKDOWN_RESTRICTED" value:&stru_26DCD7690 table:@"Software Update"];
      BOOL v7 = v36;
      id v36 = v6;
    }
    else if (v37[0])
    {
      id v23 = (id)NSString;
      uint64_t v22 = MEMORY[0x263F086E0];
      id v25 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v24 = (id)[v25 localizedStringForKey:@"BETA_UPDATES_MISMATCHED_APPLE_ACCOUNT" value:&stru_26DCD7690 table:@"Software Update"];
      id v8 = (id)[v23 stringWithFormat:v37[0]];
      id v9 = v36;
      id v36 = v8;
    }
    else
    {
      id v19 = (id)NSString;
      uint64_t v18 = MEMORY[0x263F086E0];
      id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v20 = (id)[v21 localizedStringForKey:@"BETA_UPDATES_NO_APPLE_ACCOUNT" value:&stru_26DCD7690 table:@"Software Update"];
      id v10 = (id)objc_msgSend(v19, "stringWithFormat:");
      v11 = v36;
      id v36 = v10;
    }
    unint64_t v15 = 0x26820F000uLL;
    v12 = v38->_unavailableProgramNoticeSpecifier;
    location = &v36;
    [(PSSpecifier *)v12 setProperty:v36 forKey:*MEMORY[0x263F602C8]];
    [*(id *)((char *)&v38->super.super.super.super.super.isa + *(int *)(v15 + 1800)) setProperty:&unk_26DCE4B00 forKey:*MEMORY[0x263F5FEE8]];
    [*(id *)((char *)&v38->super.super.super.super.super.isa + *(int *)(v15 + 1800)) setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [*(id *)((char *)&v38->super.super.super.super.super.isa + *(int *)(v15 + 1800)) setProperty:@"BETA_PROGRAMS_NOTICE" forKey:*MEMORY[0x263F60138]];
    v39 = (PSSpecifier *)*(id *)((char *)&v38->super.super.super.super.super.isa + *(int *)(v15 + 1800));
    obunint64_t j = 0;
    objc_storeStrong(location, 0);
    objc_storeStrong(v37, obj);
  }
  v13 = v39;
  return v13;
}

- (PSSpecifier)appleIDSpecifier
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v41 = self;
  SEL v40 = a2;
  if (self->_appleIDSpecifier)
  {
    v42 = v41->_appleIDSpecifier;
  }
  else
  {
    id v21 = [(SUSUISoftwareUpdateBetaUpdatesController *)v41 updateController];
    uint64_t v22 = [v21 betaUpdatesHasInstallationRestriction];

    uint64_t v39 = v22;
    if (v22)
    {
      id location = _SUSUILoggingFacility();
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v43, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController appleIDSpecifier]", v39);
        _os_log_impl(&dword_228401000, (os_log_t)location, v37, "%s: Hiding Apple ID row - device has installation restriction (%ld).", v43, 0x16u);
      }
      objc_storeStrong(&location, 0);
      v42 = 0;
    }
    else
    {
      id v19 = [(SUSUISoftwareUpdateBetaUpdatesController *)v41 updateController];
      id v36 = (id)[v19 betaUpdatesAppleID];

      id v35 = 0;
      id v20 = [(SUSUISoftwareUpdateBetaUpdatesController *)v41 mismatchedSpecifier];

      if (v20)
      {
        char v33 = 0;
        char v31 = 0;
        char v29 = 0;
        char v27 = 0;
        char v25 = 0;
        char v23 = 0;
        if (v36)
        {
          BOOL v17 = NSString;
          id v34 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v33 = 1;
          id v32 = (id)[v34 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_MISMATCH_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
          char v31 = 1;
          id v30 = (id)objc_msgSend(v17, "stringWithFormat:");
          char v29 = 1;
          obunint64_t j = v30;
        }
        else
        {
          v16 = NSString;
          id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          char v27 = 1;
          id v26 = (id)[v28 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
          char v25 = 1;
          id v24 = (id)objc_msgSend(v16, "stringWithFormat:");
          char v23 = 1;
          obunint64_t j = v24;
        }
        objc_storeStrong(&v35, obj);
        if (v23) {

        }
        if (v25) {
        if (v27)
        }

        if (v29) {
        if (v31)
        }

        if (v33) {
      }
        }
      else if (v36)
      {
        v13 = NSString;
        id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v14 = (id)[v15 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_PREFIX" value:&stru_26DCD7690 table:@"Software Update"];
        id v2 = (id)[v13 stringWithFormat:v36];
        id v3 = v35;
        id v35 = v2;
      }
      else
      {
        id v10 = NSString;
        id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v11 = (id)[v12 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
        id v4 = (id)objc_msgSend(v10, "stringWithFormat:");
        id v5 = v35;
        id v35 = v4;
      }
      id v6 = (PSSpecifier *)(id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v35 target:v41 set:0 get:0 detail:0 cell:13 edit:0];
      appleIDSpecifier = v41->_appleIDSpecifier;
      v41->_appleIDSpecifier = v6;

      [(PSSpecifier *)v41->_appleIDSpecifier setProperty:@"BETA_PROGRAMS_APPLE_ID" forKey:*MEMORY[0x263F60138]];
      v42 = v41->_appleIDSpecifier;
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
  }
  id v8 = v42;
  return v8;
}

- (void)setupProgramsGroupSpecifier
{
  id v2 = [(SUSUISoftwareUpdateBetaUpdatesController *)self programsGroup];
  BOOL v5 = v2 != 0;

  if (!v5)
  {
    id v3 = (id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"BETA_PROGRAMS_LIST_GROUP"];
    -[SUSUISoftwareUpdateBetaUpdatesController setProgramsGroup:](self, "setProgramsGroup:");

    id v4 = [(SUSUISoftwareUpdateBetaUpdatesController *)self programsGroup];
    [(PSSpecifier *)v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  }
}

- (void)updateFooter
{
  id v21 = self;
  v20[1] = (id)a2;
  id v4 = NSString;
  id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BETA_UPDATES_FOOTER"];
  id v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:");
  v20[0] = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

  id v10 = v20[0];
  id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = (id)[v12 localizedStringForKey:@"LEARN_MORE_LINK" value:&stru_26DCD7690 table:@"Software Update"];
  v19.id location = objc_msgSend(v10, "rangeOfString:");
  v19.length = v2;

  id v14 = [(SUSUISoftwareUpdateBetaUpdatesController *)v21 programsGroup];
  id v3 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v3);
  -[PSSpecifier setProperty:forKey:](v14, "setProperty:forKey:");

  id v15 = [(SUSUISoftwareUpdateBetaUpdatesController *)v21 programsGroup];
  [(PSSpecifier *)v15 setProperty:v20[0] forKey:*MEMORY[0x263F600E8]];

  BOOL v17 = [(SUSUISoftwareUpdateBetaUpdatesController *)v21 programsGroup];
  v16 = NSStringFromRange(v19);
  -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:");

  uint64_t v18 = [(SUSUISoftwareUpdateBetaUpdatesController *)v21 programsGroup];
  [(PSSpecifier *)v18 setProperty:@"https://beta.apple.com/" forKey:*MEMORY[0x263F600F0]];

  objc_storeStrong(v20, 0);
}

- (void)setupProgramListSpecifiers
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v51 = self;
  v50[1] = (id)a2;
  -[SUSUISoftwareUpdateBetaUpdatesController setMismatchedSpecifier:](self, "setMismatchedSpecifier:");
  id v25 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 updateController];
  v50[0] = (id)[v25 availableBetaPrograms];

  id v49 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v50[0], "count") + 2);
  id v26 = (void *)MEMORY[0x263F5FC40];
  id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v27 = (id)[v28 localizedStringForKey:@"OFF" value:&stru_26DCD7690 table:@"Software Update"];
  id v48 = (id)objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  [v48 setProperty:@"BETA_PROGRAMS_OFF_SELECTION" forKey:*MEMORY[0x263F60138]];
  id v29 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 updateController];
  id v47 = (id)[v29 enrolledBetaProgram];

  id v30 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 updateController];
  id v2 = (id)[v30 enrolledBetaProgram];
  BOOL v31 = v2 != 0;

  if (!v31)
  {
    id v24 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 programsGroup];
    [(PSSpecifier *)v24 setProperty:v48 forKey:*MEMORY[0x263F60200]];
  }
  [v49 addObject:v48];
  char v45 = 0;
  char v43 = 0;
  LOBYTE(v23) = 0;
  if (v47)
  {
    id v46 = (id)[v50[0] valueForKey:@"programID"];
    char v45 = 1;
    id v44 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v47, "programID"));
    char v43 = 1;
    int v23 = objc_msgSend(v46, "containsObject:") ^ 1;
  }
  if (v43) {

  }
  if (v45) {
  if (v23)
  }
  {
    id v42 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 _specifierForBetaProgram:v47 rowIdentifier:@"BETA_PROGRAMS_UNAVAILABLE_PROGRAM"];
    [v49 addObject:v42];
    uint64_t v22 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 programsGroup];
    [(PSSpecifier *)v22 setProperty:v42 forKey:*MEMORY[0x263F60200]];

    [(SUSUISoftwareUpdateBetaUpdatesController *)v51 setMismatchedSpecifier:v42];
    objc_storeStrong(&v42, 0);
  }
  id v20 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 updateController];
  uint64_t v21 = [v20 betaUpdatesHasInstallationRestriction];

  uint64_t v41 = v21;
  BOOL v40 = v21 == 0;
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v18 = type;
    NSRange v19 = SUBetaUpdatesRestrictionToString(v41);
    os_log_type_t v37 = v19;
    __os_log_helper_16_2_3_8_32_8_64_8_0((uint64_t)v54, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController setupProgramListSpecifiers]", (uint64_t)v37, v41);
    _os_log_impl(&dword_228401000, log, v18, "%s: Beta program restriction type: %@ (%ld)", v54, 0x20u);

    objc_storeStrong((id *)&v37, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  obunint64_t j = v50[0];
  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(id *)(__b[1] + 8 * v13);
      id v3 = (id)[v36 title];
      BOOL v10 = v3 != 0;

      if (v10)
      {
        BOOL v34 = 0;
        uint64_t v9 = [v47 programID];
        BOOL v34 = v9 == [v36 programID];
        id v33 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 _specifierForBetaProgram:v36 rowIdentifier:0];
        if (v34)
        {
          id v8 = [(SUSUISoftwareUpdateBetaUpdatesController *)v51 programsGroup];
          [(PSSpecifier *)v8 setProperty:v33 forKey:*MEMORY[0x263F60200]];

          [v49 addObject:v33];
        }
        else if (v40)
        {
          [v49 addObject:v33];
        }
        else
        {
          os_log_t v32 = (os_log_t)_SUSUILoggingFacility();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v6 = v32;
            id v7 = (__CFString *)(id)[v36 title];
            if (v7) {
              id v5 = v7;
            }
            else {
              id v5 = @"(null)");
            }
            __os_log_helper_16_2_2_8_32_8_66((uint64_t)v52, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController setupProgramListSpecifiers]", (uint64_t)v5);
            _os_log_impl(&dword_228401000, v6, OS_LOG_TYPE_DEFAULT, "%s: Skipping adding %{public}@ to program list", v52, 0x16u);
          }
          objc_storeStrong((id *)&v32, 0);
        }
        objc_storeStrong(&v33, 0);
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v49];
  -[SUSUISoftwareUpdateBetaUpdatesController setProgramsList:](v51, "setProgramsList:");

  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(v50, 0);
}

- (id)_specifierForBetaProgram:(id)a3 rowIdentifier:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v8 = (void *)MEMORY[0x263F5FC40];
  id v9 = (id)[location[0] title];
  id v11 = (id)objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  if (v12)
  {
    [v11 setProperty:v12 forKey:*MEMORY[0x263F60138]];
  }
  else
  {
    id v6 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(location[0], "programID"));
    id v10 = (id)[v6 stringValue];

    [v11 setUserInfo:location[0]];
    [v11 setProperty:v10 forKey:*MEMORY[0x263F60138]];
    objc_storeStrong(&v10, 0);
  }
  [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  id v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)updateController
{
  return (id)[(SUSUISoftwareUpdateBetaUpdatesController *)self parentController];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  v52.receiver = v55;
  v52.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  [(SUSUISoftwareUpdateBetaUpdatesController *)&v52 tableView:location[0] didSelectRowAtIndexPath:v53];
  id v51 = (id)[(SUSUISoftwareUpdateBetaUpdatesController *)v55 specifierAtIndexPath:v53];
  id v50 = (id)[v51 propertyForKey:*MEMORY[0x263F60138]];
  if ([v50 isEqualToString:@"BETA_PROGRAMS_OFF_SELECTION"])
  {
    id v49 = _SUSUILoggingFacility();
    os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v58, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController tableView:didSelectRowAtIndexPath:]");
      _os_log_impl(&dword_228401000, (os_log_t)v49, v48, "%s: Unenrolling from beta updates", v58, 0xCu);
    }
    objc_storeStrong(&v49, 0);
    os_log_type_t v18 = v55;
    objc_sync_enter(v18);
    if ([(SUSUISoftwareUpdateBetaUpdatesController *)v55 isBusy])
    {
      int v47 = 1;
    }
    else
    {
      [(SUSUISoftwareUpdateBetaUpdatesController *)v55 setIsBusy:1];
      int v47 = 0;
    }
    objc_sync_exit(v18);

    if (!v47)
    {
      [(SUSUISoftwareUpdateBetaUpdatesController *)v55 reloadSpecifiers];
      id v17 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 updateController];
      uint64_t v41 = MEMORY[0x263EF8330];
      int v42 = -1073741824;
      int v43 = 0;
      id v44 = __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke;
      char v45 = &unk_26483BF90;
      id v46 = v55;
      [v17 unenrollFromBetaProgramsWithCompletion:&v41];

      uint64_t v16 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 programsGroup];
      [(PSSpecifier *)v16 setProperty:v51 forKey:*MEMORY[0x263F60200]];

      objc_storeStrong((id *)&v46, 0);
LABEL_41:
      int v47 = 0;
    }
  }
  else
  {
    if ([v50 isEqualToString:@"BETA_PROGRAMS_APPLE_ID"])
    {
      id v40 = _SUSUILoggingFacility();
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v57, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController tableView:didSelectRowAtIndexPath:]");
        _os_log_impl(&dword_228401000, (os_log_t)v40, v39, "%s: Switch Beta Apple ID button tapped.", v57, 0xCu);
      }
      objc_storeStrong(&v40, 0);
      unint64_t v14 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 mismatchedSpecifier];
      char v37 = 0;
      char v35 = 0;
      BOOL v15 = 1;
      if (!v14)
      {
        id v38 = (id)[MEMORY[0x263F67CE8] sharedManager];
        char v37 = 1;
        id v36 = (id)[v38 seedingAppleIDUsernameForCurrentDevice];
        char v35 = 1;
        BOOL v15 = v36 == 0;
      }
      if (v35) {

      }
      if (v37) {
      if (v15)
      }
        [(SUSUISoftwareUpdateBetaUpdatesController *)v55 presentAuthKitController];
      else {
        [(SUSUISoftwareUpdateBetaUpdatesController *)v55 presentAuthenticationDialog];
      }
      goto LABEL_41;
    }
    id v13 = (id)[v51 userInfo];
    objc_opt_class();
    LOBYTE(v12) = 0;
    if (objc_opt_isKindOfClass()) {
      int v12 = [v50 isEqualToString:@"BETA_PROGRAMS_UNAVAILABLE_PROGRAM"] ^ 1;
    }

    if ((v12 & 1) == 0) {
      goto LABEL_41;
    }
    id v34 = (id)[v51 userInfo];
    id v11 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 updateController];
    id v9 = (id)[v11 enrolledBetaProgram];
    char v32 = 0;
    char v30 = 0;
    BOOL v10 = 0;
    if (v9)
    {
      BOOL v10 = 0;
      if (v34)
      {
        id v33 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 updateController];
        char v32 = 1;
        id v31 = (id)[v33 enrolledBetaProgram];
        char v30 = 1;
        uint64_t v8 = [v31 programID];
        BOOL v10 = v8 == [v34 programID];
      }
    }
    if (v30) {

    }
    if (v32) {
    if (v10)
    }
    {
      int v47 = 1;
    }
    else
    {
      id v7 = v55;
      objc_sync_enter(v7);
      if ([(SUSUISoftwareUpdateBetaUpdatesController *)v55 isBusy])
      {
        int v47 = 1;
      }
      else
      {
        [(SUSUISoftwareUpdateBetaUpdatesController *)v55 setIsBusy:1];
        int v47 = 0;
      }
      objc_sync_exit(v7);

      if (!v47)
      {
        [(SUSUISoftwareUpdateBetaUpdatesController *)v55 reloadSpecifiers];
        os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_32_8_0((uint64_t)v56, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController tableView:didSelectRowAtIndexPath:]", [v34 programID]);
          _os_log_impl(&dword_228401000, oslog, v28, "%s: Enrolling in program %ld", v56, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v6 = [(SUSUISoftwareUpdateBetaUpdatesController *)v55 updateController];
        id v4 = v34;
        id v5 = v55;
        uint64_t v20 = MEMORY[0x263EF8330];
        int v21 = -1073741824;
        int v22 = 0;
        int v23 = __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_355;
        id v24 = &unk_26483BEC8;
        id v25 = v34;
        id v26 = v55;
        id v27 = v51;
        [v6 setBetaProgramFromUI:v4 forViewController:v5 withCompletion:&v20];

        objc_storeStrong(&v27, 0);
        objc_storeStrong((id *)&v26, 0);
        objc_storeStrong(&v25, 0);
        int v47 = 0;
      }
    }
    objc_storeStrong(&v34, 0);
    if (!v47) {
      goto LABEL_41;
    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

void __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1, char a2)
{
  int v12 = a1;
  char v11 = a2 & 1;
  v10[1] = a1;
  dispatch_time_t when = dispatch_time(0, 1000000000);
  queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  id v9 = &unk_26483BA90;
  v10[0] = a1[4];
  dispatch_after(when, queue, &v5);

  objc_storeStrong(v10, 0);
}

uint64_t __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_355(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  location[1] = (id)a1;
  location[0] = _SUSUILoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = "Sucessfully enroll";
    if ((v15 & 1) == 0) {
      id v2 = "Failed to enroll";
    }
    __os_log_helper_16_2_3_8_32_8_32_8_0((uint64_t)v17, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController tableView:didSelectRowAtIndexPath:]_block_invoke", (uint64_t)v2, [*(id *)(a1 + 32) programID]);
    _os_log_impl(&dword_228401000, (os_log_t)location[0], v13, "%s: %s in program %ld", v17, 0x20u);
  }
  objc_storeStrong(location, 0);
  if (v15)
  {
    id v5 = (id)[*(id *)(a1 + 40) programsGroup];
    [v5 setProperty:*(void *)(a1 + 48) forKey:*MEMORY[0x263F60200]];
  }
  dispatch_time_t when = dispatch_time(0, 1000000000);
  queue = MEMORY[0x263EF83A0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  BOOL v10 = __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_358;
  char v11 = &unk_26483BA90;
  id v12 = *(id *)(a1 + 40);
  dispatch_after(when, queue, &v7);

  objc_storeStrong(&v12, 0);
}

uint64_t __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke_358(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  v17.receiver = v21;
  v17.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  id v18 = [(SUSUISoftwareUpdateBetaUpdatesController *)&v17 tableView:location[0] cellForRowAtIndexPath:v19];
  id v16 = (id)[(SUSUISoftwareUpdateBetaUpdatesController *)v21 specifierAtIndexPath:v19];
  id v15 = (id)[v16 propertyForKey:*MEMORY[0x263F60138]];
  if ([v15 isEqualToString:@"BETA_PROGRAMS_NOTICE"])
  {
    id v14 = v18;
    id v6 = (id)[v14 detailTextLabel];
    [v6 setNumberOfLines:0];

    id v10 = (id)[v14 imageView];
    uint64_t v7 = (void *)MEMORY[0x263F827E8];
    id v9 = (id)[MEMORY[0x263F82818] configurationWithScale:3];
    id v8 = (id)objc_msgSend(v7, "systemImageNamed:withConfiguration:", @"exclamationmark.triangle.fill");
    objc_msgSend(v10, "setImage:");

    id v12 = (id)[v14 imageView];
    id v11 = (id)[MEMORY[0x263F825C8] systemYellowColor];
    objc_msgSend(v12, "setTintColor:");

    objc_storeStrong(&v14, 0);
  }
  id v5 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)presentAuthenticationDialog
{
  v69 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v38 = (id)[MEMORY[0x263F67CE8] sharedManager];
  id v67 = (id)[v38 seedingAppleIDUsernameForCurrentDevice];

  id v36 = (id)[MEMORY[0x263F67CE8] sharedManager];
  char v37 = [v36 isCurrentDeviceUsingSeedingAppleID];

  char v66 = v37 & 1;
  id v65 = 0;
  if (v67)
  {
    char v32 = NSString;
    id v31 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v30 = (id)[v31 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_ALERT_MESSAGE" value:&stru_26DCD7690 table:@"Software Update"];
    id v4 = (id)[v32 stringWithFormat:v67];
    id v5 = v65;
    id v65 = v4;
  }
  else
  {
    char v35 = NSString;
    id v34 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v33 = (id)[v34 localizedStringForKey:@"BETA_UPDATES_AUTHENTICATION_NO_APPLE_ACCOUNT_MESSAGE" value:&stru_26DCD7690 table:@"Software Update"];
    id v2 = (id)objc_msgSend(v35, "stringWithFormat:");
    id v3 = v65;
    id v65 = v2;
  }
  os_log_type_t v28 = (void *)MEMORY[0x263F82418];
  id v29 = NSString;
  id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = (id)[v27 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
  id v25 = (id)objc_msgSend(v29, "stringWithFormat:");
  id v64 = (id)objc_msgSend(v28, "alertControllerWithTitle:message:preferredStyle:");

  id v22 = v64;
  int v23 = (void *)MEMORY[0x263F82400];
  id v24 = NSString;
  id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v20 = (id)[v21 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_MISMATCH_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
  id v19 = (id)objc_msgSend(v24, "stringWithFormat:");
  uint64_t v58 = MEMORY[0x263EF8330];
  int v59 = -1073741824;
  int v60 = 0;
  v61 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke;
  v62 = &unk_26483D8B8;
  objc_copyWeak(&v63, location);
  id v18 = (id)[v23 actionWithTitle:v19 style:0 handler:&v58];
  objc_msgSend(v22, "addAction:");

  if (v66)
  {
    id v17 = (id)[MEMORY[0x263F67CE8] sharedManager];
    id v57 = (id)[v17 deviceAppleIDUsernameForCurrentDevice];

    char v54 = 0;
    char v52 = 0;
    char v50 = 0;
    char v48 = 0;
    char v46 = 0;
    if (v57)
    {
      id v16 = NSString;
      id v55 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v54 = 1;
      id v53 = (id)[v55 localizedStringForKey:@"BETA_UPDATES_SIGN_OUT_APPLE_ACCOUNT" value:&stru_26DCD7690 table:@"Software Update"];
      char v52 = 1;
      id v51 = (id)[v16 stringWithFormat:v57];
      char v50 = 1;
      id v6 = v51;
    }
    else
    {
      id v49 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v48 = 1;
      id v47 = (id)[v49 localizedStringForKey:@"BETA_UPDATES_SIGN_OUT" value:&stru_26DCD7690 table:@"Software Update"];
      char v46 = 1;
      id v6 = v47;
    }
    id v56 = v6;
    if (v46) {

    }
    if (v48) {
    if (v50)
    }

    if (v52) {
    if (v54)
    }

    id v13 = v64;
    id v15 = (void *)MEMORY[0x263F82400];
    id v14 = v56;
    uint64_t v39 = MEMORY[0x263EF8330];
    int v40 = -1073741824;
    int v41 = 0;
    int v42 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_385;
    int v43 = &unk_26483D930;
    objc_copyWeak(&v45, location);
    id v44 = v69;
    id v12 = (id)[v15 actionWithTitle:v14 style:0 handler:&v39];
    objc_msgSend(v13, "addAction:");

    objc_storeStrong((id *)&v44, 0);
    objc_destroyWeak(&v45);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
  }
  id v10 = v64;
  id v11 = (void *)MEMORY[0x263F82400];
  id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (id)[v9 localizedStringForKey:@"CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
  id v7 = (id)objc_msgSend(v11, "actionWithTitle:style:handler:");
  objc_msgSend(v10, "addAction:");

  [(SUSUISoftwareUpdateBetaUpdatesController *)v69 presentViewController:v64 animated:1 completion:0];
  objc_destroyWeak(&v63);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v67, 0);
  objc_destroyWeak(location);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke(id *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke");
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Asked to use a different account.", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [v4[0] presentAuthKitController];
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_385(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  v11[0] = objc_loadWeakRetained(a1 + 5);
  id v3 = (id)[MEMORY[0x263F67CE8] sharedManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_2;
  id v8 = &unk_26483D908;
  id v9 = v11[0];
  id v10 = a1[4];
  objc_msgSend(v3, "deleteSeedingAppleAccountForCurrentDeviceWithCompletion:");

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_2(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  if (location[0])
  {
    v12[0] = _SUSUILoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke_2", (uint64_t)location[0]);
      _os_log_error_impl(&dword_228401000, (os_log_t)v12[0], v11, "%s: Failed to delete seeding data. Error: %{public}@.", v14, 0x16u);
    }
    objc_storeStrong(v12, 0);
  }
  id v3 = (id)[a1[4] updateController];
  id v2 = (id)[v3 manager];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_386;
  id v9 = &unk_26483D8E0;
  id v10 = a1[5];
  [v2 refreshBetaUpdates:&v5];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_386(NSObject *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke", (uint64_t)v6);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Beta Updates have been refreshed. Error: %{public}@.", v8, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)a1[4].isa reloadSpecifiers];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_392(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0);
}

- (void)presentAuthKitController
{
  int v23 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v21 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v21 setShouldAllowAppleIDCreation:0];
  [v21 setAuthenticationType:2];
  [v21 setPresentingViewController:v23];
  [v21 setIsEphemeral:0];
  id v12 = NSString;
  id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
  id v9 = (id)objc_msgSend(v12, "stringWithFormat:");
  objc_msgSend(v21, "setTitle:");

  id v8 = NSString;
  id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = (id)[v7 localizedStringForKey:@"BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
  id v5 = (id)objc_msgSend(v8, "stringWithFormat:");
  objc_msgSend(v21, "setReason:");

  id v4 = objc_alloc(MEMORY[0x263F29118]);
  id v20 = (id)[v4 initWithIdentifier:*MEMORY[0x263F67D00]];
  id v3 = v20;
  id v2 = v21;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke;
  id v17 = &unk_26483D958;
  objc_copyWeak(&v19, location);
  id v18 = v23;
  [v3 authenticateWithContext:v2 completion:&v13];
  objc_storeStrong((id *)&v18, 0);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_destroyWeak(location);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 5);
  objc_storeStrong((id *)a1[4] + 177, 0);
  if (v21)
  {
    id v19 = _SUSUILoggingFacility();
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v24, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v21);
      _os_log_error_impl(&dword_228401000, (os_log_t)v19, v18, "%s: Beta Updates failed to log in: %{public}@", v24, 0x16u);
    }
    objc_storeStrong(&v19, 0);
    int v17 = 1;
  }
  else
  {
    id v16 = _SUSUILoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v23, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke");
      _os_log_impl(&dword_228401000, (os_log_t)v16, v15, "%s: Beta Updates successfully log in", v23, 0xCu);
    }
    objc_storeStrong(&v16, 0);
    id v14 = (id)[location[0] objectForKeyedSubscript:*MEMORY[0x263F28F58]];
    id v4 = (id)[MEMORY[0x263F67CE8] sharedManager];
    id v3 = v14;
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_398;
    id v11 = &unk_26483D908;
    id v12 = v20[0];
    id v13 = a1[4];
    [v4 saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:v3 completion:&v7];

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v14, 0);
    int v17 = 0;
  }
  objc_storeStrong(v20, 0);
  if (!v17) {
    int v17 = 0;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_398(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  if (location[0])
  {
    v13[0] = _SUSUILoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = (id)[location[0] description];
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v4);
      _os_log_error_impl(&dword_228401000, (os_log_t)v13[0], v12, "%s: Failed to save new Apple ID to seeding: %@", v15, 0x16u);
    }
    objc_storeStrong(v13, 0);
  }
  id v3 = (id)[a1[4] updateController];
  id v2 = (id)[v3 manager];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_399;
  id v10 = &unk_26483D8E0;
  id v11 = a1[5];
  [v2 refreshBetaUpdates:&v6];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_399(NSObject *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v6);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Beta Updates have been refreshed. Error: %{public}@.", v8, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)a1[4].isa reloadSpecifiers];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (PSSpecifier)programsGroup
{
  return self->_programsGroup;
}

- (void)setProgramsGroup:(id)a3
{
}

- (NSArray)programsList
{
  return self->_programsList;
}

- (void)setProgramsList:(id)a3
{
}

- (void)setAppleIDGroupSpecifier:(id)a3
{
}

- (void)setAppleIDSpecifier:(id)a3
{
}

- (void)setUnavailableProgramNoticeSpecifier:(id)a3
{
}

- (NSString)appleAccountServiceName
{
  return self->_appleAccountServiceName;
}

- (void)setAppleAccountServiceName:(id)a3
{
}

- (PSSpecifier)mismatchedSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mismatchedSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (void).cxx_destruct
{
}

@end