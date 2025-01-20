@interface FCPeopleAlsoReadConfiguration
- (FCPeopleAlsoReadConfiguration)init;
- (FCPeopleAlsoReadConfiguration)initWithDictionary:(id)a3;
- (NSString)candidateArticleListSuffix;
- (id)candidateArticleListIDForSeedArticleID:(id)a3 storeFrontID:(id)a4;
- (int64_t)candidateArticleListMaxCachedAgeSeconds;
- (int64_t)candidateMaxAgeSeconds;
- (int64_t)seedMaxAgeSeconds;
- (int64_t)seedMaxCount;
- (int64_t)seedMaxIntervalSinceLastReadSeconds;
@end

@implementation FCPeopleAlsoReadConfiguration

- (FCPeopleAlsoReadConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCPeopleAlsoReadConfiguration;
  v5 = [(FCPeopleAlsoReadConfiguration *)&v10 init];
  if (v5)
  {
    v5->_seedMaxCount = FCAppConfigurationIntegerValue(v4, @"seedMaxCount", 0);
    v5->_seedMaxAgeSeconds = FCAppConfigurationIntegerValue(v4, @"seedMaxAgeSeconds", 31536000);
    v5->_seedMaxIntervalSinceLastReadSeconds = FCAppConfigurationIntegerValue(v4, @"seedMaxIntervalSinceLastReadSeconds", 1209600);
    uint64_t v6 = [v4 objectForKeyedSubscript:@"candidateArticleListSuffix"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"base";
    }
    objc_storeStrong((id *)&v5->_candidateArticleListSuffix, v8);

    v5->_candidateArticleListMaxCachedAgeSeconds = FCAppConfigurationIntegerValue(v4, @"candidateArticleListMaxCachedAgeSeconds", 7200);
    v5->_candidateMaxAgeSeconds = FCAppConfigurationIntegerValue(v4, @"candidateMaxAgeSeconds", 1209600);
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (FCPeopleAlsoReadConfiguration)init
{
  return [(FCPeopleAlsoReadConfiguration *)self initWithDictionary:MEMORY[0x1E4F1CC08]];
}

- (id)candidateArticleListIDForSeedArticleID:(id)a3 storeFrontID:(id)a4
{
  uint64_t v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [(FCPeopleAlsoReadConfiguration *)self candidateArticleListSuffix];
  objc_super v10 = [v6 stringWithFormat:@"%@-%@-%@-%@", @"LX", v8, v7, v9];

  return v10;
}

- (int64_t)seedMaxCount
{
  return self->_seedMaxCount;
}

- (int64_t)seedMaxAgeSeconds
{
  return self->_seedMaxAgeSeconds;
}

- (int64_t)seedMaxIntervalSinceLastReadSeconds
{
  return self->_seedMaxIntervalSinceLastReadSeconds;
}

- (NSString)candidateArticleListSuffix
{
  return self->_candidateArticleListSuffix;
}

- (int64_t)candidateArticleListMaxCachedAgeSeconds
{
  return self->_candidateArticleListMaxCachedAgeSeconds;
}

- (int64_t)candidateMaxAgeSeconds
{
  return self->_candidateMaxAgeSeconds;
}

@end