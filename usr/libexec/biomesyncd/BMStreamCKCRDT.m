@interface BMStreamCKCRDT
- (BMStreamCKCRDT)initWithStreamConfiguration:(id)a3 locationAssignerPolicy:(id)a4 localSiteIdentifier:(id)a5 database:(id)a6 changeReporter:(id)a7 account:(id)a8;
- (BMStreamConfiguration)streamConfiguration;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)addAtomToAtomBatch:(id)a3 ifChunkerAllows:(id)a4 fromAtomTableRecord:(id)a5 atomValueData:(id)a6 version:(unsigned __int8)a7 atomValueVersion:(int64_t)a8;
- (BOOL)deleteAtOrBeforeHighestDeletedLocation:(id)a3;
- (BOOL)deleteLocationsUpToTTLAtTombstone:(id)a3 siteIdentifier:(id)a4;
- (BOOL)deletedExpiredBufferedLocationsForSiteIdentifier:(id)a3;
- (BOOL)handleDeleteAtomRow:(id)a3 usingPruner:(id)a4 outBookmark:(id *)a5 outTombstoneBookmark:(id *)a6;
- (BOOL)writeAtomValue:(id)a3 fromAtomRow:(id)a4 usingWriter:(id)a5 outBookmark:(id *)a6;
- (id)atomValueFromEvent:(id)a3 ofType:(unint64_t)a4 version:(int64_t)a5;
- (id)bookmarkForAtomRow:(id)a3;
- (id)ckAtomTableRecordForEvent:(id)a3 ofType:(unint64_t)a4 atBookmark:(id)a5 previousTableRecord:(id)a6 siteIdentifier:(id)a7;
- (id)clockVector;
- (id)newEnumeratorStartingAfterBookmark:(id)a3 reader:(id)a4;
- (id)rangeClockVector;
- (id)readerForSiteIdentifier:(id)a3;
- (id)tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:(id)a3 fromDatastore:(id)a4;
- (void)addAtomWithValueData:(id)a3 toAtomBatch:(id)a4 fromAtomTableRecord:(id)a5 version:(unsigned __int8)a6 atomValueVersion:(int64_t)a7;
- (void)atomsForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6 enumerateWithBlock:(id)a7;
- (void)handleDeletedLocation:(id)a3 deleteCKRecord:(BOOL)a4;
- (void)ingestNewChangesForSite:(id)a3 transportType:(unint64_t)a4;
- (void)ingestNewChangesFromAllSitesInVectorClock:(id)a3 transportType:(unint64_t)a4;
- (void)mergeAtomBatch:(id)a3 sessionContext:(id)a4;
- (void)mergeAtomBatches:(id)a3 sessionContext:(id)a4 forLocation:(id)a5;
- (void)populateAtomBatch:(id)a3 withAtomsInClockVector:(id)a4 forLocation:(id)a5 ckFormatVersion:(unsigned __int8)a6 valueVersion:(int64_t)a7 chunker:(id)a8;
- (void)setMetricsCollector:(id)a3;
- (void)setStreamConfiguration:(id)a3;
@end

@implementation BMStreamCKCRDT

- (BMStreamCKCRDT)initWithStreamConfiguration:(id)a3 locationAssignerPolicy:(id)a4 localSiteIdentifier:(id)a5 database:(id)a6 changeReporter:(id)a7 account:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v36 = a7;
  id v19 = a8;
  if (v15)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, self, @"BMStreamCKCRDT.m", 55, @"Invalid parameter not satisfying: %@", @"streamConfiguration" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v34 = +[NSAssertionHandler currentHandler];
  [v34 handleFailureInMethod:a2, self, @"BMStreamCKCRDT.m", 56, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

LABEL_3:
  v37.receiver = self;
  v37.super_class = (Class)BMStreamCKCRDT;
  v20 = [(BMStreamCKCRDT *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_streamConfiguration, a3);
    uint64_t v22 = [v15 syncIdentifier];
    syncIdentifier = v21->_syncIdentifier;
    v21->_syncIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 streamIdentifier];
    streamIdentifier = v21->_streamIdentifier;
    v21->_streamIdentifier = (NSString *)v24;

    v26 = (NSString *)[v17 copy];
    localSiteIdentifier = v21->_localSiteIdentifier;
    v21->_localSiteIdentifier = v26;

    objc_storeStrong((id *)&v21->_db, a6);
    v28 = [[BMStreamCRDTLocationBuilder alloc] initWithAssignerPolicy:v16];
    locationBuilder = v21->_locationBuilder;
    v21->_locationBuilder = v28;

    uint64_t v30 = objc_opt_new();
    locationRowCache = v21->_locationRowCache;
    v21->_locationRowCache = (NSCache *)v30;

    objc_storeStrong((id *)&v21->_changeReporter, a7);
    objc_storeStrong((id *)&v21->_account, a8);
  }

  return v21;
}

- (id)bookmarkForAtomRow:(id)a3
{
  id v4 = a3;
  v5 = [v4 segmentName];

  if (v5)
  {
    id v6 = objc_alloc((Class)BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    v8 = [v4 segmentName];
    id v9 = [v6 initWithStream:streamIdentifier segment:v8 iterationStartTime:objc_msgSend(v4, "segmentOffset") offset:1.79769313e308];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)newEnumeratorStartingAfterBookmark:(id)a3 reader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v17 = 0;
    id v8 = [v6 newEnumeratorFromBookmark:v5 options:7 error:&v17];
    id v9 = v17;
    if (v8)
    {
      id v10 = [v8 nextEvent];
    }
    else if (BMStorageErrorGetErrno() == 2)
    {
      v11 = [v5 segmentName];
      [v7 timestampFromSegmentName:v11];
      double v13 = v12;
      v14 = +[NSDate distantFuture];
      [v14 timeIntervalSinceReferenceDate];
      id v8 = [v7 newEnumeratorFromStartTime:-1 endTime:-1 maxEvents:7 lastN:v13 options:v15];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [v6 newEnumeratorFromStartTime:7 options:0.0];
  }

  return v8;
}

- (id)ckAtomTableRecordForEvent:(id)a3 ofType:(unint64_t)a4 atBookmark:(id)a5 previousTableRecord:(id)a6 siteIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(NSString *)self->_localSiteIdentifier dataUsingEncoding:4];
  id v17 = [objc_alloc((Class)CKDistributedSiteIdentifier) initWithIdentifier:v16];
  id v18 = [(BMSyncDatabase *)self->_db latestDistributedTimestampForSiteIdentifier:self->_localSiteIdentifier inStream:self->_syncIdentifier];
  if (!v18) {
    id v18 = [objc_alloc((Class)CKDistributedTimestamp) initWithSiteIdentifierObject:v17 clockValue:0];
  }
  id v65 = v17;
  id v19 = objc_alloc((Class)CKDistributedTimestamp);
  v20 = (char *)[v18 clockValue] + 1;
  v21 = v19;
  uint64_t v22 = v65;
  id v23 = [v21 initWithSiteIdentifierObject:v65 clockValue:v20];
  if (a4 != 2)
  {
    if (!a4)
    {
      v59 = v16;
      locationBuilder = self->_locationBuilder;
      syncIdentifier = self->_syncIdentifier;
      [v12 timestamp];
      v26 = -[BMStreamCRDTLocationBuilder locationWithStreamName:siteIdentifier:timestamp:](locationBuilder, "locationWithStreamName:siteIdentifier:timestamp:", syncIdentifier, v15);
      v27 = [(NSCache *)self->_locationRowCache objectForKey:v26];
      if (!v27)
      {
        v27 = [(BMSyncDatabase *)self->_db insertLocationIfNotExists:v26 withState:2];
        [(NSCache *)self->_locationRowCache setObject:v27 forKey:v26];
      }
      id v57 = v15;
      id v61 = v12;
      id v63 = v23;
      if (v14)
      {
        v28 = [v14 location];
        v29 = [v28 location];
        [v29 ckMergeableValueIDWithFormatVersion:0];
        v31 = uint64_t v30 = v14;

        id v32 = objc_alloc((Class)CKAtomReference);
        v33 = [v30 timestamp];
        id v34 = [v32 initWithMergeableValueID:v31 timestamp:v33 type:0];
      }
      else
      {
        id v34 = 0;
        uint64_t v30 = 0;
      }
      objc_super v37 = [BMSyncCKAtomRow alloc];
      v38 = [v30 location];
      v39 = [v13 segmentName];
      id v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v37, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v27, v63, v38, v34, 0, v39, [v13 offset]);

      id v23 = v63;
      id v16 = v59;
      id v12 = v61;
      id v14 = v30;
      id v15 = v57;
LABEL_14:
      uint64_t v22 = v65;
      goto LABEL_15;
    }
LABEL_11:
    id v36 = 0;
    goto LABEL_15;
  }
  v35 = [(BMSyncDatabase *)self->_db ckAtomRowForAtomWithBookmark:v13 type:2 forSiteIdentifier:self->_localSiteIdentifier inStream:self->_syncIdentifier];
  if (v35)
  {

    goto LABEL_11;
  }
  id v64 = v23;
  v41 = [(BMSyncDatabase *)self->_db ckAtomRowForAtomWithBookmark:v13 type:0 forSiteIdentifier:v15 inStream:self->_syncIdentifier];
  if (v41)
  {
    v42 = v41;
    v43 = [v41 location];
    v44 = [v43 location];
    v58 = [v44 ckMergeableValueIDWithFormatVersion:0];

    id v45 = objc_alloc((Class)CKAtomReference);
    v46 = [v42 timestamp];
    id v56 = [v45 initWithMergeableValueID:v58 timestamp:v46 type:0];

    v47 = [BMSyncCKAtomRow alloc];
    v48 = [v42 location];
    [v42 location];
    v49 = id v62 = v12;
    [v13 segmentName];
    v60 = v16;
    v51 = id v50 = v14;
    id v23 = v64;
    id v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v47, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v48, v64, v49, v56, 2, v51, [v13 offset]);

    id v14 = v50;
    id v16 = v60;

    id v12 = v62;
    uint64_t v22 = v65;
  }
  else
  {
    db = self->_db;
    v53 = [v13 segmentName];
    LODWORD(db) = [(BMSyncDatabase *)db containsCKAtomRowWithSegment:v53 inStream:self->_syncIdentifier];

    if (db)
    {
      v54 = __biome_log_for_category();
      *(void *)buf = 0;
      v68 = buf;
      uint64_t v69 = 0x2020000000;
      char v70 = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013394;
      block[3] = &unk_10006CAC0;
      block[4] = buf;
      id v23 = v64;
      if (qword_1000802D8 != -1) {
        dispatch_once(&qword_1000802D8, block);
      }
      os_log_type_t v55 = v68[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v54, v55))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "delete must reference a corresponding append", buf, 2u);
      }

      id v36 = 0;
      goto LABEL_14;
    }
    id v36 = 0;
    id v23 = v64;
  }
LABEL_15:

  return v36;
}

- (id)atomValueFromEvent:(id)a3 ofType:(unint64_t)a4 version:(int64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = [v7 frame];
  if ([v9 state] == 3) {
    goto LABEL_3;
  }
  id v10 = [v8 frame];
  unsigned int v11 = [v10 state];

  if (v11 == 2) {
    goto LABEL_5;
  }
  id v19 = [v8 frame];
  id v12 = [v19 data];

  if (!v12)
  {
    id v9 = __biome_log_for_category();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x2020000000;
    char v31 = 16;
    block = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100013670;
    v27 = &unk_10006CAC0;
    p_long long buf = &buf;
    if (qword_1000802E0 != -1) {
      dispatch_once(&qword_1000802E0, &block);
    }
    os_log_type_t v20 = *(unsigned char *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v9, v20))
    {
      v21 = [v8 frame];
      unsigned int v22 = [v21 state];
      if (v22 >= 6)
      {
        id v23 = +[NSString stringWithFormat:@"BMFrameStateUnknown(%lu)", v22, block, v25, v26, v27, p_buf, (void)buf];
      }
      else
      {
        id v23 = off_10006D138[v22];
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v9, v20, "Expected no-data frame to be delete or pre-delete, but frame was %{public}@", (uint8_t *)&buf, 0xCu);
    }
LABEL_3:

LABEL_5:
    id v12 = 0;
  }
  id v13 = [BMStoreEventAtomValue alloc];
  id v14 = [v8 frame];
  id v15 = [v14 dataVersion];
  [v8 timestamp];
  id v16 = -[BMStoreEventAtomValue initWithEventData:dataVersion:dataTimestamp:](v13, "initWithEventData:dataVersion:dataTimestamp:", v12, v15);

  id v17 = [[BMSyncAtomValue alloc] initWithAtomType:a4 value:v16 version:a5];

  return v17;
}

- (BOOL)handleDeleteAtomRow:(id)a3 usingPruner:(id)a4 outBookmark:(id *)a5 outTombstoneBookmark:(id *)a6
{
  id v10 = a4;
  unsigned int v11 = [a3 causalReference];
  id v12 = [v11 timestamp];

  id v13 = [(BMSyncDatabase *)self->_db ckAtomRowWithTimestamp:v12 inStream:self->_syncIdentifier];
  if ([v13 type])
  {
    id v14 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v29 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013980;
    block[3] = &unk_10006CAC0;
    block[4] = buf;
    if (qword_1000802E8 != -1) {
      dispatch_once(&qword_1000802E8, block);
    }
    os_log_type_t v15 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = [v13 type];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "appendRecord %@ is of unexpected type %lu", buf, 0x16u);
    }
  }
  id v17 = [(BMStreamCKCRDT *)self bookmarkForAtomRow:v13];
  id v18 = v17;
  if (!v17
    || ([v17 segmentName],
        id v19 = objc_claimAutoreleasedReturnValue(),
        unsigned int v20 = [v19 isEqual:@"DOA"],
        v19,
        v20))
  {
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@", buf, 0xCu);
    }

    if (!a5) {
      goto LABEL_19;
    }
    id v22 = 0;
LABEL_18:
    *a5 = v22;
LABEL_19:
    BOOL v25 = 1;
    goto LABEL_20;
  }
  id v23 = __biome_log_for_category();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
  }

  unsigned int v24 = [v10 deleteEventAtBookmark:v18 outTombstoneBookmark:a6];
  BOOL v25 = v24;
  if (a5 && v24)
  {
    id v22 = v18;
    goto LABEL_18;
  }
LABEL_20:

  return v25;
}

- (BOOL)writeAtomValue:(id)a3 fromAtomRow:(id)a4 usingWriter:(id)a5 outBookmark:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [a3 value];
  id v12 = [v11 eventData];

  if (v12)
  {
    id v13 = [v11 eventData];
    id v14 = [v11 dataVersion];
    [v11 dataTimestamp];
    if (Current == 0.0) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    unsigned __int8 v16 = [v10 _writeEventData:v13 dataVersion:v14 timestamp:a6 outBookmark:Current];
  }
  else
  {
    id v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v9 timestamp];
      id v19 = [v18 bm_description];
      int v21 = 138412290;
      id v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Dropping atom %@ because it is dead on arrival", (uint8_t *)&v21, 0xCu);
    }
    unsigned __int8 v16 = 1;
  }

  return v16;
}

- (BOOL)addAtomToAtomBatch:(id)a3 ifChunkerAllows:(id)a4 fromAtomTableRecord:(id)a5 atomValueData:(id)a6 version:(unsigned __int8)a7 atomValueVersion:(int64_t)a8
{
  uint64_t v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v15) {
    unsigned __int8 v18 = [v15 canAddAtomWithData:v17];
  }
  else {
    unsigned __int8 v18 = 1;
  }
  [(BMStreamCKCRDT *)self addAtomWithValueData:v17 toAtomBatch:v14 fromAtomTableRecord:v16 version:v9 atomValueVersion:a8];
  [v15 didAddAtomWithData:v17];

  return v18;
}

- (void)addAtomWithValueData:(id)a3 toAtomBatch:(id)a4 fromAtomTableRecord:(id)a5 version:(unsigned __int8)a6 atomValueVersion:(int64_t)a7
{
  unsigned int v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100044E94();
  }

  if (v8 > 2)
  {
    id v15 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    id v16 = sub_100014114;
  }
  else
  {
    id v15 = v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    id v16 = sub_100013D28;
  }
  v15[2] = v16;
  v15[3] = &unk_10006CFD8;
  v15[4] = v13;
  v15[5] = v11;
  v15[6] = a7;
  id v17 = v11;
  id v18 = v13;
  [v12 appendAtomWithBlock:v15];
}

- (id)readerForSiteIdentifier:(id)a3
{
  localSiteIdentifier = self->_localSiteIdentifier;
  id v5 = a3;
  if ([v5 isEqual:localSiteIdentifier]) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  streamConfiguration = self->_streamConfiguration;
  id v8 = v6;
  uint64_t v9 = [(BMStreamConfiguration *)streamConfiguration storeConfig];
  id v10 = [v9 copyWithRemoteName:v8];

  id v11 = objc_alloc((Class)BMStreamDatastore);
  streamIdentifier = self->_streamIdentifier;
  id v13 = [(BMStreamConfiguration *)self->_streamConfiguration eventClass];
  id v14 = [v11 initWithStream:streamIdentifier permission:0 config:v10 includeTombstones:1 eventDataClass:v13 useCase:BMUseCaseSync];

  return v14;
}

- (void)ingestNewChangesFromAllSitesInVectorClock:(id)a3 transportType:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v16 = a3;
  id v6 = [v16 allSiteIdentifiers];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        id v13 = objc_alloc((Class)NSString);
        id v14 = [v11 identifier];
        id v15 = [v13 initWithData:v14 encoding:4];

        [(BMStreamCKCRDT *)self ingestNewChangesForSite:v15 transportType:a4];
        [(NSCache *)self->_locationRowCache removeAllObjects];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:(id)a3 fromDatastore:(id)a4
{
  id v6 = a4;
  id v24 = 0;
  uint64_t v25 = 0;
  unsigned int v7 = [(BMSyncDatabase *)self->_db getLatestTombstoneBookmarkForSiteIdentifier:a3 inStream:self->_syncIdentifier segmentName:&v24 segmentOffset:&v25];
  id v8 = v24;
  if (v7)
  {
    id v9 = objc_alloc((Class)BMStoreBookmark);
    id v10 = [v9 initWithStream:self->_streamIdentifier segment:v8 iterationStartTime:v25 offset:1.79769313e308];
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 segmentName];
      id v13 = [v10 offset];
      streamIdentifier = self->_streamIdentifier;
      id v15 = [v6 config];
      id v16 = [v15 remoteName];
      *(_DWORD *)long long buf = 138413058;
      v27 = v12;
      __int16 v28 = 2048;
      id v29 = v13;
      __int16 v30 = 2112;
      char v31 = streamIdentifier;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting tombstone enumerator from segment %@ offset %lu for stream %@ site %@", buf, 0x2Au);
    }
    id v17 = [v6 newTombstoneEnumeratorFromBookmark:v10];
    id v18 = [v17 nextEvent];
  }
  else
  {
    long long v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = self->_streamIdentifier;
      int v21 = [v6 config];
      id v22 = [v21 remoteName];
      *(_DWORD *)long long buf = 138412546;
      v27 = v20;
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting tombstone enumerator from 0 for stream %@ site %@", buf, 0x16u);
    }
    id v17 = [v6 newTombstoneEnumeratorFromStartTime:0.0];
  }

  return v17;
}

- (void)ingestNewChangesForSite:(id)a3 transportType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ingestChangesForSite: %@", (uint8_t *)&buf, 0xCu);
  }

  unsigned int v7 = [(BMStreamCKCRDT *)self readerForSiteIdentifier:v5];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000;
  v58 = sub_100014F10;
  v59 = sub_100014F20;
  id v60 = [(BMSyncDatabase *)self->_db latestCKAtomRowOfType:0 forSiteIdentifier:v5 inStream:self->_syncIdentifier];
  id v8 = [(BMStreamCKCRDT *)self bookmarkForAtomRow:*(void *)(*((void *)&buf + 1) + 40)];
  id v9 = [(BMStreamCKCRDT *)self newEnumeratorStartingAfterBookmark:v8 reader:v7];

  id v10 = [[BMSyncDatabaseTransactionBatcher alloc] initWithDatabase:self->_db transcationBatchSize:100];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100014F10;
  v49 = sub_100014F20;
  id v50 = [v9 nextEvent];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100014F10;
  v43 = sub_100014F20;
  id v44 = 0;
  if (v46[5] && ([v5 isEqualToString:self->_localSiteIdentifier] & 1) == 0)
  {
    id v13 = __biome_log_for_category();
    *(void *)&long long v51 = 0;
    *((void *)&v51 + 1) = &v51;
    uint64_t v52 = 0x2020000000;
    LOBYTE(v53) = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014F28;
    block[3] = &unk_10006CAC0;
    block[4] = &v51;
    if (qword_1000802F0 != -1) {
      dispatch_once(&qword_1000802F0, block);
    }
    os_log_type_t v14 = *(unsigned char *)(*((void *)&v51 + 1) + 24);
    _Block_object_dispose(&v51, 8);
    if (os_log_type_enabled(v13, v14))
    {
      LODWORD(v51) = 138412290;
      *(void *)((char *)&v51 + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "observed new data from non-local site %@", (uint8_t *)&v51, 0xCu);
    }
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100014F3C;
    v32[3] = &unk_10006D000;
    v35 = &v45;
    p_long long buf = &buf;
    v32[4] = self;
    id v33 = v5;
    objc_super v37 = &v39;
    id v34 = v9;
    unsigned __int8 v11 = [(BMSyncDatabaseTransactionBatcher *)v10 executeOperationWithBlock:v32];

    if ((v11 & 1) == 0)
    {
      id v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100044F3C();
      }
      goto LABEL_19;
    }
  }
  id v15 = (void *)v40[5];
  v40[5] = 0;

  id v16 = [(BMStreamCKCRDT *)self tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:v5 fromDatastore:v7];
  *(void *)&long long v51 = 0;
  *((void *)&v51 + 1) = &v51;
  uint64_t v52 = 0x3032000000;
  v53 = sub_100014F10;
  v54 = sub_100014F20;
  id v55 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100014F10;
  __int16 v30 = sub_100014F20;
  id v31 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015380;
  v19[3] = &unk_10006D028;
  id v12 = v16;
  long long v20 = v12;
  int v21 = self;
  id v23 = &v26;
  id v24 = &v51;
  id v17 = v5;
  id v22 = v17;
  uint64_t v25 = &v39;
  if ([(BMSyncDatabaseTransactionBatcher *)v10 executeOperationWithBlock:v19])
  {
    [(BMSyncDatabase *)self->_db saveLatestTombstoneBookmark:v27[5] forSiteIdentifier:v17 inStream:self->_syncIdentifier];
    [(BMStreamCKCRDT *)self deleteLocationsUpToTTLAtTombstone:*(void *)(*((void *)&v51 + 1) + 40) siteIdentifier:v17];
    [(BMStreamCKCRDT *)self deletedExpiredBufferedLocationsForSiteIdentifier:v17];
  }
  else
  {
    id v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100044F08();
    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v51, 8);
LABEL_19:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)deleteLocationsUpToTTLAtTombstone:(id)a3 siteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deleteLocationsUpToTTLAtTombstone: %@, siteIdentifier: %@", (uint8_t *)&v18, 0x16u);
    }

    id v9 = objc_alloc((Class)BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    unsigned __int8 v11 = [v6 segmentName];
    id v12 = [v9 initWithStream:v11 segment:v6 offset:1.79769313e308];

    id v13 = [v6 segmentName];
    os_log_type_t v14 = [(BMStreamConfiguration *)self->_streamConfiguration storeConfig];
    LODWORD(streamIdentifier) = +[BMFrameStore getSegmentVersion:v13 config:v14 stream:self->_streamIdentifier];

    id v15 = [(BMSyncDatabase *)self->_db computeHighestLocationToDeleteUpToBookmark:v12 forSiteIdentifier:v7 inStream:self->_syncIdentifier offsetsIncrease:streamIdentifier == 9];
    if (v15) {
      BOOL v16 = [(BMStreamCKCRDT *)self deleteAtOrBeforeHighestDeletedLocation:v15];
    }
    else {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)deletedExpiredBufferedLocationsForSiteIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deletedExpiredBufferedLocationsForSiteIdentifier: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(BMSyncDatabase *)self->_db highestLocationWithBufferedAtomsOlderThan:v4 forSiteIdentifier:self->_syncIdentifier inStream:CFAbsoluteTimeGetCurrent() + -2419200.0];
  if (v6) {
    BOOL v7 = [(BMStreamCKCRDT *)self deleteAtOrBeforeHighestDeletedLocation:v6];
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)deleteAtOrBeforeHighestDeletedLocation:(id)a3
{
  id v4 = a3;
  [(BMSyncDatabase *)self->_db updateAllLocationsAtOrBefore:v4 state:3];
  db = self->_db;
  id v6 = [v4 location];
  [(BMSyncDatabase *)db updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:v6];

  BOOL v7 = [(BMSyncDatabase *)self->_db deleteAllAtomsAtOrBeforeLocation:v4];
  if (v7)
  {
    [(BMSyncDatabase *)self->_db updateAllLocationsAtOrBefore:v4 state:4];
    id v8 = self->_db;
    int v9 = [v4 location];
    [(BMSyncDatabase *)v8 markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:v9];

    [(BMSyncDatabase *)self->_db removeAllDeletedLocationsBeforeHighestDeletedLocation:v4];
  }
  else
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100044F70();
    }
  }
  return v7;
}

- (void)populateAtomBatch:(id)a3 withAtomsInClockVector:(id)a4 forLocation:(id)a5 ckFormatVersion:(unsigned __int8)a6 valueVersion:(int64_t)a7 chunker:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_opt_new();
  int v18 = objc_opt_new();
  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100015D90;
  v29[3] = &unk_10006D050;
  id v21 = v17;
  id v30 = v21;
  id v31 = self;
  id v22 = v18;
  id v32 = v22;
  int64_t v35 = a7;
  id v23 = v13;
  id v33 = v23;
  id v24 = v14;
  id v34 = v24;
  unsigned __int8 v36 = a6;
  [(BMSyncDatabase *)db atomRowsInTimestampClockVector:v16 forLocation:v15 inStream:syncIdentifier enumerateWithBlock:v29];

  id v28 = 0;
  [v23 finishWritingWithError:&v28];
  id v25 = v28;
  if (v25)
  {
    uint64_t v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100044FD8();
    }
  }
  [v24 setMoreComing:[v24 moreComing]];
}

- (void)atomsForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6 enumerateWithBlock:(id)a7
{
  unsigned int v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  [(BMStreamCKCRDT *)self ingestNewChangesFromAllSitesInVectorClock:v12 transportType:a6];
  id v16 = [(BMStreamCKCRDT *)self rangeClockVector];
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1000450B4();
  }

  [v16 minusVector:v12];
  id v18 = v16;
  id v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    streamIdentifier = self->_streamIdentifier;
    *(_DWORD *)long long buf = 138412802;
    id v37 = v18;
    __int16 v38 = 2048;
    uint64_t v39 = (NSString *)v10;
    __int16 v40 = 2112;
    uint64_t v41 = streamIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "generating atom batch with timestamps to fill for clock: %@, version: %lu, stream: %@", buf, 0x20u);
  }

  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  id v35 = 0;
  id v22 = [(BMSyncDatabase *)db activeLocationsInClockVector:v18 inStream:syncIdentifier error:&v35];
  id v23 = (NSString *)v35;
  if (v23)
  {
    id v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v29 = self->_syncIdentifier;
      *(_DWORD *)long long buf = 138412802;
      id v37 = v18;
      __int16 v38 = 2112;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      uint64_t v41 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "error fetching active locations for clockVector: %@ stream: %@ error: %@", buf, 0x20u);
    }
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000168C0;
  v30[3] = &unk_10006D078;
  v30[4] = self;
  id v31 = v18;
  char v34 = v10;
  id v32 = v13;
  id v33 = v14;
  id v25 = v14;
  id v26 = v13;
  id v27 = v18;
  [v22 enumerateObjectsUsingBlock:v30];
}

- (void)handleDeletedLocation:(id)a3 deleteCKRecord:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "handleDeletedLocation: %@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = [v6 siteIdentifier];
  if ([v8 isEqual:self->_localSiteIdentifier]) {
    int v9 = 0;
  }
  else {
    int v9 = v8;
  }
  id v10 = v9;
  unsigned __int8 v11 = [(BMStreamConfiguration *)self->_streamConfiguration storeConfig];
  id v12 = [v11 copyWithRemoteName:v10];

  id v13 = [objc_alloc((Class)BMStreamDatastorePruner) initWithStream:self->_streamIdentifier config:v12 eventDataClass:-[BMStreamConfiguration eventClass](self->_streamConfiguration)];
  id v14 = [(BMSyncDatabase *)self->_db locationRowWithLocation:v6];
  id v15 = v14;
  if (v14 && [v14 state] != (id)4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_100014F10;
    id v30 = sub_100014F20;
    id v31 = 0;
    db = self->_db;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100016E80;
    v24[3] = &unk_10006D0A0;
    v24[4] = self;
    id v25 = v13;
    p_long long buf = &buf;
    [(BMSyncDatabase *)db atomsAtOrBeforeLocation:v15 ofType:0 enumerateWithBlock:v24];
    [(BMSyncDatabase *)self->_db saveLatestTombstoneBookmark:*(void *)(*((void *)&buf + 1) + 40) forSiteIdentifier:v8 inStream:self->_syncIdentifier];
    [(BMSyncDatabase *)self->_db updateAllLocationsAtOrBefore:v15 state:3];
    id v18 = self->_db;
    id v19 = [v15 location];
    [(BMSyncDatabase *)v18 updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:v19];

    if ([(BMSyncDatabase *)self->_db deleteAllAtomsAtOrBeforeLocation:v15])
    {
      [(BMSyncDatabase *)self->_db updateAllLocationsAtOrBefore:v15 state:4];
      __int16 v20 = self->_db;
      [v15 location];
      if (v4) {
        id v21 = {;
      }
        [(BMSyncDatabase *)v20 deleteCKRecordsAtOrBeforeLocation:v21];
      }
      else {
        id v21 = {;
      }
        [(BMSyncDatabase *)v20 markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:v21];
      }

      [(BMSyncDatabase *)self->_db removeAllDeletedLocationsBeforeHighestDeletedLocation:v15];
    }

    _Block_object_dispose(&buf, 8);
  }
  else if ([v15 state] == (id)3 || objc_msgSend(v15, "state") == (id)4)
  {
    id v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "deleted location already handled", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    id v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "location we haven't yet observed is now deleted %@", (uint8_t *)&buf, 0xCu);
    }

    id v23 = [(BMSyncDatabase *)self->_db insertLocationIfNotExists:v6 withState:4];
  }
}

- (void)mergeAtomBatch:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BMStreamCRDTLocation alloc];
  int v9 = [v6 mergeableValueID];
  id v10 = [(BMStreamCRDTLocation *)v8 initWithCKMergeableValueID:v9];

  if (v10)
  {
    id v12 = v6;
    unsigned __int8 v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [(BMStreamCKCRDT *)self mergeAtomBatches:v11 sessionContext:v7 forLocation:v10];
  }
  else
  {
    unsigned __int8 v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100045214(v6, v11);
    }
  }
}

- (void)mergeAtomBatches:(id)a3 sessionContext:(id)a4 forLocation:(id)a5
{
  id v52 = a3;
  id v58 = a4;
  id v8 = a5;
  uint64_t v57 = v8;
  if (v8)
  {
    v59 = [(BMSyncDatabase *)self->_db locationRowWithLocation:v8];
    db = self->_db;
    id v10 = [v57 siteIdentifier];
    long long v51 = [(BMSyncDatabase *)db highestDeletedLocationForSiteIdentifier:v10 inStream:self->_syncIdentifier];

    if ([v59 state] == (id)1)
    {
      unsigned __int8 v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received missing location %@", buf, 0xCu);
      }

      [(BMSyncDatabase *)self->_db updateLocationState:2 forLocation:v59];
LABEL_6:
      id v56 = [v57 siteIdentifier];
      id v55 = objc_opt_new();
      v54 = objc_opt_new();
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x2020000000;
      char v95 = 0;
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x2020000000;
      char v91 = 0;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      obj = v52;
      id v12 = [obj countByEnumeratingWithState:&v84 objects:v100 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v85;
LABEL_8:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v85 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v84 + 1) + 8 * v14);
          id v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v15 count];
            *(_DWORD *)long long buf = 134218242;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v57;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Merging %llu atoms with location %@", buf, 0x16u);
          }

          if ((uint64_t)[v15 count] < 1)
          {
            int v21 = 3;
          }
          else
          {
            id v19 = [[BMSyncDatabaseTransactionBatcher alloc] initWithDatabase:self->_db transcationBatchSize:50];
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_100017BCC;
            v76[3] = &unk_10006D0C8;
            __int16 v20 = v19;
            v77 = v20;
            v78 = self;
            id v79 = v58;
            v80 = v56;
            id v81 = v55;
            id v82 = v54;
            v83 = v59;
            [v15 enumerateAtomsWithOptions:0 usingBlock:v76];
            if ([(BMSyncDatabaseTransactionBatcher *)v20 markAllOperationsComplete])
            {
              int v21 = 0;
            }
            else
            {
              id v22 = __biome_log_for_category();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                sub_1000452E8(&v74, v75, v22);
              }

              int v21 = 1;
            }
          }
          if (v21 != 3)
          {
            if (v21) {
              break;
            }
          }
          if (v12 == (id)++v14)
          {
            id v12 = [obj countByEnumeratingWithState:&v84 objects:v100 count:16];
            if (v12) {
              goto LABEL_8;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        if ([v56 isEqual:self->_localSiteIdentifier]) {
          id v23 = 0;
        }
        else {
          id v23 = v56;
        }
        id v24 = v23;
        id v25 = [(BMStreamConfiguration *)self->_streamConfiguration storeConfig];
        id v26 = [v25 copyWithRemoteName:v24];
        obj = v24;

        id v27 = [objc_alloc((Class)BMStreamDatastoreWriter) initWithStream:self->_streamIdentifier config:v26 eventDataClass:-[BMStreamConfiguration eventClass](self->_streamConfiguration)];
        id v28 = [objc_alloc((Class)BMStreamDatastorePruner) initWithStream:self->_streamIdentifier config:v26 eventDataClass:-[BMStreamConfiguration eventClass](self->_streamConfiguration)];
        id v29 = [(BMStreamCKCRDT *)self readerForSiteIdentifier:v56];
        id v30 = [(BMSyncDatabase *)self->_db latestCKAtomRowOfType:0 forSiteIdentifier:v56 inStream:self->_syncIdentifier];
        id v31 = [(BMStreamCKCRDT *)self bookmarkForAtomRow:v30];
        id v32 = [(BMStreamCKCRDT *)self newEnumeratorStartingAfterBookmark:v31 reader:v29];

        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v97 = sub_100014F10;
        v98 = sub_100014F20;
        id v99 = [v32 nextEvent];
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          id v33 = self->_db;
          syncIdentifier = self->_syncIdentifier;
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_1000181F8;
          v71[3] = &unk_10006D0F0;
          v73 = buf;
          v71[4] = self;
          id v72 = v32;
          [(BMSyncDatabase *)v33 atomRowsNotOnDiskReferencingSiteIdentifier:v56 inStream:syncIdentifier enumerateWithBlock:v71];
        }
        v69[0] = 0;
        v69[1] = v69;
        v69[2] = 0x3032000000;
        v69[3] = sub_100014F10;
        v69[4] = sub_100014F20;
        id v70 = 0;
        id v35 = self->_db;
        unsigned __int8 v36 = self->_syncIdentifier;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100018524;
        v60[3] = &unk_10006D118;
        id v61 = v58;
        id v62 = self;
        v66 = v69;
        v67 = &v92;
        id v37 = v27;
        id v63 = v37;
        v68 = &v88;
        id v38 = v28;
        id v64 = v38;
        uint64_t v39 = v56;
        id v65 = v39;
        [(BMSyncDatabase *)v35 atomRowsNotOnDiskReferencingSiteIdentifier:v39 inStream:v36 enumerateWithBlock:v60];
        if (*((unsigned char *)v89 + 24)) {
          [(BMSyncChangeReporter *)self->_changeReporter userDeletesForStreamName:self->_streamIdentifier deviceIdentifier:v39 error:0];
        }
        if (*((unsigned char *)v93 + 24)) {
          [(BMSyncChangeReporter *)self->_changeReporter streamUpdatedForStreamName:self->_streamIdentifier deviceIdentifier:v39 error:0];
        }

        _Block_object_dispose(v69, 8);
        _Block_object_dispose(buf, 8);
      }
      _Block_object_dispose(&v88, 8);
      _Block_object_dispose(&v92, 8);

      __int16 v40 = v56;
      goto LABEL_43;
    }
    if ([v59 state] == (id)3 || [v59 state] == (id)4)
    {
      __int16 v40 = __biome_log_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        v43 = "Location is not active %@ skipping merge to not resurrect a dead location";
        id v44 = v40;
        uint32_t v45 = 12;
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      }
    }
    else
    {
      v46 = [v51 location];
      uint64_t v47 = [v46 day];
      v48 = [v57 day];
      id v49 = [v47 compare:v48];

      if (v49 != (id)1)
      {
        if (!v59)
        {
          id v50 = __biome_log_for_category();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v57;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "First time observing location %@", buf, 0xCu);
          }

          v59 = [(BMSyncDatabase *)self->_db insertLocationIfNotExists:v57 withState:2];
        }
        goto LABEL_6;
      }
      __int16 v40 = __biome_log_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v57;
        v43 = "Highest deleted location %@ is past incoming location %@";
        id v44 = v40;
        uint32_t v45 = 22;
        goto LABEL_42;
      }
    }
LABEL_43:

    v42 = v59;
    goto LABEL_44;
  }
  uint64_t v41 = __biome_log_for_category();
  v42 = v41;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
  {
    sub_1000452A8();
    v42 = v41;
  }
LABEL_44:
}

- (id)clockVector
{
  return [(BMSyncDatabase *)self->_db legacyTimestampClockVectorForStreamName:self->_syncIdentifier];
}

- (id)rangeClockVector
{
  return [(BMSyncDatabase *)self->_db rangeClockVectorForStreamName:self->_syncIdentifier];
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (void)setStreamConfiguration:(id)a3
{
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
  objc_storeStrong((id *)&self->_streamConfiguration, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_changeReporter, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_locationRowCache, 0);
  objc_storeStrong((id *)&self->_locationBuilder, 0);
  objc_storeStrong((id *)&self->_localSiteIdentifier, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);

  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

@end