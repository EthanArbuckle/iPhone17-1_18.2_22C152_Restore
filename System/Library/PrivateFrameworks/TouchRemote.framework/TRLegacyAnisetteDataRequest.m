@interface TRLegacyAnisetteDataRequest
+ (BOOL)supportsSecureCoding;
- (NSString)dsid;
- (TRLegacyAnisetteDataRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation TRLegacyAnisetteDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRLegacyAnisetteDataRequest;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  dsid = self->_dsid;
  if (dsid) {
    [v4 encodeObject:dsid forKey:@"TRAnisetteDataMessages_d"];
  }
}

- (TRLegacyAnisetteDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRLegacyAnisetteDataRequest;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRAnisetteDataMessages_d"];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"dsid:[-%@-]", self->_dsid];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRLegacyAnisetteDataRequest;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end