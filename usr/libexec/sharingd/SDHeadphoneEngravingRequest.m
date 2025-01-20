@interface SDHeadphoneEngravingRequest
- (BOOL)btSessionAttaching;
- (BTSessionImpl)btSession;
- (NSString)bluetoothAddressString;
- (OS_dispatch_queue)dispatchQueue;
- (SDHeadphoneEngravingRequest)initWithBluetoothAddress:(id)a3;
- (id)completion;
- (void)cancel;
- (void)handleEngravingData:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setBtSessionAttaching:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)start;
@end

@implementation SDHeadphoneEngravingRequest

- (SDHeadphoneEngravingRequest)initWithBluetoothAddress:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SDHeadphoneEngravingRequest;
  id v3 = a3;
  v4 = [(SDHeadphoneEngravingRequest *)&v10 init];
  v5 = (NSString *)[v3 copyWithZone:v10.receiver];

  bluetoothAddressString = v4->_bluetoothAddressString;
  v4->_bluetoothAddressString = v5;

  uint64_t v7 = SFMainQueue();
  dispatchQueue = v4->_dispatchQueue;
  v4->_dispatchQueue = (OS_dispatch_queue *)v7;

  return v4;
}

- (void)start
{
  if (dword_1009670E0 <= 30 && (dword_1009670E0 != -1 || _LogCategory_Initialize()))
  {
    bluetoothAddressString = self->_bluetoothAddressString;
    LogPrintF();
  }
  id v3 = self;
  if (BTSessionAttachWithQueue()) {
    CFRelease(v3);
  }
  [(NSString *)v3->_bluetoothAddressString UTF8String];
  BTDeviceAddressFromString();
  BTDeviceFromAddress();
  BTAccessoryManagerGetDefault();
  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    if (dword_1009670E0 <= 90 && (dword_1009670E0 != -1 || _LogCategory_Initialize())) {
LABEL_14:
    }
      LogPrintF();
  }
  else if (BTAccessoryManagerSendCustomMessage() {
         && dword_1009670E0 <= 90
  }
         && (dword_1009670E0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_14;
  }
}

- (void)cancel
{
}

- (void)handleEngravingData:(id)a3
{
  id v4 = a3;
  v5 = [(SDHeadphoneEngravingRequest *)self completion];
  ((void (**)(void, id))v5)[2](v5, v4);

  [(SDHeadphoneEngravingRequest *)self cancel];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)btSessionAttaching
{
  return self->_btSessionAttaching;
}

- (void)setBtSessionAttaching:(BOOL)a3
{
  self->_btSessionAttaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end