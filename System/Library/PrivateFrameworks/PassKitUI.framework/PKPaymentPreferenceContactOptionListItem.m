@interface PKPaymentPreferenceContactOptionListItem
- (BOOL)_isEmail;
- (BOOL)_isHideMyEmail;
- (BOOL)_isPhoneNumber;
- (BOOL)_isPostalAddress;
- (BOOL)_supportsDeleteAction;
- (BOOL)_supportsEditAction;
- (BOOL)_supportsEditing;
- (BOOL)supportsInlineEditing;
- (id)_inlineEditingConfiguration;
- (id)_placeholderText;
- (id)_secondaryText;
- (id)_text;
- (id)defaultAccessories;
@end

@implementation PKPaymentPreferenceContactOptionListItem

- (BOOL)_isPostalAddress
{
  v2 = [(PKPaymentPreferenceContactOptionListItem *)self contactSectionPreference];
  v3 = [v2 contactKey];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AF10]];

  return v4;
}

- (BOOL)_isPhoneNumber
{
  v2 = [(PKPaymentPreferenceContactOptionListItem *)self contactSectionPreference];
  v3 = [v2 contactKey];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  return v4;
}

- (BOOL)_isEmail
{
  v2 = [(PKPaymentPreferenceContactOptionListItem *)self contactSectionPreference];
  v3 = [v2 contactKey];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  return v4;
}

- (BOOL)_isHideMyEmail
{
  BOOL v3 = [(PKPaymentPreferenceContactOptionListItem *)self _isEmail];
  if (v3)
  {
    char v4 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    char v5 = [v4 isHideMyEmail];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_inlineEditingConfiguration
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  BOOL v3 = [(PKPaymentPreferenceOptionListItem *)&v11 _inlineEditingConfiguration];
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isEmail])
  {
    uint64_t v4 = 7;
LABEL_5:
    [v3 setKeyboardType:v4];
    goto LABEL_6;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isPhoneNumber])
  {
    uint64_t v4 = 5;
    goto LABEL_5;
  }
LABEL_6:
  char v5 = [(PKPaymentPreferenceContactOptionListItem *)self contactSectionPreference];
  v6 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
  v7 = [v5 errorsForPreference:v6];
  if ([v7 count])
  {
    uint64_t v8 = [v5 selectedIndex];
    if (v8 == [v5 indexOfContact:v6])
    {
      v9 = [v7 firstObject];
      [v3 setError:v9];
    }
  }

  return v3;
}

- (id)_text
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isPostalAddress])
  {
    BOOL v3 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    uint64_t v4 = objc_msgSend(v3, "pk_displayName");
LABEL_7:
    uint64_t v8 = (void *)v4;
    goto LABEL_8;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isPhoneNumber])
  {
    char v5 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    v6 = [v5 phoneNumbers];
    BOOL v3 = [v6 firstObject];

    v7 = [v3 value];
    uint64_t v8 = [v7 pkFormattedStringValue];

LABEL_8:
    goto LABEL_9;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isEmail])
  {
    v9 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    v10 = [v9 emailAddresses];
    BOOL v3 = [v10 firstObject];

    uint64_t v4 = [v3 value];
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (id)_placeholderText
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isPhoneNumber])
  {
    BOOL v3 = @"SETTINGS_TRANSACTION_DEFAULTS_PHONE";
LABEL_5:
    uint64_t v4 = PKLocalizedPaymentString(&v3->isa);
    goto LABEL_7;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isEmail])
  {
    BOOL v3 = @"SETTINGS_TRANSACTION_DEFAULTS_EMAIL";
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

- (id)_secondaryText
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isPostalAddress])
  {
    id v3 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    uint64_t v4 = [v3 pkSingleLineFormattedContactAddress];
LABEL_9:

    goto LABEL_10;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isEmail]
    || [(PKPaymentPreferenceContactOptionListItem *)self _isPhoneNumber])
  {
    char v5 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    uint64_t v4 = objc_msgSend(v5, "pk_displayName");

    if (![(PKPaymentPreferenceContactOptionListItem *)self _isHideMyEmail]) {
      goto LABEL_10;
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F84750]);
    uint64_t v6 = [v3 forwardingEmailForPrimaryAccount];
    v7 = (void *)v6;
    if (v6)
    {
      uint64_t v8 = PKLocalizedHideMyEmailString(&cfstr_HmeSettingsRow.isa, &stru_1EF1B4C70.isa, v6);

      uint64_t v4 = (void *)v8;
    }

    goto LABEL_9;
  }
  uint64_t v4 = 0;
LABEL_10:

  return v4;
}

- (id)defaultAccessories
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKPaymentPreferenceContactOptionListItem *)self _supportsEditing])
  {
    if ([(PKPaymentPreferenceContactOptionListItem *)self _isPostalAddress])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1518]);
      [v4 setDisplayedState:1];
      [v3 addObject:v4];
    }
    char v5 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
    uint64_t v6 = [v5 contactSource];

    if (v6 != 1)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1508]);
      [v3 addObject:v7];
    }
  }

  return v3;
}

- (BOOL)supportsInlineEditing
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isHideMyEmail]) {
    return 0;
  }
  else {
    return ![(PKPaymentPreferenceContactOptionListItem *)self _isPostalAddress];
  }
}

- (BOOL)_supportsDeleteAction
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isHideMyEmail]) {
    return 0;
  }
  id v3 = [(PKPaymentPreferenceContactOptionListItem *)self contactPreference];
  uint64_t v4 = [v3 contactSource];

  if (v4 == 1) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  return [(PKPaymentPreferenceOptionListItem *)&v6 _supportsDeleteAction];
}

- (BOOL)_supportsEditing
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isHideMyEmail]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  return [(PKPaymentPreferenceOptionListItem *)&v4 _supportsEditing];
}

- (BOOL)_supportsEditAction
{
  if ([(PKPaymentPreferenceContactOptionListItem *)self _isHideMyEmail]) {
    return 0;
  }
  if ([(PKPaymentPreferenceContactOptionListItem *)self _supportsEditing])
  {
    return [(PKPaymentPreferenceContactOptionListItem *)self _isPostalAddress];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
    return [(PKPaymentPreferenceOptionListItem *)&v4 _supportsEditAction];
  }
}

@end