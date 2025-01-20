@interface MZKeyValueStoreAuthenticationController
- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4;
- (BOOL)shouldAuthenticate;
- (BOOL)shouldForceAuthenticationForTransaction:(id)a3;
- (MZKeyValueStoreAuthenticationController)init;
- (NSString)DSID;
- (NSString)DSIDText;
- (NSString)acceptedDSID;
- (NSString)acceptedDSIDText;
- (NSString)acceptedDSIDTextUserDefaultsKey;
- (NSString)acceptedDSIDUserDefaultsKey;
- (id)authenticationErrorsForTransaction:(id)a3;
- (void)resetAcceptedCredentials;
- (void)setAcceptedDSIDTextUserDefaultsKey:(id)a3;
- (void)setAcceptedDSIDUserDefaultsKey:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
@end

@implementation MZKeyValueStoreAuthenticationController

- (MZKeyValueStoreAuthenticationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MZKeyValueStoreAuthenticationController;
  v2 = [(MZKeyValueStoreAuthenticationController *)&v8 init];
  if (v2)
  {
    v3 = (NSString *)[@"MZKeyValueStore.LastDsid" copy];
    acceptedDSIDUserDefaultsKey = v2->_acceptedDSIDUserDefaultsKey;
    v2->_acceptedDSIDUserDefaultsKey = v3;

    v5 = (NSString *)[@"MZKeyValueStore.LastDsidText" copy];
    acceptedDSIDTextUserDefaultsKey = v2->_acceptedDSIDTextUserDefaultsKey;
    v2->_acceptedDSIDTextUserDefaultsKey = v5;
  }
  return v2;
}

- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MZKeyValueStoreAuthenticationController *)self DSID];
  objc_super v8 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSID];
  if ([(MZKeyValueStoreAuthenticationController *)self shouldAuthenticate]
    || v7 && v8 && ([v7 isEqualToString:v8] & 1) != 0
    || [(MZKeyValueStoreAuthenticationController *)self shouldForceAuthenticationForTransaction:v6])
  {
    BOOL v9 = 1;
  }
  else
  {
    [(MZKeyValueStoreAuthenticationController *)self authenticationErrorsForTransaction:v6];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)shouldForceAuthenticationForTransaction:(id)a3
{
  id v4 = a3;
  if ([(MZKeyValueStoreAuthenticationController *)self shouldAuthenticate])
  {
    v5 = [(MZKeyValueStoreAuthenticationController *)self authenticationErrorsForTransaction:v4];
    id v6 = v5;
    if (v5) {
      BOOL v7 = ((unint64_t)[v5 code] & 0xFFFFFFFFFFFFFFFDLL) == -1004;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)authenticationErrorsForTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(MZKeyValueStoreAuthenticationController *)self DSIDText];
  id v6 = [(MZKeyValueStoreAuthenticationController *)self DSID];
  BOOL v7 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSID];
  objc_super v8 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSIDText];
  if (v7)
  {
    if (v6) {
      +[MZKeyValueStoreError storeAccountMismatchErrorWithPreviousStoreAccountText:v8 currentStoreAccontText:v5 transaction:v4 underlyingError:0];
    }
    else {
    uint64_t v9 = +[MZKeyValueStoreError storeLoggedOutErrorWithPreviousStoreAccountText:v7 transaction:v4 underlyingError:0];
    }
  }
  else
  {
    uint64_t v9 = +[MZKeyValueStoreError noStoreAccountErrorWithTransaction:v4 underlyingError:0];
  }
  v10 = (void *)v9;

  return v10;
}

- (void)resetAcceptedCredentials
{
  v3 = +[MZPreferences storeBookkeeperPreferences];
  id v4 = [(MZKeyValueStoreAuthenticationController *)self DSID];
  v5 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSIDUserDefaultsKey];
  [v3 setObject:v4 forKey:v5];

  id v8 = +[MZPreferences storeBookkeeperPreferences];
  id v6 = [(MZKeyValueStoreAuthenticationController *)self DSIDText];
  BOOL v7 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSIDTextUserDefaultsKey];
  [v8 setObject:v6 forKey:v7];
}

- (NSString)acceptedDSID
{
  v3 = +[MZPreferences storeBookkeeperPreferences];
  id v4 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSIDUserDefaultsKey];
  v5 = [v3 objectForKey:v4 withDefaultValue:0];

  return (NSString *)v5;
}

- (NSString)acceptedDSIDText
{
  v3 = +[MZPreferences storeBookkeeperPreferences];
  id v4 = [(MZKeyValueStoreAuthenticationController *)self acceptedDSIDTextUserDefaultsKey];
  v5 = [v3 objectForKey:v4 withDefaultValue:0];

  return (NSString *)v5;
}

- (NSString)DSID
{
  v2 = +[MTAccountController sharedInstance];
  v3 = [v2 activeDsid];
  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)DSIDText
{
  v2 = +[MTAccountController sharedInstance];
  v3 = [v2 activeAccount];
  id v4 = [v3 username];

  return (NSString *)v4;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (NSString)acceptedDSIDUserDefaultsKey
{
  return self->_acceptedDSIDUserDefaultsKey;
}

- (void)setAcceptedDSIDUserDefaultsKey:(id)a3
{
}

- (NSString)acceptedDSIDTextUserDefaultsKey
{
  return self->_acceptedDSIDTextUserDefaultsKey;
}

- (void)setAcceptedDSIDTextUserDefaultsKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedDSIDTextUserDefaultsKey, 0);

  objc_storeStrong((id *)&self->_acceptedDSIDUserDefaultsKey, 0);
}

@end