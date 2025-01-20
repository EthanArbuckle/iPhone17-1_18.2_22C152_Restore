@interface MILockdownConnection
- (MILockdownConnection)initWithLockdownInfo:(void *)a3;
- (void)handleCancel;
- (void)readFromService;
- (void)sendData:(id)a3;
@end

@implementation MILockdownConnection

- (MILockdownConnection)initWithLockdownInfo:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MILockdownConnection;
  v4 = [(MIConnection *)&v10 initWithType:1];
  if (v4)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, a3);
    int v6 = secure_lockdown_checkin();
    CFRelease(Mutable);
    if (!v6)
    {
      if (v4->_lockdown)
      {
        v7 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v4 selector:"readFromService" object:0];
        readThread = v4->_readThread;
        v4->_readThread = v7;

        [(NSThread *)v4->_readThread start];
      }
    }
  }
  return v4;
}

- (void)readFromService
{
  while (1)
  {
    CFTypeRef cf = 0;
    int v4 = lockdown_receive_message();
    CFDictionaryRef v5 = (const __CFDictionary *)cf;
    int v6 = +[NSThread currentThread];
    unsigned __int8 v7 = [v6 isCancelled];

    if (v7) {
      break;
    }
    if (v4)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000226C;
      v21[3] = &unk_100004258;
      v21[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
      break;
    }
    Value = CFDictionaryGetValue(v5, @"MIPartialMessageKey");
    if (Value)
    {
      v9 = Value;
      incomingData = self->_incomingData;
      if (incomingData)
      {
        [(NSMutableData *)incomingData appendData:v9];
      }
      else
      {
        v14 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithData:v9];
        v15 = self->_incomingData;
        self->_incomingData = v14;
      }
      CFRelease(cf);
    }
    else
    {
      v11 = (NSMutableData *)CFDictionaryGetValue(v5, @"MIFinalMessageKey");
      v12 = self->_incomingData;
      if (v11)
      {
        if (v12)
        {
          [(NSMutableData *)v12 appendData:v11];
          v13 = self->_incomingData;
        }
        else
        {
          v13 = 0;
        }
        if (!v13) {
          v13 = v11;
        }
        v16 = v13;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100002274;
        block[3] = &unk_100004280;
        block[4] = self;
        v20 = v16;
        v17 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        CFRelease(cf);
        v18 = self->_incomingData;
        self->_incomingData = 0;
      }
      else
      {
        self->_incomingData = 0;
      }
    }
  }
}

- (void)handleCancel
{
  readThread = self->_readThread;
  if (readThread)
  {
    [(NSThread *)readThread cancel];
    int v4 = self->_readThread;
    self->_readThread = 0;
  }
  if (self->_lockdown)
  {
    lockdown_disconnect();
    self->_lockdown = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002380;
  block[3] = &unk_100004258;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 length];
  id v15 = v4;
  int v6 = (char *)[v15 bytes];
  if (v5 >= 1)
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      if (v5 - v8 >= 8096) {
        uint64_t v9 = 8096;
      }
      else {
        uint64_t v9 = v5 - v8;
      }
      objc_super v10 = +[NSData dataWithBytesNoCopy:&v7[v8] length:v9 freeWhenDone:0];
      v8 += v9;
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v12 = Mutable;
      if (v8 >= v5) {
        CFStringRef v13 = @"MIFinalMessageKey";
      }
      else {
        CFStringRef v13 = @"MIPartialMessageKey";
      }
      CFDictionarySetValue(Mutable, v13, v10);
      int v14 = lockdown_send_message();
      if (v12) {
        CFRelease(v12);
      }
      if (v14) {
        break;
      }

      if (v8 >= v5) {
        goto LABEL_15;
      }
    }
    [(MILockdownConnection *)self handleCancel];
  }
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingData, 0);
  objc_storeStrong((id *)&self->_readThread, 0);
}

@end