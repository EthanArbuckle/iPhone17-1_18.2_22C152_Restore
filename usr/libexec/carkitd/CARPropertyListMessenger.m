@interface CARPropertyListMessenger
- (CARPropertyListMessageReceiving)messageReceiver;
- (CARPropertyListMessenger)init;
- (NSMutableData)receiveBuffer;
- (OS_dispatch_queue)receiveQueue;
- (id)dataForMessageWithIdentifier:(unsigned __int16)a3 contents:(id)a4 error:(id *)a5;
- (void)handleReceivedData:(id)a3;
- (void)setMessageReceiver:(id)a3;
@end

@implementation CARPropertyListMessenger

- (CARPropertyListMessenger)init
{
  v9.receiver = self;
  v9.super_class = (Class)CARPropertyListMessenger;
  v2 = [(CARPropertyListMessenger *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.carkit.plist_messenger_receive", v3);
    receiveQueue = v2->_receiveQueue;
    v2->_receiveQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMutableData data];
    receiveBuffer = v2->_receiveBuffer;
    v2->_receiveBuffer = (NSMutableData *)v6;
  }
  return v2;
}

- (id)dataForMessageWithIdentifier:(unsigned __int16)a3 contents:(id)a4 error:(id *)a5
{
  unsigned int v6 = a3;
  id v7 = a4;
  int v19 = 0;
  Data = (void *)OPACKEncoderCreateData();
  objc_super v9 = Data;
  if (Data)
  {
    if ((unint64_t)[Data length] <= 0x100000)
    {
      unsigned int v15 = [v9 length];
      v14 = +[NSMutableData data];
      __int16 v18 = __rev16(v6);
      [v14 appendBytes:&v18 length:2];
      unsigned int v17 = bswap32(v15);
      [v14 appendBytes:&v17 length:4];
      [v14 appendData:v9];
      goto LABEL_14;
    }
    v10 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100076630();
    }

    if (a5)
    {
      CFStringRef v11 = @"com.apple.carkit";
      uint64_t v12 = 4;
LABEL_11:
      +[NSError errorWithDomain:v11 code:v12 userInfo:0];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {
    v13 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000765B4(&v19, (uint64_t)v7, v13);
    }

    uint64_t v12 = v19;
    if (v19)
    {
      CFStringRef v11 = (const __CFString *)NSOSStatusErrorDomain;
      goto LABEL_11;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)handleReceivedData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CARPropertyListMessenger *)self receiveQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10006717C;
    v6[3] = &unk_1000BD3A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (CARPropertyListMessageReceiving)messageReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageReceiver);

  return (CARPropertyListMessageReceiving *)WeakRetained;
}

- (void)setMessageReceiver:(id)a3
{
}

- (OS_dispatch_queue)receiveQueue
{
  return self->_receiveQueue;
}

- (NSMutableData)receiveBuffer
{
  return self->_receiveBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveBuffer, 0);
  objc_storeStrong((id *)&self->_receiveQueue, 0);

  objc_destroyWeak((id *)&self->_messageReceiver);
}

@end