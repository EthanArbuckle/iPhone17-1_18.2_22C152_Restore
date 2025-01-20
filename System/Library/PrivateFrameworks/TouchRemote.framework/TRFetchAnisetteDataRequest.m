@interface TRFetchAnisetteDataRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProvision;
- (TRFetchAnisetteDataRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldProvision:(BOOL)a3;
@end

@implementation TRFetchAnisetteDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TRFetchAnisetteDataRequest;
  [(TRMessage *)&v5 encodeWithCoder:v4];
  if (self->_shouldProvision) {
    [v4 encodeBool:1 forKey:@"TRAnisetteDataMessages_sP"];
  }
}

- (TRFetchAnisetteDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRFetchAnisetteDataRequest;
  objc_super v5 = [(TRMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_shouldProvision = [v4 decodeBoolForKey:@"TRAnisetteDataMessages_sP"];
  }

  return v5;
}

- (id)description
{
  if (self->_shouldProvision) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = [NSString stringWithFormat:@"shouldProvision:%@", v3];
  objc_super v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRFetchAnisetteDataRequest;
  v6 = [(TRMessage *)&v9 description];
  objc_super v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (BOOL)shouldProvision
{
  return self->_shouldProvision;
}

- (void)setShouldProvision:(BOOL)a3
{
  self->_shouldProvision = a3;
}

@end