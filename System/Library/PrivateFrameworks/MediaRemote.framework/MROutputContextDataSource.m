@interface MROutputContextDataSource
+ (id)_notificationSerialQueue;
- (BOOL)isAirPlaying;
- (BOOL)isVolumeMuted;
- (BOOL)shouldLog;
- (BOOL)volumeMutedForOutputDeviceID:(id)a3 error:(id *)a4;
- (NSArray)outputDevices;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)notificationQueue;
- (float)volume;
- (float)volumeForOutputDeviceUID:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)descriptionForOutputDevice:(uint64_t)a1;
- (id)outputDeviceForUID:(id)a3;
- (unsigned)volumeControlCapabilities;
- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3 error:(id *)a4;
- (void)notifyDataSourceReloaded;
- (void)notifyOutputDeviceAdded:(void *)a1;
- (void)notifyOutputDeviceChanged:(void *)a1;
- (void)notifyOutputDeviceRemoved:(void *)a1;
- (void)notifyVolumeCapabilitiesDidChange:(void *)a3 outputDevice:;
- (void)notifyVolumeDidChange:(float)a3 outputDevice:;
- (void)notifyVolumeMutedDidChange:(void *)a3 outputDevice:;
- (void)setNotificationQueue:(id)a3;
- (void)setShouldLog:(BOOL)a3;
@end

@implementation MROutputContextDataSource

- (void)setShouldLog:(BOOL)a3
{
  self->_shouldLog = a3;
}

- (float)volumeForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(MROutputContextDataSource *)self outputDeviceForUID:v6];
    if (([v7 volumeCapabilities] & 2) != 0)
    {
      [v7 volume];
      float v10 = v11;
      Error = 0;
    }
    else
    {
      if (v7) {
        uint64_t v8 = 37;
      }
      else {
        uint64_t v8 = 39;
      }
      Error = (void *)MRMediaRemoteCreateError(v8);
      float v10 = 0.0;
    }
  }
  else if (([(MROutputContextDataSource *)self volumeControlCapabilities] & 2) != 0)
  {
    [(MROutputContextDataSource *)self volume];
    float v10 = v12;
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(36);
    float v10 = 0.0;
  }
  if (a4) {
    *a4 = Error;
  }

  return v10;
}

- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    unsigned int v9 = [(MROutputContextDataSource *)self volumeControlCapabilities];
    Error = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = [(MROutputContextDataSource *)self outputDeviceForUID:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 volumeCapabilities];
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(39);
    unsigned int v9 = 0;
  }

  if (a4) {
LABEL_8:
  }
    *a4 = Error;
LABEL_9:

  return v9;
}

void __76__MROutputContextDataSource_notifyVolumeCapabilitiesDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)notifyVolumeCapabilitiesDidChange:(void *)a3 outputDevice:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_26;
  }
  id v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
  char v7 = [a1 shouldLog];
  if (v5)
  {
    if ((v7 & 1) != 0
      || (+[MRUserSettings currentSettings],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 verboseOutputContextDataSourceLogging],
          v8,
          v9))
    {
      float v10 = _MRLogForCategory(0);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      float v11 = objc_opt_class();
      id v12 = v11;
      v13 = [v5 debugName];
      v14 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v34 = v11;
      __int16 v35 = 2048;
      v36 = a1;
      __int16 v37 = 2114;
      v38 = v13;
      __int16 v39 = 2114;
      v40 = v6;
      __int16 v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volumeCapabilities changed <%{public}@> to <%{public}@>. Endpoint=<%@>", buf, 0x34u);
      goto LABEL_7;
    }
    float v10 = _MRLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_opt_class();
      id v12 = v18;
      v13 = [v5 debugName];
      v14 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v34 = v18;
      __int16 v35 = 2048;
      v36 = a1;
      __int16 v37 = 2114;
      v38 = v13;
      __int16 v39 = 2114;
      v40 = v6;
      __int16 v41 = 2112;
      v42 = v14;
      _os_log_debug_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volumeCapabilities changed <%{public}@> to <%{public}@>. Endpoint=<%@>", buf, 0x34u);
LABEL_7:

LABEL_12:
    }
  }
  else
  {
    if ((v7 & 1) == 0)
    {
      v15 = +[MRUserSettings currentSettings];
      int v16 = [v15 verboseOutputContextDataSourceLogging];

      if (!v16)
      {
        float v10 = _MRLogForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:]();
        }
        goto LABEL_17;
      }
    }
    float v10 = _MRLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      id v12 = v17;
      v13 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544130;
      v34 = v17;
      __int16 v35 = 2048;
      v36 = a1;
      __int16 v37 = 2114;
      v38 = v6;
      __int16 v39 = 2114;
      v40 = v13;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volumeCapabilities changed to <%{public}@>. Endpoint=<%{public}@>", buf, 0x2Au);
      goto LABEL_12;
    }
  }
LABEL_17:

  if (([a1 shouldLog] & 1) != 0
    || (+[MRUserSettings currentSettings],
        v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 verboseOutputContextDataSourceLogging],
        v19,
        v20))
  {
    v21 = _MRLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v34 = v22;
      __int16 v35 = 2048;
      v36 = a1;
      __int16 v37 = 2114;
      v38 = a1;
      id v23 = v22;
      _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v21 = _MRLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[MROutputContextDataSource notifyOutputDeviceAdded:]();
    }
  }

  v31 = @"MROutputContextDataSourceVolumeCapabilitiesUserInfoKey";
  v24 = [NSNumber numberWithUnsignedInt:a2];
  v32 = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v26 = (void *)[v25 mutableCopy];

  if (v5) {
    [v26 setObject:v5 forKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];
  }
  v27 = [a1 notificationQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__MROutputContextDataSource_notifyVolumeCapabilitiesDidChange_outputDevice___block_invoke;
  v29[3] = &unk_1E57D0790;
  v29[4] = a1;
  id v30 = v26;
  id v28 = v26;
  dispatch_async(v27, v29);

LABEL_26:
}

- (BOOL)shouldLog
{
  return self->_shouldLog;
}

- (OS_dispatch_queue)notificationQueue
{
  id v2 = self;
  objc_sync_enter(v2);
  notificationQueue = v2->_notificationQueue;
  if (notificationQueue)
  {
    v4 = notificationQueue;
  }
  else
  {
    objc_opt_class();
    +[MROutputContextDataSource _notificationSerialQueue]();
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

+ (id)_notificationSerialQueue
{
  self;
  if (_notificationSerialQueue___once_0 != -1) {
    dispatch_once(&_notificationSerialQueue___once_0, &__block_literal_global_31);
  }
  v0 = (void *)_notificationSerialQueue___notificationSerialQueue_0;

  return v0;
}

- (void)notifyVolumeDidChange:(float)a3 outputDevice:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  char v6 = [a1 shouldLog];
  if (v5)
  {
    if ((v6 & 1) == 0)
    {
      char v7 = +[MRUserSettings currentSettings];
      int v8 = [v7 verboseOutputContextDataSourceLogging];

      if (!v8)
      {
        int v9 = _MRLogForCategory(0);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        v17 = objc_opt_class();
        id v11 = v17;
        id v12 = [v5 debugName];
        v13 = [a1 uniqueIdentifier];
        *(_DWORD *)buf = 138544386;
        v29 = v17;
        __int16 v30 = 2048;
        v31 = a1;
        __int16 v32 = 2114;
        double v33 = *(double *)&v12;
        __int16 v34 = 2048;
        double v35 = a3;
        __int16 v36 = 2114;
        __int16 v37 = v13;
        _os_log_debug_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volume changed <%{public}@> to <%f>. Endpoint=<%{public}@>", buf, 0x34u);
        goto LABEL_7;
      }
    }
    int v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      float v10 = objc_opt_class();
      id v11 = v10;
      id v12 = [v5 debugName];
      v13 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v29 = v10;
      __int16 v30 = 2048;
      v31 = a1;
      __int16 v32 = 2114;
      double v33 = *(double *)&v12;
      __int16 v34 = 2048;
      double v35 = a3;
      __int16 v36 = 2114;
      __int16 v37 = v13;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volume changed <%{public}@> to <%f>. Endpoint=<%{public}@>", buf, 0x34u);
LABEL_7:

LABEL_12:
    }
  }
  else
  {
    if ((v6 & 1) == 0)
    {
      v14 = +[MRUserSettings currentSettings];
      int v15 = [v14 verboseOutputContextDataSourceLogging];

      if (!v15)
      {
        int v9 = _MRLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1);
        }
        goto LABEL_17;
      }
    }
    int v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = objc_opt_class();
      id v11 = v16;
      id v12 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544130;
      v29 = v16;
      __int16 v30 = 2048;
      v31 = a1;
      __int16 v32 = 2048;
      double v33 = a3;
      __int16 v34 = 2114;
      double v35 = *(double *)&v12;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volume changed to <%f>. Endpoint=<%{public}@>", buf, 0x2Au);
      goto LABEL_12;
    }
  }
LABEL_17:

  v26 = @"MROutputContextDataSourceVolumeUserInfoKey";
  *(float *)&double v18 = a3;
  v19 = [NSNumber numberWithFloat:v18];
  v27 = v19;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v21 = (void *)[v20 mutableCopy];

  if (v5) {
    [v21 setObject:v5 forKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];
  }
  v22 = [a1 notificationQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__MROutputContextDataSource_notifyVolumeDidChange_outputDevice___block_invoke;
  v24[3] = &unk_1E57D0790;
  v24[4] = a1;
  id v25 = v21;
  id v23 = v21;
  dispatch_async(v22, v24);

LABEL_20:
}

void __64__MROutputContextDataSource_notifyVolumeDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

void __53__MROutputContextDataSource__notificationSerialQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MROutputContextDataSource.NotificationQueue", v2);
  v1 = (void *)_notificationSerialQueue___notificationSerialQueue_0;
  _notificationSerialQueue___notificationSerialQueue_0 = (uint64_t)v0;
}

- (void)notifyVolumeMutedDidChange:(void *)a3 outputDevice:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_27;
  }
  char v6 = [a1 shouldLog];
  if (!v5)
  {
    if ((v6 & 1) != 0
      || (+[MRUserSettings currentSettings],
          int v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 verboseOutputContextDataSourceLogging],
          v15,
          v16))
    {
      int v9 = _MRLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_opt_class();
        id v18 = v17;
        uint64_t v19 = [a1 uniqueIdentifier];
        int v20 = (void *)v19;
        v21 = @"NO";
        *(_DWORD *)buf = 138544130;
        __int16 v34 = v17;
        __int16 v35 = 2048;
        if (a2) {
          v21 = @"YES";
        }
        __int16 v36 = a1;
        __int16 v37 = 2114;
        uint64_t v38 = v19;
        __int16 v39 = 2112;
        v40 = v21;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volumeMuted changed <%{public}@> to <%@>", buf, 0x2Au);
      }
    }
    else
    {
      int v9 = _MRLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:]();
      }
    }
    goto LABEL_24;
  }
  if ((v6 & 1) == 0)
  {
    char v7 = +[MRUserSettings currentSettings];
    int v8 = [v7 verboseOutputContextDataSourceLogging];

    if (!v8)
    {
      int v9 = _MRLogForCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      v22 = objc_opt_class();
      id v11 = v22;
      id v12 = [v5 debugName];
      if (a2) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      v14 = [a1 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      __int16 v34 = v22;
      __int16 v35 = 2048;
      __int16 v36 = a1;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v12;
      __int16 v39 = 2112;
      v40 = v23;
      __int16 v41 = 2114;
      v42 = v14;
      _os_log_debug_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volumeMuted changed <%{public}@> to <%@> in <%{public}@>", buf, 0x34u);
      goto LABEL_10;
    }
  }
  int v9 = _MRLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    float v10 = objc_opt_class();
    id v11 = v10;
    id v12 = [v5 debugName];
    if (a2) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    v14 = [a1 uniqueIdentifier];
    *(_DWORD *)buf = 138544386;
    __int16 v34 = v10;
    __int16 v35 = 2048;
    __int16 v36 = a1;
    __int16 v37 = 2114;
    uint64_t v38 = (uint64_t)v12;
    __int16 v39 = 2112;
    v40 = v13;
    __int16 v41 = 2114;
    v42 = v14;
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volumeMuted changed <%{public}@> to <%@> in <%{public}@>", buf, 0x34u);
LABEL_10:
  }
LABEL_24:

  v31 = @"MROutputContextDataSourceVolumeMutedUserInfoKey";
  v24 = [NSNumber numberWithBool:a2];
  __int16 v32 = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v26 = (void *)[v25 mutableCopy];

  if (v5) {
    [v26 setObject:v5 forKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];
  }
  v27 = [a1 notificationQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__MROutputContextDataSource_notifyVolumeMutedDidChange_outputDevice___block_invoke;
  v29[3] = &unk_1E57D0790;
  v29[4] = a1;
  id v30 = v26;
  id v28 = v26;
  dispatch_async(v27, v29);

LABEL_27:
}

- (void)notifyOutputDeviceRemoved:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_notifyOutputDeviceRemoved_, a1, @"MROutputContextDataSource.m", 274, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
    }
    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 verboseOutputContextDataSourceLogging],
          v5,
          v6))
    {
      char v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = objc_opt_class();
        id v9 = v8;
        float v10 = [v4 debugName];
        id v11 = [a1 uniqueIdentifier];
        *(_DWORD *)buf = 138544130;
        id v23 = v8;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        v27 = v10;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice removed <%{public}@> from <%{public}@>", buf, 0x2Au);
      }
    }
    else
    {
      char v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceRemoved:]();
      }
    }

    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 verboseOutputContextDataSourceLogging],
          v12,
          v13))
    {
      v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        v27 = a1;
        id v16 = v15;
        _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceAdded:]();
      }
    }

    v17 = [a1 notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MROutputContextDataSource_notifyOutputDeviceRemoved___block_invoke;
    block[3] = &unk_1E57D0790;
    id v20 = v4;
    v21 = a1;
    dispatch_async(v17, block);
  }
}

- (void)notifyOutputDeviceChanged:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_notifyOutputDeviceChanged_, a1, @"MROutputContextDataSource.m", 259, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
    }
    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 verboseOutputContextDataSourceLogging],
          v5,
          v6))
    {
      char v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = objc_opt_class();
        id v9 = v8;
        float v10 = [v4 debugName];
        id v11 = [a1 uniqueIdentifier];
        *(_DWORD *)buf = 138544130;
        id v23 = v8;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        v27 = v10;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice changed <%{public}@> on <%{public}@>", buf, 0x2Au);
      }
    }
    else
    {
      char v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceChanged:]();
      }
    }

    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 verboseOutputContextDataSourceLogging],
          v12,
          v13))
    {
      v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        v27 = a1;
        id v16 = v15;
        _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceAdded:]();
      }
    }

    v17 = [a1 notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MROutputContextDataSource_notifyOutputDeviceChanged___block_invoke;
    block[3] = &unk_1E57D0790;
    id v20 = v4;
    v21 = a1;
    dispatch_async(v17, block);
  }
}

- (id)descriptionForOutputDevice:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v5 = [v3 clusterComposition];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      char v7 = NSString;
      int v8 = [v3 clusterComposition];
      id v9 = objc_msgSend(v8, "mr_map:", &__block_literal_global_45);
      float v10 = [v9 componentsJoinedByString:@","];
      id v11 = [v7 stringWithFormat:@" (%@)", v10];
    }
    else
    {
      id v11 = &stru_1EE60E7D8;
    }
    id v12 = [NSString alloc];
    int v13 = [v3 debugName];
    [v3 volume];
    double v15 = v14;
    id v16 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription([v3 volumeCapabilities]);
    id v25 = v11;
    v17 = (void *)[v12 initWithFormat:@"%@%@, volume = %lf, volume capabilities = %@", v13, v11, *(void *)&v15, v16];

    [v4 appendString:v17];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = [v3 activatedClusterMembersOutputDevices];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = -[MROutputContextDataSource descriptionForOutputDevice:](a1, *(void *)(*((void *)&v26 + 1) + 8 * i));
          [v4 appendFormat:@"\n  %@", v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __56__MROutputContextDataSource_descriptionForOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(MROutputContextDataSource *)self uniqueIdentifier];
  if ([(MROutputContextDataSource *)self isAirPlaying]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [(MROutputContextDataSource *)self volume];
  double v7 = v6;
  if ([(MROutputContextDataSource *)self isVolumeMuted]) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  id v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription([(MROutputContextDataSource *)self volumeControlCapabilities]);
  float v10 = [(MROutputContextDataSource *)self outputDevices];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__MROutputContextDataSource_description__block_invoke;
  v15[3] = &unk_1E57D1838;
  v15[4] = self;
  id v11 = objc_msgSend(v10, "msv_map:", v15);
  id v12 = MRCreateIndentedDebugDescriptionFromArray(v11);
  int v13 = (void *)[v3 initWithFormat:@"<%p> %@\n  isAirPlaying = %@\n  volume = %f\n  volumeMuted = %@\n  volumeCapabilities = %@\n  outputDevices = %@\n", self, v4, v5, *(void *)&v7, v8, v9, v12];

  return v13;
}

id __40__MROutputContextDataSource_description__block_invoke(uint64_t a1, void *a2)
{
  return -[MROutputContextDataSource descriptionForOutputDevice:](*(void *)(a1 + 32), a2);
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MROutputContextDataSource *)self uniqueIdentifier];
  if ([(MROutputContextDataSource *)self isAirPlaying]) {
    float v6 = @"YES";
  }
  else {
    float v6 = @"NO";
  }
  [(MROutputContextDataSource *)self volume];
  double v8 = v7;
  if ([(MROutputContextDataSource *)self isVolumeMuted]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  float v10 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription([(MROutputContextDataSource *)self volumeControlCapabilities]);
  id v11 = [(MROutputContextDataSource *)self outputDevices];
  id v12 = objc_msgSend(v11, "msv_map:", &__block_literal_global_69);
  int v13 = MRCreateIndentedDebugDescriptionFromArray(v12);
  float v14 = (void *)[v3 initWithFormat:@"<%@:%p> %@\n  isAirPlaying = %@\n  volume = %f\n  volumeMuted = %@\n  volumeCapabilities = %@\n  outputDevices = %@\n", v4, self, v5, v6, *(void *)&v8, v9, v10, v13];

  return v14;
}

uint64_t __45__MROutputContextDataSource_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (BOOL)isAirPlaying
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MROutputContextDataSource *)self outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) deviceType] == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setNotificationQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  notificationQueue = obj->_notificationQueue;
  obj->_notificationQueue = v4;

  objc_sync_exit(obj);
}

- (id)outputDeviceForUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MROutputContextDataSource *)self outputDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) effectiveOutputDeviceForUID:v4];
        if (v10)
        {
          id v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)volumeMutedForOutputDeviceID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(MROutputContextDataSource *)self outputDeviceForUID:v6];
    if (([v7 volumeCapabilities] & 8) != 0)
    {
      char v8 = 0;
    }
    else
    {
      if (!v7)
      {
        Error = (void *)MRMediaRemoteCreateError(39);
        char v8 = 0;
        goto LABEL_11;
      }
      char v8 = [v7 isVolumeMuted];
    }
    Error = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (([(MROutputContextDataSource *)self volumeControlCapabilities] & 8) != 0)
  {
    char v8 = [(MROutputContextDataSource *)self isVolumeMuted];
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(36);
    char v8 = 0;
  }
LABEL_12:
  if (a4) {
    *a4 = Error;
  }

  return v8;
}

- (void)notifyOutputDeviceAdded:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_notifyOutputDeviceAdded_, a1, @"MROutputContextDataSource.m", 244, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
    }
    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 verboseOutputContextDataSourceLogging],
          v5,
          v6))
    {
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        char v8 = objc_opt_class();
        id v9 = v8;
        uint64_t v10 = [v4 debugName];
        id v11 = [a1 uniqueIdentifier];
        *(_DWORD *)buf = 138544130;
        id v23 = v8;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        long long v27 = v10;
        __int16 v28 = 2114;
        long long v29 = v11;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice added <%{public}@> to <%{public}@>", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceAdded:]();
      }
    }

    if (([a1 shouldLog] & 1) != 0
      || (+[MRUserSettings currentSettings],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 verboseOutputContextDataSourceLogging],
          v12,
          v13))
    {
      long long v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2114;
        long long v27 = a1;
        id v16 = v15;
        _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      long long v14 = _MRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[MROutputContextDataSource notifyOutputDeviceAdded:]();
      }
    }

    v17 = [a1 notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MROutputContextDataSource_notifyOutputDeviceAdded___block_invoke;
    block[3] = &unk_1E57D0790;
    id v20 = v4;
    uint64_t v21 = a1;
    dispatch_async(v17, block);
  }
}

void __53__MROutputContextDataSource_notifyOutputDeviceAdded___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = @"MROutputContextDataSourceOutputDeviceUserInfoKey";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MROutputContextDataSourceDidAddOutputDeviceNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

void __55__MROutputContextDataSource_notifyOutputDeviceChanged___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = @"MROutputContextDataSourceOutputDeviceUserInfoKey";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MROutputContextDataSourceDidChangeOutputDeviceNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

void __55__MROutputContextDataSource_notifyOutputDeviceRemoved___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = @"MROutputContextDataSourceOutputDeviceUserInfoKey";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MROutputContextDataSourceDidRemoveOutputDeviceNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)notifyDataSourceReloaded
{
  if (a1)
  {
    uint64_t v2 = [a1 notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MROutputContextDataSource_notifyDataSourceReloaded__block_invoke;
    block[3] = &unk_1E57D0518;
    void block[4] = a1;
    dispatch_async(v2, block);
  }
}

void __53__MROutputContextDataSource_notifyDataSourceReloaded__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MROutputContextDataSourceDidReloadNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __69__MROutputContextDataSource_notifyVolumeMutedDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (float)volume
{
  return self->_volume;
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (BOOL)isVolumeMuted
{
  return self->_volumeMuted;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)notifyOutputDeviceAdded:.cold.1()
{
  OUTLINED_FUNCTION_6();
  dispatch_queue_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_3(v0);
  OUTLINED_FUNCTION_2_1(&dword_194F3C000, v2, v3, "<%{public}@: %p> Existing State: %{public}@", v4, v5, v6, v7, v8);
}

- (void)notifyOutputDeviceAdded:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [v0 debugName];
  uint64_t v4 = [v1 uniqueIdentifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v5, v6, "<%{public}@: %p> Observed outputDevice added <%{public}@> to <%{public}@>", v7, v8, v9, v10, v11);
}

- (void)notifyOutputDeviceChanged:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [v0 debugName];
  uint64_t v4 = [v1 uniqueIdentifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v5, v6, "<%{public}@: %p> Observed outputDevice changed <%{public}@> on <%{public}@>", v7, v8, v9, v10, v11);
}

- (void)notifyOutputDeviceRemoved:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [v0 debugName];
  uint64_t v4 = [v1 uniqueIdentifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v5, v6, "<%{public}@: %p> Observed outputDevice removed <%{public}@> from <%{public}@>", v7, v8, v9, v10, v11);
}

- (void)notifyVolumeDidChange:(void *)a1 outputDevice:.cold.1(void *a1)
{
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v4, v5, "<%{public}@: %p> Observed endpoint volume changed to <%f>. Endpoint=<%{public}@>", v6, v7, v8, v9, 2u);
}

- (void)notifyVolumeCapabilitiesDidChange:outputDevice:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v1 = (id)objc_opt_class();
  id v2 = [v0 uniqueIdentifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v3, v4, "<%{public}@: %p> Observed endpoint volumeCapabilities changed to <%{public}@>. Endpoint=<%{public}@>", v5, v6, v7, v8, v9);
}

- (void)notifyVolumeMutedDidChange:outputDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v1 = (id)objc_opt_class();
  id v2 = [v0 uniqueIdentifier];
  OUTLINED_FUNCTION_3_1(&dword_194F3C000, v3, v4, "<%{public}@: %p> Observed endpoint volumeMuted changed <%{public}@> to <%@>", v5, v6, v7, v8, 2u);
}

@end