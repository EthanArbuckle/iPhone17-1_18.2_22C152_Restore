@interface PPTopicQuery
+ (BOOL)supportsSecureCoding;
+ (id)_algorithmsDescription:(id)a3;
+ (id)queryForCSSearchableItem:(id)a3;
- (BOOL)excludeWithoutSentiment;
- (BOOL)filterByRelevanceDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTopicQuery:(id)a3;
- (BOOL)orderByIdentifier;
- (BOOL)overrideDecayRate;
- (BOOL)removeNearDuplicates;
- (BOOL)scoreWithBiases;
- (BOOL)scoreWithCalibration;
- (BOOL)scoreWithStrictFiltering;
- (NSDate)fromDate;
- (NSDate)scoringDate;
- (NSDate)toDate;
- (NSSet)excludingAlgorithms;
- (NSSet)excludingSourceBundleIds;
- (NSSet)matchingAlgorithms;
- (NSSet)matchingDocumentIds;
- (NSSet)matchingGroupIds;
- (NSSet)matchingMappedTopicIds;
- (NSSet)matchingSourceBundleIds;
- (NSSet)matchingTopicIds;
- (NSString)matchingContactHandle;
- (NSString)matchingTopicTrie;
- (PPTopicQuery)init;
- (PPTopicQuery)initWithCoder:(id)a3;
- (double)decayRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customizedDescription;
- (id)description;
- (unint64_t)deviceFilter;
- (unint64_t)limit;
- (unint64_t)minimumComponentCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDecayRate:(double)a3;
- (void)setDeviceFilter:(unint64_t)a3;
- (void)setExcludeWithoutSentiment:(BOOL)a3;
- (void)setExcludingAlgorithms:(id)a3;
- (void)setExcludingSourceBundleIds:(id)a3;
- (void)setFilterByRelevanceDate:(BOOL)a3;
- (void)setFromDate:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMatchingAlgorithms:(id)a3;
- (void)setMatchingContactHandle:(id)a3;
- (void)setMatchingDocumentIds:(id)a3;
- (void)setMatchingGroupIds:(id)a3;
- (void)setMatchingMappedTopicIds:(id)a3;
- (void)setMatchingSourceBundleIds:(id)a3;
- (void)setMatchingTopicIds:(id)a3;
- (void)setMatchingTopicTrie:(id)a3;
- (void)setMinimumComponentCount:(unint64_t)a3;
- (void)setOrderByIdentifier:(BOOL)a3;
- (void)setRemoveNearDuplicates:(BOOL)a3;
- (void)setScoreWithBiases:(BOOL)a3;
- (void)setScoreWithCalibration:(BOOL)a3;
- (void)setScoreWithStrictFiltering:(BOOL)a3;
- (void)setScoringDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation PPTopicQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingTopicTrie, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_matchingMappedTopicIds, 0);
  objc_storeStrong((id *)&self->_matchingTopicIds, 0);
  objc_storeStrong((id *)&self->_matchingDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingGroupIds, 0);
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

- (void)setRemoveNearDuplicates:(BOOL)a3
{
  self->_removeNearDuplicates = a3;
}

- (BOOL)removeNearDuplicates
{
  return self->_removeNearDuplicates;
}

- (void)setOrderByIdentifier:(BOOL)a3
{
  self->_orderByIdentifier = a3;
}

- (BOOL)orderByIdentifier
{
  return self->_orderByIdentifier;
}

- (void)setMatchingTopicTrie:(id)a3
{
}

- (NSString)matchingTopicTrie
{
  return self->_matchingTopicTrie;
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

- (void)setMinimumComponentCount:(unint64_t)a3
{
  self->_minimumComponentCount = a3;
}

- (unint64_t)minimumComponentCount
{
  return self->_minimumComponentCount;
}

- (void)setScoreWithCalibration:(BOOL)a3
{
  self->_scoreWithCalibration = a3;
}

- (BOOL)scoreWithCalibration
{
  return self->_scoreWithCalibration;
}

- (void)setMatchingContactHandle:(id)a3
{
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setExcludeWithoutSentiment:(BOOL)a3
{
  self->_excludeWithoutSentiment = a3;
}

- (BOOL)excludeWithoutSentiment
{
  return self->_excludeWithoutSentiment;
}

- (void)setScoreWithStrictFiltering:(BOOL)a3
{
  self->_scoreWithStrictFiltering = a3;
}

- (BOOL)scoreWithStrictFiltering
{
  return self->_scoreWithStrictFiltering;
}

- (void)setMatchingMappedTopicIds:(id)a3
{
}

- (NSSet)matchingMappedTopicIds
{
  return self->_matchingMappedTopicIds;
}

- (void)setMatchingTopicIds:(id)a3
{
}

- (NSSet)matchingTopicIds
{
  return self->_matchingTopicIds;
}

- (void)setScoreWithBiases:(BOOL)a3
{
  self->_scoreWithBiases = a3;
}

- (BOOL)scoreWithBiases
{
  return self->_scoreWithBiases;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setDeviceFilter:(unint64_t)a3
{
  self->_deviceFilter = a3;
}

- (unint64_t)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setMatchingDocumentIds:(id)a3
{
}

- (NSSet)matchingDocumentIds
{
  return self->_matchingDocumentIds;
}

- (void)setMatchingGroupIds:(id)a3
{
}

- (NSSet)matchingGroupIds
{
  return self->_matchingGroupIds;
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
  matchingGroupIds = self->_matchingGroupIds;
  if (matchingGroupIds)
  {
    unint64_t v19 = [(NSSet *)matchingGroupIds count];
    id v20 = [NSString alloc];
    if (v19 < 0xB) {
      uint64_t v21 = [v20 initWithFormat:@"matchingGroupIds:%@", self->_matchingGroupIds];
    }
    else {
      uint64_t v21 = objc_msgSend(v20, "initWithFormat:", @"matchingGroupIds.count:%tu", -[NSSet count](self->_matchingGroupIds, "count"));
    }
    v22 = (void *)v21;
    [v3 addObject:v21];
  }
  matchingDocumentIds = self->_matchingDocumentIds;
  if (matchingDocumentIds)
  {
    unint64_t v24 = [(NSSet *)matchingDocumentIds count];
    id v25 = [NSString alloc];
    if (v24 < 0xB) {
      uint64_t v26 = [v25 initWithFormat:@"matchingDocumentIds:%@", self->_matchingDocumentIds];
    }
    else {
      uint64_t v26 = objc_msgSend(v25, "initWithFormat:", @"matchingDocumentIds.count:%tu", -[NSSet count](self->_matchingDocumentIds, "count"));
    }
    v27 = (void *)v26;
    [v3 addObject:v26];
  }
  if (self->_deviceFilter)
  {
    id v28 = [NSString alloc];
    v29 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
    v30 = (void *)[v28 initWithFormat:@"deviceFilter:%@", v29];
    [v3 addObject:v30];
  }
  if (self->_decayRate != -1.0)
  {
    v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"decayRate:%f", *(void *)&self->_decayRate);
    [v3 addObject:v31];
  }
  if (!self->_scoreWithBiases) {
    [v3 addObject:@"scoreWithBiases:NO"];
  }
  if (self->_matchingTopicIds)
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingTopicIds.count:%tu", -[NSSet count](self->_matchingTopicIds, "count"));
    [v3 addObject:v32];
  }
  if (self->_matchingMappedTopicIds)
  {
    v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingMappedTopicIds.count:%tu", -[NSSet count](self->_matchingMappedTopicIds, "count"));
    [v3 addObject:v33];
  }
  if (self->_matchingContactHandle)
  {
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingContactHandle.length:%tu", -[NSString length](self->_matchingContactHandle, "length"));
    [v3 addObject:v34];
  }
  if (self->_matchingTopicTrie)
  {
    v35 = (void *)[[NSString alloc] initWithFormat:@"matchingTopicTrie:%@", self->_matchingTopicTrie];
    [v3 addObject:v35];
  }
  if (self->_minimumComponentCount)
  {
    v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"minimumComponentCount:%tu", self->_minimumComponentCount);
    [v3 addObject:v36];
  }
  matchingAlgorithms = self->_matchingAlgorithms;
  if (matchingAlgorithms)
  {
    unint64_t v38 = [(NSSet *)matchingAlgorithms count];
    id v39 = [NSString alloc];
    if (v38 < 0xB)
    {
      v40 = [(id)objc_opt_class() _algorithmsDescription:self->_matchingAlgorithms];
      v41 = (void *)[v39 initWithFormat:@"matchingAlgorithms:%@", v40];
      [v3 addObject:v41];
    }
    else
    {
      v40 = objc_msgSend(v39, "initWithFormat:", @"matchingAlgorithms.count:%tu", -[NSSet count](self->_matchingAlgorithms, "count"));
      [v3 addObject:v40];
    }
  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    unint64_t v43 = [(NSSet *)excludingAlgorithms count];
    id v44 = [NSString alloc];
    if (v43 < 0xB)
    {
      v45 = [(id)objc_opt_class() _algorithmsDescription:self->_excludingAlgorithms];
      v46 = (void *)[v44 initWithFormat:@"excludingAlgorithms:%@", v45];
      [v3 addObject:v46];
    }
    else
    {
      v45 = objc_msgSend(v44, "initWithFormat:", @"excludingAlgorithms.count:%tu", -[NSSet count](self->_excludingAlgorithms, "count"));
      [v3 addObject:v45];
    }
  }
  if (self->_scoreWithStrictFiltering) {
    [v3 addObject:@"scoreWithStrictFiltering:YES"];
  }
  if (self->_excludeWithoutSentiment) {
    [v3 addObject:@"excludeWithoutSentiment:YES"];
  }
  if (self->_orderByIdentifier) {
    [v3 addObject:@"orderByIdentifier:YES"];
  }
  if (self->_filterByRelevanceDate) {
    [v3 addObject:@"filterByRelevanceDate:YES"];
  }
  v47 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @" ");

  return v47;
}

- (id)description
{
  v3 = [(id)objc_opt_class() _algorithmsDescription:self->_matchingAlgorithms];
  v4 = [(id)objc_opt_class() _algorithmsDescription:self->_excludingAlgorithms];
  id v21 = [NSString alloc];
  long long v19 = *(_OWORD *)&self->_toDate;
  long long v20 = *(_OWORD *)&self->_limit;
  long long v18 = *(_OWORD *)&self->_matchingSourceBundleIds;
  matchingGroupIds = self->_matchingGroupIds;
  matchingDocumentIds = self->_matchingDocumentIds;
  v7 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
  if (self->_scoreWithBiases) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  NSUInteger v9 = [(NSSet *)self->_matchingTopicIds count];
  NSUInteger v10 = [(NSSet *)self->_matchingMappedTopicIds count];
  if (self->_scoreWithCalibration) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_scoreWithStrictFiltering) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  if (self->_excludeWithoutSentiment) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (self->_orderByIdentifier) {
    unint64_t v14 = @"YES";
  }
  else {
    unint64_t v14 = @"NO";
  }
  if (self->_filterByRelevanceDate) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  uint64_t v16 = objc_msgSend(v21, "initWithFormat:", @"<PPTopicQuery l:%tu, d:%@-%@ sd:%@ mid:%@ eid:%@ gid:%@ mdid:%@ df:%@ sb:%@ mti:%tu mmti:%tu tri:%@ sc:%@ mcc:%tu ma:%@ ea:%@ ssf:%@ ews:%@ obi:%@ mch:%@ fbrd:%@>", v20, v19, v18, matchingGroupIds, matchingDocumentIds, v7, v8, v9, v10, self->_matchingTopicTrie, v11, self->_minimumComponentCount, v3, v4, v12, v13,
                  v14,
                  self->_matchingContactHandle,
                  v15);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPTopicQuery *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PPTopicQuery *)self isEqualToTopicQuery:v4];
  }

  return v5;
}

- (BOOL)isEqualToTopicQuery:(id)a3
{
  v4 = (PPTopicQuery *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v32 = 1;
    goto LABEL_57;
  }
  if (!v4) {
    goto LABEL_56;
  }
  unint64_t limit = self->_limit;
  if (limit != [(PPTopicQuery *)v4 limit]) {
    goto LABEL_56;
  }
  v7 = self->_fromDate;
  uint64_t v8 = [(PPTopicQuery *)v5 fromDate];
  if ((unint64_t)v7 | v8)
  {
    NSUInteger v9 = (void *)v8;
    if (!v7 || !v8) {
      goto LABEL_55;
    }
    int v10 = [(NSSet *)v7 isEqualToDate:v8];

    if (!v10) {
      goto LABEL_56;
    }
  }
  v7 = self->_toDate;
  uint64_t v11 = [(PPTopicQuery *)v5 toDate];
  if ((unint64_t)v7 | v11)
  {
    NSUInteger v9 = (void *)v11;
    if (!v7 || !v11) {
      goto LABEL_55;
    }
    int v12 = [(NSSet *)v7 isEqualToDate:v11];

    if (!v12) {
      goto LABEL_56;
    }
  }
  v7 = self->_scoringDate;
  uint64_t v13 = [(PPTopicQuery *)v5 scoringDate];
  if ((unint64_t)v7 | v13)
  {
    NSUInteger v9 = (void *)v13;
    if (!v7 || !v13) {
      goto LABEL_55;
    }
    int v14 = [(NSSet *)v7 isEqualToDate:v13];

    if (!v14) {
      goto LABEL_56;
    }
  }
  v7 = self->_matchingSourceBundleIds;
  uint64_t v15 = [(PPTopicQuery *)v5 matchingSourceBundleIds];
  if ((unint64_t)v7 | v15)
  {
    NSUInteger v9 = (void *)v15;
    if (!v7 || !v15) {
      goto LABEL_55;
    }
    BOOL v16 = [(NSSet *)v7 isEqualToSet:v15];

    if (!v16) {
      goto LABEL_56;
    }
  }
  v7 = self->_excludingSourceBundleIds;
  uint64_t v17 = [(PPTopicQuery *)v5 excludingSourceBundleIds];
  if ((unint64_t)v7 | v17)
  {
    NSUInteger v9 = (void *)v17;
    if (!v7 || !v17) {
      goto LABEL_55;
    }
    BOOL v18 = [(NSSet *)v7 isEqualToSet:v17];

    if (!v18) {
      goto LABEL_56;
    }
  }
  v7 = self->_matchingGroupIds;
  uint64_t v19 = [(PPTopicQuery *)v5 matchingGroupIds];
  if ((unint64_t)v7 | v19)
  {
    NSUInteger v9 = (void *)v19;
    if (!v7 || !v19) {
      goto LABEL_55;
    }
    BOOL v20 = [(NSSet *)v7 isEqualToSet:v19];

    if (!v20) {
      goto LABEL_56;
    }
  }
  v7 = self->_matchingDocumentIds;
  uint64_t v21 = [(PPTopicQuery *)v5 matchingDocumentIds];
  if ((unint64_t)v7 | v21)
  {
    NSUInteger v9 = (void *)v21;
    if (!v7 || !v21) {
      goto LABEL_55;
    }
    BOOL v33 = [(NSSet *)v7 isEqualToSet:v21];

    if (!v33) {
      goto LABEL_56;
    }
  }
  unint64_t deviceFilter = self->_deviceFilter;
  if (deviceFilter != [(PPTopicQuery *)v5 deviceFilter]) {
    goto LABEL_56;
  }
  double decayRate = self->_decayRate;
  [(PPTopicQuery *)v5 decayRate];
  if (decayRate != v24) {
    goto LABEL_56;
  }
  BOOL scoreWithBiases = self->_scoreWithBiases;
  if (scoreWithBiases != [(PPTopicQuery *)v5 scoreWithBiases]) {
    goto LABEL_56;
  }
  v7 = self->_matchingTopicIds;
  uint64_t v26 = [(PPTopicQuery *)v5 matchingTopicIds];
  if ((unint64_t)v7 | v26)
  {
    NSUInteger v9 = (void *)v26;
    if (!v7 || !v26) {
      goto LABEL_55;
    }
    BOOL v34 = [(NSSet *)v7 isEqualToSet:v26];

    if (!v34) {
      goto LABEL_56;
    }
  }
  v7 = self->_matchingMappedTopicIds;
  uint64_t v27 = [(PPTopicQuery *)v5 matchingMappedTopicIds];
  if ((unint64_t)v7 | v27)
  {
    NSUInteger v9 = (void *)v27;
    if (!v7 || !v27) {
      goto LABEL_55;
    }
    BOOL v35 = [(NSSet *)v7 isEqualToSet:v27];

    if (!v35) {
      goto LABEL_56;
    }
  }
  v7 = self->_matchingContactHandle;
  uint64_t v28 = [(PPTopicQuery *)v5 matchingContactHandle];
  if ((unint64_t)v7 | v28)
  {
    NSUInteger v9 = (void *)v28;
    if (v7 && v28)
    {
      int v36 = [(NSSet *)v7 isEqualToString:v28];

      if (v36) {
        goto LABEL_35;
      }
LABEL_56:
      BOOL v32 = 0;
      goto LABEL_57;
    }
LABEL_55:

    goto LABEL_56;
  }
LABEL_35:
  BOOL scoreWithStrictFiltering = self->_scoreWithStrictFiltering;
  if (scoreWithStrictFiltering != [(PPTopicQuery *)v5 scoreWithStrictFiltering]) {
    goto LABEL_56;
  }
  BOOL excludeWithoutSentiment = self->_excludeWithoutSentiment;
  if (excludeWithoutSentiment != [(PPTopicQuery *)v5 excludeWithoutSentiment]) {
    goto LABEL_56;
  }
  BOOL filterByRelevanceDate = self->_filterByRelevanceDate;
  BOOL v32 = filterByRelevanceDate == [(PPTopicQuery *)v5 filterByRelevanceDate];
LABEL_57:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = v4;
  if (v4)
  {
    [v4 setLimit:self->_limit];
    [v5 setFromDate:self->_fromDate];
    [v5 setToDate:self->_toDate];
    [v5 setScoringDate:self->_scoringDate];
    [v5 setMatchingSourceBundleIds:self->_matchingSourceBundleIds];
    [v5 setExcludingSourceBundleIds:self->_excludingSourceBundleIds];
    [v5 setMatchingGroupIds:self->_matchingGroupIds];
    [v5 setMatchingDocumentIds:self->_matchingDocumentIds];
    [v5 setDeviceFilter:self->_deviceFilter];
    [v5 setDecayRate:self->_decayRate];
    [v5 setScoreWithBiases:self->_scoreWithBiases];
    [v5 setMatchingTopicIds:self->_matchingTopicIds];
    [v5 setMatchingMappedTopicIds:self->_matchingMappedTopicIds];
    [v5 setMatchingTopicTrie:self->_matchingTopicTrie];
    [v5 setScoreWithCalibration:self->_scoreWithCalibration];
    [v5 setMinimumComponentCount:self->_minimumComponentCount];
    [v5 setMatchingAlgorithms:self->_matchingAlgorithms];
    [v5 setExcludingAlgorithms:self->_excludingAlgorithms];
    [v5 setScoreWithStrictFiltering:self->_scoreWithStrictFiltering];
    [v5 setExcludeWithoutSentiment:self->_excludeWithoutSentiment];
    [v5 setOrderByIdentifier:self->_orderByIdentifier];
    [v5 setMatchingContactHandle:self->_matchingContactHandle];
    [v5 setFilterByRelevanceDate:self->_filterByRelevanceDate];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit = self->_limit;
  id v5 = a3;
  [v5 encodeInteger:limit forKey:@"lmt"];
  [v5 encodeObject:self->_fromDate forKey:@"fdt"];
  [v5 encodeObject:self->_toDate forKey:@"tdt"];
  [v5 encodeObject:self->_scoringDate forKey:@"sdt"];
  [v5 encodeObject:self->_matchingSourceBundleIds forKey:@"mbdl"];
  [v5 encodeObject:self->_excludingSourceBundleIds forKey:@"ebdl"];
  [v5 encodeObject:self->_matchingGroupIds forKey:@"gid"];
  [v5 encodeObject:self->_matchingDocumentIds forKey:@"mdid"];
  [v5 encodeInt32:LODWORD(self->_deviceFilter) forKey:@"dflt"];
  [v5 encodeDouble:@"dr" forKey:self->_decayRate];
  [v5 encodeBool:self->_scoreWithBiases forKey:@"sbias"];
  [v5 encodeObject:self->_matchingTopicIds forKey:@"mids"];
  [v5 encodeObject:self->_matchingMappedTopicIds forKey:@"mmids"];
  [v5 encodeObject:self->_matchingTopicTrie forKey:@"trie"];
  [v5 encodeBool:self->_scoreWithCalibration forKey:@"scali"];
  [v5 encodeInteger:self->_minimumComponentCount forKey:@"mcc"];
  [v5 encodeObject:self->_matchingAlgorithms forKey:@"ma"];
  [v5 encodeObject:self->_excludingAlgorithms forKey:@"ea"];
  [v5 encodeBool:self->_scoreWithStrictFiltering forKey:@"ssf"];
  [v5 encodeBool:self->_excludeWithoutSentiment forKey:@"exnonsnt"];
  [v5 encodeBool:self->_orderByIdentifier forKey:@"obi"];
  [v5 encodeObject:self->_matchingContactHandle forKey:@"mch"];
  [v5 encodeBool:self->_filterByRelevanceDate forKey:@"fbrd"];
}

- (PPTopicQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PPTopicQuery;
  id v5 = [(PPTopicQuery *)&v42 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192F97350]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    NSUInteger v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    int v10 = (void *)MEMORY[0x192F97350]();
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    v5->_unint64_t limit = [v4 decodeIntegerForKey:@"lmt"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fdt"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tdt"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdt"];
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v9 forKey:@"mbdl"];
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v9 forKey:@"ebdl"];
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v9 forKey:@"gid"];
    matchingGroupIds = v5->_matchingGroupIds;
    v5->_matchingGroupIds = (NSSet *)v24;

    uint64_t v26 = [v4 decodeObjectOfClasses:v9 forKey:@"mdid"];
    matchingDocumentIds = v5->_matchingDocumentIds;
    v5->_matchingDocumentIds = (NSSet *)v26;

    v5->_unint64_t deviceFilter = (int)[v4 decodeInt32ForKey:@"dflt"];
    [v4 decodeDoubleForKey:@"dr"];
    v5->_double decayRate = v28;
    v5->_BOOL scoreWithBiases = [v4 decodeBoolForKey:@"sbias"];
    uint64_t v29 = [v4 decodeObjectOfClasses:v9 forKey:@"mids"];
    matchingTopicIds = v5->_matchingTopicIds;
    v5->_matchingTopicIds = (NSSet *)v29;

    uint64_t v31 = [v4 decodeObjectOfClasses:v9 forKey:@"mmids"];
    matchingMappedTopicIds = v5->_matchingMappedTopicIds;
    v5->_matchingMappedTopicIds = (NSSet *)v31;

    uint64_t v33 = [v4 decodeObjectOfClasses:v9 forKey:@"trie"];
    matchingTopicTrie = v5->_matchingTopicTrie;
    v5->_matchingTopicTrie = (NSString *)v33;

    v5->_scoreWithCalibration = [v4 decodeBoolForKey:@"scali"];
    v5->_minimumComponentCount = [v4 decodeIntegerForKey:@"mcc"];
    uint64_t v35 = [v4 decodeObjectOfClasses:v13 forKey:@"ma"];
    matchingAlgorithms = v5->_matchingAlgorithms;
    v5->_matchingAlgorithms = (NSSet *)v35;

    uint64_t v37 = [v4 decodeObjectOfClasses:v13 forKey:@"ea"];
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v37;

    v5->_BOOL scoreWithStrictFiltering = [v4 decodeBoolForKey:@"ssf"];
    v5->_BOOL excludeWithoutSentiment = [v4 decodeBoolForKey:@"exnonsnt"];
    v5->_orderByIdentifier = [v4 decodeBoolForKey:@"obi"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mch"];
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v39;

    v5->_BOOL filterByRelevanceDate = [v4 decodeBoolForKey:@"fbrd"];
  }

  return v5;
}

- (PPTopicQuery)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPTopicQuery;
  result = [(PPTopicQuery *)&v3 init];
  if (result)
  {
    result->_unint64_t limit = -1;
    result->_minimumComponentCount = 0;
    *(_WORD *)&result->_BOOL scoreWithBiases = 1;
    result->_scoreWithCalibration = 0;
    result->_unint64_t deviceFilter = 0;
    result->_double decayRate = -1.0;
  }
  return result;
}

- (BOOL)overrideDecayRate
{
  return 0;
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
        id v11 = +[PPTopicRecord describeAlgorithm:](PPTopicRecord, "describeAlgorithm:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13));
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

+ (id)queryForCSSearchableItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x192F97350]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = [v3 bundleID];
  int v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  [v4 setMatchingSourceBundleIds:v8];

  uint64_t v9 = [v3 domainIdentifier];

  if (v9)
  {
    int v10 = (void *)MEMORY[0x192F97350]();
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = [v3 domainIdentifier];
    long long v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);

    [v4 setMatchingGroupIds:v13];
  }
  long long v14 = (void *)MEMORY[0x192F97350]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  long long v16 = [v3 uniqueIdentifier];
  uint64_t v17 = objc_msgSend(v15, "initWithObjects:", v16, 0);

  [v4 setMatchingDocumentIds:v17];

  return v4;
}

@end