@interface KTLoggableData
- (BOOL)verifySignatureWithAccountKey:(id)a3 error:(id *)a4;
- (void)computeHashesForSalt:(id)a3;
@end

@implementation KTLoggableData

- (void)computeHashesForSalt:(id)a3
{
  id v9 = a3;
  v4 = [(KTLoggableData *)self deviceID];

  if (v4)
  {
    v5 = [(KTLoggableData *)self deviceID];
    v6 = [v5 kt_sha256WithSalt:v9];
    [(KTLoggableData *)self setDeviceIdHash:v6];
  }
  v7 = [(KTLoggableData *)self clientData];
  v8 = [v7 kt_sha256WithSalt:v9];
  [(KTLoggableData *)self setClientDataHash:v8];
}

- (BOOL)verifySignatureWithAccountKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(KTLoggableData *)self clientData];
  if (v7
    && (v8 = (void *)v7,
        [(KTLoggableData *)self signature],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [(KTLoggableData *)self clientData];
    v11 = [(KTLoggableData *)self signature];
    id v43 = 0;
    unsigned __int8 v12 = +[KTAccountKeyServer verifyData:v10 signature:v11 accountPublicKeyInfo:v6 error:&v43];
    id v13 = v43;

    if (v12)
    {
      BOOL v14 = 1;
    }
    else
    {
      if (qword_10032EFD8 != -1) {
        dispatch_once(&qword_10032EFD8, &stru_1002C5A18);
      }
      v31 = (void *)qword_10032EFE0;
      if (os_log_type_enabled((os_log_t)qword_10032EFE0, OS_LOG_TYPE_ERROR))
      {
        log = v31;
        v42 = [(KTLoggableData *)self deviceID];
        v40 = [v42 kt_hexString];
        unsigned int v32 = [(KTLoggableData *)self ktCapable];
        v33 = [(KTLoggableData *)self clientData];
        v34 = [v33 kt_hexString];
        v35 = [v6 kt_hexString];
        v36 = [(KTLoggableData *)self signature];
        v37 = [v36 kt_hexString];
        *(_DWORD *)buf = 138413314;
        v45 = v40;
        __int16 v46 = 1024;
        unsigned int v47 = v32;
        __int16 v48 = 2112;
        v49 = v34;
        __int16 v50 = 2112;
        v51 = v35;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to verify signature for deviceID %@, ktCapable %d, client data %@ key: %@ signature: %@", buf, 0x30u);
      }
      v38 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-272 underlyingError:v13 description:@"failed to validate loggable data signature"];

      if (qword_10032EFD8 != -1) {
        dispatch_once(&qword_10032EFD8, &stru_1002C5A38);
      }
      v39 = qword_10032EFE0;
      if (os_log_type_enabled((os_log_t)qword_10032EFE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v38;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "failed to validate loggable data signatures: %@", buf, 0xCu);
      }
      BOOL v14 = 0;
      if (a4 && v38)
      {
        id v13 = v38;
        BOOL v14 = 0;
        *a4 = v13;
      }
      else
      {
        id v13 = v38;
      }
    }
  }
  else
  {
    v15 = +[NSMutableDictionary dictionary];
    v16 = [(KTLoggableData *)self deviceID];
    v17 = [v16 kt_hexString];
    [v15 setObject:v17 forKeyedSubscript:@"deviceID"];

    v18 = [(KTLoggableData *)self product];
    [v15 setObject:v18 forKeyedSubscript:@"product"];

    v19 = [(KTLoggableData *)self build];
    [v15 setObject:v19 forKeyedSubscript:@"build"];

    v20 = +[NSNumber numberWithBool:[(KTLoggableData *)self ktCapable]];
    [v15 setObject:v20 forKeyedSubscript:@"ktCapable"];

    v21 = [(KTLoggableData *)self clientData];

    if (v21) {
      uint64_t v22 = -286;
    }
    else {
      uint64_t v22 = -362;
    }
    id v13 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:v22 errorLevel:4 underlyingError:0 userinfo:v15 description:@"no signature for client data"];
    if (qword_10032EFD8 != -1) {
      dispatch_once(&qword_10032EFD8, &stru_1002C59F8);
    }
    v23 = (void *)qword_10032EFE0;
    if (os_log_type_enabled((os_log_t)qword_10032EFE0, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = [(KTLoggableData *)self deviceID];
      v26 = [v25 kt_hexString];
      unsigned int v27 = [(KTLoggableData *)self ktCapable];
      v28 = [(KTLoggableData *)self clientData];
      v29 = [v28 kt_hexString];
      *(_DWORD *)buf = 138412802;
      v45 = v26;
      __int16 v46 = 1024;
      unsigned int v47 = v27;
      __int16 v48 = 2112;
      v49 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "no signature for deviceId %@, ktCapable %d, client data %@", buf, 0x1Cu);
    }
    if (a4 && v13) {
      *a4 = v13;
    }

    BOOL v14 = 0;
  }

  return v14;
}

@end