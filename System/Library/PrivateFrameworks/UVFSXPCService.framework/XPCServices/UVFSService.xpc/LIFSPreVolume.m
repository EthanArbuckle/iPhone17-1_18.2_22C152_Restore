@interface LIFSPreVolume
+ (id)errorForAuthError;
+ (id)errorForCheckAndMountReturnValue:(int)a3;
+ (id)newWithDevice:(id)a3 forID:(unint64_t)a4 opsTable:(_UVFSFSOps *)a5;
- (LiveFSRawDevice)volumeRawDevice;
- (_UVFSFSOps)ops;
- (int)checkAndMountVolumeWithCreds:(_UVFSVolumeCredential *)a3 resultRootNode:(void *)a4;
- (unint64_t)volID;
@end

@implementation LIFSPreVolume

+ (id)newWithDevice:(id)a3 forID:(unint64_t)a4 opsTable:(_UVFSFSOps *)a5
{
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  v10 = (void *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 8), a3);
    v10[2] = a4;
    v10[3] = a5;
  }

  return v10;
}

- (int)checkAndMountVolumeWithCreds:(_UVFSVolumeCredential *)a3 resultRootNode:(void *)a4
{
  p_volumeRawDevice = &self->_volumeRawDevice;
  BOOL v8 = [(LiveFSRawDevice *)self->_volumeRawDevice deviceIsReadOnly];
  id v9 = (id)[(LiveFSRawDevice *)*p_volumeRawDevice deviceFD];
  v31 = 0;
  if (v8)
  {
LABEL_2:
    int v10 = ((uint64_t (*)(id, unint64_t, BOOL, _UVFSVolumeCredential *, void **))self->_ops->var4)(v9, self->_volID, v8, a3, &v31);
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026324();
      }
    }
    else
    {
      *a4 = v31;
    }
    return v10;
  }
  v11 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100026490((uint64_t)p_volumeRawDevice, v11);
  }
  int v12 = ((uint64_t (*)(id, unint64_t, _UVFSVolumeCredential *, uint64_t))self->_ops->var26)(v9, self->_volID, a3, 1);
  if (!v12)
  {
    v17 = (void *)userfs_log_default;
    if (!os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_2;
    }
    v18 = *p_volumeRawDevice;
    v19 = v17;
    v20 = [(LiveFSRawDevice *)v18 deviceName];
    *(_DWORD *)buf = 138412290;
    v33 = v20;
    v21 = "getVolumeFromDevice:QUICK_CHECK:pass:%@";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);

    goto LABEL_2;
  }
  if (v12 == 45)
  {
    v13 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
    {
      v14 = *p_volumeRawDevice;
      v15 = v13;
      v16 = [(LiveFSRawDevice *)v14 deviceName];
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "getVolumeFromDevice:QUICK_CHECK:ENOTSUP:%@", buf, 0xCu);
    }
    return 45;
  }
  v22 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    v23 = *p_volumeRawDevice;
    v24 = v22;
    v25 = [(LiveFSRawDevice *)v23 deviceName];
    *(_DWORD *)buf = 138412290;
    v33 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "getVolumeFromDevice:QUICK_CHECK:failed:%@", buf, 0xCu);
  }
  v26 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000263F8((uint64_t)p_volumeRawDevice, v26);
  }
  int v27 = ((uint64_t (*)(id, unint64_t, _UVFSVolumeCredential *, uint64_t))self->_ops->var26)(v9, self->_volID, a3, 3);
  v28 = (void *)userfs_log_default;
  if (!v27)
  {
    if (!os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_2;
    }
    v30 = *p_volumeRawDevice;
    v19 = v28;
    v20 = [(LiveFSRawDevice *)v30 deviceName];
    *(_DWORD *)buf = 138412290;
    v33 = v20;
    v21 = "getVolumeFromDevice:CHECK_AND_REPAIR:pass:%@";
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100026358((uint64_t)p_volumeRawDevice, v28);
  }
  return -1;
}

+ (id)errorForCheckAndMountReturnValue:(int)a3
{
  if (a3 > 0)
  {
    if (a3 == 1 || a3 == 80)
    {
      v3 = +[LIFSPreVolume errorForAuthError];
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    v3 = 0;
    goto LABEL_8;
  }
  v3 = getNSErrorFromLiveFSErrno();
LABEL_8:

  return v3;
}

+ (id)errorForAuthError
{
  return +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
}

- (LiveFSRawDevice)volumeRawDevice
{
  return (LiveFSRawDevice *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)volID
{
  return self->_volID;
}

- (_UVFSFSOps)ops
{
  return self->_ops;
}

- (void).cxx_destruct
{
}

@end