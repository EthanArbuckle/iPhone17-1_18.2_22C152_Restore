@interface _ICQMegaBackupExtendExpirationRequest
+ (id)extendExpirationRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9;
- (ACAccount)account;
- (BOOL)isExtensionAllowed;
- (NSDate)requestedExpirationDate;
- (NSDate)updatedExpirationDate;
- (NSString)deviceBackupUUID;
- (id)additionalRequestHeaders;
- (id)bodyJSON;
- (id)handleResponse:(id)a3 body:(id)a4;
- (void)addAdditionalRequestHeaders:(id)a3;
@end

@implementation _ICQMegaBackupExtendExpirationRequest

+ (id)extendExpirationRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v23 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  v21 = (id *)[objc_alloc((Class)a1) initWithRequestURL:v20 URLSession:v19 queue:v18];

  if (v21)
  {
    objc_storeStrong(v21 + 8, a3);
    objc_storeStrong(v21 + 9, a4);
    objc_storeStrong(v21 + 10, a5);
  }

  return v21;
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
  v12[2] = *MEMORY[0x1E4F143B8];
  requestedExpirationDate = self->_requestedExpirationDate;
  if (requestedExpirationDate)
  {
    deviceBackupUUID = self->_deviceBackupUUID;
    v11[0] = @"deviceBackupUdid";
    v11[1] = @"newExpirationDate";
    v12[0] = deviceBackupUUID;
    id v4 = NSNumber;
    [(NSDate *)requestedExpirationDate timeIntervalSince1970];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    v12[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }
  else
  {
    v7 = self->_deviceBackupUUID;
    v9 = @"deviceBackupUdid";
    id v10 = v7;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  return v6;
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupExtendExpirationRequest;
  id v4 = a3;
  [(_ICQMegaBackupNetworkRequest *)&v7 addAdditionalRequestHeaders:v4];
  v5 = [ICQRequestProvider alloc];
  v6 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", self->_account, v7.receiver, v7.super_class);
  [(ICQRequestProvider *)v6 addBasicAndCloudBackupHeadersToRequest:v4];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"extensionAllowed"];
  self->_extensionAllowed = [v6 BOOLValue];

  objc_super v7 = [v5 objectForKeyedSubscript:@"newExpirationDate"];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    updatedExpirationDate = self->_updatedExpirationDate;
    self->_updatedExpirationDate = v9;
  }
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

- (NSDate)requestedExpirationDate
{
  return self->_requestedExpirationDate;
}

- (BOOL)isExtensionAllowed
{
  return self->_extensionAllowed;
}

- (NSDate)updatedExpirationDate
{
  return self->_updatedExpirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedExpirationDate, 0);
  objc_storeStrong((id *)&self->_requestedExpirationDate, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end