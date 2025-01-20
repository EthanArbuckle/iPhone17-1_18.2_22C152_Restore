@interface VUISportsScoreboardViewModel
- (BOOL)configureScoreUpdates;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVersus;
- (BOOL)showScoreboard;
- (NSArray)scores;
- (NSDate)lastUpdatedTime;
- (NSDictionary)contentMetadata;
- (NSDictionary)leagueContext;
- (NSString)canonicalId;
- (NSString)leagueId;
- (VUISportsScoreboardViewModel)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (id)jsContextDictionary;
- (void)removeUnicodeFromScoreValuesIfNeeded;
- (void)setConfigureScoreUpdates:(BOOL)a3;
@end

@implementation VUISportsScoreboardViewModel

- (VUISportsScoreboardViewModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VUISportsScoreboardViewModel;
  v5 = [(VUISportsScoreboardViewModel *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

    uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"sportingEventId");
    canonicalId = v5->_canonicalId;
    v5->_canonicalId = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "vui_dictionaryForKey:", @"leagueContext");
    leagueContext = v5->_leagueContext;
    v5->_leagueContext = (NSDictionary *)v10;

    uint64_t v12 = [(NSDictionary *)v5->_leagueContext vui_stringForKey:@"leagueId"];
    leagueId = v5->_leagueId;
    v5->_leagueId = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "vui_arrayForKey:", @"scores");
    scores = v5->_scores;
    v5->_scores = (NSArray *)v14;

    v5->_suppressed = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"suppressScoreboard", 0);
    v5->_configureScoreUpdates = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"configureScoreUpdates", 0);
    v5->_isVersus = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isVersus", 0);
    uint64_t v16 = objc_msgSend(v4, "vui_dictionaryForKey:", @"contentMetadata");
    contentMetadata = v5->_contentMetadata;
    v5->_contentMetadata = (NSDictionary *)v16;

    v18 = objc_msgSend(v4, "vui_numberForKey:", @"lastUpdatedTime");
    v19 = v18;
    if (v18
      && (uint64_t v20 = [v18 longLongValue],
          [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v20 / 1000.0],
          (v21 = (NSDate *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      lastUpdatedTime = v5->_lastUpdatedTime;
      v5->_lastUpdatedTime = v21;
      v23 = v21;
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] distantPast];
      v23 = v5->_lastUpdatedTime;
      v5->_lastUpdatedTime = (NSDate *)v24;
    }

    [(VUISportsScoreboardViewModel *)v5 removeUnicodeFromScoreValuesIfNeeded];
  }

  return v5;
}

- (BOOL)showScoreboard
{
  v3 = [MEMORY[0x1E4FB5178] sharedPreferences];
  if ([v3 sportsScoreSpoilersAllowed]) {
    BOOL v4 = !self->_suppressed;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)jsContextDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSString *)self->_canonicalId length]) {
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_canonicalId, @"sportingEventId");
  }
  leagueContext = self->_leagueContext;
  if (leagueContext && [(NSDictionary *)leagueContext count]) {
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_leagueContext, @"leagueContext");
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[(NSDictionary *)self->_dictionaryRepresentation copy];
  return v2;
}

- (void)removeUnicodeFromScoreValuesIfNeeded
{
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_scores count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v5 = [(NSArray *)self->_scores objectAtIndexedSubscript:v3];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = [(NSArray *)self->_scores objectAtIndexedSubscript:v3];
          v9 = [v8 objectAtIndexedSubscript:v7];

          uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@" ٠ " withString:@" "];

          v11 = [v10 stringByReplacingOccurrencesOfString:@" · " withString:@" "];

          [v4 addObject:v11];
          ++v7;
          uint64_t v12 = [(NSArray *)self->_scores objectAtIndexedSubscript:v3];
          unint64_t v13 = [v12 count];
        }
        while (v7 < v13);
      }
      uint64_t v14 = (void *)[v4 copy];
      [v17 addObject:v14];

      ++v3;
    }
    while (v3 < [(NSArray *)self->_scores count]);
  }
  v15 = (NSArray *)[v17 copy];
  scores = self->_scores;
  self->_scores = v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUISportsScoreboardViewModel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDictionary *)self->_dictionaryRepresentation isEqualToDictionary:v4->_dictionaryRepresentation];
  }

  return v5;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (NSString)leagueId
{
  return self->_leagueId;
}

- (NSDictionary)leagueContext
{
  return self->_leagueContext;
}

- (NSArray)scores
{
  return self->_scores;
}

- (BOOL)configureScoreUpdates
{
  return self->_configureScoreUpdates;
}

- (void)setConfigureScoreUpdates:(BOOL)a3
{
  self->_configureScoreUpdates = a3;
}

- (BOOL)isVersus
{
  return self->_isVersus;
}

- (NSDate)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTime, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_leagueContext, 0);
  objc_storeStrong((id *)&self->_leagueId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end