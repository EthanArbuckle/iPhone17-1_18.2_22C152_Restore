@interface DMDEventStreamEvent
- (DMDEventStreamEvent)initWithEventType:(id)a3 details:(id)a4;
- (NSDate)timestamp;
- (NSDictionary)details;
- (NSString)eventType;
- (id)description;
- (id)eventStatusMessageWithPayloadIdentifier:(id)a3;
@end

@implementation DMDEventStreamEvent

- (DMDEventStreamEvent)initWithEventType:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMDEventStreamEvent;
  v8 = [(DMDEventStreamEvent *)&v16 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    eventType = v8->_eventType;
    v8->_eventType = v9;

    v11 = (NSDictionary *)[v7 copy];
    details = v8->_details;
    v8->_details = v11;

    uint64_t v13 = objc_opt_new();
    timestamp = v8->_timestamp;
    v8->_timestamp = (NSDate *)v13;
  }
  return v8;
}

- (id)description
{
  v5[0] = @"eventType";
  v5[1] = @"timestamp";
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = DMFObjectDescriptionWithProperties();

  return v3;
}

- (id)eventStatusMessageWithPayloadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  [v5 setObject:v4 forKeyedSubscript:DMFDeclarationEventsMessageInReplyToKey];

  id v6 = [(DMDEventStreamEvent *)self eventType];
  [v5 setObject:v6 forKeyedSubscript:DMFDeclarationEventsMessageEventTypeKey];

  id v7 = [(DMDEventStreamEvent *)self timestamp];
  [v5 setObject:v7 forKeyedSubscript:DMFDeclarationEventsMessageEventTimestampKey];

  v8 = [(DMDEventStreamEvent *)self details];
  [v5 setObject:v8 forKeyedSubscript:DMFDeclarationEventsMessageEventPayloadKey];

  return v5;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSDictionary)details
{
  return self->_details;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_details, 0);

  objc_storeStrong((id *)&self->_eventType, 0);
}

@end