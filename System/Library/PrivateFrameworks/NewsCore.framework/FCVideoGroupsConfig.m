@interface FCVideoGroupsConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)moreFromPublisherBarEnabled;
- (BOOL)playsMutedByDefault;
- (FCVideoGroupsConfig)initWithCoder:(id)a3;
- (FCVideoGroupsConfig)initWithConfigDictionary:(id)a3;
- (FCVideoGroupsConfig)initWithVideoGroupsConfig:(id)a3;
- (NSDictionary)configDictionary;
- (NTPBVideoGroupsConfig)pbVideoGroupsConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)moreFromPublisherBarTime;
- (int64_t)moreVideosGroupMaxNumberOfVideos;
- (int64_t)moreVideosGroupMinNumberOfVideos;
- (int64_t)nowPlayingBarTime;
- (int64_t)upNextBarTime;
- (unint64_t)moreVideosGroupFilterOption;
- (unint64_t)moreVideosGroupSortOption;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigDictionary:(id)a3;
- (void)setMoreVideosGroupFilterOption:(unint64_t)a3;
- (void)setMoreVideosGroupSortOption:(unint64_t)a3;
- (void)setPbVideoGroupsConfig:(id)a3;
@end

@implementation FCVideoGroupsConfig

- (FCVideoGroupsConfig)initWithVideoGroupsConfig:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCVideoGroupsConfig;
  v5 = [(FCVideoGroupsConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    pbVideoGroupsConfig = v5->_pbVideoGroupsConfig;
    v5->_pbVideoGroupsConfig = (NTPBVideoGroupsConfig *)v6;
  }
  return v5;
}

- (FCVideoGroupsConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCVideoGroupsConfig;
  v5 = [(FCVideoGroupsConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)playsMutedByDefault
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    char v5 = [v4 playsMutedByDefault];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    char v5 = FCAppConfigurationBoolValue(v4, @"playsMutedByDefault", 0);
  }
  BOOL v6 = v5;

  return v6;
}

- (int64_t)nowPlayingBarTime
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    uint64_t v5 = [v4 nowPlayingBarTime];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"nowPlayingBarTime", 2);
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)upNextBarTime
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    uint64_t v5 = [v4 upNextBarTime];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"upNextBarTime", 4);
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)moreFromPublisherBarTime
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    uint64_t v5 = [v4 moreFromPublisherBarTime];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"moreFromPublisherBarTime", 2);
  }
  int64_t v6 = v5;

  return v6;
}

- (BOOL)moreFromPublisherBarEnabled
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    char v5 = [v4 moreFromPublisherBarEnabled];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    char v5 = FCAppConfigurationBoolValue(v4, @"moreFromPublisherBarEnabled", 1);
  }
  BOOL v6 = v5;

  return v6;
}

- (unint64_t)moreVideosGroupSortOption
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    int v5 = [v4 moreVideosGroupSortOption];
    if (v5 == 2) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = v5 == 1;
    }
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    v7 = FCAppConfigurationStringValue(v4, @"moreVideosGroupSortOption", 0);
    unint64_t v6 = FCSortOptionForStringSortOption(v7);
  }
  return v6;
}

- (unint64_t)moreVideosGroupFilterOption
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    unsigned int v5 = [v4 moreVideosGroupFilterOption] != 0;
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    unint64_t v6 = FCAppConfigurationStringValue(v4, @"moreVideosGroupFilterOption", 0);
    unsigned int v5 = [v6 isEqualToString:@"VideoGroupFilterOptionWatched"];
  }
  return v5;
}

- (int64_t)moreVideosGroupMinNumberOfVideos
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    uint64_t v5 = [v4 moreVideosGroupMinNumberOfVideos];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"moreVideosGroupMinNumberOfVideos", 6);
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)moreVideosGroupMaxNumberOfVideos
{
  v3 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];

  if (v3)
  {
    id v4 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
    uint64_t v5 = [v4 moreVideosGroupMaxNumberOfVideos];
  }
  else
  {
    id v4 = [(FCVideoGroupsConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"moreVideosGroupMaxNumberOfVideos", 20);
  }
  int64_t v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(FCVideoGroupsConfig);
  uint64_t v5 = [(FCVideoGroupsConfig *)self configDictionary];
  [(FCVideoGroupsConfig *)v4 setConfigDictionary:v5];

  int64_t v6 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
  [(FCVideoGroupsConfig *)v4 setPbVideoGroupsConfig:v6];

  return v4;
}

- (FCVideoGroupsConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCVideoGroupsConfig;
  uint64_t v5 = [(FCVideoGroupsConfig *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pbVideoGroupsConfig"];
    pbVideoGroupsConfig = v5->_pbVideoGroupsConfig;
    v5->_pbVideoGroupsConfig = (NTPBVideoGroupsConfig *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configDictionary"];
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCVideoGroupsConfig *)self pbVideoGroupsConfig];
  [v4 encodeObject:v5 forKey:@"pbVideoGroupsConfig"];

  id v6 = [(FCVideoGroupsConfig *)self configDictionary];
  [v4 encodeObject:v6 forKey:@"configDictionary"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMoreVideosGroupSortOption:(unint64_t)a3
{
  self->_moreVideosGroupSortOption = a3;
}

- (void)setMoreVideosGroupFilterOption:(unint64_t)a3
{
  self->_moreVideosGroupFilterOption = a3;
}

- (NTPBVideoGroupsConfig)pbVideoGroupsConfig
{
  return self->_pbVideoGroupsConfig;
}

- (void)setPbVideoGroupsConfig:(id)a3
{
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_pbVideoGroupsConfig, 0);
}

@end