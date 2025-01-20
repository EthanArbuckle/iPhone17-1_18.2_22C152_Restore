@interface ICSOtherSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICSOtherSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_specifierForLookMeUpByEmail;
- (id)_specifiersForServerProvidedFooter;
- (id)account;
- (void)_footerButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSOtherSpecifierProvider

- (ICSOtherSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSOtherSpecifierProvider;
  v6 = [(ICSOtherSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (([MEMORY[0x263F25820] isMultiUserMode] & 1) == 0)
    {
      v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADVANCED_GROUP"];
      v7 = [(ICSOtherSpecifierProvider *)self _specifierForLookMeUpByEmail];
      if (v7)
      {
        [v5 addObject:v6];
        [v5 addObject:v7];
      }
      v8 = [(ICSOtherSpecifierProvider *)self _specifiersForServerProvidedFooter];
      [v5 addObjectsFromArray:v8];
    }
    objc_super v9 = (NSArray *)[v5 copy];
    v10 = self->_specifiers;
    self->_specifiers = v9;

    v3 = self->_specifiers;
  }

  return v3;
}

- (id)_specifierForLookMeUpByEmail
{
  v3 = [(ICSOtherSpecifierProvider *)self account];
  int v4 = [v3 isProvisionedForDataclass:*MEMORY[0x263EFAC38]];

  if (v4)
  {
    id v5 = (id)objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"CloudKitSettings.bundle", @"System/Library/PreferenceBundles/AccountSettings");
    Class v6 = NSClassFromString(&cfstr_Cksettingscont.isa);
    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v9 = [v8 localizedStringForKey:@"CLOUD_DRIVE_PRIVACY_INFO" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:v6 cell:2 edit:0];

    [v10 setIdentifier:@"CLOUD_DRIVE_PRIVACY_INFO"];
    v11 = [(ICSOtherSpecifierProvider *)self account];
    v12 = objc_msgSend(v11, "aa_cloudKitAccount");

    if (v12)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v16 = objc_loadWeakRetained((id *)p_delegate);
        v17 = [v16 specifier];
        v18 = [v17 userInfo];
        v19 = (void *)[v18 mutableCopy];

        [v19 setObject:v12 forKeyedSubscript:*MEMORY[0x263F23118]];
        v20 = (void *)[v19 copy];
        [v10 setUserInfo:v20];
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_specifiersForServerProvidedFooter
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v4 = [(ICSOtherSpecifierProvider *)self account];
  id v5 = objc_msgSend(v4, "aa_accountFooterText");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v8 = [(ICSOtherSpecifierProvider *)self account];
    objc_super v9 = objc_msgSend(v8, "aa_accountFooterText");
    [v7 setProperty:v9 forKey:*MEMORY[0x263F600F8]];

    [v7 setProperty:&unk_270E05BD0 forKey:*MEMORY[0x263F600B8]];
    [v3 addObject:v7];
  }
  v10 = [(ICSOtherSpecifierProvider *)self account];
  v11 = objc_msgSend(v10, "aa_accountFooterButton");

  if (v11)
  {
    v12 = [(ICSOtherSpecifierProvider *)self account];
    v13 = objc_msgSend(v12, "aa_accountFooterButton");
    v14 = [v13 objectForKey:@"title"];

    v15 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v3 addObject:v15];

    id v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];
    *(void *)&v16[*MEMORY[0x263F5FDF8]] = sel__footerButtonTapped_;
    [v3 addObject:v16];
  }

  return v3;
}

- (void)_footerButtonTapped:(id)a3
{
  id v3 = [(ICSOtherSpecifierProvider *)self account];
  int v4 = objc_msgSend(v3, "aa_accountFooterButton");
  id v6 = [v4 objectForKey:@"url"];

  id v5 = [NSURL URLWithString:v6];
  [(id)*MEMORY[0x263F83300] openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end