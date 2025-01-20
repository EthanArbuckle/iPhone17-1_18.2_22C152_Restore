@interface WBSPasswordWarning
- (BOOL)hasBeenCompromised;
- (BOOL)hasBeenHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain;
- (BOOL)shouldShowWarningsWhenLoggingIn;
- (NSString)localizedAlertWarningForSharingReusedPassword;
- (NSString)localizedBody;
- (NSString)localizedHeadline;
- (NSString)localizedInformationTextForWarningWhenLoggingIn;
- (NSString)localizedShortDescriptionOfProblemType;
- (NSString)localizedShortDescriptivePhrase;
- (WBSPasswordWarning)initWithSavedAccount:(id)a3 issueTypes:(unint64_t)a4 weakPasswordEvaluation:(id)a5 titlesOfSavedAccountsWithReusedPassword:(id)a6 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a7;
- (WBSSavedAccount)savedAccount;
- (id)_localizedLongWarningStringsForClient:(unint64_t)a3;
- (id)_localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:(BOOL)a3;
- (id)_localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:(BOOL)a3;
- (id)_localizedShortDescriptionWithFullDescriptivePhrase:(BOOL)a3 shouldDescribeMultipleIssues:(BOOL)a4;
- (id)localizedLongDescriptionForClient:(unint64_t)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)_passwordVisibilityForClient:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hashForUserAcknowlegement;
- (unint64_t)issueTypes;
- (unint64_t)severity;
- (unint64_t)severityScore;
- (void)_addFormerlySharedWarningStringToWarningStrings:(id)a3;
- (void)_addReusedWarningStringToWarningStrings:(id)a3;
- (void)setSeverityScore:(unint64_t)a3;
@end

@implementation WBSPasswordWarning

- (WBSPasswordWarning)initWithSavedAccount:(id)a3 issueTypes:(unint64_t)a4 weakPasswordEvaluation:(id)a5 titlesOfSavedAccountsWithReusedPassword:(id)a6 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WBSPasswordWarning;
  v16 = [(WBSPasswordWarning *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_savedAccount, a3);
    v17->_issueTypes = a4;
    objc_storeStrong((id *)&v17->_weakPasswordEvaluation, a5);
    uint64_t v18 = [v15 copy];
    titlesOfSavedAccountsWithReusedPassword = v17->_titlesOfSavedAccountsWithReusedPassword;
    v17->_titlesOfSavedAccountsWithReusedPassword = (NSArray *)v18;

    v17->_savedAccountIsOnlySavedAccountForHighLevelDomain = a7;
    v20 = v17;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPasswordWarning *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(WBSSavedAccount *)self->_savedAccount isEqual:v5->_savedAccount]
        && self->_issueTypes == v5->_issueTypes
        && [(WBSPasswordEvaluation *)self->_weakPasswordEvaluation isEqual:v5->_weakPasswordEvaluation]
        && self->_savedAccountIsOnlySavedAccountForHighLevelDomain == v5->_savedAccountIsOnlySavedAccountForHighLevelDomain;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_issueTypes ^ [(WBSSavedAccount *)self->_savedAccount hash];
  return v3 ^ [(WBSPasswordEvaluation *)self->_weakPasswordEvaluation hash] ^ self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (unint64_t)severity
{
  if (!self->_issueTypes) {
    return 0;
  }
  if (self->_severityScore > 9) {
    return 1;
  }
  return 2;
}

- (BOOL)shouldShowWarningsWhenLoggingIn
{
  if ([(WBSPasswordWarning *)self hasBeenCompromised]) {
    return 1;
  }
  weakPasswordEvaluation = self->_weakPasswordEvaluation;
  return [(WBSPasswordEvaluation *)weakPasswordEvaluation userShouldBeShownActiveWarning];
}

- (NSString)localizedShortDescriptivePhrase
{
  uint64_t v3 = +[WBSFeatureAvailability isPasswordsAppInstalled] ^ 1;
  return (NSString *)[(WBSPasswordWarning *)self _localizedShortDescriptionWithFullDescriptivePhrase:1 shouldDescribeMultipleIssues:v3];
}

- (NSString)localizedShortDescriptionOfProblemType
{
  uint64_t v3 = +[WBSFeatureAvailability isPasswordsAppInstalled] ^ 1;
  return (NSString *)[(WBSPasswordWarning *)self _localizedShortDescriptionWithFullDescriptivePhrase:0 shouldDescribeMultipleIssues:v3];
}

- (id)_localizedShortDescriptionWithFullDescriptivePhrase:(BOOL)a3 shouldDescribeMultipleIssues:(BOOL)a4
{
  if (a4) {
    [(WBSPasswordWarning *)self _localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:a3];
  }
  else {
  v4 = [(WBSPasswordWarning *)self _localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:a3];
  }
  return v4;
}

- (id)_localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:(BOOL)a3
{
  unint64_t issueTypes = self->_issueTypes;
  if ((issueTypes & 0xC) != 0)
  {
    if ((~(_BYTE)issueTypes & 0x30) != 0)
    {
      if ((issueTypes & 0x10) != 0)
      {
        if (a3)
        {
          v4 = @"Compromised, previously shared password";
          goto LABEL_34;
        }
      }
      else
      {
        if ((issueTypes & 0x20) == 0)
        {
          if (issueTypes)
          {
            if (a3) {
              v4 = @"Compromised, reused password";
            }
            else {
              v4 = @"Compromised, reused";
            }
          }
          else if ((issueTypes & 2) != 0)
          {
            if (a3) {
              v4 = @"Compromised, easily guessed password";
            }
            else {
              v4 = @"Compromised, easily guessed";
            }
          }
          else if (a3)
          {
            v4 = @"Compromised password";
          }
          else
          {
            v4 = @"Compromised";
          }
          goto LABEL_34;
        }
        if (a3)
        {
          v4 = @"Compromised password, previously shared passkey";
          goto LABEL_34;
        }
      }
    }
    else if (a3)
    {
      v4 = @"Compromised password, previously shared passkey and password";
LABEL_34:
      v5 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      goto LABEL_35;
    }
    v4 = @"Compromised, previously shared";
    goto LABEL_34;
  }
  if ((~(_BYTE)issueTypes & 3) == 0)
  {
    if (a3) {
      v4 = @"Easily guessed, reused password";
    }
    else {
      v4 = @"Easily guessed, reused";
    }
    goto LABEL_34;
  }
  if ((issueTypes & 2) != 0)
  {
    if (a3) {
      v4 = @"Easily guessed password";
    }
    else {
      v4 = @"Easily guessed";
    }
    goto LABEL_34;
  }
  if (issueTypes)
  {
    if (a3) {
      v4 = @"Reused password";
    }
    else {
      v4 = @"Reused";
    }
    goto LABEL_34;
  }
  if ((~(_BYTE)issueTypes & 0x30) == 0)
  {
    if (a3)
    {
      v4 = @"Previously shared passkey and password";
      goto LABEL_34;
    }
LABEL_52:
    v4 = @"Previously shared";
    goto LABEL_34;
  }
  if ((issueTypes & 0x10) != 0)
  {
    if (a3)
    {
      v4 = @"Previously shared password";
      goto LABEL_34;
    }
    goto LABEL_52;
  }
  if ((issueTypes & 0x20) != 0)
  {
    if (a3)
    {
      v4 = @"Previously shared passkey";
      goto LABEL_34;
    }
    goto LABEL_52;
  }
  v5 = 0;
LABEL_35:
  return v5;
}

- (id)_localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:(BOOL)a3
{
  unint64_t issueTypes = self->_issueTypes;
  if ((issueTypes & 0xC) != 0)
  {
    if (a3) {
      v4 = @"Compromised password";
    }
    else {
      v4 = @"Compromised";
    }
    goto LABEL_25;
  }
  if ((issueTypes & 2) != 0)
  {
    if (a3) {
      v4 = @"Easily guessed password";
    }
    else {
      v4 = @"Easily guessed";
    }
    goto LABEL_25;
  }
  if (issueTypes)
  {
    if (a3) {
      v4 = @"Reused password";
    }
    else {
      v4 = @"Reused";
    }
    goto LABEL_25;
  }
  if ((~(_BYTE)issueTypes & 0x30) != 0)
  {
    if ((issueTypes & 0x10) != 0)
    {
      if (a3)
      {
        v4 = @"Previously shared password";
        goto LABEL_25;
      }
    }
    else
    {
      if ((issueTypes & 0x20) == 0)
      {
        v5 = 0;
        goto LABEL_26;
      }
      if (a3)
      {
        v4 = @"Previously shared passkey";
        goto LABEL_25;
      }
    }
LABEL_24:
    v4 = @"Previously shared";
    goto LABEL_25;
  }
  if (!a3) {
    goto LABEL_24;
  }
  v4 = @"Previously shared passkey and password";
LABEL_25:
  v5 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
LABEL_26:
  return v5;
}

- (unint64_t)_passwordVisibilityForClient:(unint64_t)a3
{
  return 2 * (a3 == 2);
}

- (id)_localizedLongWarningStringsForClient:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t issueTypes = self->_issueTypes;
  if ((issueTypes & 8) != 0)
  {
    v7 = _WBSLocalizedString(@"This password has appeared in a data leak, which puts this account at high risk of compromise.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    [v5 addObject:v7];

    unint64_t issueTypes = self->_issueTypes;
  }
  if ((issueTypes & 4) != 0)
  {
    v8 = _WBSLocalizedString(@"Many people use this password, which makes it easy to guess.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    [v5 addObject:v8];
  }
  uint64_t v9 = [v5 count];
  unint64_t v10 = self->_issueTypes;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = (self->_issueTypes & 2) == 0;
  }
  if (!v11)
  {
    v12 = [(WBSPasswordEvaluation *)self->_weakPasswordEvaluation userFeedbackStringWithPasswordVisibility:[(WBSPasswordWarning *)self _passwordVisibilityForClient:a3]];
    if (v12) {
      [v5 addObject:v12];
    }

    unint64_t v10 = self->_issueTypes;
  }
  if ((v10 & 0x30) != 0) {
    [(WBSPasswordWarning *)self _addFormerlySharedWarningStringToWarningStrings:v5];
  }
  if ((unint64_t)[v5 count] <= 1) {
    [(WBSPasswordWarning *)self _addReusedWarningStringToWarningStrings:v5];
  }
  if ([v5 count]) {
    id v13 = v5;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (void)_addReusedWarningStringToWarningStrings:(id)a3
{
  id v23 = a3;
  switch([(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword count])
  {
    case 0uLL:
      goto LABEL_21;
    case 1uLL:
      uint64_t v4 = [v23 count];
      id v5 = NSString;
      if (v4) {
        BOOL v6 = @"You’re also reusing this password on “%@”, which increases the risk to this account if your “%@” account is compromised.";
      }
      else {
        BOOL v6 = @"You’re reusing this password on “%@”, which increases the risk to this account if your “%@” account is compromised.";
      }
      id v15 = _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v16 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      titlesOfSavedAccountsWithReusedPassword = self->_titlesOfSavedAccountsWithReusedPassword;
      uint64_t v18 = 0;
      goto LABEL_16;
    case 2uLL:
      uint64_t v10 = [v23 count];
      id v5 = NSString;
      if (v10) {
        BOOL v11 = @"You’re also reusing this password on “%@” and “%@”, which increases the risk to this account if one of those accounts is compromised.";
      }
      else {
        BOOL v11 = @"You’re reusing this password on “%@” and “%@”, which increases the risk to this account if one of those accounts is compromised.";
      }
      id v15 = _WBSLocalizedString(v11, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v16 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      titlesOfSavedAccountsWithReusedPassword = self->_titlesOfSavedAccountsWithReusedPassword;
      uint64_t v18 = 1;
LABEL_16:
      v19 = [(NSArray *)titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:v18];
      uint64_t v20 = objc_msgSend(v5, "stringWithFormat:", v15, v16, v19);
      goto LABEL_17;
    case 3uLL:
      uint64_t v12 = [v23 count];
      id v13 = NSString;
      if (v12) {
        id v14 = @"You’re also reusing this password on “%@”, “%@”, and “%@”, which increases the risk to this account if one of those accounts is compromised.";
      }
      else {
        id v14 = @"You’re reusing this password on “%@”, “%@”, and “%@”, which increases the risk to this account if one of those accounts is compromised.";
      }
      id v15 = _WBSLocalizedString(v14, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v16 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      v19 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
      v21 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:2];
      objc_super v22 = objc_msgSend(v13, "stringWithFormat:", v15, v16, v19, v21);
      [v23 addObject:v22];

      goto LABEL_20;
    default:
      uint64_t v7 = [v23 count];
      v8 = NSString;
      if (v7) {
        uint64_t v9 = @"You’re also reusing this password on other websites, including “%@”, “%@”, and %lu more. This increases the risk to this account if one of those accounts is compromised.";
      }
      else {
        uint64_t v9 = @"You’re reusing this password on other websites, including “%@”, “%@”, and %lu more. This increases the risk to this account if one of those accounts is compromised.";
      }
      id v15 = _WBSLocalizedString(v9, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v16 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      v19 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
      uint64_t v20 = objc_msgSend(v8, "localizedStringWithFormat:", v15, v16, v19, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
LABEL_17:
      v21 = (void *)v20;
      [v23 addObject:v20];
LABEL_20:

LABEL_21:

      return;
  }
}

- (void)_addFormerlySharedWarningStringToWarningStrings:(id)a3
{
  id v23 = a3;
  unint64_t v4 = self->_issueTypes & 0x30;
  if (v4 == 48)
  {
    BOOL v11 = [(WBSSavedAccount *)self->_savedAccount formerlySharedPasswordMarker];
    uint64_t v12 = [v11 nameOfGroupCredentialWasLastSharedIn];
    id v13 = v12;
    if (v12)
    {
      id v6 = v12;
    }
    else
    {
      v17 = [(WBSSavedAccount *)self->_savedAccount formerlySharedPasskeyMarker];
      id v6 = [v17 nameOfGroupCredentialWasLastSharedIn];
    }
    uint64_t v18 = [v23 count];
    uint64_t v19 = [v6 length];
    if (v18)
    {
      if (v19)
      {
        uint64_t v9 = NSString;
        uint64_t v10 = @"You also previously shared this passkey and this password with the group “%@”. You should change them if you want to ensure that members of that group no longer have access to this account.";
        goto LABEL_22;
      }
      objc_super v22 = @"You also previously shared this passkey and this password with a group. You should change them if you want to ensure that members of that group no longer have access to this account.";
    }
    else
    {
      if (v19)
      {
        uint64_t v9 = NSString;
        uint64_t v10 = @"You previously shared this passkey and this password with the group “%@”. You should change them if you want to ensure that members of that group no longer have access to this account.";
        goto LABEL_22;
      }
      objc_super v22 = @"You previously shared this passkey and this password with a group. You should change them if you want to ensure that members of that group no longer have access to this account.";
    }
    goto LABEL_29;
  }
  if (v4 == 32)
  {
    id v14 = [(WBSSavedAccount *)self->_savedAccount formerlySharedPasskeyMarker];
    id v6 = [v14 nameOfGroupCredentialWasLastSharedIn];

    uint64_t v15 = [v23 count];
    uint64_t v16 = [v6 length];
    if (v15)
    {
      if (v16)
      {
        uint64_t v9 = NSString;
        uint64_t v10 = @"You also previously shared this passkey with the group “%@”. You should change this passkey if you want to ensure that members of that group no longer have access to this account.";
        goto LABEL_22;
      }
      objc_super v22 = @"You also previously shared this passkey with a group. You should change this passkey if you want to ensure that members of that group no longer have access to this account.";
    }
    else
    {
      if (v16)
      {
        uint64_t v9 = NSString;
        uint64_t v10 = @"You previously shared this passkey with the group “%@”. You should change this passkey if you want to ensure that members of that group no longer have access to this account.";
        goto LABEL_22;
      }
      objc_super v22 = @"You previously shared this passkey with a group. You should change this passkey if you want to ensure that members of that group no longer have access to this account.";
    }
LABEL_29:
    uint64_t v20 = _WBSLocalizedString(v22, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    [v23 addObject:v20];
    goto LABEL_30;
  }
  if (v4 != 16) {
    goto LABEL_31;
  }
  id v5 = [(WBSSavedAccount *)self->_savedAccount formerlySharedPasswordMarker];
  id v6 = [v5 nameOfGroupCredentialWasLastSharedIn];

  uint64_t v7 = [v23 count];
  uint64_t v8 = [v6 length];
  if (!v7)
  {
    if (v8)
    {
      uint64_t v9 = NSString;
      uint64_t v10 = @"You previously shared this password with the group “%@”. You should change this password if you want to ensure that members of that group no longer have access to this account.";
      goto LABEL_22;
    }
    objc_super v22 = @"You previously shared this password with a group. You should change this password if you want to ensure that members of that group no longer have access to this account.";
    goto LABEL_29;
  }
  if (!v8)
  {
    objc_super v22 = @"You also previously shared this password with a group. You should change this password if you want to ensure that members of that group no longer have access to this account.";
    goto LABEL_29;
  }
  uint64_t v9 = NSString;
  uint64_t v10 = @"You also previously shared this password with the group “%@”. You should change this password if you want to ensure that members of that group no longer have access to this account.";
LABEL_22:
  uint64_t v20 = _WBSLocalizedString(v10, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v21 = objc_msgSend(v9, "localizedStringWithFormat:", v20, v6);
  [v23 addObject:v21];

LABEL_30:
LABEL_31:
}

- (NSString)localizedHeadline
{
  if ([(WBSPasswordWarning *)self hasBeenCompromised])
  {
    uint64_t v3 = @"This password should be changed immediately.";
  }
  else
  {
    unint64_t issueTypes = self->_issueTypes;
    if ((issueTypes & 3) != 0 || (issueTypes & 0x10) != 0)
    {
      uint64_t v3 = @"This password should be changed.";
    }
    else
    {
      if ((issueTypes & 0x20) == 0)
      {
        id v5 = &stru_1F105D3F0;
        goto LABEL_9;
      }
      uint64_t v3 = @"This passkey should be changed.";
    }
  }
  _WBSLocalizedString(v3, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  return (NSString *)v5;
}

- (NSString)localizedBody
{
  if ([(WBSPasswordWarning *)self hasBeenCompromised])
  {
    uint64_t v3 = NSString;
    unint64_t v4 = @"Your “%@” password was detected in a data leak and may be compromised. Passwords can create and save a new one to help keep your account safe.";
LABEL_9:
    uint64_t v7 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
    objc_msgSend(v3, "localizedStringWithFormat:", v7, v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  unint64_t issueTypes = self->_issueTypes;
  if ((issueTypes & 2) != 0)
  {
    uint64_t v3 = NSString;
    unint64_t v4 = @"Your “%@” password is easy to guess. Passwords can create and save a new one to help keep your account safe.";
    goto LABEL_9;
  }
  if (issueTypes)
  {
    uint64_t v9 = &stru_1F105D3F0;
    switch([(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword count])
    {
      case 0uLL:
        goto LABEL_11;
      case 1uLL:
        BOOL v11 = NSString;
        uint64_t v7 = _WBSLocalizedString(@"Youʼre already using the password for “%@” with “%@”. Passwords can create and save a new one to help keep your account safe.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
        uint64_t v12 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
        objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v12);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      case 2uLL:
        uint64_t v16 = NSString;
        uint64_t v7 = _WBSLocalizedString(@"Youʼre already using the password for “%@” with “%@” and “%@”. Passwords can create and save a new one to help keep your account safe.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
        id v14 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
        v17 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
        objc_msgSend(v16, "localizedStringWithFormat:", v7, v8, v14, v17);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      case 3uLL:
        uint64_t v18 = NSString;
        uint64_t v7 = _WBSLocalizedString(@"Youʼre already using the password for “%@” with “%@”, “%@”, and “%@”. Passwords can create and save a new one to help keep your account safe.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
        id v14 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
        uint64_t v15 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
        uint64_t v19 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:2];
        objc_msgSend(v18, "localizedStringWithFormat:", v7, v8, v14, v15, v19);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      default:
        id v13 = NSString;
        uint64_t v7 = _WBSLocalizedString(@"Youʼre already using the password for “%@” with “%@”, “%@”, and %lu more. Passwords can create and save a new one to help keep your account safe.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
        id v14 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
        uint64_t v15 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
        objc_msgSend(v13, "localizedStringWithFormat:", v7, v8, v14, v15, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
        break;
    }
    goto LABEL_10;
  }
  if ((issueTypes & 0x30) != 0)
  {
    char v6 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
    uint64_t v3 = NSString;
    if (v6) {
      unint64_t v4 = @"Your “%@” password was previously shared with other people and should be changed if you want to ensure they no longer have access to this account. Passwords can create and save a new one to help keep your account safe.";
    }
    else {
      unint64_t v4 = @"Your “%@” passkey was previously shared with other people and should be changed if you want to ensure they no longer have access to this account. Passwords can create and save a new one to help keep your account safe.";
    }
    goto LABEL_9;
  }
  uint64_t v9 = &stru_1F105D3F0;
LABEL_11:
  return (NSString *)v9;
}

- (id)localizedLongDescriptionForClient:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = -[WBSPasswordWarning _localizedLongWarningStringsForClient:](self, "_localizedLongWarningStringsForClient:");
    uint64_t v4 = [v3 componentsJoinedByString:@"\n\n"];
  }
  else
  {
    if (self->_issueTypes == 1)
    {
      id v5 = _WBSLocalizedString(@"You’re reusing this password on other websites, which increases the risk to this account if one of those other accounts is compromised.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      goto LABEL_7;
    }
    uint64_t v3 = -[WBSPasswordWarning _localizedLongWarningStringsForClient:](self, "_localizedLongWarningStringsForClient:");
    uint64_t v4 = [v3 firstObject];
  }
  id v5 = (void *)v4;

LABEL_7:
  return v5;
}

- (NSString)localizedInformationTextForWarningWhenLoggingIn
{
  v2 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  uint64_t v3 = +[WBSDevice currentDevice];
  int v4 = [v3 deviceClass];

  id v5 = NSString;
  if (v4 == 3) {
    char v6 = @"iPad can create a strong password for you. Would you like to change your password for “%@”?";
  }
  else {
    char v6 = @"iPhone can create a strong password for you. Would you like to change your password for “%@”?";
  }
  uint64_t v7 = _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, v2);

  return (NSString *)v8;
}

- (NSString)localizedAlertWarningForSharingReusedPassword
{
  uint64_t v3 = &stru_1F105D3F0;
  switch([(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword count])
  {
    case 0uLL:
      goto LABEL_8;
    case 1uLL:
      int v4 = NSString;
      id v5 = _WBSLocalizedString(@"You’re also using this password on “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      char v6 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      objc_msgSend(v4, "stringWithFormat:", v5, v6);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      uint64_t v9 = NSString;
      id v5 = _WBSLocalizedString(@"You’re also using this password on “%@” and “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      char v6 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      uint64_t v10 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
      objc_msgSend(v9, "stringWithFormat:", v5, v6, v10);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 3uLL:
      BOOL v11 = NSString;
      id v5 = _WBSLocalizedString(@"You’re also using this password on “%@”, “%@”, and “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      char v6 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      uint64_t v8 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
      uint64_t v12 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:2];
      objc_msgSend(v11, "stringWithFormat:", v5, v6, v8, v12);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    default:
      uint64_t v7 = NSString;
      id v5 = _WBSLocalizedString(@"You’re also using this password on other websites, including “%@”, “%@”, and %lu more. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      char v6 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:0];
      uint64_t v8 = [(NSArray *)self->_titlesOfSavedAccountsWithReusedPassword objectAtIndexedSubscript:1];
      objc_msgSend(v7, "localizedStringWithFormat:", v5, v6, v8, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_7:
LABEL_8:
      return (NSString *)v3;
  }
}

- (int64_t)compare:(id)a3
{
  int v4 = a3;
  id v5 = [NSNumber numberWithUnsignedInteger:v4[6]];
  char v6 = [NSNumber numberWithUnsignedInteger:self->_severityScore];
  int64_t v7 = [v5 compare:v6];

  if (!v7) {
    int64_t v7 = [(WBSSavedAccount *)self->_savedAccount compare:v4[4]];
  }

  return v7;
}

- (unint64_t)hashForUserAcknowlegement
{
  uint64_t v3 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  unint64_t v4 = self->_issueTypes ^ [v3 hash];

  return v4;
}

- (BOOL)hasBeenCompromised
{
  return (self->_issueTypes & 0xC) != 0;
}

- (BOOL)hasBeenHidden
{
  uint64_t v3 = [(WBSSavedAccount *)self->_savedAccount hideWarningMarker];
  unint64_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  if (!self->_issueTypes || (uint64_t v5 = [v3 issueTypes], (self->_issueTypes | v5) != v5))
  {
    int64_t v7 = +[WBSSavedAccountStore sharedStore];
    [v7 removeHideWarningMarkerForSavedAccount:self->_savedAccount];

LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (unint64_t)issueTypes
{
  return self->_issueTypes;
}

- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain
{
  return self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (unint64_t)severityScore
{
  return self->_severityScore;
}

- (void)setSeverityScore:(unint64_t)a3
{
  self->_severityScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_titlesOfSavedAccountsWithReusedPassword, 0);
  objc_storeStrong((id *)&self->_weakPasswordEvaluation, 0);
}

@end