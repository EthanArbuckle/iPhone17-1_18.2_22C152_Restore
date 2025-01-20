@interface WCM_UCMClientManager
+ (id)WCM_UCMClientManagerSingleton;
+ (id)allocWithZone:(_NSZone *)a3;
- (NSTimer)homeKitReportingTimer;
- (WCM_UCMClientManager)init;
- (id)getControllerOfId:(int)a3;
- (id)getUCMClientFromList:(int)a3;
- (unint64_t)retainCount;
- (void)addUCMClient:(id)a3;
- (void)dealloc;
- (void)deleteUCMClient:(int)a3;
- (void)enableFrequencyUpdatesForMic:(id)a3;
- (void)enableHomeKitTimer:(id)a3;
- (void)enableULFrequencyUpdates:(id)a3;
- (void)existingContexts;
- (void)getHomeKitBtLoad:(id)a3;
- (void)postBTConnectedDevices;
- (void)removeUCMClient:(id)a3;
- (void)sendNRFrequencyUpdateForMic:(BOOL)a3 NR7xenabled:(BOOL)a4;
- (void)sendULFrequencyUpdates:(id)a3;
- (void)setHomeKitReportingTimer:(id)a3;
- (void)startHomeKitTimer:(double)a3;
- (void)stopHomeKitTimer;
- (void)timerHandler:(id)a3;
- (void)updateBTConnectedDevices:(WCM_BTConnections *)a3;
- (void)updateControllerSession:(id)a3 ofId:(int)a4;
- (void)updateWirelessBtLoad:(unsigned int)a3;
@end

@implementation WCM_UCMClientManager

- (void)addUCMClient:(id)a3
{
  [(NSMutableArray *)self->mUCMClientContexts addObject:a3];

  [(WCM_UCMClientManager *)self existingContexts];
}

- (void)removeUCMClient:(id)a3
{
  [(WCM_UCMClientManager *)self existingContexts];
  [(NSMutableArray *)self->mUCMClientContexts removeObject:a3];

  [(WCM_UCMClientManager *)self existingContexts];
}

- (void)deleteUCMClient:(int)a3
{
  id v4 = [(WCM_UCMClientManager *)self getUCMClientFromList:*(void *)&a3];
  if (v4)
  {
    [(WCM_UCMClientManager *)self removeUCMClient:v4];
  }
}

- (void)existingContexts
{
}

- (void)updateBTConnectedDevices:(WCM_BTConnections *)a3
{
  +[WCM_Logging logLevel:2 message:@"updateBTConnectedDevices"];
  long long v5 = *(_OWORD *)&a3->numA2DP;
  long long v6 = *(_OWORD *)&a3->numHID;
  long long v7 = *(_OWORD *)&a3->numeSCO;
  self->mBTConnections.numLEA = a3->numLEA;
  *(_OWORD *)&self->mBTConnections.numHID = v6;
  *(_OWORD *)&self->mBTConnections.numeSCO = v7;
  *(_OWORD *)&self->mBTConnections.numA2DP = v5;

  [(WCM_UCMClientManager *)self postBTConnectedDevices];
}

+ (id)WCM_UCMClientManagerSingleton
{
  objc_sync_enter(a1);
  if (!qword_10027D098)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_UCMClientManager;
    qword_10027D098 = (uint64_t)[[objc_msgSendSuper2(&v4, "allocWithZone:", 0) init];
  }
  objc_sync_exit(a1);
  return (id)qword_10027D098;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 WCM_UCMClientManagerSingleton:a3];

  return v3;
}

- (unint64_t)retainCount
{
  return -1;
}

- (WCM_UCMClientManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)WCM_UCMClientManager;
  v2 = [(WCM_UCMClientManager *)&v4 init];
  if (v2)
  {
    v2->mUCMClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mBTConnections.numA2DP = 0;
    *(_OWORD *)&v2->mBTConnections.numHID = 0u;
    *(_OWORD *)&v2->mBTConnections.numeSCO = 0u;
    v2->mBTConnections.numLEA = 0;
  }
  return v2;
}

- (void)dealloc
{
  mUCMClientContexts = self->mUCMClientContexts;
  if (mUCMClientContexts) {

  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_UCMClientManager;
  [(WCM_UCMClientManager *)&v4 dealloc];
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  switch(a4)
  {
    case '#':
      +[WCM_Logging logLevel:2, @"UCMClientManager: Rcvd WCMSharing controller event %p", a3 message];
      if (a3) {
        goto LABEL_9;
      }
      +[WCM_Logging logLevel:2 message:@"updateControllerSession:remove context for WCMSharing from UCMClientManager"];
      long long v6 = self;
      uint64_t v7 = 1;
      goto LABEL_13;
    case '(':
      +[WCM_Logging logLevel:2, @"UCMClientManager: Rcvd WRMHomeKit controller event %p", a3 message];
      if (a3) {
        goto LABEL_9;
      }
      +[WCM_Logging logLevel:2 message:@"updateControllerSession:remove context for WRMHomeKit from UCMClientManager"];
      long long v6 = self;
      uint64_t v7 = 2;
      goto LABEL_13;
    case ')':
      +[WCM_Logging logLevel:2, @"UCMClientManager: Rcvd WRMMIC controller event %p", a3 message];
      if (a3) {
        goto LABEL_9;
      }
      +[WCM_Logging logLevel:2 message:@"updateControllerSession:remove context for WRMMIC from UCMClientManager"];
      long long v6 = self;
      uint64_t v7 = 3;
      goto LABEL_13;
    case '*':
      +[WCM_Logging logLevel:2, @"UCMClientManager: Rcvd WRMSOS controller event %p", a3 message];
      if (a3)
      {
LABEL_9:
        [(WCM_UCMClientManager *)self addUCMClient:a3];
        +[WCM_Logging logLevel:2 message:@"UCMClientManager: Init Context"];
      }
      else
      {
        +[WCM_Logging logLevel:2 message:@"updateControllerSession:remove context for WRMSOS from UCMClientManager"];
        long long v6 = self;
        uint64_t v7 = 4;
LABEL_13:
        [(WCM_UCMClientManager *)v6 deleteUCMClient:v7];
      }
      return;
    default:
      return;
  }
}

- (id)getUCMClientFromList:(int)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mUCMClientContexts = self->mUCMClientContexts;
  id v5 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mUCMClientContexts);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 getMyClientType] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)getControllerOfId:(int)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mUCMClientContexts = self->mUCMClientContexts;
  id v5 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mUCMClientContexts);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 getProcessId] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)postBTConnectedDevices
{
  +[WCM_Logging logLevel:2 message:@"postBTConnectedDevices"];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    objc_super v4 = v3;
    xpc_dictionary_set_int64(v3, "kWCMBTNumA2DP", self->mBTConnections.numA2DP);
    xpc_dictionary_set_int64(v4, "kWCMBTNumSCO", self->mBTConnections.numSCO);
    xpc_dictionary_set_int64(v4, "kWCMBTNumESCO", self->mBTConnections.numeSCO);
    xpc_dictionary_set_int64(v4, "kWCMBTNumHID", self->mBTConnections.numHID);
    xpc_dictionary_set_int64(v4, "kWCMBTNumLE", self->mBTConnections.numLE);
    xpc_dictionary_set_int64(v4, "kWCMBTNumLEA", self->mBTConnections.numLEA);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    mUCMClientContexts = self->mUCMClientContexts;
    id v6 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(mUCMClientContexts);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) sendMessage:1429 withArgs:v4];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    xpc_release(v4);
  }
}

- (void)updateWirelessBtLoad:(unsigned int)a3
{
  +[WCM_Logging logLevel:2, @"updateWirelessBtLoad load: %u", *(void *)&a3 message];
  self->unsigned int mCurrentBtLoad = a3;
  if ([(WCM_UCMClientManager *)self homeKitReportingTimer]
    && [(NSTimer *)[(WCM_UCMClientManager *)self homeKitReportingTimer] isValid])
  {
    unsigned int mMaximumBtLoad = self->mMaximumBtLoad;
    unsigned int mCurrentBtLoad = self->mCurrentBtLoad;
    if (mCurrentBtLoad > mMaximumBtLoad) {
      unsigned int mMaximumBtLoad = mMaximumBtLoad & 0xFFFF0000 | self->mCurrentBtLoad;
    }
    self->unsigned int mMaximumBtLoad = mMaximumBtLoad & 0xFFFF00FF | (BYTE1(mCurrentBtLoad) << 8);
  }
}

- (void)getHomeKitBtLoad:(id)a3
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  +[WCM_Logging logLevel:2 message:@"getHomeKitBtLoad"];
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "kWRMHomeKitBtLoad", self->mMaximumBtLoad);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, reply);
    +[WCM_Logging logLevel:2, @"Sending response to getHomeKitBtLoad message %@", reply message];
    xpc_release(reply);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"getHomeKitBtLoad xpc_reply is NULL"];
  }
}

- (void)startHomeKitTimer:(double)a3
{
  +[WCM_Logging logLevel:2 message:@"startHomeKitTimer"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007A8EC;
  v5[3] = &unk_10020DB90;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)timerHandler:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"timerHandler"];
  mUCMClientContexts = self->mUCMClientContexts;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    id v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWRMHomeKitBtLoad", self->mMaximumBtLoad);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(mUCMClientContexts);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
          if (v11) {
            [v11 sendMessage:2803 withArgs:v6];
          }
          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    self->unsigned int mMaximumBtLoad = self->mCurrentBtLoad;
    xpc_release(v6);
  }
}

- (void)stopHomeKitTimer
{
  if ([(WCM_UCMClientManager *)self homeKitReportingTimer])
  {
    [(NSTimer *)[(WCM_UCMClientManager *)self homeKitReportingTimer] invalidate];
    [(WCM_UCMClientManager *)self setHomeKitReportingTimer:0];
  }
  self->unsigned int mMaximumBtLoad = 0;
}

- (void)enableHomeKitTimer:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"enableHomeKitTimer"];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    id v6 = value;
    if (xpc_dictionary_get_BOOL(value, "kWRMHomeKitEnable"))
    {
      double v7 = xpc_dictionary_get_double(v6, "kWRMHomeKitDuration");
      if ([(WCM_UCMClientManager *)self homeKitReportingTimer]
        && [(NSTimer *)[(WCM_UCMClientManager *)self homeKitReportingTimer] isValid])
      {
        [(WCM_UCMClientManager *)self stopHomeKitTimer];
      }
      [(WCM_UCMClientManager *)self startHomeKitTimer:v7];
      unsigned int mCurrentBtLoad = self->mCurrentBtLoad;
    }
    else
    {
      unsigned int mCurrentBtLoad = self->mMaximumBtLoad;
      [(WCM_UCMClientManager *)self stopHomeKitTimer];
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    if (reply)
    {
      long long v11 = reply;
      xpc_dictionary_set_uint64(reply, "kWRMHomeKitBtLoad", mCurrentBtLoad);
      remote_connection = xpc_dictionary_get_remote_connection(a3);
      xpc_connection_send_message(remote_connection, v11);
      +[WCM_Logging logLevel:2, @"Sending response to enableHomeKitTimer %@", v11 message];
      xpc_release(v11);
      return;
    }
    CFStringRef v9 = @"enableHomeKitTimer xpc_reply is NULL";
  }
  else
  {
    CFStringRef v9 = @"Error Getting Args";
  }

  +[WCM_Logging logLevel:0 message:v9];
}

- (void)enableFrequencyUpdatesForMic:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"enableFrequencyUpdatesForMic"];
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    id v6 = reply;
    xpc_dictionary_set_BOOL(reply, "kWRMNR41FreuquencyUpdate", self->mCurrentNR41Enabled);
    xpc_dictionary_set_BOOL(v6, "kWRMNR7xFreuquencyUpdate", self->mCurrentNR7xEnabled);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v6);
    +[WCM_Logging logLevel:2, @"Sending response to enableFrequencyUpdatesForMic %@", v6 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"enableFrequencyUpdatesForMic xpc_reply is NULL"];
  }
}

- (void)sendNRFrequencyUpdateForMic:(BOOL)a3 NR7xenabled:(BOOL)a4
{
  mUCMClientContexts = self->mUCMClientContexts;
  +[WCM_Logging logLevel:2 message:@"sendNRFrequencyUpdateForMic"];
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    CFStringRef v9 = v8;
    self->mCurrentNR41Enabled = a3;
    self->mCurrentNR7xEnabled = a4;
    xpc_dictionary_set_BOOL(v8, "kWRMNR41FreuquencyUpdate", a3);
    xpc_dictionary_set_BOOL(v9, "kWRMNR7xFreuquencyUpdate", a4);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(mUCMClientContexts);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (v14) {
            [v14 sendMessage:2806 withArgs:v9];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    xpc_release(v9);
  }
}

- (void)enableULFrequencyUpdates:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"enableULFrequencyUpdates"];
  mUCMClientContexts = self->mUCMClientContexts;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    id v6 = v5;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      xpc_object_t v8 = v7;
      xpc_dictionary_set_int64(v7, "kWRMULBandInfoType", self->mCurrentBandInfoType);
      xpc_dictionary_set_double(v8, "kWRMULCenterFrequency", self->mCurrentULCenterFrequency);
      xpc_dictionary_set_double(v8, "kWRMULBandwidth", self->mCurrentULBandwidth);
      xpc_dictionary_set_value(v6, "kWRMULFrequencyUpdate", v8);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(mUCMClientContexts);
            }
            long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
            if (v13) {
              [v13 sendMessage:2808 withArgs:v6];
            }
            uint64_t v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
      xpc_release(v8);
      xpc_release(v6);
    }
  }
}

- (void)sendULFrequencyUpdates:(id)a3
{
  if (a3)
  {
    mUCMClientContexts = self->mUCMClientContexts;
    +[WCM_Logging logLevel:2 message:@"sendULFrequencyUpdates"];
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      xpc_object_t v7 = v6;
      self->mCurrentBandInfoType = (unint64_t)[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BandInfoType"), "integerValue");
      [objc_msgSend(a3, "objectForKeyedSubscript:", @"ULCenterFrequency") doubleValue];
      self->mCurrentULCenterFrequency = v8;
      [objc_msgSend(a3, "objectForKeyedSubscript:", @"ULBandwidth") doubleValue];
      self->mCurrentULBandwidth = v9;
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      if (v10)
      {
        uint64_t v11 = v10;
        xpc_dictionary_set_int64(v10, "kWRMULBandInfoType", self->mCurrentBandInfoType);
        xpc_dictionary_set_double(v11, "kWRMULCenterFrequency", self->mCurrentULCenterFrequency);
        xpc_dictionary_set_double(v11, "kWRMULBandwidth", self->mCurrentULBandwidth);
        xpc_dictionary_set_value(v7, "kWRMULFrequencyUpdate", v11);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v12 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            long long v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(mUCMClientContexts);
              }
              long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v15);
              if (v16) {
                [v16 sendMessage:2808 withArgs:v7];
              }
              long long v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [(NSMutableArray *)mUCMClientContexts countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v13);
        }
        xpc_release(v11);
        xpc_release(v7);
      }
    }
  }
}

- (NSTimer)homeKitReportingTimer
{
  return self->_homeKitReportingTimer;
}

- (void)setHomeKitReportingTimer:(id)a3
{
}

@end