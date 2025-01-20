@interface TUDialRequest
+ (id)dialRequestForCallProvider:(id)a3 handle:(id)a4;
+ (id)dialRequestForUserActivity:(id)a3 callProviderManager:(id)a4;
- (BOOL)canMakeEmergencyCallForSenderIdentity:(id)a3;
- (id)dialRequestByResolvingDialTypeUsingSenderIdentityClient:(id)a3;
@end

@implementation TUDialRequest

+ (id)dialRequestForCallProvider:(id)a3 handle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 type];
  if ([v5 supportsHandleType:v7])
  {
    id v8 = [objc_alloc((Class)TUDialRequest) initWithProvider:v5];
    [v8 setHandle:v6];
    [v8 setOriginatingUIType:1];
  }
  else
  {
    v9 = sub_100012C68();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006ABCC(v5, (uint64_t)v7, v9);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)dialRequestForUserActivity:(id)a3 callProviderManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100012C68();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for user activity (%@)", (uint8_t *)&v16, 0xCu);
  }

  v9 = [v6 userInfo];
  if (v9)
  {
    v10 = [v6 callProviderIdentifier];
    if (v10)
    {
      v11 = [v7 providerWithIdentifier:v10];
      v12 = [v6 handle];
      LOBYTE(v16) = 0;
      if ((v11
         || (objc_msgSend(v7, "providerWithService:video:", objc_msgSend(v6, "callService"), &v16),
             (v11 = objc_claimAutoreleasedReturnValue()) != 0))
        && v12)
      {
        v13 = [a1 dialRequestForCallProvider:v11 handle:v12];
        [v13 setVideo:v16];
        [v13 setOriginatingUIType:37];
      }
      else
      {
        v14 = sub_100012C68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10006AD24((uint64_t)v10, v14);
        }

        v13 = 0;
      }
    }
    else
    {
      v11 = sub_100012C68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10006ACE0(v11);
      }
      v13 = 0;
    }
  }
  else
  {
    v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006AC9C(v10);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)canMakeEmergencyCallForSenderIdentity:(id)a3
{
  id v3 = a3;
  if (sub_1000278E0())
  {
    v4 = [v3 UUID];
    unsigned int v5 = +[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:v4];

    id v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"cannot";
      if (v5) {
        CFStringRef v7 = @"can";
      }
      int v9 = 138412546;
      CFStringRef v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is in airplane mode and %@ make an emergency call using sender identity %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)dialRequestByResolvingDialTypeUsingSenderIdentityClient:(id)a3
{
  id v4 = a3;
  id v5 = [(TUDialRequest *)self copy];
  id v6 = [(TUDialRequest *)self handle];
  CFStringRef v7 = [v6 value];
  if ([v7 length])
  {
  }
  else
  {
    id v8 = [(TUDialRequest *)self dialType];

    if (v8 != (id)1) {
      goto LABEL_23;
    }
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000386EC;
  v28[3] = &unk_1000A2520;
  id v29 = v4;
  v30 = self;
  int v9 = objc_retainBlock(v28);
  CFStringRef v10 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
  if (!v10) {
    goto LABEL_11;
  }
  __int16 v11 = [(TUDialRequest *)self provider];
  id v12 = [v11 senderIdentityForAccountUUID:v10];

  if (!v12)
  {
    v14 = sub_100012C68();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not find a sender identity that contains account UUID %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v13 = ((void (*)(void *, id, void *))v9[2])(v9, v5, v12);

  if (!v13)
  {
LABEL_11:
    v15 = [(TUDialRequest *)self provider];
    int v16 = [v15 prioritizedSenderIdentities];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = ((void (*)(void *, id, void))v9[2])(v9, v5, *(void *)(*((void *)&v24 + 1) + 8 * i));
          if (v22)
          {
            v13 = (void *)v22;
            goto LABEL_21;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    v13 = 0;
LABEL_21:
  }
LABEL_23:

  return v5;
}

@end