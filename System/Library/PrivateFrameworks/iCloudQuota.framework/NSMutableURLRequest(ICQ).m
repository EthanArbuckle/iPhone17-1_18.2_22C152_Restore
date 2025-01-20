@interface NSMutableURLRequest(ICQ)
- (BOOL)icq_hasAuthHeaders;
- (id)icq_sanitizedHeadersForDynamicUI;
- (void)icq_addHeadersForUpgradeWithCompletion:()ICQ;
- (void)icq_renewAuthorizationHeadersForAccount:()ICQ store:completion:;
@end

@implementation NSMutableURLRequest(ICQ)

- (id)icq_sanitizedHeadersForDynamicUI
{
  v2 = objc_opt_new();
  v3 = [a1 allHTTPHeaderFields];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__NSMutableURLRequest_ICQ__icq_sanitizedHeadersForDynamicUI__block_invoke;
  v6[3] = &unk_1E6A538D8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (void)icq_addHeadersForUpgradeWithCompletion:()ICQ
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getINDaemonConnectionClass_softClass_3;
  uint64_t v15 = getINDaemonConnectionClass_softClass_3;
  if (!getINDaemonConnectionClass_softClass_3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getINDaemonConnectionClass_block_invoke_3;
    v11[3] = &unk_1E6A52090;
    v11[4] = &v12;
    __getINDaemonConnectionClass_block_invoke_3((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = objc_alloc_init(v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke;
  v9[3] = &unk_1E6A53900;
  v9[4] = a1;
  id v10 = v4;
  id v8 = v4;
  [v7 commonHeadersForRequest:a1 withCompletion:v9];
}

- (void)icq_renewAuthorizationHeadersForAccount:()ICQ store:completion:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v9, "aa_primaryAppleAccount");
  uint64_t v12 = v11;
  if (v8)
  {
    v13 = objc_msgSend(v11, "aa_altDSID");
    uint64_t v14 = objc_msgSend(v8, "aa_altDSID");

    if (v13 != v14)
    {
      uint64_t v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:]((uint64_t)a1, v15);
      }
LABEL_5:

      v10[2](v10, 0);
      goto LABEL_13;
    }
  }
  else
  {
    v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "Account not provided, skipping check", buf, 2u);
    }
  }
  if (objc_msgSend(a1, "icq_hasAuthHeaders"))
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = a1;
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "request already has auth headers. request: %@", buf, 0xCu);
    }

    v10[2](v10, 1);
  }
  else
  {
    uint64_t v15 = _ICQGetLogSystem();
    BOOL v18 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Missing auth headers and no account provided or found, unable to renew credentials.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v27 = a1;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Missing auth header or client info header, attempting to renew credentials. request: %@", buf, 0xCu);
    }

    uint64_t v19 = *MEMORY[0x1E4F17A30];
    v24[0] = *MEMORY[0x1E4F17A40];
    v24[1] = v19;
    v25[0] = MEMORY[0x1E4F1CC28];
    v25[1] = MEMORY[0x1E4F1CC38];
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__NSMutableURLRequest_ICQ__icq_renewAuthorizationHeadersForAccount_store_completion___block_invoke;
    v21[3] = &unk_1E6A53928;
    v21[4] = a1;
    id v22 = v12;
    v23 = v10;
    [v9 renewCredentialsForAccount:v22 options:v20 completion:v21];
  }
LABEL_13:
}

- (BOOL)icq_hasAuthHeaders
{
  v2 = [a1 valueForHTTPHeaderField:@"Authorization"];
  if (v2)
  {
    v3 = [a1 valueForHTTPHeaderField:@"X-MMe-Client-Info"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)icq_renewAuthorizationHeadersForAccount:()ICQ store:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "%s account change detected while validating auth headers. request %@", (uint8_t *)&v2, 0x16u);
}

@end