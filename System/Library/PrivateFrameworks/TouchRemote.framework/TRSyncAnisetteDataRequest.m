@interface TRSyncAnisetteDataRequest
+ (BOOL)supportsSecureCoding;
- (NSData)simData;
- (TRSyncAnisetteDataRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSimData:(id)a3;
@end

@implementation TRSyncAnisetteDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSyncAnisetteDataRequest;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  simData = self->_simData;
  if (simData) {
    [v4 encodeObject:simData forKey:@"TRAnisetteDataMessages_sD"];
  }
}

- (TRSyncAnisetteDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSyncAnisetteDataRequest;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRAnisetteDataMessages_sD"];
    simData = v5->_simData;
    v5->_simData = (NSData *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"simData:[-%@-]", self->_simData];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRSyncAnisetteDataRequest;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (NSData)simData
{
  return self->_simData;
}

- (void)setSimData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end