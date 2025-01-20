@interface CoreRepairHelper
+ (id)sharedInstance;
- (BOOL)_mount:(const char *)a3 withFlag:(int)a4;
- (BOOL)factoryServiceOn;
- (CoreRepairHelper)init;
- (void)challengeStrongComponents:(id)a3 withReply:(id)a4;
- (void)daemonControl:(id)a3 withReply:(id)a4;
- (void)decompressPearlFramesWithReply:(id)a3;
- (void)issueRepairCert:(id)a3 withReply:(id)a4;
- (void)queryRepairDeltaWithReply:(id)a3;
- (void)seal:(id)a3 withReply:(id)a4;
- (void)setFactoryServiceOn:(BOOL)a3;
- (void)setupModuleChallengeCallBack:(__AMFDR *)a3;
- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5;
- (void)updateBrunorDATFirmwareWithReply:(id)a3;
- (void)updateSavageDATFirmwareWithReply:(id)a3;
- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6;
- (void)verifyPSD3WithReply:(id)a3;
@end

@implementation CoreRepairHelper

- (void)setupModuleChallengeCallBack:(__AMFDR *)a3
{
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();

  AMFDRRegisterModuleChallengeCallback();
}

- (CoreRepairHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CoreRepairHelper;
  result = [(CoreRepairHelper *)&v3 init];
  if (result) {
    result->_factoryServiceOn = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_10006E8D0 != -1) {
    dispatch_once(&qword_10006E8D0, &stru_100058C38);
  }
  v2 = (void *)qword_10006E8C8;

  return v2;
}

- (void)seal:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v85 = (void *)os_transaction_create();
  id v90 = 0;
  id v91 = 0;
  id v89 = 0;
  v8 = objc_opt_new();
  v9 = [v6 objectForKeyedSubscript:@"doSeal"];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = [v6 mutableCopy];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"keyBlob"];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [v6 objectForKeyedSubscript:@"keyBlob"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v16 = handleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Use Key Blob", buf, 2u);
      }

      v17 = [v6 objectForKeyedSubscript:@"keyBlob"];
      [v11 setObject:v17 forKey:@"keyBlob"];
    }
  }
  v18 = +[CRFileSystemController sharedSingleton];
  unsigned __int8 v19 = [v18 setupAlternativeFDRPath:v6];

  if ((v19 & 1) == 0)
  {
    v34 = handleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003E758(v34);
    }
    goto LABEL_65;
  }
  v20 = +[CRFileSystemController sharedSingleton];
  uint64_t v21 = [v20 setupFileSystemForRepair];

  if (!v21)
  {
    v34 = handleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003E5D0(v34);
    }
LABEL_65:
    v41 = 0;
    v79 = 0;
    v80 = 0;
    id v29 = 0;
    uint64_t v28 = -16;
    goto LABEL_28;
  }
  [v11 setObject:v21 forKey:@"datapath"];
  v22 = handleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v97 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  v23 = handleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting to seal FDR", buf, 2u);
  }

  v80 = (void *)v21;
  if (!v10)
  {
    v25 = 0;
LABEL_25:
    v42 = handleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "FDR Seal Successful", buf, 2u);
    }

    v79 = v25;
    v34 = [v25 handler];
    v41 = [v34 warnings];
    id v29 = 0;
    uint64_t v28 = 0;
    goto LABEL_28;
  }
  id v24 = [objc_alloc((Class)CRFDRSeal) initWithParameters:v11];
  if (!v24)
  {
    v34 = handleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003E614((uint64_t)v6, v34, v62, v63, v64, v65, v66, v67);
    }
    v41 = 0;
    id v29 = 0;
    v79 = 0;
    goto LABEL_23;
  }
  v25 = v24;
  if ([(CoreRepairHelper *)self factoryServiceOn])
  {
    v26 = handleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Enable service board support", buf, 2u);
    }

    v27 = [v25 handler];
    [v27 setAllowFactoryReset:1];
  }
  [v25 setDelegate:self];
  id v88 = 0;
  uint64_t v28 = (uint64_t)[v25 seal:&v88 oldSealingManifest:&v91 newSealingManifest:&v90 stats:&v89];
  id v29 = v88;
  v30 = [v8 convertDataToHexInDictionary:v91];
  id v31 = v91;
  id v91 = v30;

  v32 = [v8 convertDataToHexInDictionary:v90];
  id v33 = v90;
  id v90 = v32;

  if (!v28)
  {
    if (v29)
    {
      v79 = v25;
      v34 = handleForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10003E680((uint64_t)v29, v34, v35, v36, v37, v38, v39, v40);
      }
      v41 = 0;
LABEL_23:
      uint64_t v28 = -3;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v79 = v25;
  v34 = handleForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_10003E6EC(v28, v34, v68, v69, v70, v71, v72, v73);
  }
  v41 = 0;
LABEL_28:

  v43 = +[CRFileSystemController sharedSingleton];
  unsigned int v44 = [v43 cleanupFileSystemForRepair];

  uint64_t v45 = -18;
  if (v28) {
    uint64_t v45 = v28;
  }
  if (v44) {
    uint64_t v46 = v28;
  }
  else {
    uint64_t v46 = v45;
  }
  if (v29)
  {
    v47 = +[CRUtils getInnermostNSError:v29];
    uint64_t v48 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v47 code]);
    v87 = [v47 description];
  }
  else
  {
    uint64_t v48 = 0;
    v87 = 0;
  }
  v94[0] = @"statusCode";
  v81 = +[NSNumber numberWithInteger:v46];
  v94[1] = @"data";
  v95[0] = v81;
  v92[0] = @"fdrErrorCode";
  uint64_t v49 = v48;
  if (!v48)
  {
    uint64_t v49 = +[NSNull null];
  }
  v86 = v6;
  v78 = (void *)v49;
  v93[0] = v49;
  v92[1] = @"fdrErrorDescription";
  uint64_t v50 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v50 = +[NSNull null];
  }
  v84 = v8;
  v93[1] = v50;
  v92[2] = @"oldSealingManifest";
  id v51 = v91;
  id v52 = v91;
  if (!v91)
  {
    id v52 = +[NSNull null];
  }
  v76 = v52;
  v77 = (void *)v50;
  v82 = (void *)v48;
  v93[2] = v52;
  v92[3] = @"newSealingManifest";
  id v53 = v90;
  id v54 = v90;
  if (!v90)
  {
    id v54 = +[NSNull null];
  }
  v83 = v11;
  v55 = (void (**)(void, void))v7;
  id v74 = v54;
  v93[3] = v54;
  v92[4] = @"Stats";
  id v56 = v89;
  id v57 = v89;
  if (!v89)
  {
    id v57 = +[NSNull null];
  }
  v58 = v29;
  v93[4] = v57;
  v92[5] = @"warnings";
  v59 = v41;
  if (!v41)
  {
    v59 = +[NSNull null];
  }
  v93[5] = v59;
  v60 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 6, v74);
  v95[1] = v60;
  v61 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
  ((void (**)(void, void *))v55)[2](v55, v61);

  if (!v41) {
  if (!v56)
  }

  if (v53)
  {
    if (v51) {
      goto LABEL_54;
    }
  }
  else
  {

    if (v51) {
      goto LABEL_54;
    }
  }

LABEL_54:
  if (!v87) {

  }
  if (!v82) {
}
  }

- (void)daemonControl:(id)a3 withReply:(id)a4
{
}

- (void)queryRepairDeltaWithReply:(id)a3
{
  id v6 = a3;
  objc_super v3 = objc_opt_new();
  v4 = v3;
  if (v3)
  {
    [v3 queryRepairDeltaWithReply:v6];
  }
  else if (v6)
  {
    v5 = +[NSError errorWithDomain:CRErrorDomain code:-81 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v5);
  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = objc_opt_new();
  id v7 = v6;
  if (v6)
  {
    [v6 issueRepairCert:v9 withReply:v5];
  }
  else if (v5)
  {
    v8 = +[NSError errorWithDomain:CRErrorDomain code:-81 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v5 + 2))(v5, 0, 0, 0, v8);
  }
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  v8 = objc_opt_new();
  id v9 = v8;
  if (v8)
  {
    [v8 challengeStrongComponents:v11 withReply:v6];
  }
  else if (v6)
  {
    unsigned int v10 = +[NSError errorWithDomain:CRErrorDomain code:-81 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
  }
  objc_sync_exit(v7);
}

- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5
{
  id v11 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_new();
  unsigned int v10 = [v9 sign:v8 keyBlob:v7];

  if (v11) {
    v11[2](v11, v10);
  }
}

- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6
{
  id v15 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  id v13 = [v12 verify:v11 signature:v10 keyBlob:v9];

  v14 = v15;
  if (v15)
  {
    (*((void (**)(id, id))v15 + 2))(v15, v13);
    v14 = v15;
  }
}

- (BOOL)_mount:(const char *)a3 withFlag:(int)a4
{
  uint64_t v17 = 0;
  long long v16 = 0u;
  long long v15 = 0u;
  id v6 = getfsfile(a3);
  if (!v6)
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v19 = a3;
      id v10 = "get fs file failed for mount %s";
      id v11 = v7;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  fs_spec = v6->fs_spec;
  if (mount(v6->fs_vfstype, a3, a4, &fs_spec))
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v19 = a3;
      __int16 v20 = 2080;
      uint64_t v21 = v9;
      id v10 = "mount failed for %s filesystem: %s\n";
      id v11 = v7;
      uint32_t v12 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)decompressPearlFramesWithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  v4 = [v3 decompressPearlFrames];

  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)updateSavageDATFirmwareWithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  v4 = [v3 updateSavageDATFirmware];

  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)updateBrunorDATFirmwareWithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  v4 = [v3 updateBrunorDATFirmware];

  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)verifyPSD3WithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  v4 = [v3 verifyPSD3];

  if (v5) {
    v5[2](v5, v4);
  }
}

- (BOOL)factoryServiceOn
{
  return self->_factoryServiceOn;
}

- (void)setFactoryServiceOn:(BOOL)a3
{
  self->_factoryServiceOn = a3;
}

@end