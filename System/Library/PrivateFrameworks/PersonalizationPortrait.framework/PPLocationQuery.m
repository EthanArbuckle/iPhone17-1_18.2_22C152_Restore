@interface PPLocationQuery
+ (BOOL)supportsSecureCoding;
+ (id)_algorithmsDescription:(id)a3;
+ (id)_matchingCategoriesDescription:(id)a3;
+ (id)queryForMapsWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5;
- (BOOL)excludingWithoutSentiment;
- (BOOL)filterByRelevanceDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocationQuery:(id)a3;
- (BOOL)orderByAscendingDate;
- (NSDate)fromDate;
- (NSDate)scoringDate;
- (NSDate)toDate;
- (NSSet)excludingAlgorithms;
- (NSSet)excludingSourceBundleIds;
- (NSSet)matchingAlgorithms;
- (NSSet)matchingCategories;
- (NSSet)matchingSourceBundleIds;
- (NSString)fuzzyMatchingString;
- (NSString)matchingContactHandle;
- (PPLocationQuery)init;
- (PPLocationQuery)initWithCoder:(id)a3;
- (double)decayRate;
- (double)perRecordDecayRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customizedDescription;
- (id)description;
- (unint64_t)consumer;
- (unint64_t)deviceFilter;
- (unint64_t)hash;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setConsumer:(unint64_t)a3;
- (void)setDecayRate:(double)a3;
- (void)setDeviceFilter:(unint64_t)a3;
- (void)setExcludingAlgorithms:(id)a3;
- (void)setExcludingSourceBundleIds:(id)a3;
- (void)setExcludingWithoutSentiment:(BOOL)a3;
- (void)setFilterByRelevanceDate:(BOOL)a3;
- (void)setFromDate:(id)a3;
- (void)setFuzzyMatchingString:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMatchingAlgorithms:(id)a3;
- (void)setMatchingCategories:(id)a3;
- (void)setMatchingContactHandle:(id)a3;
- (void)setMatchingSourceBundleIds:(id)a3;
- (void)setOrderByAscendingDate:(BOOL)a3;
- (void)setPerRecordDecayRate:(double)a3;
- (void)setScoringDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation PPLocationQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingCategories, 0);
  objc_storeStrong((id *)&self->_fuzzyMatchingString, 0);
  objc_storeStrong((id *)&self->_excludingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_scoringDate, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

- (void)setFilterByRelevanceDate:(BOOL)a3
{
  self->_filterByRelevanceDate = a3;
}

- (BOOL)filterByRelevanceDate
{
  return self->_filterByRelevanceDate;
}

- (void)setOrderByAscendingDate:(BOOL)a3
{
  self->_orderByAscendingDate = a3;
}

- (BOOL)orderByAscendingDate
{
  return self->_orderByAscendingDate;
}

- (void)setConsumer:(unint64_t)a3
{
  self->_consumer = a3;
}

- (unint64_t)consumer
{
  return self->_consumer;
}

- (void)setMatchingContactHandle:(id)a3
{
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setExcludingWithoutSentiment:(BOOL)a3
{
  self->_excludingWithoutSentiment = a3;
}

- (BOOL)excludingWithoutSentiment
{
  return self->_excludingWithoutSentiment;
}

- (void)setExcludingAlgorithms:(id)a3
{
}

- (NSSet)excludingAlgorithms
{
  return self->_excludingAlgorithms;
}

- (void)setMatchingAlgorithms:(id)a3
{
}

- (NSSet)matchingAlgorithms
{
  return self->_matchingAlgorithms;
}

- (void)setMatchingCategories:(id)a3
{
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (void)setFuzzyMatchingString:(id)a3
{
}

- (NSString)fuzzyMatchingString
{
  return self->_fuzzyMatchingString;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setPerRecordDecayRate:(double)a3
{
  self->_perRecordDecayRate = a3;
}

- (double)perRecordDecayRate
{
  return self->_perRecordDecayRate;
}

- (void)setDeviceFilter:(unint64_t)a3
{
  self->_deviceFilter = a3;
}

- (unint64_t)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setExcludingSourceBundleIds:(id)a3
{
}

- (NSSet)excludingSourceBundleIds
{
  return self->_excludingSourceBundleIds;
}

- (void)setMatchingSourceBundleIds:(id)a3
{
}

- (NSSet)matchingSourceBundleIds
{
  return self->_matchingSourceBundleIds;
}

- (void)setScoringDate:(id)a3
{
}

- (NSDate)scoringDate
{
  return self->_scoringDate;
}

- (void)setToDate:(id)a3
{
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setFromDate:(id)a3
{
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (id)customizedDescription
{
  v3 = objc_opt_new();
  if (self->_limit != -1)
  {
    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"limit:%tu", self->_limit);
    [v3 addObject:v4];
  }
  if (self->_fromDate)
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"fromDate:'%@'", self->_fromDate];
    [v3 addObject:v5];
  }
  if (self->_toDate)
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"toDate:'%@'", self->_toDate];
    [v3 addObject:v6];
  }
  if (self->_scoringDate)
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"scoringDate:'%@'", self->_scoringDate];
    [v3 addObject:v7];
  }
  matchingSourceBundleIds = self->_matchingSourceBundleIds;
  if (matchingSourceBundleIds)
  {
    unint64_t v9 = [(NSSet *)matchingSourceBundleIds count];
    id v10 = [NSString alloc];
    if (v9 < 0xB) {
      uint64_t v11 = [v10 initWithFormat:@"matchingSourceBundleIds:%@", self->_matchingSourceBundleIds];
    }
    else {
      uint64_t v11 = objc_msgSend(v10, "initWithFormat:", @"matchingSourceBundleIds.count:%tu", -[NSSet count](self->_matchingSourceBundleIds, "count"));
    }
    v12 = (void *)v11;
    [v3 addObject:v11];
  }
  excludingSourceBundleIds = self->_excludingSourceBundleIds;
  if (excludingSourceBundleIds)
  {
    unint64_t v14 = [(NSSet *)excludingSourceBundleIds count];
    id v15 = [NSString alloc];
    if (v14 < 0xB) {
      uint64_t v16 = [v15 initWithFormat:@"excludingSourceBundleIds:%@", self->_excludingSourceBundleIds];
    }
    else {
      uint64_t v16 = objc_msgSend(v15, "initWithFormat:", @"excludingSourceBundleIds.count:%tu", -[NSSet count](self->_excludingSourceBundleIds, "count"));
    }
    v17 = (void *)v16;
    [v3 addObject:v16];
  }
  if (self->_deviceFilter)
  {
    id v18 = [NSString alloc];
    v19 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
    v20 = (void *)[v18 initWithFormat:@"deviceFilter:%@", v19];
    [v3 addObject:v20];
  }
  if (self->_perRecordDecayRate != -1.0)
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"perRecordDecayRate:%f", *(void *)&self->_perRecordDecayRate);
    [v3 addObject:v21];
  }
  if (self->_decayRate != -1.0)
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"decayRate:%f", *(void *)&self->_decayRate);
    [v3 addObject:v22];
  }
  if (self->_fuzzyMatchingString)
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"fuzzyMatchingString.length:%tu", -[NSString length](self->_fuzzyMatchingString, "length"));
    [v3 addObject:v23];
  }
  if (self->_matchingContactHandle)
  {
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingContactHandle.length:%tu", -[NSString length](self->_matchingContactHandle, "length"));
    [v3 addObject:v24];
  }
  matchingCategories = self->_matchingCategories;
  if (matchingCategories)
  {
    unint64_t v26 = [(NSSet *)matchingCategories count];
    id v27 = [NSString alloc];
    if (v26 < 0xB)
    {
      v28 = [(id)objc_opt_class() _matchingCategoriesDescription:self->_matchingCategories];
      v29 = (void *)[v27 initWithFormat:@"matchingCategories:%@", v28];
      [v3 addObject:v29];
    }
    else
    {
      v28 = objc_msgSend(v27, "initWithFormat:", @"matchingCategories.count:%tu", -[NSSet count](self->_matchingCategories, "count"));
      [v3 addObject:v28];
    }
  }
  matchingAlgorithms = self->_matchingAlgorithms;
  if (matchingAlgorithms)
  {
    unint64_t v31 = [(NSSet *)matchingAlgorithms count];
    id v32 = [NSString alloc];
    if (v31 < 0xB)
    {
      v33 = [(id)objc_opt_class() _algorithmsDescription:self->_matchingAlgorithms];
      v34 = (void *)[v32 initWithFormat:@"matchingAlgorithms:%@", v33];
      [v3 addObject:v34];
    }
    else
    {
      v33 = objc_msgSend(v32, "initWithFormat:", @"matchingAlgorithms.count:%tu", -[NSSet count](self->_matchingAlgorithms, "count"));
      [v3 addObject:v33];
    }
  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    unint64_t v36 = [(NSSet *)excludingAlgorithms count];
    id v37 = [NSString alloc];
    if (v36 < 0xB)
    {
      v38 = [(id)objc_opt_class() _algorithmsDescription:self->_excludingAlgorithms];
      v39 = (void *)[v37 initWithFormat:@"excludingAlgorithms:%@", v38];
      [v3 addObject:v39];
    }
    else
    {
      v38 = objc_msgSend(v37, "initWithFormat:", @"excludingAlgorithms.count:%tu", -[NSSet count](self->_excludingAlgorithms, "count"));
      [v3 addObject:v38];
    }
  }
  if (self->_excludingWithoutSentiment) {
    [v3 addObject:@"excludingWithoutSentiment:YES"];
  }
  if (self->_consumer)
  {
    v40 = +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:");
    [v3 addObject:v40];
  }
  if (self->_filterByRelevanceDate) {
    [v3 addObject:@"filterByRelevanceDate:YES"];
  }
  v41 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @" ");

  return v41;
}

- (id)description
{
  id v18 = [(id)objc_opt_class() _matchingCategoriesDescription:self->_matchingCategories];
  v17 = [(id)objc_opt_class() _algorithmsDescription:self->_matchingAlgorithms];
  v3 = [(id)objc_opt_class() _algorithmsDescription:self->_excludingAlgorithms];
  id v16 = [NSString alloc];
  long long v15 = *(_OWORD *)&self->_limit;
  long long v14 = *(_OWORD *)&self->_toDate;
  matchingSourceBundleIds = self->_matchingSourceBundleIds;
  excludingSourceBundleIds = self->_excludingSourceBundleIds;
  v6 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
  NSUInteger v7 = [(NSString *)self->_fuzzyMatchingString length];
  if (self->_excludingWithoutSentiment) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  uint64_t v9 = +[PPLocationStore describeLocationConsumer:self->_consumer];
  id v10 = (void *)v9;
  if (self->_filterByRelevanceDate) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v12 = (void *)[v16 initWithFormat:@"<PPLocationQuery l:%tu d:%@-%@ sd:%@ mid:%@ eid:%@ df:%@ fms:%tu c:%@ ma:%@ ea:%@ ens:%@> cons:%@ mch:%@ fbrd:%@", v15, v14, matchingSourceBundleIds, excludingSourceBundleIds, v6, v7, v18, v17, v3, v8, v9, self->_matchingContactHandle, v11];

  return v12;
}

- (unint64_t)hash
{
  unint64_t limit = self->_limit;
  uint64_t v4 = [(NSDate *)self->_fromDate hash] - limit + 32 * limit;
  uint64_t v5 = [(NSDate *)self->_toDate hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDate *)self->_scoringDate hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSSet *)self->_matchingSourceBundleIds hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSSet *)self->_excludingSourceBundleIds hash];
  unint64_t v9 = self->_deviceFilter - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  id v10 = [NSNumber numberWithDouble:self->_perRecordDecayRate];
  uint64_t v11 = [v10 hash] - v9 + 32 * v9;

  v12 = [NSNumber numberWithDouble:self->_decayRate];
  uint64_t v13 = [v12 hash] - v11 + 32 * v11;

  NSUInteger v14 = [(NSString *)self->_fuzzyMatchingString hash] - v13 + 32 * v13;
  uint64_t v15 = [(NSSet *)self->_matchingCategories hash] - v14 + 32 * v14;
  uint64_t v16 = [(NSSet *)self->_matchingAlgorithms hash] - v15 + 32 * v15;
  uint64_t v17 = [(NSSet *)self->_excludingAlgorithms hash];
  uint64_t v18 = self->_excludingWithoutSentiment - (v17 - v16 + 32 * v16) + 32 * (v17 - v16 + 32 * v16);
  unint64_t v19 = self->_consumer - v18 + 32 * v18;
  return self->_filterByRelevanceDate - v19 + 32 * v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PPLocationQuery *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPLocationQuery *)self isEqualToLocationQuery:v5];

  return v6;
}

- (BOOL)isEqualToLocationQuery:(id)a3
{
  uint64_t v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4 || self->_limit != v4[2]) {
    goto LABEL_55;
  }
  BOOL v6 = self->_fromDate;
  unint64_t v7 = (unint64_t)v5[3];
  if ((unint64_t)v6 | v7)
  {
    unint64_t v9 = (void *)v7;
    if (!v6 || !v7) {
      goto LABEL_54;
    }
    int v25 = [(NSSet *)v6 isEqualToDate:v7];

    if (!v25) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_toDate;
  unint64_t v8 = (unint64_t)v5[4];
  if ((unint64_t)v6 | v8)
  {
    unint64_t v9 = (void *)v8;
    if (!v6 || !v8) {
      goto LABEL_54;
    }
    int v10 = [(NSSet *)v6 isEqualToDate:v8];

    if (!v10) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_scoringDate;
  unint64_t v11 = (unint64_t)v5[5];
  if ((unint64_t)v6 | v11)
  {
    unint64_t v9 = (void *)v11;
    if (!v6 || !v11) {
      goto LABEL_54;
    }
    int v12 = [(NSSet *)v6 isEqualToDate:v11];

    if (!v12) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_matchingSourceBundleIds;
  unint64_t v13 = (unint64_t)v5[6];
  if ((unint64_t)v6 | v13)
  {
    unint64_t v9 = (void *)v13;
    if (!v6 || !v13) {
      goto LABEL_54;
    }
    BOOL v14 = [(NSSet *)v6 isEqualToSet:v13];

    if (!v14) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_excludingSourceBundleIds;
  unint64_t v15 = (unint64_t)v5[7];
  if ((unint64_t)v6 | v15)
  {
    unint64_t v9 = (void *)v15;
    if (!v6 || !v15) {
      goto LABEL_54;
    }
    BOOL v16 = [(NSSet *)v6 isEqualToSet:v15];

    if (!v16) {
      goto LABEL_55;
    }
  }
  if (self->_deviceFilter != v5[8]
    || self->_perRecordDecayRate != *((double *)v5 + 9)
    || self->_decayRate != *((double *)v5 + 10))
  {
    goto LABEL_55;
  }
  BOOL v6 = self->_fuzzyMatchingString;
  unint64_t v17 = (unint64_t)v5[11];
  if ((unint64_t)v6 | v17)
  {
    unint64_t v9 = (void *)v17;
    if (!v6 || !v17) {
      goto LABEL_54;
    }
    int v26 = [(NSSet *)v6 isEqualToString:v17];

    if (!v26) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_matchingContactHandle;
  uint64_t v18 = [v5 matchingContactHandle];
  if ((unint64_t)v6 | v18)
  {
    unint64_t v9 = (void *)v18;
    if (!v6 || !v18) {
      goto LABEL_54;
    }
    int v19 = [(NSSet *)v6 isEqualToString:v18];

    if (!v19) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_matchingCategories;
  unint64_t v20 = (unint64_t)v5[12];
  if ((unint64_t)v6 | v20)
  {
    unint64_t v9 = (void *)v20;
    if (!v6 || !v20) {
      goto LABEL_54;
    }
    BOOL v27 = [(NSSet *)v6 isEqualToSet:v20];

    if (!v27) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_matchingAlgorithms;
  unint64_t v21 = (unint64_t)v5[13];
  if ((unint64_t)v6 | v21)
  {
    unint64_t v9 = (void *)v21;
    if (!v6 || !v21) {
      goto LABEL_54;
    }
    BOOL v28 = [(NSSet *)v6 isEqualToSet:v21];

    if (!v28) {
      goto LABEL_55;
    }
  }
  BOOL v6 = self->_excludingAlgorithms;
  unint64_t v22 = (unint64_t)v5[14];
  if ((unint64_t)v6 | v22)
  {
    unint64_t v9 = (void *)v22;
    if (v6 && v22)
    {
      BOOL v29 = [(NSSet *)v6 isEqualToSet:v22];

      if (v29) {
        goto LABEL_31;
      }
LABEL_55:
      BOOL v24 = 0;
      goto LABEL_56;
    }
LABEL_54:

    goto LABEL_55;
  }
LABEL_31:
  if (self->_excludingWithoutSentiment != *((unsigned __int8 *)v5 + 8) || self->_consumer != v5[16]) {
    goto LABEL_55;
  }
  int filterByRelevanceDate = self->_filterByRelevanceDate;
  BOOL v24 = filterByRelevanceDate == [v5 filterByRelevanceDate];
LABEL_56:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PPLocationQuery allocWithZone:](PPLocationQuery, "allocWithZone:") init];
  v5->_unint64_t limit = self->_limit;
  uint64_t v6 = [(NSDate *)self->_fromDate copyWithZone:a3];
  fromDate = v5->_fromDate;
  v5->_fromDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_toDate copyWithZone:a3];
  toDate = v5->_toDate;
  v5->_toDate = (NSDate *)v8;

  uint64_t v10 = [(NSDate *)self->_scoringDate copyWithZone:a3];
  scoringDate = v5->_scoringDate;
  v5->_scoringDate = (NSDate *)v10;

  uint64_t v12 = [(NSSet *)self->_matchingSourceBundleIds copyWithZone:a3];
  matchingSourceBundleIds = v5->_matchingSourceBundleIds;
  v5->_matchingSourceBundleIds = (NSSet *)v12;

  uint64_t v14 = [(NSSet *)self->_excludingSourceBundleIds copyWithZone:a3];
  excludingSourceBundleIds = v5->_excludingSourceBundleIds;
  v5->_excludingSourceBundleIds = (NSSet *)v14;

  v5->_deviceFilter = self->_deviceFilter;
  v5->_perRecordDecayRate = self->_perRecordDecayRate;
  v5->_decayRate = self->_decayRate;
  uint64_t v16 = [(NSString *)self->_fuzzyMatchingString copyWithZone:a3];
  fuzzyMatchingString = v5->_fuzzyMatchingString;
  v5->_fuzzyMatchingString = (NSString *)v16;

  uint64_t v18 = [(NSSet *)self->_matchingCategories copyWithZone:a3];
  matchingCategories = v5->_matchingCategories;
  v5->_matchingCategories = (NSSet *)v18;

  uint64_t v20 = [(NSSet *)self->_matchingAlgorithms copyWithZone:a3];
  matchingAlgorithms = v5->_matchingAlgorithms;
  v5->_matchingAlgorithms = (NSSet *)v20;

  uint64_t v22 = [(NSSet *)self->_excludingAlgorithms copyWithZone:a3];
  excludingAlgorithms = v5->_excludingAlgorithms;
  v5->_excludingAlgorithms = (NSSet *)v22;

  v5->_excludingWithoutSentiment = self->_excludingWithoutSentiment;
  v5->_consumer = self->_consumer;
  uint64_t v24 = [(NSString *)self->_matchingContactHandle copyWithZone:a3];
  matchingContactHandle = v5->_matchingContactHandle;
  v5->_matchingContactHandle = (NSString *)v24;

  v5->_int filterByRelevanceDate = self->_filterByRelevanceDate;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit = self->_limit;
  id v5 = a3;
  [v5 encodeInteger:limit forKey:@"lim"];
  [v5 encodeObject:self->_fromDate forKey:@"fd"];
  [v5 encodeObject:self->_toDate forKey:@"td"];
  [v5 encodeObject:self->_scoringDate forKey:@"sd"];
  [v5 encodeObject:self->_matchingSourceBundleIds forKey:@"mbi"];
  [v5 encodeObject:self->_excludingSourceBundleIds forKey:@"ebi"];
  [v5 encodeInt32:LODWORD(self->_deviceFilter) forKey:@"devf"];
  [v5 encodeDouble:@"prd" forKey:self->_perRecordDecayRate];
  [v5 encodeDouble:@"dr" forKey:self->_decayRate];
  [v5 encodeObject:self->_fuzzyMatchingString forKey:@"ms"];
  [v5 encodeObject:self->_matchingCategories forKey:@"mc"];
  [v5 encodeObject:self->_matchingAlgorithms forKey:@"ma"];
  [v5 encodeObject:self->_excludingAlgorithms forKey:@"ea"];
  [v5 encodeBool:self->_excludingWithoutSentiment forKey:@"ews"];
  [v5 encodeInteger:self->_consumer forKey:@"cons"];
  [v5 encodeObject:self->_matchingContactHandle forKey:@"mch"];
  [v5 encodeBool:self->_filterByRelevanceDate forKey:@"fbrd"];
}

- (PPLocationQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PPLocationQuery *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = (void *)MEMORY[0x192F97350]();
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    unint64_t v11 = (void *)MEMORY[0x192F97350]();
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    v5->_unint64_t limit = [v4 decodeIntegerForKey:@"lim"];
    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"fd"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v6 forKey:@"td"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v6 forKey:@"sd"];
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v10 forKey:@"mbi"];
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v10 forKey:@"ebi"];
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v23;

    v5->_deviceFilter = (int)[v4 decodeInt32ForKey:@"devf"];
    [v4 decodeDoubleForKey:@"prd"];
    v5->_perRecordDecayRate = v25;
    [v4 decodeDoubleForKey:@"dr"];
    v5->_decayRate = v26;
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ms"];
    fuzzyMatchingString = v5->_fuzzyMatchingString;
    v5->_fuzzyMatchingString = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClasses:v14 forKey:@"mc"];
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v29;

    uint64_t v31 = [v4 decodeObjectOfClasses:v14 forKey:@"ma"];
    matchingAlgorithms = v5->_matchingAlgorithms;
    v5->_matchingAlgorithms = (NSSet *)v31;

    uint64_t v33 = [v4 decodeObjectOfClasses:v14 forKey:@"ea"];
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v33;

    v5->_excludingWithoutSentiment = [v4 decodeBoolForKey:@"ews"];
    v5->_consumer = [v4 decodeIntegerForKey:@"cons"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mch"];
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v35;

    v5->_int filterByRelevanceDate = [v4 decodeBoolForKey:@"fbrd"];
    id v37 = v5;
  }
  return v5;
}

- (PPLocationQuery)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPLocationQuery;
  result = [(PPLocationQuery *)&v8 init];
  if (result)
  {
    result->_unint64_t limit = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_perRecordDecayRate = _Q0;
    result->_consumer = 0;
  }
  return result;
}

+ (id)queryForMapsWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_super v8 = objc_opt_new();
  uint64_t v9 = v8;
  if (a5 == 3)
  {
    [v8 setExcludingAlgorithms:0];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x192F97350]();
    unint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDA6B290, 0);
    [v9 setExcludingAlgorithms:v11];
  }
  [v9 setFromDate:v7];
  [v9 setPerRecordDecayRate:0.000385];
  id v12 = (void *)MEMORY[0x192F97350]([v9 setConsumer:a5]);
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.Maps", @"com.apple.CoreRoutine", @"com.apple.mobilecal", @"com.apple.iCal", @"com.apple.Passbook", 0);
  if (a5 == 3)
  {
    [v9 setExcludingSourceBundleIds:v13];
  }
  else
  {
    v17[0] = @"com.apple.mobileslideshow";
    v17[1] = @"com.apple.Photos";
    v17[2] = @"com.apple.camera";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    uint64_t v15 = [v13 setByAddingObjectsFromArray:v14];
    [v9 setExcludingSourceBundleIds:v15];
  }
  [v9 setLimit:a3];

  return v9;
}

+ (id)_algorithmsDescription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = +[PPLocationRecord describeAlgorithm:](PPLocationRecord, "describeAlgorithm:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13));
        [v4 appendString:v11];

        if ([v5 count] > (unint64_t)(v8 + 1 + i)) {
          [v4 appendString:@", "];
        }
      }
      v8 += v7;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"]"];
  return v4;
}

+ (id)_matchingCategoriesDescription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = +[PPLocation describeCategory:](PPLocation, "describeCategory:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13));
        [v4 appendString:v11];

        if ([v5 count] > (unint64_t)(v8 + 1 + i)) {
          [v4 appendString:@", "];
        }
      }
      v8 += v7;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"]"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end