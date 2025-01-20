@interface TRSetupActivationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)activated;
- (NSError)error;
- (TRSetupActivationResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setError:(id)a3;
@end

@implementation TRSetupActivationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TRSetupActivationResponse;
  [(TRMessage *)&v5 encodeWithCoder:v4];
  if (self->_activated) {
    [v4 encodeBool:1 forKey:@"TRSetupNetworkMessages_hN"];
  }
  [v4 encodeObject:self->_error forKey:@"TRSetupActivationMessages_err"];
}

- (TRSetupActivationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupActivationResponse;
  objc_super v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_activated = [v4 decodeBoolForKey:@"TRSetupNetworkMessages_hN"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupActivationMessages_err"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (id)description
{
  if (self->_activated) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = [NSString stringWithFormat:@"activated:%@ error:%@", v3, self->_error];
  objc_super v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupActivationResponse;
  uint64_t v6 = [(TRMessage *)&v9 description];
  v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end