@interface CloudServiceCapabilitiesOperation
- (BOOL)allowsBypassOfPrivacyAcknowledgement;
- (BOOL)allowsPromptingForPrivacyAcknowledgement;
- (id)_newResponseWithSubscriptionStatus:(id)a3;
- (id)responseBlock;
- (void)run;
- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3;
- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3;
- (void)setResponseBlock:(id)a3;
@end

@implementation CloudServiceCapabilitiesOperation

- (BOOL)allowsPromptingForPrivacyAcknowledgement
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  BOOL allowsPromptingForPrivacyAcknowledgement = self->_allowsPromptingForPrivacyAcknowledgement;
  [(CloudServiceCapabilitiesOperation *)self unlock];
  return allowsPromptingForPrivacyAcknowledgement;
}

- (BOOL)allowsBypassOfPrivacyAcknowledgement
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  [(CloudServiceCapabilitiesOperation *)self unlock];
  return allowsBypassOfPrivacyAcknowledgement;
}

- (id)responseBlock
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  id v3 = [self->_responseBlock copy];
  [(CloudServiceCapabilitiesOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  self->_BOOL allowsPromptingForPrivacyAcknowledgement = a3;

  [(CloudServiceCapabilitiesOperation *)self unlock];
}

- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  self->_BOOL allowsBypassOfPrivacyAcknowledgement = a3;

  [(CloudServiceCapabilitiesOperation *)self unlock];
}

- (void)setResponseBlock:(id)a3
{
  id v6 = a3;
  [(CloudServiceCapabilitiesOperation *)self lock];
  if (self->_responseBlock != v6)
  {
    id v4 = [v6 copy];
    id responseBlock = self->_responseBlock;
    self->_id responseBlock = v4;
  }
  [(CloudServiceCapabilitiesOperation *)self unlock];
}

- (void)run
{
  [(CloudServiceCapabilitiesOperation *)self lock];
  BOOL allowsPromptingForPrivacyAcknowledgement = self->_allowsPromptingForPrivacyAcknowledgement;
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  v5 = (void (**)(id, id, id))objc_retainBlock(self->_responseBlock);
  id responseBlock = self->_responseBlock;
  self->_id responseBlock = 0;

  [(CloudServiceCapabilitiesOperation *)self unlock];
  if (allowsPromptingForPrivacyAcknowledgement && !allowsBypassOfPrivacyAcknowledgement)
  {
    v10 = [PrivacyPromptOperation alloc];
    v11 = [(PrivacyPromptOperation *)v10 initWithPrivacyIdentifier:SSPrivacyIdentifierMusicStore];
    id v54 = 0;
    unsigned int v12 = [(CloudServiceCapabilitiesOperation *)self runSubOperation:v11 returningError:&v54];
    id v9 = v54;
    int v8 = v12 ^ 1;
  }
  else
  {
    int v8 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:SSPrivacyIdentifierMusicStore];
    id v9 = 0;
  }
  if (allowsBypassOfPrivacyAcknowledgement || v8 == 0)
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = sub_1001B0358;
    v52 = sub_1001B0368;
    id v53 = 0;
    v14 = objc_alloc_init(SubscriptionStatusOperation);
    [(SubscriptionStatusOperation *)v14 setAllowsBypassOfPrivacyAcknowledgement:allowsBypassOfPrivacyAcknowledgement];
    [(SubscriptionStatusOperation *)v14 setCarrierBundleProvisioningStyle:0];
    [(SubscriptionStatusOperation *)v14 setAuthenticatesIfNecessary:0];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1001B0370;
    v47[3] = &unk_1003A9138;
    v47[4] = &v48;
    [(SubscriptionStatusOperation *)v14 setStatusBlock:v47];
    id v46 = v9;
    unsigned int v15 = [(CloudServiceCapabilitiesOperation *)self runSubOperation:v14 returningError:&v46];
    id v25 = v46;

    if (v15)
    {
      id v26 = objc_alloc_init((Class)SSVCloudServiceCapabilitiesResponse);
      [v26 setSubscriptionStatus:v49[5]];
      id v16 = [(id)v49[5] accountStatus];
      id v17 = [(id)v49[5] carrierBundlingStatus];
      id v18 = v17;
      if (v16 == (id)3 || v17 == (id)4 || v17 == (id)1) {
        [v26 setSupportsMusicCatalogPlayback:1];
      }
      if (v16 == (id)3 || v18 == (id)1)
      {
        v19 = +[SSAccountStore defaultStore];
        v20 = [v19 activeLockerAccount];

        if (v20) {
          [v26 setSupportsAddToCloudMusicLibrary:1];
        }
      }
      if (([v26 supportsMusicCatalogPlayback] & 1) == 0)
      {
        v21 = +[SSAccountStore defaultStore];
        v22 = [v21 activeAccount];
        unsigned __int8 v23 = [v22 isManagedAppleID];

        if (v23)
        {
          BOOL v24 = 0;
        }
        else
        {
          id v34 = objc_alloc_init((Class)SSURLBagContext);
          [v34 setBagType:0];
          v35 = +[SSDevice currentDevice];
          v36 = [v35 userAgentWithClientName:@"Music" version:@"3.1"];
          [v34 setValue:v36 forHTTPHeaderField:SSHTTPHeaderUserAgent];

          id v37 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v34];
          id v45 = 0;
          unsigned int v38 = [(CloudServiceCapabilitiesOperation *)self runSubOperation:v37 returningError:&v45];
          id v39 = v45;
          if (v39) {
            unsigned int v40 = 0;
          }
          else {
            unsigned int v40 = v38;
          }
          if (v40 == 1
            && ([v37 URLBag], v41 = objc_claimAutoreleasedReturnValue(), (v42 = v41) != 0))
          {
            v43 = [v41 valueForKey:SSVURLBagKeyMusicSubscription];
            BOOL v24 = v43 != 0;
          }
          else
          {
            if (!v25)
            {
              if (v39)
              {
                id v44 = v39;
              }
              else
              {
                id v44 = +[NSError errorWithDomain:SSErrorDomain code:100 userInfo:0];
              }
              id v25 = v44;
            }
            BOOL v24 = 1;
          }
        }
        [v26 setCanSubscribeToMusicCatalog:v24];
      }
      BOOL v27 = v25 == 0;
      goto LABEL_47;
    }
    v28 = [v25 domain];
    uint64_t v29 = SSErrorDomain;
    if (![v28 isEqualToString:SSErrorDomain]) {
      goto LABEL_30;
    }
    id v30 = [v25 code];

    if (v30 != (id)107)
    {
LABEL_31:
      id v26 = 0;
      BOOL v27 = 0;
LABEL_47:

      _Block_object_dispose(&v48, 8);
      goto LABEL_48;
    }
    v31 = [v25 userInfo];
    v28 = [v31 valueForKey:NSUnderlyingErrorKey];

    v32 = [v28 domain];
    if ([v32 isEqualToString:v29])
    {
      id v33 = [v28 code];

      if (v33 != (id)154)
      {
LABEL_30:

        goto LABEL_31;
      }
      v32 = v25;
      id v25 = v28;
    }

    goto LABEL_30;
  }
  id v25 = +[NSError errorWithDomain:SSErrorDomain code:154 userInfo:0];

  id v26 = 0;
  BOOL v27 = 0;
LABEL_48:
  v5[2](v5, v26, v25);
  [(CloudServiceCapabilitiesOperation *)self setError:v25];
  [(CloudServiceCapabilitiesOperation *)self setSuccess:v27];
}

- (id)_newResponseWithSubscriptionStatus:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SSVCloudServiceCapabilitiesResponse);
  [v4 setSubscriptionStatus:v3];
  id v5 = [v3 accountStatus];
  id v6 = [v3 carrierBundlingStatus];

  if (v5 == (id)3 || v6 == (id)4 || v6 == (id)1) {
    [v4 setSupportsMusicCatalogPlayback:1];
  }
  if (v5 == (id)3 || v6 == (id)1)
  {
    v7 = +[SSAccountStore defaultStore];
    int v8 = [v7 activeLockerAccount];

    if (v8) {
      [v4 setSupportsAddToCloudMusicLibrary:1];
    }
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end