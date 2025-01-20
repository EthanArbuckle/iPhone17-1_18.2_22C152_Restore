@interface NSPPvDConfigurationFetcher
- (BOOL)configurationValidated:(id)a3 withURL:(id)a4;
- (BOOL)isIdentifier:(id)a3 presentIn:(id)a4;
- (id)formatExpirationDateFrom:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)dealloc;
- (void)didReceiveProxyConfig:(id)a3 from:(id)a4;
- (void)fetchIndividualProxyConfig:(id)a3 completionHander:(id)a4;
@end

@implementation NSPPvDConfigurationFetcher

- (void)dealloc
{
  if (self)
  {
    session = self->_session;
    if (session)
    {
      [(NSURLSession *)session invalidateAndCancel];
      objc_storeStrong((id *)&self->_session, 0);
    }
    objc_storeStrong((id *)&self->_queue, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPPvDConfigurationFetcher;
  [(NSPPvDConfigurationFetcher *)&v4 dealloc];
}

- (BOOL)isIdentifier:(id)a3 presentIn:(id)a4
{
  id v5 = a3;
  v6 = [a4 host];
  if (v6) {
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)formatExpirationDateFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  id v5 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  v6 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v6];

  unsigned __int8 v7 = [v4 dateFromString:v3];

  return v7;
}

- (BOOL)configurationValidated:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"expires"];
  v9 = [(NSPPvDConfigurationFetcher *)self formatExpirationDateFrom:v8];
  v10 = +[NSDate now];
  id v11 = [v10 compare:v9];

  BOOL v12 = v11 == (id)-1;
  if (v11 != (id)-1)
  {
    v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Configuration is expired", (uint8_t *)&v18, 2u);
    }
  }
  v14 = [v6 objectForKey:@"identifier"];
  unsigned __int8 v15 = [(NSPPvDConfigurationFetcher *)self isIdentifier:v14 presentIn:v7];

  if ((v15 & 1) == 0)
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Matching identifier was not found in response: %@", (uint8_t *)&v18, 0xCu);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (void)didReceiveProxyConfig:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_64;
  }
  uint64_t v8 = [v6 objectForKey:@"identifier"];
  if (!v8) {
    goto LABEL_64;
  }
  v9 = (void *)v8;
  v10 = [v6 objectForKey:@"expires"];

  if (!v10) {
    goto LABEL_64;
  }
  id v11 = [v6 objectForKey:@"identifier"];
  if (![(NSPPvDConfigurationFetcher *)self configurationValidated:v6 withURL:v7]) {
    goto LABEL_63;
  }
  [v6 objectForKey:@"proxies"];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 countByEnumeratingWithState:&v63 objects:v69 count:16];
  v61 = v12;
  if (!v13)
  {

    id v30 = 0;
LABEL_37:
    v31 = nplog_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Did not find a masque proxy config in the list", buf, 2u);
    }
    goto LABEL_62;
  }
  id v14 = v13;
  v56 = self;
  id v57 = v7;
  v59 = 0;
  char v58 = 0;
  uint64_t v15 = *(void *)v64;
  v62 = v11;
  v16 = v12;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v64 != v15) {
        objc_enumerationMutation(v16);
      }
      int v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        id v21 = v18;
        v27 = +[NSURL URLWithString:v21];
        id v19 = v27;
        if (v27)
        {
          v20 = [v27 host];
          if (![v20 isEqualToString:v11]) {
            goto LABEL_30;
          }
          v28 = [v19 path];
          unsigned int v29 = [v28 containsString:@"/.well-known/masque/udp"];

          if (v29)
          {
            id v30 = v19;

            id v7 = v57;
            id v11 = v62;
            goto LABEL_40;
          }
          id v11 = v62;
        }
LABEL_31:

        continue;
      }
      id v19 = v18;
      v20 = [v19 objectForKeyedSubscript:@"protocol"];
      id v21 = [v19 objectForKeyedSubscript:@"proxy"];
      if (!v20) {
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      if (!v21) {
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      v22 = +[NSURL URLWithString:v21];
      v23 = v22;
      if (v22)
      {
        v24 = [v22 host];
        if (![v24 isEqualToString:v11]) {
          goto LABEL_28;
        }
        v25 = [v23 path];
        if (([v25 containsString:@"masque"] & 1) == 0)
        {

          id v11 = v62;
LABEL_28:

LABEL_29:
          v16 = v61;
LABEL_30:

          goto LABEL_31;
        }
        unsigned int v60 = [v20 isEqualToString:@"connect-udp"];

        id v11 = v62;
        if (!v60) {
          goto LABEL_29;
        }
        id v26 = v23;

        char v58 = 1;
        v59 = v26;
        v16 = v61;
        id v11 = v62;
      }

      if (v23) {
        goto LABEL_34;
      }
    }
    id v14 = [v16 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_34:

  id v7 = v57;
  id v30 = v59;
  if ((v58 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_40:
  v32 = v30;
  v31 = +[NSString stringWithFormat:@"https://%@:443", v11];
  [v7 port];
  v34 = v33 = v11;

  if (v34)
  {
    v35 = [v7 port];
    uint64_t v36 = +[NSString stringWithFormat:@"https://%@:%@", v33, v35];

    v31 = v36;
  }
  v37 = +[NSURL URLWithString:v31];
  if (v37)
  {
    if (v56
      && (id v38 = objc_loadWeakRetained((id *)&v56->_serverDelegate)) != 0
      && (v39 = v38,
          id v40 = objc_loadWeakRetained((id *)&v56->_serverDelegate),
          char v41 = objc_opt_respondsToSelector(),
          v40,
          v39,
          (v41 & 1) != 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v56->_serverDelegate);
      unsigned int v43 = [WeakRetained networkDiscoveredProxyInTrustedProxyList:v37];

      v44 = nplog_obj();
      v45 = v44;
      if (v43)
      {
        id v11 = v62;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "proxyURL found, setting up configuration", buf, 2u);
        }

        id v30 = v32;
        v46 = [v32 path];
        v45 = v46;
        id v7 = v57;
        if (v46
          && (([v46 containsString:@"/.well-known/masque/udp"] & 1) != 0
           || [v45 containsString:@"masque"]))
        {
          id v47 = objc_alloc_init((Class)NSPPrivacyProxyProxyInfo);
          [v47 setProxyURL:v31];
          [v47 setProxyVersion:@"RFC9298"];
          [v47 setProxyHop:1];
          [v47 setSupportsFallback:0];
          [v47 setVendor:v62];
          [v47 setTcpProxyFqdn:v31];
          v48 = +[NSData data];
          [v47 setTokenKeyInfo:v48];

          p_delegate = (id *)&v56->_delegate;
          id v50 = objc_loadWeakRetained((id *)&v56->_delegate);
          if (v50)
          {
            v51 = v50;
            id v52 = objc_loadWeakRetained(p_delegate);
            char v53 = objc_opt_respondsToSelector();

            if (v53)
            {
              id v54 = objc_loadWeakRetained(p_delegate);
              [v54 setupMasqueProxyWith:v47];
            }
          }

          id v7 = v57;
LABEL_59:
          id v11 = v62;
          goto LABEL_60;
        }
        goto LABEL_61;
      }
      id v11 = v62;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v37;
        v55 = "proxyURL not found in the allow list: %@";
        goto LABEL_68;
      }
    }
    else
    {
      v45 = nplog_obj();
      id v11 = v62;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v37;
        v55 = "Something went wrong. Could not confirm the proxyURL: %@";
LABEL_68:
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
      }
    }
    id v7 = v57;
    goto LABEL_60;
  }
  v45 = nplog_obj();
  if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    goto LABEL_59;
  }
  *(_DWORD *)buf = 138412290;
  id v11 = v62;
  v68 = v62;
  _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Could not create a proxyURL from identifier: %@", buf, 0xCu);
LABEL_60:
  id v30 = v32;
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
}

- (void)fetchIndividualProxyConfig:(id)a3 completionHander:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100005D7C;
  v18[4] = sub_100050150;
  id v19 = 0;
  uint64_t v8 = +[NSURLRequest requestWithURL:v6 cachePolicy:1 timeoutInterval:30.0];
  if (self) {
    session = self->_session;
  }
  else {
    session = 0;
  }
  v10 = session;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100050158;
  v14[3] = &unk_100105E38;
  id v11 = v6;
  id v15 = v11;
  v17 = v18;
  id v12 = v7;
  id v16 = v12;
  id v13 = [(NSURLSession *)v10 dataTaskWithRequest:v8 completionHandler:v14];

  [v13 resume];
  _Block_object_dispose(v18, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v20 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  v9 = [v20 protectionSpace];
  v10 = [v9 authenticationMethod];
  if ([v10 isEqualToString:NSURLAuthenticationMethodServerTrust]) {
    BOOL v11 = self == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_10;
  }
  p_serverDelegate = &self->_serverDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v14 = WeakRetained;
  id v15 = objc_loadWeakRetained((id *)p_serverDelegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  id v16 = objc_loadWeakRetained((id *)p_serverDelegate);
  unsigned int v17 = [v16 canIgnoreInvalidCertsOnInternalBuild];

  if (v17)
  {
    int v18 = [v20 protectionSpace];
    id v19 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v18 serverTrust]);
    v8[2](v8, 0, v19);

    goto LABEL_12;
  }
LABEL_11:
  v8[2](v8, 1, 0);
LABEL_12:
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PvD configuration fetch is waiting for connectivity", v5, 2u);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end