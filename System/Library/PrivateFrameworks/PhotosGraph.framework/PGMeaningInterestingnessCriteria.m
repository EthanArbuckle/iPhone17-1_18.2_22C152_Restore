@interface PGMeaningInterestingnessCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)isValid;
- (BOOL)mustBeInteresting;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSString)description;
- (void)setMustBeInteresting:(BOOL)a3;
@end

@implementation PGMeaningInterestingnessCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"mustBeInteresting"];

  objc_msgSend(v5, "setMustBeInteresting:", objc_msgSend(v6, "BOOLValue"));
  return v5;
}

+ (id)criteriaKey
{
  return @"Interestingness";
}

- (void)setMustBeInteresting:(BOOL)a3
{
  self->_mustBeInteresting = a3;
}

- (BOOL)mustBeInteresting
{
  return self->_mustBeInteresting;
}

- (NSString)description
{
  v2 = NSString;
  BOOL v3 = [(PGMeaningInterestingnessCriteria *)self mustBeInteresting];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  return (NSString *)[v2 stringWithFormat:@"mustBeInteresting: %@\n", v4];
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
  id v5 = a3;
  if ([(PGMeaningInterestingnessCriteria *)self mustBeInteresting]
    && ([v5 isInteresting] & 1) == 0)
  {
    char v6 = [v5 isSmartInteresting];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

@end