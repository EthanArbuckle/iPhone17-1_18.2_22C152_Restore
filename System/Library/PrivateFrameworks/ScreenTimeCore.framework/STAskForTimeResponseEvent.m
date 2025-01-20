@interface STAskForTimeResponseEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAskForTimeRequestEvent:(id)a3;
- (NSDate)timestamp;
- (NSString)identifier;
- (NSString)requestedResourceIdentifier;
- (STAskForTimeResponseEvent)initWithIdentifier:(id)a3 resourceType:(int64_t)a4 timestamp:(id)a5 requesterUserID:(id)a6 responderUserID:(id)a7 requestedResourceIdentifier:(id)a8 approvedTime:(int64_t)a9;
- (STUserID)requesterUserID;
- (STUserID)responderUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)approvedTime;
- (int64_t)resourceType;
- (unint64_t)hash;
@end

@implementation STAskForTimeResponseEvent

- (STAskForTimeResponseEvent)initWithIdentifier:(id)a3 resourceType:(int64_t)a4 timestamp:(id)a5 requesterUserID:(id)a6 responderUserID:(id)a7 requestedResourceIdentifier:(id)a8 approvedTime:(int64_t)a9
{
  v31.receiver = self;
  v31.super_class = (Class)STAskForTimeResponseEvent;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  v19 = [(STAskForTimeResponseEvent *)&v31 init];
  v20 = (NSString *)objc_msgSend(v18, "copy", v31.receiver, v31.super_class);

  identifier = v19->_identifier;
  v19->_identifier = v20;

  v19->_resourceType = a4;
  v22 = (NSDate *)[v17 copy];

  timestamp = v19->_timestamp;
  v19->_timestamp = v22;

  v24 = (STUserID *)[v16 copy];
  requesterUserID = v19->_requesterUserID;
  v19->_requesterUserID = v24;

  v26 = (STUserID *)[v15 copy];
  responderUserID = v19->_responderUserID;
  v19->_responderUserID = v26;

  v28 = (NSString *)[v14 copy];
  requestedResourceIdentifier = v19->_requestedResourceIdentifier;
  v19->_requestedResourceIdentifier = v28;

  v19->_approvedTime = a9;
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier resourceType:self->_resourceType timestamp:self->_timestamp requesterUserID:self->_requesterUserID responderUserID:self->_responderUserID requestedResourceIdentifier:self->_requestedResourceIdentifier approvedTime:self->_approvedTime];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (STAskForTimeResponseEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STAskForTimeResponseEvent *)self isEqualToAskForTimeRequestEvent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAskForTimeRequestEvent:(id)a3
{
  v4 = (STAskForTimeResponseEvent *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    BOOL v5 = [(STAskForTimeResponseEvent *)self identifier];
    v6 = [(STAskForTimeResponseEvent *)v4 identifier];
    if ([v5 isEqualToString:v6]
      && (v7 = [(STAskForTimeResponseEvent *)self resourceType],
          v7 == (void *)[(STAskForTimeResponseEvent *)v4 resourceType]))
    {
      v8 = [(STAskForTimeResponseEvent *)self timestamp];
      v9 = [(STAskForTimeResponseEvent *)v4 timestamp];
      if ([v8 isEqualToDate:v9])
      {
        v10 = [(STAskForTimeResponseEvent *)self requesterUserID];
        v11 = [(STAskForTimeResponseEvent *)v4 requesterUserID];
        if ([v10 isEqualToUserID:v11])
        {
          v12 = [(STAskForTimeResponseEvent *)self requestedResourceIdentifier];
          v13 = [(STAskForTimeResponseEvent *)v4 requestedResourceIdentifier];
          if ([v12 isEqualToString:v13])
          {
            id v14 = [(STAskForTimeResponseEvent *)self approvedTime];
            BOOL v15 = v14 == (id)[(STAskForTimeResponseEvent *)v4 approvedTime];
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  v3 = [(STAskForTimeResponseEvent *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(STAskForTimeResponseEvent *)self resourceType] ^ v4;
  v6 = [(STAskForTimeResponseEvent *)self timestamp];
  unint64_t v7 = (unint64_t)[v6 hash];
  v8 = [(STAskForTimeResponseEvent *)self requesterUserID];
  unint64_t v9 = v5 ^ v7 ^ (unint64_t)[v8 hash];
  v10 = [(STAskForTimeResponseEvent *)self requestedResourceIdentifier];
  unint64_t v11 = (unint64_t)[v10 hash];
  unint64_t v12 = v9 ^ v11 ^ [(STAskForTimeResponseEvent *)self approvedTime];

  return v12;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (STUserID)requesterUserID
{
  return (STUserID *)objc_getProperty(self, a2, 32, 1);
}

- (STUserID)responderUserID
{
  return (STUserID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)requestedResourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)approvedTime
{
  return self->_approvedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_responderUserID, 0);
  objc_storeStrong((id *)&self->_requesterUserID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end