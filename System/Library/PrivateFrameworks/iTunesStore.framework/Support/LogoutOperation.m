@interface LogoutOperation
- (LogoutOperation)initWithAccount:(id)a3;
- (SSAccount)account;
- (id)_copyAuthenticationContext;
- (id)_sbsyncData;
- (void)_disableAutomaticDownloadKinds;
- (void)_disableBookkeeper;
- (void)_sendLogoutRequest;
- (void)run;
@end

@implementation LogoutOperation

- (LogoutOperation)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LogoutOperation;
  v6 = [(LogoutOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (SSAccount)account
{
  [(LogoutOperation *)self lock];
  v3 = self->_account;
  [(LogoutOperation *)self unlock];

  return v3;
}

- (void)run
{
  [(LogoutOperation *)self _disableAutomaticDownloadKinds];
  [(LogoutOperation *)self _disableBookkeeper];
  [(LogoutOperation *)self _sendLogoutRequest];

  [(LogoutOperation *)self setSuccess:1];
}

- (id)_copyAuthenticationContext
{
  id v3 = objc_alloc((Class)SSMutableAuthenticationContext);
  v4 = [(LogoutOperation *)self account];
  id v5 = [v3 initWithAccount:v4];

  [v5 setPromptStyle:1000];
  return v5;
}

- (void)_disableAutomaticDownloadKinds
{
  v4 = [[SetAutomaticDownloadKindsOperation alloc] initWithDownloadKinds:0];
  [(SetAutomaticDownloadKindsOperation *)v4 setShouldSuppressServerDialogs:1];
  id v3 = [(LogoutOperation *)self _copyAuthenticationContext];
  [(SetAutomaticDownloadKindsOperation *)v4 setAuthenticationContext:v3];
  [(LogoutOperation *)self runSubOperation:v4 returningError:0];
}

- (void)_disableBookkeeper
{
  id v17 = +[SSURLBagContext contextWithBagType:0];
  id v3 = [(LogoutOperation *)self account];
  v4 = [v3 uniqueIdentifier];
  [v17 setUserIdentifier:v4];

  id v5 = [(LogoutOperation *)self loadedURLBagWithContext:v17 returningError:0];
  v6 = [v5 valueForKey:@"push-notification-types"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKey:@"add-push-notification-type-url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_alloc_init((Class)ISStoreURLOperation);
      objc_super v9 = +[DaemonProtocolDataProvider provider];
      [v8 setDataProvider:v9];

      id v10 = [(LogoutOperation *)self _copyAuthenticationContext];
      [v8 setAuthenticationContext:v10];
      id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
      [v11 setHTTPMethod:@"POST"];
      v12 = +[NSURL URLWithString:v7];
      [v11 setURL:v12];

      [v11 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      v14 = +[ISDevice sharedInstance];
      v15 = [v14 guid];

      if (v15) {
        [v13 setObject:v15 forKey:@"guid"];
      }
      id v16 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"0", @"bookkeeperDomain:com.apple.upp", 0);
      [v13 setObject:v16 forKey:@"put-parameters"];
      [v13 setObject:@"mzbookkeeper" forKey:@"notification-type"];

      [v11 setRequestParameters:v13];
      [v8 setRequestProperties:v11];
      [(LogoutOperation *)self runSubOperation:v8 returningError:0];
    }
  }
}

- (id)_sbsyncData
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  sub_1001DC128(-1, (uint64_t)&v15, (uint64_t)&v13 + 4, (uint64_t)&v14, (uint64_t)&v13);
  id v3 = 0;
  if (!v4)
  {
    id v5 = [(LogoutOperation *)self account];
    v6 = [v5 uniqueIdentifier];
    id v7 = [v6 unsignedLongLongValue];

    id v8 = objc_alloc_init((Class)SSVFairPlaySubscriptionController);
    id v9 = objc_alloc((Class)NSData);
    id v10 = [v9 initWithBytesNoCopy:v15 length:HIDWORD(v13) freeWhenDone:0];
    id v12 = 0;
    [v8 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v7 transactionType:303 machineIDData:v10 returningSubscriptionBagData:&v12 error:0];
    id v3 = v12;
  }
  if (v15) {
    sub_1001CD9F8(v15);
  }
  if (v14) {
    sub_1001CD9F8(v14);
  }

  return v3;
}

- (void)_sendLogoutRequest
{
  id v15 = objc_alloc_init((Class)ISStoreURLOperation);
  id v3 = +[DaemonProtocolDataProvider provider];
  [v15 setDataProvider:v3];

  [v15 setUseUserSpecificURLBag:1];
  id v4 = [(LogoutOperation *)self _copyAuthenticationContext];
  [v15 setAuthenticationContext:v4];
  id v5 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = +[ISDevice sharedInstance];
  id v8 = [v7 guid];

  if (v8) {
    [v6 setObject:v8 forKey:@"guid"];
  }
  id v9 = [(LogoutOperation *)self _sbsyncData];
  if (v9) {
    [v6 setObject:v9 forKey:@"sbsync"];
  }
  if ([v6 count])
  {
    id v10 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:0];
    [v5 setHTTPBody:v10];
    [v5 setHTTPMethod:@"POST"];
    [v5 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  }
  [v5 setURLBagKey:@"logout"];

  [v15 setRequestProperties:v5];
  [(LogoutOperation *)self runSubOperation:v15 returningError:0];
  id v11 = [v15 dataProvider];
  id v12 = [v11 output];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = SSVSubscriptionBagForDictionary();
    if (v13)
    {
      id v14 = objc_alloc_init((Class)SSVFairPlaySubscriptionController);
      [v14 importSubscriptionKeyBagData:v13 returningError:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end