@interface VUIContentMetadata
+ (id)validMediaTags;
- (BOOL)isAdultContent;
- (BOOL)isDownloadable;
- (BOOL)isEligibleForInfoTab;
- (BOOL)isEligibleForPlayerTabs;
- (BOOL)isFederated;
- (BOOL)isSharedWatchEnabled;
- (NSArray)roles;
- (NSDate)releasedDate;
- (NSDate)rentalExpiration;
- (NSDictionary)mediaShareMetadata;
- (NSDictionary)showMediaShareMetadata;
- (NSNumber)artworkHeight;
- (NSNumber)artworkWidth;
- (NSNumber)commonSenseRecommendedAge;
- (NSNumber)duration;
- (NSNumber)endTime;
- (NSNumber)episodeIndexInSeries;
- (NSNumber)episodeNumber;
- (NSNumber)fractionalEpisodeNumber;
- (NSNumber)has3D;
- (NSNumber)hasADLocales;
- (NSNumber)hasClosedCaptions;
- (NSNumber)hasDolbyAtmos;
- (NSNumber)hasEventEnded;
- (NSNumber)hasHighMotion;
- (NSNumber)hasImmersive;
- (NSNumber)hasSDHLocales;
- (NSNumber)isBlackedOut;
- (NSNumber)isUpgradeEligible;
- (NSNumber)numberOfSeasons;
- (NSNumber)previewFrameHeight;
- (NSNumber)previewFrameWidth;
- (NSNumber)ratingValue;
- (NSNumber)rentalDurationInMilliseconds;
- (NSNumber)rentalPlaybackDurationInMilliseconds;
- (NSNumber)scheduleEndTime;
- (NSNumber)scheduleStartTime;
- (NSNumber)seasonNumber;
- (NSNumber)showArtworkHeight;
- (NSNumber)showArtworkWidth;
- (NSNumber)startTime;
- (NSNumber)tomatoPercentage;
- (NSNumber)transportBarEndTime;
- (NSNumber)transportBarStartTime;
- (NSNumber)videoDynamicRange;
- (NSNumber)videoResolutionClass;
- (NSString)artworkURLFormat;
- (NSString)channelName;
- (NSString)contentUnavailabilityText;
- (NSString)formattedReleaseDate;
- (NSString)gameStartTime;
- (NSString)gameVenue;
- (NSString)genre;
- (NSString)highMotionText;
- (NSString)immersiveText;
- (NSString)leagueName;
- (NSString)leagueShortName;
- (NSString)liveTextBadge;
- (NSString)mediaDescription;
- (NSString)previewFrameURLFormat;
- (NSString)ratingAuxiliaryName;
- (NSString)ratingDomain;
- (NSString)ratingName;
- (NSString)ratingSystem;
- (NSString)rentalPurchasedTimestamp;
- (NSString)rentalStartedWatchingTimestamp;
- (NSString)seasonCanonicalId;
- (NSString)seasonTitle;
- (NSString)shootoutsText;
- (NSString)showArtworkURLFormat;
- (NSString)showCanonicalId;
- (NSString)showTitle;
- (NSString)sportName;
- (NSString)studio;
- (NSString)subtitle;
- (NSString)teamAbbreviation;
- (NSString)timeTextBadge;
- (NSString)title;
- (NSString)type;
- (NSString)venueAddress;
- (NSString)venueName;
- (NSString)versionCount;
- (VUIContentMetadata)initWithDictionary:(id)a3;
- (VUIContentMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 artworkURL:(id)a8;
- (VUIUpsellOnExitPolicy)upsellOnExitPolicy;
- (id)backingDictionary;
- (id)rawBackingDictionary;
- (unint64_t)contentType;
- (unint64_t)tomatoFreshness;
@end

@implementation VUIContentMetadata

+ (id)validMediaTags
{
  if (validMediaTags_onceToken != -1) {
    dispatch_once(&validMediaTags_onceToken, &__block_literal_global_77);
  }
  v2 = (void *)validMediaTags__validMediaTags;
  return v2;
}

void __36__VUIContentMetadata_validMediaTags__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"hasAD";
  v2[1] = @"hasSDH";
  v2[2] = @"hasImmersive";
  v2[3] = @"has3D";
  v2[4] = @"hasDolbyAtmos";
  v2[5] = @"isBlackedOut";
  v2[6] = @"isUpgradeEligible";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)validMediaTags__validMediaTags;
  validMediaTags__validMediaTags = v0;
}

- (VUIContentMetadata)initWithDictionary:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIContentMetadata;
  v5 = [(VUIContentMetadata *)&v11 init];
  if (v5)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v4 copy];
      metadataDictionary = v5->_metadataDictionary;
      v5->_metadataDictionary = (NSDictionary *)v6;
    }
    v12[0] = @"Episode";
    v12[1] = @"Movie";
    v13[0] = &unk_1F3F3CEF0;
    v13[1] = &unk_1F3F3CF08;
    v12[2] = @"Show";
    v12[3] = @"Season";
    v13[2] = &unk_1F3F3CF20;
    v13[3] = &unk_1F3F3CF38;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
    contentTypeMap = v5->_contentTypeMap;
    v5->_contentTypeMap = (NSDictionary *)v8;
  }
  return v5;
}

- (VUIContentMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 artworkURL:(id)a8
{
  v14 = (void *)MEMORY[0x1E4F1CA60];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v14 dictionary];
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v20, @"title");

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v19, @"showTitle");
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v18, @"seasonTitle");

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v17, @"seasonNumber");
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v16, @"episodeNumber");

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v15, @"artwork");
  v22 = [(VUIContentMetadata *)self initWithDictionary:v21];

  return v22;
}

- (id)backingDictionary
{
  v2 = (void *)[(NSDictionary *)self->_metadataDictionary copy];
  return v2;
}

- (id)rawBackingDictionary
{
  return self->_metadataDictionary;
}

- (NSString)type
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"type"];
}

- (unint64_t)contentType
{
  v3 = [(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"type"];
  id v4 = [(NSDictionary *)self->_contentTypeMap vui_numberForKey:v3];
  v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 integerValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)artworkURLFormat
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"artwork"];
  v3 = objc_msgSend(v2, "vui_stringForKey:", @"url");

  return (NSString *)v3;
}

- (NSNumber)artworkWidth
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"artwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"width");

  return (NSNumber *)v3;
}

- (NSNumber)artworkHeight
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"artwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"height");

  return (NSNumber *)v3;
}

- (NSString)previewFrameURLFormat
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"previewFrameArtwork"];
  v3 = objc_msgSend(v2, "vui_stringForKey:", @"url");

  return (NSString *)v3;
}

- (NSNumber)previewFrameWidth
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"previewFrameArtwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"width");

  return (NSNumber *)v3;
}

- (NSNumber)previewFrameHeight
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"previewFrameArtwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"height");

  return (NSNumber *)v3;
}

- (NSString)showArtworkURLFormat
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"showArtwork"];
  v3 = objc_msgSend(v2, "vui_stringForKey:", @"url");

  return (NSString *)v3;
}

- (NSNumber)showArtworkWidth
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"showArtwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"width");

  return (NSNumber *)v3;
}

- (NSNumber)showArtworkHeight
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"showArtwork"];
  v3 = objc_msgSend(v2, "vui_numberForKey:", @"height");

  return (NSNumber *)v3;
}

- (NSString)genre
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"genreName"];
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"title"];
}

- (NSString)mediaDescription
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"description"];
}

- (NSDate)releasedDate
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"releaseDate"];
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    unint64_t v6 = [v4 dateWithTimeIntervalSince1970:v5 / 1000.0];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSString)formattedReleaseDate
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"formattedReleaseDate"];
}

- (NSDate)rentalExpiration
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"rentalExpiration"];
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    unint64_t v6 = [v4 dateWithTimeIntervalSince1970:v5 / 1000.0];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSNumber)rentalDurationInMilliseconds
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"rentalDurationInMilliseconds"];
}

- (NSNumber)rentalPlaybackDurationInMilliseconds
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"playbackDurationInMilliseconds"];
}

- (NSString)rentalPurchasedTimestamp
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"purchasedTimestamp"];
}

- (NSString)rentalStartedWatchingTimestamp
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"startedWatchingTimestamp"];
}

- (NSNumber)duration
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"duration"];
}

- (NSNumber)tomatoPercentage
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"tomatometerPercentage"];
}

- (unint64_t)tomatoFreshness
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"tomatometerFreshness"];
  if ([v2 length])
  {
    if ([v2 isEqualToString:@"Fresh"])
    {
      unint64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"CertifiedFresh"])
    {
      unint64_t v3 = 2;
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  else
  {
    unint64_t v3 = 3;
  }

  return v3;
}

- (NSNumber)commonSenseRecommendedAge
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"recommendedAge"];
}

- (NSNumber)videoResolutionClass
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"videoResolutionClass"];
  unint64_t v3 = [v2 lowercaseString];

  if (([v3 isEqualToString:@"4k"] & 1) != 0
    || ([v3 isEqualToString:@"uhd"] & 1) != 0)
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"hd"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:@"sd"];
  }
  double v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];

  return (NSNumber *)v5;
}

- (NSNumber)videoDynamicRange
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"videoDynamicRange"];
  unint64_t v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"dolbyvisionhdr"])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"hdr"])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"hdr10plus"])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:@"sdr"];
  }
  double v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];

  return (NSNumber *)v5;
}

- (NSNumber)hasClosedCaptions
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasClosedCaption"];
}

- (NSNumber)hasADLocales
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasAD"];
}

- (NSNumber)hasSDHLocales
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasSDH"];
}

- (NSNumber)hasImmersive
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasImmersive"];
}

- (NSString)immersiveText
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"immersiveText"];
}

- (NSNumber)hasHighMotion
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasHighMotion"];
}

- (NSString)highMotionText
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"highMotionText"];
}

- (NSNumber)has3D
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"has3D"];
}

- (NSNumber)hasDolbyAtmos
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasDolbyAtmos"];
}

- (NSNumber)isBlackedOut
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"isBlackedOut"];
}

- (NSNumber)isUpgradeEligible
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"isUpgradeEligible"];
}

- (NSString)ratingName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"ratingName"];
}

- (NSString)ratingAuxiliaryName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"ratingAuxiliaryName"];
}

- (NSString)ratingSystem
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"ratingSystem"];
}

- (NSString)ratingDomain
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"ratingDomain"];
}

- (NSNumber)episodeNumber
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"episodeNumber"];
}

- (NSNumber)fractionalEpisodeNumber
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"fractionalEpisodeNumber"];
}

- (NSNumber)episodeIndexInSeries
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"episodeIndex"];
}

- (NSNumber)seasonNumber
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"seasonNumber"];
}

- (NSString)seasonTitle
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"seasonTitle"];
}

- (NSNumber)numberOfSeasons
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"numberOfSeasons"];
}

- (NSString)showTitle
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"showTitle"];
}

- (BOOL)isAdultContent
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"isAdultContent" defaultValue:0];
}

- (NSNumber)ratingValue
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"ratingValue"];
}

- (NSString)showCanonicalId
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"showCanonicalId"];
}

- (NSString)seasonCanonicalId
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"seasonCanonicalId"];
}

- (NSString)subtitle
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"subtitle"];
}

- (NSString)versionCount
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"versionCount"];
}

- (NSString)teamAbbreviation
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"teamAbbreviation"];
}

- (BOOL)isSharedWatchEnabled
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"sharedWatchEnabled" defaultValue:0];
}

- (NSDictionary)mediaShareMetadata
{
  return (NSDictionary *)[(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"mediaShareMetadata"];
}

- (NSDictionary)showMediaShareMetadata
{
  return (NSDictionary *)[(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"showMediaShareMetadata"];
}

- (BOOL)isDownloadable
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"isDownloadable" defaultValue:0];
}

- (NSString)studio
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"studio"];
}

- (NSArray)roles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_metadataDictionary vui_arrayForKey:@"roles"];
  unint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [VUIRolesEntity alloc];
        objc_super v11 = -[VUIRolesEntity initWithDictionary:](v10, "initWithDictionary:", v9, (void)v13);
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)channelName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"channelName"];
}

- (BOOL)isFederated
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"isFederated" defaultValue:0];
}

- (BOOL)isEligibleForPlayerTabs
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"isEligibleForPlayerTabs" defaultValue:1];
}

- (BOOL)isEligibleForInfoTab
{
  return [(NSDictionary *)self->_metadataDictionary vui_BOOLForKey:@"isEligibleForInfoTab" defaultValue:1];
}

- (VUIUpsellOnExitPolicy)upsellOnExitPolicy
{
  v2 = [(NSDictionary *)self->_metadataDictionary vui_dictionaryForKey:@"upsellExitPolicy"];
  unint64_t v3 = [[VUIUpsellOnExitPolicy alloc] initWithDictionary:v2];

  return v3;
}

- (NSString)gameStartTime
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"gameStartTime"];
}

- (NSString)gameVenue
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"gameVenue"];
}

- (NSString)liveTextBadge
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"liveTextBadge"];
}

- (NSString)timeTextBadge
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"timeTextBadge"];
}

- (NSString)leagueShortName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"leagueShortName"];
}

- (NSString)leagueName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"leagueName"];
}

- (NSString)venueName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"venueName"];
}

- (NSString)venueAddress
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"venueAddr"];
}

- (NSString)sportName
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"sportName"];
}

- (NSNumber)startTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"startTime"];
}

- (NSNumber)endTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"endTime"];
}

- (NSNumber)hasEventEnded
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"hasEventEnded"];
}

- (NSNumber)scheduleStartTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"scheduleStartTime"];
}

- (NSNumber)scheduleEndTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"scheduleEndTime"];
}

- (NSNumber)transportBarStartTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"startTime"];
}

- (NSNumber)transportBarEndTime
{
  return (NSNumber *)[(NSDictionary *)self->_metadataDictionary vui_numberForKey:@"endTime"];
}

- (NSString)shootoutsText
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"shootoutsText"];
}

- (NSString)contentUnavailabilityText
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary vui_stringForKey:@"contentUnavailabilityText"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end