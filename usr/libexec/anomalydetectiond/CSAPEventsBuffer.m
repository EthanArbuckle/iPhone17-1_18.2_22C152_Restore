@interface CSAPEventsBuffer
- (CSAPEventsBuffer)init;
- (id)readSamples;
- (void)addObject:(id)a3;
- (void)limitPending;
- (void)reset;
@end

@implementation CSAPEventsBuffer

- (CSAPEventsBuffer)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSAPEventsBuffer;
  v2 = [(CSAPEventsBuffer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pending = v2->_pending;
    v2->_pending = (CSTimestampedSample *)v3;

    uint64_t v5 = +[NSMutableArray array];
    processed = v2->_processed;
    v2->_processed = (CSTimestampedSample *)v5;
  }
  return v2;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  -[CSTimestampedSample addObject:](self->_pending, "addObject:");
  [(CSAPEventsBuffer *)self limitPending];
}

- (id)readSamples
{
  unint64_t v3 = +[CSTimeManager SPU_estimate_current_timestamp];
  id v4 = +[NSMutableArray array];
  uint64_t v5 = +[NSMutableIndexSet indexSet];
  for (unint64_t i = 0; ; ++i)
  {
    id v7 = [(CSTimestampedSample *)self->_pending count];
    pending = self->_pending;
    if (i >= (unint64_t)v7) {
      break;
    }
    v9 = [(CSTimestampedSample *)pending objectAtIndex:i];
    [v5 addIndex:i];
    if (v3 - (unint64_t)[v9 timestamp] <= 0x1C9C380)
    {
      [v4 addObject:v9];
      [(CSTimestampedSample *)self->_processed addObject:v9];
    }
  }
  [(CSTimestampedSample *)pending removeObjectsAtIndexes:v5];
  v10 = +[NSMutableIndexSet indexSet];
  for (unint64_t j = 0; ; ++j)
  {
    id v12 = [(CSTimestampedSample *)self->_processed count];
    processed = self->_processed;
    if (j >= (unint64_t)v12) {
      break;
    }
    v14 = [(CSTimestampedSample *)processed objectAtIndex:j];
    if (v3 - (unint64_t)[v14 timestamp] > 0x1C9C380) {
      [v10 addIndex:j];
    }
  }
  [(CSTimestampedSample *)processed removeObjectsAtIndexes:v10];
  if (qword_1003DB6B0 != -1) {
    dispatch_once(&qword_1003DB6B0, &stru_1003A2A70);
  }
  v15 = (id)qword_1003DB6B8;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v16 = [v4 count];
    unsigned int v17 = [(CSTimestampedSample *)self->_pending count];
    unsigned int v18 = [(CSTimestampedSample *)self->_processed count];
    v21[0] = 67110144;
    v21[1] = v16;
    __int16 v22 = 1024;
    unsigned int v23 = v17;
    __int16 v24 = 1024;
    unsigned int v25 = v18;
    __int16 v26 = 1024;
    unsigned int v27 = [v5 count];
    __int16 v28 = 1024;
    unsigned int v29 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Read %d AP samples = [%d %d] - [%d %d]", (uint8_t *)v21, 0x20u);
  }

  id v19 = [v4 copy];

  return v19;
}

- (void)reset
{
  [(CSTimestampedSample *)self->_pending addObjectsFromArray:self->_processed];
  [(CSTimestampedSample *)self->_processed removeAllObjects];
  [(CSAPEventsBuffer *)self limitPending];
  if (qword_1003DB6B0 != -1) {
    dispatch_once(&qword_1003DB6B0, &stru_1003A2A70);
  }
  unint64_t v3 = (id)qword_1003DB6B8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(CSTimestampedSample *)self->_pending count];
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AP events reset - pending: %d", (uint8_t *)v5, 8u);
  }
}

- (void)limitPending
{
  if ((unint64_t)[(CSTimestampedSample *)self->_pending count] >= 0x65)
  {
    pending = self->_pending;
    unsigned int v4 = (char *)[(CSTimestampedSample *)pending count] - 100;
    -[CSTimestampedSample removeObjectsInRange:](pending, "removeObjectsInRange:", 0, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processed, 0);

  objc_storeStrong((id *)&self->_pending, 0);
}

@end