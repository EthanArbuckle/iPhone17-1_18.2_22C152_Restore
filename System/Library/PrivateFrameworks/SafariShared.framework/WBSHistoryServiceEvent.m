@interface WBSHistoryServiceEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)time;
- (NSDictionary)value;
- (NSString)eventType;
- (WBSHistoryServiceEvent)init;
- (WBSHistoryServiceEvent)initWithCoder:(id)a3;
- (WBSHistoryServiceEvent)initWithEventID:(int64_t)a3 type:(id)a4 time:(id)a5 value:(id)a6;
- (WBSHistoryServiceEvent)initWithType:(id)a3 time:(id)a4 value:(id)a5;
- (int64_t)eventID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryServiceEvent

- (WBSHistoryServiceEvent)init
{
  return 0;
}

- (WBSHistoryServiceEvent)initWithEventID:(int64_t)a3 type:(id)a4 time:(id)a5 value:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WBSHistoryServiceEvent;
  v13 = [(WBSHistoryServiceEvent *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_eventID = a3;
    uint64_t v15 = [v10 copy];
    eventType = v14->_eventType;
    v14->_eventType = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    time = v14->_time;
    v14->_time = (NSDate *)v17;

    uint64_t v19 = [v12 copy];
    value = v14->_value;
    v14->_value = (NSDictionary *)v19;

    v21 = v14;
  }

  return v14;
}

- (WBSHistoryServiceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSHistoryServiceEvent;
  v5 = [(WBSHistoryServiceEvent *)&v23 init];
  if (v5)
  {
    v5->_eventID = [v4 decodeInt64ForKey:@"eventID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDate *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDictionary *)v19;

    v21 = v5;
  }

  return v5;
}

- (WBSHistoryServiceEvent)initWithType:(id)a3 time:(id)a4 value:(id)a5
{
  return [(WBSHistoryServiceEvent *)self initWithEventID:0 type:a3 time:a4 value:a5];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventID = self->_eventID;
  id v5 = a3;
  [v5 encodeInt64:eventID forKey:@"eventID"];
  [v5 encodeObject:self->_eventType forKey:@"type"];
  [v5 encodeObject:self->_time forKey:@"time"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSDate)time
{
  return self->_time;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end