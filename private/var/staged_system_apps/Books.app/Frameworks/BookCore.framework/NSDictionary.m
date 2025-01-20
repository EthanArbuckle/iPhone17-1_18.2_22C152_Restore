@interface NSDictionary
- (BOOL)hasAssetTypes;
- (BOOL)hasSeriesTypes;
- (BOOL)series_isContainer;
- (NSArray)series_genres;
- (NSNumber)series_isAudiobook;
- (NSNumber)series_isExplicit;
- (NSNumber)series_isSG;
- (NSNumber)series_position;
- (NSString)series_adamId;
- (NSString)series_author;
- (NSString)series_displayLabel;
- (NSString)series_formattedPrice;
- (NSString)series_genre;
- (NSString)series_seriesId;
- (NSString)series_seriesTitle;
- (NSString)series_sortAuthor;
- (NSString)series_sortTitle;
- (NSString)series_title;
@end

@implementation NSDictionary

- (BOOL)series_isContainer
{
  return 0;
}

- (NSString)series_genre
{
  v2 = [(NSDictionary *)self series_genres];
  v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSArray)series_genres
{
  objc_opt_class();
  v3 = [(NSDictionary *)self objectForKeyedSubscript:@"genres"];
  v4 = BUDynamicCast();

  v5 = sub_161BC(v4);

  return (NSArray *)v5;
}

- (NSString)series_adamId
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"id"];
  v3 = BUProtocolCast();

  v4 = [v3 adamIDStringValue];

  return (NSString *)v4;
}

- (NSString)series_sortTitle
{
  return 0;
}

- (NSString)series_sortAuthor
{
  return 0;
}

- (NSString)series_title
{
  objc_opt_class();
  v3 = [(NSDictionary *)self objectForKeyedSubscript:@"name"];
  v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSString)series_author
{
  objc_opt_class();
  v3 = [(NSDictionary *)self objectForKeyedSubscript:@"artistName"];
  v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSNumber)series_isExplicit
{
  BOOL v2 = +[AEUserPublishingProductProfile _isContentRatingExplicitForInfo:self];

  return +[NSNumber numberWithBool:v2];
}

- (NSNumber)series_isAudiobook
{
  [(NSDictionary *)self series_genres];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    v6 = (NSNumber *)&__kCFBooleanTrue;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) isEqualToString:@"Audiobooks"] break; {
      if (v4 == (id)++v7)
      }
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        v6 = (NSNumber *)&__kCFBooleanFalse;
        break;
      }
    }
  }
  else
  {
    v6 = (NSNumber *)&__kCFBooleanFalse;
  }

  return v6;
}

- (NSNumber)series_isSG
{
  return 0;
}

- (NSString)series_formattedPrice
{
  objc_opt_class();
  id v3 = [(NSDictionary *)self objectForKeyedSubscript:@"offers"];
  id v4 = BUDynamicCast();

  if (!v4)
  {
    long long v11 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  uint64_t v5 = [v4 firstObject];
  v6 = BUDynamicCast();

  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = [v6 objectForKeyedSubscript:@"price"];
    v8 = BUDynamicCast();

    if (v8 && ([v8 isEqualToNumber:&off_2E13B0] & 1) != 0)
    {
      long long v9 = IMCommonCoreBundle();
      id v10 = [v9 localizedStringForKey:@"GET" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    }
    else
    {
      objc_opt_class();
      long long v12 = [v6 objectForKeyedSubscript:@"priceFormatted"];
      long long v9 = BUDynamicCast();

      if (!v9)
      {
        long long v11 = 0;
        goto LABEL_12;
      }
      id v10 = v9;
      long long v9 = v10;
    }
    long long v11 = v10;
LABEL_12:

    goto LABEL_13;
  }
  long long v11 = 0;
LABEL_13:

LABEL_14:

  return (NSString *)v11;
}

- (NSString)series_displayLabel
{
  return 0;
}

- (NSNumber)series_position
{
  return 0;
}

- (NSString)series_seriesId
{
  return 0;
}

- (NSString)series_seriesTitle
{
  return 0;
}

- (BOOL)hasSeriesTypes
{
  id v3 = [(NSDictionary *)self objectForKeyedSubscript:BKSeriesManagerSeriesTypeBookSeries[0]];
  id v4 = [(NSDictionary *)self objectForKeyedSubscript:BKSeriesManagerSeriesTypeAudiobookSeries];
  if ([v3 count]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 count] != 0;
  }

  return v5;
}

- (BOOL)hasAssetTypes
{
  id v3 = [(NSDictionary *)self objectForKeyedSubscript:BKSeriesManagerAssetTypeBooks[0]];
  id v4 = [(NSDictionary *)self objectForKeyedSubscript:BKSeriesManagerAssetTypeAudiobooks[0]];
  if ([v3 count]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 count] != 0;
  }

  return v5;
}

@end