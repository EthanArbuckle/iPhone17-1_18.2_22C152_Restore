@interface PPNamedEntityQuery
+ (BOOL)supportsSecureCoding;
+ (id)_excludingAlgorithmsDescription:(id)a3;
+ (id)_matchingCategoriesDescription:(id)a3;
+ (id)locationQueryWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5;
- (BOOL)excludeWithoutSentiment;
- (BOOL)filterByRelevanceDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedEntityQuery:(id)a3;
- (BOOL)isForRecordMonitoring;
- (BOOL)matchCategory;
- (BOOL)orderByAscendingDate;
- (BOOL)orderByName;
- (BOOL)overrideDecayRate;
- (BOOL)removeNearDuplicates;
- (NSDate)fromDate;
- (NSDate)scoringDate;
- (NSDate)toDate;
- (NSSet)excludingAlgorithms;
- (NSSet)excludingSourceBundleIds;
- (NSSet)matchingCategories;
- (NSSet)matchingNames;
- (NSSet)matchingSourceBundleIds;
- (NSSet)matchingSourceDocumentIds;
- (NSSet)matchingSourceGroupIds;
- (NSString)matchingContactHandle;
- (NSString)matchingEntityTrie;
- (NSString)matchingName;
- (PPNamedEntityQuery)init;
- (PPNamedEntityQuery)initWithCoder:(id)a3;
- (double)decayRate;
- (id)copyForMonitoring;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customizedDescription;
- (id)description;
- (unint64_t)deviceFilter;
- (unint64_t)hash;
- (unint64_t)limit;
- (unint64_t)locationConsumer;
- (void)encodeWithCoder:(id)a3;
- (void)setDecayRate:(double)a3;
- (void)setDeviceFilter:(unint64_t)a3;
- (void)setExcludeWithoutSentiment:(BOOL)a3;
- (void)setExcludingAlgorithms:(id)a3;
- (void)setExcludingSourceBundleIds:(id)a3;
- (void)setFilterByRelevanceDate:(BOOL)a3;
- (void)setFromDate:(id)a3;
- (void)setIsForRecordMonitoring:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setLocationConsumer:(unint64_t)a3;
- (void)setMatchCategory:(BOOL)a3;
- (void)setMatchingCategories:(id)a3;
- (void)setMatchingContactHandle:(id)a3;
- (void)setMatchingEntityTrie:(id)a3;
- (void)setMatchingName:(id)a3;
- (void)setMatchingNames:(id)a3;
- (void)setMatchingSourceBundleIds:(id)a3;
- (void)setMatchingSourceDocumentIds:(id)a3;
- (void)setMatchingSourceGroupIds:(id)a3;
- (void)setOrderByAscendingDate:(BOOL)a3;
- (void)setOrderByName:(BOOL)a3;
- (void)setRemoveNearDuplicates:(BOOL)a3;
- (void)setScoringDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation PPNamedEntityQuery

- (unint64_t)limit
{
  return self->_limit;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (BOOL)removeNearDuplicates
{
  return self->_removeNearDuplicates;
}

- (BOOL)orderByName
{
  return self->_orderByName;
}

- (BOOL)orderByAscendingDate
{
  return self->_orderByAscendingDate;
}

- (NSSet)matchingSourceGroupIds
{
  return self->_matchingSourceGroupIds;
}

- (NSSet)matchingSourceDocumentIds
{
  return self->_matchingSourceDocumentIds;
}

- (NSSet)matchingSourceBundleIds
{
  return self->_matchingSourceBundleIds;
}

- (NSSet)matchingNames
{
  return self->_matchingNames;
}

- (NSString)matchingName
{
  return self->_matchingName;
}

- (NSString)matchingEntityTrie
{
  return self->_matchingEntityTrie;
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (unint64_t)locationConsumer
{
  return self->_locationConsumer;
}

- (BOOL)filterByRelevanceDate
{
  return self->_filterByRelevanceDate;
}

- (NSSet)excludingSourceBundleIds
{
  return self->_excludingSourceBundleIds;
}

- (NSSet)excludingAlgorithms
{
  return self->_excludingAlgorithms;
}

- (BOOL)excludeWithoutSentiment
{
  return self->_excludeWithoutSentiment;
}

- (unint64_t)deviceFilter
{
  return self->_deviceFilter;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setLimit:self->_limit];
    [v5 setFromDate:self->_fromDate];
    [v5 setToDate:self->_toDate];
    [v5 setScoringDate:self->_scoringDate];
    [v5 setMatchingSourceBundleIds:self->_matchingSourceBundleIds];
    [v5 setExcludingSourceBundleIds:self->_excludingSourceBundleIds];
    [v5 setMatchingSourceGroupIds:self->_matchingSourceGroupIds];
    [v5 setDeviceFilter:self->_deviceFilter];
    [v5 setMatchingName:self->_matchingName];
    [v5 setMatchingNames:self->_matchingNames];
    [v5 setMatchCategory:self->_matchCategory];
    [v5 setMatchingCategories:self->_matchingCategories];
    [v5 setMatchingEntityTrie:self->_matchingEntityTrie];
    [v5 setExcludingAlgorithms:self->_excludingAlgorithms];
    [v5 setExcludeWithoutSentiment:self->_excludeWithoutSentiment];
    [v5 setIsForRecordMonitoring:self->_isForRecordMonitoring];
    [v5 setOrderByName:self->_orderByName];
    [v5 setLocationConsumer:self->_locationConsumer];
    [v5 setMatchingContactHandle:self->_matchingContactHandle];
    [v5 setMatchingSourceDocumentIds:self->_matchingSourceDocumentIds];
    [v5 setFilterByRelevanceDate:self->_filterByRelevanceDate];
  }
  return v5;
}

- (void)setMatchingSourceBundleIds:(id)a3
{
}

- (void)setMatchingCategories:(id)a3
{
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setFromDate:(id)a3
{
}

- (PPNamedEntityQuery)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityQuery;
  result = [(PPNamedEntityQuery *)&v3 init];
  if (result)
  {
    result->_limit = -1;
    result->_deviceFilter = 0;
    result->_decayRate = -1.0;
  }
  return result;
}

- (void)setToDate:(id)a3
{
}

- (void)setScoringDate:(id)a3
{
}

- (void)setOrderByName:(BOOL)a3
{
  self->_orderByName = a3;
}

- (void)setMatchingSourceGroupIds:(id)a3
{
}

- (void)setMatchingSourceDocumentIds:(id)a3
{
}

- (void)setMatchingNames:(id)a3
{
}

- (void)setMatchingName:(id)a3
{
}

- (void)setMatchingEntityTrie:(id)a3
{
}

- (void)setMatchingContactHandle:(id)a3
{
}

- (void)setMatchCategory:(BOOL)a3
{
  self->_matchCategory = a3;
}

- (void)setLocationConsumer:(unint64_t)a3
{
  self->_locationConsumer = a3;
}

- (void)setIsForRecordMonitoring:(BOOL)a3
{
  self->_isForRecordMonitoring = a3;
}

- (void)setFilterByRelevanceDate:(BOOL)a3
{
  self->_filterByRelevanceDate = a3;
}

- (void)setExcludingSourceBundleIds:(id)a3
{
}

- (void)setExcludingAlgorithms:(id)a3
{
}

- (void)setExcludeWithoutSentiment:(BOOL)a3
{
  self->_excludeWithoutSentiment = a3;
}

- (void)setDeviceFilter:(unint64_t)a3
{
  self->_deviceFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingEntityTrie, 0);
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingCategories, 0);
  objc_storeStrong((id *)&self->_matchingNames, 0);
  objc_storeStrong((id *)&self->_matchingName, 0);
  objc_storeStrong((id *)&self->_matchingSourceDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceGroupIds, 0);
  objc_storeStrong((id *)&self->_excludingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_scoringDate, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

- (BOOL)isForRecordMonitoring
{
  return self->_isForRecordMonitoring;
}

- (void)setRemoveNearDuplicates:(BOOL)a3
{
  self->_removeNearDuplicates = a3;
}

- (void)setOrderByAscendingDate:(BOOL)a3
{
  self->_orderByAscendingDate = a3;
}

- (BOOL)matchCategory
{
  return self->_matchCategory;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (NSDate)scoringDate
{
  return self->_scoringDate;
}

- (id)copyForMonitoring
{
  v2 = (void *)[(PPNamedEntityQuery *)self copy];
  [v2 setIsForRecordMonitoring:1];
  return v2;
}

- (id)customizedDescription
{
  objc_super v3 = objc_opt_new();
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
  matchingSourceGroupIds = self->_matchingSourceGroupIds;
  if (matchingSourceGroupIds)
  {
    unint64_t v19 = [(NSSet *)matchingSourceGroupIds count];
    id v20 = [NSString alloc];
    if (v19 < 0xB) {
      uint64_t v21 = [v20 initWithFormat:@"matchingGroupIds:%@", self->_matchingSourceGroupIds];
    }
    else {
      uint64_t v21 = objc_msgSend(v20, "initWithFormat:", @"matchingGroupIds.count:%tu", -[NSSet count](self->_matchingSourceGroupIds, "count"));
    }
    v22 = (void *)v21;
    [v3 addObject:v21];
  }
  if (self->_deviceFilter)
  {
    id v23 = [NSString alloc];
    v24 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
    v25 = (void *)[v23 initWithFormat:@"deviceFilter:%@", v24];
    [v3 addObject:v25];
  }
  if (self->_decayRate != -1.0)
  {
    v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"decayRate:%f", *(void *)&self->_decayRate);
    [v3 addObject:v26];
  }
  if (self->_matchingName)
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingName.length:%tu", -[NSString length](self->_matchingName, "length"));
    [v3 addObject:v27];
  }
  if (self->_matchingNames)
  {
    v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingNames.count:%tu", -[NSSet count](self->_matchingNames, "count"));
    [v3 addObject:v28];
  }
  if (self->_matchingContactHandle)
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"matchingContactHandle.length:%tu", -[NSString length](self->_matchingContactHandle, "length"));
    [v3 addObject:v29];
  }
  if (self->_matchCategory)
  {
    NSUInteger v30 = [(NSSet *)self->_matchingCategories count];
    id v31 = [NSString alloc];
    if (v30 < 0xB)
    {
      v32 = [(id)objc_opt_class() _matchingCategoriesDescription:self->_matchingCategories];
      v33 = (void *)[v31 initWithFormat:@"matchingCategories:%@", v32];
      [v3 addObject:v33];
    }
    else
    {
      v32 = objc_msgSend(v31, "initWithFormat:", @"matchingCategories.count:%tu", -[NSSet count](self->_matchingCategories, "count"));
      [v3 addObject:v32];
    }
  }
  if (self->_matchingEntityTrie)
  {
    v34 = (void *)[[NSString alloc] initWithFormat:@"matchingEntityTrie:'%@'", self->_matchingEntityTrie];
    [v3 addObject:v34];
  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    unint64_t v36 = [(NSSet *)excludingAlgorithms count];
    id v37 = [NSString alloc];
    if (v36 < 0xB)
    {
      v38 = [(id)objc_opt_class() _excludingAlgorithmsDescription:self->_excludingAlgorithms];
      v39 = (void *)[v37 initWithFormat:@"excludingAlgorithms:%@", v38];
      [v3 addObject:v39];
    }
    else
    {
      v38 = objc_msgSend(v37, "initWithFormat:", @"excludingAlgorithms.count:%tu", -[NSSet count](self->_excludingAlgorithms, "count"));
      [v3 addObject:v38];
    }
  }
  if (self->_excludeWithoutSentiment) {
    [v3 addObject:@"excludeWithoutSentiment:YES"];
  }
  if (self->_isForRecordMonitoring) {
    [v3 addObject:@"isForRecordMonitoring:YES"];
  }
  if (self->_orderByName) {
    [v3 addObject:@"orderByName:YES"];
  }
  if (self->_locationConsumer)
  {
    v40 = +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:");
    [v3 addObject:v40];
  }
  matchingSourceDocumentIds = self->_matchingSourceDocumentIds;
  if (matchingSourceDocumentIds)
  {
    unint64_t v42 = [(NSSet *)matchingSourceDocumentIds count];
    id v43 = [NSString alloc];
    if (v42 < 0xB) {
      uint64_t v44 = [v43 initWithFormat:@"matchingSourceDocumentIds:%@", self->_matchingSourceDocumentIds];
    }
    else {
      uint64_t v44 = objc_msgSend(v43, "initWithFormat:", @"matchingSourceDocumentIds.count:%tu", -[NSSet count](self->_matchingSourceDocumentIds, "count"));
    }
    v45 = (void *)v44;
    [v3 addObject:v44];
  }
  if (self->_filterByRelevanceDate) {
    [v3 addObject:@"filterByRelevanceDate:YES"];
  }
  v46 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @" ");

  return v46;
}

- (id)description
{
  uint64_t v21 = [(id)objc_opt_class() _matchingCategoriesDescription:self->_matchingCategories];
  v17 = [(id)objc_opt_class() _excludingAlgorithmsDescription:self->_excludingAlgorithms];
  id v20 = [NSString alloc];
  long long v18 = *(_OWORD *)&self->_toDate;
  long long v19 = *(_OWORD *)&self->_limit;
  long long v16 = *(_OWORD *)&self->_matchingSourceBundleIds;
  matchingSourceGroupIds = self->_matchingSourceGroupIds;
  objc_super v3 = +[PPEnumTypes stringForDeviceFilter:self->_deviceFilter];
  NSUInteger v14 = [(NSString *)self->_matchingName length];
  NSUInteger v4 = [(NSSet *)self->_matchingNames count];
  if (self->_excludeWithoutSentiment) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (self->_isForRecordMonitoring) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_orderByName) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  matchingEntityTrie = self->_matchingEntityTrie;
  uint64_t v9 = +[PPLocationStore describeLocationConsumer:self->_locationConsumer];
  id v10 = (void *)v9;
  if (self->_filterByRelevanceDate) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v12 = objc_msgSend(v20, "initWithFormat:", @"<PPNamedEntityQuery l:%tu d:%@-%@ sd:%@ mid:%@ eid:%@ gid:%@ df:%@ mn:%tu mns:%tu c:%@ ea:%@ trie:%@ ens:%@ frm:%@ obn:%@ lcon:%@ mch:%@ msdi:%@ fbrd:%@>", v19, v18, v16, matchingSourceGroupIds, v3, v14, v4, v21, v17, matchingEntityTrie, v5, v6, v7, v9, self->_matchingContactHandle, self->_matchingSourceDocumentIds,
                  v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PPNamedEntityQuery *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPNamedEntityQuery *)self isEqualToNamedEntityQuery:v4];
  }

  return v5;
}

- (BOOL)isEqualToNamedEntityQuery:(id)a3
{
  NSUInteger v4 = (PPNamedEntityQuery *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v33 = 1;
    goto LABEL_75;
  }
  if (!v4) {
    goto LABEL_74;
  }
  unint64_t limit = self->_limit;
  if (limit != [(PPNamedEntityQuery *)v4 limit]) {
    goto LABEL_74;
  }
  v7 = self->_fromDate;
  uint64_t v8 = [(PPNamedEntityQuery *)v5 fromDate];
  if ((unint64_t)v7 | v8)
  {
    uint64_t v9 = (void *)v8;
    if (!v7 || !v8) {
      goto LABEL_73;
    }
    int v10 = [(NSSet *)v7 isEqualToDate:v8];

    if (!v10) {
      goto LABEL_74;
    }
  }
  v7 = self->_toDate;
  uint64_t v11 = [(PPNamedEntityQuery *)v5 toDate];
  if ((unint64_t)v7 | v11)
  {
    uint64_t v9 = (void *)v11;
    if (!v7 || !v11) {
      goto LABEL_73;
    }
    int v12 = [(NSSet *)v7 isEqualToDate:v11];

    if (!v12) {
      goto LABEL_74;
    }
  }
  v7 = self->_scoringDate;
  uint64_t v13 = [(PPNamedEntityQuery *)v5 scoringDate];
  if ((unint64_t)v7 | v13)
  {
    uint64_t v9 = (void *)v13;
    if (!v7 || !v13) {
      goto LABEL_73;
    }
    int v34 = [(NSSet *)v7 isEqualToDate:v13];

    if (!v34) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingSourceBundleIds;
  uint64_t v14 = [(PPNamedEntityQuery *)v5 matchingSourceBundleIds];
  if ((unint64_t)v7 | v14)
  {
    uint64_t v9 = (void *)v14;
    if (!v7 || !v14) {
      goto LABEL_73;
    }
    BOOL v35 = [(NSSet *)v7 isEqualToSet:v14];

    if (!v35) {
      goto LABEL_74;
    }
  }
  v7 = self->_excludingSourceBundleIds;
  uint64_t v15 = [(PPNamedEntityQuery *)v5 excludingSourceBundleIds];
  if ((unint64_t)v7 | v15)
  {
    uint64_t v9 = (void *)v15;
    if (!v7 || !v15) {
      goto LABEL_73;
    }
    BOOL v16 = [(NSSet *)v7 isEqualToSet:v15];

    if (!v16) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingSourceGroupIds;
  uint64_t v17 = [(PPNamedEntityQuery *)v5 matchingSourceGroupIds];
  if ((unint64_t)v7 | v17)
  {
    uint64_t v9 = (void *)v17;
    if (!v7 || !v17) {
      goto LABEL_73;
    }
    BOOL v36 = [(NSSet *)v7 isEqualToSet:v17];

    if (!v36) {
      goto LABEL_74;
    }
  }
  unint64_t deviceFilter = self->_deviceFilter;
  if (deviceFilter != [(PPNamedEntityQuery *)v5 deviceFilter]) {
    goto LABEL_74;
  }
  v7 = self->_matchingName;
  uint64_t v19 = [(PPNamedEntityQuery *)v5 matchingName];
  if ((unint64_t)v7 | v19)
  {
    uint64_t v9 = (void *)v19;
    if (!v7 || !v19) {
      goto LABEL_73;
    }
    int v37 = [(NSSet *)v7 isEqualToString:v19];

    if (!v37) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingNames;
  uint64_t v20 = [(PPNamedEntityQuery *)v5 matchingNames];
  if ((unint64_t)v7 | v20)
  {
    uint64_t v9 = (void *)v20;
    if (!v7 || !v20) {
      goto LABEL_73;
    }
    BOOL v38 = [(NSSet *)v7 isEqualToSet:v20];

    if (!v38) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingContactHandle;
  uint64_t v21 = [(PPNamedEntityQuery *)v5 matchingContactHandle];
  if ((unint64_t)v7 | v21)
  {
    uint64_t v9 = (void *)v21;
    if (!v7 || !v21) {
      goto LABEL_73;
    }
    int v39 = [(NSSet *)v7 isEqualToString:v21];

    if (!v39) {
      goto LABEL_74;
    }
  }
  BOOL matchCategory = self->_matchCategory;
  if (matchCategory != [(PPNamedEntityQuery *)v5 matchCategory]) {
    goto LABEL_74;
  }
  v7 = self->_matchingCategories;
  uint64_t v23 = [(PPNamedEntityQuery *)v5 matchingCategories];
  if ((unint64_t)v7 | v23)
  {
    uint64_t v9 = (void *)v23;
    if (!v7 || !v23) {
      goto LABEL_73;
    }
    BOOL v24 = [(NSSet *)v7 isEqualToSet:v23];

    if (!v24) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingEntityTrie;
  uint64_t v25 = [(PPNamedEntityQuery *)v5 matchingEntityTrie];
  if ((unint64_t)v7 | v25)
  {
    uint64_t v9 = (void *)v25;
    if (!v7 || !v25) {
      goto LABEL_73;
    }
    int v40 = [(NSSet *)v7 isEqualToString:v25];

    if (!v40) {
      goto LABEL_74;
    }
  }
  v7 = self->_excludingAlgorithms;
  uint64_t v26 = [(PPNamedEntityQuery *)v5 excludingAlgorithms];
  if ((unint64_t)v7 | v26)
  {
    uint64_t v9 = (void *)v26;
    if (!v7 || !v26) {
      goto LABEL_73;
    }
    BOOL v41 = [(NSSet *)v7 isEqualToSet:v26];

    if (!v41) {
      goto LABEL_74;
    }
  }
  v7 = self->_matchingSourceDocumentIds;
  uint64_t v27 = [(PPNamedEntityQuery *)v5 matchingSourceDocumentIds];
  if ((unint64_t)v7 | v27)
  {
    uint64_t v9 = (void *)v27;
    if (v7 && v27)
    {
      BOOL v42 = [(NSSet *)v7 isEqualToSet:v27];

      if (v42) {
        goto LABEL_31;
      }
LABEL_74:
      BOOL v33 = 0;
      goto LABEL_75;
    }
LABEL_73:

    goto LABEL_74;
  }
LABEL_31:
  BOOL excludeWithoutSentiment = self->_excludeWithoutSentiment;
  if (excludeWithoutSentiment != [(PPNamedEntityQuery *)v5 excludeWithoutSentiment]) {
    goto LABEL_74;
  }
  BOOL isForRecordMonitoring = self->_isForRecordMonitoring;
  if (isForRecordMonitoring != [(PPNamedEntityQuery *)v5 isForRecordMonitoring]) {
    goto LABEL_74;
  }
  BOOL orderByName = self->_orderByName;
  if (orderByName != [(PPNamedEntityQuery *)v5 orderByName]) {
    goto LABEL_74;
  }
  unint64_t locationConsumer = self->_locationConsumer;
  if (locationConsumer != [(PPNamedEntityQuery *)v5 locationConsumer]) {
    goto LABEL_74;
  }
  BOOL filterByRelevanceDate = self->_filterByRelevanceDate;
  BOOL v33 = filterByRelevanceDate == [(PPNamedEntityQuery *)v5 filterByRelevanceDate];
LABEL_75:

  return v33;
}

- (unint64_t)hash
{
  unint64_t limit = self->_limit;
  uint64_t v4 = [(NSDate *)self->_fromDate hash] ^ limit;
  uint64_t v5 = [(NSDate *)self->_toDate hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_scoringDate hash];
  uint64_t v7 = [(NSSet *)self->_matchingSourceBundleIds hash];
  uint64_t v8 = v7 ^ [(NSSet *)self->_excludingSourceBundleIds hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSSet *)self->_matchingSourceGroupIds hash];
  unint64_t deviceFilter = self->_deviceFilter;
  NSUInteger v11 = deviceFilter ^ [(NSString *)self->_matchingName hash];
  uint64_t v12 = v9 ^ v11 ^ [(NSSet *)self->_matchingNames hash] ^ self->_matchCategory;
  uint64_t v13 = [(NSSet *)self->_matchingCategories hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_matchingEntityTrie hash];
  return v12 ^ v14 ^ [(NSSet *)self->_excludingAlgorithms hash] ^ self->_excludeWithoutSentiment ^ self->_isForRecordMonitoring ^ self->_orderByName ^ self->_locationConsumer ^ self->_filterByRelevanceDate;
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
  [v5 encodeObject:self->_matchingSourceGroupIds forKey:@"gid"];
  [v5 encodeInt32:LODWORD(self->_deviceFilter) forKey:@"dflt"];
  [v5 encodeObject:self->_matchingName forKey:@"mnam"];
  [v5 encodeObject:self->_matchingNames forKey:@"mnams"];
  [v5 encodeBool:self->_matchCategory forKey:@"bmcat"];
  [v5 encodeObject:self->_matchingCategories forKey:@"mcats"];
  [v5 encodeObject:self->_matchingEntityTrie forKey:@"trie"];
  [v5 encodeObject:self->_excludingAlgorithms forKey:@"exalg"];
  [v5 encodeBool:self->_excludeWithoutSentiment forKey:@"exnonsnt"];
  [v5 encodeBool:self->_isForRecordMonitoring forKey:@"frm"];
  [v5 encodeBool:self->_orderByName forKey:@"obn"];
  [v5 encodeInt32:LODWORD(self->_locationConsumer) forKey:@"lcon"];
  [v5 encodeObject:self->_matchingContactHandle forKey:@"mch"];
  [v5 encodeObject:self->_matchingSourceDocumentIds forKey:@"msdi"];
  [v5 encodeBool:self->_filterByRelevanceDate forKey:@"fbrd"];
}

- (PPNamedEntityQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PPNamedEntityQuery;
  id v5 = [(PPNamedEntityQuery *)&v40 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    NSUInteger v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    v5->_unint64_t limit = [v4 decodeIntegerForKey:@"lmt"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fdt"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tdt"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdt"];
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v8 forKey:@"mbdl"];
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v8 forKey:@"ebdl"];
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v8 forKey:@"gid"];
    matchingSourceGroupIds = v5->_matchingSourceGroupIds;
    v5->_matchingSourceGroupIds = (NSSet *)v22;

    v5->_unint64_t deviceFilter = (int)[v4 decodeInt32ForKey:@"dflt"];
    [v4 decodeDoubleForKey:@"dr"];
    v5->_decayRate = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnam"];
    matchingName = v5->_matchingName;
    v5->_matchingName = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v8 forKey:@"mnams"];
    matchingNames = v5->_matchingNames;
    v5->_matchingNames = (NSSet *)v27;

    v5->_BOOL matchCategory = [v4 decodeBoolForKey:@"bmcat"];
    uint64_t v29 = [v4 decodeObjectOfClasses:v11 forKey:@"mcats"];
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v29;

    uint64_t v31 = [v4 decodeObjectOfClasses:v8 forKey:@"trie"];
    matchingEntityTrie = v5->_matchingEntityTrie;
    v5->_matchingEntityTrie = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClasses:v11 forKey:@"exalg"];
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v33;

    v5->_BOOL excludeWithoutSentiment = [v4 decodeBoolForKey:@"exnonsnt"];
    v5->_BOOL isForRecordMonitoring = [v4 decodeBoolForKey:@"frm"];
    v5->_BOOL orderByName = [v4 decodeBoolForKey:@"obn"];
    v5->_unint64_t locationConsumer = (int)[v4 decodeInt32ForKey:@"lcon"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mch"];
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClasses:v8 forKey:@"msdi"];
    matchingSourceDocumentIds = v5->_matchingSourceDocumentIds;
    v5->_matchingSourceDocumentIds = (NSSet *)v37;

    v5->_BOOL filterByRelevanceDate = [v4 decodeBoolForKey:@"fbrd"];
  }

  return v5;
}

- (BOOL)overrideDecayRate
{
  return 0;
}

+ (id)locationQueryWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v8 setLimit:a3];
  uint64_t v9 = [v8 setMatchCategory:1];
  switch(a5)
  {
    case 3uLL:
      uint64_t v10 = (void *)MEMORY[0x192F97350](v9);
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDA6B638, &unk_1EDA6B650, &unk_1EDA6B668, &unk_1EDA6B680, &unk_1EDA6B620, &unk_1EDA6B698, &unk_1EDA6B6B0, 0);
      goto LABEL_7;
    case 2uLL:
      uint64_t v10 = (void *)MEMORY[0x192F97350](v9);
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDA6B638, &unk_1EDA6B650, &unk_1EDA6B668, 0, v22, v23, v24, v25);
      goto LABEL_7;
    case 1uLL:
      uint64_t v10 = (void *)MEMORY[0x192F97350](v9);
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDA6B638, &unk_1EDA6B650, &unk_1EDA6B668, &unk_1EDA6B680, 0, v23, v24, v25);
LABEL_7:
      uint64_t v12 = (void *)v11;
      goto LABEL_9;
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v14 = [NSString stringWithUTF8String:"NSSet<NSNumber *> * _Nonnull locationCategoriesForMaps(PPLocationConsumer)"];
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PPNamedEntityStore.m", 368, @"Bad location consumer: %tu", a5);

  uint64_t v12 = objc_opt_new();
LABEL_9:
  [v8 setMatchingCategories:v12];

  if (a5 == 3)
  {
    [v8 setExcludingAlgorithms:0];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x192F97350]();
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDA6B620, 0);
    [v8 setExcludingAlgorithms:v16];
  }
  uint64_t v17 = (void *)MEMORY[0x192F97350]([v8 setFromDate:v7]);
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.Maps", @"com.apple.CoreRoutine", @"com.apple.mobilecal", @"com.apple.iCal", @"com.apple.Passbook", 0);
  if (a5 == 3)
  {
    [v8 setExcludingSourceBundleIds:v18];
  }
  else
  {
    v26[0] = @"com.apple.mobileslideshow";
    v26[1] = @"com.apple.Photos";
    v26[2] = @"com.apple.camera";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    uint64_t v20 = [v18 setByAddingObjectsFromArray:v19];
    [v8 setExcludingSourceBundleIds:v20];
  }
  [v8 setLocationConsumer:a5];

  return v8;
}

+ (id)_excludingAlgorithmsDescription:(id)a3
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
        uint64_t v11 = +[PPNamedEntityRecord describeAlgorithm:](PPNamedEntityRecord, "describeAlgorithm:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13));
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
        uint64_t v11 = +[PPNamedEntity describeCategory:](PPNamedEntity, "describeCategory:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13));
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