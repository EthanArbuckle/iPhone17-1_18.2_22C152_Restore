@interface BMSyncDatabase
+ (id)createDatabaseForAccount:(id)a3 queue:(id)a4;
+ (id)createPrimaryDatabaseWithQueue:(id)a3;
+ (id)primaryDatabasePath;
+ (id)primaryDatabaseWALPath;
+ (void)enumerateAccountSpecificDatabasesWithBlock:(id)a3;
- (BMSyncDatabase)initWithPath:(id)a3;
- (BMSyncDatabase)initWithPath:(id)a3 options:(unint64_t)a4 queue:(id)a5;
- (BMSyncDatabase)initWithPath:(id)a3 queue:(id)a4;
- (BMSyncDatabase)initWithQueue:(id)a3;
- (BOOL)_tryOpen:(unint64_t)a3;
- (BOOL)addCKAtomRow:(id)a3 inStream:(id)a4;
- (BOOL)beginTransaction;
- (BOOL)ckRecordExists:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (BOOL)ckZoneExists:(id)a3;
- (BOOL)ckZoneSetAttemptedRecoveryDate:(id)a3 state:(int)a4 forZoneName:(id)a5;
- (BOOL)ckZoneSetAttemptingRecoveryForZoneName:(id)a3 state:(int)a4;
- (BOOL)ckZoneSetZoneVersionUUID:(id)a3 forZoneName:(id)a4;
- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForRecordName:(id)a3 zoneName:(id)a4;
- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForZoneName:(id)a3;
- (BOOL)clearCKRecordLocalMergeableValueAndSetToSyncForZone:(id)a3;
- (BOOL)commit;
- (BOOL)containsCKAtomRowWithSegment:(id)a3 inStream:(id)a4;
- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4;
- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4 onDisk:(BOOL)a5;
- (BOOL)deleteAllAtomsAtOrBeforeLocation:(id)a3;
- (BOOL)disableAllCKSyncRecordsForSite:(id)a3 stream:(id)a4;
- (BOOL)enableAllCKSyncRecordsPreviouslyDisabledForSite:(id)a3 stream:(id)a4;
- (BOOL)getLatestTombstoneBookmarkForSiteIdentifier:(id)a3 inStream:(id)a4 segmentName:(id *)a5 segmentOffset:(unint64_t *)a6;
- (BOOL)isInTransaction;
- (BOOL)migration_Schema20ToSchema21;
- (BOOL)migration_Schema27ToSchema28;
- (BOOL)migration_StarSkySchema11ToSydRoSchema12;
- (BOOL)open;
- (BOOL)removeAllDeletedLocationsBeforeHighestDeletedLocation:(id)a3;
- (BOOL)resetCKRecordsMetaDataAndSetToSyncForZone:(id)a3;
- (BOOL)rollback;
- (BOOL)saveCKMergeableRecordValueRecordName:(id)a3 zoneName:(id)a4 mergeableRecordValueData:(id)a5;
- (BOOL)saveCKRecordHighestDeletedLocationRow:(id)a3 recordName:(id)a4 zoneName:(id)a5 recordExists:(BOOL)a6;
- (BOOL)saveCKRecordLocalMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6;
- (BOOL)saveCKRecordServerMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6;
- (BOOL)saveLatestTombstoneBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4;
- (BOOL)updateAllLocationsAtOrBefore:(id)a3 state:(unint64_t)a4;
- (BOOL)updateCKAtomRow:(id)a3 inStream:(id)a4;
- (BOOL)updateLocationState:(unint64_t)a3 forLocation:(id)a4;
- (BOOL)upsertCKRecordWithLocation:(id)a3 inStream:(id)a4;
- (BOOL)upsertLocation:(id)a3;
- (BOOL)upsertSyncDevicePeer:(id)a3 isMe:(BOOL)a4;
- (BOOL)vacuumWithShouldContinueBlock:(id)a3;
- (NSDate)dateOfLastVacuum;
- (NSDate)lastCloudKitSyncAttemptDate;
- (NSDate)lastCloudKitSyncDate;
- (NSDate)lastRapportSyncAttemptDate;
- (NSDate)lastRapportSyncDate;
- (NSString)error;
- (NSString)mergeableRecordValueKey;
- (NSString)name;
- (NSUUID)sharedSyncGeneration;
- (id)CKAtomRowSiteIdentifiers;
- (id)CKAtomRowSiteIdentifiersForStreamIdentifier:(id)a3;
- (id)SELECT_ATOMS_WHERE:(id)a3 ORDER_BY:(id)a4 LIMIT:(id)a5;
- (id)activeLocationsInClockVector:(id)a3 inStream:(id)a4 error:(id *)a5;
- (id)allPeers;
- (id)ckAtomRowForAtomWithBookmark:(id)a3 type:(unint64_t)a4 forSiteIdentifier:(id)a5 inStream:(id)a6;
- (id)ckAtomRowWithTimestamp:(id)a3 inStream:(id)a4;
- (id)ckRecordForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (id)ckRecordsToSyncToCloudKitForZone:(id)a3;
- (id)ckSyncEngineMetaData;
- (id)ckZoneForZoneName:(id)a3;
- (id)computeHighestLocationToDeleteUpToBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5 offsetsIncrease:(BOOL)a6;
- (id)corruptionHandler;
- (id)createCKRecordFromRecordID:(id)a3 newRecord:(BOOL *)a4 recordType:(unint64_t)a5;
- (id)deviceWithIdentifier:(id)a3;
- (id)gatherAllCKSyncRecordRecordsToBeDeleted;
- (id)getSystemFieldsDataForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (id)highestDeletedLocationForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)highestDeletedLocationsForStream:(id)a3;
- (id)highestLocationWithBufferedAtomsOlderThan:(double)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (id)insertLocationIfNotExists:(id)a3 withState:(unint64_t)a4;
- (id)lastSyncDateFromAnyDevice;
- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3;
- (id)latestCKAtomRowForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)latestCKAtomRowOfType:(unint64_t)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (id)latestDistributedTimestampForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)legacyTimestampClockVectorForStreamName:(id)a3;
- (id)localDevice;
- (id)locationRowWithLocation:(id)a3;
- (id)locationRowWithLocationID:(id)a3;
- (id)locationsWithState:(unint64_t)a3;
- (id)previousLocationRowBeforeLocationRow:(id)a3;
- (id)rangeClockVectorForStreamName:(id)a3;
- (id)recordFromSystemFieldsData:(id)a3;
- (id)stateVectorForLocationRow:(id)a3;
- (id)valueForMetadataKey:(id)a3;
- (int)CRDTLocationCount;
- (int)ckAtomCount;
- (unint64_t)_numPagesToVacuum;
- (unint64_t)_sizeOfFileInKilobytes:(id)a3;
- (unint64_t)ckRecordCountForRecordType:(unint64_t)a3;
- (unint64_t)countAtomMergeResultRecords;
- (unint64_t)databaseSizeInKilobytes;
- (unint64_t)internalState;
- (unint64_t)numRowsInTable:(id)a3;
- (unint64_t)sizeOfTableInKilobytes:(id)a3;
- (unint64_t)state;
- (unint64_t)walSizeInKilobytes;
- (unsigned)version;
- (void)atomRowsInTimestampClockVector:(id)a3 forLocation:(id)a4 inStream:(id)a5 enumerateWithBlock:(id)a6;
- (void)atomRowsNotOnDiskReferencingSiteIdentifier:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5;
- (void)atomsAtOrBeforeLocation:(id)a3 ofType:(unint64_t)a4 enumerateWithBlock:(id)a5;
- (void)clearCKSyncEngineMetaData;
- (void)clearCachedStatements;
- (void)close;
- (void)compactAndDeleteSessionLogs;
- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3;
- (void)deleteAllCKRecordsInZone:(id)a3;
- (void)deleteCKRecordAtLocation:(id)a3;
- (void)deleteCKRecordsAtOrBeforeLocation:(id)a3;
- (void)deleteCKRecordsForStreamName:(id)a3;
- (void)disableStatementCachingForBlock:(id)a3;
- (void)enforceMaxSessionLogPrunePolicy;
- (void)enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:(id)a3;
- (void)enumerateMergeableRecordValuesForRecordName:(id)a3 zoneName:(id)a4 withBlock:(id)a5;
- (void)enumerateRecordsWithBlock:(id)a3;
- (void)enumerateZonesWithBlock:(id)a3;
- (void)markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3;
- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 sessionID:(id)a5 messageID:(unint64_t)a6 ownerSite:(id)a7 originatingSite:(id)a8 eventCreatedAt:(double)a9;
- (void)recordMessageToDeviceIdentifier:(id)a3 sessionID:(id)a4 messageID:(unint64_t)a5 reachable:(BOOL)a6 bytes:(unint64_t)a7 isReciprocal:(BOOL)a8;
- (void)recordSessionEnd:(id)a3 timeSincePreviousSync:(double)a4;
- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6;
- (void)resetMetadataForRecord:(id)a3 zoneName:(id)a4;
- (void)runMetricsCollectionTask:(id)a3;
- (void)runVacuumingTask:(id)a3;
- (void)saveCKSyncEngineMetaData:(id)a3;
- (void)saveSystemFieldsDataForRecord:(id)a3 syncToCloudKit:(id)a4 recordType:(unint64_t)a5 crdtDeleted:(id)a6;
- (void)setCorruptionHandler:(id)a3;
- (void)setDateOfLastVacuum:(id)a3;
- (void)setLastCloudKitSyncAttemptDate:(id)a3;
- (void)setLastCloudKitSyncDate:(id)a3;
- (void)setLastRapportSyncAttemptDate:(id)a3;
- (void)setLastRapportSyncDate:(id)a3;
- (void)setMergeableRecordValueKey:(id)a3;
- (void)setName:(id)a3;
- (void)setSharedSyncGeneration:(id)a3;
- (void)setState:(unint64_t)a3 error:(id)a4;
- (void)setState:(unint64_t)a3 errorFormat:(id)a4;
- (void)setValue:(id)a3 forMetadataKey:(id)a4;
- (void)updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3;
@end

@implementation BMSyncDatabase

- (id)locationRowWithLocation:(id)a3
{
  if (a3)
  {
    fmdb = self->_fmdb;
    v13[0] = @"stream = ?";
    id v4 = a3;
    v5 = [v4 streamName];
    v13[1] = v5;
    v13[2] = @" AND site = ?";
    v6 = [v4 siteIdentifier];
    v13[3] = v6;
    v13[4] = @" AND day = ?";
    v7 = [v4 day];

    [v7 timeIntervalSinceReferenceDate];
    v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v13[5] = v8;
    v9 = +[NSArray arrayWithObjects:v13 count:6];
    v10 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_100072520 WHERE:v9];

    if ([v10 next]) {
      v11 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v10 modifier:0];
    }
    else {
      v11 = 0;
    }
    [v10 close];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)locationRowWithLocationID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    fmdb = self->_fmdb;
    v11[0] = @"id = ?";
    v11[1] = v4;
    v7 = +[NSArray arrayWithObjects:v11 count:2];
    v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_100072538 WHERE:v7];

    if ([v8 next]) {
      v9 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v8 modifier:0];
    }
    else {
      v9 = 0;
    }
    [v8 close];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)updateLocationState:(unint64_t)a3 forLocation:(id)a4
{
  id v6 = a4;
  v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    unint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateLocationState: %lu forLocation:%@", (uint8_t *)&v13, 0x16u);
  }

  v8 = [BMSyncCRDTLocationRow alloc];
  v9 = [v6 location];
  v10 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:](v8, "initWithLocation:state:primaryKey:", v9, a3, [v6 primaryKey]);

  BOOL v11 = [(BMSyncDatabase *)self upsertLocation:v10];
  return v11;
}

- (BOOL)updateAllLocationsAtOrBefore:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateAllLocationsAtOrBefore:%@ to state %lu", buf, 0x16u);
  }

  fmdb = self->_fmdb;
  CFStringRef v21 = @"state";
  v19 = +[NSNumber numberWithUnsignedInteger:a4];
  v22 = v19;
  v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v20[0] = @"stream = ?";
  v18 = [v6 location];
  v10 = [v18 streamName];
  v20[1] = v10;
  v20[2] = @" AND site = ?";
  BOOL v11 = [v6 location];
  v12 = [v11 siteIdentifier];
  v20[3] = v12;
  v20[4] = @" AND day <= ?";
  int v13 = [v6 location];
  unint64_t v14 = [v13 day];
  [v14 timeIntervalSinceReferenceDate];
  __int16 v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v20[5] = v15;
  id v16 = +[NSArray arrayWithObjects:v20 count:6];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CRDTLocation" SET:v9 WHERE:v16];

  return (char)fmdb;
}

- (id)insertLocationIfNotExists:(id)a3 withState:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(BMSyncDatabase *)self locationRowWithLocation:v6];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    fmdb = self->_fmdb;
    v19[0] = @"stream";
    v10 = [v6 streamName];
    v20[0] = v10;
    v19[1] = @"site";
    BOOL v11 = [v6 siteIdentifier];
    v20[1] = v11;
    v19[2] = @"day";
    v12 = [v6 day];
    [v12 timeIntervalSinceReferenceDate];
    int v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v20[2] = v13;
    v19[3] = @"state";
    unint64_t v14 = +[NSNumber numberWithUnsignedInteger:a4];
    v20[3] = v14;
    __int16 v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
    [(_bmFMDatabase *)fmdb INSERT_INTO:@"CRDTLocation" VALUES:v15];

    v9 = [[BMSyncCRDTLocationRow alloc] initWithLocation:v6 state:a4 primaryKey:[(_bmFMDatabase *)self->_fmdb lastInsertRowId]];
  }
  id v16 = v9;

  return v16;
}

- (BOOL)upsertLocation:(id)a3
{
  id v4 = a3;
  v5 = [v4 location];
  id v6 = [(BMSyncDatabase *)self locationRowWithLocation:v5];
  fmdb = self->_fmdb;
  if (v6)
  {
    v25[0] = @"stream";
    [v5 streamName];
    v8 = CFStringRef v21 = v6;
    v26[0] = v8;
    v25[1] = @"site";
    v9 = [v5 siteIdentifier];
    v26[1] = v9;
    v25[2] = @"day";
    v10 = [v5 day];
    [v10 timeIntervalSinceReferenceDate];
    BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v26[2] = v11;
    v25[3] = @"state";
    id v12 = [v4 state];

    int v13 = +[NSNumber numberWithUnsignedInteger:v12];
    v26[3] = v13;
    unint64_t v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    v24[0] = @"id = ?";
    __int16 v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 primaryKey]);
    v24[1] = v15;
    id v16 = +[NSArray arrayWithObjects:v24 count:2];
    unsigned __int8 v17 = [(_bmFMDatabase *)fmdb UPDATE:@"CRDTLocation" SET:v14 WHERE:v16];

    v18 = (void *)v8;
    id v6 = v21;
  }
  else
  {
    v22[0] = @"stream";
    v18 = [v5 streamName];
    v23[0] = v18;
    v22[1] = @"site";
    v9 = [v5 siteIdentifier];
    v23[1] = v9;
    v22[2] = @"day";
    v10 = [v5 day];
    [v10 timeIntervalSinceReferenceDate];
    BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v23[2] = v11;
    v22[3] = @"state";
    id v19 = [v4 state];

    int v13 = +[NSNumber numberWithUnsignedInteger:v19];
    v23[3] = v13;
    unint64_t v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    unsigned __int8 v17 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CRDTLocation" VALUES:v14];
  }

  return v17;
}

- (BOOL)removeAllDeletedLocationsBeforeHighestDeletedLocation:(id)a3
{
  id v4 = [a3 location];
  fmdb = self->_fmdb;
  v14[0] = @"stream = ?";
  id v6 = [v4 streamName];
  v14[1] = v6;
  v14[2] = @" AND site = ?";
  v7 = [v4 siteIdentifier];
  v14[3] = v7;
  v14[4] = @" AND state = ?";
  v14[5] = &off_100072CB8;
  v14[6] = @" AND day < ?";
  uint64_t v8 = [v4 day];
  [v8 timeIntervalSinceReferenceDate];
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[7] = v9;
  v14[8] = CFSTR(" AND NOT EXISTS (SELECT 1 FROM CKAtom WHERE stream = ? ");
  v10 = [v4 streamName];
  v14[9] = v10;
  v14[10] = @" AND site = ?";
  BOOL v11 = [v4 siteIdentifier];
  v14[11] = v11;
  v14[12] = @" AND location_id = id");
  v14[13] = &stru_10006DB68;
  v14[14] = @" AND NOT EXISTS (SELECT location_id FROM CKRecord WHERE location_id = id)";
  v14[15] = &stru_10006DB68;
  id v12 = +[NSArray arrayWithObjects:v14 count:16];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CRDTLocation" WHERE:v12];

  return (char)fmdb;
}

- (id)previousLocationRowBeforeLocationRow:(id)a3
{
  fmdb = self->_fmdb;
  v16[0] = @"stream = ?";
  id v4 = a3;
  v5 = [v4 location];
  id v6 = [v5 streamName];
  v16[1] = v6;
  v16[2] = @" AND site = ?";
  v7 = [v4 location];
  uint64_t v8 = [v7 siteIdentifier];
  v16[3] = v8;
  v16[4] = @" AND day < ?";
  v9 = [v4 location];

  v10 = [v9 day];
  [v10 timeIntervalSinceReferenceDate];
  BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[5] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:6];
  int v13 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_100072550 WHERE:v12 ORDER_BY:&off_100072568 LIMIT:&off_100072CD0];

  if ([v13 next]) {
    unint64_t v14 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v13 modifier:0];
  }
  else {
    unint64_t v14 = 0;
  }
  [v13 close];

  return v14;
}

- (id)locationsWithState:(unint64_t)a3
{
  fmdb = self->_fmdb;
  v11[0] = @"state = ?";
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  v11[1] = v4;
  v5 = +[NSArray arrayWithObjects:v11 count:2];
  id v6 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_100072580 WHERE:v5 ORDER_BY:&off_100072598 LIMIT:0];

  v7 = objc_opt_new();
  if ([v6 next])
  {
    do
    {
      uint64_t v8 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v6 modifier:0];
      v9 = [(BMSyncCRDTLocationRow *)v8 location];
      [v7 addObject:v9];
    }
    while (([v6 next] & 1) != 0);
  }
  [v6 close];

  return v7;
}

- (id)highestDeletedLocationsForStream:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  fmdb = self->_fmdb;
  v12[0] = CFSTR("day = (select max(day) from CRDTLocation i where i.stream = ? and i.site=CRDTLocation.site");
  v12[1] = v4;
  v12[2] = @" and state = ?");
  v12[3] = &off_100072CB8;
  v12[4] = @" AND stream = ?";
  v12[5] = v4;
  v7 = +[NSArray arrayWithObjects:v12 count:6];
  uint64_t v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_1000725B0 WHERE:v7];

  if ([v8 next])
  {
    do
    {
      v9 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v8 modifier:0];
      v10 = [(BMSyncCRDTLocationRow *)v9 location];
      [v5 addObject:v10];
    }
    while (([v8 next] & 1) != 0);
  }
  [v8 close];

  return v5;
}

- (id)highestDeletedLocationForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fmdb = self->_fmdb;
  v13[0] = @"stream = ?";
  v13[1] = v7;
  v13[2] = @" AND site = ?";
  v13[3] = v6;
  v13[4] = @" AND state = ? ";
  v13[5] = &off_100072CB8;
  v9 = +[NSArray arrayWithObjects:v13 count:6];
  v10 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_1000725C8 WHERE:v9 ORDER_BY:&off_1000725E0 LIMIT:&off_100072CD0];

  if ([v10 next]) {
    BOOL v11 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v10 modifier:0];
  }
  else {
    BOOL v11 = 0;
  }
  [v10 close];

  return v11;
}

- (int)CRDTLocationCount
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CRDTLocation" COLUMNS:&off_1000725F8 WHERE:0];
  if ([v4 next]) {
    int v5 = [v4 intForColumnIndex:0];
  }
  else {
    int v5 = 0;
  }
  [v4 close];

  return v5;
}

- (id)localDevice
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"DevicePeer" COLUMNS:&off_100072610 WHERE:&off_100072628];
  if ([v4 next]) {
    int v5 = [[BMSyncDevicePeer alloc] initWithFMResultSet:v4];
  }
  else {
    int v5 = 0;
  }
  [v4 close];

  return v5;
}

- (BOOL)upsertSyncDevicePeer:(id)a3 isMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v8 = [v6 deviceIdentifier];
  uint64_t v9 = [(BMSyncDatabase *)self deviceWithIdentifier:v8];

  fmdb = self->_fmdb;
  v34 = (void *)v9;
  if (v9)
  {
    v36[0] = @"device_identifier";
    uint64_t v29 = [v6 deviceIdentifier];
    v37[0] = v29;
    v36[1] = @"ids_device_identifier";
    uint64_t v10 = [v6 idsDeviceIdentifier];
    v33 = (void *)v10;
    if (v10) {
      CFStringRef v11 = (const __CFString *)v10;
    }
    else {
      CFStringRef v11 = &stru_10006DB68;
    }
    v37[1] = v11;
    v36[2] = @"name";
    v32 = [v6 metadata];
    uint64_t v12 = [v32 name];
    int v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_10006DB68;
    }
    v37[2] = v14;
    v36[3] = @"model";
    v30 = [v6 metadata];
    __int16 v15 = [v30 model];
    v37[3] = v15;
    v36[4] = @"platform";
    id v16 = [v6 metadata];
    unsigned __int8 v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 platform]);
    v37[4] = v17;
    v36[5] = @"protocol_version";
    v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 protocolVersion]);
    v37[5] = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:6];
    v35[0] = @"device_identifier = ?";
    v20 = [v6 deviceIdentifier];
    v35[1] = v20;
    CFStringRef v21 = +[NSArray arrayWithObjects:v35 count:2];
    unsigned __int8 v22 = [(_bmFMDatabase *)fmdb UPDATE:@"DevicePeer" SET:v19 WHERE:v21];

    v23 = (void *)v29;
  }
  else
  {
    v38[0] = @"device_identifier";
    v23 = [v6 deviceIdentifier];
    v39[0] = v23;
    v38[1] = @"ids_device_identifier";
    uint64_t v24 = [v6 idsDeviceIdentifier];
    v33 = (void *)v24;
    if (v24) {
      CFStringRef v25 = (const __CFString *)v24;
    }
    else {
      CFStringRef v25 = &stru_10006DB68;
    }
    v39[1] = v25;
    v38[2] = @"name";
    v32 = [v6 metadata];
    uint64_t v26 = [v32 name];
    int v13 = (void *)v26;
    if (v26) {
      CFStringRef v27 = (const __CFString *)v26;
    }
    else {
      CFStringRef v27 = &stru_10006DB68;
    }
    v39[2] = v27;
    v38[3] = @"me";
    v30 = +[NSNumber numberWithBool:v4];
    v39[3] = v30;
    v38[4] = @"model";
    __int16 v15 = [v6 metadata];
    id v16 = [v15 model];
    v39[4] = v16;
    v38[5] = @"platform";
    unsigned __int8 v17 = [v6 metadata];
    v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 platform]);
    v39[5] = v18;
    v38[6] = @"protocol_version";
    id v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 protocolVersion]);
    v39[6] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:7];
    unsigned __int8 v22 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"DevicePeer" VALUES:v20];
  }

  return v22;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"device_identifier = ?";
  v11[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"DevicePeer" COLUMNS:&off_100072640 WHERE:v7];

  if ([v8 next]) {
    uint64_t v9 = [[BMSyncDevicePeer alloc] initWithFMResultSet:v8];
  }
  else {
    uint64_t v9 = 0;
  }
  [v8 close];

  return v9;
}

- (id)lastSyncDateFromAnyDevice
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"DevicePeer" COLUMNS:&off_100072658 WHERE:0];
  int v5 = 0;
  if ([v4 next])
  {
    int v5 = [v4 dateForColumnIndex:0];
  }
  [v4 close];

  return v5;
}

- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"device_identifier = ?";
  v11[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"DevicePeer" COLUMNS:&off_100072670 WHERE:v7];

  if ([v8 next])
  {
    uint64_t v9 = [v8 dateForColumnIndex:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v8 close];

  return v9;
}

- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  CFStringRef v14 = @"last_sync_date";
  id v15 = v6;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v13[0] = @"device_identifier = ?";
  v13[1] = v7;
  CFStringRef v11 = +[NSArray arrayWithObjects:v13 count:2];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"DevicePeer" SET:v10 WHERE:v11];

  return (char)fmdb;
}

- (id)allPeers
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = objc_opt_new();
  int v5 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"DevicePeer" COLUMNS:&off_100072688 WHERE:0];
  if ([v5 next])
  {
    do
    {
      id v6 = [[BMSyncDevicePeer alloc] initWithFMResultSet:v5];
      [v4 addObject:v6];
    }
    while (([v5 next] & 1) != 0);
  }
  [v5 close];

  return v4;
}

- (void)runMetricsCollectionTask:(id)a3
{
  id v4 = a3;
  id v6 = [[BMSyncSessionMetricsAggregator alloc] initWithDatabase:self activity:v4];
  [(BMSyncSessionMetricsAggregator *)v6 enforceMaxSessionLogPrunePolicy];
  [(BMSyncSessionMetricsAggregator *)v6 computeAndSendAggregatedMetrics];
  [(BMSyncSessionMetricsAggregator *)v6 compactAndDeleteSessionLogs];
  int v5 = [[BMStateVectorMetricsCollector alloc] initWithDatabase:self activity:v4];

  [(BMStateVectorMetricsCollector *)v5 computeAndSendStateVectorMetrics];
}

- (BOOL)ckZoneExists:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v10[0] = @"zone_name = ?";
  v10[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  uint64_t v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKZone" COLUMNS:&off_1000726A0 WHERE:v7];

  LOBYTE(fmdb) = [v8 next];
  return (char)fmdb;
}

- (id)ckZoneForZoneName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"zone_name = ?";
  v11[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKZone" COLUMNS:&off_1000726B8 WHERE:v7];

  if ([v8 next]) {
    uint64_t v9 = [[BMSyncCKZone alloc] initWithFMResultSet:v8];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)ckZoneSetAttemptingRecoveryForZoneName:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v8 = [(BMSyncDatabase *)self ckZoneExists:v6];
  fmdb = self->_fmdb;
  if (v8)
  {
    CFStringRef v19 = @"recovery_state";
    uint64_t v10 = +[NSNumber numberWithInt:v4];
    v20 = v10;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v18[0] = @"zone_name = ?";
    v18[1] = v6;
    uint64_t v12 = +[NSArray arrayWithObjects:v18 count:2];
    unsigned __int8 v13 = [(_bmFMDatabase *)fmdb UPDATE:@"CKZone" SET:v11 WHERE:v12];
  }
  else
  {
    v17[0] = v6;
    v16[0] = @"zone_name";
    v16[1] = @"recovery_state";
    uint64_t v10 = +[NSNumber numberWithInt:v4];
    v17[1] = v10;
    v17[2] = @"UUID not set";
    v16[2] = @"zone_uuid";
    v16[3] = @"attempted_recovery_date";
    CFStringRef v11 = +[NSDate distantPast];
    v17[3] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    unsigned __int8 v13 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKZone" VALUES:v12];
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetZoneVersionUUID:(id)a3 forZoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v9 = [(BMSyncDatabase *)self ckZoneExists:v7];
  fmdb = self->_fmdb;
  if (v9)
  {
    CFStringRef v19 = @"zone_uuid";
    id v20 = v6;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v18[0] = @"zone_name = ?";
    v18[1] = v7;
    uint64_t v12 = +[NSArray arrayWithObjects:v18 count:2];
    unsigned __int8 v13 = [(_bmFMDatabase *)fmdb UPDATE:@"CKZone" SET:v11 WHERE:v12];
  }
  else
  {
    v16[0] = @"zone_name";
    v16[1] = @"zone_uuid";
    v17[0] = v7;
    v17[1] = v6;
    v17[2] = &off_100072D18;
    v16[2] = @"recovery_state";
    v16[3] = @"attempted_recovery_date";
    CFStringRef v11 = +[NSDate distantPast];
    v17[3] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    unsigned __int8 v13 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKZone" VALUES:v12];
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetAttemptedRecoveryDate:(id)a3 state:(int)a4 forZoneName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v11 = [(BMSyncDatabase *)self ckZoneExists:v9];
  fmdb = self->_fmdb;
  if (v11)
  {
    v21[0] = @"recovery_state";
    unsigned __int8 v13 = +[NSNumber numberWithInt:v6];
    v21[1] = @"attempted_recovery_date";
    v22[0] = v13;
    v22[1] = v8;
    BOOL v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    v20[0] = @"zone_name = ?";
    v20[1] = v9;
    id v15 = +[NSArray arrayWithObjects:v20 count:2];
    unsigned __int8 v16 = [(_bmFMDatabase *)fmdb UPDATE:@"CKZone" SET:v14 WHERE:v15];
  }
  else
  {
    v19[0] = v9;
    v18[0] = @"zone_name";
    v18[1] = @"recovery_state";
    unsigned __int8 v13 = +[NSNumber numberWithInt:v6];
    v19[1] = v13;
    v19[2] = @"UUID not set";
    void v18[2] = @"zone_uuid";
    v18[3] = @"attempted_recovery_date";
    v19[3] = v8;
    BOOL v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    unsigned __int8 v16 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKZone" VALUES:v14];
  }

  return v16;
}

- (void)enumerateZonesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, BMSyncCKZone *, unsigned char *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v6 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKZone" COLUMNS:&off_1000726D0 WHERE:0];
  char v9 = 0;
  do
  {
    if (![v6 next]) {
      break;
    }
    id v8 = [[BMSyncCKZone alloc] initWithFMResultSet:v6];
    v4[2](v4, v8, &v9);
  }
  while (!v9);
}

- (BOOL)addCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc((Class)NSString);
  uint64_t v10 = [v6 timestamp];
  unsigned int v11 = [v10 siteIdentifierObject];
  uint64_t v12 = [v11 identifier];
  id v13 = [v9 initWithData:v12 encoding:4];

  id v14 = objc_alloc((Class)NSString);
  id v15 = [v6 causalReference];
  unsigned __int8 v16 = [v15 timestamp];
  unsigned __int8 v17 = [v16 siteIdentifierObject];
  v18 = [v17 identifier];
  id v19 = [v14 initWithData:v18 encoding:4];

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v61[0] = @"stream";
  v61[1] = @"site";
  v62[0] = v7;
  v62[1] = v13;
  v59 = v13;
  v61[2] = @"clock";
  v57 = [v6 timestamp];
  v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v57 clockValue]);
  v62[2] = v56;
  v61[3] = @"type";
  v55 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 type]);
  v62[3] = v55;
  v61[4] = @"location_id";
  v54 = [v6 location];
  v53 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v54 primaryKey]);
  v62[4] = v53;
  v61[5] = @"segment_name";
  uint64_t v20 = [v6 segmentName];
  CFStringRef v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = +[NSNull null];
  }
  v52 = v21;
  v41 = (void *)v20;
  v62[5] = v20;
  v61[6] = @"segment_offset";
  v51 = [v6 segmentName];
  if (v51) {
    +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v6 segmentOffset]);
  }
  else {
  v50 = +[NSNull null];
  }
  v62[6] = v50;
  v61[7] = @"on_disk";
  uint64_t v22 = [v6 segmentName];
  if (v22)
  {
    v23 = &__kCFBooleanTrue;
  }
  else
  {
    v23 = +[NSNull null];
  }
  v40 = v23;
  v62[7] = v23;
  v61[8] = @"ref_type";
  v46 = [v6 causalReference];
  if (v46)
  {
    v45 = [v6 causalReference];
    uint64_t v24 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v45 type]);
  }
  else
  {
    uint64_t v24 = +[NSNull null];
    v45 = (void *)v24;
  }
  v43 = (void *)v24;
  v62[8] = v24;
  v61[9] = @"ref_location_id";
  CFStringRef v25 = [v6 referenceLocation];
  if (v25)
  {
    v44 = [v6 referenceLocation];
    uint64_t v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 primaryKey]);
  }
  else
  {
    uint64_t v26 = +[NSNull null];
    v44 = (void *)v26;
  }
  v42 = (void *)v26;
  v62[9] = v26;
  v61[10] = @"ref_site";
  CFStringRef v27 = [v6 causalReference];
  v58 = v19;
  if (!v27)
  {
    id v19 = +[NSNull null];
  }
  v47 = (void *)v22;
  v60 = v7;
  v39 = v19;
  v62[10] = v19;
  v61[11] = @"ref_clock";
  v28 = [v6 causalReference];
  if (v28)
  {
    uint64_t v29 = [v6 causalReference];
    v38 = [v29 timestamp];
    v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 clockValue]);
  }
  else
  {
    v30 = +[NSNull null];
    uint64_t v29 = v30;
  }
  v62[11] = v30;
  v61[12] = @"value_version";
  v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 valueVersion]);
  v62[12] = v31;
  v61[13] = @"value_data";
  v32 = [v6 valueData];
  v33 = v32;
  if (!v32)
  {
    v33 = +[NSNull null];
  }
  v62[13] = v33;
  v34 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:14];
  unsigned __int8 v49 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKAtom" VALUES:v34];

  if (!v32) {
  if (v28)
  }
  {
  }
  if (!v27) {

  }
  if (v25) {
  if (v46)
  }

  if (!v47) {
  if (!v52)
  }

  if ((v49 & 1) == 0)
  {
    v35 = __biome_log_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      sub_100045DB4((id *)p_fmdb);
    }
  }
  return v49;
}

- (id)ckAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc((Class)NSString);
  uint64_t v10 = [v6 siteIdentifierObject];
  unsigned int v11 = [v10 identifier];
  id v12 = [v9 initWithData:v11 encoding:4];

  v18[0] = @"CKAtom.site = ?";
  v18[1] = v12;
  void v18[2] = @" AND CKAtom.stream = ?";
  v18[3] = v7;
  void v18[4] = @" AND clock = ?";
  id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 clockValue]);
  v18[5] = v13;
  id v14 = +[NSArray arrayWithObjects:v18 count:6];
  id v15 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v14 ORDER_BY:0 LIMIT:0];

  unsigned __int8 v16 = 0;
  if ([v15 next]) {
    unsigned __int8 v16 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:v15];
  }
  [v15 close];

  return v16;
}

- (id)latestCKAtomRowForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v13[0] = @"CKAtom.site = ?";
  v13[1] = v6;
  void v13[2] = @" AND CKAtom.stream = ?";
  v13[3] = v7;
  v13[4] = @" AND on_disk IS ?";
  v13[5] = &__kCFBooleanTrue;
  id v9 = +[NSArray arrayWithObjects:v13 count:6];
  uint64_t v10 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v9 ORDER_BY:&off_1000726E8 LIMIT:&off_100072D48];

  if ([v10 next]) {
    unsigned int v11 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:v10];
  }
  else {
    unsigned int v11 = 0;
  }
  [v10 close];

  return v11;
}

- (id)legacyTimestampClockVectorForStreamName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v6 = objc_opt_new();
  fmdb = self->_fmdb;
  v17[0] = @"stream = ?";
  v17[1] = v4;
  v17[2] = @" AND on_disk IS ?";
  v17[3] = &__kCFBooleanTrue;
  id v8 = +[NSArray arrayWithObjects:v17 count:4];
  id v9 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072700 WHERE:v8 GROUP_BY:&off_100072718];

  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10001DEF4;
  id v15 = &unk_10006D210;
  id v10 = v6;
  id v16 = v10;
  [v9 enumerateWithBlock:&v12];
  [v9 close:v12, v13, v14, v15];

  return v10;
}

- (id)rangeClockVectorForStreamName:(id)a3
{
  id v24 = a3;
  v23 = self;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v22 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(BMSyncDatabase *)self CKAtomRowSiteIdentifiersForStreamIdentifier:v24];
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v8);
        unsigned int v11 = objc_opt_new();
        fmdb = v23->_fmdb;
        v33[0] = @"stream = ?";
        v33[1] = v24;
        v33[2] = @" AND site = ?";
        v33[3] = v9;
        uint64_t v13 = +[NSArray arrayWithObjects:v33 count:4];
        id v14 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072730 WHERE:v13 ORDER_BY:&off_100072748 LIMIT:0];

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10001E308;
        v25[3] = &unk_10006D210;
        id v15 = v11;
        id v26 = v15;
        [v14 enumerateWithBlock:v25];
        [v14 close];
        id v16 = objc_alloc((Class)CKDistributedSiteIdentifier);
        unsigned __int8 v17 = [v9 dataUsingEncoding:4];
        id v18 = [v16 initWithIdentifier:v17];

        if (v18)
        {
          [v22 addClockValuesInIndexSet:v15 forSiteIdentifier:v18];
        }
        else
        {
          id v19 = __biome_log_for_category();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to decode CKDistributedSiteIdentifier from site %@", buf, 0xCu);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v6);
  }

  return v22;
}

- (id)stateVectorForLocationRow:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v23[0] = @"location_id = ?";
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 primaryKey]);
  v23[1] = v7;
  v23[2] = @" AND on_disk IS ?";
  v23[3] = &__kCFBooleanTrue;
  id v8 = +[NSArray arrayWithObjects:v23 count:4];
  id v9 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072760 WHERE:v8 ORDER_BY:&off_100072778 LIMIT:0];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10001E5E8;
  id v19 = sub_10001E5F8;
  id v20 = (id)objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E600;
  v14[3] = &unk_10006D238;
  v14[4] = &v15;
  [v9 enumerateWithBlock:v14];
  [v9 close];
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v16[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "stateVector: %@", buf, 0xCu);
  }

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)latestCKAtomRowOfType:(unint64_t)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v16[0] = @"type = ?";
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a3];
  v16[1] = v11;
  v16[2] = @" AND CKAtom.stream = ?";
  v16[3] = v9;
  void v16[4] = @" AND CKAtom.site = ?";
  v16[5] = v8;
  void v16[6] = @" AND on_disk IS ?";
  v16[7] = &__kCFBooleanTrue;
  v16[8] = @" AND segment_name IS NOT ?";
  v16[9] = @"DOA";
  id v12 = +[NSArray arrayWithObjects:v16 count:10];
  uint64_t v13 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v12 ORDER_BY:&off_100072790 LIMIT:&off_100072D48];

  if ([v13 next]) {
    id v14 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:v13];
  }
  else {
    id v14 = 0;
  }
  [v13 close];

  return v14;
}

- (int)ckAtomCount
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_1000727A8 WHERE:0];
  if ([v4 next]) {
    int v5 = [v4 intForColumnIndex:0];
  }
  else {
    int v5 = 0;
  }
  [v4 close];

  return v5;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc((Class)NSString);
  id v10 = [v6 siteIdentifierObject];
  uint64_t v11 = [v10 identifier];
  id v12 = [v9 initWithData:v11 encoding:4];

  fmdb = self->_fmdb;
  v19[0] = @"clock = ?";
  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 clockValue]);
  v19[1] = v14;
  v19[2] = @" AND stream = ?";
  v19[3] = v7;
  void v19[4] = @" AND site = ?";
  v19[5] = v12;
  uint64_t v15 = +[NSArray arrayWithObjects:v19 count:6];
  id v16 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_1000727C0 WHERE:v15];

  if ([v16 next]) {
    BOOL v17 = (int)[v16 intForColumnIndex:0] > 0;
  }
  else {
    BOOL v17 = 0;
  }
  [v16 close];

  return v17;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4 onDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v11 = objc_alloc((Class)NSString);
  id v12 = [v8 siteIdentifierObject];
  uint64_t v13 = [v12 identifier];
  id v14 = [v11 initWithData:v13 encoding:4];

  fmdb = self->_fmdb;
  v22[0] = @"clock = ?";
  id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 clockValue]);
  v22[1] = v16;
  void v22[2] = @" AND stream = ?";
  v22[3] = v9;
  void v22[4] = @" AND site = ?";
  v22[5] = v14;
  v22[6] = @" AND on_disk IS ?";
  if (a5)
  {
    BOOL v17 = &__kCFBooleanTrue;
  }
  else
  {
    BOOL v17 = +[NSNull null];
  }
  v22[7] = v17;
  id v18 = +[NSArray arrayWithObjects:v22 count:8];
  id v19 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_1000727D8 WHERE:v18];

  if (!a5) {
  if ([v19 next])
  }
    BOOL v20 = (int)[v19 intForColumnIndex:0] > 0;
  else {
    BOOL v20 = 0;
  }
  [v19 close];

  return v20;
}

- (BOOL)updateCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc((Class)NSString);
  id v10 = [v6 timestamp];
  id v11 = [v10 siteIdentifierObject];
  id v12 = [v11 identifier];
  id v13 = [v9 initWithData:v12 encoding:4];

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v39[0] = @"segment_name";
  uint64_t v14 = [v6 segmentName];
  uint64_t v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = +[NSNull null];
  }
  v35 = v15;
  long long v30 = (void *)v14;
  v40[0] = v14;
  v39[1] = @"segment_offset";
  v34 = [v6 segmentName];
  if (v34) {
    +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v6 segmentOffset]);
  }
  else {
  v33 = +[NSNull null];
  }
  v40[1] = v33;
  v39[2] = @"value_version";
  v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 valueVersion]);
  v40[2] = v31;
  v39[3] = @"value_data";
  uint64_t v16 = [v6 valueData];
  BOOL v17 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = +[NSNull null];
  }
  long long v29 = (void *)v16;
  v40[3] = v16;
  v39[4] = @"on_disk";
  id v18 = [v6 segmentName];
  if (v18)
  {
    id v19 = &__kCFBooleanTrue;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  v40[4] = v19;
  BOOL v20 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];
  v37 = v7;
  v38[0] = @"stream = ?";
  v38[1] = v7;
  v38[2] = @" AND site = ?";
  v36 = v13;
  v38[3] = v13;
  v38[4] = @" AND clock = ?";
  CFStringRef v21 = [v6 timestamp];
  uint64_t v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 clockValue]);
  v38[5] = v22;
  v38[6] = @" AND type = ?";
  v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 type]);
  void v38[7] = v23;
  id v24 = +[NSArray arrayWithObjects:v38 count:8];
  unsigned __int8 v25 = [(_bmFMDatabase *)fmdb UPDATE:@"CKAtom" SET:v20 WHERE:v24];

  if (!v18) {
  if (!v17)
  }

  if (!v35) {
  if ((v25 & 1) == 0)
  }
  {
    id v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_100045E3C((id *)p_fmdb);
    }
  }
  return v25;
}

- (id)ckAtomRowForAtomWithBookmark:(id)a3 type:(unint64_t)a4 forSiteIdentifier:(id)a5 inStream:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v21[0] = @"CKAtom.site = ?";
  v21[1] = v11;
  void v21[2] = @" AND CKAtom.stream = ?";
  v21[3] = v12;
  v21[4] = @" AND type = ?";
  uint64_t v14 = +[NSNumber numberWithUnsignedInteger:a4];
  v21[5] = v14;
  v21[6] = @" AND segment_name = ?";
  uint64_t v15 = [v10 segmentName];
  v21[7] = v15;
  v21[8] = @" AND segment_offset = ?";
  uint64_t v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v10 offset]);
  v21[9] = v16;
  BOOL v17 = +[NSArray arrayWithObjects:v21 count:10];
  id v18 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v17 ORDER_BY:0 LIMIT:0];

  id v19 = 0;
  if ([v18 next]) {
    id v19 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:v18];
  }
  [v18 close];

  return v19;
}

- (id)latestDistributedTimestampForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v18[0] = @"site = ?";
  v18[1] = v6;
  void v18[2] = @" AND stream = ?";
  v18[3] = v7;
  id v10 = +[NSArray arrayWithObjects:v18 count:4];
  id v11 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_1000727F0 WHERE:v10];

  if ([v11 next])
  {
    id v12 = [v11 unsignedLongLongIntForColumnIndex:0];
    id v13 = objc_alloc((Class)CKDistributedSiteIdentifier);
    uint64_t v14 = [v6 dataUsingEncoding:4];
    id v15 = [v13 initWithIdentifier:v14];

    id v16 = [objc_alloc((Class)CKDistributedTimestamp) initWithSiteIdentifierObject:v15 clockValue:v12];
  }
  else
  {
    id v16 = 0;
  }
  [v11 close];

  return v16;
}

- (BOOL)containsCKAtomRowWithSegment:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v13[0] = @"stream = ?";
  v13[1] = v7;
  void v13[2] = @" AND segment_name = ?";
  v13[3] = v6;
  id v10 = +[NSArray arrayWithObjects:v13 count:4];
  id v11 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072808 WHERE:v10];

  LOBYTE(fmdb) = [v11 next];
  [v11 close];

  return (char)fmdb;
}

- (id)CKAtomRowSiteIdentifiers
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072820 WHERE:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if ([v4 next])
  {
    do
    {
      id v6 = [v4 stringForColumnIndex:0];
      [v5 addObject:v6];
    }
    while (([v4 next] & 1) != 0);
  }
  [v4 close];

  return v5;
}

- (id)CKAtomRowSiteIdentifiersForStreamIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"stream = ?";
  v12[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v12 count:2];
  id v8 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072838 WHERE:v7];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  if ([v8 next])
  {
    do
    {
      id v10 = [v8 stringForColumnIndex:0];
      [v9 addObject:v10];
    }
    while (([v8 next] & 1) != 0);
  }
  [v8 close];

  return v9;
}

- (void)atomRowsNotOnDiskReferencingSiteIdentifier:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v20[0] = CFSTR("(ref_site = ?");
  v20[1] = v8;
  void v20[2] = @" OR (ref_site IS NULL AND CKAtom.site = ?)");
  v20[3] = v8;
  void v20[4] = @" AND CKAtom.stream = ?";
  v20[5] = v9;
  void v20[6] = @" AND on_disk IS ?";
  id v12 = +[NSNull null];
  v20[7] = v12;
  id v13 = +[NSArray arrayWithObjects:v20 count:8];
  uint64_t v14 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v13 ORDER_BY:&off_100072850 LIMIT:0];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001FA28;
  v17[3] = &unk_10006D260;
  id v18 = v14;
  id v19 = v10;
  id v15 = v14;
  id v16 = v10;
  [v15 enumerateWithBlock:v17];
  [v15 close];
}

- (void)atomsAtOrBeforeLocation:(id)a3 ofType:(unint64_t)a4 enumerateWithBlock:(id)a5
{
  id v8 = a3;
  id v22 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v26[0] = @"location.stream = ?";
  CFStringRef v21 = [v8 location];
  id v10 = [v21 streamName];
  v26[1] = v10;
  v26[2] = @" AND location.site = ?";
  id v11 = [v8 location];
  id v12 = [v11 siteIdentifier];
  v26[3] = v12;
  void v26[4] = @" AND location.day <= ?";
  id v13 = [v8 location];
  uint64_t v14 = [v13 day];
  [v14 timeIntervalSinceReferenceDate];
  id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v26[5] = v15;
  v26[6] = @" AND type = ?";
  id v16 = +[NSNumber numberWithUnsignedInteger:a4];
  v26[7] = v16;
  BOOL v17 = +[NSArray arrayWithObjects:v26 count:8];
  id v18 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v17 ORDER_BY:&off_100072868 LIMIT:0];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001FCF0;
  v23[3] = &unk_10006D260;
  id v24 = v18;
  id v25 = v22;
  id v19 = v18;
  id v20 = v22;
  [v19 enumerateWithBlock:v23];
  [v19 close];
}

- (BOOL)deleteAllAtomsAtOrBeforeLocation:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  v29[0] = @"site = ?";
  id v6 = [v4 location];
  id v7 = [v6 siteIdentifier];
  v29[1] = v7;
  v29[2] = @" AND stream = ?";
  id v8 = [v4 location];
  id v9 = [v8 streamName];
  v29[3] = v9;
  id v10 = +[NSArray arrayWithObjects:v29 count:4];
  id v11 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072880 WHERE:v10 ORDER_BY:&off_100072898 LIMIT:&off_100072D48];

  if ([v11 next])
  {
    v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 intForColumnIndex:0]);
    [v11 close];
    id v12 = self->_fmdb;
    v28[0] = CFSTR("location_id IN (SELECT id from CRDTLocation where stream = ?");
    long long v27 = [v4 location];
    id v26 = [v27 streamName];
    v28[1] = v26;
    v28[2] = @" AND site = ?";
    id v25 = [v4 location];
    id v24 = [v25 siteIdentifier];
    v28[3] = v24;
    v28[4] = @" AND day <= ?");
    id v22 = [v4 location];
    id v13 = [v22 day];
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v28[5] = v14;
    v28[6] = @" AND clock != ?";
    v28[7] = v23;
    v28[8] = CFSTR(" AND clock != (SELECT MAX(clock) FROM CKAtom WHERE stream = ?");
    id v15 = [v4 location];
    id v16 = [v15 streamName];
    v28[9] = v16;
    v28[10] = @" AND site = ?");
    BOOL v17 = [v4 location];
    id v18 = [v17 siteIdentifier];
    v28[11] = v18;
    id v19 = +[NSArray arrayWithObjects:v28 count:12];
    unsigned __int8 v20 = [(_bmFMDatabase *)v12 DELETE_FROM:@"CKAtom" WHERE:v19];
  }
  else
  {
    [v11 close];
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (id)activeLocationsInClockVector:(id)a3 inStream:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v30 = v7;
  if ([v7 timestampCount])
  {
    long long v27 = self;
    id v9 = objc_opt_new();
    [v9 addObject:@"CKAtom.stream = ? "];
    [v9 addObject:v8];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v10 = [v7 allSiteIdentifiers];
    id v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v47;
      char v13 = 1;
      id obj = v10;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v16 = objc_alloc((Class)NSString);
          BOOL v17 = [v15 identifier];
          id v18 = [v16 initWithData:v17 encoding:4];

          if (v13) {
            CFStringRef v19 = CFSTR(" AND ((CKAtom.site = ? ");
          }
          else {
            CFStringRef v19 = @" OR (CKAtom.site = ? ");
          }
          [v9 addObject:v19];
          [v9 addObject:v18];
          unsigned __int8 v20 = [v30 clockValuesForSiteIdentifier:v15];
          uint64_t v36 = 0;
          v37 = &v36;
          uint64_t v38 = 0x2020000000;
          LOBYTE(v39) = 1;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100020530;
          v42[3] = &unk_10006D288;
          v44 = v50;
          v45 = &v36;
          id v43 = v9;
          [v20 enumerateRangesUsingBlock:v42];

          _Block_object_dispose(&v36, 8);
          char v13 = 0;
        }
        id v10 = obj;
        id v11 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        char v13 = 0;
      }
      while (v11);
    }

    [v9 addObject:@"] AND on_disk IS ?"));
    [v9 addObject:&__kCFBooleanTrue];
    [v9 addObject:@" AND location.state = ?"];
    [v9 addObject:&off_100072D60];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_10001E5E8;
    v40 = sub_10001E5F8;
    id v41 = 0;
    CFStringRef v21 = objc_opt_new();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000206E8;
    v31[3] = &unk_10006D2D8;
    v31[4] = v27;
    id v22 = v9;
    v32 = v22;
    id v23 = v21;
    id v33 = v23;
    v35 = &v36;
    id v34 = v8;
    [(BMSyncDatabase *)v27 disableStatementCachingForBlock:v31];
    if (a5)
    {
      id v24 = (void *)v37[5];
      if (v24) {
        *a5 = v24;
      }
    }
    id v25 = [v23 copy];

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(v50, 8);
  }
  else
  {
    id v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100045EC4();
    }
    id v25 = &__NSArray0__struct;
  }

  return v25;
}

- (void)atomRowsInTimestampClockVector:(id)a3 forLocation:(id)a4 inStream:(id)a5 enumerateWithBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v30 = a6;
  v32 = v10;
  long long v29 = v12;
  if ([v10 timestampCount])
  {
    long long v27 = self;
    char v13 = objc_opt_new();
    [v13 addObject:@"CKAtom.stream = ? "];
    [v13 addObject:v12];
    if (v11)
    {
      [v13 addObject:@" AND CKAtom.location_id = ? "];
      uint64_t v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 primaryKey]);
      [v13 addObject:v14];
    }
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = [v10 allSiteIdentifiers:v27, v12];
    id v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v43;
      char v18 = 1;
      id obj = v15;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v21 = objc_alloc((Class)NSString);
          id v22 = [v20 identifier];
          id v23 = [v21 initWithData:v22 encoding:4];

          if (v18) {
            CFStringRef v24 = CFSTR(" AND ((CKAtom.site = ? ");
          }
          else {
            CFStringRef v24 = @" OR (CKAtom.site = ? ");
          }
          [v13 addObject:v24];
          [v13 addObject:v23];
          id v25 = [v32 clockValuesForSiteIdentifier:v20];
          v40[0] = 0;
          v40[1] = v40;
          v40[2] = 0x2020000000;
          char v41 = 1;
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_100020D80;
          v36[3] = &unk_10006D288;
          uint64_t v38 = v46;
          v39 = v40;
          id v37 = v13;
          [v25 enumerateRangesUsingBlock:v36];

          _Block_object_dispose(v40, 8);
          char v18 = 0;
        }
        id v15 = obj;
        id v16 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        char v18 = 0;
      }
      while (v16);
    }

    [v13 addObject:@"] AND on_disk IS ?"));
    [v13 addObject:&__kCFBooleanTrue];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100020F38;
    v33[3] = &unk_10006CDB0;
    void v33[4] = v28;
    id v26 = v13;
    id v34 = v26;
    id v35 = v30;
    [v28 disableStatementCachingForBlock:v33];

    _Block_object_dispose(v46, 8);
  }
  else
  {
    id v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100045EC4();
    }
  }
}

- (id)computeHighestLocationToDeleteUpToBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5 offsetsIncrease:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = @" AND segment_offset < ? OR NULL) == 0");
  if (v6) {
    id v12 = @" AND segment_offset > ? OR NULL) == 0");
  }
  char v13 = v12;
  fmdb = self->_fmdb;
  v28[0] = @"CKAtom.stream = ?";
  v28[1] = v11;
  id v26 = v10;
  v28[2] = @" AND CKAtom.site = ?";
  v28[3] = v10;
  id v15 = a3;
  id v16 = +[NSArray arrayWithObjects:v28 count:4];
  v27[0] = CFSTR("COUNT ((CAST(segment_name AS INT) > ?");
  uint64_t v17 = [v15 segmentName];
  char v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 longLongValue]);
  v27[1] = v18;
  v27[2] = @" OR segment_name = ?";
  CFStringRef v19 = [v15 segmentName];
  v27[3] = v19;
  v27[4] = v13;
  id v20 = [v15 offset];

  id v21 = +[NSNumber numberWithUnsignedLong:v20];
  v27[5] = v21;
  id v22 = +[NSArray arrayWithObjects:v27 count:6];
  id v23 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_100072928 JOIN:&off_100072940 WHERE:v16 GROUP_BY:&off_100072958 HAVING:v22 ORDER_BY:&off_100072970 LIMIT:&off_100072D48];

  if ([v23 next]) {
    CFStringRef v24 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v23 modifier:1];
  }
  else {
    CFStringRef v24 = 0;
  }
  [v23 close];

  return v24;
}

- (id)highestLocationWithBufferedAtomsOlderThan:(double)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = @"CKAtom.stream = ?";
  v15[1] = v9;
  v15[2] = @" AND CKAtom.site = ?";
  v15[3] = v8;
  v15[4] = @" AND on_disk IS NOT ?";
  v15[5] = &__kCFBooleanTrue;
  v15[6] = @" AND location.day <= ?";
  id v10 = +[NSNumber numberWithDouble:a3];
  v15[7] = v10;
  id v11 = +[NSArray arrayWithObjects:v15 count:8];
  id v12 = [(BMSyncDatabase *)self SELECT_ATOMS_WHERE:v11 ORDER_BY:&off_100072988 LIMIT:&off_100072D48];

  if ([v12 next]) {
    char v13 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v12 modifier:1];
  }
  else {
    char v13 = 0;
  }
  [v12 close];

  return v13;
}

- (id)SELECT_ATOMS_WHERE:(id)a3 ORDER_BY:(id)a4 LIMIT:(id)a5
{
  return [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKAtom" COLUMNS:&off_1000729A0 JOIN:&off_1000729B8 WHERE:a3 ORDER_BY:a4 LIMIT:a5];
}

- (NSUUID)sharedSyncGeneration
{
  v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"SharedSyncGeneration"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5[0] = 0;
    v5[1] = 0;
    id v3 = 0;
    if ([v2 length] == (id)16)
    {
      [v2 getBytes:v5 length:16];
      id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v5];
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSUUID *)v3;
}

- (void)setSharedSyncGeneration:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v4 = +[NSData dataWithBytes:v5 length:16];
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"SharedSyncGeneration"];
}

- (NSDate)lastRapportSyncAttemptDate
{
  v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"LastSyncAttemptDate"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncAttemptDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"LastSyncAttemptDate"];
}

- (NSDate)lastRapportSyncDate
{
  v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"LastSyncDate"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"LastSyncDate"];
}

- (NSDate)lastCloudKitSyncAttemptDate
{
  v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"LastCloudKitAttemptDate"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncAttemptDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"LastCloudKitAttemptDate"];
}

- (NSDate)lastCloudKitSyncDate
{
  v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"LastCloudKitSyncDate"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"LastCloudKitSyncDate"];
}

- (id)ckSyncEngineMetaData
{
  return [(BMSyncDatabase *)self valueForMetadataKey:@"com.apple.biome.sync.ckMetaData"];
}

- (void)saveCKSyncEngineMetaData:(id)a3
{
}

- (void)clearCKSyncEngineMetaData
{
  id v3 = +[NSNull null];
  [(BMSyncDatabase *)self setValue:v3 forMetadataKey:@"com.apple.biome.sync.ckMetaData"];
}

- (NSString)mergeableRecordValueKey
{
  return (NSString *)[(BMSyncDatabase *)self valueForMetadataKey:@"MergeableRecordValueKey"];
}

- (void)setMergeableRecordValueKey:(id)a3
{
}

- (BOOL)saveCKMergeableRecordValueRecordName:(id)a3 zoneName:(id)a4 mergeableRecordValueData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v15[0] = @"stream_name";
  v15[1] = @"record_name";
  v16[0] = v9;
  v16[1] = v8;
  v15[2] = @"server_mergeable_value";
  v16[2] = v10;
  char v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKMergeableRecordValue" VALUES:v13];

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForRecordName:(id)a3 zoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"stream_name = ?";
  v12[1] = v7;
  void v12[2] = @" AND record_name = ?";
  v12[3] = v6;
  id v10 = +[NSArray arrayWithObjects:v12 count:4];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKMergeableRecordValue" WHERE:v10];

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForZoneName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v9[0] = @"stream_name = ?";
  v9[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v9 count:2];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKMergeableRecordValue" WHERE:v7];

  return (char)fmdb;
}

- (void)enumerateMergeableRecordValuesForRecordName:(id)a3 zoneName:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, unsigned char *))a5;
  fmdb = self->_fmdb;
  v17[0] = @"stream_name = ?";
  v17[1] = v9;
  v17[2] = @" AND record_name = ?";
  v17[3] = v8;
  id v12 = +[NSArray arrayWithObjects:v17 count:4];
  char v13 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKMergeableRecordValue" COLUMNS:&off_1000729D0 WHERE:v12 ORDER_BY:&off_1000729E8 LIMIT:0];

  char v16 = 0;
  do
  {
    if (![v13 next]) {
      break;
    }
    id v15 = [v13 dataForColumn:@"server_mergeable_value"];
    v10[2](v10, v15, &v16);
  }
  while (!v16);
}

- (BOOL)getLatestTombstoneBookmarkForSiteIdentifier:(id)a3 inStream:(id)a4 segmentName:(id *)a5 segmentOffset:(unint64_t *)a6
{
  fmdb = self->_fmdb;
  v16[0] = @"stream = ?";
  v16[1] = a4;
  v16[2] = @"AND site = ?";
  void v16[3] = a3;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[NSArray arrayWithObjects:v16 count:4];
  char v13 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"TombstoneBookmark" COLUMNS:&off_100072A00 WHERE:v12];

  unsigned int v14 = [v13 next];
  if (v14)
  {
    if (a5)
    {
      *a5 = [v13 stringForColumn:@"segment_name"];
    }
    if (a6) {
      *a6 = (unint64_t)[v13 longForColumn:@"segment_offset"];
    }
  }

  return v14;
}

- (BOOL)saveLatestTombstoneBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    unsigned int v11 = [(BMSyncDatabase *)self getLatestTombstoneBookmarkForSiteIdentifier:v9 inStream:v10 segmentName:0 segmentOffset:0];
    fmdb = self->_fmdb;
    if (v11)
    {
      v22[0] = @"segment_name";
      char v13 = [v8 segmentName];
      v23[0] = v13;
      v22[1] = @"segment_offset";
      unsigned int v14 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v8 offset]);
      v23[1] = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      v21[0] = @"stream = ?";
      v21[1] = v10;
      void v21[2] = @" AND site = ?";
      v21[3] = v9;
      char v16 = +[NSArray arrayWithObjects:v21 count:4];
      unsigned __int8 v17 = [(_bmFMDatabase *)fmdb UPDATE:@"TombstoneBookmark" SET:v15 WHERE:v16];
    }
    else
    {
      v19[0] = @"stream";
      v19[1] = @"site";
      v20[0] = v10;
      v20[1] = v9;
      v19[2] = @"segment_name";
      char v13 = [v8 segmentName];
      void v20[2] = v13;
      v19[3] = @"segment_offset";
      unsigned int v14 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v8 offset]);
      v20[3] = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
      unsigned __int8 v17 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"TombstoneBookmark" VALUES:v15];
    }
  }
  else
  {
    unsigned __int8 v17 = 1;
  }

  return v17;
}

+ (id)createPrimaryDatabaseWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = [[BMSyncDatabase alloc] initWithQueue:v3];

  [(BMSyncDatabase *)v4 setName:@"primary"];
  [(BMSyncDatabase *)v4 setCorruptionHandler:&stru_10006D500];

  return v4;
}

+ (id)createDatabaseForAccount:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BMPaths pathForSharedSyncWithAccount:v5 domain:0];
  id v8 = [v7 stringByAppendingPathComponent:@"sync.db"];

  id v9 = [[BMSyncDatabase alloc] initWithPath:v8 options:0 queue:v6];
  id v10 = [v5 identifier];
  id v11 = [v10 length];
  id v12 = [v5 identifier];
  char v13 = v12;
  if ((unint64_t)v11 > 7)
  {
    unsigned int v14 = [v12 substringToIndex:8];
    [(BMSyncDatabase *)v9 setName:v14];
  }
  else
  {
    [(BMSyncDatabase *)v9 setName:v12];
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100026D54;
  v17[3] = &unk_10006CB58;
  id v18 = v5;
  id v15 = v5;
  [(BMSyncDatabase *)v9 setCorruptionHandler:v17];

  return v9;
}

+ (void)enumerateAccountSpecificDatabasesWithBlock:(id)a3
{
  id v5 = (void (**)(id, void *, void *))a3;
  if (!v5)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"BMSyncDatabase+Creation.m", 73, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  id v6 = dispatch_get_current_queue();
  id v7 = objc_alloc((Class)BMAccountManager);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v16 = [v7 initWithUseCase:BMUseCaseNotApplicable];
  id obj = [v16 accounts];
  id v8 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = +[BMSyncDatabase createDatabaseForAccount:v12 queue:v6];
        if ([v13 open])
        {
          v5[2](v5, v13, v12);
          [v13 close];
        }
        else
        {
          unsigned int v14 = __biome_log_for_category();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100046378(v22, v12, &v23, v14);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }
}

- (id)ckRecordsToSyncToCloudKitForZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [v5 addObjectsFromArray:&off_100072A30];
  if (v4)
  {
    v15[0] = @" AND stream_identifier = ?";
    v15[1] = v4;
    id v6 = +[NSArray arrayWithObjects:v15 count:2];
    [v5 addObjectsFromArray:v6];
  }
  id v7 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072A48 WHERE:v5];
  id v8 = 0;
  if ([v7 next])
  {
    do
    {
      if (!v8) {
        id v8 = objc_opt_new();
      }
      id v9 = [v7 stringForColumnIndex:0];
      uint64_t v10 = [v7 stringForColumnIndex:1];
      id v11 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v10 ownerName:CKCurrentUserDefaultName];
      id v12 = [objc_alloc((Class)CKRecordID) initWithRecordName:v9 zoneID:v11];
      [v8 addObject:v12];
    }
    while (([v7 next] & 1) != 0);
  }
  char v13 = [v8 allObjects];

  return v13;
}

- (id)recordFromSystemFieldsData:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v10];

  id v5 = v10;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000474DC();
    }

    id v8 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)CKRecord) initWithCoder:v4];
  }

  return v8;
}

- (id)createCKRecordFromRecordID:(id)a3 newRecord:(BOOL *)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [v8 recordName];
  id v10 = [v8 zoneID];
  id v11 = [v10 zoneName];
  id v12 = [(BMSyncDatabase *)self getSystemFieldsDataForRecordName:v9 zoneName:v11 recordType:a5];

  if (v12)
  {
    id v13 = [(BMSyncDatabase *)self recordFromSystemFieldsData:v12];
    if (v13) {
      goto LABEL_12;
    }
    unsigned int v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1000475B8();
    }
  }
  id v15 = objc_alloc((Class)CKRecord);
  id v16 = sub_1000272F8(a5);
  id v13 = [v15 initWithRecordType:v16 recordID:v8];

  if (v13)
  {
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    unsigned __int8 v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100047544();
    }

    id v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)saveSystemFieldsDataForRecord:(id)a3 syncToCloudKit:(id)a4 recordType:(unint64_t)a5 crdtDeleted:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v14 = [v10 recordID];
  id v15 = [v14 recordName];

  id v16 = [v10 recordID];
  unsigned __int8 v17 = [v16 zoneID];
  long long v18 = [v17 zoneName];

  unsigned __int8 v19 = [(BMSyncDatabase *)self ckRecordExists:v15 zoneName:v18 recordType:a5];
  long long v20 = [v10 recordChangeTag];

  if (!v20)
  {
    if ((v19 & 1) == 0)
    {
      fmdb = self->_fmdb;
      v40[0] = @"record_metadata";
      goto LABEL_20;
    }
    id v22 = 0;
LABEL_9:
    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    id v25 = [v10 recordChangeTag];

    if (v25)
    {
      if (!v22)
      {
        uint64_t v36 = +[NSNull null];
        [v24 setObject:v36 forKey:@"record_metadata"];

        if (!v11) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      [v24 setObject:v22 forKey:@"record_metadata"];
    }
    if (!v11)
    {
LABEL_14:
      if (v12) {
        [v24 setObject:v12 forKey:@"deleted_crdt"];
      }
      if (![v24 count])
      {

        goto LABEL_34;
      }
      id v26 = self->_fmdb;
      v42[0] = @"record_name = ?";
      v42[1] = v15;
      v42[2] = @" AND stream_identifier = ?";
      v42[3] = v18;
      void v42[4] = @" AND record_type = ?";
      long long v27 = +[NSNumber numberWithUnsignedInteger:a5];
      v42[5] = v27;
      long long v28 = +[NSArray arrayWithObjects:v42 count:6];
      LOBYTE(v26) = [(_bmFMDatabase *)v26 UPDATE:@"CKRecord" SET:v24 WHERE:v28];

      if (v26) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
LABEL_13:
    [v24 setObject:v11 forKey:@"sync_to_cloud_kit"];
    goto LABEL_14;
  }
  id v21 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v10 encodeSystemFieldsWithCoder:v21];
  id v22 = [v21 encodedData];

  if (v19) {
    goto LABEL_9;
  }
  fmdb = self->_fmdb;
  v40[0] = @"record_metadata";
  if (v22)
  {
    int v37 = 0;
    uint64_t v23 = v22;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v23 = +[NSNull null];
  id v22 = 0;
  int v37 = 1;
LABEL_21:
  v41[0] = v23;
  v41[1] = v15;
  v39 = v15;
  v40[1] = @"record_name";
  v40[2] = @"stream_identifier";
  long long v29 = &__kCFBooleanFalse;
  id v30 = v11;
  if (v11) {
    long long v29 = v11;
  }
  v41[2] = v18;
  v41[3] = v29;
  void v40[3] = @"sync_to_cloud_kit";
  v40[4] = @"deleted_crdt";
  v31 = v12;
  if (!v12)
  {
    v31 = +[NSNull null];
  }
  v41[4] = v31;
  void v40[5] = @"record_type";
  v32 = +[NSNumber numberWithUnsignedInteger:a5];
  v41[5] = v32;
  id v33 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:6];
  unsigned __int8 v34 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKRecord" VALUES:v33];

  if (!v12) {
  if (v37)
  }

  id v11 = v30;
  id v15 = v39;
  if ((v34 & 1) == 0)
  {
LABEL_30:
    id v35 = __biome_log_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      sub_10004762C();
    }
  }
LABEL_34:
}

- (id)getSystemFieldsDataForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v17[0] = @"record_name = ?";
  v17[1] = v8;
  v17[2] = @" AND record_type = ?";
  id v12 = +[NSNumber numberWithUnsignedInteger:a5];
  v17[3] = v12;
  void v17[4] = @" AND stream_identifier = ?";
  v17[5] = v9;
  id v13 = +[NSArray arrayWithObjects:v17 count:6];
  unsigned int v14 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072A60 WHERE:v13];

  if ([v14 next])
  {
    id v15 = [v14 dataForColumnIndex:0];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)resetCKRecordsMetaDataAndSetToSyncForZone:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v14[0] = @"record_metadata";
  id v7 = +[NSNull null];
  v15[0] = v7;
  v14[1] = @"local_mergeable_value";
  id v8 = +[NSNull null];
  v14[2] = @"sync_to_cloud_kit";
  v15[1] = v8;
  void v15[2] = &__kCFBooleanTrue;
  id v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v13[0] = @"stream_identifier = ?";
  v13[1] = v4;
  void v13[2] = @" AND record_type = ?";
  v13[3] = &off_100072D78;
  id v10 = +[NSArray arrayWithObjects:v13 count:4];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v9 WHERE:v10];

  unsigned __int8 v11 = [(BMSyncDatabase *)self clearCKMergeableRecordValueServerMergeableValuesForZoneName:v4];
  return fmdb & v11;
}

- (void)resetMetadataForRecord:(id)a3 zoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v16[0] = @"record_metadata";
  id v10 = +[NSNull null];
  v16[1] = @"local_mergeable_value";
  v17[0] = v10;
  unsigned __int8 v11 = +[NSNull null];
  v17[1] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v15[0] = @"record_name = ?";
  v15[1] = v6;
  void v15[2] = @" AND stream_identifier = ?";
  void v15[3] = v7;
  id v13 = +[NSArray arrayWithObjects:v15 count:4];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v12 WHERE:v13];

  if ((fmdb & 1) == 0)
  {
    unsigned int v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000476A0();
    }
  }
}

- (BOOL)saveCKRecordServerMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v15 = 1;
  if (![(BMSyncDatabase *)self ckRecordExists:v11 zoneName:v12 recordType:1])
  {
    fmdb = self->_fmdb;
    v21[0] = @"location_id";
    unsigned __int8 v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 primaryKey]);
    v22[0] = v17;
    v22[1] = &__kCFBooleanFalse;
    v21[1] = @"sync_to_cloud_kit";
    void v21[2] = @"deleting";
    void v22[2] = &__kCFBooleanFalse;
    v22[3] = v11;
    v21[3] = @"record_name";
    void v21[4] = @"stream_identifier";
    v21[5] = @"record_type";
    uint8_t v22[4] = v12;
    v22[5] = &off_100072D78;
    long long v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];
    LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKRecord" VALUES:v18];

    if ((fmdb & 1) == 0)
    {
      long long v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_100047708();
      }

      BOOL v15 = 0;
      if (v10) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    BOOL v15 = 1;
  }
  if (v10) {
LABEL_7:
  }
    BOOL v15 = [(BMSyncDatabase *)self saveCKMergeableRecordValueRecordName:v11 zoneName:v12 mergeableRecordValueData:v10];
LABEL_8:

  return v15;
}

- (BOOL)saveCKRecordHighestDeletedLocationRow:(id)a3 recordName:(id)a4 zoneName:(id)a5 recordExists:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  if (v6)
  {
    CFStringRef v23 = @"location_id";
    BOOL v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 primaryKey]);
    id v24 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22[0] = @"record_name = ?";
    v22[1] = v11;
    void v22[2] = @" AND stream_identifier = ?";
    v22[3] = v12;
    uint8_t v22[4] = @" AND record_type = ?";
    v22[5] = &off_100072D90;
    unsigned __int8 v17 = +[NSArray arrayWithObjects:v22 count:6];
    unsigned __int8 v18 = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v16 WHERE:v17];
  }
  else
  {
    v20[0] = @"location_id";
    BOOL v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 primaryKey]);
    v21[0] = v15;
    v21[1] = &__kCFBooleanFalse;
    v20[1] = @"sync_to_cloud_kit";
    void v20[2] = @"deleting";
    void v21[2] = &__kCFBooleanFalse;
    v21[3] = v11;
    v20[3] = @"record_name";
    void v20[4] = @"stream_identifier";
    v20[5] = @"record_type";
    void v21[4] = v12;
    v21[5] = &off_100072D90;
    id v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
    unsigned __int8 v18 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKRecord" VALUES:v16];
  }

  return v18;
}

- (BOOL)saveCKRecordLocalMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v15 = [(BMSyncDatabase *)self ckRecordExists:v11 zoneName:v12 recordType:1];
  fmdb = self->_fmdb;
  if (!v15)
  {
    v24[0] = @"location_id";
    unsigned __int8 v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 primaryKey]);
    v25[0] = v17;
    v25[1] = &__kCFBooleanFalse;
    v24[1] = @"sync_to_cloud_kit";
    void v24[2] = @"deleting";
    v25[2] = &__kCFBooleanFalse;
    v25[3] = v11;
    v24[3] = @"record_name";
    v24[4] = @"stream_identifier";
    void v25[4] = v12;
    v25[5] = &off_100072D78;
    id v21 = v10;
    v24[5] = @"record_type";
    v24[6] = @"local_mergeable_value";
    if (!v10)
    {
      id v21 = +[NSNull null];
    }
    v25[6] = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];
    unsigned __int8 v20 = [(_bmFMDatabase *)fmdb INSERT_INTO:@"CKRecord" VALUES:v22];

    if (!v10) {
    goto LABEL_12;
    }
  }
  CFStringRef v27 = @"local_mergeable_value";
  unsigned __int8 v17 = v10;
  if (!v10)
  {
    unsigned __int8 v17 = +[NSNull null];
  }
  long long v28 = v17;
  unsigned __int8 v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v26[0] = @"record_name = ?";
  v26[1] = v11;
  v26[2] = @" AND stream_identifier = ?";
  v26[3] = v12;
  void v26[4] = @" AND record_type = ?";
  v26[5] = &off_100072D78;
  unsigned __int8 v19 = +[NSArray arrayWithObjects:v26 count:6];
  unsigned __int8 v20 = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v18 WHERE:v19];

  if (!v10) {
LABEL_12:
  }

  return v20;
}

- (BOOL)clearCKRecordLocalMergeableValueAndSetToSyncForZone:(id)a3
{
  id v4 = a3;
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "clearCKRecordLocalMergeableValueAndSetToSyncForZone %@", buf, 0xCu);
  }

  fmdb = self->_fmdb;
  v13[0] = @"local_mergeable_value";
  id v7 = +[NSNull null];
  v13[1] = @"sync_to_cloud_kit";
  v14[0] = v7;
  v14[1] = &__kCFBooleanTrue;
  id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12[0] = @"stream_identifier = ?";
  v12[1] = v4;
  void v12[2] = @" AND record_type = ?";
  v12[3] = &off_100072D78;
  id v9 = +[NSArray arrayWithObjects:v12 count:4];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v8 WHERE:v9];

  unsigned __int8 v10 = [(BMSyncDatabase *)self clearCKMergeableRecordValueServerMergeableValuesForZoneName:v4];
  return fmdb & v10;
}

- (id)ckRecordForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v17[0] = @"record_name = ?";
  v17[1] = v8;
  void v17[2] = @" AND record_type = ?";
  id v12 = +[NSNumber numberWithUnsignedInteger:a5];
  v17[3] = v12;
  void v17[4] = @" AND stream_identifier = ?";
  v17[5] = v9;
  id v13 = +[NSArray arrayWithObjects:v17 count:6];
  unsigned int v14 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072A78 WHERE:v13];

  if ([v14 next]) {
    unsigned int v15 = [[BMSyncCKRecord alloc] initWithFMResultSet:v14];
  }
  else {
    unsigned int v15 = 0;
  }

  return v15;
}

- (BOOL)ckRecordExists:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v16[0] = @"record_name = ?";
  v16[1] = v8;
  void v16[2] = @" AND record_type = ?";
  id v12 = +[NSNumber numberWithUnsignedInteger:a5];
  void v16[3] = v12;
  void v16[4] = @" AND stream_identifier = ?";
  v16[5] = v9;
  id v13 = +[NSArray arrayWithObjects:v16 count:6];
  unsigned int v14 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072A90 WHERE:v13];

  LOBYTE(v12) = [v14 next];
  return (char)v12;
}

- (void)updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v13[0] = @"record_type = ?";
  v13[1] = &off_100072D78;
  void v13[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v7 = [v4 siteIdentifier];
  v13[3] = v7;
  void v13[4] = @"     AND stream = ?";
  id v8 = [v4 streamName];
  v13[5] = v8;
  void v13[6] = @"     AND day <= ?");
  id v9 = [v4 day];
  [v9 timeIntervalSinceReferenceDate];
  unsigned __int8 v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[7] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:8];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:&off_100072F38 WHERE:v11];

  if ((fmdb & 1) == 0)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100047770();
    }
  }
}

- (void)markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  CFStringRef v16 = @"location_id";
  id v7 = +[NSNull null];
  unsigned __int8 v17 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v15[0] = @"record_type = ?";
  v15[1] = &off_100072D78;
  void v15[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v9 = [v4 siteIdentifier];
  void v15[3] = v9;
  void v15[4] = @"     AND stream = ?";
  unsigned __int8 v10 = [v4 streamName];
  v15[5] = v10;
  v15[6] = @"     AND day <= ?");
  id v11 = [v4 day];
  [v11 timeIntervalSinceReferenceDate];
  id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[7] = v12;
  id v13 = +[NSArray arrayWithObjects:v15 count:8];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v8 WHERE:v13];

  if ((fmdb & 1) == 0)
  {
    unsigned int v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100047770();
    }
  }
}

- (void)enumerateRecordsWithBlock:(id)a3
{
  id v4 = (void (**)(id, BMSyncCKRecord *, unsigned char *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072AA8 JOIN:&off_100072AC0 WHERE:&off_100072AD8 ORDER_BY:&off_100072AF0 LIMIT:0];
  char v9 = 0;
  do
  {
    if (![v6 next]) {
      break;
    }
    id v8 = [[BMSyncCKRecord alloc] initWithFMResultSet:v6];
    v4[2](v4, v8, &v9);
  }
  while (!v9);
}

- (void)deleteCKRecordsAtOrBeforeLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v13[0] = @"record_type = ?";
  v13[1] = &off_100072D78;
  void v13[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v7 = [v4 siteIdentifier];
  v13[3] = v7;
  void v13[4] = @"     AND stream = ?";
  id v8 = [v4 streamName];
  v13[5] = v8;
  void v13[6] = @"     AND day <= ?");
  char v9 = [v4 day];
  [v9 timeIntervalSinceReferenceDate];
  unsigned __int8 v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[7] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:8];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKRecord" WHERE:v11];

  if ((fmdb & 1) == 0)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000477D8();
    }
  }
}

- (void)deleteCKRecordsForStreamName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v9[0] = @"stream_identifier = ?";
  v9[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v9 count:2];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKRecord" WHERE:v7];

  if ((fmdb & 1) == 0)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100047840();
    }
  }
}

- (void)deleteCKRecordAtLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = [v4 recordName];
  fmdb = self->_fmdb;
  v11[0] = @"record_name = ?";
  v11[1] = v6;
  void v11[2] = @" AND record_type = ?";
  v11[3] = &off_100072D78;
  v11[4] = @" AND stream_identifier = ?";
  id v8 = [v4 streamName];
  v11[5] = v8;
  char v9 = +[NSArray arrayWithObjects:v11 count:6];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKRecord" WHERE:v9];

  if ((fmdb & 1) == 0)
  {
    unsigned __int8 v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000478A8();
    }
  }
}

- (void)enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:(id)a3
{
  id v4 = (void (**)(id, id, unsigned char *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072B08 WHERE:&off_100072B20];
  char v16 = 0;
  unsigned int v15 = CKCurrentUserDefaultName;
  CFStringRef v7 = @"stream_identifier";
  do
  {
    if (!objc_msgSend(v6, "next", v15)) {
      break;
    }
    char v9 = [v6 stringForColumn:v7];
    uint64_t v10 = [v6 stringForColumn:@"record_name"];
    id v11 = (void *)v10;
    if (v9 && v10)
    {
      CFStringRef v12 = v7;
      id v13 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v9 ownerName:v15];
      id v14 = [objc_alloc((Class)CKRecordID) initWithRecordName:v11 zoneID:v13];
      v4[2](v4, v14, &v16);

      CFStringRef v7 = v12;
    }
  }
  while (!v16);
}

- (id)gatherAllCKSyncRecordRecordsToBeDeleted
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100034F00;
  char v9 = sub_100034F10;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034F18;
  v4[3] = &unk_10006D848;
  v4[4] = &v5;
  [(BMSyncDatabase *)self enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteAllCKRecordsInZone:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v10[0] = @"stream_identifier = ?";
  uint64_t v7 = [v4 zoneName];
  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb DELETE_FROM:@"CKRecord" WHERE:v8];

  if ((fmdb & 1) == 0)
  {
    char v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100047910(v4, v9);
    }
  }
}

- (unint64_t)ckRecordCountForRecordType:(unint64_t)a3
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"record_type = ?";
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  v12[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v12 count:2];
  char v9 = [(_bmFMDatabase *)fmdb SELECT_FROM:@"CKRecord" COLUMNS:&off_100072B38 WHERE:v8];

  if ([v9 next]) {
    id v10 = [v9 unsignedLongLongIntForColumnIndex:0];
  }
  else {
    id v10 = 0;
  }

  return (unint64_t)v10;
}

- (BOOL)upsertCKRecordWithLocation:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_fmdb = (id *)&self->_fmdb;
  id v9 = *p_fmdb;
  v26[0] = @"location_id = ?";
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 primaryKey]);
  v26[1] = v10;
  v26[2] = @" AND record_type = ?";
  v26[3] = &off_100072D78;
  id v11 = +[NSArray arrayWithObjects:v26 count:4];
  CFStringRef v12 = [v9 SELECT_FROM:COLUMNS:WHERE:@"CKRecord", &off_100072B50, v11];

  unsigned int v13 = [v12 next];
  id v14 = *p_fmdb;
  if (v13)
  {
    v25[0] = @"location_id =?";
    unsigned int v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 primaryKey]);
    v25[1] = v15;
    v25[2] = @" AND record_type = ?";
    v25[3] = &off_100072D78;
    char v16 = +[NSArray arrayWithObjects:v25 count:4];
    unsigned __int8 v17 = [v14 UPDATE:@"CKRecord" SET:&off_100072F60 WHERE:v16];
  }
  else
  {
    unsigned int v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 primaryKey:@"location_id"]);
    v24[0] = v15;
    v24[1] = &__kCFBooleanTrue;
    v23[1] = @"sync_to_cloud_kit";
    void v23[2] = @"deleting";
    void v24[2] = &__kCFBooleanFalse;
    v23[3] = @"record_name";
    char v16 = [v6 location];
    unsigned __int8 v18 = [v16 recordName];
    v24[3] = v18;
    v24[4] = v7;
    void v23[4] = @"stream_identifier";
    v23[5] = @"record_type";
    v24[5] = &off_100072D78;
    unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];
    unsigned __int8 v17 = [v14 INSERT_INTO:@"CKRecord" VALUES:v19];
  }
  if (v17)
  {
    BOOL v20 = 1;
  }
  else
  {
    id v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1000479A4(p_fmdb, v21);
    }

    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)disableAllCKSyncRecordsForSite:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v18[0] = &__kCFBooleanTrue;
  v17[0] = @"sync_to_cloud_kit";
  v17[1] = @"local_mergeable_value";
  id v10 = +[NSNull null];
  v18[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v16[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v16[1] = v6;
  void v16[2] = @" AND stream = ?");
  void v16[3] = v7;
  void v16[4] = @" AND deleted_crdt = ?";
  v16[5] = &__kCFBooleanFalse;
  void v16[6] = @" AND record_type = ?";
  v16[7] = &off_100072D78;
  CFStringRef v12 = +[NSArray arrayWithObjects:v16 count:8];
  unsigned __int8 v13 = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:v11 WHERE:v12];

  if ((v13 & 1) == 0)
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100047A3C();
    }
  }
  return v13;
}

- (BOOL)enableAllCKSyncRecordsPreviouslyDisabledForSite:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v14[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v14[1] = v6;
  void v14[2] = @" AND stream = ?");
  void v14[3] = v7;
  v14[4] = @" AND record_type = ?";
  void v14[5] = &off_100072D78;
  v14[6] = @" AND deleted_crdt = ?";
  v14[7] = &__kCFBooleanTrue;
  id v10 = +[NSArray arrayWithObjects:v14 count:8];
  unsigned __int8 v11 = [(_bmFMDatabase *)fmdb UPDATE:@"CKRecord" SET:&off_100072F88 WHERE:v10];

  if ((v11 & 1) == 0)
  {
    CFStringRef v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100047A3C();
    }
  }
  return v11;
}

+ (id)primaryDatabasePath
{
  id v2 = +[BMPaths syncDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"sync.db"];

  return v3;
}

+ (id)primaryDatabaseWALPath
{
  id v2 = [a1 primaryDatabasePath];
  id v3 = [v2 stringByAppendingString:@"-wal"];

  return v3;
}

- (BMSyncDatabase)initWithQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() primaryDatabasePath];
  id v6 = [(BMSyncDatabase *)self initWithPath:v5 options:0 queue:v4];

  return v6;
}

- (BMSyncDatabase)initWithPath:(id)a3
{
  return [(BMSyncDatabase *)self initWithPath:a3 options:0 queue:0];
}

- (BMSyncDatabase)initWithPath:(id)a3 queue:(id)a4
{
  return [(BMSyncDatabase *)self initWithPath:a3 options:0 queue:a4];
}

- (BMSyncDatabase)initWithPath:(id)a3 options:(unint64_t)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  unsigned __int8 v11 = v10;
  if (v9)
  {
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned __int8 v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"BMSyncDatabase.m", 304, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

  if (v11) {
LABEL_3:
  }
    dispatch_assert_queue_V2(v11);
LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)BMSyncDatabase;
  CFStringRef v12 = [(BMSyncDatabase *)&v19 init];
  unsigned __int8 v13 = v12;
  if (v12)
  {
    v12->__internal_state_ivar = 0;
    uint64_t v14 = +[_bmFMDatabase databaseWithPath:v9];
    fmdb = v13->_fmdb;
    v13->_fmdb = (_bmFMDatabase *)v14;

    [(_bmFMDatabase *)v13->_fmdb setShouldCacheStatements:1];
    v13->_options = a4;
    objc_storeStrong((id *)&v13->_queue, a5);
    loggingSuffix = v13->_loggingSuffix;
    v13->_loggingSuffix = (NSString *)&stru_10006DB68;
  }
  return v13;
}

- (void)setName:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_name, "isEqual:") & 1) == 0)
  {
    if (v7)
    {
      uint64_t v5 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"[%@]", v7];
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = v5;
    }
    else
    {
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = (NSString *)&stru_10006DB68;
    }

    objc_storeStrong((id *)&self->_name, a3);
  }
}

- (void)setState:(unint64_t)a3 error:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->__error_ivar, a4);
  self->__internal_state_ivar = a3;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    if (a3 > 9) {
      CFStringRef v10 = @"Unknown";
    }
    else {
      CFStringRef v10 = off_10006D910[a3];
    }
    int v13 = 138412546;
    uint64_t v14 = loggingSuffix;
    __int16 v15 = 2112;
    CFStringRef v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BMSyncDatabase%@ transitioned to state: %@", (uint8_t *)&v13, 0x16u);
  }

  if (a3 == 7)
  {
    unsigned __int8 v11 = __biome_log_for_category();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v12) {
        sub_100047C1C();
      }
    }
    else if (v12)
    {
      sub_100047BA4();
    }
    goto LABEL_18;
  }
  if (a3 == 9)
  {
    unsigned __int8 v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100047B1C();
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v7)
  {
    unsigned __int8 v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100047AA4();
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)setState:(unint64_t)a3 errorFormat:(id)a4
{
  id v6 = a4;
  if ([v6 length]) {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v8];
  }
  else {
    id v7 = 0;
  }
  [(BMSyncDatabase *)self setState:a3 error:v7];
}

- (BOOL)_tryOpen:(unint64_t)a3
{
  if ((id)[(BMSyncDatabase *)self internalState] == (id)4) {
    return 1;
  }
  unint64_t v7 = a3 + 1;
  if (v7 >= 0xA)
  {
    [(BMSyncDatabase *)self setState:9 error:@"recursion max"];
    return 0;
  }
  BOOL v6 = 1;
  switch([(BMSyncDatabase *)self internalState])
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      CFStringRef v8 = &stru_10006DB68;
      id v9 = self;
      uint64_t v10 = 3;
      goto LABEL_97;
    case 2uLL:
      unsigned __int8 v11 = [(_bmFMDatabase *)self->_fmdb databasePath];
      id v12 = [v11 stringByDeletingLastPathComponent];

      int v13 = +[NSFileManager defaultManager];
      id v81 = 0;
      unsigned int v14 = [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v81];
      id v15 = v81;

      if (v14 && !v15) {
        goto LABEL_11;
      }
      v53 = [v15 localizedFailureReason];
      [(BMSyncDatabase *)self setState:9, @"failed to create path at: %@, reason: %@", v12, v53 errorFormat];

      goto LABEL_61;
    case 3uLL:
      if (self->_flags) {
        unsigned int v16 = 6;
      }
      else {
        unsigned int v16 = 2;
      }
      if (self->_options) {
        uint64_t v17 = v16 | 0x600000;
      }
      else {
        uint64_t v17 = v16;
      }
      unsigned __int8 v18 = [(_bmFMDatabase *)self->_fmdb openWithFlags:v17];
      fmdb = self->_fmdb;
      if ((v18 & 1) == 0)
      {
        int v55 = [(_bmFMDatabase *)fmdb lastErrorCode];
        if (v55 > 13)
        {
          if (v55 == 14)
          {
            v62 = +[NSFileManager defaultManager];
            v63 = [(_bmFMDatabase *)self->_fmdb databasePath];
            unsigned __int8 v64 = [v62 fileExistsAtPath:v63];

            if ((v64 & 1) == 0)
            {
              CFStringRef v8 = &stru_10006DB68;
              id v9 = self;
              uint64_t v10 = 2;
              goto LABEL_97;
            }
            goto LABEL_85;
          }
          if (v55 != 23)
          {
LABEL_85:
            int v65 = sqlite3_system_errno((sqlite3 *)[(_bmFMDatabase *)self->_fmdb sqliteHandle]);
            if (v65) {
              v66 = strerror(v65);
            }
            else {
              v66 = (void *)sqlite3_errstr([(_bmFMDatabase *)self->_fmdb lastErrorCode]);
            }
            v57 = +[NSString stringWithUTF8String:v66];
            [(BMSyncDatabase *)self setState:9 error:v57];
            goto LABEL_94;
          }
          if ((self->_options & 1) == 0)
          {
            CFStringRef v8 = &stru_10006DB68;
            id v9 = self;
            uint64_t v10 = 6;
            goto LABEL_97;
          }
        }
        else
        {
          if (v55 == 5)
          {
            CFStringRef v8 = &stru_10006DB68;
            id v9 = self;
            uint64_t v10 = 5;
            goto LABEL_97;
          }
          if (v55 != 11) {
            goto LABEL_85;
          }
        }
        CFStringRef v8 = &stru_10006DB68;
        goto LABEL_78;
      }
      if (![(_bmFMDatabase *)fmdb executeStatements:@"PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;"])
      {
        v57 = __biome_log_for_category();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_100047C84(v57);
        }
LABEL_94:

        goto LABEL_95;
      }
      if (![(_bmFMDatabase *)self->_fmdb tableExists:@"Metadata"])
      {
        self->_flags = 1;
        [(_bmFMDatabase *)self->_fmdb beginTransaction];
        v60 = self->_fmdb;
        v61 = sub_100037FD0();
        [(_bmFMDatabase *)v60 executeStatements:v61];

        [(_bmFMDatabase *)self->_fmdb setUserVersion:31];
        if ([(_bmFMDatabase *)self->_fmdb commit])
        {
LABEL_80:
          CFStringRef v8 = &stru_10006DB68;
          id v9 = self;
          uint64_t v10 = 4;
          goto LABEL_97;
        }
LABEL_95:
        CFStringRef v8 = &stru_10006DB68;
LABEL_96:
        id v9 = self;
        uint64_t v10 = 9;
        goto LABEL_97;
      }
      unsigned int v20 = [(_bmFMDatabase *)self->_fmdb userVersion];
      if (v20 >= 0x20)
      {
        CFStringRef v8 = @"version too new";
LABEL_78:
        id v9 = self;
        uint64_t v10 = 7;
        goto LABEL_97;
      }
      unsigned int v67 = v20;
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (v67 <= 0x10 && has_internal_diagnostics)
      {
        CFStringRef v8 = @"internal build version < 17";
        goto LABEL_78;
      }
      int v72 = os_variant_has_internal_diagnostics();
      if (v67 - 17 <= 2 && v72)
      {
        CFStringRef v8 = @"internal build version between 17 and 19";
        goto LABEL_78;
      }
      if (v67 > 0x1E) {
        goto LABEL_80;
      }
      CFStringRef v8 = &stru_10006DB68;
      id v9 = self;
      uint64_t v10 = 8;
LABEL_97:
      -[BMSyncDatabase setState:errorFormat:](v9, "setState:errorFormat:", v10, v8, v73);
      id v21 = self;
      SEL v22 = a2;
      unint64_t v23 = v7;
      return [(BMSyncDatabase *)v21 performSelector:v22 withObject:v23] != 0;
    case 4uLL:
      return v6;
    case 6uLL:
      if (v7) {
        return 0;
      }
      [(BMSyncDatabase *)self setState:3 errorFormat:&stru_10006DB68];
      id v21 = self;
      SEL v22 = a2;
      unint64_t v23 = 0;
      return [(BMSyncDatabase *)v21 performSelector:v22 withObject:v23] != 0;
    case 7uLL:
      if (self->_flags) {
        goto LABEL_95;
      }
      [(_bmFMDatabase *)self->_fmdb close];
      id v24 = +[NSFileManager defaultManager];
      id v25 = [(_bmFMDatabase *)self->_fmdb databasePath];
      id v76 = 0;
      unsigned int v26 = [v24 removeItemAtPath:v25 error:&v76];
      id v12 = v76;

      if (v26 && !v12) {
        goto LABEL_28;
      }
      v58 = [v12 domain];
      if (![v58 isEqual:NSCocoaErrorDomain])
      {

LABEL_82:
        [(BMSyncDatabase *)self setState:9, @"failed to delete corrupt database file: %@", v12 errorFormat];
        goto LABEL_103;
      }
      id v59 = [v12 code];

      if (v59 != (id)4) {
        goto LABEL_82;
      }
LABEL_28:

      CFStringRef v27 = +[NSFileManager defaultManager];
      long long v28 = [(_bmFMDatabase *)self->_fmdb databasePath];
      long long v29 = [v28 stringByAppendingString:@"-wal"];
      id v75 = 0;
      unsigned int v30 = [v27 removeItemAtPath:v29 error:&v75];
      id v12 = v75;

      if (v30 && !v12) {
        goto LABEL_32;
      }
      v31 = [v12 domain];
      if ([v31 isEqual:NSCocoaErrorDomain])
      {
        id v32 = [v12 code];

        if (v32 == (id)4)
        {
LABEL_32:

          id v33 = +[NSFileManager defaultManager];
          unsigned __int8 v34 = [(_bmFMDatabase *)self->_fmdb databasePath];
          id v35 = [v34 stringByAppendingString:@"-shm"];
          id v74 = 0;
          unsigned int v36 = [v33 removeItemAtPath:v35 error:&v74];
          id v12 = v74;

          if (v36 && !v12)
          {
LABEL_36:
            uint64_t v39 = [(BMSyncDatabase *)self corruptionHandler];
            id v15 = (id)v39;
            if (v39) {
              (*(void (**)(uint64_t))(v39 + 16))(v39);
            }
LABEL_11:
            self->_flags |= 1uLL;
            [(BMSyncDatabase *)self setState:3 errorFormat:&stru_10006DB68];
LABEL_61:
            id v54 = [(BMSyncDatabase *)self performSelector:a2 withObject:v7];

            goto LABEL_104;
          }
          int v37 = [v12 domain];
          if ([v37 isEqual:NSCocoaErrorDomain])
          {
            id v38 = [v12 code];

            if (v38 == (id)4) {
              goto LABEL_36;
            }
          }
          else
          {
          }
          unint64_t v73 = (unint64_t)v12;
          CFStringRef v69 = @"failed to delete corrupt database SHM file: %@";
          goto LABEL_102;
        }
      }
      else
      {
      }
      [(BMSyncDatabase *)self setState:9, @"failed to delete corrupt database WAL file: %@", v12 errorFormat];
LABEL_103:
      id v54 = [(BMSyncDatabase *)self performSelector:a2 withObject:v7];
LABEL_104:
      BOOL v6 = v54 != 0;

      return v6;
    case 8uLL:
      unsigned int v40 = [(_bmFMDatabase *)self->_fmdb userVersion];
      if (v40 > 0x1E) {
        goto LABEL_80;
      }
      LODWORD(v41) = v40;
      while (2)
      {
        uint64_t v41 = (v41 + 1);
        long long v42 = __biome_log_for_category();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          loggingSuffix = self->_loggingSuffix;
          *(_DWORD *)buf = 138412546;
          v84 = loggingSuffix;
          __int16 v85 = 1024;
          int v86 = v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "BMSyncDatabase%@ Migrating database to version %u", buf, 0x12u);
        }

        long long v44 = sub_100038020();
        long long v45 = +[NSNumber numberWithUnsignedInt:v41];
        id v12 = [v44 objectForKeyedSubscript:v45];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v46 = [v12 customFunctionName];
          SEL v47 = NSSelectorFromString(v46);
          if (v47)
          {
            if (((uint64_t (*)(BMSyncDatabase *, SEL))[(BMSyncDatabase *)self methodForSelector:v47])(self, v47))goto LABEL_45; {
            v71 = [(_bmFMDatabase *)self->_fmdb lastError];
            }
            [(BMSyncDatabase *)self setState:7, @"custom migration to version %u failed with error %@", v41, v71 errorFormat];

LABEL_108:
            id v54 = [(BMSyncDatabase *)self performSelector:a2 withObject:v7];
LABEL_67:

            goto LABEL_104;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [(_bmFMDatabase *)self->_fmdb beginTransaction];
            [(_bmFMDatabase *)self->_fmdb setUserVersion:v41];
            if (![(_bmFMDatabase *)self->_fmdb commit])
            {
              CFStringRef v69 = &stru_10006DB68;
LABEL_102:
              -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, v69, v73);
              goto LABEL_103;
            }
LABEL_58:

            if (v41 == 31) {
              goto LABEL_80;
            }
            continue;
          }
          long long v48 = [v12 sqlStatements];
          [(_bmFMDatabase *)self->_fmdb beginTransaction];
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v46 = v48;
          id v49 = [(NSString *)v46 countByEnumeratingWithState:&v77 objects:v82 count:16];
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v78;
            while (2)
            {
              for (i = 0; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v78 != v51) {
                  objc_enumerationMutation(v46);
                }
                if (![(_bmFMDatabase *)self->_fmdb executeStatements:*(void *)(*((void *)&v77 + 1) + 8 * i)])
                {
                  v56 = [(_bmFMDatabase *)self->_fmdb lastError];
                  [(BMSyncDatabase *)self setState:7, @"migration to version %u failed with error %@", v41, v56 errorFormat];

                  id v54 = [(BMSyncDatabase *)self performSelector:a2 withObject:v7];
                  goto LABEL_67;
                }
              }
              id v50 = [(NSString *)v46 countByEnumeratingWithState:&v77 objects:v82 count:16];
              if (v50) {
                continue;
              }
              break;
            }
          }

          [(_bmFMDatabase *)self->_fmdb setUserVersion:v41];
          if ([(_bmFMDatabase *)self->_fmdb commit])
          {
LABEL_45:

            goto LABEL_58;
          }
        }
        break;
      }
      [(BMSyncDatabase *)self setState:9 errorFormat:&stru_10006DB68];
      goto LABEL_108;
    case 9uLL:
      return 0;
    default:
      unint64_t v73 = [(BMSyncDatabase *)self internalState];
      CFStringRef v8 = @"unhandled state %llu";
      goto LABEL_96;
  }
}

- (BOOL)open
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }

  return [(BMSyncDatabase *)self _tryOpen:0];
}

- (unint64_t)state
{
  switch([(BMSyncDatabase *)self internalState])
  {
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
      id v2 = __biome_log_for_category();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        sub_100047CC8();
      }

      goto LABEL_5;
    case 4uLL:
      unint64_t result = 1;
      break;
    case 6uLL:
      unint64_t result = 2;
      break;
    case 9uLL:
      unint64_t result = 3;
      break;
    default:
LABEL_5:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (void)close
{
  p_fmdb = &self->_fmdb;
  if ([(_bmFMDatabase *)self->_fmdb isOpen] && ![(_bmFMDatabase *)*p_fmdb close])
  {
    id v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100047D40((uint64_t)self, (id *)p_fmdb, v4);
    }
  }
  if ((id)[(BMSyncDatabase *)self internalState] == (id)4) {
    [(BMSyncDatabase *)self setState:1 error:0];
  }
}

- (BOOL)beginTransaction
{
  return [(_bmFMDatabase *)self->_fmdb beginDeferredTransaction];
}

- (BOOL)isInTransaction
{
  return [(_bmFMDatabase *)self->_fmdb isInTransaction];
}

- (BOOL)commit
{
  return [(_bmFMDatabase *)self->_fmdb commit];
}

- (BOOL)rollback
{
  return [(_bmFMDatabase *)self->_fmdb rollback];
}

- (void)clearCachedStatements
{
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    int v5 = 138412290;
    BOOL v6 = loggingSuffix;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BMSyncDatabase%@ clearing cached statements", (uint8_t *)&v5, 0xCu);
  }

  [(_bmFMDatabase *)self->_fmdb clearCachedStatements];
}

- (void)disableStatementCachingForBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(_bmFMDatabase *)self->_fmdb setShouldCacheStatementsWithoutClearingExistingStatements:0];
  v4[2]();
  [(_bmFMDatabase *)self->_fmdb setShouldCacheStatementsWithoutClearingExistingStatements:1];
}

- (id)valueForMetadataKey:(id)a3
{
  id v3 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"SELECT value FROM Metadata WHERE key=?", a3];
  if ([v3 next])
  {
    id v4 = [v3 objectForColumnIndex:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
}

- (unsigned)version
{
  return [(_bmFMDatabase *)self->_fmdb userVersion];
}

- (BOOL)migration_StarSkySchema11ToSydRoSchema12
{
  unsigned int v21 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"PRAGMA foreign_keys=OFF"];
  unsigned int v20 = [(_bmFMDatabase *)self->_fmdb beginTransaction];
  id v3 = [objc_alloc((Class)NSMutableSet) initWithArray:&off_100072C88];
  id v4 = objc_opt_new();
  int v5 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"SELECT type, name FROM sqlite_schema WHERE tbl_name = 'CRDTLocation'"];
  if ([v5 next])
  {
    do
    {
      BOOL v6 = [v5 stringForColumn:@"type"];
      unint64_t v7 = [v5 stringForColumn:@"name"];
      if (![v6 isEqualToString:@"table"]
        || ([v7 isEqualToString:@"CRDTLocation"] & 1) == 0)
      {
        [v4 addObject:v7];
      }
    }
    while (([v5 next] & 1) != 0);
  }
  if ([v3 isEqualToSet:v4])
  {
    unsigned int v8 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE TABLE new_CRDTLocation (id INTEGER primary key, stream STRING NOT NULL, site STRING NOT NULL, day INTEGER NOT NULL, state INTEGER NOT NULL)"];
    unsigned int v9 = v21 & v20 & v8 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"INSERT INTO new_CRDTLocation SELECT * FROM CRDTLocation"];
    unsigned int v10 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"DROP TABLE CRDTLocation"];
    unsigned int v11 = v10 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"ALTER TABLE new_CRDTLocation RENAME TO CRDTLocation"];
    unsigned int v12 = v9 & v11 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE INDEX IF NOT EXISTS idx_crdt_location ON CRDTLocation(stream, site, day)"];
    unsigned int v13 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE INDEX IF NOT EXISTS idx_crdt_location_state ON CRDTLocation(stream, site, state, day DESC)"];
    unsigned int v14 = v13 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE TABLE IF NOT EXISTS CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, mergeable_value_delta BLOB, deleting BOOL, FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));"];
    unsigned int v15 = v12 & v14 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)"];
    uint64_t v16 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"PRAGMA foreign_key_check"];
    unsigned int v17 = v15 & ~[(id)v16 next];

    [(_bmFMDatabase *)self->_fmdb setUserVersion:12];
    LODWORD(v16) = [(_bmFMDatabase *)self->_fmdb commit];
    BOOL v18 = v17 & v16 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"PRAGMA foreign_keys=ON"];
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)migration_Schema20ToSchema21
{
  unsigned __int8 v3 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"PRAGMA foreign_keys=OFF"];
  char v4 = v3 & [(_bmFMDatabase *)self->_fmdb beginTransaction];
  unsigned __int8 v5 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE TABLE new_CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, local_mergeable_value BLOB, deleting BOOL,  PRIMARY KEY (stream_identifier, record_name), FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));"];
  char v6 = v4 & v5 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"INSERT INTO new_CKRecord SELECT location_id, sync_to_cloud_kit, record_metadata, record_name, stream_identifier, local_mergeable_value, deleting FROM CKRecord"];
  unsigned __int8 v7 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"DROP TABLE CKRecord"];
  char v8 = v7 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"ALTER TABLE new_CKRecord RENAME TO CKRecord"];
  char v9 = v6 & v8 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)"];
  char v10 = v9 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"CREATE TABLE IF NOT EXISTS CKMergeableRecordValue (stream_name STRING, record_name STRING, server_mergeable_value BLOB, FOREIGN KEY (stream_name, record_name) REFERENCES CKRecord(stream_identifier, record_name))"];
  uint64_t v11 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"PRAGMA foreign_key_check"];
  char v12 = v10 & ~[(id)v11 next];

  [(_bmFMDatabase *)self->_fmdb setUserVersion:21];
  LOBYTE(v11) = [(_bmFMDatabase *)self->_fmdb commit];
  return v12 & v11 & [(_bmFMDatabase *)self->_fmdb executeStatements:@"PRAGMA foreign_keys=ON"];
}

- (BOOL)migration_Schema27ToSchema28
{
  return 1;
}

- (NSString)error
{
  return self->__error_ivar;
}

- (unint64_t)internalState
{
  return self->__internal_state_ivar;
}

- (id)corruptionHandler
{
  return self->_corruptionHandler;
}

- (void)setCorruptionHandler:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_corruptionHandler, 0);
  objc_storeStrong((id *)&self->__error_ivar, 0);
  objc_storeStrong((id *)&self->_loggingSuffix, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_fmdb, 0);
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  char v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "recordSessionStart: %@", buf, 0xCu);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v21[0] = v10;
  unsigned int v15 = +[NSNumber numberWithUnsignedInteger:a4, @"session_id", @"transport"];
  v21[1] = v15;
  void v20[2] = @"reason";
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:a5];
  void v21[2] = v16;
  v20[3] = @"is_reciprocal";
  unsigned int v17 = +[NSNumber numberWithBool:v6];
  v21[3] = v17;
  void v20[4] = @"start_timestamp";
  BOOL v18 = +[NSNumber numberWithDouble:Current];
  void v21[4] = v18;
  objc_super v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  [(_bmFMDatabase *)fmdb INSERT_INTO:@"SyncSessionLog" VALUES:v19];
}

- (void)recordSessionEnd:(id)a3 timeSincePreviousSync:(double)a4
{
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  char v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "recordSessionEnd: %@", buf, 0xCu);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v16[0] = @"end_timestamp";
  uint64_t v11 = +[NSNumber numberWithDouble:Current];
  v16[1] = @"time_since_previous_sync";
  v17[0] = v11;
  char v12 = +[NSNumber numberWithDouble:a4];
  v17[1] = v12;
  unsigned int v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v15[0] = @"session_id = ?";
  v15[1] = v6;
  unsigned int v14 = +[NSArray arrayWithObjects:v15 count:2];
  [(_bmFMDatabase *)fmdb UPDATE:@"SyncSessionLog" SET:v13 WHERE:v14];
}

- (void)recordMessageToDeviceIdentifier:(id)a3 sessionID:(id)a4 messageID:(unint64_t)a5 reachable:(BOOL)a6 bytes:(unint64_t)a7 isReciprocal:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "recordMessageToDeviceIdentifier: %@, %@", buf, 0x16u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v27[0] = v15;
  unsigned int v20 = +[NSNumber numberWithUnsignedInteger:a5, @"session_id", @"message_id"];
  v27[1] = v20;
  v27[2] = v14;
  v26[2] = @"device_identifier";
  v26[3] = @"reachable";
  unsigned int v21 = +[NSNumber numberWithBool:v10];
  v27[3] = v21;
  void v26[4] = @"atom_batch_bytes";
  SEL v22 = +[NSNumber numberWithUnsignedInteger:a7];
  v27[4] = v22;
  v26[5] = @"is_reciprocal";
  id v23 = +[NSNumber numberWithBool:v8];
  v27[5] = v23;
  void v26[6] = @"timestamp";
  id v24 = +[NSNumber numberWithDouble:Current];
  void v27[6] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];
  [(_bmFMDatabase *)fmdb INSERT_INTO:@"SyncMessageLog" VALUES:v25];
}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 sessionID:(id)a5 messageID:(unint64_t)a6 ownerSite:(id)a7 originatingSite:(id)a8 eventCreatedAt:(double)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v21 = __biome_log_for_category();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100047EB8(a3, v21);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v30[0] = v17;
  id v24 = +[NSNumber numberWithUnsignedInteger:a6, @"session_id", @"message_id"];
  v30[1] = v24;
  v30[2] = v16;
  v29[2] = @"stream";
  v29[3] = @"owning_site_identifier";
  v30[3] = v18;
  v30[4] = v19;
  void v29[4] = @"relayed_by_site_identifier";
  v29[5] = @"merge_result";
  id v25 = +[NSNumber numberWithUnsignedInteger:a3];
  v30[5] = v25;
  v29[6] = @"event_created_at";
  unsigned int v26 = +[NSNumber numberWithDouble:a9];
  v30[6] = v26;
  v29[7] = @"synced_at";
  CFStringRef v27 = +[NSNumber numberWithDouble:Current];
  v30[7] = v27;
  long long v28 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:8];
  [(_bmFMDatabase *)fmdb INSERT_INTO:@"AtomMergedLog" VALUES:v28];
}

- (unint64_t)countAtomMergeResultRecords
{
  id v2 = [(_bmFMDatabase *)self->_fmdb SELECT_FROM:@"AtomMergedLog" COLUMNS:&off_100072CA0 WHERE:0];
  unint64_t v3 = 0;
  if ([v2 next])
  {
    do
      LODWORD(v3) = [v2 intForColumnIndex:0];
    while (([v2 next] & 1) != 0);
    unint64_t v3 = (int)v3;
  }

  return v3;
}

- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3
{
  BOOL v8 = (void (**)(id, void *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned __int8 v5 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"select transport as transport_type, session_duration.session_id, time_since_previous_sync, duration, reachable_peers_cnt, is_reciprocal, reason as sync_reason, cast((select count(*) from DevicePeer) as text) as known_peers_cnt_str, cast(reachable_peers_cnt as real) / (select count(*) from DevicePeer) as peer_availabilty_pct, avg_sync_latency, atoms_dropped_cnt, atoms_causality_violation_cnt, atoms_received_cnt, atoms_relayed_cnt, relay_earliness, relay_unseen_peer_atom_cnt, atom_batch_bytes from(select transport, session_id, is_reciprocal, reason, (end_timestamp - start_timestamp) as duration, time_since_previous_sync from SyncSessionLog group by session_id, is_reciprocal, reason) as session_duration left join(select session_id, count(distinct device_identifier) as reachable_peers_cnt from SyncMessageLog group by session_id) as reachable_peers on session_duration.session_id=reachable_peers.session_id left join(select session_id, avg(case when event_created_at <> 0 then synced_at - event_created_at else null end) as avg_sync_latency from AtomMergedLog group by session_id) as sync_latency on session_duration.session_id=sync_latency.session_id left join(select a.session_id, sum(case when a.merge_result=1 THEN 1 else 0 end) as atoms_dropped_cnt, sum(case when a.merge_result=2 THEN 1 else 0 end) as atoms_causality_violation_cnt, sum(case when a.merge_result=3 THEN 1 else 0 end) as atoms_received_cnt from AtomMergedLog as a group by a.session_id) as merge_results on session_duration.session_id=merge_results.session_id left join(select session_id, count(*) as atoms_relayed_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where a.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) group by session_id) as relay_count on session_duration.session_id=relay_count.session_id left join(select relayed.session_id, avg(timestamp - synced_at) as relay_earliness from(select atom.session_id, synced_at, timestamp from AtomMergedLog as atom, SyncMessageLog as message where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where atom.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) and device_identifier=owning_site_identifier and reachable=1 and timestamp > synced_at order by timestamp asc limit 1) as relayed group by relayed.session_id) as earliness on session_duration.session_id=earliness.session_id left join(select session_id, count(*) as relay_unseen_peer_atom_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where device_identifier=owning_site_identifier and reachable=1) group by session_id) as atom_relay_unseen_device on session_duration.session_id=atom_relay_unseen_device.session_id left join(select session_id, sum(atom_batch_bytes) as atom_batch_bytes from SyncMessageLog group by session_id) as batch_bytes on session_duration.session_id=batch_bytes.session_id"];;
  if ([v5 next])
  {
    do
    {
      unsigned __int8 v7 = [v5 resultDictionary];
      v8[2](v8, v7);
    }
    while (([v5 next] & 1) != 0);
  }
  [v5 close];
}

- (void)compactAndDeleteSessionLogs
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  [(_bmFMDatabase *)self->_fmdb executeUpdate:@"DELETE FROM SyncMessageLog WHERE timestamp <> (SELECT max(timestamp) FROM SyncMessageLog message WHERE device_identifier=message.device_identifier)"];
  [(_bmFMDatabase *)self->_fmdb executeUpdate:@"DELETE FROM SyncSessionLog"];
  fmdb = self->_fmdb;

  [(_bmFMDatabase *)fmdb executeUpdate:@"DELETE FROM AtomMergedLog"];
}

- (void)enforceMaxSessionLogPrunePolicy
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  [(_bmFMDatabase *)self->_fmdb executeUpdate:@"DELETE FROM SyncSessionLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog ORDER BY start_timestamp DESC LIMIT 100)"];
  [(_bmFMDatabase *)self->_fmdb executeUpdate:@"DELETE FROM SyncMessageLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)"];
  [(_bmFMDatabase *)self->_fmdb executeUpdate:@"DELETE FROM AtomMergedLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)"];
}

- (void)runVacuumingTask:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003AF2C;
  v6[3] = &unk_10006D968;
  id v4 = a3;
  id v7 = v4;
  if ([(BMSyncDatabase *)self vacuumWithShouldContinueBlock:v6])
  {
    unsigned __int8 v5 = objc_opt_new();
    [(BMSyncDatabase *)self setDateOfLastVacuum:v5];
  }
  +[BMCoreAnalyticsEvents sendSyncDatabaseSummaryWithDatabase:self];
}

- (NSDate)dateOfLastVacuum
{
  id v2 = [(BMSyncDatabase *)self valueForMetadataKey:@"LastVacuumDate"];
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setDateOfLastVacuum:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(BMSyncDatabase *)self setValue:v4 forMetadataKey:@"LastVacuumDate"];
}

- (unint64_t)_numPagesToVacuum
{
  unint64_t v3 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"PRAGMA page_count"];
  id v29 = 0;
  unsigned __int8 v4 = [v3 nextWithError:&v29];
  id v5 = v29;
  if (v4)
  {
    id v6 = [v3 unsignedLongLongIntForColumnIndex:0];
    [v3 close];
    id v7 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"PRAGMA freelist_count"];
    id v28 = v5;
    unsigned __int8 v8 = [v7 nextWithError:&v28];
    id v9 = v28;

    if (v8)
    {
      BOOL v10 = [v7 unsignedLongLongIntForColumnIndex:0];
      [v7 close];
      uint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        id v31 = v6;
        __int16 v32 = 2048;
        id v33 = v10;
        __int16 v34 = 2048;
        double v35 = (double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock calculating pages to vacuum -- pageCount %tu freeCount %tu loadFactor %f", buf, 0x20u);
      }

      if ((double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6 <= 0.85 || (unint64_t)v10 > 0x3FF)
      {
        unint64_t v19 = (unint64_t)((double)(unint64_t)v10 * 0.8);
        goto LABEL_18;
      }
      char v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v31 = v6;
        __int16 v32 = 2048;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
          buf,
          0x16u);
      }
    }
    else
    {
      unsigned int v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100047F50((uint64_t)v9, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    unint64_t v19 = 0;
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100047FBC((uint64_t)v5, v7, v13, v14, v15, v16, v17, v18);
    }
    unint64_t v19 = 0;
    id v9 = v5;
  }
LABEL_18:

  return v19;
}

- (BOOL)vacuumWithShouldContinueBlock:(id)a3
{
  unsigned __int8 v4 = (unsigned int (**)(void))a3;
  id v5 = [(_bmFMDatabase *)self->_fmdb executeQuery:@"PRAGMA auto_vacuum"];
  id v53 = 0;
  unsigned __int8 v6 = [v5 nextWithError:&v53];
  id v7 = v53;
  if ((v6 & 1) == 0)
  {
    uint64_t v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000480D0((uint64_t)v7, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_23;
  }
  unsigned int v8 = [v5 intForColumnIndex:0];
  [v5 close];
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock current vacuum mode is %u", buf, 8u);
  }

  if (v4 && !v4[2](v4)) {
    goto LABEL_24;
  }
  if (v8 != 2)
  {
    unsigned __int8 v27 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"PRAGMA auto_vacuum = 2"];
    id v28 = __biome_log_for_category();
    id v29 = v28;
    if ((v27 & 1) == 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100048098(v29, v32, v33, v34, v35, v36, v37, v38);
      }

      goto LABEL_24;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully set auto_vacuum to INCREMENTAL", buf, 2u);
    }

    unsigned __int8 v30 = [(_bmFMDatabase *)self->_fmdb executeStatements:@"VACUUM"];
    id v31 = __biome_log_for_category();
    uint64_t v18 = v31;
    if (v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully ran initial VACUUM", buf, 2u);
      }

      BOOL v25 = 1;
      goto LABEL_25;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100048060(v18, v39, v40, v41, v42, v43, v44, v45);
    }
LABEL_23:

LABEL_24:
    BOOL v25 = 0;
    goto LABEL_25;
  }
  unint64_t v10 = [(BMSyncDatabase *)self _numPagesToVacuum];
  uint64_t v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v55 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock calculated pages to vacuum: %lu", buf, 0xCu);
  }

  unint64_t v12 = 0;
  if (v10)
  {
    while (1)
    {
      if (v10 - v12 >= 0x1F4) {
        uint64_t v13 = 500;
      }
      else {
        uint64_t v13 = v10 - v12;
      }
      uint64_t v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v55 = v13;
        __int16 v56 = 2048;
        unint64_t v57 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock starting incremental_vacuum of batch size: %lu, pagesVacuumed: %lu", buf, 0x16u);
      }

      fmdb = self->_fmdb;
      uint64_t v16 = +[NSString stringWithFormat:@"PRAGMA incremental_vacuum(%lu)", v13];
      LOBYTE(fmdb) = [(_bmFMDatabase *)fmdb executeStatements:v16];

      if ((fmdb & 1) == 0) {
        break;
      }
      v12 += v13;
      if (v4 && !v4[2](v4))
      {
        BOOL v25 = v12 != 0;
        goto LABEL_25;
      }
      if (v12 >= v10) {
        goto LABEL_19;
      }
    }
    uint64_t v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100048028(v17, v46, v47, v48, v49, v50, v51, v52);
    }
  }
  else
  {
LABEL_19:
    uint64_t v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully completed", buf, 2u);
    }
  }

  BOOL v25 = v12 != 0;
LABEL_25:

  return v25;
}

- (unint64_t)databaseSizeInKilobytes
{
  unint64_t v3 = [(_bmFMDatabase *)self->_fmdb databasePath];
  unint64_t v4 = [(BMSyncDatabase *)self _sizeOfFileInKilobytes:v3];

  return v4;
}

- (unint64_t)walSizeInKilobytes
{
  unint64_t v3 = [(_bmFMDatabase *)self->_fmdb databasePath];
  unint64_t v4 = [v3 stringByAppendingString:@"-wal"];
  unint64_t v5 = [(BMSyncDatabase *)self _sizeOfFileInKilobytes:v4];

  return v5;
}

- (unint64_t)_sizeOfFileInKilobytes:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSFileManager defaultManager];
  id v12 = 0;
  unint64_t v5 = [v4 attributesOfItemAtPath:v3 error:&v12];
  id v6 = v12;

  if (v5)
  {
    if (!v6)
    {
      unint64_t v8 = (unint64_t)[v5 fileSize] >> 10;
      goto LABEL_8;
    }
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ sizeOfFileInKilobytes error fetching attributes for filepath: %@, err: %@", buf, 0x20u);
    }
  }
  unint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)numRowsInTable:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  id v31 = v4;
  id v6 = +[NSArray arrayWithObjects:&v31 count:1];
  id v7 = [(_bmFMDatabase *)fmdb executeQuery:@"SELECT name FROM sqlite_schema WHERE type='table' AND name=?" withArgumentsInArray:v6];

  id v24 = 0;
  unsigned __int8 v8 = [v7 nextWithError:&v24];
  id v9 = v24;
  if (v8)
  {
    [v7 close];
    unint64_t v10 = self->_fmdb;
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"SELECT COUNT(*) FROM %@", v4];
    id v12 = [(_bmFMDatabase *)v10 executeQuery:v11];

    id v23 = v9;
    unsigned int v13 = [v12 nextWithError:&v23];
    id v14 = v23;

    if (v13)
    {
      id v15 = [v12 unsignedLongLongIntForColumnIndex:0];
    }
    else
    {
      __int16 v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v22;
        __int16 v27 = 2112;
        id v28 = v4;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ numRowsInTable error querying pgsize for table: %@, err: %@", buf, 0x20u);
      }
      id v15 = 0;
    }
    [v12 close];

    id v9 = v14;
  }
  else
  {
    id v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = v4;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ numRowsInTable table name: %@ does not exist, err: %@", buf, 0x20u);
    }
    [v7 close];
    id v15 = 0;
  }

  return (unint64_t)v15;
}

- (unint64_t)sizeOfTableInKilobytes:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  id v22 = v4;
  id v6 = +[NSArray arrayWithObjects:&v22 count:1];
  id v7 = [(_bmFMDatabase *)fmdb executeQuery:@"SELECT SUM(pgsize) FROM dbstat WHERE name = ?" withArgumentsInArray:v6];

  id v15 = 0;
  unsigned int v8 = [v7 nextWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    unint64_t v10 = (unint64_t)[v7 unsignedLongLongIntForColumnIndex:0] >> 10;
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      __int16 v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ sizeOfTable error querying pgsize for table: %@, err: %@", buf, 0x20u);
    }
    unint64_t v10 = 0;
  }
  [v7 close];

  return v10;
}

@end