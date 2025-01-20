@interface MOEventBundleMetaDataUtility
+ (BOOL)isAddressForPlace:(id)a3;
+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5;
+ (id)buildActivityMetaDataForEventBundle:(id)a3;
+ (id)buildClusteringMetaDataForEventBundle:(id)a3;
+ (id)buildEvergreenMetaDataForEventBundle:(id)a3;
+ (id)buildMediaPlayMetaDataForEventBundle:(id)a3;
+ (id)buildMetaDataForEventBundle:(id)a3;
+ (id)buildOutingMetaDataForEventBundle:(id)a3;
+ (id)buildPhotoMemoryMetaDataForEventBundle:(id)a3;
+ (id)buildSharedContentMetaDataForEventBundle:(id)a3;
+ (id)buildSignificantContactMetaDataForEventBundle:(id)a3;
+ (id)buildStateOfMindMetaDataForEventBundle:(id)a3;
+ (id)buildTimeAtHomeMetaDataForEventBundle:(id)a3;
+ (id)buildTimeContextMetaDataForEventBundle:(id)a3;
+ (id)buildTimeContextTransitMetaDataForEventBundle:(id)a3;
+ (id)buildTrendMetaDataForEventBundle:(id)a3;
+ (id)buildTripMetaDataForEventBundle:(id)a3;
+ (id)keywordFromString:(id)a3;
+ (id)mediaKeywordWithType:(unint64_t)a3;
+ (void)appendDefaultMetaData:(id)a3;
+ (void)defineClassCollections;
+ (void)setActivityNameFromActionName:(id)a3 metaData:(id)a4 keyword:(id)a5 keywordType:(id)a6;
+ (void)setMetaDataForAction:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForActions:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForActivityAction:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForActivityConcurrentMediaAction:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForActivityPlace:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForDiningAction:(id)a3 metaData:(id)a4 startDate:(id)a5 endDate:(id)a6;
+ (void)setMetaDataForMediaAction:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForPersons:(id)a3 suggestionId:(id)a4 metaData:(id)a5;
+ (void)setMetaDataForPhotos:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForPlace:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForPlaces:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForTime:(id)a3 metaData:(id)a4;
+ (void)setMetaDataForTime:(id)a3 startDate:(id)a4 endDate:(id)a5 metaData:(id)a6;
+ (void)setMetaDataWithKeyword:(id)a3 extendedKeyword:(id)a4 value:(id)a5 metaData:(id)a6;
@end

@implementation MOEventBundleMetaDataUtility

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken != -1) {
    dispatch_once(&defineClassCollections_onceToken, &__block_literal_global);
  }
}

void __54__MOEventBundleMetaDataUtility_defineClassCollections__block_invoke(id a1)
{
  v1 = (void *)noSavoringPromptLabels;
  noSavoringPromptLabels = (uint64_t)&off_1002F8C60;

  v2 = (void *)noReappraisalPromptLabels;
  noReappraisalPromptLabels = (uint64_t)&off_1002F8C78;
}

+ (id)buildMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  v4 = 0;
  switch((unint64_t)[v3 interfaceType])
  {
    case 1uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildActivityMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 2uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildOutingMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 4uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildSignificantContactMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 5uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildMediaPlayMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 6uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildSharedContentMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 7uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildTimeAtHomeMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 9uLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildTrendMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 0xAuLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildPhotoMemoryMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 0xBuLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 0xCuLL:
      if ([v3 bundleSubType] == (id)205 || objc_msgSend(v3, "bundleSubType") == (id)206)
      {
        uint64_t v5 = +[MOEventBundleMetaDataUtility buildTimeContextTransitMetaDataForEventBundle:v3];
      }
      else
      {
        uint64_t v5 = +[MOEventBundleMetaDataUtility buildTimeContextMetaDataForEventBundle:v3];
      }
      goto LABEL_18;
    case 0xDuLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildTripMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 0xEuLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildStateOfMindMetaDataForEventBundle:v3];
      goto LABEL_18;
    case 0xFuLL:
      uint64_t v5 = +[MOEventBundleMetaDataUtility buildClusteringMetaDataForEventBundle:v3];
LABEL_18:
      v4 = (void *)v5;
      if (v5) {
        +[MOEventBundleMetaDataUtility appendDefaultMetaData:v5];
      }
      break;
    default:
      break;
  }

  return v4;
}

+ (void)appendDefaultMetaData:(id)a3
{
  id v4 = a3;
  id v3 = +[MOEventBundleLabelLocalizer preferredLocalization];
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:@"language"];
  }
}

+ (id)buildActivityMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 action];

  if (v5)
  {
    v6 = [v3 action];
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:v6 metaData:v4];
  }
  v7 = [v3 concurrentMediaAction];

  if (v7)
  {
    v8 = [v3 concurrentMediaAction];
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:v8 metaData:v4];
  }
  uint64_t v9 = [v3 places];
  if (v9)
  {
    v10 = (void *)v9;
    if ([v3 bundleSubType] == (id)204 || objc_msgSend(v3, "bundleSubType") == (id)207)
    {

LABEL_9:
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v11 = [v3 places];
      id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v17 = [v16 placeName];

            if (v17) {
              +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:v16 metaData:v4];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v13);
      }

      goto LABEL_22;
    }
    id v18 = [v3 bundleSubType];

    if (v18 == (id)208) {
      goto LABEL_9;
    }
  }
  v19 = [v3 place];

  if (v19)
  {
    v20 = [v3 place];
    +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:v20 metaData:v4];
  }
LABEL_22:
  v21 = [v3 time];

  if (v21)
  {
    v22 = [v3 time];
    v23 = [v3 startDate];
    v24 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v22 startDate:v23 endDate:v24 metaData:v4];
  }
  v25 = [v3 persons];

  if (v25)
  {
    v26 = [v3 persons];
    v27 = [v3 suggestionID];
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:v26 suggestionId:v27 metaData:v4];
  }

  return v4;
}

+ (id)buildOutingMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 actions];
  if (v5)
  {
    v6 = [v3 actions];
    id v7 = [v6 count];

    if (v7)
    {
      v8 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"actionType", 2];
      uint64_t v9 = [v3 actions];
      v10 = [v9 filteredArrayUsingPredicate:v8];

      if ([v10 count])
      {
        v11 = [v10 firstObject];
        uint64_t v5 = [v11 actionName];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  uint64_t v12 = [v3 action];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [v3 action];
    if ([v14 actionType] == (id)9)
    {
    }
    else
    {
      v15 = [v3 action];
      id v16 = [v15 actionType];

      if (v16 != (id)10) {
        goto LABEL_13;
      }
    }
    v17 = [v3 action];
    uint64_t v18 = [v17 actionName];

    uint64_t v5 = (void *)v18;
  }
LABEL_13:
  if (v5)
  {
    v19 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v5];
    [v4 setObject:v19 forKeyedSubscript:@"action"];

    v20 = [(id)objc_opt_class() keywordFromString:v5];
    [v4 setObject:v20 forKeyedSubscript:@"action_type"];
  }
  uint64_t v21 = [v3 action];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [v3 action];
    id v24 = [v23 actionType];

    if (v24 == (id)11) {
      [v4 setObject:@"flight" forKeyedSubscript:@"flight"];
    }
  }
  v25 = [v3 action];
  v26 = [v3 startDate];
  v27 = [v3 endDate];
  +[MOEventBundleMetaDataUtility setMetaDataForDiningAction:v25 metaData:v4 startDate:v26 endDate:v27];

  v28 = [v3 place];
  +[MOEventBundleMetaDataUtility setMetaDataForPlace:v28 metaData:v4];

  long long v29 = [v3 persons];
  long long v30 = [v3 suggestionID];
  +[MOEventBundleMetaDataUtility setMetaDataForPersons:v29 suggestionId:v30 metaData:v4];

  long long v31 = [v3 time];
  long long v32 = [v3 startDate];
  v33 = [v3 endDate];
  +[MOEventBundleMetaDataUtility setMetaDataForTime:v31 startDate:v32 endDate:v33 metaData:v4];

  return v4;
}

+ (id)buildSharedContentMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v10 = @"default_label";
  uint64_t v5 = [v3 action];

  v6 = [v5 actionName];
  v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v4 initWithDictionary:v7];

  return v8;
}

+ (id)buildTimeAtHomeMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 action];
  v6 = [v5 actionName];
  [v4 setObject:v6 forKeyedSubscript:@"default_label"];

  id v7 = [v3 action];
  id v8 = [v7 actionName];
  unsigned int v9 = [v8 isEqualToString:@"Hosting at Home"];

  if (v9) {
    CFStringRef v10 = &off_1002F4778;
  }
  else {
    CFStringRef v10 = &off_1002F4790;
  }
  [v4 setObject:v10 forKeyedSubscript:@"home_activity"];
  v11 = [v3 persons];

  if (v11)
  {
    uint64_t v12 = [v3 persons];
    id v13 = [v3 suggestionID];
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:v12 suggestionId:v13 metaData:v4];
  }
  uint64_t v14 = [v3 resources];
  +[MOEventBundleMetaDataUtility setMetaDataForPhotos:v14 metaData:v4];

  v15 = [v3 time];
  id v16 = [v3 startDate];
  v17 = [v3 endDate];
  +[MOEventBundleMetaDataUtility setMetaDataForTime:v15 startDate:v16 endDate:v17 metaData:v4];

  return v4;
}

+ (id)buildSignificantContactMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 action];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [v3 persons];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v3 summarizationGranularity];

      if (v8 != (id)2)
      {
        unsigned int v9 = objc_opt_new();
        CFStringRef v10 = [v3 action];
        v11 = [v3 persons];
        uint64_t v12 = [v11 firstObject];
        id v13 = [v12 name];

        uint64_t v14 = [v10 actionName];
        v15 = v14;
        if (v13)
        {
          uint64_t v16 = [v14 stringByAppendingString:v13];

          v15 = (void *)v16;
        }
        [v9 setObject:v15 forKeyedSubscript:@"default_label"];
        v17 = [v10 actionName];
        uint64_t v18 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v17];
        [v9 setObject:v18 forKeyedSubscript:@"header"];

        [v9 setObject:v13 forKeyedSubscript:@"title"];
        v19 = [v10 actionName];
        v20 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v19];
        [v9 setObject:v20 forKeyedSubscript:@"action"];

        uint64_t v21 = objc_opt_class();
        v22 = [v10 actionName];
        v23 = [v21 keywordFromString:v22];
        [v9 setObject:v23 forKeyedSubscript:@"action_type"];

        id v24 = [v3 persons];
        v25 = [v3 suggestionID];
        +[MOEventBundleMetaDataUtility setMetaDataForPersons:v24 suggestionId:v25 metaData:v9];

        v26 = [v3 time];
        v27 = [v3 startDate];
        v28 = [v3 endDate];
        +[MOEventBundleMetaDataUtility setMetaDataForTime:v26 startDate:v27 endDate:v28 metaData:v9];

        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if ([v3 summarizationGranularity] != (id)2
    || ([v3 isAggregatedAndSuppressed] & 1) != 0)
  {
    unsigned int v9 = 0;
    goto LABEL_13;
  }
  unsigned int v9 = objc_opt_new();
  [v9 setObject:@"contact_summary" forKeyedSubscript:@"summary_type"];
  long long v29 = [v3 persons];
  long long v30 = [v3 suggestionID];
  +[MOEventBundleMetaDataUtility setMetaDataForPersons:v29 suggestionId:v30 metaData:v9];

  CFStringRef v10 = [v3 time];
  id v13 = [v3 startDate];
  v15 = [v3 endDate];
  +[MOEventBundleMetaDataUtility setMetaDataForTime:v10 startDate:v13 endDate:v15 metaData:v9];
LABEL_12:

LABEL_13:

  return v9;
}

+ (id)buildMediaPlayMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 action];
  if (!v4) {
    goto LABEL_19;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = [v3 resources];
  if (!v6)
  {

    goto LABEL_19;
  }
  id v7 = (void *)v6;
  id v8 = [v3 summarizationGranularity];

  if (v8 == (id)2)
  {
LABEL_19:
    if ([v3 summarizationGranularity] != (id)2
      || ([v3 isAggregatedAndSuppressed] & 1) != 0)
    {
      unsigned int v9 = 0;
      goto LABEL_35;
    }
    unsigned int v9 = objc_opt_new();
    v49 = [v3 resources];
    CFStringRef v10 = [v49 firstObject];

    [v9 setObject:@"media_summary" forKeyedSubscript:@"summary_type"];
    v50 = [v3 resources];
    v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v50 count]);
    [v9 setObject:v51 forKeyedSubscript:@"media_event_count"];

    v52 = [v3 resources];
    v53 = [v52 firstObject];
    v54 = [v53 getDictionary];
    uint64_t v12 = [v54 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

    if (([v12 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]] & 1) != 0
      || ([v12 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]] & 1) != 0
      || [v12 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]])
    {
      v55 = [v3 events];
      v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 count]);
      [v9 setObject:v56 forKeyedSubscript:@"media_event_count"];
    }
    v57 = [v3 resources];
    v58 = [v57 firstObject];
    v59 = [v58 getDictionary];
    v60 = [v59 objectForKeyedSubscript:@"media_type"];
    [v9 setObject:v60 forKeyedSubscript:@"media_type"];

    v61 = [v3 action];
    v62 = [v61 actionName];
    if (([v62 isEqualToString:@"songs_on_repeat"] & 1) == 0)
    {
      v63 = [v3 action];
      v64 = [v63 actionName];
      if (([v64 isEqualToString:@"song_on_repeat"] & 1) == 0)
      {
        v75 = [v3 action];
        [v75 actionName];
        v82 = v12;
        v77 = v76 = v37;
        unsigned __int8 v80 = [v77 isEqualToString:@"media_on_repeat"];

        v37 = v76;
        uint64_t v12 = v82;

        if ((v80 & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
LABEL_30:
    v65 = [v3 action];
    v66 = [v65 actionName];
    [v9 setObject:v66 forKeyedSubscript:@"media_on_repeat"];

LABEL_31:
    v67 = [v3 action];
    v68 = [v67 actionName];
    unsigned int v69 = [v68 isEqualToString:@"media_on_repeat_third_party"];

    if (v69)
    {
      v70 = [v3 action];
      v71 = [v70 actionName];
      [v9 setObject:v71 forKeyedSubscript:@"media_on_repeat_third_party"];
    }
    v48 = [v10 getDictionary];
    uint64_t v16 = [v48 objectForKeyedSubscript:@"third_party_dominate_value"];
    [v9 setObject:v16 forKeyedSubscript:@"third_party_dominate_value"];
    goto LABEL_34;
  }
  unsigned int v9 = objc_opt_new();
  CFStringRef v10 = [v3 action];
  v11 = [v3 resources];
  uint64_t v12 = [v11 firstObject];

  id v13 = [v12 getDictionary];
  uint64_t v81 = [v13 objectForKeyedSubscript:@"media_album"];

  uint64_t v14 = [v10 actionName];
  v15 = [v12 name];
  uint64_t v16 = +[NSString stringWithFormat:@"%@: %@", v14, v15];

  [v9 setObject:v16 forKeyedSubscript:@"default_label"];
  v17 = [v10 actionName];
  uint64_t v18 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v17];
  [v9 setObject:v18 forKeyedSubscript:@"header"];

  v19 = [v12 name];
  v20 = +[NSString stringWithFormat:@"%@", v19];
  [v9 setObject:v20 forKeyedSubscript:@"title"];

  uint64_t v21 = [v3 resources];
  v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 count]);
  [v9 setObject:v22 forKeyedSubscript:@"media_event_count"];

  v23 = [v12 getDictionary];
  id v24 = [v23 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

  v79 = v24;
  if (([v24 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]] & 1) != 0
    || ([v24 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]] & 1) != 0
    || [v24 isEqual:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]])
  {
    v25 = [v3 events];
    v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 count]);
    [v9 setObject:v26 forKeyedSubscript:@"media_event_count"];
  }
  v27 = [v12 getDictionary];
  v28 = [v27 objectForKeyedSubscript:@"media_type"];
  [v9 setObject:v28 forKeyedSubscript:@"media_type"];

  [v9 setObject:v81 forKeyedSubscript:@"media_album"];
  long long v29 = [v3 time];
  long long v30 = [v3 startDate];
  long long v31 = [v3 endDate];
  +[MOEventBundleMetaDataUtility setMetaDataForTime:v29 startDate:v30 endDate:v31 metaData:v9];

  long long v32 = [v10 actionName];
  if (([v32 isEqualToString:@"songs_on_repeat"] & 1) == 0)
  {
    v33 = [v10 actionName];
    if (![v33 isEqualToString:@"song_on_repeat"])
    {
      v73 = [v10 actionName];
      unsigned __int8 v74 = [v73 isEqualToString:@"media_on_repeat"];

      if ((v74 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  v34 = [v10 actionName];
  [v9 setObject:v34 forKeyedSubscript:@"media_on_repeat"];

LABEL_13:
  v35 = [v10 actionName];
  unsigned int v36 = [v35 isEqualToString:@"media_on_repeat_third_party"];

  v37 = v78;
  if (v36)
  {
    v38 = [v10 actionName];
    [v9 setObject:v38 forKeyedSubscript:@"media_on_repeat_third_party"];
  }
  v39 = [v10 actionName];
  unsigned int v40 = [v39 isEqualToString:@"played_media_sessions"];

  if (v40)
  {
    v41 = [v10 actionName];
    [v9 setObject:v41 forKeyedSubscript:@"played_media_sessions"];
  }
  v42 = [v10 actionName];
  [v9 setObject:v42 forKeyedSubscript:@"action"];

  v43 = objc_opt_class();
  v44 = [v10 actionName];
  v45 = [v43 keywordFromString:v44];
  [v9 setObject:v45 forKeyedSubscript:@"action_type"];

  v46 = [v12 getDictionary];
  v47 = [v46 objectForKeyedSubscript:@"third_party_dominate_value"];
  [v9 setObject:v47 forKeyedSubscript:@"third_party_dominate_value"];

  v48 = (void *)v81;
LABEL_34:

LABEL_35:

  return v9;
}

+ (id)buildPhotoMemoryMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 action];
  if (v4)
  {
    uint64_t v5 = [v3 resources];

    if (v5)
    {
      uint64_t v4 = objc_opt_new();
      uint64_t v6 = [v3 action];
      id v7 = +[NSString stringWithFormat:@"%@", @"Memories from Photos"];
      id v8 = [v6 actionName];
      id v9 = [v8 length];

      if ((unint64_t)v9 >= 2)
      {
        [v4 setObject:v7 forKeyedSubscript:@"default_label"];
        CFStringRef v10 = [v6 actionName];
        [v4 setObject:v10 forKeyedSubscript:@"title"];
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

+ (id)buildTrendMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 events];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 category];

  if (v7 == (id)10)
  {
    id v8 = [v3 action];
    id v9 = [v3 persons];
    CFStringRef v10 = [v9 firstObject];
    v11 = [v10 name];

    uint64_t v12 = [v8 actionName];
    id v13 = [v12 stringByAppendingString:v11];

    [v4 setObject:v13 forKeyedSubscript:@"default_label"];
    uint64_t v14 = [v8 actionName];
    v15 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v14];
    [v4 setObject:v15 forKeyedSubscript:@"header"];

    [v4 setObject:v11 forKeyedSubscript:@"title"];
    uint64_t v16 = [v8 actionName];
    v17 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v16];
    [v4 setObject:v17 forKeyedSubscript:@"action"];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 actionName];
    v20 = [v18 keywordFromString:v19];
    [v4 setObject:v20 forKeyedSubscript:@"action_type"];

    uint64_t v21 = [v3 persons];
    v22 = [v3 suggestionID];
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:v21 suggestionId:v22 metaData:v4];
  }

  return v4;
}

+ (id)buildEvergreenMetaDataForEventBundle:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [a3 resources];
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v8 type] == (id)9)
        {
          v25 = v3;
          id v9 = objc_opt_new();
          CFStringRef v10 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:@"EVERGREEN_LABEL"];
          [v9 setObject:v10 forKeyedSubscript:@"default_label"];

          v11 = [v8 name];
          uint64_t v12 = +[NSString stringWithFormat:@"%@_%@", @"evergreen_type", v11];

          id v13 = [v8 name];
          id v26 = v9;
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"evergreen_type" extendedKeyword:v12 value:v13 metaData:v9];

          uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:](v8);
          }

          v15 = (char *)[v8 promptCount];
          if (v15)
          {
            for (j = 0; j != v15; ++j)
            {
              v17 = [v8 promptIndexes];
              uint64_t v18 = [v17 objectAtIndex:j];

              if (v18)
              {
                v19 = +[NSString stringWithFormat:@"%@%d", @"evergreen_slot_", j];
                [v26 setObject:v18 forKeyedSubscript:v19];
                v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%d", @"evergreen_index", [v18 intValue]);
                uint64_t v21 = [v18 stringValue];
                +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:v19 extendedKeyword:v20 value:v21 metaData:v26];
              }
            }
          }
          [v26 setObject:&off_1002F47A8 forKeyedSubscript:@"shuffle_mode"];
          v22 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:](v8);
          }

          v23 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:v23];
          }

          id v3 = v25;
          goto LABEL_22;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v26 = 0;
LABEL_22:

  return v26;
}

+ (id)buildTimeContextMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 action];
  id v6 = [v5 actionType];

  id v7 = [v3 action];
  if (v6 == (id)4) {
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:v7 metaData:v4];
  }
  else {
    +[MOEventBundleMetaDataUtility setMetaDataForAction:v7 metaData:v4];
  }

  id v8 = [v3 actions];

  if (v8)
  {
    id v9 = [v3 actions];
    +[MOEventBundleMetaDataUtility setMetaDataForActions:v9 metaData:v4];
  }
  CFStringRef v10 = [v3 place];

  if (v10)
  {
    v11 = [v3 place];
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:v11 metaData:v4];
  }
  uint64_t v12 = [v3 places];

  if (v12)
  {
    id v13 = [v3 places];
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:v13 metaData:v4];
  }
  uint64_t v14 = [v3 time];

  if (v14)
  {
    v15 = [v3 time];
    uint64_t v16 = [v3 startDate];
    v17 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v15 startDate:v16 endDate:v17 metaData:v4];
  }
  uint64_t v18 = [v3 persons];

  if (v18)
  {
    v19 = [v3 persons];
    v20 = [v3 suggestionID];
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:v19 suggestionId:v20 metaData:v4];
  }
  uint64_t v21 = [v3 action];
  if ([v21 actionType] != (id)4) {
    goto LABEL_17;
  }
  v22 = [v3 concurrentMediaAction];

  if (v22)
  {
    uint64_t v21 = [v3 concurrentMediaAction];
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:v21 metaData:v4];
LABEL_17:
  }
  if ([v3 bundleSubType] == (id)202
    && [v3 summarizationGranularity] == (id)2
    && ([v3 isAggregatedAndSuppressed] & 1) == 0)
  {
    [v4 setObject:@"workout_summary" forKeyedSubscript:@"summary_type"];
  }
  v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = [v3 startDate];
    v25 = [v4 allKeys];
    int v27 = 138412546;
    long long v28 = v24;
    __int16 v29 = 2112;
    long long v30 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "build meta for time context bundle, bundle startDate, %@, metaData, %@", (uint8_t *)&v27, 0x16u);
  }

  return v4;
}

+ (id)buildTimeContextTransitMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 action];

  if (v5)
  {
    id v6 = [v3 action];
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:v6 metaData:v4];
  }
  id v7 = [v3 places];

  if (v7)
  {
    id v8 = [v3 places];
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:v8 metaData:v4];
  }
  id v9 = [v3 time];

  if (v9)
  {
    CFStringRef v10 = [v3 time];
    v11 = [v3 startDate];
    uint64_t v12 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v10 startDate:v11 endDate:v12 metaData:v4];
  }
  [v4 setObject:@"transit_summary" forKeyedSubscript:@"summary_type"];
  id v13 = [v3 places];
  uint64_t v14 = [v13 firstObject];

  if (([v14 placeType] == (id)2 || objc_msgSend(v14, "placeType") == (id)3)
    && [v14 placeType] != (id)4
    && [v14 placeType] != (id)5
    && [v14 proposition] != (id)4)
  {
    [v4 setObject:@"YES" forKeyedSubscript:@"destination_format"];
  }

  return v4;
}

+ (id)buildTripMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 action];
  id v6 = [v5 actionType];

  if (v6 == (id)2)
  {
    id v7 = [v3 action];
    +[MOEventBundleMetaDataUtility setMetaDataForAction:v7 metaData:v4];
  }
  id v8 = [v3 place];

  if (v8)
  {
    id v9 = [v3 place];
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:v9 metaData:v4];

    CFStringRef v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"placeType", &off_1002F8C90];
    v11 = [v3 places];
    uint64_t v12 = [v11 filteredArrayUsingPredicate:v10];

    id v13 = [v3 place];
    [v13 placeNameConfidence];
    double v15 = v14;

    if ((unint64_t)[v12 count] >= 2)
    {
      uint64_t v16 = kMOLabelFormatterMetaKeywordSingleDominantPlace;
      if (v15 < 0.8)
      {
        v17 = [v12 objectAtIndexedSubscript:0];
        [v17 placeNameConfidence];
        double v19 = v18;
        v20 = [v12 objectAtIndexedSubscript:1];
        [v20 placeNameConfidence];
        double v22 = v19 + v21;

        uint64_t v16 = kMOLabelFormatterMetaKeywordDoubleDominantPlaces;
        if (v22 < 0.8)
        {
          [v4 setObject:@"YES" forKeyedSubscript:@"many_places"];
          if (v15 >= 0.4) {
            uint64_t v16 = kMOLabelFormatterMetaKeywordSingleDominantPlace;
          }
        }
      }
      [v4 setObject:@"YES" forKeyedSubscript:*v16];
      +[MOEventBundleMetaDataUtility setMetaDataForPlaces:v12 metaData:v4];
    }
  }
  v23 = [v3 time];

  if (v23)
  {
    id v24 = [v3 time];
    v25 = [v3 startDate];
    id v26 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v24 startDate:v25 endDate:v26 metaData:v4];
  }
  int v27 = [v3 persons];

  if (v27)
  {
    long long v28 = [v3 persons];
    __int16 v29 = [v3 suggestionID];
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:v28 suggestionId:v29 metaData:v4];
  }

  return v4;
}

+ (id)buildClusteringMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 getSubTypeString];
  [v4 setObject:v5 forKeyedSubscript:@"cluster_subtype"];

  id v6 = [v3 action];
  id v7 = [v6 actionType];

  id v8 = [v3 action];
  if (v7 == (id)4) {
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:v8 metaData:v4];
  }
  else {
    +[MOEventBundleMetaDataUtility setMetaDataForAction:v8 metaData:v4];
  }

  id v9 = [v3 place];

  if (v9)
  {
    CFStringRef v10 = [v3 place];
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:v10 metaData:v4];
  }
  v11 = [v3 time];

  if (v11)
  {
    uint64_t v12 = [v3 time];
    id v13 = [v3 startDate];
    double v14 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v12 startDate:v13 endDate:v14 metaData:v4];
  }

  return v4;
}

+ (id)buildStateOfMindMetaDataForEventBundle:(id)a3
{
  id v3 = a3;
  +[MOEventBundleMetaDataUtility defineClassCollections];
  id v4 = objc_opt_new();
  id v5 = [v3 time];

  if (v5)
  {
    id v6 = [v3 time];
    id v7 = [v3 startDate];
    id v8 = [v3 endDate];
    +[MOEventBundleMetaDataUtility setMetaDataForTime:v6 startDate:v7 endDate:v8 metaData:v4];
  }
  if ([v3 bundleSubType] == (id)802) {
    CFStringRef v9 = @"momentary_emotion";
  }
  else {
    CFStringRef v9 = @"daily_mood";
  }
  [v4 setObject:v9 forKeyedSubscript:@"reflective_interval"];
  CFStringRef v10 = [v3 action];
  v11 = (char *)[v10 actionSubtype];

  uint64_t v12 = v11 - 1;
  if ((unint64_t)(v11 - 1) <= 6)
  {
    uint64_t v13 = (uint64_t)*(&off_1002C9950 + (void)v12);
    [v4 setObject:*(&off_1002C9918 + (void)v12) forKeyedSubscript:@"valence_classification_granular"];
    [v4 setObject:v13 forKeyedSubscript:@"valence_classification"];
  }
  double v14 = [v3 action];
  double v15 = [v14 actionMetaData];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"MediaActionMetaDataAppName"];

  if (v16)
  {
    v17 = [v3 action];
    double v18 = [v17 actionMetaData];
    double v19 = [v18 objectForKeyedSubscript:@"MediaActionMetaDataAppName"];
    [v4 setObject:v19 forKeyedSubscript:@"state_of_mind_app_name"];
  }
  v20 = [v3 metaDataForRank];
  double v21 = [v20 objectForKey:@"StateOfMindLabels"];

  double v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 count]);
  [v4 setObject:v22 forKeyedSubscript:@"state_of_mind_label_count"];

  if ([v21 count])
  {
    v23 = [v21 objectAtIndexedSubscript:0];
    [v23 intValue];

    id v24 = HKUILocalizedStringForStateOfMindLabel();
    v25 = [v24 lowercaseString];
    id v26 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v25];
    [v4 setObject:v26 forKeyedSubscript:@"state_of_mind_label_1"];
  }
  if ((unint64_t)[v21 count] >= 2)
  {
    int v27 = [v21 objectAtIndexedSubscript:1];
    [v27 intValue];

    long long v28 = HKUILocalizedStringForStateOfMindLabel();
    __int16 v29 = [v28 lowercaseString];
    long long v30 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v29];
    [v4 setObject:v30 forKeyedSubscript:@"state_of_mind_label_2"];
  }
  long long v31 = v4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v21;
  id v32 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v52;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v37 = [v3 action];
        if ([v37 actionSubtype] == (id)2)
        {
          unsigned int v38 = [(id)noSavoringPromptLabels containsObject:v36];

          if (v38) {
            goto LABEL_27;
          }
        }
        else
        {
          v39 = [v3 action];
          if ([v39 actionSubtype] == (id)3)
          {
            unsigned __int8 v40 = [(id)noSavoringPromptLabels containsObject:v36];

            if (v40) {
              goto LABEL_27;
            }
          }
          else
          {
            v41 = [v3 action];
            if ([v41 actionSubtype] == (id)4)
            {
              unsigned __int8 v42 = [(id)noSavoringPromptLabels containsObject:v36];

              if ((v42 & 1) == 0) {
                goto LABEL_29;
              }
LABEL_27:
              [v31 setObject:@"Yes" forKeyedSubscript:@"no_savoring_prompt"];
              goto LABEL_29;
            }
          }
        }
LABEL_29:
        v43 = [v3 action];
        if ([v43 actionSubtype] == (id)5)
        {
          unsigned int v44 = [(id)noReappraisalPromptLabels containsObject:v36];

          if (v44) {
            goto LABEL_37;
          }
        }
        else
        {
          v45 = [v3 action];
          if ([v45 actionSubtype] == (id)6)
          {
            unsigned __int8 v46 = [(id)noReappraisalPromptLabels containsObject:v36];

            if (v46) {
              goto LABEL_37;
            }
          }
          else
          {
            v47 = [v3 action];
            if ([v47 actionSubtype] == (id)7)
            {
              unsigned __int8 v48 = [(id)noReappraisalPromptLabels containsObject:v36];

              if ((v48 & 1) == 0) {
                continue;
              }
LABEL_37:
              [v31 setObject:@"Yes" forKeyedSubscript:@"no_reappraisal_prompt"];
              continue;
            }
          }
        }
      }
      id v33 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v33);
  }

  return v31;
}

+ (void)setMetaDataForAction:(id)a3 metaData:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = [v6 actionName];
    id v8 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v7];
    [v5 setObject:v8 forKeyedSubscript:@"action"];

    CFStringRef v9 = objc_opt_class();
    id v11 = [v6 actionName];

    CFStringRef v10 = [v9 keywordFromString:v11];
    [v5 setObject:v10 forKeyedSubscript:@"action_type"];
  }
}

+ (void)setMetaDataForDiningAction:(id)a3 metaData:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v21)
  {
    uint64_t v12 = [v21 actionName];
    uint64_t v13 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v12];
    [v9 setObject:v13 forKeyedSubscript:@"action"];

    double v14 = objc_opt_class();
    double v15 = [v21 actionName];
    uint64_t v16 = [v14 keywordFromString:v15];
    [v9 setObject:v16 forKeyedSubscript:@"action_type"];

    if ([v21 actionType] == (id)10)
    {
      unint64_t v17 = +[MOTime mealtagFromStartDate:v10 endDate:v11];
      if (v17 - 2000 <= 2)
      {
        double v18 = +[MOTime timeStringFromTimeTag:v17];
        if (v18)
        {
          double v19 = +[NSString stringWithFormat:@"%@_%@", @"meal_type", v18];
          v20 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v18];
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"meal_type" extendedKeyword:v19 value:v20 metaData:v9];
        }
      }
    }
  }
}

+ (void)setMetaDataForActions:(id)a3 metaData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    unsigned __int8 v46 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v40 = v5;
    id obj = v5;
    id v47 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    v45 = (void *)v7;
    uint64_t v8 = 0;
    if (v47)
    {
      unsigned int v44 = 0;
      unsigned int v41 = 0;
      LODWORD(v9) = 0;
      uint64_t v43 = *(void *)v51;
      uint64_t v48 = 1;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v51 != v43) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v12 = +[NSString stringWithFormat:@"%@%d", @"action_", (char *)i + v48];
          uint64_t v13 = +[NSString stringWithFormat:@"%@_%d", @"action_type", (char *)i + v48];
          if ([v11 actionType] == (id)4)
          {
            double v14 = [v11 actionName];
            +[MOEventBundleMetaDataUtility setActivityNameFromActionName:v14 metaData:v6 keyword:v12 keywordType:v13];
          }
          else
          {
            double v15 = [v11 actionName];
            uint64_t v16 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v15];
            [v6 setObject:v16 forKeyedSubscript:v12];

            unint64_t v17 = objc_opt_class();
            double v14 = [v11 actionName];
            double v18 = [v17 keywordFromString:v14];
            [v6 setObject:v18 forKeyedSubscript:v13];
          }
          if ([v11 actionType] == (id)4) {
            LODWORD(v9) = v9 + 1;
          }
          unsigned int v49 = v9;
          if ([v11 actionType] == (id)2) {
            uint64_t v19 = (v8 + 1);
          }
          else {
            uint64_t v19 = v8;
          }
          v20 = [v11 actionName];
          unsigned __int8 v21 = [v45 containsObject:v20];

          if ((v21 & 1) == 0)
          {
            double v22 = v6;
            v23 = [v11 actionName];
            [v45 addObject:v23];

            id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"unique_action_", [v45 count]);
            v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%d", @"unique_action_type", [v45 count]);
            if ([v11 actionType] == (id)4)
            {
              id v26 = [v11 actionName];
              +[MOEventBundleMetaDataUtility setActivityNameFromActionName:v26 metaData:v6 keyword:v24 keywordType:v25];

              ++v41;
            }
            else
            {
              int v27 = [v11 actionName];
              long long v28 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v27];
              [v22 setObject:v28 forKeyedSubscript:v24];

              __int16 v29 = objc_opt_class();
              long long v30 = [v11 actionName];
              long long v31 = [v29 keywordFromString:v30];
              [v22 setObject:v31 forKeyedSubscript:v25];

              id v6 = v22;
            }
          }
          id v32 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:[v11 actionType]];
          unsigned __int8 v33 = [v46 containsObject:v32];

          if ((v33 & 1) == 0)
          {
            ++v44;
            id v34 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:[v11 actionType]];
            [v46 addObject:v34];
          }
          uint64_t v8 = v19;
          uint64_t v9 = v49;
        }
        id v47 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
        uint64_t v48 = (v48 + i);
      }
      while (v47);
    }
    else
    {
      unsigned int v44 = 0;
      unsigned int v41 = 0;
      uint64_t v9 = 0;
    }

    v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj count]);
    [v6 setObject:v35 forKeyedSubscript:@"action_count"];

    uint64_t v36 = +[NSNumber numberWithInt:v9];
    [v6 setObject:v36 forKeyedSubscript:@"activity_count"];

    v37 = +[NSNumber numberWithInt:v44];
    [v6 setObject:v37 forKeyedSubscript:@"unique_action_type_count"];

    unsigned int v38 = +[NSNumber numberWithInt:v41];
    [v6 setObject:v38 forKeyedSubscript:@"unique_activity_count"];

    v39 = +[NSNumber numberWithInt:v8];
    [v6 setObject:v39 forKeyedSubscript:@"visit_count"];

    id v5 = v40;
  }
}

+ (void)setActivityNameFromActionName:(id)a3 metaData:(id)a4 keyword:(id)a5 keywordType:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [a5 lowercaseString];
  uint64_t v13 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v12];
  id v27 = v9;
  uint64_t v14 = (uint64_t)+[HKWorkout _workoutActivityTypeFromString:v27];
  int IsValid = _HKWorkoutActivityTypeIsValid();
  uint64_t v16 = v27;
  if (IsValid)
  {
    uint64_t v16 = HKUILocalizedWorkoutTypeName();
  }
  unint64_t v17 = +[MOEventBundleLabelLocalizer _Moments_LowercaseNounForKey:v16];

  char v18 = 1;
  if (v14 > 36)
  {
    CFStringRef v25 = 0;
    switch(v14)
    {
      case '-':
        id v19 = v11;
        v20 = v13;
        CFStringRef v25 = 0;
        CFStringRef v21 = @"surfing";
        goto LABEL_22;
      case '.':
        id v19 = v11;
        v20 = v13;
        CFStringRef v25 = 0;
        CFStringRef v21 = @"swim";
        goto LABEL_22;
      case '/':
      case '0':
      case '2':
      case '3':
        goto LABEL_23;
      case '1':
        id v19 = v11;
        v20 = v13;
        char v18 = 0;
        CFStringRef v25 = @"Track and Field";
        CFStringRef v21 = @"track and field";
        goto LABEL_22;
      case '4':
        id v19 = v11;
        v20 = v13;
        CFStringRef v25 = 0;
        CFStringRef v21 = @"walk";
        goto LABEL_22;
      default:
        if (v14 == 37)
        {
          id v19 = v11;
          v20 = v13;
          CFStringRef v25 = 0;
          CFStringRef v21 = @"run";
        }
        else
        {
          if (v14 != 63) {
            goto LABEL_33;
          }
          id v19 = v11;
          v20 = v13;
          CFStringRef v25 = 0;
          CFStringRef v21 = @"HIIT";
        }
        break;
    }
    goto LABEL_22;
  }
  if (v14 > 23)
  {
    if (v14 == 24)
    {
      id v19 = v11;
      v20 = v13;
      CFStringRef v25 = 0;
      CFStringRef v21 = @"hike";
    }
    else
    {
      if (v14 != 29)
      {
LABEL_33:
        CFStringRef v25 = 0;
        goto LABEL_23;
      }
      id v19 = v11;
      v20 = v13;
      char v18 = 0;
      CFStringRef v25 = @"Mind and Body Workout";
      CFStringRef v21 = @"mind and body workout";
    }
    goto LABEL_22;
  }
  CFStringRef v25 = 0;
  if (v14 == 1)
  {
    id v19 = v11;
    v20 = v13;
    CFStringRef v21 = @"American football";
    goto LABEL_22;
  }
  if (v14 == 3)
  {
    id v19 = v11;
    v20 = v13;
    CFStringRef v25 = 0;
    CFStringRef v21 = @"Australian football";
LABEL_22:

    int IsValid = 0;
    unint64_t v17 = (__CFString *)v21;
    uint64_t v13 = v20;
    id v11 = v19;
  }
LABEL_23:
  if ((unint64_t)v14 > 0x4F || v14 == 33)
  {

    unint64_t v17 = @"workout";
  }
  else if (IsValid)
  {
    [v10 setObject:v17 forKeyedSubscript:v12];
    goto LABEL_30;
  }
  double v22 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v17, v25);
  [v10 setObject:v22 forKeyedSubscript:v12];

  if ((v18 & 1) == 0)
  {
    v23 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v26];
    [v10 setObject:v23 forKeyedSubscript:v13];
  }
LABEL_30:
  id v24 = [(id)objc_opt_class() keywordFromString:v17];
  [v10 setObject:v24 forKeyedSubscript:v11];
}

+ (void)setMetaDataForActivityAction:(id)a3 metaData:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (v12)
  {
    id v6 = [v12 actionName];
    +[MOEventBundleMetaDataUtility setActivityNameFromActionName:v6 metaData:v5 keyword:@"action" keywordType:@"action_type"];

    uint64_t v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 actionSubtype]);
    [v5 setObject:v7 forKeyedSubscript:@"workoutSubtype"];

    uint64_t v8 = [v12 actionMetaData];
    id v9 = [v8 objectForKeyedSubscript:@"MediaActionMetaDataAppName"];

    if (v9)
    {
      id v10 = [v12 actionMetaData];
      id v11 = [v10 objectForKeyedSubscript:@"MediaActionMetaDataAppName"];
      [v5 setObject:v11 forKeyedSubscript:@"workout_app_name"];
    }
  }
}

+ (void)setMetaDataForMediaAction:(id)a3 metaData:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7 && [v7 actionType] == (id)6)
  {
    id v6 = [v7 actionName];
    [v5 setObject:v6 forKeyedSubscript:@"media"];
  }
}

+ (id)mediaKeywordWithType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      +[NSString stringWithFormat:@"%@_title", @"media"];
      goto LABEL_8;
    case 2uLL:
      +[NSString stringWithFormat:@"%@_album", @"media"];
      goto LABEL_8;
    case 3uLL:
      +[NSString stringWithFormat:@"%@_artist", @"media"];
      goto LABEL_8;
    case 4uLL:
      +[NSString stringWithFormat:@"%@_genre", @"media"];
      goto LABEL_8;
    case 5uLL:
      +[NSString stringWithFormat:@"%@_app", @"media"];
LABEL_8:
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v3 = @"media";
      break;
  }

  return v3;
}

+ (void)setMetaDataForActivityConcurrentMediaAction:(id)a3 metaData:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    if ([v17 actionType] == (id)6)
    {
      id v7 = [v17 actionMetaData];

      if (v7)
      {
        uint64_t v8 = [v17 actionName];
        [v6 setObject:v8 forKeyedSubscript:@"media"];

        id v9 = [v17 actionMetaData];
        id v10 = [v9 objectForKeyedSubscript:@"MediaActionMetaDataMediaType"];
        [v6 setObject:v10 forKeyedSubscript:@"media_type"];

        id v11 = [v17 actionMetaData];
        id v12 = [v11 objectForKeyedSubscript:@"MediaActionMetaDataMediaInfoType"];

        if (v12)
        {
          uint64_t v13 = [v17 actionMetaData];
          uint64_t v14 = [v13 objectForKeyedSubscript:@"MediaActionMetaDataMediaInfoType"];

          double v15 = [a1 mediaKeywordWithType:[v14 intValue]];
          uint64_t v16 = [v17 actionName];
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"media_name" extendedKeyword:v15 value:v16 metaData:v6];
        }
      }
    }
  }
}

+ (void)setMetaDataWithKeyword:(id)a3 extendedKeyword:(id)a4 value:(id)a5 metaData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9 && v10 && v11)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@%@", v9, @"_string"];
    [v12 setObject:v10 forKeyedSubscript:v9];
    [v12 setObject:v11 forKeyedSubscript:v10];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  else
  {
    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2048;
      id v19 = [v11 length];
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "build meta, keyword, %@, extendedKeyword, %@, value, %lu", buf, 0x20u);
    }
  }
}

+ (void)setMetaDataForTime:(id)a3 startDate:(id)a4 endDate:(id)a5 metaData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 timeZoneObject];
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v61 = v13;
    __int16 v62 = 2112;
    id v63 = v10;
    __int16 v64 = 2112;
    unint64_t v65 = (unint64_t)v11;
    __int16 v66 = 2112;
    unint64_t v67 = (unint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, endDate, %@, time, %@", buf, 0x2Au);
  }

  if (v11)
  {
    if ([v11 isBeforeDate:v10])
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [v11 snapToTheDay];
      if (![v15 isAfterDate:v10]) {
        goto LABEL_14;
      }
      id v16 = v15;

      if (v16)
      {
        if (![v16 isBeforeDate:v10])
        {
          id v11 = v16;
          goto LABEL_14;
        }
        id v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v61 = v10;
          __int16 v62 = 2112;
          id v63 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after snapping.", buf, 0x16u);
        }
      }
    }
    id v11 = 0;
LABEL_14:
  }
  if (v9)
  {
    __int16 v18 = [v9 timeString];

    if (v18)
    {
      id v19 = [v9 timeString];
      v20 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v19];
      [v12 setObject:v20 forKeyedSubscript:@"time"];
    }
  }
  if (!v10)
  {
    id v10 = [v9 date];

    id v11 = 0;
  }
  if (!v13)
  {
    v23 = v11;
    CFStringRef v21 = v10;
LABEL_36:
    if (!v21)
    {
      id v24 = 0;
      goto LABEL_68;
    }
    if (!v23) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  if (v10)
  {
    CFStringRef v21 = +[MOTime localTimeOfDate:v10 timeZone:v13];
    double v22 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v61 = v13;
      __int16 v62 = 2112;
      id v63 = v10;
      __int16 v64 = 2112;
      unint64_t v65 = (unint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, localDate, %@", buf, 0x20u);
    }

    if (!v11)
    {
      v23 = 0;
      id v24 = 0;
      if (!v21) {
        goto LABEL_68;
      }
      goto LABEL_42;
    }
  }
  else
  {
    CFStringRef v21 = 0;
    id v24 = 0;
    v23 = 0;
    if (!v11) {
      goto LABEL_68;
    }
  }
  v23 = +[MOTime localTimeOfDate:v11 timeZone:v13];
  CFStringRef v25 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v61 = v13;
    __int16 v62 = 2112;
    id v63 = v11;
    __int16 v64 = 2112;
    unint64_t v65 = (unint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "build meta, time zone, %@, endDate, %@, localDate, %@", buf, 0x20u);
  }

  if (!v21 || !v23) {
    goto LABEL_36;
  }
  if ([v23 isBeforeDate:v21])
  {
    uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v61 = v21;
      __int16 v62 = 2112;
      id v63 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after time zone shifting.", buf, 0x16u);
    }
LABEL_41:

    v23 = 0;
    goto LABEL_42;
  }
LABEL_38:
  if ([v23 isBeforeDate:v21])
  {
    uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:]((uint64_t)v21, (uint64_t)v23, v26);
    }
    goto LABEL_41;
  }
LABEL_42:
  id v27 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v61 = v13;
    __int16 v62 = 2112;
    id v63 = v21;
    __int16 v64 = 2112;
    unint64_t v65 = (unint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "build meta after timezone shift, time zone, %@, startDate, %@, endDate, %@", buf, 0x20u);
  }

  unint64_t v28 = +[MOTime dateReferenceTagFromStartDate:v21 endDate:v23];
  if (v9) {
    [v9 setDateReferenceTag:v28];
  }
  if (v28 >= 2)
  {
    __int16 v29 = +[MOTime timeStringFromTimeTag:v28];
    [v12 setObject:v29 forKeyedSubscript:@"date_referece_time_tag"];
  }
  if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 0x64)
  {
    long long v30 = +[MOTime timeStringFromTimeTag:v28];
    long long v31 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v30];
    id v32 = +[NSString stringWithFormat:@"%@%@", @"date_reference_", v30];
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"date_reference" extendedKeyword:v32 value:v31 metaData:v12];
  }
  unsigned __int8 v33 = +[NSDate date];
  uint64_t v34 = [v33 dateByAddingTimeInterval:-604800.0];

  v57 = (void *)v34;
  if ([v21 isAfterDate:v34]) {
    [v12 setObject:&off_1002F4778 forKeyedSubscript:@"date_referece_recency"];
  }
  id v59 = v9;
  unint64_t v55 = +[MOTime typeOfDayTagFromStartDate:v21 endDate:v23 timeZone:0];
  if (v55 == 10001)
  {
    v35 = +[MOTime timeStringFromTimeTag:10001];
    [v12 setObject:v35 forKeyedSubscript:@"typeOfDay"];
  }
  v58 = v13;
  unint64_t v36 = +[MOTime dayOfWeekTagFromStartDate:v21 endDate:v23];
  unint64_t v37 = v36 - 102;
  if (v36 - 102 <= 6)
  {
    unsigned int v38 = +[MOTime timeStringFromTimeTag:v36];
    v39 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v38];
    id v40 = +[NSString stringWithFormat:@"%@%@", @"date_reference_", v38];
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"date_reference_weekday" extendedKeyword:v40 value:v39 metaData:v12];
  }
  unint64_t v56 = v36;
  unsigned int v41 = v12;
  unint64_t v42 = +[MOTime timetagFromStartDate:v21 endDate:v23];
  if (v42 - 2 <= 6)
  {
    uint64_t v43 = +[MOTime timeStringFromTimeTag:v42];
    unsigned int v44 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v43];
    [v12 setObject:v44 forKeyedSubscript:@"timeOfDay"];

    v45 = [v12 objectForKey:@"time"];

    if (!v45)
    {
      unsigned __int8 v46 = [v41 objectForKeyedSubscript:@"timeOfDay"];
      [v41 setObject:v46 forKeyedSubscript:@"time"];
    }
    if (v37 <= 6)
    {
      id v47 = +[MOTime timeStringFromTimeTag:v56];
      uint64_t v48 = +[MOTime timeStringFromTimeTag:v42];
      unsigned int v49 = +[NSString stringWithFormat:@"%@ %@", v47, v48];
      long long v50 = +[NSString stringWithFormat:@"%@%@_%@", @"date_reference_", v47, v48];
      +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:@"date_reference_weekday_timeofday" extendedKeyword:v50 value:v49 metaData:v41];
    }
  }
  long long v51 = +[MOTime localizedDateStringFromDate:v21];
  [v41 setObject:v51 forKeyedSubscript:@"date_string"];

  if (v23 && ([v23 isSameDayWithDate:v21] & 1) == 0)
  {
    long long v52 = +[MOTime localizedDateStringFromDate:v23];
    [v41 setObject:v52 forKeyedSubscript:@"end_date_string"];
  }
  long long v53 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    long long v54 = [v41 objectForKeyedSubscript:@"date_string"];
    *(_DWORD *)buf = 138413826;
    id v61 = v21;
    __int16 v62 = 2112;
    id v63 = v23;
    __int16 v64 = 2048;
    unint64_t v65 = v28;
    __int16 v66 = 2048;
    unint64_t v67 = v55;
    __int16 v68 = 2048;
    unint64_t v69 = v56;
    __int16 v70 = 2048;
    unint64_t v71 = v42;
    __int16 v72 = 2112;
    v73 = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "build meta, startDate, %@, endDate, %@, dateTag, %lu, typeOfDay, %lu, dayOfWeek, %lu, timeOfDay, %lu, dateString, %@", buf, 0x48u);
  }
  id v24 = v21;
  id v12 = v41;
  uint64_t v13 = v58;
  id v9 = v59;
LABEL_68:
}

+ (void)setMetaDataForTime:(id)a3 metaData:(id)a4
{
}

+ (void)setMetaDataForPlace:(id)a3 metaData:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  uint64_t v6 = [v32 placeName];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v32 placeType];

    if (v8)
    {
      if ([v32 placeUserType]
        && ([v32 placeUserType] == (id)1 || objc_msgSend(v32, "placeUserType") == (id)2))
      {
        id v9 = [v32 placeName];
        id v10 = [v9 lowercaseString];
        id v11 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v10];
        [v5 setObject:v11 forKeyedSubscript:@"place"];

        id v12 = [v32 placeName];
        uint64_t v13 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v12];
        [v5 setObject:v13 forKeyedSubscript:@"Place"];
      }
      else
      {
        uint64_t v14 = [v32 placeName];
        [v5 setObject:v14 forKeyedSubscript:@"place"];

        id v12 = [v32 placeName];
        [v5 setObject:v12 forKeyedSubscript:@"Place"];
      }

      id v15 = [v32 enclosingArea];

      if (v15)
      {
        if ([v32 placeType] != (id)101 && objc_msgSend(v32, "placeType") != (id)102)
        {
          id v16 = [v32 enclosingArea];
          [v5 setObject:v16 forKeyedSubscript:@"city"];

          id v17 = [v32 placeName];
          __int16 v18 = [v32 enclosingArea];
          unsigned int v19 = [v17 containsString:v18];

          if (v19) {
            [v5 setObject:@"Yes" forKeyedSubscript:@"place_name_overlap_with_city"];
          }
        }
      }
      v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 placeType]);
      [v5 setObject:v20 forKeyedSubscript:@"place_type"];

      CFStringRef v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 placeUserType]);
      [v5 setObject:v21 forKeyedSubscript:@"place_user_type"];

      double v22 = +[MOEventRoutine stringOfPlaceUserType:](MOEventRoutine, "stringOfPlaceUserType:", [v32 placeUserType]);
      v23 = v22;
      if (v22)
      {
        id v24 = [v22 lowercaseString];
        [v5 setObject:v24 forKeyedSubscript:@"place_user_type_tag"];
      }
      if ([v32 proposition] == (id)4)
      {
        CFStringRef v25 = [v5 objectForKeyedSubscript:@"flight"];
        unsigned __int8 v26 = [v25 isEqual:@"flight"];

        if ((v26 & 1) == 0) {
          [v5 setObject:&off_1002F4778 forKeyedSubscript:@"vicinity"];
        }
      }
      if ([v32 locationMode] == (id)2) {
        [v5 setObject:&off_1002F4778 forKeyedSubscript:@"trip"];
      }
      if ([v32 placeType] == (id)3 && (objc_msgSend(v32, "placeNameConfidence"), v27 >= 0.95)
        || [v32 placeType] == (id)2 && (objc_msgSend(v32, "placeNameConfidence"), v28 >= 0.95)
        || [v32 placeUserType] && (unint64_t)objc_msgSend(v32, "placeUserType") < 0x64)
      {
        CFStringRef v29 = @"high";
      }
      else if ([v32 placeType] == (id)3 && (objc_msgSend(v32, "placeNameConfidence"), v30 >= 0.9) {
             || [v32 placeType] == (id)2 && (objc_msgSend(v32, "placeNameConfidence"), v31 >= 0.5))
      }
      {
        CFStringRef v29 = @"medium";
      }
      else
      {
        CFStringRef v29 = @"low";
      }
      [v5 setObject:v29 forKeyedSubscript:@"confidence"];
    }
  }
}

+ (BOOL)isAddressForPlace:(id)a3
{
  return (unint64_t)[a3 placeType] > 3;
}

+ (void)setMetaDataForActivityPlace:(id)a3 metaData:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  uint64_t v6 = [v23 placeName];
  if (v6 && [v23 placeType])
  {
    id v7 = [v23 placeUserType];

    if (v7 != (id)2)
    {
      if ([v23 placeUserType] && objc_msgSend(v23, "placeUserType") == (id)1)
      {
        id v8 = [v23 placeName];
        id v9 = [v8 lowercaseString];
        id v10 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v9];
        [v5 setObject:v10 forKeyedSubscript:@"place"];

        id v11 = [v23 placeName];
        id v12 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v11];
        [v5 setObject:v12 forKeyedSubscript:@"Place"];
      }
      else
      {
        uint64_t v13 = [v23 placeName];
        [v5 setObject:v13 forKeyedSubscript:@"place"];

        id v11 = [v23 placeName];
        [v5 setObject:v11 forKeyedSubscript:@"Place"];
      }

      uint64_t v14 = [v23 enclosingArea];

      if (v14)
      {
        if ([v23 placeType] != (id)101 && objc_msgSend(v23, "placeType") != (id)102)
        {
          id v15 = [v23 enclosingArea];
          [v5 setObject:v15 forKeyedSubscript:@"city"];

          id v16 = [v23 placeName];
          id v17 = [v23 enclosingArea];
          unsigned int v18 = [v16 containsString:v17];

          if (v18) {
            [v5 setObject:@"Yes" forKeyedSubscript:@"place_name_overlap_with_city"];
          }
        }
      }
      unsigned int v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 placeType]);
      [v5 setObject:v19 forKeyedSubscript:@"place_type"];

      v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 placeUserType]);
      [v5 setObject:v20 forKeyedSubscript:@"place_user_type"];

      if ([v23 proposition] == (id)4)
      {
        CFStringRef v21 = [v5 objectForKeyedSubscript:@"flight"];
        unsigned __int8 v22 = [v21 isEqual:@"flight"];

        if ((v22 & 1) == 0) {
          [v5 setObject:&off_1002F4778 forKeyedSubscript:@"vicinity"];
        }
      }
    }
  }
  else
  {
  }
}

+ (void)setMetaDataForPersons:(id)a3 suggestionId:(id)a4 metaData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v60 = a5;
  if (v7 && [v7 count])
  {
    id v57 = v7;
    v58 = v8;
    unint64_t v56 = +[NSSet setWithArray:v7];
    unint64_t v55 = [v56 allObjects];
    id v9 = [v55 sortedArrayUsingSelector:"comparePersons:"];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "After Sorting setMetaDataForPersons", buf, 2u);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v71;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          id v17 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v77 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v13);
    }

    long long v54 = +[NSPredicate predicateWithFormat:@"isMePerson == NO"];
    unsigned int v18 = [v11 filteredArrayUsingPredicate:];
    long long v52 = +[NSPredicate predicateWithFormat:@"isMePerson == YES"];
    unsigned int v19 = [v11 filteredArrayUsingPredicate:];
    if ([v19 count])
    {
      v20 = [v19 firstObject];
      CFStringRef v21 = [v20 name];
      [v60 setObject:v21 forKeyedSubscript:@"me_person"];

      unsigned __int8 v22 = [v19 firstObject];
      LODWORD(v21) = [v22 mePersonIdentified];

      if (v21) {
        [v60 setObject:@"Yes" forKeyedSubscript:@"me_person_identified"];
      }
      if ((unint64_t)[v19 count] >= 2)
      {
        id v23 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:]((uint64_t)v19, v23);
        }
      }
    }
    id v59 = v11;
    long long v50 = +[NSPredicate predicateWithFormat:@"isPHPersonTypeImportant == YES"];
    unsigned int v49 = [v18 filteredArrayUsingPredicate:];
    id v24 = [v49 mutableCopy];
    id v25 = [v58 hash];
    [v24 shuffleWithSeed:v25];
    id v47 = +[NSPredicate predicateWithFormat:@"isPHPersonTypeImportant == NO"];
    unsigned __int8 v46 = [v18 filteredArrayUsingPredicate:];
    id v26 = [v46 mutableCopy];
    [v26 shuffleWithSeed:v25];
    uint64_t v48 = v24;
    v45 = v26;
    double v27 = [v24 arrayByAddingObjectsFromArray:v26];
    double v28 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "all shuffed persons by importance except me Person", buf, 2u);
    }
    long long v51 = v19;
    long long v53 = v18;

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v29 = v27;
    id v30 = [v29 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v67;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v67 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
          v35 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v77 = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v31);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v29;
    id v36 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    unint64_t v37 = v59;
    if (v36)
    {
      id v38 = v36;
      uint64_t v39 = *(void *)v63;
      uint64_t v40 = 1;
LABEL_34:
      uint64_t v41 = 0;
      while (1)
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(obj);
        }
        unint64_t v42 = *(void **)(*((void *)&v62 + 1) + 8 * v41);
        if ([v42 mePersonIdentified]) {
          [v60 setObject:@"Yes" forKeyedSubscript:@"me_person_identified"];
        }
        uint64_t v43 = +[NSString stringWithFormat:@"%@%d", @"person_", v40 + v41];
        unsigned int v44 = [v42 name];
        [v60 setObject:v44 forKeyedSubscript:v43];

        unint64_t v37 = v59;
        if ((unint64_t)((int)v40 + v41 + 1) > 3) {
          break;
        }
        if (v38 == (id)++v41)
        {
          id v38 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
          uint64_t v40 = (int)v40 + v41;
          if (v38) {
            goto LABEL_34;
          }
          break;
        }
      }
    }

    id v7 = v57;
    id v8 = v58;
  }
}

+ (void)setMetaDataForPlaces:(id)a3 metaData:(id)a4
{
  id v5 = a3;
  id v69 = a4;
  if (!v5 || ![v5 count])
  {
    uint64_t v52 = 0;
    unsigned int v64 = 0;
    uint64_t v53 = 0;
    goto LABEL_55;
  }
  uint64_t v6 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v59 = v5;
  id v8 = v5;
  id v66 = [v8 countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (!v66)
  {
    unsigned int v61 = 0;
    unsigned int v64 = 0;
    char v60 = 0;
    goto LABEL_54;
  }
  unsigned int v61 = 0;
  unsigned int v64 = 0;
  char v60 = 0;
  uint64_t v65 = *(void *)v72;
  uint64_t v67 = 1;
  id v9 = NSAssertionHandler_ptr;
  id v62 = v8;
  long long v63 = v6;
  long long v68 = v7;
  do
  {
    for (i = 0; i != v66; i = (char *)i + 1)
    {
      if (*(void *)v72 != v65) {
        objc_enumerationMutation(v8);
      }
      id v11 = (char *)i + v67;
      id v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      long long v70 = [v9[44] stringWithFormat:@"%@%d", @"place_", (char *)i + v67];
      id v13 = [v9[44] stringWithFormat:@"%@%d", @"Place_", (char *)i + v67];
      uint64_t v14 = [v12 placeName];

      if (v14)
      {
        if ([v12 placeUserType] && objc_msgSend(v12, "placeUserType") == (id)1)
        {
          id v15 = [v12 placeName];
          uint64_t v16 = [v15 lowercaseString];
          id v17 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v16];
          [v69 setObject:v17 forKeyedSubscript:v70];

          uint64_t v6 = v63;
          unsigned int v18 = [v12 placeName];
          unsigned int v19 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v18];
          [v69 setObject:v19 forKeyedSubscript:v13];
        }
        else
        {
          v20 = [v12 placeName];
          [v69 setObject:v20 forKeyedSubscript:v70];

          unsigned int v18 = [v12 placeName];
          [v69 setObject:v18 forKeyedSubscript:v13];
        }
      }
      CFStringRef v21 = [v12 enclosingArea];

      if (v21 && [v12 placeType] != (id)101 && objc_msgSend(v12, "placeType") != (id)102)
      {
        unsigned __int8 v22 = +[NSString stringWithFormat:@"%@_%d", @"city", v11];
        id v23 = [v12 enclosingArea];
        [v69 setObject:v23 forKeyedSubscript:v22];

        id v24 = [v12 enclosingArea];
        unsigned __int8 v25 = [v68 containsObject:v24];

        if ((v25 & 1) == 0)
        {
          ++v61;
          id v26 = [v12 enclosingArea];
          [v68 addObject:v26];

          double v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"unique_city_", [v68 count]);
          double v28 = [v12 enclosingArea];
          [v69 setObject:v28 forKeyedSubscript:v27];
        }
        uint64_t v6 = v63;

        id v8 = v62;
      }
      if ([v12 proposition] == (id)4)
      {
        id v29 = [v69 objectForKeyedSubscript:@"flight"];
        unsigned __int8 v30 = [v29 isEqual:@"flight"];

        if ((v30 & 1) == 0 && v11 == 1) {
          [v69 setObject:&off_1002F4778 forKeyedSubscript:@"vicinity"];
        }
      }
      uint64_t v31 = [v12 placeName];
      if (!v31) {
        goto LABEL_27;
      }
      uint64_t v32 = (void *)v31;
      unsigned __int8 v33 = [v12 placeName];
      uint64_t v34 = v6;
      unsigned __int8 v35 = [v6 containsObject:v33];

      if (v35)
      {
        uint64_t v6 = v34;
LABEL_27:
        id v7 = v68;
        goto LABEL_49;
      }
      id v36 = [v12 placeName];
      [v34 addObject:v36];

      unint64_t v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"unique_place_", [v34 count]);
      id v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"Unique_place_", [v34 count]);
      uint64_t v6 = v34;
      if ([v12 placeUserType] && objc_msgSend(v12, "placeUserType") == (id)1)
      {
        uint64_t v39 = [v12 placeName];
        uint64_t v40 = [v39 lowercaseString];
        uint64_t v41 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v40];
        [v69 setObject:v41 forKeyedSubscript:v37];

        id v8 = v62;
        uint64_t v6 = v63;
        unint64_t v42 = [v12 placeName];
        uint64_t v43 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v42];
        [v69 setObject:v43 forKeyedSubscript:v38];
      }
      else
      {
        unsigned int v44 = [v12 placeName];
        [v69 setObject:v44 forKeyedSubscript:v37];

        unint64_t v42 = [v12 placeName];
        [v69 setObject:v42 forKeyedSubscript:v38];
      }

      if ([v12 proposition] == (id)4)
      {
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"vicinity_", [v6 count]);
        [v69 setObject:&off_1002F4778 forKeyedSubscript:v45];
      }
      unsigned __int8 v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%d", @"confidence_", [v6 count]);
      if ([v12 placeType] == (id)3 && (objc_msgSend(v12, "placeNameConfidence"), v47 >= 0.95))
      {
        CFStringRef v49 = @"high";
        id v7 = v68;
      }
      else
      {
        id v7 = v68;
        if ([v12 placeType] == (id)2 && (objc_msgSend(v12, "placeNameConfidence"), v48 >= 0.95)
          || [v12 placeUserType] && (unint64_t)objc_msgSend(v12, "placeUserType") < 0x64)
        {
          CFStringRef v49 = @"high";
        }
        else if ([v12 placeType] == (id)3 && (objc_msgSend(v12, "placeNameConfidence"), v50 >= 0.9))
        {
          CFStringRef v49 = @"medium";
        }
        else if ([v12 placeType] != (id)2 {
               || ([v12 placeNameConfidence], CFStringRef v49 = @"medium", v51 < 0.5))
        }
        {
          char v60 = 1;
          CFStringRef v49 = @"low";
        }
      }
      ++v64;
      [v69 setObject:v49 forKeyedSubscript:v46];

LABEL_49:
      id v9 = NSAssertionHandler_ptr;
    }
    id v66 = [v8 countByEnumeratingWithState:&v71 objects:v75 count:16];
    uint64_t v67 = (v67 + i);
  }
  while (v66);
LABEL_54:

  uint64_t v53 = v60 & 1;
  id v5 = v59;
  uint64_t v52 = v61;
LABEL_55:
  long long v54 = +[NSNumber numberWithBool:v53];
  [v69 setObject:v54 forKeyedSubscript:@"include_low_confidence_place_name"];

  unint64_t v55 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  [v69 setObject:v55 forKeyedSubscript:@"place_count"];

  unint64_t v56 = +[NSNumber numberWithInt:v64];
  [v69 setObject:v56 forKeyedSubscript:@"unique_place_count"];

  id v57 = +[NSNumber numberWithInt:v52];
  [v69 setObject:v57 forKeyedSubscript:@"unique_city_count"];

  if ((unint64_t)[v5 count] >= 2)
  {
    v58 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 count] - 1);
    [v69 setObject:v58 forKeyedSubscript:@"place_count_minus_one"];
  }
}

+ (void)setMetaDataForPhotos:(id)a3 metaData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12) == (id)2)
          {
            [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"photo_attached"];
            goto LABEL_13;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (char *)[v7 count];
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  id v11 = 0;
  unint64_t v12 = 0;
  long long v13 = v9 - 1;
  while (1)
  {
    long long v14 = [v7 objectAtIndex:v12];
    uint64_t v15 = [v14 valueForKeyPath:v8];
    uint64_t v16 = (void *)v15;
    if (!v11)
    {
      id v11 = +[NSMutableString stringWithString:v15];
      goto LABEL_9;
    }
    if (v13 != (char *)v12) {
      break;
    }
    [v11 appendFormat:@" and %@", v15];
LABEL_9:

    if (v10 == (char *)++v12) {
      goto LABEL_13;
    }
  }
  if (v12 < a5 - 1)
  {
    [v11 appendFormat:@", %@", v15];
    goto LABEL_9;
  }
  [v11 appendFormat:@", %@ and more", v15];

LABEL_13:
  id v17 = [v11 copy];

  return v17;
}

+ (id)keywordFromString:(id)a3
{
  return [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
}

+ (void)buildEvergreenMetaDataForEventBundle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  id v6 = [a1 name];
  int v7 = 138412802;
  id v8 = v6;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  unint64_t v12 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "build meta, Evergreen, type, %@, count, %lu, resource, %@", (uint8_t *)&v7, 0x20u);
}

+ (void)buildEvergreenMetaDataForEventBundle:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "build meta, Evergreen, type, %@, metaData, %@", v4, v5, v6, v7, v8);
}

+ (void)setMetaDataForTime:(os_log_t)log startDate:endDate:metaData:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted at the end", (uint8_t *)&v3, 0x16u);
}

+ (void)setMetaDataForPersons:(uint64_t)a1 suggestionId:(NSObject *)a2 metaData:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "More than one person found : %@", (uint8_t *)&v2, 0xCu);
}

@end