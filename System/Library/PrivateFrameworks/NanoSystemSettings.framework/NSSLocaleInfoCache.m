@interface NSSLocaleInfoCache
+ (BOOL)supportsSecureCoding;
+ (id)cachedReply;
+ (void)cacheReply:(id)a3 forGizmoBuildVersion:(id)a4;
+ (void)handleMemoryPressureEvent;
- (BOOL)isValidForGizmoBuildVersion:(id)a3;
- (NSDictionary)reply;
- (NSSLocaleInfoCache)initWithCoder:(id)a3;
- (NSString)gizmoBuildVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setGizmoBuildVersion:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation NSSLocaleInfoCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  reply = self->_reply;
  id v5 = a3;
  [v5 encodeObject:reply forKey:@"reply"];
  [v5 encodeObject:self->_gizmoBuildVersion forKey:@"gizmoBuildVersion"];
}

- (NSSLocaleInfoCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NSSLocaleInfoCache;
  id v5 = [(NSSLocaleInfoCache *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"reply"];
    reply = v5->_reply;
    v5->_reply = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gizmoBuildVersion"];
    gizmoBuildVersion = v5->_gizmoBuildVersion;
    v5->_gizmoBuildVersion = (NSString *)v11;
  }
  return v5;
}

+ (void)cacheReply:(id)a3 forGizmoBuildVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 cachedReply];
  if (!v8)
  {
    uint64_t v9 = +[NRPairedDeviceRegistry sharedInstance];
    v10 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    uint64_t v11 = [v9 getAllDevicesWithArchivedAltAccountDevicesMatching:v10];
    v12 = [v11 firstObject];

    v13 = [v12 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    objc_super v14 = v13;
    if (!v13)
    {
      v18 = NSSLogForType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Device properties are unexectedly nil! Paired device: (%@)", buf, 0xCu);
      }
      goto LABEL_16;
    }
    v15 = [v13 stringByAppendingPathComponent:@"NanoSystemSettings/Caches/locale"];
    uint64_t v16 = objc_opt_new();
    v17 = (void *)qword_10003E7F0;
    qword_10003E7F0 = v16;

    [(id)qword_10003E7F0 setReply:v6];
    [(id)qword_10003E7F0 setGizmoBuildVersion:v7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020024;
    block[3] = &unk_100034AE0;
    v18 = v15;
    v28 = v18;
    if (qword_10003E7F8 != -1) {
      dispatch_once(&qword_10003E7F8, block);
    }
    id v26 = 0;
    unsigned int v19 = +[NSSKeyedArchiverUtil archiveObject:qword_10003E7F0 toFile:v18 options:268435457 error:&v26];
    id v20 = v26;
    v21 = NSSLogForType();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        v23 = "Successfully persisted cache";
        v24 = v21;
        uint32_t v25 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v20;
      v23 = "Failed to pesist cache with error: (%@)";
      v24 = v21;
      uint32_t v25 = 12;
      goto LABEL_14;
    }

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Valid reply is already cached.", buf, 2u);
  }
LABEL_17:
}

+ (id)cachedReply
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  id v6 = [v5 valueForProperty:NRDevicePropertySystemBuildVersion];
  uint64_t v7 = [v5 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pairing data store is unexpectedly nil! Paired device: (%@)", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v11 = 0;
  }
  else
  {
    unsigned __int8 v12 = [(id)qword_10003E7F0 isValidForGizmoBuildVersion:v6];
    if ((v12 & 1) == 0)
    {
      v13 = [v8 stringByAppendingPathComponent:@"NanoSystemSettings/Caches/locale"];
      objc_super v14 = +[NSSet setWithObject:objc_opt_class()];
      uint64_t v15 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v14 withFile:v13];
      uint64_t v16 = (void *)qword_10003E7F0;
      qword_10003E7F0 = v15;

      if (([(id)qword_10003E7F0 isValidForGizmoBuildVersion:v6] & 1) == 0)
      {
        v17 = (void *)qword_10003E7F0;
        qword_10003E7F0 = 0;

        v18 = +[NSFileManager defaultManager];
        [v18 removeItemAtPath:v13 error:0];
      }
    }
    uint64_t v11 = [(id)qword_10003E7F0 reply];
  }

  return v11;
}

+ (void)handleMemoryPressureEvent
{
  v2 = (void *)qword_10003E7F0;
  qword_10003E7F0 = 0;
}

- (BOOL)isValidForGizmoBuildVersion:(id)a3
{
  return [(NSString *)self->_gizmoBuildVersion isEqualToString:a3];
}

- (NSDictionary)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSString)gizmoBuildVersion
{
  return self->_gizmoBuildVersion;
}

- (void)setGizmoBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gizmoBuildVersion, 0);
  objc_storeStrong((id *)&self->_reply, 0);
}

@end