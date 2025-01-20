@interface MBServiceRestoreSession
+ (MBServiceRestoreSession)restoreSessionWithPropertyList:(id)a3;
+ (id)currentRestoreSessionWithAccount:(id)a3;
+ (void)clearCurrentRestoreSessionWithAccount:(id)a3;
- (BOOL)isFinishing;
- (BOOL)isMBSSession;
- (BOOL)wasCancelled;
- (MBServiceRestoreSession)initWithPersonaIdentifier:(id)a3;
- (MBServiceRestoreSession)initWithPropertyList:(id)a3;
- (NSDate)startDate;
- (NSString)backupUDID;
- (NSString)personaIdentifier;
- (NSString)snapshotUUID;
- (id)description;
- (id)propertyList;
- (int64_t)snapshotBackupPolicy;
- (unint64_t)snapshotID;
- (unint64_t)telemetryID;
- (void)saveAtPath:(id)a3;
- (void)setBackupUDID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setFinishing:(BOOL)a3;
- (void)setSnapshotBackupPolicy:(int64_t)a3;
- (void)setSnapshotID:(unint64_t)a3;
- (void)setSnapshotUUID:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTelemetryID:(unint64_t)a3;
@end

@implementation MBServiceRestoreSession

+ (id)currentRestoreSessionWithAccount:(id)a3
{
  v3 = [a3 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"RestoreSession" class:objc_opt_class()];

  if (v4)
  {
    v5 = +[MBServiceRestoreSession restoreSessionWithPropertyList:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)clearCurrentRestoreSessionWithAccount:(id)a3
{
  id v3 = [a3 persona];
  [v3 setPreferencesValue:0 forKey:@"RestoreSession"];
}

+ (MBServiceRestoreSession)restoreSessionWithPropertyList:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreSession alloc] initWithPropertyList:v3];

  return v4;
}

- (MBServiceRestoreSession)initWithPersonaIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBServiceRestoreSession;
  v5 = [(MBServiceRestoreSession *)&v11 init];
  if (v5)
  {
    v6 = (NSDate *)objc_alloc_init((Class)NSDate);
    startDate = v5->_startDate;
    v5->_startDate = v6;

    v8 = (NSString *)[v4 copy];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = v8;
  }
  return v5;
}

- (MBServiceRestoreSession)initWithPropertyList:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MBServiceRestoreSession;
  v5 = [(MBServiceRestoreSession *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"personaIdentifier"];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"backupUDID"];
    backupUDID = v5->_backupUDID;
    v5->_backupUDID = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"snapshotID"];
    v5->_snapshotID = (unint64_t)[v10 unsignedIntegerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"snapshotUUID"];
    snapshotUUID = v5->_snapshotUUID;
    v5->_snapshotUUID = (NSString *)v11;

    v13 = [v4 objectForKeyedSubscript:@"startDate"];
    v14 = v13;
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = (NSDate *)objc_alloc_init((Class)NSDate);
    }
    startDate = v5->_startDate;
    v5->_startDate = v15;

    v17 = [v4 objectForKeyedSubscript:@"finishing"];
    v5->_finishing = [v17 BOOLValue];

    v18 = [v4 objectForKeyedSubscript:@"cancelled"];
    v5->_cancelled = [v18 BOOLValue];

    v19 = [v4 objectForKeyedSubscript:@"snapshotBackupPolicy"];
    v5->_snapshotBackupPolicy = (int64_t)[v19 integerValue];

    v20 = [v4 objectForKeyedSubscript:@"telemetryID"];
    v5->_telemetryID = (unint64_t)[v20 integerValue];
  }
  return v5;
}

- (BOOL)isMBSSession
{
  return self->_snapshotUUID == 0;
}

- (id)propertyList
{
  if (!self->_backupUDID)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreSession.m" lineNumber:63 description:@"Backup UDID not set"];
  }
  if (![(MBServiceRestoreSession *)self snapshotID])
  {
    id v4 = [(MBServiceRestoreSession *)self snapshotUUID];

    if (!v4)
    {
      v5 = +[NSAssertionHandler currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreSession.m" lineNumber:64 description:@"Snapshot ID/UUID is not set"];
    }
  }
  if (!self->_startDate)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreSession.m" lineNumber:65 description:@"Start date is not set"];
  }
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
  [v6 setObject:self->_personaIdentifier forKeyedSubscript:@"personaIdentifier"];
  [v6 setObject:self->_backupUDID forKeyedSubscript:@"backupUDID"];
  [v6 setObject:self->_snapshotUUID forKeyedSubscript:@"snapshotUUID"];
  v7 = +[NSNumber numberWithUnsignedInteger:self->_snapshotID];
  [v6 setObject:v7 forKeyedSubscript:@"snapshotID"];

  [v6 setObject:self->_startDate forKeyedSubscript:@"startDate"];
  uint64_t v8 = +[NSNumber numberWithBool:self->_finishing];
  [v6 setObject:v8 forKeyedSubscript:@"finishing"];

  v9 = +[NSNumber numberWithBool:self->_cancelled];
  [v6 setObject:v9 forKeyedSubscript:@"cancelled"];

  v10 = +[NSNumber numberWithInteger:self->_snapshotBackupPolicy];
  [v6 setObject:v10 forKeyedSubscript:@"snapshotBackupPolicy"];

  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:self->_telemetryID];
  [v6 setObject:v11 forKeyedSubscript:@"telemetryID"];

  return v6;
}

- (void)saveAtPath:(id)a3
{
  id v4 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v4;
    __int16 v29 = 2112;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving restore session at %@: %@", buf, 0x16u);
    v23 = self;
    _MBLog();
  }

  id v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:v4];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  v9 = v8;

  v10 = [(MBServiceRestoreSession *)self propertyList];
  [v9 setObject:v10 forKeyedSubscript:@"RestoreSession"];

  uint64_t v11 = +[NSFileManager defaultManager];
  v12 = [v4 stringByDeletingLastPathComponent];
  id v26 = 0;
  unsigned __int8 v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v14 = v26;

  if ((v13 & 1) == 0)
  {
    if (MBIsInternalInstall())
    {
      v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Error creating restore session dir %@", buf, 0xCu);
        _MBLog();
      }
    }
    id v20 = [objc_alloc((Class)MBException) initWithCode:1, @"Error creating restore session dir %@", v14, v23 format];
LABEL_25:
    objc_exception_throw(v20);
  }
  id v25 = 0;
  v15 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:&v25];
  id v16 = v25;

  if (!v15)
  {
    if (MBIsInternalInstall())
    {
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Failed to serialize property list %@", buf, 0xCu);
        _MBLog();
      }
    }
    id v20 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to serialize property list %@", v16, v23 format];
    goto LABEL_25;
  }
  id v24 = v16;
  unsigned __int8 v17 = [v15 writeToFile:v4 options:268435457 error:&v24];
  id v18 = v24;

  if ((v17 & 1) == 0)
  {
    if (MBIsInternalInstall())
    {
      objc_super v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Failed to write property list %@", buf, 0xCu);
        _MBLog();
      }
    }
    id v20 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to write property list %@", v18, v23 format];
    goto LABEL_25;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: personaIdentifier=%@ backupUDID=%@, snapshotID=%u, snapshotUUID=%@, startDate=%@, finishing=%d, cancelled=%d, snapshotBackupPolicy=%lu telemetryID=%lu>", objc_opt_class(), self->_personaIdentifier, self->_backupUDID, self->_snapshotID, self->_snapshotUUID, self->_startDate, self->_finishing, self->_cancelled, self->_snapshotBackupPolicy, self->_telemetryID];
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (void)setSnapshotUUID:(id)a3
{
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (BOOL)isFinishing
{
  return self->_finishing;
}

- (void)setFinishing:(BOOL)a3
{
  self->_finishing = a3;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)snapshotBackupPolicy
{
  return self->_snapshotBackupPolicy;
}

- (void)setSnapshotBackupPolicy:(int64_t)a3
{
  self->_snapshotBackupPolicy = a3;
}

- (unint64_t)telemetryID
{
  return self->_telemetryID;
}

- (void)setTelemetryID:(unint64_t)a3
{
  self->_telemetryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_backupUDID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

@end