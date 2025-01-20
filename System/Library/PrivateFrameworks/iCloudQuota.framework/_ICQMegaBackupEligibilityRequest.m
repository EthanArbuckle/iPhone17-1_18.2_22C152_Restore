@interface _ICQMegaBackupEligibilityRequest
+ (id)eligibilityRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 requestURL:(id)a8 URLSession:(id)a9 queue:(id)a10 error:(id *)a11;
- (ACAccount)account;
- (BOOL)isBackupAllowed;
- (BOOL)needsTemporaryStorage;
- (NSNumber)daysUntilExpiration;
- (NSNumber)deviceTotalUsedSpaceInBytes;
- (NSString)deepLinkURL;
- (NSString)deviceBackupUUID;
- (id)additionalRequestHeaders;
- (id)bodyJSON;
- (id)handleResponse:(id)a3 body:(id)a4;
- (int64_t)entryMethod;
- (void)addAdditionalRequestHeaders:(id)a3;
- (void)bodyJSON;
@end

@implementation _ICQMegaBackupEligibilityRequest

+ (id)eligibilityRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 requestURL:(id)a8 URLSession:(id)a9 queue:(id)a10 error:(id *)a11
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v17 = a7;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  uint64_t v21 = [objc_alloc((Class)a1) initWithRequestURL:v20 URLSession:v19 queue:v18];

  if (v21)
  {
    objc_storeStrong((id *)(v21 + 64), a3);
    objc_storeStrong((id *)(v21 + 72), a4);
    objc_storeStrong((id *)(v21 + 80), a5);
    *(void *)(v21 + 88) = a6;
    objc_storeStrong((id *)(v21 + 96), a7);
  }

  return (id)v21;
}

- (id)additionalRequestHeaders
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EF58]);
  id v8 = 0;
  v3 = [v2 anisetteDataWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28E88], "ak_anisetteHeadersWithData:", v3);
  }
  else
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get anisette data: %@", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)bodyJSON
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  deviceBackupUUID = self->_deviceBackupUUID;
  v5 = [(NSNumber *)self->_deviceTotalUsedSpaceInBytes stringValue];
  v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", deviceBackupUUID, @"deviceBackupUdid", v5, @"deviceTotalUsedSpace", 0);

  if (self->_entryMethod)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 setObject:v7 forKeyedSubscript:@"entryMethodType"];

    if (self->_entryMethod == 2)
    {
      deepLinkURL = self->_deepLinkURL;
      if (deepLinkURL)
      {
        [v6 setObject:deepLinkURL forKeyedSubscript:@"entryMethodURL"];
      }
      else
      {
        v9 = _ICQGetLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[_ICQMegaBackupEligibilityRequest bodyJSON](v9);
        }
      }
    }
  }
  return v6;
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupEligibilityRequest;
  id v4 = a3;
  [(_ICQMegaBackupNetworkRequest *)&v7 addAdditionalRequestHeaders:v4];
  v5 = [ICQRequestProvider alloc];
  v6 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", self->_account, v7.receiver, v7.super_class);
  [(ICQRequestProvider *)v6 addBasicAndCloudBackupHeadersToRequest:v4];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"needsTemporaryStorage"];
  self->_needsTemporaryStorage = [v6 BOOLValue];

  objc_super v7 = [v5 objectForKeyedSubscript:@"durationInDays"];
  daysUntilExpiration = self->_daysUntilExpiration;
  self->_daysUntilExpiration = v7;

  v9 = [v5 objectForKeyedSubscript:@"backupStatus"];

  BOOL v10 = !self->_needsTemporaryStorage && v9 == 0;
  if (v10 || ([v9 isEqualToString:@"ALLOWED"] & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    if (![v9 isEqualToString:@"NOT_ALLOWED"]) {
      goto LABEL_8;
    }
    BOOL v11 = 0;
  }
  self->_backupAllowed = v11;
LABEL_8:

  return 0;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)deviceBackupUUID
{
  return self->_deviceBackupUUID;
}

- (NSNumber)deviceTotalUsedSpaceInBytes
{
  return self->_deviceTotalUsedSpaceInBytes;
}

- (int64_t)entryMethod
{
  return self->_entryMethod;
}

- (NSString)deepLinkURL
{
  return self->_deepLinkURL;
}

- (BOOL)isBackupAllowed
{
  return self->_backupAllowed;
}

- (BOOL)needsTemporaryStorage
{
  return self->_needsTemporaryStorage;
}

- (NSNumber)daysUntilExpiration
{
  return self->_daysUntilExpiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysUntilExpiration, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_deviceTotalUsedSpaceInBytes, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)bodyJSON
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D5851000, log, OS_LOG_TYPE_FAULT, "deepLinkURL must be non-nil when entryMethod is _ICQMegaBackupEntryMethodDeepLink", v1, 2u);
}

@end