@interface BKSeriesInfo
+ (id)seriesInfoWithDictionary:(id)a3;
- (BKSeriesInfo)initWithDictionary:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isContainer;
- (BOOL)isExplicit;
- (NSArray)authorNames;
- (NSArray)children;
- (NSArray)childrenIds;
- (NSArray)genreNames;
- (NSArray)genres;
- (NSArray)narratorNames;
- (NSDate)releaseDate;
- (NSDecimalNumber)sequenceNumber;
- (NSDictionary)infoDictionary;
- (NSNumber)authorCount;
- (NSNumber)coverAspectRatio;
- (NSNumber)hasTooManyAuthors;
- (NSNumber)hasTooManyNarrators;
- (NSNumber)itemTypeRaw;
- (NSNumber)mappedItemTypeRaw;
- (NSNumber)narratorCount;
- (NSNumber)seriesIsOrdered;
- (NSNumber)seriesSortKey;
- (NSString)adamId;
- (NSString)author;
- (NSString)description;
- (NSString)genre;
- (NSString)kind;
- (NSString)mappedItemId;
- (NSString)name;
- (NSString)nameRaw;
- (NSString)sequenceDisplayName;
- (NSString)seriesId;
- (NSString)seriesTitle;
- (NSString)sortAuthor;
- (NSString)tellAFriendMessageContentsUrl;
- (NSString)title;
- (NSURL)shortUrl;
- (NSURL)url;
- (float)popularity;
- (void)setInfoDictionary:(id)a3;
@end

@implementation BKSeriesInfo

- (BKSeriesInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSeriesInfo;
  v5 = [(BKSeriesInfo *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BKSeriesInfo *)v5 setInfoDictionary:v4];
  }

  return v6;
}

+ (id)seriesInfoWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithDictionary:v3];

  return v4;
}

- (NSString)description
{
  id v3 = [(BKSeriesInfo *)self infoDictionary];
  id v4 = +[NSString stringWithFormat:@"<BKSeriesInfo: %p> data: %@", self, v3];

  return (NSString *)v4;
}

- (NSString)adamId
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"adamId"];
}

- (NSNumber)itemTypeRaw
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"itemTypeRaw"];
}

- (NSString)author
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"author"];
}

- (NSString)sortAuthor
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"sortAuthor"];
}

- (BOOL)isExplicit
{
  v2 = [(NSDictionary *)self->_infoDictionary objectForKey:@"isExplicit"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isAudiobook
{
  v2 = [(NSDictionary *)self->_infoDictionary objectForKey:@"isAudiobook"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isContainer
{
  v2 = [(NSDictionary *)self->_infoDictionary objectForKey:@"isContainer"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (float)popularity
{
  v2 = [(NSDictionary *)self->_infoDictionary objectForKey:@"popularity"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (NSNumber)seriesSortKey
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"position"];
}

- (NSDecimalNumber)sequenceNumber
{
  return (NSDecimalNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"sequenceNumber"];
}

- (NSString)sequenceDisplayName
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"sequenceDisplayName"];
}

- (NSNumber)coverAspectRatio
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"coverAspectRatio"];
}

- (NSString)seriesId
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"seriesAdamId"];
}

- (NSString)seriesTitle
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"seriesTitle"];
}

- (NSNumber)seriesIsOrdered
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"seriesIsOrdered"];
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"title"];
}

- (NSNumber)authorCount
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"authorCount"];
}

- (NSArray)authorNames
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"authorNames"];
}

- (NSNumber)hasTooManyAuthors
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"hasTooManyAuthors"];
}

- (NSNumber)narratorCount
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"narratorCount"];
}

- (NSArray)narratorNames
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"narratorNames"];
}

- (NSNumber)hasTooManyNarrators
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"hasTooManyNarrators"];
}

- (NSArray)children
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"children"];
}

- (NSArray)childrenIds
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"childrenIds"];
}

- (NSArray)genres
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"genres"];
}

- (NSArray)genreNames
{
  return (NSArray *)[(NSDictionary *)self->_infoDictionary objectForKey:@"genreNames"];
}

- (NSString)kind
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"kind"];
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"name"];
}

- (NSString)nameRaw
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"nameRaw"];
}

- (NSDate)releaseDate
{
  return (NSDate *)[(NSDictionary *)self->_infoDictionary objectForKey:@"releaseDate"];
}

- (NSURL)shortUrl
{
  return (NSURL *)[(NSDictionary *)self->_infoDictionary objectForKey:@"shortUrl"];
}

- (NSString)tellAFriendMessageContentsUrl
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"tellAFriendMessageContentsUrl"];
}

- (NSString)genre
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"genre"];
}

- (NSURL)url
{
  return (NSURL *)[(NSDictionary *)self->_infoDictionary objectForKey:@"url"];
}

- (NSString)mappedItemId
{
  return (NSString *)[(NSDictionary *)self->_infoDictionary objectForKey:@"mappedItemId"];
}

- (NSNumber)mappedItemTypeRaw
{
  return (NSNumber *)[(NSDictionary *)self->_infoDictionary objectForKey:@"mappedItemTypeRaw"];
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInfoDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end