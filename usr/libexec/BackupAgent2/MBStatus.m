@interface MBStatus
+ (MBStatus)statusWithDrive:(id)a3 path:(id)a4 error:(id *)a5;
+ (id)status;
+ (id)stringWithBackupState:(int)a3;
+ (id)stringWithSnapshotState:(int)a3;
+ (int)backupStateWithString:(id)a3;
+ (int)snapshotStateWithString:(id)a3;
- (BOOL)isBackupEmpty;
- (BOOL)isBackupNew;
- (BOOL)isBackupOld;
- (BOOL)isFinished;
- (BOOL)isFullBackup;
- (BOOL)isMoving;
- (BOOL)isRemoving;
- (BOOL)isUploading;
- (BOOL)isVersionAmbiguous;
- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5;
- (MBStatus)init;
- (MBStatus)initWithPropertyList:(id)a3;
- (NSDate)date;
- (NSString)backupStateName;
- (NSString)snapshotStateName;
- (NSString)uuid;
- (double)version;
- (id)description;
- (id)propertyList;
- (int)backupState;
- (int)snapshotState;
- (void)dealloc;
- (void)setBackupState:(int)a3;
- (void)setDate:(id)a3;
- (void)setFullBackup:(BOOL)a3;
- (void)setSnapshotState:(int)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(double)a3;
@end

@implementation MBStatus

+ (int)backupStateWithString:(id)a3
{
  if ([a3 isEqualToString:@"empty"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"old"]) {
    return 1;
  }
  if (([a3 isEqualToString:@"new"] & 1) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"Invalid backup state name: %@", a3 format]);
  }
  return 2;
}

+ (id)stringWithBackupState:(int)a3
{
  if (a3 < 3) {
    return off_1000F1E98[a3];
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"MBStatus.m", 40, @"Invalid backup state: %d", *(void *)&a3 object file lineNumber description];
  return 0;
}

+ (int)snapshotStateWithString:(id)a3
{
  if ([a3 isEqualToString:@"uploading"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"moving"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"removing"]) {
    return 2;
  }
  if (([a3 isEqualToString:@"finished"] & 1) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"Invalid snapshot state name: %@", a3 format]);
  }
  return 3;
}

+ (id)stringWithSnapshotState:(int)a3
{
  if (a3 < 4) {
    return off_1000F1EB0[a3];
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"MBStatus.m", 71, @"Invalid snapshot state: %d", *(void *)&a3 object file lineNumber description];
  return 0;
}

+ (id)status
{
  v2 = objc_alloc_init(MBStatus);

  return v2;
}

+ (MBStatus)statusWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v5 = [a3 propertyListAtPath:a4 options:0];
  if (v5) {
    return [[MBStatus alloc] initWithPropertyList:v5];
  }
  else {
    return 0;
  }
}

- (MBStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBStatus;
  result = [(MBStatus *)&v3 init];
  if (result) {
    result->_version = 3.3;
  }
  return result;
}

- (MBStatus)initWithPropertyList:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Status.plist not a dictionary";
    goto LABEL_25;
  }
  v20.receiver = self;
  v20.super_class = (Class)MBStatus;
  id v5 = [(MBStatus *)&v20 init];
  if (v5)
  {
    id v6 = [a3 objectForKeyedSubscript:@"Backup Success"];
    id v7 = [a3 objectForKeyedSubscript:@"Version"];
    if (!v7)
    {
      v5->_version = 0.0;
      v5->_versionAmbiguous = 0;
      goto LABEL_16;
    }
    v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      v5->_version = v9;
      if (v9 != 0.0 && (v9 < 2.4 || v9 >= 4.0))
      {
        id v18 = [objc_alloc((Class)MBException) initWithCode:203 format:@"Unsupported status version: %0.1f", *(void *)&v5->_version];
LABEL_26:
        objc_exception_throw(v18);
      }
      v5->_versionAmbiguous = v6 != 0;
      if (v9 >= 2.0)
      {
        id v10 = [a3 objectForKeyedSubscript:@"UUID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v5->_uuid = (NSString *)v10;
          id v11 = [a3 objectForKeyedSubscript:@"Date"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v5->_date = (NSDate *)v11;
            id v12 = [a3 objectForKeyedSubscript:@"BackupState"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v5->_backupState = +[MBStatus backupStateWithString:v12];
              id v13 = [a3 objectForKeyedSubscript:@"SnapshotState"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v5->_snapshotState = +[MBStatus snapshotStateWithString:v13];
                id v14 = [a3 objectForKeyedSubscript:@"IsFullBackup"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v5->_fullBackup = [v14 BOOLValue];
                  return v5;
                }
                id v16 = objc_alloc((Class)MBException);
                CFStringRef v17 = @"IsFullBackup value not a number";
              }
              else
              {
                id v16 = objc_alloc((Class)MBException);
                CFStringRef v17 = @"SnapshotState not a string";
              }
            }
            else
            {
              id v16 = objc_alloc((Class)MBException);
              CFStringRef v17 = @"BackupState not a string";
            }
          }
          else
          {
            id v16 = objc_alloc((Class)MBException);
            CFStringRef v17 = @"Date value not a date";
          }
        }
        else
        {
          id v16 = objc_alloc((Class)MBException);
          CFStringRef v17 = @"UUID value not a string";
        }
        goto LABEL_25;
      }
LABEL_16:
      v5->_backupState = 1;
      return v5;
    }
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Version value not a NSNumber";
LABEL_25:
    id v18 = [v16 initWithCode:11 format:v17, v19];
    goto LABEL_26;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBStatus;
  [(MBStatus *)&v3 dealloc];
}

- (NSString)backupStateName
{
  return (NSString *)+[MBStatus stringWithBackupState:self->_backupState];
}

- (BOOL)isBackupEmpty
{
  return self->_backupState == 0;
}

- (BOOL)isBackupOld
{
  return self->_backupState == 1;
}

- (BOOL)isBackupNew
{
  return self->_backupState == 2;
}

- (NSString)snapshotStateName
{
  return (NSString *)+[MBStatus stringWithSnapshotState:self->_snapshotState];
}

- (BOOL)isUploading
{
  return self->_snapshotState == 0;
}

- (BOOL)isMoving
{
  return self->_snapshotState == 1;
}

- (BOOL)isRemoving
{
  return self->_snapshotState == 2;
}

- (BOOL)isFinished
{
  return self->_snapshotState == 3;
}

- (id)propertyList
{
  if (self->_version != 3.3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBStatus.m" lineNumber:188 description:@"Saving old status format?"];
  }
  objc_super v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [(NSMutableDictionary *)v3 setObject:+[NSString stringWithFormat:@"%0.1f", 0x400A666666666666] forKeyedSubscript:@"Version"];
  [(NSMutableDictionary *)v3 setObject:self->_uuid forKeyedSubscript:@"UUID"];
  [(NSMutableDictionary *)v3 setObject:self->_date forKeyedSubscript:@"Date"];
  [(NSMutableDictionary *)v3 setObject:[(MBStatus *)self backupStateName] forKeyedSubscript:@"BackupState"];
  [(NSMutableDictionary *)v3 setObject:[(MBStatus *)self snapshotStateName] forKeyedSubscript:@"SnapshotState"];
  [(NSMutableDictionary *)v3 setObject:+[NSNumber numberWithBool:self->_fullBackup] forKeyedSubscript:@"IsFullBackup"];
  return v3;
}

- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v8 = [(MBStatus *)self propertyList];

  return [a3 uploadPropertyList:v8 toPath:a4 options:0 error:a5];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(MBStatus *)self version];
  return +[NSString stringWithFormat:@"<%@: version=%0.1f, date=%@, backupState=%@, snapshotState=%@, fullBackup=%d>", v3, v4, [(MBStatus *)self date], [(MBStatus *)self backupStateName], [(MBStatus *)self snapshotStateName], [(MBStatus *)self isFullBackup]];
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int)backupState
{
  return self->_backupState;
}

- (void)setBackupState:(int)a3
{
  self->_backupState = a3;
}

- (int)snapshotState
{
  return self->_snapshotState;
}

- (void)setSnapshotState:(int)a3
{
  self->_snapshotState = a3;
}

- (BOOL)isVersionAmbiguous
{
  return self->_versionAmbiguous;
}

- (BOOL)isFullBackup
{
  return self->_fullBackup;
}

- (void)setFullBackup:(BOOL)a3
{
  self->_fullBackup = a3;
}

@end