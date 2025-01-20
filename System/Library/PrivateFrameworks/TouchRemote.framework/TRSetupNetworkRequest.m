@interface TRSetupNetworkRequest
+ (BOOL)supportsSecureCoding;
- (NSString)networkPassword;
- (NSString)networkSSID;
- (TRSetupNetworkRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setNetworkPassword:(id)a3;
- (void)setNetworkSSID:(id)a3;
@end

@implementation TRSetupNetworkRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupNetworkRequest;
  [(TRMessage *)&v7 encodeWithCoder:v4];
  networkSSID = self->_networkSSID;
  if (networkSSID) {
    [v4 encodeObject:networkSSID forKey:@"TRSetupNetworkMessages_nS"];
  }
  networkPassword = self->_networkPassword;
  if (networkPassword) {
    [v4 encodeObject:networkPassword forKey:@"TRSetupNetworkMessages_nP"];
  }
}

- (TRSetupNetworkRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRSetupNetworkRequest;
  v5 = [(TRMessage *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupNetworkMessages_nS"];
    networkSSID = v5->_networkSSID;
    v5->_networkSSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupNetworkMessages_nP"];
    networkPassword = v5->_networkPassword;
    v5->_networkPassword = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  if (self->_networkPassword) {
    v3 = @"*********";
  }
  else {
    v3 = 0;
  }
  id v4 = [NSString stringWithFormat:@"networkSSID:[-%@-] networkPassword:[-%@-]", self->_networkSSID, v3];
  v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupNetworkRequest;
  uint64_t v6 = [(TRMessage *)&v9 description];
  objc_super v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (NSString)networkSSID
{
  return self->_networkSSID;
}

- (void)setNetworkSSID:(id)a3
{
}

- (NSString)networkPassword
{
  return self->_networkPassword;
}

- (void)setNetworkPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPassword, 0);
  objc_storeStrong((id *)&self->_networkSSID, 0);
}

@end