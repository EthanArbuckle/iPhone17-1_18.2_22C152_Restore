@interface W5DiagnosticsModeProcessor
- (BOOL)_canStartMode:(id)a3 error:(id *)a4;
- (NSDictionary)configuration;
- (NSMutableArray)operationErrors;
- (NSOperationQueue)queue;
- (W5DiagnosticsMode)mode;
- (W5DiagnosticsModePeer)currentPeer;
- (W5DiagnosticsModeProcessor)initWithCurrentPeer:(id)a3;
- (void)_cleanup;
- (void)_runAction:(int64_t)a3 peer:(id)a4 info:(id)a5 handler:(id)a6 completion:(id)a7;
- (void)performStartOperationsWithConfiguration:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)performStopOperationsForMode:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)performUpdateOperationsForMode:(id)a3 incomingMode:(id)a4 handler:(id)a5 completion:(id)a6;
- (void)setConfiguration:(id)a3;
- (void)setCurrentPeer:(id)a3;
- (void)setMode:(id)a3;
- (void)setOperationErrors:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation W5DiagnosticsModeProcessor

- (W5DiagnosticsModeProcessor)initWithCurrentPeer:(id)a3
{
  v4 = (W5DiagnosticsModePeer *)a3;
  v12.receiver = self;
  v12.super_class = (Class)W5DiagnosticsModeProcessor;
  v5 = [(W5DiagnosticsModeProcessor *)&v12 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (!v4)
  {
    v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      v14 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      __int16 v15 = 2080;
      v16 = "W5DiagnosticsModeProcessor.m";
      __int16 v17 = 1024;
      int v18 = 32;
      __int16 v19 = 2080;
      v20 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      _os_log_send_and_compose_impl();
    }

    goto LABEL_9;
  }
  v5->_currentPeer = v4;
  v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  queue = v6->_queue;
  v6->_queue = v7;

  v9 = v6->_queue;
  if (!v9)
  {
LABEL_9:

    v6 = 0;
    goto LABEL_5;
  }
  [(NSOperationQueue *)v9 setMaxConcurrentOperationCount:1];
LABEL_5:

  return v6;
}

- (void)performStartOperationsWithConfiguration:(id)a3 handler:(id)a4 completion:(id)a5
{
  v60 = (char *)a3;
  id v64 = a4;
  v8 = (void (**)(id, void, void *))a5;
  v9 = sub_10009756C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    __int16 v101 = 2080;
    v102 = "W5DiagnosticsModeProcessor.m";
    __int16 v103 = 1024;
    int v104 = 53;
    __int16 v105 = 2080;
    v106 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    __int16 v107 = 2114;
    v108 = v60;
    LODWORD(v57) = 48;
    v56 = location;
    _os_log_send_and_compose_impl();
  }

  id v10 = [objc_alloc((Class)W5DiagnosticsMode) initWithConfiguration:v60];
  [(W5DiagnosticsModeProcessor *)self setMode:v10];

  v11 = [(W5DiagnosticsModeProcessor *)self mode];
  LODWORD(v10) = v11 == 0;

  if (v10)
  {
    v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v101 = 2080;
      v102 = "W5DiagnosticsModeProcessor.m";
      __int16 v103 = 1024;
      int v104 = 57;
      __int16 v105 = 2114;
      v106 = v60;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v97 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v98 = @"W5ParamErr";
    v58 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    v59 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v58];
    v99 = v59;
    v23 = +[NSArray arrayWithObjects:&v99 count:1];
    v8[2](v8, 0, v23);
  }
  else
  {
    objc_super v12 = [(W5DiagnosticsModeProcessor *)self mode];
    id v80 = 0;
    unsigned __int8 v13 = [(W5DiagnosticsModeProcessor *)self _canStartMode:v12 error:&v80];
    v58 = (char *)v80;

    if (v13)
    {
      [(W5DiagnosticsModeProcessor *)self setConfiguration:v60];
      v14 = [(W5DiagnosticsModeProcessor *)self mode];
      [v14 setState:3];

      __int16 v15 = +[NSMutableArray array];
      [(W5DiagnosticsModeProcessor *)self setOperationErrors:v15];

      v16 = [(W5DiagnosticsModeProcessor *)self mode];
      v59 = [v16 peers];

      __int16 v17 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      unsigned __int8 v18 = [v17 role];

      if ((v18 & 8) != 0)
      {
        v25 = sub_10008E788(v59, 1);
        id obj = v25;
        if (v25)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v26 = [v25 countByEnumeratingWithState:&v76 objects:v95 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v77;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v77 != v27) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v29 = *(void *)(*((void *)&v76 + 1) + 8 * i);
                CFStringRef v93 = @"DiagnosticsMode";
                v30 = [(W5DiagnosticsModeProcessor *)self mode];
                v94 = v30;
                v31 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                [(W5DiagnosticsModeProcessor *)self _runAction:3 peer:v29 info:v31 handler:v64 completion:v8];
              }
              id v26 = [obj countByEnumeratingWithState:&v76 objects:v95 count:16];
            }
            while (v26);
          }
        }
        else
        {
          v37 = sub_10009756C();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            LODWORD(v57) = 12;
            v56 = location;
            _os_log_send_and_compose_impl();
          }
        }
        v38 = sub_10008E788(v59, 2);
        id v62 = v38;
        if (v38)
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v39 = [v38 countByEnumeratingWithState:&v72 objects:v92 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v73;
            do
            {
              for (j = 0; j != v39; j = (char *)j + 1)
              {
                if (*(void *)v73 != v40) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v42 = *(void *)(*((void *)&v72 + 1) + 8 * (void)j);
                CFStringRef v90 = @"DiagnosticsMode";
                v43 = [(W5DiagnosticsModeProcessor *)self mode];
                v91 = v43;
                v44 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
                [(W5DiagnosticsModeProcessor *)self _runAction:4 peer:v42 info:v44 handler:v64 completion:v8];
              }
              id v39 = [v62 countByEnumeratingWithState:&v72 objects:v92 count:16];
            }
            while (v39);
          }
        }
        else
        {
          v45 = sub_10009756C();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            LODWORD(v57) = 12;
            v56 = location;
            _os_log_send_and_compose_impl();
          }
        }
        v46 = sub_10008E788(v59, 4);
        id v61 = v46;
        if (v46)
        {
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v47 = [v46 countByEnumeratingWithState:&v68 objects:v89 count:16];
          if (v47)
          {
            uint64_t v48 = *(void *)v69;
            do
            {
              for (k = 0; k != v47; k = (char *)k + 1)
              {
                if (*(void *)v69 != v48) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v50 = *(void *)(*((void *)&v68 + 1) + 8 * (void)k);
                CFStringRef v87 = @"DiagnosticsMode";
                v51 = [(W5DiagnosticsModeProcessor *)self mode];
                v88 = v51;
                v52 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                [(W5DiagnosticsModeProcessor *)self _runAction:0 peer:v50 info:v52 handler:v64 completion:v8];

                CFStringRef v85 = @"DiagnosticsMode";
                v53 = [(W5DiagnosticsModeProcessor *)self mode];
                v86 = v53;
                v54 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
                [(W5DiagnosticsModeProcessor *)self _runAction:5 peer:v50 info:v54 handler:v64 completion:v8];
              }
              id v47 = [v61 countByEnumeratingWithState:&v68 objects:v89 count:16];
            }
            while (v47);
          }
          goto LABEL_54;
        }
        v36 = sub_10009756C();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
          _os_log_send_and_compose_impl();
        }
        id v61 = 0;
      }
      else
      {
        __int16 v19 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        if ([v19 role])
        {
        }
        else
        {
          v20 = [(W5DiagnosticsModeProcessor *)self currentPeer];
          BOOL v21 = ((unint64_t)[v20 role] & 2) == 0;

          if (v21) {
            goto LABEL_55;
          }
        }
        v32 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        v83[0] = @"event";
        id v33 = [objc_alloc((Class)NSNumber) initWithInt:0];
        v83[1] = @"DiagnosticsMode";
        v84[0] = v33;
        v34 = [(W5DiagnosticsModeProcessor *)self mode];
        v84[1] = v34;
        v35 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
        [(W5DiagnosticsModeProcessor *)self _runAction:6 peer:v32 info:v35 handler:v64 completion:v8];

        id obj = [(W5DiagnosticsModeProcessor *)self currentPeer];
        v81[0] = @"event";
        id v62 = [objc_alloc((Class)NSNumber) initWithInt:0];
        v81[1] = @"DiagnosticsMode";
        v82[0] = v62;
        id v61 = [(W5DiagnosticsModeProcessor *)self mode];
        v82[1] = v61;
        v36 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
        [(W5DiagnosticsModeProcessor *)self _runAction:11 peer:obj info:v36 handler:v64 completion:v8];
      }

LABEL_54:
LABEL_55:
      objc_initWeak((id *)location, self);
      v55 = [(W5DiagnosticsModeProcessor *)self queue];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10008E8D4;
      v65[3] = &unk_1000DF480;
      objc_copyWeak(&v67, (id *)location);
      v66 = v8;
      [v55 addBarrierBlock:v65];

      objc_destroyWeak(&v67);
      objc_destroyWeak((id *)location);
      goto LABEL_56;
    }
    v24 = sub_10009756C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v101 = 2080;
      v102 = "W5DiagnosticsModeProcessor.m";
      __int16 v103 = 1024;
      int v104 = 65;
      __int16 v105 = 2080;
      v106 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v107 = 2114;
      v108 = v58;
      _os_log_send_and_compose_impl();
    }

    v96 = v58;
    v59 = +[NSArray arrayWithObjects:&v96 count:1];
    v8[2](v8, 0, v59);
  }
LABEL_56:
}

- (BOOL)_canStartMode:(id)a3 error:(id *)a4
{
  v5 = [a3 peers];
  v6 = sub_10008E788(v5, 4);

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) info:v18];
          unsigned __int8 v13 = [v12 objectForKeyedSubscript:@"PrimaryChannel"];

          if (!v13)
          {
            NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
            CFStringRef v23 = @"W5ParamErr";
            BOOL v15 = 1;
            __int16 v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
            id v14 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v17];

            if (a4 && v14)
            {
              id v14 = v14;
              BOOL v15 = 0;
              *a4 = v14;
            }
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  id v14 = 0;
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (void)performStopOperationsForMode:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v98 = a4;
  id v99 = a5;
  v92 = v7;
  if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4 || objc_msgSend(v7, "state") == (id)5)
  {
    [(W5DiagnosticsModeProcessor *)self setMode:v7];
    id v8 = +[NSMutableArray array];
    [(W5DiagnosticsModeProcessor *)self setOperationErrors:v8];

    id v9 = [(W5DiagnosticsModeProcessor *)self mode];
    [v9 setState:10];

    uint64_t v10 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    if (([v10 role] & 8) != 0)
    {
    }
    else
    {
      v11 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      unsigned __int8 v12 = [v11 role];

      if ((v12 & 1) == 0) {
        goto LABEL_52;
      }
    }
    unsigned __int8 v13 = [(W5DiagnosticsModeProcessor *)self mode];
    id v14 = [v13 peers];
    v91 = sub_10008E788(v14, 4);

    if (!v91)
    {
      id obj = sub_10009756C();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315138;
        *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
        LODWORD(v90) = 12;
        v89 = location;
        _os_log_send_and_compose_impl();
      }
LABEL_25:

      v31 = [(W5DiagnosticsModeProcessor *)self mode];
      v32 = [v31 peers];
      id v33 = sub_10008E788(v32, 1);

      v34 = [(W5DiagnosticsModeProcessor *)self mode];
      v35 = [v34 peers];
      v36 = sub_10008E788(v35, 2);

      id v101 = objc_alloc_init((Class)NSMutableArray);
      if (v33) {
        [v101 addObjectsFromArray:v33];
      }
      if (v36) {
        [v101 addObjectsFromArray:v36];
      }
      CFStringRef v150 = @"peers";
      id v151 = v101;
      v37 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1, v89, v90);
      [(W5DiagnosticsModeProcessor *)self _runAction:12 peer:0 info:v37 handler:v98 completion:v99];

      if (v33)
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        v38 = v33;
        id v39 = [v38 countByEnumeratingWithState:&v110 objects:v149 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v111;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v111 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v110 + 1) + 8 * i);
              CFStringRef v147 = @"DiagnosticsMode";
              v43 = [(W5DiagnosticsModeProcessor *)self mode];
              v148 = v43;
              v44 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
              [(W5DiagnosticsModeProcessor *)self _runAction:3 peer:v42 info:v44 handler:v98 completion:v99];
            }
            id v39 = [v38 countByEnumeratingWithState:&v110 objects:v149 count:16];
          }
          while (v39);
        }
      }
      else
      {
        v38 = sub_10009756C();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          LODWORD(v90) = 12;
          v89 = location;
          _os_log_send_and_compose_impl();
        }
      }

      if (v36)
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        v45 = v36;
        id v46 = [v45 countByEnumeratingWithState:&v106 objects:v146 count:16];
        if (v46)
        {
          uint64_t v47 = *(void *)v107;
          do
          {
            for (j = 0; j != v46; j = (char *)j + 1)
            {
              if (*(void *)v107 != v47) {
                objc_enumerationMutation(v45);
              }
              uint64_t v49 = *(void *)(*((void *)&v106 + 1) + 8 * (void)j);
              CFStringRef v144 = @"DiagnosticsMode";
              uint64_t v50 = [(W5DiagnosticsModeProcessor *)self mode];
              v145 = v50;
              v51 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
              [(W5DiagnosticsModeProcessor *)self _runAction:4 peer:v49 info:v51 handler:v98 completion:v99];
            }
            id v46 = [v45 countByEnumeratingWithState:&v106 objects:v146 count:16];
          }
          while (v46);
        }
      }
      else
      {
        v45 = sub_10009756C();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          LODWORD(v90) = 12;
          v89 = location;
          _os_log_send_and_compose_impl();
        }
      }

LABEL_52:
      v52 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      if ([v52 role])
      {
      }
      else
      {
        v53 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        BOOL v54 = ((unint64_t)[v53 role] & 2) == 0;

        if (v54) {
          goto LABEL_57;
        }
      }
      v55 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      v142[0] = @"event";
      id v56 = [objc_alloc((Class)NSNumber) initWithInt:1];
      v143[0] = v56;
      v142[1] = @"DiagnosticsMode";
      uint64_t v57 = [(W5DiagnosticsModeProcessor *)self mode];
      v143[1] = v57;
      v58 = +[NSDictionary dictionaryWithObjects:v143 forKeys:v142 count:2];
      [(W5DiagnosticsModeProcessor *)self _runAction:6 peer:v55 info:v58 handler:v98 completion:v99];

      v59 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      v140[0] = @"event";
      id v60 = [objc_alloc((Class)NSNumber) initWithInt:1];
      v140[1] = @"DiagnosticsMode";
      v141[0] = v60;
      v141[1] = v92;
      id v61 = +[NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:2];
      [(W5DiagnosticsModeProcessor *)self _runAction:11 peer:v59 info:v61 handler:v98 completion:v99];

      id v62 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      CFStringRef v138 = @"DiagnosticsMode";
      v63 = [(W5DiagnosticsModeProcessor *)self mode];
      v139 = v63;
      id v64 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:8 peer:v62 info:v64 handler:v98 completion:v99];

      v65 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      CFStringRef v136 = @"DiagnosticsMode";
      v66 = [(W5DiagnosticsModeProcessor *)self mode];
      v137 = v66;
      id v67 = +[NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:10 peer:v65 info:v67 handler:v98 completion:v99];

LABEL_57:
      long long v68 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      unsigned __int8 v69 = [v68 role];

      if (v69)
      {
        long long v70 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        CFStringRef v134 = @"DiagnosticsMode";
        long long v71 = [(W5DiagnosticsModeProcessor *)self mode];
        v135 = v71;
        long long v72 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
        [(W5DiagnosticsModeProcessor *)self _runAction:7 peer:v70 info:v72 handler:v98 completion:v99];
      }
      long long v73 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      unsigned __int8 v74 = [v73 role];

      if ((v74 & 4) != 0)
      {
        long long v75 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        CFStringRef v132 = @"DiagnosticsMode";
        long long v76 = [(W5DiagnosticsModeProcessor *)self mode];
        v133 = v76;
        long long v77 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
        [(W5DiagnosticsModeProcessor *)self _runAction:8 peer:v75 info:v77 handler:v98 completion:v99];

        long long v78 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        CFStringRef v130 = @"DiagnosticsMode";
        v131 = v92;
        long long v79 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        [(W5DiagnosticsModeProcessor *)self _runAction:9 peer:v78 info:v79 handler:v98 completion:v99];
      }
      id v80 = [(W5DiagnosticsModeProcessor *)self operationErrors];
      if (v80)
      {
        v81 = [(W5DiagnosticsModeProcessor *)self operationErrors];
        BOOL v82 = [v81 count] == 0;

        if (!v82)
        {
          v83 = [(W5DiagnosticsModeProcessor *)self mode];
          [v83 setState:5];
        }
      }
      objc_initWeak((id *)location, self);
      v84 = [(W5DiagnosticsModeProcessor *)self queue];
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_10008FB38;
      v103[3] = &unk_1000DF480;
      objc_copyWeak(&v105, (id *)location);
      id v104 = v99;
      [v84 addBarrierBlock:v103];

      objc_destroyWeak(&v105);
      objc_destroyWeak((id *)location);
      goto LABEL_65;
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id obj = v91;
    id v95 = [obj countByEnumeratingWithState:&v114 objects:v156 count:16];
    if (!v95) {
      goto LABEL_25;
    }
    uint64_t v94 = *(void *)v115;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v115 != v94)
      {
        uint64_t v16 = v15;
        objc_enumerationMutation(obj);
        uint64_t v15 = v16;
      }
      uint64_t v96 = v15;
      v100 = *(void **)(*((void *)&v114 + 1) + 8 * v15);
      CFStringRef v154 = @"DiagnosticsMode";
      __int16 v17 = [(W5DiagnosticsModeProcessor *)self mode];
      v155 = v17;
      long long v18 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:1 peer:v100 info:v18 handler:v98 completion:v99];

      NSErrorUserInfoKey v97 = [v100 peer];
      long long v19 = [v97 peerID];
      long long v20 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      long long v21 = [v20 peer];
      NSErrorUserInfoKey v22 = [v21 peerID];
      if (v19 == v22) {
        break;
      }
      CFStringRef v23 = [v100 peer];
      v24 = [v23 peerID];
      v25 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      id v26 = [v25 peer];
      uint64_t v27 = [v26 peerID];
      unsigned __int8 v28 = [v24 isEqual:v27];

      if (v28) {
        goto LABEL_18;
      }
      CFStringRef v152 = @"DiagnosticsMode";
      uint64_t v29 = [(W5DiagnosticsModeProcessor *)self mode];
      v153 = v29;
      v30 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:5 peer:v100 info:v30 handler:v98 completion:v99];

LABEL_20:
      uint64_t v15 = v96 + 1;
      if (v95 == (id)(v96 + 1))
      {
        id v95 = [obj countByEnumeratingWithState:&v114 objects:v156 count:16];
        if (!v95) {
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }

LABEL_18:
    uint64_t v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
      __int16 v122 = 2112;
      v123 = (const char *)v100;
      LODWORD(v90) = 22;
      v89 = location;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_20;
  }
  CFStringRef v85 = sub_10009756C();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
    __int16 v122 = 2080;
    *(_DWORD *)location = 136316162;
    v123 = "W5DiagnosticsModeProcessor.m";
    __int16 v124 = 1024;
    int v125 = 351;
    __int16 v126 = 2048;
    id v127 = [v7 state];
    __int16 v128 = 2114;
    id v129 = v7;
    _os_log_send_and_compose_impl();
  }

  NSErrorUserInfoKey v118 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v119 = @"W5ParamErr";
  v86 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
  CFStringRef v87 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v86];
  v120 = v87;
  v88 = +[NSArray arrayWithObjects:&v120 count:1];
  (*((void (**)(id, void, void *))v99 + 2))(v99, 0, v88);

LABEL_65:
}

- (void)performUpdateOperationsForMode:(id)a3 incomingMode:(id)a4 handler:(id)a5 completion:(id)a6
{
  id v63 = a3;
  id v10 = a4;
  id v62 = a5;
  id v11 = a6;
  [(W5DiagnosticsModeProcessor *)self setMode:v10];
  unsigned __int8 v12 = +[NSMutableArray array];
  [(W5DiagnosticsModeProcessor *)self setOperationErrors:v12];

  if ([v10 state] != (id)3) {
    goto LABEL_13;
  }
  if (!v63)
  {
    unsigned __int8 v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
      __int16 v88 = 2080;
      v89 = "W5DiagnosticsModeProcessor.m";
      __int16 v90 = 1024;
      int v91 = 369;
      LODWORD(v61) = 28;
      id v60 = location;
      _os_log_send_and_compose_impl();
    }

    id v63 = v10;
  }
  id v14 = [(W5DiagnosticsModeProcessor *)self currentPeer];
  if ([v14 role])
  {

    goto LABEL_10;
  }
  uint64_t v15 = [(W5DiagnosticsModeProcessor *)self currentPeer];
  BOOL v16 = ((unint64_t)[v15 role] & 2) == 0;

  if (!v16)
  {
LABEL_10:
    __int16 v17 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    v98[0] = @"event";
    id v18 = [objc_alloc((Class)NSNumber) initWithInt:0];
    v98[1] = @"DiagnosticsMode";
    v99[0] = v18;
    v99[1] = v63;
    long long v19 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
    [(W5DiagnosticsModeProcessor *)self _runAction:6 peer:v17 info:v19 handler:v62 completion:v11];

    long long v20 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    v96[0] = @"event";
    id v21 = [objc_alloc((Class)NSNumber) initWithInt:0];
    v96[1] = @"DiagnosticsMode";
    v97[0] = v21;
    v97[1] = v63;
    NSErrorUserInfoKey v22 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
    [(W5DiagnosticsModeProcessor *)self _runAction:11 peer:v20 info:v22 handler:v62 completion:v11];
  }
  CFStringRef v23 = [(W5DiagnosticsModeProcessor *)self currentPeer];
  unsigned __int8 v24 = [v23 role];

  if ((v24 & 4) != 0)
  {
    v25 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    CFStringRef v94 = @"DiagnosticsMode";
    id v95 = v63;
    id v26 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    [(W5DiagnosticsModeProcessor *)self _runAction:5 peer:v25 info:v26 handler:v62 completion:v11];
  }
LABEL_13:
  if ([v10 state] != (id)10)
  {
LABEL_29:
    objc_initWeak((id *)location, self);
    v59 = [(W5DiagnosticsModeProcessor *)self queue];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100090614;
    v64[3] = &unk_1000DF4A8;
    id v66 = v11;
    id v65 = v10;
    objc_copyWeak(&v67, (id *)location);
    [v59 addBarrierBlock:v64];

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)location);
    goto LABEL_30;
  }
  if (v63)
  {
    uint64_t v27 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    unsigned __int8 v28 = [v27 role];

    if (v28)
    {
      uint64_t v29 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      CFStringRef v82 = @"DiagnosticsMode";
      id v83 = v63;
      v30 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:7 peer:v29 info:v30 handler:v62 completion:v11];
    }
    v31 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    unsigned __int8 v32 = [v31 role];

    if ((v32 & 2) != 0)
    {
      id v33 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      CFStringRef v80 = @"DiagnosticsMode";
      id v81 = v63;
      v34 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      [(W5DiagnosticsModeProcessor *)self _runAction:9 peer:v33 info:v34 handler:v62 completion:v11];
    }
    v35 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    if ([v35 role])
    {
    }
    else
    {
      v36 = [(W5DiagnosticsModeProcessor *)self currentPeer];
      BOOL v37 = ((unint64_t)[v36 role] & 2) == 0;

      if (v37)
      {
LABEL_27:
        v53 = [(W5DiagnosticsModeProcessor *)self currentPeer];
        unsigned __int8 v54 = [v53 role];

        if ((v54 & 4) != 0)
        {
          v55 = [(W5DiagnosticsModeProcessor *)self currentPeer];
          CFStringRef v70 = @"DiagnosticsMode";
          id v71 = v63;
          id v56 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          [(W5DiagnosticsModeProcessor *)self _runAction:8 peer:v55 info:v56 handler:v62 completion:v11];

          uint64_t v57 = [(W5DiagnosticsModeProcessor *)self currentPeer];
          CFStringRef v68 = @"DiagnosticsMode";
          id v69 = v63;
          v58 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          [(W5DiagnosticsModeProcessor *)self _runAction:9 peer:v57 info:v58 handler:v62 completion:v11];
        }
        goto LABEL_29;
      }
    }
    uint64_t v42 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    v78[0] = @"event";
    id v43 = [objc_alloc((Class)NSNumber) initWithInt:1];
    v78[1] = @"DiagnosticsMode";
    v79[0] = v43;
    v79[1] = v63;
    v44 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
    [(W5DiagnosticsModeProcessor *)self _runAction:6 peer:v42 info:v44 handler:v62 completion:v11];

    v45 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    v76[0] = @"event";
    id v46 = [objc_alloc((Class)NSNumber) initWithInt:1];
    v76[1] = @"DiagnosticsMode";
    v77[0] = v46;
    v77[1] = v63;
    uint64_t v47 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    [(W5DiagnosticsModeProcessor *)self _runAction:11 peer:v45 info:v47 handler:v62 completion:v11];

    uint64_t v48 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    CFStringRef v74 = @"DiagnosticsMode";
    id v75 = v63;
    uint64_t v49 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [(W5DiagnosticsModeProcessor *)self _runAction:8 peer:v48 info:v49 handler:v62 completion:v11];

    uint64_t v50 = [(W5DiagnosticsModeProcessor *)self currentPeer];
    CFStringRef v72 = @"DiagnosticsMode";
    v51 = [(W5DiagnosticsModeProcessor *)self mode];
    long long v73 = v51;
    v52 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    [(W5DiagnosticsModeProcessor *)self _runAction:10 peer:v50 info:v52 handler:v62 completion:v11];

    goto LABEL_27;
  }
  v38 = sub_10009756C();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
    __int16 v88 = 2080;
    v89 = "W5DiagnosticsModeProcessor.m";
    __int16 v90 = 1024;
    int v91 = 404;
    __int16 v92 = 2112;
    id v93 = v10;
    _os_log_send_and_compose_impl();
  }

  NSErrorUserInfoKey v84 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v85 = @"W5ParamErr";
  id v39 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  uint64_t v40 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v39];
  v86 = v40;
  v41 = +[NSArray arrayWithObjects:&v86 count:1];
  (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v41);

LABEL_30:
}

- (void)_runAction:(int64_t)a3 peer:(id)a4 info:(id)a5 handler:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  BOOL v16 = [(W5DiagnosticsModeProcessor *)self queue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000908E8;
  v20[3] = &unk_1000DF4D0;
  id v17 = v14;
  id v23 = v17;
  v24[1] = (id)a3;
  id v18 = v12;
  id v21 = v18;
  id v19 = v13;
  id v22 = v19;
  objc_copyWeak(v24, &location);
  [v16 addOperationWithBlock:v20];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (void)_cleanup
{
  id v2 = [(W5DiagnosticsModeProcessor *)self queue];
  [v2 cancelAllOperations];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (W5DiagnosticsMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (W5DiagnosticsModePeer)currentPeer
{
  return self->_currentPeer;
}

- (void)setCurrentPeer:(id)a3
{
  self->_currentPeer = (W5DiagnosticsModePeer *)a3;
}

- (NSMutableArray)operationErrors
{
  return self->_operationErrors;
}

- (void)setOperationErrors:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationErrors, 0);
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end