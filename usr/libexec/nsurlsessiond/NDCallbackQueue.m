@interface NDCallbackQueue
- (NDCallbackQueue)initWithDelegate:(id)a3;
- (NDCallbackQueueDelegate)delegate;
- (unint64_t)count;
- (void)addPendingCallback:(id)a3 wakeRequirement:(int64_t)a4;
- (void)addPendingCallbackToFront:(id)a3;
- (void)drainCallback:(id)a3;
- (void)drainCallbacksForTaskIdentifier:(unint64_t)a3;
- (void)performAllCallbacks;
- (void)performCallback:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NDCallbackQueue

- (NDCallbackQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NDCallbackQueue;
  v5 = [(NDCallbackQueue *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(NDCallbackQueue *)v5 setDelegate:v4];
    uint64_t v7 = +[NSMutableArray array];
    callbacks = v6->_callbacks;
    v6->_callbacks = (NSMutableArray *)v7;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_callbacks, 0);
}

- (NDCallbackQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDCallbackQueueDelegate *)WeakRetained;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_callbacks count];
}

- (void)drainCallbacksForTaskIdentifier:(unint64_t)a3
{
  v5 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_callbacks;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 taskIdentifier] == (id)a3) {
          [v5 addObject:v10];
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
        -[NDCallbackQueue drainCallback:](self, "drainCallback:", v15, (void)v16);
        [(NSMutableArray *)self->_callbacks removeObject:v15];
      }
      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)performAllCallbacks
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_callbacks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[NDCallbackQueue performCallback:](self, "performCallback:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addPendingCallback:(id)a3 wakeRequirement:(int64_t)a4
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NSMutableArray *)self->_callbacks addObject:v8];
  long long v7 = [WeakRetained getClientProxy];

  if (v7)
  {
    [(NDCallbackQueue *)self performCallback:v8];
  }
  else if (a4)
  {
    [WeakRetained wakeUpClient:a4];
  }
}

- (void)addPendingCallbackToFront:(id)a3
{
}

- (void)drainCallback:(id)a3
{
  id v4 = a3;
  if (([v4 hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    switch([v4 type])
    {
      case 2u:
        v6 = [v4 args];
        long long v7 = [v6 objectAtIndexedSubscript:1];

        id v8 = (id)qword_1000CB148;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [WeakRetained descriptionForTaskWithIdentifier:[v4 taskIdentifier]];
          int v21 = 138543362;
          long long v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ draining authentication challenge callback", (uint8_t *)&v21, 0xCu);
        }
        goto LABEL_5;
      case 5u:
        long long v10 = [v4 args];
        long long v7 = [v10 objectAtIndexedSubscript:1];

        id v11 = (id)qword_1000CB148;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [WeakRetained descriptionForTaskWithIdentifier:[v4 taskIdentifier]];
          int v21 = 138543362;
          long long v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ draining willSendRequest callback", (uint8_t *)&v21, 0xCu);
        }
        v7[2](v7, 0, 0);
        goto LABEL_18;
      case 6u:
        uint64_t v13 = [v4 args];
        long long v7 = [v13 objectAtIndexedSubscript:2];

        v14 = (id)qword_1000CB148;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [WeakRetained descriptionForTaskWithIdentifier:[v4 taskIdentifier]];
          int v21 = 138543362;
          long long v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ draining openFileAtPath callback", (uint8_t *)&v21, 0xCu);
        }
        ((void (*)(void (**)(void, void, void), void))v7[2])(v7, 0);
        goto LABEL_18;
      case 9u:
        long long v16 = [v4 args];
        long long v7 = [v16 objectAtIndexedSubscript:1];

        id v8 = (id)qword_1000CB148;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = [WeakRetained descriptionForTaskWithIdentifier:[v4 taskIdentifier]];
          int v21 = 138543362;
          long long v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ draining willBeginDelayedRequest callback", (uint8_t *)&v21, 0xCu);
        }
LABEL_5:

        v7[2](v7, 2, 0);
        goto LABEL_18;
      case 0xAu:
        long long v18 = [v4 args];
        long long v7 = [v18 objectAtIndexedSubscript:0];

        long long v19 = (id)qword_1000CB148;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = [WeakRetained descriptionForTaskWithIdentifier:[v4 taskIdentifier]];
          int v21 = 138543362;
          long long v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ draining getAuthHeadersForResponse callback", (uint8_t *)&v21, 0xCu);
        }
        ((void (*)(void (**)(void, void, void), void, void, void))v7[2])(v7, 0, 0, 0);
LABEL_18:

        break;
      default:
        break;
    }
    [v4 setHasBeenCalled:1];
  }
}

- (void)performCallback:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained getClientProxy];
  id v7 = [v4 taskIdentifier];
  switch([v4 type])
  {
    case 0u:
      id v8 = [v4 args];
      long long v9 = [v8 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = 0;
      }
      else
      {
        v67 = [v4 args];
        id v10 = [v67 objectAtIndexedSubscript:0];
      }
      v68 = [v4 args];
      v69 = [v68 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v70 = 0;
      }
      else
      {
        v76 = [v4 args];
        v70 = [v76 objectAtIndexedSubscript:1];
      }
      v77 = [v4 args];
      v78 = [v77 objectAtIndexedSubscript:2];

      v178[0] = _NSConcreteStackBlock;
      v178[1] = 3221225472;
      v178[2] = sub_100069598;
      v178[3] = &unk_1000B61C8;
      v178[4] = self;
      v79 = [v6 remoteObjectProxyWithErrorHandler:v178];
      v173[0] = _NSConcreteStackBlock;
      v173[1] = 3221225472;
      v173[2] = sub_100069610;
      v173[3] = &unk_1000B6448;
      id v177 = v7;
      id v174 = WeakRetained;
      v175 = self;
      id v176 = v4;
      [v79 backgroundTask:v7 didCompleteWithError:v10 taskMetrics:v70 info:v78 reply:v173];

      goto LABEL_53;
    case 1u:
      id v11 = [v4 args];
      if ([v11 count])
      {
        id v12 = [v4 args];
        uint64_t v13 = [v12 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v13 = 0;
      }

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v81 = v13;
      v82 = v81;
      id v10 = v81;
      if (isKindOfClass)
      {
        v83 = [v81 pathToDownloadTaskFile];
        if (v83
          || ([v82 additionalProperties],
              v84 = objc_claimAutoreleasedReturnValue(),
              [v84 objectForKeyedSubscript:@"pathToDownloadTaskFile"],
              v83 = objc_claimAutoreleasedReturnValue(),
              v84,
              v83))
        {
          id v10 = +[NSURL fileURLWithPath:v83 isDirectory:0];
        }
        else
        {
          id v10 = [v82 downloadFileURL];
        }
      }
      v85 = [v4 args];
      v86 = [v85 objectAtIndexedSubscript:1];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v87 = 0;
      }
      else {
        v87 = v86;
      }
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472;
      v168[2] = sub_100069708;
      v168[3] = &unk_1000B6448;
      id v172 = v7;
      id v169 = WeakRetained;
      v170 = self;
      id v171 = v4;
      [v6 backgroundDownloadTask:v7 didFinishDownloadingToURL:v10 response:v87 reply:v168];

      goto LABEL_53;
    case 2u:
      v14 = [v4 args];
      id v10 = [v14 objectAtIndexedSubscript:0];

      uint64_t v15 = [v4 args];
      long long v16 = [v15 objectAtIndexedSubscript:1];

      long long v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543618;
        id v180 = v18;
        __int16 v181 = 2112;
        id v182 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ performing auth challenge callback, challenge %@", buf, 0x16u);
      }
      v164[0] = _NSConcreteStackBlock;
      v164[1] = 3221225472;
      v164[2] = sub_1000697F4;
      v164[3] = &unk_1000B61F0;
      id v19 = v4;
      id v165 = v19;
      v166 = self;
      id v20 = v16;
      id v167 = v20;
      int v21 = [v6 remoteObjectProxyWithErrorHandler:v164];
      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_100069890;
      v158[3] = &unk_1000B6218;
      id v159 = v19;
      id v160 = WeakRetained;
      id v163 = v7;
      id v22 = v20;
      id v162 = v22;
      v161 = self;
      [v21 backgroundTask:v7 didReceiveChallenge:v10 reply:v158];

      goto LABEL_53;
    case 3u:
      long long v23 = (id)qword_1000CB148;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543362;
        id v180 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ performing did start app wake callback.", buf, 0xCu);
      }
      v25 = [v4 args];
      id v10 = [v25 objectAtIndexedSubscript:0];

      v156[0] = _NSConcreteStackBlock;
      v156[1] = 3221225472;
      v156[2] = sub_100069B04;
      v156[3] = &unk_1000B63D0;
      v156[4] = self;
      id v157 = v4;
      [v6 backgroundSessionDidStartAppWake:v10 reply:v156];

      goto LABEL_53;
    case 4u:
      v26 = (id)qword_1000CB148;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543362;
        id v180 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ performing did finish app wake callback.", buf, 0xCu);
      }
      v28 = [v4 args];
      id v10 = [v28 objectAtIndexedSubscript:0];

      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472;
      v154[2] = sub_100069B10;
      v154[3] = &unk_1000B63D0;
      v154[4] = self;
      id v155 = v4;
      [v6 backgroundSessionDidFinishAppWake:v10 reply:v154];

      goto LABEL_53;
    case 5u:
      v29 = [v4 args];
      v93 = [v29 objectAtIndexedSubscript:0];

      v30 = [v4 args];
      v92 = [v30 objectAtIndexedSubscript:1];

      v31 = (id)qword_1000CB148;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543618;
        id v180 = v32;
        __int16 v181 = 2112;
        id v182 = v93;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ performing will send request callback, request %@", buf, 0x16u);
      }
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_100069B1C;
      v147[3] = &unk_1000B6240;
      id v33 = v4;
      id v148 = v33;
      id v34 = WeakRetained;
      id v149 = v34;
      id v153 = v7;
      id v35 = v92;
      id v152 = v35;
      id v10 = v93;
      id v150 = v10;
      v151 = self;
      v36 = [v6 remoteObjectProxyWithErrorHandler:v147];
      v141[0] = _NSConcreteStackBlock;
      v141[1] = 3221225472;
      v141[2] = sub_100069C40;
      v141[3] = &unk_1000B6268;
      id v142 = v33;
      id v143 = v34;
      id v146 = v7;
      id v37 = v35;
      id v145 = v37;
      v144 = self;
      [v36 backgroundTask:v7 _willSendRequestForEstablishedConnection:v10 reply:v141];

      goto LABEL_53;
    case 6u:
      v38 = [v4 args];
      id v10 = [v38 objectAtIndexedSubscript:0];

      v39 = [v4 args];
      v40 = [v39 objectAtIndexedSubscript:1];
      id v41 = [v40 intValue];

      v42 = [v4 args];
      v43 = [v42 objectAtIndexedSubscript:2];

      v44 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v180 = v10;
        __int16 v181 = 1024;
        LODWORD(v182) = v41;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Performing open file at path callback for path %@ mode %d", buf, 0x12u);
      }
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_100069DA8;
      v138[3] = &unk_1000B6290;
      id v45 = v4;
      id v139 = v45;
      v140 = self;
      v46 = [v6 remoteObjectProxyWithErrorHandler:v138];
      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472;
      v134[2] = sub_100069E2C;
      v134[3] = &unk_1000B62B8;
      id v135 = v45;
      id v47 = v43;
      id v137 = v47;
      v136 = self;
      [v46 openFileAtPath:v10 mode:v41 withReply:v134];

      goto LABEL_53;
    case 8u:
      v48 = [v4 args];
      if ([v48 count])
      {
        v49 = [v4 args];
        id v10 = [v49 objectAtIndexedSubscript:0];
      }
      else
      {
        id v10 = 0;
      }

      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_100069F30;
      v129[3] = &unk_1000B62E0;
      id v133 = v7;
      id v130 = WeakRetained;
      v131 = self;
      id v88 = v4;
      id v132 = v88;
      v89 = [v6 remoteObjectProxyWithErrorHandler:v129];
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472;
      v127[2] = sub_10006A034;
      v127[3] = &unk_1000B63D0;
      v127[4] = self;
      id v128 = v88;
      [v89 backgroundAVAssetDownloadTask:v7 didResolveMediaSelectionProperyList:v10 reply:v127];

      goto LABEL_53;
    case 9u:
      v58 = [v4 args];
      id v10 = [v58 objectAtIndexedSubscript:0];

      v59 = [v4 args];
      v95 = [v59 objectAtIndexedSubscript:1];

      v60 = (id)qword_1000CB148;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543362;
        id v180 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ performing begin delayed request callback", buf, 0xCu);
      }
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_10006A150;
      v114[3] = &unk_1000B6308;
      id v62 = v4;
      id v115 = v62;
      id v63 = WeakRetained;
      id v116 = v63;
      id v119 = v7;
      id v64 = v95;
      v117 = self;
      id v118 = v64;
      v65 = [v6 remoteObjectProxyWithErrorHandler:v114];
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_10006A274;
      v108[3] = &unk_1000B6330;
      id v109 = v62;
      id v110 = v63;
      id v113 = v7;
      id v66 = v64;
      v111 = self;
      id v112 = v66;
      [v65 backgroundTask:v7 willBeginDelayedRequest:v10 reply:v108];

      goto LABEL_53;
    case 0xAu:
      v50 = (id)qword_1000CB148;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = [WeakRetained descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543362;
        id v180 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ performing get auth headers for response callback.", buf, 0xCu);
      }
      v52 = [v4 args];
      v94 = [v52 objectAtIndexedSubscript:0];

      v53 = [v4 args];
      BOOL v54 = (unint64_t)[v53 count] > 1;

      if (v54)
      {
        v55 = [v4 args];
        id v10 = [v55 objectAtIndexedSubscript:1];
      }
      else
      {
        id v10 = 0;
      }
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_10006A3C4;
      v102[3] = &unk_1000B6308;
      id v71 = v4;
      id v103 = v71;
      id v72 = WeakRetained;
      id v104 = v72;
      id v107 = v7;
      id v73 = v94;
      v105 = self;
      id v106 = v73;
      v74 = [v6 remoteObjectProxyWithErrorHandler:v102];
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10006A50C;
      v96[3] = &unk_1000B6358;
      id v97 = v71;
      id v98 = v72;
      id v101 = v7;
      id v75 = v73;
      v99 = self;
      id v100 = v75;
      [v74 backgroundTask:v7 getAuthHeadersForResponse:v10 reply:v96];

      goto LABEL_53;
    case 0xBu:
      v56 = [v4 args];
      if ([v56 count])
      {
        v57 = [v4 args];
        id v10 = [v57 objectAtIndexedSubscript:0];
      }
      else
      {
        id v10 = 0;
      }

      v122[0] = _NSConcreteStackBlock;
      v122[1] = 3221225472;
      v122[2] = sub_10006A040;
      v122[3] = &unk_1000B62E0;
      id v126 = v7;
      id v123 = WeakRetained;
      v124 = self;
      id v90 = v4;
      id v125 = v90;
      v91 = [v6 remoteObjectProxyWithErrorHandler:v122];
      v120[0] = _NSConcreteStackBlock;
      v120[1] = 3221225472;
      v120[2] = sub_10006A144;
      v120[3] = &unk_1000B63D0;
      v120[4] = self;
      id v121 = v90;
      [v91 backgroundAVAssetDownloadTask:v7 willDownloadVariants:v10 reply:v120];

LABEL_53:
      break;
    default:
      break;
  }
}

@end