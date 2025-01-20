@interface ICQUsageQuotaRequest
+ (void)addHeadersForPrimaryAccountToRequest:(id)a3;
+ (void)addHeadersToRequest:(id)a3 forAccount:(id)a4;
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (ICQUsageQuotaRequest)initWithAccount:(id)a3 accountStore:(id)a4 URLString:(id)a5;
- (id)urlRequest;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
@end

@implementation ICQUsageQuotaRequest

- (ICQUsageQuotaRequest)initWithAccount:(id)a3 accountStore:(id)a4 URLString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQUsageQuotaRequest;
  v10 = [(AARequest *)&v13 initWithURLString:a5];
  v11 = v10;
  if (v10)
  {
    [(ICQUsageQuotaRequest *)v10 setAccount:v8];
    [(ICQUsageQuotaRequest *)v11 setAccountStore:v9];
  }

  return v11;
}

- (id)urlRequest
{
  v8.receiver = self;
  v8.super_class = (Class)ICQUsageQuotaRequest;
  v3 = [(AARequest *)&v8 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_opt_class();
  v6 = [(ICQUsageQuotaRequest *)self account];
  [v5 addHeadersToRequest:v4 forAccount:v6];

  return v4;
}

+ (void)addHeadersToRequest:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 URL];
  objc_super v8 = [v7 scheme];
  id v9 = [v8 lowercaseString];
  int v10 = [v9 isEqualToString:@"https"];

  if (v10)
  {
    v11 = NSString;
    v12 = objc_msgSend(v6, "aa_personID");
    objc_super v13 = objc_msgSend(v6, "aa_authToken");
    v14 = [v11 stringWithFormat:@"%@:%@", v12, v13];

    v15 = [v14 dataUsingEncoding:4];
    v16 = [v15 base64EncodedStringWithOptions:0];

    v17 = [NSString stringWithFormat:@"Basic %@", v16];
    [v5 addValue:v17 forHTTPHeaderField:@"Authorization"];
  }
  objc_msgSend(v5, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v5, "ak_addAnisetteHeaders");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  v18 = [MEMORY[0x263F086E0] mainBundle];
  v19 = [v18 infoDictionary];

  v20 = NSString;
  v21 = [v19 objectForKeyedSubscript:@"CFBundleName"];
  v22 = [v19 objectForKeyedSubscript:@"CFBundleVersion"];
  v23 = [MEMORY[0x263F25820] currentInfo];
  v24 = [v23 osName];
  v25 = [MEMORY[0x263F25820] currentInfo];
  v26 = [v25 osVersion];
  v27 = [v20 stringWithFormat:@"%@/%@ %@/%@", v21, v22, v24, v26];

  [v5 addValue:v27 forHTTPHeaderField:@"User-agent"];
  id v33 = 0;
  v28 = (void *)[objc_alloc(MEMORY[0x263F559D8]) initWithAccount:v6 delegate:0 eventQueue:0 error:&v33];
  id v29 = v33;
  if (v29)
  {
    v30 = _ICQGetLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:]((uint64_t)v29, v30);
    }
  }
  else
  {
    v31 = [v28 backupDeviceUUID];
    [v5 addValue:v31 forHTTPHeaderField:@"X-Client-Backup-UUID"];

    v30 = [MEMORY[0x263F82670] currentDevice];
    v32 = [v30 sf_udidString];
    [v5 addValue:v32 forHTTPHeaderField:@"X-Client-UDID"];
  }
}

+ (void)addHeadersForPrimaryAccountToRequest:(id)a3
{
  v4 = (void *)MEMORY[0x263EFB210];
  id v5 = a3;
  id v7 = [v4 defaultStore];
  id v6 = objc_msgSend(v7, "aa_primaryAppleAccount");
  [a1 addHeadersToRequest:v5 forAccount:v6];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)addHeadersToRequest:(uint64_t)a1 forAccount:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "+[ICQUsageQuotaRequest addHeadersToRequest:forAccount:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end