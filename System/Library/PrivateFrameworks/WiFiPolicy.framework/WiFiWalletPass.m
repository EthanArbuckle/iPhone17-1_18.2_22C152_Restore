@interface WiFiWalletPass
- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3;
- (BOOL)matched;
- (NSDate)relevantDate;
- (NSSet)accessPoints;
- (NSSet)attributes;
- (NSString)SSID;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)password;
- (NSString)serialNumber;
- (NSString)uniqueIdentifier;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (int64_t)source;
- (unint64_t)type;
- (unint64_t)venueGroup;
- (unsigned)venueType;
- (void)setLocalizedDescription:(id)a3;
- (void)setMatched:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setRelevantDate:(id)a3;
- (void)setSSID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation WiFiWalletPass

- (int64_t)source
{
  return 1;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  v7 = [(WiFiWalletPass *)self SSID];
  [v6 appendFormat:@"SSID: %@ ", v7];

  v8 = [(WiFiWalletPass *)self password];
  v9 = @"YES";
  if (!v8) {
    v9 = @"NO";
  }
  [v6 appendFormat:@"Password: %@ ", v9];

  v10 = [(WiFiWalletPass *)self uniqueIdentifier];
  [v6 appendFormat:@"Idenitifer: %@ ", v10];

  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (NSString)SSID
{
  return self->SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)password
{
  return self->password;
}

- (void)setPassword:(id)a3
{
}

- (NSSet)attributes
{
  return self->attributes;
}

- (NSSet)accessPoints
{
  return self->accessPoints;
}

- (TBScore)qualityScore
{
  return self->qualityScore;
}

- (TBScore)popularityScore
{
  return self->popularityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unsigned)venueType
{
  return self->venueType;
}

- (unint64_t)venueGroup
{
  return self->venueGroup;
}

- (unint64_t)type
{
  return self->type;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)setRelevantDate:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->popularityScore, 0);
  objc_storeStrong((id *)&self->qualityScore, 0);
  objc_storeStrong((id *)&self->accessPoints, 0);
  objc_storeStrong((id *)&self->attributes, 0);
  objc_storeStrong((id *)&self->password, 0);

  objc_storeStrong((id *)&self->SSID, 0);
}

@end