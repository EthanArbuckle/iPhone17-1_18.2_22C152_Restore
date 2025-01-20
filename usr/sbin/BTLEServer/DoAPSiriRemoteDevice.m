@interface DoAPSiriRemoteDevice
- (DoAPAudioRelay)doapAudioRelay;
- (DoAPSiriRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (NSArray)codecs;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (void)activateSiri:(int64_t)a3;
- (void)cancelSiri;
- (void)clearEvent;
- (void)clearState;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)start;
- (void)stop;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation DoAPSiriRemoteDevice

- (DoAPSiriRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v7 = a3;
  if (v4 == 1)
  {
    v27.receiver = self;
    v27.super_class = (Class)DoAPSiriRemoteDevice;
    v8 = [(DoAPDevice *)&v27 initWithCodecs:v7 streamID:1];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_codecs, a3);
      v9->_vtEvent = 0;
      v9->_vtSource = 0;
      v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      audioBuffer = v9->_audioBuffer;
      v9->_audioBuffer = v10;

      dispatch_group_t v12 = dispatch_group_create();
      groupStart = v9->_groupStart;
      v9->_groupStart = (OS_dispatch_group *)v12;

      if (v9->_groupStart)
      {
        dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
        doapAudioStart = v9->_doapAudioStart;
        v9->_doapAudioStart = (OS_dispatch_semaphore *)v14;

        if (v9->_doapAudioStart)
        {
          v16 = [(DoAPDevice *)v9 allocQueue];
          queue = v9->_queue;
          v9->_queue = v16;

          v18 = v9->_queue;
          if (v18)
          {
            dispatch_set_context(v18, v9);
            dispatch_set_finalizer_f((dispatch_object_t)v9->_queue, (dispatch_function_t)[v9 _notifyDidStop]);
            id v19 = objc_alloc((Class)AFNotifyObserver);
            id v20 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.client-state-changed"];
            v21 = (AFNotifyObserver *)[v19 initWithName:v20 options:1 queue:&_dispatch_main_q delegate:v9];
            notifyObserver = v9->_notifyObserver;
            v9->_notifyObserver = v21;

            v9->_siriState = 0;
            goto LABEL_11;
          }
          v24 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0;
        }
        v25 = v9->_groupStart;
        v9->_groupStart = 0;
      }
      v9 = 0;
    }
LABEL_11:
    self = v9;
    v23 = self;
    goto LABEL_12;
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (void)stop
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop DoAPSiriRemoteDevice - Destroy DoAPAudioRelay", buf, 2u);
  }
  int v4 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
  dispatch_semaphore_signal(v4);

  v5 = [(DoAPSiriRemoteDevice *)self doapAudioStop];

  if (v5)
  {
    v6 = [(DoAPSiriRemoteDevice *)self doapAudioStop];
    dispatch_semaphore_signal(v6);
  }
  id v7 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];

  if (v7)
  {
    v8 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];
    [v8 invalidate];

    [(DoAPSiriRemoteDevice *)self setDoapAudioRelay:0];
  }
  [(AFNotifyObserver *)self->_notifyObserver invalidate];
  notifyObserver = self->_notifyObserver;
  self->_notifyObserver = 0;

  v12.receiver = self;
  v12.super_class = (Class)DoAPSiriRemoteDevice;
  [(DoAPDevice *)&v12 stop];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056538;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  v35.receiver = self;
  v35.super_class = (Class)DoAPSiriRemoteDevice;
  [(DoAPDevice *)&v35 start];
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start DoAPSiriRemoteDevice - Create DoAPAudioRelay", buf, 2u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v4 = [(DoAPSiriRemoteDevice *)self codecs];
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v31 + 1) + 8 * i) codec];
          if (v28 == 7)
          {
            if (_os_feature_enabled_impl())
            {
              v11 = [(DoAPDevice *)self peripheral];
              objc_super v12 = [v11 identifier];
              v13 = [v12 UUIDString];
              dispatch_semaphore_t v14 = +[NSString stringWithFormat:@"%@_%@", v13, @"DoAP Siri"];
            }
            else
            {
              v11 = [(DoAPDevice *)self peripheral];
              objc_super v12 = [v11 identifier];
              dispatch_semaphore_t v14 = [v12 UUIDString];
            }

            v15 = +[DoAPAudioRelayHub instance];
            [v9 codec];
            v16 = [v15 relayWithIdentifier:v14 deviceType:3 properties:0 codecType:v27];
            [(DoAPSiriRemoteDevice *)self setDoapAudioRelay:v16];

            v17 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];
            [v17 setDelegate:self];

            v18 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = v18;
              [v9 codec];
              *(_DWORD *)buf = 67109120;
              int v37 = v26;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Start DoAPSiriRemoteDevice - Send SelectCodec(%u) msg", buf, 8u);
            }
            groupStart = self->_groupStart;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000569F4;
            block[3] = &unk_1000B1778;
            block[4] = self;
            void block[5] = v9;
            dispatch_group_async(groupStart, queue, block);
            v22 = self->_groupStart;
            v23 = dispatch_get_global_queue(21, 0);
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_100056A44;
            v24[3] = &unk_1000B1268;
            v24[4] = self;
            dispatch_group_async(v22, v23, v24);

            return;
          }
        }
        else
        {
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          int v30 = 0;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100074C2C();
  }
}

- (int)selectCodec:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DoAPSiriRemoteDevice;
  return [(DoAPDevice *)&v4 selectCodec:a3];
}

- (int)startStreaming
{
  v5.receiver = self;
  v5.super_class = (Class)DoAPSiriRemoteDevice;
  int v3 = [(DoAPDevice *)&v5 startStreaming];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100074C60();
    }
  }
  else
  {
    self->_vtEvent = 1;
    self->_vtSource = 3;
  }
  return v3;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DoAPSiriRemoteDevice;
  return [(DoAPDevice *)&v4 stopStreaming:a3];
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DoAPSiriRemoteDevice;
  int v4 = [(DoAPDevice *)&v6 eventIndicator:a3 eventValue:a4];
  if (v4 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100074CCC();
  }
  return v4;
}

- (void)clearEvent
{
  self->_vtEvent = 0;
  self->_vtSource = 0;
}

- (void)clearState
{
  if ([(DoAPDevice *)self state] == 5)
  {
    int v3 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
    dispatch_semaphore_signal(v3);
  }
  int v4 = [(DoAPSiriRemoteDevice *)self doapAudioStop];

  if (v4)
  {
    objc_super v5 = [(DoAPSiriRemoteDevice *)self doapAudioStop];
    dispatch_semaphore_signal(v5);

    [(DoAPSiriRemoteDevice *)self setDoapAudioStop:0];
  }
  objc_super v6 = [(DoAPSiriRemoteDevice *)self audioBuffer];

  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    v8 = [(DoAPSiriRemoteDevice *)v7 audioBuffer];
    [v8 removeAllObjects];

    objc_sync_exit(v7);
  }
  obj = self;
  objc_sync_enter(obj);
  [(DoAPSiriRemoteDevice *)obj clearEvent];
  [(DoAPDevice *)obj doapStateSet:2];
  objc_sync_exit(obj);
}

- (void)activateSiri:(int64_t)a3
{
  objc_super v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    uint64_t v7 = [(DoAPDevice *)self peripheral];
    v8 = [v7 identifier];
    v9 = [v8 UUIDString];
    *(_DWORD *)buf = 134218243;
    int64_t v21 = a3;
    __int16 v22 = 2113;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: Event %tu for ID %{private}@", buf, 0x16u);
  }
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    [(DoAPDevice *)self setHighPriorityLink:1 burstTime:&off_1000B77D0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100057014;
    v17[3] = &unk_1000B2240;
    v17[4] = self;
    v10 = objc_retainBlock(v17);
    if (a3 == 1)
    {
      BOOL v14 = [(DoAPDevice *)self state] != 5;
      mach_absolute_time();
      v11 = [(DoAPDevice *)self peripheral];
      objc_super v12 = [v11 identifier];
      v13 = [v12 UUIDString];
      v18[0] = AFSiriActivationUserInfoKey[0];
      v15 = +[NSNumber numberWithBool:v14];
      v18[1] = AFSiriActivationUserInfoKey[9];
      v19[0] = v15;
      v19[1] = &__kCFBooleanFalse;
      v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      AFSiriActivationBluetoothDeviceDoubleTap();
    }
    else
    {
      if (a3 != 2)
      {
LABEL_11:

        return;
      }
      mach_absolute_time();
      v11 = [(DoAPDevice *)self peripheral];
      objc_super v12 = [v11 identifier];
      v13 = [v12 UUIDString];
      AFSiriActivationBluetoothDeviceVoice();
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100074D38();
  }
}

- (void)cancelSiri
{
  int v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = [(DoAPDevice *)self peripheral];
    objc_super v6 = [v5 identifier];
    uint64_t v7 = [v6 UUIDString];
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Cancellation id \"%@\"", buf, 0xCu);
  }
  mach_absolute_time();
  v8 = [(DoAPDevice *)self peripheral];
  v9 = [v8 identifier];
  v10 = [v9 UUIDString];
  uint64_t v11 = AFSiriActivationUserInfoKey[9];
  v13[0] = AFSiriActivationUserInfoKey[0];
  v13[1] = v11;
  v14[0] = &__kCFBooleanFalse;
  v14[1] = &__kCFBooleanTrue;
  objc_super v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  AFSiriActivationBluetoothDeviceDoubleTap();
}

- (void)handleStartStreaming
{
  v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPSiriRemoteDevice received StartStreaming", v3, 2u);
  }
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  objc_super v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSiriRemoteDevice Received StopStreaming with error code%d", (uint8_t *)v7, 8u);
  }
  if ([(DoAPDevice *)self state] == 5)
  {
    objc_super v6 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];
    [v6 cancelStream];
  }
  [(DoAPSiriRemoteDevice *)self clearState];
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  if ([(DoAPDevice *)self state] <= 6 && a3 && a4 >= 1)
  {
    uint64_t v7 = +[NSDate date];
    [(DoAPSiriRemoteDevice *)self setLastAudioDate:v7];

    v8 = +[NSData dataWithBytes:a3 length:a4];
    if ([(DoAPDevice *)self state] == 5)
    {
      v9 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];
      unsigned int v10 = [v9 isHubConnected];

      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100074EE0();
        }
        goto LABEL_15;
      }
      uint64_t v11 = [(DoAPSiriRemoteDevice *)self doapAudioRelay];
      [(DoAPSiriRemoteDevice *)v11 sendAudioFrame:v8];
    }
    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        unsigned int v14 = [(DoAPDevice *)self state];
        v15 = qword_1000CD178;
        BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
        if (v14 == 2)
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }
          [(DoAPSiriRemoteDevice *)self stopStreaming:6];
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000578A0;
          block[3] = &unk_1000B1268;
          block[4] = self;
          dispatch_async(queue, block);
        }
        else if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Audio data ignored", buf, 2u);
        }
        goto LABEL_15;
      }
      uint64_t v11 = self;
      objc_sync_enter(v11);
      objc_super v12 = [(DoAPSiriRemoteDevice *)v11 audioBuffer];

      if (v12)
      {
        v13 = [(DoAPSiriRemoteDevice *)v11 audioBuffer];
        [v13 addObject:v8];
      }
      objc_sync_exit(v11);
    }

LABEL_15:
  }
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  switch(a3)
  {
    case 1u:
      objc_super v6 = self;
      objc_sync_enter(v6);
      if ([(DoAPDevice *)v6 state] != 2 && [(DoAPDevice *)v6 state] != 5) {
        goto LABEL_51;
      }
      int v7 = *a4;
      if (v7 != 1) {
        goto LABEL_40;
      }
      if ([(DoAPDevice *)v6 state] == 2)
      {
        v8 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          uint64_t v9 = 2;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: SiriActivation by VoiceTrigger", (uint8_t *)&v38, 2u);
        }
        else
        {
          uint64_t v9 = 2;
        }
      }
      else
      {
        int v7 = *a4;
LABEL_40:
        long long v31 = (id)qword_1000CD178;
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        if (v7 != 2)
        {
          if (v32)
          {
            long long v34 = [(DoAPDevice *)v6 doapStateNameFor:[(DoAPDevice *)v6 state]];
            int v38 = 67109378;
            LODWORD(v39[0]) = 1;
            WORD2(v39[0]) = 2114;
            *(void *)((char *)v39 + 6) = v34;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: Unhandled event type %d while %{public}@", (uint8_t *)&v38, 0x12u);
          }
          goto LABEL_51;
        }
        if (v32)
        {
          long long v33 = [(DoAPDevice *)v6 doapStateNameFor:[(DoAPDevice *)v6 state]];
          int v38 = 138543362;
          *(void *)&v39[0] = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: SiriActivation by DoubleTap while %{public}@", (uint8_t *)&v38, 0xCu);
        }
        uint64_t v9 = 1;
      }
      if ([(DoAPDevice *)v6 state] == 2) {
        [(DoAPDevice *)v6 doapStateSet:3];
      }
      v6->_vtEvent = 1;
      v6->_vtSource = *a4;
      [(DoAPSiriRemoteDevice *)v6 activateSiri:v9];
LABEL_51:
      objc_sync_exit(v6);

      return;
    case 2u:
      unsigned int v10 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received MyriadScore EventIndicator", (uint8_t *)&v38, 2u);
      }
      if ([(DoAPDevice *)self state] >= 2 && self->_vtEvent == 1 && self->_vtSource != 3)
      {
        float v11 = *(float *)a4;
        objc_super v12 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 134217984;
          v39[0] = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Siri Myriad Score %f", (uint8_t *)&v38, 0xCu);
        }
        mach_absolute_time();
        objc_super v35 = [(DoAPDevice *)self peripheral];
        v36 = [v35 identifier];
        int v37 = [v36 UUIDString];
        AFSiriActivationHearstBoron();
      }
      return;
    case 3u:
      v13 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received StreamingEnd EventIndicator", (uint8_t *)&v38, 2u);
      }
      unsigned int v14 = [(DoAPSiriRemoteDevice *)self doapAudioStop];

      if (v14)
      {
        v15 = [(DoAPSiriRemoteDevice *)self doapAudioStop];
        dispatch_semaphore_signal(v15);
      }
      BOOL v16 = [(DoAPSiriRemoteDevice *)self audioBuffer];

      if (v16)
      {
        v17 = self;
        objc_sync_enter(v17);
        v18 = [(DoAPSiriRemoteDevice *)v17 audioBuffer];
        [v18 removeAllObjects];

        objc_sync_exit(v17);
      }
      if ([(DoAPDevice *)self state] == 5)
      {
        [(DoAPSiriRemoteDevice *)self setDoapAudioStop:0];
        id v19 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
        dispatch_semaphore_signal(v19);
      }
      id v20 = self;
      objc_sync_enter(v20);
      [(DoAPSiriRemoteDevice *)v20 clearEvent];
      [(DoAPDevice *)v20 doapStateSet:2];
      objc_sync_exit(v20);

      return;
    case 5u:
      int64_t v21 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received SiriCancel EventIndicator", (uint8_t *)&v38, 2u);
      }
      [(DoAPSiriRemoteDevice *)self cancelSiri];
      return;
    case 6u:
      __int16 v22 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = *a4;
        int v38 = 67109120;
        LODWORD(v39[0]) = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Doap Received PTT/HTT Button Event (value = %d)", (uint8_t *)&v38, 8u);
      }
      if ([(DoAPDevice *)self state] == 2 && *a4 == 1)
      {
        self->_vtEvent = 6;
        self->_vtSource = 4;
        mach_absolute_time();
        v24 = [(DoAPDevice *)self peripheral];
        v25 = [v24 identifier];
        unsigned __int8 v26 = [v25 UUIDString];
        AFSiriActivationBluetoothDeviceButtonPress();
      }
      else if ([(DoAPDevice *)self state] == 2 && *a4 == 2)
      {
        mach_absolute_time();
        unsigned __int8 v27 = [(DoAPDevice *)self peripheral];
        uint64_t v28 = [v27 identifier];
        uint64_t v29 = [v28 UUIDString];
        AFSiriActivationBluetoothDeviceButtonRelease();
      }
      else
      {
        int v30 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100074F80(v30, self);
        }
      }
      return;
    default:
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100074F14();
      }
      return;
  }
}

- (void)doapAudioWillStart:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(DoAPDevice *)self state];
  objc_super v6 = qword_1000CD178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioWillStart", buf, 2u);
    }
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100058344;
    v8[3] = &unk_1000B1640;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100075080();
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(DoAPDevice *)self state];
  objc_super v6 = qword_1000CD178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri waitForSiriAudioToStop", buf, 2u);
    }
    int v7 = [(DoAPSiriRemoteDevice *)self lastAudioDate];
    [v7 timeIntervalSinceNow];
    BOOL v9 = fabs(v8) < 0.5;

    if (v9)
    {
      unsigned int v10 = [(DoAPSiriRemoteDevice *)self doapAudioStop];

      if (v10)
      {
        float v11 = [(DoAPSiriRemoteDevice *)self lastAudioDate];
        [v11 timeIntervalSinceNow];
        double v13 = v12;

        unsigned int v14 = [(DoAPSiriRemoteDevice *)self doapAudioStop];
        dispatch_time_t v15 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v13 + 0.5) * 1000.0));
        intptr_t v16 = dispatch_semaphore_wait(v14, v15);

        v17 = qword_1000CD178;
        BOOL v18 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            id v19 = v17;
            id v20 = [(DoAPSiriRemoteDevice *)self lastAudioDate];
            [v20 timeIntervalSinceNow];
            *(_DWORD *)buf = 134217984;
            double v46 = fabs(v21) * 1000.0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Received Siri audio data %f ms ago.", buf, 0xCu);
          }
          queue = self->_queue;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100058EE8;
          v41[3] = &unk_1000B1640;
          v41[4] = self;
          id v42 = v4;
          dispatch_async(queue, v41);
        }
        else
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Received streamEnd event.", buf, 2u);
          }
          [(DoAPSiriRemoteDevice *)self setDoapAudioStop:0];
          if ([(DoAPDevice *)self state] < 7)
          {
            (*((void (**)(id, void))v4 + 2))(v4, 0);
          }
          else
          {
            int v37 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriDevice is about to be stopped", buf, 2u);
            }
          }
          int v38 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
          dispatch_semaphore_signal(v38);

          v39 = self;
          objc_sync_enter(v39);
          v40 = [(DoAPSiriRemoteDevice *)v39 audioBuffer];
          [v40 removeAllObjects];

          objc_sync_exit(v39);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_1000751F4();
        }
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        CFStringRef v44 = @"No doapAudioStop semaphore";
        BOOL v32 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        long long v33 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870165 userInfo:v32];

        (*((void (**)(id, void *))v4 + 2))(v4, v33);
        long long v34 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
        dispatch_semaphore_signal(v34);

        objc_super v35 = self;
        objc_sync_enter(v35);
        v36 = [(DoAPSiriRemoteDevice *)v35 audioBuffer];
        [v36 removeAllObjects];

        objc_sync_exit(v35);
      }
    }
    else
    {
      int v23 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = [(DoAPSiriRemoteDevice *)self lastAudioDate];
        [v25 timeIntervalSinceNow];
        *(_DWORD *)buf = 134217984;
        double v46 = fabs(v26) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);
      }
      [(DoAPSiriRemoteDevice *)self setDoapAudioStop:0];
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      unsigned __int8 v27 = [(DoAPSiriRemoteDevice *)self doapAudioStart];
      dispatch_semaphore_signal(v27);

      uint64_t v28 = [(DoAPSiriRemoteDevice *)self audioBuffer];

      if (v28)
      {
        uint64_t v29 = self;
        objc_sync_enter(v29);
        int v30 = [(DoAPSiriRemoteDevice *)v29 audioBuffer];
        [v30 removeAllObjects];

        objc_sync_exit(v29);
      }
      long long v31 = self;
      objc_sync_enter(v31);
      [(DoAPSiriRemoteDevice *)v31 clearEvent];
      [(DoAPDevice *)v31 doapStateSet:2];
      objc_sync_exit(v31);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_1000751C0();
  }
}

- (void)doapAudioDidStop:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(DoAPDevice *)self state];
  objc_super v6 = qword_1000CD178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioDidStop", buf, 2u);
    }
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100059010;
    v8[3] = &unk_1000B1640;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100075228();
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  double v8 = (AFNotifyObserver *)a3;
  id v9 = v8;
  if (a4 != a5 && self->_notifyObserver == v8)
  {
    self->_int siriState = a5;
    unsigned int v10 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int siriState = self->_siriState;
      v12[0] = 67109376;
      v12[1] = a4;
      __int16 v13 = 1024;
      int v14 = siriState;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriState changed 0x%0X -> 0x%0X", (uint8_t *)v12, 0xEu);
    }
    [(DoAPSiriRemoteDevice *)self eventIndicator:4 eventValue:self->_siriState];
  }
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSArray)codecs
{
  return self->_codecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecs, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end