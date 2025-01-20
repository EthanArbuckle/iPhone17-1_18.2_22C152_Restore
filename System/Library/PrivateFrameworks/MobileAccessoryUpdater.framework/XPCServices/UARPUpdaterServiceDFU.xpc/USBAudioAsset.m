@interface USBAudioAsset
- (BOOL)getNextCommandData:(char *)a3 length:(unsigned int)a4 offset:(unsigned int *)a5;
- (USBAudioAsset)initWithUarpAsset:(uarpPlatformAsset *)a3 nextAsset:(id)a4;
- (USBAudioAsset)next;
- (char)payloadData;
- (uarpPlatformAsset)pAsset;
- (uarpPlatformAssetCallbacks)callbacks;
- (unsigned)getNextCommandLength;
- (unsigned)payloaLength;
- (unsigned)selectedPayload;
- (unsigned)transferCompleted;
- (void)appendPayloadData:(char *)a3 length:(unsigned int)a4;
- (void)setNext:(id)a3;
- (void)setPayloaLength:(unsigned int)a3;
- (void)setPayloadData:(char *)a3;
- (void)setSelectedPayload:(unsigned __int16)a3;
- (void)setTransferCompleted:(unsigned __int8)a3;
@end

@implementation USBAudioAsset

- (USBAudioAsset)initWithUarpAsset:(uarpPlatformAsset *)a3 nextAsset:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)USBAudioAsset;
  v8 = [(USBAudioAsset *)&v15 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    v11 = *((void *)v8 + 1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100019308(v11);
    }
    *((void *)v8 + 33) = a3;
    objc_storeStrong((id *)v8 + 36, a4);
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 13) = 0u;
    *((_OWORD *)v8 + 14) = 0u;
    *((_OWORD *)v8 + 11) = 0u;
    *((_OWORD *)v8 + 12) = 0u;
    *((_OWORD *)v8 + 9) = 0u;
    *((_OWORD *)v8 + 10) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((void *)v8 + 2) = sub_10000BAE0;
    *((void *)v8 + 24) = sub_10000BB74;
    *((void *)v8 + 10) = sub_10000BECC;
    *((void *)v8 + 11) = sub_10000BF78;
    *((void *)v8 + 34) = v8 + 16;
    id v12 = objc_alloc((Class)NSMutableData);
    v13 = (void *)*((void *)v8 + 30);
    *((void *)v8 + 30) = v12;
  }
  return (USBAudioAsset *)v8;
}

- (void)appendPayloadData:(char *)a3 length:(unsigned int)a4
{
}

- (unsigned)getNextCommandLength
{
  unint64_t v3 = self->_currentPayloadOffset + 8;
  if (v3 > [(NSMutableData *)self->_payload length]) {
    return 0;
  }
  uint64_t v5 = self->_currentPayloadOffset + 4;
  int v6 = 0;
  -[NSMutableData getBytes:range:](self->_payload, "getBytes:range:", &v6, v5, 4);
  return 4 * v6 + 8;
}

- (BOOL)getNextCommandData:(char *)a3 length:(unsigned int)a4 offset:(unsigned int *)a5
{
  NSUInteger v9 = self->_currentPayloadOffset + a4;
  NSUInteger v10 = [(NSMutableData *)self->_payload length];
  if (v10 >= v9)
  {
    *a5 = self->_currentPayloadOffset;
    -[NSMutableData getBytes:range:](self->_payload, "getBytes:range:", a3, self->_currentPayloadOffset, a4);
    self->_currentPayloadOffset += a4;
  }
  return v10 >= v9;
}

- (uarpPlatformAsset)pAsset
{
  return self->_pAsset;
}

- (uarpPlatformAssetCallbacks)callbacks
{
  return self->_callbacks;
}

- (unsigned)selectedPayload
{
  return self->_selectedPayload;
}

- (void)setSelectedPayload:(unsigned __int16)a3
{
  self->_selectedPayload = a3;
}

- (unsigned)transferCompleted
{
  return self->_transferCompleted;
}

- (void)setTransferCompleted:(unsigned __int8)a3
{
  self->_transferCompleted = a3;
}

- (char)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(char *)a3
{
  self->_payloadData = a3;
}

- (unsigned)payloaLength
{
  return self->_payloaLength;
}

- (void)setPayloaLength:(unsigned int)a3
{
  self->_payloaLength = a3;
}

- (USBAudioAsset)next
{
  return (USBAudioAsset *)objc_getProperty(self, a2, 288, 1);
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end