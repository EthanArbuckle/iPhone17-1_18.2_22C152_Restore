@interface PKContactFormatValidator
- (BOOL)_isFieldEntry:(id)a3 validForContactFieldConfiguration:(id)a4;
- (BOOL)_isFieldEntry:(id)a3 validForPickerContactFieldConfiguration:(id)a4;
- (BOOL)_isFieldEntry:(id)a3 validForTextContactFieldConfiguration:(id)a4;
- (BOOL)emailAddressIsValid:(id)a3;
- (BOOL)hasFormatValidationConfigurationForCountryCode:(id)a3;
- (BOOL)isFamilyName:(id)a3 validFormatForCountryCode:(id)a4;
- (BOOL)isGivenName:(id)a3 validFormatForCountryCode:(id)a4;
- (BOOL)isPhoneticFamilyName:(id)a3 validFormatForCountryCode:(id)a4;
- (BOOL)isPhoneticGivenName:(id)a3 validFormatForCountryCode:(id)a4;
- (BOOL)isPostalAddressFieldEntry:(id)a3 validForPostalFieldKey:(id)a4 forCountryCode:(id)a5;
- (BOOL)phoneNumberIsValid:(id)a3 forCountryCode:(id)a4;
- (PKContactFormatValidator)initWithConfiguration:(id)a3;
- (id)_formattedFieldEntry:(id)a3 forFieldConfiguration:(id)a4;
- (id)contactFieldConfigurationForFamilyNameForCountryCode:(id)a3;
- (id)contactFieldConfigurationForGivenNameForCountryCode:(id)a3;
- (id)contactFieldConfigurationForPhoneticFamilyNameForCountryCode:(id)a3;
- (id)contactFieldConfigurationForPhoneticGivenNameForCountryCode:(id)a3;
- (id)contactFieldConfigurationForPostalField:(id)a3 forCountryCode:(id)a4;
- (id)formatPostalAddress:(id)a3;
- (unint64_t)checkNameFormat:(id)a3 forCountryCode:(id)a4;
- (unint64_t)checkPostalAddressFormat:(id)a3;
@end

@implementation PKContactFormatValidator

- (PKContactFormatValidator)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKContactFormatValidator;
    v6 = [(PKContactFormatValidator *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_configuration, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasFormatValidationConfigurationForCountryCode:(id)a3
{
  v3 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)checkNameFormat:(id)a3 forCountryCode:(id)a4
{
  id v6 = a3;
  v7 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a4];
  v8 = [v7 nameComponentFormatConfiguration];
  if (v8)
  {
    v9 = [v6 phoneticRepresentation];
    objc_super v10 = [v6 givenName];
    v11 = [v8 givenNameFieldConfiguration];
    BOOL v12 = [(PKContactFormatValidator *)self _isFieldEntry:v10 validForContactFieldConfiguration:v11];

    uint64_t v13 = !v12;
    v14 = [v6 familyName];
    v15 = [v8 familyNameFieldConfiguration];
    BOOL v16 = [(PKContactFormatValidator *)self _isFieldEntry:v14 validForContactFieldConfiguration:v15];

    if (!v16) {
      v13 |= 2uLL;
    }
    v17 = [v9 givenName];
    v18 = [v8 phoneticGivenNameFieldConfiguration];
    BOOL v19 = [(PKContactFormatValidator *)self _isFieldEntry:v17 validForContactFieldConfiguration:v18];

    if (v19) {
      uint64_t v20 = v13;
    }
    else {
      uint64_t v20 = v13 | 4;
    }
    v21 = [v9 familyName];
    v22 = [v8 phoneticFamilyNameFieldConfiguration];
    BOOL v23 = [(PKContactFormatValidator *)self _isFieldEntry:v21 validForContactFieldConfiguration:v22];

    if (v23) {
      unint64_t v24 = v20;
    }
    else {
      unint64_t v24 = v20 | 8;
    }
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

- (BOOL)isGivenName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6 = a3;
  v7 = [(PKContactFormatValidator *)self contactFieldConfigurationForGivenNameForCountryCode:a4];
  LOBYTE(self) = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForContactFieldConfiguration:v7];

  return (char)self;
}

- (BOOL)isFamilyName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6 = a3;
  v7 = [(PKContactFormatValidator *)self contactFieldConfigurationForFamilyNameForCountryCode:a4];
  LOBYTE(self) = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForContactFieldConfiguration:v7];

  return (char)self;
}

- (BOOL)isPhoneticGivenName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6 = a3;
  v7 = [(PKContactFormatValidator *)self contactFieldConfigurationForPhoneticGivenNameForCountryCode:a4];
  LOBYTE(self) = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForContactFieldConfiguration:v7];

  return (char)self;
}

- (BOOL)isPhoneticFamilyName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6 = a3;
  v7 = [(PKContactFormatValidator *)self contactFieldConfigurationForPhoneticFamilyNameForCountryCode:a4];
  LOBYTE(self) = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForContactFieldConfiguration:v7];

  return (char)self;
}

- (unint64_t)checkPostalAddressFormat:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ISOCountryCode];
  if ([v5 length])
  {
    id v6 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:v5];
    v7 = [v6 addressFormatConfiguration];
    if (v7)
    {
      v8 = [v4 street];
      v9 = [v7 streetFieldConfiguration];
      BOOL v10 = [(PKContactFormatValidator *)self _isFieldEntry:v8 validForContactFieldConfiguration:v9];

      uint64_t v11 = !v10;
      BOOL v12 = [v4 subLocality];
      uint64_t v13 = [v7 subLocalityFieldConfiguration];
      BOOL v14 = [(PKContactFormatValidator *)self _isFieldEntry:v12 validForContactFieldConfiguration:v13];

      if (!v14) {
        v11 |= 2uLL;
      }
      v15 = [v4 city];
      BOOL v16 = [v7 cityFieldConfiguration];
      BOOL v17 = [(PKContactFormatValidator *)self _isFieldEntry:v15 validForContactFieldConfiguration:v16];

      if (!v17) {
        v11 |= 4uLL;
      }
      v18 = [v4 subAdministrativeArea];
      BOOL v19 = [v7 subAdministrativeAreaFieldConfiguration];
      BOOL v20 = [(PKContactFormatValidator *)self _isFieldEntry:v18 validForContactFieldConfiguration:v19];

      if (!v20) {
        v11 |= 8uLL;
      }
      v21 = [v4 state];
      v22 = [v7 stateFieldConfiguration];
      BOOL v23 = [(PKContactFormatValidator *)self _isFieldEntry:v21 validForContactFieldConfiguration:v22];

      if (v23) {
        uint64_t v24 = v11;
      }
      else {
        uint64_t v24 = v11 | 0x10;
      }
      v25 = [v4 postalCode];
      v26 = [v7 postalCodeFieldConfiguration];
      BOOL v27 = [(PKContactFormatValidator *)self _isFieldEntry:v25 validForContactFieldConfiguration:v26];

      if (v27) {
        unint64_t v28 = v24;
      }
      else {
        unint64_t v28 = v24 | 0x20;
      }
    }
    else
    {
      unint64_t v28 = 0;
    }
  }
  else
  {
    unint64_t v28 = 64;
  }

  return v28;
}

- (BOOL)isPostalAddressFieldEntry:(id)a3 validForPostalFieldKey:(id)a4 forCountryCode:(id)a5
{
  if (!a3 || !a4 || !a5) {
    return 0;
  }
  id v8 = a3;
  v9 = [(PKContactFormatValidator *)self contactFieldConfigurationForPostalField:a4 forCountryCode:a5];
  LOBYTE(self) = [(PKContactFormatValidator *)self _isFieldEntry:v8 validForContactFieldConfiguration:v9];

  return (char)self;
}

- (id)formatPostalAddress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  configuration = self->_configuration;
  v7 = [v4 ISOCountryCode];
  id v8 = [(PKContactFormatConfiguration *)configuration contactFieldConfigurationForCountryCode:v7];

  v9 = [v8 addressFormatConfiguration];
  BOOL v10 = v4;
  if (v9)
  {
    uint64_t v11 = [v4 city];
    BOOL v12 = [v9 cityFieldConfiguration];
    uint64_t v13 = [(PKContactFormatValidator *)self _formattedFieldEntry:v11 forFieldConfiguration:v12];

    if (v13) {
      [v5 setCity:v13];
    }
    BOOL v14 = [v4 state];
    v15 = [v9 stateFieldConfiguration];
    BOOL v16 = [(PKContactFormatValidator *)self _formattedFieldEntry:v14 forFieldConfiguration:v15];

    if (v16)
    {
      [v5 setState:v16];
      BOOL v24 = 1;
    }
    else
    {
      BOOL v24 = v13 != 0;
    }
    BOOL v17 = [v4 subAdministrativeArea];
    v18 = [v9 subAdministrativeAreaFieldConfiguration];
    BOOL v19 = [(PKContactFormatValidator *)self _formattedFieldEntry:v17 forFieldConfiguration:v18];

    if (v19)
    {
      [v5 setSubAdministrativeArea:v19];
      BOOL v24 = 1;
    }
    BOOL v20 = [v4 postalCode];
    v21 = [v9 postalCodeFieldConfiguration];
    v22 = [(PKContactFormatValidator *)self _formattedFieldEntry:v20 forFieldConfiguration:v21];

    if (v22)
    {
      [v5 setPostalCode:v22];
    }
    else
    {

      BOOL v10 = v4;
      if (!v24) {
        goto LABEL_13;
      }
    }
    BOOL v10 = (void *)[v5 copy];
  }
LABEL_13:

  return v10;
}

- (BOOL)phoneNumberIsValid:(id)a3 forCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKContactFormatConfiguration *)self->_configuration checkFormatOfPhoneNumber])
  {
    id v8 = [v6 stringValue];
    if ((unint64_t)[v8 length] > 0x22)
    {
      char valid = 0;
    }
    else
    {
      v9 = (const void *)PNCopyBestGuessCountryCodeForNumber();
      if (v9 || (v9 = v7) != 0)
      {
        char valid = PNIsValidPhoneNumberForCountry();
      }
      else
      {
        v9 = PKCurrentRegion();
        char valid = PNIsValidPhoneNumberForCountry();
        if (!v9) {
          goto LABEL_9;
        }
      }
      CFRelease(v9);
    }
LABEL_9:

    goto LABEL_10;
  }
  char valid = 1;
LABEL_10:

  return valid;
}

- (BOOL)emailAddressIsValid:(id)a3
{
  id v4 = a3;
  if ([(PKContactFormatConfiguration *)self->_configuration checkFormatOfEmailAddress])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)contactFieldConfigurationForPostalField:(id)a3 forCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a4];
  id v8 = [v7 addressFormatConfiguration];
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B7C8]])
  {
    uint64_t v9 = [v8 streetFieldConfiguration];
LABEL_13:
    BOOL v10 = (void *)v9;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B7D8]])
  {
    uint64_t v9 = [v8 subLocalityFieldConfiguration];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B798]])
  {
    uint64_t v9 = [v8 cityFieldConfiguration];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B7D0]])
  {
    uint64_t v9 = [v8 subAdministrativeAreaFieldConfiguration];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B7C0]])
  {
    uint64_t v9 = [v8 stateFieldConfiguration];
    goto LABEL_13;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1B7B0]])
  {
    uint64_t v9 = [v8 postalCodeFieldConfiguration];
    goto LABEL_13;
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (id)contactFieldConfigurationForGivenNameForCountryCode:(id)a3
{
  v3 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a3];
  id v4 = [v3 nameComponentFormatConfiguration];
  id v5 = [v4 givenNameFieldConfiguration];

  return v5;
}

- (id)contactFieldConfigurationForFamilyNameForCountryCode:(id)a3
{
  v3 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a3];
  id v4 = [v3 nameComponentFormatConfiguration];
  id v5 = [v4 familyNameFieldConfiguration];

  return v5;
}

- (id)contactFieldConfigurationForPhoneticGivenNameForCountryCode:(id)a3
{
  v3 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a3];
  id v4 = [v3 nameComponentFormatConfiguration];
  id v5 = [v4 phoneticGivenNameFieldConfiguration];

  return v5;
}

- (id)contactFieldConfigurationForPhoneticFamilyNameForCountryCode:(id)a3
{
  v3 = [(PKContactFormatConfiguration *)self->_configuration contactFieldConfigurationForCountryCode:a3];
  id v4 = [v3 nameComponentFormatConfiguration];
  id v5 = [v4 phoneticFamilyNameFieldConfiguration];

  return v5;
}

- (BOOL)_isFieldEntry:(id)a3 validForContactFieldConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v9 = [v7 type];
  if (v9 == 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v10 = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForPickerContactFieldConfiguration:v8];
      goto LABEL_8;
    }
LABEL_9:
    BOOL v11 = 1;
    goto LABEL_10;
  }
  if (v9 != 1) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v10 = [(PKContactFormatValidator *)self _isFieldEntry:v6 validForTextContactFieldConfiguration:v8];
LABEL_8:
  BOOL v11 = v10;
LABEL_10:

  return v11;
}

- (BOOL)_isFieldEntry:(id)a3 validForTextContactFieldConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 minLength];
    if (v8) {
      int v9 = [v5 length] >= v8;
    }
    else {
      int v9 = 1;
    }
    unint64_t v10 = [v7 maxLength];
    if (v9 && v10) {
      int v9 = [v5 length] <= v10;
    }
    uint64_t v11 = [v7 characterSet];
    BOOL v12 = (void *)v11;
    if (v9 && v11)
    {
      int v13 = [v7 isValidCharacterSet];
      if ([v5 length])
      {
        unint64_t v14 = 0;
        do
        {
          int v15 = v13 ^ objc_msgSend(v12, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v14));
          if (v15 == 1) {
            break;
          }
          ++v14;
        }
        while (v14 < [v5 length]);
        int v9 = v15 ^ 1;
      }
      else
      {
        int v9 = 1;
      }
    }
    BOOL v16 = [v7 validRegex];
    BOOL v17 = v16;
    if (v9 && v16) {
      LOBYTE(v9) = objc_msgSend(v16, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")) != 0;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_isFieldEntry:(id)a3 validForPickerContactFieldConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    unint64_t v8 = [v6 pickerItems];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PKContactFormatValidator__isFieldEntry_validForPickerContactFieldConfiguration___block_invoke;
    v11[3] = &unk_1E56E8DB0;
    id v12 = v5;
    int v13 = &v14;
    [v8 enumerateObjectsUsingBlock:v11];

    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

uint64_t __82__PKContactFormatValidator__isFieldEntry_validForPickerContactFieldConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isValueAccepted:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)_formattedFieldEntry:(id)a3 forFieldConfiguration:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 type] == 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v8 = objc_msgSend(v7, "pickerItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 isValueAccepted:v5])
          {
            uint64_t v14 = [v13 submissionValue];
            if (![v5 isEqualToString:v14]) {
              goto LABEL_14;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    uint64_t v14 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end