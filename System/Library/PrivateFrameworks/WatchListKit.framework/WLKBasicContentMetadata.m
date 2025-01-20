@interface WLKBasicContentMetadata
+ (Class)_classForContentType:(unint64_t)a3;
+ (unint64_t)contentTypeForString:(id)a3;
- (BOOL)isAppleOriginal;
- (BOOL)isEvod;
- (NSArray)categories;
- (NSArray)genres;
- (NSArray)trailers;
- (NSDictionary)rolesSummary;
- (NSNumber)commonSenseRecommendedAge;
- (NSString)canonicalID;
- (NSString)descriptiveText;
- (NSString)shortTitle;
- (NSString)title;
- (NSURL)tvAppDeeplinkURL;
- (WLKArtworkVariantListing)images;
- (WLKBasicContentMetadata)init;
- (WLKBasicContentMetadata)initWithDictionary:(id)a3;
- (WLKContentRating)contentRating;
- (WLKVideo)backgroundVideo;
- (id)description;
- (unint64_t)contentType;
@end

@implementation WLKBasicContentMetadata

+ (unint64_t)contentTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Movie"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"Show"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqual:@"Season"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqual:@"Episode"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqual:@"SportingEvent"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (Class)_classForContentType:(unint64_t)a3
{
  if (a3 - 1 > 4)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (WLKBasicContentMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "wlk_stringForKey:", @"type");
    uint64_t v7 = [(id)objc_opt_class() contentTypeForString:v6];
    uint64_t v8 = [(id)objc_opt_class() _classForContentType:v7];
    if (v8 && (v9 = (objc_class *)v8, (objc_opt_isKindOfClass() & 1) == 0))
    {
      v52 = (WLKBasicContentMetadata *)[[v9 alloc] initWithDictionary:v5];
    }
    else
    {
      v55.receiver = self;
      v55.super_class = (Class)WLKBasicContentMetadata;
      v10 = [(WLKBasicContentMetadata *)&v55 init];
      v11 = v10;
      if (v10)
      {
        v10->_contentType = v7;
        uint64_t v12 = [v6 copy];
        contentTypeString = v11->_contentTypeString;
        v11->_contentTypeString = (NSString *)v12;

        v14 = objc_msgSend(v5, "wlk_stringForKey:", @"id");
        uint64_t v15 = [v14 copy];
        canonicalID = v11->_canonicalID;
        v11->_canonicalID = (NSString *)v15;

        v17 = objc_msgSend(v5, "wlk_stringForKey:", @"title");
        uint64_t v18 = [v17 copy];
        title = v11->_title;
        v11->_title = (NSString *)v18;

        v20 = objc_msgSend(v5, "wlk_stringForKey:", @"shortTitle");
        uint64_t v21 = [v20 copy];
        shortTitle = v11->_shortTitle;
        v11->_shortTitle = (NSString *)v21;

        v23 = objc_msgSend(v5, "wlk_stringForKey:", @"description");
        uint64_t v24 = [v23 copy];
        descriptiveText = v11->_descriptiveText;
        v11->_descriptiveText = (NSString *)v24;

        uint64_t v26 = objc_msgSend(v5, "wlk_artworkVariantListingForKey:", @"images");
        images = v11->_images;
        v11->_images = (WLKArtworkVariantListing *)v26;

        uint64_t v28 = objc_msgSend(v5, "wlk_numberForKey:", @"commonSenseRecommendedAge");
        commonSenseRecommendedAge = v11->_commonSenseRecommendedAge;
        v11->_commonSenseRecommendedAge = (NSNumber *)v28;

        uint64_t v30 = objc_msgSend(v5, "wlk_arrayForKey:", @"categories");
        categories = v11->_categories;
        v11->_categories = (NSArray *)v30;

        v11->_isEvod = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", @"isEVOD", 0);
        v11->_appleOriginal = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", @"isAppleOriginal", 0);
        v32 = objc_msgSend(v5, "wlk_arrayForKey:", @"genres");
        v33 = +[WLKGenre genresWithDictionaries:v32];
        uint64_t v34 = [v33 copy];
        genres = v11->_genres;
        v11->_genres = (NSArray *)v34;

        v36 = objc_msgSend(v5, "wlk_stringForKey:", @"shareUrl");
        if (v36
          || (objc_msgSend(v5, "wlk_stringForKey:", @"url"),
              (v36 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v37 = [MEMORY[0x1E4F1CB10] URLWithString:v36];
          tvAppDeeplinkURL = v11->_tvAppDeeplinkURL;
          v11->_tvAppDeeplinkURL = (NSURL *)v37;
        }
        v39 = [WLKVideo alloc];
        v40 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"backgroundVideo");
        uint64_t v41 = [(WLKVideo *)v39 initWithDictionary:v40];
        backgroundVideo = v11->_backgroundVideo;
        v11->_backgroundVideo = (WLKVideo *)v41;

        v43 = objc_msgSend(v5, "wlk_arrayForKey:", @"trailers");
        v44 = +[WLKVideo videosWithDictionaries:v43];
        uint64_t v45 = [v44 copy];
        trailers = v11->_trailers;
        v11->_trailers = (NSArray *)v45;

        uint64_t v47 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"rolesSummary");
        rolesSummary = v11->_rolesSummary;
        v11->_rolesSummary = (NSDictionary *)v47;

        v49 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"rating");
        if (v49)
        {
          v50 = [[WLKContentRating alloc] initWithDictionary:v49];
          contentRating = v11->_contentRating;
          v11->_contentRating = v50;
        }
      }
      v52 = v11;
      self = v52;
    }
    v53 = v52;
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WLKBasicContentMetadata;
  uint64_t v4 = [(WLKBasicContentMetadata *)&v9 description];
  v5 = (void *)v4;
  title = self->_title;
  if (!title) {
    title = self->_shortTitle;
  }
  uint64_t v7 = [v3 stringWithFormat:@"%@ contentType:%@ canonical:%@ title:%@", v4, self->_contentTypeString, self->_canonicalID, title];

  return v7;
}

- (WLKBasicContentMetadata)init
{
  return [(WLKBasicContentMetadata *)self initWithDictionary:0];
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSURL)tvAppDeeplinkURL
{
  return self->_tvAppDeeplinkURL;
}

- (BOOL)isEvod
{
  return self->_isEvod;
}

- (BOOL)isAppleOriginal
{
  return self->_appleOriginal;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (NSString)descriptiveText
{
  return self->_descriptiveText;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (NSNumber)commonSenseRecommendedAge
{
  return self->_commonSenseRecommendedAge;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSArray)genres
{
  return self->_genres;
}

- (WLKVideo)backgroundVideo
{
  return self->_backgroundVideo;
}

- (NSArray)trailers
{
  return self->_trailers;
}

- (NSDictionary)rolesSummary
{
  return self->_rolesSummary;
}

- (WLKContentRating)contentRating
{
  return self->_contentRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_rolesSummary, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_backgroundVideo, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_commonSenseRecommendedAge, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tvAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_contentTypeString, 0);
}

@end