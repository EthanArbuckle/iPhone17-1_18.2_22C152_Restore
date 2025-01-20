@interface NSSLegalDocumentsCache
+ (BOOL)supportsSecureCoding;
+ (id)cachedReplyForPreferredLanguages:(id)a3;
+ (void)cacheReply:(id)a3 forPreferredLanguages:(id)a4 gizmoBuildVersion:(id)a5;
+ (void)handleMemoryPressureEvent;
- (BOOL)isValidForPreferredLanguages:(id)a3 gizmoBuildVersion:(id)a4;
- (NSArray)preferredLanguages;
- (NSDictionary)reply;
- (NSSLegalDocumentsCache)initWithCoder:(id)a3;
- (NSString)gizmoBuildVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setGizmoBuildVersion:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation NSSLegalDocumentsCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  reply = self->_reply;
  id v5 = a3;
  [v5 encodeObject:reply forKey:@"reply"];
  [v5 encodeObject:self->_preferredLanguages forKey:@"preferredLanguages"];
  [v5 encodeObject:self->_gizmoBuildVersion forKey:@"gizmoBuildVersion"];
}

- (NSSLegalDocumentsCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NSSLegalDocumentsCache;
  id v5 = [(NSSLegalDocumentsCache *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"reply"];
    reply = v5->_reply;
    v5->_reply = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"preferredLanguages"];
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gizmoBuildVersion"];
    gizmoBuildVersion = v5->_gizmoBuildVersion;
    v5->_gizmoBuildVersion = (NSString *)v13;
  }
  return v5;
}

+ (void)cacheReply:(id)a3 forPreferredLanguages:(id)a4 gizmoBuildVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 cachedReplyForPreferredLanguages:v9];
  if (!v11)
  {
    v12 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v13 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v14 = [v12 getAllDevicesWithArchivedAltAccountDevicesMatching:v13];
    v15 = [v14 firstObject];

    objc_super v16 = [v15 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    v17 = v16;
    if (!v10 || !v16)
    {
      v21 = NSSLogForType();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Device properties are unexectedly nil! Paired device: (%@)", buf, 0xCu);
      }
      goto LABEL_17;
    }
    v29 = v15;
    v18 = [v16 stringByAppendingPathComponent:@"NanoSystemSettings/Caches/legal"];
    uint64_t v19 = objc_opt_new();
    v20 = (void *)qword_10003E7E0;
    qword_10003E7E0 = v19;

    [(id)qword_10003E7E0 setReply:v8];
    [(id)qword_10003E7E0 setPreferredLanguages:v9];
    [(id)qword_10003E7E0 setGizmoBuildVersion:v10];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F718;
    block[3] = &unk_100034AE0;
    v21 = v18;
    v32 = v21;
    if (qword_10003E7E8 != -1) {
      dispatch_once(&qword_10003E7E8, block);
    }
    id v30 = 0;
    unsigned int v22 = +[NSSKeyedArchiverUtil archiveObject:qword_10003E7E0 toFile:v21 options:268435457 error:&v30];
    id v23 = v30;
    v24 = NSSLogForType();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        v26 = "Successfully persisted cache";
        v27 = v24;
        uint32_t v28 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v23;
      v26 = "Failed to pesist cache with error: (%@)";
      v27 = v24;
      uint32_t v28 = 12;
      goto LABEL_15;
    }

    v15 = v29;
LABEL_17:

    goto LABEL_18;
  }
  v12 = NSSLogForType();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Valid reply is already cached.", buf, 2u);
  }
LABEL_18:
}

+ (id)cachedReplyForPreferredLanguages:(id)a3
{
  id v3 = a3;
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  uint64_t v7 = [v6 firstObject];

  id v8 = [v7 valueForProperty:NRDevicePropertySystemBuildVersion];
  uint64_t v9 = [v7 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  id v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = NSSLogForType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Pairing data store is unexpectedly nil! Paired device: (%@)", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v13 = 0;
  }
  else
  {
    unsigned __int8 v14 = [(id)qword_10003E7E0 isValidForPreferredLanguages:v3 gizmoBuildVersion:v8];
    if ((v14 & 1) == 0)
    {
      v15 = [v10 stringByAppendingPathComponent:@"NanoSystemSettings/Caches/legal"];
      objc_super v16 = +[NSSet setWithObject:objc_opt_class()];
      uint64_t v17 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v16 withFile:v15];
      v18 = (void *)qword_10003E7E0;
      qword_10003E7E0 = v17;

      if (([(id)qword_10003E7E0 isValidForPreferredLanguages:v3 gizmoBuildVersion:v8] & 1) == 0)
      {
        uint64_t v19 = (void *)qword_10003E7E0;
        qword_10003E7E0 = 0;

        v20 = +[NSFileManager defaultManager];
        [v20 removeItemAtPath:v15 error:0];
      }
    }
    uint64_t v13 = [(id)qword_10003E7E0 reply];
  }

  return v13;
}

+ (void)handleMemoryPressureEvent
{
  v2 = (void *)qword_10003E7E0;
  qword_10003E7E0 = 0;
}

- (BOOL)isValidForPreferredLanguages:(id)a3 gizmoBuildVersion:(id)a4
{
  id v6 = a4;
  if ([(NSArray *)self->_preferredLanguages isEqualToArray:a3]) {
    BOOL v7 = [(NSString *)self->_gizmoBuildVersion isEqualToString:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDictionary)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
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
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_reply, 0);
}

@end