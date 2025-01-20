@interface LiveFSRawDevice
- (BOOL)deviceIsClosed;
- (BOOL)deviceIsFile;
- (BOOL)deviceIsReadOnly;
- (BOOL)isErasable;
- (LiveFSRawDevice)init;
- (NSMutableArray)volumes;
- (NSString)deviceName;
- (NSString)fpDomainName;
- (UVFSPlugin)fsPlugin;
- (_UVFSVolumeCredential)getVolumeCredentialFromKeychain;
- (id)getVolumeLabelFromReply:(_UVFSScanVolsReply *)a3;
- (id)getVolumeUUID:(void *)a3 fsOPs:(_UVFSFSOps *)a4;
- (id)getVolumeUUIDFromReply:(_UVFSScanVolsReply *)a3;
- (id)getVolumesFromDeviceForFileSystem:(id)a3;
- (id)initDeviceWithName:(id)a3 andError:(id *)a4;
- (int)deviceFD;
- (unsigned)notification;
- (void)cancelNotifications;
- (void)close;
- (void)sendAnalytics:(id)a3 loadStatus:(int)a4 loadErrorReason:(id)a5;
- (void)setDeviceFD:(int)a3;
- (void)setDeviceIsFile:(BOOL)a3;
- (void)setDeviceIsReadOnly:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setFpDomainName:(id)a3;
- (void)setFsPlugin:(id)a3;
- (void)setIsErasable:(BOOL)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setVolumes:(id)a3;
- (void)terminate;
- (void)terminateVolumesWithErrors;
- (void)unloadVolume:(id)a3;
- (void)unloadVolumes:(unsigned int)a3;
@end

@implementation LiveFSRawDevice

- (LiveFSRawDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)LiveFSRawDevice;
  v2 = [(LiveFSRawDevice *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_deviceFD = -1;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    volumes = v3->_volumes;
    v3->_volumes = v4;
  }
  return v3;
}

- (id)initDeviceWithName:(id)a3 andError:(id *)a4
{
  id v6 = a3;
  objc_super v7 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "rawDeviceInit:start:%@", buf, 0xCu);
  }
  v8 = [(LiveFSRawDevice *)self init];
  v9 = v8;
  if (!v8)
  {
    int v20 = 12;
    goto LABEL_48;
  }
  v8->_isErasable = 0;
  if (![v6 hasPrefix:@"disk"])
  {
    if (([v6 hasPrefix:@"/var/mobile/Library/Caches/com.apple.filesystems.userfsd"] & 1) != 0|| objc_msgSend(v6, "hasPrefix:", @"/private/var/mobile/Library/Caches/com.apple.filesystems.userfsd"))
    {
      id v21 = v6;
      int v22 = open((const char *)[v21 UTF8String], 2);
      v9->_deviceFD = v22;
      if ((v22 & 0x80000000) == 0)
      {
        *(_WORD *)&v9->_deviceIsFile = 1;
        objc_storeStrong((id *)&v9->_deviceName, v21);
        if (!a4) {
          goto LABEL_52;
        }
        id v23 = 0;
        goto LABEL_51;
      }
      int v20 = *__error();
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000228B8();
      }
      goto LABEL_47;
    }
    v27 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022920((uint64_t)v6, v27, v28);
    }

    v9 = 0;
    int v20 = 22;
    goto LABEL_48;
  }
  id v10 = v6;
  snprintf((char *)buf, 0x20uLL, "/dev/r%s", (const char *)[v10 UTF8String]);
  int v11 = sub_1000068A4((const char *)buf, 2u);
  v9->_deviceFD = v11;
  p_deviceFD = &v9->_deviceFD;
  if (v11 < 0)
  {
    int v24 = *__error();
    v25 = userfs_log_default;
    if (v24 != 13)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022850();
      }

      v9 = 0;
      if (v24) {
        int v20 = v24;
      }
      else {
        int v20 = 5;
      }
      goto LABEL_45;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v32 = 138412290;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "rawDeviceInit:tryingRDONLYopen:%@", v32, 0xCu);
    }
    int v26 = sub_1000068A4((const char *)buf, 0);
    int *p_deviceFD = v26;
    if (v26 < 0)
    {
      int v20 = 13;
LABEL_45:
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000227E8();
      }
      goto LABEL_47;
    }
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
  }
  objc_storeStrong((id *)&v9->_deviceName, v10);
  v9->_deviceIsReadOnly = v13;
  if (v9->_deviceFD < 0)
  {
    int v20 = 0;
    goto LABEL_45;
  }
  v14 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022760(&v9->_deviceFD, v14);
  }
  if (!qword_100040338)
  {
    qword_100040338 = (uint64_t)IONotificationPortCreate(kIOMasterPortDefault);
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_100040338, (dispatch_queue_t)&_dispatch_main_q);
  }
  id v15 = v10;
  CFDictionaryRef v16 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v15 UTF8String]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v16);
  if (!MatchingService)
  {
    v29 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022680((uint64_t)v15, v29);
    }
    close(*p_deviceFD);
    goto LABEL_42;
  }
  io_service_t v18 = MatchingService;
  v19 = (IONotificationPort *)qword_100040338;
  v9 = v9;
  LODWORD(v19) = IOServiceAddInterestNotification(v19, v18, "IOGeneralInterest", (IOServiceInterestCallback)sub_100006AD4, v9, &v9->_notification);
  IOObjectRelease(v18);
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000226F8();
    }
    close(*p_deviceFD);
    v9->_notification = 0;
LABEL_42:
    int v20 = 19;
LABEL_47:

    v9 = 0;
    goto LABEL_48;
  }
  int v20 = 0;
LABEL_48:
  if (a4)
  {
    *a4 = 0;
    if (v20)
    {
      id v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v20 userInfo:0];
LABEL_51:
      *a4 = v23;
    }
  }
LABEL_52:
  v30 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v6;
    __int16 v36 = 2112;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "rawDeviceInit:finish:%@:%@", buf, 0x16u);
  }

  return v9;
}

- (_UVFSVolumeCredential)getVolumeCredentialFromKeychain
{
  return 0;
}

- (id)getVolumeLabelFromReply:(_UVFSScanVolsReply *)a3
{
  v3 = +[NSString stringWithUTF8String:a3->var3];
  v4 = v3;
  if (!v3 || ![(__CFString *)v3 length])
  {

    v4 = @"Untitled";
  }

  return v4;
}

- (id)getVolumeUUIDFromReply:(_UVFSScanVolsReply *)a3
{
  if (*(_OWORD *)a3->var2 == 0)
  {
    v4 = 0;
  }
  else
  {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a3->var2];
    v4 = [v3 UUIDString];
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022E04();
  }

  return v4;
}

- (id)getVolumeUUID:(void *)a3 fsOPs:(_UVFSFSOps *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v6 = ((uint64_t (*)(void *, const char *, uint64_t *, void, uint64_t *))a4->var8)(a3, "_O_f_uuid", &v16, 0, &v15);
  if (v6 == 45) {
    goto LABEL_4;
  }
  if (v6 != 7)
  {
    if (v6 != 2)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022E7C();
      }
      goto LABEL_12;
    }
LABEL_4:
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022EF4();
    }
LABEL_12:
    v12 = 0;
    goto LABEL_16;
  }
  id v7 = objc_alloc((Class)NSMutableData);
  id v8 = [v7 initWithLength:v15];
  var8 = (unsigned int (*)(void *, const char *, id, uint64_t, uint64_t *))a4->var8;
  id v10 = v8;
  id v11 = [v10 mutableBytes];
  if (var8(a3, "_O_f_uuid", v11, v15, &v15))
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100023000();
    }
    v12 = 0;
  }
  else
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(v10, "bytes"));
    v12 = [v13 UUIDString];

    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100022F88();
    }
  }

LABEL_16:

  return v12;
}

- (id)getVolumesFromDeviceForFileSystem:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10002335C();
  }
  v5 = +[UVFSPluginManager getSupportedFilesystems];
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  if ([v5 containsObject:v4])
  {
    id v70 = 0;
    int v6 = +[UVFSPluginManager getUVFSPluginForFS:v4 withError:&v70];
    id v7 = (UVFSPlugin *)v70;
    fsPlugin = self->_fsPlugin;
    self->_fsPlugin = v6;

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100023270();
      }
      v9 = 0;
      goto LABEL_14;
    }
    v14 = [(UVFSPlugin *)self->_fsPlugin FSOps];
    int v15 = ((uint64_t (*)(void))v14->var3)(self->_deviceFD);
    uint64_t v16 = userfs_log_default;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100023200();
      }
      [(UVFSPlugin *)self->_fsPlugin checkAndUnloadPlugin];
      v9 = 0;
      id v7 = self->_fsPlugin;
      self->_fsPlugin = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      *(_DWORD *)buf = 138412546;
      v74 = (const char *)deviceName;
      __int16 v75 = 2114;
      uint64_t v76 = (uint64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "device:%@:selected:plugin:%{public}@", buf, 0x16u);
    }
    char v18 = 0;
    id v19 = 0;
    int v20 = 0;
    id v21 = 0;
    int v22 = 0;
    p_deviceName = &self->_deviceName;
LABEL_24:
    id v7 = v22;
    v57 = v20;
    id v10 = v19;
    v12 = v21;
    while (1)
    {
      uint64_t v23 = ((uint64_t (*)(void, uint64_t *, long long *))v14->var32)(self->_deviceFD, &v71, &v79);
      if (v23)
      {
        uint64_t v37 = v23;
        if (v23 == -1001) {
          uint64_t v37 = 0;
        }
        if (([v4 isEqualToString:@"msdos"] & 1) != 0
          || ([v4 isEqualToString:@"exfat"] & 1) != 0
          || [v4 isEqualToString:@"apfs"])
        {
          self->_isErasable = ([(NSMutableArray *)self->_volumes count] == (id)1) & (v18 ^ 1);
        }
        else
        {
          self->_isErasable = 0;
        }
        if ([(NSMutableArray *)self->_volumes count])
        {
          v38 = +[NSNumber numberWithUnsignedLong:[(NSMutableArray *)self->_volumes count]];
          id v61 = v4;
          id v39 = v38;
          v62 = v39;
          AnalyticsSendEventLazy();
          v40 = (void *)userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v59 = self->_deviceName;
            id v60 = v39;
            volumes = self->_volumes;
            v42 = v40;
            v43 = volumes;
            id v39 = v60;
            id v44 = [(NSMutableArray *)v43 count];
            *(_DWORD *)buf = 138412802;
            v74 = (const char *)v59;
            __int16 v75 = 2048;
            uint64_t v76 = (uint64_t)v44;
            __int16 v77 = 1024;
            LODWORD(v78) = v37;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "device:%@:loaded:%lu:%d", buf, 0x1Cu);
          }
          uint64_t v45 = 1;
        }
        else
        {
          v46 = userfs_log_default;
          if (v37)
          {
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100023100(p_deviceName, v37, v46);
            }
            uint64_t v45 = 2;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v47 = *p_deviceName;
              *(_DWORD *)buf = 138412290;
              v74 = (const char *)v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "device:%@:zero:volumes:loaded", buf, 0xCu);
            }
            uint64_t v45 = 3;
          }
        }
        v48 = [(UVFSPlugin *)v7 localizedDescription];
        [(LiveFSRawDevice *)self sendAnalytics:v4 loadStatus:v45 loadErrorReason:v48];

        id v11 = v57;
        goto LABEL_11;
      }
      v18 |= BYTE13(v96) != 0;
      if (!DWORD2(v79)) {
        break;
      }
      if (DWORD2(v79) == 1)
      {
        [(LiveFSRawDevice *)self getVolumeCredentialFromKeychain];
        uint64_t v55 = +[LIFSPreVolume errorForAuthError];

        v25 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
        {
          v30 = *p_deviceName;
          *(_DWORD *)buf = 138412546;
          v74 = (const char *)v30;
          __int16 v75 = 2112;
          uint64_t v76 = v55;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "device:%@:locked:errorForDomain:%@", buf, 0x16u);
        }
LABEL_34:
        id v19 = +[LIFSPreVolume newWithDevice:self forID:(void)v79 opsTable:v14];

        if (v19)
        {
          uint64_t v26 = v55;
          if (v55) {
            goto LABEL_52;
          }
          unsigned int v27 = [v19 checkAndMountVolumeWithCreds:0 resultRootNode:&v72];
          switch(v27)
          {
            case 0xFFFFFFFF:
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1000231D4(&v66, v67);
              }
              break;
            case 0u:
              uint64_t v26 = 0;
LABEL_52:
              uint64_t v56 = v26;
              uint64_t v49 = [(LiveFSRawDevice *)self getVolumeLabelFromReply:&v79];
              uint64_t v32 = [(LiveFSRawDevice *)self getVolumeUUIDFromReply:&v79];
              if (!v32)
              {
                uint64_t v32 = [(LiveFSRawDevice *)self getVolumeUUID:v72 fsOPs:v14];
                if (!v32)
                {
                  v51 = +[NSUUID UUID];
                  uint64_t v32 = [v51 UUIDString];

                  v52 = userfs_log_default;
                  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    id v33 = *p_deviceName;
                    *(_DWORD *)buf = 136315650;
                    v74 = "-[LiveFSRawDevice getVolumesFromDeviceForFileSystem:]";
                    __int16 v75 = 2114;
                    uint64_t v76 = (uint64_t)v33;
                    __int16 v77 = 2112;
                    uint64_t v78 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s:device:%{public}@:no:UUID:generated:new:one:%@", buf, 0x20u);
                  }
                }
              }
              v63 = v7;
              v50 = (void *)v32;
              id v34 = +[userFSVolume newWithDevice:self fsType:v4 volumeName:v32 rootNode:v72 errorState:v56 returnError:&v63];
              v53 = v63;

              v58 = v34;
              if (!v34 || v53)
              {
                __int16 v36 = userfs_log_default;
                int v22 = (UVFSPlugin *)v53;
                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v74 = v53;
                  _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "getVolumeFromDevice:userFSVolume:create:failed:%@", buf, 0xCu);
                }
                id v35 = (void *)v49;
                if (v72) {
                  ((void (*)(uint64_t, uint64_t))v14->var7)(v72, 1);
                }
              }
              else
              {
                int v22 = 0;
                id v35 = (void *)v49;
                if (v56) {
                  [v58 setPreVolInfo:v19];
                }
                if (BYTE12(v96)) {
                  [v58 setReadOnly:1];
                }
                [v58 setVolumeLabel:v49];
                [(NSMutableArray *)self->_volumes addObject:v58];
              }
              uint64_t v71 = v79 + 1;
              uint64_t v72 = 0;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;

              id v21 = (void *)v56;
              int v20 = v58;
              goto LABEL_24;
            case 0x50u:
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1000231A8(&v68, v69);
              }
              uint64_t v26 = +[LIFSPreVolume errorForAuthError];
              goto LABEL_52;
            default:
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10002317C(&v64, v65);
              }
              break;
          }
          v29 = 0;
          uint64_t v71 = v79 + 1;
        }
        else
        {
          uint64_t v28 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
          {
            v31 = *p_deviceName;
            *(_DWORD *)buf = 138412290;
            v74 = (const char *)v31;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "device:%@:preVol:create:failed:skipping", buf, 0xCu);
          }
          id v19 = 0;
          uint64_t v71 = v79 + 1;
          v29 = (void *)v55;
        }
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v10 = v19;
        v12 = v29;
        long long v79 = 0u;
        long long v80 = 0u;
      }
      else
      {
        int v24 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v74 = (char *)&v80 + 12;
          __int16 v75 = 1024;
          LODWORD(v76) = DWORD2(v79);
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "getVolumeFromDevice:skiping:%s[%d]", buf, 0x12u);
        }
        uint64_t v71 = v79 + 1;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
      }
    }
    uint64_t v55 = (uint64_t)v12;
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000232E0();
  }
  id v10 = 0;
  id v11 = 0;
  v12 = 0;
  id v7 = 0;
LABEL_11:
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023078();
  }
  v9 = +[NSArray arrayWithArray:self->_volumes];

LABEL_14:

  return v9;
}

- (void)cancelNotifications
{
  kern_return_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  id v3 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000234B8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  io_object_t notification = self->_notification;
  if (notification)
  {
    v12 = IOObjectRelease(notification);
    id v13 = userfs_log_default;
    if (v12)
    {
      v14 = v12;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100023440(v14, v13);
      }
    }
    else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100023408(v13, v15, v16, v17, v18, v19, v20, v21);
    }
    self->_io_object_t notification = 0;
  }
  int v22 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000233D0(v22, v23, v24, v25, v26, v27, v28, v29);
  }
}

- (void)close
{
  int deviceFD = self->_deviceFD;
  if (deviceFD != -1)
  {
    if (close(deviceFD))
    {
      uint64_t v4 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000234F0((uint64_t)self, v4);
      }
    }
    self->_int deviceFD = -1;
    uint64_t v5 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      int v7 = 138412290;
      uint64_t v8 = deviceName;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@]:close:finish", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)unloadVolume:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_volumes removeObject:v5];
  objc_sync_exit(v4);

  if (![(NSMutableArray *)v4->_volumes count])
  {
    [(UVFSPlugin *)v4->_fsPlugin checkAndUnloadPlugin];
    [(LiveFSRawDevice *)v4 cancelNotifications];
    [(LiveFSRawDevice *)v4 close];
  }
}

- (void)unloadVolumes:(unsigned int)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = +[NSArray arrayWithArray:v4->_volumes];
  [(NSMutableArray *)v4->_volumes removeAllObjects];
  objc_sync_exit(v4);

  long long v12 = 0u;
  long long v13 = 0u;
  if ([(LiveFSRawDevice *)v4 deviceIsClosed]) {
    uint64_t v6 = a3 | 8;
  }
  else {
    uint64_t v6 = a3;
  }
  long long v14 = 0uLL;
  long long v15 = 0uLL;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "invalidateAllConnections", (void)v12);
        [v11 unmount:v6];
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)terminate
{
  v2 = [(LiveFSRawDevice *)self volumes];
  id v3 = +[NSArray arrayWithArray:v2];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "unregisterWithLiveFSService:", 2, (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)terminateVolumesWithErrors
{
  id v3 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023608(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  long long v11 = +[NSMutableArray array];
  long long v12 = self;
  objc_sync_enter(v12);
  long long v13 = [(LiveFSRawDevice *)v12 volumes];

  if (v13)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v14 = [(LiveFSRawDevice *)v12 volumes];
    long long v15 = +[NSArray arrayWithArray:v14];

    id v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v45;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          int v20 = [v19 errorState];

          if (v20) {
            [v11 addObject:v19];
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v16);
    }
  }
  objc_sync_exit(v12);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v22)
  {
    uint64_t v24 = *(void *)v41;
    *(void *)&long long v23 = 136315394;
    long long v39 = v23;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        unsigned int v27 = (void *)userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
        {
          v29 = v27;
          v30 = [v26 volumeName];
          *(_DWORD *)buf = v39;
          uint64_t v49 = "-[LiveFSRawDevice terminateVolumesWithErrors]";
          __int16 v50 = 2112;
          v51 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s: unregister with mounter service for volume %@ using LIVEFSMOUNTCLIENT_UNMOUNT_FORGET", buf, 0x16u);
        }
        id v28 = objc_msgSend(v26, "unregisterWithMounterService:", 2, v39, (void)v40);
        [v26 unregisterWithLiveFSService:2];
      }
      id v22 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v22);
  }

  v31 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023590(v31, v32, v33, v34, v35, v36, v37, v38);
  }
}

- (BOOL)deviceIsClosed
{
  return self->_deviceFD == -1;
}

- (void)sendAnalytics:(id)a3 loadStatus:(int)a4 loadErrorReason:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v23 = "-[LiveFSRawDevice sendAnalytics:loadStatus:loadErrorReason:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: sending analytics", buf, 0xCu);
  }
  long long v11 = +[NSNumber numberWithUnsignedLong:[(NSMutableArray *)self->_volumes count]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_volumes;
  uint64_t v13 = (uint64_t)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "isDCIM", (void)v17))
        {
          uint64_t v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v13 = (uint64_t)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v16 = objc_alloc_init(UVFSAnalytics);
  [(UVFSAnalytics *)v16 discoverTopology:self->_deviceName];
  -[UVFSAnalytics addVolumeProperties:volumeCount:isDCIM:loadStatus:loadErrorReason:](v16, "addVolumeProperties:volumeCount:isDCIM:loadStatus:loadErrorReason:", v8, [v11 intValue], v13, v6, v9);
  [(UVFSAnalytics *)v16 sendEvent];
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (int)deviceFD
{
  return self->_deviceFD;
}

- (void)setDeviceFD:(int)a3
{
  self->_int deviceFD = a3;
}

- (UVFSPlugin)fsPlugin
{
  return (UVFSPlugin *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFsPlugin:(id)a3
{
}

- (BOOL)deviceIsFile
{
  return self->_deviceIsFile;
}

- (void)setDeviceIsFile:(BOOL)a3
{
  self->_deviceIsFile = a3;
}

- (BOOL)deviceIsReadOnly
{
  return self->_deviceIsReadOnly;
}

- (void)setDeviceIsReadOnly:(BOOL)a3
{
  self->_deviceIsReadOnly = a3;
}

- (BOOL)isErasable
{
  return self->_isErasable;
}

- (void)setIsErasable:(BOOL)a3
{
  self->_isErasable = a3;
}

- (NSString)fpDomainName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFpDomainName:(id)a3
{
}

- (NSMutableArray)volumes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVolumes:(id)a3
{
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_io_object_t notification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_fpDomainName, 0);
  objc_storeStrong((id *)&self->_fsPlugin, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end