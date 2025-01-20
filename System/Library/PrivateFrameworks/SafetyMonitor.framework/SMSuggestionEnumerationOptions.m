@interface SMSuggestionEnumerationOptions
+ (BOOL)supportsSecureCoding;
+ (id)getEnumerationOptionsForLatestSuggestionSortedByCreationDateIncludeSuppressed:(BOOL)a3 filteredToSuggestionTriggers:(id)a4 filteredToSuggestionUserTypes:(id)a5 filteredToSessionTypes:(id)a6;
- (BOOL)ascending;
- (BOOL)includeSuppressed;
- (BOOL)sortByCreationDate;
- (Class)enumeratedType;
- (NSArray)filteredToSessionTypes;
- (NSArray)filteredToSuggestionSessionTypes;
- (NSArray)filteredToSuggestionTriggers;
- (NSArray)filteredToSuggestionUserTypes;
- (NSDateInterval)dateInterval;
- (SMSuggestionEnumerationOptions)init;
- (SMSuggestionEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 includeSuppressed:(BOOL)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 dateInterval:(id)a9 filteredToSuggestionTriggers:(id)a10 filteredToSuggestionUserTypes:(id)a11 filteredToSessionTypes:(id)a12;
- (SMSuggestionEnumerationOptions)initWithCoder:(id)a3;
- (SMSuggestionEnumerationOptions)initWithIncludeSuppressed:(BOOL)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 dateInterval:(id)a6 filteredToSuggestionTriggers:(id)a7 filteredToSuggestionUserTypes:(id)a8 filteredToSessionTypes:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (unint64_t)fetchLimit;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSuggestionEnumerationOptions

- (SMSuggestionEnumerationOptions)init
{
  return [(SMSuggestionEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 offset:0 includeSuppressed:1 sortByCreationDate:0 ascending:0 dateInterval:0 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];
}

- (SMSuggestionEnumerationOptions)initWithIncludeSuppressed:(BOOL)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 dateInterval:(id)a6 filteredToSuggestionTriggers:(id)a7 filteredToSuggestionUserTypes:(id)a8 filteredToSessionTypes:(id)a9
{
  return [(SMSuggestionEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 offset:0 includeSuppressed:a3 sortByCreationDate:a4 ascending:a5 dateInterval:a6 filteredToSuggestionTriggers:a7 filteredToSuggestionUserTypes:a8 filteredToSessionTypes:a9];
}

- (SMSuggestionEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 includeSuppressed:(BOOL)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 dateInterval:(id)a9 filteredToSuggestionTriggers:(id)a10 filteredToSuggestionUserTypes:(id)a11 filteredToSessionTypes:(id)a12
{
  id v15 = a9;
  id v16 = a10;
  id v25 = a11;
  id v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)SMSuggestionEnumerationOptions;
  v18 = [(SMSuggestionEnumerationOptions *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a3;
    v18->_fetchLimit = a4;
    v18->_offset = a5;
    v18->_includeSuppressed = a6;
    v18->_sortByCreationDate = a7;
    v18->_ascending = a8;
    objc_storeStrong((id *)&v18->_dateInterval, a9);
    objc_storeStrong((id *)&v19->_filteredToSuggestionTriggers, a10);
    objc_storeStrong((id *)&v19->_filteredToSuggestionUserTypes, a11);
    objc_storeStrong((id *)&v19->_filteredToSessionTypes, a12);
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
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", self->_batchSize, self->_fetchLimit, self->_offset, self->_includeSuppressed, self->_sortByCreationDate, self->_ascending, self->_dateInterval, self->_filteredToSuggestionTriggers, self->_filteredToSuggestionUserTypes, self->_filteredToSessionTypes);
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
  [v5 encodeBool:self->_includeSuppressed forKey:@"includeSuppressed"];
  [v5 encodeInteger:self->_sortByCreationDate forKey:@"sortByCreationDate"];
  [v5 encodeInteger:self->_ascending forKey:@"ascending"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_filteredToSuggestionTriggers forKey:@"filteredToSuggestionTriggers"];
  [v5 encodeObject:self->_filteredToSuggestionUserTypes forKey:@"filteredToSuggestionUserTypes"];
  [v5 encodeObject:self->_filteredToSessionTypes forKey:@"filteredToSessionTypes"];
}

- (SMSuggestionEnumerationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v15 = [v3 decodeIntegerForKey:@"batchSize"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"fetchLimit"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"offset"];
  uint64_t v6 = [v3 decodeBoolForKey:@"includeSuppressed"];
  BOOL v7 = [v3 decodeIntegerForKey:@"sortByCreationDate"] != 0;
  BOOL v8 = [v3 decodeIntegerForKey:@"ascending"] != 0;
  v9 = [v3 decodeObjectForKey:@"dateInterval"];
  v10 = [v3 decodeObjectForKey:@"filteredToSuggestionTriggers"];
  v11 = [v3 decodeObjectForKey:@"filteredToSuggestionUserTypes"];
  v12 = [v3 decodeObjectForKey:@"filteredToSessionTypes"];

  v13 = [(SMSuggestionEnumerationOptions *)self initWithBatchSize:v15 fetchLimit:v4 offset:v5 includeSuppressed:v6 sortByCreationDate:v7 ascending:v8 dateInterval:v9 filteredToSuggestionTriggers:v10 filteredToSuggestionUserTypes:v11 filteredToSessionTypes:v12];
  return v13;
}

- (id)description
{
  uint64_t v15 = NSString;
  unint64_t v3 = [(SMSuggestionEnumerationOptions *)self batchSize];
  unint64_t v4 = [(SMSuggestionEnumerationOptions *)self fetchLimit];
  unint64_t v5 = [(SMSuggestionEnumerationOptions *)self offset];
  if ([(SMSuggestionEnumerationOptions *)self includeSuppressed]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(SMSuggestionEnumerationOptions *)self sortByCreationDate]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if ([(SMSuggestionEnumerationOptions *)self ascending]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  v9 = [(SMSuggestionEnumerationOptions *)self dateInterval];
  v10 = [(SMSuggestionEnumerationOptions *)self filteredToSuggestionTriggers];
  v11 = [(SMSuggestionEnumerationOptions *)self filteredToSuggestionUserTypes];
  v12 = [(SMSuggestionEnumerationOptions *)self filteredToSessionTypes];
  v13 = [v15 stringWithFormat:@"batchSize, %lu, fetchLimit, %lu, offset, %lu, include suppressed, %@, sort by creation date, %@, ascending, %@, dateinterval, %@, filteredToSuggestionTriggers, %@, filteredToSuggestionUserTypes, %@, filteredToSessionTypes, %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

+ (id)getEnumerationOptionsForLatestSuggestionSortedByCreationDateIncludeSuppressed:(BOOL)a3 filteredToSuggestionTriggers:(id)a4 filteredToSuggestionUserTypes:(id)a5 filteredToSessionTypes:(id)a6
{
  BOOL v8 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [[SMSuggestionEnumerationOptions alloc] initWithBatchSize:0 fetchLimit:1 offset:0 includeSuppressed:v8 sortByCreationDate:1 ascending:0 dateInterval:0 filteredToSuggestionTriggers:v11 filteredToSuggestionUserTypes:v10 filteredToSessionTypes:v9];

  return v12;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)includeSuppressed
{
  return self->_includeSuppressed;
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

- (NSArray)filteredToSuggestionTriggers
{
  return self->_filteredToSuggestionTriggers;
}

- (NSArray)filteredToSuggestionUserTypes
{
  return self->_filteredToSuggestionUserTypes;
}

- (NSArray)filteredToSessionTypes
{
  return self->_filteredToSessionTypes;
}

- (NSArray)filteredToSuggestionSessionTypes
{
  return self->_filteredToSuggestionSessionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredToSuggestionSessionTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSessionTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSuggestionUserTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSuggestionTriggers, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end