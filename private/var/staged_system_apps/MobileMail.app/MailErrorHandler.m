@interface MailErrorHandler
- (BOOL)shouldDisplayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (MailErrorHandler)init;
- (MailErrorPresentationDelegate)presentationDelegate;
- (NSMutableSet)displayedErrorDescriptions;
- (NSMutableSet)sslErrorAccountsDisplayed;
- (id)_alertTitleWithError:(id)a3;
- (id)preferencesURLForAccount:(id)a3 error:(id)a4;
- (id)sanitizedErrorForError:(id)a3 forAccount:(id)a4;
- (void)_changeSetManagerEncounteredError:(id)a3;
- (void)_displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (void)_presentAlertController:(id)a3;
- (void)_presentAlertWithSettingsButtonForAccount:(id)a3 error:(id)a4;
- (void)_promptUserForWebLoginWithAccount:(id)a3 error:(id)a4;
- (void)_promptUserToTryAlternateSettingsFromAccountHealer:(id)a3 completionHandler:(id)a4;
- (void)_redirectToRecoveryURL:(id)a3;
- (void)didDisplayError:(id)a3;
- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (void)reset;
- (void)setDisplayedErrorDescriptions:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSslErrorAccountsDisplayed:(id)a3;
@end

@implementation MailErrorHandler

- (MailErrorHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)MailErrorHandler;
  v2 = [(MailErrorHandler *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    displayedErrorDescriptions = v2->_displayedErrorDescriptions;
    v2->_displayedErrorDescriptions = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    sslErrorAccountsDisplayed = v2->_sslErrorAccountsDisplayed;
    v2->_sslErrorAccountsDisplayed = v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_changeSetManagerEncounteredError:" name:@"MailChangeSetEncounteredError" object:0];
  }
  return v2;
}

- (void)reset
{
  [(NSMutableSet *)self->_displayedErrorDescriptions removeAllObjects];
  sslErrorAccountsDisplayed = self->_sslErrorAccountsDisplayed;
  self->_sslErrorAccountsDisplayed = 0;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)shouldDisplayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 == 2)
  {
    LOBYTE(v9) = 1;
    goto LABEL_50;
  }
  unsigned int v9 = [v7 mf_shouldBeReportedToUser];
  v10 = [v7 userInfo];
  v42 = [v10 objectForKey:MFSSLErrorCertificateDigestKey];

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if (v42) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = v9;
  }
  if (v12 == 1)
  {
    v13 = [v7 mf_shortDescription];
    unsigned int v9 = [v13 length] != 0;
  }
  if ((v9 & isKindOfClass) == 1)
  {
    v14 = +[UIApplication sharedApplication];
    unsigned int v9 = [v14 isSuspended] ^ 1;
  }
  if ((v9 & isKindOfClass) == 1)
  {
    v15 = +[PCPersistentTimer lastSystemWakeDate];
    [v15 timeIntervalSinceNow];
    unsigned int v9 = v16 < -7.0;
  }
  v17 = +[UIApplication sharedApplication];
  v41 = [v17 selectedAccounts];

  char v18 = v9 ^ 1;
  if (!v8) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    if ([v41 count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [v8 uniqueID];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id obj = v41;
        id v20 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v50;
LABEL_19:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v50 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = [*(id *)(*((void *)&v49 + 1) + 8 * v22) uniqueID];
            unsigned __int8 v24 = [v19 isEqualToString:v23];

            if (v24) {
              break;
            }
            if (v20 == (id)++v22)
            {
              id v20 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
              if (v20) {
                goto LABEL_19;
              }
              unsigned int v9 = 0;
              goto LABEL_42;
            }
          }
        }
        unsigned int v9 = 1;
LABEL_42:

        goto LABEL_43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v8;
        id obj = [v19 uniqueID];
        v25 = [v19 mailAccountIfAvailable];
        v40 = [v25 uniqueID];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v38 = v41;
        id v26 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v26)
        {
          uint64_t v39 = *(void *)v46;
          while (2)
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v46 != v39) {
                objc_enumerationMutation(v38);
              }
              v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v29 = [v28 deliveryAccount];
              v30 = [v29 uniqueID];
              if ([obj isEqualToString:v30])
              {

                goto LABEL_40;
              }
              v31 = [v28 uniqueID];
              unsigned __int8 v32 = [v40 isEqualToString:v31];

              if (v32) {
                goto LABEL_40;
              }
            }
            id v26 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
            unsigned int v9 = 0;
            if (v26) {
              continue;
            }
            break;
          }
        }
        else
        {
LABEL_40:
          unsigned int v9 = 1;
        }

        goto LABEL_42;
      }
    }
    unsigned int v9 = 1;
  }
LABEL_43:
  if (a5 == 1 && v9)
  {
    displayedErrorDescriptions = self->_displayedErrorDescriptions;
    v34 = [v7 localizedDescription];
    LODWORD(displayedErrorDescriptions) = [(NSMutableSet *)displayedErrorDescriptions containsObject:v34];

    unsigned int v9 = displayedErrorDescriptions ^ 1;
  }
  if (v9 && v42)
  {
    sslErrorAccountsDisplayed = self->_sslErrorAccountsDisplayed;
    v36 = [v8 uniqueID];
    LOBYTE(sslErrorAccountsDisplayed) = [(NSMutableSet *)sslErrorAccountsDisplayed containsObject:v36];

    LOBYTE(v9) = sslErrorAccountsDisplayed ^ 1;
  }

LABEL_50:
  return v9;
}

- (void)didDisplayError:(id)a3
{
  id v4 = a3;
  displayedErrorDescriptions = self->_displayedErrorDescriptions;
  id v9 = v4;
  if (!displayedErrorDescriptions)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_displayedErrorDescriptions;
    self->_displayedErrorDescriptions = v6;

    displayedErrorDescriptions = self->_displayedErrorDescriptions;
    id v4 = v9;
  }
  id v8 = [v4 localizedDescription];
  [(NSMutableSet *)displayedErrorDescriptions addObject:v8];
}

- (id)sanitizedErrorForError:(id)a3 forAccount:(id)a4
{
  id v42 = a3;
  id v43 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v43;
  id v7 = v42;
  id v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v8 mailAccountIfAvailable], (id v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = v8;
  }
  v10 = [v9 displayName];

  v11 = [v7 domain];
  unsigned int v12 = (void *)MFMessageErrorDomain;
  unsigned int v13 = [v11 isEqual:MFMessageErrorDomain];

  if (v13)
  {
    id v14 = 0;
    id v15 = 0;
    switch((unint64_t)[v7 code])
    {
      case 0x408uLL:
      case 0x40FuLL:
      case 0x41FuLL:
      case 0x420uLL:
      case 0x424uLL:
        char v18 = MFLookupLocalizedString();
        uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v10);
        goto LABEL_26;
      case 0x40BuLL:
      case 0x40CuLL:
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_9;
        }
        double v16 = [v7 localizedDescription];
        v17 = MFLookupLocalizedString();
        if (!v17) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 0x410uLL:
        char v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"UNRECOVERABLE_SERVER_ERROR" value:&stru_100619928 table:@"Main"];
        goto LABEL_26;
      case 0x412uLL:
        v17 = MFLookupLocalizedString();
        uint64_t v20 = [v7 localizedDescription];
        goto LABEL_22;
      case 0x413uLL:
        char v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"NO_INTERNET_CONNECTION" value:&stru_100619928 table:@"Main"];
        goto LABEL_26;
      case 0x416uLL:
        char v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"ERROR_DATA_BLOCKED_BY_CALL" value:&stru_100619928 table:@"Main"];
LABEL_26:
        double v16 = (void *)v19;

        goto LABEL_27;
      case 0x417uLL:
        v17 = MFLookupLocalizedString();
        uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v22 = [v21 localizedStringForKey:@"INVALID_SENDER_MESSAGE" value:&stru_100619928 table:@"Main"];
        goto LABEL_19;
      case 0x418uLL:
        v17 = MFLookupLocalizedString();
        uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v22 = [v21 localizedStringForKey:@"NO_RECIPIENT_MESSAGE" value:&stru_100619928 table:@"Main"];
        goto LABEL_19;
      case 0x419uLL:
        v17 = MFLookupLocalizedString();
        uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v22 = [v21 localizedStringForKey:@"INVALID_RECIPIENT_MESSAGE" value:&stru_100619928 table:@"Main"];
        goto LABEL_19;
      case 0x41AuLL:
        v17 = MFLookupLocalizedString();
        uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v22 = [v21 localizedStringForKey:@"SENDER_MAILBOX_FULL_MESSAGE" value:&stru_100619928 table:@"Main"];
LABEL_19:
        double v16 = (void *)v22;

        if (!v17) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 0x41BuLL:
      case 0x41DuLL:
      case 0x41EuLL:
        v17 = MFLookupLocalizedString();
        uint64_t v20 = MFLookupLocalizedString();
LABEL_22:
        double v16 = (void *)v20;
        if (v17)
        {
LABEL_23:
          id v14 = v17;
          if (!v16) {
            goto LABEL_10;
          }
        }
        else
        {
LABEL_27:
          id v14 = 0;
          if (!v16) {
            goto LABEL_10;
          }
        }
        id v15 = v16;

        break;
      default:
        break;
    }
  }
  else
  {
LABEL_9:
    id v14 = 0;
LABEL_10:
    id v15 = 0;
  }

  id v23 = v14;
  id v24 = v15;
  id v25 = v24;
  if (v23 && v24) {
    goto LABEL_49;
  }
  id v26 = [v7 code];
  id v27 = v8;
  v28 = MFLookupLocalizedString();
  if (v26 == (id)1058)
  {
    v29 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"ACCOUNT_IN_USE" value:&stru_100619928 table:@"Main"];

    v31 = [v27 displayName];
    uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v31);
  }
  else
  {
    if (![v27 shouldDisplayHostnameInErrorMessages]
      || ([v27 hostname], (v30 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v33 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = v33;
      if (isKindOfClass) {
        CFStringRef v34 = @"GENERIC_DELIVERY_ERROR_MESSAGE";
      }
      else {
        CFStringRef v34 = @"GENERIC_INCOMING_ERROR_MESSAGE";
      }
      v35 = [v33 localizedStringForKey:v34 value:&stru_100619928 table:@"Main"];
      goto LABEL_41;
    }
    v31 = MFLookupLocalizedString();
    uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v30);
  }
  v35 = (void *)v32;

LABEL_41:
  id v36 = v23;
  if (!v23)
  {
    id v36 = 0;
    if (v28) {
      id v36 = v28;
    }
  }
  id v37 = v25;
  if (!v25)
  {
    id v37 = 0;
    if (v35) {
      id v37 = v35;
    }
  }

  if (v23)
  {
    if (v25) {
      goto LABEL_49;
    }
  }
  else
  {
    id v23 = v36;
    if (v25) {
      goto LABEL_49;
    }
  }
  id v25 = v37;
LABEL_49:
  if (v7)
  {
    unsigned int v12 = [v7 domain];
    uint64_t v38 = (uint64_t)[v7 code];
  }
  else
  {
    uint64_t v38 = 1030;
  }
  uint64_t v39 = [v7 userInfo];
  v40 = +[MFError errorWithDomain:v12 code:v38 localizedDescription:v25 title:v23 userInfo:v39];

  if (v7) {

  }
  return v40;
}

- (id)preferencesURLForAccount:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 domain];
  id v8 = (char *)[v6 code];
  if ([MFMessageErrorDomain isEqualToString:v7])
  {
    unsigned int v9 = (0x1880001u >> ((_BYTE)v8 - 8)) & 1;
    if ((unint64_t)(v8 - 1032) > 0x18) {
      unsigned int v9 = 0;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  if (v8 == (char *)54 || v8 == (char *)1212 || v8 == (char *)1235 || v9)
  {
    uint64_t v10 = +[MFPreferencesURL accountInfoURLForAccount:v5];
LABEL_11:
    v11 = (void *)v10;
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "mf_isSMIMEError"))
  {
    uint64_t v10 = +[MFPreferencesURL advancedAccountInfoURLForAccount:v5];
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:
  unsigned int v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v5 identifier];
    id v14 = [v6 domain];
    int v16 = 138413058;
    id v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    id v21 = [v6 code];
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "preferencesURLForAccount:%@ error:[%@:%ld] => %@", (uint8_t *)&v16, 0x2Au);
  }

  return v11;
}

- (void)_displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  unsigned int v9 = [v14 userInfo];
  uint64_t v10 = [v9 objectForKey:MFSSLErrorCertificateKey];
  if (!v10)
  {
    v11 = [v9 objectForKey:@"MailErrorHandlerDoNotSanitize"];
    unsigned __int8 v12 = [v11 BOOLValue];

    if (v12) {
      goto LABEL_5;
    }
    uint64_t v13 = [(MailErrorHandler *)self sanitizedErrorForError:v14 forAccount:v8];
    uint64_t v10 = v14;
    id v14 = (id)v13;
  }

LABEL_5:
  if ([(MailErrorHandler *)self shouldDisplayError:v14 forAccount:v8 mode:a5])
  {
    if ([v14 code] == (id)1059) {
      [(MailErrorHandler *)self _promptUserForWebLoginWithAccount:v8 error:v14];
    }
    else {
      [(MailErrorHandler *)self _presentAlertWithSettingsButtonForAccount:v8 error:v14];
    }
    [(MailErrorHandler *)self didDisplayError:v14];
  }
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MFAccountHealer alloc];
  v11 = +[MFNetworkController sharedInstance];
  unsigned __int8 v12 = [(MFAccountHealer *)v10 initWithAccount:v9 networkController:v11 error:v8];

  if ([(MFAccountHealer *)v12 shouldHealFromAlternateAccount])
  {
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    int v16 = sub_10010B3E4;
    id v17 = &unk_100608460;
    __int16 v18 = self;
    id v19 = v8;
    id v20 = v9;
    int64_t v21 = a5;
    uint64_t v13 = objc_retainBlock(&v14);
    -[MailErrorHandler _promptUserToTryAlternateSettingsFromAccountHealer:completionHandler:](self, "_promptUserToTryAlternateSettingsFromAccountHealer:completionHandler:", v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    [(MailErrorHandler *)self _displayError:v8 forAccount:v9 mode:a5];
  }
}

- (void)_redirectToRecoveryURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = +[UIApplication sharedApplication];
    [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];

    id v3 = v5;
  }
}

- (void)_changeSetManagerEncounteredError:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  id v8 = self;
  id v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&v6];
}

- (void)_promptUserForWebLoginWithAccount:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 userInfo];
  id v9 = [v8 objectForKey:MFRequestedWebLoginURLKey];

  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = +[UIApplication sharedApplication];
  id v11 = [v10 applicationState];

  if (v11) {
    goto LABEL_4;
  }
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_10010B850;
  int v16 = &unk_100608488;
  id v17 = self;
  id v18 = v6;
  unsigned __int8 v12 = [v18 promptUserForWebLoginWithURL:v9 shouldConfirm:1 completionHandler:&v13];

  if ((v12 & 1) == 0) {
LABEL_4:
  }
    -[MailErrorHandler _presentAlertWithSettingsButtonForAccount:error:](self, "_presentAlertWithSettingsButtonForAccount:error:", v6, v7, v13, v14, v15, v16, v17);
}

- (void)_promptUserToTryAlternateSettingsFromAccountHealer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (pthread_main_np() != 1)
  {
    id v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MailErrorHandler.m" lineNumber:424 description:@"Current thread must be main"];
  }
  id v8 = [v6 account];
  id v27 = v8;
  v28 = [v6 error];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    [v9 localizedStringForKey:@"HEAL_INCOMING_TITLE" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    [v9 localizedStringForKey:@"HEAL_OUTGOING_TITLE" value:&stru_100619928 table:@"Main"];
  uint64_t v10 = };

  id v11 = [v8 displayName];
  unsigned __int8 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

  uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"HEAL_MESSAGE" value:&stru_100619928 table:@"Main"];

  uint64_t v15 = [v28 domain];
  int v16 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v15, [v28 code], v14, v12, 0);

  if ([(MailErrorHandler *)self shouldDisplayError:v16 forAccount:v27 mode:1])
  {
    [(MailErrorHandler *)self didDisplayError:v16];
    id v26 = v7;
    id v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [v17 localizedStringForKey:@"REPAIR" value:&stru_100619928 table:@"Main"];

    id v18 = +[UIAlertController alertControllerWithTitle:v12 message:v14 preferredStyle:1];
    id v19 = +[NSBundle bundleForClass:objc_opt_class()];
    id v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10010BF9C;
    v33[3] = &unk_1006084B0;
    id v21 = v7;
    id v34 = v21;
    __int16 v22 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v33];
    [v18 addAction:v22];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10010BFB0;
    v30[3] = &unk_1006084D8;
    id v31 = v6;
    id v32 = v21;
    id v23 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v30];
    id v7 = v26;
    [v18 addAction:v23];

    [(MailErrorHandler *)self _presentAlertController:v18];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_presentAlertWithSettingsButtonForAccount:(id)a3 error:(id)a4
{
  id v34 = a3;
  id v7 = a4;
  if (pthread_main_np() == 1)
  {
    if (!v7) {
      goto LABEL_24;
    }
  }
  else
  {
    v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"MailErrorHandler.m" lineNumber:464 description:@"Current thread must be main"];

    if (!v7) {
      goto LABEL_24;
    }
  }
  id v8 = [(MailErrorHandler *)self _alertTitleWithError:v7];
  id v9 = [v7 localizedDescription];
  uint64_t v10 = [v7 localizedFailureReason];
  v33 = (void *)v10;
  if (v10)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@\n\n%@", v9, v10];

    id v9 = (void *)v11;
  }
  if (v8 && ![&stru_100619928 isEqualToString:v8]
    || v9 && ![&stru_100619928 isEqualToString:v9])
  {
    unsigned __int8 v12 = [v7 localizedRecoverySuggestion];
    id v31 = [v7 recoveryAttempter];
    int v13 = objc_opt_respondsToSelector();
    if (v31) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = !v14;
    id v32 = [(MailErrorHandler *)self preferencesURLForAccount:v34 error:v7];
    int v16 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:1];
    if ((v15 & v13) != 0)
    {
      id v17 = +[NSBundle bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
      id v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:0];
      [v16 addAction:v19];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10010C670;
      v37[3] = &unk_100608500;
      id v38 = v31;
      id v39 = v7;
      v40 = self;
      id v20 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v37];
      [v16 addAction:v20];
    }
    else
    {
      +[NSBundle mainBundle];
      if (v32) {
        id v21 = {;
      }
        __int16 v22 = [v21 localizedStringForKey:@"SETTINGS" value:&stru_100619928 table:@"Main"];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10010C690;
        v35[3] = &unk_1006079A8;
        id v36 = v32;
        id v23 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v35];
        [v16 addAction:v23];

        id v24 = +[NSBundle mainBundle];
        id v25 = [v24 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
        id v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:0];
        [v16 addAction:v26];
      }
      else {
        id v27 = {;
      }
        v28 = [v27 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
        v29 = +[UIAlertAction actionWithTitle:v28 style:1 handler:0];
        [v16 addAction:v29];
      }
    }
    [(MailErrorHandler *)self _presentAlertController:v16];
  }
  else
  {
    unsigned __int8 v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Warning Suppressing alert for error with no title or message: %@", buf, 0xCu);
    }
  }

LABEL_24:
}

- (id)_alertTitleWithError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:@"MailErrorHandlerOverridingTitle"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    [v3 mf_shortDescription];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

- (void)_presentAlertController:(id)a3
{
  id v6 = a3;
  id v4 = [(MailErrorHandler *)self presentationDelegate];
  id v5 = [v4 viewControllerForPresentingErrors];

  if (v5) {
    [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (MailErrorPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (MailErrorPresentationDelegate *)WeakRetained;
}

- (NSMutableSet)displayedErrorDescriptions
{
  return self->_displayedErrorDescriptions;
}

- (void)setDisplayedErrorDescriptions:(id)a3
{
}

- (NSMutableSet)sslErrorAccountsDisplayed
{
  return self->_sslErrorAccountsDisplayed;
}

- (void)setSslErrorAccountsDisplayed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sslErrorAccountsDisplayed, 0);
  objc_storeStrong((id *)&self->_displayedErrorDescriptions, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end