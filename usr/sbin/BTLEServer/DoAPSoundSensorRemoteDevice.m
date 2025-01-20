@interface DoAPSoundSensorRemoteDevice
- (DoAPAudioRelay)doapAudioRelay;
- (DoAPSoundSensorRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (NSArray)codecs;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (void)activateSoundSensorClient;
- (void)cancelSoundSensorClient;
- (void)clearEvent;
- (void)clearState;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DoAPSoundSensorRemoteDevice

- (DoAPSoundSensorRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v7 = a3;
  if (v4 == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)DoAPSoundSensorRemoteDevice;
    v8 = [(DoAPDevice *)&v23 initWithCodecs:v7 streamID:2];
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
            dispatch_set_finalizer_f((dispatch_object_t)v9->_queue, (dispatch_function_t)[j__objc_msgSend_notifyDidStop_0]);
            goto LABEL_11;
          }
          v20 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0;
        }
        v21 = v9->_groupStart;
        v9->_groupStart = 0;
      }
      v9 = 0;
    }
LABEL_11:
    self = v9;
    v19 = self;
    goto LABEL_12;
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (void)stop
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop DoAPSoundSensorRemoteDevice - Destroy DoAPAudioRelay", buf, 2u);
  }
  int v4 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStart];
  dispatch_semaphore_signal(v4);

  v5 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStop];

  if (v5)
  {
    v6 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStop];
    dispatch_semaphore_signal(v6);
  }
  id v7 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];

  if (v7)
  {
    v8 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];
    [v8 invalidate];

    [(DoAPSoundSensorRemoteDevice *)self setDoapAudioRelay:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)DoAPSoundSensorRemoteDevice;
  [(DoAPDevice *)&v11 stop];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048560;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  v43.receiver = self;
  v43.super_class = (Class)DoAPSoundSensorRemoteDevice;
  [(DoAPDevice *)&v43 start];
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start DoAPSoundSensorRemoteDevice - Create DoAPAudioRelay", buf, 2u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v4 = [(DoAPSoundSensorRemoteDevice *)self codecs];
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v39 + 1) + 8 * i) codec];
          if (v36 == 7)
          {
            v18 = [(DoAPDevice *)self peripheral];
            v19 = [v18 identifier];
            v20 = [v19 UUIDString];
            v21 = +[NSString stringWithFormat:@"%@_%@", v20, @"DoAP Sound Sensor"];

            v22 = +[DoAPAudioRelayHub instance];
            [v9 codec];
            objc_super v23 = [v22 relayWithIdentifier:v21 deviceType:4 properties:0 codecType:v35];
            [(DoAPSoundSensorRemoteDevice *)self setDoapAudioRelay:v23];

            v24 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];
            [v24 setDelegate:self];

            v25 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v25;
              [v9 codec];
              *(_DWORD *)buf = 67109120;
              int v45 = v34;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Start DoAPSoundSensorRemoteDevice - Send SelectCodec(%u) msg", buf, 8u);
            }
            groupStart = self->_groupStart;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000489D8;
            block[3] = &unk_1000B1778;
            block[4] = self;
            void block[5] = v9;
            dispatch_group_async(groupStart, queue, block);
            v30 = self->_groupStart;
            v31 = dispatch_get_global_queue(21, 0);
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100048A28;
            v32[3] = &unk_1000B1268;
            v32[4] = self;
            dispatch_group_async(v30, v31, v32);

            return;
          }
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v37 = 0;
          int v38 = 0;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100072E44(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (int)selectCodec:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return [(DoAPDevice *)&v4 selectCodec:a3];
}

- (int)startStreaming
{
  v12.receiver = self;
  v12.super_class = (Class)DoAPSoundSensorRemoteDevice;
  uint64_t v3 = [(DoAPDevice *)&v12 startStreaming];
  if (v3)
  {
    objc_super v4 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100072E7C(v3, v4, v5, v6, v7, v8, v9, v10);
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
  v4.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return [(DoAPDevice *)&v4 stopStreaming:a3];
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  v13.receiver = self;
  v13.super_class = (Class)DoAPSoundSensorRemoteDevice;
  uint64_t v4 = [(DoAPDevice *)&v13 eventIndicator:a3 eventValue:a4];
  if (v4)
  {
    uint64_t v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100072EE8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
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
    uint64_t v3 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStart];
    dispatch_semaphore_signal(v3);
  }
  uint64_t v4 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStop];

  if (v4)
  {
    uint64_t v5 = [(DoAPSoundSensorRemoteDevice *)self doapAudioStop];
    dispatch_semaphore_signal(v5);

    [(DoAPSoundSensorRemoteDevice *)self setDoapAudioStop:0];
  }
  uint64_t v6 = [(DoAPSoundSensorRemoteDevice *)self audioBuffer];

  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    uint64_t v8 = [(DoAPSoundSensorRemoteDevice *)v7 audioBuffer];
    [v8 removeAllObjects];

    objc_sync_exit(v7);
  }
  obj = self;
  objc_sync_enter(obj);
  [(DoAPSoundSensorRemoteDevice *)obj clearEvent];
  [(DoAPDevice *)obj doapStateSet:2];
  objc_sync_exit(obj);
}

- (void)activateSoundSensorClient
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(DoAPDevice *)self peripheral];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [v6 UUIDString];
    int v8 = 138477827;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - activateSoundSensorClient: ** TBD ** for ID %{private}@", (uint8_t *)&v8, 0xCu);
  }
  [(DoAPDevice *)self setHighPriorityLink:1 burstTime:&off_1000B76E0];
}

- (void)cancelSoundSensorClient
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(DoAPDevice *)self peripheral];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [v6 UUIDString];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - cancelSoundSensorClient - id \"%@\"", (uint8_t *)&v8, 0xCu);
  }
}

- (void)handleStartStreaming
{
  v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensorRemoteDevice received StartStreaming", v3, 2u);
  }
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensorRemoteDevice Received StopStreaming with error code%d", (uint8_t *)v7, 8u);
  }
  if ([(DoAPDevice *)self state] == 5)
  {
    uint64_t v6 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];
    [v6 cancelStream];
  }
  [(DoAPSoundSensorRemoteDevice *)self clearState];
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  if ([(DoAPDevice *)self state] <= 6 && a3 && a4 >= 1)
  {
    uint64_t v7 = +[NSDate date];
    [(DoAPSoundSensorRemoteDevice *)self setLastAudioDate:v7];

    int v8 = +[NSData dataWithBytes:a3 length:a4];
    if ([(DoAPDevice *)self state] == 5)
    {
      uint64_t v9 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];
      unsigned int v10 = [v9 isHubConnected];

      if (!v10)
      {
        uint64_t v14 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100072F54(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        goto LABEL_15;
      }
      uint64_t v11 = [(DoAPSoundSensorRemoteDevice *)self doapAudioRelay];
      [(DoAPSoundSensorRemoteDevice *)v11 sendAudioFrame:v8];
    }
    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        unsigned int v22 = [(DoAPDevice *)self state];
        objc_super v23 = qword_1000CD178;
        BOOL v24 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
        if (v22 == 2)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }
          [(DoAPSoundSensorRemoteDevice *)self stopStreaming:6];
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000492EC;
          block[3] = &unk_1000B1268;
          block[4] = self;
          dispatch_async(queue, block);
        }
        else if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - Audio data ignored", buf, 2u);
        }
        goto LABEL_15;
      }
      uint64_t v11 = self;
      objc_sync_enter(v11);
      objc_super v12 = [(DoAPSoundSensorRemoteDevice *)v11 audioBuffer];

      if (v12)
      {
        objc_super v13 = [(DoAPSoundSensorRemoteDevice *)v11 audioBuffer];
        [v13 addObject:v8];
      }
      objc_sync_exit(v11);
    }

LABEL_15:
  }
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  if ((a3 - 3) >= 3 && a3 != 1)
  {
    uint64_t v5 = a3;
    if (a3 == 2)
    {
      uint64_t v6 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100072FF8(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      uint64_t v14 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100072F8C(v5, v14, v15, v16, v17, v18, v19, v20);
      }
    }
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
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
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
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end