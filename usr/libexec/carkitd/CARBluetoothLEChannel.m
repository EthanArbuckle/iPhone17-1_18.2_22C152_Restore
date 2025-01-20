@interface CARBluetoothLEChannel
- (BOOL)isOpen;
- (CARBluetoothLEChannel)initWithService:(id)a3 channel:(id)a4;
- (CARBluetoothLEChannelDelegate)channelDelegate;
- (CARBluetoothLEService)service;
- (CBL2CAPChannel)channel;
- (void)_handleChannelOpened;
- (void)_handleEndedStream:(id)a3;
- (void)_handleErrorOnStream:(id)a3;
- (void)_handleHasBytesAvailableOnStream:(id)a3;
- (void)_serviceQueue_handleChannelClosed;
- (void)dealloc;
- (void)sendData:(id)a3;
- (void)setChannelDelegate:(id)a3;
- (void)setOpen:(BOOL)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation CARBluetoothLEChannel

- (CARBluetoothLEChannel)initWithService:(id)a3 channel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CARBluetoothLEChannel;
  v8 = [(CARBluetoothLEChannel *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_channel, a4);
    v9->_open = 0;
    v10 = [v7 inputStream];
    [v10 setDelegate:v9];

    v11 = [v7 inputStream];
    v12 = +[NSRunLoop mainRunLoop];
    [v11 scheduleInRunLoop:v12 forMode:NSDefaultRunLoopMode];

    v13 = [v7 inputStream];
    [v13 open];

    v14 = [v7 outputStream];
    [v14 setDelegate:v9];

    v15 = [v7 outputStream];
    v16 = +[NSRunLoop mainRunLoop];
    [v15 scheduleInRunLoop:v16 forMode:NSDefaultRunLoopMode];

    v17 = [v7 outputStream];
    [v17 open];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(CARBluetoothLEChannel *)self channel];
  v4 = [v3 inputStream];

  if (v4)
  {
    v5 = +[NSRunLoop mainRunLoop];
    [v4 removeFromRunLoop:v5 forMode:NSDefaultRunLoopMode];
  }
  id v6 = [(CARBluetoothLEChannel *)self channel];
  id v7 = [v6 outputStream];

  if (v7)
  {
    v8 = +[NSRunLoop mainRunLoop];
    [v7 removeFromRunLoop:v8 forMode:NSDefaultRunLoopMode];
  }
  v9.receiver = self;
  v9.super_class = (Class)CARBluetoothLEChannel;
  [(CARBluetoothLEChannel *)&v9 dealloc];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  v5 = [(CARBluetoothLEChannel *)self service];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C724;
  v8[3] = &unk_1000BD3A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_handleChannelOpened
{
  v3 = [(CARBluetoothLEChannel *)self service];
  id v4 = [v3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C9AC;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_handleHasBytesAvailableOnStream:(id)a3
{
  id v4 = a3;
  v5 = [(CARBluetoothLEChannel *)self service];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CC50;
  v8[3] = &unk_1000BD3A8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_handleErrorOnStream:(id)a3
{
  id v4 = a3;
  v5 = [(CARBluetoothLEChannel *)self service];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CEDC;
  v8[3] = &unk_1000BD3A8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_handleEndedStream:(id)a3
{
  id v4 = a3;
  v5 = [(CARBluetoothLEChannel *)self service];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D0A8;
  v8[3] = &unk_1000BD3A8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_serviceQueue_handleChannelClosed
{
  v3 = [(CARBluetoothLEChannel *)self service];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if ([(CARBluetoothLEChannel *)self isOpen])
  {
    v5 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "L2CAP channel closed", v14, 2u);
    }

    [(CARBluetoothLEChannel *)self setOpen:0];
    id v6 = [(CARBluetoothLEChannel *)self service];
    id v7 = [v6 serviceDelegate];

    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = [(CARBluetoothLEChannel *)self service];
      [v7 bluetoothLEService:v8 didCloseChannel:self];
    }
    id v9 = [(CARBluetoothLEChannel *)self service];
    v10 = [v9 currentConnectionState];
    v11 = [v10 serviceChannel];
    unsigned int v12 = [(CARBluetoothLEChannel *)self isEqual:v11];

    if (v12)
    {
      v13 = [(CARBluetoothLEChannel *)self service];
      [v13 setCurrentConnectionState:0];
    }
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stream: %@ handleEvent: %lu", (uint8_t *)&v8, 0x16u);
  }

  if ((uint64_t)a4 > 7)
  {
    if (a4 == 8)
    {
      [(CARBluetoothLEChannel *)self _handleErrorOnStream:v6];
    }
    else if (a4 == 16)
    {
      [(CARBluetoothLEChannel *)self _handleEndedStream:v6];
    }
  }
  else if (a4 == 1)
  {
    [(CARBluetoothLEChannel *)self _handleChannelOpened];
  }
  else if (a4 == 2)
  {
    [(CARBluetoothLEChannel *)self _handleHasBytesAvailableOnStream:v6];
  }
}

- (CARBluetoothLEChannelDelegate)channelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_channelDelegate);

  return (CARBluetoothLEChannelDelegate *)WeakRetained;
}

- (void)setChannelDelegate:(id)a3
{
}

- (CARBluetoothLEService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (CARBluetoothLEService *)WeakRetained;
}

- (CBL2CAPChannel)channel
{
  return self->_channel;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_destroyWeak((id *)&self->_service);

  objc_destroyWeak((id *)&self->_channelDelegate);
}

@end