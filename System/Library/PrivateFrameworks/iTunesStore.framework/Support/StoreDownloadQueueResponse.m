@interface StoreDownloadQueueResponse
- (BOOL)shouldCancelPurchaseBatch;
- (BOOL)triggeredQueueCheck;
- (NSArray)rangesToLoad;
- (NSData)keybag;
- (NSError)error;
- (NSNumber)userIdentifier;
- (NSOrderedSet)clusterMappings;
- (NSOrderedSet)downloads;
- (NSString)clientIdentifier;
- (NSString)storeCorrelationID;
- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4;
- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5;
- (StoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4;
- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4;
- (id)_initStoreDownloadQueueResponse;
- (id)_newManifestWithStoreDownloadQueueResponse:(id)a3 accountID:(id)a4 accountName:(id)a5;
- (id)copyJobManifestWithAccountID:(id)a3 accountName:(id)a4;
- (id)errorForItemIdentifier:(id)a3;
- (void)enumerateActivitiesWithAccountID:(id)a3 accountName:(id)a4 usingBlock:(id)a5;
- (void)setClientIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setShouldCancelPurchaseBatch:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTriggeredQueueCheck:(BOOL)a3;
@end

@implementation StoreDownloadQueueResponse

- (id)_initStoreDownloadQueueResponse
{
  v6.receiver = self;
  v6.super_class = (Class)StoreDownloadQueueResponse;
  v2 = [(StoreDownloadQueueResponse *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.StoreDownloadQueueResponse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4
{
  return [(StoreDownloadQueueResponse *)self initWithDictionary:a3 userIdentifier:a4 preferredAssetFlavor:0];
}

- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v88 = a5;
  v10 = [(StoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  if (v10)
  {
    v11 = objc_opt_new();
    v12 = [v8 objectForKey:@"page-type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 objectForKey:@"template-name"];

      v12 = (void *)v13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v14 = [v12 isEqualToString:@"preorder-success"];
    }
    else {
      unsigned __int8 v14 = 0;
    }
    v15 = [v8 objectForKey:@"more"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = ISCopyLoadMoreRangesFromArray();
      rangesToLoad = v10->_rangesToLoad;
      v10->_rangesToLoad = (NSArray *)v16;
    }
    v18 = [v8 objectForKey:@"failureType"];

    if (v18)
    {
      v19 = [v8 objectForKey:@"customerMessage"];
      uint64_t v20 = [(StoreDownloadQueueResponse *)v10 _errorWithFailureType:v18 customerMessage:v19];
      error = v10->_error;
      v10->_error = (NSError *)v20;
    }
    id v22 = [v8 objectForKey:@"failed-items"];

    objc_opt_class();
    id v85 = v9;
    id v86 = v8;
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v97 = v14;
      v93 = v11;
      id v99 = v22;
      id v101 = objc_alloc_init((Class)NSMutableDictionary);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v23 = v22;
      id v24 = [v23 countByEnumeratingWithState:&v119 objects:v127 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v120;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v120 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v119 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = [v28 objectForKey:@"item-id"];
              v30 = [v28 objectForKey:@"failureType"];
              v31 = [v28 objectForKey:@"customerMessage"];
              v32 = [(StoreDownloadQueueResponse *)v10 _errorWithFailureType:v30 customerMessage:v31];

              if (v29) {
                BOOL v33 = v32 == 0;
              }
              else {
                BOOL v33 = 1;
              }
              if (!v33) {
                [v101 setObject:v32 forKey:v29];
              }
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v119 objects:v127 count:16];
        }
        while (v25);
      }

      v34 = (NSDictionary *)[v101 copy];
      itemErrors = v10->_itemErrors;
      v10->_itemErrors = v34;

      id v9 = v85;
      id v8 = v86;
      v11 = v93;
      id v22 = v99;
      unsigned __int8 v14 = v97;
    }
    uint64_t v36 = [v8 objectForKey:@"keybag"];
    keybag = v10->_keybag;
    v10->_keybag = (NSData *)v36;

    v38 = [v8 objectForKey:@"dsPersonId"];
    v39 = SSAccountGetUniqueIdentifierFromValue();

    if (v39) {
      v40 = v39;
    }
    else {
      v40 = v9;
    }
    v41 = (NSNumber *)[v40 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = v41;

    if ((v14 & 1) == 0)
    {
      uint64_t v43 = [v8 objectForKey:@"items"];

      id v22 = (id)v43;
      if (!v43)
      {
        id v22 = [v8 objectForKey:@"songList"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v83 = v39;
        v44 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
        downloads = v10->_downloads;
        v10->_downloads = v44;

        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v22 = v22;
        id v46 = [v22 countByEnumeratingWithState:&v115 objects:v126 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v116;
          do
          {
            v49 = v22;
            for (j = 0; j != v47; j = (char *)j + 1)
            {
              if (*(void *)v116 != v48) {
                objc_enumerationMutation(v49);
              }
              v51 = [[StoreDownload alloc] initWithDictionary:*(void *)(*((void *)&v115 + 1) + 8 * (void)j)];
              if ([(StoreDownload *)v51 itemIdentifier])
              {
                v52 = [(StoreDownload *)v51 bundleIdentifier];
                id v53 = [v52 length];

                if (v53)
                {
                  v54 = [(StoreDownload *)v51 bundleIdentifier];
                  v55 = +[NSNumber numberWithUnsignedLongLong:[(StoreDownload *)v51 itemIdentifier]];
                  [v11 setObject:v54 forKey:v55];
                }
              }
              if ([v88 length]) {
                [(StoreDownload *)v51 setPreferredAssetFlavor:v88];
              }
              [(NSMutableOrderedSet *)v10->_downloads addObject:v51];
            }
            id v22 = v49;
            id v47 = [v49 countByEnumeratingWithState:&v115 objects:v126 count:16];
          }
          while (v47);
        }

        id v9 = v85;
        id v8 = v86;
        v39 = v83;
      }
    }
    v56 = [v8 objectForKey:@"cancel-purchase-batch"];

    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v57 = [v56 BOOLValue];
    }
    else {
      unsigned __int8 v57 = 0;
    }
    v10->_shouldCancelPurchaseBatch = v57;
    v58 = [v8 objectForKey:@"appClusterAssignmentsResultSet"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v84 = v39;
      uint64_t v59 = objc_opt_new();
      clusterMappings = v10->_clusterMappings;
      v10->_clusterMappings = (NSMutableOrderedSet *)v59;

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      v82 = v58;
      id obj = v58;
      id v61 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v112;
        v94 = v11;
        uint64_t v87 = *(void *)v112;
        do
        {
          uint64_t v64 = 0;
          id v89 = v62;
          do
          {
            if (*(void *)v112 != v63) {
              objc_enumerationMutation(obj);
            }
            uint64_t v92 = v64;
            v65 = *(void **)(*((void *)&v111 + 1) + 8 * v64);
            v66 = objc_msgSend(v65, "objectForKeyedSubscript:", @"clusterVersionId", v82);
            v67 = [v65 objectForKeyedSubscript:@"appsClusterAssignments"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v109 = 0u;
              long long v110 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              v91 = v67;
              id v95 = v67;
              id v100 = [v95 countByEnumeratingWithState:&v107 objects:v124 count:16];
              if (v100)
              {
                uint64_t v98 = *(void *)v108;
                do
                {
                  uint64_t v68 = 0;
                  do
                  {
                    if (*(void *)v108 != v98) {
                      objc_enumerationMutation(v95);
                    }
                    uint64_t v102 = v68;
                    v69 = *(void **)(*((void *)&v107 + 1) + 8 * v68);
                    v70 = [v69 objectForKeyedSubscript:@"adamId"];
                    v71 = [v11 objectForKey:v70];
                    v72 = [v69 objectForKeyedSubscript:@"clusterAssignments"];
                    if (v71)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v105 = 0u;
                        long long v106 = 0u;
                        long long v103 = 0u;
                        long long v104 = 0u;
                        v96 = v72;
                        id v73 = v72;
                        id v74 = [v73 countByEnumeratingWithState:&v103 objects:v123 count:16];
                        if (v74)
                        {
                          id v75 = v74;
                          uint64_t v76 = *(void *)v104;
                          do
                          {
                            for (k = 0; k != v75; k = (char *)k + 1)
                            {
                              if (*(void *)v104 != v76) {
                                objc_enumerationMutation(v73);
                              }
                              v78 = [[AppClusterMapping alloc] initWithItemID:v70 bundleID:v71 clusterVersionID:v66 dictionary:*(void *)(*((void *)&v103 + 1) + 8 * (void)k)];
                              [(NSMutableOrderedSet *)v10->_clusterMappings addObject:v78];
                            }
                            id v75 = [v73 countByEnumeratingWithState:&v103 objects:v123 count:16];
                          }
                          while (v75);
                        }

                        v11 = v94;
                        v72 = v96;
                      }
                    }

                    uint64_t v68 = v102 + 1;
                  }
                  while ((id)(v102 + 1) != v100);
                  id v100 = [v95 countByEnumeratingWithState:&v107 objects:v124 count:16];
                }
                while (v100);
              }

              uint64_t v63 = v87;
              id v62 = v89;
              v67 = v91;
            }

            uint64_t v64 = v92 + 1;
          }
          while ((id)(v92 + 1) != v62);
          id v62 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
        }
        while (v62);
      }

      id v9 = v85;
      id v8 = v86;
      v58 = v82;
      v39 = v84;
    }
    id v79 = [objc_alloc((Class)SSDictionaryResponse) initWithResponseDictionary:v8];
    v80 = [v79 actionsWithActionType:SSResponseActionTypeCheckDownloadQueues];
    v10->_triggeredQueueCheck = [v80 count] != 0;
  }
  return v10;
}

- (StoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(StoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  v10 = (StoreDownloadQueueResponse *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 4, a3);
    v11 = (NSNumber *)[v8 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = v11;
  }
  return v10;
}

- (NSOrderedSet)downloads
{
  id v2 = [(NSMutableOrderedSet *)self->_downloads copy];

  return (NSOrderedSet *)v2;
}

- (NSError)error
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000178C0;
  v10 = sub_1000178D0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000178D8;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (id)errorForItemIdentifier:(id)a3
{
  return [(NSDictionary *)self->_itemErrors objectForKey:a3];
}

- (NSData)keybag
{
  return self->_keybag;
}

- (NSArray)rangesToLoad
{
  return self->_rangesToLoad;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001799C;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)setShouldCancelPurchaseBatch:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017A34;
  v4[3] = &unk_1003A3518;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setTriggeredQueueCheck:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017ABC;
  v4[3] = &unk_1003A3518;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)shouldCancelPurchaseBatch
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017B78;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)triggeredQueueCheck
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017C38;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSNumber)userIdentifier
{
  return self->_userIdentifier;
}

- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v5 intValue];
  }
  id v7 = SSError();

  return v7;
}

- (NSOrderedSet)clusterMappings
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  self->_storeCorrelationID = (NSString *)a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_itemErrors, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_clusterMappings, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id)copyJobManifestWithAccountID:(id)a3 accountName:(id)a4
{
  id v5 = [(StoreDownloadQueueResponse *)self _newManifestWithStoreDownloadQueueResponse:self accountID:a3 accountName:a4];
  id v6 = [(StoreDownloadQueueResponse *)self storeCorrelationID];
  [v5 setStoreCorrelationID:v6];

  return v5;
}

- (void)enumerateActivitiesWithAccountID:(id)a3 accountName:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v44 = (void (**)(id, id))a5;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v48 = self;
  id obj = [(StoreDownloadQueueResponse *)self downloads];
  id v10 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    id v45 = v8;
    id v47 = v9;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v14 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v13);
        v15 = objc_msgSend(v14, "kind", v42);
        int IsSoftwareKind = SSDownloadKindIsSoftwareKind();

        if (IsSoftwareKind)
        {
          id v17 = [v14 copyJobActivity];
          v18 = [v17 bundleID];
          id v19 = [v18 length];

          uint64_t v20 = +[SSLogConfig sharedDaemonConfig];
          v21 = v20;
          if (!v19)
          {
            if (!v20)
            {
              v21 = +[SSLogConfig sharedConfig];
            }
            unsigned int v36 = [v21 shouldLog];
            if ([v21 shouldLogToDisk]) {
              v36 |= 2u;
            }
            v37 = [v21 OSLogObject];
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
              v36 &= 2u;
            }
            if (v36)
            {
              v38 = objc_opt_class();
              int v53 = 138412546;
              v54 = v38;
              __int16 v55 = 2112;
              v56 = v14;
              id v39 = v38;
              LODWORD(v43) = 22;
              v42 = &v53;
              v40 = (void *)_os_log_send_and_compose_impl();

              id v9 = v47;
              if (!v40) {
                goto LABEL_44;
              }
              v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v53, v43);
              free(v40);
              v42 = (int *)v37;
              SSFileLog();
            }

            goto LABEL_44;
          }
          if (!v20)
          {
            v21 = +[SSLogConfig sharedConfig];
          }
          unsigned int v22 = [v21 shouldLog];
          if ([v21 shouldLogToDisk]) {
            v22 |= 2u;
          }
          id v23 = [v21 OSLogObject];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            int v24 = v22;
          }
          else {
            int v24 = v22 & 2;
          }
          if (v24)
          {
            id v25 = objc_opt_class();
            id v26 = v25;
            v27 = [v17 bundleID];
            int v53 = 138412546;
            v54 = v25;
            __int16 v55 = 2112;
            v56 = v27;
            LODWORD(v43) = 22;
            v42 = &v53;
            v28 = (void *)_os_log_send_and_compose_impl();

            id v8 = v45;
            id v9 = v47;

            if (v28)
            {
              id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v53, v43);
              free(v28);
              v42 = (int *)v23;
              SSFileLog();
              goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
          }
          v29 = [(StoreDownloadQueueResponse *)v48 clientIdentifier];
          [v17 setClientID:v29];

          [v17 setIsFromStore:1];
          if (v8) {
            [v17 setStoreAccountID:v8];
          }
          if (v9) {
            [v17 setStoreAccountName:v9];
          }
          v44[2](v44, v17);
          goto LABEL_45;
        }
        id v17 = +[SSLogConfig sharedDaemonConfig];
        if (!v17)
        {
          id v17 = +[SSLogConfig sharedConfig];
        }
        unsigned int v30 = [v17 shouldLog];
        if ([v17 shouldLogToDisk]) {
          v30 |= 2u;
        }
        v21 = [v17 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          int v31 = v30;
        }
        else {
          int v31 = v30 & 2;
        }
        if (!v31) {
          goto LABEL_44;
        }
        v32 = objc_opt_class();
        id v33 = v32;
        v34 = [v14 kind];
        int v53 = 138412546;
        v54 = v32;
        __int16 v55 = 2112;
        v56 = v34;
        LODWORD(v43) = 22;
        v42 = &v53;
        v35 = (void *)_os_log_send_and_compose_impl();

        if (v35)
        {
          v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v53, v43);
          free(v35);
          v42 = (int *)v21;
          SSFileLog();
          id v8 = v45;
          id v9 = v47;
LABEL_44:

          goto LABEL_45;
        }
        id v8 = v45;
        id v9 = v47;
LABEL_45:

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v41 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      id v11 = v41;
    }
    while (v41);
  }
}

- (id)_newManifestWithStoreDownloadQueueResponse:(id)a3 accountID:(id)a4 accountName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v44 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithManifestType:0];
  id v45 = v7;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = [v7 downloads];
  id v11 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v48;
    uint64_t v43 = *(void *)v48;
    v42 = v10;
    do
    {
      unsigned __int8 v14 = 0;
      id v46 = v12;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v14);
        uint64_t v16 = objc_msgSend(v15, "kind", v40);
        int IsSoftwareKind = SSDownloadKindIsSoftwareKind();

        if (IsSoftwareKind)
        {
          id v18 = [v15 copyJobActivity];
          id v19 = [v18 bundleID];
          id v20 = [v19 length];

          uint64_t v21 = +[SSLogConfig sharedDaemonConfig];
          unsigned int v22 = (void *)v21;
          if (v20)
          {
            if (!v21)
            {
              unsigned int v22 = +[SSLogConfig sharedConfig];
            }
            unsigned int v23 = [v22 shouldLog];
            if ([v22 shouldLogToDisk]) {
              v23 |= 2u;
            }
            int v24 = [v22 OSLogObject];
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              v23 &= 2u;
            }
            if (v23)
            {
              id v25 = objc_opt_class();
              id v26 = v9;
              id v27 = v8;
              id v28 = v25;
              v29 = [v18 bundleID];
              int v51 = 138412546;
              long long v52 = v25;
              __int16 v53 = 2112;
              v54 = v29;
              LODWORD(v41) = 22;
              v40 = &v51;
              unsigned int v30 = (void *)_os_log_send_and_compose_impl();

              uint64_t v13 = v43;
              id v8 = v27;
              id v9 = v26;
              id v10 = v42;

              if (v30)
              {
                int v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v51, v41);
                free(v30);
                v40 = (int *)v24;
                SSFileLog();
                goto LABEL_17;
              }
            }
            else
            {
LABEL_17:
            }
            int v31 = [v45 clientIdentifier];
            [v18 setClientID:v31];

            if (v8) {
              [v18 setStoreAccountID:v8];
            }
            id v12 = v46;
            if (v9) {
              [v18 setStoreAccountName:v9];
            }
            objc_msgSend(v18, "setIsFromStore:", 1, v40);
            id v32 = [v44 addActivity:v18];
LABEL_35:

            goto LABEL_36;
          }
          if (!v21)
          {
            unsigned int v22 = +[SSLogConfig sharedConfig];
          }
          unsigned int v33 = [v22 shouldLog];
          if ([v22 shouldLogToDisk]) {
            int v34 = v33 | 2;
          }
          else {
            int v34 = v33;
          }
          v35 = [v22 OSLogObject];
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            v34 &= 2u;
          }
          if (v34)
          {
            unsigned int v36 = objc_opt_class();
            int v51 = 138412546;
            long long v52 = v36;
            __int16 v53 = 2112;
            v54 = v15;
            id v37 = v36;
            LODWORD(v41) = 22;
            v40 = &v51;
            v38 = (void *)_os_log_send_and_compose_impl();

            uint64_t v13 = v43;
            if (v38)
            {
              v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v51, v41);
              free(v38);
              v40 = (int *)v35;
              SSFileLog();
              goto LABEL_33;
            }
          }
          else
          {
LABEL_33:
          }
          id v12 = v46;
          goto LABEL_35;
        }
LABEL_36:
        unsigned __int8 v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v12);
  }

  return v44;
}

@end