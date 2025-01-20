@interface AMFIService
- (BOOL)verifyBoolEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (void)commitProfileForUuid:(id)a3 withReply:(id)a4;
- (void)getSEPStateWithReply:(id)a3;
- (void)getStagedProfileWithReply:(id)a3;
- (void)initiateDataMigrationWithReply:(id)a3;
- (void)initiateDeveloperModeDaemonsWithReply:(id)a3;
- (void)removeManagedStateWithReply:(id)a3;
- (void)removeTrustforUuid:(id)a3 withReply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDemoState:(unsigned int)a3 withReply:(id)a4;
- (void)setManagedState:(id)a3 withReply:(id)a4;
- (void)setSupervisedState:(unsigned int)a3 withReply:(id)a4;
- (void)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5 withReply:(id)a6;
- (void)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withReply:(id)a6;
- (void)stageProfileForUuid:(id)a3 withReply:(id)a4;
@end

@implementation AMFIService

- (BOOL)verifyBoolEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(AMFIService *)self connection];
  v6 = [v5 valueForEntitlement:v4];

  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019920();
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019994();
    }
LABEL_8:
    unsigned __int8 v7 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v7 = [v6 BOOLValue];
LABEL_9:

  return v7;
}

- (void)getSEPStateWithReply:(id)a3
{
  v3 = a3;
  char v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v4 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  id v11 = 0;
  v5 = [v4 dataForKey:15 error:&v11];
  id v6 = v11;
  unsigned __int8 v7 = off_100028EF0;
  if (v6)
  {
    v8 = v6;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019A08();
    }
    id v9 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[AMFIService getSEPStateWithReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] returning SEP state | [exists: %u]", buf, 0x12u);
    }
    if (v5) {
      [v5 getBytes:&v15 length:49];
    }
    id v9 = 0;
  }
  v10 = (void (*)(void *, unsigned char *, id))v3[2];
  *(_OWORD *)buf = v15;
  *(_OWORD *)&buf[16] = v16;
  long long v13 = v17;
  char v14 = v18;
  v10(v3, buf, v9);
}

- (void)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, void *, id))a6;
  long long v39 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  int v38 = 2;
  DWORD1(v39) = 5;
  if (![(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-trust"])
  {
    id v15 = objc_alloc((Class)AMFIError);
    uint64_t v16 = -440;
LABEL_17:
    id v30 = [v15 initWithAMFIErrorCode:v16 withURL:0];
    id v26 = 0;
    v28 = 0;
    goto LABEL_18;
  }
  if (!v10)
  {
    long long v17 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019A7C(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_16;
  }
  id v13 = [v10 lengthOfBytesUsingEncoding:4];
  int v14 = (int)v13;
  if ((unint64_t)v13 >= 0x81)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019AF4();
    }
LABEL_16:
    id v15 = objc_alloc((Class)AMFIError);
    uint64_t v16 = -406;
    goto LABEL_17;
  }
  v25 = off_100028EF0;
  if (a4 - 1 >= 2)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019B74();
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[AMFIService signTeamID:withSignType:withLAContext:withReply:]";
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 1024;
    unsigned int v37 = a4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%s] creating auxiliary signature: %@ | %u", buf, 0x1Cu);
  }
  DWORD2(v39) = a4;
  HIDWORD(v47) = v14;
  [v10 UTF8String];
  __memcpy_chk();
  id v26 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:v11];
  v27 = +[NSData dataWithBytes:&v38 length:148];
  id v31 = 0;
  v28 = [v26 exchangeData:v27 forKey:13 error:&v31];
  id v29 = v31;

  if (v29)
  {
    id v30 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
  }
  else
  {
    id v30 = 0;
  }
LABEL_18:
  v12[2](v12, v28, v30);
}

- (void)setSupervisedState:(unsigned int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  long long v19 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  int v18 = 2;
  DWORD1(v19) = 2;
  DWORD2(v19) = a3;
  unsigned __int8 v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[AMFIService setSupervisedState:withReply:]";
    __int16 v16 = 1024;
    unsigned int v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] setting state: %u", buf, 0x12u);
  }
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-supervised"])
  {
    id v8 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
    id v9 = +[NSData dataWithBytes:&v18 length:148];
    id v13 = 0;
    id v10 = [v8 exchangeData:v9 forKey:13 error:&v13];
    id v11 = v13;

    if (v11)
    {
      id v12 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
    id v8 = 0;
  }
  v6[2](v6, v12);
}

- (void)setDemoState:(unsigned int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  long long v19 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  int v18 = 2;
  DWORD1(v19) = 3;
  DWORD2(v19) = a3;
  unsigned __int8 v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[AMFIService setDemoState:withReply:]";
    __int16 v16 = 1024;
    unsigned int v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] setting state: %u", buf, 0x12u);
  }
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-demo"])
  {
    id v8 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
    id v9 = +[NSData dataWithBytes:&v18 length:148];
    id v13 = 0;
    id v10 = [v8 exchangeData:v9 forKey:13 error:&v13];
    id v11 = v13;

    if (v11)
    {
      id v12 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
    id v8 = 0;
  }
  v6[2](v6, v12);
}

- (void)setManagedState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  memset(&v21[6], 170, 100);
  *(_OWORD *)long long v21 = xmmword_10001DA08;
  memset(&v21[2], 0, 32);
  id v8 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v20 = "-[AMFIService setManagedState:withReply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: enabling MDM state", buf, 0xCu);
  }
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-managed"])
  {
    if (v6 && ([v6 isCredentialSet:-1] & 1) == 0)
    {
      id v9 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v20 = "-[AMFIService setManagedState:withReply:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: attempting to set password credential with empty password", buf, 0xCu);
      }
      id v10 = [&stru_100025C90 dataUsingEncoding:4];
      id v18 = 0;
      [v6 setCredential:v10 type:-1 error:&v18];
      id v11 = v18;

      if (v11 && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019BF4();
      }
    }
    id v12 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:v6];
    id v13 = +[NSData dataWithBytes:v21 length:148];
    id v17 = 0;
    id v14 = [v12 exchangeData:v13 forKey:13 error:&v17];
    id v15 = v17;

    if (v15)
    {
      id v16 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
    id v12 = 0;
  }
  v7[2](v7, v16);
}

- (void)removeManagedStateWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  memset(&v14[6], 170, 100);
  *(_OWORD *)id v14 = xmmword_10001DA9C;
  memset(&v14[2], 0, 32);
  v5 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[AMFIService removeManagedStateWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: disabling MDM state", buf, 0xCu);
  }
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-managed"])
  {
    id v6 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
    unsigned __int8 v7 = +[NSData dataWithBytes:v14 length:148];
    id v11 = 0;
    id v8 = [v6 exchangeData:v7 forKey:13 error:&v11];
    id v9 = v11;

    if (v9)
    {
      id v10 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-408 withURL:0];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
    id v6 = 0;
  }
  v4[2](v4, v10);
}

- (void)initiateDataMigrationWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.data-migration"])
  {
    sub_10000AE14();
    id v5 = 0;
  }
  else
  {
    id v5 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
  }
  id v6 = v5;
  v4[2](v4);
}

- (void)initiateDeveloperModeDaemonsWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if ([(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.developer-mode-control"])
  {
    id v5 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[AMFIService initiateDeveloperModeDaemonsWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: attempting to kick-off developer-mode-daemons", (uint8_t *)&v7, 0xCu);
    }
    sub_100002BB8();
    id v6 = 0;
  }
  else
  {
    id v6 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
  }
  v4[2](v4, v6);
}

- (void)stageProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, id))a4;
  if (![(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.schedule-profile"])
  {
    id v11 = objc_alloc((Class)AMFIError);
    uint64_t v12 = -440;
LABEL_16:
    id v10 = [v11 initWithAMFIErrorCode:v12 withURL:0];
    goto LABEL_17;
  }
  id v8 = off_100028EF0;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019C68(v8, v13, v14, v15, v16, v17, v18, v19);
    }
    id v11 = objc_alloc((Class)AMFIError);
    uint64_t v12 = -406;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v24 = "-[AMFIService stageProfileForUuid:withReply:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] attempting to stage: %@", buf, 0x16u);
  }
  id v22 = 0;
  [v6 writeToFile:@"/private/var/db/amfid/UPPStaging.plist" atomically:1 encoding:4 error:&v22];
  id v9 = v22;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019D60();
    }
    goto LABEL_17;
  }
  int v20 = AMFIArmSecurityBootMode();
  long long v21 = off_100028EF0;
  if (v20)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019CE0();
    }
    id v11 = objc_alloc((Class)AMFIError);
    uint64_t v12 = -401;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v24 = "-[AMFIService stageProfileForUuid:withReply:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%s] successfully staged UUID: %@", buf, 0x16u);
  }
  id v10 = 0;
LABEL_17:
  v7[2](v7, v10);
}

- (void)getStagedProfileWithReply:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  id v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[AMFIService getStagedProfileWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%s] acquiring staged UUID", buf, 0xCu);
  }
  id v7 = 0;
  id v5 = +[NSString stringWithContentsOfFile:@"/private/var/db/amfid/UPPStaging.plist" encoding:4 error:&v7];
  id v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
    sub_100019DD4();
  }
  v3[2](v3, v5, v6);
}

- (void)commitProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100006054;
  v31[4] = sub_100006064;
  id v32 = (id)0xAAAAAAAAAAAAAAAALL;
  id v8 = v6;
  id v32 = v8;
  if (![(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.commit-profile"])
  {
    id v15 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-440 withURL:0];
    goto LABEL_8;
  }
  id v9 = off_100028EF0;
  BOOL v10 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v34 = "-[AMFIService commitProfileForUuid:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove staged UUID", buf, 0xCu);
    }
    uint64_t v17 = +[NSFileManager defaultManager];
    unsigned int v18 = [v17 fileExistsAtPath:@"/private/var/db/amfid/UPPStaging.plist"];

    if (!v18)
    {
      uint64_t v16 = 0;
      goto LABEL_27;
    }
    uint64_t v19 = +[NSFileManager defaultManager];
    id v30 = 0;
    [v19 removeItemAtPath:@"/private/var/db/amfid/UPPStaging.plist" error:&v30];
    id v15 = v30;

LABEL_8:
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    __int16 v34 = "-[AMFIService commitProfileForUuid:withReply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] attempting to commit UUID: %@", buf, 0x16u);
  }
  id v11 = +[NSFileManager defaultManager];
  unsigned int v12 = [v11 fileExistsAtPath:@"/private/var/db/amfid/UPPCommitting.plist"];

  if (v12)
  {
    uint64_t v13 = +[NSFileManager defaultManager];
    id v29 = 0;
    [v13 removeItemAtPath:@"/private/var/db/amfid/UPPCommitting.plist" error:&v29];
    id v14 = v29;
  }
  else
  {
    id v14 = 0;
  }
  id v28 = v14;
  uint64_t v16 = +[NSString stringWithContentsOfFile:@"/private/var/db/amfid/UPPStaging.plist" encoding:4 error:&v28];
  id v15 = v28;

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019FAC();
    }
    goto LABEL_9;
  }
  if ([v8 isEqualToString:v16])
  {
    int v20 = +[NSFileManager defaultManager];
    id v27 = 0;
    [v20 removeItemAtPath:@"/private/var/db/amfid/UPPStaging.plist" error:&v27];
    id v21 = v27;

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019EBC();
      }
    }
    id v26 = 0;
    [v8 writeToFile:@"/private/var/db/amfid/UPPCommitting.plist" atomically:1 encoding:4 error:&v26];
    id v22 = v26;
    long long v23 = off_100028EF0;
    if (v22)
    {
      id v15 = v22;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019E48();
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v34 = "-[AMFIService commitProfileForUuid:withReply:]";
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%s] successfully committed UUID: %@", buf, 0x16u);
    }
    long long v24 = dispatch_get_global_queue(33, 0);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000606C;
    v25[3] = &unk_100025180;
    v25[4] = v31;
    dispatch_async(v24, v25);

LABEL_27:
    id v15 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
    sub_100019F30();
  }
  id v15 = [objc_alloc((Class)AMFIError) initWithAMFIErrorCode:-407 withURL:0];
LABEL_9:
  v7[2](v7, v15);
  _Block_object_dispose(v31, 8);
}

- (void)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, id))a6;
  if (![(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.set-trust"])
  {
    id v15 = objc_alloc((Class)AMFIError);
    uint64_t v16 = -440;
LABEL_12:
    id v14 = [v15 initWithAMFIErrorCode:v16 withURL:0];
    goto LABEL_13;
  }
  uint64_t v13 = off_100028EF0;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001A020(v13, v17, v18, v19, v20, v21, v22, v23);
    }
    id v15 = objc_alloc((Class)AMFIError);
    uint64_t v16 = -406;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315394;
    __int16 v25 = "-[AMFIService setTrustForUuid:withSignature:withSignType:withReply:]";
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%s] attempting to set trust for UUID: %@", (uint8_t *)&v24, 0x16u);
  }
  MISSetProfileTrust();
  if (a5 == 1) {
    sub_10000B770(v10);
  }
  id v14 = 0;
LABEL_13:
  v12[2](v12, v14);
}

- (void)removeTrustforUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (![(AMFIService *)self verifyBoolEntitlement:@"com.apple.private.amfi.remove-trust"])
  {
    id v10 = objc_alloc((Class)AMFIError);
    uint64_t v11 = -440;
LABEL_10:
    id v9 = [v10 initWithAMFIErrorCode:v11 withURL:0];
    goto LABEL_11;
  }
  id v8 = off_100028EF0;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001A098(v8, v12, v13, v14, v15, v16, v17, v18);
    }
    id v10 = objc_alloc((Class)AMFIError);
    uint64_t v11 = -406;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[AMFIService removeTrustforUuid:withReply:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove trust for UUID: %@", (uint8_t *)&v19, 0x16u);
  }
  MISRemoveProfileTrust();
  id v9 = 0;
LABEL_11:
  v7[2](v7, v9);
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end