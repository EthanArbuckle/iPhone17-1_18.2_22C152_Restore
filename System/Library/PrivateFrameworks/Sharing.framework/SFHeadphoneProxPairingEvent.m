@interface SFHeadphoneProxPairingEvent
+ (NSString)eventName;
- (BOOL)attemptedPairing;
- (NSDictionary)eventPayload;
- (NSString)productIDString;
- (double)assetFetchDuration;
- (double)foundToFirstCardDuration;
- (double)pairingDuration;
- (double)triggerToFirstCardDuration;
- (int64_t)errorCode;
- (int64_t)pairingType;
- (unsigned)color;
- (unsigned)productID;
- (void)setAssetFetchDuration:(double)a3;
- (void)setAttemptedPairing:(BOOL)a3;
- (void)setColor:(unsigned __int8)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setFoundToFirstCardDuration:(double)a3;
- (void)setPairingDuration:(double)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductIDString:(id)a3;
- (void)setTriggerToFirstCardDuration:(double)a3;
- (void)submitEvent;
@end

@implementation SFHeadphoneProxPairingEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.HeadphoneProxPairing";
}

- (NSDictionary)eventPayload
{
  v22[10] = *MEMORY[0x1E4F143B8];
  v21[0] = @"errorCode";
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFHeadphoneProxPairingEvent errorCode](self, "errorCode"));
  v22[0] = v20;
  v21[1] = @"pairingType";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFHeadphoneProxPairingEvent pairingType](self, "pairingType"));
  v22[1] = v3;
  v21[2] = @"attemptedPairing";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SFHeadphoneProxPairingEvent attemptedPairing](self, "attemptedPairing"));
  v22[2] = v4;
  v21[3] = @"pairingDuration";
  v5 = NSNumber;
  [(SFHeadphoneProxPairingEvent *)self pairingDuration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v22[3] = v6;
  v21[4] = @"foundToFirstCardDuration";
  v7 = NSNumber;
  [(SFHeadphoneProxPairingEvent *)self foundToFirstCardDuration];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v22[4] = v8;
  v21[5] = @"triggerToFirstCardDuration";
  v9 = NSNumber;
  [(SFHeadphoneProxPairingEvent *)self triggerToFirstCardDuration];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v22[5] = v10;
  v21[6] = @"assetFetchDuration";
  v11 = NSNumber;
  [(SFHeadphoneProxPairingEvent *)self assetFetchDuration];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v22[6] = v12;
  v21[7] = @"color";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SFHeadphoneProxPairingEvent color](self, "color"));
  v22[7] = v13;
  v21[8] = @"productID";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFHeadphoneProxPairingEvent productID](self, "productID"));
  v22[8] = v14;
  v21[9] = @"productIDString";
  uint64_t v15 = [(SFHeadphoneProxPairingEvent *)self productIDString];
  v16 = (void *)v15;
  v17 = &stru_1EF9BDC68;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v22[9] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:10];

  return (NSDictionary *)v18;
}

- (void)submitEvent
{
  id v4 = +[SFHeadphoneProxPairingEvent eventName];
  v3 = [(SFHeadphoneProxPairingEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)attemptedPairing
{
  return self->_attemptedPairing;
}

- (void)setAttemptedPairing:(BOOL)a3
{
  self->_attemptedPairing = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (double)pairingDuration
{
  return self->_pairingDuration;
}

- (void)setPairingDuration:(double)a3
{
  self->_pairingDuration = a3;
}

- (double)foundToFirstCardDuration
{
  return self->_foundToFirstCardDuration;
}

- (void)setFoundToFirstCardDuration:(double)a3
{
  self->_foundToFirstCardDuration = a3;
}

- (double)triggerToFirstCardDuration
{
  return self->_triggerToFirstCardDuration;
}

- (void)setTriggerToFirstCardDuration:(double)a3
{
  self->_triggerToFirstCardDuration = a3;
}

- (double)assetFetchDuration
{
  return self->_assetFetchDuration;
}

- (void)setAssetFetchDuration:(double)a3
{
  self->_assetFetchDuration = a3;
}

- (unsigned)color
{
  return self->_color;
}

- (void)setColor:(unsigned __int8)a3
{
  self->_color = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (NSString)productIDString
{
  return self->_productIDString;
}

- (void)setProductIDString:(id)a3
{
  self->_productIDString = (NSString *)a3;
}

@end