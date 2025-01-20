@interface BMFetchAtomBatchesResponse
- (BOOL)moreComing;
- (NSArray)unseenPeers;
- (NSDictionary)atomBatches;
- (NSDictionary)deletedLocations;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)atomBatchBytes;
- (unint64_t)batchSequenceNumber;
- (void)setAtomBatchBytes:(unint64_t)a3;
- (void)setAtomBatches:(id)a3;
- (void)setBatchSequenceNumber:(unint64_t)a3;
- (void)setDeletedLocations:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setUnseenPeers:(id)a3;
@end

@implementation BMFetchAtomBatchesResponse

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMFetchAtomBatchesResponse;
  v5 = [(BMPeerToPeerMessage *)&v25 initFromDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"unseenPeers"];
    v7 = (void *)v5[6];
    v5[6] = v6;

    v8 = [v4 objectForKeyedSubscript:@"atomBatches"];
    if (!v8
      || (+[NSNull null],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8 == v9))
    {
      v14 = 0;
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
      id v24 = 0;
      v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v8 error:&v24];
      id v15 = v24;
      if (v15)
      {
        v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_100045CE4();
        }
      }
      v5[8] = [v8 length];
    }
    v17 = (void *)v5[7];
    v5[7] = v14;
    id v18 = v14;

    v19 = [v4 objectForKeyedSubscript:@"moreComing"];
    *((unsigned char *)v5 + 40) = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:@"batchSequenceNumber"];
    v5[10] = [v20 unsignedIntegerValue];

    uint64_t v21 = [v4 objectForKeyedSubscript:@"deletedLocations"];
    v22 = (void *)v5[9];
    v5[9] = v21;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  atomBatches = self->_atomBatches;
  if (atomBatches)
  {
    id v22 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:atomBatches requiringSecureCoding:1 error:&v22];
    id v5 = v22;
    if (v5)
    {
      uint64_t v6 = __biome_log_for_category();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100045D4C();
      }
    }
  }
  else
  {
    id v5 = 0;
    id v4 = 0;
  }
  v23[0] = @"unseenPeers";
  unseenPeers = self->_unseenPeers;
  uint64_t v8 = (uint64_t)unseenPeers;
  if (!unseenPeers)
  {
    uint64_t v8 = +[NSNull null];
  }
  uint64_t v18 = v8;
  v20 = v5;
  v24[0] = v8;
  v23[1] = @"atomBatches";
  v9 = v4;
  if (!v4)
  {
    v9 = +[NSNull null];
  }
  v24[1] = v9;
  v23[2] = @"moreComing";
  uint64_t v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_moreComing, v18);
  v24[2] = v10;
  v23[3] = @"batchSequenceNumber";
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:self->_batchSequenceNumber];
  v24[3] = v11;
  v23[4] = @"deletedLocations";
  deletedLocations = self->_deletedLocations;
  v13 = deletedLocations;
  if (!deletedLocations)
  {
    v13 = +[NSNull null];
  }
  v24[4] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  id v15 = [v14 mutableCopy];

  if (!deletedLocations) {
  if (!v4)
  }

  if (!unseenPeers) {
  v21.receiver = self;
  }
  v21.super_class = (Class)BMFetchAtomBatchesResponse;
  v16 = [(BMPeerToPeerMessage *)&v21 dictionaryRepresentation];
  [v15 addEntriesFromDictionary:v16];

  return v15;
}

- (NSArray)unseenPeers
{
  return self->_unseenPeers;
}

- (void)setUnseenPeers:(id)a3
{
}

- (NSDictionary)atomBatches
{
  return self->_atomBatches;
}

- (void)setAtomBatches:(id)a3
{
}

- (unint64_t)atomBatchBytes
{
  return self->_atomBatchBytes;
}

- (void)setAtomBatchBytes:(unint64_t)a3
{
  self->_atomBatchBytes = a3;
}

- (NSDictionary)deletedLocations
{
  return self->_deletedLocations;
}

- (void)setDeletedLocations:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
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
  objc_storeStrong((id *)&self->_deletedLocations, 0);
  objc_storeStrong((id *)&self->_atomBatches, 0);

  objc_storeStrong((id *)&self->_unseenPeers, 0);
}

@end