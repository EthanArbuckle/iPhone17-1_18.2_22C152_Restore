@interface PRSRankingConfiguration
- (BOOL)allow_coreduet_influence;
- (BOOL)disableResultTruncation;
- (IFunScores)iFunScores;
- (NSArray)parsecCategoryOrder;
- (NSArray)rankingQueries;
- (NSDictionary)serverFeatures;
- (NSDictionary)serverRelevanceScores;
- (NSDictionary)sqfData;
- (NSMutableDictionary)categoryEngagements;
- (NSMutableDictionary)queryDependentCategoryProbabilities;
- (NSMutableOrderedSet)cepBlocklistSet;
- (NSNumber)localResultQualityThreshold;
- (NSString)shortcutSectionBundleID;
- (PRSRankingConfiguration)init;
- (SSPlistDataReader)queryIndependentCategoryProbabilities;
- (double)queryDependentProbabilityForCategory:(id)a3;
- (double)queryIndependentProbabilityForCategory:(id)a3;
- (float)engagementProbabilityForCategory:(id)a3;
- (float)maxEngagementProbability;
- (float)numAppsDeduped;
- (float)serverRelevanceScoreThreshold;
- (void)appendToExistingCEPBlocklist:(id)a3;
- (void)lock;
- (void)mergeWith:(id)a3;
- (void)setAllow_coreduet_influence:(BOOL)a3;
- (void)setCategoryEngagements:(id)a3;
- (void)setCepBlocklistSet:(id)a3;
- (void)setDisableResultTruncation:(BOOL)a3;
- (void)setIFunScores:(id)a3;
- (void)setLocalResultQualityThreshold:(id)a3;
- (void)setNumAppsDeduped:(float)a3;
- (void)setParsecCategoryOrder:(id)a3;
- (void)setQueryDependentCategoryProbabilities:(id)a3;
- (void)setQueryIndependentCategoryProbabilities:(id)a3;
- (void)setRankingQueries:(id)a3;
- (void)setServerFeatures:(id)a3;
- (void)setServerRelevanceScoreThreshold:(float)a3;
- (void)setServerRelevanceScores:(id)a3;
- (void)setShortcutSectionBundleID:(id)a3;
- (void)setSqfData:(id)a3;
- (void)unlock;
- (void)updateQueryDependentProbabilityAndBlocklistSetWith:(id)a3;
@end

@implementation PRSRankingConfiguration

- (PRSRankingConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)PRSRankingConfiguration;
  v2 = [(PRSRankingConfiguration *)&v8 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PRSRankingConfiguration *)v2 setQueryDependentCategoryProbabilities:v3];

    v4 = objc_opt_new();
    [(PRSRankingConfiguration *)v2 setCepBlocklistSet:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    -[PRSRankingConfiguration setAllow_coreduet_influence:](v2, "setAllow_coreduet_influence:", [v5 integerForKey:@"usedCount"] > 19);

    LODWORD(v6) = -1.0;
    [(PRSRankingConfiguration *)v2 setNumAppsDeduped:v6];
    v2->_mutex._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)mergeWith:(id)a3
{
  v27 = (PRSRankingConfiguration *)a3;
  v4 = [(PRSRankingConfiguration *)self rankingQueries];
  v5 = v27;
  if (v4) {
    v5 = self;
  }
  double v6 = [(PRSRankingConfiguration *)v5 rankingQueries];
  [(PRSRankingConfiguration *)self setRankingQueries:v6];

  v7 = [(PRSRankingConfiguration *)self parsecCategoryOrder];
  objc_super v8 = v27;
  if (v7) {
    objc_super v8 = self;
  }
  v9 = [(PRSRankingConfiguration *)v8 parsecCategoryOrder];
  [(PRSRankingConfiguration *)self setParsecCategoryOrder:v9];

  if ([(PRSRankingConfiguration *)v27 disableResultTruncation]) {
    [(PRSRankingConfiguration *)self setDisableResultTruncation:[(PRSRankingConfiguration *)v27 disableResultTruncation]];
  }
  v10 = [(PRSRankingConfiguration *)v27 sqfData];
  if (v10)
  {
    [(PRSRankingConfiguration *)self updateWithSQFData:v10];
    v11 = [v10 objectForKey:@"local_result_quality_threshold"];
    localResultQualityThreshold = self->_localResultQualityThreshold;
    self->_localResultQualityThreshold = v11;
  }
  v13 = [(PRSRankingConfiguration *)v27 serverFeatures];

  if (v13)
  {
    v14 = [(PRSRankingConfiguration *)v27 serverFeatures];
    [(PRSRankingConfiguration *)self setServerFeatures:v14];
  }
  uint64_t v15 = [(PRSRankingConfiguration *)v27 queryIndependentCategoryProbabilities];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(PRSRankingConfiguration *)self queryIndependentCategoryProbabilities];

    if (!v17)
    {
      v18 = [(PRSRankingConfiguration *)v27 queryIndependentCategoryProbabilities];
      [(PRSRankingConfiguration *)self setQueryIndependentCategoryProbabilities:v18];

      v19 = [(PRSRankingConfiguration *)self queryIndependentCategoryProbabilities];
      v20 = [v19 blocklist];
      [(PRSRankingConfiguration *)self appendToExistingCEPBlocklist:v20];
    }
  }
  [(PRSRankingConfiguration *)self numAppsDeduped];
  v21 = v27;
  if (v22 != -1.0) {
    v21 = self;
  }
  [(PRSRankingConfiguration *)v21 numAppsDeduped];
  -[PRSRankingConfiguration setNumAppsDeduped:](self, "setNumAppsDeduped:");
  v23 = [(PRSRankingConfiguration *)v27 serverRelevanceScores];

  if (v23)
  {
    v24 = [(PRSRankingConfiguration *)v27 serverRelevanceScores];
    [(PRSRankingConfiguration *)self setServerRelevanceScores:v24];

    [(PRSRankingConfiguration *)v27 serverRelevanceScoreThreshold];
    -[PRSRankingConfiguration setServerRelevanceScoreThreshold:](self, "setServerRelevanceScoreThreshold:");
  }
  v25 = [(PRSRankingConfiguration *)v27 iFunScores];

  if (v25)
  {
    v26 = [(PRSRankingConfiguration *)v27 iFunScores];
    [(PRSRankingConfiguration *)self setIFunScores:v26];
  }
}

- (void)appendToExistingCEPBlocklist:(id)a3
{
  id v4 = a3;
  [(PRSRankingConfiguration *)self lock];
  v5 = [(PRSRankingConfiguration *)self cepBlocklistSet];
  [v5 addObjectsFromArray:v4];

  [(PRSRankingConfiguration *)self unlock];
}

- (void)updateQueryDependentProbabilityAndBlocklistSetWith:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PRSRankingConfiguration *)self lock];
  v23 = v4;
  v5 = objc_msgSend(v4, "prs_dictionaryForKey:", @"stats");
  double v6 = objc_msgSend(v5, "prs_arrayForKey:", @"cep_long");

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v10 = [v9 objectForKey:@"cid"];
        v11 = [v10 lowercaseString];

        v12 = [(PRSRankingConfiguration *)self queryDependentCategoryProbabilities];
        v13 = [v9 objectForKey:@"e"];
        [v12 setObject:v13 forKey:v11];

        v14 = [v9 objectForKey:@"e"];
        [v14 doubleValue];
        if (v15 < 0.0)
        {
          v16 = [v9 objectForKey:@"cid"];
          [v16 lowercaseString];
          uint64_t v17 = v7;
          v19 = v18 = self;
          char v20 = [v19 hasPrefix:@"com.apple."];

          self = v18;
          uint64_t v7 = v17;

          if (v20) {
            goto LABEL_10;
          }
          v14 = [(PRSRankingConfiguration *)self cepBlocklistSet];
          v21 = [v9 objectForKey:@"cid"];
          float v22 = [v21 lowercaseString];
          [v14 addObject:v22];
        }
LABEL_10:
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }

  [(PRSRankingConfiguration *)self unlock];
}

- (float)engagementProbabilityForCategory:(id)a3
{
  [(PRSRankingConfiguration *)self queryDependentProbabilityForCategory:a3];
  float v4 = v3;
  BOOL v5 = v3 == -1.0;
  float result = -1.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)queryDependentProbabilityForCategory:(id)a3
{
  id v4 = a3;
  [(PRSRankingConfiguration *)self lock];
  queryDependentCategoryProbabilities = self->_queryDependentCategoryProbabilities;
  double v6 = [v4 lowercaseString];

  uint64_t v7 = [(NSMutableDictionary *)queryDependentCategoryProbabilities objectForKey:v6];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }
  [(PRSRankingConfiguration *)self unlock];

  return v9;
}

- (double)queryIndependentProbabilityForCategory:(id)a3
{
  id v4 = a3;
  [(SSPlistDataReader *)self->_queryIndependentCategoryProbabilities doubleValueForBundle:v4];
  double v6 = v5;
  if (v5 < 0.0)
  {
    -[SSPlistDataReader doubleValueForKey:](self->_queryIndependentCategoryProbabilities, "doubleValueForKey:", [v4 UTF8String]);
    if (v7 >= 0.0) {
      double v6 = v7;
    }
    else {
      double v6 = -1.0;
    }
  }

  return v6;
}

- (float)maxEngagementProbability
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PRSRankingConfiguration *)self lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = [(NSMutableDictionary *)self->_queryDependentCategoryProbabilities allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = -1.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = [(NSMutableDictionary *)self->_queryDependentCategoryProbabilities objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        v10 = v9;
        if (v9)
        {
          [v9 doubleValue];
          if (v11 > v7 && v11 >= 0.0) {
            double v7 = v11;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = -1.0;
  }

  [(PRSRankingConfiguration *)self unlock];
  return v7;
}

- (NSMutableDictionary)categoryEngagements
{
  return self->_categoryEngagements;
}

- (void)setCategoryEngagements:(id)a3
{
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
}

- (NSMutableDictionary)queryDependentCategoryProbabilities
{
  return self->_queryDependentCategoryProbabilities;
}

- (void)setQueryDependentCategoryProbabilities:(id)a3
{
}

- (SSPlistDataReader)queryIndependentCategoryProbabilities
{
  return self->_queryIndependentCategoryProbabilities;
}

- (void)setQueryIndependentCategoryProbabilities:(id)a3
{
}

- (NSNumber)localResultQualityThreshold
{
  return self->_localResultQualityThreshold;
}

- (void)setLocalResultQualityThreshold:(id)a3
{
}

- (NSMutableOrderedSet)cepBlocklistSet
{
  return self->_cepBlocklistSet;
}

- (void)setCepBlocklistSet:(id)a3
{
}

- (NSArray)parsecCategoryOrder
{
  return self->_parsecCategoryOrder;
}

- (void)setParsecCategoryOrder:(id)a3
{
}

- (NSString)shortcutSectionBundleID
{
  return self->_shortcutSectionBundleID;
}

- (void)setShortcutSectionBundleID:(id)a3
{
}

- (BOOL)allow_coreduet_influence
{
  return self->_allow_coreduet_influence;
}

- (void)setAllow_coreduet_influence:(BOOL)a3
{
  self->_allow_coreduet_influence = a3;
}

- (NSDictionary)sqfData
{
  return self->_sqfData;
}

- (void)setSqfData:(id)a3
{
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setServerFeatures:(id)a3
{
}

- (NSDictionary)serverRelevanceScores
{
  return self->_serverRelevanceScores;
}

- (void)setServerRelevanceScores:(id)a3
{
}

- (float)serverRelevanceScoreThreshold
{
  return self->_serverRelevanceScoreThreshold;
}

- (void)setServerRelevanceScoreThreshold:(float)a3
{
  self->_serverRelevanceScoreThreshold = a3;
}

- (IFunScores)iFunScores
{
  return self->_iFunScores;
}

- (void)setIFunScores:(id)a3
{
}

- (BOOL)disableResultTruncation
{
  return self->_disableResultTruncation;
}

- (void)setDisableResultTruncation:(BOOL)a3
{
  self->_disableResultTruncation = a3;
}

- (float)numAppsDeduped
{
  return self->_numAppsDeduped;
}

- (void)setNumAppsDeduped:(float)a3
{
  self->_numAppsDeduped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFunScores, 0);
  objc_storeStrong((id *)&self->_serverRelevanceScores, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_sqfData, 0);
  objc_storeStrong((id *)&self->_shortcutSectionBundleID, 0);
  objc_storeStrong((id *)&self->_parsecCategoryOrder, 0);
  objc_storeStrong((id *)&self->_cepBlocklistSet, 0);
  objc_storeStrong((id *)&self->_localResultQualityThreshold, 0);
  objc_storeStrong((id *)&self->_queryIndependentCategoryProbabilities, 0);
  objc_storeStrong((id *)&self->_queryDependentCategoryProbabilities, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_categoryEngagements, 0);
}

@end