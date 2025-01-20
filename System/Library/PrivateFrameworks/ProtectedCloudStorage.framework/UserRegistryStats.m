@interface UserRegistryStats
+ (BOOL)supportsSecureCoding;
- (UserRegistryStats)initWithCoder:(id)a3;
- (id)getUserRegistryStats;
- (int64_t)fetchRecordZoneChanges;
- (int64_t)lastfetchRecordZoneChangesAtStart;
- (int64_t)pushNotifications;
- (int64_t)recordFetch;
- (int64_t)recordModify;
- (int64_t)zoneReset;
- (void)encodeWithCoder:(id)a3;
- (void)printUserRegistryStats:(__sFILE *)a3;
- (void)setFetchRecordZoneChanges:(int64_t)a3;
- (void)setLastfetchRecordZoneChangesAtStart:(int64_t)a3;
- (void)setPushNotifications:(int64_t)a3;
- (void)setRecordFetch:(int64_t)a3;
- (void)setRecordModify:(int64_t)a3;
- (void)setZoneReset:(int64_t)a3;
@end

@implementation UserRegistryStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats fetchRecordZoneChanges](self, "fetchRecordZoneChanges"), @"fetchRecordZoneChanges");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats lastfetchRecordZoneChangesAtStart](self, "lastfetchRecordZoneChangesAtStart"), @"lastfetchRecordZoneChangesAtStart");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats pushNotifications](self, "pushNotifications"), @"pushNotifications");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats zoneReset](self, "zoneReset"), @"zoneReset");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats recordFetch](self, "recordFetch"), @"recordFetch");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats recordModify](self, "recordModify"), @"recordModify");
}

- (UserRegistryStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UserRegistryStats;
  v5 = [(UserRegistryStats *)&v7 init];
  if (v5)
  {
    -[UserRegistryStats setFetchRecordZoneChanges:](v5, "setFetchRecordZoneChanges:", [v4 decodeInt64ForKey:@"fetchRecordZoneChanges"]);
    -[UserRegistryStats setLastfetchRecordZoneChangesAtStart:](v5, "setLastfetchRecordZoneChangesAtStart:", [v4 decodeInt64ForKey:@"lastfetchRecordZoneChangesAtStart"]);
    -[UserRegistryStats setPushNotifications:](v5, "setPushNotifications:", [v4 decodeInt64ForKey:@"pushNotifications"]);
    -[UserRegistryStats setZoneReset:](v5, "setZoneReset:", [v4 decodeInt64ForKey:@"zoneReset"]);
    -[UserRegistryStats setRecordFetch:](v5, "setRecordFetch:", [v4 decodeInt64ForKey:@"recordFetch"]);
    -[UserRegistryStats setRecordModify:](v5, "setRecordModify:", [v4 decodeInt64ForKey:@"recordModify"]);
  }

  return v5;
}

- (void)printUserRegistryStats:(__sFILE *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  time_t v6 = [(UserRegistryStats *)self lastfetchRecordZoneChangesAtStart];
  if (v6)
  {
    memset(&v5, 0, sizeof(v5));
    localtime_r(&v6, &v5);
    strftime(v7, 0x80uLL, "%Y-%m-%d-%H:%M:%S", &v5);
  }
  else
  {
    __strlcpy_chk();
  }
  fwrite("UserRegistryStats:\n\n", 0x14uLL, 1uLL, a3);
  fprintf(a3, "\tfetchRecordZoneChanges: %lld\n", [(UserRegistryStats *)self fetchRecordZoneChanges]);
  fprintf(a3, "\tlastfetchRecordZoneChangesAtStart: %s\n", v7);
  fprintf(a3, "\tpushNotifications: %lld\n", [(UserRegistryStats *)self pushNotifications]);
  fprintf(a3, "\tzoneReset: %lld\n", [(UserRegistryStats *)self zoneReset]);
  fprintf(a3, "\trecordFetch: %lld\n", [(UserRegistryStats *)self recordFetch]);
  fprintf(a3, "\trecordModify: %lld\n", [(UserRegistryStats *)self recordModify]);
  fputc(10, a3);
}

- (id)getUserRegistryStats
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  time_t v12 = [(UserRegistryStats *)self lastfetchRecordZoneChangesAtStart];
  if (v12)
  {
    memset(&v11, 0, sizeof(v11));
    localtime_r(&v12, &v11);
    strftime(v13, 0x80uLL, "%Y-%m-%d-%H:%M:%S", &v11);
  }
  else
  {
    __strlcpy_chk();
  }
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UserRegistryStats fetchRecordZoneChanges](self, "fetchRecordZoneChanges"));
  [v3 setObject:v4 forKeyedSubscript:@"fetch_record_zone_changes"];

  tm v5 = (void *)[[NSString alloc] initWithUTF8String:v13];
  [v3 setObject:v5 forKeyedSubscript:@"last_fetch_record_zone_changes_at_start"];

  time_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UserRegistryStats pushNotifications](self, "pushNotifications"));
  [v3 setObject:v6 forKeyedSubscript:@"push_notifications"];

  objc_super v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UserRegistryStats zoneReset](self, "zoneReset"));
  [v3 setObject:v7 forKeyedSubscript:@"zone_reset"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UserRegistryStats recordFetch](self, "recordFetch"));
  [v3 setObject:v8 forKeyedSubscript:@"record_fetch"];

  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UserRegistryStats recordModify](self, "recordModify"));
  [v3 setObject:v9 forKeyedSubscript:@"record_modify"];

  return v3;
}

- (int64_t)fetchRecordZoneChanges
{
  return self->_fetchRecordZoneChanges;
}

- (void)setFetchRecordZoneChanges:(int64_t)a3
{
  self->_fetchRecordZoneChanges = a3;
}

- (int64_t)lastfetchRecordZoneChangesAtStart
{
  return self->_lastfetchRecordZoneChangesAtStart;
}

- (void)setLastfetchRecordZoneChangesAtStart:(int64_t)a3
{
  self->_lastfetchRecordZoneChangesAtStart = a3;
}

- (int64_t)pushNotifications
{
  return self->_pushNotifications;
}

- (void)setPushNotifications:(int64_t)a3
{
  self->_pushNotifications = a3;
}

- (int64_t)zoneReset
{
  return self->_zoneReset;
}

- (void)setZoneReset:(int64_t)a3
{
  self->_zoneReset = a3;
}

- (int64_t)recordFetch
{
  return self->_recordFetch;
}

- (void)setRecordFetch:(int64_t)a3
{
  self->_recordFetch = a3;
}

- (int64_t)recordModify
{
  return self->_recordModify;
}

- (void)setRecordModify:(int64_t)a3
{
  self->_recordModify = a3;
}

@end