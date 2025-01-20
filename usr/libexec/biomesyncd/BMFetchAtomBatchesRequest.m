@interface BMFetchAtomBatchesRequest
- (BMMultiStreamTimestampClockVector)rangeClockVectors;
- (BMMultiStreamVectorClock)vectorClock;
- (BOOL)isReciprocalRequest;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)atomBatchVersion;
- (unint64_t)batchSequenceNumber;
- (unint64_t)batchSize;
- (void)setAtomBatchVersion:(unint64_t)a3;
- (void)setBatchSequenceNumber:(unint64_t)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setIsReciprocalRequest:(BOOL)a3;
- (void)setRangeClockVectors:(id)a3;
- (void)setVectorClock:(id)a3;
@end

@implementation BMFetchAtomBatchesRequest

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMFetchAtomBatchesRequest;
  v5 = [(BMPeerToPeerMessage *)&v23 initFromDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"batchSize"];
    v5[9] = [v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"batchSequenceNumber"];
    v5[10] = [v7 unsignedIntegerValue];

    v8 = [v4 objectForKeyedSubscript:@"isReciprocalRequest"];
    *((unsigned char *)v5 + 40) = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"atomBatchVersion"];
    v5[8] = [v9 unsignedIntegerValue];

    v10 = [v4 objectForKeyedSubscript:@"vectorClock"];
    id v22 = 0;
    uint64_t v11 = +[BMMultiStreamVectorClock deserialize:v10 error:&v22];
    id v12 = v22;
    v13 = (void *)v5[6];
    v5[6] = v11;

    if (v12)
    {
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100045C14();
      }
    }
    v15 = [v4 objectForKeyedSubscript:@"rangeClockVectors"];

    if (v15)
    {
      v16 = [v4 objectForKeyedSubscript:@"rangeClockVectors"];

      id v21 = 0;
      uint64_t v17 = +[BMMultiStreamTimestampClockVector deserialize:v16 error:&v21];
      id v12 = v21;
      v18 = (void *)v5[7];
      v5[7] = v17;

      if (v12)
      {
        v19 = __biome_log_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          sub_100045BAC();
        }
      }
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  vectorClock = self->_vectorClock;
  id v25 = 0;
  uint64_t v4 = [(BMMultiStreamVectorClock *)vectorClock serialize:&v25];
  id v5 = v25;
  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100045C7C();
    }
  }
  rangeClockVectors = self->_rangeClockVectors;
  id v24 = 0;
  v8 = [(BMMultiStreamTimestampClockVector *)rangeClockVectors serialize:&v24];
  id v9 = v24;
  if (v9)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100045C7C();
    }
  }
  v26[0] = @"batchSize";
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batchSize, v9);
  v27[0] = v11;
  v26[1] = @"batchSequenceNumber";
  id v12 = +[NSNumber numberWithUnsignedInteger:self->_batchSequenceNumber];
  v27[1] = v12;
  v26[2] = @"vectorClock";
  v13 = (void *)v4;
  id v22 = (void *)v4;
  if (!v4)
  {
    v13 = +[NSData data];
  }
  v27[2] = v13;
  v26[3] = @"rangeClockVectors";
  v14 = v8;
  if (!v8)
  {
    v14 = +[NSData data];
  }
  v27[3] = v14;
  v26[4] = @"isReciprocalRequest";
  v15 = +[NSNumber numberWithBool:self->_isReciprocalRequest];
  v27[4] = v15;
  v26[5] = @"atomBatchVersion";
  v16 = +[NSNumber numberWithUnsignedInteger:self->_atomBatchVersion];
  v27[5] = v16;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];
  id v18 = [v17 mutableCopy];

  if (!v8) {
  if (!v22)
  }

  v23.receiver = self;
  v23.super_class = (Class)BMFetchAtomBatchesRequest;
  v19 = [(BMPeerToPeerMessage *)&v23 dictionaryRepresentation];
  [v18 addEntriesFromDictionary:v19];

  return v18;
}

- (BMMultiStreamVectorClock)vectorClock
{
  return self->_vectorClock;
}

- (void)setVectorClock:(id)a3
{
}

- (BMMultiStreamTimestampClockVector)rangeClockVectors
{
  return self->_rangeClockVectors;
}

- (void)setRangeClockVectors:(id)a3
{
}

- (unint64_t)atomBatchVersion
{
  return self->_atomBatchVersion;
}

- (void)setAtomBatchVersion:(unint64_t)a3
{
  self->_atomBatchVersion = a3;
}

- (BOOL)isReciprocalRequest
{
  return self->_isReciprocalRequest;
}

- (void)setIsReciprocalRequest:(BOOL)a3
{
  self->_isReciprocalRequest = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSequenceNumber
{
  return self->_batchSequenceNumber;
}

- (void)setBatchSequenceNumber:(unint64_t)a3
{
  self->_batchSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeClockVectors, 0);

  objc_storeStrong((id *)&self->_vectorClock, 0);
}

@end