@interface BMDistributedSyncManager
- (BMDistributedSyncManager)initWithStreamConfiguration:(id)a3 streamCRDT:(id)a4 database:(id)a5 localSiteIdentifier:(id)a6 changeReporter:(id)a7;
- (BMStreamCKCRDT)streamCRDT;
- (BMStreamConfiguration)streamConfiguration;
- (BMSyncDatabase)db;
- (NSString)localSiteIdentifier;
- (id)atomBatchesForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6;
- (id)clockVector;
- (id)deletedLocations;
- (id)rangeClockVector;
- (void)mergeAtomBatch:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5;
- (void)updateClockVectorByUnionWithUnseenSiteIdentifiers:(id)a3;
@end

@implementation BMDistributedSyncManager

- (BMDistributedSyncManager)initWithStreamConfiguration:(id)a3 streamCRDT:(id)a4 database:(id)a5 localSiteIdentifier:(id)a6 changeReporter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMDistributedSyncManager;
  v18 = [(BMDistributedSyncManager *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamConfiguration, a3);
    objc_storeStrong((id *)&v19->_streamCRDT, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    v20 = (NSString *)[v16 copy];
    localSiteIdentifier = v19->_localSiteIdentifier;
    v19->_localSiteIdentifier = v20;

    objc_storeStrong((id *)&v19->_changeReporter, a7);
  }

  return v19;
}

- (void)updateClockVectorByUnionWithUnseenSiteIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  id v7 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v8 = [(NSString *)self->_localSiteIdentifier dataUsingEncoding:4];
  id v9 = [v7 initWithIdentifier:v8];

  v30 = v9;
  [v5 addObject:v9];
  db = self->_db;
  v11 = [(BMStreamConfiguration *)self->_streamConfiguration syncIdentifier];
  v12 = [(BMSyncDatabase *)db CKAtomRowSiteIdentifiersForStreamIdentifier:v11];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v17);
        id v19 = objc_alloc((Class)CKDistributedSiteIdentifier);
        v20 = [v18 dataUsingEncoding:4];
        id v21 = [v19 initWithIdentifier:v20];
        [v5 addObject:v21];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }

  v22 = [v4 allSiteIdentifiers];
  [v6 unionSet:v22];

  [v5 minusSet:v6];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v5;
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v27);
        v29 = sub_100006818(0);
        [v4 addClockValuesInIndexSet:v29 forSiteIdentifier:v28];

        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }
}

- (id)clockVector
{
  return [(BMStreamCKCRDT *)self->_streamCRDT clockVector];
}

- (id)rangeClockVector
{
  return [(BMStreamCKCRDT *)self->_streamCRDT rangeClockVector];
}

- (void)mergeAtomBatch:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = a5;
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "mergeAtomBatches: %lu deletedLocations: %@", buf, 0x16u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [(BMStreamCKCRDT *)self->_streamCRDT handleDeletedLocation:v15 deleteCKRecord:0];
        changeReporter = self->_changeReporter;
        v18 = [v15 streamName];
        id v19 = [v15 siteIdentifier];
        [(BMSyncChangeReporter *)changeReporter streamUpdatedForStreamName:v18 deviceIdentifier:v19 error:0];
      }
      id v12 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v12);
  }

  v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [(BMStreamConfiguration *)self->_streamConfiguration streamIdentifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Merging atom batches into %@", buf, 0xCu);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v36 = v8;
  id v22 = [v36 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    id v25 = &BMDevicePlatformFromModelString_ptr;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v36);
        }
        uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v26);
        id v29 = objc_alloc((Class)v25[249]);
        id v39 = 0;
        id v30 = [v29 initWithData:v27 error:&v39];
        id v31 = v39;
        if (v31) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v30 == 0;
        }
        if (v32)
        {
          long long v33 = __biome_log_for_category();
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v49 = 16;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002FF74;
          block[3] = &unk_10006CAC0;
          block[4] = buf;
          if (qword_100080340 != -1) {
            dispatch_once(&qword_100080340, block);
          }
          os_log_type_t v34 = *(unsigned char *)(*(void *)&buf[8] + 24);
          _Block_object_dispose(buf, 8);
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v27;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to instantiate CKAtomBatch, %@, %@", buf, 0x16u);
          }

          id v25 = &BMDevicePlatformFromModelString_ptr;
        }
        else
        {
          [(BMStreamCKCRDT *)self->_streamCRDT mergeAtomBatch:v30 sessionContext:v35];
        }

        uint64_t v26 = (char *)v26 + 1;
      }
      while (v23 != v26);
      id v23 = [v36 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v23);
  }
}

- (id)atomBatchesForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6
{
  uint64_t v6 = a4;
  id v9 = a5;
  id v10 = a3;
  [(BMDistributedSyncManager *)self updateClockVectorByUnionWithUnseenSiteIdentifiers:v10];
  id v11 = objc_opt_new();
  streamCRDT = self->_streamCRDT;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000300A0;
  v16[3] = &unk_10006D820;
  id v17 = v11;
  id v13 = v11;
  [(BMStreamCKCRDT *)streamCRDT atomsForChangesSinceClockVector:v10 ckFormatVersion:v6 chunker:v9 transportType:2 enumerateWithBlock:v16];

  id v14 = +[NSArray arrayWithArray:v13];

  return v14;
}

- (id)deletedLocations
{
  v3 = [(BMStreamConfiguration *)self->_streamConfiguration syncIdentifier];
  id v4 = [(BMSyncDatabase *)self->_db highestDeletedLocationsForStream:v3];

  return v4;
}

- (NSString)localSiteIdentifier
{
  return self->_localSiteIdentifier;
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeReporter, 0);
  objc_storeStrong((id *)&self->_localSiteIdentifier, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_streamCRDT, 0);

  objc_storeStrong((id *)&self->_streamConfiguration, 0);
}

@end