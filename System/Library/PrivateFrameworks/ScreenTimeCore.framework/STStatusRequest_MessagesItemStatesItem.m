@interface STStatusRequest_MessagesItemStatesItem
+ (NSSet)allowedKeys;
+ (id)buildRequiredOnlyWithTimestamp:(id)a3 withStatus:(id)a4;
+ (id)buildWithServerHash:(id)a3 withAssetsUsed:(id)a4 withTimestamp:(id)a5 withStatus:(id)a6 withReason:(id)a7 withErrorChain:(id)a8 withPayload:(id)a9;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAnyPayload)payload;
- (NSArray)assetsUsed;
- (NSArray)errorChain;
- (NSArray)reason;
- (NSDate)timestamp;
- (NSString)serverHash;
- (NSString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setAssetsUsed:(id)a3;
- (void)setErrorChain:(id)a3;
- (void)setPayload:(id)a3;
- (void)setReason:(id)a3;
- (void)setServerHash:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation STStatusRequest_MessagesItemStatesItem

+ (NSSet)allowedKeys
{
  v5[0] = @"ServerHash";
  v5[1] = @"AssetsUsed";
  v5[2] = @"Timestamp";
  v5[3] = @"Status";
  v5[4] = @"Reason";
  v5[5] = @"ErrorChain";
  v5[6] = @"Payload";
  v2 = +[NSArray arrayWithObjects:v5 count:7];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)buildWithServerHash:(id)a3 withAssetsUsed:(id)a4 withTimestamp:(id)a5 withStatus:(id)a6 withReason:(id)a7 withErrorChain:(id)a8 withPayload:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setServerHash:v21];

  [v22 setAssetsUsed:v20];
  [v22 setTimestamp:v19];

  [v22 setStatus:v18];
  [v22 setReason:v17];

  [v22 setErrorChain:v16];
  [v22 setPayload:v15];

  return v22;
}

+ (id)buildRequiredOnlyWithTimestamp:(id)a3 withStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTimestamp:v6];

  [v7 setStatus:v5];
  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = +[NSMutableSet setWithArray:v7];

  v9 = +[STStatusRequest_MessagesItemStatesItem allowedKeys];
  [v8 minusSet:v9];

  if ([v8 count])
  {
    if (!a4)
    {
      BOOL v12 = 0;
      goto LABEL_16;
    }
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"Unexpected payload keys: %@", v8];
    id v36 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    *a4 = +[NSError errorWithDomain:@"error" code:1 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    id v34 = 0;
    v13 = [(STStatusRequest_MessagesItemStatesItem *)self loadStringFromDictionary:v6 withKey:@"ServerHash" isRequired:0 defaultValue:0 error:&v34];
    id v10 = v34;
    serverHash = self->_serverHash;
    self->_serverHash = v13;

    if (!v10)
    {
      id v33 = 0;
      id v15 = [(STStatusRequest_MessagesItemStatesItem *)self loadArrayFromDictionary:v6 withKey:@"AssetsUsed" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v33];
      id v10 = v33;
      assetsUsed = self->_assetsUsed;
      self->_assetsUsed = v15;

      if (!v10)
      {
        id v32 = 0;
        id v17 = [(STStatusRequest_MessagesItemStatesItem *)self loadDateFromDictionary:v6 withKey:@"Timestamp" isRequired:1 defaultValue:0 error:&v32];
        id v10 = v32;
        timestamp = self->_timestamp;
        self->_timestamp = v17;

        if (!v10)
        {
          id v31 = 0;
          id v19 = [(STStatusRequest_MessagesItemStatesItem *)self loadStringFromDictionary:v6 withKey:@"Status" isRequired:1 defaultValue:0 error:&v31];
          id v10 = v31;
          status = self->_status;
          self->_status = v19;

          if (!v10)
          {
            id v30 = 0;
            id v21 = [(STStatusRequest_MessagesItemStatesItem *)self loadArrayFromDictionary:v6 withKey:@"Reason" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v30];
            id v10 = v30;
            reason = self->_reason;
            self->_reason = v21;

            if (!v10)
            {
              id v29 = 0;
              v23 = [(STStatusRequest_MessagesItemStatesItem *)self loadArrayFromDictionary:v6 withKey:@"ErrorChain" validator:&stru_1002FE4F8 isRequired:0 defaultValue:0 error:&v29];
              id v10 = v29;
              errorChain = self->_errorChain;
              self->_errorChain = v23;

              if (!v10)
              {
                id v28 = 0;
                v25 = [(STStatusRequest_MessagesItemStatesItem *)self loadDictionaryFromDictionary:v6 withKey:@"Payload" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v28];
                id v10 = v28;
                payload = self->_payload;
                self->_payload = v25;
              }
            }
          }
        }
      }
    }
    BOOL v12 = v10 == 0;
    if (a4 && v10)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

LABEL_16:
  return v12;
}

- (id)serializePayload
{
  v3 = +[NSMutableDictionary dictionary];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeStringIntoDictionary:v3 withKey:@"ServerHash" withValue:self->_serverHash isRequired:0 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeArrayIntoDictionary:v3 withKey:@"AssetsUsed" withValue:self->_assetsUsed itemSerializer:&stru_1002FE538 isRequired:0 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeDateIntoDictionary:v3 withKey:@"Timestamp" withValue:self->_timestamp isRequired:1 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeStringIntoDictionary:v3 withKey:@"Status" withValue:self->_status isRequired:1 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeArrayIntoDictionary:v3 withKey:@"Reason" withValue:self->_reason itemSerializer:&stru_1002FE578 isRequired:0 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeArrayIntoDictionary:v3 withKey:@"ErrorChain" withValue:self->_errorChain itemSerializer:&stru_1002FE598 isRequired:0 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItem *)self serializeDictionaryIntoDictionary:v3 withKey:@"Payload" withValue:self->_payload dictSerializer:&stru_1002FE5B8 isRequired:0 defaultValue:0];
  id v4 = [v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)STStatusRequest_MessagesItemStatesItem;
  id v4 = [(STStatusRequest_MessagesItemStatesItem *)&v20 copyWithZone:a3];
  id v5 = [(NSString *)self->_serverHash copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSArray *)self->_assetsUsed copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  id v9 = [(NSDate *)self->_timestamp copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  id v11 = [(NSString *)self->_status copy];
  BOOL v12 = (void *)v4[5];
  v4[5] = v11;

  id v13 = [(NSArray *)self->_reason copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  id v15 = [(NSArray *)self->_errorChain copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  id v17 = [(CEMAnyPayload *)self->_payload copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)serverHash
{
  return self->_serverHash;
}

- (void)setServerHash:(id)a3
{
}

- (NSArray)assetsUsed
{
  return self->_assetsUsed;
}

- (void)setAssetsUsed:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSArray)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSArray)errorChain
{
  return self->_errorChain;
}

- (void)setErrorChain:(id)a3
{
}

- (CEMAnyPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_errorChain, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_assetsUsed, 0);
  objc_storeStrong((id *)&self->_serverHash, 0);
}

@end