@interface PDVehicleConnectionSession
- (BOOL)sendData:(id)a3 error:(id *)a4;
- (NSString)sessionIdentifier;
- (id)initForSecureElementPass:(id)a3 delegate:(id)a4;
- (void)_sessionDidFailToConnect;
- (void)dealloc;
- (void)endSession;
- (void)session:(id)a3 didReceivePassthroughMessage:(id)a4;
- (void)session:(id)a3 event:(id)a4;
- (void)startSessionWithCompletion:(id)a3;
@end

@implementation PDVehicleConnectionSession

- (id)initForSecureElementPass:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDVehicleConnectionSession;
  v9 = [(PDVehicleConnectionSession *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v7 devicePrimaryPaymentApplication];
    paymentApplication = v9->_paymentApplication;
    v9->_paymentApplication = (PKPaymentApplication *)v10;

    objc_storeStrong((id *)&v9->_secureElementPass, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.passd.vehicleconnectionsession", v13);
    vehicleConnectionSessionQueue = v9->_vehicleConnectionSessionQueue;
    v9->_vehicleConnectionSessionQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.vehicleconnectionsession.reply", v13);
    replyQueue = v9->_replyQueue;
    v9->_replyQueue = (OS_dispatch_queue *)v16;
  }
  return v9;
}

- (void)dealloc
{
  digitalCarKeySession = self->_digitalCarKeySession;
  if (digitalCarKeySession) {
    [(NFDigitalCarKeySession *)digitalCarKeySession endSession];
  }
  v4.receiver = self;
  v4.super_class = (Class)PDVehicleConnectionSession;
  [(PDVehicleConnectionSession *)&v4 dealloc];
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  vehicleConnectionSessionQueue = self->_vehicleConnectionSessionQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004839A4;
  v10[3] = &unk_100732368;
  v10[4] = self;
  id v11 = v6;
  v12 = &v14;
  v13 = a4;
  id v8 = v6;
  dispatch_sync(vehicleConnectionSessionQueue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)startSessionWithCompletion:(id)a3
{
  id v4 = a3;
  vehicleConnectionSessionQueue = self->_vehicleConnectionSessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100483AC8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(vehicleConnectionSessionQueue, v7);
}

- (void)endSession
{
  vehicleConnectionSessionQueue = self->_vehicleConnectionSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10048413C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_sync(vehicleConnectionSessionQueue, block);
}

- (void)session:(id)a3 didReceivePassthroughMessage:(id)a4
{
  id v5 = a4;
  replyQueue = self->_replyQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100484254;
  v8[3] = &unk_10072E198;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(replyQueue, v8);
}

- (void)session:(id)a3 event:(id)a4
{
  id v5 = a4;
  replyQueue = self->_replyQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004843A8;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(replyQueue, v8);
}

- (void)_sessionDidFailToConnect
{
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10048457C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(replyQueue, block);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_vehicleConnectionSessionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_digitalCarKeySession, 0);
  objc_storeStrong((id *)&self->_digitalCarKeySessionHandle, 0);
}

@end