@interface VUIVideosPlayable
+ (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3;
+ (id)_sharedPlayableAllowList;
+ (id)knownAudioVariantIDs;
+ (id)videosPlayableFromSerializedData:(id)a3;
+ (id)videosPlayableFromSerializedSharedData:(id)a3;
+ (id)videosPlayablesFromDictionaries:(id)a3 andMetadataDictionary:(id)a4;
- (BOOL)containsEligiblePlaybackMode;
- (BOOL)disableScrubbing;
- (BOOL)fullscreenTransferEligible;
- (BOOL)isAmbientVideo;
- (BOOL)isCowatchingProhibited;
- (BOOL)isEligibleForMultiview;
- (BOOL)isFamilySharingContent;
- (BOOL)isKeyPlayAvailable;
- (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3;
- (BOOL)isMovie;
- (BOOL)isRental;
- (BOOL)isSubscription;
- (BOOL)isiTunesPurchaseOrRental;
- (BOOL)makeAdditionalPlayerTabsRequest;
- (BOOL)playsFromStartOfLiveStream;
- (BOOL)reportVPAFWhenPlayingInBackground;
- (BOOL)sendLocationToPlaybackKeyServerWhenOptedIn;
- (BOOL)sendMescalHeaderToPlaybackKeyServer;
- (BOOL)supportsStartOver;
- (BOOL)useSharedPlayableForCowatching;
- (NSArray)knownAudioVariantIDs;
- (NSArray)playbackModes;
- (NSArray)startTimeInfos;
- (NSDate)mainContentRelativeResumeTimeTimestamp;
- (NSDate)resumeTimeTimestamp;
- (NSDictionary)fpsAdditionalServerParams;
- (NSDictionary)liveSportsPostPlayShelfFetchPolicy;
- (NSDictionary)mediaMetrics;
- (NSDictionary)vpafMetrics;
- (NSNumber)autoExitOnBroadcastEndInSeconds;
- (NSNumber)frequencyOfAgeConfirmation;
- (NSNumber)mainContentRelativeResumeTime;
- (NSNumber)rentalID;
- (NSNumber)repeatLoopCount;
- (NSNumber)requiredAgeForPlayback;
- (NSNumber)resumeTime;
- (NSString)adamID;
- (NSString)bookmarkID;
- (NSString)buyParams;
- (NSString)canonicalID;
- (NSString)channelID;
- (NSString)channelName;
- (NSString)cowatchingProhibitedReason;
- (NSString)externalID;
- (NSString)externalServiceID;
- (NSString)groupActivityDay;
- (NSString)hlsProgramID;
- (NSString)liveStreamServiceID;
- (NSString)locale;
- (NSString)mediaType;
- (NSString)playablePassThrough;
- (NSString)preferredAudioLanguageCode;
- (NSString)preferredPlaybackMode;
- (NSString)referenceID;
- (NSString)rtcServiceIdentifier;
- (NSString)seasonAdamID;
- (NSString)seasonCanonicalID;
- (NSString)sharedWatchId;
- (NSString)showAdamID;
- (NSString)showCanonicalID;
- (NSString)utsEntityType;
- (NSURL)artworkURL;
- (NSURL)downloadURL;
- (NSURL)fpsCertificateURL;
- (NSURL)fpsKeyServerURL;
- (NSURL)fpsNonceURL;
- (NSURL)hlsURL;
- (NSURL)playbackURL;
- (NSURL)previewArtwork;
- (NSURL)scrubVideoURL;
- (NSURL)sharedWatchUrl;
- (NSURL)tvAppDeeplinkURL;
- (VUIContentMetadata)metadata;
- (VUIExtrasInfo)extrasInfo;
- (VUIRouterDataSource)upsellRouterDataSource;
- (VUIVideosPlayable)initWithDictionary:(id)a3 andMetadataDictionary:(id)a4;
- (id)_allPlaybackModes;
- (id)serializedData;
- (id)serializedSharedData;
- (unint64_t)playableType;
- (unint64_t)sourceRef;
- (void)setHlsURL:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setVpafMetrics:(id)a3;
@end

@implementation VUIVideosPlayable

- (VUIVideosPlayable)initWithDictionary:(id)a3 andMetadataDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VUIVideosPlayable;
  v9 = [(VUIVideosPlayable *)&v13 init];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v9->_videosPlayableDict, a3);
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [[VUIContentMetadata alloc] initWithDictionary:v8];
          metadata = v9->_metadata;
          v9->_metadata = v10;
        }
      }
    }
  }

  return v9;
}

+ (id)videosPlayablesFromDictionaries:(id)a3 andMetadataDictionary:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count])
  {
    id v7 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v14 = [VUIVideosPlayable alloc];
          v15 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:](v14, "initWithDictionary:andMetadataDictionary:", v13, v6, (void)v18);
          [v7 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }
  v16 = objc_msgSend(v7, "copy", (void)v18);

  return v16;
}

+ (id)_sharedPlayableAllowList
{
  if (_sharedPlayableAllowList_onceToken != -1) {
    dispatch_once(&_sharedPlayableAllowList_onceToken, &__block_literal_global_101);
  }
  v2 = (void *)_sharedPlayableAllowList_allowList;
  return v2;
}

void __45__VUIVideosPlayable__sharedPlayableAllowList__block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"hlsUrl";
  v2[1] = @"useSharedPlayableForCowatching";
  v2[2] = @"mediaType";
  v2[3] = @"fpsKeyServerUrl";
  v2[4] = @"fpsCertificateUrl";
  v2[5] = @"fpsKeyServerQueryParameters";
  v2[6] = @"disableScrubbing";
  v2[7] = @"vpafMetrics";
  v2[8] = @"playbackModes";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)_sharedPlayableAllowList_allowList;
  _sharedPlayableAllowList_allowList = v0;
}

- (id)serializedData
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [(VUIContentMetadata *)self->_metadata backingDictionary];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v6 = v5;

  videosPlayableDict = self->_videosPlayableDict;
  v12[0] = @"videosPlayable";
  v12[1] = @"contentMetadata";
  v13[0] = videosPlayableDict;
  v13[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v11 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v11];

  return v9;
}

- (id)serializedSharedData
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(id)objc_opt_class() _sharedPlayableAllowList];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [(NSDictionary *)self->_videosPlayableDict objectForKeyedSubscript:v9];
        objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [(VUIContentMetadata *)self->_metadata backingDictionary];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v14 = v13;

  v23[0] = @"videosPlayable";
  v23[1] = @"contentMetadata";
  v24[0] = v3;
  v24[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  uint64_t v18 = 0;
  v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:&v18];

  return v16;
}

+ (id)videosPlayableFromSerializedData:(id)a3
{
  uint64_t v8 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v8];
  v4 = objc_msgSend(v3, "vui_dictionaryForKey:", @"videosPlayable");
  uint64_t v5 = objc_msgSend(v3, "vui_dictionaryForKey:", @"contentMetadata");
  uint64_t v6 = [[VUIVideosPlayable alloc] initWithDictionary:v4 andMetadataDictionary:v5];

  return v6;
}

+ (id)videosPlayableFromSerializedSharedData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v25];
  id v5 = v25;
  uint64_t v6 = objc_msgSend(v4, "vui_dictionaryForKey:", @"videosPlayable");
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend(a1, "_sharedPlayableAllowList", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [v6 objectForKeyedSubscript:v13];
        objc_msgSend(v7, "vui_setObjectIfNotNil:forKey:", v14, v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }

  v15 = objc_msgSend(v4, "vui_dictionaryForKey:", @"contentMetadata");
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v18 = v17;

  long long v19 = [[VUIVideosPlayable alloc] initWithDictionary:v7 andMetadataDictionary:v18];
  return v19;
}

- (BOOL)isMovie
{
  v2 = [(VUIVideosPlayable *)self mediaType];
  v3 = [v2 lowercaseString];
  char v4 = [v3 isEqualToString:@"movie"];

  return v4;
}

- (NSURL)artworkURL
{
  v3 = [(VUIVideosPlayable *)self metadata];
  char v4 = [v3 artworkURLFormat];

  if (v4 && [v4 length])
  {
    id v5 = [(VUIVideosPlayable *)self metadata];
    uint64_t v6 = [v5 artworkWidth];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = [(VUIVideosPlayable *)self metadata];
    uint64_t v10 = [v9 artworkHeight];
  }
  else
  {
    uint64_t v11 = [(VUIVideosPlayable *)self metadata];
    uint64_t v12 = [v11 previewFrameURLFormat];

    uint64_t v13 = [(VUIVideosPlayable *)self metadata];
    v14 = [v13 previewFrameWidth];
    [v14 doubleValue];
    double v8 = v15;

    uint64_t v9 = [(VUIVideosPlayable *)self metadata];
    uint64_t v10 = [v9 previewFrameHeight];
    char v4 = (void *)v12;
  }
  [v10 doubleValue];
  double v17 = v16;

  uint64_t v18 = 0;
  if ([v4 length] && v8 > 0.0 && v17 > 0.0)
  {
    if (v8 >= v17) {
      double v19 = v8;
    }
    else {
      double v19 = v17;
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB3CC0], "URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:", v4, @"jpeg", 0, 0, 0, 0, v8 * (400.0 / v19), v17 * (400.0 / v19), 0.0);
  }

  return (NSURL *)v18;
}

- (NSURL)playbackURL
{
  v3 = [(VUIVideosPlayable *)self hlsURL];
  if (!v3)
  {
    v3 = [(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"playbackUrl"];
  }
  return (NSURL *)v3;
}

- (NSURL)sharedWatchUrl
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"sharedWatchUrl"];
}

- (NSString)sharedWatchId
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIVideosPlayable *)self sharedWatchUrl];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29088]);
    id v5 = [(VUIVideosPlayable *)self sharedWatchUrl];
    uint64_t v6 = (void *)[v4 initWithURL:v5 resolvingAgainstBaseURL:1];

    if (v6)
    {
      double v7 = [v6 queryItems];
      double v8 = (void *)[v7 mutableCopy];
      uint64_t v9 = v8;
      if (v8) {
        id v10 = v8;
      }
      else {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      uint64_t v12 = v10;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            double v19 = objc_msgSend(v18, "name", (void)v22);
            char v20 = [v19 isEqualToString:@"sharedWatchId"];

            if (v20)
            {
              uint64_t v11 = [v18 value];

              goto LABEL_20;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_18;
  }
  if (![(VUIVideosPlayable *)self useSharedPlayableForCowatching])
  {
LABEL_18:
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [(VUIVideosPlayable *)self playbackURL];
  uint64_t v11 = [v6 absoluteString];
LABEL_20:

LABEL_21:
  return (NSString *)v11;
}

- (BOOL)playsFromStartOfLiveStream
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"playsFromStartOfLiveStream" defaultValue:0];
}

- (BOOL)useSharedPlayableForCowatching
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"useSharedPlayableForCowatching" defaultValue:0];
}

- (BOOL)isCowatchingProhibited
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"isCowatchingProhibited" defaultValue:0];
}

- (NSString)cowatchingProhibitedReason
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"cowatchingProhibitedReason"];
}

- (NSString)groupActivityDay
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"groupActivityDay"];
}

- (NSURL)hlsURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"hlsUrl"];
}

- (void)setHlsURL:(id)a3
{
  if (a3)
  {
    videosPlayableDict = self->_videosPlayableDict;
    id v5 = a3;
    id v8 = (id)[(NSDictionary *)videosPlayableDict mutableCopy];
    [v8 setObject:v5 forKey:@"hlsUrl"];

    uint64_t v6 = (NSDictionary *)[v8 copy];
    double v7 = self->_videosPlayableDict;
    self->_videosPlayableDict = v6;
  }
}

- (NSURL)downloadURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"hlsDownloadUrl"];
}

- (NSURL)fpsKeyServerURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"fpsKeyServerUrl"];
}

- (NSURL)fpsCertificateURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"fpsCertificateUrl"];
}

- (NSDictionary)fpsAdditionalServerParams
{
  return (NSDictionary *)[(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"fpsKeyServerQueryParameters"];
}

- (NSURL)fpsNonceURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"fpsNonceServerUrl"];
}

- (NSString)buyParams
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"buyParams"];
}

- (NSURL)scrubVideoURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"scrubVideoUrl"];
}

- (NSString)mediaType
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"mediaType"];
}

- (NSString)utsEntityType
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"utsEntityType"];
}

- (NSNumber)resumeTime
{
  return (NSNumber *)[(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"resumeTime"];
}

- (NSNumber)mainContentRelativeResumeTime
{
  return (NSNumber *)[(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"mainContentRelativeResumeTime"];
}

- (NSDate)mainContentRelativeResumeTimeTimestamp
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"mainContentRelativeResumeTimeTimeStamp"];
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    uint64_t v6 = [v4 dateWithTimeIntervalSince1970:v5 / 1000.0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSArray)startTimeInfos
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(VUIVideosPlayable *)self resumeTime];
  double v5 = [(VUIVideosPlayable *)self mainContentRelativeResumeTime];
  uint64_t v6 = [(VUIVideosPlayable *)self referenceID];
  if (v4)
  {
    double v7 = [VUIMediaStartTimeInfo alloc];
    id v8 = [(VUIVideosPlayable *)self resumeTimeTimestamp];
    uint64_t v9 = [(VUIMediaStartTimeInfo *)v7 initWithStartTime:v4 timestamp:v8 type:0 source:@"UTS/JS"];

    [v3 addObject:v9];
  }
  if (v5)
  {
    id v10 = [VUIMediaStartTimeInfo alloc];
    uint64_t v11 = [(VUIVideosPlayable *)self mainContentRelativeResumeTimeTimestamp];
    uint64_t v12 = [(VUIMediaStartTimeInfo *)v10 initWithStartTime:v5 timestamp:v11 type:1 source:@"UTS/JS"];

    [v3 addObject:v12];
  }
  if ([v6 length])
  {
    id v13 = +[VUIStreamingBookmarkCache sharedInstance];
    id v23 = 0;
    id v24 = 0;
    id v21 = 0;
    id v22 = 0;
    [v13 resumeTimeInfoForReferenceID:v6 outAbsoluteResumeTime:&v24 outAbsoluteTimestamp:&v23 outMainContentRelativeResumeTime:&v22 outMainContentRelativeTimestamp:&v21];
    id v14 = v24;
    id v15 = v23;
    id v16 = v22;
    id v17 = v21;

    if (v14)
    {
      uint64_t v18 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v14 timestamp:v15 type:0 source:@"VUIStreamingBookmarkCache"];
      [v3 addObject:v18];
    }
    if (v16)
    {
      double v19 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v16 timestamp:v17 type:1 source:@"VUIStreamingBookmarkCache"];
      [v3 addObject:v19];
    }
  }

  return (NSArray *)v3;
}

- (NSDate)resumeTimeTimestamp
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"resumeTimeTimeStamp"];
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    uint64_t v6 = [v4 dateWithTimeIntervalSince1970:v5 / 1000.0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSString)bookmarkID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"bookmarkId"];
}

- (BOOL)isFamilySharingContent
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"sharedPurchase" defaultValue:0];
}

- (NSString)externalID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"externalId"];
}

- (NSNumber)rentalID
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"rentalId"];
  id v3 = v2;
  if (v2 && [v2 isEqualToNumber:&unk_1F3F3D208])
  {

    id v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)isRental
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"isRental" defaultValue:0];
}

- (NSString)adamID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"adamId"];
}

- (NSString)hlsProgramID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"hlsProgramID"];
}

- (NSString)showAdamID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"showAdamID"];
}

- (NSString)seasonAdamID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"seasonAdamID"];
}

- (NSString)showCanonicalID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"showCanonicalId"];
}

- (NSString)seasonCanonicalID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"seasonCanonicalId"];
}

- (NSString)canonicalID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"canonicalId"];
}

- (NSString)channelID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"channelId"];
}

- (NSString)channelName
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"channelName"];
}

- (BOOL)isSubscription
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"isApSubscription" defaultValue:0];
}

- (NSDictionary)vpafMetrics
{
  return (NSDictionary *)[(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"vpafMetrics"];
}

- (void)setVpafMetrics:(id)a3
{
  if (a3)
  {
    videosPlayableDict = self->_videosPlayableDict;
    id v5 = a3;
    id v8 = (id)[(NSDictionary *)videosPlayableDict mutableCopy];
    [v8 setObject:v5 forKey:@"vpafMetrics"];

    uint64_t v6 = (NSDictionary *)[v8 copy];
    double v7 = self->_videosPlayableDict;
    self->_videosPlayableDict = v6;
  }
}

- (NSDictionary)mediaMetrics
{
  return (NSDictionary *)[(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"mediaMetrics"];
}

- (NSString)liveStreamServiceID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"liveStreamServiceId"];
}

- (NSString)externalServiceID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"externalServiceId"];
}

- (BOOL)disableScrubbing
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"disableScrubbing" defaultValue:0];
}

- (NSString)rtcServiceIdentifier
{
  id v3 = [(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"rtcServiceIdentifier"];
  if (![v3 length])
  {
    if ([(VUIVideosPlayable *)self isiTunesPurchaseOrRental])
    {
      if ([(VUIVideosPlayable *)self isRental])
      {
        id v4 = @"com.apple.videos.movies.rental.cloud";
      }
      else
      {
        double v7 = [(VUIVideosPlayable *)self mediaType];
        int v8 = [v7 isEqualToString:@"Movie"];
        uint64_t v9 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_cloud;
        if (!v8) {
          uint64_t v9 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_cloud;
        }
        id v4 = *v9;

        id v3 = v7;
      }
    }
    else
    {
      id v5 = [(VUIVideosPlayable *)self mediaMetrics];
      uint64_t v6 = [v5 count];

      if (!v6) {
        goto LABEL_11;
      }
      id v4 = @"com.apple.tv.external";
    }

    id v3 = v4;
  }
LABEL_11:
  return (NSString *)v3;
}

- (BOOL)sendLocationToPlaybackKeyServerWhenOptedIn
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"sendLocationToPlaybackKeyServerWhenOptedIn" defaultValue:0];
}

- (BOOL)sendMescalHeaderToPlaybackKeyServer
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"sendMescalHeaderToPlaybackKeyServer" defaultValue:0];
}

- (id)_allPlaybackModes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NSDictionary *)self->_videosPlayableDict vui_arrayForKey:@"playbackModes"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = [v9 isEqualToString:@"Monoscopic"];
        uint64_t v11 = @"Monoscopic";
        if ((v10 & 1) == 0)
        {
          char v12 = [v9 isEqualToString:@"Stereoscopic"];
          uint64_t v11 = @"Stereoscopic";
          if ((v12 & 1) == 0)
          {
            char v13 = [v9 isEqualToString:@"Immersive"];
            uint64_t v11 = @"Immersive";
            if ((v13 & 1) == 0)
            {
              int v14 = [v9 isEqualToString:@"BlendedImmersive"];
              uint64_t v11 = @"Blended";
              if (!v14) {
                continue;
              }
            }
          }
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)playbackModes
{
  return 0;
}

- (NSString)preferredPlaybackMode
{
  return 0;
}

- (NSString)locale
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"locale"];
}

- (BOOL)supportsStartOver
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"supportsStartOver" defaultValue:0];
}

- (NSString)preferredAudioLanguageCode
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"preferredAudioLanguageCode"];
}

- (unint64_t)sourceRef
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"sourceRef"];
  if (![v2 length]) {
    goto LABEL_12;
  }
  if (([v2 isEqualToString:@"sharedWatchJoin"] & 1) == 0)
  {
    if ([v2 isEqualToString:@"sharedWatchJoinBinge"])
    {
      id v4 = VUIDefaultLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "JS provided legacy sharedWatchJoinBinge param", v6, 2u);
      }

      goto LABEL_9;
    }
    if ([v2 isEqualToString:@"sharedWatchPostPlayBinge"])
    {
LABEL_9:
      unint64_t v3 = 2;
      goto LABEL_13;
    }
    if ([v2 isEqualToString:@"sharedWatchPostPlayNonBinge"])
    {
      unint64_t v3 = 3;
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v3 = 0;
    goto LABEL_13;
  }
  unint64_t v3 = 1;
LABEL_13:

  return v3;
}

- (unint64_t)playableType
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"playableType"];
  if (![v2 length]) {
    goto LABEL_8;
  }
  if (([v2 isEqualToString:@"Event"] & 1) == 0)
  {
    if ([v2 isEqualToString:@"EbsEvent"])
    {
      unint64_t v3 = 2;
      goto LABEL_9;
    }
    if ([v2 isEqualToString:@"Vod"])
    {
      unint64_t v3 = 3;
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v3 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = 1;
LABEL_9:

  return v3;
}

- (NSString)referenceID
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"referenceId"];
}

- (VUIExtrasInfo)extrasInfo
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"extras"];
  if ([v2 count]) {
    unint64_t v3 = [[VUIExtrasInfo alloc] initWithDictionary:v2];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSURL)tvAppDeeplinkURL
{
  return (NSURL *)[(NSDictionary *)self->_videosPlayableDict vui_URLForKey:@"url"];
}

- (NSNumber)requiredAgeForPlayback
{
  return (NSNumber *)[(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"requiredAgeForPlayback"];
}

- (NSNumber)frequencyOfAgeConfirmation
{
  return (NSNumber *)[(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"frequencyOfAgeConfirmation"];
}

- (BOOL)isiTunesPurchaseOrRental
{
  unint64_t v3 = [(VUIVideosPlayable *)self buyParams];
  uint64_t v4 = [(VUIVideosPlayable *)self rentalID];
  BOOL v5 = [(VUIVideosPlayable *)self isFamilySharingContent];
  if ([v3 length] | v4) {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)fullscreenTransferEligible
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"continuesFromPreview" defaultValue:0];
}

- (NSArray)knownAudioVariantIDs
{
  v2 = objc_opt_class();
  return (NSArray *)[v2 knownAudioVariantIDs];
}

+ (id)knownAudioVariantIDs
{
  v2 = +[VUIFeaturesConfiguration sharedInstance];
  unint64_t v3 = [v2 nowPlayingConfig];
  uint64_t v4 = [v3 mediaCharacteristicsToLocalize];

  return v4;
}

- (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() isMediaCharacteristicAnAudioVariantID:v3];

  return v4;
}

+ (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [a1 knownAudioVariantIDs];
    char v6 = [v5 containsObject:v4];

    if (v6)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      int v8 = +[VUIFeaturesConfiguration sharedInstance];
      uint64_t v9 = [v8 nowPlayingConfig];
      char v10 = [v9 audioIDPrefixes];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v11 = v10;
      uint64_t v7 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v12 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend(v4, "hasPrefix:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
            {
              LOBYTE(v7) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v7 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (VUIRouterDataSource)upsellRouterDataSource
{
  v2 = [(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"upsellRouterDataSource"];
  id v3 = [[VUIRouterDataSource alloc] initWithRouterData:v2 appContext:0];

  return v3;
}

- (BOOL)isAmbientVideo
{
  v2 = [(VUIVideosPlayable *)self utsEntityType];
  char v3 = [v2 isEqualToString:@"AmbientVideo"];

  return v3;
}

- (NSNumber)repeatLoopCount
{
  return (NSNumber *)[(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"repeatLoopCount"];
}

- (BOOL)isEligibleForMultiview
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"isEligibleForMultiView" defaultValue:0];
}

- (NSString)playablePassThrough
{
  return (NSString *)[(NSDictionary *)self->_videosPlayableDict vui_stringForKey:@"playablePassThrough"];
}

- (BOOL)isKeyPlayAvailable
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"isKeyPlayAvailable" defaultValue:0];
}

- (BOOL)makeAdditionalPlayerTabsRequest
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"makeAdditionalPlayerTabsRequest" defaultValue:0];
}

- (BOOL)containsEligiblePlaybackMode
{
  v2 = [(VUIVideosPlayable *)self _allPlaybackModes];
  BOOL v3 = ([v2 containsObject:@"Monoscopic"] & 1) != 0 || objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)reportVPAFWhenPlayingInBackground
{
  return [(NSDictionary *)self->_videosPlayableDict vui_BOOLForKey:@"reportVPAFWhenPlayingInBackground" defaultValue:0];
}

- (NSDictionary)liveSportsPostPlayShelfFetchPolicy
{
  return (NSDictionary *)[(NSDictionary *)self->_videosPlayableDict vui_dictionaryForKey:@"liveSportsPostPlayShelfFetchPolicy"];
}

- (NSNumber)autoExitOnBroadcastEndInSeconds
{
  BOOL v3 = [(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"autoExitOnBroadcastEndInSeconds"];

  if (v3)
  {
    id v4 = [(NSDictionary *)self->_videosPlayableDict vui_numberForKey:@"autoExitOnBroadcastEndInSeconds"];
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28ED0];
    char v6 = +[VUIFeaturesConfiguration sharedInstance];
    uint64_t v7 = [v6 livePostPlayConfig];
    [v7 dismissPlaybackDelay];
    id v4 = objc_msgSend(v5, "numberWithDouble:");
  }
  return (NSNumber *)v4;
}

- (NSURL)previewArtwork
{
  return self->_previewArtwork;
}

- (VUIContentMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_previewArtwork, 0);
  objc_storeStrong((id *)&self->_videosPlayableDict, 0);
}

@end