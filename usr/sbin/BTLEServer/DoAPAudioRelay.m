@interface DoAPAudioRelay
- (BOOL)isHubConnected;
- (BOOL)isStreaming;
- (DoAPAudioRelay)initWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6 hub:(id)a7;
- (DoAPAudioRelayHub)hub;
- (DoAPAudioRelaySource)delegate;
- (NSDictionary)hidProperties;
- (NSString)identifier;
- (int64_t)deviceType;
- (unsigned)codec;
- (void)cancelStream;
- (void)handleResetStream;
- (void)handleStartStream;
- (void)handleStopStream;
- (void)invalidate;
- (void)publish;
- (void)sendAudioFrame:(id)a3;
- (void)sendMsg:(const char *)a3 args:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)startStream:(id)a3;
- (void)stopStream:(id)a3;
@end

@implementation DoAPAudioRelay

- (DoAPAudioRelay)initWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6 hub:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)DoAPAudioRelay;
  v16 = [(DoAPAudioRelay *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeWeak((id *)&v17->_hub, v15);
    v17->_isStreaming = 0;
    objc_storeStrong((id *)&v17->_hidProperties, a5);
    v17->_codec = a6;
    v17->_deviceType = a4;
  }

  return v17;
}

- (BOOL)isHubConnected
{
  v2 = self;
  v3 = [(DoAPAudioRelay *)self hub];
  LOBYTE(v2) = [v3 isXpcConnectedForDeviceType:v2->_deviceType];

  return (char)v2;
}

- (void)sendAudioFrame:(id)a3
{
  id v4 = a3;
  v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_1000706DC(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  CFStringRef v14 = @"kMsgArgData";
  id v15 = v4;
  id v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [(DoAPAudioRelay *)self sendMsg:"AudioFrame" args:v13];
}

- (void)invalidate
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send invalidate to AVVC", v4, 2u);
  }
  [(DoAPAudioRelay *)self sendMsg:"Unpublish" args:0];
}

- (void)cancelStream
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send cancelStream to AVVC", v4, 2u);
  }
  [(DoAPAudioRelay *)self sendMsg:"StreamDidCancel" args:0];
}

- (void)publish
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInteger:[(DoAPAudioRelay *)self deviceType]];
  [v3 setValue:v4 forKey:@"kMsgDeviceType"];

  v5 = [(DoAPAudioRelay *)self hidProperties];

  if (v5)
  {
    uint64_t v6 = [(DoAPAudioRelay *)self hidProperties];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"ProductID"];
    [v3 setValue:v7 forKey:@"kMsgPidNum"];
  }
  uint64_t v8 = [(DoAPAudioRelay *)self identifier];

  if (v8)
  {
    uint64_t v9 = [(DoAPAudioRelay *)self identifier];
    [v3 setValue:v9 forKey:@"kMsgArgIdentifier"];
  }
  if ([(DoAPAudioRelay *)self codec])
  {
    uint64_t v10 = +[NSNumber numberWithUnsignedChar:[(DoAPAudioRelay *)self codec]];
    [v3 setValue:v10 forKey:@"kMsgCodecType"];
  }
  uint64_t v11 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    id v13 = [v3 description];
    int v14 = 138412290;
    id v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send publish to AVVC %@", (uint8_t *)&v14, 0xCu);
  }
  [(DoAPAudioRelay *)self sendMsg:"Publish" args:v3];
}

- (void)handleStartStream
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FCD8;
  v2[3] = &unk_1000B1AC0;
  v2[4] = self;
  [(DoAPAudioRelay *)self startStream:v2];
}

- (void)handleStopStream
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FE38;
  v2[3] = &unk_1000B1AC0;
  v2[4] = self;
  [(DoAPAudioRelay *)self stopStream:v2];
}

- (void)handleResetStream
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - handleResetStream", v4, 2u);
  }
  [(DoAPAudioRelay *)self stopStream:&stru_1000B1B00];
}

- (void)startStream:(id)a3
{
  id v4 = a3;
  [(DoAPAudioRelay *)self setIsStreaming:1];
  v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100070714(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [(DoAPAudioRelay *)self delegate];
  [v13 doapAudioWillStart:v4];
}

- (void)stopStream:(id)a3
{
  id v4 = a3;
  [(DoAPAudioRelay *)self setIsStreaming:0];
  v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10007074C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [(DoAPAudioRelay *)self delegate];
  [v13 doapAudioDidStop:v4];
}

- (void)sendMsg:(const char *)a3 args:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [(DoAPAudioRelay *)self identifier];
  uint64_t v7 = +[NSMutableDictionary dictionaryWithObject:v6 forKey:@"kMsgArgIdentifier"];

  if (v10) {
    [v7 addEntriesFromDictionary:v10];
  }
  uint64_t v8 = [(DoAPAudioRelay *)self hub];
  uint64_t v9 = +[NSString stringWithUTF8String:a3];
  [v8 sendMsgIfCheckedIn:v9 args:v7 forClient:-[DoAPAudioRelay deviceType](self, "deviceType")];
}

- (DoAPAudioRelaySource)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DoAPAudioRelaySource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DoAPAudioRelayHub)hub
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hub);

  return (DoAPAudioRelayHub *)WeakRetained;
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)hidProperties
{
  return self->_hidProperties;
}

- (unsigned)codec
{
  return self->_codec;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidProperties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hub);

  objc_destroyWeak((id *)&self->_delegate);
}

@end