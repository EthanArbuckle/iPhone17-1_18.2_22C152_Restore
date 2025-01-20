@interface TRAccountManager
+ (id)_idmsAccountForAccountWithUsername:(id)a3 altDSID:(id)a4 DSID:(id)a5;
+ (id)_idmsAccountForGameCenterService;
+ (id)_idmsAccountForICloudService;
+ (id)_idmsAccountForITunesService;
+ (id)_primaryGameCenterAccount;
+ (id)_primaryICloudAccount;
+ (id)_primaryITunesAccount;
+ (id)associatedAccountServicesForIDMSAccount:(id)a3;
+ (id)idmsAccountForAccountService:(unint64_t)a3;
@end

@implementation TRAccountManager

+ (id)idmsAccountForAccountService:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 3uLL:
      v4 = [a1 _idmsAccountForGameCenterService];
      break;
    case 2uLL:
      v4 = [a1 _idmsAccountForITunesService];
      break;
    case 1uLL:
      v4 = [a1 _idmsAccountForICloudService];
      break;
    default:
      if (_TRLogEnabled == 1)
      {
        v5 = TRLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = StringFromTRAccountService(a3);
          int v8 = 138412290;
          v9 = v6;
          _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "Unknown account service: %@", (uint8_t *)&v8, 0xCu);
        }
      }
      v4 = 0;
      break;
  }
  return v4;
}

+ (id)_primaryICloudAccount
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

+ (id)_primaryITunesAccount
{
  v2 = [MEMORY[0x263F7B0E8] defaultStore];
  v3 = [v2 activeAccount];

  return v3;
}

+ (id)_primaryGameCenterAccount
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEE0]];
  v4 = [v2 accountsWithAccountType:v3];
  v5 = [v4 firstObject];

  return v5;
}

+ (id)_idmsAccountForICloudService
{
  v3 = [a1 _primaryICloudAccount];
  v4 = [v3 username];
  v5 = objc_msgSend(v3, "aa_altDSID");
  v6 = [v3 accountPropertyForKey:@"DSID"];
  v7 = [a1 _idmsAccountForAccountWithUsername:v4 altDSID:v5 DSID:v6];

  return v7;
}

+ (id)_idmsAccountForITunesService
{
  v3 = [a1 _primaryITunesAccount];
  v4 = [v3 accountName];
  v5 = [v3 altDSID];
  v6 = [v3 uniqueIdentifier];
  v7 = [a1 _idmsAccountForAccountWithUsername:v4 altDSID:v5 DSID:v6];

  return v7;
}

+ (id)_idmsAccountForGameCenterService
{
  v3 = [a1 _primaryGameCenterAccount];
  v4 = [v3 username];
  v5 = objc_msgSend(v3, "aa_altDSID");
  v6 = [v3 accountPropertyForKey:@"DSID"];
  v7 = [a1 _idmsAccountForAccountWithUsername:v4 altDSID:v5 DSID:v6];

  return v7;
}

+ (id)_idmsAccountForAccountWithUsername:(id)a3 altDSID:(id)a4 DSID:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v27 = a4;
  id v7 = a5;
  int v8 = [MEMORY[0x263EFB210] defaultStore];
  v9 = [v8 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF00]];
  uint64_t v10 = [v8 accountsWithAccountType:v9];
  if (_TRLogEnabled == 1)
  {
    v11 = TRLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[TRAccountManager _idmsAccountForAccountWithUsername:altDSID:DSID:]";
      __int16 v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "%s accounts: %@.", buf, 0x16u);
    }
  }
  if ([v10 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v23 = v10;
      v24 = v9;
      v25 = v8;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "aa_altDSID");
          if (v18 && [v27 isEqualToString:v18])
          {
            id v21 = v17;
            goto LABEL_29;
          }
          v19 = [v17 accountPropertyForKey:@"DSID"];
          if (v19 && [v7 isEqualToNumber:v19])
          {
            id v21 = v17;
            goto LABEL_28;
          }
          v20 = [v17 username];
          if (v20 && ([v26 isEqualToString:v20] & 1) != 0)
          {
            id v21 = v17;

LABEL_28:
LABEL_29:

            goto LABEL_30;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v21 = 0;
LABEL_30:
      v9 = v24;
      int v8 = v25;
      uint64_t v10 = v23;
      goto LABEL_31;
    }
  }
  else
  {
    if (_TRLogEnabled != 1)
    {
      id v21 = 0;
      goto LABEL_32;
    }
    v12 = TRLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[TRAccountManager _idmsAccountForAccountWithUsername:altDSID:DSID:]";
      _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "%s No IDMS accounts found.", buf, 0xCu);
    }
  }
  id v21 = 0;
LABEL_31:

LABEL_32:
  return v21;
}

+ (id)associatedAccountServicesForIDMSAccount:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  v6 = [a1 _idmsAccountForICloudService];
  id v7 = [v6 identifier];
  int v8 = [v4 identifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    [v5 addObject:&unk_26C58CD28];
  }
  uint64_t v10 = [a1 _idmsAccountForITunesService];
  v11 = [v10 identifier];
  v12 = [v4 identifier];
  int v13 = [v11 isEqualToString:v12];

  if (v13) {
    [v5 addObject:&unk_26C58CD40];
  }
  uint64_t v14 = [a1 _idmsAccountForGameCenterService];
  uint64_t v15 = [v14 identifier];
  v16 = [v4 identifier];
  int v17 = [v15 isEqualToString:v16];

  if (v17) {
    [v5 addObject:&unk_26C58CD58];
  }
  v18 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v18;
}

@end