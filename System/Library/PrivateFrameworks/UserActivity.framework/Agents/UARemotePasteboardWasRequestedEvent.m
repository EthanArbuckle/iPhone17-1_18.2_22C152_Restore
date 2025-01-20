@interface UARemotePasteboardWasRequestedEvent
- (BOOL)cancelled;
- (BOOL)isAsyncTransfer;
- (BOOL)isFileCopy;
- (BOOL)usedStreams;
- (NSString)remoteDeviceType;
- (id)eventName;
- (id)eventPayload;
- (int64_t)errorCode;
- (int64_t)numberOfItems;
- (int64_t)underlyingErrorCode;
- (unint64_t)payloadSize;
- (unint64_t)payloadXferSpeed;
- (unint64_t)payloadXferTime;
- (unint64_t)streamDataSize;
- (unint64_t)streamDataXferSpeed;
- (unint64_t)streamDataXferTime;
- (unint64_t)streamOpenTime;
- (unint64_t)totalTime;
- (void)setCancelled:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setIsAsyncTransfer:(BOOL)a3;
- (void)setIsFileCopy:(BOOL)a3;
- (void)setNumberOfItems:(int64_t)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setPayloadXferSpeed:(unint64_t)a3;
- (void)setPayloadXferTime:(unint64_t)a3;
- (void)setRemoteDeviceType:(id)a3;
- (void)setStreamDataSize:(unint64_t)a3;
- (void)setStreamDataXferSpeed:(unint64_t)a3;
- (void)setStreamDataXferTime:(unint64_t)a3;
- (void)setStreamOpenTime:(unint64_t)a3;
- (void)setTotalTime:(unint64_t)a3;
- (void)setUnderlyingErrorCode:(int64_t)a3;
- (void)setUsedStreams:(BOOL)a3;
@end

@implementation UARemotePasteboardWasRequestedEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.Requested";
}

- (id)eventPayload
{
  v23[0] = @"payloadSize";
  v22 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self payloadSize]];
  v24[0] = v22;
  v23[1] = @"transferTime";
  v21 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self payloadXferTime]];
  v24[1] = v21;
  v23[2] = @"transferSpeed";
  v20 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self payloadXferSpeed]];
  v24[2] = v20;
  v23[3] = @"usedStreams";
  v19 = +[NSNumber numberWithBool:[(UARemotePasteboardWasRequestedEvent *)self usedStreams]];
  v24[3] = v19;
  v23[4] = @"streamOpenTime";
  v18 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self streamOpenTime]];
  v24[4] = v18;
  v23[5] = @"streamDataSize";
  v17 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self streamDataSize]];
  v24[5] = v17;
  v23[6] = @"streamTransferTime";
  v16 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self streamDataXferTime]];
  v24[6] = v16;
  v23[7] = @"streamTransferSpeed";
  v3 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self streamDataXferSpeed]];
  v24[7] = v3;
  v23[8] = @"totalTime";
  v4 = +[NSNumber numberWithUnsignedLongLong:[(UARemotePasteboardWasRequestedEvent *)self totalTime]];
  v24[8] = v4;
  v23[9] = @"cancelled";
  v5 = +[NSNumber numberWithBool:[(UARemotePasteboardWasRequestedEvent *)self cancelled]];
  v24[9] = v5;
  v23[10] = @"errorCode";
  v6 = +[NSNumber numberWithLongLong:[(UARemotePasteboardWasRequestedEvent *)self errorCode]];
  v24[10] = v6;
  v23[11] = @"underlyingErrorCode";
  v7 = +[NSNumber numberWithLongLong:[(UARemotePasteboardWasRequestedEvent *)self underlyingErrorCode]];
  v24[11] = v7;
  v23[12] = @"numberOfItems";
  v8 = +[NSNumber numberWithLongLong:[(UARemotePasteboardWasRequestedEvent *)self numberOfItems]];
  v24[12] = v8;
  v23[13] = @"isFileCopy";
  v9 = +[NSNumber numberWithBool:[(UARemotePasteboardWasRequestedEvent *)self isFileCopy]];
  v24[13] = v9;
  v23[14] = @"isAsyncTransfer";
  v10 = +[NSNumber numberWithBool:[(UARemotePasteboardWasRequestedEvent *)self isAsyncTransfer]];
  v24[14] = v10;
  v23[15] = @"remoteDeviceType";
  uint64_t v11 = [(UARemotePasteboardWasRequestedEvent *)self remoteDeviceType];
  v12 = (void *)v11;
  CFStringRef v13 = @"Unknown";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  v24[15] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:16];

  return v14;
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

- (unint64_t)payloadXferSpeed
{
  return self->_payloadXferSpeed;
}

- (void)setPayloadXferSpeed:(unint64_t)a3
{
  self->_payloadXferSpeed = a3;
}

- (BOOL)usedStreams
{
  return self->_usedStreams;
}

- (void)setUsedStreams:(BOOL)a3
{
  self->_usedStreams = a3;
}

- (unint64_t)streamOpenTime
{
  return self->_streamOpenTime;
}

- (void)setStreamOpenTime:(unint64_t)a3
{
  self->_streamOpenTime = a3;
}

- (unint64_t)streamDataSize
{
  return self->_streamDataSize;
}

- (void)setStreamDataSize:(unint64_t)a3
{
  self->_streamDataSize = a3;
}

- (unint64_t)streamDataXferTime
{
  return self->_streamDataXferTime;
}

- (void)setStreamDataXferTime:(unint64_t)a3
{
  self->_streamDataXferTime = a3;
}

- (unint64_t)streamDataXferSpeed
{
  return self->_streamDataXferSpeed;
}

- (void)setStreamDataXferSpeed:(unint64_t)a3
{
  self->_streamDataXferSpeed = a3;
}

- (unint64_t)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(unint64_t)a3
{
  self->_totalTime = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  self->_underlyingErrorCode = a3;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (BOOL)isFileCopy
{
  return self->_isFileCopy;
}

- (void)setIsFileCopy:(BOOL)a3
{
  self->_isFileCopy = a3;
}

- (BOOL)isAsyncTransfer
{
  return self->_isAsyncTransfer;
}

- (void)setIsAsyncTransfer:(BOOL)a3
{
  self->_isAsyncTransfer = a3;
}

- (NSString)remoteDeviceType
{
  return self->_remoteDeviceType;
}

- (void)setRemoteDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end