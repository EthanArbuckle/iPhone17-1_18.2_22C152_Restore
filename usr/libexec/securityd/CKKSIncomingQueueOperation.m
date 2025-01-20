@interface CKKSIncomingQueueOperation
+ (id)decryptCKKSItemToAttributes:(id)a3 keyCache:(id)a4 ckksOperationalDependencies:(id)a5 error:(id *)a6;
- (BOOL)_onqueueHandleIQEChange:(id)a3 item:(SecDbItem *)a4 viewState:(id)a5 sortedForThisView:(BOOL)a6 keyCache:(id)a7;
- (BOOL)_onqueueUpdateIQE:(id)a3 withState:(id)a4 error:(id *)a5;
- (BOOL)fixMismatchedViewItems:(id)a3;
- (BOOL)handleMismatchedViewItems;
- (BOOL)intransaction:(id)a3 processQueueEntries:(id)a4;
- (BOOL)loadAndProcessEntries:(id)a3 withActionFilter:(id)a4 totalQueueEntries:(int64_t *)a5;
- (BOOL)missingKey;
- (BOOL)newOutgoingEntries;
- (BOOL)pendingClassAEntries;
- (BOOL)processNewCurrentItemPointers:(id)a3 viewState:(id)a4;
- (CKKSIncomingQueueOperation)init;
- (CKKSIncomingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 pendingClassAItemsRemainingState:(id)a5 errorState:(id)a6 handleMismatchedViewItems:(BOOL)a7;
- (CKKSOperationDependencies)deps;
- (NSError)pendingClassAEntriesError;
- (NSMutableSet)viewsToScan;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfClassAItemsRemaining;
- (unint64_t)errorItemsProcessed;
- (unint64_t)successfulItemsProcessed;
- (void)_onqueueGenerateNewUUIDPersistentRefOnSecItem:(SecDbItem *)a3 viewState:(id)a4;
- (void)_onqueueHandleIQEChange:(id)a3 attributes:(id)a4 class:(const SecDbClass *)a5 viewState:(id)a6 sortedForThisView:(BOOL)a7 keyCache:(id)a8;
- (void)_onqueueHandleIQEDelete:(id)a3 class:(const SecDbClass *)a4 viewState:(id)a5;
- (void)_onqueueHandleMismatchedViewItem:(id)a3 secDbClass:(const SecDbClass *)a4 attributes:(id)a5 intendedView:(id)a6 viewState:(id)a7 keyCache:(id)a8;
- (void)main;
- (void)setDeps:(id)a3;
- (void)setErrorItemsProcessed:(unint64_t)a3;
- (void)setHandleMismatchedViewItems:(BOOL)a3;
- (void)setMissingKey:(BOOL)a3;
- (void)setNewOutgoingEntries:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setPendingClassAEntries:(BOOL)a3;
- (void)setPendingClassAEntriesError:(id)a3;
- (void)setStateIfClassAItemsRemaining:(id)a3;
- (void)setSuccessfulItemsProcessed:(unint64_t)a3;
- (void)setViewsToScan:(id)a3;
@end

@implementation CKKSIncomingQueueOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateIfClassAItemsRemaining, 0);
  objc_storeStrong((id *)&self->_viewsToScan, 0);
  objc_storeStrong((id *)&self->_pendingClassAEntriesError, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setStateIfClassAItemsRemaining:(id)a3
{
}

- (OctagonStateString)stateIfClassAItemsRemaining
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setViewsToScan:(id)a3
{
}

- (NSMutableSet)viewsToScan
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMissingKey:(BOOL)a3
{
  self->_missingKey = a3;
}

- (BOOL)missingKey
{
  return self->_missingKey;
}

- (void)setPendingClassAEntriesError:(id)a3
{
}

- (NSError)pendingClassAEntriesError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPendingClassAEntries:(BOOL)a3
{
  self->_pendingClassAEntries = a3;
}

- (BOOL)pendingClassAEntries
{
  return self->_pendingClassAEntries;
}

- (void)setNewOutgoingEntries:(BOOL)a3
{
  self->_newOutgoingEntries = a3;
}

- (BOOL)newOutgoingEntries
{
  return self->_newOutgoingEntries;
}

- (void)setErrorItemsProcessed:(unint64_t)a3
{
  self->_errorItemsProcessed = a3;
}

- (unint64_t)errorItemsProcessed
{
  return self->_errorItemsProcessed;
}

- (void)setSuccessfulItemsProcessed:(unint64_t)a3
{
  self->_successfulItemsProcessed = a3;
}

- (unint64_t)successfulItemsProcessed
{
  return self->_successfulItemsProcessed;
}

- (void)setHandleMismatchedViewItems:(BOOL)a3
{
  self->_handleMismatchedViewItems = a3;
}

- (BOOL)handleMismatchedViewItems
{
  return self->_handleMismatchedViewItems;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (void)_onqueueHandleIQEDelete:(id)a3 class:(const SecDbClass *)a4 viewState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v49 = 0;
  v50 = (__CFString **)&v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v58[0] = a4->var0;
  v57[0] = kSecClass;
  v57[1] = kSecAttrUUID;
  v10 = [v8 uuid];
  v57[2] = kSecAttrSynchronizable;
  v58[1] = v10;
  v58[2] = &__kCFBooleanTrue;
  CFDictionaryRef v11 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];

  v12 = [v9 zoneID];
  v13 = [v12 zoneName];
  v14 = sub_1000CD884(@"ckksincoming", v13);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v56 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "trying to delete with query: %@", buf, 0xCu);
  }

  uint64_t v15 = sub_10000C3CC(v11, 0, -1, 0, v50 + 3);
  *(unsigned char *)(v15 + 155) = 1;
  if (v50[3])
  {
    v16 = [v9 zoneID];
    v17 = [v16 zoneName];
    v18 = sub_1000CD884(@"ckksincoming", v17);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v19 = (const __CFDictionary *)v50[3];
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v56 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    CFDictionaryRef v20 = (const __CFDictionary *)v50[3];
    [(CKKSResultOperation *)self setError:v20];
    goto LABEL_7;
  }
  v21 = (const void **)v15;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000757CC;
  v48[3] = &unk_1002F87C8;
  v48[4] = &v49;
  v48[5] = v15;
  int v22 = sub_10000CBA4(1, 1, 0, (uint64_t)(v50 + 3), (uint64_t)v48);
  v23 = v50;
  v24 = (__CFError *)v50[3];
  if (v24)
  {
    if (CFErrorGetCode(v24) != -25300)
    {
      v30 = [v9 zoneID];
      v31 = [v30 zoneName];
      v32 = sub_1000CD884(@"ckksincoming", v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        CFDictionaryRef v33 = (const __CFDictionary *)v50[3];
        *(_DWORD *)buf = 138412290;
        CFDictionaryRef v56 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "couldn't delete item: %@", buf, 0xCu);
      }

      CFDictionaryRef v20 = (const __CFDictionary *)v50[3];
      [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
      [(CKKSResultOperation *)self setError:v20];
      sub_10000C2C4(v21, 0);
      goto LABEL_7;
    }
    v25 = [v9 zoneID];
    v26 = [v25 zoneName];
    v27 = sub_1000CD884(@"ckksincoming", v26);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v28 = (const __CFDictionary *)v50[3];
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v56 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "couldn't delete item (as it's already gone); this is okay: %@",
        buf,
        0xCu);
    }

    v23 = v50;
    v29 = v50[3];
    if (v29)
    {
      v50[3] = 0;
      CFRelease(v29);
      int v22 = 1;
      v23 = v50;
    }
    else
    {
      int v22 = 1;
    }
  }
  if (!sub_100129708((uint64_t)v21, v22, (CFErrorRef *)v23 + 3) || v50[3])
  {
    v34 = [v9 zoneID];
    v35 = [v34 zoneName];
    v36 = sub_1000CD884(@"ckksincoming", v35);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v37 = (const __CFDictionary *)v50[3];
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v56 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "couldn't delete query: %@", buf, 0xCu);
    }

    CFDictionaryRef v20 = (const __CFDictionary *)v50[3];
    if (v20)
    {
      [(CKKSResultOperation *)self setError:v50[3]];
      goto LABEL_7;
    }
    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    CFStringRef v54 = @"query_notify_and_destroy failed without error";
    v38 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v39 = +[NSError errorWithDomain:@"securityd" code:-67671 userInfo:v38];
    [(CKKSResultOperation *)self setError:v39];

LABEL_25:
    CFDictionaryRef v20 = 0;
    goto LABEL_7;
  }
  v40 = [v9 zoneID];
  v41 = [v40 zoneName];
  v42 = sub_1000CD884(@"ckksincoming", v41);

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Correctly processed an IQE; deleting", buf, 2u);
  }

  id v47 = 0;
  [v8 deleteFromDatabase:&v47];
  CFDictionaryRef v43 = (const __CFDictionary *)v47;
  if (!v43)
  {
    [(CKKSIncomingQueueOperation *)self setSuccessfulItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self successfulItemsProcessed] + 1];
    goto LABEL_25;
  }
  CFDictionaryRef v20 = v43;
  v44 = [v9 zoneID];
  v45 = [v44 zoneName];
  v46 = sub_1000CD884(@"ckksincoming", v45);

  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v56 = v20;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
  }

  [(CKKSResultOperation *)self setError:v20];
  [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
LABEL_7:

  _Block_object_dispose(&v49, 8);
}

- (BOOL)_onqueueHandleIQEChange:(id)a3 item:(SecDbItem *)a4 viewState:(id)a5 sortedForThisView:(BOOL)a6 keyCache:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  uint64_t v124 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = sub_100076604;
  v119 = sub_100076614;
  id v120 = 0;
  if (sub_10011BAEC(a4))
  {
    uint64_t v15 = [v13 zoneID];
    v16 = [v15 zoneName];
    v17 = sub_1000CD884(@"ckksincoming", v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v12 uuid];
      *(_DWORD *)buf = 138412547;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Rejecting a tombstone item addition from CKKS(%@): %{private}@", buf, 0x16u);
    }
    CFDictionaryRef v19 = [(CKKSIncomingQueueOperation *)self deps];
    CFDictionaryRef v20 = [v19 contextID];
    v21 = [v13 zoneID];
    id v114 = 0;
    int v22 = +[CKKSOutgoingQueueEntry withItem:a4 action:@"delete" contextID:v20 zoneID:v21 keyCache:v14 error:&v114];
    id v23 = v114;

    id v113 = v23;
    [v22 saveToDatabase:&v113];
    id v24 = v113;

    if (v24)
    {
      v25 = [v13 zoneID];
      v26 = [v25 zoneName];
      v27 = sub_1000CD884(@"ckksincoming", v26);

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to save new deletion OQE: %@", buf, 0xCu);
      }
    }
    else
    {
      id v112 = 0;
      [v12 deleteFromDatabase:&v112];
      id v49 = v112;
      if (v49)
      {
        id v24 = v49;
        v50 = [v13 zoneID];
        uint64_t v51 = [v50 zoneName];
        uint64_t v52 = sub_1000CD884(@"ckksincoming", v51);

        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
        }

        [(CKKSResultOperation *)self setError:v24];
        [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
      }
      else
      {
        [(CKKSIncomingQueueOperation *)self setSuccessfulItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self successfulItemsProcessed] + 1];
        id v24 = 0;
      }
    }
    [(CKKSIncomingQueueOperation *)self setNewOutgoingEntries:1];

LABEL_44:
    BOOL v65 = 0;
    goto LABEL_45;
  }
  if (!sub_10011BA64(a4))
  {
    v36 = [v13 zoneID];
    CFDictionaryRef v37 = [v36 zoneName];
    v38 = sub_1000CD884(@"ckksincoming", v37);

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [v12 uuid];
      *(_DWORD *)buf = 138412547;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Rejecting a multiuser item addition from CKKS(%@): %{private}@", buf, 0x16u);
    }
    v40 = [(CKKSIncomingQueueOperation *)self deps];
    v41 = [v40 contextID];
    v42 = [v13 zoneID];
    id v111 = 0;
    CFDictionaryRef v43 = +[CKKSOutgoingQueueEntry withItem:a4 action:@"delete" contextID:v41 zoneID:v42 keyCache:v14 error:&v111];
    id v44 = v111;

    id v110 = v44;
    [v43 saveToDatabase:&v110];
    id v45 = v110;

    if (v45)
    {
      v46 = [v13 zoneID];
      id v47 = [v46 zoneName];
      v48 = sub_1000CD884(@"ckksincoming", v47);

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v45;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Unable to save new deletion OQE: %@", buf, 0xCu);
      }
    }
    else
    {
      id v109 = 0;
      [v12 deleteFromDatabase:&v109];
      id v53 = v109;
      if (v53)
      {
        id v45 = v53;
        CFStringRef v54 = [v13 zoneID];
        v55 = [v54 zoneName];
        CFDictionaryRef v56 = sub_1000CD884(@"ckksincoming", v55);

        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
        }

        [(CKKSResultOperation *)self setError:v45];
        [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
      }
      else
      {
        [(CKKSIncomingQueueOperation *)self setSuccessfulItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self successfulItemsProcessed] + 1];
        id v45 = 0;
      }
    }
    [(CKKSIncomingQueueOperation *)self setNewOutgoingEntries:1];

    goto LABEL_44;
  }
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  char v108 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v132 = sub_100076604;
  v133 = sub_100076614;
  id v134 = (id)0xAAAAAAAAAAAAAAAALL;
  CFDictionaryGetValue(a4->var6, kSecAttrModificationDate);
  id v134 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = (uint64_t)(v122 + 3);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_10007661C;
  v89[3] = &unk_1002F87A0;
  v99 = a4;
  v94 = &v121;
  id v85 = v13;
  id v90 = v85;
  id v29 = v12;
  BOOL v100 = a6;
  v95 = &v105;
  id v91 = v29;
  v92 = self;
  id v93 = v14;
  v96 = &v115;
  v97 = buf;
  v98 = &v101;
  if (!sub_10000CBA4(1, 1, 0, v28, (uint64_t)v89) || v122[3])
  {
    v30 = [v85 zoneID:v85];
    v31 = [v30 zoneName];
    v32 = sub_1000CD884(@"ckksincoming", v31);

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = v122[3];
      *(_DWORD *)v129 = 138412290;
      uint64_t v130 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "couldn't process item from IncomingQueue: %@", v129, 0xCu);
    }

    uint64_t v34 = v122[3];
    if (v34)
    {
      v35 = (void *)v116[5];
      v116[5] = v34;

      [(CKKSResultOperation *)self setError:v116[5]];
    }
    else
    {
      NSErrorUserInfoKey v127 = NSLocalizedDescriptionKey;
      CFStringRef v128 = @"kc_with_dbt failed without error";
      v57 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      v58 = +[NSError errorWithDomain:@"securityd" code:-67671 userInfo:v57];
      [(CKKSResultOperation *)self setError:v58];
    }
    [v29 setState:@"error"];
    v59 = (id *)(v116 + 5);
    id obj = (id)v116[5];
    [v29 saveToDatabase:&obj];
    objc_storeStrong(v59, obj);
    if (!v116[5]) {
      goto LABEL_35;
    }
    v60 = [v86 zoneID];
    v61 = [v60 zoneName];
    v62 = sub_1000CD884(@"ckksincoming", v61);

    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    uint64_t v63 = v116[5];
    *(_DWORD *)v129 = 138412290;
    uint64_t v130 = v63;
    v64 = "Couldn't save errored IQE to database: %@";
    goto LABEL_33;
  }
  if (v116[5])
  {
    v66 = [v85 zoneID];
    v67 = [v66 zoneName];
    v62 = sub_1000CD884(@"ckksincoming", v67);

    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    uint64_t v68 = v116[5];
    *(_DWORD *)v129 = 138412290;
    uint64_t v130 = v68;
    v64 = "Couldn't handle IQE, but why?: %@";
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v64, v129, 0xCu);
LABEL_34:

    [(CKKSResultOperation *)self setError:v116[5]];
    goto LABEL_35;
  }
  v70 = [v85 zoneID];
  v71 = [v70 zoneName];
  v72 = sub_1000CD884(@"ckksincoming", v71);

  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v129 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Correctly processed an IQE; deleting",
      v129,
      2u);
  }

  v73 = (id *)(v116 + 5);
  id v87 = (id)v116[5];
  [v29 deleteFromDatabase:&v87];
  objc_storeStrong(v73, v87);
  if (v116[5])
  {
    v74 = [v85 zoneID];
    v75 = [v74 zoneName];
    v76 = sub_1000CD884(@"ckksincoming", v75);

    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      uint64_t v77 = v116[5];
      *(_DWORD *)v129 = 138412290;
      uint64_t v130 = v77;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", v129, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v116[5]];
    [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
  }
  else
  {
    [(CKKSIncomingQueueOperation *)self setSuccessfulItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self successfulItemsProcessed] + 1];
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v78 = +[NSDate date];
    [v78 timeIntervalSinceDate:*(void *)(*(void *)&buf[8] + 40)];
    double v80 = v79;

    v125[0] = @"time";
    v81 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v80 * 1000.0)];
    v125[1] = @"view";
    v126[0] = v81;
    v82 = [v85 zoneID];
    v83 = [v82 zoneName];
    v126[1] = v83;
    v84 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];
    +[SecCoreAnalytics sendEvent:@"com.apple.ckks.item.propagation" event:v84];
  }
  if (!*((unsigned char *)v106 + 24))
  {
    BOOL v65 = *((unsigned char *)v102 + 24) == 0;
    goto LABEL_36;
  }
LABEL_35:
  BOOL v65 = 0;
LABEL_36:

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
LABEL_45:
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  return v65;
}

- (void)_onqueueHandleIQEChange:(id)a3 attributes:(id)a4 class:(const SecDbClass *)a5 viewState:(id)a6 sortedForThisView:(BOOL)a7 keyCache:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  CFTypeRef cf = 0;
  v17 = sub_10011ACF4((uint64_t)a5, (const __CFDictionary *)a4, dword_10035D2B0, (__CFString **)&cf);
  [(CKKSIncomingQueueOperation *)self _onqueueGenerateNewUUIDPersistentRefOnSecItem:v17 viewState:v15];
  if (v17) {
    BOOL v18 = cf == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18)
  {
    [(CKKSIncomingQueueOperation *)self _onqueueHandleIQEChange:v14 item:v17 viewState:v15 sortedForThisView:v9 keyCache:v16];
    goto LABEL_10;
  }
  CFDictionaryRef v19 = [v15 zoneID];
  CFDictionaryRef v20 = [v19 zoneName];
  v21 = sub_1000CD884(@"ckksincoming", v20);

  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFTypeRef v24 = cf;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to make SecDbItemRef out of attributes: %@", buf, 0xCu);
  }

  v17 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
LABEL_10:
    CFRelease(v17);
  }
}

- (void)_onqueueGenerateNewUUIDPersistentRefOnSecItem:(SecDbItem *)a3 viewState:(id)a4
{
  id v5 = a4;
  CFUUIDRef v6 = CFUUIDCreate(kCFAllocatorDefault);
  CFUUIDBytes bytes = CFUUIDGetUUIDBytes(v6);
  CFDataRef v7 = CFDataCreate(kCFAllocatorDefault, &bytes.byte0, 16);
  CFTypeRef cf = 0;
  sub_10011B6B0((uint64_t)a3, v7, (__CFString **)&cf);
  id v8 = [v5 zoneID];

  BOOL v9 = [v8 zoneName];
  v10 = sub_1000CD884(@"ckksincoming", v9);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = a3;
    __int16 v16 = 2112;
    CFTypeRef v17 = cf;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "set a new persistentref UUID for item %@: %@", buf, 0x16u);
  }

  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  CFTypeRef v11 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v11);
  }
}

- (BOOL)fixMismatchedViewItems:(id)a3
{
  id v4 = a3;
  if ([(CKKSIncomingQueueOperation *)self handleMismatchedViewItems])
  {
    id v5 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    CFUUIDRef v6 = [(CKKSIncomingQueueOperation *)self deps];
    CFDataRef v7 = [v6 activeAccount];
    id v8 = [v7 altDSID];
    BOOL v9 = [(CKKSIncomingQueueOperation *)self deps];
    id v20 = [v5 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v8 eventName:kSecurityRTCEventNameFixMismatchedViewItems testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:objc_msgSend(v9, "sendMetric")];

    v10 = [v4 zoneName];
    CFTypeRef v11 = sub_1000CD884(@"ckksincoming", v10);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling policy-mismatched items", buf, 2u);
    }

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 50;
    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = sub_100076604;
    v39 = sub_100076614;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    id v12 = [(CKKSIncomingQueueOperation *)self deps];
    id v13 = [v12 databaseProvider];

    while (v42[3] == 50)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000777C8;
      v21[3] = &unk_1002F8750;
      id v23 = buf;
      v21[4] = self;
      id v22 = v4;
      CFTypeRef v24 = &v31;
      v25 = &v41;
      v26 = &v27;
      [v13 dispatchSyncWithSQLTransaction:v21];
    }
    if (v28[3] >= 1)
    {
      uint64_t v45 = kSecurityRTCFieldNumMismatchedItems;
      id v14 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:");
      v46 = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      [v20 addMetrics:v15];

      int v16 = *((unsigned __int8 *)v32 + 24);
      CFTypeRef v17 = [(CKKSResultOperation *)self error];
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v20 success:v16 == 0 error:v17];
    }
    BOOL v18 = *((unsigned char *)v32 + 24) == 0;

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)loadAndProcessEntries:(id)a3 withActionFilter:(id)a4 totalQueueEntries:(int64_t *)a5
{
  id v17 = a3;
  id v16 = a4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 50;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100076604;
  v30[4] = sub_100076614;
  id v31 = 0;
  id v8 = [(CKKSIncomingQueueOperation *)self deps];
  BOOL v9 = [v8 databaseProvider];

  int64_t v10 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  if (v33[3] == 50)
  {
    while (1)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100077ED4;
      v19[3] = &unk_1002F8728;
      v19[4] = self;
      id v11 = v17;
      id v20 = v11;
      id v22 = &v36;
      id v23 = v30;
      id v21 = v16;
      CFTypeRef v24 = &v32;
      v25 = &v26;
      [v9 dispatchSyncWithSQLTransaction:v19];
      if (*((unsigned char *)v37 + 24)) {
        break;
      }

      if (v33[3] != 50)
      {
        int64_t v10 = v27[3];
        goto LABEL_5;
      }
    }
    id v13 = [v11 zoneName];
    id v14 = sub_1000CD884(@"ckksincoming", v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Early-exiting from IncomingQueueOperation", buf, 2u);
    }

    *a5 = v27[3];
    BOOL v12 = 0;
  }
  else
  {
LABEL_5:
    *a5 = v10;
    BOOL v12 = 1;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v12;
}

- (void)main
{
  v3 = [(CKKSIncomingQueueOperation *)self deps];
  v122 = [v3 databaseProvider];

  id v4 = [(CKKSIncomingQueueOperation *)self deps];
  id v5 = [v4 readyAndSyncingViews];

  CFUUIDRef v6 = sub_1000CD884(@"ckksincoming", 0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v142 = (unint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Going to process the incoming queues for %@", buf, 0xCu);
  }

  if ([(CKKSIncomingQueueOperation *)self handleMismatchedViewItems])
  {
    CFDataRef v7 = sub_1000CD884(@"ckksincoming", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Will handle mismatched view items along the way", buf, 2u);
    }
  }
  id v117 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v114 = kSecurityRTCFieldPendingClassA;
  uint64_t v115 = kSecurityRTCFieldMissingKey;
  v148[0] = kSecurityRTCFieldMissingKey;
  v148[1] = kSecurityRTCFieldPendingClassA;
  v149[0] = &__kCFBooleanFalse;
  v149[1] = &__kCFBooleanFalse;
  id obja = (id)kSecurityRTCFieldNumViews;
  v148[2] = kSecurityRTCFieldNumViews;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  id v8 = v5;
  BOOL v9 = v123 = v5;
  v149[2] = v9;
  int64_t v10 = +[NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:3];
  id v11 = [(CKKSIncomingQueueOperation *)self deps];
  BOOL v12 = [v11 activeAccount];
  id v13 = [v12 altDSID];
  uint64_t v14 = kSecurityRTCEventNameProcessIncomingQueue;
  uint64_t v15 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  uint64_t v119 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v16 = [(CKKSIncomingQueueOperation *)self deps];
  id v118 = [v117 initWithCKKSMetrics:v10 altDSID:v13 eventName:v14 testsAreEnabled:0 category:v15 sendMetric:[v16 sendMetric]];

  id v17 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  id v146 = obja;
  BOOL v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
  v147 = v18;
  CFDictionaryRef v19 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
  id v20 = [(CKKSIncomingQueueOperation *)self deps];
  id v21 = [v20 activeAccount];
  id v22 = [v21 altDSID];
  uint64_t v23 = kSecurityRTCEventNameLoadAndProcessIQEs;
  CFTypeRef v24 = [(CKKSIncomingQueueOperation *)self deps];
  id v116 = [v17 initWithCKKSMetrics:v19 altDSID:v22 eventName:v23 testsAreEnabled:0 category:v119 sendMetric:[v24 sendMetric]];

  v25 = [(CKKSIncomingQueueOperation *)self deps];
  uint64_t v26 = [v25 overallLaunch];
  [v26 addEvent:@"incoming-processing-begin"];

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id obj = v123;
  id v27 = [obj countByEnumeratingWithState:&v132 objects:v145 count:16];
  if (!v27)
  {
    uint64_t v29 = 0;
LABEL_24:

    if ([obj count]) {
      unint64_t v40 = (int)v29 / (unint64_t)[obj count];
    }
    else {
      unint64_t v40 = 0;
    }
    v139[0] = kSecurityRTCFieldAvgCKRecords;
    CFStringRef v54 = +[NSNumber numberWithInt:v40];
    v140[0] = v54;
    v139[1] = kSecurityRTCFieldTotalCKRecords;
    v55 = +[NSNumber numberWithLong:v29];
    v140[1] = v55;
    CFDictionaryRef v56 = +[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:2];
    [v116 addMetrics:v56];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v116 success:1 error:0];
    if ([(CKKSIncomingQueueOperation *)self newOutgoingEntries])
    {
      v57 = +[CKOperationGroup CKKSGroupWithName:@"incoming-queue-response"];
      v58 = [(CKKSIncomingQueueOperation *)self deps];
      [v58 setCurrentOutgoingQueueOperationGroup:v57];

      v59 = [(CKKSIncomingQueueOperation *)self deps];
      v60 = [v59 flagHandler];
      [v60 handleFlag:@"process_outgoing_queue"];
    }
    if ([(CKKSIncomingQueueOperation *)self missingKey])
    {
      [(CKKSIncomingQueueOperation *)self setNextState:@"process_key_hierarchy"];
    }
    else
    {
      if ([(CKKSIncomingQueueOperation *)self pendingClassAEntries])
      {
        v61 = [[OctagonPendingFlag alloc] initWithFlag:@"process_incoming_queue" conditions:1];
        v62 = [(CKKSIncomingQueueOperation *)self deps];
        uint64_t v63 = [v62 flagHandler];
        [v63 handlePendingFlag:v61];

        v64 = [(CKKSIncomingQueueOperation *)self pendingClassAEntriesError];
        [(CKKSResultOperation *)self setError:v64];

        BOOL v65 = [(CKKSIncomingQueueOperation *)self stateIfClassAItemsRemaining];
        [(CKKSIncomingQueueOperation *)self setNextState:v65];
      }
      else
      {
        v61 = [(CKKSIncomingQueueOperation *)self intendedState];
        [(CKKSIncomingQueueOperation *)self setNextState:v61];
      }
    }
    v66 = [(CKKSIncomingQueueOperation *)self viewsToScan];
    id v67 = [v66 count];

    if (v67)
    {
      uint64_t v68 = sub_1000CD884(@"ckksincoming", 0);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = [(CKKSIncomingQueueOperation *)self viewsToScan];
        *(_DWORD *)buf = 138412290;
        unint64_t v142 = (unint64_t)v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Requesting scan for %@", buf, 0xCu);
      }
      v70 = [(CKKSIncomingQueueOperation *)self deps];
      v71 = [v70 flagHandler];
      [v71 handleFlag:@"dropped_items"];
    }
    id v53 = +[CKKSAnalytics logger];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v124 = obj;
    id v72 = [v124 countByEnumeratingWithState:&v125 objects:v138 count:16];
    if (!v72)
    {
LABEL_62:

      id v91 = [(CKKSIncomingQueueOperation *)self deps];
      v92 = [v91 activeManagedViews];
      if ([v92 count])
      {
        unint64_t v93 = (int)[(CKKSIncomingQueueOperation *)self successfulItemsProcessed];
        v94 = [(CKKSIncomingQueueOperation *)self deps];
        v95 = [v94 activeManagedViews];
        unint64_t v96 = v93 / (unint64_t)[v95 count];
      }
      else
      {
        unint64_t v96 = 0;
      }

      v97 = [(CKKSIncomingQueueOperation *)self deps];
      v98 = [v97 activeManagedViews];
      if ([v98 count])
      {
        unint64_t v99 = (int)[(CKKSIncomingQueueOperation *)self errorItemsProcessed];
        BOOL v100 = [(CKKSIncomingQueueOperation *)self deps];
        uint64_t v101 = [v100 activeManagedViews];
        unint64_t v102 = v99 / (unint64_t)[v101 count];
      }
      else
      {
        unint64_t v102 = 0;
      }

      v136[0] = v114;
      uint64_t v103 = +[NSNumber numberWithBool:[(CKKSIncomingQueueOperation *)self pendingClassAEntries]];
      v137[0] = v103;
      v136[1] = v115;
      char v104 = +[NSNumber numberWithBool:[(CKKSIncomingQueueOperation *)self missingKey]];
      v137[1] = v104;
      v136[2] = kSecurityRTCFieldAvgSuccessfulItemsProcessed;
      uint64_t v105 = +[NSNumber numberWithInt:v96];
      v137[2] = v105;
      v136[3] = kSecurityRTCFieldAvgErrorItemsProcessed;
      v106 = +[NSNumber numberWithInt:v102];
      v137[3] = v106;
      v136[4] = kSecurityRTCFieldSuccessfulItemsProcessed;
      uint64_t v107 = +[NSNumber numberWithUnsignedLong:[(CKKSIncomingQueueOperation *)self successfulItemsProcessed]];
      v137[4] = v107;
      v136[5] = kSecurityRTCFieldErrorItemsProcessed;
      char v108 = +[NSNumber numberWithUnsignedLong:[(CKKSIncomingQueueOperation *)self errorItemsProcessed]];
      v137[5] = v108;
      id v109 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:6];
      [v118 addMetrics:v109];

      if ([(CKKSIncomingQueueOperation *)self pendingClassAEntries]) {
        uint64_t v110 = 0;
      }
      else {
        uint64_t v110 = [(CKKSIncomingQueueOperation *)self missingKey] ^ 1;
      }
      id v47 = v116;
      id v111 = [(CKKSResultOperation *)self error];
      uint64_t v51 = v118;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v118 success:v110 error:v111];

      id v112 = [(CKKSIncomingQueueOperation *)self deps];
      id v113 = [v112 overallLaunch];
      [v113 addEvent:@"incoming-processing-complete"];

      uint64_t v52 = obj;
      goto LABEL_72;
    }
    id v73 = v72;
    uint64_t v74 = *(void *)v126;
LABEL_51:
    uint64_t v75 = 0;
    while (1)
    {
      if (*(void *)v126 != v74) {
        objc_enumerationMutation(v124);
      }
      v76 = *(void **)(*((void *)&v125 + 1) + 8 * v75);
      uint64_t v77 = [v76 launch];
      [v77 addEvent:@"incoming-processed"];

      v78 = [(CKKSResultOperation *)self error];

      if (v78)
      {
        double v79 = [(CKKSResultOperation *)self error];
        double v80 = [v76 zoneID];
        v81 = [v80 zoneName];
        [v53 logRecoverableError:v79 forEvent:@"CKKSEventProcessIncomingQueueClassC" zoneName:v81 withAttributes:0];

        v82 = [(CKKSIncomingQueueOperation *)self deps];
        v83 = [v82 lockStateTracker];
        v84 = [(CKKSResultOperation *)self error];
        unsigned __int8 v85 = [v83 isLockedError:v84];

        if ((v85 & 1) == 0)
        {
          v86 = [(CKKSResultOperation *)self error];
          id v87 = [v76 zoneID];
          v88 = [v87 zoneName];
          [v53 logRecoverableError:v86 forEvent:@"CKKSEventProcessIncomingQueueClassA" zoneName:v88 withAttributes:0];

LABEL_59:
        }
      }
      else
      {
        v89 = [v76 zoneID];
        id v90 = [v89 zoneName];
        [v53 logSuccessForEvent:@"CKKSEventProcessIncomingQueueClassC" zoneName:v90];

        if (![(CKKSIncomingQueueOperation *)self pendingClassAEntries])
        {
          v86 = [v76 zoneID];
          id v87 = [v86 zoneName];
          [v53 logSuccessForEvent:@"CKKSEventProcessIncomingQueueClassA" zoneName:v87];
          goto LABEL_59;
        }
      }
      if (v73 == (id)++v75)
      {
        id v73 = [v124 countByEnumeratingWithState:&v125 objects:v138 count:16];
        if (!v73) {
          goto LABEL_62;
        }
        goto LABEL_51;
      }
    }
  }
  id v28 = v27;
  uint64_t v29 = 0;
  uint64_t v30 = *(void *)v133;
LABEL_9:
  uint64_t v31 = 0;
  while (1)
  {
    if (*(void *)v133 != v30) {
      objc_enumerationMutation(obj);
    }
    uint64_t v32 = *(void **)(*((void *)&v132 + 1) + 8 * v31);
    uint64_t v33 = [v32 launch];
    [v33 addEvent:@"incoming-processing-begin"];

    uint64_t v130 = 0;
    uint64_t v131 = 0;
    if (![(CKKSIncomingQueueOperation *)self loadAndProcessEntries:v32 withActionFilter:@"delete" totalQueueEntries:&v131])
    {
      uint64_t v41 = [v32 zoneName];
      v42 = sub_1000CD884(@"ckksincoming", v41);

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = [(CKKSResultOperation *)self error];
        *(_DWORD *)buf = 138412290;
        unint64_t v142 = (unint64_t)v43;
        uint64_t v44 = "Early-exiting from IncomingQueueOperation (after processing deletes): %@";
        goto LABEL_30;
      }
LABEL_31:

      v46 = [(CKKSResultOperation *)self error];
      id v47 = v116;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v116 success:0 error:v46];

      goto LABEL_35;
    }
    uint64_t v34 = v131;
    if (![(CKKSIncomingQueueOperation *)self loadAndProcessEntries:v32 withActionFilter:0 totalQueueEntries:&v130])
    {
      uint64_t v45 = [v32 zoneName];
      v42 = sub_1000CD884(@"ckksincoming", v45);

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = [(CKKSResultOperation *)self error];
        *(_DWORD *)buf = 138412290;
        unint64_t v142 = (unint64_t)v43;
        uint64_t v44 = "Early-exiting from IncomingQueueOperation (after processing all incoming entries): %@";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);
      }
      goto LABEL_31;
    }
    uint64_t v35 = v130;
    if ([(CKKSIncomingQueueOperation *)self successfulItemsProcessed]
      || [(CKKSIncomingQueueOperation *)self errorItemsProcessed])
    {
      uint64_t v36 = [v32 zoneName];
      uint64_t v37 = sub_1000CD884(@"ckksincoming", v36);

      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v38 = [(CKKSIncomingQueueOperation *)self successfulItemsProcessed];
        unint64_t v39 = [(CKKSIncomingQueueOperation *)self errorItemsProcessed];
        *(_DWORD *)buf = 134218240;
        unint64_t v142 = v38;
        __int16 v143 = 2048;
        unint64_t v144 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Processed %lu items in incoming queue (%lu errors)", buf, 0x16u);
      }
    }
    if (![(CKKSIncomingQueueOperation *)self fixMismatchedViewItems:v32]) {
      break;
    }
    v29 += v34 + v35;
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_100079364;
    v129[3] = &unk_100305670;
    uint8_t v129[4] = v32;
    v129[5] = self;
    [v122 dispatchSyncWithSQLTransaction:v129];
    if (v28 == (id)++v31)
    {
      id v28 = [obj countByEnumeratingWithState:&v132 objects:v145 count:16];
      if (!v28) {
        goto LABEL_24;
      }
      goto LABEL_9;
    }
  }
  v48 = [v32 zoneName];
  id v49 = sub_1000CD884(@"ckksincoming", v48);

  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Early-exiting from IncomingQueueOperation due to failure fixing mismatched items", buf, 2u);
  }

  id v47 = v116;
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v116 success:1 error:0];
LABEL_35:
  v50 = [(CKKSResultOperation *)self error];
  uint64_t v51 = v118;
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v118 success:0 error:v50];
  uint64_t v52 = obj;

  id v53 = obj;
LABEL_72:
}

- (BOOL)_onqueueUpdateIQE:(id)a3 withState:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v7 state];
  unsigned __int8 v10 = [v9 isEqualToString:v8];

  if (v10) {
    goto LABEL_4;
  }
  id v11 = [v7 whereClauseToFindSelf];
  id v12 = [v11 mutableCopy];

  id v13 = [v7 state];
  [v12 setObject:v13 forKeyedSubscript:@"state"];

  [v7 setState:v8];
  if (![v7 saveToDatabase:a5])
  {

    LOBYTE(v15) = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [(id)objc_opt_class() sqlTable];
  BOOL v15 = +[CKKSSQLDatabaseObject deleteFromTable:v14 where:v12 connection:0 error:a5];

  if (v15) {
LABEL_4:
  }
    LOBYTE(v15) = 1;
LABEL_6:

  return v15;
}

- (void)_onqueueHandleMismatchedViewItem:(id)a3 secDbClass:(const SecDbClass *)a4 attributes:(id)a5 intendedView:(id)a6 viewState:(id)a7 keyCache:(id)a8
{
  id v14 = a3;
  CFDictionaryRef v15 = (const __CFDictionary *)a5;
  id v16 = (__CFString *)a6;
  id v17 = a7;
  id v18 = a8;
  CFDictionaryRef v19 = [v17 zoneID];
  id v20 = [v19 zoneName];
  id v21 = sub_1000CD884(@"ckksincoming", v20);

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v14 uuid];
    *(_DWORD *)buf = 138412546;
    v59 = v22;
    __int16 v60 = 2112;
    v61 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received an item (%@), which should be in view %@", buf, 0x16u);
  }
  uint64_t v23 = [v14 action];
  if ([v23 isEqualToString:@"add"])
  {
  }
  else
  {
    CFTypeRef v24 = [v14 action];
    unsigned int v25 = [v24 isEqualToString:@"modify"];

    if (!v25)
    {
      uint64_t v35 = [v14 action];
      unsigned int v36 = [v35 isEqualToString:@"delete"];

      if (v36)
      {
        id v37 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v16 ownerName:CKCurrentUserDefaultName];
        unint64_t v38 = [v14 uuid];
        unint64_t v39 = self;
        id v40 = v37;
        uint64_t v41 = [(CKKSIncomingQueueOperation *)v39 deps];
        v42 = [v41 contextID];
        id v56 = 0;
        CFStringRef v54 = v40;
        uint64_t v43 = +[CKKSMirrorEntry tryFromDatabase:v38 contextID:v42 zoneID:v40 error:&v56];
        uint64_t v44 = (__CFString *)v56;

        uint64_t v45 = [v17 zoneID];
        v46 = [v45 zoneName];
        id v47 = sub_1000CD884(@"ckksincoming", v46);

        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        if (!v43 || v44)
        {
          if (v48)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v44;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Unable to load CKKSMirrorEntry from database* %@", buf, 0xCu);
          }
          id v49 = v54;
        }
        else
        {
          if (v48)
          {
            *(_DWORD *)buf = 138412546;
            v59 = v16;
            __int16 v60 = 2112;
            v61 = v43;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Other view (%@) already knows about this item, dropping incoming queue entry: %@", buf, 0x16u);
          }

          id v55 = 0;
          [v14 deleteFromDatabase:&v55];
          id v47 = v55;
          id v49 = v54;
          if (v47)
          {
            id v53 = v43;
            v50 = [v17 zoneID];
            uint64_t v51 = [v50 zoneName];
            uint64_t v52 = sub_1000CD884(@"ckksincoming", v51);

            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = (__CFString *)v47;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Unable to delete IQE: %@", buf, 0xCu);
            }

            uint64_t v43 = v53;
            id v49 = v54;
          }
        }
      }
      goto LABEL_17;
    }
  }
  v57 = 0;
  uint64_t v26 = (__CFString *)sub_10011ACF4((uint64_t)a4, v15, dword_10035D2B0, &v57);
  if (v26 && !v57)
  {
    id v27 = v26;
    if ([(CKKSIncomingQueueOperation *)self _onqueueHandleIQEChange:v14 item:v26 viewState:v17 sortedForThisView:0 keyCache:v18])
    {
      id v28 = [v17 zoneID];
      uint64_t v29 = [v28 zoneName];
      uint64_t v30 = sub_1000CD884(@"ckksincoming", v29);

      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v16;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Wrote a keychain item that is actually for %@; requesting scan",
          buf,
          0xCu);
      }

      uint64_t v31 = [(CKKSIncomingQueueOperation *)self viewsToScan];
      [v31 addObject:v16];
    }
    goto LABEL_16;
  }
  uint64_t v32 = [v17 zoneID];
  uint64_t v33 = [v32 zoneName];
  uint64_t v34 = sub_1000CD884(@"ckksincoming", v33);

  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v57;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Unable to create SecDbItemRef from IQE: %@", buf, 0xCu);
  }

  id v27 = v57;
  if (v57)
  {
    v57 = 0;
LABEL_16:
    CFRelease(v27);
  }
LABEL_17:
}

- (BOOL)intransaction:(id)a3 processQueueEntries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v98 = objc_alloc_init((Class)NSMutableArray);
  id v97 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v105 = objc_alloc_init(CKKSMemoryKeyCache);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id obj = v7;
  id v104 = [obj countByEnumeratingWithState:&v112 objects:v124 count:16];
  if (v104)
  {
    uint64_t v103 = *(void *)v113;
    id v8 = NSMutableString_ptr;
    BOOL v100 = self;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v113 != v103) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v112 + 1) + 8 * (void)v9);
        id v11 = v10;
        id v12 = [v6 zoneID];
        id v13 = [v12 zoneName];
        id v14 = sub_1000CD884(@"ckksincoming", v13);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          CFDictionaryRef v15 = [v11 uuid];
          id v16 = [v11 action];
          *(_DWORD *)buf = 138412802;
          id v119 = v11;
          __int16 v120 = 2112;
          id v121 = v15;
          __int16 v122 = 2112;
          id v123 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ready to process an incoming queue entry: %@ %@ %@", buf, 0x20u);
        }
        id v17 = [v11 item];
        id v18 = [(CKKSIncomingQueueOperation *)self deps];
        id v111 = 0;
        CFDictionaryRef v19 = +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:v17 keyCache:v105 ckksOperationalDependencies:v18 error:&v111];
        id v20 = v111;

        if (v19 && !v20)
        {
          id v21 = [v19 objectForKey:kSecClass];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v21)
            {
              id v22 = sub_10000C614(v21);
              if (v22)
              {
                uint64_t v23 = v22;
                CFTypeRef v24 = [(CKKSIncomingQueueOperation *)self deps];
                unsigned int v25 = [v24 syncingPolicy];
                uint64_t v101 = v19;
                uint64_t v26 = [v25 mapDictionaryToView:v19];

                id v27 = [v6 zoneID];
                id v28 = [v27 zoneName];
                uint64_t v29 = self;
                unsigned __int8 v30 = [v28 isEqualToString:v26];

                if (v30)
                {
                  uint64_t v31 = [v11 action];
                  if ([v31 isEqualToString:@"add"])
                  {

                    goto LABEL_53;
                  }
                  uint64_t v74 = [v11 action];
                  unsigned int v75 = [v74 isEqualToString:@"modify"];

                  if (v75)
                  {
LABEL_53:
                    CFDictionaryRef v19 = v101;
                    [(CKKSIncomingQueueOperation *)v100 _onqueueHandleIQEChange:v11 attributes:v101 class:v23 viewState:v6 sortedForThisView:1 keyCache:v105];
                    v76 = [v11 item];
                    uint64_t v77 = [v6 zoneID];
                    v78 = [v76 CKRecordWithZoneID:v77];
                    [v98 addObject:v78];

                    self = v100;
                    id v20 = 0;
                    id v8 = NSMutableString_ptr;
                  }
                  else
                  {
                    v88 = [v11 action];
                    unsigned int v89 = [v88 isEqualToString:@"delete"];

                    self = v100;
                    if (v89)
                    {
                      [(CKKSIncomingQueueOperation *)v100 _onqueueHandleIQEDelete:v11 class:v23 viewState:v6];
                      id v90 = objc_alloc((Class)CKRecordID);
                      id v91 = [v11 uuid];
                      v92 = [v6 zoneID];
                      id v93 = [v90 initWithRecordName:v91 zoneID:v92];
                      [v97 addObject:v93];

                      self = v100;
                    }
                    id v20 = 0;
                    id v8 = NSMutableString_ptr;
                    CFDictionaryRef v19 = v101;
                  }
                }
                else
                {
                  self = v29;
                  if ([(CKKSIncomingQueueOperation *)v29 handleMismatchedViewItems])
                  {
                    id v73 = v29;
                    CFDictionaryRef v19 = v101;
                    [(CKKSIncomingQueueOperation *)v73 _onqueueHandleMismatchedViewItem:v11 secDbClass:v23 attributes:v101 intendedView:v26 viewState:v6 keyCache:v105];
                    id v20 = 0;
                  }
                  else
                  {
                    double v79 = [v6 zoneID];
                    double v80 = [v79 zoneName];
                    v81 = sub_1000CD884(@"ckksincoming", v80);

                    CFDictionaryRef v19 = v101;
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      v82 = [v11 uuid];
                      *(_DWORD *)buf = 138412546;
                      id v119 = v82;
                      __int16 v120 = 2112;
                      id v121 = v26;
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Received an item (%@), but our current policy claims it should be in view %@", buf, 0x16u);
                    }
                    id v107 = 0;
                    [(CKKSIncomingQueueOperation *)self _onqueueUpdateIQE:v11 withState:@"mismatched_view" error:&v107];
                    id v20 = v107;
                    if (v20)
                    {
                      v83 = [v6 zoneID];
                      v84 = [v83 zoneName];
                      unsigned __int8 v85 = sub_1000CD884(@"ckksincoming", v84);

                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v119 = v20;
                        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Couldn't save mismatched IQE to database: %@", buf, 0xCu);
                      }

                      self = v100;
                      [(CKKSIncomingQueueOperation *)v100 setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)v100 errorItemsProcessed] + 1];
                      [(CKKSResultOperation *)v100 setError:v20];
                    }
                    v86 = [(CKKSIncomingQueueOperation *)self deps];
                    id v87 = [v86 requestPolicyCheck];
                    [v87 trigger];
                  }
                  id v8 = NSMutableString_ptr;
                }

LABEL_38:
                goto LABEL_48;
              }
            }
            __int16 v60 = [v6 zoneID];
            v61 = [v60 zoneName];
            v62 = sub_1000CD884(@"ckksincoming", v61);

            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v119 = v21;
              __int16 v120 = 2112;
              id v121 = v11;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "unknown class in object: %@ %@", buf, 0x16u);
            }

            [v11 setState:@"error"];
            id v108 = 0;
            [v11 saveToDatabase:&v108];
            id v20 = v108;
            if (v20)
            {
              uint64_t v63 = [v6 zoneID];
              v64 = [v63 zoneName];
              BOOL v65 = sub_1000CD884(@"ckksincoming", v64);

              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v119 = v20;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Couldn't save errored IQE to database: %@", buf, 0xCu);
              }

              [(CKKSResultOperation *)self setError:v20];
            }
            [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
          }
          else
          {
            NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
            id v53 = [v8[14] stringWithFormat:@"Item did not have a reasonable class: %@", v21];
            id v117 = v53;
            CFStringRef v54 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
            id v55 = +[NSError errorWithDomain:@"securityd" code:-67671 userInfo:v54];
            [(CKKSResultOperation *)self setError:v55];

            id v56 = [v6 zoneID];
            v57 = [v56 zoneName];
            v58 = sub_1000CD884(@"ckksincoming", v57);

            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v59 = [(CKKSResultOperation *)self error];
              *(_DWORD *)buf = 138412290;
              id v119 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Synced item seems wrong: %@", buf, 0xCu);
            }
            [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
            id v20 = 0;
          }
          id v8 = NSMutableString_ptr;
          goto LABEL_38;
        }
        uint64_t v32 = [(CKKSIncomingQueueOperation *)self deps];
        uint64_t v33 = [v32 lockStateTracker];
        unsigned int v34 = [v33 isLockedError:v20];

        if (v34)
        {
          unint64_t v102 = v19;
          uint64_t v35 = [v6 zoneID];
          unsigned int v36 = [v35 zoneName];
          id v37 = sub_1000CD884(@"ckksincoming", v36);

          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v119 = v11;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Keychain is locked; can't decrypt IQE %@",
              buf,
              0xCu);
          }

          unint64_t v38 = [v11 item];
          unint64_t v39 = [v38 parentKeyUUID];
          uint64_t v40 = [v6 contextID];
          uint64_t v41 = v6;
          v42 = (void *)v40;
          uint64_t v43 = v41;
          uint64_t v44 = [v41 zoneID];
          id v110 = 0;
          uint64_t v45 = +[CKKSKey tryFromDatabase:v39 contextID:v42 zoneID:v44 error:&v110];
          id v46 = v110;

          id v47 = [v45 keyclass];
          LODWORD(v39) = [v47 isEqualToString:@"classA"];

          self = v100;
          if (v39)
          {
            [(CKKSIncomingQueueOperation *)v100 setPendingClassAEntries:1];
            [(CKKSIncomingQueueOperation *)v100 setPendingClassAEntriesError:v20];
          }

          id v6 = v43;
          id v8 = NSMutableString_ptr;
          CFDictionaryRef v19 = v102;
        }
        else
        {
          BOOL v48 = [v20 domain];
          if (![v48 isEqualToString:@"securityd"])
          {

            self = v100;
LABEL_40:
            v66 = [v6 zoneID];
            id v67 = [v66 zoneName];
            uint64_t v68 = sub_1000CD884(@"ckksincoming", v67);

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v119 = v11;
              __int16 v120 = 2112;
              id v121 = v20;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Couldn't decrypt IQE %@ for some reason: %@", buf, 0x16u);
            }

            [v11 setState:@"error"];
            id v109 = 0;
            [v11 saveToDatabase:&v109];
            id v69 = v109;
            if (v69)
            {
              v70 = [v6 zoneID];
              v71 = [v70 zoneName];
              id v72 = sub_1000CD884(@"ckksincoming", v71);

              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v119 = v11;
                __int16 v120 = 2112;
                id v121 = v69;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Couldn't save IQE %@ as error for some reason: %@", buf, 0x16u);
              }

              id v8 = NSMutableString_ptr;
            }
            [(CKKSResultOperation *)self setError:v20];

            goto LABEL_47;
          }
          id v49 = [v20 code];

          self = v100;
          if (v49 != (id)-25300) {
            goto LABEL_40;
          }
          v50 = [v6 zoneID];
          uint64_t v51 = [v50 zoneName];
          uint64_t v52 = sub_1000CD884(@"ckksincoming", v51);

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v119 = v20;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Coudn't find key in keychain; will attempt to poke key hierarchy: %@",
              buf,
              0xCu);
          }

          [(CKKSIncomingQueueOperation *)v100 setMissingKey:1];
          [(CKKSResultOperation *)v100 setError:v20];
        }
LABEL_47:
        [(CKKSIncomingQueueOperation *)self setErrorItemsProcessed:(char *)[(CKKSIncomingQueueOperation *)self errorItemsProcessed] + 1];
LABEL_48:

        BOOL v9 = (char *)v9 + 1;
      }
      while (v104 != v9);
      id v94 = [obj countByEnumeratingWithState:&v112 objects:v124 count:16];
      id v104 = v94;
    }
    while (v94);
  }

  if ([v98 count] || v97)
  {
    v95 = [v6 notifyViewChangedScheduler];
    [v95 trigger];
  }
  return 1;
}

- (BOOL)processNewCurrentItemPointers:(id)a3 viewState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      id v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
        [v13 setState:@"local"];
        id v22 = v12;
        [v13 saveToDatabase:&v22];
        id v9 = v22;

        CFDictionaryRef v15 = [v6 zoneName];
        id v16 = sub_1000CD884(@"ckkspointer", v15);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Saving new current item pointer: %@", buf, 0xCu);
        }

        if (v9)
        {
          id v17 = [v6 zoneName];
          id v18 = sub_1000CD884(@"ckksincoming", v17);

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = v9;
            __int16 v29 = 2112;
            unsigned __int8 v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error saving new current item pointer: %@ %@", buf, 0x16u);
          }
        }
        id v11 = (char *)v11 + 1;
        id v12 = v9;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  if ([obj count])
  {
    CFDictionaryRef v19 = [v6 notifyViewChangedScheduler];
    [v19 trigger];
  }
  return v9 == 0;
}

- (CKKSIncomingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 pendingClassAItemsRemainingState:(id)a5 errorState:(id)a6 handleMismatchedViewItems:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKKSIncomingQueueOperation;
  id v17 = [(CKKSResultOperation *)&v22 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_nextState, a6);
    objc_storeStrong((id *)&v18->_stateIfClassAItemsRemaining, a5);
    v18->_pendingClassAEntries = 0;
    v18->_handleMismatchedViewItems = a7;
    uint64_t v19 = +[NSMutableSet set];
    viewsToScan = v18->_viewsToScan;
    v18->_viewsToScan = (NSMutableSet *)v19;

    [(CKKSIncomingQueueOperation *)v18 setName:@"incoming-queue-operation"];
  }

  return v18;
}

- (CKKSIncomingQueueOperation)init
{
  return 0;
}

+ (id)decryptCKKSItemToAttributes:(id)a3 keyCache:(id)a4 ckksOperationalDependencies:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = +[CKKSItemEncrypter decryptItemToDictionary:v8 keyCache:a4 error:a6];
  id v10 = [v9 mutableCopy];

  if (v10)
  {
    id v11 = [v8 uuid];
    [v10 setObject:v11 forKeyedSubscript:kSecAttrUUID];

    id v12 = [v8 plaintextPCSServiceIdentifier];

    if (v12)
    {
      id v13 = [v8 plaintextPCSServiceIdentifier];
      [v10 setObject:v13 forKeyedSubscript:kSecAttrPCSPlaintextServiceIdentifier];
    }
    id v14 = [v8 plaintextPCSPublicKey];

    if (v14)
    {
      id v15 = [v8 plaintextPCSPublicKey];
      [v10 setObject:v15 forKeyedSubscript:kSecAttrPCSPlaintextPublicKey];
    }
    id v16 = [v8 plaintextPCSPublicIdentity];

    if (v16)
    {
      id v17 = [v8 plaintextPCSPublicIdentity];
      [v10 setObject:v17 forKeyedSubscript:kSecAttrPCSPlaintextPublicIdentity];
    }
    [v10 setValue:&__kCFBooleanTrue forKey:kSecAttrSynchronizable];
    id v18 = v10;
  }

  return v10;
}

@end