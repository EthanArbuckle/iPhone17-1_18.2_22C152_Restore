@interface ICAuthenticationPrompt
+ (id)promptForChangingMode:(signed __int16)a3 account:(id)a4;
+ (id)promptForDeletingNotes:(id)a3;
+ (id)promptForIntent:(unint64_t)a3 object:(id)a4;
- (BOOL)allowsAlternativeAuthentication;
- (BOOL)allowsAuthentication;
- (BOOL)allowsBiometricAuthentication;
- (BOOL)allowsCustomPasswordAuthentication;
- (BOOL)allowsDevicePasswordAuthentication;
- (BOOL)forcesAlternativeAuthentication;
- (BOOL)forcesBiometricAuthentication;
- (BOOL)forcesSecondaryAuthentication;
- (BOOL)hasCloudAccount;
- (BOOL)hasDevicePassword;
- (BOOL)hasDivergedKey;
- (BOOL)hasKeychainItem;
- (BOOL)hasPassphrase;
- (BOOL)isBiometricAuthenticationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternetReachable;
- (BOOL)isKeychainAvailable;
- (BOOL)needsAuthentication;
- (BOOL)needsCloudAccount;
- (BOOL)needsDevicePassword;
- (BOOL)needsKeychain;
- (BOOL)needsSecondaryAuthentication;
- (BOOL)needsUserRecordUpdate;
- (BOOL)unlocksNotes;
- (BOOL)updatesUserRecordIfNeeded;
- (BOOL)usesAlternativeAuthenticationIfAvailable;
- (BOOL)usesBiometricAuthenticationIfAvailable;
- (BOOL)usesSecondaryAuthenticationIfAvailable;
- (ICAccount)account;
- (ICAuthenticationPrompt)initWithIntent:(unint64_t)a3 object:(id)a4;
- (ICCloudSyncingObject)authenticationObject;
- (ICCloudSyncingObject)object;
- (ICNote)note;
- (NSArray)failureAlerts;
- (NSArray)notes;
- (NSArray)successAlerts;
- (NSArray)unauthenticatedNotes;
- (NSString)cloudAccountName;
- (NSString)customAccountName;
- (NSString)deviceAccountName;
- (NSString)fallbackButtonTitle;
- (NSString)reason;
- (NSString)title;
- (NSString)touchBarReason;
- (id)description;
- (int64_t)biometricAuthenticationType;
- (signed)secondaryAuthenticationMode;
- (unint64_t)authenticationAction;
- (unint64_t)authenticationMechanism;
- (unint64_t)hash;
- (unint64_t)intent;
- (void)setAuthenticationAction:(unint64_t)a3;
- (void)setAuthenticationMechanism:(unint64_t)a3;
- (void)setBiometricAuthenticationEnabled:(BOOL)a3;
- (void)setBiometricAuthenticationType:(int64_t)a3;
- (void)setFailureAlerts:(id)a3;
- (void)setFallbackButtonTitle:(id)a3;
- (void)setHasCloudAccount:(BOOL)a3;
- (void)setHasDevicePassword:(BOOL)a3;
- (void)setHasKeychainItem:(BOOL)a3;
- (void)setInternetReachable:(BOOL)a3;
- (void)setKeychainAvailable:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setReason:(id)a3;
- (void)setSecondaryAuthenticationMode:(signed __int16)a3;
- (void)setSuccessAlerts:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTouchBarReason:(id)a3;
- (void)setUpdatesUserRecordIfNeeded:(BOOL)a3;
- (void)setUsesAlternativeAuthenticationIfAvailable:(BOOL)a3;
- (void)setUsesBiometricAuthenticationIfAvailable:(BOOL)a3;
- (void)setUsesSecondaryAuthenticationIfAvailable:(BOOL)a3;
- (void)update;
- (void)updateStrings;
- (void)updateStringsForAddLock;
- (void)updateStringsForChangeMode;
- (void)updateStringsForChangeModeFrom;
- (void)updateStringsForChangeModeTo;
- (void)updateStringsForChangePassword;
- (void)updateStringsForDeleteMixedNotes;
- (void)updateStringsForDeleteMultipleNotes;
- (void)updateStringsForDeleteNotes;
- (void)updateStringsForDeleteSingleNote;
- (void)updateStringsForRemoveLock;
- (void)updateStringsForResetPassword;
- (void)updateStringsForToggleBiometrics;
- (void)updateStringsForViewAttachment;
- (void)updateStringsForViewNote;
@end

@implementation ICAuthenticationPrompt

- (NSString)customAccountName
{
  v3 = (void *)MEMORY[0x1E4F83278];
  v4 = [(ICAuthenticationPrompt *)self object];
  v5 = [v4 managedObjectContext];
  v6 = [v3 allActiveAccountsInContext:v5];
  if ((unint64_t)[v6 count] < 2)
  {
    v9 = 0;
  }
  else
  {
    v7 = [(ICAuthenticationPrompt *)self account];
    v8 = [v7 localizedName];
    v9 = objc_msgSend(v8, "ic_trimmedString");
  }
  return (NSString *)v9;
}

- (NSString)deviceAccountName
{
  return 0;
}

- (NSString)cloudAccountName
{
  v3 = [MEMORY[0x1E4F836D8] sharedInstance];
  v4 = [v3 accountStore];
  v5 = [(ICAuthenticationPrompt *)self account];
  v6 = [v5 identifier];
  v7 = [v4 accountWithIdentifier:v6];
  v8 = [v7 username];

  return (NSString *)v8;
}

- (void)updateStrings
{
  [(ICAuthenticationPrompt *)self setTitle:&stru_1F0973378];
  [(ICAuthenticationPrompt *)self setReason:0];
  [(ICAuthenticationPrompt *)self setFallbackButtonTitle:0];
  [(ICAuthenticationPrompt *)self setTouchBarReason:0];
  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 1
    || [(ICAuthenticationPrompt *)self authenticationMechanism] == 3)
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      v3 = [(ICAuthenticationPrompt *)self customAccountName];

      if (v3)
      {
        v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Try again or enter the notes password for your “%@” account." value:@"Try again or enter the notes password for your “%@” account." table:0 allowSiri:1];
        v5 = NSString;
        v6 = [(ICAuthenticationPrompt *)self customAccountName];
        v7 = objc_msgSend(v5, "localizedStringWithFormat:", v4, v6);
        [(ICAuthenticationPrompt *)self setReason:v7];

LABEL_11:
        goto LABEL_12;
      }
    }
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      v8 = (void *)MEMORY[0x1E4F83770];
      v9 = @"Try again or enter your notes password.";
LABEL_10:
      v4 = [v8 localizedFrameworkStringForKey:v9 value:v9 table:0 allowSiri:1];
      [(ICAuthenticationPrompt *)self setReason:v4];
      goto LABEL_11;
    }
    if ([(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication])
    {
      v8 = (void *)MEMORY[0x1E4F83770];
      v9 = @"Try again or enter the device passcode.";
      goto LABEL_10;
    }
  }
LABEL_12:
  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 1
    || [(ICAuthenticationPrompt *)self authenticationMechanism] == 2
    || [(ICAuthenticationPrompt *)self authenticationMechanism] == 3)
  {
    if ([(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
      v10 = @"Enter Passcode";
    }
    else {
      v10 = @"Enter Password";
    }
    v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v10 value:v10 table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setFallbackButtonTitle:v11];
  }
  switch([(ICAuthenticationPrompt *)self intent])
  {
    case 0uLL:
      [(ICAuthenticationPrompt *)self updateStringsForViewNote];
      break;
    case 1uLL:
      [(ICAuthenticationPrompt *)self updateStringsForViewAttachment];
      break;
    case 2uLL:
      [(ICAuthenticationPrompt *)self updateStringsForAddLock];
      break;
    case 3uLL:
      [(ICAuthenticationPrompt *)self updateStringsForRemoveLock];
      break;
    case 4uLL:
      [(ICAuthenticationPrompt *)self updateStringsForDeleteNotes];
      break;
    case 5uLL:
      [(ICAuthenticationPrompt *)self updateStringsForChangePassword];
      break;
    case 6uLL:
      [(ICAuthenticationPrompt *)self updateStringsForResetPassword];
      break;
    case 7uLL:
      [(ICAuthenticationPrompt *)self updateStringsForChangeMode];
      break;
    case 8uLL:
      [(ICAuthenticationPrompt *)self updateStringsForToggleBiometrics];
      break;
    default:
      return;
  }
}

- (void)updateStringsForViewNote
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"View Note" value:@"View Note" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 2)
  {
    if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
      || ([(ICAuthenticationPrompt *)self customAccountName],
          (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v5 = (void *)v4, BOOL v6 = [(ICAuthenticationPrompt *)self hasDivergedKey], v5, v6))
    {
      if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
      {
        v7 = (void *)MEMORY[0x1E4F83770];
        v8 = @"Use your fingerprint or enter your notes password to view this note.";
      }
      else
      {
        if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
          return;
        }
        v7 = (void *)MEMORY[0x1E4F83770];
        v8 = @"Use your fingerprint or enter the device passcode to view locked notes.";
      }
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F83770];
    v13 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to view this note.";
LABEL_22:
    id v17 = [v12 localizedFrameworkStringForKey:v13 value:v13 table:0 allowSiri:1];
    v14 = NSString;
    v15 = [(ICAuthenticationPrompt *)self customAccountName];
    v16 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v15);
    [(ICAuthenticationPrompt *)self setReason:v16];

    goto LABEL_16;
  }
  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
  {
    uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
    if (v9)
    {
      v10 = (void *)v9;
      BOOL v11 = [(ICAuthenticationPrompt *)self hasDivergedKey];

      if (!v11)
      {
        v12 = (void *)MEMORY[0x1E4F83770];
        v13 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_22;
      }
    }
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"Enter your locked notes password.";
  }
  else
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
      return;
    }
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"View this note.";
  }
LABEL_15:
  id v17 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setReason:v17];
LABEL_16:
}

- (void)updateStringsForViewAttachment
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"View Attachment" value:@"View Attachment" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
  {
    id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This attachment is locked using a previous password." value:@"This attachment is locked using a previous password." table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setReason:v4];
  }
}

- (void)updateStringsForAddLock
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Lock Note" value:@"Lock Note" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
    {
      v7 = [(ICAuthenticationPrompt *)self customAccountName];

      v5 = (void *)MEMORY[0x1E4F83770];
      if (v7)
      {
        BOOL v6 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_8;
      }
      BOOL v11 = @"Enter your locked notes password.";
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
        return;
      }
      v5 = (void *)MEMORY[0x1E4F83770];
      BOOL v11 = @"Lock this note.";
    }
LABEL_17:
    id v12 = [v5 localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setReason:v12];
    goto LABEL_18;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      v5 = (void *)MEMORY[0x1E4F83770];
      BOOL v11 = @"Use your fingerprint or enter your notes password to lock this note.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      v5 = (void *)MEMORY[0x1E4F83770];
      BOOL v11 = @"Use your fingerprint or enter the device passcode to lock this note.";
    }
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1E4F83770];
  BOOL v6 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to lock this note.";
LABEL_8:
  id v12 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  v8 = NSString;
  uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v12, v9);
  [(ICAuthenticationPrompt *)self setReason:v10];

LABEL_18:
}

- (void)updateStringsForRemoveLock
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Remove Lock" value:@"Remove Lock" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 2)
  {
    if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
      || ([(ICAuthenticationPrompt *)self customAccountName],
          (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v5 = (void *)v4, BOOL v6 = [(ICAuthenticationPrompt *)self hasDivergedKey], v5, v6))
    {
      if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
      {
        v7 = (void *)MEMORY[0x1E4F83770];
        v8 = @"Use your fingerprint or enter your notes password to remove the lock from this note.";
      }
      else
      {
        if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
          return;
        }
        v7 = (void *)MEMORY[0x1E4F83770];
        v8 = @"Use your fingerprint or enter the device passcode to remove the lock from this note.";
      }
      goto LABEL_15;
    }
    id v12 = (void *)MEMORY[0x1E4F83770];
    v13 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to remove the lock from this note.";
LABEL_22:
    id v17 = [v12 localizedFrameworkStringForKey:v13 value:v13 table:0 allowSiri:1];
    v14 = NSString;
    v15 = [(ICAuthenticationPrompt *)self customAccountName];
    v16 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v15);
    [(ICAuthenticationPrompt *)self setReason:v16];

    goto LABEL_16;
  }
  if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
  {
    uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
    if (v9)
    {
      v10 = (void *)v9;
      BOOL v11 = [(ICAuthenticationPrompt *)self hasDivergedKey];

      if (!v11)
      {
        id v12 = (void *)MEMORY[0x1E4F83770];
        v13 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_22;
      }
    }
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"Enter your locked notes password.";
  }
  else
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
      return;
    }
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"Remove the lock.";
  }
LABEL_15:
  id v17 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setReason:v17];
LABEL_16:
}

- (void)updateStringsForDeleteNotes
{
  v3 = [(ICAuthenticationPrompt *)self unauthenticatedNotes];
  if ([v3 count])
  {
    uint64_t v4 = [(ICAuthenticationPrompt *)self notes];
    unint64_t v5 = [v4 count];
    BOOL v6 = [(ICAuthenticationPrompt *)self unauthenticatedNotes];
    unint64_t v7 = [v6 count];

    if (v5 > v7)
    {
      [(ICAuthenticationPrompt *)self updateStringsForDeleteMixedNotes];
      return;
    }
  }
  else
  {
  }
  v8 = [(ICAuthenticationPrompt *)self unauthenticatedNotes];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    [(ICAuthenticationPrompt *)self updateStringsForDeleteSingleNote];
  }
  else
  {
    [(ICAuthenticationPrompt *)self updateStringsForDeleteMultipleNotes];
  }
}

- (void)updateStringsForDeleteMixedNotes
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Delete Notes" value:@"Delete Notes" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
    {
      unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v7)
      {
        BOOL v6 = @"One or more notes are locked. Enter the password you created for notes in your “%@” account.";
        goto LABEL_8;
      }
      id v12 = @"One or more notes are locked. Enter your locked notes password.";
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5)
      {
        if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 6) {
          return;
        }
        id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"One or more notes are locked. Enter the password for “%@” to delete these notes." value:@"One or more notes are locked. Enter the password for “%@” to delete these notes." table:0 allowSiri:1];
        v8 = NSString;
        uint64_t v9 = [(ICAuthenticationPrompt *)self cloudAccountName];
        goto LABEL_9;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Delete these notes.";
    }
LABEL_20:
    id v13 = [v5 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
    -[ICAuthenticationPrompt setReason:](self, "setReason:");
    goto LABEL_21;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"One or more notes are locked. Use your fingerprint or enter your password to delete these locked notes.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"One or more notes are locked. Use your fingerprint or enter the device passcode to delete these locked notes.";
    }
    goto LABEL_20;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  BOOL v6 = @"One or more notes are locked. Use your fingerprint or enter the password you created for notes in your “%@” account to delete these locked notes.";
LABEL_8:
  id v13 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  v8 = NSString;
  uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
LABEL_9:
  v10 = (void *)v9;
  BOOL v11 = objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
  [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_21:
}

- (void)updateStringsForDeleteSingleNote
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Delete Note" value:@"Delete Note" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
    {
      unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v7)
      {
        BOOL v6 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_8;
      }
      id v12 = @"Enter your locked notes password.";
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5)
      {
        if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 6) {
          return;
        }
        id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter the password for “%@” to delete this note." value:@"Enter the password for “%@” to delete this note." table:0 allowSiri:1];
        v8 = NSString;
        uint64_t v9 = [(ICAuthenticationPrompt *)self cloudAccountName];
        goto LABEL_9;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Delete this note.";
    }
LABEL_20:
    id v13 = [v5 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
    -[ICAuthenticationPrompt setReason:](self, "setReason:");
    goto LABEL_21;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter your password to delete this locked note.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter the device passcode to delete this locked note.";
    }
    goto LABEL_20;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  BOOL v6 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to delete this locked note.";
LABEL_8:
  id v13 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  v8 = NSString;
  uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
LABEL_9:
  v10 = (void *)v9;
  BOOL v11 = objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
  [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_21:
}

- (void)updateStringsForDeleteMultipleNotes
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Delete Notes" value:@"Delete Notes" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
    {
      unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v7)
      {
        BOOL v6 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_8;
      }
      id v12 = @"Enter your locked notes password.";
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5)
      {
        if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 6) {
          return;
        }
        id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter the password for “%@” to delete these notes." value:@"Enter the password for “%@” to delete these notes." table:0 allowSiri:1];
        v8 = NSString;
        uint64_t v9 = [(ICAuthenticationPrompt *)self cloudAccountName];
        goto LABEL_9;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Delete these notes.";
    }
LABEL_20:
    id v13 = [v5 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
    -[ICAuthenticationPrompt setReason:](self, "setReason:");
    goto LABEL_21;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter your password to delete these locked notes.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter the device passcode to delete these locked notes.";
    }
    goto LABEL_20;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  BOOL v6 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to delete these locked notes.";
LABEL_8:
  id v13 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  v8 = NSString;
  uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
LABEL_9:
  v10 = (void *)v9;
  BOOL v11 = objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
  [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_21:
}

- (void)updateStringsForChangePassword
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Change Notes Password" value:@"Change Notes Password" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 4) {
      return;
    }
    unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

    unint64_t v5 = (void *)MEMORY[0x1E4F83770];
    if (v7)
    {
      BOOL v6 = @"Enter the password you created for notes in your “%@” account.";
      goto LABEL_8;
    }
    BOOL v11 = @"Enter your locked notes password.";
LABEL_15:
    id v12 = [v5 localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setReason:v12];
    goto LABEL_16;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      BOOL v11 = @"Use your fingerprint or enter your notes password to change the password.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      BOOL v11 = @"Use your fingerprint or enter the device passcode to change the password.";
    }
    goto LABEL_15;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  BOOL v6 = @"Use your fingerprint or enter the password you created for notes in your “%@” account to change the password.";
LABEL_8:
  id v12 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  v8 = NSString;
  uint64_t v9 = [(ICAuthenticationPrompt *)self customAccountName];
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v12, v9);
  [(ICAuthenticationPrompt *)self setReason:v10];

LABEL_16:
}

- (void)updateStringsForResetPassword
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Reset Notes Password" value:@"Reset Notes Password" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 6) {
      return;
    }
    unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

    if (v7)
    {
      id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter the password for “%@” to reset the notes password for your “%@” account." value:@"Enter the password for “%@” to reset the notes password for your “%@” account." table:0 allowSiri:1];
      v8 = NSString;
      uint64_t v9 = [(ICAuthenticationPrompt *)self cloudAccountName];
      v10 = [(ICAuthenticationPrompt *)self customAccountName];
      BOOL v11 = objc_msgSend(v8, "localizedStringWithFormat:", v13, v9, v10);
      [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_11:
      goto LABEL_12;
    }
    id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter the password for “%@” to reset your notes password." value:@"Enter the password for “%@” to reset your notes password." table:0 allowSiri:1];
    unint64_t v5 = NSString;
    uint64_t v6 = [(ICAuthenticationPrompt *)self cloudAccountName];
LABEL_10:
    uint64_t v9 = (void *)v6;
    id v12 = objc_msgSend(v5, "localizedStringWithFormat:", v13, v6);
    [(ICAuthenticationPrompt *)self setReason:v12];

    goto LABEL_11;
  }
  uint64_t v4 = [(ICAuthenticationPrompt *)self customAccountName];

  if (v4)
  {
    id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Reset the notes password for your “%@” account." value:@"Reset the notes password for your “%@” account." table:0 allowSiri:1];
    unint64_t v5 = NSString;
    uint64_t v6 = [(ICAuthenticationPrompt *)self customAccountName];
    goto LABEL_10;
  }
  id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Reset your notes password." value:@"Reset your notes password." table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setReason:v13];
LABEL_12:
}

- (void)updateStringsForChangeMode
{
  if ([(ICAuthenticationPrompt *)self usesSecondaryAuthenticationIfAvailable]
    || [(ICAuthenticationPrompt *)self forcesSecondaryAuthentication])
  {
    [(ICAuthenticationPrompt *)self updateStringsForChangeModeTo];
  }
  else
  {
    [(ICAuthenticationPrompt *)self updateStringsForChangeModeFrom];
  }
}

- (void)updateStringsForChangeModeFrom
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Current Notes Password" value:@"Current Notes Password" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 4) {
      return;
    }
    v8 = [(ICAuthenticationPrompt *)self customAccountName];

    uint64_t v6 = (void *)MEMORY[0x1E4F83770];
    if (v8)
    {
      unint64_t v7 = @"Enter the password you created for notes in your “%@” account.";
      goto LABEL_8;
    }
    id v13 = @"Enter your locked notes password.";
LABEL_15:
    id v14 = [v6 localizedFrameworkStringForKey:v13 value:v13 table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setReason:v14];
    goto LABEL_16;
  }
  if (![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    || ([(ICAuthenticationPrompt *)self customAccountName],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Current Notes Password" value:@"Current Notes Password" table:0 allowSiri:1];
      [(ICAuthenticationPrompt *)self setTitle:v12];

      uint64_t v6 = (void *)MEMORY[0x1E4F83770];
      id v13 = @"Use your fingerprint or enter your notes password.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      uint64_t v6 = (void *)MEMORY[0x1E4F83770];
      id v13 = @"Use your fingerprint or enter the device passcode.";
    }
    goto LABEL_15;
  }
  unint64_t v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Current Notes Password" value:@"Current Notes Password" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v5];

  uint64_t v6 = (void *)MEMORY[0x1E4F83770];
  unint64_t v7 = @"Use your fingerprint or enter the password you created for notes in your “%@” account.";
LABEL_8:
  id v14 = [v6 localizedFrameworkStringForKey:v7 value:v7 table:0 allowSiri:1];
  uint64_t v9 = NSString;
  v10 = [(ICAuthenticationPrompt *)self customAccountName];
  BOOL v11 = objc_msgSend(v9, "localizedStringWithFormat:", v14, v10);
  [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_16:
}

- (void)updateStringsForChangeModeTo
{
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Change Method" value:@"Change Method" table:0 allowSiri:1];
  [(ICAuthenticationPrompt *)self setTitle:v3];

  if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 2)
  {
    if ([(ICAuthenticationPrompt *)self authenticationMechanism] == 4)
    {
      unint64_t v7 = [(ICAuthenticationPrompt *)self customAccountName];

      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v7)
      {
        uint64_t v6 = @"Enter the password you created for notes in your “%@” account.";
        goto LABEL_10;
      }
      id v12 = @"Enter your locked notes password.";
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
        return;
      }
      v8 = [(ICAuthenticationPrompt *)self customAccountName];

      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v8)
      {
        uint64_t v6 = @"Lock “%@” notes with passcode.";
        goto LABEL_10;
      }
      id v12 = @"Lock notes with passcode.";
    }
LABEL_18:
    id v13 = [v5 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setReason:v13];
    goto LABEL_19;
  }
  uint64_t v4 = [(ICAuthenticationPrompt *)self customAccountName];

  if (!v4)
  {
    if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter your notes password.";
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
        return;
      }
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      id v12 = @"Use your fingerprint or enter the device passcode.";
    }
    goto LABEL_18;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  uint64_t v6 = @"Use your fingerprint or enter the password you created for notes in your “%@” account.";
LABEL_10:
  id v13 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  uint64_t v9 = NSString;
  v10 = [(ICAuthenticationPrompt *)self customAccountName];
  BOOL v11 = objc_msgSend(v9, "localizedStringWithFormat:", v13, v10);
  [(ICAuthenticationPrompt *)self setReason:v11];

LABEL_19:
}

- (void)updateStringsForToggleBiometrics
{
  if ([MEMORY[0x1E4F833F0] biometricsType] == 4)
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Optic ID for “Notes”" value:@"Optic ID for “Notes”" table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setTitle:v3];

    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 4)
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
        return;
      }
      BOOL v4 = [(ICAuthenticationPrompt *)self isBiometricAuthenticationEnabled];
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v4)
      {
        uint64_t v6 = @"Turn off Optic ID for locked notes.";
LABEL_11:
        id v18 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
        [(ICAuthenticationPrompt *)self setReason:v18];
        uint64_t v9 = self;
        uint64_t v10 = (uint64_t)v18;
LABEL_26:
        [(ICAuthenticationPrompt *)v9 setReason:v10];
        goto LABEL_27;
      }
      v16 = @"Turn on Optic ID for locked notes.";
      goto LABEL_25;
    }
  }
  else if ([MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    unint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Face ID for “Notes”" value:@"Face ID for “Notes”" table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setTitle:v7];

    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 4)
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
        return;
      }
      BOOL v8 = [(ICAuthenticationPrompt *)self isBiometricAuthenticationEnabled];
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v8)
      {
        uint64_t v6 = @"Turn off Face ID for locked notes.";
        goto LABEL_11;
      }
      v16 = @"Turn on Face ID for locked notes.";
LABEL_25:
      uint64_t v10 = [v5 localizedFrameworkStringForKey:v16 value:v16 table:0 allowSiri:1];
      id v18 = (id)v10;
      uint64_t v9 = self;
      goto LABEL_26;
    }
  }
  else
  {
    if ([MEMORY[0x1E4F833F0] biometricsType] != 1)
    {
      id v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Change Biometrics Status" value:@"Change Biometrics Status" table:0 allowSiri:1];
      [(ICAuthenticationPrompt *)self setTitle:v18];
      goto LABEL_27;
    }
    BOOL v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Touch ID for “Notes”" value:@"Touch ID for “Notes”" table:0 allowSiri:1];
    [(ICAuthenticationPrompt *)self setTitle:v11];

    if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 4)
    {
      if ([(ICAuthenticationPrompt *)self authenticationMechanism] != 5) {
        return;
      }
      BOOL v17 = [(ICAuthenticationPrompt *)self isBiometricAuthenticationEnabled];
      unint64_t v5 = (void *)MEMORY[0x1E4F83770];
      if (v17) {
        v16 = @"Turn off Touch ID for locked notes.";
      }
      else {
        v16 = @"Turn on Touch ID for locked notes.";
      }
      goto LABEL_25;
    }
  }
  id v12 = [(ICAuthenticationPrompt *)self customAccountName];

  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  if (!v12)
  {
    v16 = @"Enter your locked notes password.";
    goto LABEL_25;
  }
  id v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter the password you created for notes in your “%@” account." value:@"Enter the password you created for notes in your “%@” account." table:0 allowSiri:1];
  id v13 = NSString;
  id v14 = [(ICAuthenticationPrompt *)self customAccountName];
  v15 = objc_msgSend(v13, "localizedStringWithFormat:", v18, v14);
  [(ICAuthenticationPrompt *)self setReason:v15];

LABEL_27:
}

- (ICAuthenticationPrompt)initWithIntent:(unint64_t)a3 object:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ICAuthenticationPrompt;
  BOOL v8 = [(ICAuthenticationPrompt *)&v29 init];
  if (v8)
  {
    objc_opt_class();
    uint64_t v9 = ICDynamicCast();
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 cloudAccount];
    }
    id v12 = v11;

    objc_opt_class();
    id v13 = ICDynamicCast();
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      objc_opt_class();
      v16 = ICDynamicCast();
      id v15 = [v16 note];
    }
    [MEMORY[0x1E4F833F0] refreshBiometricsContext];
    [MEMORY[0x1E4F833F0] refreshHasPasscode];
    v8->_intent = a3;
    objc_storeStrong((id *)&v8->_object, a4);
    objc_storeStrong((id *)&v8->_account, v12);
    objc_storeStrong((id *)&v8->_note, v15);
    if (v15)
    {
      v30[0] = v15;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      notes = v8->_notes;
      v8->_notes = (NSArray *)v17;
    }
    else
    {
      notes = v8->_notes;
      v8->_notes = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    *(_WORD *)&v8->_usesBiometricAuthenticationIfAvailable = 257;
    v8->_internetReachable = [MEMORY[0x1E4F837F8] isInternetReachable];
    v19 = [MEMORY[0x1E4F832F8] sharedState];
    if ([v19 biometricsEnabledForAccount:v12])
    {
      v20 = [MEMORY[0x1E4F832F8] sharedState];
      if ([v20 checkSupportsBiometrics]) {
        char v21 = [MEMORY[0x1E4F833F0] biometricsLockedOut] ^ 1;
      }
      else {
        char v21 = 0;
      }
      v8->_biometricAuthenticationEnabled = v21;
    }
    else
    {
      v8->_biometricAuthenticationEnabled = 0;
    }

    v8->_biometricAuthenticationType = [MEMORY[0x1E4F833F0] biometricsType];
    v8->_keychainAvailable = [MEMORY[0x1E4F833C0] isSyncAvailableForAccount:v12];
    v22 = [MEMORY[0x1E4F832F8] sharedState];
    v23 = [(ICAuthenticationPrompt *)v8 authenticationObject];
    v24 = [v22 mainKeyFromKeychainForObject:v23];
    v8->_hasKeychainItem = v24 != 0;

    v25 = [MEMORY[0x1E4F836D8] sharedInstance];
    v26 = [v25 accountStore];
    v27 = objc_msgSend(v26, "aa_primaryAppleAccount");
    v8->_hasCloudAccount = v27 != 0;

    v8->_hasDevicePassword = [MEMORY[0x1E4F833F0] hasPasscode];
    v8->_authenticationAction = 1;
    if (!v8->_account) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"_account" functionName:"-[ICAuthenticationPrompt initWithIntent:object:]" simulateCrash:1 showAlert:0 format:@"Nil authentication prompt account"];
    }
  }
  return v8;
}

- (id)description
{
  v22 = NSString;
  v3 = (objc_class *)objc_opt_class();
  char v21 = NSStringFromClass(v3);
  v32 = NSStringFromAuthenticationIntent([(ICAuthenticationPrompt *)self intent]);
  v30 = NSStringFromAuthenticationAction([(ICAuthenticationPrompt *)self authenticationAction]);
  v31 = NSStringFromAuthenticationMechanism([(ICAuthenticationPrompt *)self authenticationMechanism]);
  v26 = [(ICAuthenticationPrompt *)self account];
  v28 = [v26 shortLoggingDescription];
  v25 = [(ICAuthenticationPrompt *)self account];
  v24 = [v25 accountData];
  [v24 lockedNotesMode];
  objc_super v29 = NSStringFromAccountDataLockedNotesMode();
  BOOL v4 = NSNumber;
  v20 = [(ICAuthenticationPrompt *)self account];
  v19 = [v20 accountData];
  v27 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v19, "supportsV1Neo"));
  id v18 = [(ICAuthenticationPrompt *)self object];
  v16 = [v18 shortLoggingDescription];
  unint64_t v5 = (void *)MEMORY[0x1E4F83348];
  uint64_t v17 = [(ICAuthenticationPrompt *)self object];
  [v5 cipherVersionForObject:v17];
  id v15 = ICCipherNameForCipherVersion();
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt isInternetReachable](self, "isInternetReachable"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled"));
  id v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt isKeychainAvailable](self, "isKeychainAvailable"));
  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt hasKeychainItem](self, "hasKeychainItem"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt hasCloudAccount](self, "hasCloudAccount"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt hasDevicePassword](self, "hasDevicePassword"));
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey"));
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationPrompt needsUserRecordUpdate](self, "needsUserRecordUpdate"));
  objc_msgSend(v22, "stringWithFormat:", @"<%@: %p, intent: %@, action: %@, mechanism: %@, account: %@, account.lockedNotesMode: %@, account.supportsV1Neo: %@, object: %@, object.cipherVersion: %@, isInternetReachable: %@, isBiometricAuthenticationEnabled: %@, isKeychainAvailable: %@, hasKeychainItem: %@, hasCloudAccount: %@, hasDevicePassword: %@, hasDivergedKey: %@, needsUserRecordUpdate: %@>", v21, self, v32, v30, v31, v28, v29, v27, v16, v15, v6, v7, v14, v8, v9, v10,
    v11,
  v23 = v12);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 intent];
  if (v6 == [(ICAuthenticationPrompt *)self intent])
  {
    id v7 = [v5 object];
    BOOL v8 = [(ICAuthenticationPrompt *)self object];
    if (v7 == v8)
    {
      uint64_t v10 = [v5 notes];
      id v11 = [(ICAuthenticationPrompt *)self notes];
      if ([v10 isEqualToArray:v11])
      {
        id v12 = [v5 unauthenticatedNotes];
        id v13 = [(ICAuthenticationPrompt *)self unauthenticatedNotes];
        if ([v12 isEqualToArray:v13])
        {
          int v14 = [v5 secondaryAuthenticationMode];
          BOOL v9 = v14 == [(ICAuthenticationPrompt *)self secondaryAuthenticationMode];
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = [(ICAuthenticationPrompt *)self intent];
  v3 = [(ICAuthenticationPrompt *)self object];
  char v4 = [v3 hash];
  id v5 = [(ICAuthenticationPrompt *)self notes];
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v7 hash];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v8 = ICHashWithObject(*(void **)(*((void *)&v33 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  id v14 = [(ICAuthenticationPrompt *)self unauthenticatedNotes];
  id v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  uint64_t v17 = [v16 hash];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v17 = ICHashWithObject(*(void **)(*((void *)&v33 + 1) + 8 * j)) - v17 + 32 * v17;
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  [(ICAuthenticationPrompt *)self secondaryAuthenticationMode];
  unint64_t v30 = ICHashWithHashKeys(v32, v23, v24, v25, v26, v27, v28, v29, v4);

  return v30;
}

+ (id)promptForIntent:(unint64_t)a3 object:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[ICAuthenticationPrompt alloc] initWithIntent:a3 object:v5];

  [(ICAuthenticationPrompt *)v6 update];
  return v6;
}

+ (id)promptForDeletingNotes:(id)a3
{
  id v3 = a3;
  char v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_93);
  uint64_t v6 = [v4 setWithArray:v5];

  id v7 = [v6 allObjects];
  uint64_t v8 = [v7 firstObject];

  if ([v6 count] != 1)
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ICAuthenticationPrompt promptForDeletingNotes:](v9);
    }
  }
  uint64_t v10 = objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_34_0);

  uint64_t v11 = [[ICAuthenticationPrompt alloc] initWithIntent:4 object:v8];
  [(ICAuthenticationPrompt *)v11 setNotes:v10];
  [(ICAuthenticationPrompt *)v11 update];

  return v11;
}

uint64_t __49__ICAuthenticationPrompt_promptForDeletingNotes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 account];
}

uint64_t __49__ICAuthenticationPrompt_promptForDeletingNotes___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 isDeletedOrInTrash] ^ 1;
}

+ (id)promptForChangingMode:(signed __int16)a3 account:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  uint64_t v6 = [[ICAuthenticationPrompt alloc] initWithIntent:7 object:v5];

  [(ICAuthenticationPrompt *)v6 setSecondaryAuthenticationMode:v4];
  [(ICAuthenticationPrompt *)v6 update];
  return v6;
}

- (void)setUsesSecondaryAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesSecondaryAuthenticationIfAvailable = a3;
  [(ICAuthenticationPrompt *)self update];
}

- (void)setUsesBiometricAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesBiometricAuthenticationIfAvailable = a3;
  [(ICAuthenticationPrompt *)self update];
}

- (void)setUsesAlternativeAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesAlternativeAuthenticationIfAvailable = a3;
  [(ICAuthenticationPrompt *)self update];
}

- (void)setUpdatesUserRecordIfNeeded:(BOOL)a3
{
  self->_updatesUserRecordIfNeeded = a3;
  [(ICAuthenticationPrompt *)self update];
}

- (NSArray)unauthenticatedNotes
{
  v2 = [(ICAuthenticationPrompt *)self notes];
  id v3 = objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_36);

  return (NSArray *)v3;
}

uint64_t __46__ICAuthenticationPrompt_unauthenticatedNotes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPasswordProtectedAndLocked];
}

- (ICCloudSyncingObject)authenticationObject
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x1F4) != 0) {
      [(ICAuthenticationPrompt *)self account];
    }
    else {
    unint64_t v3 = [(ICAuthenticationPrompt *)self object];
    }
  }
  return (ICCloudSyncingObject *)(id)v3;
}

- (BOOL)allowsAuthentication
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  LOBYTE(v4) = 1;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0xB) != 0)
    {
      uint64_t v6 = [(ICAuthenticationPrompt *)self object];
      if ([v6 isPasswordProtected])
      {
        uint64_t v8 = [(ICAuthenticationPrompt *)self object];
        id v9 = [v8 primaryEncryptedData];
        if (!v9)
        {
          uint64_t v10 = [(ICAuthenticationPrompt *)self object];
          uint64_t v11 = [v10 cryptoWrappedKey];
          LOBYTE(v4) = v11 != 0;
        }
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    if (((1 << v3) & 0x60) != 0)
    {
      id v5 = (void *)MEMORY[0x1E4F83348];
      uint64_t v6 = [(ICAuthenticationPrompt *)self authenticationObject];
      if ([v5 shouldAuthenticateWithCustomPasswordForObject:v6])
      {
        id v7 = [(ICAuthenticationPrompt *)self account];
        LOBYTE(v4) = [v7 hasPassphraseSet];

LABEL_13:
        return v4;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      goto LABEL_13;
    }
    if (v3 == 2)
    {
      uint64_t v6 = [(ICAuthenticationPrompt *)self object];
      int v4 = [v6 isPasswordProtected] ^ 1;
      goto LABEL_13;
    }
  }
  return v4;
}

- (BOOL)needsAuthentication
{
  v2 = self;
  switch([(ICAuthenticationPrompt *)self intent])
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      unint64_t v3 = [(ICAuthenticationPrompt *)v2 authenticationObject];
      if (![v3 isPasswordProtected]) {
        goto LABEL_6;
      }
      int v4 = [(ICAuthenticationPrompt *)v2 authenticationObject];
      LODWORD(v2) = [v4 isAuthenticated] ^ 1;

      goto LABEL_10;
    case 2uLL:
      unint64_t v3 = [(ICAuthenticationPrompt *)v2 authenticationObject];
      LODWORD(v2) = [v3 isAuthenticated] ^ 1;
      goto LABEL_10;
    case 4uLL:
      unint64_t v3 = [(ICAuthenticationPrompt *)v2 unauthenticatedNotes];
      LOBYTE(v2) = [v3 count] != 0;
      goto LABEL_10;
    case 5uLL:
    case 6uLL:
      unint64_t v3 = [(ICAuthenticationPrompt *)v2 authenticationObject];
      if ([v3 hasPassphraseSet]) {
        LOBYTE(v2) = [(ICAuthenticationPrompt *)v2 allowsCustomPasswordAuthentication];
      }
      else {
LABEL_6:
      }
        LOBYTE(v2) = 0;
LABEL_10:

      break;
    default:
      LOBYTE(v2) = 1;
      break;
  }
  return (char)v2;
}

- (BOOL)needsSecondaryAuthentication
{
  if ([(ICAuthenticationPrompt *)self intent] != 7) {
    return 0;
  }
  unint64_t v3 = [(ICAuthenticationPrompt *)self account];
  int v4 = [v3 resolvedLockedNotesMode];
  if (v4 == [(ICAuthenticationPrompt *)self secondaryAuthenticationMode])
  {
    char v5 = 0;
  }
  else if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
  {
    uint64_t v6 = [(ICAuthenticationPrompt *)self authenticationObject];
    char v5 = [v6 hasPassphraseSet];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)forcesSecondaryAuthentication
{
  if ([(ICAuthenticationPrompt *)self intent] == 7)
  {
    unint64_t v3 = [(ICAuthenticationPrompt *)self account];
    int v4 = [v3 resolvedLockedNotesMode];
    if (v4 == [(ICAuthenticationPrompt *)self secondaryAuthenticationMode]
      || ![(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      char v5 = [(ICAuthenticationPrompt *)self authenticationObject];
      int v6 = [v5 hasPassphraseSet] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)needsKeychain
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 == 7)
  {
    if ([(ICAuthenticationPrompt *)self secondaryAuthenticationMode] == 2) {
      goto LABEL_4;
    }
    return 0;
  }
  if (v3 != 2
    || ![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication])
  {
    return 0;
  }
LABEL_4:
  return [(ICAuthenticationPrompt *)self hasCloudAccount];
}

- (BOOL)needsCloudAccount
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 == 7) {
    return [(ICAuthenticationPrompt *)self secondaryAuthenticationMode] == 2;
  }
  if (v3 != 2) {
    return 0;
  }
  return [(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication];
}

- (BOOL)needsDevicePassword
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 == 7) {
    return [(ICAuthenticationPrompt *)self secondaryAuthenticationMode] == 2;
  }
  if (v3 != 2) {
    return 0;
  }
  return [(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication];
}

- (BOOL)allowsAlternativeAuthentication
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 - 5 < 2) {
    return 1;
  }
  if (v3 != 4) {
    return 0;
  }
  char v5 = [(ICAuthenticationPrompt *)self account];
  BOOL v4 = [v5 accountType] != 3
    || [(ICAuthenticationPrompt *)self hasDevicePassword];

  return v4;
}

- (BOOL)forcesAlternativeAuthentication
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 == 6)
  {
    LOBYTE(v5) = 1;
  }
  else if (v3 == 4 {
         && [(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
  }
  {
    BOOL v4 = [(ICAuthenticationPrompt *)self authenticationObject];
    int v5 = [v4 hasPassphraseSet] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)allowsCustomPasswordAuthentication
{
  BOOL v3 = [(ICAuthenticationPrompt *)self allowsAuthentication];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F83348];
    int v5 = [(ICAuthenticationPrompt *)self authenticationObject];
    LOBYTE(v4) = [v4 shouldAuthenticateWithCustomPasswordForObject:v5];

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)allowsDevicePasswordAuthentication
{
  BOOL v3 = [(ICAuthenticationPrompt *)self allowsAuthentication];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F83348];
    int v5 = [(ICAuthenticationPrompt *)self authenticationObject];
    LOBYTE(v4) = [v4 shouldAuthenticateWithDevicePasswordForObject:v5];

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)allowsBiometricAuthentication
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self intent];
  if (v3 > 7 || ((1 << v3) & 0xBD) == 0) {
    return 0;
  }
  if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
  {
    if ([(ICAuthenticationPrompt *)self isBiometricAuthenticationEnabled]
      && [(ICAuthenticationPrompt *)self hasPassphrase])
    {
      return [(ICAuthenticationPrompt *)self hasKeychainItem];
    }
    return 0;
  }
  if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication]) {
    return 0;
  }
  return [(ICAuthenticationPrompt *)self isBiometricAuthenticationEnabled];
}

- (BOOL)forcesBiometricAuthentication
{
  return [(ICAuthenticationPrompt *)self intent] == 5;
}

- (BOOL)hasPassphrase
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self authenticationObject];
  if ([v3 hasPassphraseSet])
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(ICAuthenticationPrompt *)self account];
    char v4 = [v5 hasPassphraseSet];
  }
  return v4;
}

- (BOOL)hasDivergedKey
{
  unint64_t v3 = [(ICAuthenticationPrompt *)self account];
  char v4 = [v3 cryptoStrategy];
  int v5 = [(ICAuthenticationPrompt *)self object];
  char v6 = [v4 hasSameKeyAsObject:v5] ^ 1;

  return v6;
}

- (BOOL)unlocksNotes
{
  return (([(ICAuthenticationPrompt *)self intent] - 6) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)needsUserRecordUpdate
{
  if ([(ICAuthenticationPrompt *)self isInternetReachable])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F83348];
    char v4 = [(ICAuthenticationPrompt *)self authenticationObject];
    uint64_t v5 = [v3 cipherVersionForObject:v4];

    char v6 = [(ICAuthenticationPrompt *)self account];
    LODWORD(v4) = [v6 accountType];

    LOBYTE(v6) = 0;
    if (v4 == 1 && !v5)
    {
      unint64_t v7 = [(ICAuthenticationPrompt *)self intent];
      LOBYTE(v6) = 1;
      if (v7 <= 8 && ((1 << v7) & 0x11B) != 0)
      {
        uint64_t v8 = [(ICAuthenticationPrompt *)self account];
        LODWORD(v6) = [v8 hasPassphraseSet] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (void)update
{
  [MEMORY[0x1E4F833F0] refreshBiometricsContext];
  [MEMORY[0x1E4F833F0] refreshHasPasscode];
  [MEMORY[0x1E4F833F0] checkBiometricsPolicyState];
  [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
  [(ICAuthenticationPrompt *)self setAuthenticationMechanism:0];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(ICAuthenticationPrompt *)self setSuccessAlerts:MEMORY[0x1E4F1CBF0]];
  [(ICAuthenticationPrompt *)self setFailureAlerts:v3];
  if ([(ICAuthenticationPrompt *)self needsAuthentication]
    && [(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
    && ![(ICAuthenticationPrompt *)self hasPassphrase]
    && ![(ICAuthenticationPrompt *)self allowsAlternativeAuthentication]
    && ![(ICAuthenticationPrompt *)self forcesSecondaryAuthentication])
  {
    goto LABEL_18;
  }
  if ([(ICAuthenticationPrompt *)self allowsAuthentication])
  {
    if ([(ICAuthenticationPrompt *)self needsDevicePassword]
      && ![(ICAuthenticationPrompt *)self hasDevicePassword])
    {
      [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
      char v6 = [(ICAuthenticationPrompt *)self failureAlerts];
      uint64_t v7 = +[ICAuthenticationAlert setDevicePasswordActionAlert];
    }
    else
    {
      if (![(ICAuthenticationPrompt *)self needsAuthentication])
      {
        char v4 = self;
        uint64_t v5 = 0;
        goto LABEL_24;
      }
      if ([(ICAuthenticationPrompt *)self needsCloudAccount]
        && ![(ICAuthenticationPrompt *)self hasCloudAccount])
      {
        [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
        char v6 = [(ICAuthenticationPrompt *)self failureAlerts];
        id v18 = [(ICAuthenticationPrompt *)self account];
        uint64_t v19 = +[ICAuthenticationAlert signIntoCloudAccountActionAlertWithAccount:v18];
        uint64_t v20 = [v6 arrayByAddingObject:v19];
        [(ICAuthenticationPrompt *)self setFailureAlerts:v20];

        goto LABEL_22;
      }
      if ([(ICAuthenticationPrompt *)self needsKeychain]
        && ![(ICAuthenticationPrompt *)self isKeychainAvailable])
      {
        [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
        char v6 = [(ICAuthenticationPrompt *)self failureAlerts];
      }
      else
      {
        if ([(ICAuthenticationPrompt *)self usesSecondaryAuthenticationIfAvailable]&& [(ICAuthenticationPrompt *)self needsSecondaryAuthentication]|| [(ICAuthenticationPrompt *)self forcesSecondaryAuthentication])
        {
          if ([(ICAuthenticationPrompt *)self secondaryAuthenticationMode] == 1)
          {
LABEL_18:
            char v4 = self;
            uint64_t v5 = 3;
LABEL_24:
            [(ICAuthenticationPrompt *)v4 setAuthenticationAction:v5];
            goto LABEL_25;
          }
          if ([(ICAuthenticationPrompt *)self secondaryAuthenticationMode] == 2)
          {
            [(ICAuthenticationPrompt *)self setAuthenticationAction:2];
            goto LABEL_55;
          }
          uint64_t v29 = (void *)MEMORY[0x1E4F836F8];
          unint64_t v30 = @"Invalid secondary authentication mode while attempting secondary authentication";
LABEL_63:
          [v29 handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICAuthenticationPrompt update]" simulateCrash:1 showAlert:0 format:v30];
          goto LABEL_25;
        }
        if ([(ICAuthenticationPrompt *)self usesAlternativeAuthenticationIfAvailable]&& [(ICAuthenticationPrompt *)self allowsAlternativeAuthentication]|| [(ICAuthenticationPrompt *)self forcesAlternativeAuthentication])
        {
          [(ICAuthenticationPrompt *)self setAuthenticationAction:2];
          if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
          {
            uint64_t v21 = [(ICAuthenticationPrompt *)self account];
            int v22 = [v21 accountType];

            if (v22 == 3)
            {
LABEL_55:
              uint64_t v23 = self;
              uint64_t v24 = 5;
LABEL_74:
              [(ICAuthenticationPrompt *)v23 setAuthenticationMechanism:v24];
              goto LABEL_25;
            }
          }
          else if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication])
          {
            uint64_t v23 = self;
            uint64_t v24 = 0;
            goto LABEL_74;
          }
          uint64_t v23 = self;
          uint64_t v24 = 6;
          goto LABEL_74;
        }
        [(ICAuthenticationPrompt *)self setAuthenticationAction:2];
        if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication])
        {
          uint64_t v23 = self;
          uint64_t v24 = 4;
          goto LABEL_74;
        }
        if (![(ICAuthenticationPrompt *)self allowsDevicePasswordAuthentication])
        {
          uint64_t v29 = (void *)MEMORY[0x1E4F836F8];
          unint64_t v30 = @"Neither custom nor device authentication allowed while attempting primary authentication";
          goto LABEL_63;
        }
        [(ICAuthenticationPrompt *)self setAuthenticationMechanism:5];
        if ([(ICAuthenticationPrompt *)self intent]) {
          goto LABEL_25;
        }
        v31 = [(ICAuthenticationPrompt *)self authenticationObject];
        char v32 = [v31 canAuthenticate];

        if (v32)
        {
          if ([(ICAuthenticationPrompt *)self hasDevicePassword]) {
            goto LABEL_25;
          }
          char v6 = [(ICAuthenticationPrompt *)self successAlerts];
          uint64_t v8 = +[ICAuthenticationAlert setDevicePasswordInfoAlert];
          id v9 = [v6 arrayByAddingObject:v8];
          [(ICAuthenticationPrompt *)self setSuccessAlerts:v9];
          goto LABEL_21;
        }
        [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
        [(ICAuthenticationPrompt *)self setAuthenticationMechanism:0];
        BOOL v33 = [(ICAuthenticationPrompt *)self isKeychainAvailable];
        char v6 = [(ICAuthenticationPrompt *)self failureAlerts];
        if (v33)
        {
          uint64_t v7 = +[ICAuthenticationAlert keychainItemMissingInfoAlert];
          goto LABEL_20;
        }
      }
      uint64_t v7 = +[ICAuthenticationAlert enableKeychainActionAlert];
    }
  }
  else
  {
    [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
    char v6 = [(ICAuthenticationPrompt *)self failureAlerts];
    uint64_t v7 = +[ICAuthenticationAlert cannotUnlockInfoAlert];
  }
LABEL_20:
  uint64_t v8 = (void *)v7;
  id v9 = [v6 arrayByAddingObject:v7];
  [(ICAuthenticationPrompt *)self setFailureAlerts:v9];
LABEL_21:

LABEL_22:
LABEL_25:
  if ([(ICAuthenticationPrompt *)self usesBiometricAuthenticationIfAvailable]
    && [(ICAuthenticationPrompt *)self allowsBiometricAuthentication]
    && [(ICAuthenticationPrompt *)self authenticationAction] == 2)
  {
    if ([(ICAuthenticationPrompt *)self biometricAuthenticationType] == 4)
    {
      uint64_t v10 = 3;
    }
    else if ([(ICAuthenticationPrompt *)self biometricAuthenticationType] == 2)
    {
      uint64_t v10 = 1;
    }
    else
    {
      if ([(ICAuthenticationPrompt *)self biometricAuthenticationType] != 1)
      {
LABEL_59:
        if ([(ICAuthenticationPrompt *)self allowsCustomPasswordAuthentication]
          && ![(ICAuthenticationPrompt *)self intent])
        {
          uint64_t v25 = [(ICAuthenticationPrompt *)self account];
          uint64_t v26 = +[ICAuthenticationAlert rememberCustomPasswordInfoAlertWithAccount:v25];

          uint64_t v27 = [(ICAuthenticationPrompt *)self successAlerts];
          uint64_t v28 = [v27 arrayByAddingObject:v26];
          [(ICAuthenticationPrompt *)self setSuccessAlerts:v28];
        }
        goto LABEL_32;
      }
      uint64_t v10 = 2;
    }
    [(ICAuthenticationPrompt *)self setAuthenticationMechanism:v10];
    goto LABEL_59;
  }
  if ([(ICAuthenticationPrompt *)self forcesBiometricAuthentication]) {
    [(ICAuthenticationPrompt *)self setAuthenticationAction:1];
  }
LABEL_32:
  if ([(ICAuthenticationPrompt *)self intent] == 2 || [(ICAuthenticationPrompt *)self intent] == 7)
  {
    if (![(ICAuthenticationPrompt *)self allowsBiometricAuthentication]
      && [MEMORY[0x1E4F833F0] biometricsAvailable])
    {
      uint64_t v11 = [(ICAuthenticationPrompt *)self account];
      uint64_t v12 = +[ICAuthenticationAlert enableBiometricsActionAlertWithAccount:v11];

      id v13 = [(ICAuthenticationPrompt *)self successAlerts];
      id v14 = [v13 arrayByAddingObject:v12];
      [(ICAuthenticationPrompt *)self setSuccessAlerts:v14];
    }
    id v15 = [(ICAuthenticationPrompt *)self successAlerts];
    v16 = +[ICAuthenticationAlert aboutLockedNotesInfoAlert];
    uint64_t v17 = [v15 arrayByAddingObject:v16];
    [(ICAuthenticationPrompt *)self setSuccessAlerts:v17];
  }
  [(ICAuthenticationPrompt *)self updateStrings];
}

- (unint64_t)intent
{
  return self->_intent;
}

- (signed)secondaryAuthenticationMode
{
  return self->_secondaryAuthenticationMode;
}

- (void)setSecondaryAuthenticationMode:(signed __int16)a3
{
  self->_secondaryAuthenticationMode = a3;
}

- (ICCloudSyncingObject)object
{
  return self->_object;
}

- (ICAccount)account
{
  return self->_account;
}

- (ICNote)note
{
  return self->_note;
}

- (BOOL)usesSecondaryAuthenticationIfAvailable
{
  return self->_usesSecondaryAuthenticationIfAvailable;
}

- (BOOL)usesAlternativeAuthenticationIfAvailable
{
  return self->_usesAlternativeAuthenticationIfAvailable;
}

- (BOOL)usesBiometricAuthenticationIfAvailable
{
  return self->_usesBiometricAuthenticationIfAvailable;
}

- (BOOL)updatesUserRecordIfNeeded
{
  return self->_updatesUserRecordIfNeeded;
}

- (unint64_t)authenticationAction
{
  return self->_authenticationAction;
}

- (void)setAuthenticationAction:(unint64_t)a3
{
  self->_authenticationAction = a3;
}

- (unint64_t)authenticationMechanism
{
  return self->_authenticationMechanism;
}

- (void)setAuthenticationMechanism:(unint64_t)a3
{
  self->_authenticationMechanism = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (void)setFallbackButtonTitle:(id)a3
{
}

- (NSArray)successAlerts
{
  return self->_successAlerts;
}

- (void)setSuccessAlerts:(id)a3
{
}

- (NSArray)failureAlerts
{
  return self->_failureAlerts;
}

- (void)setFailureAlerts:(id)a3
{
}

- (BOOL)isInternetReachable
{
  return self->_internetReachable;
}

- (void)setInternetReachable:(BOOL)a3
{
  self->_internetReachable = a3;
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (BOOL)isBiometricAuthenticationEnabled
{
  return self->_biometricAuthenticationEnabled;
}

- (void)setBiometricAuthenticationEnabled:(BOOL)a3
{
  self->_biometricAuthenticationEnabled = a3;
}

- (int64_t)biometricAuthenticationType
{
  return self->_biometricAuthenticationType;
}

- (void)setBiometricAuthenticationType:(int64_t)a3
{
  self->_biometricAuthenticationType = a3;
}

- (BOOL)isKeychainAvailable
{
  return self->_keychainAvailable;
}

- (void)setKeychainAvailable:(BOOL)a3
{
  self->_keychainAvailable = a3;
}

- (BOOL)hasKeychainItem
{
  return self->_hasKeychainItem;
}

- (void)setHasKeychainItem:(BOOL)a3
{
  self->_hasKeychainItem = a3;
}

- (BOOL)hasCloudAccount
{
  return self->_hasCloudAccount;
}

- (void)setHasCloudAccount:(BOOL)a3
{
  self->_hasCloudAccount = a3;
}

- (BOOL)hasDevicePassword
{
  return self->_hasDevicePassword;
}

- (void)setHasDevicePassword:(BOOL)a3
{
  self->_hasDevicePassword = a3;
}

- (NSString)touchBarReason
{
  return self->_touchBarReason;
}

- (void)setTouchBarReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchBarReason, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_failureAlerts, 0);
  objc_storeStrong((id *)&self->_successAlerts, 0);
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

+ (void)promptForDeletingNotes:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Notes to delete belong to different accounts", v1, 2u);
}

@end