@interface PDCandidateRelevantPass
+ (id)_dateForPassComparison:(id)a3 priority:(unint64_t)a4;
- (BOOL)hasLocations;
- (BOOL)isEqual:(id)a3;
- (NSArray)relevantDates;
- (NSData)manifestHash;
- (NSSet)embeddedBeacons;
- (NSString)groupingIdentifier;
- (NSString)organizationName;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (NSString)uniqueIdentifier;
- (PKPassRelevantDate)matchedRelevantDate;
- (int64_t)comparePassDatesToPass:(id)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)setEmbeddedBeacons:(id)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setHasLocations:(BOOL)a3;
- (void)setManifestHash:(id)a3;
- (void)setMatchedRelevantDate:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setRelevantDates:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation PDCandidateRelevantPass

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)v4[2];
    v6 = self->_uniqueIdentifier;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      unsigned __int8 v9 = 0;
      if (v6 && v7) {
        unsigned __int8 v9 = [(NSString *)v6 isEqualToString:v7];
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (int64_t)comparePassDatesToPass:(id)a3
{
  v4 = +[PDCandidateRelevantPass _dateForPassComparison:self priority:0];
  uint64_t v5 = +[PDCandidateRelevantPass _dateForPassComparison:self priority:0];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v4) {
      int64_t v8 = -1;
    }
    else {
      int64_t v8 = v5 != 0;
    }
  }
  else
  {
    int64_t v8 = (int64_t)[v4 compare:v5];
  }

  return v8;
}

+ (id)_dateForPassComparison:(id)a3 priority:(unint64_t)a4
{
  uint64_t v5 = [a3 matchedRelevantDate];
  v6 = [v5 relevantDateWithPriority:a4];

  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
}

- (NSArray)relevantDates
{
  return self->_relevantDates;
}

- (void)setRelevantDates:(id)a3
{
}

- (PKPassRelevantDate)matchedRelevantDate
{
  return self->_matchedRelevantDate;
}

- (void)setMatchedRelevantDate:(id)a3
{
}

- (NSSet)embeddedBeacons
{
  return self->_embeddedBeacons;
}

- (void)setEmbeddedBeacons:(id)a3
{
}

- (BOOL)hasLocations
{
  return self->_hasLocations;
}

- (void)setHasLocations:(BOOL)a3
{
  self->_hasLocations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedBeacons, 0);
  objc_storeStrong((id *)&self->_matchedRelevantDate, 0);
  objc_storeStrong((id *)&self->_relevantDates, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end