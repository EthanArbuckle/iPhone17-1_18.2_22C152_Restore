@interface LTSStatsManager
+ (id)sharedLTSStatsManager;
- (LTSStatsManager)init;
- (NSDictionary)prevStatsSinceBoot;
- (OS_dispatch_queue)queue;
- (__CFDictionary)subscribedChannels;
- (__IOReportSubscriptionCF)subscription;
- (id)getLifetimeStats;
- (id)getStatsSinceBoot;
- (int)updateLifetimeStatsForChannel:(__CFDictionary *)a3;
- (void)dealloc;
- (void)setPrevStatsSinceBoot:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscribedChannels:(__CFDictionary *)a3;
- (void)setSubscription:(__IOReportSubscriptionCF *)a3;
- (void)updateLifetimeStats;
- (void)updateLifetimeStatsGated;
@end

@implementation LTSStatsManager

+ (id)sharedLTSStatsManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009410;
  block[3] = &unk_100010698;
  block[4] = a1;
  if (qword_100014B48 != -1) {
    dispatch_once(&qword_100014B48, block);
  }
  v2 = (void *)qword_100014B40;

  return v2;
}

- (LTSStatsManager)init
{
  CFTypeRef cf = 0;
  os_log_t v3 = os_log_create("com.apple.powerdatad", "LTSStats");
  v4 = off_100014B00;
  off_100014B00 = v3;

  v21.receiver = self;
  v21.super_class = (Class)LTSStatsManager;
  v5 = [(LTSStatsManager *)&v21 init];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B17C();
    }
    CFMutableDictionaryRef v6 = 0;
    goto LABEL_22;
  }
  CFMutableDictionaryRef v6 = IOServiceNameMatching("RTBuddyIOReportingEndpoint");
  uint64_t v7 = IOReportCopyChannelsForDrivers();
  if (!v7)
  {
    v15 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (const char *)cf;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "IOReportCopyChannelsForDrivers error: %{public}@", buf, 0xCu);
    }
LABEL_22:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = (const void *)v7;
  if (!IOReportGetChannelCount())
  {
    v16 = off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    v24 = "RTBuddyIOReportingEndpoint";
    v17 = "No channels found for service %s";
    v18 = v16;
    uint32_t v19 = 12;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    goto LABEL_7;
  }
  IOReportPrune();
  if (!IOReportGetChannelCount())
  {
    v20 = off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    v24 = "PMP";
    __int16 v25 = 2080;
    v26 = "Volt-Temp HM";
    v17 = "No channels found for group '%s' subgroup '%s'";
    v18 = v20;
    uint32_t v19 = 22;
    goto LABEL_27;
  }
  uint64_t Subscription = IOReportCreateSubscription();
  v5->_subscription = (__IOReportSubscriptionCF *)Subscription;
  if (Subscription)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.powerdatad.ltsqueue", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B1B0();
  }
LABEL_7:
  if (cf) {
    CFRelease(cf);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5->_queue) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  os_log_t v3 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc call\n", buf, 2u);
  }
  subscription = self->_subscription;
  if (subscription) {
    CFRelease(subscription);
  }
  subscribedChannels = self->_subscribedChannels;
  if (subscribedChannels) {
    CFRelease(subscribedChannels);
  }
  v6.receiver = self;
  v6.super_class = (Class)LTSStatsManager;
  [(LTSStatsManager *)&v6 dealloc];
}

- (id)getStatsSinceBoot
{
  if (self->_subscription)
  {
    Samples = (void *)IOReportCreateSamples();
    if (Samples) {
      goto LABEL_3;
    }
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B24C();
    }
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B218();
  }
  Samples = 0;
LABEL_3:

  return Samples;
}

- (int)updateLifetimeStatsForChannel:(__CFDictionary *)a3
{
  uint64_t ChannelName = IOReportChannelGetChannelName();
  if (ChannelName)
  {
    uint64_t v4 = ChannelName;
    uint64_t ChannelID = IOReportChannelGetChannelID();
    id v6 = [[LTSStatsStore alloc] initForChannel:v4];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v27 = ChannelID;
      v8 = [v6 getLifetimeStatsForVersion:ChannelID];
      int Count = IOReportStateGetCount();
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
        sub_10000B350();
      }
      v26 = (void *)v4;
      if (Count < 1)
      {
        v12 = 0;
      }
      else
      {
        int v11 = 0;
        v12 = 0;
        *(void *)&long long v10 = 138412546;
        long long v25 = v10;
        do
        {
          v13 = v12;
          v12 = IOReportStateGetNameForIndex();

          uint64_t v14 = IOReportStateGetInTransitions();
          v15 = off_100014B00;
          if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
          {
            v20 = v15;
            objc_super v21 = [v8 objectForKeyedSubscript:v12];
            *(_DWORD *)buf = 138412802;
            v29 = v12;
            __int16 v30 = 2048;
            uint64_t v31 = v14;
            __int16 v32 = 2112;
            v33 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Incremented count for state %@ by %lld. Previous value: %@\n", buf, 0x20u);
          }
          v16 = [v8 objectForKeyedSubscript:v12, v25];

          if (v16)
          {
            v17 = [v8 objectForKeyedSubscript:v12];
            v14 += (uint64_t)[v17 unsignedLongValue];
          }
          else
          {
            v18 = off_100014B00;
            if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              v29 = v12;
              __int16 v30 = 2048;
              uint64_t v31 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Added new state %@ to lifetime stats with count %lld", buf, 0x16u);
            }
          }
          uint32_t v19 = +[NSNumber numberWithUnsignedLong:v14];
          [v8 setObject:v19 forKeyedSubscript:v12];

          ++v11;
        }
        while (Count != v11);
      }
      [v7 saveLifetimeStats:v8 forVersion:v27];
      v22 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v26;
        __int16 v30 = 1024;
        LODWORD(v31) = Count;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Updated Channel name: %{public}@ Num States: %d", buf, 0x12u);
      }

      return 0;
    }
    else
    {
      int v23 = 16;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000B2E8();
      }
    }
  }
  else
  {
    int v23 = 16;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B2B4();
    }
  }
  return v23;
}

- (void)updateLifetimeStatsGated
{
  v12[4] = self;
  CFTypeRef cf = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009E24;
  v12[3] = &unk_100010728;
  os_log_t v3 = objc_retainBlock(v12);
  uint64_t v4 = [(LTSStatsManager *)self getStatsSinceBoot];
  if (v4)
  {
    prevStatsSinceBoot = self->_prevStatsSinceBoot;
    p_prevStatsSinceBoot = (id *)&self->_prevStatsSinceBoot;
    if (!prevStatsSinceBoot)
    {
      uint64_t v7 = +[LTSStatsStore getPrevStatsSinceBoot];
      id v8 = *p_prevStatsSinceBoot;
      id *p_prevStatsSinceBoot = (id)v7;

      if (!*p_prevStatsSinceBoot)
      {
        id SamplesDelta = v4;
        long long v10 = off_100014B00;
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No Previously saved stats since boot\n", v11, 2u);
        }
        goto LABEL_5;
      }
    }
    id SamplesDelta = (id)IOReportCreateSamplesDelta();
    if (SamplesDelta)
    {
LABEL_5:
      IOReportIterate();
      +[LTSStatsStore saveStatsSinceBoot:v4];
      objc_storeStrong(p_prevStatsSinceBoot, v4);
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B3EC();
    }
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B3B8();
  }
  id SamplesDelta = 0;
LABEL_6:
  if (cf) {
    CFRelease(cf);
  }
}

- (void)updateLifetimeStats
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009EA4;
  block[3] = &unk_100010750;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)getLifetimeStats
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100009FC4;
  long long v10 = sub_100009FD4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009FDC;
  v5[3] = &unk_100010778;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
    sub_10000B454();
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDictionary)prevStatsSinceBoot
{
  return self->_prevStatsSinceBoot;
}

- (void)setPrevStatsSinceBoot:(id)a3
{
}

- (__CFDictionary)subscribedChannels
{
  return self->_subscribedChannels;
}

- (void)setSubscribedChannels:(__CFDictionary *)a3
{
  self->_subscribedChannels = a3;
}

- (__IOReportSubscriptionCF)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(__IOReportSubscriptionCF *)a3
{
  self->_subscription = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_prevStatsSinceBoot, 0);
}

@end