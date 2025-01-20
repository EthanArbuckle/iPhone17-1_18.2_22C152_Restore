@interface WiFiCandidateNetworkStub
- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3;
- (BOOL)matched;
- (NSSet)accessPoints;
- (NSSet)attributes;
- (NSString)SSID;
- (NSString)password;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (int64_t)source;
- (unint64_t)type;
- (unint64_t)venueGroup;
- (unsigned)venueType;
- (void)dealloc;
- (void)setMatched:(BOOL)a3;
- (void)setSSID:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation WiFiCandidateNetworkStub

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiCandidateNetworkStub;
  [(WiFiCandidateNetworkStub *)&v3 dealloc];
}

- (NSSet)accessPoints
{
  return self->_accessPoints;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (BOOL)matched
{
  return self->_matched;
}

- (void)setMatched:(BOOL)a3
{
  self->_matched = a3;
}

- (NSString)password
{
  return self->_password;
}

- (TBScore)popularityScore
{
  return self->_popularityScore;
}

- (TBScore)qualityScore
{
  return self->_qualityScore;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (unsigned)venueType
{
  return self->_venueType;
}

@end