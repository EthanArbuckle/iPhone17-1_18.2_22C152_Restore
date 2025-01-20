@interface SMBClientService
- (void)SMBClientProtocolCredentialsForServer:(id)a3 completionHandler:(id)a4;
- (void)addSMBServerOrShare:(id)a3 completionHandler:(id)a4;
@end

@implementation SMBClientService

- (void)SMBClientProtocolCredentialsForServer:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0, 1000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002744;
  block[3] = &unk_1000886D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addSMBServerOrShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 scheme];
  unsigned __int8 v9 = [v8 isEqualToString:@"smb"];

  if (v9)
  {
    v10 = [v6 pathComponents];
    if ((unint64_t)[v10 count] < 2)
    {
      *(_DWORD *)buf = 0;
      v12 = +[srvsvc_subr getSharesAtServerURL:v6 Result:buf];
      if (*(_DWORD *)buf)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004BFEC((int *)buf);
        }
        v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*(int *)buf userInfo:0];
        v7[2](v7, 0, v14);
        goto LABEL_19;
      }
      v13 = 0;
    }
    else
    {
      v11 = [v10 objectAtIndexedSubscript:1];
      v26 = v11;
      v12 = +[NSArray arrayWithObjects:&v26 count:1];

      v13 = [v12 objectAtIndexedSubscript:0];
    }
    id v19 = 0;
    v14 = [(id)qword_1000914E8 addShares:v12 atServer:v6 serverDomainName:&v19 service:self];
    id v15 = v19;
    v16 = v15;
    if (!v14)
    {
      if (v13 && v15)
      {
        id v17 = [v15 stringByAppendingString:v13];
      }
      else
      {
        id v17 = v15;
      }
      id v18 = v17;

      v13 = v18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[SMBClientService addSMBServerOrShare:completionHandler:]";
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: sharePoint(%@) err: (%@)", buf, 0x20u);
    }
    ((void (**)(id, void *, void *))v7)[2](v7, v13, v14);

LABEL_19:
    goto LABEL_20;
  }
  v10 = +[NSError errorWithDomain:NSCocoaErrorDomain code:262 userInfo:0];
  v7[2](v7, 0, v10);
LABEL_20:
}

@end