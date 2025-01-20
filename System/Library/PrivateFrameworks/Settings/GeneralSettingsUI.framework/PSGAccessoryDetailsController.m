@interface PSGAccessoryDetailsController
- (PSGAccessoryDetailsController)init;
- (id)bonjourName;
- (id)firmwareRevision;
- (id)hardwareRevision;
- (id)manufacturer;
- (id)modelNumber;
- (id)serialNumber;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessoryDidUpdate:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)findAppForAccessory;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSGAccessoryDetailsController

- (PSGAccessoryDetailsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSGAccessoryDetailsController;
  v2 = [(PSGAccessoryDetailsController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E80] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E98] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E88] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EA8] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EC0] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EB0] object:0];
    [v3 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EB8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  accessory = self->_accessory;
  if (accessory)
  {
    [(EAAccessory *)accessory setDelegate:0];
    objc_super v5 = self->_accessory;
    self->_accessory = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PSGAccessoryDetailsController;
  [(PSGAccessoryDetailsController *)&v6 dealloc];
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(PSGAccessoryDetailsController *)self specifier];
  objc_super v5 = [v4 userInfo];

  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    p_accessory = &self->_accessory;
    objc_storeStrong((id *)&self->_accessory, v5);
    [(EAAccessory *)self->_accessory setDelegate:self];
    uint64_t v7 = [(EAAccessory *)self->_accessory bonjourName];
    if (v7)
    {
      v8 = (void *)v7;
      int v9 = [(EAAccessory *)*p_accessory isAvailableOverBonjour];

      if (v9)
      {
        int v10 = [(EAAccessory *)*p_accessory hasIPConnection];
        v11 = (void *)MEMORY[0x263F5FC40];
        v12 = PSG_BundleForGeneralSettingsUIFramework();
        v13 = v12;
        if (v10) {
          v14 = @"DISCONNECT";
        }
        else {
          v14 = @"CONNECT";
        }
        if (v10) {
          v15 = &selRef_disconnect;
        }
        else {
          v15 = &selRef_connect;
        }
        v16 = [v12 localizedStringForKey:v14 value:&stru_26F0FADC0 table:0];
        v17 = [v11 preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v17 setButtonAction:*v15];
        [v17 setIdentifier:@"CONNECT_BUTTON"];
        [v3 addObject:v17];
      }
    }
    if ([(EAAccessory *)*p_accessory isConnected])
    {
      v18 = [(EAAccessory *)*p_accessory manufacturer];
      uint64_t v19 = [v18 length];

      v20 = (void *)MEMORY[0x263F60050];
      if (v19)
      {
        v21 = (void *)MEMORY[0x263F5FC40];
        v22 = PSG_BundleForGeneralSettingsUIFramework();
        v23 = [v22 localizedStringForKey:@"MANUFACTURER" value:&stru_26F0FADC0 table:0];
        v24 = [v21 preferenceSpecifierNamed:v23 target:self set:0 get:sel_manufacturer detail:0 cell:4 edit:0];

        [v24 setIdentifier:@"MANUFACTURER"];
        [v24 setProperty:MEMORY[0x263EFFA88] forKey:*v20];
        [v3 addObject:v24];
      }
      v25 = [(EAAccessory *)*p_accessory modelNumber];
      uint64_t v26 = [v25 length];

      if (v26)
      {
        v27 = (void *)MEMORY[0x263F5FC40];
        v28 = PSG_BundleForGeneralSettingsUIFramework();
        v29 = [v28 localizedStringForKey:@"MODELNUMBER" value:&stru_26F0FADC0 table:0];
        v30 = [v27 preferenceSpecifierNamed:v29 target:self set:0 get:sel_modelNumber detail:0 cell:4 edit:0];

        [v30 setIdentifier:@"MODELNUMBER"];
        [v30 setProperty:MEMORY[0x263EFFA88] forKey:*v20];
        [v3 addObject:v30];
      }
      v31 = [(EAAccessory *)*p_accessory serialNumber];
      uint64_t v32 = [v31 length];

      if (v32)
      {
        v33 = (void *)MEMORY[0x263F5FC40];
        v34 = PSG_BundleForGeneralSettingsUIFramework();
        v35 = [v34 localizedStringForKey:@"SERIALNUMBER" value:&stru_26F0FADC0 table:0];
        v36 = [v33 preferenceSpecifierNamed:v35 target:self set:0 get:sel_serialNumber detail:0 cell:4 edit:0];

        [v36 setIdentifier:@"SERIALNUMBER"];
        [v36 setProperty:MEMORY[0x263EFFA88] forKey:*v20];
        [v3 addObject:v36];
      }
      v37 = [(EAAccessory *)*p_accessory firmwareRevision];
      uint64_t v38 = [v37 length];

      if (v38)
      {
        v39 = (void *)MEMORY[0x263F5FC40];
        v40 = PSG_BundleForGeneralSettingsUIFramework();
        v41 = [v40 localizedStringForKey:@"FIRMWAREREVISION" value:&stru_26F0FADC0 table:0];
        v42 = [v39 preferenceSpecifierNamed:v41 target:self set:0 get:sel_firmwareRevision detail:0 cell:4 edit:0];

        [v42 setIdentifier:@"FIRMWAREREVISION"];
        [v42 setProperty:MEMORY[0x263EFFA88] forKey:*v20];
        [v3 addObject:v42];
      }
      v43 = [(EAAccessory *)*p_accessory hardwareRevision];
      uint64_t v44 = [v43 length];

      if (v44)
      {
        v45 = (void *)MEMORY[0x263F5FC40];
        v46 = PSG_BundleForGeneralSettingsUIFramework();
        v47 = [v46 localizedStringForKey:@"HARDWAREREVISION" value:&stru_26F0FADC0 table:0];
        v48 = [v45 preferenceSpecifierNamed:v47 target:self set:0 get:sel_hardwareRevision detail:0 cell:4 edit:0];

        [v48 setIdentifier:@"HARDWAREREVISION"];
        [v48 setProperty:MEMORY[0x263EFFA88] forKey:*v20];
        [v3 addObject:v48];
      }
      if ([(EAAccessory *)*p_accessory supportsPublicIap])
      {
        v49 = (void *)MEMORY[0x263F5FC40];
        v50 = PSG_BundleForGeneralSettingsUIFramework();
        v51 = [v50 localizedStringForKey:@"FIND_APP_FOR_ACCESSORY" value:&stru_26F0FADC0 table:0];
        v52 = [v49 preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v52 setButtonAction:sel_findAppForAccessory];
        [v52 setIdentifier:@"FIND_APP_FOR_ACCESSORY"];
        [v3 addObject:v52];
      }
    }
  }
  uint64_t v53 = (int)*MEMORY[0x263F5FDB8];
  v54 = *(Class *)((char *)&self->super.super.super.super.super.isa + v53);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v53) = (Class)v3;
  id v55 = v3;

  id v56 = *(id *)((char *)&self->super.super.super.super.super.isa + v53);
  return v56;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PSGAccessoryDetailsController;
  [(PSGAccessoryDetailsController *)&v8 viewDidAppear:a3];
  if (self->_shouldEscape)
  {
    v4 = [(PSGAccessoryDetailsController *)self navigationController];
    objc_super v5 = [v4 topViewController];

    if (v5 == self)
    {
      objc_super v6 = [(PSGAccessoryDetailsController *)self navigationController];
      id v7 = (id)[v6 popViewControllerAnimated:1];
    }
  }
  self->_finishedAppearing = 1;
}

- (id)manufacturer
{
  return [(EAAccessory *)self->_accessory manufacturer];
}

- (id)modelNumber
{
  return [(EAAccessory *)self->_accessory modelNumber];
}

- (id)serialNumber
{
  return [(EAAccessory *)self->_accessory serialNumber];
}

- (id)firmwareRevision
{
  return [(EAAccessory *)self->_accessory firmwareRevision];
}

- (id)hardwareRevision
{
  return [(EAAccessory *)self->_accessory hardwareRevision];
}

- (id)bonjourName
{
  return (id)[(EAAccessory *)self->_accessory bonjourName];
}

- (void)connect
{
  id v4 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  id v3 = [(EAAccessory *)self->_accessory bonjourName];
  [v4 initiateConnectionToIPAccessory:v3];
}

- (void)disconnect
{
  id v4 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  id v3 = [(EAAccessory *)self->_accessory bonjourName];
  [v4 disconnectIPAccessory:v3];
}

- (void)findAppForAccessory
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:@"action" value:@"accessory-lookup"];
  objc_super v5 = v3;
  [v3 addObject:v4];

  v40 = self;
  [(EAAccessory *)self->_accessory allPublicProtocolStrings];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x263F08BD0];
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"id%d", v9 + i);
        v14 = [v12 queryItemWithName:v13 value:v11];
        [v5 addObject:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v9 = (v9 + i);
    }
    while (v7);
  }
  v15 = (void *)MEMORY[0x263F08BD0];
  v16 = [(EAAccessory *)v40->_accessory preferredApp];
  v17 = [v15 queryItemWithName:@"bid" value:v16];
  [v5 addObject:v17];

  v18 = (void *)MEMORY[0x263F08BD0];
  uint64_t v19 = [(EAAccessory *)v40->_accessory name];
  v20 = [v18 queryItemWithName:@"accessoryName" value:v19];
  [v5 addObject:v20];

  v21 = (void *)MEMORY[0x263F08BD0];
  v22 = [(EAAccessory *)v40->_accessory manufacturer];
  v23 = [v21 queryItemWithName:@"manufacturer" value:v22];
  [v5 addObject:v23];

  v24 = (void *)MEMORY[0x263F08BD0];
  v25 = [(EAAccessory *)v40->_accessory modelNumber];
  uint64_t v26 = [v24 queryItemWithName:@"modelNumber" value:v25];
  [v5 addObject:v26];

  v27 = (void *)MEMORY[0x263F08BD0];
  v28 = [(EAAccessory *)v40->_accessory firmwareRevision];
  v29 = [v27 queryItemWithName:@"firmwareVersion" value:v28];
  [v5 addObject:v29];

  v30 = (void *)MEMORY[0x263F08BD0];
  v31 = [(EAAccessory *)v40->_accessory hardwareRevision];
  uint64_t v32 = [v30 queryItemWithName:@"hardwareVersion" value:v31];
  [v5 addObject:v32];

  v33 = (void *)MEMORY[0x263F08BD0];
  v34 = [(EAAccessory *)v40->_accessory serialNumber];
  v35 = [v33 queryItemWithName:@"serialNumber" value:v34];
  [v5 addObject:v35];

  v36 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:@"itms-apps://?"];
  [v36 setQueryItems:v5];
  v37 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v38 = [v36 URL];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __52__PSGAccessoryDetailsController_findAppForAccessory__block_invoke;
  v42[3] = &unk_264E8CAB8;
  id v43 = v36;
  id v39 = v36;
  [v37 openURL:v38 options:MEMORY[0x263EFFA78] completionHandler:v42];
}

void __52__PSGAccessoryDetailsController_findAppForAccessory__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) URL];
    NSLog(&cfstr_CouldNotOpenUr.isa, v3);
  }
}

- (void)_accessoryDidUpdate:(id)a3
{
  id v100 = a3;
  id v4 = [v100 userInfo];
  objc_super v5 = [v4 objectForKey:*MEMORY[0x263F04E90]];

  [v5 setDelegate:self];
  if (!v5)
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [v5 bonjourName];

  if (v6)
  {
    uint64_t v7 = [v5 bonjourName];
  }
  else
  {
    uint64_t v8 = [v5 name];

    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v7 = [v5 name];
  }
  uint64_t v8 = (void *)v7;
LABEL_8:
  p_accessory = &self->_accessory;
  int v10 = [(EAAccessory *)self->_accessory name];
  if ([v8 isEqualToString:v10])
  {
  }
  else
  {
    uint64_t v11 = [(EAAccessory *)*p_accessory bonjourName];
    int v12 = [v8 isEqualToString:v11];

    if (!v12) {
      goto LABEL_95;
    }
  }
  v96 = [(PSGAccessoryDetailsController *)self specifierForID:@"CONNECT_BUTTON"];
  v13 = [(PSGAccessoryDetailsController *)self specifierForID:@"MANUFACTURER"];
  v14 = [(PSGAccessoryDetailsController *)self specifierForID:@"MODELNUMBER"];
  v15 = [(PSGAccessoryDetailsController *)self specifierForID:@"SERIALNUMBER"];
  v16 = [(PSGAccessoryDetailsController *)self specifierForID:@"FIRMWAREREVISION"];
  v99 = [(PSGAccessoryDetailsController *)self specifierForID:@"HARDWAREREVISION"];
  v98 = [(PSGAccessoryDetailsController *)self specifierForID:@"FIND_APP_FOR_ACCESSORY"];
  [(PSGAccessoryDetailsController *)self beginUpdates];
  v17 = [v100 name];
  v97 = v16;
  if ([v17 isEqualToString:*MEMORY[0x263F04E80]])
  {
    int v18 = [v5 isConnected];

    if (v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v13) {
        [v19 addObject:v13];
      }
      if (v14) {
        [v19 addObject:v14];
      }
      if (v15) {
        [v19 addObject:v15];
      }
      if (v16) {
        [v19 addObject:v16];
      }
      if (v99) {
        objc_msgSend(v19, "addObject:");
      }
      if (v98) {
        objc_msgSend(v19, "addObject:");
      }
      v90 = v20;
      v92 = v15;
      v94 = v14;
      if ([v19 count]) {
        [(PSGAccessoryDetailsController *)self removeContiguousSpecifiers:v19 animated:1];
      }
      v21 = [v5 manufacturer];
      uint64_t v22 = [v21 length];

      v23 = (void *)MEMORY[0x263F60050];
      id v88 = v19;
      if (v22)
      {
        v24 = (void *)MEMORY[0x263F5FC40];
        v25 = PSG_BundleForGeneralSettingsUIFramework();
        [v25 localizedStringForKey:@"MANUFACTURER" value:&stru_26F0FADC0 table:0];
        v27 = uint64_t v26 = v13;
        v28 = [v24 preferenceSpecifierNamed:v27 target:self set:0 get:sel_manufacturer detail:0 cell:4 edit:0];

        [v28 setIdentifier:@"MANUFACTURER"];
        [v28 setProperty:MEMORY[0x263EFFA88] forKey:*v23];
        [v90 addObject:v28];
        v13 = v28;
      }
      v29 = v23;
      v30 = [v5 modelNumber];
      uint64_t v31 = [v30 length];

      v89 = v13;
      if (v31)
      {
        uint64_t v32 = (void *)MEMORY[0x263F5FC40];
        v33 = PSG_BundleForGeneralSettingsUIFramework();
        v34 = [v33 localizedStringForKey:@"MODELNUMBER" value:&stru_26F0FADC0 table:0];
        v35 = [v32 preferenceSpecifierNamed:v34 target:self set:0 get:sel_modelNumber detail:0 cell:4 edit:0];

        [v35 setIdentifier:@"MODELNUMBER"];
        [v35 setProperty:MEMORY[0x263EFFA88] forKey:*v23];
        v36 = v90;
        [v90 addObject:v35];
        v94 = v35;
      }
      else
      {
        v36 = v90;
      }
      v41 = [v5 serialNumber];
      uint64_t v42 = [v41 length];

      if (v42)
      {
        id v43 = (void *)MEMORY[0x263F5FC40];
        long long v44 = PSG_BundleForGeneralSettingsUIFramework();
        long long v45 = [v44 localizedStringForKey:@"SERIALNUMBER" value:&stru_26F0FADC0 table:0];
        long long v46 = [v43 preferenceSpecifierNamed:v45 target:self set:0 get:sel_serialNumber detail:0 cell:4 edit:0];

        [v46 setIdentifier:@"SERIALNUMBER"];
        [v46 setProperty:MEMORY[0x263EFFA88] forKey:*v29];
        [v36 addObject:v46];
        v92 = v46;
      }
      long long v47 = [v5 firmwareRevision];
      uint64_t v48 = [v47 length];

      if (v48)
      {
        uint64_t v49 = (void *)MEMORY[0x263F5FC40];
        v50 = PSG_BundleForGeneralSettingsUIFramework();
        v51 = [v50 localizedStringForKey:@"FIRMWAREREVISION" value:&stru_26F0FADC0 table:0];
        v52 = [v49 preferenceSpecifierNamed:v51 target:self set:0 get:sel_firmwareRevision detail:0 cell:4 edit:0];

        [v52 setIdentifier:@"FIRMWAREREVISION"];
        uint64_t v53 = v36;
        v54 = v29;
        [v52 setProperty:MEMORY[0x263EFFA88] forKey:*v29];
        [v53 addObject:v52];
        id v55 = v52;
      }
      else
      {
        v54 = v29;
        id v55 = v16;
      }
      id v56 = [v5 hardwareRevision];
      uint64_t v57 = [v56 length];

      v97 = v55;
      if (v57)
      {
        v58 = (void *)MEMORY[0x263F5FC40];
        v59 = PSG_BundleForGeneralSettingsUIFramework();
        v60 = [v59 localizedStringForKey:@"HARDWAREREVISION" value:&stru_26F0FADC0 table:0];
        v61 = [v58 preferenceSpecifierNamed:v60 target:self set:0 get:sel_hardwareRevision detail:0 cell:4 edit:0];

        [v61 setIdentifier:@"HARDWAREREVISION"];
        [v61 setProperty:MEMORY[0x263EFFA88] forKey:*v54];
        v62 = v90;
        [v90 addObject:v61];
        v99 = v61;
        v37 = v88;
      }
      else
      {
        v37 = v88;
        v62 = v90;
      }
      if ([v5 supportsPublicIap])
      {
        v63 = (void *)MEMORY[0x263F5FC40];
        v64 = PSG_BundleForGeneralSettingsUIFramework();
        v65 = [v64 localizedStringForKey:@"FIND_APP_FOR_ACCESSORY" value:&stru_26F0FADC0 table:0];
        v66 = [v63 preferenceSpecifierNamed:v65 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v66 setButtonAction:sel_findAppForAccessory];
        [v66 setIdentifier:@"FIND_APP_FOR_ACCESSORY"];
        [v62 addObject:v66];
        v98 = v66;
      }
      v13 = v89;
      v15 = v92;
      v14 = v94;
      if ([v62 count]) {
        [(PSGAccessoryDetailsController *)self addSpecifiersFromArray:v62 animated:1];
      }

      goto LABEL_63;
    }
  }
  else
  {
  }
  v37 = [v100 name];
  if (![v37 isEqualToString:*MEMORY[0x263F04E88]])
  {
LABEL_63:

    goto LABEL_64;
  }
  char v38 = [v5 isConnected];

  if ((v38 & 1) == 0)
  {
    id v39 = [v5 bonjourName];

    if (v39)
    {
      id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
      v37 = v40;
      if (v13) {
        [v40 addObject:v13];
      }
      if (v14) {
        [v37 addObject:v14];
      }
      if (v15) {
        [v37 addObject:v15];
      }
      if (v16) {
        [v37 addObject:v16];
      }
      if (v99) {
        [v37 addObject:v99];
      }
      if (v98) {
        objc_msgSend(v37, "addObject:");
      }
      if ([v37 count]) {
        [(PSGAccessoryDetailsController *)self removeContiguousSpecifiers:v37 animated:1];
      }
      goto LABEL_63;
    }
    int v67 = 1;
    if (self->_finishedAppearing) {
      goto LABEL_65;
    }
    self->_shouldEscape = 1;
  }
LABEL_64:
  int v67 = 0;
LABEL_65:
  uint64_t v68 = [v5 bonjourName];
  if (!v68 || (v69 = (void *)v68, int v70 = [v5 isAvailableOverBonjour], v69, !v70))
  {
    v73 = [v5 bonjourName];

    if (!v73) {
      goto LABEL_78;
    }
    if (self->_finishedAppearing)
    {
      [(PSGAccessoryDetailsController *)self endUpdates];
      goto LABEL_92;
    }
    self->_shouldEscape = 1;
LABEL_81:
    [(PSGAccessoryDetailsController *)self endUpdates];
    if (v67) {
      goto LABEL_92;
    }
    goto LABEL_94;
  }
  v71 = [v100 name];
  if ([v71 isEqualToString:*MEMORY[0x263F04EB0]])
  {
    int v72 = [v5 hasIPConnection];

    if (v72)
    {
      v93 = v15;
      v95 = v14;
      if (v96)
      {
        uint64_t v91 = [(PSGAccessoryDetailsController *)self indexOfSpecifier:v96];
        [(PSGAccessoryDetailsController *)self removeSpecifier:v96 animated:1];
      }
      else
      {
        uint64_t v91 = 1;
      }
      v76 = (void *)MEMORY[0x263F5FC40];
      v77 = PSG_BundleForGeneralSettingsUIFramework();
      v78 = [v77 localizedStringForKey:@"DISCONNECT" value:&stru_26F0FADC0 table:0];
      v79 = [v76 preferenceSpecifierNamed:v78 target:self set:0 get:0 detail:0 cell:13 edit:0];

      v80 = sel_disconnect;
      goto LABEL_91;
    }
  }
  else
  {
  }
  v74 = [v100 name];
  if (![v74 isEqualToString:*MEMORY[0x263F04EB8]])
  {

    goto LABEL_81;
  }
  char v75 = [v5 hasIPConnection];

  if (v75)
  {
LABEL_78:
    [(PSGAccessoryDetailsController *)self endUpdates];
    if (v67) {
      goto LABEL_92;
    }
    goto LABEL_94;
  }
  v93 = v15;
  v95 = v14;
  if (v96)
  {
    uint64_t v91 = [(PSGAccessoryDetailsController *)self indexOfSpecifier:v96];
    [(PSGAccessoryDetailsController *)self removeSpecifier:v96 animated:1];
  }
  else
  {
    uint64_t v91 = 1;
  }
  v81 = (void *)MEMORY[0x263F5FC40];
  v82 = PSG_BundleForGeneralSettingsUIFramework();
  v83 = [v82 localizedStringForKey:@"CONNECT" value:&stru_26F0FADC0 table:0];
  v79 = [v81 preferenceSpecifierNamed:v83 target:self set:0 get:0 detail:0 cell:13 edit:0];

  v80 = sel_connect;
LABEL_91:
  [v79 setButtonAction:v80];
  [v79 setIdentifier:@"CONNECT_BUTTON"];
  [(PSGAccessoryDetailsController *)self insertSpecifier:v79 atIndex:v91 animated:1];
  [(PSGAccessoryDetailsController *)self endUpdates];
  v96 = v79;
  v15 = v93;
  v14 = v95;
  if (v67)
  {
LABEL_92:
    v84 = [(PSGAccessoryDetailsController *)self navigationController];
    v85 = [v84 topViewController];

    if (v85 == self)
    {
      v86 = [(PSGAccessoryDetailsController *)self navigationController];
      id v87 = (id)[v86 popViewControllerAnimated:1];
    }
  }
LABEL_94:
  objc_storeStrong((id *)p_accessory, v5);

LABEL_95:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PSGAccessoryDetailsController;
  id v6 = a4;
  uint64_t v7 = [(PSGAccessoryDetailsController *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[PSGAccessoryDetailsController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  uint64_t v9 = [(PSGAccessoryDetailsController *)self specifierAtIndex:v8];
  int v10 = [v9 identifier];
  LODWORD(v6) = [v10 isEqualToString:@"SERIALNUMBER"];

  if (v6)
  {
    uint64_t v11 = [v7 detailTextLabel];
    [v11 setAdjustsFontSizeToFitWidth:1];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end