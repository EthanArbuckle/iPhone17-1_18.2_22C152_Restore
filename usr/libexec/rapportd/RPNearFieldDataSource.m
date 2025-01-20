@interface RPNearFieldDataSource
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldDataSource)initWithDispatchQueue:(id)a3;
- (id)_AWDLBonjourTransportServiceMetadata;
- (id)_identityForNFCDeviceDiscovery;
- (id)_requestMessageMetadata;
- (id)_selfIdentity;
- (id)_transportServiceMetadataWithServiceType:(unint64_t)a3;
- (id)createAuthenticationPayloadWithPkData:(id)a3 bonjourListenerUUID:(id)a4;
- (id)createRequestMessageWithApplicationLabel:(id)a3 payload:(id)a4;
- (id)createResponseWithApplicationLabel:(id)a3 payload:(id)a4 forRequestMessage:(id)a5;
- (id)createTapEventWithApplicationLabel:(id)a3 singleBandAWDLModeRequested:(BOOL)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 identity:(id)a7 isUnsupportedApplicationLabel:(BOOL)a8 flags:(unsigned int)a9;
- (id)createValidationPayloadWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4;
@end

@implementation RPNearFieldDataSource

- (RPNearFieldDataSource)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPNearFieldDataSource;
  v6 = [(RPNearFieldDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    sub_100050274();
  }

  return v7;
}

- (id)createAuthenticationPayloadWithPkData:(id)a3 bonjourListenerUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [RPNearFieldAuthenticationPayload alloc];
  objc_super v9 = +[NSDate now];
  v10 = [(RPNearFieldDataSource *)self _identityForNFCDeviceDiscovery];
  v11 = [(RPNearFieldAuthenticationPayload *)v8 initWithTimeStamp:v9 pkData:v7 bonjourListenerUUID:v6 selfIdentity:v10];

  return v11;
}

- (id)createValidationPayloadWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  v4 = [[RPNearFieldValidationPayload alloc] initWithKnownIdentity:a3 supportsApplicationLabel:a4];

  return v4;
}

- (id)createRequestMessageWithApplicationLabel:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 type] == (id)1) {
    [(RPNearFieldDataSource *)self _requestMessageMetadata];
  }
  else {
  v8 = +[NSArray array];
  }
  objc_super v9 = +[RPTransportServiceHandoverMessage messageWithMetadata:v8 applicationLabel:v7 payload:v6 version:@"1.1"];

  return v9;
}

- (id)createResponseWithApplicationLabel:(id)a3 payload:(id)a4 forRequestMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if (sub_100055474((unint64_t)[v9 type]))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = [v10 transportServicesMetadata];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) serviceType];
          if (sub_100070554((uint64_t)v17))
          {
            v18 = [(RPNearFieldDataSource *)self _transportServiceMetadataWithServiceType:v17];
            if (v18) {
              [v11 addObject:v18];
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
  }
  v19 = +[RPTransportServiceHandoverMessage messageWithMetadata:v11 applicationLabel:v8 payload:v9 version:@"1.1"];

  return v19;
}

- (id)createTapEventWithApplicationLabel:(id)a3 singleBandAWDLModeRequested:(BOOL)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 identity:(id)a7 isUnsupportedApplicationLabel:(BOOL)a8 flags:(unsigned int)a9
{
  id v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int v19 = [v14 type];
  v20 = [v14 contactID];
  v30 = [v14 accountID];
  long long v21 = [v14 idsDeviceID];
  if (v21)
  {
    if (a4)
    {
LABEL_3:
      BOOL v22 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    long long v23 = +[NSUUID UUID];
    long long v21 = [v23 UUIDString];

    if (a4) {
      goto LABEL_3;
    }
  }
  BOOL v22 = sub_100050274();
LABEL_6:
  HIDWORD(v28) = a9;
  BYTE2(v28) = a8;
  BYTE1(v28) = v14 != 0;
  LOBYTE(v28) = v22;
  long long v24 = -[RPNearFieldTapEvent initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:]([RPNearFieldTapEvent alloc], "initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:", v21, v18, v17, v16, v19 == 2, v20, v30, v28);

  if (v19 == 2)
  {
    v25 = [v14 name];
    [(RPNearFieldTapEvent *)v24 setDeviceName:v25];

    v26 = [v14 model];
    [(RPNearFieldTapEvent *)v24 setDeviceModel:v26];
  }

  return v24;
}

- (id)_selfIdentity
{
  v2 = +[RPIdentityDaemon sharedIdentityDaemon];
  v3 = [v2 identityOfSelfAndReturnError:0];

  v4 = objc_opt_new();
  id v5 = [v3 edPKData];
  [v4 setEdPKData:v5];

  id v6 = [v3 edSKData];
  [v4 setEdSKData:v6];

  id v7 = [v3 deviceIRKData];
  [v4 setDeviceIRKData:v7];

  return v4;
}

- (id)_identityForNFCDeviceDiscovery
{
  id v2 = [(RPNearFieldDataSource *)self _selfIdentity];
  if (!v2)
  {
    if (dword_100141470 <= 60 && (dword_100141470 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = [objc_alloc((Class)RPIdentity) initWithType:14];
    v3 = NSRandomData();
    [v2 setDeviceIRKData:v3];
  }
  v4 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  id v5 = [v4 localDeviceInfo];
  id v6 = [v5 model];
  [v2 setModel:v6];

  id v7 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v8 = [v7 sessionPairingIdentifier];
  id v9 = [v8 UUIDString];
  [v2 setIdentifier:v9];

  return v2;
}

- (id)_transportServiceMetadataWithServiceType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(RPNearFieldDataSource *)self _AWDLBonjourTransportServiceMetadata];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_AWDLBonjourTransportServiceMetadata
{
  id v2 = [[RPAWDLBonjourTransportServiceMetadata alloc] initWithSingleBandModeRequired:sub_100050274()];

  return v2;
}

- (id)_requestMessageMetadata
{
  uint64_t v3 = objc_opt_new();
  if (sub_100070554(1))
  {
    uint64_t v4 = [(RPNearFieldDataSource *)self _transportServiceMetadataWithServiceType:1];
    if (v4) {
      [v3 addObject:v4];
    }
  }

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end