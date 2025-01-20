@interface HostWatcher
+ (int)dumpConnectedHosts:(id *)a3;
+ (void)addService:(id)a3 forHostID:(__CFString *)a4;
+ (void)cleanupClosedSocketForPeer:(id)a3;
+ (void)invalidateServiceWithPID:(int)a3 heartBeatRef:(unint64_t)a4;
+ (void)invalidateWatcherForHost:(__CFString *)a3;
+ (void)removeService:(id)a3 forHostID:(__CFString *)a4;
- (BOOL)aboutToSleep;
- (BOOL)invalidated;
- (BOOL)lockdownSockConfirmedClosed;
- (BOOL)sleepTimerEnabled;
- (BOOL)systemSleepNotificationProcessed;
- (HostWatcher)initWithCheckinGoop:(void *)a3;
- (IONotificationPort)powerPort;
- (NSMutableArray)servicesAwaitingClose;
- (NSMutableSet)watchedServices;
- (NSString)descriptionOverride;
- (NSString)hostID;
- (NSString)hostName;
- (NSString)peerName;
- (OS_dispatch_queue)pingQueue;
- (OS_dispatch_semaphore)pingSem;
- (OS_dispatch_source)powerDownTimer;
- (OS_os_transaction)transaction;
- (SSLContext)sslCtx;
- (_lockdown_connection)ldConn;
- (id)description;
- (id)receiveMessage:(char *)a3 size:(unint64_t *)a4;
- (id)sleepHandler;
- (int)receivePacket:(char *)a3 size:(unint64_t)a4;
- (int)sendPacket:(const char *)a3 size:(unint64_t)a4;
- (int)sock;
- (unsigned)powerConn;
- (unsigned)powerNotifier;
- (void)addService:(id)a3;
- (void)dealloc;
- (void)enumerateServices:(id)a3;
- (void)handleSleepNotification:(unsigned int)a3 service:(unsigned int)a4 messageArgument:(void *)a5;
- (void)invalidate;
- (void)powerLogForService:(id)a3 event:(id)a4;
- (void)removeService:(id)a3;
- (void)runWatcher;
- (void)setAboutToSleep:(BOOL)a3;
- (void)setDescriptionOverride:(id)a3;
- (void)setHostID:(id)a3;
- (void)setHostName:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLdConn:(_lockdown_connection *)a3;
- (void)setLockdownSockConfirmedClosed:(BOOL)a3;
- (void)setPeerName:(id)a3;
- (void)setPingQueue:(id)a3;
- (void)setPingSem:(id)a3;
- (void)setPowerConn:(unsigned int)a3;
- (void)setPowerDownTimer:(id)a3;
- (void)setPowerNotifier:(unsigned int)a3;
- (void)setPowerPort:(IONotificationPort *)a3;
- (void)setServicesAwaitingClose:(id)a3;
- (void)setSleepHandler:(id)a3;
- (void)setSleepTimerEnabled:(BOOL)a3;
- (void)setSock:(int)a3;
- (void)setSslCtx:(SSLContext *)a3;
- (void)setSystemSleepNotificationProcessed:(BOOL)a3;
- (void)setWatchedServices:(id)a3;
@end

@implementation HostWatcher

+ (void)cleanupClosedSocketForPeer:(id)a3
{
  id v3 = a3;
  v4 = qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000016D0;
  block[3] = &unk_10000C4D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (void)addService:(id)a3 forHostID:(__CFString *)a4
{
  id v5 = a3;
  v6 = qword_100010C18;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001A8C;
  v8[3] = &unk_10000C4F8;
  id v9 = v5;
  v10 = a4;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

+ (void)removeService:(id)a3 forHostID:(__CFString *)a4
{
  id v5 = a3;
  v6 = qword_100010C18;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001B94;
  v8[3] = &unk_10000C4F8;
  id v9 = v5;
  v10 = a4;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

+ (void)invalidateWatcherForHost:(__CFString *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100001E24;
  v22 = sub_100001E34;
  id v23 = 0;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = (void *)v19[5];
  v19[5] = (uint64_t)v4;

  v6 = qword_100010C18;
  if (a3)
  {
    id v7 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100001E3C;
    v17[3] = &unk_10000C520;
    v17[5] = a3;
  }
  else
  {
    id v7 = block;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001ECC;
    block[3] = &unk_10000C570;
  }
  v7[4] = &v18;
  dispatch_sync(v6, v7);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = (id)v19[5];
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) invalidate:v12];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v24 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v18, 8);
}

+ (void)invalidateServiceWithPID:(int)a3 heartBeatRef:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100001FD0;
  v4[3] = &unk_10000C5D0;
  v4[4] = a4;
  int v5 = a3;
  dispatch_sync((dispatch_queue_t)qword_100010C18, v4);
}

+ (int)dumpConnectedHosts:(id *)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  int v5 = v4;
  if (v4)
  {
    v6 = qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002264;
    block[3] = &unk_10000C4D0;
    id v7 = v4;
    id v12 = v7;
    dispatch_sync(v6, block);

    id v8 = [v7 count];
    int v9 = 0;
    if (a3 && v8)
    {
      int v9 = 0;
      *a3 = v7;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate array.", buf, 2u);
    }
    int v9 = -1;
  }

  return v9;
}

- (int)sendPacket:(const char *)a3 size:(unint64_t)a4
{
  if ([(HostWatcher *)self ldConn])
  {
    unint64_t v6 = 0;
    while (a4 > v6)
    {
      [(HostWatcher *)self ldConn];
      uint64_t v7 = lockdown_send();
      v6 += v7;
      if (v7 == -1) {
        return -1;
      }
    }
    return 0;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

- (int)receivePacket:(char *)a3 size:(unint64_t)a4
{
  if ([(HostWatcher *)self ldConn])
  {
    unint64_t v6 = 0;
    while (a4 > v6)
    {
      [(HostWatcher *)self ldConn];
      uint64_t v7 = lockdown_recv();
      v6 += v7;
      if (v7 <= 0) {
        return -1;
      }
    }
    return 0;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

- (id)receiveMessage:(char *)a3 size:(unint64_t *)a4
{
  unsigned int v27 = 0;
  if (!a3 || !a4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Invalid inputs.";
LABEL_9:
    uint32_t v11 = 2;
    goto LABEL_10;
  }
  if ([(HostWatcher *)self receivePacket:&v27 size:4])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *__error();
      id v8 = __error();
      int v9 = strerror(*v8);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v29 = v7;
      *(_WORD *)&v29[4] = 2082;
      *(void *)&v29[6] = v9;
      uint64_t v10 = "Failed to read response message size: %d %{public}s";
LABEL_6:
      uint32_t v11 = 18;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    }
LABEL_11:
    id v12 = 0;
    long long v13 = 0;
    goto LABEL_12;
  }
  uint64_t v17 = bswap32(v27);
  unsigned int v27 = v17;
  if (v17 > 0x2000)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v29 = v27;
    uint64_t v10 = "Message size of %d is too large.";
    uint32_t v11 = 8;
    goto LABEL_10;
  }
  if (*a4 >= v17)
  {
    v19 = *a3;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v29 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Growing read buffer size to %d.", buf, 8u);
    }
    *a4 = v27;
    free(*a3);
    uint64_t v18 = (char *)malloc_type_malloc(*a4, 0xB932DE92uLL);
    *a3 = v18;
    if (!v18)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      unint64_t v25 = *a4;
      *(_DWORD *)buf = 134217984;
      *(void *)v29 = v25;
      uint64_t v10 = "Failed to allocate buffer of size %ld.";
      uint32_t v11 = 12;
      goto LABEL_10;
    }
    v19 = v18;
    uint64_t v17 = v27;
  }
  if ([(HostWatcher *)self receivePacket:v19 size:v17])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v29 = v20;
    *(_WORD *)&v29[4] = 2082;
    *(void *)&v29[6] = v22;
    uint64_t v10 = "Failed to read message: %d %{public}s";
    goto LABEL_6;
  }
  id v23 = objc_alloc((Class)NSData);
  id v24 = [v23 initWithBytes:*a3 length:v27];
  if (!v24)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Failed to allocate data.";
    goto LABEL_9;
  }
  id v12 = v24;
  long long v13 = +[NSPropertyListSerialization propertyListWithData:v24 options:0 format:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    long long v13 = v14;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [(HostWatcher *)self hostID];
    *(_DWORD *)buf = 138543618;
    *(void *)v29 = v13;
    *(_WORD *)&v29[8] = 2114;
    *(void *)&v29[10] = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid message (%{public}@) received from host %{public}@.", buf, 0x16u);
  }
LABEL_12:
  id v14 = 0;
LABEL_13:
  id v15 = v14;

  return v15;
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HostWatcher *)self hostID];
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalidating host watcher: %{public}@", buf, 0xCu);
  }
  [(HostWatcher *)self setInvalidated:1];
  int v5 = qword_100010C08;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002AAC;
  block[3] = &unk_10000C680;
  objc_copyWeak(&v7, &location);
  void block[4] = self;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)runWatcher
{
  v36 = 0;
  size_t v37 = 256;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  unint64_t v35 = 0;
  unint64_t v35 = sub_100003520();
  objc_initWeak(&location, self);
  id v3 = [(HostWatcher *)self pingQueue];
  dispatch_assert_queue_V2(v3);

  v36 = malloc_type_malloc(v37, 0xB0DBC2F8uLL);
  if (!v36)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "Failed to allocate read buffer.";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_31:
    uint64_t v10 = 0;
    unint64_t v6 = 0;
LABEL_36:
    [(HostWatcher *)self invalidate];
    goto LABEL_37;
  }
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C878);
  }
  uint64_t v4 = qword_100010C50;
  if (qword_100010C50)
  {
    uint64_t v5 = qword_100010C58;
    goto LABEL_6;
  }
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
    || (*(_WORD *)buf = 0,
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to ping create message.", buf, 2u), (uint64_t v4 = qword_100010C50) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "Failed to allocate write buffer.";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = dispatch_queue_create("com.apple.mobile.heartbeat.lastPing", 0);
  if (!v33[3])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Failed to allocate queue.";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_35:
    uint64_t v10 = 0;
    goto LABEL_36;
  }
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Failed to create timer.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  id v8 = v7;
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x12A05F200uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003590;
  handler[3] = &unk_10000C6A8;
  objc_copyWeak(&v30, &location);
  v29 = &v32;
  uint64_t v10 = v8;
  v28 = v10;
  dispatch_source_set_event_handler(v10, handler);

  objc_destroyWeak(&v30);
  dispatch_resume(v10);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v39 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting loop for %{public}@", buf, 0xCu);
  }
  LODWORD(v12) = 0;
  *(void *)&long long v11 = 134218242;
  long long v23 = v11;
  while (![(HostWatcher *)self invalidated] && ![(HostWatcher *)self aboutToSleep])
  {
    if ([(HostWatcher *)self sendPacket:v4 size:v5])
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = *__error();
        v21 = __error();
        v22 = strerror(*v21);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v39 = v20;
        *(_WORD *)&v39[4] = 2082;
        *(void *)&v39[6] = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send ping: %d %{public}s", buf, 0x12u);
      }

      LODWORD(v12) = 0;
      break;
    }
    id v12 = [(HostWatcher *)self receiveMessage:&v36 size:&v37];
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000036DC;
      block[3] = &unk_10000C570;
      void block[4] = &v32;
      dispatch_sync(v6, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = v33[3];
        *(_DWORD *)buf = v23;
        *(void *)v39 = v14;
        *(_WORD *)&v39[8] = 2114;
        *(void *)&v39[10] = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received response at %llu: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive ping response.", buf, 2u);
    }

    if (!v12) {
      break;
    }
    dispatch_time_t v15 = dispatch_time(0, 10000000000);
    v16 = dispatch_get_global_queue(0, 0);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000370C;
    v24[3] = &unk_10000C6D0;
    objc_copyWeak(&v25, &location);
    dispatch_after(v15, v16, v24);

    id v12 = [(HostWatcher *)self pingSem];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v25);
    LODWORD(v12) = 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v39 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ended loop for %{public}@", buf, 0xCu);
  }
  dispatch_source_cancel(v10);
  if (!v12) {
    goto LABEL_36;
  }
LABEL_37:
  if (v36) {
    free(v36);
  }
  v36 = 0;
  objc_destroyWeak(&location);

  _Block_object_dispose(&v32, 8);
}

- (void)handleSleepNotification:(unsigned int)a3 service:(unsigned int)a4 messageArgument:(void *)a5
{
  objc_initWeak(&location, self);
  HIDWORD(v8) = a3;
  LODWORD(v8) = a3 + 536870288;
  switch((v8 >> 4))
  {
    case 0u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Power notification: kIOMessageCanSystemSleep", buf, 2u);
      }
      IOReturn v9 = IOAllowPowerChange([(HostWatcher *)self powerConn], (intptr_t)a5);
      if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v51 = v9;
        uint64_t v10 = "IOAllowPowerChange failed: %08x";
        goto LABEL_17;
      }
      break;
    case 1u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Power notification: kIOMessageSystemWillSleep", buf, 2u);
      }
      if ([(HostWatcher *)self systemSleepNotificationProcessed])
      {
        IOReturn v11 = IOAllowPowerChange([(HostWatcher *)self powerConn], (intptr_t)a5);
        if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v51 = v11;
          uint64_t v10 = "IOAllowPowerChange failed: %08x";
          goto LABEL_17;
        }
      }
      else
      {
        [(HostWatcher *)self setAboutToSleep:1];
        v36 = [(HostWatcher *)self pingSem];
        dispatch_semaphore_signal(v36);

        size_t v37 = qword_100010C18;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100003C00;
        block[3] = &unk_10000C6D0;
        objc_copyWeak(&v48, &location);
        dispatch_sync(v37, block);
        id v38 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v39 = [(HostWatcher *)self peerName];
          v40 = [(HostWatcher *)self servicesAwaitingClose];
          sub_100007E1C(v39, v40, buf);
        }

        v41 = [(HostWatcher *)self pingQueue];
        v42 = _NSConcreteStackBlock;
        uint64_t v43 = 3221225472;
        v44 = sub_100003D1C;
        v45 = &unk_10000C740;
        objc_copyWeak(v46, &location);
        v46[1] = a5;
        dispatch_sync(v41, &v42);

        -[HostWatcher setSystemSleepNotificationProcessed:](self, "setSystemSleepNotificationProcessed:", 1, v42, v43, v44, v45);
        objc_destroyWeak(v46);
        objc_destroyWeak(&v48);
      }
      break;
    case 2u:
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v12) {
        sub_100007F04(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      break;
    case 9u:
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v20) {
        sub_100007EC8(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      break;
    case 0xBu:
      BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v28) {
        sub_100007E8C(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v51 = a3;
        uint64_t v10 = "Unknown power notification: %d";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 8u);
      }
      break;
  }
  objc_destroyWeak(&location);
}

- (id)description
{
  id v3 = [(HostWatcher *)self descriptionOverride];

  if (v3)
  {
    uint64_t v4 = [(HostWatcher *)self descriptionOverride];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HostWatcher;
    uint64_t v4 = [(HostWatcher *)&v6 description];
  }

  return v4;
}

- (HostWatcher)initWithCheckinGoop:(void *)a3
{
  v55.receiver = self;
  v55.super_class = (Class)HostWatcher;
  CFDictionaryRef theDict = 0;
  uint64_t v4 = [(HostWatcher *)&v55 init];
  if (!v4)
  {
    char v8 = 0;
    goto LABEL_48;
  }
  v61[0] = @"CheckinConnectionInfo";
  v61[1] = @"NoHeartBeat";
  v62[0] = a3;
  v62[1] = &__kCFBooleanTrue;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  int v6 = secure_lockdown_checkin();
  if (!v6)
  {
    uint64_t v11 = CFDictionaryGetValue(theDict, @"HostID");
    BOOL v12 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = CFDictionaryGetValue(theDict, @"HostName");
      uint64_t v14 = (void *)*((void *)v4 + 6);
      *((void *)v4 + 6) = v13;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = (void *)*((void *)v4 + 6);
        *((void *)v4 + 6) = @"Unknown host";
      }
      unsigned int socket = lockdown_get_socket();
      v4[6] = socket;
      if (socket == -1)
      {
        char v8 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        *(_WORD *)buf = 0;
        IOReturn v9 = "Invalid socket.";
      }
      else
      {
        *((unsigned char *)v4 + 11) = 0;
        uint64_t securecontext = lockdown_get_securecontext();
        *((void *)v4 + 16) = securecontext;
        if (!securecontext && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SSL not enabled on this connection.", buf, 2u);
        }
        id v18 = objc_alloc_init((Class)NSMutableSet);
        uint64_t v19 = (void *)*((void *)v4 + 9);
        *((void *)v4 + 9) = v18;

        if (*((void *)v4 + 9))
        {
          id v20 = objc_alloc_init((Class)NSMutableArray);
          uint64_t v21 = (void *)*((void *)v4 + 10);
          *((void *)v4 + 10) = v20;

          if (*((void *)v4 + 10))
          {
            if (sub_100001444(v4[6]))
            {
              uint64_t v22 = sub_100004D84(v4[6]);
              uint64_t v23 = (void *)*((void *)v4 + 7);
              *((void *)v4 + 7) = v22;

              if (*((void *)v4 + 7))
              {
                id v24 = objc_alloc((Class)NSString);
                uint64_t v25 = (objc_class *)objc_opt_class();
                id v26 = [v24 initWithFormat:@"<%s: %p> [%@ %@ '%@'] [fd=%d]", class_getName(v25), v4, *((void *)v4 + 5), *((void *)v4 + 7), *((void *)v4 + 6), v4[6]];
                uint64_t v27 = (void *)*((void *)v4 + 11);
                *((void *)v4 + 11) = v26;

                if (*((void *)v4 + 11))
                {
                  io_connect_t v28 = IORegisterForSystemPower(v4, (IONotificationPortRef *)v4 + 15, (IOServiceInterestCallback)sub_100004E5C, v4 + 5);
                  v4[4] = v28;
                  if (v28)
                  {
                    id v29 = objc_alloc((Class)NSString);
                    uint64_t v30 = [v4 hostID];
                    id v31 = [v29 initWithFormat:@"com.apple.mobile.heartbeat.pingQueue.%@", v30];

                    if (v31)
                    {
                      id v32 = v31;
                      dispatch_queue_t v33 = dispatch_queue_create((const char *)[v32 UTF8String], 0);
                      uint64_t v34 = (void *)*((void *)v4 + 12);
                      *((void *)v4 + 12) = v33;

                      if (*((void *)v4 + 12))
                      {
                        dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
                        v36 = (void *)*((void *)v4 + 13);
                        *((void *)v4 + 13) = v35;

                        if (*((void *)v4 + 13))
                        {
                          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v4 + 15), (dispatch_queue_t)qword_100010C08);
                          objc_initWeak((id *)buf, v4);
                          dispatch_source_t v37 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100010C08);
                          id v38 = (void *)*((void *)v4 + 14);
                          *((void *)v4 + 14) = v37;

                          v39 = *((void *)v4 + 14);
                          if (v39)
                          {
                            dispatch_source_set_timer(v39, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
                            v40 = *((void *)v4 + 14);
                            handler[0] = _NSConcreteStackBlock;
                            handler[1] = 3221225472;
                            handler[2] = sub_100004E68;
                            handler[3] = &unk_10000C6D0;
                            objc_copyWeak(&v53, (id *)buf);
                            dispatch_source_set_event_handler(v40, handler);
                            v41 = *((void *)v4 + 14);
                            v50[0] = _NSConcreteStackBlock;
                            v50[1] = 3221225472;
                            v50[2] = sub_100004FB8;
                            v50[3] = &unk_10000C6D0;
                            objc_copyWeak(&v51, (id *)buf);
                            dispatch_source_set_cancel_handler(v41, v50);
                            dispatch_resume(*((dispatch_object_t *)v4 + 14));
                            objc_destroyWeak(&v51);
                            objc_destroyWeak(&v53);
                            objc_destroyWeak((id *)buf);
                            uint64_t v42 = os_transaction_create();
                            uint64_t v43 = (void *)*((void *)v4 + 4);
                            *((void *)v4 + 4) = v42;

                            uint64_t v44 = *((void *)v4 + 11);
                            uint64_t v59 = *((void *)v4 + 5);
                            uint64_t v60 = v44;
                            sub_1000015C8(@"com.apple.heartbeatd.host.attached", (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1]);
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              v58 = v4;
                              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initialized host watcher: %{public}@", buf, 0xCu);
                            }

                            char v8 = 1;
                            goto LABEL_47;
                          }
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)v54 = 0;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create timer.", v54, 2u);
                          }
                          objc_destroyWeak((id *)buf);
                          goto LABEL_71;
                        }
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          v49 = "Failed to create ping semaphore.";
                          goto LABEL_67;
                        }
                      }
                      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v49 = "Failed to allocate queue.";
LABEL_67:
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
                      }
LABEL_71:

                      goto LABEL_46;
                    }
                    char v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_47;
                    }
                    *(_WORD *)buf = 0;
                    IOReturn v9 = "Failed to create string.";
                  }
                  else
                  {
                    char v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_47;
                    }
                    *(_WORD *)buf = 0;
                    IOReturn v9 = "Failed to register for system power notifications.";
                  }
                }
                else
                {
                  char v8 = 0;
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_47;
                  }
                  *(_WORD *)buf = 0;
                  IOReturn v9 = "Failed to create string.";
                }
              }
              else
              {
                char v8 = 0;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_47;
                }
                *(_WORD *)buf = 0;
                IOReturn v9 = "Failed to get _peerName from socket.";
              }
            }
            else
            {
              char v8 = 0;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_47;
              }
              *(_WORD *)buf = 0;
              IOReturn v9 = "Failed setting _sock options";
            }
          }
          else
          {
            char v8 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_47;
            }
            *(_WORD *)buf = 0;
            IOReturn v9 = "Failed to create set.";
          }
        }
        else
        {
          char v8 = 0;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          *(_WORD *)buf = 0;
          IOReturn v9 = "Failed to create set.";
        }
      }
    }
    else
    {
      char v8 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      IOReturn v9 = "Checkin info did not contain host ID.";
    }
    uint32_t v10 = 2;
    goto LABEL_45;
  }
  int v7 = v6;
  char v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = v7;
    IOReturn v9 = "Failed to checkin: %d";
    uint32_t v10 = 8;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_46:
    char v8 = 0;
  }
LABEL_47:

LABEL_48:
  if (theDict) {
    CFRelease(theDict);
  }
  CFDictionaryRef theDict = 0;
  if (v4) {
    char v45 = v8;
  }
  else {
    char v45 = 1;
  }
  if ((v45 & 1) == 0)
  {
    if (v4[4])
    {
      IOReturn v46 = IODeregisterForSystemPower(v4 + 5);
      if (v46)
      {
        IOReturn v47 = v46;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v58) = v47;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", buf, 8u);
        }
      }
      IONotificationPortDestroy(*((IONotificationPortRef *)v4 + 15));
      IOServiceClose(v4[4]);
      *((void *)v4 + 15) = 0;
      *((void *)v4 + 2) = 0;
    }
    if (*((void *)v4 + 8))
    {
      lockdown_disconnect();
      *((void *)v4 + 8) = 0;
    }

    return 0;
  }
  return (HostWatcher *)v4;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    IOReturn v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deallocating host watcher: %{public}@", buf, 0xCu);
  }
  id v3 = [(HostWatcher *)self watchedServices];
  [v3 enumerateObjectsUsingBlock:&stru_10000C780];

  if (self->_ldConn) {
    lockdown_disconnect();
  }
  if (self->_powerConn)
  {
    IOReturn v4 = IODeregisterForSystemPower(&self->_powerNotifier);
    if (v4)
    {
      IOReturn v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v9) = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", buf, 8u);
      }
    }
    IONotificationPortDestroy(self->_powerPort);
    IOServiceClose(self->_powerConn);
  }
  powerDownTimer = self->_powerDownTimer;
  if (powerDownTimer) {
    dispatch_source_cancel((dispatch_source_t)powerDownTimer);
  }
  v7.receiver = self;
  v7.super_class = (Class)HostWatcher;
  [(HostWatcher *)&v7 dealloc];
}

- (void)powerLogForService:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (!v6 || !v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v21 = "Invalid argument(s).";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_14;
  }
  id v9 = objc_alloc((Class)NSMutableDictionary);
  v23[0] = @"HostName";
  uint32_t v10 = [(HostWatcher *)self hostName];
  v24[0] = v10;
  v23[1] = @"HostClient";
  uint64_t v11 = [v6 hostClient];
  v24[1] = v11;
  v23[2] = @"Service";
  BOOL v12 = [v6 serviceName];
  v24[2] = v12;
  v23[3] = @"ServiceInstanceID";
  uint64_t v13 = [v6 serviceInstanceID];
  uint64_t v14 = [v13 UUIDString];
  v23[4] = @"Transport";
  v24[3] = v14;
  void v24[4] = @"network";
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  id v16 = [v9 initWithDictionary:v15];

  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v21 = "Failed to create dictionary.";
    goto LABEL_13;
  }
  if ([v8 isEqual:@"com.apple.mobile.heartbeat.ServiceStop"])
  {
    TMGetKernelMonotonicClock();
    if (v17 <= 0.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query monotonic clock time.", v22, 2u);
      }
      goto LABEL_8;
    }
    double v18 = v17;
    [v6 serviceStartTime];
    id v20 = +[NSNumber numberWithDouble:v18 - v19];
    [v16 setObject:v20 forKeyedSubscript:@"DurationSeconds"];
  }
  PLLogRegisteredEvent();
LABEL_8:

LABEL_14:
}

- (void)addService:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    [(HostWatcher *)self powerLogForService:v5 event:@"com.apple.mobile.heartbeat.ServiceStart"];
    IOReturn v4 = [(HostWatcher *)self watchedServices];
    [v4 addObject:v5];
  }
}

- (void)removeService:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    [(HostWatcher *)self powerLogForService:v5 event:@"com.apple.mobile.heartbeat.ServiceStop"];
    IOReturn v4 = [(HostWatcher *)self watchedServices];
    [v4 removeObject:v5];
  }
}

- (void)enumerateServices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  id v5 = [(HostWatcher *)self watchedServices];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005634;
  v7[3] = &unk_10000C7A8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (NSString)hostID
{
  return self->_hostID;
}

- (void)setHostID:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (NSString)peerName
{
  return self->_peerName;
}

- (void)setPeerName:(id)a3
{
}

- (_lockdown_connection)ldConn
{
  return self->_ldConn;
}

- (void)setLdConn:(_lockdown_connection *)a3
{
  self->_ldConn = a3;
}

- (NSMutableSet)watchedServices
{
  return self->_watchedServices;
}

- (void)setWatchedServices:(id)a3
{
}

- (NSMutableArray)servicesAwaitingClose
{
  return self->_servicesAwaitingClose;
}

- (void)setServicesAwaitingClose:(id)a3
{
}

- (NSString)descriptionOverride
{
  return self->_descriptionOverride;
}

- (void)setDescriptionOverride:(id)a3
{
}

- (OS_dispatch_queue)pingQueue
{
  return self->_pingQueue;
}

- (void)setPingQueue:(id)a3
{
}

- (OS_dispatch_semaphore)pingSem
{
  return self->_pingSem;
}

- (void)setPingSem:(id)a3
{
}

- (OS_dispatch_source)powerDownTimer
{
  return self->_powerDownTimer;
}

- (void)setPowerDownTimer:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)aboutToSleep
{
  return self->_aboutToSleep;
}

- (void)setAboutToSleep:(BOOL)a3
{
  self->_aboutToSleep = a3;
}

- (BOOL)sleepTimerEnabled
{
  return self->_sleepTimerEnabled;
}

- (void)setSleepTimerEnabled:(BOOL)a3
{
  self->_sleepTimerEnabled = a3;
}

- (IONotificationPort)powerPort
{
  return self->_powerPort;
}

- (void)setPowerPort:(IONotificationPort *)a3
{
  self->_powerPort = a3;
}

- (unsigned)powerConn
{
  return self->_powerConn;
}

- (void)setPowerConn:(unsigned int)a3
{
  self->_powerConn = a3;
}

- (unsigned)powerNotifier
{
  return self->_powerNotifier;
}

- (void)setPowerNotifier:(unsigned int)a3
{
  self->_powerNotifier = a3;
}

- (int)sock
{
  return self->_sock;
}

- (void)setSock:(int)a3
{
  self->_sock = a3;
}

- (BOOL)lockdownSockConfirmedClosed
{
  return self->_lockdownSockConfirmedClosed;
}

- (void)setLockdownSockConfirmedClosed:(BOOL)a3
{
  self->_lockdownSockConfirmedClosed = a3;
}

- (SSLContext)sslCtx
{
  return self->_sslCtx;
}

- (void)setSslCtx:(SSLContext *)a3
{
  self->_sslCtx = a3;
}

- (id)sleepHandler
{
  return self->_sleepHandler;
}

- (void)setSleepHandler:(id)a3
{
}

- (BOOL)systemSleepNotificationProcessed
{
  return self->_systemSleepNotificationProcessed;
}

- (void)setSystemSleepNotificationProcessed:(BOOL)a3
{
  self->_systemSleepNotificationProcessed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sleepHandler, 0);
  objc_storeStrong((id *)&self->_powerDownTimer, 0);
  objc_storeStrong((id *)&self->_pingSem, 0);
  objc_storeStrong((id *)&self->_pingQueue, 0);
  objc_storeStrong((id *)&self->_descriptionOverride, 0);
  objc_storeStrong((id *)&self->_servicesAwaitingClose, 0);
  objc_storeStrong((id *)&self->_watchedServices, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_hostID, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end