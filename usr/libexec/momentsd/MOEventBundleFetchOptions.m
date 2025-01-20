@interface MOEventBundleFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)filterBundle;
- (BOOL)includeDeletedBundles;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (BOOL)personalizedSensingFilter;
- (BOOL)personalizedSensingVisitsAllowed;
- (BOOL)skipLocalization;
- (BOOL)skipRanking;
- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 filterBundle:(BOOL)a7;
- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8;
- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8 interfaceType:(unint64_t)a9;
- (MOEventBundleFetchOptions)initWithCoder:(id)a3;
- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 filterBundle:(BOOL)a6;
- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7;
- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7 interfaceType:(unint64_t)a8;
- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5;
- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5 skipRanking:(BOOL)a6;
- (NSArray)categories;
- (NSArray)identifiers;
- (NSDateInterval)dateInterval;
- (NSNumber)limit;
- (id)description;
- (unint64_t)hash;
- (unint64_t)interfaceType;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setPersonalizedSensingFilter:(BOOL)a3;
- (void)setPersonalizedSensingVisitsAllowed:(BOOL)a3;
- (void)setSkipLocalization:(BOOL)a3;
@end

@implementation MOEventBundleFetchOptions

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 filterBundle:(BOOL)a7
{
  return [(MOEventBundleFetchOptions *)self initWithAllowedCategories:a3 dateInterval:a4 ascending:a5 limit:a6 includeDeletedBundles:0 skipRanking:0];
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7
{
  return [(MOEventBundleFetchOptions *)self initWithAllowedCategories:0 dateInterval:a3 ascending:a4 limit:a5 includeDeletedBundles:a6 skipRanking:a7];
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7 interfaceType:(unint64_t)a8
{
  return [(MOEventBundleFetchOptions *)self initWithAllowedCategories:0 dateInterval:a3 ascending:a4 limit:a5 includeDeletedBundles:a6 skipRanking:a7 interfaceType:a8];
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 filterBundle:(BOOL)a6
{
  return [(MOEventBundleFetchOptions *)self initWithDateInterval:a3 ascending:a4 limit:a5 includeDeletedBundles:0 skipRanking:0];
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8
{
  return [(MOEventBundleFetchOptions *)self initWithAllowedCategories:a3 dateInterval:a4 ascending:a5 limit:a6 includeDeletedBundles:a7 skipRanking:a8 interfaceType:16];
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8 interfaceType:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MOEventBundleFetchOptions;
  v19 = [(MOEventBundleFetchOptions *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->_ascending = a5;
    objc_storeStrong((id *)&v19->_dateInterval, a4);
    objc_storeStrong((id *)&v20->_limit, a6);
    v20->_filterBundle = 0;
    objc_storeStrong((id *)&v20->_categories, a3);
    v20->_includeDeletedBundles = a7;
    v20->_skipRanking = a8;
    v20->_interfaceType = a9;
  }

  return v20;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5
{
  BOOL v5 = a4;
  id v8 = a3;
  v9 = [(MOEventBundleFetchOptions *)self initWithDateInterval:0 ascending:v5 limit:0 includeDeletedBundles:0 skipRanking:0];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_identifiers, a3);
  }

  return v10;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5 skipRanking:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  id v10 = a3;
  v11 = [(MOEventBundleFetchOptions *)self initWithDateInterval:0 ascending:v7 limit:0 includeDeletedBundles:0 skipRanking:v6];
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_identifiers, a3);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL ascending = self->_ascending;
  id v7 = a3;
  BOOL v5 = +[NSNumber numberWithBool:ascending];
  [v7 encodeObject:v5 forKey:@"ascending"];

  [v7 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v7 encodeObject:self->_limit forKey:@"limit"];
  BOOL v6 = +[NSNumber numberWithBool:self->_skipRanking];
  [v7 encodeObject:v6 forKey:@"skipRanking"];

  [v7 encodeBool:self->_includeDeletedBundles forKey:@"includeDeletedBundles"];
  [v7 encodeObject:self->_identifiers forKey:@"identifiers"];
  [v7 encodeInt64:self->_interfaceType forKey:@"interfaceType"];
  [v7 encodeBool:self->_personalizedSensingFilter forKey:@"pssFilter"];
  [v7 encodeBool:self->_personalizedSensingVisitsAllowed forKey:@"pssVisits"];
  [v7 encodeBool:self->_skipLocalization forKey:@"skipLocalization"];
}

- (MOEventBundleFetchOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ascending"];
  unsigned int v20 = [v4 BOOLValue];

  BOOL v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  BOOL v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"skipRanking"];
  id v8 = [v7 BOOLValue];

  id v9 = [v3 decodeBoolForKey:@"includeDeletedBundles"];
  unsigned __int8 v10 = [v3 decodeBoolForKey:@"skipLocalization"];
  unsigned __int8 v11 = [v3 decodeBoolForKey:@"pssFilter"];
  unsigned __int8 v12 = [v3 decodeBoolForKey:@"pssVisits"];
  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"identifiers"];

  id v16 = [v3 decodeInt64ForKey:@"interfaceType"];
  id v17 = [(MOEventBundleFetchOptions *)self initWithDateInterval:v5 ascending:v20 limit:v6 includeDeletedBundles:v9 skipRanking:v8];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifiers, v15);
    v18->_interfaceType = (unint64_t)v16;
    v18->_personalizedSensingFilter = v11;
    v18->_personalizedSensingVisitsAllowed = v12;
    v18->_skipLocalization = v10;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MOEventBundleFetchOptions *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(MOEventBundleFetchOptions *)self isEqualToFetchOptions:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  int ascending = self->_ascending;
  unsigned int v7 = [v5 ascending];
  dateInterval = self->_dateInterval;
  if (dateInterval) {
    goto LABEL_2;
  }
  id v3 = [v5 dateInterval];
  if (!v3)
  {
    unsigned int v13 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    uint64_t v9 = [v5 dateInterval];
    if (v9)
    {
      unsigned __int8 v10 = (void *)v9;
      unsigned __int8 v11 = self->_dateInterval;
      unsigned __int8 v12 = [v5 dateInterval];
      unsigned int v13 = [(NSDateInterval *)v11 isEqualToDateInterval:v12];

      if (dateInterval) {
        goto LABEL_12;
      }
    }
    else
    {
      unsigned int v13 = 0;
      if (dateInterval) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
LABEL_11:

LABEL_12:
  if (self->_limit)
  {
    v14 = [v5 limit];
    if (v14)
    {
      unsigned int v15 = 1;
    }
    else if (self->_limit)
    {
      id v16 = [v5 limit];
      if (v16)
      {
        limit = self->_limit;
        id v18 = [v5 limit];
        unsigned int v15 = [(NSNumber *)limit isEqualToNumber:v18];
      }
      else
      {
        unsigned int v15 = 0;
      }
    }
    else
    {
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  int filterBundle = self->_filterBundle;
  unsigned int v20 = [v5 filterBundle];
  int skipRanking = self->_skipRanking;
  unsigned int v22 = [v5 skipRanking];
  BOOL v23 = 0;
  if (ascending == v7 && ((v13 ^ 1) & 1) == 0 && v15) {
    BOOL v23 = filterBundle == v20 && skipRanking == v22;
  }

  return v23;
}

- (unint64_t)hash
{
  id v3 = +[NSNumber numberWithBool:self->_ascending];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)[(NSDateInterval *)self->_dateInterval hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSNumber *)self->_limit hash] ^ v4;
  unsigned int v7 = +[NSNumber numberWithBool:self->_filterBundle];
  unint64_t v8 = (unint64_t)[v7 hash];
  uint64_t v9 = +[NSNumber numberWithBool:self->_skipRanking];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (id)description
{
  if (self->_ascending) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  unint64_t v4 = [(NSDateInterval *)self->_dateInterval startDate];
  unint64_t v5 = [v4 stringFromDate];
  unint64_t v6 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v7 = [v6 stringFromDate];
  unint64_t v8 = (void *)v7;
  if (self->_filterBundle) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (self->_skipRanking) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if (self->_personalizedSensingFilter) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if (self->_personalizedSensingVisitsAllowed) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  unsigned int v13 = +[NSString stringWithFormat:@"ascending, %@,  startDate, %@, endDate, %@, limit, %@, filterBundle, %@, skipRanking, %@, interfaceType, %lu, pssFilter, %@, pssVisits, %@", v3, v5, v7, self->_limit, v9, v10, self->_interfaceType, v11, v12];

  return v13;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (BOOL)filterBundle
{
  return self->_filterBundle;
}

- (BOOL)includeDeletedBundles
{
  return self->_includeDeletedBundles;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)skipRanking
{
  return self->_skipRanking;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (BOOL)personalizedSensingFilter
{
  return self->_personalizedSensingFilter;
}

- (void)setPersonalizedSensingFilter:(BOOL)a3
{
  self->_personalizedSensingFilter = a3;
}

- (BOOL)personalizedSensingVisitsAllowed
{
  return self->_personalizedSensingVisitsAllowed;
}

- (void)setPersonalizedSensingVisitsAllowed:(BOOL)a3
{
  self->_personalizedSensingVisitsAllowed = a3;
}

- (BOOL)skipLocalization
{
  return self->_skipLocalization;
}

- (void)setSkipLocalization:(BOOL)a3
{
  self->_skipLocalization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_limit, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end