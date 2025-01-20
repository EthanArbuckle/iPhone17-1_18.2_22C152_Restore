@interface STDowntimeStateEvent
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDowntimeStateEvent:(id)a3;
- (NSDate)downtimeDate;
- (NSString)identifier;
- (STDowntimeStateEvent)initWithIdentifier:(id)a3 downtimeConfigurationState:(int64_t)a4 downtimeDate:(id)a5 userID:(id)a6;
- (STUserID)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downtimeConfigurationState;
- (unint64_t)hash;
@end

@implementation STDowntimeStateEvent

- (STDowntimeStateEvent)initWithIdentifier:(id)a3 downtimeConfigurationState:(int64_t)a4 downtimeDate:(id)a5 userID:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)STDowntimeStateEvent;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [(STDowntimeStateEvent *)&v20 init];
  v12->_downtimeConfigurationState = a4;
  v13 = (NSString *)objc_msgSend(v11, "copy", v20.receiver, v20.super_class);

  identifier = v12->_identifier;
  v12->_identifier = v13;

  v15 = (NSDate *)[v10 copy];
  downtimeDate = v12->_downtimeDate;
  v12->_downtimeDate = v15;

  v17 = (STUserID *)[v9 copy];
  userID = v12->_userID;
  v12->_userID = v17;

  return v12;
}

- (BOOL)enabled
{
  return (id)[(STDowntimeStateEvent *)self downtimeConfigurationState] == (id)2
      || (id)[(STDowntimeStateEvent *)self downtimeConfigurationState] == (id)4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  identifier = self->_identifier;
  downtimeDate = self->_downtimeDate;
  userID = self->_userID;
  int64_t downtimeConfigurationState = self->_downtimeConfigurationState;
  return [v4 initWithIdentifier:identifier downtimeConfigurationState:downtimeConfigurationState downtimeDate:downtimeDate userID:userID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDowntimeStateEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STDowntimeStateEvent *)self isEqualToDowntimeStateEvent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDowntimeStateEvent:(id)a3
{
  id v4 = (STDowntimeStateEvent *)a3;
  if (self == v4)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    BOOL v5 = [(STDowntimeStateEvent *)self identifier];
    v6 = [(STDowntimeStateEvent *)v4 identifier];
    if ([v5 isEqualToString:v6]
      && (v7 = [(STDowntimeStateEvent *)self downtimeConfigurationState],
          v7 == (void *)[(STDowntimeStateEvent *)v4 downtimeConfigurationState]))
    {
      v8 = [(STDowntimeStateEvent *)self downtimeDate];
      id v9 = [(STDowntimeStateEvent *)v4 downtimeDate];
      if ([v8 isEqualToDate:v9])
      {
        id v10 = [(STDowntimeStateEvent *)self userID];
        id v11 = [(STDowntimeStateEvent *)v4 userID];
        unsigned __int8 v12 = [v10 isEqualToUserID:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v3 = [(STDowntimeStateEvent *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(STDowntimeStateEvent *)self downtimeConfigurationState] ^ v4;
  v6 = [(STDowntimeStateEvent *)self downtimeDate];
  unint64_t v7 = (unint64_t)[v6 hash];
  v8 = [(STDowntimeStateEvent *)self userID];
  unint64_t v9 = v5 ^ v7 ^ (unint64_t)[v8 hash];

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)downtimeDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (STUserID)userID
{
  return (STUserID *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)downtimeConfigurationState
{
  return self->_downtimeConfigurationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_downtimeDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end