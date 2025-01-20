@interface RPNearbyActionV2Advertiser
- (CBAdvertiser)actionV2Advertiser;
- (NSData)targetData;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (unsigned)nearbyActionType;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setActionV2Advertiser:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setTargetData:(id)a3;
@end

@implementation RPNearbyActionV2Advertiser

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (CBAdvertiser *)objc_alloc_init(off_100142408());
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = v5;

  [(CBAdvertiser *)self->_actionV2Advertiser setDispatchQueue:self->_dispatchQueue];
  [(CBAdvertiser *)self->_actionV2Advertiser setNearbyActionV2Type:self->_nearbyActionType];
  if (self->_targetData)
  {
    [(CBAdvertiser *)self->_actionV2Advertiser setNearbyActionV2Flags:1];
    [(CBAdvertiser *)self->_actionV2Advertiser setNearbyActionV2TargetData:self->_targetData];
  }
  [(CBAdvertiser *)self->_actionV2Advertiser setAdvertiseRate:60];
  [(CBAdvertiser *)self->_actionV2Advertiser setLabel:@"CLink"];
  v7 = self->_actionV2Advertiser;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008DB1C;
  v9[3] = &unk_100122D28;
  id v10 = v4;
  id v8 = v4;
  [(CBAdvertiser *)v7 activateWithCompletion:v9];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142398 <= 30 && (dword_100142398 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CBAdvertiser *)self->_actionV2Advertiser invalidate];
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = 0;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int nearbyActionType = self->_nearbyActionType;
  if (nearbyActionType == v3) {
    return;
  }
  if (dword_100142398 <= 30)
  {
    if (dword_100142398 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_6;
      }
      unsigned int nearbyActionType = self->_nearbyActionType;
    }
    sub_10008DD9C(nearbyActionType);
    sub_10008DD9C(v3);
    LogPrintF();
  }
LABEL_6:
  self->_unsigned int nearbyActionType = v3;
  actionV2Advertiser = self->_actionV2Advertiser;

  [(CBAdvertiser *)actionV2Advertiser setNearbyActionV2Type:v3];
}

- (void)setTargetData:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self->_targetData;
  v7 = (NSData *)v5;
  id v10 = v7;
  if (v6 == v7)
  {

LABEL_12:
    v9 = v10;
    goto LABEL_13;
  }
  if ((v7 != 0) == (v6 == 0))
  {

LABEL_7:
    if (dword_100142398 <= 30 && (dword_100142398 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_targetData, a3);
    [(CBAdvertiser *)self->_actionV2Advertiser setNearbyActionV2TargetData:self->_targetData];
    goto LABEL_12;
  }
  unsigned __int8 v8 = [(NSData *)v6 isEqual:v7];

  v9 = v10;
  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_13:
}

- (id)description
{
  NSAppendPrintF();
  id v8 = 0;
  sub_10008DD9C(self->_nearbyActionType);
  NSAppendPrintF();
  id v3 = v8;

  targetData = self->_targetData;
  if (targetData)
  {
    id v5 = targetData;
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (NSData)targetData
{
  return self->_targetData;
}

- (CBAdvertiser)actionV2Advertiser
{
  return self->_actionV2Advertiser;
}

- (void)setActionV2Advertiser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_targetData, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end