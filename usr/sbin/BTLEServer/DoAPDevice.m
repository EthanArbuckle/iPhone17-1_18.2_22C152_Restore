@interface DoAPDevice
+ (id)doapDeviceWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (CBPeripheral)peripheral;
- (DoAPDevice)init;
- (DoAPDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4;
- (DoAPServiceProtocol)service;
- (id)allocQueue;
- (id)doapStateNameFor:(unsigned __int8)a3;
- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4;
- (int)selectCodec:(unsigned __int8)a3;
- (int)startStreaming;
- (int)stopStreaming:(unsigned __int8)a3;
- (unsigned)state;
- (unsigned)streamID;
- (void)dealloc;
- (void)doapStateSet:(unsigned __int8)a3;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4;
- (void)handleStartStreaming;
- (void)handleStopStreaming:(unsigned __int8)a3;
- (void)notifyDidStart;
- (void)notifyDidStop;
- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4;
- (void)setPeripheral:(id)a3;
- (void)setService:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setStreamID:(unsigned __int16)a3;
- (void)start;
- (void)stop;
@end

@implementation DoAPDevice

+ (id)doapDeviceWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  if (v4 == 1 && (v6 = (objc_class *)objc_opt_class()) != 0) {
    id v7 = [[v6 alloc] initWithCodecs:v5 streamID:1];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  [(DoAPDevice *)obj doapStateSet:1];
  objc_sync_exit(obj);
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  [(DoAPDevice *)obj doapStateSet:7];
  objc_sync_exit(obj);
}

- (void)handleStartStreaming
{
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
}

- (DoAPDevice)init
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[DoAPDevice init]");
  +[NSException raise:NSInvalidArgumentException, @"Calling %@ is not allowed", v3 format];

  return 0;
}

- (DoAPDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DoAPDevice;
  result = [(DoAPDevice *)&v6 init];
  if (result)
  {
    result->_state = 0;
    result->_streamID = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DoAPDevice;
  [(DoAPDevice *)&v2 dealloc];
}

- (void)notifyDidStart
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062B38;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062C48;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)selectCodec:(unsigned __int8)a3
{
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAP Send selectCodec", buf, 2u);
  }
  v10[0] = 1;
  v10[1] = [(DoAPDevice *)self streamID];
  v10[2] = [(DoAPDevice *)self streamID] >> 8;
  v10[3] = a3;
  objc_super v6 = +[NSData dataWithBytesNoCopy:v10 length:4 freeWhenDone:0];
  if ([(DoAPDevice *)self state])
  {
    id v7 = [(DoAPDevice *)self service];
    [v7 selectCodec:v6];

    int v8 = 0;
  }
  else
  {
    int v8 = -536870195;
  }

  return v8;
}

- (int)startStreaming
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAP Send startStreaming", buf, 2u);
  }
  v9[0] = [(DoAPDevice *)self streamID];
  v9[1] = [(DoAPDevice *)self streamID] >> 8;
  int v4 = +[NSData dataWithBytesNoCopy:v9 length:2 freeWhenDone:0];
  if ([(DoAPDevice *)self state] == 2 || [(DoAPDevice *)self state] == 3)
  {
    id v5 = [(DoAPDevice *)self service];
    [v5 startStreaming:v4];

    objc_super v6 = self;
    objc_sync_enter(v6);
    [(DoAPDevice *)v6 doapStateSet:5];
    objc_sync_exit(v6);

    [(DoAPDevice *)v6 setHighPriorityLink:1 burstTime:&off_1000B7860];
    int v7 = 0;
  }
  else
  {
    int v7 = -536870195;
  }

  return v7;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 67109120;
    HIDWORD(v11) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAP Send stopStreaming %d", (uint8_t *)&v11, 8u);
  }
  LOBYTE(v11) = [(DoAPDevice *)self streamID];
  BYTE1(v11) = [(DoAPDevice *)self streamID] >> 8;
  BYTE2(v11) = v3;
  objc_super v6 = +[NSData dataWithBytesNoCopy:&v11 length:3 freeWhenDone:0];
  if ([(DoAPDevice *)self state] < 2)
  {
    int v9 = -536870198;
  }
  else
  {
    int v7 = [(DoAPDevice *)self service];
    [v7 stopStreaming:v6];

    int v8 = self;
    objc_sync_enter(v8);
    [(DoAPDevice *)v8 doapStateSet:6];
    objc_sync_exit(v8);

    int v9 = 0;
  }

  return v9;
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  int v4 = a4;
  int v5 = a3;
  int v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v14) = 67109376;
    HIDWORD(v14) = v5;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAP Send eventIndicator(%u) value(%u)", (uint8_t *)&v14, 0xEu);
  }
  LOBYTE(v14) = [(DoAPDevice *)self streamID];
  BYTE1(v14) = [(DoAPDevice *)self streamID] >> 8;
  BYTE2(v14) = v5;
  BYTE3(v14) = 1;
  BYTE4(v14) = v4;
  if ([(DoAPDevice *)self streamID] != 1)
  {
    if ([(DoAPDevice *)self streamID] == 2 && (_os_feature_enabled_impl() & 1) == 0)
    {
      uint64_t v11 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100075E54(v11);
      }
    }
    return 0;
  }
  int v8 = -536870198;
  if (v5 == 4)
  {
    if ([(DoAPDevice *)self state] >= 2 && [(DoAPDevice *)self state] <= 6)
    {
      int v9 = +[NSData dataWithBytesNoCopy:&v14 length:5 freeWhenDone:0];
      v10 = [(DoAPDevice *)self service];
      [v10 eventIndicator:v9];

      return 0;
    }
  }
  else
  {
    v12 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075DDC(v5, v12);
    }
  }
  return v8;
}

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DoAPDevice *)self service];
  [v7 setHighPriorityLink:v4 burstTime:v6];
}

- (id)allocQueue
{
  objc_super v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v3 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], v2);

  return v4;
}

- (id)doapStateNameFor:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u) {
    return @"Initialized";
  }
  else {
    return *(&off_1000B2598 + (char)(a3 - 1));
  }
}

- (void)doapStateSet:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(DoAPDevice *)self state] >= 3)
  {
    unsigned int v5 = [(DoAPDevice *)self state];
    if (v3 == 2 && v5 <= 6) {
      [(DoAPDevice *)self setHighPriorityLink:0 burstTime:0];
    }
  }
  id v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = [(DoAPDevice *)self peripheral];
    int v9 = [v8 identifier];
    v10 = [v9 UUIDString];
    uint64_t v11 = [(DoAPDevice *)self doapStateNameFor:[(DoAPDevice *)self state]];
    unsigned int v12 = [(DoAPDevice *)self state];
    v13 = [(DoAPDevice *)self doapStateNameFor:v3];
    int v14 = 138478851;
    __int16 v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAP state change for ID %{private}@: %{public}@ (%d) -> %{public}@ (%d)", (uint8_t *)&v14, 0x2Cu);
  }
  [(DoAPDevice *)self setState:v3];
}

- (DoAPServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end