@interface PRSQueryRankingConfiguration
+ (void)updateMailVIP:(id)a3 phoneFavorites:(id)a4 meEmailAddresses:(id)a5;
- (BOOL)allowAnonymousDataCollection;
- (NSArray)rankingQueries;
- (NSOrderedSet)requiredAttributes;
- (double)maxAge;
- (double)minCount;
- (double)minL2Score;
- (uint64_t)fuzzyMatchCheck;
- (uint64_t)fuzzyMatchMask;
- (unint64_t)dominantRankingQueryCount;
- (unint64_t)dominatedRankingQueryCount;
- (unint64_t)highMatchBit;
- (unint64_t)highRecencyBit;
- (unint64_t)lowMatchBit;
- (unint64_t)lowRecencyBit;
- (unint64_t)rankingBitCount;
- (unint64_t)shortcutBit;
- (unint64_t)strongRankingQueryCount;
- (void)setAllowAnonymousDataCollection:(BOOL)a3;
- (void)setDominantRankingQueryCount:(unint64_t)a3;
- (void)setDominatedRankingQueryCount:(unint64_t)a3;
- (void)setFuzzyMatchCheck:(PRSQueryRankingConfiguration *)self;
- (void)setFuzzyMatchMask:(PRSQueryRankingConfiguration *)self;
- (void)setHighMatchBit:(unint64_t)a3;
- (void)setHighRecencyBit:(unint64_t)a3;
- (void)setLowMatchBit:(unint64_t)a3;
- (void)setLowRecencyBit:(unint64_t)a3;
- (void)setMaxAge:(double)a3;
- (void)setMinCount:(double)a3;
- (void)setMinL2Score:(double)a3;
- (void)setRankingBitCount:(unint64_t)a3;
- (void)setRankingQueries:(id)a3;
- (void)setRequiredAttributes:(id)a3;
- (void)setShortcutBit:(unint64_t)a3;
- (void)setStrongRankingQueryCount:(unint64_t)a3;
@end

@implementation PRSQueryRankingConfiguration

+ (void)updateMailVIP:(id)a3 phoneFavorites:(id)a4 meEmailAddresses:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  updateVIPRankingQuery(v7);
  updatePhoneFavoritesQuery(v8);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15), "objectForKeyedSubscript:", @"emailAddresses", (void)v17);
        [v10 addObjectsFromArray:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  updateVIPList(v11, v10);
  updateMeEmailAddresses(v9);
}

- (NSOrderedSet)requiredAttributes
{
  return self->_requiredAttributes;
}

- (void)setRequiredAttributes:(id)a3
{
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
}

- (unint64_t)strongRankingQueryCount
{
  return self->_strongRankingQueryCount;
}

- (void)setStrongRankingQueryCount:(unint64_t)a3
{
  self->_strongRankingQueryCount = a3;
}

- (unint64_t)dominantRankingQueryCount
{
  return self->_dominantRankingQueryCount;
}

- (void)setDominantRankingQueryCount:(unint64_t)a3
{
  self->_dominantRankingQueryCount = a3;
}

- (unint64_t)dominatedRankingQueryCount
{
  return self->_dominatedRankingQueryCount;
}

- (void)setDominatedRankingQueryCount:(unint64_t)a3
{
  self->_dominatedRankingQueryCount = a3;
}

- (unint64_t)shortcutBit
{
  return self->_shortcutBit;
}

- (void)setShortcutBit:(unint64_t)a3
{
  self->_shortcutBit = a3;
}

- (unint64_t)highMatchBit
{
  return self->_highMatchBit;
}

- (void)setHighMatchBit:(unint64_t)a3
{
  self->_highMatchBit = a3;
}

- (unint64_t)lowMatchBit
{
  return self->_lowMatchBit;
}

- (void)setLowMatchBit:(unint64_t)a3
{
  self->_lowMatchBit = a3;
}

- (unint64_t)highRecencyBit
{
  return self->_highRecencyBit;
}

- (void)setHighRecencyBit:(unint64_t)a3
{
  self->_highRecencyBit = a3;
}

- (unint64_t)lowRecencyBit
{
  return self->_lowRecencyBit;
}

- (void)setLowRecencyBit:(unint64_t)a3
{
  self->_lowRecencyBit = a3;
}

- (unint64_t)rankingBitCount
{
  return self->_rankingBitCount;
}

- (void)setRankingBitCount:(unint64_t)a3
{
  self->_rankingBitCount = a3;
}

- (BOOL)allowAnonymousDataCollection
{
  return self->_allowAnonymousDataCollection;
}

- (void)setAllowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollection = a3;
}

- (uint64_t)fuzzyMatchMask
{
  return *(void *)(a1 + 128);
}

- (void)setFuzzyMatchMask:(PRSQueryRankingConfiguration *)self
{
  *(void *)self->_fuzzyMatchMask = v2;
  *(void *)&self->_fuzzyMatchMask[8] = v3;
}

- (uint64_t)fuzzyMatchCheck
{
  return *(void *)(a1 + 144);
}

- (void)setFuzzyMatchCheck:(PRSQueryRankingConfiguration *)self
{
  *(void *)self->_fuzzyMatchCheck = v2;
  *(void *)&self->_fuzzyMatchCheck[8] = v3;
}

- (double)minL2Score
{
  return self->_minL2Score;
}

- (void)setMinL2Score:(double)a3
{
  self->_minL2Score = a3;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (double)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(double)a3
{
  self->_minCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_requiredAttributes, 0);
}

@end