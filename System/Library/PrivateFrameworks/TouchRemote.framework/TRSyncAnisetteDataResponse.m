@interface TRSyncAnisetteDataResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)didSucceed;
- (TRSyncAnisetteDataResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSucceed:(BOOL)a3;
@end

@implementation TRSyncAnisetteDataResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TRSyncAnisetteDataResponse;
  [(TRMessage *)&v5 encodeWithCoder:v4];
  if (self->_didSucceed) {
    [v4 encodeBool:1 forKey:@"TRAnisetteDataMessages_dS"];
  }
}

- (TRSyncAnisetteDataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSyncAnisetteDataResponse;
  objc_super v5 = [(TRMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_didSucceed = [v4 decodeBoolForKey:@"TRAnisetteDataMessages_dS"];
  }

  return v5;
}

- (id)description
{
  if (self->_didSucceed) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = [NSString stringWithFormat:@"didSucceed:%@", v3];
  objc_super v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRSyncAnisetteDataResponse;
  v6 = [(TRMessage *)&v9 description];
  objc_super v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

@end