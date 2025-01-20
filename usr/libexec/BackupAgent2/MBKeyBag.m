@interface MBKeyBag
+ (BOOL)isDeviceKeyBagLocked;
+ (BOOL)unregisterOTAKeyBagWithError:(id *)a3;
+ (BOOL)wasDeviceUnlockedSinceBoot;
+ (MBKeyBag)keybagWithData:(id)a3 error:(id *)a4;
+ (MBKeyBag)keybagWithPassword:(id)a3 error:(id *)a4;
+ (__MKBAssertion)holdLockAssertion:(id)a3;
+ (id)OTAKeyBagWithData:(id)a3 error:(id *)a4;
+ (id)OTAKeyBagWithSecret:(id)a3 error:(id *)a4;
+ (id)errorWithReturnCode:(int)a3 description:(id)a4;
+ (id)errorWithReturnCode:(int)a3 path:(id)a4 description:(id)a5;
+ (id)randomSecret;
+ (id)sharedOTAKeyBag;
+ (id)unlockedKeyBagWithData:(id)a3 password:(id)a4 error:(id *)a5;
+ (int)codeWithReturnCode:(int)a3;
+ (void)releaseLockAssertion:(__MKBAssertion *)a3;
+ (void)startOTABackup;
+ (void)startOTABackupForVolumeUUID:(id)a3;
+ (void)stopOTABackup;
+ (void)stopOTABackupForVolumeUUID:(id)a3;
- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5;
- (BOOL)changeSecretFrom:(id)a3 toSecret:(id)a4 error:(id *)a5;
- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 error:(id *)a6;
- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 hardwareModel:(id)a6 error:(id *)a7;
- (BOOL)isOTA;
- (BOOL)isUnlocked;
- (BOOL)registerWithPasscode:(id)a3 error:(id *)a4;
- (BOOL)unlockWithPassword:(id)a3 error:(id *)a4;
- (BOOL)unlockWithSecret:(id)a3 error:(id *)a4;
- (BOOL)validateEncryptionKey:(id)a3 file:(_mkbfileref *)a4 path:(id)a5 error:(id *)a6;
- (BOOL)validateWrappedKey:(id)a3 error:(id *)a4;
- (MBKeyBag)initWithHandle:(__MKBKeyBagHandle *)a3 OTA:(BOOL)a4;
- (MBKeyBag)initWithOTAHandle:(__MKBOTABackupBagHandle *)a3 keyBagData:(id)a4;
- (NSData)keyBagData;
- (_mkbfileref)encryptedFileForRestoreWithPath:(id)a3 key:(id)a4 error:(id *)a5;
- (id)UUIDWithError:(id *)a3;
- (id)dataWithError:(id *)a3;
- (id)encryptionKeyForFile:(_mkbfileref *)a3 path:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setIsUnlocked:(BOOL)a3;
- (void)setKeyBagData:(id)a3;
- (void)setOTA:(BOOL)a3;
@end

@implementation MBKeyBag

+ (__MKBAssertion)holdLockAssertion:(id)a3
{
  id v3 = a3;
  int valuePtr = 300;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_1000F22B0;
  values[0] = @"Other";
  values[1] = v4;
  CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = (__MKBAssertion *)MKBDeviceLockAssertion();
  CFRelease(v5);
  CFRelease(v4);
  v7 = MBGetDefaultLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v12 = v3;
      __int16 v13 = 2048;
      v14 = v6;
      __int16 v15 = 1024;
      int v16 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Holding \"%{public}@\" keybag lock assertion (%p) for %ds", buf, 0x1Cu);
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to acquire keybag lock assertion \"%{public}@\": %@", buf, 0x16u);
    _MBLog();
  }

  return v6;
}

+ (void)releaseLockAssertion:(__MKBAssertion *)a3
{
  if (a3)
  {
    CFNumberRef v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing keybag lock assertion (%p)", buf, 0xCu);
      _MBLog();
    }

    CFRelease(a3);
  }
}

+ (BOOL)wasDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

+ (BOOL)isDeviceKeyBagLocked
{
  return MKBGetDeviceLockState() == 1;
}

+ (int)codeWithReturnCode:(int)a3
{
  int result = 208;
  switch(a3)
  {
    case -8:
      int result = 4;
      break;
    case -6:
      uint64_t v6 = *__error();
      int result = +[MBError codeForErrno:v6];
      break;
    case -4:
      int result = 3;
      break;
    case -3:
      int result = 207;
      break;
    case -2:
      return result;
    case -1:
      int result = 1;
      break;
    default:
      CFDictionaryRef v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v8 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No code for MobileKeyBag error: %d", buf, 8u);
        _MBLog();
      }

      int result = 100;
      break;
  }
  return result;
}

+ (id)errorWithReturnCode:(int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", +[MBKeyBag codeWithReturnCode:v4], @"%@ (%d)", v5, v4);

  return v6;
}

+ (id)errorWithReturnCode:(int)a3 path:(id)a4 description:(id)a5
{
  if (a3 == -6)
  {
    id v7 = a5;
    id v8 = a4;
    uint64_t v9 = (int)+[MBError codeForErrno:*__error()];
    +[MBError errorWithCode:v9, v8, @"%@ (%d/%d)", v7, 4294967290, *__error() path format];
  }
  else
  {
    +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", +[MBKeyBag codeWithReturnCode:*(void *)&a3], a4, @"%@ (%d)", a5, *(void *)&a3, v12);
  v10 = };

  return v10;
}

+ (MBKeyBag)keybagWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    __int16 v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"MBKeyBag.m" lineNumber:120 description:@"No keybag data"];
  }
  uint64_t v8 = MKBKeyBagCreateWithData();
  uint64_t v9 = MBGetDefaultLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateWithData: %d", buf, 8u);
      _MBLog();
    }

    if (a4)
    {
      +[MBKeyBag errorWithReturnCode:v8 description:@"MKBKeyBagCreateWithData error"];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MKBKeyBagCreateWithData: %d %p", buf, 0x12u);
      _MBLog();
    }

    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"MBKeyBag.m" lineNumber:125 description:@"MKBKeyBagCreateWithData succeeded but handle is null"];

    v11 = [[MBKeyBag alloc] initWithHandle:0 OTA:0];
    CFRelease(0);
  }

  return v11;
}

+ (id)unlockedKeyBagWithData:(id)a3 password:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = +[MBKeyBag keybagWithData:a3 error:a5];
  uint64_t v9 = v8;
  if (v8 && [v8 unlockWithPassword:v7 error:a5]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (MBKeyBag)keybagWithPassword:(id)a3 error:(id *)a4
{
  [a3 dataUsingEncoding:4];
  uint64_t Backup = MKBKeyBagCreateBackup();
  uint64_t v8 = MBGetDefaultLog();
  uint64_t v9 = v8;
  if (Backup)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = Backup;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateBackup: %d", buf, 8u);
      _MBLog();
    }

    if (a4)
    {
      +[MBKeyBag errorWithReturnCode:Backup description:@"MKBKeyBagCreateBackup error"];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MKBKeyBagCreateBackup: %d %p", buf, 0x12u);
      _MBLog();
    }

    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"MBKeyBag.m" lineNumber:156 description:@"MKBKeyBagCreateBackup succeeded but handle is null"];

    id v10 = [[MBKeyBag alloc] initWithHandle:0 OTA:0];
    CFRelease(0);
  }

  return v10;
}

+ (id)OTAKeyBagWithData:(id)a3 error:(id *)a4
{
  uint64_t v4 = +[MBKeyBag keybagWithData:a3 error:a4];
  [v4 setOTA:1];

  return v4;
}

+ (id)OTAKeyBagWithSecret:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    __int16 v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"MBKeyBag.m" lineNumber:175 description:@"Null secret"];
  }
  OTAuint64_t Backup = MKBKeyBagCreateOTABackup();
  uint64_t v9 = MBGetDefaultLog();
  id v10 = v9;
  if (OTABackup)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = OTABackup;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateOTABackup: %d", buf, 8u);
      _MBLog();
    }

    if (a4)
    {
      +[MBKeyBag errorWithReturnCode:OTABackup description:@"MKBKeyBagCreateOTABackup error"];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MKBKeyBagCreateOTABackup: %d %p", buf, 0x12u);
      _MBLog();
    }

    int v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"MBKeyBag.m" lineNumber:180 description:@"MKBKeyBagCreateOTABackup succeeded but handle is null"];

    v11 = [[MBKeyBag alloc] initWithHandle:0 OTA:1];
    CFRelease(0);
  }

  return v11;
}

+ (id)sharedOTAKeyBag
{
  if (qword_100113000 != -1) {
    dispatch_once(&qword_100113000, &stru_1000F22C0);
  }
  v2 = (void *)qword_100112FF8;

  return v2;
}

+ (BOOL)unregisterOTAKeyBagWithError:(id *)a3
{
  uint64_t v4 = MKBKeyBagRegisterOTABackup();
  id v5 = MBGetDefaultLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", buf, 8u);
      _MBLog();
    }

    if (a3)
    {
      *a3 = +[MBKeyBag errorWithReturnCode:v4 description:@"MKBKeyBagRegisterOTABackup error"];
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", buf, 8u);
      _MBLog();
    }
  }
  return v4 == 0;
}

+ (void)startOTABackup
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStart", buf, 2u);
    _MBLog();
  }

  int v3 = MKBOTABackupStart();
  if (v3)
  {
    int v4 = v3;
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MKBOTABackupStart failed: %d", buf, 8u);
      _MBLog();
    }
  }
}

+ (void)stopOTABackup
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStop", buf, 2u);
    _MBLog();
  }

  int v3 = MKBOTABackupStop();
  if (v3)
  {
    int v4 = v3;
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MKBOTABackupStop failed: %d", buf, 8u);
      _MBLog();
    }
  }
}

+ (void)startOTABackupForVolumeUUID:(id)a3
{
  id v3 = a3;
  int v4 = [v3 UUIDString];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStartForVolume %{public}@", buf, 0xCu);
    _MBLog();
  }

  v15[0] = 0;
  v15[1] = 0;
  [v3 getUUIDBytes:v15];
  uint64_t v6 = +[NSData dataWithBytes:v15 length:16];
  if (!v6) {
    sub_10009A4C8();
  }
  int v7 = (void *)v6;
  int v8 = MKBOTABackupStartForVolume();
  if (v8)
  {
    int v9 = v8;
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v4;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBOTABackupStartForVolume %{public}@ failed: %d", buf, 0x12u);
      _MBLog();
    }
  }
}

+ (void)stopOTABackupForVolumeUUID:(id)a3
{
  id v3 = a3;
  int v4 = [v3 UUIDString];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStopForVolume %{public}@", buf, 0xCu);
    _MBLog();
  }

  v15[0] = 0;
  v15[1] = 0;
  [v3 getUUIDBytes:v15];
  uint64_t v6 = +[NSData dataWithBytes:v15 length:16];
  if (!v6) {
    sub_10009A4F4();
  }
  int v7 = (void *)v6;
  int v8 = MKBOTABackupStopForVolume();
  if (v8)
  {
    int v9 = v8;
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v4;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBOTABackupStopForVolume %{public}@ failed: %d", buf, 0x12u);
      _MBLog();
    }
  }
}

+ (id)randomSecret
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Generating random keybag secret", v5, 2u);
    _MBLog();
  }

  id v3 = MBRandomDataWithLength();

  return v3;
}

- (MBKeyBag)initWithHandle:(__MKBKeyBagHandle *)a3 OTA:(BOOL)a4
{
  if (!a3)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MBKeyBag.m" lineNumber:264 description:@"Null keybag handle"];
  }
  v11.receiver = self;
  v11.super_class = (Class)MBKeyBag;
  int v7 = [(MBKeyBag *)&v11 init];
  if (v7)
  {
    v7->_handle = (__MKBKeyBagHandle *)CFRetain(a3);
    v7->_OTA = a4;
  }
  return v7;
}

- (MBKeyBag)initWithOTAHandle:(__MKBOTABackupBagHandle *)a3 keyBagData:(id)a4
{
  id v8 = a4;
  if (!a3)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MBKeyBag.m" lineNumber:273 description:@"Null keybag handle"];
  }
  v13.receiver = self;
  v13.super_class = (Class)MBKeyBag;
  int v9 = [(MBKeyBag *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    v9->_OTAHandle = a3;
    *(_WORD *)&v9->_OTA = 257;
    objc_storeStrong((id *)&v9->_keyBagData, a4);
  }

  return v10;
}

- (void)dealloc
{
  if (self->_OTAHandle) {
    MKBOTABackupBagClose();
  }
  handle = self->_handle;
  if (handle) {
    CFRelease(handle);
  }
  v4.receiver = self;
  v4.super_class = (Class)MBKeyBag;
  [(MBKeyBag *)&v4 dealloc];
}

- (BOOL)registerWithPasscode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(MBKeyBag *)self dataWithError:a4];
  if (!v7) {
    goto LABEL_7;
  }
  [v6 dataUsingEncoding:4];
  uint64_t v8 = MKBKeyBagRegisterOTABackup();
  int v9 = MBGetDefaultLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218240;
      int v16 = handle;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBKeyBagRegisterOTABackup(%p): %d", buf, 0x12u);
      _MBLog();
    }

    if (a4)
    {
      +[MBKeyBag errorWithReturnCode:v8 description:@"MKBKeyBagRegisterOTABackup error"];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = self->_handle;
    *(_DWORD *)buf = 134218240;
    int v16 = v13;
    __int16 v17 = 1024;
    int v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MKBKeyBagRegisterOTABackup(%p): %d", buf, 0x12u);
    _MBLog();
  }

  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)unlockWithPassword:(id)a3 error:(id *)a4
{
  id v6 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(MBKeyBag *)self unlockWithSecret:v6 error:a4];

  return (char)a4;
}

- (BOOL)unlockWithSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_OTAHandle)
  {
    if (!self->_isUnlocked) {
      sub_10009A520();
    }
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v9 = MKBKeyBagUnlock();
    id v10 = MBGetDefaultLog();
    objc_super v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        handle = self->_handle;
        *(_DWORD *)buf = 134218240;
        __int16 v15 = handle;
        __int16 v16 = 1024;
        int v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBKeyBagUnlock(%p): %d", buf, 0x12u);
        _MBLog();
      }

      if (a4)
      {
        +[MBKeyBag errorWithReturnCode:v9 description:@"MKBKeyBagUnlock error"];
        BOOL v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_super v13 = self->_handle;
        *(_DWORD *)buf = 134218240;
        __int16 v15 = v13;
        __int16 v16 = 1024;
        int v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MKBKeyBagUnlock(%p): %d", buf, 0x12u);
        _MBLog();
      }

      self->_isUnlocked = 1;
    }
  }

  return v7;
}

- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 dataUsingEncoding:4];
  id v10 = [v8 dataUsingEncoding:4];

  LOBYTE(a5) = [(MBKeyBag *)self changeSecretFrom:v9 toSecret:v10 error:a5];
  return (char)a5;
}

- (BOOL)changeSecretFrom:(id)a3 toSecret:(id)a4 error:(id *)a5
{
  uint64_t v7 = MKBKeyBagChangeSecret();
  id v8 = MBGetDefaultLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218240;
      int v14 = handle;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "MKBKeyBagChangeSecret(%p): %d", buf, 0x12u);
      _MBLog();
    }

    if (a5)
    {
      *a5 = +[MBKeyBag errorWithReturnCode:v7 description:@"MKBKeyBagChangeSecret error"];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v11 = self->_handle;
      *(_DWORD *)buf = 134218240;
      int v14 = v11;
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MKBKeyBagChangeSecret(%p): %d", buf, 0x12u);
      _MBLog();
    }
  }
  return v7 == 0;
}

- (BOOL)validateWrappedKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    if (a4)
    {
      +[MBError errorWithCode:205, @"Invalid encryption key (key is nil)", v11, v12 format];
      goto LABEL_9;
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = MKBBackupValidateKeyUUID();
  uint64_t v7 = MBGetDefaultLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 1024;
      int v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBBackupValidateKeyUUID(%@): %d", buf, 0x12u);
      uint64_t v12 = v6;
      _MBLog();
    }

    if (a4)
    {
      +[MBError errorWithCode:205, @"Encryption key is invalid: %d", v6, v12 format];
LABEL_9:
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 1024;
    int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MKBBackupValidateKeyUUID(%@): %d", buf, 0x12u);
    _MBLog();
  }

  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (id)dataWithError:(id *)a3
{
  keyBagData = self->_keyBagData;
  if (keyBagData)
  {
    objc_super v4 = keyBagData;
  }
  else
  {
    uint64_t v9 = MKBKeyBagCopyData();
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        handle = self->_handle;
        *(_DWORD *)buf = 134218240;
        int v17 = handle;
        __int16 v18 = 1024;
        int v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBKeyBagCopyData(%p): %d", buf, 0x12u);
        _MBLog();
      }

      if (a3)
      {
        +[MBKeyBag errorWithReturnCode:v10 description:@"MKBKeyBagCopyData error"];
        objc_super v4 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v4 = 0;
      }
    }
    else
    {
      objc_super v4 = 0;
      objc_super v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = self->_handle;
        *(_DWORD *)buf = 134218496;
        int v17 = v14;
        __int16 v18 = 1024;
        int v19 = 0;
        __int16 v20 = 2048;
        id v21 = [0 length];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MKBKeyBagCopyData(%p): %d, size:%lu", buf, 0x1Cu);
        [0 length];
        _MBLog();
      }

      __int16 v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"MBKeyBag.m" lineNumber:372 description:@"MKBKeyBagCopyData succeeded but data is null"];
    }
  }

  return v4;
}

- (id)UUIDWithError:(id *)a3
{
  if (self->_OTAHandle)
  {
    uint64_t v6 = MKBOTABackupBagCopyUUID();
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        OTAHandle = self->_OTAHandle;
        *(_DWORD *)buf = 134218240;
        v24 = OTAHandle;
        __int16 v25 = 1024;
        int v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBOTABackupBagCopyUUID(%p): %d", buf, 0x12u);
        id v21 = self->_OTAHandle;
        uint64_t v22 = v7;
        _MBLog();
      }

      if (a3)
      {
        CFStringRef v10 = @"MKBOTABackupBagCopyUUID error";
LABEL_12:
        +[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v7, v10, v21, v22);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    id v14 = +[NSAssertionHandler currentHandler];
    __int16 v15 = v14;
    CFStringRef v16 = @"MKBOTABackupBagCopyUUID succeeded but data is null";
    SEL v17 = a2;
    __int16 v18 = self;
    uint64_t v19 = 391;
LABEL_19:
    [v14 handleFailureInMethod:v17 object:v18 file:@"MBKeyBag.m" lineNumber:v19 description:v16];

    goto LABEL_16;
  }
  uint64_t v11 = MKBKeyBagCopyUUID();
  if (!v11)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    __int16 v15 = v14;
    CFStringRef v16 = @"MKBKeyBagCopyUUID succeeded but data is null";
    SEL v17 = a2;
    __int16 v18 = self;
    uint64_t v19 = 399;
    goto LABEL_19;
  }
  uint64_t v7 = v11;
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    handle = self->_handle;
    *(_DWORD *)buf = 134218240;
    v24 = handle;
    __int16 v25 = 1024;
    int v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBKeyBagCopyUUID(%p): %d", buf, 0x12u);
    id v21 = self->_handle;
    uint64_t v22 = v7;
    _MBLog();
  }

  if (a3)
  {
    CFStringRef v10 = @"MKBKeyBagCopyUUID error";
    goto LABEL_12;
  }
LABEL_16:

  return 0;
}

- (id)encryptionKeyForFile:(_mkbfileref *)a3 path:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = MKBFileCopyWrappedKey();
  CFStringRef v10 = MBGetDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = handle;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog();
    }

    if (a5)
    {
      *a5 = +[MBKeyBag errorWithReturnCode:v9 path:v8 description:@"MKBFileCopyWrappedKey error"];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = self->_handle;
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      __int16 v20 = 1024;
      int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog();
    }

    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MBKeyBag.m" lineNumber:538 description:@"MKBFileCopyWrappedKey succeeded but returned key is null"];
  }

  return 0;
}

- (BOOL)validateEncryptionKey:(id)a3 file:(_mkbfileref *)a4 path:(id)a5 error:(id *)a6
{
  id v8 = a5;
  uint64_t v9 = MKBFileValidateWrappedKey();
  CFStringRef v10 = MBGetDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 138412802;
      id v16 = v8;
      __int16 v17 = 2048;
      __int16 v18 = handle;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog();
    }

    if (a6)
    {
      *a6 = +[MBKeyBag errorWithReturnCode:v9 path:v8 description:@"MKBFileValidateWrappedKey error"];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = self->_handle;
      *(_DWORD *)buf = 138412802;
      id v16 = v8;
      __int16 v17 = 2048;
      __int16 v18 = v13;
      __int16 v19 = 1024;
      int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog();
    }
  }
  return v9 == 0;
}

- (_mkbfileref)encryptedFileForRestoreWithPath:(id)a3 key:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    sub_10009A54C();
  }
  id v8 = v7;
  int v9 = MKBFileCreateForRestore();
  CFStringRef v10 = MBGetDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBFileCreateForRestore(\"%@\", ...): %d", buf, 0x12u);
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileCreateForRestore(\"%@\", ...): %d", buf, 0x12u);
    _MBLog();
  }

  return 0;
}

- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!self->_OTAHandle)
  {
    id v12 = v10;
    [v12 fileSystemRepresentation];
    uint64_t v13 = MKBBackupDecryptInPlace();
    __int16 v18 = MBGetDefaultLog();
    __int16 v15 = v18;
    if (v13)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        handle = self->_handle;
        *(_DWORD *)buf = 134219010;
        v30 = handle;
        __int16 v31 = 2112;
        id v32 = v12;
        __int16 v33 = 2048;
        unint64_t v34 = a5;
        __int16 v35 = 2112;
        id v36 = v11;
        __int16 v37 = 1024;
        int v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
        id v27 = v11;
        uint64_t v28 = v13;
        id v25 = v12;
        unint64_t v26 = a5;
        v24 = self->_handle;
        _MBLog();
      }

      if (a6)
      {
        CFStringRef v17 = @"MKBBackupDecryptInPlace error";
        goto LABEL_12;
      }
LABEL_15:
      BOOL v20 = 0;
      goto LABEL_20;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = self->_handle;
      *(_DWORD *)buf = 134219010;
      v30 = v22;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2048;
      unint64_t v34 = a5;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 1024;
      int v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
      goto LABEL_18;
    }
LABEL_19:

    BOOL v20 = 1;
    goto LABEL_20;
  }
  id v12 = v10;
  [v12 fileSystemRepresentation];
  uint64_t v13 = MKBOTABackupDecryptInPlace();
  id v14 = MBGetDefaultLog();
  __int16 v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      OTAHandle = self->_OTAHandle;
      *(_DWORD *)buf = 134219010;
      v30 = OTAHandle;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2048;
      unint64_t v34 = a5;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 1024;
      int v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
LABEL_18:
      _MBLog();
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = self->_OTAHandle;
    *(_DWORD *)buf = 134219010;
    v30 = v16;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2048;
    unint64_t v34 = a5;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 1024;
    int v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
    id v27 = v11;
    uint64_t v28 = v13;
    id v25 = v12;
    unint64_t v26 = a5;
    v24 = self->_OTAHandle;
    _MBLog();
  }

  if (!a6) {
    goto LABEL_15;
  }
  CFStringRef v17 = @"MKBOTABackupDecryptInPlace error";
LABEL_12:
  +[MBKeyBag errorWithReturnCode:path:description:](MBKeyBag, "errorWithReturnCode:path:description:", v13, v12, v17, v24, v25, v26, v27, v28);
  BOOL v20 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v20;
}

- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 hardwareModel:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (([v14 hasPrefix:@"N66"] & 1) != 0
    || ([v14 hasPrefix:@"N71"] & 1) != 0
    || ([v14 hasPrefix:@"J98"] & 1) != 0
    || [v14 hasPrefix:@"J99"])
  {
    id v15 = [v13 mutableCopy];
    if (MKBBackupSetKeyEncryptionModeToXTS())
    {
      int v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to set encryption mode to XTS for: %{public}@", buf, 0xCu);
        id v19 = v12;
        _MBLog();
      }
    }
    id v13 = v15;
  }
  BOOL v17 = -[MBKeyBag decryptFileWithPath:encryptionKey:size:error:](self, "decryptFileWithPath:encryptionKey:size:error:", v12, v13, a5, a7, v19);

  return v17;
}

- (BOOL)isOTA
{
  return self->_OTA;
}

- (void)setOTA:(BOOL)a3
{
  self->_OTA = a3;
}

- (BOOL)isUnlocked
{
  return self->_isUnlocked;
}

- (void)setIsUnlocked:(BOOL)a3
{
  self->_isUnlocked = a3;
}

- (NSData)keyBagData
{
  return self->_keyBagData;
}

- (void)setKeyBagData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end