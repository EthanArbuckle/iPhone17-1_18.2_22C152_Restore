@interface RDPeerSharingInfoCache
+ (BOOL)supportsSecureCoding;
+ (id)getCachePath;
+ (id)loadCache;
- (BOOL)save;
- (NSMutableDictionary)cache;
- (RDPeerSharingInfoCache)init;
- (RDPeerSharingInfoCache)initWithCache:(id)a3;
- (RDPeerSharingInfoCache)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCache:(id)a3;
@end

@implementation RDPeerSharingInfoCache

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RDPeerSharingInfoCache *)self cache];
  id v6 = [v4 initWithCache:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDPeerSharingInfoCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)RDPeerSharingInfoCache;
  v2 = [(RDPeerSharingInfoCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (RDPeerSharingInfoCache)initWithCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDPeerSharingInfoCache;
  objc_super v6 = [(RDPeerSharingInfoCache *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cache, a3);
  }

  return v7;
}

- (RDPeerSharingInfoCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RDPeerSharingInfoCache;
  id v5 = [(RDPeerSharingInfoCache *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"kRDPeerSharingInfoCacheKeyCache"];
    id v5 = [(RDPeerSharingInfoCache *)v5 initWithCache:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RDPeerSharingInfoCache *)self cache];
  [v4 encodeObject:v5 forKey:@"kRDPeerSharingInfoCacheKeyCache"];
}

+ (id)getCachePath
{
  v2 = +[RDCachedData getCacheDirPath];
  v6[0] = v2;
  v6[1] = @"shareStamps.plist";
  uint64_t v3 = +[NSArray arrayWithObjects:v6 count:2];
  id v4 = +[NSString pathWithComponents:v3];

  return v4;
}

+ (id)loadCache
{
  v2 = +[RDPeerSharingInfoCache getCachePath];
  id v33 = 0;
  uint64_t v3 = +[NSData dataWithContentsOfFile:v2 options:1 error:&v33];
  id v4 = v33;
  id v5 = v4;
  if (v3)
  {
    if (v4)
    {
      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AD8);
      }
      uint64_t v6 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = v6;
        id v8 = [v5 description];
        id v9 = [v8 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Got an error while reading sharing data, but continuing anyway: %s", buf, 0xCu);
      }
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    id v32 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v3 error:&v32];
    id v15 = v32;
    v16 = v15;
    if (v14)
    {
      if (v15)
      {
        if (qword_100019398 != -1) {
          dispatch_once(&qword_100019398, &stru_100014AD8);
        }
        v17 = (void *)qword_1000193A0;
        if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
        {
          v18 = v17;
          id v19 = [v16 description];
          id v20 = [v19 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v35 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Encountered error while unarchiving sharing cache: %s", buf, 0xCu);
        }
      }
      v21 = v14;
    }
    else
    {
      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AD8);
      }
      v27 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        id v29 = [v16 description];
        id v30 = [v29 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v35 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to read unarchive sharing cache: %s", buf, 0xCu);
      }
      v21 = objc_alloc_init(RDPeerSharingInfoCache);
    }
    v26 = v21;
  }
  else
  {
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AD8);
    }
    v22 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      id v24 = [v5 description];
      id v25 = [v24 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to read sharing cached data file: %s", buf, 0xCu);
    }
    v26 = objc_alloc_init(RDPeerSharingInfoCache);
  }

  return v26;
}

- (BOOL)save
{
  uint64_t v3 = (const char **)_CFGetProgname();
  if (!strcmp(*v3, "countryd"))
  {
    uint64_t v7 = +[RDPeerSharingInfoCache getCachePath];
    id v24 = 0;
    id v8 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v24];
    id v9 = v24;
    if (v9)
    {
      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AD8);
      }
      uint64_t v10 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v10;
        uint64_t v12 = [v9 description];
        v13 = [v9 localizedFailureReason];
        *(_DWORD *)buf = 68289538;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2114;
        id v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to archive sharing data\", \"description\":%{public, location:escape_only}@, \"failureReason\":%{public, location:escape_only}@}", buf, 0x26u);

        if (qword_100019398 != -1) {
          dispatch_once(&qword_100019398, &stru_100014AD8);
        }
      }
      v14 = (void *)qword_1000193A0;
      if (!os_signpost_enabled((os_log_t)qword_1000193A0)) {
        goto LABEL_32;
      }
      id v15 = v14;
      v16 = [v9 description];
      v17 = [v9 localizedFailureReason];
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2114;
      id v30 = v16;
      __int16 v31 = 2114;
      id v32 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to archive sharing data", "{\"msg%{public}.0s\":\"Failed to archive sharing data\", \"description\":%{public, location:escape_only}@, \"failureReason\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    else
    {
      id v23 = 0;
      unsigned __int8 v18 = [v8 writeToFile:v7 options:268435457 error:&v23];
      id v15 = v23;
      if (v18)
      {
        if (qword_100019398 != -1) {
          dispatch_once(&qword_100019398, &stru_100014AD8);
        }
        id v19 = qword_1000193A0;
        if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289026;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Saved sharing cache\"}", buf, 0x12u);
        }

        BOOL v6 = 1;
        goto LABEL_33;
      }
      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AD8);
      }
      id v20 = qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to write sharing cache\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
        if (qword_100019398 != -1) {
          dispatch_once(&qword_100019398, &stru_100014AD8);
        }
      }
      v21 = qword_1000193A0;
      if (os_signpost_enabled((os_log_t)qword_1000193A0))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to write sharing cache", "{\"msg%{public}.0s\":\"Failed to write sharing cache\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }

LABEL_32:
    BOOL v6 = 0;
LABEL_33:

    return v6;
  }
  if (qword_100019398 != -1) {
    dispatch_once(&qword_100019398, &stru_100014AD8);
  }
  id v4 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Only countryd can save the sharing cache\"}", buf, 0x12u);
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AD8);
    }
  }
  id v5 = qword_1000193A0;
  if (os_signpost_enabled((os_log_t)qword_1000193A0))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only countryd can save the sharing cache", "{\"msg%{public}.0s\":\"Only countryd can save the sharing cache\"}", buf, 0x12u);
  }
  return 0;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end