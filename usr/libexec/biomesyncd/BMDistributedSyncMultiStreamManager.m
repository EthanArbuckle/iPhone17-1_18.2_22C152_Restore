@interface BMDistributedSyncMultiStreamManager
+ (BMDistributedSyncMultiStreamManager)multiStreamManagerWithPrimaryDatabase:(id)a3 account:(id)a4 queue:(id)a5;
- (BMDistributedSyncMultiStreamManager)initWithDistributedSyncManagers:(id)a3 peerStatusTracker:(id)a4 accountDatabase:(id)a5;
- (BMSyncDevicePeerStatusTracker)peerStatusTracker;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5;
- (NSDictionary)distributedSyncManagers;
- (id)atomBatchesForChangesSinceClockVector:(id)a3 targetPlatform:(int64_t)a4 transportType:(unint64_t)a5 direction:(unint64_t)a6 ckFormatVersion:(unsigned __int8)a7 chunker:(id)a8;
- (id)clockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5;
- (id)deletedLocationsForTransportType:(unint64_t)a3;
- (id)rangeClockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5;
- (void)dealloc;
- (void)mergeAtomBatches:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5;
- (void)setMetricsCollector:(id)a3;
@end

@implementation BMDistributedSyncMultiStreamManager

+ (BMDistributedSyncMultiStreamManager)multiStreamManagerWithPrimaryDatabase:(id)a3 account:(id)a4 queue:(id)a5
{
  id v6 = a3;
  id v31 = a4;
  id v7 = v6;
  v29 = objc_opt_new();
  v25 = [[BMSyncDevicePeerStatusTracker alloc] initWithDatabase:v7];
  v28 = [(BMSyncDevicePeerStatusTracker *)v25 localDeviceIdentifierCreatingIfNecessary];
  v27 = [[BMSyncSessionMetricsCollector alloc] initWithDatabase:v7];
  v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = +[BMStreamSyncPolicy syncableStreamConfigurations];
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v13 = v31;
        id v14 = v7;
        v15 = [v12 streamIdentifier];
        unsigned int v16 = [&off_100072A18 containsObject:v15];

        if (v16)
        {

          id v13 = 0;
        }
        if (v7)
        {
          v17 = [BMStreamCKCRDT alloc];
          v18 = objc_opt_new();
          v19 = [(BMStreamCKCRDT *)v17 initWithStreamConfiguration:v12 locationAssignerPolicy:v18 localSiteIdentifier:v28 database:v14 changeReporter:v8 account:v13];

          [v19 setMetricsCollector:v27];
          v20 = [[BMDistributedSyncManager alloc] initWithStreamConfiguration:v12 streamCRDT:v19 database:v14 localSiteIdentifier:v28 changeReporter:v8];
          v21 = [v12 syncIdentifier];
          [v29 setObject:v20 forKeyedSubscript:v21];
        }
        else
        {
          v19 = __biome_log_for_category();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v22 = [v12 streamIdentifier];
            *(_DWORD *)buf = 138543362;
            v37 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Effective database for stream %{public}@ not available for current request", buf, 0xCu);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v10);
  }

  v23 = [[BMDistributedSyncMultiStreamManager alloc] initWithDistributedSyncManagers:v29 peerStatusTracker:v25 accountDatabase:0];
  [(BMDistributedSyncMultiStreamManager *)v23 setMetricsCollector:v27];

  return v23;
}

- (BMDistributedSyncMultiStreamManager)initWithDistributedSyncManagers:(id)a3 peerStatusTracker:(id)a4 accountDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMDistributedSyncMultiStreamManager;
  v11 = [(BMDistributedSyncMultiStreamManager *)&v15 init];
  if (v11)
  {
    v12 = (NSDictionary *)[v8 copy];
    distributedSyncManagers = v11->_distributedSyncManagers;
    v11->_distributedSyncManagers = v12;

    objc_storeStrong((id *)&v11->_peerStatusTracker, a4);
    objc_storeStrong((id *)&v11->_accountDatabase, a5);
  }

  return v11;
}

- (void)dealloc
{
  [(BMSyncDatabase *)self->_accountDatabase close];
  v3.receiver = self;
  v3.super_class = (Class)BMDistributedSyncMultiStreamManager;
  [(BMDistributedSyncMultiStreamManager *)&v3 dealloc];
}

- (id)clockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5
{
  id v25 = a5;
  v27 = self;
  id v28 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(NSDictionary *)self->_distributedSyncManagers allValues];
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    unint64_t v26 = a3;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = [v12 streamConfiguration];
        id v14 = [v13 syncPolicy];
        unsigned __int8 v15 = [v14 supportsTransport:a3 direction:a4];

        if (v15)
        {
          unsigned int v16 = [v12 clockVector];
          if (![v16 timestampCount])
          {
            v17 = [(BMSyncDevicePeerStatusTracker *)v27->_peerStatusTracker localDeviceIdentifierCreatingIfNecessary];
            v18 = [v17 dataUsingEncoding:4];
            unint64_t v19 = a4;
            id v20 = [objc_alloc((Class)CKDistributedSiteIdentifier) initWithIdentifier:v18];
            v21 = +[NSIndexSet indexSetWithIndex:0];
            [v16 addClockValuesInIndexSet:v21 forSiteIdentifier:v20];

            a4 = v19;
            a3 = v26;
          }
          v22 = [v12 streamConfiguration];
          v23 = [v22 syncIdentifierForTransport:a3];

          [v28 setVectorClockTo:v16 forStreamIdentifier:v23];
        }
        else
        {
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  return v28;
}

- (id)rangeClockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5
{
  id v25 = a5;
  v27 = self;
  id v28 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(NSDictionary *)self->_distributedSyncManagers allValues];
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    unint64_t v26 = a3;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = [v12 streamConfiguration];
        id v14 = [v13 syncPolicy];
        unsigned __int8 v15 = [v14 supportsTransport:a3 direction:a4];

        if (v15)
        {
          unsigned int v16 = [v12 rangeClockVector];
          if (![v16 timestampCount])
          {
            v17 = [(BMSyncDevicePeerStatusTracker *)v27->_peerStatusTracker localDeviceIdentifierCreatingIfNecessary];
            v18 = [v17 dataUsingEncoding:4];
            unint64_t v19 = a4;
            id v20 = [objc_alloc((Class)CKDistributedSiteIdentifier) initWithIdentifier:v18];
            v21 = +[NSIndexSet indexSetWithIndex:0];
            [v16 addClockValuesInIndexSet:v21 forSiteIdentifier:v20];

            a4 = v19;
            a3 = v26;
          }
          v22 = [v12 streamConfiguration];
          v23 = [v22 syncIdentifierForTransport:a3];

          [v28 setVectorClockTo:v16 forStreamIdentifier:v23];
        }
        else
        {
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  return v28;
}

- (id)atomBatchesForChangesSinceClockVector:(id)a3 targetPlatform:(int64_t)a4 transportType:(unint64_t)a5 direction:(unint64_t)a6 ckFormatVersion:(unsigned __int8)a7 chunker:(id)a8
{
  unsigned int v33 = a7;
  id v36 = a3;
  id v35 = a8;
  unint64_t v13 = a6;
  if (a6 != 2)
  {
    long long v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"BMDistributedSyncMultiStreamManager.m", 177, @"Invalid parameter not satisfying: %@", @"direction == BMResourceSyncDirectionOutbound" object file lineNumber description];
  }
  id v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v15 = BMDevicePlatformGetDescription();
    unsigned int v16 = +[NSNumber numberWithUnsignedChar:v33];
    v17 = [v36 description];
    *(_DWORD *)buf = 138412802;
    v45 = v15;
    __int16 v46 = 2112;
    v47 = v16;
    __int16 v48 = 2112;
    v49 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "atomBatchesForChangesSinceClockVector platform: %@, version: %@, clock: %@", buf, 0x20u);
  }
  id v34 = (id)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(NSDictionary *)self->_distributedSyncManagers allValues];
  id v18 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v24 = [v22 streamConfiguration];
        id v25 = [v24 syncPolicy];
        unsigned int v26 = [v25 supportsSyncingWithPlatform:a4 overTransport:a5 inDirection:v13];

        if (v26)
        {
          v27 = [v22 streamConfiguration];
          id v28 = [v27 syncIdentifierForTransport:a5];

          v29 = [v36 timestampClockVectorForStreamIdentifier:v28];
          long long v30 = [v22 atomBatchesForChangesSinceClockVector:v29 ckFormatVersion:v33 chunker:v35 transportType:a5];
          [v34 setObject:v30 forKeyedSubscript:v28];
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v19);
  }

  return v34;
}

- (void)mergeAtomBatches:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v7 = a3;
  id v27 = a4;
  id v26 = a5;
  id v28 = v7;
  id v8 = [v7 allKeys];
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v42 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Merging %llu atom batches", buf, 0xCu);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  id v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v10);
        distributedSyncManagers = self->_distributedSyncManagers;
        unint64_t v13 = [v11 lastPathComponent];
        id v14 = [(NSDictionary *)distributedSyncManagers objectForKeyedSubscript:v13];

        unsigned __int8 v15 = [v28 objectForKeyedSubscript:v11];
        unsigned int v16 = objc_opt_new();
        v17 = [v27 objectForKeyedSubscript:v11];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v32;
          do
          {
            v21 = 0;
            do
            {
              if (*(void *)v32 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = [[BMStreamCRDTLocation alloc] initFromDictionary:*(void *)(*((void *)&v31 + 1) + 8 * (void)v21)];
              [v16 addObject:v22];

              v21 = (char *)v21 + 1;
            }
            while (v19 != v21);
            id v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v19);
        }
        [v14 mergeAtomBatch:v15 deletedLocations:v16 sessionContext:v26];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v29);
      id v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }
}

- (id)deletedLocationsForTransportType:(unint64_t)a3
{
  id v23 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(NSDictionary *)self->_distributedSyncManagers allValues];
  id v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v9 = [v7 streamConfiguration];
        uint64_t v10 = [v9 syncIdentifierForTransport:a3];

        v11 = objc_opt_new();
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v12 = [v7 deletedLocations];
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) dictionaryRepresentation];
              [v11 addObject:v17];
            }
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        id v18 = +[NSArray arrayWithArray:v11];
        [v23 setObject:v18 forKeyedSubscript:v10];
      }
      id v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }

  return v23;
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = self->_distributedSyncManagers;
  id v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [(NSDictionary *)self->_distributedSyncManagers objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        id v13 = [v12 streamConfiguration];
        id v14 = [v13 syncPolicy];
        unsigned __int8 v15 = [v14 supportsSyncingWithPlatform:a3 overTransport:a4 inDirection:a5];

        if (v15)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (NSDictionary)distributedSyncManagers
{
  return self->_distributedSyncManagers;
}

- (BMSyncDevicePeerStatusTracker)peerStatusTracker
{
  return self->_peerStatusTracker;
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_distributedSyncManagers, 0);

  objc_storeStrong((id *)&self->_accountDatabase, 0);
}

@end