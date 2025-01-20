@interface EscrowRequestServer
+ (id)request:(id *)a3;
+ (id)server;
- (BOOL)escrowCompletedWithinLastSeconds:(double)a3;
- (BOOL)pendingEscrowUpload:(id *)a3;
- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4;
- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5;
- (EscrowRequestController)controller;
- (EscrowRequestServer)initWithLockStateTracker:(id)a3;
- (id)fetchStatuses:(id *)a3;
- (void)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 reply:(id)a5;
- (void)escrowCompletedWithinLastSeconds:(double)a3 reply:(id)a4;
- (void)fetchPrerecord:(id)a3 reply:(id)a4;
- (void)fetchRequestStatuses:(id)a3;
- (void)fetchRequestWaitingOnPasscode:(id)a3;
- (void)resetAllRequests:(id)a3;
- (void)setController:(id)a3;
- (void)setupAnalytics;
- (void)storePrerecordsInEscrow:(id)a3;
- (void)triggerEscrowUpdate:(id)a3 options:(id)a4 reply:(id)a5;
@end

@implementation EscrowRequestServer

- (void).cxx_destruct
{
}

- (void)setController:(id)a3
{
}

- (EscrowRequestController)controller
{
  return (EscrowRequestController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setupAnalytics
{
  id v3 = +[CKKSAnalytics logger];
  id v2 = [v3 AddMultiSamplerForName:@"escorwrequest-healthSummary" withTimeInterval:&stru_1002F8328 block:SFAnalyticsSamplerIntervalOncePerReport];
}

- (void)escrowCompletedWithinLastSeconds:(double)a3 reply:(id)a4
{
  v5 = (void (**)(id, uint64_t, void))a4;
  id v20 = 0;
  v6 = +[SecEscrowPendingRecord loadAllFromKeychain:&v20];
  id v7 = v20;
  v8 = v7;
  if (!v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v12 = v6;
    uint64_t v11 = (uint64_t)[v12 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (!v11)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v13 = *(void *)v17;
LABEL_7:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v17 != v13) {
        objc_enumerationMutation(v12);
      }
      v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
      if (objc_msgSend(v15, "uploadCompleted", (void)v16))
      {
        if ([v15 escrowAttemptedWithinLastSeconds:a3]) {
          break;
        }
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = (uint64_t)[v12 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          goto LABEL_7;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    uint64_t v11 = 1;
    goto LABEL_19;
  }
  v9 = [v7 domain];
  if (([v9 isEqualToString:NSOSStatusErrorDomain] & 1) == 0)
  {

LABEL_16:
    v12 = sub_10000B070("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "escrowrequest: failed to load requests: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  id v10 = [v8 code];

  if (v10 != (id)-25300) {
    goto LABEL_16;
  }
  uint64_t v11 = 0;
LABEL_20:
  v5[2](v5, v11, 0);
}

- (void)storePrerecordsInEscrow:(id)a3
{
  id v4 = a3;
  v5 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "attempting to store a prerecord in escrow", v7, 2u);
  }

  v6 = [(EscrowRequestServer *)self controller];
  [v6 storePrerecordsInEscrowRPC:v4];
}

- (void)resetAllRequests:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "deleting all requests", buf, 2u);
  }

  id v27 = 0;
  v5 = +[SecEscrowPendingRecord loadAllFromKeychain:&v27];
  id v6 = v27;
  if (v6)
  {
    id v7 = v6;
    v8 = [v6 domain];
    if ([v8 isEqualToString:NSOSStatusErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)-25300)
      {
        id v10 = sub_10000B070("escrowrequest");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no extant requests; nothing to delete",
            buf,
            2u);
        }

        v3[2](v3, 0);
        goto LABEL_27;
      }
    }
    else
    {
    }
    long long v19 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "error fetching records: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v3)[2](v3, v7);
  }
  else
  {
    id v20 = v5;
    v21 = (void (**)(void, id))v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      id v7 = 0;
      uint64_t v14 = *(void *)v24;
      do
      {
        v15 = 0;
        long long v16 = v7;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v15);
          id v22 = v16;
          [v17 deleteFromKeychain:&v22 v20];
          id v7 = v22;

          if (v7)
          {
            long long v18 = sub_10000B070("escrowrequest");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v29 = v17;
              __int16 v30 = 2112;
              id v31 = v7;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to delete %@: %@", buf, 0x16u);
            }
          }
          v15 = (char *)v15 + 1;
          long long v16 = v7;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v13);
    }
    else
    {
      id v7 = 0;
    }

    id v3 = (void (**)(id, void))v21;
    v21[2](v21, v7);
    v5 = v20;
  }
LABEL_27:
}

- (void)fetchRequestStatuses:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v33 = 0;
  id v4 = +[SecEscrowPendingRecord loadAllFromKeychain:&v33];
  id v5 = v33;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:NSOSStatusErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)-25300)
      {
        id v9 = sub_10000B070("escrowrequest");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "no extant requests", buf, 2u);
        }

        v3[2](v3, &__NSDictionary0__struct, 0);
        goto LABEL_28;
      }
    }
    else
    {
    }
    long long v24 = sub_10000B070("SecError");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "escrowrequest: failed to load requests: %@", buf, 0xCu);
    }

    ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
  }
  else
  {
    long long v25 = 0;
    id v27 = v3;
    id v10 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "found requests: %@", buf, 0xCu);
    }

    id v11 = +[NSMutableDictionary dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v26 = v4;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      CFStringRef v28 = (const __CFString *)SecEscrowRequestPendingCertificate;
      CFStringRef v16 = (const __CFString *)SecEscrowRequestPendingPasscode;
      CFStringRef v17 = (const __CFString *)SecEscrowRequestHavePrecord;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v19, "uploadCompleted", v25))
          {
            id v20 = [v19 uuid];
            v21 = v11;
            CFStringRef v22 = @"complete";
          }
          else if ([v19 hasSerializedPrerecord])
          {
            id v20 = [v19 uuid];
            v21 = v11;
            CFStringRef v22 = v17;
          }
          else
          {
            unsigned int v23 = [v19 certCached];
            id v20 = [v19 uuid];
            v21 = v11;
            if (v23) {
              CFStringRef v22 = v16;
            }
            else {
              CFStringRef v22 = v28;
            }
          }
          [v21 setObject:v22 forKeyedSubscript:v20];
        }
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v14);
    }

    id v3 = v27;
    v27[2](v27, v11, 0);

    id v6 = v25;
    id v4 = v26;
  }
LABEL_28:
}

- (void)triggerEscrowUpdate:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Triggering an escrow update request due to '%@'", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(EscrowRequestServer *)self controller];
  [v12 triggerEscrowUpdateRPC:v8 options:v10 reply:v9];
}

- (void)fetchRequestWaitingOnPasscode:(id)a3
{
  id v3 = a3;
  id v31 = 0;
  id v4 = +[SecEscrowPendingRecord loadAllFromKeychain:&v31];
  id v5 = v31;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:NSOSStatusErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)-25300)
      {
        id v9 = +[CKKSAnalytics logger];
        [v9 setDateProperty:0 forKey:@"ERSPending"];

        (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
        goto LABEL_30;
      }
    }
    else
    {
    }
LABEL_24:
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v6);
    goto LABEL_30;
  }
  if (!v4) {
    goto LABEL_24;
  }
  long long v25 = v4;
  id v26 = v3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      if (objc_msgSend(v15, "certCached", v25)) {
        break;
      }
      CFStringRef v17 = sub_10000B070("escrowrequest");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = [v15 uuid];
        *(_DWORD *)buf = 138412290;
        id v33 = v19;
        id v20 = v17;
        v21 = "Escrow request %@ doesn't yet have a certificate cached";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
LABEL_18:

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v12) {
          goto LABEL_8;
        }
        goto LABEL_20;
      }
    }
    unsigned int v16 = [v15 hasSerializedPrerecord];
    CFStringRef v17 = sub_10000B070("escrowrequest");
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v18)
      {
        unsigned int v23 = [v15 uuid];
        *(_DWORD *)buf = 138412290;
        id v33 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Escrow request %@ is pending a passcode", buf, 0xCu);
      }
      long long v24 = [v15 uuid];
      id v3 = v26;
      (*((void (**)(id, void *, void))v26 + 2))(v26, v24, 0);

      goto LABEL_29;
    }
    if (!v18) {
      goto LABEL_18;
    }
    long long v19 = [v15 uuid];
    *(_DWORD *)buf = 138412290;
    id v33 = v19;
    id v20 = v17;
    v21 = "Escrow request %@ already has a prerecord; no passcode needed";
    goto LABEL_17;
  }
LABEL_20:

  CFStringRef v22 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No escrow requests need a passcode", buf, 2u);
  }

  id v3 = v26;
  (*((void (**)(id, void, void))v26 + 2))(v26, 0, 0);
LABEL_29:
  id v4 = v25;
LABEL_30:
}

- (void)fetchPrerecord:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v16 = 0;
  id v7 = +[SecEscrowPendingRecord loadFromKeychain:v5 error:&v16];
  id v8 = v16;
  if (v8)
  {
    id v9 = sub_10000B070("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to load prerecord with uuid %@: %@", buf, 0x16u);
    }

    v6[2](v6, 0, v8);
    goto LABEL_16;
  }
  if ([v7 uploadCompleted])
  {
    id v10 = sub_10000B070("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      id v11 = "escrowrequest: prerecord for uuid %@ already uploaded";
      id v12 = v10;
      uint32_t v13 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (![v7 hasSerializedPrerecord])
  {
    id v10 = sub_10000B070("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = 0;
      id v11 = "escrowrequest: no prerecord for uuid %@: %@";
      id v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_14;
    }
LABEL_15:

    v6[2](v6, 0, 0);
    goto LABEL_16;
  }
  uint64_t v14 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fetched prerecord for uuid %@", buf, 0xCu);
  }

  uint64_t v15 = [v7 serializedPrerecord];
  ((void (**)(id, void *, id))v6)[2](v6, v15, 0);

LABEL_16:
}

- (void)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v21 = 0;
  id v11 = +[SecEscrowPendingRecord loadFromKeychain:v8 error:&v21];
  id v12 = v21;
  if (v12)
  {
    uint32_t v13 = v12;
    uint64_t v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      long long v25 = v13;
      uint64_t v15 = "escrowrequest: unable to load uuid %@: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  [v11 setSerializedPrerecord:v9];
  id v20 = 0;
  [v11 saveToKeychain:&v20];
  id v16 = v20;
  if (v16)
  {
    uint32_t v13 = v16;
    uint64_t v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      long long v25 = v13;
      uint64_t v15 = "escrowrequest: unable to save new prerecord for uuid %@: %@";
      goto LABEL_7;
    }
LABEL_8:

    v10[2](v10, v13);
    goto LABEL_9;
  }
  CFStringRef v17 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "saved new prerecord for uuid %@", buf, 0xCu);
  }

  id v18 = [(EscrowRequestServer *)self controller];
  __int16 v19 = [v18 stateMachine];
  [v19 pokeStateMachine];

  v10[2](v10, 0);
LABEL_9:
}

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D884;
  v7[3] = &unk_100309728;
  id v9 = &v10;
  id v5 = dispatch_semaphore_create(0);
  id v8 = v5;
  [(EscrowRequestServer *)self escrowCompletedWithinLastSeconds:v7 reply:a3];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_10004DBC0;
  long long v32 = sub_10004DBD0;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_10004DBC0;
  id v26 = sub_10004DBD0;
  id v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004DBD8;
  v21[3] = &unk_1002F82E8;
  v21[4] = &v28;
  v21[5] = &v22;
  [(EscrowRequestServer *)self fetchRequestStatuses:v21];
  if (v23[5])
  {
    id v4 = sub_10000B070("escrow");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v23[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "failed to fetch escrow statuses: %@", buf, 0xCu);
    }

    if (a3)
    {
      char v6 = 0;
      *a3 = (id) v23[5];
      goto LABEL_21;
    }
LABEL_20:
    char v6 = 0;
    goto LABEL_21;
  }
  id v7 = (void *)v29[5];
  if (!v7 || ![v7 count]) {
    goto LABEL_20;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [[(id)v29[5] allValues];
  char v6 = 0;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = SecEscrowRequestHavePrecord;
    uint64_t v12 = SecEscrowRequestPendingPasscode;
    uint64_t v13 = SecEscrowRequestPendingCertificate;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v15 isEqualToString:v11] & 1) != 0
          || ([v15 isEqualToString:v12] & 1) != 0
          || [v15 isEqualToString:v13])
        {
          char v6 = 1;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v34 count:16];
    }
    while (v9);
  }

LABEL_21:
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v6 & 1;
}

- (id)fetchStatuses:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_10004DBC0;
  long long v18 = sub_10004DBD0;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10004DBC0;
  uint64_t v12 = sub_10004DBD0;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DDD0;
  v7[3] = &unk_1002F82E8;
  void v7[4] = &v14;
  v7[5] = &v8;
  [(EscrowRequestServer *)self fetchRequestStatuses:v7];
  if (a3)
  {
    id v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10004DBC0;
  uint64_t v22 = sub_10004DBD0;
  id v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004DFCC;
  v15[3] = &unk_1003094A0;
  long long v17 = &v18;
  uint64_t v10 = dispatch_semaphore_create(0);
  uint64_t v16 = v10;
  [(EscrowRequestServer *)self triggerEscrowUpdate:v8 options:v9 reply:v15];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = v19;
  if (a5)
  {
    uint64_t v12 = (void *)v19[5];
    if (v12)
    {
      *a5 = v12;
      uint64_t v11 = v19;
    }
  }
  BOOL v13 = v11[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return [(EscrowRequestServer *)self triggerEscrowUpdate:a3 options:0 error:a4];
}

- (EscrowRequestServer)initWithLockStateTracker:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EscrowRequestServer;
  id v5 = [(EscrowRequestServer *)&v9 init];
  if (v5)
  {
    char v6 = [[EscrowRequestController alloc] initWithLockStateTracker:v4];
    controller = v5->_controller;
    v5->_controller = v6;
  }
  return v5;
}

+ (id)request:(id *)a3
{
  return +[EscrowRequestServer server];
}

+ (id)server
{
  if (qword_10035CD10 != -1) {
    dispatch_once(&qword_10035CD10, &stru_1002F82C0);
  }
  id v2 = (void *)qword_10035CD08;

  return v2;
}

@end