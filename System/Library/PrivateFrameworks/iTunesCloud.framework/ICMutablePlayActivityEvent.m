@interface ICMutablePlayActivityEvent
- (Class)_mutableCopyClass;
- (void)setAudioQualityPreference:(unint64_t)a3;
- (void)setAutoPlayMode:(unint64_t)a3;
- (void)setBuildFeatures:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setCollaborativePlaylist:(BOOL)a3;
- (void)setContainerID:(id)a3;
- (void)setContainerIDs:(id)a3;
- (void)setContainerType:(unint64_t)a3;
- (void)setContinuityCameraUsed:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setEndReasonType:(unint64_t)a3;
- (void)setEnqueuerProperties:(id)a3;
- (void)setEventDate:(id)a3;
- (void)setEventTimeZone:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)setHouseholdID:(id)a3;
- (void)setInternalBuild:(BOOL)a3;
- (void)setItemDuration:(double)a3;
- (void)setItemEndTime:(double)a3;
- (void)setItemIDs:(id)a3;
- (void)setItemStartTime:(double)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setLyricsDisplayedCharacterCount:(unint64_t)a3;
- (void)setLyricsLanguage:(id)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setOffline:(BOOL)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPersonalizedContainerID:(id)a3;
- (void)setPlaybackFormatPreference:(unint64_t)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setProvidedAudioQuality:(id)a3;
- (void)setQueueGroupingID:(id)a3;
- (void)setReasonHintType:(unint64_t)a3;
- (void)setRecommendationData:(id)a3;
- (void)setRepeatPlayMode:(unint64_t)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setSBEnabled:(BOOL)a3;
- (void)setSharedActivityGroupSizeCurrent:(unint64_t)a3;
- (void)setSharedActivityGroupSizeMax:(unint64_t)a3;
- (void)setSharedActivityType:(int64_t)a3;
- (void)setShufflePlayMode:(unint64_t)a3;
- (void)setSiriInitiated:(id)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setSystemReleaseType:(int64_t)a3;
- (void)setTargetedAudioQuality:(id)a3;
- (void)setTimedMetadata:(id)a3;
- (void)setTrackInfo:(id)a3;
- (void)setVocalAttenuationAvailability:(unint64_t)a3;
- (void)setVocalAttenuationDuration:(double)a3;
@end

@implementation ICMutablePlayActivityEvent

- (void)setVocalAttenuationDuration:(double)a3
{
  self->super._vocalAttenuationDuration = a3;
}

- (void)setVocalAttenuationAvailability:(unint64_t)a3
{
  self->super._vocalAttenuationAvailability = a3;
}

- (void)setCollaborativePlaylist:(BOOL)a3
{
  self->super._collaborativePlaylist = a3;
}

- (void)setSharedActivityType:(int64_t)a3
{
  self->super._sharedActivityType = a3;
}

- (void)setSharedActivityGroupSizeMax:(unint64_t)a3
{
  self->super._sharedActivityGroupSizeMax = a3;
}

- (void)setSharedActivityGroupSizeCurrent:(unint64_t)a3
{
  self->super._sharedActivityGroupSizeCurrent = a3;
}

- (void)setProvidedAudioQuality:(id)a3
{
  if (self->super._providedAudioQuality != a3)
  {
    v4 = (ICPlayActivityAudioQualityProperties *)[a3 copy];
    providedAudioQuality = self->super._providedAudioQuality;
    self->super._providedAudioQuality = v4;
    MEMORY[0x1F41817F8](v4, providedAudioQuality);
  }
}

- (void)setTargetedAudioQuality:(id)a3
{
  if (self->super._targetedAudioQuality != a3)
  {
    v4 = (ICPlayActivityAudioQualityProperties *)[a3 copy];
    targetedAudioQuality = self->super._targetedAudioQuality;
    self->super._targetedAudioQuality = v4;
    MEMORY[0x1F41817F8](v4, targetedAudioQuality);
  }
}

- (void)setPlaybackFormatPreference:(unint64_t)a3
{
  self->super._playbackFormatPreference = a3;
}

- (void)setAudioQualityPreference:(unint64_t)a3
{
  self->super._audioQualityPreference = a3;
}

- (void)setTrackInfo:(id)a3
{
  if (self->super._trackInfo != a3)
  {
    v4 = (NSData *)[a3 copy];
    trackInfo = self->super._trackInfo;
    self->super._trackInfo = v4;
    MEMORY[0x1F41817F8](v4, trackInfo);
  }
}

- (void)setTimedMetadata:(id)a3
{
  if (self->super._timedMetadata != a3)
  {
    v4 = (NSData *)[a3 copy];
    timedMetadata = self->super._timedMetadata;
    self->super._timedMetadata = v4;
    MEMORY[0x1F41817F8](v4, timedMetadata);
  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setStoreID:(id)a3
{
  if (self->super._storeID != a3)
  {
    v4 = (NSString *)[a3 copy];
    storeID = self->super._storeID;
    self->super._storeID = v4;
    MEMORY[0x1F41817F8](v4, storeID);
  }
}

- (void)setStoreFrontID:(id)a3
{
  if (self->super._storeFrontID != a3)
  {
    v4 = (NSString *)[a3 copy];
    storeFrontID = self->super._storeFrontID;
    self->super._storeFrontID = v4;
    MEMORY[0x1F41817F8](v4, storeFrontID);
  }
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setSourceType:(unint64_t)a3
{
  self->super._sourceType = a3;
}

- (void)setSiriInitiated:(id)a3
{
  if (self->super._siriInitiated != a3)
  {
    v4 = (NSNumber *)[a3 copy];
    siriInitiated = self->super._siriInitiated;
    self->super._siriInitiated = v4;
    MEMORY[0x1F41817F8](v4, siriInitiated);
  }
}

- (void)setShufflePlayMode:(unint64_t)a3
{
  self->super._shufflePlayMode = a3;
}

- (void)setSBEnabled:(BOOL)a3
{
  self->super._SBEnabled = a3;
}

- (void)setRequestingBundleVersion:(id)a3
{
  if (self->super._requestingBundleVersion != a3)
  {
    v4 = (NSString *)[a3 copy];
    requestingBundleVersion = self->super._requestingBundleVersion;
    self->super._requestingBundleVersion = v4;
    MEMORY[0x1F41817F8](v4, requestingBundleVersion);
  }
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  if (self->super._requestingBundleIdentifier != a3)
  {
    v4 = (NSString *)[a3 copy];
    requestingBundleIdentifier = self->super._requestingBundleIdentifier;
    self->super._requestingBundleIdentifier = v4;
    MEMORY[0x1F41817F8](v4, requestingBundleIdentifier);
  }
}

- (void)setRepeatPlayMode:(unint64_t)a3
{
  self->super._repeatPlayMode = a3;
}

- (void)setRecommendationData:(id)a3
{
  if (self->super._recommendationData != a3)
  {
    v4 = (NSData *)[a3 copy];
    recommendationData = self->super._recommendationData;
    self->super._recommendationData = v4;
    MEMORY[0x1F41817F8](v4, recommendationData);
  }
}

- (void)setReasonHintType:(unint64_t)a3
{
  self->super._reasonHintType = a3;
}

- (void)setQueueGroupingID:(id)a3
{
  if (self->super._queueGroupingID != a3)
  {
    v4 = (NSString *)[a3 copy];
    queueGroupingID = self->super._queueGroupingID;
    self->super._queueGroupingID = v4;
    MEMORY[0x1F41817F8](v4, queueGroupingID);
  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  if (self->super._privateListeningEnabled != a3)
  {
    v4 = (NSNumber *)[a3 copy];
    privateListeningEnabled = self->super._privateListeningEnabled;
    self->super._privateListeningEnabled = v4;
    MEMORY[0x1F41817F8](v4, privateListeningEnabled);
  }
}

- (void)setPersonalizedContainerID:(id)a3
{
  if (self->super._personalizedContainerID != a3)
  {
    v4 = (NSString *)[a3 copy];
    personalizedContainerID = self->super._personalizedContainerID;
    self->super._personalizedContainerID = v4;
    MEMORY[0x1F41817F8](v4, personalizedContainerID);
  }
}

- (void)setPersistentID:(int64_t)a3
{
  self->super._persistentID = a3;
}

- (void)setOffline:(BOOL)a3
{
  self->super._offline = a3;
}

- (void)setMediaType:(unint64_t)a3
{
  self->super._mediaType = a3;
}

- (void)setLyricsLanguage:(id)a3
{
  if (self->super._lyricsLanguage != a3)
  {
    v4 = (NSString *)[a3 copy];
    lyricsLanguage = self->super._lyricsLanguage;
    self->super._lyricsLanguage = v4;
    MEMORY[0x1F41817F8](v4, lyricsLanguage);
  }
}

- (void)setLyricsDisplayedCharacterCount:(unint64_t)a3
{
  self->super._lyricsDisplayedCharacterCount = a3;
}

- (void)setItemType:(unint64_t)a3
{
  self->super._itemType = a3;
}

- (void)setItemStartTime:(double)a3
{
  self->super._itemStartTime = a3;
}

- (void)setItemEndTime:(double)a3
{
  self->super._itemEndTime = a3;
}

- (void)setItemDuration:(double)a3
{
  self->super._itemDuration = a3;
}

- (void)setItemIDs:(id)a3
{
  if (self->super._itemIDs != a3)
  {
    v4 = (ICPlayActivityEventItemIDs *)[a3 copy];
    itemIDs = self->super._itemIDs;
    self->super._itemIDs = v4;
    MEMORY[0x1F41817F8](v4, itemIDs);
  }
}

- (void)setInternalBuild:(BOOL)a3
{
  int64_t v3 = 4;
  if (!a3) {
    int64_t v3 = 0;
  }
  self->super._systemReleaseType = v3;
}

- (void)setHouseholdID:(id)a3
{
  if (self->super._householdID != a3)
  {
    v4 = (NSString *)[a3 copy];
    householdID = self->super._householdID;
    self->super._householdID = v4;
    MEMORY[0x1F41817F8](v4, householdID);
  }
}

- (void)setFeatureName:(id)a3
{
  if (self->super._featureName != a3)
  {
    v4 = (NSString *)[a3 copy];
    featureName = self->super._featureName;
    self->super._featureName = v4;
    MEMORY[0x1F41817F8](v4, featureName);
  }
}

- (void)setExternalID:(id)a3
{
  if (self->super._externalID != a3)
  {
    v4 = (NSString *)[a3 copy];
    externalID = self->super._externalID;
    self->super._externalID = v4;
    MEMORY[0x1F41817F8](v4, externalID);
  }
}

- (void)setEventType:(unint64_t)a3
{
  self->super._eventType = a3;
}

- (void)setEventTimeZone:(id)a3
{
  if (self->super._eventTimeZone != a3)
  {
    v4 = (NSTimeZone *)[a3 copy];
    eventTimeZone = self->super._eventTimeZone;
    self->super._eventTimeZone = v4;
    MEMORY[0x1F41817F8](v4, eventTimeZone);
  }
}

- (void)setEventDate:(id)a3
{
  if (self->super._eventDate != a3)
  {
    v4 = (NSDate *)[a3 copy];
    eventDate = self->super._eventDate;
    self->super._eventDate = v4;
    MEMORY[0x1F41817F8](v4, eventDate);
  }
}

- (void)setEnqueuerProperties:(id)a3
{
  if (self->super._enqueuerProperties != a3)
  {
    v4 = (ICPlayActivityEnqueuerProperties *)[a3 copy];
    enqueuerProperties = self->super._enqueuerProperties;
    self->super._enqueuerProperties = v4;
    MEMORY[0x1F41817F8](v4, enqueuerProperties);
  }
}

- (void)setEndReasonType:(unint64_t)a3
{
  self->super._endReasonType = a3;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->super._displayType = a3;
}

- (void)setDeviceName:(id)a3
{
  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)[a3 copy];
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;
    MEMORY[0x1F41817F8](v4, deviceName);
  }
}

- (void)setContinuityCameraUsed:(BOOL)a3
{
  self->super._continuityCameraUsed = a3;
}

- (void)setContainerType:(unint64_t)a3
{
  self->super._containerType = a3;
}

- (void)setContainerIDs:(id)a3
{
  if (self->super._containerIDs != a3)
  {
    v4 = (ICPlayActivityEventContainerIDs *)[a3 copy];
    containerIDs = self->super._containerIDs;
    self->super._containerIDs = v4;
    MEMORY[0x1F41817F8](v4, containerIDs);
  }
}

- (void)setContainerID:(id)a3
{
  if (self->super._containerID != a3)
  {
    v4 = (NSString *)[a3 copy];
    containerID = self->super._containerID;
    self->super._containerID = v4;
    MEMORY[0x1F41817F8](v4, containerID);
  }
}

- (void)setBuildVersion:(id)a3
{
  if (self->super._buildVersion != a3)
  {
    v4 = (NSString *)[a3 copy];
    buildVersion = self->super._buildVersion;
    self->super._buildVersion = v4;
    MEMORY[0x1F41817F8](v4, buildVersion);
  }
}

- (void)setBuildFeatures:(id)a3
{
  if (self->super._buildFeatures != a3)
  {
    v4 = (NSArray *)[a3 copy];
    buildFeatures = self->super._buildFeatures;
    self->super._buildFeatures = v4;
    MEMORY[0x1F41817F8](v4, buildFeatures);
  }
}

- (void)setAutoPlayMode:(unint64_t)a3
{
  self->super._autoPlayMode = a3;
}

- (Class)_mutableCopyClass
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

@end