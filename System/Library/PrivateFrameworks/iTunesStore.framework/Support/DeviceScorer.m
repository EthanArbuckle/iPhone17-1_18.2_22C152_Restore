@interface DeviceScorer
+ (BOOL)_resultForSamplingSession:(id)a3 isActive:(BOOL *)a4;
+ (BOOL)_shouldEnableDeviceScoring;
+ (BOOL)_shouldEnableDeviceScoringV2;
+ (BOOL)_shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5;
+ (BOOL)deviceScoringSupported;
+ (BOOL)deviceScoringSupportedV2;
+ (double)_randomDouble;
+ (id)_hexEncodingForData:(id)a3;
+ (id)_loadURLBag;
+ (id)_valueForKey:(id)a3;
+ (void)_setValue:(id)a3 forKey:(id)a4;
- (DeviceScorer)initWithServerEndpoint:(int64_t)a3;
- (DeviceScorerContext)context;
- (id)_serverEndpointIdentifierForServerEndpoint:(int64_t)a3;
- (void)_initDeviceScorerWithContext:(id)a3;
- (void)deviceScoreWithNonce:(id)a3 completion:(id)a4;
- (void)didConsumeDeviceScore:(BOOL)a3;
@end

@implementation DeviceScorer

- (DeviceScorer)initWithServerEndpoint:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceScorer;
  v4 = [(DeviceScorer *)&v9 init];
  if (v4)
  {
    v5 = objc_alloc_init(DeviceScorerContext);
    [(DeviceScorerContext *)v5 setServerEndpoint:a3];
    context = v4->_context;
    v4->_context = v5;
    v7 = v5;

    [(DeviceScorer *)v4 _initDeviceScorerWithContext:v7];
  }
  return v4;
}

+ (BOOL)deviceScoringSupported
{
  return [a1 _shouldEnableDeviceScoring];
}

+ (BOOL)deviceScoringSupportedV2
{
  return [a1 _shouldEnableDeviceScoringV2];
}

- (void)deviceScoreWithNonce:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_1000353EC;
  v25[4] = sub_1000353FC;
  id v26 = 0;
  if (!self->_deviceScorer)
  {
    v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    unsigned int v13 = [v11 shouldLogToDisk];
    v14 = [v11 OSLogObject];
    v15 = v14;
    if (v13) {
      v12 |= 2u;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      v16 = objc_opt_class();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v16;
      id v17 = v16;
      LODWORD(v19) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }
      v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, location, v19);
      free(v18);
      SSFileLog();
    }

    goto LABEL_13;
  }
  v8 = objc_alloc_init(RvCyrXrrh7eJhtzx);
  [(RvCyrXrrh7eJhtzx *)v8 setNonce:v6];
  objc_initWeak(location, self);
  objc_super v9 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035404;
  block[3] = &unk_1003A3E88;
  objc_copyWeak(&v24, location);
  v21 = v8;
  id v22 = v7;
  v23 = v25;
  v10 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(location);
LABEL_14:
  _Block_object_dispose(v25, 8);
}

- (void)didConsumeDeviceScore:(BOOL)a3
{
  BOOL v3 = a3;
  deviceScorer = self->_deviceScorer;
  uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
  id v7 = (L1vrniCr6VjgMaLl *)v6;
  if (!deviceScorer)
  {
    if (!v6)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [(L1vrniCr6VjgMaLl *)v7 shouldLog];
    if ([(L1vrniCr6VjgMaLl *)v7 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    v14 = [(L1vrniCr6VjgMaLl *)v7 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(v18) = 138543362;
      *(void *)((char *)&v18 + 4) = objc_opt_class();
      id v15 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16) {
        goto LABEL_25;
      }
      v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v18, v17, v18);
      free(v16);
      SSFileLog();
    }

    goto LABEL_25;
  }
  if (!v6)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [(L1vrniCr6VjgMaLl *)v7 shouldLog];
  if ([(L1vrniCr6VjgMaLl *)v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [(L1vrniCr6VjgMaLl *)v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  LODWORD(v18) = 138543362;
  *(void *)((char *)&v18 + 4) = objc_opt_class();
  LODWORD(v17) = 12;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v17);
    free(v11);
    SSFileLog();
LABEL_12:
  }
  id v7 = objc_alloc_init(L1vrniCr6VjgMaLl);
  [(L1vrniCr6VjgMaLl *)v7 setConsumed:v3];
  [(CerKRQOmMu7LBUoc *)self->_deviceScorer eVZ8hjC0Tuzwvnqc:v7];
LABEL_25:
}

+ (id)_hexEncodingForData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  v5 = (char *)[v3 length];
  id v6 = v3;
  id v7 = (unsigned __int8 *)[v6 bytes];
  if (v5)
  {
    unsigned int v8 = v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v9);
      --v5;
    }
    while (v5);
  }
  v10 = +[NSString stringWithString:v4];

  return v10;
}

- (void)_initDeviceScorerWithContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_deviceScorer)
  {
LABEL_111:
    v84 = +[SSLogConfig sharedDaemonConfig];
    if (!v84)
    {
      v84 = +[SSLogConfig sharedConfig];
    }
    unsigned int v85 = [v84 shouldLog];
    if ([v84 shouldLogToDisk]) {
      v85 |= 2u;
    }
    v86 = [v84 OSLogObject];
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT)) {
      int v87 = v85;
    }
    else {
      int v87 = v85 & 2;
    }
    if (v87)
    {
      v88 = objc_opt_class();
      int v102 = 138543362;
      id v103 = v88;
      id v89 = v88;
      LODWORD(v92) = 12;
      v90 = (void *)_os_log_send_and_compose_impl();

      if (!v90)
      {
LABEL_122:

        [(CerKRQOmMu7LBUoc *)self->_deviceScorer prepareScoreMessage];
        goto LABEL_123;
      }
      v86 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v90, 4, &v102, v92);
      free(v90);
      SSFileLog();
    }

    goto LABEL_122;
  }
  id v6 = -[DeviceScorer _serverEndpointIdentifierForServerEndpoint:](self, "_serverEndpointIdentifierForServerEndpoint:", [v4 serverEndpoint]);
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (v11)
  {
    int v102 = 138543618;
    id v103 = (id)objc_opt_class();
    __int16 v104 = 2114;
    v105 = v6;
    id v12 = v103;
    LODWORD(v92) = 22;
    v91 = &v102;
    int v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_14;
    }
    v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v102, v92);
    free(v13);
    v91 = (int *)v10;
    SSFileLog();
  }

LABEL_14:
  v14 = [[wumZ2SSA5KbWdu7E alloc] initWithServerEndpointIdentifier:v6];
  id v15 = v14;
  if (v14)
  {
    v99 = v5;
    v100 = v14;
    v98 = v6;
    id v101 = objc_alloc_init((Class)NSMutableSet);
    v16 = +[SSAccountStore defaultStore];
    uint64_t v17 = [v16 activeAccount];

    uint64_t v18 = [v17 firstName];
    uint64_t v19 = [v17 lastName];
    v95 = (void *)v19;
    v96 = (void *)v18;
    if (v18 && v19)
    {
      v20 = [[cBEET4QRedIfcDrp alloc] initWithFirstName:v18 lastName:v19 source:0];
      if (v20)
      {
        [v101 addObject:v20];
        goto LABEL_54;
      }
      v31 = +[SSLogConfig sharedDaemonConfig];
      if (!v31)
      {
        v31 = +[SSLogConfig sharedConfig];
      }
      unsigned int v36 = [v31 shouldLog];
      if ([v31 shouldLogToDisk]) {
        int v37 = v36 | 2;
      }
      else {
        int v37 = v36;
      }
      v38 = [v31 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        int v39 = v37;
      }
      else {
        int v39 = v37 & 2;
      }
      if (!v39) {
        goto LABEL_52;
      }
      v40 = objc_opt_class();
      int v102 = 138543362;
      id v103 = v40;
      id v41 = v40;
      LODWORD(v92) = 12;
      v91 = &v102;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (v42)
      {
        v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v102, v92);
        free(v42);
        v91 = (int *)v38;
        SSFileLog();
LABEL_52:
      }
    }
    else
    {
      v20 = +[SSLogConfig sharedDaemonConfig];
      if (!v20)
      {
        v20 = +[SSLogConfig sharedConfig];
      }
      unsigned int v29 = [(cBEET4QRedIfcDrp *)v20 shouldLog];
      if ([(cBEET4QRedIfcDrp *)v20 shouldLogToDisk]) {
        int v30 = v29 | 2;
      }
      else {
        int v30 = v29;
      }
      v31 = [(cBEET4QRedIfcDrp *)v20 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        int v32 = v30;
      }
      else {
        int v32 = v30 & 2;
      }
      if (v32)
      {
        v33 = objc_opt_class();
        int v102 = 138543362;
        id v103 = v33;
        id v34 = v33;
        LODWORD(v92) = 12;
        v91 = &v102;
        v35 = (void *)_os_log_send_and_compose_impl();

        if (!v35) {
          goto LABEL_54;
        }
        v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v102, v92);
        free(v35);
        v91 = (int *)v31;
        SSFileLog();
      }
    }

LABEL_54:
    v97 = v17;
    uint64_t v43 = [v17 accountName];
    v94 = (void *)v43;
    if (v43)
    {
      v44 = [[cBEET4QRedIfcDrp alloc] initWithEmailAddress:v43 source:1];
      v45 = v100;
      id v46 = v101;
      if (v44)
      {
        [v101 addObject:v44];
        goto LABEL_81;
      }
      v49 = +[SSLogConfig sharedDaemonConfig];
      if (!v49)
      {
        v49 = +[SSLogConfig sharedConfig];
      }
      unsigned int v54 = [v49 shouldLog];
      if ([v49 shouldLogToDisk]) {
        int v55 = v54 | 2;
      }
      else {
        int v55 = v54;
      }
      v56 = [v49 OSLogObject];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        int v57 = v55;
      }
      else {
        int v57 = v55 & 2;
      }
      if (!v57) {
        goto LABEL_79;
      }
      v58 = objc_opt_class();
      int v102 = 138543362;
      id v103 = v58;
      id v59 = v58;
      LODWORD(v92) = 12;
      v91 = &v102;
      v60 = (void *)_os_log_send_and_compose_impl();

      if (v60)
      {
        v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v102, v92);
        free(v60);
        v91 = (int *)v56;
        SSFileLog();
LABEL_79:
      }
    }
    else
    {
      v44 = +[SSLogConfig sharedDaemonConfig];
      v45 = v100;
      id v46 = v101;
      if (!v44)
      {
        v44 = +[SSLogConfig sharedConfig];
      }
      unsigned int v47 = [(cBEET4QRedIfcDrp *)v44 shouldLog];
      if ([(cBEET4QRedIfcDrp *)v44 shouldLogToDisk]) {
        int v48 = v47 | 2;
      }
      else {
        int v48 = v47;
      }
      v49 = [(cBEET4QRedIfcDrp *)v44 OSLogObject];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        int v50 = v48;
      }
      else {
        int v50 = v48 & 2;
      }
      if (v50)
      {
        v51 = objc_opt_class();
        int v102 = 138543362;
        id v103 = v51;
        id v52 = v51;
        LODWORD(v92) = 12;
        v91 = &v102;
        v53 = (void *)_os_log_send_and_compose_impl();

        if (!v53) {
          goto LABEL_81;
        }
        v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v102, v92);
        free(v53);
        v91 = (int *)v49;
        SSFileLog();
      }
    }

LABEL_81:
    [(wumZ2SSA5KbWdu7E *)v45 setIdentities:v46];
    v61 = +[SSDevice currentDevice];
    uint64_t v62 = [v61 phoneNumber];

    v93 = (void *)v62;
    if (v62)
    {
      [(wumZ2SSA5KbWdu7E *)v45 setPhoneNumber:v62];
      goto LABEL_96;
    }
    v63 = +[SSLogConfig sharedDaemonConfig];
    if (!v63)
    {
      v63 = +[SSLogConfig sharedConfig];
    }
    unsigned int v64 = objc_msgSend(v63, "shouldLog", v91);
    if ([v63 shouldLogToDisk]) {
      int v65 = v64 | 2;
    }
    else {
      int v65 = v64;
    }
    v66 = [v63 OSLogObject];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      int v67 = v65;
    }
    else {
      int v67 = v65 & 2;
    }
    if (v67)
    {
      v68 = objc_opt_class();
      int v102 = 138543362;
      id v103 = v68;
      id v69 = v68;
      LODWORD(v92) = 12;
      v91 = &v102;
      v70 = (void *)_os_log_send_and_compose_impl();

      if (!v70)
      {
LABEL_95:

LABEL_96:
        id v71 = objc_alloc_init((Class)SSDevice);
        v72 = [v71 clientName];
        v73 = +[SSLogConfig sharedDaemonConfig];
        if (!v73)
        {
          v73 = +[SSLogConfig sharedConfig];
        }
        unsigned int v74 = objc_msgSend(v73, "shouldLog", v91);
        if ([v73 shouldLogToDisk]) {
          int v75 = v74 | 2;
        }
        else {
          int v75 = v74;
        }
        v76 = [v73 OSLogObject];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO)) {
          int v77 = v75;
        }
        else {
          int v77 = v75 & 2;
        }
        if (v77)
        {
          v78 = objc_opt_class();
          id v79 = v78;
          v80 = SSHashIfNeeded();
          int v102 = 138543618;
          id v103 = v78;
          __int16 v104 = 2112;
          v105 = v80;
          LODWORD(v92) = 22;
          v91 = &v102;
          v81 = (void *)_os_log_send_and_compose_impl();

          if (!v81)
          {
LABEL_108:

            id v15 = v100;
            [(wumZ2SSA5KbWdu7E *)v100 setCallerID:v72];
            v82 = +[CerKRQOmMu7LBUoc scorerWithContext:v100];
            deviceScorer = self->_deviceScorer;
            self->_deviceScorer = v82;

            id v6 = v98;
            v5 = v99;
            v21 = v101;
            id v24 = v97;
            goto LABEL_109;
          }
          v76 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, &v102, v92);
          free(v81);
          v91 = (int *)v76;
          SSFileLog();
        }

        goto LABEL_108;
      }
      v66 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v70, 4, &v102, v92);
      free(v70);
      v91 = (int *)v66;
      SSFileLog();
    }

    goto LABEL_95;
  }
  v21 = +[SSLogConfig sharedDaemonConfig];
  if (!v21)
  {
    v21 = +[SSLogConfig sharedConfig];
  }
  unsigned int v22 = objc_msgSend(v21, "shouldLog", v91);
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  id v24 = [v21 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (v25)
  {
    id v26 = objc_opt_class();
    int v102 = 138543362;
    id v103 = v26;
    id v27 = v26;
    LODWORD(v92) = 12;
    v91 = &v102;
    v28 = (void *)_os_log_send_and_compose_impl();

    if (!v28) {
      goto LABEL_110;
    }
    id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v102, v92);
    free(v28);
    v91 = (int *)v24;
    SSFileLog();
  }
LABEL_109:

LABEL_110:
  if (self->_deviceScorer) {
    goto LABEL_111;
  }
LABEL_123:
}

+ (id)_loadURLBag
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  id v3 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v2];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  unsigned int v29 = sub_100036D68;
  int v30 = &unk_1003A34F0;
  int v32 = &v33;
  id v4 = dispatch_semaphore_create(0);
  v31 = v4;
  [v3 setCompletionBlock:&v27];
  v5 = +[ISOperationQueue mainQueue];
  [v5 addOperation:v3];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v4, v6);
  if (!*((unsigned char *)v34 + 24))
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    unsigned int v9 = [v7 shouldLogToDisk];
    v10 = [v7 OSLogObject];
    int v11 = v10;
    if (v9) {
      v8 |= 2u;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v12 = objc_opt_class();
      int v37 = 138543362;
      v38 = v12;
      id v13 = v12;
      LODWORD(v26) = 12;
      int v25 = &v37;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_12:

        goto LABEL_13;
      }
      int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v37, v26, v27, v28, v29, v30);
      free(v14);
      int v25 = (int *)v11;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  if (objc_msgSend(v3, "success", v25))
  {
    id v15 = [v3 URLBag];
    goto LABEL_26;
  }
  v16 = +[SSLogConfig sharedDaemonConfig];
  if (!v16)
  {
    v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = [v16 shouldLog];
  unsigned int v18 = [v16 shouldLogToDisk];
  uint64_t v19 = [v16 OSLogObject];
  v20 = v19;
  if (v18) {
    v17 |= 2u;
  }
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_24;
  }
  v21 = objc_opt_class();
  int v37 = 138543362;
  v38 = v21;
  id v22 = v21;
  LODWORD(v26) = 12;
  int v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v37, v26);
    free(v23);
    SSFileLog();
LABEL_24:
  }
  id v15 = 0;
LABEL_26:

  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)_serverEndpointIdentifierForServerEndpoint:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1003A3EC8[a3];
  }
}

+ (BOOL)_shouldEnableDeviceScoring
{
  v2 = [a1 _loadURLBag];
  id v3 = [v2 valueForKey:@"afds-enabled"];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldEnableDeviceScoringV2
{
  id v3 = [a1 _loadURLBag];
  id v4 = [v3 valueForKey:@"afds-enabled-v2-ramp"];
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    double v5 = v6;
  }
  id v7 = [v3 valueForKey:@"afds-enabled-v2-ramp-duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 1800.0;
  }
  unsigned int v24 = [a1 _shouldSampleWithPercentage:@"FraudScore" sessionDuration:v5 identifier:v9];
  v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  id v13 = [v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    int v14 = v12;
  }
  else {
    int v14 = v12 & 2;
  }
  if (v14)
  {
    id v15 = objc_opt_class();
    int v23 = v4;
    id v16 = v15;
    unsigned int v17 = +[NSNumber numberWithDouble:v5];
    unsigned int v18 = +[NSNumber numberWithDouble:v9];
    +[NSNumber numberWithBool:v24];
    int v25 = 138544130;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    __int16 v29 = 2114;
    int v30 = v18;
    __int16 v31 = 2114;
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 42;
    uint64_t v19 = (void *)_os_log_send_and_compose_impl();

    id v4 = v23;
    if (v19)
    {
      v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v25, v22);
      free(v19);
      SSFileLog();
    }
  }
  else
  {
  }
  return v24;
}

+ (double)_randomDouble
{
  if (qword_100401C88 != -1) {
    dispatch_once(&qword_100401C88, &stru_1003A3EA8);
  }

  return drand48();
}

+ (BOOL)_resultForSamplingSession:(id)a3 isActive:(BOOL *)a4
{
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"date"];
  id v7 = [v5 objectForKeyedSubscript:@"result"];
  unsigned __int8 v8 = [v7 BOOLValue];

  double v9 = [v5 objectForKeyedSubscript:@"duration"];

  unsigned int v10 = [v9 BOOLValue];
  unsigned int v11 = +[NSDate date];
  if (!v6)
  {
LABEL_4:
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_9;
  }
  int v12 = [v6 dateByAddingTimeInterval:(double)v10];
  if ([v11 compare:v12] != (id)-1)
  {

    goto LABEL_4;
  }
  if (a4) {
    *a4 = 1;
  }

LABEL_9:
  return v8;
}

+ (BOOL)_shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5
{
  unsigned __int8 v8 = +[NSString stringWithFormat:@"%@-%@", @"SSSampleSession", a5];
  double v9 = [a1 _valueForKey:v8];
  char v19 = 0;
  unsigned __int8 v10 = [a1 _resultForSamplingSession:v9 isActive:&v19];
  if (v19)
  {
    LOBYTE(v11) = v10;
  }
  else
  {
    [a1 _randomDouble];
    BOOL v13 = v12 >= 0.0;
    if (v12 > 1.0) {
      BOOL v13 = 0;
    }
    uint64_t v11 = v12 <= a3 && v13;
    if (a4 > 0.0)
    {
      v20[0] = @"date";
      int v14 = +[NSDate date];
      v21[0] = v14;
      v20[1] = @"result";
      id v15 = +[NSNumber numberWithBool:v11];
      v21[1] = v15;
      v20[2] = @"duration";
      id v16 = +[NSNumber numberWithDouble:a4];
      v21[2] = v16;
      unsigned int v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

      [a1 _setValue:v17 forKey:v8];
    }
  }

  return v11;
}

+ (id)_valueForKey:(id)a3
{
  CFStringRef v3 = (const __CFString *)kSSUserDefaultsIdentifier;
  id v4 = (__CFString *)a3;
  CFPreferencesAppSynchronize(v3);
  id v5 = (void *)CFPreferencesCopyAppValue(v4, v3);

  return v5;
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, kSSUserDefaultsIdentifier);

  CFPreferencesAppSynchronize(v4);
}

- (DeviceScorerContext)context
{
  return (DeviceScorerContext *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_deviceScorer, 0);
}

@end