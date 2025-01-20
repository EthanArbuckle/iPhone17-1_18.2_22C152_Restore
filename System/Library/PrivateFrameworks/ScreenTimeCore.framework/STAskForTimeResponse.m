@interface STAskForTimeResponse
+ (BOOL)supportsSecureCoding;
- (NSDate)timeStamp;
- (NSDictionary)payload;
- (NSNumber)amountGranted;
- (NSNumber)respondingUserDSID;
- (NSUUID)associatedRequestIdentifier;
- (STAskForTimeResponse)init;
- (STAskForTimeResponse)initWithCoder:(id)a3;
- (STAskForTimeResponse)initWithPayload:(id)a3;
- (int64_t)answer;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountGranted:(id)a3;
- (void)setAnswer:(int64_t)a3;
- (void)setAssociatedRequestIdentifier:(id)a3;
- (void)setRespondingUserDSID:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation STAskForTimeResponse

- (STAskForTimeResponse)initWithPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"associatedRequestIdentifier"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"timeStamp"];
  v7 = (void *)v6;
  v8 = 0;
  if (v5)
  {
    if (v6)
    {
      v8 = [v4 objectForKeyedSubscript:@"answer"];

      if (v8)
      {
        v17.receiver = self;
        v17.super_class = (Class)STAskForTimeResponse;
        v9 = [(STAskForTimeResponse *)&v17 init];
        v10 = v9;
        if (v9)
        {
          objc_storeStrong((id *)&v9->_associatedRequestIdentifier, v5);
          v11 = [v4 objectForKeyedSubscript:@"answer"];
          v10->_answer = [v11 integerValue];

          uint64_t v12 = [v4 objectForKeyedSubscript:@"respondingUserDSID"];
          respondingUserDSID = v10->_respondingUserDSID;
          v10->_respondingUserDSID = (NSNumber *)v12;

          uint64_t v14 = [v4 objectForKeyedSubscript:@"amountGranted"];
          amountGranted = v10->_amountGranted;
          v10->_amountGranted = (NSNumber *)v14;

          objc_storeStrong((id *)&v10->_timeStamp, v7);
        }
        self = v10;
        v8 = self;
      }
    }
  }

  return v8;
}

- (STAskForTimeResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeResponse;
  return [(STAskForTimeResponse *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STAskForTimeResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedRequestIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStamp"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ([v4 containsValueForKey:@"answer"] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v16];

    v15 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAskForTimeResponse;
    v9 = [(STAskForTimeResponse *)&v18 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_associatedRequestIdentifier, v5);
      v10->_answer = [v4 decodeIntegerForKey:@"answer"];
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"respondingUserDSID"];
      respondingUserDSID = v10->_respondingUserDSID;
      v10->_respondingUserDSID = (NSNumber *)v11;

      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountGranted"];
      amountGranted = v10->_amountGranted;
      v10->_amountGranted = (NSNumber *)v13;

      objc_storeStrong((id *)&v10->_timeStamp, v7);
    }
    self = v10;
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  associatedRequestIdentifier = self->_associatedRequestIdentifier;
  id v5 = a3;
  [v5 encodeObject:associatedRequestIdentifier forKey:@"associatedRequestIdentifier"];
  [v5 encodeInteger:self->_answer forKey:@"answer"];
  [v5 encodeObject:self->_respondingUserDSID forKey:@"respondingUserDSID"];
  [v5 encodeObject:self->_amountGranted forKey:@"amountGranted"];
  [v5 encodeObject:self->_timeStamp forKey:@"timeStamp"];
}

- (NSDictionary)payload
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
  id v4 = [(STAskForTimeResponse *)self associatedRequestIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"associatedRequestIdentifier"];

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[STAskForTimeResponse answer](self, "answer"));
  [v3 setObject:v5 forKeyedSubscript:@"answer"];

  uint64_t v6 = [(STAskForTimeResponse *)self respondingUserDSID];
  [v3 setObject:v6 forKeyedSubscript:@"respondingUserDSID"];

  v7 = [(STAskForTimeResponse *)self amountGranted];
  [v3 setObject:v7 forKeyedSubscript:@"amountGranted"];

  BOOL v8 = [(STAskForTimeResponse *)self timeStamp];
  [v3 setObject:v8 forKeyedSubscript:@"timeStamp"];

  return (NSDictionary *)v3;
}

- (NSUUID)associatedRequestIdentifier
{
  return self->_associatedRequestIdentifier;
}

- (void)setAssociatedRequestIdentifier:(id)a3
{
}

- (int64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(int64_t)a3
{
  self->_answer = a3;
}

- (NSNumber)respondingUserDSID
{
  return self->_respondingUserDSID;
}

- (void)setRespondingUserDSID:(id)a3
{
}

- (NSNumber)amountGranted
{
  return self->_amountGranted;
}

- (void)setAmountGranted:(id)a3
{
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_amountGranted, 0);
  objc_storeStrong((id *)&self->_respondingUserDSID, 0);
  objc_storeStrong((id *)&self->_associatedRequestIdentifier, 0);
}

@end