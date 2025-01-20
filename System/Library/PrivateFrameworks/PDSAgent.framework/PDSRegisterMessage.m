@interface PDSRegisterMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsClientInfo;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsUDID;
- (PDSProtoBatchRegisterReq)protoRequest;
- (PDSProtoBatchRegisterResp)protoResponse;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)messageBodyDataOverride;
- (id)overrideContentType;
- (id)parsedIDSMessageResult;
- (unint64_t)regReason;
- (void)handleResponseBody:(id)a3;
- (void)setProtoRequest:(id)a3;
- (void)setProtoResponse:(id)a3;
- (void)setRegReason:(unint64_t)a3;
@end

@implementation PDSRegisterMessage

- (id)messageBodyDataOverride
{
  v2 = [(PDSRegisterMessage *)self protoRequest];
  v3 = [v2 data];

  return v3;
}

- (id)bagKey
{
  return @"id-batchRegister";
}

- (BOOL)wantsIDSProtocolVersion
{
  return 0;
}

- (id)overrideContentType
{
  return @"application/x-protobuf";
}

- (void)handleResponseBody:(id)a3
{
  id v4 = a3;
  v5 = [[PDSProtoBatchRegisterResp alloc] initWithData:v4];

  NSLog(&stru_26D3CEBF8.isa, v5);
  [(PDSRegisterMessage *)self setProtoResponse:v5];
}

- (id)parsedIDSMessageResult
{
  id v3 = [(PDSRegisterMessage *)self protoResponse];

  if (v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = [(PDSRegisterMessage *)self protoResponse];
    int v5 = [v4 hasMessage];

    if (v5)
    {
      v6 = [(PDSRegisterMessage *)self protoResponse];
      v7 = [v6 message];
      [v3 setObject:v7 forKeyedSubscript:@"message"];
    }
    v8 = [(PDSRegisterMessage *)self protoResponse];
    int v9 = [v8 hasRetryInterval];

    if (v9)
    {
      v10 = NSNumber;
      v11 = [(PDSRegisterMessage *)self protoResponse];
      v12 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "retryInterval"));
      [v3 setObject:v12 forKeyedSubscript:@"retry-interval"];
    }
    v13 = [(PDSRegisterMessage *)self protoResponse];
    int v14 = [v13 hasServerTimestamp];

    if (v14)
    {
      v15 = NSNumber;
      v16 = [(PDSRegisterMessage *)self protoResponse];
      v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "serverTimestamp"));
      [v3 setObject:v17 forKeyedSubscript:@"current-timestamp-ms"];
    }
    v18 = NSNumber;
    v19 = [(PDSRegisterMessage *)self protoResponse];
    v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "status"));
    [v3 setObject:v20 forKeyedSubscript:@"status"];
  }
  return v3;
}

- (BOOL)wantsUDID
{
  return 1;
}

- (BOOL)wantsClientInfo
{
  return 1;
}

- (id)additionalMessageHeaders
{
  v16.receiver = self;
  v16.super_class = (Class)PDSRegisterMessage;
  id v3 = [(FTIDSMessage *)&v16 additionalMessageHeaders];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  int v5 = PDSProtocolVersionNumber();
  v6 = [v5 stringValue];

  v7 = PDSClientVersionNumber();
  v8 = [v7 stringValue];

  if (v8) {
    CFDictionarySetValue(v4, @"x-pds-client-version", v8);
  }
  if (v6) {
    CFDictionarySetValue(v4, @"x-protocol-version", v6);
  }
  CFDictionarySetValue(v4, @"x-pds-client-type", @"PDSKit");
  int v9 = [(FTIDSMessage *)self pushToken];
  v10 = [v9 _FTStringFromBaseData];

  if (v10) {
    CFDictionarySetValue(v4, @"x-push-token", v10);
  }

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PDSRegisterMessage regReason](self, "regReason"));
  v12 = [v11 stringValue];

  if (v12) {
    CFDictionarySetValue(v4, @"x-registration-reason", v12);
  }

  v13 = [(IDSBaseMessage *)self retryCount];
  int v14 = [v13 stringValue];

  if (v14) {
    CFDictionarySetValue(v4, @"x-retry-count", v14);
  }

  return v4;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDSRegisterMessage;
  return [(IDSBaseMessage *)&v4 hasRequiredKeys:a3];
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (PDSProtoBatchRegisterReq)protoRequest
{
  return self->_protoRequest;
}

- (void)setProtoRequest:(id)a3
{
}

- (PDSProtoBatchRegisterResp)protoResponse
{
  return self->_protoResponse;
}

- (void)setProtoResponse:(id)a3
{
}

- (unint64_t)regReason
{
  return self->_regReason;
}

- (void)setRegReason:(unint64_t)a3
{
  self->_regReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoRequest, 0);
}

@end