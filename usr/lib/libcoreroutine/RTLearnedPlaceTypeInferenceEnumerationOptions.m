@interface RTLearnedPlaceTypeInferenceEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)sortByCreationDate;
- (Class)enumeratedType;
- (NSArray)filteredToIdentifiers;
- (NSArray)filteredToLearnedPlaceIdentifiers;
- (NSArray)filteredToPlaceTypes;
- (NSArray)filteredToSessionIds;
- (NSDateInterval)dateInterval;
- (RTLearnedPlaceTypeInferenceEnumerationOptions)init;
- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 dateInterval:(id)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 filteredToPlaceTypes:(id)a9 filteredToIdentifiers:(id)a10 filteredToSessionIds:(id)a11 filteredToLearnedPlaceIdentifiers:(id)a12;
- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithCoder:(id)a3;
- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithDateInterval:(id)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 filteredToPlaceTypes:(id)a6 filteredToIdentifiers:(id)a7 filteredToSessionIds:(id)a8 filteredToLearnedPlaceIdentifiers:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (unint64_t)fetchLimit;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTLearnedPlaceTypeInferenceEnumerationOptions

- (RTLearnedPlaceTypeInferenceEnumerationOptions)init
{
  return [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 offset:0 dateInterval:0 sortByCreationDate:1 ascending:1 filteredToPlaceTypes:0 filteredToIdentifiers:0 filteredToSessionIds:0 filteredToLearnedPlaceIdentifiers:0];
}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithDateInterval:(id)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 filteredToPlaceTypes:(id)a6 filteredToIdentifiers:(id)a7 filteredToSessionIds:(id)a8 filteredToLearnedPlaceIdentifiers:(id)a9
{
  return [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 offset:0 dateInterval:a3 sortByCreationDate:a4 ascending:a5 filteredToPlaceTypes:a6 filteredToIdentifiers:a7 filteredToSessionIds:a8 filteredToLearnedPlaceIdentifiers:a9];
}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 dateInterval:(id)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 filteredToPlaceTypes:(id)a9 filteredToIdentifiers:(id)a10 filteredToSessionIds:(id)a11 filteredToLearnedPlaceIdentifiers:(id)a12
{
  id v15 = a6;
  id v16 = a9;
  id v26 = a10;
  id v25 = a11;
  id v17 = a12;
  v27.receiver = self;
  v27.super_class = (Class)RTLearnedPlaceTypeInferenceEnumerationOptions;
  v18 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a3;
    v18->_fetchLimit = a4;
    v18->_offset = a5;
    objc_storeStrong((id *)&v18->_dateInterval, a6);
    v19->_sortByCreationDate = a7;
    v19->_ascending = a8;
    objc_storeStrong((id *)&v19->_filteredToPlaceTypes, a9);
    objc_storeStrong((id *)&v19->_filteredToIdentifiers, a10);
    objc_storeStrong((id *)&v19->_filteredToSessionIds, a11);
    objc_storeStrong((id *)&v19->_filteredToLearnedPlaceIdentifiers, a12);
  }

  return v19;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[(id)[(id)[objc_opt_class() allocWithZone:a3] initWithBatchSize:self->_batchSize fetchLimit:self->_fetchLimit offset:self->_offset dateInterval:self->_dateInterval sortByCreationDate:self->_sortByCreationDate ascending:self->_ascending filteredToPlaceTypes:self->_filteredToPlaceTypes filteredToIdentifiers:self->_filteredToIdentifiers filteredToSessionIds:self->_filteredToSessionIds filteredToLearnedPlaceIdentifiers:self->_filteredToLearnedPlaceIdentifiers];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize = self->_batchSize;
  id v5 = a3;
  [v5 encodeInteger:batchSize forKey:@"batchSize"];
  [v5 encodeInteger:self->_fetchLimit forKey:@"fetchLimit"];
  [v5 encodeInteger:self->_offset forKey:@"offset"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeInteger:self->_sortByCreationDate forKey:@"sortByCreationDate"];
  [v5 encodeInteger:self->_ascending forKey:@"ascending"];
  [v5 encodeObject:self->_filteredToPlaceTypes forKey:@"filteredToPlaceTypes"];
  [v5 encodeObject:self->_filteredToIdentifiers forKey:@"filteredToIdentifiers"];
  [v5 encodeObject:self->_filteredToSessionIds forKey:@"filteredToSessionIds"];
  [v5 encodeObject:self->_filteredToLearnedPlaceIdentifiers forKey:@"filteredToLearnedPlaceIdentifiers"];
}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v15 = [v3 decodeIntegerForKey:@"batchSize"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"fetchLimit"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"offset"];
  v6 = [v3 decodeObjectForKey:@"dateInterval"];
  BOOL v7 = [v3 decodeIntegerForKey:@"sortByCreationDate"] != 0;
  BOOL v8 = [v3 decodeIntegerForKey:@"ascending"] != 0;
  v9 = [v3 decodeObjectForKey:@"filteredToPlaceTypes"];
  v10 = [v3 decodeObjectForKey:@"filteredToIdentifiers"];
  v11 = [v3 decodeObjectForKey:@"filteredToSessionIds"];
  v12 = [v3 decodeObjectForKey:@"filteredToLearnedPlaceIdentifiers"];

  v13 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self initWithBatchSize:v15 fetchLimit:v4 offset:v5 dateInterval:v6 sortByCreationDate:v7 ascending:v8 filteredToPlaceTypes:v9 filteredToIdentifiers:v10 filteredToSessionIds:v11 filteredToLearnedPlaceIdentifiers:v12];
  return v13;
}

- (id)description
{
  uint64_t v15 = NSString;
  unint64_t v3 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self batchSize];
  unint64_t v4 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self fetchLimit];
  unint64_t v5 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self offset];
  v6 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self dateInterval];
  if ([(RTLearnedPlaceTypeInferenceEnumerationOptions *)self sortByCreationDate]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if ([(RTLearnedPlaceTypeInferenceEnumerationOptions *)self ascending]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  v9 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self filteredToPlaceTypes];
  v10 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self filteredToIdentifiers];
  v11 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self filteredToSessionIds];
  v12 = [(RTLearnedPlaceTypeInferenceEnumerationOptions *)self filteredToLearnedPlaceIdentifiers];
  v13 = [v15 stringWithFormat:@"batchSize, %lu, fetchLimit, %lu, offset, %lu, dateinterval, %@, sort by creation date, %@, ascending, %@, filteredToPlaceTypes, %@, filteredToIdentifiers, %@, filteredToSessionIds, %@, filteredToLearnedPlaceIdentifiers, %@,", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)sortByCreationDate
{
  return self->_sortByCreationDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)filteredToPlaceTypes
{
  return self->_filteredToPlaceTypes;
}

- (NSArray)filteredToLearnedPlaceIdentifiers
{
  return self->_filteredToLearnedPlaceIdentifiers;
}

- (NSArray)filteredToIdentifiers
{
  return self->_filteredToIdentifiers;
}

- (NSArray)filteredToSessionIds
{
  return self->_filteredToSessionIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredToSessionIds, 0);
  objc_storeStrong((id *)&self->_filteredToIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredToLearnedPlaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredToPlaceTypes, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end