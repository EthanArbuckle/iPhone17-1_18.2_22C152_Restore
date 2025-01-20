@interface WFCloudKitSyncEvent
- (NSDate)date;
- (NSDictionary)content;
- (WFCloudKitSyncEvent)initWithIdentifier:(int)a3 eventType:(int)a4 date:(id)a5 content:(id)a6;
- (id)description;
- (int)eventType;
- (int)identifier;
@end

@implementation WFCloudKitSyncEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSDictionary)content
{
  return self->_content;
}

- (NSDate)date
{
  return self->_date;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(WFCloudKitSyncEvent *)self identifier];
  unsigned int v5 = [(WFCloudKitSyncEvent *)self eventType] - 1;
  if (v5 > 0xA) {
    v6 = @"RecordFetch";
  }
  else {
    v6 = off_1E654DC88[v5];
  }
  v7 = [(WFCloudKitSyncEvent *)self date];
  v8 = [(WFCloudKitSyncEvent *)self content];
  v9 = [v3 stringWithFormat:@"<%i: %@, date: %@ (%@)>", v4, v6, v7, v8];

  return v9;
}

- (WFCloudKitSyncEvent)initWithIdentifier:(int)a3 eventType:(int)a4 date:(id)a5 content:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFCloudKitSyncEvent;
  v13 = [(WFCloudKitSyncEvent *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    v13->_eventType = a4;
    objc_storeStrong((id *)&v13->_date, a5);
    objc_storeStrong((id *)&v14->_content, a6);
    v15 = v14;
  }

  return v14;
}

@end