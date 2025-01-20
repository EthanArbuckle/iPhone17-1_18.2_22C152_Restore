@interface UARemotePasteboardTypeInfoRequestedEvent
- (id)eventName;
- (id)eventPayload;
- (int64_t)errorCode;
- (unint64_t)payloadSize;
- (unint64_t)payloadXferTime;
- (void)setErrorCode:(int64_t)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setPayloadXferTime:(unint64_t)a3;
@end

@implementation UARemotePasteboardTypeInfoRequestedEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.TypesRequested";
}

- (id)eventPayload
{
  v8[0] = @"payloadSize";
  v3 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardTypeInfoRequestedEvent *)self payloadSize]];
  v9[0] = v3;
  v8[1] = @"transferTime";
  v4 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardTypeInfoRequestedEvent *)self payloadXferTime]];
  v9[1] = v4;
  v8[2] = @"errorCode";
  v5 = +[NSNumber numberWithLongLong:[(UARemotePasteboardTypeInfoRequestedEvent *)self errorCode]];
  v9[2] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
}

- (unint64_t)payloadXferTime
{
  return self->_payloadXferTime;
}

- (void)setPayloadXferTime:(unint64_t)a3
{
  self->_payloadXferTime = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end