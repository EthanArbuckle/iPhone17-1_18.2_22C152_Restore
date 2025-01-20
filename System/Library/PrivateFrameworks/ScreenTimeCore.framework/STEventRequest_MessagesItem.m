@interface STEventRequest_MessagesItem
+ (NSSet)allowedKeys;
+ (id)buildRequiredOnlyWithInReplyTo:(id)a3 withEventType:(id)a4 withTimestamp:(id)a5;
+ (id)buildWithInReplyTo:(id)a3 withEventType:(id)a4 withTimestamp:(id)a5 withPayload:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAnyPayload)payload;
- (NSDate)timestamp;
- (NSString)eventType;
- (NSString)inReplyTo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setEventType:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setPayload:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation STEventRequest_MessagesItem

+ (NSSet)allowedKeys
{
  v5[0] = @"InReplyTo";
  v5[1] = @"EventType";
  v5[2] = @"Timestamp";
  v5[3] = @"Payload";
  v2 = +[NSArray arrayWithObjects:v5 count:4];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)buildWithInReplyTo:(id)a3 withEventType:(id)a4 withTimestamp:(id)a5 withPayload:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setInReplyTo:v12];

  [v13 setEventType:v11];
  [v13 setTimestamp:v10];

  [v13 setPayload:v9];
  return v13;
}

+ (id)buildRequiredOnlyWithInReplyTo:(id)a3 withEventType:(id)a4 withTimestamp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setInReplyTo:v9];

  [v10 setEventType:v8];
  [v10 setTimestamp:v7];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 allKeys];
  id v8 = +[NSMutableSet setWithArray:v7];

  id v9 = +[STEventRequest_MessagesItem allowedKeys];
  [v8 minusSet:v9];

  if ([v8 count])
  {
    if (!a4)
    {
      BOOL v12 = 0;
      goto LABEL_13;
    }
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"Unexpected payload keys: %@", v8];
    id v27 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a4 = +[NSError errorWithDomain:@"error" code:1 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    id v25 = 0;
    v13 = [(STEventRequest_MessagesItem *)self loadStringFromDictionary:v6 withKey:@"InReplyTo" isRequired:1 defaultValue:0 error:&v25];
    id v10 = v25;
    inReplyTo = self->_inReplyTo;
    self->_inReplyTo = v13;

    if (!v10)
    {
      id v24 = 0;
      v15 = [(STEventRequest_MessagesItem *)self loadStringFromDictionary:v6 withKey:@"EventType" isRequired:1 defaultValue:0 error:&v24];
      id v10 = v24;
      eventType = self->_eventType;
      self->_eventType = v15;

      if (!v10)
      {
        id v23 = 0;
        v17 = [(STEventRequest_MessagesItem *)self loadDateFromDictionary:v6 withKey:@"Timestamp" isRequired:1 defaultValue:0 error:&v23];
        id v10 = v23;
        timestamp = self->_timestamp;
        self->_timestamp = v17;

        if (!v10)
        {
          id v22 = 0;
          v19 = [(STEventRequest_MessagesItem *)self loadDictionaryFromDictionary:v6 withKey:@"Payload" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v22];
          id v10 = v22;
          payload = self->_payload;
          self->_payload = v19;
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

LABEL_13:
  return v12;
}

- (id)serializePayload
{
  v3 = +[NSMutableDictionary dictionary];
  [(STEventRequest_MessagesItem *)self serializeStringIntoDictionary:v3 withKey:@"InReplyTo" withValue:self->_inReplyTo isRequired:1 defaultValue:0];
  [(STEventRequest_MessagesItem *)self serializeStringIntoDictionary:v3 withKey:@"EventType" withValue:self->_eventType isRequired:1 defaultValue:0];
  [(STEventRequest_MessagesItem *)self serializeDateIntoDictionary:v3 withKey:@"Timestamp" withValue:self->_timestamp isRequired:1 defaultValue:0];
  [(STEventRequest_MessagesItem *)self serializeDictionaryIntoDictionary:v3 withKey:@"Payload" withValue:self->_payload dictSerializer:&stru_1002FC530 isRequired:0 defaultValue:0];
  id v4 = [v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)STEventRequest_MessagesItem;
  id v4 = [(STEventRequest_MessagesItem *)&v14 copyWithZone:a3];
  id v5 = [(NSString *)self->_inReplyTo copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSString *)self->_eventType copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  id v9 = [(NSDate *)self->_timestamp copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  id v11 = [(CEMAnyPayload *)self->_payload copy];
  BOOL v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
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
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
}

@end