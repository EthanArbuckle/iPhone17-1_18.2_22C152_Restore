@interface HomeNotificationActionOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HFItemManager)itemManager;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (HomeNotificationAction)action;
- (HomeNotificationActionOperation)initWithAction:(id)a3 home:(id)a4 cameraProfile:(id)a5;
- (NSError)error;
- (NSString)resultString;
- (OS_dispatch_queue)accessQueue;
- (id)_itemsToInvertPrimaryStateForItems:(id)a3 preferredPrimaryState:(int64_t)a4 targetPrimaryState:(int64_t *)a5;
- (id)_toggleLightbulbsForItems:(id)a3;
- (id)_toggleMicrophoneState:(id)a3;
- (id)_unlockLocksAndDisarmSecuritySystemsForItems:(id)a3;
- (id)_writePrimaryState:(int64_t)a3 forItems:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setAction:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setResultString:(id)a3;
- (void)start;
@end

@implementation HomeNotificationActionOperation

- (HomeNotificationActionOperation)initWithAction:(id)a3 home:(id)a4 cameraProfile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)HomeNotificationActionOperation;
    v13 = [(HomeNotificationActionOperation *)&v16 init];
    if (v13)
    {
      dispatch_queue_t v14 = dispatch_queue_create("com.apple.home.notificationActionOperation", 0);
      [(HomeNotificationActionOperation *)v13 setAccessQueue:v14];

      [(HomeNotificationActionOperation *)v13 setAction:v8];
      [(HomeNotificationActionOperation *)v13 setHome:v9];
      [(HomeNotificationActionOperation *)v13 setCameraProfile:v11];
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(HomeNotificationActionOperation *)self accessQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000099CC;
  v5[3] = &unk_100018928;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HomeNotificationActionOperation *)self isFinished] != a3)
  {
    [(HomeNotificationActionOperation *)self willChangeValueForKey:@"isFinished"];
    v5 = [(HomeNotificationActionOperation *)self accessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009AC0;
    v6[3] = &unk_100018950;
    v6[4] = self;
    BOOL v7 = v3;
    dispatch_async(v5, v6);

    [(HomeNotificationActionOperation *)self didChangeValueForKey:@"isFinished"];
    if (v3) {
      [(HomeNotificationActionOperation *)self setExecuting:0];
    }
  }
}

- (BOOL)isExecuting
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(HomeNotificationActionOperation *)self accessQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009BB0;
  v5[3] = &unk_100018928;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  if ([(HomeNotificationActionOperation *)self isExecuting] != a3)
  {
    [(HomeNotificationActionOperation *)self willChangeValueForKey:@"isExecuting"];
    v5 = [(HomeNotificationActionOperation *)self accessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009C94;
    v6[3] = &unk_100018950;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);

    [(HomeNotificationActionOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (void)start
{
  if ([(HomeNotificationActionOperation *)self isCancelled])
  {
    [(HomeNotificationActionOperation *)self setFinished:1];
  }
  else
  {
    [(HomeNotificationActionOperation *)self setExecuting:1];
    v4 = [(HomeNotificationActionOperation *)self action];
    v5 = [v4 identifier];

    if ([v5 isEqualToString:@"microphone_toggleButton"])
    {
      uint64_t v6 = [(HomeNotificationActionOperation *)self cameraProfile];
      BOOL v7 = [v6 microphoneControl];
      uint64_t v8 = [(HomeNotificationActionOperation *)self _toggleMicrophoneState:v7];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100009EBC;
      v17[3] = &unk_100018978;
      v17[4] = self;
      id v9 = [v8 addCompletionBlock:v17];
    }
    else
    {
      id v10 = [(HomeNotificationActionOperation *)self action];
      v11 = [v10 serviceUUIDs];

      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100009EFC;
      v13[3] = &unk_100018A68;
      v13[4] = self;
      id v14 = v11;
      v15[1] = (id)a2;
      id v12 = v11;
      objc_copyWeak(v15, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
      objc_destroyWeak(v15);

      objc_destroyWeak(&location);
    }
  }
}

- (id)_toggleMicrophoneState:(id)a3
{
  if (a3)
  {
    v4 = [(HomeNotificationActionOperation *)self cameraProfile];
    v5 = [v4 streamControl];
    uint64_t v6 = [v5 cameraStream];

    if (v6)
    {
      id v7 = objc_alloc((Class)HFCameraAudioManager);
      uint64_t v8 = [(HomeNotificationActionOperation *)self cameraProfile];
      id v9 = [(HomeNotificationActionOperation *)self home];
      id v10 = [v9 hf_characteristicValueManager];
      id v11 = [v7 initWithCameraProfile:v8 cameraStream:v6 valueManager:v10];

      [v11 setOutgoingAudioEnabled:[v11 isOutgoingAudioEnabled] ^ 1];
    }
    else
    {
      id v11 = +[NSError hf_errorWithCode:35];
      +[NAFuture futureWithError:v11];
    v13 = };

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000A7C0;
    v16[3] = &unk_100018A90;
    v16[4] = self;
    id v14 = [v13 recover:v16];
  }
  else
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000E8E4(v12);
    }

    v13 = +[NSError hf_errorWithCode:38];
    id v14 = +[NAFuture futureWithError:v13];
  }

  return v14;
}

- (id)_toggleLightbulbsForItems:(id)a3
{
  uint64_t v18 = 2;
  v4 = [a3 na_filter:&stru_100018AD0];
  v5 = [(HomeNotificationActionOperation *)self _itemsToInvertPrimaryStateForItems:v4 preferredPrimaryState:2 targetPrimaryState:&v18];
  uint64_t v6 = [(HomeNotificationActionOperation *)self _writePrimaryState:v18 forItems:v5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_10000AAAC;
  v15[3] = &unk_100018AF8;
  uint64_t v17 = v18;
  v15[4] = self;
  id v7 = v4;
  id v16 = v7;
  uint64_t v8 = [v6 flatMap:v15];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000ABAC;
  v12[3] = &unk_100018B20;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = [v8 recover:v12];

  return v10;
}

- (id)_unlockLocksAndDisarmSecuritySystemsForItems:(id)a3
{
  id v4 = a3;
  v5 = [v4 na_filter:&stru_100018B40];
  uint64_t v6 = [v4 na_filter:&stru_100018B60];
  if (![v5 count] && !objc_msgSend(v6, "count")) {
    NSLog(@"Attempted to unlock doors and disarm security systems when no such accessories were found! Items: %@", v4);
  }
  v19 = [v5 na_filter:&stru_100018B80];
  v20 = [v6 na_filter:&stru_100018BA0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000B0EC;
  v29[3] = &unk_100018BE8;
  v29[4] = self;
  id v7 = [v20 na_map:v29];
  uint64_t v8 = [(HomeNotificationActionOperation *)self _writePrimaryState:2 forItems:v19];
  id v9 = [v7 allObjects];
  id v10 = [v9 arrayByAddingObject:v8];

  id v11 = +[NAFuture combineAllFutures:v10];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000B28C;
  v25[3] = &unk_100018C10;
  id v12 = v5;
  id v26 = v12;
  id v13 = v6;
  id v27 = v13;
  v28 = self;
  id v14 = [v11 flatMap:v25];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000B408;
  v21[3] = &unk_100018C38;
  id v22 = v12;
  id v23 = v13;
  v24 = self;
  id v15 = v13;
  id v16 = v12;
  uint64_t v17 = [v14 recover:v21];

  return v17;
}

- (id)_writePrimaryState:(int64_t)a3 forItems:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [(HomeNotificationActionOperation *)self home];
    uint64_t v8 = [v7 hf_characteristicValueManager];
    [v8 beginTransactionWithReason:@"Long Look notification light toggle"];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000B7A4;
    v16[3] = &unk_100018C60;
    v16[4] = self;
    void v16[5] = a3;
    id v9 = [v6 na_map:v16];
    id v10 = [(HomeNotificationActionOperation *)self home];
    id v11 = [v10 hf_characteristicValueManager];
    [v11 commitTransactionWithReason:@"Long Look notification light toggle"];

    id v12 = [v9 allObjects];
    id v13 = +[NAScheduler mainThreadScheduler];
    id v14 = +[NAFuture combineAllFutures:v12 ignoringErrors:0 scheduler:v13];
  }
  else
  {
    id v14 = +[NAFuture futureWithNoResult];
  }

  return v14;
}

- (id)_itemsToInvertPrimaryStateForItems:(id)a3 preferredPrimaryState:(int64_t)a4 targetPrimaryState:(int64_t *)a5
{
  int64_t v6 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B9C4;
  v20[3] = &unk_100018C80;
  v20[4] = a4;
  id v7 = a3;
  uint64_t v8 = objc_retainBlock(v20);
  id v9 = [v7 na_filter:v8];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10000BA30;
  uint64_t v18 = &unk_100018CA8;
  id v19 = v8;
  id v10 = v8;
  id v11 = [v7 na_filter:&v15];

  if (objc_msgSend(v11, "count", v15, v16, v17, v18))
  {
    id v12 = v11;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v12 = v9;
  if (a5)
  {
    int64_t v6 = HFToggledPrimaryState();
    id v12 = v9;
LABEL_6:
    *a5 = v6;
  }
LABEL_7:
  id v13 = v12;

  return v13;
}

- (HomeNotificationAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (NSString)resultString
{
  return self->_resultString;
}

- (void)setResultString:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resultString, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end