@interface MNTrace
+ (NSString)mainSchema;
+ (id)upgradeSchemaFromVersion:(unint64_t)a3 error:(id *)a4;
+ (unint64_t)currentVersion;
- (BOOL)closeTrace;
- (BOOL)isSimulation;
- (BOOL)openTrace:(id)a3 outError:(id *)a4;
- (BOOL)startWritingTraceToPath:(id)a3;
- (GEOComposedRoute)initialRoute;
- (MNTrace)init;
- (NSArray)annotatedUserBehavior;
- (NSArray)annotatedUserEnvironments;
- (NSArray)bookmarkImages;
- (NSArray)bookmarks;
- (NSArray)directions;
- (NSArray)etaUpdates;
- (NSArray)evData;
- (NSArray)headingData;
- (NSArray)locations;
- (NSArray)motionData;
- (NSArray)navigationEvents;
- (NSArray)navigationUpdates;
- (NSArray)networkEvents;
- (NSArray)routeCreationActions;
- (NSArray)vehicleHeadingData;
- (NSArray)vehicleSpeedData;
- (NSDate)directionsStartDate;
- (NSDate)navigationEndDate;
- (NSDate)navigationStartDate;
- (NSDate)recordingStartDate;
- (NSDictionary)miscInfo;
- (NSString)tracePath;
- (OS_dispatch_group)writeGroup;
- (OS_dispatch_queue)writeQueue;
- (id)_handleOpenErrorWithPath:(id)a3;
- (id)dateFromTimestamp:(double)a3;
- (id)prepareStatement:(id)a3 outError:(id *)a4;
- (id)routeBeforeTimestamp:(double)a3;
- (id)routesWithDirectionsResponseID:(id)a3 selectedRouteIndex:(int64_t *)a4;
- (id)serializableBookmarks;
- (int)mainTransportType;
- (int64_t)locationIndexAfterTimestamp:(double)a3;
- (int64_t)traceType;
- (sqlite3)db;
- (unint64_t)originalVersion;
- (unint64_t)version;
- (void)dealloc;
- (void)setAnnotatedUserBehavior:(id)a3;
- (void)setAnnotatedUserEnvironments:(id)a3;
- (void)setBookmarkImages:(id)a3;
- (void)setBookmarks:(id)a3;
- (void)setDirections:(id)a3;
- (void)setDirectionsStartDate:(id)a3;
- (void)setEtaUpdates:(id)a3;
- (void)setEvData:(id)a3;
- (void)setHeadingData:(id)a3;
- (void)setIsSimulation:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setMiscInfo:(id)a3;
- (void)setMotionData:(id)a3;
- (void)setNavigationEndDate:(id)a3;
- (void)setNavigationEvents:(id)a3;
- (void)setNavigationStartDate:(id)a3;
- (void)setNavigationUpdates:(id)a3;
- (void)setNetworkEvents:(id)a3;
- (void)setOriginalVersion:(unint64_t)a3;
- (void)setRecordingStartDate:(id)a3;
- (void)setRouteCreationActions:(id)a3;
- (void)setTraceType:(int64_t)a3;
- (void)setVehicleHeadingData:(id)a3;
- (void)setVehicleSpeedData:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MNTrace

- (GEOComposedRoute)initialRoute
{
  v2 = self;
  id v3 = MNTrace.initialRoute.getter();

  return (GEOComposedRoute *)v3;
}

- (id)routeBeforeTimestamp:(double)a3
{
  v4 = self;
  v5 = (void *)MNTrace.route(beforeTimestamp:)(a3);

  return v5;
}

- (id)routesWithDirectionsResponseID:(id)a3 selectedRouteIndex:(int64_t *)a4
{
  id v6 = a3;
  v7 = self;
  uint64_t v8 = sub_1B5531E70();
  unint64_t v10 = v9;

  id v11 = MNTrace.objcOnly_routesWithDirectionsResponseID(directionsResponseID:selectedRouteIndex:)(v8, v10, (unint64_t)a4);
  sub_1B5438A24(v8, v10);

  if (v11)
  {
    sub_1B5438B88(0, &qword_1E9D54DB8);
    v12 = (void *)sub_1B5531F50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (int64_t)locationIndexAfterTimestamp:(double)a3
{
  v4 = self;
  Swift::Int_optional v7 = MNTrace.locationIndex(afterTimestamp:)(a3);
  if (v7.is_nil) {
    v7.Swift::Int value = sub_1B5531DB0();
  }
  Swift::Int value = v7.value;

  return value;
}

+ (unint64_t)currentVersion
{
  return 61;
}

+ (NSString)mainSchema
{
  v2 = (void *)sub_1B5531ED0();
  return (NSString *)v2;
}

+ (id)upgradeSchemaFromVersion:(unint64_t)a3 error:(id *)a4
{
  sub_1B543F978(a3);
  v4 = (void *)sub_1B5531ED0();
  swift_bridgeObjectRelease();
  return v4;
}

- (MNTrace)init
{
  v8.receiver = self;
  v8.super_class = (Class)MNTrace;
  v2 = [(MNTrace *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Maps.Trace", 0);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    writeGroup = v2->_writeGroup;
    v2->_writeGroup = (OS_dispatch_group *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(MNTrace *)self closeTrace];
  v3.receiver = self;
  v3.super_class = (Class)MNTrace;
  [(MNTrace *)&v3 dealloc];
}

- (BOOL)openTrace:(id)a3 outError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  Swift::Int_optional v7 = v6;
  if (!self->_db)
  {
    id v8 = v6;
    int v9 = sqlite3_open_v2((const char *)[v8 fileSystemRepresentation], &self->_db, 2, 0);
    if (!v9)
    {
      v16 = (NSString *)[v8 copy];
      tracePath = self->_tracePath;
      self->_tracePath = v16;

      BOOL v14 = 1;
      goto LABEL_9;
    }
    int v10 = v9;
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      id v19 = v8;
      __int16 v20 = 1024;
      int v21 = v10;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Error opening trace for path: %{public}@, error code: %d", (uint8_t *)&v18, 0x12u);
    }

    v12 = [(MNTrace *)self _handleOpenErrorWithPath:v8];
    v13 = v12;
    if (a4) {
      *a4 = v12;
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)startWritingTraceToPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_db)
  {
    v12 = [NSString stringWithFormat:@"startWritingTraceToPath: called when sqlite database already exists"];
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "_db == NULL";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v14, 0x16u);
    }
  }
  self->_db = 0;
  id v5 = v4;
  int v6 = sqlite3_open_v2((const char *)[v5 fileSystemRepresentation], &self->_db, 6, 0);
  if (v6)
  {
    Swift::Int_optional v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      v15 = (const char *)v5;
      __int16 v16 = 1024;
      LODWORD(v17) = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Error opening trace for writing at path: %{public}@, error code: %d", (uint8_t *)&v14, 0x12u);
    }
  }
  else
  {
    LOBYTE(v14) = -1;
    id v8 = v5;
    setxattr((const char *)[v8 UTF8String], "com.apple.runningboard.can-suspend-locked", &v14, 1uLL, 0, 0);
    int v9 = (NSString *)[v8 copy];
    tracePath = self->_tracePath;
    self->_tracePath = v9;
  }
  return v6 == 0;
}

- (BOOL)closeTrace
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_db)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v3 = self->_preparedStatements;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "finalize", (void)v16);
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v5);
    }

    preparedStatements = self->_preparedStatements;
    self->_preparedStatements = 0;

    int v9 = sqlite3_close(self->_db);
    BOOL v10 = v9 == 0;
    if (!v9) {
      goto LABEL_18;
    }
    int v11 = v9;
    v12 = GEOFindOrCreateLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11 == 5)
    {
      if (v13)
      {
        *(_DWORD *)buf = 67109120;
        int v21 = 5;
        int v14 = "Error closing temp trace: %d sqlite3 is busy";
LABEL_16:
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, v14, buf, 8u);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v11;
      int v14 = "Error closing temp trace: %d";
      goto LABEL_16;
    }

LABEL_18:
    self->_db = 0;
    return v10;
  }
  return 0;
}

- (id)dateFromTimestamp:(double)a3
{
  recordingStartDate = self->_recordingStartDate;
  if (!recordingStartDate)
  {
    uint64_t v6 = [(NSArray *)self->_locations firstObject];
    Swift::Int_optional v7 = [v6 location];
    id v8 = [v7 timestamp];
    int v9 = self->_recordingStartDate;
    self->_recordingStartDate = v8;

    recordingStartDate = self->_recordingStartDate;
  }
  return [(NSDate *)recordingStartDate dateByAddingTimeInterval:a3];
}

- (int)mainTransportType
{
  v2 = [(MNTrace *)self directions];
  objc_super v3 = [v2 firstObject];

  if (v3)
  {
    uint64_t v4 = [v3 request];
    uint64_t v5 = [v4 routeAttributes];
    int v6 = [v5 mainTransportType];
  }
  else
  {
    int v6 = 4;
  }

  return v6;
}

- (NSArray)bookmarks
{
  objc_super v3 = [(MNTrace *)self writeQueue];
  dispatch_assert_queue_not_V2(v3);
  bookmarks = self->_bookmarks;
  if (!bookmarks)
  {
    uint64_t v8 = 0;
    int v9 = &v8;
    uint64_t v10 = 0x3032000000;
    int v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __20__MNTrace_bookmarks__block_invoke;
    v7[3] = &unk_1E60F6488;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    objc_storeStrong((id *)&self->_bookmarks, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    bookmarks = self->_bookmarks;
  }
  uint64_t v5 = bookmarks;

  return v5;
}

void __20__MNTrace_bookmarks__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)[*(id *)(a1 + 32) db], "SELECT timestamp FROM bookmarks", 31, &ppStmt, 0))
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_super v3 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "Error preparing bookmarks statement: %{public}s", buf, 0xCu);
    }
  }
  else
  {
    v2 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:sqlite3_data_count(ppStmt)];
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(ppStmt, 0));
      [v2 addObject:v4];
    }
    sqlite3_finalize(ppStmt);
    uint64_t v5 = [v2 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    Swift::Int_optional v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (NSArray)bookmarkImages
{
  objc_super v3 = [(MNTrace *)self writeQueue];
  dispatch_assert_queue_not_V2(v3);
  bookmarkImages = self->_bookmarkImages;
  if (!bookmarkImages)
  {
    uint64_t v8 = 0;
    int v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __25__MNTrace_bookmarkImages__block_invoke;
    v7[3] = &unk_1E60F6488;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    objc_storeStrong((id *)&self->_bookmarkImages, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    bookmarkImages = self->_bookmarkImages;
  }
  uint64_t v5 = bookmarkImages;

  return v5;
}

void __25__MNTrace_bookmarkImages__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  sqlite3_prepare_v2((sqlite3 *)[*(id *)(a1 + 32) db], (const char *)objc_msgSend(@"SELECT screenshot_data FROM bookmarks", "UTF8String"), objc_msgSend(@"SELECT screenshot_data FROM bookmarks", "length"), &ppStmt, 0);
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:sqlite3_data_count(ppStmt)];
  if (sqlite3_step(ppStmt) == 100)
  {
    do
    {
      objc_super v3 = sqlite3_column_blob(ppStmt, 0);
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v3, sqlite3_column_bytes(ppStmt, 0));
      [v2 addObject:v4];
      int v5 = sqlite3_step(ppStmt);
    }
    while (v5 == 100);
  }
  sqlite3_finalize(ppStmt);
  uint64_t v6 = [v2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_handleOpenErrorWithPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 attributesOfItemAtPath:v3 error:0];
  if (([v5 filePosixPermissions] & 0x100) != 0)
  {
    int v9 = 0;
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"Can't open file because file does not have read permission set. Try running as root:\n> chmod u+r %@", v3];
    if (v6)
    {
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v6;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      uint64_t v12 = *MEMORY[0x1E4F28568];
      id v13 = v6;
      uint64_t v8 = 1;
      int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    }
    else
    {
      int v9 = 0;
      uint64_t v8 = 1;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNTraceErrorDomain" code:v8 userInfo:v9];

  return v10;
}

- (id)prepareStatement:(id)a3 outError:(id *)a4
{
  int v5 = +[MNTracePreparedStatement preparedStatementForTrace:self statement:a3 outError:a4];
  if (v5)
  {
    preparedStatements = self->_preparedStatements;
    if (!preparedStatements)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = self->_preparedStatements;
      self->_preparedStatements = v7;

      preparedStatements = self->_preparedStatements;
    }
    [(NSMutableArray *)preparedStatements addObject:v5];
  }
  return v5;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (int64_t)traceType
{
  return self->_traceType;
}

- (void)setTraceType:(int64_t)a3
{
  self->_traceType = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)originalVersion
{
  return self->_originalVersion;
}

- (void)setOriginalVersion:(unint64_t)a3
{
  self->_originalVersion = a3;
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void)setRecordingStartDate:(id)a3
{
}

- (NSDate)directionsStartDate
{
  return self->_directionsStartDate;
}

- (void)setDirectionsStartDate:(id)a3
{
}

- (NSDate)navigationStartDate
{
  return self->_navigationStartDate;
}

- (void)setNavigationStartDate:(id)a3
{
}

- (NSDate)navigationEndDate
{
  return self->_navigationEndDate;
}

- (void)setNavigationEndDate:(id)a3
{
}

- (BOOL)isSimulation
{
  return self->_isSimulation;
}

- (void)setIsSimulation:(BOOL)a3
{
  self->_isSimulation = a3;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSArray)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
}

- (NSArray)etaUpdates
{
  return self->_etaUpdates;
}

- (void)setEtaUpdates:(id)a3
{
}

- (NSArray)headingData
{
  return self->_headingData;
}

- (void)setHeadingData:(id)a3
{
}

- (NSArray)motionData
{
  return self->_motionData;
}

- (void)setMotionData:(id)a3
{
}

- (NSArray)vehicleHeadingData
{
  return self->_vehicleHeadingData;
}

- (void)setVehicleHeadingData:(id)a3
{
}

- (NSArray)vehicleSpeedData
{
  return self->_vehicleSpeedData;
}

- (void)setVehicleSpeedData:(id)a3
{
}

- (NSArray)evData
{
  return self->_evData;
}

- (void)setEvData:(id)a3
{
}

- (NSArray)navigationEvents
{
  return self->_navigationEvents;
}

- (void)setNavigationEvents:(id)a3
{
}

- (NSArray)annotatedUserBehavior
{
  return self->_annotatedUserBehavior;
}

- (void)setAnnotatedUserBehavior:(id)a3
{
}

- (NSArray)annotatedUserEnvironments
{
  return self->_annotatedUserEnvironments;
}

- (void)setAnnotatedUserEnvironments:(id)a3
{
}

- (NSArray)navigationUpdates
{
  return self->_navigationUpdates;
}

- (void)setNavigationUpdates:(id)a3
{
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
}

- (NSArray)routeCreationActions
{
  return self->_routeCreationActions;
}

- (void)setRouteCreationActions:(id)a3
{
}

- (void)setBookmarks:(id)a3
{
}

- (void)setBookmarkImages:(id)a3
{
}

- (NSDictionary)miscInfo
{
  return self->_miscInfo;
}

- (void)setMiscInfo:(id)a3
{
}

- (sqlite3)db
{
  return self->_db;
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (OS_dispatch_group)writeGroup
{
  return self->_writeGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscInfo, 0);
  objc_storeStrong((id *)&self->_routeCreationActions, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_navigationUpdates, 0);
  objc_storeStrong((id *)&self->_navigationEvents, 0);
  objc_storeStrong((id *)&self->_evData, 0);
  objc_storeStrong((id *)&self->_navigationEndDate, 0);
  objc_storeStrong((id *)&self->_navigationStartDate, 0);
  objc_storeStrong((id *)&self->_directionsStartDate, 0);
  objc_storeStrong((id *)&self->_recordingStartDate, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_annotatedUserEnvironments, 0);
  objc_storeStrong((id *)&self->_annotatedUserBehavior, 0);
  objc_storeStrong((id *)&self->_vehicleSpeedData, 0);
  objc_storeStrong((id *)&self->_vehicleHeadingData, 0);
  objc_storeStrong((id *)&self->_motionData, 0);
  objc_storeStrong((id *)&self->_headingData, 0);
  objc_storeStrong((id *)&self->_etaUpdates, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_bookmarkImages, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

- (id)serializableBookmarks
{
  id v3 = [(MNTrace *)self bookmarks];
  if ([v3 count])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
    int v5 = [(MNTrace *)self bookmarks];
    uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    uint64_t v7 = [(MNTrace *)self bookmarks];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [(MNTrace *)self bookmarks];
        uint64_t v11 = [v10 objectAtIndex:v9];

        uint64_t v12 = [(MNTrace *)self bookmarkImages];
        id v13 = [v12 objectAtIndex:v9];

        int v14 = objc_alloc_init(MNTraceBookmark);
        [v11 doubleValue];
        -[MNTraceBookmark setTimestamp:](v14, "setTimestamp:");
        [(MNTraceBookmark *)v14 setImageData:v13];
        [v6 addObject:v14];

        ++v9;
        v15 = [(MNTrace *)self bookmarks];
        unint64_t v16 = [v15 count];
      }
      while (v9 < v16);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end