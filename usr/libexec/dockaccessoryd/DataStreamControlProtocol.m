@interface DataStreamControlProtocol
- (BOOL)controlHandshakeComplete;
- (BOOL)helloMessageResponseReceived;
- (BOOL)isActive;
- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4;
- (DataStreamControlProtocol)initWithLogIdentifier:(id)a3;
- (NSNumber)peerDataStreamProtocolVersion;
- (NSNumber)pendingHelloMessageIdentifier;
- (NSString)logIdentifier;
- (void)_sendHelloMessageOnDataStream:(id)a3;
- (void)_sendVersionRequestOnDataStream:(id)a3;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidOpen:(id)a3;
- (void)setControlHandshakeComplete:(BOOL)a3;
- (void)setHelloMessageResponseReceived:(BOOL)a3;
- (void)setPeerDataStreamProtocolVersion:(id)a3;
- (void)setPendingHelloMessageIdentifier:(id)a3;
@end

@implementation DataStreamControlProtocol

- (DataStreamControlProtocol)initWithLogIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DataStreamControlProtocol;
  v5 = [(DataStreamControlProtocol *)&v12 init];
  v6 = v5;
  if (v5)
  {
    pendingHelloMessageIdentifier = v5->_pendingHelloMessageIdentifier;
    v5->_pendingHelloMessageIdentifier = 0;

    *(_WORD *)&v6->_helloMessageResponseReceived = 0;
    v8 = (NSString *)[v4 copy];
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = v8;

    peerDataStreamProtocolVersion = v6->_peerDataStreamProtocolVersion;
    v6->_peerDataStreamProtocolVersion = (NSNumber *)&off_100281710;
  }
  return v6;
}

- (BOOL)isActive
{
  return 1;
}

- (void)dataStreamDidOpen:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_100083FD0(v4);
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Sending hello control message", (uint8_t *)&v8, 0xCu);
  }
  [(DataStreamControlProtocol *)v4 _sendHelloMessageOnDataStream:v5];
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 isEqual:@"hello"])
  {
    v14 = self;
    v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = sub_100083FD0(v14);
      int v26 = 138543362;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Hello control message received", (uint8_t *)&v26, 0xCu);
    }
    [v10 sendResponseForRequestHeader:v12 payload:&__NSDictionary0__struct status:0 completion:&stru_100274608];
  }
  else
  {
    unsigned int v17 = [v11 isEqual:@"version"];
    v18 = self;
    v19 = sub_100083F74();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = sub_100083FD0(v18);
        int v26 = 138543362;
        v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Version control message received", (uint8_t *)&v26, 0xCu);
      }
      v22 = [v13 objectForKey:@"version"];

      if (v22)
      {
        uint64_t v23 = [v13 objectForKey:@"version"];
        peerDataStreamProtocolVersion = v18->_peerDataStreamProtocolVersion;
        v18->_peerDataStreamProtocolVersion = (NSNumber *)v23;
      }
      CFStringRef v30 = @"version";
      v31 = &off_100281700;
      v18 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v10 sendResponseForRequestHeader:v12 payload:v18 status:0 completion:&stru_100274628];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v25 = sub_100083FD0(v18);
        int v26 = 138543618;
        v27 = v25;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Control Protocol received unexpected request '%@'", (uint8_t *)&v26, 0x16u);
      }
    }
  }
}

- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4
{
  id v6 = a4;
  if (![a3 isEqual:@"hello"]) {
    goto LABEL_5;
  }
  v7 = [(DataStreamControlProtocol *)self pendingHelloMessageIdentifier];

  if (!v7) {
    goto LABEL_5;
  }
  int v8 = [v6 objectForKeyedSubscript:@"id"];
  v9 = [(DataStreamControlProtocol *)self pendingHelloMessageIdentifier];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"status"];
    unsigned __int8 v12 = [v11 isEqual:&off_1002816D0];
  }
  else
  {
LABEL_5:
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(DataStreamControlProtocol *)self isExpectedHelloControlMessage:v11 header:a5])
  {
    id v13 = self;
    v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sub_100083FD0(v13);
      int v26 = 138543362;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Hello control message reply received", (uint8_t *)&v26, 0xCu);
    }
    if (![(DataStreamControlProtocol *)v13 helloMessageResponseReceived])
    {
      v16 = [v12 objectForKey:@"capability-version"];

      if (v16) {
        [(DataStreamControlProtocol *)v13 _sendVersionRequestOnDataStream:v10];
      }
      else {
        v13->_controlHandshakeComplete = 1;
      }
    }
    [(DataStreamControlProtocol *)v13 setHelloMessageResponseReceived:1];
    [(DataStreamControlProtocol *)v13 setPendingHelloMessageIdentifier:0];
  }
  else
  {
    unsigned int v17 = [v11 isEqual:@"version"];
    v18 = self;
    v19 = sub_100083F74();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v20)
      {
        v21 = sub_100083FD0(v18);
        int v26 = 138543618;
        v27 = v21;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Received Peer Request Version Response %@", (uint8_t *)&v26, 0x16u);
      }
      v22 = [v12 objectForKey:@"version"];

      if (v22)
      {
        uint64_t v23 = [v12 objectForKey:@"version"];
        peerDataStreamProtocolVersion = v18->_peerDataStreamProtocolVersion;
        v18->_peerDataStreamProtocolVersion = (NSNumber *)v23;
      }
      v18->_controlHandshakeComplete = 1;
    }
    else
    {
      if (v20)
      {
        v25 = sub_100083FD0(v18);
        int v26 = 138543362;
        v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Expected hello reply or Version but got something else", (uint8_t *)&v26, 0xCu);
      }
    }
  }
}

- (void)_sendHelloMessageOnDataStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000140C8();
  id v6 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v5];
  [(DataStreamControlProtocol *)self setPendingHelloMessageIdentifier:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008977C;
  v7[3] = &unk_1002736C0;
  v7[4] = self;
  [v4 sendRequestForProtocol:@"control" topic:@"hello" identifier:v5 payload:&__NSDictionary0__struct completion:v7];
}

- (void)_sendVersionRequestOnDataStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000140C8();
  CFStringRef v8 = @"version";
  v9 = &off_100281700;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000899A0;
  v7[3] = &unk_1002736C0;
  v7[4] = self;
  [v4 sendRequestForProtocol:@"control" topic:@"version" identifier:v5 payload:v6 completion:v7];
}

- (BOOL)helloMessageResponseReceived
{
  return self->_helloMessageResponseReceived;
}

- (void)setHelloMessageResponseReceived:(BOOL)a3
{
  self->_helloMessageResponseReceived = a3;
}

- (NSNumber)peerDataStreamProtocolVersion
{
  return self->_peerDataStreamProtocolVersion;
}

- (void)setPeerDataStreamProtocolVersion:(id)a3
{
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)pendingHelloMessageIdentifier
{
  return self->_pendingHelloMessageIdentifier;
}

- (void)setPendingHelloMessageIdentifier:(id)a3
{
}

- (BOOL)controlHandshakeComplete
{
  return self->_controlHandshakeComplete;
}

- (void)setControlHandshakeComplete:(BOOL)a3
{
  self->_controlHandshakeComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);

  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, 0);
}

@end