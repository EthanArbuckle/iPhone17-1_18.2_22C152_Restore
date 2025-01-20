@interface CSSyncQueue
+ (id)lastSlowSample:(id)a3;
+ (id)timestampedComparator;
+ (unint64_t)nextCheckpoint:(id)a3;
- (CSSyncQueue)init;
- (id)getNextSortedArray;
- (id)getNextSortedArrayAndFlush:(BOOL)a3;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)reset;
@end

@implementation CSSyncQueue

+ (id)lastSlowSample:(id)a3
{
  id v3 = a3;
  v4 = +[CSPlatformInfo sharedInstance];
  [v4 isMDevice];

  objc_opt_class();
  v5 = (char *)[v3 count];
  if (v5)
  {
    v6 = v5 - 1;
    while (1)
    {
      v7 = [v3 objectAtIndexedSubscript:v6];
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (--v6 == (char *)-1) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)nextCheckpoint:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v3 timestamp] >> 6 >= 0xC35)
      {
        v4 = (char *)[v3 timestamp] - 200000;
        goto LABEL_13;
      }
      v6 = (char *)[v3 timestamp];
    }
    else
    {
      if (qword_1003DB6B0 != -1) {
        dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
      }
      v5 = qword_1003DB6B8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6B8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Unexpected checkpoint class", v8, 2u);
      }
      v6 = (char *)[v3 timestamp];
    }
    v4 = v6;
    goto LABEL_13;
  }
  v4 = (char *)[v3 timestamp] + 1251;
LABEL_13:

  return (unint64_t)v4;
}

+ (id)timestampedComparator
{
  return &stru_1003B2288;
}

- (CSSyncQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSyncQueue;
  v2 = [(CSSyncQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    syncQ = v2->_syncQ;
    v2->_syncQ = (NSMutableArray *)v3;

    v2->_checkpoint = 0;
    v2->_dynamicHoldout = 1;
  }
  return v2;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->_syncQ, "addObject:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_checkpoint) {
    self->_checkpoint = (unint64_t)[v4 timestamp] - 3000000;
  }
}

- (void)addObjectsFromArray:(id)a3
{
  id v6 = a3;
  for (unint64_t i = 0; i < (unint64_t)[v6 count]; ++i)
  {
    v5 = [v6 objectAtIndexedSubscript:i];
    [(CSSyncQueue *)self addObject:v5];
  }
}

- (id)getNextSortedArray
{
  return [(CSSyncQueue *)self getNextSortedArrayAndFlush:0];
}

- (id)getNextSortedArrayAndFlush:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = +[CSTimeManager SPU_estimate_current_timestamp];
  if (![(NSMutableArray *)self->_syncQ count])
  {
    id v7 = +[NSMutableArray array];
    goto LABEL_49;
  }
  v46 = +[CSSyncQueue timestampedComparator];
  id v6 = [(NSMutableArray *)self->_syncQ sortedArrayUsingComparator:v46];
  id v7 = [v6 mutableCopy];

  [(NSMutableArray *)self->_syncQ removeAllObjects];
  if (v3)
  {
    if (qword_1003DB6B0 != -1) {
      dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
    }
    v8 = qword_1003DB6B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6B8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "should not flush syncQ", buf, 2u);
    }
    goto LABEL_25;
  }
  v9 = +[CSSyncQueue lastSlowSample:v7];
  if (v9)
  {
    if (qword_1003DB6B0 != -1) {
      dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
    }
    v10 = (id)qword_1003DB6B8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v48 = [v9 timestamp];
      __int16 v49 = 2112;
      double v50 = COERCE_DOUBLE(objc_opt_class());
      id v11 = *(id *)&v50;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "found slowest sample at %llu type=%@", buf, 0x16u);
    }
    self->_unint64_t checkpoint = +[CSSyncQueue nextCheckpoint:v9];
  }
  else
  {
    unint64_t v12 = v5 - self->_checkpoint;
    if (v12 < 0x5B8D81)
    {
      if (qword_1003DB6B0 != -1) {
        dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
      }
      uint64_t v19 = qword_1003DB6B8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6B8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      unint64_t checkpoint = self->_checkpoint;
      *(_DWORD *)buf = 134218240;
      id v48 = (id)checkpoint;
      __int16 v49 = 2048;
      double v50 = (double)(v5 - checkpoint) / 1000000.0;
      v16 = "no slowest sample on this queue, default to %llu (%f sec ago)";
      v17 = v19;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      v13 = [v7 lastObject];
      self->_unint64_t checkpoint = (unint64_t)[v13 timestamp] - 1000000;

      if (qword_1003DB6B0 != -1) {
        dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
      }
      uint64_t v14 = qword_1003DB6B8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6B8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      unint64_t v15 = self->_checkpoint;
      *(_DWORD *)buf = 134218240;
      id v48 = (id)v15;
      __int16 v49 = 2048;
      double v50 = (double)v12 / 1000000.0;
      v16 = "no slowest sample on this queue, but it has been too long, moving to %llu (%f sec ago)";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_FAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x16u);
  }
LABEL_24:

LABEL_25:
  v21 = [[SentinelSample alloc] initWithTimestamp:self->_checkpoint];
  v22 = [v7 indexOfObject:v21 inSortedRange:0 options:1536 usingComparator:v46];
  v23 = [v7 count];
  int64_t v24 = v23 - v22;
  uint64_t v45 = [v7 subarrayWithRange:v22, v23 - v22];
  -[NSMutableArray addObjectsFromArray:](self->_syncQ, "addObjectsFromArray:");
  [v7 removeObjectsInRange:v22, v24];
  if (qword_1003DB6B0 != -1) {
    dispatch_once(&qword_1003DB6B0, &stru_1003B22A8);
  }
  v25 = (void *)v45;
  v26 = (id)qword_1003DB6B8;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v43 = v21;
    id v44 = [v7 count];
    if (v44)
    {
      v25 = [v7 firstObject];
      id v27 = [v25 timestamp];
    }
    else
    {
      id v27 = 0;
    }
    v42 = v25;
    id v28 = [v7 count];
    if (v28)
    {
      v40 = [v7 lastObject];
      id v29 = [v40 timestamp];
    }
    else
    {
      id v29 = 0;
    }
    id v30 = [(NSMutableArray *)self->_syncQ count];
    id v41 = v28;
    if (v30)
    {
      v39 = [(NSMutableArray *)self->_syncQ firstObject];
      id v31 = [v39 timestamp];
    }
    else
    {
      id v31 = 0;
    }
    id v32 = [(NSMutableArray *)self->_syncQ count];
    if (v32)
    {
      v38 = [(NSMutableArray *)self->_syncQ lastObject];
      id v33 = [v38 timestamp];
    }
    else
    {
      id v33 = 0;
    }
    unint64_t v34 = +[CSTimeManager SPU_estimate_current_timestamp];
    id v35 = [(NSMutableArray *)self->_syncQ count];
    unint64_t v36 = self->_checkpoint;
    *(_DWORD *)buf = 134219520;
    id v48 = v27;
    __int16 v49 = 2048;
    double v50 = *(double *)&v29;
    __int16 v51 = 2048;
    id v52 = v31;
    __int16 v53 = 2048;
    id v54 = v33;
    __int16 v55 = 2048;
    unint64_t v56 = v34;
    __int16 v57 = 2048;
    id v58 = v35;
    __int16 v59 = 2048;
    unint64_t v60 = v36;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "syncq sorted %llu, %llu remainder %llu, %llu, now %llu, n %lu checkpoint %llu", buf, 0x48u);
    v21 = v43;
    if (v32) {

    }
    v25 = (void *)v45;
    if (v30) {

    }
    if (v41) {
    if (v44)
    }
  }
LABEL_49:

  return v7;
}

- (void)reset
{
  self->_unint64_t checkpoint = 0;
}

- (void).cxx_destruct
{
}

@end