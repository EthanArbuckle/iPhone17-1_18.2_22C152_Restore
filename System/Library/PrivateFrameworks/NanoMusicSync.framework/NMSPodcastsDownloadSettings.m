@interface NMSPodcastsDownloadSettings
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NMSPodcastsDownloadSettings)init;
- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3;
- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 dictionary:(id)a4;
- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettings:(id)a4;
- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettingsDictionary:(id)a4;
- (NMSPodcastsDownloadSettings)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)numberOfEpisodes;
- (void)setNumberOfEpisodes:(int64_t)a3;
@end

@implementation NMSPodcastsDownloadSettings

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3
{
  return [(NMSPodcastsDownloadSettings *)self initWithCollectionType:a3 dictionary:MEMORY[0x263EFFA78]];
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 dictionary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMSPodcastsDownloadSettings;
  v7 = [(NMSPodcastsDownloadSettings *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_collectionType = a3;
    uint64_t v9 = [v6 mutableCopy];
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSMutableDictionary *)v9;
  }
  return v8;
}

- (int64_t)numberOfEpisodes
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    unint64_t collectionType = self->_collectionType;
    if (collectionType < 4) {
      return qword_222950508[collectionType];
    }
  }
  id v6 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:@"NumberOfEpisodes"];
  v7 = v6;
  if (v6 || (unint64_t v8 = self->_collectionType, v8 >= 4)) {
    int64_t v5 = [v6 integerValue];
  }
  else {
    int64_t v5 = qword_222950528[v8];
  }

  return v5;
}

- (void)setNumberOfEpisodes:(int64_t)a3
{
  if (!self->_dictionary)
  {
    int64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    dictionary = self->_dictionary;
    self->_dictionary = v5;
  }
  id v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_dictionary setObject:v7 forKeyedSubscript:@"NumberOfEpisodes"];
}

- (BOOL)isEnabled
{
  return [(NMSPodcastsDownloadSettings *)self numberOfEpisodes] != 0;
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary copy];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSPodcastsDownloadSettings *)a3;
  int64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (self->_collectionType != v6->_collectionType
      || (dictionary = self->_dictionary, (dictionary != 0) == (v6->_dictionary == 0)))
    {
      char v8 = 0;
    }
    else
    {
      char v8 = -[NSMutableDictionary isEqualToDictionary:](dictionary, "isEqualToDictionary:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  if ([(NMSPodcastsDownloadSettings *)self isEnabled])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld episodes", -[NMSPodcastsDownloadSettings numberOfEpisodes](self, "numberOfEpisodes"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"Disabled";
  }
  v4 = [NSString stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = (void *)[(NSMutableDictionary *)self->_dictionary copy];
  id v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettingsDictionary:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"NumberOfEpisodes"];
    if (!v8
      || (uint64_t v9 = (void *)v8,
          [v7 objectForKeyedSubscript:@"NumberOfEpisodes"],
          v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 integerValue],
          v10,
          v9,
          v11 == -1))
    {
      id v12 = (id)MEMORY[0x263EFFA78];
    }
    else
    {
      id v12 = v7;
    }
  }
  else
  {
    id v12 = 0;
  }
  v13 = [(NMSPodcastsDownloadSettings *)self initWithCollectionType:a3 dictionary:v12];

  return v13;
}

- (NMSPodcastsDownloadSettings)initWithDictionary:(id)a3
{
  return [(NMSPodcastsDownloadSettings *)self initWithCollectionType:3 dictionary:a3];
}

- (NMSPodcastsDownloadSettings)init
{
  return [(NMSPodcastsDownloadSettings *)self initWithDictionary:MEMORY[0x263EFFA78]];
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettings:(id)a4
{
  id v6 = a4;
  id v7 = [(NMSPodcastsDownloadSettings *)self initWithCollectionType:a3];
  if (v7 && [v6 numberOfEpisodes] != -1) {
    -[NMSPodcastsDownloadSettings setNumberOfEpisodes:](v7, "setNumberOfEpisodes:", [v6 numberOfEpisodes]);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end