@interface UMLUserManifest
+ (id)manifestFromData:(id)a3;
- (NSData)dataValue;
- (NSMutableArray)lruList;
- (NSMutableArray)syncUserList;
- (NSMutableArray)users;
- (NSString)fsVolumeType;
- (UMLUserManifest)init;
- (int)deviceConfig;
- (int)lastBootedUser;
- (int)loginuiCheck;
- (int)maxUsers;
- (int)networkBG;
- (int)userSessionType;
- (int)version;
- (int64_t)apnsIDStart;
- (int64_t)maxUserSize;
- (unint64_t)generation;
- (void)setApnsIDStart:(int64_t)a3;
- (void)setDeviceConfig:(int)a3;
- (void)setFsVolumeType:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setLastBootedUser:(int)a3;
- (void)setLoginuiCheck:(int)a3;
- (void)setLruList:(id)a3;
- (void)setMaxUserSize:(int64_t)a3;
- (void)setMaxUsers:(int)a3;
- (void)setNetworkBG:(int)a3;
- (void)setSyncUserList:(id)a3;
- (void)setUserSessionType:(int)a3;
- (void)setUsers:(id)a3;
- (void)setVersion:(int)a3;
@end

@implementation UMLUserManifest

- (UMLUserManifest)init
{
  v13.receiver = self;
  v13.super_class = (Class)UMLUserManifest;
  v2 = [(UMLUserManifest *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v2->_networkBG = 0;
    *(_OWORD *)&v2->_deviceConfig = xmmword_2608D5C80;
    fsVolumeType = v2->_fsVolumeType;
    v2->_apnsIDStart = 1;
    v2->_fsVolumeType = (NSString *)@"UserVolumeAPFSNative";
    v2->_maxUserSize = 0;

    uint64_t v5 = objc_opt_new();
    users = v3->_users;
    v3->_users = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    syncUserList = v3->_syncUserList;
    v3->_syncUserList = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    lruList = v3->_lruList;
    v3->_lruList = (NSMutableArray *)v9;

    v11 = v3;
  }

  return v3;
}

- (NSData)dataValue
{
  v3 = objc_opt_new();
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest deviceConfig](self, "deviceConfig"));
  [v3 setObject:v4 forKeyedSubscript:@"DEVICECONFIG"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest lastBootedUser](self, "lastBootedUser"));
  [v3 setObject:v5 forKeyedSubscript:@"BOOTEDUSER"];

  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UMLUserManifest apnsIDStart](self, "apnsIDStart"));
  [v3 setObject:v6 forKeyedSubscript:@"APNSID"];

  uint64_t v7 = [(UMLUserManifest *)self fsVolumeType];
  [v3 setObject:v7 forKeyedSubscript:@"MKBUserSessionVolumeFSType"];

  if (([(UMLUserManifest *)self maxUsers] & 0x80000000) == 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest maxUsers](self, "maxUsers"));
    [v3 setObject:v8 forKeyedSubscript:@"MAXUSER"];
  }
  if ([(UMLUserManifest *)self maxUserSize] >= 1)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UMLUserManifest maxUserSize](self, "maxUserSize"));
    [v3 setObject:v9 forKeyedSubscript:@"MAXUSERSIZE"];
  }
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest userSessionType](self, "userSessionType"));
  [v3 setObject:v10 forKeyedSubscript:@"USESSTYPE"];

  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest loginuiCheck](self, "loginuiCheck"));
  [v3 setObject:v11 forKeyedSubscript:@"LOGINCHECKIN"];

  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest networkBG](self, "networkBG"));
  [v3 setObject:v12 forKeyedSubscript:@"DEVICENETWORKBG"];

  objc_super v13 = [(UMLUserManifest *)self syncUserList];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = NSNumber;
    v16 = [(UMLUserManifest *)self syncUserList];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    [v3 setObject:v17 forKeyedSubscript:@"SYNCENT"];

    v18 = [(UMLUserManifest *)self syncUserList];
    v19 = sub_2608C7624((uint64_t)v18);
    [v3 setObject:v19 forKeyedSubscript:@"SYNCBLOB"];
  }
  v20 = [(UMLUserManifest *)self lruList];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = NSNumber;
    v23 = [(UMLUserManifest *)self lruList];
    v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    [v3 setObject:v24 forKeyedSubscript:@"LRUENT"];

    v25 = [(UMLUserManifest *)self lruList];
    v26 = sub_2608C7624((uint64_t)v25);
    [v3 setObject:v26 forKeyedSubscript:@"LRUBLOB"];
  }
  v27 = [(UMLUserManifest *)self users];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = NSNumber;
    v30 = [(UMLUserManifest *)self users];
    v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
    [v3 setObject:v31 forKeyedSubscript:@"NUMENT"];

    v32 = [(UMLUserManifest *)self users];
    v33 = sub_2608C7624((uint64_t)v32);
    [v3 setObject:v33 forKeyedSubscript:@"BLOB"];
  }
  v34 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUserManifest version](self, "version"));
  [v3 setObject:v34 forKeyedSubscript:@"UserManifestVersion"];

  v35 = sub_2608C7494((uint64_t)v3);

  return (NSData *)v35;
}

+ (id)manifestFromData:(id)a3
{
  v3 = sub_2608C77B4((uint64_t)a3);
  if (!v3)
  {
    if (qword_26A8C3848 != -1) {
      dispatch_once(&qword_26A8C3848, &unk_270CAA008);
    }
    v10 = (id)qword_26A8C3840;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_2608CE99C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        uint64_t v14 = (void *)v13;
        if (v13) {
          sub_2608CE9C4(v13);
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      free(v14);
    }
    v4 = 0;
    goto LABEL_54;
  }
  v4 = objc_alloc_init(UMLUserManifest);
  [(UMLUserManifest *)v4 setVersion:sub_2608C6E6C(v3, @"UserManifestVersion", 1)];
  if (*__error() == 2)
  {
    if (qword_26A8C3848 != -1) {
      dispatch_once(&qword_26A8C3848, &unk_270CAA008);
    }
    uint64_t v5 = (id)qword_26A8C3840;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_2608CE99C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
        uint64_t v8 = _os_log_send_and_compose_impl();
        uint64_t v9 = (void *)v8;
        if (v8) {
          sub_2608CE9C4(v8);
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      free(v9);
    }
  }
  [(UMLUserManifest *)v4 setDeviceConfig:sub_2608C6E6C(v3, @"DEVICECONFIG", 0)];
  if (*__error() == 2)
  {
    if (qword_26A8C3848 != -1) {
      dispatch_once(&qword_26A8C3848, &unk_270CAA008);
    }
    v15 = (id)qword_26A8C3840;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_2608CE99C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18) {
          sub_2608CE9C4(v18);
        }
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }
  }
  [(UMLUserManifest *)v4 setLastBootedUser:sub_2608C6E6C(v3, @"BOOTEDUSER", 0)];
  [(UMLUserManifest *)v4 setApnsIDStart:sub_2608C6F7C(v3, @"APNSID", 1)];
  v20 = sub_2608C708C(v3, @"MKBUserSessionVolumeFSType");
  [(UMLUserManifest *)v4 setFsVolumeType:v20];

  uint64_t v21 = [(UMLUserManifest *)v4 fsVolumeType];

  if (!v21) {
    [(UMLUserManifest *)v4 setFsVolumeType:@"UserVolumeAPFSNative"];
  }
  [(UMLUserManifest *)v4 setMaxUsers:sub_2608C6E6C(v3, @"MAXUSER", 0xFFFFFFFFLL)];
  [(UMLUserManifest *)v4 setMaxUserSize:sub_2608C6F7C(v3, @"MAXUSERSIZE", 0)];
  [(UMLUserManifest *)v4 setUserSessionType:sub_2608C6E6C(v3, @"USESSTYPE", 0)];
  [(UMLUserManifest *)v4 setLoginuiCheck:sub_2608C6E6C(v3, @"LOGINCHECKIN", 0)];
  [(UMLUserManifest *)v4 setNetworkBG:sub_2608C6E6C(v3, @"DEVICENETWORKBG", 0)];
  if ((int)sub_2608C6E6C(v3, @"NUMENT", 0) >= 1)
  {
    v22 = sub_2608C7404(v3, @"BLOB");
    v23 = sub_2608C7A44((uint64_t)v22);
    v24 = v23;
    if (v23)
    {
      v25 = (void *)[v23 mutableCopy];
      [(UMLUserManifest *)v4 setUsers:v25];
    }
  }
  if ((int)sub_2608C6E6C(v3, @"SYNCENT", 0) >= 1)
  {
    v26 = sub_2608C7404(v3, @"SYNCBLOB");
    v27 = sub_2608C7A44((uint64_t)v26);
    uint64_t v28 = v27;
    if (v27)
    {
      v29 = (void *)[v27 mutableCopy];
      [(UMLUserManifest *)v4 setSyncUserList:v29];
    }
  }
  if ((int)sub_2608C6E6C(v3, @"LRUENT", 0) >= 1)
  {
    v10 = sub_2608C7404(v3, @"LRUBLOB");
    v30 = sub_2608C7A44((uint64_t)v10);
    v31 = v30;
    if (v30)
    {
      v32 = (void *)[v30 mutableCopy];
      [(UMLUserManifest *)v4 setLruList:v32];
    }
LABEL_54:
  }
  return v4;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (int)lastBootedUser
{
  return self->_lastBootedUser;
}

- (void)setLastBootedUser:(int)a3
{
  self->_lastBootedUser = a3;
}

- (int)deviceConfig
{
  return self->_deviceConfig;
}

- (void)setDeviceConfig:(int)a3
{
  self->_deviceConfig = a3;
}

- (int64_t)apnsIDStart
{
  return self->_apnsIDStart;
}

- (void)setApnsIDStart:(int64_t)a3
{
  self->_apnsIDStart = a3;
}

- (NSString)fsVolumeType
{
  return self->_fsVolumeType;
}

- (void)setFsVolumeType:(id)a3
{
}

- (int)maxUsers
{
  return self->_maxUsers;
}

- (void)setMaxUsers:(int)a3
{
  self->_maxUsers = a3;
}

- (int64_t)maxUserSize
{
  return self->_maxUserSize;
}

- (void)setMaxUserSize:(int64_t)a3
{
  self->_maxUserSize = a3;
}

- (int)userSessionType
{
  return self->_userSessionType;
}

- (void)setUserSessionType:(int)a3
{
  self->_userSessionType = a3;
}

- (int)loginuiCheck
{
  return self->_loginuiCheck;
}

- (void)setLoginuiCheck:(int)a3
{
  self->_loginuiCheck = a3;
}

- (int)networkBG
{
  return self->_networkBG;
}

- (void)setNetworkBG:(int)a3
{
  self->_networkBG = a3;
}

- (NSMutableArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSMutableArray)syncUserList
{
  return self->_syncUserList;
}

- (void)setSyncUserList:(id)a3
{
}

- (NSMutableArray)lruList
{
  return self->_lruList;
}

- (void)setLruList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lruList, 0);
  objc_storeStrong((id *)&self->_syncUserList, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_fsVolumeType, 0);
}

@end