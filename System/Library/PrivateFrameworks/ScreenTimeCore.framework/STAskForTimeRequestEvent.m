@interface STAskForTimeRequestEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAskForTimeRequestEvent:(id)a3;
- (NSDate)timestamp;
- (NSString)identifier;
- (NSString)requestedResourceIdentifier;
- (STAskForTimeRequestEvent)initWithIdentifier:(id)a3 resourceType:(int64_t)a4 timestamp:(id)a5 requesterUserID:(id)a6 requestedResourceIdentifier:(id)a7;
- (STUserID)requesterUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)resourceType;
- (unint64_t)hash;
@end

@implementation STAskForTimeRequestEvent

- (STAskForTimeRequestEvent)initWithIdentifier:(id)a3 resourceType:(int64_t)a4 timestamp:(id)a5 requesterUserID:(id)a6 requestedResourceIdentifier:(id)a7
{
  v25.receiver = self;
  v25.super_class = (Class)STAskForTimeRequestEvent;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [(STAskForTimeRequestEvent *)&v25 init];
  v16 = (NSString *)objc_msgSend(v14, "copy", v25.receiver, v25.super_class);

  identifier = v15->_identifier;
  v15->_identifier = v16;

  v15->_resourceType = a4;
  v18 = (NSDate *)[v13 copy];

  timestamp = v15->_timestamp;
  v15->_timestamp = v18;

  v20 = (STUserID *)[v12 copy];
  requesterUserID = v15->_requesterUserID;
  v15->_requesterUserID = v20;

  v22 = (NSString *)[v11 copy];
  requestedResourceIdentifier = v15->_requestedResourceIdentifier;
  v15->_requestedResourceIdentifier = v22;

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  identifier = self->_identifier;
  int64_t resourceType = self->_resourceType;
  timestamp = self->_timestamp;
  requesterUserID = self->_requesterUserID;
  requestedResourceIdentifier = self->_requestedResourceIdentifier;
  return [v4 initWithIdentifier:identifier resourceType:resourceType timestamp:timestamp requesterUserID:requesterUserID requestedResourceIdentifier:requestedResourceIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STAskForTimeRequestEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STAskForTimeRequestEvent *)self isEqualToAskForTimeRequestEvent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAskForTimeRequestEvent:(id)a3
{
  id v4 = (STAskForTimeRequestEvent *)a3;
  if (self == v4)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    BOOL v5 = [(STAskForTimeRequestEvent *)self identifier];
    v6 = [(STAskForTimeRequestEvent *)v4 identifier];
    if ([v5 isEqualToString:v6]
      && (v7 = [(STAskForTimeRequestEvent *)self resourceType],
          v7 == (void *)[(STAskForTimeRequestEvent *)v4 resourceType]))
    {
      v8 = [(STAskForTimeRequestEvent *)self timestamp];
      v9 = [(STAskForTimeRequestEvent *)v4 timestamp];
      if ([v8 isEqualToDate:v9])
      {
        v10 = [(STAskForTimeRequestEvent *)self requesterUserID];
        id v11 = [(STAskForTimeRequestEvent *)v4 requesterUserID];
        if ([v10 isEqualToUserID:v11])
        {
          id v12 = [(STAskForTimeRequestEvent *)self requestedResourceIdentifier];
          id v13 = [(STAskForTimeRequestEvent *)v4 requestedResourceIdentifier];
          unsigned __int8 v14 = [v12 isEqualToString:v13];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(STAskForTimeRequestEvent *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(STAskForTimeRequestEvent *)self resourceType] ^ v4;
  v6 = [(STAskForTimeRequestEvent *)self timestamp];
  unint64_t v7 = (unint64_t)[v6 hash];
  v8 = [(STAskForTimeRequestEvent *)self requesterUserID];
  unint64_t v9 = v5 ^ v7 ^ (unint64_t)[v8 hash];
  v10 = [(STAskForTimeRequestEvent *)self requestedResourceIdentifier];
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash];

  return v11;
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

- (NSString)requestedResourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterUserID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end