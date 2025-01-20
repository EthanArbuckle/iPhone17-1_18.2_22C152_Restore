@interface MOEventPeopleDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)isGComplete;
- (MOEventPeopleDiscovery)initWithCoder:(id)a3;
- (NSNumber)densityScanDuration;
- (NSNumber)densityScore;
- (NSNumber)pCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)gaPR;
- (void)encodeWithCoder:(id)a3;
- (void)setDensityScanDuration:(id)a3;
- (void)setDensityScore:(id)a3;
- (void)setGaPR:(int64_t)a3;
- (void)setIsGComplete:(BOOL)a3;
- (void)setPCount:(id)a3;
@end

@implementation MOEventPeopleDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isGComplete = self->_isGComplete;
  id v5 = a3;
  [v5 encodeBool:isGComplete forKey:@"isGComplete"];
  [v5 encodeInteger:self->_gaPR forKey:@"gPRelationship"];
  [v5 encodeObject:self->_pCount forKey:@"pC"];
  [v5 encodeObject:self->_densityScore forKey:@"densityScore"];
  [v5 encodeObject:self->_densityScanDuration forKey:@"densityScanDuration"];
}

- (MOEventPeopleDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventPeopleDiscovery;
  id v5 = [(MOEventPeopleDiscovery *)&v13 init];
  if (v5)
  {
    v5->_BOOL isGComplete = [v4 decodeBoolForKey:@"isGComplete"];
    v5->_gaPR = [v4 decodeIntegerForKey:@"gPRelationship"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pC"];
    pCount = v5->_pCount;
    v5->_pCount = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"densityScore"];
    densityScore = v5->_densityScore;
    v5->_densityScore = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"densityScanDuration"];
    densityScanDuration = v5->_densityScanDuration;
    v5->_densityScanDuration = (NSNumber *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventPeopleDiscovery);
  v4->_BOOL isGComplete = self->_isGComplete;
  v4->_gaPR = self->_gaPR;
  objc_storeStrong((id *)&v4->_pCount, self->_pCount);
  objc_storeStrong((id *)&v4->_densityScore, self->_densityScore);
  objc_storeStrong((id *)&v4->_densityScanDuration, self->_densityScanDuration);
  return v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"isGComplete, %d, pr, %lu, social context count, %@, density score, %@, scan duration, %@", self->_isGComplete, self->_gaPR, self->_pCount, self->_densityScore, self->_densityScanDuration];
  return v2;
}

- (BOOL)isGComplete
{
  return self->_isGComplete;
}

- (void)setIsGComplete:(BOOL)a3
{
  self->_BOOL isGComplete = a3;
}

- (int64_t)gaPR
{
  return self->_gaPR;
}

- (void)setGaPR:(int64_t)a3
{
  self->_gaPR = a3;
}

- (NSNumber)pCount
{
  return self->_pCount;
}

- (void)setPCount:(id)a3
{
}

- (NSNumber)densityScore
{
  return self->_densityScore;
}

- (void)setDensityScore:(id)a3
{
}

- (NSNumber)densityScanDuration
{
  return self->_densityScanDuration;
}

- (void)setDensityScanDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityScanDuration, 0);
  objc_storeStrong((id *)&self->_densityScore, 0);
  objc_storeStrong((id *)&self->_pCount, 0);
}

@end