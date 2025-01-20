@interface FCArticleMetadata
- (BOOL)isPaid;
- (BOOL)isTreatedAsNew;
- (FCArticleMetadata)initWithDictionary:(id)a3;
- (FCArticleMetadata)initWithDictionary:(id)a3 identifier:(id)a4;
- (NSArray)sportsEventIDs;
- (NSDate)displayDate;
- (NSDate)publishDate;
- (NSDictionary)dictionary;
- (NSString)articleID;
- (NSString)contentURL;
- (NSString)identifier;
- (NSString)rapidUpdate;
- (NSString)shortExcerpt;
- (NSString)sourceChannelTagID;
- (NSString)storyType;
- (NSString)thumbnail;
- (NSString)thumbnailAccentColor;
- (NSString)thumbnailBackgroundColor;
- (NSString)thumbnailHQ;
- (NSString)thumbnailMedium;
- (NSString)thumbnailPrimaryColor;
- (NSString)thumbnailTextColor;
- (NSString)thumbnailUltraHQ;
- (NSString)title;
- (NSString)videoType;
- (NSString)videoURL;
- (NSURL)routeURL;
- (double)conditionalScore;
- (id)publisherID;
- (int64_t)contentType;
- (int64_t)thumbnailFocalFrame;
- (int64_t)thumbnailHQMetadata;
- (int64_t)thumbnailMediumMetadata;
- (int64_t)thumbnailMetadata;
- (int64_t)thumbnailUltraHQMetadata;
- (void)setDictionary:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation FCArticleMetadata

- (FCArticleMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCArticleMetadata;
  v5 = [(FCArticleMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = [(FCArticleMetadata *)v5 dictionary];
    v9 = [v8 objectForKeyedSubscript:@"displayDate"];

    if (v9)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateFromStringWithISO8601Format:", v9);
      displayDate = v5->_displayDate;
      v5->_displayDate = (NSDate *)v10;
    }
    else
    {
      displayDate = v5->_displayDate;
      v5->_displayDate = 0;
    }
  }
  return v5;
}

- (FCArticleMetadata)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v7 = a4;
  v8 = [(FCArticleMetadata *)self initWithDictionary:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_identifier, a4);
  }

  return v9;
}

- (NSString)title
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"title"];

  return (NSString *)v3;
}

- (NSString)storyType
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"storyType"];

  return (NSString *)v3;
}

- (NSString)articleID
{
  v3 = [(FCArticleMetadata *)self dictionary];
  id v4 = [v3 objectForKeyedSubscript:@"id"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(FCArticleMetadata *)self identifier];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)shortExcerpt
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"shortExcerpt"];

  return (NSString *)v3;
}

- (NSString)thumbnailTextColor
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailTextColor"];

  return (NSString *)v3;
}

- (NSString)thumbnailBackgroundColor
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailBackgroundColor"];

  return (NSString *)v3;
}

- (NSString)sourceChannelTagID
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"sourceChannelTagID"];

  return (NSString *)v3;
}

- (NSString)thumbnailAccentColor
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailAccentColor"];

  return (NSString *)v3;
}

- (NSString)thumbnailPrimaryColor
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailPrimaryColor"];

  return (NSString *)v3;
}

- (BOOL)isPaid
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"isPaid"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)thumbnail
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnail"];

  return (NSString *)v3;
}

- (int64_t)thumbnailMetadata
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailMetadata"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (NSString)thumbnailMedium
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailMedium"];

  return (NSString *)v3;
}

- (int64_t)thumbnailMediumMetadata
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailMediumMetadata"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (NSString)thumbnailHQ
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailHQ"];

  return (NSString *)v3;
}

- (int64_t)thumbnailHQMetadata
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailHQMetadata"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (NSString)thumbnailUltraHQ
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailUltraHQ"];

  return (NSString *)v3;
}

- (int64_t)thumbnailUltraHQMetadata
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailUltraHQMetadata"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int64_t)thumbnailFocalFrame
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"thumbnailFocalFrame"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (NSDate)publishDate
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"publishDate"];
  uint64_t v4 = [v3 longLongValue];

  v5 = (void *)MEMORY[0x1E4F1C9C8];
  return (NSDate *)objc_msgSend(v5, "fc_dateWithMillisecondTimeIntervalSince1970:", v4);
}

- (BOOL)isTreatedAsNew
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"isTreatedAsNew"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)publisherID
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"sourceChannelTagID"];

  return v3;
}

- (int64_t)contentType
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"contentType"];
  int64_t v4 = FCArticleContentTypeFromString(v3);

  return v4;
}

- (NSString)contentURL
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"contentURL"];

  return (NSString *)v3;
}

- (NSString)videoURL
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"videoURL"];

  return (NSString *)v3;
}

- (NSString)videoType
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"videoType"];

  return (NSString *)v3;
}

- (NSArray)sportsEventIDs
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"sportsEventIDs"];

  return (NSArray *)v3;
}

- (NSURL)routeURL
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"routeURL"];

  if ([v3 length])
  {
    int64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSURL *)v4;
}

- (double)conditionalScore
{
  v2 = [(FCArticleMetadata *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"conditionalScore"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSString)rapidUpdate
{
  return self->_rapidUpdate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rapidUpdate, 0);
}

@end