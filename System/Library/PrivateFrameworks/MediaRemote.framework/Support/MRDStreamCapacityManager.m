@interface MRDStreamCapacityManager
+ (id)sharedManager;
- (BOOL)willStartingPlaybackToOutputDevicesInterrupt:(id)a3;
- (MRDNowPlayingPlayerClient)bestStreamToInterrupt;
- (MRDStreamCapacityManager)init;
- (id)_willStartingPlaybackToOutputDevicesInterrupt:(id)a3;
- (id)allStreams;
- (id)allStreamsExcludingLocal;
- (id)canActivateStreamWithPlayerPath:(id)a3;
- (id)description;
- (id)streamsActivelyUsingSlot;
- (id)streamsThatCountTowardsCapacity;
- (int64_t)activeStreamCount;
- (int64_t)maxStreamCapacity;
- (int64_t)remainingStreamCapacity;
- (void)_handlePlaybackStateDidChange:(id)a3;
- (void)interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation MRDStreamCapacityManager

+ (id)sharedManager
{
  if (qword_10047DF10 != -1) {
    dispatch_once(&qword_10047DF10, &stru_1004172D0);
  }
  v2 = (void *)qword_10047DF08;

  return v2;
}

- (MRDStreamCapacityManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRDStreamCapacityManager;
  v2 = [(MRDStreamCapacityManager *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_handlePlaybackStateDidChange:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];
  }
  return v2;
}

- (id)description
{
  v3 = [(MRDStreamCapacityManager *)self streamsActivelyUsingSlot];
  id v4 = objc_alloc((Class)NSMutableString);
  id v5 = [v3 count];
  v6 = +[MRUserSettings currentSettings];
  if ([v6 reserveSlotForLocal]) {
    CFStringRef v7 = @"external";
  }
  else {
    CFStringRef v7 = &stru_10042ACB0;
  }
  id v31 = [v4 initWithFormat:@"Currently playing %ld %@ streams (max = %ld).\n", v5, v7, -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity")];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v39;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v10 = [v9 deviceInfo];
        id v11 = objc_alloc((Class)NSMutableString);
        v33 = v9;
        v12 = [v9 origin];
        uint64_t v13 = (int)[v12 identifier];
        v14 = [v10 name];
        v15 = [v10 deviceUID];
        id v16 = [v11 initWithFormat:@"origin-%ld %@ (%@)", v13, v14, v15];

        v17 = [v10 groupedDevices];
        id v18 = [v17 count];

        if (v18) {
          [v16 appendString:@" + "];
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v19 = [v10 groupedDevices];
        id v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v35;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v35 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
              v25 = [v24 name];
              v26 = [v24 deviceUID];
              [v16 appendFormat:@"%@ (%@) + ", v25, v26];
            }
            id v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v21);
        }

        v27 = [v33 activeContent];
        [v31 appendFormat:@"%@ on %@\n", v27, v16];
      }
      id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v32);
  }

  return v31;
}

- (id)canActivateStreamWithPlayerPath:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = +[NSDate now];
  v6 = +[NSUUID UUID];
  CFStringRef v7 = [v6 UUIDString];

  v8 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"canActivateStreamWithPlayerPath", v7];
  v9 = v8;
  if (v4) {
    [(__CFString *)v8 appendFormat:@" for %@", v4];
  }
  v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v63 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10004275C;
  v60[3] = &unk_100417360;
  v60[4] = self;
  v61 = &stru_100417310;
  id v11 = objc_retainBlock(v60);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000427D8;
  v58[3] = &unk_100417360;
  v58[4] = self;
  v59 = &stru_100417310;
  v12 = objc_retainBlock(v58);
  if ((((uint64_t (*)(void *, __CFString *))v11[2])(v11, v4) & 1) == 0)
  {
    id v16 = _MRLogForCategory();
    BOOL v21 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v21)
      {
        id v18 = +[NSDate date];
        [v18 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138544386;
        CFStringRef v63 = @"canActivateStreamWithPlayerPath";
        __int16 v64 = 2114;
        v65 = v7;
        __int16 v66 = 2112;
        CFStringRef v67 = @"PlayerPath does not take up a slot thus is always allowed to activate";
        __int16 v68 = 2114;
        v69 = v4;
        __int16 v70 = 2048;
        uint64_t v71 = v22;
        id v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        goto LABEL_14;
      }
LABEL_35:
      v28 = 0;
      goto LABEL_36;
    }
    if (!v21) {
      goto LABEL_35;
    }
    id v18 = +[NSDate date];
    [v18 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    CFStringRef v63 = @"canActivateStreamWithPlayerPath";
    __int16 v64 = 2114;
    v65 = v7;
    __int16 v66 = 2112;
    CFStringRef v67 = @"PlayerPath does not take up a slot thus is always allowed to activate";
    __int16 v68 = 2048;
    v69 = v31;
    id v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_32:
    v23 = v16;
    uint32_t v24 = 42;
    goto LABEL_33;
  }
  uint64_t v13 = [(MRDStreamCapacityManager *)self remainingStreamCapacity];
  int v14 = ((uint64_t (*)(void *, __CFString *))v12[2])(v12, v4);
  int v15 = v14;
  if (v13 >= 1)
  {
    if (v14)
    {
      id v16 = _MRLogForCategory();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v17)
        {
          id v18 = +[NSDate date];
          [v18 timeIntervalSinceDate:v5];
          *(_DWORD *)buf = 138544386;
          CFStringRef v63 = @"canActivateStreamWithPlayerPath";
          __int16 v64 = 2114;
          v65 = v7;
          __int16 v66 = 2112;
          CFStringRef v67 = @"PlayerPath is already active";
          __int16 v68 = 2114;
          v69 = v4;
          __int16 v70 = 2048;
          uint64_t v71 = v19;
          id v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
LABEL_14:
          v23 = v16;
          uint32_t v24 = 52;
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v20, buf, v24);
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      if (!v17) {
        goto LABEL_35;
      }
      id v18 = +[NSDate date];
      [v18 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v63 = @"canActivateStreamWithPlayerPath";
      __int16 v64 = 2114;
      v65 = v7;
      __int16 v66 = 2112;
      CFStringRef v67 = @"PlayerPath is already active";
      __int16 v68 = 2048;
      v69 = v45;
      id v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      goto LABEL_32;
    }
    id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Number of currently activeStreams (%ld) is less that capacity (%ld) so allowing activation", -[MRDStreamCapacityManager activeStreamCount](self, "activeStreamCount"), -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity"));
    id v18 = _MRLogForCategory();
    BOOL v32 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v4)
      {
        if (!v32)
        {
LABEL_34:

          goto LABEL_35;
        }
        v33 = +[NSDate date];
        [v33 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138544386;
        CFStringRef v63 = @"canActivateStreamWithPlayerPath";
        __int16 v64 = 2114;
        v65 = v7;
        __int16 v66 = 2112;
        CFStringRef v67 = (const __CFString *)v16;
        __int16 v68 = 2114;
        v69 = v4;
        __int16 v70 = 2048;
        uint64_t v71 = v34;
        long long v35 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        long long v36 = v18;
        uint32_t v37 = 52;
LABEL_58:
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);

        goto LABEL_34;
      }
      if (!v32) {
        goto LABEL_34;
      }
      v33 = +[NSDate date];
      [v33 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v63 = @"canActivateStreamWithPlayerPath";
      __int16 v64 = 2114;
      v65 = v7;
      __int16 v66 = 2112;
      CFStringRef v67 = (const __CFString *)v16;
      __int16 v68 = 2048;
      v69 = v48;
      long long v35 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v4)
      {
        if (!v32) {
          goto LABEL_34;
        }
        v33 = +[NSDate date];
        [v33 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138543874;
        CFStringRef v63 = @"canActivateStreamWithPlayerPath";
        __int16 v64 = 2114;
        v65 = v7;
        __int16 v66 = 2048;
        CFStringRef v67 = v56;
        long long v35 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        long long v36 = v18;
        uint32_t v37 = 32;
        goto LABEL_58;
      }
      if (!v32) {
        goto LABEL_34;
      }
      v33 = +[NSDate date];
      [v33 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v63 = @"canActivateStreamWithPlayerPath";
      __int16 v64 = 2114;
      v65 = v7;
      __int16 v66 = 2114;
      CFStringRef v67 = v4;
      __int16 v68 = 2048;
      v69 = v47;
      long long v35 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    long long v36 = v18;
    uint32_t v37 = 42;
    goto LABEL_58;
  }
  id v25 = objc_alloc((Class)NSError);
  uint64_t v26 = [(MRDStreamCapacityManager *)self description];
  v27 = (void *)v26;
  if (!v15)
  {
    v28 = (__CFString *)[v25 initWithMRError:46 description:v26];

    long long v38 = _MRLogForCategory();
    id v16 = v38;
    if (v28)
    {
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        if (!v39) {
          goto LABEL_36;
        }
        goto LABEL_29;
      }
      if (!v39) {
        goto LABEL_36;
      }
LABEL_54:
      long long v40 = +[NSDate date];
      [v40 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v63 = @"canActivateStreamWithPlayerPath";
      __int16 v64 = 2114;
      v65 = v7;
      __int16 v66 = 2114;
      CFStringRef v67 = v28;
      __int16 v68 = 2048;
      v69 = v55;
      v42 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v43 = v16;
      uint32_t v44 = 42;
      goto LABEL_55;
    }
    BOOL v50 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v50) {
        goto LABEL_36;
      }
      goto LABEL_50;
    }
    if (!v50) {
      goto LABEL_36;
    }
LABEL_62:
    long long v40 = +[NSDate date];
    [v40 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138543874;
    CFStringRef v63 = @"canActivateStreamWithPlayerPath";
    __int16 v64 = 2114;
    v65 = v7;
    __int16 v66 = 2048;
    CFStringRef v67 = v57;
    v52 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v53 = v16;
    uint32_t v54 = 32;
    goto LABEL_63;
  }
  v28 = (__CFString *)[v25 initWithMRError:46, @"Already above max capacity. %@", v26 format];

  v29 = _MRLogForCategory();
  id v16 = v29;
  if (!v28)
  {
    BOOL v49 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v49) {
        goto LABEL_36;
      }
LABEL_50:
      long long v40 = +[NSDate date];
      [v40 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v63 = @"canActivateStreamWithPlayerPath";
      __int16 v64 = 2114;
      v65 = v7;
      __int16 v66 = 2114;
      CFStringRef v67 = v4;
      __int16 v68 = 2048;
      v69 = v51;
      v52 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v53 = v16;
      uint32_t v54 = 42;
LABEL_63:
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
      goto LABEL_64;
    }
    if (!v49) {
      goto LABEL_36;
    }
    goto LABEL_62;
  }
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
  if (!v4)
  {
    if (!v30) {
      goto LABEL_36;
    }
    goto LABEL_54;
  }
  if (!v30) {
    goto LABEL_36;
  }
LABEL_29:
  long long v40 = +[NSDate date];
  [v40 timeIntervalSinceDate:v5];
  *(_DWORD *)buf = 138544386;
  CFStringRef v63 = @"canActivateStreamWithPlayerPath";
  __int16 v64 = 2114;
  v65 = v7;
  __int16 v66 = 2114;
  CFStringRef v67 = v28;
  __int16 v68 = 2114;
  v69 = v4;
  __int16 v70 = 2048;
  uint64_t v71 = v41;
  v42 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
  v43 = v16;
  uint32_t v44 = 52;
LABEL_55:
  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);
LABEL_64:

LABEL_36:

  return v28;
}

- (void)interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSDate date];
  v12 = +[NSUUID UUID];
  uint64_t v13 = [v12 UUIDString];

  id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath", v13];
  int v15 = v14;
  if (v8) {
    [v14 appendFormat:@" for %@", v8];
  }
  if (v9) {
    [v15 appendFormat:@" because %@", v9];
  }
  id v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v39 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100042C20;
  v32[3] = &unk_100417388;
  id v17 = v8;
  id v33 = v17;
  uint64_t v34 = @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath";
  id v18 = v13;
  id v35 = v18;
  id v19 = v11;
  id v36 = v19;
  id v20 = v10;
  id v37 = v20;
  BOOL v21 = objc_retainBlock(v32);
  uint64_t v22 = [(MRDStreamCapacityManager *)self canActivateStreamWithPlayerPath:v17];
  if (v22)
  {
    v23 = [(MRDStreamCapacityManager *)self bestStreamToInterrupt];
    if (v23)
    {
      id v24 = objc_alloc((Class)MRNowPlayingRequest);
      [v23 playerPath];
      id v25 = v29 = v9;
      id v26 = [v24 initWithPlayerPath:v25];

      id v27 = objc_alloc_init((Class)NSMutableDictionary);
      id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath", v29];
      [v27 setObject:v28 forKeyedSubscript:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100042F98;
      v30[3] = &unk_100416820;
      id v31 = v21;
      [v26 sendCommand:1 options:v27 queue:&_dispatch_main_q completion:v30];

      id v9 = v29;
    }
    else
    {
      id v26 = [objc_alloc((Class)NSError) initWithMRError:29 description:@"Could not find a best stream to interrupt"];
      ((void (*)(void *, void, id))v21[2])(v21, 0, v26);
    }
  }
  else
  {
    ((void (*)(void *, void, void))v21[2])(v21, 0, 0);
  }
}

- (MRDNowPlayingPlayerClient)bestStreamToInterrupt
{
  v3 = +[NSDate date];
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];

  v6 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"bestStreamToInterrupt", v5];
  CFStringRef v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v8 = [(MRDStreamCapacityManager *)self allStreamsExcludingLocal];
  id v9 = objc_msgSend(v8, "msv_compactMap:", &stru_1004173C8);

  id v10 = [v9 sortedArrayUsingComparator:&stru_100417408];
  id v11 = [v10 firstObject];

  v12 = [v11 playerPath];

  uint64_t v13 = _MRLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14) {
      goto LABEL_9;
    }
    int v15 = [v11 playerPath];
    id v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    CFStringRef v21 = @"bestStreamToInterrupt";
    __int16 v22 = 2114;
    v23 = v5;
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
  }
  else
  {
    if (!v14) {
      goto LABEL_9;
    }
    int v15 = +[NSDate date];
    [v15 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138543874;
    CFStringRef v21 = @"bestStreamToInterrupt";
    __int16 v22 = 2114;
    v23 = v5;
    __int16 v24 = 2048;
    id v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
  }

LABEL_9:

  return (MRDNowPlayingPlayerClient *)v11;
}

- (id)_willStartingPlaybackToOutputDevicesInterrupt:(id)a3
{
  id v4 = a3;
  if ([(MRDStreamCapacityManager *)self remainingStreamCapacity] < 1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = [(MRDStreamCapacityManager *)self streamsThatCountTowardsCapacity];
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      uint64_t v27 = v9;
      id v28 = v4;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v14 containsActiveStream])
          {
            int v15 = [v14 deviceInfo];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v16 = v4;
            id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v30;
              while (2)
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v30 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
                  if ([v15 containsDevice:v21])
                  {
                    id v22 = objc_alloc((Class)NSString);
                    v23 = [v14 activeContent];
                    id v24 = [v22 initWithFormat:@"Already playing <%@> to specified device <%@>", v23, v21];

                    id v8 = [objc_alloc((Class)MSVPair) initWithFirst:&__kCFBooleanFalse second:v24];
                    id v4 = v28;
                    goto LABEL_23;
                  }
                }
                id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

            id v9 = v27;
            id v4 = v28;
            uint64_t v12 = v26;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }

    id v5 = [(MRDStreamCapacityManager *)self description];
    id v6 = objc_alloc((Class)MSVPair);
    CFStringRef v7 = &__kCFBooleanTrue;
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Number of currently activeStreams (%ld) is less that capacity (%ld).", -[MRDStreamCapacityManager activeStreamCount](self, "activeStreamCount"), -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity"));
    id v6 = objc_alloc((Class)MSVPair);
    CFStringRef v7 = &__kCFBooleanFalse;
  }
  id v8 = [v6 initWithFirst:v7 second:v5];

LABEL_23:

  return v8;
}

- (BOOL)willStartingPlaybackToOutputDevicesInterrupt:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  id v6 = +[NSUUID UUID];
  CFStringRef v7 = [v6 UUIDString];

  id v8 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"willStartingPlaybackToOutputDevicesInterrupt", v7];
  id v9 = v8;
  if (v4) {
    [(__CFString *)v8 appendFormat:@" for %@", v4];
  }
  id v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v11 = [(MRDStreamCapacityManager *)self _willStartingPlaybackToOutputDevicesInterrupt:v4];
  uint64_t v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 second];
    *(_DWORD *)buf = 138543874;
    CFStringRef v35 = @"willStartingPlaybackToOutputDevicesInterrupt";
    __int16 v36 = 2114;
    id v37 = v7;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }
  BOOL v14 = [v11 first];
  int v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 BOOLValue]);

  id v16 = _MRLogForCategory();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v4)
    {
      if (!v17) {
        goto LABEL_21;
      }
      id v18 = +[NSDate date];
      [v18 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      CFStringRef v35 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2114;
      id v39 = v4;
      __int16 v40 = 2048;
      id v41 = v25;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v27 = v16;
      uint32_t v28 = 42;
    }
    else
    {
      if (!v17) {
        goto LABEL_21;
      }
      id v18 = +[NSDate date];
      [v18 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138543874;
      CFStringRef v35 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2048;
      id v39 = v30;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v27 = v16;
      uint32_t v28 = 32;
    }
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_20;
  }
  if (v4)
  {
    if (v17)
    {
      id v18 = [v11 first];
      uint64_t v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 BOOLValue]);
      id v20 = +[NSDate date];
      [v20 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544386;
      CFStringRef v35 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2112;
      id v39 = v19;
      __int16 v40 = 2114;
      id v41 = v4;
      __int16 v42 = 2048;
      uint64_t v43 = v21;
      id v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v23 = v16;
      uint32_t v24 = 52;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_20:
    }
  }
  else if (v17)
  {
    id v18 = [v11 first];
    uint64_t v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 BOOLValue]);
    id v20 = +[NSDate date];
    [v20 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    CFStringRef v35 = @"willStartingPlaybackToOutputDevicesInterrupt";
    __int16 v36 = 2114;
    id v37 = v7;
    __int16 v38 = 2112;
    id v39 = v19;
    __int16 v40 = 2048;
    id v41 = v29;
    id v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v23 = v16;
    uint32_t v24 = 42;
    goto LABEL_16;
  }
LABEL_21:

  long long v31 = [v11 first];
  unsigned __int8 v32 = [v31 BOOLValue];

  return v32;
}

- (int64_t)activeStreamCount
{
  v2 = [(MRDStreamCapacityManager *)self streamsActivelyUsingSlot];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)maxStreamCapacity
{
  v2 = +[MRUserSettings currentSettings];
  id v3 = [v2 maxStreamCapacity];

  return (int64_t)v3;
}

- (int64_t)remainingStreamCapacity
{
  int64_t v3 = [(MRDStreamCapacityManager *)self maxStreamCapacity];
  return v3 - [(MRDStreamCapacityManager *)self activeStreamCount];
}

- (id)allStreams
{
  v2 = +[MRDMediaRemoteServer server];
  int64_t v3 = [v2 nowPlayingServer];
  id v4 = [v3 originClients];
  id v5 = objc_msgSend(v4, "msv_filter:", &stru_100417448);

  return v5;
}

- (id)allStreamsExcludingLocal
{
  v2 = [(MRDStreamCapacityManager *)self allStreams];
  int64_t v3 = objc_msgSend(v2, "msv_filter:", &stru_100417468);

  return v3;
}

- (id)streamsThatCountTowardsCapacity
{
  int64_t v3 = +[MRUserSettings currentSettings];
  unsigned __int8 v4 = [v3 reserveSlotForLocal];

  if (v4)
  {
    id v5 = [(MRDStreamCapacityManager *)self allStreamsExcludingLocal];
  }
  else
  {
    id v5 = [(MRDStreamCapacityManager *)self allStreams];
    id v6 = objc_msgSend(v5, "msv_firstWhere:", &stru_100417488);

    if (!v6)
    {
      CFStringRef v7 = +[MRDMediaRemoteServer server];
      id v8 = [v7 nowPlayingServer];
      id v9 = [v8 localOriginClient];
      uint64_t v10 = [v5 arrayByAddingObject:v9];

      id v5 = (void *)v10;
    }
  }

  return v5;
}

- (id)streamsActivelyUsingSlot
{
  v2 = [(MRDStreamCapacityManager *)self streamsThatCountTowardsCapacity];
  int64_t v3 = objc_msgSend(v2, "msv_filter:", &stru_1004174A8);

  return v3;
}

- (void)_handlePlaybackStateDidChange:(id)a3
{
  id v16 = a3;
  unsigned __int8 v4 = [v16 userInfo];
  id v5 = MRGetPlayerPathFromUserInfo();

  id v6 = [v5 origin];
  unsigned int v7 = [v6 isLocallyHosted];

  if (v7)
  {
    id v8 = [v5 client];
    id v9 = [v8 bundleIdentifier];
    uint64_t v10 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
    unsigned int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [v16 userInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
      unsigned int v14 = [v13 BOOLValue];

      if (v14)
      {
        id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@ just started playing", v5];
        [(MRDStreamCapacityManager *)self interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:v5 reason:v15 completion:0];
      }
    }
  }
}

@end