@interface CLIndoorForegroundFetchRequest
- (BOOL)allFloorsDownloaded;
- (BOOL)isRequestValid:(id)a3;
- (CLIndoorForegroundFetchRequest)init;
- (CLIndoorForegroundFetchRequest)initWithFloorRequests:(id)a3 forAction:(unsigned __int8)a4;
- (NSArray)floorRequests;
- (NSUUID)uuid;
- (unint64_t)numExpectedFloors;
- (unint64_t)numFloorsSuccessfullyDownloaded;
- (unsigned)action;
- (void)requestDidComplete:(id)a3;
- (void)requestDidComplete:(id)a3 withError:(id)a4;
- (void)setAction:(unsigned __int8)a3;
- (void)setFloorRequests:(id)a3;
- (void)setNumFloorsSuccessfullyDownloaded:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation CLIndoorForegroundFetchRequest

- (CLIndoorForegroundFetchRequest)initWithFloorRequests:(id)a3 forAction:(unsigned __int8)a4
{
  id v7 = a3;
  v8 = [(CLIndoorForegroundFetchRequest *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_floorRequests, a3);
    v9->_action = a4;
  }

  return v9;
}

- (CLIndoorForegroundFetchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLIndoorForegroundFetchRequest;
  v2 = [(CLIndoorForegroundFetchRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }
  return v2;
}

- (BOOL)allFloorsDownloaded
{
  unint64_t v3 = [(CLIndoorForegroundFetchRequest *)self numFloorsSuccessfullyDownloaded];
  return v3 == [(CLIndoorForegroundFetchRequest *)self numExpectedFloors];
}

- (void)requestDidComplete:(id)a3
{
  id v4 = a3;
  if ([(CLIndoorForegroundFetchRequest *)self isRequestValid:v4])
  {
    [(CLIndoorForegroundFetchRequest *)self setNumFloorsSuccessfullyDownloaded:(char *)[(CLIndoorForegroundFetchRequest *)self numFloorsSuccessfullyDownloaded]+ 1];
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
    }
    v5 = (id)qword_10047BF00;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = [(CLIndoorForegroundFetchRequest *)self numFloorsSuccessfullyDownloaded];
      unint64_t v7 = [(CLIndoorForegroundFetchRequest *)self numExpectedFloors];
      id v8 = [v4 venueUuid];
      id v9 = [v8 UTF8String];
      id v10 = [v4 floorUuid];
      int v11 = 134218755;
      unint64_t v12 = v6;
      __int16 v13 = 2048;
      unint64_t v14 = v7;
      __int16 v15 = 2081;
      id v16 = v9;
      __int16 v17 = 2081;
      id v18 = [v10 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received floor %lu of %lu for venue ID %{private}s|%{private}s", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (unint64_t)numFloorsSuccessfullyDownloaded
{
  return self->_numFloorsSuccessfullyDownloaded;
}

- (unint64_t)numExpectedFloors
{
  v2 = [(CLIndoorForegroundFetchRequest *)self floorRequests];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSArray)floorRequests
{
  return self->_floorRequests;
}

- (void)setNumFloorsSuccessfullyDownloaded:(unint64_t)a3
{
  self->_numFloorsSuccessfullyDownloaded = a3;
}

- (BOOL)isRequestValid:(id)a3
{
  id v4 = a3;
  v5 = [(CLIndoorForegroundFetchRequest *)self uuid];
  if (!v5)
  {
    sub_1000AE4B0(buf, "");
    sub_10016A2C4((uint64_t)buf, 0, 0);
    if (v20 < 0) {
      operator delete(*(void **)buf);
    }
    sub_1000D11E0((uint64_t)__p);
  }

  if (!v4)
  {
    sub_1000AE4B0(buf, "");
    sub_10016A2C4((uint64_t)buf, 0, 0);
    if (v20 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10014B3FC((uint64_t)__p);
  }
  unint64_t v6 = [v4 requestUUID];
  unint64_t v7 = [(CLIndoorForegroundFetchRequest *)self uuid];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
    }
    id v9 = (id)qword_10047BF00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v4 requestUUID];
      id v11 = [v10 UUIDString];
      id v12 = [v11 UTF8String];
      __int16 v13 = [(CLIndoorForegroundFetchRequest *)self uuid];
      id v14 = [v13 UUIDString];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v12;
      __int16 v18 = 2080;
      id v19 = [v14 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got request complete for an outdated request. Received %s but expecting %s. Ignoring", buf, 0x16u);
    }
  }

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorRequests, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)requestDidComplete:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CLIndoorForegroundFetchRequest *)self isRequestValid:v6])
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
    }
    unsigned __int8 v8 = (id)qword_10047BF00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v6 venueUuid];
      id v9 = [v13 UTF8String];
      id v10 = [v6 floorUuid];
      id v11 = [v10 UTF8String];
      id v12 = [v7 description];
      *(_DWORD *)buf = 136381699;
      id v15 = v9;
      __int16 v16 = 2081;
      id v17 = v11;
      __int16 v18 = 2080;
      id v19 = [v12 UTF8String];
      __int16 v20 = 2048;
      unint64_t v21 = [(CLIndoorForegroundFetchRequest *)self numFloorsSuccessfullyDownloaded];
      __int16 v22 = 2048;
      unint64_t v23 = [(CLIndoorForegroundFetchRequest *)self numExpectedFloors];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get a floor for venue ID %{private}s|%{private}s because %s\nHave %lu of %lu floors", buf, 0x34u);
    }
  }
}

- (void)setUuid:(id)a3
{
}

- (void)setFloorRequests:(id)a3
{
}

- (void)setAction:(unsigned __int8)a3
{
  self->_action = a3;
}

@end