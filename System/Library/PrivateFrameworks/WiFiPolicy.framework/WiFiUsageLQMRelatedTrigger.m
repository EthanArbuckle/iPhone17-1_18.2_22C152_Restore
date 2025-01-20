@interface WiFiUsageLQMRelatedTrigger
- (NSDate)timestamp;
- (NSString)reason;
- (NSString)trigger;
- (WiFiUsageLQMRelatedTrigger)initWithTrigger:(id)a3 andReason:(id)a4 andTimestamp:(id)a5;
- (id)description;
- (void)setReason:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation WiFiUsageLQMRelatedTrigger

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_trigger, 0);
}

- (WiFiUsageLQMRelatedTrigger)initWithTrigger:(id)a3 andReason:(id)a4 andTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)WiFiUsageLQMRelatedTrigger;
    v14 = [(WiFiUsageLQMRelatedTrigger *)&v16 init];
    objc_storeStrong((id *)&v14->_trigger, a3);
    objc_storeStrong((id *)&v14->_reason, a4);
    objc_storeStrong((id *)&v14->_timestamp, a5);
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{%@(%@) @ %@}", self->_trigger, self->_reason, self->_timestamp];
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void)setTimestamp:(id)a3
{
}

@end