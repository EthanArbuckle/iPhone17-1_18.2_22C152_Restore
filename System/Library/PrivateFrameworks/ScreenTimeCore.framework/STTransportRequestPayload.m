@interface STTransportRequestPayload
+ (BOOL)supportsSecureCoding;
+ (id)_mappedMessagesFromMessages:(id)a3 error:(id *)a4;
+ (id)eventsPayloadWithMessages:(id)a3 error:(id *)a4;
+ (id)statusPayloadWithMessages:(id)a3 error:(id *)a4;
- (CEMPayloadBase)underlyingPayload;
- (NSString)payloadType;
- (STTransportRequestPayload)initWithCoder:(id)a3;
- (STTransportRequestPayload)initWithRequest:(id)a3;
- (STTransportRequestPayload)initWithRequest:(id)a3 UUID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceManagementRequestForOrganizationID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTransportRequestPayload

- (STTransportRequestPayload)initWithRequest:(id)a3
{
  return [(STTransportRequestPayload *)self initWithRequest:a3 UUID:0];
}

- (STTransportRequestPayload)initWithRequest:(id)a3 UUID:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STTransportRequestPayload;
  v8 = [(STTransportPayload *)&v11 initWithUUID:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_underlyingPayload, a3);
  }

  return v9;
}

+ (id)statusPayloadWithMessages:(id)a3 error:(id *)a4
{
  id v12 = 0;
  v5 = [a1 _mappedMessagesFromMessages:a3 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = STGetDeviceUUID();
    v8 = +[STStatusRequest requestWithUDID:v7 withUserShortName:0 withMessages:v5];

    v9 = [[STTransportRequestPayload alloc] initWithRequest:v8];
  }
  else
  {
    v10 = +[STLog payload];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10026846C((uint64_t)v6, v10);
    }

    v9 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v9;
}

+ (id)eventsPayloadWithMessages:(id)a3 error:(id *)a4
{
  id v12 = 0;
  v5 = [a1 _mappedMessagesFromMessages:a3 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = STGetDeviceUUID();
    v8 = +[STEventRequest requestWithUDID:v7 withUserShortName:0 withMessages:v5];

    v9 = [[STTransportRequestPayload alloc] initWithRequest:v8];
  }
  else
  {
    v10 = +[STLog payload];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10026846C((uint64_t)v6, v10);
    }

    v9 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v9;
}

- (NSString)payloadType
{
  v2 = [(STTransportRequestPayload *)self underlyingPayload];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v3 = @"Status";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v3 = @"Events";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CFStringRef v3 = @"Set";
      }
      else {
        CFStringRef v3 = @"Unknown";
      }
    }
  }

  return &v3->isa;
}

- (id)deviceManagementRequestForOrganizationID:(id)a3
{
  id v4 = a3;
  v5 = [(STTransportRequestPayload *)self underlyingPayload];

  if (!v5)
  {
    id v6 = +[STLog payload];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100268594(v6);
    }
  }
  id v7 = [(STTransportRequestPayload *)self underlyingPayload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_12;
  }
  v9 = [(STTransportRequestPayload *)self underlyingPayload];
  v10 = objc_opt_new();
  objc_super v11 = [v9 declarations];
  id v12 = v11;
  v13 = v11 ? v11 : &__NSArray0__struct;
  [v10 setDeclarations:v13];

  [v10 setOrganizationIdentifier:v4];
  v14 = objc_opt_new();
  v15 = [v14 UUIDString];
  [v10 setSyncToken:v15];

  if (v10)
  {
    v16 = +[STLog payload];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v17 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Created request %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
LABEL_12:
    v16 = +[STLog payload];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002684E4(self, v16);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)_mappedMessagesFromMessages:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = +[STStatusRequest_MessagesItem load:error:](STStatusRequest_MessagesItem, "load:error:", *(void *)(*((void *)&v16 + 1) + 8 * i), a4, (void)v16);
        if (!v12)
        {

          id v14 = 0;
          goto LABEL_11;
        }
        v13 = (void *)v12;
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = [v6 copy];
LABEL_11:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STTransportRequestPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STTransportRequestPayload;
  id v5 = [(STTransportPayload *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingPayload"];
    underlyingPayload = v5->_underlyingPayload;
    v5->_underlyingPayload = (CEMPayloadBase *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STTransportRequestPayload;
  id v4 = a3;
  [(STTransportPayload *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_underlyingPayload, @"underlyingPayload", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  objc_super v5 = [(STTransportRequestPayload *)self underlyingPayload];
  uint64_t v6 = [(STTransportPayload *)self UUID];
  id v7 = [v4 initWithRequest:v5 UUID:v6];

  return v7;
}

- (CEMPayloadBase)underlyingPayload
{
  return self->_underlyingPayload;
}

- (void).cxx_destruct
{
}

@end