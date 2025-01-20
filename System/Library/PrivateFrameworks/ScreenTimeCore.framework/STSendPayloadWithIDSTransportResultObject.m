@interface STSendPayloadWithIDSTransportResultObject
- (NSArray)destinations;
- (NSString)localPayloadUUID;
- (NSString)payloadUUID;
- (STSendPayloadWithIDSTransportResultObject)initWithLocalPayloadUUID:(id)a3 payloadUUID:(id)a4 destinations:(id)a5;
@end

@implementation STSendPayloadWithIDSTransportResultObject

- (STSendPayloadWithIDSTransportResultObject)initWithLocalPayloadUUID:(id)a3 payloadUUID:(id)a4 destinations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STSendPayloadWithIDSTransportResultObject;
  v11 = [(STSendPayloadWithIDSTransportResultObject *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    localPayloadUUID = v11->_localPayloadUUID;
    v11->_localPayloadUUID = v12;

    v14 = (NSString *)[v9 copy];
    payloadUUID = v11->_payloadUUID;
    v11->_payloadUUID = v14;

    v16 = (NSArray *)[v10 copy];
    destinations = v11->_destinations;
    v11->_destinations = v16;
  }
  return v11;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSString)payloadUUID
{
  return self->_payloadUUID;
}

- (NSString)localPayloadUUID
{
  return self->_localPayloadUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPayloadUUID, 0);
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end