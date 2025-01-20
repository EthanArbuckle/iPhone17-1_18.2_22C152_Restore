@interface SDAirDropHandlerCredentialLinks
+ (void)openPasswordManagerURL:(id)a3;
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (id)credential;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)handleAction;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerCredentialLinks

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 completedURLs];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = +[NSURLComponents componentsWithURL:*(void *)(*((void *)&v14 + 1) + 8 * i) resolvingAgainstBaseURL:0];
        v10 = [v9 scheme];
        unsigned int v11 = [v10 isEqual:@"EncryptedCredential"];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (void)handleAction
{
  v3 = [(SDAirDropHandlerCredentialLinks *)self credential];
  v4 = v3;
  if (!v3)
  {
    id v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100113210();
    }
    goto LABEL_11;
  }
  id v5 = [v3 passwordManagerURL];
  id v6 = airdrop_log();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100113244();
    }

LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Opening password manager url", v11, 2u);
  }

  [(objc_class *)off_100967D58() openPasswordManagerURL:v5];
  uint64_t v8 = 1;
LABEL_12:

  credential = self->_credential;
  self->_credential = 0;

  v10 = [(SDAirDropHandler *)self completionHandler];
  v10[2](v10, v8, 0, 1);
}

+ (void)openPasswordManagerURL:(id)a3
{
  v3 = off_100967D58;
  id v4 = a3;
  [(objc_class *)v3() openPasswordManagerURL:v4];
}

- (id)suitableContentsDescription
{
  v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  id v5 = [(SDAirDropHandlerCredentialLinks *)self credential];
  id v6 = [v5 displayName];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v6 && v4 == 1) {
      goto LABEL_8;
    }
LABEL_12:
    CFStringRef v21 = @"CREDENTIAL";
    long long v16 = +[NSNumber numberWithUnsignedInteger:v4];
    v22 = v16;
    long long v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v23 = v17;
    v18 = +[NSArray arrayWithObjects:&v23 count:1];
    uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v18];

    uint64_t v15 = SFLocalizedStringForKey();
    goto LABEL_13;
  }
  uint64_t v7 = [v5 passkeyCredential];

  if (v6 && v4 == 1)
  {
    if (v7)
    {
      uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906F80];
      uint64_t v9 = SFLocalizedStringForKeyInStringsFileNamed();
LABEL_9:
      v10 = (void *)v9;
      unsigned int v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v6);

      goto LABEL_14;
    }
LABEL_8:
    uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906F98];
    uint64_t v9 = SFLocalizedStringForKey();
    goto LABEL_9;
  }
  if (!v7) {
    goto LABEL_12;
  }
  CFStringRef v24 = @"PASSKEY";
  BOOL v12 = +[NSNumber numberWithUnsignedInteger:v4];
  v25 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v26 = v13;
  long long v14 = +[NSArray arrayWithObjects:&v26 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v14];

  uint64_t v15 = SFLocalizedStringForKeyInStringsFileNamed();
LABEL_13:
  v19 = (void *)v15;
  unsigned int v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v3, v4);

LABEL_14:

  return v11;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerCredentialLinks;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x40000;
}

- (void)updatePossibleActions
{
  v19.receiver = self;
  v19.super_class = (Class)SDAirDropHandlerCredentialLinks;
  [(SDAirDropHandler *)&v19 updatePossibleActions];
  id v3 = objc_alloc((Class)SFAirDropAction);
  unint64_t v4 = [(SDAirDropHandler *)self transfer];
  id v5 = [v4 identifier];
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(SDAirDropHandler *)self singleItemActionTitle];
  uint64_t v9 = [(SDAirDropHandler *)self singleItemActionTitle];
  id v10 = [v3 initWithTransferIdentifier:v5 actionIdentifier:v7 title:v8 singleItemTitle:v9 type:1];

  id location = 0;
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100112F24;
  long long v16 = &unk_1008CA128;
  objc_copyWeak(&v17, &location);
  [v10 setActionHandler:&v13];
  id v20 = v10;
  unsigned int v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16);
  BOOL v12 = [(SDAirDropHandler *)self transfer];
  [v12 setPossibleActions:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)credential
{
  p_credential = &self->_credential;
  credential = self->_credential;
  if (credential)
  {
    unint64_t v4 = credential;
  }
  else
  {
    id v6 = airdrop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Grabbing credential from AirDrop handler...", v19, 2u);
    }

    uint64_t v7 = +[SDAppleIDAgent sharedAgent];
    uint64_t v8 = [v7 myAccount];

    if (!v8)
    {
      uint64_t v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001132E0();
      }
    }
    id v10 = [v8 identity];
    if (!v10)
    {
      unsigned int v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001132AC();
      }
    }
    id v12 = [v10 copyPrivateKey];
    if (!v12)
    {
      v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100113278();
      }
    }
    uint64_t v14 = [(SDAirDropHandler *)self transfer];
    uint64_t v15 = [v14 completedURLs];
    long long v16 = [v15 firstObject];
    id v17 = SFSharablePasswordForEncryptedAirDropURL();

    if (v12) {
      CFRelease(v12);
    }
    if (v17) {
      objc_storeStrong((id *)p_credential, v17);
    }
    unint64_t v4 = *p_credential;
  }

  return v4;
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void).cxx_destruct
{
}

@end