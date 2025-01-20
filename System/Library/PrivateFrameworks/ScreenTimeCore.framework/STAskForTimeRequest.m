@interface STAskForTimeRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)deliverQuietly;
- (BOOL)oneMoreMinute;
- (NSDate)timeStamp;
- (NSDictionary)payload;
- (NSNumber)requestingUserDSID;
- (NSNumber)timeRequested;
- (NSString)requestedResourceIdentifier;
- (NSString)requestingUserDisplayName;
- (NSString)resourceDisplayName;
- (NSUUID)requestIdentifier;
- (STAskForTimeRequest)initWithCoder:(id)a3;
- (STAskForTimeRequest)initWithPayload:(id)a3;
- (STAskForTimeRequest)initWithUsageType:(int64_t)a3 requestedResourceIdentifier:(id)a4;
- (int64_t)usageType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliverQuietly:(BOOL)a3;
- (void)setOneMoreMinute:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestingUserDSID:(id)a3;
- (void)setRequestingUserDisplayName:(id)a3;
- (void)setResourceDisplayName:(id)a3;
- (void)setTimeRequested:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation STAskForTimeRequest

- (STAskForTimeRequest)initWithUsageType:(int64_t)a3 requestedResourceIdentifier:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STAskForTimeRequest;
  v7 = [(STAskForTimeRequest *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    requestedResourceIdentifier = v7->_requestedResourceIdentifier;
    v7->_requestedResourceIdentifier = (NSString *)v8;

    v7->_usageType = a3;
    uint64_t v10 = objc_opt_new();
    timeStamp = v7->_timeStamp;
    v7->_timeStamp = (NSDate *)v10;

    timeRequested = v7->_timeRequested;
    v7->_timeRequested = (NSNumber *)&unk_1F349EBA8;
  }
  return v7;
}

- (STAskForTimeRequest)initWithPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"requestedResourceIdentifier"];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"timeStamp"];
  uint64_t v8 = (void *)v7;
  v9 = 0;
  if (v6)
  {
    if (v7)
    {
      v9 = [v4 objectForKeyedSubscript:@"usageType"];

      if (v9)
      {
        uint64_t v10 = [v4 objectForKeyedSubscript:@"usageType"];
        uint64_t v11 = [v10 integerValue];

        v12 = [(STAskForTimeRequest *)self initWithUsageType:v11 requestedResourceIdentifier:v6];
        if (v12)
        {
          uint64_t v13 = [v4 objectForKeyedSubscript:@"requestIdentifier"];
          requestIdentifier = v12->_requestIdentifier;
          v12->_requestIdentifier = (NSUUID *)v13;

          v15 = [v4 objectForKeyedSubscript:@"resourceDisplayName"];
          uint64_t v16 = [v15 copy];
          resourceDisplayName = v12->_resourceDisplayName;
          v12->_resourceDisplayName = (NSString *)v16;

          uint64_t v18 = [v4 objectForKeyedSubscript:@"timeRequested"];
          timeRequested = v12->_timeRequested;
          v12->_timeRequested = (NSNumber *)v18;

          objc_storeStrong((id *)&v12->_timeStamp, v8);
          v20 = [v4 objectForKeyedSubscript:@"oneMoreMinute"];
          v12->_oneMoreMinute = [v20 BOOLValue];

          uint64_t v21 = [v4 objectForKeyedSubscript:@"requestingUserDSID"];
          requestingUserDSID = v12->_requestingUserDSID;
          v12->_requestingUserDSID = (NSNumber *)v21;

          v23 = [v4 objectForKeyedSubscript:@"requestingUserDisplayName"];
          uint64_t v24 = [v23 copy];
          requestingUserDisplayName = v12->_requestingUserDisplayName;
          v12->_requestingUserDisplayName = (NSString *)v24;

          v26 = [v4 objectForKeyedSubscript:@"deliverQuietly"];
          v12->_deliverQuietly = [v26 BOOLValue];
        }
        self = v12;
        v9 = self;
      }
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setOneMoreMinute:(BOOL)a3
{
  if (a3)
  {
    timeRequested = self->_timeRequested;
    self->_timeRequested = (NSNumber *)&unk_1F349EBC0;
  }
  self->_oneMoreMinute = a3;
}

- (STAskForTimeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedResourceIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStamp"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ([v4 containsValueForKey:@"usageType"] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v22];

    uint64_t v21 = 0;
  }
  else
  {
    v9 = -[STAskForTimeRequest initWithUsageType:requestedResourceIdentifier:](self, "initWithUsageType:requestedResourceIdentifier:", [v4 decodeIntegerForKey:@"usageType"], v5);
    if (v9)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
      requestIdentifier = v9->_requestIdentifier;
      v9->_requestIdentifier = (NSUUID *)v10;

      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceDisplayName"];
      uint64_t v13 = [v12 copy];
      resourceDisplayName = v9->_resourceDisplayName;
      v9->_resourceDisplayName = (NSString *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeRequested"];
      timeRequested = v9->_timeRequested;
      v9->_timeRequested = (NSNumber *)v15;

      objc_storeStrong((id *)&v9->_timeStamp, v7);
      v9->_oneMoreMinute = [v4 decodeBoolForKey:@"oneMoreMinute"];
      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingUserDSID"];
      requestingUserDSID = v9->_requestingUserDSID;
      v9->_requestingUserDSID = (NSNumber *)v17;

      uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingUserDisplayName"];
      requestingUserDisplayName = v9->_requestingUserDisplayName;
      v9->_requestingUserDisplayName = (NSString *)v19;

      v9->_deliverQuietly = [v4 decodeBoolForKey:@"deliverQuietly"];
    }
    self = v9;
    uint64_t v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  requestIdentifier = self->_requestIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeInteger:self->_usageType forKey:@"usageType"];
  [v5 encodeObject:self->_requestedResourceIdentifier forKey:@"requestedResourceIdentifier"];
  [v5 encodeObject:self->_resourceDisplayName forKey:@"resourceDisplayName"];
  [v5 encodeObject:self->_timeRequested forKey:@"timeRequested"];
  [v5 encodeBool:self->_oneMoreMinute forKey:@"oneMoreMinute"];
  [v5 encodeObject:self->_timeStamp forKey:@"timeStamp"];
  [v5 encodeObject:self->_requestingUserDSID forKey:@"requestingUserDSID"];
  [v5 encodeObject:self->_requestingUserDisplayName forKey:@"requestingUserDisplayName"];
  [v5 encodeBool:self->_deliverQuietly forKey:@"deliverQuietly"];
}

- (NSDictionary)payload
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
  id v4 = [(STAskForTimeRequest *)self requestIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"requestIdentifier"];

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[STAskForTimeRequest usageType](self, "usageType"));
  [v3 setObject:v5 forKeyedSubscript:@"usageType"];

  uint64_t v6 = [(STAskForTimeRequest *)self requestedResourceIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"requestedResourceIdentifier"];

  uint64_t v7 = [(STAskForTimeRequest *)self resourceDisplayName];
  [v3 setObject:v7 forKeyedSubscript:@"resourceDisplayName"];

  BOOL v8 = [(STAskForTimeRequest *)self timeRequested];
  [v3 setObject:v8 forKeyedSubscript:@"timeRequested"];

  v9 = [(STAskForTimeRequest *)self timeStamp];
  [v3 setObject:v9 forKeyedSubscript:@"timeStamp"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[STAskForTimeRequest oneMoreMinute](self, "oneMoreMinute"));
  [v3 setObject:v10 forKeyedSubscript:@"oneMoreMinute"];

  uint64_t v11 = [(STAskForTimeRequest *)self requestingUserDSID];
  [v3 setObject:v11 forKeyedSubscript:@"requestingUserDSID"];

  v12 = [(STAskForTimeRequest *)self requestingUserDisplayName];
  [v3 setObject:v12 forKeyedSubscript:@"requestingUserDisplayName"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[STAskForTimeRequest deliverQuietly](self, "deliverQuietly"));
  [v3 setObject:v13 forKeyedSubscript:@"deliverQuietly"];

  return (NSDictionary *)v3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (NSString)requestedResourceIdentifier
{
  return self->_requestedResourceIdentifier;
}

- (NSString)resourceDisplayName
{
  return self->_resourceDisplayName;
}

- (void)setResourceDisplayName:(id)a3
{
}

- (NSNumber)timeRequested
{
  return self->_timeRequested;
}

- (void)setTimeRequested:(id)a3
{
}

- (BOOL)oneMoreMinute
{
  return self->_oneMoreMinute;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSNumber)requestingUserDSID
{
  return self->_requestingUserDSID;
}

- (void)setRequestingUserDSID:(id)a3
{
}

- (NSString)requestingUserDisplayName
{
  return self->_requestingUserDisplayName;
}

- (void)setRequestingUserDisplayName:(id)a3
{
}

- (BOOL)deliverQuietly
{
  return self->_deliverQuietly;
}

- (void)setDeliverQuietly:(BOOL)a3
{
  self->_deliverQuietly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserDisplayName, 0);
  objc_storeStrong((id *)&self->_requestingUserDSID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_timeRequested, 0);
  objc_storeStrong((id *)&self->_resourceDisplayName, 0);
  objc_storeStrong((id *)&self->_requestedResourceIdentifier, 0);
}

@end