@interface srvsvc_subr
+ (id)getSharesAtServerURL:(id)a3 Result:(int *)a4;
@end

@implementation srvsvc_subr

+ (id)getSharesAtServerURL:(id)a3 Result:(int *)a4
{
  v5 = +[NSURLComponents componentsWithURL:a3 resolvingAgainstBaseURL:1];
  v6 = [v5 host];
  v7 = [v5 user];
  v8 = [v5 password];
  if ([v7 containsString:@";"])
  {
    v9 = (char *)[v7 rangeOfString:@";"];
    v10 = [v7 substringToIndex:v9];
    uint64_t v11 = [v7 substringFromIndex:v9 + 1];

    v7 = (void *)v11;
  }
  else
  {
    v10 = 0;
  }
  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  v59[1] = 0;
  uint64_t v60 = 0;
  v59[0] = 0;
  id v12 = objc_alloc_init((Class)SMBPiston);
  if (!v12)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_100064848(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v23 = 0;
    v24 = 0;
    int v14 = 12;
    goto LABEL_25;
  }
  int v66 = 0;
  long long v65 = 0u;
  memset(v64, 0, sizeof(v64));
  unsigned int v13 = +[smb_subr sendNegotiate:v12 Server:v6 netBIOSName:0 VPNCookie:0 Result:v64];
  if (v13)
  {
    int v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000649E4();
    }
LABEL_24:
    v23 = 0;
    v24 = 0;
    goto LABEL_25;
  }
  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  if ([v7 isEqualToString:@"GUEST"])
  {
    LODWORD(v61) = 1;
    id v25 = v12;
    v26 = v7;
    v27 = 0;
    v28 = 0;
  }
  else
  {
    if ((unint64_t)[v7 length] >= 0x100)
    {
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v29) {
        sub_1000649A8(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      v23 = 0;
      v24 = 0;
      int v14 = 22;
      goto LABEL_25;
    }
    if ((v66 & 0x44) != 0)
    {
      LODWORD(v61) = 2;
      uint64_t v37 = +[smb_subr sendSessionSetup:v12 User:v7 Password:v8 Realm:@"WELLKNOWN:COM.APPLE.LKDC" Param:&v61];
      if (v37 != 80) {
        goto LABEL_21;
      }
    }
    LODWORD(v61) = 4;
    id v25 = v12;
    v26 = v7;
    v27 = v8;
    v28 = v10;
  }
  uint64_t v37 = +[smb_subr sendSessionSetup:v25 User:v26 Password:v27 Realm:v28 Param:&v61];
LABEL_21:
  int v38 = sub_100033008(v37);
  if (v38)
  {
    int v14 = v38;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100064934();
    }
    goto LABEL_24;
  }
  unsigned int v40 = +[smb_subr sendTreeConnect:v12 ShareName:@"IPC$" Param:v59];
  v56 = a4;
  if (v40)
  {
    int v14 = v40;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000648C0();
    }
    v23 = 0;
    v24 = 0;
    v41 = &OBJC_METACLASS___smbNode;
  }
  else
  {
    v42 = [GetShareListArgs alloc];
    v43 = [(GetShareListArgs *)v42 initWithPiston:v12 ServerName:v6 ServerMaxRead:DWORD2(v65) ServerMaxWrite:HIDWORD(v65) ServerMaxTransact:DWORD1(v65) ShareID:HIDWORD(v60)];
    v24 = v43;
    if (v43)
    {
      v23 = (unsigned int *)sub_100049E74(v43);
      int v14 = [(GetShareListArgs *)v24 status];
      if (v23)
      {
        v44 = v23;
        v55 = v23;
        v23 = (unsigned int *)objc_opt_new();
        v54 = objc_opt_new();
        sub_10004BE08(v44, v23);
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_10004BF8C;
        v57[3] = &unk_10008A918;
        id v58 = v54;
        id v45 = v54;
        [v23 enumerateObjectsUsingBlock:v57];
        [v23 removeObjectsInArray:v45];
        sub_10004B24C(v55);
      }
    }
    else
    {
      BOOL v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v46) {
        sub_100064884(v46, v47, v48, v49, v50, v51, v52, v53);
      }
      v23 = 0;
      int v14 = 12;
    }
    v41 = &OBJC_METACLASS___smbNode;
    +[smb_subr sendTreeDisonnect:v12 ShareID:HIDWORD(v60) Param:v59];
  }
  [&v41[5] sendLogoff:v12 Param:&v61];
  a4 = v56;
LABEL_25:
  *a4 = v14;

  return v23;
}

@end