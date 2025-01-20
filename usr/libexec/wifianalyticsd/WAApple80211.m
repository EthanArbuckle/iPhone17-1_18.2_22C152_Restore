@interface WAApple80211
- (BOOL)currentChannelInfo:(apple80211_channel *)a3;
- (BOOL)everAssociated;
- (BOOL)grabAndSubmitFWTrapInfo;
- (BOOL)grabAndSubmitLqmMetrics;
- (BOOL)hasAWDLInterfaceListed;
- (BOOL)hasIRInterfaceListed;
- (BOOL)hasNANInterfaceListed;
- (BOOL)hasSoftAPInterfaceListed;
- (BOOL)isAXAssociatoin;
- (BOOL)isAssociated;
- (BOOL)triggerDpsReset:(id)a3;
- (BOOL)triggerFastDpsReset;
- (BOOL)triggerReassociation:(id)a3;
- (NSDate)lastDateBSSIDQueried;
- (NSDate)lastDateChannelQueried;
- (NSString)ifName;
- (WAApple80211)init;
- (WAApple80211)initWithInterfaceName:(id)a3;
- (WADeviceDBDelegate)dbDelegate;
- (WAMessage)dummyWAMessage;
- (_Apple80211)apple80211Ref;
- (id)currentBSSIDandSSID;
- (id)getChipSet;
- (id)getIOReportLegendItemsMatching:(id *)a3 retErr:(char *)a4;
- (id)getIOReportingClassPath;
- (id)getIOReportingDriverName;
- (id)initByFindingInterfaceName;
- (int)currentPHYMode;
- (int64_t)getDriverType;
- (unint64_t)getIOReportingDriverID;
- (unint64_t)getPhyMode;
- (unsigned)getIOReportingService;
- (void)_storeAttemptedRecovery:(id)a3 reason:(id)a4 fromSSID:(id)a5 fromBSSID:(id)a6 commandResult:(int)a7;
- (void)dealloc;
- (void)setApple80211Ref:(_Apple80211 *)a3;
- (void)setDbDelegate:(id)a3;
- (void)setDummyWAMessage:(id)a3;
- (void)setIfName:(id)a3;
- (void)setLastDateBSSIDQueried:(id)a3;
- (void)setLastDateChannelQueried:(id)a3;
- (void)submitLqmMetrics:(id)a3;
@end

@implementation WAApple80211

- (WAApple80211)init
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Please use the init defined in the header for this class" userInfo:0];
  objc_exception_throw(v2);
}

- (id)initByFindingInterfaceName
{
  id obj = 0;
  CFArrayRef theArray = 0;
  v27.receiver = self;
  v27.super_class = (Class)WAApple80211;
  id v2 = [(WAApple80211 *)&v27 init];
  if (!v2)
  {
    int IfListCopy = 0;
LABEL_30:
    v25 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)&v31[10] = 124;
      __int16 v32 = 1024;
      LODWORD(v33) = IfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to init WAApple80211 err is: %d", buf, 0x18u);
    }

    v26 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v31 = IfListCopy;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = obj;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to init WAApple80211 err is: %d, interface %@", buf, 0x12u);
    }

    v13 = 0;
    if (obj) {
      CFRelease(obj);
    }
    dummyWAMessage = v2;
    id v2 = 0;
    goto LABEL_11;
  }
  int IfListCopy = Apple80211Open();
  if (IfListCopy)
  {
    v19 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 78;
    __int16 v32 = 1024;
    LODWORD(v33) = IfListCopy;
    v20 = "%{public}s::%d:Apple80211Open failed with: %d";
    goto LABEL_20;
  }
  int IfListCopy = Apple80211GetIfListCopy();
  if (IfListCopy)
  {
    v19 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 81;
    __int16 v32 = 1024;
    LODWORD(v33) = IfListCopy;
    v20 = "%{public}s::%d:Apple80211GetIfListCopy failed with: %d";
LABEL_20:
    v21 = v19;
    uint32_t v22 = 24;
    goto LABEL_28;
  }
  if (!CFArrayGetCount(theArray))
  {
    v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)&v31[10] = 83;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetIfListCopy returned 0 interfaces", buf, 0x12u);
    }
    int IfListCopy = 0;
    goto LABEL_29;
  }
  ValueAtIndex = (NSString *)CFArrayGetValueAtIndex(theArray, 0);
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 87;
    __int16 v32 = 2112;
    v33 = ValueAtIndex;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found WiFi interface %@\n", buf, 0x1Cu);
  }

  p_ifName = &v2->_ifName;
  objc_storeStrong((id *)&v2->_ifName, ValueAtIndex);
  int IfListCopy = Apple80211BindToInterface();
  if (IfListCopy)
  {
    v19 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v23 = *p_ifName;
    uint64_t v24 = Apple80211ErrToStr();
    *(_DWORD *)buf = 136447234;
    *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 93;
    __int16 v32 = 2112;
    v33 = v23;
    __int16 v34 = 1024;
    int v35 = IfListCopy;
    __int16 v36 = 2080;
    uint64_t v37 = v24;
    v20 = "%{public}s::%d:Apple80211BindToInterface (for interface with name: %@) failed with: %d - %s";
    v21 = v19;
    uint32_t v22 = 44;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    goto LABEL_29;
  }
  int IfListCopy = Apple80211GetInterfaceNameCopy();
  objc_storeStrong((id *)&v2->_ifName, obj);
  if (!*p_ifName)
  {
    v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v31 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)&v31[10] = 100;
      v20 = "%{public}s::%d:No interface name to use with Apple80211";
      v21 = v19;
      uint32_t v22 = 18;
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v7 = +[NSDate distantPast];
  lastDateChannelQueried = v2->_lastDateChannelQueried;
  v2->_lastDateChannelQueried = (NSDate *)v7;

  dword_1000F0FD8 = 0;
  qword_1000F0FD0 = 0;
  uint64_t v9 = +[NSDate distantPast];
  lastDateBSSIDQueried = v2->_lastDateBSSIDQueried;
  v2->_lastDateBSSIDQueried = (NSDate *)v9;

  v11 = (void *)qword_1000F0FB0;
  qword_1000F0FB0 = @"00:00:00:00:00:00";

  v12 = (void *)qword_1000F0FB8;
  qword_1000F0FB8 = @"Uninit lastSSID";

  v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.wifi.recoveryMO.queue", v13);
  analyticsMOCQueue = v2->analyticsMOCQueue;
  v2->analyticsMOCQueue = (OS_dispatch_queue *)v14;

  byte_1000F0FA8 = 0;
  if (v2->_dummyWAMessage) {
    goto LABEL_12;
  }
  v16 = (WAMessage *)objc_alloc_init((Class)WAMessage);
  dummyWAMessage = v2->_dummyWAMessage;
  v2->_dummyWAMessage = v16;
LABEL_11:

LABEL_12:
  if (theArray) {
    CFRelease(theArray);
  }

  return v2;
}

- (WAApple80211)initWithInterfaceName:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WAApple80211;
  v6 = [(WAApple80211 *)&v30 init];
  uint64_t v7 = v6;
  if (!v6)
  {
    int v9 = 0;
LABEL_19:
    v28 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)__int16 v32 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = 182;
      __int16 v33 = 1024;
      LODWORD(v34) = v9;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to init WAApple80211 err is: %d", buf, 0x18u);
    }

    v29 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v32 = v9;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to init WAApple80211 err is: %d, interface %@", buf, 0x12u);
    }

    v16 = 0;
    dummyWAMessage = v7;
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  p_ifName = &v6->_ifName;
  objc_storeStrong((id *)&v6->_ifName, a3);
  if (!*p_ifName)
  {
    uint32_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)__int16 v32 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = 151;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:No interface name to use with Apple80211", buf, 0x12u);
    }
    int v9 = 0;
    goto LABEL_18;
  }
  int v9 = Apple80211Open();
  if (v9)
  {
    uint32_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)__int16 v32 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = 154;
      __int16 v33 = 1024;
      LODWORD(v34) = v9;
      v23 = "%{public}s::%d:Apple80211Open failed with: %d";
      uint64_t v24 = v22;
      uint32_t v25 = 24;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    }
LABEL_18:

    goto LABEL_19;
  }
  int v9 = Apple80211BindToInterface();
  if (v9)
  {
    uint32_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = *p_ifName;
      uint64_t v27 = Apple80211ErrToStr();
      *(_DWORD *)buf = 136447234;
      *(void *)__int16 v32 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = 157;
      __int16 v33 = 2112;
      __int16 v34 = v26;
      __int16 v35 = 1024;
      int v36 = v9;
      __int16 v37 = 2080;
      uint64_t v38 = v27;
      v23 = "%{public}s::%d:Apple80211BindToInterface (for interface with name: %@) failed with: %d - %s";
      uint64_t v24 = v22;
      uint32_t v25 = 44;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v10 = +[NSDate distantPast];
  lastDateChannelQueried = v7->_lastDateChannelQueried;
  v7->_lastDateChannelQueried = (NSDate *)v10;

  dword_1000F0FD8 = 0;
  qword_1000F0FD0 = 0;
  uint64_t v12 = +[NSDate distantPast];
  lastDateBSSIDQueried = v7->_lastDateBSSIDQueried;
  v7->_lastDateBSSIDQueried = (NSDate *)v12;

  dispatch_queue_t v14 = (void *)qword_1000F0FB0;
  qword_1000F0FB0 = @"00:00:00:00:00:00";

  v15 = (void *)qword_1000F0FB8;
  qword_1000F0FB8 = @"Uninit lastSSID";

  v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.wifi.recoveryMO.queue", v16);
  analyticsMOCQueue = v7->analyticsMOCQueue;
  v7->analyticsMOCQueue = (OS_dispatch_queue *)v17;

  byte_1000F0FA8 = 0;
  if (!v7->_dummyWAMessage)
  {
    v19 = (WAMessage *)objc_alloc_init((Class)WAMessage);
    dummyWAMessage = v7->_dummyWAMessage;
    v7->_dummyWAMessage = v19;
LABEL_7:
  }
  return v7;
}

- (void)dealloc
{
  if ([(WAApple80211 *)self apple80211Ref]) {
    Apple80211Close();
  }
  v3.receiver = self;
  v3.super_class = (Class)WAApple80211;
  [(WAApple80211 *)&v3 dealloc];
}

- (BOOL)hasSoftAPInterfaceListed
{
  Virtualint IfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[WAApple80211 hasSoftAPInterfaceListed]";
      __int16 v17 = 1024;
      int v18 = 204;
      __int16 v19 = 1024;
      int v20 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = 0;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"ap"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
  }
  return v4 & 1;
}

- (BOOL)hasNANInterfaceListed
{
  Virtualint IfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[WAApple80211 hasNANInterfaceListed]";
      __int16 v17 = 1024;
      int v18 = 229;
      __int16 v19 = 1024;
      int v20 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = 0;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"nan"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
  }
  return v4 & 1;
}

- (BOOL)hasIRInterfaceListed
{
  Virtualint IfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[WAApple80211 hasIRInterfaceListed]";
      __int16 v17 = 1024;
      int v18 = 254;
      __int16 v19 = 1024;
      int v20 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = 0;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"ir"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
  }
  return v4 & 1;
}

- (BOOL)hasAWDLInterfaceListed
{
  Virtualint IfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[WAApple80211 hasAWDLInterfaceListed]";
      __int16 v17 = 1024;
      int v18 = 279;
      __int16 v19 = 1024;
      int v20 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = 0;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"awdl"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
  }
  return v4 & 1;
}

- (int)currentPHYMode
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v5 = Apple80211Get();
    int v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905) {
        break;
      }
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_12;
    }
    if (!--v4) {
      break;
    }
    usleep(0x7A120u);
  }
  if (!v5)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"PHYMODE_ACTIVE"];
    int v8 = [v7 intValue];
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136446722;
    long long v12 = "-[WAApple80211 currentPHYMode]";
    __int16 v13 = 1024;
    int v14 = 305;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Get(APPLE80211_IOC_PHY_MODE) failed: %d", (uint8_t *)&v11, 0x18u);
  }

  uint64_t v7 = 0;
  int v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)grabAndSubmitFWTrapInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(WAApple80211 *)self apple80211Ref])
  {
    int v4 = 7;
    while (1)
    {
      [(WAApple80211 *)self apple80211Ref];
      int v5 = Apple80211Get();
      int v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905) {
          break;
        }
      }
      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_22;
      }
      if (!--v4) {
        break;
      }
      usleep(0x7A120u);
    }
    if (v5)
    {
LABEL_22:
      __int16 v17 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      int v28 = 136446722;
      v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v30 = 1024;
      int v31 = 322;
      __int16 v32 = 1024;
      LODWORD(v33) = v6;
      uint64_t v24 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_TRAP_CRASHTRACER_MINI_DUMP) failed: %d";
      uint32_t v25 = v17;
      uint32_t v26 = 24;
      goto LABEL_24;
    }
    uint64_t v7 = [v3 objectForKeyedSubscript:&off_1000E4000];
    int v8 = v7;
    if (v7)
    {
      int v9 = v7;
      uint64_t v10 = (const char *)[v9 bytes];
      [v9 length];
      CCSubmitLogToCrashTracer(v10);
      int v11 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        int v16 = [v3 objectForKeyedSubscript:&off_1000E4018];
        __int16 v17 = v16;
        if (v8)
        {
          int v18 = v16;
          id v19 = [v18 bytes];
          [v18 length];
          CCSubmitBinaryToCrashTracer((uint64_t)v19);
          int v20 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [v18 length];
            int v28 = 136446978;
            v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
            __int16 v30 = 1024;
            int v31 = 334;
            __int16 v32 = 2048;
            id v33 = v21;
            __int16 v34 = 2112;
            __int16 v35 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Did pass binary readable to CCSubmitBinaryToCrashTracer() of length(%ld): %@", (uint8_t *)&v28, 0x26u);
          }

          BOOL v22 = 1;
          __int16 v17 = v8;
          goto LABEL_19;
        }
        uint64_t v27 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v28 = 136446466;
          v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
          __int16 v30 = 1024;
          int v31 = 332;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:No bainry tag represented in dictionary, skipping.", (uint8_t *)&v28, 0x12u);
        }

        goto LABEL_30;
      }
      int v28 = 136446978;
      v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v30 = 1024;
      int v31 = 328;
      __int16 v32 = 2048;
      id v33 = [v9 length];
      __int16 v34 = 2112;
      __int16 v35 = v9;
      long long v12 = "%{public}s::%d:Did pass human readable to CCSubmitLogToCrashTracer() of length(%ld): %@";
      __int16 v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 38;
    }
    else
    {
      int v11 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v28 = 136446466;
      v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v30 = 1024;
      int v31 = 326;
      long long v12 = "%{public}s::%d:No human readable tag represented in dictionary, skipping.";
      __int16 v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 18;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v28, v15);
    goto LABEL_15;
  }
  __int16 v17 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v28 = 136446466;
    v29 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
    __int16 v30 = 1024;
    int v31 = 319;
    uint64_t v24 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
    uint32_t v25 = v17;
    uint32_t v26 = 18;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v28, v26);
  }
LABEL_30:
  BOOL v22 = 0;
LABEL_19:

  return v22;
}

- (BOOL)grabAndSubmitLqmMetrics
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(WAApple80211 *)self apple80211Ref])
  {
    int v4 = 7;
    while (1)
    {
      [(WAApple80211 *)self apple80211Ref];
      int v5 = Apple80211Get();
      int v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905) {
          break;
        }
      }
      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_18;
      }
      if (!--v4) {
        break;
      }
      usleep(0x7A120u);
    }
    if (v5)
    {
LABEL_18:
      int v8 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v16 = 136446722;
      __int16 v17 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
      __int16 v18 = 1024;
      int v19 = 350;
      __int16 v20 = 1024;
      LODWORD(v21) = v6;
      __int16 v13 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_LQM_METRICS_CRASHTRACER_DATA) failed: %d";
      os_log_type_t v14 = v8;
      uint32_t v15 = 24;
      goto LABEL_23;
    }
    uint64_t v7 = [v3 objectForKeyedSubscript:&off_1000E4030];
    if (v7)
    {
      int v8 = v7;
      id v9 = [v8 bytes];
      [v8 length];
      CCSubmitLqmMetricsTLVBlockToCrashTracer((uint64_t)v9);
      uint64_t v10 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136446978;
        __int16 v17 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
        __int16 v18 = 1024;
        int v19 = 355;
        __int16 v20 = 2048;
        id v21 = [v8 length];
        __int16 v22 = 2112;
        v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@", (uint8_t *)&v16, 0x26u);
      }

      BOOL v11 = 1;
      goto LABEL_15;
    }
    int v8 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v16 = 136446466;
    __int16 v17 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    __int16 v18 = 1024;
    int v19 = 353;
    __int16 v13 = "%{public}s::%d:No LQM bainry tag represented in dictionary, skipping.";
  }
  else
  {
    int v8 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v16 = 136446466;
    __int16 v17 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    __int16 v18 = 1024;
    int v19 = 347;
    __int16 v13 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
  }
  os_log_type_t v14 = v8;
  uint32_t v15 = 18;
LABEL_23:
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, v15);
LABEL_24:
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)submitLqmMetrics:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bytes];
  [v3 length];
  CCSubmitLqmMetricsTLVBlockToCrashTracer((uint64_t)v4);
  int v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446978;
    uint64_t v7 = "-[WAApple80211 submitLqmMetrics:]";
    __int16 v8 = 1024;
    int v9 = 365;
    __int16 v10 = 2048;
    id v11 = [v3 length];
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@", (uint8_t *)&v6, 0x26u);
  }
}

- (void)_storeAttemptedRecovery:(id)a3 reason:(id)a4 fromSSID:(id)a5 fromBSSID:(id)a6 commandResult:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v22 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v28 = *((void *)&WADeviceAnalyticsRecoveryInfo + 1);
  int v16 = +[NSDate date];
  long long v29 = *((_OWORD *)&WADeviceAnalyticsRecoveryInfo + 2);
  v31[0] = v16;
  v31[1] = v22;
  v31[2] = v12;
  uint64_t v30 = *((void *)&WADeviceAnalyticsRecoveryInfo + 6);
  __int16 v17 = +[NSNumber numberWithInt:v7];
  v31[3] = v17;
  __int16 v18 = +[NSDictionary dictionaryWithObjects:v31 forKeys:&v28 count:4];
  [v15 addEntriesFromDictionary:v18];

  if (v14)
  {
    uint64_t v26 = *((void *)&WADeviceAnalyticsRecoveryInfo + 2);
    id v27 = v14;
    int v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v15 addEntriesFromDictionary:v19];
  }
  if (v13)
  {
    uint64_t v24 = *((void *)&WADeviceAnalyticsRecoveryInfo + 3);
    id v25 = v13;
    __int16 v20 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v15 addEntriesFromDictionary:v20];
  }
  id v21 = [(WAApple80211 *)self dbDelegate];
  [v21 processMetricDictOffEngine:WADeviceAnalyticsRecoveryInfo data:v15];
}

- (BOOL)triggerFastDpsReset
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_10002ECF0;
  id v33 = sub_10002ED00;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10002ECF0;
  id v27 = sub_10002ED00;
  id v28 = 0;
  if ([(WAApple80211 *)self isAssociated])
  {
    id v4 = [(WAApple80211 *)self currentBSSIDandSSID];
    int v5 = v4;
    if (v4)
    {
      int v6 = [v4 objectForKeyedSubscript:@"bssid"];
      BOOL v7 = v6 == 0;

      if (!v7)
      {
        uint64_t v8 = [v5 objectForKeyedSubscript:@"bssid"];
        int v9 = (void *)v30[5];
        v30[5] = v8;
      }
      __int16 v10 = [v5 objectForKeyedSubscript:@"ssid"];
      BOOL v11 = v10 == 0;

      if (!v11)
      {
        uint64_t v12 = [v5 objectForKeyedSubscript:@"ssid"];
        id v13 = (void *)v24[5];
        v24[5] = v12;
      }
    }
  }
  else
  {
    int v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v36 = "-[WAApple80211 triggerFastDpsReset]";
      __int16 v37 = 1024;
      int v38 = 396;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  [v3 setValue:@"DPSQuickTriggeredChipReset" forKeyPath:@"CHIP_RESET_TRIGGER"];
  int v14 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v15 = Apple80211Set();
    int v16 = v15;
    if (v15 != -3905 && v15 != 61 && v15 != 16) {
      break;
    }
    if (!--v14) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v15)
  {
    int v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v36 = "-[WAApple80211 triggerFastDpsReset]";
      __int16 v37 = 1024;
      int v38 = 411;
      __int16 v39 = 1024;
      int v40 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d", buf, 0x18u);
    }

    __int16 v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v16;
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Failed to triggerFastDpsReset err %d", buf, 8u);
    }
  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002ED08;
  v21[3] = &unk_1000D0EA8;
  v21[4] = self;
  v21[5] = &v23;
  v21[6] = &v29;
  int v22 = v16;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, v21);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16 == 0;
}

- (BOOL)triggerDpsReset:(id)a3
{
  id v4 = (char *)a3;
  int v5 = +[NSMutableDictionary dictionary];
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  int v38 = sub_10002ECF0;
  __int16 v39 = sub_10002ED00;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_10002ECF0;
  id v33 = sub_10002ED00;
  id v34 = 0;
  if ([(WAApple80211 *)self isAssociated])
  {
    int v6 = [(WAApple80211 *)self currentBSSIDandSSID];
    BOOL v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"bssid"];
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        uint64_t v10 = [v7 objectForKeyedSubscript:@"bssid"];
        BOOL v11 = (void *)v36[5];
        v36[5] = v10;
      }
      uint64_t v12 = [v7 objectForKeyedSubscript:@"ssid"];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        uint64_t v14 = [v7 objectForKeyedSubscript:@"ssid"];
        int v15 = (void *)v30[5];
        v30[5] = v14;
      }
    }
  }
  else
  {
    BOOL v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[WAApple80211 triggerDpsReset:]";
      __int16 v43 = 1024;
      int v44 = 436;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  [v5 setValue:v4 forKeyPath:@"CHIP_RESET_TRIGGER"];
  int v16 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v17 = Apple80211Set();
    int v18 = v17;
    if (v17 != -3905 && v17 != 61 && v17 != 16) {
      break;
    }
    if (!--v16) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v17)
  {
    int v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v42 = "-[WAApple80211 triggerDpsReset:]";
      __int16 v43 = 1024;
      int v44 = 451;
      __int16 v45 = 1024;
      int v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d", buf, 0x18u);
    }

    uint64_t v23 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v4;
      __int16 v43 = 1024;
      int v44 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to triggerDpsReset: %@, err %d", buf, 0x12u);
    }
  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F1A8;
  block[3] = &unk_1000D0ED0;
  block[4] = self;
  uint64_t v25 = v4;
  uint64_t v26 = &v29;
  id v27 = &v35;
  int v28 = v18;
  __int16 v20 = v4;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, block);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v18 == 0;
}

- (BOOL)triggerReassociation:(id)a3
{
  id v4 = (char *)a3;
  int v5 = +[NSMutableDictionary dictionary];
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  int v38 = sub_10002ECF0;
  __int16 v39 = sub_10002ED00;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_10002ECF0;
  id v33 = sub_10002ED00;
  id v34 = 0;
  if ([(WAApple80211 *)self isAssociated])
  {
    int v6 = [(WAApple80211 *)self currentBSSIDandSSID];
    BOOL v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"bssid"];
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        uint64_t v10 = [v7 objectForKeyedSubscript:@"bssid"];
        BOOL v11 = (void *)v36[5];
        v36[5] = v10;
      }
      uint64_t v12 = [v7 objectForKeyedSubscript:@"ssid"];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        uint64_t v14 = [v7 objectForKeyedSubscript:@"ssid"];
        int v15 = (void *)v30[5];
        v30[5] = v14;
      }
    }
  }
  else
  {
    BOOL v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[WAApple80211 triggerReassociation:]";
      __int16 v43 = 1024;
      int v44 = 475;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  [v5 setValue:v4 forKeyPath:@"REASSOC_CC_TRIGGER"];
  int v16 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v17 = Apple80211Set();
    int v18 = v17;
    if (v17 != -3905 && v17 != 61 && v17 != 16) {
      break;
    }
    if (!--v16) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v17)
  {
    int v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v42 = "-[WAApple80211 triggerReassociation:]";
      __int16 v43 = 1024;
      int v44 = 490;
      __int16 v45 = 1024;
      int v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_REASSOCIATE_WITH_CORECAPTURE) failed: %d", buf, 0x18u);
    }

    uint64_t v23 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v4;
      __int16 v43 = 1024;
      int v44 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to triggerReassociation: %@, err %d", buf, 0x12u);
    }
  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F640;
  block[3] = &unk_1000D0ED0;
  block[4] = self;
  uint64_t v25 = v4;
  uint64_t v26 = &v29;
  id v27 = &v35;
  int v28 = v18;
  __int16 v20 = v4;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, block);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v18 == 0;
}

- (BOOL)currentChannelInfo:(apple80211_channel *)a3
{
  int v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  int v6 = +[NSDate date];
  BOOL v7 = v6;
  if (self->_lastDateChannelQueried)
  {
    [v6 timeIntervalSinceDate:];
    if (v8 <= 2.0)
    {
      uint64_t v14 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 136446466;
        id v21 = "-[WAApple80211 currentChannelInfo:]";
        __int16 v22 = 1024;
        int v23 = 514;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using Cached instead of new query", (uint8_t *)&v20, 0x12u);
      }

      uint64_t v15 = qword_1000F0FD0;
      a3->var2 = dword_1000F0FD8;
      *(void *)&a3->var0 = v15;
LABEL_16:
      BOOL v16 = 1;
      goto LABEL_17;
    }
  }
  objc_storeStrong((id *)&self->_lastDateChannelQueried, v7);
  int v9 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v10 = Apple80211Get();
    if (v10 > 15) {
      break;
    }
    if (v10 != -3905) {
      goto LABEL_11;
    }
LABEL_9:
    if (!--v9)
    {
LABEL_11:
      if (!v10)
      {
        BOOL v11 = [v5 objectForKey:@"CHANNEL"];
        a3->var1 = [v11 unsignedIntValue];

        uint64_t v12 = [v5 objectForKey:@"CHANNEL_FLAGS"];
        a3->var2 = [v12 unsignedIntValue];

        uint64_t v13 = *(void *)&a3->var0;
        dword_1000F0FD8 = a3->var2;
        qword_1000F0FD0 = v13;
        goto LABEL_16;
      }
      goto LABEL_22;
    }
    usleep(0x7A120u);
  }
  if (v10 == 16 || v10 == 61) {
    goto LABEL_9;
  }
  if (v10 == 82)
  {
    int v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446466;
      id v21 = "-[WAApple80211 currentChannelInfo:]";
      __int16 v22 = 1024;
      int v23 = 534;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Failed to call APPLE80211_IOC_CHANNEL due to EPWROFF", (uint8_t *)&v20, 0x12u);
    }
    goto LABEL_24;
  }
LABEL_22:
  int v19 = v10;
  int v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    int v20 = 67109120;
    LODWORD(v21) = v19;
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Failed to currentChannelInfo error %d", (uint8_t *)&v20, 8u);
  }
LABEL_24:

  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (id)currentBSSIDandSSID
{
  id v3 = objc_opt_new();
  id v4 = +[NSMutableString stringWithCapacity:0];
  int v5 = +[NSMutableData dataWithCapacity:32];
  int v6 = +[NSDate date];
  BOOL v7 = v6;
  p_lastDateBSSIDQueried = &self->_lastDateBSSIDQueried;
  if (!self->_lastDateBSSIDQueried || (objc_msgSend(v6, "timeIntervalSinceDate:"), v9 > 2.0))
  {
    objc_storeStrong((id *)&self->_lastDateBSSIDQueried, v7);
    int v10 = 7;
    while (1)
    {
      [(WAApple80211 *)self apple80211Ref];
      int v11 = Apple80211Get();
      int v12 = v11;
      if (v11 <= 15)
      {
        if (v11 != -3905) {
          break;
        }
      }
      else if (v11 != 61 && v11 != 16)
      {
        goto LABEL_41;
      }
      if (!--v10) {
        break;
      }
      usleep(0x7A120u);
    }
    if (!v11)
    {
      if (!v4)
      {
        uint64_t v25 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v29 = 136446722;
          uint64_t v30 = "-[WAApple80211 currentBSSIDandSSID]";
          __int16 v31 = 1024;
          int v32 = 564;
          __int16 v33 = 2112;
          uint64_t v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v29, 0x1Cu);
        }

        uint64_t v26 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          int v29 = 138412290;
          uint64_t v30 = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v29, 0xCu);
        }
LABEL_37:

        id v24 = 0;
        goto LABEL_38;
      }
      uint64_t v13 = +[NSString stringWithString:v4];
      uint64_t v14 = (void *)qword_1000F0FB0;
      qword_1000F0FB0 = v13;

      int v15 = 7;
      while (1)
      {
        [(WAApple80211 *)self apple80211Ref];
        int v16 = Apple80211Get();
        int v12 = v16;
        if (v16 <= 15)
        {
          if (v16 != -3905) {
            break;
          }
        }
        else if (v16 != 61 && v16 != 16)
        {
          goto LABEL_41;
        }
        if (!--v15) {
          break;
        }
        usleep(0x7A120u);
      }
      if (!v16)
      {
        if (v5)
        {
          id v17 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
          int v18 = (void *)qword_1000F0FB8;
          qword_1000F0FB8 = (uint64_t)v17;

          goto LABEL_27;
        }
        id v27 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v29 = 136446466;
          uint64_t v30 = "-[WAApple80211 currentBSSIDandSSID]";
          __int16 v31 = 1024;
          int v32 = 575;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to fetch APPLE80211_IOC_SSID", (uint8_t *)&v29, 0x12u);
        }

        uint64_t v26 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v29) = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to fetch APPLE80211_IOC_SSID", (uint8_t *)&v29, 2u);
        }
        goto LABEL_37;
      }
    }
LABEL_41:
    uint64_t v26 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136446722;
      uint64_t v30 = "-[WAApple80211 currentBSSIDandSSID]";
      __int16 v31 = 1024;
      int v32 = 586;
      __int16 v33 = 1024;
      LODWORD(v34) = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to fetch currentBSSID or SSID with error %d", (uint8_t *)&v29, 0x18u);
    }
    goto LABEL_37;
  }
  int v19 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = qword_1000F0FB0;
    uint64_t v20 = qword_1000F0FB8;
    __int16 v22 = *p_lastDateBSSIDQueried;
    [v7 timeIntervalSinceDate:*p_lastDateBSSIDQueried];
    int v29 = 136447746;
    uint64_t v30 = "-[WAApple80211 currentBSSIDandSSID]";
    __int16 v31 = 1024;
    int v32 = 552;
    __int16 v33 = 2112;
    uint64_t v34 = v21;
    __int16 v35 = 2112;
    uint64_t v36 = v20;
    __int16 v37 = 2112;
    int v38 = v22;
    __int16 v39 = 2112;
    id v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using Cached instead of new query %@,%@ last %@ now %@ diff %f", (uint8_t *)&v29, 0x44u);
  }

LABEL_27:
  [v3 setObject:qword_1000F0FB0 forKeyedSubscript:@"bssid"];
  [v3 setObject:qword_1000F0FB8 forKeyedSubscript:@"ssid"];
  id v24 = v3;
LABEL_38:

  return v24;
}

- (id)getChipSet
{
  uint64_t v23 = +[NSMutableString stringWithCapacity:0];
  int v3 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v4 = Apple80211Get();
    int v5 = v4;
    if (v4 <= 15)
    {
      if (v4 != -3905) {
        break;
      }
    }
    else if (v4 != 61 && v4 != 16)
    {
      goto LABEL_10;
    }
    if (!--v3) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v4)
  {
LABEL_10:
    id obj = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_FAULT, "Failed to get APPLE80211_IOC_HARDWARE_VERSION error %d", buf, 8u);
    }
    int v6 = &stru_1000D3628;
    goto LABEL_32;
  }
  BOOL v7 = +[NSCharacterSet newlineCharacterSet];
  double v8 = [v23 componentsSeparatedByCharactersInSet:v7];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v9)
  {
    uint64_t v25 = &stru_1000D3628;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v13 = +[NSCharacterSet whitespaceCharacterSet];
        uint64_t v14 = [v12 componentsSeparatedByCharactersInSet:v13];

        if ([v12 rangeOfString:@"chipnum"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          int v15 = [v14 objectAtIndex:1];
          int v16 = [v15 substringFromIndex:2];

          unsigned int v26 = 0;
          id v17 = +[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
          if ([(__CFString *)v16 rangeOfCharacterFromSet:v17] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            int v18 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              int v28 = "-[WAApple80211 getChipSet]";
              __int16 v29 = 1024;
              int v30 = 614;
              __int16 v31 = 2112;
              int v32 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Chipset number is %@", buf, 0x1Cu);
            }

            int v19 = v16;
            uint64_t v20 = v25;
          }
          else
          {
            uint64_t v20 = +[NSScanner scannerWithString:v16];
            [v20 scanHexInt:&v26];
            int v19 = +[NSString stringWithFormat:@"%d", v26];
            uint64_t v21 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              int v28 = "-[WAApple80211 getChipSet]";
              __int16 v29 = 1024;
              int v30 = 611;
              __int16 v31 = 2112;
              int v32 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Chipset number is %@", buf, 0x1Cu);
            }
          }
          uint64_t v25 = v19;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v25 = &stru_1000D3628;
  }

  int v6 = v25;
LABEL_32:

  return v6;
}

- (BOOL)everAssociated
{
  int v3 = +[NSMutableString stringWithCapacity:0];
  if (!v3)
  {
    int v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      uint64_t v14 = "-[WAApple80211 everAssociated]";
      __int16 v15 = 1024;
      int v16 = 625;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make curBSSID", (uint8_t *)&v13, 0x12u);
    }

    int v7 = 0;
LABEL_26:
    uint64_t v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      uint64_t v14 = "-[WAApple80211 everAssociated]";
      __int16 v15 = 1024;
      int v16 = 646;
      __int16 v17 = 1024;
      LODWORD(v18) = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to currentBSSID error %d", (uint8_t *)&v13, 0x18u);
    }
LABEL_21:

    char v4 = 0;
    goto LABEL_22;
  }
  if (byte_1000F0FA8)
  {
    char v4 = 1;
    goto LABEL_22;
  }
  int v5 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v6 = Apple80211Get();
    int v7 = v6;
    if (v6 <= 15)
    {
      if (v6 != -3905) {
        break;
      }
    }
    else if (v6 != 61 && v6 != 16)
    {
      goto LABEL_26;
    }
    if (!--v5) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v6) {
    goto LABEL_26;
  }
  if (![v3 length])
  {
    id v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      uint64_t v14 = "-[WAApple80211 everAssociated]";
      __int16 v15 = 1024;
      int v16 = 638;
      __int16 v17 = 2112;
      int v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v13, 0x1Cu);
    }

    uint64_t v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_21;
  }
  byte_1000F0FA8 = 1;
  double v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446722;
    uint64_t v14 = "-[WAApple80211 everAssociated]";
    __int16 v15 = 1024;
    int v16 = 636;
    __int16 v17 = 2112;
    int v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:everAssociated curBSSID %@", (uint8_t *)&v13, 0x1Cu);
  }

  char v4 = byte_1000F0FA8;
LABEL_22:

  return v4;
}

- (BOOL)isAssociated
{
  int v3 = +[NSMutableString stringWithCapacity:0];
  BOOL v4 = v3 != 0;
  if (v3)
  {
    int v5 = 7;
    while (1)
    {
      [(WAApple80211 *)self apple80211Ref];
      int v6 = Apple80211Get();
      if (v6 <= 15)
      {
        if (v6 != -3905) {
          break;
        }
      }
      else if (v6 != 61 && v6 != 16)
      {
        goto LABEL_16;
      }
      if (!--v5) {
        break;
      }
      usleep(0x7A120u);
    }
    if (v6 || ![v3 length])
    {
LABEL_16:
      BOOL v4 = 0;
      goto LABEL_17;
    }
    byte_1000F0FA8 = 1;
    uint64_t v7 = +[NSString stringWithString:v3];
    double v8 = (void *)qword_1000F0FB0;
    qword_1000F0FB0 = v7;

    id v9 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    int v15 = 136446722;
    int v16 = "-[WAApple80211 isAssociated]";
    __int16 v17 = 1024;
    int v18 = 664;
    __int16 v19 = 2112;
    uint64_t v20 = v3;
    uint64_t v10 = "%{public}s::%d:everAssociated curBSSID %@";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 28;
  }
  else
  {
    id v9 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v15 = 136446466;
    int v16 = "-[WAApple80211 isAssociated]";
    __int16 v17 = 1024;
    int v18 = 655;
    uint64_t v10 = "%{public}s::%d:Failed to make curBSSID";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 18;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v15, v13);
LABEL_15:

LABEL_17:
  return v4;
}

- (BOOL)isAXAssociatoin
{
  int v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if (!v3)
  {
    __int16 v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446466;
      uint64_t v21 = "-[WAApple80211 isAXAssociatoin]";
      __int16 v22 = 1024;
      int v23 = 682;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make dict", (uint8_t *)&v20, 0x12u);
    }

    int v6 = 0;
LABEL_29:
    uint64_t v10 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v20 = 136446722;
    uint64_t v21 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v22 = 1024;
    int v23 = 705;
    __int16 v24 = 1024;
    LODWORD(v25) = v6;
    int v15 = "%{public}s::%d:Failed to isAXAssociatoin error %d";
    int v16 = v10;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 24;
    goto LABEL_25;
  }
  int v4 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v5 = Apple80211Get();
    int v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905) {
        break;
      }
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_29;
    }
    if (!--v4) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v5) {
    goto LABEL_29;
  }
  if (![v3 count]
    || ([v3 objectForKey:@"PHYMODE_ACTIVE"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint32_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446722;
      uint64_t v21 = "-[WAApple80211 isAXAssociatoin]";
      __int16 v22 = 1024;
      int v23 = 697;
      __int16 v24 = 2112;
      uint64_t v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v20, 0x1Cu);
    }

    uint64_t v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v20 = 138412290;
      uint64_t v21 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_21;
  }
  double v8 = [v3 objectForKey:@"PHYMODE_ACTIVE"];
  unsigned int v9 = [v8 unsignedIntValue];

  uint64_t v10 = WALogCategoryDefaultHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9 != 256)
  {
    if (!v11)
    {
LABEL_21:
      BOOL v12 = 0;
      goto LABEL_22;
    }
    int v20 = 136446466;
    uint64_t v21 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v22 = 1024;
    int v23 = 692;
    int v15 = "%{public}s::%d:PHYMODE is not APPLE80211_MODE_11AX";
    int v16 = v10;
    os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
    uint32_t v18 = 18;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v20, v18);
    goto LABEL_21;
  }
  if (v11)
  {
    int v20 = 136446466;
    uint64_t v21 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v22 = 1024;
    int v23 = 689;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:PHYMODE is APPLE80211_MODE_11AX", (uint8_t *)&v20, 0x12u);
  }
  BOOL v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)getPhyMode
{
  int v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if (!v3)
  {
    uint32_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446466;
      int v15 = "-[WAApple80211 getPhyMode]";
      __int16 v16 = 1024;
      int v17 = 715;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make dict", (uint8_t *)&v14, 0x12u);
    }

    int v6 = 0;
LABEL_23:
    BOOL v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      int v15 = "-[WAApple80211 getPhyMode]";
      __int16 v16 = 1024;
      int v17 = 732;
      __int16 v18 = 1024;
      LODWORD(v19) = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to isAXAssociatoin error %d", (uint8_t *)&v14, 0x18u);
    }
LABEL_18:

    unint64_t v9 = 0;
    goto LABEL_19;
  }
  int v4 = 7;
  while (1)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v5 = Apple80211Get();
    int v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905) {
        break;
      }
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_23;
    }
    if (!--v4) {
      break;
    }
    usleep(0x7A120u);
  }
  if (v5) {
    goto LABEL_23;
  }
  if (![v3 count]
    || ([v3 objectForKey:@"PHYMODE_ACTIVE"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      int v15 = "-[WAApple80211 getPhyMode]";
      __int16 v16 = 1024;
      int v17 = 724;
      __int16 v18 = 2112;
      __int16 v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v14, 0x1Cu);
    }

    BOOL v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v14 = 138412290;
      int v15 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_18;
  }
  double v8 = [v3 objectForKey:@"PHYMODE_ACTIVE"];
  unint64_t v9 = [v8 unsignedIntValue];

LABEL_19:
  return v9;
}

- (id)getIOReportLegendItemsMatching:(id *)a3 retErr:(char *)a4
{
  CFStringRef errorString = 0;
  if (qword_1000F0FC0 != -1) {
    dispatch_once(&qword_1000F0FC0, &stru_1000D0EF0);
  }
  uint64_t v7 = qword_1000F0FC8;
  bzero((void *)qword_1000F0FC8, 0x3988uLL);
  if (a3->var0) {
    snprintf((char *)(v7 + 8), 0x30uLL, "%s", (const char *)[a3->var0 UTF8String]);
  }
  id var1 = a3->var1;
  if (var1) {
    snprintf((char *)(qword_1000F0FC8 + 56), 0x30uLL, "%s", (const char *)[var1 UTF8String]);
  }
  id var2 = a3->var2;
  if (var2) {
    snprintf((char *)(qword_1000F0FC8 + 104), 0x30uLL, "%s", (const char *)[var2 UTF8String]);
  }
  id var3 = a3->var3;
  if (var3) {
    snprintf((char *)(qword_1000F0FC8 + 152), 0x30uLL, "%s", (const char *)[var3 UTF8String]);
  }
  id var4 = a3->var4;
  if (var4) {
    snprintf((char *)(qword_1000F0FC8 + 200), 0x30uLL, "%s", (const char *)[var4 UTF8String]);
  }
  id var5 = a3->var5;
  if (var5) {
    snprintf((char *)(qword_1000F0FC8 + 248), 0x30uLL, "%s", (const char *)[var5 UTF8String]);
  }
  id var6 = a3->var6;
  if (var6) {
    snprintf((char *)(qword_1000F0FC8 + 296), 0x30uLL, "%s", (const char *)[var6 UTF8String]);
  }
  id var7 = a3->var7;
  if (var7) {
    snprintf((char *)(qword_1000F0FC8 + 344), 0x30uLL, "%s", (const char *)[var7 UTF8String]);
  }
  for (int i = 6; ; --i)
  {
    [(WAApple80211 *)self apple80211Ref];
    int v16 = Apple80211Get();
    int v17 = v16;
    if (v16 < 0) {
      break;
    }
    if (v16 != 16 && v16 != 61)
    {
LABEL_28:
      if (v16) {
        goto LABEL_49;
      }
      size_t v18 = *(unsigned int *)(qword_1000F0FC8 + 4);
      if (v18)
      {
        __int16 v19 = (void *)IOCFUnserializeWithSize((const char *)(qword_1000F0FC8 + 392), v18, kCFAllocatorDefault, 0, &errorString);
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = errorString == 0;
        }
        if (v20)
        {
          if (v19)
          {
            id v21 = v19;
            *a4 = 0;

            goto LABEL_52;
          }
        }
        else
        {
          id v40 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            int v42 = *(_DWORD *)(qword_1000F0FC8 + 4);
            *(_DWORD *)buf = 136446978;
            v51 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
            __int16 v52 = 1024;
            *(_DWORD *)v53 = 811;
            *(_WORD *)&v53[4] = 1024;
            *(_DWORD *)&v53[6] = v42;
            *(_WORD *)&v53[10] = 2112;
            *(void *)&v53[12] = errorString;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n", buf, 0x22u);
          }
        }
        __int16 v31 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v43 = *(_DWORD *)(qword_1000F0FC8 + 4);
          *(_DWORD *)buf = 136446978;
          v51 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          __int16 v52 = 1024;
          *(_DWORD *)v53 = 814;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v43;
          *(_WORD *)&v53[10] = 2112;
          *(void *)&v53[12] = errorString;
          int v44 = "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n";
          __int16 v45 = v31;
          uint32_t v46 = 34;
          goto LABEL_46;
        }
      }
      else
      {
        __int16 v31 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v51 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          __int16 v52 = 1024;
          *(_DWORD *)v53 = 805;
          int v44 = "%{public}s::%d:No APPLE80211KEY_IOR_RESPONSE";
          __int16 v45 = v31;
          uint32_t v46 = 18;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
        }
      }
      int v17 = 0;
      goto LABEL_48;
    }
LABEL_26:
    if (!i) {
      goto LABEL_28;
    }
    usleep(0x7A120u);
  }
  if (v16 != -536870175)
  {
    if (v16 != -3905) {
      goto LABEL_49;
    }
    goto LABEL_26;
  }
  __int16 v22 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id var0 = a3->var0;
    id v24 = a3->var1;
    id v25 = a3->var2;
    id v26 = a3->var3;
    id v27 = a3->var4;
    id v28 = a3->var5;
    id v29 = a3->var6;
    id v30 = a3->var7;
    *(_DWORD *)buf = 136448514;
    v51 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
    __int16 v52 = 1024;
    *(_DWORD *)v53 = 790;
    *(_WORD *)&v53[4] = 2112;
    *(void *)&v53[6] = var0;
    *(_WORD *)&v53[14] = 2112;
    *(void *)&v53[16] = v24;
    *(_WORD *)&v53[24] = 2112;
    *(void *)&v53[26] = v25;
    *(_WORD *)&v53[34] = 2112;
    *(void *)&v53[36] = v26;
    *(_WORD *)&v53[44] = 2112;
    *(void *)&v53[46] = v27;
    *(_WORD *)&v53[54] = 2112;
    *(void *)&v53[56] = v28;
    *(_WORD *)&v53[64] = 2112;
    *(void *)&v53[66] = v29;
    __int16 v54 = 2112;
    id v55 = v30;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Get APPLE80211_IOR_LEGEND too large, query %@,%@,%@,%@ %@,%@,%@,%@", buf, 0x62u);
  }

  int v17 = -536870175;
  __int16 v31 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    int v32 = (const char *)a3->var0;
    id v33 = a3->var1;
    id v34 = a3->var2;
    id v35 = a3->var3;
    id v36 = a3->var4;
    id v37 = a3->var5;
    id v38 = a3->var6;
    id v39 = a3->var7;
    *(_DWORD *)buf = 138414082;
    v51 = v32;
    __int16 v52 = 2112;
    *(void *)v53 = v33;
    *(_WORD *)&v53[8] = 2112;
    *(void *)&v53[10] = v34;
    *(_WORD *)&v53[18] = 2112;
    *(void *)&v53[20] = v35;
    *(_WORD *)&v53[28] = 2112;
    *(void *)&v53[30] = v36;
    *(_WORD *)&v53[38] = 2112;
    *(void *)&v53[40] = v37;
    *(_WORD *)&v53[48] = 2112;
    *(void *)&v53[50] = v38;
    *(_WORD *)&v53[58] = 2112;
    *(void *)&v53[60] = v39;
    _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Apple80211Get APPLE80211_IOR_LEGEND too large, query %@,%@,%@,%@ %@,%@,%@,%@", buf, 0x52u);
  }
LABEL_48:

LABEL_49:
  v47 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v51 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
    __int16 v52 = 1024;
    *(_DWORD *)v53 = 823;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v17;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to getIOReportLegendItemsMatching error %d", buf, 0x18u);
  }

  id v21 = 0;
  *a4 = 1;
LABEL_52:

  return v21;
}

- (unsigned)getIOReportingService
{
  for (int i = 6; ; --i)
  {
    int IOReportingService = Apple80211GetIOReportingService();
    int v4 = IOReportingService;
    if (IOReportingService <= 15)
    {
      if (IOReportingService != -3905) {
        break;
      }
    }
    else if (IOReportingService != 61 && IOReportingService != 16)
    {
      goto LABEL_11;
    }
    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }
  if (!IOReportingService) {
    return 0;
  }
LABEL_11:
  int v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    double v8 = "-[WAApple80211 getIOReportingService]";
    __int16 v9 = 1024;
    int v10 = 841;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed Apple80211GetIOReportingService error %d", buf, 0x18u);
  }

  return 0;
}

- (id)getIOReportingClassPath
{
  memset(path, 0, 512);
  IORegistryEntryGetPath([(WAApple80211 *)self getIOReportingService], "IOService", path);
  id v2 = +[NSString stringWithUTF8String:path];
  if (!v2)
  {
    int v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446466;
      int v6 = "-[WAApple80211 getIOReportingClassPath]";
      __int16 v7 = 1024;
      int v8 = 854;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to alloc IORegistryEntryGetPath NSString", (uint8_t *)&v5, 0x12u);
    }
  }

  return v2;
}

- (id)getIOReportingDriverName
{
  [(WAApple80211 *)self getIOReportingService];
  id v2 = (void *)IOReportCopyDriverName();
  if (!v2)
  {
    int v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446466;
      int v6 = "-[WAApple80211 getIOReportingDriverName]";
      __int16 v7 = 1024;
      int v8 = 868;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to driver name through IOReportCopyDriverName", (uint8_t *)&v5, 0x12u);
    }
  }

  return v2;
}

- (unint64_t)getIOReportingDriverID
{
  uint64_t entryID = 0;
  if (!IORegistryEntryGetRegistryEntryID([(WAApple80211 *)self getIOReportingService], &entryID))return entryID; {
  int v3 = WALogCategoryDefaultHandle();
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    int v6 = "-[WAApple80211 getIOReportingDriverID]";
    __int16 v7 = 1024;
    int v8 = 878;
    __int16 v9 = 2048;
    uint64_t v10 = entryID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx", buf, 0x1Cu);
  }

  return 0;
}

- (int64_t)getDriverType
{
  int v3 = [(WAApple80211 *)self getIOReportingDriverName];
  int v4 = [(WAApple80211 *)self getIOReportingClassPath];
  if ([v3 containsString:@"ACIWiFiDriver"])
  {
    int64_t v5 = 2;
  }
  else if (([v3 containsString:@"BCM"] & 1) != 0 {
         || ([v3 containsString:@"IO80211ReporterProxy"] & 1) != 0)
  }
  {
    int64_t v5 = 1;
  }
  else
  {
    int v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      __int16 v9 = "-[WAApple80211 getDriverType]";
      __int16 v10 = 1024;
      int v11 = 901;
      __int16 v12 = 2112;
      uint32_t v13 = v3;
      __int16 v14 = 2112;
      int v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to determine WLAN driver type: drvName %@ drvPath %@", (uint8_t *)&v8, 0x26u);
    }

    int64_t v5 = 0;
  }

  return v5;
}

- (WADeviceDBDelegate)dbDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dbDelegate);

  return (WADeviceDBDelegate *)WeakRetained;
}

- (void)setDbDelegate:(id)a3
{
}

- (_Apple80211)apple80211Ref
{
  return self->_apple80211Ref;
}

- (void)setApple80211Ref:(_Apple80211 *)a3
{
  self->_apple80211Ref = a3;
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfName:(id)a3
{
}

- (NSDate)lastDateChannelQueried
{
  return self->_lastDateChannelQueried;
}

- (void)setLastDateChannelQueried:(id)a3
{
}

- (NSDate)lastDateBSSIDQueried
{
  return self->_lastDateBSSIDQueried;
}

- (void)setLastDateBSSIDQueried:(id)a3
{
}

- (WAMessage)dummyWAMessage
{
  return (WAMessage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDummyWAMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dummyWAMessage, 0);
  objc_storeStrong((id *)&self->_lastDateBSSIDQueried, 0);
  objc_storeStrong((id *)&self->_lastDateChannelQueried, 0);
  objc_storeStrong((id *)&self->_ifName, 0);
  objc_destroyWeak((id *)&self->_dbDelegate);

  objc_storeStrong((id *)&self->analyticsMOCQueue, 0);
}

@end