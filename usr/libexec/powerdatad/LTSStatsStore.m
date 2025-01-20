@interface LTSStatsStore
+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
+ (id)getBootUUID;
+ (id)getPrevStatsSinceBoot;
+ (id)readFromFile:(id)a3;
+ (void)saveStatsSinceBoot:(id)a3;
- (NSMutableDictionary)lts;
- (NSString)fileName;
- (id)getDeviceSerialNumber;
- (id)getLifetimeStats;
- (id)getLifetimeStatsForVersion:(unint64_t)a3;
- (id)getfileNameForChannel:(id)a3;
- (id)initForChannel:(id)a3;
- (void)saveLifetimeStats:(id)a3 forVersion:(unint64_t)a4;
- (void)setChannelExistsForChannel:(id)a3;
- (void)setFileName:(id)a3;
- (void)setLts:(id)a3;
@end

@implementation LTSStatsStore

- (id)getfileNameForChannel:(id)a3
{
  uint64_t v4 = 0;
  while (![a3 isEqualToString:off_100014940[v4]])
  {
    v4 += 4;
    if (v4 == 56)
    {
      v5 = 0;
      goto LABEL_6;
    }
  }
  v5 = off_100014940[v4 + 1];
LABEL_6:

  return v5;
}

- (void)setChannelExistsForChannel:(id)a3
{
  uint64_t v4 = 0;
  while (![a3 isEqualToString:off_100014940[v4]])
  {
    v4 += 4;
    if (v4 == 56) {
      return;
    }
  }
  LOBYTE(off_100014940[v4 + 3]) = 1;
}

- (id)getDeviceSerialNumber
{
  v2 = (void *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    if (![v2 length] && os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AC6C();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AC38();
    }
    v3 = +[NSString string];
  }

  return v3;
}

- (id)initForChannel:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LTSStatsStore;
  v5 = [(LTSStatsStore *)&v20 init];
  [(LTSStatsStore *)v5 setChannelExistsForChannel:v4];
  uint64_t v6 = [(LTSStatsStore *)v5 getfileNameForChannel:v4];
  fileName = v5->_fileName;
  v5->_fileName = (NSString *)v6;

  if (!v5->_fileName)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000ACA0();
    }
    goto LABEL_18;
  }
  v8 = [(LTSStatsStore *)v5 getDeviceSerialNumber];
  uint64_t v9 = +[LTSStatsStore readFromFile:v5->_fileName];
  lts = v5->_lts;
  v5->_lts = (NSMutableDictionary *)v9;

  v11 = v5->_lts;
  if (v11)
  {
    v12 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:@"Serial"];
    v13 = v12;
    if (!v12 || [v12 compare:v8])
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000AD70();
      }
      uint64_t v14 = +[NSMutableDictionary dictionary];
      v15 = v5->_lts;
      v5->_lts = (NSMutableDictionary *)v14;

      [(NSMutableDictionary *)v5->_lts setObject:v8 forKeyedSubscript:@"Serial"];
    }
  }
  else
  {
    uint64_t v16 = +[NSMutableDictionary dictionary];
    v17 = v5->_lts;
    v5->_lts = (NSMutableDictionary *)v16;

    [(NSMutableDictionary *)v5->_lts setObject:v8 forKeyedSubscript:@"Serial"];
  }
  if (!v5->_lts)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AD08();
    }

LABEL_18:
    v18 = 0;
    goto LABEL_12;
  }
  v18 = v5;

LABEL_12:
  return v18;
}

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableString stringWithString:@"/var/db/SoC/"];
  v8 = +[NSFileManager defaultManager];
  char v24 = 0;
  [v7 appendString:v6];
  NSFileAttributeKey v27 = NSFileProtectionKey;
  NSFileProtectionType v28 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v23 = 0;
  [v8 createDirectoryAtPath:@"/var/db/SoC/" withIntermediateDirectories:0 attributes:v9 error:&v23];
  id v10 = v23;

  objc_super v20 = v5;
  if ([v8 fileExistsAtPath:@"/var/db/SoC/" isDirectory:&v24] && v24)
  {
    v11 = +[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", v7, 0, v5);
    [v11 open];
    id v22 = 0;
    uint64_t v12 = +[NSPropertyListSerialization writePropertyList:v5 toStream:v11 format:200 options:0 error:&v22];
    id v13 = v22;

    [v11 close];
    if (v12)
    {
      NSFileAttributeKey v25 = NSFileProtectionKey;
      NSFileProtectionType v26 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v21 = v13;
      unsigned __int8 v15 = [v8 setAttributes:v14 ofItemAtPath:v7 error:&v21];
      id v16 = v21;

      v17 = off_100014B00;
      if (v15)
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
          sub_10000AE0C((uint64_t)v7, v12, v17);
        }
        BOOL v18 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
          sub_10000AE84();
        }
        BOOL v18 = 0;
      }
      id v13 = v16;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000ADA4();
      }
      BOOL v18 = 0;
    }

    id v10 = v13;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AEEC();
    }
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)readFromFile:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString stringWithString:@"/var/db/SoC/"];
  [v4 appendString:v3];

  id v5 = +[NSInputStream inputStreamWithFileAtPath:v4];
  [v5 open];
  id v9 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithStream:v5 options:2 format:0 error:&v9];
  id v7 = v9;
  [v5 close];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
      sub_10000AFBC();
    }
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000AF54();
  }

  return v6;
}

- (id)getLifetimeStats
{
  v2 = [(NSMutableDictionary *)self->_lts objectForKeyedSubscript:@"LifetimeStats"];
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
    sub_10000B024();
  }

  return v2;
}

- (id)getLifetimeStatsForVersion:(unint64_t)a3
{
  id v5 = [(NSMutableDictionary *)self->_lts objectForKeyedSubscript:@"version"];
  id v6 = v5;
  if (v5 && [(NSString *)v5 unsignedLongLongValue] == (id)a3)
  {
    id v7 = [(LTSStatsStore *)self getLifetimeStats];
    v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];
    id v9 = v8;
    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
    {
      fileName = self->_fileName;
      int v15 = 138543874;
      id v16 = v6;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2114;
      objc_super v20 = fileName;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "LTS on-disk version(%{public}@) doesn't match with current version(%lld) for domain %{public}@\n", (uint8_t *)&v15, 0x20u);
    }
    [(NSMutableDictionary *)self->_lts removeObjectForKey:@"version"];
    [(NSMutableDictionary *)self->_lts removeObjectForKey:@"LifetimeStats"];
    v8 = 0;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);

  v11 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = self->_fileName;
    int v15 = 138543362;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Returning empty dictionary for lifetime stats of domain %{public}@", (uint8_t *)&v15, 0xCu);
  }
  id v7 = 0;
LABEL_11:

  return v9;
}

- (void)saveLifetimeStats:(id)a3 forVersion:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)self->_lts setObject:v7 forKey:@"version"];
  [(NSMutableDictionary *)self->_lts setObject:v6 forKey:@"LifetimeStats"];

  +[LTSStatsStore writeDictionary:self->_lts toFile:self->_fileName];
  v8 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    fileName = self->_fileName;
    int v10 = 138543362;
    v11 = fileName;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saved lifetime stats of domain %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

+ (id)getBootUUID
{
  memset(v10, 0, sizeof(v10));
  size_t v9 = 37;
  if (!qword_100014B38)
  {
    int v2 = sysctlbyname("kern.bootsessionuuid", v10, &v9, 0, 0);
    if (v2)
    {
      int v8 = v2;
      id v7 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000B09C(v8, v7);
      }
    }
    else
    {
      uint64_t v3 = +[NSString stringWithCString:v10 encoding:1];
      id v4 = (void *)qword_100014B38;
      qword_100014B38 = v3;
    }
  }
  id v5 = (id)qword_100014B38;

  return v5;
}

+ (void)saveStatsSinceBoot:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];
  id v5 = +[LTSStatsStore getBootUUID];
  if (v5)
  {
    [v4 setObject:v3 forKey:@"PrevStatsSinceBoot"];
    [v4 setObject:v5 forKey:@"bootuuid"];
    +[LTSStatsStore writeDictionary:v4 toFile:@"lts.statssinceboot.plist"];
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B114();
  }
}

+ (id)getPrevStatsSinceBoot
{
  int v2 = +[LTSStatsStore getBootUUID];
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B114();
    }
    id v5 = 0;
    id v3 = 0;
    goto LABEL_8;
  }
  id v3 = +[LTSStatsStore readFromFile:@"lts.statssinceboot.plist"];
  id v4 = [v3 objectForKeyedSubscript:@"bootuuid"];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B148();
    }
    id v5 = 0;
    goto LABEL_8;
  }
  id v5 = v4;
  if (([v4 isEqualToString:v2] & 1) == 0)
  {
    id v7 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "On-disk stats since boot are with different boot session UUID", v10, 2u);
    }
    [v3 removeObjectForKey:@"PrevStatsSinceBoot"];
    [v3 removeObjectForKey:@"bootuuid"];
    +[LTSStatsStore writeDictionary:v3 toFile:@"lts.statssinceboot.plist"];
LABEL_8:
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = [v3 objectForKey:@"PrevStatsSinceBoot"];
LABEL_9:
  id v8 = v6;

  return v8;
}

- (NSMutableDictionary)lts
{
  return self->_lts;
}

- (void)setLts:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_lts, 0);
}

@end