@interface BMStreamCKRecordCRDT
- (BMStreamCKCRDT)streamCRDT;
- (BMStreamCKRecordCRDT)initWithStreamCRDT:(id)a3 locationRow:(id)a4 database:(id)a5 queue:(id)a6 maxDeltaSize:(int64_t)a7 sessionContext:(id)a8;
- (BMSyncCRDTLocationRow)locationRow;
- (BMSyncSessionContext)sessionContext;
- (BOOL)mergeDeltas:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4;
- (id)stateVector;
- (int64_t)maxDeltaSize;
- (unint64_t)deltaDeliveryRequirements;
- (void)setMaxDeltaSize:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation BMStreamCKRecordCRDT

- (BMStreamCKRecordCRDT)initWithStreamCRDT:(id)a3 locationRow:(id)a4 database:(id)a5 queue:(id)a6 maxDeltaSize:(int64_t)a7 sessionContext:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMStreamCKRecordCRDT;
  v18 = [(BMStreamCKRecordCRDT *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamCRDT, a3);
    objc_storeStrong((id *)&v19->_locationRow, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    objc_storeStrong((id *)&v19->_queue, a6);
    v19->_maxDeltaSize = a7;
    objc_storeStrong((id *)&v19->_sessionContext, a8);
  }

  return v19;
}

- (id)stateVector
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_locationRow)
  {
    db = self->_db;
    v4 = [(BMStreamCKRecordCRDT *)self locationRow];
    v5 = [(BMSyncDatabase *)db stateVectorForLocationRow:v4];
  }
  else
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000440E4(v6);
    }

    v5 = objc_opt_new();
  }

  return v5;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v26 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "mergeDeltas delta: %@", buf, 0xCu);
        }

        id v13 = objc_alloc((Class)CKAtomBatch);
        id v28 = 0;
        id v14 = [v13 initWithMergeableDelta:v11 error:&v28];
        id v15 = v28;
        v8 = v15;
        if (v14) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16)
        {
          [v26 addObject:v14];
        }
        else
        {
          id v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v8;
            _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Failed to initWithMergeableDelta with error %@", buf, 0xCu);
          }
        }
        id v18 = objc_alloc((Class)NSString);
        v19 = [v14 mergeableValueID];
        v20 = [v19 identifier];
        id v21 = [v18 initWithData:v20 encoding:4];
        [(BMSyncSessionContext *)self->_sessionContext setOriginatingSiteIdentifier:v21];
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  sessionContext = self->_sessionContext;
  streamCRDT = self->_streamCRDT;
  v24 = [(BMSyncCRDTLocationRow *)self->_locationRow location];
  [(BMStreamCKCRDT *)streamCRDT mergeAtomBatches:v26 sessionContext:sessionContext forLocation:v24];

  return 1;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(BMSyncCRDTLocationRow *)self->_locationRow location];
  v8 = [v7 ckMergeableValueID];

  id v58 = 0;
  id v9 = [objc_alloc((Class)CKAtomBatch) initWriterWithMergeableValueID:v8 metadata:v6 formatVersion:3 error:&v58];
  id v10 = v58;
  if (v10)
  {
    id v11 = v10;
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v63 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004EE8;
    block[3] = &unk_10006CAC0;
    block[4] = buf;
    if (qword_100080290 != -1) {
      dispatch_once(&qword_100080290, block);
    }
    os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    id v14 = "BMStreamCKRecordCRDT: unable to init a CKAtomBatch with initWriterWithMergeableValueID:%@ error:%@";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v14, buf, 0x16u);
LABEL_12:

    if (a4)
    {
      id v11 = v11;
      id v18 = 0;
      *a4 = v11;
    }
    else
    {
      id v18 = 0;
    }
    goto LABEL_46;
  }
  streamCRDT = self->_streamCRDT;
  BOOL v16 = [v6 contentsVector];
  [(BMStreamCKCRDT *)streamCRDT populateAtomBatch:v9 withAtomsInClockVector:v16 forLocation:self->_locationRow ckFormatVersion:3 valueVersion:1 chunker:0];

  id v56 = 0;
  [v9 finishWritingWithError:&v56];
  id v17 = v56;
  if (v17)
  {
    id v11 = v17;
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v63 = 16;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100004EFC;
    v55[3] = &unk_10006CAC0;
    v55[4] = buf;
    if (qword_100080298 != -1) {
      dispatch_once(&qword_100080298, v55);
    }
    os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    id v14 = "BMStreamCKRecordCRDT: unable to complete a CKAtomBatch with finishWritingWithError:%@ error:%@";
    goto LABEL_11;
  }
  int64_t maxDeltaSize = self->_maxDeltaSize;
  id v54 = 0;
  v20 = [v9 splitWithMaximumSize:maxDeltaSize error:&v54];
  id v21 = v54;
  if (v21)
  {
    id v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100044170(v22);
    }

    id v18 = 0;
    if (a4) {
      *a4 = v21;
    }
  }
  else
  {
    v42 = a4;
    id v44 = v9;
    objc_super v23 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v43 = v20;
    id obj = v20;
    id v24 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          id v28 = v23;
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(obj);
          }
          long long v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v48 = 0;
          uint64_t v49 = 0;
          [v29 size:&v49 error:&v48];
          id v30 = v48;
          long long v31 = __biome_log_for_category();
          long long v32 = v31;
          if (v30)
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_100044128(v59, &v60, v32);
            }
          }
          else if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v33 = +[NSNumber numberWithUnsignedInteger:v49];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "BMStreamCKRecordCRDT: split into batch of size %@", buf, 0xCu);
          }
          id v34 = objc_alloc((Class)CKMergeableDelta);
          id v47 = 0;
          id v35 = [v34 initWithAtomBatch:v29 error:&v47];
          id v36 = v47;
          if (v36)
          {
            v38 = v36;
            v39 = __biome_log_for_category();
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v63 = 16;
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_100004F10;
            v46[3] = &unk_10006CAC0;
            v46[4] = buf;
            if (qword_1000802A0 != -1) {
              dispatch_once(&qword_1000802A0, v46);
            }
            v20 = v43;
            os_log_type_t v40 = *(unsigned char *)(*(void *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v39, v40))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v38;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "BMStreamCKRecordCRDT: unable to init a CKMergeableDelta with initWithAtomBatch:%@ error:%@", buf, 0x16u);
            }

            if (v42) {
              id *v42 = v38;
            }

            id v18 = 0;
            id v9 = v44;
            id v21 = 0;
            objc_super v23 = v28;
            goto LABEL_44;
          }
          objc_super v23 = v28;
          [v28 addObject:v35];
        }
        id v25 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    v37 = __biome_log_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "*** deltas: %@", buf, 0xCu);
    }

    id v18 = v23;
    v20 = v43;
    id v9 = v44;
    id v21 = 0;
LABEL_44:
  }
  id v11 = 0;
LABEL_46:

  return v18;
}

- (unint64_t)deltaDeliveryRequirements
{
  return 1;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncCRDTLocationRow)locationRow
{
  return self->_locationRow;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)maxDeltaSize
{
  return self->_maxDeltaSize;
}

- (void)setMaxDeltaSize:(int64_t)a3
{
  self->_int64_t maxDeltaSize = a3;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationRow, 0);
  objc_storeStrong((id *)&self->_streamCRDT, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end