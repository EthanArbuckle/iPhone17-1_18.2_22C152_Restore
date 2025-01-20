@interface WBSAddSavedAccountValidationAlertConfiguration
+ (NSString)alertDismissActionTitleForFailedAccountCreation;
+ (NSString)alertUnknownErrorStringForFailedAccountCreation;
+ (id)alertSubtitleForFailedAccountCreationWithErrorCode:(int64_t)a3 forUserTypedSite:(id)a4 userTypedUsername:(id)a5 highLevelDomain:(id)a6;
+ (id)alertTitleForFailedAccountCreationWithErrorCode:(int64_t)a3;
@end

@implementation WBSAddSavedAccountValidationAlertConfiguration

+ (id)alertTitleForFailedAccountCreationWithErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 1) {
      v4 = @"Incomplete Website Address";
    }
    else {
      v4 = @"Cannot Add Password";
    }
  }
  else
  {
    v4 = @"Password Already Exists";
  }
  v5 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return v5;
}

+ (id)alertSubtitleForFailedAccountCreationWithErrorCode:(int64_t)a3 forUserTypedSite:(id)a4 userTypedUsername:(id)a5 highLevelDomain:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  switch(a3)
  {
    case 1:
      v16 = @"Add a complete website address to allow this password to AutoFill in Safari and other apps.";
      goto LABEL_9;
    case 2:
      v17 = NSString;
      v14 = _WBSLocalizedString(@"A password for “%@” on “%@” already exists.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      objc_msgSend(v17, "localizedStringWithFormat:", v14, v11, v10);
      goto LABEL_6;
    case 3:
    case 4:
      v13 = NSString;
      v14 = _WBSLocalizedString(@"A password for “%@” on “%@” already exists.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      objc_msgSend(v13, "localizedStringWithFormat:", v14, v11, v12);
      v18 = LABEL_6:;

      goto LABEL_11;
    case 5:
      v16 = @"To save a password, you need to provide either a website, app name, or label.";
      goto LABEL_9;
    case 6:
      v16 = @"Cannot add password to this group.";
LABEL_9:
      uint64_t v15 = _WBSLocalizedString(v16, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      break;
    default:
      uint64_t v15 = [a1 alertUnknownErrorStringForFailedAccountCreation];
      break;
  }
  v18 = (void *)v15;
LABEL_11:

  return v18;
}

+ (NSString)alertDismissActionTitleForFailedAccountCreation
{
  return (NSString *)_WBSLocalizedString(@"OK", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

+ (NSString)alertUnknownErrorStringForFailedAccountCreation
{
  return (NSString *)_WBSLocalizedString(@"An Error Occurred.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

@end