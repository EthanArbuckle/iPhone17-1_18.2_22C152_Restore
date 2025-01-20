@interface CarDataChannel
- (BOOL)isOpened;
- (CARSessionChannelProviding)channel;
- (CarDataChannel)initWithChannel:(id)a3 priority:(unint64_t)a4;
- (CarDataChannelDelegate)channelDelegate;
- (NSString)description;
- (NSTimer)reconnectTimer;
- (OS_dispatch_queue)inputQueue;
- (OS_dispatch_queue)outputQueue;
- (OS_dispatch_queue)workQueue;
- (unint64_t)priority;
- (void)_startConnection;
- (void)_stopConnection;
- (void)channel:(id)a3 didReceiveMessage:(id)a4;
- (void)didCloseChannel:(id)a3;
- (void)invalidate;
- (void)sendToPluginID:(id)a3 payload:(id)a4 withCompletion:(id)a5;
- (void)setChannel:(id)a3;
- (void)setChannelDelegate:(id)a3;
- (void)setInputQueue:(id)a3;
- (void)setIsOpened:(BOOL)a3;
- (void)setOutputQueue:(id)a3;
- (void)setReconnectTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CarDataChannel

- (CarDataChannel)initWithChannel:(id)a3 priority:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CarDataChannel;
  v8 = [(CarDataChannel *)&v16 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.caraccessoryd.CarDataChannel.Output", v10);
    outputQueue = v8->_outputQueue;
    v8->_outputQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.caraccessoryd.CarDataChannel.Input", v10);
    inputQueue = v8->_inputQueue;
    v8->_inputQueue = (OS_dispatch_queue *)v13;

    v8->_isOpened = 0;
    v8->_priority = a4;
    objc_storeStrong((id *)&v8->_channel, a3);
    [(CARSessionChannelProviding *)v8->_channel setChannelDelegate:v8];
  }
  return v8;
}

- (BOOL)isOpened
{
  unsigned int v3 = [(CARSessionChannelProviding *)self->_channel isOpened];
  if (v3) {
    LOBYTE(v3) = self->_isOpened;
  }
  return v3;
}

- (void)sendToPluginID:(id)a3 payload:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(CarDataChannel *)self outputQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke;
  v15[3] = &unk_100034FC8;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke(uint64_t a1)
{
  v12[0] = kCarDataProtocolKeyPluginID;
  v12[1] = kCarDataProtocolKeyPluginData;
  uint64_t v2 = *(void *)(a1 + 40);
  v13[0] = *(void *)(a1 + 32);
  v13[1] = v2;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = 0;
  v4 = +[NSData CAF_encodeCarDataFrom:v3 error:&v11];
  id v5 = v11;
  if (v5)
  {
    v6 = v5;
    id v7 = CAFDChannelLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) channel];
    unsigned __int8 v9 = [v8 sendChannelMessage:v4];

    if (v9)
    {
      v6 = 0;
    }
    else
    {
      v6 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:4 userInfo:0];
    }
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }
}

- (NSString)description
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(CarDataChannel *)self priority];
  if ([(CarDataChannel *)self isOpened]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  id v7 = [(CarDataChannel *)self channel];
  id v8 = [(CarDataChannel *)self channel];
  if ([v8 isOpened]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  uint64_t v10 = +[NSString stringWithFormat:@"<%@: %p priority=%lu isOpened=%@ channel=%p channel.isOpened=%@>", v4, self, v5, v6, v7, v9];

  return (NSString *)v10;
}

- (void)invalidate
{
  [(CarDataChannel *)self _stopConnection];

  [(CarDataChannel *)self setChannel:0];
}

- (void)_startConnection
{
  unsigned int v3 = [(CarDataChannel *)self inputQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__CarDataChannel__startConnection__block_invoke;
  block[3] = &unk_100034E68;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__CarDataChannel__startConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFDChannelLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__CarDataChannel__startConnection__block_invoke_cold_3();
  }

  v4 = *(void **)(a1 + 32);
  unsigned int v3 = (id *)(a1 + 32);
  unint64_t v5 = [v4 channel];
  unsigned int v6 = [v5 openChannel];

  if (v6)
  {
    [*v3 setIsOpened:1];
    id v7 = CAFDChannelLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __34__CarDataChannel__startConnection__block_invoke_cold_1();
    }

    id v8 = [*v3 channelDelegate];
    [v8 carDataChannelDidOpen:*v3];
  }
  else
  {
    CFStringRef v9 = CAFDChannelLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __34__CarDataChannel__startConnection__block_invoke_cold_2();
    }

    objc_initWeak(&location, *v3);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = __34__CarDataChannel__startConnection__block_invoke_38;
    id v14 = &unk_100034FF0;
    objc_copyWeak(&v15, &location);
    uint64_t v10 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v11 block:1.0];
    [*v3 setReconnectTimer:v10, v11, v12, v13, v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __34__CarDataChannel__startConnection__block_invoke_38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startConnection];
}

- (void)_stopConnection
{
}

id __33__CarDataChannel__stopConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFDChannelLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__CarDataChannel__stopConnection__block_invoke_cold_1();
  }

  unsigned int v3 = [*(id *)(a1 + 32) channel];
  [v3 setChannelDelegate:0];

  v4 = [*(id *)(a1 + 32) channel];
  [v4 closeChannel];

  unint64_t v5 = [*(id *)(a1 + 32) reconnectTimer];
  [v5 invalidate];

  return [*(id *)(a1 + 32) setReconnectTimer:0];
}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(CarDataChannel *)self inputQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __44__CarDataChannel_channel_didReceiveMessage___block_invoke;
  v8[3] = &unk_100034D60;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = 0;
  unsigned int v3 = [v2 CAF_decodeCarData:&v12];
  id v4 = v12;
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v4 || !v6)
  {
    id v8 = CAFDChannelLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_2();
    }
  }
  else
  {
    objc_opt_class();
    id v7 = [v6 objectForKey:kCarDataProtocolKeyPluginID];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    objc_opt_class();
    id v9 = [v6 objectForKey:kCarDataProtocolKeyPluginData];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v8 && v10)
    {
      id v11 = [*(id *)(a1 + 40) channelDelegate];
      [v11 carDataChannelDidReceive:*(void *)(a1 + 40) pluginID:v8 payload:v10];
    }
    else
    {
      id v11 = CAFDChannelLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_1();
      }
    }
  }
}

- (void)didCloseChannel:(id)a3
{
  id v4 = CAFDChannelLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CarDataChannel didCloseChannel:]((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }

  [(CarDataChannel *)self setIsOpened:0];
  id v11 = [(CarDataChannel *)self inputQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__CarDataChannel_didCloseChannel___block_invoke;
  block[3] = &unk_100034E68;
  block[4] = self;
  dispatch_async(v11, block);
}

void __34__CarDataChannel_didCloseChannel___block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFDChannelLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__CarDataChannel_didCloseChannel___block_invoke_cold_1();
  }

  unsigned int v3 = [*(id *)(a1 + 32) channel];
  [v3 setChannelDelegate:0];

  id v4 = [*(id *)(a1 + 32) reconnectTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setReconnectTimer:0];
  uint64_t v5 = [*(id *)(a1 + 32) channelDelegate];
  [v5 carDataChannelDidClose:*(void *)(a1 + 32)];
}

- (CarDataChannelDelegate)channelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_channelDelegate);

  return (CarDataChannelDelegate *)WeakRetained;
}

- (void)setChannelDelegate:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setIsOpened:(BOOL)a3
{
  self->_isOpened = a3;
}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSTimer)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
}

- (OS_dispatch_queue)inputQueue
{
  return self->_inputQueue;
}

- (void)setInputQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_destroyWeak((id *)&self->_channelDelegate);
}

void __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to package payload: %@", (uint8_t *)&v2, 0xCu);
}

void __34__CarDataChannel__startConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did open channel: %{public}@", v2, v3, v4, v5, v6);
}

void __34__CarDataChannel__startConnection__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to open channel %@, will retry later...", v1, 0xCu);
}

void __34__CarDataChannel__startConnection__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Starting channel %{public}@", v2, v3, v4, v5, v6);
}

void __33__CarDataChannel__stopConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Stopping channel (inputQueue) %{public}@", v2, v3, v4, v5, v6);
}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, v0, v1, "%{public}@ Received data message without pluginID or data: %@");
}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, v0, v1, "%{public}@ Error parsing data: %@");
}

- (void)didCloseChannel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __34__CarDataChannel_didCloseChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did close channel (inputQueue): %@", v2, v3, v4, v5, v6);
}

@end