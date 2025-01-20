@interface KeychainSyncPhoneSettingsFragment
- (KeychainSyncCountryInfo)countryInfo;
- (KeychainSyncPhoneSettingsFragment)initWithListController:(id)a3;
- (KeychainSyncPhoneSettingsFragmentDelegate)delegate;
- (NSArray)specifiers;
- (NSString)phoneNumber;
- (NSString)title;
- (PSEditableTableCell)phoneNumberCell;
- (id)dialingCountryInfoForSpecifier:(id)a3;
- (id)phoneNumberForSpecifier:(id)a3;
- (id)unformattedPhoneNumber;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)resignFirstResponder;
- (void)setCountryInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialingCountryInfo:(id)a3 forSpecifier:(id)a4;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumber:(id)a3 forSpecifier:(id)a4;
- (void)setTitle:(id)a3;
- (void)textFieldChanged:(id)a3;
@end

@implementation KeychainSyncPhoneSettingsFragment

- (KeychainSyncPhoneSettingsFragment)initWithListController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncPhoneSettingsFragment;
  v5 = [(KeychainSyncPhoneSettingsFragment *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_textFieldChanged_ name:*MEMORY[0x1E4F43E28] object:0];

    objc_storeWeak((id *)&v5->_listController, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)KeychainSyncPhoneSettingsFragment;
  [(KeychainSyncPhoneSettingsFragment *)&v4 dealloc];
}

- (NSArray)specifiers
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  specifiers = self->_specifiers;
  if (specifiers) {
    goto LABEL_43;
  }
  v70 = self;
  v64 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v76 = 0;
  v63 = PSSecureBackupAccountInfo(&v76, 0);
  id v4 = v76;
  v61 = v4;
  if (!v4)
  {
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    v5 = (void *)getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr;
    uint64_t v85 = getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr;
    if (!getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr)
    {
      uint64_t v77 = MEMORY[0x1E4F143A8];
      uint64_t v78 = 3221225472;
      v79 = __getkSecureBackupSMSTargetInfoKeySymbolLoc_block_invoke;
      v80 = &unk_1E5C5D4D8;
      v81 = &v82;
      v6 = (void *)CloudServicesLibrary();
      v7 = dlsym(v6, "kSecureBackupSMSTargetInfoKey");
      *(void *)(v81[1] + 24) = v7;
      getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v5 = (void *)v83[3];
    }
    _Block_object_dispose(&v82, 8);
    if (v5)
    {
      objc_super v8 = [v63 objectForKey:*v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v82 = 0;
        v83 = &v82;
        uint64_t v84 = 0x2020000000;
        v9 = (id *)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr;
        uint64_t v85 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr;
        if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr)
        {
          uint64_t v77 = MEMORY[0x1E4F143A8];
          uint64_t v78 = 3221225472;
          v79 = __getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke;
          v80 = &unk_1E5C5D4D8;
          v81 = &v82;
          v10 = (void *)CloudServicesLibrary();
          v11 = dlsym(v10, "kSecureBackupSMSTargetPhoneNumberKey");
          *(void *)(v81[1] + 24) = v11;
          getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
          v9 = (id *)v83[3];
        }
        _Block_object_dispose(&v82, 8);
        if (!v9) {
          goto LABEL_47;
        }
        id v12 = *v9;
        uint64_t v13 = [v8 objectForKey:v12];
        phoneNumber = v70->_phoneNumber;
        v70->_phoneNumber = (NSString *)v13;

        uint64_t v82 = 0;
        v83 = &v82;
        uint64_t v84 = 0x2020000000;
        v15 = (void *)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr;
        uint64_t v85 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr;
        if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr)
        {
          uint64_t v77 = MEMORY[0x1E4F143A8];
          uint64_t v78 = 3221225472;
          v79 = __getkSecureBackupCountryDialCodeKeySymbolLoc_block_invoke;
          v80 = &unk_1E5C5D4D8;
          v81 = &v82;
          v16 = (void *)CloudServicesLibrary();
          v17 = dlsym(v16, "kSecureBackupCountryDialCodeKey");
          *(void *)(v81[1] + 24) = v17;
          getkSecureBackupCountryDialCodeKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
          v15 = (void *)v83[3];
        }
        _Block_object_dispose(&v82, 8);
        if (!v15) {
          goto LABEL_47;
        }
        v62 = [v8 objectForKey:*v15];
        v18 = getkSecureBackupCountryCodeKey();
        id v68 = [v8 objectForKey:v18];

        if (v68)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v62 = 0;
      }
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x2020000000;
      v19 = (void *)getkSecureBackupMetadataKeySymbolLoc_ptr;
      uint64_t v85 = getkSecureBackupMetadataKeySymbolLoc_ptr;
      if (!getkSecureBackupMetadataKeySymbolLoc_ptr)
      {
        uint64_t v77 = MEMORY[0x1E4F143A8];
        uint64_t v78 = 3221225472;
        v79 = __getkSecureBackupMetadataKeySymbolLoc_block_invoke;
        v80 = &unk_1E5C5D4D8;
        v81 = &v82;
        v20 = (void *)CloudServicesLibrary();
        v21 = dlsym(v20, "kSecureBackupMetadataKey");
        *(void *)(v81[1] + 24) = v21;
        getkSecureBackupMetadataKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
        v19 = (void *)v83[3];
      }
      _Block_object_dispose(&v82, 8);
      if (v19)
      {
        v22 = [v63 objectForKey:*v19];
        v23 = getkSecureBackupCountryCodeKey();
        id v68 = [v22 objectForKey:v23];

        goto LABEL_21;
      }
    }
LABEL_47:
    -[PSContactsAuthorizationLevelController dealloc]();
    __break(1u);
  }
  NSLog(&cfstr_Getaccountinfo.isa, v4);
  v62 = 0;
  id v68 = 0;
LABEL_22:
  v24 = (void *)MEMORY[0x1E4F1CA20];
  v25 = [v64 localeIdentifier];
  v26 = [v24 componentsFromLocaleIdentifier:v25];
  v65 = [v26 objectForKey:*MEMORY[0x1E4F1C400]];

  v27 = v68;
  if (!v68) {
    v27 = v65;
  }
  id v66 = v27;
  if ([(NSString *)v70->_phoneNumber length])
  {
    uint64_t v28 = PSPNCreateFormattedStringWithCountry((uint64_t)v70->_phoneNumber, [v66 lowercaseString]);
    v29 = v70->_phoneNumber;
    v70->_phoneNumber = (NSString *)v28;
  }
  else
  {
    id v30 = v65;
    v29 = (NSString *)v68;
    id v68 = v30;
  }

  v69 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (PSIsRunningInAssistant()
    && ([MEMORY[0x1E4F42948] currentDevice],
        v31 = objc_claimAutoreleasedReturnValue(),
        BOOL v32 = [v31 userInterfaceIdiom] == 0,
        v31,
        v32))
  {
    v67 = +[PSSpecifier emptyGroupSpecifier];
    [(NSArray *)v69 addObject:v67];
  }
  else
  {
    v33 = [(KeychainSyncPhoneSettingsFragment *)v70 title];
    v67 = +[PSSpecifier groupSpecifierWithName:v33];

    v34 = PS_LocalizedStringForKeychainSync(@"PHONE_NUMBER_DESCRIPTION");
    [v67 setProperty:v34 forKey:@"footerText"];

    [(NSArray *)v69 addObject:v67];
  }
  countryInfo = v70->_countryInfo;
  v70->_countryInfo = 0;

  v36 = PS_LocalizedStringForKeychainSync(@"COUNTRY");
  uint64_t v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:v70 set:sel_setDialingCountryInfo_forSpecifier_ get:sel_dialingCountryInfoForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
  countrySpecifier = v70->_countrySpecifier;
  v70->_countrySpecifier = (PSSpecifier *)v37;

  -[PSSpecifier setProperty:forKey:](v70->_countrySpecifier, "setProperty:forKey:", objc_opt_class());
  if (!v70->_countryInfo)
  {
    uint64_t v39 = +[KeychainSyncCountryInfo countryInfoForCountryCode:v68 dialingPrefix:v62];
    v40 = v70->_countryInfo;
    v70->_countryInfo = (KeychainSyncCountryInfo *)v39;
  }
  v41 = +[KeychainSyncCountryInfo allCountries];
  v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v41, "count"));
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v41;
  uint64_t v43 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v73 != v44) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v47 = [v46 localizedCountryName];
        v48 = v47;
        if (v47)
        {
          id v49 = v47;
        }
        else
        {
          id v49 = [v46 countryName];
        }
        v50 = v49;

        v51 = NSString;
        v52 = [v46 dialingPrefix];
        v53 = [v51 stringWithFormat:@"\u202A+%@\u202C (%@)", v52, v50];

        [v42 addObject:v53];
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    }
    while (v43);
  }

  [(PSSpecifier *)v70->_countrySpecifier setValues:obj titles:v42];
  [(NSArray *)v69 addObject:v70->_countrySpecifier];
  v54 = objc_alloc_init(PSPhoneNumberSpecifier);
  p_phoneNumberSpecifier = &v70->_phoneNumberSpecifier;
  phoneNumberSpecifier = v70->_phoneNumberSpecifier;
  v70->_phoneNumberSpecifier = v54;

  v57 = v70->_phoneNumberSpecifier;
  v58 = PS_LocalizedStringForKeychainSync(@"NUMBER");
  [(PSSpecifier *)v57 setName:v58];

  objc_storeWeak(&v70->_phoneNumberSpecifier->super.super.target, v70);
  (*p_phoneNumberSpecifier)->super.super.setter = sel_setPhoneNumber_forSpecifier_;
  (*p_phoneNumberSpecifier)->super.super.getter = sel_phoneNumberForSpecifier_;
  (*p_phoneNumberSpecifier)->super.super.detailControllerClass = 0;
  (*p_phoneNumberSpecifier)->super.super.cellType = 8;
  (*p_phoneNumberSpecifier)->super.super.editPaneClass = 0;
  [(PSPhoneNumberSpecifier *)v70->_phoneNumberSpecifier setCountryCode:v66];
  [(PSSpecifier *)v70->_phoneNumberSpecifier setKeyboardType:5 autoCaps:0 autoCorrection:1];
  [(PSPhoneNumberSpecifier *)v70->_phoneNumberSpecifier setProperty:objc_opt_class() forKey:@"cellClass"];
  [(NSArray *)v69 addObject:v70->_phoneNumberSpecifier];
  v59 = v70->_specifiers;
  v70->_specifiers = v69;

  specifiers = v70->_specifiers;
LABEL_43:
  return specifiers;
}

- (void)reloadSpecifiers
{
  self->_specifiers = 0;
  MEMORY[0x1F41817F8]();
}

- (void)resignFirstResponder
{
  id v2 = [(KeychainSyncPhoneSettingsFragment *)self phoneNumberCell];
  [v2 resignFirstResponder];
}

- (void)setDialingCountryInfo:(id)a3 forSpecifier:(id)a4
{
  v6 = (KeychainSyncCountryInfo *)a3;
  p_countryInfo = &self->_countryInfo;
  if (self->_countryInfo != v6)
  {
    v19 = v6;
    objc_storeStrong((id *)p_countryInfo, a3);
    phoneNumberSpecifier = self->_phoneNumberSpecifier;
    v9 = [(KeychainSyncCountryInfo *)self->_countryInfo countryCode];
    [(PSPhoneNumberSpecifier *)phoneNumberSpecifier setCountryCode:v9];

    countryInfo = self->_countryInfo;
    v11 = self->_phoneNumber;
    id v12 = [(KeychainSyncCountryInfo *)countryInfo countryCode];
    uint64_t v13 = (NSString *)PSPNCreateFormattedStringWithCountry((uint64_t)v11, [v12 lowercaseString]);
    phoneNumber = self->_phoneNumber;
    self->_phoneNumber = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [WeakRetained reloadSpecifier:self->_phoneNumberSpecifier];

    v16 = [(KeychainSyncPhoneSettingsFragment *)self delegate];
    v17 = [(KeychainSyncPhoneSettingsFragment *)self unformattedPhoneNumber];
    v18 = [(KeychainSyncPhoneSettingsFragment *)self countryInfo];
    [v16 phoneSettingsFragment:self didChangePhoneNumber:v17 countryInfo:v18];

    v6 = v19;
  }
  MEMORY[0x1F41817F8](p_countryInfo, v6);
}

- (id)dialingCountryInfoForSpecifier:(id)a3
{
  return self->_countryInfo;
}

- (void)setPhoneNumber:(id)a3 forSpecifier:(id)a4
{
  if (self->_phoneNumber != a3)
  {
    -[KeychainSyncPhoneSettingsFragment setPhoneNumber:](self, "setPhoneNumber:");
    id v7 = [(KeychainSyncPhoneSettingsFragment *)self delegate];
    v5 = [(KeychainSyncPhoneSettingsFragment *)self unformattedPhoneNumber];
    v6 = [(KeychainSyncPhoneSettingsFragment *)self countryInfo];
    [v7 phoneSettingsFragment:self didChangePhoneNumber:v5 countryInfo:v6];
  }
}

- (id)phoneNumberForSpecifier:(id)a3
{
  return self->_phoneNumber;
}

- (id)unformattedPhoneNumber
{
  id v2 = [(KeychainSyncPhoneSettingsFragment *)self phoneNumber];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (uint64_t (*)(void *))get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr;
  v11 = get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr;
  if (!get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr)
  {
    id v4 = (void *)PhoneNumbersLibrary();
    v9[3] = (uint64_t)dlsym(v4, "_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable");
    get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    v3 = (uint64_t (*)(void *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    id v7 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = (void *)v3(v2);

  return v5;
}

- (PSEditableTableCell)phoneNumberCell
{
  return (PSEditableTableCell *)[(PSSpecifier *)self->_phoneNumberSpecifier propertyForKey:@"cellObject"];
}

- (void)textFieldChanged:(id)a3
{
  phoneNumberSpecifier = self->_phoneNumberSpecifier;
  id v5 = a3;
  v6 = [(PSSpecifier *)phoneNumberSpecifier propertyForKey:@"cellObject"];
  id v9 = [v6 editableTextField];

  id v7 = [v5 object];

  if (v7 == v9)
  {
    uint64_t v8 = [v9 text];
    [(KeychainSyncPhoneSettingsFragment *)self setPhoneNumber:v8 forSpecifier:self->_phoneNumberSpecifier];
  }
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (KeychainSyncCountryInfo)countryInfo
{
  return self->_countryInfo;
}

- (void)setCountryInfo:(id)a3
{
}

- (KeychainSyncPhoneSettingsFragmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (KeychainSyncPhoneSettingsFragmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_countryInfo, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_countrySpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberSpecifier, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end