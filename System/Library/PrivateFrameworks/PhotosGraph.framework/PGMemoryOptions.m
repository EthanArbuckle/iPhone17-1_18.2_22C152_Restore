@interface PGMemoryOptions
+ (id)stringForReason:(unint64_t)a3;
- (CLLocation)location;
- (NSArray)blockedMemories;
- (NSArray)existingMemories;
- (NSArray)existingSuggestions;
- (NSArray)peopleNames;
- (NSDate)baseMemoryCreationUniversalDate;
- (NSDate)lastMemoryCreationUniversalDate;
- (NSDate)universalDate;
- (NSDictionary)extraParameters;
- (NSSet)blockedFeatures;
- (PGMemoryOptions)initWithReason:(unint64_t)a3 universalDate:(id)a4 location:(id)a5 peopleNames:(id)a6;
- (double)forcedBeta;
- (id)description;
- (unint64_t)randomSeed;
- (unint64_t)reason;
- (void)setBaseMemoryCreationUniversalDate:(id)a3;
- (void)setBlockedFeatures:(id)a3;
- (void)setBlockedMemories:(id)a3;
- (void)setExistingMemories:(id)a3;
- (void)setExistingSuggestions:(id)a3;
- (void)setExtraParameters:(id)a3;
- (void)setForcedBeta:(double)a3;
- (void)setLastMemoryCreationUniversalDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPeopleNames:(id)a3;
- (void)setRandomSeed:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setUniversalDate:(id)a3;
@end

@implementation PGMemoryOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong((id *)&self->_baseMemoryCreationUniversalDate, 0);
  objc_storeStrong((id *)&self->_lastMemoryCreationUniversalDate, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_blockedFeatures, 0);
  objc_storeStrong((id *)&self->_blockedMemories, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_universalDate, 0);
}

- (void)setForcedBeta:(double)a3
{
  self->_forcedBeta = a3;
}

- (double)forcedBeta
{
  return self->_forcedBeta;
}

- (void)setRandomSeed:(unint64_t)a3
{
  self->_randomSeed = a3;
}

- (unint64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setExtraParameters:(id)a3
{
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (void)setBaseMemoryCreationUniversalDate:(id)a3
{
}

- (NSDate)baseMemoryCreationUniversalDate
{
  return self->_baseMemoryCreationUniversalDate;
}

- (void)setLastMemoryCreationUniversalDate:(id)a3
{
}

- (NSDate)lastMemoryCreationUniversalDate
{
  return self->_lastMemoryCreationUniversalDate;
}

- (void)setExistingSuggestions:(id)a3
{
}

- (NSArray)existingSuggestions
{
  return self->_existingSuggestions;
}

- (void)setBlockedFeatures:(id)a3
{
}

- (NSSet)blockedFeatures
{
  return self->_blockedFeatures;
}

- (void)setBlockedMemories:(id)a3
{
}

- (NSArray)blockedMemories
{
  return self->_blockedMemories;
}

- (void)setExistingMemories:(id)a3
{
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (void)setPeopleNames:(id)a3
{
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)universalDate
{
  return self->_universalDate;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)description
{
  v3 = +[PGMemoryOptions stringForReason:self->_reason];
  v4 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_universalDate dateStyle:2 timeStyle:0];
  [(CLLocation *)self->_location coordinate];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"(%.5f,%.5f)", v5, v6);
  v8 = [(NSArray *)self->_peopleNames componentsJoinedByString:@", "];
  v9 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_lastMemoryCreationUniversalDate dateStyle:2 timeStyle:0];
  v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryOptions;
  v11 = [(PGMemoryOptions *)&v14 description];
  objc_msgSend(v10, "stringWithFormat:", @"%@\n\treason: %@\n\tdate: %@\n\tlocation; %@\n\tpeopleNames: %@\n\texistingMemories: %d\n\tblockedMemories: %d\n\tlastMemoryCreationUniversalDate: %@",
    v11,
    v3,
    v4,
    v7,
    v8,
    [(NSArray *)self->_existingMemories count],
    [(NSArray *)self->_blockedMemories count],
  v12 = v9);

  return v12;
}

- (void)setUniversalDate:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = (NSDate *)v4;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  universalDate = self->_universalDate;
  self->_universalDate = v5;
}

- (PGMemoryOptions)initWithReason:(unint64_t)a3 universalDate:(id)a4 location:(id)a5 peopleNames:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGMemoryOptions;
  v13 = [(PGMemoryOptions *)&v18 init];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_reason = a3;
    if (v10)
    {
      v15 = (NSDate *)v10;
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C9C8] date];
    }
    universalDate = v14->_universalDate;
    v14->_universalDate = v15;

    objc_storeStrong((id *)&v14->_location, a5);
    objc_storeStrong((id *)&v14->_peopleNames, a6);
  }

  return v14;
}

+ (id)stringForReason:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Illegal";
  }
  else {
    return off_1E68E4E60[a3];
  }
}

@end