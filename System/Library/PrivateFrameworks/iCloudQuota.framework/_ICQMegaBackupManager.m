@interface _ICQMegaBackupManager
- (id)_extendExpirationURLForAccount:(id)a3;
- (id)_quotaBackupCheckURLForAccount:(id)a3;
- (id)_updateStatusURLForAccount:(id)a3;
- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)updateMegaBackupStatusForAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation _ICQMegaBackupManager

- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_queue_completion___block_invoke;
  v14[3] = &unk_1E6A52168;
  id v15 = v12;
  id v13 = v12;
  [(_ICQMegaBackupManager *)self requestMegaBackupForAccount:a3 deviceBackupUUID:a4 deviceTotalUsedSpaceInBytes:a5 entryMethod:0 deepLinkURL:0 queue:a6 completion:v14];
}

- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke;
  v27[3] = &unk_1E6A521B8;
  v27[4] = self;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v33 = v20;
  int64_t v34 = a6;
  id v31 = v18;
  id v32 = v19;
  v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v20;
  id v26 = v15;
  dispatch_async(v21, v27);
}

- (id)_quotaBackupCheckURLForAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  v4 = [v3 propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  v5 = [v4 objectForKey:@"quotaBackupCheckURL"];

  if (v5)
  {
    v6 = NSString;
    v7 = [v3 aa_altDSID];
    v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);

    v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "invalid URL string %@ for quotaBackupCheckURL account %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "missing quotaBackupCheckURL for account %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)updateMegaBackupStatusForAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke;
  v20[3] = &unk_1E6A52208;
  v20[4] = self;
  id v21 = v12;
  id v24 = v15;
  int64_t v25 = a5;
  id v22 = v13;
  id v23 = v14;
  __int16 v16 = v14;
  id v17 = v13;
  id v18 = v15;
  id v19 = v12;
  dispatch_async(v16, v20);
}

- (id)_updateStatusURLForAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  v4 = [v3 propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  v5 = [v4 objectForKey:@"quotaBackupUpdateStatusURL"];

  if (v5)
  {
    v6 = NSString;
    v7 = [v3 aa_altDSID];
    v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);

    v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Invalid URL string for update status: %@, account %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "missing updateStatusURL for account %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke;
  v22[3] = &unk_1E6A52258;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v16;
  id v21 = v12;
  dispatch_async(v17, v22);
}

- (id)_extendExpirationURLForAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  v4 = [v3 propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  v5 = [v4 objectForKey:@"quotaBackupExtensionURL"];

  if (v5)
  {
    v6 = NSString;
    v7 = [v3 aa_altDSID];
    v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);

    v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Invalid URL string for extend expiration: %@, account %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "missing extendExpirationURL for account: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

@end