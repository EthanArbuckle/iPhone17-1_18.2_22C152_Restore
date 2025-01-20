@interface PGMeaningLocationCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)excludeFrequentLocations;
- (BOOL)excludeHomeWorkLocations;
- (BOOL)includeFrequentLocations;
- (BOOL)includeHomeLocations;
- (BOOL)includeWorkLocations;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSString)description;
- (void)setExcludeFrequentLocations:(BOOL)a3;
- (void)setExcludeHomeWorkLocations:(BOOL)a3;
- (void)setIncludeFrequentLocations:(BOOL)a3;
- (void)setIncludeHomeLocations:(BOOL)a3;
- (void)setIncludeWorkLocations:(BOOL)a3;
@end

@implementation PGMeaningLocationCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"excludeFrequentLocations"];
  objc_msgSend(v5, "setExcludeFrequentLocations:", objc_msgSend(v6, "BOOLValue"));

  v7 = [v4 objectForKeyedSubscript:@"excludeHomeWorkLocations"];
  objc_msgSend(v5, "setExcludeHomeWorkLocations:", objc_msgSend(v7, "BOOLValue"));

  v8 = [v4 objectForKeyedSubscript:@"includeFrequentLocations"];
  objc_msgSend(v5, "setIncludeFrequentLocations:", objc_msgSend(v8, "BOOLValue"));

  v9 = [v4 objectForKeyedSubscript:@"includeHomeLocations"];
  objc_msgSend(v5, "setIncludeHomeLocations:", objc_msgSend(v9, "BOOLValue"));

  v10 = [v4 objectForKeyedSubscript:@"includeWorkLocations"];

  objc_msgSend(v5, "setIncludeWorkLocations:", objc_msgSend(v10, "BOOLValue"));
  return v5;
}

+ (id)criteriaKey
{
  return @"Location";
}

- (void)setIncludeFrequentLocations:(BOOL)a3
{
  self->_includeFrequentLocations = a3;
}

- (BOOL)includeFrequentLocations
{
  return self->_includeFrequentLocations;
}

- (void)setIncludeWorkLocations:(BOOL)a3
{
  self->_includeWorkLocations = a3;
}

- (BOOL)includeWorkLocations
{
  return self->_includeWorkLocations;
}

- (void)setIncludeHomeLocations:(BOOL)a3
{
  self->_includeHomeLocations = a3;
}

- (BOOL)includeHomeLocations
{
  return self->_includeHomeLocations;
}

- (void)setExcludeHomeWorkLocations:(BOOL)a3
{
  self->_excludeHomeWorkLocations = a3;
}

- (BOOL)excludeHomeWorkLocations
{
  return self->_excludeHomeWorkLocations;
}

- (void)setExcludeFrequentLocations:(BOOL)a3
{
  self->_excludeFrequentLocations = a3;
}

- (BOOL)excludeFrequentLocations
{
  return self->_excludeFrequentLocations;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if ([(PGMeaningLocationCriteria *)self excludeFrequentLocations]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"excludeFrequentLocations: %@\n", v4];
  if ([(PGMeaningLocationCriteria *)self excludeHomeWorkLocations]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"excludeHomeWorkLocations: %@\n", v5];
  if ([(PGMeaningLocationCriteria *)self includeWorkLocations]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"includeWorkLocations: %@\n", v6];
  if ([(PGMeaningLocationCriteria *)self includeHomeLocations]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"includeHomeLocations: %@\n", v7];
  return (NSString *)v3;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5 = a4;
  if (([(PGMeaningLocationCriteria *)self excludeFrequentLocations]
     || [(PGMeaningLocationCriteria *)self excludeHomeWorkLocations]
     || [(PGMeaningLocationCriteria *)self includeFrequentLocations]
     || [(PGMeaningLocationCriteria *)self includeHomeLocations]
     || [(PGMeaningLocationCriteria *)self includeWorkLocations])
    && ![v5 hasAddressNodes])
  {
    LOBYTE(self) = 0;
  }
  else
  {
    if ([(PGMeaningLocationCriteria *)self includeHomeLocations]) {
      int v6 = [v5 happensPartiallyAtMyHome];
    }
    else {
      int v6 = 1;
    }
    int v7 = ![(PGMeaningLocationCriteria *)self includeWorkLocations];
    int v8 = v7 & v6;
    if ((v7 & 1) == 0 && v6) {
      int v8 = [v5 happensPartiallyAtMyWork];
    }
    int v9 = ![(PGMeaningLocationCriteria *)self excludeFrequentLocations];
    int v10 = v9 & v8;
    if ((v9 & 1) == 0 && v8) {
      int v10 = [v5 happensAtFrequentLocation] ^ 1;
    }
    int v11 = ![(PGMeaningLocationCriteria *)self includeFrequentLocations];
    int v12 = v11 & v10;
    if ((v11 & 1) == 0 && v10) {
      int v12 = [v5 happensAtFrequentLocation];
    }
    int v13 = ![(PGMeaningLocationCriteria *)self excludeHomeWorkLocations];
    LOBYTE(self) = v13 & v12;
    if ((v13 & 1) == 0 && v12) {
      LODWORD(self) = [v5 happensPartiallyAtMyHomeOrWork] ^ 1;
    }
  }

  return (char)self;
}

@end