@interface smbcdMountServiceDelegate
- (smbcdMountServiceDelegate)init;
- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8;
- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 reply:(id)a5;
- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation smbcdMountServiceDelegate

- (smbcdMountServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)smbcdMountServiceDelegate;
  return [(smbcdMountServiceDelegate *)&v3 init];
}

- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = (void (**)(id, __CFString *))a8;
  BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v18)
  {
    sub_10004C188(v18, v19, v20, v21, v22, v23, v24, v25);
    if (a6) {
      goto LABEL_3;
    }
LABEL_7:
    v26 = @"GUEST";
    v27 = &stru_10008A998;
    goto LABEL_8;
  }
  if (!a6) {
    goto LABEL_7;
  }
LABEL_3:
  if (a6 != 1)
  {
    getNSErrorFromLiveFSErrno();
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v26);
    goto LABEL_12;
  }
  v26 = [v16 objectForKey:LiveFSAuthCredUsernameKey];
  v27 = [v16 objectForKey:LiveFSAuthCredPasswordKey];
LABEL_8:
  if (([(__CFString *)v26 containsString:@"@"] & 1) != 0
    || [(__CFString *)v26 containsString:@"/"]
    || [v15 containsString:@"/"])
  {
    getNSErrorFromLiveFSErrno();
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v28);
  }
  else
  {
    v33 = +[NSString stringWithFormat:@"smb://%@:%@@%@/", v26, v27, v15];
    v29 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    v30 = (void *)qword_1000914E8;
    id v34 = v14;
    v31 = +[NSArray arrayWithObjects:&v34 count:1];
    uint64_t v32 = [v30 addShares:v31 atServer:v29 serverDomainName:0 service:v13];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C108(v32);
    }
    v17[2](v17, (__CFString *)v32);

    v26 = (__CFString *)v32;
  }
LABEL_12:
}

- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void))a7;
  id v15 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315650;
    v31 = "-[smbcdMountServiceDelegate LiveMountService:ejectVolume:named:withFlags:reply:]";
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 1024;
    int v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: called on vol name %@, how %x", (uint8_t *)&v30, 0x1Cu);
  }
  id v16 = [v15 mountURL];
  v17 = [v16 lastPathComponent];

  [v15 SetShutDownReason:4];
  BOOL v18 = (void *)qword_1000914E8;
  uint64_t v19 = [v15 mountURL];
  id v20 = [v19 copy];
  uint64_t v21 = [v18 ejectVolumeForURL:v20 share:v17 how:v8];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412290;
    v31 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Got reply from fskitd: %@.", (uint8_t *)&v30, 0xCu);
  }
  [v15 disconnect];
  [v15 setTransaction:0];
  BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v22) {
    sub_10004C1C4(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  v14[2](v14, 0);
}

- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    id v16 = "-[smbcdMountServiceDelegate LiveMountService:ejectVolumeCluster:withFlags:reply:]";
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 1024;
    unsigned int v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: called on vol cluster %@, how %x", (uint8_t *)&v15, 0x1Cu);
  }
  if ((a5 & 2) != 0
    && (id v12 = [(id)qword_1000914E8 removeServer:v10],
        +[LiveFSFPMountClient locallyDestroyFPDomain:v10 provider:@"com.apple.SMBClientProvider.FileProvider"], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C200((uint64_t)v10, (uint64_t)v14);
    }
    v11[2](v11, v14);
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void, __CFString *))a7;
  unsigned int v22 = 0;
  if (a5 == 1)
  {
    int v15 = [v13 objectForKey:LiveFSAuthCredUsernameKey];
    NSLog(@"%s: user auth, user %@", "-[smbcdMountServiceDelegate LiveMountService:sharesAtServer:credentialType:credential:reply:]", v15);
    id v16 = [v13 objectForKey:LiveFSAuthCredPasswordKey];
  }
  else
  {
    if (a5)
    {
      getNSErrorFromLiveFSErrno();
      int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v15);
      goto LABEL_14;
    }
    NSLog(@"%s: GUEST auth", "-[smbcdMountServiceDelegate LiveMountService:sharesAtServer:credentialType:credential:reply:]");
    int v15 = @"GUEST";
    id v16 = &stru_10008A998;
  }
  __int16 v17 = +[NSString stringWithFormat:@"smb://%@:%@@%@/", v15, v16, v12];
  id v18 = +[NSURL URLWithString:v17];
  NSLog(@"%s: server %@", "-[smbcdMountServiceDelegate LiveMountService:sharesAtServer:credentialType:credential:reply:]", v12);
  __int16 v19 = +[srvsvc_subr getSharesAtServerURL:v18 Result:&v22];
  unsigned int v20 = v19;
  if (v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C29C((int *)&v22);
    }
    uint64_t v21 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:v22];
    v14[2](v14, 0, v21);
  }
  else if ([v19 count])
  {
    uint64_t v21 = +[NSArray arrayWithArray:v20];
    ((void (**)(id, __CFString *, __CFString *))v14)[2](v14, v21, 0);
  }
  else
  {
    uint64_t v21 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:1];
    v14[2](v14, 0, v21);
  }

LABEL_14:
}

- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 reply:(id)a5
{
  id v6 = a5;
  getNSErrorFromLiveFSErrno();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7
{
  id v8 = a7;
  getNSErrorFromLiveFSErrno();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);
}

- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6
{
  id v7 = a6;
  getNSErrorFromLiveFSErrno();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a6 + 2))(v7, v8, 0);
}

- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6
{
  id v7 = a6;
  getNSErrorFromLiveFSErrno();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

@end