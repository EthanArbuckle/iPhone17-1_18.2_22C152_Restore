@interface SDClassroomBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (NSString)clientBundleID;
- (SDClassroomBrowser)init;
- (__SFNode)convertShareTargetToNode:(id)a3;
- (id)convertAdvancedDescriptionToSimple:(id)a3;
- (id)operationNameForPersonID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5;
- (void)browserInvalidated;
- (void)cancelSendingItemsToPersonWithID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5;
- (void)operationEnded:(id)a3;
- (void)operationMadeProgress:(id)a3;
- (void)operationStarted:(id)a3;
- (void)potentiallyInvalidate;
- (void)setClientBundleID:(id)a3;
- (void)setNodes:(id)a3;
- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4;
- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4;
- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4;
- (void)start;
- (void)startSendingItems:(id)a3 withProperties:(id)a4 toPersonWithID:(id)a5 clientBundleID:(id)a6 airDropClientDelegate:(id)a7;
- (void)stop;
- (void)transferConcluded;
@end

@implementation SDClassroomBrowser

+ (id)sharedBrowser
{
  if (qword_10097FB40 != -1) {
    dispatch_once(&qword_10097FB40, &stru_1008CA748);
  }
  v2 = (void *)qword_10097FB48;

  return v2;
}

- (SDClassroomBrowser)init
{
  v10.receiver = self;
  v10.super_class = (Class)SDClassroomBrowser;
  v2 = [(SDClassroomBrowser *)&v10 init];
  v3 = v2;
  if (v2)
  {
    browser = v2->_browser;
    v2->_browser = 0;

    v3->_clientCount = 0;
    uint64_t v5 = objc_opt_new();
    personIDToShareTarget = v3->_personIDToShareTarget;
    v3->_personIDToShareTarget = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    operationsQueue = v3->_operationsQueue;
    v3->_operationsQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v3->_operationsQueue setQualityOfService:25];
  }
  return v3;
}

- (void)start
{
  ++self->_clientCount;
  if (!self->_browser)
  {
    v3 = (CRKShareTargetBrowser *)[objc_alloc(off_1009661B0()) initWithDelegate:self queue:&_dispatch_main_q];
    browser = self->_browser;
    self->_browser = v3;

    uint64_t v5 = self->_browser;
    [(CRKShareTargetBrowser *)v5 resume];
  }
}

- (void)stop
{
  int clientCount = self->_clientCount;
  BOOL v3 = __OFSUB__(clientCount, 1);
  int v4 = clientCount - 1;
  if (v4 < 0 == v3)
  {
    self->_int clientCount = v4;
    if (!v4) {
      [(SDClassroomBrowser *)self potentiallyInvalidate];
    }
  }
}

- (void)transferConcluded
{
  if (![(NSOperationQueue *)self->_operationsQueue operationCount])
  {
    [(SDClassroomBrowser *)self potentiallyInvalidate];
  }
}

- (void)potentiallyInvalidate
{
  if (self->_browser
    && ![(NSOperationQueue *)self->_operationsQueue operationCount]
    && !self->_clientCount)
  {
    [(CRKShareTargetBrowser *)self->_browser invalidate];
    [(SDClassroomBrowser *)self browserInvalidated];
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"com.apple.sharingd.ClassroomChanged" object:0 userInfo:0];
  }
}

- (void)browserInvalidated
{
  browser = self->_browser;
  self->_browser = 0;

  nodes = self->_nodes;
  self->_nodes = 0;

  [(NSMutableDictionary *)self->_personIDToShareTarget removeAllObjects];
  operationsQueue = self->_operationsQueue;

  [(NSOperationQueue *)operationsQueue cancelAllOperations];
}

- (void)startSendingItems:(id)a3 withProperties:(id)a4 toPersonWithID:(id)a5 clientBundleID:(id)a6 airDropClientDelegate:(id)a7
{
  id v66 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v62 = self;
  v63 = [(NSMutableDictionary *)self->_personIDToShareTarget objectForKeyedSubscript:v13];
  id v16 = [v12 mutableCopy];
  v17 = [v16 objectForKeyedSubscript:kSFOperationSessionIDKey];
  v64 = [v16 objectForKeyedSubscript:kSFOperationItemsDescriptionKey];
  uint64_t v18 = kSFOperationFileIconKey;
  v19 = [v16 objectForKeyedSubscript:kSFOperationFileIconKey];

  if (v19) {
    v61 = sub_1000D8D24(v19, 0);
  }
  else {
    v61 = 0;
  }
  id v20 = objc_alloc((Class)NSProgress);
  v21 = [v20 sf_initWithAppBundle:v14 sessionID:v17 andPersonRealName:v13];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100032C20;
  v71[3] = &unk_1008CA770;
  id value = v13;
  id v72 = value;
  id v22 = v17;
  v23 = v62;
  id v73 = v22;
  v74 = v62;
  id v24 = v14;
  id v75 = v24;
  [v21 setCancellationHandler:v71];
  [v21 _publish];
  [v21 setSf_transferState:2];
  v25 = v63;
  if (v63)
  {
    if ([v66 count])
    {
      id v26 = [v12 count];
      if (v15)
      {
        if (v24 && value && v26)
        {
          id v60 = v22;
          id v58 = v24;
          v59 = v15;
          [v16 removeObjectForKey:v18];
          [v16 removeObjectForKey:kSFOperationSmallFileIconKey];
          v27 = objc_opt_new();
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v28 = v66;
          id v29 = [v28 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (!v29) {
            goto LABEL_23;
          }
          id v30 = v29;
          uint64_t v31 = *(void *)v68;
          while (1)
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v68 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v34 = v33;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                id v34 = +[NSURL URLWithString:v33];
              }
              v35 = v34;
              if (v34)
              {
                [v27 addObject:v34];
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v67 objects:v76 count:16];
            if (!v30)
            {
LABEL_23:

              v36 = airdrop_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v37 = [v28 count];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v78 = v37;
                *(_WORD *)&v78[4] = 2112;
                *(void *)&v78[6] = value;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser sending %d item(s) to %@", buf, 0x12u);
              }

              v25 = v63;
              id v15 = v59;
              if ([v63 isInstructor])
              {
                uint64_t v38 = [(SDClassroomBrowser *)v62 convertAdvancedDescriptionToSimple:v64];

                v39 = (void *)v38;
              }
              else
              {
                v39 = v64;
              }
              [v16 setObject:&off_100902628 forKeyedSubscript:kSFOperationFilesCopiedKey];
              v42 = [v63 displayName];
              [v16 setObject:v42 forKeyedSubscript:kSFOperationReceiverCompositeNameKey];

              v43 = [v63 secondaryName];
              [v16 setObject:v43 forKeyedSubscript:kSFOperationReceiverComputerNameKey];

              v44 = [v63 displayName];
              [v16 setObject:v44 forKeyedSubscript:kSFOperationReceiverFirstNameKey];

              v45 = [v63 displayName];
              [v16 setObject:v45 forKeyedSubscript:kSFOperationReceiverLastNameKey];

              [v16 setObject:@"Classroom" forKeyedSubscript:kSFOperationReceiverModelNameKey];
              v46 = [v63 identifier];
              [v16 setObject:v46 forKeyedSubscript:kSFOperationReceiverIDKey];

              v64 = v39;
              v47 = [v63 operationToSendItems:v27 fromBundleIdentifier:v58 description:v39 previewImageData:v61];
              id v22 = v60;
              v48 = [(SDClassroomBrowser *)v62 operationNameForPersonID:value sessionID:v60 clientBundleID:v58];
              [v47 setName:v48];

              [v47 addTarget:v62 selector:"operationStarted:" forOperationEvents:1 delegateQueue:&_dispatch_main_q];
              [v47 addTarget:v62 selector:"operationMadeProgress:" forOperationEvents:8 delegateQueue:&_dispatch_main_q];

              [v47 addTarget:v62 selector:"operationEnded:" forOperationEvents:6 delegateQueue:&_dispatch_main_q];
              id v24 = v58;
              objc_setAssociatedObject(v47, "SFClassroomPersonID", value, (void *)0x301);
              objc_setAssociatedObject(v47, "SFClassroomDelegate", v59, (void *)0x301);
              objc_setAssociatedObject(v47, "SFClassroomProgress", v21, (void *)0x301);
              objc_setAssociatedObject(v47, "SFClassroomResults", v16, (void *)0x301);
              [(NSOperationQueue *)v62->_operationsQueue addOperation:v47];

              goto LABEL_29;
            }
          }
        }
      }
    }
  }
  v40 = airdrop_log();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    v49 = v12;
    if (v63) {
      v50 = "yes";
    }
    else {
      v50 = "no";
    }
    id v51 = v15;
    if ([v66 count]) {
      v52 = "yes";
    }
    else {
      v52 = "no";
    }
    id v53 = [v49 count];
    *(_DWORD *)buf = 136316418;
    if (v53) {
      v54 = "yes";
    }
    else {
      v54 = "no";
    }
    *(void *)v78 = v50;
    id v12 = v49;
    if (value) {
      v55 = "yes";
    }
    else {
      v55 = "no";
    }
    *(_WORD *)&v78[8] = 2080;
    if (v24) {
      v56 = "yes";
    }
    else {
      v56 = "no";
    }
    *(void *)&v78[10] = v52;
    id v15 = v51;
    v23 = v62;
    v25 = v63;
    if (v15) {
      v57 = "yes";
    }
    else {
      v57 = "no";
    }
    __int16 v79 = 2080;
    v80 = v54;
    __int16 v81 = 2080;
    v82 = v55;
    __int16 v83 = 2080;
    v84 = v56;
    __int16 v85 = 2080;
    v86 = v57;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "failed send via classroom: shareTarget %s, items.count %s, _properties.count %s, self.personID %s, _clientBundleID %s, _delegate %s", buf, 0x3Eu);
  }

  v27 = sub_100052DC0(-1, 0);
  [v16 setObject:v27 forKeyedSubscript:kSFOperationErrorKey];
  v41 = [v27 localizedDescription];
  [v21 sf_failedWithError:v41];

  [v15 airDropClient:0 event:10 withResults:v16];
  [v21 _unpublish];
  [(SDClassroomBrowser *)v23 transferConcluded];
LABEL_29:
}

- (void)cancelSendingItemsToPersonWithID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5
{
  v6 = [(SDClassroomBrowser *)self operationNameForPersonID:a3 sessionID:a4 clientBundleID:a5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(NSOperationQueue *)self->_operationsQueue operations];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 name];
        unsigned int v14 = [v13 isEqual:v6];

        if (v14) {
          [v12 cancel];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(SDClassroomBrowser *)self transferConcluded];
}

- (id)convertAdvancedDescriptionToSimple:(id)a3
{
  id v3 = a3;
  int v4 = SFStringIsJSON();
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100034078();
      }

      uint64_t v6 = [v4 objectForKeyedSubscript:@"SFAirDropActivitySubjectMain"];

      id v3 = (id)v6;
    }
    else
    {

      id v3 = 0;
    }
  }

  return v3;
}

- (id)operationNameForPersonID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[NSArray arrayWithObjects:&v13 count:3];

  v11 = [v10 componentsJoinedByString:@"_" v13, v14, v15];

  return v11;
}

- (void)operationStarted:(id)a3
{
  id v3 = a3;
  int v4 = objc_getAssociatedObject(v3, "SFClassroomResults");
  uint64_t v5 = objc_getAssociatedObject(v3, "SFClassroomPersonID");
  uint64_t v6 = objc_getAssociatedObject(v3, "SFClassroomProgress");
  [v6 setSf_transferState:3];
  [v6 setTotalUnitCount:[v3 totalUnitCount]];
  [v6 setCompletedUnitCount:[v3 completedUnitCount]];
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser started send operation to %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_getAssociatedObject(v3, "SFClassroomDelegate");
  [v8 airDropClient:0 event:11 withResults:v4];
  [v8 airDropClient:0 event:3 withResults:v4];
  [v8 airDropClient:0 event:6 withResults:v4];
}

- (void)operationMadeProgress:(id)a3
{
  id v3 = a3;
  int v4 = objc_getAssociatedObject(v3, "SFClassroomProgress");
  uint64_t v5 = objc_getAssociatedObject(v3, "SFClassroomPersonID");
  [v4 setTotalUnitCount:[v3 totalUnitCount]];
  [v4 setCompletedUnitCount:[v3 completedUnitCount]];
  uint64_t v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000340EC((uint64_t)v5, v4, v6);
  }

  id v7 = objc_getAssociatedObject(v3, "SFClassroomDelegate");
  id v8 = objc_getAssociatedObject(v3, "SFClassroomResults");
  uint64_t v9 = kSFOperationTotalBytesKey;
  uint64_t v10 = [v8 objectForKeyedSubscript:kSFOperationTotalBytesKey];

  if (!v10)
  {
    v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 totalUnitCount]);
    [v8 setObject:v11 forKeyedSubscript:v9];

    [v8 setObject:&off_100902628 forKeyedSubscript:kSFOperationUsePKZip];
    [v7 airDropClient:0 event:5 withResults:v8];
  }
  id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 completedUnitCount]);
  [v8 setObject:v12 forKeyedSubscript:kSFOperationBytesCopiedKey];

  [v8 setObject:&off_100902628 forKeyedSubscript:kSFOperationTimeRemainingKey];
  [v7 airDropClient:0 event:7 withResults:v8];
}

- (void)operationEnded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_getAssociatedObject(v4, "SFClassroomPersonID");
  uint64_t v6 = objc_getAssociatedObject(v4, "SFClassroomDelegate");
  id v7 = objc_getAssociatedObject(v4, "SFClassroomProgress");
  id v8 = objc_getAssociatedObject(v4, "SFClassroomResults");
  uint64_t v9 = [v4 error];

  if (!v9)
  {
    id v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 138412290;
      *(void *)&v23[4] = v5;
      id v13 = "SDClassroomBrowser finished send operation to %@";
      goto LABEL_7;
    }
LABEL_8:

    [v7 setSf_transferState:6];
    id v14 = v6;
    uint64_t v15 = 9;
LABEL_9:
    [v14 airDropClient:0 event:v15 withResults:v8 *(_OWORD *)v23];
    goto LABEL_10;
  }
  uint64_t v10 = [v4 error];
  id v11 = [v10 code];

  if (v11 == (id)404)
  {
    id v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 138412290;
      *(void *)&v23[4] = v5;
      id v13 = "SDClassroomBrowser sender cancelled send operation to %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v23, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  long long v16 = [v4 error];
  id v17 = [v16 code];

  long long v18 = airdrop_log();
  v19 = v18;
  if (v17 == (id)18)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 138412290;
      *(void *)&v23[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser receiver cancelled send operation to %@", v23, 0xCu);
    }

    [v7 setSf_transferState:4];
    id v14 = v6;
    uint64_t v15 = 4;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000341AC((uint64_t)v5, v4, v19);
  }

  id v20 = [v4 error];
  v21 = sub_100052DC0(-1, v20);

  [v8 setObject:v21 forKeyedSubscript:kSFOperationErrorKey];
  id v22 = [v21 localizedDescription];
  [v7 sf_failedWithError:v22];

  [v6 airDropClient:0 event:10 withResults:v8];
LABEL_10:
  [v7 _unpublish];
  [(SDClassroomBrowser *)self transferConcluded];
}

- (__SFNode)convertShareTargetToNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 displayName];
  uint64_t v6 = [v4 identifier];
  id v7 = (__SFNode *)SFNodeCreate();

  id v8 = [v4 secondaryName];
  SFNodeSetSecondaryName();

  uint64_t v9 = [v4 iconImageData];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = +[UIImage imageWithData:v9];
    [v11 CGImage];
    id v12 = SFDataFromCGImage();
  }
  else
  {
    id v13 = [(SDClassroomBrowser *)self clientBundleID];
    id v14 = v13;
    if (v13 == @"com.apple.finder")
    {
      uint64_t v15 = 0;
    }
    else if (v13)
    {
      uint64_t v15 = [(__CFString *)v13 isEqual:@"com.apple.finder"] ^ 1;
    }
    else
    {
      uint64_t v15 = 1;
    }

    id v12 = sub_1000509EC(0, v15, 0, 0);
    if (v12) {
      SFNodeAddKind();
    }
  }
  SFNodeSetIconData();
  SFNodeAddKind();
  SFNodeAddKind();
  if (([v4 isGroup] & 1) == 0 && !objc_msgSend(v4, "isCourse")) {
    goto LABEL_15;
  }
  if ([v4 isGroup]) {
    SFNodeAddKind();
  }
  if ([v4 isCourse]) {
LABEL_15:
  }
    SFNodeAddKind();
  uint64_t valuePtr = 705;
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  SFNodeSetFlags();
  CFRelease(v16);

  return v7;
}

- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = browser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100034260();
  }

  self->_int clientCount = 1;
  [(SDClassroomBrowser *)self stop];
}

- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4
{
  id v5 = a4;
  uint64_t v6 = browser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000342D4();
  }

  id v7 = +[NSMutableArray arrayWithArray:self->_nodes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        personIDToShareTarget = self->_personIDToShareTarget;
        uint64_t v15 = [v13 identifier];
        [(NSMutableDictionary *)personIDToShareTarget setObject:v13 forKeyedSubscript:v15];

        CFNumberRef v16 = [(SDClassroomBrowser *)self convertShareTargetToNode:v13];
        [v7 addObject:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }

  objc_storeStrong((id *)&self->_nodes, v7);
  NSUInteger v17 = [(NSArray *)self->_nodes count];
  long long v18 = [(NSMutableDictionary *)self->_personIDToShareTarget allKeys];
  id v19 = [v18 count];

  if ((id)v17 != v19)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SDClassroomBrowser.m" lineNumber:373 description:@"node and shareTarget count not matching"];
  }
  id v20 = browser_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = SFCompactStringFromCollection();
    *(_DWORD *)buf = 138412290;
    id v30 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser shareTargetBrowser:didFindTargets: nodes %@", buf, 0xCu);
  }
  id v22 = +[NSNotificationCenter defaultCenter];
  [v22 postNotificationName:@"com.apple.sharingd.ClassroomChanged" object:0 userInfo:0];
}

- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4
{
  id v5 = a4;
  uint64_t v6 = browser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100034358();
  }

  id v29 = self;
  location = (id *)&self->_nodes;
  id v30 = +[NSMutableArray arrayWithArray:self->_nodes];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  id v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v39;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v9 = *location;
        id v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v35;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
              uint64_t v15 = (void *)SFNodeCopyRealName();
              CFNumberRef v16 = [v8 identifier];
              unsigned int v17 = [v16 isEqual:v15];

              if (v17)
              {
                personIDToShareTarget = v29->_personIDToShareTarget;
                id v19 = [v8 identifier];
                [(NSMutableDictionary *)personIDToShareTarget removeObjectForKey:v19];

                [v30 removeObject:v14];
                goto LABEL_18;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      id v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v33);
  }

  objc_storeStrong(location, v30);
  id v20 = [(NSArray *)v29->_nodes count];
  v21 = [(NSMutableDictionary *)v29->_personIDToShareTarget allKeys];
  id v22 = [v21 count];

  if (v20 != v22)
  {
    long long v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:v29 file:@"SDClassroomBrowser.m" lineNumber:393 description:@"node and shareTarget count not matching"];
  }
  v23 = browser_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = SFCompactStringFromCollection();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser shareTargetBrowser:didRemoveTargets: nodes %@", buf, 0xCu);
  }
  long long v25 = +[NSNotificationCenter defaultCenter];
  [v25 postNotificationName:@"com.apple.sharingd.ClassroomChanged" object:0 userInfo:0];
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNodes:(id)a3
{
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_operationsQueue, 0);
  objc_storeStrong((id *)&self->_browser, 0);

  objc_storeStrong((id *)&self->_personIDToShareTarget, 0);
}

@end