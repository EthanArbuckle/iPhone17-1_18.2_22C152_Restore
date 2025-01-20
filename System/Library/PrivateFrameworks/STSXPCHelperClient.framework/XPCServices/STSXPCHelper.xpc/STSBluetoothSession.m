@interface STSBluetoothSession
- (BOOL)isConnected;
- (void)altCarrierSendData:(id)a3 completion:(id)a4;
- (void)connectionEstablishmentTimedout;
- (void)sessionTimedout;
@end

@implementation STSBluetoothSession

- (void)altCarrierSendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(STSBluetoothSession *)self isConnected])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSBluetoothSession altCarrierSendData:completion:]", 293, self, &stru_100055900, v8, v9, v20);
    CFStringRef v22 = @"responseSize";
    v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 length]);
    v23 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

    v12 = +[STSAnalyticsLogger sharedCALogger];
    [v12 postISOTransactionEvent:v11 prepOnly:1];

    if (self)
    {
      switch(self->_type)
      {
        case 0uLL:
          if ((sub_1000304AC(self->_readerCentralInstance, (uint64_t)v6) & 1) == 0) {
            goto LABEL_17;
          }
          break;
        case 1uLL:
          if ((sub_100009900(self->_readerPeripheralInstance, (uint64_t)v6) & 1) == 0) {
            goto LABEL_17;
          }
          break;
        case 2uLL:
          if ((sub_100030424(self->_isoCentralInstance, (uint64_t)v6) & 1) == 0) {
            goto LABEL_17;
          }
          break;
        case 3uLL:
          if ((sub_100018E08(self->_isoPeripheralInstance, (uint64_t)v6) & 1) == 0) {
            goto LABEL_17;
          }
          break;
        default:
          NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
          v25 = off_100066160;
          v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          uint64_t v18 = 2;
          goto LABEL_18;
      }
      if (self->_sendCompletionHandler)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSBluetoothSession altCarrierSendData:completion:]", 325, self, @"Flush last completion handler", v14, v15, v21);
        (*((void (**)(void))self->_sendCompletionHandler + 2))();
      }
      objc_setProperty_nonatomic_copy(self, v13, v7, 80);
    }
    else if ((sub_1000304AC(0, (uint64_t)v6) & 1) == 0)
    {
LABEL_17:
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      v25 = off_1000661C8;
      v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v18 = 15;
LABEL_18:
      v19 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v18 userInfo:v17];

      (*((void (**)(id, void *))v7 + 2))(v7, v19);
    }
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSBluetoothSession altCarrierSendData:completion:]", 288, self, @"Not connected", v8, v9, v20);
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v25 = off_100066190;
    v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v11 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:8 userInfo:v16];

    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)connectionEstablishmentTimedout
{
  if (self)
  {
    [(ISO18013_3_Central *)self->_readerCentralInstance invalidateAndUpdateStateSignal:1 reason:3];
    [(ReaderPeripheral *)self->_readerPeripheralInstance invalidateAndUpdateStateSignal:1 reason:3];
    [(ISO18013_3_Central *)self->_isoCentralInstance invalidateAndUpdateStateSignal:1 reason:3];
    isoPeripheralInstance = self->_isoPeripheralInstance;
  }
  else
  {
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    isoPeripheralInstance = 0;
  }

  [(ISO18013_3_Peripheral *)isoPeripheralInstance invalidateAndUpdateStateSignal:1 reason:3];
}

- (void)sessionTimedout
{
  if (self)
  {
    [(ISO18013_3_Central *)self->_readerCentralInstance invalidateAndUpdateStateSignal:1 reason:3];
    [(ReaderPeripheral *)self->_readerPeripheralInstance invalidateAndUpdateStateSignal:1 reason:3];
    [(ISO18013_3_Central *)self->_isoCentralInstance invalidateAndUpdateStateSignal:1 reason:3];
    isoPeripheralInstance = self->_isoPeripheralInstance;
  }
  else
  {
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    [0 invalidateAndUpdateStateSignal:1 reason:3];
    isoPeripheralInstance = 0;
  }

  [(ISO18013_3_Peripheral *)isoPeripheralInstance invalidateAndUpdateStateSignal:1 reason:3];
}

- (BOOL)isConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btProcessingQueue, 0);
  objc_storeStrong(&self->_sendCompletionHandler, 0);
  objc_storeStrong((id *)&self->_isoPeripheralInstance, 0);
  objc_storeStrong((id *)&self->_isoCentralInstance, 0);
  objc_storeStrong((id *)&self->_readerPeripheralInstance, 0);
  objc_storeStrong((id *)&self->_readerCentralInstance, 0);
  objc_destroyWeak((id *)&self->_carrierListener);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end