@interface TUNearbySuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSuggestion:(id)a3;
- (BOOL)isEquivalentToSuggestion:(id)a3;
- (NSUUID)identifier;
- (TUConversationActivity)activity;
- (TUNearbyDeviceHandle)deviceHandle;
- (TUNearbySuggestion)initWithCoder:(id)a3;
- (TUNearbySuggestion)initWithIdentifier:(id)a3 deviceHandle:(id)a4 activity:(id)a5 type:(int64_t)a6;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbySuggestion

- (TUNearbySuggestion)initWithIdentifier:(id)a3 deviceHandle:(id)a4 activity:(id)a5 type:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUNearbySuggestion;
  v14 = [(TUNearbySuggestion *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_deviceHandle, a4);
    objc_storeStrong((id *)&v15->_activity, a5);
    v15->_type = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" identifier=%@", self->_identifier];
  [v6 appendFormat:@" deviceHandle=%@", self->_deviceHandle];
  [v6 appendFormat:@" activity=%@", self->_activity];
  int64_t type = self->_type;
  v8 = @"pullRequest";
  if (type == 1) {
    v8 = @"intelligentRoutingRecommendation";
  }
  if (type == 2) {
    v9 = @"systemWake";
  }
  else {
    v9 = v8;
  }
  [v6 appendFormat:@" type=%@", v9];
  [v6 appendString:@">"];
  v10 = (void *)[v6 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_identifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_deviceHandle);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_activity);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = NSStringFromSelector(sel_type);
  uint64_t v15 = [v4 decodeIntegerForKey:v14];

  v16 = [(TUNearbySuggestion *)self initWithIdentifier:v7 deviceHandle:v10 activity:v13 type:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  deviceHandle = self->_deviceHandle;
  uint64_t v8 = NSStringFromSelector(sel_deviceHandle);
  [v5 encodeObject:deviceHandle forKey:v8];

  activity = self->_activity;
  v10 = NSStringFromSelector(sel_activity);
  [v5 encodeObject:activity forKey:v10];

  int64_t type = self->_type;
  NSStringFromSelector(sel_type);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:type forKey:v12];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUNearbySuggestion *)self isEqualToSuggestion:v4];

  return v5;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUNearbySuggestion *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEquivalentToSuggestion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUNearbySuggestion *)self deviceHandle];
  v6 = [v4 deviceHandle];
  if ([v5 isEquivalentToDeviceHandle:v6])
  {
    v7 = [(TUNearbySuggestion *)self activity];
    uint64_t v8 = [v4 activity];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      int64_t v9 = [(TUNearbySuggestion *)self type];
      BOOL v10 = v9 == [v4 type];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(TUNearbySuggestion *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (TUNearbyDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end