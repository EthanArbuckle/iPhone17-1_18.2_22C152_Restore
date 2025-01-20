@interface RPTransportServiceHandoverMessage
+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverRequest:(id)a3;
+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverSelect:(id)a3;
+ (RPTransportServiceHandoverMessage)messageWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6;
- (NSArray)transportServicesMetadata;
- (NSString)applicationLabel;
- (NSString)version;
- (RPNearFieldMessagePayload)payload;
- (RPTransportServiceHandoverMessage)initWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6;
- (id)connectionHandoverRequest;
- (id)connectionHandoverSelect;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)transportServicesMetadataDictionaryRepresentation;
@end

@implementation RPTransportServiceHandoverMessage

- (RPTransportServiceHandoverMessage)initWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RPTransportServiceHandoverMessage;
  v14 = [(RPTransportServiceHandoverMessage *)&v22 init];
  if (v14)
  {
    v15 = (NSArray *)[v10 copy];
    transportServicesMetadata = v14->_transportServicesMetadata;
    v14->_transportServicesMetadata = v15;

    v17 = (NSString *)[v11 copy];
    applicationLabel = v14->_applicationLabel;
    v14->_applicationLabel = v17;

    objc_storeStrong((id *)&v14->_payload, a5);
    v19 = (NSString *)[v13 copy];
    version = v14->_version;
    v14->_version = v19;
  }
  return v14;
}

+ (RPTransportServiceHandoverMessage)messageWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithMetadata:v12 applicationLabel:v11 payload:v10 version:v9];

  return (RPTransportServiceHandoverMessage *)v13;
}

- (id)transportServicesMetadataDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_transportServicesMetadata;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) dictionaryRepresentation:v11];
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  return [(RPTransportServiceHandoverMessage *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = 0;
  v20 = (RPNearFieldMessagePayload *)objc_opt_class();
  NSAppendPrintF();
  id v5 = 0;
  id v6 = v5;
  version = self->_version;
  if (version)
  {
    id v28 = v5;
    v20 = version;
    NSAppendPrintF();
    id v8 = v28;

    id v6 = v8;
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    id v27 = v6;
    v20 = applicationLabel;
    NSAppendPrintF();
    id v10 = v6;

    id v6 = v10;
  }
  payload = self->_payload;
  if (payload)
  {
    id v26 = v6;
    v20 = payload;
    NSAppendPrintF();
    id v12 = v6;

    id v6 = v12;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v13 = self->_transportServicesMetadata;
  id v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16, v20);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      v17 = 0;
      v18 = v6;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v21 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v17) descriptionWithLevel:v3, v21];
        NSAppendPrintF();
        id v6 = v18;

        v17 = (char *)v17 + 1;
        v18 = v6;
      }
      while (v15 != v17);
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16, v21);
    }
    while (v15);
  }

  return v6;
}

+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverSelect:(id)a3
{
  id v3 = a3;
  v4 = [v3 transportServiceList];
  id v5 = sub_1000711E4(v4);

  id v6 = [v3 userInfo];
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = 0;
    if (isKindOfClass)
    {
      long long v11 = [[RPNearFieldAuthenticationPayload alloc] initWithDictionary:v6];
      if (v11
        || (long long v11 = [[RPNearFieldValidationPayload alloc] initWithDictionary:v6]) != 0)
      {
        id v12 = objc_opt_class();
        long long v13 = [v3 applicationLabel];
        id v14 = [v3 version];
        id v10 = [v12 messageWithMetadata:v5 applicationLabel:v13 payload:v11 version:v14];
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return (RPTransportServiceHandoverMessage *)v10;
}

+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 transportServiceList];
  id v5 = sub_1000711E4(v4);

  id v6 = [v3 userInfo];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = 0;
  if (isKindOfClass)
  {
    long long v11 = NSDictionaryGetNSNumber();
    id v12 = v11;
    if (!v11 || (id v13 = [v11 integerValue], v13 == (id)1))
    {
      id v14 = &off_100120F70;
    }
    else
    {
      if (v13 != (id)2) {
        goto LABEL_14;
      }
      id v14 = &off_100120F80;
    }
    id v15 = [objc_alloc(*v14) initWithDictionary:v6];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = objc_opt_class();
      v18 = [v3 applicationLabel];
      v19 = [v3 version];
      id v10 = [v17 messageWithMetadata:v5 applicationLabel:v18 payload:v16 version:v19];

LABEL_15:
      goto LABEL_16;
    }
LABEL_14:
    id v10 = 0;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:

  return (RPTransportServiceHandoverMessage *)v10;
}

- (id)connectionHandoverSelect
{
  id v3 = [(RPTransportServiceHandoverMessage *)self payload];
  v4 = [v3 dictionaryRepresentation];

  id v5 = [(RPTransportServiceHandoverMessage *)self transportServicesMetadataDictionaryRepresentation];
  id v6 = objc_alloc((Class)off_100141BF0[0]());
  uint64_t v7 = [(RPTransportServiceHandoverMessage *)self version];
  id v8 = [(RPTransportServiceHandoverMessage *)self applicationLabel];
  id v9 = [v6 initWithVersion:v7 applicationLabel:v8 serivceList:v5 userInfo:v4];

  return v9;
}

- (id)connectionHandoverRequest
{
  id v3 = [(RPTransportServiceHandoverMessage *)self payload];
  v4 = [v3 dictionaryRepresentation];

  id v5 = [(RPTransportServiceHandoverMessage *)self transportServicesMetadataDictionaryRepresentation];
  id v6 = objc_alloc(off_100141BF8());
  uint64_t v7 = [(RPTransportServiceHandoverMessage *)self version];
  id v8 = [(RPTransportServiceHandoverMessage *)self applicationLabel];
  id v9 = [v6 initWithVersion:v7 applicationLabel:v8 serivceList:v5 userInfo:v4];

  return v9;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (RPNearFieldMessagePayload)payload
{
  return self->_payload;
}

- (NSArray)transportServicesMetadata
{
  return self->_transportServicesMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportServicesMetadata, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end