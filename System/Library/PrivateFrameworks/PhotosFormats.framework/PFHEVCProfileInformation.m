@interface PFHEVCProfileInformation
- (NSNumber)level;
- (NSNumber)profile;
- (NSNumber)tier;
- (NSString)summaryDescription;
- (void)setLevel:(id)a3;
- (void)setProfile:(id)a3;
- (void)setTier:(id)a3;
@end

@implementation PFHEVCProfileInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_tier, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)setLevel:(id)a3
{
}

- (NSNumber)level
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTier:(id)a3
{
}

- (NSNumber)tier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProfile:(id)a3
{
}

- (NSNumber)profile
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)summaryDescription
{
  v3 = NSString;
  v4 = [(PFHEVCProfileInformation *)self profile];
  v5 = [(PFHEVCProfileInformation *)self tier];
  v6 = [(PFHEVCProfileInformation *)self level];
  [v6 doubleValue];
  v8 = [v3 stringWithFormat:@"%@/%@/%1.1f", v4, v5, v7 / 30.0];

  return (NSString *)v8;
}

@end