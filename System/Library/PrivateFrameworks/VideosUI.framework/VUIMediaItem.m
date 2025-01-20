@interface VUIMediaItem
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_mediaItemWithMPMediaItem:(id)a3;
+ (id)keyPathsForValuesAffectingPlayedState;
- (BOOL)allowsManualDownloadRenewal;
- (BOOL)isFamilySharingContent;
- (BOOL)renewsOfflineKeysAutomatically;
- (MPMediaItem)mediaPlayerMediaItem;
- (NSDate)availabilityEndDate;
- (NSDate)downloadExpirationDate;
- (NSDate)rentalExpirationDate;
- (NSNumber)assetType;
- (NSNumber)bookmark;
- (NSNumber)duration;
- (NSNumber)episodeIndexInSeries;
- (NSNumber)episodeNumber;
- (NSNumber)fractionalEpisodeNumber;
- (NSNumber)hasBeenPlayed;
- (NSNumber)isPlayable;
- (NSNumber)playCount;
- (NSNumber)rentalPlaybackDuration;
- (NSString)previewFrameImageIdentifier;
- (NSString)seasonCanonicalID;
- (NSString)seasonTitle;
- (NSString)showCanonicalID;
- (NSString)studio;
- (NSURL)extrasURL;
- (VUIMediaEntityIdentifier)seasonIdentifier;
- (VUIMediaItemCredits)credits;
- (id)creationDate;
- (id)description;
- (id)lastPlayedDate;
- (id)modifiedDate;
@end

@implementation VUIMediaItem

+ (id)_mediaItemWithMPMediaItem:(id)a3
{
  id v3 = a3;
  v4 = [VUIMPMediaItem alloc];
  v5 = +[VUIMediaLibraryManager defaultManager];
  v6 = [v5 deviceMediaLibrary];
  v7 = VUIMediaEntityFetchRequestAllPropertiesSet();
  v8 = [(VUIMPMediaItem *)v4 initWithMediaLibrary:v6 mediaItem:v3 requestedProperties:v7];

  return v8;
}

- (NSNumber)assetType
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"assetType"];
}

- (NSNumber)duration
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"duration"];
}

- (id)creationDate
{
  return [(VUIMediaEntity *)self _propertyValueForKey:@"creationDate"];
}

- (id)modifiedDate
{
  return [(VUIMediaEntity *)self _propertyValueForKey:@"modifiedDate"];
}

- (id)lastPlayedDate
{
  return [(VUIMediaEntity *)self _propertyValueForKey:@"lastPlayedDate"];
}

- (NSString)previewFrameImageIdentifier
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"previewFrameImageIdentifier"];
}

- (NSURL)extrasURL
{
  return (NSURL *)[(VUIMediaEntity *)self _propertyValueForKey:@"extrasURL"];
}

- (NSString)seasonTitle
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"seasonTitle"];
}

- (VUIMediaEntityIdentifier)seasonIdentifier
{
  return (VUIMediaEntityIdentifier *)[(VUIMediaEntity *)self _propertyValueForKey:@"seasonIdentifier"];
}

- (NSNumber)episodeNumber
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"episodeNumber"];
}

- (NSNumber)fractionalEpisodeNumber
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"fractionalEpisodeNumber"];
}

- (NSNumber)episodeIndexInSeries
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"episodeIndexInSeries"];
}

- (NSString)studio
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"studio"];
}

- (VUIMediaItemCredits)credits
{
  return (VUIMediaItemCredits *)[(VUIMediaEntity *)self _propertyValueForKey:@"credits"];
}

- (NSNumber)rentalPlaybackDuration
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"rentalPlaybackDuration"];
}

- (NSDate)rentalExpirationDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"rentalExpirationDate"];
}

- (NSNumber)hasBeenPlayed
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"hasBeenPlayed"];
}

- (NSNumber)playCount
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"playCount"];
}

- (NSNumber)bookmark
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"bookmark"];
}

- (NSDate)downloadExpirationDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"downloadExpirationDate"];
}

- (NSDate)availabilityEndDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"availabilityEndDate"];
}

- (BOOL)allowsManualDownloadRenewal
{
  v2 = [(VUIMediaEntity *)self _propertyValueForKey:@"allowsManualDownloadRenewal"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  v2 = [(VUIMediaEntity *)self _propertyValueForKey:@"renewsOfflineKeysAutomatically"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (MPMediaItem)mediaPlayerMediaItem
{
  return 0;
}

- (BOOL)isFamilySharingContent
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (automaticallyNotifiesObserversForKey____onceToken_0 != -1) {
    dispatch_once(&automaticallyNotifiesObserversForKey____onceToken_0, &__block_literal_global_104);
  }
  if ([(id)automaticallyNotifiesObserversForKey____keysToNotifyManually_0 containsObject:v4])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VUIMediaItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

void __53__VUIMediaItem_automaticallyNotifiesObserversForKey___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hasBeenPlayed", @"playCount", @"bookmark", @"rentalExpirationDate", 0);
  v1 = (void *)automaticallyNotifiesObserversForKey____keysToNotifyManually_0;
  automaticallyNotifiesObserversForKey____keysToNotifyManually_0 = v0;
}

+ (id)keyPathsForValuesAffectingPlayedState
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = NSStringFromSelector(sel_hasBeenPlayed);
  id v4 = NSStringFromSelector(sel_playCount);
  unsigned __int8 v5 = NSStringFromSelector(sel_bookmark);
  v6 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, 0);

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v66.receiver = self;
  v66.super_class = (Class)VUIMediaItem;
  id v4 = [(VUIMediaEntity *)&v66 description];
  [v3 addObject:v4];

  unsigned __int8 v5 = NSString;
  v6 = [(VUIMediaItem *)self duration];
  objc_super v7 = [v5 stringWithFormat:@"%@=%@", @"duration", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUIMediaItem *)self creationDate];
  v10 = [v8 stringWithFormat:@"%@=%@", @"creationDate", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [(VUIMediaItem *)self modifiedDate];
  v13 = [v11 stringWithFormat:@"%@=%@", @"modifiedDate", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(VUIMediaItem *)self lastPlayedDate];
  v16 = [v14 stringWithFormat:@"%@=%@", @"lastPlayedDate", v15];
  [v3 addObject:v16];

  v17 = NSString;
  v18 = [(VUIMediaItem *)self previewFrameImageIdentifier];
  v19 = [v17 stringWithFormat:@"%@=%@", @"previewFrameImageIdentifier", v18];
  [v3 addObject:v19];

  v20 = NSString;
  v21 = [(VUIMediaItem *)self extrasURL];
  v22 = [v20 stringWithFormat:@"%@=%@", @"extrasURL", v21];
  [v3 addObject:v22];

  v23 = NSString;
  v24 = [(VUIMediaItem *)self seasonIdentifier];
  v25 = [v23 stringWithFormat:@"%@=%@", @"seasonIdentifier", v24];
  [v3 addObject:v25];

  v26 = NSString;
  v27 = [(VUIMediaItem *)self seasonTitle];
  v28 = [v26 stringWithFormat:@"%@=%@", @"seasonTitle", v27];
  [v3 addObject:v28];

  v29 = NSString;
  v30 = [(VUIMediaItem *)self episodeNumber];
  v31 = [v29 stringWithFormat:@"%@=%@", @"episodeNumber", v30];
  [v3 addObject:v31];

  v32 = NSString;
  v33 = [(VUIMediaItem *)self fractionalEpisodeNumber];
  v34 = [v32 stringWithFormat:@"%@=%@", @"fractionalEpisodeNumber", v33];
  [v3 addObject:v34];

  v35 = NSString;
  v36 = [(VUIMediaItem *)self episodeIndexInSeries];
  v37 = [v35 stringWithFormat:@"%@=%@", @"episodeIndexInSeries", v36];
  [v3 addObject:v37];

  v38 = NSString;
  v39 = [(VUIMediaItem *)self studio];
  v40 = [v38 stringWithFormat:@"%@=%@", @"studio", v39];
  [v3 addObject:v40];

  v41 = NSString;
  v42 = [(VUIMediaItem *)self credits];
  v43 = [v41 stringWithFormat:@"%@=%@", @"credits", v42];
  [v3 addObject:v43];

  v44 = NSString;
  v45 = [(VUIMediaItem *)self rentalPlaybackDuration];
  v46 = [v44 stringWithFormat:@"%@=%@", @"rentalPlaybackDuration", v45];
  [v3 addObject:v46];

  v47 = NSString;
  v48 = [(VUIMediaItem *)self rentalExpirationDate];
  v49 = [v47 stringWithFormat:@"%@=%@", @"rentalExpirationDate", v48];
  [v3 addObject:v49];

  v50 = NSString;
  v51 = [(VUIMediaItem *)self downloadExpirationDate];
  v52 = [v50 stringWithFormat:@"%@=%@", @"downloadExpirationDate", v51];
  [v3 addObject:v52];

  v53 = NSString;
  v54 = [(VUIMediaItem *)self hasBeenPlayed];
  v55 = [v53 stringWithFormat:@"%@=%@", @"hasBeenPlayed", v54];
  [v3 addObject:v55];

  v56 = NSString;
  v57 = [(VUIMediaItem *)self playCount];
  v58 = [v56 stringWithFormat:@"%@=%@", @"playCount", v57];
  [v3 addObject:v58];

  v59 = NSString;
  v60 = [(VUIMediaItem *)self bookmark];
  v61 = [v59 stringWithFormat:@"%@=%@", @"bookmark", v60];
  [v3 addObject:v61];

  v62 = NSString;
  v63 = [v3 componentsJoinedByString:@", "];
  v64 = [v62 stringWithFormat:@"<%@>", v63];

  return v64;
}

- (NSNumber)isPlayable
{
  return self->_isPlayable;
}

- (NSString)seasonCanonicalID
{
  return self->_seasonCanonicalID;
}

- (NSString)showCanonicalID
{
  return self->_showCanonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showCanonicalID, 0);
  objc_storeStrong((id *)&self->_seasonCanonicalID, 0);
  objc_storeStrong((id *)&self->_isPlayable, 0);
}

@end