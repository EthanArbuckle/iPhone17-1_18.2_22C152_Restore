@interface TRSetupNetworkResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNetwork;
- (TRSetupNetworkResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHasNetwork:(BOOL)a3;
@end

@implementation TRSetupNetworkResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TRSetupNetworkResponse;
  [(TRMessage *)&v5 encodeWithCoder:v4];
  if (self->_hasNetwork) {
    [v4 encodeBool:1 forKey:@"TRSetupNetworkMessages_hN"];
  }
}

- (TRSetupNetworkResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupNetworkResponse;
  objc_super v5 = [(TRMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_hasNetwork = [v4 decodeBoolForKey:@"TRSetupNetworkMessages_hN"];
  }

  return v5;
}

- (id)description
{
  if (self->_hasNetwork) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = [NSString stringWithFormat:@"hasNetwork:%@", v3];
  objc_super v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupNetworkResponse;
  v6 = [(TRMessage *)&v9 description];
  objc_super v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (BOOL)hasNetwork
{
  return self->_hasNetwork;
}

- (void)setHasNetwork:(BOOL)a3
{
  self->_hasNetwork = a3;
}

@end