@interface MFAccountHealer
+ (OS_os_log)log;
- (BOOL)_shouldHealAccount:(id)a3 withNewAccount:(id)a4;
- (BOOL)shouldHealFromAlternateAccount;
- (MFAccount)account;
- (MFAccount)alternateAccount;
- (MFAccountHealer)initWithAccount:(id)a3 networkController:(id)a4 error:(id)a5;
- (MFError)error;
- (MFNetworkController)networkController;
- (id)_alternateAccount;
- (id)_fetchServerFromACEDB:(id)a3 forIncomingServer:(BOOL)a4;
- (id)_getMailAccountFromDeliveryAccount:(id)a3;
- (id)_lastTimeConnectToACEDBForAccount:(id)a3;
- (void)_overwriteAccount:(id)a3 withAlternateAccount:(id)a4;
- (void)_renewCredentialsWithError:(id)a3 completionHandler:(id)a4;
- (void)healFromAlternateAccountWithCompletion:(id)a3;
- (void)healSilentlyWithCompletion:(id)a3;
@end

@implementation MFAccountHealer

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016F388;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699968 != -1) {
    dispatch_once(&qword_100699968, block);
  }
  v2 = (void *)qword_100699960;

  return (OS_os_log *)v2;
}

- (MFAccountHealer)initWithAccount:(id)a3 networkController:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFAccountHealer;
  v12 = [(MFAccountHealer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_error, a5);
    objc_storeStrong((id *)&v13->_networkController, a4);
  }

  return v13;
}

- (void)healSilentlyWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  if (pthread_main_np())
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MFAccountHealer.m" lineNumber:40 description:@"Current thread is main"];
  }
  v6 = [(MFAccountHealer *)self error];
  id v7 = [v6 code];

  v8 = [(MFAccountHealer *)self account];
  id v9 = [v8 baseAccount];
  unsigned __int8 v10 = [v9 hasPasswordCredential];

  if (v10) {
    goto LABEL_12;
  }
  id v11 = [(MFAccountHealer *)self networkController];
  if (![v11 isDataAvailable])
  {

    goto LABEL_12;
  }
  if (v7 != (id)1032 && v7 != (id)1055)
  {

    if (v7 == (id)1056) {
      goto LABEL_8;
    }
LABEL_12:
    v5[2](v5, 0);
    goto LABEL_13;
  }

LABEL_8:
  v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [(MFAccountHealer *)self account];
    v14 = [v13 ef_publicDescription];
    *(_DWORD *)buf = 138543362;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Attempting renewal of credentials for account: %{public}@", buf, 0xCu);
  }
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_10016F7B8;
  v21 = &unk_100607840;
  v22 = self;
  v23 = v5;
  objc_super v15 = objc_retainBlock(&v18);
  v16 = [(MFAccountHealer *)self error];
  [(MFAccountHealer *)self _renewCredentialsWithError:v16 completionHandler:v15];

LABEL_13:
}

- (void)healFromAlternateAccountWithCompletion:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    unsigned __int8 v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFAccountHealer.m" lineNumber:64 description:@"Current thread must be main"];
  }
  v6 = [(MFAccountHealer *)self _alternateAccount];
  if (v6)
  {
    id v7 = [objc_alloc((Class)MFAccountValidator) initWithPerformsValidationInBackground:0];
    [v7 validateAccount:v6 useSSL:[v6 usesSSL]];
    v8 = +[EFScheduler globalAsyncScheduler];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10016FAE0;
    v11[3] = &unk_1006086B8;
    id v9 = v7;
    id v12 = v9;
    v13 = self;
    id v14 = v6;
    id v15 = v5;
    [v8 performBlock:v11];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (BOOL)shouldHealFromAlternateAccount
{
  v3 = [(MFAccountHealer *)self account];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(MFAccountHealer *)self account];
  objc_opt_class();
  int v6 = objc_opt_isKindOfClass();

  id v7 = [(MFAccountHealer *)self account];
  unsigned __int8 v8 = [v7 isManaged];

  id v9 = 0;
  if (v8 & 1) == 0 && ((isKindOfClass | v6))
  {
    unsigned __int8 v10 = [(MFAccountHealer *)self account];
    id v11 = [(MFAccountHealer *)self error];
    id v9 = [v10 shouldFetchACEDBInfoForError:v11];
  }
  id v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v20 = [(MFAccountHealer *)self error];
    v21 = [v20 ef_publicDescription];
    v22 = +[NSNumber numberWithBool:v9];
    int v23 = 138543618;
    v24 = v21;
    __int16 v25 = 2112;
    v26 = v22;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error for error we use to determind to heal with another account or not: %{public}@, should heal? %@", (uint8_t *)&v23, 0x16u);
  }
  v13 = [(MFAccountHealer *)self account];
  id v14 = [(MFAccountHealer *)self _lastTimeConnectToACEDBForAccount:v13];

  if (v14)
  {
    id v15 = +[NSDate date];
    id v16 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v17 = [v16 components:48 fromDate:v14 toDate:v15 options:0];
    BOOL v18 = (uint64_t)[v17 day] > 0 || (uint64_t)[v17 hour] > 24;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18 & v9;
}

- (id)_alternateAccount
{
  if ([(MFAccountHealer *)self shouldHealFromAlternateAccount])
  {
    v3 = [(MFAccountHealer *)self account];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v5 = [(MFAccountHealer *)self account];
    int v6 = [(MFAccountHealer *)self _fetchServerFromACEDB:v5 forIncomingServer:isKindOfClass & 1];

    if (v6
      && ([(MFAccountHealer *)self account],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [(MFAccountHealer *)self _shouldHealAccount:v7 withNewAccount:v6],
          v7,
          v8))
    {
      id v9 = +[MFAccountHealer log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 hostname];
        int v17 = 138412802;
        id v18 = v10;
        __int16 v19 = 1024;
        unsigned int v20 = [v6 portNumber];
        __int16 v21 = 1024;
        unsigned int v22 = [v6 usesSSL];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Informations we got back from Ace DB: %@, %i, %i", (uint8_t *)&v17, 0x18u);
      }
      id v11 = v6;
      id v12 = [(MFAccountHealer *)self account];
      v13 = [v12 username];
      [v11 setUsername:v13];

      id v14 = [(MFAccountHealer *)self account];
      id v15 = [v14 password];
      [v11 setPassword:v15];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldHealAccount:(id)a3 withNewAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 usesSSL];
  if (v7 == [v6 usesSSL]
    && (unsigned int v8 = [v5 portNumber], v8 == objc_msgSend(v6, "portNumber")))
  {
    id v9 = [v5 hostname];
    id v10 = [v6 hostname];
    BOOL v11 = [v9 caseInsensitiveCompare:v10] != 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  id v12 = [v5 type];
  v13 = [v6 type];
  id v14 = [v12 caseInsensitiveCompare:v13];

  if (v14) {
    BOOL v15 = v11;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_fetchServerFromACEDB:(id)a3 forIncomingServer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = v6;
  id v18 = 0;
  id v19 = 0;
  if (v4)
  {
    unsigned int v8 = [v6 firstEmailAddress];
  }
  else
  {
    id v9 = [(MFAccountHealer *)self _getMailAccountFromDeliveryAccount:v6];
    id v10 = v9;
    if (v9)
    {
      unsigned int v8 = [v9 firstEmailAddress];
    }
    else
    {
      unsigned int v8 = &stru_100619928;
    }
  }
  if ([(__CFString *)v8 length]) {
    int v11 = AccountConfigurationServiceCopyAccountsForEmailAddress();
  }
  else {
    int v11 = 0;
  }
  id v12 = &v18;
  if (v4) {
    id v12 = &v19;
  }
  id v13 = *v12;
  id v14 = v13;
  if (v11 == 2) {
    BOOL v15 = v13;
  }
  else {
    BOOL v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (id)_getMailAccountFromDeliveryAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[MailAccount activeAccounts];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001709F8;
  v8[3] = &unk_10060A858;
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 ef_firstObjectPassingTest:v8];

  return v6;
}

- (id)_lastTimeConnectToACEDBForAccount:(id)a3
{
  id v3 = [a3 accountPropertyForKey:MFHealAccountDateLastFetched];
  [v3 doubleValue];
  BOOL v4 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

  return v4;
}

- (void)_overwriteAccount:(id)a3 withAlternateAccount:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_msgSend(v9, "setUsesSSL:", objc_msgSend(v5, "usesSSL"));
  [v9 setPortNumber:[v5 portNumber]];
  id v6 = [v5 hostname];
  [v9 setHostname:v6];

  unsigned int v7 = +[NSDate date];
  [v7 timeIntervalSince1970];
  unsigned int v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setValueInAccountProperties:v8 forKey:MFHealAccountDateLastFetched];

  [v9 savePersistentAccount];
}

- (void)_renewCredentialsWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  unsigned int v7 = [(MFAccountHealer *)self account];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100170D40;
  v9[3] = &unk_10060A880;
  id v8 = v5;
  id v10 = v8;
  [v7 renewCredentialsWithOptions:v6 completion:v9];
}

- (MFAccount)account
{
  return self->_account;
}

- (MFAccount)alternateAccount
{
  return self->_alternateAccount;
}

- (MFError)error
{
  return self->_error;
}

- (MFNetworkController)networkController
{
  return self->_networkController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_alternateAccount, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end