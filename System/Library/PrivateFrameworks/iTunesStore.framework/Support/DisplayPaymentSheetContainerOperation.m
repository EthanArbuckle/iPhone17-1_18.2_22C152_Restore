@interface DisplayPaymentSheetContainerOperation
- (DisplayPaymentSheetContainerOperation)initWithDisplayPaymentSheetOperation:(id)a3;
- (void)_loadURLBag;
- (void)_postMetricsEventForError:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation DisplayPaymentSheetContainerOperation

- (DisplayPaymentSheetContainerOperation)initWithDisplayPaymentSheetOperation:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DisplayPaymentSheetContainerOperation;
  v6 = [(DisplayPaymentSheetContainerOperation *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstored.DisplayPaymentSheetContainerOperation", 0);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_displayPaymentSheetOperation, a3);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v9;
  }
  return v6;
}

- (void)dealloc
{
  [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation setCompletionHandler:0];
  [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation setContainerCompletionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)DisplayPaymentSheetContainerOperation;
  [(DisplayPaymentSheetContainerOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x2020000000;
  char v110 = 0;
  if (!self->_displayPaymentSheetOperation)
  {
    SSError();
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v61 = +[SSLogConfig sharedDaemonConfig];
    if (!v61)
    {
      id v61 = +[SSLogConfig sharedConfig];
    }
    unsigned int v75 = [v61 shouldLog];
    unsigned int v76 = [v61 shouldLogToDisk];
    v77 = [v61 OSLogObject];
    v78 = v77;
    if (v76) {
      v75 |= 2u;
    }
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      v75 &= 2u;
    }
    if (v75)
    {
      v79 = objc_opt_class();
      int v111 = 138543362;
      id v112 = v79;
      id v80 = v79;
      LODWORD(v99) = 12;
      v81 = (void *)_os_log_send_and_compose_impl();

      if (!v81) {
        goto LABEL_98;
      }
      v78 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, &v111, v99);
      free(v81);
      SSFileLog();
    }

    goto LABEL_98;
  }
  objc_super v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    objc_super v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  unsigned int v5 = [v3 shouldLogToDisk];
  v6 = [v3 OSLogObject];
  dispatch_queue_t v7 = v6;
  if (v5) {
    v4 |= 2u;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    v8 = objc_opt_class();
    int v111 = 138543362;
    id v112 = v8;
    id v9 = v8;
    LODWORD(v99) = 12;
    v94 = &v111;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    dispatch_queue_t v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v111, v99);
    free(v10);
    v94 = (int *)v7;
    SSFileLog();
  }

LABEL_12:
  v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = objc_msgSend(v11, "shouldLog", v94);
  unsigned int v13 = [v11 shouldLogToDisk];
  v14 = [v11 OSLogObject];
  v15 = v14;
  if (v13) {
    v12 |= 2u;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_23;
  }
  id v16 = (id)objc_opt_class();
  v17 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation localAuthAccessControlRef];
  CFStringRef v18 = @"YES";
  if (!v17) {
    CFStringRef v18 = @"NO";
  }
  int v111 = 138543618;
  id v112 = v16;
  __int16 v113 = 2114;
  CFStringRef v114 = v18;
  LODWORD(v99) = 22;
  v95 = &v111;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v111, v99);
    free(v19);
    v95 = (int *)v15;
    SSFileLog();
LABEL_23:
  }
  v20 = +[SSLogConfig sharedDaemonConfig];
  if (!v20)
  {
    v20 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = objc_msgSend(v20, "shouldLog", v95);
  unsigned int v22 = [v20 shouldLogToDisk];
  v23 = [v20 OSLogObject];
  v24 = v23;
  if (v22) {
    v21 |= 2u;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    int v25 = v21;
  }
  else {
    int v25 = v21 & 2;
  }
  if (!v25) {
    goto LABEL_36;
  }
  id v26 = (id)objc_opt_class();
  v27 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation localAuthContext];
  CFStringRef v28 = @"YES";
  if (!v27) {
    CFStringRef v28 = @"NO";
  }
  int v111 = 138543618;
  id v112 = v26;
  __int16 v113 = 2114;
  CFStringRef v114 = v28;
  LODWORD(v99) = 22;
  v96 = &v111;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v111, v99);
    free(v29);
    v96 = (int *)v24;
    SSFileLog();
LABEL_36:
  }
  v30 = +[SSLogConfig sharedDaemonConfig];
  if (!v30)
  {
    v30 = +[SSLogConfig sharedConfig];
  }
  unsigned int v31 = objc_msgSend(v30, "shouldLog", v96);
  unsigned int v32 = [v30 shouldLogToDisk];
  v33 = [v30 OSLogObject];
  v34 = v33;
  if (v32) {
    v31 |= 2u;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
    int v35 = v31;
  }
  else {
    int v35 = v31 & 2;
  }
  if (!v35) {
    goto LABEL_49;
  }
  id v36 = (id)objc_opt_class();
  v37 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation localAuthOptions];
  CFStringRef v38 = @"YES";
  if (!v37) {
    CFStringRef v38 = @"NO";
  }
  int v111 = 138543618;
  id v112 = v36;
  __int16 v113 = 2114;
  CFStringRef v114 = v38;
  LODWORD(v99) = 22;
  v97 = &v111;
  v39 = (void *)_os_log_send_and_compose_impl();

  if (v39)
  {
    v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v111, v99);
    free(v39);
    v97 = (int *)v34;
    SSFileLog();
LABEL_49:
  }
  v40 = +[SSLogConfig sharedDaemonConfig];
  if (!v40)
  {
    v40 = +[SSLogConfig sharedConfig];
  }
  unsigned int v41 = objc_msgSend(v40, "shouldLog", v97);
  unsigned int v42 = [v40 shouldLogToDisk];
  v43 = [v40 OSLogObject];
  v44 = v43;
  if (v42) {
    v41 |= 2u;
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
    int v45 = v41;
  }
  else {
    int v45 = v41 & 2;
  }
  if (!v45) {
    goto LABEL_62;
  }
  id v46 = (id)objc_opt_class();
  v47 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation authenticationContext];
  CFStringRef v48 = @"YES";
  if (!v47) {
    CFStringRef v48 = @"NO";
  }
  int v111 = 138543618;
  id v112 = v46;
  __int16 v113 = 2114;
  CFStringRef v114 = v48;
  LODWORD(v99) = 22;
  v98 = &v111;
  v49 = (void *)_os_log_send_and_compose_impl();

  if (v49)
  {
    v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v111, v99);
    free(v49);
    v98 = (int *)v44;
    SSFileLog();
LABEL_62:
  }
  v50 = +[SSLogConfig sharedDaemonConfig];
  if (!v50)
  {
    v50 = +[SSLogConfig sharedConfig];
  }
  unsigned int v51 = objc_msgSend(v50, "shouldLog", v98);
  unsigned int v52 = [v50 shouldLogToDisk];
  v53 = [v50 OSLogObject];
  v54 = v53;
  if (v52) {
    v51 |= 2u;
  }
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
    int v55 = v51;
  }
  else {
    int v55 = v51 & 2;
  }
  if (v55)
  {
    id v56 = (id)objc_opt_class();
    v57 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation accountIdentifier];
    int v111 = 138543618;
    id v112 = v56;
    __int16 v113 = 2112;
    CFStringRef v114 = v57;
    LODWORD(v99) = 22;
    v58 = (void *)_os_log_send_and_compose_impl();

    if (!v58) {
      goto LABEL_74;
    }
    v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v111, v99);
    free(v58);
    SSFileLog();
  }

LABEL_74:
  v59 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  objc_initWeak(&location, self->_semaphore);
  displayPaymentSheetOperation = self->_displayPaymentSheetOperation;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1001A31CC;
  v102[3] = &unk_1003A8E60;
  objc_copyWeak(&v105, &location);
  id v61 = v59;
  id v103 = v61;
  v104 = &v107;
  [(DisplayPaymentSheetOperation *)displayPaymentSheetOperation setContainerCompletionHandler:v102];
  v62 = +[ISOperationQueue mainQueue];
  [v62 addOperation:self->_displayPaymentSheetOperation];

  semaphore = self->_semaphore;
  dispatch_time_t v64 = dispatch_time(0, 180000000000);
  intptr_t v65 = dispatch_semaphore_wait(semaphore, v64);
  v66 = self->_displayPaymentSheetOperation;
  if (v65)
  {
    [(DisplayPaymentSheetOperation *)v66 dismiss];
    SSError();
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v68 = +[SSLogConfig sharedDaemonConfig];
    if (!v68)
    {
      v68 = +[SSLogConfig sharedConfig];
    }
    unsigned int v69 = [v68 shouldLog];
    unsigned int v70 = [v68 shouldLogToDisk];
    v71 = [v68 OSLogObject];
    v72 = v71;
    if (v70) {
      v69 |= 2u;
    }
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      int v73 = v69;
    }
    else {
      int v73 = v69 & 2;
    }
    if (v73)
    {
      int v111 = 138543362;
      id v112 = v61;
      LODWORD(v99) = 12;
      v74 = (void *)_os_log_send_and_compose_impl();

      if (!v74)
      {
LABEL_86:

        dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
        goto LABEL_87;
      }
      v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v74, 4, &v111, v99);
      free(v74);
      SSFileLog();
    }

    goto LABEL_86;
  }
  if ([(DisplayPaymentSheetOperation *)v66 success])
  {
    v82 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation error];
    BOOL v83 = v82 == 0;

    if (v83)
    {
      v67 = 0;
      goto LABEL_87;
    }
  }
  v67 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation error];
  v84 = +[SSLogConfig sharedDaemonConfig];
  if (!v84)
  {
    v84 = +[SSLogConfig sharedConfig];
  }
  unsigned int v85 = [v84 shouldLog];
  unsigned int v86 = [v84 shouldLogToDisk];
  v87 = [v84 OSLogObject];
  v88 = v87;
  if (v86) {
    v85 |= 2u;
  }
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
    int v89 = v85;
  }
  else {
    int v89 = v85 & 2;
  }
  if (!v89) {
    goto LABEL_111;
  }
  int v111 = 138543618;
  id v112 = v61;
  __int16 v113 = 2114;
  CFStringRef v114 = v67;
  LODWORD(v99) = 22;
  v90 = (void *)_os_log_send_and_compose_impl();

  if (v90)
  {
    v88 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v90, 4, &v111, v99);
    free(v90);
    SSFileLog();
LABEL_111:
  }
  v91 = [(__CFString *)v67 domain];
  if ([v91 isEqualToString:SSErrorDomain])
  {
    if ([(__CFString *)v67 code] == (id)151)
    {
    }
    else
    {
      BOOL v92 = [(__CFString *)v67 code] == (id)152;

      if (!v92) {
        goto LABEL_87;
      }
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A3360;
    block[3] = &unk_1003A3268;
    block[4] = self;
    v67 = v67;
    v101 = v67;
    dispatch_async(dispatchQueue, block);

    goto LABEL_87;
  }

LABEL_87:
  objc_destroyWeak(&v105);
  objc_destroyWeak(&location);
LABEL_98:

  [(DisplayPaymentSheetContainerOperation *)self setSuccess:*((unsigned __int8 *)v108 + 24)];
  [(DisplayPaymentSheetContainerOperation *)self setError:v67];

  _Block_object_dispose(&v107, 8);
}

- (void)_loadURLBag
{
  id v3 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v17 = 0;
  unsigned int v4 = [(DisplayPaymentSheetContainerOperation *)self runSubOperation:v3 returningError:&v17];
  id v5 = v17;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v15 = [v3 URLBag];
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_17;
  }
  urlBag = +[SSLogConfig sharedDaemonConfig];
  if (!urlBag)
  {
    urlBag = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [urlBag shouldLog];
  if ([urlBag shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [urlBag OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_15;
  }
  unsigned int v12 = objc_opt_class();
  int v18 = 138543618;
  v19 = v12;
  __int16 v20 = 2114;
  unsigned int v21 = v6;
  id v13 = v12;
  LODWORD(v16) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
    free(v14);
    SSFileLog();
LABEL_15:
  }
LABEL_17:
}

- (void)_postMetricsEventForError:(id)a3
{
  id v4 = a3;
  urlBag = self->_urlBag;
  if (urlBag
    || ([(DisplayPaymentSheetContainerOperation *)self _loadURLBag], (urlBag = self->_urlBag) != 0))
  {
    v6 = [(ISURLBag *)urlBag valueForKey:SSMetricsURLBagKey];
    if ([v6 count])
    {
      BOOL v7 = objc_alloc_init((Class)NSMutableDictionary);
      [v7 setObject:SSMetricsDialogEventIdPaymentSheet forKey:SSAuthorizationMetricsKeyDialogID];
      [v7 setObject:&off_1003C94C8 forKey:SSAuthorizationMetricsKeyEventType];
      if (v4) {
        [v7 setObject:v4 forKey:SSAuthorizationMetricsKeyError];
      }
      v8 = [(DisplayPaymentSheetOperation *)self->_displayPaymentSheetOperation paymentSheet];
      unsigned int v9 = [v8 buyParams];

      if (v9) {
        [v7 setObject:v9 forKey:SSAuthorizationMetricsKeyBuyParams];
      }
      int v10 = +[SSAuthorizationMetricsController authorizationDialogEventForParameters:v7];
      id v11 = [objc_alloc((Class)SSMetricsConfiguration) initWithGlobalConfiguration:v6];
      id v12 = objc_alloc_init((Class)SSMetricsController);
      [v12 setGlobalConfiguration:v11];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1001A3A04;
      v23[3] = &unk_1003A3700;
      v23[4] = self;
      [v12 insertEvent:v10 withCompletionHandler:v23];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1001A3BA0;
      v22[3] = &unk_1003A3700;
      v22[4] = self;
      [v12 flushUnreportedEventsWithCompletionHandler:v22];
    }
    else
    {
      BOOL v7 = +[SSLogConfig sharedDaemonConfig];
      if (!v7)
      {
        BOOL v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v13 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      unsigned int v9 = [v7 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        v14 &= 2u;
      }
      if (v14)
      {
        int v24 = 138543362;
        id v25 = (id)objc_opt_class();
        id v15 = v25;
        LODWORD(v21) = 12;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16) {
          goto LABEL_10;
        }
        unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v24, v21);
        free(v16);
        SSFileLog();
      }
    }
  }
  else
  {
    v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    BOOL v7 = [v6 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v24 = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      LODWORD(v21) = 12;
      __int16 v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_11;
      }
      BOOL v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v24, v21);
      free(v20);
      SSFileLog();
    }
  }
LABEL_10:

LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_displayPaymentSheetOperation, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end