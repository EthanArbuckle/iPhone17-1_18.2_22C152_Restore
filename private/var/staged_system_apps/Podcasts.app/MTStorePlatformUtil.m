@interface MTStorePlatformUtil
+ (BOOL)isAValue:(id)a3;
+ (BOOL)isExplicitForStorePlatformDictionary:(id)a3;
+ (id)_genreNameForStoreItemDictionary:(id)a3;
+ (id)_offerNameForOfferFlavor:(id)a3;
+ (id)_storeDownloadArtworkArrayForStoreItemDictionary:(id)a3;
+ (id)_storeDownloadOffersForStoreItemDictionary:(id)a3;
+ (id)_storeOfferDownloadDictionaryForStoreOfferItemDictionary:(id)a3;
+ (id)_unmodifiedTitleForStoreItemDictionary:(id)a3;
+ (id)artworkDictionary:(id)a3 closestToSize:(double)a4;
+ (id)dateFromFormattedString:(id)a3;
+ (id)encodedQueryStringFromDictionary:(id)a3;
+ (id)formatDate:(id)a3;
+ (id)latestEpisodeDictionaryFromPodcastDictionary:(id)a3;
+ (id)pubDateFromStoreMediaDictionary:(id)a3;
+ (id)storeDownloadDictionaryFromStorePlatformDictionary:(id)a3;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 isNotSubscribeable:(BOOL)a5;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5 isNotSubscribeable:(BOOL)a6;
+ (id)stringFromDictionary:(id)a3 forKey:(id)a4;
@end

@implementation MTStorePlatformUtil

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4
{
  return _[a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:0 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 isNotSubscribeable:(BOOL)a5
{
  return [a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:0 restricted:a5 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5
{
  return [a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:a5 restricted:0 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5 isNotSubscribeable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [a1 isExplicitForStorePlatformDictionary:v10];
  if (!v11
    || (+[PFRestrictionsController isExplicitContentAllowed] & 1) != 0)
  {
    BOOL v60 = v6;
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    v13 = [v10 objectForKeyedSubscript:@"offers"];
    v14 = [v13 firstObject];
    v15 = [v14 objectForKeyedSubscript:@"download"];

    v16 = [v15 objectForKeyedSubscript:@"url"];
    if (![v16 length])
    {
      id v42 = 0;
LABEL_71:

      goto LABEL_72;
    }
    [v12 setObject:v16 forKeyedSubscript:@"assetURL"];
    uint64_t v17 = [a1 stringFromDictionary:v10 forKey:@"feedUrl"];
    if (v17) {
      [v12 setObject:v17 forKeyedSubscript:kPodcastFeedUrl];
    }
    v69 = (void *)v17;
    uint64_t v18 = [a1 stringFromDictionary:v10 forKey:@"collectionName"];
    if (v18) {
      [v12 setObject:v18 forKeyedSubscript:@"podcastTitle"];
    }
    v71 = v15;
    v74 = (void *)v18;
    uint64_t v19 = [a1 stringFromDictionary:v10 forKey:@"name"];
    if (v19) {
      [v12 setObject:v19 forKeyedSubscript:@"episodeTitle"];
    }
    v73 = (void *)v19;
    uint64_t v20 = [v10 objectForKeyedSubscript:@"description"];
    v21 = [a1 stringFromDictionary:v20 forKey:@"standard"];
    if (![v21 length])
    {
      uint64_t v22 = [a1 stringFromDictionary:v20 forKey:@"short"];

      v21 = (void *)v22;
    }
    if ([v21 length]) {
      [v12 setObject:v21 forKeyedSubscript:@"episodeDescription"];
    }
    uint64_t v23 = [a1 stringFromDictionary:v10 forKey:@"url"];
    if (v23)
    {
      v24 = +[NSURL URLWithString:v23];
      [v12 setObject:v24 forKeyedSubscript:@"episodeShareUrl"];
    }
    v25 = [v10 objectForKeyedSubscript:@"id"];
    v76 = [v25 stringValue];
    if (v25) {
      [v12 setObject:v25 forKeyedSubscript:@"episodeId"];
    }
    uint64_t v26 = [v10 objectForKeyedSubscript:@"podcastEpisodeGuid"];
    if (v26) {
      [v12 setObject:v26 forKeyedSubscript:@"episodeGuid"];
    }
    v64 = (void *)v26;
    v27 = [v10 objectForKeyedSubscript:@"collectionId"];
    v75 = [v27 stringValue];
    if (v27) {
      [v12 setObject:v27 forKeyedSubscript:@"podcastId"];
    }
    v65 = v25;
    uint64_t v28 = [v10 objectForKeyedSubscript:@"artistName"];
    if (v28) {
      [v12 setObject:v28 forKeyedSubscript:@"artistName"];
    }
    v62 = (void *)v28;
    uint64_t v29 = [v10 objectForKeyedSubscript:@"releaseDate"];
    objc_opt_class();
    v72 = (void *)v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = [a1 formatDate:v29];
      if (v30) {
        [v12 setObject:v30 forKeyedSubscript:kEpisodePubDate];
      }
    }
    v31 = [v10 objectForKeyedSubscript:@"artwork"];
    v66 = (void *)v23;
    v61 = v31;
    if (v31)
    {
      v32 = v31;
      if ([v31 count])
      {
        uint64_t v33 = [a1 artworkDictionary:v32 closestToSize:a4];
        v34 = (void *)v33;
        if (v33)
        {
          uint64_t v77 = v33;
          +[NSArray arrayWithObjects:&v77 count:1];
          v35 = v21;
          v37 = uint64_t v36 = v20;
          [v12 setObject:v37 forKeyedSubscript:@"artworkURL"];

          uint64_t v20 = v36;
          v21 = v35;
        }
      }
    }
    v68 = (void *)v20;
    v38 = +[NSNumber numberWithBool:v11];
    [v12 setObject:v38 forKeyedSubscript:@"explicit"];

    v39 = [v10 objectForKeyedSubscript:@"isNotSubscribeable"];
    v40 = v39;
    v67 = v21;
    if (v39) {
      unint64_t v41 = (unint64_t)[v39 BOOLValue];
    }
    else {
      unint64_t v41 = v60;
    }
    v43 = +[NSNumber numberWithBool:v41];
    [v12 setObject:v43 forKeyedSubscript:@"isNotSubscribeable"];

    v44 = [v10 objectForKeyedSubscript:@"offers"];
    v45 = [v44 firstObject];

    v70 = v16;
    v63 = v27;
    if (!v45)
    {
      CFStringRef v52 = 0;
      v53 = &stru_10056A8A0;
      v54 = v74;
LABEL_56:
      [v12 setObject:v53 forKeyedSubscript:kEpisodeUti];
      v56 = [a1 stringFromDictionary:v10 forKey:@"artistId"];
      id v57 = objc_alloc_init((Class)NSMutableDictionary);
      if ([a1 isAValue:v56]) {
        [v57 setObject:v56 forKeyedSubscript:@"artistId"];
      }
      if ([a1 isAValue:v75]) {
        [v57 setObject:v75 forKeyedSubscript:@"podcastId"];
      }
      if ([a1 isAValue:v54]) {
        [v57 setObject:v54 forKeyedSubscript:@"podcastName"];
      }
      if ([a1 isAValue:@"1"]) {
        [v57 setObject:@"1" forKeyedSubscript:@"podcastType"];
      }
      if ([a1 isAValue:v73]) {
        [v57 setObject:v73 forKeyedSubscript:@"episodeName"];
      }
      if ([a1 isAValue:v76]) {
        [v57 setObject:v76 forKeyedSubscript:@"episodeId"];
      }
      if ([a1 isAValue:v52]) {
        [v57 setObject:v52 forKeyedSubscript:@"episodeKind"];
      }
      [v57 setObject:@"3" forKeyedSubscript:@"v"];
      [v57 setObject:@"ntc" forKeyedSubscript:@"pageLocation"];
      v58 = [a1 encodedQueryStringFromDictionary:v57];
      [v12 setObject:v58 forKeyedSubscript:@"reportParams"];

      id v42 = v12;
      v16 = v70;
      v15 = v71;
      goto LABEL_71;
    }
    v46 = [v45 objectForKeyedSubscript:@"assets"];
    v47 = [v46 firstObject];

    if (!v47)
    {
      CFStringRef v52 = 0;
      v53 = &stru_10056A8A0;
LABEL_55:
      v54 = v74;

      goto LABEL_56;
    }
    v48 = [v47 objectForKeyedSubscript:@"duration"];
    if (v48) {
      [v12 setObject:v48 forKeyedSubscript:@"duration"];
    }
    v49 = [v47 objectForKeyedSubscript:@"flavor"];
    v50 = +[NSNull null];

    if (v49 == v50)
    {
      CFStringRef v52 = 0;
      v53 = &stru_10056A8A0;
LABEL_54:

      goto LABEL_55;
    }
    v51 = [v47 objectForKeyedSubscript:@"flavor"];
    if ([v51 rangeOfString:@"Video"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v51 rangeOfString:@"Audio"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        CFStringRef v52 = 0;
        v53 = &stru_10056A8A0;
LABEL_53:

        goto LABEL_54;
      }
      CFStringRef v52 = @"episode";
      v55 = (id *)&kUTTypeAudio;
    }
    else
    {
      CFStringRef v52 = @"movie";
      v55 = (id *)&kUTTypeVideo;
    }
    v53 = (__CFString *)*v55;
    goto LABEL_53;
  }
  id v42 = 0;
  if (a5) {
    *a5 = 1;
  }
LABEL_72:

  return v42;
}

+ (BOOL)isExplicitForStorePlatformDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"contentRating"];
  if (!v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"contentRatingsBySystem"];
    v4 = [v5 objectForKeyedSubscript:@"riaa"];
  }
  BOOL v6 = [v4 objectForKeyedSubscript:@"rank"];
  BOOL v7 = (uint64_t)[v6 integerValue] > 1;

  return v7;
}

+ (id)latestEpisodeDictionaryFromPodcastDictionary:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [v3 objectForKeyedSubscript:@"childrenIds"];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) stringValue];
      id v10 = [v3 objectForKeyedSubscript:@"children"];
      id v11 = [v10 objectForKeyedSubscript:v9];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v11 = 0;
  }

  return v11;
}

+ (id)artworkDictionary:(id)a3 closestToSize:(double)a4
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    double v10 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = [v12 objectForKey:@"height"];
        [v13 floatValue];
        double v15 = v14;
        if (v15 == a4)
        {
          id v18 = v12;

          goto LABEL_15;
        }
        double v16 = vabdd_f64(v15, a4);
        if (v16 < v10)
        {
          id v17 = v12;

          double v10 = v16;
          id v8 = v17;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }

  id v8 = v8;
  id v18 = v8;
LABEL_15:

  return v18;
}

+ (BOOL)isAValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v5 = isKindOfClass ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

+ (id)stringFromDictionary:(id)a3 forKey:(id)a4
{
  char v5 = [a3 objectForKeyedSubscript:a4];
  if ([a1 isAValue:v5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
LABEL_6:
      id v7 = v6;
      goto LABEL_8;
    }
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v5 stringValue];
      goto LABEL_6;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)encodedQueryStringFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v5 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 stringByAddingPercentEscapesUsingEncoding:1];
        float v14 = (void *)v13;
        if (v9) {
          CFStringRef v15 = @"%@=%@";
        }
        else {
          CFStringRef v15 = @"&%@=%@";
        }
        [v4 appendFormat:v15, v11, v13, v17];

        char v9 = 0;
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      char v9 = 0;
    }
    while (v7);
  }

  return v4;
}

+ (id)formatDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_10060A8C0;
  if (!qword_10060A8C0)
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    id v6 = (void *)qword_10060A8C0;
    qword_10060A8C0 = (uint64_t)v5;

    [(id)qword_10060A8C0 setDateFormat:@"yyyy-MM-dd"];
    id v7 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v8 = (void *)qword_10060A8C8;
    qword_10060A8C8 = (uint64_t)v7;

    [(id)qword_10060A8C8 setDateStyle:2];
    id v4 = (void *)qword_10060A8C0;
  }
  char v9 = [v4 dateFromString:v3];
  double v10 = [(id)qword_10060A8C8 stringFromDate:v9];

  return v10;
}

+ (id)dateFromFormattedString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_10060A8D0;
  if (!qword_10060A8D0)
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    id v6 = (void *)qword_10060A8D0;
    qword_10060A8D0 = (uint64_t)v5;

    [(id)qword_10060A8D0 setDateStyle:2];
    id v4 = (void *)qword_10060A8D0;
  }
  id v7 = [v4 dateFromString:v3];

  return v7;
}

+ (id)pubDateFromStoreMediaDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kEpisodePubDate];
  id v5 = [a1 dateFromFormattedString:v4];

  return v5;
}

+ (id)storeDownloadDictionaryFromStorePlatformDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:@"episode" forKeyedSubscript:@"episode-kind"];
  id v6 = [v4 objectForKeyedSubscript:@"collectionId"];
  [v5 setObject:v6 forKeyedSubscript:@"collection-id"];

  [v5 setObject:@"podcast-episode" forKeyedSubscript:@"type"];
  id v7 = [v4 objectForKeyedSubscript:@"artistName"];
  [v5 setObject:v7 forKeyedSubscript:@"artist-name"];

  uint64_t v8 = [a1 _genreNameForStoreItemDictionary:v4];
  [v5 setObject:v8 forKeyedSubscript:@"genre-name"];

  char v9 = [v4 objectForKeyedSubscript:@"collectionName"];
  [v5 setObject:v9 forKeyedSubscript:@"collection-name"];

  double v10 = [a1 _unmodifiedTitleForStoreItemDictionary:v4];
  [v5 setObject:v10 forKeyedSubscript:@"unmodified-title"];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"id"];
  [v5 setObject:v11 forKeyedSubscript:@"item-id"];

  id v12 = [v4 objectForKeyedSubscript:@"id"];
  [v5 setObject:v12 forKeyedSubscript:@"itemId"];

  uint64_t v13 = [v4 objectForKeyedSubscript:@"url"];
  [v5 setObject:v13 forKeyedSubscript:@"url"];

  float v14 = [v4 objectForKeyedSubscript:@"releaseDate"];
  [v5 setObject:v14 forKeyedSubscript:@"release-date"];

  CFStringRef v15 = [v4 objectForKeyedSubscript:@"podcastEpisodeGuid"];
  [v5 setObject:v15 forKeyedSubscript:@"episode-guid"];

  double v16 = [v4 objectForKeyedSubscript:@"description"];
  long long v17 = [v16 objectForKeyedSubscript:@"standard"];
  [v5 setObject:v17 forKeyedSubscript:@"longDescription"];

  long long v18 = [v4 objectForKeyedSubscript:@"feedUrl"];
  [v5 setObject:v18 forKeyedSubscript:@"podcast-feed-url"];

  [v5 setObject:@"1" forKeyedSubscript:@"podcast-type-dzc"];
  long long v19 = [a1 _storeDownloadOffersForStoreItemDictionary:v4];
  [v5 setObject:v19 forKeyedSubscript:@"store-offers"];

  long long v20 = [a1 _storeDownloadArtworkArrayForStoreItemDictionary:v4];

  [v5 setObject:v20 forKeyedSubscript:@"artwork-urls"];
  id v21 = [v5 copy];

  return v21;
}

+ (id)_storeDownloadArtworkArrayForStoreItemDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"artwork"];
  id v4 = [v3 mt_compactMap:&stru_1005520E8];

  return v4;
}

+ (id)_genreNameForStoreItemDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"genres"];
  id v4 = [v3 firstObject];
  id v5 = [v4 objectForKeyedSubscript:@"name"];

  return v5;
}

+ (id)_unmodifiedTitleForStoreItemDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"rawName"];
  id v5 = [v3 objectForKeyedSubscript:@"name"];

  if ([v4 length]) {
    id v6 = v4;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

+ (id)_storeDownloadOffersForStoreItemDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 objectForKeyedSubscript:@"offers"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [a1 _storeOfferDownloadDictionaryForStoreOfferItemDictionary:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (v11) {
          [v5 addEntriesFromDictionary:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  id v12 = [v5 copy];

  return v12;
}

+ (id)_storeOfferDownloadDictionaryForStoreOfferItemDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  if ([v5 isEqualToString:@"anonymousDownload"])
  {
    id v6 = [v4 objectForKeyedSubscript:@"download"];
    id v7 = [v6 objectForKeyedSubscript:@"url"];

    if (v7)
    {
      long long v16 = [v4 objectForKeyedSubscript:@"assets"];
      id v8 = [v16 firstObject];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"duration"];
      double v10 = +[NSMutableDictionary dictionary];
      [v10 setObject:v7 forKeyedSubscript:@"asset-url"];
      if (v9) {
        [v10 setObject:v9 forKeyedSubscript:@"duration"];
      }
      id v11 = [v10 copy];
      id v12 = [v8 objectForKeyedSubscript:@"flavor"];
      uint64_t v13 = [a1 _offerNameForOfferFlavor:v12];
      long long v17 = v13;
      id v18 = v11;
      long long v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

+ (id)_offerNameForOfferFlavor:(id)a3
{
  id v3 = a3;
  if ([v3 localizedCaseInsensitiveContainsString:@"video"])
  {
    CFStringRef v4 = @"standard-video";
  }
  else
  {
    CFStringRef v4 = @"standard-audio";
    if (([v3 localizedCaseInsensitiveContainsString:@"audio"] & 1) == 0)
    {
      CFStringRef v4 = @"document";
      if (([v3 localizedCaseInsensitiveContainsString:@"booklet"] & 1) == 0
        && ![v3 localizedCaseInsensitiveContainsString:@"document"])
      {
        CFStringRef v4 = @"standard-audio";
      }
    }
  }

  return (id)v4;
}

@end