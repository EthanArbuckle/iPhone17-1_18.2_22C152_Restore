@interface _ICQMegaBackupUpdateStatusRequest
+ (id)updateStatusRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9;
- (ACAccount)account;
- (NSDate)expirationDate;
- (NSString)deviceBackupUUID;
- (id)additionalRequestHeaders;
- (id)bodyJSON;
- (id)handleResponse:(id)a3 body:(id)a4;
- (int64_t)status;
- (void)addAdditionalRequestHeaders:(id)a3;
@end

@implementation _ICQMegaBackupUpdateStatusRequest

+ (id)updateStatusRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  uint64_t v21 = [objc_alloc((Class)a1) initWithRequestURL:v20 URLSession:v19 queue:v18];

  if (v21)
  {
    objc_storeStrong((id *)(v21 + 56), a3);
    objc_storeStrong((id *)(v21 + 64), a4);
    *(void *)(v21 + 72) = a5;
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
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(_ICQMegaBackupUpdateStatusRequest *)self status];
  id v4 = @"end";
  if (v3 != 1) {
    id v4 = 0;
  }
  if (!v3) {
    id v4 = @"start";
  }
  deviceBackupUUID = self->_deviceBackupUUID;
  v8[0] = @"deviceBackupUdid";
  v8[1] = @"status";
  v9[0] = deviceBackupUUID;
  v9[1] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  return v6;
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupUpdateStatusRequest;
  id v4 = a3;
  [(_ICQMegaBackupNetworkRequest *)&v7 addAdditionalRequestHeaders:v4];
  v5 = [ICQRequestProvider alloc];
  v6 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", self->_account, v7.receiver, v7.super_class);
  [(ICQRequestProvider *)v6 addBasicAndCloudBackupHeadersToRequest:v4];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  v5 = [a4 objectForKeyedSubscript:@"expirationDate"];
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v5, "integerValue"));
    objc_super v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v7;
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

- (int64_t)status
{
  return self->_status;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end