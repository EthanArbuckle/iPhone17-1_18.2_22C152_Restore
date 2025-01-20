@interface SCLInterruptBehaviorResolutionRecord
+ (id)resolutionRecordForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)clientIdentifier;
- (NSUUID)UUID;
- (SCLInterruptEventBehavior)eventBehavior;
- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6;
- (id)description;
- (unint64_t)hash;
@end

@implementation SCLInterruptBehaviorResolutionRecord

+ (id)resolutionRecordForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = [MEMORY[0x263F08C38] UUID];
  v13 = (void *)[v11 _initWithUUID:v12 date:v10 eventBehavior:v9 clientIdentifier:v8];

  return v13;
}

- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SCLInterruptBehaviorResolutionRecord;
  v14 = [(SCLInterruptBehaviorResolutionRecord *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    date = v14->_date;
    v14->_date = (NSDate *)v17;

    uint64_t v19 = [v12 copy];
    eventBehavior = v14->_eventBehavior;
    v14->_eventBehavior = (SCLInterruptEventBehavior *)v19;

    uint64_t v21 = [v13 copy];
    clientIdentifier = v14->_clientIdentifier;
    v14->_clientIdentifier = (NSString *)v21;
  }
  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(SCLInterruptBehaviorResolutionRecord *)self clientIdentifier];
  [v3 appendString:v4 withName:@"clientIdentifier"];

  v5 = [(SCLInterruptBehaviorResolutionRecord *)self UUID];
  id v6 = (id)[v3 appendObject:v5 withName:@"UUID" skipIfNil:1];

  v7 = [(SCLInterruptBehaviorResolutionRecord *)self date];
  id v8 = (id)[v3 appendObject:v7 withName:@"date" skipIfNil:1];

  id v9 = [(SCLInterruptBehaviorResolutionRecord *)self eventBehavior];
  id v10 = (id)[v3 appendObject:v9 withName:@"eventBehavior" skipIfNil:1];

  id v11 = [v3 build];

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SCLInterruptBehaviorResolutionRecord *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(SCLInterruptBehaviorResolutionRecord *)self date];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SCLInterruptBehaviorResolutionRecord *)self eventBehavior];
  uint64_t v8 = [v7 hash];
  id v9 = [(SCLInterruptBehaviorResolutionRecord *)self clientIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SCLInterruptBehaviorResolutionRecord *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SCLInterruptBehaviorResolutionRecord *)self UUID];
      v7 = [(SCLInterruptBehaviorResolutionRecord *)v5 UUID];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(SCLInterruptBehaviorResolutionRecord *)self date];
        id v9 = [(SCLInterruptBehaviorResolutionRecord *)v5 date];
        if ([v8 isEqual:v9])
        {
          unint64_t v10 = [(SCLInterruptBehaviorResolutionRecord *)self eventBehavior];
          id v11 = [(SCLInterruptBehaviorResolutionRecord *)v5 eventBehavior];
          if ([v10 isEqual:v11])
          {
            uint64_t v15 = [(SCLInterruptBehaviorResolutionRecord *)self clientIdentifier];
            id v12 = [(SCLInterruptBehaviorResolutionRecord *)v5 clientIdentifier];
            char v13 = [v15 isEqualToString:v12];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)date
{
  return self->_date;
}

- (SCLInterruptEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end