@interface SSVPBPlayActivityEvent
- (BOOL)hasBuildVersion;
- (BOOL)hasCharacterDisplayedCount;
- (BOOL)hasCloudAlbumID;
- (BOOL)hasCloudPlaylistID;
- (BOOL)hasContainerAdamID;
- (BOOL)hasContainerID;
- (BOOL)hasContainerType;
- (BOOL)hasDeviceName;
- (BOOL)hasDisplayType;
- (BOOL)hasEndReasonType;
- (BOOL)hasEnqueuerProperties;
- (BOOL)hasEquivalencySourceAdamID;
- (BOOL)hasEventDateTimestamp;
- (BOOL)hasEventSecondsFromGMT;
- (BOOL)hasEventTimeZoneName;
- (BOOL)hasEventType;
- (BOOL)hasExternalID;
- (BOOL)hasFeatureName;
- (BOOL)hasGlobalPlaylistID;
- (BOOL)hasHouseholdID;
- (BOOL)hasInternalBuild;
- (BOOL)hasItemCloudID;
- (BOOL)hasItemDuration;
- (BOOL)hasItemEndTime;
- (BOOL)hasItemStartTime;
- (BOOL)hasItemType;
- (BOOL)hasLyricLanguage;
- (BOOL)hasLyricsID;
- (BOOL)hasMediaType;
- (BOOL)hasOffline;
- (BOOL)hasPersistentID;
- (BOOL)hasPersonalizedContainerID;
- (BOOL)hasPlaylistVersionHash;
- (BOOL)hasPrivateListeningEnabled;
- (BOOL)hasPurchasedAdamID;
- (BOOL)hasRadioAdamID;
- (BOOL)hasReasonHintType;
- (BOOL)hasRecommendationData;
- (BOOL)hasRequestingBundleIdentifier;
- (BOOL)hasRequestingBundleVersion;
- (BOOL)hasSBEnabled;
- (BOOL)hasSiriInitiated;
- (BOOL)hasSourceType;
- (BOOL)hasStationHash;
- (BOOL)hasStationID;
- (BOOL)hasStationStringID;
- (BOOL)hasStoreAccountID;
- (BOOL)hasStoreFrontID;
- (BOOL)hasStoreID;
- (BOOL)hasSubscriptionAdamID;
- (BOOL)hasSystemReleaseType;
- (BOOL)hasTimedMetadata;
- (BOOL)hasTrackInfo;
- (BOOL)hasTvShowPurchasedAdamID;
- (BOOL)hasTvShowSubscriptionAdamID;
- (BOOL)internalBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)offline;
- (BOOL)privateListeningEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)sBEnabled;
- (BOOL)siriInitiated;
- (NSData)recommendationData;
- (NSData)timedMetadata;
- (NSData)trackInfo;
- (NSString)buildVersion;
- (NSString)cloudAlbumID;
- (NSString)containerID;
- (NSString)deviceName;
- (NSString)eventTimeZoneName;
- (NSString)externalID;
- (NSString)featureName;
- (NSString)globalPlaylistID;
- (NSString)householdID;
- (NSString)lyricLanguage;
- (NSString)lyricsID;
- (NSString)personalizedContainerID;
- (NSString)playlistVersionHash;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (NSString)stationHash;
- (NSString)stationStringID;
- (NSString)storeFrontID;
- (NSString)storeID;
- (SSVPBPlayActivityEnqueuerProperties)enqueuerProperties;
- (double)eventDateTimestamp;
- (double)eventSecondsFromGMT;
- (double)itemDuration;
- (double)itemEndTime;
- (double)itemStartTime;
- (id)containerTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTypeAsString:(int)a3;
- (id)endReasonTypeAsString:(int)a3;
- (id)eventTypeAsString:(int)a3;
- (id)itemTypeAsString:(int)a3;
- (id)mediaTypeAsString:(int)a3;
- (id)reasonHintTypeAsString:(int)a3;
- (id)sourceTypeAsString:(int)a3;
- (id)systemReleaseTypeAsString:(int)a3;
- (int)StringAsContainerType:(id)a3;
- (int)StringAsDisplayType:(id)a3;
- (int)StringAsEndReasonType:(id)a3;
- (int)StringAsEventType:(id)a3;
- (int)StringAsItemType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)StringAsReasonHintType:(id)a3;
- (int)StringAsSourceType:(id)a3;
- (int)StringAsSystemReleaseType:(id)a3;
- (int)containerType;
- (int)displayType;
- (int)endReasonType;
- (int)eventType;
- (int)itemType;
- (int)mediaType;
- (int)reasonHintType;
- (int)sourceType;
- (int)systemReleaseType;
- (int64_t)characterDisplayedCount;
- (int64_t)containerAdamID;
- (int64_t)equivalencySourceAdamID;
- (int64_t)persistentID;
- (int64_t)purchasedAdamID;
- (int64_t)radioAdamID;
- (int64_t)stationID;
- (int64_t)subscriptionAdamID;
- (int64_t)tvShowPurchasedAdamID;
- (int64_t)tvShowSubscriptionAdamID;
- (unint64_t)cloudPlaylistID;
- (unint64_t)hash;
- (unint64_t)itemCloudID;
- (unint64_t)storeAccountID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setCharacterDisplayedCount:(int64_t)a3;
- (void)setCloudAlbumID:(id)a3;
- (void)setCloudPlaylistID:(unint64_t)a3;
- (void)setContainerAdamID:(int64_t)a3;
- (void)setContainerID:(id)a3;
- (void)setContainerType:(int)a3;
- (void)setDeviceName:(id)a3;
- (void)setDisplayType:(int)a3;
- (void)setEndReasonType:(int)a3;
- (void)setEnqueuerProperties:(id)a3;
- (void)setEquivalencySourceAdamID:(int64_t)a3;
- (void)setEventDateTimestamp:(double)a3;
- (void)setEventSecondsFromGMT:(double)a3;
- (void)setEventTimeZoneName:(id)a3;
- (void)setEventType:(int)a3;
- (void)setExternalID:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setHasCharacterDisplayedCount:(BOOL)a3;
- (void)setHasCloudPlaylistID:(BOOL)a3;
- (void)setHasContainerAdamID:(BOOL)a3;
- (void)setHasContainerType:(BOOL)a3;
- (void)setHasDisplayType:(BOOL)a3;
- (void)setHasEndReasonType:(BOOL)a3;
- (void)setHasEquivalencySourceAdamID:(BOOL)a3;
- (void)setHasEventDateTimestamp:(BOOL)a3;
- (void)setHasEventSecondsFromGMT:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasInternalBuild:(BOOL)a3;
- (void)setHasItemCloudID:(BOOL)a3;
- (void)setHasItemDuration:(BOOL)a3;
- (void)setHasItemEndTime:(BOOL)a3;
- (void)setHasItemStartTime:(BOOL)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasOffline:(BOOL)a3;
- (void)setHasPersistentID:(BOOL)a3;
- (void)setHasPrivateListeningEnabled:(BOOL)a3;
- (void)setHasPurchasedAdamID:(BOOL)a3;
- (void)setHasRadioAdamID:(BOOL)a3;
- (void)setHasReasonHintType:(BOOL)a3;
- (void)setHasSBEnabled:(BOOL)a3;
- (void)setHasSiriInitiated:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setHasStationID:(BOOL)a3;
- (void)setHasStoreAccountID:(BOOL)a3;
- (void)setHasSubscriptionAdamID:(BOOL)a3;
- (void)setHasSystemReleaseType:(BOOL)a3;
- (void)setHasTvShowPurchasedAdamID:(BOOL)a3;
- (void)setHasTvShowSubscriptionAdamID:(BOOL)a3;
- (void)setHouseholdID:(id)a3;
- (void)setInternalBuild:(BOOL)a3;
- (void)setItemCloudID:(unint64_t)a3;
- (void)setItemDuration:(double)a3;
- (void)setItemEndTime:(double)a3;
- (void)setItemStartTime:(double)a3;
- (void)setItemType:(int)a3;
- (void)setLyricLanguage:(id)a3;
- (void)setLyricsID:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setOffline:(BOOL)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPersonalizedContainerID:(id)a3;
- (void)setPlaylistVersionHash:(id)a3;
- (void)setPrivateListeningEnabled:(BOOL)a3;
- (void)setPurchasedAdamID:(int64_t)a3;
- (void)setRadioAdamID:(int64_t)a3;
- (void)setReasonHintType:(int)a3;
- (void)setRecommendationData:(id)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setSBEnabled:(BOOL)a3;
- (void)setSiriInitiated:(BOOL)a3;
- (void)setSourceType:(int)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setSubscriptionAdamID:(int64_t)a3;
- (void)setSystemReleaseType:(int)a3;
- (void)setTimedMetadata:(id)a3;
- (void)setTrackInfo:(id)a3;
- (void)setTvShowPurchasedAdamID:(int64_t)a3;
- (void)setTvShowSubscriptionAdamID:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SSVPBPlayActivityEvent

- (int)eventType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_eventType;
  }
  else {
    return 1;
  }
}

- (void)setEventType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasEventType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADB30[a3 - 1];
  }
  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PlayEnd"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PlayStart"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LyricDisplay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)reasonHintType
{
  if (*((unsigned char *)&self->_has + 3)) {
    return self->_reasonHintType;
  }
  else {
    return 0;
  }
}

- (void)setReasonHintType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_reasonHintType = a3;
}

- (void)setHasReasonHintType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasReasonHintType
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (id)reasonHintTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ContainerChanged";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (int)StringAsReasonHintType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ContainerChanged"];
  }

  return v4;
}

- (void)setSubscriptionAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_subscriptionAdamID = a3;
}

- (void)setHasSubscriptionAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSubscriptionAdamID
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPurchasedAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_purchasedAdamID = a3;
}

- (void)setHasPurchasedAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPurchasedAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRadioAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_radioAdamID = a3;
}

- (void)setHasRadioAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRadioAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemCloudID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_itemCloudID = a3;
}

- (void)setHasItemCloudID:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasItemCloudID
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasLyricsID
{
  return self->_lyricsID != 0;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_equivalencySourceAdamID = a3;
}

- (void)setHasEquivalencySourceAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEquivalencySourceAdamID
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setContainerAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_containerAdamID = a3;
}

- (void)setHasContainerAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasContainerAdamID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasGlobalPlaylistID
{
  return self->_globalPlaylistID != 0;
}

- (BOOL)hasStationHash
{
  return self->_stationHash != 0;
}

- (BOOL)hasStationStringID
{
  return self->_stationStringID != 0;
}

- (void)setStationID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_stationID = a3;
}

- (void)setHasStationID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasStationID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasCloudAlbumID
{
  return self->_cloudAlbumID != 0;
}

- (void)setCloudPlaylistID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cloudPlaylistID = a3;
}

- (void)setHasCloudPlaylistID:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCloudPlaylistID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaylistVersionHash
{
  return self->_playlistVersionHash != 0;
}

- (int)containerType
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_containerType;
  }
  else {
    return 0;
  }
}

- (void)setContainerType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasContainerType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)containerTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADB48[a3];
  }
  return v3;
}

- (int)StringAsContainerType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RadioStation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Playlist"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Artist"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (int)endReasonType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    return self->_endReasonType;
  }
  else {
    return 0;
  }
}

- (void)setEndReasonType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_endReasonType = a3;
}

- (void)setHasEndReasonType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasEndReasonType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)endReasonTypeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADB70[a3];
  }
  return v3;
}

- (int)StringAsEndReasonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotApplicable"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SkipBackward"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SkipForward"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"QueueChange"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ManualPause"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Interruption"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"InactivityPause"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"InactivitySessionEnd"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NaturalTransition"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Ban"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AssetLoadFailure"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ScrubBegin"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ScrubEnd"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"QuickPlay"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEventDateTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_eventDateTimestamp = a3;
}

- (void)setHasEventDateTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasEventDateTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasFeatureName
{
  return self->_featureName != 0;
}

- (void)setItemDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_itemDuration = a3;
}

- (void)setHasItemDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasItemDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setItemEndTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_itemEndTime = a3;
}

- (void)setHasItemEndTime:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasItemEndTime
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setItemStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_itemStartTime = a3;
}

- (void)setHasItemStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasItemStartTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)itemType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    return self->_itemType;
  }
  else {
    return 0;
  }
}

- (void)setItemType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasItemType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)itemTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADBE8[a3];
  }
  return v3;
}

- (int)StringAsItemType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"iTunesStoreContent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AudioClip"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Ad"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Stream"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TimedMetadataPing"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UploadedContent"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AggregateNonCatalogPlayTime"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TVEpisode"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)mediaType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    return self->_mediaType;
  }
  else {
    return 0;
  }
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Video";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Audio";
  }
  return v4;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Audio"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Video"];
  }

  return v4;
}

- (void)setOffline:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_offline = a3;
}

- (void)setHasOffline:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOffline
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPersistentID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPersistentID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSBEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_sBEnabled = a3;
}

- (void)setHasSBEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasSBEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)sourceType
{
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    return self->_sourceType;
  }
  else {
    return 0;
  }
}

- (void)setSourceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasSourceType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADC38[a3];
  }
  return v3;
}

- (int)StringAsSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Device"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PairedWatch"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RemoteControl"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_storeAccountID = a3;
}

- (void)setHasStoreAccountID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasStoreAccountID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasTimedMetadata
{
  return self->_timedMetadata != 0;
}

- (BOOL)hasTrackInfo
{
  return self->_trackInfo != 0;
}

- (BOOL)hasRecommendationData
{
  return self->_recommendationData != 0;
}

- (BOOL)hasStoreFrontID
{
  return self->_storeFrontID != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasRequestingBundleIdentifier
{
  return self->_requestingBundleIdentifier != 0;
}

- (BOOL)hasRequestingBundleVersion
{
  return self->_requestingBundleVersion != 0;
}

- (BOOL)hasEnqueuerProperties
{
  return self->_enqueuerProperties != 0;
}

- (BOOL)hasHouseholdID
{
  return self->_householdID != 0;
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_privateListeningEnabled = a3;
}

- (void)setHasPrivateListeningEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasPrivateListeningEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSiriInitiated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_siriInitiated = a3;
}

- (void)setHasSiriInitiated:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasSiriInitiated
{
  return *(_DWORD *)&self->_has >> 31;
}

- (int)systemReleaseType
{
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0) {
    return self->_systemReleaseType;
  }
  else {
    return 0;
  }
}

- (void)setSystemReleaseType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_systemReleaseType = a3;
}

- (void)setHasSystemReleaseType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSystemReleaseType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)systemReleaseTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADC50[a3];
  }
  return v3;
}

- (int)StringAsSystemReleaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CUSTOMER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CARRIER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVELOPER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTERNAL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasEventTimeZoneName
{
  return self->_eventTimeZoneName != 0;
}

- (int)displayType
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_displayType;
  }
  else {
    return 0;
  }
}

- (void)setDisplayType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_displayType = a3;
}

- (void)setHasDisplayType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasDisplayType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)displayTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5BADC78[a3];
  }
  return v3;
}

- (int)StringAsDisplayType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoDisplayType"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Static"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LineByLine"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WordByWord"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCharacterDisplayedCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_characterDisplayedCount = a3;
}

- (void)setHasCharacterDisplayedCount:(BOOL)a3
{
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCharacterDisplayedCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasLyricLanguage
{
  return self->_lyricLanguage != 0;
}

- (BOOL)hasContainerID
{
  return self->_containerID != 0;
}

- (BOOL)hasPersonalizedContainerID
{
  return self->_personalizedContainerID != 0;
}

- (BOOL)hasStoreID
{
  return self->_storeID != 0;
}

- (BOOL)hasExternalID
{
  return self->_externalID != 0;
}

- (void)setTvShowPurchasedAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tvShowPurchasedAdamID = a3;
}

- (void)setHasTvShowPurchasedAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTvShowPurchasedAdamID
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTvShowSubscriptionAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tvShowSubscriptionAdamID = a3;
}

- (void)setHasTvShowSubscriptionAdamID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTvShowSubscriptionAdamID
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_internalBuild = a3;
}

- (void)setHasInternalBuild:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasInternalBuild
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEventSecondsFromGMT:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_eventSecondsFromGMT = a3;
}

- (void)setHasEventSecondsFromGMT:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasEventSecondsFromGMT
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSVPBPlayActivityEvent;
  int v4 = [(SSVPBPlayActivityEvent *)&v8 description];
  v5 = [(SSVPBPlayActivityEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    unsigned int v5 = self->_eventType - 1;
    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5BADB30[v5];
    }
    [v3 setObject:v6 forKey:@"eventType"];

    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    int reasonHintType = self->_reasonHintType;
    if (reasonHintType)
    {
      if (reasonHintType == 1)
      {
        objc_super v8 = @"ContainerChanged";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reasonHintType);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"Unknown";
    }
    [v3 setObject:v8 forKey:@"reasonHintType"];

    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    v23 = [NSNumber numberWithLongLong:self->_subscriptionAdamID];
    [v3 setObject:v23 forKey:@"subscriptionAdamID"];

    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  v24 = [NSNumber numberWithLongLong:self->_purchasedAdamID];
  [v3 setObject:v24 forKey:@"purchasedAdamID"];

  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_43:
  v25 = [NSNumber numberWithLongLong:self->_radioAdamID];
  [v3 setObject:v25 forKey:@"radioAdamID"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    v9 = [NSNumber numberWithUnsignedLongLong:self->_itemCloudID];
    [v3 setObject:v9 forKey:@"itemCloudID"];
  }
LABEL_18:
  lyricsID = self->_lyricsID;
  if (lyricsID) {
    [v3 setObject:lyricsID forKey:@"lyricsID"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_equivalencySourceAdamID];
    [v3 setObject:v12 forKey:@"equivalencySourceAdamID"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_containerAdamID];
    [v3 setObject:v13 forKey:@"containerAdamID"];
  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID) {
    [v3 setObject:globalPlaylistID forKey:@"globalPlaylistID"];
  }
  stationHash = self->_stationHash;
  if (stationHash) {
    [v3 setObject:stationHash forKey:@"stationHash"];
  }
  stationStringID = self->_stationStringID;
  if (stationStringID) {
    [v3 setObject:stationStringID forKey:@"stationStringID"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_stationID];
    [v3 setObject:v17 forKey:@"stationID"];
  }
  cloudAlbumID = self->_cloudAlbumID;
  if (cloudAlbumID) {
    [v3 setObject:cloudAlbumID forKey:@"cloudAlbumID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = [NSNumber numberWithUnsignedLongLong:self->_cloudPlaylistID];
    [v3 setObject:v19 forKey:@"cloudPlaylistID"];
  }
  playlistVersionHash = self->_playlistVersionHash;
  if (playlistVersionHash) {
    [v3 setObject:playlistVersionHash forKey:@"playlistVersionHash"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    uint64_t containerType = self->_containerType;
    if (containerType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_containerType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5BADB48[containerType];
    }
    [v3 setObject:v22 forKey:@"containerType"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x100000) != 0)
  {
    uint64_t endReasonType = self->_endReasonType;
    if (endReasonType >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_endReasonType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E5BADB70[endReasonType];
    }
    [v3 setObject:v29 forKey:@"endReasonType"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v27 = self->_has;
  }
  if ((*(unsigned char *)&v27 & 0x10) != 0)
  {
    v30 = [NSNumber numberWithDouble:self->_eventDateTimestamp];
    [v3 setObject:v30 forKey:@"eventDateTimestamp"];
  }
  featureName = self->_featureName;
  if (featureName) {
    [v3 setObject:featureName forKey:@"featureName"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(unsigned char *)&v32 & 0x80) != 0)
  {
    v45 = [NSNumber numberWithDouble:self->_itemDuration];
    [v3 setObject:v45 forKey:@"itemDuration"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x100) == 0)
    {
LABEL_60:
      if ((*(_WORD *)&v32 & 0x200) == 0) {
        goto LABEL_61;
      }
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&v32 & 0x100) == 0)
  {
    goto LABEL_60;
  }
  v46 = [NSNumber numberWithDouble:self->_itemEndTime];
  [v3 setObject:v46 forKey:@"itemEndTime"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x200) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v32 & 0x400000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_94;
  }
LABEL_93:
  v47 = [NSNumber numberWithDouble:self->_itemStartTime];
  [v3 setObject:v47 forKey:@"itemStartTime"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x400000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v32 & 0x800000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_102;
  }
LABEL_94:
  uint64_t itemType = self->_itemType;
  if (itemType >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_itemType);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = off_1E5BADBE8[itemType];
  }
  [v3 setObject:v49 forKey:@"itemType"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x800000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v32 & 0x10000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_139;
  }
LABEL_102:
  int mediaType = self->_mediaType;
  if (mediaType)
  {
    if (mediaType == 1)
    {
      v55 = @"Video";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v55 = @"Audio";
  }
  [v3 setObject:v55 forKey:@"mediaType"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v32 & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_140;
  }
LABEL_139:
  v73 = [NSNumber numberWithBool:self->_offline];
  [v3 setObject:v73 forKey:@"offline"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x400) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v32 & 0x40000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_141;
  }
LABEL_140:
  v74 = [NSNumber numberWithLongLong:self->_persistentID];
  [v3 setObject:v74 forKey:@"persistentID"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x40000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v32 & 0x2000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_142;
  }
LABEL_141:
  v75 = [NSNumber numberWithBool:self->_sBEnabled];
  [v3 setObject:v75 forKey:@"SBEnabled"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x2000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v32 & 0x4000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_142:
  uint64_t sourceType = self->_sourceType;
  if (sourceType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sourceType);
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = off_1E5BADC38[sourceType];
  }
  [v3 setObject:v77 forKey:@"sourceType"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_68:
    v33 = [NSNumber numberWithUnsignedLongLong:self->_storeAccountID];
    [v3 setObject:v33 forKey:@"storeAccountID"];
  }
LABEL_69:
  timedMetadata = self->_timedMetadata;
  if (timedMetadata) {
    [v3 setObject:timedMetadata forKey:@"timedMetadata"];
  }
  trackInfo = self->_trackInfo;
  if (trackInfo) {
    [v3 setObject:trackInfo forKey:@"trackInfo"];
  }
  recommendationData = self->_recommendationData;
  if (recommendationData) {
    [v3 setObject:recommendationData forKey:@"recommendationData"];
  }
  storeFrontID = self->_storeFrontID;
  if (storeFrontID) {
    [v3 setObject:storeFrontID forKey:@"storeFrontID"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier) {
    [v3 setObject:requestingBundleIdentifier forKey:@"requestingBundleIdentifier"];
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if (requestingBundleVersion) {
    [v3 setObject:requestingBundleVersion forKey:@"requestingBundleVersion"];
  }
  enqueuerProperties = self->_enqueuerProperties;
  if (enqueuerProperties)
  {
    v42 = [(SSVPBPlayActivityEnqueuerProperties *)enqueuerProperties dictionaryRepresentation];
    [v3 setObject:v42 forKey:@"enqueuerProperties"];
  }
  householdID = self->_householdID;
  if (householdID) {
    [v3 setObject:householdID forKey:@"householdID"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x20000000) != 0)
  {
    v50 = [NSNumber numberWithBool:self->_privateListeningEnabled];
    [v3 setObject:v50 forKey:@"privateListeningEnabled"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x80000000) == 0)
    {
LABEL_89:
      if ((*(_DWORD *)&v44 & 0x4000000) == 0) {
        goto LABEL_107;
      }
      goto LABEL_98;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x80000000) == 0)
  {
    goto LABEL_89;
  }
  v51 = [NSNumber numberWithBool:self->_siriInitiated];
  [v3 setObject:v51 forKey:@"siriInitiated"];

  if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
    goto LABEL_107;
  }
LABEL_98:
  uint64_t systemReleaseType = self->_systemReleaseType;
  if (systemReleaseType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_systemReleaseType);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = off_1E5BADC50[systemReleaseType];
  }
  [v3 setObject:v53 forKey:@"systemReleaseType"];

LABEL_107:
  eventTimeZoneName = self->_eventTimeZoneName;
  if (eventTimeZoneName) {
    [v3 setObject:eventTimeZoneName forKey:@"eventTimeZoneName"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    uint64_t displayType = self->_displayType;
    if (displayType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_displayType);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E5BADC78[displayType];
    }
    [v3 setObject:v59 forKey:@"displayType"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v57 = self->_has;
  }
  if (*(unsigned char *)&v57)
  {
    v60 = [NSNumber numberWithLongLong:self->_characterDisplayedCount];
    [v3 setObject:v60 forKey:@"characterDisplayedCount"];
  }
  lyricLanguage = self->_lyricLanguage;
  if (lyricLanguage) {
    [v3 setObject:lyricLanguage forKey:@"lyricLanguage"];
  }
  containerID = self->_containerID;
  if (containerID) {
    [v3 setObject:containerID forKey:@"containerID"];
  }
  personalizedContainerID = self->_personalizedContainerID;
  if (personalizedContainerID) {
    [v3 setObject:personalizedContainerID forKey:@"personalizedContainerID"];
  }
  storeID = self->_storeID;
  if (storeID) {
    [v3 setObject:storeID forKey:@"storeID"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v3 setObject:externalID forKey:@"externalID"];
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x10000) != 0)
  {
    v70 = [NSNumber numberWithLongLong:self->_tvShowPurchasedAdamID];
    [v3 setObject:v70 forKey:@"tvShowPurchasedAdamID"];

    $DE3EE0432C8889EE6FF627BF579DAD3F v66 = self->_has;
    if ((*(_DWORD *)&v66 & 0x20000) == 0)
    {
LABEL_128:
      if ((*(_DWORD *)&v66 & 0x8000000) == 0) {
        goto LABEL_129;
      }
LABEL_134:
      v72 = [NSNumber numberWithBool:self->_internalBuild];
      [v3 setObject:v72 forKey:@"internalBuild"];

      if ((*(_DWORD *)&self->_has & 0x20) == 0) {
        goto LABEL_131;
      }
      goto LABEL_130;
    }
  }
  else if ((*(_DWORD *)&v66 & 0x20000) == 0)
  {
    goto LABEL_128;
  }
  v71 = [NSNumber numberWithLongLong:self->_tvShowSubscriptionAdamID];
  [v3 setObject:v71 forKey:@"tvShowSubscriptionAdamID"];

  $DE3EE0432C8889EE6FF627BF579DAD3F v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x8000000) != 0) {
    goto LABEL_134;
  }
LABEL_129:
  if ((*(unsigned char *)&v66 & 0x20) != 0)
  {
LABEL_130:
    v67 = [NSNumber numberWithDouble:self->_eventSecondsFromGMT];
    [v3 setObject:v67 forKey:@"eventSecondsFromGMT"];
  }
LABEL_131:
  id v68 = v3;

  return v68;
}

- (BOOL)readFrom:(id)a3
{
  return SSVPBPlayActivityEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_containerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v13;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    id v4 = v13;
  }
LABEL_11:
  if (self->_externalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteDoubleField();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt64Field();
    id v4 = v13;
  }
LABEL_23:
  if (self->_personalizedContainerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint64Field();
    id v4 = v13;
  }
LABEL_29:
  if (self->_storeID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_timedMetadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v13;
  }
  if (self->_trackInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v13;
  }
  if (self->_recommendationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v13;
  }
  if (self->_storeFrontID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0) {
        goto LABEL_42;
      }
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_111:
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_44:
    PBDataWriterWriteUint64Field();
    id v4 = v13;
  }
LABEL_45:
  if (self->_lyricsID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v13;
  }
  if (self->_globalPlaylistID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_stationHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_stationStringID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v13;
  }
  if (self->_cloudAlbumID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v9 = self->_has;
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v13;
  }
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_playlistVersionHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_requestingBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  if (self->_requestingBundleVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x10000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_115;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x20000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_115:
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_75:
    PBDataWriterWriteInt64Field();
    id v4 = v13;
  }
LABEL_76:
  if (self->_enqueuerProperties)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v13;
  }
  if (self->_householdID)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x80000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v11 & 0x4000000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_83:
    PBDataWriterWriteInt32Field();
    id v4 = v13;
  }
LABEL_84:
  if (self->_eventTimeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v13;
    $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  }
  if (*(unsigned char *)&v12)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v13;
  }
  if (self->_lyricLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_containerID)
  {
    objc_msgSend(v4, "setContainerID:");
    id v4 = v13;
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v4 + 44) = self->_containerType;
    *((_DWORD *)v4 + 102) |= 0x40000u;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v13, "setDeviceName:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)v4 + 49) = self->_endReasonType;
    *((_DWORD *)v4 + 102) |= 0x100000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 5) = *(void *)&self->_eventDateTimestamp;
  *((_DWORD *)v4 + 102) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((void *)v4 + 6) = *(void *)&self->_eventSecondsFromGMT;
    *((_DWORD *)v4 + 102) |= 0x20u;
  }
LABEL_11:
  if (self->_externalID)
  {
    objc_msgSend(v13, "setExternalID:");
    id v4 = v13;
  }
  if (self->_featureName)
  {
    objc_msgSend(v13, "setFeatureName:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    *((void *)v4 + 8) = *(void *)&self->_itemDuration;
    *((_DWORD *)v4 + 102) |= 0x80u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  *((void *)v4 + 9) = *(void *)&self->_itemEndTime;
  *((_DWORD *)v4 + 102) |= 0x100u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((void *)v4 + 10) = *(void *)&self->_itemStartTime;
  *((_DWORD *)v4 + 102) |= 0x200u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v4 + 64) = self->_itemType;
  *((_DWORD *)v4 + 102) |= 0x400000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 70) = self->_mediaType;
  *((_DWORD *)v4 + 102) |= 0x800000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_103:
  *((unsigned char *)v4 + 401) = self->_offline;
  *((_DWORD *)v4 + 102) |= 0x10000000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    *((void *)v4 + 11) = self->_persistentID;
    *((_DWORD *)v4 + 102) |= 0x400u;
  }
LABEL_23:
  if (self->_personalizedContainerID)
  {
    objc_msgSend(v13, "setPersonalizedContainerID:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    *((unsigned char *)v4 + 403) = self->_sBEnabled;
    *((_DWORD *)v4 + 102) |= 0x40000000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)v4 + 84) = self->_sourceType;
  *((_DWORD *)v4 + 102) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_28:
    *((void *)v4 + 15) = self->_storeAccountID;
    *((_DWORD *)v4 + 102) |= 0x4000u;
  }
LABEL_29:
  if (self->_storeID)
  {
    objc_msgSend(v13, "setStoreID:");
    id v4 = v13;
  }
  if (self->_timedMetadata)
  {
    objc_msgSend(v13, "setTimedMetadata:");
    id v4 = v13;
  }
  if (self->_trackInfo)
  {
    objc_msgSend(v13, "setTrackInfo:");
    id v4 = v13;
  }
  if (self->_recommendationData)
  {
    objc_msgSend(v13, "setRecommendationData:");
    id v4 = v13;
  }
  if (self->_storeFrontID)
  {
    objc_msgSend(v13, "setStoreFrontID:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 54) = self->_eventType;
    *((_DWORD *)v4 + 102) |= 0x200000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0) {
        goto LABEL_42;
      }
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  *((void *)v4 + 16) = self->_subscriptionAdamID;
  *((_DWORD *)v4 + 102) |= 0x8000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((void *)v4 + 12) = self->_purchasedAdamID;
  *((_DWORD *)v4 + 102) |= 0x800u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_111:
  *((void *)v4 + 13) = self->_radioAdamID;
  *((_DWORD *)v4 + 102) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_44:
    *((void *)v4 + 7) = self->_itemCloudID;
    *((_DWORD *)v4 + 102) |= 0x40u;
  }
LABEL_45:
  if (self->_lyricsID)
  {
    objc_msgSend(v13, "setLyricsID:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_containerAdamID;
    *((_DWORD *)v4 + 102) |= 4u;
  }
  if (self->_globalPlaylistID)
  {
    objc_msgSend(v13, "setGlobalPlaylistID:");
    id v4 = v13;
  }
  if (self->_stationHash)
  {
    objc_msgSend(v13, "setStationHash:");
    id v4 = v13;
  }
  if (self->_stationStringID)
  {
    objc_msgSend(v13, "setStationStringID:");
    id v4 = v13;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((void *)v4 + 14) = self->_stationID;
    *((_DWORD *)v4 + 102) |= 0x2000u;
  }
  if (self->_cloudAlbumID)
  {
    objc_msgSend(v13, "setCloudAlbumID:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v9 = self->_has;
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    *((void *)v4 + 2) = self->_cloudPlaylistID;
    *((_DWORD *)v4 + 102) |= 2u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    *((_DWORD *)v4 + 76) = self->_reasonHintType;
    *((_DWORD *)v4 + 102) |= 0x1000000u;
  }
  if (self->_buildVersion)
  {
    objc_msgSend(v13, "setBuildVersion:");
    id v4 = v13;
  }
  if (self->_playlistVersionHash)
  {
    objc_msgSend(v13, "setPlaylistVersionHash:");
    id v4 = v13;
  }
  if (self->_requestingBundleIdentifier)
  {
    objc_msgSend(v13, "setRequestingBundleIdentifier:");
    id v4 = v13;
  }
  if (self->_requestingBundleVersion)
  {
    objc_msgSend(v13, "setRequestingBundleVersion:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    *((void *)v4 + 4) = self->_equivalencySourceAdamID;
    *((_DWORD *)v4 + 102) |= 8u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x10000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_115;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  *((unsigned char *)v4 + 400) = self->_internalBuild;
  *((_DWORD *)v4 + 102) |= 0x8000000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x20000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_115:
  *((void *)v4 + 17) = self->_tvShowPurchasedAdamID;
  *((_DWORD *)v4 + 102) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_75:
    *((void *)v4 + 18) = self->_tvShowSubscriptionAdamID;
    *((_DWORD *)v4 + 102) |= 0x20000u;
  }
LABEL_76:
  if (self->_enqueuerProperties)
  {
    objc_msgSend(v13, "setEnqueuerProperties:");
    id v4 = v13;
  }
  if (self->_householdID)
  {
    objc_msgSend(v13, "setHouseholdID:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
    *((unsigned char *)v4 + 402) = self->_privateListeningEnabled;
    *((_DWORD *)v4 + 102) |= 0x20000000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x80000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v11 & 0x4000000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  *((unsigned char *)v4 + 404) = self->_siriInitiated;
  *((_DWORD *)v4 + 102) |= 0x80000000;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_83:
    *((_DWORD *)v4 + 94) = self->_systemReleaseType;
    *((_DWORD *)v4 + 102) |= 0x4000000u;
  }
LABEL_84:
  if (self->_eventTimeZoneName)
  {
    objc_msgSend(v13, "setEventTimeZoneName:");
    id v4 = v13;
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 48) = self->_displayType;
    *((_DWORD *)v4 + 102) |= 0x80000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  }
  if (*(unsigned char *)&v12)
  {
    *((void *)v4 + 1) = self->_characterDisplayedCount;
    *((_DWORD *)v4 + 102) |= 1u;
  }
  if (self->_lyricLanguage)
  {
    objc_msgSend(v13, "setLyricLanguage:");
    id v4 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_containerID copyWithZone:a3];
  $DE3EE0432C8889EE6FF627BF579DAD3F v7 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v6;

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_containerType;
    *(_DWORD *)(v5 + 408) |= 0x40000u;
  }
  uint64_t v8 = [(NSString *)self->_deviceName copyWithZone:a3];
  $DE3EE0432C8889EE6FF627BF579DAD3F v9 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v8;

  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_endReasonType;
    *(_DWORD *)(v5 + 408) |= 0x100000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 40) = self->_eventDateTimestamp;
  *(_DWORD *)(v5 + 408) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(double *)(v5 + 48) = self->_eventSecondsFromGMT;
    *(_DWORD *)(v5 + 408) |= 0x20u;
  }
LABEL_7:
  uint64_t v11 = [(NSString *)self->_externalID copyWithZone:a3];
  $DE3EE0432C8889EE6FF627BF579DAD3F v12 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v11;

  uint64_t v13 = [(NSString *)self->_featureName copyWithZone:a3];
  v14 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v13;

  $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_itemDuration;
    *(_DWORD *)(v5 + 408) |= 0x80u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x100) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v15 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v15 & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 72) = self->_itemEndTime;
  *(_DWORD *)(v5 + 408) |= 0x100u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&v15 & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 80) = self->_itemStartTime;
  *(_DWORD *)(v5 + 408) |= 0x200u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v15 & 0x800000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 256) = self->_itemType;
  *(_DWORD *)(v5 + 408) |= 0x400000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v15 & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 280) = self->_mediaType;
  *(_DWORD *)(v5 + 408) |= 0x800000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_55:
  *(unsigned char *)(v5 + 401) = self->_offline;
  *(_DWORD *)(v5 + 408) |= 0x10000000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    *(void *)(v5 + 88) = self->_persistentID;
    *(_DWORD *)(v5 + 408) |= 0x400u;
  }
LABEL_15:
  uint64_t v16 = [(NSString *)self->_personalizedContainerID copyWithZone:a3];
  v17 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v16;

  $DE3EE0432C8889EE6FF627BF579DAD3F v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000000) != 0)
  {
    *(unsigned char *)(v5 + 403) = self->_sBEnabled;
    *(_DWORD *)(v5 + 408) |= 0x40000000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x2000000) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v18 & 0x4000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x2000000) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 336) = self->_sourceType;
  *(_DWORD *)(v5 + 408) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *(void *)(v5 + 120) = self->_storeAccountID;
    *(_DWORD *)(v5 + 408) |= 0x4000u;
  }
LABEL_19:
  uint64_t v19 = [(NSString *)self->_storeID copyWithZone:a3];
  v20 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v19;

  uint64_t v21 = [(NSData *)self->_timedMetadata copyWithZone:a3];
  v22 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v21;

  uint64_t v23 = [(NSData *)self->_trackInfo copyWithZone:a3];
  v24 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v23;

  uint64_t v25 = [(NSData *)self->_recommendationData copyWithZone:a3];
  v26 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v25;

  uint64_t v27 = [(NSString *)self->_storeFrontID copyWithZone:a3];
  v28 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v27;

  $DE3EE0432C8889EE6FF627BF579DAD3F v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_eventType;
    *(_DWORD *)(v5 + 408) |= 0x200000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x8000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v29 & 0x800) == 0) {
        goto LABEL_22;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&v29 & 0x8000) == 0)
  {
    goto LABEL_21;
  }
  *(void *)(v5 + 128) = self->_subscriptionAdamID;
  *(_DWORD *)(v5 + 408) |= 0x8000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v29 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(void *)(v5 + 96) = self->_purchasedAdamID;
  *(_DWORD *)(v5 + 408) |= 0x800u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v29 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_63:
  *(void *)(v5 + 104) = self->_radioAdamID;
  *(_DWORD *)(v5 + 408) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *(void *)(v5 + 56) = self->_itemCloudID;
    *(_DWORD *)(v5 + 408) |= 0x40u;
  }
LABEL_25:
  uint64_t v30 = [(NSString *)self->_lyricsID copyWithZone:a3];
  v31 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v30;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_containerAdamID;
    *(_DWORD *)(v5 + 408) |= 4u;
  }
  uint64_t v32 = [(NSString *)self->_globalPlaylistID copyWithZone:a3];
  v33 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v32;

  uint64_t v34 = [(NSString *)self->_stationHash copyWithZone:a3];
  v35 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v34;

  uint64_t v36 = [(NSString *)self->_stationStringID copyWithZone:a3];
  v37 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v36;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(void *)(v5 + 112) = self->_stationID;
    *(_DWORD *)(v5 + 408) |= 0x2000u;
  }
  uint64_t v38 = [(NSString *)self->_cloudAlbumID copyWithZone:a3];
  v39 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v38;

  $DE3EE0432C8889EE6FF627BF579DAD3F v40 = self->_has;
  if ((*(unsigned char *)&v40 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_cloudPlaylistID;
    *(_DWORD *)(v5 + 408) |= 2u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_reasonHintType;
    *(_DWORD *)(v5 + 408) |= 0x1000000u;
  }
  uint64_t v41 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v42 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v41;

  uint64_t v43 = [(NSString *)self->_playlistVersionHash copyWithZone:a3];
  $DE3EE0432C8889EE6FF627BF579DAD3F v44 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v43;

  uint64_t v45 = [(NSString *)self->_requestingBundleIdentifier copyWithZone:a3];
  v46 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v45;

  uint64_t v47 = [(NSString *)self->_requestingBundleVersion copyWithZone:a3];
  v48 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v47;

  $DE3EE0432C8889EE6FF627BF579DAD3F v49 = self->_has;
  if ((*(unsigned char *)&v49 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_equivalencySourceAdamID;
    *(_DWORD *)(v5 + 408) |= 8u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v49 = self->_has;
    if ((*(_DWORD *)&v49 & 0x8000000) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v49 & 0x10000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v49 & 0x8000000) == 0)
  {
    goto LABEL_35;
  }
  *(unsigned char *)(v5 + 400) = self->_internalBuild;
  *(_DWORD *)(v5 + 408) |= 0x8000000u;
  $DE3EE0432C8889EE6FF627BF579DAD3F v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x10000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v49 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_67:
  *(void *)(v5 + 136) = self->_tvShowPurchasedAdamID;
  *(_DWORD *)(v5 + 408) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    *(void *)(v5 + 144) = self->_tvShowSubscriptionAdamID;
    *(_DWORD *)(v5 + 408) |= 0x20000u;
  }
LABEL_38:
  id v50 = [(SSVPBPlayActivityEnqueuerProperties *)self->_enqueuerProperties copyWithZone:a3];
  v51 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v50;

  uint64_t v52 = [(NSString *)self->_householdID copyWithZone:a3];
  v53 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v52;

  $DE3EE0432C8889EE6FF627BF579DAD3F v54 = self->_has;
  if ((*(_DWORD *)&v54 & 0x20000000) != 0)
  {
    *(unsigned char *)(v5 + 402) = self->_privateListeningEnabled;
    *(_DWORD *)(v5 + 408) |= 0x20000000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v54 = self->_has;
    if ((*(_DWORD *)&v54 & 0x80000000) == 0)
    {
LABEL_40:
      if ((*(_DWORD *)&v54 & 0x4000000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&v54 & 0x80000000) == 0)
  {
    goto LABEL_40;
  }
  *(unsigned char *)(v5 + 404) = self->_siriInitiated;
  *(_DWORD *)(v5 + 408) |= 0x80000000;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 376) = self->_systemReleaseType;
    *(_DWORD *)(v5 + 408) |= 0x4000000u;
  }
LABEL_42:
  uint64_t v55 = [(NSString *)self->_eventTimeZoneName copyWithZone:a3];
  v56 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v55;

  $DE3EE0432C8889EE6FF627BF579DAD3F v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_displayType;
    *(_DWORD *)(v5 + 408) |= 0x80000u;
    $DE3EE0432C8889EE6FF627BF579DAD3F v57 = self->_has;
  }
  if (*(unsigned char *)&v57)
  {
    *(void *)(v5 + 8) = self->_characterDisplayedCount;
    *(_DWORD *)(v5 + 408) |= 1u;
  }
  uint64_t v58 = [(NSString *)self->_lyricLanguage copyWithZone:a3];
  v59 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v58;

  id v60 = (id)v5;
  return v60;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_228;
  }
  containerID = self->_containerID;
  if ((unint64_t)containerID | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](containerID, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  int v7 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_containerType != *((_DWORD *)v4 + 44)) {
      goto LABEL_228;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_228;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_228;
    }
    $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  }
  int v9 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_endReasonType != *((_DWORD *)v4 + 49)) {
      goto LABEL_228;
    }
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_eventDateTimestamp != *((double *)v4 + 5)) {
      goto LABEL_228;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_228;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_eventSecondsFromGMT != *((double *)v4 + 6)) {
      goto LABEL_228;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_228;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((void *)v4 + 28)
    && !-[NSString isEqual:](externalID, "isEqual:"))
  {
    goto LABEL_228;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  int v13 = *((_DWORD *)v4 + 102);
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_itemDuration != *((double *)v4 + 8)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_itemEndTime != *((double *)v4 + 9)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_itemStartTime != *((double *)v4 + 10)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x400000) != 0)
  {
    if ((v13 & 0x400000) == 0 || self->_itemType != *((_DWORD *)v4 + 64)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x400000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    if ((v13 & 0x800000) == 0 || self->_mediaType != *((_DWORD *)v4 + 70)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x800000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x10000000) != 0)
  {
    if ((v13 & 0x10000000) == 0) {
      goto LABEL_228;
    }
    if (self->_offline)
    {
      if (!*((unsigned char *)v4 + 401)) {
        goto LABEL_228;
      }
    }
    else if (*((unsigned char *)v4 + 401))
    {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x10000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_persistentID != *((void *)v4 + 11)) {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_228;
  }
  personalizedContainerID = self->_personalizedContainerID;
  if ((unint64_t)personalizedContainerID | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](personalizedContainerID, "isEqual:")) {
      goto LABEL_228;
    }
    $DE3EE0432C8889EE6FF627BF579DAD3F v12 = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    if ((v15 & 0x40000000) == 0) {
      goto LABEL_228;
    }
    if (self->_sBEnabled)
    {
      if (!*((unsigned char *)v4 + 403)) {
        goto LABEL_228;
      }
    }
    else if (*((unsigned char *)v4 + 403))
    {
      goto LABEL_228;
    }
  }
  else if ((v15 & 0x40000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0 || self->_sourceType != *((_DWORD *)v4 + 84)) {
      goto LABEL_228;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_storeAccountID != *((void *)v4 + 15)) {
      goto LABEL_228;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_228;
  }
  storeID = self->_storeID;
  if ((unint64_t)storeID | *((void *)v4 + 46) && !-[NSString isEqual:](storeID, "isEqual:")) {
    goto LABEL_228;
  }
  timedMetadata = self->_timedMetadata;
  if ((unint64_t)timedMetadata | *((void *)v4 + 48))
  {
    if (!-[NSData isEqual:](timedMetadata, "isEqual:")) {
      goto LABEL_228;
    }
  }
  trackInfo = self->_trackInfo;
  if ((unint64_t)trackInfo | *((void *)v4 + 49))
  {
    if (!-[NSData isEqual:](trackInfo, "isEqual:")) {
      goto LABEL_228;
    }
  }
  recommendationData = self->_recommendationData;
  if ((unint64_t)recommendationData | *((void *)v4 + 39))
  {
    if (!-[NSData isEqual:](recommendationData, "isEqual:")) {
      goto LABEL_228;
    }
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v21 = self->_has;
  int v22 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v21 & 0x200000) != 0)
  {
    if ((v22 & 0x200000) == 0 || self->_eventType != *((_DWORD *)v4 + 54)) {
      goto LABEL_228;
    }
  }
  else if ((v22 & 0x200000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_subscriptionAdamID != *((void *)v4 + 16)) {
      goto LABEL_228;
    }
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x800) != 0)
  {
    if ((v22 & 0x800) == 0 || self->_purchasedAdamID != *((void *)v4 + 12)) {
      goto LABEL_228;
    }
  }
  else if ((v22 & 0x800) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x1000) != 0)
  {
    if ((v22 & 0x1000) == 0 || self->_radioAdamID != *((void *)v4 + 13)) {
      goto LABEL_228;
    }
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(unsigned char *)&v21 & 0x40) != 0)
  {
    if ((v22 & 0x40) == 0 || self->_itemCloudID != *((void *)v4 + 7)) {
      goto LABEL_228;
    }
  }
  else if ((v22 & 0x40) != 0)
  {
    goto LABEL_228;
  }
  lyricsID = self->_lyricsID;
  if ((unint64_t)lyricsID | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](lyricsID, "isEqual:")) {
      goto LABEL_228;
    }
    $DE3EE0432C8889EE6FF627BF579DAD3F v21 = self->_has;
  }
  int v24 = *((_DWORD *)v4 + 102);
  if ((*(unsigned char *)&v21 & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_containerAdamID != *((void *)v4 + 3)) {
      goto LABEL_228;
    }
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_228;
  }
  globalPlaylistID = self->_globalPlaylistID;
  if ((unint64_t)globalPlaylistID | *((void *)v4 + 30)
    && !-[NSString isEqual:](globalPlaylistID, "isEqual:"))
  {
    goto LABEL_228;
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](stationHash, "isEqual:")) {
      goto LABEL_228;
    }
  }
  stationStringID = self->_stationStringID;
  if ((unint64_t)stationStringID | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](stationStringID, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v28 = self->_has;
  int v29 = *((_DWORD *)v4 + 102);
  if ((*(_WORD *)&v28 & 0x2000) != 0)
  {
    if ((v29 & 0x2000) == 0 || self->_stationID != *((void *)v4 + 14)) {
      goto LABEL_228;
    }
  }
  else if ((v29 & 0x2000) != 0)
  {
    goto LABEL_228;
  }
  cloudAlbumID = self->_cloudAlbumID;
  if ((unint64_t)cloudAlbumID | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](cloudAlbumID, "isEqual:")) {
      goto LABEL_228;
    }
    $DE3EE0432C8889EE6FF627BF579DAD3F v28 = self->_has;
  }
  int v31 = *((_DWORD *)v4 + 102);
  if ((*(unsigned char *)&v28 & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_cloudPlaylistID != *((void *)v4 + 2)) {
      goto LABEL_228;
    }
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    if ((v31 & 0x1000000) == 0 || self->_reasonHintType != *((_DWORD *)v4 + 76)) {
      goto LABEL_228;
    }
  }
  else if ((v31 & 0x1000000) != 0)
  {
    goto LABEL_228;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 19)
    && !-[NSString isEqual:](buildVersion, "isEqual:"))
  {
    goto LABEL_228;
  }
  playlistVersionHash = self->_playlistVersionHash;
  if ((unint64_t)playlistVersionHash | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](playlistVersionHash, "isEqual:")) {
      goto LABEL_228;
    }
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if ((unint64_t)requestingBundleIdentifier | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](requestingBundleIdentifier, "isEqual:")) {
      goto LABEL_228;
    }
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if ((unint64_t)requestingBundleVersion | *((void *)v4 + 41))
  {
    if (!-[NSString isEqual:](requestingBundleVersion, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v36 = self->_has;
  int v37 = *((_DWORD *)v4 + 102);
  if ((*(unsigned char *)&v36 & 8) != 0)
  {
    if ((v37 & 8) == 0 || self->_equivalencySourceAdamID != *((void *)v4 + 4)) {
      goto LABEL_228;
    }
  }
  else if ((v37 & 8) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x8000000) != 0)
  {
    if ((v37 & 0x8000000) == 0) {
      goto LABEL_228;
    }
    if (self->_internalBuild)
    {
      if (!*((unsigned char *)v4 + 400)) {
        goto LABEL_228;
      }
    }
    else if (*((unsigned char *)v4 + 400))
    {
      goto LABEL_228;
    }
  }
  else if ((v37 & 0x8000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x10000) != 0)
  {
    if ((v37 & 0x10000) == 0 || self->_tvShowPurchasedAdamID != *((void *)v4 + 17)) {
      goto LABEL_228;
    }
  }
  else if ((v37 & 0x10000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x20000) != 0)
  {
    if ((v37 & 0x20000) == 0 || self->_tvShowSubscriptionAdamID != *((void *)v4 + 18)) {
      goto LABEL_228;
    }
  }
  else if ((v37 & 0x20000) != 0)
  {
    goto LABEL_228;
  }
  enqueuerProperties = self->_enqueuerProperties;
  if ((unint64_t)enqueuerProperties | *((void *)v4 + 25)
    && !-[SSVPBPlayActivityEnqueuerProperties isEqual:](enqueuerProperties, "isEqual:"))
  {
    goto LABEL_228;
  }
  householdID = self->_householdID;
  if ((unint64_t)householdID | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](householdID, "isEqual:")) {
      goto LABEL_228;
    }
  }
  $DE3EE0432C8889EE6FF627BF579DAD3F v40 = self->_has;
  int v41 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v40 & 0x20000000) != 0)
  {
    if ((v41 & 0x20000000) == 0) {
      goto LABEL_228;
    }
    if (self->_privateListeningEnabled)
    {
      if (!*((unsigned char *)v4 + 402)) {
        goto LABEL_228;
      }
    }
    else if (*((unsigned char *)v4 + 402))
    {
      goto LABEL_228;
    }
  }
  else if ((v41 & 0x20000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v40 & 0x80000000) != 0)
  {
    if ((v41 & 0x80000000) == 0) {
      goto LABEL_228;
    }
    if (self->_siriInitiated)
    {
      if (!*((unsigned char *)v4 + 404)) {
        goto LABEL_228;
      }
    }
    else if (*((unsigned char *)v4 + 404))
    {
      goto LABEL_228;
    }
  }
  else if (v41 < 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v40 & 0x4000000) != 0)
  {
    if ((v41 & 0x4000000) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 94)) {
      goto LABEL_228;
    }
  }
  else if ((v41 & 0x4000000) != 0)
  {
    goto LABEL_228;
  }
  eventTimeZoneName = self->_eventTimeZoneName;
  if ((unint64_t)eventTimeZoneName | *((void *)v4 + 26))
  {
    if (-[NSString isEqual:](eventTimeZoneName, "isEqual:"))
    {
      $DE3EE0432C8889EE6FF627BF579DAD3F v40 = self->_has;
      goto LABEL_214;
    }
LABEL_228:
    char v45 = 0;
    goto LABEL_229;
  }
LABEL_214:
  int v43 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v40 & 0x80000) != 0)
  {
    if ((v43 & 0x80000) == 0 || self->_displayType != *((_DWORD *)v4 + 48)) {
      goto LABEL_228;
    }
  }
  else if ((v43 & 0x80000) != 0)
  {
    goto LABEL_228;
  }
  if (*(unsigned char *)&v40)
  {
    if ((v43 & 1) == 0 || self->_characterDisplayedCount != *((void *)v4 + 1)) {
      goto LABEL_228;
    }
  }
  else if (v43)
  {
    goto LABEL_228;
  }
  lyricLanguage = self->_lyricLanguage;
  if ((unint64_t)lyricLanguage | *((void *)v4 + 33)) {
    char v45 = -[NSString isEqual:](lyricLanguage, "isEqual:");
  }
  else {
    char v45 = 1;
  }
LABEL_229:

  return v45;
}

- (unint64_t)hash
{
  NSUInteger v88 = [(NSString *)self->_containerID hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v87 = 2654435761 * self->_containerType;
  }
  else {
    uint64_t v87 = 0;
  }
  NSUInteger v86 = [(NSString *)self->_deviceName hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v85 = 2654435761 * self->_endReasonType;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v85 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double eventDateTimestamp = self->_eventDateTimestamp;
  double v5 = -eventDateTimestamp;
  if (eventDateTimestamp >= 0.0) {
    double v5 = self->_eventDateTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  unint64_t v84 = v8;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double eventSecondsFromGMT = self->_eventSecondsFromGMT;
    double v11 = -eventSecondsFromGMT;
    if (eventSecondsFromGMT >= 0.0) {
      double v11 = self->_eventSecondsFromGMT;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v83 = v9;
  NSUInteger v82 = [(NSString *)self->_externalID hash];
  NSUInteger v81 = [(NSString *)self->_featureName hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    double itemDuration = self->_itemDuration;
    double v17 = -itemDuration;
    if (itemDuration >= 0.0) {
      double v17 = self->_itemDuration;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    double itemEndTime = self->_itemEndTime;
    double v22 = -itemEndTime;
    if (itemEndTime >= 0.0) {
      double v22 = self->_itemEndTime;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    double itemStartTime = self->_itemStartTime;
    double v26 = -itemStartTime;
    if (itemStartTime >= 0.0) {
      double v26 = self->_itemStartTime;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v29 += (unint64_t)v28;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v28);
    }
    unint64_t v80 = v29;
    if ((*(_DWORD *)&v14 & 0x400000) != 0)
    {
LABEL_40:
      uint64_t v79 = 2654435761 * self->_itemType;
      if ((*(_DWORD *)&v14 & 0x800000) != 0) {
        goto LABEL_41;
      }
      goto LABEL_52;
    }
  }
  else
  {
    unint64_t v80 = 0;
    if ((*(_DWORD *)&v14 & 0x400000) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v79 = 0;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
LABEL_41:
    uint64_t v78 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&v14 & 0x10000000) != 0) {
      goto LABEL_42;
    }
LABEL_53:
    uint64_t v77 = 0;
    if ((*(_WORD *)&v14 & 0x400) != 0) {
      goto LABEL_43;
    }
    goto LABEL_54;
  }
LABEL_52:
  uint64_t v78 = 0;
  if ((*(_DWORD *)&v14 & 0x10000000) == 0) {
    goto LABEL_53;
  }
LABEL_42:
  uint64_t v77 = 2654435761 * self->_offline;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
LABEL_43:
    uint64_t v76 = 2654435761 * self->_persistentID;
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v76 = 0;
LABEL_55:
  NSUInteger v75 = [(NSString *)self->_personalizedContainerID hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000000) == 0)
  {
    uint64_t v74 = 0;
    if ((*(_DWORD *)&v30 & 0x2000000) != 0) {
      goto LABEL_57;
    }
LABEL_60:
    uint64_t v73 = 0;
    if ((*(_WORD *)&v30 & 0x4000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_61;
  }
  uint64_t v74 = 2654435761 * self->_sBEnabled;
  if ((*(_DWORD *)&v30 & 0x2000000) == 0) {
    goto LABEL_60;
  }
LABEL_57:
  uint64_t v73 = 2654435761 * self->_sourceType;
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
LABEL_58:
    unint64_t v72 = 2654435761u * self->_storeAccountID;
    goto LABEL_62;
  }
LABEL_61:
  unint64_t v72 = 0;
LABEL_62:
  NSUInteger v71 = [(NSString *)self->_storeID hash];
  uint64_t v70 = [(NSData *)self->_timedMetadata hash];
  uint64_t v69 = [(NSData *)self->_trackInfo hash];
  uint64_t v68 = [(NSData *)self->_recommendationData hash];
  NSUInteger v67 = [(NSString *)self->_storeFrontID hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    uint64_t v66 = 2654435761 * self->_eventType;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
    {
LABEL_64:
      uint64_t v65 = 2654435761 * self->_subscriptionAdamID;
      if ((*(_WORD *)&v31 & 0x800) != 0) {
        goto LABEL_65;
      }
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v66 = 0;
    if ((*(_WORD *)&v31 & 0x8000) != 0) {
      goto LABEL_64;
    }
  }
  uint64_t v65 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_65:
    uint64_t v64 = 2654435761 * self->_purchasedAdamID;
    if ((*(_WORD *)&v31 & 0x1000) != 0) {
      goto LABEL_66;
    }
LABEL_71:
    uint64_t v63 = 0;
    if ((*(unsigned char *)&v31 & 0x40) != 0) {
      goto LABEL_67;
    }
    goto LABEL_72;
  }
LABEL_70:
  uint64_t v64 = 0;
  if ((*(_WORD *)&v31 & 0x1000) == 0) {
    goto LABEL_71;
  }
LABEL_66:
  uint64_t v63 = 2654435761 * self->_radioAdamID;
  if ((*(unsigned char *)&v31 & 0x40) != 0)
  {
LABEL_67:
    unint64_t v62 = 2654435761u * self->_itemCloudID;
    goto LABEL_73;
  }
LABEL_72:
  unint64_t v62 = 0;
LABEL_73:
  NSUInteger v61 = [(NSString *)self->_lyricsID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v60 = 2654435761 * self->_containerAdamID;
  }
  else {
    uint64_t v60 = 0;
  }
  NSUInteger v59 = [(NSString *)self->_globalPlaylistID hash];
  NSUInteger v58 = [(NSString *)self->_stationHash hash];
  NSUInteger v57 = [(NSString *)self->_stationStringID hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v56 = 2654435761 * self->_stationID;
  }
  else {
    uint64_t v56 = 0;
  }
  NSUInteger v55 = [(NSString *)self->_cloudAlbumID hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v32 = self->_has;
  if ((*(unsigned char *)&v32 & 2) != 0)
  {
    unint64_t v54 = 2654435761u * self->_cloudPlaylistID;
    if ((*(_DWORD *)&v32 & 0x1000000) != 0) {
      goto LABEL_81;
    }
  }
  else
  {
    unint64_t v54 = 0;
    if ((*(_DWORD *)&v32 & 0x1000000) != 0)
    {
LABEL_81:
      uint64_t v53 = 2654435761 * self->_reasonHintType;
      goto LABEL_84;
    }
  }
  uint64_t v53 = 0;
LABEL_84:
  NSUInteger v52 = [(NSString *)self->_buildVersion hash];
  NSUInteger v51 = [(NSString *)self->_playlistVersionHash hash];
  NSUInteger v50 = [(NSString *)self->_requestingBundleIdentifier hash];
  NSUInteger v49 = [(NSString *)self->_requestingBundleVersion hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v33 = self->_has;
  if ((*(unsigned char *)&v33 & 8) != 0)
  {
    uint64_t v48 = 2654435761 * self->_equivalencySourceAdamID;
    if ((*(_DWORD *)&v33 & 0x8000000) != 0)
    {
LABEL_86:
      uint64_t v47 = 2654435761 * self->_internalBuild;
      if ((*(_DWORD *)&v33 & 0x10000) != 0) {
        goto LABEL_87;
      }
LABEL_91:
      uint64_t v46 = 0;
      if ((*(_DWORD *)&v33 & 0x20000) != 0) {
        goto LABEL_88;
      }
      goto LABEL_92;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if ((*(_DWORD *)&v33 & 0x8000000) != 0) {
      goto LABEL_86;
    }
  }
  uint64_t v47 = 0;
  if ((*(_DWORD *)&v33 & 0x10000) == 0) {
    goto LABEL_91;
  }
LABEL_87:
  uint64_t v46 = 2654435761 * self->_tvShowPurchasedAdamID;
  if ((*(_DWORD *)&v33 & 0x20000) != 0)
  {
LABEL_88:
    uint64_t v45 = 2654435761 * self->_tvShowSubscriptionAdamID;
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v45 = 0;
LABEL_93:
  unint64_t v34 = [(SSVPBPlayActivityEnqueuerProperties *)self->_enqueuerProperties hash];
  NSUInteger v35 = [(NSString *)self->_householdID hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x20000000) == 0)
  {
    uint64_t v37 = 0;
    if ((*(_DWORD *)&v36 & 0x80000000) != 0) {
      goto LABEL_95;
    }
LABEL_98:
    uint64_t v38 = 0;
    if ((*(_DWORD *)&v36 & 0x4000000) != 0) {
      goto LABEL_96;
    }
    goto LABEL_99;
  }
  uint64_t v37 = 2654435761 * self->_privateListeningEnabled;
  if ((*(_DWORD *)&v36 & 0x80000000) == 0) {
    goto LABEL_98;
  }
LABEL_95:
  uint64_t v38 = 2654435761 * self->_siriInitiated;
  if ((*(_DWORD *)&v36 & 0x4000000) != 0)
  {
LABEL_96:
    uint64_t v39 = 2654435761 * self->_systemReleaseType;
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v39 = 0;
LABEL_100:
  NSUInteger v40 = [(NSString *)self->_eventTimeZoneName hash];
  $DE3EE0432C8889EE6FF627BF579DAD3F v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x80000) != 0)
  {
    uint64_t v42 = 2654435761 * self->_displayType;
    if (*(unsigned char *)&v41) {
      goto LABEL_102;
    }
LABEL_104:
    uint64_t v43 = 0;
    return v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v15 ^ v20 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v34 ^ v35 ^ v37 ^ v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ [(NSString *)self->_lyricLanguage hash];
  }
  uint64_t v42 = 0;
  if ((*(unsigned char *)&v41 & 1) == 0) {
    goto LABEL_104;
  }
LABEL_102:
  uint64_t v43 = 2654435761 * self->_characterDisplayedCount;
  return v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v15 ^ v20 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v34 ^ v35 ^ v37 ^ v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ [(NSString *)self->_lyricLanguage hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (*((void *)v4 + 21))
  {
    -[SSVPBPlayActivityEvent setContainerID:](self, "setContainerID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)v4 + 410) & 4) != 0)
  {
    self->_uint64_t containerType = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((void *)v4 + 23))
  {
    -[SSVPBPlayActivityEvent setDeviceName:](self, "setDeviceName:");
    id v4 = v15;
  }
  int v5 = *((_DWORD *)v4 + 102);
  if ((v5 & 0x100000) != 0)
  {
    self->_uint64_t endReasonType = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v5 = *((_DWORD *)v4 + 102);
    if ((v5 & 0x10) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  self->_double eventDateTimestamp = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_10:
    self->_double eventSecondsFromGMT = *((double *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_11:
  if (*((void *)v4 + 28))
  {
    -[SSVPBPlayActivityEvent setExternalID:](self, "setExternalID:");
    id v4 = v15;
  }
  if (*((void *)v4 + 29))
  {
    -[SSVPBPlayActivityEvent setFeatureName:](self, "setFeatureName:");
    id v4 = v15;
  }
  int v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x80) != 0)
  {
    self->_double itemDuration = *((double *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    int v6 = *((_DWORD *)v4 + 102);
    if ((v6 & 0x100) == 0)
    {
LABEL_17:
      if ((v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  self->_double itemEndTime = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x200) == 0)
  {
LABEL_18:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_double itemStartTime = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_uint64_t itemType = *((_DWORD *)v4 + 64);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_int mediaType = *((_DWORD *)v4 + 70);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_87:
  self->_offline = *((unsigned char *)v4 + 401);
  *(_DWORD *)&self->_has |= 0x10000000u;
  if ((*((_DWORD *)v4 + 102) & 0x400) != 0)
  {
LABEL_22:
    self->_persistentID = *((void *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_23:
  if (*((void *)v4 + 36))
  {
    -[SSVPBPlayActivityEvent setPersonalizedContainerID:](self, "setPersonalizedContainerID:");
    id v4 = v15;
  }
  int v7 = *((_DWORD *)v4 + 102);
  if ((v7 & 0x40000000) != 0)
  {
    self->_sBEnabled = *((unsigned char *)v4 + 403);
    *(_DWORD *)&self->_has |= 0x40000000u;
    int v7 = *((_DWORD *)v4 + 102);
    if ((v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  self->_uint64_t sourceType = *((_DWORD *)v4 + 84);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 102) & 0x4000) != 0)
  {
LABEL_28:
    self->_storeAccountID = *((void *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_29:
  if (*((void *)v4 + 46))
  {
    -[SSVPBPlayActivityEvent setStoreID:](self, "setStoreID:");
    id v4 = v15;
  }
  if (*((void *)v4 + 48))
  {
    -[SSVPBPlayActivityEvent setTimedMetadata:](self, "setTimedMetadata:");
    id v4 = v15;
  }
  if (*((void *)v4 + 49))
  {
    -[SSVPBPlayActivityEvent setTrackInfo:](self, "setTrackInfo:");
    id v4 = v15;
  }
  if (*((void *)v4 + 39))
  {
    -[SSVPBPlayActivityEvent setRecommendationData:](self, "setRecommendationData:");
    id v4 = v15;
  }
  if (*((void *)v4 + 45))
  {
    -[SSVPBPlayActivityEvent setStoreFrontID:](self, "setStoreFrontID:");
    id v4 = v15;
  }
  int v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x200000) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 54);
    *(_DWORD *)&self->_has |= 0x200000u;
    int v8 = *((_DWORD *)v4 + 102);
    if ((v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((v8 & 0x800) == 0) {
        goto LABEL_42;
      }
      goto LABEL_94;
    }
  }
  else if ((v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  self->_subscriptionAdamID = *((void *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x800) == 0)
  {
LABEL_42:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_purchasedAdamID = *((void *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_95:
  self->_radioAdamID = *((void *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 102) & 0x40) != 0)
  {
LABEL_44:
    self->_itemCloudID = *((void *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_45:
  if (*((void *)v4 + 34))
  {
    -[SSVPBPlayActivityEvent setLyricsID:](self, "setLyricsID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)v4 + 408) & 4) != 0)
  {
    self->_containerAdamID = *((void *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 30))
  {
    -[SSVPBPlayActivityEvent setGlobalPlaylistID:](self, "setGlobalPlaylistID:");
    id v4 = v15;
  }
  if (*((void *)v4 + 43))
  {
    -[SSVPBPlayActivityEvent setStationHash:](self, "setStationHash:");
    id v4 = v15;
  }
  if (*((void *)v4 + 44))
  {
    -[SSVPBPlayActivityEvent setStationStringID:](self, "setStationStringID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)v4 + 409) & 0x20) != 0)
  {
    self->_stationID = *((void *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 20))
  {
    -[SSVPBPlayActivityEvent setCloudAlbumID:](self, "setCloudAlbumID:");
    id v4 = v15;
  }
  int v9 = *((_DWORD *)v4 + 102);
  if ((v9 & 2) != 0)
  {
    self->_cloudPlaylistID = *((void *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v9 = *((_DWORD *)v4 + 102);
  }
  if ((v9 & 0x1000000) != 0)
  {
    self->_int reasonHintType = *((_DWORD *)v4 + 76);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((void *)v4 + 19))
  {
    -[SSVPBPlayActivityEvent setBuildVersion:](self, "setBuildVersion:");
    id v4 = v15;
  }
  if (*((void *)v4 + 37))
  {
    -[SSVPBPlayActivityEvent setPlaylistVersionHash:](self, "setPlaylistVersionHash:");
    id v4 = v15;
  }
  if (*((void *)v4 + 40))
  {
    -[SSVPBPlayActivityEvent setRequestingBundleIdentifier:](self, "setRequestingBundleIdentifier:");
    id v4 = v15;
  }
  if (*((void *)v4 + 41))
  {
    -[SSVPBPlayActivityEvent setRequestingBundleVersion:](self, "setRequestingBundleVersion:");
    id v4 = v15;
  }
  int v10 = *((_DWORD *)v4 + 102);
  if ((v10 & 8) != 0)
  {
    self->_equivalencySourceAdamID = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v10 = *((_DWORD *)v4 + 102);
    if ((v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((v10 & 0x10000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  self->_internalBuild = *((unsigned char *)v4 + 400);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v10 = *((_DWORD *)v4 + 102);
  if ((v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_99:
  self->_tvShowPurchasedAdamID = *((void *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 102) & 0x20000) != 0)
  {
LABEL_75:
    self->_tvShowSubscriptionAdamID = *((void *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_76:
  enqueuerProperties = self->_enqueuerProperties;
  uint64_t v12 = *((void *)v4 + 25);
  if (enqueuerProperties)
  {
    if (!v12) {
      goto LABEL_104;
    }
    -[SSVPBPlayActivityEnqueuerProperties mergeFrom:](enqueuerProperties, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_104;
    }
    -[SSVPBPlayActivityEvent setEnqueuerProperties:](self, "setEnqueuerProperties:");
  }
  id v4 = v15;
LABEL_104:
  if (*((void *)v4 + 31))
  {
    -[SSVPBPlayActivityEvent setHouseholdID:](self, "setHouseholdID:");
    id v4 = v15;
  }
  int v13 = *((_DWORD *)v4 + 102);
  if ((v13 & 0x20000000) != 0)
  {
    self->_privateListeningEnabled = *((unsigned char *)v4 + 402);
    *(_DWORD *)&self->_has |= 0x20000000u;
    int v13 = *((_DWORD *)v4 + 102);
    if ((v13 & 0x80000000) == 0)
    {
LABEL_108:
      if ((v13 & 0x4000000) == 0) {
        goto LABEL_110;
      }
      goto LABEL_109;
    }
  }
  else if ((v13 & 0x80000000) == 0)
  {
    goto LABEL_108;
  }
  self->_siriInitiated = *((unsigned char *)v4 + 404);
  *(_DWORD *)&self->_has |= 0x80000000;
  if ((*((_DWORD *)v4 + 102) & 0x4000000) != 0)
  {
LABEL_109:
    self->_uint64_t systemReleaseType = *((_DWORD *)v4 + 94);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_110:
  if (*((void *)v4 + 26))
  {
    -[SSVPBPlayActivityEvent setEventTimeZoneName:](self, "setEventTimeZoneName:");
    id v4 = v15;
  }
  int v14 = *((_DWORD *)v4 + 102);
  if ((v14 & 0x80000) != 0)
  {
    self->_uint64_t displayType = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v14 = *((_DWORD *)v4 + 102);
  }
  if (v14)
  {
    self->_characterDisplayedCount = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 33))
  {
    -[SSVPBPlayActivityEvent setLyricLanguage:](self, "setLyricLanguage:");
    id v4 = v15;
  }
}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (int64_t)purchasedAdamID
{
  return self->_purchasedAdamID;
}

- (int64_t)radioAdamID
{
  return self->_radioAdamID;
}

- (unint64_t)itemCloudID
{
  return self->_itemCloudID;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsID:(id)a3
{
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (int64_t)containerAdamID
{
  return self->_containerAdamID;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setStationHash:(id)a3
{
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationStringID:(id)a3
{
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

- (void)setCloudAlbumID:(id)a3
{
}

- (unint64_t)cloudPlaylistID
{
  return self->_cloudPlaylistID;
}

- (NSString)playlistVersionHash
{
  return self->_playlistVersionHash;
}

- (void)setPlaylistVersionHash:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (double)eventDateTimestamp
{
  return self->_eventDateTimestamp;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (double)itemDuration
{
  return self->_itemDuration;
}

- (double)itemEndTime
{
  return self->_itemEndTime;
}

- (double)itemStartTime
{
  return self->_itemStartTime;
}

- (BOOL)offline
{
  return self->_offline;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (BOOL)sBEnabled
{
  return self->_sBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSData)timedMetadata
{
  return self->_timedMetadata;
}

- (void)setTimedMetadata:(id)a3
{
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (void)setTrackInfo:(id)a3
{
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreFrontID:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleVersion:(id)a3
{
}

- (SSVPBPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (void)setEnqueuerProperties:(id)a3
{
}

- (NSString)householdID
{
  return self->_householdID;
}

- (void)setHouseholdID:(id)a3
{
}

- (BOOL)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (BOOL)siriInitiated
{
  return self->_siriInitiated;
}

- (NSString)eventTimeZoneName
{
  return self->_eventTimeZoneName;
}

- (void)setEventTimeZoneName:(id)a3
{
}

- (int64_t)characterDisplayedCount
{
  return self->_characterDisplayedCount;
}

- (NSString)lyricLanguage
{
  return self->_lyricLanguage;
}

- (void)setLyricLanguage:(id)a3
{
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (NSString)personalizedContainerID
{
  return self->_personalizedContainerID;
}

- (void)setPersonalizedContainerID:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (int64_t)tvShowPurchasedAdamID
{
  return self->_tvShowPurchasedAdamID;
}

- (int64_t)tvShowSubscriptionAdamID
{
  return self->_tvShowSubscriptionAdamID;
}

- (BOOL)internalBuild
{
  return self->_internalBuild;
}

- (double)eventSecondsFromGMT
{
  return self->_eventSecondsFromGMT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_lyricLanguage, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZoneName, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end