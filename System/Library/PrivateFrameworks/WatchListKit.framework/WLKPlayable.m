@interface WLKPlayable
+ (id)playablesWithDictionaries:(id)a3 context:(id)a4;
- (BOOL)isAppInstalled;
- (BOOL)isEntitled;
- (BOOL)isEntitledAnywhere;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubtitled;
- (BOOL)isiTunes;
- (NSArray)SDHLocales;
- (NSArray)adLocales;
- (NSArray)audioTrackFormats;
- (NSArray)audioTrackLocales;
- (NSArray)closedCaptionLocales;
- (NSArray)movieClips;
- (NSArray)storeOffers;
- (NSArray)subscriptionOffers;
- (NSArray)subtitledLocales;
- (NSDate)endAirTime;
- (NSDate)startAirTime;
- (NSDictionary)punchoutUrls;
- (NSNumber)duration;
- (NSString)canonicalID;
- (NSString)channelID;
- (NSString)contentID;
- (NSString)externalID;
- (NSString)externalServiceID;
- (NSString)playableID;
- (NSString)videoColorRange;
- (NSString)videoQuality;
- (NSURL)tvAppDeeplinkURL;
- (WLKBasicContentMetadata)content;
- (WLKChannelDetails)channelDetails;
- (WLKComingSoonInfo)comingSoonInfo;
- (WLKLocale)primaryLocale;
- (WLKOfferListing)offerListing;
- (WLKPlayEvent)playEvent;
- (WLKPlayable)init;
- (WLKPlayable)initWithDictionary:(id)a3;
- (WLKPlayable)initWithDictionary:(id)a3 context:(id)a4;
- (WLKStoreOffer)bestStoreBuyOffer;
- (WLKStoreOffer)bestStoreRentalOffer;
- (WLKStoreOffer)bestStoreSubscriptionOffer;
- (id)_localesArrayForDictionary:(id)a3 andKey:(id)a4;
- (id)description;
- (id)openPunchoutURL;
- (id)playPunchoutURL;
- (int64_t)airingType;
- (int64_t)contentSourceType;
- (unint64_t)hash;
@end

@implementation WLKPlayable

+ (id)playablesWithDictionaries:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          v16 = (void *)MEMORY[0x1BA9E92A0](isKindOfClass);
          id v17 = objc_alloc((Class)a1);
          v18 = objc_msgSend(v17, "initWithDictionary:context:", v14, v7, (void)v20);
          [v8 addObject:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (WLKPlayable)initWithDictionary:(id)a3
{
  return [(WLKPlayable *)self initWithDictionary:a3 context:0];
}

- (WLKPlayable)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v116.receiver = self;
    v116.super_class = (Class)WLKPlayable;
    id v8 = [(WLKPlayable *)&v116 init];
    if (!v8)
    {
LABEL_65:
      self = v8;
      uint64_t v11 = self;
      goto LABEL_66;
    }
    id v9 = objc_msgSend(v6, "wlk_stringForKey:", @"airingType");
    if ([v9 isEqual:@"Live"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqual:@"Replay"])
    {
      uint64_t v10 = 2;
    }
    else
    {
      if ([v9 isEqual:@"OnDemand"])
      {
        v8->_airingType = 0;
        goto LABEL_12;
      }
      uint64_t v10 = -1;
    }
    v8->_airingType = v10;
LABEL_12:
    uint64_t v12 = objc_msgSend(v6, "wlk_arrayForKey:", @"audioTrackFormats");
    uint64_t v13 = [v12 copy];
    audioTrackFormats = v8->_audioTrackFormats;
    v8->_audioTrackFormats = (NSArray *)v13;

    v15 = objc_msgSend(v6, "wlk_stringForKey:", @"channelId");
    uint64_t v16 = [v15 copy];
    channelID = v8->_channelID;
    v8->_channelID = (NSString *)v16;

    v18 = objc_msgSend(v6, "wlk_stringForKey:", @"id");
    uint64_t v19 = [v18 copy];
    playableID = v8->_playableID;
    v8->_playableID = (NSString *)v19;

    long long v21 = objc_msgSend(v6, "wlk_stringForKey:", @"contentId");
    uint64_t v22 = [v21 copy];
    contentID = v8->_contentID;
    v8->_contentID = (NSString *)v22;

    v8->_duration = (NSNumber *)(id)objc_msgSend(v6, "wlk_numberForKey:", @"duration");
    v24 = [v6 valueForKey:@"isEntitledToPlayOnDevice"];

    if (v24) {
      uint64_t v25 = @"isEntitledToPlayOnDevice";
    }
    else {
      uint64_t v25 = @"isEntitled";
    }
    v8->_entitled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", v25, 0);
    v8->_entitledAnywhere = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"isEntitledToPlay", 0);
    v26 = objc_msgSend(v6, "wlk_stringForKey:", @"externalId");
    uint64_t v27 = [v26 copy];
    externalID = v8->_externalID;
    v8->_externalID = (NSString *)v27;

    v29 = objc_msgSend(v6, "wlk_stringForKey:", @"externalServiceId");
    uint64_t v30 = [v29 copy];
    externalServiceID = v8->_externalServiceID;
    v8->_externalServiceID = (NSString *)v30;

    v8->_itunes = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"isItunes", 0);
    v8->_subtitled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"isSubtitled", 0);
    v32 = objc_msgSend(v6, "wlk_stringForKey:", @"videoQuality");
    uint64_t v33 = [v32 copy];
    videoQuality = v8->_videoQuality;
    v8->_videoQuality = (NSString *)v33;

    v35 = objc_msgSend(v6, "wlk_stringForKey:", @"videoColorRange");
    uint64_t v36 = [v35 copy];
    videoColorRange = v8->_videoColorRange;
    v8->_videoColorRange = (NSString *)v36;

    id v38 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v39 = objc_msgSend(v38, "wlk_stringForKey:", @"WLKModelContextKeyCanonicalID");
      canonicalID = v8->_canonicalID;
      v8->_canonicalID = (NSString *)v39;

      v41 = objc_msgSend(v38, "wlk_arrayForKey:", @"WLKModelContextKeyChannels");
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __42__WLKPlayable_initWithDictionary_context___block_invoke;
      v114[3] = &unk_1E620AA08;
      v115 = v8;
      [v41 enumerateObjectsUsingBlock:v114];
    }
    if (!v8->_channelDetails)
    {
      v42 = +[WLKChannelUtilities sharedInstance];
      uint64_t v43 = [v42 channelForID:v8->_channelID];
      channelDetails = v8->_channelDetails;
      v8->_channelDetails = (WLKChannelDetails *)v43;
    }
    v45 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"eventTime");
    v46 = objc_msgSend(v45, "wlk_dictionaryForKey:", @"tuneInTime");
    uint64_t v47 = objc_msgSend(v46, "wlk_dateFromMillisecondsSince1970ForKey:", @"startTime");
    startAirTime = v8->_startAirTime;
    v8->_startAirTime = (NSDate *)v47;

    v112 = v46;
    uint64_t v49 = objc_msgSend(v46, "wlk_dateFromMillisecondsSince1970ForKey:", @"endTime");
    endAirTime = v8->_endAirTime;
    v8->_endAirTime = (NSDate *)v49;

    v8->_contentSourceType = -1;
    v51 = objc_msgSend(v6, "wlk_stringForKey:", @"type");
    if ([v51 length])
    {
      if ([v51 isEqualToString:@"Vod"])
      {
        uint64_t v52 = 0;
      }
      else
      {
        if (![v51 isEqualToString:@"Event"]) {
          goto LABEL_25;
        }
        uint64_t v52 = 1;
      }
      v8->_contentSourceType = v52;
    }
LABEL_25:
    v111 = v51;
    uint64_t v53 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"content");
    if (v53)
    {
      v54 = [[WLKBasicContentMetadata alloc] initWithDictionary:v53];
      if (v54) {
        objc_storeStrong((id *)&v8->_content, v54);
      }
    }
    v55 = [[WLKComingSoonInfo alloc] initWithDictionary:v6 brandID:v8->_channelID];
    comingSoonInfo = v8->_comingSoonInfo;
    v8->_comingSoonInfo = v55;

    v110 = (void *)v53;
    if (v8->_itunes)
    {
      v57 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"itunesMediaApiData");
      v58 = objc_msgSend(v57, "wlk_arrayForKey:", @"movieClips");
      if (v58)
      {
        uint64_t v59 = +[WLKMovieClip movieClipsWithArray:v58];
        movieClips = v8->_movieClips;
        v8->_movieClips = (NSArray *)v59;
      }
      v113 = v57;
      v61 = objc_msgSend(v57, "wlk_arrayForKey:", @"offers");
      if (v61)
      {
        v62 = [[WLKOfferListing alloc] initWithMAPIDictionaries:v61];
        offerListing = v8->_offerListing;
        v8->_offerListing = v62;
      }
    }
    else
    {
      v113 = 0;
    }
    v64 = objc_msgSend(v6, "wlk_arrayForKey:", @"subscriptionOffers");
    if (v64)
    {
      uint64_t v65 = +[WLKStoreOffer offersWithSubscriptionDictionaries:v64];
      subscriptionOffers = v8->_subscriptionOffers;
      v8->_subscriptionOffers = (NSArray *)v65;
    }
    v67 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"punchoutUrls");
    uint64_t v68 = [v67 copy];
    punchoutUrls = v8->_punchoutUrls;
    v8->_punchoutUrls = (NSDictionary *)v68;

    v70 = objc_msgSend(v6, "wlk_stringForKey:", @"url");
    uint64_t v71 = [v70 copy];

    v109 = (void *)v71;
    uint64_t v72 = [MEMORY[0x1E4F1CB10] URLWithString:v71];
    tvAppDeeplinkURL = v8->_tvAppDeeplinkURL;
    v8->_tvAppDeeplinkURL = (NSURL *)v72;

    uint64_t v74 = [(WLKPlayable *)v8 _localesArrayForDictionary:v6 andKey:@"closedCaptionedLocales"];
    closedCaptionLocales = v8->_closedCaptionLocales;
    v8->_closedCaptionLocales = (NSArray *)v74;

    v76 = [(WLKPlayable *)v8 _localesArrayForDictionary:v6 andKey:@"subtitledLocales"];
    if (v76) {
      objc_storeStrong((id *)&v8->_subtitledLocales, v76);
    }
    uint64_t v77 = [(WLKPlayable *)v8 _localesArrayForDictionary:v6 andKey:@"audioTrackLocales"];
    audioTrackLocales = v8->_audioTrackLocales;
    v8->_audioTrackLocales = (NSArray *)v77;

    uint64_t v79 = [(WLKPlayable *)v8 _localesArrayForDictionary:v6 andKey:@"adLocales"];
    adLocales = v8->_adLocales;
    v8->_adLocales = (NSArray *)v79;

    v81 = [WLKLocale alloc];
    v82 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"primaryLocale");
    uint64_t v83 = [(WLKLocale *)v81 initWithDictionary:v82];
    primaryLocale = v8->_primaryLocale;
    v8->_primaryLocale = (WLKLocale *)v83;

    uint64_t v85 = [(WLKPlayable *)v8 _localesArrayForDictionary:v6 andKey:@"sdhLocales"];
    SDHLocales = v8->_SDHLocales;
    v8->_SDHLocales = (NSArray *)v85;

    v87 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"playEvent");
    if (v87)
    {
      v88 = [[WLKPlayEvent alloc] initWithDictionary:v87];
      playEvent = v8->_playEvent;
      v8->_playEvent = v88;
    }
    v8->_appInstalled = [(WLKChannelDetails *)v8->_channelDetails isAppInstalled];
    if (!v8->_itunes && ![(WLKChannelDetails *)v8->_channelDetails isApSubscription]) {
      goto LABEL_64;
    }
    v90 = v8->_punchoutUrls;
    v107 = v45;
    id v108 = v38;
    v91 = v9;
    id v92 = v7;
    if (v90)
    {
      v93 = (void *)[(NSDictionary *)v90 mutableCopy];
    }
    else
    {
      v93 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v94 = v93;
    v95 = objc_msgSend(v93, "wlk_stringForKey:", @"open");
    uint64_t v96 = [v95 length];

    if (!v96)
    {
      v97 = [(NSURL *)v8->_tvAppDeeplinkURL absoluteString];
      if (v97) {
        [v94 setObject:v97 forKey:@"open"];
      }
    }
    if (!v8->_entitled
      || (objc_msgSend(v94, "wlk_stringForKey:", @"play"),
          v98 = objc_claimAutoreleasedReturnValue(),
          uint64_t v99 = [v98 length],
          v98,
          v99))
    {
LABEL_63:
      uint64_t v104 = [v94 copy];
      v105 = v8->_punchoutUrls;
      v8->_punchoutUrls = (NSDictionary *)v104;

      id v7 = v92;
      id v9 = v91;
      v45 = v107;
      id v38 = v108;
LABEL_64:

      goto LABEL_65;
    }
    if ([(id)objc_opt_class() isFullTVAppEnabled])
    {
      v100 = +[WLKPlayableUtilities _punchoutURLForDirectPlayback:v8->_tvAppDeeplinkURL ignoreExtras:1];
      v101 = v100;
      if (v100)
      {
        uint64_t v102 = [v100 absoluteString];
LABEL_58:
        v103 = (void *)v102;
LABEL_60:

        if (v103) {
          [v94 setObject:v103 forKey:@"play"];
        }

        goto LABEL_63;
      }
    }
    else
    {
      v101 = objc_msgSend(v113, "wlk_stringForKey:", @"id");
      if (v101)
      {
        uint64_t v102 = [NSString stringWithFormat:@"videos://play?adam-id=%@&allowCloudPlayback=1", v101];
        goto LABEL_58;
      }
    }
    v103 = 0;
    goto LABEL_60;
  }
  uint64_t v11 = 0;
LABEL_66:

  return v11;
}

void __42__WLKPlayable_initWithDictionary_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 channelID];
  int v8 = [v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
    *a4 = 1;
  }
}

- (WLKPlayable)init
{
  return [(WLKPlayable *)self initWithDictionary:0];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WLKPlayable *)self canonicalID];
  id v6 = [(WLKPlayable *)self channelDetails];
  id v7 = [v6 title];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p>; ID: %@, Channel: %@, Source Type: %ld, Entitled: %d",
    v4,
    self,
    v5,
    v7,
    [(WLKPlayable *)self contentSourceType],
  int v8 = [(WLKPlayable *)self isEntitled]);

  return v8;
}

- (NSArray)storeOffers
{
  v2 = [(WLKPlayable *)self offerListing];
  v3 = [v2 storeOffers];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(WLKPlayable *)self playableID];
    id v6 = [v4 playableID];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [(WLKPlayable *)self canonicalID];
      int v8 = [v4 canonicalID];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_playableID hash];
  return [(NSString *)self->_canonicalID hash] ^ v3;
}

- (id)playPunchoutURL
{
  return [(NSDictionary *)self->_punchoutUrls objectForKey:@"play"];
}

- (id)openPunchoutURL
{
  return [(NSDictionary *)self->_punchoutUrls objectForKey:@"open"];
}

- (WLKStoreOffer)bestStoreBuyOffer
{
  v2 = [(WLKPlayable *)self offerListing];
  NSUInteger v3 = [v2 bestStoreBuyOffer];

  return (WLKStoreOffer *)v3;
}

- (WLKStoreOffer)bestStoreRentalOffer
{
  v2 = [(WLKPlayable *)self offerListing];
  NSUInteger v3 = [v2 bestStoreRentalOffer];

  return (WLKStoreOffer *)v3;
}

- (WLKStoreOffer)bestStoreSubscriptionOffer
{
  v2 = [(WLKPlayable *)self subscriptionOffers];
  NSUInteger v3 = [v2 firstObject];

  return (WLKStoreOffer *)v3;
}

- (id)_localesArrayForDictionary:(id)a3 andKey:(id)a4
{
  id v4 = objc_msgSend(a3, "wlk_arrayForKey:", a4);
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__WLKPlayable__localesArrayForDictionary_andKey___block_invoke;
    v9[3] = &unk_1E620AD40;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v9];
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __49__WLKPlayable__localesArrayForDictionary_andKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[WLKLocale alloc] initWithDictionary:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (NSString)playableID
{
  return self->_playableID;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (int64_t)contentSourceType
{
  return self->_contentSourceType;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (BOOL)isEntitledAnywhere
{
  return self->_entitledAnywhere;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (BOOL)isiTunes
{
  return self->_itunes;
}

- (int64_t)airingType
{
  return self->_airingType;
}

- (WLKBasicContentMetadata)content
{
  return self->_content;
}

- (NSArray)adLocales
{
  return self->_adLocales;
}

- (NSArray)audioTrackLocales
{
  return self->_audioTrackLocales;
}

- (NSArray)audioTrackFormats
{
  return self->_audioTrackFormats;
}

- (NSArray)closedCaptionLocales
{
  return self->_closedCaptionLocales;
}

- (NSArray)SDHLocales
{
  return self->_SDHLocales;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (WLKLocale)primaryLocale
{
  return self->_primaryLocale;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)externalServiceID
{
  return self->_externalServiceID;
}

- (BOOL)isSubtitled
{
  return self->_subtitled;
}

- (NSArray)subtitledLocales
{
  return self->_subtitledLocales;
}

- (NSString)videoQuality
{
  return self->_videoQuality;
}

- (NSString)videoColorRange
{
  return self->_videoColorRange;
}

- (NSDate)endAirTime
{
  return self->_endAirTime;
}

- (NSDate)startAirTime
{
  return self->_startAirTime;
}

- (WLKPlayEvent)playEvent
{
  return self->_playEvent;
}

- (NSURL)tvAppDeeplinkURL
{
  return self->_tvAppDeeplinkURL;
}

- (NSDictionary)punchoutUrls
{
  return self->_punchoutUrls;
}

- (WLKComingSoonInfo)comingSoonInfo
{
  return self->_comingSoonInfo;
}

- (NSArray)movieClips
{
  return self->_movieClips;
}

- (NSArray)subscriptionOffers
{
  return self->_subscriptionOffers;
}

- (WLKOfferListing)offerListing
{
  return self->_offerListing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerListing, 0);
  objc_storeStrong((id *)&self->_subscriptionOffers, 0);
  objc_storeStrong((id *)&self->_movieClips, 0);
  objc_storeStrong((id *)&self->_comingSoonInfo, 0);
  objc_storeStrong((id *)&self->_punchoutUrls, 0);
  objc_storeStrong((id *)&self->_tvAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_playEvent, 0);
  objc_storeStrong((id *)&self->_startAirTime, 0);
  objc_storeStrong((id *)&self->_endAirTime, 0);
  objc_storeStrong((id *)&self->_videoColorRange, 0);
  objc_storeStrong((id *)&self->_videoQuality, 0);
  objc_storeStrong((id *)&self->_subtitledLocales, 0);
  objc_storeStrong((id *)&self->_externalServiceID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_primaryLocale, 0);
  objc_storeStrong((id *)&self->_SDHLocales, 0);
  objc_storeStrong((id *)&self->_closedCaptionLocales, 0);
  objc_storeStrong((id *)&self->_audioTrackFormats, 0);
  objc_storeStrong((id *)&self->_audioTrackLocales, 0);
  objc_storeStrong((id *)&self->_adLocales, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_playableID, 0);
}

@end